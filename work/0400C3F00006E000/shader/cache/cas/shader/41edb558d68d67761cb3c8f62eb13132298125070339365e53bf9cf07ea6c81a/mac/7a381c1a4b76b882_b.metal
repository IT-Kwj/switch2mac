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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_55 [[user(locn2)]];
    float4 m_109 [[user(locn3)]];
    float4 m_53 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_101 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_75 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_95 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_107 [[user(locn14)]];
    float4 m_103 [[user(locn15)]];
    float4 m_105 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_99 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_50 [[attribute(7)]];
    float4 m_89 [[attribute(8)]];
    float4 m_87 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_91 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5192 = false;
    bool _4273 = false;
    bool _714 = false;
    bool _528 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_48.w;
    float _125 = in.m_50.w;
    float _127 = trunc(_123);
    int _130 = int(_127);
    float _132 = -_125;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _134;
    bool _138 = _130 >= 1;
    float _140 = 0.0;
    float _142 = _125;
    float _144 = _134;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _140;
    if (!_138)
    {
        out.m_55.x = 0.0;
    }
    int _148 = 0;
    if (!_138)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    int _154 = _152;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5502 = as_type<float>(_152);
        out.gl_Position.z = _5502;
    }
    if (!_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _156 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_125);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = float(_130);
    bool _168 = _134 >= _166;
    bool _170 = !_164;
    bool _172 = _168 || _170;
    float _174 = 1.0 / _166;
    if (_172)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _142;
    if (_172)
    {
        out.m_55.x = 0.0;
    }
    float _178 = _134 * _174;
    float _180 = _178;
    if (_172)
    {
        float _182 = _176 * 5.0;
        _154 = as_type<int>(_182);
    }
    int _184 = _154;
    out.m_53.x = _178;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5565 = as_type<float>(_184);
        out.gl_Position.z = _5565;
    }
    if (_172)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = _188 * _196;
    float _214 = _188 * _202;
    float _216 = fma(_186, _194, _212);
    float _218 = _188 * _208;
    float _220 = fma(_186, _200, _214);
    float _222 = fma(_190, _198, _216);
    float _224 = fma(_186, _206, _218);
    float _226 = fma(_190, _204, _220);
    float _228 = fma(_190, _210, _224);
    bool _230 = !_192;
    float _232 = _228;
    float _250;
    if (!_230)
    {
        float _234 = in.m_65.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        _250 = _178;
    }
    _252 = false;
    float _254 = _250;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = _254 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = _254 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _254 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = 1.0 / _274;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _278;
    bool _290 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_254);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = 1.0 / _270;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _254 + _304;
    float _308 = _306 * _284;
    bool _310 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _312 = isnan(_254);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _282;
    float _324 = _258 * _288;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = _262 * _302;
    bool _336 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_254);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_320;
    float _350 = _348 + 1.0;
    float _352 = fma(_332, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = fma(_328, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _346 * _350;
    float _358 = -_346;
    float _360 = _358 + 1.0;
    float _362 = _266 * _322;
    bool _364 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_254);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    bool _380 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_254);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = fma(_378, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_374;
    float _400 = _398 + 1.0;
    float _402 = _374 * _360;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = _300 * _400;
    float _414 = -_300;
    float _416 = _414 + 1.0;
    float _418 = fma(_394, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_406, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = _390 * _416;
    float _426 = -_390;
    float _428 = _426 + 1.0;
    float _430 = _352 * _424;
    float _432 = _354 * _424;
    float _434 = _396 * _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].x, _430);
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].y, _432);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].z, _434);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _450;
    float _454 = fma(_418, _412, _440);
    float _456 = fma(_420, _412, _442);
    float _458 = fma(_422, _412, _444);
    float _460 = fma(_438, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _462 = fma(_448, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_452, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _478 = fma(_460, _402, _454);
    float _480 = fma(_468, _308, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _482 = fma(_472, _308, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _484 = fma(_476, _308, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _486 = fma(_462, _402, _456);
    float _488 = fma(_464, _402, _458);
    float _490 = fma(_480, _356, _478);
    float _492 = fma(_482, _356, _486);
    float _494 = fma(_484, _356, _488);
    float _496 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].x, _490);
    float _498 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].y, _492);
    float _500 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].z, _494);
    bool _502 = !_286;
    int _504 = as_type<int>(_500);
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _508 = _334;
    float _526;
    if (!_502)
    {
        float _510 = in.m_65.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        _526 = _178;
    }
    _528 = false;
    float _530 = _526;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _530 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _546 = isnan(_530);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _562 = isnan(_530);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _538;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_554;
    float _580 = _578 + 1.0;
    bool _582 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _584 = isnan(_530);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = 1.0 / _542;
    float _598 = 1.0 / _558;
    float _600 = _576 * _572;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = _570 * _580;
    float _608 = -_570;
    float _610 = _608 + 1.0;
    float _612 = fma(_600, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _614;
    float _618 = _592 * _610;
    float _620 = _604 * _596;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _624 = _530 + _622;
    bool _626 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _628 = isnan(_530);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _612 * _618;
    float _640 = -_592;
    float _642 = _640 + 1.0;
    float _644 = fma(_620, _624, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _648 = _530 + _646;
    float _650 = _616 * _598;
    float _652 = -_636;
    float _654 = _652 + 1.0;
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[115].x, _638);
    float _658 = in.m_67.x;
    float _660 = in.m_67.y;
    float _662 = in.m_67.z;
    float _664 = fma(_650, _648, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _666 = _554 * _654;
    float _668 = fma(_644, _606, _656);
    float _670 = fma(_664, _666, _668);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _674 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[118].x, _670);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _680 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _682 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _680;
    out.m_69.y = _684;
    out.m_69.z = _686;
    out.m_69.w = _682;
    float _688 = _500 * _662;
    float _690 = _498 * _660;
    float _692 = _496 * _658;
    bool _694 = !_594;
    float _712;
    if (!_694)
    {
        float _696 = in.m_65.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _178;
    }
    _714 = false;
    float _716 = _712;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _720 = _716 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _728 = isnan(_716);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _742 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _744 = isnan(_716);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _754;
    bool _758 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _760 = isnan(_716);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = 1.0 / _724;
    float _772 = -_736;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _716 + _776;
    bool _780 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _782 = 1.0 / _740;
    float _784 = _756 * _770;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _790 = -_768;
    float _792 = _790 + 1.0;
    float _794 = fma(_784, _720, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _796 = _752 * _774;
    float _798 = -_752;
    float _800 = _798 + 1.0;
    float _802 = _736 * _792;
    float _804 = _788 * _782;
    float _806 = _794 * _796;
    float _808 = fma(_804, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[131].x, _806);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _814 = fma(_808, _802, _810);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _818 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[133].x, _814);
    float _824 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _824;
    out.m_71.y = _826;
    out.m_71.z = _818;
    out.m_71.w = _828;
    bool _830 = !_780;
    if (!_830)
    {
        float _832 = in.m_65.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _180 = _846;
    }
    float _848 = _180;
    float _850 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _852 = int(_850);
    float _854 = in.m_65.y;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _858 = _856 != 0;
    float _860 = in.m_73.x;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _864 = _862 != 0;
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _868 = int(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _872 = _870 != 0;
    float _874 = in.m_65.w;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _880 = _878 != 0;
    float _882 = float(_852);
    float _884 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _886 = int(_884);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _890 = _888 != 0;
    float _892 = 0.0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_864)
    {
        _892 = 1.0;
    }
    float _896 = _892;
    float _898 = _828;
    float _900 = _896;
    if (_858)
    {
        float _902 = in.m_65.x;
        _898 = _902;
    }
    float _904 = _898;
    float _906 = 0.0;
    if (_864)
    {
        _906 = 1.0;
    }
    float _908 = _906;
    float _910 = float(_868);
    float _912 = 1.0 / _882;
    int _914 = 0;
    float _916 = _908;
    if (_864)
    {
        _914 = 0;
    }
    int _918 = _914;
    int _920 = _918;
    if (_864)
    {
        _894 = 0;
    }
    int _922 = _894;
    float _924 = 0.0;
    int _926 = _922;
    float _928 = _860;
    if (!_858)
    {
        _924 = _860;
    }
    float _930 = _924;
    float _932 = _736;
    float _934 = _930;
    if (_872)
    {
        float _936 = in.m_65.z;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = 0.0;
    if (!_872)
    {
        _940 = _860;
    }
    float _942 = _940;
    float _944 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _946 = int(_944);
    int _948 = ~_886;
    int _950 = _948 + 1;
    float _952 = _942;
    if (_872)
    {
        float _954 = -_860;
        float _956 = _954 + 1.0;
        _504 = as_type<int>(_956);
    }
    int _958 = _504;
    bool _960 = _874 > 0.5;
    float _962 = _912 * _134;
    float _964 = 1.0 / _910;
    bool _966 = false;
    float _968 = _874;
    if (_858)
    {
        bool _970 = _904 > 0.5;
        _966 = _970;
    }
    bool _972 = _966;
    float _974 = float(_946);
    float _976 = trunc(_962);
    int _978 = int(_976);
    float _980 = float(uint(_886));
    float _982 = as_type<float>(_946);
    int _984 = as_type<int>(_974);
    if (_864)
    {
        float _986 = in.m_65.x;
        _982 = _986;
    }
    float _988 = _982;
    bool _990 = false;
    float _992 = _938;
    if (_872)
    {
        bool _994 = _938 > 0.5;
        _990 = _994;
    }
    bool _996 = _990;
    float _998 = 1.0 / _980;
    float _1000 = _964 * _134;
    float _1002 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1004 = int(_1002);
    float _1006 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = float(uint(_978));
    float _1010 = fma(_1006, -2.0, _876);
    float _1012 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1014 = int(_1012);
    int _1016 = as_type<int>(_998) + (-2);
    float _1018 = _1008;
    float _1020 = _988;
    if (_864)
    {
        _968 = _988;
    }
    float _1022 = _968;
    float _1024 = as_type<float>(_1016) * _1008;
    float _1026 = _1022;
    if (_864)
    {
        _1018 = _854;
    }
    float _1028 = _1018;
    float _1030 = trunc(_1000);
    int _1032 = int(_1030);
    float _1034 = float(uint(_1004));
    float _1036 = _1028;
    if (_864)
    {
        _992 = _1022;
    }
    float _1038 = _992;
    float _1040 = float(uint(_1014));
    float _1042 = 1.0 / _1034;
    float _1044 = 1.0 / _1040;
    float _1046 = trunc(_1024);
    float _1048 = precise::max(_1046, 0.0);
    uint _1051 = uint(_1048);
    float _1053 = 1.0 / _974;
    float _1055 = _1038;
    if (_858)
    {
        float _1057 = -_860;
        float _1059 = _1057 + 1.0;
        _984 = as_type<int>(_1059);
    }
    int _1061 = _984;
    float _1063 = as_type<float>(_1061);
    if (_858)
    {
        float _1065 = _972 ? as_type<float>(_1061) : _860;
        _934 = _1065;
    }
    float _1067 = _934;
    if (_864)
    {
        _1063 = _1022;
    }
    float _1069 = _1063;
    float _1071 = _1069;
    if (!_864)
    {
        float _1073 = in.m_65.x;
        float _1075 = _854 * 3.1415927410125732421875;
        float _1077 = in.m_65.z;
        float _1079 = _1075 * 0.15915493667125701904296875;
        float _1081 = _1079 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1073 * 3.1415927410125732421875;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = _1087 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        _1020 = _1073;
        _900 = 7.345489978790283203125;
        _1071 = _1077;
        _916 = 5.839270114898681640625;
        _1036 = _1083;
        _1026 = _854;
        _1055 = _1091;
        _920 = 1;
        _926 = 2;
    }
    float _1093 = _1020;
    float _1095 = _900;
    float _1097 = _1071;
    float _1099 = _916;
    float _1101 = _1036;
    float _1103 = _1026;
    float _1105 = _1055;
    int _1107 = _920;
    int _1109 = _926;
    int _1111 = _950 * int(_1051);
    int _1113 = _1111 + _978;
    int _1115 = as_type<int>(_1097);
    if (_880)
    {
        float _1117 = -_860;
        float _1119 = _1117 + 1.0;
        _506 = as_type<int>(_1119);
    }
    int _1121 = _506;
    if (_872)
    {
        float _1123 = _996 ? as_type<float>(_958) : _860;
        _952 = _1123;
    }
    float _1125 = _952;
    float _1127 = _1093 * _1095;
    float _1129 = float(uint(_1113));
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1133 = _854 > 0.5;
    float _1135 = _1053 * _134;
    float _1137 = _1097 * _1099;
    float _1139 = as_type<float>(_1016) * _1129;
    float _1141 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1131);
    float _1143 = _1103 * _1095;
    float _1145 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _1147 = as_type<int>(_1042) + (-2);
    float _1149 = trunc(_1139);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    float _1155 = float(uint(_1032));
    float _1157 = in.m_73.y;
    if (!_880)
    {
        _508 = _860;
    }
    float _1159 = _508;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1163 = _1159;
    if (_880)
    {
        float _1165 = _1133 ? as_type<float>(_1121) : _860;
        _1163 = _1165;
    }
    float _1167 = _1163;
    float _1169 = as_type<float>(_1147) * _1155;
    float _1171 = floor(_1127);
    float _1173 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1161);
    if (_890)
    {
        float _1175 = -_860;
        float _1177 = _1175 + 1.0;
        _1115 = as_type<int>(_1177);
    }
    int _1179 = _1115;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1183 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1187 = floor(_1137);
    int _1189 = int(_1051) + int(_1153);
    float _1191 = -_1181;
    float _1193 = fma(_1183, 2.0, _1191);
    float _1195 = fma(_1145, -2.0, _1185);
    if (_890)
    {
        float _1197 = _1133 ? as_type<float>(_1179) : _860;
        _928 = _1197;
    }
    float _1199 = _928;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1203 = ~_886;
    int _1205 = _1203 + 1;
    float _1207 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1209 = floor(_1143);
    float _1211 = in.m_65.z;
    float _1213 = -_1171;
    float _1215 = _1127 + _1213;
    float _1217 = -_1201;
    float _1219 = fma(_1207, 2.0, _1217);
    int _1221 = _1205 * _1189;
    int _1223 = _1221 + _978;
    int _1225 = as_type<int>(_1044) + (-2);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1229 = _1227 != 0;
    float _1231 = float(_886);
    float _1233 = trunc(_1135);
    int _1235 = int(_1233);
    float _1237 = -_1187;
    float _1239 = _1137 + _1237;
    bool _1241 = uint(_1223) >= uint(_886);
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1245 = _1243 != 0;
    int _1247 = ~_1014;
    int _1249 = _1247 + 1;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1169);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = -_1209;
    float _1267 = _1143 + _1265;
    int _1269 = ~_1004;
    int _1271 = _1269 + 1;
    float _1273 = _1093 * 2.0;
    float _1275 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    float _1277 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1141);
    float _1279 = float(uint(_1235));
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1283 = float(_978);
    float _1285 = floor(_1273);
    bool _1287 = _1211 > 0.5;
    float _1289 = as_type<float>(_1225) * _1279;
    float _1291 = -_1157;
    float _1293 = _1291 + 1.0;
    bool _1295 = _1283 >= _1231;
    bool _1297 = isnan(_1283);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(_1231);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    int _1307 = _1271 * int(_1263);
    int _1309 = _1307 + _1032;
    float _1311 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1173);
    float _1313 = trunc(_1289);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    int _1319 = _960 ? as_type<int>(_1293) : as_type<int>(_1157);
    float _1321 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1195);
    float _1323 = float(uint(_1309));
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1327 = _1133 ? as_type<int>(_1293) : as_type<int>(_1157);
    float _1329 = -_134;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1219);
    float _1333 = trunc(_1305);
    int _1335 = int(_1333);
    float _1337 = as_type<float>(_1147) * _1323;
    int _1339 = _1287 ? as_type<int>(_1293) : as_type<int>(_1157);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1343 = _1341 != 0;
    float _1345 = _1229 ? as_type<float>(_1327) : _1157;
    float _1347 = in.m_59.w;
    bool _1349 = !_1343;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = trunc(_1337);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    int _1359 = _1249 * int(_1317);
    int _1361 = _1359 + _1235;
    bool _1363 = !_1241;
    int _1365 = _1363 ? 0 : (-1);
    bool _1367 = _1107 != 1;
    float _1369 = _1253 ? as_type<float>(_1319) : _1157;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1373 = _1371 != 0;
    float _1375 = _1245 ? as_type<float>(_1339) : _1157;
    float _1377 = _1257 ? as_type<float>(_1339) : _1157;
    float _1379 = float(uint(_1361));
    int _1381 = ~_1189;
    int _1383 = _1381 + _1365;
    int _1385 = _1383 + 1;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1389 = _1387 != 0;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1393 = _1391 != 0;
    float _1395 = as_type<float>(_1225) * _1379;
    int _1397 = int(_1263) + int(_1357);
    float _1399 = _1231 * _1239;
    bool _1401 = _886 == 0;
    int _1403 = _886 * _1385;
    int _1405 = _1403 + _978;
    float _1407 = _174 * _134;
    float _1409 = trunc(_1395);
    float _1411 = precise::max(_1409, 0.0);
    uint _1413 = uint(_1411);
    bool _1415 = !_1393;
    int _1417 = _1415 ? 0 : 1;
    bool _1419 = !_1389;
    int _1421 = _1419 ? 0 : 1;
    float _1423 = _1231 * _1407;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1431 = _1429 != 0;
    int _1433 = ~_1335;
    int _1435 = _1433 + 1;
    int _1437 = _1435 + 1;
    float _1439 = trunc(_1399);
    int _1441 = int(_1439);
    bool _1443 = !_1401;
    int _1445 = _1443 ? _1405 : (-1);
    int _1447 = _886 + (-1);
    bool _1449 = !_1431;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1445 * _1437;
    bool _1455 = !_1427;
    int _1457 = _1455 ? 0 : 1;
    float _1459 = trunc(_1423);
    int _1461 = int(_1459);
    int _1463 = abs(_1451);
    int _1465 = _1335 * _1447;
    int _1467 = _1465 + _1453;
    int _1469 = ~_1004;
    int _1471 = _1469 + 1;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1475 = _1473 != 0;
    int _1477 = _1471 * _1397;
    int _1479 = _1477 + _1032;
    int _1481 = int(_1317) + int(_1413);
    int _1483 = abs(_1457);
    int _1485 = _1467 * _1463;
    bool _1487 = !_1475;
    int _1489 = _1487 ? 0 : 1;
    int _1491 = ~_1014;
    int _1493 = _1491 + 1;
    int _1495 = abs(_1351);
    int _1497 = abs(_1489);
    bool _1499 = uint(_1479) >= uint(_1004);
    int _1501 = _1461 * _1483;
    int _1503 = _1501 + _1485;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1507 = _1505 != 0;
    int _1509 = _1493 * _1481;
    int _1511 = _1509 + _1235;
    int _1513 = _1441 * _1495;
    int _1515 = _1513 + _978;
    float _1517 = float(_1004);
    float _1519 = float(_1032);
    bool _1521 = !_1507;
    int _1523 = _1521 ? 0 : 1;
    bool _1525 = uint(_1511) >= uint(_1014);
    int _1527 = _1515 * _1497;
    int _1529 = _1527 + _1503;
    bool _1531 = _1519 >= _1517;
    bool _1533 = isnan(_1519);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(_1517);
    bool _1539 = _1535 || _1537;
    float _1541 = float(_1539);
    int _1543 = abs(_1523);
    bool _1545 = !_1499;
    int _1547 = _1545 ? 0 : (-1);
    int _1549 = _1441 * _1543;
    int _1551 = _1549 + _1529;
    int _1553 = ~_1397;
    int _1555 = _1553 + _1547;
    int _1557 = _1555 + 1;
    float _1559 = trunc(_1541);
    int _1561 = int(_1559);
    float _1563 = float(_1014);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1567 = float(_1235);
    int _1569 = _1004 * _1557;
    int _1571 = _1569 + _1032;
    float _1573 = _1563 * _1407;
    bool _1575 = _1567 >= _1563;
    bool _1577 = isnan(_1567);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(_1563);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = _1517 * _1215;
    float _1589 = _1517 * _1407;
    float _1591 = float(uint(_1551));
    float _1593 = _1563 * _1267;
    int _1595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1597 = _1595 != 0;
    float _1599 = trunc(_1585);
    int _1601 = int(_1599);
    bool _1603 = !_1525;
    int _1605 = _1603 ? 0 : (-1);
    float _1607 = as_type<float>(_1016) * _1591;
    bool _1609 = !_1597;
    int _1611 = _1609 ? 0 : 1;
    bool _1613 = _1004 == 0;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1617 = _1615 != 0;
    float _1619 = _1215;
    if (!_1367)
    {
        _1619 = _854;
    }
    float _1621 = _1619;
    float _1623 = trunc(_1587);
    int _1625 = int(_1623);
    float _1627 = _1621;
    if (_1367)
    {
        _1627 = _1093;
    }
    float _1629 = _1627;
    int _1631 = ~_1481;
    int _1633 = _1631 + _1605;
    int _1635 = _1633 + 1;
    int _1637 = ~_1561;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1565);
    bool _1645 = !_1613;
    int _1647 = _1645 ? _1571 : (-1);
    float _1649 = trunc(_1607);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    int _1655 = abs(_1611);
    int _1657 = _1014 * _1635;
    int _1659 = _1657 + _1235;
    bool _1661 = _1014 == 0;
    int _1663 = _1647 * _1641;
    int _1665 = ~_886;
    int _1667 = _1665 + 1;
    bool _1669 = !_1617;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1004 + (-1);
    int _1675 = _1625 * _1655;
    int _1677 = _1675 + _1032;
    int _1679 = ~_1601;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = trunc(_1589);
    int _1687 = int(_1685);
    bool _1689 = !_1661;
    int _1691 = _1689 ? _1659 : (-1);
    int _1693 = _1561 * _1673;
    int _1695 = _1693 + _1663;
    bool _1697 = _1109 != 2;
    int _1699 = _1014 + (-1);
    int _1701 = _1691 * _1683;
    int _1703 = abs(_1417);
    int _1705 = _1667 * int(_1653);
    int _1707 = _1705 + _1551;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1711 = _1709 != 0;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1715 = _1713 != 0;
    int _1717 = _1601 * _1699;
    int _1719 = _1717 + _1701;
    float _1721 = trunc(_1593);
    int _1723 = int(_1721);
    int _1725 = abs(_1671);
    float _1727 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1643);
    float _1729 = float(uint(_1707));
    int _1731 = _1695 * _1703;
    bool _1733 = !_1715;
    int _1735 = _1733 ? 0 : 1;
    bool _1737 = !_1373;
    int _1739 = _1737 ? 0 : 1;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1743 = _1741 != 0;
    float _1745 = as_type<float>(_1016) * _1729;
    float _1747 = trunc(_1573);
    int _1749 = int(_1747);
    int _1751 = abs(_1735);
    bool _1753 = !_1711;
    int _1755 = _1753 ? 0 : 1;
    int _1757 = abs(_1421);
    int _1759 = _1719 * _1751;
    bool _1761 = !_1743;
    int _1763 = _1761 ? 0 : 1;
    float _1765 = trunc(_1745);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    int _1771 = abs(_1755);
    int _1773 = _1687 * _1757;
    int _1775 = _1773 + _1731;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1779 = _1777 != 0;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1783 = _1781 != 0;
    int _1785 = abs(_1763);
    int _1787 = _1723 * _1725;
    int _1789 = _1787 + _1235;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1793 = _1791 != 0;
    int _1795 = _1677 * _1785;
    int _1797 = _1795 + _1775;
    bool _1799 = !_1779;
    int _1801 = _1799 ? 0 : 1;
    bool _1803 = !_1793;
    int _1805 = _1803 ? 0 : 1;
    int _1807 = _1749 * _1771;
    int _1809 = _1807 + _1759;
    int _1811 = int(_1653) + int(_1769);
    float _1813 = float(uint(_1515));
    bool _1815 = !_1783;
    int _1817 = _1815 ? 0 : 1;
    int _1819 = abs(_1801);
    float _1821 = as_type<float>(_1016) * _1813;
    int _1823 = abs(_1805);
    int _1825 = abs(_1817);
    float _1827 = trunc(_1821);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    int _1833 = ~_886;
    int _1835 = _1833 + 1;
    int _1837 = _1625 * _1823;
    int _1839 = _1837 + _1797;
    int _1841 = _1835 * _1811;
    int _1843 = _1841 + _1551;
    int _1845 = ~_886;
    int _1847 = _1845 + 1;
    int _1849 = _1789 * _1819;
    int _1851 = _1849 + _1809;
    float _1853 = float(uint(_1839));
    bool _1855 = uint(_1843) >= uint(_886);
    int _1857 = _1723 * _1825;
    int _1859 = _1857 + _1851;
    float _1861 = float(uint(_1677));
    float _1863 = as_type<float>(_1147) * _1853;
    bool _1865 = !_1855;
    int _1867 = _1865 ? 0 : (-1);
    int _1869 = _1847 * int(_1831);
    int _1871 = _1869 + _1515;
    float _1873 = float(uint(_1859));
    float _1875 = as_type<float>(_1147) * _1861;
    int _1877 = ~_1811;
    int _1879 = _1877 + _1867;
    int _1881 = _1879 + 1;
    float _1883 = trunc(_1863);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = float(uint(_1871));
    float _1891 = as_type<float>(_1225) * _1873;
    int _1893 = ~_1004;
    int _1895 = _1893 + 1;
    int _1897 = _886 * _1881;
    int _1899 = _1897 + _1551;
    float _1901 = float(uint(_1789));
    float _1903 = as_type<float>(_1016) * _1889;
    float _1905 = trunc(_1891);
    float _1907 = precise::max(_1905, 0.0);
    uint _1909 = uint(_1907);
    float _1911 = as_type<float>(_1723);
    float _1913 = as_type<float>(_1895);
    if (!_1367)
    {
        _1911 = _1211;
    }
    float _1915 = _1911;
    float _1917 = as_type<float>(_1225) * _1901;
    bool _1919 = !_1401;
    int _1921 = _1919 ? _1899 : (-1);
    float _1923 = _1915;
    if (_1367)
    {
        _1923 = _854;
    }
    float _1925 = _1923;
    int _1927 = _1921 & 3;
    bool _1929 = _1927 != 0;
    float _1931 = trunc(_1875);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    int _1937 = _1895 * int(_1887);
    int _1939 = _1937 + _1839;
    int _1941 = ~_1014;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1281);
    int _1947 = _1921 & 3;
    bool _1949 = _1947 != 0;
    float _1951 = float(uint(_1939));
    float _1953 = trunc(_1917);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    int _1959 = _1943 * int(_1909);
    int _1961 = _1959 + _1859;
    if (!_1367)
    {
        _1913 = _854;
    }
    float _1963 = _1913;
    float _1965 = as_type<float>(_1147) * _1951;
    float _1967 = _1963;
    if (_1367)
    {
        _1967 = _1093;
    }
    float _1969 = _1967;
    int _1971 = _1929 ? 0 : 1;
    int _1973 = _1895 * int(_1935);
    int _1975 = _1973 + _1677;
    bool _1977 = uint(_1947) > 1u;
    float _1979 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1981 = ~_1014;
    int _1983 = _1981 + 1;
    float _1985 = trunc(_1965);
    float _1987 = precise::max(_1985, 0.0);
    uint _1989 = uint(_1987);
    float _1991 = float(uint(_1961));
    float _1993 = -_1325;
    float _1995 = fma(_1979, 2.0, _1993);
    float _1997 = float(uint(_1975));
    float _1999 = as_type<float>(_1225) * _1991;
    bool _2001 = _1004 == 0;
    float _2003 = trunc(_1903);
    float _2005 = precise::max(_2003, 0.0);
    uint _2007 = uint(_2005);
    float _2009 = as_type<float>(_1147) * _1997;
    int _2011 = _1983 * int(_1957);
    int _2013 = _2011 + _1789;
    int _2015 = ~_1004;
    int _2017 = _2015 + 1;
    float _2019 = -_134;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1995);
    int _2023 = ~_1014;
    int _2025 = _2023 + 1;
    float _2027 = _854 * 2.0;
    float _2029 = float(uint(_2013));
    float _2031 = trunc(_1999);
    float _2033 = precise::max(_2031, 0.0);
    uint _2035 = uint(_2033);
    int _2037 = ~_1971;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    int _2043 = _2041;
    float _2045 = _2029;
    if (!_1977)
    {
        int _2047 = ~_1971;
        int _2049 = _2047 + 1;
        _2043 = _2049;
    }
    int _2051 = _2043;
    float _2053 = as_type<float>(_1225) * _2029;
    bool _2055 = uint(_1947) >= 2u;
    int _2057 = int(_1887) + int(_1989);
    float _2059 = trunc(_2009);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = _2055 ? 0 : 1;
    bool _2067 = _1947 != 3;
    int _2069 = _2017 * _2057;
    int _2071 = _2069 + _1839;
    int _2073 = int(_1831) + int(_2007);
    float _2075 = trunc(_2053);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    int _2081 = int(_1909) + int(_2035);
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2085 = ~_2065;
    int _2087 = _2085 + 1;
    int _2089 = _2087 + 1;
    bool _2091 = uint(_2071) >= uint(_1004);
    int _2093 = _2089;
    if (_2067)
    {
        int _2095 = ~_2065;
        int _2097 = _2095 + 1;
        _2093 = _2097;
    }
    int _2099 = _2093;
    int _2101 = _2025 * _2081;
    int _2103 = _2101 + _1859;
    bool _2105 = !_2091;
    int _2107 = _2105 ? 0 : (-1);
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2111 = _2109 != 0;
    bool _2113 = uint(_2103) >= uint(_1014);
    int _2115 = ~_2057;
    int _2117 = _2115 + _2107;
    int _2119 = _2117 + 1;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : 1;
    int _2125 = int(_1957) + int(_2079);
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2129 = _2127 != 0;
    bool _2131 = !_2113;
    int _2133 = _2131 ? 0 : (-1);
    int _2135 = _1004 * _2119;
    int _2137 = _2135 + _1839;
    int _2139 = ~_886;
    int _2141 = _2139 + 1;
    int _2143 = int(_1935) + int(_2063);
    int _2145 = ~_2081;
    int _2147 = _2145 + _2133;
    int _2149 = _2147 + 1;
    int _2151 = _2141 * _2073;
    int _2153 = _2151 + _1515;
    int _2155 = ~_1004;
    int _2157 = _2155 + 1;
    bool _2159 = !_2001;
    int _2161 = _2159 ? _2137 : (-1);
    int _2163 = _1014 * _2149;
    int _2165 = _2163 + _1859;
    bool _2167 = uint(_2153) >= uint(_886);
    int _2169 = _2157 * _2143;
    int _2171 = _2169 + _1677;
    float _2173 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2175 = log2(_2173);
    int _2177 = _2161 & 3;
    float _2179 = as_type<float>(_2119);
    float _2181 = as_type<float>(_2153);
    if (_1697)
    {
        _2179 = _1093;
    }
    float _2183 = _2179;
    float _2185 = _2183;
    if (_1697)
    {
        _2181 = _854;
    }
    float _2187 = _2181;
    float _2189 = _2187;
    if (!_1697)
    {
        _2185 = _1211;
    }
    float _2191 = _2185;
    if (!_1697)
    {
        _2189 = _1093;
    }
    float _2193 = _2189;
    bool _2195 = uint(_2171) >= uint(_1004);
    float _2197 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2199 = uint(_2177) >= 2u;
    bool _2201 = !_2195;
    int _2203 = _2201 ? 0 : (-1);
    float _2205 = _2175 * _134;
    bool _2207 = uint(_2177) > 1u;
    float _2209 = -_2083;
    float _2211 = fma(_2197, 2.0, _2209);
    int _2213 = _2199 ? 0 : 1;
    float _2215 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2217 = _2177 != 3;
    float _2219 = exp2(_2205);
    bool _2221 = !_2167;
    int _2223 = _2221 ? 0 : (-1);
    float _2225 = -_134;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2211);
    int _2229 = ~_1014;
    int _2231 = _2229 + 1;
    float _2233 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2235 = _848 + _2233;
    int _2237 = _2161 & 3;
    bool _2239 = _2237 != 0;
    bool _2241 = !_1661;
    int _2243 = _2241 ? _2165 : (-1);
    int _2245 = _2231 * _2125;
    int _2247 = _2245 + _1789;
    int _2249 = _2239 ? 0 : 1;
    int _2251 = _2243 & 3;
    int _2253 = ~_2249;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = ~_2213;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = -_2219;
    float _2267 = _2265 + 1.0;
    int _2269 = _2257;
    int _2271 = _2263;
    if (!_2207)
    {
        int _2273 = ~_2249;
        int _2275 = _2273 + 1;
        _2269 = _2275;
    }
    int _2277 = _2269;
    bool _2279 = uint(_2247) >= uint(_1014);
    if (_2217)
    {
        int _2281 = ~_2213;
        int _2283 = _2281 + 1;
        _2271 = _2283;
    }
    int _2285 = _2271;
    bool _2287 = uint(_2251) > 1u;
    bool _2289 = !_2279;
    int _2291 = _2289 ? 0 : (-1);
    int _2293 = _2243 & 3;
    bool _2295 = _2293 != 0;
    int _2297 = _2295 ? 0 : 1;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2301 = ~_2297;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = _2305;
    if (!_2287)
    {
        int _2309 = ~_2297;
        int _2311 = _2309 + 1;
        _2307 = _2311;
    }
    int _2313 = _2307;
    float _2315 = fma(_2215, -2.0, _2299);
    if (!_1367)
    {
        _2045 = _1211;
    }
    float _2317 = _2045;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2321 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2323 = isnan(0.0);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2329 = _2325 || _2327;
    float _2331 = in.m_48.x;
    float _2333 = in.m_48.y;
    float _2335 = in.m_48.z;
    float _2337 = _2317;
    if (_1367)
    {
        _2337 = _854;
    }
    float _2339 = _2337;
    float _2341 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2319);
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2345 = _2329 ? _2267 : 0.0;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2349 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2351 = isnan(1.0);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2357 = _2353 || _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2361 = 1.0 + _2359;
    float _2363 = fma(_2343, -2.0, _2347);
    float _2365 = 1.0 / _2361;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2369 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2341);
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2375 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2367);
    float _2377 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2371);
    float _2379 = -_134;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1193);
    float _2383 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2373);
    float _2385 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2375);
    float _2387 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2377);
    float _2389 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1945);
    float _2391 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2383);
    float _2393 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2315);
    float _2395 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2363);
    if (_2357)
    {
        float _2397 = _2345 * _2365;
        _144 = _2397;
    }
    float _2399 = _144;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2405 = _1285 >= 0.0;
    bool _2407 = isnan(_1285);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan(0.0);
    bool _2413 = _2409 || _2411;
    float _2415 = _202 * _2333;
    float _2417 = floor(_2027);
    int _2419 = _2413 ? 0 : 1;
    float _2421 = _208 * _2333;
    bool _2423 = _1285 > 0.0;
    float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2427 = _2425 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2429 = _196 * _2333;
    float _2431 = fma(_200, _2331, _2415);
    float _2433 = 1.0 / _2403;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2439 = fma(_206, _2331, _2421);
    float _2441 = fma(_194, _2331, _2429);
    float _2443 = fma(_204, _2335, _2431);
    float _2445 = 1.0 / _2427;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2451 = ~_2419;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2459 = _2457 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2461 = _2455;
    if (!_2423)
    {
        int _2463 = ~_2419;
        int _2465 = _2463 + 1;
        _2461 = _2465;
    }
    int _2467 = _2461;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2469;
    float _2473 = fma(_198, _2335, _2441);
    float _2475 = 1.0 / _2437;
    bool _2477 = _2417 >= 0.0;
    bool _2479 = isnan(_2417);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(0.0);
    bool _2485 = _2481 || _2483;
    float _2487 = _2471 * _2433;
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2497 = _2485 ? 0 : 1;
    float _2499 = fma(_210, _2335, _2439);
    float _2501 = 1.0 / _2449;
    bool _2503 = _2417 > 0.0;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2507 = _2505 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2509 = _2495 * _2445;
    int _2511 = ~_2073;
    int _2513 = _2511 + _2223;
    int _2515 = _2513 + 1;
    float _2517 = _1211 * 2.0;
    float _2519 = 1.0 / _2459;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2521;
    int _2525 = _886 * _2515;
    int _2527 = _2525 + _1515;
    int _2529 = ~_2497;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = in.m_61.w;
    float _2537 = _2523 * _2475;
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2543;
    float _2547 = 1.0 / _2491;
    int _2549 = _2533;
    if (!_2503)
    {
        int _2551 = ~_2497;
        int _2553 = _2551 + 1;
        _2549 = _2553;
    }
    int _2555 = _2549;
    float _2557 = _2541 * _2501;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2561 = _848 + _2559;
    bool _2563 = _1947 != 3;
    float _2565 = fma(_2557, _2235, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2567 = !_1401;
    int _2569 = _2567 ? _2527 : (-1);
    float _2571 = 1.0 / _2507;
    float _2573 = _2545 * _2519;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2579 = _854 + _1211;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2581;
    bool _2585 = !_1949;
    int _2587 = _2585 ? 0 : 1;
    float _2589 = fma(_2537, _2561, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2591 = _2579 + (-1.0);
    float _2593 = floor(_2517);
    float _2595 = _2577 * _2547;
    float _2597 = _2473 + _1347;
    int _2599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2601 = _2599 != 0;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2605 = _2603 != 0;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2609 = _2607 != 0;
    float _2611 = _2443 + _2535;
    bool _2613 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2615 = isnan(_848);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = _2583 * _2571;
    bool _2627 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2629 = isnan(_848);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2643 = _848 + _2641;
    bool _2645 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2647 = isnan(_848);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2653 = _2649 || _2651;
    float _2655 = float(_2653);
    float _2657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2659 = -_2637;
    float _2661 = _2659 + 1.0;
    float _2663 = fma(_2487, _2643, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2665 = _2593 >= 0.0;
    bool _2667 = isnan(_2593);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan(0.0);
    bool _2673 = _2669 || _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2677 = _848 + _2675;
    float _2679 = -_2655;
    float _2681 = _2679 + 1.0;
    bool _2683 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2685 = isnan(_848);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2691 = _2687 || _2689;
    float _2693 = float(_2691);
    int _2695 = _2673 ? 0 : 1;
    float _2697 = fma(_2509, _2677, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2699 = _2593 > 0.0;
    float _2701 = _2655 * _2661;
    bool _2703 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2705 = isnan(_848);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = _2623 * _2681;
    float _2717 = -_2623;
    float _2719 = _2717 + 1.0;
    bool _2721 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2723 = isnan(_848);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    float _2733 = in.m_63.w;
    float _2735 = -_2713;
    float _2737 = _2735 + 1.0;
    bool _2739 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2741 = isnan(_848);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2747 = _2743 || _2745;
    float _2749 = float(_2747);
    float _2751 = -_2693;
    float _2753 = _2751 + 1.0;
    float _2755 = _2713 * _2719;
    bool _2757 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2759 = isnan(_848);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2765 = _2761 || _2763;
    float _2767 = float(_2765);
    float _2769 = _2731 * _2737;
    float _2771 = -_2731;
    float _2773 = _2771 + 1.0;
    float _2775 = _2749 * _2753;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2779 = _848 + _2777;
    float _2781 = -_2749;
    float _2783 = _2781 + 1.0;
    float _2785 = _2767 * _2773;
    float _2787 = -_2767;
    float _2789 = _2787 + 1.0;
    float _2791 = _2663 * _2775;
    int _2793 = _1921 >> 31;
    float _2795 = fma(_2573, _2779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2797 = _2693 * _2789;
    float _2799 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2791);
    int _2801 = _2793 & 3;
    float _2803 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2805 = fma(_2697, _2797, _2799);
    int _2807 = _1921 + _2801;
    float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2811 = _2597 + _2809;
    float _2813 = _2499 + _2733;
    float _2815 = fma(_2589, _2785, _2805);
    float _2817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2819 = _2611 + _2817;
    int _2821 = _2807 >> 2;
    float _2823 = fma(_2803, _1125, -0.5);
    float _2825 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2827 = fma(_2565, _2769, _2815);
    int _2829 = _2821 << 4;
    int _2831 = _2829 + 656;
    float _2833 = _2819 * _2819;
    float _2835 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2837 = _848 + _2835;
    float _2839 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _2841 = uint(int(uint(_2831) >> uint(2)));
    uint _2843 = uint(int(uint(int(_2841)) >> uint(2)));
    int _2845 = int(_2841) & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    int _2849 = int(_2841) + 1;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    int _2853 = _2849 & 3;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[int(_2851)][_2853];
    float _2857 = fma(_2811, _2811, _2833);
    float _2859 = fma(_2795, _2755, _2827);
    float _2861 = fma(_2595, _2837, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2865 = _2813 + _2863;
    float _2867 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2839);
    float _2869 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    float _2871 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2873 = _848 + _2871;
    float _2875 = fma(_2861, _2715, _2859);
    float _2877 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2867);
    float _2879 = fma(_1311, _2869, _2381);
    float _2881 = fma(_2625, _2873, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2883 = _2831 + 8;
    uint _2885 = uint(int(uint(_2883) >> uint(2)));
    uint _2887 = uint(int(uint(int(_2885)) >> uint(2)));
    int _2889 = int(_2885) & 3;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[int(_2887)][_2889];
    int _2893 = int(_2885) + 1;
    uint _2895 = uint(int(uint(_2893) >> uint(2)));
    int _2897 = _2893 & 3;
    float _2899 = (*spvDescriptorSet0.vp_c9)._m0[int(_2895)][_2897];
    int _2901 = ~_2695;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    float _2907 = _854 + _1093;
    int _2909 = _2905;
    float _2911 = _2597;
    float _2913 = _2813;
    if (!_2699)
    {
        int _2915 = ~_2695;
        int _2917 = _2915 + 1;
        _2909 = _2917;
    }
    int _2919 = _2909;
    bool _2921 = _2877 >= 0.0;
    float _2923 = _2907 + (-1.0);
    float _2925 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    int _2927 = abs(_2587);
    float _2929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2931 = abs(_2099);
    float _2933 = fma(_2923, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2935 = -_1321;
    float _2937 = fma(_1277, _2925, _2935);
    int _2939 = ~_2927;
    int _2941 = _2939 + 1;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2865, _2865, _2857);
    bool _2947 = !_2563;
    int _2949 = _2947 ? 0 : (-1);
    float _2951 = fma(_1727, _2823, _2021);
    float _2953 = _2923;
    if (_2921)
    {
        _2953 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2955 = _2953;
    float _2957 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2959 = int(_2957);
    float _2961 = fma(_2387, _2825, _1331);
    int _2963 = abs(_2123);
    int _2965 = as_type<int>(_2955);
    if (_2921)
    {
        float _2967 = _2955 * 5.0;
        _2965 = as_type<int>(_2967);
    }
    int _2969 = _2965;
    bool _2971 = !_2601;
    int _2973 = _2971 ? 0 : 1;
    float _2975 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2977 = _2929 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2979 = rsqrt(_2945);
    if (_2921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9718 = as_type<float>(_2969);
        out.gl_Position.z = _9718;
    }
    float _2981 = -_1275;
    float _2983 = fma(_2391, _2975, _2981);
    float _2985 = fma(_2977, _1369, -0.5);
    int _2987 = ~_2143;
    int _2989 = _2987 + _2203;
    int _2991 = _2989 + 1;
    bool _2993 = !_2129;
    int _2995 = _2993 ? 0 : 1;
    int _2997 = ~_2125;
    int _2999 = _2997 + _2291;
    int _3001 = _2999 + 1;
    float _3003 = fma(_2881, _2701, _2875);
    int _3005 = abs(_2959);
    int _3007 = _1004 * _2991;
    int _3009 = _3007 + _1677;
    int _3011 = abs(_2285);
    int _3013 = _1014 * _3001;
    int _3015 = _3013 + _1789;
    float _3017 = float(uint(_3005));
    float _3019 = _2879 + 0.5;
    int _3021 = abs(_2051);
    float _3023 = _2937 + 0.5;
    float _3025 = float(uint(_2959));
    float _3027 = 1.0 / _3017;
    int _3029 = ~_3021;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = _2865 * _2979;
    out.m_75.x = _3019;
    out.m_75.y = _3023;
    bool _3037 = _1004 == 0;
    float _3039 = _2819 * _2979;
    int _3041 = _3033 * as_type<int>(_2855);
    float _3043 = float(_2919);
    float _3045 = 1.0 / _3025;
    float _3047 = -_3035;
    float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2865);
    int _3051 = _2943 * as_type<int>(_2847);
    int _3053 = _3051 + _3041;
    int _3055 = abs(_2949);
    float _3057 = _2811 * _2979;
    int _3059 = _2161 >> 31;
    float _3061 = -_3039;
    float _3063 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2819);
    float _3065 = fma(_2637, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3003);
    int _3067 = _3059 & 3;
    float _3069 = -_3057;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2811);
    int _3073 = ~_2931;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    float _3079 = _3063 * _3063;
    int _3081 = ~_3055;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    out.m_77.x = _3065;
    int _3087 = _2161 + _3067;
    int _3089 = _3077 * as_type<int>(_2891);
    int _3091 = _3089 + _3053;
    int _3093 = ~_2963;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    float _3099 = fma(_3071, _3071, _3079);
    int _3101 = abs(_2973);
    int _3103 = _3085 * as_type<int>(_2899);
    int _3105 = _3103 + _3091;
    int _3107 = _2243 >> 31;
    float _3109 = -_2395;
    float _3111 = fma(_2389, _2985, _3109);
    float _3113 = float(_3101);
    int _3115 = _3105 * _3097;
    int _3117 = _3107 & 3;
    float _3119 = _3111 + 0.5;
    int _3121 = _3087 >> 2;
    int _3123 = _2569 * _2963;
    int _3125 = _3123 + _3115;
    float _3127 = _3113 * _3043;
    int _3129 = _2243 + _3117;
    float _3131 = _2961 + 0.5;
    int _3133 = _3121 << 4;
    int _3135 = _3133 + 368;
    float _3137 = _3127 * (-2.0);
    float _3139 = in.m_79.x;
    float _3141 = in.m_79.y;
    float _3143 = in.m_79.z;
    bool _3145 = !_2605;
    int _3147 = _3145 ? 0 : 1;
    uint _3149 = uint(int(uint(_3135) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    int _3165 = _3129 >> 2;
    float _3167 = _2951 + 0.5;
    int _3169 = abs(_3147);
    float _3171 = _2983 + 0.5;
    int _3173 = as_type<int>(_3045) + (-2);
    float _3175 = as_type<float>(_3005);
    if (_2921)
    {
        out.m_55.x = 0.0;
    }
    float _3177 = float(uint(_3125));
    int _3179 = _3135 + 8;
    uint _3181 = uint(int(uint(_3179) >> uint(2)));
    uint _3183 = uint(int(uint(int(_3181)) >> uint(2)));
    int _3185 = int(_3181) & 3;
    float _3187 = (*spvDescriptorSet0.vp_c9)._m0[int(_3183)][_3185];
    int _3189 = int(_3181) + 1;
    uint _3191 = uint(int(uint(_3189) >> uint(2)));
    int _3193 = _3189 & 3;
    float _3195 = (*spvDescriptorSet0.vp_c9)._m0[int(_3191)][_3193];
    int _3197 = abs(_3125);
    out.m_81.x = _3131;
    out.m_81.y = _3171;
    out.m_81.z = _3167;
    out.m_81.w = _3119;
    int _3199 = _3165 << 4;
    int _3201 = _3199 + 800;
    float _3203 = as_type<float>(_3173) * _3177;
    int _3205 = as_type<int>(_3027) + (-2);
    float _3207 = fma(_3049, _3049, _3099);
    float _3209 = float(uint(_3197));
    uint _3211 = uint(int(uint(_3201) >> uint(2)));
    uint _3213 = uint(int(uint(int(_3211)) >> uint(2)));
    int _3215 = int(_3211) & 3;
    float _3217 = (*spvDescriptorSet0.vp_c9)._m0[int(_3213)][_3215];
    int _3219 = int(_3211) + 1;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    int _3223 = _3219 & 3;
    float _3225 = (*spvDescriptorSet0.vp_c9)._m0[int(_3221)][_3223];
    float _3227 = float(_2467);
    float _3229 = trunc(_3203);
    float _3231 = precise::max(_3229, 0.0);
    uint _3233 = uint(_3231);
    float _3235 = float(_3169);
    float _3237 = as_type<float>(_3205) * _3209;
    float _3239 = _1093 + (-0.5);
    float _3241 = fma(_3137, _3139, _3139);
    bool _3243 = !_3037;
    int _3245 = _3243 ? _3009 : (-1);
    float _3247 = _3235 * _3227;
    float _3249 = fma(_2933, _3137, _2933);
    float _3251 = trunc(_3237);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    int _3257 = ~_2959;
    int _3259 = _3257 + 1;
    float _3261 = fma(_3239, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3241);
    int _3263 = ~_3005;
    int _3265 = _3263 + 1;
    int _3267 = _3201 + 8;
    uint _3269 = uint(int(uint(_3267) >> uint(2)));
    uint _3271 = uint(int(uint(int(_3269)) >> uint(2)));
    int _3273 = int(_3269) & 3;
    float _3275 = (*spvDescriptorSet0.vp_c9)._m0[int(_3271)][_3273];
    int _3277 = int(_3269) + 1;
    uint _3279 = uint(int(uint(_3277) >> uint(2)));
    int _3281 = _3277 & 3;
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[int(_3279)][_3281];
    float _3285 = _3247 * (-2.0);
    float _3287 = fma(_3249, _2399, _3261);
    int _3289 = abs(_2277);
    int _3291 = _3259 * int(_3233);
    int _3293 = _3291 + _3125;
    int _3295 = abs(_1739);
    float _3297 = _854 + (-0.5);
    int _3299 = ~_3289;
    int _3301 = _3299 + 1;
    int _3303 = _3301 + 1;
    float _3305 = float(uint(_3293));
    int _3307 = _3265 * int(_3255);
    int _3309 = _3307 + _3197;
    bool _3311 = !_2239;
    int _3313 = _3311 ? 0 : 1;
    bool _3315 = _2177 != 3;
    float _3317 = as_type<float>(_3173) * _3305;
    float _3319 = float(uint(_3309));
    int _3321 = _3303 * as_type<int>(_3163);
    bool _3323 = !_2295;
    int _3325 = _3323 ? 0 : 1;
    bool _3327 = uint(_2251) >= 2u;
    float _3329 = as_type<float>(_3205) * _3319;
    int _3331 = abs(_3313);
    int _3333 = abs(_2313);
    int _3335 = abs(_3325);
    float _3337 = trunc(_3317);
    float _3339 = precise::max(_3337, 0.0);
    uint _3341 = uint(_3339);
    int _3343 = _3327 ? 0 : 1;
    bool _3345 = _2251 != 3;
    int _3347 = ~_3333;
    int _3349 = _3347 + 1;
    int _3351 = _3349 + 1;
    float _3353 = trunc(_3329);
    float _3355 = precise::max(_3353, 0.0);
    uint _3357 = uint(_3355);
    int _3359 = ~_3331;
    int _3361 = _3359 + 1;
    int _3363 = _3361 + 1;
    int _3365 = _3351 * as_type<int>(_3225);
    int _3367 = ~_3011;
    int _3369 = _3367 + 1;
    int _3371 = _3369 + 1;
    int _3373 = _3363 * as_type<int>(_3155);
    int _3375 = _3373 + _3321;
    int _3377 = ~_3343;
    int _3379 = _3377 + 1;
    int _3381 = _3379 + 1;
    int _3383 = ~_3335;
    int _3385 = _3383 + 1;
    int _3387 = _3385 + 1;
    int _3389 = _3371 * as_type<int>(_3187);
    int _3391 = _3389 + _3375;
    bool _3393 = !_3315;
    int _3395 = _3393 ? 0 : (-1);
    int _3397 = _3381;
    if (_3345)
    {
        int _3399 = ~_3343;
        int _3401 = _3399 + 1;
        _3397 = _3401;
    }
    int _3403 = _3397;
    int _3405 = _3387 * as_type<int>(_3217);
    int _3407 = _3405 + _3365;
    bool _3409 = _2251 != 3;
    int _3411 = abs(_3395);
    bool _3413 = !_3409;
    int _3415 = _3413 ? 0 : (-1);
    int _3417 = ~_3411;
    int _3419 = _3417 + 1;
    int _3421 = _3419 + 1;
    int _3423 = abs(_3403);
    int _3425 = abs(_3415);
    int _3427 = _3421 * as_type<int>(_3195);
    int _3429 = _3427 + _3391;
    int _3431 = int(_3233) + int(_3341);
    int _3433 = int(_3255) + int(_3357);
    int _3435 = ~_2959;
    int _3437 = _3435 + 1;
    int _3439 = ~_3005;
    int _3441 = _3439 + 1;
    int _3443 = ~_3423;
    int _3445 = _3443 + 1;
    int _3447 = _3445 + 1;
    int _3449 = _3437 * _3431;
    int _3451 = _3449 + _3125;
    int _3453 = _3441 * _3433;
    int _3455 = _3453 + _3197;
    bool _3457 = _1014 == 0;
    int _3459 = _3447 * as_type<int>(_3275);
    int _3461 = _3459 + _3407;
    int _3463 = ~_3425;
    int _3465 = _3463 + 1;
    int _3467 = _3465 + 1;
    float _3469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3471 = uint(_3451) >= uint(_2959);
    bool _3473 = uint(_3455) >= uint(_3005);
    int _3475 = _3467 * as_type<int>(_3283);
    int _3477 = _3475 + _3461;
    int _3479 = _3125 ^ _2959;
    bool _3481 = !_3471;
    int _3483 = _3481 ? 0 : (-1);
    bool _3485 = !_3473;
    int _3487 = _3485 ? 0 : (-1);
    uint _3489 = uint(int(uint(_3479) >> uint(31)));
    int _3491 = abs(_2995);
    int _3493 = ~_3487;
    int _3495 = _3433 + _3493;
    int _3497 = _3495 + 1;
    int _3499 = ~_3431;
    int _3501 = _3499 + _3483;
    int _3503 = _3501 + 1;
    int _3505 = ~int(_3489);
    int _3507 = _3505 + 1;
    float _3509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3511 = ~_3491;
    int _3513 = _3511 + 1;
    int _3515 = _3513 + 1;
    int _3517 = _2959 * _3503;
    int _3519 = _3517 + _3125;
    int _3521 = _3497 ^ _3507;
    int _3523 = ~_3295;
    int _3525 = _3523 + 1;
    int _3527 = _3525 + 1;
    int _3529 = _3429 * _3515;
    bool _3531 = _2959 == 0;
    bool _3533 = _2959 == 0;
    int _3535 = _3477 * _3527;
    int _3537 = ~_3507;
    int _3539 = _3537 + _3521;
    int _3541 = _3539 + 1;
    int _3543 = _3245 * _3491;
    int _3545 = _3543 + _3529;
    bool _3547 = !_3531;
    int _3549 = _3547 ? _3519 : (-1);
    float _3551 = _3469 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3553 = !_3533;
    int _3555 = _3553 ? _3541 : (-1);
    float _3557 = _3509 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3559 = float(_3549);
    float _3561 = fma(_3551, _1167, -0.5);
    float _3563 = float(_3555);
    float _3565 = fma(_3557, _1375, -0.5);
    bool _3567 = !_3457;
    int _3569 = _3567 ? _3015 : (-1);
    float _3571 = fma(_3551, _3559, _2227);
    float _3573 = float(_3545);
    float _3575 = -_2393;
    float _3577 = fma(_3557, _3563, _3575);
    float _3579 = fma(_3285, _3141, _3141);
    int _3581 = _3569 * _3295;
    int _3583 = _3581 + _3535;
    float _3585 = fma(_2385, _3561, _3571);
    float _3587 = fma(_2369, _3565, _3577);
    out.m_83.x = _3573;
    float _3589 = fma(_2639, _3285, _2639);
    float _3591 = float(_3583);
    float _3593 = _3585 + 0.5;
    float _3595 = _3587 + 0.5;
    bool _3597 = !_2609;
    int _3599 = _3597 ? 0 : 1;
    out.m_83.w = _3591;
    out.m_85.x = _3593;
    out.m_85.y = _3595;
    if (_2921)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3601 = -_3039;
    float _3603 = fma(_3601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2611);
    float _3605 = float(_2555);
    float _3607 = -_3057;
    float _3609 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2597);
    int _3611 = abs(_3599);
    float _3613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3615 = _3603 + _3613;
    float _3617 = -_3035;
    float _3619 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2813);
    float _3621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3623 = _3609 + _3621;
    float _3625 = _1093 + _1211;
    float _3627 = _3615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3631 = _3619 + _3629;
    float _3633 = _1211 + (-0.5);
    float _3635 = _3625 + (-1.0);
    float _3637 = fma(_3623, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3627);
    float _3639 = float(_3611);
    float _3641 = fma(_3297, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3579);
    float _3643 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3637);
    float _3645 = _3287 * 0.15915493667125701904296875;
    float _3647 = _3639 * _3605;
    float _3649 = fma(_3589, _2399, _3641);
    float _3651 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3653 = _3643 >= 0.0;
    float _3655 = _3647 * (-2.0);
    float _3657 = _3649 * 0.15915493667125701904296875;
    float _3659 = sqrt(_3207);
    float _3661 = fma(_3655, _3143, _3143);
    float _3663 = fma(_3651, _3655, _3651);
    float _3665 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3661);
    float _3667 = _3645 * 6.283185482025146484375;
    float _3669 = sin(_3667);
    float _3671 = fma(_3663, _2399, _3665);
    float _3673 = _3661;
    float _3675 = _3645;
    float _3677 = _3623;
    float _3679 = _3609;
    if (_3653)
    {
        _3673 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3681 = _3673;
    int _3683 = as_type<int>(_3681);
    if (_3653)
    {
        out.m_55.x = 0.0;
    }
    float _3685 = _3671 * 0.15915493667125701904296875;
    float _3687 = _3645 * 6.283185482025146484375;
    float _3689 = cos(_3687);
    if (_3653)
    {
        float _3691 = _3681 * 5.0;
        _3683 = as_type<int>(_3691);
    }
    int _3693 = _3683;
    if (_3653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10734 = as_type<float>(_3693);
        out.gl_Position.z = _10734;
    }
    float _3695 = _3657 * 6.283185482025146484375;
    float _3697 = sin(_3695);
    float _3699 = _3657 * 6.283185482025146484375;
    float _3701 = cos(_3699);
    float _3703 = _3685 * 6.283185482025146484375;
    float _3705 = sin(_3703);
    if (_3653)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3707 = -_2611;
    float _3709 = _3707 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3711 = -_2597;
    float _3713 = _3711 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3715 = -_2813;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3719 = in.m_87.x;
    float _3721 = in.m_87.y;
    float _3723 = in.m_87.z;
    float _3725 = _3709 * _3709;
    float _3727 = _3685 * 6.283185482025146484375;
    float _3729 = cos(_3727);
    float _3731 = _3689 * _3697;
    float _3733 = _3669 * _3701;
    float _3735 = fma(_3713, _3713, _3725);
    float _3737 = _3669 * _3697;
    float _3739 = _3689 * _3701;
    float _3741 = _2979 * _3659;
    float _3743 = fma(_3717, _3717, _3735);
    float _3745 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3747 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3749 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3751 = -_3731;
    float _3753 = fma(_3705, _3733, _3751);
    float _3755 = -_3733;
    float _3757 = fma(_3705, _3731, _3755);
    float _3759 = rsqrt(_3743);
    float _3761 = fma(_3705, _3739, _3737);
    float _3763 = _3741 * _3745;
    float _3765 = _3689 * _3729;
    float _3767 = _3701 * _3729;
    float _3769 = _3669 * _3729;
    float _3771 = _3697 * _3729;
    float _3773 = fma(_3705, _3737, _3739);
    float _3775 = _3741 * _3747;
    float _3777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3723);
    float _3779 = _3741 * _3749;
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3719);
    float _3783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3721);
    float _3785 = _3777 * _3763;
    bool _3787 = _3721 != 0.0;
    bool _3789 = isnan(_3721);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan(0.0);
    bool _3795 = _3791 || _3793;
    float _3797 = _3781 * _3775;
    float _3799 = _3713 * _3759;
    float _3801 = _3717 * _3759;
    float _3803 = _3709 * _3759;
    float _3805 = _3783 * _3779;
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3799 * _3807;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3813 = _3801 * _3811;
    float _3815 = in.m_89.x;
    float _3817 = in.m_89.y;
    float _3819 = in.m_89.z;
    bool _3821 = _3719 == 0.0;
    bool _3823 = !_3795;
    bool _3825 = _3821 && _3823;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3829 = -_3809;
    float _3831 = fma(_3801, _3827, _3829);
    float _3833 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3835 = _3803 * _3833;
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3839 = -_3813;
    float _3841 = fma(_3803, _3837, _3839);
    bool _3843 = _3723 == 0.0;
    bool _3845 = _3843 && _3825;
    float _3847 = _3831 * _3831;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3851 = -_3835;
    float _3853 = fma(_3799, _3849, _3851);
    float _3855 = in.m_91.x;
    float _3857 = in.m_91.y;
    float _3859 = in.m_91.z;
    float _3861 = in.m_91.w;
    float _3863 = -_3805;
    float _3865 = _3705 * _3863;
    float _3867 = fma(_3841, _3841, _3847);
    float _3869 = _3765 * _3805;
    float _3871 = _3769 * _3805;
    float _3873 = fma(_3767, _3797, _3865);
    float _3875 = fma(_3853, _3853, _3867);
    float _3877 = fma(_3761, _3797, _3869);
    float _3879 = fma(_3753, _3797, _3871);
    float _3881 = fma(_3771, _3785, _3873);
    float _3883 = fma(_3757, _3785, _3877);
    float _3885 = rsqrt(_3875);
    float _3887 = _3871;
    float _3889 = _3815;
    float _3891 = _3797;
    if (_3845)
    {
        _3175 = _3815;
    }
    float _3893 = _3175;
    float _3895 = _3893;
    if (_3845)
    {
        _3675 = _3819;
    }
    float _3897 = _3675;
    float _3899 = _3897;
    if (_3845)
    {
        _3887 = _3893;
    }
    float _3901 = _3887;
    float _3903 = _3901;
    if (!_3845)
    {
        _3895 = _3815;
    }
    float _3905 = _3895;
    if (_3845)
    {
        _3889 = _3817;
    }
    float _3907 = _3889;
    float _3909 = _3907;
    if (!_3845)
    {
        float _3911 = fma(_3721, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3817);
        _3909 = _3911;
    }
    float _3913 = _3909;
    float _3915 = _3913;
    if (_3845)
    {
        _3891 = _3897;
    }
    float _3917 = _3891;
    float _3919 = _3859 * _3905;
    float _3921 = _3841 * _3885;
    float _3923 = _3917;
    if (!_3845)
    {
        _3899 = _3819;
    }
    float _3925 = _3899;
    float _3927 = _3831 * _3885;
    float _3929 = _3853 * _3885;
    float _3931 = _3803 * _3921;
    if (!_3845)
    {
        float _3933 = fma(_3719, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3905);
        _3903 = _3933;
    }
    float _3935 = _3903;
    float _3937 = _3801 * _3927;
    float _3939 = -_3919;
    float _3941 = fma(_3855, _3925, _3939);
    float _3943 = _3857 * _3925;
    float _3945 = _3855 * _3817;
    float _3947 = -_3937;
    float _3949 = fma(_3803, _3929, _3947);
    float _3951 = -_3931;
    float _3953 = fma(_3799, _3927, _3951);
    if (!_3845)
    {
        float _3955 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3925);
        _3923 = _3955;
    }
    float _3957 = _3923;
    float _3959 = -_3943;
    float _3961 = fma(_3859, _3817, _3959);
    float _3963 = fma(_3773, _3785, _3879);
    float _3965 = -_3945;
    float _3967 = fma(_3857, _3905, _3965);
    float _3969 = _3949 * _3883;
    float _3971 = _3953 * _3883;
    float _3973 = _3941 * _3861;
    float _3975 = _3961 * _3861;
    float _3977 = _3799 * _3929;
    float _3979 = _3967 * _3861;
    float _3981 = fma(_3921, _3881, _3969);
    float _3983 = fma(_3929, _3881, _3971);
    float _3985 = -_3977;
    float _3987 = fma(_3801, _3921, _3985);
    float _3989 = _3761 * _3949;
    float _3991 = fma(_3799, _3963, _3981);
    float _3993 = fma(_3801, _3963, _3983);
    float _3995 = _3761 * _3987;
    float _3997 = _3761 * _3953;
    float _3999 = _2597 + _3991;
    float _4001 = _2813 + _3993;
    float _4003 = _3765 * _3949;
    float _4005 = _3765 * _3987;
    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4009 = _3999 + _4007;
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4013 = _4001 + _4011;
    float _4015 = _3765 * _3953;
    float _4017 = _3987 * _3883;
    float _4019 = _4009 * _4009;
    float _4021 = _4013 * _4013;
    float _4023 = _3757 * _3949;
    float _4025 = _3757 * _3953;
    float _4027 = _3757 * _3987;
    float _4029 = _4019 + _4021;
    float _4031 = fma(_3767, _3921, _3989);
    float _4033 = fma(_3767, _3927, _3995);
    float _4035 = fma(_3767, _3929, _3997);
    float _4037 = sqrt(_4029);
    float _4039 = fma(_3927, _3881, _4017);
    float _4041 = -_3705;
    float _4043 = fma(_4041, _3921, _4003);
    float _4045 = -_3705;
    float _4047 = fma(_4045, _3927, _4005);
    float _4049 = -_3705;
    float _4051 = fma(_4049, _3929, _4015);
    float _4053 = fma(_3771, _3921, _4023);
    float _4055 = fma(_3753, _3799, _4031);
    float _4057 = fma(_3753, _3803, _4033);
    float _4059 = fma(_3753, _3801, _4035);
    float _4061 = fma(_3803, _3963, _4039);
    float _4063 = fma(_3769, _3799, _4043);
    float _4065 = fma(_3769, _3803, _4047);
    float _4067 = fma(_3769, _3801, _4051);
    float _4069 = fma(_3771, _3929, _4025);
    float _4071 = fma(_3771, _3927, _4027);
    float _4073 = _2611 + _4061;
    bool _4075 = _4037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4077 = _4063 * _3857;
    float _4079 = _4065 * _3857;
    float _4081 = _4067 * _3857;
    float _4083 = fma(_3773, _3799, _4053);
    float _4085 = fma(_3773, _3801, _4069);
    float _4087 = fma(_3773, _3803, _4071);
    float _4089 = _4063 * _3913;
    float _4091 = _3973 * _4063;
    float _4093 = _4065 * _3913;
    float _4095 = _4067 * _3913;
    float _4097 = _3973 * _4065;
    float _4099 = _3973 * _4067;
    float _4101 = _3973;
    float _4103 = _4067;
    float _4105 = _3999;
    float _4107 = _4001;
    if (!_4075)
    {
        _3915 = _4021;
    }
    float _4109 = _3915;
    float _4111 = _4109;
    if (!_4075)
    {
        _4101 = _4019;
    }
    float _4113 = _4101;
    float _4115 = _4113;
    if (!_4075)
    {
        _4103 = _4073;
    }
    float _4117 = _4103;
    bool _4119 = !_4075;
    float _4121 = _4117;
    if (!_4119)
    {
        float _4123 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4127 = _4037 + _4125;
        float _4129 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4131 = rsqrt(_4029);
        float _4133 = _4127 * _4123;
        float _4135 = _4133 * 0.15915493667125701904296875;
        float _4137 = _4135 * 6.283185482025146484375;
        float _4139 = sin(_4137);
        float _4141 = _4135 * 6.283185482025146484375;
        float _4143 = cos(_4141);
        float _4145 = fma(_4139, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4147 = _4131 * _4145;
        float _4149 = _4143 + (-1.0);
        float _4151 = fma(_4009, _4147, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4153 = fma(_4013, _4147, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4155 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4159 = _4151 + _4157;
        float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4163 = _4153 + _4161;
        float _4165 = fma(_4073, _4143, _4155);
        float _4167 = _4159 * _4159;
        float _4169 = _4163 * _4163;
        _4121 = _4165;
        _4115 = _4167;
        _4111 = _4169;
        _4105 = _4151;
        _4107 = _4153;
    }
    float _4171 = _4121;
    float _4173 = _4115;
    float _4175 = _4111;
    float _4177 = _4105;
    float _4179 = _4107;
    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4183 = _4171 + _4181;
    float _4185 = fma(_4057, _3855, _4079);
    float _4187 = fma(_4057, _3935, _4093);
    float _4189 = fma(_4059, _3855, _4081);
    float _4191 = fma(_4183, _4183, _4173);
    float _4193 = fma(_4059, _3935, _4095);
    float _4195 = fma(_3975, _4057, _4097);
    float _4197 = fma(_3975, _4059, _4099);
    float _4199 = _4191 + _4175;
    float _4201 = fma(_4055, _3855, _4077);
    float _4203 = fma(_4055, _3935, _4089);
    float _4205 = fma(_3975, _4055, _4091);
    float _4207 = sqrt(_4199);
    float _4209 = fma(_4083, _3859, _4201);
    float _4211 = fma(_4087, _3859, _4185);
    float _4213 = fma(_4083, _3957, _4203);
    float _4215 = fma(_4085, _3859, _4189);
    float _4217 = fma(_3979, _4083, _4205);
    float _4219 = fma(_4087, _3957, _4187);
    float _4221 = fma(_3979, _4087, _4195);
    float _4223 = fma(_3979, _4085, _4197);
    float _4225 = fma(_4085, _3957, _4193);
    out.m_93.x = _4209;
    out.m_93.y = _4211;
    out.m_93.z = _4215;
    out.m_95.x = _4217;
    out.m_95.y = _4221;
    out.m_95.z = _4223;
    bool _4227 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4229 = isnan(_4207);
    bool _4231 = _4227 || _4229;
    bool _4233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4235 = _4231 || _4233;
    out.m_97.x = _4213;
    out.m_97.y = _4219;
    out.m_97.z = _4225;
    float _4237 = _4199;
    if (!_4235)
    {
        _4237 = 1.0;
    }
    float _4239 = _4237;
    bool _4241 = !_4235;
    float _4243 = _4239;
    if (!_4241)
    {
        bool _4245 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4247 = isnan(_4207);
        bool _4249 = _4245 || _4247;
        bool _4251 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4253 = _4249 || _4251;
        if (!_4253)
        {
            float _4255 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4257 = _4207 + _4255;
            float _4259 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4261 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4259;
            float _4263 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4265 = _4263 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4267 = 1.0 / _4261;
            float _4269 = _4257 * _4267;
            float _4271 = fma(_4269, _4265, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4243 = _4271;
            _4273 = true;
        }
        else
        {
            bool _4275 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4277 = isnan(_4207);
            bool _4279 = _4275 || _4277;
            bool _4281 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4283 = _4279 || _4281;
            if (!_4283)
            {
                float _4285 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4287 = _4207 + _4285;
                float _4289 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4291 = _4289 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4293 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4295 = _4293 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4297 = 1.0 / _4291;
                float _4299 = _4287 * _4297;
                float _4301 = fma(_4299, _4295, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4243 = _4301;
                _4273 = true;
            }
            else
            {
                _4243 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4273 = false;
    float _4303 = _4243;
    float _4305 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4307 = _4171 + _4305;
    float _4309 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4311 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4313 = _4177 + _4311;
    float _4315 = fma(_4307, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4317 = fma(_3609, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4309);
    float _4319 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4321 = _4179 + _4319;
    float _4323 = fma(_4313, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4325 = -_2611;
    float _4327 = _4325 + _4315;
    float _4329 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4317);
    float _4331 = fma(_4321, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4333 = -_2597;
    float _4335 = _4333 + _4323;
    float _4337 = _4327 * _4327;
    float _4339 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4341 = -_2813;
    float _4343 = _4341 + _4331;
    float _4345 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4347 = fma(_4335, _4335, _4337);
    float _4349 = 1.0 / _4339;
    float _4351 = fma(_3609, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4345);
    float _4353 = fma(_4343, _4343, _4347);
    float _4355 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4351);
    float _4357 = sqrt(_4353);
    float _4359 = _4355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4361 = _4359 + _4339;
    float _4363 = _4361 * _4349;
    float _4365 = _4363 * 0.5;
    bool _4367 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4369 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4371 = _4367 || _4369;
    bool _4373 = isnan(0.5);
    bool _4375 = _4371 || _4373;
    bool _4377 = _4357 > 0.0;
    float _4379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4381 = fma(_4365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4379);
    float _4383 = 1.0 / _4381;
    bool _4385 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4387 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4389 = _4385 || _4387;
    bool _4391 = isnan(0.5);
    bool _4393 = _4389 || _4391;
    float _4395 = _4321;
    float _4397 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4399 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4377)
    {
        _4395 = _4323;
    }
    float _4401 = _4395;
    float _4403 = _4401;
    float _4405 = _4401;
    if (!_4377)
    {
        _4397 = _4315;
    }
    float _4407 = _4397;
    float _4409 = _4407;
    float _4411 = _4407;
    if (!_4377)
    {
        _4399 = _4331;
    }
    float _4413 = _4399;
    bool _4415 = !_4377;
    float _4417 = _4413;
    if (!_4415)
    {
        float _4419 = _226 * _226;
        float _4421 = fma(_222, _222, _4419);
        float _4423 = fma(_228, _228, _4421);
        float _4425 = rsqrt(_4353);
        float _4427 = sqrt(_4423);
        float _4429 = _4335 * _4425;
        float _4431 = _4327 * _4425;
        float _4433 = _4343 * _4425;
        bool _4435 = _4427 > 0.0;
        float _4437 = _4427;
        if (!_4435)
        {
            _4403 = _4323;
        }
        float _4439 = _4403;
        _4405 = _4439;
        if (!_4435)
        {
            _4409 = _4315;
        }
        float _4441 = _4409;
        _4411 = _4441;
        if (!_4435)
        {
            _4437 = _4331;
        }
        float _4443 = _4437;
        bool _4445 = !_4435;
        _4417 = _4443;
        if (!_4445)
        {
            float _4447 = rsqrt(_4423);
            float _4449 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4451 = _226 * _4447;
            float _4453 = _222 * _4447;
            float _4455 = _228 * _4447;
            float _4457 = _4431 * _4451;
            float _4459 = fma(_4429, _4453, _4457);
            float _4461 = _4449 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4463 = fma(_4433, _4455, _4459);
            float _4465 = _4463 * _4461;
            float _4467 = fma(_222, _4465, _4323);
            float _4469 = fma(_226, _4465, _4315);
            float _4471 = fma(_228, _4465, _4331);
            _4405 = _4467;
            _4411 = _4469;
            _4417 = _4471;
        }
    }
    float _4473 = _4405;
    float _4475 = _4411;
    float _4477 = _4417;
    float _4479 = -_3057;
    float _4481 = fma(_4479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4473);
    float _4483 = -_3039;
    float _4485 = fma(_4483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4475);
    float _4487 = -_3035;
    float _4489 = fma(_4487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4477);
    float _4491 = _4485;
    float _4493 = _4481;
    float _4495 = _4489;
    if (_4375)
    {
        _232 = 1.0;
    }
    float _4497 = _232;
    float _4499 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4501 = _4383 * _4499;
    float _4503 = _4497;
    if (!_4393)
    {
        float _4505 = _3615 * _3615;
        float _4507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4509 = -_2813;
        float _4511 = _4509 + _4477;
        float _4513 = -_2597;
        float _4515 = _4513 + _4473;
        float _4517 = fma(_3623, _3623, _4505);
        float _4519 = fma(_3631, _3631, _4517);
        float _4521 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4523 = sqrt(_4519);
        float _4525 = 1.0 / _3741;
        float _4527 = _4521 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4529 = precise::min(_4523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4531 = _4529 * _4507;
        float _4533 = _4531 * _4525;
        float _4535 = -_2611;
        float _4537 = _4535 + _4475;
        float _4539 = _4527 * _4533;
        float _4541 = _4511 * _4533;
        float _4543 = fma(_4537, _4539, _3603);
        float _4545 = fma(_4515, _4539, _3609);
        float _4547 = fma(_4527, _4541, _3619);
        _4491 = _4543;
        _4493 = _4545;
        _4495 = _4547;
        _3677 = _4523;
    }
    float _4549 = _4491;
    float _4551 = _4493;
    float _4553 = _4495;
    float _4555 = _3677;
    float _4557 = _4555;
    if (!_4375)
    {
        float _4559 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4561 = _4559 * 0.15915493667125701904296875;
        float _4563 = _4561 * 6.283185482025146484375;
        float _4565 = cos(_4563);
        float _4567 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4569 = _4567 * 0.15915493667125701904296875;
        float _4571 = _4561 * 6.283185482025146484375;
        float _4573 = sin(_4571);
        float _4575 = 1.0 / _4565;
        float _4577 = _4569 * 6.283185482025146484375;
        float _4579 = cos(_4577);
        float _4581 = _4573 * _4575;
        float _4583 = _4569 * 6.283185482025146484375;
        float _4585 = sin(_4583);
        float _4587 = _4579 * _4581;
        float _4589 = 1.0 / _4587;
        float _4591 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4593 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4591;
        float _4595 = 1.0 / _4593;
        float _4597 = _4585 * _4589;
        float _4599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4601 = fma(_4501, _4597, _4599);
        float _4603 = _4601 * _4595;
        float _4605 = precise::clamp(_4603, 0.0, 1.0);
        _2911 = _4561;
        _4503 = _4605;
    }
    float _4607 = _2911;
    float _4609 = _4503;
    float _4611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4613 = _4549 + _4611;
    float _4615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4617 = _4551 + _4615;
    float _4619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4621 = _4553 + _4619;
    float _4623 = _4613 * _4613;
    float _4625 = fma(_4617, _4617, _4623);
    float _4627 = fma(_4621, _4621, _4625);
    float _4629 = rsqrt(_4627);
    float _4631 = sqrt(_4627);
    float _4633 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4635 = _4617 * _4633;
    float _4637 = _4621 * _4633;
    float _4639 = _4635 * _4635;
    float _4641 = _4637 * _4637;
    float _4643 = _4639 + _4641;
    float _4645 = sqrt(_4643);
    bool _4647 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4651 = _4645 + _4649;
    float _4653 = _4625;
    float _4655 = _4629;
    float _4657 = _4651;
    float _4659 = _4613;
    if (_4647)
    {
        float _4661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4653 = _4661;
    }
    float _4663 = _4653;
    if (_4647)
    {
        float _4665 = rsqrt(_4643);
        _4655 = _4665;
    }
    float _4667 = _4655;
    float _4669 = _4667;
    if (_4647)
    {
        float _4671 = _4651 * _4663;
        _4657 = _4671;
    }
    float _4673 = _4657;
    if (_4647)
    {
        float _4675 = _4673 * 0.15915493667125701904296875;
        _2913 = _4675;
    }
    float _4677 = _2913;
    float _4679 = _4621;
    if (_4647)
    {
        float _4681 = _4677 * 6.283185482025146484375;
        float _4683 = sin(_4681);
        _4679 = _4683;
    }
    float _4685 = _4679;
    float _4687 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4689 = precise::max(0.0, _4687);
    float _4691 = _4607;
    if (_4647)
    {
        float _4693 = _4677 * 6.283185482025146484375;
        float _4695 = cos(_4693);
        _4691 = _4695;
    }
    float _4697 = _4691;
    float _4699 = -_4633;
    float _4701 = -_4689;
    float _4703 = fma(_4613, _4699, _4701);
    float _4705 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4647)
    {
        float _4707 = _4703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4659 = _4707;
    }
    float _4709 = _4659;
    float _4711 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4713 = _4709;
    float _4715 = _4685;
    if (_4647)
    {
        float _4717 = fma(_4685, _4709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4713 = _4717;
    }
    float _4719 = _4713;
    float _4721 = _4719;
    if (!_4647)
    {
        _4715 = _4639;
    }
    float _4723 = _4715;
    float _4725 = _4723;
    if (_4647)
    {
        float _4727 = _4697 + (-1.0);
        _4705 = _4727;
    }
    float _4729 = _4705;
    float _4731 = _4729;
    if (_4647)
    {
        float _4733 = _4667 * _4719;
        _4557 = _4733;
    }
    float _4735 = _4557;
    if (!_4647)
    {
        _4669 = _4635;
    }
    float _4737 = _4669;
    float _4739 = _4737;
    if (_4647)
    {
        float _4741 = _4729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3679 = _4741;
    }
    float _4743 = _3679;
    float _4745 = _4743;
    if (_4647)
    {
        float _4747 = _4635 * _4735;
        _4739 = _4747;
    }
    float _4749 = _4739;
    if (!_4647)
    {
        _4721 = _4703;
    }
    float _4751 = _4721;
    float _4753 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4755 = _4751;
    if (!_4647)
    {
        _4731 = _4637;
    }
    float _4757 = _4731;
    float _4759 = _4757;
    if (_4647)
    {
        float _4761 = fma(_4703, _4697, _4743);
        _4755 = _4761;
    }
    float _4763 = _4755;
    if (_4647)
    {
        float _4765 = _4749 * _4749;
        _4725 = _4765;
    }
    float _4767 = _4725;
    if (_4647)
    {
        float _4769 = _4637 * _4735;
        _4759 = _4769;
    }
    float _4771 = _4759;
    if (!_4647)
    {
        _4745 = _4641;
    }
    float _4773 = _4745;
    float _4775 = floor(_4711);
    float _4777 = fma(_4763, _4763, _4767);
    float _4779 = _4773;
    if (_4647)
    {
        float _4781 = _4771 * _4771;
        _4779 = _4781;
    }
    float _4783 = _4779;
    float _4785 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4787 = _4777 + _4783;
    float _4789 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4785);
    float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4793 = fma(_4631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4791);
    float _4795 = precise::clamp(_4793, 0.0, 1.0);
    float _4797 = rsqrt(_4787);
    float _4799 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4789);
    float _4801 = -_4795;
    float _4803 = _4801 + 1.0;
    float _4805 = fma(_3619, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4807 = _4799 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4809 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4811 = floor(_4805);
    float _4813 = _4807 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4815 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4817 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4809);
    float _4819 = -_4813;
    float _4821 = fma(_4819, _4753, 1.0);
    float _4823 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4825 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4815);
    float _4827 = abs(_4803);
    float _4829 = log2(_4827);
    float _4831 = _4797 * _4749;
    float _4833 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4823);
    float _4835 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4825);
    float _4837 = _4797 * _4763;
    float _4839 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4841 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4833);
    float _4843 = _4835 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4845 = _4797 * _4771;
    float _4847 = -_4839;
    float _4849 = fma(_4837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4847);
    float _4851 = _4841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4853 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4855 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4817);
    float _4857 = -_4845;
    float _4859 = fma(_4857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4849);
    float _4861 = -_4775;
    float _4863 = _4711 + _4861;
    float _4865 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4853);
    float _4867 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4869 = _4855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4871 = fma(_4859, -0.5, 0.5);
    float _4873 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4865);
    float _4875 = log2(_4821);
    float _4877 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4879 = fma(_4859, 0.5, 0.5);
    float _4881 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4873);
    float _4883 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4885 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4877);
    float _4887 = -_4811;
    float _4889 = _4805 + _4887;
    float _4891 = fma(_4879, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4893 = exp2(_4867);
    float _4895 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4883);
    float _4897 = _4837 + 1.0;
    float _4899 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4885);
    float _4901 = fma(_4879, _4891, -0.212114393711090087890625);
    float _4903 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4895);
    float _4905 = 1.0 / _4881;
    float _4907 = fma(_4879, _4901, 1.570728778839111328125);
    float _4909 = _4875 * 0.693147182464599609375;
    float _4911 = sqrt(_4871);
    float _4913 = -_4837;
    float _4915 = fma(_4893, _4897, _4913);
    float _4917 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4903);
    float _4919 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4899);
    float2 _12729 = float2(_4863, _4889);
    float _4921 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12729, float2(0.0), isnan(_12729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12729, float2(0.0), isnan(_12729)), level(0.0)).x;
    float _4923 = _4909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4925 = _4917 * _4905;
    float _4927 = _4919 * _4905;
    float _4929 = fma(_4925, 0.5, 0.5);
    float _4931 = fma(_4927, -0.5, 0.5);
    float _4933 = _4911 * 0.636619746685028076171875;
    float3 _12757 = float3(_4929, _4931, _4923);
    float _4935 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12757, float3(0.0), isnan(_12757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12757, float3(0.0), isnan(_12757)), level(0.0)).x;
    float3 _12768 = float3(_4929, _4931, _4923);
    float4 _4938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12768, float3(0.0), isnan(_12768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12768, float3(0.0), isnan(_12768)), level(0.0)).xyzw;
    float _4940 = _4938.x;
    float _4942 = _4938.y;
    float _4944 = _4938.z;
    float _4946 = _4938.w;
    float _4948 = -_4907;
    float _4950 = fma(_4933, _4948, 1.0);
    float _4952 = fma(_4915, 0.5, 0.5);
    float2 _12791 = float2(_4950, _4952);
    float3 _4956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12791, float2(0.0), isnan(_12791)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12791, float2(0.0), isnan(_12791)), level(0.0)).xyz;
    float _4958 = _4956.x;
    float _4960 = _4956.y;
    float _4962 = _4956.z;
    float _4964 = abs(_4501);
    float _4966 = log2(_4964);
    float _4968 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4970 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4972 = _4917 + _4881;
    float _4974 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4968);
    float _4976 = _4881 * 0.5;
    bool _4978 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4980 = isnan(_4631);
    bool _4982 = _4978 || _4980;
    bool _4984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4986 = _4982 || _4984;
    float _4988 = _4972 * 0.5;
    float _4990 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4974);
    float _4992 = exp2(_4970);
    bool _4994 = _4501 <= 8000.0;
    bool _4996 = isnan(_4501);
    bool _4998 = _4994 || _4996;
    bool _5000 = isnan(8000.0);
    bool _5002 = _4998 || _5000;
    float _5004 = float(_5002);
    float _5006 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4990);
    float _5008 = _4966 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5010 = in.m_99.x;
    out.gl_Position.x = _4917;
    out.gl_Position.y = _4919;
    out.gl_Position.z = _5006;
    out.gl_Position.w = _4881;
    float _5012 = exp2(_5008);
    float _5014 = -_4992;
    float _5016 = _5014 + 1.0;
    float _5018 = _5016 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5020 = _4917;
    float _5022 = _4919;
    float _5024 = _4881;
    float _5026 = _5006;
    if (!_4986)
    {
        _5020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5028 = _5020;
    float _5030 = fma(_5012, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5032 = precise::clamp(_5030, 0.0, 1.0);
    float _5034 = fma(_4919, -0.5, _4976);
    float _5036 = fma(_5032, -2.0, 3.0);
    float _5038 = _5032 * _5032;
    float _5040 = _5028;
    float _5042 = _5028;
    if (!_4986)
    {
        _5022 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5044 = _5022;
    float _5046 = _5038 * _5036;
    float _5048 = -_5046;
    float _5050 = _5048 + 1.0;
    float _5052 = fma(_5050, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5046);
    float _5054 = _5006 + _4881;
    float _5056 = _5004 * _5052;
    float _5058 = _5054 * 0.5;
    float _5060 = _5044;
    float _5062 = _5044;
    if (!_4986)
    {
        _5024 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5064 = _5024;
    float _5066 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5068 = _5064;
    float _5070 = _5064;
    if (!_4986)
    {
        _5026 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5072 = _5026;
    out.m_101.x = _4988;
    out.m_101.y = _5034;
    out.m_101.z = _5058;
    out.m_101.w = _4881;
    float _5074 = -_4921;
    float _5076 = _5074 + 1.0;
    float _5078 = _5076 * _5066;
    float _5080 = precise::clamp(_5078, 0.0, 1.0);
    float _5082 = -_5080;
    float _5084 = fma(_5082, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5086 = _5084 * _5010;
    float _5088 = _5018 * _4935;
    float _5090 = -_5018;
    float _5092 = _5090 + 1.0;
    float _5094 = _4946 * _5088;
    float _5096 = _4946 * _5092;
    float _5098 = _4962 * _5088;
    float _5100 = fma(_4958, _5094, _4940);
    float _5102 = fma(_4960, _5094, _4942);
    float _5104 = _5086 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5106 = fma(_4946, _5098, _4944);
    float _5108 = _4609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5110 = _5086;
    float _5112 = _5094;
    float _5114 = _5072;
    float _5116 = _5072;
    if (!_4986)
    {
        _5110 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5118 = _5110;
    out.m_103.x = _5104;
    float _5120 = _5118;
    float _5122 = _5118;
    if (!_4986)
    {
        _5112 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5124 = _5112;
    out.m_105.x = _5100;
    out.m_105.y = _5102;
    out.m_105.z = _5106;
    out.m_105.w = _5096;
    bool _5126 = !_4986;
    float _5128 = _5124;
    float _5130 = _5124;
    if (!_5126)
    {
        bool _5132 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5134 = isnan(_4631);
        bool _5136 = _5132 || _5134;
        bool _5138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5140 = _5136 || _5138;
        if (!_5140)
        {
            float _5142 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5144 = _4631 + _5142;
            float _5146 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5148 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5146;
            float _5150 = 1.0 / _5148;
            float _5152 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5154 = _5152 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5156 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5158 = _5156 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5160 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5162 = _5160 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5164 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5166 = _5164 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5168 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5170 = _5168 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5172 = _5144 * _5150;
            float _5174 = precise::clamp(_5172, 0.0, 1.0);
            float _5176 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5178 = _5176 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5180 = fma(_5174, _5158, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5182 = fma(_5174, _5178, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5184 = fma(_5174, _5154, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5186 = fma(_5174, _5162, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5188 = fma(_5174, _5166, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5190 = fma(_5174, _5170, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5062 = _5184;
            _5130 = _5188;
            _5116 = _5182;
            _5122 = _5186;
            _5042 = _5180;
            _5070 = _5190;
            _5192 = true;
        }
        else
        {
            bool _5194 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5196 = isnan(_4631);
            bool _5198 = _5194 || _5196;
            bool _5200 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5202 = _5198 || _5200;
            if (!_5202)
            {
                _5120 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5204 = _5120;
            _5122 = _5204;
            if (!_5202)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5206 = _5128;
            _5130 = _5206;
            if (!_5202)
            {
                _5068 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5208 = _5068;
            _5070 = _5208;
            if (!_5202)
            {
                _5114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5210 = _5114;
            _5116 = _5210;
            if (!_5202)
            {
                _5060 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5212 = _5060;
            _5062 = _5212;
            if (!_5202)
            {
                _5040 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5214 = _5040;
            bool _5216 = !_5202;
            _5042 = _5214;
            if (!_5216)
            {
                bool _5218 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5220 = isnan(_4631);
                bool _5222 = _5218 || _5220;
                bool _5224 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5226 = _5222 || _5224;
                if (!_5226)
                {
                    float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5230 = _4631 + _5228;
                    float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5234 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5232;
                    float _5236 = 1.0 / _5234;
                    float _5238 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5240 = _5238 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5242 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5244 = _5242 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5246 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5248 = _5246 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5250 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5252 = _5250 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5254 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5256 = _5254 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5258 = _5230 * _5236;
                    float _5260 = precise::clamp(_5258, 0.0, 1.0);
                    float _5262 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5264 = _5262 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5266 = fma(_5260, _5244, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5268 = fma(_5260, _5264, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5270 = fma(_5260, _5240, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5272 = fma(_5260, _5248, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5274 = fma(_5260, _5252, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5276 = fma(_5260, _5256, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5062 = _5270;
                    _5130 = _5274;
                    _5116 = _5268;
                    _5122 = _5272;
                    _5042 = _5266;
                    _5070 = _5276;
                    _5192 = true;
                }
                else
                {
                    _5062 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5122 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5042 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5070 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5192 = false;
    float _5278 = _5062;
    float _5280 = _5130;
    float _5282 = _5116;
    float _5284 = _5122;
    float _5286 = _5042;
    float _5288 = _5070;
    float _5290 = _5108 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5292 = fma(_4219, -0.5, 0.5);
    float _5294 = precise::clamp(_5292, 0.0, 1.0);
    float _5296 = -_5278;
    float _5298 = _5280 + _5296;
    float _5300 = -_5282;
    float _5302 = _5284 + _5300;
    out.m_55.x = _5290;
    float _5304 = fma(_5294, _5298, _5278);
    float _5306 = -_5286;
    float _5308 = _5288 + _5306;
    float _5310 = fma(_5294, _5302, _5282);
    float _5312 = _5304 * 0.586610972881317138671875;
    bool _5314 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5316 = fma(_5294, _5308, _5286);
    out.m_107.x = 0.0;
    float _5318 = fma(_5310, 0.298911988735198974609375, _5312);
    bool _5320 = _4609 > 0.0;
    bool _5322 = isnan(_4609);
    bool _5324 = _5320 || _5322;
    bool _5326 = isnan(0.0);
    bool _5328 = _5324 || _5326;
    float _5330 = fma(_5316, 0.114477999508380889892578125, _5318);
    float _5332 = -_5330;
    float _5334 = _5310 + _5332;
    float _5336 = -_5330;
    float _5338 = _5304 + _5336;
    float _5340 = -_5330;
    float _5342 = _5316 + _5340;
    float _5344 = fma(_5334, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    float _5346 = fma(_5338, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    float _5348 = fma(_5342, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    bool _5350 = !_5314;
    if (!_5350)
    {
        float _5352 = -_4549;
        float _5354 = _5352 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5356 = -_4551;
        float _5358 = _5356 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5360 = -_4553;
        float _5362 = _5360 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5364 = _5354 * _5354;
        float _5366 = fma(_5358, _5358, _5364);
        float _5368 = fma(_5362, _5362, _5366);
        float _5370 = sqrt(_5368);
        float _5372 = rsqrt(_5368);
        float _5374 = -_5370;
        float _5376 = _5374 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5378 = _5376 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5380 = precise::clamp(_5378, 0.0, 1.0);
        float _5382 = _5358 * _5372;
        float _5384 = _5354 * _5372;
        float _5386 = abs(_5380);
        float _5388 = log2(_5386);
        float _5390 = _5362 * _5372;
        float _5392 = _5382 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5394 = _4219 * _5384;
        float _5396 = -_5384;
        float _5398 = -_5392;
        float _5400 = fma(_5396, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5398);
        float _5402 = fma(_4213, _5382, _5394);
        float _5404 = -_5390;
        float _5406 = fma(_5404, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5400);
        float _5408 = fma(_4225, _5390, _5402);
        float _5410 = precise::clamp(_5408, 0.0, 1.0);
        float _5412 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5414 = _5406 + _5412;
        float _5416 = _5388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5418 = _5414 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5420 = precise::clamp(_5418, 0.0, 1.0);
        float _5422 = exp2(_5416);
        float _5424 = _5422 * _5420;
        float _5426 = _5410 * _5424;
        float _5428 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5430 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5432 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _5428;
        out.m_107.y = _5430;
        out.m_107.z = _5432;
    }
    out.m_109.x = _5344;
    out.m_109.y = _5346;
    out.m_109.z = _5348;
    if (_5328)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_55.x = 0.0;
    float _5434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5434;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5192 = false;
    bool _4273 = false;
    bool _714 = false;
    bool _528 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_48.w;
    float _125 = in.m_50.w;
    float _127 = trunc(_123);
    int _130 = int(_127);
    float _132 = -_125;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _134;
    bool _138 = _130 >= 1;
    float _140 = 0.0;
    float _142 = _125;
    float _144 = _134;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _140;
    if (!_138)
    {
        out.m_55.x = 0.0;
    }
    int _148 = 0;
    if (!_138)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    int _154 = _152;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5502 = as_type<float>(_152);
        out.gl_Position.z = _5502;
    }
    if (!_138)
    {
        return out;
    }
    bool _156 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_125);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = float(_130);
    bool _168 = _134 >= _166;
    bool _170 = !_164;
    bool _172 = _168 || _170;
    float _174 = 1.0 / _166;
    if (_172)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _142;
    if (_172)
    {
        out.m_55.x = 0.0;
    }
    float _178 = _134 * _174;
    float _180 = _178;
    if (_172)
    {
        float _182 = _176 * 5.0;
        _154 = as_type<int>(_182);
    }
    int _184 = _154;
    out.m_53.x = _178;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5565 = as_type<float>(_184);
        out.gl_Position.z = _5565;
    }
    if (_172)
    {
        return out;
    }
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = _188 * _196;
    float _214 = _188 * _202;
    float _216 = fma(_186, _194, _212);
    float _218 = _188 * _208;
    float _220 = fma(_186, _200, _214);
    float _222 = fma(_190, _198, _216);
    float _224 = fma(_186, _206, _218);
    float _226 = fma(_190, _204, _220);
    float _228 = fma(_190, _210, _224);
    bool _230 = !_192;
    float _232 = _228;
    float _250;
    if (!_230)
    {
        float _234 = in.m_65.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        _250 = _178;
    }
    _252 = false;
    float _254 = _250;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = _254 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = _254 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _254 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = 1.0 / _274;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _278;
    bool _290 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_254);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = 1.0 / _270;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _254 + _304;
    float _308 = _306 * _284;
    bool _310 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _312 = isnan(_254);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _282;
    float _324 = _258 * _288;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = _262 * _302;
    bool _336 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_254);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_320;
    float _350 = _348 + 1.0;
    float _352 = fma(_332, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = fma(_328, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _346 * _350;
    float _358 = -_346;
    float _360 = _358 + 1.0;
    float _362 = _266 * _322;
    bool _364 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_254);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    bool _380 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_254);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = fma(_378, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_374;
    float _400 = _398 + 1.0;
    float _402 = _374 * _360;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = _300 * _400;
    float _414 = -_300;
    float _416 = _414 + 1.0;
    float _418 = fma(_394, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_406, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = _390 * _416;
    float _426 = -_390;
    float _428 = _426 + 1.0;
    float _430 = _352 * _424;
    float _432 = _354 * _424;
    float _434 = _396 * _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].x, _430);
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].y, _432);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].z, _434);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _450;
    float _454 = fma(_418, _412, _440);
    float _456 = fma(_420, _412, _442);
    float _458 = fma(_422, _412, _444);
    float _460 = fma(_438, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _462 = fma(_448, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_452, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _478 = fma(_460, _402, _454);
    float _480 = fma(_468, _308, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _482 = fma(_472, _308, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _484 = fma(_476, _308, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _486 = fma(_462, _402, _456);
    float _488 = fma(_464, _402, _458);
    float _490 = fma(_480, _356, _478);
    float _492 = fma(_482, _356, _486);
    float _494 = fma(_484, _356, _488);
    float _496 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].x, _490);
    float _498 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].y, _492);
    float _500 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].z, _494);
    bool _502 = !_286;
    int _504 = as_type<int>(_500);
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _508 = _334;
    float _526;
    if (!_502)
    {
        float _510 = in.m_65.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        _526 = _178;
    }
    _528 = false;
    float _530 = _526;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _530 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _546 = isnan(_530);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _562 = isnan(_530);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _538;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_554;
    float _580 = _578 + 1.0;
    bool _582 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _584 = isnan(_530);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = 1.0 / _542;
    float _598 = 1.0 / _558;
    float _600 = _576 * _572;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = _570 * _580;
    float _608 = -_570;
    float _610 = _608 + 1.0;
    float _612 = fma(_600, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _614;
    float _618 = _592 * _610;
    float _620 = _604 * _596;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _624 = _530 + _622;
    bool _626 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _628 = isnan(_530);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _612 * _618;
    float _640 = -_592;
    float _642 = _640 + 1.0;
    float _644 = fma(_620, _624, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _648 = _530 + _646;
    float _650 = _616 * _598;
    float _652 = -_636;
    float _654 = _652 + 1.0;
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[115].x, _638);
    float _658 = in.m_67.x;
    float _660 = in.m_67.y;
    float _662 = in.m_67.z;
    float _664 = fma(_650, _648, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _666 = _554 * _654;
    float _668 = fma(_644, _606, _656);
    float _670 = fma(_664, _666, _668);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _674 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[118].x, _670);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _680 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _682 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _680;
    out.m_69.y = _684;
    out.m_69.z = _686;
    out.m_69.w = _682;
    float _688 = _500 * _662;
    float _690 = _498 * _660;
    float _692 = _496 * _658;
    bool _694 = !_594;
    float _712;
    if (!_694)
    {
        float _696 = in.m_65.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _178;
    }
    _714 = false;
    float _716 = _712;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _720 = _716 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _728 = isnan(_716);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _742 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _744 = isnan(_716);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _754;
    bool _758 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _760 = isnan(_716);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = 1.0 / _724;
    float _772 = -_736;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _716 + _776;
    bool _780 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _782 = 1.0 / _740;
    float _784 = _756 * _770;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _790 = -_768;
    float _792 = _790 + 1.0;
    float _794 = fma(_784, _720, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _796 = _752 * _774;
    float _798 = -_752;
    float _800 = _798 + 1.0;
    float _802 = _736 * _792;
    float _804 = _788 * _782;
    float _806 = _794 * _796;
    float _808 = fma(_804, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[131].x, _806);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _814 = fma(_808, _802, _810);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _818 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[133].x, _814);
    float _824 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _824;
    out.m_71.y = _826;
    out.m_71.z = _818;
    out.m_71.w = _828;
    bool _830 = !_780;
    if (!_830)
    {
        float _832 = in.m_65.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _180 = _846;
    }
    float _848 = _180;
    float _850 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _852 = int(_850);
    float _854 = in.m_65.y;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _858 = _856 != 0;
    float _860 = in.m_73.x;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _864 = _862 != 0;
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _868 = int(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _872 = _870 != 0;
    float _874 = in.m_65.w;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _880 = _878 != 0;
    float _882 = float(_852);
    float _884 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _886 = int(_884);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _890 = _888 != 0;
    float _892 = 0.0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_864)
    {
        _892 = 1.0;
    }
    float _896 = _892;
    float _898 = _828;
    float _900 = _896;
    if (_858)
    {
        float _902 = in.m_65.x;
        _898 = _902;
    }
    float _904 = _898;
    float _906 = 0.0;
    if (_864)
    {
        _906 = 1.0;
    }
    float _908 = _906;
    float _910 = float(_868);
    float _912 = 1.0 / _882;
    int _914 = 0;
    float _916 = _908;
    if (_864)
    {
        _914 = 0;
    }
    int _918 = _914;
    int _920 = _918;
    if (_864)
    {
        _894 = 0;
    }
    int _922 = _894;
    float _924 = 0.0;
    int _926 = _922;
    float _928 = _860;
    if (!_858)
    {
        _924 = _860;
    }
    float _930 = _924;
    float _932 = _736;
    float _934 = _930;
    if (_872)
    {
        float _936 = in.m_65.z;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = 0.0;
    if (!_872)
    {
        _940 = _860;
    }
    float _942 = _940;
    float _944 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _946 = int(_944);
    int _948 = ~_886;
    int _950 = _948 + 1;
    float _952 = _942;
    if (_872)
    {
        float _954 = -_860;
        float _956 = _954 + 1.0;
        _504 = as_type<int>(_956);
    }
    int _958 = _504;
    bool _960 = _874 > 0.5;
    float _962 = _912 * _134;
    float _964 = 1.0 / _910;
    bool _966 = false;
    float _968 = _874;
    if (_858)
    {
        bool _970 = _904 > 0.5;
        _966 = _970;
    }
    bool _972 = _966;
    float _974 = float(_946);
    float _976 = trunc(_962);
    int _978 = int(_976);
    float _980 = float(uint(_886));
    float _982 = as_type<float>(_946);
    int _984 = as_type<int>(_974);
    if (_864)
    {
        float _986 = in.m_65.x;
        _982 = _986;
    }
    float _988 = _982;
    bool _990 = false;
    float _992 = _938;
    if (_872)
    {
        bool _994 = _938 > 0.5;
        _990 = _994;
    }
    bool _996 = _990;
    float _998 = 1.0 / _980;
    float _1000 = _964 * _134;
    float _1002 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1004 = int(_1002);
    float _1006 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = float(uint(_978));
    float _1010 = fma(_1006, -2.0, _876);
    float _1012 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1014 = int(_1012);
    int _1016 = as_type<int>(_998) + (-2);
    float _1018 = _1008;
    float _1020 = _988;
    if (_864)
    {
        _968 = _988;
    }
    float _1022 = _968;
    float _1024 = as_type<float>(_1016) * _1008;
    float _1026 = _1022;
    if (_864)
    {
        _1018 = _854;
    }
    float _1028 = _1018;
    float _1030 = trunc(_1000);
    int _1032 = int(_1030);
    float _1034 = float(uint(_1004));
    float _1036 = _1028;
    if (_864)
    {
        _992 = _1022;
    }
    float _1038 = _992;
    float _1040 = float(uint(_1014));
    float _1042 = 1.0 / _1034;
    float _1044 = 1.0 / _1040;
    float _1046 = trunc(_1024);
    float _1048 = precise::max(_1046, 0.0);
    uint _1051 = uint(_1048);
    float _1053 = 1.0 / _974;
    float _1055 = _1038;
    if (_858)
    {
        float _1057 = -_860;
        float _1059 = _1057 + 1.0;
        _984 = as_type<int>(_1059);
    }
    int _1061 = _984;
    float _1063 = as_type<float>(_1061);
    if (_858)
    {
        float _1065 = _972 ? as_type<float>(_1061) : _860;
        _934 = _1065;
    }
    float _1067 = _934;
    if (_864)
    {
        _1063 = _1022;
    }
    float _1069 = _1063;
    float _1071 = _1069;
    if (!_864)
    {
        float _1073 = in.m_65.x;
        float _1075 = _854 * 3.1415927410125732421875;
        float _1077 = in.m_65.z;
        float _1079 = _1075 * 0.15915493667125701904296875;
        float _1081 = _1079 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1073 * 3.1415927410125732421875;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = _1087 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        _1020 = _1073;
        _900 = 7.345489978790283203125;
        _1071 = _1077;
        _916 = 5.839270114898681640625;
        _1036 = _1083;
        _1026 = _854;
        _1055 = _1091;
        _920 = 1;
        _926 = 2;
    }
    float _1093 = _1020;
    float _1095 = _900;
    float _1097 = _1071;
    float _1099 = _916;
    float _1101 = _1036;
    float _1103 = _1026;
    float _1105 = _1055;
    int _1107 = _920;
    int _1109 = _926;
    int _1111 = _950 * int(_1051);
    int _1113 = _1111 + _978;
    int _1115 = as_type<int>(_1097);
    if (_880)
    {
        float _1117 = -_860;
        float _1119 = _1117 + 1.0;
        _506 = as_type<int>(_1119);
    }
    int _1121 = _506;
    if (_872)
    {
        float _1123 = _996 ? as_type<float>(_958) : _860;
        _952 = _1123;
    }
    float _1125 = _952;
    float _1127 = _1093 * _1095;
    float _1129 = float(uint(_1113));
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1133 = _854 > 0.5;
    float _1135 = _1053 * _134;
    float _1137 = _1097 * _1099;
    float _1139 = as_type<float>(_1016) * _1129;
    float _1141 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1131);
    float _1143 = _1103 * _1095;
    float _1145 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _1147 = as_type<int>(_1042) + (-2);
    float _1149 = trunc(_1139);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    float _1155 = float(uint(_1032));
    float _1157 = in.m_73.y;
    if (!_880)
    {
        _508 = _860;
    }
    float _1159 = _508;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1163 = _1159;
    if (_880)
    {
        float _1165 = _1133 ? as_type<float>(_1121) : _860;
        _1163 = _1165;
    }
    float _1167 = _1163;
    float _1169 = as_type<float>(_1147) * _1155;
    float _1171 = floor(_1127);
    float _1173 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1161);
    if (_890)
    {
        float _1175 = -_860;
        float _1177 = _1175 + 1.0;
        _1115 = as_type<int>(_1177);
    }
    int _1179 = _1115;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1183 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1187 = floor(_1137);
    int _1189 = int(_1051) + int(_1153);
    float _1191 = -_1181;
    float _1193 = fma(_1183, 2.0, _1191);
    float _1195 = fma(_1145, -2.0, _1185);
    if (_890)
    {
        float _1197 = _1133 ? as_type<float>(_1179) : _860;
        _928 = _1197;
    }
    float _1199 = _928;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1203 = ~_886;
    int _1205 = _1203 + 1;
    float _1207 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1209 = floor(_1143);
    float _1211 = in.m_65.z;
    float _1213 = -_1171;
    float _1215 = _1127 + _1213;
    float _1217 = -_1201;
    float _1219 = fma(_1207, 2.0, _1217);
    int _1221 = _1205 * _1189;
    int _1223 = _1221 + _978;
    int _1225 = as_type<int>(_1044) + (-2);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1229 = _1227 != 0;
    float _1231 = float(_886);
    float _1233 = trunc(_1135);
    int _1235 = int(_1233);
    float _1237 = -_1187;
    float _1239 = _1137 + _1237;
    bool _1241 = uint(_1223) >= uint(_886);
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1245 = _1243 != 0;
    int _1247 = ~_1014;
    int _1249 = _1247 + 1;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1169);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = -_1209;
    float _1267 = _1143 + _1265;
    int _1269 = ~_1004;
    int _1271 = _1269 + 1;
    float _1273 = _1093 * 2.0;
    float _1275 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    float _1277 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1141);
    float _1279 = float(uint(_1235));
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1283 = float(_978);
    float _1285 = floor(_1273);
    bool _1287 = _1211 > 0.5;
    float _1289 = as_type<float>(_1225) * _1279;
    float _1291 = -_1157;
    float _1293 = _1291 + 1.0;
    bool _1295 = _1283 >= _1231;
    bool _1297 = isnan(_1283);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(_1231);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    int _1307 = _1271 * int(_1263);
    int _1309 = _1307 + _1032;
    float _1311 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1173);
    float _1313 = trunc(_1289);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    int _1319 = _960 ? as_type<int>(_1293) : as_type<int>(_1157);
    float _1321 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1195);
    float _1323 = float(uint(_1309));
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1327 = _1133 ? as_type<int>(_1293) : as_type<int>(_1157);
    float _1329 = -_134;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1219);
    float _1333 = trunc(_1305);
    int _1335 = int(_1333);
    float _1337 = as_type<float>(_1147) * _1323;
    int _1339 = _1287 ? as_type<int>(_1293) : as_type<int>(_1157);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1343 = _1341 != 0;
    float _1345 = _1229 ? as_type<float>(_1327) : _1157;
    float _1347 = in.m_59.w;
    bool _1349 = !_1343;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = trunc(_1337);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    int _1359 = _1249 * int(_1317);
    int _1361 = _1359 + _1235;
    bool _1363 = !_1241;
    int _1365 = _1363 ? 0 : (-1);
    bool _1367 = _1107 != 1;
    float _1369 = _1253 ? as_type<float>(_1319) : _1157;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1373 = _1371 != 0;
    float _1375 = _1245 ? as_type<float>(_1339) : _1157;
    float _1377 = _1257 ? as_type<float>(_1339) : _1157;
    float _1379 = float(uint(_1361));
    int _1381 = ~_1189;
    int _1383 = _1381 + _1365;
    int _1385 = _1383 + 1;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1389 = _1387 != 0;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1393 = _1391 != 0;
    float _1395 = as_type<float>(_1225) * _1379;
    int _1397 = int(_1263) + int(_1357);
    float _1399 = _1231 * _1239;
    bool _1401 = _886 == 0;
    int _1403 = _886 * _1385;
    int _1405 = _1403 + _978;
    float _1407 = _174 * _134;
    float _1409 = trunc(_1395);
    float _1411 = precise::max(_1409, 0.0);
    uint _1413 = uint(_1411);
    bool _1415 = !_1393;
    int _1417 = _1415 ? 0 : 1;
    bool _1419 = !_1389;
    int _1421 = _1419 ? 0 : 1;
    float _1423 = _1231 * _1407;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1431 = _1429 != 0;
    int _1433 = ~_1335;
    int _1435 = _1433 + 1;
    int _1437 = _1435 + 1;
    float _1439 = trunc(_1399);
    int _1441 = int(_1439);
    bool _1443 = !_1401;
    int _1445 = _1443 ? _1405 : (-1);
    int _1447 = _886 + (-1);
    bool _1449 = !_1431;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1445 * _1437;
    bool _1455 = !_1427;
    int _1457 = _1455 ? 0 : 1;
    float _1459 = trunc(_1423);
    int _1461 = int(_1459);
    int _1463 = abs(_1451);
    int _1465 = _1335 * _1447;
    int _1467 = _1465 + _1453;
    int _1469 = ~_1004;
    int _1471 = _1469 + 1;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1475 = _1473 != 0;
    int _1477 = _1471 * _1397;
    int _1479 = _1477 + _1032;
    int _1481 = int(_1317) + int(_1413);
    int _1483 = abs(_1457);
    int _1485 = _1467 * _1463;
    bool _1487 = !_1475;
    int _1489 = _1487 ? 0 : 1;
    int _1491 = ~_1014;
    int _1493 = _1491 + 1;
    int _1495 = abs(_1351);
    int _1497 = abs(_1489);
    bool _1499 = uint(_1479) >= uint(_1004);
    int _1501 = _1461 * _1483;
    int _1503 = _1501 + _1485;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1507 = _1505 != 0;
    int _1509 = _1493 * _1481;
    int _1511 = _1509 + _1235;
    int _1513 = _1441 * _1495;
    int _1515 = _1513 + _978;
    float _1517 = float(_1004);
    float _1519 = float(_1032);
    bool _1521 = !_1507;
    int _1523 = _1521 ? 0 : 1;
    bool _1525 = uint(_1511) >= uint(_1014);
    int _1527 = _1515 * _1497;
    int _1529 = _1527 + _1503;
    bool _1531 = _1519 >= _1517;
    bool _1533 = isnan(_1519);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(_1517);
    bool _1539 = _1535 || _1537;
    float _1541 = float(_1539);
    int _1543 = abs(_1523);
    bool _1545 = !_1499;
    int _1547 = _1545 ? 0 : (-1);
    int _1549 = _1441 * _1543;
    int _1551 = _1549 + _1529;
    int _1553 = ~_1397;
    int _1555 = _1553 + _1547;
    int _1557 = _1555 + 1;
    float _1559 = trunc(_1541);
    int _1561 = int(_1559);
    float _1563 = float(_1014);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1567 = float(_1235);
    int _1569 = _1004 * _1557;
    int _1571 = _1569 + _1032;
    float _1573 = _1563 * _1407;
    bool _1575 = _1567 >= _1563;
    bool _1577 = isnan(_1567);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(_1563);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = _1517 * _1215;
    float _1589 = _1517 * _1407;
    float _1591 = float(uint(_1551));
    float _1593 = _1563 * _1267;
    int _1595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1597 = _1595 != 0;
    float _1599 = trunc(_1585);
    int _1601 = int(_1599);
    bool _1603 = !_1525;
    int _1605 = _1603 ? 0 : (-1);
    float _1607 = as_type<float>(_1016) * _1591;
    bool _1609 = !_1597;
    int _1611 = _1609 ? 0 : 1;
    bool _1613 = _1004 == 0;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1617 = _1615 != 0;
    float _1619 = _1215;
    if (!_1367)
    {
        _1619 = _854;
    }
    float _1621 = _1619;
    float _1623 = trunc(_1587);
    int _1625 = int(_1623);
    float _1627 = _1621;
    if (_1367)
    {
        _1627 = _1093;
    }
    float _1629 = _1627;
    int _1631 = ~_1481;
    int _1633 = _1631 + _1605;
    int _1635 = _1633 + 1;
    int _1637 = ~_1561;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1565);
    bool _1645 = !_1613;
    int _1647 = _1645 ? _1571 : (-1);
    float _1649 = trunc(_1607);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    int _1655 = abs(_1611);
    int _1657 = _1014 * _1635;
    int _1659 = _1657 + _1235;
    bool _1661 = _1014 == 0;
    int _1663 = _1647 * _1641;
    int _1665 = ~_886;
    int _1667 = _1665 + 1;
    bool _1669 = !_1617;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1004 + (-1);
    int _1675 = _1625 * _1655;
    int _1677 = _1675 + _1032;
    int _1679 = ~_1601;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = trunc(_1589);
    int _1687 = int(_1685);
    bool _1689 = !_1661;
    int _1691 = _1689 ? _1659 : (-1);
    int _1693 = _1561 * _1673;
    int _1695 = _1693 + _1663;
    bool _1697 = _1109 != 2;
    int _1699 = _1014 + (-1);
    int _1701 = _1691 * _1683;
    int _1703 = abs(_1417);
    int _1705 = _1667 * int(_1653);
    int _1707 = _1705 + _1551;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1711 = _1709 != 0;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1715 = _1713 != 0;
    int _1717 = _1601 * _1699;
    int _1719 = _1717 + _1701;
    float _1721 = trunc(_1593);
    int _1723 = int(_1721);
    int _1725 = abs(_1671);
    float _1727 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1643);
    float _1729 = float(uint(_1707));
    int _1731 = _1695 * _1703;
    bool _1733 = !_1715;
    int _1735 = _1733 ? 0 : 1;
    bool _1737 = !_1373;
    int _1739 = _1737 ? 0 : 1;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1743 = _1741 != 0;
    float _1745 = as_type<float>(_1016) * _1729;
    float _1747 = trunc(_1573);
    int _1749 = int(_1747);
    int _1751 = abs(_1735);
    bool _1753 = !_1711;
    int _1755 = _1753 ? 0 : 1;
    int _1757 = abs(_1421);
    int _1759 = _1719 * _1751;
    bool _1761 = !_1743;
    int _1763 = _1761 ? 0 : 1;
    float _1765 = trunc(_1745);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    int _1771 = abs(_1755);
    int _1773 = _1687 * _1757;
    int _1775 = _1773 + _1731;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1779 = _1777 != 0;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1783 = _1781 != 0;
    int _1785 = abs(_1763);
    int _1787 = _1723 * _1725;
    int _1789 = _1787 + _1235;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1793 = _1791 != 0;
    int _1795 = _1677 * _1785;
    int _1797 = _1795 + _1775;
    bool _1799 = !_1779;
    int _1801 = _1799 ? 0 : 1;
    bool _1803 = !_1793;
    int _1805 = _1803 ? 0 : 1;
    int _1807 = _1749 * _1771;
    int _1809 = _1807 + _1759;
    int _1811 = int(_1653) + int(_1769);
    float _1813 = float(uint(_1515));
    bool _1815 = !_1783;
    int _1817 = _1815 ? 0 : 1;
    int _1819 = abs(_1801);
    float _1821 = as_type<float>(_1016) * _1813;
    int _1823 = abs(_1805);
    int _1825 = abs(_1817);
    float _1827 = trunc(_1821);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    int _1833 = ~_886;
    int _1835 = _1833 + 1;
    int _1837 = _1625 * _1823;
    int _1839 = _1837 + _1797;
    int _1841 = _1835 * _1811;
    int _1843 = _1841 + _1551;
    int _1845 = ~_886;
    int _1847 = _1845 + 1;
    int _1849 = _1789 * _1819;
    int _1851 = _1849 + _1809;
    float _1853 = float(uint(_1839));
    bool _1855 = uint(_1843) >= uint(_886);
    int _1857 = _1723 * _1825;
    int _1859 = _1857 + _1851;
    float _1861 = float(uint(_1677));
    float _1863 = as_type<float>(_1147) * _1853;
    bool _1865 = !_1855;
    int _1867 = _1865 ? 0 : (-1);
    int _1869 = _1847 * int(_1831);
    int _1871 = _1869 + _1515;
    float _1873 = float(uint(_1859));
    float _1875 = as_type<float>(_1147) * _1861;
    int _1877 = ~_1811;
    int _1879 = _1877 + _1867;
    int _1881 = _1879 + 1;
    float _1883 = trunc(_1863);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = float(uint(_1871));
    float _1891 = as_type<float>(_1225) * _1873;
    int _1893 = ~_1004;
    int _1895 = _1893 + 1;
    int _1897 = _886 * _1881;
    int _1899 = _1897 + _1551;
    float _1901 = float(uint(_1789));
    float _1903 = as_type<float>(_1016) * _1889;
    float _1905 = trunc(_1891);
    float _1907 = precise::max(_1905, 0.0);
    uint _1909 = uint(_1907);
    float _1911 = as_type<float>(_1723);
    float _1913 = as_type<float>(_1895);
    if (!_1367)
    {
        _1911 = _1211;
    }
    float _1915 = _1911;
    float _1917 = as_type<float>(_1225) * _1901;
    bool _1919 = !_1401;
    int _1921 = _1919 ? _1899 : (-1);
    float _1923 = _1915;
    if (_1367)
    {
        _1923 = _854;
    }
    float _1925 = _1923;
    int _1927 = _1921 & 3;
    bool _1929 = _1927 != 0;
    float _1931 = trunc(_1875);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    int _1937 = _1895 * int(_1887);
    int _1939 = _1937 + _1839;
    int _1941 = ~_1014;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1281);
    int _1947 = _1921 & 3;
    bool _1949 = _1947 != 0;
    float _1951 = float(uint(_1939));
    float _1953 = trunc(_1917);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    int _1959 = _1943 * int(_1909);
    int _1961 = _1959 + _1859;
    if (!_1367)
    {
        _1913 = _854;
    }
    float _1963 = _1913;
    float _1965 = as_type<float>(_1147) * _1951;
    float _1967 = _1963;
    if (_1367)
    {
        _1967 = _1093;
    }
    float _1969 = _1967;
    int _1971 = _1929 ? 0 : 1;
    int _1973 = _1895 * int(_1935);
    int _1975 = _1973 + _1677;
    bool _1977 = uint(_1947) > 1u;
    float _1979 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1981 = ~_1014;
    int _1983 = _1981 + 1;
    float _1985 = trunc(_1965);
    float _1987 = precise::max(_1985, 0.0);
    uint _1989 = uint(_1987);
    float _1991 = float(uint(_1961));
    float _1993 = -_1325;
    float _1995 = fma(_1979, 2.0, _1993);
    float _1997 = float(uint(_1975));
    float _1999 = as_type<float>(_1225) * _1991;
    bool _2001 = _1004 == 0;
    float _2003 = trunc(_1903);
    float _2005 = precise::max(_2003, 0.0);
    uint _2007 = uint(_2005);
    float _2009 = as_type<float>(_1147) * _1997;
    int _2011 = _1983 * int(_1957);
    int _2013 = _2011 + _1789;
    int _2015 = ~_1004;
    int _2017 = _2015 + 1;
    float _2019 = -_134;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1995);
    int _2023 = ~_1014;
    int _2025 = _2023 + 1;
    float _2027 = _854 * 2.0;
    float _2029 = float(uint(_2013));
    float _2031 = trunc(_1999);
    float _2033 = precise::max(_2031, 0.0);
    uint _2035 = uint(_2033);
    int _2037 = ~_1971;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    int _2043 = _2041;
    float _2045 = _2029;
    if (!_1977)
    {
        int _2047 = ~_1971;
        int _2049 = _2047 + 1;
        _2043 = _2049;
    }
    int _2051 = _2043;
    float _2053 = as_type<float>(_1225) * _2029;
    bool _2055 = uint(_1947) >= 2u;
    int _2057 = int(_1887) + int(_1989);
    float _2059 = trunc(_2009);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = _2055 ? 0 : 1;
    bool _2067 = _1947 != 3;
    int _2069 = _2017 * _2057;
    int _2071 = _2069 + _1839;
    int _2073 = int(_1831) + int(_2007);
    float _2075 = trunc(_2053);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    int _2081 = int(_1909) + int(_2035);
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2085 = ~_2065;
    int _2087 = _2085 + 1;
    int _2089 = _2087 + 1;
    bool _2091 = uint(_2071) >= uint(_1004);
    int _2093 = _2089;
    if (_2067)
    {
        int _2095 = ~_2065;
        int _2097 = _2095 + 1;
        _2093 = _2097;
    }
    int _2099 = _2093;
    int _2101 = _2025 * _2081;
    int _2103 = _2101 + _1859;
    bool _2105 = !_2091;
    int _2107 = _2105 ? 0 : (-1);
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2111 = _2109 != 0;
    bool _2113 = uint(_2103) >= uint(_1014);
    int _2115 = ~_2057;
    int _2117 = _2115 + _2107;
    int _2119 = _2117 + 1;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : 1;
    int _2125 = int(_1957) + int(_2079);
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2129 = _2127 != 0;
    bool _2131 = !_2113;
    int _2133 = _2131 ? 0 : (-1);
    int _2135 = _1004 * _2119;
    int _2137 = _2135 + _1839;
    int _2139 = ~_886;
    int _2141 = _2139 + 1;
    int _2143 = int(_1935) + int(_2063);
    int _2145 = ~_2081;
    int _2147 = _2145 + _2133;
    int _2149 = _2147 + 1;
    int _2151 = _2141 * _2073;
    int _2153 = _2151 + _1515;
    int _2155 = ~_1004;
    int _2157 = _2155 + 1;
    bool _2159 = !_2001;
    int _2161 = _2159 ? _2137 : (-1);
    int _2163 = _1014 * _2149;
    int _2165 = _2163 + _1859;
    bool _2167 = uint(_2153) >= uint(_886);
    int _2169 = _2157 * _2143;
    int _2171 = _2169 + _1677;
    float _2173 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2175 = log2(_2173);
    int _2177 = _2161 & 3;
    float _2179 = as_type<float>(_2119);
    float _2181 = as_type<float>(_2153);
    if (_1697)
    {
        _2179 = _1093;
    }
    float _2183 = _2179;
    float _2185 = _2183;
    if (_1697)
    {
        _2181 = _854;
    }
    float _2187 = _2181;
    float _2189 = _2187;
    if (!_1697)
    {
        _2185 = _1211;
    }
    float _2191 = _2185;
    if (!_1697)
    {
        _2189 = _1093;
    }
    float _2193 = _2189;
    bool _2195 = uint(_2171) >= uint(_1004);
    float _2197 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2199 = uint(_2177) >= 2u;
    bool _2201 = !_2195;
    int _2203 = _2201 ? 0 : (-1);
    float _2205 = _2175 * _134;
    bool _2207 = uint(_2177) > 1u;
    float _2209 = -_2083;
    float _2211 = fma(_2197, 2.0, _2209);
    int _2213 = _2199 ? 0 : 1;
    float _2215 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2217 = _2177 != 3;
    float _2219 = exp2(_2205);
    bool _2221 = !_2167;
    int _2223 = _2221 ? 0 : (-1);
    float _2225 = -_134;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2211);
    int _2229 = ~_1014;
    int _2231 = _2229 + 1;
    float _2233 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2235 = _848 + _2233;
    int _2237 = _2161 & 3;
    bool _2239 = _2237 != 0;
    bool _2241 = !_1661;
    int _2243 = _2241 ? _2165 : (-1);
    int _2245 = _2231 * _2125;
    int _2247 = _2245 + _1789;
    int _2249 = _2239 ? 0 : 1;
    int _2251 = _2243 & 3;
    int _2253 = ~_2249;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = ~_2213;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = -_2219;
    float _2267 = _2265 + 1.0;
    int _2269 = _2257;
    int _2271 = _2263;
    if (!_2207)
    {
        int _2273 = ~_2249;
        int _2275 = _2273 + 1;
        _2269 = _2275;
    }
    int _2277 = _2269;
    bool _2279 = uint(_2247) >= uint(_1014);
    if (_2217)
    {
        int _2281 = ~_2213;
        int _2283 = _2281 + 1;
        _2271 = _2283;
    }
    int _2285 = _2271;
    bool _2287 = uint(_2251) > 1u;
    bool _2289 = !_2279;
    int _2291 = _2289 ? 0 : (-1);
    int _2293 = _2243 & 3;
    bool _2295 = _2293 != 0;
    int _2297 = _2295 ? 0 : 1;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2301 = ~_2297;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = _2305;
    if (!_2287)
    {
        int _2309 = ~_2297;
        int _2311 = _2309 + 1;
        _2307 = _2311;
    }
    int _2313 = _2307;
    float _2315 = fma(_2215, -2.0, _2299);
    if (!_1367)
    {
        _2045 = _1211;
    }
    float _2317 = _2045;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2321 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2323 = isnan(0.0);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2329 = _2325 || _2327;
    float _2331 = in.m_48.x;
    float _2333 = in.m_48.y;
    float _2335 = in.m_48.z;
    float _2337 = _2317;
    if (_1367)
    {
        _2337 = _854;
    }
    float _2339 = _2337;
    float _2341 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2319);
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2345 = _2329 ? _2267 : 0.0;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2349 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2351 = isnan(1.0);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2357 = _2353 || _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2361 = 1.0 + _2359;
    float _2363 = fma(_2343, -2.0, _2347);
    float _2365 = 1.0 / _2361;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2369 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2341);
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2375 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2367);
    float _2377 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2371);
    float _2379 = -_134;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1193);
    float _2383 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2373);
    float _2385 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2375);
    float _2387 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2377);
    float _2389 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1945);
    float _2391 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2383);
    float _2393 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2315);
    float _2395 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2363);
    if (_2357)
    {
        float _2397 = _2345 * _2365;
        _144 = _2397;
    }
    float _2399 = _144;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2405 = _1285 >= 0.0;
    bool _2407 = isnan(_1285);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan(0.0);
    bool _2413 = _2409 || _2411;
    float _2415 = _202 * _2333;
    float _2417 = floor(_2027);
    int _2419 = _2413 ? 0 : 1;
    float _2421 = _208 * _2333;
    bool _2423 = _1285 > 0.0;
    float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2427 = _2425 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2429 = _196 * _2333;
    float _2431 = fma(_200, _2331, _2415);
    float _2433 = 1.0 / _2403;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2439 = fma(_206, _2331, _2421);
    float _2441 = fma(_194, _2331, _2429);
    float _2443 = fma(_204, _2335, _2431);
    float _2445 = 1.0 / _2427;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2451 = ~_2419;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2459 = _2457 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2461 = _2455;
    if (!_2423)
    {
        int _2463 = ~_2419;
        int _2465 = _2463 + 1;
        _2461 = _2465;
    }
    int _2467 = _2461;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2469;
    float _2473 = fma(_198, _2335, _2441);
    float _2475 = 1.0 / _2437;
    bool _2477 = _2417 >= 0.0;
    bool _2479 = isnan(_2417);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(0.0);
    bool _2485 = _2481 || _2483;
    float _2487 = _2471 * _2433;
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2497 = _2485 ? 0 : 1;
    float _2499 = fma(_210, _2335, _2439);
    float _2501 = 1.0 / _2449;
    bool _2503 = _2417 > 0.0;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2507 = _2505 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2509 = _2495 * _2445;
    int _2511 = ~_2073;
    int _2513 = _2511 + _2223;
    int _2515 = _2513 + 1;
    float _2517 = _1211 * 2.0;
    float _2519 = 1.0 / _2459;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2521;
    int _2525 = _886 * _2515;
    int _2527 = _2525 + _1515;
    int _2529 = ~_2497;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = in.m_61.w;
    float _2537 = _2523 * _2475;
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2543;
    float _2547 = 1.0 / _2491;
    int _2549 = _2533;
    if (!_2503)
    {
        int _2551 = ~_2497;
        int _2553 = _2551 + 1;
        _2549 = _2553;
    }
    int _2555 = _2549;
    float _2557 = _2541 * _2501;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2561 = _848 + _2559;
    bool _2563 = _1947 != 3;
    float _2565 = fma(_2557, _2235, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2567 = !_1401;
    int _2569 = _2567 ? _2527 : (-1);
    float _2571 = 1.0 / _2507;
    float _2573 = _2545 * _2519;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2579 = _854 + _1211;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2581;
    bool _2585 = !_1949;
    int _2587 = _2585 ? 0 : 1;
    float _2589 = fma(_2537, _2561, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2591 = _2579 + (-1.0);
    float _2593 = floor(_2517);
    float _2595 = _2577 * _2547;
    float _2597 = _2473 + _1347;
    int _2599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2601 = _2599 != 0;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2605 = _2603 != 0;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2609 = _2607 != 0;
    float _2611 = _2443 + _2535;
    bool _2613 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2615 = isnan(_848);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = _2583 * _2571;
    bool _2627 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2629 = isnan(_848);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2643 = _848 + _2641;
    bool _2645 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2647 = isnan(_848);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2653 = _2649 || _2651;
    float _2655 = float(_2653);
    float _2657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2659 = -_2637;
    float _2661 = _2659 + 1.0;
    float _2663 = fma(_2487, _2643, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2665 = _2593 >= 0.0;
    bool _2667 = isnan(_2593);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan(0.0);
    bool _2673 = _2669 || _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2677 = _848 + _2675;
    float _2679 = -_2655;
    float _2681 = _2679 + 1.0;
    bool _2683 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2685 = isnan(_848);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2691 = _2687 || _2689;
    float _2693 = float(_2691);
    int _2695 = _2673 ? 0 : 1;
    float _2697 = fma(_2509, _2677, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2699 = _2593 > 0.0;
    float _2701 = _2655 * _2661;
    bool _2703 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2705 = isnan(_848);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = _2623 * _2681;
    float _2717 = -_2623;
    float _2719 = _2717 + 1.0;
    bool _2721 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2723 = isnan(_848);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    float _2733 = in.m_63.w;
    float _2735 = -_2713;
    float _2737 = _2735 + 1.0;
    bool _2739 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2741 = isnan(_848);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2747 = _2743 || _2745;
    float _2749 = float(_2747);
    float _2751 = -_2693;
    float _2753 = _2751 + 1.0;
    float _2755 = _2713 * _2719;
    bool _2757 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2759 = isnan(_848);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2765 = _2761 || _2763;
    float _2767 = float(_2765);
    float _2769 = _2731 * _2737;
    float _2771 = -_2731;
    float _2773 = _2771 + 1.0;
    float _2775 = _2749 * _2753;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2779 = _848 + _2777;
    float _2781 = -_2749;
    float _2783 = _2781 + 1.0;
    float _2785 = _2767 * _2773;
    float _2787 = -_2767;
    float _2789 = _2787 + 1.0;
    float _2791 = _2663 * _2775;
    int _2793 = _1921 >> 31;
    float _2795 = fma(_2573, _2779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2797 = _2693 * _2789;
    float _2799 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2791);
    int _2801 = _2793 & 3;
    float _2803 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2805 = fma(_2697, _2797, _2799);
    int _2807 = _1921 + _2801;
    float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2811 = _2597 + _2809;
    float _2813 = _2499 + _2733;
    float _2815 = fma(_2589, _2785, _2805);
    float _2817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2819 = _2611 + _2817;
    int _2821 = _2807 >> 2;
    float _2823 = fma(_2803, _1125, -0.5);
    float _2825 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2827 = fma(_2565, _2769, _2815);
    int _2829 = _2821 << 4;
    int _2831 = _2829 + 656;
    float _2833 = _2819 * _2819;
    float _2835 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2837 = _848 + _2835;
    float _2839 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _2841 = uint(int(uint(_2831) >> uint(2)));
    uint _2843 = uint(int(uint(int(_2841)) >> uint(2)));
    int _2845 = int(_2841) & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    int _2849 = int(_2841) + 1;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    int _2853 = _2849 & 3;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[int(_2851)][_2853];
    float _2857 = fma(_2811, _2811, _2833);
    float _2859 = fma(_2795, _2755, _2827);
    float _2861 = fma(_2595, _2837, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2865 = _2813 + _2863;
    float _2867 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2839);
    float _2869 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    float _2871 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2873 = _848 + _2871;
    float _2875 = fma(_2861, _2715, _2859);
    float _2877 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2867);
    float _2879 = fma(_1311, _2869, _2381);
    float _2881 = fma(_2625, _2873, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2883 = _2831 + 8;
    uint _2885 = uint(int(uint(_2883) >> uint(2)));
    uint _2887 = uint(int(uint(int(_2885)) >> uint(2)));
    int _2889 = int(_2885) & 3;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[int(_2887)][_2889];
    int _2893 = int(_2885) + 1;
    uint _2895 = uint(int(uint(_2893) >> uint(2)));
    int _2897 = _2893 & 3;
    float _2899 = (*spvDescriptorSet0.vp_c9)._m0[int(_2895)][_2897];
    int _2901 = ~_2695;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    float _2907 = _854 + _1093;
    int _2909 = _2905;
    float _2911 = _2597;
    float _2913 = _2813;
    if (!_2699)
    {
        int _2915 = ~_2695;
        int _2917 = _2915 + 1;
        _2909 = _2917;
    }
    int _2919 = _2909;
    bool _2921 = _2877 >= 0.0;
    float _2923 = _2907 + (-1.0);
    float _2925 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    int _2927 = abs(_2587);
    float _2929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2931 = abs(_2099);
    float _2933 = fma(_2923, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2935 = -_1321;
    float _2937 = fma(_1277, _2925, _2935);
    int _2939 = ~_2927;
    int _2941 = _2939 + 1;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2865, _2865, _2857);
    bool _2947 = !_2563;
    int _2949 = _2947 ? 0 : (-1);
    float _2951 = fma(_1727, _2823, _2021);
    float _2953 = _2923;
    if (_2921)
    {
        _2953 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2955 = _2953;
    float _2957 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2959 = int(_2957);
    float _2961 = fma(_2387, _2825, _1331);
    int _2963 = abs(_2123);
    int _2965 = as_type<int>(_2955);
    if (_2921)
    {
        float _2967 = _2955 * 5.0;
        _2965 = as_type<int>(_2967);
    }
    int _2969 = _2965;
    bool _2971 = !_2601;
    int _2973 = _2971 ? 0 : 1;
    float _2975 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2977 = _2929 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2979 = rsqrt(_2945);
    if (_2921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9718 = as_type<float>(_2969);
        out.gl_Position.z = _9718;
    }
    float _2981 = -_1275;
    float _2983 = fma(_2391, _2975, _2981);
    float _2985 = fma(_2977, _1369, -0.5);
    int _2987 = ~_2143;
    int _2989 = _2987 + _2203;
    int _2991 = _2989 + 1;
    bool _2993 = !_2129;
    int _2995 = _2993 ? 0 : 1;
    int _2997 = ~_2125;
    int _2999 = _2997 + _2291;
    int _3001 = _2999 + 1;
    float _3003 = fma(_2881, _2701, _2875);
    int _3005 = abs(_2959);
    int _3007 = _1004 * _2991;
    int _3009 = _3007 + _1677;
    int _3011 = abs(_2285);
    int _3013 = _1014 * _3001;
    int _3015 = _3013 + _1789;
    float _3017 = float(uint(_3005));
    float _3019 = _2879 + 0.5;
    int _3021 = abs(_2051);
    float _3023 = _2937 + 0.5;
    float _3025 = float(uint(_2959));
    float _3027 = 1.0 / _3017;
    int _3029 = ~_3021;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = _2865 * _2979;
    out.m_75.x = _3019;
    out.m_75.y = _3023;
    bool _3037 = _1004 == 0;
    float _3039 = _2819 * _2979;
    int _3041 = _3033 * as_type<int>(_2855);
    float _3043 = float(_2919);
    float _3045 = 1.0 / _3025;
    float _3047 = -_3035;
    float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2865);
    int _3051 = _2943 * as_type<int>(_2847);
    int _3053 = _3051 + _3041;
    int _3055 = abs(_2949);
    float _3057 = _2811 * _2979;
    int _3059 = _2161 >> 31;
    float _3061 = -_3039;
    float _3063 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2819);
    float _3065 = fma(_2637, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3003);
    int _3067 = _3059 & 3;
    float _3069 = -_3057;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2811);
    int _3073 = ~_2931;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    float _3079 = _3063 * _3063;
    int _3081 = ~_3055;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    out.m_77.x = _3065;
    int _3087 = _2161 + _3067;
    int _3089 = _3077 * as_type<int>(_2891);
    int _3091 = _3089 + _3053;
    int _3093 = ~_2963;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    float _3099 = fma(_3071, _3071, _3079);
    int _3101 = abs(_2973);
    int _3103 = _3085 * as_type<int>(_2899);
    int _3105 = _3103 + _3091;
    int _3107 = _2243 >> 31;
    float _3109 = -_2395;
    float _3111 = fma(_2389, _2985, _3109);
    float _3113 = float(_3101);
    int _3115 = _3105 * _3097;
    int _3117 = _3107 & 3;
    float _3119 = _3111 + 0.5;
    int _3121 = _3087 >> 2;
    int _3123 = _2569 * _2963;
    int _3125 = _3123 + _3115;
    float _3127 = _3113 * _3043;
    int _3129 = _2243 + _3117;
    float _3131 = _2961 + 0.5;
    int _3133 = _3121 << 4;
    int _3135 = _3133 + 368;
    float _3137 = _3127 * (-2.0);
    float _3139 = in.m_79.x;
    float _3141 = in.m_79.y;
    float _3143 = in.m_79.z;
    bool _3145 = !_2605;
    int _3147 = _3145 ? 0 : 1;
    uint _3149 = uint(int(uint(_3135) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    int _3165 = _3129 >> 2;
    float _3167 = _2951 + 0.5;
    int _3169 = abs(_3147);
    float _3171 = _2983 + 0.5;
    int _3173 = as_type<int>(_3045) + (-2);
    float _3175 = as_type<float>(_3005);
    if (_2921)
    {
        out.m_55.x = 0.0;
    }
    float _3177 = float(uint(_3125));
    int _3179 = _3135 + 8;
    uint _3181 = uint(int(uint(_3179) >> uint(2)));
    uint _3183 = uint(int(uint(int(_3181)) >> uint(2)));
    int _3185 = int(_3181) & 3;
    float _3187 = (*spvDescriptorSet0.vp_c9)._m0[int(_3183)][_3185];
    int _3189 = int(_3181) + 1;
    uint _3191 = uint(int(uint(_3189) >> uint(2)));
    int _3193 = _3189 & 3;
    float _3195 = (*spvDescriptorSet0.vp_c9)._m0[int(_3191)][_3193];
    int _3197 = abs(_3125);
    out.m_81.x = _3131;
    out.m_81.y = _3171;
    out.m_81.z = _3167;
    out.m_81.w = _3119;
    int _3199 = _3165 << 4;
    int _3201 = _3199 + 800;
    float _3203 = as_type<float>(_3173) * _3177;
    int _3205 = as_type<int>(_3027) + (-2);
    float _3207 = fma(_3049, _3049, _3099);
    float _3209 = float(uint(_3197));
    uint _3211 = uint(int(uint(_3201) >> uint(2)));
    uint _3213 = uint(int(uint(int(_3211)) >> uint(2)));
    int _3215 = int(_3211) & 3;
    float _3217 = (*spvDescriptorSet0.vp_c9)._m0[int(_3213)][_3215];
    int _3219 = int(_3211) + 1;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    int _3223 = _3219 & 3;
    float _3225 = (*spvDescriptorSet0.vp_c9)._m0[int(_3221)][_3223];
    float _3227 = float(_2467);
    float _3229 = trunc(_3203);
    float _3231 = precise::max(_3229, 0.0);
    uint _3233 = uint(_3231);
    float _3235 = float(_3169);
    float _3237 = as_type<float>(_3205) * _3209;
    float _3239 = _1093 + (-0.5);
    float _3241 = fma(_3137, _3139, _3139);
    bool _3243 = !_3037;
    int _3245 = _3243 ? _3009 : (-1);
    float _3247 = _3235 * _3227;
    float _3249 = fma(_2933, _3137, _2933);
    float _3251 = trunc(_3237);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    int _3257 = ~_2959;
    int _3259 = _3257 + 1;
    float _3261 = fma(_3239, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3241);
    int _3263 = ~_3005;
    int _3265 = _3263 + 1;
    int _3267 = _3201 + 8;
    uint _3269 = uint(int(uint(_3267) >> uint(2)));
    uint _3271 = uint(int(uint(int(_3269)) >> uint(2)));
    int _3273 = int(_3269) & 3;
    float _3275 = (*spvDescriptorSet0.vp_c9)._m0[int(_3271)][_3273];
    int _3277 = int(_3269) + 1;
    uint _3279 = uint(int(uint(_3277) >> uint(2)));
    int _3281 = _3277 & 3;
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[int(_3279)][_3281];
    float _3285 = _3247 * (-2.0);
    float _3287 = fma(_3249, _2399, _3261);
    int _3289 = abs(_2277);
    int _3291 = _3259 * int(_3233);
    int _3293 = _3291 + _3125;
    int _3295 = abs(_1739);
    float _3297 = _854 + (-0.5);
    int _3299 = ~_3289;
    int _3301 = _3299 + 1;
    int _3303 = _3301 + 1;
    float _3305 = float(uint(_3293));
    int _3307 = _3265 * int(_3255);
    int _3309 = _3307 + _3197;
    bool _3311 = !_2239;
    int _3313 = _3311 ? 0 : 1;
    bool _3315 = _2177 != 3;
    float _3317 = as_type<float>(_3173) * _3305;
    float _3319 = float(uint(_3309));
    int _3321 = _3303 * as_type<int>(_3163);
    bool _3323 = !_2295;
    int _3325 = _3323 ? 0 : 1;
    bool _3327 = uint(_2251) >= 2u;
    float _3329 = as_type<float>(_3205) * _3319;
    int _3331 = abs(_3313);
    int _3333 = abs(_2313);
    int _3335 = abs(_3325);
    float _3337 = trunc(_3317);
    float _3339 = precise::max(_3337, 0.0);
    uint _3341 = uint(_3339);
    int _3343 = _3327 ? 0 : 1;
    bool _3345 = _2251 != 3;
    int _3347 = ~_3333;
    int _3349 = _3347 + 1;
    int _3351 = _3349 + 1;
    float _3353 = trunc(_3329);
    float _3355 = precise::max(_3353, 0.0);
    uint _3357 = uint(_3355);
    int _3359 = ~_3331;
    int _3361 = _3359 + 1;
    int _3363 = _3361 + 1;
    int _3365 = _3351 * as_type<int>(_3225);
    int _3367 = ~_3011;
    int _3369 = _3367 + 1;
    int _3371 = _3369 + 1;
    int _3373 = _3363 * as_type<int>(_3155);
    int _3375 = _3373 + _3321;
    int _3377 = ~_3343;
    int _3379 = _3377 + 1;
    int _3381 = _3379 + 1;
    int _3383 = ~_3335;
    int _3385 = _3383 + 1;
    int _3387 = _3385 + 1;
    int _3389 = _3371 * as_type<int>(_3187);
    int _3391 = _3389 + _3375;
    bool _3393 = !_3315;
    int _3395 = _3393 ? 0 : (-1);
    int _3397 = _3381;
    if (_3345)
    {
        int _3399 = ~_3343;
        int _3401 = _3399 + 1;
        _3397 = _3401;
    }
    int _3403 = _3397;
    int _3405 = _3387 * as_type<int>(_3217);
    int _3407 = _3405 + _3365;
    bool _3409 = _2251 != 3;
    int _3411 = abs(_3395);
    bool _3413 = !_3409;
    int _3415 = _3413 ? 0 : (-1);
    int _3417 = ~_3411;
    int _3419 = _3417 + 1;
    int _3421 = _3419 + 1;
    int _3423 = abs(_3403);
    int _3425 = abs(_3415);
    int _3427 = _3421 * as_type<int>(_3195);
    int _3429 = _3427 + _3391;
    int _3431 = int(_3233) + int(_3341);
    int _3433 = int(_3255) + int(_3357);
    int _3435 = ~_2959;
    int _3437 = _3435 + 1;
    int _3439 = ~_3005;
    int _3441 = _3439 + 1;
    int _3443 = ~_3423;
    int _3445 = _3443 + 1;
    int _3447 = _3445 + 1;
    int _3449 = _3437 * _3431;
    int _3451 = _3449 + _3125;
    int _3453 = _3441 * _3433;
    int _3455 = _3453 + _3197;
    bool _3457 = _1014 == 0;
    int _3459 = _3447 * as_type<int>(_3275);
    int _3461 = _3459 + _3407;
    int _3463 = ~_3425;
    int _3465 = _3463 + 1;
    int _3467 = _3465 + 1;
    float _3469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3471 = uint(_3451) >= uint(_2959);
    bool _3473 = uint(_3455) >= uint(_3005);
    int _3475 = _3467 * as_type<int>(_3283);
    int _3477 = _3475 + _3461;
    int _3479 = _3125 ^ _2959;
    bool _3481 = !_3471;
    int _3483 = _3481 ? 0 : (-1);
    bool _3485 = !_3473;
    int _3487 = _3485 ? 0 : (-1);
    uint _3489 = uint(int(uint(_3479) >> uint(31)));
    int _3491 = abs(_2995);
    int _3493 = ~_3487;
    int _3495 = _3433 + _3493;
    int _3497 = _3495 + 1;
    int _3499 = ~_3431;
    int _3501 = _3499 + _3483;
    int _3503 = _3501 + 1;
    int _3505 = ~int(_3489);
    int _3507 = _3505 + 1;
    float _3509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3511 = ~_3491;
    int _3513 = _3511 + 1;
    int _3515 = _3513 + 1;
    int _3517 = _2959 * _3503;
    int _3519 = _3517 + _3125;
    int _3521 = _3497 ^ _3507;
    int _3523 = ~_3295;
    int _3525 = _3523 + 1;
    int _3527 = _3525 + 1;
    int _3529 = _3429 * _3515;
    bool _3531 = _2959 == 0;
    bool _3533 = _2959 == 0;
    int _3535 = _3477 * _3527;
    int _3537 = ~_3507;
    int _3539 = _3537 + _3521;
    int _3541 = _3539 + 1;
    int _3543 = _3245 * _3491;
    int _3545 = _3543 + _3529;
    bool _3547 = !_3531;
    int _3549 = _3547 ? _3519 : (-1);
    float _3551 = _3469 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3553 = !_3533;
    int _3555 = _3553 ? _3541 : (-1);
    float _3557 = _3509 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3559 = float(_3549);
    float _3561 = fma(_3551, _1167, -0.5);
    float _3563 = float(_3555);
    float _3565 = fma(_3557, _1375, -0.5);
    bool _3567 = !_3457;
    int _3569 = _3567 ? _3015 : (-1);
    float _3571 = fma(_3551, _3559, _2227);
    float _3573 = float(_3545);
    float _3575 = -_2393;
    float _3577 = fma(_3557, _3563, _3575);
    float _3579 = fma(_3285, _3141, _3141);
    int _3581 = _3569 * _3295;
    int _3583 = _3581 + _3535;
    float _3585 = fma(_2385, _3561, _3571);
    float _3587 = fma(_2369, _3565, _3577);
    out.m_83.x = _3573;
    float _3589 = fma(_2639, _3285, _2639);
    float _3591 = float(_3583);
    float _3593 = _3585 + 0.5;
    float _3595 = _3587 + 0.5;
    bool _3597 = !_2609;
    int _3599 = _3597 ? 0 : 1;
    out.m_83.w = _3591;
    out.m_85.x = _3593;
    out.m_85.y = _3595;
    if (_2921)
    {
        return out;
    }
    float _3601 = -_3039;
    float _3603 = fma(_3601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2611);
    float _3605 = float(_2555);
    float _3607 = -_3057;
    float _3609 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2597);
    int _3611 = abs(_3599);
    float _3613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3615 = _3603 + _3613;
    float _3617 = -_3035;
    float _3619 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2813);
    float _3621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3623 = _3609 + _3621;
    float _3625 = _1093 + _1211;
    float _3627 = _3615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3631 = _3619 + _3629;
    float _3633 = _1211 + (-0.5);
    float _3635 = _3625 + (-1.0);
    float _3637 = fma(_3623, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3627);
    float _3639 = float(_3611);
    float _3641 = fma(_3297, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3579);
    float _3643 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3637);
    float _3645 = _3287 * 0.15915493667125701904296875;
    float _3647 = _3639 * _3605;
    float _3649 = fma(_3589, _2399, _3641);
    float _3651 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3653 = _3643 >= 0.0;
    float _3655 = _3647 * (-2.0);
    float _3657 = _3649 * 0.15915493667125701904296875;
    float _3659 = sqrt(_3207);
    float _3661 = fma(_3655, _3143, _3143);
    float _3663 = fma(_3651, _3655, _3651);
    float _3665 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3661);
    float _3667 = _3645 * 6.283185482025146484375;
    float _3669 = sin(_3667);
    float _3671 = fma(_3663, _2399, _3665);
    float _3673 = _3661;
    float _3675 = _3645;
    float _3677 = _3623;
    float _3679 = _3609;
    if (_3653)
    {
        _3673 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3681 = _3673;
    int _3683 = as_type<int>(_3681);
    if (_3653)
    {
        out.m_55.x = 0.0;
    }
    float _3685 = _3671 * 0.15915493667125701904296875;
    float _3687 = _3645 * 6.283185482025146484375;
    float _3689 = cos(_3687);
    if (_3653)
    {
        float _3691 = _3681 * 5.0;
        _3683 = as_type<int>(_3691);
    }
    int _3693 = _3683;
    if (_3653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10734 = as_type<float>(_3693);
        out.gl_Position.z = _10734;
    }
    float _3695 = _3657 * 6.283185482025146484375;
    float _3697 = sin(_3695);
    float _3699 = _3657 * 6.283185482025146484375;
    float _3701 = cos(_3699);
    float _3703 = _3685 * 6.283185482025146484375;
    float _3705 = sin(_3703);
    if (_3653)
    {
        return out;
    }
    float _3707 = -_2611;
    float _3709 = _3707 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3711 = -_2597;
    float _3713 = _3711 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3715 = -_2813;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3719 = in.m_87.x;
    float _3721 = in.m_87.y;
    float _3723 = in.m_87.z;
    float _3725 = _3709 * _3709;
    float _3727 = _3685 * 6.283185482025146484375;
    float _3729 = cos(_3727);
    float _3731 = _3689 * _3697;
    float _3733 = _3669 * _3701;
    float _3735 = fma(_3713, _3713, _3725);
    float _3737 = _3669 * _3697;
    float _3739 = _3689 * _3701;
    float _3741 = _2979 * _3659;
    float _3743 = fma(_3717, _3717, _3735);
    float _3745 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3747 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3749 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3751 = -_3731;
    float _3753 = fma(_3705, _3733, _3751);
    float _3755 = -_3733;
    float _3757 = fma(_3705, _3731, _3755);
    float _3759 = rsqrt(_3743);
    float _3761 = fma(_3705, _3739, _3737);
    float _3763 = _3741 * _3745;
    float _3765 = _3689 * _3729;
    float _3767 = _3701 * _3729;
    float _3769 = _3669 * _3729;
    float _3771 = _3697 * _3729;
    float _3773 = fma(_3705, _3737, _3739);
    float _3775 = _3741 * _3747;
    float _3777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3723);
    float _3779 = _3741 * _3749;
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3719);
    float _3783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3721);
    float _3785 = _3777 * _3763;
    bool _3787 = _3721 != 0.0;
    bool _3789 = isnan(_3721);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan(0.0);
    bool _3795 = _3791 || _3793;
    float _3797 = _3781 * _3775;
    float _3799 = _3713 * _3759;
    float _3801 = _3717 * _3759;
    float _3803 = _3709 * _3759;
    float _3805 = _3783 * _3779;
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3799 * _3807;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3813 = _3801 * _3811;
    float _3815 = in.m_89.x;
    float _3817 = in.m_89.y;
    float _3819 = in.m_89.z;
    bool _3821 = _3719 == 0.0;
    bool _3823 = !_3795;
    bool _3825 = _3821 && _3823;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3829 = -_3809;
    float _3831 = fma(_3801, _3827, _3829);
    float _3833 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3835 = _3803 * _3833;
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3839 = -_3813;
    float _3841 = fma(_3803, _3837, _3839);
    bool _3843 = _3723 == 0.0;
    bool _3845 = _3843 && _3825;
    float _3847 = _3831 * _3831;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3851 = -_3835;
    float _3853 = fma(_3799, _3849, _3851);
    float _3855 = in.m_91.x;
    float _3857 = in.m_91.y;
    float _3859 = in.m_91.z;
    float _3861 = in.m_91.w;
    float _3863 = -_3805;
    float _3865 = _3705 * _3863;
    float _3867 = fma(_3841, _3841, _3847);
    float _3869 = _3765 * _3805;
    float _3871 = _3769 * _3805;
    float _3873 = fma(_3767, _3797, _3865);
    float _3875 = fma(_3853, _3853, _3867);
    float _3877 = fma(_3761, _3797, _3869);
    float _3879 = fma(_3753, _3797, _3871);
    float _3881 = fma(_3771, _3785, _3873);
    float _3883 = fma(_3757, _3785, _3877);
    float _3885 = rsqrt(_3875);
    float _3887 = _3871;
    float _3889 = _3815;
    float _3891 = _3797;
    if (_3845)
    {
        _3175 = _3815;
    }
    float _3893 = _3175;
    float _3895 = _3893;
    if (_3845)
    {
        _3675 = _3819;
    }
    float _3897 = _3675;
    float _3899 = _3897;
    if (_3845)
    {
        _3887 = _3893;
    }
    float _3901 = _3887;
    float _3903 = _3901;
    if (!_3845)
    {
        _3895 = _3815;
    }
    float _3905 = _3895;
    if (_3845)
    {
        _3889 = _3817;
    }
    float _3907 = _3889;
    float _3909 = _3907;
    if (!_3845)
    {
        float _3911 = fma(_3721, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3817);
        _3909 = _3911;
    }
    float _3913 = _3909;
    float _3915 = _3913;
    if (_3845)
    {
        _3891 = _3897;
    }
    float _3917 = _3891;
    float _3919 = _3859 * _3905;
    float _3921 = _3841 * _3885;
    float _3923 = _3917;
    if (!_3845)
    {
        _3899 = _3819;
    }
    float _3925 = _3899;
    float _3927 = _3831 * _3885;
    float _3929 = _3853 * _3885;
    float _3931 = _3803 * _3921;
    if (!_3845)
    {
        float _3933 = fma(_3719, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3905);
        _3903 = _3933;
    }
    float _3935 = _3903;
    float _3937 = _3801 * _3927;
    float _3939 = -_3919;
    float _3941 = fma(_3855, _3925, _3939);
    float _3943 = _3857 * _3925;
    float _3945 = _3855 * _3817;
    float _3947 = -_3937;
    float _3949 = fma(_3803, _3929, _3947);
    float _3951 = -_3931;
    float _3953 = fma(_3799, _3927, _3951);
    if (!_3845)
    {
        float _3955 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3925);
        _3923 = _3955;
    }
    float _3957 = _3923;
    float _3959 = -_3943;
    float _3961 = fma(_3859, _3817, _3959);
    float _3963 = fma(_3773, _3785, _3879);
    float _3965 = -_3945;
    float _3967 = fma(_3857, _3905, _3965);
    float _3969 = _3949 * _3883;
    float _3971 = _3953 * _3883;
    float _3973 = _3941 * _3861;
    float _3975 = _3961 * _3861;
    float _3977 = _3799 * _3929;
    float _3979 = _3967 * _3861;
    float _3981 = fma(_3921, _3881, _3969);
    float _3983 = fma(_3929, _3881, _3971);
    float _3985 = -_3977;
    float _3987 = fma(_3801, _3921, _3985);
    float _3989 = _3761 * _3949;
    float _3991 = fma(_3799, _3963, _3981);
    float _3993 = fma(_3801, _3963, _3983);
    float _3995 = _3761 * _3987;
    float _3997 = _3761 * _3953;
    float _3999 = _2597 + _3991;
    float _4001 = _2813 + _3993;
    float _4003 = _3765 * _3949;
    float _4005 = _3765 * _3987;
    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4009 = _3999 + _4007;
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4013 = _4001 + _4011;
    float _4015 = _3765 * _3953;
    float _4017 = _3987 * _3883;
    float _4019 = _4009 * _4009;
    float _4021 = _4013 * _4013;
    float _4023 = _3757 * _3949;
    float _4025 = _3757 * _3953;
    float _4027 = _3757 * _3987;
    float _4029 = _4019 + _4021;
    float _4031 = fma(_3767, _3921, _3989);
    float _4033 = fma(_3767, _3927, _3995);
    float _4035 = fma(_3767, _3929, _3997);
    float _4037 = sqrt(_4029);
    float _4039 = fma(_3927, _3881, _4017);
    float _4041 = -_3705;
    float _4043 = fma(_4041, _3921, _4003);
    float _4045 = -_3705;
    float _4047 = fma(_4045, _3927, _4005);
    float _4049 = -_3705;
    float _4051 = fma(_4049, _3929, _4015);
    float _4053 = fma(_3771, _3921, _4023);
    float _4055 = fma(_3753, _3799, _4031);
    float _4057 = fma(_3753, _3803, _4033);
    float _4059 = fma(_3753, _3801, _4035);
    float _4061 = fma(_3803, _3963, _4039);
    float _4063 = fma(_3769, _3799, _4043);
    float _4065 = fma(_3769, _3803, _4047);
    float _4067 = fma(_3769, _3801, _4051);
    float _4069 = fma(_3771, _3929, _4025);
    float _4071 = fma(_3771, _3927, _4027);
    float _4073 = _2611 + _4061;
    bool _4075 = _4037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4077 = _4063 * _3857;
    float _4079 = _4065 * _3857;
    float _4081 = _4067 * _3857;
    float _4083 = fma(_3773, _3799, _4053);
    float _4085 = fma(_3773, _3801, _4069);
    float _4087 = fma(_3773, _3803, _4071);
    float _4089 = _4063 * _3913;
    float _4091 = _3973 * _4063;
    float _4093 = _4065 * _3913;
    float _4095 = _4067 * _3913;
    float _4097 = _3973 * _4065;
    float _4099 = _3973 * _4067;
    float _4101 = _3973;
    float _4103 = _4067;
    float _4105 = _3999;
    float _4107 = _4001;
    if (!_4075)
    {
        _3915 = _4021;
    }
    float _4109 = _3915;
    float _4111 = _4109;
    if (!_4075)
    {
        _4101 = _4019;
    }
    float _4113 = _4101;
    float _4115 = _4113;
    if (!_4075)
    {
        _4103 = _4073;
    }
    float _4117 = _4103;
    bool _4119 = !_4075;
    float _4121 = _4117;
    if (!_4119)
    {
        float _4123 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4127 = _4037 + _4125;
        float _4129 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4131 = rsqrt(_4029);
        float _4133 = _4127 * _4123;
        float _4135 = _4133 * 0.15915493667125701904296875;
        float _4137 = _4135 * 6.283185482025146484375;
        float _4139 = sin(_4137);
        float _4141 = _4135 * 6.283185482025146484375;
        float _4143 = cos(_4141);
        float _4145 = fma(_4139, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4147 = _4131 * _4145;
        float _4149 = _4143 + (-1.0);
        float _4151 = fma(_4009, _4147, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4153 = fma(_4013, _4147, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4155 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4159 = _4151 + _4157;
        float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4163 = _4153 + _4161;
        float _4165 = fma(_4073, _4143, _4155);
        float _4167 = _4159 * _4159;
        float _4169 = _4163 * _4163;
        _4121 = _4165;
        _4115 = _4167;
        _4111 = _4169;
        _4105 = _4151;
        _4107 = _4153;
    }
    float _4171 = _4121;
    float _4173 = _4115;
    float _4175 = _4111;
    float _4177 = _4105;
    float _4179 = _4107;
    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4183 = _4171 + _4181;
    float _4185 = fma(_4057, _3855, _4079);
    float _4187 = fma(_4057, _3935, _4093);
    float _4189 = fma(_4059, _3855, _4081);
    float _4191 = fma(_4183, _4183, _4173);
    float _4193 = fma(_4059, _3935, _4095);
    float _4195 = fma(_3975, _4057, _4097);
    float _4197 = fma(_3975, _4059, _4099);
    float _4199 = _4191 + _4175;
    float _4201 = fma(_4055, _3855, _4077);
    float _4203 = fma(_4055, _3935, _4089);
    float _4205 = fma(_3975, _4055, _4091);
    float _4207 = sqrt(_4199);
    float _4209 = fma(_4083, _3859, _4201);
    float _4211 = fma(_4087, _3859, _4185);
    float _4213 = fma(_4083, _3957, _4203);
    float _4215 = fma(_4085, _3859, _4189);
    float _4217 = fma(_3979, _4083, _4205);
    float _4219 = fma(_4087, _3957, _4187);
    float _4221 = fma(_3979, _4087, _4195);
    float _4223 = fma(_3979, _4085, _4197);
    float _4225 = fma(_4085, _3957, _4193);
    out.m_93.x = _4209;
    out.m_93.y = _4211;
    out.m_93.z = _4215;
    out.m_95.x = _4217;
    out.m_95.y = _4221;
    out.m_95.z = _4223;
    bool _4227 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4229 = isnan(_4207);
    bool _4231 = _4227 || _4229;
    bool _4233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4235 = _4231 || _4233;
    out.m_97.x = _4213;
    out.m_97.y = _4219;
    out.m_97.z = _4225;
    float _4237 = _4199;
    if (!_4235)
    {
        _4237 = 1.0;
    }
    float _4239 = _4237;
    bool _4241 = !_4235;
    float _4243 = _4239;
    if (!_4241)
    {
        bool _4245 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4247 = isnan(_4207);
        bool _4249 = _4245 || _4247;
        bool _4251 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4253 = _4249 || _4251;
        if (!_4253)
        {
            float _4255 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4257 = _4207 + _4255;
            float _4259 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4261 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4259;
            float _4263 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4265 = _4263 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4267 = 1.0 / _4261;
            float _4269 = _4257 * _4267;
            float _4271 = fma(_4269, _4265, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4243 = _4271;
            _4273 = true;
        }
        else
        {
            bool _4275 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4277 = isnan(_4207);
            bool _4279 = _4275 || _4277;
            bool _4281 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4283 = _4279 || _4281;
            if (!_4283)
            {
                float _4285 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4287 = _4207 + _4285;
                float _4289 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4291 = _4289 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4293 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4295 = _4293 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4297 = 1.0 / _4291;
                float _4299 = _4287 * _4297;
                float _4301 = fma(_4299, _4295, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4243 = _4301;
                _4273 = true;
            }
            else
            {
                _4243 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4273 = false;
    float _4303 = _4243;
    float _4305 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4307 = _4171 + _4305;
    float _4309 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4311 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4313 = _4177 + _4311;
    float _4315 = fma(_4307, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4317 = fma(_3609, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4309);
    float _4319 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4321 = _4179 + _4319;
    float _4323 = fma(_4313, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4325 = -_2611;
    float _4327 = _4325 + _4315;
    float _4329 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4317);
    float _4331 = fma(_4321, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4333 = -_2597;
    float _4335 = _4333 + _4323;
    float _4337 = _4327 * _4327;
    float _4339 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4341 = -_2813;
    float _4343 = _4341 + _4331;
    float _4345 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4347 = fma(_4335, _4335, _4337);
    float _4349 = 1.0 / _4339;
    float _4351 = fma(_3609, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4345);
    float _4353 = fma(_4343, _4343, _4347);
    float _4355 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4351);
    float _4357 = sqrt(_4353);
    float _4359 = _4355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4361 = _4359 + _4339;
    float _4363 = _4361 * _4349;
    float _4365 = _4363 * 0.5;
    bool _4367 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4369 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4371 = _4367 || _4369;
    bool _4373 = isnan(0.5);
    bool _4375 = _4371 || _4373;
    bool _4377 = _4357 > 0.0;
    float _4379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4381 = fma(_4365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4379);
    float _4383 = 1.0 / _4381;
    bool _4385 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4387 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4389 = _4385 || _4387;
    bool _4391 = isnan(0.5);
    bool _4393 = _4389 || _4391;
    float _4395 = _4321;
    float _4397 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4399 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4377)
    {
        _4395 = _4323;
    }
    float _4401 = _4395;
    float _4403 = _4401;
    float _4405 = _4401;
    if (!_4377)
    {
        _4397 = _4315;
    }
    float _4407 = _4397;
    float _4409 = _4407;
    float _4411 = _4407;
    if (!_4377)
    {
        _4399 = _4331;
    }
    float _4413 = _4399;
    bool _4415 = !_4377;
    float _4417 = _4413;
    if (!_4415)
    {
        float _4419 = _226 * _226;
        float _4421 = fma(_222, _222, _4419);
        float _4423 = fma(_228, _228, _4421);
        float _4425 = rsqrt(_4353);
        float _4427 = sqrt(_4423);
        float _4429 = _4335 * _4425;
        float _4431 = _4327 * _4425;
        float _4433 = _4343 * _4425;
        bool _4435 = _4427 > 0.0;
        float _4437 = _4427;
        if (!_4435)
        {
            _4403 = _4323;
        }
        float _4439 = _4403;
        _4405 = _4439;
        if (!_4435)
        {
            _4409 = _4315;
        }
        float _4441 = _4409;
        _4411 = _4441;
        if (!_4435)
        {
            _4437 = _4331;
        }
        float _4443 = _4437;
        bool _4445 = !_4435;
        _4417 = _4443;
        if (!_4445)
        {
            float _4447 = rsqrt(_4423);
            float _4449 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4451 = _226 * _4447;
            float _4453 = _222 * _4447;
            float _4455 = _228 * _4447;
            float _4457 = _4431 * _4451;
            float _4459 = fma(_4429, _4453, _4457);
            float _4461 = _4449 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4463 = fma(_4433, _4455, _4459);
            float _4465 = _4463 * _4461;
            float _4467 = fma(_222, _4465, _4323);
            float _4469 = fma(_226, _4465, _4315);
            float _4471 = fma(_228, _4465, _4331);
            _4405 = _4467;
            _4411 = _4469;
            _4417 = _4471;
        }
    }
    float _4473 = _4405;
    float _4475 = _4411;
    float _4477 = _4417;
    float _4479 = -_3057;
    float _4481 = fma(_4479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4473);
    float _4483 = -_3039;
    float _4485 = fma(_4483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4475);
    float _4487 = -_3035;
    float _4489 = fma(_4487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4477);
    float _4491 = _4485;
    float _4493 = _4481;
    float _4495 = _4489;
    if (_4375)
    {
        _232 = 1.0;
    }
    float _4497 = _232;
    float _4499 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4501 = _4383 * _4499;
    float _4503 = _4497;
    if (!_4393)
    {
        float _4505 = _3615 * _3615;
        float _4507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4509 = -_2813;
        float _4511 = _4509 + _4477;
        float _4513 = -_2597;
        float _4515 = _4513 + _4473;
        float _4517 = fma(_3623, _3623, _4505);
        float _4519 = fma(_3631, _3631, _4517);
        float _4521 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4523 = sqrt(_4519);
        float _4525 = 1.0 / _3741;
        float _4527 = _4521 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4529 = precise::min(_4523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4531 = _4529 * _4507;
        float _4533 = _4531 * _4525;
        float _4535 = -_2611;
        float _4537 = _4535 + _4475;
        float _4539 = _4527 * _4533;
        float _4541 = _4511 * _4533;
        float _4543 = fma(_4537, _4539, _3603);
        float _4545 = fma(_4515, _4539, _3609);
        float _4547 = fma(_4527, _4541, _3619);
        _4491 = _4543;
        _4493 = _4545;
        _4495 = _4547;
        _3677 = _4523;
    }
    float _4549 = _4491;
    float _4551 = _4493;
    float _4553 = _4495;
    float _4555 = _3677;
    float _4557 = _4555;
    if (!_4375)
    {
        float _4559 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4561 = _4559 * 0.15915493667125701904296875;
        float _4563 = _4561 * 6.283185482025146484375;
        float _4565 = cos(_4563);
        float _4567 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4569 = _4567 * 0.15915493667125701904296875;
        float _4571 = _4561 * 6.283185482025146484375;
        float _4573 = sin(_4571);
        float _4575 = 1.0 / _4565;
        float _4577 = _4569 * 6.283185482025146484375;
        float _4579 = cos(_4577);
        float _4581 = _4573 * _4575;
        float _4583 = _4569 * 6.283185482025146484375;
        float _4585 = sin(_4583);
        float _4587 = _4579 * _4581;
        float _4589 = 1.0 / _4587;
        float _4591 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4593 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4591;
        float _4595 = 1.0 / _4593;
        float _4597 = _4585 * _4589;
        float _4599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4601 = fma(_4501, _4597, _4599);
        float _4603 = _4601 * _4595;
        float _4605 = precise::clamp(_4603, 0.0, 1.0);
        _2911 = _4561;
        _4503 = _4605;
    }
    float _4607 = _2911;
    float _4609 = _4503;
    float _4611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4613 = _4549 + _4611;
    float _4615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4617 = _4551 + _4615;
    float _4619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4621 = _4553 + _4619;
    float _4623 = _4613 * _4613;
    float _4625 = fma(_4617, _4617, _4623);
    float _4627 = fma(_4621, _4621, _4625);
    float _4629 = rsqrt(_4627);
    float _4631 = sqrt(_4627);
    float _4633 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4635 = _4617 * _4633;
    float _4637 = _4621 * _4633;
    float _4639 = _4635 * _4635;
    float _4641 = _4637 * _4637;
    float _4643 = _4639 + _4641;
    float _4645 = sqrt(_4643);
    bool _4647 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4651 = _4645 + _4649;
    float _4653 = _4625;
    float _4655 = _4629;
    float _4657 = _4651;
    float _4659 = _4613;
    if (_4647)
    {
        float _4661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4653 = _4661;
    }
    float _4663 = _4653;
    if (_4647)
    {
        float _4665 = rsqrt(_4643);
        _4655 = _4665;
    }
    float _4667 = _4655;
    float _4669 = _4667;
    if (_4647)
    {
        float _4671 = _4651 * _4663;
        _4657 = _4671;
    }
    float _4673 = _4657;
    if (_4647)
    {
        float _4675 = _4673 * 0.15915493667125701904296875;
        _2913 = _4675;
    }
    float _4677 = _2913;
    float _4679 = _4621;
    if (_4647)
    {
        float _4681 = _4677 * 6.283185482025146484375;
        float _4683 = sin(_4681);
        _4679 = _4683;
    }
    float _4685 = _4679;
    float _4687 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4689 = precise::max(0.0, _4687);
    float _4691 = _4607;
    if (_4647)
    {
        float _4693 = _4677 * 6.283185482025146484375;
        float _4695 = cos(_4693);
        _4691 = _4695;
    }
    float _4697 = _4691;
    float _4699 = -_4633;
    float _4701 = -_4689;
    float _4703 = fma(_4613, _4699, _4701);
    float _4705 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4647)
    {
        float _4707 = _4703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4659 = _4707;
    }
    float _4709 = _4659;
    float _4711 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4713 = _4709;
    float _4715 = _4685;
    if (_4647)
    {
        float _4717 = fma(_4685, _4709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4713 = _4717;
    }
    float _4719 = _4713;
    float _4721 = _4719;
    if (!_4647)
    {
        _4715 = _4639;
    }
    float _4723 = _4715;
    float _4725 = _4723;
    if (_4647)
    {
        float _4727 = _4697 + (-1.0);
        _4705 = _4727;
    }
    float _4729 = _4705;
    float _4731 = _4729;
    if (_4647)
    {
        float _4733 = _4667 * _4719;
        _4557 = _4733;
    }
    float _4735 = _4557;
    if (!_4647)
    {
        _4669 = _4635;
    }
    float _4737 = _4669;
    float _4739 = _4737;
    if (_4647)
    {
        float _4741 = _4729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3679 = _4741;
    }
    float _4743 = _3679;
    float _4745 = _4743;
    if (_4647)
    {
        float _4747 = _4635 * _4735;
        _4739 = _4747;
    }
    float _4749 = _4739;
    if (!_4647)
    {
        _4721 = _4703;
    }
    float _4751 = _4721;
    float _4753 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4755 = _4751;
    if (!_4647)
    {
        _4731 = _4637;
    }
    float _4757 = _4731;
    float _4759 = _4757;
    if (_4647)
    {
        float _4761 = fma(_4703, _4697, _4743);
        _4755 = _4761;
    }
    float _4763 = _4755;
    if (_4647)
    {
        float _4765 = _4749 * _4749;
        _4725 = _4765;
    }
    float _4767 = _4725;
    if (_4647)
    {
        float _4769 = _4637 * _4735;
        _4759 = _4769;
    }
    float _4771 = _4759;
    if (!_4647)
    {
        _4745 = _4641;
    }
    float _4773 = _4745;
    float _4775 = floor(_4711);
    float _4777 = fma(_4763, _4763, _4767);
    float _4779 = _4773;
    if (_4647)
    {
        float _4781 = _4771 * _4771;
        _4779 = _4781;
    }
    float _4783 = _4779;
    float _4785 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4787 = _4777 + _4783;
    float _4789 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4785);
    float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4793 = fma(_4631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4791);
    float _4795 = precise::clamp(_4793, 0.0, 1.0);
    float _4797 = rsqrt(_4787);
    float _4799 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4789);
    float _4801 = -_4795;
    float _4803 = _4801 + 1.0;
    float _4805 = fma(_3619, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4807 = _4799 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4809 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4811 = floor(_4805);
    float _4813 = _4807 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4815 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4817 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4809);
    float _4819 = -_4813;
    float _4821 = fma(_4819, _4753, 1.0);
    float _4823 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4825 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4815);
    float _4827 = abs(_4803);
    float _4829 = log2(_4827);
    float _4831 = _4797 * _4749;
    float _4833 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4823);
    float _4835 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4825);
    float _4837 = _4797 * _4763;
    float _4839 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4841 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4833);
    float _4843 = _4835 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4845 = _4797 * _4771;
    float _4847 = -_4839;
    float _4849 = fma(_4837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4847);
    float _4851 = _4841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4853 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4855 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4817);
    float _4857 = -_4845;
    float _4859 = fma(_4857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4849);
    float _4861 = -_4775;
    float _4863 = _4711 + _4861;
    float _4865 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4853);
    float _4867 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4869 = _4855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4871 = fma(_4859, -0.5, 0.5);
    float _4873 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4865);
    float _4875 = log2(_4821);
    float _4877 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4879 = fma(_4859, 0.5, 0.5);
    float _4881 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4873);
    float _4883 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4885 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4877);
    float _4887 = -_4811;
    float _4889 = _4805 + _4887;
    float _4891 = fma(_4879, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4893 = exp2(_4867);
    float _4895 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4883);
    float _4897 = _4837 + 1.0;
    float _4899 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4885);
    float _4901 = fma(_4879, _4891, -0.212114393711090087890625);
    float _4903 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4895);
    float _4905 = 1.0 / _4881;
    float _4907 = fma(_4879, _4901, 1.570728778839111328125);
    float _4909 = _4875 * 0.693147182464599609375;
    float _4911 = sqrt(_4871);
    float _4913 = -_4837;
    float _4915 = fma(_4893, _4897, _4913);
    float _4917 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4903);
    float _4919 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4899);
    float2 _12729 = float2(_4863, _4889);
    float _4921 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12729, float2(0.0), isnan(_12729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12729, float2(0.0), isnan(_12729)), level(0.0)).x;
    float _4923 = _4909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4925 = _4917 * _4905;
    float _4927 = _4919 * _4905;
    float _4929 = fma(_4925, 0.5, 0.5);
    float _4931 = fma(_4927, -0.5, 0.5);
    float _4933 = _4911 * 0.636619746685028076171875;
    float3 _12757 = float3(_4929, _4931, _4923);
    float _4935 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12757, float3(0.0), isnan(_12757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12757, float3(0.0), isnan(_12757)), level(0.0)).x;
    float3 _12768 = float3(_4929, _4931, _4923);
    float4 _4938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12768, float3(0.0), isnan(_12768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12768, float3(0.0), isnan(_12768)), level(0.0)).xyzw;
    float _4940 = _4938.x;
    float _4942 = _4938.y;
    float _4944 = _4938.z;
    float _4946 = _4938.w;
    float _4948 = -_4907;
    float _4950 = fma(_4933, _4948, 1.0);
    float _4952 = fma(_4915, 0.5, 0.5);
    float2 _12791 = float2(_4950, _4952);
    float3 _4956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12791, float2(0.0), isnan(_12791)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12791, float2(0.0), isnan(_12791)), level(0.0)).xyz;
    float _4958 = _4956.x;
    float _4960 = _4956.y;
    float _4962 = _4956.z;
    float _4964 = abs(_4501);
    float _4966 = log2(_4964);
    float _4968 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4970 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4972 = _4917 + _4881;
    float _4974 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4968);
    float _4976 = _4881 * 0.5;
    bool _4978 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4980 = isnan(_4631);
    bool _4982 = _4978 || _4980;
    bool _4984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4986 = _4982 || _4984;
    float _4988 = _4972 * 0.5;
    float _4990 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4974);
    float _4992 = exp2(_4970);
    bool _4994 = _4501 <= 8000.0;
    bool _4996 = isnan(_4501);
    bool _4998 = _4994 || _4996;
    bool _5000 = isnan(8000.0);
    bool _5002 = _4998 || _5000;
    float _5004 = float(_5002);
    float _5006 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4990);
    float _5008 = _4966 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5010 = in.m_99.x;
    out.gl_Position.x = _4917;
    out.gl_Position.y = _4919;
    out.gl_Position.z = _5006;
    out.gl_Position.w = _4881;
    float _5012 = exp2(_5008);
    float _5014 = -_4992;
    float _5016 = _5014 + 1.0;
    float _5018 = _5016 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5020 = _4917;
    float _5022 = _4919;
    float _5024 = _4881;
    float _5026 = _5006;
    if (!_4986)
    {
        _5020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5028 = _5020;
    float _5030 = fma(_5012, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5032 = precise::clamp(_5030, 0.0, 1.0);
    float _5034 = fma(_4919, -0.5, _4976);
    float _5036 = fma(_5032, -2.0, 3.0);
    float _5038 = _5032 * _5032;
    float _5040 = _5028;
    float _5042 = _5028;
    if (!_4986)
    {
        _5022 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5044 = _5022;
    float _5046 = _5038 * _5036;
    float _5048 = -_5046;
    float _5050 = _5048 + 1.0;
    float _5052 = fma(_5050, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5046);
    float _5054 = _5006 + _4881;
    float _5056 = _5004 * _5052;
    float _5058 = _5054 * 0.5;
    float _5060 = _5044;
    float _5062 = _5044;
    if (!_4986)
    {
        _5024 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5064 = _5024;
    float _5066 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5068 = _5064;
    float _5070 = _5064;
    if (!_4986)
    {
        _5026 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5072 = _5026;
    out.m_101.x = _4988;
    out.m_101.y = _5034;
    out.m_101.z = _5058;
    out.m_101.w = _4881;
    float _5074 = -_4921;
    float _5076 = _5074 + 1.0;
    float _5078 = _5076 * _5066;
    float _5080 = precise::clamp(_5078, 0.0, 1.0);
    float _5082 = -_5080;
    float _5084 = fma(_5082, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5086 = _5084 * _5010;
    float _5088 = _5018 * _4935;
    float _5090 = -_5018;
    float _5092 = _5090 + 1.0;
    float _5094 = _4946 * _5088;
    float _5096 = _4946 * _5092;
    float _5098 = _4962 * _5088;
    float _5100 = fma(_4958, _5094, _4940);
    float _5102 = fma(_4960, _5094, _4942);
    float _5104 = _5086 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5106 = fma(_4946, _5098, _4944);
    float _5108 = _4609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5110 = _5086;
    float _5112 = _5094;
    float _5114 = _5072;
    float _5116 = _5072;
    if (!_4986)
    {
        _5110 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5118 = _5110;
    out.m_103.x = _5104;
    float _5120 = _5118;
    float _5122 = _5118;
    if (!_4986)
    {
        _5112 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5124 = _5112;
    out.m_105.x = _5100;
    out.m_105.y = _5102;
    out.m_105.z = _5106;
    out.m_105.w = _5096;
    bool _5126 = !_4986;
    float _5128 = _5124;
    float _5130 = _5124;
    if (!_5126)
    {
        bool _5132 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5134 = isnan(_4631);
        bool _5136 = _5132 || _5134;
        bool _5138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5140 = _5136 || _5138;
        if (!_5140)
        {
            float _5142 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5144 = _4631 + _5142;
            float _5146 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5148 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5146;
            float _5150 = 1.0 / _5148;
            float _5152 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5154 = _5152 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5156 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5158 = _5156 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5160 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5162 = _5160 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5164 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5166 = _5164 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5168 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5170 = _5168 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5172 = _5144 * _5150;
            float _5174 = precise::clamp(_5172, 0.0, 1.0);
            float _5176 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5178 = _5176 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5180 = fma(_5174, _5158, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5182 = fma(_5174, _5178, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5184 = fma(_5174, _5154, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5186 = fma(_5174, _5162, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5188 = fma(_5174, _5166, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5190 = fma(_5174, _5170, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5062 = _5184;
            _5130 = _5188;
            _5116 = _5182;
            _5122 = _5186;
            _5042 = _5180;
            _5070 = _5190;
            _5192 = true;
        }
        else
        {
            bool _5194 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5196 = isnan(_4631);
            bool _5198 = _5194 || _5196;
            bool _5200 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5202 = _5198 || _5200;
            if (!_5202)
            {
                _5120 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5204 = _5120;
            _5122 = _5204;
            if (!_5202)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5206 = _5128;
            _5130 = _5206;
            if (!_5202)
            {
                _5068 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5208 = _5068;
            _5070 = _5208;
            if (!_5202)
            {
                _5114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5210 = _5114;
            _5116 = _5210;
            if (!_5202)
            {
                _5060 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5212 = _5060;
            _5062 = _5212;
            if (!_5202)
            {
                _5040 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5214 = _5040;
            bool _5216 = !_5202;
            _5042 = _5214;
            if (!_5216)
            {
                bool _5218 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5220 = isnan(_4631);
                bool _5222 = _5218 || _5220;
                bool _5224 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5226 = _5222 || _5224;
                if (!_5226)
                {
                    float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5230 = _4631 + _5228;
                    float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5234 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5232;
                    float _5236 = 1.0 / _5234;
                    float _5238 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5240 = _5238 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5242 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5244 = _5242 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5246 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5248 = _5246 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5250 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5252 = _5250 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5254 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5256 = _5254 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5258 = _5230 * _5236;
                    float _5260 = precise::clamp(_5258, 0.0, 1.0);
                    float _5262 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5264 = _5262 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5266 = fma(_5260, _5244, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5268 = fma(_5260, _5264, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5270 = fma(_5260, _5240, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5272 = fma(_5260, _5248, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5274 = fma(_5260, _5252, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5276 = fma(_5260, _5256, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5062 = _5270;
                    _5130 = _5274;
                    _5116 = _5268;
                    _5122 = _5272;
                    _5042 = _5266;
                    _5070 = _5276;
                    _5192 = true;
                }
                else
                {
                    _5062 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5122 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5042 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5070 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5192 = false;
    float _5278 = _5062;
    float _5280 = _5130;
    float _5282 = _5116;
    float _5284 = _5122;
    float _5286 = _5042;
    float _5288 = _5070;
    float _5290 = _5108 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5292 = fma(_4219, -0.5, 0.5);
    float _5294 = precise::clamp(_5292, 0.0, 1.0);
    float _5296 = -_5278;
    float _5298 = _5280 + _5296;
    float _5300 = -_5282;
    float _5302 = _5284 + _5300;
    out.m_55.x = _5290;
    float _5304 = fma(_5294, _5298, _5278);
    float _5306 = -_5286;
    float _5308 = _5288 + _5306;
    float _5310 = fma(_5294, _5302, _5282);
    float _5312 = _5304 * 0.586610972881317138671875;
    bool _5314 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5316 = fma(_5294, _5308, _5286);
    out.m_107.x = 0.0;
    float _5318 = fma(_5310, 0.298911988735198974609375, _5312);
    bool _5320 = _4609 > 0.0;
    bool _5322 = isnan(_4609);
    bool _5324 = _5320 || _5322;
    bool _5326 = isnan(0.0);
    bool _5328 = _5324 || _5326;
    float _5330 = fma(_5316, 0.114477999508380889892578125, _5318);
    float _5332 = -_5330;
    float _5334 = _5310 + _5332;
    float _5336 = -_5330;
    float _5338 = _5304 + _5336;
    float _5340 = -_5330;
    float _5342 = _5316 + _5340;
    float _5344 = fma(_5334, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    float _5346 = fma(_5338, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    float _5348 = fma(_5342, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    bool _5350 = !_5314;
    if (!_5350)
    {
        float _5352 = -_4549;
        float _5354 = _5352 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5356 = -_4551;
        float _5358 = _5356 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5360 = -_4553;
        float _5362 = _5360 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5364 = _5354 * _5354;
        float _5366 = fma(_5358, _5358, _5364);
        float _5368 = fma(_5362, _5362, _5366);
        float _5370 = sqrt(_5368);
        float _5372 = rsqrt(_5368);
        float _5374 = -_5370;
        float _5376 = _5374 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5378 = _5376 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5380 = precise::clamp(_5378, 0.0, 1.0);
        float _5382 = _5358 * _5372;
        float _5384 = _5354 * _5372;
        float _5386 = abs(_5380);
        float _5388 = log2(_5386);
        float _5390 = _5362 * _5372;
        float _5392 = _5382 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5394 = _4219 * _5384;
        float _5396 = -_5384;
        float _5398 = -_5392;
        float _5400 = fma(_5396, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5398);
        float _5402 = fma(_4213, _5382, _5394);
        float _5404 = -_5390;
        float _5406 = fma(_5404, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5400);
        float _5408 = fma(_4225, _5390, _5402);
        float _5410 = precise::clamp(_5408, 0.0, 1.0);
        float _5412 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5414 = _5406 + _5412;
        float _5416 = _5388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5418 = _5414 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5420 = precise::clamp(_5418, 0.0, 1.0);
        float _5422 = exp2(_5416);
        float _5424 = _5422 * _5420;
        float _5426 = _5410 * _5424;
        float _5428 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5430 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5432 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _5428;
        out.m_107.y = _5430;
        out.m_107.z = _5432;
    }
    out.m_109.x = _5344;
    out.m_109.y = _5346;
    out.m_109.z = _5348;
    if (_5328)
    {
        return out;
    }
    out.m_55.x = 0.0;
    float _5434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5434;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5192 = false;
    bool _4273 = false;
    bool _714 = false;
    bool _528 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _123 = in.m_48.w;
    float _125 = in.m_50.w;
    float _127 = trunc(_123);
    int _130 = int(_127);
    float _132 = -_125;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_53.y = _134;
    bool _138 = _130 >= 1;
    float _140 = 0.0;
    float _142 = _125;
    float _144 = _134;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _146 = _140;
    if (!_138)
    {
        out.m_55.x = 0.0;
    }
    int _148 = 0;
    if (!_138)
    {
        float _150 = _146 * 5.0;
        _148 = as_type<int>(_150);
    }
    int _152 = _148;
    int _154 = _152;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5502 = as_type<float>(_152);
        out.gl_Position.z = _5502;
    }
    if (!_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _156 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_125);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = float(_130);
    bool _168 = _134 >= _166;
    bool _170 = !_164;
    bool _172 = _168 || _170;
    float _174 = 1.0 / _166;
    if (_172)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _176 = _142;
    if (_172)
    {
        out.m_55.x = 0.0;
    }
    float _178 = _134 * _174;
    float _180 = _178;
    if (_172)
    {
        float _182 = _176 * 5.0;
        _154 = as_type<int>(_182);
    }
    int _184 = _154;
    out.m_53.x = _178;
    if (_172)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5565 = as_type<float>(_184);
        out.gl_Position.z = _5565;
    }
    if (_172)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _186 = in.m_57.x;
    float _188 = in.m_57.y;
    float _190 = in.m_57.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = _188 * _196;
    float _214 = _188 * _202;
    float _216 = fma(_186, _194, _212);
    float _218 = _188 * _208;
    float _220 = fma(_186, _200, _214);
    float _222 = fma(_190, _198, _216);
    float _224 = fma(_186, _206, _218);
    float _226 = fma(_190, _204, _220);
    float _228 = fma(_190, _210, _224);
    bool _230 = !_192;
    float _232 = _228;
    float _250;
    if (!_230)
    {
        float _234 = in.m_65.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        _250 = _178;
    }
    _252 = false;
    float _254 = _250;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _258 = _254 + _256;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _262 = _254 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _266 = _254 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _274 = _272 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _280 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _284 = 1.0 / _274;
    bool _286 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _288 = 1.0 / _278;
    bool _290 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _292 = isnan(_254);
    bool _294 = _290 || _292;
    bool _296 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _298 = _294 || _296;
    float _300 = float(_298);
    float _302 = 1.0 / _270;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _254 + _304;
    float _308 = _306 * _284;
    bool _310 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _312 = isnan(_254);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = 1.0 / _282;
    float _324 = _258 * _288;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _330;
    float _334 = _262 * _302;
    bool _336 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_254);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -_320;
    float _350 = _348 + 1.0;
    float _352 = fma(_332, _324, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _354 = fma(_328, _324, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = _346 * _350;
    float _358 = -_346;
    float _360 = _358 + 1.0;
    float _362 = _266 * _322;
    bool _364 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _366 = isnan(_254);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    bool _380 = _254 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_254);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _396 = fma(_378, _324, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _398 = -_374;
    float _400 = _398 + 1.0;
    float _402 = _374 * _360;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = _300 * _400;
    float _414 = -_300;
    float _416 = _414 + 1.0;
    float _418 = fma(_394, _362, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _420 = fma(_410, _362, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _422 = fma(_406, _362, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = _390 * _416;
    float _426 = -_390;
    float _428 = _426 + 1.0;
    float _430 = _352 * _424;
    float _432 = _354 * _424;
    float _434 = _396 * _424;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].x, _430);
    float _442 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].y, _432);
    float _444 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[143].z, _434);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _450;
    float _454 = fma(_418, _412, _440);
    float _456 = fma(_420, _412, _442);
    float _458 = fma(_422, _412, _444);
    float _460 = fma(_438, _334, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _462 = fma(_448, _334, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _464 = fma(_452, _334, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _478 = fma(_460, _402, _454);
    float _480 = fma(_468, _308, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _482 = fma(_472, _308, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _484 = fma(_476, _308, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _486 = fma(_462, _402, _456);
    float _488 = fma(_464, _402, _458);
    float _490 = fma(_480, _356, _478);
    float _492 = fma(_482, _356, _486);
    float _494 = fma(_484, _356, _488);
    float _496 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].x, _490);
    float _498 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].y, _492);
    float _500 = fma(_320, (*spvDescriptorSet0.vp_c9)._m0[147].z, _494);
    bool _502 = !_286;
    int _504 = as_type<int>(_500);
    int _506 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _508 = _334;
    float _526;
    if (!_502)
    {
        float _510 = in.m_65.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        _526 = _178;
    }
    _528 = false;
    float _530 = _526;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _534 = _530 + _532;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _542 = _540 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _546 = isnan(_530);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _556 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _560 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _562 = isnan(_530);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = 1.0 / _538;
    float _574 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _576 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _574;
    float _578 = -_554;
    float _580 = _578 + 1.0;
    bool _582 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _584 = isnan(_530);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    bool _594 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _596 = 1.0 / _542;
    float _598 = 1.0 / _558;
    float _600 = _576 * _572;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _606 = _570 * _580;
    float _608 = -_570;
    float _610 = _608 + 1.0;
    float _612 = fma(_600, _534, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _614;
    float _618 = _592 * _610;
    float _620 = _604 * _596;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _624 = _530 + _622;
    bool _626 = _530 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _628 = isnan(_530);
    bool _630 = _626 || _628;
    bool _632 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _634 = _630 || _632;
    float _636 = float(_634);
    float _638 = _612 * _618;
    float _640 = -_592;
    float _642 = _640 + 1.0;
    float _644 = fma(_620, _624, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _648 = _530 + _646;
    float _650 = _616 * _598;
    float _652 = -_636;
    float _654 = _652 + 1.0;
    float _656 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[115].x, _638);
    float _658 = in.m_67.x;
    float _660 = in.m_67.y;
    float _662 = in.m_67.z;
    float _664 = fma(_650, _648, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _666 = _554 * _654;
    float _668 = fma(_644, _606, _656);
    float _670 = fma(_664, _666, _668);
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _674 = fma(_636, (*spvDescriptorSet0.vp_c9)._m0[118].x, _670);
    float _676 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _680 = _672 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _682 = _674 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _684 = _676 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_69.x = _680;
    out.m_69.y = _684;
    out.m_69.z = _686;
    out.m_69.w = _682;
    float _688 = _500 * _662;
    float _690 = _498 * _660;
    float _692 = _496 * _658;
    bool _694 = !_594;
    float _712;
    if (!_694)
    {
        float _696 = in.m_65.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        _712 = _178;
    }
    _714 = false;
    float _716 = _712;
    float _718 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _720 = _716 + _718;
    float _722 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _724 = _722 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _728 = isnan(_716);
    bool _730 = _726 || _728;
    bool _732 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _734 = _730 || _732;
    float _736 = float(_734);
    float _738 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _740 = _738 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _742 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _744 = isnan(_716);
    bool _746 = _742 || _744;
    bool _748 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _750 = _746 || _748;
    float _752 = float(_750);
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _754;
    bool _758 = _716 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _760 = isnan(_716);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = 1.0 / _724;
    float _772 = -_736;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _778 = _716 + _776;
    bool _780 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _782 = 1.0 / _740;
    float _784 = _756 * _770;
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _788 = _786 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _790 = -_768;
    float _792 = _790 + 1.0;
    float _794 = fma(_784, _720, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _796 = _752 * _774;
    float _798 = -_752;
    float _800 = _798 + 1.0;
    float _802 = _736 * _792;
    float _804 = _788 * _782;
    float _806 = _794 * _796;
    float _808 = fma(_804, _778, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _810 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[131].x, _806);
    float _812 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _814 = fma(_808, _802, _810);
    float _816 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _818 = _812 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _822 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[133].x, _814);
    float _824 = _816 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _826 = _820 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _828 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _824;
    out.m_71.y = _826;
    out.m_71.z = _818;
    out.m_71.w = _828;
    bool _830 = !_780;
    if (!_830)
    {
        float _832 = in.m_65.x;
        float _834 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _836 = _832 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _838 = fma(_836, (*spvDescriptorSet0.vp_c9)._m0[14].x, _134);
        float _840 = _838 * _834;
        float _842 = floor(_840);
        float _844 = -_842;
        float _846 = _840 + _844;
        _180 = _846;
    }
    float _848 = _180;
    float _850 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _852 = int(_850);
    float _854 = in.m_65.y;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _858 = _856 != 0;
    float _860 = in.m_73.x;
    int _862 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _864 = _862 != 0;
    float _866 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _868 = int(_866);
    int _870 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _872 = _870 != 0;
    float _874 = in.m_65.w;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _878 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _880 = _878 != 0;
    float _882 = float(_852);
    float _884 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _886 = int(_884);
    int _888 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _890 = _888 != 0;
    float _892 = 0.0;
    int _894 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_864)
    {
        _892 = 1.0;
    }
    float _896 = _892;
    float _898 = _828;
    float _900 = _896;
    if (_858)
    {
        float _902 = in.m_65.x;
        _898 = _902;
    }
    float _904 = _898;
    float _906 = 0.0;
    if (_864)
    {
        _906 = 1.0;
    }
    float _908 = _906;
    float _910 = float(_868);
    float _912 = 1.0 / _882;
    int _914 = 0;
    float _916 = _908;
    if (_864)
    {
        _914 = 0;
    }
    int _918 = _914;
    int _920 = _918;
    if (_864)
    {
        _894 = 0;
    }
    int _922 = _894;
    float _924 = 0.0;
    int _926 = _922;
    float _928 = _860;
    if (!_858)
    {
        _924 = _860;
    }
    float _930 = _924;
    float _932 = _736;
    float _934 = _930;
    if (_872)
    {
        float _936 = in.m_65.z;
        _932 = _936;
    }
    float _938 = _932;
    float _940 = 0.0;
    if (!_872)
    {
        _940 = _860;
    }
    float _942 = _940;
    float _944 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _946 = int(_944);
    int _948 = ~_886;
    int _950 = _948 + 1;
    float _952 = _942;
    if (_872)
    {
        float _954 = -_860;
        float _956 = _954 + 1.0;
        _504 = as_type<int>(_956);
    }
    int _958 = _504;
    bool _960 = _874 > 0.5;
    float _962 = _912 * _134;
    float _964 = 1.0 / _910;
    bool _966 = false;
    float _968 = _874;
    if (_858)
    {
        bool _970 = _904 > 0.5;
        _966 = _970;
    }
    bool _972 = _966;
    float _974 = float(_946);
    float _976 = trunc(_962);
    int _978 = int(_976);
    float _980 = float(uint(_886));
    float _982 = as_type<float>(_946);
    int _984 = as_type<int>(_974);
    if (_864)
    {
        float _986 = in.m_65.x;
        _982 = _986;
    }
    float _988 = _982;
    bool _990 = false;
    float _992 = _938;
    if (_872)
    {
        bool _994 = _938 > 0.5;
        _990 = _994;
    }
    bool _996 = _990;
    float _998 = 1.0 / _980;
    float _1000 = _964 * _134;
    float _1002 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1004 = int(_1002);
    float _1006 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1008 = float(uint(_978));
    float _1010 = fma(_1006, -2.0, _876);
    float _1012 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1014 = int(_1012);
    int _1016 = as_type<int>(_998) + (-2);
    float _1018 = _1008;
    float _1020 = _988;
    if (_864)
    {
        _968 = _988;
    }
    float _1022 = _968;
    float _1024 = as_type<float>(_1016) * _1008;
    float _1026 = _1022;
    if (_864)
    {
        _1018 = _854;
    }
    float _1028 = _1018;
    float _1030 = trunc(_1000);
    int _1032 = int(_1030);
    float _1034 = float(uint(_1004));
    float _1036 = _1028;
    if (_864)
    {
        _992 = _1022;
    }
    float _1038 = _992;
    float _1040 = float(uint(_1014));
    float _1042 = 1.0 / _1034;
    float _1044 = 1.0 / _1040;
    float _1046 = trunc(_1024);
    float _1048 = precise::max(_1046, 0.0);
    uint _1051 = uint(_1048);
    float _1053 = 1.0 / _974;
    float _1055 = _1038;
    if (_858)
    {
        float _1057 = -_860;
        float _1059 = _1057 + 1.0;
        _984 = as_type<int>(_1059);
    }
    int _1061 = _984;
    float _1063 = as_type<float>(_1061);
    if (_858)
    {
        float _1065 = _972 ? as_type<float>(_1061) : _860;
        _934 = _1065;
    }
    float _1067 = _934;
    if (_864)
    {
        _1063 = _1022;
    }
    float _1069 = _1063;
    float _1071 = _1069;
    if (!_864)
    {
        float _1073 = in.m_65.x;
        float _1075 = _854 * 3.1415927410125732421875;
        float _1077 = in.m_65.z;
        float _1079 = _1075 * 0.15915493667125701904296875;
        float _1081 = _1079 * 6.283185482025146484375;
        float _1083 = sin(_1081);
        float _1085 = _1073 * 3.1415927410125732421875;
        float _1087 = _1085 * 0.15915493667125701904296875;
        float _1089 = _1087 * 6.283185482025146484375;
        float _1091 = sin(_1089);
        _1020 = _1073;
        _900 = 7.345489978790283203125;
        _1071 = _1077;
        _916 = 5.839270114898681640625;
        _1036 = _1083;
        _1026 = _854;
        _1055 = _1091;
        _920 = 1;
        _926 = 2;
    }
    float _1093 = _1020;
    float _1095 = _900;
    float _1097 = _1071;
    float _1099 = _916;
    float _1101 = _1036;
    float _1103 = _1026;
    float _1105 = _1055;
    int _1107 = _920;
    int _1109 = _926;
    int _1111 = _950 * int(_1051);
    int _1113 = _1111 + _978;
    int _1115 = as_type<int>(_1097);
    if (_880)
    {
        float _1117 = -_860;
        float _1119 = _1117 + 1.0;
        _506 = as_type<int>(_1119);
    }
    int _1121 = _506;
    if (_872)
    {
        float _1123 = _996 ? as_type<float>(_958) : _860;
        _952 = _1123;
    }
    float _1125 = _952;
    float _1127 = _1093 * _1095;
    float _1129 = float(uint(_1113));
    float _1131 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    bool _1133 = _854 > 0.5;
    float _1135 = _1053 * _134;
    float _1137 = _1097 * _1099;
    float _1139 = as_type<float>(_1016) * _1129;
    float _1141 = fma(_1101, (*spvDescriptorSet0.vp_c9)._m0[93].w, _1131);
    float _1143 = _1103 * _1095;
    float _1145 = _1101 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _1147 = as_type<int>(_1042) + (-2);
    float _1149 = trunc(_1139);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    float _1155 = float(uint(_1032));
    float _1157 = in.m_73.y;
    if (!_880)
    {
        _508 = _860;
    }
    float _1159 = _508;
    float _1161 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _1163 = _1159;
    if (_880)
    {
        float _1165 = _1133 ? as_type<float>(_1121) : _860;
        _1163 = _1165;
    }
    float _1167 = _1163;
    float _1169 = as_type<float>(_1147) * _1155;
    float _1171 = floor(_1127);
    float _1173 = fma(_1105, (*spvDescriptorSet0.vp_c9)._m0[93].z, _1161);
    if (_890)
    {
        float _1175 = -_860;
        float _1177 = _1175 + 1.0;
        _1115 = as_type<int>(_1177);
    }
    int _1179 = _1115;
    float _1181 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _1183 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _1185 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _1187 = floor(_1137);
    int _1189 = int(_1051) + int(_1153);
    float _1191 = -_1181;
    float _1193 = fma(_1183, 2.0, _1191);
    float _1195 = fma(_1145, -2.0, _1185);
    if (_890)
    {
        float _1197 = _1133 ? as_type<float>(_1179) : _860;
        _928 = _1197;
    }
    float _1199 = _928;
    float _1201 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1203 = ~_886;
    int _1205 = _1203 + 1;
    float _1207 = _1093 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1209 = floor(_1143);
    float _1211 = in.m_65.z;
    float _1213 = -_1171;
    float _1215 = _1127 + _1213;
    float _1217 = -_1201;
    float _1219 = fma(_1207, 2.0, _1217);
    int _1221 = _1205 * _1189;
    int _1223 = _1221 + _978;
    int _1225 = as_type<int>(_1044) + (-2);
    int _1227 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1229 = _1227 != 0;
    float _1231 = float(_886);
    float _1233 = trunc(_1135);
    int _1235 = int(_1233);
    float _1237 = -_1187;
    float _1239 = _1137 + _1237;
    bool _1241 = uint(_1223) >= uint(_886);
    int _1243 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1245 = _1243 != 0;
    int _1247 = ~_1014;
    int _1249 = _1247 + 1;
    int _1251 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1253 = _1251 != 0;
    int _1255 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _1257 = _1255 != 0;
    float _1259 = trunc(_1169);
    float _1261 = precise::max(_1259, 0.0);
    uint _1263 = uint(_1261);
    float _1265 = -_1209;
    float _1267 = _1143 + _1265;
    int _1269 = ~_1004;
    int _1271 = _1269 + 1;
    float _1273 = _1093 * 2.0;
    float _1275 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1010);
    float _1277 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[92].w, _1141);
    float _1279 = float(uint(_1235));
    float _1281 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1283 = float(_978);
    float _1285 = floor(_1273);
    bool _1287 = _1211 > 0.5;
    float _1289 = as_type<float>(_1225) * _1279;
    float _1291 = -_1157;
    float _1293 = _1291 + 1.0;
    bool _1295 = _1283 >= _1231;
    bool _1297 = isnan(_1283);
    bool _1299 = _1295 || _1297;
    bool _1301 = isnan(_1231);
    bool _1303 = _1299 || _1301;
    float _1305 = float(_1303);
    int _1307 = _1271 * int(_1263);
    int _1309 = _1307 + _1032;
    float _1311 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[92].z, _1173);
    float _1313 = trunc(_1289);
    float _1315 = precise::max(_1313, 0.0);
    uint _1317 = uint(_1315);
    int _1319 = _960 ? as_type<int>(_1293) : as_type<int>(_1157);
    float _1321 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[91].y, _1195);
    float _1323 = float(uint(_1309));
    float _1325 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _1327 = _1133 ? as_type<int>(_1293) : as_type<int>(_1157);
    float _1329 = -_134;
    float _1331 = fma(_1329, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1219);
    float _1333 = trunc(_1305);
    int _1335 = int(_1333);
    float _1337 = as_type<float>(_1147) * _1323;
    int _1339 = _1287 ? as_type<int>(_1293) : as_type<int>(_1157);
    int _1341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1343 = _1341 != 0;
    float _1345 = _1229 ? as_type<float>(_1327) : _1157;
    float _1347 = in.m_59.w;
    bool _1349 = !_1343;
    int _1351 = _1349 ? 0 : 1;
    float _1353 = trunc(_1337);
    float _1355 = precise::max(_1353, 0.0);
    uint _1357 = uint(_1355);
    int _1359 = _1249 * int(_1317);
    int _1361 = _1359 + _1235;
    bool _1363 = !_1241;
    int _1365 = _1363 ? 0 : (-1);
    bool _1367 = _1107 != 1;
    float _1369 = _1253 ? as_type<float>(_1319) : _1157;
    int _1371 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _1373 = _1371 != 0;
    float _1375 = _1245 ? as_type<float>(_1339) : _1157;
    float _1377 = _1257 ? as_type<float>(_1339) : _1157;
    float _1379 = float(uint(_1361));
    int _1381 = ~_1189;
    int _1383 = _1381 + _1365;
    int _1385 = _1383 + 1;
    int _1387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1389 = _1387 != 0;
    int _1391 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1393 = _1391 != 0;
    float _1395 = as_type<float>(_1225) * _1379;
    int _1397 = int(_1263) + int(_1357);
    float _1399 = _1231 * _1239;
    bool _1401 = _886 == 0;
    int _1403 = _886 * _1385;
    int _1405 = _1403 + _978;
    float _1407 = _174 * _134;
    float _1409 = trunc(_1395);
    float _1411 = precise::max(_1409, 0.0);
    uint _1413 = uint(_1411);
    bool _1415 = !_1393;
    int _1417 = _1415 ? 0 : 1;
    bool _1419 = !_1389;
    int _1421 = _1419 ? 0 : 1;
    float _1423 = _1231 * _1407;
    int _1425 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1427 = _1425 != 0;
    int _1429 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1431 = _1429 != 0;
    int _1433 = ~_1335;
    int _1435 = _1433 + 1;
    int _1437 = _1435 + 1;
    float _1439 = trunc(_1399);
    int _1441 = int(_1439);
    bool _1443 = !_1401;
    int _1445 = _1443 ? _1405 : (-1);
    int _1447 = _886 + (-1);
    bool _1449 = !_1431;
    int _1451 = _1449 ? 0 : 1;
    int _1453 = _1445 * _1437;
    bool _1455 = !_1427;
    int _1457 = _1455 ? 0 : 1;
    float _1459 = trunc(_1423);
    int _1461 = int(_1459);
    int _1463 = abs(_1451);
    int _1465 = _1335 * _1447;
    int _1467 = _1465 + _1453;
    int _1469 = ~_1004;
    int _1471 = _1469 + 1;
    int _1473 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1475 = _1473 != 0;
    int _1477 = _1471 * _1397;
    int _1479 = _1477 + _1032;
    int _1481 = int(_1317) + int(_1413);
    int _1483 = abs(_1457);
    int _1485 = _1467 * _1463;
    bool _1487 = !_1475;
    int _1489 = _1487 ? 0 : 1;
    int _1491 = ~_1014;
    int _1493 = _1491 + 1;
    int _1495 = abs(_1351);
    int _1497 = abs(_1489);
    bool _1499 = uint(_1479) >= uint(_1004);
    int _1501 = _1461 * _1483;
    int _1503 = _1501 + _1485;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1507 = _1505 != 0;
    int _1509 = _1493 * _1481;
    int _1511 = _1509 + _1235;
    int _1513 = _1441 * _1495;
    int _1515 = _1513 + _978;
    float _1517 = float(_1004);
    float _1519 = float(_1032);
    bool _1521 = !_1507;
    int _1523 = _1521 ? 0 : 1;
    bool _1525 = uint(_1511) >= uint(_1014);
    int _1527 = _1515 * _1497;
    int _1529 = _1527 + _1503;
    bool _1531 = _1519 >= _1517;
    bool _1533 = isnan(_1519);
    bool _1535 = _1531 || _1533;
    bool _1537 = isnan(_1517);
    bool _1539 = _1535 || _1537;
    float _1541 = float(_1539);
    int _1543 = abs(_1523);
    bool _1545 = !_1499;
    int _1547 = _1545 ? 0 : (-1);
    int _1549 = _1441 * _1543;
    int _1551 = _1549 + _1529;
    int _1553 = ~_1397;
    int _1555 = _1553 + _1547;
    int _1557 = _1555 + 1;
    float _1559 = trunc(_1541);
    int _1561 = int(_1559);
    float _1563 = float(_1014);
    float _1565 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1567 = float(_1235);
    int _1569 = _1004 * _1557;
    int _1571 = _1569 + _1032;
    float _1573 = _1563 * _1407;
    bool _1575 = _1567 >= _1563;
    bool _1577 = isnan(_1567);
    bool _1579 = _1575 || _1577;
    bool _1581 = isnan(_1563);
    bool _1583 = _1579 || _1581;
    float _1585 = float(_1583);
    float _1587 = _1517 * _1215;
    float _1589 = _1517 * _1407;
    float _1591 = float(uint(_1551));
    float _1593 = _1563 * _1267;
    int _1595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1597 = _1595 != 0;
    float _1599 = trunc(_1585);
    int _1601 = int(_1599);
    bool _1603 = !_1525;
    int _1605 = _1603 ? 0 : (-1);
    float _1607 = as_type<float>(_1016) * _1591;
    bool _1609 = !_1597;
    int _1611 = _1609 ? 0 : 1;
    bool _1613 = _1004 == 0;
    int _1615 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1617 = _1615 != 0;
    float _1619 = _1215;
    if (!_1367)
    {
        _1619 = _854;
    }
    float _1621 = _1619;
    float _1623 = trunc(_1587);
    int _1625 = int(_1623);
    float _1627 = _1621;
    if (_1367)
    {
        _1627 = _1093;
    }
    float _1629 = _1627;
    int _1631 = ~_1481;
    int _1633 = _1631 + _1605;
    int _1635 = _1633 + 1;
    int _1637 = ~_1561;
    int _1639 = _1637 + 1;
    int _1641 = _1639 + 1;
    float _1643 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1565);
    bool _1645 = !_1613;
    int _1647 = _1645 ? _1571 : (-1);
    float _1649 = trunc(_1607);
    float _1651 = precise::max(_1649, 0.0);
    uint _1653 = uint(_1651);
    int _1655 = abs(_1611);
    int _1657 = _1014 * _1635;
    int _1659 = _1657 + _1235;
    bool _1661 = _1014 == 0;
    int _1663 = _1647 * _1641;
    int _1665 = ~_886;
    int _1667 = _1665 + 1;
    bool _1669 = !_1617;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = _1004 + (-1);
    int _1675 = _1625 * _1655;
    int _1677 = _1675 + _1032;
    int _1679 = ~_1601;
    int _1681 = _1679 + 1;
    int _1683 = _1681 + 1;
    float _1685 = trunc(_1589);
    int _1687 = int(_1685);
    bool _1689 = !_1661;
    int _1691 = _1689 ? _1659 : (-1);
    int _1693 = _1561 * _1673;
    int _1695 = _1693 + _1663;
    bool _1697 = _1109 != 2;
    int _1699 = _1014 + (-1);
    int _1701 = _1691 * _1683;
    int _1703 = abs(_1417);
    int _1705 = _1667 * int(_1653);
    int _1707 = _1705 + _1551;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1711 = _1709 != 0;
    int _1713 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1715 = _1713 != 0;
    int _1717 = _1601 * _1699;
    int _1719 = _1717 + _1701;
    float _1721 = trunc(_1593);
    int _1723 = int(_1721);
    int _1725 = abs(_1671);
    float _1727 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1643);
    float _1729 = float(uint(_1707));
    int _1731 = _1695 * _1703;
    bool _1733 = !_1715;
    int _1735 = _1733 ? 0 : 1;
    bool _1737 = !_1373;
    int _1739 = _1737 ? 0 : 1;
    int _1741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1743 = _1741 != 0;
    float _1745 = as_type<float>(_1016) * _1729;
    float _1747 = trunc(_1573);
    int _1749 = int(_1747);
    int _1751 = abs(_1735);
    bool _1753 = !_1711;
    int _1755 = _1753 ? 0 : 1;
    int _1757 = abs(_1421);
    int _1759 = _1719 * _1751;
    bool _1761 = !_1743;
    int _1763 = _1761 ? 0 : 1;
    float _1765 = trunc(_1745);
    float _1767 = precise::max(_1765, 0.0);
    uint _1769 = uint(_1767);
    int _1771 = abs(_1755);
    int _1773 = _1687 * _1757;
    int _1775 = _1773 + _1731;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1779 = _1777 != 0;
    int _1781 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1783 = _1781 != 0;
    int _1785 = abs(_1763);
    int _1787 = _1723 * _1725;
    int _1789 = _1787 + _1235;
    int _1791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1793 = _1791 != 0;
    int _1795 = _1677 * _1785;
    int _1797 = _1795 + _1775;
    bool _1799 = !_1779;
    int _1801 = _1799 ? 0 : 1;
    bool _1803 = !_1793;
    int _1805 = _1803 ? 0 : 1;
    int _1807 = _1749 * _1771;
    int _1809 = _1807 + _1759;
    int _1811 = int(_1653) + int(_1769);
    float _1813 = float(uint(_1515));
    bool _1815 = !_1783;
    int _1817 = _1815 ? 0 : 1;
    int _1819 = abs(_1801);
    float _1821 = as_type<float>(_1016) * _1813;
    int _1823 = abs(_1805);
    int _1825 = abs(_1817);
    float _1827 = trunc(_1821);
    float _1829 = precise::max(_1827, 0.0);
    uint _1831 = uint(_1829);
    int _1833 = ~_886;
    int _1835 = _1833 + 1;
    int _1837 = _1625 * _1823;
    int _1839 = _1837 + _1797;
    int _1841 = _1835 * _1811;
    int _1843 = _1841 + _1551;
    int _1845 = ~_886;
    int _1847 = _1845 + 1;
    int _1849 = _1789 * _1819;
    int _1851 = _1849 + _1809;
    float _1853 = float(uint(_1839));
    bool _1855 = uint(_1843) >= uint(_886);
    int _1857 = _1723 * _1825;
    int _1859 = _1857 + _1851;
    float _1861 = float(uint(_1677));
    float _1863 = as_type<float>(_1147) * _1853;
    bool _1865 = !_1855;
    int _1867 = _1865 ? 0 : (-1);
    int _1869 = _1847 * int(_1831);
    int _1871 = _1869 + _1515;
    float _1873 = float(uint(_1859));
    float _1875 = as_type<float>(_1147) * _1861;
    int _1877 = ~_1811;
    int _1879 = _1877 + _1867;
    int _1881 = _1879 + 1;
    float _1883 = trunc(_1863);
    float _1885 = precise::max(_1883, 0.0);
    uint _1887 = uint(_1885);
    float _1889 = float(uint(_1871));
    float _1891 = as_type<float>(_1225) * _1873;
    int _1893 = ~_1004;
    int _1895 = _1893 + 1;
    int _1897 = _886 * _1881;
    int _1899 = _1897 + _1551;
    float _1901 = float(uint(_1789));
    float _1903 = as_type<float>(_1016) * _1889;
    float _1905 = trunc(_1891);
    float _1907 = precise::max(_1905, 0.0);
    uint _1909 = uint(_1907);
    float _1911 = as_type<float>(_1723);
    float _1913 = as_type<float>(_1895);
    if (!_1367)
    {
        _1911 = _1211;
    }
    float _1915 = _1911;
    float _1917 = as_type<float>(_1225) * _1901;
    bool _1919 = !_1401;
    int _1921 = _1919 ? _1899 : (-1);
    float _1923 = _1915;
    if (_1367)
    {
        _1923 = _854;
    }
    float _1925 = _1923;
    int _1927 = _1921 & 3;
    bool _1929 = _1927 != 0;
    float _1931 = trunc(_1875);
    float _1933 = precise::max(_1931, 0.0);
    uint _1935 = uint(_1933);
    int _1937 = _1895 * int(_1887);
    int _1939 = _1937 + _1839;
    int _1941 = ~_1014;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1925, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1281);
    int _1947 = _1921 & 3;
    bool _1949 = _1947 != 0;
    float _1951 = float(uint(_1939));
    float _1953 = trunc(_1917);
    float _1955 = precise::max(_1953, 0.0);
    uint _1957 = uint(_1955);
    int _1959 = _1943 * int(_1909);
    int _1961 = _1959 + _1859;
    if (!_1367)
    {
        _1913 = _854;
    }
    float _1963 = _1913;
    float _1965 = as_type<float>(_1147) * _1951;
    float _1967 = _1963;
    if (_1367)
    {
        _1967 = _1093;
    }
    float _1969 = _1967;
    int _1971 = _1929 ? 0 : 1;
    int _1973 = _1895 * int(_1935);
    int _1975 = _1973 + _1677;
    bool _1977 = uint(_1947) > 1u;
    float _1979 = _1969 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _1981 = ~_1014;
    int _1983 = _1981 + 1;
    float _1985 = trunc(_1965);
    float _1987 = precise::max(_1985, 0.0);
    uint _1989 = uint(_1987);
    float _1991 = float(uint(_1961));
    float _1993 = -_1325;
    float _1995 = fma(_1979, 2.0, _1993);
    float _1997 = float(uint(_1975));
    float _1999 = as_type<float>(_1225) * _1991;
    bool _2001 = _1004 == 0;
    float _2003 = trunc(_1903);
    float _2005 = precise::max(_2003, 0.0);
    uint _2007 = uint(_2005);
    float _2009 = as_type<float>(_1147) * _1997;
    int _2011 = _1983 * int(_1957);
    int _2013 = _2011 + _1789;
    int _2015 = ~_1004;
    int _2017 = _2015 + 1;
    float _2019 = -_134;
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1995);
    int _2023 = ~_1014;
    int _2025 = _2023 + 1;
    float _2027 = _854 * 2.0;
    float _2029 = float(uint(_2013));
    float _2031 = trunc(_1999);
    float _2033 = precise::max(_2031, 0.0);
    uint _2035 = uint(_2033);
    int _2037 = ~_1971;
    int _2039 = _2037 + 1;
    int _2041 = _2039 + 1;
    int _2043 = _2041;
    float _2045 = _2029;
    if (!_1977)
    {
        int _2047 = ~_1971;
        int _2049 = _2047 + 1;
        _2043 = _2049;
    }
    int _2051 = _2043;
    float _2053 = as_type<float>(_1225) * _2029;
    bool _2055 = uint(_1947) >= 2u;
    int _2057 = int(_1887) + int(_1989);
    float _2059 = trunc(_2009);
    float _2061 = precise::max(_2059, 0.0);
    uint _2063 = uint(_2061);
    int _2065 = _2055 ? 0 : 1;
    bool _2067 = _1947 != 3;
    int _2069 = _2017 * _2057;
    int _2071 = _2069 + _1839;
    int _2073 = int(_1831) + int(_2007);
    float _2075 = trunc(_2053);
    float _2077 = precise::max(_2075, 0.0);
    uint _2079 = uint(_2077);
    int _2081 = int(_1909) + int(_2035);
    float _2083 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2085 = ~_2065;
    int _2087 = _2085 + 1;
    int _2089 = _2087 + 1;
    bool _2091 = uint(_2071) >= uint(_1004);
    int _2093 = _2089;
    if (_2067)
    {
        int _2095 = ~_2065;
        int _2097 = _2095 + 1;
        _2093 = _2097;
    }
    int _2099 = _2093;
    int _2101 = _2025 * _2081;
    int _2103 = _2101 + _1859;
    bool _2105 = !_2091;
    int _2107 = _2105 ? 0 : (-1);
    int _2109 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2111 = _2109 != 0;
    bool _2113 = uint(_2103) >= uint(_1014);
    int _2115 = ~_2057;
    int _2117 = _2115 + _2107;
    int _2119 = _2117 + 1;
    bool _2121 = !_2111;
    int _2123 = _2121 ? 0 : 1;
    int _2125 = int(_1957) + int(_2079);
    int _2127 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2129 = _2127 != 0;
    bool _2131 = !_2113;
    int _2133 = _2131 ? 0 : (-1);
    int _2135 = _1004 * _2119;
    int _2137 = _2135 + _1839;
    int _2139 = ~_886;
    int _2141 = _2139 + 1;
    int _2143 = int(_1935) + int(_2063);
    int _2145 = ~_2081;
    int _2147 = _2145 + _2133;
    int _2149 = _2147 + 1;
    int _2151 = _2141 * _2073;
    int _2153 = _2151 + _1515;
    int _2155 = ~_1004;
    int _2157 = _2155 + 1;
    bool _2159 = !_2001;
    int _2161 = _2159 ? _2137 : (-1);
    int _2163 = _1014 * _2149;
    int _2165 = _2163 + _1859;
    bool _2167 = uint(_2153) >= uint(_886);
    int _2169 = _2157 * _2143;
    int _2171 = _2169 + _1677;
    float _2173 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2175 = log2(_2173);
    int _2177 = _2161 & 3;
    float _2179 = as_type<float>(_2119);
    float _2181 = as_type<float>(_2153);
    if (_1697)
    {
        _2179 = _1093;
    }
    float _2183 = _2179;
    float _2185 = _2183;
    if (_1697)
    {
        _2181 = _854;
    }
    float _2187 = _2181;
    float _2189 = _2187;
    if (!_1697)
    {
        _2185 = _1211;
    }
    float _2191 = _2185;
    if (!_1697)
    {
        _2189 = _1093;
    }
    float _2193 = _2189;
    bool _2195 = uint(_2171) >= uint(_1004);
    float _2197 = _2191 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _2199 = uint(_2177) >= 2u;
    bool _2201 = !_2195;
    int _2203 = _2201 ? 0 : (-1);
    float _2205 = _2175 * _134;
    bool _2207 = uint(_2177) > 1u;
    float _2209 = -_2083;
    float _2211 = fma(_2197, 2.0, _2209);
    int _2213 = _2199 ? 0 : 1;
    float _2215 = _2193 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2217 = _2177 != 3;
    float _2219 = exp2(_2205);
    bool _2221 = !_2167;
    int _2223 = _2221 ? 0 : (-1);
    float _2225 = -_134;
    float _2227 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2211);
    int _2229 = ~_1014;
    int _2231 = _2229 + 1;
    float _2233 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2235 = _848 + _2233;
    int _2237 = _2161 & 3;
    bool _2239 = _2237 != 0;
    bool _2241 = !_1661;
    int _2243 = _2241 ? _2165 : (-1);
    int _2245 = _2231 * _2125;
    int _2247 = _2245 + _1789;
    int _2249 = _2239 ? 0 : 1;
    int _2251 = _2243 & 3;
    int _2253 = ~_2249;
    int _2255 = _2253 + 1;
    int _2257 = _2255 + 1;
    int _2259 = ~_2213;
    int _2261 = _2259 + 1;
    int _2263 = _2261 + 1;
    float _2265 = -_2219;
    float _2267 = _2265 + 1.0;
    int _2269 = _2257;
    int _2271 = _2263;
    if (!_2207)
    {
        int _2273 = ~_2249;
        int _2275 = _2273 + 1;
        _2269 = _2275;
    }
    int _2277 = _2269;
    bool _2279 = uint(_2247) >= uint(_1014);
    if (_2217)
    {
        int _2281 = ~_2213;
        int _2283 = _2281 + 1;
        _2271 = _2283;
    }
    int _2285 = _2271;
    bool _2287 = uint(_2251) > 1u;
    bool _2289 = !_2279;
    int _2291 = _2289 ? 0 : (-1);
    int _2293 = _2243 & 3;
    bool _2295 = _2293 != 0;
    int _2297 = _2295 ? 0 : 1;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _2301 = ~_2297;
    int _2303 = _2301 + 1;
    int _2305 = _2303 + 1;
    int _2307 = _2305;
    if (!_2287)
    {
        int _2309 = ~_2297;
        int _2311 = _2309 + 1;
        _2307 = _2311;
    }
    int _2313 = _2307;
    float _2315 = fma(_2215, -2.0, _2299);
    if (!_1367)
    {
        _2045 = _1211;
    }
    float _2317 = _2045;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _2321 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2323 = isnan(0.0);
    bool _2325 = _2321 || _2323;
    bool _2327 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2329 = _2325 || _2327;
    float _2331 = in.m_48.x;
    float _2333 = in.m_48.y;
    float _2335 = in.m_48.z;
    float _2337 = _2317;
    if (_1367)
    {
        _2337 = _854;
    }
    float _2339 = _2337;
    float _2341 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2319);
    float _2343 = _2339 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2345 = _2329 ? _2267 : 0.0;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    bool _2349 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2351 = isnan(1.0);
    bool _2353 = _2349 || _2351;
    bool _2355 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2357 = _2353 || _2355;
    float _2359 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2361 = 1.0 + _2359;
    float _2363 = fma(_2343, -2.0, _2347);
    float _2365 = 1.0 / _2361;
    float _2367 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2369 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2341);
    float _2371 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2375 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2367);
    float _2377 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2371);
    float _2379 = -_134;
    float _2381 = fma(_2379, (*spvDescriptorSet0.vp_c9)._m0[91].x, _1193);
    float _2383 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2373);
    float _2385 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2375);
    float _2387 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2377);
    float _2389 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1945);
    float _2391 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2383);
    float _2393 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2315);
    float _2395 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2363);
    if (_2357)
    {
        float _2397 = _2345 * _2365;
        _144 = _2397;
    }
    float _2399 = _144;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2403 = _2401 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2405 = _1285 >= 0.0;
    bool _2407 = isnan(_1285);
    bool _2409 = _2405 || _2407;
    bool _2411 = isnan(0.0);
    bool _2413 = _2409 || _2411;
    float _2415 = _202 * _2333;
    float _2417 = floor(_2027);
    int _2419 = _2413 ? 0 : 1;
    float _2421 = _208 * _2333;
    bool _2423 = _1285 > 0.0;
    float _2425 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2427 = _2425 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2429 = _196 * _2333;
    float _2431 = fma(_200, _2331, _2415);
    float _2433 = 1.0 / _2403;
    float _2435 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2437 = _2435 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2439 = fma(_206, _2331, _2421);
    float _2441 = fma(_194, _2331, _2429);
    float _2443 = fma(_204, _2335, _2431);
    float _2445 = 1.0 / _2427;
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2449 = _2447 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    int _2451 = ~_2419;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    float _2457 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2459 = _2457 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2461 = _2455;
    if (!_2423)
    {
        int _2463 = ~_2419;
        int _2465 = _2463 + 1;
        _2461 = _2465;
    }
    int _2467 = _2461;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2471 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2469;
    float _2473 = fma(_198, _2335, _2441);
    float _2475 = 1.0 / _2437;
    bool _2477 = _2417 >= 0.0;
    bool _2479 = isnan(_2417);
    bool _2481 = _2477 || _2479;
    bool _2483 = isnan(0.0);
    bool _2485 = _2481 || _2483;
    float _2487 = _2471 * _2433;
    float _2489 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2491 = _2489 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2493 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2495 = _2493 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2497 = _2485 ? 0 : 1;
    float _2499 = fma(_210, _2335, _2439);
    float _2501 = 1.0 / _2449;
    bool _2503 = _2417 > 0.0;
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2507 = _2505 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2509 = _2495 * _2445;
    int _2511 = ~_2073;
    int _2513 = _2511 + _2223;
    int _2515 = _2513 + 1;
    float _2517 = _1211 * 2.0;
    float _2519 = 1.0 / _2459;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2523 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2521;
    int _2525 = _886 * _2515;
    int _2527 = _2525 + _1515;
    int _2529 = ~_2497;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    float _2535 = in.m_61.w;
    float _2537 = _2523 * _2475;
    float _2539 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2541 = _2539 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2543 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2545 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2543;
    float _2547 = 1.0 / _2491;
    int _2549 = _2533;
    if (!_2503)
    {
        int _2551 = ~_2497;
        int _2553 = _2551 + 1;
        _2549 = _2553;
    }
    int _2555 = _2549;
    float _2557 = _2541 * _2501;
    float _2559 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2561 = _848 + _2559;
    bool _2563 = _1947 != 3;
    float _2565 = fma(_2557, _2235, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    bool _2567 = !_1401;
    int _2569 = _2567 ? _2527 : (-1);
    float _2571 = 1.0 / _2507;
    float _2573 = _2545 * _2519;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2577 = _2575 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2579 = _854 + _1211;
    float _2581 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2583 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2581;
    bool _2585 = !_1949;
    int _2587 = _2585 ? 0 : 1;
    float _2589 = fma(_2537, _2561, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2591 = _2579 + (-1.0);
    float _2593 = floor(_2517);
    float _2595 = _2577 * _2547;
    float _2597 = _2473 + _1347;
    int _2599 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2601 = _2599 != 0;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2605 = _2603 != 0;
    int _2607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2609 = _2607 != 0;
    float _2611 = _2443 + _2535;
    bool _2613 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2615 = isnan(_848);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = _2583 * _2571;
    bool _2627 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2629 = isnan(_848);
    bool _2631 = _2627 || _2629;
    bool _2633 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2635 = _2631 || _2633;
    float _2637 = float(_2635);
    float _2639 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2643 = _848 + _2641;
    bool _2645 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2647 = isnan(_848);
    bool _2649 = _2645 || _2647;
    bool _2651 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2653 = _2649 || _2651;
    float _2655 = float(_2653);
    float _2657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _2659 = -_2637;
    float _2661 = _2659 + 1.0;
    float _2663 = fma(_2487, _2643, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2665 = _2593 >= 0.0;
    bool _2667 = isnan(_2593);
    bool _2669 = _2665 || _2667;
    bool _2671 = isnan(0.0);
    bool _2673 = _2669 || _2671;
    float _2675 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2677 = _848 + _2675;
    float _2679 = -_2655;
    float _2681 = _2679 + 1.0;
    bool _2683 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2685 = isnan(_848);
    bool _2687 = _2683 || _2685;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2691 = _2687 || _2689;
    float _2693 = float(_2691);
    int _2695 = _2673 ? 0 : 1;
    float _2697 = fma(_2509, _2677, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    bool _2699 = _2593 > 0.0;
    float _2701 = _2655 * _2661;
    bool _2703 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2705 = isnan(_848);
    bool _2707 = _2703 || _2705;
    bool _2709 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2711 = _2707 || _2709;
    float _2713 = float(_2711);
    float _2715 = _2623 * _2681;
    float _2717 = -_2623;
    float _2719 = _2717 + 1.0;
    bool _2721 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2723 = isnan(_848);
    bool _2725 = _2721 || _2723;
    bool _2727 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2729 = _2725 || _2727;
    float _2731 = float(_2729);
    float _2733 = in.m_63.w;
    float _2735 = -_2713;
    float _2737 = _2735 + 1.0;
    bool _2739 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2741 = isnan(_848);
    bool _2743 = _2739 || _2741;
    bool _2745 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2747 = _2743 || _2745;
    float _2749 = float(_2747);
    float _2751 = -_2693;
    float _2753 = _2751 + 1.0;
    float _2755 = _2713 * _2719;
    bool _2757 = _848 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2759 = isnan(_848);
    bool _2761 = _2757 || _2759;
    bool _2763 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2765 = _2761 || _2763;
    float _2767 = float(_2765);
    float _2769 = _2731 * _2737;
    float _2771 = -_2731;
    float _2773 = _2771 + 1.0;
    float _2775 = _2749 * _2753;
    float _2777 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2779 = _848 + _2777;
    float _2781 = -_2749;
    float _2783 = _2781 + 1.0;
    float _2785 = _2767 * _2773;
    float _2787 = -_2767;
    float _2789 = _2787 + 1.0;
    float _2791 = _2663 * _2775;
    int _2793 = _1921 >> 31;
    float _2795 = fma(_2573, _2779, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2797 = _2693 * _2789;
    float _2799 = fma(_2783, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2791);
    int _2801 = _2793 & 3;
    float _2803 = _2657 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2805 = fma(_2697, _2797, _2799);
    int _2807 = _1921 + _2801;
    float _2809 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2811 = _2597 + _2809;
    float _2813 = _2499 + _2733;
    float _2815 = fma(_2589, _2785, _2805);
    float _2817 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2819 = _2611 + _2817;
    int _2821 = _2807 >> 2;
    float _2823 = fma(_2803, _1125, -0.5);
    float _2825 = fma(_1067, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2827 = fma(_2565, _2769, _2815);
    int _2829 = _2821 << 4;
    int _2831 = _2829 + 656;
    float _2833 = _2819 * _2819;
    float _2835 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2837 = _848 + _2835;
    float _2839 = _2819 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    uint _2841 = uint(int(uint(_2831) >> uint(2)));
    uint _2843 = uint(int(uint(int(_2841)) >> uint(2)));
    int _2845 = int(_2841) & 3;
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[int(_2843)][_2845];
    int _2849 = int(_2841) + 1;
    uint _2851 = uint(int(uint(_2849) >> uint(2)));
    int _2853 = _2849 & 3;
    float _2855 = (*spvDescriptorSet0.vp_c9)._m0[int(_2851)][_2853];
    float _2857 = fma(_2811, _2811, _2833);
    float _2859 = fma(_2795, _2755, _2827);
    float _2861 = fma(_2595, _2837, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _2863 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2865 = _2813 + _2863;
    float _2867 = fma(_2811, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2839);
    float _2869 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    float _2871 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2873 = _848 + _2871;
    float _2875 = fma(_2861, _2715, _2859);
    float _2877 = fma(_2865, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2867);
    float _2879 = fma(_1311, _2869, _2381);
    float _2881 = fma(_2625, _2873, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    int _2883 = _2831 + 8;
    uint _2885 = uint(int(uint(_2883) >> uint(2)));
    uint _2887 = uint(int(uint(int(_2885)) >> uint(2)));
    int _2889 = int(_2885) & 3;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[int(_2887)][_2889];
    int _2893 = int(_2885) + 1;
    uint _2895 = uint(int(uint(_2893) >> uint(2)));
    int _2897 = _2893 & 3;
    float _2899 = (*spvDescriptorSet0.vp_c9)._m0[int(_2895)][_2897];
    int _2901 = ~_2695;
    int _2903 = _2901 + 1;
    int _2905 = _2903 + 1;
    float _2907 = _854 + _1093;
    int _2909 = _2905;
    float _2911 = _2597;
    float _2913 = _2813;
    if (!_2699)
    {
        int _2915 = ~_2695;
        int _2917 = _2915 + 1;
        _2909 = _2917;
    }
    int _2919 = _2909;
    bool _2921 = _2877 >= 0.0;
    float _2923 = _2907 + (-1.0);
    float _2925 = fma(_1377, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    int _2927 = abs(_2587);
    float _2929 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2931 = abs(_2099);
    float _2933 = fma(_2923, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2935 = -_1321;
    float _2937 = fma(_1277, _2925, _2935);
    int _2939 = ~_2927;
    int _2941 = _2939 + 1;
    int _2943 = _2941 + 1;
    float _2945 = fma(_2865, _2865, _2857);
    bool _2947 = !_2563;
    int _2949 = _2947 ? 0 : (-1);
    float _2951 = fma(_1727, _2823, _2021);
    float _2953 = _2923;
    if (_2921)
    {
        _2953 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2955 = _2953;
    float _2957 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2959 = int(_2957);
    float _2961 = fma(_2387, _2825, _1331);
    int _2963 = abs(_2123);
    int _2965 = as_type<int>(_2955);
    if (_2921)
    {
        float _2967 = _2955 * 5.0;
        _2965 = as_type<int>(_2967);
    }
    int _2969 = _2965;
    bool _2971 = !_2601;
    int _2973 = _2971 ? 0 : 1;
    float _2975 = fma(_1345, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2977 = _2929 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2979 = rsqrt(_2945);
    if (_2921)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9718 = as_type<float>(_2969);
        out.gl_Position.z = _9718;
    }
    float _2981 = -_1275;
    float _2983 = fma(_2391, _2975, _2981);
    float _2985 = fma(_2977, _1369, -0.5);
    int _2987 = ~_2143;
    int _2989 = _2987 + _2203;
    int _2991 = _2989 + 1;
    bool _2993 = !_2129;
    int _2995 = _2993 ? 0 : 1;
    int _2997 = ~_2125;
    int _2999 = _2997 + _2291;
    int _3001 = _2999 + 1;
    float _3003 = fma(_2881, _2701, _2875);
    int _3005 = abs(_2959);
    int _3007 = _1004 * _2991;
    int _3009 = _3007 + _1677;
    int _3011 = abs(_2285);
    int _3013 = _1014 * _3001;
    int _3015 = _3013 + _1789;
    float _3017 = float(uint(_3005));
    float _3019 = _2879 + 0.5;
    int _3021 = abs(_2051);
    float _3023 = _2937 + 0.5;
    float _3025 = float(uint(_2959));
    float _3027 = 1.0 / _3017;
    int _3029 = ~_3021;
    int _3031 = _3029 + 1;
    int _3033 = _3031 + 1;
    float _3035 = _2865 * _2979;
    out.m_75.x = _3019;
    out.m_75.y = _3023;
    bool _3037 = _1004 == 0;
    float _3039 = _2819 * _2979;
    int _3041 = _3033 * as_type<int>(_2855);
    float _3043 = float(_2919);
    float _3045 = 1.0 / _3025;
    float _3047 = -_3035;
    float _3049 = fma(_3047, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2865);
    int _3051 = _2943 * as_type<int>(_2847);
    int _3053 = _3051 + _3041;
    int _3055 = abs(_2949);
    float _3057 = _2811 * _2979;
    int _3059 = _2161 >> 31;
    float _3061 = -_3039;
    float _3063 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2819);
    float _3065 = fma(_2637, (*spvDescriptorSet0.vp_c9)._m0[166].x, _3003);
    int _3067 = _3059 & 3;
    float _3069 = -_3057;
    float _3071 = fma(_3069, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2811);
    int _3073 = ~_2931;
    int _3075 = _3073 + 1;
    int _3077 = _3075 + 1;
    float _3079 = _3063 * _3063;
    int _3081 = ~_3055;
    int _3083 = _3081 + 1;
    int _3085 = _3083 + 1;
    out.m_77.x = _3065;
    int _3087 = _2161 + _3067;
    int _3089 = _3077 * as_type<int>(_2891);
    int _3091 = _3089 + _3053;
    int _3093 = ~_2963;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    float _3099 = fma(_3071, _3071, _3079);
    int _3101 = abs(_2973);
    int _3103 = _3085 * as_type<int>(_2899);
    int _3105 = _3103 + _3091;
    int _3107 = _2243 >> 31;
    float _3109 = -_2395;
    float _3111 = fma(_2389, _2985, _3109);
    float _3113 = float(_3101);
    int _3115 = _3105 * _3097;
    int _3117 = _3107 & 3;
    float _3119 = _3111 + 0.5;
    int _3121 = _3087 >> 2;
    int _3123 = _2569 * _2963;
    int _3125 = _3123 + _3115;
    float _3127 = _3113 * _3043;
    int _3129 = _2243 + _3117;
    float _3131 = _2961 + 0.5;
    int _3133 = _3121 << 4;
    int _3135 = _3133 + 368;
    float _3137 = _3127 * (-2.0);
    float _3139 = in.m_79.x;
    float _3141 = in.m_79.y;
    float _3143 = in.m_79.z;
    bool _3145 = !_2605;
    int _3147 = _3145 ? 0 : 1;
    uint _3149 = uint(int(uint(_3135) >> uint(2)));
    uint _3151 = uint(int(uint(int(_3149)) >> uint(2)));
    int _3153 = int(_3149) & 3;
    float _3155 = (*spvDescriptorSet0.vp_c9)._m0[int(_3151)][_3153];
    int _3157 = int(_3149) + 1;
    uint _3159 = uint(int(uint(_3157) >> uint(2)));
    int _3161 = _3157 & 3;
    float _3163 = (*spvDescriptorSet0.vp_c9)._m0[int(_3159)][_3161];
    int _3165 = _3129 >> 2;
    float _3167 = _2951 + 0.5;
    int _3169 = abs(_3147);
    float _3171 = _2983 + 0.5;
    int _3173 = as_type<int>(_3045) + (-2);
    float _3175 = as_type<float>(_3005);
    if (_2921)
    {
        out.m_55.x = 0.0;
    }
    float _3177 = float(uint(_3125));
    int _3179 = _3135 + 8;
    uint _3181 = uint(int(uint(_3179) >> uint(2)));
    uint _3183 = uint(int(uint(int(_3181)) >> uint(2)));
    int _3185 = int(_3181) & 3;
    float _3187 = (*spvDescriptorSet0.vp_c9)._m0[int(_3183)][_3185];
    int _3189 = int(_3181) + 1;
    uint _3191 = uint(int(uint(_3189) >> uint(2)));
    int _3193 = _3189 & 3;
    float _3195 = (*spvDescriptorSet0.vp_c9)._m0[int(_3191)][_3193];
    int _3197 = abs(_3125);
    out.m_81.x = _3131;
    out.m_81.y = _3171;
    out.m_81.z = _3167;
    out.m_81.w = _3119;
    int _3199 = _3165 << 4;
    int _3201 = _3199 + 800;
    float _3203 = as_type<float>(_3173) * _3177;
    int _3205 = as_type<int>(_3027) + (-2);
    float _3207 = fma(_3049, _3049, _3099);
    float _3209 = float(uint(_3197));
    uint _3211 = uint(int(uint(_3201) >> uint(2)));
    uint _3213 = uint(int(uint(int(_3211)) >> uint(2)));
    int _3215 = int(_3211) & 3;
    float _3217 = (*spvDescriptorSet0.vp_c9)._m0[int(_3213)][_3215];
    int _3219 = int(_3211) + 1;
    uint _3221 = uint(int(uint(_3219) >> uint(2)));
    int _3223 = _3219 & 3;
    float _3225 = (*spvDescriptorSet0.vp_c9)._m0[int(_3221)][_3223];
    float _3227 = float(_2467);
    float _3229 = trunc(_3203);
    float _3231 = precise::max(_3229, 0.0);
    uint _3233 = uint(_3231);
    float _3235 = float(_3169);
    float _3237 = as_type<float>(_3205) * _3209;
    float _3239 = _1093 + (-0.5);
    float _3241 = fma(_3137, _3139, _3139);
    bool _3243 = !_3037;
    int _3245 = _3243 ? _3009 : (-1);
    float _3247 = _3235 * _3227;
    float _3249 = fma(_2933, _3137, _2933);
    float _3251 = trunc(_3237);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    int _3257 = ~_2959;
    int _3259 = _3257 + 1;
    float _3261 = fma(_3239, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3241);
    int _3263 = ~_3005;
    int _3265 = _3263 + 1;
    int _3267 = _3201 + 8;
    uint _3269 = uint(int(uint(_3267) >> uint(2)));
    uint _3271 = uint(int(uint(int(_3269)) >> uint(2)));
    int _3273 = int(_3269) & 3;
    float _3275 = (*spvDescriptorSet0.vp_c9)._m0[int(_3271)][_3273];
    int _3277 = int(_3269) + 1;
    uint _3279 = uint(int(uint(_3277) >> uint(2)));
    int _3281 = _3277 & 3;
    float _3283 = (*spvDescriptorSet0.vp_c9)._m0[int(_3279)][_3281];
    float _3285 = _3247 * (-2.0);
    float _3287 = fma(_3249, _2399, _3261);
    int _3289 = abs(_2277);
    int _3291 = _3259 * int(_3233);
    int _3293 = _3291 + _3125;
    int _3295 = abs(_1739);
    float _3297 = _854 + (-0.5);
    int _3299 = ~_3289;
    int _3301 = _3299 + 1;
    int _3303 = _3301 + 1;
    float _3305 = float(uint(_3293));
    int _3307 = _3265 * int(_3255);
    int _3309 = _3307 + _3197;
    bool _3311 = !_2239;
    int _3313 = _3311 ? 0 : 1;
    bool _3315 = _2177 != 3;
    float _3317 = as_type<float>(_3173) * _3305;
    float _3319 = float(uint(_3309));
    int _3321 = _3303 * as_type<int>(_3163);
    bool _3323 = !_2295;
    int _3325 = _3323 ? 0 : 1;
    bool _3327 = uint(_2251) >= 2u;
    float _3329 = as_type<float>(_3205) * _3319;
    int _3331 = abs(_3313);
    int _3333 = abs(_2313);
    int _3335 = abs(_3325);
    float _3337 = trunc(_3317);
    float _3339 = precise::max(_3337, 0.0);
    uint _3341 = uint(_3339);
    int _3343 = _3327 ? 0 : 1;
    bool _3345 = _2251 != 3;
    int _3347 = ~_3333;
    int _3349 = _3347 + 1;
    int _3351 = _3349 + 1;
    float _3353 = trunc(_3329);
    float _3355 = precise::max(_3353, 0.0);
    uint _3357 = uint(_3355);
    int _3359 = ~_3331;
    int _3361 = _3359 + 1;
    int _3363 = _3361 + 1;
    int _3365 = _3351 * as_type<int>(_3225);
    int _3367 = ~_3011;
    int _3369 = _3367 + 1;
    int _3371 = _3369 + 1;
    int _3373 = _3363 * as_type<int>(_3155);
    int _3375 = _3373 + _3321;
    int _3377 = ~_3343;
    int _3379 = _3377 + 1;
    int _3381 = _3379 + 1;
    int _3383 = ~_3335;
    int _3385 = _3383 + 1;
    int _3387 = _3385 + 1;
    int _3389 = _3371 * as_type<int>(_3187);
    int _3391 = _3389 + _3375;
    bool _3393 = !_3315;
    int _3395 = _3393 ? 0 : (-1);
    int _3397 = _3381;
    if (_3345)
    {
        int _3399 = ~_3343;
        int _3401 = _3399 + 1;
        _3397 = _3401;
    }
    int _3403 = _3397;
    int _3405 = _3387 * as_type<int>(_3217);
    int _3407 = _3405 + _3365;
    bool _3409 = _2251 != 3;
    int _3411 = abs(_3395);
    bool _3413 = !_3409;
    int _3415 = _3413 ? 0 : (-1);
    int _3417 = ~_3411;
    int _3419 = _3417 + 1;
    int _3421 = _3419 + 1;
    int _3423 = abs(_3403);
    int _3425 = abs(_3415);
    int _3427 = _3421 * as_type<int>(_3195);
    int _3429 = _3427 + _3391;
    int _3431 = int(_3233) + int(_3341);
    int _3433 = int(_3255) + int(_3357);
    int _3435 = ~_2959;
    int _3437 = _3435 + 1;
    int _3439 = ~_3005;
    int _3441 = _3439 + 1;
    int _3443 = ~_3423;
    int _3445 = _3443 + 1;
    int _3447 = _3445 + 1;
    int _3449 = _3437 * _3431;
    int _3451 = _3449 + _3125;
    int _3453 = _3441 * _3433;
    int _3455 = _3453 + _3197;
    bool _3457 = _1014 == 0;
    int _3459 = _3447 * as_type<int>(_3275);
    int _3461 = _3459 + _3407;
    int _3463 = ~_3425;
    int _3465 = _3463 + 1;
    int _3467 = _3465 + 1;
    float _3469 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3471 = uint(_3451) >= uint(_2959);
    bool _3473 = uint(_3455) >= uint(_3005);
    int _3475 = _3467 * as_type<int>(_3283);
    int _3477 = _3475 + _3461;
    int _3479 = _3125 ^ _2959;
    bool _3481 = !_3471;
    int _3483 = _3481 ? 0 : (-1);
    bool _3485 = !_3473;
    int _3487 = _3485 ? 0 : (-1);
    uint _3489 = uint(int(uint(_3479) >> uint(31)));
    int _3491 = abs(_2995);
    int _3493 = ~_3487;
    int _3495 = _3433 + _3493;
    int _3497 = _3495 + 1;
    int _3499 = ~_3431;
    int _3501 = _3499 + _3483;
    int _3503 = _3501 + 1;
    int _3505 = ~int(_3489);
    int _3507 = _3505 + 1;
    float _3509 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3511 = ~_3491;
    int _3513 = _3511 + 1;
    int _3515 = _3513 + 1;
    int _3517 = _2959 * _3503;
    int _3519 = _3517 + _3125;
    int _3521 = _3497 ^ _3507;
    int _3523 = ~_3295;
    int _3525 = _3523 + 1;
    int _3527 = _3525 + 1;
    int _3529 = _3429 * _3515;
    bool _3531 = _2959 == 0;
    bool _3533 = _2959 == 0;
    int _3535 = _3477 * _3527;
    int _3537 = ~_3507;
    int _3539 = _3537 + _3521;
    int _3541 = _3539 + 1;
    int _3543 = _3245 * _3491;
    int _3545 = _3543 + _3529;
    bool _3547 = !_3531;
    int _3549 = _3547 ? _3519 : (-1);
    float _3551 = _3469 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3553 = !_3533;
    int _3555 = _3553 ? _3541 : (-1);
    float _3557 = _3509 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3559 = float(_3549);
    float _3561 = fma(_3551, _1167, -0.5);
    float _3563 = float(_3555);
    float _3565 = fma(_3557, _1375, -0.5);
    bool _3567 = !_3457;
    int _3569 = _3567 ? _3015 : (-1);
    float _3571 = fma(_3551, _3559, _2227);
    float _3573 = float(_3545);
    float _3575 = -_2393;
    float _3577 = fma(_3557, _3563, _3575);
    float _3579 = fma(_3285, _3141, _3141);
    int _3581 = _3569 * _3295;
    int _3583 = _3581 + _3535;
    float _3585 = fma(_2385, _3561, _3571);
    float _3587 = fma(_2369, _3565, _3577);
    out.m_83.x = _3573;
    float _3589 = fma(_2639, _3285, _2639);
    float _3591 = float(_3583);
    float _3593 = _3585 + 0.5;
    float _3595 = _3587 + 0.5;
    bool _3597 = !_2609;
    int _3599 = _3597 ? 0 : 1;
    out.m_83.w = _3591;
    out.m_85.x = _3593;
    out.m_85.y = _3595;
    if (_2921)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3601 = -_3039;
    float _3603 = fma(_3601, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2611);
    float _3605 = float(_2555);
    float _3607 = -_3057;
    float _3609 = fma(_3607, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2597);
    int _3611 = abs(_3599);
    float _3613 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3615 = _3603 + _3613;
    float _3617 = -_3035;
    float _3619 = fma(_3617, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2813);
    float _3621 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3623 = _3609 + _3621;
    float _3625 = _1093 + _1211;
    float _3627 = _3615 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3629 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3631 = _3619 + _3629;
    float _3633 = _1211 + (-0.5);
    float _3635 = _3625 + (-1.0);
    float _3637 = fma(_3623, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3627);
    float _3639 = float(_3611);
    float _3641 = fma(_3297, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3579);
    float _3643 = fma(_3631, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3637);
    float _3645 = _3287 * 0.15915493667125701904296875;
    float _3647 = _3639 * _3605;
    float _3649 = fma(_3589, _2399, _3641);
    float _3651 = fma(_3635, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3653 = _3643 >= 0.0;
    float _3655 = _3647 * (-2.0);
    float _3657 = _3649 * 0.15915493667125701904296875;
    float _3659 = sqrt(_3207);
    float _3661 = fma(_3655, _3143, _3143);
    float _3663 = fma(_3651, _3655, _3651);
    float _3665 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3661);
    float _3667 = _3645 * 6.283185482025146484375;
    float _3669 = sin(_3667);
    float _3671 = fma(_3663, _2399, _3665);
    float _3673 = _3661;
    float _3675 = _3645;
    float _3677 = _3623;
    float _3679 = _3609;
    if (_3653)
    {
        _3673 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3681 = _3673;
    int _3683 = as_type<int>(_3681);
    if (_3653)
    {
        out.m_55.x = 0.0;
    }
    float _3685 = _3671 * 0.15915493667125701904296875;
    float _3687 = _3645 * 6.283185482025146484375;
    float _3689 = cos(_3687);
    if (_3653)
    {
        float _3691 = _3681 * 5.0;
        _3683 = as_type<int>(_3691);
    }
    int _3693 = _3683;
    if (_3653)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10734 = as_type<float>(_3693);
        out.gl_Position.z = _10734;
    }
    float _3695 = _3657 * 6.283185482025146484375;
    float _3697 = sin(_3695);
    float _3699 = _3657 * 6.283185482025146484375;
    float _3701 = cos(_3699);
    float _3703 = _3685 * 6.283185482025146484375;
    float _3705 = sin(_3703);
    if (_3653)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3707 = -_2611;
    float _3709 = _3707 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3711 = -_2597;
    float _3713 = _3711 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3715 = -_2813;
    float _3717 = _3715 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3719 = in.m_87.x;
    float _3721 = in.m_87.y;
    float _3723 = in.m_87.z;
    float _3725 = _3709 * _3709;
    float _3727 = _3685 * 6.283185482025146484375;
    float _3729 = cos(_3727);
    float _3731 = _3689 * _3697;
    float _3733 = _3669 * _3701;
    float _3735 = fma(_3713, _3713, _3725);
    float _3737 = _3669 * _3697;
    float _3739 = _3689 * _3701;
    float _3741 = _2979 * _3659;
    float _3743 = fma(_3717, _3717, _3735);
    float _3745 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3747 = _692 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3749 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3751 = -_3731;
    float _3753 = fma(_3705, _3733, _3751);
    float _3755 = -_3733;
    float _3757 = fma(_3705, _3731, _3755);
    float _3759 = rsqrt(_3743);
    float _3761 = fma(_3705, _3739, _3737);
    float _3763 = _3741 * _3745;
    float _3765 = _3689 * _3729;
    float _3767 = _3701 * _3729;
    float _3769 = _3669 * _3729;
    float _3771 = _3697 * _3729;
    float _3773 = fma(_3705, _3737, _3739);
    float _3775 = _3741 * _3747;
    float _3777 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3723);
    float _3779 = _3741 * _3749;
    float _3781 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3719);
    float _3783 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3721);
    float _3785 = _3777 * _3763;
    bool _3787 = _3721 != 0.0;
    bool _3789 = isnan(_3721);
    bool _3791 = _3787 || _3789;
    bool _3793 = isnan(0.0);
    bool _3795 = _3791 || _3793;
    float _3797 = _3781 * _3775;
    float _3799 = _3713 * _3759;
    float _3801 = _3717 * _3759;
    float _3803 = _3709 * _3759;
    float _3805 = _3783 * _3779;
    float _3807 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3809 = _3799 * _3807;
    float _3811 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3813 = _3801 * _3811;
    float _3815 = in.m_89.x;
    float _3817 = in.m_89.y;
    float _3819 = in.m_89.z;
    bool _3821 = _3719 == 0.0;
    bool _3823 = !_3795;
    bool _3825 = _3821 && _3823;
    float _3827 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3829 = -_3809;
    float _3831 = fma(_3801, _3827, _3829);
    float _3833 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3835 = _3803 * _3833;
    float _3837 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3839 = -_3813;
    float _3841 = fma(_3803, _3837, _3839);
    bool _3843 = _3723 == 0.0;
    bool _3845 = _3843 && _3825;
    float _3847 = _3831 * _3831;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3851 = -_3835;
    float _3853 = fma(_3799, _3849, _3851);
    float _3855 = in.m_91.x;
    float _3857 = in.m_91.y;
    float _3859 = in.m_91.z;
    float _3861 = in.m_91.w;
    float _3863 = -_3805;
    float _3865 = _3705 * _3863;
    float _3867 = fma(_3841, _3841, _3847);
    float _3869 = _3765 * _3805;
    float _3871 = _3769 * _3805;
    float _3873 = fma(_3767, _3797, _3865);
    float _3875 = fma(_3853, _3853, _3867);
    float _3877 = fma(_3761, _3797, _3869);
    float _3879 = fma(_3753, _3797, _3871);
    float _3881 = fma(_3771, _3785, _3873);
    float _3883 = fma(_3757, _3785, _3877);
    float _3885 = rsqrt(_3875);
    float _3887 = _3871;
    float _3889 = _3815;
    float _3891 = _3797;
    if (_3845)
    {
        _3175 = _3815;
    }
    float _3893 = _3175;
    float _3895 = _3893;
    if (_3845)
    {
        _3675 = _3819;
    }
    float _3897 = _3675;
    float _3899 = _3897;
    if (_3845)
    {
        _3887 = _3893;
    }
    float _3901 = _3887;
    float _3903 = _3901;
    if (!_3845)
    {
        _3895 = _3815;
    }
    float _3905 = _3895;
    if (_3845)
    {
        _3889 = _3817;
    }
    float _3907 = _3889;
    float _3909 = _3907;
    if (!_3845)
    {
        float _3911 = fma(_3721, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3817);
        _3909 = _3911;
    }
    float _3913 = _3909;
    float _3915 = _3913;
    if (_3845)
    {
        _3891 = _3897;
    }
    float _3917 = _3891;
    float _3919 = _3859 * _3905;
    float _3921 = _3841 * _3885;
    float _3923 = _3917;
    if (!_3845)
    {
        _3899 = _3819;
    }
    float _3925 = _3899;
    float _3927 = _3831 * _3885;
    float _3929 = _3853 * _3885;
    float _3931 = _3803 * _3921;
    if (!_3845)
    {
        float _3933 = fma(_3719, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3905);
        _3903 = _3933;
    }
    float _3935 = _3903;
    float _3937 = _3801 * _3927;
    float _3939 = -_3919;
    float _3941 = fma(_3855, _3925, _3939);
    float _3943 = _3857 * _3925;
    float _3945 = _3855 * _3817;
    float _3947 = -_3937;
    float _3949 = fma(_3803, _3929, _3947);
    float _3951 = -_3931;
    float _3953 = fma(_3799, _3927, _3951);
    if (!_3845)
    {
        float _3955 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3925);
        _3923 = _3955;
    }
    float _3957 = _3923;
    float _3959 = -_3943;
    float _3961 = fma(_3859, _3817, _3959);
    float _3963 = fma(_3773, _3785, _3879);
    float _3965 = -_3945;
    float _3967 = fma(_3857, _3905, _3965);
    float _3969 = _3949 * _3883;
    float _3971 = _3953 * _3883;
    float _3973 = _3941 * _3861;
    float _3975 = _3961 * _3861;
    float _3977 = _3799 * _3929;
    float _3979 = _3967 * _3861;
    float _3981 = fma(_3921, _3881, _3969);
    float _3983 = fma(_3929, _3881, _3971);
    float _3985 = -_3977;
    float _3987 = fma(_3801, _3921, _3985);
    float _3989 = _3761 * _3949;
    float _3991 = fma(_3799, _3963, _3981);
    float _3993 = fma(_3801, _3963, _3983);
    float _3995 = _3761 * _3987;
    float _3997 = _3761 * _3953;
    float _3999 = _2597 + _3991;
    float _4001 = _2813 + _3993;
    float _4003 = _3765 * _3949;
    float _4005 = _3765 * _3987;
    float _4007 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _4009 = _3999 + _4007;
    float _4011 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _4013 = _4001 + _4011;
    float _4015 = _3765 * _3953;
    float _4017 = _3987 * _3883;
    float _4019 = _4009 * _4009;
    float _4021 = _4013 * _4013;
    float _4023 = _3757 * _3949;
    float _4025 = _3757 * _3953;
    float _4027 = _3757 * _3987;
    float _4029 = _4019 + _4021;
    float _4031 = fma(_3767, _3921, _3989);
    float _4033 = fma(_3767, _3927, _3995);
    float _4035 = fma(_3767, _3929, _3997);
    float _4037 = sqrt(_4029);
    float _4039 = fma(_3927, _3881, _4017);
    float _4041 = -_3705;
    float _4043 = fma(_4041, _3921, _4003);
    float _4045 = -_3705;
    float _4047 = fma(_4045, _3927, _4005);
    float _4049 = -_3705;
    float _4051 = fma(_4049, _3929, _4015);
    float _4053 = fma(_3771, _3921, _4023);
    float _4055 = fma(_3753, _3799, _4031);
    float _4057 = fma(_3753, _3803, _4033);
    float _4059 = fma(_3753, _3801, _4035);
    float _4061 = fma(_3803, _3963, _4039);
    float _4063 = fma(_3769, _3799, _4043);
    float _4065 = fma(_3769, _3803, _4047);
    float _4067 = fma(_3769, _3801, _4051);
    float _4069 = fma(_3771, _3929, _4025);
    float _4071 = fma(_3771, _3927, _4027);
    float _4073 = _2611 + _4061;
    bool _4075 = _4037 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4077 = _4063 * _3857;
    float _4079 = _4065 * _3857;
    float _4081 = _4067 * _3857;
    float _4083 = fma(_3773, _3799, _4053);
    float _4085 = fma(_3773, _3801, _4069);
    float _4087 = fma(_3773, _3803, _4071);
    float _4089 = _4063 * _3913;
    float _4091 = _3973 * _4063;
    float _4093 = _4065 * _3913;
    float _4095 = _4067 * _3913;
    float _4097 = _3973 * _4065;
    float _4099 = _3973 * _4067;
    float _4101 = _3973;
    float _4103 = _4067;
    float _4105 = _3999;
    float _4107 = _4001;
    if (!_4075)
    {
        _3915 = _4021;
    }
    float _4109 = _3915;
    float _4111 = _4109;
    if (!_4075)
    {
        _4101 = _4019;
    }
    float _4113 = _4101;
    float _4115 = _4113;
    if (!_4075)
    {
        _4103 = _4073;
    }
    float _4117 = _4103;
    bool _4119 = !_4075;
    float _4121 = _4117;
    if (!_4119)
    {
        float _4123 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4125 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4127 = _4037 + _4125;
        float _4129 = _4073 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4131 = rsqrt(_4029);
        float _4133 = _4127 * _4123;
        float _4135 = _4133 * 0.15915493667125701904296875;
        float _4137 = _4135 * 6.283185482025146484375;
        float _4139 = sin(_4137);
        float _4141 = _4135 * 6.283185482025146484375;
        float _4143 = cos(_4141);
        float _4145 = fma(_4139, _4129, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4147 = _4131 * _4145;
        float _4149 = _4143 + (-1.0);
        float _4151 = fma(_4009, _4147, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4153 = fma(_4013, _4147, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4155 = _4149 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4157 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4159 = _4151 + _4157;
        float _4161 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4163 = _4153 + _4161;
        float _4165 = fma(_4073, _4143, _4155);
        float _4167 = _4159 * _4159;
        float _4169 = _4163 * _4163;
        _4121 = _4165;
        _4115 = _4167;
        _4111 = _4169;
        _4105 = _4151;
        _4107 = _4153;
    }
    float _4171 = _4121;
    float _4173 = _4115;
    float _4175 = _4111;
    float _4177 = _4105;
    float _4179 = _4107;
    float _4181 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4183 = _4171 + _4181;
    float _4185 = fma(_4057, _3855, _4079);
    float _4187 = fma(_4057, _3935, _4093);
    float _4189 = fma(_4059, _3855, _4081);
    float _4191 = fma(_4183, _4183, _4173);
    float _4193 = fma(_4059, _3935, _4095);
    float _4195 = fma(_3975, _4057, _4097);
    float _4197 = fma(_3975, _4059, _4099);
    float _4199 = _4191 + _4175;
    float _4201 = fma(_4055, _3855, _4077);
    float _4203 = fma(_4055, _3935, _4089);
    float _4205 = fma(_3975, _4055, _4091);
    float _4207 = sqrt(_4199);
    float _4209 = fma(_4083, _3859, _4201);
    float _4211 = fma(_4087, _3859, _4185);
    float _4213 = fma(_4083, _3957, _4203);
    float _4215 = fma(_4085, _3859, _4189);
    float _4217 = fma(_3979, _4083, _4205);
    float _4219 = fma(_4087, _3957, _4187);
    float _4221 = fma(_3979, _4087, _4195);
    float _4223 = fma(_3979, _4085, _4197);
    float _4225 = fma(_4085, _3957, _4193);
    out.m_93.x = _4209;
    out.m_93.y = _4211;
    out.m_93.z = _4215;
    out.m_95.x = _4217;
    out.m_95.y = _4221;
    out.m_95.z = _4223;
    bool _4227 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4229 = isnan(_4207);
    bool _4231 = _4227 || _4229;
    bool _4233 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4235 = _4231 || _4233;
    out.m_97.x = _4213;
    out.m_97.y = _4219;
    out.m_97.z = _4225;
    float _4237 = _4199;
    if (!_4235)
    {
        _4237 = 1.0;
    }
    float _4239 = _4237;
    bool _4241 = !_4235;
    float _4243 = _4239;
    if (!_4241)
    {
        bool _4245 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4247 = isnan(_4207);
        bool _4249 = _4245 || _4247;
        bool _4251 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4253 = _4249 || _4251;
        if (!_4253)
        {
            float _4255 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4257 = _4207 + _4255;
            float _4259 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4261 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4259;
            float _4263 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4265 = _4263 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4267 = 1.0 / _4261;
            float _4269 = _4257 * _4267;
            float _4271 = fma(_4269, _4265, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4243 = _4271;
            _4273 = true;
        }
        else
        {
            bool _4275 = _4207 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4277 = isnan(_4207);
            bool _4279 = _4275 || _4277;
            bool _4281 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4283 = _4279 || _4281;
            if (!_4283)
            {
                float _4285 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4287 = _4207 + _4285;
                float _4289 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4291 = _4289 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4293 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4295 = _4293 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4297 = 1.0 / _4291;
                float _4299 = _4287 * _4297;
                float _4301 = fma(_4299, _4295, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4243 = _4301;
                _4273 = true;
            }
            else
            {
                _4243 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4273 = false;
    float _4303 = _4243;
    float _4305 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4307 = _4171 + _4305;
    float _4309 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4311 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4313 = _4177 + _4311;
    float _4315 = fma(_4307, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4317 = fma(_3609, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4309);
    float _4319 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4321 = _4179 + _4319;
    float _4323 = fma(_4313, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4325 = -_2611;
    float _4327 = _4325 + _4315;
    float _4329 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4317);
    float _4331 = fma(_4321, _4303, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4333 = -_2597;
    float _4335 = _4333 + _4323;
    float _4337 = _4327 * _4327;
    float _4339 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4341 = -_2813;
    float _4343 = _4341 + _4331;
    float _4345 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4347 = fma(_4335, _4335, _4337);
    float _4349 = 1.0 / _4339;
    float _4351 = fma(_3609, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4345);
    float _4353 = fma(_4343, _4343, _4347);
    float _4355 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4351);
    float _4357 = sqrt(_4353);
    float _4359 = _4355 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4361 = _4359 + _4339;
    float _4363 = _4361 * _4349;
    float _4365 = _4363 * 0.5;
    bool _4367 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4369 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4371 = _4367 || _4369;
    bool _4373 = isnan(0.5);
    bool _4375 = _4371 || _4373;
    bool _4377 = _4357 > 0.0;
    float _4379 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4381 = fma(_4365, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4379);
    float _4383 = 1.0 / _4381;
    bool _4385 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4387 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4389 = _4385 || _4387;
    bool _4391 = isnan(0.5);
    bool _4393 = _4389 || _4391;
    float _4395 = _4321;
    float _4397 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4399 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    if (!_4377)
    {
        _4395 = _4323;
    }
    float _4401 = _4395;
    float _4403 = _4401;
    float _4405 = _4401;
    if (!_4377)
    {
        _4397 = _4315;
    }
    float _4407 = _4397;
    float _4409 = _4407;
    float _4411 = _4407;
    if (!_4377)
    {
        _4399 = _4331;
    }
    float _4413 = _4399;
    bool _4415 = !_4377;
    float _4417 = _4413;
    if (!_4415)
    {
        float _4419 = _226 * _226;
        float _4421 = fma(_222, _222, _4419);
        float _4423 = fma(_228, _228, _4421);
        float _4425 = rsqrt(_4353);
        float _4427 = sqrt(_4423);
        float _4429 = _4335 * _4425;
        float _4431 = _4327 * _4425;
        float _4433 = _4343 * _4425;
        bool _4435 = _4427 > 0.0;
        float _4437 = _4427;
        if (!_4435)
        {
            _4403 = _4323;
        }
        float _4439 = _4403;
        _4405 = _4439;
        if (!_4435)
        {
            _4409 = _4315;
        }
        float _4441 = _4409;
        _4411 = _4441;
        if (!_4435)
        {
            _4437 = _4331;
        }
        float _4443 = _4437;
        bool _4445 = !_4435;
        _4417 = _4443;
        if (!_4445)
        {
            float _4447 = rsqrt(_4423);
            float _4449 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4451 = _226 * _4447;
            float _4453 = _222 * _4447;
            float _4455 = _228 * _4447;
            float _4457 = _4431 * _4451;
            float _4459 = fma(_4429, _4453, _4457);
            float _4461 = _4449 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4463 = fma(_4433, _4455, _4459);
            float _4465 = _4463 * _4461;
            float _4467 = fma(_222, _4465, _4323);
            float _4469 = fma(_226, _4465, _4315);
            float _4471 = fma(_228, _4465, _4331);
            _4405 = _4467;
            _4411 = _4469;
            _4417 = _4471;
        }
    }
    float _4473 = _4405;
    float _4475 = _4411;
    float _4477 = _4417;
    float _4479 = -_3057;
    float _4481 = fma(_4479, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4473);
    float _4483 = -_3039;
    float _4485 = fma(_4483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4475);
    float _4487 = -_3035;
    float _4489 = fma(_4487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4477);
    float _4491 = _4485;
    float _4493 = _4481;
    float _4495 = _4489;
    if (_4375)
    {
        _232 = 1.0;
    }
    float _4497 = _232;
    float _4499 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4501 = _4383 * _4499;
    float _4503 = _4497;
    if (!_4393)
    {
        float _4505 = _3615 * _3615;
        float _4507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4509 = -_2813;
        float _4511 = _4509 + _4477;
        float _4513 = -_2597;
        float _4515 = _4513 + _4473;
        float _4517 = fma(_3623, _3623, _4505);
        float _4519 = fma(_3631, _3631, _4517);
        float _4521 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4523 = sqrt(_4519);
        float _4525 = 1.0 / _3741;
        float _4527 = _4521 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4529 = precise::min(_4523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4531 = _4529 * _4507;
        float _4533 = _4531 * _4525;
        float _4535 = -_2611;
        float _4537 = _4535 + _4475;
        float _4539 = _4527 * _4533;
        float _4541 = _4511 * _4533;
        float _4543 = fma(_4537, _4539, _3603);
        float _4545 = fma(_4515, _4539, _3609);
        float _4547 = fma(_4527, _4541, _3619);
        _4491 = _4543;
        _4493 = _4545;
        _4495 = _4547;
        _3677 = _4523;
    }
    float _4549 = _4491;
    float _4551 = _4493;
    float _4553 = _4495;
    float _4555 = _3677;
    float _4557 = _4555;
    if (!_4375)
    {
        float _4559 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4561 = _4559 * 0.15915493667125701904296875;
        float _4563 = _4561 * 6.283185482025146484375;
        float _4565 = cos(_4563);
        float _4567 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4569 = _4567 * 0.15915493667125701904296875;
        float _4571 = _4561 * 6.283185482025146484375;
        float _4573 = sin(_4571);
        float _4575 = 1.0 / _4565;
        float _4577 = _4569 * 6.283185482025146484375;
        float _4579 = cos(_4577);
        float _4581 = _4573 * _4575;
        float _4583 = _4569 * 6.283185482025146484375;
        float _4585 = sin(_4583);
        float _4587 = _4579 * _4581;
        float _4589 = 1.0 / _4587;
        float _4591 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4593 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4591;
        float _4595 = 1.0 / _4593;
        float _4597 = _4585 * _4589;
        float _4599 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4601 = fma(_4501, _4597, _4599);
        float _4603 = _4601 * _4595;
        float _4605 = precise::clamp(_4603, 0.0, 1.0);
        _2911 = _4561;
        _4503 = _4605;
    }
    float _4607 = _2911;
    float _4609 = _4503;
    float _4611 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4613 = _4549 + _4611;
    float _4615 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4617 = _4551 + _4615;
    float _4619 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4621 = _4553 + _4619;
    float _4623 = _4613 * _4613;
    float _4625 = fma(_4617, _4617, _4623);
    float _4627 = fma(_4621, _4621, _4625);
    float _4629 = rsqrt(_4627);
    float _4631 = sqrt(_4627);
    float _4633 = _4629 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4635 = _4617 * _4633;
    float _4637 = _4621 * _4633;
    float _4639 = _4635 * _4635;
    float _4641 = _4637 * _4637;
    float _4643 = _4639 + _4641;
    float _4645 = sqrt(_4643);
    bool _4647 = _4645 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4649 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4651 = _4645 + _4649;
    float _4653 = _4625;
    float _4655 = _4629;
    float _4657 = _4651;
    float _4659 = _4613;
    if (_4647)
    {
        float _4661 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4653 = _4661;
    }
    float _4663 = _4653;
    if (_4647)
    {
        float _4665 = rsqrt(_4643);
        _4655 = _4665;
    }
    float _4667 = _4655;
    float _4669 = _4667;
    if (_4647)
    {
        float _4671 = _4651 * _4663;
        _4657 = _4671;
    }
    float _4673 = _4657;
    if (_4647)
    {
        float _4675 = _4673 * 0.15915493667125701904296875;
        _2913 = _4675;
    }
    float _4677 = _2913;
    float _4679 = _4621;
    if (_4647)
    {
        float _4681 = _4677 * 6.283185482025146484375;
        float _4683 = sin(_4681);
        _4679 = _4683;
    }
    float _4685 = _4679;
    float _4687 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4689 = precise::max(0.0, _4687);
    float _4691 = _4607;
    if (_4647)
    {
        float _4693 = _4677 * 6.283185482025146484375;
        float _4695 = cos(_4693);
        _4691 = _4695;
    }
    float _4697 = _4691;
    float _4699 = -_4633;
    float _4701 = -_4689;
    float _4703 = fma(_4613, _4699, _4701);
    float _4705 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4647)
    {
        float _4707 = _4703 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4659 = _4707;
    }
    float _4709 = _4659;
    float _4711 = fma(_3609, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4713 = _4709;
    float _4715 = _4685;
    if (_4647)
    {
        float _4717 = fma(_4685, _4709, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4713 = _4717;
    }
    float _4719 = _4713;
    float _4721 = _4719;
    if (!_4647)
    {
        _4715 = _4639;
    }
    float _4723 = _4715;
    float _4725 = _4723;
    if (_4647)
    {
        float _4727 = _4697 + (-1.0);
        _4705 = _4727;
    }
    float _4729 = _4705;
    float _4731 = _4729;
    if (_4647)
    {
        float _4733 = _4667 * _4719;
        _4557 = _4733;
    }
    float _4735 = _4557;
    if (!_4647)
    {
        _4669 = _4635;
    }
    float _4737 = _4669;
    float _4739 = _4737;
    if (_4647)
    {
        float _4741 = _4729 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3679 = _4741;
    }
    float _4743 = _3679;
    float _4745 = _4743;
    if (_4647)
    {
        float _4747 = _4635 * _4735;
        _4739 = _4747;
    }
    float _4749 = _4739;
    if (!_4647)
    {
        _4721 = _4703;
    }
    float _4751 = _4721;
    float _4753 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4755 = _4751;
    if (!_4647)
    {
        _4731 = _4637;
    }
    float _4757 = _4731;
    float _4759 = _4757;
    if (_4647)
    {
        float _4761 = fma(_4703, _4697, _4743);
        _4755 = _4761;
    }
    float _4763 = _4755;
    if (_4647)
    {
        float _4765 = _4749 * _4749;
        _4725 = _4765;
    }
    float _4767 = _4725;
    if (_4647)
    {
        float _4769 = _4637 * _4735;
        _4759 = _4769;
    }
    float _4771 = _4759;
    if (!_4647)
    {
        _4745 = _4641;
    }
    float _4773 = _4745;
    float _4775 = floor(_4711);
    float _4777 = fma(_4763, _4763, _4767);
    float _4779 = _4773;
    if (_4647)
    {
        float _4781 = _4771 * _4771;
        _4779 = _4781;
    }
    float _4783 = _4779;
    float _4785 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4787 = _4777 + _4783;
    float _4789 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4785);
    float _4791 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4793 = fma(_4631, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4791);
    float _4795 = precise::clamp(_4793, 0.0, 1.0);
    float _4797 = rsqrt(_4787);
    float _4799 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4789);
    float _4801 = -_4795;
    float _4803 = _4801 + 1.0;
    float _4805 = fma(_3619, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4807 = _4799 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4809 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4811 = floor(_4805);
    float _4813 = _4807 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4815 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4817 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4809);
    float _4819 = -_4813;
    float _4821 = fma(_4819, _4753, 1.0);
    float _4823 = _4549 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4825 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4815);
    float _4827 = abs(_4803);
    float _4829 = log2(_4827);
    float _4831 = _4797 * _4749;
    float _4833 = fma(_4551, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4823);
    float _4835 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4825);
    float _4837 = _4797 * _4763;
    float _4839 = _4831 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4841 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4833);
    float _4843 = _4835 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4845 = _4797 * _4771;
    float _4847 = -_4839;
    float _4849 = fma(_4837, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4847);
    float _4851 = _4841 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4853 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4855 = fma(_4553, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4817);
    float _4857 = -_4845;
    float _4859 = fma(_4857, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4849);
    float _4861 = -_4775;
    float _4863 = _4711 + _4861;
    float _4865 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4853);
    float _4867 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4869 = _4855 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4871 = fma(_4859, -0.5, 0.5);
    float _4873 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4865);
    float _4875 = log2(_4821);
    float _4877 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4879 = fma(_4859, 0.5, 0.5);
    float _4881 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4873);
    float _4883 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4885 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4877);
    float _4887 = -_4811;
    float _4889 = _4805 + _4887;
    float _4891 = fma(_4879, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4893 = exp2(_4867);
    float _4895 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4883);
    float _4897 = _4837 + 1.0;
    float _4899 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4885);
    float _4901 = fma(_4879, _4891, -0.212114393711090087890625);
    float _4903 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4895);
    float _4905 = 1.0 / _4881;
    float _4907 = fma(_4879, _4901, 1.570728778839111328125);
    float _4909 = _4875 * 0.693147182464599609375;
    float _4911 = sqrt(_4871);
    float _4913 = -_4837;
    float _4915 = fma(_4893, _4897, _4913);
    float _4917 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4903);
    float _4919 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4899);
    float2 _12729 = float2(_4863, _4889);
    float _4921 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12729, float2(0.0), isnan(_12729)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12729, float2(0.0), isnan(_12729)), level(0.0)).x;
    float _4923 = _4909 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4925 = _4917 * _4905;
    float _4927 = _4919 * _4905;
    float _4929 = fma(_4925, 0.5, 0.5);
    float _4931 = fma(_4927, -0.5, 0.5);
    float _4933 = _4911 * 0.636619746685028076171875;
    float3 _12757 = float3(_4929, _4931, _4923);
    float _4935 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12757, float3(0.0), isnan(_12757)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12757, float3(0.0), isnan(_12757)), level(0.0)).x;
    float3 _12768 = float3(_4929, _4931, _4923);
    float4 _4938 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12768, float3(0.0), isnan(_12768)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12768, float3(0.0), isnan(_12768)), level(0.0)).xyzw;
    float _4940 = _4938.x;
    float _4942 = _4938.y;
    float _4944 = _4938.z;
    float _4946 = _4938.w;
    float _4948 = -_4907;
    float _4950 = fma(_4933, _4948, 1.0);
    float _4952 = fma(_4915, 0.5, 0.5);
    float2 _12791 = float2(_4950, _4952);
    float3 _4956 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12791, float2(0.0), isnan(_12791)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12791, float2(0.0), isnan(_12791)), level(0.0)).xyz;
    float _4958 = _4956.x;
    float _4960 = _4956.y;
    float _4962 = _4956.z;
    float _4964 = abs(_4501);
    float _4966 = log2(_4964);
    float _4968 = _4843 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4970 = _4829 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4972 = _4917 + _4881;
    float _4974 = fma(_4851, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4968);
    float _4976 = _4881 * 0.5;
    bool _4978 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4980 = isnan(_4631);
    bool _4982 = _4978 || _4980;
    bool _4984 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4986 = _4982 || _4984;
    float _4988 = _4972 * 0.5;
    float _4990 = fma(_4807, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4974);
    float _4992 = exp2(_4970);
    bool _4994 = _4501 <= 8000.0;
    bool _4996 = isnan(_4501);
    bool _4998 = _4994 || _4996;
    bool _5000 = isnan(8000.0);
    bool _5002 = _4998 || _5000;
    float _5004 = float(_5002);
    float _5006 = fma(_4869, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4990);
    float _5008 = _4966 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5010 = in.m_99.x;
    out.gl_Position.x = _4917;
    out.gl_Position.y = _4919;
    out.gl_Position.z = _5006;
    out.gl_Position.w = _4881;
    float _5012 = exp2(_5008);
    float _5014 = -_4992;
    float _5016 = _5014 + 1.0;
    float _5018 = _5016 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5020 = _4917;
    float _5022 = _4919;
    float _5024 = _4881;
    float _5026 = _5006;
    if (!_4986)
    {
        _5020 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5028 = _5020;
    float _5030 = fma(_5012, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5032 = precise::clamp(_5030, 0.0, 1.0);
    float _5034 = fma(_4919, -0.5, _4976);
    float _5036 = fma(_5032, -2.0, 3.0);
    float _5038 = _5032 * _5032;
    float _5040 = _5028;
    float _5042 = _5028;
    if (!_4986)
    {
        _5022 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5044 = _5022;
    float _5046 = _5038 * _5036;
    float _5048 = -_5046;
    float _5050 = _5048 + 1.0;
    float _5052 = fma(_5050, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5046);
    float _5054 = _5006 + _4881;
    float _5056 = _5004 * _5052;
    float _5058 = _5054 * 0.5;
    float _5060 = _5044;
    float _5062 = _5044;
    if (!_4986)
    {
        _5024 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5064 = _5024;
    float _5066 = _5056 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _5068 = _5064;
    float _5070 = _5064;
    if (!_4986)
    {
        _5026 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5072 = _5026;
    out.m_101.x = _4988;
    out.m_101.y = _5034;
    out.m_101.z = _5058;
    out.m_101.w = _4881;
    float _5074 = -_4921;
    float _5076 = _5074 + 1.0;
    float _5078 = _5076 * _5066;
    float _5080 = precise::clamp(_5078, 0.0, 1.0);
    float _5082 = -_5080;
    float _5084 = fma(_5082, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5086 = _5084 * _5010;
    float _5088 = _5018 * _4935;
    float _5090 = -_5018;
    float _5092 = _5090 + 1.0;
    float _5094 = _4946 * _5088;
    float _5096 = _4946 * _5092;
    float _5098 = _4962 * _5088;
    float _5100 = fma(_4958, _5094, _4940);
    float _5102 = fma(_4960, _5094, _4942);
    float _5104 = _5086 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5106 = fma(_4946, _5098, _4944);
    float _5108 = _4609 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5110 = _5086;
    float _5112 = _5094;
    float _5114 = _5072;
    float _5116 = _5072;
    if (!_4986)
    {
        _5110 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5118 = _5110;
    out.m_103.x = _5104;
    float _5120 = _5118;
    float _5122 = _5118;
    if (!_4986)
    {
        _5112 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5124 = _5112;
    out.m_105.x = _5100;
    out.m_105.y = _5102;
    out.m_105.z = _5106;
    out.m_105.w = _5096;
    bool _5126 = !_4986;
    float _5128 = _5124;
    float _5130 = _5124;
    if (!_5126)
    {
        bool _5132 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5134 = isnan(_4631);
        bool _5136 = _5132 || _5134;
        bool _5138 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5140 = _5136 || _5138;
        if (!_5140)
        {
            float _5142 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5144 = _4631 + _5142;
            float _5146 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5148 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5146;
            float _5150 = 1.0 / _5148;
            float _5152 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5154 = _5152 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5156 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5158 = _5156 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5160 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5162 = _5160 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5164 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5166 = _5164 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5168 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5170 = _5168 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5172 = _5144 * _5150;
            float _5174 = precise::clamp(_5172, 0.0, 1.0);
            float _5176 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5178 = _5176 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5180 = fma(_5174, _5158, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5182 = fma(_5174, _5178, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5184 = fma(_5174, _5154, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5186 = fma(_5174, _5162, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5188 = fma(_5174, _5166, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5190 = fma(_5174, _5170, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5062 = _5184;
            _5130 = _5188;
            _5116 = _5182;
            _5122 = _5186;
            _5042 = _5180;
            _5070 = _5190;
            _5192 = true;
        }
        else
        {
            bool _5194 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5196 = isnan(_4631);
            bool _5198 = _5194 || _5196;
            bool _5200 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5202 = _5198 || _5200;
            if (!_5202)
            {
                _5120 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5204 = _5120;
            _5122 = _5204;
            if (!_5202)
            {
                _5128 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5206 = _5128;
            _5130 = _5206;
            if (!_5202)
            {
                _5068 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5208 = _5068;
            _5070 = _5208;
            if (!_5202)
            {
                _5114 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5210 = _5114;
            _5116 = _5210;
            if (!_5202)
            {
                _5060 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5212 = _5060;
            _5062 = _5212;
            if (!_5202)
            {
                _5040 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5214 = _5040;
            bool _5216 = !_5202;
            _5042 = _5214;
            if (!_5216)
            {
                bool _5218 = _4631 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5220 = isnan(_4631);
                bool _5222 = _5218 || _5220;
                bool _5224 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5226 = _5222 || _5224;
                if (!_5226)
                {
                    float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5230 = _4631 + _5228;
                    float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5234 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5232;
                    float _5236 = 1.0 / _5234;
                    float _5238 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5240 = _5238 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5242 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5244 = _5242 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5246 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5248 = _5246 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5250 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5252 = _5250 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5254 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5256 = _5254 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5258 = _5230 * _5236;
                    float _5260 = precise::clamp(_5258, 0.0, 1.0);
                    float _5262 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5264 = _5262 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5266 = fma(_5260, _5244, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5268 = fma(_5260, _5264, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5270 = fma(_5260, _5240, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5272 = fma(_5260, _5248, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5274 = fma(_5260, _5252, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5276 = fma(_5260, _5256, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5062 = _5270;
                    _5130 = _5274;
                    _5116 = _5268;
                    _5122 = _5272;
                    _5042 = _5266;
                    _5070 = _5276;
                    _5192 = true;
                }
                else
                {
                    _5062 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5130 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5116 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5122 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5042 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5070 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5192 = false;
    float _5278 = _5062;
    float _5280 = _5130;
    float _5282 = _5116;
    float _5284 = _5122;
    float _5286 = _5042;
    float _5288 = _5070;
    float _5290 = _5108 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5292 = fma(_4219, -0.5, 0.5);
    float _5294 = precise::clamp(_5292, 0.0, 1.0);
    float _5296 = -_5278;
    float _5298 = _5280 + _5296;
    float _5300 = -_5282;
    float _5302 = _5284 + _5300;
    out.m_55.x = _5290;
    float _5304 = fma(_5294, _5298, _5278);
    float _5306 = -_5286;
    float _5308 = _5288 + _5306;
    float _5310 = fma(_5294, _5302, _5282);
    float _5312 = _5304 * 0.586610972881317138671875;
    bool _5314 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5316 = fma(_5294, _5308, _5286);
    out.m_107.x = 0.0;
    float _5318 = fma(_5310, 0.298911988735198974609375, _5312);
    bool _5320 = _4609 > 0.0;
    bool _5322 = isnan(_4609);
    bool _5324 = _5320 || _5322;
    bool _5326 = isnan(0.0);
    bool _5328 = _5324 || _5326;
    float _5330 = fma(_5316, 0.114477999508380889892578125, _5318);
    float _5332 = -_5330;
    float _5334 = _5310 + _5332;
    float _5336 = -_5330;
    float _5338 = _5304 + _5336;
    float _5340 = -_5330;
    float _5342 = _5316 + _5340;
    float _5344 = fma(_5334, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    float _5346 = fma(_5338, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    float _5348 = fma(_5342, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5330);
    bool _5350 = !_5314;
    if (!_5350)
    {
        float _5352 = -_4549;
        float _5354 = _5352 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5356 = -_4551;
        float _5358 = _5356 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5360 = -_4553;
        float _5362 = _5360 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5364 = _5354 * _5354;
        float _5366 = fma(_5358, _5358, _5364);
        float _5368 = fma(_5362, _5362, _5366);
        float _5370 = sqrt(_5368);
        float _5372 = rsqrt(_5368);
        float _5374 = -_5370;
        float _5376 = _5374 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5378 = _5376 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5380 = precise::clamp(_5378, 0.0, 1.0);
        float _5382 = _5358 * _5372;
        float _5384 = _5354 * _5372;
        float _5386 = abs(_5380);
        float _5388 = log2(_5386);
        float _5390 = _5362 * _5372;
        float _5392 = _5382 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5394 = _4219 * _5384;
        float _5396 = -_5384;
        float _5398 = -_5392;
        float _5400 = fma(_5396, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5398);
        float _5402 = fma(_4213, _5382, _5394);
        float _5404 = -_5390;
        float _5406 = fma(_5404, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5400);
        float _5408 = fma(_4225, _5390, _5402);
        float _5410 = precise::clamp(_5408, 0.0, 1.0);
        float _5412 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5414 = _5406 + _5412;
        float _5416 = _5388 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5418 = _5414 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5420 = precise::clamp(_5418, 0.0, 1.0);
        float _5422 = exp2(_5416);
        float _5424 = _5422 * _5420;
        float _5426 = _5410 * _5424;
        float _5428 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5430 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5432 = _5426 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _5428;
        out.m_107.y = _5430;
        out.m_107.z = _5432;
    }
    out.m_109.x = _5344;
    out.m_109.y = _5346;
    out.m_109.z = _5348;
    if (_5328)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_55.x = 0.0;
    float _5434 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5434;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

