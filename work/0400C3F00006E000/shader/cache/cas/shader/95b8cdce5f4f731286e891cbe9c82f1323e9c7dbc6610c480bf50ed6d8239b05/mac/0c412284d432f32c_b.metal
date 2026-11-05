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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_111 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_99 [[user(locn13)]];
    float4 m_95 [[user(locn14)]];
    float4 m_109 [[user(locn15)]];
    float4 m_105 [[user(locn16)]];
    float4 m_107 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_101 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_93 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6754 = false;
    bool _5835 = false;
    bool _1200 = false;
    bool _876 = false;
    bool _734 = false;
    bool _580 = false;
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_48.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_51.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7053 = as_type<float>(_146);
        out.gl_Position.z = _7053;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_53.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_130);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _140;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7122 = as_type<float>(_184);
        out.gl_Position.z = _7122;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = in.m_61.x;
    float _208 = in.m_61.y;
    float _210 = in.m_61.z;
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
    float _248;
    if (!_230)
    {
        float _232 = in.m_63.x;
        float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _236 = _232 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _240 = _238 * _234;
        float _242 = floor(_240);
        float _244 = -_242;
        float _246 = _240 + _244;
        _248 = _246;
        _250 = true;
    }
    else
    {
        float _252 = float(_130);
        float _254 = 1.0 / _252;
        float _256 = _164 * _254;
        _248 = _256;
    }
    _250 = false;
    float _258 = _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _280 = 1.0 / _266;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _282;
    bool _286 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _288 = isnan(_258);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = 1.0 / _270;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _258 + _300;
    bool _304 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_258);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _274;
    float _318 = _302 * _280;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _258 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _326 = _258 + _324;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _278;
    float _332 = _262 * _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _336 = _258 + _334;
    float _338 = 1.0 / _284;
    float _340 = _322 * _316;
    bool _342 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_258);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    bool _354 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = isnan(_258);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = _326 * _330;
    float _368 = -_296;
    float _370 = _368 + 1.0;
    bool _372 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _374 = isnan(_258);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = _352 * _370;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _336 * _338;
    float _392 = -_352;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = fma(_388, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = _382 * _394;
    float _408 = fma(_398, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_402, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = -_364;
    float _414 = _412 + 1.0;
    float _416 = -_382;
    float _418 = _416 + 1.0;
    bool _420 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _422 = isnan(_258);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = _314 * _414;
    float _438 = -_314;
    float _440 = _438 + 1.0;
    float _442 = _364 * _418;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _430 * _440;
    float _454 = fma(_434, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_450, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = _408 * _452;
    float _462 = -_430;
    float _464 = _462 + 1.0;
    float _466 = _410 * _452;
    float _468 = _404 * _452;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _466);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _478;
    float _482 = fma(_472, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_454, _436, _474);
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_458, _436, _476);
    float _494 = fma(_482, _442, _484);
    float _496 = fma(_480, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_456, _436, _486);
    float _500 = fma(_490, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_496, _442, _498);
    float _516 = fma(_504, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _518 = fma(_508, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _520 = fma(_512, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _522 = fma(_500, _442, _492);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _532;
    float _536 = fma(_516, _406, _494);
    float _538 = fma(_526, _390, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _540 = fma(_530, _390, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _542 = fma(_534, _390, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _544 = fma(_518, _406, _514);
    float _546 = fma(_520, _406, _522);
    float _548 = fma(_538, _384, _536);
    float _550 = fma(_540, _384, _544);
    float _552 = fma(_542, _384, _546);
    float _554 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].x, _548);
    float _556 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].y, _550);
    float _558 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].z, _552);
    bool _560 = !_328;
    float _578;
    if (!_560)
    {
        float _562 = in.m_63.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_130);
        float _584 = 1.0 / _582;
        float _586 = _164 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _588 + _590;
    float _594 = in.m_65.x;
    float _596 = in.m_65.y;
    float _598 = in.m_65.z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _604 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = isnan(_588);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _622 = isnan(_588);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    bool _636 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = isnan(_588);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _602;
    float _650 = -_614;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _588 + _654;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _630 * _652;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _618;
    float _668 = _634 * _648;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _592, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _672 * _666;
    float _678 = -_646;
    float _680 = _678 + 1.0;
    float _682 = _674 * _660;
    float _684 = fma(_676, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _686 = _614 * _680;
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _690 = _558 * _598;
    float _692 = fma(_684, _686, _688);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _700 = _556 * _596;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _554 * _594;
    out.m_67.x = _704;
    out.m_67.y = _706;
    out.m_67.z = _710;
    out.m_67.w = _708;
    bool _714 = !_658;
    float _732;
    if (!_714)
    {
        float _716 = in.m_63.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_130);
        float _738 = 1.0 / _736;
        float _740 = _164 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _752 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _754 = isnan(_742);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _768 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _770 = isnan(_742);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _780;
    bool _784 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _786 = isnan(_742);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = 1.0 / _750;
    float _798 = -_762;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _804 = _742 + _802;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _808 = _778 * _800;
    float _810 = -_778;
    float _812 = _810 + 1.0;
    float _814 = 1.0 / _766;
    float _816 = _782 * _796;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _822 = fma(_816, _746, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _824 = -_794;
    float _826 = _824 + 1.0;
    float _828 = _820 * _814;
    float _830 = _822 * _808;
    float _832 = _762 * _826;
    float _834 = fma(_828, _804, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[131].x, _830);
    float _838 = fma(_834, _832, _836);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _846 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[133].x, _838);
    float _848 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _850 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _854 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _848;
    out.m_69.y = _850;
    out.m_69.z = _852;
    out.m_69.w = _854;
    bool _856 = !_806;
    float _874;
    if (!_856)
    {
        float _858 = in.m_63.x;
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _862 = _858 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _866 = _864 * _860;
        float _868 = floor(_866);
        float _870 = -_868;
        float _872 = _866 + _870;
        _874 = _872;
        _876 = true;
    }
    else
    {
        float _878 = float(_130);
        float _880 = 1.0 / _878;
        float _882 = _164 * _880;
        _874 = _882;
    }
    _876 = false;
    float _884 = _874;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _888 = _884 + _886;
    bool _890 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _892 = isnan(_884);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _906;
    bool _910 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _912 = isnan(_884);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -_900;
    float _924 = _922 + 1.0;
    bool _926 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _928 = isnan(_884);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = 1.0 / _904;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _920 * _924;
    float _946 = -_936;
    float _948 = _946 + 1.0;
    float _950 = 1.0 / _942;
    bool _952 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _954 = _908 * _938;
    float _956 = -_920;
    float _958 = _956 + 1.0;
    bool _960 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _962 = isnan(_884);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = fma(_954, _888, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _974 = _936 * _958;
    bool _976 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _978 = isnan(_884);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _970 * _948;
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _998 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1000 = isnan(_884);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _986 * _992;
    float _1012 = -_986;
    float _1014 = _1012 + 1.0;
    bool _1016 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1018 = isnan(_884);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = 1.0 / _996;
    float _1030 = -_1008;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1038 = _1008 * _1014;
    float _1040 = _1026 * _1032;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1046 = -_1026;
    float _1048 = _1046 + 1.0;
    float _1050 = 1.0 / _1036;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1056 = _972 * _1040;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1064 = _884 + _1062;
    float _1066 = _1054 * _950;
    float _1068 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1056);
    float _1070 = 1.0 / _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1072;
    float _1076 = fma(_1066, _1064, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1084 = _884 + _1082;
    float _1086 = _1074 * _1028;
    float _1088 = fma(_1076, _1038, _1068);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1092 = _884 + _1090;
    float _1094 = 1.0 / _1060;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1100 = fma(_1086, _1084, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1102 = _1098 * _1050;
    bool _1104 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1106 = isnan(_884);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1112 = _1108 || _1110;
    int _1114 = _1112 ? 1065353216 : 0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1116;
    float _1120 = 1.0 / _1080;
    float _1122 = fma(_1100, _1010, _1088);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1128 = _1118 * _1070;
    float _1130 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1134 = _884 + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1138 = _884 + _1136;
    float _1140 = _1126 * _1094;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1142;
    float _1146 = fma(_1128, _1134, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1148 = fma(_1130, _988, _1122);
    float _1150 = fma(_1140, _1138, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1152 = -as_type<float>(_1114);
    float _1154 = _1152 + 1.0;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1158 = _884 + _1156;
    float _1160 = fma(_1146, _974, _1148);
    float _1162 = _1144 * _1120;
    float _1164 = _900 * _1154;
    float _1166 = fma(_1150, _944, _1160);
    float _1168 = fma(_1162, _1158, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1170 = fma(_1168, _1164, _1166);
    float _1172 = fma(as_type<float>(_1114), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1170);
    out.m_71.x = _1172;
    bool _1174 = !_952;
    float _1176 = _944;
    int _1178 = _1114;
    int _1180 = as_type<int>(_1164);
    float _1198;
    if (!_1174)
    {
        float _1182 = in.m_63.x;
        float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1186 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1190 = _1188 * _1184;
        float _1192 = floor(_1190);
        float _1194 = -_1192;
        float _1196 = _1190 + _1194;
        _1198 = _1196;
        _1200 = true;
    }
    else
    {
        float _1202 = float(_130);
        float _1204 = 1.0 / _1202;
        float _1206 = _164 * _1204;
        _1198 = _1206;
    }
    _1200 = false;
    float _1208 = _1198;
    float _1210 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1212 = int(_1210);
    float _1214 = in.m_73.x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = in.m_63.y;
    float _1222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1224 = int(_1222);
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1228 = _1226 != 0;
    float _1230 = 0.0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1218)
    {
        _1230 = 1.0;
    }
    float _1234 = _1230;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1242 = _1240 != 0;
    float _1244 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1246 = int(_1244);
    float _1248 = float(_1212);
    float _1250 = 0.0;
    float _1252 = _1234;
    bool _1254 = _1238;
    bool _1256 = _1242;
    if (_1218)
    {
        _1250 = 1.0;
    }
    float _1258 = _1250;
    float _1260 = 0.0;
    float _1262 = _1258;
    if (_1218)
    {
        _1260 = 1.0;
    }
    float _1264 = _1260;
    int _1266 = 0;
    float _1268 = _1264;
    if (_1218)
    {
        _1266 = 0;
    }
    int _1270 = _1266;
    float _1272 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1274 = int(_1272);
    float _1276 = float(_1224);
    int _1278 = _1270;
    if (_1218)
    {
        _1232 = 0;
    }
    int _1280 = _1232;
    int _1282 = _1280;
    float _1284 = _1214;
    if (!_1228)
    {
        _1176 = _1214;
    }
    float _1286 = _1176;
    float _1288 = _1286;
    if (_1238)
    {
        float _1290 = -_1214;
        float _1292 = _1290 + 1.0;
        _1178 = as_type<int>(_1292);
    }
    int _1294 = _1178;
    if (_1242)
    {
        float _1296 = -_1214;
        float _1298 = _1296 + 1.0;
        _1180 = as_type<int>(_1298);
    }
    int _1300 = _1180;
    bool _1302 = _1220 > 0.5;
    float _1304 = 1.0 / _1248;
    float _1306 = float(_1246);
    float _1308 = 0.0;
    if (!_1238)
    {
        _1308 = _1214;
    }
    float _1310 = _1308;
    float _1312 = 0.0;
    float _1314 = _1310;
    if (!_1242)
    {
        _1312 = _1214;
    }
    float _1316 = _1312;
    float _1318 = _1316;
    if (_1238)
    {
        float _1320 = _1302 ? as_type<float>(_1294) : _1214;
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1326 = int(_1324);
    float _1328 = float(uint(_1274));
    if (_1242)
    {
        float _1330 = _1302 ? as_type<float>(_1300) : _1214;
        _1318 = _1330;
    }
    float _1332 = _1318;
    int _1334 = 0;
    if (_1218)
    {
        _1334 = as_type<int>(_1220);
    }
    int _1336 = _1334;
    float _1338 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1340 = int(_1338);
    float _1342 = _1304 * _164;
    float _1344 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1346 = int(_1344);
    float _1348 = float(uint(_1326));
    float _1350 = 1.0 / _1276;
    float _1352 = float(_1340);
    float _1354 = 1.0 / _1306;
    float _1356 = float(uint(_1346));
    float _1358 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1360 = int(_1358);
    float _1362 = _1350 * _164;
    float _1364 = 1.0 / _1328;
    float _1366 = _1354 * _164;
    float _1368 = 1.0 / _1348;
    float _1370 = float(uint(_1360));
    float _1372 = trunc(_1342);
    int _1374 = int(_1372);
    float _1376 = _1348;
    int _1378 = _1336;
    if (_1218)
    {
        float _1380 = in.m_63.x;
        _1376 = _1380;
    }
    float _1382 = _1376;
    int _1384 = as_type<int>(_1364) + (-2);
    float _1386 = 1.0 / _1352;
    int _1388 = as_type<int>(_1368) + (-2);
    float _1390 = 1.0 / _1356;
    float _1392 = float(uint(_1374));
    float _1394 = as_type<float>(_1388) * _1392;
    float _1396 = trunc(_1362);
    int _1398 = int(_1396);
    float _1400 = _1386 * _164;
    float _1402 = trunc(_1366);
    int _1404 = int(_1402);
    int _1406 = as_type<int>(_1390) + (-2);
    float _1408 = 1.0 / _1370;
    float _1410 = float(uint(_1398));
    float _1412 = as_type<float>(_1406) * _1410;
    float _1414 = trunc(_1400);
    int _1416 = int(_1414);
    float _1418 = _1370;
    int _1420 = as_type<int>(_1412);
    if (_1218)
    {
        float _1422 = in.m_63.z;
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = float(uint(_1404));
    float _1428 = as_type<float>(_1384) * _1426;
    float _1430 = trunc(_1394);
    float _1432 = precise::max(_1430, 0.0);
    uint _1435 = uint(_1432);
    float _1437 = trunc(_1412);
    float _1439 = precise::max(_1437, 0.0);
    uint _1441 = uint(_1439);
    float _1443 = trunc(_1428);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    float _1449 = _1382;
    if (_1218)
    {
        _1420 = as_type<int>(_1382);
    }
    int _1451 = _1420;
    int _1453 = 0;
    float _1455 = as_type<float>(_1451);
    float _1457 = _1424;
    if (_1218)
    {
        _1453 = as_type<int>(_1424);
    }
    int _1459 = _1453;
    int _1461 = 0;
    int _1463 = _1459;
    if (_1218)
    {
        _1461 = _1451;
    }
    int _1465 = _1461;
    int _1467 = int(_1238);
    int _1469 = _1228 ? 2 : 0;
    int _1471 = _1467 | _1469;
    int _1473 = _1242 ? 4 : 0;
    int _1475 = _1471 | _1473;
    int _1477 = _1218 ? 8 : 0;
    int _1479 = _1475 | _1477;
    int _1481 = false ? 16 : 0;
    int _1483 = _1479 | _1481;
    int _1485 = _1302 ? 32 : 0;
    int _1487 = _1483 | _1485;
    int _1489 = false ? 64 : 0;
    int _1491 = _1487 | _1489;
    int _1493 = _1491 & 32;
    float _1495 = as_type<float>(_1493);
    int _1497 = _1465;
    if (_1218)
    {
        _1495 = as_type<float>(_1451);
    }
    float _1499 = _1495;
    float _1501 = _1499;
    if (!_1218)
    {
        float _1503 = in.m_63.x;
        float _1505 = _1220 * 3.1415927410125732421875;
        float _1507 = in.m_63.z;
        float _1509 = _1505 * 0.15915493667125701904296875;
        float _1511 = _1509 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = _1503 * 3.1415927410125732421875;
        float _1517 = _1515 * 0.15915493667125701904296875;
        float _1519 = _1507 * 3.1415927410125732421875;
        float _1521 = _1519 * 0.15915493667125701904296875;
        float _1523 = _1517 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1501 = _1507;
        _1268 = 5.839270114898681640625;
        _1449 = _1503;
        _1252 = 7.345489978790283203125;
        _1455 = _1220;
        _1262 = 1.2345600128173828125;
        _1278 = 1;
        _1282 = 2;
        _1457 = _1507;
        _1378 = as_type<int>(_1513);
        _1497 = as_type<int>(_1525);
        _1463 = as_type<int>(_1529);
    }
    float _1531 = _1501;
    float _1533 = _1268;
    float _1535 = _1449;
    float _1537 = _1252;
    float _1539 = _1455;
    float _1541 = _1262;
    int _1543 = _1278;
    int _1545 = _1282;
    float _1547 = _1457;
    int _1549 = _1378;
    int _1551 = _1497;
    int _1553 = _1463;
    int _1555 = ~_1274;
    int _1557 = _1555 + 1;
    float _1559 = _1120;
    if (_1228)
    {
        float _1561 = in.m_63.x;
        _1559 = _1561;
    }
    float _1563 = _1559;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1567 = _1565 != 0;
    float _1569 = _1531 * _1533;
    int _1571 = ~_1346;
    int _1573 = _1571 + 1;
    int _1575 = _1557 * int(_1447);
    int _1577 = _1575 + _1404;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1581 = _1579 != 0;
    float _1583 = _1535 * _1537;
    float _1585 = _1539 * _1541;
    int _1587 = as_type<int>(_1408) + (-2);
    float _1589 = floor(_1569);
    float _1591 = float(uint(_1577));
    int _1593 = _1573 * int(_1441);
    int _1595 = _1593 + _1398;
    float _1597 = float(uint(_1416));
    float _1599 = _1539 * _1537;
    float _1601 = _1531;
    if (_1567)
    {
        float _1603 = in.m_63.z;
        _1601 = _1603;
    }
    float _1605 = _1601;
    int _1607 = ~_1326;
    int _1609 = _1607 + 1;
    float _1611 = as_type<float>(_1384) * _1591;
    float _1613 = float(uint(_1595));
    float _1615 = floor(_1583);
    int _1617 = 0;
    float _1619 = _1611;
    if (_1581)
    {
        float _1621 = -_1214;
        float _1623 = _1621 + 1.0;
        _1617 = as_type<int>(_1623);
    }
    int _1625 = _1617;
    int _1627 = _1609 * int(_1435);
    int _1629 = _1627 + _1374;
    int _1631 = 0;
    if (_1567)
    {
        float _1633 = -_1214;
        float _1635 = _1633 + 1.0;
        _1631 = as_type<int>(_1635);
    }
    int _1637 = _1631;
    float _1639 = as_type<float>(_1406) * _1613;
    int _1641 = ~_1274;
    int _1643 = _1641 + 1;
    bool _1645 = _1543 != 1;
    float _1647 = _1563;
    if (_1228)
    {
        bool _1649 = _1563 > 0.5;
        _1254 = _1649;
    }
    bool _1651 = _1254;
    float _1653 = floor(_1585);
    if (!_1581)
    {
        _1647 = _1214;
    }
    float _1655 = _1647;
    bool _1657 = _1545 != 2;
    float _1659 = _1655;
    if (_1581)
    {
        float _1661 = _1302 ? as_type<float>(_1625) : _1214;
        _1659 = _1661;
    }
    float _1663 = _1659;
    float _1665 = _1220 * 2.0;
    float _1667 = float(uint(_1629));
    float _1669 = in.m_59.w;
    int _1671 = ~_1326;
    int _1673 = _1671 + 1;
    float _1675 = trunc(_1639);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = -_1615;
    float _1683 = _1583 + _1681;
    float _1685 = as_type<float>(_1388) * _1667;
    int _1687 = ~_1360;
    int _1689 = _1687 + 1;
    int _1691 = as_type<int>(_1667);
    float _1693 = as_type<float>(_1673);
    if (_1228)
    {
        float _1695 = -_1214;
        float _1697 = _1695 + 1.0;
        _1691 = as_type<int>(_1697);
    }
    int _1699 = _1691;
    if (_1567)
    {
        bool _1701 = _1605 > 0.5;
        _1256 = _1701;
    }
    bool _1703 = _1256;
    float _1705 = in.m_61.w;
    int _1707 = ~_1346;
    int _1709 = _1707 + 1;
    float _1711 = -_1653;
    float _1713 = _1585 + _1711;
    float _1715 = as_type<float>(_1587) * _1597;
    float _1717 = float(_130);
    float _1719 = trunc(_1685);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = float(_1274);
    float _1727 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1729 = as_type<float>(_1709);
    if (_1228)
    {
        float _1731 = _1651 ? as_type<float>(_1699) : _1214;
        _1288 = _1731;
    }
    float _1733 = _1288;
    int _1735 = int(_1441) + int(_1679);
    float _1737 = _1683 * _1725;
    float _1739 = float(_1404);
    float _1741 = trunc(_1715);
    float _1743 = precise::max(_1741, 0.0);
    uint _1745 = uint(_1743);
    float _1747 = -_1589;
    float _1749 = _1569 + _1747;
    float _1751 = float(_1346);
    bool _1753 = _1739 >= _1725;
    bool _1755 = isnan(_1739);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(_1725);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = float(_1360);
    float _1767 = floor(_1599);
    int _1769 = int(_1435) + int(_1723);
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1773 = _1771 != 0;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1777 = _1775 != 0;
    float _1779 = 1.0 / _1717;
    int _1781 = _1689 * int(_1745);
    int _1783 = _1781 + _1416;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1787 = float(uint(_1783));
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1791 = trunc(_1611);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = _1725 * _164;
    float _1799 = -_1767;
    float _1801 = _1599 + _1799;
    float _1803 = as_type<float>(_1587) * _1787;
    float _1805 = float(_1398);
    float _1807 = _1751 * _1713;
    float _1809 = float(_1326);
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1813 = trunc(_1803);
    float _1815 = precise::max(_1813, 0.0);
    uint _1817 = uint(_1815);
    if (!_1567)
    {
        _1619 = _1214;
    }
    float _1819 = _1619;
    float _1821 = _1797 * _1779;
    float _1823 = _1819;
    if (_1567)
    {
        float _1825 = _1703 ? as_type<float>(_1637) : _1214;
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = _1779 * _164;
    float _1831 = float(_1374);
    float _1833 = _1809 * _1749;
    bool _1835 = _1805 >= _1751;
    bool _1837 = isnan(_1805);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1751);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1809 * _1829;
    int _1849 = int(_1447) + int(_1795);
    float _1851 = _1765 * _1829;
    float _1853 = float(_1416);
    float _1855 = trunc(_1845);
    int _1857 = int(_1855);
    bool _1859 = _1831 >= _1809;
    bool _1861 = isnan(_1831);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(_1809);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    float _1871 = _1765 * _1801;
    bool _1873 = _1853 >= _1765;
    bool _1875 = isnan(_1853);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1765);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    int _1885 = _1643 * _1849;
    int _1887 = _1885 + _1404;
    int _1889 = _1709 * _1735;
    int _1891 = _1889 + _1398;
    int _1893 = int(_1745) + int(_1817);
    float _1895 = trunc(_1763);
    int _1897 = int(_1895);
    bool _1899 = !_1773;
    int _1901 = _1899 ? 0 : 1;
    float _1903 = _1751 * _1829;
    bool _1905 = uint(_1887) >= uint(_1274);
    int _1907 = _1673 * _1769;
    int _1909 = _1907 + _1374;
    int _1911 = abs(_1901);
    int _1913 = ~_1360;
    int _1915 = _1913 + 1;
    float _1917 = trunc(_1737);
    int _1919 = int(_1917);
    bool _1921 = uint(_1891) >= uint(_1346);
    bool _1923 = uint(_1909) >= uint(_1326);
    int _1925 = _1915 * _1893;
    int _1927 = _1925 + _1416;
    bool _1929 = !_1777;
    int _1931 = _1929 ? 0 : 1;
    bool _1933 = !_1905;
    int _1935 = _1933 ? 0 : (-1);
    float _1937 = trunc(_1807);
    int _1939 = int(_1937);
    bool _1941 = !_1921;
    int _1943 = _1941 ? 0 : (-1);
    int _1945 = abs(_1931);
    int _1947 = ~_1849;
    int _1949 = _1947 + _1935;
    int _1951 = _1949 + 1;
    bool _1953 = !_1923;
    int _1955 = _1953 ? 0 : (-1);
    float _1957 = trunc(_1869);
    int _1959 = int(_1957);
    bool _1961 = uint(_1927) >= uint(_1360);
    int _1963 = _1919 * _1911;
    int _1965 = _1963 + _1404;
    int _1967 = ~_1735;
    int _1969 = _1967 + _1943;
    int _1971 = _1969 + 1;
    int _1973 = ~_1769;
    int _1975 = _1973 + _1955;
    int _1977 = _1975 + 1;
    int _1979 = _1274 * _1951;
    int _1981 = _1979 + _1404;
    bool _1983 = !_1961;
    int _1985 = _1983 ? 0 : (-1);
    int _1987 = _1939 * _1945;
    int _1989 = _1987 + _1398;
    int _1991 = _1346 * _1971;
    int _1993 = _1991 + _1398;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1833);
    int _2001 = int(_1999);
    int _2003 = ~_1893;
    int _2005 = _2003 + _1985;
    int _2007 = _2005 + 1;
    int _2009 = _1326 * _1977;
    int _2011 = _2009 + _1374;
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2015 = _2013 != 0;
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2019 = _2017 != 0;
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2023 = _2021 != 0;
    bool _2025 = _1346 == 0;
    int _2027 = _1360 * _2007;
    int _2029 = _2027 + _1416;
    bool _2031 = !_1997;
    int _2033 = _2031 ? 0 : 1;
    float _2035 = trunc(_1883);
    int _2037 = int(_2035);
    bool _2039 = _1274 == 0;
    bool _2041 = _1326 == 0;
    int _2043 = ~_1857;
    int _2045 = _2043 + 1;
    int _2047 = _2045 + 1;
    bool _2049 = _1360 == 0;
    float _2051 = trunc(_1821);
    int _2053 = int(_2051);
    bool _2055 = !_2025;
    int _2057 = _2055 ? _1993 : (-1);
    int _2059 = ~_1897;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    bool _2065 = !_2039;
    int _2067 = _2065 ? _1981 : (-1);
    int _2069 = _2047 * _2057;
    int _2071 = abs(_2033);
    float _2073 = trunc(_1903);
    int _2075 = int(_2073);
    int _2077 = ~_1959;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    int _2083 = _2067 * _2063;
    bool _2085 = !_2041;
    int _2087 = _2085 ? _2011 : (-1);
    int _2089 = _2001 * _2071;
    int _2091 = _2089 + _1374;
    bool _2093 = !_2049;
    int _2095 = _2093 ? _2029 : (-1);
    int _2097 = _1274 + (-1);
    int _2099 = _2081 * _2087;
    bool _2101 = !_2019;
    int _2103 = _2101 ? 0 : 1;
    float _2105 = floor(_1665);
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2109 = _2107 != 0;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2113 = _2111 != 0;
    int _2115 = _1897 * _2097;
    int _2117 = _2115 + _2083;
    int _2119 = _1346 + (-1);
    int _2121 = abs(_2103);
    bool _2123 = !_2015;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _1857 * _2119;
    int _2129 = _2127 + _2069;
    bool _2131 = !_2113;
    int _2133 = _2131 ? 0 : 1;
    int _2135 = _2117 * _2121;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2139 = _2137 != 0;
    int _2141 = abs(_2125);
    int _2143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2145 = _2143 != 0;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2149 = _2147 != 0;
    bool _2151 = !_2023;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2053 * _2141;
    int _2157 = _2155 + _2135;
    int _2159 = abs(_2133);
    bool _2161 = !_2145;
    int _2163 = _2161 ? 0 : 1;
    int _2165 = abs(_2153);
    int _2167 = _2129 * _2159;
    bool _2169 = !_2139;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2163);
    bool _2175 = !_2109;
    int _2177 = _2175 ? 0 : 1;
    int _2179 = abs(_2171);
    int _2181 = _1965 * _2165;
    int _2183 = _2181 + _2157;
    int _2185 = abs(_2177);
    int _2187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2189 = _2187 != 0;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2193 = _2191 != 0;
    int _2195 = _2075 * _2185;
    int _2197 = _2195 + _2167;
    bool _2199 = !_2149;
    int _2201 = _2199 ? 0 : 1;
    int _2203 = _1919 * _2179;
    int _2205 = _2203 + _2183;
    float _2207 = trunc(_1871);
    int _2209 = int(_2207);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2213 = _2211 != 0;
    int _2215 = abs(_2201);
    int _2217 = _1989 * _2173;
    int _2219 = _2217 + _2197;
    bool _2221 = !_2213;
    int _2223 = _2221 ? 0 : 1;
    bool _2225 = !_2193;
    int _2227 = _2225 ? 0 : 1;
    float _2229 = trunc(_1847);
    int _2231 = int(_2229);
    float _2233 = float(uint(_2205));
    int _2235 = abs(_2223);
    int _2237 = _1939 * _2215;
    int _2239 = _2237 + _2219;
    int _2241 = abs(_2227);
    float _2243 = as_type<float>(_1384) * _2233;
    int _2245 = _1326 + (-1);
    bool _2247 = !_2189;
    int _2249 = _2247 ? 0 : 1;
    float _2251 = trunc(_2243);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = ~_2037;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    int _2263 = _1959 * _2245;
    int _2265 = _2263 + _2099;
    int _2267 = abs(_2249);
    float _2269 = in.m_73.y;
    int _2271 = _2261 * _2095;
    float _2273 = float(uint(_2239));
    int _2275 = _2265 * _2241;
    int _2277 = _1360 + (-1);
    int _2279 = _2209 * _2235;
    int _2281 = _2279 + _1416;
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2285 = _2283 != 0;
    float _2287 = as_type<float>(_1406) * _2273;
    int _2289 = _2231 * _2267;
    int _2291 = _2289 + _2275;
    int _2293 = ~_1274;
    int _2295 = _2293 + 1;
    int _2297 = _2037 * _2277;
    int _2299 = _2297 + _2271;
    bool _2301 = !_2285;
    int _2303 = _2301 ? 0 : 1;
    float _2305 = trunc(_2287);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2313 = _2311 != 0;
    int _2315 = abs(_2303);
    int _2317 = _2295 * int(_2255);
    int _2319 = _2317 + _2205;
    bool _2321 = !_2313;
    int _2323 = _2321 ? 0 : 1;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2327 = _2325 != 0;
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2331 = _2329 != 0;
    float _2333 = trunc(_1851);
    int _2335 = int(_2333);
    int _2337 = ~_1346;
    int _2339 = _2337 + 1;
    float _2341 = float(uint(_2319));
    int _2343 = _2091 * _2315;
    int _2345 = _2343 + _2291;
    bool _2347 = !_2331;
    int _2349 = _2347 ? 0 : 1;
    float _2351 = -_2269;
    float _2353 = _2351 + 1.0;
    float _2355 = as_type<float>(_1384) * _2341;
    bool _2357 = !_2327;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = abs(_2349);
    int _2363 = _2339 * int(_2309);
    int _2365 = _2363 + _2239;
    int _2367 = abs(_2323);
    float _2369 = trunc(_2355);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2377 = _2375 != 0;
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2381 = _2379 != 0;
    int _2383 = abs(_2359);
    float _2385 = float(uint(_2365));
    int _2387 = _2299 * _2361;
    bool _2389 = !_2377;
    int _2391 = _2389 ? 0 : 1;
    int _2393 = _2001 * _2367;
    int _2395 = _2393 + _2345;
    int _2397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2399 = _2397 != 0;
    float _2401 = as_type<float>(_1406) * _2385;
    int _2403 = abs(_2391);
    float _2405 = float(uint(_2395));
    float _2407 = trunc(_2401);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    int _2413 = _2335 * _2383;
    int _2415 = _2413 + _2387;
    bool _2417 = !_2381;
    int _2419 = _2417 ? 0 : 1;
    float _2421 = as_type<float>(_1388) * _2405;
    int _2423 = int(_2255) + int(_2373);
    int _2425 = _2281 * _2403;
    int _2427 = _2425 + _2415;
    int _2429 = ~_1274;
    int _2431 = _2429 + 1;
    float _2433 = trunc(_2421);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = abs(_2419);
    float _2441 = in.m_63.w;
    int _2443 = _2431 * _2423;
    int _2445 = _2443 + _2205;
    int _2447 = ~_1326;
    int _2449 = _2447 + 1;
    int _2451 = _2209 * _2439;
    int _2453 = _2451 + _2427;
    int _2455 = ~_1346;
    int _2457 = _2455 + 1;
    int _2459 = _2209;
    float _2461 = as_type<float>(_2011);
    float _2463 = as_type<float>(_1893);
    if (_2399)
    {
        float _2465 = -_1214;
        float _2467 = _2465 + 1.0;
        _2459 = as_type<int>(_2467);
    }
    int _2469 = _2459;
    bool _2471 = uint(_2445) >= uint(_1274);
    int _2473 = int(_2309) + int(_2411);
    bool _2475 = !_2471;
    int _2477 = _2475 ? 0 : (-1);
    int _2479 = _2457 * _2473;
    int _2481 = _2479 + _2239;
    float _2483 = float(uint(_2453));
    int _2485 = _2449 * int(_2437);
    int _2487 = _2485 + _2395;
    bool _2489 = _1220 > 0.5;
    int _2491 = ~_2423;
    int _2493 = _2491 + _2477;
    int _2495 = _2493 + 1;
    float _2497 = as_type<float>(_1587) * _2483;
    if (_2399)
    {
        float _2499 = _2489 ? as_type<float>(_2469) : _1214;
        _1284 = _2499;
    }
    float _2501 = _1284;
    bool _2503 = uint(_2481) >= uint(_1346);
    int _2505 = _1274 * _2495;
    int _2507 = _2505 + _2205;
    float _2509 = float(uint(_2487));
    float _2511 = trunc(_2497);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    bool _2517 = _1274 == 0;
    bool _2519 = !_2503;
    int _2521 = _2519 ? 0 : (-1);
    bool _2523 = _2441 > 0.5;
    float _2525 = as_type<float>(_1388) * _2509;
    bool _2527 = !_2517;
    int _2529 = _2527 ? _2507 : (-1);
    int _2531 = _2523 ? as_type<int>(_2353) : as_type<int>(_2269);
    float _2533 = trunc(_2525);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    int _2539 = _2529 & 3;
    bool _2541 = _2539 != 0;
    int _2543 = _2529 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = uint(_2539) >= 2u;
    int _2549 = _2545 ? 0 : 1;
    int _2551 = ~_2473;
    int _2553 = _2551 + _2521;
    int _2555 = _2553 + 1;
    bool _2557 = uint(_2539) > 1u;
    int _2559 = ~_1360;
    int _2561 = _2559 + 1;
    int _2563 = _1346 * _2555;
    int _2565 = _2563 + _2239;
    int _2567 = _2547 ? 0 : 1;
    bool _2569 = _2539 != 3;
    int _2571 = _2561 * int(_2515);
    int _2573 = _2571 + _2453;
    int _2575 = _2489 ? as_type<int>(_2353) : as_type<int>(_2269);
    bool _2577 = _1346 == 0;
    int _2579 = ~_1326;
    int _2581 = _2579 + 1;
    bool _2583 = !_2577;
    int _2585 = _2583 ? _2565 : (-1);
    int _2587 = int(_2437) + int(_2537);
    float _2589 = float(uint(_2573));
    int _2591 = ~_2549;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = as_type<float>(_1587) * _2589;
    int _2599 = _2595;
    if (!_2557)
    {
        int _2601 = ~_2549;
        int _2603 = _2601 + 1;
        _2599 = _2603;
    }
    int _2605 = _2599;
    int _2607 = _2585 & 3;
    bool _2609 = _2607 != 0;
    int _2611 = _2581 * _2587;
    int _2613 = _2611 + _2395;
    int _2615 = ~_2567;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2619;
    if (_2569)
    {
        int _2623 = ~_2567;
        int _2625 = _2623 + 1;
        _2621 = _2625;
    }
    int _2627 = _2621;
    bool _2629 = uint(_2607) >= 2u;
    float _2631 = trunc(_2597);
    float _2633 = precise::max(_2631, 0.0);
    uint _2635 = uint(_2633);
    int _2637 = _2609 ? 0 : 1;
    bool _2639 = uint(_2613) >= uint(_1326);
    int _2641 = _2629 ? 0 : 1;
    bool _2643 = _2607 != 3;
    bool _2645 = !_2639;
    int _2647 = _2645 ? 0 : (-1);
    bool _2649 = uint(_2607) > 1u;
    int _2651 = ~_2587;
    int _2653 = _2651 + _2647;
    int _2655 = _2653 + 1;
    int _2657 = ~_2641;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    bool _2663 = _1326 == 0;
    int _2665 = _1326 * _2655;
    int _2667 = _2665 + _2395;
    int _2669 = ~_2637;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    int _2675 = _2661;
    int _2677 = _2673;
    if (_2643)
    {
        int _2679 = ~_2641;
        int _2681 = _2679 + 1;
        _2675 = _2681;
    }
    int _2683 = _2675;
    int _2685 = ~_1360;
    int _2687 = _2685 + 1;
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2691 = _2689 != 0;
    if (!_2649)
    {
        int _2693 = ~_2637;
        int _2695 = _2693 + 1;
        _2677 = _2695;
    }
    int _2697 = _2677;
    bool _2699 = !_2663;
    int _2701 = _2699 ? _2667 : (-1);
    int _2703 = int(_2515) + int(_2635);
    bool _2705 = !_2691;
    int _2707 = _2705 ? 0 : 1;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2711 = _2709 != 0;
    int _2713 = _2687 * _2703;
    int _2715 = _2713 + _2453;
    int _2717 = _2701 & 3;
    bool _2719 = _2717 != 0;
    bool _2721 = !_2711;
    int _2723 = _2721 ? 0 : 1;
    bool _2725 = uint(_2717) >= 2u;
    int _2727 = _2719 ? 0 : 1;
    bool _2729 = uint(_2715) >= uint(_1360);
    int _2731 = _2725 ? 0 : 1;
    bool _2733 = _2717 != 3;
    bool _2735 = !_2729;
    int _2737 = _2735 ? 0 : (-1);
    bool _2739 = uint(_2717) > 1u;
    int _2741 = ~_2703;
    int _2743 = _2741 + _2737;
    int _2745 = _2743 + 1;
    int _2747 = ~_2731;
    int _2749 = _2747 + 1;
    int _2751 = _2749 + 1;
    bool _2753 = _1360 == 0;
    int _2755 = _1360 * _2745;
    int _2757 = _2755 + _2453;
    int _2759 = ~_2727;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = _2751;
    int _2767 = _2763;
    if (_2733)
    {
        int _2769 = ~_2731;
        int _2771 = _2769 + 1;
        _2765 = _2771;
    }
    int _2773 = _2765;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2777 = _2775 != 0;
    bool _2779 = !_2753;
    int _2781 = _2779 ? _2757 : (-1);
    float _2783 = _2777 ? as_type<float>(_2575) : _2269;
    if (!_2739)
    {
        int _2785 = ~_2727;
        int _2787 = _2785 + 1;
        _2767 = _2787;
    }
    int _2789 = _2767;
    int _2791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2793 = _2791 != 0;
    int _2795 = _2781 & 3;
    bool _2797 = _2795 != 0;
    bool _2799 = !_2793;
    int _2801 = _2799 ? 0 : 1;
    bool _2803 = uint(_2795) >= 2u;
    int _2805 = _2797 ? 0 : 1;
    int _2807 = _2803 ? 0 : 1;
    bool _2809 = _2795 != 3;
    bool _2811 = uint(_2795) > 1u;
    int _2813 = ~_2807;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = ~_2805;
    int _2821 = _2819 + 1;
    int _2823 = _2821 + 1;
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2827 = _2825 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2829 = _2817;
    int _2831 = _2823;
    if (_2809)
    {
        int _2833 = ~_2807;
        int _2835 = _2833 + 1;
        _2829 = _2835;
    }
    int _2837 = _2829;
    float _2839 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2841 = _2839 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2811)
    {
        int _2843 = ~_2805;
        int _2845 = _2843 + 1;
        _2831 = _2845;
    }
    int _2847 = _2831;
    float _2849 = 1.0 / _2827;
    float _2851 = in.m_48.x;
    float _2853 = in.m_48.y;
    float _2855 = in.m_48.z;
    bool _2857 = _1547 > 0.5;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2863 = _2861 != 0;
    int _2865 = _2857 ? as_type<int>(_2353) : as_type<int>(_2269);
    float _2867 = _2863 ? as_type<float>(_2531) : _2269;
    float _2869 = 1.0 / _2841;
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2877 = _2875 != 0;
    float _2879 = _2873 ? as_type<float>(_2865) : _2269;
    float _2881 = _2877 ? as_type<float>(_2865) : _2269;
    bool _2883 = !_1645;
    float _2885 = _2883 ? as_type<float>(_1549) : as_type<float>(_1551);
    bool _2887 = !_1645;
    float _2889 = _2887 ? as_type<float>(_1553) : as_type<float>(_1549);
    float _2891 = _202 * _2853;
    float _2893 = _196 * _2853;
    float _2895 = _208 * _2853;
    float _2897 = fma(_200, _2851, _2891);
    float _2899 = fma(_194, _2851, _2893);
    float _2901 = fma(_206, _2851, _2895);
    if (!_1645)
    {
        _1729 = _1547;
    }
    float _2903 = _1729;
    float _2905 = fma(_204, _2855, _2897);
    float _2907 = fma(_198, _2855, _2899);
    float _2909 = 0.0;
    float _2911 = _2903;
    if (!_1645)
    {
        _2909 = _1547;
    }
    float _2913 = _2909;
    float _2915 = as_type<float>(_1549) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2917 = _2913;
    if (!_1645)
    {
        _1693 = _1220;
    }
    float _2919 = _1693;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2923 = 0.0;
    float _2925 = _2919;
    if (!_1645)
    {
        _2923 = _1220;
    }
    float _2927 = _2923;
    float _2929 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2931 = _2927;
    if (_1657)
    {
        _2461 = _1535;
    }
    float _2933 = _2461;
    float _2935 = fma(as_type<float>(_1549), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2921);
    float _2937 = _2933;
    if (_1645)
    {
        _2911 = _1220;
    }
    float _2939 = _2911;
    float _2941 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2943 = log2(_2941);
    if (_1645)
    {
        _2917 = _1220;
    }
    float _2945 = _2917;
    float _2947 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1657)
    {
        _2463 = _1220;
    }
    float _2949 = _2463;
    float _2951 = fma(_210, _2855, _2901);
    float _2953 = _2949;
    if (_1645)
    {
        _2925 = _1535;
    }
    float _2955 = _2925;
    float _2957 = fma(_2889, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1785);
    if (_1645)
    {
        _2931 = _1535;
    }
    float _2959 = _2931;
    float _2961 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1657)
    {
        _2937 = _1547;
    }
    float _2963 = _2937;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1657)
    {
        _2953 = _1535;
    }
    float _2967 = _2953;
    float _2969 = fma(_2961, -2.0, _1811);
    int _2971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2973 = _2971 != 0;
    int _2975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2977 = _2975 != 0;
    float _2979 = fma(as_type<float>(_1551), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2965);
    int _2981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2983 = _2981 != 0;
    float _2985 = _2943 * _164;
    float _2987 = as_type<float>(_1551) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2989 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2993 = exp2(_2985);
    float _2995 = _2973 ? as_type<float>(_2865) : _2269;
    float _2997 = fma(_2929, -2.0, _2991);
    bool _2999 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3007 = _3003 || _3005;
    float _3009 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3009;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3017 = _3011 * _2849;
    float _3019 = fma(_2915, -2.0, _3013);
    float _3021 = fma(_2959, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3015);
    float _3023 = _2963 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3027 = -_2993;
    float _3029 = _3027 + 1.0;
    float _3031 = -_3025;
    float _3033 = fma(_2947, 2.0, _3031);
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3037 = _3007 ? _3029 : 0.0;
    float _3039 = -_2859;
    float _3041 = fma(_3023, 2.0, _3039);
    float _3043 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3047 = -_3035;
    float _3049 = fma(_2987, 2.0, _3047);
    float _3051 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3043);
    float _3053 = _2939 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3057 = _3055 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3061 = fma(_3053, -2.0, _1789);
    float _3063 = _2977 ? as_type<float>(_2865) : _2269;
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3071 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3073 = _3071 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3075 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3077 = isnan(1.0);
    bool _3079 = _3075 || _3077;
    bool _3081 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3083 = _3079 || _3081;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3087 = 1.0 + _3085;
    float _3089 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3045);
    float _3091 = 1.0 / _3087;
    float _3093 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3059);
    float _3095 = _1535 * 2.0;
    float _3097 = fma(_2885, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3065);
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3105 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3107 = 1.0 / _3057;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3111 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3113 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3115 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3093);
    float _3117 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3099);
    float _3119 = -_3103;
    float _3121 = fma(_3105, 2.0, _3119);
    float _3123 = floor(_3095);
    float _3125 = -_3101;
    float _3127 = fma(_2989, 2.0, _3125);
    float _3129 = fma(_3111, -2.0, _3109);
    float _3131 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3113);
    float _3133 = _3069 * _2869;
    float _3135 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3139 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3117);
    float _3141 = 1.0 / _3073;
    float _3143 = -_164;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3049);
    float _3147 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3019);
    float _3149 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2997);
    float _3151 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3089);
    float _3153 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3131);
    float _3155 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2979);
    float _3157 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2935);
    float _3159 = -_164;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3033);
    float _3163 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3097);
    float _3165 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2957);
    float _3167 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3021);
    float _3169 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3051);
    float _3171 = -_164;
    float _3173 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3121);
    float _3175 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2969);
    float _3177 = -_164;
    float _3179 = fma(_3177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3127);
    float _3181 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3061);
    float _3183 = -_164;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3041);
    float _3187 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3129);
    if (_3083)
    {
        float _3189 = _3037 * _3091;
        _168 = _3189;
    }
    float _3191 = _168;
    float _3193 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3195 = _3193 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3197 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3199 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3197;
    float _3201 = 1.0 / _3137;
    float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3205 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3203;
    float _3207 = _3199 * _3107;
    bool _3209 = _3123 >= 0.0;
    bool _3211 = isnan(_3123);
    bool _3213 = _3209 || _3211;
    bool _3215 = isnan(0.0);
    bool _3217 = _3213 || _3215;
    float _3219 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3221 = _3219 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3223 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3227 = _3205 * _3141;
    float _3229 = float(uint(_1989));
    float _3231 = 1.0 / _3195;
    int _3233 = _3217 ? 0 : 1;
    float _3235 = in.m_57.w;
    bool _3237 = _3123 > 0.0;
    float _3239 = as_type<float>(_1406) * _3229;
    float _3241 = float(uint(_1965));
    float _3243 = _3225 * _3201;
    float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3249 = 1.0 / _3221;
    float _3251 = as_type<float>(_1384) * _3241;
    int _3253 = ~_1346;
    int _3255 = _3253 + 1;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3257;
    int _3261 = ~_1326;
    int _3263 = _3261 + 1;
    float _3265 = _3247 * _3231;
    int _3267 = ~_3233;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    float _3273 = trunc(_3239);
    float _3275 = precise::max(_3273, 0.0);
    uint _3277 = uint(_3275);
    int _3279 = _3271;
    if (!_3237)
    {
        int _3281 = ~_3233;
        int _3283 = _3281 + 1;
        _3279 = _3283;
    }
    int _3285 = _3279;
    float _3287 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3289 = _1208 + _3287;
    float _3291 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3293 = _1208 + _3291;
    bool _3295 = _2105 >= 0.0;
    bool _3297 = isnan(_2105);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan(0.0);
    bool _3303 = _3299 || _3301;
    float _3305 = fma(_3017, _3289, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3309 = _1208 + _3307;
    float _3311 = trunc(_3251);
    float _3313 = precise::max(_3311, 0.0);
    uint _3315 = uint(_3313);
    float _3317 = fma(_3133, _3293, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3319 = _3259 * _3249;
    float _3321 = fma(_3243, _3309, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3325 = _1208 + _3323;
    int _3327 = ~_1274;
    int _3329 = _3327 + 1;
    int _3331 = _3303 ? 0 : 1;
    int _3333 = _3255 * int(_3277);
    int _3335 = _3333 + _1989;
    float _3337 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3339 = _1208 + _3337;
    bool _3341 = _2105 > 0.0;
    float _3343 = float(uint(_2281));
    float _3345 = fma(_3207, _3339, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3347 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3349 = _1208 + _3347;
    int _3351 = ~_1360;
    int _3353 = _3351 + 1;
    int _3355 = _3329 * int(_3315);
    int _3357 = _3355 + _1965;
    float _3359 = as_type<float>(_1587) * _3343;
    float _3361 = fma(_3227, _3349, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3363 = fma(_3265, _3325, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3365 = float(uint(_3335));
    float _3367 = float(uint(_2091));
    float _3369 = trunc(_3359);
    float _3371 = precise::max(_3369, 0.0);
    uint _3373 = uint(_3371);
    float _3375 = float(uint(_3357));
    float _3377 = as_type<float>(_1406) * _3365;
    bool _3379 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3381 = isnan(_1208);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = as_type<float>(_1388) * _3367;
    bool _3393 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3395 = isnan(_1208);
    bool _3397 = _3393 || _3395;
    bool _3399 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3401 = _3397 || _3399;
    float _3403 = float(_3401);
    float _3405 = as_type<float>(_1384) * _3375;
    bool _3407 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3409 = isnan(_1208);
    bool _3411 = _3407 || _3409;
    bool _3413 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3415 = _3411 || _3413;
    float _3417 = float(_3415);
    float _3419 = -_3389;
    float _3421 = _3419 + 1.0;
    bool _3423 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3425 = isnan(_1208);
    bool _3427 = _3423 || _3425;
    bool _3429 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3431 = _3427 || _3429;
    float _3433 = float(_3431);
    float _3435 = trunc(_3391);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = _2585 & 3;
    bool _3443 = _3441 != 0;
    float _3445 = -_3417;
    float _3447 = _3445 + 1.0;
    float _3449 = _3417 * _3421;
    bool _3451 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3453 = isnan(_1208);
    bool _3455 = _3451 || _3453;
    bool _3457 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3459 = _3455 || _3457;
    float _3461 = float(_3459);
    float _3463 = _3403 * _3447;
    float _3465 = -_3403;
    float _3467 = _3465 + 1.0;
    float _3469 = trunc(_3405);
    float _3471 = precise::max(_3469, 0.0);
    uint _3473 = uint(_3471);
    bool _3475 = _2795 != 3;
    float _3477 = _3433 * _3467;
    float _3479 = -_3433;
    float _3481 = _3479 + 1.0;
    bool _3483 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3485 = isnan(_1208);
    bool _3487 = _3483 || _3485;
    bool _3489 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3491 = _3487 || _3489;
    float _3493 = float(_3491);
    bool _3495 = !_3475;
    int _3497 = _3495 ? 0 : (-1);
    int _3499 = _3263 * int(_3439);
    int _3501 = _3499 + _2091;
    float _3503 = _3461 * _3481;
    float _3505 = -_3461;
    float _3507 = _3505 + 1.0;
    bool _3509 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3511 = isnan(_1208);
    bool _3513 = _3509 || _3511;
    bool _3515 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3517 = _3513 || _3515;
    float _3519 = float(_3517);
    float _3521 = -_3493;
    float _3523 = _3521 + 1.0;
    float _3525 = float(uint(_3501));
    float _3527 = _3493 * _3507;
    bool _3529 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3531 = isnan(_1208);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3537 = _3533 || _3535;
    float _3539 = float(_3537);
    float _3541 = _3519 * _3523;
    float _3543 = -_3519;
    float _3545 = _3543 + 1.0;
    float _3547 = as_type<float>(_1388) * _3525;
    float _3549 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3551 = _1208 + _3549;
    float _3553 = _2907 + _3235;
    float _3555 = trunc(_3377);
    float _3557 = precise::max(_3555, 0.0);
    uint _3559 = uint(_3557);
    int _3561 = _3353 * int(_3373);
    int _3563 = _3561 + _2281;
    float _3565 = _3539 * _3545;
    float _3567 = fma(_3319, _3551, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3569 = _2905 + _1669;
    float _3571 = -_3539;
    float _3573 = _3571 + 1.0;
    float _3575 = float(uint(_3563));
    float _3577 = _3305 * _3565;
    float _3579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3581 = ~_3331;
    int _3583 = _3581 + 1;
    int _3585 = _3583 + 1;
    float _3587 = fma(_3573, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3577);
    float _3589 = as_type<float>(_1587) * _3575;
    float _3591 = _2951 + _1705;
    int _3593 = _3585;
    if (!_3341)
    {
        int _3595 = ~_3331;
        int _3597 = _3595 + 1;
        _3593 = _3597;
    }
    int _3599 = _3593;
    float _3601 = fma(_3317, _3541, _3587);
    float _3603 = trunc(_3547);
    float _3605 = precise::max(_3603, 0.0);
    uint _3607 = uint(_3605);
    int _3609 = ~_1274;
    int _3611 = _3609 + 1;
    int _3613 = int(_3315) + int(_3473);
    float _3615 = fma(_3345, _3527, _3601);
    int _3617 = ~_1346;
    int _3619 = _3617 + 1;
    int _3621 = int(_3277) + int(_3559);
    float _3623 = trunc(_3589);
    float _3625 = precise::max(_3623, 0.0);
    uint _3627 = uint(_3625);
    int _3629 = _3611 * _3613;
    int _3631 = _3629 + _1965;
    float _3633 = _3579 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3635 = !_2983;
    int _3637 = _3635 ? 0 : 1;
    float _3639 = fma(_3321, _3503, _3615);
    int _3641 = ~_1326;
    int _3643 = _3641 + 1;
    int _3645 = _3619 * _3621;
    int _3647 = _3645 + _1989;
    int _3649 = int(_3439) + int(_3607);
    float _3651 = fma(_3633, _1322, -0.5);
    bool _3653 = uint(_3631) >= uint(_1274);
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3657 = _3569 + _3655;
    int _3659 = ~_1360;
    int _3661 = _3659 + 1;
    int _3663 = _3643 * _3649;
    int _3665 = _3663 + _2091;
    bool _3667 = !_3653;
    int _3669 = _3667 ? 0 : (-1);
    float _3671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3673 = _3553 + _3671;
    bool _3675 = uint(_3647) >= uint(_1346);
    float _3677 = _1547 * 2.0;
    int _3679 = int(_3373) + int(_3627);
    float _3681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3683 = _3591 + _3681;
    float _3685 = fma(_3361, _3477, _3639);
    bool _3687 = !_3675;
    int _3689 = _3687 ? 0 : (-1);
    float _3691 = floor(_3677);
    bool _3693 = uint(_3665) >= uint(_1326);
    float _3695 = _3657 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3697 = _3661 * _3679;
    int _3699 = _3697 + _2281;
    int _3701 = ~_3613;
    int _3703 = _3701 + _3669;
    int _3705 = _3703 + 1;
    float _3707 = fma(_3363, _3463, _3685);
    float _3709 = fma(_3673, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3695);
    bool _3711 = !_3693;
    int _3713 = _3711 ? 0 : (-1);
    float _3715 = _1220 + _1547;
    bool _3717 = uint(_3699) >= uint(_1360);
    float _3719 = fma(_3683, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3709);
    int _3721 = ~_3621;
    int _3723 = _3721 + _3689;
    int _3725 = _3723 + 1;
    float _3727 = _1220 + _1535;
    bool _3729 = !_3717;
    int _3731 = _3729 ? 0 : (-1);
    float _3733 = fma(_3567, _3449, _3707);
    bool _3735 = _3719 >= 0.0;
    int _3737 = _1274 * _3705;
    int _3739 = _3737 + _1965;
    float _3741 = _3727 + (-1.0);
    int _3743 = _1346 * _3725;
    int _3745 = _3743 + _1989;
    bool _3747 = !_3443;
    int _3749 = _3747 ? 0 : 1;
    float _3751 = fma(_3389, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3733);
    float _3753 = fma(_3741, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3755 = _3657 * _3657;
    int _3757 = _2701 & 3;
    bool _3759 = _3757 != 0;
    float _3761 = _3715 + (-1.0);
    int _3763 = _2529 >> 31;
    float _3765 = fma(_3673, _3673, _3755);
    bool _3767 = !_3759;
    int _3769 = _3767 ? 0 : 1;
    float _3771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3773 = _2781 & 3;
    bool _3775 = _3773 != 0;
    float _3777 = fma(_3683, _3683, _3765);
    bool _3779 = !_2541;
    int _3781 = _3779 ? 0 : 1;
    out.m_75.x = _3751;
    bool _3783 = !_3775;
    int _3785 = _3783 ? 0 : 1;
    float _3787 = _1220 + (-0.5);
    bool _3789 = _2539 != 3;
    float _3791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3735)
    {
        out.m_51.x = 0.0;
    }
    bool _3793 = _3691 > 0.0;
    bool _3795 = _3691 >= 0.0;
    bool _3797 = isnan(_3691);
    bool _3799 = _3795 || _3797;
    bool _3801 = isnan(0.0);
    bool _3803 = _3799 || _3801;
    float _3805 = fma(_3761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3807 = _3691;
    if (_3735)
    {
        _3807 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3809 = _3807;
    float _3811 = rsqrt(_3777);
    int _3813 = _3763 & 3;
    int _3815 = _2585 >> 31;
    int _3817 = as_type<int>(_3809);
    if (_3735)
    {
        float _3819 = _3809 * 5.0;
        _3817 = as_type<int>(_3819);
    }
    int _3821 = _3817;
    int _3823 = _2529 + _3813;
    int _3825 = _2701 >> 31;
    int _3827 = _3823 >> 2;
    if (_3735)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12480 = as_type<float>(_3821);
        out.gl_Position.z = _12480;
    }
    int _3829 = _3815 & 3;
    int _3831 = _3825 & 3;
    int _3833 = _3827 << 4;
    int _3835 = _3833 + 368;
    float _3837 = _3657 * _3811;
    int _3839 = _2701 + _3831;
    float _3841 = _3673 * _3811;
    int _3843 = _2585 + _3829;
    float _3845 = -_3837;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3657);
    float _3849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3851 = _2781 >> 31;
    float _3853 = -_3841;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3673);
    float _3857 = _3847 * _3847;
    int _3859 = _3839 >> 2;
    float _3861 = _3683 * _3811;
    int _3863 = _3851 & 3;
    float _3865 = fma(_3855, _3855, _3857);
    uint _3867 = uint(int(uint(_3835) >> uint(2)));
    uint _3869 = uint(int(uint(int(_3867)) >> uint(2)));
    int _3871 = int(_3867) & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = int(_3867) + 1;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    int _3879 = _3875 & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = _3859 << 4;
    int _3885 = _3883 + 656;
    float _3887 = -_3861;
    float _3889 = fma(_3887, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3683);
    int _3891 = _2781 + _3863;
    bool _3893 = !_3789;
    int _3895 = _3893 ? 0 : (-1);
    int _3897 = _3891 >> 2;
    float _3899 = _3849 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3901 = uint(int(uint(_3885) >> uint(2)));
    uint _3903 = uint(int(uint(int(_3901)) >> uint(2)));
    int _3905 = int(_3901) & 3;
    float _3907 = (*spvDescriptorSet0.vp_c9)._m0[int(_3903)][_3905];
    int _3909 = int(_3901) + 1;
    uint _3911 = uint(int(uint(_3909) >> uint(2)));
    int _3913 = _3909 & 3;
    float _3915 = (*spvDescriptorSet0.vp_c9)._m0[int(_3911)][_3913];
    int _3917 = _3843 >> 2;
    bool _3919 = _2607 != 3;
    float _3921 = fma(_3899, _2995, -0.5);
    int _3923 = _3917 << 4;
    int _3925 = _3923 + 512;
    float _3927 = fma(_3889, _3889, _3865);
    bool _3929 = !_3919;
    int _3931 = _3929 ? 0 : (-1);
    float _3933 = -_3175;
    float _3935 = fma(_3165, _3921, _3933);
    bool _3937 = _2717 != 3;
    uint _3939 = uint(int(uint(_3925) >> uint(2)));
    uint _3941 = uint(int(uint(int(_3939)) >> uint(2)));
    int _3943 = int(_3939) & 3;
    float _3945 = (*spvDescriptorSet0.vp_c9)._m0[int(_3941)][_3943];
    int _3947 = int(_3939) + 1;
    uint _3949 = uint(int(uint(_3947) >> uint(2)));
    int _3951 = _3947 & 3;
    float _3953 = (*spvDescriptorSet0.vp_c9)._m0[int(_3949)][_3951];
    int _3955 = _3897 << 4;
    int _3957 = _3955 + 800;
    float _3959 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3961 = ~_3679;
    int _3963 = _3961 + _3731;
    int _3965 = _3963 + 1;
    float _3967 = _1727 * _3771;
    int _3969 = ~_3649;
    int _3971 = _3969 + _3713;
    int _3973 = _3971 + 1;
    float _3975 = _3959 * _3791;
    int _3977 = abs(_2605);
    float _3979 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3981 = int(_3979);
    bool _3983 = !_2517;
    int _3985 = _3983 ? _3739 : (-1);
    int _3987 = _3885 + 8;
    uint _3989 = uint(int(uint(_3987) >> uint(2)));
    uint _3991 = uint(int(uint(int(_3989)) >> uint(2)));
    int _3993 = int(_3989) & 3;
    float _3995 = (*spvDescriptorSet0.vp_c9)._m0[int(_3991)][_3993];
    int _3997 = int(_3989) + 1;
    uint _3999 = uint(int(uint(_3997) >> uint(2)));
    int _4001 = _3997 & 3;
    float _4003 = (*spvDescriptorSet0.vp_c9)._m0[int(_3999)][_4001];
    bool _4005 = !_2577;
    int _4007 = _4005 ? _3745 : (-1);
    out.m_77.x = _3967;
    out.m_77.y = _3975;
    int _4009 = _3803 ? 0 : 1;
    int _4011 = _1326 * _3973;
    int _4013 = _4011 + _2091;
    int _4015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4017 = _4015 != 0;
    int _4019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4021 = _4019 != 0;
    int _4023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4025 = _4023 != 0;
    int _4027 = _1360 * _3965;
    int _4029 = _4027 + _2281;
    int _4031 = ~_4009;
    int _4033 = _4031 + 1;
    int _4035 = _4033 + 1;
    uint _4037 = uint(int(uint(_3957) >> uint(2)));
    uint _4039 = uint(int(uint(int(_4037)) >> uint(2)));
    int _4041 = int(_4037) & 3;
    float _4043 = (*spvDescriptorSet0.vp_c9)._m0[int(_4039)][_4041];
    int _4045 = int(_4037) + 1;
    uint _4047 = uint(int(uint(_4045) >> uint(2)));
    int _4049 = _4045 & 3;
    float _4051 = (*spvDescriptorSet0.vp_c9)._m0[int(_4047)][_4049];
    int _4053 = _4035;
    if (!_3793)
    {
        int _4055 = ~_4009;
        int _4057 = _4055 + 1;
        _4053 = _4057;
    }
    int _4059 = _4053;
    float _4061 = fma(_3163, _3651, _3173);
    int _4063 = abs(_2697);
    float _4065 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4067 = int(_4065);
    int _4069 = ~_3977;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = abs(_2789);
    int _4077 = _3835 + 8;
    uint _4079 = uint(int(uint(_4077) >> uint(2)));
    uint _4081 = uint(int(uint(int(_4079)) >> uint(2)));
    int _4083 = int(_4079) & 3;
    float _4085 = (*spvDescriptorSet0.vp_c9)._m0[int(_4081)][_4083];
    int _4087 = int(_4079) + 1;
    uint _4089 = uint(int(uint(_4087) >> uint(2)));
    int _4091 = _4087 & 3;
    float _4093 = (*spvDescriptorSet0.vp_c9)._m0[int(_4089)][_4091];
    int _4095 = abs(_3769);
    int _4097 = _4073 * as_type<int>(_3881);
    int _4099 = abs(_3781);
    int _4101 = abs(_2847);
    int _4103 = _3925 + 8;
    uint _4105 = uint(int(uint(_4103) >> uint(2)));
    uint _4107 = uint(int(uint(int(_4105)) >> uint(2)));
    int _4109 = int(_4105) & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    int _4113 = int(_4105) + 1;
    uint _4115 = uint(int(uint(_4113) >> uint(2)));
    int _4117 = _4113 & 3;
    float _4119 = (*spvDescriptorSet0.vp_c9)._m0[int(_4115)][_4117];
    int _4121 = ~_4099;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = ~_4075;
    int _4129 = _4127 + 1;
    int _4131 = _4129 + 1;
    int _4133 = ~_4095;
    int _4135 = _4133 + 1;
    int _4137 = _4135 + 1;
    int _4139 = _3957 + 8;
    uint _4141 = uint(int(uint(_4139) >> uint(2)));
    uint _4143 = uint(int(uint(int(_4141)) >> uint(2)));
    int _4145 = int(_4141) & 3;
    float _4147 = (*spvDescriptorSet0.vp_c9)._m0[int(_4143)][_4145];
    int _4149 = int(_4141) + 1;
    uint _4151 = uint(int(uint(_4149) >> uint(2)));
    int _4153 = _4149 & 3;
    float _4155 = (*spvDescriptorSet0.vp_c9)._m0[int(_4151)][_4153];
    int _4157 = abs(_3749);
    int _4159 = _4131 * as_type<int>(_3915);
    int _4161 = abs(_2773);
    int _4163 = _4125 * as_type<int>(_3873);
    int _4165 = _4163 + _4097;
    int _4167 = abs(_2627);
    int _4169 = _4137 * as_type<int>(_3907);
    int _4171 = _4169 + _4159;
    int _4173 = abs(_3785);
    int _4175 = ~_4063;
    int _4177 = _4175 + 1;
    int _4179 = _4177 + 1;
    int _4181 = abs(_2683);
    int _4183 = _4179 * as_type<int>(_3953);
    int _4185 = ~_4161;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    float _4191 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4193 = int(_4191);
    int _4195 = ~_4101;
    int _4197 = _4195 + 1;
    int _4199 = _4197 + 1;
    int _4201 = ~_4173;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = _4189 * as_type<int>(_3995);
    int _4209 = _4207 + _4171;
    int _4211 = ~_4157;
    int _4213 = _4211 + 1;
    int _4215 = _4213 + 1;
    int _4217 = _4199 * as_type<int>(_4051);
    int _4219 = ~_4167;
    int _4221 = _4219 + 1;
    int _4223 = _4221 + 1;
    int _4225 = _4215 * as_type<int>(_3945);
    int _4227 = _4225 + _4183;
    int _4229 = abs(_3895);
    int _4231 = _4205 * as_type<int>(_4043);
    int _4233 = _4231 + _4217;
    int _4235 = ~_4181;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4243 = int(_4241);
    int _4245 = abs(_2837);
    int _4247 = _4223 * as_type<int>(_4085);
    int _4249 = _4247 + _4165;
    bool _4251 = !_3937;
    int _4253 = _4251 ? 0 : (-1);
    int _4255 = ~_4229;
    int _4257 = _4255 + 1;
    int _4259 = _4257 + 1;
    int _4261 = ~_4245;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    int _4267 = abs(_3931);
    int _4269 = _4239 * as_type<int>(_4111);
    int _4271 = _4269 + _4227;
    int _4273 = abs(_4253);
    int _4275 = _4259 * as_type<int>(_4093);
    int _4277 = _4275 + _4249;
    float _4279 = float(uint(_4067));
    int _4281 = ~_4267;
    int _4283 = _4281 + 1;
    int _4285 = _4283 + 1;
    int _4287 = abs(_3497);
    int _4289 = _4265 * as_type<int>(_4147);
    int _4291 = _4289 + _4233;
    float _4293 = float(uint(_3981));
    float _4295 = 1.0 / _4279;
    int _4297 = ~_4273;
    int _4299 = _4297 + 1;
    int _4301 = _4299 + 1;
    int _4303 = _4285 * as_type<int>(_4119);
    int _4305 = _4303 + _4271;
    int _4307 = abs(_2707);
    int _4309 = ~_4287;
    int _4311 = _4309 + 1;
    int _4313 = _4311 + 1;
    int _4315 = _4301 * as_type<int>(_4003);
    int _4317 = _4315 + _4209;
    int _4319 = abs(_4067);
    float _4321 = 1.0 / _4293;
    int _4323 = abs(_2723);
    int _4325 = _4313 * as_type<int>(_4155);
    int _4327 = _4325 + _4291;
    int _4329 = ~_4307;
    int _4331 = _4329 + 1;
    int _4333 = _4331 + 1;
    float _4335 = float(uint(_4193));
    float _4337 = float(uint(_4319));
    int _4339 = _4277 * _4333;
    int _4341 = abs(_4193);
    int _4343 = ~_4323;
    int _4345 = _4343 + 1;
    int _4347 = _4345 + 1;
    float _4349 = 1.0 / _4337;
    int _4351 = _3985 * _4307;
    int _4353 = _4351 + _4339;
    int _4355 = abs(_2801);
    int _4357 = _4347 * _4305;
    float _4359 = float(uint(_4243));
    int _4361 = abs(_3981);
    float _4363 = 1.0 / _4335;
    int _4365 = abs(_4243);
    int _4367 = _4007 * _4323;
    int _4369 = _4367 + _4357;
    int _4371 = ~_4355;
    int _4373 = _4371 + 1;
    int _4375 = _4373 + 1;
    bool _4377 = _1326 == 0;
    int _4379 = _4375 * _4317;
    int _4381 = as_type<int>(_4295) + (-2);
    float _4383 = 1.0 / _4359;
    float _4385 = float(uint(_4353));
    float _4387 = float(uint(_4341));
    float _4389 = float(uint(_4361));
    float _4391 = as_type<float>(_4381) * _4385;
    int _4393 = abs(_3637);
    float _4395 = 1.0 / _4387;
    bool _4397 = !_4377;
    int _4399 = _4397 ? _4013 : (-1);
    int _4401 = as_type<int>(_4321) + (-2);
    float _4403 = float(uint(_4369));
    bool _4405 = _1360 == 0;
    float _4407 = 1.0 / _4389;
    int _4409 = ~_4393;
    int _4411 = _4409 + 1;
    int _4413 = _4411 + 1;
    float _4415 = as_type<float>(_4401) * _4403;
    bool _4417 = !_4405;
    int _4419 = _4417 ? _4029 : (-1);
    int _4421 = as_type<int>(_4363) + (-2);
    int _4423 = _4413 * _4327;
    float _4425 = float(uint(_4365));
    float _4427 = trunc(_4391);
    float _4429 = precise::max(_4427, 0.0);
    uint _4431 = uint(_4429);
    int _4433 = _4399 * _4355;
    int _4435 = _4433 + _4379;
    int _4437 = abs(_4353);
    int _4439 = _4419 * _4393;
    int _4441 = _4439 + _4423;
    int _4443 = abs(_4369);
    float _4445 = _4061 + 0.5;
    float _4447 = float(uint(_4435));
    float _4449 = trunc(_4415);
    float _4451 = precise::max(_4449, 0.0);
    uint _4453 = uint(_4451);
    int _4455 = as_type<int>(_4383) + (-2);
    float _4457 = as_type<float>(_4421) * _4447;
    float _4459 = float(uint(_4441));
    int _4461 = as_type<int>(_4349) + (-2);
    float _4463 = 1.0 / _4425;
    float _4465 = float(uint(_4437));
    float _4467 = as_type<float>(_4455) * _4459;
    int _4469 = ~_4067;
    int _4471 = _4469 + 1;
    float _4473 = _3935 + 0.5;
    int _4475 = as_type<int>(_4407) + (-2);
    float _4477 = as_type<float>(_4461) * _4465;
    int _4479 = ~_3981;
    int _4481 = _4479 + 1;
    float _4483 = trunc(_4457);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    int _4489 = _4471 * int(_4431);
    int _4491 = _4489 + _4353;
    out.m_79.x = _4445;
    out.m_79.y = _4473;
    int _4493 = abs(_4435);
    int _4495 = as_type<int>(_4395) + (-2);
    float _4497 = float(uint(_4491));
    float _4499 = trunc(_4467);
    float _4501 = precise::max(_4499, 0.0);
    uint _4503 = uint(_4501);
    float _4505 = float(uint(_4443));
    int _4507 = as_type<int>(_4463) + (-2);
    bool _4509 = !_4021;
    int _4511 = _4509 ? 0 : 1;
    float _4513 = as_type<float>(_4475) * _4505;
    int _4515 = _4481 * int(_4453);
    int _4517 = _4515 + _4369;
    bool _4519 = !_4017;
    int _4521 = _4519 ? 0 : 1;
    float _4523 = trunc(_4477);
    float _4525 = precise::max(_4523, 0.0);
    uint _4527 = uint(_4525);
    int _4529 = abs(_4441);
    float _4531 = as_type<float>(_4381) * _4497;
    float _4533 = float(uint(_4517));
    float _4535 = float(uint(_4529));
    float _4537 = in.m_81.x;
    float _4539 = in.m_81.y;
    float _4541 = in.m_81.z;
    float _4543 = float(uint(_4493));
    float _4545 = as_type<float>(_4401) * _4533;
    float _4547 = trunc(_4513);
    float _4549 = precise::max(_4547, 0.0);
    uint _4551 = uint(_4549);
    float _4553 = as_type<float>(_4507) * _4535;
    int _4555 = abs(_4511);
    float _4557 = as_type<float>(_4495) * _4543;
    int _4559 = abs(_4521);
    int _4561 = ~_4243;
    int _4563 = _4561 + 1;
    float _4565 = trunc(_4557);
    float _4567 = precise::max(_4565, 0.0);
    uint _4569 = uint(_4567);
    float _4571 = float(_3285);
    float _4573 = float(_4555);
    int _4575 = _4563 * int(_4503);
    int _4577 = _4575 + _4441;
    int _4579 = ~_4193;
    int _4581 = _4579 + 1;
    int _4583 = ~_4319;
    int _4585 = _4583 + 1;
    float _4587 = _4573 * _4571;
    float _4589 = float(_4059);
    int _4591 = _4581 * int(_4487);
    int _4593 = _4591 + _4435;
    float _4595 = float(_4559);
    float _4597 = trunc(_4553);
    float _4599 = precise::max(_4597, 0.0);
    uint _4601 = uint(_4599);
    float _4603 = float(uint(_4577));
    float _4605 = _4595 * _4589;
    float _4607 = float(uint(_4593));
    int _4609 = _4585 * int(_4527);
    int _4611 = _4609 + _4437;
    int _4613 = ~_4361;
    int _4615 = _4613 + 1;
    float _4617 = _4605 * (-2.0);
    float _4619 = as_type<float>(_4455) * _4603;
    float _4621 = as_type<float>(_4421) * _4607;
    float _4623 = float(uint(_4611));
    int _4625 = _4615 * int(_4551);
    int _4627 = _4625 + _4443;
    int _4629 = ~_4341;
    int _4631 = _4629 + 1;
    float _4633 = trunc(_4531);
    float _4635 = precise::max(_4633, 0.0);
    uint _4637 = uint(_4635);
    float _4639 = fma(_3753, _4617, _3753);
    float _4641 = fma(_4617, _4537, _4537);
    float _4643 = as_type<float>(_4461) * _4623;
    float _4645 = _1535 + (-0.5);
    float _4647 = float(uint(_4627));
    int _4649 = _4631 * int(_4569);
    int _4651 = _4649 + _4493;
    int _4653 = ~_3981;
    int _4655 = _4653 + 1;
    float _4657 = trunc(_4619);
    float _4659 = precise::max(_4657, 0.0);
    uint _4661 = uint(_4659);
    int _4663 = ~_4365;
    int _4665 = _4663 + 1;
    float _4667 = fma(_4645, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4641);
    float _4669 = as_type<float>(_4475) * _4647;
    float _4671 = float(uint(_4651));
    float _4673 = fma(_4639, _3191, _4667);
    float _4675 = trunc(_4621);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    float _4681 = as_type<float>(_4495) * _4671;
    int _4683 = int(_4431) + int(_4637);
    int _4685 = _4665 * int(_4601);
    int _4687 = _4685 + _4529;
    int _4689 = ~_4067;
    int _4691 = _4689 + 1;
    int _4693 = ~_4243;
    int _4695 = _4693 + 1;
    float _4697 = trunc(_4545);
    float _4699 = precise::max(_4697, 0.0);
    uint _4701 = uint(_4699);
    int _4703 = int(_4503) + int(_4661);
    int _4705 = _4691 * _4683;
    int _4707 = _4705 + _4353;
    float _4709 = float(uint(_4687));
    bool _4711 = _4243 == 0;
    bool _4713 = uint(_4707) >= uint(_4067);
    float _4715 = trunc(_4669);
    float _4717 = precise::max(_4715, 0.0);
    uint _4719 = uint(_4717);
    int _4721 = int(_4487) + int(_4679);
    float _4723 = as_type<float>(_4507) * _4709;
    bool _4725 = !_4025;
    int _4727 = _4725 ? 0 : 1;
    float _4729 = trunc(_4643);
    float _4731 = precise::max(_4729, 0.0);
    uint _4733 = uint(_4731);
    int _4735 = ~_4193;
    int _4737 = _4735 + 1;
    int _4739 = int(_4453) + int(_4701);
    int _4741 = _4737 * _4721;
    int _4743 = _4741 + _4435;
    float _4745 = trunc(_4681);
    float _4747 = precise::max(_4745, 0.0);
    uint _4749 = uint(_4747);
    int _4751 = int(_4551) + int(_4719);
    int _4753 = _4655 * _4739;
    int _4755 = _4753 + _4369;
    int _4757 = ~_4319;
    int _4759 = _4757 + 1;
    int _4761 = _4695 * _4703;
    int _4763 = _4761 + _4441;
    bool _4765 = uint(_4743) >= uint(_4193);
    int _4767 = ~_4361;
    int _4769 = _4767 + 1;
    float _4771 = trunc(_4723);
    float _4773 = precise::max(_4771, 0.0);
    uint _4775 = uint(_4773);
    int _4777 = int(_4527) + int(_4733);
    int _4779 = ~_4341;
    int _4781 = _4779 + 1;
    int _4783 = _4769 * _4751;
    int _4785 = _4783 + _4443;
    bool _4787 = uint(_4755) >= uint(_3981);
    int _4789 = _4759 * _4777;
    int _4791 = _4789 + _4437;
    bool _4793 = uint(_4763) >= uint(_4243);
    float _4795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4797 = int(_4569) + int(_4749);
    int _4799 = ~_4365;
    int _4801 = _4799 + 1;
    int _4803 = _4781 * _4797;
    int _4805 = _4803 + _4493;
    bool _4807 = !_4713;
    int _4809 = _4807 ? 0 : (-1);
    bool _4811 = uint(_4791) >= uint(_4319);
    bool _4813 = !_4787;
    int _4815 = _4813 ? 0 : (-1);
    bool _4817 = uint(_4785) >= uint(_4361);
    bool _4819 = !_4765;
    int _4821 = _4819 ? 0 : (-1);
    float _4823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4825 = uint(_4805) >= uint(_4341);
    bool _4827 = !_4793;
    int _4829 = _4827 ? 0 : (-1);
    int _4831 = ~_4683;
    int _4833 = _4831 + _4809;
    int _4835 = _4833 + 1;
    int _4837 = int(_4601) + int(_4775);
    int _4839 = ~_4739;
    int _4841 = _4839 + _4815;
    int _4843 = _4841 + 1;
    int _4845 = _4067 * _4835;
    int _4847 = _4845 + _4353;
    int _4849 = ~_4703;
    int _4851 = _4849 + _4829;
    int _4853 = _4851 + 1;
    float _4855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4857 = ~_4721;
    int _4859 = _4857 + _4821;
    int _4861 = _4859 + 1;
    int _4863 = _4801 * _4837;
    int _4865 = _4863 + _4529;
    bool _4867 = !_4811;
    int _4869 = _4867 ? 0 : (-1);
    int _4871 = _3981 * _4843;
    int _4873 = _4871 + _4369;
    bool _4875 = _4067 == 0;
    int _4877 = _4193 * _4861;
    int _4879 = _4877 + _4435;
    int _4881 = _4353 ^ _4067;
    float _4883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4885 = !_4825;
    int _4887 = _4885 ? 0 : (-1);
    int _4889 = _4243 * _4853;
    int _4891 = _4889 + _4441;
    bool _4893 = _3981 == 0;
    bool _4895 = !_4875;
    int _4897 = _4895 ? _4847 : (-1);
    bool _4899 = _4193 == 0;
    float _4901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4903 = uint(int(uint(_4881) >> uint(31)));
    bool _4905 = uint(_4865) >= uint(_4365);
    bool _4907 = !_4893;
    int _4909 = _4907 ? _4873 : (-1);
    float _4911 = _4795 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4913 = !_4899;
    int _4915 = _4913 ? _4879 : (-1);
    int _4917 = ~_4869;
    int _4919 = _4777 + _4917;
    int _4921 = _4919 + 1;
    float _4923 = fma(_4911, _1733, -0.5);
    float _4925 = float(_4897);
    float _4927 = _4883 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4929 = ~int(_4903);
    int _4931 = _4929 + 1;
    bool _4933 = !_4711;
    int _4935 = _4933 ? _4891 : (-1);
    float _4937 = fma(_4911, _4925, _3161);
    int _4939 = _4369 ^ _3981;
    float _4941 = _4855 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4943 = _4193 == 0;
    float _4945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4947 = _4435 ^ _4193;
    float _4949 = _4823 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4951 = _4441 ^ _4243;
    float _4953 = fma(_4941, _2501, -0.5);
    float _4955 = float(_4909);
    float _4957 = fma(_4949, _1827, -0.5);
    int _4959 = _4921 ^ _4931;
    float _4961 = fma(_4927, _1663, -0.5);
    float _4963 = float(_4935);
    float _4965 = fma(_4949, _4955, _3179);
    bool _4967 = !_4817;
    int _4969 = _4967 ? 0 : (-1);
    float _4971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4973 = !_4905;
    int _4975 = _4973 ? 0 : (-1);
    float _4977 = fma(_4941, _4963, _3145);
    uint _4979 = uint(int(uint(_4939) >> uint(31)));
    float _4981 = fma(_3167, _4957, _4965);
    uint _4983 = uint(int(uint(_4947) >> uint(31)));
    float _4985 = fma(_3139, _4923, _4937);
    uint _4987 = uint(int(uint(_4951) >> uint(31)));
    float _4989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4991 = _4067 == 0;
    float _4993 = fma(_3155, _4953, _4977);
    int _4995 = ~_4931;
    int _4997 = _4995 + _4959;
    int _4999 = _4997 + 1;
    bool _5001 = _4243 == 0;
    int _5003 = ~_4969;
    int _5005 = _4751 + _5003;
    int _5007 = _5005 + 1;
    int _5009 = ~_4887;
    int _5011 = _4797 + _5009;
    int _5013 = _5011 + 1;
    int _5015 = ~_4975;
    int _5017 = _4837 + _5015;
    int _5019 = _5017 + 1;
    int _5021 = ~int(_4979);
    int _5023 = _5021 + 1;
    int _5025 = ~int(_4983);
    int _5027 = _5025 + 1;
    float _5029 = _4989 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5031 = ~int(_4987);
    int _5033 = _5031 + 1;
    float _5035 = float(_4915);
    float _5037 = fma(_5029, _2879, -0.5);
    bool _5039 = !_4991;
    int _5041 = _5039 ? _4999 : (-1);
    int _5043 = _5007 ^ _5023;
    float _5045 = fma(_4927, _5035, _3185);
    int _5047 = _5013 ^ _5027;
    float _5049 = _4901 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5051 = _5019 ^ _5033;
    float _5053 = _4945 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5055 = float(_5041);
    float _5057 = fma(_5049, _2783, -0.5);
    bool _5059 = _3981 == 0;
    float _5061 = _4971 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5063 = ~_5023;
    int _5065 = _5063 + _5043;
    int _5067 = _5065 + 1;
    float _5069 = -_3149;
    float _5071 = fma(_5049, _5055, _5069);
    int _5073 = ~_5027;
    int _5075 = _5073 + _5047;
    int _5077 = _5075 + 1;
    float _5079 = fma(_5053, _2867, -0.5);
    int _5081 = ~_5033;
    int _5083 = _5081 + _5051;
    int _5085 = _5083 + 1;
    float _5087 = fma(_3153, _4961, _5045);
    bool _5089 = !_5059;
    int _5091 = _5089 ? _5067 : (-1);
    float _5093 = fma(_3115, _5057, _5071);
    bool _5095 = !_4943;
    int _5097 = _5095 ? _5077 : (-1);
    float _5099 = _5087 + 0.5;
    bool _5101 = !_5001;
    int _5103 = _5101 ? _5085 : (-1);
    float _5105 = float(_5091);
    float _5107 = float(_5097);
    float _5109 = fma(_5061, _2881, -0.5);
    float _5111 = float(_5103);
    float _5113 = -_3181;
    float _5115 = fma(_5053, _5105, _5113);
    float _5117 = _4587 * (-2.0);
    float _5119 = -_3187;
    float _5121 = fma(_5061, _5107, _5119);
    float _5123 = _4993 + 0.5;
    float _5125 = -_3147;
    float _5127 = fma(_5029, _5111, _5125);
    float _5129 = fma(_3169, _5079, _5115);
    float _5131 = fma(_3151, _5109, _5121);
    float _5133 = _4985 + 0.5;
    float _5135 = fma(_3157, _5037, _5127);
    float _5137 = _4981 + 0.5;
    float _5139 = _5093 + 0.5;
    float _5141 = _5129 + 0.5;
    float _5143 = _5131 + 0.5;
    float _5145 = _5135 + 0.5;
    float _5147 = fma(_3805, _5117, _3805);
    float _5149 = fma(_5117, _4539, _4539);
    out.m_83.x = _5133;
    out.m_83.y = _5139;
    out.m_83.z = _5137;
    out.m_83.w = _5141;
    out.m_85.x = _5099;
    out.m_85.y = _5143;
    out.m_87.x = _5123;
    out.m_87.y = _5145;
    int _5151 = as_type<int>(_5137);
    if (_3735)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5153 = -_3837;
    float _5155 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3569);
    float _5157 = -_3841;
    float _5159 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3553);
    float _5161 = -_3861;
    float _5163 = fma(_5161, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3591);
    int _5165 = abs(_4727);
    float _5167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5169 = _5155 + _5167;
    float _5171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5173 = _5159 + _5171;
    float _5175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5177 = _5163 + _5175;
    float _5179 = float(_3599);
    float _5181 = _5169 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5183 = float(_5165);
    float _5185 = _1535 + _1547;
    float _5187 = fma(_3787, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5149);
    float _5189 = fma(_5173, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5181);
    float _5191 = _1547 + (-0.5);
    float _5193 = _5183 * _5179;
    float _5195 = _5185 + (-1.0);
    float _5197 = fma(_5177, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5189);
    float _5199 = fma(_5147, _3191, _5187);
    float _5201 = _5193 * (-2.0);
    float _5203 = _4673 * 0.15915493667125701904296875;
    float _5205 = sqrt(_3927);
    bool _5207 = _5197 >= 0.0;
    float _5209 = fma(_5201, _4541, _4541);
    float _5211 = _5199 * 0.15915493667125701904296875;
    float _5213 = fma(_5191, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5209);
    float _5215 = fma(_5195, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5217 = _5203 * 6.283185482025146484375;
    float _5219 = sin(_5217);
    float _5221 = fma(_5215, _5201, _5215);
    float _5223 = _5193;
    float _5225 = _5159;
    float _5227 = _5177;
    if (_5207)
    {
        _5223 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5229 = _5223;
    if (_5207)
    {
        out.m_51.x = 0.0;
    }
    float _5231 = fma(_5221, _3191, _5213);
    float _5233 = _5211 * 6.283185482025146484375;
    float _5235 = sin(_5233);
    if (_5207)
    {
        float _5237 = _5229 * 5.0;
        _5151 = as_type<int>(_5237);
    }
    int _5239 = _5151;
    float _5241 = _5231 * 0.15915493667125701904296875;
    if (_5207)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14475 = as_type<float>(_5239);
        out.gl_Position.z = _14475;
    }
    float _5243 = _5203 * 6.283185482025146484375;
    float _5245 = cos(_5243);
    float _5247 = _5211 * 6.283185482025146484375;
    float _5249 = cos(_5247);
    float _5251 = _5219 * _5235;
    float _5253 = _5241 * 6.283185482025146484375;
    float _5255 = sin(_5253);
    if (_5207)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5257 = -_3569;
    float _5259 = _5257 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5261 = -_3553;
    float _5263 = _5261 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5265 = in.m_89.x;
    float _5267 = in.m_89.y;
    float _5269 = in.m_89.z;
    float _5271 = -_3591;
    float _5273 = _5271 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5275 = _5259 * _5259;
    float _5277 = _5241 * 6.283185482025146484375;
    float _5279 = cos(_5277);
    float _5281 = _5245 * _5249;
    float _5283 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5285 = fma(_5263, _5263, _5275);
    float _5287 = fma(_5255, _5281, _5251);
    float _5289 = fma(_5255, _5251, _5281);
    float _5291 = fma(_5273, _5273, _5285);
    float _5293 = _3811 * _5205;
    float _5295 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5297 = _5245 * _5235;
    float _5299 = rsqrt(_5291);
    float _5301 = _5219 * _5249;
    float _5303 = _5245 * _5279;
    float _5305 = _5249 * _5279;
    float _5307 = _5219 * _5279;
    float _5309 = _5235 * _5279;
    float _5311 = _5293 * _5295;
    float _5313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5265);
    float _5315 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5317 = _5293 * _5283;
    float _5319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5267);
    float _5321 = _5313 * _5311;
    float _5323 = -_5297;
    float _5325 = fma(_5255, _5301, _5323);
    float _5327 = _5263 * _5299;
    float _5329 = -_5301;
    float _5331 = fma(_5255, _5297, _5329);
    float _5333 = _5293 * _5315;
    float _5335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5269);
    float _5337 = _5273 * _5299;
    float _5339 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5341 = _5327 * _5339;
    float _5343 = _5319 * _5317;
    float _5345 = _5335 * _5333;
    float _5347 = in.m_91.x;
    float _5349 = in.m_91.y;
    float _5351 = in.m_91.z;
    float _5353 = _5259 * _5299;
    float _5355 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5357 = _5337 * _5355;
    float _5359 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5361 = -_5341;
    float _5363 = fma(_5337, _5359, _5361);
    bool _5365 = _5267 != 0.0;
    bool _5367 = isnan(_5267);
    bool _5369 = _5365 || _5367;
    bool _5371 = isnan(0.0);
    bool _5373 = _5369 || _5371;
    float _5375 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5377 = _5353 * _5375;
    float _5379 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5381 = -_5357;
    float _5383 = fma(_5353, _5379, _5381);
    float _5385 = _5363 * _5363;
    bool _5387 = _5265 == 0.0;
    bool _5389 = !_5373;
    bool _5391 = _5387 && _5389;
    float _5393 = in.m_93.x;
    float _5395 = in.m_93.y;
    float _5397 = in.m_93.z;
    float _5399 = in.m_93.w;
    float _5401 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5403 = -_5377;
    float _5405 = fma(_5327, _5401, _5403);
    float _5407 = fma(_5383, _5383, _5385);
    bool _5409 = _5269 == 0.0;
    bool _5411 = _5409 && _5391;
    float _5413 = -_5343;
    float _5415 = _5255 * _5413;
    float _5417 = _5303 * _5343;
    float _5419 = fma(_5405, _5405, _5407);
    float _5421 = _5307 * _5343;
    float _5423 = fma(_5305, _5321, _5415);
    float _5425 = fma(_5287, _5321, _5417);
    float _5427 = fma(_5325, _5321, _5421);
    float _5429 = rsqrt(_5419);
    float _5431 = fma(_5309, _5345, _5423);
    float _5433 = fma(_5331, _5345, _5425);
    float _5435 = fma(_5289, _5345, _5427);
    float _5437 = _5321;
    float _5439 = _5415;
    float _5441 = _5417;
    float _5443 = _5263;
    float _5445 = _5347;
    float _5447 = _5289;
    if (_5411)
    {
        _5437 = _5347;
    }
    float _5449 = _5437;
    float _5451 = _5449;
    if (_5411)
    {
        _5439 = _5351;
    }
    float _5453 = _5439;
    float _5455 = _5453;
    if (_5411)
    {
        _5441 = _5449;
    }
    float _5457 = _5441;
    float _5459 = _5457;
    if (!_5411)
    {
        _5451 = _5347;
    }
    float _5461 = _5451;
    if (_5411)
    {
        _5443 = _5349;
    }
    float _5463 = _5443;
    float _5465 = _5463;
    if (!_5411)
    {
        float _5467 = fma(_5267, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5349);
        _5465 = _5467;
    }
    float _5469 = _5465;
    if (_5411)
    {
        _5445 = _5453;
    }
    float _5471 = _5445;
    float _5473 = _5397 * _5461;
    float _5475 = _5471;
    if (!_5411)
    {
        _5455 = _5351;
    }
    float _5477 = _5455;
    float _5479 = _5383 * _5429;
    float _5481 = _5363 * _5429;
    if (!_5411)
    {
        float _5483 = fma(_5265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5461);
        _5459 = _5483;
    }
    float _5485 = _5459;
    float _5487 = _5393 * _5349;
    float _5489 = -_5473;
    float _5491 = fma(_5393, _5477, _5489);
    float _5493 = _5395 * _5477;
    float _5495 = _5405 * _5429;
    float _5497 = _5337 * _5481;
    float _5499 = _5353 * _5479;
    if (!_5411)
    {
        float _5501 = fma(_5269, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5477);
        _5475 = _5501;
    }
    float _5503 = _5475;
    float _5505 = -_5493;
    float _5507 = fma(_5397, _5349, _5505);
    float _5509 = -_5487;
    float _5511 = fma(_5395, _5461, _5509);
    float _5513 = -_5497;
    float _5515 = fma(_5353, _5495, _5513);
    float _5517 = -_5499;
    float _5519 = fma(_5327, _5481, _5517);
    float _5521 = _5491 * _5399;
    float _5523 = _5507 * _5399;
    float _5525 = _5515 * _5433;
    float _5527 = _5519 * _5433;
    float _5529 = _5511 * _5399;
    float _5531 = _5327 * _5495;
    float _5533 = fma(_5479, _5431, _5525);
    float _5535 = fma(_5495, _5431, _5527);
    float _5537 = _5287 * _5515;
    float _5539 = -_5531;
    float _5541 = fma(_5337, _5479, _5539);
    float _5543 = fma(_5327, _5435, _5533);
    float _5545 = fma(_5337, _5435, _5535);
    float _5547 = _5287 * _5519;
    float _5549 = _5287 * _5541;
    float _5551 = _3553 + _5543;
    float _5553 = _3591 + _5545;
    float _5555 = _5541 * _5433;
    float _5557 = fma(_5305, _5481, _5549);
    float _5559 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5561 = _5551 + _5559;
    float _5563 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5565 = _5553 + _5563;
    float _5567 = _5303 * _5515;
    float _5569 = _5303 * _5541;
    float _5571 = _5561 * _5561;
    float _5573 = _5565 * _5565;
    float _5575 = _5303 * _5519;
    float _5577 = _5331 * _5515;
    float _5579 = _5331 * _5519;
    float _5581 = _5571 + _5573;
    float _5583 = _5331 * _5541;
    float _5585 = fma(_5309, _5479, _5577);
    float _5587 = -_5255;
    float _5589 = fma(_5587, _5481, _5569);
    float _5591 = sqrt(_5581);
    float _5593 = fma(_5309, _5481, _5583);
    float _5595 = fma(_5481, _5431, _5555);
    float _5597 = -_5255;
    float _5599 = fma(_5597, _5479, _5567);
    float _5601 = -_5255;
    float _5603 = fma(_5601, _5495, _5575);
    float _5605 = fma(_5305, _5479, _5537);
    float _5607 = fma(_5353, _5435, _5595);
    float _5609 = fma(_5305, _5495, _5547);
    float _5611 = fma(_5309, _5495, _5579);
    float _5613 = fma(_5307, _5327, _5599);
    float _5615 = fma(_5307, _5353, _5589);
    float _5617 = fma(_5307, _5337, _5603);
    float _5619 = _3569 + _5607;
    float _5621 = fma(_5325, _5327, _5605);
    float _5623 = fma(_5325, _5353, _5557);
    float _5625 = fma(_5325, _5337, _5609);
    bool _5627 = _5591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5629 = fma(_5289, _5337, _5611);
    float _5631 = _5613 * _5395;
    float _5633 = _5615 * _5395;
    float _5635 = _5617 * _5395;
    float _5637 = _5615 * _5469;
    float _5639 = fma(_5289, _5327, _5585);
    float _5641 = fma(_5289, _5353, _5593);
    float _5643 = _5613 * _5469;
    float _5645 = _5521 * _5613;
    float _5647 = _5521 * _5615;
    float _5649 = _5521 * _5617;
    float _5651 = _5617 * _5469;
    float _5653 = _5557;
    float _5655 = _5613;
    float _5657 = _5585;
    float _5659 = _5521;
    float _5661 = _5529;
    if (!_5627)
    {
        _5653 = _5573;
    }
    float _5663 = _5653;
    float _5665 = _5663;
    if (!_5627)
    {
        _5655 = _5571;
    }
    float _5667 = _5655;
    float _5669 = _5667;
    if (!_5627)
    {
        _5447 = _5551;
    }
    float _5671 = _5447;
    float _5673 = _5671;
    if (!_5627)
    {
        _5657 = _5553;
    }
    float _5675 = _5657;
    float _5677 = _5675;
    if (!_5627)
    {
        _5659 = _5619;
    }
    float _5679 = _5659;
    bool _5681 = !_5627;
    float _5683 = _5679;
    if (!_5681)
    {
        float _5685 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5689 = _5591 + _5687;
        float _5691 = rsqrt(_5581);
        float _5693 = _5689 * _5685;
        float _5695 = _5619 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5697 = _5693 * 0.15915493667125701904296875;
        float _5699 = _5697 * 6.283185482025146484375;
        float _5701 = sin(_5699);
        float _5703 = _5697 * 6.283185482025146484375;
        float _5705 = cos(_5703);
        float _5707 = fma(_5701, _5695, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5709 = _5691 * _5707;
        float _5711 = _5705 + (-1.0);
        float _5713 = fma(_5561, _5709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5715 = fma(_5565, _5709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5717 = _5711 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5721 = _5713 + _5719;
        float _5723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5725 = _5715 + _5723;
        float _5727 = fma(_5619, _5705, _5717);
        float _5729 = _5721 * _5721;
        float _5731 = _5725 * _5725;
        _5683 = _5727;
        _5669 = _5729;
        _5665 = _5731;
        _5673 = _5713;
        _5677 = _5715;
    }
    float _5733 = _5683;
    float _5735 = _5669;
    float _5737 = _5665;
    float _5739 = _5673;
    float _5741 = _5677;
    float _5743 = fma(_5621, _5393, _5631);
    float _5745 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5747 = _5733 + _5745;
    float _5749 = fma(_5621, _5485, _5643);
    float _5751 = fma(_5625, _5485, _5651);
    float _5753 = fma(_5623, _5393, _5633);
    float _5755 = fma(_5747, _5747, _5735);
    float _5757 = fma(_5623, _5485, _5637);
    float _5759 = fma(_5523, _5623, _5647);
    float _5761 = fma(_5625, _5393, _5635);
    float _5763 = _5755 + _5737;
    float _5765 = fma(_5523, _5621, _5645);
    float _5767 = fma(_5523, _5625, _5649);
    float _5769 = fma(_5639, _5397, _5743);
    float _5771 = fma(_5641, _5397, _5753);
    float _5773 = fma(_5641, _5503, _5757);
    float _5775 = sqrt(_5763);
    float _5777 = fma(_5629, _5397, _5761);
    float _5779 = fma(_5639, _5503, _5749);
    float _5781 = fma(_5529, _5639, _5765);
    float _5783 = fma(_5529, _5641, _5759);
    float _5785 = fma(_5529, _5629, _5767);
    float _5787 = fma(_5629, _5503, _5751);
    out.m_95.x = _5769;
    out.m_95.y = _5771;
    out.m_95.z = _5777;
    out.m_97.x = _5781;
    out.m_97.y = _5783;
    out.m_97.z = _5785;
    out.m_99.x = _5779;
    out.m_99.y = _5773;
    out.m_99.z = _5787;
    bool _5789 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5791 = isnan(_5775);
    bool _5793 = _5789 || _5791;
    bool _5795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5797 = _5793 || _5795;
    float _5799 = _5749;
    if (!_5797)
    {
        _5661 = 1.0;
    }
    float _5801 = _5661;
    bool _5803 = !_5797;
    float _5805 = _5801;
    if (!_5803)
    {
        bool _5807 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5809 = isnan(_5775);
        bool _5811 = _5807 || _5809;
        bool _5813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5815 = _5811 || _5813;
        if (!_5815)
        {
            float _5817 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5819 = _5775 + _5817;
            float _5821 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5823 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5821;
            float _5825 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5827 = _5825 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5829 = 1.0 / _5823;
            float _5831 = _5819 * _5829;
            float _5833 = fma(_5831, _5827, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5805 = _5833;
            _5835 = true;
        }
        else
        {
            bool _5837 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5839 = isnan(_5775);
            bool _5841 = _5837 || _5839;
            bool _5843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5845 = _5841 || _5843;
            if (!_5845)
            {
                float _5847 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5849 = _5775 + _5847;
                float _5851 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5853 = _5851 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5855 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5857 = _5855 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5859 = 1.0 / _5853;
                float _5861 = _5849 * _5859;
                float _5863 = fma(_5861, _5857, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5805 = _5863;
                _5835 = true;
            }
            else
            {
                _5805 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5835 = false;
    float _5865 = _5805;
    float _5867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5869 = _5733 + _5867;
    float _5871 = _5155 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5873 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5875 = _5739 + _5873;
    float _5877 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5879 = _5741 + _5877;
    float _5881 = fma(_5869, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5883 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5871);
    float _5885 = fma(_5875, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5887 = fma(_5879, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5889 = -_3569;
    float _5891 = _5889 + _5881;
    float _5893 = fma(_5163, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5883);
    float _5895 = -_3553;
    float _5897 = _5895 + _5885;
    float _5899 = _5155 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5901 = _5891 * _5891;
    float _5903 = _5893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5905 = -_3591;
    float _5907 = _5905 + _5887;
    float _5909 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5899);
    float _5911 = fma(_5897, _5897, _5901);
    float _5913 = 1.0 / _5903;
    float _5915 = fma(_5163, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5909);
    float _5917 = fma(_5907, _5907, _5911);
    float _5919 = _5915 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5921 = sqrt(_5917);
    float _5923 = _5919 + _5903;
    float _5925 = _5923 * _5913;
    float _5927 = _5925 * 0.5;
    float _5929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5931 = fma(_5927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5929);
    bool _5933 = _5921 > 0.0;
    float _5935 = 1.0 / _5931;
    bool _5937 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5939 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5941 = _5937 || _5939;
    bool _5943 = isnan(0.5);
    bool _5945 = _5941 || _5943;
    bool _5947 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5949 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5951 = _5947 || _5949;
    bool _5953 = isnan(0.5);
    bool _5955 = _5951 || _5953;
    float _5957 = _5927;
    float _5959 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5961 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5963 = _5885;
    if (!_5933)
    {
        _5957 = _5885;
    }
    float _5965 = _5957;
    float _5967 = _5965;
    float _5969 = _5965;
    if (!_5933)
    {
        _5959 = _5881;
    }
    float _5971 = _5959;
    float _5973 = _5971;
    if (!_5933)
    {
        _5961 = _5887;
    }
    float _5975 = _5961;
    bool _5977 = !_5933;
    float _5979 = _5975;
    float _5981 = _5935;
    if (!_5977)
    {
        float _5983 = _226 * _226;
        float _5985 = fma(_222, _222, _5983);
        float _5987 = fma(_228, _228, _5985);
        float _5989 = rsqrt(_5917);
        float _5991 = sqrt(_5987);
        float _5993 = _5897 * _5989;
        float _5995 = _5891 * _5989;
        float _5997 = _5907 * _5989;
        bool _5999 = _5991 > 0.0;
        float _6001 = _5991;
        float _6003 = _5989;
        if (!_5999)
        {
            _5967 = _5885;
        }
        float _6005 = _5967;
        _5969 = _6005;
        if (!_5999)
        {
            _6001 = _5881;
        }
        float _6007 = _6001;
        _5973 = _6007;
        if (!_5999)
        {
            _6003 = _5887;
        }
        float _6009 = _6003;
        bool _6011 = !_5999;
        _5979 = _6009;
        if (!_6011)
        {
            float _6013 = rsqrt(_5987);
            float _6015 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6017 = _226 * _6013;
            float _6019 = _222 * _6013;
            float _6021 = _228 * _6013;
            float _6023 = _5995 * _6017;
            float _6025 = fma(_5993, _6019, _6023);
            float _6027 = _6015 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6029 = fma(_5997, _6021, _6025);
            float _6031 = _6029 * _6027;
            float _6033 = fma(_222, _6031, _5885);
            float _6035 = fma(_226, _6031, _5881);
            float _6037 = fma(_228, _6031, _5887);
            _5969 = _6033;
            _5973 = _6035;
            _5979 = _6037;
        }
    }
    float _6039 = _5969;
    float _6041 = _5973;
    float _6043 = _5979;
    float _6045 = -_3841;
    float _6047 = fma(_6045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6039);
    float _6049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6051 = _5935 * _6049;
    float _6053 = -_3837;
    float _6055 = fma(_6053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6041);
    float _6057 = -_3861;
    float _6059 = fma(_6057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6043);
    float _6061 = _6055;
    float _6063 = _6059;
    if (_5945)
    {
        _5963 = 1.0;
    }
    float _6065 = _5963;
    float _6067 = _6065;
    if (_5955)
    {
        _5981 = _6047;
    }
    float _6069 = _5981;
    float _6071 = _6069;
    if (!_5955)
    {
        float _6073 = _5169 * _5169;
        float _6075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6077 = -_3591;
        float _6079 = _6077 + _6043;
        float _6081 = -_3553;
        float _6083 = _6081 + _6039;
        float _6085 = fma(_5173, _5173, _6073);
        float _6087 = fma(_5177, _5177, _6085);
        float _6089 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6091 = sqrt(_6087);
        float _6093 = 1.0 / _5293;
        float _6095 = _6089 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6097 = precise::min(_6091, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6099 = _6097 * _6075;
        float _6101 = -_3569;
        float _6103 = _6101 + _6041;
        float _6105 = _6099 * _6093;
        float _6107 = _6095 * _6105;
        float _6109 = _6079 * _6105;
        float _6111 = fma(_6103, _6107, _5155);
        float _6113 = fma(_6083, _6107, _5159);
        float _6115 = fma(_6095, _6109, _5163);
        _6061 = _6111;
        _6071 = _6113;
        _6063 = _6115;
    }
    float _6117 = _6061;
    float _6119 = _6071;
    float _6121 = _6063;
    if (!_5945)
    {
        float _6123 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6125 = _6123 * 0.15915493667125701904296875;
        float _6127 = _6125 * 6.283185482025146484375;
        float _6129 = cos(_6127);
        float _6131 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6133 = _6131 * 0.15915493667125701904296875;
        float _6135 = _6125 * 6.283185482025146484375;
        float _6137 = sin(_6135);
        float _6139 = 1.0 / _6129;
        float _6141 = _6133 * 6.283185482025146484375;
        float _6143 = cos(_6141);
        float _6145 = _6137 * _6139;
        float _6147 = _6133 * 6.283185482025146484375;
        float _6149 = sin(_6147);
        float _6151 = _6143 * _6145;
        float _6153 = 1.0 / _6151;
        float _6155 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6157 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6155;
        float _6159 = 1.0 / _6157;
        float _6161 = _6149 * _6153;
        float _6163 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6165 = fma(_6051, _6161, _6163);
        float _6167 = _6165 * _6159;
        float _6169 = precise::clamp(_6167, 0.0, 1.0);
        _6067 = _6169;
    }
    float _6171 = _6067;
    float _6173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6175 = _6117 + _6173;
    float _6177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6179 = _6119 + _6177;
    float _6181 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6183 = _6121 + _6181;
    float _6185 = _6175 * _6175;
    float _6187 = fma(_6179, _6179, _6185);
    float _6189 = fma(_5159, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6191 = fma(_6183, _6183, _6187);
    float _6193 = rsqrt(_6191);
    float _6195 = sqrt(_6191);
    float _6197 = _6193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6199 = _6179 * _6197;
    float _6201 = _6183 * _6197;
    float _6203 = _6199 * _6199;
    float _6205 = _6201 * _6201;
    float _6207 = _6203 + _6205;
    float _6209 = sqrt(_6207);
    bool _6211 = _6209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6215 = _6209 + _6213;
    float _6217 = _6193;
    float _6219 = _6207;
    float _6221 = _6215;
    float _6223 = _6175;
    if (_6211)
    {
        float _6225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6217 = _6225;
    }
    float _6227 = _6217;
    if (!_6211)
    {
        _5225 = _6203;
    }
    float _6229 = _5225;
    float _6231 = _6229;
    if (_6211)
    {
        float _6233 = rsqrt(_6207);
        _6219 = _6233;
    }
    float _6235 = _6219;
    float _6237 = _6235;
    if (_6211)
    {
        float _6239 = _6215 * _6227;
        _6221 = _6239;
    }
    float _6241 = _6221;
    float _6243 = floor(_6189);
    if (_6211)
    {
        float _6245 = _6241 * 0.15915493667125701904296875;
        _5227 = _6245;
    }
    float _6247 = _5227;
    float _6249 = _6183;
    if (_6211)
    {
        float _6251 = _6247 * 6.283185482025146484375;
        float _6253 = sin(_6251);
        _6249 = _6253;
    }
    float _6255 = _6249;
    float _6257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6259 = precise::max(0.0, _6257);
    float _6261 = _6227;
    float _6263 = _6259;
    if (_6211)
    {
        float _6265 = _6247 * 6.283185482025146484375;
        float _6267 = cos(_6265);
        _6261 = _6267;
    }
    float _6269 = _6261;
    float _6271 = -_6243;
    float _6273 = _6189 + _6271;
    float _6275 = -_6197;
    float _6277 = -_6259;
    float _6279 = fma(_6175, _6275, _6277);
    if (_6211)
    {
        float _6281 = _6279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6223 = _6281;
    }
    float _6283 = _6223;
    float _6285 = _6283;
    float _6287 = _6255;
    if (_6211)
    {
        float _6289 = fma(_6255, _6283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6285 = _6289;
    }
    float _6291 = _6285;
    float _6293 = _6291;
    if (!_6211)
    {
        _6287 = _6199;
    }
    float _6295 = _6287;
    float _6297 = _6295;
    if (_6211)
    {
        float _6299 = _6235 * _6291;
        _5799 = _6299;
    }
    float _6301 = _5799;
    float _6303 = _6269;
    if (_6211)
    {
        float _6305 = _6269 + (-1.0);
        _6263 = _6305;
    }
    float _6307 = _6263;
    float _6309 = _6307;
    if (!_6211)
    {
        _6293 = _6279;
    }
    float _6311 = _6293;
    float _6313 = _6311;
    if (_6211)
    {
        float _6315 = _6199 * _6301;
        _6297 = _6315;
    }
    float _6317 = _6297;
    if (_6211)
    {
        float _6319 = _6307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6237 = _6319;
    }
    float _6321 = _6237;
    if (!_6211)
    {
        _6309 = _6201;
    }
    float _6323 = _6309;
    float _6325 = _6323;
    if (_6211)
    {
        float _6327 = _6201 * _6301;
        _6325 = _6327;
    }
    float _6329 = _6325;
    if (_6211)
    {
        float _6331 = _6317 * _6317;
        _6231 = _6331;
    }
    float _6333 = _6231;
    if (_6211)
    {
        float _6335 = fma(_6279, _6269, _6321);
        _6313 = _6335;
    }
    float _6337 = _6313;
    if (!_6211)
    {
        _6303 = _6205;
    }
    float _6339 = _6303;
    float _6341 = _6339;
    if (_6211)
    {
        float _6343 = _6329 * _6329;
        _6341 = _6343;
    }
    float _6345 = _6341;
    float _6347 = fma(_6337, _6337, _6333);
    float _6349 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6351 = _6347 + _6345;
    float _6353 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6349);
    float _6355 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6357 = fma(_6195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6355);
    float _6359 = precise::clamp(_6357, 0.0, 1.0);
    float _6361 = rsqrt(_6351);
    float _6363 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6353);
    float _6365 = -_6359;
    float _6367 = _6365 + 1.0;
    float _6369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6371 = fma(_5163, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6373 = _6363 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6375 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6377 = abs(_6367);
    float _6379 = log2(_6377);
    float _6381 = _6373 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6383 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6385 = -_6381;
    float _6387 = fma(_6385, _6369, 1.0);
    float _6389 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6391 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6383);
    float _6393 = _6361 * _6317;
    float _6395 = _6361 * _6337;
    float _6397 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6389);
    float _6399 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6391);
    float _6401 = _6393 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6403 = _6361 * _6329;
    float _6405 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6397);
    float _6407 = _6399 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6409 = -_6401;
    float _6411 = fma(_6395, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6409);
    float _6413 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6375);
    float _6415 = _6405 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6417 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6419 = floor(_6371);
    float _6421 = -_6403;
    float _6423 = fma(_6421, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6411);
    float _6425 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6413);
    float _6427 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6417);
    float _6429 = _6379 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6431 = fma(_6423, -0.5, 0.5);
    float _6433 = _6425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6435 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6427);
    float _6437 = exp2(_6429);
    float _6439 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6441 = fma(_6423, 0.5, 0.5);
    float _6443 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6435);
    float _6445 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6447 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6439);
    float _6449 = sqrt(_6431);
    float _6451 = -_6419;
    float _6453 = _6371 + _6451;
    float _6455 = fma(_6441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6457 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6445);
    float _6459 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6447);
    float _6461 = _6395 + 1.0;
    float _6463 = fma(_6441, _6455, -0.212114393711090087890625);
    float _6465 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6457);
    float _6467 = log2(_6387);
    float _6469 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6459);
    float _6471 = fma(_6441, _6463, 1.570728778839111328125);
    float _6473 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6465);
    float _6475 = -_6395;
    float _6477 = fma(_6437, _6461, _6475);
    float _6479 = 1.0 / _6443;
    float _6481 = _6449 * 0.636619746685028076171875;
    float _6483 = fma(_6477, 0.5, 0.5);
    float _6485 = -_6471;
    float _6487 = fma(_6481, _6485, 1.0);
    float2 _16495 = float2(_6273, _6453);
    float _6489 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16495, float2(0.0), isnan(_16495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16495, float2(0.0), isnan(_16495)), level(0.0)).x;
    float _6491 = _6467 * 0.693147182464599609375;
    float _6493 = _6469 * _6479;
    float _6495 = _6473 * _6479;
    float _6497 = _6491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6499 = fma(_6493, 0.5, 0.5);
    float _6501 = fma(_6495, -0.5, 0.5);
    float3 _16523 = float3(_6499, _6501, _6497);
    float _6503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16523, float3(0.0), isnan(_16523)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16523, float3(0.0), isnan(_16523)), level(0.0)).x;
    float3 _16534 = float3(_6499, _6501, _6497);
    float4 _6506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16534, float3(0.0), isnan(_16534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16534, float3(0.0), isnan(_16534)), level(0.0)).xyzw;
    float _6508 = _6506.x;
    float _6510 = _6506.y;
    float _6512 = _6506.z;
    float _6514 = _6506.w;
    float2 _16550 = float2(_6487, _6483);
    float3 _6518 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16550, float2(0.0), isnan(_16550)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16550, float2(0.0), isnan(_16550)), level(0.0)).xyz;
    float _6520 = _6518.x;
    float _6522 = _6518.y;
    float _6524 = _6518.z;
    float _6526 = abs(_6051);
    float _6528 = log2(_6526);
    float _6530 = _6379 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6532 = _6443 * 0.5;
    float _6534 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6536 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6538 = isnan(_6195);
    bool _6540 = _6536 || _6538;
    bool _6542 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6544 = _6540 || _6542;
    float _6546 = exp2(_6530);
    bool _6548 = _6051 <= 8000.0;
    bool _6550 = isnan(_6051);
    bool _6552 = _6548 || _6550;
    bool _6554 = isnan(8000.0);
    bool _6556 = _6552 || _6554;
    float _6558 = float(_6556);
    float _6560 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6534);
    float _6562 = in.m_101.x;
    float _6564 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6560);
    float _6566 = _6528 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6568 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6564);
    float _6570 = _6469 + _6443;
    float _6572 = exp2(_6566);
    float _6574 = _6570 * 0.5;
    float _6576 = -_6546;
    float _6578 = _6576 + 1.0;
    out.gl_Position.x = _6469;
    out.gl_Position.y = _6473;
    out.gl_Position.z = _6568;
    out.gl_Position.w = _6443;
    float _6580 = _6570;
    float _6582 = _6473;
    float _6584 = _6469;
    float _6586 = _6443;
    float _6588 = _6568;
    float _6590 = _6574;
    if (!_6544)
    {
        _6580 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6592 = _6580;
    float _6594 = _6578 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6596 = fma(_6572, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6598 = precise::clamp(_6596, 0.0, 1.0);
    float _6600 = fma(_6473, -0.5, _6532);
    float _6602 = fma(_6598, -2.0, 3.0);
    float _6604 = _6598 * _6598;
    float _6606 = _6592;
    float _6608 = _6592;
    if (!_6544)
    {
        _6582 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6610 = _6582;
    float _6612 = _6610;
    float _6614 = _6610;
    if (!_6544)
    {
        _6584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6616 = _6584;
    float _6618 = _6604 * _6602;
    float _6620 = -_6618;
    float _6622 = _6620 + 1.0;
    float _6624 = fma(_6622, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6618);
    float _6626 = _6568 + _6443;
    float _6628 = _6558 * _6624;
    float _6630 = _6626 * 0.5;
    float _6632 = _6616;
    float _6634 = _6616;
    if (!_6544)
    {
        _6586 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6636 = _6586;
    float _6638 = _6628 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6640 = _6636;
    float _6642 = _6636;
    if (!_6544)
    {
        _6588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6644 = _6588;
    out.m_103.x = _6574;
    out.m_103.y = _6600;
    out.m_103.z = _6630;
    out.m_103.w = _6443;
    float _6646 = _6171 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6648 = _6644;
    float _6650 = _6644;
    if (!_6544)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6652 = _6590;
    float _6654 = -_6489;
    float _6656 = _6654 + 1.0;
    float _6658 = _6656 * _6638;
    float _6660 = precise::clamp(_6658, 0.0, 1.0);
    float _6662 = -_6660;
    float _6664 = fma(_6662, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6666 = _6664 * _6562;
    float _6668 = _6666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6670 = _6594 * _6503;
    float _6672 = -_6594;
    float _6674 = _6672 + 1.0;
    out.m_105.x = _6668;
    float _6676 = _6514 * _6670;
    float _6678 = _6524 * _6670;
    float _6680 = _6514 * _6674;
    float _6682 = fma(_6520, _6676, _6508);
    float _6684 = fma(_6522, _6676, _6510);
    float _6686 = fma(_6514, _6678, _6512);
    out.m_107.x = _6682;
    out.m_107.y = _6684;
    out.m_107.z = _6686;
    out.m_107.w = _6680;
    bool _6688 = !_6544;
    float _6690 = _6652;
    float _6692 = _6652;
    if (!_6688)
    {
        bool _6694 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6696 = isnan(_6195);
        bool _6698 = _6694 || _6696;
        bool _6700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6702 = _6698 || _6700;
        if (!_6702)
        {
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6706 = _6195 + _6704;
            float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6710 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6708;
            float _6712 = 1.0 / _6710;
            float _6714 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6722 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6724 = _6722 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6726 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6728 = _6726 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6730 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6732 = _6730 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6734 = _6706 * _6712;
            float _6736 = precise::clamp(_6734, 0.0, 1.0);
            float _6738 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6740 = _6738 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6742 = fma(_6736, _6720, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6744 = fma(_6736, _6740, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6746 = fma(_6736, _6716, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6748 = fma(_6736, _6724, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6750 = fma(_6736, _6728, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6752 = fma(_6736, _6732, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6634 = _6746;
            _6642 = _6750;
            _6614 = _6744;
            _6692 = _6748;
            _6608 = _6742;
            _6650 = _6752;
            _6754 = true;
        }
        else
        {
            bool _6756 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6758 = isnan(_6195);
            bool _6760 = _6756 || _6758;
            bool _6762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6764 = _6760 || _6762;
            if (!_6764)
            {
                _6690 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6766 = _6690;
            _6692 = _6766;
            if (!_6764)
            {
                _6640 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6768 = _6640;
            _6642 = _6768;
            if (!_6764)
            {
                _6648 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6770 = _6648;
            _6650 = _6770;
            if (!_6764)
            {
                _6612 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6772 = _6612;
            _6614 = _6772;
            if (!_6764)
            {
                _6632 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6774 = _6632;
            _6634 = _6774;
            if (!_6764)
            {
                _6606 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6776 = _6606;
            bool _6778 = !_6764;
            _6608 = _6776;
            if (!_6778)
            {
                bool _6780 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6782 = isnan(_6195);
                bool _6784 = _6780 || _6782;
                bool _6786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6788 = _6784 || _6786;
                if (!_6788)
                {
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6792 = _6195 + _6790;
                    float _6794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6796 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6794;
                    float _6798 = 1.0 / _6796;
                    float _6800 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6802 = _6800 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6808 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6810 = _6808 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6812 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6814 = _6812 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6816 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6818 = _6816 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6820 = _6792 * _6798;
                    float _6822 = precise::clamp(_6820, 0.0, 1.0);
                    float _6824 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6826 = _6824 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6828 = fma(_6822, _6806, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6830 = fma(_6822, _6826, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6832 = fma(_6822, _6802, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6834 = fma(_6822, _6810, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6836 = fma(_6822, _6814, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6838 = fma(_6822, _6818, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6634 = _6832;
                    _6642 = _6836;
                    _6614 = _6830;
                    _6692 = _6834;
                    _6608 = _6828;
                    _6650 = _6838;
                    _6754 = true;
                }
                else
                {
                    _6634 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6642 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6614 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6692 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6608 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6650 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6754 = false;
    float _6840 = _6634;
    float _6842 = _6642;
    float _6844 = _6614;
    float _6846 = _6692;
    float _6848 = _6608;
    float _6850 = _6650;
    float _6852 = _6646 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6854 = fma(_5773, -0.5, 0.5);
    float _6856 = precise::clamp(_6854, 0.0, 1.0);
    float _6858 = -_6840;
    float _6860 = _6842 + _6858;
    float _6862 = -_6844;
    float _6864 = _6846 + _6862;
    out.m_51.x = _6852;
    float _6866 = fma(_6856, _6860, _6840);
    float _6868 = -_6848;
    float _6870 = _6850 + _6868;
    float _6872 = fma(_6856, _6864, _6844);
    float _6874 = _6866 * 0.586610972881317138671875;
    bool _6876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6878 = fma(_6856, _6870, _6848);
    out.m_109.x = 0.0;
    float _6880 = fma(_6872, 0.298911988735198974609375, _6874);
    bool _6882 = _6171 > 0.0;
    bool _6884 = isnan(_6171);
    bool _6886 = _6882 || _6884;
    bool _6888 = isnan(0.0);
    bool _6890 = _6886 || _6888;
    float _6892 = fma(_6878, 0.114477999508380889892578125, _6880);
    float _6894 = -_6892;
    float _6896 = _6872 + _6894;
    float _6898 = -_6892;
    float _6900 = _6866 + _6898;
    float _6902 = -_6892;
    float _6904 = _6878 + _6902;
    float _6906 = fma(_6896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    float _6908 = fma(_6900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    float _6910 = fma(_6904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    bool _6912 = !_6876;
    if (!_6912)
    {
        float _6914 = -_6117;
        float _6916 = _6914 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6918 = -_6119;
        float _6920 = _6918 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6922 = -_6121;
        float _6924 = _6922 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6926 = _6916 * _6916;
        float _6928 = fma(_6920, _6920, _6926);
        float _6930 = fma(_6924, _6924, _6928);
        float _6932 = sqrt(_6930);
        float _6934 = rsqrt(_6930);
        float _6936 = -_6932;
        float _6938 = _6936 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6940 = _6938 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6942 = precise::clamp(_6940, 0.0, 1.0);
        float _6944 = _6920 * _6934;
        float _6946 = _6916 * _6934;
        float _6948 = abs(_6942);
        float _6950 = log2(_6948);
        float _6952 = _6924 * _6934;
        float _6954 = _6944 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6956 = _5773 * _6946;
        float _6958 = -_6946;
        float _6960 = -_6954;
        float _6962 = fma(_6958, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6960);
        float _6964 = fma(_5779, _6944, _6956);
        float _6966 = -_6952;
        float _6968 = fma(_6966, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6962);
        float _6970 = fma(_5787, _6952, _6964);
        float _6972 = precise::clamp(_6970, 0.0, 1.0);
        float _6974 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6976 = _6968 + _6974;
        float _6978 = _6950 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6980 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6982 = precise::clamp(_6980, 0.0, 1.0);
        float _6984 = exp2(_6978);
        float _6986 = _6984 * _6982;
        float _6988 = _6972 * _6986;
        float _6990 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6992 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6994 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6990;
        out.m_109.y = _6992;
        out.m_109.z = _6994;
    }
    out.m_111.x = _6906;
    out.m_111.y = _6908;
    out.m_111.z = _6910;
    if (_6890)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _6996 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6996;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6754 = false;
    bool _5835 = false;
    bool _1200 = false;
    bool _876 = false;
    bool _734 = false;
    bool _580 = false;
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_48.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_51.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7053 = as_type<float>(_146);
        out.gl_Position.z = _7053;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_53.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_130);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _140;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7122 = as_type<float>(_184);
        out.gl_Position.z = _7122;
    }
    if (_178)
    {
        return out;
    }
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = in.m_61.x;
    float _208 = in.m_61.y;
    float _210 = in.m_61.z;
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
    float _248;
    if (!_230)
    {
        float _232 = in.m_63.x;
        float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _236 = _232 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _240 = _238 * _234;
        float _242 = floor(_240);
        float _244 = -_242;
        float _246 = _240 + _244;
        _248 = _246;
        _250 = true;
    }
    else
    {
        float _252 = float(_130);
        float _254 = 1.0 / _252;
        float _256 = _164 * _254;
        _248 = _256;
    }
    _250 = false;
    float _258 = _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _280 = 1.0 / _266;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _282;
    bool _286 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _288 = isnan(_258);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = 1.0 / _270;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _258 + _300;
    bool _304 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_258);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _274;
    float _318 = _302 * _280;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _258 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _326 = _258 + _324;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _278;
    float _332 = _262 * _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _336 = _258 + _334;
    float _338 = 1.0 / _284;
    float _340 = _322 * _316;
    bool _342 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_258);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    bool _354 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = isnan(_258);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = _326 * _330;
    float _368 = -_296;
    float _370 = _368 + 1.0;
    bool _372 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _374 = isnan(_258);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = _352 * _370;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _336 * _338;
    float _392 = -_352;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = fma(_388, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = _382 * _394;
    float _408 = fma(_398, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_402, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = -_364;
    float _414 = _412 + 1.0;
    float _416 = -_382;
    float _418 = _416 + 1.0;
    bool _420 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _422 = isnan(_258);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = _314 * _414;
    float _438 = -_314;
    float _440 = _438 + 1.0;
    float _442 = _364 * _418;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _430 * _440;
    float _454 = fma(_434, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_450, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = _408 * _452;
    float _462 = -_430;
    float _464 = _462 + 1.0;
    float _466 = _410 * _452;
    float _468 = _404 * _452;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _466);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _478;
    float _482 = fma(_472, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_454, _436, _474);
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_458, _436, _476);
    float _494 = fma(_482, _442, _484);
    float _496 = fma(_480, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_456, _436, _486);
    float _500 = fma(_490, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_496, _442, _498);
    float _516 = fma(_504, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _518 = fma(_508, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _520 = fma(_512, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _522 = fma(_500, _442, _492);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _532;
    float _536 = fma(_516, _406, _494);
    float _538 = fma(_526, _390, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _540 = fma(_530, _390, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _542 = fma(_534, _390, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _544 = fma(_518, _406, _514);
    float _546 = fma(_520, _406, _522);
    float _548 = fma(_538, _384, _536);
    float _550 = fma(_540, _384, _544);
    float _552 = fma(_542, _384, _546);
    float _554 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].x, _548);
    float _556 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].y, _550);
    float _558 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].z, _552);
    bool _560 = !_328;
    float _578;
    if (!_560)
    {
        float _562 = in.m_63.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_130);
        float _584 = 1.0 / _582;
        float _586 = _164 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _588 + _590;
    float _594 = in.m_65.x;
    float _596 = in.m_65.y;
    float _598 = in.m_65.z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _604 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = isnan(_588);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _622 = isnan(_588);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    bool _636 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = isnan(_588);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _602;
    float _650 = -_614;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _588 + _654;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _630 * _652;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _618;
    float _668 = _634 * _648;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _592, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _672 * _666;
    float _678 = -_646;
    float _680 = _678 + 1.0;
    float _682 = _674 * _660;
    float _684 = fma(_676, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _686 = _614 * _680;
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _690 = _558 * _598;
    float _692 = fma(_684, _686, _688);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _700 = _556 * _596;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _554 * _594;
    out.m_67.x = _704;
    out.m_67.y = _706;
    out.m_67.z = _710;
    out.m_67.w = _708;
    bool _714 = !_658;
    float _732;
    if (!_714)
    {
        float _716 = in.m_63.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_130);
        float _738 = 1.0 / _736;
        float _740 = _164 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _752 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _754 = isnan(_742);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _768 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _770 = isnan(_742);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _780;
    bool _784 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _786 = isnan(_742);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = 1.0 / _750;
    float _798 = -_762;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _804 = _742 + _802;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _808 = _778 * _800;
    float _810 = -_778;
    float _812 = _810 + 1.0;
    float _814 = 1.0 / _766;
    float _816 = _782 * _796;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _822 = fma(_816, _746, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _824 = -_794;
    float _826 = _824 + 1.0;
    float _828 = _820 * _814;
    float _830 = _822 * _808;
    float _832 = _762 * _826;
    float _834 = fma(_828, _804, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[131].x, _830);
    float _838 = fma(_834, _832, _836);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _846 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[133].x, _838);
    float _848 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _850 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _854 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _848;
    out.m_69.y = _850;
    out.m_69.z = _852;
    out.m_69.w = _854;
    bool _856 = !_806;
    float _874;
    if (!_856)
    {
        float _858 = in.m_63.x;
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _862 = _858 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _866 = _864 * _860;
        float _868 = floor(_866);
        float _870 = -_868;
        float _872 = _866 + _870;
        _874 = _872;
        _876 = true;
    }
    else
    {
        float _878 = float(_130);
        float _880 = 1.0 / _878;
        float _882 = _164 * _880;
        _874 = _882;
    }
    _876 = false;
    float _884 = _874;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _888 = _884 + _886;
    bool _890 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _892 = isnan(_884);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _906;
    bool _910 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _912 = isnan(_884);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -_900;
    float _924 = _922 + 1.0;
    bool _926 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _928 = isnan(_884);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = 1.0 / _904;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _920 * _924;
    float _946 = -_936;
    float _948 = _946 + 1.0;
    float _950 = 1.0 / _942;
    bool _952 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _954 = _908 * _938;
    float _956 = -_920;
    float _958 = _956 + 1.0;
    bool _960 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _962 = isnan(_884);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = fma(_954, _888, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _974 = _936 * _958;
    bool _976 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _978 = isnan(_884);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _970 * _948;
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _998 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1000 = isnan(_884);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _986 * _992;
    float _1012 = -_986;
    float _1014 = _1012 + 1.0;
    bool _1016 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1018 = isnan(_884);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = 1.0 / _996;
    float _1030 = -_1008;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1038 = _1008 * _1014;
    float _1040 = _1026 * _1032;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1046 = -_1026;
    float _1048 = _1046 + 1.0;
    float _1050 = 1.0 / _1036;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1056 = _972 * _1040;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1064 = _884 + _1062;
    float _1066 = _1054 * _950;
    float _1068 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1056);
    float _1070 = 1.0 / _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1072;
    float _1076 = fma(_1066, _1064, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1084 = _884 + _1082;
    float _1086 = _1074 * _1028;
    float _1088 = fma(_1076, _1038, _1068);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1092 = _884 + _1090;
    float _1094 = 1.0 / _1060;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1100 = fma(_1086, _1084, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1102 = _1098 * _1050;
    bool _1104 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1106 = isnan(_884);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1112 = _1108 || _1110;
    int _1114 = _1112 ? 1065353216 : 0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1116;
    float _1120 = 1.0 / _1080;
    float _1122 = fma(_1100, _1010, _1088);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1128 = _1118 * _1070;
    float _1130 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1134 = _884 + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1138 = _884 + _1136;
    float _1140 = _1126 * _1094;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1142;
    float _1146 = fma(_1128, _1134, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1148 = fma(_1130, _988, _1122);
    float _1150 = fma(_1140, _1138, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1152 = -as_type<float>(_1114);
    float _1154 = _1152 + 1.0;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1158 = _884 + _1156;
    float _1160 = fma(_1146, _974, _1148);
    float _1162 = _1144 * _1120;
    float _1164 = _900 * _1154;
    float _1166 = fma(_1150, _944, _1160);
    float _1168 = fma(_1162, _1158, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1170 = fma(_1168, _1164, _1166);
    float _1172 = fma(as_type<float>(_1114), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1170);
    out.m_71.x = _1172;
    bool _1174 = !_952;
    float _1176 = _944;
    int _1178 = _1114;
    int _1180 = as_type<int>(_1164);
    float _1198;
    if (!_1174)
    {
        float _1182 = in.m_63.x;
        float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1186 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1190 = _1188 * _1184;
        float _1192 = floor(_1190);
        float _1194 = -_1192;
        float _1196 = _1190 + _1194;
        _1198 = _1196;
        _1200 = true;
    }
    else
    {
        float _1202 = float(_130);
        float _1204 = 1.0 / _1202;
        float _1206 = _164 * _1204;
        _1198 = _1206;
    }
    _1200 = false;
    float _1208 = _1198;
    float _1210 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1212 = int(_1210);
    float _1214 = in.m_73.x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = in.m_63.y;
    float _1222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1224 = int(_1222);
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1228 = _1226 != 0;
    float _1230 = 0.0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1218)
    {
        _1230 = 1.0;
    }
    float _1234 = _1230;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1242 = _1240 != 0;
    float _1244 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1246 = int(_1244);
    float _1248 = float(_1212);
    float _1250 = 0.0;
    float _1252 = _1234;
    bool _1254 = _1238;
    bool _1256 = _1242;
    if (_1218)
    {
        _1250 = 1.0;
    }
    float _1258 = _1250;
    float _1260 = 0.0;
    float _1262 = _1258;
    if (_1218)
    {
        _1260 = 1.0;
    }
    float _1264 = _1260;
    int _1266 = 0;
    float _1268 = _1264;
    if (_1218)
    {
        _1266 = 0;
    }
    int _1270 = _1266;
    float _1272 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1274 = int(_1272);
    float _1276 = float(_1224);
    int _1278 = _1270;
    if (_1218)
    {
        _1232 = 0;
    }
    int _1280 = _1232;
    int _1282 = _1280;
    float _1284 = _1214;
    if (!_1228)
    {
        _1176 = _1214;
    }
    float _1286 = _1176;
    float _1288 = _1286;
    if (_1238)
    {
        float _1290 = -_1214;
        float _1292 = _1290 + 1.0;
        _1178 = as_type<int>(_1292);
    }
    int _1294 = _1178;
    if (_1242)
    {
        float _1296 = -_1214;
        float _1298 = _1296 + 1.0;
        _1180 = as_type<int>(_1298);
    }
    int _1300 = _1180;
    bool _1302 = _1220 > 0.5;
    float _1304 = 1.0 / _1248;
    float _1306 = float(_1246);
    float _1308 = 0.0;
    if (!_1238)
    {
        _1308 = _1214;
    }
    float _1310 = _1308;
    float _1312 = 0.0;
    float _1314 = _1310;
    if (!_1242)
    {
        _1312 = _1214;
    }
    float _1316 = _1312;
    float _1318 = _1316;
    if (_1238)
    {
        float _1320 = _1302 ? as_type<float>(_1294) : _1214;
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1326 = int(_1324);
    float _1328 = float(uint(_1274));
    if (_1242)
    {
        float _1330 = _1302 ? as_type<float>(_1300) : _1214;
        _1318 = _1330;
    }
    float _1332 = _1318;
    int _1334 = 0;
    if (_1218)
    {
        _1334 = as_type<int>(_1220);
    }
    int _1336 = _1334;
    float _1338 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1340 = int(_1338);
    float _1342 = _1304 * _164;
    float _1344 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1346 = int(_1344);
    float _1348 = float(uint(_1326));
    float _1350 = 1.0 / _1276;
    float _1352 = float(_1340);
    float _1354 = 1.0 / _1306;
    float _1356 = float(uint(_1346));
    float _1358 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1360 = int(_1358);
    float _1362 = _1350 * _164;
    float _1364 = 1.0 / _1328;
    float _1366 = _1354 * _164;
    float _1368 = 1.0 / _1348;
    float _1370 = float(uint(_1360));
    float _1372 = trunc(_1342);
    int _1374 = int(_1372);
    float _1376 = _1348;
    int _1378 = _1336;
    if (_1218)
    {
        float _1380 = in.m_63.x;
        _1376 = _1380;
    }
    float _1382 = _1376;
    int _1384 = as_type<int>(_1364) + (-2);
    float _1386 = 1.0 / _1352;
    int _1388 = as_type<int>(_1368) + (-2);
    float _1390 = 1.0 / _1356;
    float _1392 = float(uint(_1374));
    float _1394 = as_type<float>(_1388) * _1392;
    float _1396 = trunc(_1362);
    int _1398 = int(_1396);
    float _1400 = _1386 * _164;
    float _1402 = trunc(_1366);
    int _1404 = int(_1402);
    int _1406 = as_type<int>(_1390) + (-2);
    float _1408 = 1.0 / _1370;
    float _1410 = float(uint(_1398));
    float _1412 = as_type<float>(_1406) * _1410;
    float _1414 = trunc(_1400);
    int _1416 = int(_1414);
    float _1418 = _1370;
    int _1420 = as_type<int>(_1412);
    if (_1218)
    {
        float _1422 = in.m_63.z;
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = float(uint(_1404));
    float _1428 = as_type<float>(_1384) * _1426;
    float _1430 = trunc(_1394);
    float _1432 = precise::max(_1430, 0.0);
    uint _1435 = uint(_1432);
    float _1437 = trunc(_1412);
    float _1439 = precise::max(_1437, 0.0);
    uint _1441 = uint(_1439);
    float _1443 = trunc(_1428);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    float _1449 = _1382;
    if (_1218)
    {
        _1420 = as_type<int>(_1382);
    }
    int _1451 = _1420;
    int _1453 = 0;
    float _1455 = as_type<float>(_1451);
    float _1457 = _1424;
    if (_1218)
    {
        _1453 = as_type<int>(_1424);
    }
    int _1459 = _1453;
    int _1461 = 0;
    int _1463 = _1459;
    if (_1218)
    {
        _1461 = _1451;
    }
    int _1465 = _1461;
    int _1467 = int(_1238);
    int _1469 = _1228 ? 2 : 0;
    int _1471 = _1467 | _1469;
    int _1473 = _1242 ? 4 : 0;
    int _1475 = _1471 | _1473;
    int _1477 = _1218 ? 8 : 0;
    int _1479 = _1475 | _1477;
    int _1481 = false ? 16 : 0;
    int _1483 = _1479 | _1481;
    int _1485 = _1302 ? 32 : 0;
    int _1487 = _1483 | _1485;
    int _1489 = false ? 64 : 0;
    int _1491 = _1487 | _1489;
    int _1493 = _1491 & 32;
    float _1495 = as_type<float>(_1493);
    int _1497 = _1465;
    if (_1218)
    {
        _1495 = as_type<float>(_1451);
    }
    float _1499 = _1495;
    float _1501 = _1499;
    if (!_1218)
    {
        float _1503 = in.m_63.x;
        float _1505 = _1220 * 3.1415927410125732421875;
        float _1507 = in.m_63.z;
        float _1509 = _1505 * 0.15915493667125701904296875;
        float _1511 = _1509 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = _1503 * 3.1415927410125732421875;
        float _1517 = _1515 * 0.15915493667125701904296875;
        float _1519 = _1507 * 3.1415927410125732421875;
        float _1521 = _1519 * 0.15915493667125701904296875;
        float _1523 = _1517 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1501 = _1507;
        _1268 = 5.839270114898681640625;
        _1449 = _1503;
        _1252 = 7.345489978790283203125;
        _1455 = _1220;
        _1262 = 1.2345600128173828125;
        _1278 = 1;
        _1282 = 2;
        _1457 = _1507;
        _1378 = as_type<int>(_1513);
        _1497 = as_type<int>(_1525);
        _1463 = as_type<int>(_1529);
    }
    float _1531 = _1501;
    float _1533 = _1268;
    float _1535 = _1449;
    float _1537 = _1252;
    float _1539 = _1455;
    float _1541 = _1262;
    int _1543 = _1278;
    int _1545 = _1282;
    float _1547 = _1457;
    int _1549 = _1378;
    int _1551 = _1497;
    int _1553 = _1463;
    int _1555 = ~_1274;
    int _1557 = _1555 + 1;
    float _1559 = _1120;
    if (_1228)
    {
        float _1561 = in.m_63.x;
        _1559 = _1561;
    }
    float _1563 = _1559;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1567 = _1565 != 0;
    float _1569 = _1531 * _1533;
    int _1571 = ~_1346;
    int _1573 = _1571 + 1;
    int _1575 = _1557 * int(_1447);
    int _1577 = _1575 + _1404;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1581 = _1579 != 0;
    float _1583 = _1535 * _1537;
    float _1585 = _1539 * _1541;
    int _1587 = as_type<int>(_1408) + (-2);
    float _1589 = floor(_1569);
    float _1591 = float(uint(_1577));
    int _1593 = _1573 * int(_1441);
    int _1595 = _1593 + _1398;
    float _1597 = float(uint(_1416));
    float _1599 = _1539 * _1537;
    float _1601 = _1531;
    if (_1567)
    {
        float _1603 = in.m_63.z;
        _1601 = _1603;
    }
    float _1605 = _1601;
    int _1607 = ~_1326;
    int _1609 = _1607 + 1;
    float _1611 = as_type<float>(_1384) * _1591;
    float _1613 = float(uint(_1595));
    float _1615 = floor(_1583);
    int _1617 = 0;
    float _1619 = _1611;
    if (_1581)
    {
        float _1621 = -_1214;
        float _1623 = _1621 + 1.0;
        _1617 = as_type<int>(_1623);
    }
    int _1625 = _1617;
    int _1627 = _1609 * int(_1435);
    int _1629 = _1627 + _1374;
    int _1631 = 0;
    if (_1567)
    {
        float _1633 = -_1214;
        float _1635 = _1633 + 1.0;
        _1631 = as_type<int>(_1635);
    }
    int _1637 = _1631;
    float _1639 = as_type<float>(_1406) * _1613;
    int _1641 = ~_1274;
    int _1643 = _1641 + 1;
    bool _1645 = _1543 != 1;
    float _1647 = _1563;
    if (_1228)
    {
        bool _1649 = _1563 > 0.5;
        _1254 = _1649;
    }
    bool _1651 = _1254;
    float _1653 = floor(_1585);
    if (!_1581)
    {
        _1647 = _1214;
    }
    float _1655 = _1647;
    bool _1657 = _1545 != 2;
    float _1659 = _1655;
    if (_1581)
    {
        float _1661 = _1302 ? as_type<float>(_1625) : _1214;
        _1659 = _1661;
    }
    float _1663 = _1659;
    float _1665 = _1220 * 2.0;
    float _1667 = float(uint(_1629));
    float _1669 = in.m_59.w;
    int _1671 = ~_1326;
    int _1673 = _1671 + 1;
    float _1675 = trunc(_1639);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = -_1615;
    float _1683 = _1583 + _1681;
    float _1685 = as_type<float>(_1388) * _1667;
    int _1687 = ~_1360;
    int _1689 = _1687 + 1;
    int _1691 = as_type<int>(_1667);
    float _1693 = as_type<float>(_1673);
    if (_1228)
    {
        float _1695 = -_1214;
        float _1697 = _1695 + 1.0;
        _1691 = as_type<int>(_1697);
    }
    int _1699 = _1691;
    if (_1567)
    {
        bool _1701 = _1605 > 0.5;
        _1256 = _1701;
    }
    bool _1703 = _1256;
    float _1705 = in.m_61.w;
    int _1707 = ~_1346;
    int _1709 = _1707 + 1;
    float _1711 = -_1653;
    float _1713 = _1585 + _1711;
    float _1715 = as_type<float>(_1587) * _1597;
    float _1717 = float(_130);
    float _1719 = trunc(_1685);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = float(_1274);
    float _1727 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1729 = as_type<float>(_1709);
    if (_1228)
    {
        float _1731 = _1651 ? as_type<float>(_1699) : _1214;
        _1288 = _1731;
    }
    float _1733 = _1288;
    int _1735 = int(_1441) + int(_1679);
    float _1737 = _1683 * _1725;
    float _1739 = float(_1404);
    float _1741 = trunc(_1715);
    float _1743 = precise::max(_1741, 0.0);
    uint _1745 = uint(_1743);
    float _1747 = -_1589;
    float _1749 = _1569 + _1747;
    float _1751 = float(_1346);
    bool _1753 = _1739 >= _1725;
    bool _1755 = isnan(_1739);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(_1725);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = float(_1360);
    float _1767 = floor(_1599);
    int _1769 = int(_1435) + int(_1723);
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1773 = _1771 != 0;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1777 = _1775 != 0;
    float _1779 = 1.0 / _1717;
    int _1781 = _1689 * int(_1745);
    int _1783 = _1781 + _1416;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1787 = float(uint(_1783));
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1791 = trunc(_1611);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = _1725 * _164;
    float _1799 = -_1767;
    float _1801 = _1599 + _1799;
    float _1803 = as_type<float>(_1587) * _1787;
    float _1805 = float(_1398);
    float _1807 = _1751 * _1713;
    float _1809 = float(_1326);
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1813 = trunc(_1803);
    float _1815 = precise::max(_1813, 0.0);
    uint _1817 = uint(_1815);
    if (!_1567)
    {
        _1619 = _1214;
    }
    float _1819 = _1619;
    float _1821 = _1797 * _1779;
    float _1823 = _1819;
    if (_1567)
    {
        float _1825 = _1703 ? as_type<float>(_1637) : _1214;
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = _1779 * _164;
    float _1831 = float(_1374);
    float _1833 = _1809 * _1749;
    bool _1835 = _1805 >= _1751;
    bool _1837 = isnan(_1805);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1751);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1809 * _1829;
    int _1849 = int(_1447) + int(_1795);
    float _1851 = _1765 * _1829;
    float _1853 = float(_1416);
    float _1855 = trunc(_1845);
    int _1857 = int(_1855);
    bool _1859 = _1831 >= _1809;
    bool _1861 = isnan(_1831);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(_1809);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    float _1871 = _1765 * _1801;
    bool _1873 = _1853 >= _1765;
    bool _1875 = isnan(_1853);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1765);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    int _1885 = _1643 * _1849;
    int _1887 = _1885 + _1404;
    int _1889 = _1709 * _1735;
    int _1891 = _1889 + _1398;
    int _1893 = int(_1745) + int(_1817);
    float _1895 = trunc(_1763);
    int _1897 = int(_1895);
    bool _1899 = !_1773;
    int _1901 = _1899 ? 0 : 1;
    float _1903 = _1751 * _1829;
    bool _1905 = uint(_1887) >= uint(_1274);
    int _1907 = _1673 * _1769;
    int _1909 = _1907 + _1374;
    int _1911 = abs(_1901);
    int _1913 = ~_1360;
    int _1915 = _1913 + 1;
    float _1917 = trunc(_1737);
    int _1919 = int(_1917);
    bool _1921 = uint(_1891) >= uint(_1346);
    bool _1923 = uint(_1909) >= uint(_1326);
    int _1925 = _1915 * _1893;
    int _1927 = _1925 + _1416;
    bool _1929 = !_1777;
    int _1931 = _1929 ? 0 : 1;
    bool _1933 = !_1905;
    int _1935 = _1933 ? 0 : (-1);
    float _1937 = trunc(_1807);
    int _1939 = int(_1937);
    bool _1941 = !_1921;
    int _1943 = _1941 ? 0 : (-1);
    int _1945 = abs(_1931);
    int _1947 = ~_1849;
    int _1949 = _1947 + _1935;
    int _1951 = _1949 + 1;
    bool _1953 = !_1923;
    int _1955 = _1953 ? 0 : (-1);
    float _1957 = trunc(_1869);
    int _1959 = int(_1957);
    bool _1961 = uint(_1927) >= uint(_1360);
    int _1963 = _1919 * _1911;
    int _1965 = _1963 + _1404;
    int _1967 = ~_1735;
    int _1969 = _1967 + _1943;
    int _1971 = _1969 + 1;
    int _1973 = ~_1769;
    int _1975 = _1973 + _1955;
    int _1977 = _1975 + 1;
    int _1979 = _1274 * _1951;
    int _1981 = _1979 + _1404;
    bool _1983 = !_1961;
    int _1985 = _1983 ? 0 : (-1);
    int _1987 = _1939 * _1945;
    int _1989 = _1987 + _1398;
    int _1991 = _1346 * _1971;
    int _1993 = _1991 + _1398;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1833);
    int _2001 = int(_1999);
    int _2003 = ~_1893;
    int _2005 = _2003 + _1985;
    int _2007 = _2005 + 1;
    int _2009 = _1326 * _1977;
    int _2011 = _2009 + _1374;
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2015 = _2013 != 0;
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2019 = _2017 != 0;
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2023 = _2021 != 0;
    bool _2025 = _1346 == 0;
    int _2027 = _1360 * _2007;
    int _2029 = _2027 + _1416;
    bool _2031 = !_1997;
    int _2033 = _2031 ? 0 : 1;
    float _2035 = trunc(_1883);
    int _2037 = int(_2035);
    bool _2039 = _1274 == 0;
    bool _2041 = _1326 == 0;
    int _2043 = ~_1857;
    int _2045 = _2043 + 1;
    int _2047 = _2045 + 1;
    bool _2049 = _1360 == 0;
    float _2051 = trunc(_1821);
    int _2053 = int(_2051);
    bool _2055 = !_2025;
    int _2057 = _2055 ? _1993 : (-1);
    int _2059 = ~_1897;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    bool _2065 = !_2039;
    int _2067 = _2065 ? _1981 : (-1);
    int _2069 = _2047 * _2057;
    int _2071 = abs(_2033);
    float _2073 = trunc(_1903);
    int _2075 = int(_2073);
    int _2077 = ~_1959;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    int _2083 = _2067 * _2063;
    bool _2085 = !_2041;
    int _2087 = _2085 ? _2011 : (-1);
    int _2089 = _2001 * _2071;
    int _2091 = _2089 + _1374;
    bool _2093 = !_2049;
    int _2095 = _2093 ? _2029 : (-1);
    int _2097 = _1274 + (-1);
    int _2099 = _2081 * _2087;
    bool _2101 = !_2019;
    int _2103 = _2101 ? 0 : 1;
    float _2105 = floor(_1665);
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2109 = _2107 != 0;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2113 = _2111 != 0;
    int _2115 = _1897 * _2097;
    int _2117 = _2115 + _2083;
    int _2119 = _1346 + (-1);
    int _2121 = abs(_2103);
    bool _2123 = !_2015;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _1857 * _2119;
    int _2129 = _2127 + _2069;
    bool _2131 = !_2113;
    int _2133 = _2131 ? 0 : 1;
    int _2135 = _2117 * _2121;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2139 = _2137 != 0;
    int _2141 = abs(_2125);
    int _2143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2145 = _2143 != 0;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2149 = _2147 != 0;
    bool _2151 = !_2023;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2053 * _2141;
    int _2157 = _2155 + _2135;
    int _2159 = abs(_2133);
    bool _2161 = !_2145;
    int _2163 = _2161 ? 0 : 1;
    int _2165 = abs(_2153);
    int _2167 = _2129 * _2159;
    bool _2169 = !_2139;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2163);
    bool _2175 = !_2109;
    int _2177 = _2175 ? 0 : 1;
    int _2179 = abs(_2171);
    int _2181 = _1965 * _2165;
    int _2183 = _2181 + _2157;
    int _2185 = abs(_2177);
    int _2187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2189 = _2187 != 0;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2193 = _2191 != 0;
    int _2195 = _2075 * _2185;
    int _2197 = _2195 + _2167;
    bool _2199 = !_2149;
    int _2201 = _2199 ? 0 : 1;
    int _2203 = _1919 * _2179;
    int _2205 = _2203 + _2183;
    float _2207 = trunc(_1871);
    int _2209 = int(_2207);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2213 = _2211 != 0;
    int _2215 = abs(_2201);
    int _2217 = _1989 * _2173;
    int _2219 = _2217 + _2197;
    bool _2221 = !_2213;
    int _2223 = _2221 ? 0 : 1;
    bool _2225 = !_2193;
    int _2227 = _2225 ? 0 : 1;
    float _2229 = trunc(_1847);
    int _2231 = int(_2229);
    float _2233 = float(uint(_2205));
    int _2235 = abs(_2223);
    int _2237 = _1939 * _2215;
    int _2239 = _2237 + _2219;
    int _2241 = abs(_2227);
    float _2243 = as_type<float>(_1384) * _2233;
    int _2245 = _1326 + (-1);
    bool _2247 = !_2189;
    int _2249 = _2247 ? 0 : 1;
    float _2251 = trunc(_2243);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = ~_2037;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    int _2263 = _1959 * _2245;
    int _2265 = _2263 + _2099;
    int _2267 = abs(_2249);
    float _2269 = in.m_73.y;
    int _2271 = _2261 * _2095;
    float _2273 = float(uint(_2239));
    int _2275 = _2265 * _2241;
    int _2277 = _1360 + (-1);
    int _2279 = _2209 * _2235;
    int _2281 = _2279 + _1416;
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2285 = _2283 != 0;
    float _2287 = as_type<float>(_1406) * _2273;
    int _2289 = _2231 * _2267;
    int _2291 = _2289 + _2275;
    int _2293 = ~_1274;
    int _2295 = _2293 + 1;
    int _2297 = _2037 * _2277;
    int _2299 = _2297 + _2271;
    bool _2301 = !_2285;
    int _2303 = _2301 ? 0 : 1;
    float _2305 = trunc(_2287);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2313 = _2311 != 0;
    int _2315 = abs(_2303);
    int _2317 = _2295 * int(_2255);
    int _2319 = _2317 + _2205;
    bool _2321 = !_2313;
    int _2323 = _2321 ? 0 : 1;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2327 = _2325 != 0;
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2331 = _2329 != 0;
    float _2333 = trunc(_1851);
    int _2335 = int(_2333);
    int _2337 = ~_1346;
    int _2339 = _2337 + 1;
    float _2341 = float(uint(_2319));
    int _2343 = _2091 * _2315;
    int _2345 = _2343 + _2291;
    bool _2347 = !_2331;
    int _2349 = _2347 ? 0 : 1;
    float _2351 = -_2269;
    float _2353 = _2351 + 1.0;
    float _2355 = as_type<float>(_1384) * _2341;
    bool _2357 = !_2327;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = abs(_2349);
    int _2363 = _2339 * int(_2309);
    int _2365 = _2363 + _2239;
    int _2367 = abs(_2323);
    float _2369 = trunc(_2355);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2377 = _2375 != 0;
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2381 = _2379 != 0;
    int _2383 = abs(_2359);
    float _2385 = float(uint(_2365));
    int _2387 = _2299 * _2361;
    bool _2389 = !_2377;
    int _2391 = _2389 ? 0 : 1;
    int _2393 = _2001 * _2367;
    int _2395 = _2393 + _2345;
    int _2397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2399 = _2397 != 0;
    float _2401 = as_type<float>(_1406) * _2385;
    int _2403 = abs(_2391);
    float _2405 = float(uint(_2395));
    float _2407 = trunc(_2401);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    int _2413 = _2335 * _2383;
    int _2415 = _2413 + _2387;
    bool _2417 = !_2381;
    int _2419 = _2417 ? 0 : 1;
    float _2421 = as_type<float>(_1388) * _2405;
    int _2423 = int(_2255) + int(_2373);
    int _2425 = _2281 * _2403;
    int _2427 = _2425 + _2415;
    int _2429 = ~_1274;
    int _2431 = _2429 + 1;
    float _2433 = trunc(_2421);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = abs(_2419);
    float _2441 = in.m_63.w;
    int _2443 = _2431 * _2423;
    int _2445 = _2443 + _2205;
    int _2447 = ~_1326;
    int _2449 = _2447 + 1;
    int _2451 = _2209 * _2439;
    int _2453 = _2451 + _2427;
    int _2455 = ~_1346;
    int _2457 = _2455 + 1;
    int _2459 = _2209;
    float _2461 = as_type<float>(_2011);
    float _2463 = as_type<float>(_1893);
    if (_2399)
    {
        float _2465 = -_1214;
        float _2467 = _2465 + 1.0;
        _2459 = as_type<int>(_2467);
    }
    int _2469 = _2459;
    bool _2471 = uint(_2445) >= uint(_1274);
    int _2473 = int(_2309) + int(_2411);
    bool _2475 = !_2471;
    int _2477 = _2475 ? 0 : (-1);
    int _2479 = _2457 * _2473;
    int _2481 = _2479 + _2239;
    float _2483 = float(uint(_2453));
    int _2485 = _2449 * int(_2437);
    int _2487 = _2485 + _2395;
    bool _2489 = _1220 > 0.5;
    int _2491 = ~_2423;
    int _2493 = _2491 + _2477;
    int _2495 = _2493 + 1;
    float _2497 = as_type<float>(_1587) * _2483;
    if (_2399)
    {
        float _2499 = _2489 ? as_type<float>(_2469) : _1214;
        _1284 = _2499;
    }
    float _2501 = _1284;
    bool _2503 = uint(_2481) >= uint(_1346);
    int _2505 = _1274 * _2495;
    int _2507 = _2505 + _2205;
    float _2509 = float(uint(_2487));
    float _2511 = trunc(_2497);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    bool _2517 = _1274 == 0;
    bool _2519 = !_2503;
    int _2521 = _2519 ? 0 : (-1);
    bool _2523 = _2441 > 0.5;
    float _2525 = as_type<float>(_1388) * _2509;
    bool _2527 = !_2517;
    int _2529 = _2527 ? _2507 : (-1);
    int _2531 = _2523 ? as_type<int>(_2353) : as_type<int>(_2269);
    float _2533 = trunc(_2525);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    int _2539 = _2529 & 3;
    bool _2541 = _2539 != 0;
    int _2543 = _2529 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = uint(_2539) >= 2u;
    int _2549 = _2545 ? 0 : 1;
    int _2551 = ~_2473;
    int _2553 = _2551 + _2521;
    int _2555 = _2553 + 1;
    bool _2557 = uint(_2539) > 1u;
    int _2559 = ~_1360;
    int _2561 = _2559 + 1;
    int _2563 = _1346 * _2555;
    int _2565 = _2563 + _2239;
    int _2567 = _2547 ? 0 : 1;
    bool _2569 = _2539 != 3;
    int _2571 = _2561 * int(_2515);
    int _2573 = _2571 + _2453;
    int _2575 = _2489 ? as_type<int>(_2353) : as_type<int>(_2269);
    bool _2577 = _1346 == 0;
    int _2579 = ~_1326;
    int _2581 = _2579 + 1;
    bool _2583 = !_2577;
    int _2585 = _2583 ? _2565 : (-1);
    int _2587 = int(_2437) + int(_2537);
    float _2589 = float(uint(_2573));
    int _2591 = ~_2549;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = as_type<float>(_1587) * _2589;
    int _2599 = _2595;
    if (!_2557)
    {
        int _2601 = ~_2549;
        int _2603 = _2601 + 1;
        _2599 = _2603;
    }
    int _2605 = _2599;
    int _2607 = _2585 & 3;
    bool _2609 = _2607 != 0;
    int _2611 = _2581 * _2587;
    int _2613 = _2611 + _2395;
    int _2615 = ~_2567;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2619;
    if (_2569)
    {
        int _2623 = ~_2567;
        int _2625 = _2623 + 1;
        _2621 = _2625;
    }
    int _2627 = _2621;
    bool _2629 = uint(_2607) >= 2u;
    float _2631 = trunc(_2597);
    float _2633 = precise::max(_2631, 0.0);
    uint _2635 = uint(_2633);
    int _2637 = _2609 ? 0 : 1;
    bool _2639 = uint(_2613) >= uint(_1326);
    int _2641 = _2629 ? 0 : 1;
    bool _2643 = _2607 != 3;
    bool _2645 = !_2639;
    int _2647 = _2645 ? 0 : (-1);
    bool _2649 = uint(_2607) > 1u;
    int _2651 = ~_2587;
    int _2653 = _2651 + _2647;
    int _2655 = _2653 + 1;
    int _2657 = ~_2641;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    bool _2663 = _1326 == 0;
    int _2665 = _1326 * _2655;
    int _2667 = _2665 + _2395;
    int _2669 = ~_2637;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    int _2675 = _2661;
    int _2677 = _2673;
    if (_2643)
    {
        int _2679 = ~_2641;
        int _2681 = _2679 + 1;
        _2675 = _2681;
    }
    int _2683 = _2675;
    int _2685 = ~_1360;
    int _2687 = _2685 + 1;
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2691 = _2689 != 0;
    if (!_2649)
    {
        int _2693 = ~_2637;
        int _2695 = _2693 + 1;
        _2677 = _2695;
    }
    int _2697 = _2677;
    bool _2699 = !_2663;
    int _2701 = _2699 ? _2667 : (-1);
    int _2703 = int(_2515) + int(_2635);
    bool _2705 = !_2691;
    int _2707 = _2705 ? 0 : 1;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2711 = _2709 != 0;
    int _2713 = _2687 * _2703;
    int _2715 = _2713 + _2453;
    int _2717 = _2701 & 3;
    bool _2719 = _2717 != 0;
    bool _2721 = !_2711;
    int _2723 = _2721 ? 0 : 1;
    bool _2725 = uint(_2717) >= 2u;
    int _2727 = _2719 ? 0 : 1;
    bool _2729 = uint(_2715) >= uint(_1360);
    int _2731 = _2725 ? 0 : 1;
    bool _2733 = _2717 != 3;
    bool _2735 = !_2729;
    int _2737 = _2735 ? 0 : (-1);
    bool _2739 = uint(_2717) > 1u;
    int _2741 = ~_2703;
    int _2743 = _2741 + _2737;
    int _2745 = _2743 + 1;
    int _2747 = ~_2731;
    int _2749 = _2747 + 1;
    int _2751 = _2749 + 1;
    bool _2753 = _1360 == 0;
    int _2755 = _1360 * _2745;
    int _2757 = _2755 + _2453;
    int _2759 = ~_2727;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = _2751;
    int _2767 = _2763;
    if (_2733)
    {
        int _2769 = ~_2731;
        int _2771 = _2769 + 1;
        _2765 = _2771;
    }
    int _2773 = _2765;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2777 = _2775 != 0;
    bool _2779 = !_2753;
    int _2781 = _2779 ? _2757 : (-1);
    float _2783 = _2777 ? as_type<float>(_2575) : _2269;
    if (!_2739)
    {
        int _2785 = ~_2727;
        int _2787 = _2785 + 1;
        _2767 = _2787;
    }
    int _2789 = _2767;
    int _2791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2793 = _2791 != 0;
    int _2795 = _2781 & 3;
    bool _2797 = _2795 != 0;
    bool _2799 = !_2793;
    int _2801 = _2799 ? 0 : 1;
    bool _2803 = uint(_2795) >= 2u;
    int _2805 = _2797 ? 0 : 1;
    int _2807 = _2803 ? 0 : 1;
    bool _2809 = _2795 != 3;
    bool _2811 = uint(_2795) > 1u;
    int _2813 = ~_2807;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = ~_2805;
    int _2821 = _2819 + 1;
    int _2823 = _2821 + 1;
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2827 = _2825 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2829 = _2817;
    int _2831 = _2823;
    if (_2809)
    {
        int _2833 = ~_2807;
        int _2835 = _2833 + 1;
        _2829 = _2835;
    }
    int _2837 = _2829;
    float _2839 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2841 = _2839 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2811)
    {
        int _2843 = ~_2805;
        int _2845 = _2843 + 1;
        _2831 = _2845;
    }
    int _2847 = _2831;
    float _2849 = 1.0 / _2827;
    float _2851 = in.m_48.x;
    float _2853 = in.m_48.y;
    float _2855 = in.m_48.z;
    bool _2857 = _1547 > 0.5;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2863 = _2861 != 0;
    int _2865 = _2857 ? as_type<int>(_2353) : as_type<int>(_2269);
    float _2867 = _2863 ? as_type<float>(_2531) : _2269;
    float _2869 = 1.0 / _2841;
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2877 = _2875 != 0;
    float _2879 = _2873 ? as_type<float>(_2865) : _2269;
    float _2881 = _2877 ? as_type<float>(_2865) : _2269;
    bool _2883 = !_1645;
    float _2885 = _2883 ? as_type<float>(_1549) : as_type<float>(_1551);
    bool _2887 = !_1645;
    float _2889 = _2887 ? as_type<float>(_1553) : as_type<float>(_1549);
    float _2891 = _202 * _2853;
    float _2893 = _196 * _2853;
    float _2895 = _208 * _2853;
    float _2897 = fma(_200, _2851, _2891);
    float _2899 = fma(_194, _2851, _2893);
    float _2901 = fma(_206, _2851, _2895);
    if (!_1645)
    {
        _1729 = _1547;
    }
    float _2903 = _1729;
    float _2905 = fma(_204, _2855, _2897);
    float _2907 = fma(_198, _2855, _2899);
    float _2909 = 0.0;
    float _2911 = _2903;
    if (!_1645)
    {
        _2909 = _1547;
    }
    float _2913 = _2909;
    float _2915 = as_type<float>(_1549) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2917 = _2913;
    if (!_1645)
    {
        _1693 = _1220;
    }
    float _2919 = _1693;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2923 = 0.0;
    float _2925 = _2919;
    if (!_1645)
    {
        _2923 = _1220;
    }
    float _2927 = _2923;
    float _2929 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2931 = _2927;
    if (_1657)
    {
        _2461 = _1535;
    }
    float _2933 = _2461;
    float _2935 = fma(as_type<float>(_1549), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2921);
    float _2937 = _2933;
    if (_1645)
    {
        _2911 = _1220;
    }
    float _2939 = _2911;
    float _2941 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2943 = log2(_2941);
    if (_1645)
    {
        _2917 = _1220;
    }
    float _2945 = _2917;
    float _2947 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1657)
    {
        _2463 = _1220;
    }
    float _2949 = _2463;
    float _2951 = fma(_210, _2855, _2901);
    float _2953 = _2949;
    if (_1645)
    {
        _2925 = _1535;
    }
    float _2955 = _2925;
    float _2957 = fma(_2889, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1785);
    if (_1645)
    {
        _2931 = _1535;
    }
    float _2959 = _2931;
    float _2961 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1657)
    {
        _2937 = _1547;
    }
    float _2963 = _2937;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1657)
    {
        _2953 = _1535;
    }
    float _2967 = _2953;
    float _2969 = fma(_2961, -2.0, _1811);
    int _2971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2973 = _2971 != 0;
    int _2975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2977 = _2975 != 0;
    float _2979 = fma(as_type<float>(_1551), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2965);
    int _2981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2983 = _2981 != 0;
    float _2985 = _2943 * _164;
    float _2987 = as_type<float>(_1551) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2989 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2993 = exp2(_2985);
    float _2995 = _2973 ? as_type<float>(_2865) : _2269;
    float _2997 = fma(_2929, -2.0, _2991);
    bool _2999 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3007 = _3003 || _3005;
    float _3009 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3009;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3017 = _3011 * _2849;
    float _3019 = fma(_2915, -2.0, _3013);
    float _3021 = fma(_2959, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3015);
    float _3023 = _2963 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3027 = -_2993;
    float _3029 = _3027 + 1.0;
    float _3031 = -_3025;
    float _3033 = fma(_2947, 2.0, _3031);
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3037 = _3007 ? _3029 : 0.0;
    float _3039 = -_2859;
    float _3041 = fma(_3023, 2.0, _3039);
    float _3043 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3047 = -_3035;
    float _3049 = fma(_2987, 2.0, _3047);
    float _3051 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3043);
    float _3053 = _2939 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3057 = _3055 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3061 = fma(_3053, -2.0, _1789);
    float _3063 = _2977 ? as_type<float>(_2865) : _2269;
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3071 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3073 = _3071 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3075 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3077 = isnan(1.0);
    bool _3079 = _3075 || _3077;
    bool _3081 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3083 = _3079 || _3081;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3087 = 1.0 + _3085;
    float _3089 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3045);
    float _3091 = 1.0 / _3087;
    float _3093 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3059);
    float _3095 = _1535 * 2.0;
    float _3097 = fma(_2885, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3065);
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3105 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3107 = 1.0 / _3057;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3111 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3113 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3115 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3093);
    float _3117 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3099);
    float _3119 = -_3103;
    float _3121 = fma(_3105, 2.0, _3119);
    float _3123 = floor(_3095);
    float _3125 = -_3101;
    float _3127 = fma(_2989, 2.0, _3125);
    float _3129 = fma(_3111, -2.0, _3109);
    float _3131 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3113);
    float _3133 = _3069 * _2869;
    float _3135 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3139 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3117);
    float _3141 = 1.0 / _3073;
    float _3143 = -_164;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3049);
    float _3147 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3019);
    float _3149 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2997);
    float _3151 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3089);
    float _3153 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3131);
    float _3155 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2979);
    float _3157 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2935);
    float _3159 = -_164;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3033);
    float _3163 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3097);
    float _3165 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2957);
    float _3167 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3021);
    float _3169 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3051);
    float _3171 = -_164;
    float _3173 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3121);
    float _3175 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2969);
    float _3177 = -_164;
    float _3179 = fma(_3177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3127);
    float _3181 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3061);
    float _3183 = -_164;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3041);
    float _3187 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3129);
    if (_3083)
    {
        float _3189 = _3037 * _3091;
        _168 = _3189;
    }
    float _3191 = _168;
    float _3193 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3195 = _3193 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3197 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3199 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3197;
    float _3201 = 1.0 / _3137;
    float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3205 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3203;
    float _3207 = _3199 * _3107;
    bool _3209 = _3123 >= 0.0;
    bool _3211 = isnan(_3123);
    bool _3213 = _3209 || _3211;
    bool _3215 = isnan(0.0);
    bool _3217 = _3213 || _3215;
    float _3219 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3221 = _3219 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3223 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3227 = _3205 * _3141;
    float _3229 = float(uint(_1989));
    float _3231 = 1.0 / _3195;
    int _3233 = _3217 ? 0 : 1;
    float _3235 = in.m_57.w;
    bool _3237 = _3123 > 0.0;
    float _3239 = as_type<float>(_1406) * _3229;
    float _3241 = float(uint(_1965));
    float _3243 = _3225 * _3201;
    float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3249 = 1.0 / _3221;
    float _3251 = as_type<float>(_1384) * _3241;
    int _3253 = ~_1346;
    int _3255 = _3253 + 1;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3257;
    int _3261 = ~_1326;
    int _3263 = _3261 + 1;
    float _3265 = _3247 * _3231;
    int _3267 = ~_3233;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    float _3273 = trunc(_3239);
    float _3275 = precise::max(_3273, 0.0);
    uint _3277 = uint(_3275);
    int _3279 = _3271;
    if (!_3237)
    {
        int _3281 = ~_3233;
        int _3283 = _3281 + 1;
        _3279 = _3283;
    }
    int _3285 = _3279;
    float _3287 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3289 = _1208 + _3287;
    float _3291 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3293 = _1208 + _3291;
    bool _3295 = _2105 >= 0.0;
    bool _3297 = isnan(_2105);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan(0.0);
    bool _3303 = _3299 || _3301;
    float _3305 = fma(_3017, _3289, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3309 = _1208 + _3307;
    float _3311 = trunc(_3251);
    float _3313 = precise::max(_3311, 0.0);
    uint _3315 = uint(_3313);
    float _3317 = fma(_3133, _3293, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3319 = _3259 * _3249;
    float _3321 = fma(_3243, _3309, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3325 = _1208 + _3323;
    int _3327 = ~_1274;
    int _3329 = _3327 + 1;
    int _3331 = _3303 ? 0 : 1;
    int _3333 = _3255 * int(_3277);
    int _3335 = _3333 + _1989;
    float _3337 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3339 = _1208 + _3337;
    bool _3341 = _2105 > 0.0;
    float _3343 = float(uint(_2281));
    float _3345 = fma(_3207, _3339, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3347 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3349 = _1208 + _3347;
    int _3351 = ~_1360;
    int _3353 = _3351 + 1;
    int _3355 = _3329 * int(_3315);
    int _3357 = _3355 + _1965;
    float _3359 = as_type<float>(_1587) * _3343;
    float _3361 = fma(_3227, _3349, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3363 = fma(_3265, _3325, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3365 = float(uint(_3335));
    float _3367 = float(uint(_2091));
    float _3369 = trunc(_3359);
    float _3371 = precise::max(_3369, 0.0);
    uint _3373 = uint(_3371);
    float _3375 = float(uint(_3357));
    float _3377 = as_type<float>(_1406) * _3365;
    bool _3379 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3381 = isnan(_1208);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = as_type<float>(_1388) * _3367;
    bool _3393 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3395 = isnan(_1208);
    bool _3397 = _3393 || _3395;
    bool _3399 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3401 = _3397 || _3399;
    float _3403 = float(_3401);
    float _3405 = as_type<float>(_1384) * _3375;
    bool _3407 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3409 = isnan(_1208);
    bool _3411 = _3407 || _3409;
    bool _3413 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3415 = _3411 || _3413;
    float _3417 = float(_3415);
    float _3419 = -_3389;
    float _3421 = _3419 + 1.0;
    bool _3423 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3425 = isnan(_1208);
    bool _3427 = _3423 || _3425;
    bool _3429 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3431 = _3427 || _3429;
    float _3433 = float(_3431);
    float _3435 = trunc(_3391);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = _2585 & 3;
    bool _3443 = _3441 != 0;
    float _3445 = -_3417;
    float _3447 = _3445 + 1.0;
    float _3449 = _3417 * _3421;
    bool _3451 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3453 = isnan(_1208);
    bool _3455 = _3451 || _3453;
    bool _3457 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3459 = _3455 || _3457;
    float _3461 = float(_3459);
    float _3463 = _3403 * _3447;
    float _3465 = -_3403;
    float _3467 = _3465 + 1.0;
    float _3469 = trunc(_3405);
    float _3471 = precise::max(_3469, 0.0);
    uint _3473 = uint(_3471);
    bool _3475 = _2795 != 3;
    float _3477 = _3433 * _3467;
    float _3479 = -_3433;
    float _3481 = _3479 + 1.0;
    bool _3483 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3485 = isnan(_1208);
    bool _3487 = _3483 || _3485;
    bool _3489 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3491 = _3487 || _3489;
    float _3493 = float(_3491);
    bool _3495 = !_3475;
    int _3497 = _3495 ? 0 : (-1);
    int _3499 = _3263 * int(_3439);
    int _3501 = _3499 + _2091;
    float _3503 = _3461 * _3481;
    float _3505 = -_3461;
    float _3507 = _3505 + 1.0;
    bool _3509 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3511 = isnan(_1208);
    bool _3513 = _3509 || _3511;
    bool _3515 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3517 = _3513 || _3515;
    float _3519 = float(_3517);
    float _3521 = -_3493;
    float _3523 = _3521 + 1.0;
    float _3525 = float(uint(_3501));
    float _3527 = _3493 * _3507;
    bool _3529 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3531 = isnan(_1208);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3537 = _3533 || _3535;
    float _3539 = float(_3537);
    float _3541 = _3519 * _3523;
    float _3543 = -_3519;
    float _3545 = _3543 + 1.0;
    float _3547 = as_type<float>(_1388) * _3525;
    float _3549 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3551 = _1208 + _3549;
    float _3553 = _2907 + _3235;
    float _3555 = trunc(_3377);
    float _3557 = precise::max(_3555, 0.0);
    uint _3559 = uint(_3557);
    int _3561 = _3353 * int(_3373);
    int _3563 = _3561 + _2281;
    float _3565 = _3539 * _3545;
    float _3567 = fma(_3319, _3551, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3569 = _2905 + _1669;
    float _3571 = -_3539;
    float _3573 = _3571 + 1.0;
    float _3575 = float(uint(_3563));
    float _3577 = _3305 * _3565;
    float _3579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3581 = ~_3331;
    int _3583 = _3581 + 1;
    int _3585 = _3583 + 1;
    float _3587 = fma(_3573, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3577);
    float _3589 = as_type<float>(_1587) * _3575;
    float _3591 = _2951 + _1705;
    int _3593 = _3585;
    if (!_3341)
    {
        int _3595 = ~_3331;
        int _3597 = _3595 + 1;
        _3593 = _3597;
    }
    int _3599 = _3593;
    float _3601 = fma(_3317, _3541, _3587);
    float _3603 = trunc(_3547);
    float _3605 = precise::max(_3603, 0.0);
    uint _3607 = uint(_3605);
    int _3609 = ~_1274;
    int _3611 = _3609 + 1;
    int _3613 = int(_3315) + int(_3473);
    float _3615 = fma(_3345, _3527, _3601);
    int _3617 = ~_1346;
    int _3619 = _3617 + 1;
    int _3621 = int(_3277) + int(_3559);
    float _3623 = trunc(_3589);
    float _3625 = precise::max(_3623, 0.0);
    uint _3627 = uint(_3625);
    int _3629 = _3611 * _3613;
    int _3631 = _3629 + _1965;
    float _3633 = _3579 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3635 = !_2983;
    int _3637 = _3635 ? 0 : 1;
    float _3639 = fma(_3321, _3503, _3615);
    int _3641 = ~_1326;
    int _3643 = _3641 + 1;
    int _3645 = _3619 * _3621;
    int _3647 = _3645 + _1989;
    int _3649 = int(_3439) + int(_3607);
    float _3651 = fma(_3633, _1322, -0.5);
    bool _3653 = uint(_3631) >= uint(_1274);
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3657 = _3569 + _3655;
    int _3659 = ~_1360;
    int _3661 = _3659 + 1;
    int _3663 = _3643 * _3649;
    int _3665 = _3663 + _2091;
    bool _3667 = !_3653;
    int _3669 = _3667 ? 0 : (-1);
    float _3671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3673 = _3553 + _3671;
    bool _3675 = uint(_3647) >= uint(_1346);
    float _3677 = _1547 * 2.0;
    int _3679 = int(_3373) + int(_3627);
    float _3681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3683 = _3591 + _3681;
    float _3685 = fma(_3361, _3477, _3639);
    bool _3687 = !_3675;
    int _3689 = _3687 ? 0 : (-1);
    float _3691 = floor(_3677);
    bool _3693 = uint(_3665) >= uint(_1326);
    float _3695 = _3657 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3697 = _3661 * _3679;
    int _3699 = _3697 + _2281;
    int _3701 = ~_3613;
    int _3703 = _3701 + _3669;
    int _3705 = _3703 + 1;
    float _3707 = fma(_3363, _3463, _3685);
    float _3709 = fma(_3673, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3695);
    bool _3711 = !_3693;
    int _3713 = _3711 ? 0 : (-1);
    float _3715 = _1220 + _1547;
    bool _3717 = uint(_3699) >= uint(_1360);
    float _3719 = fma(_3683, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3709);
    int _3721 = ~_3621;
    int _3723 = _3721 + _3689;
    int _3725 = _3723 + 1;
    float _3727 = _1220 + _1535;
    bool _3729 = !_3717;
    int _3731 = _3729 ? 0 : (-1);
    float _3733 = fma(_3567, _3449, _3707);
    bool _3735 = _3719 >= 0.0;
    int _3737 = _1274 * _3705;
    int _3739 = _3737 + _1965;
    float _3741 = _3727 + (-1.0);
    int _3743 = _1346 * _3725;
    int _3745 = _3743 + _1989;
    bool _3747 = !_3443;
    int _3749 = _3747 ? 0 : 1;
    float _3751 = fma(_3389, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3733);
    float _3753 = fma(_3741, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3755 = _3657 * _3657;
    int _3757 = _2701 & 3;
    bool _3759 = _3757 != 0;
    float _3761 = _3715 + (-1.0);
    int _3763 = _2529 >> 31;
    float _3765 = fma(_3673, _3673, _3755);
    bool _3767 = !_3759;
    int _3769 = _3767 ? 0 : 1;
    float _3771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3773 = _2781 & 3;
    bool _3775 = _3773 != 0;
    float _3777 = fma(_3683, _3683, _3765);
    bool _3779 = !_2541;
    int _3781 = _3779 ? 0 : 1;
    out.m_75.x = _3751;
    bool _3783 = !_3775;
    int _3785 = _3783 ? 0 : 1;
    float _3787 = _1220 + (-0.5);
    bool _3789 = _2539 != 3;
    float _3791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3735)
    {
        out.m_51.x = 0.0;
    }
    bool _3793 = _3691 > 0.0;
    bool _3795 = _3691 >= 0.0;
    bool _3797 = isnan(_3691);
    bool _3799 = _3795 || _3797;
    bool _3801 = isnan(0.0);
    bool _3803 = _3799 || _3801;
    float _3805 = fma(_3761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3807 = _3691;
    if (_3735)
    {
        _3807 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3809 = _3807;
    float _3811 = rsqrt(_3777);
    int _3813 = _3763 & 3;
    int _3815 = _2585 >> 31;
    int _3817 = as_type<int>(_3809);
    if (_3735)
    {
        float _3819 = _3809 * 5.0;
        _3817 = as_type<int>(_3819);
    }
    int _3821 = _3817;
    int _3823 = _2529 + _3813;
    int _3825 = _2701 >> 31;
    int _3827 = _3823 >> 2;
    if (_3735)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12480 = as_type<float>(_3821);
        out.gl_Position.z = _12480;
    }
    int _3829 = _3815 & 3;
    int _3831 = _3825 & 3;
    int _3833 = _3827 << 4;
    int _3835 = _3833 + 368;
    float _3837 = _3657 * _3811;
    int _3839 = _2701 + _3831;
    float _3841 = _3673 * _3811;
    int _3843 = _2585 + _3829;
    float _3845 = -_3837;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3657);
    float _3849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3851 = _2781 >> 31;
    float _3853 = -_3841;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3673);
    float _3857 = _3847 * _3847;
    int _3859 = _3839 >> 2;
    float _3861 = _3683 * _3811;
    int _3863 = _3851 & 3;
    float _3865 = fma(_3855, _3855, _3857);
    uint _3867 = uint(int(uint(_3835) >> uint(2)));
    uint _3869 = uint(int(uint(int(_3867)) >> uint(2)));
    int _3871 = int(_3867) & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = int(_3867) + 1;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    int _3879 = _3875 & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = _3859 << 4;
    int _3885 = _3883 + 656;
    float _3887 = -_3861;
    float _3889 = fma(_3887, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3683);
    int _3891 = _2781 + _3863;
    bool _3893 = !_3789;
    int _3895 = _3893 ? 0 : (-1);
    int _3897 = _3891 >> 2;
    float _3899 = _3849 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3901 = uint(int(uint(_3885) >> uint(2)));
    uint _3903 = uint(int(uint(int(_3901)) >> uint(2)));
    int _3905 = int(_3901) & 3;
    float _3907 = (*spvDescriptorSet0.vp_c9)._m0[int(_3903)][_3905];
    int _3909 = int(_3901) + 1;
    uint _3911 = uint(int(uint(_3909) >> uint(2)));
    int _3913 = _3909 & 3;
    float _3915 = (*spvDescriptorSet0.vp_c9)._m0[int(_3911)][_3913];
    int _3917 = _3843 >> 2;
    bool _3919 = _2607 != 3;
    float _3921 = fma(_3899, _2995, -0.5);
    int _3923 = _3917 << 4;
    int _3925 = _3923 + 512;
    float _3927 = fma(_3889, _3889, _3865);
    bool _3929 = !_3919;
    int _3931 = _3929 ? 0 : (-1);
    float _3933 = -_3175;
    float _3935 = fma(_3165, _3921, _3933);
    bool _3937 = _2717 != 3;
    uint _3939 = uint(int(uint(_3925) >> uint(2)));
    uint _3941 = uint(int(uint(int(_3939)) >> uint(2)));
    int _3943 = int(_3939) & 3;
    float _3945 = (*spvDescriptorSet0.vp_c9)._m0[int(_3941)][_3943];
    int _3947 = int(_3939) + 1;
    uint _3949 = uint(int(uint(_3947) >> uint(2)));
    int _3951 = _3947 & 3;
    float _3953 = (*spvDescriptorSet0.vp_c9)._m0[int(_3949)][_3951];
    int _3955 = _3897 << 4;
    int _3957 = _3955 + 800;
    float _3959 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3961 = ~_3679;
    int _3963 = _3961 + _3731;
    int _3965 = _3963 + 1;
    float _3967 = _1727 * _3771;
    int _3969 = ~_3649;
    int _3971 = _3969 + _3713;
    int _3973 = _3971 + 1;
    float _3975 = _3959 * _3791;
    int _3977 = abs(_2605);
    float _3979 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3981 = int(_3979);
    bool _3983 = !_2517;
    int _3985 = _3983 ? _3739 : (-1);
    int _3987 = _3885 + 8;
    uint _3989 = uint(int(uint(_3987) >> uint(2)));
    uint _3991 = uint(int(uint(int(_3989)) >> uint(2)));
    int _3993 = int(_3989) & 3;
    float _3995 = (*spvDescriptorSet0.vp_c9)._m0[int(_3991)][_3993];
    int _3997 = int(_3989) + 1;
    uint _3999 = uint(int(uint(_3997) >> uint(2)));
    int _4001 = _3997 & 3;
    float _4003 = (*spvDescriptorSet0.vp_c9)._m0[int(_3999)][_4001];
    bool _4005 = !_2577;
    int _4007 = _4005 ? _3745 : (-1);
    out.m_77.x = _3967;
    out.m_77.y = _3975;
    int _4009 = _3803 ? 0 : 1;
    int _4011 = _1326 * _3973;
    int _4013 = _4011 + _2091;
    int _4015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4017 = _4015 != 0;
    int _4019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4021 = _4019 != 0;
    int _4023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4025 = _4023 != 0;
    int _4027 = _1360 * _3965;
    int _4029 = _4027 + _2281;
    int _4031 = ~_4009;
    int _4033 = _4031 + 1;
    int _4035 = _4033 + 1;
    uint _4037 = uint(int(uint(_3957) >> uint(2)));
    uint _4039 = uint(int(uint(int(_4037)) >> uint(2)));
    int _4041 = int(_4037) & 3;
    float _4043 = (*spvDescriptorSet0.vp_c9)._m0[int(_4039)][_4041];
    int _4045 = int(_4037) + 1;
    uint _4047 = uint(int(uint(_4045) >> uint(2)));
    int _4049 = _4045 & 3;
    float _4051 = (*spvDescriptorSet0.vp_c9)._m0[int(_4047)][_4049];
    int _4053 = _4035;
    if (!_3793)
    {
        int _4055 = ~_4009;
        int _4057 = _4055 + 1;
        _4053 = _4057;
    }
    int _4059 = _4053;
    float _4061 = fma(_3163, _3651, _3173);
    int _4063 = abs(_2697);
    float _4065 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4067 = int(_4065);
    int _4069 = ~_3977;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = abs(_2789);
    int _4077 = _3835 + 8;
    uint _4079 = uint(int(uint(_4077) >> uint(2)));
    uint _4081 = uint(int(uint(int(_4079)) >> uint(2)));
    int _4083 = int(_4079) & 3;
    float _4085 = (*spvDescriptorSet0.vp_c9)._m0[int(_4081)][_4083];
    int _4087 = int(_4079) + 1;
    uint _4089 = uint(int(uint(_4087) >> uint(2)));
    int _4091 = _4087 & 3;
    float _4093 = (*spvDescriptorSet0.vp_c9)._m0[int(_4089)][_4091];
    int _4095 = abs(_3769);
    int _4097 = _4073 * as_type<int>(_3881);
    int _4099 = abs(_3781);
    int _4101 = abs(_2847);
    int _4103 = _3925 + 8;
    uint _4105 = uint(int(uint(_4103) >> uint(2)));
    uint _4107 = uint(int(uint(int(_4105)) >> uint(2)));
    int _4109 = int(_4105) & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    int _4113 = int(_4105) + 1;
    uint _4115 = uint(int(uint(_4113) >> uint(2)));
    int _4117 = _4113 & 3;
    float _4119 = (*spvDescriptorSet0.vp_c9)._m0[int(_4115)][_4117];
    int _4121 = ~_4099;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = ~_4075;
    int _4129 = _4127 + 1;
    int _4131 = _4129 + 1;
    int _4133 = ~_4095;
    int _4135 = _4133 + 1;
    int _4137 = _4135 + 1;
    int _4139 = _3957 + 8;
    uint _4141 = uint(int(uint(_4139) >> uint(2)));
    uint _4143 = uint(int(uint(int(_4141)) >> uint(2)));
    int _4145 = int(_4141) & 3;
    float _4147 = (*spvDescriptorSet0.vp_c9)._m0[int(_4143)][_4145];
    int _4149 = int(_4141) + 1;
    uint _4151 = uint(int(uint(_4149) >> uint(2)));
    int _4153 = _4149 & 3;
    float _4155 = (*spvDescriptorSet0.vp_c9)._m0[int(_4151)][_4153];
    int _4157 = abs(_3749);
    int _4159 = _4131 * as_type<int>(_3915);
    int _4161 = abs(_2773);
    int _4163 = _4125 * as_type<int>(_3873);
    int _4165 = _4163 + _4097;
    int _4167 = abs(_2627);
    int _4169 = _4137 * as_type<int>(_3907);
    int _4171 = _4169 + _4159;
    int _4173 = abs(_3785);
    int _4175 = ~_4063;
    int _4177 = _4175 + 1;
    int _4179 = _4177 + 1;
    int _4181 = abs(_2683);
    int _4183 = _4179 * as_type<int>(_3953);
    int _4185 = ~_4161;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    float _4191 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4193 = int(_4191);
    int _4195 = ~_4101;
    int _4197 = _4195 + 1;
    int _4199 = _4197 + 1;
    int _4201 = ~_4173;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = _4189 * as_type<int>(_3995);
    int _4209 = _4207 + _4171;
    int _4211 = ~_4157;
    int _4213 = _4211 + 1;
    int _4215 = _4213 + 1;
    int _4217 = _4199 * as_type<int>(_4051);
    int _4219 = ~_4167;
    int _4221 = _4219 + 1;
    int _4223 = _4221 + 1;
    int _4225 = _4215 * as_type<int>(_3945);
    int _4227 = _4225 + _4183;
    int _4229 = abs(_3895);
    int _4231 = _4205 * as_type<int>(_4043);
    int _4233 = _4231 + _4217;
    int _4235 = ~_4181;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4243 = int(_4241);
    int _4245 = abs(_2837);
    int _4247 = _4223 * as_type<int>(_4085);
    int _4249 = _4247 + _4165;
    bool _4251 = !_3937;
    int _4253 = _4251 ? 0 : (-1);
    int _4255 = ~_4229;
    int _4257 = _4255 + 1;
    int _4259 = _4257 + 1;
    int _4261 = ~_4245;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    int _4267 = abs(_3931);
    int _4269 = _4239 * as_type<int>(_4111);
    int _4271 = _4269 + _4227;
    int _4273 = abs(_4253);
    int _4275 = _4259 * as_type<int>(_4093);
    int _4277 = _4275 + _4249;
    float _4279 = float(uint(_4067));
    int _4281 = ~_4267;
    int _4283 = _4281 + 1;
    int _4285 = _4283 + 1;
    int _4287 = abs(_3497);
    int _4289 = _4265 * as_type<int>(_4147);
    int _4291 = _4289 + _4233;
    float _4293 = float(uint(_3981));
    float _4295 = 1.0 / _4279;
    int _4297 = ~_4273;
    int _4299 = _4297 + 1;
    int _4301 = _4299 + 1;
    int _4303 = _4285 * as_type<int>(_4119);
    int _4305 = _4303 + _4271;
    int _4307 = abs(_2707);
    int _4309 = ~_4287;
    int _4311 = _4309 + 1;
    int _4313 = _4311 + 1;
    int _4315 = _4301 * as_type<int>(_4003);
    int _4317 = _4315 + _4209;
    int _4319 = abs(_4067);
    float _4321 = 1.0 / _4293;
    int _4323 = abs(_2723);
    int _4325 = _4313 * as_type<int>(_4155);
    int _4327 = _4325 + _4291;
    int _4329 = ~_4307;
    int _4331 = _4329 + 1;
    int _4333 = _4331 + 1;
    float _4335 = float(uint(_4193));
    float _4337 = float(uint(_4319));
    int _4339 = _4277 * _4333;
    int _4341 = abs(_4193);
    int _4343 = ~_4323;
    int _4345 = _4343 + 1;
    int _4347 = _4345 + 1;
    float _4349 = 1.0 / _4337;
    int _4351 = _3985 * _4307;
    int _4353 = _4351 + _4339;
    int _4355 = abs(_2801);
    int _4357 = _4347 * _4305;
    float _4359 = float(uint(_4243));
    int _4361 = abs(_3981);
    float _4363 = 1.0 / _4335;
    int _4365 = abs(_4243);
    int _4367 = _4007 * _4323;
    int _4369 = _4367 + _4357;
    int _4371 = ~_4355;
    int _4373 = _4371 + 1;
    int _4375 = _4373 + 1;
    bool _4377 = _1326 == 0;
    int _4379 = _4375 * _4317;
    int _4381 = as_type<int>(_4295) + (-2);
    float _4383 = 1.0 / _4359;
    float _4385 = float(uint(_4353));
    float _4387 = float(uint(_4341));
    float _4389 = float(uint(_4361));
    float _4391 = as_type<float>(_4381) * _4385;
    int _4393 = abs(_3637);
    float _4395 = 1.0 / _4387;
    bool _4397 = !_4377;
    int _4399 = _4397 ? _4013 : (-1);
    int _4401 = as_type<int>(_4321) + (-2);
    float _4403 = float(uint(_4369));
    bool _4405 = _1360 == 0;
    float _4407 = 1.0 / _4389;
    int _4409 = ~_4393;
    int _4411 = _4409 + 1;
    int _4413 = _4411 + 1;
    float _4415 = as_type<float>(_4401) * _4403;
    bool _4417 = !_4405;
    int _4419 = _4417 ? _4029 : (-1);
    int _4421 = as_type<int>(_4363) + (-2);
    int _4423 = _4413 * _4327;
    float _4425 = float(uint(_4365));
    float _4427 = trunc(_4391);
    float _4429 = precise::max(_4427, 0.0);
    uint _4431 = uint(_4429);
    int _4433 = _4399 * _4355;
    int _4435 = _4433 + _4379;
    int _4437 = abs(_4353);
    int _4439 = _4419 * _4393;
    int _4441 = _4439 + _4423;
    int _4443 = abs(_4369);
    float _4445 = _4061 + 0.5;
    float _4447 = float(uint(_4435));
    float _4449 = trunc(_4415);
    float _4451 = precise::max(_4449, 0.0);
    uint _4453 = uint(_4451);
    int _4455 = as_type<int>(_4383) + (-2);
    float _4457 = as_type<float>(_4421) * _4447;
    float _4459 = float(uint(_4441));
    int _4461 = as_type<int>(_4349) + (-2);
    float _4463 = 1.0 / _4425;
    float _4465 = float(uint(_4437));
    float _4467 = as_type<float>(_4455) * _4459;
    int _4469 = ~_4067;
    int _4471 = _4469 + 1;
    float _4473 = _3935 + 0.5;
    int _4475 = as_type<int>(_4407) + (-2);
    float _4477 = as_type<float>(_4461) * _4465;
    int _4479 = ~_3981;
    int _4481 = _4479 + 1;
    float _4483 = trunc(_4457);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    int _4489 = _4471 * int(_4431);
    int _4491 = _4489 + _4353;
    out.m_79.x = _4445;
    out.m_79.y = _4473;
    int _4493 = abs(_4435);
    int _4495 = as_type<int>(_4395) + (-2);
    float _4497 = float(uint(_4491));
    float _4499 = trunc(_4467);
    float _4501 = precise::max(_4499, 0.0);
    uint _4503 = uint(_4501);
    float _4505 = float(uint(_4443));
    int _4507 = as_type<int>(_4463) + (-2);
    bool _4509 = !_4021;
    int _4511 = _4509 ? 0 : 1;
    float _4513 = as_type<float>(_4475) * _4505;
    int _4515 = _4481 * int(_4453);
    int _4517 = _4515 + _4369;
    bool _4519 = !_4017;
    int _4521 = _4519 ? 0 : 1;
    float _4523 = trunc(_4477);
    float _4525 = precise::max(_4523, 0.0);
    uint _4527 = uint(_4525);
    int _4529 = abs(_4441);
    float _4531 = as_type<float>(_4381) * _4497;
    float _4533 = float(uint(_4517));
    float _4535 = float(uint(_4529));
    float _4537 = in.m_81.x;
    float _4539 = in.m_81.y;
    float _4541 = in.m_81.z;
    float _4543 = float(uint(_4493));
    float _4545 = as_type<float>(_4401) * _4533;
    float _4547 = trunc(_4513);
    float _4549 = precise::max(_4547, 0.0);
    uint _4551 = uint(_4549);
    float _4553 = as_type<float>(_4507) * _4535;
    int _4555 = abs(_4511);
    float _4557 = as_type<float>(_4495) * _4543;
    int _4559 = abs(_4521);
    int _4561 = ~_4243;
    int _4563 = _4561 + 1;
    float _4565 = trunc(_4557);
    float _4567 = precise::max(_4565, 0.0);
    uint _4569 = uint(_4567);
    float _4571 = float(_3285);
    float _4573 = float(_4555);
    int _4575 = _4563 * int(_4503);
    int _4577 = _4575 + _4441;
    int _4579 = ~_4193;
    int _4581 = _4579 + 1;
    int _4583 = ~_4319;
    int _4585 = _4583 + 1;
    float _4587 = _4573 * _4571;
    float _4589 = float(_4059);
    int _4591 = _4581 * int(_4487);
    int _4593 = _4591 + _4435;
    float _4595 = float(_4559);
    float _4597 = trunc(_4553);
    float _4599 = precise::max(_4597, 0.0);
    uint _4601 = uint(_4599);
    float _4603 = float(uint(_4577));
    float _4605 = _4595 * _4589;
    float _4607 = float(uint(_4593));
    int _4609 = _4585 * int(_4527);
    int _4611 = _4609 + _4437;
    int _4613 = ~_4361;
    int _4615 = _4613 + 1;
    float _4617 = _4605 * (-2.0);
    float _4619 = as_type<float>(_4455) * _4603;
    float _4621 = as_type<float>(_4421) * _4607;
    float _4623 = float(uint(_4611));
    int _4625 = _4615 * int(_4551);
    int _4627 = _4625 + _4443;
    int _4629 = ~_4341;
    int _4631 = _4629 + 1;
    float _4633 = trunc(_4531);
    float _4635 = precise::max(_4633, 0.0);
    uint _4637 = uint(_4635);
    float _4639 = fma(_3753, _4617, _3753);
    float _4641 = fma(_4617, _4537, _4537);
    float _4643 = as_type<float>(_4461) * _4623;
    float _4645 = _1535 + (-0.5);
    float _4647 = float(uint(_4627));
    int _4649 = _4631 * int(_4569);
    int _4651 = _4649 + _4493;
    int _4653 = ~_3981;
    int _4655 = _4653 + 1;
    float _4657 = trunc(_4619);
    float _4659 = precise::max(_4657, 0.0);
    uint _4661 = uint(_4659);
    int _4663 = ~_4365;
    int _4665 = _4663 + 1;
    float _4667 = fma(_4645, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4641);
    float _4669 = as_type<float>(_4475) * _4647;
    float _4671 = float(uint(_4651));
    float _4673 = fma(_4639, _3191, _4667);
    float _4675 = trunc(_4621);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    float _4681 = as_type<float>(_4495) * _4671;
    int _4683 = int(_4431) + int(_4637);
    int _4685 = _4665 * int(_4601);
    int _4687 = _4685 + _4529;
    int _4689 = ~_4067;
    int _4691 = _4689 + 1;
    int _4693 = ~_4243;
    int _4695 = _4693 + 1;
    float _4697 = trunc(_4545);
    float _4699 = precise::max(_4697, 0.0);
    uint _4701 = uint(_4699);
    int _4703 = int(_4503) + int(_4661);
    int _4705 = _4691 * _4683;
    int _4707 = _4705 + _4353;
    float _4709 = float(uint(_4687));
    bool _4711 = _4243 == 0;
    bool _4713 = uint(_4707) >= uint(_4067);
    float _4715 = trunc(_4669);
    float _4717 = precise::max(_4715, 0.0);
    uint _4719 = uint(_4717);
    int _4721 = int(_4487) + int(_4679);
    float _4723 = as_type<float>(_4507) * _4709;
    bool _4725 = !_4025;
    int _4727 = _4725 ? 0 : 1;
    float _4729 = trunc(_4643);
    float _4731 = precise::max(_4729, 0.0);
    uint _4733 = uint(_4731);
    int _4735 = ~_4193;
    int _4737 = _4735 + 1;
    int _4739 = int(_4453) + int(_4701);
    int _4741 = _4737 * _4721;
    int _4743 = _4741 + _4435;
    float _4745 = trunc(_4681);
    float _4747 = precise::max(_4745, 0.0);
    uint _4749 = uint(_4747);
    int _4751 = int(_4551) + int(_4719);
    int _4753 = _4655 * _4739;
    int _4755 = _4753 + _4369;
    int _4757 = ~_4319;
    int _4759 = _4757 + 1;
    int _4761 = _4695 * _4703;
    int _4763 = _4761 + _4441;
    bool _4765 = uint(_4743) >= uint(_4193);
    int _4767 = ~_4361;
    int _4769 = _4767 + 1;
    float _4771 = trunc(_4723);
    float _4773 = precise::max(_4771, 0.0);
    uint _4775 = uint(_4773);
    int _4777 = int(_4527) + int(_4733);
    int _4779 = ~_4341;
    int _4781 = _4779 + 1;
    int _4783 = _4769 * _4751;
    int _4785 = _4783 + _4443;
    bool _4787 = uint(_4755) >= uint(_3981);
    int _4789 = _4759 * _4777;
    int _4791 = _4789 + _4437;
    bool _4793 = uint(_4763) >= uint(_4243);
    float _4795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4797 = int(_4569) + int(_4749);
    int _4799 = ~_4365;
    int _4801 = _4799 + 1;
    int _4803 = _4781 * _4797;
    int _4805 = _4803 + _4493;
    bool _4807 = !_4713;
    int _4809 = _4807 ? 0 : (-1);
    bool _4811 = uint(_4791) >= uint(_4319);
    bool _4813 = !_4787;
    int _4815 = _4813 ? 0 : (-1);
    bool _4817 = uint(_4785) >= uint(_4361);
    bool _4819 = !_4765;
    int _4821 = _4819 ? 0 : (-1);
    float _4823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4825 = uint(_4805) >= uint(_4341);
    bool _4827 = !_4793;
    int _4829 = _4827 ? 0 : (-1);
    int _4831 = ~_4683;
    int _4833 = _4831 + _4809;
    int _4835 = _4833 + 1;
    int _4837 = int(_4601) + int(_4775);
    int _4839 = ~_4739;
    int _4841 = _4839 + _4815;
    int _4843 = _4841 + 1;
    int _4845 = _4067 * _4835;
    int _4847 = _4845 + _4353;
    int _4849 = ~_4703;
    int _4851 = _4849 + _4829;
    int _4853 = _4851 + 1;
    float _4855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4857 = ~_4721;
    int _4859 = _4857 + _4821;
    int _4861 = _4859 + 1;
    int _4863 = _4801 * _4837;
    int _4865 = _4863 + _4529;
    bool _4867 = !_4811;
    int _4869 = _4867 ? 0 : (-1);
    int _4871 = _3981 * _4843;
    int _4873 = _4871 + _4369;
    bool _4875 = _4067 == 0;
    int _4877 = _4193 * _4861;
    int _4879 = _4877 + _4435;
    int _4881 = _4353 ^ _4067;
    float _4883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4885 = !_4825;
    int _4887 = _4885 ? 0 : (-1);
    int _4889 = _4243 * _4853;
    int _4891 = _4889 + _4441;
    bool _4893 = _3981 == 0;
    bool _4895 = !_4875;
    int _4897 = _4895 ? _4847 : (-1);
    bool _4899 = _4193 == 0;
    float _4901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4903 = uint(int(uint(_4881) >> uint(31)));
    bool _4905 = uint(_4865) >= uint(_4365);
    bool _4907 = !_4893;
    int _4909 = _4907 ? _4873 : (-1);
    float _4911 = _4795 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4913 = !_4899;
    int _4915 = _4913 ? _4879 : (-1);
    int _4917 = ~_4869;
    int _4919 = _4777 + _4917;
    int _4921 = _4919 + 1;
    float _4923 = fma(_4911, _1733, -0.5);
    float _4925 = float(_4897);
    float _4927 = _4883 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4929 = ~int(_4903);
    int _4931 = _4929 + 1;
    bool _4933 = !_4711;
    int _4935 = _4933 ? _4891 : (-1);
    float _4937 = fma(_4911, _4925, _3161);
    int _4939 = _4369 ^ _3981;
    float _4941 = _4855 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4943 = _4193 == 0;
    float _4945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4947 = _4435 ^ _4193;
    float _4949 = _4823 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4951 = _4441 ^ _4243;
    float _4953 = fma(_4941, _2501, -0.5);
    float _4955 = float(_4909);
    float _4957 = fma(_4949, _1827, -0.5);
    int _4959 = _4921 ^ _4931;
    float _4961 = fma(_4927, _1663, -0.5);
    float _4963 = float(_4935);
    float _4965 = fma(_4949, _4955, _3179);
    bool _4967 = !_4817;
    int _4969 = _4967 ? 0 : (-1);
    float _4971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4973 = !_4905;
    int _4975 = _4973 ? 0 : (-1);
    float _4977 = fma(_4941, _4963, _3145);
    uint _4979 = uint(int(uint(_4939) >> uint(31)));
    float _4981 = fma(_3167, _4957, _4965);
    uint _4983 = uint(int(uint(_4947) >> uint(31)));
    float _4985 = fma(_3139, _4923, _4937);
    uint _4987 = uint(int(uint(_4951) >> uint(31)));
    float _4989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4991 = _4067 == 0;
    float _4993 = fma(_3155, _4953, _4977);
    int _4995 = ~_4931;
    int _4997 = _4995 + _4959;
    int _4999 = _4997 + 1;
    bool _5001 = _4243 == 0;
    int _5003 = ~_4969;
    int _5005 = _4751 + _5003;
    int _5007 = _5005 + 1;
    int _5009 = ~_4887;
    int _5011 = _4797 + _5009;
    int _5013 = _5011 + 1;
    int _5015 = ~_4975;
    int _5017 = _4837 + _5015;
    int _5019 = _5017 + 1;
    int _5021 = ~int(_4979);
    int _5023 = _5021 + 1;
    int _5025 = ~int(_4983);
    int _5027 = _5025 + 1;
    float _5029 = _4989 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5031 = ~int(_4987);
    int _5033 = _5031 + 1;
    float _5035 = float(_4915);
    float _5037 = fma(_5029, _2879, -0.5);
    bool _5039 = !_4991;
    int _5041 = _5039 ? _4999 : (-1);
    int _5043 = _5007 ^ _5023;
    float _5045 = fma(_4927, _5035, _3185);
    int _5047 = _5013 ^ _5027;
    float _5049 = _4901 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5051 = _5019 ^ _5033;
    float _5053 = _4945 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5055 = float(_5041);
    float _5057 = fma(_5049, _2783, -0.5);
    bool _5059 = _3981 == 0;
    float _5061 = _4971 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5063 = ~_5023;
    int _5065 = _5063 + _5043;
    int _5067 = _5065 + 1;
    float _5069 = -_3149;
    float _5071 = fma(_5049, _5055, _5069);
    int _5073 = ~_5027;
    int _5075 = _5073 + _5047;
    int _5077 = _5075 + 1;
    float _5079 = fma(_5053, _2867, -0.5);
    int _5081 = ~_5033;
    int _5083 = _5081 + _5051;
    int _5085 = _5083 + 1;
    float _5087 = fma(_3153, _4961, _5045);
    bool _5089 = !_5059;
    int _5091 = _5089 ? _5067 : (-1);
    float _5093 = fma(_3115, _5057, _5071);
    bool _5095 = !_4943;
    int _5097 = _5095 ? _5077 : (-1);
    float _5099 = _5087 + 0.5;
    bool _5101 = !_5001;
    int _5103 = _5101 ? _5085 : (-1);
    float _5105 = float(_5091);
    float _5107 = float(_5097);
    float _5109 = fma(_5061, _2881, -0.5);
    float _5111 = float(_5103);
    float _5113 = -_3181;
    float _5115 = fma(_5053, _5105, _5113);
    float _5117 = _4587 * (-2.0);
    float _5119 = -_3187;
    float _5121 = fma(_5061, _5107, _5119);
    float _5123 = _4993 + 0.5;
    float _5125 = -_3147;
    float _5127 = fma(_5029, _5111, _5125);
    float _5129 = fma(_3169, _5079, _5115);
    float _5131 = fma(_3151, _5109, _5121);
    float _5133 = _4985 + 0.5;
    float _5135 = fma(_3157, _5037, _5127);
    float _5137 = _4981 + 0.5;
    float _5139 = _5093 + 0.5;
    float _5141 = _5129 + 0.5;
    float _5143 = _5131 + 0.5;
    float _5145 = _5135 + 0.5;
    float _5147 = fma(_3805, _5117, _3805);
    float _5149 = fma(_5117, _4539, _4539);
    out.m_83.x = _5133;
    out.m_83.y = _5139;
    out.m_83.z = _5137;
    out.m_83.w = _5141;
    out.m_85.x = _5099;
    out.m_85.y = _5143;
    out.m_87.x = _5123;
    out.m_87.y = _5145;
    int _5151 = as_type<int>(_5137);
    if (_3735)
    {
        return out;
    }
    float _5153 = -_3837;
    float _5155 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3569);
    float _5157 = -_3841;
    float _5159 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3553);
    float _5161 = -_3861;
    float _5163 = fma(_5161, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3591);
    int _5165 = abs(_4727);
    float _5167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5169 = _5155 + _5167;
    float _5171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5173 = _5159 + _5171;
    float _5175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5177 = _5163 + _5175;
    float _5179 = float(_3599);
    float _5181 = _5169 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5183 = float(_5165);
    float _5185 = _1535 + _1547;
    float _5187 = fma(_3787, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5149);
    float _5189 = fma(_5173, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5181);
    float _5191 = _1547 + (-0.5);
    float _5193 = _5183 * _5179;
    float _5195 = _5185 + (-1.0);
    float _5197 = fma(_5177, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5189);
    float _5199 = fma(_5147, _3191, _5187);
    float _5201 = _5193 * (-2.0);
    float _5203 = _4673 * 0.15915493667125701904296875;
    float _5205 = sqrt(_3927);
    bool _5207 = _5197 >= 0.0;
    float _5209 = fma(_5201, _4541, _4541);
    float _5211 = _5199 * 0.15915493667125701904296875;
    float _5213 = fma(_5191, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5209);
    float _5215 = fma(_5195, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5217 = _5203 * 6.283185482025146484375;
    float _5219 = sin(_5217);
    float _5221 = fma(_5215, _5201, _5215);
    float _5223 = _5193;
    float _5225 = _5159;
    float _5227 = _5177;
    if (_5207)
    {
        _5223 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5229 = _5223;
    if (_5207)
    {
        out.m_51.x = 0.0;
    }
    float _5231 = fma(_5221, _3191, _5213);
    float _5233 = _5211 * 6.283185482025146484375;
    float _5235 = sin(_5233);
    if (_5207)
    {
        float _5237 = _5229 * 5.0;
        _5151 = as_type<int>(_5237);
    }
    int _5239 = _5151;
    float _5241 = _5231 * 0.15915493667125701904296875;
    if (_5207)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14475 = as_type<float>(_5239);
        out.gl_Position.z = _14475;
    }
    float _5243 = _5203 * 6.283185482025146484375;
    float _5245 = cos(_5243);
    float _5247 = _5211 * 6.283185482025146484375;
    float _5249 = cos(_5247);
    float _5251 = _5219 * _5235;
    float _5253 = _5241 * 6.283185482025146484375;
    float _5255 = sin(_5253);
    if (_5207)
    {
        return out;
    }
    float _5257 = -_3569;
    float _5259 = _5257 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5261 = -_3553;
    float _5263 = _5261 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5265 = in.m_89.x;
    float _5267 = in.m_89.y;
    float _5269 = in.m_89.z;
    float _5271 = -_3591;
    float _5273 = _5271 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5275 = _5259 * _5259;
    float _5277 = _5241 * 6.283185482025146484375;
    float _5279 = cos(_5277);
    float _5281 = _5245 * _5249;
    float _5283 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5285 = fma(_5263, _5263, _5275);
    float _5287 = fma(_5255, _5281, _5251);
    float _5289 = fma(_5255, _5251, _5281);
    float _5291 = fma(_5273, _5273, _5285);
    float _5293 = _3811 * _5205;
    float _5295 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5297 = _5245 * _5235;
    float _5299 = rsqrt(_5291);
    float _5301 = _5219 * _5249;
    float _5303 = _5245 * _5279;
    float _5305 = _5249 * _5279;
    float _5307 = _5219 * _5279;
    float _5309 = _5235 * _5279;
    float _5311 = _5293 * _5295;
    float _5313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5265);
    float _5315 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5317 = _5293 * _5283;
    float _5319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5267);
    float _5321 = _5313 * _5311;
    float _5323 = -_5297;
    float _5325 = fma(_5255, _5301, _5323);
    float _5327 = _5263 * _5299;
    float _5329 = -_5301;
    float _5331 = fma(_5255, _5297, _5329);
    float _5333 = _5293 * _5315;
    float _5335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5269);
    float _5337 = _5273 * _5299;
    float _5339 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5341 = _5327 * _5339;
    float _5343 = _5319 * _5317;
    float _5345 = _5335 * _5333;
    float _5347 = in.m_91.x;
    float _5349 = in.m_91.y;
    float _5351 = in.m_91.z;
    float _5353 = _5259 * _5299;
    float _5355 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5357 = _5337 * _5355;
    float _5359 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5361 = -_5341;
    float _5363 = fma(_5337, _5359, _5361);
    bool _5365 = _5267 != 0.0;
    bool _5367 = isnan(_5267);
    bool _5369 = _5365 || _5367;
    bool _5371 = isnan(0.0);
    bool _5373 = _5369 || _5371;
    float _5375 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5377 = _5353 * _5375;
    float _5379 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5381 = -_5357;
    float _5383 = fma(_5353, _5379, _5381);
    float _5385 = _5363 * _5363;
    bool _5387 = _5265 == 0.0;
    bool _5389 = !_5373;
    bool _5391 = _5387 && _5389;
    float _5393 = in.m_93.x;
    float _5395 = in.m_93.y;
    float _5397 = in.m_93.z;
    float _5399 = in.m_93.w;
    float _5401 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5403 = -_5377;
    float _5405 = fma(_5327, _5401, _5403);
    float _5407 = fma(_5383, _5383, _5385);
    bool _5409 = _5269 == 0.0;
    bool _5411 = _5409 && _5391;
    float _5413 = -_5343;
    float _5415 = _5255 * _5413;
    float _5417 = _5303 * _5343;
    float _5419 = fma(_5405, _5405, _5407);
    float _5421 = _5307 * _5343;
    float _5423 = fma(_5305, _5321, _5415);
    float _5425 = fma(_5287, _5321, _5417);
    float _5427 = fma(_5325, _5321, _5421);
    float _5429 = rsqrt(_5419);
    float _5431 = fma(_5309, _5345, _5423);
    float _5433 = fma(_5331, _5345, _5425);
    float _5435 = fma(_5289, _5345, _5427);
    float _5437 = _5321;
    float _5439 = _5415;
    float _5441 = _5417;
    float _5443 = _5263;
    float _5445 = _5347;
    float _5447 = _5289;
    if (_5411)
    {
        _5437 = _5347;
    }
    float _5449 = _5437;
    float _5451 = _5449;
    if (_5411)
    {
        _5439 = _5351;
    }
    float _5453 = _5439;
    float _5455 = _5453;
    if (_5411)
    {
        _5441 = _5449;
    }
    float _5457 = _5441;
    float _5459 = _5457;
    if (!_5411)
    {
        _5451 = _5347;
    }
    float _5461 = _5451;
    if (_5411)
    {
        _5443 = _5349;
    }
    float _5463 = _5443;
    float _5465 = _5463;
    if (!_5411)
    {
        float _5467 = fma(_5267, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5349);
        _5465 = _5467;
    }
    float _5469 = _5465;
    if (_5411)
    {
        _5445 = _5453;
    }
    float _5471 = _5445;
    float _5473 = _5397 * _5461;
    float _5475 = _5471;
    if (!_5411)
    {
        _5455 = _5351;
    }
    float _5477 = _5455;
    float _5479 = _5383 * _5429;
    float _5481 = _5363 * _5429;
    if (!_5411)
    {
        float _5483 = fma(_5265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5461);
        _5459 = _5483;
    }
    float _5485 = _5459;
    float _5487 = _5393 * _5349;
    float _5489 = -_5473;
    float _5491 = fma(_5393, _5477, _5489);
    float _5493 = _5395 * _5477;
    float _5495 = _5405 * _5429;
    float _5497 = _5337 * _5481;
    float _5499 = _5353 * _5479;
    if (!_5411)
    {
        float _5501 = fma(_5269, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5477);
        _5475 = _5501;
    }
    float _5503 = _5475;
    float _5505 = -_5493;
    float _5507 = fma(_5397, _5349, _5505);
    float _5509 = -_5487;
    float _5511 = fma(_5395, _5461, _5509);
    float _5513 = -_5497;
    float _5515 = fma(_5353, _5495, _5513);
    float _5517 = -_5499;
    float _5519 = fma(_5327, _5481, _5517);
    float _5521 = _5491 * _5399;
    float _5523 = _5507 * _5399;
    float _5525 = _5515 * _5433;
    float _5527 = _5519 * _5433;
    float _5529 = _5511 * _5399;
    float _5531 = _5327 * _5495;
    float _5533 = fma(_5479, _5431, _5525);
    float _5535 = fma(_5495, _5431, _5527);
    float _5537 = _5287 * _5515;
    float _5539 = -_5531;
    float _5541 = fma(_5337, _5479, _5539);
    float _5543 = fma(_5327, _5435, _5533);
    float _5545 = fma(_5337, _5435, _5535);
    float _5547 = _5287 * _5519;
    float _5549 = _5287 * _5541;
    float _5551 = _3553 + _5543;
    float _5553 = _3591 + _5545;
    float _5555 = _5541 * _5433;
    float _5557 = fma(_5305, _5481, _5549);
    float _5559 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5561 = _5551 + _5559;
    float _5563 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5565 = _5553 + _5563;
    float _5567 = _5303 * _5515;
    float _5569 = _5303 * _5541;
    float _5571 = _5561 * _5561;
    float _5573 = _5565 * _5565;
    float _5575 = _5303 * _5519;
    float _5577 = _5331 * _5515;
    float _5579 = _5331 * _5519;
    float _5581 = _5571 + _5573;
    float _5583 = _5331 * _5541;
    float _5585 = fma(_5309, _5479, _5577);
    float _5587 = -_5255;
    float _5589 = fma(_5587, _5481, _5569);
    float _5591 = sqrt(_5581);
    float _5593 = fma(_5309, _5481, _5583);
    float _5595 = fma(_5481, _5431, _5555);
    float _5597 = -_5255;
    float _5599 = fma(_5597, _5479, _5567);
    float _5601 = -_5255;
    float _5603 = fma(_5601, _5495, _5575);
    float _5605 = fma(_5305, _5479, _5537);
    float _5607 = fma(_5353, _5435, _5595);
    float _5609 = fma(_5305, _5495, _5547);
    float _5611 = fma(_5309, _5495, _5579);
    float _5613 = fma(_5307, _5327, _5599);
    float _5615 = fma(_5307, _5353, _5589);
    float _5617 = fma(_5307, _5337, _5603);
    float _5619 = _3569 + _5607;
    float _5621 = fma(_5325, _5327, _5605);
    float _5623 = fma(_5325, _5353, _5557);
    float _5625 = fma(_5325, _5337, _5609);
    bool _5627 = _5591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5629 = fma(_5289, _5337, _5611);
    float _5631 = _5613 * _5395;
    float _5633 = _5615 * _5395;
    float _5635 = _5617 * _5395;
    float _5637 = _5615 * _5469;
    float _5639 = fma(_5289, _5327, _5585);
    float _5641 = fma(_5289, _5353, _5593);
    float _5643 = _5613 * _5469;
    float _5645 = _5521 * _5613;
    float _5647 = _5521 * _5615;
    float _5649 = _5521 * _5617;
    float _5651 = _5617 * _5469;
    float _5653 = _5557;
    float _5655 = _5613;
    float _5657 = _5585;
    float _5659 = _5521;
    float _5661 = _5529;
    if (!_5627)
    {
        _5653 = _5573;
    }
    float _5663 = _5653;
    float _5665 = _5663;
    if (!_5627)
    {
        _5655 = _5571;
    }
    float _5667 = _5655;
    float _5669 = _5667;
    if (!_5627)
    {
        _5447 = _5551;
    }
    float _5671 = _5447;
    float _5673 = _5671;
    if (!_5627)
    {
        _5657 = _5553;
    }
    float _5675 = _5657;
    float _5677 = _5675;
    if (!_5627)
    {
        _5659 = _5619;
    }
    float _5679 = _5659;
    bool _5681 = !_5627;
    float _5683 = _5679;
    if (!_5681)
    {
        float _5685 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5689 = _5591 + _5687;
        float _5691 = rsqrt(_5581);
        float _5693 = _5689 * _5685;
        float _5695 = _5619 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5697 = _5693 * 0.15915493667125701904296875;
        float _5699 = _5697 * 6.283185482025146484375;
        float _5701 = sin(_5699);
        float _5703 = _5697 * 6.283185482025146484375;
        float _5705 = cos(_5703);
        float _5707 = fma(_5701, _5695, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5709 = _5691 * _5707;
        float _5711 = _5705 + (-1.0);
        float _5713 = fma(_5561, _5709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5715 = fma(_5565, _5709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5717 = _5711 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5721 = _5713 + _5719;
        float _5723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5725 = _5715 + _5723;
        float _5727 = fma(_5619, _5705, _5717);
        float _5729 = _5721 * _5721;
        float _5731 = _5725 * _5725;
        _5683 = _5727;
        _5669 = _5729;
        _5665 = _5731;
        _5673 = _5713;
        _5677 = _5715;
    }
    float _5733 = _5683;
    float _5735 = _5669;
    float _5737 = _5665;
    float _5739 = _5673;
    float _5741 = _5677;
    float _5743 = fma(_5621, _5393, _5631);
    float _5745 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5747 = _5733 + _5745;
    float _5749 = fma(_5621, _5485, _5643);
    float _5751 = fma(_5625, _5485, _5651);
    float _5753 = fma(_5623, _5393, _5633);
    float _5755 = fma(_5747, _5747, _5735);
    float _5757 = fma(_5623, _5485, _5637);
    float _5759 = fma(_5523, _5623, _5647);
    float _5761 = fma(_5625, _5393, _5635);
    float _5763 = _5755 + _5737;
    float _5765 = fma(_5523, _5621, _5645);
    float _5767 = fma(_5523, _5625, _5649);
    float _5769 = fma(_5639, _5397, _5743);
    float _5771 = fma(_5641, _5397, _5753);
    float _5773 = fma(_5641, _5503, _5757);
    float _5775 = sqrt(_5763);
    float _5777 = fma(_5629, _5397, _5761);
    float _5779 = fma(_5639, _5503, _5749);
    float _5781 = fma(_5529, _5639, _5765);
    float _5783 = fma(_5529, _5641, _5759);
    float _5785 = fma(_5529, _5629, _5767);
    float _5787 = fma(_5629, _5503, _5751);
    out.m_95.x = _5769;
    out.m_95.y = _5771;
    out.m_95.z = _5777;
    out.m_97.x = _5781;
    out.m_97.y = _5783;
    out.m_97.z = _5785;
    out.m_99.x = _5779;
    out.m_99.y = _5773;
    out.m_99.z = _5787;
    bool _5789 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5791 = isnan(_5775);
    bool _5793 = _5789 || _5791;
    bool _5795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5797 = _5793 || _5795;
    float _5799 = _5749;
    if (!_5797)
    {
        _5661 = 1.0;
    }
    float _5801 = _5661;
    bool _5803 = !_5797;
    float _5805 = _5801;
    if (!_5803)
    {
        bool _5807 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5809 = isnan(_5775);
        bool _5811 = _5807 || _5809;
        bool _5813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5815 = _5811 || _5813;
        if (!_5815)
        {
            float _5817 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5819 = _5775 + _5817;
            float _5821 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5823 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5821;
            float _5825 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5827 = _5825 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5829 = 1.0 / _5823;
            float _5831 = _5819 * _5829;
            float _5833 = fma(_5831, _5827, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5805 = _5833;
            _5835 = true;
        }
        else
        {
            bool _5837 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5839 = isnan(_5775);
            bool _5841 = _5837 || _5839;
            bool _5843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5845 = _5841 || _5843;
            if (!_5845)
            {
                float _5847 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5849 = _5775 + _5847;
                float _5851 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5853 = _5851 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5855 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5857 = _5855 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5859 = 1.0 / _5853;
                float _5861 = _5849 * _5859;
                float _5863 = fma(_5861, _5857, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5805 = _5863;
                _5835 = true;
            }
            else
            {
                _5805 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5835 = false;
    float _5865 = _5805;
    float _5867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5869 = _5733 + _5867;
    float _5871 = _5155 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5873 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5875 = _5739 + _5873;
    float _5877 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5879 = _5741 + _5877;
    float _5881 = fma(_5869, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5883 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5871);
    float _5885 = fma(_5875, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5887 = fma(_5879, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5889 = -_3569;
    float _5891 = _5889 + _5881;
    float _5893 = fma(_5163, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5883);
    float _5895 = -_3553;
    float _5897 = _5895 + _5885;
    float _5899 = _5155 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5901 = _5891 * _5891;
    float _5903 = _5893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5905 = -_3591;
    float _5907 = _5905 + _5887;
    float _5909 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5899);
    float _5911 = fma(_5897, _5897, _5901);
    float _5913 = 1.0 / _5903;
    float _5915 = fma(_5163, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5909);
    float _5917 = fma(_5907, _5907, _5911);
    float _5919 = _5915 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5921 = sqrt(_5917);
    float _5923 = _5919 + _5903;
    float _5925 = _5923 * _5913;
    float _5927 = _5925 * 0.5;
    float _5929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5931 = fma(_5927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5929);
    bool _5933 = _5921 > 0.0;
    float _5935 = 1.0 / _5931;
    bool _5937 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5939 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5941 = _5937 || _5939;
    bool _5943 = isnan(0.5);
    bool _5945 = _5941 || _5943;
    bool _5947 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5949 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5951 = _5947 || _5949;
    bool _5953 = isnan(0.5);
    bool _5955 = _5951 || _5953;
    float _5957 = _5927;
    float _5959 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5961 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5963 = _5885;
    if (!_5933)
    {
        _5957 = _5885;
    }
    float _5965 = _5957;
    float _5967 = _5965;
    float _5969 = _5965;
    if (!_5933)
    {
        _5959 = _5881;
    }
    float _5971 = _5959;
    float _5973 = _5971;
    if (!_5933)
    {
        _5961 = _5887;
    }
    float _5975 = _5961;
    bool _5977 = !_5933;
    float _5979 = _5975;
    float _5981 = _5935;
    if (!_5977)
    {
        float _5983 = _226 * _226;
        float _5985 = fma(_222, _222, _5983);
        float _5987 = fma(_228, _228, _5985);
        float _5989 = rsqrt(_5917);
        float _5991 = sqrt(_5987);
        float _5993 = _5897 * _5989;
        float _5995 = _5891 * _5989;
        float _5997 = _5907 * _5989;
        bool _5999 = _5991 > 0.0;
        float _6001 = _5991;
        float _6003 = _5989;
        if (!_5999)
        {
            _5967 = _5885;
        }
        float _6005 = _5967;
        _5969 = _6005;
        if (!_5999)
        {
            _6001 = _5881;
        }
        float _6007 = _6001;
        _5973 = _6007;
        if (!_5999)
        {
            _6003 = _5887;
        }
        float _6009 = _6003;
        bool _6011 = !_5999;
        _5979 = _6009;
        if (!_6011)
        {
            float _6013 = rsqrt(_5987);
            float _6015 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6017 = _226 * _6013;
            float _6019 = _222 * _6013;
            float _6021 = _228 * _6013;
            float _6023 = _5995 * _6017;
            float _6025 = fma(_5993, _6019, _6023);
            float _6027 = _6015 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6029 = fma(_5997, _6021, _6025);
            float _6031 = _6029 * _6027;
            float _6033 = fma(_222, _6031, _5885);
            float _6035 = fma(_226, _6031, _5881);
            float _6037 = fma(_228, _6031, _5887);
            _5969 = _6033;
            _5973 = _6035;
            _5979 = _6037;
        }
    }
    float _6039 = _5969;
    float _6041 = _5973;
    float _6043 = _5979;
    float _6045 = -_3841;
    float _6047 = fma(_6045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6039);
    float _6049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6051 = _5935 * _6049;
    float _6053 = -_3837;
    float _6055 = fma(_6053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6041);
    float _6057 = -_3861;
    float _6059 = fma(_6057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6043);
    float _6061 = _6055;
    float _6063 = _6059;
    if (_5945)
    {
        _5963 = 1.0;
    }
    float _6065 = _5963;
    float _6067 = _6065;
    if (_5955)
    {
        _5981 = _6047;
    }
    float _6069 = _5981;
    float _6071 = _6069;
    if (!_5955)
    {
        float _6073 = _5169 * _5169;
        float _6075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6077 = -_3591;
        float _6079 = _6077 + _6043;
        float _6081 = -_3553;
        float _6083 = _6081 + _6039;
        float _6085 = fma(_5173, _5173, _6073);
        float _6087 = fma(_5177, _5177, _6085);
        float _6089 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6091 = sqrt(_6087);
        float _6093 = 1.0 / _5293;
        float _6095 = _6089 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6097 = precise::min(_6091, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6099 = _6097 * _6075;
        float _6101 = -_3569;
        float _6103 = _6101 + _6041;
        float _6105 = _6099 * _6093;
        float _6107 = _6095 * _6105;
        float _6109 = _6079 * _6105;
        float _6111 = fma(_6103, _6107, _5155);
        float _6113 = fma(_6083, _6107, _5159);
        float _6115 = fma(_6095, _6109, _5163);
        _6061 = _6111;
        _6071 = _6113;
        _6063 = _6115;
    }
    float _6117 = _6061;
    float _6119 = _6071;
    float _6121 = _6063;
    if (!_5945)
    {
        float _6123 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6125 = _6123 * 0.15915493667125701904296875;
        float _6127 = _6125 * 6.283185482025146484375;
        float _6129 = cos(_6127);
        float _6131 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6133 = _6131 * 0.15915493667125701904296875;
        float _6135 = _6125 * 6.283185482025146484375;
        float _6137 = sin(_6135);
        float _6139 = 1.0 / _6129;
        float _6141 = _6133 * 6.283185482025146484375;
        float _6143 = cos(_6141);
        float _6145 = _6137 * _6139;
        float _6147 = _6133 * 6.283185482025146484375;
        float _6149 = sin(_6147);
        float _6151 = _6143 * _6145;
        float _6153 = 1.0 / _6151;
        float _6155 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6157 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6155;
        float _6159 = 1.0 / _6157;
        float _6161 = _6149 * _6153;
        float _6163 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6165 = fma(_6051, _6161, _6163);
        float _6167 = _6165 * _6159;
        float _6169 = precise::clamp(_6167, 0.0, 1.0);
        _6067 = _6169;
    }
    float _6171 = _6067;
    float _6173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6175 = _6117 + _6173;
    float _6177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6179 = _6119 + _6177;
    float _6181 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6183 = _6121 + _6181;
    float _6185 = _6175 * _6175;
    float _6187 = fma(_6179, _6179, _6185);
    float _6189 = fma(_5159, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6191 = fma(_6183, _6183, _6187);
    float _6193 = rsqrt(_6191);
    float _6195 = sqrt(_6191);
    float _6197 = _6193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6199 = _6179 * _6197;
    float _6201 = _6183 * _6197;
    float _6203 = _6199 * _6199;
    float _6205 = _6201 * _6201;
    float _6207 = _6203 + _6205;
    float _6209 = sqrt(_6207);
    bool _6211 = _6209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6215 = _6209 + _6213;
    float _6217 = _6193;
    float _6219 = _6207;
    float _6221 = _6215;
    float _6223 = _6175;
    if (_6211)
    {
        float _6225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6217 = _6225;
    }
    float _6227 = _6217;
    if (!_6211)
    {
        _5225 = _6203;
    }
    float _6229 = _5225;
    float _6231 = _6229;
    if (_6211)
    {
        float _6233 = rsqrt(_6207);
        _6219 = _6233;
    }
    float _6235 = _6219;
    float _6237 = _6235;
    if (_6211)
    {
        float _6239 = _6215 * _6227;
        _6221 = _6239;
    }
    float _6241 = _6221;
    float _6243 = floor(_6189);
    if (_6211)
    {
        float _6245 = _6241 * 0.15915493667125701904296875;
        _5227 = _6245;
    }
    float _6247 = _5227;
    float _6249 = _6183;
    if (_6211)
    {
        float _6251 = _6247 * 6.283185482025146484375;
        float _6253 = sin(_6251);
        _6249 = _6253;
    }
    float _6255 = _6249;
    float _6257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6259 = precise::max(0.0, _6257);
    float _6261 = _6227;
    float _6263 = _6259;
    if (_6211)
    {
        float _6265 = _6247 * 6.283185482025146484375;
        float _6267 = cos(_6265);
        _6261 = _6267;
    }
    float _6269 = _6261;
    float _6271 = -_6243;
    float _6273 = _6189 + _6271;
    float _6275 = -_6197;
    float _6277 = -_6259;
    float _6279 = fma(_6175, _6275, _6277);
    if (_6211)
    {
        float _6281 = _6279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6223 = _6281;
    }
    float _6283 = _6223;
    float _6285 = _6283;
    float _6287 = _6255;
    if (_6211)
    {
        float _6289 = fma(_6255, _6283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6285 = _6289;
    }
    float _6291 = _6285;
    float _6293 = _6291;
    if (!_6211)
    {
        _6287 = _6199;
    }
    float _6295 = _6287;
    float _6297 = _6295;
    if (_6211)
    {
        float _6299 = _6235 * _6291;
        _5799 = _6299;
    }
    float _6301 = _5799;
    float _6303 = _6269;
    if (_6211)
    {
        float _6305 = _6269 + (-1.0);
        _6263 = _6305;
    }
    float _6307 = _6263;
    float _6309 = _6307;
    if (!_6211)
    {
        _6293 = _6279;
    }
    float _6311 = _6293;
    float _6313 = _6311;
    if (_6211)
    {
        float _6315 = _6199 * _6301;
        _6297 = _6315;
    }
    float _6317 = _6297;
    if (_6211)
    {
        float _6319 = _6307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6237 = _6319;
    }
    float _6321 = _6237;
    if (!_6211)
    {
        _6309 = _6201;
    }
    float _6323 = _6309;
    float _6325 = _6323;
    if (_6211)
    {
        float _6327 = _6201 * _6301;
        _6325 = _6327;
    }
    float _6329 = _6325;
    if (_6211)
    {
        float _6331 = _6317 * _6317;
        _6231 = _6331;
    }
    float _6333 = _6231;
    if (_6211)
    {
        float _6335 = fma(_6279, _6269, _6321);
        _6313 = _6335;
    }
    float _6337 = _6313;
    if (!_6211)
    {
        _6303 = _6205;
    }
    float _6339 = _6303;
    float _6341 = _6339;
    if (_6211)
    {
        float _6343 = _6329 * _6329;
        _6341 = _6343;
    }
    float _6345 = _6341;
    float _6347 = fma(_6337, _6337, _6333);
    float _6349 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6351 = _6347 + _6345;
    float _6353 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6349);
    float _6355 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6357 = fma(_6195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6355);
    float _6359 = precise::clamp(_6357, 0.0, 1.0);
    float _6361 = rsqrt(_6351);
    float _6363 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6353);
    float _6365 = -_6359;
    float _6367 = _6365 + 1.0;
    float _6369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6371 = fma(_5163, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6373 = _6363 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6375 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6377 = abs(_6367);
    float _6379 = log2(_6377);
    float _6381 = _6373 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6383 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6385 = -_6381;
    float _6387 = fma(_6385, _6369, 1.0);
    float _6389 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6391 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6383);
    float _6393 = _6361 * _6317;
    float _6395 = _6361 * _6337;
    float _6397 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6389);
    float _6399 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6391);
    float _6401 = _6393 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6403 = _6361 * _6329;
    float _6405 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6397);
    float _6407 = _6399 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6409 = -_6401;
    float _6411 = fma(_6395, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6409);
    float _6413 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6375);
    float _6415 = _6405 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6417 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6419 = floor(_6371);
    float _6421 = -_6403;
    float _6423 = fma(_6421, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6411);
    float _6425 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6413);
    float _6427 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6417);
    float _6429 = _6379 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6431 = fma(_6423, -0.5, 0.5);
    float _6433 = _6425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6435 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6427);
    float _6437 = exp2(_6429);
    float _6439 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6441 = fma(_6423, 0.5, 0.5);
    float _6443 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6435);
    float _6445 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6447 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6439);
    float _6449 = sqrt(_6431);
    float _6451 = -_6419;
    float _6453 = _6371 + _6451;
    float _6455 = fma(_6441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6457 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6445);
    float _6459 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6447);
    float _6461 = _6395 + 1.0;
    float _6463 = fma(_6441, _6455, -0.212114393711090087890625);
    float _6465 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6457);
    float _6467 = log2(_6387);
    float _6469 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6459);
    float _6471 = fma(_6441, _6463, 1.570728778839111328125);
    float _6473 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6465);
    float _6475 = -_6395;
    float _6477 = fma(_6437, _6461, _6475);
    float _6479 = 1.0 / _6443;
    float _6481 = _6449 * 0.636619746685028076171875;
    float _6483 = fma(_6477, 0.5, 0.5);
    float _6485 = -_6471;
    float _6487 = fma(_6481, _6485, 1.0);
    float2 _16495 = float2(_6273, _6453);
    float _6489 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16495, float2(0.0), isnan(_16495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16495, float2(0.0), isnan(_16495)), level(0.0)).x;
    float _6491 = _6467 * 0.693147182464599609375;
    float _6493 = _6469 * _6479;
    float _6495 = _6473 * _6479;
    float _6497 = _6491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6499 = fma(_6493, 0.5, 0.5);
    float _6501 = fma(_6495, -0.5, 0.5);
    float3 _16523 = float3(_6499, _6501, _6497);
    float _6503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16523, float3(0.0), isnan(_16523)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16523, float3(0.0), isnan(_16523)), level(0.0)).x;
    float3 _16534 = float3(_6499, _6501, _6497);
    float4 _6506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16534, float3(0.0), isnan(_16534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16534, float3(0.0), isnan(_16534)), level(0.0)).xyzw;
    float _6508 = _6506.x;
    float _6510 = _6506.y;
    float _6512 = _6506.z;
    float _6514 = _6506.w;
    float2 _16550 = float2(_6487, _6483);
    float3 _6518 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16550, float2(0.0), isnan(_16550)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16550, float2(0.0), isnan(_16550)), level(0.0)).xyz;
    float _6520 = _6518.x;
    float _6522 = _6518.y;
    float _6524 = _6518.z;
    float _6526 = abs(_6051);
    float _6528 = log2(_6526);
    float _6530 = _6379 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6532 = _6443 * 0.5;
    float _6534 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6536 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6538 = isnan(_6195);
    bool _6540 = _6536 || _6538;
    bool _6542 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6544 = _6540 || _6542;
    float _6546 = exp2(_6530);
    bool _6548 = _6051 <= 8000.0;
    bool _6550 = isnan(_6051);
    bool _6552 = _6548 || _6550;
    bool _6554 = isnan(8000.0);
    bool _6556 = _6552 || _6554;
    float _6558 = float(_6556);
    float _6560 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6534);
    float _6562 = in.m_101.x;
    float _6564 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6560);
    float _6566 = _6528 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6568 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6564);
    float _6570 = _6469 + _6443;
    float _6572 = exp2(_6566);
    float _6574 = _6570 * 0.5;
    float _6576 = -_6546;
    float _6578 = _6576 + 1.0;
    out.gl_Position.x = _6469;
    out.gl_Position.y = _6473;
    out.gl_Position.z = _6568;
    out.gl_Position.w = _6443;
    float _6580 = _6570;
    float _6582 = _6473;
    float _6584 = _6469;
    float _6586 = _6443;
    float _6588 = _6568;
    float _6590 = _6574;
    if (!_6544)
    {
        _6580 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6592 = _6580;
    float _6594 = _6578 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6596 = fma(_6572, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6598 = precise::clamp(_6596, 0.0, 1.0);
    float _6600 = fma(_6473, -0.5, _6532);
    float _6602 = fma(_6598, -2.0, 3.0);
    float _6604 = _6598 * _6598;
    float _6606 = _6592;
    float _6608 = _6592;
    if (!_6544)
    {
        _6582 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6610 = _6582;
    float _6612 = _6610;
    float _6614 = _6610;
    if (!_6544)
    {
        _6584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6616 = _6584;
    float _6618 = _6604 * _6602;
    float _6620 = -_6618;
    float _6622 = _6620 + 1.0;
    float _6624 = fma(_6622, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6618);
    float _6626 = _6568 + _6443;
    float _6628 = _6558 * _6624;
    float _6630 = _6626 * 0.5;
    float _6632 = _6616;
    float _6634 = _6616;
    if (!_6544)
    {
        _6586 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6636 = _6586;
    float _6638 = _6628 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6640 = _6636;
    float _6642 = _6636;
    if (!_6544)
    {
        _6588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6644 = _6588;
    out.m_103.x = _6574;
    out.m_103.y = _6600;
    out.m_103.z = _6630;
    out.m_103.w = _6443;
    float _6646 = _6171 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6648 = _6644;
    float _6650 = _6644;
    if (!_6544)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6652 = _6590;
    float _6654 = -_6489;
    float _6656 = _6654 + 1.0;
    float _6658 = _6656 * _6638;
    float _6660 = precise::clamp(_6658, 0.0, 1.0);
    float _6662 = -_6660;
    float _6664 = fma(_6662, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6666 = _6664 * _6562;
    float _6668 = _6666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6670 = _6594 * _6503;
    float _6672 = -_6594;
    float _6674 = _6672 + 1.0;
    out.m_105.x = _6668;
    float _6676 = _6514 * _6670;
    float _6678 = _6524 * _6670;
    float _6680 = _6514 * _6674;
    float _6682 = fma(_6520, _6676, _6508);
    float _6684 = fma(_6522, _6676, _6510);
    float _6686 = fma(_6514, _6678, _6512);
    out.m_107.x = _6682;
    out.m_107.y = _6684;
    out.m_107.z = _6686;
    out.m_107.w = _6680;
    bool _6688 = !_6544;
    float _6690 = _6652;
    float _6692 = _6652;
    if (!_6688)
    {
        bool _6694 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6696 = isnan(_6195);
        bool _6698 = _6694 || _6696;
        bool _6700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6702 = _6698 || _6700;
        if (!_6702)
        {
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6706 = _6195 + _6704;
            float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6710 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6708;
            float _6712 = 1.0 / _6710;
            float _6714 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6722 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6724 = _6722 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6726 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6728 = _6726 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6730 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6732 = _6730 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6734 = _6706 * _6712;
            float _6736 = precise::clamp(_6734, 0.0, 1.0);
            float _6738 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6740 = _6738 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6742 = fma(_6736, _6720, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6744 = fma(_6736, _6740, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6746 = fma(_6736, _6716, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6748 = fma(_6736, _6724, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6750 = fma(_6736, _6728, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6752 = fma(_6736, _6732, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6634 = _6746;
            _6642 = _6750;
            _6614 = _6744;
            _6692 = _6748;
            _6608 = _6742;
            _6650 = _6752;
            _6754 = true;
        }
        else
        {
            bool _6756 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6758 = isnan(_6195);
            bool _6760 = _6756 || _6758;
            bool _6762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6764 = _6760 || _6762;
            if (!_6764)
            {
                _6690 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6766 = _6690;
            _6692 = _6766;
            if (!_6764)
            {
                _6640 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6768 = _6640;
            _6642 = _6768;
            if (!_6764)
            {
                _6648 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6770 = _6648;
            _6650 = _6770;
            if (!_6764)
            {
                _6612 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6772 = _6612;
            _6614 = _6772;
            if (!_6764)
            {
                _6632 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6774 = _6632;
            _6634 = _6774;
            if (!_6764)
            {
                _6606 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6776 = _6606;
            bool _6778 = !_6764;
            _6608 = _6776;
            if (!_6778)
            {
                bool _6780 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6782 = isnan(_6195);
                bool _6784 = _6780 || _6782;
                bool _6786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6788 = _6784 || _6786;
                if (!_6788)
                {
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6792 = _6195 + _6790;
                    float _6794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6796 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6794;
                    float _6798 = 1.0 / _6796;
                    float _6800 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6802 = _6800 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6808 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6810 = _6808 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6812 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6814 = _6812 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6816 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6818 = _6816 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6820 = _6792 * _6798;
                    float _6822 = precise::clamp(_6820, 0.0, 1.0);
                    float _6824 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6826 = _6824 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6828 = fma(_6822, _6806, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6830 = fma(_6822, _6826, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6832 = fma(_6822, _6802, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6834 = fma(_6822, _6810, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6836 = fma(_6822, _6814, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6838 = fma(_6822, _6818, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6634 = _6832;
                    _6642 = _6836;
                    _6614 = _6830;
                    _6692 = _6834;
                    _6608 = _6828;
                    _6650 = _6838;
                    _6754 = true;
                }
                else
                {
                    _6634 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6642 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6614 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6692 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6608 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6650 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6754 = false;
    float _6840 = _6634;
    float _6842 = _6642;
    float _6844 = _6614;
    float _6846 = _6692;
    float _6848 = _6608;
    float _6850 = _6650;
    float _6852 = _6646 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6854 = fma(_5773, -0.5, 0.5);
    float _6856 = precise::clamp(_6854, 0.0, 1.0);
    float _6858 = -_6840;
    float _6860 = _6842 + _6858;
    float _6862 = -_6844;
    float _6864 = _6846 + _6862;
    out.m_51.x = _6852;
    float _6866 = fma(_6856, _6860, _6840);
    float _6868 = -_6848;
    float _6870 = _6850 + _6868;
    float _6872 = fma(_6856, _6864, _6844);
    float _6874 = _6866 * 0.586610972881317138671875;
    bool _6876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6878 = fma(_6856, _6870, _6848);
    out.m_109.x = 0.0;
    float _6880 = fma(_6872, 0.298911988735198974609375, _6874);
    bool _6882 = _6171 > 0.0;
    bool _6884 = isnan(_6171);
    bool _6886 = _6882 || _6884;
    bool _6888 = isnan(0.0);
    bool _6890 = _6886 || _6888;
    float _6892 = fma(_6878, 0.114477999508380889892578125, _6880);
    float _6894 = -_6892;
    float _6896 = _6872 + _6894;
    float _6898 = -_6892;
    float _6900 = _6866 + _6898;
    float _6902 = -_6892;
    float _6904 = _6878 + _6902;
    float _6906 = fma(_6896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    float _6908 = fma(_6900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    float _6910 = fma(_6904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    bool _6912 = !_6876;
    if (!_6912)
    {
        float _6914 = -_6117;
        float _6916 = _6914 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6918 = -_6119;
        float _6920 = _6918 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6922 = -_6121;
        float _6924 = _6922 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6926 = _6916 * _6916;
        float _6928 = fma(_6920, _6920, _6926);
        float _6930 = fma(_6924, _6924, _6928);
        float _6932 = sqrt(_6930);
        float _6934 = rsqrt(_6930);
        float _6936 = -_6932;
        float _6938 = _6936 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6940 = _6938 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6942 = precise::clamp(_6940, 0.0, 1.0);
        float _6944 = _6920 * _6934;
        float _6946 = _6916 * _6934;
        float _6948 = abs(_6942);
        float _6950 = log2(_6948);
        float _6952 = _6924 * _6934;
        float _6954 = _6944 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6956 = _5773 * _6946;
        float _6958 = -_6946;
        float _6960 = -_6954;
        float _6962 = fma(_6958, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6960);
        float _6964 = fma(_5779, _6944, _6956);
        float _6966 = -_6952;
        float _6968 = fma(_6966, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6962);
        float _6970 = fma(_5787, _6952, _6964);
        float _6972 = precise::clamp(_6970, 0.0, 1.0);
        float _6974 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6976 = _6968 + _6974;
        float _6978 = _6950 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6980 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6982 = precise::clamp(_6980, 0.0, 1.0);
        float _6984 = exp2(_6978);
        float _6986 = _6984 * _6982;
        float _6988 = _6972 * _6986;
        float _6990 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6992 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6994 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6990;
        out.m_109.y = _6992;
        out.m_109.z = _6994;
    }
    out.m_111.x = _6906;
    out.m_111.y = _6908;
    out.m_111.z = _6910;
    if (_6890)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _6996 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6996;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6754 = false;
    bool _5835 = false;
    bool _1200 = false;
    bool _876 = false;
    bool _734 = false;
    bool _580 = false;
    bool _250 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_48.w;
    float _127 = trunc(_125);
    int _130 = int(_127);
    bool _134 = _130 >= 1;
    float _136 = 0.0;
    if (!_134)
    {
        _136 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _136;
    float _140 = _138;
    if (!_134)
    {
        out.m_51.x = 0.0;
    }
    int _142 = 0;
    if (!_134)
    {
        float _144 = _138 * 5.0;
        _142 = as_type<int>(_144);
    }
    int _146 = _142;
    int _148 = _146;
    if (!_134)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7053 = as_type<float>(_146);
        out.gl_Position.z = _7053;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_53.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    float _168 = _164;
    if (_160)
    {
        float _170 = float(_130);
        _166 = _170;
    }
    float _172 = _166;
    bool _174 = _164 >= _172;
    bool _176 = !_160;
    bool _178 = _174 || _176;
    if (_178)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _140;
    if (_178)
    {
        out.m_51.x = 0.0;
    }
    if (_178)
    {
        float _182 = _180 * 5.0;
        _148 = as_type<int>(_182);
    }
    int _184 = _148;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7122 = as_type<float>(_184);
        out.gl_Position.z = _7122;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _186 = in.m_55.x;
    float _188 = in.m_55.y;
    float _190 = in.m_55.z;
    bool _192 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _194 = in.m_57.x;
    float _196 = in.m_57.y;
    float _198 = in.m_57.z;
    float _200 = in.m_59.x;
    float _202 = in.m_59.y;
    float _204 = in.m_59.z;
    float _206 = in.m_61.x;
    float _208 = in.m_61.y;
    float _210 = in.m_61.z;
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
    float _248;
    if (!_230)
    {
        float _232 = in.m_63.x;
        float _234 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _236 = _232 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _238 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _240 = _238 * _234;
        float _242 = floor(_240);
        float _244 = -_242;
        float _246 = _240 + _244;
        _248 = _246;
        _250 = true;
    }
    else
    {
        float _252 = float(_130);
        float _254 = 1.0 / _252;
        float _256 = _164 * _254;
        _248 = _256;
    }
    _250 = false;
    float _258 = _248;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _266 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _280 = 1.0 / _266;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _282;
    bool _286 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _288 = isnan(_258);
    bool _290 = _286 || _288;
    bool _292 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _294 = _290 || _292;
    float _296 = float(_294);
    float _298 = 1.0 / _270;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _302 = _258 + _300;
    bool _304 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_258);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = 1.0 / _274;
    float _318 = _302 * _280;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _322 = _258 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _326 = _258 + _324;
    bool _328 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _330 = 1.0 / _278;
    float _332 = _262 * _298;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _336 = _258 + _334;
    float _338 = 1.0 / _284;
    float _340 = _322 * _316;
    bool _342 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _344 = isnan(_258);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    bool _354 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _356 = isnan(_258);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _362 = _358 || _360;
    float _364 = float(_362);
    float _366 = _326 * _330;
    float _368 = -_296;
    float _370 = _368 + 1.0;
    bool _372 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _374 = isnan(_258);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = _352 * _370;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _386;
    float _390 = _336 * _338;
    float _392 = -_352;
    float _394 = _392 + 1.0;
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _398 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _396;
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _400;
    float _404 = fma(_388, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _406 = _382 * _394;
    float _408 = fma(_398, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _410 = fma(_402, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _412 = -_364;
    float _414 = _412 + 1.0;
    float _416 = -_382;
    float _418 = _416 + 1.0;
    bool _420 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _422 = isnan(_258);
    bool _424 = _420 || _422;
    bool _426 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _428 = _424 || _426;
    float _430 = float(_428);
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _434 = _432 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _436 = _314 * _414;
    float _438 = -_314;
    float _440 = _438 + 1.0;
    float _442 = _364 * _418;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _452 = _430 * _440;
    float _454 = fma(_434, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _456 = fma(_446, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _458 = fma(_450, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _460 = _408 * _452;
    float _462 = -_430;
    float _464 = _462 + 1.0;
    float _466 = _410 * _452;
    float _468 = _404 * _452;
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _470;
    float _474 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _476 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _466);
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _478;
    float _482 = fma(_472, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_454, _436, _474);
    float _486 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _468);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _488;
    float _492 = fma(_458, _436, _476);
    float _494 = fma(_482, _442, _484);
    float _496 = fma(_480, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _498 = fma(_456, _436, _486);
    float _500 = fma(_490, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _508 = _506 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _514 = fma(_496, _442, _498);
    float _516 = fma(_504, _366, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _518 = fma(_508, _366, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _520 = fma(_512, _366, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _522 = fma(_500, _442, _492);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _524;
    float _528 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _530 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _528;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _532;
    float _536 = fma(_516, _406, _494);
    float _538 = fma(_526, _390, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _540 = fma(_530, _390, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _542 = fma(_534, _390, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _544 = fma(_518, _406, _514);
    float _546 = fma(_520, _406, _522);
    float _548 = fma(_538, _384, _536);
    float _550 = fma(_540, _384, _544);
    float _552 = fma(_542, _384, _546);
    float _554 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].x, _548);
    float _556 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].y, _550);
    float _558 = fma(_296, (*spvDescriptorSet0.vp_c9)._m0[148].z, _552);
    bool _560 = !_328;
    float _578;
    if (!_560)
    {
        float _562 = in.m_63.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_130);
        float _584 = 1.0 / _582;
        float _586 = _164 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _592 = _588 + _590;
    float _594 = in.m_65.x;
    float _596 = in.m_65.y;
    float _598 = in.m_65.z;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _604 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = isnan(_588);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _622 = isnan(_588);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    bool _636 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = isnan(_588);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _602;
    float _650 = -_614;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _588 + _654;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _630 * _652;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _618;
    float _668 = _634 * _648;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _592, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = _672 * _666;
    float _678 = -_646;
    float _680 = _678 + 1.0;
    float _682 = _674 * _660;
    float _684 = fma(_676, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _686 = _614 * _680;
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _690 = _558 * _598;
    float _692 = fma(_684, _686, _688);
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _696 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _698 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[117].x, _692);
    float _700 = _556 * _596;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _704 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _706 = _696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _698 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _710 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _554 * _594;
    out.m_67.x = _704;
    out.m_67.y = _706;
    out.m_67.z = _710;
    out.m_67.w = _708;
    bool _714 = !_658;
    float _732;
    if (!_714)
    {
        float _716 = in.m_63.x;
        float _718 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _720 = _716 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _722 = fma(_720, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _724 = _722 * _718;
        float _726 = floor(_724);
        float _728 = -_726;
        float _730 = _724 + _728;
        _732 = _730;
        _734 = true;
    }
    else
    {
        float _736 = float(_130);
        float _738 = 1.0 / _736;
        float _740 = _164 * _738;
        _732 = _740;
    }
    _734 = false;
    float _742 = _732;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _746 = _742 + _744;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _750 = _748 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _752 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _754 = isnan(_742);
    bool _756 = _752 || _754;
    bool _758 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _760 = _756 || _758;
    float _762 = float(_760);
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _768 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _770 = isnan(_742);
    bool _772 = _768 || _770;
    bool _774 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _776 = _772 || _774;
    float _778 = float(_776);
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _782 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _780;
    bool _784 = _742 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _786 = isnan(_742);
    bool _788 = _784 || _786;
    bool _790 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _792 = _788 || _790;
    float _794 = float(_792);
    float _796 = 1.0 / _750;
    float _798 = -_762;
    float _800 = _798 + 1.0;
    float _802 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _804 = _742 + _802;
    bool _806 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _808 = _778 * _800;
    float _810 = -_778;
    float _812 = _810 + 1.0;
    float _814 = 1.0 / _766;
    float _816 = _782 * _796;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _820 = _818 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _822 = fma(_816, _746, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _824 = -_794;
    float _826 = _824 + 1.0;
    float _828 = _820 * _814;
    float _830 = _822 * _808;
    float _832 = _762 * _826;
    float _834 = fma(_828, _804, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _836 = fma(_812, (*spvDescriptorSet0.vp_c9)._m0[131].x, _830);
    float _838 = fma(_834, _832, _836);
    float _840 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _844 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _846 = fma(_794, (*spvDescriptorSet0.vp_c9)._m0[133].x, _838);
    float _848 = _840 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _850 = _842 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _852 = _844 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _854 = _846 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _848;
    out.m_69.y = _850;
    out.m_69.z = _852;
    out.m_69.w = _854;
    bool _856 = !_806;
    float _874;
    if (!_856)
    {
        float _858 = in.m_63.x;
        float _860 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _862 = _858 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _864 = fma(_862, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _866 = _864 * _860;
        float _868 = floor(_866);
        float _870 = -_868;
        float _872 = _866 + _870;
        _874 = _872;
        _876 = true;
    }
    else
    {
        float _878 = float(_130);
        float _880 = 1.0 / _878;
        float _882 = _164 * _880;
        _874 = _882;
    }
    _876 = false;
    float _884 = _874;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _888 = _884 + _886;
    bool _890 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _892 = isnan(_884);
    bool _894 = _890 || _892;
    bool _896 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _898 = _894 || _896;
    float _900 = float(_898);
    float _902 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _904 = _902 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _906 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _908 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _906;
    bool _910 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _912 = isnan(_884);
    bool _914 = _910 || _912;
    bool _916 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _918 = _914 || _916;
    float _920 = float(_918);
    float _922 = -_900;
    float _924 = _922 + 1.0;
    bool _926 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _928 = isnan(_884);
    bool _930 = _926 || _928;
    bool _932 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _934 = _930 || _932;
    float _936 = float(_934);
    float _938 = 1.0 / _904;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _944 = _920 * _924;
    float _946 = -_936;
    float _948 = _946 + 1.0;
    float _950 = 1.0 / _942;
    bool _952 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _954 = _908 * _938;
    float _956 = -_920;
    float _958 = _956 + 1.0;
    bool _960 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _962 = isnan(_884);
    bool _964 = _960 || _962;
    bool _966 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _968 = _964 || _966;
    float _970 = float(_968);
    float _972 = fma(_954, _888, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _974 = _936 * _958;
    bool _976 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _978 = isnan(_884);
    bool _980 = _976 || _978;
    bool _982 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _984 = _980 || _982;
    float _986 = float(_984);
    float _988 = _970 * _948;
    float _990 = -_970;
    float _992 = _990 + 1.0;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _998 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1000 = isnan(_884);
    bool _1002 = _998 || _1000;
    bool _1004 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1006 = _1002 || _1004;
    float _1008 = float(_1006);
    float _1010 = _986 * _992;
    float _1012 = -_986;
    float _1014 = _1012 + 1.0;
    bool _1016 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1018 = isnan(_884);
    bool _1020 = _1016 || _1018;
    bool _1022 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1024 = _1020 || _1022;
    float _1026 = float(_1024);
    float _1028 = 1.0 / _996;
    float _1030 = -_1008;
    float _1032 = _1030 + 1.0;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1036 = _1034 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1038 = _1008 * _1014;
    float _1040 = _1026 * _1032;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1046 = -_1026;
    float _1048 = _1046 + 1.0;
    float _1050 = 1.0 / _1036;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1054 = _1052 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1056 = _972 * _1040;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1064 = _884 + _1062;
    float _1066 = _1054 * _950;
    float _1068 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1056);
    float _1070 = 1.0 / _1044;
    float _1072 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1074 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1072;
    float _1076 = fma(_1066, _1064, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1080 = _1078 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1084 = _884 + _1082;
    float _1086 = _1074 * _1028;
    float _1088 = fma(_1076, _1038, _1068);
    float _1090 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1092 = _884 + _1090;
    float _1094 = 1.0 / _1060;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1098 = _1096 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1100 = fma(_1086, _1084, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1102 = _1098 * _1050;
    bool _1104 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1106 = isnan(_884);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1112 = _1108 || _1110;
    int _1114 = _1112 ? 1065353216 : 0;
    float _1116 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1118 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1116;
    float _1120 = 1.0 / _1080;
    float _1122 = fma(_1100, _1010, _1088);
    float _1124 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1126 = _1124 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1128 = _1118 * _1070;
    float _1130 = fma(_1102, _1092, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1134 = _884 + _1132;
    float _1136 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1138 = _884 + _1136;
    float _1140 = _1126 * _1094;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1144 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1142;
    float _1146 = fma(_1128, _1134, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1148 = fma(_1130, _988, _1122);
    float _1150 = fma(_1140, _1138, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1152 = -as_type<float>(_1114);
    float _1154 = _1152 + 1.0;
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1158 = _884 + _1156;
    float _1160 = fma(_1146, _974, _1148);
    float _1162 = _1144 * _1120;
    float _1164 = _900 * _1154;
    float _1166 = fma(_1150, _944, _1160);
    float _1168 = fma(_1162, _1158, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1170 = fma(_1168, _1164, _1166);
    float _1172 = fma(as_type<float>(_1114), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1170);
    out.m_71.x = _1172;
    bool _1174 = !_952;
    float _1176 = _944;
    int _1178 = _1114;
    int _1180 = as_type<int>(_1164);
    float _1198;
    if (!_1174)
    {
        float _1182 = in.m_63.x;
        float _1184 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1186 = _1182 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1188 = fma(_1186, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1190 = _1188 * _1184;
        float _1192 = floor(_1190);
        float _1194 = -_1192;
        float _1196 = _1190 + _1194;
        _1198 = _1196;
        _1200 = true;
    }
    else
    {
        float _1202 = float(_130);
        float _1204 = 1.0 / _1202;
        float _1206 = _164 * _1204;
        _1198 = _1206;
    }
    _1200 = false;
    float _1208 = _1198;
    float _1210 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1212 = int(_1210);
    float _1214 = in.m_73.x;
    int _1216 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1218 = _1216 != 0;
    float _1220 = in.m_63.y;
    float _1222 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1224 = int(_1222);
    int _1226 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1228 = _1226 != 0;
    float _1230 = 0.0;
    int _1232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1218)
    {
        _1230 = 1.0;
    }
    float _1234 = _1230;
    int _1236 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1238 = _1236 != 0;
    int _1240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1242 = _1240 != 0;
    float _1244 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1246 = int(_1244);
    float _1248 = float(_1212);
    float _1250 = 0.0;
    float _1252 = _1234;
    bool _1254 = _1238;
    bool _1256 = _1242;
    if (_1218)
    {
        _1250 = 1.0;
    }
    float _1258 = _1250;
    float _1260 = 0.0;
    float _1262 = _1258;
    if (_1218)
    {
        _1260 = 1.0;
    }
    float _1264 = _1260;
    int _1266 = 0;
    float _1268 = _1264;
    if (_1218)
    {
        _1266 = 0;
    }
    int _1270 = _1266;
    float _1272 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1274 = int(_1272);
    float _1276 = float(_1224);
    int _1278 = _1270;
    if (_1218)
    {
        _1232 = 0;
    }
    int _1280 = _1232;
    int _1282 = _1280;
    float _1284 = _1214;
    if (!_1228)
    {
        _1176 = _1214;
    }
    float _1286 = _1176;
    float _1288 = _1286;
    if (_1238)
    {
        float _1290 = -_1214;
        float _1292 = _1290 + 1.0;
        _1178 = as_type<int>(_1292);
    }
    int _1294 = _1178;
    if (_1242)
    {
        float _1296 = -_1214;
        float _1298 = _1296 + 1.0;
        _1180 = as_type<int>(_1298);
    }
    int _1300 = _1180;
    bool _1302 = _1220 > 0.5;
    float _1304 = 1.0 / _1248;
    float _1306 = float(_1246);
    float _1308 = 0.0;
    if (!_1238)
    {
        _1308 = _1214;
    }
    float _1310 = _1308;
    float _1312 = 0.0;
    float _1314 = _1310;
    if (!_1242)
    {
        _1312 = _1214;
    }
    float _1316 = _1312;
    float _1318 = _1316;
    if (_1238)
    {
        float _1320 = _1302 ? as_type<float>(_1294) : _1214;
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1326 = int(_1324);
    float _1328 = float(uint(_1274));
    if (_1242)
    {
        float _1330 = _1302 ? as_type<float>(_1300) : _1214;
        _1318 = _1330;
    }
    float _1332 = _1318;
    int _1334 = 0;
    if (_1218)
    {
        _1334 = as_type<int>(_1220);
    }
    int _1336 = _1334;
    float _1338 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1340 = int(_1338);
    float _1342 = _1304 * _164;
    float _1344 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1346 = int(_1344);
    float _1348 = float(uint(_1326));
    float _1350 = 1.0 / _1276;
    float _1352 = float(_1340);
    float _1354 = 1.0 / _1306;
    float _1356 = float(uint(_1346));
    float _1358 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1360 = int(_1358);
    float _1362 = _1350 * _164;
    float _1364 = 1.0 / _1328;
    float _1366 = _1354 * _164;
    float _1368 = 1.0 / _1348;
    float _1370 = float(uint(_1360));
    float _1372 = trunc(_1342);
    int _1374 = int(_1372);
    float _1376 = _1348;
    int _1378 = _1336;
    if (_1218)
    {
        float _1380 = in.m_63.x;
        _1376 = _1380;
    }
    float _1382 = _1376;
    int _1384 = as_type<int>(_1364) + (-2);
    float _1386 = 1.0 / _1352;
    int _1388 = as_type<int>(_1368) + (-2);
    float _1390 = 1.0 / _1356;
    float _1392 = float(uint(_1374));
    float _1394 = as_type<float>(_1388) * _1392;
    float _1396 = trunc(_1362);
    int _1398 = int(_1396);
    float _1400 = _1386 * _164;
    float _1402 = trunc(_1366);
    int _1404 = int(_1402);
    int _1406 = as_type<int>(_1390) + (-2);
    float _1408 = 1.0 / _1370;
    float _1410 = float(uint(_1398));
    float _1412 = as_type<float>(_1406) * _1410;
    float _1414 = trunc(_1400);
    int _1416 = int(_1414);
    float _1418 = _1370;
    int _1420 = as_type<int>(_1412);
    if (_1218)
    {
        float _1422 = in.m_63.z;
        _1418 = _1422;
    }
    float _1424 = _1418;
    float _1426 = float(uint(_1404));
    float _1428 = as_type<float>(_1384) * _1426;
    float _1430 = trunc(_1394);
    float _1432 = precise::max(_1430, 0.0);
    uint _1435 = uint(_1432);
    float _1437 = trunc(_1412);
    float _1439 = precise::max(_1437, 0.0);
    uint _1441 = uint(_1439);
    float _1443 = trunc(_1428);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    float _1449 = _1382;
    if (_1218)
    {
        _1420 = as_type<int>(_1382);
    }
    int _1451 = _1420;
    int _1453 = 0;
    float _1455 = as_type<float>(_1451);
    float _1457 = _1424;
    if (_1218)
    {
        _1453 = as_type<int>(_1424);
    }
    int _1459 = _1453;
    int _1461 = 0;
    int _1463 = _1459;
    if (_1218)
    {
        _1461 = _1451;
    }
    int _1465 = _1461;
    int _1467 = int(_1238);
    int _1469 = _1228 ? 2 : 0;
    int _1471 = _1467 | _1469;
    int _1473 = _1242 ? 4 : 0;
    int _1475 = _1471 | _1473;
    int _1477 = _1218 ? 8 : 0;
    int _1479 = _1475 | _1477;
    int _1481 = false ? 16 : 0;
    int _1483 = _1479 | _1481;
    int _1485 = _1302 ? 32 : 0;
    int _1487 = _1483 | _1485;
    int _1489 = false ? 64 : 0;
    int _1491 = _1487 | _1489;
    int _1493 = _1491 & 32;
    float _1495 = as_type<float>(_1493);
    int _1497 = _1465;
    if (_1218)
    {
        _1495 = as_type<float>(_1451);
    }
    float _1499 = _1495;
    float _1501 = _1499;
    if (!_1218)
    {
        float _1503 = in.m_63.x;
        float _1505 = _1220 * 3.1415927410125732421875;
        float _1507 = in.m_63.z;
        float _1509 = _1505 * 0.15915493667125701904296875;
        float _1511 = _1509 * 6.283185482025146484375;
        float _1513 = sin(_1511);
        float _1515 = _1503 * 3.1415927410125732421875;
        float _1517 = _1515 * 0.15915493667125701904296875;
        float _1519 = _1507 * 3.1415927410125732421875;
        float _1521 = _1519 * 0.15915493667125701904296875;
        float _1523 = _1517 * 6.283185482025146484375;
        float _1525 = sin(_1523);
        float _1527 = _1521 * 6.283185482025146484375;
        float _1529 = sin(_1527);
        _1501 = _1507;
        _1268 = 5.839270114898681640625;
        _1449 = _1503;
        _1252 = 7.345489978790283203125;
        _1455 = _1220;
        _1262 = 1.2345600128173828125;
        _1278 = 1;
        _1282 = 2;
        _1457 = _1507;
        _1378 = as_type<int>(_1513);
        _1497 = as_type<int>(_1525);
        _1463 = as_type<int>(_1529);
    }
    float _1531 = _1501;
    float _1533 = _1268;
    float _1535 = _1449;
    float _1537 = _1252;
    float _1539 = _1455;
    float _1541 = _1262;
    int _1543 = _1278;
    int _1545 = _1282;
    float _1547 = _1457;
    int _1549 = _1378;
    int _1551 = _1497;
    int _1553 = _1463;
    int _1555 = ~_1274;
    int _1557 = _1555 + 1;
    float _1559 = _1120;
    if (_1228)
    {
        float _1561 = in.m_63.x;
        _1559 = _1561;
    }
    float _1563 = _1559;
    int _1565 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1567 = _1565 != 0;
    float _1569 = _1531 * _1533;
    int _1571 = ~_1346;
    int _1573 = _1571 + 1;
    int _1575 = _1557 * int(_1447);
    int _1577 = _1575 + _1404;
    int _1579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1581 = _1579 != 0;
    float _1583 = _1535 * _1537;
    float _1585 = _1539 * _1541;
    int _1587 = as_type<int>(_1408) + (-2);
    float _1589 = floor(_1569);
    float _1591 = float(uint(_1577));
    int _1593 = _1573 * int(_1441);
    int _1595 = _1593 + _1398;
    float _1597 = float(uint(_1416));
    float _1599 = _1539 * _1537;
    float _1601 = _1531;
    if (_1567)
    {
        float _1603 = in.m_63.z;
        _1601 = _1603;
    }
    float _1605 = _1601;
    int _1607 = ~_1326;
    int _1609 = _1607 + 1;
    float _1611 = as_type<float>(_1384) * _1591;
    float _1613 = float(uint(_1595));
    float _1615 = floor(_1583);
    int _1617 = 0;
    float _1619 = _1611;
    if (_1581)
    {
        float _1621 = -_1214;
        float _1623 = _1621 + 1.0;
        _1617 = as_type<int>(_1623);
    }
    int _1625 = _1617;
    int _1627 = _1609 * int(_1435);
    int _1629 = _1627 + _1374;
    int _1631 = 0;
    if (_1567)
    {
        float _1633 = -_1214;
        float _1635 = _1633 + 1.0;
        _1631 = as_type<int>(_1635);
    }
    int _1637 = _1631;
    float _1639 = as_type<float>(_1406) * _1613;
    int _1641 = ~_1274;
    int _1643 = _1641 + 1;
    bool _1645 = _1543 != 1;
    float _1647 = _1563;
    if (_1228)
    {
        bool _1649 = _1563 > 0.5;
        _1254 = _1649;
    }
    bool _1651 = _1254;
    float _1653 = floor(_1585);
    if (!_1581)
    {
        _1647 = _1214;
    }
    float _1655 = _1647;
    bool _1657 = _1545 != 2;
    float _1659 = _1655;
    if (_1581)
    {
        float _1661 = _1302 ? as_type<float>(_1625) : _1214;
        _1659 = _1661;
    }
    float _1663 = _1659;
    float _1665 = _1220 * 2.0;
    float _1667 = float(uint(_1629));
    float _1669 = in.m_59.w;
    int _1671 = ~_1326;
    int _1673 = _1671 + 1;
    float _1675 = trunc(_1639);
    float _1677 = precise::max(_1675, 0.0);
    uint _1679 = uint(_1677);
    float _1681 = -_1615;
    float _1683 = _1583 + _1681;
    float _1685 = as_type<float>(_1388) * _1667;
    int _1687 = ~_1360;
    int _1689 = _1687 + 1;
    int _1691 = as_type<int>(_1667);
    float _1693 = as_type<float>(_1673);
    if (_1228)
    {
        float _1695 = -_1214;
        float _1697 = _1695 + 1.0;
        _1691 = as_type<int>(_1697);
    }
    int _1699 = _1691;
    if (_1567)
    {
        bool _1701 = _1605 > 0.5;
        _1256 = _1701;
    }
    bool _1703 = _1256;
    float _1705 = in.m_61.w;
    int _1707 = ~_1346;
    int _1709 = _1707 + 1;
    float _1711 = -_1653;
    float _1713 = _1585 + _1711;
    float _1715 = as_type<float>(_1587) * _1597;
    float _1717 = float(_130);
    float _1719 = trunc(_1685);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = float(_1274);
    float _1727 = _1332 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1729 = as_type<float>(_1709);
    if (_1228)
    {
        float _1731 = _1651 ? as_type<float>(_1699) : _1214;
        _1288 = _1731;
    }
    float _1733 = _1288;
    int _1735 = int(_1441) + int(_1679);
    float _1737 = _1683 * _1725;
    float _1739 = float(_1404);
    float _1741 = trunc(_1715);
    float _1743 = precise::max(_1741, 0.0);
    uint _1745 = uint(_1743);
    float _1747 = -_1589;
    float _1749 = _1569 + _1747;
    float _1751 = float(_1346);
    bool _1753 = _1739 >= _1725;
    bool _1755 = isnan(_1739);
    bool _1757 = _1753 || _1755;
    bool _1759 = isnan(_1725);
    bool _1761 = _1757 || _1759;
    float _1763 = float(_1761);
    float _1765 = float(_1360);
    float _1767 = floor(_1599);
    int _1769 = int(_1435) + int(_1723);
    int _1771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1773 = _1771 != 0;
    int _1775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1777 = _1775 != 0;
    float _1779 = 1.0 / _1717;
    int _1781 = _1689 * int(_1745);
    int _1783 = _1781 + _1416;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1787 = float(uint(_1783));
    float _1789 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1791 = trunc(_1611);
    float _1793 = precise::max(_1791, 0.0);
    uint _1795 = uint(_1793);
    float _1797 = _1725 * _164;
    float _1799 = -_1767;
    float _1801 = _1599 + _1799;
    float _1803 = as_type<float>(_1587) * _1787;
    float _1805 = float(_1398);
    float _1807 = _1751 * _1713;
    float _1809 = float(_1326);
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1813 = trunc(_1803);
    float _1815 = precise::max(_1813, 0.0);
    uint _1817 = uint(_1815);
    if (!_1567)
    {
        _1619 = _1214;
    }
    float _1819 = _1619;
    float _1821 = _1797 * _1779;
    float _1823 = _1819;
    if (_1567)
    {
        float _1825 = _1703 ? as_type<float>(_1637) : _1214;
        _1823 = _1825;
    }
    float _1827 = _1823;
    float _1829 = _1779 * _164;
    float _1831 = float(_1374);
    float _1833 = _1809 * _1749;
    bool _1835 = _1805 >= _1751;
    bool _1837 = isnan(_1805);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1751);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1809 * _1829;
    int _1849 = int(_1447) + int(_1795);
    float _1851 = _1765 * _1829;
    float _1853 = float(_1416);
    float _1855 = trunc(_1845);
    int _1857 = int(_1855);
    bool _1859 = _1831 >= _1809;
    bool _1861 = isnan(_1831);
    bool _1863 = _1859 || _1861;
    bool _1865 = isnan(_1809);
    bool _1867 = _1863 || _1865;
    float _1869 = float(_1867);
    float _1871 = _1765 * _1801;
    bool _1873 = _1853 >= _1765;
    bool _1875 = isnan(_1853);
    bool _1877 = _1873 || _1875;
    bool _1879 = isnan(_1765);
    bool _1881 = _1877 || _1879;
    float _1883 = float(_1881);
    int _1885 = _1643 * _1849;
    int _1887 = _1885 + _1404;
    int _1889 = _1709 * _1735;
    int _1891 = _1889 + _1398;
    int _1893 = int(_1745) + int(_1817);
    float _1895 = trunc(_1763);
    int _1897 = int(_1895);
    bool _1899 = !_1773;
    int _1901 = _1899 ? 0 : 1;
    float _1903 = _1751 * _1829;
    bool _1905 = uint(_1887) >= uint(_1274);
    int _1907 = _1673 * _1769;
    int _1909 = _1907 + _1374;
    int _1911 = abs(_1901);
    int _1913 = ~_1360;
    int _1915 = _1913 + 1;
    float _1917 = trunc(_1737);
    int _1919 = int(_1917);
    bool _1921 = uint(_1891) >= uint(_1346);
    bool _1923 = uint(_1909) >= uint(_1326);
    int _1925 = _1915 * _1893;
    int _1927 = _1925 + _1416;
    bool _1929 = !_1777;
    int _1931 = _1929 ? 0 : 1;
    bool _1933 = !_1905;
    int _1935 = _1933 ? 0 : (-1);
    float _1937 = trunc(_1807);
    int _1939 = int(_1937);
    bool _1941 = !_1921;
    int _1943 = _1941 ? 0 : (-1);
    int _1945 = abs(_1931);
    int _1947 = ~_1849;
    int _1949 = _1947 + _1935;
    int _1951 = _1949 + 1;
    bool _1953 = !_1923;
    int _1955 = _1953 ? 0 : (-1);
    float _1957 = trunc(_1869);
    int _1959 = int(_1957);
    bool _1961 = uint(_1927) >= uint(_1360);
    int _1963 = _1919 * _1911;
    int _1965 = _1963 + _1404;
    int _1967 = ~_1735;
    int _1969 = _1967 + _1943;
    int _1971 = _1969 + 1;
    int _1973 = ~_1769;
    int _1975 = _1973 + _1955;
    int _1977 = _1975 + 1;
    int _1979 = _1274 * _1951;
    int _1981 = _1979 + _1404;
    bool _1983 = !_1961;
    int _1985 = _1983 ? 0 : (-1);
    int _1987 = _1939 * _1945;
    int _1989 = _1987 + _1398;
    int _1991 = _1346 * _1971;
    int _1993 = _1991 + _1398;
    int _1995 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1997 = _1995 != 0;
    float _1999 = trunc(_1833);
    int _2001 = int(_1999);
    int _2003 = ~_1893;
    int _2005 = _2003 + _1985;
    int _2007 = _2005 + 1;
    int _2009 = _1326 * _1977;
    int _2011 = _2009 + _1374;
    int _2013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2015 = _2013 != 0;
    int _2017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2019 = _2017 != 0;
    int _2021 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2023 = _2021 != 0;
    bool _2025 = _1346 == 0;
    int _2027 = _1360 * _2007;
    int _2029 = _2027 + _1416;
    bool _2031 = !_1997;
    int _2033 = _2031 ? 0 : 1;
    float _2035 = trunc(_1883);
    int _2037 = int(_2035);
    bool _2039 = _1274 == 0;
    bool _2041 = _1326 == 0;
    int _2043 = ~_1857;
    int _2045 = _2043 + 1;
    int _2047 = _2045 + 1;
    bool _2049 = _1360 == 0;
    float _2051 = trunc(_1821);
    int _2053 = int(_2051);
    bool _2055 = !_2025;
    int _2057 = _2055 ? _1993 : (-1);
    int _2059 = ~_1897;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    bool _2065 = !_2039;
    int _2067 = _2065 ? _1981 : (-1);
    int _2069 = _2047 * _2057;
    int _2071 = abs(_2033);
    float _2073 = trunc(_1903);
    int _2075 = int(_2073);
    int _2077 = ~_1959;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    int _2083 = _2067 * _2063;
    bool _2085 = !_2041;
    int _2087 = _2085 ? _2011 : (-1);
    int _2089 = _2001 * _2071;
    int _2091 = _2089 + _1374;
    bool _2093 = !_2049;
    int _2095 = _2093 ? _2029 : (-1);
    int _2097 = _1274 + (-1);
    int _2099 = _2081 * _2087;
    bool _2101 = !_2019;
    int _2103 = _2101 ? 0 : 1;
    float _2105 = floor(_1665);
    int _2107 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2109 = _2107 != 0;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2113 = _2111 != 0;
    int _2115 = _1897 * _2097;
    int _2117 = _2115 + _2083;
    int _2119 = _1346 + (-1);
    int _2121 = abs(_2103);
    bool _2123 = !_2015;
    int _2125 = _2123 ? 0 : 1;
    int _2127 = _1857 * _2119;
    int _2129 = _2127 + _2069;
    bool _2131 = !_2113;
    int _2133 = _2131 ? 0 : 1;
    int _2135 = _2117 * _2121;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2139 = _2137 != 0;
    int _2141 = abs(_2125);
    int _2143 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2145 = _2143 != 0;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2149 = _2147 != 0;
    bool _2151 = !_2023;
    int _2153 = _2151 ? 0 : 1;
    int _2155 = _2053 * _2141;
    int _2157 = _2155 + _2135;
    int _2159 = abs(_2133);
    bool _2161 = !_2145;
    int _2163 = _2161 ? 0 : 1;
    int _2165 = abs(_2153);
    int _2167 = _2129 * _2159;
    bool _2169 = !_2139;
    int _2171 = _2169 ? 0 : 1;
    int _2173 = abs(_2163);
    bool _2175 = !_2109;
    int _2177 = _2175 ? 0 : 1;
    int _2179 = abs(_2171);
    int _2181 = _1965 * _2165;
    int _2183 = _2181 + _2157;
    int _2185 = abs(_2177);
    int _2187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2189 = _2187 != 0;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2193 = _2191 != 0;
    int _2195 = _2075 * _2185;
    int _2197 = _2195 + _2167;
    bool _2199 = !_2149;
    int _2201 = _2199 ? 0 : 1;
    int _2203 = _1919 * _2179;
    int _2205 = _2203 + _2183;
    float _2207 = trunc(_1871);
    int _2209 = int(_2207);
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2213 = _2211 != 0;
    int _2215 = abs(_2201);
    int _2217 = _1989 * _2173;
    int _2219 = _2217 + _2197;
    bool _2221 = !_2213;
    int _2223 = _2221 ? 0 : 1;
    bool _2225 = !_2193;
    int _2227 = _2225 ? 0 : 1;
    float _2229 = trunc(_1847);
    int _2231 = int(_2229);
    float _2233 = float(uint(_2205));
    int _2235 = abs(_2223);
    int _2237 = _1939 * _2215;
    int _2239 = _2237 + _2219;
    int _2241 = abs(_2227);
    float _2243 = as_type<float>(_1384) * _2233;
    int _2245 = _1326 + (-1);
    bool _2247 = !_2189;
    int _2249 = _2247 ? 0 : 1;
    float _2251 = trunc(_2243);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = ~_2037;
    int _2259 = _2257 + 1;
    int _2261 = _2259 + 1;
    int _2263 = _1959 * _2245;
    int _2265 = _2263 + _2099;
    int _2267 = abs(_2249);
    float _2269 = in.m_73.y;
    int _2271 = _2261 * _2095;
    float _2273 = float(uint(_2239));
    int _2275 = _2265 * _2241;
    int _2277 = _1360 + (-1);
    int _2279 = _2209 * _2235;
    int _2281 = _2279 + _1416;
    int _2283 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2285 = _2283 != 0;
    float _2287 = as_type<float>(_1406) * _2273;
    int _2289 = _2231 * _2267;
    int _2291 = _2289 + _2275;
    int _2293 = ~_1274;
    int _2295 = _2293 + 1;
    int _2297 = _2037 * _2277;
    int _2299 = _2297 + _2271;
    bool _2301 = !_2285;
    int _2303 = _2301 ? 0 : 1;
    float _2305 = trunc(_2287);
    float _2307 = precise::max(_2305, 0.0);
    uint _2309 = uint(_2307);
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2313 = _2311 != 0;
    int _2315 = abs(_2303);
    int _2317 = _2295 * int(_2255);
    int _2319 = _2317 + _2205;
    bool _2321 = !_2313;
    int _2323 = _2321 ? 0 : 1;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2327 = _2325 != 0;
    int _2329 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2331 = _2329 != 0;
    float _2333 = trunc(_1851);
    int _2335 = int(_2333);
    int _2337 = ~_1346;
    int _2339 = _2337 + 1;
    float _2341 = float(uint(_2319));
    int _2343 = _2091 * _2315;
    int _2345 = _2343 + _2291;
    bool _2347 = !_2331;
    int _2349 = _2347 ? 0 : 1;
    float _2351 = -_2269;
    float _2353 = _2351 + 1.0;
    float _2355 = as_type<float>(_1384) * _2341;
    bool _2357 = !_2327;
    int _2359 = _2357 ? 0 : 1;
    int _2361 = abs(_2349);
    int _2363 = _2339 * int(_2309);
    int _2365 = _2363 + _2239;
    int _2367 = abs(_2323);
    float _2369 = trunc(_2355);
    float _2371 = precise::max(_2369, 0.0);
    uint _2373 = uint(_2371);
    int _2375 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2377 = _2375 != 0;
    int _2379 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2381 = _2379 != 0;
    int _2383 = abs(_2359);
    float _2385 = float(uint(_2365));
    int _2387 = _2299 * _2361;
    bool _2389 = !_2377;
    int _2391 = _2389 ? 0 : 1;
    int _2393 = _2001 * _2367;
    int _2395 = _2393 + _2345;
    int _2397 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2399 = _2397 != 0;
    float _2401 = as_type<float>(_1406) * _2385;
    int _2403 = abs(_2391);
    float _2405 = float(uint(_2395));
    float _2407 = trunc(_2401);
    float _2409 = precise::max(_2407, 0.0);
    uint _2411 = uint(_2409);
    int _2413 = _2335 * _2383;
    int _2415 = _2413 + _2387;
    bool _2417 = !_2381;
    int _2419 = _2417 ? 0 : 1;
    float _2421 = as_type<float>(_1388) * _2405;
    int _2423 = int(_2255) + int(_2373);
    int _2425 = _2281 * _2403;
    int _2427 = _2425 + _2415;
    int _2429 = ~_1274;
    int _2431 = _2429 + 1;
    float _2433 = trunc(_2421);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    int _2439 = abs(_2419);
    float _2441 = in.m_63.w;
    int _2443 = _2431 * _2423;
    int _2445 = _2443 + _2205;
    int _2447 = ~_1326;
    int _2449 = _2447 + 1;
    int _2451 = _2209 * _2439;
    int _2453 = _2451 + _2427;
    int _2455 = ~_1346;
    int _2457 = _2455 + 1;
    int _2459 = _2209;
    float _2461 = as_type<float>(_2011);
    float _2463 = as_type<float>(_1893);
    if (_2399)
    {
        float _2465 = -_1214;
        float _2467 = _2465 + 1.0;
        _2459 = as_type<int>(_2467);
    }
    int _2469 = _2459;
    bool _2471 = uint(_2445) >= uint(_1274);
    int _2473 = int(_2309) + int(_2411);
    bool _2475 = !_2471;
    int _2477 = _2475 ? 0 : (-1);
    int _2479 = _2457 * _2473;
    int _2481 = _2479 + _2239;
    float _2483 = float(uint(_2453));
    int _2485 = _2449 * int(_2437);
    int _2487 = _2485 + _2395;
    bool _2489 = _1220 > 0.5;
    int _2491 = ~_2423;
    int _2493 = _2491 + _2477;
    int _2495 = _2493 + 1;
    float _2497 = as_type<float>(_1587) * _2483;
    if (_2399)
    {
        float _2499 = _2489 ? as_type<float>(_2469) : _1214;
        _1284 = _2499;
    }
    float _2501 = _1284;
    bool _2503 = uint(_2481) >= uint(_1346);
    int _2505 = _1274 * _2495;
    int _2507 = _2505 + _2205;
    float _2509 = float(uint(_2487));
    float _2511 = trunc(_2497);
    float _2513 = precise::max(_2511, 0.0);
    uint _2515 = uint(_2513);
    bool _2517 = _1274 == 0;
    bool _2519 = !_2503;
    int _2521 = _2519 ? 0 : (-1);
    bool _2523 = _2441 > 0.5;
    float _2525 = as_type<float>(_1388) * _2509;
    bool _2527 = !_2517;
    int _2529 = _2527 ? _2507 : (-1);
    int _2531 = _2523 ? as_type<int>(_2353) : as_type<int>(_2269);
    float _2533 = trunc(_2525);
    float _2535 = precise::max(_2533, 0.0);
    uint _2537 = uint(_2535);
    int _2539 = _2529 & 3;
    bool _2541 = _2539 != 0;
    int _2543 = _2529 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = uint(_2539) >= 2u;
    int _2549 = _2545 ? 0 : 1;
    int _2551 = ~_2473;
    int _2553 = _2551 + _2521;
    int _2555 = _2553 + 1;
    bool _2557 = uint(_2539) > 1u;
    int _2559 = ~_1360;
    int _2561 = _2559 + 1;
    int _2563 = _1346 * _2555;
    int _2565 = _2563 + _2239;
    int _2567 = _2547 ? 0 : 1;
    bool _2569 = _2539 != 3;
    int _2571 = _2561 * int(_2515);
    int _2573 = _2571 + _2453;
    int _2575 = _2489 ? as_type<int>(_2353) : as_type<int>(_2269);
    bool _2577 = _1346 == 0;
    int _2579 = ~_1326;
    int _2581 = _2579 + 1;
    bool _2583 = !_2577;
    int _2585 = _2583 ? _2565 : (-1);
    int _2587 = int(_2437) + int(_2537);
    float _2589 = float(uint(_2573));
    int _2591 = ~_2549;
    int _2593 = _2591 + 1;
    int _2595 = _2593 + 1;
    float _2597 = as_type<float>(_1587) * _2589;
    int _2599 = _2595;
    if (!_2557)
    {
        int _2601 = ~_2549;
        int _2603 = _2601 + 1;
        _2599 = _2603;
    }
    int _2605 = _2599;
    int _2607 = _2585 & 3;
    bool _2609 = _2607 != 0;
    int _2611 = _2581 * _2587;
    int _2613 = _2611 + _2395;
    int _2615 = ~_2567;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2619;
    if (_2569)
    {
        int _2623 = ~_2567;
        int _2625 = _2623 + 1;
        _2621 = _2625;
    }
    int _2627 = _2621;
    bool _2629 = uint(_2607) >= 2u;
    float _2631 = trunc(_2597);
    float _2633 = precise::max(_2631, 0.0);
    uint _2635 = uint(_2633);
    int _2637 = _2609 ? 0 : 1;
    bool _2639 = uint(_2613) >= uint(_1326);
    int _2641 = _2629 ? 0 : 1;
    bool _2643 = _2607 != 3;
    bool _2645 = !_2639;
    int _2647 = _2645 ? 0 : (-1);
    bool _2649 = uint(_2607) > 1u;
    int _2651 = ~_2587;
    int _2653 = _2651 + _2647;
    int _2655 = _2653 + 1;
    int _2657 = ~_2641;
    int _2659 = _2657 + 1;
    int _2661 = _2659 + 1;
    bool _2663 = _1326 == 0;
    int _2665 = _1326 * _2655;
    int _2667 = _2665 + _2395;
    int _2669 = ~_2637;
    int _2671 = _2669 + 1;
    int _2673 = _2671 + 1;
    int _2675 = _2661;
    int _2677 = _2673;
    if (_2643)
    {
        int _2679 = ~_2641;
        int _2681 = _2679 + 1;
        _2675 = _2681;
    }
    int _2683 = _2675;
    int _2685 = ~_1360;
    int _2687 = _2685 + 1;
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2691 = _2689 != 0;
    if (!_2649)
    {
        int _2693 = ~_2637;
        int _2695 = _2693 + 1;
        _2677 = _2695;
    }
    int _2697 = _2677;
    bool _2699 = !_2663;
    int _2701 = _2699 ? _2667 : (-1);
    int _2703 = int(_2515) + int(_2635);
    bool _2705 = !_2691;
    int _2707 = _2705 ? 0 : 1;
    int _2709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2711 = _2709 != 0;
    int _2713 = _2687 * _2703;
    int _2715 = _2713 + _2453;
    int _2717 = _2701 & 3;
    bool _2719 = _2717 != 0;
    bool _2721 = !_2711;
    int _2723 = _2721 ? 0 : 1;
    bool _2725 = uint(_2717) >= 2u;
    int _2727 = _2719 ? 0 : 1;
    bool _2729 = uint(_2715) >= uint(_1360);
    int _2731 = _2725 ? 0 : 1;
    bool _2733 = _2717 != 3;
    bool _2735 = !_2729;
    int _2737 = _2735 ? 0 : (-1);
    bool _2739 = uint(_2717) > 1u;
    int _2741 = ~_2703;
    int _2743 = _2741 + _2737;
    int _2745 = _2743 + 1;
    int _2747 = ~_2731;
    int _2749 = _2747 + 1;
    int _2751 = _2749 + 1;
    bool _2753 = _1360 == 0;
    int _2755 = _1360 * _2745;
    int _2757 = _2755 + _2453;
    int _2759 = ~_2727;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = _2751;
    int _2767 = _2763;
    if (_2733)
    {
        int _2769 = ~_2731;
        int _2771 = _2769 + 1;
        _2765 = _2771;
    }
    int _2773 = _2765;
    int _2775 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2777 = _2775 != 0;
    bool _2779 = !_2753;
    int _2781 = _2779 ? _2757 : (-1);
    float _2783 = _2777 ? as_type<float>(_2575) : _2269;
    if (!_2739)
    {
        int _2785 = ~_2727;
        int _2787 = _2785 + 1;
        _2767 = _2787;
    }
    int _2789 = _2767;
    int _2791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2793 = _2791 != 0;
    int _2795 = _2781 & 3;
    bool _2797 = _2795 != 0;
    bool _2799 = !_2793;
    int _2801 = _2799 ? 0 : 1;
    bool _2803 = uint(_2795) >= 2u;
    int _2805 = _2797 ? 0 : 1;
    int _2807 = _2803 ? 0 : 1;
    bool _2809 = _2795 != 3;
    bool _2811 = uint(_2795) > 1u;
    int _2813 = ~_2807;
    int _2815 = _2813 + 1;
    int _2817 = _2815 + 1;
    int _2819 = ~_2805;
    int _2821 = _2819 + 1;
    int _2823 = _2821 + 1;
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2827 = _2825 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2829 = _2817;
    int _2831 = _2823;
    if (_2809)
    {
        int _2833 = ~_2807;
        int _2835 = _2833 + 1;
        _2829 = _2835;
    }
    int _2837 = _2829;
    float _2839 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2841 = _2839 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2811)
    {
        int _2843 = ~_2805;
        int _2845 = _2843 + 1;
        _2831 = _2845;
    }
    int _2847 = _2831;
    float _2849 = 1.0 / _2827;
    float _2851 = in.m_48.x;
    float _2853 = in.m_48.y;
    float _2855 = in.m_48.z;
    bool _2857 = _1547 > 0.5;
    float _2859 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2863 = _2861 != 0;
    int _2865 = _2857 ? as_type<int>(_2353) : as_type<int>(_2269);
    float _2867 = _2863 ? as_type<float>(_2531) : _2269;
    float _2869 = 1.0 / _2841;
    int _2871 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2873 = _2871 != 0;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2877 = _2875 != 0;
    float _2879 = _2873 ? as_type<float>(_2865) : _2269;
    float _2881 = _2877 ? as_type<float>(_2865) : _2269;
    bool _2883 = !_1645;
    float _2885 = _2883 ? as_type<float>(_1549) : as_type<float>(_1551);
    bool _2887 = !_1645;
    float _2889 = _2887 ? as_type<float>(_1553) : as_type<float>(_1549);
    float _2891 = _202 * _2853;
    float _2893 = _196 * _2853;
    float _2895 = _208 * _2853;
    float _2897 = fma(_200, _2851, _2891);
    float _2899 = fma(_194, _2851, _2893);
    float _2901 = fma(_206, _2851, _2895);
    if (!_1645)
    {
        _1729 = _1547;
    }
    float _2903 = _1729;
    float _2905 = fma(_204, _2855, _2897);
    float _2907 = fma(_198, _2855, _2899);
    float _2909 = 0.0;
    float _2911 = _2903;
    if (!_1645)
    {
        _2909 = _1547;
    }
    float _2913 = _2909;
    float _2915 = as_type<float>(_1549) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2917 = _2913;
    if (!_1645)
    {
        _1693 = _1220;
    }
    float _2919 = _1693;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2923 = 0.0;
    float _2925 = _2919;
    if (!_1645)
    {
        _2923 = _1220;
    }
    float _2927 = _2923;
    float _2929 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2931 = _2927;
    if (_1657)
    {
        _2461 = _1535;
    }
    float _2933 = _2461;
    float _2935 = fma(as_type<float>(_1549), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2921);
    float _2937 = _2933;
    if (_1645)
    {
        _2911 = _1220;
    }
    float _2939 = _2911;
    float _2941 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2943 = log2(_2941);
    if (_1645)
    {
        _2917 = _1220;
    }
    float _2945 = _2917;
    float _2947 = _1535 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1657)
    {
        _2463 = _1220;
    }
    float _2949 = _2463;
    float _2951 = fma(_210, _2855, _2901);
    float _2953 = _2949;
    if (_1645)
    {
        _2925 = _1535;
    }
    float _2955 = _2925;
    float _2957 = fma(_2889, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1785);
    if (_1645)
    {
        _2931 = _1535;
    }
    float _2959 = _2931;
    float _2961 = _2889 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1657)
    {
        _2937 = _1547;
    }
    float _2963 = _2937;
    float _2965 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1657)
    {
        _2953 = _1535;
    }
    float _2967 = _2953;
    float _2969 = fma(_2961, -2.0, _1811);
    int _2971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2973 = _2971 != 0;
    int _2975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2977 = _2975 != 0;
    float _2979 = fma(as_type<float>(_1551), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2965);
    int _2981 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2983 = _2981 != 0;
    float _2985 = _2943 * _164;
    float _2987 = as_type<float>(_1551) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2989 = _2955 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2993 = exp2(_2985);
    float _2995 = _2973 ? as_type<float>(_2865) : _2269;
    float _2997 = fma(_2929, -2.0, _2991);
    bool _2999 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3001 = isnan(0.0);
    bool _3003 = _2999 || _3001;
    bool _3005 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3007 = _3003 || _3005;
    float _3009 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _3009;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _3017 = _3011 * _2849;
    float _3019 = fma(_2915, -2.0, _3013);
    float _3021 = fma(_2959, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3015);
    float _3023 = _2963 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _3025 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3027 = -_2993;
    float _3029 = _3027 + 1.0;
    float _3031 = -_3025;
    float _3033 = fma(_2947, 2.0, _3031);
    float _3035 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3037 = _3007 ? _3029 : 0.0;
    float _3039 = -_2859;
    float _3041 = fma(_3023, 2.0, _3039);
    float _3043 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3047 = -_3035;
    float _3049 = fma(_2987, 2.0, _3047);
    float _3051 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3043);
    float _3053 = _2939 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3057 = _3055 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3061 = fma(_3053, -2.0, _1789);
    float _3063 = _2977 ? as_type<float>(_2865) : _2269;
    float _3065 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3067 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3069 = _3067 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3071 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3073 = _3071 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3075 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3077 = isnan(1.0);
    bool _3079 = _3075 || _3077;
    bool _3081 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3083 = _3079 || _3081;
    float _3085 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3087 = 1.0 + _3085;
    float _3089 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3045);
    float _3091 = 1.0 / _3087;
    float _3093 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3059);
    float _3095 = _1535 * 2.0;
    float _3097 = fma(_2885, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3065);
    float _3099 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3101 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3103 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3105 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3107 = 1.0 / _3057;
    float _3109 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3111 = _2967 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3113 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3115 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3093);
    float _3117 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3099);
    float _3119 = -_3103;
    float _3121 = fma(_3105, 2.0, _3119);
    float _3123 = floor(_3095);
    float _3125 = -_3101;
    float _3127 = fma(_2989, 2.0, _3125);
    float _3129 = fma(_3111, -2.0, _3109);
    float _3131 = fma(_1535, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3113);
    float _3133 = _3069 * _2869;
    float _3135 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3137 = _3135 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3139 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3117);
    float _3141 = 1.0 / _3073;
    float _3143 = -_164;
    float _3145 = fma(_3143, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3049);
    float _3147 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3019);
    float _3149 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2997);
    float _3151 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3089);
    float _3153 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3131);
    float _3155 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2979);
    float _3157 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2935);
    float _3159 = -_164;
    float _3161 = fma(_3159, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3033);
    float _3163 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3097);
    float _3165 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2957);
    float _3167 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3021);
    float _3169 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3051);
    float _3171 = -_164;
    float _3173 = fma(_3171, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3121);
    float _3175 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2969);
    float _3177 = -_164;
    float _3179 = fma(_3177, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3127);
    float _3181 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3061);
    float _3183 = -_164;
    float _3185 = fma(_3183, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3041);
    float _3187 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3129);
    if (_3083)
    {
        float _3189 = _3037 * _3091;
        _168 = _3189;
    }
    float _3191 = _168;
    float _3193 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3195 = _3193 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3197 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3199 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3197;
    float _3201 = 1.0 / _3137;
    float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3205 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3203;
    float _3207 = _3199 * _3107;
    bool _3209 = _3123 >= 0.0;
    bool _3211 = isnan(_3123);
    bool _3213 = _3209 || _3211;
    bool _3215 = isnan(0.0);
    bool _3217 = _3213 || _3215;
    float _3219 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3221 = _3219 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3223 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3225 = _3223 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3227 = _3205 * _3141;
    float _3229 = float(uint(_1989));
    float _3231 = 1.0 / _3195;
    int _3233 = _3217 ? 0 : 1;
    float _3235 = in.m_57.w;
    bool _3237 = _3123 > 0.0;
    float _3239 = as_type<float>(_1406) * _3229;
    float _3241 = float(uint(_1965));
    float _3243 = _3225 * _3201;
    float _3245 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3247 = _3245 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3249 = 1.0 / _3221;
    float _3251 = as_type<float>(_1384) * _3241;
    int _3253 = ~_1346;
    int _3255 = _3253 + 1;
    float _3257 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3259 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3257;
    int _3261 = ~_1326;
    int _3263 = _3261 + 1;
    float _3265 = _3247 * _3231;
    int _3267 = ~_3233;
    int _3269 = _3267 + 1;
    int _3271 = _3269 + 1;
    float _3273 = trunc(_3239);
    float _3275 = precise::max(_3273, 0.0);
    uint _3277 = uint(_3275);
    int _3279 = _3271;
    if (!_3237)
    {
        int _3281 = ~_3233;
        int _3283 = _3281 + 1;
        _3279 = _3283;
    }
    int _3285 = _3279;
    float _3287 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3289 = _1208 + _3287;
    float _3291 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3293 = _1208 + _3291;
    bool _3295 = _2105 >= 0.0;
    bool _3297 = isnan(_2105);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan(0.0);
    bool _3303 = _3299 || _3301;
    float _3305 = fma(_3017, _3289, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3307 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3309 = _1208 + _3307;
    float _3311 = trunc(_3251);
    float _3313 = precise::max(_3311, 0.0);
    uint _3315 = uint(_3313);
    float _3317 = fma(_3133, _3293, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3319 = _3259 * _3249;
    float _3321 = fma(_3243, _3309, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3323 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3325 = _1208 + _3323;
    int _3327 = ~_1274;
    int _3329 = _3327 + 1;
    int _3331 = _3303 ? 0 : 1;
    int _3333 = _3255 * int(_3277);
    int _3335 = _3333 + _1989;
    float _3337 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3339 = _1208 + _3337;
    bool _3341 = _2105 > 0.0;
    float _3343 = float(uint(_2281));
    float _3345 = fma(_3207, _3339, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3347 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3349 = _1208 + _3347;
    int _3351 = ~_1360;
    int _3353 = _3351 + 1;
    int _3355 = _3329 * int(_3315);
    int _3357 = _3355 + _1965;
    float _3359 = as_type<float>(_1587) * _3343;
    float _3361 = fma(_3227, _3349, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3363 = fma(_3265, _3325, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3365 = float(uint(_3335));
    float _3367 = float(uint(_2091));
    float _3369 = trunc(_3359);
    float _3371 = precise::max(_3369, 0.0);
    uint _3373 = uint(_3371);
    float _3375 = float(uint(_3357));
    float _3377 = as_type<float>(_1406) * _3365;
    bool _3379 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3381 = isnan(_1208);
    bool _3383 = _3379 || _3381;
    bool _3385 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3387 = _3383 || _3385;
    float _3389 = float(_3387);
    float _3391 = as_type<float>(_1388) * _3367;
    bool _3393 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3395 = isnan(_1208);
    bool _3397 = _3393 || _3395;
    bool _3399 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3401 = _3397 || _3399;
    float _3403 = float(_3401);
    float _3405 = as_type<float>(_1384) * _3375;
    bool _3407 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3409 = isnan(_1208);
    bool _3411 = _3407 || _3409;
    bool _3413 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3415 = _3411 || _3413;
    float _3417 = float(_3415);
    float _3419 = -_3389;
    float _3421 = _3419 + 1.0;
    bool _3423 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3425 = isnan(_1208);
    bool _3427 = _3423 || _3425;
    bool _3429 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3431 = _3427 || _3429;
    float _3433 = float(_3431);
    float _3435 = trunc(_3391);
    float _3437 = precise::max(_3435, 0.0);
    uint _3439 = uint(_3437);
    int _3441 = _2585 & 3;
    bool _3443 = _3441 != 0;
    float _3445 = -_3417;
    float _3447 = _3445 + 1.0;
    float _3449 = _3417 * _3421;
    bool _3451 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3453 = isnan(_1208);
    bool _3455 = _3451 || _3453;
    bool _3457 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3459 = _3455 || _3457;
    float _3461 = float(_3459);
    float _3463 = _3403 * _3447;
    float _3465 = -_3403;
    float _3467 = _3465 + 1.0;
    float _3469 = trunc(_3405);
    float _3471 = precise::max(_3469, 0.0);
    uint _3473 = uint(_3471);
    bool _3475 = _2795 != 3;
    float _3477 = _3433 * _3467;
    float _3479 = -_3433;
    float _3481 = _3479 + 1.0;
    bool _3483 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3485 = isnan(_1208);
    bool _3487 = _3483 || _3485;
    bool _3489 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3491 = _3487 || _3489;
    float _3493 = float(_3491);
    bool _3495 = !_3475;
    int _3497 = _3495 ? 0 : (-1);
    int _3499 = _3263 * int(_3439);
    int _3501 = _3499 + _2091;
    float _3503 = _3461 * _3481;
    float _3505 = -_3461;
    float _3507 = _3505 + 1.0;
    bool _3509 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3511 = isnan(_1208);
    bool _3513 = _3509 || _3511;
    bool _3515 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3517 = _3513 || _3515;
    float _3519 = float(_3517);
    float _3521 = -_3493;
    float _3523 = _3521 + 1.0;
    float _3525 = float(uint(_3501));
    float _3527 = _3493 * _3507;
    bool _3529 = _1208 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3531 = isnan(_1208);
    bool _3533 = _3529 || _3531;
    bool _3535 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3537 = _3533 || _3535;
    float _3539 = float(_3537);
    float _3541 = _3519 * _3523;
    float _3543 = -_3519;
    float _3545 = _3543 + 1.0;
    float _3547 = as_type<float>(_1388) * _3525;
    float _3549 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3551 = _1208 + _3549;
    float _3553 = _2907 + _3235;
    float _3555 = trunc(_3377);
    float _3557 = precise::max(_3555, 0.0);
    uint _3559 = uint(_3557);
    int _3561 = _3353 * int(_3373);
    int _3563 = _3561 + _2281;
    float _3565 = _3539 * _3545;
    float _3567 = fma(_3319, _3551, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3569 = _2905 + _1669;
    float _3571 = -_3539;
    float _3573 = _3571 + 1.0;
    float _3575 = float(uint(_3563));
    float _3577 = _3305 * _3565;
    float _3579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3581 = ~_3331;
    int _3583 = _3581 + 1;
    int _3585 = _3583 + 1;
    float _3587 = fma(_3573, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3577);
    float _3589 = as_type<float>(_1587) * _3575;
    float _3591 = _2951 + _1705;
    int _3593 = _3585;
    if (!_3341)
    {
        int _3595 = ~_3331;
        int _3597 = _3595 + 1;
        _3593 = _3597;
    }
    int _3599 = _3593;
    float _3601 = fma(_3317, _3541, _3587);
    float _3603 = trunc(_3547);
    float _3605 = precise::max(_3603, 0.0);
    uint _3607 = uint(_3605);
    int _3609 = ~_1274;
    int _3611 = _3609 + 1;
    int _3613 = int(_3315) + int(_3473);
    float _3615 = fma(_3345, _3527, _3601);
    int _3617 = ~_1346;
    int _3619 = _3617 + 1;
    int _3621 = int(_3277) + int(_3559);
    float _3623 = trunc(_3589);
    float _3625 = precise::max(_3623, 0.0);
    uint _3627 = uint(_3625);
    int _3629 = _3611 * _3613;
    int _3631 = _3629 + _1965;
    float _3633 = _3579 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3635 = !_2983;
    int _3637 = _3635 ? 0 : 1;
    float _3639 = fma(_3321, _3503, _3615);
    int _3641 = ~_1326;
    int _3643 = _3641 + 1;
    int _3645 = _3619 * _3621;
    int _3647 = _3645 + _1989;
    int _3649 = int(_3439) + int(_3607);
    float _3651 = fma(_3633, _1322, -0.5);
    bool _3653 = uint(_3631) >= uint(_1274);
    float _3655 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3657 = _3569 + _3655;
    int _3659 = ~_1360;
    int _3661 = _3659 + 1;
    int _3663 = _3643 * _3649;
    int _3665 = _3663 + _2091;
    bool _3667 = !_3653;
    int _3669 = _3667 ? 0 : (-1);
    float _3671 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3673 = _3553 + _3671;
    bool _3675 = uint(_3647) >= uint(_1346);
    float _3677 = _1547 * 2.0;
    int _3679 = int(_3373) + int(_3627);
    float _3681 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3683 = _3591 + _3681;
    float _3685 = fma(_3361, _3477, _3639);
    bool _3687 = !_3675;
    int _3689 = _3687 ? 0 : (-1);
    float _3691 = floor(_3677);
    bool _3693 = uint(_3665) >= uint(_1326);
    float _3695 = _3657 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3697 = _3661 * _3679;
    int _3699 = _3697 + _2281;
    int _3701 = ~_3613;
    int _3703 = _3701 + _3669;
    int _3705 = _3703 + 1;
    float _3707 = fma(_3363, _3463, _3685);
    float _3709 = fma(_3673, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3695);
    bool _3711 = !_3693;
    int _3713 = _3711 ? 0 : (-1);
    float _3715 = _1220 + _1547;
    bool _3717 = uint(_3699) >= uint(_1360);
    float _3719 = fma(_3683, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3709);
    int _3721 = ~_3621;
    int _3723 = _3721 + _3689;
    int _3725 = _3723 + 1;
    float _3727 = _1220 + _1535;
    bool _3729 = !_3717;
    int _3731 = _3729 ? 0 : (-1);
    float _3733 = fma(_3567, _3449, _3707);
    bool _3735 = _3719 >= 0.0;
    int _3737 = _1274 * _3705;
    int _3739 = _3737 + _1965;
    float _3741 = _3727 + (-1.0);
    int _3743 = _1346 * _3725;
    int _3745 = _3743 + _1989;
    bool _3747 = !_3443;
    int _3749 = _3747 ? 0 : 1;
    float _3751 = fma(_3389, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3733);
    float _3753 = fma(_3741, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3755 = _3657 * _3657;
    int _3757 = _2701 & 3;
    bool _3759 = _3757 != 0;
    float _3761 = _3715 + (-1.0);
    int _3763 = _2529 >> 31;
    float _3765 = fma(_3673, _3673, _3755);
    bool _3767 = !_3759;
    int _3769 = _3767 ? 0 : 1;
    float _3771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3773 = _2781 & 3;
    bool _3775 = _3773 != 0;
    float _3777 = fma(_3683, _3683, _3765);
    bool _3779 = !_2541;
    int _3781 = _3779 ? 0 : 1;
    out.m_75.x = _3751;
    bool _3783 = !_3775;
    int _3785 = _3783 ? 0 : 1;
    float _3787 = _1220 + (-0.5);
    bool _3789 = _2539 != 3;
    float _3791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3735)
    {
        out.m_51.x = 0.0;
    }
    bool _3793 = _3691 > 0.0;
    bool _3795 = _3691 >= 0.0;
    bool _3797 = isnan(_3691);
    bool _3799 = _3795 || _3797;
    bool _3801 = isnan(0.0);
    bool _3803 = _3799 || _3801;
    float _3805 = fma(_3761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3807 = _3691;
    if (_3735)
    {
        _3807 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3809 = _3807;
    float _3811 = rsqrt(_3777);
    int _3813 = _3763 & 3;
    int _3815 = _2585 >> 31;
    int _3817 = as_type<int>(_3809);
    if (_3735)
    {
        float _3819 = _3809 * 5.0;
        _3817 = as_type<int>(_3819);
    }
    int _3821 = _3817;
    int _3823 = _2529 + _3813;
    int _3825 = _2701 >> 31;
    int _3827 = _3823 >> 2;
    if (_3735)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12480 = as_type<float>(_3821);
        out.gl_Position.z = _12480;
    }
    int _3829 = _3815 & 3;
    int _3831 = _3825 & 3;
    int _3833 = _3827 << 4;
    int _3835 = _3833 + 368;
    float _3837 = _3657 * _3811;
    int _3839 = _2701 + _3831;
    float _3841 = _3673 * _3811;
    int _3843 = _2585 + _3829;
    float _3845 = -_3837;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3657);
    float _3849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3851 = _2781 >> 31;
    float _3853 = -_3841;
    float _3855 = fma(_3853, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3673);
    float _3857 = _3847 * _3847;
    int _3859 = _3839 >> 2;
    float _3861 = _3683 * _3811;
    int _3863 = _3851 & 3;
    float _3865 = fma(_3855, _3855, _3857);
    uint _3867 = uint(int(uint(_3835) >> uint(2)));
    uint _3869 = uint(int(uint(int(_3867)) >> uint(2)));
    int _3871 = int(_3867) & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = int(_3867) + 1;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    int _3879 = _3875 & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = _3859 << 4;
    int _3885 = _3883 + 656;
    float _3887 = -_3861;
    float _3889 = fma(_3887, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3683);
    int _3891 = _2781 + _3863;
    bool _3893 = !_3789;
    int _3895 = _3893 ? 0 : (-1);
    int _3897 = _3891 >> 2;
    float _3899 = _3849 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3901 = uint(int(uint(_3885) >> uint(2)));
    uint _3903 = uint(int(uint(int(_3901)) >> uint(2)));
    int _3905 = int(_3901) & 3;
    float _3907 = (*spvDescriptorSet0.vp_c9)._m0[int(_3903)][_3905];
    int _3909 = int(_3901) + 1;
    uint _3911 = uint(int(uint(_3909) >> uint(2)));
    int _3913 = _3909 & 3;
    float _3915 = (*spvDescriptorSet0.vp_c9)._m0[int(_3911)][_3913];
    int _3917 = _3843 >> 2;
    bool _3919 = _2607 != 3;
    float _3921 = fma(_3899, _2995, -0.5);
    int _3923 = _3917 << 4;
    int _3925 = _3923 + 512;
    float _3927 = fma(_3889, _3889, _3865);
    bool _3929 = !_3919;
    int _3931 = _3929 ? 0 : (-1);
    float _3933 = -_3175;
    float _3935 = fma(_3165, _3921, _3933);
    bool _3937 = _2717 != 3;
    uint _3939 = uint(int(uint(_3925) >> uint(2)));
    uint _3941 = uint(int(uint(int(_3939)) >> uint(2)));
    int _3943 = int(_3939) & 3;
    float _3945 = (*spvDescriptorSet0.vp_c9)._m0[int(_3941)][_3943];
    int _3947 = int(_3939) + 1;
    uint _3949 = uint(int(uint(_3947) >> uint(2)));
    int _3951 = _3947 & 3;
    float _3953 = (*spvDescriptorSet0.vp_c9)._m0[int(_3949)][_3951];
    int _3955 = _3897 << 4;
    int _3957 = _3955 + 800;
    float _3959 = _3063 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3961 = ~_3679;
    int _3963 = _3961 + _3731;
    int _3965 = _3963 + 1;
    float _3967 = _1727 * _3771;
    int _3969 = ~_3649;
    int _3971 = _3969 + _3713;
    int _3973 = _3971 + 1;
    float _3975 = _3959 * _3791;
    int _3977 = abs(_2605);
    float _3979 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3981 = int(_3979);
    bool _3983 = !_2517;
    int _3985 = _3983 ? _3739 : (-1);
    int _3987 = _3885 + 8;
    uint _3989 = uint(int(uint(_3987) >> uint(2)));
    uint _3991 = uint(int(uint(int(_3989)) >> uint(2)));
    int _3993 = int(_3989) & 3;
    float _3995 = (*spvDescriptorSet0.vp_c9)._m0[int(_3991)][_3993];
    int _3997 = int(_3989) + 1;
    uint _3999 = uint(int(uint(_3997) >> uint(2)));
    int _4001 = _3997 & 3;
    float _4003 = (*spvDescriptorSet0.vp_c9)._m0[int(_3999)][_4001];
    bool _4005 = !_2577;
    int _4007 = _4005 ? _3745 : (-1);
    out.m_77.x = _3967;
    out.m_77.y = _3975;
    int _4009 = _3803 ? 0 : 1;
    int _4011 = _1326 * _3973;
    int _4013 = _4011 + _2091;
    int _4015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _4017 = _4015 != 0;
    int _4019 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _4021 = _4019 != 0;
    int _4023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _4025 = _4023 != 0;
    int _4027 = _1360 * _3965;
    int _4029 = _4027 + _2281;
    int _4031 = ~_4009;
    int _4033 = _4031 + 1;
    int _4035 = _4033 + 1;
    uint _4037 = uint(int(uint(_3957) >> uint(2)));
    uint _4039 = uint(int(uint(int(_4037)) >> uint(2)));
    int _4041 = int(_4037) & 3;
    float _4043 = (*spvDescriptorSet0.vp_c9)._m0[int(_4039)][_4041];
    int _4045 = int(_4037) + 1;
    uint _4047 = uint(int(uint(_4045) >> uint(2)));
    int _4049 = _4045 & 3;
    float _4051 = (*spvDescriptorSet0.vp_c9)._m0[int(_4047)][_4049];
    int _4053 = _4035;
    if (!_3793)
    {
        int _4055 = ~_4009;
        int _4057 = _4055 + 1;
        _4053 = _4057;
    }
    int _4059 = _4053;
    float _4061 = fma(_3163, _3651, _3173);
    int _4063 = abs(_2697);
    float _4065 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4067 = int(_4065);
    int _4069 = ~_3977;
    int _4071 = _4069 + 1;
    int _4073 = _4071 + 1;
    int _4075 = abs(_2789);
    int _4077 = _3835 + 8;
    uint _4079 = uint(int(uint(_4077) >> uint(2)));
    uint _4081 = uint(int(uint(int(_4079)) >> uint(2)));
    int _4083 = int(_4079) & 3;
    float _4085 = (*spvDescriptorSet0.vp_c9)._m0[int(_4081)][_4083];
    int _4087 = int(_4079) + 1;
    uint _4089 = uint(int(uint(_4087) >> uint(2)));
    int _4091 = _4087 & 3;
    float _4093 = (*spvDescriptorSet0.vp_c9)._m0[int(_4089)][_4091];
    int _4095 = abs(_3769);
    int _4097 = _4073 * as_type<int>(_3881);
    int _4099 = abs(_3781);
    int _4101 = abs(_2847);
    int _4103 = _3925 + 8;
    uint _4105 = uint(int(uint(_4103) >> uint(2)));
    uint _4107 = uint(int(uint(int(_4105)) >> uint(2)));
    int _4109 = int(_4105) & 3;
    float _4111 = (*spvDescriptorSet0.vp_c9)._m0[int(_4107)][_4109];
    int _4113 = int(_4105) + 1;
    uint _4115 = uint(int(uint(_4113) >> uint(2)));
    int _4117 = _4113 & 3;
    float _4119 = (*spvDescriptorSet0.vp_c9)._m0[int(_4115)][_4117];
    int _4121 = ~_4099;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = ~_4075;
    int _4129 = _4127 + 1;
    int _4131 = _4129 + 1;
    int _4133 = ~_4095;
    int _4135 = _4133 + 1;
    int _4137 = _4135 + 1;
    int _4139 = _3957 + 8;
    uint _4141 = uint(int(uint(_4139) >> uint(2)));
    uint _4143 = uint(int(uint(int(_4141)) >> uint(2)));
    int _4145 = int(_4141) & 3;
    float _4147 = (*spvDescriptorSet0.vp_c9)._m0[int(_4143)][_4145];
    int _4149 = int(_4141) + 1;
    uint _4151 = uint(int(uint(_4149) >> uint(2)));
    int _4153 = _4149 & 3;
    float _4155 = (*spvDescriptorSet0.vp_c9)._m0[int(_4151)][_4153];
    int _4157 = abs(_3749);
    int _4159 = _4131 * as_type<int>(_3915);
    int _4161 = abs(_2773);
    int _4163 = _4125 * as_type<int>(_3873);
    int _4165 = _4163 + _4097;
    int _4167 = abs(_2627);
    int _4169 = _4137 * as_type<int>(_3907);
    int _4171 = _4169 + _4159;
    int _4173 = abs(_3785);
    int _4175 = ~_4063;
    int _4177 = _4175 + 1;
    int _4179 = _4177 + 1;
    int _4181 = abs(_2683);
    int _4183 = _4179 * as_type<int>(_3953);
    int _4185 = ~_4161;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    float _4191 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4193 = int(_4191);
    int _4195 = ~_4101;
    int _4197 = _4195 + 1;
    int _4199 = _4197 + 1;
    int _4201 = ~_4173;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = _4189 * as_type<int>(_3995);
    int _4209 = _4207 + _4171;
    int _4211 = ~_4157;
    int _4213 = _4211 + 1;
    int _4215 = _4213 + 1;
    int _4217 = _4199 * as_type<int>(_4051);
    int _4219 = ~_4167;
    int _4221 = _4219 + 1;
    int _4223 = _4221 + 1;
    int _4225 = _4215 * as_type<int>(_3945);
    int _4227 = _4225 + _4183;
    int _4229 = abs(_3895);
    int _4231 = _4205 * as_type<int>(_4043);
    int _4233 = _4231 + _4217;
    int _4235 = ~_4181;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4243 = int(_4241);
    int _4245 = abs(_2837);
    int _4247 = _4223 * as_type<int>(_4085);
    int _4249 = _4247 + _4165;
    bool _4251 = !_3937;
    int _4253 = _4251 ? 0 : (-1);
    int _4255 = ~_4229;
    int _4257 = _4255 + 1;
    int _4259 = _4257 + 1;
    int _4261 = ~_4245;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    int _4267 = abs(_3931);
    int _4269 = _4239 * as_type<int>(_4111);
    int _4271 = _4269 + _4227;
    int _4273 = abs(_4253);
    int _4275 = _4259 * as_type<int>(_4093);
    int _4277 = _4275 + _4249;
    float _4279 = float(uint(_4067));
    int _4281 = ~_4267;
    int _4283 = _4281 + 1;
    int _4285 = _4283 + 1;
    int _4287 = abs(_3497);
    int _4289 = _4265 * as_type<int>(_4147);
    int _4291 = _4289 + _4233;
    float _4293 = float(uint(_3981));
    float _4295 = 1.0 / _4279;
    int _4297 = ~_4273;
    int _4299 = _4297 + 1;
    int _4301 = _4299 + 1;
    int _4303 = _4285 * as_type<int>(_4119);
    int _4305 = _4303 + _4271;
    int _4307 = abs(_2707);
    int _4309 = ~_4287;
    int _4311 = _4309 + 1;
    int _4313 = _4311 + 1;
    int _4315 = _4301 * as_type<int>(_4003);
    int _4317 = _4315 + _4209;
    int _4319 = abs(_4067);
    float _4321 = 1.0 / _4293;
    int _4323 = abs(_2723);
    int _4325 = _4313 * as_type<int>(_4155);
    int _4327 = _4325 + _4291;
    int _4329 = ~_4307;
    int _4331 = _4329 + 1;
    int _4333 = _4331 + 1;
    float _4335 = float(uint(_4193));
    float _4337 = float(uint(_4319));
    int _4339 = _4277 * _4333;
    int _4341 = abs(_4193);
    int _4343 = ~_4323;
    int _4345 = _4343 + 1;
    int _4347 = _4345 + 1;
    float _4349 = 1.0 / _4337;
    int _4351 = _3985 * _4307;
    int _4353 = _4351 + _4339;
    int _4355 = abs(_2801);
    int _4357 = _4347 * _4305;
    float _4359 = float(uint(_4243));
    int _4361 = abs(_3981);
    float _4363 = 1.0 / _4335;
    int _4365 = abs(_4243);
    int _4367 = _4007 * _4323;
    int _4369 = _4367 + _4357;
    int _4371 = ~_4355;
    int _4373 = _4371 + 1;
    int _4375 = _4373 + 1;
    bool _4377 = _1326 == 0;
    int _4379 = _4375 * _4317;
    int _4381 = as_type<int>(_4295) + (-2);
    float _4383 = 1.0 / _4359;
    float _4385 = float(uint(_4353));
    float _4387 = float(uint(_4341));
    float _4389 = float(uint(_4361));
    float _4391 = as_type<float>(_4381) * _4385;
    int _4393 = abs(_3637);
    float _4395 = 1.0 / _4387;
    bool _4397 = !_4377;
    int _4399 = _4397 ? _4013 : (-1);
    int _4401 = as_type<int>(_4321) + (-2);
    float _4403 = float(uint(_4369));
    bool _4405 = _1360 == 0;
    float _4407 = 1.0 / _4389;
    int _4409 = ~_4393;
    int _4411 = _4409 + 1;
    int _4413 = _4411 + 1;
    float _4415 = as_type<float>(_4401) * _4403;
    bool _4417 = !_4405;
    int _4419 = _4417 ? _4029 : (-1);
    int _4421 = as_type<int>(_4363) + (-2);
    int _4423 = _4413 * _4327;
    float _4425 = float(uint(_4365));
    float _4427 = trunc(_4391);
    float _4429 = precise::max(_4427, 0.0);
    uint _4431 = uint(_4429);
    int _4433 = _4399 * _4355;
    int _4435 = _4433 + _4379;
    int _4437 = abs(_4353);
    int _4439 = _4419 * _4393;
    int _4441 = _4439 + _4423;
    int _4443 = abs(_4369);
    float _4445 = _4061 + 0.5;
    float _4447 = float(uint(_4435));
    float _4449 = trunc(_4415);
    float _4451 = precise::max(_4449, 0.0);
    uint _4453 = uint(_4451);
    int _4455 = as_type<int>(_4383) + (-2);
    float _4457 = as_type<float>(_4421) * _4447;
    float _4459 = float(uint(_4441));
    int _4461 = as_type<int>(_4349) + (-2);
    float _4463 = 1.0 / _4425;
    float _4465 = float(uint(_4437));
    float _4467 = as_type<float>(_4455) * _4459;
    int _4469 = ~_4067;
    int _4471 = _4469 + 1;
    float _4473 = _3935 + 0.5;
    int _4475 = as_type<int>(_4407) + (-2);
    float _4477 = as_type<float>(_4461) * _4465;
    int _4479 = ~_3981;
    int _4481 = _4479 + 1;
    float _4483 = trunc(_4457);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    int _4489 = _4471 * int(_4431);
    int _4491 = _4489 + _4353;
    out.m_79.x = _4445;
    out.m_79.y = _4473;
    int _4493 = abs(_4435);
    int _4495 = as_type<int>(_4395) + (-2);
    float _4497 = float(uint(_4491));
    float _4499 = trunc(_4467);
    float _4501 = precise::max(_4499, 0.0);
    uint _4503 = uint(_4501);
    float _4505 = float(uint(_4443));
    int _4507 = as_type<int>(_4463) + (-2);
    bool _4509 = !_4021;
    int _4511 = _4509 ? 0 : 1;
    float _4513 = as_type<float>(_4475) * _4505;
    int _4515 = _4481 * int(_4453);
    int _4517 = _4515 + _4369;
    bool _4519 = !_4017;
    int _4521 = _4519 ? 0 : 1;
    float _4523 = trunc(_4477);
    float _4525 = precise::max(_4523, 0.0);
    uint _4527 = uint(_4525);
    int _4529 = abs(_4441);
    float _4531 = as_type<float>(_4381) * _4497;
    float _4533 = float(uint(_4517));
    float _4535 = float(uint(_4529));
    float _4537 = in.m_81.x;
    float _4539 = in.m_81.y;
    float _4541 = in.m_81.z;
    float _4543 = float(uint(_4493));
    float _4545 = as_type<float>(_4401) * _4533;
    float _4547 = trunc(_4513);
    float _4549 = precise::max(_4547, 0.0);
    uint _4551 = uint(_4549);
    float _4553 = as_type<float>(_4507) * _4535;
    int _4555 = abs(_4511);
    float _4557 = as_type<float>(_4495) * _4543;
    int _4559 = abs(_4521);
    int _4561 = ~_4243;
    int _4563 = _4561 + 1;
    float _4565 = trunc(_4557);
    float _4567 = precise::max(_4565, 0.0);
    uint _4569 = uint(_4567);
    float _4571 = float(_3285);
    float _4573 = float(_4555);
    int _4575 = _4563 * int(_4503);
    int _4577 = _4575 + _4441;
    int _4579 = ~_4193;
    int _4581 = _4579 + 1;
    int _4583 = ~_4319;
    int _4585 = _4583 + 1;
    float _4587 = _4573 * _4571;
    float _4589 = float(_4059);
    int _4591 = _4581 * int(_4487);
    int _4593 = _4591 + _4435;
    float _4595 = float(_4559);
    float _4597 = trunc(_4553);
    float _4599 = precise::max(_4597, 0.0);
    uint _4601 = uint(_4599);
    float _4603 = float(uint(_4577));
    float _4605 = _4595 * _4589;
    float _4607 = float(uint(_4593));
    int _4609 = _4585 * int(_4527);
    int _4611 = _4609 + _4437;
    int _4613 = ~_4361;
    int _4615 = _4613 + 1;
    float _4617 = _4605 * (-2.0);
    float _4619 = as_type<float>(_4455) * _4603;
    float _4621 = as_type<float>(_4421) * _4607;
    float _4623 = float(uint(_4611));
    int _4625 = _4615 * int(_4551);
    int _4627 = _4625 + _4443;
    int _4629 = ~_4341;
    int _4631 = _4629 + 1;
    float _4633 = trunc(_4531);
    float _4635 = precise::max(_4633, 0.0);
    uint _4637 = uint(_4635);
    float _4639 = fma(_3753, _4617, _3753);
    float _4641 = fma(_4617, _4537, _4537);
    float _4643 = as_type<float>(_4461) * _4623;
    float _4645 = _1535 + (-0.5);
    float _4647 = float(uint(_4627));
    int _4649 = _4631 * int(_4569);
    int _4651 = _4649 + _4493;
    int _4653 = ~_3981;
    int _4655 = _4653 + 1;
    float _4657 = trunc(_4619);
    float _4659 = precise::max(_4657, 0.0);
    uint _4661 = uint(_4659);
    int _4663 = ~_4365;
    int _4665 = _4663 + 1;
    float _4667 = fma(_4645, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4641);
    float _4669 = as_type<float>(_4475) * _4647;
    float _4671 = float(uint(_4651));
    float _4673 = fma(_4639, _3191, _4667);
    float _4675 = trunc(_4621);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    float _4681 = as_type<float>(_4495) * _4671;
    int _4683 = int(_4431) + int(_4637);
    int _4685 = _4665 * int(_4601);
    int _4687 = _4685 + _4529;
    int _4689 = ~_4067;
    int _4691 = _4689 + 1;
    int _4693 = ~_4243;
    int _4695 = _4693 + 1;
    float _4697 = trunc(_4545);
    float _4699 = precise::max(_4697, 0.0);
    uint _4701 = uint(_4699);
    int _4703 = int(_4503) + int(_4661);
    int _4705 = _4691 * _4683;
    int _4707 = _4705 + _4353;
    float _4709 = float(uint(_4687));
    bool _4711 = _4243 == 0;
    bool _4713 = uint(_4707) >= uint(_4067);
    float _4715 = trunc(_4669);
    float _4717 = precise::max(_4715, 0.0);
    uint _4719 = uint(_4717);
    int _4721 = int(_4487) + int(_4679);
    float _4723 = as_type<float>(_4507) * _4709;
    bool _4725 = !_4025;
    int _4727 = _4725 ? 0 : 1;
    float _4729 = trunc(_4643);
    float _4731 = precise::max(_4729, 0.0);
    uint _4733 = uint(_4731);
    int _4735 = ~_4193;
    int _4737 = _4735 + 1;
    int _4739 = int(_4453) + int(_4701);
    int _4741 = _4737 * _4721;
    int _4743 = _4741 + _4435;
    float _4745 = trunc(_4681);
    float _4747 = precise::max(_4745, 0.0);
    uint _4749 = uint(_4747);
    int _4751 = int(_4551) + int(_4719);
    int _4753 = _4655 * _4739;
    int _4755 = _4753 + _4369;
    int _4757 = ~_4319;
    int _4759 = _4757 + 1;
    int _4761 = _4695 * _4703;
    int _4763 = _4761 + _4441;
    bool _4765 = uint(_4743) >= uint(_4193);
    int _4767 = ~_4361;
    int _4769 = _4767 + 1;
    float _4771 = trunc(_4723);
    float _4773 = precise::max(_4771, 0.0);
    uint _4775 = uint(_4773);
    int _4777 = int(_4527) + int(_4733);
    int _4779 = ~_4341;
    int _4781 = _4779 + 1;
    int _4783 = _4769 * _4751;
    int _4785 = _4783 + _4443;
    bool _4787 = uint(_4755) >= uint(_3981);
    int _4789 = _4759 * _4777;
    int _4791 = _4789 + _4437;
    bool _4793 = uint(_4763) >= uint(_4243);
    float _4795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4797 = int(_4569) + int(_4749);
    int _4799 = ~_4365;
    int _4801 = _4799 + 1;
    int _4803 = _4781 * _4797;
    int _4805 = _4803 + _4493;
    bool _4807 = !_4713;
    int _4809 = _4807 ? 0 : (-1);
    bool _4811 = uint(_4791) >= uint(_4319);
    bool _4813 = !_4787;
    int _4815 = _4813 ? 0 : (-1);
    bool _4817 = uint(_4785) >= uint(_4361);
    bool _4819 = !_4765;
    int _4821 = _4819 ? 0 : (-1);
    float _4823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4825 = uint(_4805) >= uint(_4341);
    bool _4827 = !_4793;
    int _4829 = _4827 ? 0 : (-1);
    int _4831 = ~_4683;
    int _4833 = _4831 + _4809;
    int _4835 = _4833 + 1;
    int _4837 = int(_4601) + int(_4775);
    int _4839 = ~_4739;
    int _4841 = _4839 + _4815;
    int _4843 = _4841 + 1;
    int _4845 = _4067 * _4835;
    int _4847 = _4845 + _4353;
    int _4849 = ~_4703;
    int _4851 = _4849 + _4829;
    int _4853 = _4851 + 1;
    float _4855 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4857 = ~_4721;
    int _4859 = _4857 + _4821;
    int _4861 = _4859 + 1;
    int _4863 = _4801 * _4837;
    int _4865 = _4863 + _4529;
    bool _4867 = !_4811;
    int _4869 = _4867 ? 0 : (-1);
    int _4871 = _3981 * _4843;
    int _4873 = _4871 + _4369;
    bool _4875 = _4067 == 0;
    int _4877 = _4193 * _4861;
    int _4879 = _4877 + _4435;
    int _4881 = _4353 ^ _4067;
    float _4883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4885 = !_4825;
    int _4887 = _4885 ? 0 : (-1);
    int _4889 = _4243 * _4853;
    int _4891 = _4889 + _4441;
    bool _4893 = _3981 == 0;
    bool _4895 = !_4875;
    int _4897 = _4895 ? _4847 : (-1);
    bool _4899 = _4193 == 0;
    float _4901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4903 = uint(int(uint(_4881) >> uint(31)));
    bool _4905 = uint(_4865) >= uint(_4365);
    bool _4907 = !_4893;
    int _4909 = _4907 ? _4873 : (-1);
    float _4911 = _4795 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4913 = !_4899;
    int _4915 = _4913 ? _4879 : (-1);
    int _4917 = ~_4869;
    int _4919 = _4777 + _4917;
    int _4921 = _4919 + 1;
    float _4923 = fma(_4911, _1733, -0.5);
    float _4925 = float(_4897);
    float _4927 = _4883 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4929 = ~int(_4903);
    int _4931 = _4929 + 1;
    bool _4933 = !_4711;
    int _4935 = _4933 ? _4891 : (-1);
    float _4937 = fma(_4911, _4925, _3161);
    int _4939 = _4369 ^ _3981;
    float _4941 = _4855 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4943 = _4193 == 0;
    float _4945 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4947 = _4435 ^ _4193;
    float _4949 = _4823 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4951 = _4441 ^ _4243;
    float _4953 = fma(_4941, _2501, -0.5);
    float _4955 = float(_4909);
    float _4957 = fma(_4949, _1827, -0.5);
    int _4959 = _4921 ^ _4931;
    float _4961 = fma(_4927, _1663, -0.5);
    float _4963 = float(_4935);
    float _4965 = fma(_4949, _4955, _3179);
    bool _4967 = !_4817;
    int _4969 = _4967 ? 0 : (-1);
    float _4971 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4973 = !_4905;
    int _4975 = _4973 ? 0 : (-1);
    float _4977 = fma(_4941, _4963, _3145);
    uint _4979 = uint(int(uint(_4939) >> uint(31)));
    float _4981 = fma(_3167, _4957, _4965);
    uint _4983 = uint(int(uint(_4947) >> uint(31)));
    float _4985 = fma(_3139, _4923, _4937);
    uint _4987 = uint(int(uint(_4951) >> uint(31)));
    float _4989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4991 = _4067 == 0;
    float _4993 = fma(_3155, _4953, _4977);
    int _4995 = ~_4931;
    int _4997 = _4995 + _4959;
    int _4999 = _4997 + 1;
    bool _5001 = _4243 == 0;
    int _5003 = ~_4969;
    int _5005 = _4751 + _5003;
    int _5007 = _5005 + 1;
    int _5009 = ~_4887;
    int _5011 = _4797 + _5009;
    int _5013 = _5011 + 1;
    int _5015 = ~_4975;
    int _5017 = _4837 + _5015;
    int _5019 = _5017 + 1;
    int _5021 = ~int(_4979);
    int _5023 = _5021 + 1;
    int _5025 = ~int(_4983);
    int _5027 = _5025 + 1;
    float _5029 = _4989 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5031 = ~int(_4987);
    int _5033 = _5031 + 1;
    float _5035 = float(_4915);
    float _5037 = fma(_5029, _2879, -0.5);
    bool _5039 = !_4991;
    int _5041 = _5039 ? _4999 : (-1);
    int _5043 = _5007 ^ _5023;
    float _5045 = fma(_4927, _5035, _3185);
    int _5047 = _5013 ^ _5027;
    float _5049 = _4901 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5051 = _5019 ^ _5033;
    float _5053 = _4945 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5055 = float(_5041);
    float _5057 = fma(_5049, _2783, -0.5);
    bool _5059 = _3981 == 0;
    float _5061 = _4971 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5063 = ~_5023;
    int _5065 = _5063 + _5043;
    int _5067 = _5065 + 1;
    float _5069 = -_3149;
    float _5071 = fma(_5049, _5055, _5069);
    int _5073 = ~_5027;
    int _5075 = _5073 + _5047;
    int _5077 = _5075 + 1;
    float _5079 = fma(_5053, _2867, -0.5);
    int _5081 = ~_5033;
    int _5083 = _5081 + _5051;
    int _5085 = _5083 + 1;
    float _5087 = fma(_3153, _4961, _5045);
    bool _5089 = !_5059;
    int _5091 = _5089 ? _5067 : (-1);
    float _5093 = fma(_3115, _5057, _5071);
    bool _5095 = !_4943;
    int _5097 = _5095 ? _5077 : (-1);
    float _5099 = _5087 + 0.5;
    bool _5101 = !_5001;
    int _5103 = _5101 ? _5085 : (-1);
    float _5105 = float(_5091);
    float _5107 = float(_5097);
    float _5109 = fma(_5061, _2881, -0.5);
    float _5111 = float(_5103);
    float _5113 = -_3181;
    float _5115 = fma(_5053, _5105, _5113);
    float _5117 = _4587 * (-2.0);
    float _5119 = -_3187;
    float _5121 = fma(_5061, _5107, _5119);
    float _5123 = _4993 + 0.5;
    float _5125 = -_3147;
    float _5127 = fma(_5029, _5111, _5125);
    float _5129 = fma(_3169, _5079, _5115);
    float _5131 = fma(_3151, _5109, _5121);
    float _5133 = _4985 + 0.5;
    float _5135 = fma(_3157, _5037, _5127);
    float _5137 = _4981 + 0.5;
    float _5139 = _5093 + 0.5;
    float _5141 = _5129 + 0.5;
    float _5143 = _5131 + 0.5;
    float _5145 = _5135 + 0.5;
    float _5147 = fma(_3805, _5117, _3805);
    float _5149 = fma(_5117, _4539, _4539);
    out.m_83.x = _5133;
    out.m_83.y = _5139;
    out.m_83.z = _5137;
    out.m_83.w = _5141;
    out.m_85.x = _5099;
    out.m_85.y = _5143;
    out.m_87.x = _5123;
    out.m_87.y = _5145;
    int _5151 = as_type<int>(_5137);
    if (_3735)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5153 = -_3837;
    float _5155 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3569);
    float _5157 = -_3841;
    float _5159 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3553);
    float _5161 = -_3861;
    float _5163 = fma(_5161, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3591);
    int _5165 = abs(_4727);
    float _5167 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5169 = _5155 + _5167;
    float _5171 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5173 = _5159 + _5171;
    float _5175 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5177 = _5163 + _5175;
    float _5179 = float(_3599);
    float _5181 = _5169 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5183 = float(_5165);
    float _5185 = _1535 + _1547;
    float _5187 = fma(_3787, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5149);
    float _5189 = fma(_5173, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5181);
    float _5191 = _1547 + (-0.5);
    float _5193 = _5183 * _5179;
    float _5195 = _5185 + (-1.0);
    float _5197 = fma(_5177, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5189);
    float _5199 = fma(_5147, _3191, _5187);
    float _5201 = _5193 * (-2.0);
    float _5203 = _4673 * 0.15915493667125701904296875;
    float _5205 = sqrt(_3927);
    bool _5207 = _5197 >= 0.0;
    float _5209 = fma(_5201, _4541, _4541);
    float _5211 = _5199 * 0.15915493667125701904296875;
    float _5213 = fma(_5191, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5209);
    float _5215 = fma(_5195, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5217 = _5203 * 6.283185482025146484375;
    float _5219 = sin(_5217);
    float _5221 = fma(_5215, _5201, _5215);
    float _5223 = _5193;
    float _5225 = _5159;
    float _5227 = _5177;
    if (_5207)
    {
        _5223 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5229 = _5223;
    if (_5207)
    {
        out.m_51.x = 0.0;
    }
    float _5231 = fma(_5221, _3191, _5213);
    float _5233 = _5211 * 6.283185482025146484375;
    float _5235 = sin(_5233);
    if (_5207)
    {
        float _5237 = _5229 * 5.0;
        _5151 = as_type<int>(_5237);
    }
    int _5239 = _5151;
    float _5241 = _5231 * 0.15915493667125701904296875;
    if (_5207)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14475 = as_type<float>(_5239);
        out.gl_Position.z = _14475;
    }
    float _5243 = _5203 * 6.283185482025146484375;
    float _5245 = cos(_5243);
    float _5247 = _5211 * 6.283185482025146484375;
    float _5249 = cos(_5247);
    float _5251 = _5219 * _5235;
    float _5253 = _5241 * 6.283185482025146484375;
    float _5255 = sin(_5253);
    if (_5207)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5257 = -_3569;
    float _5259 = _5257 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5261 = -_3553;
    float _5263 = _5261 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5265 = in.m_89.x;
    float _5267 = in.m_89.y;
    float _5269 = in.m_89.z;
    float _5271 = -_3591;
    float _5273 = _5271 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5275 = _5259 * _5259;
    float _5277 = _5241 * 6.283185482025146484375;
    float _5279 = cos(_5277);
    float _5281 = _5245 * _5249;
    float _5283 = _700 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5285 = fma(_5263, _5263, _5275);
    float _5287 = fma(_5255, _5281, _5251);
    float _5289 = fma(_5255, _5251, _5281);
    float _5291 = fma(_5273, _5273, _5285);
    float _5293 = _3811 * _5205;
    float _5295 = _712 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5297 = _5245 * _5235;
    float _5299 = rsqrt(_5291);
    float _5301 = _5219 * _5249;
    float _5303 = _5245 * _5279;
    float _5305 = _5249 * _5279;
    float _5307 = _5219 * _5279;
    float _5309 = _5235 * _5279;
    float _5311 = _5293 * _5295;
    float _5313 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5265);
    float _5315 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5317 = _5293 * _5283;
    float _5319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5267);
    float _5321 = _5313 * _5311;
    float _5323 = -_5297;
    float _5325 = fma(_5255, _5301, _5323);
    float _5327 = _5263 * _5299;
    float _5329 = -_5301;
    float _5331 = fma(_5255, _5297, _5329);
    float _5333 = _5293 * _5315;
    float _5335 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5269);
    float _5337 = _5273 * _5299;
    float _5339 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5341 = _5327 * _5339;
    float _5343 = _5319 * _5317;
    float _5345 = _5335 * _5333;
    float _5347 = in.m_91.x;
    float _5349 = in.m_91.y;
    float _5351 = in.m_91.z;
    float _5353 = _5259 * _5299;
    float _5355 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5357 = _5337 * _5355;
    float _5359 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5361 = -_5341;
    float _5363 = fma(_5337, _5359, _5361);
    bool _5365 = _5267 != 0.0;
    bool _5367 = isnan(_5267);
    bool _5369 = _5365 || _5367;
    bool _5371 = isnan(0.0);
    bool _5373 = _5369 || _5371;
    float _5375 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5377 = _5353 * _5375;
    float _5379 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5381 = -_5357;
    float _5383 = fma(_5353, _5379, _5381);
    float _5385 = _5363 * _5363;
    bool _5387 = _5265 == 0.0;
    bool _5389 = !_5373;
    bool _5391 = _5387 && _5389;
    float _5393 = in.m_93.x;
    float _5395 = in.m_93.y;
    float _5397 = in.m_93.z;
    float _5399 = in.m_93.w;
    float _5401 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5403 = -_5377;
    float _5405 = fma(_5327, _5401, _5403);
    float _5407 = fma(_5383, _5383, _5385);
    bool _5409 = _5269 == 0.0;
    bool _5411 = _5409 && _5391;
    float _5413 = -_5343;
    float _5415 = _5255 * _5413;
    float _5417 = _5303 * _5343;
    float _5419 = fma(_5405, _5405, _5407);
    float _5421 = _5307 * _5343;
    float _5423 = fma(_5305, _5321, _5415);
    float _5425 = fma(_5287, _5321, _5417);
    float _5427 = fma(_5325, _5321, _5421);
    float _5429 = rsqrt(_5419);
    float _5431 = fma(_5309, _5345, _5423);
    float _5433 = fma(_5331, _5345, _5425);
    float _5435 = fma(_5289, _5345, _5427);
    float _5437 = _5321;
    float _5439 = _5415;
    float _5441 = _5417;
    float _5443 = _5263;
    float _5445 = _5347;
    float _5447 = _5289;
    if (_5411)
    {
        _5437 = _5347;
    }
    float _5449 = _5437;
    float _5451 = _5449;
    if (_5411)
    {
        _5439 = _5351;
    }
    float _5453 = _5439;
    float _5455 = _5453;
    if (_5411)
    {
        _5441 = _5449;
    }
    float _5457 = _5441;
    float _5459 = _5457;
    if (!_5411)
    {
        _5451 = _5347;
    }
    float _5461 = _5451;
    if (_5411)
    {
        _5443 = _5349;
    }
    float _5463 = _5443;
    float _5465 = _5463;
    if (!_5411)
    {
        float _5467 = fma(_5267, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5349);
        _5465 = _5467;
    }
    float _5469 = _5465;
    if (_5411)
    {
        _5445 = _5453;
    }
    float _5471 = _5445;
    float _5473 = _5397 * _5461;
    float _5475 = _5471;
    if (!_5411)
    {
        _5455 = _5351;
    }
    float _5477 = _5455;
    float _5479 = _5383 * _5429;
    float _5481 = _5363 * _5429;
    if (!_5411)
    {
        float _5483 = fma(_5265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5461);
        _5459 = _5483;
    }
    float _5485 = _5459;
    float _5487 = _5393 * _5349;
    float _5489 = -_5473;
    float _5491 = fma(_5393, _5477, _5489);
    float _5493 = _5395 * _5477;
    float _5495 = _5405 * _5429;
    float _5497 = _5337 * _5481;
    float _5499 = _5353 * _5479;
    if (!_5411)
    {
        float _5501 = fma(_5269, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5477);
        _5475 = _5501;
    }
    float _5503 = _5475;
    float _5505 = -_5493;
    float _5507 = fma(_5397, _5349, _5505);
    float _5509 = -_5487;
    float _5511 = fma(_5395, _5461, _5509);
    float _5513 = -_5497;
    float _5515 = fma(_5353, _5495, _5513);
    float _5517 = -_5499;
    float _5519 = fma(_5327, _5481, _5517);
    float _5521 = _5491 * _5399;
    float _5523 = _5507 * _5399;
    float _5525 = _5515 * _5433;
    float _5527 = _5519 * _5433;
    float _5529 = _5511 * _5399;
    float _5531 = _5327 * _5495;
    float _5533 = fma(_5479, _5431, _5525);
    float _5535 = fma(_5495, _5431, _5527);
    float _5537 = _5287 * _5515;
    float _5539 = -_5531;
    float _5541 = fma(_5337, _5479, _5539);
    float _5543 = fma(_5327, _5435, _5533);
    float _5545 = fma(_5337, _5435, _5535);
    float _5547 = _5287 * _5519;
    float _5549 = _5287 * _5541;
    float _5551 = _3553 + _5543;
    float _5553 = _3591 + _5545;
    float _5555 = _5541 * _5433;
    float _5557 = fma(_5305, _5481, _5549);
    float _5559 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5561 = _5551 + _5559;
    float _5563 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5565 = _5553 + _5563;
    float _5567 = _5303 * _5515;
    float _5569 = _5303 * _5541;
    float _5571 = _5561 * _5561;
    float _5573 = _5565 * _5565;
    float _5575 = _5303 * _5519;
    float _5577 = _5331 * _5515;
    float _5579 = _5331 * _5519;
    float _5581 = _5571 + _5573;
    float _5583 = _5331 * _5541;
    float _5585 = fma(_5309, _5479, _5577);
    float _5587 = -_5255;
    float _5589 = fma(_5587, _5481, _5569);
    float _5591 = sqrt(_5581);
    float _5593 = fma(_5309, _5481, _5583);
    float _5595 = fma(_5481, _5431, _5555);
    float _5597 = -_5255;
    float _5599 = fma(_5597, _5479, _5567);
    float _5601 = -_5255;
    float _5603 = fma(_5601, _5495, _5575);
    float _5605 = fma(_5305, _5479, _5537);
    float _5607 = fma(_5353, _5435, _5595);
    float _5609 = fma(_5305, _5495, _5547);
    float _5611 = fma(_5309, _5495, _5579);
    float _5613 = fma(_5307, _5327, _5599);
    float _5615 = fma(_5307, _5353, _5589);
    float _5617 = fma(_5307, _5337, _5603);
    float _5619 = _3569 + _5607;
    float _5621 = fma(_5325, _5327, _5605);
    float _5623 = fma(_5325, _5353, _5557);
    float _5625 = fma(_5325, _5337, _5609);
    bool _5627 = _5591 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5629 = fma(_5289, _5337, _5611);
    float _5631 = _5613 * _5395;
    float _5633 = _5615 * _5395;
    float _5635 = _5617 * _5395;
    float _5637 = _5615 * _5469;
    float _5639 = fma(_5289, _5327, _5585);
    float _5641 = fma(_5289, _5353, _5593);
    float _5643 = _5613 * _5469;
    float _5645 = _5521 * _5613;
    float _5647 = _5521 * _5615;
    float _5649 = _5521 * _5617;
    float _5651 = _5617 * _5469;
    float _5653 = _5557;
    float _5655 = _5613;
    float _5657 = _5585;
    float _5659 = _5521;
    float _5661 = _5529;
    if (!_5627)
    {
        _5653 = _5573;
    }
    float _5663 = _5653;
    float _5665 = _5663;
    if (!_5627)
    {
        _5655 = _5571;
    }
    float _5667 = _5655;
    float _5669 = _5667;
    if (!_5627)
    {
        _5447 = _5551;
    }
    float _5671 = _5447;
    float _5673 = _5671;
    if (!_5627)
    {
        _5657 = _5553;
    }
    float _5675 = _5657;
    float _5677 = _5675;
    if (!_5627)
    {
        _5659 = _5619;
    }
    float _5679 = _5659;
    bool _5681 = !_5627;
    float _5683 = _5679;
    if (!_5681)
    {
        float _5685 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5687 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5689 = _5591 + _5687;
        float _5691 = rsqrt(_5581);
        float _5693 = _5689 * _5685;
        float _5695 = _5619 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5697 = _5693 * 0.15915493667125701904296875;
        float _5699 = _5697 * 6.283185482025146484375;
        float _5701 = sin(_5699);
        float _5703 = _5697 * 6.283185482025146484375;
        float _5705 = cos(_5703);
        float _5707 = fma(_5701, _5695, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5709 = _5691 * _5707;
        float _5711 = _5705 + (-1.0);
        float _5713 = fma(_5561, _5709, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5715 = fma(_5565, _5709, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5717 = _5711 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5721 = _5713 + _5719;
        float _5723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5725 = _5715 + _5723;
        float _5727 = fma(_5619, _5705, _5717);
        float _5729 = _5721 * _5721;
        float _5731 = _5725 * _5725;
        _5683 = _5727;
        _5669 = _5729;
        _5665 = _5731;
        _5673 = _5713;
        _5677 = _5715;
    }
    float _5733 = _5683;
    float _5735 = _5669;
    float _5737 = _5665;
    float _5739 = _5673;
    float _5741 = _5677;
    float _5743 = fma(_5621, _5393, _5631);
    float _5745 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5747 = _5733 + _5745;
    float _5749 = fma(_5621, _5485, _5643);
    float _5751 = fma(_5625, _5485, _5651);
    float _5753 = fma(_5623, _5393, _5633);
    float _5755 = fma(_5747, _5747, _5735);
    float _5757 = fma(_5623, _5485, _5637);
    float _5759 = fma(_5523, _5623, _5647);
    float _5761 = fma(_5625, _5393, _5635);
    float _5763 = _5755 + _5737;
    float _5765 = fma(_5523, _5621, _5645);
    float _5767 = fma(_5523, _5625, _5649);
    float _5769 = fma(_5639, _5397, _5743);
    float _5771 = fma(_5641, _5397, _5753);
    float _5773 = fma(_5641, _5503, _5757);
    float _5775 = sqrt(_5763);
    float _5777 = fma(_5629, _5397, _5761);
    float _5779 = fma(_5639, _5503, _5749);
    float _5781 = fma(_5529, _5639, _5765);
    float _5783 = fma(_5529, _5641, _5759);
    float _5785 = fma(_5529, _5629, _5767);
    float _5787 = fma(_5629, _5503, _5751);
    out.m_95.x = _5769;
    out.m_95.y = _5771;
    out.m_95.z = _5777;
    out.m_97.x = _5781;
    out.m_97.y = _5783;
    out.m_97.z = _5785;
    out.m_99.x = _5779;
    out.m_99.y = _5773;
    out.m_99.z = _5787;
    bool _5789 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5791 = isnan(_5775);
    bool _5793 = _5789 || _5791;
    bool _5795 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5797 = _5793 || _5795;
    float _5799 = _5749;
    if (!_5797)
    {
        _5661 = 1.0;
    }
    float _5801 = _5661;
    bool _5803 = !_5797;
    float _5805 = _5801;
    if (!_5803)
    {
        bool _5807 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5809 = isnan(_5775);
        bool _5811 = _5807 || _5809;
        bool _5813 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5815 = _5811 || _5813;
        if (!_5815)
        {
            float _5817 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5819 = _5775 + _5817;
            float _5821 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5823 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5821;
            float _5825 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5827 = _5825 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5829 = 1.0 / _5823;
            float _5831 = _5819 * _5829;
            float _5833 = fma(_5831, _5827, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5805 = _5833;
            _5835 = true;
        }
        else
        {
            bool _5837 = _5775 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5839 = isnan(_5775);
            bool _5841 = _5837 || _5839;
            bool _5843 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5845 = _5841 || _5843;
            if (!_5845)
            {
                float _5847 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5849 = _5775 + _5847;
                float _5851 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5853 = _5851 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5855 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5857 = _5855 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5859 = 1.0 / _5853;
                float _5861 = _5849 * _5859;
                float _5863 = fma(_5861, _5857, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5805 = _5863;
                _5835 = true;
            }
            else
            {
                _5805 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5835 = false;
    float _5865 = _5805;
    float _5867 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5869 = _5733 + _5867;
    float _5871 = _5155 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5873 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5875 = _5739 + _5873;
    float _5877 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5879 = _5741 + _5877;
    float _5881 = fma(_5869, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5883 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5871);
    float _5885 = fma(_5875, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5887 = fma(_5879, _5865, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5889 = -_3569;
    float _5891 = _5889 + _5881;
    float _5893 = fma(_5163, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5883);
    float _5895 = -_3553;
    float _5897 = _5895 + _5885;
    float _5899 = _5155 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5901 = _5891 * _5891;
    float _5903 = _5893 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5905 = -_3591;
    float _5907 = _5905 + _5887;
    float _5909 = fma(_5159, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5899);
    float _5911 = fma(_5897, _5897, _5901);
    float _5913 = 1.0 / _5903;
    float _5915 = fma(_5163, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5909);
    float _5917 = fma(_5907, _5907, _5911);
    float _5919 = _5915 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5921 = sqrt(_5917);
    float _5923 = _5919 + _5903;
    float _5925 = _5923 * _5913;
    float _5927 = _5925 * 0.5;
    float _5929 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5931 = fma(_5927, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5929);
    bool _5933 = _5921 > 0.0;
    float _5935 = 1.0 / _5931;
    bool _5937 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5939 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5941 = _5937 || _5939;
    bool _5943 = isnan(0.5);
    bool _5945 = _5941 || _5943;
    bool _5947 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5949 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5951 = _5947 || _5949;
    bool _5953 = isnan(0.5);
    bool _5955 = _5951 || _5953;
    float _5957 = _5927;
    float _5959 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5961 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5963 = _5885;
    if (!_5933)
    {
        _5957 = _5885;
    }
    float _5965 = _5957;
    float _5967 = _5965;
    float _5969 = _5965;
    if (!_5933)
    {
        _5959 = _5881;
    }
    float _5971 = _5959;
    float _5973 = _5971;
    if (!_5933)
    {
        _5961 = _5887;
    }
    float _5975 = _5961;
    bool _5977 = !_5933;
    float _5979 = _5975;
    float _5981 = _5935;
    if (!_5977)
    {
        float _5983 = _226 * _226;
        float _5985 = fma(_222, _222, _5983);
        float _5987 = fma(_228, _228, _5985);
        float _5989 = rsqrt(_5917);
        float _5991 = sqrt(_5987);
        float _5993 = _5897 * _5989;
        float _5995 = _5891 * _5989;
        float _5997 = _5907 * _5989;
        bool _5999 = _5991 > 0.0;
        float _6001 = _5991;
        float _6003 = _5989;
        if (!_5999)
        {
            _5967 = _5885;
        }
        float _6005 = _5967;
        _5969 = _6005;
        if (!_5999)
        {
            _6001 = _5881;
        }
        float _6007 = _6001;
        _5973 = _6007;
        if (!_5999)
        {
            _6003 = _5887;
        }
        float _6009 = _6003;
        bool _6011 = !_5999;
        _5979 = _6009;
        if (!_6011)
        {
            float _6013 = rsqrt(_5987);
            float _6015 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _6017 = _226 * _6013;
            float _6019 = _222 * _6013;
            float _6021 = _228 * _6013;
            float _6023 = _5995 * _6017;
            float _6025 = fma(_5993, _6019, _6023);
            float _6027 = _6015 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6029 = fma(_5997, _6021, _6025);
            float _6031 = _6029 * _6027;
            float _6033 = fma(_222, _6031, _5885);
            float _6035 = fma(_226, _6031, _5881);
            float _6037 = fma(_228, _6031, _5887);
            _5969 = _6033;
            _5973 = _6035;
            _5979 = _6037;
        }
    }
    float _6039 = _5969;
    float _6041 = _5973;
    float _6043 = _5979;
    float _6045 = -_3841;
    float _6047 = fma(_6045, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6039);
    float _6049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6051 = _5935 * _6049;
    float _6053 = -_3837;
    float _6055 = fma(_6053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6041);
    float _6057 = -_3861;
    float _6059 = fma(_6057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6043);
    float _6061 = _6055;
    float _6063 = _6059;
    if (_5945)
    {
        _5963 = 1.0;
    }
    float _6065 = _5963;
    float _6067 = _6065;
    if (_5955)
    {
        _5981 = _6047;
    }
    float _6069 = _5981;
    float _6071 = _6069;
    if (!_5955)
    {
        float _6073 = _5169 * _5169;
        float _6075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6077 = -_3591;
        float _6079 = _6077 + _6043;
        float _6081 = -_3553;
        float _6083 = _6081 + _6039;
        float _6085 = fma(_5173, _5173, _6073);
        float _6087 = fma(_5177, _5177, _6085);
        float _6089 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6091 = sqrt(_6087);
        float _6093 = 1.0 / _5293;
        float _6095 = _6089 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6097 = precise::min(_6091, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6099 = _6097 * _6075;
        float _6101 = -_3569;
        float _6103 = _6101 + _6041;
        float _6105 = _6099 * _6093;
        float _6107 = _6095 * _6105;
        float _6109 = _6079 * _6105;
        float _6111 = fma(_6103, _6107, _5155);
        float _6113 = fma(_6083, _6107, _5159);
        float _6115 = fma(_6095, _6109, _5163);
        _6061 = _6111;
        _6071 = _6113;
        _6063 = _6115;
    }
    float _6117 = _6061;
    float _6119 = _6071;
    float _6121 = _6063;
    if (!_5945)
    {
        float _6123 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6125 = _6123 * 0.15915493667125701904296875;
        float _6127 = _6125 * 6.283185482025146484375;
        float _6129 = cos(_6127);
        float _6131 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6133 = _6131 * 0.15915493667125701904296875;
        float _6135 = _6125 * 6.283185482025146484375;
        float _6137 = sin(_6135);
        float _6139 = 1.0 / _6129;
        float _6141 = _6133 * 6.283185482025146484375;
        float _6143 = cos(_6141);
        float _6145 = _6137 * _6139;
        float _6147 = _6133 * 6.283185482025146484375;
        float _6149 = sin(_6147);
        float _6151 = _6143 * _6145;
        float _6153 = 1.0 / _6151;
        float _6155 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6157 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6155;
        float _6159 = 1.0 / _6157;
        float _6161 = _6149 * _6153;
        float _6163 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6165 = fma(_6051, _6161, _6163);
        float _6167 = _6165 * _6159;
        float _6169 = precise::clamp(_6167, 0.0, 1.0);
        _6067 = _6169;
    }
    float _6171 = _6067;
    float _6173 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6175 = _6117 + _6173;
    float _6177 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6179 = _6119 + _6177;
    float _6181 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6183 = _6121 + _6181;
    float _6185 = _6175 * _6175;
    float _6187 = fma(_6179, _6179, _6185);
    float _6189 = fma(_5159, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6191 = fma(_6183, _6183, _6187);
    float _6193 = rsqrt(_6191);
    float _6195 = sqrt(_6191);
    float _6197 = _6193 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6199 = _6179 * _6197;
    float _6201 = _6183 * _6197;
    float _6203 = _6199 * _6199;
    float _6205 = _6201 * _6201;
    float _6207 = _6203 + _6205;
    float _6209 = sqrt(_6207);
    bool _6211 = _6209 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6213 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6215 = _6209 + _6213;
    float _6217 = _6193;
    float _6219 = _6207;
    float _6221 = _6215;
    float _6223 = _6175;
    if (_6211)
    {
        float _6225 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6217 = _6225;
    }
    float _6227 = _6217;
    if (!_6211)
    {
        _5225 = _6203;
    }
    float _6229 = _5225;
    float _6231 = _6229;
    if (_6211)
    {
        float _6233 = rsqrt(_6207);
        _6219 = _6233;
    }
    float _6235 = _6219;
    float _6237 = _6235;
    if (_6211)
    {
        float _6239 = _6215 * _6227;
        _6221 = _6239;
    }
    float _6241 = _6221;
    float _6243 = floor(_6189);
    if (_6211)
    {
        float _6245 = _6241 * 0.15915493667125701904296875;
        _5227 = _6245;
    }
    float _6247 = _5227;
    float _6249 = _6183;
    if (_6211)
    {
        float _6251 = _6247 * 6.283185482025146484375;
        float _6253 = sin(_6251);
        _6249 = _6253;
    }
    float _6255 = _6249;
    float _6257 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6259 = precise::max(0.0, _6257);
    float _6261 = _6227;
    float _6263 = _6259;
    if (_6211)
    {
        float _6265 = _6247 * 6.283185482025146484375;
        float _6267 = cos(_6265);
        _6261 = _6267;
    }
    float _6269 = _6261;
    float _6271 = -_6243;
    float _6273 = _6189 + _6271;
    float _6275 = -_6197;
    float _6277 = -_6259;
    float _6279 = fma(_6175, _6275, _6277);
    if (_6211)
    {
        float _6281 = _6279 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6223 = _6281;
    }
    float _6283 = _6223;
    float _6285 = _6283;
    float _6287 = _6255;
    if (_6211)
    {
        float _6289 = fma(_6255, _6283, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6285 = _6289;
    }
    float _6291 = _6285;
    float _6293 = _6291;
    if (!_6211)
    {
        _6287 = _6199;
    }
    float _6295 = _6287;
    float _6297 = _6295;
    if (_6211)
    {
        float _6299 = _6235 * _6291;
        _5799 = _6299;
    }
    float _6301 = _5799;
    float _6303 = _6269;
    if (_6211)
    {
        float _6305 = _6269 + (-1.0);
        _6263 = _6305;
    }
    float _6307 = _6263;
    float _6309 = _6307;
    if (!_6211)
    {
        _6293 = _6279;
    }
    float _6311 = _6293;
    float _6313 = _6311;
    if (_6211)
    {
        float _6315 = _6199 * _6301;
        _6297 = _6315;
    }
    float _6317 = _6297;
    if (_6211)
    {
        float _6319 = _6307 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6237 = _6319;
    }
    float _6321 = _6237;
    if (!_6211)
    {
        _6309 = _6201;
    }
    float _6323 = _6309;
    float _6325 = _6323;
    if (_6211)
    {
        float _6327 = _6201 * _6301;
        _6325 = _6327;
    }
    float _6329 = _6325;
    if (_6211)
    {
        float _6331 = _6317 * _6317;
        _6231 = _6331;
    }
    float _6333 = _6231;
    if (_6211)
    {
        float _6335 = fma(_6279, _6269, _6321);
        _6313 = _6335;
    }
    float _6337 = _6313;
    if (!_6211)
    {
        _6303 = _6205;
    }
    float _6339 = _6303;
    float _6341 = _6339;
    if (_6211)
    {
        float _6343 = _6329 * _6329;
        _6341 = _6343;
    }
    float _6345 = _6341;
    float _6347 = fma(_6337, _6337, _6333);
    float _6349 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6351 = _6347 + _6345;
    float _6353 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6349);
    float _6355 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6357 = fma(_6195, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6355);
    float _6359 = precise::clamp(_6357, 0.0, 1.0);
    float _6361 = rsqrt(_6351);
    float _6363 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6353);
    float _6365 = -_6359;
    float _6367 = _6365 + 1.0;
    float _6369 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6371 = fma(_5163, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6373 = _6363 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6375 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6377 = abs(_6367);
    float _6379 = log2(_6377);
    float _6381 = _6373 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6383 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6385 = -_6381;
    float _6387 = fma(_6385, _6369, 1.0);
    float _6389 = _6117 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6391 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6383);
    float _6393 = _6361 * _6317;
    float _6395 = _6361 * _6337;
    float _6397 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6389);
    float _6399 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6391);
    float _6401 = _6393 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6403 = _6361 * _6329;
    float _6405 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6397);
    float _6407 = _6399 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6409 = -_6401;
    float _6411 = fma(_6395, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6409);
    float _6413 = fma(_6119, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6375);
    float _6415 = _6405 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6417 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6419 = floor(_6371);
    float _6421 = -_6403;
    float _6423 = fma(_6421, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6411);
    float _6425 = fma(_6121, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6413);
    float _6427 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6417);
    float _6429 = _6379 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6431 = fma(_6423, -0.5, 0.5);
    float _6433 = _6425 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6435 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6427);
    float _6437 = exp2(_6429);
    float _6439 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6441 = fma(_6423, 0.5, 0.5);
    float _6443 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6435);
    float _6445 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6447 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6439);
    float _6449 = sqrt(_6431);
    float _6451 = -_6419;
    float _6453 = _6371 + _6451;
    float _6455 = fma(_6441, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6457 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6445);
    float _6459 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6447);
    float _6461 = _6395 + 1.0;
    float _6463 = fma(_6441, _6455, -0.212114393711090087890625);
    float _6465 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6457);
    float _6467 = log2(_6387);
    float _6469 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6459);
    float _6471 = fma(_6441, _6463, 1.570728778839111328125);
    float _6473 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6465);
    float _6475 = -_6395;
    float _6477 = fma(_6437, _6461, _6475);
    float _6479 = 1.0 / _6443;
    float _6481 = _6449 * 0.636619746685028076171875;
    float _6483 = fma(_6477, 0.5, 0.5);
    float _6485 = -_6471;
    float _6487 = fma(_6481, _6485, 1.0);
    float2 _16495 = float2(_6273, _6453);
    float _6489 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16495, float2(0.0), isnan(_16495)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16495, float2(0.0), isnan(_16495)), level(0.0)).x;
    float _6491 = _6467 * 0.693147182464599609375;
    float _6493 = _6469 * _6479;
    float _6495 = _6473 * _6479;
    float _6497 = _6491 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6499 = fma(_6493, 0.5, 0.5);
    float _6501 = fma(_6495, -0.5, 0.5);
    float3 _16523 = float3(_6499, _6501, _6497);
    float _6503 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16523, float3(0.0), isnan(_16523)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16523, float3(0.0), isnan(_16523)), level(0.0)).x;
    float3 _16534 = float3(_6499, _6501, _6497);
    float4 _6506 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16534, float3(0.0), isnan(_16534)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16534, float3(0.0), isnan(_16534)), level(0.0)).xyzw;
    float _6508 = _6506.x;
    float _6510 = _6506.y;
    float _6512 = _6506.z;
    float _6514 = _6506.w;
    float2 _16550 = float2(_6487, _6483);
    float3 _6518 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16550, float2(0.0), isnan(_16550)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16550, float2(0.0), isnan(_16550)), level(0.0)).xyz;
    float _6520 = _6518.x;
    float _6522 = _6518.y;
    float _6524 = _6518.z;
    float _6526 = abs(_6051);
    float _6528 = log2(_6526);
    float _6530 = _6379 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6532 = _6443 * 0.5;
    float _6534 = _6407 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6536 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6538 = isnan(_6195);
    bool _6540 = _6536 || _6538;
    bool _6542 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6544 = _6540 || _6542;
    float _6546 = exp2(_6530);
    bool _6548 = _6051 <= 8000.0;
    bool _6550 = isnan(_6051);
    bool _6552 = _6548 || _6550;
    bool _6554 = isnan(8000.0);
    bool _6556 = _6552 || _6554;
    float _6558 = float(_6556);
    float _6560 = fma(_6415, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6534);
    float _6562 = in.m_101.x;
    float _6564 = fma(_6373, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6560);
    float _6566 = _6528 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6568 = fma(_6433, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6564);
    float _6570 = _6469 + _6443;
    float _6572 = exp2(_6566);
    float _6574 = _6570 * 0.5;
    float _6576 = -_6546;
    float _6578 = _6576 + 1.0;
    out.gl_Position.x = _6469;
    out.gl_Position.y = _6473;
    out.gl_Position.z = _6568;
    out.gl_Position.w = _6443;
    float _6580 = _6570;
    float _6582 = _6473;
    float _6584 = _6469;
    float _6586 = _6443;
    float _6588 = _6568;
    float _6590 = _6574;
    if (!_6544)
    {
        _6580 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6592 = _6580;
    float _6594 = _6578 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6596 = fma(_6572, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6598 = precise::clamp(_6596, 0.0, 1.0);
    float _6600 = fma(_6473, -0.5, _6532);
    float _6602 = fma(_6598, -2.0, 3.0);
    float _6604 = _6598 * _6598;
    float _6606 = _6592;
    float _6608 = _6592;
    if (!_6544)
    {
        _6582 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6610 = _6582;
    float _6612 = _6610;
    float _6614 = _6610;
    if (!_6544)
    {
        _6584 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6616 = _6584;
    float _6618 = _6604 * _6602;
    float _6620 = -_6618;
    float _6622 = _6620 + 1.0;
    float _6624 = fma(_6622, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6618);
    float _6626 = _6568 + _6443;
    float _6628 = _6558 * _6624;
    float _6630 = _6626 * 0.5;
    float _6632 = _6616;
    float _6634 = _6616;
    if (!_6544)
    {
        _6586 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6636 = _6586;
    float _6638 = _6628 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6640 = _6636;
    float _6642 = _6636;
    if (!_6544)
    {
        _6588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6644 = _6588;
    out.m_103.x = _6574;
    out.m_103.y = _6600;
    out.m_103.z = _6630;
    out.m_103.w = _6443;
    float _6646 = _6171 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6648 = _6644;
    float _6650 = _6644;
    if (!_6544)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6652 = _6590;
    float _6654 = -_6489;
    float _6656 = _6654 + 1.0;
    float _6658 = _6656 * _6638;
    float _6660 = precise::clamp(_6658, 0.0, 1.0);
    float _6662 = -_6660;
    float _6664 = fma(_6662, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6666 = _6664 * _6562;
    float _6668 = _6666 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6670 = _6594 * _6503;
    float _6672 = -_6594;
    float _6674 = _6672 + 1.0;
    out.m_105.x = _6668;
    float _6676 = _6514 * _6670;
    float _6678 = _6524 * _6670;
    float _6680 = _6514 * _6674;
    float _6682 = fma(_6520, _6676, _6508);
    float _6684 = fma(_6522, _6676, _6510);
    float _6686 = fma(_6514, _6678, _6512);
    out.m_107.x = _6682;
    out.m_107.y = _6684;
    out.m_107.z = _6686;
    out.m_107.w = _6680;
    bool _6688 = !_6544;
    float _6690 = _6652;
    float _6692 = _6652;
    if (!_6688)
    {
        bool _6694 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6696 = isnan(_6195);
        bool _6698 = _6694 || _6696;
        bool _6700 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6702 = _6698 || _6700;
        if (!_6702)
        {
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6706 = _6195 + _6704;
            float _6708 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6710 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6708;
            float _6712 = 1.0 / _6710;
            float _6714 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6722 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6724 = _6722 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6726 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6728 = _6726 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6730 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6732 = _6730 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6734 = _6706 * _6712;
            float _6736 = precise::clamp(_6734, 0.0, 1.0);
            float _6738 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6740 = _6738 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6742 = fma(_6736, _6720, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6744 = fma(_6736, _6740, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6746 = fma(_6736, _6716, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6748 = fma(_6736, _6724, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6750 = fma(_6736, _6728, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6752 = fma(_6736, _6732, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6634 = _6746;
            _6642 = _6750;
            _6614 = _6744;
            _6692 = _6748;
            _6608 = _6742;
            _6650 = _6752;
            _6754 = true;
        }
        else
        {
            bool _6756 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6758 = isnan(_6195);
            bool _6760 = _6756 || _6758;
            bool _6762 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6764 = _6760 || _6762;
            if (!_6764)
            {
                _6690 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6766 = _6690;
            _6692 = _6766;
            if (!_6764)
            {
                _6640 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6768 = _6640;
            _6642 = _6768;
            if (!_6764)
            {
                _6648 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6770 = _6648;
            _6650 = _6770;
            if (!_6764)
            {
                _6612 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6772 = _6612;
            _6614 = _6772;
            if (!_6764)
            {
                _6632 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6774 = _6632;
            _6634 = _6774;
            if (!_6764)
            {
                _6606 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6776 = _6606;
            bool _6778 = !_6764;
            _6608 = _6776;
            if (!_6778)
            {
                bool _6780 = _6195 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6782 = isnan(_6195);
                bool _6784 = _6780 || _6782;
                bool _6786 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6788 = _6784 || _6786;
                if (!_6788)
                {
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6792 = _6195 + _6790;
                    float _6794 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6796 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6794;
                    float _6798 = 1.0 / _6796;
                    float _6800 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6802 = _6800 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6808 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6810 = _6808 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6812 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6814 = _6812 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6816 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6818 = _6816 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6820 = _6792 * _6798;
                    float _6822 = precise::clamp(_6820, 0.0, 1.0);
                    float _6824 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6826 = _6824 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6828 = fma(_6822, _6806, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6830 = fma(_6822, _6826, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6832 = fma(_6822, _6802, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6834 = fma(_6822, _6810, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6836 = fma(_6822, _6814, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6838 = fma(_6822, _6818, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6634 = _6832;
                    _6642 = _6836;
                    _6614 = _6830;
                    _6692 = _6834;
                    _6608 = _6828;
                    _6650 = _6838;
                    _6754 = true;
                }
                else
                {
                    _6634 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6642 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6614 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6692 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6608 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6650 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6754 = false;
    float _6840 = _6634;
    float _6842 = _6642;
    float _6844 = _6614;
    float _6846 = _6692;
    float _6848 = _6608;
    float _6850 = _6650;
    float _6852 = _6646 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6854 = fma(_5773, -0.5, 0.5);
    float _6856 = precise::clamp(_6854, 0.0, 1.0);
    float _6858 = -_6840;
    float _6860 = _6842 + _6858;
    float _6862 = -_6844;
    float _6864 = _6846 + _6862;
    out.m_51.x = _6852;
    float _6866 = fma(_6856, _6860, _6840);
    float _6868 = -_6848;
    float _6870 = _6850 + _6868;
    float _6872 = fma(_6856, _6864, _6844);
    float _6874 = _6866 * 0.586610972881317138671875;
    bool _6876 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6878 = fma(_6856, _6870, _6848);
    out.m_109.x = 0.0;
    float _6880 = fma(_6872, 0.298911988735198974609375, _6874);
    bool _6882 = _6171 > 0.0;
    bool _6884 = isnan(_6171);
    bool _6886 = _6882 || _6884;
    bool _6888 = isnan(0.0);
    bool _6890 = _6886 || _6888;
    float _6892 = fma(_6878, 0.114477999508380889892578125, _6880);
    float _6894 = -_6892;
    float _6896 = _6872 + _6894;
    float _6898 = -_6892;
    float _6900 = _6866 + _6898;
    float _6902 = -_6892;
    float _6904 = _6878 + _6902;
    float _6906 = fma(_6896, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    float _6908 = fma(_6900, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    float _6910 = fma(_6904, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6892);
    bool _6912 = !_6876;
    if (!_6912)
    {
        float _6914 = -_6117;
        float _6916 = _6914 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6918 = -_6119;
        float _6920 = _6918 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6922 = -_6121;
        float _6924 = _6922 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6926 = _6916 * _6916;
        float _6928 = fma(_6920, _6920, _6926);
        float _6930 = fma(_6924, _6924, _6928);
        float _6932 = sqrt(_6930);
        float _6934 = rsqrt(_6930);
        float _6936 = -_6932;
        float _6938 = _6936 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6940 = _6938 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6942 = precise::clamp(_6940, 0.0, 1.0);
        float _6944 = _6920 * _6934;
        float _6946 = _6916 * _6934;
        float _6948 = abs(_6942);
        float _6950 = log2(_6948);
        float _6952 = _6924 * _6934;
        float _6954 = _6944 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6956 = _5773 * _6946;
        float _6958 = -_6946;
        float _6960 = -_6954;
        float _6962 = fma(_6958, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6960);
        float _6964 = fma(_5779, _6944, _6956);
        float _6966 = -_6952;
        float _6968 = fma(_6966, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6962);
        float _6970 = fma(_5787, _6952, _6964);
        float _6972 = precise::clamp(_6970, 0.0, 1.0);
        float _6974 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6976 = _6968 + _6974;
        float _6978 = _6950 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6980 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6982 = precise::clamp(_6980, 0.0, 1.0);
        float _6984 = exp2(_6978);
        float _6986 = _6984 * _6982;
        float _6988 = _6972 * _6986;
        float _6990 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6992 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6994 = _6988 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6990;
        out.m_109.y = _6992;
        out.m_109.z = _6994;
    }
    out.m_111.x = _6906;
    out.m_111.y = _6908;
    out.m_111.z = _6910;
    if (_6890)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _6996 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6996;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

