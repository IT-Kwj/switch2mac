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
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_57 [[user(locn0)]];
    float4 m_65 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_67 [[user(locn3)]];
    float4 m_63 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_69 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_75 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_44 [[attribute(4)]];
    float4 m_59 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
    float4 m_61 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _632 = false;
    bool _534 = false;
    bool _306 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3056 = as_type<float>(_118);
        out.gl_Position.z = _3056;
    }
    if (!_104)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _120 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_91);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = float(_96);
    bool _132 = _100 >= _130;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    if (_136)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _108;
    if (_136)
    {
        out.m_49.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_144);
        out.gl_Position.z = _3111;
    }
    if (_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _130;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _178 = _156;
    float _196;
    if (!_176)
    {
        float _180 = in.m_53.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _156;
    }
    _198 = false;
    float _200 = _196;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -_216;
    float _236 = _234 + 1.0;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _238;
    float _242 = 1.0 / _220;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _246 = _232 * _236;
    float _248 = -_232;
    float _250 = _248 + 1.0;
    float _252 = _204 * _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = fma(_240, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = fma(_256, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _258 * _246;
    float _270 = _266 * _246;
    float _272 = _264 * _246;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].x, _268);
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].y, _270);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _280 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _276);
    float _284 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _278);
    bool _286 = !_244;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _156;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_55.x;
    float _312 = in.m_55.y;
    float _314 = in.m_55.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _318 = _308 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _308 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _336 = 1.0 / _326;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _340 = 1.0 / _334;
    float _342 = _282 * _312;
    bool _344 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _284 * _314;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = _308 + _358;
    float _362 = 1.0 / _330;
    float _364 = _318 * _336;
    bool _366 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _368 = isnan(_308);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_354;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = _280 * _310;
    float _388 = _376 * _380;
    float _390 = _322 * _340;
    bool _392 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _394 = isnan(_308);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -_376;
    float _406 = _404 + 1.0;
    bool _408 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _410 = isnan(_308);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = _402 * _406;
    float _430 = _360 * _362;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _436;
    float _440 = _418 * _426;
    float _442 = fma(_384, _430, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _444 = fma(_434, _430, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _446 = fma(_438, _430, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _452 = -_418;
    float _454 = _452 + 1.0;
    float _456 = _444 * _440;
    float _458 = _446 * _440;
    float _460 = _442 * _440;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].y, _458);
    float _468 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].x, _456);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _470;
    float _474 = fma(_422, _390, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _476 = fma(_450, _390, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _478 = fma(_464, _390, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _480 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].z, _460);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _486;
    float _490 = fma(_474, _428, _468);
    float _492 = fma(_472, _364, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _494 = fma(_484, _364, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _496 = fma(_488, _364, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _498 = fma(_476, _428, _466);
    float _500 = fma(_478, _428, _480);
    float _502 = fma(_494, _388, _490);
    float _504 = fma(_492, _388, _498);
    float _506 = fma(_496, _388, _500);
    float _508 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].x, _502);
    float _510 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].y, _504);
    float _512 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].z, _506);
    bool _514 = !_338;
    float _532;
    if (!_514)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        _532 = _156;
    }
    _534 = false;
    float _536 = _532;
    bool _538 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_536);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _556 = isnan(_536);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _572 = _536 + _570;
    float _574 = -_548;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _580 = 1.0 / _552;
    float _582 = _564 * _576;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = _568 * _580;
    float _590 = _512 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = fma(_588, _572, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = _510 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = _592 * _582;
    float _600 = _508 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[115].x, _598);
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[116].x, _604);
    float _610 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _606;
    out.m_57.y = _602;
    out.m_57.z = _596;
    out.m_57.w = _610;
    bool _612 = !_578;
    float _630;
    if (!_612)
    {
        float _614 = in.m_53.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        _630 = _156;
    }
    _632 = false;
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _638 = _634 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _642 = _634 + _640;
    bool _644 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _646 = isnan(_634);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _670 = _634 + _668;
    float _672 = 1.0 / _666;
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _676 = 1.0 / _662;
    bool _678 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _680 = isnan(_634);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _658;
    float _692 = _642 * _672;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    bool _698 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _700 = isnan(_634);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _688 * _696;
    float _712 = -_688;
    float _714 = _712 + 1.0;
    float _716 = _638 * _676;
    bool _718 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _720 = isnan(_634);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _738 = -_728;
    float _740 = _738 + 1.0;
    float _742 = _728 * _714;
    float _744 = _670 * _690;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _750;
    float _754 = _708 * _740;
    float _756 = fma(_732, _744, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _758 = fma(_748, _744, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _760 = fma(_752, _744, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _766 = -_708;
    float _768 = _766 + 1.0;
    float _770 = _758 * _754;
    float _772 = _760 * _754;
    float _774 = _756 * _754;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _780 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].x, _770);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _782;
    float _786 = fma(_736, _716, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _788 = fma(_764, _716, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].y, _772);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _792;
    float _796 = fma(_778, _716, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _798 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].z, _774);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _800;
    float _804 = fma(_786, _742, _780);
    float _806 = fma(_784, _692, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _808 = fma(_794, _692, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _810 = fma(_788, _742, _790);
    float _812 = fma(_802, _692, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _814 = fma(_796, _742, _798);
    float _816 = fma(_806, _710, _804);
    float _818 = fma(_808, _710, _810);
    float _820 = fma(_812, _710, _814);
    float _822 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].x, _816);
    float _824 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].y, _818);
    float _826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].z, _820);
    bool _828 = !_674;
    if (!_828)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _178 = _844;
    }
    float _846 = _178;
    float _848 = in.m_53.z;
    float _850 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _852 = log2(_850);
    float _854 = in.m_53.y;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _858 = _856 != 0;
    float _860 = in.m_53.x;
    float _862 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _864 = int(_862);
    float _866 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _868 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _870 = precise::max(_866, _868);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _874 = _870 >= 16.0;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _878 = _848 * 2.0;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _882 = floor(_878);
    float _884 = _854 * 2.0;
    float _886 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _890 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _892 = _860 * 2.0;
    float _894 = fma(_886, -2.0, _876);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _898 = floor(_884);
    float _900 = _860 + _854;
    float _902 = -_872;
    float _904 = fma(_890, 2.0, _902);
    float _906 = _860 + _848;
    float _908 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].w, _896);
    float _910 = _900 + (-1.0);
    float _912 = _906 + (-1.0);
    bool _914 = _882 >= 0.0;
    bool _916 = isnan(_882);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _926 = floor(_892);
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _938 = _936 != 0;
    float _940 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _942 = _922 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _944 = _898 > 0.0;
    bool _946 = !_934;
    int _948 = _946 ? 0 : 1;
    float _950 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _952 = int(_950);
    bool _954 = _882 > 0.0;
    int _956 = ~as_type<int>(_942);
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    bool _962 = _898 >= 0.0;
    bool _964 = isnan(_898);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = !_930;
    int _974 = _972 ? 0 : 1;
    bool _976 = !_938;
    int _978 = _976 ? 0 : 1;
    int _980 = _970 ? 0 : 1;
    float _982 = _912;
    int _984 = _960;
    float _986 = _942;
    float _988 = _848;
    if (_858)
    {
        _982 = _854;
    }
    float _990 = _982;
    float _992 = _990;
    if (!_954)
    {
        int _994 = ~as_type<int>(_942);
        int _996 = _994 + 1;
        _984 = _996;
    }
    int _998 = _984;
    if (_858)
    {
        _986 = _860;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (!_858)
    {
        _1002 = _848;
    }
    float _1004 = _1002;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1016 = _1014 != 0;
    bool _1018 = _926 >= 0.0;
    bool _1020 = isnan(_926);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    float _1028 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_858)
    {
        _992 = _860;
    }
    float _1030 = _992;
    bool _1032 = !_1008;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = -_880;
    float _1038 = fma(_1028, 2.0, _1036);
    bool _1040 = _926 > 0.0;
    int _1042 = ~_980;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    int _1048 = _1046;
    if (!_944)
    {
        int _1050 = ~_980;
        int _1052 = _1050 + 1;
        _1048 = _1052;
    }
    int _1054 = _1048;
    float _1056 = _852 * _100;
    int _1058 = abs(_1034);
    float _1060 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1062 = _1026 ? 0 : 1;
    float _1064 = float(_998);
    float _1066 = exp2(_1056);
    float _1068 = float(_1058);
    float _1070 = fma(_1060, -2.0, _888);
    float _1072 = float(_864);
    float _1074 = _1068 * _1064;
    int _1076 = ~_1062;
    int _1078 = _1076 + 1;
    int _1080 = _1078 + 1;
    float _1082 = 1.0 / _1072;
    int _1084 = _1080;
    if (!_1040)
    {
        int _1086 = ~_1062;
        int _1088 = _1086 + 1;
        _1084 = _1088;
    }
    int _1090 = _1084;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1094 = 1.0 + _1092;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1098 = 1.0 / _1094;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1102 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1104 = isnan(1.0);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1110 = _1106 || _1108;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1114 = !_1016;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1100);
    float _1120 = -_1066;
    float _1122 = _1120 + 1.0;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _894);
    int _1136 = abs(_1116);
    float _1138 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1112);
    float _1140 = float(_952);
    float _1142 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1144 = _1132 ? _1122 : 0.0;
    float _1146 = -_100;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1038);
    float _1150 = -_100;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[76].x, _904);
    float _1154 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1118);
    float _1156 = _1140 * _100;
    float _1158 = _1082 * _100;
    float _1160 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1138);
    float _1162 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1142);
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _908);
    float _1166 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1070);
    bool _1168 = _1110;
    float _1170 = _1162;
    if (_1110)
    {
        float _1172 = _1144 * _1098;
        _110 = _1172;
    }
    float _1174 = _110;
    float _1176 = _1074 * (-2.0);
    float _1178 = float(_1136);
    float _1180 = _860 + (-0.5);
    float _1182 = float(_1054);
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1186 = fma(_924, _1176, _924);
    bool _1188 = !_1012;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1194 = _1178 * _1182;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1198 = _874 ? _1184 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1200 = fma(_1186, _1174, _1192);
    int _1202 = abs(_1190);
    float _1204 = _854 + _848;
    float _1206 = _874 ? _1196 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1208 = _1200 * 0.15915493667125701904296875;
    float _1210 = abs(_1198);
    bool _1212 = _1210 != 0.0;
    bool _1214 = isnan(_1210);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = _1204 + (-1.0);
    float _1224 = float(_1202);
    float _1226 = _1194 * (-2.0);
    float _1228 = float(_1090);
    float _1230 = _1208 * 6.283185482025146484375;
    float _1232 = sin(_1230);
    float _1234 = abs(_1206);
    bool _1236 = _1234 == 0.0;
    bool _1238 = !_1220;
    bool _1240 = _1236 && _1238;
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = _1224 * _1228;
    float _1250 = abs(_1206);
    bool _1252 = _1250 == 0.0;
    float _1254 = fma(_940, _1226, _940);
    float _1256 = _854 + (-0.5);
    float _1258 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1260 = _1248 * (-2.0);
    float _1262 = _848 + (-0.5);
    float _1264 = _1208 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = fma(_1258, _1260, _1258);
    float _1270 = _1174;
    int _1272 = as_type<int>(_1268);
    if (_1240)
    {
        bool _1274 = as_type<int>(_1206) >= 0;
        _1168 = _1274;
    }
    bool _1276 = _1168;
    float _1278 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1282 = 0;
    int _1284 = _1276 ? (-1) : 0;
    if (_1240)
    {
        int _1286 = _1276 ? 0 : 1078530011;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = fma(_1268, _1174, _1278);
    float _1292 = fma(_1254, _1174, _1280);
    if (_1240)
    {
        int _1294 = int(0x80000000) & as_type<int>(_1198);
        int _1296 = _1288 | _1294;
        _1270 = as_type<float>(_1296);
    }
    float _1298 = _1270;
    bool _1300 = !_1220;
    bool _1302 = _1300 && _1252;
    float _1304 = _1298;
    float _1306 = _1298;
    if (!_1302)
    {
        float _1308 = abs(_1198);
        bool _1310 = _1308 != as_type<float>(0x7f800000u /* inf */);
        bool _1312 = isnan(_1308);
        bool _1314 = _1310 || _1312;
        bool _1316 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1318 = _1314 || _1316;
        float _1320 = abs(_1206);
        bool _1322 = _1320 == as_type<float>(0x7f800000u /* inf */);
        float _1324 = abs(_1206);
        bool _1326 = _1324 == as_type<float>(0x7f800000u /* inf */);
        bool _1328 = !_1318;
        bool _1330 = _1326 && _1328;
        if (_1330)
        {
            bool _1332 = as_type<int>(_1206) >= 0;
            _1284 = _1332 ? (-1) : 0;
        }
        int _1334 = _1284;
        if (_1330)
        {
            _1272 = 1075235812;
        }
        int _1336 = _1272;
        int _1338 = _1336;
        if (_1330)
        {
            int _1340 = ~_1334;
            int _1342 = (_1340 != 0) ? _1336 : 1061752795;
            _1338 = _1342;
        }
        int _1344 = _1338;
        if (_1330)
        {
            int _1346 = int(0x80000000) & as_type<int>(_1198);
            int _1348 = _1344 | _1346;
            _1304 = as_type<float>(_1348);
        }
        float _1350 = _1304;
        bool _1352 = !_1318;
        bool _1354 = _1352 && _1322;
        _1306 = _1350;
        if (!_1354)
        {
            float _1356 = abs(_1198);
            float _1358 = abs(_1206);
            float _1360 = precise::max(_1356, _1358);
            float _1362 = abs(_1198);
            float _1364 = abs(_1206);
            float _1366 = precise::min(_1362, _1364);
            float _1368 = 1.0 / _1360;
            float _1370 = abs(_1198);
            float _1372 = abs(_1206);
            bool _1374 = _1370 > _1372;
            bool _1376 = as_type<int>(_1206) >= 0;
            float _1378 = abs(_1198);
            float _1380 = abs(_1206);
            float _1382 = _1378 + _1380;
            int _1384 = as_type<int>(_1198) & int(0x80000000);
            bool _1386 = _1382 > as_type<float>(0x7f800000u /* inf */);
            bool _1388 = isnan(_1382);
            bool _1390 = _1386 || _1388;
            bool _1392 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1394 = _1390 || _1392;
            float _1396 = _1366 * _1368;
            float _1398 = _1396 * _1396;
            float _1400 = _1398 + 11.33538818359375;
            float _1402 = fma(_1398, _1400, 28.84246826171875);
            float _1404 = fma(_1398, _1402, 19.6966705322265625);
            float _1406 = fma(_1398, -0.82336294651031494140625, -5.674867153167724609375);
            float _1408 = fma(_1398, _1406, -6.565555095672607421875);
            float _1410 = 1.0 / _1404;
            float _1412 = _1398 * _1408;
            float _1414 = _1396 * _1412;
            float _1416 = fma(_1414, _1410, _1396);
            float _1418 = _1416;
            _1306 = _1382;
            if (_1374)
            {
                float _1420 = -_1416;
                float _1422 = _1420 + 1.57079637050628662109375;
                _1418 = _1422;
            }
            float _1424 = _1418;
            int _1426 = as_type<int>(_1424);
            if (!_1376)
            {
                float _1428 = -_1424;
                float _1430 = _1428 + 3.1415927410125732421875;
                _1426 = as_type<int>(_1430);
            }
            int _1432 = _1426;
            if (!_1394)
            {
                int _1434 = _1384 | _1432;
                _1306 = as_type<float>(_1434);
            }
        }
    }
    float _1436 = _1306;
    float _1438 = _1290 + _1436;
    float _1440 = _1292 * 0.15915493667125701904296875;
    float _1442 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1444 = _1438 * 0.15915493667125701904296875;
    float _1446 = _1440 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = in.m_42.x;
    float _1452 = in.m_42.y;
    float _1454 = in.m_42.z;
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1462 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1464 = _1456 * _1442;
    float _1466 = _1444 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1460 * _1462;
    float _1472 = _1444 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1448 * _1464;
    float _1478 = _1232 * _1476;
    float _1480 = _1266 * _1476;
    float _1482 = _1440 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = _1266 * _1468;
    float _1488 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1490 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1488);
    float _1492 = _1232 * _1474;
    float _1494 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1496 = _1232 * _1468;
    float _1498 = _1468 * _1448;
    float _1500 = _1474 * _1448;
    float _1502 = _1458 * _1494;
    float _1504 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1506 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1508 = -_1486;
    float _1510 = fma(_1484, _1492, _1508);
    float _1512 = -_1464;
    float _1514 = _1484 * _1512;
    float _1516 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1504);
    float _1518 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1506);
    float _1520 = fma(_1510, _1470, _1478);
    float _1522 = _1266 * _1474;
    float _1524 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1516);
    float _1526 = fma(_1500, _1470, _1514);
    float _1528 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    float _1530 = fma(_1484, _1496, _1522);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1534 = fma(_1498, _1502, _1526);
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1538 = fma(_1530, _1502, _1520);
    float _1540 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1518);
    float _1542 = fma(_1484, _1522, _1496);
    float _1544 = _1536 + _1534;
    float _1546 = _1532 + _1538;
    float _1548 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1550 = -_1492;
    float _1552 = fma(_1484, _1486, _1550);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1556 = _1544 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1560 = _1546 + _1558;
    float _1562 = fma(_1542, _1470, _1480);
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = _1560 * _1560;
    float _1568 = fma(_1552, _1502, _1562);
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1572 = fma(_1556, _1556, _1566);
    float _1574 = _1548 + _1568;
    float _1576 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1570);
    float _1578 = sqrt(_1572);
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1570;
    float _1584 = _1492;
    float _1586 = _1546;
    float _1588 = _1578;
    if (!_1580)
    {
        _1582 = _1544;
    }
    float _1590 = _1582;
    float _1592 = _1590;
    if (!_1580)
    {
        _1584 = _1574;
    }
    float _1594 = _1584;
    bool _1596 = !_1580;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1604 = _1578 + _1602;
        float _1606 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = rsqrt(_1572);
        float _1610 = _1604 * _1600;
        float _1612 = _1610 * 0.15915493667125701904296875;
        float _1614 = _1612 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        float _1622 = fma(_1616, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1624 = _1608 * _1622;
        float _1626 = _1620 + (-1.0);
        float _1628 = fma(_1556, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1630 = fma(_1560, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1632 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = fma(_1574, _1620, _1632);
        _1598 = _1634;
        _1592 = _1628;
        _1586 = _1630;
    }
    float _1636 = _1598;
    float _1638 = _1592;
    float _1640 = _1586;
    float _1642 = -_1548;
    float _1644 = _1642 + _1636;
    float _1646 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1648 = -_1536;
    float _1650 = _1648 + _1638;
    float _1652 = -_1532;
    float _1654 = _1652 + _1640;
    float _1656 = _1644 * _1644;
    float _1658 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1660 = 1.0 / _1646;
    float _1662 = fma(_1650, _1650, _1656);
    bool _1664 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1666 = isnan(0.5);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1672 = _1668 || _1670;
    float _1674 = fma(_1654, _1654, _1662);
    float _1676 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1658);
    float _1678 = sqrt(_1674);
    float _1680 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1676);
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1684 = _1682 + _1646;
    float _1686 = _1684 * _1660;
    float _1688 = _1686 * 0.5;
    bool _1690 = _1678 > 0.0;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1694 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1692);
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1698 = _1678;
    float _1700 = _1636;
    float _1702 = _1638;
    float _1704 = _1640;
    float _1706 = _1654;
    float _1708 = _1674;
    if (_1672)
    {
        _1696 = 1.0;
    }
    float _1710 = _1696;
    float _1712 = 1.0 / _1694;
    bool _1714 = !_1690;
    float _1716 = _1710;
    if (!_1714)
    {
        float _1718 = _170 * _170;
        float _1720 = fma(_172, _172, _1718);
        float _1722 = fma(_174, _174, _1720);
        float _1724 = rsqrt(_1674);
        float _1726 = sqrt(_1722);
        float _1728 = _1650 * _1724;
        float _1730 = _1644 * _1724;
        float _1732 = _1654 * _1724;
        bool _1734 = _1726 > 0.0;
        bool _1736 = !_1734;
        _1698 = _1724;
        if (!_1736)
        {
            float _1738 = rsqrt(_1722);
            float _1740 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1742 = _170 * _1738;
            float _1744 = _172 * _1738;
            float _1746 = _1730 * _1742;
            float _1748 = _174 * _1738;
            float _1750 = fma(_1728, _1744, _1746);
            float _1752 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1754 = fma(_1732, _1748, _1750);
            float _1756 = _1754 * _1752;
            float _1758 = fma(_172, _1756, _1638);
            float _1760 = fma(_170, _1756, _1636);
            float _1762 = fma(_174, _1756, _1640);
            _1698 = _1756;
            _1700 = _1760;
            _1702 = _1758;
            _1704 = _1762;
            _1706 = _1750;
        }
    }
    float _1764 = _1698;
    float _1766 = _1700;
    float _1768 = _1702;
    float _1770 = _1704;
    float _1772 = _1706;
    float _1774 = _1772;
    float _1776 = _1764;
    if (_1672)
    {
        _1708 = 1.0;
    }
    float _1778 = _1708;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1782 = _1712 * _1780;
    float _1784 = _1778;
    if (!_1672)
    {
        float _1786 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1788 = _1786 * 0.15915493667125701904296875;
        float _1790 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1792 = _1788 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        float _1796 = _1790 * 0.15915493667125701904296875;
        float _1798 = _1788 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = 1.0 / _1794;
        float _1804 = _1796 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = _1800 * _1802;
        float _1810 = _1796 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = _1806 * _1808;
        float _1816 = 1.0 / _1814;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1820 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1818;
        float _1822 = 1.0 / _1820;
        float _1824 = _1812 * _1816;
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = fma(_1782, _1824, _1826);
        float _1830 = _1828 * _1822;
        float _1832 = precise::clamp(_1830, 0.0, 1.0);
        _1774 = _1796;
        _1776 = _1802;
        _1716 = _1832;
    }
    float _1834 = _1774;
    float _1836 = _1776;
    float _1838 = _1716;
    float _1840 = _1834;
    float _1842 = _1836;
    if (!_1672)
    {
        float _1844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1846 = _1844 * 0.15915493667125701904296875;
        float _1848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1850 = _1846 * 6.283185482025146484375;
        float _1852 = cos(_1850);
        float _1854 = _1848 * 0.15915493667125701904296875;
        float _1856 = _1846 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        float _1860 = 1.0 / _1852;
        float _1862 = _1854 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = _1858 * _1860;
        float _1868 = _1854 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1864 * _1866;
        float _1874 = 1.0 / _1872;
        float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1878 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1876;
        float _1880 = 1.0 / _1878;
        float _1882 = _1870 * _1874;
        float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1886 = fma(_1782, _1882, _1884);
        float _1888 = _1886 * _1880;
        float _1890 = precise::clamp(_1888, 0.0, 1.0);
        float _1892 = -_1890;
        float _1894 = _1892 + 1.0;
        _1840 = _1872;
        _1842 = _1846;
        _1784 = _1894;
    }
    float _1896 = _1840;
    float _1898 = _1842;
    float _1900 = _1784;
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1904 = _1766 + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1908 = _1768 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1770 + _1910;
    float _1914 = _1904 * _1904;
    float _1916 = fma(_1908, _1908, _1914);
    float _1918 = fma(_1912, _1912, _1916);
    float _1920 = rsqrt(_1918);
    float _1922 = sqrt(_1918);
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1926 = _1908 * _1924;
    float _1928 = _1912 * _1924;
    float _1930 = _1926 * _1926;
    float _1932 = _1928 * _1928;
    float _1934 = _1930 + _1932;
    float _1936 = sqrt(_1934);
    bool _1938 = _1936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = _1936 + _1940;
    float _1944 = _1920;
    float _1946 = _1942;
    float _1948 = _1896;
    float _1950 = _1904;
    if (_1938)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = _1954;
    if (_1938)
    {
        float _1958 = _1942 * _1954;
        _1946 = _1958;
    }
    float _1960 = _1946;
    if (_1938)
    {
        float _1962 = rsqrt(_1934);
        _1956 = _1962;
    }
    float _1964 = _1956;
    float _1966 = _1964;
    if (_1938)
    {
        float _1968 = _1960 * 0.15915493667125701904296875;
        _1948 = _1968;
    }
    float _1970 = _1948;
    float _1972 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1974 = _1912;
    float _1976 = _1970;
    if (_1938)
    {
        float _1978 = _1970 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = precise::max(0.0, _1972);
    float _1986 = _1898;
    float _1988 = _1984;
    if (_1938)
    {
        float _1990 = _1970 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        _1986 = _1992;
    }
    float _1994 = _1986;
    float _1996 = -_1924;
    float _1998 = -_1984;
    float _2000 = fma(_1904, _1996, _1998);
    if (_1938)
    {
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _2002;
    }
    float _2004 = _1950;
    float _2006 = _1982;
    float _2008 = _2004;
    if (_1938)
    {
        float _2010 = fma(_1982, _2004, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2006 = _2010;
    }
    float _2012 = _2006;
    float _2014 = _2012;
    if (!_1938)
    {
        _2008 = _2000;
    }
    float _2016 = _2008;
    float _2018 = _2016;
    if (_1938)
    {
        float _2020 = _1964 * _2012;
        _1588 = _2020;
    }
    float _2022 = _1588;
    if (!_1938)
    {
        _1966 = _1926;
    }
    float _2024 = _1966;
    float _2026 = _2024;
    float _2028 = _1994;
    if (_1938)
    {
        float _2030 = _1994 + (-1.0);
        _1988 = _2030;
    }
    float _2032 = _1988;
    float _2034 = _2032;
    if (_1938)
    {
        float _2036 = _1926 * _2022;
        _2026 = _2036;
    }
    float _2038 = _2026;
    if (!_1938)
    {
        _2014 = _1928;
    }
    float _2040 = _2014;
    float _2042 = _2040;
    if (_1938)
    {
        float _2044 = _1928 * _2022;
        _2042 = _2044;
    }
    float _2046 = _2042;
    if (_1938)
    {
        float _2048 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1976 = _2048;
    }
    float _2050 = _1976;
    if (!_1938)
    {
        _2034 = _1930;
    }
    float _2052 = _2034;
    float _2054 = _2052;
    if (_1938)
    {
        float _2056 = _2038 * _2038;
        _2054 = _2056;
    }
    float _2058 = _2054;
    if (_1938)
    {
        float _2060 = fma(_2000, _1994, _2050);
        _2018 = _2060;
    }
    float _2062 = _2018;
    if (!_1938)
    {
        _2028 = _1932;
    }
    float _2064 = _2028;
    float _2066 = _2064;
    if (_1938)
    {
        float _2068 = _2046 * _2046;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2074 = fma(_2062, _2062, _2058);
    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2078 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2076);
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    float _2082 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2084 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2072);
    float _2086 = _2074 + _2070;
    float _2088 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2090 = -_2080;
    float _2092 = _2090 + 1.0;
    float _2094 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2084);
    float _2096 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2088);
    float _2100 = rsqrt(_2086);
    float _2102 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2104 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2106 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2112 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2104);
    float _2114 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = abs(_2092);
    float _2118 = log2(_2116);
    float _2120 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2122 = -_2110;
    float _2124 = fma(_2122, _2082, 1.0);
    float _2126 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2112);
    float _2128 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = _2100 * _2038;
    float _2136 = _2100 * _2062;
    float _2138 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2140 = _2100 * _2046;
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = log2(_2124);
    float _2146 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2138);
    float _2148 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2146);
    float _2158 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2148);
    float _2160 = -_2140;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2166 = 1.0 / _2156;
    float _2168 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2158);
    float _2170 = fma(_2162, -0.5, 0.5);
    float _2172 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2174 = fma(_2162, 0.5, 0.5);
    float _2176 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2168);
    float _2178 = _2136 + 1.0;
    float _2180 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2172);
    float _2182 = exp2(_2154);
    float _2184 = fma(_2174, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2186 = _2144 * 0.693147182464599609375;
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2180);
    float _2190 = fma(_2174, _2184, -0.212114393711090087890625);
    float _2192 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = sqrt(_2170);
    float _2196 = _2176 * _2166;
    float _2198 = _2188 * _2166;
    float _2200 = fma(_2174, _2190, 1.570728778839111328125);
    float _2202 = fma(_2196, 0.5, 0.5);
    float _2204 = fma(_2198, -0.5, 0.5);
    float _2206 = -_2136;
    float _2208 = fma(_2182, _2178, _2206);
    float _2210 = fma(_2208, 0.5, 0.5);
    float _2212 = _2194 * 0.636619746685028076171875;
    float _2214 = -_2200;
    float _2216 = fma(_2212, _2214, 1.0);
    float3 _6370 = float3(_2202, _2204, _2192);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6370, float3(0.0), isnan(_6370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6370, float3(0.0), isnan(_6370)), level(0.0)).x;
    float3 _6381 = float3(_2202, _2204, _2192);
    float4 _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6381, float3(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6381, float3(0.0), isnan(_6381)), level(0.0)).xyzw;
    float _2223 = _2221.x;
    float _2225 = _2221.y;
    float _2227 = _2221.z;
    float _2229 = _2221.w;
    float2 _6398 = float2(_2216, _2210);
    float3 _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6398, float2(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6398, float2(0.0), isnan(_6398)), level(0.0)).xyz;
    float _2235 = _2233.x;
    float _2237 = _2233.y;
    float _2239 = _2233.z;
    float _2241 = float(uint(_952));
    float _2243 = trunc(_1158);
    int _2245 = int(_2243);
    int _2247 = ~_952;
    int _2249 = _2247 + 1;
    float _2251 = _1156 * _152;
    int _2253 = ~_952;
    int _2255 = _2253 + 1;
    float _2257 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2259 = _952 + (-1);
    float _2261 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2263 = _854 > 0.5;
    float _2265 = 1.0 / _2241;
    float _2267 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2269 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2267);
    float _2271 = float(uint(_2245));
    float _2273 = trunc(_2251);
    int _2275 = int(_2273);
    float _2277 = float(_2245);
    float _2279 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2281 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2279);
    int _2283 = as_type<int>(_2265) + (-2);
    float _2285 = exp2(_2261);
    out.gl_Position.x = _2176;
    out.gl_Position.y = _2188;
    out.gl_Position.z = _2281;
    out.gl_Position.w = _2156;
    float _2287 = as_type<float>(_2283) * _2271;
    float _2289 = trunc(_2287);
    float _2291 = precise::max(_2289, 0.0);
    uint _2294 = uint(_2291);
    float _2296 = -_2285;
    float _2298 = _2296 + 1.0;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2302 = _2249 * int(_2294);
    int _2304 = _2302 + _2245;
    float _2306 = float(uint(_2304));
    float _2308 = as_type<float>(_2283) * _2306;
    float _2310 = trunc(_2308);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    bool _2316 = !_858;
    float _2318 = _2316 ? 7.345489978790283203125 : 1.0;
    float _2320 = _2318 * _860;
    float _2322 = floor(_2320);
    int _2324 = int(_2294) + int(_2314);
    bool _2326 = _2277 >= _1140;
    bool _2328 = isnan(_2277);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(_1140);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    int _2338 = _2255 * _2324;
    int _2340 = _2338 + _2245;
    float _2342 = trunc(_2336);
    int _2344 = int(_2342);
    bool _2346 = uint(_2340) >= uint(_952);
    float _2348 = -_2322;
    float _2350 = _2320 + _2348;
    bool _2352 = !_2346;
    int _2354 = _2352 ? 0 : (-1);
    bool _2356 = _952 == 0;
    int _2358 = ~_2324;
    int _2360 = _2358 + _2354;
    int _2362 = _2360 + 1;
    float _2364 = _2350 * _1140;
    int _2366 = _952 * _2362;
    int _2368 = _2366 + _2245;
    int _2370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2372 = _2370 != 0;
    float _2374 = trunc(_2364);
    int _2376 = int(_2374);
    int _2378 = ~_2344;
    int _2380 = _2378 + 1;
    int _2382 = _2380 + 1;
    bool _2384 = !_2356;
    int _2386 = _2384 ? _2368 : (-1);
    bool _2388 = !_2372;
    int _2390 = _2388 ? 0 : 1;
    int _2392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2394 = _2392 != 0;
    int _2396 = _2386 * _2382;
    int _2398 = abs(_948);
    int _2400 = abs(_2390);
    int _2402 = _2344 * _2259;
    int _2404 = _2402 + _2396;
    int _2406 = abs(_974);
    int _2408 = _2404 * _2398;
    bool _2410 = !_2394;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = in.m_53.w;
    int _2416 = abs(_978);
    int _2418 = _2376 * _2400;
    int _2420 = _2418 + _2245;
    int _2422 = abs(_2412);
    int _2424 = _2275 * _2406;
    int _2426 = _2424 + _2408;
    float _2428 = in.m_61.x;
    float _2430 = float(uint(_2420));
    int _2432 = _2420 * _2416;
    int _2434 = _2432 + _2426;
    float _2436 = in.m_61.y;
    int _2438 = ~_952;
    int _2440 = _2438 + 1;
    int _2442 = _2376 * _2422;
    int _2444 = _2442 + _2434;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = float(uint(_2444));
    bool _2452 = _848 > 0.5;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2456 = _2454 != 0;
    float _2458 = as_type<float>(_2283) * _2450;
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2462 = _2460 != 0;
    float _2464 = trunc(_2458);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    int _2470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2472 = _2470 != 0;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2476 = _2472;
    float _2478 = _2428;
    if (!_2448)
    {
        _988 = _2428;
    }
    float _2480 = _988;
    float _2482 = as_type<float>(_2283) * _2430;
    int _2484 = _2440 * int(_2468);
    int _2486 = _2484 + _2444;
    float _2488 = trunc(_2482);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    float _2494 = float(uint(_2486));
    float _2496 = as_type<float>(_2283) * _2494;
    float _2498 = -_2436;
    float _2500 = _2498 + 1.0;
    float _2502 = trunc(_2496);
    float _2504 = precise::max(_2502, 0.0);
    uint _2506 = uint(_2504);
    int _2508 = _2263 ? as_type<int>(_2500) : as_type<int>(_2436);
    int _2510 = _2452 ? as_type<int>(_2500) : as_type<int>(_2436);
    float _2512 = _2462 ? as_type<float>(_2508) : _2436;
    float _2514 = _2472 ? as_type<float>(_2510) : _2436;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2520 = _2414 > 0.5;
    float _2522 = _2436;
    float _2524 = _2480;
    if (_2448)
    {
        float _2526 = -_2428;
        float _2528 = _2526 + 1.0;
        _2474 = as_type<int>(_2528);
    }
    int _2530 = _2474;
    if (_2448)
    {
        bool _2532 = _860 > 0.5;
        _2476 = _2532;
    }
    bool _2534 = _2476;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2538 = ~_952;
    int _2540 = _2538 + 1;
    if (_2456)
    {
        float _2542 = _2520 ? _2500 : _2436;
        _2522 = _2542;
    }
    float _2544 = _2522;
    if (_2448)
    {
        float _2546 = _2534 ? as_type<float>(_2530) : _2428;
        _2524 = _2546;
    }
    float _2548 = _2524;
    float _2550 = 1.0 / _2518;
    int _2552 = int(_2468) + int(_2506);
    int _2554 = _2540 * int(_2492);
    int _2556 = _2554 + _2420;
    int _2558 = ~_952;
    int _2560 = _2558 + 1;
    float _2562 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2564 = _2560 * _2552;
    int _2566 = _2564 + _2444;
    float _2568 = float(uint(_2556));
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2570;
    int _2574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2576 = _2574 != 0;
    float _2578 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2580 = uint(_2566) >= uint(_952);
    float _2582 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2584 = _846 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2586 = isnan(_846);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2572 * _2550;
    float _2598 = as_type<float>(_2283) * _2568;
    bool _2600 = !_2580;
    int _2602 = _2600 ? 0 : (-1);
    float _2604 = fma(_2514, _2582, -0.5);
    int _2606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2608 = _2606 != 0;
    float _2610 = -_1134;
    float _2612 = fma(_1162, _2578, _2610);
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2616 = _2614 != 0;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2620 = _846 + _2618;
    bool _2622 = _846 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2624 = isnan(_846);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2594;
    float _2636 = _2634 + 1.0;
    int _2638 = ~_2552;
    int _2640 = _2638 + _2602;
    int _2642 = _2640 + 1;
    float _2644 = trunc(_2598);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = fma(_2596, _2620, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2652 = _2632 * _2636;
    float _2654 = -_2632;
    float _2656 = _2654 + 1.0;
    int _2658 = _952 * _2642;
    int _2660 = _2658 + _2444;
    float _2662 = -_1166;
    float _2664 = fma(_1164, _2604, _2662);
    float _2666 = _2650 * _2652;
    int _2668 = _2566;
    int _2670 = _2660;
    if (_2608)
    {
        float _2672 = -_2428;
        float _2674 = _2672 + 1.0;
        _2668 = as_type<int>(_2674);
    }
    int _2676 = _2668;
    float _2678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2680 = !_2356;
    int _2682 = _2680 ? _2660 : (-1);
    float _2684 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2666);
    if (!_2608)
    {
        _1170 = _2428;
    }
    float _2686 = _1170;
    float _2688 = _2686;
    if (_2616)
    {
        float _2690 = -_2428;
        float _2692 = _2690 + 1.0;
        _2670 = as_type<int>(_2692);
    }
    int _2694 = _2670;
    int _2696 = _2682 >> 31;
    float _2698 = _2612 + 0.5;
    if (_2608)
    {
        float _2700 = _2452 ? as_type<float>(_2676) : _2428;
        _2688 = _2700;
    }
    float _2702 = _2688;
    float _2704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2706 = _2696 & 3;
    int _2708 = int(_2492) + int(_2648);
    float _2710 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2684);
    int _2712 = _2682 + _2706;
    float _2714 = _2678 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2716 = _2712 >> 2;
    if (_2616)
    {
        float _2718 = _2263 ? as_type<float>(_2694) : _2428;
        _2478 = _2718;
    }
    float _2720 = _2478;
    float _2722 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2724 = _2716 << 4;
    int _2726 = _2724 + 368;
    float _2728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2730 = ~_952;
    int _2732 = _2730 + 1;
    float _2734 = fma(_2714, _2720, -0.5);
    uint _2736 = uint(int(uint(_2726) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    float _2752 = fma(_1160, _2722, _1152);
    int _2754 = _2682 & 3;
    bool _2756 = _2754 != 0;
    float _2758 = fma(_1154, _2734, _1148);
    int _2760 = _2682 & 3;
    bool _2762 = _2760 != 0;
    int _2764 = _2732 * _2708;
    int _2766 = _2764 + _2420;
    float _2768 = _2702 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2770 = _826 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2772 = _2726 + 8;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    uint _2776 = uint(int(uint(int(_2774)) >> uint(2)));
    int _2778 = int(_2774) & 3;
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[int(_2776)][_2778];
    int _2782 = int(_2774) + 1;
    uint _2784 = uint(int(uint(_2782) >> uint(2)));
    int _2786 = _2782 & 3;
    float _2788 = (*spvDescriptorSet0.vp_c9)._m0[int(_2784)][_2786];
    bool _2790 = uint(_2760) > 1u;
    float _2792 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2794 = uint(_2766) >= uint(_952);
    float _2796 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2798 = _2770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2800 = _2756 ? 0 : 1;
    float _2802 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2804 = !_2794;
    int _2806 = _2804 ? 0 : (-1);
    float _2808 = _2710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2810 = _2760 != 3;
    float _2812 = _2562 * _2704;
    int _2814 = ~_2708;
    int _2816 = _2814 + _2806;
    int _2818 = _2816 + 1;
    float _2820 = _2768 * _2728;
    int _2822 = ~_2800;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = _2752 + 0.5;
    int _2830 = _2826;
    if (!_2790)
    {
        int _2832 = ~_2800;
        int _2834 = _2832 + 1;
        _2830 = _2834;
    }
    int _2836 = _2830;
    int _2838 = _952 * _2818;
    int _2840 = _2838 + _2420;
    bool _2842 = uint(_2760) >= 2u;
    out.m_65.x = _2796;
    out.m_65.y = _2802;
    out.m_65.z = _2798;
    out.m_65.w = _2808;
    bool _2844 = !_2762;
    int _2846 = _2844 ? 0 : 1;
    float _2848 = _2758 + 0.5;
    int _2850 = abs(_2836);
    out.m_67.x = _2828;
    out.m_67.y = _2698;
    out.m_67.z = _2820;
    out.m_67.w = _2812;
    int _2852 = _2842 ? 0 : 1;
    bool _2854 = _2760 != 3;
    float _2856 = _2664 + 0.5;
    int _2858 = ~_2852;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    int _2864 = _2862;
    if (_2810)
    {
        int _2866 = ~_2852;
        int _2868 = _2866 + 1;
        _2864 = _2868;
    }
    int _2870 = _2864;
    out.m_69.x = _2848;
    out.m_69.y = _2856;
    int _2872 = abs(_2846);
    bool _2874 = !_2854;
    int _2876 = _2874 ? 0 : (-1);
    int _2878 = ~_2850;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    int _2884 = abs(_2876);
    int _2886 = abs(_2870);
    int _2888 = _2882 * as_type<int>(_2750);
    int _2890 = ~_2872;
    int _2892 = _2890 + 1;
    int _2894 = _2892 + 1;
    bool _2896 = !_2576;
    int _2898 = _2896 ? 0 : 1;
    int _2900 = _2894 * as_type<int>(_2742);
    int _2902 = _2900 + _2888;
    int _2904 = ~_2886;
    int _2906 = _2904 + 1;
    int _2908 = _2906 + 1;
    int _2910 = abs(_2898);
    int _2912 = ~_2884;
    int _2914 = _2912 + 1;
    int _2916 = _2914 + 1;
    int _2918 = _2908 * as_type<int>(_2780);
    int _2920 = _2918 + _2902;
    int _2922 = ~_2910;
    int _2924 = _2922 + 1;
    int _2926 = _2924 + 1;
    float _2928 = _1838 * _1900;
    int _2930 = _2916 * as_type<int>(_2788);
    int _2932 = _2930 + _2920;
    bool _2934 = !_2356;
    int _2936 = _2934 ? _2840 : (-1);
    float _2938 = _2928 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2940 = _1838 > 0.0;
    bool _2942 = isnan(_1838);
    bool _2944 = _2940 || _2942;
    bool _2946 = isnan(0.0);
    bool _2948 = _2944 || _2946;
    int _2950 = _2932 * _2926;
    bool _2952 = _1900 <= 0.0;
    bool _2954 = !_2948;
    bool _2956 = _2952 || _2954;
    int _2958 = _2936 * _2910;
    int _2960 = _2958 + _2950;
    float _2962 = _2281 + _2156;
    float _2964 = _2938 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2966 = _2962 * 0.5;
    float _2968 = float(_2960);
    float _2970 = _2300 * _2218;
    float _2972 = -_2300;
    float _2974 = _2972 + 1.0;
    out.m_49.x = _2964;
    float _2976 = _2229 * _2970;
    float _2978 = _2239 * _2970;
    out.m_71.z = _2966;
    out.m_71.w = _2156;
    float _2980 = fma(_2235, _2976, _2223);
    float _2982 = fma(_2237, _2976, _2225);
    float _2984 = _2229 * _2974;
    float _2986 = fma(_2229, _2978, _2227);
    out.m_73.x = _2968;
    out.m_75.x = _2980;
    out.m_75.y = _2982;
    out.m_75.z = _2986;
    out.m_75.w = _2984;
    if (!_2956)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _632 = false;
    bool _534 = false;
    bool _306 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3056 = as_type<float>(_118);
        out.gl_Position.z = _3056;
    }
    if (!_104)
    {
        return out;
    }
    bool _120 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_91);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = float(_96);
    bool _132 = _100 >= _130;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    if (_136)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _108;
    if (_136)
    {
        out.m_49.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_144);
        out.gl_Position.z = _3111;
    }
    if (_136)
    {
        return out;
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _130;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _178 = _156;
    float _196;
    if (!_176)
    {
        float _180 = in.m_53.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _156;
    }
    _198 = false;
    float _200 = _196;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -_216;
    float _236 = _234 + 1.0;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _238;
    float _242 = 1.0 / _220;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _246 = _232 * _236;
    float _248 = -_232;
    float _250 = _248 + 1.0;
    float _252 = _204 * _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = fma(_240, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = fma(_256, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _258 * _246;
    float _270 = _266 * _246;
    float _272 = _264 * _246;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].x, _268);
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].y, _270);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _280 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _276);
    float _284 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _278);
    bool _286 = !_244;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _156;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_55.x;
    float _312 = in.m_55.y;
    float _314 = in.m_55.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _318 = _308 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _308 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _336 = 1.0 / _326;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _340 = 1.0 / _334;
    float _342 = _282 * _312;
    bool _344 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _284 * _314;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = _308 + _358;
    float _362 = 1.0 / _330;
    float _364 = _318 * _336;
    bool _366 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _368 = isnan(_308);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_354;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = _280 * _310;
    float _388 = _376 * _380;
    float _390 = _322 * _340;
    bool _392 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _394 = isnan(_308);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -_376;
    float _406 = _404 + 1.0;
    bool _408 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _410 = isnan(_308);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = _402 * _406;
    float _430 = _360 * _362;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _436;
    float _440 = _418 * _426;
    float _442 = fma(_384, _430, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _444 = fma(_434, _430, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _446 = fma(_438, _430, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _452 = -_418;
    float _454 = _452 + 1.0;
    float _456 = _444 * _440;
    float _458 = _446 * _440;
    float _460 = _442 * _440;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].y, _458);
    float _468 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].x, _456);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _470;
    float _474 = fma(_422, _390, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _476 = fma(_450, _390, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _478 = fma(_464, _390, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _480 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].z, _460);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _486;
    float _490 = fma(_474, _428, _468);
    float _492 = fma(_472, _364, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _494 = fma(_484, _364, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _496 = fma(_488, _364, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _498 = fma(_476, _428, _466);
    float _500 = fma(_478, _428, _480);
    float _502 = fma(_494, _388, _490);
    float _504 = fma(_492, _388, _498);
    float _506 = fma(_496, _388, _500);
    float _508 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].x, _502);
    float _510 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].y, _504);
    float _512 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].z, _506);
    bool _514 = !_338;
    float _532;
    if (!_514)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        _532 = _156;
    }
    _534 = false;
    float _536 = _532;
    bool _538 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_536);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _556 = isnan(_536);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _572 = _536 + _570;
    float _574 = -_548;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _580 = 1.0 / _552;
    float _582 = _564 * _576;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = _568 * _580;
    float _590 = _512 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = fma(_588, _572, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = _510 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = _592 * _582;
    float _600 = _508 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[115].x, _598);
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[116].x, _604);
    float _610 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _606;
    out.m_57.y = _602;
    out.m_57.z = _596;
    out.m_57.w = _610;
    bool _612 = !_578;
    float _630;
    if (!_612)
    {
        float _614 = in.m_53.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        _630 = _156;
    }
    _632 = false;
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _638 = _634 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _642 = _634 + _640;
    bool _644 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _646 = isnan(_634);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _670 = _634 + _668;
    float _672 = 1.0 / _666;
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _676 = 1.0 / _662;
    bool _678 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _680 = isnan(_634);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _658;
    float _692 = _642 * _672;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    bool _698 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _700 = isnan(_634);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _688 * _696;
    float _712 = -_688;
    float _714 = _712 + 1.0;
    float _716 = _638 * _676;
    bool _718 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _720 = isnan(_634);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _738 = -_728;
    float _740 = _738 + 1.0;
    float _742 = _728 * _714;
    float _744 = _670 * _690;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _750;
    float _754 = _708 * _740;
    float _756 = fma(_732, _744, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _758 = fma(_748, _744, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _760 = fma(_752, _744, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _766 = -_708;
    float _768 = _766 + 1.0;
    float _770 = _758 * _754;
    float _772 = _760 * _754;
    float _774 = _756 * _754;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _780 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].x, _770);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _782;
    float _786 = fma(_736, _716, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _788 = fma(_764, _716, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].y, _772);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _792;
    float _796 = fma(_778, _716, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _798 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].z, _774);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _800;
    float _804 = fma(_786, _742, _780);
    float _806 = fma(_784, _692, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _808 = fma(_794, _692, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _810 = fma(_788, _742, _790);
    float _812 = fma(_802, _692, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _814 = fma(_796, _742, _798);
    float _816 = fma(_806, _710, _804);
    float _818 = fma(_808, _710, _810);
    float _820 = fma(_812, _710, _814);
    float _822 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].x, _816);
    float _824 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].y, _818);
    float _826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].z, _820);
    bool _828 = !_674;
    if (!_828)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _178 = _844;
    }
    float _846 = _178;
    float _848 = in.m_53.z;
    float _850 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _852 = log2(_850);
    float _854 = in.m_53.y;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _858 = _856 != 0;
    float _860 = in.m_53.x;
    float _862 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _864 = int(_862);
    float _866 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _868 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _870 = precise::max(_866, _868);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _874 = _870 >= 16.0;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _878 = _848 * 2.0;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _882 = floor(_878);
    float _884 = _854 * 2.0;
    float _886 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _890 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _892 = _860 * 2.0;
    float _894 = fma(_886, -2.0, _876);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _898 = floor(_884);
    float _900 = _860 + _854;
    float _902 = -_872;
    float _904 = fma(_890, 2.0, _902);
    float _906 = _860 + _848;
    float _908 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].w, _896);
    float _910 = _900 + (-1.0);
    float _912 = _906 + (-1.0);
    bool _914 = _882 >= 0.0;
    bool _916 = isnan(_882);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _926 = floor(_892);
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _938 = _936 != 0;
    float _940 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _942 = _922 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _944 = _898 > 0.0;
    bool _946 = !_934;
    int _948 = _946 ? 0 : 1;
    float _950 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _952 = int(_950);
    bool _954 = _882 > 0.0;
    int _956 = ~as_type<int>(_942);
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    bool _962 = _898 >= 0.0;
    bool _964 = isnan(_898);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = !_930;
    int _974 = _972 ? 0 : 1;
    bool _976 = !_938;
    int _978 = _976 ? 0 : 1;
    int _980 = _970 ? 0 : 1;
    float _982 = _912;
    int _984 = _960;
    float _986 = _942;
    float _988 = _848;
    if (_858)
    {
        _982 = _854;
    }
    float _990 = _982;
    float _992 = _990;
    if (!_954)
    {
        int _994 = ~as_type<int>(_942);
        int _996 = _994 + 1;
        _984 = _996;
    }
    int _998 = _984;
    if (_858)
    {
        _986 = _860;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (!_858)
    {
        _1002 = _848;
    }
    float _1004 = _1002;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1016 = _1014 != 0;
    bool _1018 = _926 >= 0.0;
    bool _1020 = isnan(_926);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    float _1028 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_858)
    {
        _992 = _860;
    }
    float _1030 = _992;
    bool _1032 = !_1008;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = -_880;
    float _1038 = fma(_1028, 2.0, _1036);
    bool _1040 = _926 > 0.0;
    int _1042 = ~_980;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    int _1048 = _1046;
    if (!_944)
    {
        int _1050 = ~_980;
        int _1052 = _1050 + 1;
        _1048 = _1052;
    }
    int _1054 = _1048;
    float _1056 = _852 * _100;
    int _1058 = abs(_1034);
    float _1060 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1062 = _1026 ? 0 : 1;
    float _1064 = float(_998);
    float _1066 = exp2(_1056);
    float _1068 = float(_1058);
    float _1070 = fma(_1060, -2.0, _888);
    float _1072 = float(_864);
    float _1074 = _1068 * _1064;
    int _1076 = ~_1062;
    int _1078 = _1076 + 1;
    int _1080 = _1078 + 1;
    float _1082 = 1.0 / _1072;
    int _1084 = _1080;
    if (!_1040)
    {
        int _1086 = ~_1062;
        int _1088 = _1086 + 1;
        _1084 = _1088;
    }
    int _1090 = _1084;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1094 = 1.0 + _1092;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1098 = 1.0 / _1094;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1102 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1104 = isnan(1.0);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1110 = _1106 || _1108;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1114 = !_1016;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1100);
    float _1120 = -_1066;
    float _1122 = _1120 + 1.0;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _894);
    int _1136 = abs(_1116);
    float _1138 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1112);
    float _1140 = float(_952);
    float _1142 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1144 = _1132 ? _1122 : 0.0;
    float _1146 = -_100;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1038);
    float _1150 = -_100;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[76].x, _904);
    float _1154 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1118);
    float _1156 = _1140 * _100;
    float _1158 = _1082 * _100;
    float _1160 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1138);
    float _1162 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1142);
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _908);
    float _1166 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1070);
    bool _1168 = _1110;
    float _1170 = _1162;
    if (_1110)
    {
        float _1172 = _1144 * _1098;
        _110 = _1172;
    }
    float _1174 = _110;
    float _1176 = _1074 * (-2.0);
    float _1178 = float(_1136);
    float _1180 = _860 + (-0.5);
    float _1182 = float(_1054);
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1186 = fma(_924, _1176, _924);
    bool _1188 = !_1012;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1194 = _1178 * _1182;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1198 = _874 ? _1184 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1200 = fma(_1186, _1174, _1192);
    int _1202 = abs(_1190);
    float _1204 = _854 + _848;
    float _1206 = _874 ? _1196 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1208 = _1200 * 0.15915493667125701904296875;
    float _1210 = abs(_1198);
    bool _1212 = _1210 != 0.0;
    bool _1214 = isnan(_1210);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = _1204 + (-1.0);
    float _1224 = float(_1202);
    float _1226 = _1194 * (-2.0);
    float _1228 = float(_1090);
    float _1230 = _1208 * 6.283185482025146484375;
    float _1232 = sin(_1230);
    float _1234 = abs(_1206);
    bool _1236 = _1234 == 0.0;
    bool _1238 = !_1220;
    bool _1240 = _1236 && _1238;
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = _1224 * _1228;
    float _1250 = abs(_1206);
    bool _1252 = _1250 == 0.0;
    float _1254 = fma(_940, _1226, _940);
    float _1256 = _854 + (-0.5);
    float _1258 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1260 = _1248 * (-2.0);
    float _1262 = _848 + (-0.5);
    float _1264 = _1208 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = fma(_1258, _1260, _1258);
    float _1270 = _1174;
    int _1272 = as_type<int>(_1268);
    if (_1240)
    {
        bool _1274 = as_type<int>(_1206) >= 0;
        _1168 = _1274;
    }
    bool _1276 = _1168;
    float _1278 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1282 = 0;
    int _1284 = _1276 ? (-1) : 0;
    if (_1240)
    {
        int _1286 = _1276 ? 0 : 1078530011;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = fma(_1268, _1174, _1278);
    float _1292 = fma(_1254, _1174, _1280);
    if (_1240)
    {
        int _1294 = int(0x80000000) & as_type<int>(_1198);
        int _1296 = _1288 | _1294;
        _1270 = as_type<float>(_1296);
    }
    float _1298 = _1270;
    bool _1300 = !_1220;
    bool _1302 = _1300 && _1252;
    float _1304 = _1298;
    float _1306 = _1298;
    if (!_1302)
    {
        float _1308 = abs(_1198);
        bool _1310 = _1308 != as_type<float>(0x7f800000u /* inf */);
        bool _1312 = isnan(_1308);
        bool _1314 = _1310 || _1312;
        bool _1316 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1318 = _1314 || _1316;
        float _1320 = abs(_1206);
        bool _1322 = _1320 == as_type<float>(0x7f800000u /* inf */);
        float _1324 = abs(_1206);
        bool _1326 = _1324 == as_type<float>(0x7f800000u /* inf */);
        bool _1328 = !_1318;
        bool _1330 = _1326 && _1328;
        if (_1330)
        {
            bool _1332 = as_type<int>(_1206) >= 0;
            _1284 = _1332 ? (-1) : 0;
        }
        int _1334 = _1284;
        if (_1330)
        {
            _1272 = 1075235812;
        }
        int _1336 = _1272;
        int _1338 = _1336;
        if (_1330)
        {
            int _1340 = ~_1334;
            int _1342 = (_1340 != 0) ? _1336 : 1061752795;
            _1338 = _1342;
        }
        int _1344 = _1338;
        if (_1330)
        {
            int _1346 = int(0x80000000) & as_type<int>(_1198);
            int _1348 = _1344 | _1346;
            _1304 = as_type<float>(_1348);
        }
        float _1350 = _1304;
        bool _1352 = !_1318;
        bool _1354 = _1352 && _1322;
        _1306 = _1350;
        if (!_1354)
        {
            float _1356 = abs(_1198);
            float _1358 = abs(_1206);
            float _1360 = precise::max(_1356, _1358);
            float _1362 = abs(_1198);
            float _1364 = abs(_1206);
            float _1366 = precise::min(_1362, _1364);
            float _1368 = 1.0 / _1360;
            float _1370 = abs(_1198);
            float _1372 = abs(_1206);
            bool _1374 = _1370 > _1372;
            bool _1376 = as_type<int>(_1206) >= 0;
            float _1378 = abs(_1198);
            float _1380 = abs(_1206);
            float _1382 = _1378 + _1380;
            int _1384 = as_type<int>(_1198) & int(0x80000000);
            bool _1386 = _1382 > as_type<float>(0x7f800000u /* inf */);
            bool _1388 = isnan(_1382);
            bool _1390 = _1386 || _1388;
            bool _1392 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1394 = _1390 || _1392;
            float _1396 = _1366 * _1368;
            float _1398 = _1396 * _1396;
            float _1400 = _1398 + 11.33538818359375;
            float _1402 = fma(_1398, _1400, 28.84246826171875);
            float _1404 = fma(_1398, _1402, 19.6966705322265625);
            float _1406 = fma(_1398, -0.82336294651031494140625, -5.674867153167724609375);
            float _1408 = fma(_1398, _1406, -6.565555095672607421875);
            float _1410 = 1.0 / _1404;
            float _1412 = _1398 * _1408;
            float _1414 = _1396 * _1412;
            float _1416 = fma(_1414, _1410, _1396);
            float _1418 = _1416;
            _1306 = _1382;
            if (_1374)
            {
                float _1420 = -_1416;
                float _1422 = _1420 + 1.57079637050628662109375;
                _1418 = _1422;
            }
            float _1424 = _1418;
            int _1426 = as_type<int>(_1424);
            if (!_1376)
            {
                float _1428 = -_1424;
                float _1430 = _1428 + 3.1415927410125732421875;
                _1426 = as_type<int>(_1430);
            }
            int _1432 = _1426;
            if (!_1394)
            {
                int _1434 = _1384 | _1432;
                _1306 = as_type<float>(_1434);
            }
        }
    }
    float _1436 = _1306;
    float _1438 = _1290 + _1436;
    float _1440 = _1292 * 0.15915493667125701904296875;
    float _1442 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1444 = _1438 * 0.15915493667125701904296875;
    float _1446 = _1440 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = in.m_42.x;
    float _1452 = in.m_42.y;
    float _1454 = in.m_42.z;
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1462 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1464 = _1456 * _1442;
    float _1466 = _1444 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1460 * _1462;
    float _1472 = _1444 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1448 * _1464;
    float _1478 = _1232 * _1476;
    float _1480 = _1266 * _1476;
    float _1482 = _1440 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = _1266 * _1468;
    float _1488 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1490 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1488);
    float _1492 = _1232 * _1474;
    float _1494 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1496 = _1232 * _1468;
    float _1498 = _1468 * _1448;
    float _1500 = _1474 * _1448;
    float _1502 = _1458 * _1494;
    float _1504 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1506 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1508 = -_1486;
    float _1510 = fma(_1484, _1492, _1508);
    float _1512 = -_1464;
    float _1514 = _1484 * _1512;
    float _1516 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1504);
    float _1518 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1506);
    float _1520 = fma(_1510, _1470, _1478);
    float _1522 = _1266 * _1474;
    float _1524 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1516);
    float _1526 = fma(_1500, _1470, _1514);
    float _1528 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    float _1530 = fma(_1484, _1496, _1522);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1534 = fma(_1498, _1502, _1526);
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1538 = fma(_1530, _1502, _1520);
    float _1540 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1518);
    float _1542 = fma(_1484, _1522, _1496);
    float _1544 = _1536 + _1534;
    float _1546 = _1532 + _1538;
    float _1548 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1550 = -_1492;
    float _1552 = fma(_1484, _1486, _1550);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1556 = _1544 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1560 = _1546 + _1558;
    float _1562 = fma(_1542, _1470, _1480);
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = _1560 * _1560;
    float _1568 = fma(_1552, _1502, _1562);
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1572 = fma(_1556, _1556, _1566);
    float _1574 = _1548 + _1568;
    float _1576 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1570);
    float _1578 = sqrt(_1572);
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1570;
    float _1584 = _1492;
    float _1586 = _1546;
    float _1588 = _1578;
    if (!_1580)
    {
        _1582 = _1544;
    }
    float _1590 = _1582;
    float _1592 = _1590;
    if (!_1580)
    {
        _1584 = _1574;
    }
    float _1594 = _1584;
    bool _1596 = !_1580;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1604 = _1578 + _1602;
        float _1606 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = rsqrt(_1572);
        float _1610 = _1604 * _1600;
        float _1612 = _1610 * 0.15915493667125701904296875;
        float _1614 = _1612 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        float _1622 = fma(_1616, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1624 = _1608 * _1622;
        float _1626 = _1620 + (-1.0);
        float _1628 = fma(_1556, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1630 = fma(_1560, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1632 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = fma(_1574, _1620, _1632);
        _1598 = _1634;
        _1592 = _1628;
        _1586 = _1630;
    }
    float _1636 = _1598;
    float _1638 = _1592;
    float _1640 = _1586;
    float _1642 = -_1548;
    float _1644 = _1642 + _1636;
    float _1646 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1648 = -_1536;
    float _1650 = _1648 + _1638;
    float _1652 = -_1532;
    float _1654 = _1652 + _1640;
    float _1656 = _1644 * _1644;
    float _1658 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1660 = 1.0 / _1646;
    float _1662 = fma(_1650, _1650, _1656);
    bool _1664 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1666 = isnan(0.5);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1672 = _1668 || _1670;
    float _1674 = fma(_1654, _1654, _1662);
    float _1676 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1658);
    float _1678 = sqrt(_1674);
    float _1680 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1676);
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1684 = _1682 + _1646;
    float _1686 = _1684 * _1660;
    float _1688 = _1686 * 0.5;
    bool _1690 = _1678 > 0.0;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1694 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1692);
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1698 = _1678;
    float _1700 = _1636;
    float _1702 = _1638;
    float _1704 = _1640;
    float _1706 = _1654;
    float _1708 = _1674;
    if (_1672)
    {
        _1696 = 1.0;
    }
    float _1710 = _1696;
    float _1712 = 1.0 / _1694;
    bool _1714 = !_1690;
    float _1716 = _1710;
    if (!_1714)
    {
        float _1718 = _170 * _170;
        float _1720 = fma(_172, _172, _1718);
        float _1722 = fma(_174, _174, _1720);
        float _1724 = rsqrt(_1674);
        float _1726 = sqrt(_1722);
        float _1728 = _1650 * _1724;
        float _1730 = _1644 * _1724;
        float _1732 = _1654 * _1724;
        bool _1734 = _1726 > 0.0;
        bool _1736 = !_1734;
        _1698 = _1724;
        if (!_1736)
        {
            float _1738 = rsqrt(_1722);
            float _1740 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1742 = _170 * _1738;
            float _1744 = _172 * _1738;
            float _1746 = _1730 * _1742;
            float _1748 = _174 * _1738;
            float _1750 = fma(_1728, _1744, _1746);
            float _1752 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1754 = fma(_1732, _1748, _1750);
            float _1756 = _1754 * _1752;
            float _1758 = fma(_172, _1756, _1638);
            float _1760 = fma(_170, _1756, _1636);
            float _1762 = fma(_174, _1756, _1640);
            _1698 = _1756;
            _1700 = _1760;
            _1702 = _1758;
            _1704 = _1762;
            _1706 = _1750;
        }
    }
    float _1764 = _1698;
    float _1766 = _1700;
    float _1768 = _1702;
    float _1770 = _1704;
    float _1772 = _1706;
    float _1774 = _1772;
    float _1776 = _1764;
    if (_1672)
    {
        _1708 = 1.0;
    }
    float _1778 = _1708;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1782 = _1712 * _1780;
    float _1784 = _1778;
    if (!_1672)
    {
        float _1786 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1788 = _1786 * 0.15915493667125701904296875;
        float _1790 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1792 = _1788 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        float _1796 = _1790 * 0.15915493667125701904296875;
        float _1798 = _1788 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = 1.0 / _1794;
        float _1804 = _1796 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = _1800 * _1802;
        float _1810 = _1796 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = _1806 * _1808;
        float _1816 = 1.0 / _1814;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1820 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1818;
        float _1822 = 1.0 / _1820;
        float _1824 = _1812 * _1816;
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = fma(_1782, _1824, _1826);
        float _1830 = _1828 * _1822;
        float _1832 = precise::clamp(_1830, 0.0, 1.0);
        _1774 = _1796;
        _1776 = _1802;
        _1716 = _1832;
    }
    float _1834 = _1774;
    float _1836 = _1776;
    float _1838 = _1716;
    float _1840 = _1834;
    float _1842 = _1836;
    if (!_1672)
    {
        float _1844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1846 = _1844 * 0.15915493667125701904296875;
        float _1848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1850 = _1846 * 6.283185482025146484375;
        float _1852 = cos(_1850);
        float _1854 = _1848 * 0.15915493667125701904296875;
        float _1856 = _1846 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        float _1860 = 1.0 / _1852;
        float _1862 = _1854 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = _1858 * _1860;
        float _1868 = _1854 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1864 * _1866;
        float _1874 = 1.0 / _1872;
        float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1878 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1876;
        float _1880 = 1.0 / _1878;
        float _1882 = _1870 * _1874;
        float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1886 = fma(_1782, _1882, _1884);
        float _1888 = _1886 * _1880;
        float _1890 = precise::clamp(_1888, 0.0, 1.0);
        float _1892 = -_1890;
        float _1894 = _1892 + 1.0;
        _1840 = _1872;
        _1842 = _1846;
        _1784 = _1894;
    }
    float _1896 = _1840;
    float _1898 = _1842;
    float _1900 = _1784;
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1904 = _1766 + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1908 = _1768 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1770 + _1910;
    float _1914 = _1904 * _1904;
    float _1916 = fma(_1908, _1908, _1914);
    float _1918 = fma(_1912, _1912, _1916);
    float _1920 = rsqrt(_1918);
    float _1922 = sqrt(_1918);
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1926 = _1908 * _1924;
    float _1928 = _1912 * _1924;
    float _1930 = _1926 * _1926;
    float _1932 = _1928 * _1928;
    float _1934 = _1930 + _1932;
    float _1936 = sqrt(_1934);
    bool _1938 = _1936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = _1936 + _1940;
    float _1944 = _1920;
    float _1946 = _1942;
    float _1948 = _1896;
    float _1950 = _1904;
    if (_1938)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = _1954;
    if (_1938)
    {
        float _1958 = _1942 * _1954;
        _1946 = _1958;
    }
    float _1960 = _1946;
    if (_1938)
    {
        float _1962 = rsqrt(_1934);
        _1956 = _1962;
    }
    float _1964 = _1956;
    float _1966 = _1964;
    if (_1938)
    {
        float _1968 = _1960 * 0.15915493667125701904296875;
        _1948 = _1968;
    }
    float _1970 = _1948;
    float _1972 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1974 = _1912;
    float _1976 = _1970;
    if (_1938)
    {
        float _1978 = _1970 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = precise::max(0.0, _1972);
    float _1986 = _1898;
    float _1988 = _1984;
    if (_1938)
    {
        float _1990 = _1970 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        _1986 = _1992;
    }
    float _1994 = _1986;
    float _1996 = -_1924;
    float _1998 = -_1984;
    float _2000 = fma(_1904, _1996, _1998);
    if (_1938)
    {
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _2002;
    }
    float _2004 = _1950;
    float _2006 = _1982;
    float _2008 = _2004;
    if (_1938)
    {
        float _2010 = fma(_1982, _2004, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2006 = _2010;
    }
    float _2012 = _2006;
    float _2014 = _2012;
    if (!_1938)
    {
        _2008 = _2000;
    }
    float _2016 = _2008;
    float _2018 = _2016;
    if (_1938)
    {
        float _2020 = _1964 * _2012;
        _1588 = _2020;
    }
    float _2022 = _1588;
    if (!_1938)
    {
        _1966 = _1926;
    }
    float _2024 = _1966;
    float _2026 = _2024;
    float _2028 = _1994;
    if (_1938)
    {
        float _2030 = _1994 + (-1.0);
        _1988 = _2030;
    }
    float _2032 = _1988;
    float _2034 = _2032;
    if (_1938)
    {
        float _2036 = _1926 * _2022;
        _2026 = _2036;
    }
    float _2038 = _2026;
    if (!_1938)
    {
        _2014 = _1928;
    }
    float _2040 = _2014;
    float _2042 = _2040;
    if (_1938)
    {
        float _2044 = _1928 * _2022;
        _2042 = _2044;
    }
    float _2046 = _2042;
    if (_1938)
    {
        float _2048 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1976 = _2048;
    }
    float _2050 = _1976;
    if (!_1938)
    {
        _2034 = _1930;
    }
    float _2052 = _2034;
    float _2054 = _2052;
    if (_1938)
    {
        float _2056 = _2038 * _2038;
        _2054 = _2056;
    }
    float _2058 = _2054;
    if (_1938)
    {
        float _2060 = fma(_2000, _1994, _2050);
        _2018 = _2060;
    }
    float _2062 = _2018;
    if (!_1938)
    {
        _2028 = _1932;
    }
    float _2064 = _2028;
    float _2066 = _2064;
    if (_1938)
    {
        float _2068 = _2046 * _2046;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2074 = fma(_2062, _2062, _2058);
    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2078 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2076);
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    float _2082 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2084 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2072);
    float _2086 = _2074 + _2070;
    float _2088 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2090 = -_2080;
    float _2092 = _2090 + 1.0;
    float _2094 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2084);
    float _2096 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2088);
    float _2100 = rsqrt(_2086);
    float _2102 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2104 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2106 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2112 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2104);
    float _2114 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = abs(_2092);
    float _2118 = log2(_2116);
    float _2120 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2122 = -_2110;
    float _2124 = fma(_2122, _2082, 1.0);
    float _2126 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2112);
    float _2128 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = _2100 * _2038;
    float _2136 = _2100 * _2062;
    float _2138 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2140 = _2100 * _2046;
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = log2(_2124);
    float _2146 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2138);
    float _2148 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2146);
    float _2158 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2148);
    float _2160 = -_2140;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2166 = 1.0 / _2156;
    float _2168 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2158);
    float _2170 = fma(_2162, -0.5, 0.5);
    float _2172 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2174 = fma(_2162, 0.5, 0.5);
    float _2176 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2168);
    float _2178 = _2136 + 1.0;
    float _2180 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2172);
    float _2182 = exp2(_2154);
    float _2184 = fma(_2174, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2186 = _2144 * 0.693147182464599609375;
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2180);
    float _2190 = fma(_2174, _2184, -0.212114393711090087890625);
    float _2192 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = sqrt(_2170);
    float _2196 = _2176 * _2166;
    float _2198 = _2188 * _2166;
    float _2200 = fma(_2174, _2190, 1.570728778839111328125);
    float _2202 = fma(_2196, 0.5, 0.5);
    float _2204 = fma(_2198, -0.5, 0.5);
    float _2206 = -_2136;
    float _2208 = fma(_2182, _2178, _2206);
    float _2210 = fma(_2208, 0.5, 0.5);
    float _2212 = _2194 * 0.636619746685028076171875;
    float _2214 = -_2200;
    float _2216 = fma(_2212, _2214, 1.0);
    float3 _6370 = float3(_2202, _2204, _2192);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6370, float3(0.0), isnan(_6370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6370, float3(0.0), isnan(_6370)), level(0.0)).x;
    float3 _6381 = float3(_2202, _2204, _2192);
    float4 _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6381, float3(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6381, float3(0.0), isnan(_6381)), level(0.0)).xyzw;
    float _2223 = _2221.x;
    float _2225 = _2221.y;
    float _2227 = _2221.z;
    float _2229 = _2221.w;
    float2 _6398 = float2(_2216, _2210);
    float3 _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6398, float2(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6398, float2(0.0), isnan(_6398)), level(0.0)).xyz;
    float _2235 = _2233.x;
    float _2237 = _2233.y;
    float _2239 = _2233.z;
    float _2241 = float(uint(_952));
    float _2243 = trunc(_1158);
    int _2245 = int(_2243);
    int _2247 = ~_952;
    int _2249 = _2247 + 1;
    float _2251 = _1156 * _152;
    int _2253 = ~_952;
    int _2255 = _2253 + 1;
    float _2257 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2259 = _952 + (-1);
    float _2261 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2263 = _854 > 0.5;
    float _2265 = 1.0 / _2241;
    float _2267 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2269 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2267);
    float _2271 = float(uint(_2245));
    float _2273 = trunc(_2251);
    int _2275 = int(_2273);
    float _2277 = float(_2245);
    float _2279 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2281 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2279);
    int _2283 = as_type<int>(_2265) + (-2);
    float _2285 = exp2(_2261);
    out.gl_Position.x = _2176;
    out.gl_Position.y = _2188;
    out.gl_Position.z = _2281;
    out.gl_Position.w = _2156;
    float _2287 = as_type<float>(_2283) * _2271;
    float _2289 = trunc(_2287);
    float _2291 = precise::max(_2289, 0.0);
    uint _2294 = uint(_2291);
    float _2296 = -_2285;
    float _2298 = _2296 + 1.0;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2302 = _2249 * int(_2294);
    int _2304 = _2302 + _2245;
    float _2306 = float(uint(_2304));
    float _2308 = as_type<float>(_2283) * _2306;
    float _2310 = trunc(_2308);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    bool _2316 = !_858;
    float _2318 = _2316 ? 7.345489978790283203125 : 1.0;
    float _2320 = _2318 * _860;
    float _2322 = floor(_2320);
    int _2324 = int(_2294) + int(_2314);
    bool _2326 = _2277 >= _1140;
    bool _2328 = isnan(_2277);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(_1140);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    int _2338 = _2255 * _2324;
    int _2340 = _2338 + _2245;
    float _2342 = trunc(_2336);
    int _2344 = int(_2342);
    bool _2346 = uint(_2340) >= uint(_952);
    float _2348 = -_2322;
    float _2350 = _2320 + _2348;
    bool _2352 = !_2346;
    int _2354 = _2352 ? 0 : (-1);
    bool _2356 = _952 == 0;
    int _2358 = ~_2324;
    int _2360 = _2358 + _2354;
    int _2362 = _2360 + 1;
    float _2364 = _2350 * _1140;
    int _2366 = _952 * _2362;
    int _2368 = _2366 + _2245;
    int _2370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2372 = _2370 != 0;
    float _2374 = trunc(_2364);
    int _2376 = int(_2374);
    int _2378 = ~_2344;
    int _2380 = _2378 + 1;
    int _2382 = _2380 + 1;
    bool _2384 = !_2356;
    int _2386 = _2384 ? _2368 : (-1);
    bool _2388 = !_2372;
    int _2390 = _2388 ? 0 : 1;
    int _2392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2394 = _2392 != 0;
    int _2396 = _2386 * _2382;
    int _2398 = abs(_948);
    int _2400 = abs(_2390);
    int _2402 = _2344 * _2259;
    int _2404 = _2402 + _2396;
    int _2406 = abs(_974);
    int _2408 = _2404 * _2398;
    bool _2410 = !_2394;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = in.m_53.w;
    int _2416 = abs(_978);
    int _2418 = _2376 * _2400;
    int _2420 = _2418 + _2245;
    int _2422 = abs(_2412);
    int _2424 = _2275 * _2406;
    int _2426 = _2424 + _2408;
    float _2428 = in.m_61.x;
    float _2430 = float(uint(_2420));
    int _2432 = _2420 * _2416;
    int _2434 = _2432 + _2426;
    float _2436 = in.m_61.y;
    int _2438 = ~_952;
    int _2440 = _2438 + 1;
    int _2442 = _2376 * _2422;
    int _2444 = _2442 + _2434;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = float(uint(_2444));
    bool _2452 = _848 > 0.5;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2456 = _2454 != 0;
    float _2458 = as_type<float>(_2283) * _2450;
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2462 = _2460 != 0;
    float _2464 = trunc(_2458);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    int _2470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2472 = _2470 != 0;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2476 = _2472;
    float _2478 = _2428;
    if (!_2448)
    {
        _988 = _2428;
    }
    float _2480 = _988;
    float _2482 = as_type<float>(_2283) * _2430;
    int _2484 = _2440 * int(_2468);
    int _2486 = _2484 + _2444;
    float _2488 = trunc(_2482);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    float _2494 = float(uint(_2486));
    float _2496 = as_type<float>(_2283) * _2494;
    float _2498 = -_2436;
    float _2500 = _2498 + 1.0;
    float _2502 = trunc(_2496);
    float _2504 = precise::max(_2502, 0.0);
    uint _2506 = uint(_2504);
    int _2508 = _2263 ? as_type<int>(_2500) : as_type<int>(_2436);
    int _2510 = _2452 ? as_type<int>(_2500) : as_type<int>(_2436);
    float _2512 = _2462 ? as_type<float>(_2508) : _2436;
    float _2514 = _2472 ? as_type<float>(_2510) : _2436;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2520 = _2414 > 0.5;
    float _2522 = _2436;
    float _2524 = _2480;
    if (_2448)
    {
        float _2526 = -_2428;
        float _2528 = _2526 + 1.0;
        _2474 = as_type<int>(_2528);
    }
    int _2530 = _2474;
    if (_2448)
    {
        bool _2532 = _860 > 0.5;
        _2476 = _2532;
    }
    bool _2534 = _2476;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2538 = ~_952;
    int _2540 = _2538 + 1;
    if (_2456)
    {
        float _2542 = _2520 ? _2500 : _2436;
        _2522 = _2542;
    }
    float _2544 = _2522;
    if (_2448)
    {
        float _2546 = _2534 ? as_type<float>(_2530) : _2428;
        _2524 = _2546;
    }
    float _2548 = _2524;
    float _2550 = 1.0 / _2518;
    int _2552 = int(_2468) + int(_2506);
    int _2554 = _2540 * int(_2492);
    int _2556 = _2554 + _2420;
    int _2558 = ~_952;
    int _2560 = _2558 + 1;
    float _2562 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2564 = _2560 * _2552;
    int _2566 = _2564 + _2444;
    float _2568 = float(uint(_2556));
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2570;
    int _2574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2576 = _2574 != 0;
    float _2578 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2580 = uint(_2566) >= uint(_952);
    float _2582 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2584 = _846 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2586 = isnan(_846);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2572 * _2550;
    float _2598 = as_type<float>(_2283) * _2568;
    bool _2600 = !_2580;
    int _2602 = _2600 ? 0 : (-1);
    float _2604 = fma(_2514, _2582, -0.5);
    int _2606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2608 = _2606 != 0;
    float _2610 = -_1134;
    float _2612 = fma(_1162, _2578, _2610);
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2616 = _2614 != 0;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2620 = _846 + _2618;
    bool _2622 = _846 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2624 = isnan(_846);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2594;
    float _2636 = _2634 + 1.0;
    int _2638 = ~_2552;
    int _2640 = _2638 + _2602;
    int _2642 = _2640 + 1;
    float _2644 = trunc(_2598);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = fma(_2596, _2620, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2652 = _2632 * _2636;
    float _2654 = -_2632;
    float _2656 = _2654 + 1.0;
    int _2658 = _952 * _2642;
    int _2660 = _2658 + _2444;
    float _2662 = -_1166;
    float _2664 = fma(_1164, _2604, _2662);
    float _2666 = _2650 * _2652;
    int _2668 = _2566;
    int _2670 = _2660;
    if (_2608)
    {
        float _2672 = -_2428;
        float _2674 = _2672 + 1.0;
        _2668 = as_type<int>(_2674);
    }
    int _2676 = _2668;
    float _2678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2680 = !_2356;
    int _2682 = _2680 ? _2660 : (-1);
    float _2684 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2666);
    if (!_2608)
    {
        _1170 = _2428;
    }
    float _2686 = _1170;
    float _2688 = _2686;
    if (_2616)
    {
        float _2690 = -_2428;
        float _2692 = _2690 + 1.0;
        _2670 = as_type<int>(_2692);
    }
    int _2694 = _2670;
    int _2696 = _2682 >> 31;
    float _2698 = _2612 + 0.5;
    if (_2608)
    {
        float _2700 = _2452 ? as_type<float>(_2676) : _2428;
        _2688 = _2700;
    }
    float _2702 = _2688;
    float _2704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2706 = _2696 & 3;
    int _2708 = int(_2492) + int(_2648);
    float _2710 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2684);
    int _2712 = _2682 + _2706;
    float _2714 = _2678 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2716 = _2712 >> 2;
    if (_2616)
    {
        float _2718 = _2263 ? as_type<float>(_2694) : _2428;
        _2478 = _2718;
    }
    float _2720 = _2478;
    float _2722 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2724 = _2716 << 4;
    int _2726 = _2724 + 368;
    float _2728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2730 = ~_952;
    int _2732 = _2730 + 1;
    float _2734 = fma(_2714, _2720, -0.5);
    uint _2736 = uint(int(uint(_2726) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    float _2752 = fma(_1160, _2722, _1152);
    int _2754 = _2682 & 3;
    bool _2756 = _2754 != 0;
    float _2758 = fma(_1154, _2734, _1148);
    int _2760 = _2682 & 3;
    bool _2762 = _2760 != 0;
    int _2764 = _2732 * _2708;
    int _2766 = _2764 + _2420;
    float _2768 = _2702 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2770 = _826 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2772 = _2726 + 8;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    uint _2776 = uint(int(uint(int(_2774)) >> uint(2)));
    int _2778 = int(_2774) & 3;
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[int(_2776)][_2778];
    int _2782 = int(_2774) + 1;
    uint _2784 = uint(int(uint(_2782) >> uint(2)));
    int _2786 = _2782 & 3;
    float _2788 = (*spvDescriptorSet0.vp_c9)._m0[int(_2784)][_2786];
    bool _2790 = uint(_2760) > 1u;
    float _2792 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2794 = uint(_2766) >= uint(_952);
    float _2796 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2798 = _2770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2800 = _2756 ? 0 : 1;
    float _2802 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2804 = !_2794;
    int _2806 = _2804 ? 0 : (-1);
    float _2808 = _2710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2810 = _2760 != 3;
    float _2812 = _2562 * _2704;
    int _2814 = ~_2708;
    int _2816 = _2814 + _2806;
    int _2818 = _2816 + 1;
    float _2820 = _2768 * _2728;
    int _2822 = ~_2800;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = _2752 + 0.5;
    int _2830 = _2826;
    if (!_2790)
    {
        int _2832 = ~_2800;
        int _2834 = _2832 + 1;
        _2830 = _2834;
    }
    int _2836 = _2830;
    int _2838 = _952 * _2818;
    int _2840 = _2838 + _2420;
    bool _2842 = uint(_2760) >= 2u;
    out.m_65.x = _2796;
    out.m_65.y = _2802;
    out.m_65.z = _2798;
    out.m_65.w = _2808;
    bool _2844 = !_2762;
    int _2846 = _2844 ? 0 : 1;
    float _2848 = _2758 + 0.5;
    int _2850 = abs(_2836);
    out.m_67.x = _2828;
    out.m_67.y = _2698;
    out.m_67.z = _2820;
    out.m_67.w = _2812;
    int _2852 = _2842 ? 0 : 1;
    bool _2854 = _2760 != 3;
    float _2856 = _2664 + 0.5;
    int _2858 = ~_2852;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    int _2864 = _2862;
    if (_2810)
    {
        int _2866 = ~_2852;
        int _2868 = _2866 + 1;
        _2864 = _2868;
    }
    int _2870 = _2864;
    out.m_69.x = _2848;
    out.m_69.y = _2856;
    int _2872 = abs(_2846);
    bool _2874 = !_2854;
    int _2876 = _2874 ? 0 : (-1);
    int _2878 = ~_2850;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    int _2884 = abs(_2876);
    int _2886 = abs(_2870);
    int _2888 = _2882 * as_type<int>(_2750);
    int _2890 = ~_2872;
    int _2892 = _2890 + 1;
    int _2894 = _2892 + 1;
    bool _2896 = !_2576;
    int _2898 = _2896 ? 0 : 1;
    int _2900 = _2894 * as_type<int>(_2742);
    int _2902 = _2900 + _2888;
    int _2904 = ~_2886;
    int _2906 = _2904 + 1;
    int _2908 = _2906 + 1;
    int _2910 = abs(_2898);
    int _2912 = ~_2884;
    int _2914 = _2912 + 1;
    int _2916 = _2914 + 1;
    int _2918 = _2908 * as_type<int>(_2780);
    int _2920 = _2918 + _2902;
    int _2922 = ~_2910;
    int _2924 = _2922 + 1;
    int _2926 = _2924 + 1;
    float _2928 = _1838 * _1900;
    int _2930 = _2916 * as_type<int>(_2788);
    int _2932 = _2930 + _2920;
    bool _2934 = !_2356;
    int _2936 = _2934 ? _2840 : (-1);
    float _2938 = _2928 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2940 = _1838 > 0.0;
    bool _2942 = isnan(_1838);
    bool _2944 = _2940 || _2942;
    bool _2946 = isnan(0.0);
    bool _2948 = _2944 || _2946;
    int _2950 = _2932 * _2926;
    bool _2952 = _1900 <= 0.0;
    bool _2954 = !_2948;
    bool _2956 = _2952 || _2954;
    int _2958 = _2936 * _2910;
    int _2960 = _2958 + _2950;
    float _2962 = _2281 + _2156;
    float _2964 = _2938 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2966 = _2962 * 0.5;
    float _2968 = float(_2960);
    float _2970 = _2300 * _2218;
    float _2972 = -_2300;
    float _2974 = _2972 + 1.0;
    out.m_49.x = _2964;
    float _2976 = _2229 * _2970;
    float _2978 = _2239 * _2970;
    out.m_71.z = _2966;
    out.m_71.w = _2156;
    float _2980 = fma(_2235, _2976, _2223);
    float _2982 = fma(_2237, _2976, _2225);
    float _2984 = _2229 * _2974;
    float _2986 = fma(_2229, _2978, _2227);
    out.m_73.x = _2968;
    out.m_75.x = _2980;
    out.m_75.y = _2982;
    out.m_75.z = _2986;
    out.m_75.w = _2984;
    if (!_2956)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _632 = false;
    bool _534 = false;
    bool _306 = false;
    bool _198 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _89 = in.m_42.w;
    float _91 = in.m_44.w;
    float _93 = trunc(_89);
    int _96 = int(_93);
    float _98 = -_91;
    float _100 = _98 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_47.y = _100;
    bool _104 = _96 >= 1;
    float _106 = 0.0;
    float _108 = as_type<float>(_96);
    float _110 = _100;
    if (!_104)
    {
        _106 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _112 = _106;
    if (!_104)
    {
        out.m_49.x = 0.0;
    }
    int _114 = 0;
    if (!_104)
    {
        float _116 = _112 * 5.0;
        _114 = as_type<int>(_116);
    }
    int _118 = _114;
    if (!_104)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3056 = as_type<float>(_118);
        out.gl_Position.z = _3056;
    }
    if (!_104)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _120 = _91 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _122 = isnan(_91);
    bool _124 = _120 || _122;
    bool _126 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _128 = _124 || _126;
    float _130 = float(_96);
    bool _132 = _100 >= _130;
    bool _134 = !_128;
    bool _136 = _132 || _134;
    if (_136)
    {
        _108 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _138 = _108;
    if (_136)
    {
        out.m_49.x = 0.0;
    }
    int _140 = 0;
    if (_136)
    {
        float _142 = _138 * 5.0;
        _140 = as_type<int>(_142);
    }
    int _144 = _140;
    if (_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3111 = as_type<float>(_144);
        out.gl_Position.z = _3111;
    }
    if (_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_51.x;
    float _148 = in.m_51.y;
    float _150 = in.m_51.z;
    float _152 = 1.0 / _130;
    bool _154 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _156 = _100 * _152;
    float _158 = _148 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _160 = _148 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _162 = _148 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _164 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[5].x, _158);
    float _166 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[4].x, _160);
    float _168 = fma(_146, (*spvDescriptorSet0.vp_c10)._m0[6].x, _162);
    float _170 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[5].z, _164);
    float _172 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[4].z, _166);
    float _174 = fma(_150, (*spvDescriptorSet0.vp_c10)._m0[6].z, _168);
    bool _176 = !_154;
    float _178 = _156;
    float _196;
    if (!_176)
    {
        float _180 = in.m_53.x;
        float _182 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _184 = _180 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _186 = fma(_184, (*spvDescriptorSet0.vp_c9)._m0[12].x, _100);
        float _188 = _186 * _182;
        float _190 = floor(_188);
        float _192 = -_190;
        float _194 = _188 + _192;
        _196 = _194;
        _198 = true;
    }
    else
    {
        _196 = _156;
    }
    _198 = false;
    float _200 = _196;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = _200 + _202;
    bool _206 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_200);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _220 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _218;
    bool _222 = _200 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _224 = isnan(_200);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _230 = _226 || _228;
    float _232 = float(_230);
    float _234 = -_216;
    float _236 = _234 + 1.0;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _240 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _238;
    float _242 = 1.0 / _220;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _246 = _232 * _236;
    float _248 = -_232;
    float _250 = _248 + 1.0;
    float _252 = _204 * _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _254;
    float _258 = fma(_240, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _260;
    float _264 = fma(_256, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _266 = fma(_262, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = _258 * _246;
    float _270 = _266 * _246;
    float _272 = _264 * _246;
    float _274 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].x, _268);
    float _276 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].y, _270);
    float _278 = fma(_250, (*spvDescriptorSet0.vp_c9)._m0[143].z, _272);
    float _280 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _274);
    float _282 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _276);
    float _284 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _278);
    bool _286 = !_244;
    float _304;
    if (!_286)
    {
        float _288 = in.m_53.x;
        float _290 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _292 = _288 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _294 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[11].x, _100);
        float _296 = _294 * _290;
        float _298 = floor(_296);
        float _300 = -_298;
        float _302 = _296 + _300;
        _304 = _302;
        _306 = true;
    }
    else
    {
        _304 = _156;
    }
    _306 = false;
    float _308 = _304;
    float _310 = in.m_55.x;
    float _312 = in.m_55.y;
    float _314 = in.m_55.z;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _318 = _308 + _316;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _322 = _308 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _328;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _336 = 1.0 / _326;
    bool _338 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _340 = 1.0 / _334;
    float _342 = _282 * _312;
    bool _344 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _346 = isnan(_308);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _284 * _314;
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _360 = _308 + _358;
    float _362 = 1.0 / _330;
    float _364 = _318 * _336;
    bool _366 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _368 = isnan(_308);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -_354;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _382;
    float _386 = _280 * _310;
    float _388 = _376 * _380;
    float _390 = _322 * _340;
    bool _392 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _394 = isnan(_308);
    bool _396 = _392 || _394;
    bool _398 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _400 = _396 || _398;
    float _402 = float(_400);
    float _404 = -_376;
    float _406 = _404 + 1.0;
    bool _408 = _308 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _410 = isnan(_308);
    bool _412 = _408 || _410;
    bool _414 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _416 = _412 || _414;
    float _418 = float(_416);
    float _420 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _422 = _420 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _424 = -_402;
    float _426 = _424 + 1.0;
    float _428 = _402 * _406;
    float _430 = _360 * _362;
    float _432 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _434 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _432;
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _436;
    float _440 = _418 * _426;
    float _442 = fma(_384, _430, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _444 = fma(_434, _430, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _446 = fma(_438, _430, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _452 = -_418;
    float _454 = _452 + 1.0;
    float _456 = _444 * _440;
    float _458 = _446 * _440;
    float _460 = _442 * _440;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _466 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].y, _458);
    float _468 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].x, _456);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _470;
    float _474 = fma(_422, _390, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _476 = fma(_450, _390, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _478 = fma(_464, _390, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _480 = fma(_454, (*spvDescriptorSet0.vp_c9)._m0[107].z, _460);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _484 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _482;
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _486;
    float _490 = fma(_474, _428, _468);
    float _492 = fma(_472, _364, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _494 = fma(_484, _364, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _496 = fma(_488, _364, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _498 = fma(_476, _428, _466);
    float _500 = fma(_478, _428, _480);
    float _502 = fma(_494, _388, _490);
    float _504 = fma(_492, _388, _498);
    float _506 = fma(_496, _388, _500);
    float _508 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].x, _502);
    float _510 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].y, _504);
    float _512 = fma(_354, (*spvDescriptorSet0.vp_c9)._m0[110].z, _506);
    bool _514 = !_338;
    float _532;
    if (!_514)
    {
        float _516 = in.m_53.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].y, _100);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        _532 = _156;
    }
    _534 = false;
    float _536 = _532;
    bool _538 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _540 = isnan(_536);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _552 = _550 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _556 = isnan(_536);
    bool _558 = _554 || _556;
    bool _560 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _562 = _558 || _560;
    float _564 = float(_562);
    float _566 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _568 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _566;
    float _570 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _572 = _536 + _570;
    float _574 = -_548;
    float _576 = _574 + 1.0;
    bool _578 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _580 = 1.0 / _552;
    float _582 = _564 * _576;
    float _584 = -_564;
    float _586 = _584 + 1.0;
    float _588 = _568 * _580;
    float _590 = _512 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = fma(_588, _572, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = _510 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _596 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _598 = _592 * _582;
    float _600 = _508 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[115].x, _598);
    float _606 = _600 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _608 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[116].x, _604);
    float _610 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _606;
    out.m_57.y = _602;
    out.m_57.z = _596;
    out.m_57.w = _610;
    bool _612 = !_578;
    float _630;
    if (!_612)
    {
        float _614 = in.m_53.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].z, _100);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        _630 = _156;
    }
    _632 = false;
    float _634 = _630;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _638 = _634 + _636;
    float _640 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _642 = _634 + _640;
    bool _644 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _646 = isnan(_634);
    bool _648 = _644 || _646;
    bool _650 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _652 = _648 || _650;
    float _654 = float(_652);
    float _656 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _658 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _656;
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _664 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _664;
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _670 = _634 + _668;
    float _672 = 1.0 / _666;
    bool _674 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _676 = 1.0 / _662;
    bool _678 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _680 = isnan(_634);
    bool _682 = _678 || _680;
    bool _684 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _686 = _682 || _684;
    float _688 = float(_686);
    float _690 = 1.0 / _658;
    float _692 = _642 * _672;
    float _694 = -_654;
    float _696 = _694 + 1.0;
    bool _698 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _700 = isnan(_634);
    bool _702 = _698 || _700;
    bool _704 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _706 = _702 || _704;
    float _708 = float(_706);
    float _710 = _688 * _696;
    float _712 = -_688;
    float _714 = _712 + 1.0;
    float _716 = _638 * _676;
    bool _718 = _634 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _720 = isnan(_634);
    bool _722 = _718 || _720;
    bool _724 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _726 = _722 || _724;
    float _728 = float(_726);
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _732 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _738 = -_728;
    float _740 = _738 + 1.0;
    float _742 = _728 * _714;
    float _744 = _670 * _690;
    float _746 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _748 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _746;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _752 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _750;
    float _754 = _708 * _740;
    float _756 = fma(_732, _744, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _758 = fma(_748, _744, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _760 = fma(_752, _744, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _764 = _762 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _766 = -_708;
    float _768 = _766 + 1.0;
    float _770 = _758 * _754;
    float _772 = _760 * _754;
    float _774 = _756 * _754;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _778 = _776 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _780 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].x, _770);
    float _782 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _784 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _782;
    float _786 = fma(_736, _716, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _788 = fma(_764, _716, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _790 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].y, _772);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _792;
    float _796 = fma(_778, _716, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _798 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[123].z, _774);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _802 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _800;
    float _804 = fma(_786, _742, _780);
    float _806 = fma(_784, _692, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _808 = fma(_794, _692, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _810 = fma(_788, _742, _790);
    float _812 = fma(_802, _692, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _814 = fma(_796, _742, _798);
    float _816 = fma(_806, _710, _804);
    float _818 = fma(_808, _710, _810);
    float _820 = fma(_812, _710, _814);
    float _822 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].x, _816);
    float _824 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].y, _818);
    float _826 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[126].z, _820);
    bool _828 = !_674;
    if (!_828)
    {
        float _830 = in.m_53.x;
        float _832 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _834 = _830 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _836 = fma(_834, (*spvDescriptorSet0.vp_c9)._m0[11].w, _100);
        float _838 = _836 * _832;
        float _840 = floor(_838);
        float _842 = -_840;
        float _844 = _838 + _842;
        _178 = _844;
    }
    float _846 = _178;
    float _848 = in.m_53.z;
    float _850 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _852 = log2(_850);
    float _854 = in.m_53.y;
    int _856 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _858 = _856 != 0;
    float _860 = in.m_53.x;
    float _862 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _864 = int(_862);
    float _866 = abs((*spvDescriptorSet0.vp_c8)._m0[28].x);
    float _868 = abs((*spvDescriptorSet0.vp_c8)._m0[28].z);
    float _870 = precise::max(_866, _868);
    float _872 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _874 = _870 >= 16.0;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _878 = _848 * 2.0;
    float _880 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _882 = floor(_878);
    float _884 = _854 * 2.0;
    float _886 = _854 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _888 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _890 = _860 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _892 = _860 * 2.0;
    float _894 = fma(_886, -2.0, _876);
    float _896 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _898 = floor(_884);
    float _900 = _860 + _854;
    float _902 = -_872;
    float _904 = fma(_890, 2.0, _902);
    float _906 = _860 + _848;
    float _908 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[88].w, _896);
    float _910 = _900 + (-1.0);
    float _912 = _906 + (-1.0);
    bool _914 = _882 >= 0.0;
    bool _916 = isnan(_882);
    bool _918 = _914 || _916;
    bool _920 = isnan(0.0);
    bool _922 = _918 || _920;
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _926 = floor(_892);
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _930 = _928 != 0;
    int _932 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _934 = _932 != 0;
    int _936 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _938 = _936 != 0;
    float _940 = fma(_912, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _942 = _922 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _944 = _898 > 0.0;
    bool _946 = !_934;
    int _948 = _946 ? 0 : 1;
    float _950 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _952 = int(_950);
    bool _954 = _882 > 0.0;
    int _956 = ~as_type<int>(_942);
    int _958 = _956 + 1;
    int _960 = _958 + 1;
    bool _962 = _898 >= 0.0;
    bool _964 = isnan(_898);
    bool _966 = _962 || _964;
    bool _968 = isnan(0.0);
    bool _970 = _966 || _968;
    bool _972 = !_930;
    int _974 = _972 ? 0 : 1;
    bool _976 = !_938;
    int _978 = _976 ? 0 : 1;
    int _980 = _970 ? 0 : 1;
    float _982 = _912;
    int _984 = _960;
    float _986 = _942;
    float _988 = _848;
    if (_858)
    {
        _982 = _854;
    }
    float _990 = _982;
    float _992 = _990;
    if (!_954)
    {
        int _994 = ~as_type<int>(_942);
        int _996 = _994 + 1;
        _984 = _996;
    }
    int _998 = _984;
    if (_858)
    {
        _986 = _860;
    }
    float _1000 = _986;
    float _1002 = _1000;
    if (!_858)
    {
        _1002 = _848;
    }
    float _1004 = _1002;
    int _1006 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1008 = _1006 != 0;
    int _1010 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1012 = _1010 != 0;
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1016 = _1014 != 0;
    bool _1018 = _926 >= 0.0;
    bool _1020 = isnan(_926);
    bool _1022 = _1018 || _1020;
    bool _1024 = isnan(0.0);
    bool _1026 = _1022 || _1024;
    float _1028 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_858)
    {
        _992 = _860;
    }
    float _1030 = _992;
    bool _1032 = !_1008;
    int _1034 = _1032 ? 0 : 1;
    float _1036 = -_880;
    float _1038 = fma(_1028, 2.0, _1036);
    bool _1040 = _926 > 0.0;
    int _1042 = ~_980;
    int _1044 = _1042 + 1;
    int _1046 = _1044 + 1;
    int _1048 = _1046;
    if (!_944)
    {
        int _1050 = ~_980;
        int _1052 = _1050 + 1;
        _1048 = _1052;
    }
    int _1054 = _1048;
    float _1056 = _852 * _100;
    int _1058 = abs(_1034);
    float _1060 = _1030 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1062 = _1026 ? 0 : 1;
    float _1064 = float(_998);
    float _1066 = exp2(_1056);
    float _1068 = float(_1058);
    float _1070 = fma(_1060, -2.0, _888);
    float _1072 = float(_864);
    float _1074 = _1068 * _1064;
    int _1076 = ~_1062;
    int _1078 = _1076 + 1;
    int _1080 = _1078 + 1;
    float _1082 = 1.0 / _1072;
    int _1084 = _1080;
    if (!_1040)
    {
        int _1086 = ~_1062;
        int _1088 = _1086 + 1;
        _1084 = _1088;
    }
    int _1090 = _1084;
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1094 = 1.0 + _1092;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1098 = 1.0 / _1094;
    float _1100 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _1102 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1104 = isnan(1.0);
    bool _1106 = _1102 || _1104;
    bool _1108 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1110 = _1106 || _1108;
    float _1112 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1114 = !_1016;
    int _1116 = _1114 ? 0 : 1;
    float _1118 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1100);
    float _1120 = -_1066;
    float _1122 = _1120 + 1.0;
    bool _1124 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    bool _1130 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1132 = _1128 || _1130;
    float _1134 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[76].y, _894);
    int _1136 = abs(_1116);
    float _1138 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1112);
    float _1140 = float(_952);
    float _1142 = fma(_854, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1096);
    float _1144 = _1132 ? _1122 : 0.0;
    float _1146 = -_100;
    float _1148 = fma(_1146, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1038);
    float _1150 = -_100;
    float _1152 = fma(_1150, (*spvDescriptorSet0.vp_c9)._m0[76].x, _904);
    float _1154 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1118);
    float _1156 = _1140 * _100;
    float _1158 = _1082 * _100;
    float _1160 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1138);
    float _1162 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1142);
    float _1164 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[87].w, _908);
    float _1166 = fma(_100, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1070);
    bool _1168 = _1110;
    float _1170 = _1162;
    if (_1110)
    {
        float _1172 = _1144 * _1098;
        _110 = _1172;
    }
    float _1174 = _110;
    float _1176 = _1074 * (-2.0);
    float _1178 = float(_1136);
    float _1180 = _860 + (-0.5);
    float _1182 = float(_1054);
    float _1184 = (*spvDescriptorSet0.vp_c8)._m0[28].x * 0.0625;
    float _1186 = fma(_924, _1176, _924);
    bool _1188 = !_1012;
    int _1190 = _1188 ? 0 : 1;
    float _1192 = _1180 * (*spvDescriptorSet0.vp_c9)._m0[196].x;
    float _1194 = _1178 * _1182;
    float _1196 = (*spvDescriptorSet0.vp_c8)._m0[28].z * 0.0625;
    float _1198 = _874 ? _1184 : (*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1200 = fma(_1186, _1174, _1192);
    int _1202 = abs(_1190);
    float _1204 = _854 + _848;
    float _1206 = _874 ? _1196 : (*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1208 = _1200 * 0.15915493667125701904296875;
    float _1210 = abs(_1198);
    bool _1212 = _1210 != 0.0;
    bool _1214 = isnan(_1210);
    bool _1216 = _1212 || _1214;
    bool _1218 = isnan(0.0);
    bool _1220 = _1216 || _1218;
    float _1222 = _1204 + (-1.0);
    float _1224 = float(_1202);
    float _1226 = _1194 * (-2.0);
    float _1228 = float(_1090);
    float _1230 = _1208 * 6.283185482025146484375;
    float _1232 = sin(_1230);
    float _1234 = abs(_1206);
    bool _1236 = _1234 == 0.0;
    bool _1238 = !_1220;
    bool _1240 = _1236 && _1238;
    float _1242 = in.m_59.x;
    float _1244 = in.m_59.y;
    float _1246 = in.m_59.z;
    float _1248 = _1224 * _1228;
    float _1250 = abs(_1206);
    bool _1252 = _1250 == 0.0;
    float _1254 = fma(_940, _1226, _940);
    float _1256 = _854 + (-0.5);
    float _1258 = fma(_1222, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1260 = _1248 * (-2.0);
    float _1262 = _848 + (-0.5);
    float _1264 = _1208 * 6.283185482025146484375;
    float _1266 = cos(_1264);
    float _1268 = fma(_1258, _1260, _1258);
    float _1270 = _1174;
    int _1272 = as_type<int>(_1268);
    if (_1240)
    {
        bool _1274 = as_type<int>(_1206) >= 0;
        _1168 = _1274;
    }
    bool _1276 = _1168;
    float _1278 = _1256 * (*spvDescriptorSet0.vp_c9)._m0[196].y;
    float _1280 = _1262 * (*spvDescriptorSet0.vp_c9)._m0[196].z;
    int _1282 = 0;
    int _1284 = _1276 ? (-1) : 0;
    if (_1240)
    {
        int _1286 = _1276 ? 0 : 1078530011;
        _1282 = _1286;
    }
    int _1288 = _1282;
    float _1290 = fma(_1268, _1174, _1278);
    float _1292 = fma(_1254, _1174, _1280);
    if (_1240)
    {
        int _1294 = int(0x80000000) & as_type<int>(_1198);
        int _1296 = _1288 | _1294;
        _1270 = as_type<float>(_1296);
    }
    float _1298 = _1270;
    bool _1300 = !_1220;
    bool _1302 = _1300 && _1252;
    float _1304 = _1298;
    float _1306 = _1298;
    if (!_1302)
    {
        float _1308 = abs(_1198);
        bool _1310 = _1308 != as_type<float>(0x7f800000u /* inf */);
        bool _1312 = isnan(_1308);
        bool _1314 = _1310 || _1312;
        bool _1316 = isnan(as_type<float>(0x7f800000u /* inf */));
        bool _1318 = _1314 || _1316;
        float _1320 = abs(_1206);
        bool _1322 = _1320 == as_type<float>(0x7f800000u /* inf */);
        float _1324 = abs(_1206);
        bool _1326 = _1324 == as_type<float>(0x7f800000u /* inf */);
        bool _1328 = !_1318;
        bool _1330 = _1326 && _1328;
        if (_1330)
        {
            bool _1332 = as_type<int>(_1206) >= 0;
            _1284 = _1332 ? (-1) : 0;
        }
        int _1334 = _1284;
        if (_1330)
        {
            _1272 = 1075235812;
        }
        int _1336 = _1272;
        int _1338 = _1336;
        if (_1330)
        {
            int _1340 = ~_1334;
            int _1342 = (_1340 != 0) ? _1336 : 1061752795;
            _1338 = _1342;
        }
        int _1344 = _1338;
        if (_1330)
        {
            int _1346 = int(0x80000000) & as_type<int>(_1198);
            int _1348 = _1344 | _1346;
            _1304 = as_type<float>(_1348);
        }
        float _1350 = _1304;
        bool _1352 = !_1318;
        bool _1354 = _1352 && _1322;
        _1306 = _1350;
        if (!_1354)
        {
            float _1356 = abs(_1198);
            float _1358 = abs(_1206);
            float _1360 = precise::max(_1356, _1358);
            float _1362 = abs(_1198);
            float _1364 = abs(_1206);
            float _1366 = precise::min(_1362, _1364);
            float _1368 = 1.0 / _1360;
            float _1370 = abs(_1198);
            float _1372 = abs(_1206);
            bool _1374 = _1370 > _1372;
            bool _1376 = as_type<int>(_1206) >= 0;
            float _1378 = abs(_1198);
            float _1380 = abs(_1206);
            float _1382 = _1378 + _1380;
            int _1384 = as_type<int>(_1198) & int(0x80000000);
            bool _1386 = _1382 > as_type<float>(0x7f800000u /* inf */);
            bool _1388 = isnan(_1382);
            bool _1390 = _1386 || _1388;
            bool _1392 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _1394 = _1390 || _1392;
            float _1396 = _1366 * _1368;
            float _1398 = _1396 * _1396;
            float _1400 = _1398 + 11.33538818359375;
            float _1402 = fma(_1398, _1400, 28.84246826171875);
            float _1404 = fma(_1398, _1402, 19.6966705322265625);
            float _1406 = fma(_1398, -0.82336294651031494140625, -5.674867153167724609375);
            float _1408 = fma(_1398, _1406, -6.565555095672607421875);
            float _1410 = 1.0 / _1404;
            float _1412 = _1398 * _1408;
            float _1414 = _1396 * _1412;
            float _1416 = fma(_1414, _1410, _1396);
            float _1418 = _1416;
            _1306 = _1382;
            if (_1374)
            {
                float _1420 = -_1416;
                float _1422 = _1420 + 1.57079637050628662109375;
                _1418 = _1422;
            }
            float _1424 = _1418;
            int _1426 = as_type<int>(_1424);
            if (!_1376)
            {
                float _1428 = -_1424;
                float _1430 = _1428 + 3.1415927410125732421875;
                _1426 = as_type<int>(_1430);
            }
            int _1432 = _1426;
            if (!_1394)
            {
                int _1434 = _1384 | _1432;
                _1306 = as_type<float>(_1434);
            }
        }
    }
    float _1436 = _1306;
    float _1438 = _1290 + _1436;
    float _1440 = _1292 * 0.15915493667125701904296875;
    float _1442 = _342 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1444 = _1438 * 0.15915493667125701904296875;
    float _1446 = _1440 * 6.283185482025146484375;
    float _1448 = cos(_1446);
    float _1450 = in.m_42.x;
    float _1452 = in.m_42.y;
    float _1454 = in.m_42.z;
    float _1456 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1244);
    float _1458 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1246);
    float _1460 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1242);
    float _1462 = _386 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1464 = _1456 * _1442;
    float _1466 = _1444 * 6.283185482025146484375;
    float _1468 = sin(_1466);
    float _1470 = _1460 * _1462;
    float _1472 = _1444 * 6.283185482025146484375;
    float _1474 = cos(_1472);
    float _1476 = _1448 * _1464;
    float _1478 = _1232 * _1476;
    float _1480 = _1266 * _1476;
    float _1482 = _1440 * 6.283185482025146484375;
    float _1484 = sin(_1482);
    float _1486 = _1266 * _1468;
    float _1488 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1490 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1488);
    float _1492 = _1232 * _1474;
    float _1494 = _356 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1496 = _1232 * _1468;
    float _1498 = _1468 * _1448;
    float _1500 = _1474 * _1448;
    float _1502 = _1458 * _1494;
    float _1504 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1506 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1508 = -_1486;
    float _1510 = fma(_1484, _1492, _1508);
    float _1512 = -_1464;
    float _1514 = _1484 * _1512;
    float _1516 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1504);
    float _1518 = fma(_1450, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1506);
    float _1520 = fma(_1510, _1470, _1478);
    float _1522 = _1266 * _1474;
    float _1524 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1516);
    float _1526 = fma(_1500, _1470, _1514);
    float _1528 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1490);
    float _1530 = fma(_1484, _1496, _1522);
    float _1532 = _1524 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1534 = fma(_1498, _1502, _1526);
    float _1536 = _1528 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1538 = fma(_1530, _1502, _1520);
    float _1540 = fma(_1454, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1518);
    float _1542 = fma(_1484, _1522, _1496);
    float _1544 = _1536 + _1534;
    float _1546 = _1532 + _1538;
    float _1548 = _1540 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1550 = -_1492;
    float _1552 = fma(_1484, _1486, _1550);
    float _1554 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1556 = _1544 + _1554;
    float _1558 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1560 = _1546 + _1558;
    float _1562 = fma(_1542, _1470, _1480);
    float _1564 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1566 = _1560 * _1560;
    float _1568 = fma(_1552, _1502, _1562);
    float _1570 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1564);
    float _1572 = fma(_1556, _1556, _1566);
    float _1574 = _1548 + _1568;
    float _1576 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1570);
    float _1578 = sqrt(_1572);
    bool _1580 = _1578 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1582 = _1570;
    float _1584 = _1492;
    float _1586 = _1546;
    float _1588 = _1578;
    if (!_1580)
    {
        _1582 = _1544;
    }
    float _1590 = _1582;
    float _1592 = _1590;
    if (!_1580)
    {
        _1584 = _1574;
    }
    float _1594 = _1584;
    bool _1596 = !_1580;
    float _1598 = _1594;
    if (!_1596)
    {
        float _1600 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1602 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1604 = _1578 + _1602;
        float _1606 = _1574 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1608 = rsqrt(_1572);
        float _1610 = _1604 * _1600;
        float _1612 = _1610 * 0.15915493667125701904296875;
        float _1614 = _1612 * 6.283185482025146484375;
        float _1616 = sin(_1614);
        float _1618 = _1612 * 6.283185482025146484375;
        float _1620 = cos(_1618);
        float _1622 = fma(_1616, _1606, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1624 = _1608 * _1622;
        float _1626 = _1620 + (-1.0);
        float _1628 = fma(_1556, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1630 = fma(_1560, _1624, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1632 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = fma(_1574, _1620, _1632);
        _1598 = _1634;
        _1592 = _1628;
        _1586 = _1630;
    }
    float _1636 = _1598;
    float _1638 = _1592;
    float _1640 = _1586;
    float _1642 = -_1548;
    float _1644 = _1642 + _1636;
    float _1646 = _1576 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1648 = -_1536;
    float _1650 = _1648 + _1638;
    float _1652 = -_1532;
    float _1654 = _1652 + _1640;
    float _1656 = _1644 * _1644;
    float _1658 = _1548 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1660 = 1.0 / _1646;
    float _1662 = fma(_1650, _1650, _1656);
    bool _1664 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1666 = isnan(0.5);
    bool _1668 = _1664 || _1666;
    bool _1670 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1672 = _1668 || _1670;
    float _1674 = fma(_1654, _1654, _1662);
    float _1676 = fma(_1536, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1658);
    float _1678 = sqrt(_1674);
    float _1680 = fma(_1532, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1676);
    float _1682 = _1680 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1684 = _1682 + _1646;
    float _1686 = _1684 * _1660;
    float _1688 = _1686 * 0.5;
    bool _1690 = _1678 > 0.0;
    float _1692 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1694 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1692);
    float _1696 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1698 = _1678;
    float _1700 = _1636;
    float _1702 = _1638;
    float _1704 = _1640;
    float _1706 = _1654;
    float _1708 = _1674;
    if (_1672)
    {
        _1696 = 1.0;
    }
    float _1710 = _1696;
    float _1712 = 1.0 / _1694;
    bool _1714 = !_1690;
    float _1716 = _1710;
    if (!_1714)
    {
        float _1718 = _170 * _170;
        float _1720 = fma(_172, _172, _1718);
        float _1722 = fma(_174, _174, _1720);
        float _1724 = rsqrt(_1674);
        float _1726 = sqrt(_1722);
        float _1728 = _1650 * _1724;
        float _1730 = _1644 * _1724;
        float _1732 = _1654 * _1724;
        bool _1734 = _1726 > 0.0;
        bool _1736 = !_1734;
        _1698 = _1724;
        if (!_1736)
        {
            float _1738 = rsqrt(_1722);
            float _1740 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1742 = _170 * _1738;
            float _1744 = _172 * _1738;
            float _1746 = _1730 * _1742;
            float _1748 = _174 * _1738;
            float _1750 = fma(_1728, _1744, _1746);
            float _1752 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1754 = fma(_1732, _1748, _1750);
            float _1756 = _1754 * _1752;
            float _1758 = fma(_172, _1756, _1638);
            float _1760 = fma(_170, _1756, _1636);
            float _1762 = fma(_174, _1756, _1640);
            _1698 = _1756;
            _1700 = _1760;
            _1702 = _1758;
            _1704 = _1762;
            _1706 = _1750;
        }
    }
    float _1764 = _1698;
    float _1766 = _1700;
    float _1768 = _1702;
    float _1770 = _1704;
    float _1772 = _1706;
    float _1774 = _1772;
    float _1776 = _1764;
    if (_1672)
    {
        _1708 = 1.0;
    }
    float _1778 = _1708;
    float _1780 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1782 = _1712 * _1780;
    float _1784 = _1778;
    if (!_1672)
    {
        float _1786 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1788 = _1786 * 0.15915493667125701904296875;
        float _1790 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1792 = _1788 * 6.283185482025146484375;
        float _1794 = cos(_1792);
        float _1796 = _1790 * 0.15915493667125701904296875;
        float _1798 = _1788 * 6.283185482025146484375;
        float _1800 = sin(_1798);
        float _1802 = 1.0 / _1794;
        float _1804 = _1796 * 6.283185482025146484375;
        float _1806 = cos(_1804);
        float _1808 = _1800 * _1802;
        float _1810 = _1796 * 6.283185482025146484375;
        float _1812 = sin(_1810);
        float _1814 = _1806 * _1808;
        float _1816 = 1.0 / _1814;
        float _1818 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1820 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1818;
        float _1822 = 1.0 / _1820;
        float _1824 = _1812 * _1816;
        float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1828 = fma(_1782, _1824, _1826);
        float _1830 = _1828 * _1822;
        float _1832 = precise::clamp(_1830, 0.0, 1.0);
        _1774 = _1796;
        _1776 = _1802;
        _1716 = _1832;
    }
    float _1834 = _1774;
    float _1836 = _1776;
    float _1838 = _1716;
    float _1840 = _1834;
    float _1842 = _1836;
    if (!_1672)
    {
        float _1844 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1846 = _1844 * 0.15915493667125701904296875;
        float _1848 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1850 = _1846 * 6.283185482025146484375;
        float _1852 = cos(_1850);
        float _1854 = _1848 * 0.15915493667125701904296875;
        float _1856 = _1846 * 6.283185482025146484375;
        float _1858 = sin(_1856);
        float _1860 = 1.0 / _1852;
        float _1862 = _1854 * 6.283185482025146484375;
        float _1864 = cos(_1862);
        float _1866 = _1858 * _1860;
        float _1868 = _1854 * 6.283185482025146484375;
        float _1870 = sin(_1868);
        float _1872 = _1864 * _1866;
        float _1874 = 1.0 / _1872;
        float _1876 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1878 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1876;
        float _1880 = 1.0 / _1878;
        float _1882 = _1870 * _1874;
        float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1886 = fma(_1782, _1882, _1884);
        float _1888 = _1886 * _1880;
        float _1890 = precise::clamp(_1888, 0.0, 1.0);
        float _1892 = -_1890;
        float _1894 = _1892 + 1.0;
        _1840 = _1872;
        _1842 = _1846;
        _1784 = _1894;
    }
    float _1896 = _1840;
    float _1898 = _1842;
    float _1900 = _1784;
    float _1902 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1904 = _1766 + _1902;
    float _1906 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1908 = _1768 + _1906;
    float _1910 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1912 = _1770 + _1910;
    float _1914 = _1904 * _1904;
    float _1916 = fma(_1908, _1908, _1914);
    float _1918 = fma(_1912, _1912, _1916);
    float _1920 = rsqrt(_1918);
    float _1922 = sqrt(_1918);
    float _1924 = _1920 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1926 = _1908 * _1924;
    float _1928 = _1912 * _1924;
    float _1930 = _1926 * _1926;
    float _1932 = _1928 * _1928;
    float _1934 = _1930 + _1932;
    float _1936 = sqrt(_1934);
    bool _1938 = _1936 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1940 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1942 = _1936 + _1940;
    float _1944 = _1920;
    float _1946 = _1942;
    float _1948 = _1896;
    float _1950 = _1904;
    if (_1938)
    {
        float _1952 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1944 = _1952;
    }
    float _1954 = _1944;
    float _1956 = _1954;
    if (_1938)
    {
        float _1958 = _1942 * _1954;
        _1946 = _1958;
    }
    float _1960 = _1946;
    if (_1938)
    {
        float _1962 = rsqrt(_1934);
        _1956 = _1962;
    }
    float _1964 = _1956;
    float _1966 = _1964;
    if (_1938)
    {
        float _1968 = _1960 * 0.15915493667125701904296875;
        _1948 = _1968;
    }
    float _1970 = _1948;
    float _1972 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1974 = _1912;
    float _1976 = _1970;
    if (_1938)
    {
        float _1978 = _1970 * 6.283185482025146484375;
        float _1980 = sin(_1978);
        _1974 = _1980;
    }
    float _1982 = _1974;
    float _1984 = precise::max(0.0, _1972);
    float _1986 = _1898;
    float _1988 = _1984;
    if (_1938)
    {
        float _1990 = _1970 * 6.283185482025146484375;
        float _1992 = cos(_1990);
        _1986 = _1992;
    }
    float _1994 = _1986;
    float _1996 = -_1924;
    float _1998 = -_1984;
    float _2000 = fma(_1904, _1996, _1998);
    if (_1938)
    {
        float _2002 = _2000 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1950 = _2002;
    }
    float _2004 = _1950;
    float _2006 = _1982;
    float _2008 = _2004;
    if (_1938)
    {
        float _2010 = fma(_1982, _2004, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2006 = _2010;
    }
    float _2012 = _2006;
    float _2014 = _2012;
    if (!_1938)
    {
        _2008 = _2000;
    }
    float _2016 = _2008;
    float _2018 = _2016;
    if (_1938)
    {
        float _2020 = _1964 * _2012;
        _1588 = _2020;
    }
    float _2022 = _1588;
    if (!_1938)
    {
        _1966 = _1926;
    }
    float _2024 = _1966;
    float _2026 = _2024;
    float _2028 = _1994;
    if (_1938)
    {
        float _2030 = _1994 + (-1.0);
        _1988 = _2030;
    }
    float _2032 = _1988;
    float _2034 = _2032;
    if (_1938)
    {
        float _2036 = _1926 * _2022;
        _2026 = _2036;
    }
    float _2038 = _2026;
    if (!_1938)
    {
        _2014 = _1928;
    }
    float _2040 = _2014;
    float _2042 = _2040;
    if (_1938)
    {
        float _2044 = _1928 * _2022;
        _2042 = _2044;
    }
    float _2046 = _2042;
    if (_1938)
    {
        float _2048 = _2032 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1976 = _2048;
    }
    float _2050 = _1976;
    if (!_1938)
    {
        _2034 = _1930;
    }
    float _2052 = _2034;
    float _2054 = _2052;
    if (_1938)
    {
        float _2056 = _2038 * _2038;
        _2054 = _2056;
    }
    float _2058 = _2054;
    if (_1938)
    {
        float _2060 = fma(_2000, _1994, _2050);
        _2018 = _2060;
    }
    float _2062 = _2018;
    if (!_1938)
    {
        _2028 = _1932;
    }
    float _2064 = _2028;
    float _2066 = _2064;
    if (_1938)
    {
        float _2068 = _2046 * _2046;
        _2066 = _2068;
    }
    float _2070 = _2066;
    float _2072 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2074 = fma(_2062, _2062, _2058);
    float _2076 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2078 = fma(_1922, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2076);
    float _2080 = precise::clamp(_2078, 0.0, 1.0);
    float _2082 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2084 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2072);
    float _2086 = _2074 + _2070;
    float _2088 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2090 = -_2080;
    float _2092 = _2090 + 1.0;
    float _2094 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2084);
    float _2096 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2098 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2088);
    float _2100 = rsqrt(_2086);
    float _2102 = _2094 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2104 = _1766 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2106 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2096);
    float _2108 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2098);
    float _2110 = _2102 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2112 = fma(_1768, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2104);
    float _2114 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2106);
    float _2116 = abs(_2092);
    float _2118 = log2(_2116);
    float _2120 = _2108 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2122 = -_2110;
    float _2124 = fma(_2122, _2082, 1.0);
    float _2126 = fma(_1770, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2112);
    float _2128 = _2114 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2130 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2132 = _2126 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2134 = _2100 * _2038;
    float _2136 = _2100 * _2062;
    float _2138 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2130);
    float _2140 = _2100 * _2046;
    float _2142 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2144 = log2(_2124);
    float _2146 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2138);
    float _2148 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2150 = -_2142;
    float _2152 = fma(_2136, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2150);
    float _2154 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2156 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2146);
    float _2158 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2148);
    float _2160 = -_2140;
    float _2162 = fma(_2160, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2152);
    float _2164 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2166 = 1.0 / _2156;
    float _2168 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2158);
    float _2170 = fma(_2162, -0.5, 0.5);
    float _2172 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2164);
    float _2174 = fma(_2162, 0.5, 0.5);
    float _2176 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2168);
    float _2178 = _2136 + 1.0;
    float _2180 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2172);
    float _2182 = exp2(_2154);
    float _2184 = fma(_2174, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2186 = _2144 * 0.693147182464599609375;
    float _2188 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2180);
    float _2190 = fma(_2174, _2184, -0.212114393711090087890625);
    float _2192 = _2186 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2194 = sqrt(_2170);
    float _2196 = _2176 * _2166;
    float _2198 = _2188 * _2166;
    float _2200 = fma(_2174, _2190, 1.570728778839111328125);
    float _2202 = fma(_2196, 0.5, 0.5);
    float _2204 = fma(_2198, -0.5, 0.5);
    float _2206 = -_2136;
    float _2208 = fma(_2182, _2178, _2206);
    float _2210 = fma(_2208, 0.5, 0.5);
    float _2212 = _2194 * 0.636619746685028076171875;
    float _2214 = -_2200;
    float _2216 = fma(_2212, _2214, 1.0);
    float3 _6370 = float3(_2202, _2204, _2192);
    float _2218 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6370, float3(0.0), isnan(_6370)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6370, float3(0.0), isnan(_6370)), level(0.0)).x;
    float3 _6381 = float3(_2202, _2204, _2192);
    float4 _2221 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6381, float3(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6381, float3(0.0), isnan(_6381)), level(0.0)).xyzw;
    float _2223 = _2221.x;
    float _2225 = _2221.y;
    float _2227 = _2221.z;
    float _2229 = _2221.w;
    float2 _6398 = float2(_2216, _2210);
    float3 _2233 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6398, float2(0.0), isnan(_6398)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6398, float2(0.0), isnan(_6398)), level(0.0)).xyz;
    float _2235 = _2233.x;
    float _2237 = _2233.y;
    float _2239 = _2233.z;
    float _2241 = float(uint(_952));
    float _2243 = trunc(_1158);
    int _2245 = int(_2243);
    int _2247 = ~_952;
    int _2249 = _2247 + 1;
    float _2251 = _1156 * _152;
    int _2253 = ~_952;
    int _2255 = _2253 + 1;
    float _2257 = _822 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2259 = _952 + (-1);
    float _2261 = _2118 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2263 = _854 > 0.5;
    float _2265 = 1.0 / _2241;
    float _2267 = _2120 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2269 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2267);
    float _2271 = float(uint(_2245));
    float _2273 = trunc(_2251);
    int _2275 = int(_2273);
    float _2277 = float(_2245);
    float _2279 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2269);
    float _2281 = fma(_2132, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2279);
    int _2283 = as_type<int>(_2265) + (-2);
    float _2285 = exp2(_2261);
    out.gl_Position.x = _2176;
    out.gl_Position.y = _2188;
    out.gl_Position.z = _2281;
    out.gl_Position.w = _2156;
    float _2287 = as_type<float>(_2283) * _2271;
    float _2289 = trunc(_2287);
    float _2291 = precise::max(_2289, 0.0);
    uint _2294 = uint(_2291);
    float _2296 = -_2285;
    float _2298 = _2296 + 1.0;
    float _2300 = _2298 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2302 = _2249 * int(_2294);
    int _2304 = _2302 + _2245;
    float _2306 = float(uint(_2304));
    float _2308 = as_type<float>(_2283) * _2306;
    float _2310 = trunc(_2308);
    float _2312 = precise::max(_2310, 0.0);
    uint _2314 = uint(_2312);
    bool _2316 = !_858;
    float _2318 = _2316 ? 7.345489978790283203125 : 1.0;
    float _2320 = _2318 * _860;
    float _2322 = floor(_2320);
    int _2324 = int(_2294) + int(_2314);
    bool _2326 = _2277 >= _1140;
    bool _2328 = isnan(_2277);
    bool _2330 = _2326 || _2328;
    bool _2332 = isnan(_1140);
    bool _2334 = _2330 || _2332;
    float _2336 = float(_2334);
    int _2338 = _2255 * _2324;
    int _2340 = _2338 + _2245;
    float _2342 = trunc(_2336);
    int _2344 = int(_2342);
    bool _2346 = uint(_2340) >= uint(_952);
    float _2348 = -_2322;
    float _2350 = _2320 + _2348;
    bool _2352 = !_2346;
    int _2354 = _2352 ? 0 : (-1);
    bool _2356 = _952 == 0;
    int _2358 = ~_2324;
    int _2360 = _2358 + _2354;
    int _2362 = _2360 + 1;
    float _2364 = _2350 * _1140;
    int _2366 = _952 * _2362;
    int _2368 = _2366 + _2245;
    int _2370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2372 = _2370 != 0;
    float _2374 = trunc(_2364);
    int _2376 = int(_2374);
    int _2378 = ~_2344;
    int _2380 = _2378 + 1;
    int _2382 = _2380 + 1;
    bool _2384 = !_2356;
    int _2386 = _2384 ? _2368 : (-1);
    bool _2388 = !_2372;
    int _2390 = _2388 ? 0 : 1;
    int _2392 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2394 = _2392 != 0;
    int _2396 = _2386 * _2382;
    int _2398 = abs(_948);
    int _2400 = abs(_2390);
    int _2402 = _2344 * _2259;
    int _2404 = _2402 + _2396;
    int _2406 = abs(_974);
    int _2408 = _2404 * _2398;
    bool _2410 = !_2394;
    int _2412 = _2410 ? 0 : 1;
    float _2414 = in.m_53.w;
    int _2416 = abs(_978);
    int _2418 = _2376 * _2400;
    int _2420 = _2418 + _2245;
    int _2422 = abs(_2412);
    int _2424 = _2275 * _2406;
    int _2426 = _2424 + _2408;
    float _2428 = in.m_61.x;
    float _2430 = float(uint(_2420));
    int _2432 = _2420 * _2416;
    int _2434 = _2432 + _2426;
    float _2436 = in.m_61.y;
    int _2438 = ~_952;
    int _2440 = _2438 + 1;
    int _2442 = _2376 * _2422;
    int _2444 = _2442 + _2434;
    int _2446 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2448 = _2446 != 0;
    float _2450 = float(uint(_2444));
    bool _2452 = _848 > 0.5;
    int _2454 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2456 = _2454 != 0;
    float _2458 = as_type<float>(_2283) * _2450;
    int _2460 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2462 = _2460 != 0;
    float _2464 = trunc(_2458);
    float _2466 = precise::max(_2464, 0.0);
    uint _2468 = uint(_2466);
    out.m_63.x = 1.0;
    out.m_63.y = 1.0;
    out.m_63.z = 1.0;
    int _2470 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2472 = _2470 != 0;
    int _2474 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2476 = _2472;
    float _2478 = _2428;
    if (!_2448)
    {
        _988 = _2428;
    }
    float _2480 = _988;
    float _2482 = as_type<float>(_2283) * _2430;
    int _2484 = _2440 * int(_2468);
    int _2486 = _2484 + _2444;
    float _2488 = trunc(_2482);
    float _2490 = precise::max(_2488, 0.0);
    uint _2492 = uint(_2490);
    float _2494 = float(uint(_2486));
    float _2496 = as_type<float>(_2283) * _2494;
    float _2498 = -_2436;
    float _2500 = _2498 + 1.0;
    float _2502 = trunc(_2496);
    float _2504 = precise::max(_2502, 0.0);
    uint _2506 = uint(_2504);
    int _2508 = _2263 ? as_type<int>(_2500) : as_type<int>(_2436);
    int _2510 = _2452 ? as_type<int>(_2500) : as_type<int>(_2436);
    float _2512 = _2462 ? as_type<float>(_2508) : _2436;
    float _2514 = _2472 ? as_type<float>(_2510) : _2436;
    float _2516 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2518 = _2516 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2520 = _2414 > 0.5;
    float _2522 = _2436;
    float _2524 = _2480;
    if (_2448)
    {
        float _2526 = -_2428;
        float _2528 = _2526 + 1.0;
        _2474 = as_type<int>(_2528);
    }
    int _2530 = _2474;
    if (_2448)
    {
        bool _2532 = _860 > 0.5;
        _2476 = _2532;
    }
    bool _2534 = _2476;
    float _2536 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2538 = ~_952;
    int _2540 = _2538 + 1;
    if (_2456)
    {
        float _2542 = _2520 ? _2500 : _2436;
        _2522 = _2542;
    }
    float _2544 = _2522;
    if (_2448)
    {
        float _2546 = _2534 ? as_type<float>(_2530) : _2428;
        _2524 = _2546;
    }
    float _2548 = _2524;
    float _2550 = 1.0 / _2518;
    int _2552 = int(_2468) + int(_2506);
    int _2554 = _2540 * int(_2492);
    int _2556 = _2554 + _2420;
    int _2558 = ~_952;
    int _2560 = _2558 + 1;
    float _2562 = _2544 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2564 = _2560 * _2552;
    int _2566 = _2564 + _2444;
    float _2568 = float(uint(_2556));
    float _2570 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2572 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2570;
    int _2574 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2576 = _2574 != 0;
    float _2578 = fma(_2512, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _2580 = uint(_2566) >= uint(_952);
    float _2582 = _2536 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _2584 = _846 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2586 = isnan(_846);
    bool _2588 = _2584 || _2586;
    bool _2590 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2592 = _2588 || _2590;
    float _2594 = float(_2592);
    float _2596 = _2572 * _2550;
    float _2598 = as_type<float>(_2283) * _2568;
    bool _2600 = !_2580;
    int _2602 = _2600 ? 0 : (-1);
    float _2604 = fma(_2514, _2582, -0.5);
    int _2606 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2608 = _2606 != 0;
    float _2610 = -_1134;
    float _2612 = fma(_1162, _2578, _2610);
    int _2614 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _2616 = _2614 != 0;
    float _2618 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2620 = _846 + _2618;
    bool _2622 = _846 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2624 = isnan(_846);
    bool _2626 = _2622 || _2624;
    bool _2628 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2630 = _2626 || _2628;
    float _2632 = float(_2630);
    float _2634 = -_2594;
    float _2636 = _2634 + 1.0;
    int _2638 = ~_2552;
    int _2640 = _2638 + _2602;
    int _2642 = _2640 + 1;
    float _2644 = trunc(_2598);
    float _2646 = precise::max(_2644, 0.0);
    uint _2648 = uint(_2646);
    float _2650 = fma(_2596, _2620, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2652 = _2632 * _2636;
    float _2654 = -_2632;
    float _2656 = _2654 + 1.0;
    int _2658 = _952 * _2642;
    int _2660 = _2658 + _2444;
    float _2662 = -_1166;
    float _2664 = fma(_1164, _2604, _2662);
    float _2666 = _2650 * _2652;
    int _2668 = _2566;
    int _2670 = _2660;
    if (_2608)
    {
        float _2672 = -_2428;
        float _2674 = _2672 + 1.0;
        _2668 = as_type<int>(_2674);
    }
    int _2676 = _2668;
    float _2678 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _2680 = !_2356;
    int _2682 = _2680 ? _2660 : (-1);
    float _2684 = fma(_2656, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2666);
    if (!_2608)
    {
        _1170 = _2428;
    }
    float _2686 = _1170;
    float _2688 = _2686;
    if (_2616)
    {
        float _2690 = -_2428;
        float _2692 = _2690 + 1.0;
        _2670 = as_type<int>(_2692);
    }
    int _2694 = _2670;
    int _2696 = _2682 >> 31;
    float _2698 = _2612 + 0.5;
    if (_2608)
    {
        float _2700 = _2452 ? as_type<float>(_2676) : _2428;
        _2688 = _2700;
    }
    float _2702 = _2688;
    float _2704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2706 = _2696 & 3;
    int _2708 = int(_2492) + int(_2648);
    float _2710 = fma(_2594, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2684);
    int _2712 = _2682 + _2706;
    float _2714 = _2678 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2716 = _2712 >> 2;
    if (_2616)
    {
        float _2718 = _2263 ? as_type<float>(_2694) : _2428;
        _2478 = _2718;
    }
    float _2720 = _2478;
    float _2722 = fma(_2548, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _2724 = _2716 << 4;
    int _2726 = _2724 + 368;
    float _2728 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2730 = ~_952;
    int _2732 = _2730 + 1;
    float _2734 = fma(_2714, _2720, -0.5);
    uint _2736 = uint(int(uint(_2726) >> uint(2)));
    uint _2738 = uint(int(uint(int(_2736)) >> uint(2)));
    int _2740 = int(_2736) & 3;
    float _2742 = (*spvDescriptorSet0.vp_c9)._m0[int(_2738)][_2740];
    int _2744 = int(_2736) + 1;
    uint _2746 = uint(int(uint(_2744) >> uint(2)));
    int _2748 = _2744 & 3;
    float _2750 = (*spvDescriptorSet0.vp_c9)._m0[int(_2746)][_2748];
    float _2752 = fma(_1160, _2722, _1152);
    int _2754 = _2682 & 3;
    bool _2756 = _2754 != 0;
    float _2758 = fma(_1154, _2734, _1148);
    int _2760 = _2682 & 3;
    bool _2762 = _2760 != 0;
    int _2764 = _2732 * _2708;
    int _2766 = _2764 + _2420;
    float _2768 = _2702 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2770 = _826 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2772 = _2726 + 8;
    uint _2774 = uint(int(uint(_2772) >> uint(2)));
    uint _2776 = uint(int(uint(int(_2774)) >> uint(2)));
    int _2778 = int(_2774) & 3;
    float _2780 = (*spvDescriptorSet0.vp_c9)._m0[int(_2776)][_2778];
    int _2782 = int(_2774) + 1;
    uint _2784 = uint(int(uint(_2782) >> uint(2)));
    int _2786 = _2782 & 3;
    float _2788 = (*spvDescriptorSet0.vp_c9)._m0[int(_2784)][_2786];
    bool _2790 = uint(_2760) > 1u;
    float _2792 = _824 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2794 = uint(_2766) >= uint(_952);
    float _2796 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2798 = _2770 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2800 = _2756 ? 0 : 1;
    float _2802 = _2792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2804 = !_2794;
    int _2806 = _2804 ? 0 : (-1);
    float _2808 = _2710 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2810 = _2760 != 3;
    float _2812 = _2562 * _2704;
    int _2814 = ~_2708;
    int _2816 = _2814 + _2806;
    int _2818 = _2816 + 1;
    float _2820 = _2768 * _2728;
    int _2822 = ~_2800;
    int _2824 = _2822 + 1;
    int _2826 = _2824 + 1;
    float _2828 = _2752 + 0.5;
    int _2830 = _2826;
    if (!_2790)
    {
        int _2832 = ~_2800;
        int _2834 = _2832 + 1;
        _2830 = _2834;
    }
    int _2836 = _2830;
    int _2838 = _952 * _2818;
    int _2840 = _2838 + _2420;
    bool _2842 = uint(_2760) >= 2u;
    out.m_65.x = _2796;
    out.m_65.y = _2802;
    out.m_65.z = _2798;
    out.m_65.w = _2808;
    bool _2844 = !_2762;
    int _2846 = _2844 ? 0 : 1;
    float _2848 = _2758 + 0.5;
    int _2850 = abs(_2836);
    out.m_67.x = _2828;
    out.m_67.y = _2698;
    out.m_67.z = _2820;
    out.m_67.w = _2812;
    int _2852 = _2842 ? 0 : 1;
    bool _2854 = _2760 != 3;
    float _2856 = _2664 + 0.5;
    int _2858 = ~_2852;
    int _2860 = _2858 + 1;
    int _2862 = _2860 + 1;
    int _2864 = _2862;
    if (_2810)
    {
        int _2866 = ~_2852;
        int _2868 = _2866 + 1;
        _2864 = _2868;
    }
    int _2870 = _2864;
    out.m_69.x = _2848;
    out.m_69.y = _2856;
    int _2872 = abs(_2846);
    bool _2874 = !_2854;
    int _2876 = _2874 ? 0 : (-1);
    int _2878 = ~_2850;
    int _2880 = _2878 + 1;
    int _2882 = _2880 + 1;
    int _2884 = abs(_2876);
    int _2886 = abs(_2870);
    int _2888 = _2882 * as_type<int>(_2750);
    int _2890 = ~_2872;
    int _2892 = _2890 + 1;
    int _2894 = _2892 + 1;
    bool _2896 = !_2576;
    int _2898 = _2896 ? 0 : 1;
    int _2900 = _2894 * as_type<int>(_2742);
    int _2902 = _2900 + _2888;
    int _2904 = ~_2886;
    int _2906 = _2904 + 1;
    int _2908 = _2906 + 1;
    int _2910 = abs(_2898);
    int _2912 = ~_2884;
    int _2914 = _2912 + 1;
    int _2916 = _2914 + 1;
    int _2918 = _2908 * as_type<int>(_2780);
    int _2920 = _2918 + _2902;
    int _2922 = ~_2910;
    int _2924 = _2922 + 1;
    int _2926 = _2924 + 1;
    float _2928 = _1838 * _1900;
    int _2930 = _2916 * as_type<int>(_2788);
    int _2932 = _2930 + _2920;
    bool _2934 = !_2356;
    int _2936 = _2934 ? _2840 : (-1);
    float _2938 = _2928 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _2940 = _1838 > 0.0;
    bool _2942 = isnan(_1838);
    bool _2944 = _2940 || _2942;
    bool _2946 = isnan(0.0);
    bool _2948 = _2944 || _2946;
    int _2950 = _2932 * _2926;
    bool _2952 = _1900 <= 0.0;
    bool _2954 = !_2948;
    bool _2956 = _2952 || _2954;
    int _2958 = _2936 * _2910;
    int _2960 = _2958 + _2950;
    float _2962 = _2281 + _2156;
    float _2964 = _2938 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2966 = _2962 * 0.5;
    float _2968 = float(_2960);
    float _2970 = _2300 * _2218;
    float _2972 = -_2300;
    float _2974 = _2972 + 1.0;
    out.m_49.x = _2964;
    float _2976 = _2229 * _2970;
    float _2978 = _2239 * _2970;
    out.m_71.z = _2966;
    out.m_71.w = _2156;
    float _2980 = fma(_2235, _2976, _2223);
    float _2982 = fma(_2237, _2976, _2225);
    float _2984 = _2229 * _2974;
    float _2986 = fma(_2229, _2978, _2227);
    out.m_73.x = _2968;
    out.m_75.x = _2980;
    out.m_75.y = _2982;
    out.m_75.z = _2986;
    out.m_75.w = _2984;
    if (!_2956)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2988 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2988;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

