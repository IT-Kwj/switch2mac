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
    bool _6700 = false;
    bool _5781 = false;
    bool _1146 = false;
    bool _822 = false;
    bool _680 = false;
    bool _526 = false;
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
        float _6999 = as_type<float>(_146);
        out.gl_Position.z = _6999;
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
        float _7068 = as_type<float>(_184);
        out.gl_Position.z = _7068;
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
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = _258 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _258 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = 1.0 / _278;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _292 = 1.0 / _282;
    bool _294 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_258);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = 1.0 / _274;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _310 = _258 + _308;
    float _312 = _310 * _288;
    bool _314 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _316 = isnan(_258);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _286;
    float _328 = _262 * _292;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _266 * _306;
    bool _340 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _342 = isnan(_258);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_324;
    float _354 = _352 + 1.0;
    float _356 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _350 * _354;
    float _362 = -_350;
    float _364 = _362 + 1.0;
    float _366 = _270 * _326;
    bool _368 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_258);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    bool _384 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _386 = isnan(_258);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = fma(_382, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = -_378;
    float _404 = _402 + 1.0;
    float _406 = _378 * _364;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = _304 * _404;
    float _418 = -_304;
    float _420 = _418 + 1.0;
    float _422 = fma(_398, _366, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _366, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_410, _366, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _394 * _420;
    float _430 = -_394;
    float _432 = _430 + 1.0;
    float _434 = _356 * _428;
    float _436 = _358 * _428;
    float _438 = _400 * _428;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _454;
    float _458 = fma(_422, _416, _444);
    float _460 = fma(_424, _416, _446);
    float _462 = fma(_426, _416, _448);
    float _464 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_464, _406, _458);
    float _484 = fma(_472, _312, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_476, _312, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _488 = fma(_480, _312, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_466, _406, _460);
    float _492 = fma(_468, _406, _462);
    float _494 = fma(_484, _360, _482);
    float _496 = fma(_486, _360, _490);
    float _498 = fma(_488, _360, _492);
    float _500 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].x, _494);
    float _502 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].y, _496);
    float _504 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].z, _498);
    bool _506 = !_290;
    float _524;
    if (!_506)
    {
        float _508 = in.m_63.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _524 = _522;
        _526 = true;
    }
    else
    {
        float _528 = float(_130);
        float _530 = 1.0 / _528;
        float _532 = _164 * _530;
        _524 = _532;
    }
    _526 = false;
    float _534 = _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _534 + _536;
    float _540 = in.m_65.x;
    float _542 = in.m_65.y;
    float _544 = in.m_65.z;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_534);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _578;
    bool _582 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_534);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _548;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _534 + _600;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _576 * _598;
    float _608 = -_576;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _564;
    float _614 = _580 * _594;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _538, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = _618 * _612;
    float _624 = -_592;
    float _626 = _624 + 1.0;
    float _628 = _620 * _606;
    float _630 = fma(_622, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = _560 * _626;
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _636 = _504 * _544;
    float _638 = fma(_630, _632, _634);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _638);
    float _646 = _502 * _542;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _656 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _500 * _540;
    out.m_67.x = _650;
    out.m_67.y = _652;
    out.m_67.z = _656;
    out.m_67.w = _654;
    bool _660 = !_604;
    float _678;
    if (!_660)
    {
        float _662 = in.m_63.x;
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        float _682 = float(_130);
        float _684 = 1.0 / _682;
        float _686 = _164 * _684;
        _678 = _686;
    }
    _680 = false;
    float _688 = _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _688 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _698 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _700 = isnan(_688);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _714 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _716 = isnan(_688);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _726;
    bool _730 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _732 = isnan(_688);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = 1.0 / _696;
    float _744 = -_708;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _750 = _688 + _748;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _754 = _724 * _746;
    float _756 = -_724;
    float _758 = _756 + 1.0;
    float _760 = 1.0 / _712;
    float _762 = _728 * _742;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _768 = fma(_762, _692, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _770 = -_740;
    float _772 = _770 + 1.0;
    float _774 = _766 * _760;
    float _776 = _768 * _754;
    float _778 = _708 * _772;
    float _780 = fma(_774, _750, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _782 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[131].x, _776);
    float _784 = fma(_780, _778, _782);
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _792 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[133].x, _784);
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _794;
    out.m_69.y = _796;
    out.m_69.z = _798;
    out.m_69.w = _800;
    bool _802 = !_752;
    float _820;
    if (!_802)
    {
        float _804 = in.m_63.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_130);
        float _826 = 1.0 / _824;
        float _828 = _164 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _834 = _830 + _832;
    bool _836 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _838 = isnan(_830);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _852;
    bool _856 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _858 = isnan(_830);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = -_846;
    float _870 = _868 + 1.0;
    bool _872 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _874 = isnan(_830);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = 1.0 / _850;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _890 = _866 * _870;
    float _892 = -_882;
    float _894 = _892 + 1.0;
    float _896 = 1.0 / _888;
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _900 = _854 * _884;
    float _902 = -_866;
    float _904 = _902 + 1.0;
    bool _906 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _908 = isnan(_830);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = fma(_900, _834, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _920 = _882 * _904;
    bool _922 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _924 = isnan(_830);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _916 * _894;
    float _936 = -_916;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _944 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _946 = isnan(_830);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _932 * _938;
    float _958 = -_932;
    float _960 = _958 + 1.0;
    bool _962 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _964 = isnan(_830);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = 1.0 / _942;
    float _976 = -_954;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _984 = _954 * _960;
    float _986 = _972 * _978;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _992 = -_972;
    float _994 = _992 + 1.0;
    float _996 = 1.0 / _982;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1002 = _918 * _986;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _830 + _1008;
    float _1012 = _1000 * _896;
    float _1014 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1002);
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = fma(_1012, _1010, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1030 = _830 + _1028;
    float _1032 = _1020 * _974;
    float _1034 = fma(_1022, _984, _1014);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1038 = _830 + _1036;
    float _1040 = 1.0 / _1006;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1046 = fma(_1032, _1030, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1048 = _1044 * _996;
    bool _1050 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1052 = isnan(_830);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1058 = _1054 || _1056;
    int _1060 = _1058 ? 1065353216 : 0;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1062;
    float _1066 = 1.0 / _1026;
    float _1068 = fma(_1046, _956, _1034);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1074 = _1064 * _1016;
    float _1076 = fma(_1048, _1038, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1080 = _830 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1084 = _830 + _1082;
    float _1086 = _1072 * _1040;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1088;
    float _1092 = fma(_1074, _1080, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1094 = fma(_1076, _934, _1068);
    float _1096 = fma(_1086, _1084, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1098 = -as_type<float>(_1060);
    float _1100 = _1098 + 1.0;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _830 + _1102;
    float _1106 = fma(_1092, _920, _1094);
    float _1108 = _1090 * _1066;
    float _1110 = _846 * _1100;
    float _1112 = fma(_1096, _890, _1106);
    float _1114 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1116 = fma(_1114, _1110, _1112);
    float _1118 = fma(as_type<float>(_1060), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1116);
    out.m_71.x = _1118;
    bool _1120 = !_898;
    float _1122 = _890;
    int _1124 = _1060;
    int _1126 = as_type<int>(_1110);
    float _1144;
    if (!_1120)
    {
        float _1128 = in.m_63.x;
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1136 = _1134 * _1130;
        float _1138 = floor(_1136);
        float _1140 = -_1138;
        float _1142 = _1136 + _1140;
        _1144 = _1142;
        _1146 = true;
    }
    else
    {
        float _1148 = float(_130);
        float _1150 = 1.0 / _1148;
        float _1152 = _164 * _1150;
        _1144 = _1152;
    }
    _1146 = false;
    float _1154 = _1144;
    float _1156 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1158 = int(_1156);
    float _1160 = in.m_73.x;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1164 = _1162 != 0;
    float _1166 = in.m_63.y;
    float _1168 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1170 = int(_1168);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1174 = _1172 != 0;
    float _1176 = 0.0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1164)
    {
        _1176 = 1.0;
    }
    float _1180 = _1176;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1184 = _1182 != 0;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1188 = _1186 != 0;
    float _1190 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1192 = int(_1190);
    float _1194 = float(_1158);
    float _1196 = 0.0;
    float _1198 = _1180;
    bool _1200 = _1184;
    bool _1202 = _1188;
    if (_1164)
    {
        _1196 = 1.0;
    }
    float _1204 = _1196;
    float _1206 = 0.0;
    float _1208 = _1204;
    if (_1164)
    {
        _1206 = 1.0;
    }
    float _1210 = _1206;
    int _1212 = 0;
    float _1214 = _1210;
    if (_1164)
    {
        _1212 = 0;
    }
    int _1216 = _1212;
    float _1218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1220 = int(_1218);
    float _1222 = float(_1170);
    int _1224 = _1216;
    if (_1164)
    {
        _1178 = 0;
    }
    int _1226 = _1178;
    int _1228 = _1226;
    float _1230 = _1160;
    if (!_1174)
    {
        _1122 = _1160;
    }
    float _1232 = _1122;
    float _1234 = _1232;
    if (_1184)
    {
        float _1236 = -_1160;
        float _1238 = _1236 + 1.0;
        _1124 = as_type<int>(_1238);
    }
    int _1240 = _1124;
    if (_1188)
    {
        float _1242 = -_1160;
        float _1244 = _1242 + 1.0;
        _1126 = as_type<int>(_1244);
    }
    int _1246 = _1126;
    bool _1248 = _1166 > 0.5;
    float _1250 = 1.0 / _1194;
    float _1252 = float(_1192);
    float _1254 = 0.0;
    if (!_1184)
    {
        _1254 = _1160;
    }
    float _1256 = _1254;
    float _1258 = 0.0;
    float _1260 = _1256;
    if (!_1188)
    {
        _1258 = _1160;
    }
    float _1262 = _1258;
    float _1264 = _1262;
    if (_1184)
    {
        float _1266 = _1248 ? as_type<float>(_1240) : _1160;
        _1260 = _1266;
    }
    float _1268 = _1260;
    float _1270 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1272 = int(_1270);
    float _1274 = float(uint(_1220));
    if (_1188)
    {
        float _1276 = _1248 ? as_type<float>(_1246) : _1160;
        _1264 = _1276;
    }
    float _1278 = _1264;
    int _1280 = 0;
    if (_1164)
    {
        _1280 = as_type<int>(_1166);
    }
    int _1282 = _1280;
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1286 = int(_1284);
    float _1288 = _1250 * _164;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1292 = int(_1290);
    float _1294 = float(uint(_1272));
    float _1296 = 1.0 / _1222;
    float _1298 = float(_1286);
    float _1300 = 1.0 / _1252;
    float _1302 = float(uint(_1292));
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1306 = int(_1304);
    float _1308 = _1296 * _164;
    float _1310 = 1.0 / _1274;
    float _1312 = _1300 * _164;
    float _1314 = 1.0 / _1294;
    float _1316 = float(uint(_1306));
    float _1318 = trunc(_1288);
    int _1320 = int(_1318);
    float _1322 = _1294;
    int _1324 = _1282;
    if (_1164)
    {
        float _1326 = in.m_63.x;
        _1322 = _1326;
    }
    float _1328 = _1322;
    int _1330 = as_type<int>(_1310) + (-2);
    float _1332 = 1.0 / _1298;
    int _1334 = as_type<int>(_1314) + (-2);
    float _1336 = 1.0 / _1302;
    float _1338 = float(uint(_1320));
    float _1340 = as_type<float>(_1334) * _1338;
    float _1342 = trunc(_1308);
    int _1344 = int(_1342);
    float _1346 = _1332 * _164;
    float _1348 = trunc(_1312);
    int _1350 = int(_1348);
    int _1352 = as_type<int>(_1336) + (-2);
    float _1354 = 1.0 / _1316;
    float _1356 = float(uint(_1344));
    float _1358 = as_type<float>(_1352) * _1356;
    float _1360 = trunc(_1346);
    int _1362 = int(_1360);
    float _1364 = _1316;
    int _1366 = as_type<int>(_1358);
    if (_1164)
    {
        float _1368 = in.m_63.z;
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = float(uint(_1350));
    float _1374 = as_type<float>(_1330) * _1372;
    float _1376 = trunc(_1340);
    float _1378 = precise::max(_1376, 0.0);
    uint _1381 = uint(_1378);
    float _1383 = trunc(_1358);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    float _1389 = trunc(_1374);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = _1328;
    if (_1164)
    {
        _1366 = as_type<int>(_1328);
    }
    int _1397 = _1366;
    int _1399 = 0;
    float _1401 = as_type<float>(_1397);
    float _1403 = _1370;
    if (_1164)
    {
        _1399 = as_type<int>(_1370);
    }
    int _1405 = _1399;
    int _1407 = 0;
    int _1409 = _1405;
    if (_1164)
    {
        _1407 = _1397;
    }
    int _1411 = _1407;
    int _1413 = int(_1184);
    int _1415 = _1174 ? 2 : 0;
    int _1417 = _1413 | _1415;
    int _1419 = _1188 ? 4 : 0;
    int _1421 = _1417 | _1419;
    int _1423 = _1164 ? 8 : 0;
    int _1425 = _1421 | _1423;
    int _1427 = false ? 16 : 0;
    int _1429 = _1425 | _1427;
    int _1431 = _1248 ? 32 : 0;
    int _1433 = _1429 | _1431;
    int _1435 = false ? 64 : 0;
    int _1437 = _1433 | _1435;
    int _1439 = _1437 & 32;
    float _1441 = as_type<float>(_1439);
    int _1443 = _1411;
    if (_1164)
    {
        _1441 = as_type<float>(_1397);
    }
    float _1445 = _1441;
    float _1447 = _1445;
    if (!_1164)
    {
        float _1449 = in.m_63.x;
        float _1451 = _1166 * 3.1415927410125732421875;
        float _1453 = in.m_63.z;
        float _1455 = _1451 * 0.15915493667125701904296875;
        float _1457 = _1455 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1449 * 3.1415927410125732421875;
        float _1463 = _1461 * 0.15915493667125701904296875;
        float _1465 = _1453 * 3.1415927410125732421875;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = _1463 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        _1447 = _1453;
        _1214 = 5.839270114898681640625;
        _1395 = _1449;
        _1198 = 7.345489978790283203125;
        _1401 = _1166;
        _1208 = 1.2345600128173828125;
        _1224 = 1;
        _1228 = 2;
        _1403 = _1453;
        _1324 = as_type<int>(_1459);
        _1443 = as_type<int>(_1471);
        _1409 = as_type<int>(_1475);
    }
    float _1477 = _1447;
    float _1479 = _1214;
    float _1481 = _1395;
    float _1483 = _1198;
    float _1485 = _1401;
    float _1487 = _1208;
    int _1489 = _1224;
    int _1491 = _1228;
    float _1493 = _1403;
    int _1495 = _1324;
    int _1497 = _1443;
    int _1499 = _1409;
    int _1501 = ~_1220;
    int _1503 = _1501 + 1;
    float _1505 = _1066;
    if (_1174)
    {
        float _1507 = in.m_63.x;
        _1505 = _1507;
    }
    float _1509 = _1505;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1513 = _1511 != 0;
    float _1515 = _1477 * _1479;
    int _1517 = ~_1292;
    int _1519 = _1517 + 1;
    int _1521 = _1503 * int(_1393);
    int _1523 = _1521 + _1350;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1527 = _1525 != 0;
    float _1529 = _1481 * _1483;
    float _1531 = _1485 * _1487;
    int _1533 = as_type<int>(_1354) + (-2);
    float _1535 = floor(_1515);
    float _1537 = float(uint(_1523));
    int _1539 = _1519 * int(_1387);
    int _1541 = _1539 + _1344;
    float _1543 = float(uint(_1362));
    float _1545 = _1485 * _1483;
    float _1547 = _1477;
    if (_1513)
    {
        float _1549 = in.m_63.z;
        _1547 = _1549;
    }
    float _1551 = _1547;
    int _1553 = ~_1272;
    int _1555 = _1553 + 1;
    float _1557 = as_type<float>(_1330) * _1537;
    float _1559 = float(uint(_1541));
    float _1561 = floor(_1529);
    int _1563 = 0;
    float _1565 = _1557;
    if (_1527)
    {
        float _1567 = -_1160;
        float _1569 = _1567 + 1.0;
        _1563 = as_type<int>(_1569);
    }
    int _1571 = _1563;
    int _1573 = _1555 * int(_1381);
    int _1575 = _1573 + _1320;
    int _1577 = 0;
    if (_1513)
    {
        float _1579 = -_1160;
        float _1581 = _1579 + 1.0;
        _1577 = as_type<int>(_1581);
    }
    int _1583 = _1577;
    float _1585 = as_type<float>(_1352) * _1559;
    int _1587 = ~_1220;
    int _1589 = _1587 + 1;
    bool _1591 = _1489 != 1;
    float _1593 = _1509;
    if (_1174)
    {
        bool _1595 = _1509 > 0.5;
        _1200 = _1595;
    }
    bool _1597 = _1200;
    float _1599 = floor(_1531);
    if (!_1527)
    {
        _1593 = _1160;
    }
    float _1601 = _1593;
    bool _1603 = _1491 != 2;
    float _1605 = _1601;
    if (_1527)
    {
        float _1607 = _1248 ? as_type<float>(_1571) : _1160;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1166 * 2.0;
    float _1613 = float(uint(_1575));
    float _1615 = in.m_59.w;
    int _1617 = ~_1272;
    int _1619 = _1617 + 1;
    float _1621 = trunc(_1585);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = -_1561;
    float _1629 = _1529 + _1627;
    float _1631 = as_type<float>(_1334) * _1613;
    int _1633 = ~_1306;
    int _1635 = _1633 + 1;
    int _1637 = as_type<int>(_1613);
    float _1639 = as_type<float>(_1619);
    if (_1174)
    {
        float _1641 = -_1160;
        float _1643 = _1641 + 1.0;
        _1637 = as_type<int>(_1643);
    }
    int _1645 = _1637;
    if (_1513)
    {
        bool _1647 = _1551 > 0.5;
        _1202 = _1647;
    }
    bool _1649 = _1202;
    float _1651 = in.m_61.w;
    int _1653 = ~_1292;
    int _1655 = _1653 + 1;
    float _1657 = -_1599;
    float _1659 = _1531 + _1657;
    float _1661 = as_type<float>(_1533) * _1543;
    float _1663 = float(_130);
    float _1665 = trunc(_1631);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    float _1671 = float(_1220);
    float _1673 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1675 = as_type<float>(_1655);
    if (_1174)
    {
        float _1677 = _1597 ? as_type<float>(_1645) : _1160;
        _1234 = _1677;
    }
    float _1679 = _1234;
    int _1681 = int(_1387) + int(_1625);
    float _1683 = _1629 * _1671;
    float _1685 = float(_1350);
    float _1687 = trunc(_1661);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = -_1535;
    float _1695 = _1515 + _1693;
    float _1697 = float(_1292);
    bool _1699 = _1685 >= _1671;
    bool _1701 = isnan(_1685);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(_1671);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = float(_1306);
    float _1713 = floor(_1545);
    int _1715 = int(_1381) + int(_1669);
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1723 = _1721 != 0;
    float _1725 = 1.0 / _1663;
    int _1727 = _1635 * int(_1691);
    int _1729 = _1727 + _1362;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1733 = float(uint(_1729));
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1737 = trunc(_1557);
    float _1739 = precise::max(_1737, 0.0);
    uint _1741 = uint(_1739);
    float _1743 = _1671 * _164;
    float _1745 = -_1713;
    float _1747 = _1545 + _1745;
    float _1749 = as_type<float>(_1533) * _1733;
    float _1751 = float(_1344);
    float _1753 = _1697 * _1659;
    float _1755 = float(_1272);
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1759 = trunc(_1749);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    if (!_1513)
    {
        _1565 = _1160;
    }
    float _1765 = _1565;
    float _1767 = _1743 * _1725;
    float _1769 = _1765;
    if (_1513)
    {
        float _1771 = _1649 ? as_type<float>(_1583) : _1160;
        _1769 = _1771;
    }
    float _1773 = _1769;
    float _1775 = _1725 * _164;
    float _1777 = float(_1320);
    float _1779 = _1755 * _1695;
    bool _1781 = _1751 >= _1697;
    bool _1783 = isnan(_1751);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(_1697);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = _1755 * _1775;
    int _1795 = int(_1393) + int(_1741);
    float _1797 = _1711 * _1775;
    float _1799 = float(_1362);
    float _1801 = trunc(_1791);
    int _1803 = int(_1801);
    bool _1805 = _1777 >= _1755;
    bool _1807 = isnan(_1777);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan(_1755);
    bool _1813 = _1809 || _1811;
    float _1815 = float(_1813);
    float _1817 = _1711 * _1747;
    bool _1819 = _1799 >= _1711;
    bool _1821 = isnan(_1799);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(_1711);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    int _1831 = _1589 * _1795;
    int _1833 = _1831 + _1350;
    int _1835 = _1655 * _1681;
    int _1837 = _1835 + _1344;
    int _1839 = int(_1691) + int(_1763);
    float _1841 = trunc(_1709);
    int _1843 = int(_1841);
    bool _1845 = !_1719;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = _1697 * _1775;
    bool _1851 = uint(_1833) >= uint(_1220);
    int _1853 = _1619 * _1715;
    int _1855 = _1853 + _1320;
    int _1857 = abs(_1847);
    int _1859 = ~_1306;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1683);
    int _1865 = int(_1863);
    bool _1867 = uint(_1837) >= uint(_1292);
    bool _1869 = uint(_1855) >= uint(_1272);
    int _1871 = _1861 * _1839;
    int _1873 = _1871 + _1362;
    bool _1875 = !_1723;
    int _1877 = _1875 ? 0 : 1;
    bool _1879 = !_1851;
    int _1881 = _1879 ? 0 : (-1);
    float _1883 = trunc(_1753);
    int _1885 = int(_1883);
    bool _1887 = !_1867;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = abs(_1877);
    int _1893 = ~_1795;
    int _1895 = _1893 + _1881;
    int _1897 = _1895 + 1;
    bool _1899 = !_1869;
    int _1901 = _1899 ? 0 : (-1);
    float _1903 = trunc(_1815);
    int _1905 = int(_1903);
    bool _1907 = uint(_1873) >= uint(_1306);
    int _1909 = _1865 * _1857;
    int _1911 = _1909 + _1350;
    int _1913 = ~_1681;
    int _1915 = _1913 + _1889;
    int _1917 = _1915 + 1;
    int _1919 = ~_1715;
    int _1921 = _1919 + _1901;
    int _1923 = _1921 + 1;
    int _1925 = _1220 * _1897;
    int _1927 = _1925 + _1350;
    bool _1929 = !_1907;
    int _1931 = _1929 ? 0 : (-1);
    int _1933 = _1885 * _1891;
    int _1935 = _1933 + _1344;
    int _1937 = _1292 * _1917;
    int _1939 = _1937 + _1344;
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1943 = _1941 != 0;
    float _1945 = trunc(_1779);
    int _1947 = int(_1945);
    int _1949 = ~_1839;
    int _1951 = _1949 + _1931;
    int _1953 = _1951 + 1;
    int _1955 = _1272 * _1923;
    int _1957 = _1955 + _1320;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1961 = _1959 != 0;
    int _1963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1965 = _1963 != 0;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1969 = _1967 != 0;
    bool _1971 = _1292 == 0;
    int _1973 = _1306 * _1953;
    int _1975 = _1973 + _1362;
    bool _1977 = !_1943;
    int _1979 = _1977 ? 0 : 1;
    float _1981 = trunc(_1829);
    int _1983 = int(_1981);
    bool _1985 = _1220 == 0;
    bool _1987 = _1272 == 0;
    int _1989 = ~_1803;
    int _1991 = _1989 + 1;
    int _1993 = _1991 + 1;
    bool _1995 = _1306 == 0;
    float _1997 = trunc(_1767);
    int _1999 = int(_1997);
    bool _2001 = !_1971;
    int _2003 = _2001 ? _1939 : (-1);
    int _2005 = ~_1843;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    bool _2011 = !_1985;
    int _2013 = _2011 ? _1927 : (-1);
    int _2015 = _1993 * _2003;
    int _2017 = abs(_1979);
    float _2019 = trunc(_1849);
    int _2021 = int(_2019);
    int _2023 = ~_1905;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = _2013 * _2009;
    bool _2031 = !_1987;
    int _2033 = _2031 ? _1957 : (-1);
    int _2035 = _1947 * _2017;
    int _2037 = _2035 + _1320;
    bool _2039 = !_1995;
    int _2041 = _2039 ? _1975 : (-1);
    int _2043 = _1220 + (-1);
    int _2045 = _2027 * _2033;
    bool _2047 = !_1965;
    int _2049 = _2047 ? 0 : 1;
    float _2051 = floor(_1611);
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2055 = _2053 != 0;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2059 = _2057 != 0;
    int _2061 = _1843 * _2043;
    int _2063 = _2061 + _2029;
    int _2065 = _1292 + (-1);
    int _2067 = abs(_2049);
    bool _2069 = !_1961;
    int _2071 = _2069 ? 0 : 1;
    int _2073 = _1803 * _2065;
    int _2075 = _2073 + _2015;
    bool _2077 = !_2059;
    int _2079 = _2077 ? 0 : 1;
    int _2081 = _2063 * _2067;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2085 = _2083 != 0;
    int _2087 = abs(_2071);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2091 = _2089 != 0;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2095 = _2093 != 0;
    bool _2097 = !_1969;
    int _2099 = _2097 ? 0 : 1;
    int _2101 = _1999 * _2087;
    int _2103 = _2101 + _2081;
    int _2105 = abs(_2079);
    bool _2107 = !_2091;
    int _2109 = _2107 ? 0 : 1;
    int _2111 = abs(_2099);
    int _2113 = _2075 * _2105;
    bool _2115 = !_2085;
    int _2117 = _2115 ? 0 : 1;
    int _2119 = abs(_2109);
    bool _2121 = !_2055;
    int _2123 = _2121 ? 0 : 1;
    int _2125 = abs(_2117);
    int _2127 = _1911 * _2111;
    int _2129 = _2127 + _2103;
    int _2131 = abs(_2123);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2139 = _2137 != 0;
    int _2141 = _2021 * _2131;
    int _2143 = _2141 + _2113;
    bool _2145 = !_2095;
    int _2147 = _2145 ? 0 : 1;
    int _2149 = _1865 * _2125;
    int _2151 = _2149 + _2129;
    float _2153 = trunc(_1817);
    int _2155 = int(_2153);
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2147);
    int _2163 = _1935 * _2119;
    int _2165 = _2163 + _2143;
    bool _2167 = !_2159;
    int _2169 = _2167 ? 0 : 1;
    bool _2171 = !_2139;
    int _2173 = _2171 ? 0 : 1;
    float _2175 = trunc(_1793);
    int _2177 = int(_2175);
    float _2179 = float(uint(_2151));
    int _2181 = abs(_2169);
    int _2183 = _1885 * _2161;
    int _2185 = _2183 + _2165;
    int _2187 = abs(_2173);
    float _2189 = as_type<float>(_1330) * _2179;
    int _2191 = _1272 + (-1);
    bool _2193 = !_2135;
    int _2195 = _2193 ? 0 : 1;
    float _2197 = trunc(_2189);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = ~_1983;
    int _2205 = _2203 + 1;
    int _2207 = _2205 + 1;
    int _2209 = _1905 * _2191;
    int _2211 = _2209 + _2045;
    int _2213 = abs(_2195);
    float _2215 = in.m_73.y;
    int _2217 = _2207 * _2041;
    float _2219 = float(uint(_2185));
    int _2221 = _2211 * _2187;
    int _2223 = _1306 + (-1);
    int _2225 = _2155 * _2181;
    int _2227 = _2225 + _1362;
    int _2229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2231 = _2229 != 0;
    float _2233 = as_type<float>(_1352) * _2219;
    int _2235 = _2177 * _2213;
    int _2237 = _2235 + _2221;
    int _2239 = ~_1220;
    int _2241 = _2239 + 1;
    int _2243 = _1983 * _2223;
    int _2245 = _2243 + _2217;
    bool _2247 = !_2231;
    int _2249 = _2247 ? 0 : 1;
    float _2251 = trunc(_2233);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2259 = _2257 != 0;
    int _2261 = abs(_2249);
    int _2263 = _2241 * int(_2201);
    int _2265 = _2263 + _2151;
    bool _2267 = !_2259;
    int _2269 = _2267 ? 0 : 1;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2273 = _2271 != 0;
    int _2275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2277 = _2275 != 0;
    float _2279 = trunc(_1797);
    int _2281 = int(_2279);
    int _2283 = ~_1292;
    int _2285 = _2283 + 1;
    float _2287 = float(uint(_2265));
    int _2289 = _2037 * _2261;
    int _2291 = _2289 + _2237;
    bool _2293 = !_2277;
    int _2295 = _2293 ? 0 : 1;
    float _2297 = -_2215;
    float _2299 = _2297 + 1.0;
    float _2301 = as_type<float>(_1330) * _2287;
    bool _2303 = !_2273;
    int _2305 = _2303 ? 0 : 1;
    int _2307 = abs(_2295);
    int _2309 = _2285 * int(_2255);
    int _2311 = _2309 + _2185;
    int _2313 = abs(_2269);
    float _2315 = trunc(_2301);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2323 = _2321 != 0;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2327 = _2325 != 0;
    int _2329 = abs(_2305);
    float _2331 = float(uint(_2311));
    int _2333 = _2245 * _2307;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = _1947 * _2313;
    int _2341 = _2339 + _2291;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2345 = _2343 != 0;
    float _2347 = as_type<float>(_1352) * _2331;
    int _2349 = abs(_2337);
    float _2351 = float(uint(_2341));
    float _2353 = trunc(_2347);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    int _2359 = _2281 * _2329;
    int _2361 = _2359 + _2333;
    bool _2363 = !_2327;
    int _2365 = _2363 ? 0 : 1;
    float _2367 = as_type<float>(_1334) * _2351;
    int _2369 = int(_2201) + int(_2319);
    int _2371 = _2227 * _2349;
    int _2373 = _2371 + _2361;
    int _2375 = ~_1220;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2367);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = abs(_2365);
    float _2387 = in.m_63.w;
    int _2389 = _2377 * _2369;
    int _2391 = _2389 + _2151;
    int _2393 = ~_1272;
    int _2395 = _2393 + 1;
    int _2397 = _2155 * _2385;
    int _2399 = _2397 + _2373;
    int _2401 = ~_1292;
    int _2403 = _2401 + 1;
    int _2405 = _2155;
    float _2407 = as_type<float>(_1957);
    float _2409 = as_type<float>(_1839);
    if (_2345)
    {
        float _2411 = -_1160;
        float _2413 = _2411 + 1.0;
        _2405 = as_type<int>(_2413);
    }
    int _2415 = _2405;
    bool _2417 = uint(_2391) >= uint(_1220);
    int _2419 = int(_2255) + int(_2357);
    bool _2421 = !_2417;
    int _2423 = _2421 ? 0 : (-1);
    int _2425 = _2403 * _2419;
    int _2427 = _2425 + _2185;
    float _2429 = float(uint(_2399));
    int _2431 = _2395 * int(_2383);
    int _2433 = _2431 + _2341;
    bool _2435 = _1166 > 0.5;
    int _2437 = ~_2369;
    int _2439 = _2437 + _2423;
    int _2441 = _2439 + 1;
    float _2443 = as_type<float>(_1533) * _2429;
    if (_2345)
    {
        float _2445 = _2435 ? as_type<float>(_2415) : _1160;
        _1230 = _2445;
    }
    float _2447 = _1230;
    bool _2449 = uint(_2427) >= uint(_1292);
    int _2451 = _1220 * _2441;
    int _2453 = _2451 + _2151;
    float _2455 = float(uint(_2433));
    float _2457 = trunc(_2443);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    bool _2463 = _1220 == 0;
    bool _2465 = !_2449;
    int _2467 = _2465 ? 0 : (-1);
    bool _2469 = _2387 > 0.5;
    float _2471 = as_type<float>(_1334) * _2455;
    bool _2473 = !_2463;
    int _2475 = _2473 ? _2453 : (-1);
    int _2477 = _2469 ? as_type<int>(_2299) : as_type<int>(_2215);
    float _2479 = trunc(_2471);
    float _2481 = precise::max(_2479, 0.0);
    uint _2483 = uint(_2481);
    int _2485 = _2475 & 3;
    bool _2487 = _2485 != 0;
    int _2489 = _2475 & 3;
    bool _2491 = _2489 != 0;
    bool _2493 = uint(_2485) >= 2u;
    int _2495 = _2491 ? 0 : 1;
    int _2497 = ~_2419;
    int _2499 = _2497 + _2467;
    int _2501 = _2499 + 1;
    bool _2503 = uint(_2485) > 1u;
    int _2505 = ~_1306;
    int _2507 = _2505 + 1;
    int _2509 = _1292 * _2501;
    int _2511 = _2509 + _2185;
    int _2513 = _2493 ? 0 : 1;
    bool _2515 = _2485 != 3;
    int _2517 = _2507 * int(_2461);
    int _2519 = _2517 + _2399;
    int _2521 = _2435 ? as_type<int>(_2299) : as_type<int>(_2215);
    bool _2523 = _1292 == 0;
    int _2525 = ~_1272;
    int _2527 = _2525 + 1;
    bool _2529 = !_2523;
    int _2531 = _2529 ? _2511 : (-1);
    int _2533 = int(_2383) + int(_2483);
    float _2535 = float(uint(_2519));
    int _2537 = ~_2495;
    int _2539 = _2537 + 1;
    int _2541 = _2539 + 1;
    float _2543 = as_type<float>(_1533) * _2535;
    int _2545 = _2541;
    if (!_2503)
    {
        int _2547 = ~_2495;
        int _2549 = _2547 + 1;
        _2545 = _2549;
    }
    int _2551 = _2545;
    int _2553 = _2531 & 3;
    bool _2555 = _2553 != 0;
    int _2557 = _2527 * _2533;
    int _2559 = _2557 + _2341;
    int _2561 = ~_2513;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2565;
    if (_2515)
    {
        int _2569 = ~_2513;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    bool _2575 = uint(_2553) >= 2u;
    float _2577 = trunc(_2543);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    int _2583 = _2555 ? 0 : 1;
    bool _2585 = uint(_2559) >= uint(_1272);
    int _2587 = _2575 ? 0 : 1;
    bool _2589 = _2553 != 3;
    bool _2591 = !_2585;
    int _2593 = _2591 ? 0 : (-1);
    bool _2595 = uint(_2553) > 1u;
    int _2597 = ~_2533;
    int _2599 = _2597 + _2593;
    int _2601 = _2599 + 1;
    int _2603 = ~_2587;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    bool _2609 = _1272 == 0;
    int _2611 = _1272 * _2601;
    int _2613 = _2611 + _2341;
    int _2615 = ~_2583;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2607;
    int _2623 = _2619;
    if (_2589)
    {
        int _2625 = ~_2587;
        int _2627 = _2625 + 1;
        _2621 = _2627;
    }
    int _2629 = _2621;
    int _2631 = ~_1306;
    int _2633 = _2631 + 1;
    int _2635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2637 = _2635 != 0;
    if (!_2595)
    {
        int _2639 = ~_2583;
        int _2641 = _2639 + 1;
        _2623 = _2641;
    }
    int _2643 = _2623;
    bool _2645 = !_2609;
    int _2647 = _2645 ? _2613 : (-1);
    int _2649 = int(_2461) + int(_2581);
    bool _2651 = !_2637;
    int _2653 = _2651 ? 0 : 1;
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2657 = _2655 != 0;
    int _2659 = _2633 * _2649;
    int _2661 = _2659 + _2399;
    int _2663 = _2647 & 3;
    bool _2665 = _2663 != 0;
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : 1;
    bool _2671 = uint(_2663) >= 2u;
    int _2673 = _2665 ? 0 : 1;
    bool _2675 = uint(_2661) >= uint(_1306);
    int _2677 = _2671 ? 0 : 1;
    bool _2679 = _2663 != 3;
    bool _2681 = !_2675;
    int _2683 = _2681 ? 0 : (-1);
    bool _2685 = uint(_2663) > 1u;
    int _2687 = ~_2649;
    int _2689 = _2687 + _2683;
    int _2691 = _2689 + 1;
    int _2693 = ~_2677;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    bool _2699 = _1306 == 0;
    int _2701 = _1306 * _2691;
    int _2703 = _2701 + _2399;
    int _2705 = ~_2673;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = _2697;
    int _2713 = _2709;
    if (_2679)
    {
        int _2715 = ~_2677;
        int _2717 = _2715 + 1;
        _2711 = _2717;
    }
    int _2719 = _2711;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2723 = _2721 != 0;
    bool _2725 = !_2699;
    int _2727 = _2725 ? _2703 : (-1);
    float _2729 = _2723 ? as_type<float>(_2521) : _2215;
    if (!_2685)
    {
        int _2731 = ~_2673;
        int _2733 = _2731 + 1;
        _2713 = _2733;
    }
    int _2735 = _2713;
    int _2737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2739 = _2737 != 0;
    int _2741 = _2727 & 3;
    bool _2743 = _2741 != 0;
    bool _2745 = !_2739;
    int _2747 = _2745 ? 0 : 1;
    bool _2749 = uint(_2741) >= 2u;
    int _2751 = _2743 ? 0 : 1;
    int _2753 = _2749 ? 0 : 1;
    bool _2755 = _2741 != 3;
    bool _2757 = uint(_2741) > 1u;
    int _2759 = ~_2753;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = ~_2751;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2773 = _2771 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2775 = _2763;
    int _2777 = _2769;
    if (_2755)
    {
        int _2779 = ~_2753;
        int _2781 = _2779 + 1;
        _2775 = _2781;
    }
    int _2783 = _2775;
    float _2785 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2787 = _2785 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2757)
    {
        int _2789 = ~_2751;
        int _2791 = _2789 + 1;
        _2777 = _2791;
    }
    int _2793 = _2777;
    float _2795 = 1.0 / _2773;
    float _2797 = in.m_48.x;
    float _2799 = in.m_48.y;
    float _2801 = in.m_48.z;
    bool _2803 = _1493 > 0.5;
    float _2805 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2809 = _2807 != 0;
    int _2811 = _2803 ? as_type<int>(_2299) : as_type<int>(_2215);
    float _2813 = _2809 ? as_type<float>(_2477) : _2215;
    float _2815 = 1.0 / _2787;
    int _2817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2819 = _2817 != 0;
    int _2821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2823 = _2821 != 0;
    float _2825 = _2819 ? as_type<float>(_2811) : _2215;
    float _2827 = _2823 ? as_type<float>(_2811) : _2215;
    bool _2829 = !_1591;
    float _2831 = _2829 ? as_type<float>(_1495) : as_type<float>(_1497);
    bool _2833 = !_1591;
    float _2835 = _2833 ? as_type<float>(_1499) : as_type<float>(_1495);
    float _2837 = _202 * _2799;
    float _2839 = _196 * _2799;
    float _2841 = _208 * _2799;
    float _2843 = fma(_200, _2797, _2837);
    float _2845 = fma(_194, _2797, _2839);
    float _2847 = fma(_206, _2797, _2841);
    if (!_1591)
    {
        _1675 = _1493;
    }
    float _2849 = _1675;
    float _2851 = fma(_204, _2801, _2843);
    float _2853 = fma(_198, _2801, _2845);
    float _2855 = 0.0;
    float _2857 = _2849;
    if (!_1591)
    {
        _2855 = _1493;
    }
    float _2859 = _2855;
    float _2861 = as_type<float>(_1495) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2863 = _2859;
    if (!_1591)
    {
        _1639 = _1166;
    }
    float _2865 = _1639;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2869 = 0.0;
    float _2871 = _2865;
    if (!_1591)
    {
        _2869 = _1166;
    }
    float _2873 = _2869;
    float _2875 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2877 = _2873;
    if (_1603)
    {
        _2407 = _1481;
    }
    float _2879 = _2407;
    float _2881 = fma(as_type<float>(_1495), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2867);
    float _2883 = _2879;
    if (_1591)
    {
        _2857 = _1166;
    }
    float _2885 = _2857;
    float _2887 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2889 = log2(_2887);
    if (_1591)
    {
        _2863 = _1166;
    }
    float _2891 = _2863;
    float _2893 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1603)
    {
        _2409 = _1166;
    }
    float _2895 = _2409;
    float _2897 = fma(_210, _2801, _2847);
    float _2899 = _2895;
    if (_1591)
    {
        _2871 = _1481;
    }
    float _2901 = _2871;
    float _2903 = fma(_2835, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1731);
    if (_1591)
    {
        _2877 = _1481;
    }
    float _2905 = _2877;
    float _2907 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1603)
    {
        _2883 = _1493;
    }
    float _2909 = _2883;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1603)
    {
        _2899 = _1481;
    }
    float _2913 = _2899;
    float _2915 = fma(_2907, -2.0, _1757);
    int _2917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2919 = _2917 != 0;
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2923 = _2921 != 0;
    float _2925 = fma(as_type<float>(_1497), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2911);
    int _2927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2929 = _2927 != 0;
    float _2931 = _2889 * _164;
    float _2933 = as_type<float>(_1497) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2935 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2939 = exp2(_2931);
    float _2941 = _2919 ? as_type<float>(_2811) : _2215;
    float _2943 = fma(_2875, -2.0, _2937);
    bool _2945 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2947 = isnan(0.0);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2953 = _2949 || _2951;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2955;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2963 = _2957 * _2795;
    float _2965 = fma(_2861, -2.0, _2959);
    float _2967 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2961);
    float _2969 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2973 = -_2939;
    float _2975 = _2973 + 1.0;
    float _2977 = -_2971;
    float _2979 = fma(_2893, 2.0, _2977);
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2983 = _2953 ? _2975 : 0.0;
    float _2985 = -_2805;
    float _2987 = fma(_2969, 2.0, _2985);
    float _2989 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2993 = -_2981;
    float _2995 = fma(_2933, 2.0, _2993);
    float _2997 = fma(_2891, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2989);
    float _2999 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3003 = _3001 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3007 = fma(_2999, -2.0, _1735);
    float _3009 = _2923 ? as_type<float>(_2811) : _2215;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3013 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3015 = _3013 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3017 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3019 = _3017 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3021 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3023 = isnan(1.0);
    bool _3025 = _3021 || _3023;
    bool _3027 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3029 = _3025 || _3027;
    float _3031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3033 = 1.0 + _3031;
    float _3035 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2991);
    float _3037 = 1.0 / _3033;
    float _3039 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3005);
    float _3041 = _1481 * 2.0;
    float _3043 = fma(_2831, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3011);
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3051 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3053 = 1.0 / _3003;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3057 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3061 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3039);
    float _3063 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3045);
    float _3065 = -_3049;
    float _3067 = fma(_3051, 2.0, _3065);
    float _3069 = floor(_3041);
    float _3071 = -_3047;
    float _3073 = fma(_2935, 2.0, _3071);
    float _3075 = fma(_3057, -2.0, _3055);
    float _3077 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3059);
    float _3079 = _3015 * _2815;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3085 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3063);
    float _3087 = 1.0 / _3019;
    float _3089 = -_164;
    float _3091 = fma(_3089, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2995);
    float _3093 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2965);
    float _3095 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2943);
    float _3097 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3035);
    float _3099 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3077);
    float _3101 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2925);
    float _3103 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2881);
    float _3105 = -_164;
    float _3107 = fma(_3105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2979);
    float _3109 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3043);
    float _3111 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2903);
    float _3113 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2967);
    float _3115 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2997);
    float _3117 = -_164;
    float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3067);
    float _3121 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2915);
    float _3123 = -_164;
    float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3073);
    float _3127 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3007);
    float _3129 = -_164;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2987);
    float _3133 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3075);
    if (_3029)
    {
        float _3135 = _2983 * _3037;
        _168 = _3135;
    }
    float _3137 = _168;
    float _3139 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3141 = _3139 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3143 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3145 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3143;
    float _3147 = 1.0 / _3083;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3149;
    float _3153 = _3145 * _3053;
    bool _3155 = _3069 >= 0.0;
    bool _3157 = isnan(_3069);
    bool _3159 = _3155 || _3157;
    bool _3161 = isnan(0.0);
    bool _3163 = _3159 || _3161;
    float _3165 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3167 = _3165 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3173 = _3151 * _3087;
    float _3175 = float(uint(_1935));
    float _3177 = 1.0 / _3141;
    int _3179 = _3163 ? 0 : 1;
    float _3181 = in.m_57.w;
    bool _3183 = _3069 > 0.0;
    float _3185 = as_type<float>(_1352) * _3175;
    float _3187 = float(uint(_1911));
    float _3189 = _3171 * _3147;
    float _3191 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3193 = _3191 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3195 = 1.0 / _3167;
    float _3197 = as_type<float>(_1330) * _3187;
    int _3199 = ~_1292;
    int _3201 = _3199 + 1;
    float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3205 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3203;
    int _3207 = ~_1272;
    int _3209 = _3207 + 1;
    float _3211 = _3193 * _3177;
    int _3213 = ~_3179;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    float _3219 = trunc(_3185);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    int _3225 = _3217;
    if (!_3183)
    {
        int _3227 = ~_3179;
        int _3229 = _3227 + 1;
        _3225 = _3229;
    }
    int _3231 = _3225;
    float _3233 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3235 = _1154 + _3233;
    float _3237 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3239 = _1154 + _3237;
    bool _3241 = _2051 >= 0.0;
    bool _3243 = isnan(_2051);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_2963, _3235, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3255 = _1154 + _3253;
    float _3257 = trunc(_3197);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    float _3263 = fma(_3079, _3239, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3265 = _3205 * _3195;
    float _3267 = fma(_3189, _3255, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3271 = _1154 + _3269;
    int _3273 = ~_1220;
    int _3275 = _3273 + 1;
    int _3277 = _3249 ? 0 : 1;
    int _3279 = _3201 * int(_3223);
    int _3281 = _3279 + _1935;
    float _3283 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3285 = _1154 + _3283;
    bool _3287 = _2051 > 0.0;
    float _3289 = float(uint(_2227));
    float _3291 = fma(_3153, _3285, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3293 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3295 = _1154 + _3293;
    int _3297 = ~_1306;
    int _3299 = _3297 + 1;
    int _3301 = _3275 * int(_3261);
    int _3303 = _3301 + _1911;
    float _3305 = as_type<float>(_1533) * _3289;
    float _3307 = fma(_3173, _3295, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3309 = fma(_3211, _3271, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3311 = float(uint(_3281));
    float _3313 = float(uint(_2037));
    float _3315 = trunc(_3305);
    float _3317 = precise::max(_3315, 0.0);
    uint _3319 = uint(_3317);
    float _3321 = float(uint(_3303));
    float _3323 = as_type<float>(_1352) * _3311;
    bool _3325 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3327 = isnan(_1154);
    bool _3329 = _3325 || _3327;
    bool _3331 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3333 = _3329 || _3331;
    float _3335 = float(_3333);
    float _3337 = as_type<float>(_1334) * _3313;
    bool _3339 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3341 = isnan(_1154);
    bool _3343 = _3339 || _3341;
    bool _3345 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3347 = _3343 || _3345;
    float _3349 = float(_3347);
    float _3351 = as_type<float>(_1330) * _3321;
    bool _3353 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3355 = isnan(_1154);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3361 = _3357 || _3359;
    float _3363 = float(_3361);
    float _3365 = -_3335;
    float _3367 = _3365 + 1.0;
    bool _3369 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3371 = isnan(_1154);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3377 = _3373 || _3375;
    float _3379 = float(_3377);
    float _3381 = trunc(_3337);
    float _3383 = precise::max(_3381, 0.0);
    uint _3385 = uint(_3383);
    int _3387 = _2531 & 3;
    bool _3389 = _3387 != 0;
    float _3391 = -_3363;
    float _3393 = _3391 + 1.0;
    float _3395 = _3363 * _3367;
    bool _3397 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3399 = isnan(_1154);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3405 = _3401 || _3403;
    float _3407 = float(_3405);
    float _3409 = _3349 * _3393;
    float _3411 = -_3349;
    float _3413 = _3411 + 1.0;
    float _3415 = trunc(_3351);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    bool _3421 = _2741 != 3;
    float _3423 = _3379 * _3413;
    float _3425 = -_3379;
    float _3427 = _3425 + 1.0;
    bool _3429 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3431 = isnan(_1154);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    bool _3441 = !_3421;
    int _3443 = _3441 ? 0 : (-1);
    int _3445 = _3209 * int(_3385);
    int _3447 = _3445 + _2037;
    float _3449 = _3407 * _3427;
    float _3451 = -_3407;
    float _3453 = _3451 + 1.0;
    bool _3455 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3457 = isnan(_1154);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = -_3439;
    float _3469 = _3467 + 1.0;
    float _3471 = float(uint(_3447));
    float _3473 = _3439 * _3453;
    bool _3475 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3477 = isnan(_1154);
    bool _3479 = _3475 || _3477;
    bool _3481 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3483 = _3479 || _3481;
    float _3485 = float(_3483);
    float _3487 = _3465 * _3469;
    float _3489 = -_3465;
    float _3491 = _3489 + 1.0;
    float _3493 = as_type<float>(_1334) * _3471;
    float _3495 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3497 = _1154 + _3495;
    float _3499 = _2853 + _3181;
    float _3501 = trunc(_3323);
    float _3503 = precise::max(_3501, 0.0);
    uint _3505 = uint(_3503);
    int _3507 = _3299 * int(_3319);
    int _3509 = _3507 + _2227;
    float _3511 = _3485 * _3491;
    float _3513 = fma(_3265, _3497, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3515 = _2851 + _1615;
    float _3517 = -_3485;
    float _3519 = _3517 + 1.0;
    float _3521 = float(uint(_3509));
    float _3523 = _3251 * _3511;
    float _3525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3527 = ~_3277;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = fma(_3519, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3523);
    float _3535 = as_type<float>(_1533) * _3521;
    float _3537 = _2897 + _1651;
    int _3539 = _3531;
    if (!_3287)
    {
        int _3541 = ~_3277;
        int _3543 = _3541 + 1;
        _3539 = _3543;
    }
    int _3545 = _3539;
    float _3547 = fma(_3263, _3487, _3533);
    float _3549 = trunc(_3493);
    float _3551 = precise::max(_3549, 0.0);
    uint _3553 = uint(_3551);
    int _3555 = ~_1220;
    int _3557 = _3555 + 1;
    int _3559 = int(_3261) + int(_3419);
    float _3561 = fma(_3291, _3473, _3547);
    int _3563 = ~_1292;
    int _3565 = _3563 + 1;
    int _3567 = int(_3223) + int(_3505);
    float _3569 = trunc(_3535);
    float _3571 = precise::max(_3569, 0.0);
    uint _3573 = uint(_3571);
    int _3575 = _3557 * _3559;
    int _3577 = _3575 + _1911;
    float _3579 = _3525 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3581 = !_2929;
    int _3583 = _3581 ? 0 : 1;
    float _3585 = fma(_3267, _3449, _3561);
    int _3587 = ~_1272;
    int _3589 = _3587 + 1;
    int _3591 = _3565 * _3567;
    int _3593 = _3591 + _1935;
    int _3595 = int(_3385) + int(_3553);
    float _3597 = fma(_3579, _1268, -0.5);
    bool _3599 = uint(_3577) >= uint(_1220);
    float _3601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3603 = _3515 + _3601;
    int _3605 = ~_1306;
    int _3607 = _3605 + 1;
    int _3609 = _3589 * _3595;
    int _3611 = _3609 + _2037;
    bool _3613 = !_3599;
    int _3615 = _3613 ? 0 : (-1);
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3619 = _3499 + _3617;
    bool _3621 = uint(_3593) >= uint(_1292);
    float _3623 = _1493 * 2.0;
    int _3625 = int(_3319) + int(_3573);
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3629 = _3537 + _3627;
    float _3631 = fma(_3307, _3423, _3585);
    bool _3633 = !_3621;
    int _3635 = _3633 ? 0 : (-1);
    float _3637 = floor(_3623);
    bool _3639 = uint(_3611) >= uint(_1272);
    float _3641 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3643 = _3607 * _3625;
    int _3645 = _3643 + _2227;
    int _3647 = ~_3559;
    int _3649 = _3647 + _3615;
    int _3651 = _3649 + 1;
    float _3653 = fma(_3309, _3409, _3631);
    float _3655 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3641);
    bool _3657 = !_3639;
    int _3659 = _3657 ? 0 : (-1);
    float _3661 = _1166 + _1493;
    bool _3663 = uint(_3645) >= uint(_1306);
    float _3665 = fma(_3629, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    int _3667 = ~_3567;
    int _3669 = _3667 + _3635;
    int _3671 = _3669 + 1;
    float _3673 = _1166 + _1481;
    bool _3675 = !_3663;
    int _3677 = _3675 ? 0 : (-1);
    float _3679 = fma(_3513, _3395, _3653);
    bool _3681 = _3665 >= 0.0;
    int _3683 = _1220 * _3651;
    int _3685 = _3683 + _1911;
    float _3687 = _3673 + (-1.0);
    int _3689 = _1292 * _3671;
    int _3691 = _3689 + _1935;
    bool _3693 = !_3389;
    int _3695 = _3693 ? 0 : 1;
    float _3697 = fma(_3335, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3679);
    float _3699 = fma(_3687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3701 = _3603 * _3603;
    int _3703 = _2647 & 3;
    bool _3705 = _3703 != 0;
    float _3707 = _3661 + (-1.0);
    int _3709 = _2475 >> 31;
    float _3711 = fma(_3619, _3619, _3701);
    bool _3713 = !_3705;
    int _3715 = _3713 ? 0 : 1;
    float _3717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3719 = _2727 & 3;
    bool _3721 = _3719 != 0;
    float _3723 = fma(_3629, _3629, _3711);
    bool _3725 = !_2487;
    int _3727 = _3725 ? 0 : 1;
    out.m_75.x = _3697;
    bool _3729 = !_3721;
    int _3731 = _3729 ? 0 : 1;
    float _3733 = _1166 + (-0.5);
    bool _3735 = _2485 != 3;
    float _3737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3681)
    {
        out.m_51.x = 0.0;
    }
    bool _3739 = _3637 > 0.0;
    bool _3741 = _3637 >= 0.0;
    bool _3743 = isnan(_3637);
    bool _3745 = _3741 || _3743;
    bool _3747 = isnan(0.0);
    bool _3749 = _3745 || _3747;
    float _3751 = fma(_3707, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3753 = _3637;
    if (_3681)
    {
        _3753 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3755 = _3753;
    float _3757 = rsqrt(_3723);
    int _3759 = _3709 & 3;
    int _3761 = _2531 >> 31;
    int _3763 = as_type<int>(_3755);
    if (_3681)
    {
        float _3765 = _3755 * 5.0;
        _3763 = as_type<int>(_3765);
    }
    int _3767 = _3763;
    int _3769 = _2475 + _3759;
    int _3771 = _2647 >> 31;
    int _3773 = _3769 >> 2;
    if (_3681)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12335 = as_type<float>(_3767);
        out.gl_Position.z = _12335;
    }
    int _3775 = _3761 & 3;
    int _3777 = _3771 & 3;
    int _3779 = _3773 << 4;
    int _3781 = _3779 + 368;
    float _3783 = _3603 * _3757;
    int _3785 = _2647 + _3777;
    float _3787 = _3619 * _3757;
    int _3789 = _2531 + _3775;
    float _3791 = -_3783;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3603);
    float _3795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3797 = _2727 >> 31;
    float _3799 = -_3787;
    float _3801 = fma(_3799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3619);
    float _3803 = _3793 * _3793;
    int _3805 = _3785 >> 2;
    float _3807 = _3629 * _3757;
    int _3809 = _3797 & 3;
    float _3811 = fma(_3801, _3801, _3803);
    uint _3813 = uint(int(uint(_3781) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = _3805 << 4;
    int _3831 = _3829 + 656;
    float _3833 = -_3807;
    float _3835 = fma(_3833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3629);
    int _3837 = _2727 + _3809;
    bool _3839 = !_3735;
    int _3841 = _3839 ? 0 : (-1);
    int _3843 = _3837 >> 2;
    float _3845 = _3795 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3847 = uint(int(uint(_3831) >> uint(2)));
    uint _3849 = uint(int(uint(int(_3847)) >> uint(2)));
    int _3851 = int(_3847) & 3;
    float _3853 = (*spvDescriptorSet0.vp_c9)._m0[int(_3849)][_3851];
    int _3855 = int(_3847) + 1;
    uint _3857 = uint(int(uint(_3855) >> uint(2)));
    int _3859 = _3855 & 3;
    float _3861 = (*spvDescriptorSet0.vp_c9)._m0[int(_3857)][_3859];
    int _3863 = _3789 >> 2;
    bool _3865 = _2553 != 3;
    float _3867 = fma(_3845, _2941, -0.5);
    int _3869 = _3863 << 4;
    int _3871 = _3869 + 512;
    float _3873 = fma(_3835, _3835, _3811);
    bool _3875 = !_3865;
    int _3877 = _3875 ? 0 : (-1);
    float _3879 = -_3121;
    float _3881 = fma(_3111, _3867, _3879);
    bool _3883 = _2663 != 3;
    uint _3885 = uint(int(uint(_3871) >> uint(2)));
    uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
    int _3889 = int(_3885) & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    int _3893 = int(_3885) + 1;
    uint _3895 = uint(int(uint(_3893) >> uint(2)));
    int _3897 = _3893 & 3;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[int(_3895)][_3897];
    int _3901 = _3843 << 4;
    int _3903 = _3901 + 800;
    float _3905 = _3009 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3907 = ~_3625;
    int _3909 = _3907 + _3677;
    int _3911 = _3909 + 1;
    float _3913 = _1673 * _3717;
    int _3915 = ~_3595;
    int _3917 = _3915 + _3659;
    int _3919 = _3917 + 1;
    float _3921 = _3905 * _3737;
    int _3923 = abs(_2551);
    float _3925 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3927 = int(_3925);
    bool _3929 = !_2463;
    int _3931 = _3929 ? _3685 : (-1);
    int _3933 = _3831 + 8;
    uint _3935 = uint(int(uint(_3933) >> uint(2)));
    uint _3937 = uint(int(uint(int(_3935)) >> uint(2)));
    int _3939 = int(_3935) & 3;
    float _3941 = (*spvDescriptorSet0.vp_c9)._m0[int(_3937)][_3939];
    int _3943 = int(_3935) + 1;
    uint _3945 = uint(int(uint(_3943) >> uint(2)));
    int _3947 = _3943 & 3;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[int(_3945)][_3947];
    bool _3951 = !_2523;
    int _3953 = _3951 ? _3691 : (-1);
    out.m_77.x = _3913;
    out.m_77.y = _3921;
    int _3955 = _3749 ? 0 : 1;
    int _3957 = _1272 * _3919;
    int _3959 = _3957 + _2037;
    int _3961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3963 = _3961 != 0;
    int _3965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3967 = _3965 != 0;
    int _3969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3971 = _3969 != 0;
    int _3973 = _1306 * _3911;
    int _3975 = _3973 + _2227;
    int _3977 = ~_3955;
    int _3979 = _3977 + 1;
    int _3981 = _3979 + 1;
    uint _3983 = uint(int(uint(_3903) >> uint(2)));
    uint _3985 = uint(int(uint(int(_3983)) >> uint(2)));
    int _3987 = int(_3983) & 3;
    float _3989 = (*spvDescriptorSet0.vp_c9)._m0[int(_3985)][_3987];
    int _3991 = int(_3983) + 1;
    uint _3993 = uint(int(uint(_3991) >> uint(2)));
    int _3995 = _3991 & 3;
    float _3997 = (*spvDescriptorSet0.vp_c9)._m0[int(_3993)][_3995];
    int _3999 = _3981;
    if (!_3739)
    {
        int _4001 = ~_3955;
        int _4003 = _4001 + 1;
        _3999 = _4003;
    }
    int _4005 = _3999;
    float _4007 = fma(_3109, _3597, _3119);
    int _4009 = abs(_2643);
    float _4011 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4013 = int(_4011);
    int _4015 = ~_3923;
    int _4017 = _4015 + 1;
    int _4019 = _4017 + 1;
    int _4021 = abs(_2735);
    int _4023 = _3781 + 8;
    uint _4025 = uint(int(uint(_4023) >> uint(2)));
    uint _4027 = uint(int(uint(int(_4025)) >> uint(2)));
    int _4029 = int(_4025) & 3;
    float _4031 = (*spvDescriptorSet0.vp_c9)._m0[int(_4027)][_4029];
    int _4033 = int(_4025) + 1;
    uint _4035 = uint(int(uint(_4033) >> uint(2)));
    int _4037 = _4033 & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = abs(_3715);
    int _4043 = _4019 * as_type<int>(_3827);
    int _4045 = abs(_3727);
    int _4047 = abs(_2793);
    int _4049 = _3871 + 8;
    uint _4051 = uint(int(uint(_4049) >> uint(2)));
    uint _4053 = uint(int(uint(int(_4051)) >> uint(2)));
    int _4055 = int(_4051) & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = int(_4051) + 1;
    uint _4061 = uint(int(uint(_4059) >> uint(2)));
    int _4063 = _4059 & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = ~_4045;
    int _4069 = _4067 + 1;
    int _4071 = _4069 + 1;
    int _4073 = ~_4021;
    int _4075 = _4073 + 1;
    int _4077 = _4075 + 1;
    int _4079 = ~_4041;
    int _4081 = _4079 + 1;
    int _4083 = _4081 + 1;
    int _4085 = _3903 + 8;
    uint _4087 = uint(int(uint(_4085) >> uint(2)));
    uint _4089 = uint(int(uint(int(_4087)) >> uint(2)));
    int _4091 = int(_4087) & 3;
    float _4093 = (*spvDescriptorSet0.vp_c9)._m0[int(_4089)][_4091];
    int _4095 = int(_4087) + 1;
    uint _4097 = uint(int(uint(_4095) >> uint(2)));
    int _4099 = _4095 & 3;
    float _4101 = (*spvDescriptorSet0.vp_c9)._m0[int(_4097)][_4099];
    int _4103 = abs(_3695);
    int _4105 = _4077 * as_type<int>(_3861);
    int _4107 = abs(_2719);
    int _4109 = _4071 * as_type<int>(_3819);
    int _4111 = _4109 + _4043;
    int _4113 = abs(_2573);
    int _4115 = _4083 * as_type<int>(_3853);
    int _4117 = _4115 + _4105;
    int _4119 = abs(_3731);
    int _4121 = ~_4009;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = abs(_2629);
    int _4129 = _4125 * as_type<int>(_3899);
    int _4131 = ~_4107;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    float _4137 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4139 = int(_4137);
    int _4141 = ~_4047;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    int _4147 = ~_4119;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    int _4153 = _4135 * as_type<int>(_3941);
    int _4155 = _4153 + _4117;
    int _4157 = ~_4103;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4145 * as_type<int>(_3997);
    int _4165 = ~_4113;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = _4161 * as_type<int>(_3891);
    int _4173 = _4171 + _4129;
    int _4175 = abs(_3841);
    int _4177 = _4151 * as_type<int>(_3989);
    int _4179 = _4177 + _4163;
    int _4181 = ~_4127;
    int _4183 = _4181 + 1;
    int _4185 = _4183 + 1;
    float _4187 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4189 = int(_4187);
    int _4191 = abs(_2783);
    int _4193 = _4169 * as_type<int>(_4031);
    int _4195 = _4193 + _4111;
    bool _4197 = !_3883;
    int _4199 = _4197 ? 0 : (-1);
    int _4201 = ~_4175;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = ~_4191;
    int _4209 = _4207 + 1;
    int _4211 = _4209 + 1;
    int _4213 = abs(_3877);
    int _4215 = _4185 * as_type<int>(_4057);
    int _4217 = _4215 + _4173;
    int _4219 = abs(_4199);
    int _4221 = _4205 * as_type<int>(_4039);
    int _4223 = _4221 + _4195;
    float _4225 = float(uint(_4013));
    int _4227 = ~_4213;
    int _4229 = _4227 + 1;
    int _4231 = _4229 + 1;
    int _4233 = abs(_3443);
    int _4235 = _4211 * as_type<int>(_4093);
    int _4237 = _4235 + _4179;
    float _4239 = float(uint(_3927));
    float _4241 = 1.0 / _4225;
    int _4243 = ~_4219;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    int _4249 = _4231 * as_type<int>(_4065);
    int _4251 = _4249 + _4217;
    int _4253 = abs(_2653);
    int _4255 = ~_4233;
    int _4257 = _4255 + 1;
    int _4259 = _4257 + 1;
    int _4261 = _4247 * as_type<int>(_3949);
    int _4263 = _4261 + _4155;
    int _4265 = abs(_4013);
    float _4267 = 1.0 / _4239;
    int _4269 = abs(_2669);
    int _4271 = _4259 * as_type<int>(_4101);
    int _4273 = _4271 + _4237;
    int _4275 = ~_4253;
    int _4277 = _4275 + 1;
    int _4279 = _4277 + 1;
    float _4281 = float(uint(_4139));
    float _4283 = float(uint(_4265));
    int _4285 = _4223 * _4279;
    int _4287 = abs(_4139);
    int _4289 = ~_4269;
    int _4291 = _4289 + 1;
    int _4293 = _4291 + 1;
    float _4295 = 1.0 / _4283;
    int _4297 = _3931 * _4253;
    int _4299 = _4297 + _4285;
    int _4301 = abs(_2747);
    int _4303 = _4293 * _4251;
    float _4305 = float(uint(_4189));
    int _4307 = abs(_3927);
    float _4309 = 1.0 / _4281;
    int _4311 = abs(_4189);
    int _4313 = _3953 * _4269;
    int _4315 = _4313 + _4303;
    int _4317 = ~_4301;
    int _4319 = _4317 + 1;
    int _4321 = _4319 + 1;
    bool _4323 = _1272 == 0;
    int _4325 = _4321 * _4263;
    int _4327 = as_type<int>(_4241) + (-2);
    float _4329 = 1.0 / _4305;
    float _4331 = float(uint(_4299));
    float _4333 = float(uint(_4287));
    float _4335 = float(uint(_4307));
    float _4337 = as_type<float>(_4327) * _4331;
    int _4339 = abs(_3583);
    float _4341 = 1.0 / _4333;
    bool _4343 = !_4323;
    int _4345 = _4343 ? _3959 : (-1);
    int _4347 = as_type<int>(_4267) + (-2);
    float _4349 = float(uint(_4315));
    bool _4351 = _1306 == 0;
    float _4353 = 1.0 / _4335;
    int _4355 = ~_4339;
    int _4357 = _4355 + 1;
    int _4359 = _4357 + 1;
    float _4361 = as_type<float>(_4347) * _4349;
    bool _4363 = !_4351;
    int _4365 = _4363 ? _3975 : (-1);
    int _4367 = as_type<int>(_4309) + (-2);
    int _4369 = _4359 * _4273;
    float _4371 = float(uint(_4311));
    float _4373 = trunc(_4337);
    float _4375 = precise::max(_4373, 0.0);
    uint _4377 = uint(_4375);
    int _4379 = _4345 * _4301;
    int _4381 = _4379 + _4325;
    int _4383 = abs(_4299);
    int _4385 = _4365 * _4339;
    int _4387 = _4385 + _4369;
    int _4389 = abs(_4315);
    float _4391 = _4007 + 0.5;
    float _4393 = float(uint(_4381));
    float _4395 = trunc(_4361);
    float _4397 = precise::max(_4395, 0.0);
    uint _4399 = uint(_4397);
    int _4401 = as_type<int>(_4329) + (-2);
    float _4403 = as_type<float>(_4367) * _4393;
    float _4405 = float(uint(_4387));
    int _4407 = as_type<int>(_4295) + (-2);
    float _4409 = 1.0 / _4371;
    float _4411 = float(uint(_4383));
    float _4413 = as_type<float>(_4401) * _4405;
    int _4415 = ~_4013;
    int _4417 = _4415 + 1;
    float _4419 = _3881 + 0.5;
    int _4421 = as_type<int>(_4353) + (-2);
    float _4423 = as_type<float>(_4407) * _4411;
    int _4425 = ~_3927;
    int _4427 = _4425 + 1;
    float _4429 = trunc(_4403);
    float _4431 = precise::max(_4429, 0.0);
    uint _4433 = uint(_4431);
    int _4435 = _4417 * int(_4377);
    int _4437 = _4435 + _4299;
    out.m_79.x = _4391;
    out.m_79.y = _4419;
    int _4439 = abs(_4381);
    int _4441 = as_type<int>(_4341) + (-2);
    float _4443 = float(uint(_4437));
    float _4445 = trunc(_4413);
    float _4447 = precise::max(_4445, 0.0);
    uint _4449 = uint(_4447);
    float _4451 = float(uint(_4389));
    int _4453 = as_type<int>(_4409) + (-2);
    bool _4455 = !_3967;
    int _4457 = _4455 ? 0 : 1;
    float _4459 = as_type<float>(_4421) * _4451;
    int _4461 = _4427 * int(_4399);
    int _4463 = _4461 + _4315;
    bool _4465 = !_3963;
    int _4467 = _4465 ? 0 : 1;
    float _4469 = trunc(_4423);
    float _4471 = precise::max(_4469, 0.0);
    uint _4473 = uint(_4471);
    int _4475 = abs(_4387);
    float _4477 = as_type<float>(_4327) * _4443;
    float _4479 = float(uint(_4463));
    float _4481 = float(uint(_4475));
    float _4483 = in.m_81.x;
    float _4485 = in.m_81.y;
    float _4487 = in.m_81.z;
    float _4489 = float(uint(_4439));
    float _4491 = as_type<float>(_4347) * _4479;
    float _4493 = trunc(_4459);
    float _4495 = precise::max(_4493, 0.0);
    uint _4497 = uint(_4495);
    float _4499 = as_type<float>(_4453) * _4481;
    int _4501 = abs(_4457);
    float _4503 = as_type<float>(_4441) * _4489;
    int _4505 = abs(_4467);
    int _4507 = ~_4189;
    int _4509 = _4507 + 1;
    float _4511 = trunc(_4503);
    float _4513 = precise::max(_4511, 0.0);
    uint _4515 = uint(_4513);
    float _4517 = float(_3231);
    float _4519 = float(_4501);
    int _4521 = _4509 * int(_4449);
    int _4523 = _4521 + _4387;
    int _4525 = ~_4139;
    int _4527 = _4525 + 1;
    int _4529 = ~_4265;
    int _4531 = _4529 + 1;
    float _4533 = _4519 * _4517;
    float _4535 = float(_4005);
    int _4537 = _4527 * int(_4433);
    int _4539 = _4537 + _4381;
    float _4541 = float(_4505);
    float _4543 = trunc(_4499);
    float _4545 = precise::max(_4543, 0.0);
    uint _4547 = uint(_4545);
    float _4549 = float(uint(_4523));
    float _4551 = _4541 * _4535;
    float _4553 = float(uint(_4539));
    int _4555 = _4531 * int(_4473);
    int _4557 = _4555 + _4383;
    int _4559 = ~_4307;
    int _4561 = _4559 + 1;
    float _4563 = _4551 * (-2.0);
    float _4565 = as_type<float>(_4401) * _4549;
    float _4567 = as_type<float>(_4367) * _4553;
    float _4569 = float(uint(_4557));
    int _4571 = _4561 * int(_4497);
    int _4573 = _4571 + _4389;
    int _4575 = ~_4287;
    int _4577 = _4575 + 1;
    float _4579 = trunc(_4477);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    float _4585 = fma(_3699, _4563, _3699);
    float _4587 = fma(_4563, _4483, _4483);
    float _4589 = as_type<float>(_4407) * _4569;
    float _4591 = _1481 + (-0.5);
    float _4593 = float(uint(_4573));
    int _4595 = _4577 * int(_4515);
    int _4597 = _4595 + _4439;
    int _4599 = ~_3927;
    int _4601 = _4599 + 1;
    float _4603 = trunc(_4565);
    float _4605 = precise::max(_4603, 0.0);
    uint _4607 = uint(_4605);
    int _4609 = ~_4311;
    int _4611 = _4609 + 1;
    float _4613 = fma(_4591, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4587);
    float _4615 = as_type<float>(_4421) * _4593;
    float _4617 = float(uint(_4597));
    float _4619 = fma(_4585, _3137, _4613);
    float _4621 = trunc(_4567);
    float _4623 = precise::max(_4621, 0.0);
    uint _4625 = uint(_4623);
    float _4627 = as_type<float>(_4441) * _4617;
    int _4629 = int(_4377) + int(_4583);
    int _4631 = _4611 * int(_4547);
    int _4633 = _4631 + _4475;
    int _4635 = ~_4013;
    int _4637 = _4635 + 1;
    int _4639 = ~_4189;
    int _4641 = _4639 + 1;
    float _4643 = trunc(_4491);
    float _4645 = precise::max(_4643, 0.0);
    uint _4647 = uint(_4645);
    int _4649 = int(_4449) + int(_4607);
    int _4651 = _4637 * _4629;
    int _4653 = _4651 + _4299;
    float _4655 = float(uint(_4633));
    bool _4657 = _4189 == 0;
    bool _4659 = uint(_4653) >= uint(_4013);
    float _4661 = trunc(_4615);
    float _4663 = precise::max(_4661, 0.0);
    uint _4665 = uint(_4663);
    int _4667 = int(_4433) + int(_4625);
    float _4669 = as_type<float>(_4453) * _4655;
    bool _4671 = !_3971;
    int _4673 = _4671 ? 0 : 1;
    float _4675 = trunc(_4589);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    int _4681 = ~_4139;
    int _4683 = _4681 + 1;
    int _4685 = int(_4399) + int(_4647);
    int _4687 = _4683 * _4667;
    int _4689 = _4687 + _4381;
    float _4691 = trunc(_4627);
    float _4693 = precise::max(_4691, 0.0);
    uint _4695 = uint(_4693);
    int _4697 = int(_4497) + int(_4665);
    int _4699 = _4601 * _4685;
    int _4701 = _4699 + _4315;
    int _4703 = ~_4265;
    int _4705 = _4703 + 1;
    int _4707 = _4641 * _4649;
    int _4709 = _4707 + _4387;
    bool _4711 = uint(_4689) >= uint(_4139);
    int _4713 = ~_4307;
    int _4715 = _4713 + 1;
    float _4717 = trunc(_4669);
    float _4719 = precise::max(_4717, 0.0);
    uint _4721 = uint(_4719);
    int _4723 = int(_4473) + int(_4679);
    int _4725 = ~_4287;
    int _4727 = _4725 + 1;
    int _4729 = _4715 * _4697;
    int _4731 = _4729 + _4389;
    bool _4733 = uint(_4701) >= uint(_3927);
    int _4735 = _4705 * _4723;
    int _4737 = _4735 + _4383;
    bool _4739 = uint(_4709) >= uint(_4189);
    float _4741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4743 = int(_4515) + int(_4695);
    int _4745 = ~_4311;
    int _4747 = _4745 + 1;
    int _4749 = _4727 * _4743;
    int _4751 = _4749 + _4439;
    bool _4753 = !_4659;
    int _4755 = _4753 ? 0 : (-1);
    bool _4757 = uint(_4737) >= uint(_4265);
    bool _4759 = !_4733;
    int _4761 = _4759 ? 0 : (-1);
    bool _4763 = uint(_4731) >= uint(_4307);
    bool _4765 = !_4711;
    int _4767 = _4765 ? 0 : (-1);
    float _4769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4771 = uint(_4751) >= uint(_4287);
    bool _4773 = !_4739;
    int _4775 = _4773 ? 0 : (-1);
    int _4777 = ~_4629;
    int _4779 = _4777 + _4755;
    int _4781 = _4779 + 1;
    int _4783 = int(_4547) + int(_4721);
    int _4785 = ~_4685;
    int _4787 = _4785 + _4761;
    int _4789 = _4787 + 1;
    int _4791 = _4013 * _4781;
    int _4793 = _4791 + _4299;
    int _4795 = ~_4649;
    int _4797 = _4795 + _4775;
    int _4799 = _4797 + 1;
    float _4801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4803 = ~_4667;
    int _4805 = _4803 + _4767;
    int _4807 = _4805 + 1;
    int _4809 = _4747 * _4783;
    int _4811 = _4809 + _4475;
    bool _4813 = !_4757;
    int _4815 = _4813 ? 0 : (-1);
    int _4817 = _3927 * _4789;
    int _4819 = _4817 + _4315;
    bool _4821 = _4013 == 0;
    int _4823 = _4139 * _4807;
    int _4825 = _4823 + _4381;
    int _4827 = _4299 ^ _4013;
    float _4829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4831 = !_4771;
    int _4833 = _4831 ? 0 : (-1);
    int _4835 = _4189 * _4799;
    int _4837 = _4835 + _4387;
    bool _4839 = _3927 == 0;
    bool _4841 = !_4821;
    int _4843 = _4841 ? _4793 : (-1);
    bool _4845 = _4139 == 0;
    float _4847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4849 = uint(int(uint(_4827) >> uint(31)));
    bool _4851 = uint(_4811) >= uint(_4311);
    bool _4853 = !_4839;
    int _4855 = _4853 ? _4819 : (-1);
    float _4857 = _4741 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4859 = !_4845;
    int _4861 = _4859 ? _4825 : (-1);
    int _4863 = ~_4815;
    int _4865 = _4723 + _4863;
    int _4867 = _4865 + 1;
    float _4869 = fma(_4857, _1679, -0.5);
    float _4871 = float(_4843);
    float _4873 = _4829 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4875 = ~int(_4849);
    int _4877 = _4875 + 1;
    bool _4879 = !_4657;
    int _4881 = _4879 ? _4837 : (-1);
    float _4883 = fma(_4857, _4871, _3107);
    int _4885 = _4315 ^ _3927;
    float _4887 = _4801 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4889 = _4139 == 0;
    float _4891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4893 = _4381 ^ _4139;
    float _4895 = _4769 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4897 = _4387 ^ _4189;
    float _4899 = fma(_4887, _2447, -0.5);
    float _4901 = float(_4855);
    float _4903 = fma(_4895, _1773, -0.5);
    int _4905 = _4867 ^ _4877;
    float _4907 = fma(_4873, _1609, -0.5);
    float _4909 = float(_4881);
    float _4911 = fma(_4895, _4901, _3125);
    bool _4913 = !_4763;
    int _4915 = _4913 ? 0 : (-1);
    float _4917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4919 = !_4851;
    int _4921 = _4919 ? 0 : (-1);
    float _4923 = fma(_4887, _4909, _3091);
    uint _4925 = uint(int(uint(_4885) >> uint(31)));
    float _4927 = fma(_3113, _4903, _4911);
    uint _4929 = uint(int(uint(_4893) >> uint(31)));
    float _4931 = fma(_3085, _4869, _4883);
    uint _4933 = uint(int(uint(_4897) >> uint(31)));
    float _4935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4937 = _4013 == 0;
    float _4939 = fma(_3101, _4899, _4923);
    int _4941 = ~_4877;
    int _4943 = _4941 + _4905;
    int _4945 = _4943 + 1;
    bool _4947 = _4189 == 0;
    int _4949 = ~_4915;
    int _4951 = _4697 + _4949;
    int _4953 = _4951 + 1;
    int _4955 = ~_4833;
    int _4957 = _4743 + _4955;
    int _4959 = _4957 + 1;
    int _4961 = ~_4921;
    int _4963 = _4783 + _4961;
    int _4965 = _4963 + 1;
    int _4967 = ~int(_4925);
    int _4969 = _4967 + 1;
    int _4971 = ~int(_4929);
    int _4973 = _4971 + 1;
    float _4975 = _4935 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4977 = ~int(_4933);
    int _4979 = _4977 + 1;
    float _4981 = float(_4861);
    float _4983 = fma(_4975, _2825, -0.5);
    bool _4985 = !_4937;
    int _4987 = _4985 ? _4945 : (-1);
    int _4989 = _4953 ^ _4969;
    float _4991 = fma(_4873, _4981, _3131);
    int _4993 = _4959 ^ _4973;
    float _4995 = _4847 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4997 = _4965 ^ _4979;
    float _4999 = _4891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5001 = float(_4987);
    float _5003 = fma(_4995, _2729, -0.5);
    bool _5005 = _3927 == 0;
    float _5007 = _4917 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5009 = ~_4969;
    int _5011 = _5009 + _4989;
    int _5013 = _5011 + 1;
    float _5015 = -_3095;
    float _5017 = fma(_4995, _5001, _5015);
    int _5019 = ~_4973;
    int _5021 = _5019 + _4993;
    int _5023 = _5021 + 1;
    float _5025 = fma(_4999, _2813, -0.5);
    int _5027 = ~_4979;
    int _5029 = _5027 + _4997;
    int _5031 = _5029 + 1;
    float _5033 = fma(_3099, _4907, _4991);
    bool _5035 = !_5005;
    int _5037 = _5035 ? _5013 : (-1);
    float _5039 = fma(_3061, _5003, _5017);
    bool _5041 = !_4889;
    int _5043 = _5041 ? _5023 : (-1);
    float _5045 = _5033 + 0.5;
    bool _5047 = !_4947;
    int _5049 = _5047 ? _5031 : (-1);
    float _5051 = float(_5037);
    float _5053 = float(_5043);
    float _5055 = fma(_5007, _2827, -0.5);
    float _5057 = float(_5049);
    float _5059 = -_3127;
    float _5061 = fma(_4999, _5051, _5059);
    float _5063 = _4533 * (-2.0);
    float _5065 = -_3133;
    float _5067 = fma(_5007, _5053, _5065);
    float _5069 = _4939 + 0.5;
    float _5071 = -_3093;
    float _5073 = fma(_4975, _5057, _5071);
    float _5075 = fma(_3115, _5025, _5061);
    float _5077 = fma(_3097, _5055, _5067);
    float _5079 = _4931 + 0.5;
    float _5081 = fma(_3103, _4983, _5073);
    float _5083 = _4927 + 0.5;
    float _5085 = _5039 + 0.5;
    float _5087 = _5075 + 0.5;
    float _5089 = _5077 + 0.5;
    float _5091 = _5081 + 0.5;
    float _5093 = fma(_3751, _5063, _3751);
    float _5095 = fma(_5063, _4485, _4485);
    out.m_83.x = _5079;
    out.m_83.y = _5085;
    out.m_83.z = _5083;
    out.m_83.w = _5087;
    out.m_85.x = _5045;
    out.m_85.y = _5089;
    out.m_87.x = _5069;
    out.m_87.y = _5091;
    int _5097 = as_type<int>(_5083);
    if (_3681)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5099 = -_3783;
    float _5101 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3515);
    float _5103 = -_3787;
    float _5105 = fma(_5103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3499);
    float _5107 = -_3807;
    float _5109 = fma(_5107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3537);
    int _5111 = abs(_4673);
    float _5113 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5115 = _5101 + _5113;
    float _5117 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5119 = _5105 + _5117;
    float _5121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5123 = _5109 + _5121;
    float _5125 = float(_3545);
    float _5127 = _5115 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5129 = float(_5111);
    float _5131 = _1481 + _1493;
    float _5133 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5095);
    float _5135 = fma(_5119, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5127);
    float _5137 = _1493 + (-0.5);
    float _5139 = _5129 * _5125;
    float _5141 = _5131 + (-1.0);
    float _5143 = fma(_5123, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5135);
    float _5145 = fma(_5093, _3137, _5133);
    float _5147 = _5139 * (-2.0);
    float _5149 = _4619 * 0.15915493667125701904296875;
    float _5151 = sqrt(_3873);
    bool _5153 = _5143 >= 0.0;
    float _5155 = fma(_5147, _4487, _4487);
    float _5157 = _5145 * 0.15915493667125701904296875;
    float _5159 = fma(_5137, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5155);
    float _5161 = fma(_5141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5163 = _5149 * 6.283185482025146484375;
    float _5165 = sin(_5163);
    float _5167 = fma(_5161, _5147, _5161);
    float _5169 = _5139;
    float _5171 = _5105;
    float _5173 = _5123;
    if (_5153)
    {
        _5169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5175 = _5169;
    if (_5153)
    {
        out.m_51.x = 0.0;
    }
    float _5177 = fma(_5167, _3137, _5159);
    float _5179 = _5157 * 6.283185482025146484375;
    float _5181 = sin(_5179);
    if (_5153)
    {
        float _5183 = _5175 * 5.0;
        _5097 = as_type<int>(_5183);
    }
    int _5185 = _5097;
    float _5187 = _5177 * 0.15915493667125701904296875;
    if (_5153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14330 = as_type<float>(_5185);
        out.gl_Position.z = _14330;
    }
    float _5189 = _5149 * 6.283185482025146484375;
    float _5191 = cos(_5189);
    float _5193 = _5157 * 6.283185482025146484375;
    float _5195 = cos(_5193);
    float _5197 = _5165 * _5181;
    float _5199 = _5187 * 6.283185482025146484375;
    float _5201 = sin(_5199);
    if (_5153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5203 = -_3515;
    float _5205 = _5203 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5207 = -_3499;
    float _5209 = _5207 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5211 = in.m_89.x;
    float _5213 = in.m_89.y;
    float _5215 = in.m_89.z;
    float _5217 = -_3537;
    float _5219 = _5217 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5221 = _5205 * _5205;
    float _5223 = _5187 * 6.283185482025146484375;
    float _5225 = cos(_5223);
    float _5227 = _5191 * _5195;
    float _5229 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5231 = fma(_5209, _5209, _5221);
    float _5233 = fma(_5201, _5227, _5197);
    float _5235 = fma(_5201, _5197, _5227);
    float _5237 = fma(_5219, _5219, _5231);
    float _5239 = _3757 * _5151;
    float _5241 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5243 = _5191 * _5181;
    float _5245 = rsqrt(_5237);
    float _5247 = _5165 * _5195;
    float _5249 = _5191 * _5225;
    float _5251 = _5195 * _5225;
    float _5253 = _5165 * _5225;
    float _5255 = _5181 * _5225;
    float _5257 = _5239 * _5241;
    float _5259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5211);
    float _5261 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5263 = _5239 * _5229;
    float _5265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5213);
    float _5267 = _5259 * _5257;
    float _5269 = -_5243;
    float _5271 = fma(_5201, _5247, _5269);
    float _5273 = _5209 * _5245;
    float _5275 = -_5247;
    float _5277 = fma(_5201, _5243, _5275);
    float _5279 = _5239 * _5261;
    float _5281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5215);
    float _5283 = _5219 * _5245;
    float _5285 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5287 = _5273 * _5285;
    float _5289 = _5265 * _5263;
    float _5291 = _5281 * _5279;
    float _5293 = in.m_91.x;
    float _5295 = in.m_91.y;
    float _5297 = in.m_91.z;
    float _5299 = _5205 * _5245;
    float _5301 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5303 = _5283 * _5301;
    float _5305 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5307 = -_5287;
    float _5309 = fma(_5283, _5305, _5307);
    bool _5311 = _5213 != 0.0;
    bool _5313 = isnan(_5213);
    bool _5315 = _5311 || _5313;
    bool _5317 = isnan(0.0);
    bool _5319 = _5315 || _5317;
    float _5321 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5323 = _5299 * _5321;
    float _5325 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5327 = -_5303;
    float _5329 = fma(_5299, _5325, _5327);
    float _5331 = _5309 * _5309;
    bool _5333 = _5211 == 0.0;
    bool _5335 = !_5319;
    bool _5337 = _5333 && _5335;
    float _5339 = in.m_93.x;
    float _5341 = in.m_93.y;
    float _5343 = in.m_93.z;
    float _5345 = in.m_93.w;
    float _5347 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5349 = -_5323;
    float _5351 = fma(_5273, _5347, _5349);
    float _5353 = fma(_5329, _5329, _5331);
    bool _5355 = _5215 == 0.0;
    bool _5357 = _5355 && _5337;
    float _5359 = -_5289;
    float _5361 = _5201 * _5359;
    float _5363 = _5249 * _5289;
    float _5365 = fma(_5351, _5351, _5353);
    float _5367 = _5253 * _5289;
    float _5369 = fma(_5251, _5267, _5361);
    float _5371 = fma(_5233, _5267, _5363);
    float _5373 = fma(_5271, _5267, _5367);
    float _5375 = rsqrt(_5365);
    float _5377 = fma(_5255, _5291, _5369);
    float _5379 = fma(_5277, _5291, _5371);
    float _5381 = fma(_5235, _5291, _5373);
    float _5383 = _5267;
    float _5385 = _5361;
    float _5387 = _5363;
    float _5389 = _5209;
    float _5391 = _5293;
    float _5393 = _5235;
    if (_5357)
    {
        _5383 = _5293;
    }
    float _5395 = _5383;
    float _5397 = _5395;
    if (_5357)
    {
        _5385 = _5297;
    }
    float _5399 = _5385;
    float _5401 = _5399;
    if (_5357)
    {
        _5387 = _5395;
    }
    float _5403 = _5387;
    float _5405 = _5403;
    if (!_5357)
    {
        _5397 = _5293;
    }
    float _5407 = _5397;
    if (_5357)
    {
        _5389 = _5295;
    }
    float _5409 = _5389;
    float _5411 = _5409;
    if (!_5357)
    {
        float _5413 = fma(_5213, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5295);
        _5411 = _5413;
    }
    float _5415 = _5411;
    if (_5357)
    {
        _5391 = _5399;
    }
    float _5417 = _5391;
    float _5419 = _5343 * _5407;
    float _5421 = _5417;
    if (!_5357)
    {
        _5401 = _5297;
    }
    float _5423 = _5401;
    float _5425 = _5329 * _5375;
    float _5427 = _5309 * _5375;
    if (!_5357)
    {
        float _5429 = fma(_5211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5407);
        _5405 = _5429;
    }
    float _5431 = _5405;
    float _5433 = _5339 * _5295;
    float _5435 = -_5419;
    float _5437 = fma(_5339, _5423, _5435);
    float _5439 = _5341 * _5423;
    float _5441 = _5351 * _5375;
    float _5443 = _5283 * _5427;
    float _5445 = _5299 * _5425;
    if (!_5357)
    {
        float _5447 = fma(_5215, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5423);
        _5421 = _5447;
    }
    float _5449 = _5421;
    float _5451 = -_5439;
    float _5453 = fma(_5343, _5295, _5451);
    float _5455 = -_5433;
    float _5457 = fma(_5341, _5407, _5455);
    float _5459 = -_5443;
    float _5461 = fma(_5299, _5441, _5459);
    float _5463 = -_5445;
    float _5465 = fma(_5273, _5427, _5463);
    float _5467 = _5437 * _5345;
    float _5469 = _5453 * _5345;
    float _5471 = _5461 * _5379;
    float _5473 = _5465 * _5379;
    float _5475 = _5457 * _5345;
    float _5477 = _5273 * _5441;
    float _5479 = fma(_5425, _5377, _5471);
    float _5481 = fma(_5441, _5377, _5473);
    float _5483 = _5233 * _5461;
    float _5485 = -_5477;
    float _5487 = fma(_5283, _5425, _5485);
    float _5489 = fma(_5273, _5381, _5479);
    float _5491 = fma(_5283, _5381, _5481);
    float _5493 = _5233 * _5465;
    float _5495 = _5233 * _5487;
    float _5497 = _3499 + _5489;
    float _5499 = _3537 + _5491;
    float _5501 = _5487 * _5379;
    float _5503 = fma(_5251, _5427, _5495);
    float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5507 = _5497 + _5505;
    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5511 = _5499 + _5509;
    float _5513 = _5249 * _5461;
    float _5515 = _5249 * _5487;
    float _5517 = _5507 * _5507;
    float _5519 = _5511 * _5511;
    float _5521 = _5249 * _5465;
    float _5523 = _5277 * _5461;
    float _5525 = _5277 * _5465;
    float _5527 = _5517 + _5519;
    float _5529 = _5277 * _5487;
    float _5531 = fma(_5255, _5425, _5523);
    float _5533 = -_5201;
    float _5535 = fma(_5533, _5427, _5515);
    float _5537 = sqrt(_5527);
    float _5539 = fma(_5255, _5427, _5529);
    float _5541 = fma(_5427, _5377, _5501);
    float _5543 = -_5201;
    float _5545 = fma(_5543, _5425, _5513);
    float _5547 = -_5201;
    float _5549 = fma(_5547, _5441, _5521);
    float _5551 = fma(_5251, _5425, _5483);
    float _5553 = fma(_5299, _5381, _5541);
    float _5555 = fma(_5251, _5441, _5493);
    float _5557 = fma(_5255, _5441, _5525);
    float _5559 = fma(_5253, _5273, _5545);
    float _5561 = fma(_5253, _5299, _5535);
    float _5563 = fma(_5253, _5283, _5549);
    float _5565 = _3515 + _5553;
    float _5567 = fma(_5271, _5273, _5551);
    float _5569 = fma(_5271, _5299, _5503);
    float _5571 = fma(_5271, _5283, _5555);
    bool _5573 = _5537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5575 = fma(_5235, _5283, _5557);
    float _5577 = _5559 * _5341;
    float _5579 = _5561 * _5341;
    float _5581 = _5563 * _5341;
    float _5583 = _5561 * _5415;
    float _5585 = fma(_5235, _5273, _5531);
    float _5587 = fma(_5235, _5299, _5539);
    float _5589 = _5559 * _5415;
    float _5591 = _5467 * _5559;
    float _5593 = _5467 * _5561;
    float _5595 = _5467 * _5563;
    float _5597 = _5563 * _5415;
    float _5599 = _5503;
    float _5601 = _5559;
    float _5603 = _5531;
    float _5605 = _5467;
    float _5607 = _5475;
    if (!_5573)
    {
        _5599 = _5519;
    }
    float _5609 = _5599;
    float _5611 = _5609;
    if (!_5573)
    {
        _5601 = _5517;
    }
    float _5613 = _5601;
    float _5615 = _5613;
    if (!_5573)
    {
        _5393 = _5497;
    }
    float _5617 = _5393;
    float _5619 = _5617;
    if (!_5573)
    {
        _5603 = _5499;
    }
    float _5621 = _5603;
    float _5623 = _5621;
    if (!_5573)
    {
        _5605 = _5565;
    }
    float _5625 = _5605;
    bool _5627 = !_5573;
    float _5629 = _5625;
    if (!_5627)
    {
        float _5631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5635 = _5537 + _5633;
        float _5637 = rsqrt(_5527);
        float _5639 = _5635 * _5631;
        float _5641 = _5565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5643 = _5639 * 0.15915493667125701904296875;
        float _5645 = _5643 * 6.283185482025146484375;
        float _5647 = sin(_5645);
        float _5649 = _5643 * 6.283185482025146484375;
        float _5651 = cos(_5649);
        float _5653 = fma(_5647, _5641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5655 = _5637 * _5653;
        float _5657 = _5651 + (-1.0);
        float _5659 = fma(_5507, _5655, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5661 = fma(_5511, _5655, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5663 = _5657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5665 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5667 = _5659 + _5665;
        float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5671 = _5661 + _5669;
        float _5673 = fma(_5565, _5651, _5663);
        float _5675 = _5667 * _5667;
        float _5677 = _5671 * _5671;
        _5629 = _5673;
        _5615 = _5675;
        _5611 = _5677;
        _5619 = _5659;
        _5623 = _5661;
    }
    float _5679 = _5629;
    float _5681 = _5615;
    float _5683 = _5611;
    float _5685 = _5619;
    float _5687 = _5623;
    float _5689 = fma(_5567, _5339, _5577);
    float _5691 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5693 = _5679 + _5691;
    float _5695 = fma(_5567, _5431, _5589);
    float _5697 = fma(_5571, _5431, _5597);
    float _5699 = fma(_5569, _5339, _5579);
    float _5701 = fma(_5693, _5693, _5681);
    float _5703 = fma(_5569, _5431, _5583);
    float _5705 = fma(_5469, _5569, _5593);
    float _5707 = fma(_5571, _5339, _5581);
    float _5709 = _5701 + _5683;
    float _5711 = fma(_5469, _5567, _5591);
    float _5713 = fma(_5469, _5571, _5595);
    float _5715 = fma(_5585, _5343, _5689);
    float _5717 = fma(_5587, _5343, _5699);
    float _5719 = fma(_5587, _5449, _5703);
    float _5721 = sqrt(_5709);
    float _5723 = fma(_5575, _5343, _5707);
    float _5725 = fma(_5585, _5449, _5695);
    float _5727 = fma(_5475, _5585, _5711);
    float _5729 = fma(_5475, _5587, _5705);
    float _5731 = fma(_5475, _5575, _5713);
    float _5733 = fma(_5575, _5449, _5697);
    out.m_95.x = _5715;
    out.m_95.y = _5717;
    out.m_95.z = _5723;
    out.m_97.x = _5727;
    out.m_97.y = _5729;
    out.m_97.z = _5731;
    out.m_99.x = _5725;
    out.m_99.y = _5719;
    out.m_99.z = _5733;
    bool _5735 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5737 = isnan(_5721);
    bool _5739 = _5735 || _5737;
    bool _5741 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5743 = _5739 || _5741;
    float _5745 = _5695;
    if (!_5743)
    {
        _5607 = 1.0;
    }
    float _5747 = _5607;
    bool _5749 = !_5743;
    float _5751 = _5747;
    if (!_5749)
    {
        bool _5753 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5755 = isnan(_5721);
        bool _5757 = _5753 || _5755;
        bool _5759 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5761 = _5757 || _5759;
        if (!_5761)
        {
            float _5763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5765 = _5721 + _5763;
            float _5767 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5769 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5767;
            float _5771 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5773 = _5771 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5775 = 1.0 / _5769;
            float _5777 = _5765 * _5775;
            float _5779 = fma(_5777, _5773, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5751 = _5779;
            _5781 = true;
        }
        else
        {
            bool _5783 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5785 = isnan(_5721);
            bool _5787 = _5783 || _5785;
            bool _5789 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5791 = _5787 || _5789;
            if (!_5791)
            {
                float _5793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5795 = _5721 + _5793;
                float _5797 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5799 = _5797 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5801 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5803 = _5801 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5805 = 1.0 / _5799;
                float _5807 = _5795 * _5805;
                float _5809 = fma(_5807, _5803, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5751 = _5809;
                _5781 = true;
            }
            else
            {
                _5751 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5781 = false;
    float _5811 = _5751;
    float _5813 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5815 = _5679 + _5813;
    float _5817 = _5101 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5819 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5821 = _5685 + _5819;
    float _5823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5825 = _5687 + _5823;
    float _5827 = fma(_5815, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5829 = fma(_5105, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5817);
    float _5831 = fma(_5821, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5833 = fma(_5825, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5835 = -_3515;
    float _5837 = _5835 + _5827;
    float _5839 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5829);
    float _5841 = -_3499;
    float _5843 = _5841 + _5831;
    float _5845 = _5101 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5847 = _5837 * _5837;
    float _5849 = _5839 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5851 = -_3537;
    float _5853 = _5851 + _5833;
    float _5855 = fma(_5105, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5845);
    float _5857 = fma(_5843, _5843, _5847);
    float _5859 = 1.0 / _5849;
    float _5861 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5855);
    float _5863 = fma(_5853, _5853, _5857);
    float _5865 = _5861 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5867 = sqrt(_5863);
    float _5869 = _5865 + _5849;
    float _5871 = _5869 * _5859;
    float _5873 = _5871 * 0.5;
    float _5875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5877 = fma(_5873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5875);
    bool _5879 = _5867 > 0.0;
    float _5881 = 1.0 / _5877;
    bool _5883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5887 = _5883 || _5885;
    bool _5889 = isnan(0.5);
    bool _5891 = _5887 || _5889;
    bool _5893 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5895 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5897 = _5893 || _5895;
    bool _5899 = isnan(0.5);
    bool _5901 = _5897 || _5899;
    float _5903 = _5873;
    float _5905 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5907 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5909 = _5831;
    if (!_5879)
    {
        _5903 = _5831;
    }
    float _5911 = _5903;
    float _5913 = _5911;
    float _5915 = _5911;
    if (!_5879)
    {
        _5905 = _5827;
    }
    float _5917 = _5905;
    float _5919 = _5917;
    if (!_5879)
    {
        _5907 = _5833;
    }
    float _5921 = _5907;
    bool _5923 = !_5879;
    float _5925 = _5921;
    float _5927 = _5881;
    if (!_5923)
    {
        float _5929 = _226 * _226;
        float _5931 = fma(_222, _222, _5929);
        float _5933 = fma(_228, _228, _5931);
        float _5935 = rsqrt(_5863);
        float _5937 = sqrt(_5933);
        float _5939 = _5843 * _5935;
        float _5941 = _5837 * _5935;
        float _5943 = _5853 * _5935;
        bool _5945 = _5937 > 0.0;
        float _5947 = _5937;
        float _5949 = _5935;
        if (!_5945)
        {
            _5913 = _5831;
        }
        float _5951 = _5913;
        _5915 = _5951;
        if (!_5945)
        {
            _5947 = _5827;
        }
        float _5953 = _5947;
        _5919 = _5953;
        if (!_5945)
        {
            _5949 = _5833;
        }
        float _5955 = _5949;
        bool _5957 = !_5945;
        _5925 = _5955;
        if (!_5957)
        {
            float _5959 = rsqrt(_5933);
            float _5961 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5963 = _226 * _5959;
            float _5965 = _222 * _5959;
            float _5967 = _228 * _5959;
            float _5969 = _5941 * _5963;
            float _5971 = fma(_5939, _5965, _5969);
            float _5973 = _5961 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5975 = fma(_5943, _5967, _5971);
            float _5977 = _5975 * _5973;
            float _5979 = fma(_222, _5977, _5831);
            float _5981 = fma(_226, _5977, _5827);
            float _5983 = fma(_228, _5977, _5833);
            _5915 = _5979;
            _5919 = _5981;
            _5925 = _5983;
        }
    }
    float _5985 = _5915;
    float _5987 = _5919;
    float _5989 = _5925;
    float _5991 = -_3787;
    float _5993 = fma(_5991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5985);
    float _5995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5997 = _5881 * _5995;
    float _5999 = -_3783;
    float _6001 = fma(_5999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5987);
    float _6003 = -_3807;
    float _6005 = fma(_6003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5989);
    float _6007 = _6001;
    float _6009 = _6005;
    if (_5891)
    {
        _5909 = 1.0;
    }
    float _6011 = _5909;
    float _6013 = _6011;
    if (_5901)
    {
        _5927 = _5993;
    }
    float _6015 = _5927;
    float _6017 = _6015;
    if (!_5901)
    {
        float _6019 = _5115 * _5115;
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6023 = -_3537;
        float _6025 = _6023 + _5989;
        float _6027 = -_3499;
        float _6029 = _6027 + _5985;
        float _6031 = fma(_5119, _5119, _6019);
        float _6033 = fma(_5123, _5123, _6031);
        float _6035 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6037 = sqrt(_6033);
        float _6039 = 1.0 / _5239;
        float _6041 = _6035 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6043 = precise::min(_6037, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6045 = _6043 * _6021;
        float _6047 = -_3515;
        float _6049 = _6047 + _5987;
        float _6051 = _6045 * _6039;
        float _6053 = _6041 * _6051;
        float _6055 = _6025 * _6051;
        float _6057 = fma(_6049, _6053, _5101);
        float _6059 = fma(_6029, _6053, _5105);
        float _6061 = fma(_6041, _6055, _5109);
        _6007 = _6057;
        _6017 = _6059;
        _6009 = _6061;
    }
    float _6063 = _6007;
    float _6065 = _6017;
    float _6067 = _6009;
    if (!_5891)
    {
        float _6069 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6071 = _6069 * 0.15915493667125701904296875;
        float _6073 = _6071 * 6.283185482025146484375;
        float _6075 = cos(_6073);
        float _6077 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6079 = _6077 * 0.15915493667125701904296875;
        float _6081 = _6071 * 6.283185482025146484375;
        float _6083 = sin(_6081);
        float _6085 = 1.0 / _6075;
        float _6087 = _6079 * 6.283185482025146484375;
        float _6089 = cos(_6087);
        float _6091 = _6083 * _6085;
        float _6093 = _6079 * 6.283185482025146484375;
        float _6095 = sin(_6093);
        float _6097 = _6089 * _6091;
        float _6099 = 1.0 / _6097;
        float _6101 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6103 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6101;
        float _6105 = 1.0 / _6103;
        float _6107 = _6095 * _6099;
        float _6109 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6111 = fma(_5997, _6107, _6109);
        float _6113 = _6111 * _6105;
        float _6115 = precise::clamp(_6113, 0.0, 1.0);
        _6013 = _6115;
    }
    float _6117 = _6013;
    float _6119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6121 = _6063 + _6119;
    float _6123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6125 = _6065 + _6123;
    float _6127 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6129 = _6067 + _6127;
    float _6131 = _6121 * _6121;
    float _6133 = fma(_6125, _6125, _6131);
    float _6135 = fma(_5105, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6137 = fma(_6129, _6129, _6133);
    float _6139 = rsqrt(_6137);
    float _6141 = sqrt(_6137);
    float _6143 = _6139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6145 = _6125 * _6143;
    float _6147 = _6129 * _6143;
    float _6149 = _6145 * _6145;
    float _6151 = _6147 * _6147;
    float _6153 = _6149 + _6151;
    float _6155 = sqrt(_6153);
    bool _6157 = _6155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6161 = _6155 + _6159;
    float _6163 = _6139;
    float _6165 = _6153;
    float _6167 = _6161;
    float _6169 = _6121;
    if (_6157)
    {
        float _6171 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6163 = _6171;
    }
    float _6173 = _6163;
    if (!_6157)
    {
        _5171 = _6149;
    }
    float _6175 = _5171;
    float _6177 = _6175;
    if (_6157)
    {
        float _6179 = rsqrt(_6153);
        _6165 = _6179;
    }
    float _6181 = _6165;
    float _6183 = _6181;
    if (_6157)
    {
        float _6185 = _6161 * _6173;
        _6167 = _6185;
    }
    float _6187 = _6167;
    float _6189 = floor(_6135);
    if (_6157)
    {
        float _6191 = _6187 * 0.15915493667125701904296875;
        _5173 = _6191;
    }
    float _6193 = _5173;
    float _6195 = _6129;
    if (_6157)
    {
        float _6197 = _6193 * 6.283185482025146484375;
        float _6199 = sin(_6197);
        _6195 = _6199;
    }
    float _6201 = _6195;
    float _6203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6205 = precise::max(0.0, _6203);
    float _6207 = _6173;
    float _6209 = _6205;
    if (_6157)
    {
        float _6211 = _6193 * 6.283185482025146484375;
        float _6213 = cos(_6211);
        _6207 = _6213;
    }
    float _6215 = _6207;
    float _6217 = -_6189;
    float _6219 = _6135 + _6217;
    float _6221 = -_6143;
    float _6223 = -_6205;
    float _6225 = fma(_6121, _6221, _6223);
    if (_6157)
    {
        float _6227 = _6225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6169 = _6227;
    }
    float _6229 = _6169;
    float _6231 = _6229;
    float _6233 = _6201;
    if (_6157)
    {
        float _6235 = fma(_6201, _6229, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6231 = _6235;
    }
    float _6237 = _6231;
    float _6239 = _6237;
    if (!_6157)
    {
        _6233 = _6145;
    }
    float _6241 = _6233;
    float _6243 = _6241;
    if (_6157)
    {
        float _6245 = _6181 * _6237;
        _5745 = _6245;
    }
    float _6247 = _5745;
    float _6249 = _6215;
    if (_6157)
    {
        float _6251 = _6215 + (-1.0);
        _6209 = _6251;
    }
    float _6253 = _6209;
    float _6255 = _6253;
    if (!_6157)
    {
        _6239 = _6225;
    }
    float _6257 = _6239;
    float _6259 = _6257;
    if (_6157)
    {
        float _6261 = _6145 * _6247;
        _6243 = _6261;
    }
    float _6263 = _6243;
    if (_6157)
    {
        float _6265 = _6253 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6183 = _6265;
    }
    float _6267 = _6183;
    if (!_6157)
    {
        _6255 = _6147;
    }
    float _6269 = _6255;
    float _6271 = _6269;
    if (_6157)
    {
        float _6273 = _6147 * _6247;
        _6271 = _6273;
    }
    float _6275 = _6271;
    if (_6157)
    {
        float _6277 = _6263 * _6263;
        _6177 = _6277;
    }
    float _6279 = _6177;
    if (_6157)
    {
        float _6281 = fma(_6225, _6215, _6267);
        _6259 = _6281;
    }
    float _6283 = _6259;
    if (!_6157)
    {
        _6249 = _6151;
    }
    float _6285 = _6249;
    float _6287 = _6285;
    if (_6157)
    {
        float _6289 = _6275 * _6275;
        _6287 = _6289;
    }
    float _6291 = _6287;
    float _6293 = fma(_6283, _6283, _6279);
    float _6295 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6297 = _6293 + _6291;
    float _6299 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6295);
    float _6301 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6303 = fma(_6141, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6301);
    float _6305 = precise::clamp(_6303, 0.0, 1.0);
    float _6307 = rsqrt(_6297);
    float _6309 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6299);
    float _6311 = -_6305;
    float _6313 = _6311 + 1.0;
    float _6315 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6317 = fma(_5109, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6319 = _6309 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6321 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6323 = abs(_6313);
    float _6325 = log2(_6323);
    float _6327 = _6319 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6329 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6331 = -_6327;
    float _6333 = fma(_6331, _6315, 1.0);
    float _6335 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6337 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6329);
    float _6339 = _6307 * _6263;
    float _6341 = _6307 * _6283;
    float _6343 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6335);
    float _6345 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6337);
    float _6347 = _6339 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6349 = _6307 * _6275;
    float _6351 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6343);
    float _6353 = _6345 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6355 = -_6347;
    float _6357 = fma(_6341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6355);
    float _6359 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6321);
    float _6361 = _6351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6363 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6365 = floor(_6317);
    float _6367 = -_6349;
    float _6369 = fma(_6367, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6357);
    float _6371 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6359);
    float _6373 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6363);
    float _6375 = _6325 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6377 = fma(_6369, -0.5, 0.5);
    float _6379 = _6371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6381 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6373);
    float _6383 = exp2(_6375);
    float _6385 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6387 = fma(_6369, 0.5, 0.5);
    float _6389 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6381);
    float _6391 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6393 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6385);
    float _6395 = sqrt(_6377);
    float _6397 = -_6365;
    float _6399 = _6317 + _6397;
    float _6401 = fma(_6387, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6403 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6391);
    float _6405 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6393);
    float _6407 = _6341 + 1.0;
    float _6409 = fma(_6387, _6401, -0.212114393711090087890625);
    float _6411 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6403);
    float _6413 = log2(_6333);
    float _6415 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6405);
    float _6417 = fma(_6387, _6409, 1.570728778839111328125);
    float _6419 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6411);
    float _6421 = -_6341;
    float _6423 = fma(_6383, _6407, _6421);
    float _6425 = 1.0 / _6389;
    float _6427 = _6395 * 0.636619746685028076171875;
    float _6429 = fma(_6423, 0.5, 0.5);
    float _6431 = -_6417;
    float _6433 = fma(_6427, _6431, 1.0);
    float2 _16350 = float2(_6219, _6399);
    float _6435 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16350, float2(0.0), isnan(_16350)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16350, float2(0.0), isnan(_16350)), level(0.0)).x;
    float _6437 = _6413 * 0.693147182464599609375;
    float _6439 = _6415 * _6425;
    float _6441 = _6419 * _6425;
    float _6443 = _6437 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6445 = fma(_6439, 0.5, 0.5);
    float _6447 = fma(_6441, -0.5, 0.5);
    float3 _16378 = float3(_6445, _6447, _6443);
    float _6449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16378, float3(0.0), isnan(_16378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16378, float3(0.0), isnan(_16378)), level(0.0)).x;
    float3 _16389 = float3(_6445, _6447, _6443);
    float4 _6452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16389, float3(0.0), isnan(_16389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16389, float3(0.0), isnan(_16389)), level(0.0)).xyzw;
    float _6454 = _6452.x;
    float _6456 = _6452.y;
    float _6458 = _6452.z;
    float _6460 = _6452.w;
    float2 _16405 = float2(_6433, _6429);
    float3 _6464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16405, float2(0.0), isnan(_16405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16405, float2(0.0), isnan(_16405)), level(0.0)).xyz;
    float _6466 = _6464.x;
    float _6468 = _6464.y;
    float _6470 = _6464.z;
    float _6472 = abs(_5997);
    float _6474 = log2(_6472);
    float _6476 = _6325 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6478 = _6389 * 0.5;
    float _6480 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6482 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6484 = isnan(_6141);
    bool _6486 = _6482 || _6484;
    bool _6488 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6490 = _6486 || _6488;
    float _6492 = exp2(_6476);
    bool _6494 = _5997 <= 8000.0;
    bool _6496 = isnan(_5997);
    bool _6498 = _6494 || _6496;
    bool _6500 = isnan(8000.0);
    bool _6502 = _6498 || _6500;
    float _6504 = float(_6502);
    float _6506 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6480);
    float _6508 = in.m_101.x;
    float _6510 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6506);
    float _6512 = _6474 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6514 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6510);
    float _6516 = _6415 + _6389;
    float _6518 = exp2(_6512);
    float _6520 = _6516 * 0.5;
    float _6522 = -_6492;
    float _6524 = _6522 + 1.0;
    out.gl_Position.x = _6415;
    out.gl_Position.y = _6419;
    out.gl_Position.z = _6514;
    out.gl_Position.w = _6389;
    float _6526 = _6516;
    float _6528 = _6419;
    float _6530 = _6415;
    float _6532 = _6389;
    float _6534 = _6514;
    float _6536 = _6520;
    if (!_6490)
    {
        _6526 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6538 = _6526;
    float _6540 = _6524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6542 = fma(_6518, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6544 = precise::clamp(_6542, 0.0, 1.0);
    float _6546 = fma(_6419, -0.5, _6478);
    float _6548 = fma(_6544, -2.0, 3.0);
    float _6550 = _6544 * _6544;
    float _6552 = _6538;
    float _6554 = _6538;
    if (!_6490)
    {
        _6528 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6556 = _6528;
    float _6558 = _6556;
    float _6560 = _6556;
    if (!_6490)
    {
        _6530 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6562 = _6530;
    float _6564 = _6550 * _6548;
    float _6566 = -_6564;
    float _6568 = _6566 + 1.0;
    float _6570 = fma(_6568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6564);
    float _6572 = _6514 + _6389;
    float _6574 = _6504 * _6570;
    float _6576 = _6572 * 0.5;
    float _6578 = _6562;
    float _6580 = _6562;
    if (!_6490)
    {
        _6532 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6582 = _6532;
    float _6584 = _6574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6586 = _6582;
    float _6588 = _6582;
    if (!_6490)
    {
        _6534 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6590 = _6534;
    out.m_103.x = _6520;
    out.m_103.y = _6546;
    out.m_103.z = _6576;
    out.m_103.w = _6389;
    float _6592 = _6117 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6594 = _6590;
    float _6596 = _6590;
    if (!_6490)
    {
        _6536 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6598 = _6536;
    float _6600 = -_6435;
    float _6602 = _6600 + 1.0;
    float _6604 = _6602 * _6584;
    float _6606 = precise::clamp(_6604, 0.0, 1.0);
    float _6608 = -_6606;
    float _6610 = fma(_6608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6612 = _6610 * _6508;
    float _6614 = _6612 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6616 = _6540 * _6449;
    float _6618 = -_6540;
    float _6620 = _6618 + 1.0;
    out.m_105.x = _6614;
    float _6622 = _6460 * _6616;
    float _6624 = _6470 * _6616;
    float _6626 = _6460 * _6620;
    float _6628 = fma(_6466, _6622, _6454);
    float _6630 = fma(_6468, _6622, _6456);
    float _6632 = fma(_6460, _6624, _6458);
    out.m_107.x = _6628;
    out.m_107.y = _6630;
    out.m_107.z = _6632;
    out.m_107.w = _6626;
    bool _6634 = !_6490;
    float _6636 = _6598;
    float _6638 = _6598;
    if (!_6634)
    {
        bool _6640 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6642 = isnan(_6141);
        bool _6644 = _6640 || _6642;
        bool _6646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6648 = _6644 || _6646;
        if (!_6648)
        {
            float _6650 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6652 = _6141 + _6650;
            float _6654 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6656 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6654;
            float _6658 = 1.0 / _6656;
            float _6660 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6662 = _6660 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6664 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6666 = _6664 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6668 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6670 = _6668 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6672 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6674 = _6672 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6676 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6678 = _6676 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6680 = _6652 * _6658;
            float _6682 = precise::clamp(_6680, 0.0, 1.0);
            float _6684 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6686 = _6684 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6688 = fma(_6682, _6666, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6690 = fma(_6682, _6686, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6692 = fma(_6682, _6662, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6694 = fma(_6682, _6670, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6696 = fma(_6682, _6674, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6698 = fma(_6682, _6678, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6580 = _6692;
            _6588 = _6696;
            _6560 = _6690;
            _6638 = _6694;
            _6554 = _6688;
            _6596 = _6698;
            _6700 = true;
        }
        else
        {
            bool _6702 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6704 = isnan(_6141);
            bool _6706 = _6702 || _6704;
            bool _6708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6710 = _6706 || _6708;
            if (!_6710)
            {
                _6636 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6712 = _6636;
            _6638 = _6712;
            if (!_6710)
            {
                _6586 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6714 = _6586;
            _6588 = _6714;
            if (!_6710)
            {
                _6594 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6716 = _6594;
            _6596 = _6716;
            if (!_6710)
            {
                _6558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6718 = _6558;
            _6560 = _6718;
            if (!_6710)
            {
                _6578 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6720 = _6578;
            _6580 = _6720;
            if (!_6710)
            {
                _6552 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6722 = _6552;
            bool _6724 = !_6710;
            _6554 = _6722;
            if (!_6724)
            {
                bool _6726 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6728 = isnan(_6141);
                bool _6730 = _6726 || _6728;
                bool _6732 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6734 = _6730 || _6732;
                if (!_6734)
                {
                    float _6736 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6738 = _6141 + _6736;
                    float _6740 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6742 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6740;
                    float _6744 = 1.0 / _6742;
                    float _6746 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6748 = _6746 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6750 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6752 = _6750 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6754 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6756 = _6754 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6758 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6760 = _6758 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6762 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6764 = _6762 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6766 = _6738 * _6744;
                    float _6768 = precise::clamp(_6766, 0.0, 1.0);
                    float _6770 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6772 = _6770 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6774 = fma(_6768, _6752, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6776 = fma(_6768, _6772, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6778 = fma(_6768, _6748, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6780 = fma(_6768, _6756, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6782 = fma(_6768, _6760, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6784 = fma(_6768, _6764, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6580 = _6778;
                    _6588 = _6782;
                    _6560 = _6776;
                    _6638 = _6780;
                    _6554 = _6774;
                    _6596 = _6784;
                    _6700 = true;
                }
                else
                {
                    _6580 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6588 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6638 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6554 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6596 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6700 = false;
    float _6786 = _6580;
    float _6788 = _6588;
    float _6790 = _6560;
    float _6792 = _6638;
    float _6794 = _6554;
    float _6796 = _6596;
    float _6798 = _6592 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6800 = fma(_5719, -0.5, 0.5);
    float _6802 = precise::clamp(_6800, 0.0, 1.0);
    float _6804 = -_6786;
    float _6806 = _6788 + _6804;
    float _6808 = -_6790;
    float _6810 = _6792 + _6808;
    out.m_51.x = _6798;
    float _6812 = fma(_6802, _6806, _6786);
    float _6814 = -_6794;
    float _6816 = _6796 + _6814;
    float _6818 = fma(_6802, _6810, _6790);
    float _6820 = _6812 * 0.586610972881317138671875;
    bool _6822 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6824 = fma(_6802, _6816, _6794);
    out.m_109.x = 0.0;
    float _6826 = fma(_6818, 0.298911988735198974609375, _6820);
    bool _6828 = _6117 > 0.0;
    bool _6830 = isnan(_6117);
    bool _6832 = _6828 || _6830;
    bool _6834 = isnan(0.0);
    bool _6836 = _6832 || _6834;
    float _6838 = fma(_6824, 0.114477999508380889892578125, _6826);
    float _6840 = -_6838;
    float _6842 = _6818 + _6840;
    float _6844 = -_6838;
    float _6846 = _6812 + _6844;
    float _6848 = -_6838;
    float _6850 = _6824 + _6848;
    float _6852 = fma(_6842, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    float _6854 = fma(_6846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    float _6856 = fma(_6850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    bool _6858 = !_6822;
    if (!_6858)
    {
        float _6860 = -_6063;
        float _6862 = _6860 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6864 = -_6065;
        float _6866 = _6864 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6868 = -_6067;
        float _6870 = _6868 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6872 = _6862 * _6862;
        float _6874 = fma(_6866, _6866, _6872);
        float _6876 = fma(_6870, _6870, _6874);
        float _6878 = sqrt(_6876);
        float _6880 = rsqrt(_6876);
        float _6882 = -_6878;
        float _6884 = _6882 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6886 = _6884 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6888 = precise::clamp(_6886, 0.0, 1.0);
        float _6890 = _6866 * _6880;
        float _6892 = _6862 * _6880;
        float _6894 = abs(_6888);
        float _6896 = log2(_6894);
        float _6898 = _6870 * _6880;
        float _6900 = _6890 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6902 = _5719 * _6892;
        float _6904 = -_6892;
        float _6906 = -_6900;
        float _6908 = fma(_6904, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6906);
        float _6910 = fma(_5725, _6890, _6902);
        float _6912 = -_6898;
        float _6914 = fma(_6912, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6908);
        float _6916 = fma(_5733, _6898, _6910);
        float _6918 = precise::clamp(_6916, 0.0, 1.0);
        float _6920 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6922 = _6914 + _6920;
        float _6924 = _6896 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6926 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6928 = precise::clamp(_6926, 0.0, 1.0);
        float _6930 = exp2(_6924);
        float _6932 = _6930 * _6928;
        float _6934 = _6918 * _6932;
        float _6936 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6938 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6940 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6936;
        out.m_109.y = _6938;
        out.m_109.z = _6940;
    }
    out.m_111.x = _6852;
    out.m_111.y = _6854;
    out.m_111.z = _6856;
    if (_6836)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _6942 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6942;
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
    bool _6700 = false;
    bool _5781 = false;
    bool _1146 = false;
    bool _822 = false;
    bool _680 = false;
    bool _526 = false;
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
        float _6999 = as_type<float>(_146);
        out.gl_Position.z = _6999;
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
        float _7068 = as_type<float>(_184);
        out.gl_Position.z = _7068;
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
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = _258 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _258 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = 1.0 / _278;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _292 = 1.0 / _282;
    bool _294 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_258);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = 1.0 / _274;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _310 = _258 + _308;
    float _312 = _310 * _288;
    bool _314 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _316 = isnan(_258);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _286;
    float _328 = _262 * _292;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _266 * _306;
    bool _340 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _342 = isnan(_258);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_324;
    float _354 = _352 + 1.0;
    float _356 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _350 * _354;
    float _362 = -_350;
    float _364 = _362 + 1.0;
    float _366 = _270 * _326;
    bool _368 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_258);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    bool _384 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _386 = isnan(_258);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = fma(_382, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = -_378;
    float _404 = _402 + 1.0;
    float _406 = _378 * _364;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = _304 * _404;
    float _418 = -_304;
    float _420 = _418 + 1.0;
    float _422 = fma(_398, _366, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _366, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_410, _366, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _394 * _420;
    float _430 = -_394;
    float _432 = _430 + 1.0;
    float _434 = _356 * _428;
    float _436 = _358 * _428;
    float _438 = _400 * _428;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _454;
    float _458 = fma(_422, _416, _444);
    float _460 = fma(_424, _416, _446);
    float _462 = fma(_426, _416, _448);
    float _464 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_464, _406, _458);
    float _484 = fma(_472, _312, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_476, _312, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _488 = fma(_480, _312, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_466, _406, _460);
    float _492 = fma(_468, _406, _462);
    float _494 = fma(_484, _360, _482);
    float _496 = fma(_486, _360, _490);
    float _498 = fma(_488, _360, _492);
    float _500 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].x, _494);
    float _502 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].y, _496);
    float _504 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].z, _498);
    bool _506 = !_290;
    float _524;
    if (!_506)
    {
        float _508 = in.m_63.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _524 = _522;
        _526 = true;
    }
    else
    {
        float _528 = float(_130);
        float _530 = 1.0 / _528;
        float _532 = _164 * _530;
        _524 = _532;
    }
    _526 = false;
    float _534 = _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _534 + _536;
    float _540 = in.m_65.x;
    float _542 = in.m_65.y;
    float _544 = in.m_65.z;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_534);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _578;
    bool _582 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_534);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _548;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _534 + _600;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _576 * _598;
    float _608 = -_576;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _564;
    float _614 = _580 * _594;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _538, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = _618 * _612;
    float _624 = -_592;
    float _626 = _624 + 1.0;
    float _628 = _620 * _606;
    float _630 = fma(_622, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = _560 * _626;
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _636 = _504 * _544;
    float _638 = fma(_630, _632, _634);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _638);
    float _646 = _502 * _542;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _656 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _500 * _540;
    out.m_67.x = _650;
    out.m_67.y = _652;
    out.m_67.z = _656;
    out.m_67.w = _654;
    bool _660 = !_604;
    float _678;
    if (!_660)
    {
        float _662 = in.m_63.x;
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        float _682 = float(_130);
        float _684 = 1.0 / _682;
        float _686 = _164 * _684;
        _678 = _686;
    }
    _680 = false;
    float _688 = _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _688 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _698 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _700 = isnan(_688);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _714 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _716 = isnan(_688);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _726;
    bool _730 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _732 = isnan(_688);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = 1.0 / _696;
    float _744 = -_708;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _750 = _688 + _748;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _754 = _724 * _746;
    float _756 = -_724;
    float _758 = _756 + 1.0;
    float _760 = 1.0 / _712;
    float _762 = _728 * _742;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _768 = fma(_762, _692, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _770 = -_740;
    float _772 = _770 + 1.0;
    float _774 = _766 * _760;
    float _776 = _768 * _754;
    float _778 = _708 * _772;
    float _780 = fma(_774, _750, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _782 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[131].x, _776);
    float _784 = fma(_780, _778, _782);
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _792 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[133].x, _784);
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _794;
    out.m_69.y = _796;
    out.m_69.z = _798;
    out.m_69.w = _800;
    bool _802 = !_752;
    float _820;
    if (!_802)
    {
        float _804 = in.m_63.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_130);
        float _826 = 1.0 / _824;
        float _828 = _164 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _834 = _830 + _832;
    bool _836 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _838 = isnan(_830);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _852;
    bool _856 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _858 = isnan(_830);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = -_846;
    float _870 = _868 + 1.0;
    bool _872 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _874 = isnan(_830);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = 1.0 / _850;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _890 = _866 * _870;
    float _892 = -_882;
    float _894 = _892 + 1.0;
    float _896 = 1.0 / _888;
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _900 = _854 * _884;
    float _902 = -_866;
    float _904 = _902 + 1.0;
    bool _906 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _908 = isnan(_830);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = fma(_900, _834, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _920 = _882 * _904;
    bool _922 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _924 = isnan(_830);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _916 * _894;
    float _936 = -_916;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _944 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _946 = isnan(_830);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _932 * _938;
    float _958 = -_932;
    float _960 = _958 + 1.0;
    bool _962 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _964 = isnan(_830);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = 1.0 / _942;
    float _976 = -_954;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _984 = _954 * _960;
    float _986 = _972 * _978;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _992 = -_972;
    float _994 = _992 + 1.0;
    float _996 = 1.0 / _982;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1002 = _918 * _986;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _830 + _1008;
    float _1012 = _1000 * _896;
    float _1014 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1002);
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = fma(_1012, _1010, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1030 = _830 + _1028;
    float _1032 = _1020 * _974;
    float _1034 = fma(_1022, _984, _1014);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1038 = _830 + _1036;
    float _1040 = 1.0 / _1006;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1046 = fma(_1032, _1030, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1048 = _1044 * _996;
    bool _1050 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1052 = isnan(_830);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1058 = _1054 || _1056;
    int _1060 = _1058 ? 1065353216 : 0;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1062;
    float _1066 = 1.0 / _1026;
    float _1068 = fma(_1046, _956, _1034);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1074 = _1064 * _1016;
    float _1076 = fma(_1048, _1038, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1080 = _830 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1084 = _830 + _1082;
    float _1086 = _1072 * _1040;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1088;
    float _1092 = fma(_1074, _1080, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1094 = fma(_1076, _934, _1068);
    float _1096 = fma(_1086, _1084, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1098 = -as_type<float>(_1060);
    float _1100 = _1098 + 1.0;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _830 + _1102;
    float _1106 = fma(_1092, _920, _1094);
    float _1108 = _1090 * _1066;
    float _1110 = _846 * _1100;
    float _1112 = fma(_1096, _890, _1106);
    float _1114 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1116 = fma(_1114, _1110, _1112);
    float _1118 = fma(as_type<float>(_1060), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1116);
    out.m_71.x = _1118;
    bool _1120 = !_898;
    float _1122 = _890;
    int _1124 = _1060;
    int _1126 = as_type<int>(_1110);
    float _1144;
    if (!_1120)
    {
        float _1128 = in.m_63.x;
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1136 = _1134 * _1130;
        float _1138 = floor(_1136);
        float _1140 = -_1138;
        float _1142 = _1136 + _1140;
        _1144 = _1142;
        _1146 = true;
    }
    else
    {
        float _1148 = float(_130);
        float _1150 = 1.0 / _1148;
        float _1152 = _164 * _1150;
        _1144 = _1152;
    }
    _1146 = false;
    float _1154 = _1144;
    float _1156 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1158 = int(_1156);
    float _1160 = in.m_73.x;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1164 = _1162 != 0;
    float _1166 = in.m_63.y;
    float _1168 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1170 = int(_1168);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1174 = _1172 != 0;
    float _1176 = 0.0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1164)
    {
        _1176 = 1.0;
    }
    float _1180 = _1176;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1184 = _1182 != 0;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1188 = _1186 != 0;
    float _1190 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1192 = int(_1190);
    float _1194 = float(_1158);
    float _1196 = 0.0;
    float _1198 = _1180;
    bool _1200 = _1184;
    bool _1202 = _1188;
    if (_1164)
    {
        _1196 = 1.0;
    }
    float _1204 = _1196;
    float _1206 = 0.0;
    float _1208 = _1204;
    if (_1164)
    {
        _1206 = 1.0;
    }
    float _1210 = _1206;
    int _1212 = 0;
    float _1214 = _1210;
    if (_1164)
    {
        _1212 = 0;
    }
    int _1216 = _1212;
    float _1218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1220 = int(_1218);
    float _1222 = float(_1170);
    int _1224 = _1216;
    if (_1164)
    {
        _1178 = 0;
    }
    int _1226 = _1178;
    int _1228 = _1226;
    float _1230 = _1160;
    if (!_1174)
    {
        _1122 = _1160;
    }
    float _1232 = _1122;
    float _1234 = _1232;
    if (_1184)
    {
        float _1236 = -_1160;
        float _1238 = _1236 + 1.0;
        _1124 = as_type<int>(_1238);
    }
    int _1240 = _1124;
    if (_1188)
    {
        float _1242 = -_1160;
        float _1244 = _1242 + 1.0;
        _1126 = as_type<int>(_1244);
    }
    int _1246 = _1126;
    bool _1248 = _1166 > 0.5;
    float _1250 = 1.0 / _1194;
    float _1252 = float(_1192);
    float _1254 = 0.0;
    if (!_1184)
    {
        _1254 = _1160;
    }
    float _1256 = _1254;
    float _1258 = 0.0;
    float _1260 = _1256;
    if (!_1188)
    {
        _1258 = _1160;
    }
    float _1262 = _1258;
    float _1264 = _1262;
    if (_1184)
    {
        float _1266 = _1248 ? as_type<float>(_1240) : _1160;
        _1260 = _1266;
    }
    float _1268 = _1260;
    float _1270 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1272 = int(_1270);
    float _1274 = float(uint(_1220));
    if (_1188)
    {
        float _1276 = _1248 ? as_type<float>(_1246) : _1160;
        _1264 = _1276;
    }
    float _1278 = _1264;
    int _1280 = 0;
    if (_1164)
    {
        _1280 = as_type<int>(_1166);
    }
    int _1282 = _1280;
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1286 = int(_1284);
    float _1288 = _1250 * _164;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1292 = int(_1290);
    float _1294 = float(uint(_1272));
    float _1296 = 1.0 / _1222;
    float _1298 = float(_1286);
    float _1300 = 1.0 / _1252;
    float _1302 = float(uint(_1292));
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1306 = int(_1304);
    float _1308 = _1296 * _164;
    float _1310 = 1.0 / _1274;
    float _1312 = _1300 * _164;
    float _1314 = 1.0 / _1294;
    float _1316 = float(uint(_1306));
    float _1318 = trunc(_1288);
    int _1320 = int(_1318);
    float _1322 = _1294;
    int _1324 = _1282;
    if (_1164)
    {
        float _1326 = in.m_63.x;
        _1322 = _1326;
    }
    float _1328 = _1322;
    int _1330 = as_type<int>(_1310) + (-2);
    float _1332 = 1.0 / _1298;
    int _1334 = as_type<int>(_1314) + (-2);
    float _1336 = 1.0 / _1302;
    float _1338 = float(uint(_1320));
    float _1340 = as_type<float>(_1334) * _1338;
    float _1342 = trunc(_1308);
    int _1344 = int(_1342);
    float _1346 = _1332 * _164;
    float _1348 = trunc(_1312);
    int _1350 = int(_1348);
    int _1352 = as_type<int>(_1336) + (-2);
    float _1354 = 1.0 / _1316;
    float _1356 = float(uint(_1344));
    float _1358 = as_type<float>(_1352) * _1356;
    float _1360 = trunc(_1346);
    int _1362 = int(_1360);
    float _1364 = _1316;
    int _1366 = as_type<int>(_1358);
    if (_1164)
    {
        float _1368 = in.m_63.z;
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = float(uint(_1350));
    float _1374 = as_type<float>(_1330) * _1372;
    float _1376 = trunc(_1340);
    float _1378 = precise::max(_1376, 0.0);
    uint _1381 = uint(_1378);
    float _1383 = trunc(_1358);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    float _1389 = trunc(_1374);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = _1328;
    if (_1164)
    {
        _1366 = as_type<int>(_1328);
    }
    int _1397 = _1366;
    int _1399 = 0;
    float _1401 = as_type<float>(_1397);
    float _1403 = _1370;
    if (_1164)
    {
        _1399 = as_type<int>(_1370);
    }
    int _1405 = _1399;
    int _1407 = 0;
    int _1409 = _1405;
    if (_1164)
    {
        _1407 = _1397;
    }
    int _1411 = _1407;
    int _1413 = int(_1184);
    int _1415 = _1174 ? 2 : 0;
    int _1417 = _1413 | _1415;
    int _1419 = _1188 ? 4 : 0;
    int _1421 = _1417 | _1419;
    int _1423 = _1164 ? 8 : 0;
    int _1425 = _1421 | _1423;
    int _1427 = false ? 16 : 0;
    int _1429 = _1425 | _1427;
    int _1431 = _1248 ? 32 : 0;
    int _1433 = _1429 | _1431;
    int _1435 = false ? 64 : 0;
    int _1437 = _1433 | _1435;
    int _1439 = _1437 & 32;
    float _1441 = as_type<float>(_1439);
    int _1443 = _1411;
    if (_1164)
    {
        _1441 = as_type<float>(_1397);
    }
    float _1445 = _1441;
    float _1447 = _1445;
    if (!_1164)
    {
        float _1449 = in.m_63.x;
        float _1451 = _1166 * 3.1415927410125732421875;
        float _1453 = in.m_63.z;
        float _1455 = _1451 * 0.15915493667125701904296875;
        float _1457 = _1455 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1449 * 3.1415927410125732421875;
        float _1463 = _1461 * 0.15915493667125701904296875;
        float _1465 = _1453 * 3.1415927410125732421875;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = _1463 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        _1447 = _1453;
        _1214 = 5.839270114898681640625;
        _1395 = _1449;
        _1198 = 7.345489978790283203125;
        _1401 = _1166;
        _1208 = 1.2345600128173828125;
        _1224 = 1;
        _1228 = 2;
        _1403 = _1453;
        _1324 = as_type<int>(_1459);
        _1443 = as_type<int>(_1471);
        _1409 = as_type<int>(_1475);
    }
    float _1477 = _1447;
    float _1479 = _1214;
    float _1481 = _1395;
    float _1483 = _1198;
    float _1485 = _1401;
    float _1487 = _1208;
    int _1489 = _1224;
    int _1491 = _1228;
    float _1493 = _1403;
    int _1495 = _1324;
    int _1497 = _1443;
    int _1499 = _1409;
    int _1501 = ~_1220;
    int _1503 = _1501 + 1;
    float _1505 = _1066;
    if (_1174)
    {
        float _1507 = in.m_63.x;
        _1505 = _1507;
    }
    float _1509 = _1505;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1513 = _1511 != 0;
    float _1515 = _1477 * _1479;
    int _1517 = ~_1292;
    int _1519 = _1517 + 1;
    int _1521 = _1503 * int(_1393);
    int _1523 = _1521 + _1350;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1527 = _1525 != 0;
    float _1529 = _1481 * _1483;
    float _1531 = _1485 * _1487;
    int _1533 = as_type<int>(_1354) + (-2);
    float _1535 = floor(_1515);
    float _1537 = float(uint(_1523));
    int _1539 = _1519 * int(_1387);
    int _1541 = _1539 + _1344;
    float _1543 = float(uint(_1362));
    float _1545 = _1485 * _1483;
    float _1547 = _1477;
    if (_1513)
    {
        float _1549 = in.m_63.z;
        _1547 = _1549;
    }
    float _1551 = _1547;
    int _1553 = ~_1272;
    int _1555 = _1553 + 1;
    float _1557 = as_type<float>(_1330) * _1537;
    float _1559 = float(uint(_1541));
    float _1561 = floor(_1529);
    int _1563 = 0;
    float _1565 = _1557;
    if (_1527)
    {
        float _1567 = -_1160;
        float _1569 = _1567 + 1.0;
        _1563 = as_type<int>(_1569);
    }
    int _1571 = _1563;
    int _1573 = _1555 * int(_1381);
    int _1575 = _1573 + _1320;
    int _1577 = 0;
    if (_1513)
    {
        float _1579 = -_1160;
        float _1581 = _1579 + 1.0;
        _1577 = as_type<int>(_1581);
    }
    int _1583 = _1577;
    float _1585 = as_type<float>(_1352) * _1559;
    int _1587 = ~_1220;
    int _1589 = _1587 + 1;
    bool _1591 = _1489 != 1;
    float _1593 = _1509;
    if (_1174)
    {
        bool _1595 = _1509 > 0.5;
        _1200 = _1595;
    }
    bool _1597 = _1200;
    float _1599 = floor(_1531);
    if (!_1527)
    {
        _1593 = _1160;
    }
    float _1601 = _1593;
    bool _1603 = _1491 != 2;
    float _1605 = _1601;
    if (_1527)
    {
        float _1607 = _1248 ? as_type<float>(_1571) : _1160;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1166 * 2.0;
    float _1613 = float(uint(_1575));
    float _1615 = in.m_59.w;
    int _1617 = ~_1272;
    int _1619 = _1617 + 1;
    float _1621 = trunc(_1585);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = -_1561;
    float _1629 = _1529 + _1627;
    float _1631 = as_type<float>(_1334) * _1613;
    int _1633 = ~_1306;
    int _1635 = _1633 + 1;
    int _1637 = as_type<int>(_1613);
    float _1639 = as_type<float>(_1619);
    if (_1174)
    {
        float _1641 = -_1160;
        float _1643 = _1641 + 1.0;
        _1637 = as_type<int>(_1643);
    }
    int _1645 = _1637;
    if (_1513)
    {
        bool _1647 = _1551 > 0.5;
        _1202 = _1647;
    }
    bool _1649 = _1202;
    float _1651 = in.m_61.w;
    int _1653 = ~_1292;
    int _1655 = _1653 + 1;
    float _1657 = -_1599;
    float _1659 = _1531 + _1657;
    float _1661 = as_type<float>(_1533) * _1543;
    float _1663 = float(_130);
    float _1665 = trunc(_1631);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    float _1671 = float(_1220);
    float _1673 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1675 = as_type<float>(_1655);
    if (_1174)
    {
        float _1677 = _1597 ? as_type<float>(_1645) : _1160;
        _1234 = _1677;
    }
    float _1679 = _1234;
    int _1681 = int(_1387) + int(_1625);
    float _1683 = _1629 * _1671;
    float _1685 = float(_1350);
    float _1687 = trunc(_1661);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = -_1535;
    float _1695 = _1515 + _1693;
    float _1697 = float(_1292);
    bool _1699 = _1685 >= _1671;
    bool _1701 = isnan(_1685);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(_1671);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = float(_1306);
    float _1713 = floor(_1545);
    int _1715 = int(_1381) + int(_1669);
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1723 = _1721 != 0;
    float _1725 = 1.0 / _1663;
    int _1727 = _1635 * int(_1691);
    int _1729 = _1727 + _1362;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1733 = float(uint(_1729));
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1737 = trunc(_1557);
    float _1739 = precise::max(_1737, 0.0);
    uint _1741 = uint(_1739);
    float _1743 = _1671 * _164;
    float _1745 = -_1713;
    float _1747 = _1545 + _1745;
    float _1749 = as_type<float>(_1533) * _1733;
    float _1751 = float(_1344);
    float _1753 = _1697 * _1659;
    float _1755 = float(_1272);
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1759 = trunc(_1749);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    if (!_1513)
    {
        _1565 = _1160;
    }
    float _1765 = _1565;
    float _1767 = _1743 * _1725;
    float _1769 = _1765;
    if (_1513)
    {
        float _1771 = _1649 ? as_type<float>(_1583) : _1160;
        _1769 = _1771;
    }
    float _1773 = _1769;
    float _1775 = _1725 * _164;
    float _1777 = float(_1320);
    float _1779 = _1755 * _1695;
    bool _1781 = _1751 >= _1697;
    bool _1783 = isnan(_1751);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(_1697);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = _1755 * _1775;
    int _1795 = int(_1393) + int(_1741);
    float _1797 = _1711 * _1775;
    float _1799 = float(_1362);
    float _1801 = trunc(_1791);
    int _1803 = int(_1801);
    bool _1805 = _1777 >= _1755;
    bool _1807 = isnan(_1777);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan(_1755);
    bool _1813 = _1809 || _1811;
    float _1815 = float(_1813);
    float _1817 = _1711 * _1747;
    bool _1819 = _1799 >= _1711;
    bool _1821 = isnan(_1799);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(_1711);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    int _1831 = _1589 * _1795;
    int _1833 = _1831 + _1350;
    int _1835 = _1655 * _1681;
    int _1837 = _1835 + _1344;
    int _1839 = int(_1691) + int(_1763);
    float _1841 = trunc(_1709);
    int _1843 = int(_1841);
    bool _1845 = !_1719;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = _1697 * _1775;
    bool _1851 = uint(_1833) >= uint(_1220);
    int _1853 = _1619 * _1715;
    int _1855 = _1853 + _1320;
    int _1857 = abs(_1847);
    int _1859 = ~_1306;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1683);
    int _1865 = int(_1863);
    bool _1867 = uint(_1837) >= uint(_1292);
    bool _1869 = uint(_1855) >= uint(_1272);
    int _1871 = _1861 * _1839;
    int _1873 = _1871 + _1362;
    bool _1875 = !_1723;
    int _1877 = _1875 ? 0 : 1;
    bool _1879 = !_1851;
    int _1881 = _1879 ? 0 : (-1);
    float _1883 = trunc(_1753);
    int _1885 = int(_1883);
    bool _1887 = !_1867;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = abs(_1877);
    int _1893 = ~_1795;
    int _1895 = _1893 + _1881;
    int _1897 = _1895 + 1;
    bool _1899 = !_1869;
    int _1901 = _1899 ? 0 : (-1);
    float _1903 = trunc(_1815);
    int _1905 = int(_1903);
    bool _1907 = uint(_1873) >= uint(_1306);
    int _1909 = _1865 * _1857;
    int _1911 = _1909 + _1350;
    int _1913 = ~_1681;
    int _1915 = _1913 + _1889;
    int _1917 = _1915 + 1;
    int _1919 = ~_1715;
    int _1921 = _1919 + _1901;
    int _1923 = _1921 + 1;
    int _1925 = _1220 * _1897;
    int _1927 = _1925 + _1350;
    bool _1929 = !_1907;
    int _1931 = _1929 ? 0 : (-1);
    int _1933 = _1885 * _1891;
    int _1935 = _1933 + _1344;
    int _1937 = _1292 * _1917;
    int _1939 = _1937 + _1344;
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1943 = _1941 != 0;
    float _1945 = trunc(_1779);
    int _1947 = int(_1945);
    int _1949 = ~_1839;
    int _1951 = _1949 + _1931;
    int _1953 = _1951 + 1;
    int _1955 = _1272 * _1923;
    int _1957 = _1955 + _1320;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1961 = _1959 != 0;
    int _1963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1965 = _1963 != 0;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1969 = _1967 != 0;
    bool _1971 = _1292 == 0;
    int _1973 = _1306 * _1953;
    int _1975 = _1973 + _1362;
    bool _1977 = !_1943;
    int _1979 = _1977 ? 0 : 1;
    float _1981 = trunc(_1829);
    int _1983 = int(_1981);
    bool _1985 = _1220 == 0;
    bool _1987 = _1272 == 0;
    int _1989 = ~_1803;
    int _1991 = _1989 + 1;
    int _1993 = _1991 + 1;
    bool _1995 = _1306 == 0;
    float _1997 = trunc(_1767);
    int _1999 = int(_1997);
    bool _2001 = !_1971;
    int _2003 = _2001 ? _1939 : (-1);
    int _2005 = ~_1843;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    bool _2011 = !_1985;
    int _2013 = _2011 ? _1927 : (-1);
    int _2015 = _1993 * _2003;
    int _2017 = abs(_1979);
    float _2019 = trunc(_1849);
    int _2021 = int(_2019);
    int _2023 = ~_1905;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = _2013 * _2009;
    bool _2031 = !_1987;
    int _2033 = _2031 ? _1957 : (-1);
    int _2035 = _1947 * _2017;
    int _2037 = _2035 + _1320;
    bool _2039 = !_1995;
    int _2041 = _2039 ? _1975 : (-1);
    int _2043 = _1220 + (-1);
    int _2045 = _2027 * _2033;
    bool _2047 = !_1965;
    int _2049 = _2047 ? 0 : 1;
    float _2051 = floor(_1611);
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2055 = _2053 != 0;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2059 = _2057 != 0;
    int _2061 = _1843 * _2043;
    int _2063 = _2061 + _2029;
    int _2065 = _1292 + (-1);
    int _2067 = abs(_2049);
    bool _2069 = !_1961;
    int _2071 = _2069 ? 0 : 1;
    int _2073 = _1803 * _2065;
    int _2075 = _2073 + _2015;
    bool _2077 = !_2059;
    int _2079 = _2077 ? 0 : 1;
    int _2081 = _2063 * _2067;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2085 = _2083 != 0;
    int _2087 = abs(_2071);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2091 = _2089 != 0;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2095 = _2093 != 0;
    bool _2097 = !_1969;
    int _2099 = _2097 ? 0 : 1;
    int _2101 = _1999 * _2087;
    int _2103 = _2101 + _2081;
    int _2105 = abs(_2079);
    bool _2107 = !_2091;
    int _2109 = _2107 ? 0 : 1;
    int _2111 = abs(_2099);
    int _2113 = _2075 * _2105;
    bool _2115 = !_2085;
    int _2117 = _2115 ? 0 : 1;
    int _2119 = abs(_2109);
    bool _2121 = !_2055;
    int _2123 = _2121 ? 0 : 1;
    int _2125 = abs(_2117);
    int _2127 = _1911 * _2111;
    int _2129 = _2127 + _2103;
    int _2131 = abs(_2123);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2139 = _2137 != 0;
    int _2141 = _2021 * _2131;
    int _2143 = _2141 + _2113;
    bool _2145 = !_2095;
    int _2147 = _2145 ? 0 : 1;
    int _2149 = _1865 * _2125;
    int _2151 = _2149 + _2129;
    float _2153 = trunc(_1817);
    int _2155 = int(_2153);
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2147);
    int _2163 = _1935 * _2119;
    int _2165 = _2163 + _2143;
    bool _2167 = !_2159;
    int _2169 = _2167 ? 0 : 1;
    bool _2171 = !_2139;
    int _2173 = _2171 ? 0 : 1;
    float _2175 = trunc(_1793);
    int _2177 = int(_2175);
    float _2179 = float(uint(_2151));
    int _2181 = abs(_2169);
    int _2183 = _1885 * _2161;
    int _2185 = _2183 + _2165;
    int _2187 = abs(_2173);
    float _2189 = as_type<float>(_1330) * _2179;
    int _2191 = _1272 + (-1);
    bool _2193 = !_2135;
    int _2195 = _2193 ? 0 : 1;
    float _2197 = trunc(_2189);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = ~_1983;
    int _2205 = _2203 + 1;
    int _2207 = _2205 + 1;
    int _2209 = _1905 * _2191;
    int _2211 = _2209 + _2045;
    int _2213 = abs(_2195);
    float _2215 = in.m_73.y;
    int _2217 = _2207 * _2041;
    float _2219 = float(uint(_2185));
    int _2221 = _2211 * _2187;
    int _2223 = _1306 + (-1);
    int _2225 = _2155 * _2181;
    int _2227 = _2225 + _1362;
    int _2229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2231 = _2229 != 0;
    float _2233 = as_type<float>(_1352) * _2219;
    int _2235 = _2177 * _2213;
    int _2237 = _2235 + _2221;
    int _2239 = ~_1220;
    int _2241 = _2239 + 1;
    int _2243 = _1983 * _2223;
    int _2245 = _2243 + _2217;
    bool _2247 = !_2231;
    int _2249 = _2247 ? 0 : 1;
    float _2251 = trunc(_2233);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2259 = _2257 != 0;
    int _2261 = abs(_2249);
    int _2263 = _2241 * int(_2201);
    int _2265 = _2263 + _2151;
    bool _2267 = !_2259;
    int _2269 = _2267 ? 0 : 1;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2273 = _2271 != 0;
    int _2275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2277 = _2275 != 0;
    float _2279 = trunc(_1797);
    int _2281 = int(_2279);
    int _2283 = ~_1292;
    int _2285 = _2283 + 1;
    float _2287 = float(uint(_2265));
    int _2289 = _2037 * _2261;
    int _2291 = _2289 + _2237;
    bool _2293 = !_2277;
    int _2295 = _2293 ? 0 : 1;
    float _2297 = -_2215;
    float _2299 = _2297 + 1.0;
    float _2301 = as_type<float>(_1330) * _2287;
    bool _2303 = !_2273;
    int _2305 = _2303 ? 0 : 1;
    int _2307 = abs(_2295);
    int _2309 = _2285 * int(_2255);
    int _2311 = _2309 + _2185;
    int _2313 = abs(_2269);
    float _2315 = trunc(_2301);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2323 = _2321 != 0;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2327 = _2325 != 0;
    int _2329 = abs(_2305);
    float _2331 = float(uint(_2311));
    int _2333 = _2245 * _2307;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = _1947 * _2313;
    int _2341 = _2339 + _2291;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2345 = _2343 != 0;
    float _2347 = as_type<float>(_1352) * _2331;
    int _2349 = abs(_2337);
    float _2351 = float(uint(_2341));
    float _2353 = trunc(_2347);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    int _2359 = _2281 * _2329;
    int _2361 = _2359 + _2333;
    bool _2363 = !_2327;
    int _2365 = _2363 ? 0 : 1;
    float _2367 = as_type<float>(_1334) * _2351;
    int _2369 = int(_2201) + int(_2319);
    int _2371 = _2227 * _2349;
    int _2373 = _2371 + _2361;
    int _2375 = ~_1220;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2367);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = abs(_2365);
    float _2387 = in.m_63.w;
    int _2389 = _2377 * _2369;
    int _2391 = _2389 + _2151;
    int _2393 = ~_1272;
    int _2395 = _2393 + 1;
    int _2397 = _2155 * _2385;
    int _2399 = _2397 + _2373;
    int _2401 = ~_1292;
    int _2403 = _2401 + 1;
    int _2405 = _2155;
    float _2407 = as_type<float>(_1957);
    float _2409 = as_type<float>(_1839);
    if (_2345)
    {
        float _2411 = -_1160;
        float _2413 = _2411 + 1.0;
        _2405 = as_type<int>(_2413);
    }
    int _2415 = _2405;
    bool _2417 = uint(_2391) >= uint(_1220);
    int _2419 = int(_2255) + int(_2357);
    bool _2421 = !_2417;
    int _2423 = _2421 ? 0 : (-1);
    int _2425 = _2403 * _2419;
    int _2427 = _2425 + _2185;
    float _2429 = float(uint(_2399));
    int _2431 = _2395 * int(_2383);
    int _2433 = _2431 + _2341;
    bool _2435 = _1166 > 0.5;
    int _2437 = ~_2369;
    int _2439 = _2437 + _2423;
    int _2441 = _2439 + 1;
    float _2443 = as_type<float>(_1533) * _2429;
    if (_2345)
    {
        float _2445 = _2435 ? as_type<float>(_2415) : _1160;
        _1230 = _2445;
    }
    float _2447 = _1230;
    bool _2449 = uint(_2427) >= uint(_1292);
    int _2451 = _1220 * _2441;
    int _2453 = _2451 + _2151;
    float _2455 = float(uint(_2433));
    float _2457 = trunc(_2443);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    bool _2463 = _1220 == 0;
    bool _2465 = !_2449;
    int _2467 = _2465 ? 0 : (-1);
    bool _2469 = _2387 > 0.5;
    float _2471 = as_type<float>(_1334) * _2455;
    bool _2473 = !_2463;
    int _2475 = _2473 ? _2453 : (-1);
    int _2477 = _2469 ? as_type<int>(_2299) : as_type<int>(_2215);
    float _2479 = trunc(_2471);
    float _2481 = precise::max(_2479, 0.0);
    uint _2483 = uint(_2481);
    int _2485 = _2475 & 3;
    bool _2487 = _2485 != 0;
    int _2489 = _2475 & 3;
    bool _2491 = _2489 != 0;
    bool _2493 = uint(_2485) >= 2u;
    int _2495 = _2491 ? 0 : 1;
    int _2497 = ~_2419;
    int _2499 = _2497 + _2467;
    int _2501 = _2499 + 1;
    bool _2503 = uint(_2485) > 1u;
    int _2505 = ~_1306;
    int _2507 = _2505 + 1;
    int _2509 = _1292 * _2501;
    int _2511 = _2509 + _2185;
    int _2513 = _2493 ? 0 : 1;
    bool _2515 = _2485 != 3;
    int _2517 = _2507 * int(_2461);
    int _2519 = _2517 + _2399;
    int _2521 = _2435 ? as_type<int>(_2299) : as_type<int>(_2215);
    bool _2523 = _1292 == 0;
    int _2525 = ~_1272;
    int _2527 = _2525 + 1;
    bool _2529 = !_2523;
    int _2531 = _2529 ? _2511 : (-1);
    int _2533 = int(_2383) + int(_2483);
    float _2535 = float(uint(_2519));
    int _2537 = ~_2495;
    int _2539 = _2537 + 1;
    int _2541 = _2539 + 1;
    float _2543 = as_type<float>(_1533) * _2535;
    int _2545 = _2541;
    if (!_2503)
    {
        int _2547 = ~_2495;
        int _2549 = _2547 + 1;
        _2545 = _2549;
    }
    int _2551 = _2545;
    int _2553 = _2531 & 3;
    bool _2555 = _2553 != 0;
    int _2557 = _2527 * _2533;
    int _2559 = _2557 + _2341;
    int _2561 = ~_2513;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2565;
    if (_2515)
    {
        int _2569 = ~_2513;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    bool _2575 = uint(_2553) >= 2u;
    float _2577 = trunc(_2543);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    int _2583 = _2555 ? 0 : 1;
    bool _2585 = uint(_2559) >= uint(_1272);
    int _2587 = _2575 ? 0 : 1;
    bool _2589 = _2553 != 3;
    bool _2591 = !_2585;
    int _2593 = _2591 ? 0 : (-1);
    bool _2595 = uint(_2553) > 1u;
    int _2597 = ~_2533;
    int _2599 = _2597 + _2593;
    int _2601 = _2599 + 1;
    int _2603 = ~_2587;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    bool _2609 = _1272 == 0;
    int _2611 = _1272 * _2601;
    int _2613 = _2611 + _2341;
    int _2615 = ~_2583;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2607;
    int _2623 = _2619;
    if (_2589)
    {
        int _2625 = ~_2587;
        int _2627 = _2625 + 1;
        _2621 = _2627;
    }
    int _2629 = _2621;
    int _2631 = ~_1306;
    int _2633 = _2631 + 1;
    int _2635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2637 = _2635 != 0;
    if (!_2595)
    {
        int _2639 = ~_2583;
        int _2641 = _2639 + 1;
        _2623 = _2641;
    }
    int _2643 = _2623;
    bool _2645 = !_2609;
    int _2647 = _2645 ? _2613 : (-1);
    int _2649 = int(_2461) + int(_2581);
    bool _2651 = !_2637;
    int _2653 = _2651 ? 0 : 1;
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2657 = _2655 != 0;
    int _2659 = _2633 * _2649;
    int _2661 = _2659 + _2399;
    int _2663 = _2647 & 3;
    bool _2665 = _2663 != 0;
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : 1;
    bool _2671 = uint(_2663) >= 2u;
    int _2673 = _2665 ? 0 : 1;
    bool _2675 = uint(_2661) >= uint(_1306);
    int _2677 = _2671 ? 0 : 1;
    bool _2679 = _2663 != 3;
    bool _2681 = !_2675;
    int _2683 = _2681 ? 0 : (-1);
    bool _2685 = uint(_2663) > 1u;
    int _2687 = ~_2649;
    int _2689 = _2687 + _2683;
    int _2691 = _2689 + 1;
    int _2693 = ~_2677;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    bool _2699 = _1306 == 0;
    int _2701 = _1306 * _2691;
    int _2703 = _2701 + _2399;
    int _2705 = ~_2673;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = _2697;
    int _2713 = _2709;
    if (_2679)
    {
        int _2715 = ~_2677;
        int _2717 = _2715 + 1;
        _2711 = _2717;
    }
    int _2719 = _2711;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2723 = _2721 != 0;
    bool _2725 = !_2699;
    int _2727 = _2725 ? _2703 : (-1);
    float _2729 = _2723 ? as_type<float>(_2521) : _2215;
    if (!_2685)
    {
        int _2731 = ~_2673;
        int _2733 = _2731 + 1;
        _2713 = _2733;
    }
    int _2735 = _2713;
    int _2737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2739 = _2737 != 0;
    int _2741 = _2727 & 3;
    bool _2743 = _2741 != 0;
    bool _2745 = !_2739;
    int _2747 = _2745 ? 0 : 1;
    bool _2749 = uint(_2741) >= 2u;
    int _2751 = _2743 ? 0 : 1;
    int _2753 = _2749 ? 0 : 1;
    bool _2755 = _2741 != 3;
    bool _2757 = uint(_2741) > 1u;
    int _2759 = ~_2753;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = ~_2751;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2773 = _2771 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2775 = _2763;
    int _2777 = _2769;
    if (_2755)
    {
        int _2779 = ~_2753;
        int _2781 = _2779 + 1;
        _2775 = _2781;
    }
    int _2783 = _2775;
    float _2785 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2787 = _2785 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2757)
    {
        int _2789 = ~_2751;
        int _2791 = _2789 + 1;
        _2777 = _2791;
    }
    int _2793 = _2777;
    float _2795 = 1.0 / _2773;
    float _2797 = in.m_48.x;
    float _2799 = in.m_48.y;
    float _2801 = in.m_48.z;
    bool _2803 = _1493 > 0.5;
    float _2805 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2809 = _2807 != 0;
    int _2811 = _2803 ? as_type<int>(_2299) : as_type<int>(_2215);
    float _2813 = _2809 ? as_type<float>(_2477) : _2215;
    float _2815 = 1.0 / _2787;
    int _2817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2819 = _2817 != 0;
    int _2821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2823 = _2821 != 0;
    float _2825 = _2819 ? as_type<float>(_2811) : _2215;
    float _2827 = _2823 ? as_type<float>(_2811) : _2215;
    bool _2829 = !_1591;
    float _2831 = _2829 ? as_type<float>(_1495) : as_type<float>(_1497);
    bool _2833 = !_1591;
    float _2835 = _2833 ? as_type<float>(_1499) : as_type<float>(_1495);
    float _2837 = _202 * _2799;
    float _2839 = _196 * _2799;
    float _2841 = _208 * _2799;
    float _2843 = fma(_200, _2797, _2837);
    float _2845 = fma(_194, _2797, _2839);
    float _2847 = fma(_206, _2797, _2841);
    if (!_1591)
    {
        _1675 = _1493;
    }
    float _2849 = _1675;
    float _2851 = fma(_204, _2801, _2843);
    float _2853 = fma(_198, _2801, _2845);
    float _2855 = 0.0;
    float _2857 = _2849;
    if (!_1591)
    {
        _2855 = _1493;
    }
    float _2859 = _2855;
    float _2861 = as_type<float>(_1495) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2863 = _2859;
    if (!_1591)
    {
        _1639 = _1166;
    }
    float _2865 = _1639;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2869 = 0.0;
    float _2871 = _2865;
    if (!_1591)
    {
        _2869 = _1166;
    }
    float _2873 = _2869;
    float _2875 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2877 = _2873;
    if (_1603)
    {
        _2407 = _1481;
    }
    float _2879 = _2407;
    float _2881 = fma(as_type<float>(_1495), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2867);
    float _2883 = _2879;
    if (_1591)
    {
        _2857 = _1166;
    }
    float _2885 = _2857;
    float _2887 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2889 = log2(_2887);
    if (_1591)
    {
        _2863 = _1166;
    }
    float _2891 = _2863;
    float _2893 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1603)
    {
        _2409 = _1166;
    }
    float _2895 = _2409;
    float _2897 = fma(_210, _2801, _2847);
    float _2899 = _2895;
    if (_1591)
    {
        _2871 = _1481;
    }
    float _2901 = _2871;
    float _2903 = fma(_2835, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1731);
    if (_1591)
    {
        _2877 = _1481;
    }
    float _2905 = _2877;
    float _2907 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1603)
    {
        _2883 = _1493;
    }
    float _2909 = _2883;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1603)
    {
        _2899 = _1481;
    }
    float _2913 = _2899;
    float _2915 = fma(_2907, -2.0, _1757);
    int _2917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2919 = _2917 != 0;
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2923 = _2921 != 0;
    float _2925 = fma(as_type<float>(_1497), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2911);
    int _2927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2929 = _2927 != 0;
    float _2931 = _2889 * _164;
    float _2933 = as_type<float>(_1497) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2935 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2939 = exp2(_2931);
    float _2941 = _2919 ? as_type<float>(_2811) : _2215;
    float _2943 = fma(_2875, -2.0, _2937);
    bool _2945 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2947 = isnan(0.0);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2953 = _2949 || _2951;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2955;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2963 = _2957 * _2795;
    float _2965 = fma(_2861, -2.0, _2959);
    float _2967 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2961);
    float _2969 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2973 = -_2939;
    float _2975 = _2973 + 1.0;
    float _2977 = -_2971;
    float _2979 = fma(_2893, 2.0, _2977);
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2983 = _2953 ? _2975 : 0.0;
    float _2985 = -_2805;
    float _2987 = fma(_2969, 2.0, _2985);
    float _2989 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2993 = -_2981;
    float _2995 = fma(_2933, 2.0, _2993);
    float _2997 = fma(_2891, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2989);
    float _2999 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3003 = _3001 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3007 = fma(_2999, -2.0, _1735);
    float _3009 = _2923 ? as_type<float>(_2811) : _2215;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3013 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3015 = _3013 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3017 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3019 = _3017 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3021 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3023 = isnan(1.0);
    bool _3025 = _3021 || _3023;
    bool _3027 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3029 = _3025 || _3027;
    float _3031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3033 = 1.0 + _3031;
    float _3035 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2991);
    float _3037 = 1.0 / _3033;
    float _3039 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3005);
    float _3041 = _1481 * 2.0;
    float _3043 = fma(_2831, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3011);
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3051 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3053 = 1.0 / _3003;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3057 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3061 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3039);
    float _3063 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3045);
    float _3065 = -_3049;
    float _3067 = fma(_3051, 2.0, _3065);
    float _3069 = floor(_3041);
    float _3071 = -_3047;
    float _3073 = fma(_2935, 2.0, _3071);
    float _3075 = fma(_3057, -2.0, _3055);
    float _3077 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3059);
    float _3079 = _3015 * _2815;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3085 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3063);
    float _3087 = 1.0 / _3019;
    float _3089 = -_164;
    float _3091 = fma(_3089, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2995);
    float _3093 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2965);
    float _3095 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2943);
    float _3097 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3035);
    float _3099 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3077);
    float _3101 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2925);
    float _3103 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2881);
    float _3105 = -_164;
    float _3107 = fma(_3105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2979);
    float _3109 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3043);
    float _3111 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2903);
    float _3113 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2967);
    float _3115 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2997);
    float _3117 = -_164;
    float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3067);
    float _3121 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2915);
    float _3123 = -_164;
    float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3073);
    float _3127 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3007);
    float _3129 = -_164;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2987);
    float _3133 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3075);
    if (_3029)
    {
        float _3135 = _2983 * _3037;
        _168 = _3135;
    }
    float _3137 = _168;
    float _3139 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3141 = _3139 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3143 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3145 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3143;
    float _3147 = 1.0 / _3083;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3149;
    float _3153 = _3145 * _3053;
    bool _3155 = _3069 >= 0.0;
    bool _3157 = isnan(_3069);
    bool _3159 = _3155 || _3157;
    bool _3161 = isnan(0.0);
    bool _3163 = _3159 || _3161;
    float _3165 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3167 = _3165 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3173 = _3151 * _3087;
    float _3175 = float(uint(_1935));
    float _3177 = 1.0 / _3141;
    int _3179 = _3163 ? 0 : 1;
    float _3181 = in.m_57.w;
    bool _3183 = _3069 > 0.0;
    float _3185 = as_type<float>(_1352) * _3175;
    float _3187 = float(uint(_1911));
    float _3189 = _3171 * _3147;
    float _3191 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3193 = _3191 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3195 = 1.0 / _3167;
    float _3197 = as_type<float>(_1330) * _3187;
    int _3199 = ~_1292;
    int _3201 = _3199 + 1;
    float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3205 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3203;
    int _3207 = ~_1272;
    int _3209 = _3207 + 1;
    float _3211 = _3193 * _3177;
    int _3213 = ~_3179;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    float _3219 = trunc(_3185);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    int _3225 = _3217;
    if (!_3183)
    {
        int _3227 = ~_3179;
        int _3229 = _3227 + 1;
        _3225 = _3229;
    }
    int _3231 = _3225;
    float _3233 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3235 = _1154 + _3233;
    float _3237 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3239 = _1154 + _3237;
    bool _3241 = _2051 >= 0.0;
    bool _3243 = isnan(_2051);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_2963, _3235, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3255 = _1154 + _3253;
    float _3257 = trunc(_3197);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    float _3263 = fma(_3079, _3239, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3265 = _3205 * _3195;
    float _3267 = fma(_3189, _3255, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3271 = _1154 + _3269;
    int _3273 = ~_1220;
    int _3275 = _3273 + 1;
    int _3277 = _3249 ? 0 : 1;
    int _3279 = _3201 * int(_3223);
    int _3281 = _3279 + _1935;
    float _3283 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3285 = _1154 + _3283;
    bool _3287 = _2051 > 0.0;
    float _3289 = float(uint(_2227));
    float _3291 = fma(_3153, _3285, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3293 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3295 = _1154 + _3293;
    int _3297 = ~_1306;
    int _3299 = _3297 + 1;
    int _3301 = _3275 * int(_3261);
    int _3303 = _3301 + _1911;
    float _3305 = as_type<float>(_1533) * _3289;
    float _3307 = fma(_3173, _3295, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3309 = fma(_3211, _3271, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3311 = float(uint(_3281));
    float _3313 = float(uint(_2037));
    float _3315 = trunc(_3305);
    float _3317 = precise::max(_3315, 0.0);
    uint _3319 = uint(_3317);
    float _3321 = float(uint(_3303));
    float _3323 = as_type<float>(_1352) * _3311;
    bool _3325 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3327 = isnan(_1154);
    bool _3329 = _3325 || _3327;
    bool _3331 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3333 = _3329 || _3331;
    float _3335 = float(_3333);
    float _3337 = as_type<float>(_1334) * _3313;
    bool _3339 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3341 = isnan(_1154);
    bool _3343 = _3339 || _3341;
    bool _3345 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3347 = _3343 || _3345;
    float _3349 = float(_3347);
    float _3351 = as_type<float>(_1330) * _3321;
    bool _3353 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3355 = isnan(_1154);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3361 = _3357 || _3359;
    float _3363 = float(_3361);
    float _3365 = -_3335;
    float _3367 = _3365 + 1.0;
    bool _3369 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3371 = isnan(_1154);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3377 = _3373 || _3375;
    float _3379 = float(_3377);
    float _3381 = trunc(_3337);
    float _3383 = precise::max(_3381, 0.0);
    uint _3385 = uint(_3383);
    int _3387 = _2531 & 3;
    bool _3389 = _3387 != 0;
    float _3391 = -_3363;
    float _3393 = _3391 + 1.0;
    float _3395 = _3363 * _3367;
    bool _3397 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3399 = isnan(_1154);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3405 = _3401 || _3403;
    float _3407 = float(_3405);
    float _3409 = _3349 * _3393;
    float _3411 = -_3349;
    float _3413 = _3411 + 1.0;
    float _3415 = trunc(_3351);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    bool _3421 = _2741 != 3;
    float _3423 = _3379 * _3413;
    float _3425 = -_3379;
    float _3427 = _3425 + 1.0;
    bool _3429 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3431 = isnan(_1154);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    bool _3441 = !_3421;
    int _3443 = _3441 ? 0 : (-1);
    int _3445 = _3209 * int(_3385);
    int _3447 = _3445 + _2037;
    float _3449 = _3407 * _3427;
    float _3451 = -_3407;
    float _3453 = _3451 + 1.0;
    bool _3455 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3457 = isnan(_1154);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = -_3439;
    float _3469 = _3467 + 1.0;
    float _3471 = float(uint(_3447));
    float _3473 = _3439 * _3453;
    bool _3475 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3477 = isnan(_1154);
    bool _3479 = _3475 || _3477;
    bool _3481 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3483 = _3479 || _3481;
    float _3485 = float(_3483);
    float _3487 = _3465 * _3469;
    float _3489 = -_3465;
    float _3491 = _3489 + 1.0;
    float _3493 = as_type<float>(_1334) * _3471;
    float _3495 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3497 = _1154 + _3495;
    float _3499 = _2853 + _3181;
    float _3501 = trunc(_3323);
    float _3503 = precise::max(_3501, 0.0);
    uint _3505 = uint(_3503);
    int _3507 = _3299 * int(_3319);
    int _3509 = _3507 + _2227;
    float _3511 = _3485 * _3491;
    float _3513 = fma(_3265, _3497, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3515 = _2851 + _1615;
    float _3517 = -_3485;
    float _3519 = _3517 + 1.0;
    float _3521 = float(uint(_3509));
    float _3523 = _3251 * _3511;
    float _3525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3527 = ~_3277;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = fma(_3519, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3523);
    float _3535 = as_type<float>(_1533) * _3521;
    float _3537 = _2897 + _1651;
    int _3539 = _3531;
    if (!_3287)
    {
        int _3541 = ~_3277;
        int _3543 = _3541 + 1;
        _3539 = _3543;
    }
    int _3545 = _3539;
    float _3547 = fma(_3263, _3487, _3533);
    float _3549 = trunc(_3493);
    float _3551 = precise::max(_3549, 0.0);
    uint _3553 = uint(_3551);
    int _3555 = ~_1220;
    int _3557 = _3555 + 1;
    int _3559 = int(_3261) + int(_3419);
    float _3561 = fma(_3291, _3473, _3547);
    int _3563 = ~_1292;
    int _3565 = _3563 + 1;
    int _3567 = int(_3223) + int(_3505);
    float _3569 = trunc(_3535);
    float _3571 = precise::max(_3569, 0.0);
    uint _3573 = uint(_3571);
    int _3575 = _3557 * _3559;
    int _3577 = _3575 + _1911;
    float _3579 = _3525 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3581 = !_2929;
    int _3583 = _3581 ? 0 : 1;
    float _3585 = fma(_3267, _3449, _3561);
    int _3587 = ~_1272;
    int _3589 = _3587 + 1;
    int _3591 = _3565 * _3567;
    int _3593 = _3591 + _1935;
    int _3595 = int(_3385) + int(_3553);
    float _3597 = fma(_3579, _1268, -0.5);
    bool _3599 = uint(_3577) >= uint(_1220);
    float _3601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3603 = _3515 + _3601;
    int _3605 = ~_1306;
    int _3607 = _3605 + 1;
    int _3609 = _3589 * _3595;
    int _3611 = _3609 + _2037;
    bool _3613 = !_3599;
    int _3615 = _3613 ? 0 : (-1);
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3619 = _3499 + _3617;
    bool _3621 = uint(_3593) >= uint(_1292);
    float _3623 = _1493 * 2.0;
    int _3625 = int(_3319) + int(_3573);
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3629 = _3537 + _3627;
    float _3631 = fma(_3307, _3423, _3585);
    bool _3633 = !_3621;
    int _3635 = _3633 ? 0 : (-1);
    float _3637 = floor(_3623);
    bool _3639 = uint(_3611) >= uint(_1272);
    float _3641 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3643 = _3607 * _3625;
    int _3645 = _3643 + _2227;
    int _3647 = ~_3559;
    int _3649 = _3647 + _3615;
    int _3651 = _3649 + 1;
    float _3653 = fma(_3309, _3409, _3631);
    float _3655 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3641);
    bool _3657 = !_3639;
    int _3659 = _3657 ? 0 : (-1);
    float _3661 = _1166 + _1493;
    bool _3663 = uint(_3645) >= uint(_1306);
    float _3665 = fma(_3629, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    int _3667 = ~_3567;
    int _3669 = _3667 + _3635;
    int _3671 = _3669 + 1;
    float _3673 = _1166 + _1481;
    bool _3675 = !_3663;
    int _3677 = _3675 ? 0 : (-1);
    float _3679 = fma(_3513, _3395, _3653);
    bool _3681 = _3665 >= 0.0;
    int _3683 = _1220 * _3651;
    int _3685 = _3683 + _1911;
    float _3687 = _3673 + (-1.0);
    int _3689 = _1292 * _3671;
    int _3691 = _3689 + _1935;
    bool _3693 = !_3389;
    int _3695 = _3693 ? 0 : 1;
    float _3697 = fma(_3335, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3679);
    float _3699 = fma(_3687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3701 = _3603 * _3603;
    int _3703 = _2647 & 3;
    bool _3705 = _3703 != 0;
    float _3707 = _3661 + (-1.0);
    int _3709 = _2475 >> 31;
    float _3711 = fma(_3619, _3619, _3701);
    bool _3713 = !_3705;
    int _3715 = _3713 ? 0 : 1;
    float _3717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3719 = _2727 & 3;
    bool _3721 = _3719 != 0;
    float _3723 = fma(_3629, _3629, _3711);
    bool _3725 = !_2487;
    int _3727 = _3725 ? 0 : 1;
    out.m_75.x = _3697;
    bool _3729 = !_3721;
    int _3731 = _3729 ? 0 : 1;
    float _3733 = _1166 + (-0.5);
    bool _3735 = _2485 != 3;
    float _3737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3681)
    {
        out.m_51.x = 0.0;
    }
    bool _3739 = _3637 > 0.0;
    bool _3741 = _3637 >= 0.0;
    bool _3743 = isnan(_3637);
    bool _3745 = _3741 || _3743;
    bool _3747 = isnan(0.0);
    bool _3749 = _3745 || _3747;
    float _3751 = fma(_3707, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3753 = _3637;
    if (_3681)
    {
        _3753 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3755 = _3753;
    float _3757 = rsqrt(_3723);
    int _3759 = _3709 & 3;
    int _3761 = _2531 >> 31;
    int _3763 = as_type<int>(_3755);
    if (_3681)
    {
        float _3765 = _3755 * 5.0;
        _3763 = as_type<int>(_3765);
    }
    int _3767 = _3763;
    int _3769 = _2475 + _3759;
    int _3771 = _2647 >> 31;
    int _3773 = _3769 >> 2;
    if (_3681)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12335 = as_type<float>(_3767);
        out.gl_Position.z = _12335;
    }
    int _3775 = _3761 & 3;
    int _3777 = _3771 & 3;
    int _3779 = _3773 << 4;
    int _3781 = _3779 + 368;
    float _3783 = _3603 * _3757;
    int _3785 = _2647 + _3777;
    float _3787 = _3619 * _3757;
    int _3789 = _2531 + _3775;
    float _3791 = -_3783;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3603);
    float _3795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3797 = _2727 >> 31;
    float _3799 = -_3787;
    float _3801 = fma(_3799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3619);
    float _3803 = _3793 * _3793;
    int _3805 = _3785 >> 2;
    float _3807 = _3629 * _3757;
    int _3809 = _3797 & 3;
    float _3811 = fma(_3801, _3801, _3803);
    uint _3813 = uint(int(uint(_3781) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = _3805 << 4;
    int _3831 = _3829 + 656;
    float _3833 = -_3807;
    float _3835 = fma(_3833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3629);
    int _3837 = _2727 + _3809;
    bool _3839 = !_3735;
    int _3841 = _3839 ? 0 : (-1);
    int _3843 = _3837 >> 2;
    float _3845 = _3795 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3847 = uint(int(uint(_3831) >> uint(2)));
    uint _3849 = uint(int(uint(int(_3847)) >> uint(2)));
    int _3851 = int(_3847) & 3;
    float _3853 = (*spvDescriptorSet0.vp_c9)._m0[int(_3849)][_3851];
    int _3855 = int(_3847) + 1;
    uint _3857 = uint(int(uint(_3855) >> uint(2)));
    int _3859 = _3855 & 3;
    float _3861 = (*spvDescriptorSet0.vp_c9)._m0[int(_3857)][_3859];
    int _3863 = _3789 >> 2;
    bool _3865 = _2553 != 3;
    float _3867 = fma(_3845, _2941, -0.5);
    int _3869 = _3863 << 4;
    int _3871 = _3869 + 512;
    float _3873 = fma(_3835, _3835, _3811);
    bool _3875 = !_3865;
    int _3877 = _3875 ? 0 : (-1);
    float _3879 = -_3121;
    float _3881 = fma(_3111, _3867, _3879);
    bool _3883 = _2663 != 3;
    uint _3885 = uint(int(uint(_3871) >> uint(2)));
    uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
    int _3889 = int(_3885) & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    int _3893 = int(_3885) + 1;
    uint _3895 = uint(int(uint(_3893) >> uint(2)));
    int _3897 = _3893 & 3;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[int(_3895)][_3897];
    int _3901 = _3843 << 4;
    int _3903 = _3901 + 800;
    float _3905 = _3009 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3907 = ~_3625;
    int _3909 = _3907 + _3677;
    int _3911 = _3909 + 1;
    float _3913 = _1673 * _3717;
    int _3915 = ~_3595;
    int _3917 = _3915 + _3659;
    int _3919 = _3917 + 1;
    float _3921 = _3905 * _3737;
    int _3923 = abs(_2551);
    float _3925 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3927 = int(_3925);
    bool _3929 = !_2463;
    int _3931 = _3929 ? _3685 : (-1);
    int _3933 = _3831 + 8;
    uint _3935 = uint(int(uint(_3933) >> uint(2)));
    uint _3937 = uint(int(uint(int(_3935)) >> uint(2)));
    int _3939 = int(_3935) & 3;
    float _3941 = (*spvDescriptorSet0.vp_c9)._m0[int(_3937)][_3939];
    int _3943 = int(_3935) + 1;
    uint _3945 = uint(int(uint(_3943) >> uint(2)));
    int _3947 = _3943 & 3;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[int(_3945)][_3947];
    bool _3951 = !_2523;
    int _3953 = _3951 ? _3691 : (-1);
    out.m_77.x = _3913;
    out.m_77.y = _3921;
    int _3955 = _3749 ? 0 : 1;
    int _3957 = _1272 * _3919;
    int _3959 = _3957 + _2037;
    int _3961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3963 = _3961 != 0;
    int _3965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3967 = _3965 != 0;
    int _3969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3971 = _3969 != 0;
    int _3973 = _1306 * _3911;
    int _3975 = _3973 + _2227;
    int _3977 = ~_3955;
    int _3979 = _3977 + 1;
    int _3981 = _3979 + 1;
    uint _3983 = uint(int(uint(_3903) >> uint(2)));
    uint _3985 = uint(int(uint(int(_3983)) >> uint(2)));
    int _3987 = int(_3983) & 3;
    float _3989 = (*spvDescriptorSet0.vp_c9)._m0[int(_3985)][_3987];
    int _3991 = int(_3983) + 1;
    uint _3993 = uint(int(uint(_3991) >> uint(2)));
    int _3995 = _3991 & 3;
    float _3997 = (*spvDescriptorSet0.vp_c9)._m0[int(_3993)][_3995];
    int _3999 = _3981;
    if (!_3739)
    {
        int _4001 = ~_3955;
        int _4003 = _4001 + 1;
        _3999 = _4003;
    }
    int _4005 = _3999;
    float _4007 = fma(_3109, _3597, _3119);
    int _4009 = abs(_2643);
    float _4011 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4013 = int(_4011);
    int _4015 = ~_3923;
    int _4017 = _4015 + 1;
    int _4019 = _4017 + 1;
    int _4021 = abs(_2735);
    int _4023 = _3781 + 8;
    uint _4025 = uint(int(uint(_4023) >> uint(2)));
    uint _4027 = uint(int(uint(int(_4025)) >> uint(2)));
    int _4029 = int(_4025) & 3;
    float _4031 = (*spvDescriptorSet0.vp_c9)._m0[int(_4027)][_4029];
    int _4033 = int(_4025) + 1;
    uint _4035 = uint(int(uint(_4033) >> uint(2)));
    int _4037 = _4033 & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = abs(_3715);
    int _4043 = _4019 * as_type<int>(_3827);
    int _4045 = abs(_3727);
    int _4047 = abs(_2793);
    int _4049 = _3871 + 8;
    uint _4051 = uint(int(uint(_4049) >> uint(2)));
    uint _4053 = uint(int(uint(int(_4051)) >> uint(2)));
    int _4055 = int(_4051) & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = int(_4051) + 1;
    uint _4061 = uint(int(uint(_4059) >> uint(2)));
    int _4063 = _4059 & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = ~_4045;
    int _4069 = _4067 + 1;
    int _4071 = _4069 + 1;
    int _4073 = ~_4021;
    int _4075 = _4073 + 1;
    int _4077 = _4075 + 1;
    int _4079 = ~_4041;
    int _4081 = _4079 + 1;
    int _4083 = _4081 + 1;
    int _4085 = _3903 + 8;
    uint _4087 = uint(int(uint(_4085) >> uint(2)));
    uint _4089 = uint(int(uint(int(_4087)) >> uint(2)));
    int _4091 = int(_4087) & 3;
    float _4093 = (*spvDescriptorSet0.vp_c9)._m0[int(_4089)][_4091];
    int _4095 = int(_4087) + 1;
    uint _4097 = uint(int(uint(_4095) >> uint(2)));
    int _4099 = _4095 & 3;
    float _4101 = (*spvDescriptorSet0.vp_c9)._m0[int(_4097)][_4099];
    int _4103 = abs(_3695);
    int _4105 = _4077 * as_type<int>(_3861);
    int _4107 = abs(_2719);
    int _4109 = _4071 * as_type<int>(_3819);
    int _4111 = _4109 + _4043;
    int _4113 = abs(_2573);
    int _4115 = _4083 * as_type<int>(_3853);
    int _4117 = _4115 + _4105;
    int _4119 = abs(_3731);
    int _4121 = ~_4009;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = abs(_2629);
    int _4129 = _4125 * as_type<int>(_3899);
    int _4131 = ~_4107;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    float _4137 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4139 = int(_4137);
    int _4141 = ~_4047;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    int _4147 = ~_4119;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    int _4153 = _4135 * as_type<int>(_3941);
    int _4155 = _4153 + _4117;
    int _4157 = ~_4103;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4145 * as_type<int>(_3997);
    int _4165 = ~_4113;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = _4161 * as_type<int>(_3891);
    int _4173 = _4171 + _4129;
    int _4175 = abs(_3841);
    int _4177 = _4151 * as_type<int>(_3989);
    int _4179 = _4177 + _4163;
    int _4181 = ~_4127;
    int _4183 = _4181 + 1;
    int _4185 = _4183 + 1;
    float _4187 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4189 = int(_4187);
    int _4191 = abs(_2783);
    int _4193 = _4169 * as_type<int>(_4031);
    int _4195 = _4193 + _4111;
    bool _4197 = !_3883;
    int _4199 = _4197 ? 0 : (-1);
    int _4201 = ~_4175;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = ~_4191;
    int _4209 = _4207 + 1;
    int _4211 = _4209 + 1;
    int _4213 = abs(_3877);
    int _4215 = _4185 * as_type<int>(_4057);
    int _4217 = _4215 + _4173;
    int _4219 = abs(_4199);
    int _4221 = _4205 * as_type<int>(_4039);
    int _4223 = _4221 + _4195;
    float _4225 = float(uint(_4013));
    int _4227 = ~_4213;
    int _4229 = _4227 + 1;
    int _4231 = _4229 + 1;
    int _4233 = abs(_3443);
    int _4235 = _4211 * as_type<int>(_4093);
    int _4237 = _4235 + _4179;
    float _4239 = float(uint(_3927));
    float _4241 = 1.0 / _4225;
    int _4243 = ~_4219;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    int _4249 = _4231 * as_type<int>(_4065);
    int _4251 = _4249 + _4217;
    int _4253 = abs(_2653);
    int _4255 = ~_4233;
    int _4257 = _4255 + 1;
    int _4259 = _4257 + 1;
    int _4261 = _4247 * as_type<int>(_3949);
    int _4263 = _4261 + _4155;
    int _4265 = abs(_4013);
    float _4267 = 1.0 / _4239;
    int _4269 = abs(_2669);
    int _4271 = _4259 * as_type<int>(_4101);
    int _4273 = _4271 + _4237;
    int _4275 = ~_4253;
    int _4277 = _4275 + 1;
    int _4279 = _4277 + 1;
    float _4281 = float(uint(_4139));
    float _4283 = float(uint(_4265));
    int _4285 = _4223 * _4279;
    int _4287 = abs(_4139);
    int _4289 = ~_4269;
    int _4291 = _4289 + 1;
    int _4293 = _4291 + 1;
    float _4295 = 1.0 / _4283;
    int _4297 = _3931 * _4253;
    int _4299 = _4297 + _4285;
    int _4301 = abs(_2747);
    int _4303 = _4293 * _4251;
    float _4305 = float(uint(_4189));
    int _4307 = abs(_3927);
    float _4309 = 1.0 / _4281;
    int _4311 = abs(_4189);
    int _4313 = _3953 * _4269;
    int _4315 = _4313 + _4303;
    int _4317 = ~_4301;
    int _4319 = _4317 + 1;
    int _4321 = _4319 + 1;
    bool _4323 = _1272 == 0;
    int _4325 = _4321 * _4263;
    int _4327 = as_type<int>(_4241) + (-2);
    float _4329 = 1.0 / _4305;
    float _4331 = float(uint(_4299));
    float _4333 = float(uint(_4287));
    float _4335 = float(uint(_4307));
    float _4337 = as_type<float>(_4327) * _4331;
    int _4339 = abs(_3583);
    float _4341 = 1.0 / _4333;
    bool _4343 = !_4323;
    int _4345 = _4343 ? _3959 : (-1);
    int _4347 = as_type<int>(_4267) + (-2);
    float _4349 = float(uint(_4315));
    bool _4351 = _1306 == 0;
    float _4353 = 1.0 / _4335;
    int _4355 = ~_4339;
    int _4357 = _4355 + 1;
    int _4359 = _4357 + 1;
    float _4361 = as_type<float>(_4347) * _4349;
    bool _4363 = !_4351;
    int _4365 = _4363 ? _3975 : (-1);
    int _4367 = as_type<int>(_4309) + (-2);
    int _4369 = _4359 * _4273;
    float _4371 = float(uint(_4311));
    float _4373 = trunc(_4337);
    float _4375 = precise::max(_4373, 0.0);
    uint _4377 = uint(_4375);
    int _4379 = _4345 * _4301;
    int _4381 = _4379 + _4325;
    int _4383 = abs(_4299);
    int _4385 = _4365 * _4339;
    int _4387 = _4385 + _4369;
    int _4389 = abs(_4315);
    float _4391 = _4007 + 0.5;
    float _4393 = float(uint(_4381));
    float _4395 = trunc(_4361);
    float _4397 = precise::max(_4395, 0.0);
    uint _4399 = uint(_4397);
    int _4401 = as_type<int>(_4329) + (-2);
    float _4403 = as_type<float>(_4367) * _4393;
    float _4405 = float(uint(_4387));
    int _4407 = as_type<int>(_4295) + (-2);
    float _4409 = 1.0 / _4371;
    float _4411 = float(uint(_4383));
    float _4413 = as_type<float>(_4401) * _4405;
    int _4415 = ~_4013;
    int _4417 = _4415 + 1;
    float _4419 = _3881 + 0.5;
    int _4421 = as_type<int>(_4353) + (-2);
    float _4423 = as_type<float>(_4407) * _4411;
    int _4425 = ~_3927;
    int _4427 = _4425 + 1;
    float _4429 = trunc(_4403);
    float _4431 = precise::max(_4429, 0.0);
    uint _4433 = uint(_4431);
    int _4435 = _4417 * int(_4377);
    int _4437 = _4435 + _4299;
    out.m_79.x = _4391;
    out.m_79.y = _4419;
    int _4439 = abs(_4381);
    int _4441 = as_type<int>(_4341) + (-2);
    float _4443 = float(uint(_4437));
    float _4445 = trunc(_4413);
    float _4447 = precise::max(_4445, 0.0);
    uint _4449 = uint(_4447);
    float _4451 = float(uint(_4389));
    int _4453 = as_type<int>(_4409) + (-2);
    bool _4455 = !_3967;
    int _4457 = _4455 ? 0 : 1;
    float _4459 = as_type<float>(_4421) * _4451;
    int _4461 = _4427 * int(_4399);
    int _4463 = _4461 + _4315;
    bool _4465 = !_3963;
    int _4467 = _4465 ? 0 : 1;
    float _4469 = trunc(_4423);
    float _4471 = precise::max(_4469, 0.0);
    uint _4473 = uint(_4471);
    int _4475 = abs(_4387);
    float _4477 = as_type<float>(_4327) * _4443;
    float _4479 = float(uint(_4463));
    float _4481 = float(uint(_4475));
    float _4483 = in.m_81.x;
    float _4485 = in.m_81.y;
    float _4487 = in.m_81.z;
    float _4489 = float(uint(_4439));
    float _4491 = as_type<float>(_4347) * _4479;
    float _4493 = trunc(_4459);
    float _4495 = precise::max(_4493, 0.0);
    uint _4497 = uint(_4495);
    float _4499 = as_type<float>(_4453) * _4481;
    int _4501 = abs(_4457);
    float _4503 = as_type<float>(_4441) * _4489;
    int _4505 = abs(_4467);
    int _4507 = ~_4189;
    int _4509 = _4507 + 1;
    float _4511 = trunc(_4503);
    float _4513 = precise::max(_4511, 0.0);
    uint _4515 = uint(_4513);
    float _4517 = float(_3231);
    float _4519 = float(_4501);
    int _4521 = _4509 * int(_4449);
    int _4523 = _4521 + _4387;
    int _4525 = ~_4139;
    int _4527 = _4525 + 1;
    int _4529 = ~_4265;
    int _4531 = _4529 + 1;
    float _4533 = _4519 * _4517;
    float _4535 = float(_4005);
    int _4537 = _4527 * int(_4433);
    int _4539 = _4537 + _4381;
    float _4541 = float(_4505);
    float _4543 = trunc(_4499);
    float _4545 = precise::max(_4543, 0.0);
    uint _4547 = uint(_4545);
    float _4549 = float(uint(_4523));
    float _4551 = _4541 * _4535;
    float _4553 = float(uint(_4539));
    int _4555 = _4531 * int(_4473);
    int _4557 = _4555 + _4383;
    int _4559 = ~_4307;
    int _4561 = _4559 + 1;
    float _4563 = _4551 * (-2.0);
    float _4565 = as_type<float>(_4401) * _4549;
    float _4567 = as_type<float>(_4367) * _4553;
    float _4569 = float(uint(_4557));
    int _4571 = _4561 * int(_4497);
    int _4573 = _4571 + _4389;
    int _4575 = ~_4287;
    int _4577 = _4575 + 1;
    float _4579 = trunc(_4477);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    float _4585 = fma(_3699, _4563, _3699);
    float _4587 = fma(_4563, _4483, _4483);
    float _4589 = as_type<float>(_4407) * _4569;
    float _4591 = _1481 + (-0.5);
    float _4593 = float(uint(_4573));
    int _4595 = _4577 * int(_4515);
    int _4597 = _4595 + _4439;
    int _4599 = ~_3927;
    int _4601 = _4599 + 1;
    float _4603 = trunc(_4565);
    float _4605 = precise::max(_4603, 0.0);
    uint _4607 = uint(_4605);
    int _4609 = ~_4311;
    int _4611 = _4609 + 1;
    float _4613 = fma(_4591, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4587);
    float _4615 = as_type<float>(_4421) * _4593;
    float _4617 = float(uint(_4597));
    float _4619 = fma(_4585, _3137, _4613);
    float _4621 = trunc(_4567);
    float _4623 = precise::max(_4621, 0.0);
    uint _4625 = uint(_4623);
    float _4627 = as_type<float>(_4441) * _4617;
    int _4629 = int(_4377) + int(_4583);
    int _4631 = _4611 * int(_4547);
    int _4633 = _4631 + _4475;
    int _4635 = ~_4013;
    int _4637 = _4635 + 1;
    int _4639 = ~_4189;
    int _4641 = _4639 + 1;
    float _4643 = trunc(_4491);
    float _4645 = precise::max(_4643, 0.0);
    uint _4647 = uint(_4645);
    int _4649 = int(_4449) + int(_4607);
    int _4651 = _4637 * _4629;
    int _4653 = _4651 + _4299;
    float _4655 = float(uint(_4633));
    bool _4657 = _4189 == 0;
    bool _4659 = uint(_4653) >= uint(_4013);
    float _4661 = trunc(_4615);
    float _4663 = precise::max(_4661, 0.0);
    uint _4665 = uint(_4663);
    int _4667 = int(_4433) + int(_4625);
    float _4669 = as_type<float>(_4453) * _4655;
    bool _4671 = !_3971;
    int _4673 = _4671 ? 0 : 1;
    float _4675 = trunc(_4589);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    int _4681 = ~_4139;
    int _4683 = _4681 + 1;
    int _4685 = int(_4399) + int(_4647);
    int _4687 = _4683 * _4667;
    int _4689 = _4687 + _4381;
    float _4691 = trunc(_4627);
    float _4693 = precise::max(_4691, 0.0);
    uint _4695 = uint(_4693);
    int _4697 = int(_4497) + int(_4665);
    int _4699 = _4601 * _4685;
    int _4701 = _4699 + _4315;
    int _4703 = ~_4265;
    int _4705 = _4703 + 1;
    int _4707 = _4641 * _4649;
    int _4709 = _4707 + _4387;
    bool _4711 = uint(_4689) >= uint(_4139);
    int _4713 = ~_4307;
    int _4715 = _4713 + 1;
    float _4717 = trunc(_4669);
    float _4719 = precise::max(_4717, 0.0);
    uint _4721 = uint(_4719);
    int _4723 = int(_4473) + int(_4679);
    int _4725 = ~_4287;
    int _4727 = _4725 + 1;
    int _4729 = _4715 * _4697;
    int _4731 = _4729 + _4389;
    bool _4733 = uint(_4701) >= uint(_3927);
    int _4735 = _4705 * _4723;
    int _4737 = _4735 + _4383;
    bool _4739 = uint(_4709) >= uint(_4189);
    float _4741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4743 = int(_4515) + int(_4695);
    int _4745 = ~_4311;
    int _4747 = _4745 + 1;
    int _4749 = _4727 * _4743;
    int _4751 = _4749 + _4439;
    bool _4753 = !_4659;
    int _4755 = _4753 ? 0 : (-1);
    bool _4757 = uint(_4737) >= uint(_4265);
    bool _4759 = !_4733;
    int _4761 = _4759 ? 0 : (-1);
    bool _4763 = uint(_4731) >= uint(_4307);
    bool _4765 = !_4711;
    int _4767 = _4765 ? 0 : (-1);
    float _4769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4771 = uint(_4751) >= uint(_4287);
    bool _4773 = !_4739;
    int _4775 = _4773 ? 0 : (-1);
    int _4777 = ~_4629;
    int _4779 = _4777 + _4755;
    int _4781 = _4779 + 1;
    int _4783 = int(_4547) + int(_4721);
    int _4785 = ~_4685;
    int _4787 = _4785 + _4761;
    int _4789 = _4787 + 1;
    int _4791 = _4013 * _4781;
    int _4793 = _4791 + _4299;
    int _4795 = ~_4649;
    int _4797 = _4795 + _4775;
    int _4799 = _4797 + 1;
    float _4801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4803 = ~_4667;
    int _4805 = _4803 + _4767;
    int _4807 = _4805 + 1;
    int _4809 = _4747 * _4783;
    int _4811 = _4809 + _4475;
    bool _4813 = !_4757;
    int _4815 = _4813 ? 0 : (-1);
    int _4817 = _3927 * _4789;
    int _4819 = _4817 + _4315;
    bool _4821 = _4013 == 0;
    int _4823 = _4139 * _4807;
    int _4825 = _4823 + _4381;
    int _4827 = _4299 ^ _4013;
    float _4829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4831 = !_4771;
    int _4833 = _4831 ? 0 : (-1);
    int _4835 = _4189 * _4799;
    int _4837 = _4835 + _4387;
    bool _4839 = _3927 == 0;
    bool _4841 = !_4821;
    int _4843 = _4841 ? _4793 : (-1);
    bool _4845 = _4139 == 0;
    float _4847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4849 = uint(int(uint(_4827) >> uint(31)));
    bool _4851 = uint(_4811) >= uint(_4311);
    bool _4853 = !_4839;
    int _4855 = _4853 ? _4819 : (-1);
    float _4857 = _4741 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4859 = !_4845;
    int _4861 = _4859 ? _4825 : (-1);
    int _4863 = ~_4815;
    int _4865 = _4723 + _4863;
    int _4867 = _4865 + 1;
    float _4869 = fma(_4857, _1679, -0.5);
    float _4871 = float(_4843);
    float _4873 = _4829 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4875 = ~int(_4849);
    int _4877 = _4875 + 1;
    bool _4879 = !_4657;
    int _4881 = _4879 ? _4837 : (-1);
    float _4883 = fma(_4857, _4871, _3107);
    int _4885 = _4315 ^ _3927;
    float _4887 = _4801 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4889 = _4139 == 0;
    float _4891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4893 = _4381 ^ _4139;
    float _4895 = _4769 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4897 = _4387 ^ _4189;
    float _4899 = fma(_4887, _2447, -0.5);
    float _4901 = float(_4855);
    float _4903 = fma(_4895, _1773, -0.5);
    int _4905 = _4867 ^ _4877;
    float _4907 = fma(_4873, _1609, -0.5);
    float _4909 = float(_4881);
    float _4911 = fma(_4895, _4901, _3125);
    bool _4913 = !_4763;
    int _4915 = _4913 ? 0 : (-1);
    float _4917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4919 = !_4851;
    int _4921 = _4919 ? 0 : (-1);
    float _4923 = fma(_4887, _4909, _3091);
    uint _4925 = uint(int(uint(_4885) >> uint(31)));
    float _4927 = fma(_3113, _4903, _4911);
    uint _4929 = uint(int(uint(_4893) >> uint(31)));
    float _4931 = fma(_3085, _4869, _4883);
    uint _4933 = uint(int(uint(_4897) >> uint(31)));
    float _4935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4937 = _4013 == 0;
    float _4939 = fma(_3101, _4899, _4923);
    int _4941 = ~_4877;
    int _4943 = _4941 + _4905;
    int _4945 = _4943 + 1;
    bool _4947 = _4189 == 0;
    int _4949 = ~_4915;
    int _4951 = _4697 + _4949;
    int _4953 = _4951 + 1;
    int _4955 = ~_4833;
    int _4957 = _4743 + _4955;
    int _4959 = _4957 + 1;
    int _4961 = ~_4921;
    int _4963 = _4783 + _4961;
    int _4965 = _4963 + 1;
    int _4967 = ~int(_4925);
    int _4969 = _4967 + 1;
    int _4971 = ~int(_4929);
    int _4973 = _4971 + 1;
    float _4975 = _4935 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4977 = ~int(_4933);
    int _4979 = _4977 + 1;
    float _4981 = float(_4861);
    float _4983 = fma(_4975, _2825, -0.5);
    bool _4985 = !_4937;
    int _4987 = _4985 ? _4945 : (-1);
    int _4989 = _4953 ^ _4969;
    float _4991 = fma(_4873, _4981, _3131);
    int _4993 = _4959 ^ _4973;
    float _4995 = _4847 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4997 = _4965 ^ _4979;
    float _4999 = _4891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5001 = float(_4987);
    float _5003 = fma(_4995, _2729, -0.5);
    bool _5005 = _3927 == 0;
    float _5007 = _4917 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5009 = ~_4969;
    int _5011 = _5009 + _4989;
    int _5013 = _5011 + 1;
    float _5015 = -_3095;
    float _5017 = fma(_4995, _5001, _5015);
    int _5019 = ~_4973;
    int _5021 = _5019 + _4993;
    int _5023 = _5021 + 1;
    float _5025 = fma(_4999, _2813, -0.5);
    int _5027 = ~_4979;
    int _5029 = _5027 + _4997;
    int _5031 = _5029 + 1;
    float _5033 = fma(_3099, _4907, _4991);
    bool _5035 = !_5005;
    int _5037 = _5035 ? _5013 : (-1);
    float _5039 = fma(_3061, _5003, _5017);
    bool _5041 = !_4889;
    int _5043 = _5041 ? _5023 : (-1);
    float _5045 = _5033 + 0.5;
    bool _5047 = !_4947;
    int _5049 = _5047 ? _5031 : (-1);
    float _5051 = float(_5037);
    float _5053 = float(_5043);
    float _5055 = fma(_5007, _2827, -0.5);
    float _5057 = float(_5049);
    float _5059 = -_3127;
    float _5061 = fma(_4999, _5051, _5059);
    float _5063 = _4533 * (-2.0);
    float _5065 = -_3133;
    float _5067 = fma(_5007, _5053, _5065);
    float _5069 = _4939 + 0.5;
    float _5071 = -_3093;
    float _5073 = fma(_4975, _5057, _5071);
    float _5075 = fma(_3115, _5025, _5061);
    float _5077 = fma(_3097, _5055, _5067);
    float _5079 = _4931 + 0.5;
    float _5081 = fma(_3103, _4983, _5073);
    float _5083 = _4927 + 0.5;
    float _5085 = _5039 + 0.5;
    float _5087 = _5075 + 0.5;
    float _5089 = _5077 + 0.5;
    float _5091 = _5081 + 0.5;
    float _5093 = fma(_3751, _5063, _3751);
    float _5095 = fma(_5063, _4485, _4485);
    out.m_83.x = _5079;
    out.m_83.y = _5085;
    out.m_83.z = _5083;
    out.m_83.w = _5087;
    out.m_85.x = _5045;
    out.m_85.y = _5089;
    out.m_87.x = _5069;
    out.m_87.y = _5091;
    int _5097 = as_type<int>(_5083);
    if (_3681)
    {
        return out;
    }
    float _5099 = -_3783;
    float _5101 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3515);
    float _5103 = -_3787;
    float _5105 = fma(_5103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3499);
    float _5107 = -_3807;
    float _5109 = fma(_5107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3537);
    int _5111 = abs(_4673);
    float _5113 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5115 = _5101 + _5113;
    float _5117 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5119 = _5105 + _5117;
    float _5121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5123 = _5109 + _5121;
    float _5125 = float(_3545);
    float _5127 = _5115 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5129 = float(_5111);
    float _5131 = _1481 + _1493;
    float _5133 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5095);
    float _5135 = fma(_5119, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5127);
    float _5137 = _1493 + (-0.5);
    float _5139 = _5129 * _5125;
    float _5141 = _5131 + (-1.0);
    float _5143 = fma(_5123, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5135);
    float _5145 = fma(_5093, _3137, _5133);
    float _5147 = _5139 * (-2.0);
    float _5149 = _4619 * 0.15915493667125701904296875;
    float _5151 = sqrt(_3873);
    bool _5153 = _5143 >= 0.0;
    float _5155 = fma(_5147, _4487, _4487);
    float _5157 = _5145 * 0.15915493667125701904296875;
    float _5159 = fma(_5137, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5155);
    float _5161 = fma(_5141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5163 = _5149 * 6.283185482025146484375;
    float _5165 = sin(_5163);
    float _5167 = fma(_5161, _5147, _5161);
    float _5169 = _5139;
    float _5171 = _5105;
    float _5173 = _5123;
    if (_5153)
    {
        _5169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5175 = _5169;
    if (_5153)
    {
        out.m_51.x = 0.0;
    }
    float _5177 = fma(_5167, _3137, _5159);
    float _5179 = _5157 * 6.283185482025146484375;
    float _5181 = sin(_5179);
    if (_5153)
    {
        float _5183 = _5175 * 5.0;
        _5097 = as_type<int>(_5183);
    }
    int _5185 = _5097;
    float _5187 = _5177 * 0.15915493667125701904296875;
    if (_5153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14330 = as_type<float>(_5185);
        out.gl_Position.z = _14330;
    }
    float _5189 = _5149 * 6.283185482025146484375;
    float _5191 = cos(_5189);
    float _5193 = _5157 * 6.283185482025146484375;
    float _5195 = cos(_5193);
    float _5197 = _5165 * _5181;
    float _5199 = _5187 * 6.283185482025146484375;
    float _5201 = sin(_5199);
    if (_5153)
    {
        return out;
    }
    float _5203 = -_3515;
    float _5205 = _5203 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5207 = -_3499;
    float _5209 = _5207 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5211 = in.m_89.x;
    float _5213 = in.m_89.y;
    float _5215 = in.m_89.z;
    float _5217 = -_3537;
    float _5219 = _5217 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5221 = _5205 * _5205;
    float _5223 = _5187 * 6.283185482025146484375;
    float _5225 = cos(_5223);
    float _5227 = _5191 * _5195;
    float _5229 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5231 = fma(_5209, _5209, _5221);
    float _5233 = fma(_5201, _5227, _5197);
    float _5235 = fma(_5201, _5197, _5227);
    float _5237 = fma(_5219, _5219, _5231);
    float _5239 = _3757 * _5151;
    float _5241 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5243 = _5191 * _5181;
    float _5245 = rsqrt(_5237);
    float _5247 = _5165 * _5195;
    float _5249 = _5191 * _5225;
    float _5251 = _5195 * _5225;
    float _5253 = _5165 * _5225;
    float _5255 = _5181 * _5225;
    float _5257 = _5239 * _5241;
    float _5259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5211);
    float _5261 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5263 = _5239 * _5229;
    float _5265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5213);
    float _5267 = _5259 * _5257;
    float _5269 = -_5243;
    float _5271 = fma(_5201, _5247, _5269);
    float _5273 = _5209 * _5245;
    float _5275 = -_5247;
    float _5277 = fma(_5201, _5243, _5275);
    float _5279 = _5239 * _5261;
    float _5281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5215);
    float _5283 = _5219 * _5245;
    float _5285 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5287 = _5273 * _5285;
    float _5289 = _5265 * _5263;
    float _5291 = _5281 * _5279;
    float _5293 = in.m_91.x;
    float _5295 = in.m_91.y;
    float _5297 = in.m_91.z;
    float _5299 = _5205 * _5245;
    float _5301 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5303 = _5283 * _5301;
    float _5305 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5307 = -_5287;
    float _5309 = fma(_5283, _5305, _5307);
    bool _5311 = _5213 != 0.0;
    bool _5313 = isnan(_5213);
    bool _5315 = _5311 || _5313;
    bool _5317 = isnan(0.0);
    bool _5319 = _5315 || _5317;
    float _5321 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5323 = _5299 * _5321;
    float _5325 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5327 = -_5303;
    float _5329 = fma(_5299, _5325, _5327);
    float _5331 = _5309 * _5309;
    bool _5333 = _5211 == 0.0;
    bool _5335 = !_5319;
    bool _5337 = _5333 && _5335;
    float _5339 = in.m_93.x;
    float _5341 = in.m_93.y;
    float _5343 = in.m_93.z;
    float _5345 = in.m_93.w;
    float _5347 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5349 = -_5323;
    float _5351 = fma(_5273, _5347, _5349);
    float _5353 = fma(_5329, _5329, _5331);
    bool _5355 = _5215 == 0.0;
    bool _5357 = _5355 && _5337;
    float _5359 = -_5289;
    float _5361 = _5201 * _5359;
    float _5363 = _5249 * _5289;
    float _5365 = fma(_5351, _5351, _5353);
    float _5367 = _5253 * _5289;
    float _5369 = fma(_5251, _5267, _5361);
    float _5371 = fma(_5233, _5267, _5363);
    float _5373 = fma(_5271, _5267, _5367);
    float _5375 = rsqrt(_5365);
    float _5377 = fma(_5255, _5291, _5369);
    float _5379 = fma(_5277, _5291, _5371);
    float _5381 = fma(_5235, _5291, _5373);
    float _5383 = _5267;
    float _5385 = _5361;
    float _5387 = _5363;
    float _5389 = _5209;
    float _5391 = _5293;
    float _5393 = _5235;
    if (_5357)
    {
        _5383 = _5293;
    }
    float _5395 = _5383;
    float _5397 = _5395;
    if (_5357)
    {
        _5385 = _5297;
    }
    float _5399 = _5385;
    float _5401 = _5399;
    if (_5357)
    {
        _5387 = _5395;
    }
    float _5403 = _5387;
    float _5405 = _5403;
    if (!_5357)
    {
        _5397 = _5293;
    }
    float _5407 = _5397;
    if (_5357)
    {
        _5389 = _5295;
    }
    float _5409 = _5389;
    float _5411 = _5409;
    if (!_5357)
    {
        float _5413 = fma(_5213, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5295);
        _5411 = _5413;
    }
    float _5415 = _5411;
    if (_5357)
    {
        _5391 = _5399;
    }
    float _5417 = _5391;
    float _5419 = _5343 * _5407;
    float _5421 = _5417;
    if (!_5357)
    {
        _5401 = _5297;
    }
    float _5423 = _5401;
    float _5425 = _5329 * _5375;
    float _5427 = _5309 * _5375;
    if (!_5357)
    {
        float _5429 = fma(_5211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5407);
        _5405 = _5429;
    }
    float _5431 = _5405;
    float _5433 = _5339 * _5295;
    float _5435 = -_5419;
    float _5437 = fma(_5339, _5423, _5435);
    float _5439 = _5341 * _5423;
    float _5441 = _5351 * _5375;
    float _5443 = _5283 * _5427;
    float _5445 = _5299 * _5425;
    if (!_5357)
    {
        float _5447 = fma(_5215, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5423);
        _5421 = _5447;
    }
    float _5449 = _5421;
    float _5451 = -_5439;
    float _5453 = fma(_5343, _5295, _5451);
    float _5455 = -_5433;
    float _5457 = fma(_5341, _5407, _5455);
    float _5459 = -_5443;
    float _5461 = fma(_5299, _5441, _5459);
    float _5463 = -_5445;
    float _5465 = fma(_5273, _5427, _5463);
    float _5467 = _5437 * _5345;
    float _5469 = _5453 * _5345;
    float _5471 = _5461 * _5379;
    float _5473 = _5465 * _5379;
    float _5475 = _5457 * _5345;
    float _5477 = _5273 * _5441;
    float _5479 = fma(_5425, _5377, _5471);
    float _5481 = fma(_5441, _5377, _5473);
    float _5483 = _5233 * _5461;
    float _5485 = -_5477;
    float _5487 = fma(_5283, _5425, _5485);
    float _5489 = fma(_5273, _5381, _5479);
    float _5491 = fma(_5283, _5381, _5481);
    float _5493 = _5233 * _5465;
    float _5495 = _5233 * _5487;
    float _5497 = _3499 + _5489;
    float _5499 = _3537 + _5491;
    float _5501 = _5487 * _5379;
    float _5503 = fma(_5251, _5427, _5495);
    float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5507 = _5497 + _5505;
    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5511 = _5499 + _5509;
    float _5513 = _5249 * _5461;
    float _5515 = _5249 * _5487;
    float _5517 = _5507 * _5507;
    float _5519 = _5511 * _5511;
    float _5521 = _5249 * _5465;
    float _5523 = _5277 * _5461;
    float _5525 = _5277 * _5465;
    float _5527 = _5517 + _5519;
    float _5529 = _5277 * _5487;
    float _5531 = fma(_5255, _5425, _5523);
    float _5533 = -_5201;
    float _5535 = fma(_5533, _5427, _5515);
    float _5537 = sqrt(_5527);
    float _5539 = fma(_5255, _5427, _5529);
    float _5541 = fma(_5427, _5377, _5501);
    float _5543 = -_5201;
    float _5545 = fma(_5543, _5425, _5513);
    float _5547 = -_5201;
    float _5549 = fma(_5547, _5441, _5521);
    float _5551 = fma(_5251, _5425, _5483);
    float _5553 = fma(_5299, _5381, _5541);
    float _5555 = fma(_5251, _5441, _5493);
    float _5557 = fma(_5255, _5441, _5525);
    float _5559 = fma(_5253, _5273, _5545);
    float _5561 = fma(_5253, _5299, _5535);
    float _5563 = fma(_5253, _5283, _5549);
    float _5565 = _3515 + _5553;
    float _5567 = fma(_5271, _5273, _5551);
    float _5569 = fma(_5271, _5299, _5503);
    float _5571 = fma(_5271, _5283, _5555);
    bool _5573 = _5537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5575 = fma(_5235, _5283, _5557);
    float _5577 = _5559 * _5341;
    float _5579 = _5561 * _5341;
    float _5581 = _5563 * _5341;
    float _5583 = _5561 * _5415;
    float _5585 = fma(_5235, _5273, _5531);
    float _5587 = fma(_5235, _5299, _5539);
    float _5589 = _5559 * _5415;
    float _5591 = _5467 * _5559;
    float _5593 = _5467 * _5561;
    float _5595 = _5467 * _5563;
    float _5597 = _5563 * _5415;
    float _5599 = _5503;
    float _5601 = _5559;
    float _5603 = _5531;
    float _5605 = _5467;
    float _5607 = _5475;
    if (!_5573)
    {
        _5599 = _5519;
    }
    float _5609 = _5599;
    float _5611 = _5609;
    if (!_5573)
    {
        _5601 = _5517;
    }
    float _5613 = _5601;
    float _5615 = _5613;
    if (!_5573)
    {
        _5393 = _5497;
    }
    float _5617 = _5393;
    float _5619 = _5617;
    if (!_5573)
    {
        _5603 = _5499;
    }
    float _5621 = _5603;
    float _5623 = _5621;
    if (!_5573)
    {
        _5605 = _5565;
    }
    float _5625 = _5605;
    bool _5627 = !_5573;
    float _5629 = _5625;
    if (!_5627)
    {
        float _5631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5635 = _5537 + _5633;
        float _5637 = rsqrt(_5527);
        float _5639 = _5635 * _5631;
        float _5641 = _5565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5643 = _5639 * 0.15915493667125701904296875;
        float _5645 = _5643 * 6.283185482025146484375;
        float _5647 = sin(_5645);
        float _5649 = _5643 * 6.283185482025146484375;
        float _5651 = cos(_5649);
        float _5653 = fma(_5647, _5641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5655 = _5637 * _5653;
        float _5657 = _5651 + (-1.0);
        float _5659 = fma(_5507, _5655, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5661 = fma(_5511, _5655, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5663 = _5657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5665 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5667 = _5659 + _5665;
        float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5671 = _5661 + _5669;
        float _5673 = fma(_5565, _5651, _5663);
        float _5675 = _5667 * _5667;
        float _5677 = _5671 * _5671;
        _5629 = _5673;
        _5615 = _5675;
        _5611 = _5677;
        _5619 = _5659;
        _5623 = _5661;
    }
    float _5679 = _5629;
    float _5681 = _5615;
    float _5683 = _5611;
    float _5685 = _5619;
    float _5687 = _5623;
    float _5689 = fma(_5567, _5339, _5577);
    float _5691 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5693 = _5679 + _5691;
    float _5695 = fma(_5567, _5431, _5589);
    float _5697 = fma(_5571, _5431, _5597);
    float _5699 = fma(_5569, _5339, _5579);
    float _5701 = fma(_5693, _5693, _5681);
    float _5703 = fma(_5569, _5431, _5583);
    float _5705 = fma(_5469, _5569, _5593);
    float _5707 = fma(_5571, _5339, _5581);
    float _5709 = _5701 + _5683;
    float _5711 = fma(_5469, _5567, _5591);
    float _5713 = fma(_5469, _5571, _5595);
    float _5715 = fma(_5585, _5343, _5689);
    float _5717 = fma(_5587, _5343, _5699);
    float _5719 = fma(_5587, _5449, _5703);
    float _5721 = sqrt(_5709);
    float _5723 = fma(_5575, _5343, _5707);
    float _5725 = fma(_5585, _5449, _5695);
    float _5727 = fma(_5475, _5585, _5711);
    float _5729 = fma(_5475, _5587, _5705);
    float _5731 = fma(_5475, _5575, _5713);
    float _5733 = fma(_5575, _5449, _5697);
    out.m_95.x = _5715;
    out.m_95.y = _5717;
    out.m_95.z = _5723;
    out.m_97.x = _5727;
    out.m_97.y = _5729;
    out.m_97.z = _5731;
    out.m_99.x = _5725;
    out.m_99.y = _5719;
    out.m_99.z = _5733;
    bool _5735 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5737 = isnan(_5721);
    bool _5739 = _5735 || _5737;
    bool _5741 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5743 = _5739 || _5741;
    float _5745 = _5695;
    if (!_5743)
    {
        _5607 = 1.0;
    }
    float _5747 = _5607;
    bool _5749 = !_5743;
    float _5751 = _5747;
    if (!_5749)
    {
        bool _5753 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5755 = isnan(_5721);
        bool _5757 = _5753 || _5755;
        bool _5759 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5761 = _5757 || _5759;
        if (!_5761)
        {
            float _5763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5765 = _5721 + _5763;
            float _5767 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5769 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5767;
            float _5771 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5773 = _5771 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5775 = 1.0 / _5769;
            float _5777 = _5765 * _5775;
            float _5779 = fma(_5777, _5773, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5751 = _5779;
            _5781 = true;
        }
        else
        {
            bool _5783 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5785 = isnan(_5721);
            bool _5787 = _5783 || _5785;
            bool _5789 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5791 = _5787 || _5789;
            if (!_5791)
            {
                float _5793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5795 = _5721 + _5793;
                float _5797 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5799 = _5797 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5801 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5803 = _5801 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5805 = 1.0 / _5799;
                float _5807 = _5795 * _5805;
                float _5809 = fma(_5807, _5803, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5751 = _5809;
                _5781 = true;
            }
            else
            {
                _5751 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5781 = false;
    float _5811 = _5751;
    float _5813 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5815 = _5679 + _5813;
    float _5817 = _5101 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5819 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5821 = _5685 + _5819;
    float _5823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5825 = _5687 + _5823;
    float _5827 = fma(_5815, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5829 = fma(_5105, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5817);
    float _5831 = fma(_5821, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5833 = fma(_5825, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5835 = -_3515;
    float _5837 = _5835 + _5827;
    float _5839 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5829);
    float _5841 = -_3499;
    float _5843 = _5841 + _5831;
    float _5845 = _5101 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5847 = _5837 * _5837;
    float _5849 = _5839 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5851 = -_3537;
    float _5853 = _5851 + _5833;
    float _5855 = fma(_5105, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5845);
    float _5857 = fma(_5843, _5843, _5847);
    float _5859 = 1.0 / _5849;
    float _5861 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5855);
    float _5863 = fma(_5853, _5853, _5857);
    float _5865 = _5861 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5867 = sqrt(_5863);
    float _5869 = _5865 + _5849;
    float _5871 = _5869 * _5859;
    float _5873 = _5871 * 0.5;
    float _5875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5877 = fma(_5873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5875);
    bool _5879 = _5867 > 0.0;
    float _5881 = 1.0 / _5877;
    bool _5883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5887 = _5883 || _5885;
    bool _5889 = isnan(0.5);
    bool _5891 = _5887 || _5889;
    bool _5893 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5895 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5897 = _5893 || _5895;
    bool _5899 = isnan(0.5);
    bool _5901 = _5897 || _5899;
    float _5903 = _5873;
    float _5905 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5907 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5909 = _5831;
    if (!_5879)
    {
        _5903 = _5831;
    }
    float _5911 = _5903;
    float _5913 = _5911;
    float _5915 = _5911;
    if (!_5879)
    {
        _5905 = _5827;
    }
    float _5917 = _5905;
    float _5919 = _5917;
    if (!_5879)
    {
        _5907 = _5833;
    }
    float _5921 = _5907;
    bool _5923 = !_5879;
    float _5925 = _5921;
    float _5927 = _5881;
    if (!_5923)
    {
        float _5929 = _226 * _226;
        float _5931 = fma(_222, _222, _5929);
        float _5933 = fma(_228, _228, _5931);
        float _5935 = rsqrt(_5863);
        float _5937 = sqrt(_5933);
        float _5939 = _5843 * _5935;
        float _5941 = _5837 * _5935;
        float _5943 = _5853 * _5935;
        bool _5945 = _5937 > 0.0;
        float _5947 = _5937;
        float _5949 = _5935;
        if (!_5945)
        {
            _5913 = _5831;
        }
        float _5951 = _5913;
        _5915 = _5951;
        if (!_5945)
        {
            _5947 = _5827;
        }
        float _5953 = _5947;
        _5919 = _5953;
        if (!_5945)
        {
            _5949 = _5833;
        }
        float _5955 = _5949;
        bool _5957 = !_5945;
        _5925 = _5955;
        if (!_5957)
        {
            float _5959 = rsqrt(_5933);
            float _5961 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5963 = _226 * _5959;
            float _5965 = _222 * _5959;
            float _5967 = _228 * _5959;
            float _5969 = _5941 * _5963;
            float _5971 = fma(_5939, _5965, _5969);
            float _5973 = _5961 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5975 = fma(_5943, _5967, _5971);
            float _5977 = _5975 * _5973;
            float _5979 = fma(_222, _5977, _5831);
            float _5981 = fma(_226, _5977, _5827);
            float _5983 = fma(_228, _5977, _5833);
            _5915 = _5979;
            _5919 = _5981;
            _5925 = _5983;
        }
    }
    float _5985 = _5915;
    float _5987 = _5919;
    float _5989 = _5925;
    float _5991 = -_3787;
    float _5993 = fma(_5991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5985);
    float _5995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5997 = _5881 * _5995;
    float _5999 = -_3783;
    float _6001 = fma(_5999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5987);
    float _6003 = -_3807;
    float _6005 = fma(_6003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5989);
    float _6007 = _6001;
    float _6009 = _6005;
    if (_5891)
    {
        _5909 = 1.0;
    }
    float _6011 = _5909;
    float _6013 = _6011;
    if (_5901)
    {
        _5927 = _5993;
    }
    float _6015 = _5927;
    float _6017 = _6015;
    if (!_5901)
    {
        float _6019 = _5115 * _5115;
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6023 = -_3537;
        float _6025 = _6023 + _5989;
        float _6027 = -_3499;
        float _6029 = _6027 + _5985;
        float _6031 = fma(_5119, _5119, _6019);
        float _6033 = fma(_5123, _5123, _6031);
        float _6035 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6037 = sqrt(_6033);
        float _6039 = 1.0 / _5239;
        float _6041 = _6035 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6043 = precise::min(_6037, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6045 = _6043 * _6021;
        float _6047 = -_3515;
        float _6049 = _6047 + _5987;
        float _6051 = _6045 * _6039;
        float _6053 = _6041 * _6051;
        float _6055 = _6025 * _6051;
        float _6057 = fma(_6049, _6053, _5101);
        float _6059 = fma(_6029, _6053, _5105);
        float _6061 = fma(_6041, _6055, _5109);
        _6007 = _6057;
        _6017 = _6059;
        _6009 = _6061;
    }
    float _6063 = _6007;
    float _6065 = _6017;
    float _6067 = _6009;
    if (!_5891)
    {
        float _6069 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6071 = _6069 * 0.15915493667125701904296875;
        float _6073 = _6071 * 6.283185482025146484375;
        float _6075 = cos(_6073);
        float _6077 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6079 = _6077 * 0.15915493667125701904296875;
        float _6081 = _6071 * 6.283185482025146484375;
        float _6083 = sin(_6081);
        float _6085 = 1.0 / _6075;
        float _6087 = _6079 * 6.283185482025146484375;
        float _6089 = cos(_6087);
        float _6091 = _6083 * _6085;
        float _6093 = _6079 * 6.283185482025146484375;
        float _6095 = sin(_6093);
        float _6097 = _6089 * _6091;
        float _6099 = 1.0 / _6097;
        float _6101 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6103 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6101;
        float _6105 = 1.0 / _6103;
        float _6107 = _6095 * _6099;
        float _6109 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6111 = fma(_5997, _6107, _6109);
        float _6113 = _6111 * _6105;
        float _6115 = precise::clamp(_6113, 0.0, 1.0);
        _6013 = _6115;
    }
    float _6117 = _6013;
    float _6119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6121 = _6063 + _6119;
    float _6123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6125 = _6065 + _6123;
    float _6127 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6129 = _6067 + _6127;
    float _6131 = _6121 * _6121;
    float _6133 = fma(_6125, _6125, _6131);
    float _6135 = fma(_5105, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6137 = fma(_6129, _6129, _6133);
    float _6139 = rsqrt(_6137);
    float _6141 = sqrt(_6137);
    float _6143 = _6139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6145 = _6125 * _6143;
    float _6147 = _6129 * _6143;
    float _6149 = _6145 * _6145;
    float _6151 = _6147 * _6147;
    float _6153 = _6149 + _6151;
    float _6155 = sqrt(_6153);
    bool _6157 = _6155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6161 = _6155 + _6159;
    float _6163 = _6139;
    float _6165 = _6153;
    float _6167 = _6161;
    float _6169 = _6121;
    if (_6157)
    {
        float _6171 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6163 = _6171;
    }
    float _6173 = _6163;
    if (!_6157)
    {
        _5171 = _6149;
    }
    float _6175 = _5171;
    float _6177 = _6175;
    if (_6157)
    {
        float _6179 = rsqrt(_6153);
        _6165 = _6179;
    }
    float _6181 = _6165;
    float _6183 = _6181;
    if (_6157)
    {
        float _6185 = _6161 * _6173;
        _6167 = _6185;
    }
    float _6187 = _6167;
    float _6189 = floor(_6135);
    if (_6157)
    {
        float _6191 = _6187 * 0.15915493667125701904296875;
        _5173 = _6191;
    }
    float _6193 = _5173;
    float _6195 = _6129;
    if (_6157)
    {
        float _6197 = _6193 * 6.283185482025146484375;
        float _6199 = sin(_6197);
        _6195 = _6199;
    }
    float _6201 = _6195;
    float _6203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6205 = precise::max(0.0, _6203);
    float _6207 = _6173;
    float _6209 = _6205;
    if (_6157)
    {
        float _6211 = _6193 * 6.283185482025146484375;
        float _6213 = cos(_6211);
        _6207 = _6213;
    }
    float _6215 = _6207;
    float _6217 = -_6189;
    float _6219 = _6135 + _6217;
    float _6221 = -_6143;
    float _6223 = -_6205;
    float _6225 = fma(_6121, _6221, _6223);
    if (_6157)
    {
        float _6227 = _6225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6169 = _6227;
    }
    float _6229 = _6169;
    float _6231 = _6229;
    float _6233 = _6201;
    if (_6157)
    {
        float _6235 = fma(_6201, _6229, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6231 = _6235;
    }
    float _6237 = _6231;
    float _6239 = _6237;
    if (!_6157)
    {
        _6233 = _6145;
    }
    float _6241 = _6233;
    float _6243 = _6241;
    if (_6157)
    {
        float _6245 = _6181 * _6237;
        _5745 = _6245;
    }
    float _6247 = _5745;
    float _6249 = _6215;
    if (_6157)
    {
        float _6251 = _6215 + (-1.0);
        _6209 = _6251;
    }
    float _6253 = _6209;
    float _6255 = _6253;
    if (!_6157)
    {
        _6239 = _6225;
    }
    float _6257 = _6239;
    float _6259 = _6257;
    if (_6157)
    {
        float _6261 = _6145 * _6247;
        _6243 = _6261;
    }
    float _6263 = _6243;
    if (_6157)
    {
        float _6265 = _6253 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6183 = _6265;
    }
    float _6267 = _6183;
    if (!_6157)
    {
        _6255 = _6147;
    }
    float _6269 = _6255;
    float _6271 = _6269;
    if (_6157)
    {
        float _6273 = _6147 * _6247;
        _6271 = _6273;
    }
    float _6275 = _6271;
    if (_6157)
    {
        float _6277 = _6263 * _6263;
        _6177 = _6277;
    }
    float _6279 = _6177;
    if (_6157)
    {
        float _6281 = fma(_6225, _6215, _6267);
        _6259 = _6281;
    }
    float _6283 = _6259;
    if (!_6157)
    {
        _6249 = _6151;
    }
    float _6285 = _6249;
    float _6287 = _6285;
    if (_6157)
    {
        float _6289 = _6275 * _6275;
        _6287 = _6289;
    }
    float _6291 = _6287;
    float _6293 = fma(_6283, _6283, _6279);
    float _6295 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6297 = _6293 + _6291;
    float _6299 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6295);
    float _6301 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6303 = fma(_6141, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6301);
    float _6305 = precise::clamp(_6303, 0.0, 1.0);
    float _6307 = rsqrt(_6297);
    float _6309 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6299);
    float _6311 = -_6305;
    float _6313 = _6311 + 1.0;
    float _6315 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6317 = fma(_5109, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6319 = _6309 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6321 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6323 = abs(_6313);
    float _6325 = log2(_6323);
    float _6327 = _6319 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6329 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6331 = -_6327;
    float _6333 = fma(_6331, _6315, 1.0);
    float _6335 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6337 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6329);
    float _6339 = _6307 * _6263;
    float _6341 = _6307 * _6283;
    float _6343 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6335);
    float _6345 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6337);
    float _6347 = _6339 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6349 = _6307 * _6275;
    float _6351 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6343);
    float _6353 = _6345 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6355 = -_6347;
    float _6357 = fma(_6341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6355);
    float _6359 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6321);
    float _6361 = _6351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6363 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6365 = floor(_6317);
    float _6367 = -_6349;
    float _6369 = fma(_6367, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6357);
    float _6371 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6359);
    float _6373 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6363);
    float _6375 = _6325 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6377 = fma(_6369, -0.5, 0.5);
    float _6379 = _6371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6381 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6373);
    float _6383 = exp2(_6375);
    float _6385 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6387 = fma(_6369, 0.5, 0.5);
    float _6389 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6381);
    float _6391 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6393 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6385);
    float _6395 = sqrt(_6377);
    float _6397 = -_6365;
    float _6399 = _6317 + _6397;
    float _6401 = fma(_6387, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6403 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6391);
    float _6405 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6393);
    float _6407 = _6341 + 1.0;
    float _6409 = fma(_6387, _6401, -0.212114393711090087890625);
    float _6411 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6403);
    float _6413 = log2(_6333);
    float _6415 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6405);
    float _6417 = fma(_6387, _6409, 1.570728778839111328125);
    float _6419 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6411);
    float _6421 = -_6341;
    float _6423 = fma(_6383, _6407, _6421);
    float _6425 = 1.0 / _6389;
    float _6427 = _6395 * 0.636619746685028076171875;
    float _6429 = fma(_6423, 0.5, 0.5);
    float _6431 = -_6417;
    float _6433 = fma(_6427, _6431, 1.0);
    float2 _16350 = float2(_6219, _6399);
    float _6435 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16350, float2(0.0), isnan(_16350)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16350, float2(0.0), isnan(_16350)), level(0.0)).x;
    float _6437 = _6413 * 0.693147182464599609375;
    float _6439 = _6415 * _6425;
    float _6441 = _6419 * _6425;
    float _6443 = _6437 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6445 = fma(_6439, 0.5, 0.5);
    float _6447 = fma(_6441, -0.5, 0.5);
    float3 _16378 = float3(_6445, _6447, _6443);
    float _6449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16378, float3(0.0), isnan(_16378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16378, float3(0.0), isnan(_16378)), level(0.0)).x;
    float3 _16389 = float3(_6445, _6447, _6443);
    float4 _6452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16389, float3(0.0), isnan(_16389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16389, float3(0.0), isnan(_16389)), level(0.0)).xyzw;
    float _6454 = _6452.x;
    float _6456 = _6452.y;
    float _6458 = _6452.z;
    float _6460 = _6452.w;
    float2 _16405 = float2(_6433, _6429);
    float3 _6464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16405, float2(0.0), isnan(_16405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16405, float2(0.0), isnan(_16405)), level(0.0)).xyz;
    float _6466 = _6464.x;
    float _6468 = _6464.y;
    float _6470 = _6464.z;
    float _6472 = abs(_5997);
    float _6474 = log2(_6472);
    float _6476 = _6325 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6478 = _6389 * 0.5;
    float _6480 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6482 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6484 = isnan(_6141);
    bool _6486 = _6482 || _6484;
    bool _6488 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6490 = _6486 || _6488;
    float _6492 = exp2(_6476);
    bool _6494 = _5997 <= 8000.0;
    bool _6496 = isnan(_5997);
    bool _6498 = _6494 || _6496;
    bool _6500 = isnan(8000.0);
    bool _6502 = _6498 || _6500;
    float _6504 = float(_6502);
    float _6506 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6480);
    float _6508 = in.m_101.x;
    float _6510 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6506);
    float _6512 = _6474 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6514 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6510);
    float _6516 = _6415 + _6389;
    float _6518 = exp2(_6512);
    float _6520 = _6516 * 0.5;
    float _6522 = -_6492;
    float _6524 = _6522 + 1.0;
    out.gl_Position.x = _6415;
    out.gl_Position.y = _6419;
    out.gl_Position.z = _6514;
    out.gl_Position.w = _6389;
    float _6526 = _6516;
    float _6528 = _6419;
    float _6530 = _6415;
    float _6532 = _6389;
    float _6534 = _6514;
    float _6536 = _6520;
    if (!_6490)
    {
        _6526 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6538 = _6526;
    float _6540 = _6524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6542 = fma(_6518, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6544 = precise::clamp(_6542, 0.0, 1.0);
    float _6546 = fma(_6419, -0.5, _6478);
    float _6548 = fma(_6544, -2.0, 3.0);
    float _6550 = _6544 * _6544;
    float _6552 = _6538;
    float _6554 = _6538;
    if (!_6490)
    {
        _6528 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6556 = _6528;
    float _6558 = _6556;
    float _6560 = _6556;
    if (!_6490)
    {
        _6530 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6562 = _6530;
    float _6564 = _6550 * _6548;
    float _6566 = -_6564;
    float _6568 = _6566 + 1.0;
    float _6570 = fma(_6568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6564);
    float _6572 = _6514 + _6389;
    float _6574 = _6504 * _6570;
    float _6576 = _6572 * 0.5;
    float _6578 = _6562;
    float _6580 = _6562;
    if (!_6490)
    {
        _6532 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6582 = _6532;
    float _6584 = _6574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6586 = _6582;
    float _6588 = _6582;
    if (!_6490)
    {
        _6534 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6590 = _6534;
    out.m_103.x = _6520;
    out.m_103.y = _6546;
    out.m_103.z = _6576;
    out.m_103.w = _6389;
    float _6592 = _6117 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6594 = _6590;
    float _6596 = _6590;
    if (!_6490)
    {
        _6536 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6598 = _6536;
    float _6600 = -_6435;
    float _6602 = _6600 + 1.0;
    float _6604 = _6602 * _6584;
    float _6606 = precise::clamp(_6604, 0.0, 1.0);
    float _6608 = -_6606;
    float _6610 = fma(_6608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6612 = _6610 * _6508;
    float _6614 = _6612 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6616 = _6540 * _6449;
    float _6618 = -_6540;
    float _6620 = _6618 + 1.0;
    out.m_105.x = _6614;
    float _6622 = _6460 * _6616;
    float _6624 = _6470 * _6616;
    float _6626 = _6460 * _6620;
    float _6628 = fma(_6466, _6622, _6454);
    float _6630 = fma(_6468, _6622, _6456);
    float _6632 = fma(_6460, _6624, _6458);
    out.m_107.x = _6628;
    out.m_107.y = _6630;
    out.m_107.z = _6632;
    out.m_107.w = _6626;
    bool _6634 = !_6490;
    float _6636 = _6598;
    float _6638 = _6598;
    if (!_6634)
    {
        bool _6640 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6642 = isnan(_6141);
        bool _6644 = _6640 || _6642;
        bool _6646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6648 = _6644 || _6646;
        if (!_6648)
        {
            float _6650 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6652 = _6141 + _6650;
            float _6654 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6656 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6654;
            float _6658 = 1.0 / _6656;
            float _6660 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6662 = _6660 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6664 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6666 = _6664 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6668 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6670 = _6668 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6672 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6674 = _6672 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6676 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6678 = _6676 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6680 = _6652 * _6658;
            float _6682 = precise::clamp(_6680, 0.0, 1.0);
            float _6684 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6686 = _6684 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6688 = fma(_6682, _6666, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6690 = fma(_6682, _6686, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6692 = fma(_6682, _6662, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6694 = fma(_6682, _6670, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6696 = fma(_6682, _6674, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6698 = fma(_6682, _6678, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6580 = _6692;
            _6588 = _6696;
            _6560 = _6690;
            _6638 = _6694;
            _6554 = _6688;
            _6596 = _6698;
            _6700 = true;
        }
        else
        {
            bool _6702 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6704 = isnan(_6141);
            bool _6706 = _6702 || _6704;
            bool _6708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6710 = _6706 || _6708;
            if (!_6710)
            {
                _6636 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6712 = _6636;
            _6638 = _6712;
            if (!_6710)
            {
                _6586 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6714 = _6586;
            _6588 = _6714;
            if (!_6710)
            {
                _6594 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6716 = _6594;
            _6596 = _6716;
            if (!_6710)
            {
                _6558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6718 = _6558;
            _6560 = _6718;
            if (!_6710)
            {
                _6578 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6720 = _6578;
            _6580 = _6720;
            if (!_6710)
            {
                _6552 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6722 = _6552;
            bool _6724 = !_6710;
            _6554 = _6722;
            if (!_6724)
            {
                bool _6726 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6728 = isnan(_6141);
                bool _6730 = _6726 || _6728;
                bool _6732 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6734 = _6730 || _6732;
                if (!_6734)
                {
                    float _6736 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6738 = _6141 + _6736;
                    float _6740 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6742 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6740;
                    float _6744 = 1.0 / _6742;
                    float _6746 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6748 = _6746 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6750 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6752 = _6750 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6754 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6756 = _6754 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6758 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6760 = _6758 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6762 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6764 = _6762 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6766 = _6738 * _6744;
                    float _6768 = precise::clamp(_6766, 0.0, 1.0);
                    float _6770 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6772 = _6770 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6774 = fma(_6768, _6752, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6776 = fma(_6768, _6772, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6778 = fma(_6768, _6748, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6780 = fma(_6768, _6756, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6782 = fma(_6768, _6760, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6784 = fma(_6768, _6764, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6580 = _6778;
                    _6588 = _6782;
                    _6560 = _6776;
                    _6638 = _6780;
                    _6554 = _6774;
                    _6596 = _6784;
                    _6700 = true;
                }
                else
                {
                    _6580 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6588 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6638 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6554 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6596 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6700 = false;
    float _6786 = _6580;
    float _6788 = _6588;
    float _6790 = _6560;
    float _6792 = _6638;
    float _6794 = _6554;
    float _6796 = _6596;
    float _6798 = _6592 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6800 = fma(_5719, -0.5, 0.5);
    float _6802 = precise::clamp(_6800, 0.0, 1.0);
    float _6804 = -_6786;
    float _6806 = _6788 + _6804;
    float _6808 = -_6790;
    float _6810 = _6792 + _6808;
    out.m_51.x = _6798;
    float _6812 = fma(_6802, _6806, _6786);
    float _6814 = -_6794;
    float _6816 = _6796 + _6814;
    float _6818 = fma(_6802, _6810, _6790);
    float _6820 = _6812 * 0.586610972881317138671875;
    bool _6822 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6824 = fma(_6802, _6816, _6794);
    out.m_109.x = 0.0;
    float _6826 = fma(_6818, 0.298911988735198974609375, _6820);
    bool _6828 = _6117 > 0.0;
    bool _6830 = isnan(_6117);
    bool _6832 = _6828 || _6830;
    bool _6834 = isnan(0.0);
    bool _6836 = _6832 || _6834;
    float _6838 = fma(_6824, 0.114477999508380889892578125, _6826);
    float _6840 = -_6838;
    float _6842 = _6818 + _6840;
    float _6844 = -_6838;
    float _6846 = _6812 + _6844;
    float _6848 = -_6838;
    float _6850 = _6824 + _6848;
    float _6852 = fma(_6842, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    float _6854 = fma(_6846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    float _6856 = fma(_6850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    bool _6858 = !_6822;
    if (!_6858)
    {
        float _6860 = -_6063;
        float _6862 = _6860 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6864 = -_6065;
        float _6866 = _6864 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6868 = -_6067;
        float _6870 = _6868 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6872 = _6862 * _6862;
        float _6874 = fma(_6866, _6866, _6872);
        float _6876 = fma(_6870, _6870, _6874);
        float _6878 = sqrt(_6876);
        float _6880 = rsqrt(_6876);
        float _6882 = -_6878;
        float _6884 = _6882 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6886 = _6884 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6888 = precise::clamp(_6886, 0.0, 1.0);
        float _6890 = _6866 * _6880;
        float _6892 = _6862 * _6880;
        float _6894 = abs(_6888);
        float _6896 = log2(_6894);
        float _6898 = _6870 * _6880;
        float _6900 = _6890 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6902 = _5719 * _6892;
        float _6904 = -_6892;
        float _6906 = -_6900;
        float _6908 = fma(_6904, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6906);
        float _6910 = fma(_5725, _6890, _6902);
        float _6912 = -_6898;
        float _6914 = fma(_6912, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6908);
        float _6916 = fma(_5733, _6898, _6910);
        float _6918 = precise::clamp(_6916, 0.0, 1.0);
        float _6920 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6922 = _6914 + _6920;
        float _6924 = _6896 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6926 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6928 = precise::clamp(_6926, 0.0, 1.0);
        float _6930 = exp2(_6924);
        float _6932 = _6930 * _6928;
        float _6934 = _6918 * _6932;
        float _6936 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6938 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6940 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6936;
        out.m_109.y = _6938;
        out.m_109.z = _6940;
    }
    out.m_111.x = _6852;
    out.m_111.y = _6854;
    out.m_111.z = _6856;
    if (_6836)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _6942 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6942;
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
    bool _6700 = false;
    bool _5781 = false;
    bool _1146 = false;
    bool _822 = false;
    bool _680 = false;
    bool _526 = false;
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
        float _6999 = as_type<float>(_146);
        out.gl_Position.z = _6999;
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
        float _7068 = as_type<float>(_184);
        out.gl_Position.z = _7068;
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
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _262 = _258 + _260;
    float _264 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _266 = _258 + _264;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _270 = _258 + _268;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _278 = _276 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = 1.0 / _278;
    bool _290 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _292 = 1.0 / _282;
    bool _294 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _296 = isnan(_258);
    bool _298 = _294 || _296;
    bool _300 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _302 = _298 || _300;
    float _304 = float(_302);
    float _306 = 1.0 / _274;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _310 = _258 + _308;
    float _312 = _310 * _288;
    bool _314 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _316 = isnan(_258);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = 1.0 / _286;
    float _328 = _262 * _292;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _266 * _306;
    bool _340 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _342 = isnan(_258);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = -_324;
    float _354 = _352 + 1.0;
    float _356 = fma(_336, _328, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = fma(_332, _328, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _360 = _350 * _354;
    float _362 = -_350;
    float _364 = _362 + 1.0;
    float _366 = _270 * _326;
    bool _368 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _370 = isnan(_258);
    bool _372 = _368 || _370;
    bool _374 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _376 = _372 || _374;
    float _378 = float(_376);
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _382 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _380;
    bool _384 = _258 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _386 = isnan(_258);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _398 = _396 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _400 = fma(_382, _328, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _402 = -_378;
    float _404 = _402 + 1.0;
    float _406 = _378 * _364;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = _304 * _404;
    float _418 = -_304;
    float _420 = _418 + 1.0;
    float _422 = fma(_398, _366, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_414, _366, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_410, _366, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _394 * _420;
    float _430 = -_394;
    float _432 = _430 + 1.0;
    float _434 = _356 * _428;
    float _436 = _358 * _428;
    float _438 = _400 * _428;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _454;
    float _458 = fma(_422, _416, _444);
    float _460 = fma(_424, _416, _446);
    float _462 = fma(_426, _416, _448);
    float _464 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _466 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _468 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _472 = _470 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _476 = _474 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _478 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _480 = _478 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _482 = fma(_464, _406, _458);
    float _484 = fma(_472, _312, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _486 = fma(_476, _312, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _488 = fma(_480, _312, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _490 = fma(_466, _406, _460);
    float _492 = fma(_468, _406, _462);
    float _494 = fma(_484, _360, _482);
    float _496 = fma(_486, _360, _490);
    float _498 = fma(_488, _360, _492);
    float _500 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].x, _494);
    float _502 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].y, _496);
    float _504 = fma(_324, (*spvDescriptorSet0.vp_c9)._m0[147].z, _498);
    bool _506 = !_290;
    float _524;
    if (!_506)
    {
        float _508 = in.m_63.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _524 = _522;
        _526 = true;
    }
    else
    {
        float _528 = float(_130);
        float _530 = 1.0 / _528;
        float _532 = _164 * _530;
        _524 = _532;
    }
    _526 = false;
    float _534 = _524;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _538 = _534 + _536;
    float _540 = in.m_65.x;
    float _542 = in.m_65.y;
    float _544 = in.m_65.z;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = isnan(_534);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_534);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _578;
    bool _582 = _534 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_534);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _548;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _534 + _600;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _576 * _598;
    float _608 = -_576;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _564;
    float _614 = _580 * _594;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _538, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = _618 * _612;
    float _624 = -_592;
    float _626 = _624 + 1.0;
    float _628 = _620 * _606;
    float _630 = fma(_622, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _632 = _560 * _626;
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _636 = _504 * _544;
    float _638 = fma(_630, _632, _634);
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _638);
    float _646 = _502 * _542;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _650 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _644 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _656 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _500 * _540;
    out.m_67.x = _650;
    out.m_67.y = _652;
    out.m_67.z = _656;
    out.m_67.w = _654;
    bool _660 = !_604;
    float _678;
    if (!_660)
    {
        float _662 = in.m_63.x;
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        float _682 = float(_130);
        float _684 = 1.0 / _682;
        float _686 = _164 * _684;
        _678 = _686;
    }
    _680 = false;
    float _688 = _678;
    float _690 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _692 = _688 + _690;
    float _694 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _696 = _694 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _698 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _700 = isnan(_688);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _712 = _710 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _714 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _716 = isnan(_688);
    bool _718 = _714 || _716;
    bool _720 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _722 = _718 || _720;
    float _724 = float(_722);
    float _726 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _726;
    bool _730 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _732 = isnan(_688);
    bool _734 = _730 || _732;
    bool _736 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _738 = _734 || _736;
    float _740 = float(_738);
    float _742 = 1.0 / _696;
    float _744 = -_708;
    float _746 = _744 + 1.0;
    float _748 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _750 = _688 + _748;
    bool _752 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _754 = _724 * _746;
    float _756 = -_724;
    float _758 = _756 + 1.0;
    float _760 = 1.0 / _712;
    float _762 = _728 * _742;
    float _764 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _766 = _764 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _768 = fma(_762, _692, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _770 = -_740;
    float _772 = _770 + 1.0;
    float _774 = _766 * _760;
    float _776 = _768 * _754;
    float _778 = _708 * _772;
    float _780 = fma(_774, _750, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _782 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[131].x, _776);
    float _784 = fma(_780, _778, _782);
    float _786 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _792 = fma(_740, (*spvDescriptorSet0.vp_c9)._m0[133].x, _784);
    float _794 = _786 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _788 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _798 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _794;
    out.m_69.y = _796;
    out.m_69.z = _798;
    out.m_69.w = _800;
    bool _802 = !_752;
    float _820;
    if (!_802)
    {
        float _804 = in.m_63.x;
        float _806 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _808 = _804 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _810 = fma(_808, (*spvDescriptorSet0.vp_c9)._m0[14].x, _164);
        float _812 = _810 * _806;
        float _814 = floor(_812);
        float _816 = -_814;
        float _818 = _812 + _816;
        _820 = _818;
        _822 = true;
    }
    else
    {
        float _824 = float(_130);
        float _826 = 1.0 / _824;
        float _828 = _164 * _826;
        _820 = _828;
    }
    _822 = false;
    float _830 = _820;
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _834 = _830 + _832;
    bool _836 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _838 = isnan(_830);
    bool _840 = _836 || _838;
    bool _842 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _844 = _840 || _842;
    float _846 = float(_844);
    float _848 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _850 = _848 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _852;
    bool _856 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _858 = isnan(_830);
    bool _860 = _856 || _858;
    bool _862 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _864 = _860 || _862;
    float _866 = float(_864);
    float _868 = -_846;
    float _870 = _868 + 1.0;
    bool _872 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _874 = isnan(_830);
    bool _876 = _872 || _874;
    bool _878 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _880 = _876 || _878;
    float _882 = float(_880);
    float _884 = 1.0 / _850;
    float _886 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _888 = _886 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _890 = _866 * _870;
    float _892 = -_882;
    float _894 = _892 + 1.0;
    float _896 = 1.0 / _888;
    bool _898 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _900 = _854 * _884;
    float _902 = -_866;
    float _904 = _902 + 1.0;
    bool _906 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _908 = isnan(_830);
    bool _910 = _906 || _908;
    bool _912 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _914 = _910 || _912;
    float _916 = float(_914);
    float _918 = fma(_900, _834, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _920 = _882 * _904;
    bool _922 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _924 = isnan(_830);
    bool _926 = _922 || _924;
    bool _928 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _930 = _926 || _928;
    float _932 = float(_930);
    float _934 = _916 * _894;
    float _936 = -_916;
    float _938 = _936 + 1.0;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _944 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _946 = isnan(_830);
    bool _948 = _944 || _946;
    bool _950 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _952 = _948 || _950;
    float _954 = float(_952);
    float _956 = _932 * _938;
    float _958 = -_932;
    float _960 = _958 + 1.0;
    bool _962 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _964 = isnan(_830);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = 1.0 / _942;
    float _976 = -_954;
    float _978 = _976 + 1.0;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _982 = _980 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _984 = _954 * _960;
    float _986 = _972 * _978;
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _988 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _992 = -_972;
    float _994 = _992 + 1.0;
    float _996 = 1.0 / _982;
    float _998 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1000 = _998 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1002 = _918 * _986;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _830 + _1008;
    float _1012 = _1000 * _896;
    float _1014 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1002);
    float _1016 = 1.0 / _990;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1020 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1018;
    float _1022 = fma(_1012, _1010, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1026 = _1024 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1030 = _830 + _1028;
    float _1032 = _1020 * _974;
    float _1034 = fma(_1022, _984, _1014);
    float _1036 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1038 = _830 + _1036;
    float _1040 = 1.0 / _1006;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1044 = _1042 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1046 = fma(_1032, _1030, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1048 = _1044 * _996;
    bool _1050 = _830 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1052 = isnan(_830);
    bool _1054 = _1050 || _1052;
    bool _1056 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1058 = _1054 || _1056;
    int _1060 = _1058 ? 1065353216 : 0;
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1064 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1062;
    float _1066 = 1.0 / _1026;
    float _1068 = fma(_1046, _956, _1034);
    float _1070 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1072 = _1070 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1074 = _1064 * _1016;
    float _1076 = fma(_1048, _1038, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1080 = _830 + _1078;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1084 = _830 + _1082;
    float _1086 = _1072 * _1040;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1088;
    float _1092 = fma(_1074, _1080, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1094 = fma(_1076, _934, _1068);
    float _1096 = fma(_1086, _1084, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1098 = -as_type<float>(_1060);
    float _1100 = _1098 + 1.0;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _830 + _1102;
    float _1106 = fma(_1092, _920, _1094);
    float _1108 = _1090 * _1066;
    float _1110 = _846 * _1100;
    float _1112 = fma(_1096, _890, _1106);
    float _1114 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1116 = fma(_1114, _1110, _1112);
    float _1118 = fma(as_type<float>(_1060), (*spvDescriptorSet0.vp_c9)._m0[166].x, _1116);
    out.m_71.x = _1118;
    bool _1120 = !_898;
    float _1122 = _890;
    int _1124 = _1060;
    int _1126 = as_type<int>(_1110);
    float _1144;
    if (!_1120)
    {
        float _1128 = in.m_63.x;
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1132 = _1128 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[14].y, _164);
        float _1136 = _1134 * _1130;
        float _1138 = floor(_1136);
        float _1140 = -_1138;
        float _1142 = _1136 + _1140;
        _1144 = _1142;
        _1146 = true;
    }
    else
    {
        float _1148 = float(_130);
        float _1150 = 1.0 / _1148;
        float _1152 = _164 * _1150;
        _1144 = _1152;
    }
    _1146 = false;
    float _1154 = _1144;
    float _1156 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1158 = int(_1156);
    float _1160 = in.m_73.x;
    int _1162 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1164 = _1162 != 0;
    float _1166 = in.m_63.y;
    float _1168 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1170 = int(_1168);
    int _1172 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1174 = _1172 != 0;
    float _1176 = 0.0;
    int _1178 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1164)
    {
        _1176 = 1.0;
    }
    float _1180 = _1176;
    int _1182 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1184 = _1182 != 0;
    int _1186 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1188 = _1186 != 0;
    float _1190 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1192 = int(_1190);
    float _1194 = float(_1158);
    float _1196 = 0.0;
    float _1198 = _1180;
    bool _1200 = _1184;
    bool _1202 = _1188;
    if (_1164)
    {
        _1196 = 1.0;
    }
    float _1204 = _1196;
    float _1206 = 0.0;
    float _1208 = _1204;
    if (_1164)
    {
        _1206 = 1.0;
    }
    float _1210 = _1206;
    int _1212 = 0;
    float _1214 = _1210;
    if (_1164)
    {
        _1212 = 0;
    }
    int _1216 = _1212;
    float _1218 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1220 = int(_1218);
    float _1222 = float(_1170);
    int _1224 = _1216;
    if (_1164)
    {
        _1178 = 0;
    }
    int _1226 = _1178;
    int _1228 = _1226;
    float _1230 = _1160;
    if (!_1174)
    {
        _1122 = _1160;
    }
    float _1232 = _1122;
    float _1234 = _1232;
    if (_1184)
    {
        float _1236 = -_1160;
        float _1238 = _1236 + 1.0;
        _1124 = as_type<int>(_1238);
    }
    int _1240 = _1124;
    if (_1188)
    {
        float _1242 = -_1160;
        float _1244 = _1242 + 1.0;
        _1126 = as_type<int>(_1244);
    }
    int _1246 = _1126;
    bool _1248 = _1166 > 0.5;
    float _1250 = 1.0 / _1194;
    float _1252 = float(_1192);
    float _1254 = 0.0;
    if (!_1184)
    {
        _1254 = _1160;
    }
    float _1256 = _1254;
    float _1258 = 0.0;
    float _1260 = _1256;
    if (!_1188)
    {
        _1258 = _1160;
    }
    float _1262 = _1258;
    float _1264 = _1262;
    if (_1184)
    {
        float _1266 = _1248 ? as_type<float>(_1240) : _1160;
        _1260 = _1266;
    }
    float _1268 = _1260;
    float _1270 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1272 = int(_1270);
    float _1274 = float(uint(_1220));
    if (_1188)
    {
        float _1276 = _1248 ? as_type<float>(_1246) : _1160;
        _1264 = _1276;
    }
    float _1278 = _1264;
    int _1280 = 0;
    if (_1164)
    {
        _1280 = as_type<int>(_1166);
    }
    int _1282 = _1280;
    float _1284 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1286 = int(_1284);
    float _1288 = _1250 * _164;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1292 = int(_1290);
    float _1294 = float(uint(_1272));
    float _1296 = 1.0 / _1222;
    float _1298 = float(_1286);
    float _1300 = 1.0 / _1252;
    float _1302 = float(uint(_1292));
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1306 = int(_1304);
    float _1308 = _1296 * _164;
    float _1310 = 1.0 / _1274;
    float _1312 = _1300 * _164;
    float _1314 = 1.0 / _1294;
    float _1316 = float(uint(_1306));
    float _1318 = trunc(_1288);
    int _1320 = int(_1318);
    float _1322 = _1294;
    int _1324 = _1282;
    if (_1164)
    {
        float _1326 = in.m_63.x;
        _1322 = _1326;
    }
    float _1328 = _1322;
    int _1330 = as_type<int>(_1310) + (-2);
    float _1332 = 1.0 / _1298;
    int _1334 = as_type<int>(_1314) + (-2);
    float _1336 = 1.0 / _1302;
    float _1338 = float(uint(_1320));
    float _1340 = as_type<float>(_1334) * _1338;
    float _1342 = trunc(_1308);
    int _1344 = int(_1342);
    float _1346 = _1332 * _164;
    float _1348 = trunc(_1312);
    int _1350 = int(_1348);
    int _1352 = as_type<int>(_1336) + (-2);
    float _1354 = 1.0 / _1316;
    float _1356 = float(uint(_1344));
    float _1358 = as_type<float>(_1352) * _1356;
    float _1360 = trunc(_1346);
    int _1362 = int(_1360);
    float _1364 = _1316;
    int _1366 = as_type<int>(_1358);
    if (_1164)
    {
        float _1368 = in.m_63.z;
        _1364 = _1368;
    }
    float _1370 = _1364;
    float _1372 = float(uint(_1350));
    float _1374 = as_type<float>(_1330) * _1372;
    float _1376 = trunc(_1340);
    float _1378 = precise::max(_1376, 0.0);
    uint _1381 = uint(_1378);
    float _1383 = trunc(_1358);
    float _1385 = precise::max(_1383, 0.0);
    uint _1387 = uint(_1385);
    float _1389 = trunc(_1374);
    float _1391 = precise::max(_1389, 0.0);
    uint _1393 = uint(_1391);
    float _1395 = _1328;
    if (_1164)
    {
        _1366 = as_type<int>(_1328);
    }
    int _1397 = _1366;
    int _1399 = 0;
    float _1401 = as_type<float>(_1397);
    float _1403 = _1370;
    if (_1164)
    {
        _1399 = as_type<int>(_1370);
    }
    int _1405 = _1399;
    int _1407 = 0;
    int _1409 = _1405;
    if (_1164)
    {
        _1407 = _1397;
    }
    int _1411 = _1407;
    int _1413 = int(_1184);
    int _1415 = _1174 ? 2 : 0;
    int _1417 = _1413 | _1415;
    int _1419 = _1188 ? 4 : 0;
    int _1421 = _1417 | _1419;
    int _1423 = _1164 ? 8 : 0;
    int _1425 = _1421 | _1423;
    int _1427 = false ? 16 : 0;
    int _1429 = _1425 | _1427;
    int _1431 = _1248 ? 32 : 0;
    int _1433 = _1429 | _1431;
    int _1435 = false ? 64 : 0;
    int _1437 = _1433 | _1435;
    int _1439 = _1437 & 32;
    float _1441 = as_type<float>(_1439);
    int _1443 = _1411;
    if (_1164)
    {
        _1441 = as_type<float>(_1397);
    }
    float _1445 = _1441;
    float _1447 = _1445;
    if (!_1164)
    {
        float _1449 = in.m_63.x;
        float _1451 = _1166 * 3.1415927410125732421875;
        float _1453 = in.m_63.z;
        float _1455 = _1451 * 0.15915493667125701904296875;
        float _1457 = _1455 * 6.283185482025146484375;
        float _1459 = sin(_1457);
        float _1461 = _1449 * 3.1415927410125732421875;
        float _1463 = _1461 * 0.15915493667125701904296875;
        float _1465 = _1453 * 3.1415927410125732421875;
        float _1467 = _1465 * 0.15915493667125701904296875;
        float _1469 = _1463 * 6.283185482025146484375;
        float _1471 = sin(_1469);
        float _1473 = _1467 * 6.283185482025146484375;
        float _1475 = sin(_1473);
        _1447 = _1453;
        _1214 = 5.839270114898681640625;
        _1395 = _1449;
        _1198 = 7.345489978790283203125;
        _1401 = _1166;
        _1208 = 1.2345600128173828125;
        _1224 = 1;
        _1228 = 2;
        _1403 = _1453;
        _1324 = as_type<int>(_1459);
        _1443 = as_type<int>(_1471);
        _1409 = as_type<int>(_1475);
    }
    float _1477 = _1447;
    float _1479 = _1214;
    float _1481 = _1395;
    float _1483 = _1198;
    float _1485 = _1401;
    float _1487 = _1208;
    int _1489 = _1224;
    int _1491 = _1228;
    float _1493 = _1403;
    int _1495 = _1324;
    int _1497 = _1443;
    int _1499 = _1409;
    int _1501 = ~_1220;
    int _1503 = _1501 + 1;
    float _1505 = _1066;
    if (_1174)
    {
        float _1507 = in.m_63.x;
        _1505 = _1507;
    }
    float _1509 = _1505;
    int _1511 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1513 = _1511 != 0;
    float _1515 = _1477 * _1479;
    int _1517 = ~_1292;
    int _1519 = _1517 + 1;
    int _1521 = _1503 * int(_1393);
    int _1523 = _1521 + _1350;
    int _1525 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1527 = _1525 != 0;
    float _1529 = _1481 * _1483;
    float _1531 = _1485 * _1487;
    int _1533 = as_type<int>(_1354) + (-2);
    float _1535 = floor(_1515);
    float _1537 = float(uint(_1523));
    int _1539 = _1519 * int(_1387);
    int _1541 = _1539 + _1344;
    float _1543 = float(uint(_1362));
    float _1545 = _1485 * _1483;
    float _1547 = _1477;
    if (_1513)
    {
        float _1549 = in.m_63.z;
        _1547 = _1549;
    }
    float _1551 = _1547;
    int _1553 = ~_1272;
    int _1555 = _1553 + 1;
    float _1557 = as_type<float>(_1330) * _1537;
    float _1559 = float(uint(_1541));
    float _1561 = floor(_1529);
    int _1563 = 0;
    float _1565 = _1557;
    if (_1527)
    {
        float _1567 = -_1160;
        float _1569 = _1567 + 1.0;
        _1563 = as_type<int>(_1569);
    }
    int _1571 = _1563;
    int _1573 = _1555 * int(_1381);
    int _1575 = _1573 + _1320;
    int _1577 = 0;
    if (_1513)
    {
        float _1579 = -_1160;
        float _1581 = _1579 + 1.0;
        _1577 = as_type<int>(_1581);
    }
    int _1583 = _1577;
    float _1585 = as_type<float>(_1352) * _1559;
    int _1587 = ~_1220;
    int _1589 = _1587 + 1;
    bool _1591 = _1489 != 1;
    float _1593 = _1509;
    if (_1174)
    {
        bool _1595 = _1509 > 0.5;
        _1200 = _1595;
    }
    bool _1597 = _1200;
    float _1599 = floor(_1531);
    if (!_1527)
    {
        _1593 = _1160;
    }
    float _1601 = _1593;
    bool _1603 = _1491 != 2;
    float _1605 = _1601;
    if (_1527)
    {
        float _1607 = _1248 ? as_type<float>(_1571) : _1160;
        _1605 = _1607;
    }
    float _1609 = _1605;
    float _1611 = _1166 * 2.0;
    float _1613 = float(uint(_1575));
    float _1615 = in.m_59.w;
    int _1617 = ~_1272;
    int _1619 = _1617 + 1;
    float _1621 = trunc(_1585);
    float _1623 = precise::max(_1621, 0.0);
    uint _1625 = uint(_1623);
    float _1627 = -_1561;
    float _1629 = _1529 + _1627;
    float _1631 = as_type<float>(_1334) * _1613;
    int _1633 = ~_1306;
    int _1635 = _1633 + 1;
    int _1637 = as_type<int>(_1613);
    float _1639 = as_type<float>(_1619);
    if (_1174)
    {
        float _1641 = -_1160;
        float _1643 = _1641 + 1.0;
        _1637 = as_type<int>(_1643);
    }
    int _1645 = _1637;
    if (_1513)
    {
        bool _1647 = _1551 > 0.5;
        _1202 = _1647;
    }
    bool _1649 = _1202;
    float _1651 = in.m_61.w;
    int _1653 = ~_1292;
    int _1655 = _1653 + 1;
    float _1657 = -_1599;
    float _1659 = _1531 + _1657;
    float _1661 = as_type<float>(_1533) * _1543;
    float _1663 = float(_130);
    float _1665 = trunc(_1631);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    float _1671 = float(_1220);
    float _1673 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    float _1675 = as_type<float>(_1655);
    if (_1174)
    {
        float _1677 = _1597 ? as_type<float>(_1645) : _1160;
        _1234 = _1677;
    }
    float _1679 = _1234;
    int _1681 = int(_1387) + int(_1625);
    float _1683 = _1629 * _1671;
    float _1685 = float(_1350);
    float _1687 = trunc(_1661);
    float _1689 = precise::max(_1687, 0.0);
    uint _1691 = uint(_1689);
    float _1693 = -_1535;
    float _1695 = _1515 + _1693;
    float _1697 = float(_1292);
    bool _1699 = _1685 >= _1671;
    bool _1701 = isnan(_1685);
    bool _1703 = _1699 || _1701;
    bool _1705 = isnan(_1671);
    bool _1707 = _1703 || _1705;
    float _1709 = float(_1707);
    float _1711 = float(_1306);
    float _1713 = floor(_1545);
    int _1715 = int(_1381) + int(_1669);
    int _1717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1719 = _1717 != 0;
    int _1721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1723 = _1721 != 0;
    float _1725 = 1.0 / _1663;
    int _1727 = _1635 * int(_1691);
    int _1729 = _1727 + _1362;
    float _1731 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _1733 = float(uint(_1729));
    float _1735 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1737 = trunc(_1557);
    float _1739 = precise::max(_1737, 0.0);
    uint _1741 = uint(_1739);
    float _1743 = _1671 * _164;
    float _1745 = -_1713;
    float _1747 = _1545 + _1745;
    float _1749 = as_type<float>(_1533) * _1733;
    float _1751 = float(_1344);
    float _1753 = _1697 * _1659;
    float _1755 = float(_1272);
    float _1757 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    float _1759 = trunc(_1749);
    float _1761 = precise::max(_1759, 0.0);
    uint _1763 = uint(_1761);
    if (!_1513)
    {
        _1565 = _1160;
    }
    float _1765 = _1565;
    float _1767 = _1743 * _1725;
    float _1769 = _1765;
    if (_1513)
    {
        float _1771 = _1649 ? as_type<float>(_1583) : _1160;
        _1769 = _1771;
    }
    float _1773 = _1769;
    float _1775 = _1725 * _164;
    float _1777 = float(_1320);
    float _1779 = _1755 * _1695;
    bool _1781 = _1751 >= _1697;
    bool _1783 = isnan(_1751);
    bool _1785 = _1781 || _1783;
    bool _1787 = isnan(_1697);
    bool _1789 = _1785 || _1787;
    float _1791 = float(_1789);
    float _1793 = _1755 * _1775;
    int _1795 = int(_1393) + int(_1741);
    float _1797 = _1711 * _1775;
    float _1799 = float(_1362);
    float _1801 = trunc(_1791);
    int _1803 = int(_1801);
    bool _1805 = _1777 >= _1755;
    bool _1807 = isnan(_1777);
    bool _1809 = _1805 || _1807;
    bool _1811 = isnan(_1755);
    bool _1813 = _1809 || _1811;
    float _1815 = float(_1813);
    float _1817 = _1711 * _1747;
    bool _1819 = _1799 >= _1711;
    bool _1821 = isnan(_1799);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(_1711);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    int _1831 = _1589 * _1795;
    int _1833 = _1831 + _1350;
    int _1835 = _1655 * _1681;
    int _1837 = _1835 + _1344;
    int _1839 = int(_1691) + int(_1763);
    float _1841 = trunc(_1709);
    int _1843 = int(_1841);
    bool _1845 = !_1719;
    int _1847 = _1845 ? 0 : 1;
    float _1849 = _1697 * _1775;
    bool _1851 = uint(_1833) >= uint(_1220);
    int _1853 = _1619 * _1715;
    int _1855 = _1853 + _1320;
    int _1857 = abs(_1847);
    int _1859 = ~_1306;
    int _1861 = _1859 + 1;
    float _1863 = trunc(_1683);
    int _1865 = int(_1863);
    bool _1867 = uint(_1837) >= uint(_1292);
    bool _1869 = uint(_1855) >= uint(_1272);
    int _1871 = _1861 * _1839;
    int _1873 = _1871 + _1362;
    bool _1875 = !_1723;
    int _1877 = _1875 ? 0 : 1;
    bool _1879 = !_1851;
    int _1881 = _1879 ? 0 : (-1);
    float _1883 = trunc(_1753);
    int _1885 = int(_1883);
    bool _1887 = !_1867;
    int _1889 = _1887 ? 0 : (-1);
    int _1891 = abs(_1877);
    int _1893 = ~_1795;
    int _1895 = _1893 + _1881;
    int _1897 = _1895 + 1;
    bool _1899 = !_1869;
    int _1901 = _1899 ? 0 : (-1);
    float _1903 = trunc(_1815);
    int _1905 = int(_1903);
    bool _1907 = uint(_1873) >= uint(_1306);
    int _1909 = _1865 * _1857;
    int _1911 = _1909 + _1350;
    int _1913 = ~_1681;
    int _1915 = _1913 + _1889;
    int _1917 = _1915 + 1;
    int _1919 = ~_1715;
    int _1921 = _1919 + _1901;
    int _1923 = _1921 + 1;
    int _1925 = _1220 * _1897;
    int _1927 = _1925 + _1350;
    bool _1929 = !_1907;
    int _1931 = _1929 ? 0 : (-1);
    int _1933 = _1885 * _1891;
    int _1935 = _1933 + _1344;
    int _1937 = _1292 * _1917;
    int _1939 = _1937 + _1344;
    int _1941 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1943 = _1941 != 0;
    float _1945 = trunc(_1779);
    int _1947 = int(_1945);
    int _1949 = ~_1839;
    int _1951 = _1949 + _1931;
    int _1953 = _1951 + 1;
    int _1955 = _1272 * _1923;
    int _1957 = _1955 + _1320;
    int _1959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1961 = _1959 != 0;
    int _1963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1965 = _1963 != 0;
    int _1967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1969 = _1967 != 0;
    bool _1971 = _1292 == 0;
    int _1973 = _1306 * _1953;
    int _1975 = _1973 + _1362;
    bool _1977 = !_1943;
    int _1979 = _1977 ? 0 : 1;
    float _1981 = trunc(_1829);
    int _1983 = int(_1981);
    bool _1985 = _1220 == 0;
    bool _1987 = _1272 == 0;
    int _1989 = ~_1803;
    int _1991 = _1989 + 1;
    int _1993 = _1991 + 1;
    bool _1995 = _1306 == 0;
    float _1997 = trunc(_1767);
    int _1999 = int(_1997);
    bool _2001 = !_1971;
    int _2003 = _2001 ? _1939 : (-1);
    int _2005 = ~_1843;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    bool _2011 = !_1985;
    int _2013 = _2011 ? _1927 : (-1);
    int _2015 = _1993 * _2003;
    int _2017 = abs(_1979);
    float _2019 = trunc(_1849);
    int _2021 = int(_2019);
    int _2023 = ~_1905;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    int _2029 = _2013 * _2009;
    bool _2031 = !_1987;
    int _2033 = _2031 ? _1957 : (-1);
    int _2035 = _1947 * _2017;
    int _2037 = _2035 + _1320;
    bool _2039 = !_1995;
    int _2041 = _2039 ? _1975 : (-1);
    int _2043 = _1220 + (-1);
    int _2045 = _2027 * _2033;
    bool _2047 = !_1965;
    int _2049 = _2047 ? 0 : 1;
    float _2051 = floor(_1611);
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2055 = _2053 != 0;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2059 = _2057 != 0;
    int _2061 = _1843 * _2043;
    int _2063 = _2061 + _2029;
    int _2065 = _1292 + (-1);
    int _2067 = abs(_2049);
    bool _2069 = !_1961;
    int _2071 = _2069 ? 0 : 1;
    int _2073 = _1803 * _2065;
    int _2075 = _2073 + _2015;
    bool _2077 = !_2059;
    int _2079 = _2077 ? 0 : 1;
    int _2081 = _2063 * _2067;
    int _2083 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2085 = _2083 != 0;
    int _2087 = abs(_2071);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2091 = _2089 != 0;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2095 = _2093 != 0;
    bool _2097 = !_1969;
    int _2099 = _2097 ? 0 : 1;
    int _2101 = _1999 * _2087;
    int _2103 = _2101 + _2081;
    int _2105 = abs(_2079);
    bool _2107 = !_2091;
    int _2109 = _2107 ? 0 : 1;
    int _2111 = abs(_2099);
    int _2113 = _2075 * _2105;
    bool _2115 = !_2085;
    int _2117 = _2115 ? 0 : 1;
    int _2119 = abs(_2109);
    bool _2121 = !_2055;
    int _2123 = _2121 ? 0 : 1;
    int _2125 = abs(_2117);
    int _2127 = _1911 * _2111;
    int _2129 = _2127 + _2103;
    int _2131 = abs(_2123);
    int _2133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2135 = _2133 != 0;
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2139 = _2137 != 0;
    int _2141 = _2021 * _2131;
    int _2143 = _2141 + _2113;
    bool _2145 = !_2095;
    int _2147 = _2145 ? 0 : 1;
    int _2149 = _1865 * _2125;
    int _2151 = _2149 + _2129;
    float _2153 = trunc(_1817);
    int _2155 = int(_2153);
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2147);
    int _2163 = _1935 * _2119;
    int _2165 = _2163 + _2143;
    bool _2167 = !_2159;
    int _2169 = _2167 ? 0 : 1;
    bool _2171 = !_2139;
    int _2173 = _2171 ? 0 : 1;
    float _2175 = trunc(_1793);
    int _2177 = int(_2175);
    float _2179 = float(uint(_2151));
    int _2181 = abs(_2169);
    int _2183 = _1885 * _2161;
    int _2185 = _2183 + _2165;
    int _2187 = abs(_2173);
    float _2189 = as_type<float>(_1330) * _2179;
    int _2191 = _1272 + (-1);
    bool _2193 = !_2135;
    int _2195 = _2193 ? 0 : 1;
    float _2197 = trunc(_2189);
    float _2199 = precise::max(_2197, 0.0);
    uint _2201 = uint(_2199);
    int _2203 = ~_1983;
    int _2205 = _2203 + 1;
    int _2207 = _2205 + 1;
    int _2209 = _1905 * _2191;
    int _2211 = _2209 + _2045;
    int _2213 = abs(_2195);
    float _2215 = in.m_73.y;
    int _2217 = _2207 * _2041;
    float _2219 = float(uint(_2185));
    int _2221 = _2211 * _2187;
    int _2223 = _1306 + (-1);
    int _2225 = _2155 * _2181;
    int _2227 = _2225 + _1362;
    int _2229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2231 = _2229 != 0;
    float _2233 = as_type<float>(_1352) * _2219;
    int _2235 = _2177 * _2213;
    int _2237 = _2235 + _2221;
    int _2239 = ~_1220;
    int _2241 = _2239 + 1;
    int _2243 = _1983 * _2223;
    int _2245 = _2243 + _2217;
    bool _2247 = !_2231;
    int _2249 = _2247 ? 0 : 1;
    float _2251 = trunc(_2233);
    float _2253 = precise::max(_2251, 0.0);
    uint _2255 = uint(_2253);
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2259 = _2257 != 0;
    int _2261 = abs(_2249);
    int _2263 = _2241 * int(_2201);
    int _2265 = _2263 + _2151;
    bool _2267 = !_2259;
    int _2269 = _2267 ? 0 : 1;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2273 = _2271 != 0;
    int _2275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2277 = _2275 != 0;
    float _2279 = trunc(_1797);
    int _2281 = int(_2279);
    int _2283 = ~_1292;
    int _2285 = _2283 + 1;
    float _2287 = float(uint(_2265));
    int _2289 = _2037 * _2261;
    int _2291 = _2289 + _2237;
    bool _2293 = !_2277;
    int _2295 = _2293 ? 0 : 1;
    float _2297 = -_2215;
    float _2299 = _2297 + 1.0;
    float _2301 = as_type<float>(_1330) * _2287;
    bool _2303 = !_2273;
    int _2305 = _2303 ? 0 : 1;
    int _2307 = abs(_2295);
    int _2309 = _2285 * int(_2255);
    int _2311 = _2309 + _2185;
    int _2313 = abs(_2269);
    float _2315 = trunc(_2301);
    float _2317 = precise::max(_2315, 0.0);
    uint _2319 = uint(_2317);
    int _2321 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2323 = _2321 != 0;
    int _2325 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2327 = _2325 != 0;
    int _2329 = abs(_2305);
    float _2331 = float(uint(_2311));
    int _2333 = _2245 * _2307;
    bool _2335 = !_2323;
    int _2337 = _2335 ? 0 : 1;
    int _2339 = _1947 * _2313;
    int _2341 = _2339 + _2291;
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2345 = _2343 != 0;
    float _2347 = as_type<float>(_1352) * _2331;
    int _2349 = abs(_2337);
    float _2351 = float(uint(_2341));
    float _2353 = trunc(_2347);
    float _2355 = precise::max(_2353, 0.0);
    uint _2357 = uint(_2355);
    int _2359 = _2281 * _2329;
    int _2361 = _2359 + _2333;
    bool _2363 = !_2327;
    int _2365 = _2363 ? 0 : 1;
    float _2367 = as_type<float>(_1334) * _2351;
    int _2369 = int(_2201) + int(_2319);
    int _2371 = _2227 * _2349;
    int _2373 = _2371 + _2361;
    int _2375 = ~_1220;
    int _2377 = _2375 + 1;
    float _2379 = trunc(_2367);
    float _2381 = precise::max(_2379, 0.0);
    uint _2383 = uint(_2381);
    int _2385 = abs(_2365);
    float _2387 = in.m_63.w;
    int _2389 = _2377 * _2369;
    int _2391 = _2389 + _2151;
    int _2393 = ~_1272;
    int _2395 = _2393 + 1;
    int _2397 = _2155 * _2385;
    int _2399 = _2397 + _2373;
    int _2401 = ~_1292;
    int _2403 = _2401 + 1;
    int _2405 = _2155;
    float _2407 = as_type<float>(_1957);
    float _2409 = as_type<float>(_1839);
    if (_2345)
    {
        float _2411 = -_1160;
        float _2413 = _2411 + 1.0;
        _2405 = as_type<int>(_2413);
    }
    int _2415 = _2405;
    bool _2417 = uint(_2391) >= uint(_1220);
    int _2419 = int(_2255) + int(_2357);
    bool _2421 = !_2417;
    int _2423 = _2421 ? 0 : (-1);
    int _2425 = _2403 * _2419;
    int _2427 = _2425 + _2185;
    float _2429 = float(uint(_2399));
    int _2431 = _2395 * int(_2383);
    int _2433 = _2431 + _2341;
    bool _2435 = _1166 > 0.5;
    int _2437 = ~_2369;
    int _2439 = _2437 + _2423;
    int _2441 = _2439 + 1;
    float _2443 = as_type<float>(_1533) * _2429;
    if (_2345)
    {
        float _2445 = _2435 ? as_type<float>(_2415) : _1160;
        _1230 = _2445;
    }
    float _2447 = _1230;
    bool _2449 = uint(_2427) >= uint(_1292);
    int _2451 = _1220 * _2441;
    int _2453 = _2451 + _2151;
    float _2455 = float(uint(_2433));
    float _2457 = trunc(_2443);
    float _2459 = precise::max(_2457, 0.0);
    uint _2461 = uint(_2459);
    bool _2463 = _1220 == 0;
    bool _2465 = !_2449;
    int _2467 = _2465 ? 0 : (-1);
    bool _2469 = _2387 > 0.5;
    float _2471 = as_type<float>(_1334) * _2455;
    bool _2473 = !_2463;
    int _2475 = _2473 ? _2453 : (-1);
    int _2477 = _2469 ? as_type<int>(_2299) : as_type<int>(_2215);
    float _2479 = trunc(_2471);
    float _2481 = precise::max(_2479, 0.0);
    uint _2483 = uint(_2481);
    int _2485 = _2475 & 3;
    bool _2487 = _2485 != 0;
    int _2489 = _2475 & 3;
    bool _2491 = _2489 != 0;
    bool _2493 = uint(_2485) >= 2u;
    int _2495 = _2491 ? 0 : 1;
    int _2497 = ~_2419;
    int _2499 = _2497 + _2467;
    int _2501 = _2499 + 1;
    bool _2503 = uint(_2485) > 1u;
    int _2505 = ~_1306;
    int _2507 = _2505 + 1;
    int _2509 = _1292 * _2501;
    int _2511 = _2509 + _2185;
    int _2513 = _2493 ? 0 : 1;
    bool _2515 = _2485 != 3;
    int _2517 = _2507 * int(_2461);
    int _2519 = _2517 + _2399;
    int _2521 = _2435 ? as_type<int>(_2299) : as_type<int>(_2215);
    bool _2523 = _1292 == 0;
    int _2525 = ~_1272;
    int _2527 = _2525 + 1;
    bool _2529 = !_2523;
    int _2531 = _2529 ? _2511 : (-1);
    int _2533 = int(_2383) + int(_2483);
    float _2535 = float(uint(_2519));
    int _2537 = ~_2495;
    int _2539 = _2537 + 1;
    int _2541 = _2539 + 1;
    float _2543 = as_type<float>(_1533) * _2535;
    int _2545 = _2541;
    if (!_2503)
    {
        int _2547 = ~_2495;
        int _2549 = _2547 + 1;
        _2545 = _2549;
    }
    int _2551 = _2545;
    int _2553 = _2531 & 3;
    bool _2555 = _2553 != 0;
    int _2557 = _2527 * _2533;
    int _2559 = _2557 + _2341;
    int _2561 = ~_2513;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2565;
    if (_2515)
    {
        int _2569 = ~_2513;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    bool _2575 = uint(_2553) >= 2u;
    float _2577 = trunc(_2543);
    float _2579 = precise::max(_2577, 0.0);
    uint _2581 = uint(_2579);
    int _2583 = _2555 ? 0 : 1;
    bool _2585 = uint(_2559) >= uint(_1272);
    int _2587 = _2575 ? 0 : 1;
    bool _2589 = _2553 != 3;
    bool _2591 = !_2585;
    int _2593 = _2591 ? 0 : (-1);
    bool _2595 = uint(_2553) > 1u;
    int _2597 = ~_2533;
    int _2599 = _2597 + _2593;
    int _2601 = _2599 + 1;
    int _2603 = ~_2587;
    int _2605 = _2603 + 1;
    int _2607 = _2605 + 1;
    bool _2609 = _1272 == 0;
    int _2611 = _1272 * _2601;
    int _2613 = _2611 + _2341;
    int _2615 = ~_2583;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2607;
    int _2623 = _2619;
    if (_2589)
    {
        int _2625 = ~_2587;
        int _2627 = _2625 + 1;
        _2621 = _2627;
    }
    int _2629 = _2621;
    int _2631 = ~_1306;
    int _2633 = _2631 + 1;
    int _2635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2637 = _2635 != 0;
    if (!_2595)
    {
        int _2639 = ~_2583;
        int _2641 = _2639 + 1;
        _2623 = _2641;
    }
    int _2643 = _2623;
    bool _2645 = !_2609;
    int _2647 = _2645 ? _2613 : (-1);
    int _2649 = int(_2461) + int(_2581);
    bool _2651 = !_2637;
    int _2653 = _2651 ? 0 : 1;
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2657 = _2655 != 0;
    int _2659 = _2633 * _2649;
    int _2661 = _2659 + _2399;
    int _2663 = _2647 & 3;
    bool _2665 = _2663 != 0;
    bool _2667 = !_2657;
    int _2669 = _2667 ? 0 : 1;
    bool _2671 = uint(_2663) >= 2u;
    int _2673 = _2665 ? 0 : 1;
    bool _2675 = uint(_2661) >= uint(_1306);
    int _2677 = _2671 ? 0 : 1;
    bool _2679 = _2663 != 3;
    bool _2681 = !_2675;
    int _2683 = _2681 ? 0 : (-1);
    bool _2685 = uint(_2663) > 1u;
    int _2687 = ~_2649;
    int _2689 = _2687 + _2683;
    int _2691 = _2689 + 1;
    int _2693 = ~_2677;
    int _2695 = _2693 + 1;
    int _2697 = _2695 + 1;
    bool _2699 = _1306 == 0;
    int _2701 = _1306 * _2691;
    int _2703 = _2701 + _2399;
    int _2705 = ~_2673;
    int _2707 = _2705 + 1;
    int _2709 = _2707 + 1;
    int _2711 = _2697;
    int _2713 = _2709;
    if (_2679)
    {
        int _2715 = ~_2677;
        int _2717 = _2715 + 1;
        _2711 = _2717;
    }
    int _2719 = _2711;
    int _2721 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2723 = _2721 != 0;
    bool _2725 = !_2699;
    int _2727 = _2725 ? _2703 : (-1);
    float _2729 = _2723 ? as_type<float>(_2521) : _2215;
    if (!_2685)
    {
        int _2731 = ~_2673;
        int _2733 = _2731 + 1;
        _2713 = _2733;
    }
    int _2735 = _2713;
    int _2737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2739 = _2737 != 0;
    int _2741 = _2727 & 3;
    bool _2743 = _2741 != 0;
    bool _2745 = !_2739;
    int _2747 = _2745 ? 0 : 1;
    bool _2749 = uint(_2741) >= 2u;
    int _2751 = _2743 ? 0 : 1;
    int _2753 = _2749 ? 0 : 1;
    bool _2755 = _2741 != 3;
    bool _2757 = uint(_2741) > 1u;
    int _2759 = ~_2753;
    int _2761 = _2759 + 1;
    int _2763 = _2761 + 1;
    int _2765 = ~_2751;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    float _2771 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2773 = _2771 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2775 = _2763;
    int _2777 = _2769;
    if (_2755)
    {
        int _2779 = ~_2753;
        int _2781 = _2779 + 1;
        _2775 = _2781;
    }
    int _2783 = _2775;
    float _2785 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2787 = _2785 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2757)
    {
        int _2789 = ~_2751;
        int _2791 = _2789 + 1;
        _2777 = _2791;
    }
    int _2793 = _2777;
    float _2795 = 1.0 / _2773;
    float _2797 = in.m_48.x;
    float _2799 = in.m_48.y;
    float _2801 = in.m_48.z;
    bool _2803 = _1493 > 0.5;
    float _2805 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2809 = _2807 != 0;
    int _2811 = _2803 ? as_type<int>(_2299) : as_type<int>(_2215);
    float _2813 = _2809 ? as_type<float>(_2477) : _2215;
    float _2815 = 1.0 / _2787;
    int _2817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2819 = _2817 != 0;
    int _2821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2823 = _2821 != 0;
    float _2825 = _2819 ? as_type<float>(_2811) : _2215;
    float _2827 = _2823 ? as_type<float>(_2811) : _2215;
    bool _2829 = !_1591;
    float _2831 = _2829 ? as_type<float>(_1495) : as_type<float>(_1497);
    bool _2833 = !_1591;
    float _2835 = _2833 ? as_type<float>(_1499) : as_type<float>(_1495);
    float _2837 = _202 * _2799;
    float _2839 = _196 * _2799;
    float _2841 = _208 * _2799;
    float _2843 = fma(_200, _2797, _2837);
    float _2845 = fma(_194, _2797, _2839);
    float _2847 = fma(_206, _2797, _2841);
    if (!_1591)
    {
        _1675 = _1493;
    }
    float _2849 = _1675;
    float _2851 = fma(_204, _2801, _2843);
    float _2853 = fma(_198, _2801, _2845);
    float _2855 = 0.0;
    float _2857 = _2849;
    if (!_1591)
    {
        _2855 = _1493;
    }
    float _2859 = _2855;
    float _2861 = as_type<float>(_1495) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2863 = _2859;
    if (!_1591)
    {
        _1639 = _1166;
    }
    float _2865 = _1639;
    float _2867 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2869 = 0.0;
    float _2871 = _2865;
    if (!_1591)
    {
        _2869 = _1166;
    }
    float _2873 = _2869;
    float _2875 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2877 = _2873;
    if (_1603)
    {
        _2407 = _1481;
    }
    float _2879 = _2407;
    float _2881 = fma(as_type<float>(_1495), (*spvDescriptorSet0.vp_c9)._m0[93].w, _2867);
    float _2883 = _2879;
    if (_1591)
    {
        _2857 = _1166;
    }
    float _2885 = _2857;
    float _2887 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2889 = log2(_2887);
    if (_1591)
    {
        _2863 = _1166;
    }
    float _2891 = _2863;
    float _2893 = _1481 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_1603)
    {
        _2409 = _1166;
    }
    float _2895 = _2409;
    float _2897 = fma(_210, _2801, _2847);
    float _2899 = _2895;
    if (_1591)
    {
        _2871 = _1481;
    }
    float _2901 = _2871;
    float _2903 = fma(_2835, (*spvDescriptorSet0.vp_c9)._m0[98].w, _1731);
    if (_1591)
    {
        _2877 = _1481;
    }
    float _2905 = _2877;
    float _2907 = _2835 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    if (!_1603)
    {
        _2883 = _1493;
    }
    float _2909 = _2883;
    float _2911 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    if (!_1603)
    {
        _2899 = _1481;
    }
    float _2913 = _2899;
    float _2915 = fma(_2907, -2.0, _1757);
    int _2917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2919 = _2917 != 0;
    int _2921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2923 = _2921 != 0;
    float _2925 = fma(as_type<float>(_1497), (*spvDescriptorSet0.vp_c9)._m0[93].z, _2911);
    int _2927 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2929 = _2927 != 0;
    float _2931 = _2889 * _164;
    float _2933 = as_type<float>(_1497) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2935 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2937 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2939 = exp2(_2931);
    float _2941 = _2919 ? as_type<float>(_2811) : _2215;
    float _2943 = fma(_2875, -2.0, _2937);
    bool _2945 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2947 = isnan(0.0);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2953 = _2949 || _2951;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2957 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2955;
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2963 = _2957 * _2795;
    float _2965 = fma(_2861, -2.0, _2959);
    float _2967 = fma(_2905, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2961);
    float _2969 = _2909 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2973 = -_2939;
    float _2975 = _2973 + 1.0;
    float _2977 = -_2971;
    float _2979 = fma(_2893, 2.0, _2977);
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2983 = _2953 ? _2975 : 0.0;
    float _2985 = -_2805;
    float _2987 = fma(_2969, 2.0, _2985);
    float _2989 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2991 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2993 = -_2981;
    float _2995 = fma(_2933, 2.0, _2993);
    float _2997 = fma(_2891, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2989);
    float _2999 = _2885 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3003 = _3001 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3007 = fma(_2999, -2.0, _1735);
    float _3009 = _2923 ? as_type<float>(_2811) : _2215;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3013 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3015 = _3013 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3017 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3019 = _3017 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3021 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3023 = isnan(1.0);
    bool _3025 = _3021 || _3023;
    bool _3027 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3029 = _3025 || _3027;
    float _3031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3033 = 1.0 + _3031;
    float _3035 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2991);
    float _3037 = 1.0 / _3033;
    float _3039 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3005);
    float _3041 = _1481 * 2.0;
    float _3043 = fma(_2831, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3011);
    float _3045 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _3047 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _3049 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3051 = _2831 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3053 = 1.0 / _3003;
    float _3055 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3057 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3059 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3061 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3039);
    float _3063 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[78].z, _3045);
    float _3065 = -_3049;
    float _3067 = fma(_3051, 2.0, _3065);
    float _3069 = floor(_3041);
    float _3071 = -_3047;
    float _3073 = fma(_2935, 2.0, _3071);
    float _3075 = fma(_3057, -2.0, _3055);
    float _3077 = fma(_1481, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3059);
    float _3079 = _3015 * _2815;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3083 = _3081 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3085 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _3063);
    float _3087 = 1.0 / _3019;
    float _3089 = -_164;
    float _3091 = fma(_3089, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2995);
    float _3093 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2965);
    float _3095 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2943);
    float _3097 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3035);
    float _3099 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3077);
    float _3101 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2925);
    float _3103 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2881);
    float _3105 = -_164;
    float _3107 = fma(_3105, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2979);
    float _3109 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3043);
    float _3111 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[97].w, _2903);
    float _3113 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2967);
    float _3115 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2997);
    float _3117 = -_164;
    float _3119 = fma(_3117, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3067);
    float _3121 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[96].y, _2915);
    float _3123 = -_164;
    float _3125 = fma(_3123, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3073);
    float _3127 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3007);
    float _3129 = -_164;
    float _3131 = fma(_3129, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2987);
    float _3133 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3075);
    if (_3029)
    {
        float _3135 = _2983 * _3037;
        _168 = _3135;
    }
    float _3137 = _168;
    float _3139 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3141 = _3139 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3143 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3145 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3143;
    float _3147 = 1.0 / _3083;
    float _3149 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3149;
    float _3153 = _3145 * _3053;
    bool _3155 = _3069 >= 0.0;
    bool _3157 = isnan(_3069);
    bool _3159 = _3155 || _3157;
    bool _3161 = isnan(0.0);
    bool _3163 = _3159 || _3161;
    float _3165 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3167 = _3165 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3169 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3171 = _3169 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3173 = _3151 * _3087;
    float _3175 = float(uint(_1935));
    float _3177 = 1.0 / _3141;
    int _3179 = _3163 ? 0 : 1;
    float _3181 = in.m_57.w;
    bool _3183 = _3069 > 0.0;
    float _3185 = as_type<float>(_1352) * _3175;
    float _3187 = float(uint(_1911));
    float _3189 = _3171 * _3147;
    float _3191 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3193 = _3191 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3195 = 1.0 / _3167;
    float _3197 = as_type<float>(_1330) * _3187;
    int _3199 = ~_1292;
    int _3201 = _3199 + 1;
    float _3203 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3205 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3203;
    int _3207 = ~_1272;
    int _3209 = _3207 + 1;
    float _3211 = _3193 * _3177;
    int _3213 = ~_3179;
    int _3215 = _3213 + 1;
    int _3217 = _3215 + 1;
    float _3219 = trunc(_3185);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    int _3225 = _3217;
    if (!_3183)
    {
        int _3227 = ~_3179;
        int _3229 = _3227 + 1;
        _3225 = _3229;
    }
    int _3231 = _3225;
    float _3233 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3235 = _1154 + _3233;
    float _3237 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3239 = _1154 + _3237;
    bool _3241 = _2051 >= 0.0;
    bool _3243 = isnan(_2051);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan(0.0);
    bool _3249 = _3245 || _3247;
    float _3251 = fma(_2963, _3235, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3253 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3255 = _1154 + _3253;
    float _3257 = trunc(_3197);
    float _3259 = precise::max(_3257, 0.0);
    uint _3261 = uint(_3259);
    float _3263 = fma(_3079, _3239, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3265 = _3205 * _3195;
    float _3267 = fma(_3189, _3255, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3269 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3271 = _1154 + _3269;
    int _3273 = ~_1220;
    int _3275 = _3273 + 1;
    int _3277 = _3249 ? 0 : 1;
    int _3279 = _3201 * int(_3223);
    int _3281 = _3279 + _1935;
    float _3283 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3285 = _1154 + _3283;
    bool _3287 = _2051 > 0.0;
    float _3289 = float(uint(_2227));
    float _3291 = fma(_3153, _3285, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3293 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3295 = _1154 + _3293;
    int _3297 = ~_1306;
    int _3299 = _3297 + 1;
    int _3301 = _3275 * int(_3261);
    int _3303 = _3301 + _1911;
    float _3305 = as_type<float>(_1533) * _3289;
    float _3307 = fma(_3173, _3295, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3309 = fma(_3211, _3271, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3311 = float(uint(_3281));
    float _3313 = float(uint(_2037));
    float _3315 = trunc(_3305);
    float _3317 = precise::max(_3315, 0.0);
    uint _3319 = uint(_3317);
    float _3321 = float(uint(_3303));
    float _3323 = as_type<float>(_1352) * _3311;
    bool _3325 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3327 = isnan(_1154);
    bool _3329 = _3325 || _3327;
    bool _3331 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3333 = _3329 || _3331;
    float _3335 = float(_3333);
    float _3337 = as_type<float>(_1334) * _3313;
    bool _3339 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3341 = isnan(_1154);
    bool _3343 = _3339 || _3341;
    bool _3345 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3347 = _3343 || _3345;
    float _3349 = float(_3347);
    float _3351 = as_type<float>(_1330) * _3321;
    bool _3353 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3355 = isnan(_1154);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3361 = _3357 || _3359;
    float _3363 = float(_3361);
    float _3365 = -_3335;
    float _3367 = _3365 + 1.0;
    bool _3369 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3371 = isnan(_1154);
    bool _3373 = _3369 || _3371;
    bool _3375 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3377 = _3373 || _3375;
    float _3379 = float(_3377);
    float _3381 = trunc(_3337);
    float _3383 = precise::max(_3381, 0.0);
    uint _3385 = uint(_3383);
    int _3387 = _2531 & 3;
    bool _3389 = _3387 != 0;
    float _3391 = -_3363;
    float _3393 = _3391 + 1.0;
    float _3395 = _3363 * _3367;
    bool _3397 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3399 = isnan(_1154);
    bool _3401 = _3397 || _3399;
    bool _3403 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3405 = _3401 || _3403;
    float _3407 = float(_3405);
    float _3409 = _3349 * _3393;
    float _3411 = -_3349;
    float _3413 = _3411 + 1.0;
    float _3415 = trunc(_3351);
    float _3417 = precise::max(_3415, 0.0);
    uint _3419 = uint(_3417);
    bool _3421 = _2741 != 3;
    float _3423 = _3379 * _3413;
    float _3425 = -_3379;
    float _3427 = _3425 + 1.0;
    bool _3429 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3431 = isnan(_1154);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    bool _3441 = !_3421;
    int _3443 = _3441 ? 0 : (-1);
    int _3445 = _3209 * int(_3385);
    int _3447 = _3445 + _2037;
    float _3449 = _3407 * _3427;
    float _3451 = -_3407;
    float _3453 = _3451 + 1.0;
    bool _3455 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3457 = isnan(_1154);
    bool _3459 = _3455 || _3457;
    bool _3461 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3463 = _3459 || _3461;
    float _3465 = float(_3463);
    float _3467 = -_3439;
    float _3469 = _3467 + 1.0;
    float _3471 = float(uint(_3447));
    float _3473 = _3439 * _3453;
    bool _3475 = _1154 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3477 = isnan(_1154);
    bool _3479 = _3475 || _3477;
    bool _3481 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3483 = _3479 || _3481;
    float _3485 = float(_3483);
    float _3487 = _3465 * _3469;
    float _3489 = -_3465;
    float _3491 = _3489 + 1.0;
    float _3493 = as_type<float>(_1334) * _3471;
    float _3495 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3497 = _1154 + _3495;
    float _3499 = _2853 + _3181;
    float _3501 = trunc(_3323);
    float _3503 = precise::max(_3501, 0.0);
    uint _3505 = uint(_3503);
    int _3507 = _3299 * int(_3319);
    int _3509 = _3507 + _2227;
    float _3511 = _3485 * _3491;
    float _3513 = fma(_3265, _3497, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3515 = _2851 + _1615;
    float _3517 = -_3485;
    float _3519 = _3517 + 1.0;
    float _3521 = float(uint(_3509));
    float _3523 = _3251 * _3511;
    float _3525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3527 = ~_3277;
    int _3529 = _3527 + 1;
    int _3531 = _3529 + 1;
    float _3533 = fma(_3519, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3523);
    float _3535 = as_type<float>(_1533) * _3521;
    float _3537 = _2897 + _1651;
    int _3539 = _3531;
    if (!_3287)
    {
        int _3541 = ~_3277;
        int _3543 = _3541 + 1;
        _3539 = _3543;
    }
    int _3545 = _3539;
    float _3547 = fma(_3263, _3487, _3533);
    float _3549 = trunc(_3493);
    float _3551 = precise::max(_3549, 0.0);
    uint _3553 = uint(_3551);
    int _3555 = ~_1220;
    int _3557 = _3555 + 1;
    int _3559 = int(_3261) + int(_3419);
    float _3561 = fma(_3291, _3473, _3547);
    int _3563 = ~_1292;
    int _3565 = _3563 + 1;
    int _3567 = int(_3223) + int(_3505);
    float _3569 = trunc(_3535);
    float _3571 = precise::max(_3569, 0.0);
    uint _3573 = uint(_3571);
    int _3575 = _3557 * _3559;
    int _3577 = _3575 + _1911;
    float _3579 = _3525 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3581 = !_2929;
    int _3583 = _3581 ? 0 : 1;
    float _3585 = fma(_3267, _3449, _3561);
    int _3587 = ~_1272;
    int _3589 = _3587 + 1;
    int _3591 = _3565 * _3567;
    int _3593 = _3591 + _1935;
    int _3595 = int(_3385) + int(_3553);
    float _3597 = fma(_3579, _1268, -0.5);
    bool _3599 = uint(_3577) >= uint(_1220);
    float _3601 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3603 = _3515 + _3601;
    int _3605 = ~_1306;
    int _3607 = _3605 + 1;
    int _3609 = _3589 * _3595;
    int _3611 = _3609 + _2037;
    bool _3613 = !_3599;
    int _3615 = _3613 ? 0 : (-1);
    float _3617 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3619 = _3499 + _3617;
    bool _3621 = uint(_3593) >= uint(_1292);
    float _3623 = _1493 * 2.0;
    int _3625 = int(_3319) + int(_3573);
    float _3627 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3629 = _3537 + _3627;
    float _3631 = fma(_3307, _3423, _3585);
    bool _3633 = !_3621;
    int _3635 = _3633 ? 0 : (-1);
    float _3637 = floor(_3623);
    bool _3639 = uint(_3611) >= uint(_1272);
    float _3641 = _3603 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3643 = _3607 * _3625;
    int _3645 = _3643 + _2227;
    int _3647 = ~_3559;
    int _3649 = _3647 + _3615;
    int _3651 = _3649 + 1;
    float _3653 = fma(_3309, _3409, _3631);
    float _3655 = fma(_3619, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3641);
    bool _3657 = !_3639;
    int _3659 = _3657 ? 0 : (-1);
    float _3661 = _1166 + _1493;
    bool _3663 = uint(_3645) >= uint(_1306);
    float _3665 = fma(_3629, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3655);
    int _3667 = ~_3567;
    int _3669 = _3667 + _3635;
    int _3671 = _3669 + 1;
    float _3673 = _1166 + _1481;
    bool _3675 = !_3663;
    int _3677 = _3675 ? 0 : (-1);
    float _3679 = fma(_3513, _3395, _3653);
    bool _3681 = _3665 >= 0.0;
    int _3683 = _1220 * _3651;
    int _3685 = _3683 + _1911;
    float _3687 = _3673 + (-1.0);
    int _3689 = _1292 * _3671;
    int _3691 = _3689 + _1935;
    bool _3693 = !_3389;
    int _3695 = _3693 ? 0 : 1;
    float _3697 = fma(_3335, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3679);
    float _3699 = fma(_3687, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3701 = _3603 * _3603;
    int _3703 = _2647 & 3;
    bool _3705 = _3703 != 0;
    float _3707 = _3661 + (-1.0);
    int _3709 = _2475 >> 31;
    float _3711 = fma(_3619, _3619, _3701);
    bool _3713 = !_3705;
    int _3715 = _3713 ? 0 : 1;
    float _3717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    int _3719 = _2727 & 3;
    bool _3721 = _3719 != 0;
    float _3723 = fma(_3629, _3629, _3711);
    bool _3725 = !_2487;
    int _3727 = _3725 ? 0 : 1;
    out.m_75.x = _3697;
    bool _3729 = !_3721;
    int _3731 = _3729 ? 0 : 1;
    float _3733 = _1166 + (-0.5);
    bool _3735 = _2485 != 3;
    float _3737 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    if (_3681)
    {
        out.m_51.x = 0.0;
    }
    bool _3739 = _3637 > 0.0;
    bool _3741 = _3637 >= 0.0;
    bool _3743 = isnan(_3637);
    bool _3745 = _3741 || _3743;
    bool _3747 = isnan(0.0);
    bool _3749 = _3745 || _3747;
    float _3751 = fma(_3707, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _3753 = _3637;
    if (_3681)
    {
        _3753 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3755 = _3753;
    float _3757 = rsqrt(_3723);
    int _3759 = _3709 & 3;
    int _3761 = _2531 >> 31;
    int _3763 = as_type<int>(_3755);
    if (_3681)
    {
        float _3765 = _3755 * 5.0;
        _3763 = as_type<int>(_3765);
    }
    int _3767 = _3763;
    int _3769 = _2475 + _3759;
    int _3771 = _2647 >> 31;
    int _3773 = _3769 >> 2;
    if (_3681)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12335 = as_type<float>(_3767);
        out.gl_Position.z = _12335;
    }
    int _3775 = _3761 & 3;
    int _3777 = _3771 & 3;
    int _3779 = _3773 << 4;
    int _3781 = _3779 + 368;
    float _3783 = _3603 * _3757;
    int _3785 = _2647 + _3777;
    float _3787 = _3619 * _3757;
    int _3789 = _2531 + _3775;
    float _3791 = -_3783;
    float _3793 = fma(_3791, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3603);
    float _3795 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3797 = _2727 >> 31;
    float _3799 = -_3787;
    float _3801 = fma(_3799, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3619);
    float _3803 = _3793 * _3793;
    int _3805 = _3785 >> 2;
    float _3807 = _3629 * _3757;
    int _3809 = _3797 & 3;
    float _3811 = fma(_3801, _3801, _3803);
    uint _3813 = uint(int(uint(_3781) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = _3805 << 4;
    int _3831 = _3829 + 656;
    float _3833 = -_3807;
    float _3835 = fma(_3833, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3629);
    int _3837 = _2727 + _3809;
    bool _3839 = !_3735;
    int _3841 = _3839 ? 0 : (-1);
    int _3843 = _3837 >> 2;
    float _3845 = _3795 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    uint _3847 = uint(int(uint(_3831) >> uint(2)));
    uint _3849 = uint(int(uint(int(_3847)) >> uint(2)));
    int _3851 = int(_3847) & 3;
    float _3853 = (*spvDescriptorSet0.vp_c9)._m0[int(_3849)][_3851];
    int _3855 = int(_3847) + 1;
    uint _3857 = uint(int(uint(_3855) >> uint(2)));
    int _3859 = _3855 & 3;
    float _3861 = (*spvDescriptorSet0.vp_c9)._m0[int(_3857)][_3859];
    int _3863 = _3789 >> 2;
    bool _3865 = _2553 != 3;
    float _3867 = fma(_3845, _2941, -0.5);
    int _3869 = _3863 << 4;
    int _3871 = _3869 + 512;
    float _3873 = fma(_3835, _3835, _3811);
    bool _3875 = !_3865;
    int _3877 = _3875 ? 0 : (-1);
    float _3879 = -_3121;
    float _3881 = fma(_3111, _3867, _3879);
    bool _3883 = _2663 != 3;
    uint _3885 = uint(int(uint(_3871) >> uint(2)));
    uint _3887 = uint(int(uint(int(_3885)) >> uint(2)));
    int _3889 = int(_3885) & 3;
    float _3891 = (*spvDescriptorSet0.vp_c9)._m0[int(_3887)][_3889];
    int _3893 = int(_3885) + 1;
    uint _3895 = uint(int(uint(_3893) >> uint(2)));
    int _3897 = _3893 & 3;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[int(_3895)][_3897];
    int _3901 = _3843 << 4;
    int _3903 = _3901 + 800;
    float _3905 = _3009 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _3907 = ~_3625;
    int _3909 = _3907 + _3677;
    int _3911 = _3909 + 1;
    float _3913 = _1673 * _3717;
    int _3915 = ~_3595;
    int _3917 = _3915 + _3659;
    int _3919 = _3917 + 1;
    float _3921 = _3905 * _3737;
    int _3923 = abs(_2551);
    float _3925 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3927 = int(_3925);
    bool _3929 = !_2463;
    int _3931 = _3929 ? _3685 : (-1);
    int _3933 = _3831 + 8;
    uint _3935 = uint(int(uint(_3933) >> uint(2)));
    uint _3937 = uint(int(uint(int(_3935)) >> uint(2)));
    int _3939 = int(_3935) & 3;
    float _3941 = (*spvDescriptorSet0.vp_c9)._m0[int(_3937)][_3939];
    int _3943 = int(_3935) + 1;
    uint _3945 = uint(int(uint(_3943) >> uint(2)));
    int _3947 = _3943 & 3;
    float _3949 = (*spvDescriptorSet0.vp_c9)._m0[int(_3945)][_3947];
    bool _3951 = !_2523;
    int _3953 = _3951 ? _3691 : (-1);
    out.m_77.x = _3913;
    out.m_77.y = _3921;
    int _3955 = _3749 ? 0 : 1;
    int _3957 = _1272 * _3919;
    int _3959 = _3957 + _2037;
    int _3961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3963 = _3961 != 0;
    int _3965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3967 = _3965 != 0;
    int _3969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3971 = _3969 != 0;
    int _3973 = _1306 * _3911;
    int _3975 = _3973 + _2227;
    int _3977 = ~_3955;
    int _3979 = _3977 + 1;
    int _3981 = _3979 + 1;
    uint _3983 = uint(int(uint(_3903) >> uint(2)));
    uint _3985 = uint(int(uint(int(_3983)) >> uint(2)));
    int _3987 = int(_3983) & 3;
    float _3989 = (*spvDescriptorSet0.vp_c9)._m0[int(_3985)][_3987];
    int _3991 = int(_3983) + 1;
    uint _3993 = uint(int(uint(_3991) >> uint(2)));
    int _3995 = _3991 & 3;
    float _3997 = (*spvDescriptorSet0.vp_c9)._m0[int(_3993)][_3995];
    int _3999 = _3981;
    if (!_3739)
    {
        int _4001 = ~_3955;
        int _4003 = _4001 + 1;
        _3999 = _4003;
    }
    int _4005 = _3999;
    float _4007 = fma(_3109, _3597, _3119);
    int _4009 = abs(_2643);
    float _4011 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _4013 = int(_4011);
    int _4015 = ~_3923;
    int _4017 = _4015 + 1;
    int _4019 = _4017 + 1;
    int _4021 = abs(_2735);
    int _4023 = _3781 + 8;
    uint _4025 = uint(int(uint(_4023) >> uint(2)));
    uint _4027 = uint(int(uint(int(_4025)) >> uint(2)));
    int _4029 = int(_4025) & 3;
    float _4031 = (*spvDescriptorSet0.vp_c9)._m0[int(_4027)][_4029];
    int _4033 = int(_4025) + 1;
    uint _4035 = uint(int(uint(_4033) >> uint(2)));
    int _4037 = _4033 & 3;
    float _4039 = (*spvDescriptorSet0.vp_c9)._m0[int(_4035)][_4037];
    int _4041 = abs(_3715);
    int _4043 = _4019 * as_type<int>(_3827);
    int _4045 = abs(_3727);
    int _4047 = abs(_2793);
    int _4049 = _3871 + 8;
    uint _4051 = uint(int(uint(_4049) >> uint(2)));
    uint _4053 = uint(int(uint(int(_4051)) >> uint(2)));
    int _4055 = int(_4051) & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = int(_4051) + 1;
    uint _4061 = uint(int(uint(_4059) >> uint(2)));
    int _4063 = _4059 & 3;
    float _4065 = (*spvDescriptorSet0.vp_c9)._m0[int(_4061)][_4063];
    int _4067 = ~_4045;
    int _4069 = _4067 + 1;
    int _4071 = _4069 + 1;
    int _4073 = ~_4021;
    int _4075 = _4073 + 1;
    int _4077 = _4075 + 1;
    int _4079 = ~_4041;
    int _4081 = _4079 + 1;
    int _4083 = _4081 + 1;
    int _4085 = _3903 + 8;
    uint _4087 = uint(int(uint(_4085) >> uint(2)));
    uint _4089 = uint(int(uint(int(_4087)) >> uint(2)));
    int _4091 = int(_4087) & 3;
    float _4093 = (*spvDescriptorSet0.vp_c9)._m0[int(_4089)][_4091];
    int _4095 = int(_4087) + 1;
    uint _4097 = uint(int(uint(_4095) >> uint(2)));
    int _4099 = _4095 & 3;
    float _4101 = (*spvDescriptorSet0.vp_c9)._m0[int(_4097)][_4099];
    int _4103 = abs(_3695);
    int _4105 = _4077 * as_type<int>(_3861);
    int _4107 = abs(_2719);
    int _4109 = _4071 * as_type<int>(_3819);
    int _4111 = _4109 + _4043;
    int _4113 = abs(_2573);
    int _4115 = _4083 * as_type<int>(_3853);
    int _4117 = _4115 + _4105;
    int _4119 = abs(_3731);
    int _4121 = ~_4009;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    int _4127 = abs(_2629);
    int _4129 = _4125 * as_type<int>(_3899);
    int _4131 = ~_4107;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    float _4137 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4139 = int(_4137);
    int _4141 = ~_4047;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    int _4147 = ~_4119;
    int _4149 = _4147 + 1;
    int _4151 = _4149 + 1;
    int _4153 = _4135 * as_type<int>(_3941);
    int _4155 = _4153 + _4117;
    int _4157 = ~_4103;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4145 * as_type<int>(_3997);
    int _4165 = ~_4113;
    int _4167 = _4165 + 1;
    int _4169 = _4167 + 1;
    int _4171 = _4161 * as_type<int>(_3891);
    int _4173 = _4171 + _4129;
    int _4175 = abs(_3841);
    int _4177 = _4151 * as_type<int>(_3989);
    int _4179 = _4177 + _4163;
    int _4181 = ~_4127;
    int _4183 = _4181 + 1;
    int _4185 = _4183 + 1;
    float _4187 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4189 = int(_4187);
    int _4191 = abs(_2783);
    int _4193 = _4169 * as_type<int>(_4031);
    int _4195 = _4193 + _4111;
    bool _4197 = !_3883;
    int _4199 = _4197 ? 0 : (-1);
    int _4201 = ~_4175;
    int _4203 = _4201 + 1;
    int _4205 = _4203 + 1;
    int _4207 = ~_4191;
    int _4209 = _4207 + 1;
    int _4211 = _4209 + 1;
    int _4213 = abs(_3877);
    int _4215 = _4185 * as_type<int>(_4057);
    int _4217 = _4215 + _4173;
    int _4219 = abs(_4199);
    int _4221 = _4205 * as_type<int>(_4039);
    int _4223 = _4221 + _4195;
    float _4225 = float(uint(_4013));
    int _4227 = ~_4213;
    int _4229 = _4227 + 1;
    int _4231 = _4229 + 1;
    int _4233 = abs(_3443);
    int _4235 = _4211 * as_type<int>(_4093);
    int _4237 = _4235 + _4179;
    float _4239 = float(uint(_3927));
    float _4241 = 1.0 / _4225;
    int _4243 = ~_4219;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    int _4249 = _4231 * as_type<int>(_4065);
    int _4251 = _4249 + _4217;
    int _4253 = abs(_2653);
    int _4255 = ~_4233;
    int _4257 = _4255 + 1;
    int _4259 = _4257 + 1;
    int _4261 = _4247 * as_type<int>(_3949);
    int _4263 = _4261 + _4155;
    int _4265 = abs(_4013);
    float _4267 = 1.0 / _4239;
    int _4269 = abs(_2669);
    int _4271 = _4259 * as_type<int>(_4101);
    int _4273 = _4271 + _4237;
    int _4275 = ~_4253;
    int _4277 = _4275 + 1;
    int _4279 = _4277 + 1;
    float _4281 = float(uint(_4139));
    float _4283 = float(uint(_4265));
    int _4285 = _4223 * _4279;
    int _4287 = abs(_4139);
    int _4289 = ~_4269;
    int _4291 = _4289 + 1;
    int _4293 = _4291 + 1;
    float _4295 = 1.0 / _4283;
    int _4297 = _3931 * _4253;
    int _4299 = _4297 + _4285;
    int _4301 = abs(_2747);
    int _4303 = _4293 * _4251;
    float _4305 = float(uint(_4189));
    int _4307 = abs(_3927);
    float _4309 = 1.0 / _4281;
    int _4311 = abs(_4189);
    int _4313 = _3953 * _4269;
    int _4315 = _4313 + _4303;
    int _4317 = ~_4301;
    int _4319 = _4317 + 1;
    int _4321 = _4319 + 1;
    bool _4323 = _1272 == 0;
    int _4325 = _4321 * _4263;
    int _4327 = as_type<int>(_4241) + (-2);
    float _4329 = 1.0 / _4305;
    float _4331 = float(uint(_4299));
    float _4333 = float(uint(_4287));
    float _4335 = float(uint(_4307));
    float _4337 = as_type<float>(_4327) * _4331;
    int _4339 = abs(_3583);
    float _4341 = 1.0 / _4333;
    bool _4343 = !_4323;
    int _4345 = _4343 ? _3959 : (-1);
    int _4347 = as_type<int>(_4267) + (-2);
    float _4349 = float(uint(_4315));
    bool _4351 = _1306 == 0;
    float _4353 = 1.0 / _4335;
    int _4355 = ~_4339;
    int _4357 = _4355 + 1;
    int _4359 = _4357 + 1;
    float _4361 = as_type<float>(_4347) * _4349;
    bool _4363 = !_4351;
    int _4365 = _4363 ? _3975 : (-1);
    int _4367 = as_type<int>(_4309) + (-2);
    int _4369 = _4359 * _4273;
    float _4371 = float(uint(_4311));
    float _4373 = trunc(_4337);
    float _4375 = precise::max(_4373, 0.0);
    uint _4377 = uint(_4375);
    int _4379 = _4345 * _4301;
    int _4381 = _4379 + _4325;
    int _4383 = abs(_4299);
    int _4385 = _4365 * _4339;
    int _4387 = _4385 + _4369;
    int _4389 = abs(_4315);
    float _4391 = _4007 + 0.5;
    float _4393 = float(uint(_4381));
    float _4395 = trunc(_4361);
    float _4397 = precise::max(_4395, 0.0);
    uint _4399 = uint(_4397);
    int _4401 = as_type<int>(_4329) + (-2);
    float _4403 = as_type<float>(_4367) * _4393;
    float _4405 = float(uint(_4387));
    int _4407 = as_type<int>(_4295) + (-2);
    float _4409 = 1.0 / _4371;
    float _4411 = float(uint(_4383));
    float _4413 = as_type<float>(_4401) * _4405;
    int _4415 = ~_4013;
    int _4417 = _4415 + 1;
    float _4419 = _3881 + 0.5;
    int _4421 = as_type<int>(_4353) + (-2);
    float _4423 = as_type<float>(_4407) * _4411;
    int _4425 = ~_3927;
    int _4427 = _4425 + 1;
    float _4429 = trunc(_4403);
    float _4431 = precise::max(_4429, 0.0);
    uint _4433 = uint(_4431);
    int _4435 = _4417 * int(_4377);
    int _4437 = _4435 + _4299;
    out.m_79.x = _4391;
    out.m_79.y = _4419;
    int _4439 = abs(_4381);
    int _4441 = as_type<int>(_4341) + (-2);
    float _4443 = float(uint(_4437));
    float _4445 = trunc(_4413);
    float _4447 = precise::max(_4445, 0.0);
    uint _4449 = uint(_4447);
    float _4451 = float(uint(_4389));
    int _4453 = as_type<int>(_4409) + (-2);
    bool _4455 = !_3967;
    int _4457 = _4455 ? 0 : 1;
    float _4459 = as_type<float>(_4421) * _4451;
    int _4461 = _4427 * int(_4399);
    int _4463 = _4461 + _4315;
    bool _4465 = !_3963;
    int _4467 = _4465 ? 0 : 1;
    float _4469 = trunc(_4423);
    float _4471 = precise::max(_4469, 0.0);
    uint _4473 = uint(_4471);
    int _4475 = abs(_4387);
    float _4477 = as_type<float>(_4327) * _4443;
    float _4479 = float(uint(_4463));
    float _4481 = float(uint(_4475));
    float _4483 = in.m_81.x;
    float _4485 = in.m_81.y;
    float _4487 = in.m_81.z;
    float _4489 = float(uint(_4439));
    float _4491 = as_type<float>(_4347) * _4479;
    float _4493 = trunc(_4459);
    float _4495 = precise::max(_4493, 0.0);
    uint _4497 = uint(_4495);
    float _4499 = as_type<float>(_4453) * _4481;
    int _4501 = abs(_4457);
    float _4503 = as_type<float>(_4441) * _4489;
    int _4505 = abs(_4467);
    int _4507 = ~_4189;
    int _4509 = _4507 + 1;
    float _4511 = trunc(_4503);
    float _4513 = precise::max(_4511, 0.0);
    uint _4515 = uint(_4513);
    float _4517 = float(_3231);
    float _4519 = float(_4501);
    int _4521 = _4509 * int(_4449);
    int _4523 = _4521 + _4387;
    int _4525 = ~_4139;
    int _4527 = _4525 + 1;
    int _4529 = ~_4265;
    int _4531 = _4529 + 1;
    float _4533 = _4519 * _4517;
    float _4535 = float(_4005);
    int _4537 = _4527 * int(_4433);
    int _4539 = _4537 + _4381;
    float _4541 = float(_4505);
    float _4543 = trunc(_4499);
    float _4545 = precise::max(_4543, 0.0);
    uint _4547 = uint(_4545);
    float _4549 = float(uint(_4523));
    float _4551 = _4541 * _4535;
    float _4553 = float(uint(_4539));
    int _4555 = _4531 * int(_4473);
    int _4557 = _4555 + _4383;
    int _4559 = ~_4307;
    int _4561 = _4559 + 1;
    float _4563 = _4551 * (-2.0);
    float _4565 = as_type<float>(_4401) * _4549;
    float _4567 = as_type<float>(_4367) * _4553;
    float _4569 = float(uint(_4557));
    int _4571 = _4561 * int(_4497);
    int _4573 = _4571 + _4389;
    int _4575 = ~_4287;
    int _4577 = _4575 + 1;
    float _4579 = trunc(_4477);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    float _4585 = fma(_3699, _4563, _3699);
    float _4587 = fma(_4563, _4483, _4483);
    float _4589 = as_type<float>(_4407) * _4569;
    float _4591 = _1481 + (-0.5);
    float _4593 = float(uint(_4573));
    int _4595 = _4577 * int(_4515);
    int _4597 = _4595 + _4439;
    int _4599 = ~_3927;
    int _4601 = _4599 + 1;
    float _4603 = trunc(_4565);
    float _4605 = precise::max(_4603, 0.0);
    uint _4607 = uint(_4605);
    int _4609 = ~_4311;
    int _4611 = _4609 + 1;
    float _4613 = fma(_4591, (*spvDescriptorSet0.vp_c9)._m0[196].x, _4587);
    float _4615 = as_type<float>(_4421) * _4593;
    float _4617 = float(uint(_4597));
    float _4619 = fma(_4585, _3137, _4613);
    float _4621 = trunc(_4567);
    float _4623 = precise::max(_4621, 0.0);
    uint _4625 = uint(_4623);
    float _4627 = as_type<float>(_4441) * _4617;
    int _4629 = int(_4377) + int(_4583);
    int _4631 = _4611 * int(_4547);
    int _4633 = _4631 + _4475;
    int _4635 = ~_4013;
    int _4637 = _4635 + 1;
    int _4639 = ~_4189;
    int _4641 = _4639 + 1;
    float _4643 = trunc(_4491);
    float _4645 = precise::max(_4643, 0.0);
    uint _4647 = uint(_4645);
    int _4649 = int(_4449) + int(_4607);
    int _4651 = _4637 * _4629;
    int _4653 = _4651 + _4299;
    float _4655 = float(uint(_4633));
    bool _4657 = _4189 == 0;
    bool _4659 = uint(_4653) >= uint(_4013);
    float _4661 = trunc(_4615);
    float _4663 = precise::max(_4661, 0.0);
    uint _4665 = uint(_4663);
    int _4667 = int(_4433) + int(_4625);
    float _4669 = as_type<float>(_4453) * _4655;
    bool _4671 = !_3971;
    int _4673 = _4671 ? 0 : 1;
    float _4675 = trunc(_4589);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    int _4681 = ~_4139;
    int _4683 = _4681 + 1;
    int _4685 = int(_4399) + int(_4647);
    int _4687 = _4683 * _4667;
    int _4689 = _4687 + _4381;
    float _4691 = trunc(_4627);
    float _4693 = precise::max(_4691, 0.0);
    uint _4695 = uint(_4693);
    int _4697 = int(_4497) + int(_4665);
    int _4699 = _4601 * _4685;
    int _4701 = _4699 + _4315;
    int _4703 = ~_4265;
    int _4705 = _4703 + 1;
    int _4707 = _4641 * _4649;
    int _4709 = _4707 + _4387;
    bool _4711 = uint(_4689) >= uint(_4139);
    int _4713 = ~_4307;
    int _4715 = _4713 + 1;
    float _4717 = trunc(_4669);
    float _4719 = precise::max(_4717, 0.0);
    uint _4721 = uint(_4719);
    int _4723 = int(_4473) + int(_4679);
    int _4725 = ~_4287;
    int _4727 = _4725 + 1;
    int _4729 = _4715 * _4697;
    int _4731 = _4729 + _4389;
    bool _4733 = uint(_4701) >= uint(_3927);
    int _4735 = _4705 * _4723;
    int _4737 = _4735 + _4383;
    bool _4739 = uint(_4709) >= uint(_4189);
    float _4741 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4743 = int(_4515) + int(_4695);
    int _4745 = ~_4311;
    int _4747 = _4745 + 1;
    int _4749 = _4727 * _4743;
    int _4751 = _4749 + _4439;
    bool _4753 = !_4659;
    int _4755 = _4753 ? 0 : (-1);
    bool _4757 = uint(_4737) >= uint(_4265);
    bool _4759 = !_4733;
    int _4761 = _4759 ? 0 : (-1);
    bool _4763 = uint(_4731) >= uint(_4307);
    bool _4765 = !_4711;
    int _4767 = _4765 ? 0 : (-1);
    float _4769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4771 = uint(_4751) >= uint(_4287);
    bool _4773 = !_4739;
    int _4775 = _4773 ? 0 : (-1);
    int _4777 = ~_4629;
    int _4779 = _4777 + _4755;
    int _4781 = _4779 + 1;
    int _4783 = int(_4547) + int(_4721);
    int _4785 = ~_4685;
    int _4787 = _4785 + _4761;
    int _4789 = _4787 + 1;
    int _4791 = _4013 * _4781;
    int _4793 = _4791 + _4299;
    int _4795 = ~_4649;
    int _4797 = _4795 + _4775;
    int _4799 = _4797 + 1;
    float _4801 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    int _4803 = ~_4667;
    int _4805 = _4803 + _4767;
    int _4807 = _4805 + 1;
    int _4809 = _4747 * _4783;
    int _4811 = _4809 + _4475;
    bool _4813 = !_4757;
    int _4815 = _4813 ? 0 : (-1);
    int _4817 = _3927 * _4789;
    int _4819 = _4817 + _4315;
    bool _4821 = _4013 == 0;
    int _4823 = _4139 * _4807;
    int _4825 = _4823 + _4381;
    int _4827 = _4299 ^ _4013;
    float _4829 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4831 = !_4771;
    int _4833 = _4831 ? 0 : (-1);
    int _4835 = _4189 * _4799;
    int _4837 = _4835 + _4387;
    bool _4839 = _3927 == 0;
    bool _4841 = !_4821;
    int _4843 = _4841 ? _4793 : (-1);
    bool _4845 = _4139 == 0;
    float _4847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    uint _4849 = uint(int(uint(_4827) >> uint(31)));
    bool _4851 = uint(_4811) >= uint(_4311);
    bool _4853 = !_4839;
    int _4855 = _4853 ? _4819 : (-1);
    float _4857 = _4741 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4859 = !_4845;
    int _4861 = _4859 ? _4825 : (-1);
    int _4863 = ~_4815;
    int _4865 = _4723 + _4863;
    int _4867 = _4865 + 1;
    float _4869 = fma(_4857, _1679, -0.5);
    float _4871 = float(_4843);
    float _4873 = _4829 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4875 = ~int(_4849);
    int _4877 = _4875 + 1;
    bool _4879 = !_4657;
    int _4881 = _4879 ? _4837 : (-1);
    float _4883 = fma(_4857, _4871, _3107);
    int _4885 = _4315 ^ _3927;
    float _4887 = _4801 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    bool _4889 = _4139 == 0;
    float _4891 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4893 = _4381 ^ _4139;
    float _4895 = _4769 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4897 = _4387 ^ _4189;
    float _4899 = fma(_4887, _2447, -0.5);
    float _4901 = float(_4855);
    float _4903 = fma(_4895, _1773, -0.5);
    int _4905 = _4867 ^ _4877;
    float _4907 = fma(_4873, _1609, -0.5);
    float _4909 = float(_4881);
    float _4911 = fma(_4895, _4901, _3125);
    bool _4913 = !_4763;
    int _4915 = _4913 ? 0 : (-1);
    float _4917 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4919 = !_4851;
    int _4921 = _4919 ? 0 : (-1);
    float _4923 = fma(_4887, _4909, _3091);
    uint _4925 = uint(int(uint(_4885) >> uint(31)));
    float _4927 = fma(_3113, _4903, _4911);
    uint _4929 = uint(int(uint(_4893) >> uint(31)));
    float _4931 = fma(_3085, _4869, _4883);
    uint _4933 = uint(int(uint(_4897) >> uint(31)));
    float _4935 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    bool _4937 = _4013 == 0;
    float _4939 = fma(_3101, _4899, _4923);
    int _4941 = ~_4877;
    int _4943 = _4941 + _4905;
    int _4945 = _4943 + 1;
    bool _4947 = _4189 == 0;
    int _4949 = ~_4915;
    int _4951 = _4697 + _4949;
    int _4953 = _4951 + 1;
    int _4955 = ~_4833;
    int _4957 = _4743 + _4955;
    int _4959 = _4957 + 1;
    int _4961 = ~_4921;
    int _4963 = _4783 + _4961;
    int _4965 = _4963 + 1;
    int _4967 = ~int(_4925);
    int _4969 = _4967 + 1;
    int _4971 = ~int(_4929);
    int _4973 = _4971 + 1;
    float _4975 = _4935 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _4977 = ~int(_4933);
    int _4979 = _4977 + 1;
    float _4981 = float(_4861);
    float _4983 = fma(_4975, _2825, -0.5);
    bool _4985 = !_4937;
    int _4987 = _4985 ? _4945 : (-1);
    int _4989 = _4953 ^ _4969;
    float _4991 = fma(_4873, _4981, _3131);
    int _4993 = _4959 ^ _4973;
    float _4995 = _4847 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4997 = _4965 ^ _4979;
    float _4999 = _4891 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5001 = float(_4987);
    float _5003 = fma(_4995, _2729, -0.5);
    bool _5005 = _3927 == 0;
    float _5007 = _4917 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5009 = ~_4969;
    int _5011 = _5009 + _4989;
    int _5013 = _5011 + 1;
    float _5015 = -_3095;
    float _5017 = fma(_4995, _5001, _5015);
    int _5019 = ~_4973;
    int _5021 = _5019 + _4993;
    int _5023 = _5021 + 1;
    float _5025 = fma(_4999, _2813, -0.5);
    int _5027 = ~_4979;
    int _5029 = _5027 + _4997;
    int _5031 = _5029 + 1;
    float _5033 = fma(_3099, _4907, _4991);
    bool _5035 = !_5005;
    int _5037 = _5035 ? _5013 : (-1);
    float _5039 = fma(_3061, _5003, _5017);
    bool _5041 = !_4889;
    int _5043 = _5041 ? _5023 : (-1);
    float _5045 = _5033 + 0.5;
    bool _5047 = !_4947;
    int _5049 = _5047 ? _5031 : (-1);
    float _5051 = float(_5037);
    float _5053 = float(_5043);
    float _5055 = fma(_5007, _2827, -0.5);
    float _5057 = float(_5049);
    float _5059 = -_3127;
    float _5061 = fma(_4999, _5051, _5059);
    float _5063 = _4533 * (-2.0);
    float _5065 = -_3133;
    float _5067 = fma(_5007, _5053, _5065);
    float _5069 = _4939 + 0.5;
    float _5071 = -_3093;
    float _5073 = fma(_4975, _5057, _5071);
    float _5075 = fma(_3115, _5025, _5061);
    float _5077 = fma(_3097, _5055, _5067);
    float _5079 = _4931 + 0.5;
    float _5081 = fma(_3103, _4983, _5073);
    float _5083 = _4927 + 0.5;
    float _5085 = _5039 + 0.5;
    float _5087 = _5075 + 0.5;
    float _5089 = _5077 + 0.5;
    float _5091 = _5081 + 0.5;
    float _5093 = fma(_3751, _5063, _3751);
    float _5095 = fma(_5063, _4485, _4485);
    out.m_83.x = _5079;
    out.m_83.y = _5085;
    out.m_83.z = _5083;
    out.m_83.w = _5087;
    out.m_85.x = _5045;
    out.m_85.y = _5089;
    out.m_87.x = _5069;
    out.m_87.y = _5091;
    int _5097 = as_type<int>(_5083);
    if (_3681)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5099 = -_3783;
    float _5101 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3515);
    float _5103 = -_3787;
    float _5105 = fma(_5103, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3499);
    float _5107 = -_3807;
    float _5109 = fma(_5107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3537);
    int _5111 = abs(_4673);
    float _5113 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5115 = _5101 + _5113;
    float _5117 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5119 = _5105 + _5117;
    float _5121 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5123 = _5109 + _5121;
    float _5125 = float(_3545);
    float _5127 = _5115 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5129 = float(_5111);
    float _5131 = _1481 + _1493;
    float _5133 = fma(_3733, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5095);
    float _5135 = fma(_5119, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5127);
    float _5137 = _1493 + (-0.5);
    float _5139 = _5129 * _5125;
    float _5141 = _5131 + (-1.0);
    float _5143 = fma(_5123, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5135);
    float _5145 = fma(_5093, _3137, _5133);
    float _5147 = _5139 * (-2.0);
    float _5149 = _4619 * 0.15915493667125701904296875;
    float _5151 = sqrt(_3873);
    bool _5153 = _5143 >= 0.0;
    float _5155 = fma(_5147, _4487, _4487);
    float _5157 = _5145 * 0.15915493667125701904296875;
    float _5159 = fma(_5137, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5155);
    float _5161 = fma(_5141, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5163 = _5149 * 6.283185482025146484375;
    float _5165 = sin(_5163);
    float _5167 = fma(_5161, _5147, _5161);
    float _5169 = _5139;
    float _5171 = _5105;
    float _5173 = _5123;
    if (_5153)
    {
        _5169 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5175 = _5169;
    if (_5153)
    {
        out.m_51.x = 0.0;
    }
    float _5177 = fma(_5167, _3137, _5159);
    float _5179 = _5157 * 6.283185482025146484375;
    float _5181 = sin(_5179);
    if (_5153)
    {
        float _5183 = _5175 * 5.0;
        _5097 = as_type<int>(_5183);
    }
    int _5185 = _5097;
    float _5187 = _5177 * 0.15915493667125701904296875;
    if (_5153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14330 = as_type<float>(_5185);
        out.gl_Position.z = _14330;
    }
    float _5189 = _5149 * 6.283185482025146484375;
    float _5191 = cos(_5189);
    float _5193 = _5157 * 6.283185482025146484375;
    float _5195 = cos(_5193);
    float _5197 = _5165 * _5181;
    float _5199 = _5187 * 6.283185482025146484375;
    float _5201 = sin(_5199);
    if (_5153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5203 = -_3515;
    float _5205 = _5203 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5207 = -_3499;
    float _5209 = _5207 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5211 = in.m_89.x;
    float _5213 = in.m_89.y;
    float _5215 = in.m_89.z;
    float _5217 = -_3537;
    float _5219 = _5217 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5221 = _5205 * _5205;
    float _5223 = _5187 * 6.283185482025146484375;
    float _5225 = cos(_5223);
    float _5227 = _5191 * _5195;
    float _5229 = _646 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5231 = fma(_5209, _5209, _5221);
    float _5233 = fma(_5201, _5227, _5197);
    float _5235 = fma(_5201, _5197, _5227);
    float _5237 = fma(_5219, _5219, _5231);
    float _5239 = _3757 * _5151;
    float _5241 = _658 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5243 = _5191 * _5181;
    float _5245 = rsqrt(_5237);
    float _5247 = _5165 * _5195;
    float _5249 = _5191 * _5225;
    float _5251 = _5195 * _5225;
    float _5253 = _5165 * _5225;
    float _5255 = _5181 * _5225;
    float _5257 = _5239 * _5241;
    float _5259 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5211);
    float _5261 = _636 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5263 = _5239 * _5229;
    float _5265 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5213);
    float _5267 = _5259 * _5257;
    float _5269 = -_5243;
    float _5271 = fma(_5201, _5247, _5269);
    float _5273 = _5209 * _5245;
    float _5275 = -_5247;
    float _5277 = fma(_5201, _5243, _5275);
    float _5279 = _5239 * _5261;
    float _5281 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5215);
    float _5283 = _5219 * _5245;
    float _5285 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5287 = _5273 * _5285;
    float _5289 = _5265 * _5263;
    float _5291 = _5281 * _5279;
    float _5293 = in.m_91.x;
    float _5295 = in.m_91.y;
    float _5297 = in.m_91.z;
    float _5299 = _5205 * _5245;
    float _5301 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5303 = _5283 * _5301;
    float _5305 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5307 = -_5287;
    float _5309 = fma(_5283, _5305, _5307);
    bool _5311 = _5213 != 0.0;
    bool _5313 = isnan(_5213);
    bool _5315 = _5311 || _5313;
    bool _5317 = isnan(0.0);
    bool _5319 = _5315 || _5317;
    float _5321 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5323 = _5299 * _5321;
    float _5325 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5327 = -_5303;
    float _5329 = fma(_5299, _5325, _5327);
    float _5331 = _5309 * _5309;
    bool _5333 = _5211 == 0.0;
    bool _5335 = !_5319;
    bool _5337 = _5333 && _5335;
    float _5339 = in.m_93.x;
    float _5341 = in.m_93.y;
    float _5343 = in.m_93.z;
    float _5345 = in.m_93.w;
    float _5347 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5349 = -_5323;
    float _5351 = fma(_5273, _5347, _5349);
    float _5353 = fma(_5329, _5329, _5331);
    bool _5355 = _5215 == 0.0;
    bool _5357 = _5355 && _5337;
    float _5359 = -_5289;
    float _5361 = _5201 * _5359;
    float _5363 = _5249 * _5289;
    float _5365 = fma(_5351, _5351, _5353);
    float _5367 = _5253 * _5289;
    float _5369 = fma(_5251, _5267, _5361);
    float _5371 = fma(_5233, _5267, _5363);
    float _5373 = fma(_5271, _5267, _5367);
    float _5375 = rsqrt(_5365);
    float _5377 = fma(_5255, _5291, _5369);
    float _5379 = fma(_5277, _5291, _5371);
    float _5381 = fma(_5235, _5291, _5373);
    float _5383 = _5267;
    float _5385 = _5361;
    float _5387 = _5363;
    float _5389 = _5209;
    float _5391 = _5293;
    float _5393 = _5235;
    if (_5357)
    {
        _5383 = _5293;
    }
    float _5395 = _5383;
    float _5397 = _5395;
    if (_5357)
    {
        _5385 = _5297;
    }
    float _5399 = _5385;
    float _5401 = _5399;
    if (_5357)
    {
        _5387 = _5395;
    }
    float _5403 = _5387;
    float _5405 = _5403;
    if (!_5357)
    {
        _5397 = _5293;
    }
    float _5407 = _5397;
    if (_5357)
    {
        _5389 = _5295;
    }
    float _5409 = _5389;
    float _5411 = _5409;
    if (!_5357)
    {
        float _5413 = fma(_5213, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5295);
        _5411 = _5413;
    }
    float _5415 = _5411;
    if (_5357)
    {
        _5391 = _5399;
    }
    float _5417 = _5391;
    float _5419 = _5343 * _5407;
    float _5421 = _5417;
    if (!_5357)
    {
        _5401 = _5297;
    }
    float _5423 = _5401;
    float _5425 = _5329 * _5375;
    float _5427 = _5309 * _5375;
    if (!_5357)
    {
        float _5429 = fma(_5211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5407);
        _5405 = _5429;
    }
    float _5431 = _5405;
    float _5433 = _5339 * _5295;
    float _5435 = -_5419;
    float _5437 = fma(_5339, _5423, _5435);
    float _5439 = _5341 * _5423;
    float _5441 = _5351 * _5375;
    float _5443 = _5283 * _5427;
    float _5445 = _5299 * _5425;
    if (!_5357)
    {
        float _5447 = fma(_5215, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5423);
        _5421 = _5447;
    }
    float _5449 = _5421;
    float _5451 = -_5439;
    float _5453 = fma(_5343, _5295, _5451);
    float _5455 = -_5433;
    float _5457 = fma(_5341, _5407, _5455);
    float _5459 = -_5443;
    float _5461 = fma(_5299, _5441, _5459);
    float _5463 = -_5445;
    float _5465 = fma(_5273, _5427, _5463);
    float _5467 = _5437 * _5345;
    float _5469 = _5453 * _5345;
    float _5471 = _5461 * _5379;
    float _5473 = _5465 * _5379;
    float _5475 = _5457 * _5345;
    float _5477 = _5273 * _5441;
    float _5479 = fma(_5425, _5377, _5471);
    float _5481 = fma(_5441, _5377, _5473);
    float _5483 = _5233 * _5461;
    float _5485 = -_5477;
    float _5487 = fma(_5283, _5425, _5485);
    float _5489 = fma(_5273, _5381, _5479);
    float _5491 = fma(_5283, _5381, _5481);
    float _5493 = _5233 * _5465;
    float _5495 = _5233 * _5487;
    float _5497 = _3499 + _5489;
    float _5499 = _3537 + _5491;
    float _5501 = _5487 * _5379;
    float _5503 = fma(_5251, _5427, _5495);
    float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5507 = _5497 + _5505;
    float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5511 = _5499 + _5509;
    float _5513 = _5249 * _5461;
    float _5515 = _5249 * _5487;
    float _5517 = _5507 * _5507;
    float _5519 = _5511 * _5511;
    float _5521 = _5249 * _5465;
    float _5523 = _5277 * _5461;
    float _5525 = _5277 * _5465;
    float _5527 = _5517 + _5519;
    float _5529 = _5277 * _5487;
    float _5531 = fma(_5255, _5425, _5523);
    float _5533 = -_5201;
    float _5535 = fma(_5533, _5427, _5515);
    float _5537 = sqrt(_5527);
    float _5539 = fma(_5255, _5427, _5529);
    float _5541 = fma(_5427, _5377, _5501);
    float _5543 = -_5201;
    float _5545 = fma(_5543, _5425, _5513);
    float _5547 = -_5201;
    float _5549 = fma(_5547, _5441, _5521);
    float _5551 = fma(_5251, _5425, _5483);
    float _5553 = fma(_5299, _5381, _5541);
    float _5555 = fma(_5251, _5441, _5493);
    float _5557 = fma(_5255, _5441, _5525);
    float _5559 = fma(_5253, _5273, _5545);
    float _5561 = fma(_5253, _5299, _5535);
    float _5563 = fma(_5253, _5283, _5549);
    float _5565 = _3515 + _5553;
    float _5567 = fma(_5271, _5273, _5551);
    float _5569 = fma(_5271, _5299, _5503);
    float _5571 = fma(_5271, _5283, _5555);
    bool _5573 = _5537 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5575 = fma(_5235, _5283, _5557);
    float _5577 = _5559 * _5341;
    float _5579 = _5561 * _5341;
    float _5581 = _5563 * _5341;
    float _5583 = _5561 * _5415;
    float _5585 = fma(_5235, _5273, _5531);
    float _5587 = fma(_5235, _5299, _5539);
    float _5589 = _5559 * _5415;
    float _5591 = _5467 * _5559;
    float _5593 = _5467 * _5561;
    float _5595 = _5467 * _5563;
    float _5597 = _5563 * _5415;
    float _5599 = _5503;
    float _5601 = _5559;
    float _5603 = _5531;
    float _5605 = _5467;
    float _5607 = _5475;
    if (!_5573)
    {
        _5599 = _5519;
    }
    float _5609 = _5599;
    float _5611 = _5609;
    if (!_5573)
    {
        _5601 = _5517;
    }
    float _5613 = _5601;
    float _5615 = _5613;
    if (!_5573)
    {
        _5393 = _5497;
    }
    float _5617 = _5393;
    float _5619 = _5617;
    if (!_5573)
    {
        _5603 = _5499;
    }
    float _5621 = _5603;
    float _5623 = _5621;
    if (!_5573)
    {
        _5605 = _5565;
    }
    float _5625 = _5605;
    bool _5627 = !_5573;
    float _5629 = _5625;
    if (!_5627)
    {
        float _5631 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5633 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5635 = _5537 + _5633;
        float _5637 = rsqrt(_5527);
        float _5639 = _5635 * _5631;
        float _5641 = _5565 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5643 = _5639 * 0.15915493667125701904296875;
        float _5645 = _5643 * 6.283185482025146484375;
        float _5647 = sin(_5645);
        float _5649 = _5643 * 6.283185482025146484375;
        float _5651 = cos(_5649);
        float _5653 = fma(_5647, _5641, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5655 = _5637 * _5653;
        float _5657 = _5651 + (-1.0);
        float _5659 = fma(_5507, _5655, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5661 = fma(_5511, _5655, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5663 = _5657 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5665 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5667 = _5659 + _5665;
        float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5671 = _5661 + _5669;
        float _5673 = fma(_5565, _5651, _5663);
        float _5675 = _5667 * _5667;
        float _5677 = _5671 * _5671;
        _5629 = _5673;
        _5615 = _5675;
        _5611 = _5677;
        _5619 = _5659;
        _5623 = _5661;
    }
    float _5679 = _5629;
    float _5681 = _5615;
    float _5683 = _5611;
    float _5685 = _5619;
    float _5687 = _5623;
    float _5689 = fma(_5567, _5339, _5577);
    float _5691 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5693 = _5679 + _5691;
    float _5695 = fma(_5567, _5431, _5589);
    float _5697 = fma(_5571, _5431, _5597);
    float _5699 = fma(_5569, _5339, _5579);
    float _5701 = fma(_5693, _5693, _5681);
    float _5703 = fma(_5569, _5431, _5583);
    float _5705 = fma(_5469, _5569, _5593);
    float _5707 = fma(_5571, _5339, _5581);
    float _5709 = _5701 + _5683;
    float _5711 = fma(_5469, _5567, _5591);
    float _5713 = fma(_5469, _5571, _5595);
    float _5715 = fma(_5585, _5343, _5689);
    float _5717 = fma(_5587, _5343, _5699);
    float _5719 = fma(_5587, _5449, _5703);
    float _5721 = sqrt(_5709);
    float _5723 = fma(_5575, _5343, _5707);
    float _5725 = fma(_5585, _5449, _5695);
    float _5727 = fma(_5475, _5585, _5711);
    float _5729 = fma(_5475, _5587, _5705);
    float _5731 = fma(_5475, _5575, _5713);
    float _5733 = fma(_5575, _5449, _5697);
    out.m_95.x = _5715;
    out.m_95.y = _5717;
    out.m_95.z = _5723;
    out.m_97.x = _5727;
    out.m_97.y = _5729;
    out.m_97.z = _5731;
    out.m_99.x = _5725;
    out.m_99.y = _5719;
    out.m_99.z = _5733;
    bool _5735 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5737 = isnan(_5721);
    bool _5739 = _5735 || _5737;
    bool _5741 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5743 = _5739 || _5741;
    float _5745 = _5695;
    if (!_5743)
    {
        _5607 = 1.0;
    }
    float _5747 = _5607;
    bool _5749 = !_5743;
    float _5751 = _5747;
    if (!_5749)
    {
        bool _5753 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5755 = isnan(_5721);
        bool _5757 = _5753 || _5755;
        bool _5759 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5761 = _5757 || _5759;
        if (!_5761)
        {
            float _5763 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5765 = _5721 + _5763;
            float _5767 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5769 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5767;
            float _5771 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5773 = _5771 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5775 = 1.0 / _5769;
            float _5777 = _5765 * _5775;
            float _5779 = fma(_5777, _5773, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5751 = _5779;
            _5781 = true;
        }
        else
        {
            bool _5783 = _5721 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5785 = isnan(_5721);
            bool _5787 = _5783 || _5785;
            bool _5789 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5791 = _5787 || _5789;
            if (!_5791)
            {
                float _5793 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5795 = _5721 + _5793;
                float _5797 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5799 = _5797 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5801 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5803 = _5801 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5805 = 1.0 / _5799;
                float _5807 = _5795 * _5805;
                float _5809 = fma(_5807, _5803, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5751 = _5809;
                _5781 = true;
            }
            else
            {
                _5751 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5781 = false;
    float _5811 = _5751;
    float _5813 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5815 = _5679 + _5813;
    float _5817 = _5101 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5819 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5821 = _5685 + _5819;
    float _5823 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5825 = _5687 + _5823;
    float _5827 = fma(_5815, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5829 = fma(_5105, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5817);
    float _5831 = fma(_5821, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5833 = fma(_5825, _5811, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5835 = -_3515;
    float _5837 = _5835 + _5827;
    float _5839 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5829);
    float _5841 = -_3499;
    float _5843 = _5841 + _5831;
    float _5845 = _5101 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5847 = _5837 * _5837;
    float _5849 = _5839 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5851 = -_3537;
    float _5853 = _5851 + _5833;
    float _5855 = fma(_5105, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5845);
    float _5857 = fma(_5843, _5843, _5847);
    float _5859 = 1.0 / _5849;
    float _5861 = fma(_5109, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5855);
    float _5863 = fma(_5853, _5853, _5857);
    float _5865 = _5861 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5867 = sqrt(_5863);
    float _5869 = _5865 + _5849;
    float _5871 = _5869 * _5859;
    float _5873 = _5871 * 0.5;
    float _5875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5877 = fma(_5873, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5875);
    bool _5879 = _5867 > 0.0;
    float _5881 = 1.0 / _5877;
    bool _5883 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5885 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5887 = _5883 || _5885;
    bool _5889 = isnan(0.5);
    bool _5891 = _5887 || _5889;
    bool _5893 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5895 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5897 = _5893 || _5895;
    bool _5899 = isnan(0.5);
    bool _5901 = _5897 || _5899;
    float _5903 = _5873;
    float _5905 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5907 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5909 = _5831;
    if (!_5879)
    {
        _5903 = _5831;
    }
    float _5911 = _5903;
    float _5913 = _5911;
    float _5915 = _5911;
    if (!_5879)
    {
        _5905 = _5827;
    }
    float _5917 = _5905;
    float _5919 = _5917;
    if (!_5879)
    {
        _5907 = _5833;
    }
    float _5921 = _5907;
    bool _5923 = !_5879;
    float _5925 = _5921;
    float _5927 = _5881;
    if (!_5923)
    {
        float _5929 = _226 * _226;
        float _5931 = fma(_222, _222, _5929);
        float _5933 = fma(_228, _228, _5931);
        float _5935 = rsqrt(_5863);
        float _5937 = sqrt(_5933);
        float _5939 = _5843 * _5935;
        float _5941 = _5837 * _5935;
        float _5943 = _5853 * _5935;
        bool _5945 = _5937 > 0.0;
        float _5947 = _5937;
        float _5949 = _5935;
        if (!_5945)
        {
            _5913 = _5831;
        }
        float _5951 = _5913;
        _5915 = _5951;
        if (!_5945)
        {
            _5947 = _5827;
        }
        float _5953 = _5947;
        _5919 = _5953;
        if (!_5945)
        {
            _5949 = _5833;
        }
        float _5955 = _5949;
        bool _5957 = !_5945;
        _5925 = _5955;
        if (!_5957)
        {
            float _5959 = rsqrt(_5933);
            float _5961 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5963 = _226 * _5959;
            float _5965 = _222 * _5959;
            float _5967 = _228 * _5959;
            float _5969 = _5941 * _5963;
            float _5971 = fma(_5939, _5965, _5969);
            float _5973 = _5961 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5975 = fma(_5943, _5967, _5971);
            float _5977 = _5975 * _5973;
            float _5979 = fma(_222, _5977, _5831);
            float _5981 = fma(_226, _5977, _5827);
            float _5983 = fma(_228, _5977, _5833);
            _5915 = _5979;
            _5919 = _5981;
            _5925 = _5983;
        }
    }
    float _5985 = _5915;
    float _5987 = _5919;
    float _5989 = _5925;
    float _5991 = -_3787;
    float _5993 = fma(_5991, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5985);
    float _5995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5997 = _5881 * _5995;
    float _5999 = -_3783;
    float _6001 = fma(_5999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5987);
    float _6003 = -_3807;
    float _6005 = fma(_6003, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5989);
    float _6007 = _6001;
    float _6009 = _6005;
    if (_5891)
    {
        _5909 = 1.0;
    }
    float _6011 = _5909;
    float _6013 = _6011;
    if (_5901)
    {
        _5927 = _5993;
    }
    float _6015 = _5927;
    float _6017 = _6015;
    if (!_5901)
    {
        float _6019 = _5115 * _5115;
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6023 = -_3537;
        float _6025 = _6023 + _5989;
        float _6027 = -_3499;
        float _6029 = _6027 + _5985;
        float _6031 = fma(_5119, _5119, _6019);
        float _6033 = fma(_5123, _5123, _6031);
        float _6035 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6037 = sqrt(_6033);
        float _6039 = 1.0 / _5239;
        float _6041 = _6035 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6043 = precise::min(_6037, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6045 = _6043 * _6021;
        float _6047 = -_3515;
        float _6049 = _6047 + _5987;
        float _6051 = _6045 * _6039;
        float _6053 = _6041 * _6051;
        float _6055 = _6025 * _6051;
        float _6057 = fma(_6049, _6053, _5101);
        float _6059 = fma(_6029, _6053, _5105);
        float _6061 = fma(_6041, _6055, _5109);
        _6007 = _6057;
        _6017 = _6059;
        _6009 = _6061;
    }
    float _6063 = _6007;
    float _6065 = _6017;
    float _6067 = _6009;
    if (!_5891)
    {
        float _6069 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6071 = _6069 * 0.15915493667125701904296875;
        float _6073 = _6071 * 6.283185482025146484375;
        float _6075 = cos(_6073);
        float _6077 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6079 = _6077 * 0.15915493667125701904296875;
        float _6081 = _6071 * 6.283185482025146484375;
        float _6083 = sin(_6081);
        float _6085 = 1.0 / _6075;
        float _6087 = _6079 * 6.283185482025146484375;
        float _6089 = cos(_6087);
        float _6091 = _6083 * _6085;
        float _6093 = _6079 * 6.283185482025146484375;
        float _6095 = sin(_6093);
        float _6097 = _6089 * _6091;
        float _6099 = 1.0 / _6097;
        float _6101 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6103 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6101;
        float _6105 = 1.0 / _6103;
        float _6107 = _6095 * _6099;
        float _6109 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6111 = fma(_5997, _6107, _6109);
        float _6113 = _6111 * _6105;
        float _6115 = precise::clamp(_6113, 0.0, 1.0);
        _6013 = _6115;
    }
    float _6117 = _6013;
    float _6119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6121 = _6063 + _6119;
    float _6123 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6125 = _6065 + _6123;
    float _6127 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6129 = _6067 + _6127;
    float _6131 = _6121 * _6121;
    float _6133 = fma(_6125, _6125, _6131);
    float _6135 = fma(_5105, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6137 = fma(_6129, _6129, _6133);
    float _6139 = rsqrt(_6137);
    float _6141 = sqrt(_6137);
    float _6143 = _6139 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6145 = _6125 * _6143;
    float _6147 = _6129 * _6143;
    float _6149 = _6145 * _6145;
    float _6151 = _6147 * _6147;
    float _6153 = _6149 + _6151;
    float _6155 = sqrt(_6153);
    bool _6157 = _6155 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6159 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6161 = _6155 + _6159;
    float _6163 = _6139;
    float _6165 = _6153;
    float _6167 = _6161;
    float _6169 = _6121;
    if (_6157)
    {
        float _6171 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6163 = _6171;
    }
    float _6173 = _6163;
    if (!_6157)
    {
        _5171 = _6149;
    }
    float _6175 = _5171;
    float _6177 = _6175;
    if (_6157)
    {
        float _6179 = rsqrt(_6153);
        _6165 = _6179;
    }
    float _6181 = _6165;
    float _6183 = _6181;
    if (_6157)
    {
        float _6185 = _6161 * _6173;
        _6167 = _6185;
    }
    float _6187 = _6167;
    float _6189 = floor(_6135);
    if (_6157)
    {
        float _6191 = _6187 * 0.15915493667125701904296875;
        _5173 = _6191;
    }
    float _6193 = _5173;
    float _6195 = _6129;
    if (_6157)
    {
        float _6197 = _6193 * 6.283185482025146484375;
        float _6199 = sin(_6197);
        _6195 = _6199;
    }
    float _6201 = _6195;
    float _6203 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6205 = precise::max(0.0, _6203);
    float _6207 = _6173;
    float _6209 = _6205;
    if (_6157)
    {
        float _6211 = _6193 * 6.283185482025146484375;
        float _6213 = cos(_6211);
        _6207 = _6213;
    }
    float _6215 = _6207;
    float _6217 = -_6189;
    float _6219 = _6135 + _6217;
    float _6221 = -_6143;
    float _6223 = -_6205;
    float _6225 = fma(_6121, _6221, _6223);
    if (_6157)
    {
        float _6227 = _6225 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6169 = _6227;
    }
    float _6229 = _6169;
    float _6231 = _6229;
    float _6233 = _6201;
    if (_6157)
    {
        float _6235 = fma(_6201, _6229, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6231 = _6235;
    }
    float _6237 = _6231;
    float _6239 = _6237;
    if (!_6157)
    {
        _6233 = _6145;
    }
    float _6241 = _6233;
    float _6243 = _6241;
    if (_6157)
    {
        float _6245 = _6181 * _6237;
        _5745 = _6245;
    }
    float _6247 = _5745;
    float _6249 = _6215;
    if (_6157)
    {
        float _6251 = _6215 + (-1.0);
        _6209 = _6251;
    }
    float _6253 = _6209;
    float _6255 = _6253;
    if (!_6157)
    {
        _6239 = _6225;
    }
    float _6257 = _6239;
    float _6259 = _6257;
    if (_6157)
    {
        float _6261 = _6145 * _6247;
        _6243 = _6261;
    }
    float _6263 = _6243;
    if (_6157)
    {
        float _6265 = _6253 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6183 = _6265;
    }
    float _6267 = _6183;
    if (!_6157)
    {
        _6255 = _6147;
    }
    float _6269 = _6255;
    float _6271 = _6269;
    if (_6157)
    {
        float _6273 = _6147 * _6247;
        _6271 = _6273;
    }
    float _6275 = _6271;
    if (_6157)
    {
        float _6277 = _6263 * _6263;
        _6177 = _6277;
    }
    float _6279 = _6177;
    if (_6157)
    {
        float _6281 = fma(_6225, _6215, _6267);
        _6259 = _6281;
    }
    float _6283 = _6259;
    if (!_6157)
    {
        _6249 = _6151;
    }
    float _6285 = _6249;
    float _6287 = _6285;
    if (_6157)
    {
        float _6289 = _6275 * _6275;
        _6287 = _6289;
    }
    float _6291 = _6287;
    float _6293 = fma(_6283, _6283, _6279);
    float _6295 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6297 = _6293 + _6291;
    float _6299 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6295);
    float _6301 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6303 = fma(_6141, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6301);
    float _6305 = precise::clamp(_6303, 0.0, 1.0);
    float _6307 = rsqrt(_6297);
    float _6309 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6299);
    float _6311 = -_6305;
    float _6313 = _6311 + 1.0;
    float _6315 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6317 = fma(_5109, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6319 = _6309 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6321 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6323 = abs(_6313);
    float _6325 = log2(_6323);
    float _6327 = _6319 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6329 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6331 = -_6327;
    float _6333 = fma(_6331, _6315, 1.0);
    float _6335 = _6063 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6337 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6329);
    float _6339 = _6307 * _6263;
    float _6341 = _6307 * _6283;
    float _6343 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6335);
    float _6345 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6337);
    float _6347 = _6339 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6349 = _6307 * _6275;
    float _6351 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6343);
    float _6353 = _6345 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6355 = -_6347;
    float _6357 = fma(_6341, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6355);
    float _6359 = fma(_6065, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6321);
    float _6361 = _6351 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6363 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6365 = floor(_6317);
    float _6367 = -_6349;
    float _6369 = fma(_6367, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6357);
    float _6371 = fma(_6067, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6359);
    float _6373 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6363);
    float _6375 = _6325 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6377 = fma(_6369, -0.5, 0.5);
    float _6379 = _6371 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6381 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6373);
    float _6383 = exp2(_6375);
    float _6385 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6387 = fma(_6369, 0.5, 0.5);
    float _6389 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6381);
    float _6391 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6393 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6385);
    float _6395 = sqrt(_6377);
    float _6397 = -_6365;
    float _6399 = _6317 + _6397;
    float _6401 = fma(_6387, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6403 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6391);
    float _6405 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6393);
    float _6407 = _6341 + 1.0;
    float _6409 = fma(_6387, _6401, -0.212114393711090087890625);
    float _6411 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6403);
    float _6413 = log2(_6333);
    float _6415 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6405);
    float _6417 = fma(_6387, _6409, 1.570728778839111328125);
    float _6419 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6411);
    float _6421 = -_6341;
    float _6423 = fma(_6383, _6407, _6421);
    float _6425 = 1.0 / _6389;
    float _6427 = _6395 * 0.636619746685028076171875;
    float _6429 = fma(_6423, 0.5, 0.5);
    float _6431 = -_6417;
    float _6433 = fma(_6427, _6431, 1.0);
    float2 _16350 = float2(_6219, _6399);
    float _6435 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16350, float2(0.0), isnan(_16350)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16350, float2(0.0), isnan(_16350)), level(0.0)).x;
    float _6437 = _6413 * 0.693147182464599609375;
    float _6439 = _6415 * _6425;
    float _6441 = _6419 * _6425;
    float _6443 = _6437 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6445 = fma(_6439, 0.5, 0.5);
    float _6447 = fma(_6441, -0.5, 0.5);
    float3 _16378 = float3(_6445, _6447, _6443);
    float _6449 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16378, float3(0.0), isnan(_16378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16378, float3(0.0), isnan(_16378)), level(0.0)).x;
    float3 _16389 = float3(_6445, _6447, _6443);
    float4 _6452 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16389, float3(0.0), isnan(_16389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16389, float3(0.0), isnan(_16389)), level(0.0)).xyzw;
    float _6454 = _6452.x;
    float _6456 = _6452.y;
    float _6458 = _6452.z;
    float _6460 = _6452.w;
    float2 _16405 = float2(_6433, _6429);
    float3 _6464 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16405, float2(0.0), isnan(_16405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16405, float2(0.0), isnan(_16405)), level(0.0)).xyz;
    float _6466 = _6464.x;
    float _6468 = _6464.y;
    float _6470 = _6464.z;
    float _6472 = abs(_5997);
    float _6474 = log2(_6472);
    float _6476 = _6325 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6478 = _6389 * 0.5;
    float _6480 = _6353 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _6482 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6484 = isnan(_6141);
    bool _6486 = _6482 || _6484;
    bool _6488 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6490 = _6486 || _6488;
    float _6492 = exp2(_6476);
    bool _6494 = _5997 <= 8000.0;
    bool _6496 = isnan(_5997);
    bool _6498 = _6494 || _6496;
    bool _6500 = isnan(8000.0);
    bool _6502 = _6498 || _6500;
    float _6504 = float(_6502);
    float _6506 = fma(_6361, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6480);
    float _6508 = in.m_101.x;
    float _6510 = fma(_6319, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6506);
    float _6512 = _6474 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6514 = fma(_6379, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6510);
    float _6516 = _6415 + _6389;
    float _6518 = exp2(_6512);
    float _6520 = _6516 * 0.5;
    float _6522 = -_6492;
    float _6524 = _6522 + 1.0;
    out.gl_Position.x = _6415;
    out.gl_Position.y = _6419;
    out.gl_Position.z = _6514;
    out.gl_Position.w = _6389;
    float _6526 = _6516;
    float _6528 = _6419;
    float _6530 = _6415;
    float _6532 = _6389;
    float _6534 = _6514;
    float _6536 = _6520;
    if (!_6490)
    {
        _6526 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6538 = _6526;
    float _6540 = _6524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6542 = fma(_6518, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6544 = precise::clamp(_6542, 0.0, 1.0);
    float _6546 = fma(_6419, -0.5, _6478);
    float _6548 = fma(_6544, -2.0, 3.0);
    float _6550 = _6544 * _6544;
    float _6552 = _6538;
    float _6554 = _6538;
    if (!_6490)
    {
        _6528 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6556 = _6528;
    float _6558 = _6556;
    float _6560 = _6556;
    if (!_6490)
    {
        _6530 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6562 = _6530;
    float _6564 = _6550 * _6548;
    float _6566 = -_6564;
    float _6568 = _6566 + 1.0;
    float _6570 = fma(_6568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6564);
    float _6572 = _6514 + _6389;
    float _6574 = _6504 * _6570;
    float _6576 = _6572 * 0.5;
    float _6578 = _6562;
    float _6580 = _6562;
    if (!_6490)
    {
        _6532 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6582 = _6532;
    float _6584 = _6574 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6586 = _6582;
    float _6588 = _6582;
    if (!_6490)
    {
        _6534 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6590 = _6534;
    out.m_103.x = _6520;
    out.m_103.y = _6546;
    out.m_103.z = _6576;
    out.m_103.w = _6389;
    float _6592 = _6117 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6594 = _6590;
    float _6596 = _6590;
    if (!_6490)
    {
        _6536 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6598 = _6536;
    float _6600 = -_6435;
    float _6602 = _6600 + 1.0;
    float _6604 = _6602 * _6584;
    float _6606 = precise::clamp(_6604, 0.0, 1.0);
    float _6608 = -_6606;
    float _6610 = fma(_6608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6612 = _6610 * _6508;
    float _6614 = _6612 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6616 = _6540 * _6449;
    float _6618 = -_6540;
    float _6620 = _6618 + 1.0;
    out.m_105.x = _6614;
    float _6622 = _6460 * _6616;
    float _6624 = _6470 * _6616;
    float _6626 = _6460 * _6620;
    float _6628 = fma(_6466, _6622, _6454);
    float _6630 = fma(_6468, _6622, _6456);
    float _6632 = fma(_6460, _6624, _6458);
    out.m_107.x = _6628;
    out.m_107.y = _6630;
    out.m_107.z = _6632;
    out.m_107.w = _6626;
    bool _6634 = !_6490;
    float _6636 = _6598;
    float _6638 = _6598;
    if (!_6634)
    {
        bool _6640 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6642 = isnan(_6141);
        bool _6644 = _6640 || _6642;
        bool _6646 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6648 = _6644 || _6646;
        if (!_6648)
        {
            float _6650 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6652 = _6141 + _6650;
            float _6654 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6656 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6654;
            float _6658 = 1.0 / _6656;
            float _6660 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6662 = _6660 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6664 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6666 = _6664 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6668 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6670 = _6668 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6672 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6674 = _6672 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6676 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6678 = _6676 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6680 = _6652 * _6658;
            float _6682 = precise::clamp(_6680, 0.0, 1.0);
            float _6684 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6686 = _6684 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6688 = fma(_6682, _6666, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6690 = fma(_6682, _6686, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6692 = fma(_6682, _6662, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6694 = fma(_6682, _6670, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6696 = fma(_6682, _6674, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6698 = fma(_6682, _6678, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6580 = _6692;
            _6588 = _6696;
            _6560 = _6690;
            _6638 = _6694;
            _6554 = _6688;
            _6596 = _6698;
            _6700 = true;
        }
        else
        {
            bool _6702 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6704 = isnan(_6141);
            bool _6706 = _6702 || _6704;
            bool _6708 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6710 = _6706 || _6708;
            if (!_6710)
            {
                _6636 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6712 = _6636;
            _6638 = _6712;
            if (!_6710)
            {
                _6586 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6714 = _6586;
            _6588 = _6714;
            if (!_6710)
            {
                _6594 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6716 = _6594;
            _6596 = _6716;
            if (!_6710)
            {
                _6558 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6718 = _6558;
            _6560 = _6718;
            if (!_6710)
            {
                _6578 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6720 = _6578;
            _6580 = _6720;
            if (!_6710)
            {
                _6552 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6722 = _6552;
            bool _6724 = !_6710;
            _6554 = _6722;
            if (!_6724)
            {
                bool _6726 = _6141 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6728 = isnan(_6141);
                bool _6730 = _6726 || _6728;
                bool _6732 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6734 = _6730 || _6732;
                if (!_6734)
                {
                    float _6736 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6738 = _6141 + _6736;
                    float _6740 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6742 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6740;
                    float _6744 = 1.0 / _6742;
                    float _6746 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6748 = _6746 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6750 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6752 = _6750 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6754 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6756 = _6754 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6758 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6760 = _6758 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6762 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6764 = _6762 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6766 = _6738 * _6744;
                    float _6768 = precise::clamp(_6766, 0.0, 1.0);
                    float _6770 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6772 = _6770 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6774 = fma(_6768, _6752, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6776 = fma(_6768, _6772, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6778 = fma(_6768, _6748, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6780 = fma(_6768, _6756, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6782 = fma(_6768, _6760, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6784 = fma(_6768, _6764, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6580 = _6778;
                    _6588 = _6782;
                    _6560 = _6776;
                    _6638 = _6780;
                    _6554 = _6774;
                    _6596 = _6784;
                    _6700 = true;
                }
                else
                {
                    _6580 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6588 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6560 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6638 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6554 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6596 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6700 = false;
    float _6786 = _6580;
    float _6788 = _6588;
    float _6790 = _6560;
    float _6792 = _6638;
    float _6794 = _6554;
    float _6796 = _6596;
    float _6798 = _6592 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6800 = fma(_5719, -0.5, 0.5);
    float _6802 = precise::clamp(_6800, 0.0, 1.0);
    float _6804 = -_6786;
    float _6806 = _6788 + _6804;
    float _6808 = -_6790;
    float _6810 = _6792 + _6808;
    out.m_51.x = _6798;
    float _6812 = fma(_6802, _6806, _6786);
    float _6814 = -_6794;
    float _6816 = _6796 + _6814;
    float _6818 = fma(_6802, _6810, _6790);
    float _6820 = _6812 * 0.586610972881317138671875;
    bool _6822 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6824 = fma(_6802, _6816, _6794);
    out.m_109.x = 0.0;
    float _6826 = fma(_6818, 0.298911988735198974609375, _6820);
    bool _6828 = _6117 > 0.0;
    bool _6830 = isnan(_6117);
    bool _6832 = _6828 || _6830;
    bool _6834 = isnan(0.0);
    bool _6836 = _6832 || _6834;
    float _6838 = fma(_6824, 0.114477999508380889892578125, _6826);
    float _6840 = -_6838;
    float _6842 = _6818 + _6840;
    float _6844 = -_6838;
    float _6846 = _6812 + _6844;
    float _6848 = -_6838;
    float _6850 = _6824 + _6848;
    float _6852 = fma(_6842, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    float _6854 = fma(_6846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    float _6856 = fma(_6850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6838);
    bool _6858 = !_6822;
    if (!_6858)
    {
        float _6860 = -_6063;
        float _6862 = _6860 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6864 = -_6065;
        float _6866 = _6864 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6868 = -_6067;
        float _6870 = _6868 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6872 = _6862 * _6862;
        float _6874 = fma(_6866, _6866, _6872);
        float _6876 = fma(_6870, _6870, _6874);
        float _6878 = sqrt(_6876);
        float _6880 = rsqrt(_6876);
        float _6882 = -_6878;
        float _6884 = _6882 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6886 = _6884 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6888 = precise::clamp(_6886, 0.0, 1.0);
        float _6890 = _6866 * _6880;
        float _6892 = _6862 * _6880;
        float _6894 = abs(_6888);
        float _6896 = log2(_6894);
        float _6898 = _6870 * _6880;
        float _6900 = _6890 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6902 = _5719 * _6892;
        float _6904 = -_6892;
        float _6906 = -_6900;
        float _6908 = fma(_6904, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6906);
        float _6910 = fma(_5725, _6890, _6902);
        float _6912 = -_6898;
        float _6914 = fma(_6912, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6908);
        float _6916 = fma(_5733, _6898, _6910);
        float _6918 = precise::clamp(_6916, 0.0, 1.0);
        float _6920 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6922 = _6914 + _6920;
        float _6924 = _6896 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6926 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6928 = precise::clamp(_6926, 0.0, 1.0);
        float _6930 = exp2(_6924);
        float _6932 = _6930 * _6928;
        float _6934 = _6918 * _6932;
        float _6936 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6938 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6940 = _6934 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_109.x = _6936;
        out.m_109.y = _6938;
        out.m_109.z = _6940;
    }
    out.m_111.x = _6852;
    out.m_111.y = _6854;
    out.m_111.z = _6856;
    if (_6836)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _6942 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6942;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

