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
    float4 m_87 [[user(locn1)]];
    float4 m_109 [[user(locn2)]];
    float4 m_83 [[user(locn3)]];
    float4 m_91 [[user(locn4)]];
    float4 m_95 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_93 [[user(locn7)]];
    float4 m_89 [[user(locn8)]];
    float4 m_101 [[user(locn9)]];
    float4 m_103 [[user(locn10)]];
    float4 m_105 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_79 [[user(locn13)]];
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
    float4 m_81 [[attribute(7)]];
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1558 = false;
    bool _636 = false;
    bool _494 = false;
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
        float _2544 = as_type<float>(_146);
        out.gl_Position.z = _2544;
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
        float _2612 = as_type<float>(_182);
        out.gl_Position.z = _2612;
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
    float _492;
    if (!_474)
    {
        float _476 = in.m_57.x;
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _480 = _476 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _484 = _482 * _478;
        float _486 = floor(_484);
        float _488 = -_486;
        float _490 = _484 + _488;
        _492 = _490;
        _494 = true;
    }
    else
    {
        float _496 = float(_130);
        float _498 = 1.0 / _496;
        float _500 = _164 * _498;
        _492 = _500;
    }
    _494 = false;
    float _502 = _492;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _502 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = isnan(_502);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _530 = isnan(_502);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _540;
    bool _544 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _546 = isnan(_502);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = 1.0 / _510;
    float _558 = -_522;
    float _560 = _558 + 1.0;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _502 + _562;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _568 = _538 * _560;
    float _570 = -_538;
    float _572 = _570 + 1.0;
    float _574 = 1.0 / _526;
    float _576 = _542 * _556;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = fma(_576, _506, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _580 * _574;
    float _586 = -_554;
    float _588 = _586 + 1.0;
    float _590 = _582 * _568;
    float _592 = fma(_584, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _594 = _522 * _588;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _598 = fma(_592, _594, _596);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _606 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[117].x, _598);
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _608;
    out.m_61.y = _610;
    out.m_61.z = _612;
    out.m_61.w = _614;
    bool _616 = !_566;
    float _634;
    if (!_616)
    {
        float _618 = in.m_57.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_130);
        float _640 = 1.0 / _638;
        float _642 = _164 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_50.x;
    float _648 = in.m_50.y;
    float _650 = in.m_50.z;
    float _652 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _654 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _656 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _658 = in.m_63.x;
    float _660 = in.m_63.y;
    float _662 = in.m_63.z;
    float _664 = _652 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _666 = in.m_65.x;
    float _668 = in.m_65.y;
    float _670 = in.m_65.z;
    float _672 = in.m_67.x;
    float _674 = in.m_67.y;
    float _676 = in.m_67.z;
    float _678 = _648 * _660;
    float _680 = _648 * _668;
    float _682 = fma(_646, _658, _678);
    float _684 = _648 * _674;
    float _686 = fma(_646, _666, _680);
    float _688 = fma(_650, _662, _682);
    float _690 = fma(_646, _672, _684);
    float _692 = fma(_650, _670, _686);
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = fma(_650, _676, _690);
    float _698 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _694 + _700;
    float _704 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _698 + _706;
    float _710 = _702 * _702;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _704 + _712;
    float _716 = fma(_708, _708, _710);
    float _718 = fma(_714, _714, _716);
    float _720 = sqrt(_718);
    float _722 = rsqrt(_718);
    float _724 = _720 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _726 = precise::min(_664, _724);
    float _728 = _722 * _726;
    float _730 = _702 * _728;
    float _732 = _708 * _728;
    float _734 = _714 * _728;
    float _736 = -_730;
    float _738 = _702 + _736;
    float _740 = -_732;
    float _742 = _708 + _740;
    float _744 = _738 * _738;
    float _746 = -_734;
    float _748 = _714 + _746;
    float _750 = in.m_69.x;
    float _752 = in.m_69.y;
    float _754 = in.m_69.z;
    float _756 = fma(_742, _742, _744);
    float _758 = fma(_748, _748, _756);
    float _760 = sqrt(_758);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _764 = _722 * _760;
    float _766 = _654 * _764;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _750);
    float _770 = _652 * _764;
    float _772 = _656 * _764;
    float _774 = _766 * _762;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _754);
    float _778 = _770 * _768;
    float _780 = _774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _782 = _772 * _776;
    float _784 = _774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _786 = _774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].x, _780);
    float _790 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].x, _784);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _786);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _788);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _790);
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _792);
    float _800 = _794 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _802 = -_734;
    float _804 = _704 + _802;
    float _806 = _796 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _808 = _798 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _810 = _704 + _800;
    float _812 = _698 + _806;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _810 + _816;
    float _820 = _694 + _808;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _824 = _812 + _822;
    float _826 = floor(_814);
    float _828 = _818 * _818;
    float _830 = fma(_824, _824, _828);
    float _832 = -_732;
    float _834 = _698 + _832;
    float _836 = sqrt(_830);
    float _838 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _840 = floor(_838);
    bool _842 = _836 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = 0.0;
    float _846 = _812;
    float _848 = _810;
    float _850 = _804;
    if (!_842)
    {
        _844 = _820;
    }
    float _852 = _844;
    bool _854 = !_842;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _836 + _860;
        float _864 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = _862 * _858;
        float _868 = rsqrt(_830);
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = cos(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _874 + (-1.0);
        float _882 = _880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = fma(_878, _864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _886 = fma(_820, _874, _882);
        float _888 = _868 * _884;
        float _890 = fma(_824, _888, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _892 = fma(_818, _888, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _846 = _890;
        _848 = _892;
        _856 = _886;
    }
    float _894 = _846;
    float _896 = _848;
    float _898 = _856;
    float _900 = fma(_894, 6.2500002968590706586837768554688e-05, 0.5);
    float _902 = fma(_896, 6.2500002968590706586837768554688e-05, 0.5);
    float _904 = -_840;
    float _906 = _838 + _904;
    float _908 = -_826;
    float _910 = _814 + _908;
    float2 _3799 = float2(_900, _902);
    float3 _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3799, float2(0.0), isnan(_3799)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3799, float2(0.0), isnan(_3799)), level(0.0)).xyz;
    float _916 = _914.x;
    float _918 = _914.y;
    float _920 = _914.z;
    float2 _3815 = float2(_906, _910);
    float _922 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3815, float2(0.0), isnan(_3815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3815, float2(0.0), isnan(_3815)), level(0.0)).x;
    float _924 = in.m_57.w;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _928 = in.m_71.y;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _936 = _934 != 0;
    float _938 = in.m_57.y;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _942 = _940 != 0;
    float _944 = 1.0 / _932;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _948 = _946 != 0;
    float _950 = in.m_57.x;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _954 = _952 != 0;
    float _956 = -_730;
    float _958 = _956 + _898;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _962 = _960 != 0;
    float _964 = in.m_57.z;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _968 = in.m_73.w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _970;
    float _974 = in.m_71.x;
    bool _976 = _924 > 0.5;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = in.m_75.x;
    float _982 = in.m_75.y;
    float _984 = in.m_75.z;
    float _986 = in.m_75.w;
    float _988 = -_928;
    float _990 = _988 + 1.0;
    float _992 = -_732;
    float _994 = _992 + _894;
    bool _996 = _938 > 0.5;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1000 = _976 ? as_type<int>(_990) : as_type<int>(_928);
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1004 = _996 ? as_type<int>(_990) : as_type<int>(_928);
    float _1006 = -_734;
    float _1008 = _1006 + _896;
    float _1010 = _962 ? as_type<float>(_1000) : _928;
    float _1012 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1002);
    float _1014 = _936 ? as_type<float>(_1004) : _928;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1020 = _1018 != 0;
    float _1022 = _950 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_77.w = _968;
    bool _1024 = _964 > 0.5;
    float _1026 = -_1016;
    float _1028 = fma(_1022, 2.0, _1026);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1032 = _1030 != 0;
    int _1034 = 0;
    float _1036 = _928;
    bool _1038 = _1020;
    float _1040 = _978;
    float _1042 = _974;
    float _1044 = _964;
    float _1046 = _938;
    float _1048 = _1008;
    if (_954)
    {
        float _1050 = -_974;
        float _1052 = _1050 + 1.0;
        _1034 = as_type<int>(_1052);
    }
    int _1054 = _1034;
    float _1056 = -_164;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1028);
    float _1060 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1062 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1064 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1020)
    {
        float _1066 = _1024 ? _990 : _928;
        _1036 = _1066;
    }
    float _1068 = _1036;
    float _1070 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1060);
    float _1072 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1062);
    float _1074 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1064);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1078 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1070);
    float _1080 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1072);
    float _1082 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1084 = _972 * _944;
    float _1086 = _926 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1090 = _644 + _1088;
    out.m_79.x = _1078;
    out.m_79.y = _1080;
    out.m_79.z = _1082;
    float _1092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1094 = fma(_1084, _1090, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1096 = _938 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1098 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1100 = isnan(_644);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1112 = _1078;
    float _1114 = _1086;
    if (_942)
    {
        bool _1116 = _950 > 0.5;
        _1038 = _1116;
    }
    bool _1118 = _1038;
    float _1120 = fma(_1096, -2.0, _978);
    float _1122 = fma(_1086, _1014, -0.5);
    float _1124 = _1122;
    if (!_942)
    {
        _1040 = _974;
    }
    float _1126 = _1040;
    float _1128 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1076);
    float _1130 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1120);
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1134 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1136 = isnan(_644);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1108;
    float _1148 = _1146 + 1.0;
    float _1150 = _1126;
    if (_1032)
    {
        _1112 = _950;
    }
    float _1152 = _1112;
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1132);
    float _1156 = _1152;
    if (!_1032)
    {
        _1156 = _964;
    }
    float _1158 = _1156;
    float _1160 = _1144 * _1148;
    float _1162 = _966 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1164 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1154);
    int _1166 = as_type<int>(_1164);
    if (!_1032)
    {
        _1114 = _938;
    }
    float _1168 = _1114;
    float _1170 = _1094 * _1160;
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1174 = -_1130;
    float _1176 = fma(_1164, _1122, _1174);
    float _1178 = _1168;
    float _1180 = _1170;
    if (_942)
    {
        float _1182 = -_974;
        float _1184 = _1182 + 1.0;
        _1166 = as_type<int>(_1184);
    }
    int _1186 = _1166;
    float _1188 = fma(_1010, _1162, -0.5);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1192 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1194 = as_type<int>(_1092);
    if (_948)
    {
        float _1196 = -_974;
        float _1198 = _1196 + 1.0;
        _1194 = as_type<int>(_1198);
    }
    int _1200 = _1194;
    if (_942)
    {
        float _1202 = _1118 ? as_type<float>(_1186) : _974;
        _1150 = _1202;
    }
    float _1204 = _1150;
    float _1206 = -_1190;
    float _1208 = fma(_1172, 2.0, _1206);
    if (!_948)
    {
        _1124 = _974;
    }
    float _1210 = _1124;
    float _1212 = in.m_81.x;
    float _1214 = in.m_81.y;
    float _1216 = in.m_81.z;
    float _1218 = _1210;
    if (_948)
    {
        float _1220 = _1024 ? as_type<float>(_1200) : _974;
        _1218 = _1220;
    }
    float _1222 = _1218;
    float _1224 = fma(_1192, _1068, -0.5);
    bool _1226 = _752 != 0.0;
    bool _1228 = isnan(_752);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan(0.0);
    bool _1234 = _1230 || _1232;
    float _1236 = -_1144;
    float _1238 = _1236 + 1.0;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1242 = _750 == 0.0;
    bool _1244 = !_1234;
    bool _1246 = _1242 && _1244;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1170);
    if (_1032)
    {
        _1178 = _950;
    }
    float _1250 = _1178;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1254 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1248);
    bool _1256 = _754 == 0.0;
    bool _1258 = _1256 && _1246;
    float _1260 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1252);
    float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1266 = _1262;
    float _1268 = _1250;
    if (_954)
    {
        float _1270 = _996 ? as_type<float>(_1054) : _974;
        _1042 = _1270;
    }
    float _1272 = _1042;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1276 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[88].z, _998);
    float _1278 = -_1264;
    float _1280 = fma(_1262, 2.0, _1278);
    if (!_1032)
    {
        _1266 = _964;
    }
    float _1282 = _1266;
    float _1284 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1286 = _1282;
    if (_1032)
    {
        _1286 = _938;
    }
    float _1288 = _1286;
    out.m_83.w = _726;
    float _1290 = _1288;
    if (!_1032)
    {
        _1180 = _964;
    }
    float _1292 = _1180;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1296 = _1292;
    float _1298 = _1212;
    if (_1258)
    {
        _1268 = _1212;
    }
    float _1300 = _1268;
    float _1302 = fma(_1284, _1204, -0.5);
    float _1304 = _1300;
    if (_1032)
    {
        _1044 = _938;
    }
    float _1306 = _1044;
    out.m_85.x = _770;
    float _1308 = _1306;
    if (!_1032)
    {
        _1308 = _950;
    }
    float _1310 = _1308;
    float _1312 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1110);
    if (_1258)
    {
        _1290 = _1300;
    }
    float _1314 = _1290;
    float _1316 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1318 = _1314;
    if (!_1258)
    {
        _1304 = _1212;
    }
    float _1320 = _1304;
    float _1322 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1312);
    if (_1032)
    {
        _1296 = _938;
    }
    float _1324 = _1296;
    float _1326 = fma(_1316, _1222, -0.5);
    if (_1258)
    {
        _1046 = _1214;
    }
    float _1328 = _1046;
    float _1330 = _1328;
    if (!_1258)
    {
        float _1332 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1320);
        _1318 = _1332;
    }
    float _1334 = _1318;
    float _1336 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1012);
    float _1338 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1258)
    {
        _1298 = _1216;
    }
    float _1340 = _1298;
    float _1342 = _1340;
    if (!_1258)
    {
        float _1344 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1330 = _1344;
    }
    float _1346 = _1330;
    if (!_1258)
    {
        float _1348 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1342 = _1348;
    }
    float _1350 = _1342;
    float _1352 = fma(_1338, _1272, -0.5);
    float _1354 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1260);
    float _1356 = -_164;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1280);
    float _1360 = -_164;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1208);
    float _1364 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1276);
    float _1366 = fma(_1336, _1302, _1058);
    float _1368 = _984 * _1320;
    float _1370 = fma(_1354, _1326, _1358);
    float _1372 = fma(_1364, _1352, _1362);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1376 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1378 = -_1368;
    float _1380 = fma(_980, _1216, _1378);
    float _1382 = _982 * _1216;
    float _1384 = fma(_1376, -2.0, _1374);
    float _1386 = _980 * _1214;
    float _1388 = -_1382;
    float _1390 = fma(_984, _1214, _1388);
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1396 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1400 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1402 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1384);
    float _1404 = fma(_1396, -2.0, _1394);
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1408 = -_1386;
    float _1410 = fma(_982, _1320, _1408);
    float _1412 = -_1402;
    float _1414 = fma(_1322, _1188, _1412);
    float _1416 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1128);
    float _1418 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1404);
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _958 + _1420;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1432 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1434 = _1380 * _986;
    float _1436 = _1390 * _986;
    float _1438 = _1410 * _986;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _994 + _1440;
    float _1444 = _1422 * _1422;
    out.m_87.x = _1424;
    out.m_87.y = _1426;
    out.m_87.z = _1428;
    out.m_87.w = _1400;
    float _1446 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1430);
    float _1448 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1432);
    float _1450 = fma(_1442, _1442, _1444);
    float _1452 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1454 = -_1418;
    float _1456 = fma(_1416, _1224, _1454);
    float _1458 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1460 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1452);
    float _1466 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1468 = _1372 + 0.5;
    float _1470 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    float _1472 = _1414 + 0.5;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1476 = _1008 + _1474;
    float _1478 = _1176 + 0.5;
    float _1480 = _1366 + 0.5;
    float _1482 = _1370 + 0.5;
    float _1484 = fma(_1476, _1476, _1450);
    float _1486 = _1456 + 0.5;
    float _1488 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1464);
    float _1490 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    out.m_89.x = _1480;
    out.m_89.y = _1478;
    out.m_89.z = _1482;
    out.m_89.w = _1472;
    float _1492 = -_730;
    float _1494 = _694 + _1492;
    float _1496 = sqrt(_1484);
    out.m_91.x = _1468;
    out.m_91.y = _1486;
    float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1500 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1466);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1504 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1506 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1498);
    bool _1508 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1510 = isnan(_1496);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1516 = _1512 || _1514;
    out.m_93.x = _1488;
    out.m_93.y = _1490;
    out.m_93.z = _1504;
    out.m_95.x = _1500;
    out.m_95.y = _1506;
    out.m_95.z = _1502;
    float _1518 = _1466;
    float _1520 = _1446;
    float _1522 = _1494;
    if (!_1516)
    {
        _1518 = 1.0;
    }
    float _1524 = _1518;
    out.m_97.x = _916;
    out.m_97.y = _918;
    out.m_97.z = _920;
    bool _1526 = !_1516;
    float _1528 = _1524;
    if (!_1526)
    {
        bool _1530 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1532 = isnan(_1496);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1538 = _1534 || _1536;
        if (!_1538)
        {
            float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1542 = _1496 + _1540;
            float _1544 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1546 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1544;
            float _1548 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1550 = _1548 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1552 = 1.0 / _1546;
            float _1554 = _1542 * _1552;
            float _1556 = fma(_1554, _1550, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1528 = _1556;
            _1558 = true;
        }
        else
        {
            bool _1560 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1562 = isnan(_1496);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1568 = _1564 || _1566;
            if (!_1568)
            {
                float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1572 = _1496 + _1570;
                float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1576 = _1574 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1580 = _1578 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1582 = 1.0 / _1576;
                float _1584 = _1572 * _1582;
                float _1586 = fma(_1584, _1580, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1528 = _1586;
                _1558 = true;
            }
            else
            {
                _1528 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1558 = false;
    float _1588 = _1528;
    float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1592 = _958 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1596 = _994 + _1594;
    float _1598 = fma(_1592, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1602 = _1008 + _1600;
    float _1604 = fma(_1596, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1610 = _1598 + _1608;
    float _1612 = fma(_1602, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1616 = _1604 + _1614;
    float _1618 = _1610 * _1610;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1622 = _1612 + _1620;
    float _1624 = fma(_1616, _1616, _1618);
    float _1626 = fma(_1622, _1622, _1624);
    float _1628 = rsqrt(_1626);
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1632 = _1616 * _1630;
    float _1634 = _1622 * _1630;
    float _1636 = _1632 * _1632;
    float _1638 = _1634 * _1634;
    float _1640 = _1636 + _1638;
    float _1642 = sqrt(_1640);
    bool _1644 = _1642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1648 = _1642 + _1646;
    float _1650 = _1350;
    float _1652 = _1640;
    float _1654 = _1648;
    float _1656 = _1610;
    float _1658 = _1632;
    if (_1644)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1660;
    }
    float _1662 = _1650;
    if (_1644)
    {
        float _1664 = rsqrt(_1640);
        _1652 = _1664;
    }
    float _1666 = _1652;
    float _1668 = _1666;
    if (_1644)
    {
        float _1670 = _1648 * _1662;
        _1654 = _1670;
    }
    float _1672 = _1654;
    if (_1644)
    {
        float _1674 = _1672 * 0.15915493667125701904296875;
        _1520 = _1674;
    }
    float _1676 = _1520;
    float _1678 = _1622;
    float _1680 = _1676;
    if (_1644)
    {
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1690 = precise::max(0.0, _1688);
    float _1692 = _1662;
    float _1694 = _1690;
    if (_1644)
    {
        float _1696 = _1676 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        _1692 = _1698;
    }
    float _1700 = _1692;
    float _1702 = -_1630;
    float _1704 = -_1690;
    float _1706 = fma(_1610, _1702, _1704);
    if (_1644)
    {
        float _1708 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1708;
    }
    float _1710 = _1656;
    float _1712 = _1686;
    float _1714 = _1710;
    if (_1644)
    {
        float _1716 = fma(_1686, _1710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = _1718;
    if (!_1644)
    {
        _1714 = _1634;
    }
    float _1722 = _1714;
    float _1724 = _1722;
    float _1726 = _1700;
    if (_1644)
    {
        float _1728 = _1700 + (-1.0);
        _1694 = _1728;
    }
    float _1730 = _1694;
    if (_1644)
    {
        float _1732 = _1666 * _1718;
        _1048 = _1732;
    }
    float _1734 = _1048;
    if (!_1644)
    {
        _1720 = _1706;
    }
    float _1736 = _1720;
    float _1738 = _1736;
    if (_1644)
    {
        float _1740 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1740;
    }
    float _1742 = _1680;
    if (_1644)
    {
        float _1744 = _1632 * _1734;
        _1658 = _1744;
    }
    float _1746 = _1658;
    float _1748 = sqrt(_1626);
    if (!_1644)
    {
        _1668 = _1636;
    }
    float _1750 = _1668;
    float _1752 = _1750;
    if (_1644)
    {
        float _1754 = fma(_1706, _1700, _1742);
        _1738 = _1754;
    }
    float _1756 = _1738;
    if (_1644)
    {
        float _1758 = _1634 * _1734;
        _1724 = _1758;
    }
    float _1760 = _1724;
    if (_1644)
    {
        float _1762 = _1746 * _1746;
        _1752 = _1762;
    }
    float _1764 = _1752;
    if (!_1644)
    {
        _1726 = _1638;
    }
    float _1766 = _1726;
    float _1768 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1770 = _1766;
    if (_1644)
    {
        float _1772 = _1760 * _1760;
        _1770 = _1772;
    }
    float _1774 = _1770;
    float _1776 = fma(_1756, _1756, _1764);
    float _1778 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1768);
    float _1780 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1782 = _1776 + _1774;
    float _1784 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1786 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1780);
    float _1788 = rsqrt(_1782);
    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1792 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1790);
    float _1794 = precise::clamp(_1792, 0.0, 1.0);
    float _1796 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1778);
    float _1798 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1800 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1784);
    float _1802 = -_1794;
    float _1804 = _1802 + 1.0;
    float _1806 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1808 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1798);
    float _1810 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1800);
    float _1812 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1816 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1820 = abs(_1804);
    float _1822 = log2(_1820);
    float _1824 = -_1814;
    float _1826 = fma(_1824, _1606, 1.0);
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1830 = _1788 * _1746;
    float _1832 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1834 = _1788 * _1756;
    float _1836 = _1788 * _1760;
    float _1838 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1840 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1832);
    float _1842 = _1812 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1844 = log2(_1826);
    float _1846 = -_1838;
    float _1848 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1846);
    float _1850 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1840);
    float _1852 = -_1836;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1848);
    float _1856 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1850);
    float _1858 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1860 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1862 = fma(_1854, -0.5, 0.5);
    float _1864 = 1.0 / _1856;
    float _1866 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1860);
    float _1870 = fma(_1854, 0.5, 0.5);
    float _1872 = _1834 + 1.0;
    float _1874 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1876 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1878 = exp2(_1858);
    float _1880 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1882 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1876);
    float _1884 = _1844 * 0.693147182464599609375;
    float _1886 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1880);
    float _1888 = sqrt(_1862);
    float _1890 = fma(_1870, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = _1882 * _1864;
    float _1894 = _1886 * _1864;
    float _1896 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1898 = fma(_1870, _1890, -0.212114393711090087890625);
    float _1900 = fma(_1892, 0.5, 0.5);
    float _1902 = fma(_1894, -0.5, 0.5);
    float _1904 = -_1834;
    float _1906 = fma(_1878, _1872, _1904);
    float _1908 = fma(_1870, _1898, 1.570728778839111328125);
    float _1910 = fma(_1906, 0.5, 0.5);
    float _1912 = _1888 * 0.636619746685028076171875;
    float3 _5569 = float3(_1900, _1902, _1896);
    float _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5569, float3(0.0), isnan(_5569)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5569, float3(0.0), isnan(_5569)), level(0.0)).x;
    float3 _5580 = float3(_1900, _1902, _1896);
    float4 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5580, float3(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5580, float3(0.0), isnan(_5580)), level(0.0)).xyzw;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = _1917.w;
    float _1927 = -_1908;
    float _1929 = fma(_1912, _1927, 1.0);
    float2 _5601 = float2(_1929, _1910);
    float3 _1931 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5601, float2(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5601, float2(0.0), isnan(_5601)), level(0.0)).xyz;
    float _1933 = _1931.x;
    float _1935 = _1931.y;
    float _1937 = _1931.z;
    float _1939 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1941 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1943 = in.m_99.x;
    float _1945 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1947 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1939);
    float _1949 = -_922;
    float _1951 = _1949 + 1.0;
    float _1953 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1947);
    float _1955 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1957 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1959 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1955);
    float _1963 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1957);
    float _1965 = 1.0 / _1959;
    float _1967 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1961);
    out.m_101.x = _834;
    out.m_101.y = _1494;
    out.m_101.z = _804;
    float _1969 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1963);
    float _1971 = _1967 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_103.x = _1604;
    out.m_103.y = _1598;
    out.m_103.z = _1612;
    float _1973 = _1971 + _1959;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1886;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1856;
    float _1975 = _1973 * _1965;
    float _1977 = _1975 * 0.5;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1981 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1979);
    bool _1983 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    float _1993 = 1.0 / _1981;
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1997 = _1993 * _1995;
    float _1999 = abs(_1997);
    float _2001 = log2(_1999);
    float _2003 = _1842;
    float _2005 = _1856;
    float _2007 = _1882;
    float _2009 = _1886;
    if (!_1991)
    {
        float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2013 = _1997 + _2011;
        _2003 = _2013;
    }
    float _2015 = _2003;
    float _2017 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2019 = exp2(_2017);
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = _2019;
    if (!_1991)
    {
        _2025 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2027 = _2025;
    float _2029 = fma(_2023, -2.0, 3.0);
    float _2031 = _2023 * _2023;
    float _2033 = _2027;
    if (!_1991)
    {
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2037 = _2027 + _2035;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = _2031 * _2029;
    bool _2043 = _1997 <= 8000.0;
    bool _2045 = isnan(_1997);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan(8000.0);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = _2039;
    if (!_1991)
    {
        float _2057 = 1.0 / _2039;
        _2055 = _2057;
    }
    float _2059 = _2055;
    float _2061 = -_2041;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2041);
    float _2067 = exp2(_1941);
    float _2069 = _2053 * _2065;
    float _2071 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2073 = _1951 * _2071;
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = _1856 * 0.5;
    float _2079 = _1969 + _1856;
    float _2081 = -_2075;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2085 = _1882 + _1856;
    float _2087 = fma(_1886, -0.5, _2077);
    float _2089 = -_2067;
    float _2091 = _2089 + 1.0;
    float _2093 = _2083 * _1943;
    float _2095 = _2083;
    if (_1991)
    {
        _2095 = 1.0;
    }
    float _2097 = _2095;
    float _2099 = _2097;
    if (!_1991)
    {
        float _2101 = _2015 * _2059;
        float _2103 = precise::clamp(_2101, 0.0, 1.0);
        _2099 = _2103;
    }
    float _2105 = _2099;
    float _2107 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2109 = _2079 * 0.5;
    float _2111 = _2085 * 0.5;
    float _2113 = _2093 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2115 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2117 = isnan(_1748);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2123 = _2119 || _2121;
    out.m_105.x = _2111;
    out.m_105.y = _2087;
    out.m_105.z = _2109;
    out.m_105.w = _1856;
    out.m_107.x = _2113;
    if (!_2123)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2125 = _2005;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2123)
    {
        _2007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2131 = _2007;
    float _2133 = _2131;
    float _2135 = _2131;
    if (!_2123)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2137 = _2009;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_2123)
    {
        _850 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2143 = _850;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2123)
    {
        _1522 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2149 = _1522;
    float _2151 = _2107 * _1914;
    float _2153 = -_2107;
    float _2155 = _2153 + 1.0;
    float _2157 = _1925 * _2151;
    float _2159 = _1925 * _2155;
    float _2161 = _1937 * _2151;
    float _2163 = fma(_1933, _2157, _1919);
    float _2165 = fma(_1935, _2157, _1921);
    float _2167 = _2157;
    float _2169 = _2149;
    float _2171 = _2149;
    if (!_2123)
    {
        _2167 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2173 = _2167;
    float _2175 = fma(_1925, _2161, _1923);
    float _2177 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_109.x = _2163;
    out.m_109.y = _2165;
    out.m_109.z = _2175;
    out.m_109.w = _2159;
    bool _2179 = !_2123;
    float _2181 = _2173;
    float _2183 = _2173;
    if (!_2179)
    {
        bool _2185 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1748);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1748 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2135 = _2237;
            _2171 = _2241;
            _2129 = _2233;
            _2147 = _2239;
            _2141 = _2235;
            _2183 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1748);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2127;
            _2129 = _2257;
            if (!_2255)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2133;
            _2135 = _2259;
            if (!_2255)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2139;
            _2141 = _2261;
            if (!_2255)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2145;
            _2147 = _2263;
            if (!_2255)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2169;
            _2171 = _2265;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2181;
            bool _2269 = !_2255;
            _2183 = _2267;
            if (!_2269)
            {
                bool _2271 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1748);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1748 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2135 = _2323;
                    _2171 = _2327;
                    _2129 = _2319;
                    _2147 = _2325;
                    _2141 = _2321;
                    _2183 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2135;
    float _2333 = _2171;
    float _2335 = _2129;
    float _2337 = _2147;
    float _2339 = _2141;
    float _2341 = _2183;
    float _2343 = fma(_1490, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = _2177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = -_2335;
    float _2355 = _2353 + _2337;
    float _2357 = fma(_2345, _2349, _2331);
    out.m_111.x = 0.0;
    float _2359 = -_2339;
    float _2361 = _2359 + _2341;
    float _2363 = fma(_2345, _2355, _2335);
    float _2365 = _2357 * 0.586610972881317138671875;
    out.m_53.x = _2351;
    bool _2367 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2369 = fma(_2345, _2361, _2339);
    float _2371 = fma(_2363, 0.298911988735198974609375, _2365);
    bool _2373 = _2105 > 0.0;
    bool _2375 = isnan(_2105);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2369, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2363 + _2385;
    float _2389 = -_2383;
    float _2391 = _2357 + _2389;
    float _2393 = -_2383;
    float _2395 = _2369 + _2393;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2367;
    if (!_2403)
    {
        float _2405 = -_1598;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1604;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1612;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _1490 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_1488, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_1504, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _2481;
        out.m_111.y = _2483;
        out.m_111.z = _2485;
    }
    out.m_83.x = _2397;
    out.m_83.y = _2399;
    out.m_83.z = _2401;
    if (_2381)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1558 = false;
    bool _636 = false;
    bool _494 = false;
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
        float _2544 = as_type<float>(_146);
        out.gl_Position.z = _2544;
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
        float _2612 = as_type<float>(_182);
        out.gl_Position.z = _2612;
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
    float _492;
    if (!_474)
    {
        float _476 = in.m_57.x;
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _480 = _476 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _484 = _482 * _478;
        float _486 = floor(_484);
        float _488 = -_486;
        float _490 = _484 + _488;
        _492 = _490;
        _494 = true;
    }
    else
    {
        float _496 = float(_130);
        float _498 = 1.0 / _496;
        float _500 = _164 * _498;
        _492 = _500;
    }
    _494 = false;
    float _502 = _492;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _502 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = isnan(_502);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _530 = isnan(_502);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _540;
    bool _544 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _546 = isnan(_502);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = 1.0 / _510;
    float _558 = -_522;
    float _560 = _558 + 1.0;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _502 + _562;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _568 = _538 * _560;
    float _570 = -_538;
    float _572 = _570 + 1.0;
    float _574 = 1.0 / _526;
    float _576 = _542 * _556;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = fma(_576, _506, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _580 * _574;
    float _586 = -_554;
    float _588 = _586 + 1.0;
    float _590 = _582 * _568;
    float _592 = fma(_584, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _594 = _522 * _588;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _598 = fma(_592, _594, _596);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _606 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[117].x, _598);
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _608;
    out.m_61.y = _610;
    out.m_61.z = _612;
    out.m_61.w = _614;
    bool _616 = !_566;
    float _634;
    if (!_616)
    {
        float _618 = in.m_57.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_130);
        float _640 = 1.0 / _638;
        float _642 = _164 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_50.x;
    float _648 = in.m_50.y;
    float _650 = in.m_50.z;
    float _652 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _654 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _656 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _658 = in.m_63.x;
    float _660 = in.m_63.y;
    float _662 = in.m_63.z;
    float _664 = _652 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _666 = in.m_65.x;
    float _668 = in.m_65.y;
    float _670 = in.m_65.z;
    float _672 = in.m_67.x;
    float _674 = in.m_67.y;
    float _676 = in.m_67.z;
    float _678 = _648 * _660;
    float _680 = _648 * _668;
    float _682 = fma(_646, _658, _678);
    float _684 = _648 * _674;
    float _686 = fma(_646, _666, _680);
    float _688 = fma(_650, _662, _682);
    float _690 = fma(_646, _672, _684);
    float _692 = fma(_650, _670, _686);
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = fma(_650, _676, _690);
    float _698 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _694 + _700;
    float _704 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _698 + _706;
    float _710 = _702 * _702;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _704 + _712;
    float _716 = fma(_708, _708, _710);
    float _718 = fma(_714, _714, _716);
    float _720 = sqrt(_718);
    float _722 = rsqrt(_718);
    float _724 = _720 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _726 = precise::min(_664, _724);
    float _728 = _722 * _726;
    float _730 = _702 * _728;
    float _732 = _708 * _728;
    float _734 = _714 * _728;
    float _736 = -_730;
    float _738 = _702 + _736;
    float _740 = -_732;
    float _742 = _708 + _740;
    float _744 = _738 * _738;
    float _746 = -_734;
    float _748 = _714 + _746;
    float _750 = in.m_69.x;
    float _752 = in.m_69.y;
    float _754 = in.m_69.z;
    float _756 = fma(_742, _742, _744);
    float _758 = fma(_748, _748, _756);
    float _760 = sqrt(_758);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _764 = _722 * _760;
    float _766 = _654 * _764;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _750);
    float _770 = _652 * _764;
    float _772 = _656 * _764;
    float _774 = _766 * _762;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _754);
    float _778 = _770 * _768;
    float _780 = _774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _782 = _772 * _776;
    float _784 = _774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _786 = _774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].x, _780);
    float _790 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].x, _784);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _786);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _788);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _790);
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _792);
    float _800 = _794 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _802 = -_734;
    float _804 = _704 + _802;
    float _806 = _796 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _808 = _798 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _810 = _704 + _800;
    float _812 = _698 + _806;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _810 + _816;
    float _820 = _694 + _808;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _824 = _812 + _822;
    float _826 = floor(_814);
    float _828 = _818 * _818;
    float _830 = fma(_824, _824, _828);
    float _832 = -_732;
    float _834 = _698 + _832;
    float _836 = sqrt(_830);
    float _838 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _840 = floor(_838);
    bool _842 = _836 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = 0.0;
    float _846 = _812;
    float _848 = _810;
    float _850 = _804;
    if (!_842)
    {
        _844 = _820;
    }
    float _852 = _844;
    bool _854 = !_842;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _836 + _860;
        float _864 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = _862 * _858;
        float _868 = rsqrt(_830);
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = cos(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _874 + (-1.0);
        float _882 = _880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = fma(_878, _864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _886 = fma(_820, _874, _882);
        float _888 = _868 * _884;
        float _890 = fma(_824, _888, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _892 = fma(_818, _888, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _846 = _890;
        _848 = _892;
        _856 = _886;
    }
    float _894 = _846;
    float _896 = _848;
    float _898 = _856;
    float _900 = fma(_894, 6.2500002968590706586837768554688e-05, 0.5);
    float _902 = fma(_896, 6.2500002968590706586837768554688e-05, 0.5);
    float _904 = -_840;
    float _906 = _838 + _904;
    float _908 = -_826;
    float _910 = _814 + _908;
    float2 _3799 = float2(_900, _902);
    float3 _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3799, float2(0.0), isnan(_3799)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3799, float2(0.0), isnan(_3799)), level(0.0)).xyz;
    float _916 = _914.x;
    float _918 = _914.y;
    float _920 = _914.z;
    float2 _3815 = float2(_906, _910);
    float _922 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3815, float2(0.0), isnan(_3815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3815, float2(0.0), isnan(_3815)), level(0.0)).x;
    float _924 = in.m_57.w;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _928 = in.m_71.y;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _936 = _934 != 0;
    float _938 = in.m_57.y;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _942 = _940 != 0;
    float _944 = 1.0 / _932;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _948 = _946 != 0;
    float _950 = in.m_57.x;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _954 = _952 != 0;
    float _956 = -_730;
    float _958 = _956 + _898;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _962 = _960 != 0;
    float _964 = in.m_57.z;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _968 = in.m_73.w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _970;
    float _974 = in.m_71.x;
    bool _976 = _924 > 0.5;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = in.m_75.x;
    float _982 = in.m_75.y;
    float _984 = in.m_75.z;
    float _986 = in.m_75.w;
    float _988 = -_928;
    float _990 = _988 + 1.0;
    float _992 = -_732;
    float _994 = _992 + _894;
    bool _996 = _938 > 0.5;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1000 = _976 ? as_type<int>(_990) : as_type<int>(_928);
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1004 = _996 ? as_type<int>(_990) : as_type<int>(_928);
    float _1006 = -_734;
    float _1008 = _1006 + _896;
    float _1010 = _962 ? as_type<float>(_1000) : _928;
    float _1012 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1002);
    float _1014 = _936 ? as_type<float>(_1004) : _928;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1020 = _1018 != 0;
    float _1022 = _950 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_77.w = _968;
    bool _1024 = _964 > 0.5;
    float _1026 = -_1016;
    float _1028 = fma(_1022, 2.0, _1026);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1032 = _1030 != 0;
    int _1034 = 0;
    float _1036 = _928;
    bool _1038 = _1020;
    float _1040 = _978;
    float _1042 = _974;
    float _1044 = _964;
    float _1046 = _938;
    float _1048 = _1008;
    if (_954)
    {
        float _1050 = -_974;
        float _1052 = _1050 + 1.0;
        _1034 = as_type<int>(_1052);
    }
    int _1054 = _1034;
    float _1056 = -_164;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1028);
    float _1060 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1062 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1064 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1020)
    {
        float _1066 = _1024 ? _990 : _928;
        _1036 = _1066;
    }
    float _1068 = _1036;
    float _1070 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1060);
    float _1072 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1062);
    float _1074 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1064);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1078 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1070);
    float _1080 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1072);
    float _1082 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1084 = _972 * _944;
    float _1086 = _926 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1090 = _644 + _1088;
    out.m_79.x = _1078;
    out.m_79.y = _1080;
    out.m_79.z = _1082;
    float _1092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1094 = fma(_1084, _1090, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1096 = _938 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1098 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1100 = isnan(_644);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1112 = _1078;
    float _1114 = _1086;
    if (_942)
    {
        bool _1116 = _950 > 0.5;
        _1038 = _1116;
    }
    bool _1118 = _1038;
    float _1120 = fma(_1096, -2.0, _978);
    float _1122 = fma(_1086, _1014, -0.5);
    float _1124 = _1122;
    if (!_942)
    {
        _1040 = _974;
    }
    float _1126 = _1040;
    float _1128 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1076);
    float _1130 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1120);
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1134 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1136 = isnan(_644);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1108;
    float _1148 = _1146 + 1.0;
    float _1150 = _1126;
    if (_1032)
    {
        _1112 = _950;
    }
    float _1152 = _1112;
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1132);
    float _1156 = _1152;
    if (!_1032)
    {
        _1156 = _964;
    }
    float _1158 = _1156;
    float _1160 = _1144 * _1148;
    float _1162 = _966 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1164 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1154);
    int _1166 = as_type<int>(_1164);
    if (!_1032)
    {
        _1114 = _938;
    }
    float _1168 = _1114;
    float _1170 = _1094 * _1160;
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1174 = -_1130;
    float _1176 = fma(_1164, _1122, _1174);
    float _1178 = _1168;
    float _1180 = _1170;
    if (_942)
    {
        float _1182 = -_974;
        float _1184 = _1182 + 1.0;
        _1166 = as_type<int>(_1184);
    }
    int _1186 = _1166;
    float _1188 = fma(_1010, _1162, -0.5);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1192 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1194 = as_type<int>(_1092);
    if (_948)
    {
        float _1196 = -_974;
        float _1198 = _1196 + 1.0;
        _1194 = as_type<int>(_1198);
    }
    int _1200 = _1194;
    if (_942)
    {
        float _1202 = _1118 ? as_type<float>(_1186) : _974;
        _1150 = _1202;
    }
    float _1204 = _1150;
    float _1206 = -_1190;
    float _1208 = fma(_1172, 2.0, _1206);
    if (!_948)
    {
        _1124 = _974;
    }
    float _1210 = _1124;
    float _1212 = in.m_81.x;
    float _1214 = in.m_81.y;
    float _1216 = in.m_81.z;
    float _1218 = _1210;
    if (_948)
    {
        float _1220 = _1024 ? as_type<float>(_1200) : _974;
        _1218 = _1220;
    }
    float _1222 = _1218;
    float _1224 = fma(_1192, _1068, -0.5);
    bool _1226 = _752 != 0.0;
    bool _1228 = isnan(_752);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan(0.0);
    bool _1234 = _1230 || _1232;
    float _1236 = -_1144;
    float _1238 = _1236 + 1.0;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1242 = _750 == 0.0;
    bool _1244 = !_1234;
    bool _1246 = _1242 && _1244;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1170);
    if (_1032)
    {
        _1178 = _950;
    }
    float _1250 = _1178;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1254 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1248);
    bool _1256 = _754 == 0.0;
    bool _1258 = _1256 && _1246;
    float _1260 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1252);
    float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1266 = _1262;
    float _1268 = _1250;
    if (_954)
    {
        float _1270 = _996 ? as_type<float>(_1054) : _974;
        _1042 = _1270;
    }
    float _1272 = _1042;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1276 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[88].z, _998);
    float _1278 = -_1264;
    float _1280 = fma(_1262, 2.0, _1278);
    if (!_1032)
    {
        _1266 = _964;
    }
    float _1282 = _1266;
    float _1284 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1286 = _1282;
    if (_1032)
    {
        _1286 = _938;
    }
    float _1288 = _1286;
    out.m_83.w = _726;
    float _1290 = _1288;
    if (!_1032)
    {
        _1180 = _964;
    }
    float _1292 = _1180;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1296 = _1292;
    float _1298 = _1212;
    if (_1258)
    {
        _1268 = _1212;
    }
    float _1300 = _1268;
    float _1302 = fma(_1284, _1204, -0.5);
    float _1304 = _1300;
    if (_1032)
    {
        _1044 = _938;
    }
    float _1306 = _1044;
    out.m_85.x = _770;
    float _1308 = _1306;
    if (!_1032)
    {
        _1308 = _950;
    }
    float _1310 = _1308;
    float _1312 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1110);
    if (_1258)
    {
        _1290 = _1300;
    }
    float _1314 = _1290;
    float _1316 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1318 = _1314;
    if (!_1258)
    {
        _1304 = _1212;
    }
    float _1320 = _1304;
    float _1322 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1312);
    if (_1032)
    {
        _1296 = _938;
    }
    float _1324 = _1296;
    float _1326 = fma(_1316, _1222, -0.5);
    if (_1258)
    {
        _1046 = _1214;
    }
    float _1328 = _1046;
    float _1330 = _1328;
    if (!_1258)
    {
        float _1332 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1320);
        _1318 = _1332;
    }
    float _1334 = _1318;
    float _1336 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1012);
    float _1338 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1258)
    {
        _1298 = _1216;
    }
    float _1340 = _1298;
    float _1342 = _1340;
    if (!_1258)
    {
        float _1344 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1330 = _1344;
    }
    float _1346 = _1330;
    if (!_1258)
    {
        float _1348 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1342 = _1348;
    }
    float _1350 = _1342;
    float _1352 = fma(_1338, _1272, -0.5);
    float _1354 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1260);
    float _1356 = -_164;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1280);
    float _1360 = -_164;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1208);
    float _1364 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1276);
    float _1366 = fma(_1336, _1302, _1058);
    float _1368 = _984 * _1320;
    float _1370 = fma(_1354, _1326, _1358);
    float _1372 = fma(_1364, _1352, _1362);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1376 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1378 = -_1368;
    float _1380 = fma(_980, _1216, _1378);
    float _1382 = _982 * _1216;
    float _1384 = fma(_1376, -2.0, _1374);
    float _1386 = _980 * _1214;
    float _1388 = -_1382;
    float _1390 = fma(_984, _1214, _1388);
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1396 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1400 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1402 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1384);
    float _1404 = fma(_1396, -2.0, _1394);
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1408 = -_1386;
    float _1410 = fma(_982, _1320, _1408);
    float _1412 = -_1402;
    float _1414 = fma(_1322, _1188, _1412);
    float _1416 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1128);
    float _1418 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1404);
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _958 + _1420;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1432 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1434 = _1380 * _986;
    float _1436 = _1390 * _986;
    float _1438 = _1410 * _986;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _994 + _1440;
    float _1444 = _1422 * _1422;
    out.m_87.x = _1424;
    out.m_87.y = _1426;
    out.m_87.z = _1428;
    out.m_87.w = _1400;
    float _1446 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1430);
    float _1448 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1432);
    float _1450 = fma(_1442, _1442, _1444);
    float _1452 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1454 = -_1418;
    float _1456 = fma(_1416, _1224, _1454);
    float _1458 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1460 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1452);
    float _1466 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1468 = _1372 + 0.5;
    float _1470 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    float _1472 = _1414 + 0.5;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1476 = _1008 + _1474;
    float _1478 = _1176 + 0.5;
    float _1480 = _1366 + 0.5;
    float _1482 = _1370 + 0.5;
    float _1484 = fma(_1476, _1476, _1450);
    float _1486 = _1456 + 0.5;
    float _1488 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1464);
    float _1490 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    out.m_89.x = _1480;
    out.m_89.y = _1478;
    out.m_89.z = _1482;
    out.m_89.w = _1472;
    float _1492 = -_730;
    float _1494 = _694 + _1492;
    float _1496 = sqrt(_1484);
    out.m_91.x = _1468;
    out.m_91.y = _1486;
    float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1500 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1466);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1504 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1506 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1498);
    bool _1508 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1510 = isnan(_1496);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1516 = _1512 || _1514;
    out.m_93.x = _1488;
    out.m_93.y = _1490;
    out.m_93.z = _1504;
    out.m_95.x = _1500;
    out.m_95.y = _1506;
    out.m_95.z = _1502;
    float _1518 = _1466;
    float _1520 = _1446;
    float _1522 = _1494;
    if (!_1516)
    {
        _1518 = 1.0;
    }
    float _1524 = _1518;
    out.m_97.x = _916;
    out.m_97.y = _918;
    out.m_97.z = _920;
    bool _1526 = !_1516;
    float _1528 = _1524;
    if (!_1526)
    {
        bool _1530 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1532 = isnan(_1496);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1538 = _1534 || _1536;
        if (!_1538)
        {
            float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1542 = _1496 + _1540;
            float _1544 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1546 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1544;
            float _1548 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1550 = _1548 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1552 = 1.0 / _1546;
            float _1554 = _1542 * _1552;
            float _1556 = fma(_1554, _1550, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1528 = _1556;
            _1558 = true;
        }
        else
        {
            bool _1560 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1562 = isnan(_1496);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1568 = _1564 || _1566;
            if (!_1568)
            {
                float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1572 = _1496 + _1570;
                float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1576 = _1574 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1580 = _1578 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1582 = 1.0 / _1576;
                float _1584 = _1572 * _1582;
                float _1586 = fma(_1584, _1580, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1528 = _1586;
                _1558 = true;
            }
            else
            {
                _1528 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1558 = false;
    float _1588 = _1528;
    float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1592 = _958 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1596 = _994 + _1594;
    float _1598 = fma(_1592, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1602 = _1008 + _1600;
    float _1604 = fma(_1596, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1610 = _1598 + _1608;
    float _1612 = fma(_1602, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1616 = _1604 + _1614;
    float _1618 = _1610 * _1610;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1622 = _1612 + _1620;
    float _1624 = fma(_1616, _1616, _1618);
    float _1626 = fma(_1622, _1622, _1624);
    float _1628 = rsqrt(_1626);
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1632 = _1616 * _1630;
    float _1634 = _1622 * _1630;
    float _1636 = _1632 * _1632;
    float _1638 = _1634 * _1634;
    float _1640 = _1636 + _1638;
    float _1642 = sqrt(_1640);
    bool _1644 = _1642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1648 = _1642 + _1646;
    float _1650 = _1350;
    float _1652 = _1640;
    float _1654 = _1648;
    float _1656 = _1610;
    float _1658 = _1632;
    if (_1644)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1660;
    }
    float _1662 = _1650;
    if (_1644)
    {
        float _1664 = rsqrt(_1640);
        _1652 = _1664;
    }
    float _1666 = _1652;
    float _1668 = _1666;
    if (_1644)
    {
        float _1670 = _1648 * _1662;
        _1654 = _1670;
    }
    float _1672 = _1654;
    if (_1644)
    {
        float _1674 = _1672 * 0.15915493667125701904296875;
        _1520 = _1674;
    }
    float _1676 = _1520;
    float _1678 = _1622;
    float _1680 = _1676;
    if (_1644)
    {
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1690 = precise::max(0.0, _1688);
    float _1692 = _1662;
    float _1694 = _1690;
    if (_1644)
    {
        float _1696 = _1676 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        _1692 = _1698;
    }
    float _1700 = _1692;
    float _1702 = -_1630;
    float _1704 = -_1690;
    float _1706 = fma(_1610, _1702, _1704);
    if (_1644)
    {
        float _1708 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1708;
    }
    float _1710 = _1656;
    float _1712 = _1686;
    float _1714 = _1710;
    if (_1644)
    {
        float _1716 = fma(_1686, _1710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = _1718;
    if (!_1644)
    {
        _1714 = _1634;
    }
    float _1722 = _1714;
    float _1724 = _1722;
    float _1726 = _1700;
    if (_1644)
    {
        float _1728 = _1700 + (-1.0);
        _1694 = _1728;
    }
    float _1730 = _1694;
    if (_1644)
    {
        float _1732 = _1666 * _1718;
        _1048 = _1732;
    }
    float _1734 = _1048;
    if (!_1644)
    {
        _1720 = _1706;
    }
    float _1736 = _1720;
    float _1738 = _1736;
    if (_1644)
    {
        float _1740 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1740;
    }
    float _1742 = _1680;
    if (_1644)
    {
        float _1744 = _1632 * _1734;
        _1658 = _1744;
    }
    float _1746 = _1658;
    float _1748 = sqrt(_1626);
    if (!_1644)
    {
        _1668 = _1636;
    }
    float _1750 = _1668;
    float _1752 = _1750;
    if (_1644)
    {
        float _1754 = fma(_1706, _1700, _1742);
        _1738 = _1754;
    }
    float _1756 = _1738;
    if (_1644)
    {
        float _1758 = _1634 * _1734;
        _1724 = _1758;
    }
    float _1760 = _1724;
    if (_1644)
    {
        float _1762 = _1746 * _1746;
        _1752 = _1762;
    }
    float _1764 = _1752;
    if (!_1644)
    {
        _1726 = _1638;
    }
    float _1766 = _1726;
    float _1768 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1770 = _1766;
    if (_1644)
    {
        float _1772 = _1760 * _1760;
        _1770 = _1772;
    }
    float _1774 = _1770;
    float _1776 = fma(_1756, _1756, _1764);
    float _1778 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1768);
    float _1780 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1782 = _1776 + _1774;
    float _1784 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1786 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1780);
    float _1788 = rsqrt(_1782);
    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1792 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1790);
    float _1794 = precise::clamp(_1792, 0.0, 1.0);
    float _1796 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1778);
    float _1798 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1800 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1784);
    float _1802 = -_1794;
    float _1804 = _1802 + 1.0;
    float _1806 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1808 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1798);
    float _1810 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1800);
    float _1812 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1816 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1820 = abs(_1804);
    float _1822 = log2(_1820);
    float _1824 = -_1814;
    float _1826 = fma(_1824, _1606, 1.0);
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1830 = _1788 * _1746;
    float _1832 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1834 = _1788 * _1756;
    float _1836 = _1788 * _1760;
    float _1838 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1840 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1832);
    float _1842 = _1812 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1844 = log2(_1826);
    float _1846 = -_1838;
    float _1848 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1846);
    float _1850 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1840);
    float _1852 = -_1836;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1848);
    float _1856 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1850);
    float _1858 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1860 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1862 = fma(_1854, -0.5, 0.5);
    float _1864 = 1.0 / _1856;
    float _1866 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1860);
    float _1870 = fma(_1854, 0.5, 0.5);
    float _1872 = _1834 + 1.0;
    float _1874 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1876 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1878 = exp2(_1858);
    float _1880 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1882 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1876);
    float _1884 = _1844 * 0.693147182464599609375;
    float _1886 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1880);
    float _1888 = sqrt(_1862);
    float _1890 = fma(_1870, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = _1882 * _1864;
    float _1894 = _1886 * _1864;
    float _1896 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1898 = fma(_1870, _1890, -0.212114393711090087890625);
    float _1900 = fma(_1892, 0.5, 0.5);
    float _1902 = fma(_1894, -0.5, 0.5);
    float _1904 = -_1834;
    float _1906 = fma(_1878, _1872, _1904);
    float _1908 = fma(_1870, _1898, 1.570728778839111328125);
    float _1910 = fma(_1906, 0.5, 0.5);
    float _1912 = _1888 * 0.636619746685028076171875;
    float3 _5569 = float3(_1900, _1902, _1896);
    float _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5569, float3(0.0), isnan(_5569)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5569, float3(0.0), isnan(_5569)), level(0.0)).x;
    float3 _5580 = float3(_1900, _1902, _1896);
    float4 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5580, float3(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5580, float3(0.0), isnan(_5580)), level(0.0)).xyzw;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = _1917.w;
    float _1927 = -_1908;
    float _1929 = fma(_1912, _1927, 1.0);
    float2 _5601 = float2(_1929, _1910);
    float3 _1931 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5601, float2(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5601, float2(0.0), isnan(_5601)), level(0.0)).xyz;
    float _1933 = _1931.x;
    float _1935 = _1931.y;
    float _1937 = _1931.z;
    float _1939 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1941 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1943 = in.m_99.x;
    float _1945 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1947 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1939);
    float _1949 = -_922;
    float _1951 = _1949 + 1.0;
    float _1953 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1947);
    float _1955 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1957 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1959 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1955);
    float _1963 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1957);
    float _1965 = 1.0 / _1959;
    float _1967 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1961);
    out.m_101.x = _834;
    out.m_101.y = _1494;
    out.m_101.z = _804;
    float _1969 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1963);
    float _1971 = _1967 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_103.x = _1604;
    out.m_103.y = _1598;
    out.m_103.z = _1612;
    float _1973 = _1971 + _1959;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1886;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1856;
    float _1975 = _1973 * _1965;
    float _1977 = _1975 * 0.5;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1981 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1979);
    bool _1983 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    float _1993 = 1.0 / _1981;
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1997 = _1993 * _1995;
    float _1999 = abs(_1997);
    float _2001 = log2(_1999);
    float _2003 = _1842;
    float _2005 = _1856;
    float _2007 = _1882;
    float _2009 = _1886;
    if (!_1991)
    {
        float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2013 = _1997 + _2011;
        _2003 = _2013;
    }
    float _2015 = _2003;
    float _2017 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2019 = exp2(_2017);
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = _2019;
    if (!_1991)
    {
        _2025 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2027 = _2025;
    float _2029 = fma(_2023, -2.0, 3.0);
    float _2031 = _2023 * _2023;
    float _2033 = _2027;
    if (!_1991)
    {
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2037 = _2027 + _2035;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = _2031 * _2029;
    bool _2043 = _1997 <= 8000.0;
    bool _2045 = isnan(_1997);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan(8000.0);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = _2039;
    if (!_1991)
    {
        float _2057 = 1.0 / _2039;
        _2055 = _2057;
    }
    float _2059 = _2055;
    float _2061 = -_2041;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2041);
    float _2067 = exp2(_1941);
    float _2069 = _2053 * _2065;
    float _2071 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2073 = _1951 * _2071;
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = _1856 * 0.5;
    float _2079 = _1969 + _1856;
    float _2081 = -_2075;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2085 = _1882 + _1856;
    float _2087 = fma(_1886, -0.5, _2077);
    float _2089 = -_2067;
    float _2091 = _2089 + 1.0;
    float _2093 = _2083 * _1943;
    float _2095 = _2083;
    if (_1991)
    {
        _2095 = 1.0;
    }
    float _2097 = _2095;
    float _2099 = _2097;
    if (!_1991)
    {
        float _2101 = _2015 * _2059;
        float _2103 = precise::clamp(_2101, 0.0, 1.0);
        _2099 = _2103;
    }
    float _2105 = _2099;
    float _2107 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2109 = _2079 * 0.5;
    float _2111 = _2085 * 0.5;
    float _2113 = _2093 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2115 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2117 = isnan(_1748);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2123 = _2119 || _2121;
    out.m_105.x = _2111;
    out.m_105.y = _2087;
    out.m_105.z = _2109;
    out.m_105.w = _1856;
    out.m_107.x = _2113;
    if (!_2123)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2125 = _2005;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2123)
    {
        _2007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2131 = _2007;
    float _2133 = _2131;
    float _2135 = _2131;
    if (!_2123)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2137 = _2009;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_2123)
    {
        _850 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2143 = _850;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2123)
    {
        _1522 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2149 = _1522;
    float _2151 = _2107 * _1914;
    float _2153 = -_2107;
    float _2155 = _2153 + 1.0;
    float _2157 = _1925 * _2151;
    float _2159 = _1925 * _2155;
    float _2161 = _1937 * _2151;
    float _2163 = fma(_1933, _2157, _1919);
    float _2165 = fma(_1935, _2157, _1921);
    float _2167 = _2157;
    float _2169 = _2149;
    float _2171 = _2149;
    if (!_2123)
    {
        _2167 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2173 = _2167;
    float _2175 = fma(_1925, _2161, _1923);
    float _2177 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_109.x = _2163;
    out.m_109.y = _2165;
    out.m_109.z = _2175;
    out.m_109.w = _2159;
    bool _2179 = !_2123;
    float _2181 = _2173;
    float _2183 = _2173;
    if (!_2179)
    {
        bool _2185 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1748);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1748 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2135 = _2237;
            _2171 = _2241;
            _2129 = _2233;
            _2147 = _2239;
            _2141 = _2235;
            _2183 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1748);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2127;
            _2129 = _2257;
            if (!_2255)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2133;
            _2135 = _2259;
            if (!_2255)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2139;
            _2141 = _2261;
            if (!_2255)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2145;
            _2147 = _2263;
            if (!_2255)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2169;
            _2171 = _2265;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2181;
            bool _2269 = !_2255;
            _2183 = _2267;
            if (!_2269)
            {
                bool _2271 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1748);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1748 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2135 = _2323;
                    _2171 = _2327;
                    _2129 = _2319;
                    _2147 = _2325;
                    _2141 = _2321;
                    _2183 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2135;
    float _2333 = _2171;
    float _2335 = _2129;
    float _2337 = _2147;
    float _2339 = _2141;
    float _2341 = _2183;
    float _2343 = fma(_1490, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = _2177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = -_2335;
    float _2355 = _2353 + _2337;
    float _2357 = fma(_2345, _2349, _2331);
    out.m_111.x = 0.0;
    float _2359 = -_2339;
    float _2361 = _2359 + _2341;
    float _2363 = fma(_2345, _2355, _2335);
    float _2365 = _2357 * 0.586610972881317138671875;
    out.m_53.x = _2351;
    bool _2367 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2369 = fma(_2345, _2361, _2339);
    float _2371 = fma(_2363, 0.298911988735198974609375, _2365);
    bool _2373 = _2105 > 0.0;
    bool _2375 = isnan(_2105);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2369, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2363 + _2385;
    float _2389 = -_2383;
    float _2391 = _2357 + _2389;
    float _2393 = -_2383;
    float _2395 = _2369 + _2393;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2367;
    if (!_2403)
    {
        float _2405 = -_1598;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1604;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1612;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _1490 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_1488, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_1504, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _2481;
        out.m_111.y = _2483;
        out.m_111.z = _2485;
    }
    out.m_83.x = _2397;
    out.m_83.y = _2399;
    out.m_83.z = _2401;
    if (_2381)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
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
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2245 = false;
    bool _1558 = false;
    bool _636 = false;
    bool _494 = false;
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
        float _2544 = as_type<float>(_146);
        out.gl_Position.z = _2544;
    }
    if (!_134)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2612 = as_type<float>(_182);
        out.gl_Position.z = _2612;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _492;
    if (!_474)
    {
        float _476 = in.m_57.x;
        float _478 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _480 = _476 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _482 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[11].y, _164);
        float _484 = _482 * _478;
        float _486 = floor(_484);
        float _488 = -_486;
        float _490 = _484 + _488;
        _492 = _490;
        _494 = true;
    }
    else
    {
        float _496 = float(_130);
        float _498 = 1.0 / _496;
        float _500 = _164 * _498;
        _492 = _500;
    }
    _494 = false;
    float _502 = _492;
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _506 = _502 + _504;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _512 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = isnan(_502);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _526 = _524 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _528 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _530 = isnan(_502);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _542 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _540;
    bool _544 = _502 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _546 = isnan(_502);
    bool _548 = _544 || _546;
    bool _550 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _552 = _548 || _550;
    float _554 = float(_552);
    float _556 = 1.0 / _510;
    float _558 = -_522;
    float _560 = _558 + 1.0;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _502 + _562;
    bool _566 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _568 = _538 * _560;
    float _570 = -_538;
    float _572 = _570 + 1.0;
    float _574 = 1.0 / _526;
    float _576 = _542 * _556;
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _580 = _578 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _582 = fma(_576, _506, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _584 = _580 * _574;
    float _586 = -_554;
    float _588 = _586 + 1.0;
    float _590 = _582 * _568;
    float _592 = fma(_584, _564, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _594 = _522 * _588;
    float _596 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[115].x, _590);
    float _598 = fma(_592, _594, _596);
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _606 = fma(_554, (*spvDescriptorSet0.vp_c9)._m0[117].x, _598);
    float _608 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _606 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _608;
    out.m_61.y = _610;
    out.m_61.z = _612;
    out.m_61.w = _614;
    bool _616 = !_566;
    float _634;
    if (!_616)
    {
        float _618 = in.m_57.x;
        float _620 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _622 = _618 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _624 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[11].w, _164);
        float _626 = _624 * _620;
        float _628 = floor(_626);
        float _630 = -_628;
        float _632 = _626 + _630;
        _634 = _632;
        _636 = true;
    }
    else
    {
        float _638 = float(_130);
        float _640 = 1.0 / _638;
        float _642 = _164 * _640;
        _634 = _642;
    }
    _636 = false;
    float _644 = _634;
    float _646 = in.m_50.x;
    float _648 = in.m_50.y;
    float _650 = in.m_50.z;
    float _652 = _468 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _654 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _656 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _658 = in.m_63.x;
    float _660 = in.m_63.y;
    float _662 = in.m_63.z;
    float _664 = _652 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _666 = in.m_65.x;
    float _668 = in.m_65.y;
    float _670 = in.m_65.z;
    float _672 = in.m_67.x;
    float _674 = in.m_67.y;
    float _676 = in.m_67.z;
    float _678 = _648 * _660;
    float _680 = _648 * _668;
    float _682 = fma(_646, _658, _678);
    float _684 = _648 * _674;
    float _686 = fma(_646, _666, _680);
    float _688 = fma(_650, _662, _682);
    float _690 = fma(_646, _672, _684);
    float _692 = fma(_650, _670, _686);
    float _694 = _688 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _696 = fma(_650, _676, _690);
    float _698 = _692 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _700 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _702 = _694 + _700;
    float _704 = _696 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _708 = _698 + _706;
    float _710 = _702 * _702;
    float _712 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _714 = _704 + _712;
    float _716 = fma(_708, _708, _710);
    float _718 = fma(_714, _714, _716);
    float _720 = sqrt(_718);
    float _722 = rsqrt(_718);
    float _724 = _720 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _726 = precise::min(_664, _724);
    float _728 = _722 * _726;
    float _730 = _702 * _728;
    float _732 = _708 * _728;
    float _734 = _714 * _728;
    float _736 = -_730;
    float _738 = _702 + _736;
    float _740 = -_732;
    float _742 = _708 + _740;
    float _744 = _738 * _738;
    float _746 = -_734;
    float _748 = _714 + _746;
    float _750 = in.m_69.x;
    float _752 = in.m_69.y;
    float _754 = in.m_69.z;
    float _756 = fma(_742, _742, _744);
    float _758 = fma(_748, _748, _756);
    float _760 = sqrt(_758);
    float _762 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _752);
    float _764 = _722 * _760;
    float _766 = _654 * _764;
    float _768 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _750);
    float _770 = _652 * _764;
    float _772 = _656 * _764;
    float _774 = _766 * _762;
    float _776 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _754);
    float _778 = _770 * _768;
    float _780 = _774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _782 = _772 * _776;
    float _784 = _774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _786 = _774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _788 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[26].x, _780);
    float _790 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[24].x, _784);
    float _792 = fma(_778, (*spvDescriptorSet0.vp_c8)._m0[25].x, _786);
    float _794 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[26].z, _788);
    float _796 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[24].z, _790);
    float _798 = fma(_782, (*spvDescriptorSet0.vp_c8)._m0[25].z, _792);
    float _800 = _794 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _802 = -_734;
    float _804 = _704 + _802;
    float _806 = _796 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _808 = _798 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _810 = _704 + _800;
    float _812 = _698 + _806;
    float _814 = fma(_804, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _816 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _818 = _810 + _816;
    float _820 = _694 + _808;
    float _822 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _824 = _812 + _822;
    float _826 = floor(_814);
    float _828 = _818 * _818;
    float _830 = fma(_824, _824, _828);
    float _832 = -_732;
    float _834 = _698 + _832;
    float _836 = sqrt(_830);
    float _838 = fma(_834, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _840 = floor(_838);
    bool _842 = _836 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _844 = 0.0;
    float _846 = _812;
    float _848 = _810;
    float _850 = _804;
    if (!_842)
    {
        _844 = _820;
    }
    float _852 = _844;
    bool _854 = !_842;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _836 + _860;
        float _864 = _820 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _866 = _862 * _858;
        float _868 = rsqrt(_830);
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = cos(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = sin(_876);
        float _880 = _874 + (-1.0);
        float _882 = _880 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _884 = fma(_878, _864, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _886 = fma(_820, _874, _882);
        float _888 = _868 * _884;
        float _890 = fma(_824, _888, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _892 = fma(_818, _888, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _846 = _890;
        _848 = _892;
        _856 = _886;
    }
    float _894 = _846;
    float _896 = _848;
    float _898 = _856;
    float _900 = fma(_894, 6.2500002968590706586837768554688e-05, 0.5);
    float _902 = fma(_896, 6.2500002968590706586837768554688e-05, 0.5);
    float _904 = -_840;
    float _906 = _838 + _904;
    float _908 = -_826;
    float _910 = _814 + _908;
    float2 _3799 = float2(_900, _902);
    float3 _914 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_3799, float2(0.0), isnan(_3799)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_3799, float2(0.0), isnan(_3799)), level(0.0)).xyz;
    float _916 = _914.x;
    float _918 = _914.y;
    float _920 = _914.z;
    float2 _3815 = float2(_906, _910);
    float _922 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_3815, float2(0.0), isnan(_3815)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_3815, float2(0.0), isnan(_3815)), level(0.0)).x;
    float _924 = in.m_57.w;
    float _926 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _928 = in.m_71.y;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _932 = _930 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _934 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _936 = _934 != 0;
    float _938 = in.m_57.y;
    int _940 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _942 = _940 != 0;
    float _944 = 1.0 / _932;
    int _946 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _948 = _946 != 0;
    float _950 = in.m_57.x;
    int _952 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _954 = _952 != 0;
    float _956 = -_730;
    float _958 = _956 + _898;
    int _960 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _962 = _960 != 0;
    float _964 = in.m_57.z;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _968 = in.m_73.w;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _970;
    float _974 = in.m_71.x;
    bool _976 = _924 > 0.5;
    float _978 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _980 = in.m_75.x;
    float _982 = in.m_75.y;
    float _984 = in.m_75.z;
    float _986 = in.m_75.w;
    float _988 = -_928;
    float _990 = _988 + 1.0;
    float _992 = -_732;
    float _994 = _992 + _894;
    bool _996 = _938 > 0.5;
    float _998 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1000 = _976 ? as_type<int>(_990) : as_type<int>(_928);
    float _1002 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _1004 = _996 ? as_type<int>(_990) : as_type<int>(_928);
    float _1006 = -_734;
    float _1008 = _1006 + _896;
    float _1010 = _962 ? as_type<float>(_1000) : _928;
    float _1012 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1002);
    float _1014 = _936 ? as_type<float>(_1004) : _928;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1018 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1020 = _1018 != 0;
    float _1022 = _950 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    out.m_77.w = _968;
    bool _1024 = _964 > 0.5;
    float _1026 = -_1016;
    float _1028 = fma(_1022, 2.0, _1026);
    int _1030 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1032 = _1030 != 0;
    int _1034 = 0;
    float _1036 = _928;
    bool _1038 = _1020;
    float _1040 = _978;
    float _1042 = _974;
    float _1044 = _964;
    float _1046 = _938;
    float _1048 = _1008;
    if (_954)
    {
        float _1050 = -_974;
        float _1052 = _1050 + 1.0;
        _1034 = as_type<int>(_1052);
    }
    int _1054 = _1034;
    float _1056 = -_164;
    float _1058 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1028);
    float _1060 = _982 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1062 = _982 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1064 = _982 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    if (_1020)
    {
        float _1066 = _1024 ? _990 : _928;
        _1036 = _1066;
    }
    float _1068 = _1036;
    float _1070 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1060);
    float _1072 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1062);
    float _1074 = fma(_980, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1064);
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1078 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1070);
    float _1080 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1072);
    float _1082 = fma(_984, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1074);
    float _1084 = _972 * _944;
    float _1086 = _926 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1090 = _644 + _1088;
    out.m_79.x = _1078;
    out.m_79.y = _1080;
    out.m_79.z = _1082;
    float _1092 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1094 = fma(_1084, _1090, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1096 = _938 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1098 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1100 = isnan(_644);
    bool _1102 = _1098 || _1100;
    bool _1104 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1106 = _1102 || _1104;
    float _1108 = float(_1106);
    float _1110 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1112 = _1078;
    float _1114 = _1086;
    if (_942)
    {
        bool _1116 = _950 > 0.5;
        _1038 = _1116;
    }
    bool _1118 = _1038;
    float _1120 = fma(_1096, -2.0, _978);
    float _1122 = fma(_1086, _1014, -0.5);
    float _1124 = _1122;
    if (!_942)
    {
        _1040 = _974;
    }
    float _1126 = _1040;
    float _1128 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1076);
    float _1130 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1120);
    float _1132 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1134 = _644 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1136 = isnan(_644);
    bool _1138 = _1134 || _1136;
    bool _1140 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1142 = _1138 || _1140;
    float _1144 = float(_1142);
    float _1146 = -_1108;
    float _1148 = _1146 + 1.0;
    float _1150 = _1126;
    if (_1032)
    {
        _1112 = _950;
    }
    float _1152 = _1112;
    float _1154 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1132);
    float _1156 = _1152;
    if (!_1032)
    {
        _1156 = _964;
    }
    float _1158 = _1156;
    float _1160 = _1144 * _1148;
    float _1162 = _966 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1164 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1154);
    int _1166 = as_type<int>(_1164);
    if (!_1032)
    {
        _1114 = _938;
    }
    float _1168 = _1114;
    float _1170 = _1094 * _1160;
    float _1172 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1174 = -_1130;
    float _1176 = fma(_1164, _1122, _1174);
    float _1178 = _1168;
    float _1180 = _1170;
    if (_942)
    {
        float _1182 = -_974;
        float _1184 = _1182 + 1.0;
        _1166 = as_type<int>(_1184);
    }
    int _1186 = _1166;
    float _1188 = fma(_1010, _1162, -0.5);
    float _1190 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1192 = _1092 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _1194 = as_type<int>(_1092);
    if (_948)
    {
        float _1196 = -_974;
        float _1198 = _1196 + 1.0;
        _1194 = as_type<int>(_1198);
    }
    int _1200 = _1194;
    if (_942)
    {
        float _1202 = _1118 ? as_type<float>(_1186) : _974;
        _1150 = _1202;
    }
    float _1204 = _1150;
    float _1206 = -_1190;
    float _1208 = fma(_1172, 2.0, _1206);
    if (!_948)
    {
        _1124 = _974;
    }
    float _1210 = _1124;
    float _1212 = in.m_81.x;
    float _1214 = in.m_81.y;
    float _1216 = in.m_81.z;
    float _1218 = _1210;
    if (_948)
    {
        float _1220 = _1024 ? as_type<float>(_1200) : _974;
        _1218 = _1220;
    }
    float _1222 = _1218;
    float _1224 = fma(_1192, _1068, -0.5);
    bool _1226 = _752 != 0.0;
    bool _1228 = isnan(_752);
    bool _1230 = _1226 || _1228;
    bool _1232 = isnan(0.0);
    bool _1234 = _1230 || _1232;
    float _1236 = -_1144;
    float _1238 = _1236 + 1.0;
    float _1240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1242 = _750 == 0.0;
    bool _1244 = !_1234;
    bool _1246 = _1242 && _1244;
    float _1248 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1170);
    if (_1032)
    {
        _1178 = _950;
    }
    float _1250 = _1178;
    float _1252 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1254 = fma(_1108, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1248);
    bool _1256 = _754 == 0.0;
    bool _1258 = _1256 && _1246;
    float _1260 = fma(_1250, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1252);
    float _1262 = _1250 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1264 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1266 = _1262;
    float _1268 = _1250;
    if (_954)
    {
        float _1270 = _996 ? as_type<float>(_1054) : _974;
        _1042 = _1270;
    }
    float _1272 = _1042;
    float _1274 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1276 = fma(_950, (*spvDescriptorSet0.vp_c9)._m0[88].z, _998);
    float _1278 = -_1264;
    float _1280 = fma(_1262, 2.0, _1278);
    if (!_1032)
    {
        _1266 = _964;
    }
    float _1282 = _1266;
    float _1284 = _1240 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1286 = _1282;
    if (_1032)
    {
        _1286 = _938;
    }
    float _1288 = _1286;
    out.m_83.w = _726;
    float _1290 = _1288;
    if (!_1032)
    {
        _1180 = _964;
    }
    float _1292 = _1180;
    float _1294 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1296 = _1292;
    float _1298 = _1212;
    if (_1258)
    {
        _1268 = _1212;
    }
    float _1300 = _1268;
    float _1302 = fma(_1284, _1204, -0.5);
    float _1304 = _1300;
    if (_1032)
    {
        _1044 = _938;
    }
    float _1306 = _1044;
    out.m_85.x = _770;
    float _1308 = _1306;
    if (!_1032)
    {
        _1308 = _950;
    }
    float _1310 = _1308;
    float _1312 = fma(_1288, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1110);
    if (_1258)
    {
        _1290 = _1300;
    }
    float _1314 = _1290;
    float _1316 = _1274 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1318 = _1314;
    if (!_1258)
    {
        _1304 = _1212;
    }
    float _1320 = _1304;
    float _1322 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1312);
    if (_1032)
    {
        _1296 = _938;
    }
    float _1324 = _1296;
    float _1326 = fma(_1316, _1222, -0.5);
    if (_1258)
    {
        _1046 = _1214;
    }
    float _1328 = _1046;
    float _1330 = _1328;
    if (!_1258)
    {
        float _1332 = fma(_750, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1320);
        _1318 = _1332;
    }
    float _1334 = _1318;
    float _1336 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1012);
    float _1338 = _1294 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1258)
    {
        _1298 = _1216;
    }
    float _1340 = _1298;
    float _1342 = _1340;
    if (!_1258)
    {
        float _1344 = fma(_752, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1214);
        _1330 = _1344;
    }
    float _1346 = _1330;
    if (!_1258)
    {
        float _1348 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1342 = _1348;
    }
    float _1350 = _1342;
    float _1352 = fma(_1338, _1272, -0.5);
    float _1354 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1260);
    float _1356 = -_164;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1280);
    float _1360 = -_164;
    float _1362 = fma(_1360, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1208);
    float _1364 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1276);
    float _1366 = fma(_1336, _1302, _1058);
    float _1368 = _984 * _1320;
    float _1370 = fma(_1354, _1326, _1358);
    float _1372 = fma(_1364, _1352, _1362);
    float _1374 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1376 = _1324 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1378 = -_1368;
    float _1380 = fma(_980, _1216, _1378);
    float _1382 = _982 * _1216;
    float _1384 = fma(_1376, -2.0, _1374);
    float _1386 = _980 * _1214;
    float _1388 = -_1382;
    float _1390 = fma(_984, _1214, _1388);
    float _1392 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1394 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1396 = _1310 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1398 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1400 = _1254 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1402 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1384);
    float _1404 = fma(_1396, -2.0, _1394);
    float _1406 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1408 = -_1386;
    float _1410 = fma(_982, _1320, _1408);
    float _1412 = -_1402;
    float _1414 = fma(_1322, _1188, _1412);
    float _1416 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1128);
    float _1418 = fma(_164, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1404);
    float _1420 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1422 = _958 + _1420;
    float _1424 = _1406 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1426 = _1392 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1428 = _1398 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1430 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1432 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1434 = _1380 * _986;
    float _1436 = _1390 * _986;
    float _1438 = _1410 * _986;
    float _1440 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1442 = _994 + _1440;
    float _1444 = _1422 * _1422;
    out.m_87.x = _1424;
    out.m_87.y = _1426;
    out.m_87.z = _1428;
    out.m_87.w = _1400;
    float _1446 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1430);
    float _1448 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1432);
    float _1450 = fma(_1442, _1442, _1444);
    float _1452 = _1346 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1454 = -_1418;
    float _1456 = fma(_1416, _1224, _1454);
    float _1458 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1460 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1462 = _1434 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1464 = fma(_1334, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1452);
    float _1466 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1458);
    float _1468 = _1372 + 0.5;
    float _1470 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1462);
    float _1472 = _1414 + 0.5;
    float _1474 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1476 = _1008 + _1474;
    float _1478 = _1176 + 0.5;
    float _1480 = _1366 + 0.5;
    float _1482 = _1370 + 0.5;
    float _1484 = fma(_1476, _1476, _1450);
    float _1486 = _1456 + 0.5;
    float _1488 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1464);
    float _1490 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1446);
    out.m_89.x = _1480;
    out.m_89.y = _1478;
    out.m_89.z = _1482;
    out.m_89.w = _1472;
    float _1492 = -_730;
    float _1494 = _694 + _1492;
    float _1496 = sqrt(_1484);
    out.m_91.x = _1468;
    out.m_91.y = _1486;
    float _1498 = fma(_1436, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1460);
    float _1500 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1466);
    float _1502 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1470);
    float _1504 = fma(_1350, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1448);
    float _1506 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1498);
    bool _1508 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1510 = isnan(_1496);
    bool _1512 = _1508 || _1510;
    bool _1514 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1516 = _1512 || _1514;
    out.m_93.x = _1488;
    out.m_93.y = _1490;
    out.m_93.z = _1504;
    out.m_95.x = _1500;
    out.m_95.y = _1506;
    out.m_95.z = _1502;
    float _1518 = _1466;
    float _1520 = _1446;
    float _1522 = _1494;
    if (!_1516)
    {
        _1518 = 1.0;
    }
    float _1524 = _1518;
    out.m_97.x = _916;
    out.m_97.y = _918;
    out.m_97.z = _920;
    bool _1526 = !_1516;
    float _1528 = _1524;
    if (!_1526)
    {
        bool _1530 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1532 = isnan(_1496);
        bool _1534 = _1530 || _1532;
        bool _1536 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1538 = _1534 || _1536;
        if (!_1538)
        {
            float _1540 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1542 = _1496 + _1540;
            float _1544 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1546 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1544;
            float _1548 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1550 = _1548 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1552 = 1.0 / _1546;
            float _1554 = _1542 * _1552;
            float _1556 = fma(_1554, _1550, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1528 = _1556;
            _1558 = true;
        }
        else
        {
            bool _1560 = _1496 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1562 = isnan(_1496);
            bool _1564 = _1560 || _1562;
            bool _1566 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1568 = _1564 || _1566;
            if (!_1568)
            {
                float _1570 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1572 = _1496 + _1570;
                float _1574 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1576 = _1574 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1578 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1580 = _1578 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1582 = 1.0 / _1576;
                float _1584 = _1572 * _1582;
                float _1586 = fma(_1584, _1580, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1528 = _1586;
                _1558 = true;
            }
            else
            {
                _1528 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1558 = false;
    float _1588 = _1528;
    float _1590 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1592 = _958 + _1590;
    float _1594 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1596 = _994 + _1594;
    float _1598 = fma(_1592, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1600 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1602 = _1008 + _1600;
    float _1604 = fma(_1596, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1606 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1608 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1610 = _1598 + _1608;
    float _1612 = fma(_1602, _1588, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1614 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1616 = _1604 + _1614;
    float _1618 = _1610 * _1610;
    float _1620 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1622 = _1612 + _1620;
    float _1624 = fma(_1616, _1616, _1618);
    float _1626 = fma(_1622, _1622, _1624);
    float _1628 = rsqrt(_1626);
    float _1630 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1632 = _1616 * _1630;
    float _1634 = _1622 * _1630;
    float _1636 = _1632 * _1632;
    float _1638 = _1634 * _1634;
    float _1640 = _1636 + _1638;
    float _1642 = sqrt(_1640);
    bool _1644 = _1642 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1646 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1648 = _1642 + _1646;
    float _1650 = _1350;
    float _1652 = _1640;
    float _1654 = _1648;
    float _1656 = _1610;
    float _1658 = _1632;
    if (_1644)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1650 = _1660;
    }
    float _1662 = _1650;
    if (_1644)
    {
        float _1664 = rsqrt(_1640);
        _1652 = _1664;
    }
    float _1666 = _1652;
    float _1668 = _1666;
    if (_1644)
    {
        float _1670 = _1648 * _1662;
        _1654 = _1670;
    }
    float _1672 = _1654;
    if (_1644)
    {
        float _1674 = _1672 * 0.15915493667125701904296875;
        _1520 = _1674;
    }
    float _1676 = _1520;
    float _1678 = _1622;
    float _1680 = _1676;
    if (_1644)
    {
        float _1682 = _1676 * 6.283185482025146484375;
        float _1684 = sin(_1682);
        _1678 = _1684;
    }
    float _1686 = _1678;
    float _1688 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1690 = precise::max(0.0, _1688);
    float _1692 = _1662;
    float _1694 = _1690;
    if (_1644)
    {
        float _1696 = _1676 * 6.283185482025146484375;
        float _1698 = cos(_1696);
        _1692 = _1698;
    }
    float _1700 = _1692;
    float _1702 = -_1630;
    float _1704 = -_1690;
    float _1706 = fma(_1610, _1702, _1704);
    if (_1644)
    {
        float _1708 = _1706 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1656 = _1708;
    }
    float _1710 = _1656;
    float _1712 = _1686;
    float _1714 = _1710;
    if (_1644)
    {
        float _1716 = fma(_1686, _1710, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1712 = _1716;
    }
    float _1718 = _1712;
    float _1720 = _1718;
    if (!_1644)
    {
        _1714 = _1634;
    }
    float _1722 = _1714;
    float _1724 = _1722;
    float _1726 = _1700;
    if (_1644)
    {
        float _1728 = _1700 + (-1.0);
        _1694 = _1728;
    }
    float _1730 = _1694;
    if (_1644)
    {
        float _1732 = _1666 * _1718;
        _1048 = _1732;
    }
    float _1734 = _1048;
    if (!_1644)
    {
        _1720 = _1706;
    }
    float _1736 = _1720;
    float _1738 = _1736;
    if (_1644)
    {
        float _1740 = _1730 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1680 = _1740;
    }
    float _1742 = _1680;
    if (_1644)
    {
        float _1744 = _1632 * _1734;
        _1658 = _1744;
    }
    float _1746 = _1658;
    float _1748 = sqrt(_1626);
    if (!_1644)
    {
        _1668 = _1636;
    }
    float _1750 = _1668;
    float _1752 = _1750;
    if (_1644)
    {
        float _1754 = fma(_1706, _1700, _1742);
        _1738 = _1754;
    }
    float _1756 = _1738;
    if (_1644)
    {
        float _1758 = _1634 * _1734;
        _1724 = _1758;
    }
    float _1760 = _1724;
    if (_1644)
    {
        float _1762 = _1746 * _1746;
        _1752 = _1762;
    }
    float _1764 = _1752;
    if (!_1644)
    {
        _1726 = _1638;
    }
    float _1766 = _1726;
    float _1768 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1770 = _1766;
    if (_1644)
    {
        float _1772 = _1760 * _1760;
        _1770 = _1772;
    }
    float _1774 = _1770;
    float _1776 = fma(_1756, _1756, _1764);
    float _1778 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1768);
    float _1780 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1782 = _1776 + _1774;
    float _1784 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1786 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1780);
    float _1788 = rsqrt(_1782);
    float _1790 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1792 = fma(_1748, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1790);
    float _1794 = precise::clamp(_1792, 0.0, 1.0);
    float _1796 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1778);
    float _1798 = _1598 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1800 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1784);
    float _1802 = -_1794;
    float _1804 = _1802 + 1.0;
    float _1806 = _1796 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1808 = fma(_1604, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1798);
    float _1810 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1800);
    float _1812 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1786);
    float _1814 = _1806 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1816 = fma(_1612, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1808);
    float _1818 = _1810 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1820 = abs(_1804);
    float _1822 = log2(_1820);
    float _1824 = -_1814;
    float _1826 = fma(_1824, _1606, 1.0);
    float _1828 = _1816 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1830 = _1788 * _1746;
    float _1832 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1834 = _1788 * _1756;
    float _1836 = _1788 * _1760;
    float _1838 = _1830 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1840 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1832);
    float _1842 = _1812 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1844 = log2(_1826);
    float _1846 = -_1838;
    float _1848 = fma(_1834, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1846);
    float _1850 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1840);
    float _1852 = -_1836;
    float _1854 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1848);
    float _1856 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1850);
    float _1858 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1860 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1862 = fma(_1854, -0.5, 0.5);
    float _1864 = 1.0 / _1856;
    float _1866 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1868 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1860);
    float _1870 = fma(_1854, 0.5, 0.5);
    float _1872 = _1834 + 1.0;
    float _1874 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1866);
    float _1876 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1868);
    float _1878 = exp2(_1858);
    float _1880 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1874);
    float _1882 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1876);
    float _1884 = _1844 * 0.693147182464599609375;
    float _1886 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1880);
    float _1888 = sqrt(_1862);
    float _1890 = fma(_1870, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1892 = _1882 * _1864;
    float _1894 = _1886 * _1864;
    float _1896 = _1884 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1898 = fma(_1870, _1890, -0.212114393711090087890625);
    float _1900 = fma(_1892, 0.5, 0.5);
    float _1902 = fma(_1894, -0.5, 0.5);
    float _1904 = -_1834;
    float _1906 = fma(_1878, _1872, _1904);
    float _1908 = fma(_1870, _1898, 1.570728778839111328125);
    float _1910 = fma(_1906, 0.5, 0.5);
    float _1912 = _1888 * 0.636619746685028076171875;
    float3 _5569 = float3(_1900, _1902, _1896);
    float _1914 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5569, float3(0.0), isnan(_5569)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5569, float3(0.0), isnan(_5569)), level(0.0)).x;
    float3 _5580 = float3(_1900, _1902, _1896);
    float4 _1917 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5580, float3(0.0), isnan(_5580)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5580, float3(0.0), isnan(_5580)), level(0.0)).xyzw;
    float _1919 = _1917.x;
    float _1921 = _1917.y;
    float _1923 = _1917.z;
    float _1925 = _1917.w;
    float _1927 = -_1908;
    float _1929 = fma(_1912, _1927, 1.0);
    float2 _5601 = float2(_1929, _1910);
    float3 _1931 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5601, float2(0.0), isnan(_5601)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5601, float2(0.0), isnan(_5601)), level(0.0)).xyz;
    float _1933 = _1931.x;
    float _1935 = _1931.y;
    float _1937 = _1931.z;
    float _1939 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1941 = _1822 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1943 = in.m_99.x;
    float _1945 = _1818 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1947 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1939);
    float _1949 = -_922;
    float _1951 = _1949 + 1.0;
    float _1953 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1947);
    float _1955 = _1494 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1957 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1945);
    float _1959 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1961 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1955);
    float _1963 = fma(_1806, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1957);
    float _1965 = 1.0 / _1959;
    float _1967 = fma(_804, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1961);
    out.m_101.x = _834;
    out.m_101.y = _1494;
    out.m_101.z = _804;
    float _1969 = fma(_1842, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1963);
    float _1971 = _1967 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    out.m_103.x = _1604;
    out.m_103.y = _1598;
    out.m_103.z = _1612;
    float _1973 = _1971 + _1959;
    out.gl_Position.x = _1882;
    out.gl_Position.y = _1886;
    out.gl_Position.z = _1969;
    out.gl_Position.w = _1856;
    float _1975 = _1973 * _1965;
    float _1977 = _1975 * 0.5;
    float _1979 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1981 = fma(_1977, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1979);
    bool _1983 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan(0.5);
    bool _1991 = _1987 || _1989;
    float _1993 = 1.0 / _1981;
    float _1995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1997 = _1993 * _1995;
    float _1999 = abs(_1997);
    float _2001 = log2(_1999);
    float _2003 = _1842;
    float _2005 = _1856;
    float _2007 = _1882;
    float _2009 = _1886;
    if (!_1991)
    {
        float _2011 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2013 = _1997 + _2011;
        _2003 = _2013;
    }
    float _2015 = _2003;
    float _2017 = _2001 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2019 = exp2(_2017);
    float _2021 = fma(_2019, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2023 = precise::clamp(_2021, 0.0, 1.0);
    float _2025 = _2019;
    if (!_1991)
    {
        _2025 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2027 = _2025;
    float _2029 = fma(_2023, -2.0, 3.0);
    float _2031 = _2023 * _2023;
    float _2033 = _2027;
    if (!_1991)
    {
        float _2035 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2037 = _2027 + _2035;
        _2033 = _2037;
    }
    float _2039 = _2033;
    float _2041 = _2031 * _2029;
    bool _2043 = _1997 <= 8000.0;
    bool _2045 = isnan(_1997);
    bool _2047 = _2043 || _2045;
    bool _2049 = isnan(8000.0);
    bool _2051 = _2047 || _2049;
    float _2053 = float(_2051);
    float _2055 = _2039;
    if (!_1991)
    {
        float _2057 = 1.0 / _2039;
        _2055 = _2057;
    }
    float _2059 = _2055;
    float _2061 = -_2041;
    float _2063 = _2061 + 1.0;
    float _2065 = fma(_2063, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2041);
    float _2067 = exp2(_1941);
    float _2069 = _2053 * _2065;
    float _2071 = _2069 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2073 = _1951 * _2071;
    float _2075 = precise::clamp(_2073, 0.0, 1.0);
    float _2077 = _1856 * 0.5;
    float _2079 = _1969 + _1856;
    float _2081 = -_2075;
    float _2083 = fma(_2081, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2085 = _1882 + _1856;
    float _2087 = fma(_1886, -0.5, _2077);
    float _2089 = -_2067;
    float _2091 = _2089 + 1.0;
    float _2093 = _2083 * _1943;
    float _2095 = _2083;
    if (_1991)
    {
        _2095 = 1.0;
    }
    float _2097 = _2095;
    float _2099 = _2097;
    if (!_1991)
    {
        float _2101 = _2015 * _2059;
        float _2103 = precise::clamp(_2101, 0.0, 1.0);
        _2099 = _2103;
    }
    float _2105 = _2099;
    float _2107 = _2091 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2109 = _2079 * 0.5;
    float _2111 = _2085 * 0.5;
    float _2113 = _2093 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    bool _2115 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2117 = isnan(_1748);
    bool _2119 = _2115 || _2117;
    bool _2121 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2123 = _2119 || _2121;
    out.m_105.x = _2111;
    out.m_105.y = _2087;
    out.m_105.z = _2109;
    out.m_105.w = _1856;
    out.m_107.x = _2113;
    if (!_2123)
    {
        _2005 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2125 = _2005;
    float _2127 = _2125;
    float _2129 = _2125;
    if (!_2123)
    {
        _2007 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2131 = _2007;
    float _2133 = _2131;
    float _2135 = _2131;
    if (!_2123)
    {
        _2009 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2137 = _2009;
    float _2139 = _2137;
    float _2141 = _2137;
    if (!_2123)
    {
        _850 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2143 = _850;
    float _2145 = _2143;
    float _2147 = _2143;
    if (!_2123)
    {
        _1522 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2149 = _1522;
    float _2151 = _2107 * _1914;
    float _2153 = -_2107;
    float _2155 = _2153 + 1.0;
    float _2157 = _1925 * _2151;
    float _2159 = _1925 * _2155;
    float _2161 = _1937 * _2151;
    float _2163 = fma(_1933, _2157, _1919);
    float _2165 = fma(_1935, _2157, _1921);
    float _2167 = _2157;
    float _2169 = _2149;
    float _2171 = _2149;
    if (!_2123)
    {
        _2167 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2173 = _2167;
    float _2175 = fma(_1925, _2161, _1923);
    float _2177 = _2105 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_109.x = _2163;
    out.m_109.y = _2165;
    out.m_109.z = _2175;
    out.m_109.w = _2159;
    bool _2179 = !_2123;
    float _2181 = _2173;
    float _2183 = _2173;
    if (!_2179)
    {
        bool _2185 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2187 = isnan(_1748);
        bool _2189 = _2185 || _2187;
        bool _2191 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2193 = _2189 || _2191;
        if (!_2193)
        {
            float _2195 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2197 = _1748 + _2195;
            float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2201 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2199;
            float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2205 = _2203 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2207 = 1.0 / _2201;
            float _2209 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2211 = _2209 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2213 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2215 = _2213 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2217 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2219 = _2217 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2221 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2223 = _2221 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2225 = _2197 * _2207;
            float _2227 = precise::clamp(_2225, 0.0, 1.0);
            float _2229 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2231 = _2229 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2233 = fma(_2227, _2205, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2235 = fma(_2227, _2231, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2237 = fma(_2227, _2211, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2239 = fma(_2227, _2215, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2241 = fma(_2227, _2219, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2243 = fma(_2227, _2223, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2135 = _2237;
            _2171 = _2241;
            _2129 = _2233;
            _2147 = _2239;
            _2141 = _2235;
            _2183 = _2243;
            _2245 = true;
        }
        else
        {
            bool _2247 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2249 = isnan(_1748);
            bool _2251 = _2247 || _2249;
            bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2255 = _2251 || _2253;
            if (!_2255)
            {
                _2127 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2257 = _2127;
            _2129 = _2257;
            if (!_2255)
            {
                _2133 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2259 = _2133;
            _2135 = _2259;
            if (!_2255)
            {
                _2139 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2261 = _2139;
            _2141 = _2261;
            if (!_2255)
            {
                _2145 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2263 = _2145;
            _2147 = _2263;
            if (!_2255)
            {
                _2169 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2265 = _2169;
            _2171 = _2265;
            if (!_2255)
            {
                _2181 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2267 = _2181;
            bool _2269 = !_2255;
            _2183 = _2267;
            if (!_2269)
            {
                bool _2271 = _1748 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2273 = isnan(_1748);
                bool _2275 = _2271 || _2273;
                bool _2277 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2279 = _2275 || _2277;
                if (!_2279)
                {
                    float _2281 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2283 = _1748 + _2281;
                    float _2285 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2287 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2285;
                    float _2289 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2291 = _2289 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2293 = 1.0 / _2287;
                    float _2295 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2297 = _2295 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2299 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2301 = _2299 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2303 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2305 = _2303 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2307 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2309 = _2307 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2311 = _2283 * _2293;
                    float _2313 = precise::clamp(_2311, 0.0, 1.0);
                    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2317 = _2315 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2319 = fma(_2313, _2291, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2321 = fma(_2313, _2317, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2323 = fma(_2313, _2297, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2325 = fma(_2313, _2301, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2327 = fma(_2313, _2305, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2329 = fma(_2313, _2309, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2135 = _2323;
                    _2171 = _2327;
                    _2129 = _2319;
                    _2147 = _2325;
                    _2141 = _2321;
                    _2183 = _2329;
                    _2245 = true;
                }
                else
                {
                    _2135 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2171 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2129 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2147 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2141 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2183 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2245 = false;
    float _2331 = _2135;
    float _2333 = _2171;
    float _2335 = _2129;
    float _2337 = _2147;
    float _2339 = _2141;
    float _2341 = _2183;
    float _2343 = fma(_1490, -0.5, 0.5);
    float _2345 = precise::clamp(_2343, 0.0, 1.0);
    float _2347 = -_2331;
    float _2349 = _2347 + _2333;
    float _2351 = _2177 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2353 = -_2335;
    float _2355 = _2353 + _2337;
    float _2357 = fma(_2345, _2349, _2331);
    out.m_111.x = 0.0;
    float _2359 = -_2339;
    float _2361 = _2359 + _2341;
    float _2363 = fma(_2345, _2355, _2335);
    float _2365 = _2357 * 0.586610972881317138671875;
    out.m_53.x = _2351;
    bool _2367 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2369 = fma(_2345, _2361, _2339);
    float _2371 = fma(_2363, 0.298911988735198974609375, _2365);
    bool _2373 = _2105 > 0.0;
    bool _2375 = isnan(_2105);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = fma(_2369, 0.114477999508380889892578125, _2371);
    float _2385 = -_2383;
    float _2387 = _2363 + _2385;
    float _2389 = -_2383;
    float _2391 = _2357 + _2389;
    float _2393 = -_2383;
    float _2395 = _2369 + _2393;
    float _2397 = fma(_2387, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2399 = fma(_2391, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2383);
    bool _2403 = !_2367;
    if (!_2403)
    {
        float _2405 = -_1598;
        float _2407 = _2405 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2409 = -_1604;
        float _2411 = _2409 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2413 = -_1612;
        float _2415 = _2413 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2417 = _2407 * _2407;
        float _2419 = fma(_2411, _2411, _2417);
        float _2421 = fma(_2415, _2415, _2419);
        float _2423 = sqrt(_2421);
        float _2425 = rsqrt(_2421);
        float _2427 = -_2423;
        float _2429 = _2427 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2431 = _2429 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2433 = precise::clamp(_2431, 0.0, 1.0);
        float _2435 = _2411 * _2425;
        float _2437 = _2407 * _2425;
        float _2439 = abs(_2433);
        float _2441 = log2(_2439);
        float _2443 = _2415 * _2425;
        float _2445 = _2435 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2447 = _1490 * _2437;
        float _2449 = -_2437;
        float _2451 = -_2445;
        float _2453 = fma(_2449, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2451);
        float _2455 = fma(_1488, _2435, _2447);
        float _2457 = -_2443;
        float _2459 = fma(_2457, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2453);
        float _2461 = fma(_1504, _2443, _2455);
        float _2463 = precise::clamp(_2461, 0.0, 1.0);
        float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2467 = _2459 + _2465;
        float _2469 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2471 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2473 = precise::clamp(_2471, 0.0, 1.0);
        float _2475 = exp2(_2469);
        float _2477 = _2475 * _2473;
        float _2479 = _2463 * _2477;
        float _2481 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2483 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2485 = _2479 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _2481;
        out.m_111.y = _2483;
        out.m_111.z = _2485;
    }
    out.m_83.x = _2397;
    out.m_83.y = _2399;
    out.m_83.z = _2401;
    if (_2381)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2487 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2487;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

