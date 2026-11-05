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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_20 [[id(7)]];
    sampler vp_t_tcb_20Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_24 [[id(9)]];
    sampler vp_t_tcb_24Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_32 [[id(11)]];
    sampler vp_t_tcb_32Smplr [[id(12)]];
    texture3d<float> vp_t_tcb_30 [[id(13)]];
    sampler vp_t_tcb_30Smplr [[id(14)]];
    texture2d<float> vp_t_tcb_1C [[id(15)]];
    sampler vp_t_tcb_1CSmplr [[id(16)]];
    sampler vp_t_tcb_20Smplr_w [[id(17)]];
    sampler vp_t_tcb_24Smplr_w [[id(18)]];
    sampler vp_t_tcb_32Smplr_w [[id(19)]];
    sampler vp_t_tcb_30Smplr_w [[id(20)]];
    sampler vp_t_tcb_1CSmplr_w [[id(21)]];
    constant dm_border_t* dm_border [[id(22)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_85 [[user(locn1)]];
    float4 m_109 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_101 [[user(locn9)]];
    float4 m_103 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_81 [[user(locn13)]];
    float4 m_77 [[user(locn14)]];
    float4 m_111 [[user(locn15)]];
    float4 m_97 [[user(locn16)]];
    float4 m_107 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_99 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_67 [[attribute(3)]];
    float4 m_50 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_83 [[attribute(7)]];
    float4 m_69 [[attribute(8)]];
    float4 m_57 [[attribute(9)]];
    float4 m_59 [[attribute(10)]];
    float4 m_75 [[attribute(11)]];
    float4 m_71 [[attribute(12)]];
    float4 m_73 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2207 = false;
    bool _1520 = false;
    bool _600 = false;
    bool _496 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2506 = as_type<float>(_146);
        out.gl_Position.z = _2506;
    }
    if (!_134)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _150 = in.m_55.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_53.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2574 = as_type<float>(_182);
        out.gl_Position.z = _2574;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _186 = !_184;
    float _204;
    if (!_186)
    {
        float _188 = in.m_57.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        float _208 = float(_130);
        float _210 = 1.0 / _208;
        float _212 = _164 * _210;
        _204 = _212;
    }
    _206 = false;
    float _214 = _204;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _214 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _214 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = 1.0 / _230;
    float _246 = 1.0 / _234;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _250 = 1.0 / _242;
    float _252 = _218 * _244;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _256 = _214 + _254;
    float _258 = 1.0 / _238;
    float _260 = _222 * _246;
    bool _262 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _264 = isnan(_214);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = _256 * _250;
    bool _280 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _282 = isnan(_214);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    bool _292 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_214);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = _290 * _276;
    float _306 = -_290;
    float _308 = _306 + 1.0;
    float _310 = _226 * _258;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_214);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = _302 * _308;
    float _338 = -_302;
    float _340 = _338 + 1.0;
    float _342 = fma(_314, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_318, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = fma(_322, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _348 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_214);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_334;
    float _362 = _360 + 1.0;
    float _364 = _334 * _340;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _378 = _358 * _362;
    float _380 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _382 = fma(_372, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _384 = fma(_376, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _342 * _378;
    float _388 = _344 * _378;
    float _390 = -_358;
    float _392 = _390 + 1.0;
    float _394 = in.m_59.x;
    float _396 = in.m_59.y;
    float _398 = in.m_59.z;
    float _400 = _346 * _378;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _402;
    float _406 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _408 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _414;
    float _418 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _420 = fma(_382, _364, _406);
    float _422 = fma(_404, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_380, _364, _408);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = fma(_412, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _432 = fma(_416, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _442 = fma(_384, _364, _418);
    float _444 = fma(_428, _278, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _446 = fma(_422, _336, _424);
    float _448 = fma(_436, _278, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_440, _278, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _452 = fma(_430, _336, _420);
    float _454 = fma(_432, _336, _442);
    float _456 = fma(_444, _304, _446);
    float _458 = fma(_448, _304, _452);
    float _460 = fma(_450, _304, _454);
    float _462 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].x, _456);
    float _464 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].y, _458);
    float _466 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].z, _460);
    float _468 = _462 * _394;
    float _470 = _464 * _396;
    float _472 = _466 * _398;
    bool _474 = !_248;
    float _476 = _310;
    float _494;
    if (!_474)
    {
        float _478 = in.m_57.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_130);
        float _500 = 1.0 / _498;
        float _502 = _164 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    bool _506 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_504);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _522 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_504);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _504 + _538;
    float _542 = -_516;
    float _544 = _542 + 1.0;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _520;
    float _550 = _532 * _544;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    float _556 = _536 * _548;
    float _558 = fma(_556, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = _558 * _550;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _570 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[116].x, _566);
    float _574 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _574;
    out.m_61.y = _570;
    out.m_61.z = _576;
    out.m_61.w = _578;
    bool _580 = !_546;
    float _598;
    if (!_580)
    {
        float _582 = in.m_57.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_130);
        float _604 = 1.0 / _602;
        float _606 = _164 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_50.x;
    float _612 = in.m_50.y;
    float _614 = in.m_50.z;
    float _616 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _618 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _620 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = in.m_63.x;
    float _624 = in.m_63.y;
    float _626 = in.m_63.z;
    float _628 = _616 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _630 = in.m_65.x;
    float _632 = in.m_65.y;
    float _634 = in.m_65.z;
    float _636 = in.m_67.x;
    float _638 = in.m_67.y;
    float _640 = in.m_67.z;
    float _642 = _612 * _624;
    float _644 = _612 * _632;
    float _646 = fma(_610, _622, _642);
    float _648 = _612 * _638;
    float _650 = fma(_610, _630, _644);
    float _652 = fma(_614, _626, _646);
    float _654 = fma(_610, _636, _648);
    float _656 = fma(_614, _634, _650);
    float _658 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = fma(_614, _640, _654);
    float _662 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _658 + _664;
    float _668 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _672 = _662 + _670;
    float _674 = _666 * _666;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _668 + _676;
    float _680 = fma(_672, _672, _674);
    float _682 = fma(_678, _678, _680);
    float _684 = sqrt(_682);
    float _686 = rsqrt(_682);
    float _688 = _684 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _690 = precise::min(_628, _688);
    float _692 = in.m_69.x;
    float _694 = in.m_69.y;
    float _696 = in.m_69.z;
    float _698 = _686 * _690;
    float _700 = _666 * _698;
    float _702 = _672 * _698;
    float _704 = _678 * _698;
    float _706 = -_700;
    float _708 = _666 + _706;
    float _710 = -_702;
    float _712 = _672 + _710;
    float _714 = -_704;
    float _716 = _678 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = sqrt(_722);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _694);
    float _728 = _686 * _724;
    float _730 = _618 * _728;
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _692);
    float _734 = _616 * _728;
    float _736 = _620 * _728;
    float _738 = _730 * _726;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _696);
    float _742 = _734 * _732;
    float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _746 = _736 * _740;
    float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _750 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _752 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _744);
    float _754 = -_704;
    float _756 = _668 + _754;
    float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _748);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _750);
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _752);
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _758);
    float _766 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _760);
    float _768 = _762 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _770 = _764 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _772 = _766 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _774 = _668 + _768;
    float _776 = _662 + _770;
    float _778 = _658 + _772;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _782 = _774 + _780;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _786 = _776 + _784;
    float _788 = _782 * _782;
    float _790 = fma(_786, _786, _788);
    float _792 = -_702;
    float _794 = _662 + _792;
    float _796 = sqrt(_790);
    float _798 = fma(_794, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _802 = floor(_798);
    bool _804 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = floor(_800);
    float _808 = _776;
    float _810 = _774;
    float _812 = _756;
    if (!_804)
    {
        _476 = _778;
    }
    float _814 = _476;
    bool _816 = !_804;
    float _818 = _814;
    if (!_816)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _796 + _822;
        float _826 = _778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = rsqrt(_790);
        float _830 = _824 * _820;
        float _832 = _830 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = sin(_838);
        float _842 = _836 + (-1.0);
        float _844 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = fma(_840, _826, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _848 = fma(_778, _836, _844);
        float _850 = _828 * _846;
        float _852 = fma(_786, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _854 = fma(_782, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _808 = _852;
        _810 = _854;
        _818 = _848;
    }
    float _856 = _808;
    float _858 = _810;
    float _860 = _818;
    float _862 = fma(_856, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = fma(_858, 6.2500002968590706586837768554688e-05, 0.5);
    float _866 = -_802;
    float _868 = _798 + _866;
    float _870 = -_806;
    float _872 = _800 + _870;
    float2 _3703 = float2(_862, _864);
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3703, float2(0.0), isnan(_3703)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3703, float2(0.0), isnan(_3703)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    float2 _3719 = float2(_868, _872);
    float _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3719, float2(0.0), isnan(_3719)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3719, float2(0.0), isnan(_3719)), level(0.0)).x;
    float _886 = in.m_57.w;
    float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _890 = in.m_71.y;
    float _892 = -_700;
    float _894 = _892 + _860;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _898 = _896 != 0;
    float _900 = in.m_57.y;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _904 = _902 != 0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _908 = in.m_57.x;
    float _910 = -_702;
    float _912 = _910 + _856;
    float _914 = in.m_57.z;
    float _916 = -_704;
    float _918 = _916 + _858;
    float _920 = in.m_73.w;
    float _922 = in.m_71.x;
    bool _924 = _886 > 0.5;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _930 = in.m_75.x;
    float _932 = in.m_75.y;
    float _934 = in.m_75.z;
    float _936 = in.m_75.w;
    float _938 = -_890;
    float _940 = _938 + 1.0;
    float _942 = 1.0 / _928;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _946 = _944 != 0;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _950 = _900 > 0.5;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _954 = _924 ? as_type<int>(_940) : as_type<int>(_890);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _958 = _950 ? as_type<int>(_940) : as_type<int>(_890);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _964 = _962 != 0;
    float _966 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[78].z, _956);
    float _968 = _898 ? as_type<float>(_958) : _890;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _974 = _972 != 0;
    out.m_77.w = _920;
    float _976 = -_700;
    float _978 = _658 + _976;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _982 = _980 != 0;
    out.m_79.w = _690;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _986 = _984 != 0;
    float _988 = _908 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _990;
    float _994 = _932 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _996 = _932 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _998 = _932 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1000 = -_970;
    float _1002 = fma(_988, 2.0, _1000);
    float _1004 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _994);
    float _1006 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _996);
    float _1008 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _998);
    float _1010 = _986 ? as_type<float>(_954) : _890;
    float _1012 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1016 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1008);
    bool _1018 = _914 > 0.5;
    float _1020 = _992 * _942;
    float _1022 = _888 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1026 = _608 + _1024;
    out.m_81.x = _1012;
    out.m_81.y = _1014;
    out.m_81.z = _1016;
    float _1028 = _890;
    bool _1030 = _974;
    float _1032 = _948;
    float _1034 = _1012;
    float _1036 = _1022;
    float _1038 = _922;
    float _1040 = _914;
    float _1042 = _900;
    float _1044 = _918;
    float _1046 = _978;
    if (_974)
    {
        float _1048 = _1018 ? _940 : _890;
        _1028 = _1048;
    }
    float _1050 = _1028;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1054 = fma(_1020, _1026, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1058 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1060 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1062 = isnan(_608);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    int _1072 = 0;
    if (_982)
    {
        float _1074 = -_922;
        float _1076 = _1074 + 1.0;
        _1072 = as_type<int>(_1076);
    }
    int _1078 = _1072;
    if (_904)
    {
        bool _1080 = _908 > 0.5;
        _1030 = _1080;
    }
    bool _1082 = _1030;
    float _1084 = fma(_1058, -2.0, _948);
    float _1086 = fma(_1022, _968, -0.5);
    float _1088 = _1086;
    if (!_904)
    {
        _1032 = _922;
    }
    float _1090 = _1032;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1094 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1096 = isnan(_608);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -_1070;
    float _1108 = _1106 + 1.0;
    float _1110 = _1090;
    if (_964)
    {
        _1034 = _908;
    }
    float _1112 = _1034;
    float _1114 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1092);
    float _1116 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1084);
    float _1118 = _1112;
    if (!_964)
    {
        _1118 = _914;
    }
    float _1120 = _1118;
    float _1122 = _1104 * _1108;
    float _1124 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1114);
    float _1126 = _906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1128 = as_type<int>(_1124);
    if (!_964)
    {
        _1036 = _900;
    }
    float _1130 = _1036;
    float _1132 = _1054 * _1122;
    float _1134 = -_1116;
    float _1136 = fma(_1124, _1086, _1134);
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1140 = _1130;
    float _1142 = _1132;
    if (_904)
    {
        float _1144 = -_922;
        float _1146 = _1144 + 1.0;
        _1128 = as_type<int>(_1146);
    }
    int _1148 = _1128;
    float _1150 = fma(_1010, _1126, -0.5);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1154 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1156 = as_type<int>(_1056);
    if (_946)
    {
        float _1158 = -_922;
        float _1160 = _1158 + 1.0;
        _1156 = as_type<int>(_1160);
    }
    int _1162 = _1156;
    if (_904)
    {
        float _1164 = _1082 ? as_type<float>(_1148) : _922;
        _1110 = _1164;
    }
    float _1166 = _1110;
    float _1168 = -_1152;
    float _1170 = fma(_1138, 2.0, _1168);
    if (!_946)
    {
        _1088 = _922;
    }
    float _1172 = _1088;
    float _1174 = in.m_83.x;
    float _1176 = in.m_83.y;
    float _1178 = in.m_83.z;
    float _1180 = _1172;
    if (_946)
    {
        float _1182 = _1018 ? as_type<float>(_1162) : _922;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1154, _1050, -0.5);
    bool _1188 = _694 != 0.0;
    bool _1190 = isnan(_694);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    float _1198 = -_1104;
    float _1200 = _1198 + 1.0;
    float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1204 = _692 == 0.0;
    bool _1206 = !_1196;
    bool _1208 = _1204 && _1206;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1132);
    if (_964)
    {
        _1140 = _908;
    }
    float _1212 = _1140;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1216 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1052);
    bool _1218 = _696 == 0.0;
    bool _1220 = _1218 && _1208;
    float _1222 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1214);
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1228 = _1224;
    float _1230 = _1212;
    if (_982)
    {
        float _1232 = _950 ? as_type<float>(_1078) : _922;
        _1038 = _1232;
    }
    float _1234 = _1038;
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1238 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[88].z, _952);
    float _1240 = -_1226;
    float _1242 = fma(_1224, 2.0, _1240);
    if (!_964)
    {
        _1228 = _914;
    }
    float _1244 = _1228;
    float _1246 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1248 = _1244;
    if (_964)
    {
        _1248 = _900;
    }
    float _1250 = _1248;
    float _1252 = -_164;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    float _1256 = _1250;
    if (!_964)
    {
        _1142 = _914;
    }
    float _1258 = _1142;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = _1258;
    float _1264 = _1174;
    if (_1220)
    {
        _1230 = _1174;
    }
    float _1266 = _1230;
    float _1268 = fma(_1246, _1166, -0.5);
    float _1270 = _1266;
    if (_964)
    {
        _1040 = _900;
    }
    float _1272 = _1040;
    float _1274 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1210);
    float _1276 = _1272;
    if (!_964)
    {
        _1276 = _908;
    }
    float _1278 = _1276;
    float _1280 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].w, _960);
    if (_1220)
    {
        _1256 = _1266;
    }
    float _1282 = _1256;
    float _1284 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1286 = _1282;
    if (!_1220)
    {
        _1270 = _1174;
    }
    float _1288 = _1270;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_964)
    {
        _1262 = _900;
    }
    float _1292 = _1262;
    float _1294 = fma(_1284, _1184, -0.5);
    if (_1220)
    {
        _1042 = _1176;
    }
    float _1296 = _1042;
    float _1298 = _1296;
    if (!_1220)
    {
        float _1300 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1288);
        _1286 = _1300;
    }
    float _1302 = _1286;
    float _1304 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _966);
    float _1306 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1220)
    {
        _1264 = _1178;
    }
    float _1308 = _1264;
    float _1310 = _1308;
    if (!_1220)
    {
        float _1312 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1176);
        _1298 = _1312;
    }
    float _1314 = _1298;
    if (!_1220)
    {
        float _1316 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1178);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = fma(_1306, _1234, -0.5);
    float _1322 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1222);
    float _1324 = -_164;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1242);
    float _1328 = -_164;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1170);
    float _1332 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1238);
    float _1334 = fma(_1304, _1268, _1254);
    float _1336 = _934 * _1288;
    float _1338 = fma(_1322, _1294, _1326);
    float _1340 = fma(_1332, _1320, _1330);
    float _1342 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1344 = -_1336;
    float _1346 = fma(_930, _1178, _1344);
    float _1348 = _932 * _1178;
    float _1350 = fma(_1342, -2.0, _1290);
    float _1352 = _930 * _1176;
    float _1354 = -_1348;
    float _1356 = fma(_934, _1176, _1354);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1362 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1366 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1368 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1280);
    float _1370 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1350);
    float _1372 = fma(_1362, -2.0, _1360);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1376 = -_1352;
    float _1378 = fma(_932, _1288, _1376);
    float _1380 = -_1370;
    float _1382 = fma(_1368, _1150, _1380);
    float _1384 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1216);
    float _1386 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1372);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1390 = _894 + _1388;
    float _1392 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1346 * _936;
    float _1400 = _1356 * _936;
    float _1402 = _1378 * _936;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _912 + _1404;
    float _1408 = _1390 * _1390;
    out.m_85.x = _1392;
    out.m_85.y = _1394;
    out.m_85.z = _1396;
    out.m_85.w = _1366;
    float _1410 = -_1386;
    float _1412 = fma(_1384, _1186, _1410);
    float _1414 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = fma(_1406, _1406, _1408);
    float _1418 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1420 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1424 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1428 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    float _1430 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1418);
    float _1432 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1434 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1422);
    float _1436 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1426);
    float _1438 = _1382 + 0.5;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1442 = _918 + _1440;
    float _1444 = _1136 + 0.5;
    float _1446 = _1334 + 0.5;
    float _1448 = _1338 + 0.5;
    float _1450 = fma(_1442, _1442, _1416);
    float _1452 = _1412 + 0.5;
    float _1454 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1428);
    float _1456 = _1340 + 0.5;
    out.m_87.x = _1446;
    out.m_87.y = _1444;
    out.m_87.z = _1448;
    out.m_87.w = _1438;
    float _1458 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    float _1460 = sqrt(_1450);
    out.m_89.x = _1456;
    out.m_89.y = _1452;
    out.m_91.x = _734;
    float _1462 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1424);
    float _1464 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    float _1466 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1436);
    float _1468 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1432);
    float _1470 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1462);
    bool _1472 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1474 = isnan(_1460);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1480 = _1476 || _1478;
    out.m_93.x = _1454;
    out.m_93.y = _1458;
    out.m_93.z = _1468;
    out.m_95.x = _1464;
    out.m_95.y = _1470;
    out.m_95.z = _1466;
    float _1482 = _1434;
    float _1484 = _1430;
    if (!_1480)
    {
        _1482 = 1.0;
    }
    float _1486 = _1482;
    out.m_97.x = _878;
    out.m_97.y = _880;
    out.m_97.z = _882;
    bool _1488 = !_1480;
    float _1490 = _1486;
    if (!_1488)
    {
        bool _1492 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1494 = isnan(_1460);
        bool _1496 = _1492 || _1494;
        bool _1498 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1500 = _1496 || _1498;
        if (!_1500)
        {
            float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1504 = _1460 + _1502;
            float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1508 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1506;
            float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1512 = _1510 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1514 = 1.0 / _1508;
            float _1516 = _1504 * _1514;
            float _1518 = fma(_1516, _1512, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1490 = _1518;
            _1520 = true;
        }
        else
        {
            bool _1522 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1524 = isnan(_1460);
            bool _1526 = _1522 || _1524;
            bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1530 = _1526 || _1528;
            if (!_1530)
            {
                float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1534 = _1460 + _1532;
                float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1538 = _1536 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1542 = _1540 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1544 = 1.0 / _1538;
                float _1546 = _1534 * _1544;
                float _1548 = fma(_1546, _1542, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1490 = _1548;
                _1520 = true;
            }
            else
            {
                _1490 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1520 = false;
    float _1550 = _1490;
    float _1552 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1554 = _894 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1558 = _912 + _1556;
    float _1560 = fma(_1554, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1564 = _918 + _1562;
    float _1566 = fma(_1558, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1568 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1572 = _1560 + _1570;
    float _1574 = fma(_1564, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1578 = _1566 + _1576;
    float _1580 = _1572 * _1572;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _1574 + _1582;
    float _1586 = fma(_1578, _1578, _1580);
    float _1588 = fma(_1584, _1584, _1586);
    float _1590 = rsqrt(_1588);
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1594 = _1578 * _1592;
    float _1596 = _1584 * _1592;
    float _1598 = _1594 * _1594;
    float _1600 = _1596 * _1596;
    float _1602 = _1598 + _1600;
    float _1604 = sqrt(_1602);
    bool _1606 = _1604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1610 = _1604 + _1608;
    float _1612 = _1318;
    float _1614 = _1602;
    float _1616 = _1610;
    float _1618 = _1572;
    float _1620 = _1594;
    if (_1606)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1622;
    }
    float _1624 = _1612;
    if (_1606)
    {
        float _1626 = rsqrt(_1602);
        _1614 = _1626;
    }
    float _1628 = _1614;
    float _1630 = _1628;
    if (_1606)
    {
        float _1632 = _1610 * _1624;
        _1616 = _1632;
    }
    float _1634 = _1616;
    if (_1606)
    {
        float _1636 = _1634 * 0.15915493667125701904296875;
        _1484 = _1636;
    }
    float _1638 = _1484;
    float _1640 = _1584;
    float _1642 = _1638;
    if (_1606)
    {
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1652 = precise::max(0.0, _1650);
    float _1654 = _1624;
    float _1656 = _1652;
    if (_1606)
    {
        float _1658 = _1638 * 6.283185482025146484375;
        float _1660 = cos(_1658);
        _1654 = _1660;
    }
    float _1662 = _1654;
    float _1664 = -_1592;
    float _1666 = -_1652;
    float _1668 = fma(_1572, _1664, _1666);
    if (_1606)
    {
        float _1670 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1670;
    }
    float _1672 = _1618;
    float _1674 = _1648;
    float _1676 = _1672;
    if (_1606)
    {
        float _1678 = fma(_1648, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1680;
    if (!_1606)
    {
        _1676 = _1596;
    }
    float _1684 = _1676;
    float _1686 = _1684;
    float _1688 = _1662;
    if (_1606)
    {
        float _1690 = _1662 + (-1.0);
        _1656 = _1690;
    }
    float _1692 = _1656;
    if (_1606)
    {
        float _1694 = _1628 * _1680;
        _1044 = _1694;
    }
    float _1696 = _1044;
    if (!_1606)
    {
        _1682 = _1668;
    }
    float _1698 = _1682;
    float _1700 = _1698;
    if (_1606)
    {
        float _1702 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1702;
    }
    float _1704 = _1642;
    if (_1606)
    {
        float _1706 = _1594 * _1696;
        _1620 = _1706;
    }
    float _1708 = _1620;
    float _1710 = sqrt(_1588);
    if (!_1606)
    {
        _1630 = _1598;
    }
    float _1712 = _1630;
    float _1714 = _1712;
    if (_1606)
    {
        float _1716 = fma(_1668, _1662, _1704);
        _1700 = _1716;
    }
    float _1718 = _1700;
    if (_1606)
    {
        float _1720 = _1596 * _1696;
        _1686 = _1720;
    }
    float _1722 = _1686;
    if (_1606)
    {
        float _1724 = _1708 * _1708;
        _1714 = _1724;
    }
    float _1726 = _1714;
    if (!_1606)
    {
        _1688 = _1600;
    }
    float _1728 = _1688;
    float _1730 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1732 = _1728;
    if (_1606)
    {
        float _1734 = _1722 * _1722;
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = fma(_1718, _1718, _1726);
    float _1740 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1730);
    float _1742 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1744 = _1738 + _1736;
    float _1746 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1748 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1742);
    float _1750 = rsqrt(_1744);
    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1754 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1752);
    float _1756 = precise::clamp(_1754, 0.0, 1.0);
    float _1758 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1740);
    float _1760 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1762 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1746);
    float _1764 = -_1756;
    float _1766 = _1764 + 1.0;
    float _1768 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1770 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1760);
    float _1772 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1762);
    float _1774 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1776 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1778 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1770);
    float _1780 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1782 = abs(_1766);
    float _1784 = log2(_1782);
    float _1786 = -_1776;
    float _1788 = fma(_1786, _1568, 1.0);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1792 = _1750 * _1708;
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1796 = _1750 * _1718;
    float _1798 = _1750 * _1722;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1794);
    float _1804 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = log2(_1788);
    float _1808 = -_1800;
    float _1810 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1808);
    float _1812 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1802);
    float _1814 = -_1798;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1810);
    float _1818 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1812);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1824 = fma(_1816, -0.5, 0.5);
    float _1826 = 1.0 / _1818;
    float _1828 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1822);
    float _1832 = fma(_1816, 0.5, 0.5);
    float _1834 = _1796 + 1.0;
    float _1836 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1828);
    float _1838 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1830);
    float _1840 = exp2(_1820);
    float _1842 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1836);
    float _1844 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1838);
    float _1846 = _1806 * 0.693147182464599609375;
    float _1848 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1842);
    float _1850 = sqrt(_1824);
    float _1852 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = _1844 * _1826;
    float _1856 = _1848 * _1826;
    float _1858 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1860 = fma(_1832, _1852, -0.212114393711090087890625);
    float _1862 = fma(_1854, 0.5, 0.5);
    float _1864 = fma(_1856, -0.5, 0.5);
    float _1866 = -_1796;
    float _1868 = fma(_1840, _1834, _1866);
    float _1870 = fma(_1832, _1860, 1.570728778839111328125);
    float _1872 = fma(_1868, 0.5, 0.5);
    float _1874 = _1850 * 0.636619746685028076171875;
    float3 _5473 = float3(_1862, _1864, _1858);
    float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5473, float3(0.0), isnan(_5473)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5473, float3(0.0), isnan(_5473)), level(0.0)).x;
    float3 _5484 = float3(_1862, _1864, _1858);
    float4 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5484, float3(0.0), isnan(_5484)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5484, float3(0.0), isnan(_5484)), level(0.0)).xyzw;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1879.w;
    float _1889 = -_1870;
    float _1891 = fma(_1874, _1889, 1.0);
    float2 _5505 = float2(_1891, _1872);
    float3 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5505, float2(0.0), isnan(_5505)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5505, float2(0.0), isnan(_5505)), level(0.0)).xyz;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1903 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1905 = in.m_99.x;
    float _1907 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1909 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1901);
    float _1911 = -_884;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1909);
    float _1917 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1919 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1921 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1923 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1917);
    float _1925 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1927 = 1.0 / _1921;
    float _1929 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    out.m_101.x = _794;
    out.m_101.y = _978;
    out.m_101.z = _756;
    float _1931 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1925);
    float _1933 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_103.x = _1566;
    out.m_103.y = _1560;
    out.m_103.z = _1574;
    float _1935 = _1933 + _1921;
    out.gl_Position.x = _1844;
    out.gl_Position.y = _1848;
    out.gl_Position.z = _1931;
    out.gl_Position.w = _1818;
    float _1937 = _1935 * _1927;
    float _1939 = _1937 * 0.5;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1943 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1941);
    bool _1945 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(0.5);
    bool _1953 = _1949 || _1951;
    float _1955 = 1.0 / _1943;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1955 * _1957;
    float _1961 = abs(_1959);
    float _1963 = log2(_1961);
    float _1965 = _1804;
    float _1967 = _1818;
    float _1969 = _1844;
    float _1971 = _1848;
    if (!_1953)
    {
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = _1959 + _1973;
        _1965 = _1975;
    }
    float _1977 = _1965;
    float _1979 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1981 = exp2(_1979);
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = _1981;
    if (!_1953)
    {
        _1987 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1989 = _1987;
    float _1991 = fma(_1985, -2.0, 3.0);
    float _1993 = _1985 * _1985;
    float _1995 = _1989;
    if (!_1953)
    {
        float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1999 = _1989 + _1997;
        _1995 = _1999;
    }
    float _2001 = _1995;
    float _2003 = _1993 * _1991;
    bool _2005 = _1959 <= 8000.0;
    bool _2007 = isnan(_1959);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan(8000.0);
    bool _2013 = _2009 || _2011;
    float _2015 = float(_2013);
    float _2017 = _2001;
    if (!_1953)
    {
        float _2019 = 1.0 / _2001;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = -_2003;
    float _2025 = _2023 + 1.0;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2003);
    float _2029 = exp2(_1903);
    float _2031 = _2015 * _2027;
    float _2033 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2035 = _1913 * _2033;
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = _1818 * 0.5;
    float _2041 = _1931 + _1818;
    float _2043 = -_2037;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2047 = _1844 + _1818;
    float _2049 = fma(_1848, -0.5, _2039);
    float _2051 = -_2029;
    float _2053 = _2051 + 1.0;
    float _2055 = _2045 * _1905;
    float _2057 = _2045;
    if (_1953)
    {
        _2057 = 1.0;
    }
    float _2059 = _2057;
    float _2061 = _2059;
    if (!_1953)
    {
        float _2063 = _1977 * _2021;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2061 = _2065;
    }
    float _2067 = _2061;
    float _2069 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2071 = _2041 * 0.5;
    float _2073 = _2047 * 0.5;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2077 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2079 = isnan(_1710);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2085 = _2081 || _2083;
    out.m_105.x = _2073;
    out.m_105.y = _2049;
    out.m_105.z = _2071;
    out.m_105.w = _1818;
    out.m_107.x = _2075;
    if (!_2085)
    {
        _1967 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2087 = _1967;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2085)
    {
        _1969 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2093 = _1969;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2085)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2099 = _1971;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2085)
    {
        _812 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2105 = _812;
    float _2107 = _2105;
    float _2109 = _2105;
    if (!_2085)
    {
        _1046 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2111 = _1046;
    float _2113 = _2069 * _1876;
    float _2115 = -_2069;
    float _2117 = _2115 + 1.0;
    float _2119 = _1887 * _2113;
    float _2121 = _1887 * _2117;
    float _2123 = _1899 * _2113;
    float _2125 = fma(_1895, _2119, _1881);
    float _2127 = fma(_1897, _2119, _1883);
    float _2129 = _2119;
    float _2131 = _2111;
    float _2133 = _2111;
    if (!_2085)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2135 = _2129;
    float _2137 = fma(_1887, _2123, _1885);
    float _2139 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_109.x = _2125;
    out.m_109.y = _2127;
    out.m_109.z = _2137;
    out.m_109.w = _2121;
    bool _2141 = !_2085;
    float _2143 = _2135;
    float _2145 = _2135;
    if (!_2141)
    {
        bool _2147 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2149 = isnan(_1710);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2159 = _1710 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2169 = 1.0 / _2163;
            float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2187 = _2159 * _2169;
            float _2189 = precise::clamp(_2187, 0.0, 1.0);
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2195 = fma(_2189, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2189, _2193, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2199 = fma(_2189, _2173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2201 = fma(_2189, _2177, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2203 = fma(_2189, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2205 = fma(_2189, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2097 = _2199;
            _2133 = _2203;
            _2091 = _2195;
            _2109 = _2201;
            _2103 = _2197;
            _2145 = _2205;
            _2207 = true;
        }
        else
        {
            bool _2209 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2211 = isnan(_1710);
            bool _2213 = _2209 || _2211;
            bool _2215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2217 = _2213 || _2215;
            if (!_2217)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2219 = _2089;
            _2091 = _2219;
            if (!_2217)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2221 = _2095;
            _2097 = _2221;
            if (!_2217)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2223 = _2101;
            _2103 = _2223;
            if (!_2217)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2225 = _2107;
            _2109 = _2225;
            if (!_2217)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2227 = _2131;
            _2133 = _2227;
            if (!_2217)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2229 = _2143;
            bool _2231 = !_2217;
            _2145 = _2229;
            if (!_2231)
            {
                bool _2233 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2235 = isnan(_1710);
                bool _2237 = _2233 || _2235;
                bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2241 = _2237 || _2239;
                if (!_2241)
                {
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2245 = _1710 + _2243;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2255 = 1.0 / _2249;
                    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2273 = _2245 * _2255;
                    float _2275 = precise::clamp(_2273, 0.0, 1.0);
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2281 = fma(_2275, _2253, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2275, _2279, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2285 = fma(_2275, _2259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2287 = fma(_2275, _2263, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2289 = fma(_2275, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2291 = fma(_2275, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2097 = _2285;
                    _2133 = _2289;
                    _2091 = _2281;
                    _2109 = _2287;
                    _2103 = _2283;
                    _2145 = _2291;
                    _2207 = true;
                }
                else
                {
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2207 = false;
    float _2293 = _2097;
    float _2295 = _2133;
    float _2297 = _2091;
    float _2299 = _2109;
    float _2301 = _2103;
    float _2303 = _2145;
    float _2305 = fma(_1458, -0.5, 0.5);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2293;
    float _2311 = _2309 + _2295;
    float _2313 = _2139 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2315 = -_2297;
    float _2317 = _2315 + _2299;
    float _2319 = fma(_2307, _2311, _2293);
    out.m_111.x = 0.0;
    float _2321 = -_2301;
    float _2323 = _2321 + _2303;
    float _2325 = fma(_2307, _2317, _2297);
    float _2327 = _2319 * 0.586610972881317138671875;
    out.m_53.x = _2313;
    bool _2329 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2331 = fma(_2307, _2323, _2301);
    float _2333 = fma(_2325, 0.298911988735198974609375, _2327);
    bool _2335 = _2067 > 0.0;
    bool _2337 = isnan(_2067);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.0);
    bool _2343 = _2339 || _2341;
    float _2345 = fma(_2331, 0.114477999508380889892578125, _2333);
    float _2347 = -_2345;
    float _2349 = _2325 + _2347;
    float _2351 = -_2345;
    float _2353 = _2319 + _2351;
    float _2355 = -_2345;
    float _2357 = _2331 + _2355;
    float _2359 = fma(_2349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    float _2361 = fma(_2353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    float _2363 = fma(_2357, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    bool _2365 = !_2329;
    if (!_2365)
    {
        float _2367 = -_1560;
        float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2371 = -_1566;
        float _2373 = _2371 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2375 = -_1574;
        float _2377 = _2375 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2379 = _2369 * _2369;
        float _2381 = fma(_2373, _2373, _2379);
        float _2383 = fma(_2377, _2377, _2381);
        float _2385 = sqrt(_2383);
        float _2387 = rsqrt(_2383);
        float _2389 = -_2385;
        float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2393 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2395 = precise::clamp(_2393, 0.0, 1.0);
        float _2397 = _2373 * _2387;
        float _2399 = _2369 * _2387;
        float _2401 = abs(_2395);
        float _2403 = log2(_2401);
        float _2405 = _2377 * _2387;
        float _2407 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2409 = _1458 * _2399;
        float _2411 = -_2399;
        float _2413 = -_2407;
        float _2415 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2413);
        float _2417 = fma(_1454, _2397, _2409);
        float _2419 = -_2405;
        float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2415);
        float _2423 = fma(_1468, _2405, _2417);
        float _2425 = precise::clamp(_2423, 0.0, 1.0);
        float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2429 = _2421 + _2427;
        float _2431 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2433 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2435 = precise::clamp(_2433, 0.0, 1.0);
        float _2437 = exp2(_2431);
        float _2439 = _2437 * _2435;
        float _2441 = _2425 * _2439;
        float _2443 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2447 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _2443;
        out.m_111.y = _2445;
        out.m_111.z = _2447;
    }
    out.m_79.x = _2359;
    out.m_79.y = _2361;
    out.m_79.z = _2363;
    if (_2343)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2449;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2207 = false;
    bool _1520 = false;
    bool _600 = false;
    bool _496 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2506 = as_type<float>(_146);
        out.gl_Position.z = _2506;
    }
    if (!_134)
    {
        return out;
    }
    float _150 = in.m_55.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_53.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2574 = as_type<float>(_182);
        out.gl_Position.z = _2574;
    }
    if (_176)
    {
        return out;
    }
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _186 = !_184;
    float _204;
    if (!_186)
    {
        float _188 = in.m_57.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        float _208 = float(_130);
        float _210 = 1.0 / _208;
        float _212 = _164 * _210;
        _204 = _212;
    }
    _206 = false;
    float _214 = _204;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _214 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _214 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = 1.0 / _230;
    float _246 = 1.0 / _234;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _250 = 1.0 / _242;
    float _252 = _218 * _244;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _256 = _214 + _254;
    float _258 = 1.0 / _238;
    float _260 = _222 * _246;
    bool _262 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _264 = isnan(_214);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = _256 * _250;
    bool _280 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _282 = isnan(_214);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    bool _292 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_214);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = _290 * _276;
    float _306 = -_290;
    float _308 = _306 + 1.0;
    float _310 = _226 * _258;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_214);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = _302 * _308;
    float _338 = -_302;
    float _340 = _338 + 1.0;
    float _342 = fma(_314, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_318, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = fma(_322, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _348 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_214);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_334;
    float _362 = _360 + 1.0;
    float _364 = _334 * _340;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _378 = _358 * _362;
    float _380 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _382 = fma(_372, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _384 = fma(_376, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _342 * _378;
    float _388 = _344 * _378;
    float _390 = -_358;
    float _392 = _390 + 1.0;
    float _394 = in.m_59.x;
    float _396 = in.m_59.y;
    float _398 = in.m_59.z;
    float _400 = _346 * _378;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _402;
    float _406 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _408 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _414;
    float _418 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _420 = fma(_382, _364, _406);
    float _422 = fma(_404, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_380, _364, _408);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = fma(_412, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _432 = fma(_416, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _442 = fma(_384, _364, _418);
    float _444 = fma(_428, _278, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _446 = fma(_422, _336, _424);
    float _448 = fma(_436, _278, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_440, _278, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _452 = fma(_430, _336, _420);
    float _454 = fma(_432, _336, _442);
    float _456 = fma(_444, _304, _446);
    float _458 = fma(_448, _304, _452);
    float _460 = fma(_450, _304, _454);
    float _462 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].x, _456);
    float _464 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].y, _458);
    float _466 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].z, _460);
    float _468 = _462 * _394;
    float _470 = _464 * _396;
    float _472 = _466 * _398;
    bool _474 = !_248;
    float _476 = _310;
    float _494;
    if (!_474)
    {
        float _478 = in.m_57.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_130);
        float _500 = 1.0 / _498;
        float _502 = _164 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    bool _506 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_504);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _522 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_504);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _504 + _538;
    float _542 = -_516;
    float _544 = _542 + 1.0;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _520;
    float _550 = _532 * _544;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    float _556 = _536 * _548;
    float _558 = fma(_556, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = _558 * _550;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _570 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[116].x, _566);
    float _574 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _574;
    out.m_61.y = _570;
    out.m_61.z = _576;
    out.m_61.w = _578;
    bool _580 = !_546;
    float _598;
    if (!_580)
    {
        float _582 = in.m_57.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_130);
        float _604 = 1.0 / _602;
        float _606 = _164 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_50.x;
    float _612 = in.m_50.y;
    float _614 = in.m_50.z;
    float _616 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _618 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _620 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = in.m_63.x;
    float _624 = in.m_63.y;
    float _626 = in.m_63.z;
    float _628 = _616 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _630 = in.m_65.x;
    float _632 = in.m_65.y;
    float _634 = in.m_65.z;
    float _636 = in.m_67.x;
    float _638 = in.m_67.y;
    float _640 = in.m_67.z;
    float _642 = _612 * _624;
    float _644 = _612 * _632;
    float _646 = fma(_610, _622, _642);
    float _648 = _612 * _638;
    float _650 = fma(_610, _630, _644);
    float _652 = fma(_614, _626, _646);
    float _654 = fma(_610, _636, _648);
    float _656 = fma(_614, _634, _650);
    float _658 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = fma(_614, _640, _654);
    float _662 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _658 + _664;
    float _668 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _672 = _662 + _670;
    float _674 = _666 * _666;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _668 + _676;
    float _680 = fma(_672, _672, _674);
    float _682 = fma(_678, _678, _680);
    float _684 = sqrt(_682);
    float _686 = rsqrt(_682);
    float _688 = _684 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _690 = precise::min(_628, _688);
    float _692 = in.m_69.x;
    float _694 = in.m_69.y;
    float _696 = in.m_69.z;
    float _698 = _686 * _690;
    float _700 = _666 * _698;
    float _702 = _672 * _698;
    float _704 = _678 * _698;
    float _706 = -_700;
    float _708 = _666 + _706;
    float _710 = -_702;
    float _712 = _672 + _710;
    float _714 = -_704;
    float _716 = _678 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = sqrt(_722);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _694);
    float _728 = _686 * _724;
    float _730 = _618 * _728;
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _692);
    float _734 = _616 * _728;
    float _736 = _620 * _728;
    float _738 = _730 * _726;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _696);
    float _742 = _734 * _732;
    float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _746 = _736 * _740;
    float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _750 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _752 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _744);
    float _754 = -_704;
    float _756 = _668 + _754;
    float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _748);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _750);
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _752);
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _758);
    float _766 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _760);
    float _768 = _762 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _770 = _764 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _772 = _766 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _774 = _668 + _768;
    float _776 = _662 + _770;
    float _778 = _658 + _772;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _782 = _774 + _780;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _786 = _776 + _784;
    float _788 = _782 * _782;
    float _790 = fma(_786, _786, _788);
    float _792 = -_702;
    float _794 = _662 + _792;
    float _796 = sqrt(_790);
    float _798 = fma(_794, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _802 = floor(_798);
    bool _804 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = floor(_800);
    float _808 = _776;
    float _810 = _774;
    float _812 = _756;
    if (!_804)
    {
        _476 = _778;
    }
    float _814 = _476;
    bool _816 = !_804;
    float _818 = _814;
    if (!_816)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _796 + _822;
        float _826 = _778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = rsqrt(_790);
        float _830 = _824 * _820;
        float _832 = _830 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = sin(_838);
        float _842 = _836 + (-1.0);
        float _844 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = fma(_840, _826, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _848 = fma(_778, _836, _844);
        float _850 = _828 * _846;
        float _852 = fma(_786, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _854 = fma(_782, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _808 = _852;
        _810 = _854;
        _818 = _848;
    }
    float _856 = _808;
    float _858 = _810;
    float _860 = _818;
    float _862 = fma(_856, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = fma(_858, 6.2500002968590706586837768554688e-05, 0.5);
    float _866 = -_802;
    float _868 = _798 + _866;
    float _870 = -_806;
    float _872 = _800 + _870;
    float2 _3703 = float2(_862, _864);
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3703, float2(0.0), isnan(_3703)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3703, float2(0.0), isnan(_3703)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    float2 _3719 = float2(_868, _872);
    float _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3719, float2(0.0), isnan(_3719)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3719, float2(0.0), isnan(_3719)), level(0.0)).x;
    float _886 = in.m_57.w;
    float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _890 = in.m_71.y;
    float _892 = -_700;
    float _894 = _892 + _860;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _898 = _896 != 0;
    float _900 = in.m_57.y;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _904 = _902 != 0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _908 = in.m_57.x;
    float _910 = -_702;
    float _912 = _910 + _856;
    float _914 = in.m_57.z;
    float _916 = -_704;
    float _918 = _916 + _858;
    float _920 = in.m_73.w;
    float _922 = in.m_71.x;
    bool _924 = _886 > 0.5;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _930 = in.m_75.x;
    float _932 = in.m_75.y;
    float _934 = in.m_75.z;
    float _936 = in.m_75.w;
    float _938 = -_890;
    float _940 = _938 + 1.0;
    float _942 = 1.0 / _928;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _946 = _944 != 0;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _950 = _900 > 0.5;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _954 = _924 ? as_type<int>(_940) : as_type<int>(_890);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _958 = _950 ? as_type<int>(_940) : as_type<int>(_890);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _964 = _962 != 0;
    float _966 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[78].z, _956);
    float _968 = _898 ? as_type<float>(_958) : _890;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _974 = _972 != 0;
    out.m_77.w = _920;
    float _976 = -_700;
    float _978 = _658 + _976;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _982 = _980 != 0;
    out.m_79.w = _690;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _986 = _984 != 0;
    float _988 = _908 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _990;
    float _994 = _932 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _996 = _932 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _998 = _932 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1000 = -_970;
    float _1002 = fma(_988, 2.0, _1000);
    float _1004 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _994);
    float _1006 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _996);
    float _1008 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _998);
    float _1010 = _986 ? as_type<float>(_954) : _890;
    float _1012 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1016 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1008);
    bool _1018 = _914 > 0.5;
    float _1020 = _992 * _942;
    float _1022 = _888 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1026 = _608 + _1024;
    out.m_81.x = _1012;
    out.m_81.y = _1014;
    out.m_81.z = _1016;
    float _1028 = _890;
    bool _1030 = _974;
    float _1032 = _948;
    float _1034 = _1012;
    float _1036 = _1022;
    float _1038 = _922;
    float _1040 = _914;
    float _1042 = _900;
    float _1044 = _918;
    float _1046 = _978;
    if (_974)
    {
        float _1048 = _1018 ? _940 : _890;
        _1028 = _1048;
    }
    float _1050 = _1028;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1054 = fma(_1020, _1026, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1058 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1060 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1062 = isnan(_608);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    int _1072 = 0;
    if (_982)
    {
        float _1074 = -_922;
        float _1076 = _1074 + 1.0;
        _1072 = as_type<int>(_1076);
    }
    int _1078 = _1072;
    if (_904)
    {
        bool _1080 = _908 > 0.5;
        _1030 = _1080;
    }
    bool _1082 = _1030;
    float _1084 = fma(_1058, -2.0, _948);
    float _1086 = fma(_1022, _968, -0.5);
    float _1088 = _1086;
    if (!_904)
    {
        _1032 = _922;
    }
    float _1090 = _1032;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1094 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1096 = isnan(_608);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -_1070;
    float _1108 = _1106 + 1.0;
    float _1110 = _1090;
    if (_964)
    {
        _1034 = _908;
    }
    float _1112 = _1034;
    float _1114 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1092);
    float _1116 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1084);
    float _1118 = _1112;
    if (!_964)
    {
        _1118 = _914;
    }
    float _1120 = _1118;
    float _1122 = _1104 * _1108;
    float _1124 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1114);
    float _1126 = _906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1128 = as_type<int>(_1124);
    if (!_964)
    {
        _1036 = _900;
    }
    float _1130 = _1036;
    float _1132 = _1054 * _1122;
    float _1134 = -_1116;
    float _1136 = fma(_1124, _1086, _1134);
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1140 = _1130;
    float _1142 = _1132;
    if (_904)
    {
        float _1144 = -_922;
        float _1146 = _1144 + 1.0;
        _1128 = as_type<int>(_1146);
    }
    int _1148 = _1128;
    float _1150 = fma(_1010, _1126, -0.5);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1154 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1156 = as_type<int>(_1056);
    if (_946)
    {
        float _1158 = -_922;
        float _1160 = _1158 + 1.0;
        _1156 = as_type<int>(_1160);
    }
    int _1162 = _1156;
    if (_904)
    {
        float _1164 = _1082 ? as_type<float>(_1148) : _922;
        _1110 = _1164;
    }
    float _1166 = _1110;
    float _1168 = -_1152;
    float _1170 = fma(_1138, 2.0, _1168);
    if (!_946)
    {
        _1088 = _922;
    }
    float _1172 = _1088;
    float _1174 = in.m_83.x;
    float _1176 = in.m_83.y;
    float _1178 = in.m_83.z;
    float _1180 = _1172;
    if (_946)
    {
        float _1182 = _1018 ? as_type<float>(_1162) : _922;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1154, _1050, -0.5);
    bool _1188 = _694 != 0.0;
    bool _1190 = isnan(_694);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    float _1198 = -_1104;
    float _1200 = _1198 + 1.0;
    float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1204 = _692 == 0.0;
    bool _1206 = !_1196;
    bool _1208 = _1204 && _1206;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1132);
    if (_964)
    {
        _1140 = _908;
    }
    float _1212 = _1140;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1216 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1052);
    bool _1218 = _696 == 0.0;
    bool _1220 = _1218 && _1208;
    float _1222 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1214);
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1228 = _1224;
    float _1230 = _1212;
    if (_982)
    {
        float _1232 = _950 ? as_type<float>(_1078) : _922;
        _1038 = _1232;
    }
    float _1234 = _1038;
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1238 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[88].z, _952);
    float _1240 = -_1226;
    float _1242 = fma(_1224, 2.0, _1240);
    if (!_964)
    {
        _1228 = _914;
    }
    float _1244 = _1228;
    float _1246 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1248 = _1244;
    if (_964)
    {
        _1248 = _900;
    }
    float _1250 = _1248;
    float _1252 = -_164;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    float _1256 = _1250;
    if (!_964)
    {
        _1142 = _914;
    }
    float _1258 = _1142;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = _1258;
    float _1264 = _1174;
    if (_1220)
    {
        _1230 = _1174;
    }
    float _1266 = _1230;
    float _1268 = fma(_1246, _1166, -0.5);
    float _1270 = _1266;
    if (_964)
    {
        _1040 = _900;
    }
    float _1272 = _1040;
    float _1274 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1210);
    float _1276 = _1272;
    if (!_964)
    {
        _1276 = _908;
    }
    float _1278 = _1276;
    float _1280 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].w, _960);
    if (_1220)
    {
        _1256 = _1266;
    }
    float _1282 = _1256;
    float _1284 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1286 = _1282;
    if (!_1220)
    {
        _1270 = _1174;
    }
    float _1288 = _1270;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_964)
    {
        _1262 = _900;
    }
    float _1292 = _1262;
    float _1294 = fma(_1284, _1184, -0.5);
    if (_1220)
    {
        _1042 = _1176;
    }
    float _1296 = _1042;
    float _1298 = _1296;
    if (!_1220)
    {
        float _1300 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1288);
        _1286 = _1300;
    }
    float _1302 = _1286;
    float _1304 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _966);
    float _1306 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1220)
    {
        _1264 = _1178;
    }
    float _1308 = _1264;
    float _1310 = _1308;
    if (!_1220)
    {
        float _1312 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1176);
        _1298 = _1312;
    }
    float _1314 = _1298;
    if (!_1220)
    {
        float _1316 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1178);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = fma(_1306, _1234, -0.5);
    float _1322 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1222);
    float _1324 = -_164;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1242);
    float _1328 = -_164;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1170);
    float _1332 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1238);
    float _1334 = fma(_1304, _1268, _1254);
    float _1336 = _934 * _1288;
    float _1338 = fma(_1322, _1294, _1326);
    float _1340 = fma(_1332, _1320, _1330);
    float _1342 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1344 = -_1336;
    float _1346 = fma(_930, _1178, _1344);
    float _1348 = _932 * _1178;
    float _1350 = fma(_1342, -2.0, _1290);
    float _1352 = _930 * _1176;
    float _1354 = -_1348;
    float _1356 = fma(_934, _1176, _1354);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1362 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1366 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1368 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1280);
    float _1370 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1350);
    float _1372 = fma(_1362, -2.0, _1360);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1376 = -_1352;
    float _1378 = fma(_932, _1288, _1376);
    float _1380 = -_1370;
    float _1382 = fma(_1368, _1150, _1380);
    float _1384 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1216);
    float _1386 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1372);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1390 = _894 + _1388;
    float _1392 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1346 * _936;
    float _1400 = _1356 * _936;
    float _1402 = _1378 * _936;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _912 + _1404;
    float _1408 = _1390 * _1390;
    out.m_85.x = _1392;
    out.m_85.y = _1394;
    out.m_85.z = _1396;
    out.m_85.w = _1366;
    float _1410 = -_1386;
    float _1412 = fma(_1384, _1186, _1410);
    float _1414 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = fma(_1406, _1406, _1408);
    float _1418 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1420 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1424 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1428 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    float _1430 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1418);
    float _1432 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1434 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1422);
    float _1436 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1426);
    float _1438 = _1382 + 0.5;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1442 = _918 + _1440;
    float _1444 = _1136 + 0.5;
    float _1446 = _1334 + 0.5;
    float _1448 = _1338 + 0.5;
    float _1450 = fma(_1442, _1442, _1416);
    float _1452 = _1412 + 0.5;
    float _1454 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1428);
    float _1456 = _1340 + 0.5;
    out.m_87.x = _1446;
    out.m_87.y = _1444;
    out.m_87.z = _1448;
    out.m_87.w = _1438;
    float _1458 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    float _1460 = sqrt(_1450);
    out.m_89.x = _1456;
    out.m_89.y = _1452;
    out.m_91.x = _734;
    float _1462 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1424);
    float _1464 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    float _1466 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1436);
    float _1468 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1432);
    float _1470 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1462);
    bool _1472 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1474 = isnan(_1460);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1480 = _1476 || _1478;
    out.m_93.x = _1454;
    out.m_93.y = _1458;
    out.m_93.z = _1468;
    out.m_95.x = _1464;
    out.m_95.y = _1470;
    out.m_95.z = _1466;
    float _1482 = _1434;
    float _1484 = _1430;
    if (!_1480)
    {
        _1482 = 1.0;
    }
    float _1486 = _1482;
    out.m_97.x = _878;
    out.m_97.y = _880;
    out.m_97.z = _882;
    bool _1488 = !_1480;
    float _1490 = _1486;
    if (!_1488)
    {
        bool _1492 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1494 = isnan(_1460);
        bool _1496 = _1492 || _1494;
        bool _1498 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1500 = _1496 || _1498;
        if (!_1500)
        {
            float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1504 = _1460 + _1502;
            float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1508 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1506;
            float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1512 = _1510 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1514 = 1.0 / _1508;
            float _1516 = _1504 * _1514;
            float _1518 = fma(_1516, _1512, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1490 = _1518;
            _1520 = true;
        }
        else
        {
            bool _1522 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1524 = isnan(_1460);
            bool _1526 = _1522 || _1524;
            bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1530 = _1526 || _1528;
            if (!_1530)
            {
                float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1534 = _1460 + _1532;
                float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1538 = _1536 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1542 = _1540 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1544 = 1.0 / _1538;
                float _1546 = _1534 * _1544;
                float _1548 = fma(_1546, _1542, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1490 = _1548;
                _1520 = true;
            }
            else
            {
                _1490 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1520 = false;
    float _1550 = _1490;
    float _1552 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1554 = _894 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1558 = _912 + _1556;
    float _1560 = fma(_1554, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1564 = _918 + _1562;
    float _1566 = fma(_1558, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1568 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1572 = _1560 + _1570;
    float _1574 = fma(_1564, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1578 = _1566 + _1576;
    float _1580 = _1572 * _1572;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _1574 + _1582;
    float _1586 = fma(_1578, _1578, _1580);
    float _1588 = fma(_1584, _1584, _1586);
    float _1590 = rsqrt(_1588);
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1594 = _1578 * _1592;
    float _1596 = _1584 * _1592;
    float _1598 = _1594 * _1594;
    float _1600 = _1596 * _1596;
    float _1602 = _1598 + _1600;
    float _1604 = sqrt(_1602);
    bool _1606 = _1604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1610 = _1604 + _1608;
    float _1612 = _1318;
    float _1614 = _1602;
    float _1616 = _1610;
    float _1618 = _1572;
    float _1620 = _1594;
    if (_1606)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1622;
    }
    float _1624 = _1612;
    if (_1606)
    {
        float _1626 = rsqrt(_1602);
        _1614 = _1626;
    }
    float _1628 = _1614;
    float _1630 = _1628;
    if (_1606)
    {
        float _1632 = _1610 * _1624;
        _1616 = _1632;
    }
    float _1634 = _1616;
    if (_1606)
    {
        float _1636 = _1634 * 0.15915493667125701904296875;
        _1484 = _1636;
    }
    float _1638 = _1484;
    float _1640 = _1584;
    float _1642 = _1638;
    if (_1606)
    {
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1652 = precise::max(0.0, _1650);
    float _1654 = _1624;
    float _1656 = _1652;
    if (_1606)
    {
        float _1658 = _1638 * 6.283185482025146484375;
        float _1660 = cos(_1658);
        _1654 = _1660;
    }
    float _1662 = _1654;
    float _1664 = -_1592;
    float _1666 = -_1652;
    float _1668 = fma(_1572, _1664, _1666);
    if (_1606)
    {
        float _1670 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1670;
    }
    float _1672 = _1618;
    float _1674 = _1648;
    float _1676 = _1672;
    if (_1606)
    {
        float _1678 = fma(_1648, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1680;
    if (!_1606)
    {
        _1676 = _1596;
    }
    float _1684 = _1676;
    float _1686 = _1684;
    float _1688 = _1662;
    if (_1606)
    {
        float _1690 = _1662 + (-1.0);
        _1656 = _1690;
    }
    float _1692 = _1656;
    if (_1606)
    {
        float _1694 = _1628 * _1680;
        _1044 = _1694;
    }
    float _1696 = _1044;
    if (!_1606)
    {
        _1682 = _1668;
    }
    float _1698 = _1682;
    float _1700 = _1698;
    if (_1606)
    {
        float _1702 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1702;
    }
    float _1704 = _1642;
    if (_1606)
    {
        float _1706 = _1594 * _1696;
        _1620 = _1706;
    }
    float _1708 = _1620;
    float _1710 = sqrt(_1588);
    if (!_1606)
    {
        _1630 = _1598;
    }
    float _1712 = _1630;
    float _1714 = _1712;
    if (_1606)
    {
        float _1716 = fma(_1668, _1662, _1704);
        _1700 = _1716;
    }
    float _1718 = _1700;
    if (_1606)
    {
        float _1720 = _1596 * _1696;
        _1686 = _1720;
    }
    float _1722 = _1686;
    if (_1606)
    {
        float _1724 = _1708 * _1708;
        _1714 = _1724;
    }
    float _1726 = _1714;
    if (!_1606)
    {
        _1688 = _1600;
    }
    float _1728 = _1688;
    float _1730 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1732 = _1728;
    if (_1606)
    {
        float _1734 = _1722 * _1722;
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = fma(_1718, _1718, _1726);
    float _1740 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1730);
    float _1742 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1744 = _1738 + _1736;
    float _1746 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1748 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1742);
    float _1750 = rsqrt(_1744);
    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1754 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1752);
    float _1756 = precise::clamp(_1754, 0.0, 1.0);
    float _1758 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1740);
    float _1760 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1762 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1746);
    float _1764 = -_1756;
    float _1766 = _1764 + 1.0;
    float _1768 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1770 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1760);
    float _1772 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1762);
    float _1774 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1776 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1778 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1770);
    float _1780 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1782 = abs(_1766);
    float _1784 = log2(_1782);
    float _1786 = -_1776;
    float _1788 = fma(_1786, _1568, 1.0);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1792 = _1750 * _1708;
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1796 = _1750 * _1718;
    float _1798 = _1750 * _1722;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1794);
    float _1804 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = log2(_1788);
    float _1808 = -_1800;
    float _1810 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1808);
    float _1812 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1802);
    float _1814 = -_1798;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1810);
    float _1818 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1812);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1824 = fma(_1816, -0.5, 0.5);
    float _1826 = 1.0 / _1818;
    float _1828 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1822);
    float _1832 = fma(_1816, 0.5, 0.5);
    float _1834 = _1796 + 1.0;
    float _1836 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1828);
    float _1838 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1830);
    float _1840 = exp2(_1820);
    float _1842 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1836);
    float _1844 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1838);
    float _1846 = _1806 * 0.693147182464599609375;
    float _1848 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1842);
    float _1850 = sqrt(_1824);
    float _1852 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = _1844 * _1826;
    float _1856 = _1848 * _1826;
    float _1858 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1860 = fma(_1832, _1852, -0.212114393711090087890625);
    float _1862 = fma(_1854, 0.5, 0.5);
    float _1864 = fma(_1856, -0.5, 0.5);
    float _1866 = -_1796;
    float _1868 = fma(_1840, _1834, _1866);
    float _1870 = fma(_1832, _1860, 1.570728778839111328125);
    float _1872 = fma(_1868, 0.5, 0.5);
    float _1874 = _1850 * 0.636619746685028076171875;
    float3 _5473 = float3(_1862, _1864, _1858);
    float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5473, float3(0.0), isnan(_5473)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5473, float3(0.0), isnan(_5473)), level(0.0)).x;
    float3 _5484 = float3(_1862, _1864, _1858);
    float4 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5484, float3(0.0), isnan(_5484)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5484, float3(0.0), isnan(_5484)), level(0.0)).xyzw;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1879.w;
    float _1889 = -_1870;
    float _1891 = fma(_1874, _1889, 1.0);
    float2 _5505 = float2(_1891, _1872);
    float3 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5505, float2(0.0), isnan(_5505)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5505, float2(0.0), isnan(_5505)), level(0.0)).xyz;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1903 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1905 = in.m_99.x;
    float _1907 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1909 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1901);
    float _1911 = -_884;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1909);
    float _1917 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1919 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1921 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1923 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1917);
    float _1925 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1927 = 1.0 / _1921;
    float _1929 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    out.m_101.x = _794;
    out.m_101.y = _978;
    out.m_101.z = _756;
    float _1931 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1925);
    float _1933 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_103.x = _1566;
    out.m_103.y = _1560;
    out.m_103.z = _1574;
    float _1935 = _1933 + _1921;
    out.gl_Position.x = _1844;
    out.gl_Position.y = _1848;
    out.gl_Position.z = _1931;
    out.gl_Position.w = _1818;
    float _1937 = _1935 * _1927;
    float _1939 = _1937 * 0.5;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1943 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1941);
    bool _1945 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(0.5);
    bool _1953 = _1949 || _1951;
    float _1955 = 1.0 / _1943;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1955 * _1957;
    float _1961 = abs(_1959);
    float _1963 = log2(_1961);
    float _1965 = _1804;
    float _1967 = _1818;
    float _1969 = _1844;
    float _1971 = _1848;
    if (!_1953)
    {
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = _1959 + _1973;
        _1965 = _1975;
    }
    float _1977 = _1965;
    float _1979 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1981 = exp2(_1979);
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = _1981;
    if (!_1953)
    {
        _1987 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1989 = _1987;
    float _1991 = fma(_1985, -2.0, 3.0);
    float _1993 = _1985 * _1985;
    float _1995 = _1989;
    if (!_1953)
    {
        float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1999 = _1989 + _1997;
        _1995 = _1999;
    }
    float _2001 = _1995;
    float _2003 = _1993 * _1991;
    bool _2005 = _1959 <= 8000.0;
    bool _2007 = isnan(_1959);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan(8000.0);
    bool _2013 = _2009 || _2011;
    float _2015 = float(_2013);
    float _2017 = _2001;
    if (!_1953)
    {
        float _2019 = 1.0 / _2001;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = -_2003;
    float _2025 = _2023 + 1.0;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2003);
    float _2029 = exp2(_1903);
    float _2031 = _2015 * _2027;
    float _2033 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2035 = _1913 * _2033;
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = _1818 * 0.5;
    float _2041 = _1931 + _1818;
    float _2043 = -_2037;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2047 = _1844 + _1818;
    float _2049 = fma(_1848, -0.5, _2039);
    float _2051 = -_2029;
    float _2053 = _2051 + 1.0;
    float _2055 = _2045 * _1905;
    float _2057 = _2045;
    if (_1953)
    {
        _2057 = 1.0;
    }
    float _2059 = _2057;
    float _2061 = _2059;
    if (!_1953)
    {
        float _2063 = _1977 * _2021;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2061 = _2065;
    }
    float _2067 = _2061;
    float _2069 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2071 = _2041 * 0.5;
    float _2073 = _2047 * 0.5;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2077 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2079 = isnan(_1710);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2085 = _2081 || _2083;
    out.m_105.x = _2073;
    out.m_105.y = _2049;
    out.m_105.z = _2071;
    out.m_105.w = _1818;
    out.m_107.x = _2075;
    if (!_2085)
    {
        _1967 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2087 = _1967;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2085)
    {
        _1969 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2093 = _1969;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2085)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2099 = _1971;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2085)
    {
        _812 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2105 = _812;
    float _2107 = _2105;
    float _2109 = _2105;
    if (!_2085)
    {
        _1046 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2111 = _1046;
    float _2113 = _2069 * _1876;
    float _2115 = -_2069;
    float _2117 = _2115 + 1.0;
    float _2119 = _1887 * _2113;
    float _2121 = _1887 * _2117;
    float _2123 = _1899 * _2113;
    float _2125 = fma(_1895, _2119, _1881);
    float _2127 = fma(_1897, _2119, _1883);
    float _2129 = _2119;
    float _2131 = _2111;
    float _2133 = _2111;
    if (!_2085)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2135 = _2129;
    float _2137 = fma(_1887, _2123, _1885);
    float _2139 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_109.x = _2125;
    out.m_109.y = _2127;
    out.m_109.z = _2137;
    out.m_109.w = _2121;
    bool _2141 = !_2085;
    float _2143 = _2135;
    float _2145 = _2135;
    if (!_2141)
    {
        bool _2147 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2149 = isnan(_1710);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2159 = _1710 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2169 = 1.0 / _2163;
            float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2187 = _2159 * _2169;
            float _2189 = precise::clamp(_2187, 0.0, 1.0);
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2195 = fma(_2189, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2189, _2193, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2199 = fma(_2189, _2173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2201 = fma(_2189, _2177, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2203 = fma(_2189, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2205 = fma(_2189, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2097 = _2199;
            _2133 = _2203;
            _2091 = _2195;
            _2109 = _2201;
            _2103 = _2197;
            _2145 = _2205;
            _2207 = true;
        }
        else
        {
            bool _2209 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2211 = isnan(_1710);
            bool _2213 = _2209 || _2211;
            bool _2215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2217 = _2213 || _2215;
            if (!_2217)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2219 = _2089;
            _2091 = _2219;
            if (!_2217)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2221 = _2095;
            _2097 = _2221;
            if (!_2217)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2223 = _2101;
            _2103 = _2223;
            if (!_2217)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2225 = _2107;
            _2109 = _2225;
            if (!_2217)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2227 = _2131;
            _2133 = _2227;
            if (!_2217)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2229 = _2143;
            bool _2231 = !_2217;
            _2145 = _2229;
            if (!_2231)
            {
                bool _2233 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2235 = isnan(_1710);
                bool _2237 = _2233 || _2235;
                bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2241 = _2237 || _2239;
                if (!_2241)
                {
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2245 = _1710 + _2243;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2255 = 1.0 / _2249;
                    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2273 = _2245 * _2255;
                    float _2275 = precise::clamp(_2273, 0.0, 1.0);
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2281 = fma(_2275, _2253, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2275, _2279, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2285 = fma(_2275, _2259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2287 = fma(_2275, _2263, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2289 = fma(_2275, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2291 = fma(_2275, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2097 = _2285;
                    _2133 = _2289;
                    _2091 = _2281;
                    _2109 = _2287;
                    _2103 = _2283;
                    _2145 = _2291;
                    _2207 = true;
                }
                else
                {
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2207 = false;
    float _2293 = _2097;
    float _2295 = _2133;
    float _2297 = _2091;
    float _2299 = _2109;
    float _2301 = _2103;
    float _2303 = _2145;
    float _2305 = fma(_1458, -0.5, 0.5);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2293;
    float _2311 = _2309 + _2295;
    float _2313 = _2139 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2315 = -_2297;
    float _2317 = _2315 + _2299;
    float _2319 = fma(_2307, _2311, _2293);
    out.m_111.x = 0.0;
    float _2321 = -_2301;
    float _2323 = _2321 + _2303;
    float _2325 = fma(_2307, _2317, _2297);
    float _2327 = _2319 * 0.586610972881317138671875;
    out.m_53.x = _2313;
    bool _2329 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2331 = fma(_2307, _2323, _2301);
    float _2333 = fma(_2325, 0.298911988735198974609375, _2327);
    bool _2335 = _2067 > 0.0;
    bool _2337 = isnan(_2067);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.0);
    bool _2343 = _2339 || _2341;
    float _2345 = fma(_2331, 0.114477999508380889892578125, _2333);
    float _2347 = -_2345;
    float _2349 = _2325 + _2347;
    float _2351 = -_2345;
    float _2353 = _2319 + _2351;
    float _2355 = -_2345;
    float _2357 = _2331 + _2355;
    float _2359 = fma(_2349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    float _2361 = fma(_2353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    float _2363 = fma(_2357, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    bool _2365 = !_2329;
    if (!_2365)
    {
        float _2367 = -_1560;
        float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2371 = -_1566;
        float _2373 = _2371 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2375 = -_1574;
        float _2377 = _2375 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2379 = _2369 * _2369;
        float _2381 = fma(_2373, _2373, _2379);
        float _2383 = fma(_2377, _2377, _2381);
        float _2385 = sqrt(_2383);
        float _2387 = rsqrt(_2383);
        float _2389 = -_2385;
        float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2393 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2395 = precise::clamp(_2393, 0.0, 1.0);
        float _2397 = _2373 * _2387;
        float _2399 = _2369 * _2387;
        float _2401 = abs(_2395);
        float _2403 = log2(_2401);
        float _2405 = _2377 * _2387;
        float _2407 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2409 = _1458 * _2399;
        float _2411 = -_2399;
        float _2413 = -_2407;
        float _2415 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2413);
        float _2417 = fma(_1454, _2397, _2409);
        float _2419 = -_2405;
        float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2415);
        float _2423 = fma(_1468, _2405, _2417);
        float _2425 = precise::clamp(_2423, 0.0, 1.0);
        float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2429 = _2421 + _2427;
        float _2431 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2433 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2435 = precise::clamp(_2433, 0.0, 1.0);
        float _2437 = exp2(_2431);
        float _2439 = _2437 * _2435;
        float _2441 = _2425 * _2439;
        float _2443 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2447 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _2443;
        out.m_111.y = _2445;
        out.m_111.z = _2447;
    }
    out.m_79.x = _2359;
    out.m_79.y = _2361;
    out.m_79.z = _2363;
    if (_2343)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2449;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2207 = false;
    bool _1520 = false;
    bool _600 = false;
    bool _496 = false;
    bool _206 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _125 = in.m_50.w;
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
        out.m_53.x = 0.0;
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
        float _2506 = as_type<float>(_146);
        out.gl_Position.z = _2506;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _150 = in.m_55.w;
    bool _152 = _150 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _154 = isnan(_150);
    bool _156 = _152 || _154;
    bool _158 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _160 = _156 || _158;
    float _162 = -_150;
    float _164 = _162 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _166 = 0.0;
    if (_160)
    {
        float _168 = float(_130);
        _166 = _168;
    }
    float _170 = _166;
    bool _172 = _164 >= _170;
    bool _174 = !_160;
    bool _176 = _172 || _174;
    if (_176)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _178 = _140;
    if (_176)
    {
        out.m_53.x = 0.0;
    }
    if (_176)
    {
        float _180 = _178 * 5.0;
        _148 = as_type<int>(_180);
    }
    int _182 = _148;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2574 = as_type<float>(_182);
        out.gl_Position.z = _2574;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _186 = !_184;
    float _204;
    if (!_186)
    {
        float _188 = in.m_57.x;
        float _190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _192 = _188 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _194 = fma(_192, (*spvDescriptorSet0.vp_c9)._m0[12].x, _164);
        float _196 = _194 * _190;
        float _198 = floor(_196);
        float _200 = -_198;
        float _202 = _196 + _200;
        _204 = _202;
        _206 = true;
    }
    else
    {
        float _208 = float(_130);
        float _210 = 1.0 / _208;
        float _212 = _164 * _210;
        _204 = _212;
    }
    _206 = false;
    float _214 = _204;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _214 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _222 = _214 + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _226 = _214 + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _228;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _234 = _232 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _238 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _242 = _240 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _244 = 1.0 / _230;
    float _246 = 1.0 / _234;
    bool _248 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _250 = 1.0 / _242;
    float _252 = _218 * _244;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _256 = _214 + _254;
    float _258 = 1.0 / _238;
    float _260 = _222 * _246;
    bool _262 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _264 = isnan(_214);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = -_272;
    float _276 = _274 + 1.0;
    float _278 = _256 * _250;
    bool _280 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _282 = isnan(_214);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    bool _292 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_214);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = _290 * _276;
    float _306 = -_290;
    float _308 = _306 + 1.0;
    float _310 = _226 * _258;
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _312;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _320;
    bool _324 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _326 = isnan(_214);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = _302 * _308;
    float _338 = -_302;
    float _340 = _338 + 1.0;
    float _342 = fma(_314, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _344 = fma(_318, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _346 = fma(_322, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _348 = _214 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _350 = isnan(_214);
    bool _352 = _348 || _350;
    bool _354 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _356 = _352 || _354;
    float _358 = float(_356);
    float _360 = -_334;
    float _362 = _360 + 1.0;
    float _364 = _334 * _340;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _378 = _358 * _362;
    float _380 = fma(_368, _260, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _382 = fma(_372, _260, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _384 = fma(_376, _260, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _386 = _342 * _378;
    float _388 = _344 * _378;
    float _390 = -_358;
    float _392 = _390 + 1.0;
    float _394 = in.m_59.x;
    float _396 = in.m_59.y;
    float _398 = in.m_59.z;
    float _400 = _346 * _378;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _404 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _402;
    float _406 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].y, _388);
    float _408 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].x, _386);
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _414;
    float _418 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _420 = fma(_382, _364, _406);
    float _422 = fma(_404, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _424 = fma(_380, _364, _408);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _430 = fma(_412, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _432 = fma(_416, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _442 = fma(_384, _364, _418);
    float _444 = fma(_428, _278, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _446 = fma(_422, _336, _424);
    float _448 = fma(_436, _278, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _450 = fma(_440, _278, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _452 = fma(_430, _336, _420);
    float _454 = fma(_432, _336, _442);
    float _456 = fma(_444, _304, _446);
    float _458 = fma(_448, _304, _452);
    float _460 = fma(_450, _304, _454);
    float _462 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].x, _456);
    float _464 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].y, _458);
    float _466 = fma(_272, (*spvDescriptorSet0.vp_c9)._m0[147].z, _460);
    float _468 = _462 * _394;
    float _470 = _464 * _396;
    float _472 = _466 * _398;
    bool _474 = !_248;
    float _476 = _310;
    float _494;
    if (!_474)
    {
        float _478 = in.m_57.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_130);
        float _500 = 1.0 / _498;
        float _502 = _164 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    bool _506 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _508 = isnan(_504);
    bool _510 = _506 || _508;
    bool _512 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _514 = _510 || _512;
    float _516 = float(_514);
    float _518 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _520 = _518 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _522 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _524 = isnan(_504);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _504 + _538;
    float _542 = -_516;
    float _544 = _542 + 1.0;
    bool _546 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _548 = 1.0 / _520;
    float _550 = _532 * _544;
    float _552 = -_532;
    float _554 = _552 + 1.0;
    float _556 = _536 * _548;
    float _558 = fma(_556, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _560 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _562 = _558 * _550;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[115].x, _562);
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _570 = _560 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _572 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[116].x, _566);
    float _574 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _578 = _572 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _574;
    out.m_61.y = _570;
    out.m_61.z = _576;
    out.m_61.w = _578;
    bool _580 = !_546;
    float _598;
    if (!_580)
    {
        float _582 = in.m_57.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_130);
        float _604 = 1.0 / _602;
        float _606 = _164 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = in.m_50.x;
    float _612 = in.m_50.y;
    float _614 = in.m_50.z;
    float _616 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _618 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _620 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _622 = in.m_63.x;
    float _624 = in.m_63.y;
    float _626 = in.m_63.z;
    float _628 = _616 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _630 = in.m_65.x;
    float _632 = in.m_65.y;
    float _634 = in.m_65.z;
    float _636 = in.m_67.x;
    float _638 = in.m_67.y;
    float _640 = in.m_67.z;
    float _642 = _612 * _624;
    float _644 = _612 * _632;
    float _646 = fma(_610, _622, _642);
    float _648 = _612 * _638;
    float _650 = fma(_610, _630, _644);
    float _652 = fma(_614, _626, _646);
    float _654 = fma(_610, _636, _648);
    float _656 = fma(_614, _634, _650);
    float _658 = _652 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _660 = fma(_614, _640, _654);
    float _662 = _656 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _664 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _666 = _658 + _664;
    float _668 = _660 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _672 = _662 + _670;
    float _674 = _666 * _666;
    float _676 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _678 = _668 + _676;
    float _680 = fma(_672, _672, _674);
    float _682 = fma(_678, _678, _680);
    float _684 = sqrt(_682);
    float _686 = rsqrt(_682);
    float _688 = _684 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _690 = precise::min(_628, _688);
    float _692 = in.m_69.x;
    float _694 = in.m_69.y;
    float _696 = in.m_69.z;
    float _698 = _686 * _690;
    float _700 = _666 * _698;
    float _702 = _672 * _698;
    float _704 = _678 * _698;
    float _706 = -_700;
    float _708 = _666 + _706;
    float _710 = -_702;
    float _712 = _672 + _710;
    float _714 = -_704;
    float _716 = _678 + _714;
    float _718 = _708 * _708;
    float _720 = fma(_712, _712, _718);
    float _722 = fma(_716, _716, _720);
    float _724 = sqrt(_722);
    float _726 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _694);
    float _728 = _686 * _724;
    float _730 = _618 * _728;
    float _732 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _692);
    float _734 = _616 * _728;
    float _736 = _620 * _728;
    float _738 = _730 * _726;
    float _740 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _696);
    float _742 = _734 * _732;
    float _744 = _738 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _746 = _736 * _740;
    float _748 = _738 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _750 = _738 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _752 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[26].x, _744);
    float _754 = -_704;
    float _756 = _668 + _754;
    float _758 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[24].x, _748);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c8)._m0[25].x, _750);
    float _762 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[26].z, _752);
    float _764 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[24].z, _758);
    float _766 = fma(_746, (*spvDescriptorSet0.vp_c8)._m0[25].z, _760);
    float _768 = _762 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _770 = _764 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _772 = _766 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _774 = _668 + _768;
    float _776 = _662 + _770;
    float _778 = _658 + _772;
    float _780 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _782 = _774 + _780;
    float _784 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _786 = _776 + _784;
    float _788 = _782 * _782;
    float _790 = fma(_786, _786, _788);
    float _792 = -_702;
    float _794 = _662 + _792;
    float _796 = sqrt(_790);
    float _798 = fma(_794, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _800 = fma(_756, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _802 = floor(_798);
    bool _804 = _796 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _806 = floor(_800);
    float _808 = _776;
    float _810 = _774;
    float _812 = _756;
    if (!_804)
    {
        _476 = _778;
    }
    float _814 = _476;
    bool _816 = !_804;
    float _818 = _814;
    if (!_816)
    {
        float _820 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _822 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _824 = _796 + _822;
        float _826 = _778 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _828 = rsqrt(_790);
        float _830 = _824 * _820;
        float _832 = _830 * 0.15915493667125701904296875;
        float _834 = _832 * 6.283185482025146484375;
        float _836 = cos(_834);
        float _838 = _832 * 6.283185482025146484375;
        float _840 = sin(_838);
        float _842 = _836 + (-1.0);
        float _844 = _842 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _846 = fma(_840, _826, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _848 = fma(_778, _836, _844);
        float _850 = _828 * _846;
        float _852 = fma(_786, _850, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _854 = fma(_782, _850, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _808 = _852;
        _810 = _854;
        _818 = _848;
    }
    float _856 = _808;
    float _858 = _810;
    float _860 = _818;
    float _862 = fma(_856, 6.2500002968590706586837768554688e-05, 0.5);
    float _864 = fma(_858, 6.2500002968590706586837768554688e-05, 0.5);
    float _866 = -_802;
    float _868 = _798 + _866;
    float _870 = -_806;
    float _872 = _800 + _870;
    float2 _3703 = float2(_862, _864);
    float3 _876 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3703, float2(0.0), isnan(_3703)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3703, float2(0.0), isnan(_3703)), level(0.0)).xyz;
    float _878 = _876.x;
    float _880 = _876.y;
    float _882 = _876.z;
    float2 _3719 = float2(_868, _872);
    float _884 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3719, float2(0.0), isnan(_3719)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3719, float2(0.0), isnan(_3719)), level(0.0)).x;
    float _886 = in.m_57.w;
    float _888 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _890 = in.m_71.y;
    float _892 = -_700;
    float _894 = _892 + _860;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _898 = _896 != 0;
    float _900 = in.m_57.y;
    int _902 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _904 = _902 != 0;
    float _906 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _908 = in.m_57.x;
    float _910 = -_702;
    float _912 = _910 + _856;
    float _914 = in.m_57.z;
    float _916 = -_704;
    float _918 = _916 + _858;
    float _920 = in.m_73.w;
    float _922 = in.m_71.x;
    bool _924 = _886 > 0.5;
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _930 = in.m_75.x;
    float _932 = in.m_75.y;
    float _934 = in.m_75.z;
    float _936 = in.m_75.w;
    float _938 = -_890;
    float _940 = _938 + 1.0;
    float _942 = 1.0 / _928;
    int _944 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _946 = _944 != 0;
    float _948 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _950 = _900 > 0.5;
    float _952 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _954 = _924 ? as_type<int>(_940) : as_type<int>(_890);
    float _956 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _958 = _950 ? as_type<int>(_940) : as_type<int>(_890);
    float _960 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _964 = _962 != 0;
    float _966 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[78].z, _956);
    float _968 = _898 ? as_type<float>(_958) : _890;
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _972 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _974 = _972 != 0;
    out.m_77.w = _920;
    float _976 = -_700;
    float _978 = _658 + _976;
    int _980 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _982 = _980 != 0;
    out.m_79.w = _690;
    int _984 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _986 = _984 != 0;
    float _988 = _908 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _990;
    float _994 = _932 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _996 = _932 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _998 = _932 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1000 = -_970;
    float _1002 = fma(_988, 2.0, _1000);
    float _1004 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[24].x, _994);
    float _1006 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[25].x, _996);
    float _1008 = fma(_930, (*spvDescriptorSet0.vp_c8)._m0[26].x, _998);
    float _1010 = _986 ? as_type<float>(_954) : _890;
    float _1012 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1004);
    float _1014 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1006);
    float _1016 = fma(_934, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1008);
    bool _1018 = _914 > 0.5;
    float _1020 = _992 * _942;
    float _1022 = _888 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1026 = _608 + _1024;
    out.m_81.x = _1012;
    out.m_81.y = _1014;
    out.m_81.z = _1016;
    float _1028 = _890;
    bool _1030 = _974;
    float _1032 = _948;
    float _1034 = _1012;
    float _1036 = _1022;
    float _1038 = _922;
    float _1040 = _914;
    float _1042 = _900;
    float _1044 = _918;
    float _1046 = _978;
    if (_974)
    {
        float _1048 = _1018 ? _940 : _890;
        _1028 = _1048;
    }
    float _1050 = _1028;
    float _1052 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1054 = fma(_1020, _1026, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1056 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1058 = _900 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1060 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1062 = isnan(_608);
    bool _1064 = _1060 || _1062;
    bool _1066 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1068 = _1064 || _1066;
    float _1070 = float(_1068);
    int _1072 = 0;
    if (_982)
    {
        float _1074 = -_922;
        float _1076 = _1074 + 1.0;
        _1072 = as_type<int>(_1076);
    }
    int _1078 = _1072;
    if (_904)
    {
        bool _1080 = _908 > 0.5;
        _1030 = _1080;
    }
    bool _1082 = _1030;
    float _1084 = fma(_1058, -2.0, _948);
    float _1086 = fma(_1022, _968, -0.5);
    float _1088 = _1086;
    if (!_904)
    {
        _1032 = _922;
    }
    float _1090 = _1032;
    float _1092 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1094 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1096 = isnan(_608);
    bool _1098 = _1094 || _1096;
    bool _1100 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1102 = _1098 || _1100;
    float _1104 = float(_1102);
    float _1106 = -_1070;
    float _1108 = _1106 + 1.0;
    float _1110 = _1090;
    if (_964)
    {
        _1034 = _908;
    }
    float _1112 = _1034;
    float _1114 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1092);
    float _1116 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1084);
    float _1118 = _1112;
    if (!_964)
    {
        _1118 = _914;
    }
    float _1120 = _1118;
    float _1122 = _1104 * _1108;
    float _1124 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1114);
    float _1126 = _906 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _1128 = as_type<int>(_1124);
    if (!_964)
    {
        _1036 = _900;
    }
    float _1130 = _1036;
    float _1132 = _1054 * _1122;
    float _1134 = -_1116;
    float _1136 = fma(_1124, _1086, _1134);
    float _1138 = _1120 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1140 = _1130;
    float _1142 = _1132;
    if (_904)
    {
        float _1144 = -_922;
        float _1146 = _1144 + 1.0;
        _1128 = as_type<int>(_1146);
    }
    int _1148 = _1128;
    float _1150 = fma(_1010, _1126, -0.5);
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1154 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1156 = as_type<int>(_1056);
    if (_946)
    {
        float _1158 = -_922;
        float _1160 = _1158 + 1.0;
        _1156 = as_type<int>(_1160);
    }
    int _1162 = _1156;
    if (_904)
    {
        float _1164 = _1082 ? as_type<float>(_1148) : _922;
        _1110 = _1164;
    }
    float _1166 = _1110;
    float _1168 = -_1152;
    float _1170 = fma(_1138, 2.0, _1168);
    if (!_946)
    {
        _1088 = _922;
    }
    float _1172 = _1088;
    float _1174 = in.m_83.x;
    float _1176 = in.m_83.y;
    float _1178 = in.m_83.z;
    float _1180 = _1172;
    if (_946)
    {
        float _1182 = _1018 ? as_type<float>(_1162) : _922;
        _1180 = _1182;
    }
    float _1184 = _1180;
    float _1186 = fma(_1154, _1050, -0.5);
    bool _1188 = _694 != 0.0;
    bool _1190 = isnan(_694);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan(0.0);
    bool _1196 = _1192 || _1194;
    float _1198 = -_1104;
    float _1200 = _1198 + 1.0;
    float _1202 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1204 = _692 == 0.0;
    bool _1206 = !_1196;
    bool _1208 = _1204 && _1206;
    float _1210 = fma(_1200, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1132);
    if (_964)
    {
        _1140 = _908;
    }
    float _1212 = _1140;
    float _1214 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1216 = fma(_900, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1052);
    bool _1218 = _696 == 0.0;
    bool _1220 = _1218 && _1208;
    float _1222 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1214);
    float _1224 = _1212 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1228 = _1224;
    float _1230 = _1212;
    if (_982)
    {
        float _1232 = _950 ? as_type<float>(_1078) : _922;
        _1038 = _1232;
    }
    float _1234 = _1038;
    float _1236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1238 = fma(_908, (*spvDescriptorSet0.vp_c9)._m0[88].z, _952);
    float _1240 = -_1226;
    float _1242 = fma(_1224, 2.0, _1240);
    if (!_964)
    {
        _1228 = _914;
    }
    float _1244 = _1228;
    float _1246 = _1202 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1248 = _1244;
    if (_964)
    {
        _1248 = _900;
    }
    float _1250 = _1248;
    float _1252 = -_164;
    float _1254 = fma(_1252, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1002);
    float _1256 = _1250;
    if (!_964)
    {
        _1142 = _914;
    }
    float _1258 = _1142;
    float _1260 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1262 = _1258;
    float _1264 = _1174;
    if (_1220)
    {
        _1230 = _1174;
    }
    float _1266 = _1230;
    float _1268 = fma(_1246, _1166, -0.5);
    float _1270 = _1266;
    if (_964)
    {
        _1040 = _900;
    }
    float _1272 = _1040;
    float _1274 = fma(_1070, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1210);
    float _1276 = _1272;
    if (!_964)
    {
        _1276 = _908;
    }
    float _1278 = _1276;
    float _1280 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].w, _960);
    if (_1220)
    {
        _1256 = _1266;
    }
    float _1282 = _1256;
    float _1284 = _1236 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1286 = _1282;
    if (!_1220)
    {
        _1270 = _1174;
    }
    float _1288 = _1270;
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    if (_964)
    {
        _1262 = _900;
    }
    float _1292 = _1262;
    float _1294 = fma(_1284, _1184, -0.5);
    if (_1220)
    {
        _1042 = _1176;
    }
    float _1296 = _1042;
    float _1298 = _1296;
    if (!_1220)
    {
        float _1300 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1288);
        _1286 = _1300;
    }
    float _1302 = _1286;
    float _1304 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _966);
    float _1306 = _1260 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1220)
    {
        _1264 = _1178;
    }
    float _1308 = _1264;
    float _1310 = _1308;
    if (!_1220)
    {
        float _1312 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1176);
        _1298 = _1312;
    }
    float _1314 = _1298;
    if (!_1220)
    {
        float _1316 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1178);
        _1310 = _1316;
    }
    float _1318 = _1310;
    float _1320 = fma(_1306, _1234, -0.5);
    float _1322 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1222);
    float _1324 = -_164;
    float _1326 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1242);
    float _1328 = -_164;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1170);
    float _1332 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1238);
    float _1334 = fma(_1304, _1268, _1254);
    float _1336 = _934 * _1288;
    float _1338 = fma(_1322, _1294, _1326);
    float _1340 = fma(_1332, _1320, _1330);
    float _1342 = _1292 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1344 = -_1336;
    float _1346 = fma(_930, _1178, _1344);
    float _1348 = _932 * _1178;
    float _1350 = fma(_1342, -2.0, _1290);
    float _1352 = _930 * _1176;
    float _1354 = -_1348;
    float _1356 = fma(_934, _1176, _1354);
    float _1358 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1360 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1362 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1364 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1366 = _1274 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1368 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1280);
    float _1370 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1350);
    float _1372 = fma(_1362, -2.0, _1360);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1376 = -_1352;
    float _1378 = fma(_932, _1288, _1376);
    float _1380 = -_1370;
    float _1382 = fma(_1368, _1150, _1380);
    float _1384 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1216);
    float _1386 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1372);
    float _1388 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1390 = _894 + _1388;
    float _1392 = _1374 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1394 = _1358 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1396 = _1364 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1398 = _1346 * _936;
    float _1400 = _1356 * _936;
    float _1402 = _1378 * _936;
    float _1404 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1406 = _912 + _1404;
    float _1408 = _1390 * _1390;
    out.m_85.x = _1392;
    out.m_85.y = _1394;
    out.m_85.z = _1396;
    out.m_85.w = _1366;
    float _1410 = -_1386;
    float _1412 = fma(_1384, _1186, _1410);
    float _1414 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1416 = fma(_1406, _1406, _1408);
    float _1418 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1420 = _1314 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1422 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1424 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1428 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1414);
    float _1430 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1418);
    float _1432 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1420);
    float _1434 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1422);
    float _1436 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1426);
    float _1438 = _1382 + 0.5;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1442 = _918 + _1440;
    float _1444 = _1136 + 0.5;
    float _1446 = _1334 + 0.5;
    float _1448 = _1338 + 0.5;
    float _1450 = fma(_1442, _1442, _1416);
    float _1452 = _1412 + 0.5;
    float _1454 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1428);
    float _1456 = _1340 + 0.5;
    out.m_87.x = _1446;
    out.m_87.y = _1444;
    out.m_87.z = _1448;
    out.m_87.w = _1438;
    float _1458 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1430);
    float _1460 = sqrt(_1450);
    out.m_89.x = _1456;
    out.m_89.y = _1452;
    out.m_91.x = _734;
    float _1462 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1424);
    float _1464 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1434);
    float _1466 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1436);
    float _1468 = fma(_1318, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1432);
    float _1470 = fma(_1402, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1462);
    bool _1472 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1474 = isnan(_1460);
    bool _1476 = _1472 || _1474;
    bool _1478 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1480 = _1476 || _1478;
    out.m_93.x = _1454;
    out.m_93.y = _1458;
    out.m_93.z = _1468;
    out.m_95.x = _1464;
    out.m_95.y = _1470;
    out.m_95.z = _1466;
    float _1482 = _1434;
    float _1484 = _1430;
    if (!_1480)
    {
        _1482 = 1.0;
    }
    float _1486 = _1482;
    out.m_97.x = _878;
    out.m_97.y = _880;
    out.m_97.z = _882;
    bool _1488 = !_1480;
    float _1490 = _1486;
    if (!_1488)
    {
        bool _1492 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1494 = isnan(_1460);
        bool _1496 = _1492 || _1494;
        bool _1498 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1500 = _1496 || _1498;
        if (!_1500)
        {
            float _1502 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1504 = _1460 + _1502;
            float _1506 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1508 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1506;
            float _1510 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1512 = _1510 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1514 = 1.0 / _1508;
            float _1516 = _1504 * _1514;
            float _1518 = fma(_1516, _1512, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1490 = _1518;
            _1520 = true;
        }
        else
        {
            bool _1522 = _1460 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1524 = isnan(_1460);
            bool _1526 = _1522 || _1524;
            bool _1528 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1530 = _1526 || _1528;
            if (!_1530)
            {
                float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1534 = _1460 + _1532;
                float _1536 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1538 = _1536 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1542 = _1540 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1544 = 1.0 / _1538;
                float _1546 = _1534 * _1544;
                float _1548 = fma(_1546, _1542, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1490 = _1548;
                _1520 = true;
            }
            else
            {
                _1490 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1520 = false;
    float _1550 = _1490;
    float _1552 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1554 = _894 + _1552;
    float _1556 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1558 = _912 + _1556;
    float _1560 = fma(_1554, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1564 = _918 + _1562;
    float _1566 = fma(_1558, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1568 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1570 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1572 = _1560 + _1570;
    float _1574 = fma(_1564, _1550, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1578 = _1566 + _1576;
    float _1580 = _1572 * _1572;
    float _1582 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1584 = _1574 + _1582;
    float _1586 = fma(_1578, _1578, _1580);
    float _1588 = fma(_1584, _1584, _1586);
    float _1590 = rsqrt(_1588);
    float _1592 = _1590 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1594 = _1578 * _1592;
    float _1596 = _1584 * _1592;
    float _1598 = _1594 * _1594;
    float _1600 = _1596 * _1596;
    float _1602 = _1598 + _1600;
    float _1604 = sqrt(_1602);
    bool _1606 = _1604 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1610 = _1604 + _1608;
    float _1612 = _1318;
    float _1614 = _1602;
    float _1616 = _1610;
    float _1618 = _1572;
    float _1620 = _1594;
    if (_1606)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1612 = _1622;
    }
    float _1624 = _1612;
    if (_1606)
    {
        float _1626 = rsqrt(_1602);
        _1614 = _1626;
    }
    float _1628 = _1614;
    float _1630 = _1628;
    if (_1606)
    {
        float _1632 = _1610 * _1624;
        _1616 = _1632;
    }
    float _1634 = _1616;
    if (_1606)
    {
        float _1636 = _1634 * 0.15915493667125701904296875;
        _1484 = _1636;
    }
    float _1638 = _1484;
    float _1640 = _1584;
    float _1642 = _1638;
    if (_1606)
    {
        float _1644 = _1638 * 6.283185482025146484375;
        float _1646 = sin(_1644);
        _1640 = _1646;
    }
    float _1648 = _1640;
    float _1650 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1652 = precise::max(0.0, _1650);
    float _1654 = _1624;
    float _1656 = _1652;
    if (_1606)
    {
        float _1658 = _1638 * 6.283185482025146484375;
        float _1660 = cos(_1658);
        _1654 = _1660;
    }
    float _1662 = _1654;
    float _1664 = -_1592;
    float _1666 = -_1652;
    float _1668 = fma(_1572, _1664, _1666);
    if (_1606)
    {
        float _1670 = _1668 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1618 = _1670;
    }
    float _1672 = _1618;
    float _1674 = _1648;
    float _1676 = _1672;
    if (_1606)
    {
        float _1678 = fma(_1648, _1672, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1674 = _1678;
    }
    float _1680 = _1674;
    float _1682 = _1680;
    if (!_1606)
    {
        _1676 = _1596;
    }
    float _1684 = _1676;
    float _1686 = _1684;
    float _1688 = _1662;
    if (_1606)
    {
        float _1690 = _1662 + (-1.0);
        _1656 = _1690;
    }
    float _1692 = _1656;
    if (_1606)
    {
        float _1694 = _1628 * _1680;
        _1044 = _1694;
    }
    float _1696 = _1044;
    if (!_1606)
    {
        _1682 = _1668;
    }
    float _1698 = _1682;
    float _1700 = _1698;
    if (_1606)
    {
        float _1702 = _1692 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1702;
    }
    float _1704 = _1642;
    if (_1606)
    {
        float _1706 = _1594 * _1696;
        _1620 = _1706;
    }
    float _1708 = _1620;
    float _1710 = sqrt(_1588);
    if (!_1606)
    {
        _1630 = _1598;
    }
    float _1712 = _1630;
    float _1714 = _1712;
    if (_1606)
    {
        float _1716 = fma(_1668, _1662, _1704);
        _1700 = _1716;
    }
    float _1718 = _1700;
    if (_1606)
    {
        float _1720 = _1596 * _1696;
        _1686 = _1720;
    }
    float _1722 = _1686;
    if (_1606)
    {
        float _1724 = _1708 * _1708;
        _1714 = _1724;
    }
    float _1726 = _1714;
    if (!_1606)
    {
        _1688 = _1600;
    }
    float _1728 = _1688;
    float _1730 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1732 = _1728;
    if (_1606)
    {
        float _1734 = _1722 * _1722;
        _1732 = _1734;
    }
    float _1736 = _1732;
    float _1738 = fma(_1718, _1718, _1726);
    float _1740 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1730);
    float _1742 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1744 = _1738 + _1736;
    float _1746 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1748 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1742);
    float _1750 = rsqrt(_1744);
    float _1752 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1754 = fma(_1710, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1752);
    float _1756 = precise::clamp(_1754, 0.0, 1.0);
    float _1758 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1740);
    float _1760 = _1560 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1762 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1746);
    float _1764 = -_1756;
    float _1766 = _1764 + 1.0;
    float _1768 = _1758 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1770 = fma(_1566, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1760);
    float _1772 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1762);
    float _1774 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1748);
    float _1776 = _1768 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1778 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1770);
    float _1780 = _1772 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1782 = abs(_1766);
    float _1784 = log2(_1782);
    float _1786 = -_1776;
    float _1788 = fma(_1786, _1568, 1.0);
    float _1790 = _1778 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1792 = _1750 * _1708;
    float _1794 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1796 = _1750 * _1718;
    float _1798 = _1750 * _1722;
    float _1800 = _1792 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1802 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1794);
    float _1804 = _1774 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1806 = log2(_1788);
    float _1808 = -_1800;
    float _1810 = fma(_1796, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1808);
    float _1812 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1802);
    float _1814 = -_1798;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1810);
    float _1818 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1812);
    float _1820 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1822 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1824 = fma(_1816, -0.5, 0.5);
    float _1826 = 1.0 / _1818;
    float _1828 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1830 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1822);
    float _1832 = fma(_1816, 0.5, 0.5);
    float _1834 = _1796 + 1.0;
    float _1836 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1828);
    float _1838 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1830);
    float _1840 = exp2(_1820);
    float _1842 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1836);
    float _1844 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1838);
    float _1846 = _1806 * 0.693147182464599609375;
    float _1848 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1842);
    float _1850 = sqrt(_1824);
    float _1852 = fma(_1832, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1854 = _1844 * _1826;
    float _1856 = _1848 * _1826;
    float _1858 = _1846 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1860 = fma(_1832, _1852, -0.212114393711090087890625);
    float _1862 = fma(_1854, 0.5, 0.5);
    float _1864 = fma(_1856, -0.5, 0.5);
    float _1866 = -_1796;
    float _1868 = fma(_1840, _1834, _1866);
    float _1870 = fma(_1832, _1860, 1.570728778839111328125);
    float _1872 = fma(_1868, 0.5, 0.5);
    float _1874 = _1850 * 0.636619746685028076171875;
    float3 _5473 = float3(_1862, _1864, _1858);
    float _1876 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5473, float3(0.0), isnan(_5473)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5473, float3(0.0), isnan(_5473)), level(0.0)).x;
    float3 _5484 = float3(_1862, _1864, _1858);
    float4 _1879 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5484, float3(0.0), isnan(_5484)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5484, float3(0.0), isnan(_5484)), level(0.0)).xyzw;
    float _1881 = _1879.x;
    float _1883 = _1879.y;
    float _1885 = _1879.z;
    float _1887 = _1879.w;
    float _1889 = -_1870;
    float _1891 = fma(_1874, _1889, 1.0);
    float2 _5505 = float2(_1891, _1872);
    float3 _1893 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5505, float2(0.0), isnan(_5505)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5505, float2(0.0), isnan(_5505)), level(0.0)).xyz;
    float _1895 = _1893.x;
    float _1897 = _1893.y;
    float _1899 = _1893.z;
    float _1901 = _978 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1903 = _1784 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1905 = in.m_99.x;
    float _1907 = _1780 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1909 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1901);
    float _1911 = -_884;
    float _1913 = _1911 + 1.0;
    float _1915 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1909);
    float _1917 = _978 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1919 = fma(_1790, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1907);
    float _1921 = _1915 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1923 = fma(_794, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1917);
    float _1925 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1919);
    float _1927 = 1.0 / _1921;
    float _1929 = fma(_756, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1923);
    out.m_101.x = _794;
    out.m_101.y = _978;
    out.m_101.z = _756;
    float _1931 = fma(_1804, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1925);
    float _1933 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_103.x = _1566;
    out.m_103.y = _1560;
    out.m_103.z = _1574;
    float _1935 = _1933 + _1921;
    out.gl_Position.x = _1844;
    out.gl_Position.y = _1848;
    out.gl_Position.z = _1931;
    out.gl_Position.w = _1818;
    float _1937 = _1935 * _1927;
    float _1939 = _1937 * 0.5;
    float _1941 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1943 = fma(_1939, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1941);
    bool _1945 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1947 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1949 = _1945 || _1947;
    bool _1951 = isnan(0.5);
    bool _1953 = _1949 || _1951;
    float _1955 = 1.0 / _1943;
    float _1957 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1959 = _1955 * _1957;
    float _1961 = abs(_1959);
    float _1963 = log2(_1961);
    float _1965 = _1804;
    float _1967 = _1818;
    float _1969 = _1844;
    float _1971 = _1848;
    if (!_1953)
    {
        float _1973 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1975 = _1959 + _1973;
        _1965 = _1975;
    }
    float _1977 = _1965;
    float _1979 = _1963 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1981 = exp2(_1979);
    float _1983 = fma(_1981, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1985 = precise::clamp(_1983, 0.0, 1.0);
    float _1987 = _1981;
    if (!_1953)
    {
        _1987 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _1989 = _1987;
    float _1991 = fma(_1985, -2.0, 3.0);
    float _1993 = _1985 * _1985;
    float _1995 = _1989;
    if (!_1953)
    {
        float _1997 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1999 = _1989 + _1997;
        _1995 = _1999;
    }
    float _2001 = _1995;
    float _2003 = _1993 * _1991;
    bool _2005 = _1959 <= 8000.0;
    bool _2007 = isnan(_1959);
    bool _2009 = _2005 || _2007;
    bool _2011 = isnan(8000.0);
    bool _2013 = _2009 || _2011;
    float _2015 = float(_2013);
    float _2017 = _2001;
    if (!_1953)
    {
        float _2019 = 1.0 / _2001;
        _2017 = _2019;
    }
    float _2021 = _2017;
    float _2023 = -_2003;
    float _2025 = _2023 + 1.0;
    float _2027 = fma(_2025, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2003);
    float _2029 = exp2(_1903);
    float _2031 = _2015 * _2027;
    float _2033 = _2031 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2035 = _1913 * _2033;
    float _2037 = precise::clamp(_2035, 0.0, 1.0);
    float _2039 = _1818 * 0.5;
    float _2041 = _1931 + _1818;
    float _2043 = -_2037;
    float _2045 = fma(_2043, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2047 = _1844 + _1818;
    float _2049 = fma(_1848, -0.5, _2039);
    float _2051 = -_2029;
    float _2053 = _2051 + 1.0;
    float _2055 = _2045 * _1905;
    float _2057 = _2045;
    if (_1953)
    {
        _2057 = 1.0;
    }
    float _2059 = _2057;
    float _2061 = _2059;
    if (!_1953)
    {
        float _2063 = _1977 * _2021;
        float _2065 = precise::clamp(_2063, 0.0, 1.0);
        _2061 = _2065;
    }
    float _2067 = _2061;
    float _2069 = _2053 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2071 = _2041 * 0.5;
    float _2073 = _2047 * 0.5;
    float _2075 = _2055 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2077 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2079 = isnan(_1710);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2085 = _2081 || _2083;
    out.m_105.x = _2073;
    out.m_105.y = _2049;
    out.m_105.z = _2071;
    out.m_105.w = _1818;
    out.m_107.x = _2075;
    if (!_2085)
    {
        _1967 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2087 = _1967;
    float _2089 = _2087;
    float _2091 = _2087;
    if (!_2085)
    {
        _1969 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2093 = _1969;
    float _2095 = _2093;
    float _2097 = _2093;
    if (!_2085)
    {
        _1971 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2099 = _1971;
    float _2101 = _2099;
    float _2103 = _2099;
    if (!_2085)
    {
        _812 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2105 = _812;
    float _2107 = _2105;
    float _2109 = _2105;
    if (!_2085)
    {
        _1046 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2111 = _1046;
    float _2113 = _2069 * _1876;
    float _2115 = -_2069;
    float _2117 = _2115 + 1.0;
    float _2119 = _1887 * _2113;
    float _2121 = _1887 * _2117;
    float _2123 = _1899 * _2113;
    float _2125 = fma(_1895, _2119, _1881);
    float _2127 = fma(_1897, _2119, _1883);
    float _2129 = _2119;
    float _2131 = _2111;
    float _2133 = _2111;
    if (!_2085)
    {
        _2129 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2135 = _2129;
    float _2137 = fma(_1887, _2123, _1885);
    float _2139 = _2067 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_109.x = _2125;
    out.m_109.y = _2127;
    out.m_109.z = _2137;
    out.m_109.w = _2121;
    bool _2141 = !_2085;
    float _2143 = _2135;
    float _2145 = _2135;
    if (!_2141)
    {
        bool _2147 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2149 = isnan(_1710);
        bool _2151 = _2147 || _2149;
        bool _2153 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2155 = _2151 || _2153;
        if (!_2155)
        {
            float _2157 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2159 = _1710 + _2157;
            float _2161 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2163 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2161;
            float _2165 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2169 = 1.0 / _2163;
            float _2171 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2173 = _2171 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2175 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2177 = _2175 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2179 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2181 = _2179 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2183 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2187 = _2159 * _2169;
            float _2189 = precise::clamp(_2187, 0.0, 1.0);
            float _2191 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2193 = _2191 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2195 = fma(_2189, _2167, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2197 = fma(_2189, _2193, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2199 = fma(_2189, _2173, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2201 = fma(_2189, _2177, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2203 = fma(_2189, _2181, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2205 = fma(_2189, _2185, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2097 = _2199;
            _2133 = _2203;
            _2091 = _2195;
            _2109 = _2201;
            _2103 = _2197;
            _2145 = _2205;
            _2207 = true;
        }
        else
        {
            bool _2209 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2211 = isnan(_1710);
            bool _2213 = _2209 || _2211;
            bool _2215 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2217 = _2213 || _2215;
            if (!_2217)
            {
                _2089 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2219 = _2089;
            _2091 = _2219;
            if (!_2217)
            {
                _2095 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2221 = _2095;
            _2097 = _2221;
            if (!_2217)
            {
                _2101 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2223 = _2101;
            _2103 = _2223;
            if (!_2217)
            {
                _2107 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2225 = _2107;
            _2109 = _2225;
            if (!_2217)
            {
                _2131 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2227 = _2131;
            _2133 = _2227;
            if (!_2217)
            {
                _2143 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2229 = _2143;
            bool _2231 = !_2217;
            _2145 = _2229;
            if (!_2231)
            {
                bool _2233 = _1710 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2235 = isnan(_1710);
                bool _2237 = _2233 || _2235;
                bool _2239 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2241 = _2237 || _2239;
                if (!_2241)
                {
                    float _2243 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2245 = _1710 + _2243;
                    float _2247 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2249 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2247;
                    float _2251 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2253 = _2251 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2255 = 1.0 / _2249;
                    float _2257 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2259 = _2257 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2261 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2263 = _2261 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2265 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2267 = _2265 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2269 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2271 = _2269 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2273 = _2245 * _2255;
                    float _2275 = precise::clamp(_2273, 0.0, 1.0);
                    float _2277 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2279 = _2277 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2281 = fma(_2275, _2253, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2283 = fma(_2275, _2279, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2285 = fma(_2275, _2259, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2287 = fma(_2275, _2263, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2289 = fma(_2275, _2267, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2291 = fma(_2275, _2271, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2097 = _2285;
                    _2133 = _2289;
                    _2091 = _2281;
                    _2109 = _2287;
                    _2103 = _2283;
                    _2145 = _2291;
                    _2207 = true;
                }
                else
                {
                    _2097 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2133 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2091 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2109 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2103 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2145 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2207 = false;
    float _2293 = _2097;
    float _2295 = _2133;
    float _2297 = _2091;
    float _2299 = _2109;
    float _2301 = _2103;
    float _2303 = _2145;
    float _2305 = fma(_1458, -0.5, 0.5);
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2293;
    float _2311 = _2309 + _2295;
    float _2313 = _2139 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2315 = -_2297;
    float _2317 = _2315 + _2299;
    float _2319 = fma(_2307, _2311, _2293);
    out.m_111.x = 0.0;
    float _2321 = -_2301;
    float _2323 = _2321 + _2303;
    float _2325 = fma(_2307, _2317, _2297);
    float _2327 = _2319 * 0.586610972881317138671875;
    out.m_53.x = _2313;
    bool _2329 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2331 = fma(_2307, _2323, _2301);
    float _2333 = fma(_2325, 0.298911988735198974609375, _2327);
    bool _2335 = _2067 > 0.0;
    bool _2337 = isnan(_2067);
    bool _2339 = _2335 || _2337;
    bool _2341 = isnan(0.0);
    bool _2343 = _2339 || _2341;
    float _2345 = fma(_2331, 0.114477999508380889892578125, _2333);
    float _2347 = -_2345;
    float _2349 = _2325 + _2347;
    float _2351 = -_2345;
    float _2353 = _2319 + _2351;
    float _2355 = -_2345;
    float _2357 = _2331 + _2355;
    float _2359 = fma(_2349, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    float _2361 = fma(_2353, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    float _2363 = fma(_2357, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2345);
    bool _2365 = !_2329;
    if (!_2365)
    {
        float _2367 = -_1560;
        float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2371 = -_1566;
        float _2373 = _2371 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2375 = -_1574;
        float _2377 = _2375 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2379 = _2369 * _2369;
        float _2381 = fma(_2373, _2373, _2379);
        float _2383 = fma(_2377, _2377, _2381);
        float _2385 = sqrt(_2383);
        float _2387 = rsqrt(_2383);
        float _2389 = -_2385;
        float _2391 = _2389 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2393 = _2391 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2395 = precise::clamp(_2393, 0.0, 1.0);
        float _2397 = _2373 * _2387;
        float _2399 = _2369 * _2387;
        float _2401 = abs(_2395);
        float _2403 = log2(_2401);
        float _2405 = _2377 * _2387;
        float _2407 = _2397 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2409 = _1458 * _2399;
        float _2411 = -_2399;
        float _2413 = -_2407;
        float _2415 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2413);
        float _2417 = fma(_1454, _2397, _2409);
        float _2419 = -_2405;
        float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2415);
        float _2423 = fma(_1468, _2405, _2417);
        float _2425 = precise::clamp(_2423, 0.0, 1.0);
        float _2427 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2429 = _2421 + _2427;
        float _2431 = _2403 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2433 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2435 = precise::clamp(_2433, 0.0, 1.0);
        float _2437 = exp2(_2431);
        float _2439 = _2437 * _2435;
        float _2441 = _2425 * _2439;
        float _2443 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2447 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _2443;
        out.m_111.y = _2445;
        out.m_111.z = _2447;
    }
    out.m_79.x = _2359;
    out.m_79.y = _2361;
    out.m_79.z = _2363;
    if (_2343)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2449 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2449;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

