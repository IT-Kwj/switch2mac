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
    constant _16* vp_c13 [[id(4)]];
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
    float4 m_61 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_69 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_63 [[attribute(1)]];
    float4 m_55 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_65 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_59 [[attribute(8)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2748 = false;
    bool _578 = false;
    bool _442 = false;
    bool _322 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_134);
        out.gl_Position.z = _3058;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3113 = as_type<float>(_160);
        out.gl_Position.z = _3113;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _274 * _262;
    float _286 = _282 * _262;
    float _288 = _280 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _172;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_59.x;
    float _328 = in.m_59.y;
    float _330 = in.m_59.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    bool _336 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_324);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -_346;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _352;
    float _360 = _300 * _330;
    float _362 = _298 * _328;
    float _364 = _334 * _358;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _372 = isnan(_324);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = _380 * _356;
    float _394 = fma(_384, _364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_388, _364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_380;
    float _400 = _398 + 1.0;
    float _402 = _390 * _392;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = _296 * _326;
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _416 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].y, _412);
    float _420 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].z, _414);
    bool _422 = !_348;
    float _440;
    if (!_422)
    {
        float _424 = in.m_57.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _172;
    }
    _442 = false;
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _444 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _454 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _456 = isnan(_444);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _470 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _472 = isnan(_444);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _482;
    bool _486 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _488 = isnan(_444);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = 1.0 / _452;
    float _500 = -_464;
    float _502 = _500 + 1.0;
    bool _504 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _506 = _480 * _502;
    float _508 = -_480;
    float _510 = _508 + 1.0;
    float _512 = 1.0 / _468;
    float _514 = _484 * _498;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _520 = fma(_514, _448, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _522 = _518 * _512;
    float _524 = _520 * _506;
    float _526 = -_496;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _444 + _530;
    float _534 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _536 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[115].x, _524);
    float _538 = _464 * _528;
    float _540 = fma(_522, _532, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _542 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _544 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = fma(_540, _538, _536);
    float _548 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[117].x, _546);
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _544;
    out.m_61.y = _554;
    out.m_61.z = _550;
    out.m_61.w = _556;
    bool _558 = !_504;
    float _576;
    if (!_558)
    {
        float _560 = in.m_57.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        _576 = _172;
    }
    _578 = false;
    float _580 = _576;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _584 = _580 + _582;
    bool _586 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _588 = isnan(_580);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _598;
    bool _602 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _604 = isnan(_580);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -_596;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _618;
    float _622 = 1.0 / _600;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _626 = _612 * _616;
    float _628 = -_612;
    float _630 = _628 + 1.0;
    float _632 = _584 * _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _634;
    float _638 = fma(_620, _632, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _640;
    float _644 = fma(_636, _632, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _646 = _638 * _626;
    float _648 = fma(_642, _632, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _650 = _644 * _626;
    float _652 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].x, _646);
    float _654 = _648 * _626;
    float _656 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].x, _652);
    float _658 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].y, _654);
    float _660 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].z, _650);
    float _662 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].y, _658);
    float _664 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].z, _660);
    bool _666 = !_624;
    if (!_666)
    {
        float _668 = in.m_57.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _194 = _682;
    }
    float _684 = _194;
    float _686 = in.m_57.z;
    float _688 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _690 = log2(_688);
    float _692 = in.m_57.x;
    float _694 = in.m_57.y;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _698 = int(_696);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _704 = _690 * _116;
    float _706 = exp2(_704);
    float _708 = _686 * 2.0;
    float _710 = _692 * 2.0;
    float _712 = _694 * 2.0;
    float _714 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _716 = floor(_708);
    float _718 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _720 = -_700;
    float _722 = fma(_714, 2.0, _720);
    float _724 = _694 + _692;
    float _726 = fma(_718, -2.0, _702);
    float _728 = -_116;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[76].x, _722);
    float _732 = floor(_710);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _724 + (-1.0);
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _742 = floor(_712);
    bool _744 = _716 >= 0.0;
    bool _746 = isnan(_716);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _756 = 1.0 + _754;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _768 = _766 != 0;
    int _770 = _752 ? 0 : 1;
    float _772 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _774 = int(_772);
    bool _776 = _732 > 0.0;
    bool _778 = !_764;
    int _780 = _778 ? 0 : 1;
    bool _782 = _716 > 0.0;
    bool _784 = !_760;
    int _786 = _784 ? 0 : 1;
    float _788 = 1.0 / _756;
    bool _790 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _792 = isnan(0.0);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _798 = _794 || _796;
    bool _800 = _732 >= 0.0;
    bool _802 = isnan(_732);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = _742 > 0.0;
    bool _812 = _742 >= 0.0;
    bool _814 = isnan(_742);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    int _822 = ~_770;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    if (!_782)
    {
        int _830 = ~_770;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    bool _836 = !_768;
    int _838 = _836 ? 0 : 1;
    float _840 = _798 ? _736 : 0.0;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = float(_698);
    float _858 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _860 = in.m_63.x;
    float _862 = in.m_63.y;
    float _864 = in.m_63.z;
    bool _866 = !_846;
    int _868 = _866 ? 0 : 1;
    float _870 = 1.0 / _856;
    float _872 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _858);
    int _874 = _808 ? 0 : 1;
    bool _876 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(1.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _888 = float(_834);
    int _890 = abs(_868);
    float _892 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].z, _886);
    bool _894 = !_850;
    int _896 = _894 ? 0 : 1;
    float _898 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _726);
    float _900 = float(_890);
    float _902 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _892);
    int _904 = abs(_896);
    float _906 = _870 * _116;
    float _908 = float(_774);
    float _910 = _900 * _888;
    int _912 = ~_874;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = _692 + (-0.5);
    int _920 = _916;
    if (!_776)
    {
        int _922 = ~_874;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _910 * (-2.0);
    float _930 = _908 * _116;
    if (_884)
    {
        float _932 = _840 * _788;
        _126 = _932;
    }
    float _934 = _126;
    int _936 = _820 ? 0 : 1;
    float _938 = fma(_928, _860, _860);
    bool _940 = !_854;
    int _942 = _940 ? 0 : 1;
    float _944 = float(_926);
    float _946 = fma(_740, _928, _740);
    float _948 = float(_904);
    float _950 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    int _952 = ~_936;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = _956;
    if (!_810)
    {
        int _960 = ~_936;
        int _962 = _960 + 1;
        _958 = _962;
    }
    int _964 = _958;
    float _966 = _948 * _944;
    int _968 = abs(_942);
    float _970 = _694 + _686;
    float _972 = float(_964);
    float _974 = fma(_946, _934, _950);
    float _976 = float(_968);
    float _978 = _970 + (-1.0);
    float _980 = _966 * (-2.0);
    float _982 = _974 * 0.15915493667125701904296875;
    float _984 = _976 * _972;
    float _986 = _694 + (-0.5);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _990 = fma(_980, _862, _862);
    float _992 = _686 + _692;
    float _994 = fma(_988, _980, _988);
    float _996 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    float _998 = _992 + (-1.0);
    float _1000 = _984 * (-2.0);
    float _1002 = _686 + (-0.5);
    float _1004 = fma(_994, _934, _996);
    float _1006 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1008 = fma(_1000, _864, _864);
    float _1010 = in.m_65.x;
    float _1012 = in.m_65.y;
    float _1014 = in.m_65.z;
    float _1016 = _982 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = fma(_1006, _1000, _1006);
    float _1022 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1008);
    float _1024 = _1004 * 0.15915493667125701904296875;
    float _1026 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1028 = fma(_1020, _934, _1022);
    float _1030 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = _982 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    float _1036 = _1024 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1028 * 0.15915493667125701904296875;
    float _1042 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1044 = in.m_46.x;
    float _1046 = in.m_46.y;
    float _1048 = in.m_46.z;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1052 = _1024 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1058 = _1042 * _1050;
    float _1060 = _1026 * _1056;
    float _1062 = _1040 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1014);
    float _1068 = _1018 * _1038;
    float _1070 = _1030 * _1066;
    float _1072 = _1034 * _1038;
    float _1074 = _1040 * 6.283185482025146484375;
    float _1076 = sin(_1074);
    float _1078 = _1034 * _1054;
    float _1080 = _1018 * _1054;
    float _1082 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1034 * _1064;
    float _1086 = _1018 * _1064;
    float _1088 = _1054 * _1064;
    float _1090 = _1038 * _1064;
    float _1092 = _1084 * _1060;
    float _1094 = _1086 * _1060;
    float _1096 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1098 = fma(_1076, _1078, _1068);
    float _1100 = -_1072;
    float _1102 = fma(_1076, _1080, _1100);
    float _1104 = -_1080;
    float _1106 = fma(_1076, _1072, _1104);
    float _1108 = -_1060;
    float _1110 = _1076 * _1108;
    float _1112 = fma(_1098, _1058, _1092);
    float _1114 = fma(_1102, _1058, _1094);
    float _1116 = fma(_1076, _1068, _1078);
    float _1118 = fma(_1088, _1058, _1110);
    float _1120 = fma(_1106, _1070, _1112);
    float _1122 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1124 = fma(_1116, _1070, _1114);
    float _1126 = fma(_1090, _1070, _1118);
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1130 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1132 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1122);
    float _1134 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1136 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1128);
    float _1138 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1140 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1132);
    float _1142 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1134);
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1136);
    float _1146 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1150 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1142);
    float _1152 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1154 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1156 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1096);
    float _1158 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1160 = _1148 + _1152;
    float _1162 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1164 = _1156 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1166 = _1154 + _1158;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1162);
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1178 = _1166 + _1176;
    float _1180 = _1170 * _1170;
    float _1182 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1184 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1174);
    float _1186 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1188 = fma(_1178, _1178, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1192 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1184);
    float _1194 = sqrt(_1188);
    float _1196 = _1164 + _1190;
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1200 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1048;
    float _1204 = _1184;
    float _1206 = _1196;
    float _1208 = _1198;
    float _1210 = _1186;
    float _1212 = _1154;
    if (!_1200)
    {
        _1202 = _1166;
    }
    float _1214 = _1202;
    float _1216 = _1214;
    if (!_1200)
    {
        _1204 = _1160;
    }
    float _1218 = _1204;
    bool _1220 = !_1200;
    float _1222 = _1218;
    if (!_1220)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1228 = _1194 + _1226;
        float _1230 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = rsqrt(_1188);
        float _1234 = _1228 * _1224;
        float _1236 = _1234 * 0.15915493667125701904296875;
        float _1238 = _1236 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1236 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240 + (-1.0);
        float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1252 = fma(_1196, _1240, _1248);
        float _1254 = _1232 * _1250;
        float _1256 = fma(_1178, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1258 = fma(_1170, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1206 = _1252;
        _1216 = _1256;
        _1222 = _1258;
    }
    float _1260 = _1206;
    float _1262 = _1216;
    float _1264 = _1222;
    float _1266 = -_1164;
    float _1268 = _1266 + _1260;
    float _1270 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1186);
    float _1272 = -_1154;
    float _1274 = _1272 + _1262;
    float _1276 = 1.0 / _1198;
    float _1278 = _1268 * _1268;
    float _1280 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1270);
    float _1282 = -_1148;
    float _1284 = _1282 + _1264;
    float _1286 = fma(_1274, _1274, _1278);
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1290 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1292 = isnan(0.5);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1298 = _1294 || _1296;
    float _1300 = fma(_1284, _1284, _1286);
    float _1302 = _1288 + _1198;
    float _1304 = sqrt(_1300);
    float _1306 = _1302 * _1276;
    float _1308 = _1306 * 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1312 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
    float _1314 = _1260;
    float _1316 = _1264;
    float _1318 = _1312;
    float _1320 = _1300;
    float _1322 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1298)
    {
        _1208 = 1.0;
    }
    float _1324 = _1208;
    float _1326 = 1.0 / _1312;
    bool _1328 = _1304 > 0.0;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1332 = _1326 * _1330;
    float _1334 = _1304;
    float _1336 = _1324;
    if (!_1328)
    {
        _1334 = _1262;
    }
    float _1338 = _1334;
    bool _1340 = !_1328;
    float _1342 = _1338;
    if (!_1340)
    {
        float _1344 = _188 * _188;
        float _1346 = rsqrt(_1300);
        float _1348 = fma(_186, _186, _1344);
        float _1350 = fma(_190, _190, _1348);
        float _1352 = sqrt(_1350);
        float _1354 = _1274 * _1346;
        float _1356 = _1268 * _1346;
        float _1358 = _1284 * _1346;
        bool _1360 = _1352 > 0.0;
        float _1362 = _1352;
        _1318 = _1350;
        _1320 = _1346;
        _1322 = _1356;
        _1210 = _1358;
        if (!_1360)
        {
            _1362 = _1262;
        }
        float _1364 = _1362;
        bool _1366 = !_1360;
        _1342 = _1364;
        if (!_1366)
        {
            float _1368 = rsqrt(_1350);
            float _1370 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1372 = _188 * _1368;
            float _1374 = _186 * _1368;
            float _1376 = _1356 * _1372;
            float _1378 = _190 * _1368;
            float _1380 = fma(_1354, _1374, _1376);
            float _1382 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1384 = fma(_1358, _1378, _1380);
            float _1386 = _1384 * _1382;
            float _1388 = fma(_186, _1386, _1262);
            float _1390 = fma(_188, _1386, _1260);
            float _1392 = fma(_190, _1386, _1264);
            _1314 = _1390;
            _1342 = _1388;
            _1316 = _1392;
            _1318 = _1368;
        }
    }
    float _1394 = _1314;
    float _1396 = _1342;
    float _1398 = _1316;
    float _1400 = _1318;
    float _1402 = _1320;
    float _1404 = _1322;
    float _1406 = _1210;
    float _1408 = _1404;
    float _1410 = _1406;
    if (!_1298)
    {
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = _1412 * 0.15915493667125701904296875;
        float _1416 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1418 = _1414 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 0.15915493667125701904296875;
        float _1424 = _1414 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = 1.0 / _1420;
        float _1430 = _1422 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = _1422 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = 1.0 / _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1444;
        float _1448 = 1.0 / _1446;
        float _1450 = _1438 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1454 = fma(_1332, _1450, _1452);
        float _1456 = _1454 * _1448;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        _1336 = _1458;
    }
    float _1460 = _1336;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1394 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1396 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1398 + _1470;
    float _1474 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1476 = _1464 * _1464;
    float _1478 = fma(_1468, _1468, _1476);
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = rsqrt(_1480);
    float _1484 = sqrt(_1480);
    float _1486 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1488 = _1468 * _1486;
    float _1490 = _1472 * _1486;
    float _1492 = _1488 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 + _1494;
    float _1498 = sqrt(_1496);
    bool _1500 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = _1498 + _1502;
    float _1506 = _1400;
    float _1508 = _1496;
    float _1510 = _1504;
    float _1512 = _1488;
    float _1514 = _1490;
    float _1516 = _1492;
    float _1518 = _1494;
    if (_1500)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1520;
    }
    float _1522 = _1506;
    if (_1500)
    {
        float _1524 = rsqrt(_1496);
        _1508 = _1524;
    }
    float _1526 = _1508;
    if (_1500)
    {
        float _1528 = _1504 * _1522;
        _1510 = _1528;
    }
    float _1530 = _1510;
    if (_1500)
    {
        float _1532 = _1530 * 0.15915493667125701904296875;
        _1408 = _1532;
    }
    float _1534 = _1408;
    float _1536 = _1402;
    if (_1500)
    {
        float _1538 = _1534 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        _1536 = _1540;
    }
    float _1542 = _1536;
    float _1544 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1546 = precise::max(0.0, _1544);
    float _1548 = _1522;
    if (_1500)
    {
        float _1550 = _1534 * 6.283185482025146484375;
        float _1552 = cos(_1550);
        _1548 = _1552;
    }
    float _1554 = _1548;
    float _1556 = -_1486;
    float _1558 = -_1546;
    float _1560 = fma(_1464, _1556, _1558);
    if (_1500)
    {
        float _1562 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1410 = _1562;
    }
    float _1564 = _1410;
    float _1566 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1568 = _1564;
    float _1570 = _1542;
    if (_1500)
    {
        float _1572 = fma(_1542, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = _1574;
    if (!_1500)
    {
        _1570 = _1560;
    }
    float _1578 = _1570;
    float _1580 = floor(_1566);
    float _1582 = _1578;
    if (_1500)
    {
        float _1584 = _1554 + (-1.0);
        _1212 = _1584;
    }
    float _1586 = _1212;
    float _1588 = _1586;
    if (_1500)
    {
        float _1590 = _1526 * _1574;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1500)
    {
        float _1594 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1594;
    }
    float _1596 = _1588;
    if (_1500)
    {
        float _1598 = _1488 * _1592;
        _1512 = _1598;
    }
    float _1600 = _1512;
    if (_1500)
    {
        float _1602 = _1490 * _1592;
        _1514 = _1602;
    }
    float _1604 = _1514;
    float _1606 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1500)
    {
        float _1608 = fma(_1560, _1554, _1596);
        _1582 = _1608;
    }
    float _1610 = _1582;
    if (_1500)
    {
        float _1612 = _1600 * _1600;
        _1516 = _1612;
    }
    float _1614 = _1516;
    if (_1500)
    {
        float _1616 = _1604 * _1604;
        _1518 = _1616;
    }
    float _1618 = _1518;
    float _1620 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1606);
    float _1622 = fma(_1610, _1610, _1614);
    float _1624 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1474);
    float _1626 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1620);
    float _1628 = _1622 + _1618;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1632 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1634 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1638 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1632);
    float _1640 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1642 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1644 = floor(_1636);
    float _1646 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    float _1648 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1640);
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1652 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1650);
    float _1654 = precise::clamp(_1652, 0.0, 1.0);
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1658 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1660 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = -_1654;
    float _1664 = _1662 + 1.0;
    float _1666 = rsqrt(_1628);
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1670 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1624);
    float _1672 = -_1580;
    float _1674 = _1566 + _1672;
    float _1676 = -_1656;
    float _1678 = fma(_1676, _1630, 1.0);
    float _1680 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1668);
    float _1682 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1684 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1686 = abs(_1664);
    float _1688 = log2(_1686);
    float _1690 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1680);
    float _1692 = -_1644;
    float _1694 = _1636 + _1692;
    float _1696 = _1666 * _1600;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1690);
    float _1700 = _1666 * _1610;
    float _1702 = _1666 * _1604;
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = log2(_1678);
    float _1708 = -_1704;
    float _1710 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1708);
    float _1712 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1702;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1710);
    float _1718 = 1.0 / _1698;
    float _1720 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1722 = fma(_1716, -0.5, 0.5);
    float _1724 = fma(_1716, 0.5, 0.5);
    float _1726 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1720);
    float _1728 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1684);
    float _1730 = _1700 + 1.0;
    float _1732 = exp2(_1712);
    float _1734 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1726);
    float _1738 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1728);
    float _1740 = _1706 * 0.693147182464599609375;
    float _1742 = fma(_1724, _1734, -0.212114393711090087890625);
    float _1744 = sqrt(_1722);
    float _1746 = fma(_1724, _1742, 1.570728778839111328125);
    float _1748 = -_1700;
    float _1750 = fma(_1732, _1730, _1748);
    float _1752 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1736);
    float _1754 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1738);
    float _1756 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1758 = _1752 * _1718;
    float _1760 = _1754 * _1718;
    float _1762 = _1744 * 0.636619746685028076171875;
    float _1764 = fma(_1758, 0.5, 0.5);
    float _1766 = fma(_1760, -0.5, 0.5);
    float _1768 = -_1746;
    float _1770 = fma(_1762, _1768, 1.0);
    float _1772 = fma(_1750, 0.5, 0.5);
    float2 _5669 = float2(_1674, _1694);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5669, float2(0.0), isnan(_5669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5669, float2(0.0), isnan(_5669)), level(0.0)).x;
    float3 _5680 = float3(_1764, _1766, _1756);
    float _1776 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5680, float3(0.0), isnan(_5680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5680, float3(0.0), isnan(_5680)), level(0.0)).x;
    float3 _5691 = float3(_1764, _1766, _1756);
    float4 _1779 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5691, float3(0.0), isnan(_5691)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5691, float3(0.0), isnan(_5691)), level(0.0)).xyzw;
    float _1781 = _1779.x;
    float _1783 = _1779.y;
    float _1785 = _1779.z;
    float _1787 = _1779.w;
    float2 _5707 = float2(_1770, _1772);
    float3 _1791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5707, float2(0.0), isnan(_5707)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5707, float2(0.0), isnan(_5707)), level(0.0)).xyz;
    float _1793 = _1791.x;
    float _1795 = _1791.y;
    float _1797 = _1791.z;
    float _1799 = float(uint(_774));
    float _1801 = trunc(_906);
    int _1803 = int(_1801);
    bool _1805 = _774 == 0;
    float _1807 = _930 * _168;
    int _1809 = _774 + (-1);
    float _1811 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1813 = ~_774;
    int _1815 = _1813 + 1;
    int _1817 = abs(_780);
    float _1819 = 1.0 / _1799;
    int _1821 = abs(_786);
    bool _1823 = _694 > 0.5;
    bool _1825 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1827 = isnan(_684);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1833 = _1829 || _1831;
    float _1835 = float(_1833);
    float _1837 = float(uint(_1803));
    float _1839 = trunc(_1807);
    int _1841 = int(_1839);
    int _1843 = as_type<int>(_1819) + (-2);
    float _1845 = exp2(_1811);
    float _1847 = as_type<float>(_1843) * _1837;
    float _1849 = trunc(_1847);
    float _1851 = precise::max(_1849, 0.0);
    uint _1854 = uint(_1851);
    float _1856 = -_1845;
    float _1858 = _1856 + 1.0;
    int _1860 = _1815 * int(_1854);
    int _1862 = _1860 + _1803;
    float _1864 = float(uint(_1862));
    float _1866 = as_type<float>(_1843) * _1864;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    int _1872 = ~_774;
    int _1874 = _1872 + 1;
    bool _1876 = !_1870;
    float _1878 = _1876 ? 7.345489978790283203125 : 1.0;
    float _1880 = trunc(_1866);
    float _1882 = precise::max(_1880, 0.0);
    uint _1884 = uint(_1882);
    float _1886 = _1878 * _692;
    float _1888 = float(_1803);
    bool _1890 = _1888 >= _908;
    bool _1892 = isnan(_1888);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(_908);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    float _1902 = trunc(_1900);
    int _1904 = int(_1902);
    int _1906 = int(_1854) + int(_1884);
    float _1908 = floor(_1886);
    int _1910 = _1874 * _1906;
    int _1912 = _1910 + _1803;
    bool _1914 = uint(_1912) >= uint(_774);
    bool _1916 = !_1914;
    int _1918 = _1916 ? 0 : (-1);
    int _1920 = ~_1906;
    int _1922 = _1920 + _1918;
    int _1924 = _1922 + 1;
    float _1926 = -_1908;
    float _1928 = _1886 + _1926;
    int _1930 = ~_1904;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1928 * _908;
    int _1938 = _774 * _1924;
    int _1940 = _1938 + _1803;
    float _1942 = -_1835;
    float _1944 = _1942 + 1.0;
    bool _1946 = !_1805;
    int _1948 = _1946 ? _1940 : (-1);
    float _1950 = trunc(_1936);
    int _1952 = int(_1950);
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1956 = _1954 != 0;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1960 = _1958 != 0;
    int _1962 = _1948 * _1934;
    bool _1964 = !_1956;
    int _1966 = _1964 ? 0 : 1;
    int _1968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1970 = _1968 != 0;
    int _1972 = _1904 * _1809;
    int _1974 = _1972 + _1962;
    bool _1976 = !_1970;
    int _1978 = _1976 ? 0 : 1;
    int _1980 = abs(_838);
    int _1982 = _1974 * _1817;
    int _1984 = abs(_1966);
    int _1986 = abs(_1978);
    int _1988 = _1952 * _1984;
    int _1990 = _1988 + _1803;
    int _1992 = _1841 * _1821;
    int _1994 = _1992 + _1982;
    float _1996 = as_type<float>(_1980);
    if (_1960)
    {
        float _1998 = in.m_57.x;
        _1996 = _1998;
    }
    float _2000 = _1996;
    int _2002 = ~_774;
    int _2004 = _2002 + 1;
    int _2006 = _1990 * _1980;
    int _2008 = _2006 + _1994;
    float _2010 = in.m_67.y;
    int _2012 = _1952 * _1986;
    int _2014 = _2012 + _2008;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2020 = in.m_67.x;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2024 = _2022 != 0;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2026;
    float _2030 = float(uint(_2014));
    float _2032 = 1.0 / _2018;
    bool _2034 = _1012 != 0.0;
    bool _2036 = isnan(_1012);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan(0.0);
    bool _2042 = _2038 || _2040;
    float _2044 = as_type<float>(_1843) * _2030;
    int _2046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2048 = _2046 != 0;
    bool _2050 = _1010 == 0.0;
    bool _2052 = !_2042;
    bool _2054 = _2050 && _2052;
    float _2056 = trunc(_2044);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2062 = _2000 > 0.5;
    bool _2064 = _2062 && _1960;
    bool _2066 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2068 = isnan(_684);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = in.m_71.x;
    float _2080 = in.m_71.y;
    float _2082 = in.m_71.z;
    bool _2084 = _1014 == 0.0;
    bool _2086 = _2084 && _2054;
    float _2088 = _2028 * _2032;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2092 = _684 + _2090;
    float _2094 = float(uint(_1990));
    float _2096 = fma(_2088, _2092, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2098 = _2088;
    float _2100 = _2020;
    float _2102 = _2010;
    if (_1960)
    {
        _2098 = _2020;
    }
    float _2104 = _2098;
    float _2106 = as_type<float>(_1843) * _2094;
    float _2108 = _2076 * _1944;
    int _2110 = _2004 * int(_2060);
    int _2112 = _2110 + _2014;
    float _2114 = _2104;
    if (_2064)
    {
        float _2116 = -_2104;
        float _2118 = _2116 + 1.0;
        _2114 = _2118;
    }
    float _2120 = _2114;
    float _2122 = _2096 * _2108;
    float _2124 = trunc(_2106);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    float _2130 = float(uint(_2112));
    float _2132 = -_2076;
    float _2134 = _2132 + 1.0;
    if (_1960)
    {
        _2100 = _2120;
    }
    float _2136 = _2100;
    float _2138 = as_type<float>(_1843) * _2130;
    float _2140 = -_2010;
    float _2142 = _2140 + 1.0;
    float _2144 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2146 = _2078;
    float _2148 = _2080;
    float _2150 = _2082;
    if (!_2086)
    {
        float _2152 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2078);
        _2146 = _2152;
    }
    float _2154 = _2146;
    if (!_2086)
    {
        float _2156 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2080);
        _2148 = _2156;
    }
    float _2158 = _2148;
    if (!_2086)
    {
        float _2160 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2082);
        _2150 = _2160;
    }
    float _2162 = _2150;
    float _2164 = trunc(_2138);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    if (_2024)
    {
        float _2170 = _1823 ? _2142 : _2010;
        _2102 = _2170;
    }
    float _2172 = _2102;
    float _2174 = fma(_902, _2144, _730);
    int _2176 = ~_774;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2122);
    float _2182 = _664 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2186 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2190 = -_898;
    float _2192 = fma(_872, _2184, _2190);
    int _2194 = ~_774;
    int _2196 = _2194 + 1;
    int _2198 = _2178 * int(_2128);
    int _2200 = _2198 + _1990;
    float _2202 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    int _2204 = int(_2060) + int(_2168);
    float _2206 = abs(_1332);
    float _2208 = log2(_2206);
    float _2210 = float(uint(_2200));
    float _2212 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2180);
    float _2214 = _2192 + 0.5;
    int _2216 = _2196 * _2204;
    int _2218 = _2216 + _2014;
    float _2220 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2222 = as_type<float>(_1843) * _2210;
    float _2224 = _662 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2228 = uint(_2218) >= uint(_774);
    float _2230 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2234 = trunc(_2222);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    bool _2240 = !_2228;
    int _2242 = _2240 ? 0 : (-1);
    float _2244 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2246 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2248 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2250 = ~_2204;
    int _2252 = _2250 + _2242;
    int _2254 = _2252 + 1;
    float _2256 = _2174 + 0.5;
    out.m_73.x = _2244;
    out.m_73.y = _2232;
    out.m_73.z = _2188;
    out.m_73.w = _2226;
    float _2258 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2260 = _774 * _2254;
    int _2262 = _2260 + _2014;
    float _2264 = exp2(_2248);
    int _2266 = ~_774;
    int _2268 = _2266 + 1;
    out.m_75.x = _2256;
    out.m_75.y = _2214;
    float _2270 = -_1076;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2258);
    bool _2274 = !_1805;
    int _2276 = _2274 ? _2262 : (-1);
    float _2278 = -_1076;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2246);
    int _2282 = int(_2128) + int(_2238);
    float _2284 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2272);
    float _2286 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2288 = _2276 & 3;
    bool _2290 = _2288 != 0;
    float _2292 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2294 = _2276 >> 31;
    int _2296 = _2268 * _2282;
    int _2298 = _2296 + _1990;
    float _2300 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2302 = -_1076;
    float _2304 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    int _2306 = _2294 & 3;
    float _2308 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2310 = precise::clamp(_2308, 0.0, 1.0);
    bool _2312 = uint(_2298) >= uint(_774);
    float _2314 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    int _2316 = _2276 + _2306;
    float _2318 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2320 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2322 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2280);
    int _2324 = _2316 >> 2;
    float _2326 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2318);
    float _2328 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2320);
    float _2330 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2300);
    int _2332 = _2324 << 4;
    int _2334 = _2332 + 368;
    float _2336 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2286);
    float _2338 = _2322 * _2158;
    float _2340 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2326);
    uint _2342 = uint(int(uint(_2334) >> uint(2)));
    uint _2344 = uint(int(uint(int(_2342)) >> uint(2)));
    int _2346 = int(_2342) & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    int _2350 = int(_2342) + 1;
    uint _2352 = uint(int(uint(_2350) >> uint(2)));
    int _2354 = _2350 & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    float _2358 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2328);
    float _2360 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2330);
    int _2362 = _2276 & 3;
    bool _2364 = _2362 != 0;
    float _2366 = _2310 * _2310;
    float _2368 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2220);
    bool _2370 = uint(_2362) > 1u;
    int _2372 = _2334 + 8;
    uint _2374 = uint(int(uint(_2372) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    float _2390 = _2284 * _2158;
    float _2392 = fma(_2310, -2.0, 3.0);
    int _2394 = _2290 ? 0 : 1;
    float _2396 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2202);
    bool _2398 = _2362 != 3;
    float _2400 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2368);
    int _2402 = ~_2394;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    float _2408 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2336);
    bool _2410 = !_2312;
    int _2412 = _2410 ? 0 : (-1);
    float _2414 = _2314 * _2158;
    bool _2416 = uint(_2362) >= 2u;
    float _2418 = fma(_2358, _2154, _2338);
    int _2420 = _2406;
    if (!_2370)
    {
        int _2422 = ~_2394;
        int _2424 = _2422 + 1;
        _2420 = _2424;
    }
    int _2426 = _2420;
    float _2428 = fma(_2340, _2154, _2390);
    bool _2430 = !_2364;
    int _2432 = _2430 ? 0 : 1;
    float _2434 = _2366 * _2392;
    int _2436 = abs(_2426);
    float _2438 = fma(_2360, _2154, _2414);
    int _2440 = ~_2282;
    int _2442 = _2440 + _2412;
    int _2444 = _2442 + 1;
    float _2446 = fma(_2400, _2162, _2418);
    int _2448 = _2416 ? 0 : 1;
    float _2450 = in.m_77.x;
    bool _2452 = _2362 != 3;
    float _2454 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2456 = abs(_2432);
    int _2458 = _774 * _2444;
    int _2460 = _2458 + _1990;
    float _2462 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2454);
    int _2464 = ~_2448;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    float _2470 = -_1774;
    float _2472 = _2470 + 1.0;
    bool _2474 = !_2452;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2462);
    int _2480 = _2468;
    if (_2398)
    {
        int _2482 = ~_2448;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    float _2488 = fma(_2396, _2162, _2428);
    int _2490 = ~_2436;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    float _2496 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    bool _2498 = !_2048;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = fma(_2408, _2162, _2438);
    int _2504 = abs(_2476);
    int _2506 = _2494 * as_type<int>(_2356);
    int _2508 = abs(_2486);
    float _2510 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2512 = ~_2456;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    out.gl_Position.x = _1752;
    out.gl_Position.y = _1754;
    out.gl_Position.z = _2496;
    out.gl_Position.w = _1698;
    int _2518 = abs(_2500);
    float _2520 = _2510 * _1776;
    int _2522 = _2516 * as_type<int>(_2348);
    int _2524 = _2522 + _2506;
    int _2526 = ~_2508;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    float _2532 = -_2510;
    float _2534 = _2532 + 1.0;
    int _2536 = ~_2504;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    out.m_79.x = _2488;
    out.m_79.y = _2446;
    out.m_79.z = _2502;
    bool _2542 = _1332 <= 8000.0;
    bool _2544 = isnan(_1332);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(8000.0);
    bool _2550 = _2546 || _2548;
    float _2552 = float(_2550);
    int _2554 = _2530 * as_type<int>(_2380);
    int _2556 = _2554 + _2524;
    float _2558 = _2496 + _1698;
    bool _2560 = !_1805;
    int _2562 = _2560 ? _2460 : (-1);
    int _2564 = _2540 * as_type<int>(_2388);
    int _2566 = _2564 + _2556;
    float _2568 = -_2434;
    float _2570 = _2568 + 1.0;
    int _2572 = ~_2518;
    int _2574 = _2572 + 1;
    int _2576 = _2574 + 1;
    float _2578 = _2558 * 0.5;
    float _2580 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2434);
    float _2582 = _1698 * 0.5;
    int _2584 = _2566 * _2576;
    float _2586 = _2552 * _2580;
    float _2588 = fma(_1754, -0.5, _2582);
    int _2590 = _2562 * _2518;
    int _2592 = _2590 + _2584;
    float _2594 = _1752 + _1698;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2598 = _1797 * _2520;
    bool _2600 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2602 = isnan(_1484);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2608 = _2604 || _2606;
    float _2610 = _2594 * 0.5;
    float _2612 = _2472 * _2596;
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = _1787 * _2520;
    float _2618 = fma(_1787, _2598, _1785);
    float _2620 = float(_2592);
    float _2622 = -_2614;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2610;
    out.m_81.y = _2588;
    out.m_81.z = _2578;
    out.m_81.w = _1698;
    float _2626 = fma(_1793, _2616, _1781);
    float _2628 = fma(_1795, _2616, _1783);
    float _2630 = _2624 * _2450;
    float _2632 = _1787 * _2534;
    out.m_83.x = _2620;
    float _2634 = _2616;
    float _2636 = _2534;
    float _2638 = _2598;
    float _2640 = _2520;
    float _2642 = _2620;
    float _2644 = _2630;
    if (!_2608)
    {
        _2634 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2646 = _2634;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2608)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2652 = _2636;
    out.m_85.x = _2626;
    out.m_85.y = _2628;
    out.m_85.z = _2618;
    out.m_85.w = _2632;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2608)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2658 = _2638;
    float _2660 = _2658;
    float _2662 = _2658;
    if (!_2608)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2664 = _2640;
    float _2666 = _2630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2668 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2670 = _2664;
    float _2672 = _2664;
    if (!_2608)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2642;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2608)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2680 = _2644;
    out.m_87.x = _2666;
    bool _2682 = !_2608;
    float _2684 = _2680;
    float _2686 = _2680;
    if (!_2682)
    {
        bool _2688 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2690 = isnan(_1484);
        bool _2692 = _2688 || _2690;
        bool _2694 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2696 = _2692 || _2694;
        if (!_2696)
        {
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2700 = _1484 + _2698;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2704 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2702;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2710 = 1.0 / _2704;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2728 = _2700 * _2710;
            float _2730 = precise::clamp(_2728, 0.0, 1.0);
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2736 = fma(_2730, _2708, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2738 = fma(_2730, _2734, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2740 = fma(_2730, _2714, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2742 = fma(_2730, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2744 = fma(_2730, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2746 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2656 = _2740;
            _2672 = _2744;
            _2650 = _2736;
            _2662 = _2742;
            _2678 = _2738;
            _2686 = _2746;
            _2748 = true;
        }
        else
        {
            bool _2750 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2752 = isnan(_1484);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2758 = _2754 || _2756;
            if (!_2758)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2760 = _2648;
            _2650 = _2760;
            if (!_2758)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2762 = _2654;
            _2656 = _2762;
            if (!_2758)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2764 = _2676;
            _2678 = _2764;
            if (!_2758)
            {
                _2660 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2766 = _2660;
            _2662 = _2766;
            if (!_2758)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2768 = _2670;
            _2672 = _2768;
            if (!_2758)
            {
                _2684 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2770 = _2684;
            bool _2772 = !_2758;
            _2686 = _2770;
            if (!_2772)
            {
                bool _2774 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2776 = isnan(_1484);
                bool _2778 = _2774 || _2776;
                bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2782 = _2778 || _2780;
                if (!_2782)
                {
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2786 = _1484 + _2784;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2788;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2796 = 1.0 / _2790;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2814 = _2786 * _2796;
                    float _2816 = precise::clamp(_2814, 0.0, 1.0);
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2822 = fma(_2816, _2794, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2824 = fma(_2816, _2820, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2826 = fma(_2816, _2800, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2828 = fma(_2816, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2830 = fma(_2816, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2832 = fma(_2816, _2812, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2656 = _2826;
                    _2672 = _2830;
                    _2650 = _2822;
                    _2662 = _2828;
                    _2678 = _2824;
                    _2686 = _2832;
                    _2748 = true;
                }
                else
                {
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2662 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2686 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2748 = false;
    float _2834 = _2656;
    float _2836 = _2672;
    float _2838 = _2650;
    float _2840 = _2662;
    float _2842 = _2678;
    float _2844 = _2686;
    float _2846 = _2668 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2848 = fma(_2446, -0.5, 0.5);
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = -_2834;
    float _2854 = _2852 + _2836;
    float _2856 = -_2838;
    float _2858 = _2856 + _2840;
    out.m_53.x = _2846;
    float _2860 = -_2842;
    float _2862 = _2860 + _2844;
    float _2864 = fma(_2850, _2854, _2834);
    float _2866 = fma(_2850, _2858, _2838);
    bool _2868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2870 = _2864 * 0.586610972881317138671875;
    float _2872 = fma(_2850, _2862, _2842);
    out.m_89.x = 0.0;
    bool _2874 = _1460 > 0.0;
    bool _2876 = isnan(_1460);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan(0.0);
    bool _2882 = _2878 || _2880;
    float _2884 = fma(_2866, 0.298911988735198974609375, _2870);
    float _2886 = fma(_2872, 0.114477999508380889892578125, _2884);
    float _2888 = -_2886;
    float _2890 = _2866 + _2888;
    float _2892 = -_2886;
    float _2894 = _2864 + _2892;
    float _2896 = -_2886;
    float _2898 = _2872 + _2896;
    float _2900 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    float _2902 = fma(_2894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    float _2904 = fma(_2898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    bool _2906 = !_2868;
    if (!_2906)
    {
        float _2908 = -_1394;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2912 = -_1396;
        float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2916 = -_1398;
        float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2920 = _2910 * _2910;
        float _2922 = fma(_2914, _2914, _2920);
        float _2924 = fma(_2918, _2918, _2922);
        float _2926 = sqrt(_2924);
        float _2928 = rsqrt(_2924);
        float _2930 = -_2926;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = _2914 * _2928;
        float _2940 = _2910 * _2928;
        float _2942 = abs(_2936);
        float _2944 = log2(_2942);
        float _2946 = _2918 * _2928;
        float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2950 = _2446 * _2940;
        float _2952 = -_2940;
        float _2954 = -_2948;
        float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
        float _2958 = fma(_2488, _2938, _2950);
        float _2960 = -_2946;
        float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
        float _2964 = fma(_2502, _2946, _2958);
        float _2966 = precise::clamp(_2964, 0.0, 1.0);
        float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2970 = _2962 + _2968;
        float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2976 = precise::clamp(_2974, 0.0, 1.0);
        float _2978 = exp2(_2972);
        float _2980 = _2978 * _2976;
        float _2982 = _2966 * _2980;
        float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2984;
        out.m_89.y = _2986;
        out.m_89.z = _2988;
    }
    out.m_91.x = _2900;
    out.m_91.y = _2902;
    out.m_91.z = _2904;
    if (_2882)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2990;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2748 = false;
    bool _578 = false;
    bool _442 = false;
    bool _322 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_134);
        out.gl_Position.z = _3058;
    }
    if (!_120)
    {
        return out;
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3113 = as_type<float>(_160);
        out.gl_Position.z = _3113;
    }
    if (_154)
    {
        return out;
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _274 * _262;
    float _286 = _282 * _262;
    float _288 = _280 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _172;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_59.x;
    float _328 = in.m_59.y;
    float _330 = in.m_59.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    bool _336 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_324);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -_346;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _352;
    float _360 = _300 * _330;
    float _362 = _298 * _328;
    float _364 = _334 * _358;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _372 = isnan(_324);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = _380 * _356;
    float _394 = fma(_384, _364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_388, _364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_380;
    float _400 = _398 + 1.0;
    float _402 = _390 * _392;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = _296 * _326;
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _416 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].y, _412);
    float _420 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].z, _414);
    bool _422 = !_348;
    float _440;
    if (!_422)
    {
        float _424 = in.m_57.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _172;
    }
    _442 = false;
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _444 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _454 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _456 = isnan(_444);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _470 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _472 = isnan(_444);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _482;
    bool _486 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _488 = isnan(_444);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = 1.0 / _452;
    float _500 = -_464;
    float _502 = _500 + 1.0;
    bool _504 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _506 = _480 * _502;
    float _508 = -_480;
    float _510 = _508 + 1.0;
    float _512 = 1.0 / _468;
    float _514 = _484 * _498;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _520 = fma(_514, _448, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _522 = _518 * _512;
    float _524 = _520 * _506;
    float _526 = -_496;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _444 + _530;
    float _534 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _536 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[115].x, _524);
    float _538 = _464 * _528;
    float _540 = fma(_522, _532, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _542 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _544 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = fma(_540, _538, _536);
    float _548 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[117].x, _546);
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _544;
    out.m_61.y = _554;
    out.m_61.z = _550;
    out.m_61.w = _556;
    bool _558 = !_504;
    float _576;
    if (!_558)
    {
        float _560 = in.m_57.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        _576 = _172;
    }
    _578 = false;
    float _580 = _576;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _584 = _580 + _582;
    bool _586 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _588 = isnan(_580);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _598;
    bool _602 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _604 = isnan(_580);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -_596;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _618;
    float _622 = 1.0 / _600;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _626 = _612 * _616;
    float _628 = -_612;
    float _630 = _628 + 1.0;
    float _632 = _584 * _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _634;
    float _638 = fma(_620, _632, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _640;
    float _644 = fma(_636, _632, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _646 = _638 * _626;
    float _648 = fma(_642, _632, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _650 = _644 * _626;
    float _652 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].x, _646);
    float _654 = _648 * _626;
    float _656 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].x, _652);
    float _658 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].y, _654);
    float _660 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].z, _650);
    float _662 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].y, _658);
    float _664 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].z, _660);
    bool _666 = !_624;
    if (!_666)
    {
        float _668 = in.m_57.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _194 = _682;
    }
    float _684 = _194;
    float _686 = in.m_57.z;
    float _688 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _690 = log2(_688);
    float _692 = in.m_57.x;
    float _694 = in.m_57.y;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _698 = int(_696);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _704 = _690 * _116;
    float _706 = exp2(_704);
    float _708 = _686 * 2.0;
    float _710 = _692 * 2.0;
    float _712 = _694 * 2.0;
    float _714 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _716 = floor(_708);
    float _718 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _720 = -_700;
    float _722 = fma(_714, 2.0, _720);
    float _724 = _694 + _692;
    float _726 = fma(_718, -2.0, _702);
    float _728 = -_116;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[76].x, _722);
    float _732 = floor(_710);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _724 + (-1.0);
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _742 = floor(_712);
    bool _744 = _716 >= 0.0;
    bool _746 = isnan(_716);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _756 = 1.0 + _754;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _768 = _766 != 0;
    int _770 = _752 ? 0 : 1;
    float _772 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _774 = int(_772);
    bool _776 = _732 > 0.0;
    bool _778 = !_764;
    int _780 = _778 ? 0 : 1;
    bool _782 = _716 > 0.0;
    bool _784 = !_760;
    int _786 = _784 ? 0 : 1;
    float _788 = 1.0 / _756;
    bool _790 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _792 = isnan(0.0);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _798 = _794 || _796;
    bool _800 = _732 >= 0.0;
    bool _802 = isnan(_732);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = _742 > 0.0;
    bool _812 = _742 >= 0.0;
    bool _814 = isnan(_742);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    int _822 = ~_770;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    if (!_782)
    {
        int _830 = ~_770;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    bool _836 = !_768;
    int _838 = _836 ? 0 : 1;
    float _840 = _798 ? _736 : 0.0;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = float(_698);
    float _858 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _860 = in.m_63.x;
    float _862 = in.m_63.y;
    float _864 = in.m_63.z;
    bool _866 = !_846;
    int _868 = _866 ? 0 : 1;
    float _870 = 1.0 / _856;
    float _872 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _858);
    int _874 = _808 ? 0 : 1;
    bool _876 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(1.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _888 = float(_834);
    int _890 = abs(_868);
    float _892 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].z, _886);
    bool _894 = !_850;
    int _896 = _894 ? 0 : 1;
    float _898 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _726);
    float _900 = float(_890);
    float _902 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _892);
    int _904 = abs(_896);
    float _906 = _870 * _116;
    float _908 = float(_774);
    float _910 = _900 * _888;
    int _912 = ~_874;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = _692 + (-0.5);
    int _920 = _916;
    if (!_776)
    {
        int _922 = ~_874;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _910 * (-2.0);
    float _930 = _908 * _116;
    if (_884)
    {
        float _932 = _840 * _788;
        _126 = _932;
    }
    float _934 = _126;
    int _936 = _820 ? 0 : 1;
    float _938 = fma(_928, _860, _860);
    bool _940 = !_854;
    int _942 = _940 ? 0 : 1;
    float _944 = float(_926);
    float _946 = fma(_740, _928, _740);
    float _948 = float(_904);
    float _950 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    int _952 = ~_936;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = _956;
    if (!_810)
    {
        int _960 = ~_936;
        int _962 = _960 + 1;
        _958 = _962;
    }
    int _964 = _958;
    float _966 = _948 * _944;
    int _968 = abs(_942);
    float _970 = _694 + _686;
    float _972 = float(_964);
    float _974 = fma(_946, _934, _950);
    float _976 = float(_968);
    float _978 = _970 + (-1.0);
    float _980 = _966 * (-2.0);
    float _982 = _974 * 0.15915493667125701904296875;
    float _984 = _976 * _972;
    float _986 = _694 + (-0.5);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _990 = fma(_980, _862, _862);
    float _992 = _686 + _692;
    float _994 = fma(_988, _980, _988);
    float _996 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    float _998 = _992 + (-1.0);
    float _1000 = _984 * (-2.0);
    float _1002 = _686 + (-0.5);
    float _1004 = fma(_994, _934, _996);
    float _1006 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1008 = fma(_1000, _864, _864);
    float _1010 = in.m_65.x;
    float _1012 = in.m_65.y;
    float _1014 = in.m_65.z;
    float _1016 = _982 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = fma(_1006, _1000, _1006);
    float _1022 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1008);
    float _1024 = _1004 * 0.15915493667125701904296875;
    float _1026 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1028 = fma(_1020, _934, _1022);
    float _1030 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = _982 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    float _1036 = _1024 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1028 * 0.15915493667125701904296875;
    float _1042 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1044 = in.m_46.x;
    float _1046 = in.m_46.y;
    float _1048 = in.m_46.z;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1052 = _1024 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1058 = _1042 * _1050;
    float _1060 = _1026 * _1056;
    float _1062 = _1040 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1014);
    float _1068 = _1018 * _1038;
    float _1070 = _1030 * _1066;
    float _1072 = _1034 * _1038;
    float _1074 = _1040 * 6.283185482025146484375;
    float _1076 = sin(_1074);
    float _1078 = _1034 * _1054;
    float _1080 = _1018 * _1054;
    float _1082 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1034 * _1064;
    float _1086 = _1018 * _1064;
    float _1088 = _1054 * _1064;
    float _1090 = _1038 * _1064;
    float _1092 = _1084 * _1060;
    float _1094 = _1086 * _1060;
    float _1096 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1098 = fma(_1076, _1078, _1068);
    float _1100 = -_1072;
    float _1102 = fma(_1076, _1080, _1100);
    float _1104 = -_1080;
    float _1106 = fma(_1076, _1072, _1104);
    float _1108 = -_1060;
    float _1110 = _1076 * _1108;
    float _1112 = fma(_1098, _1058, _1092);
    float _1114 = fma(_1102, _1058, _1094);
    float _1116 = fma(_1076, _1068, _1078);
    float _1118 = fma(_1088, _1058, _1110);
    float _1120 = fma(_1106, _1070, _1112);
    float _1122 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1124 = fma(_1116, _1070, _1114);
    float _1126 = fma(_1090, _1070, _1118);
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1130 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1132 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1122);
    float _1134 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1136 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1128);
    float _1138 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1140 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1132);
    float _1142 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1134);
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1136);
    float _1146 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1150 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1142);
    float _1152 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1154 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1156 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1096);
    float _1158 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1160 = _1148 + _1152;
    float _1162 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1164 = _1156 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1166 = _1154 + _1158;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1162);
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1178 = _1166 + _1176;
    float _1180 = _1170 * _1170;
    float _1182 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1184 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1174);
    float _1186 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1188 = fma(_1178, _1178, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1192 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1184);
    float _1194 = sqrt(_1188);
    float _1196 = _1164 + _1190;
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1200 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1048;
    float _1204 = _1184;
    float _1206 = _1196;
    float _1208 = _1198;
    float _1210 = _1186;
    float _1212 = _1154;
    if (!_1200)
    {
        _1202 = _1166;
    }
    float _1214 = _1202;
    float _1216 = _1214;
    if (!_1200)
    {
        _1204 = _1160;
    }
    float _1218 = _1204;
    bool _1220 = !_1200;
    float _1222 = _1218;
    if (!_1220)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1228 = _1194 + _1226;
        float _1230 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = rsqrt(_1188);
        float _1234 = _1228 * _1224;
        float _1236 = _1234 * 0.15915493667125701904296875;
        float _1238 = _1236 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1236 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240 + (-1.0);
        float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1252 = fma(_1196, _1240, _1248);
        float _1254 = _1232 * _1250;
        float _1256 = fma(_1178, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1258 = fma(_1170, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1206 = _1252;
        _1216 = _1256;
        _1222 = _1258;
    }
    float _1260 = _1206;
    float _1262 = _1216;
    float _1264 = _1222;
    float _1266 = -_1164;
    float _1268 = _1266 + _1260;
    float _1270 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1186);
    float _1272 = -_1154;
    float _1274 = _1272 + _1262;
    float _1276 = 1.0 / _1198;
    float _1278 = _1268 * _1268;
    float _1280 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1270);
    float _1282 = -_1148;
    float _1284 = _1282 + _1264;
    float _1286 = fma(_1274, _1274, _1278);
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1290 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1292 = isnan(0.5);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1298 = _1294 || _1296;
    float _1300 = fma(_1284, _1284, _1286);
    float _1302 = _1288 + _1198;
    float _1304 = sqrt(_1300);
    float _1306 = _1302 * _1276;
    float _1308 = _1306 * 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1312 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
    float _1314 = _1260;
    float _1316 = _1264;
    float _1318 = _1312;
    float _1320 = _1300;
    float _1322 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1298)
    {
        _1208 = 1.0;
    }
    float _1324 = _1208;
    float _1326 = 1.0 / _1312;
    bool _1328 = _1304 > 0.0;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1332 = _1326 * _1330;
    float _1334 = _1304;
    float _1336 = _1324;
    if (!_1328)
    {
        _1334 = _1262;
    }
    float _1338 = _1334;
    bool _1340 = !_1328;
    float _1342 = _1338;
    if (!_1340)
    {
        float _1344 = _188 * _188;
        float _1346 = rsqrt(_1300);
        float _1348 = fma(_186, _186, _1344);
        float _1350 = fma(_190, _190, _1348);
        float _1352 = sqrt(_1350);
        float _1354 = _1274 * _1346;
        float _1356 = _1268 * _1346;
        float _1358 = _1284 * _1346;
        bool _1360 = _1352 > 0.0;
        float _1362 = _1352;
        _1318 = _1350;
        _1320 = _1346;
        _1322 = _1356;
        _1210 = _1358;
        if (!_1360)
        {
            _1362 = _1262;
        }
        float _1364 = _1362;
        bool _1366 = !_1360;
        _1342 = _1364;
        if (!_1366)
        {
            float _1368 = rsqrt(_1350);
            float _1370 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1372 = _188 * _1368;
            float _1374 = _186 * _1368;
            float _1376 = _1356 * _1372;
            float _1378 = _190 * _1368;
            float _1380 = fma(_1354, _1374, _1376);
            float _1382 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1384 = fma(_1358, _1378, _1380);
            float _1386 = _1384 * _1382;
            float _1388 = fma(_186, _1386, _1262);
            float _1390 = fma(_188, _1386, _1260);
            float _1392 = fma(_190, _1386, _1264);
            _1314 = _1390;
            _1342 = _1388;
            _1316 = _1392;
            _1318 = _1368;
        }
    }
    float _1394 = _1314;
    float _1396 = _1342;
    float _1398 = _1316;
    float _1400 = _1318;
    float _1402 = _1320;
    float _1404 = _1322;
    float _1406 = _1210;
    float _1408 = _1404;
    float _1410 = _1406;
    if (!_1298)
    {
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = _1412 * 0.15915493667125701904296875;
        float _1416 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1418 = _1414 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 0.15915493667125701904296875;
        float _1424 = _1414 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = 1.0 / _1420;
        float _1430 = _1422 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = _1422 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = 1.0 / _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1444;
        float _1448 = 1.0 / _1446;
        float _1450 = _1438 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1454 = fma(_1332, _1450, _1452);
        float _1456 = _1454 * _1448;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        _1336 = _1458;
    }
    float _1460 = _1336;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1394 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1396 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1398 + _1470;
    float _1474 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1476 = _1464 * _1464;
    float _1478 = fma(_1468, _1468, _1476);
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = rsqrt(_1480);
    float _1484 = sqrt(_1480);
    float _1486 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1488 = _1468 * _1486;
    float _1490 = _1472 * _1486;
    float _1492 = _1488 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 + _1494;
    float _1498 = sqrt(_1496);
    bool _1500 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = _1498 + _1502;
    float _1506 = _1400;
    float _1508 = _1496;
    float _1510 = _1504;
    float _1512 = _1488;
    float _1514 = _1490;
    float _1516 = _1492;
    float _1518 = _1494;
    if (_1500)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1520;
    }
    float _1522 = _1506;
    if (_1500)
    {
        float _1524 = rsqrt(_1496);
        _1508 = _1524;
    }
    float _1526 = _1508;
    if (_1500)
    {
        float _1528 = _1504 * _1522;
        _1510 = _1528;
    }
    float _1530 = _1510;
    if (_1500)
    {
        float _1532 = _1530 * 0.15915493667125701904296875;
        _1408 = _1532;
    }
    float _1534 = _1408;
    float _1536 = _1402;
    if (_1500)
    {
        float _1538 = _1534 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        _1536 = _1540;
    }
    float _1542 = _1536;
    float _1544 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1546 = precise::max(0.0, _1544);
    float _1548 = _1522;
    if (_1500)
    {
        float _1550 = _1534 * 6.283185482025146484375;
        float _1552 = cos(_1550);
        _1548 = _1552;
    }
    float _1554 = _1548;
    float _1556 = -_1486;
    float _1558 = -_1546;
    float _1560 = fma(_1464, _1556, _1558);
    if (_1500)
    {
        float _1562 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1410 = _1562;
    }
    float _1564 = _1410;
    float _1566 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1568 = _1564;
    float _1570 = _1542;
    if (_1500)
    {
        float _1572 = fma(_1542, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = _1574;
    if (!_1500)
    {
        _1570 = _1560;
    }
    float _1578 = _1570;
    float _1580 = floor(_1566);
    float _1582 = _1578;
    if (_1500)
    {
        float _1584 = _1554 + (-1.0);
        _1212 = _1584;
    }
    float _1586 = _1212;
    float _1588 = _1586;
    if (_1500)
    {
        float _1590 = _1526 * _1574;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1500)
    {
        float _1594 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1594;
    }
    float _1596 = _1588;
    if (_1500)
    {
        float _1598 = _1488 * _1592;
        _1512 = _1598;
    }
    float _1600 = _1512;
    if (_1500)
    {
        float _1602 = _1490 * _1592;
        _1514 = _1602;
    }
    float _1604 = _1514;
    float _1606 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1500)
    {
        float _1608 = fma(_1560, _1554, _1596);
        _1582 = _1608;
    }
    float _1610 = _1582;
    if (_1500)
    {
        float _1612 = _1600 * _1600;
        _1516 = _1612;
    }
    float _1614 = _1516;
    if (_1500)
    {
        float _1616 = _1604 * _1604;
        _1518 = _1616;
    }
    float _1618 = _1518;
    float _1620 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1606);
    float _1622 = fma(_1610, _1610, _1614);
    float _1624 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1474);
    float _1626 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1620);
    float _1628 = _1622 + _1618;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1632 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1634 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1638 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1632);
    float _1640 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1642 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1644 = floor(_1636);
    float _1646 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    float _1648 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1640);
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1652 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1650);
    float _1654 = precise::clamp(_1652, 0.0, 1.0);
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1658 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1660 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = -_1654;
    float _1664 = _1662 + 1.0;
    float _1666 = rsqrt(_1628);
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1670 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1624);
    float _1672 = -_1580;
    float _1674 = _1566 + _1672;
    float _1676 = -_1656;
    float _1678 = fma(_1676, _1630, 1.0);
    float _1680 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1668);
    float _1682 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1684 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1686 = abs(_1664);
    float _1688 = log2(_1686);
    float _1690 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1680);
    float _1692 = -_1644;
    float _1694 = _1636 + _1692;
    float _1696 = _1666 * _1600;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1690);
    float _1700 = _1666 * _1610;
    float _1702 = _1666 * _1604;
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = log2(_1678);
    float _1708 = -_1704;
    float _1710 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1708);
    float _1712 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1702;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1710);
    float _1718 = 1.0 / _1698;
    float _1720 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1722 = fma(_1716, -0.5, 0.5);
    float _1724 = fma(_1716, 0.5, 0.5);
    float _1726 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1720);
    float _1728 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1684);
    float _1730 = _1700 + 1.0;
    float _1732 = exp2(_1712);
    float _1734 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1726);
    float _1738 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1728);
    float _1740 = _1706 * 0.693147182464599609375;
    float _1742 = fma(_1724, _1734, -0.212114393711090087890625);
    float _1744 = sqrt(_1722);
    float _1746 = fma(_1724, _1742, 1.570728778839111328125);
    float _1748 = -_1700;
    float _1750 = fma(_1732, _1730, _1748);
    float _1752 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1736);
    float _1754 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1738);
    float _1756 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1758 = _1752 * _1718;
    float _1760 = _1754 * _1718;
    float _1762 = _1744 * 0.636619746685028076171875;
    float _1764 = fma(_1758, 0.5, 0.5);
    float _1766 = fma(_1760, -0.5, 0.5);
    float _1768 = -_1746;
    float _1770 = fma(_1762, _1768, 1.0);
    float _1772 = fma(_1750, 0.5, 0.5);
    float2 _5669 = float2(_1674, _1694);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5669, float2(0.0), isnan(_5669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5669, float2(0.0), isnan(_5669)), level(0.0)).x;
    float3 _5680 = float3(_1764, _1766, _1756);
    float _1776 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5680, float3(0.0), isnan(_5680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5680, float3(0.0), isnan(_5680)), level(0.0)).x;
    float3 _5691 = float3(_1764, _1766, _1756);
    float4 _1779 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5691, float3(0.0), isnan(_5691)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5691, float3(0.0), isnan(_5691)), level(0.0)).xyzw;
    float _1781 = _1779.x;
    float _1783 = _1779.y;
    float _1785 = _1779.z;
    float _1787 = _1779.w;
    float2 _5707 = float2(_1770, _1772);
    float3 _1791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5707, float2(0.0), isnan(_5707)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5707, float2(0.0), isnan(_5707)), level(0.0)).xyz;
    float _1793 = _1791.x;
    float _1795 = _1791.y;
    float _1797 = _1791.z;
    float _1799 = float(uint(_774));
    float _1801 = trunc(_906);
    int _1803 = int(_1801);
    bool _1805 = _774 == 0;
    float _1807 = _930 * _168;
    int _1809 = _774 + (-1);
    float _1811 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1813 = ~_774;
    int _1815 = _1813 + 1;
    int _1817 = abs(_780);
    float _1819 = 1.0 / _1799;
    int _1821 = abs(_786);
    bool _1823 = _694 > 0.5;
    bool _1825 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1827 = isnan(_684);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1833 = _1829 || _1831;
    float _1835 = float(_1833);
    float _1837 = float(uint(_1803));
    float _1839 = trunc(_1807);
    int _1841 = int(_1839);
    int _1843 = as_type<int>(_1819) + (-2);
    float _1845 = exp2(_1811);
    float _1847 = as_type<float>(_1843) * _1837;
    float _1849 = trunc(_1847);
    float _1851 = precise::max(_1849, 0.0);
    uint _1854 = uint(_1851);
    float _1856 = -_1845;
    float _1858 = _1856 + 1.0;
    int _1860 = _1815 * int(_1854);
    int _1862 = _1860 + _1803;
    float _1864 = float(uint(_1862));
    float _1866 = as_type<float>(_1843) * _1864;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    int _1872 = ~_774;
    int _1874 = _1872 + 1;
    bool _1876 = !_1870;
    float _1878 = _1876 ? 7.345489978790283203125 : 1.0;
    float _1880 = trunc(_1866);
    float _1882 = precise::max(_1880, 0.0);
    uint _1884 = uint(_1882);
    float _1886 = _1878 * _692;
    float _1888 = float(_1803);
    bool _1890 = _1888 >= _908;
    bool _1892 = isnan(_1888);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(_908);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    float _1902 = trunc(_1900);
    int _1904 = int(_1902);
    int _1906 = int(_1854) + int(_1884);
    float _1908 = floor(_1886);
    int _1910 = _1874 * _1906;
    int _1912 = _1910 + _1803;
    bool _1914 = uint(_1912) >= uint(_774);
    bool _1916 = !_1914;
    int _1918 = _1916 ? 0 : (-1);
    int _1920 = ~_1906;
    int _1922 = _1920 + _1918;
    int _1924 = _1922 + 1;
    float _1926 = -_1908;
    float _1928 = _1886 + _1926;
    int _1930 = ~_1904;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1928 * _908;
    int _1938 = _774 * _1924;
    int _1940 = _1938 + _1803;
    float _1942 = -_1835;
    float _1944 = _1942 + 1.0;
    bool _1946 = !_1805;
    int _1948 = _1946 ? _1940 : (-1);
    float _1950 = trunc(_1936);
    int _1952 = int(_1950);
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1956 = _1954 != 0;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1960 = _1958 != 0;
    int _1962 = _1948 * _1934;
    bool _1964 = !_1956;
    int _1966 = _1964 ? 0 : 1;
    int _1968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1970 = _1968 != 0;
    int _1972 = _1904 * _1809;
    int _1974 = _1972 + _1962;
    bool _1976 = !_1970;
    int _1978 = _1976 ? 0 : 1;
    int _1980 = abs(_838);
    int _1982 = _1974 * _1817;
    int _1984 = abs(_1966);
    int _1986 = abs(_1978);
    int _1988 = _1952 * _1984;
    int _1990 = _1988 + _1803;
    int _1992 = _1841 * _1821;
    int _1994 = _1992 + _1982;
    float _1996 = as_type<float>(_1980);
    if (_1960)
    {
        float _1998 = in.m_57.x;
        _1996 = _1998;
    }
    float _2000 = _1996;
    int _2002 = ~_774;
    int _2004 = _2002 + 1;
    int _2006 = _1990 * _1980;
    int _2008 = _2006 + _1994;
    float _2010 = in.m_67.y;
    int _2012 = _1952 * _1986;
    int _2014 = _2012 + _2008;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2020 = in.m_67.x;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2024 = _2022 != 0;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2026;
    float _2030 = float(uint(_2014));
    float _2032 = 1.0 / _2018;
    bool _2034 = _1012 != 0.0;
    bool _2036 = isnan(_1012);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan(0.0);
    bool _2042 = _2038 || _2040;
    float _2044 = as_type<float>(_1843) * _2030;
    int _2046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2048 = _2046 != 0;
    bool _2050 = _1010 == 0.0;
    bool _2052 = !_2042;
    bool _2054 = _2050 && _2052;
    float _2056 = trunc(_2044);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2062 = _2000 > 0.5;
    bool _2064 = _2062 && _1960;
    bool _2066 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2068 = isnan(_684);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = in.m_71.x;
    float _2080 = in.m_71.y;
    float _2082 = in.m_71.z;
    bool _2084 = _1014 == 0.0;
    bool _2086 = _2084 && _2054;
    float _2088 = _2028 * _2032;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2092 = _684 + _2090;
    float _2094 = float(uint(_1990));
    float _2096 = fma(_2088, _2092, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2098 = _2088;
    float _2100 = _2020;
    float _2102 = _2010;
    if (_1960)
    {
        _2098 = _2020;
    }
    float _2104 = _2098;
    float _2106 = as_type<float>(_1843) * _2094;
    float _2108 = _2076 * _1944;
    int _2110 = _2004 * int(_2060);
    int _2112 = _2110 + _2014;
    float _2114 = _2104;
    if (_2064)
    {
        float _2116 = -_2104;
        float _2118 = _2116 + 1.0;
        _2114 = _2118;
    }
    float _2120 = _2114;
    float _2122 = _2096 * _2108;
    float _2124 = trunc(_2106);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    float _2130 = float(uint(_2112));
    float _2132 = -_2076;
    float _2134 = _2132 + 1.0;
    if (_1960)
    {
        _2100 = _2120;
    }
    float _2136 = _2100;
    float _2138 = as_type<float>(_1843) * _2130;
    float _2140 = -_2010;
    float _2142 = _2140 + 1.0;
    float _2144 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2146 = _2078;
    float _2148 = _2080;
    float _2150 = _2082;
    if (!_2086)
    {
        float _2152 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2078);
        _2146 = _2152;
    }
    float _2154 = _2146;
    if (!_2086)
    {
        float _2156 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2080);
        _2148 = _2156;
    }
    float _2158 = _2148;
    if (!_2086)
    {
        float _2160 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2082);
        _2150 = _2160;
    }
    float _2162 = _2150;
    float _2164 = trunc(_2138);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    if (_2024)
    {
        float _2170 = _1823 ? _2142 : _2010;
        _2102 = _2170;
    }
    float _2172 = _2102;
    float _2174 = fma(_902, _2144, _730);
    int _2176 = ~_774;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2122);
    float _2182 = _664 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2186 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2190 = -_898;
    float _2192 = fma(_872, _2184, _2190);
    int _2194 = ~_774;
    int _2196 = _2194 + 1;
    int _2198 = _2178 * int(_2128);
    int _2200 = _2198 + _1990;
    float _2202 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    int _2204 = int(_2060) + int(_2168);
    float _2206 = abs(_1332);
    float _2208 = log2(_2206);
    float _2210 = float(uint(_2200));
    float _2212 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2180);
    float _2214 = _2192 + 0.5;
    int _2216 = _2196 * _2204;
    int _2218 = _2216 + _2014;
    float _2220 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2222 = as_type<float>(_1843) * _2210;
    float _2224 = _662 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2228 = uint(_2218) >= uint(_774);
    float _2230 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2234 = trunc(_2222);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    bool _2240 = !_2228;
    int _2242 = _2240 ? 0 : (-1);
    float _2244 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2246 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2248 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2250 = ~_2204;
    int _2252 = _2250 + _2242;
    int _2254 = _2252 + 1;
    float _2256 = _2174 + 0.5;
    out.m_73.x = _2244;
    out.m_73.y = _2232;
    out.m_73.z = _2188;
    out.m_73.w = _2226;
    float _2258 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2260 = _774 * _2254;
    int _2262 = _2260 + _2014;
    float _2264 = exp2(_2248);
    int _2266 = ~_774;
    int _2268 = _2266 + 1;
    out.m_75.x = _2256;
    out.m_75.y = _2214;
    float _2270 = -_1076;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2258);
    bool _2274 = !_1805;
    int _2276 = _2274 ? _2262 : (-1);
    float _2278 = -_1076;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2246);
    int _2282 = int(_2128) + int(_2238);
    float _2284 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2272);
    float _2286 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2288 = _2276 & 3;
    bool _2290 = _2288 != 0;
    float _2292 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2294 = _2276 >> 31;
    int _2296 = _2268 * _2282;
    int _2298 = _2296 + _1990;
    float _2300 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2302 = -_1076;
    float _2304 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    int _2306 = _2294 & 3;
    float _2308 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2310 = precise::clamp(_2308, 0.0, 1.0);
    bool _2312 = uint(_2298) >= uint(_774);
    float _2314 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    int _2316 = _2276 + _2306;
    float _2318 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2320 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2322 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2280);
    int _2324 = _2316 >> 2;
    float _2326 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2318);
    float _2328 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2320);
    float _2330 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2300);
    int _2332 = _2324 << 4;
    int _2334 = _2332 + 368;
    float _2336 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2286);
    float _2338 = _2322 * _2158;
    float _2340 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2326);
    uint _2342 = uint(int(uint(_2334) >> uint(2)));
    uint _2344 = uint(int(uint(int(_2342)) >> uint(2)));
    int _2346 = int(_2342) & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    int _2350 = int(_2342) + 1;
    uint _2352 = uint(int(uint(_2350) >> uint(2)));
    int _2354 = _2350 & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    float _2358 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2328);
    float _2360 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2330);
    int _2362 = _2276 & 3;
    bool _2364 = _2362 != 0;
    float _2366 = _2310 * _2310;
    float _2368 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2220);
    bool _2370 = uint(_2362) > 1u;
    int _2372 = _2334 + 8;
    uint _2374 = uint(int(uint(_2372) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    float _2390 = _2284 * _2158;
    float _2392 = fma(_2310, -2.0, 3.0);
    int _2394 = _2290 ? 0 : 1;
    float _2396 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2202);
    bool _2398 = _2362 != 3;
    float _2400 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2368);
    int _2402 = ~_2394;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    float _2408 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2336);
    bool _2410 = !_2312;
    int _2412 = _2410 ? 0 : (-1);
    float _2414 = _2314 * _2158;
    bool _2416 = uint(_2362) >= 2u;
    float _2418 = fma(_2358, _2154, _2338);
    int _2420 = _2406;
    if (!_2370)
    {
        int _2422 = ~_2394;
        int _2424 = _2422 + 1;
        _2420 = _2424;
    }
    int _2426 = _2420;
    float _2428 = fma(_2340, _2154, _2390);
    bool _2430 = !_2364;
    int _2432 = _2430 ? 0 : 1;
    float _2434 = _2366 * _2392;
    int _2436 = abs(_2426);
    float _2438 = fma(_2360, _2154, _2414);
    int _2440 = ~_2282;
    int _2442 = _2440 + _2412;
    int _2444 = _2442 + 1;
    float _2446 = fma(_2400, _2162, _2418);
    int _2448 = _2416 ? 0 : 1;
    float _2450 = in.m_77.x;
    bool _2452 = _2362 != 3;
    float _2454 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2456 = abs(_2432);
    int _2458 = _774 * _2444;
    int _2460 = _2458 + _1990;
    float _2462 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2454);
    int _2464 = ~_2448;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    float _2470 = -_1774;
    float _2472 = _2470 + 1.0;
    bool _2474 = !_2452;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2462);
    int _2480 = _2468;
    if (_2398)
    {
        int _2482 = ~_2448;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    float _2488 = fma(_2396, _2162, _2428);
    int _2490 = ~_2436;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    float _2496 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    bool _2498 = !_2048;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = fma(_2408, _2162, _2438);
    int _2504 = abs(_2476);
    int _2506 = _2494 * as_type<int>(_2356);
    int _2508 = abs(_2486);
    float _2510 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2512 = ~_2456;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    out.gl_Position.x = _1752;
    out.gl_Position.y = _1754;
    out.gl_Position.z = _2496;
    out.gl_Position.w = _1698;
    int _2518 = abs(_2500);
    float _2520 = _2510 * _1776;
    int _2522 = _2516 * as_type<int>(_2348);
    int _2524 = _2522 + _2506;
    int _2526 = ~_2508;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    float _2532 = -_2510;
    float _2534 = _2532 + 1.0;
    int _2536 = ~_2504;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    out.m_79.x = _2488;
    out.m_79.y = _2446;
    out.m_79.z = _2502;
    bool _2542 = _1332 <= 8000.0;
    bool _2544 = isnan(_1332);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(8000.0);
    bool _2550 = _2546 || _2548;
    float _2552 = float(_2550);
    int _2554 = _2530 * as_type<int>(_2380);
    int _2556 = _2554 + _2524;
    float _2558 = _2496 + _1698;
    bool _2560 = !_1805;
    int _2562 = _2560 ? _2460 : (-1);
    int _2564 = _2540 * as_type<int>(_2388);
    int _2566 = _2564 + _2556;
    float _2568 = -_2434;
    float _2570 = _2568 + 1.0;
    int _2572 = ~_2518;
    int _2574 = _2572 + 1;
    int _2576 = _2574 + 1;
    float _2578 = _2558 * 0.5;
    float _2580 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2434);
    float _2582 = _1698 * 0.5;
    int _2584 = _2566 * _2576;
    float _2586 = _2552 * _2580;
    float _2588 = fma(_1754, -0.5, _2582);
    int _2590 = _2562 * _2518;
    int _2592 = _2590 + _2584;
    float _2594 = _1752 + _1698;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2598 = _1797 * _2520;
    bool _2600 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2602 = isnan(_1484);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2608 = _2604 || _2606;
    float _2610 = _2594 * 0.5;
    float _2612 = _2472 * _2596;
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = _1787 * _2520;
    float _2618 = fma(_1787, _2598, _1785);
    float _2620 = float(_2592);
    float _2622 = -_2614;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2610;
    out.m_81.y = _2588;
    out.m_81.z = _2578;
    out.m_81.w = _1698;
    float _2626 = fma(_1793, _2616, _1781);
    float _2628 = fma(_1795, _2616, _1783);
    float _2630 = _2624 * _2450;
    float _2632 = _1787 * _2534;
    out.m_83.x = _2620;
    float _2634 = _2616;
    float _2636 = _2534;
    float _2638 = _2598;
    float _2640 = _2520;
    float _2642 = _2620;
    float _2644 = _2630;
    if (!_2608)
    {
        _2634 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2646 = _2634;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2608)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2652 = _2636;
    out.m_85.x = _2626;
    out.m_85.y = _2628;
    out.m_85.z = _2618;
    out.m_85.w = _2632;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2608)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2658 = _2638;
    float _2660 = _2658;
    float _2662 = _2658;
    if (!_2608)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2664 = _2640;
    float _2666 = _2630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2668 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2670 = _2664;
    float _2672 = _2664;
    if (!_2608)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2642;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2608)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2680 = _2644;
    out.m_87.x = _2666;
    bool _2682 = !_2608;
    float _2684 = _2680;
    float _2686 = _2680;
    if (!_2682)
    {
        bool _2688 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2690 = isnan(_1484);
        bool _2692 = _2688 || _2690;
        bool _2694 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2696 = _2692 || _2694;
        if (!_2696)
        {
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2700 = _1484 + _2698;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2704 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2702;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2710 = 1.0 / _2704;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2728 = _2700 * _2710;
            float _2730 = precise::clamp(_2728, 0.0, 1.0);
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2736 = fma(_2730, _2708, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2738 = fma(_2730, _2734, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2740 = fma(_2730, _2714, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2742 = fma(_2730, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2744 = fma(_2730, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2746 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2656 = _2740;
            _2672 = _2744;
            _2650 = _2736;
            _2662 = _2742;
            _2678 = _2738;
            _2686 = _2746;
            _2748 = true;
        }
        else
        {
            bool _2750 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2752 = isnan(_1484);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2758 = _2754 || _2756;
            if (!_2758)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2760 = _2648;
            _2650 = _2760;
            if (!_2758)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2762 = _2654;
            _2656 = _2762;
            if (!_2758)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2764 = _2676;
            _2678 = _2764;
            if (!_2758)
            {
                _2660 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2766 = _2660;
            _2662 = _2766;
            if (!_2758)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2768 = _2670;
            _2672 = _2768;
            if (!_2758)
            {
                _2684 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2770 = _2684;
            bool _2772 = !_2758;
            _2686 = _2770;
            if (!_2772)
            {
                bool _2774 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2776 = isnan(_1484);
                bool _2778 = _2774 || _2776;
                bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2782 = _2778 || _2780;
                if (!_2782)
                {
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2786 = _1484 + _2784;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2788;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2796 = 1.0 / _2790;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2814 = _2786 * _2796;
                    float _2816 = precise::clamp(_2814, 0.0, 1.0);
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2822 = fma(_2816, _2794, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2824 = fma(_2816, _2820, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2826 = fma(_2816, _2800, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2828 = fma(_2816, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2830 = fma(_2816, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2832 = fma(_2816, _2812, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2656 = _2826;
                    _2672 = _2830;
                    _2650 = _2822;
                    _2662 = _2828;
                    _2678 = _2824;
                    _2686 = _2832;
                    _2748 = true;
                }
                else
                {
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2662 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2686 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2748 = false;
    float _2834 = _2656;
    float _2836 = _2672;
    float _2838 = _2650;
    float _2840 = _2662;
    float _2842 = _2678;
    float _2844 = _2686;
    float _2846 = _2668 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2848 = fma(_2446, -0.5, 0.5);
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = -_2834;
    float _2854 = _2852 + _2836;
    float _2856 = -_2838;
    float _2858 = _2856 + _2840;
    out.m_53.x = _2846;
    float _2860 = -_2842;
    float _2862 = _2860 + _2844;
    float _2864 = fma(_2850, _2854, _2834);
    float _2866 = fma(_2850, _2858, _2838);
    bool _2868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2870 = _2864 * 0.586610972881317138671875;
    float _2872 = fma(_2850, _2862, _2842);
    out.m_89.x = 0.0;
    bool _2874 = _1460 > 0.0;
    bool _2876 = isnan(_1460);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan(0.0);
    bool _2882 = _2878 || _2880;
    float _2884 = fma(_2866, 0.298911988735198974609375, _2870);
    float _2886 = fma(_2872, 0.114477999508380889892578125, _2884);
    float _2888 = -_2886;
    float _2890 = _2866 + _2888;
    float _2892 = -_2886;
    float _2894 = _2864 + _2892;
    float _2896 = -_2886;
    float _2898 = _2872 + _2896;
    float _2900 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    float _2902 = fma(_2894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    float _2904 = fma(_2898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    bool _2906 = !_2868;
    if (!_2906)
    {
        float _2908 = -_1394;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2912 = -_1396;
        float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2916 = -_1398;
        float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2920 = _2910 * _2910;
        float _2922 = fma(_2914, _2914, _2920);
        float _2924 = fma(_2918, _2918, _2922);
        float _2926 = sqrt(_2924);
        float _2928 = rsqrt(_2924);
        float _2930 = -_2926;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = _2914 * _2928;
        float _2940 = _2910 * _2928;
        float _2942 = abs(_2936);
        float _2944 = log2(_2942);
        float _2946 = _2918 * _2928;
        float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2950 = _2446 * _2940;
        float _2952 = -_2940;
        float _2954 = -_2948;
        float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
        float _2958 = fma(_2488, _2938, _2950);
        float _2960 = -_2946;
        float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
        float _2964 = fma(_2502, _2946, _2958);
        float _2966 = precise::clamp(_2964, 0.0, 1.0);
        float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2970 = _2962 + _2968;
        float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2976 = precise::clamp(_2974, 0.0, 1.0);
        float _2978 = exp2(_2972);
        float _2980 = _2978 * _2976;
        float _2982 = _2966 * _2980;
        float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2984;
        out.m_89.y = _2986;
        out.m_89.z = _2988;
    }
    out.m_91.x = _2900;
    out.m_91.y = _2902;
    out.m_91.z = _2904;
    if (_2882)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2990;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2748 = false;
    bool _578 = false;
    bool _442 = false;
    bool _322 = false;
    bool _214 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_46.w;
    float _107 = in.m_48.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    float _126 = _116;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _128 = _122;
    if (!_120)
    {
        out.m_53.x = 0.0;
    }
    int _130 = 0;
    if (!_120)
    {
        float _132 = _128 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    int _136 = _134;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3058 = as_type<float>(_134);
        out.gl_Position.z = _3058;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _138 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_107);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_146;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_53.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _136 = as_type<int>(_158);
    }
    int _160 = _136;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3113 = as_type<float>(_160);
        out.gl_Position.z = _3113;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = in.m_55.x;
    float _164 = in.m_55.y;
    float _166 = in.m_55.z;
    float _168 = 1.0 / _148;
    bool _170 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _172 = _116 * _168;
    float _174 = _164 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _176 = _164 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _178 = _164 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _180 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[4].x, _174);
    float _182 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[5].x, _176);
    float _184 = fma(_162, (*spvDescriptorSet0.vp_c10)._m0[6].x, _178);
    float _186 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[4].z, _180);
    float _188 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[5].z, _182);
    float _190 = fma(_166, (*spvDescriptorSet0.vp_c10)._m0[6].z, _184);
    bool _192 = !_170;
    float _194 = _172;
    float _212;
    if (!_192)
    {
        float _196 = in.m_57.x;
        float _198 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _200 = _196 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _202 = fma(_200, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _204 = _202 * _198;
        float _206 = floor(_204);
        float _208 = -_206;
        float _210 = _204 + _208;
        _212 = _210;
        _214 = true;
    }
    else
    {
        _212 = _172;
    }
    _214 = false;
    float _216 = _212;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = _216 + _218;
    bool _222 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _224 = isnan(_216);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    bool _238 = _216 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_216);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_232;
    float _252 = _250 + 1.0;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _254;
    float _258 = 1.0 / _236;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = _248 * _252;
    float _264 = -_248;
    float _266 = _264 + 1.0;
    float _268 = _220 * _258;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    float _274 = fma(_256, _268, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    float _280 = fma(_272, _268, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _282 = fma(_278, _268, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = _274 * _262;
    float _286 = _282 * _262;
    float _288 = _280 * _262;
    float _290 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_266, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_232, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    bool _302 = !_260;
    float _320;
    if (!_302)
    {
        float _304 = in.m_57.x;
        float _306 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _308 = _304 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _310 = fma(_308, (*spvDescriptorSet0.vp_c9)._m0[11].x, _116);
        float _312 = _310 * _306;
        float _314 = floor(_312);
        float _316 = -_314;
        float _318 = _312 + _316;
        _320 = _318;
        _322 = true;
    }
    else
    {
        _320 = _172;
    }
    _322 = false;
    float _324 = _320;
    float _326 = in.m_59.x;
    float _328 = in.m_59.y;
    float _330 = in.m_59.z;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _334 = _324 + _332;
    bool _336 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _338 = isnan(_324);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    bool _348 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _350;
    float _354 = -_346;
    float _356 = _354 + 1.0;
    float _358 = 1.0 / _352;
    float _360 = _300 * _330;
    float _362 = _298 * _328;
    float _364 = _334 * _358;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _366;
    bool _370 = _324 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _372 = isnan(_324);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _382;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _388 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _386;
    float _390 = fma(_368, _364, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _392 = _380 * _356;
    float _394 = fma(_384, _364, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _396 = fma(_388, _364, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _398 = -_380;
    float _400 = _398 + 1.0;
    float _402 = _390 * _392;
    float _404 = _394 * _392;
    float _406 = _396 * _392;
    float _408 = _296 * _326;
    float _410 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].x, _402);
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].y, _404);
    float _414 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[107].z, _406);
    float _416 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].x, _410);
    float _418 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].y, _412);
    float _420 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[108].z, _414);
    bool _422 = !_348;
    float _440;
    if (!_422)
    {
        float _424 = in.m_57.x;
        float _426 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _428 = _424 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _430 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _432 = _430 * _426;
        float _434 = floor(_432);
        float _436 = -_434;
        float _438 = _432 + _436;
        _440 = _438;
        _442 = true;
    }
    else
    {
        _440 = _172;
    }
    _442 = false;
    float _444 = _440;
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _444 + _446;
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _454 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _456 = isnan(_444);
    bool _458 = _454 || _456;
    bool _460 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _462 = _458 || _460;
    float _464 = float(_462);
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _470 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _472 = isnan(_444);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _482;
    bool _486 = _444 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _488 = isnan(_444);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = 1.0 / _452;
    float _500 = -_464;
    float _502 = _500 + 1.0;
    bool _504 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _506 = _480 * _502;
    float _508 = -_480;
    float _510 = _508 + 1.0;
    float _512 = 1.0 / _468;
    float _514 = _484 * _498;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _520 = fma(_514, _448, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _522 = _518 * _512;
    float _524 = _520 * _506;
    float _526 = -_496;
    float _528 = _526 + 1.0;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _444 + _530;
    float _534 = _416 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _536 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[115].x, _524);
    float _538 = _464 * _528;
    float _540 = fma(_522, _532, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _542 = _420 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _544 = _534 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _546 = fma(_540, _538, _536);
    float _548 = _418 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _550 = _542 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _552 = fma(_496, (*spvDescriptorSet0.vp_c9)._m0[117].x, _546);
    float _554 = _548 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _556 = _552 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_61.x = _544;
    out.m_61.y = _554;
    out.m_61.z = _550;
    out.m_61.w = _556;
    bool _558 = !_504;
    float _576;
    if (!_558)
    {
        float _560 = in.m_57.x;
        float _562 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _564 = _560 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _566 = fma(_564, (*spvDescriptorSet0.vp_c9)._m0[11].z, _116);
        float _568 = _566 * _562;
        float _570 = floor(_568);
        float _572 = -_570;
        float _574 = _568 + _572;
        _576 = _574;
        _578 = true;
    }
    else
    {
        _576 = _172;
    }
    _578 = false;
    float _580 = _576;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _584 = _580 + _582;
    bool _586 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _588 = isnan(_580);
    bool _590 = _586 || _588;
    bool _592 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _594 = _590 || _592;
    float _596 = float(_594);
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _598;
    bool _602 = _580 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _604 = isnan(_580);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = -_596;
    float _616 = _614 + 1.0;
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _618;
    float _622 = 1.0 / _600;
    bool _624 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _626 = _612 * _616;
    float _628 = -_612;
    float _630 = _628 + 1.0;
    float _632 = _584 * _622;
    float _634 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _636 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _634;
    float _638 = fma(_620, _632, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _640;
    float _644 = fma(_636, _632, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _646 = _638 * _626;
    float _648 = fma(_642, _632, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _650 = _644 * _626;
    float _652 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].x, _646);
    float _654 = _648 * _626;
    float _656 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].x, _652);
    float _658 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].y, _654);
    float _660 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[123].z, _650);
    float _662 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].y, _658);
    float _664 = fma(_596, (*spvDescriptorSet0.vp_c9)._m0[124].z, _660);
    bool _666 = !_624;
    if (!_666)
    {
        float _668 = in.m_57.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _194 = _682;
    }
    float _684 = _194;
    float _686 = in.m_57.z;
    float _688 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _690 = log2(_688);
    float _692 = in.m_57.x;
    float _694 = in.m_57.y;
    float _696 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _698 = int(_696);
    float _700 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _704 = _690 * _116;
    float _706 = exp2(_704);
    float _708 = _686 * 2.0;
    float _710 = _692 * 2.0;
    float _712 = _694 * 2.0;
    float _714 = _692 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _716 = floor(_708);
    float _718 = _694 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _720 = -_700;
    float _722 = fma(_714, 2.0, _720);
    float _724 = _694 + _692;
    float _726 = fma(_718, -2.0, _702);
    float _728 = -_116;
    float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[76].x, _722);
    float _732 = floor(_710);
    float _734 = -_706;
    float _736 = _734 + 1.0;
    float _738 = _724 + (-1.0);
    float _740 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _742 = floor(_712);
    bool _744 = _716 >= 0.0;
    bool _746 = isnan(_716);
    bool _748 = _744 || _746;
    bool _750 = isnan(0.0);
    bool _752 = _748 || _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _756 = 1.0 + _754;
    int _758 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _760 = _758 != 0;
    int _762 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _764 = _762 != 0;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _768 = _766 != 0;
    int _770 = _752 ? 0 : 1;
    float _772 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _774 = int(_772);
    bool _776 = _732 > 0.0;
    bool _778 = !_764;
    int _780 = _778 ? 0 : 1;
    bool _782 = _716 > 0.0;
    bool _784 = !_760;
    int _786 = _784 ? 0 : 1;
    float _788 = 1.0 / _756;
    bool _790 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _792 = isnan(0.0);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _798 = _794 || _796;
    bool _800 = _732 >= 0.0;
    bool _802 = isnan(_732);
    bool _804 = _800 || _802;
    bool _806 = isnan(0.0);
    bool _808 = _804 || _806;
    bool _810 = _742 > 0.0;
    bool _812 = _742 >= 0.0;
    bool _814 = isnan(_742);
    bool _816 = _812 || _814;
    bool _818 = isnan(0.0);
    bool _820 = _816 || _818;
    int _822 = ~_770;
    int _824 = _822 + 1;
    int _826 = _824 + 1;
    int _828 = _826;
    if (!_782)
    {
        int _830 = ~_770;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    bool _836 = !_768;
    int _838 = _836 ? 0 : 1;
    float _840 = _798 ? _736 : 0.0;
    float _842 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _844 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _846 = _844 != 0;
    int _848 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _850 = _848 != 0;
    int _852 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _854 = _852 != 0;
    float _856 = float(_698);
    float _858 = fma(_694, (*spvDescriptorSet0.vp_c9)._m0[78].w, _842);
    float _860 = in.m_63.x;
    float _862 = in.m_63.y;
    float _864 = in.m_63.z;
    bool _866 = !_846;
    int _868 = _866 ? 0 : 1;
    float _870 = 1.0 / _856;
    float _872 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _858);
    int _874 = _808 ? 0 : 1;
    bool _876 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _878 = isnan(1.0);
    bool _880 = _876 || _878;
    bool _882 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _884 = _880 || _882;
    float _886 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _888 = float(_834);
    int _890 = abs(_868);
    float _892 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[78].z, _886);
    bool _894 = !_850;
    int _896 = _894 ? 0 : 1;
    float _898 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _726);
    float _900 = float(_890);
    float _902 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _892);
    int _904 = abs(_896);
    float _906 = _870 * _116;
    float _908 = float(_774);
    float _910 = _900 * _888;
    int _912 = ~_874;
    int _914 = _912 + 1;
    int _916 = _914 + 1;
    float _918 = _692 + (-0.5);
    int _920 = _916;
    if (!_776)
    {
        int _922 = ~_874;
        int _924 = _922 + 1;
        _920 = _924;
    }
    int _926 = _920;
    float _928 = _910 * (-2.0);
    float _930 = _908 * _116;
    if (_884)
    {
        float _932 = _840 * _788;
        _126 = _932;
    }
    float _934 = _126;
    int _936 = _820 ? 0 : 1;
    float _938 = fma(_928, _860, _860);
    bool _940 = !_854;
    int _942 = _940 ? 0 : 1;
    float _944 = float(_926);
    float _946 = fma(_740, _928, _740);
    float _948 = float(_904);
    float _950 = fma(_918, (*spvDescriptorSet0.vp_c9)._m0[196].x, _938);
    int _952 = ~_936;
    int _954 = _952 + 1;
    int _956 = _954 + 1;
    int _958 = _956;
    if (!_810)
    {
        int _960 = ~_936;
        int _962 = _960 + 1;
        _958 = _962;
    }
    int _964 = _958;
    float _966 = _948 * _944;
    int _968 = abs(_942);
    float _970 = _694 + _686;
    float _972 = float(_964);
    float _974 = fma(_946, _934, _950);
    float _976 = float(_968);
    float _978 = _970 + (-1.0);
    float _980 = _966 * (-2.0);
    float _982 = _974 * 0.15915493667125701904296875;
    float _984 = _976 * _972;
    float _986 = _694 + (-0.5);
    float _988 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _990 = fma(_980, _862, _862);
    float _992 = _686 + _692;
    float _994 = fma(_988, _980, _988);
    float _996 = fma(_986, (*spvDescriptorSet0.vp_c9)._m0[196].y, _990);
    float _998 = _992 + (-1.0);
    float _1000 = _984 * (-2.0);
    float _1002 = _686 + (-0.5);
    float _1004 = fma(_994, _934, _996);
    float _1006 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1008 = fma(_1000, _864, _864);
    float _1010 = in.m_65.x;
    float _1012 = in.m_65.y;
    float _1014 = in.m_65.z;
    float _1016 = _982 * 6.283185482025146484375;
    float _1018 = sin(_1016);
    float _1020 = fma(_1006, _1000, _1006);
    float _1022 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1008);
    float _1024 = _1004 * 0.15915493667125701904296875;
    float _1026 = _362 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1028 = fma(_1020, _934, _1022);
    float _1030 = _360 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1032 = _982 * 6.283185482025146484375;
    float _1034 = cos(_1032);
    float _1036 = _1024 * 6.283185482025146484375;
    float _1038 = sin(_1036);
    float _1040 = _1028 * 0.15915493667125701904296875;
    float _1042 = _408 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1044 = in.m_46.x;
    float _1046 = in.m_46.y;
    float _1048 = in.m_46.z;
    float _1050 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1010);
    float _1052 = _1024 * 6.283185482025146484375;
    float _1054 = cos(_1052);
    float _1056 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1012);
    float _1058 = _1042 * _1050;
    float _1060 = _1026 * _1056;
    float _1062 = _1040 * 6.283185482025146484375;
    float _1064 = cos(_1062);
    float _1066 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1014);
    float _1068 = _1018 * _1038;
    float _1070 = _1030 * _1066;
    float _1072 = _1034 * _1038;
    float _1074 = _1040 * 6.283185482025146484375;
    float _1076 = sin(_1074);
    float _1078 = _1034 * _1054;
    float _1080 = _1018 * _1054;
    float _1082 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1084 = _1034 * _1064;
    float _1086 = _1018 * _1064;
    float _1088 = _1054 * _1064;
    float _1090 = _1038 * _1064;
    float _1092 = _1084 * _1060;
    float _1094 = _1086 * _1060;
    float _1096 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1082);
    float _1098 = fma(_1076, _1078, _1068);
    float _1100 = -_1072;
    float _1102 = fma(_1076, _1080, _1100);
    float _1104 = -_1080;
    float _1106 = fma(_1076, _1072, _1104);
    float _1108 = -_1060;
    float _1110 = _1076 * _1108;
    float _1112 = fma(_1098, _1058, _1092);
    float _1114 = fma(_1102, _1058, _1094);
    float _1116 = fma(_1076, _1068, _1078);
    float _1118 = fma(_1088, _1058, _1110);
    float _1120 = fma(_1106, _1070, _1112);
    float _1122 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1124 = fma(_1116, _1070, _1114);
    float _1126 = fma(_1090, _1070, _1118);
    float _1128 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1130 = _1046 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1132 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1122);
    float _1134 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1136 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1128);
    float _1138 = fma(_1044, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1140 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1132);
    float _1142 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1134);
    float _1144 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1136);
    float _1146 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1148 = _1140 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1150 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1142);
    float _1152 = _1144 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1154 = _1146 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1156 = fma(_1048, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1096);
    float _1158 = _1150 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1160 = _1148 + _1152;
    float _1162 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1164 = _1156 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1166 = _1154 + _1158;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1170 = _1160 + _1168;
    float _1172 = fma(_1126, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1162);
    float _1174 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1176 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1178 = _1166 + _1176;
    float _1180 = _1170 * _1170;
    float _1182 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1172);
    float _1184 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1174);
    float _1186 = _1164 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1188 = fma(_1178, _1178, _1180);
    float _1190 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1192 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1184);
    float _1194 = sqrt(_1188);
    float _1196 = _1164 + _1190;
    float _1198 = _1192 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    bool _1200 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1202 = _1048;
    float _1204 = _1184;
    float _1206 = _1196;
    float _1208 = _1198;
    float _1210 = _1186;
    float _1212 = _1154;
    if (!_1200)
    {
        _1202 = _1166;
    }
    float _1214 = _1202;
    float _1216 = _1214;
    if (!_1200)
    {
        _1204 = _1160;
    }
    float _1218 = _1204;
    bool _1220 = !_1200;
    float _1222 = _1218;
    if (!_1220)
    {
        float _1224 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1226 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1228 = _1194 + _1226;
        float _1230 = _1196 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1232 = rsqrt(_1188);
        float _1234 = _1228 * _1224;
        float _1236 = _1234 * 0.15915493667125701904296875;
        float _1238 = _1236 * 6.283185482025146484375;
        float _1240 = cos(_1238);
        float _1242 = _1236 * 6.283185482025146484375;
        float _1244 = sin(_1242);
        float _1246 = _1240 + (-1.0);
        float _1248 = _1246 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1250 = fma(_1244, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1252 = fma(_1196, _1240, _1248);
        float _1254 = _1232 * _1250;
        float _1256 = fma(_1178, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1258 = fma(_1170, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1206 = _1252;
        _1216 = _1256;
        _1222 = _1258;
    }
    float _1260 = _1206;
    float _1262 = _1216;
    float _1264 = _1222;
    float _1266 = -_1164;
    float _1268 = _1266 + _1260;
    float _1270 = fma(_1154, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1186);
    float _1272 = -_1154;
    float _1274 = _1272 + _1262;
    float _1276 = 1.0 / _1198;
    float _1278 = _1268 * _1268;
    float _1280 = fma(_1148, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1270);
    float _1282 = -_1148;
    float _1284 = _1282 + _1264;
    float _1286 = fma(_1274, _1274, _1278);
    float _1288 = _1280 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1290 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1292 = isnan(0.5);
    bool _1294 = _1290 || _1292;
    bool _1296 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1298 = _1294 || _1296;
    float _1300 = fma(_1284, _1284, _1286);
    float _1302 = _1288 + _1198;
    float _1304 = sqrt(_1300);
    float _1306 = _1302 * _1276;
    float _1308 = _1306 * 0.5;
    float _1310 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1312 = fma(_1308, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1310);
    float _1314 = _1260;
    float _1316 = _1264;
    float _1318 = _1312;
    float _1320 = _1300;
    float _1322 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1298)
    {
        _1208 = 1.0;
    }
    float _1324 = _1208;
    float _1326 = 1.0 / _1312;
    bool _1328 = _1304 > 0.0;
    float _1330 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1332 = _1326 * _1330;
    float _1334 = _1304;
    float _1336 = _1324;
    if (!_1328)
    {
        _1334 = _1262;
    }
    float _1338 = _1334;
    bool _1340 = !_1328;
    float _1342 = _1338;
    if (!_1340)
    {
        float _1344 = _188 * _188;
        float _1346 = rsqrt(_1300);
        float _1348 = fma(_186, _186, _1344);
        float _1350 = fma(_190, _190, _1348);
        float _1352 = sqrt(_1350);
        float _1354 = _1274 * _1346;
        float _1356 = _1268 * _1346;
        float _1358 = _1284 * _1346;
        bool _1360 = _1352 > 0.0;
        float _1362 = _1352;
        _1318 = _1350;
        _1320 = _1346;
        _1322 = _1356;
        _1210 = _1358;
        if (!_1360)
        {
            _1362 = _1262;
        }
        float _1364 = _1362;
        bool _1366 = !_1360;
        _1342 = _1364;
        if (!_1366)
        {
            float _1368 = rsqrt(_1350);
            float _1370 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1372 = _188 * _1368;
            float _1374 = _186 * _1368;
            float _1376 = _1356 * _1372;
            float _1378 = _190 * _1368;
            float _1380 = fma(_1354, _1374, _1376);
            float _1382 = _1370 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1384 = fma(_1358, _1378, _1380);
            float _1386 = _1384 * _1382;
            float _1388 = fma(_186, _1386, _1262);
            float _1390 = fma(_188, _1386, _1260);
            float _1392 = fma(_190, _1386, _1264);
            _1314 = _1390;
            _1342 = _1388;
            _1316 = _1392;
            _1318 = _1368;
        }
    }
    float _1394 = _1314;
    float _1396 = _1342;
    float _1398 = _1316;
    float _1400 = _1318;
    float _1402 = _1320;
    float _1404 = _1322;
    float _1406 = _1210;
    float _1408 = _1404;
    float _1410 = _1406;
    if (!_1298)
    {
        float _1412 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1414 = _1412 * 0.15915493667125701904296875;
        float _1416 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1418 = _1414 * 6.283185482025146484375;
        float _1420 = cos(_1418);
        float _1422 = _1416 * 0.15915493667125701904296875;
        float _1424 = _1414 * 6.283185482025146484375;
        float _1426 = sin(_1424);
        float _1428 = 1.0 / _1420;
        float _1430 = _1422 * 6.283185482025146484375;
        float _1432 = cos(_1430);
        float _1434 = _1426 * _1428;
        float _1436 = _1422 * 6.283185482025146484375;
        float _1438 = sin(_1436);
        float _1440 = _1432 * _1434;
        float _1442 = 1.0 / _1440;
        float _1444 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1446 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1444;
        float _1448 = 1.0 / _1446;
        float _1450 = _1438 * _1442;
        float _1452 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1454 = fma(_1332, _1450, _1452);
        float _1456 = _1454 * _1448;
        float _1458 = precise::clamp(_1456, 0.0, 1.0);
        _1336 = _1458;
    }
    float _1460 = _1336;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1464 = _1394 + _1462;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1468 = _1396 + _1466;
    float _1470 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1472 = _1398 + _1470;
    float _1474 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1476 = _1464 * _1464;
    float _1478 = fma(_1468, _1468, _1476);
    float _1480 = fma(_1472, _1472, _1478);
    float _1482 = rsqrt(_1480);
    float _1484 = sqrt(_1480);
    float _1486 = _1482 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1488 = _1468 * _1486;
    float _1490 = _1472 * _1486;
    float _1492 = _1488 * _1488;
    float _1494 = _1490 * _1490;
    float _1496 = _1492 + _1494;
    float _1498 = sqrt(_1496);
    bool _1500 = _1498 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1502 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1504 = _1498 + _1502;
    float _1506 = _1400;
    float _1508 = _1496;
    float _1510 = _1504;
    float _1512 = _1488;
    float _1514 = _1490;
    float _1516 = _1492;
    float _1518 = _1494;
    if (_1500)
    {
        float _1520 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1506 = _1520;
    }
    float _1522 = _1506;
    if (_1500)
    {
        float _1524 = rsqrt(_1496);
        _1508 = _1524;
    }
    float _1526 = _1508;
    if (_1500)
    {
        float _1528 = _1504 * _1522;
        _1510 = _1528;
    }
    float _1530 = _1510;
    if (_1500)
    {
        float _1532 = _1530 * 0.15915493667125701904296875;
        _1408 = _1532;
    }
    float _1534 = _1408;
    float _1536 = _1402;
    if (_1500)
    {
        float _1538 = _1534 * 6.283185482025146484375;
        float _1540 = sin(_1538);
        _1536 = _1540;
    }
    float _1542 = _1536;
    float _1544 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1546 = precise::max(0.0, _1544);
    float _1548 = _1522;
    if (_1500)
    {
        float _1550 = _1534 * 6.283185482025146484375;
        float _1552 = cos(_1550);
        _1548 = _1552;
    }
    float _1554 = _1548;
    float _1556 = -_1486;
    float _1558 = -_1546;
    float _1560 = fma(_1464, _1556, _1558);
    if (_1500)
    {
        float _1562 = _1560 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1410 = _1562;
    }
    float _1564 = _1410;
    float _1566 = fma(_1154, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1568 = _1564;
    float _1570 = _1542;
    if (_1500)
    {
        float _1572 = fma(_1542, _1564, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1568 = _1572;
    }
    float _1574 = _1568;
    float _1576 = _1574;
    if (!_1500)
    {
        _1570 = _1560;
    }
    float _1578 = _1570;
    float _1580 = floor(_1566);
    float _1582 = _1578;
    if (_1500)
    {
        float _1584 = _1554 + (-1.0);
        _1212 = _1584;
    }
    float _1586 = _1212;
    float _1588 = _1586;
    if (_1500)
    {
        float _1590 = _1526 * _1574;
        _1576 = _1590;
    }
    float _1592 = _1576;
    if (_1500)
    {
        float _1594 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1588 = _1594;
    }
    float _1596 = _1588;
    if (_1500)
    {
        float _1598 = _1488 * _1592;
        _1512 = _1598;
    }
    float _1600 = _1512;
    if (_1500)
    {
        float _1602 = _1490 * _1592;
        _1514 = _1602;
    }
    float _1604 = _1514;
    float _1606 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1500)
    {
        float _1608 = fma(_1560, _1554, _1596);
        _1582 = _1608;
    }
    float _1610 = _1582;
    if (_1500)
    {
        float _1612 = _1600 * _1600;
        _1516 = _1612;
    }
    float _1614 = _1516;
    if (_1500)
    {
        float _1616 = _1604 * _1604;
        _1518 = _1616;
    }
    float _1618 = _1518;
    float _1620 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1606);
    float _1622 = fma(_1610, _1610, _1614);
    float _1624 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1474);
    float _1626 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1620);
    float _1628 = _1622 + _1618;
    float _1630 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1632 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1634 = _1394 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1636 = fma(_1148, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1638 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1632);
    float _1640 = fma(_1396, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1634);
    float _1642 = _1626 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1644 = floor(_1636);
    float _1646 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1638);
    float _1648 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1640);
    float _1650 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1652 = fma(_1484, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1650);
    float _1654 = precise::clamp(_1652, 0.0, 1.0);
    float _1656 = _1642 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1658 = _1646 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1660 = _1648 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1662 = -_1654;
    float _1664 = _1662 + 1.0;
    float _1666 = rsqrt(_1628);
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1670 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1624);
    float _1672 = -_1580;
    float _1674 = _1566 + _1672;
    float _1676 = -_1656;
    float _1678 = fma(_1676, _1630, 1.0);
    float _1680 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1668);
    float _1682 = _1670 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1684 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1686 = abs(_1664);
    float _1688 = log2(_1686);
    float _1690 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1680);
    float _1692 = -_1644;
    float _1694 = _1636 + _1692;
    float _1696 = _1666 * _1600;
    float _1698 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1690);
    float _1700 = _1666 * _1610;
    float _1702 = _1666 * _1604;
    float _1704 = _1696 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1706 = log2(_1678);
    float _1708 = -_1704;
    float _1710 = fma(_1700, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1708);
    float _1712 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1714 = -_1702;
    float _1716 = fma(_1714, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1710);
    float _1718 = 1.0 / _1698;
    float _1720 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1722 = fma(_1716, -0.5, 0.5);
    float _1724 = fma(_1716, 0.5, 0.5);
    float _1726 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1720);
    float _1728 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1684);
    float _1730 = _1700 + 1.0;
    float _1732 = exp2(_1712);
    float _1734 = fma(_1724, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1736 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1726);
    float _1738 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1728);
    float _1740 = _1706 * 0.693147182464599609375;
    float _1742 = fma(_1724, _1734, -0.212114393711090087890625);
    float _1744 = sqrt(_1722);
    float _1746 = fma(_1724, _1742, 1.570728778839111328125);
    float _1748 = -_1700;
    float _1750 = fma(_1732, _1730, _1748);
    float _1752 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1736);
    float _1754 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1738);
    float _1756 = _1740 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1758 = _1752 * _1718;
    float _1760 = _1754 * _1718;
    float _1762 = _1744 * 0.636619746685028076171875;
    float _1764 = fma(_1758, 0.5, 0.5);
    float _1766 = fma(_1760, -0.5, 0.5);
    float _1768 = -_1746;
    float _1770 = fma(_1762, _1768, 1.0);
    float _1772 = fma(_1750, 0.5, 0.5);
    float2 _5669 = float2(_1674, _1694);
    float _1774 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5669, float2(0.0), isnan(_5669)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5669, float2(0.0), isnan(_5669)), level(0.0)).x;
    float3 _5680 = float3(_1764, _1766, _1756);
    float _1776 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5680, float3(0.0), isnan(_5680)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5680, float3(0.0), isnan(_5680)), level(0.0)).x;
    float3 _5691 = float3(_1764, _1766, _1756);
    float4 _1779 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5691, float3(0.0), isnan(_5691)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5691, float3(0.0), isnan(_5691)), level(0.0)).xyzw;
    float _1781 = _1779.x;
    float _1783 = _1779.y;
    float _1785 = _1779.z;
    float _1787 = _1779.w;
    float2 _5707 = float2(_1770, _1772);
    float3 _1791 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5707, float2(0.0), isnan(_5707)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5707, float2(0.0), isnan(_5707)), level(0.0)).xyz;
    float _1793 = _1791.x;
    float _1795 = _1791.y;
    float _1797 = _1791.z;
    float _1799 = float(uint(_774));
    float _1801 = trunc(_906);
    int _1803 = int(_1801);
    bool _1805 = _774 == 0;
    float _1807 = _930 * _168;
    int _1809 = _774 + (-1);
    float _1811 = _1688 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1813 = ~_774;
    int _1815 = _1813 + 1;
    int _1817 = abs(_780);
    float _1819 = 1.0 / _1799;
    int _1821 = abs(_786);
    bool _1823 = _694 > 0.5;
    bool _1825 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1827 = isnan(_684);
    bool _1829 = _1825 || _1827;
    bool _1831 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1833 = _1829 || _1831;
    float _1835 = float(_1833);
    float _1837 = float(uint(_1803));
    float _1839 = trunc(_1807);
    int _1841 = int(_1839);
    int _1843 = as_type<int>(_1819) + (-2);
    float _1845 = exp2(_1811);
    float _1847 = as_type<float>(_1843) * _1837;
    float _1849 = trunc(_1847);
    float _1851 = precise::max(_1849, 0.0);
    uint _1854 = uint(_1851);
    float _1856 = -_1845;
    float _1858 = _1856 + 1.0;
    int _1860 = _1815 * int(_1854);
    int _1862 = _1860 + _1803;
    float _1864 = float(uint(_1862));
    float _1866 = as_type<float>(_1843) * _1864;
    int _1868 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1870 = _1868 != 0;
    int _1872 = ~_774;
    int _1874 = _1872 + 1;
    bool _1876 = !_1870;
    float _1878 = _1876 ? 7.345489978790283203125 : 1.0;
    float _1880 = trunc(_1866);
    float _1882 = precise::max(_1880, 0.0);
    uint _1884 = uint(_1882);
    float _1886 = _1878 * _692;
    float _1888 = float(_1803);
    bool _1890 = _1888 >= _908;
    bool _1892 = isnan(_1888);
    bool _1894 = _1890 || _1892;
    bool _1896 = isnan(_908);
    bool _1898 = _1894 || _1896;
    float _1900 = float(_1898);
    float _1902 = trunc(_1900);
    int _1904 = int(_1902);
    int _1906 = int(_1854) + int(_1884);
    float _1908 = floor(_1886);
    int _1910 = _1874 * _1906;
    int _1912 = _1910 + _1803;
    bool _1914 = uint(_1912) >= uint(_774);
    bool _1916 = !_1914;
    int _1918 = _1916 ? 0 : (-1);
    int _1920 = ~_1906;
    int _1922 = _1920 + _1918;
    int _1924 = _1922 + 1;
    float _1926 = -_1908;
    float _1928 = _1886 + _1926;
    int _1930 = ~_1904;
    int _1932 = _1930 + 1;
    int _1934 = _1932 + 1;
    float _1936 = _1928 * _908;
    int _1938 = _774 * _1924;
    int _1940 = _1938 + _1803;
    float _1942 = -_1835;
    float _1944 = _1942 + 1.0;
    bool _1946 = !_1805;
    int _1948 = _1946 ? _1940 : (-1);
    float _1950 = trunc(_1936);
    int _1952 = int(_1950);
    int _1954 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1956 = _1954 != 0;
    int _1958 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1960 = _1958 != 0;
    int _1962 = _1948 * _1934;
    bool _1964 = !_1956;
    int _1966 = _1964 ? 0 : 1;
    int _1968 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1970 = _1968 != 0;
    int _1972 = _1904 * _1809;
    int _1974 = _1972 + _1962;
    bool _1976 = !_1970;
    int _1978 = _1976 ? 0 : 1;
    int _1980 = abs(_838);
    int _1982 = _1974 * _1817;
    int _1984 = abs(_1966);
    int _1986 = abs(_1978);
    int _1988 = _1952 * _1984;
    int _1990 = _1988 + _1803;
    int _1992 = _1841 * _1821;
    int _1994 = _1992 + _1982;
    float _1996 = as_type<float>(_1980);
    if (_1960)
    {
        float _1998 = in.m_57.x;
        _1996 = _1998;
    }
    float _2000 = _1996;
    int _2002 = ~_774;
    int _2004 = _2002 + 1;
    int _2006 = _1990 * _1980;
    int _2008 = _2006 + _1994;
    float _2010 = in.m_67.y;
    int _2012 = _1952 * _1986;
    int _2014 = _2012 + _2008;
    float _2016 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2018 = _2016 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2020 = in.m_67.x;
    int _2022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2024 = _2022 != 0;
    float _2026 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2028 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2026;
    float _2030 = float(uint(_2014));
    float _2032 = 1.0 / _2018;
    bool _2034 = _1012 != 0.0;
    bool _2036 = isnan(_1012);
    bool _2038 = _2034 || _2036;
    bool _2040 = isnan(0.0);
    bool _2042 = _2038 || _2040;
    float _2044 = as_type<float>(_1843) * _2030;
    int _2046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2048 = _2046 != 0;
    bool _2050 = _1010 == 0.0;
    bool _2052 = !_2042;
    bool _2054 = _2050 && _2052;
    float _2056 = trunc(_2044);
    float _2058 = precise::max(_2056, 0.0);
    uint _2060 = uint(_2058);
    out.m_69.x = 1.0;
    out.m_69.y = 1.0;
    out.m_69.z = 1.0;
    bool _2062 = _2000 > 0.5;
    bool _2064 = _2062 && _1960;
    bool _2066 = _684 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2068 = isnan(_684);
    bool _2070 = _2066 || _2068;
    bool _2072 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2074 = _2070 || _2072;
    float _2076 = float(_2074);
    float _2078 = in.m_71.x;
    float _2080 = in.m_71.y;
    float _2082 = in.m_71.z;
    bool _2084 = _1014 == 0.0;
    bool _2086 = _2084 && _2054;
    float _2088 = _2028 * _2032;
    float _2090 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2092 = _684 + _2090;
    float _2094 = float(uint(_1990));
    float _2096 = fma(_2088, _2092, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2098 = _2088;
    float _2100 = _2020;
    float _2102 = _2010;
    if (_1960)
    {
        _2098 = _2020;
    }
    float _2104 = _2098;
    float _2106 = as_type<float>(_1843) * _2094;
    float _2108 = _2076 * _1944;
    int _2110 = _2004 * int(_2060);
    int _2112 = _2110 + _2014;
    float _2114 = _2104;
    if (_2064)
    {
        float _2116 = -_2104;
        float _2118 = _2116 + 1.0;
        _2114 = _2118;
    }
    float _2120 = _2114;
    float _2122 = _2096 * _2108;
    float _2124 = trunc(_2106);
    float _2126 = precise::max(_2124, 0.0);
    uint _2128 = uint(_2126);
    float _2130 = float(uint(_2112));
    float _2132 = -_2076;
    float _2134 = _2132 + 1.0;
    if (_1960)
    {
        _2100 = _2120;
    }
    float _2136 = _2100;
    float _2138 = as_type<float>(_1843) * _2130;
    float _2140 = -_2010;
    float _2142 = _2140 + 1.0;
    float _2144 = fma(_2136, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2146 = _2078;
    float _2148 = _2080;
    float _2150 = _2082;
    if (!_2086)
    {
        float _2152 = fma(_1010, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2078);
        _2146 = _2152;
    }
    float _2154 = _2146;
    if (!_2086)
    {
        float _2156 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2080);
        _2148 = _2156;
    }
    float _2158 = _2148;
    if (!_2086)
    {
        float _2160 = fma(_1014, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2082);
        _2150 = _2160;
    }
    float _2162 = _2150;
    float _2164 = trunc(_2138);
    float _2166 = precise::max(_2164, 0.0);
    uint _2168 = uint(_2166);
    if (_2024)
    {
        float _2170 = _1823 ? _2142 : _2010;
        _2102 = _2170;
    }
    float _2172 = _2102;
    float _2174 = fma(_902, _2144, _730);
    int _2176 = ~_774;
    int _2178 = _2176 + 1;
    float _2180 = fma(_2134, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2122);
    float _2182 = _664 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2184 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2186 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2188 = _2182 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2190 = -_898;
    float _2192 = fma(_872, _2184, _2190);
    int _2194 = ~_774;
    int _2196 = _2194 + 1;
    int _2198 = _2178 * int(_2128);
    int _2200 = _2198 + _1990;
    float _2202 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2186);
    int _2204 = int(_2060) + int(_2168);
    float _2206 = abs(_1332);
    float _2208 = log2(_2206);
    float _2210 = float(uint(_2200));
    float _2212 = fma(_1835, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2180);
    float _2214 = _2192 + 0.5;
    int _2216 = _2196 * _2204;
    int _2218 = _2216 + _2014;
    float _2220 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2222 = as_type<float>(_1843) * _2210;
    float _2224 = _662 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2226 = _2212 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2228 = uint(_2218) >= uint(_774);
    float _2230 = _656 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2234 = trunc(_2222);
    float _2236 = precise::max(_2234, 0.0);
    uint _2238 = uint(_2236);
    bool _2240 = !_2228;
    int _2242 = _2240 ? 0 : (-1);
    float _2244 = _2230 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2246 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2248 = _2208 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2250 = ~_2204;
    int _2252 = _2250 + _2242;
    int _2254 = _2252 + 1;
    float _2256 = _2174 + 0.5;
    out.m_73.x = _2244;
    out.m_73.y = _2232;
    out.m_73.z = _2188;
    out.m_73.w = _2226;
    float _2258 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2260 = _774 * _2254;
    int _2262 = _2260 + _2014;
    float _2264 = exp2(_2248);
    int _2266 = ~_774;
    int _2268 = _2266 + 1;
    out.m_75.x = _2256;
    out.m_75.y = _2214;
    float _2270 = -_1076;
    float _2272 = fma(_2270, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2258);
    bool _2274 = !_1805;
    int _2276 = _2274 ? _2262 : (-1);
    float _2278 = -_1076;
    float _2280 = fma(_2278, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2246);
    int _2282 = int(_2128) + int(_2238);
    float _2284 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2272);
    float _2286 = _1106 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2288 = _2276 & 3;
    bool _2290 = _2288 != 0;
    float _2292 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2294 = _2276 >> 31;
    int _2296 = _2268 * _2282;
    int _2298 = _2296 + _1990;
    float _2300 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2302 = -_1076;
    float _2304 = fma(_2302, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2292);
    int _2306 = _2294 & 3;
    float _2308 = fma(_2264, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2310 = precise::clamp(_2308, 0.0, 1.0);
    bool _2312 = uint(_2298) >= uint(_774);
    float _2314 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2304);
    int _2316 = _2276 + _2306;
    float _2318 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2320 = _1098 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2322 = fma(_1086, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2280);
    int _2324 = _2316 >> 2;
    float _2326 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2318);
    float _2328 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2320);
    float _2330 = fma(_1088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2300);
    int _2332 = _2324 << 4;
    int _2334 = _2332 + 368;
    float _2336 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2286);
    float _2338 = _2322 * _2158;
    float _2340 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2326);
    uint _2342 = uint(int(uint(_2334) >> uint(2)));
    uint _2344 = uint(int(uint(int(_2342)) >> uint(2)));
    int _2346 = int(_2342) & 3;
    float _2348 = (*spvDescriptorSet0.vp_c9)._m0[int(_2344)][_2346];
    int _2350 = int(_2342) + 1;
    uint _2352 = uint(int(uint(_2350) >> uint(2)));
    int _2354 = _2350 & 3;
    float _2356 = (*spvDescriptorSet0.vp_c9)._m0[int(_2352)][_2354];
    float _2358 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2328);
    float _2360 = fma(_1102, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2330);
    int _2362 = _2276 & 3;
    bool _2364 = _2362 != 0;
    float _2366 = _2310 * _2310;
    float _2368 = fma(_1090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2220);
    bool _2370 = uint(_2362) > 1u;
    int _2372 = _2334 + 8;
    uint _2374 = uint(int(uint(_2372) >> uint(2)));
    uint _2376 = uint(int(uint(int(_2374)) >> uint(2)));
    int _2378 = int(_2374) & 3;
    float _2380 = (*spvDescriptorSet0.vp_c9)._m0[int(_2376)][_2378];
    int _2382 = int(_2374) + 1;
    uint _2384 = uint(int(uint(_2382) >> uint(2)));
    int _2386 = _2382 & 3;
    float _2388 = (*spvDescriptorSet0.vp_c9)._m0[int(_2384)][_2386];
    float _2390 = _2284 * _2158;
    float _2392 = fma(_2310, -2.0, 3.0);
    int _2394 = _2290 ? 0 : 1;
    float _2396 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2202);
    bool _2398 = _2362 != 3;
    float _2400 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2368);
    int _2402 = ~_2394;
    int _2404 = _2402 + 1;
    int _2406 = _2404 + 1;
    float _2408 = fma(_1116, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2336);
    bool _2410 = !_2312;
    int _2412 = _2410 ? 0 : (-1);
    float _2414 = _2314 * _2158;
    bool _2416 = uint(_2362) >= 2u;
    float _2418 = fma(_2358, _2154, _2338);
    int _2420 = _2406;
    if (!_2370)
    {
        int _2422 = ~_2394;
        int _2424 = _2422 + 1;
        _2420 = _2424;
    }
    int _2426 = _2420;
    float _2428 = fma(_2340, _2154, _2390);
    bool _2430 = !_2364;
    int _2432 = _2430 ? 0 : 1;
    float _2434 = _2366 * _2392;
    int _2436 = abs(_2426);
    float _2438 = fma(_2360, _2154, _2414);
    int _2440 = ~_2282;
    int _2442 = _2440 + _2412;
    int _2444 = _2442 + 1;
    float _2446 = fma(_2400, _2162, _2418);
    int _2448 = _2416 ? 0 : 1;
    float _2450 = in.m_77.x;
    bool _2452 = _2362 != 3;
    float _2454 = _1658 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2456 = abs(_2432);
    int _2458 = _774 * _2444;
    int _2460 = _2458 + _1990;
    float _2462 = fma(_1660, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2454);
    int _2464 = ~_2448;
    int _2466 = _2464 + 1;
    int _2468 = _2466 + 1;
    float _2470 = -_1774;
    float _2472 = _2470 + 1.0;
    bool _2474 = !_2452;
    int _2476 = _2474 ? 0 : (-1);
    float _2478 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2462);
    int _2480 = _2468;
    if (_2398)
    {
        int _2482 = ~_2448;
        int _2484 = _2482 + 1;
        _2480 = _2484;
    }
    int _2486 = _2480;
    float _2488 = fma(_2396, _2162, _2428);
    int _2490 = ~_2436;
    int _2492 = _2490 + 1;
    int _2494 = _2492 + 1;
    float _2496 = fma(_1682, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2478);
    bool _2498 = !_2048;
    int _2500 = _2498 ? 0 : 1;
    float _2502 = fma(_2408, _2162, _2438);
    int _2504 = abs(_2476);
    int _2506 = _2494 * as_type<int>(_2356);
    int _2508 = abs(_2486);
    float _2510 = _1858 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2512 = ~_2456;
    int _2514 = _2512 + 1;
    int _2516 = _2514 + 1;
    out.gl_Position.x = _1752;
    out.gl_Position.y = _1754;
    out.gl_Position.z = _2496;
    out.gl_Position.w = _1698;
    int _2518 = abs(_2500);
    float _2520 = _2510 * _1776;
    int _2522 = _2516 * as_type<int>(_2348);
    int _2524 = _2522 + _2506;
    int _2526 = ~_2508;
    int _2528 = _2526 + 1;
    int _2530 = _2528 + 1;
    float _2532 = -_2510;
    float _2534 = _2532 + 1.0;
    int _2536 = ~_2504;
    int _2538 = _2536 + 1;
    int _2540 = _2538 + 1;
    out.m_79.x = _2488;
    out.m_79.y = _2446;
    out.m_79.z = _2502;
    bool _2542 = _1332 <= 8000.0;
    bool _2544 = isnan(_1332);
    bool _2546 = _2542 || _2544;
    bool _2548 = isnan(8000.0);
    bool _2550 = _2546 || _2548;
    float _2552 = float(_2550);
    int _2554 = _2530 * as_type<int>(_2380);
    int _2556 = _2554 + _2524;
    float _2558 = _2496 + _1698;
    bool _2560 = !_1805;
    int _2562 = _2560 ? _2460 : (-1);
    int _2564 = _2540 * as_type<int>(_2388);
    int _2566 = _2564 + _2556;
    float _2568 = -_2434;
    float _2570 = _2568 + 1.0;
    int _2572 = ~_2518;
    int _2574 = _2572 + 1;
    int _2576 = _2574 + 1;
    float _2578 = _2558 * 0.5;
    float _2580 = fma(_2570, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2434);
    float _2582 = _1698 * 0.5;
    int _2584 = _2566 * _2576;
    float _2586 = _2552 * _2580;
    float _2588 = fma(_1754, -0.5, _2582);
    int _2590 = _2562 * _2518;
    int _2592 = _2590 + _2584;
    float _2594 = _1752 + _1698;
    float _2596 = _2586 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2598 = _1797 * _2520;
    bool _2600 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2602 = isnan(_1484);
    bool _2604 = _2600 || _2602;
    bool _2606 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2608 = _2604 || _2606;
    float _2610 = _2594 * 0.5;
    float _2612 = _2472 * _2596;
    float _2614 = precise::clamp(_2612, 0.0, 1.0);
    float _2616 = _1787 * _2520;
    float _2618 = fma(_1787, _2598, _1785);
    float _2620 = float(_2592);
    float _2622 = -_2614;
    float _2624 = fma(_2622, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_81.x = _2610;
    out.m_81.y = _2588;
    out.m_81.z = _2578;
    out.m_81.w = _1698;
    float _2626 = fma(_1793, _2616, _1781);
    float _2628 = fma(_1795, _2616, _1783);
    float _2630 = _2624 * _2450;
    float _2632 = _1787 * _2534;
    out.m_83.x = _2620;
    float _2634 = _2616;
    float _2636 = _2534;
    float _2638 = _2598;
    float _2640 = _2520;
    float _2642 = _2620;
    float _2644 = _2630;
    if (!_2608)
    {
        _2634 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2646 = _2634;
    float _2648 = _2646;
    float _2650 = _2646;
    if (!_2608)
    {
        _2636 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2652 = _2636;
    out.m_85.x = _2626;
    out.m_85.y = _2628;
    out.m_85.z = _2618;
    out.m_85.w = _2632;
    float _2654 = _2652;
    float _2656 = _2652;
    if (!_2608)
    {
        _2638 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2658 = _2638;
    float _2660 = _2658;
    float _2662 = _2658;
    if (!_2608)
    {
        _2640 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2664 = _2640;
    float _2666 = _2630 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2668 = _1460 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2670 = _2664;
    float _2672 = _2664;
    if (!_2608)
    {
        _2642 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2674 = _2642;
    float _2676 = _2674;
    float _2678 = _2674;
    if (!_2608)
    {
        _2644 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2680 = _2644;
    out.m_87.x = _2666;
    bool _2682 = !_2608;
    float _2684 = _2680;
    float _2686 = _2680;
    if (!_2682)
    {
        bool _2688 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2690 = isnan(_1484);
        bool _2692 = _2688 || _2690;
        bool _2694 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2696 = _2692 || _2694;
        if (!_2696)
        {
            float _2698 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2700 = _1484 + _2698;
            float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2704 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2702;
            float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2708 = _2706 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2710 = 1.0 / _2704;
            float _2712 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2714 = _2712 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2728 = _2700 * _2710;
            float _2730 = precise::clamp(_2728, 0.0, 1.0);
            float _2732 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2734 = _2732 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2736 = fma(_2730, _2708, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2738 = fma(_2730, _2734, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2740 = fma(_2730, _2714, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2742 = fma(_2730, _2718, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2744 = fma(_2730, _2722, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2746 = fma(_2730, _2726, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2656 = _2740;
            _2672 = _2744;
            _2650 = _2736;
            _2662 = _2742;
            _2678 = _2738;
            _2686 = _2746;
            _2748 = true;
        }
        else
        {
            bool _2750 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2752 = isnan(_1484);
            bool _2754 = _2750 || _2752;
            bool _2756 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2758 = _2754 || _2756;
            if (!_2758)
            {
                _2648 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2760 = _2648;
            _2650 = _2760;
            if (!_2758)
            {
                _2654 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2762 = _2654;
            _2656 = _2762;
            if (!_2758)
            {
                _2676 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2764 = _2676;
            _2678 = _2764;
            if (!_2758)
            {
                _2660 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2766 = _2660;
            _2662 = _2766;
            if (!_2758)
            {
                _2670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2768 = _2670;
            _2672 = _2768;
            if (!_2758)
            {
                _2684 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2770 = _2684;
            bool _2772 = !_2758;
            _2686 = _2770;
            if (!_2772)
            {
                bool _2774 = _1484 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2776 = isnan(_1484);
                bool _2778 = _2774 || _2776;
                bool _2780 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2782 = _2778 || _2780;
                if (!_2782)
                {
                    float _2784 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2786 = _1484 + _2784;
                    float _2788 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2790 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2788;
                    float _2792 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2794 = _2792 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2796 = 1.0 / _2790;
                    float _2798 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2800 = _2798 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2802 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2804 = _2802 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2808 = _2806 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2810 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2812 = _2810 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2814 = _2786 * _2796;
                    float _2816 = precise::clamp(_2814, 0.0, 1.0);
                    float _2818 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2820 = _2818 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2822 = fma(_2816, _2794, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2824 = fma(_2816, _2820, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2826 = fma(_2816, _2800, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2828 = fma(_2816, _2804, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2830 = fma(_2816, _2808, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2832 = fma(_2816, _2812, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2656 = _2826;
                    _2672 = _2830;
                    _2650 = _2822;
                    _2662 = _2828;
                    _2678 = _2824;
                    _2686 = _2832;
                    _2748 = true;
                }
                else
                {
                    _2656 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2650 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2662 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2678 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2686 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2748 = false;
    float _2834 = _2656;
    float _2836 = _2672;
    float _2838 = _2650;
    float _2840 = _2662;
    float _2842 = _2678;
    float _2844 = _2686;
    float _2846 = _2668 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2848 = fma(_2446, -0.5, 0.5);
    float _2850 = precise::clamp(_2848, 0.0, 1.0);
    float _2852 = -_2834;
    float _2854 = _2852 + _2836;
    float _2856 = -_2838;
    float _2858 = _2856 + _2840;
    out.m_53.x = _2846;
    float _2860 = -_2842;
    float _2862 = _2860 + _2844;
    float _2864 = fma(_2850, _2854, _2834);
    float _2866 = fma(_2850, _2858, _2838);
    bool _2868 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2870 = _2864 * 0.586610972881317138671875;
    float _2872 = fma(_2850, _2862, _2842);
    out.m_89.x = 0.0;
    bool _2874 = _1460 > 0.0;
    bool _2876 = isnan(_1460);
    bool _2878 = _2874 || _2876;
    bool _2880 = isnan(0.0);
    bool _2882 = _2878 || _2880;
    float _2884 = fma(_2866, 0.298911988735198974609375, _2870);
    float _2886 = fma(_2872, 0.114477999508380889892578125, _2884);
    float _2888 = -_2886;
    float _2890 = _2866 + _2888;
    float _2892 = -_2886;
    float _2894 = _2864 + _2892;
    float _2896 = -_2886;
    float _2898 = _2872 + _2896;
    float _2900 = fma(_2890, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    float _2902 = fma(_2894, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    float _2904 = fma(_2898, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2886);
    bool _2906 = !_2868;
    if (!_2906)
    {
        float _2908 = -_1394;
        float _2910 = _2908 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2912 = -_1396;
        float _2914 = _2912 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2916 = -_1398;
        float _2918 = _2916 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2920 = _2910 * _2910;
        float _2922 = fma(_2914, _2914, _2920);
        float _2924 = fma(_2918, _2918, _2922);
        float _2926 = sqrt(_2924);
        float _2928 = rsqrt(_2924);
        float _2930 = -_2926;
        float _2932 = _2930 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2934 = _2932 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2936 = precise::clamp(_2934, 0.0, 1.0);
        float _2938 = _2914 * _2928;
        float _2940 = _2910 * _2928;
        float _2942 = abs(_2936);
        float _2944 = log2(_2942);
        float _2946 = _2918 * _2928;
        float _2948 = _2938 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2950 = _2446 * _2940;
        float _2952 = -_2940;
        float _2954 = -_2948;
        float _2956 = fma(_2952, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2954);
        float _2958 = fma(_2488, _2938, _2950);
        float _2960 = -_2946;
        float _2962 = fma(_2960, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2956);
        float _2964 = fma(_2502, _2946, _2958);
        float _2966 = precise::clamp(_2964, 0.0, 1.0);
        float _2968 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2970 = _2962 + _2968;
        float _2972 = _2944 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2974 = _2970 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2976 = precise::clamp(_2974, 0.0, 1.0);
        float _2978 = exp2(_2972);
        float _2980 = _2978 * _2976;
        float _2982 = _2966 * _2980;
        float _2984 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2986 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2988 = _2982 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2984;
        out.m_89.y = _2986;
        out.m_89.z = _2988;
    }
    out.m_91.x = _2900;
    out.m_91.y = _2902;
    out.m_91.z = _2904;
    if (_2882)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2990 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2990;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

