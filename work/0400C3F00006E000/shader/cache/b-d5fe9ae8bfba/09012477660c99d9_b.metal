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
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_77 [[user(locn4)]];
    float4 m_79 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_91 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_99 [[user(locn16)]];
    float4 m_103 [[user(locn17)]];
    float4 m_63 [[user(locn18)]];
    float4 m_69 [[user(locn19)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_87 [[attribute(0)]];
    float4 m_73 [[attribute(1)]];
    float4 m_53 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_83 [[attribute(5)]];
    float4 m_81 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_85 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6376 = false;
    bool _1148 = false;
    bool _818 = false;
    bool _714 = false;
    bool _600 = false;
    bool _446 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6661 = as_type<float>(_138);
        out.gl_Position.z = _6661;
    }
    if (!_126)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_49.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6731 = as_type<float>(_176);
        out.gl_Position.z = _6731;
    }
    if (_168)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _194);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    bool _204 = !_184;
    float _222;
    if (!_204)
    {
        float _206 = in.m_55.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_122);
        float _228 = 1.0 / _226;
        float _230 = _156 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _232 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _232 + _238;
    bool _242 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _244 = isnan(_232);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _232 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _266 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = 1.0 / _256;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = 1.0 / _268;
    float _276 = 1.0 / _264;
    float _278 = _236 * _270;
    bool _280 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _282 = isnan(_232);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_252;
    float _294 = _292 + 1.0;
    float _296 = _290 * _294;
    float _298 = _240 * _274;
    bool _300 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_232);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_232);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = -_290;
    float _334 = _332 + 1.0;
    float _336 = -_310;
    float _338 = _336 + 1.0;
    float _340 = _260 * _276;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = _326 * _338;
    float _352 = fma(_314, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = fma(_348, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = _310 * _334;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = _354 * _350;
    float _366 = _356 * _350;
    float _368 = _352 * _350;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _380 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _364);
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_330, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _390 = fma(_376, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_362, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_388, _358, _378);
    float _404 = fma(_386, _278, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _406 = fma(_396, _278, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _408 = fma(_400, _278, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _410 = fma(_390, _358, _380);
    float _412 = fma(_392, _358, _382);
    float _414 = fma(_404, _296, _402);
    float _416 = fma(_406, _296, _410);
    float _418 = fma(_408, _296, _412);
    float _420 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].x, _414);
    float _422 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].y, _416);
    float _424 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].z, _418);
    bool _426 = !_272;
    float _444;
    if (!_426)
    {
        float _428 = in.m_55.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_122);
        float _450 = 1.0 / _448;
        float _452 = _156 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _454 + _456;
    float _460 = in.m_57.x;
    float _462 = in.m_57.y;
    float _464 = in.m_57.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _472 = isnan(_454);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _486 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _488 = isnan(_454);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _498;
    bool _502 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _504 = isnan(_454);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _468;
    float _516 = -_480;
    float _518 = _516 + 1.0;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _522 = _496 * _518;
    float _524 = -_496;
    float _526 = _524 + 1.0;
    float _528 = 1.0 / _484;
    float _530 = _500 * _514;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _536 = _422 * _462;
    float _538 = _424 * _464;
    float _540 = fma(_530, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = _420 * _460;
    float _544 = _534 * _528;
    float _546 = _540 * _522;
    float _548 = -_512;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _554 = _454 + _552;
    float _556 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[115].x, _546);
    float _558 = _480 * _550;
    float _560 = fma(_544, _554, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _564 = fma(_560, _558, _556);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[117].x, _564);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _578 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _568;
    out.m_59.y = _578;
    out.m_59.z = _574;
    out.m_59.w = _576;
    bool _580 = !_520;
    float _598;
    if (!_580)
    {
        float _582 = in.m_55.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].z, _156);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_122);
        float _604 = 1.0 / _602;
        float _606 = _156 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _612 = _608 + _610;
    bool _614 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _616 = isnan(_608);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _626;
    bool _630 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _632 = isnan(_608);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _646;
    float _650 = 1.0 / _628;
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _654 = _640 * _644;
    float _656 = -_640;
    float _658 = _656 + 1.0;
    float _660 = _612 * _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _662;
    float _666 = fma(_648, _660, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _668;
    float _672 = fma(_664, _660, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _674 = _666 * _654;
    float _676 = fma(_670, _660, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _678 = _672 * _654;
    float _680 = _676 * _654;
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].x, _674);
    float _684 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].y, _680);
    float _686 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].z, _678);
    float _688 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].x, _682);
    float _690 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].y, _684);
    float _692 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].z, _686);
    bool _694 = !_652;
    float _712;
    if (!_694)
    {
        float _696 = in.m_55.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _156 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    bool _724 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = isnan(_722);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _740 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _742 = isnan(_722);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _758 = _722 + _756;
    float _760 = -_734;
    float _762 = _760 + 1.0;
    bool _764 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _766 = 1.0 / _738;
    float _768 = _750 * _762;
    float _770 = -_750;
    float _772 = _770 + 1.0;
    float _774 = _754 * _766;
    float _776 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _778 = fma(_774, _758, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _780 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _782 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _778 * _768;
    float _786 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _784);
    float _790 = _688 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _792 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[132].x, _788);
    float _794 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _794;
    out.m_61.y = _786;
    out.m_61.z = _782;
    out.m_61.w = _796;
    bool _798 = !_764;
    float _816;
    if (!_798)
    {
        float _800 = in.m_55.x;
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _804 = _800 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[14].x, _156);
        float _808 = _806 * _802;
        float _810 = floor(_808);
        float _812 = -_810;
        float _814 = _808 + _812;
        _816 = _814;
        _818 = true;
    }
    else
    {
        float _820 = float(_122);
        float _822 = 1.0 / _820;
        float _824 = _156 * _822;
        _816 = _824;
    }
    _818 = false;
    float _826 = _816;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _830 = _826 + _828;
    bool _832 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _834 = isnan(_826);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _848 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _850 = isnan(_826);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _860;
    bool _864 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _866 = isnan(_826);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -_842;
    float _878 = _876 + 1.0;
    float _880 = 1.0 / _846;
    float _882 = _858 * _878;
    float _884 = -_874;
    float _886 = _884 + 1.0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _892 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _894 = 1.0 / _890;
    float _896 = _862 * _880;
    float _898 = -_858;
    float _900 = _898 + 1.0;
    bool _902 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _904 = isnan(_826);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_896, _830, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _916 = _874 * _900;
    bool _918 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _920 = isnan(_826);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = _912 * _886;
    float _932 = -_912;
    float _934 = _932 + 1.0;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _940 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _942 = isnan(_826);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = _928 * _934;
    float _954 = -_928;
    float _956 = _954 + 1.0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _962 = 1.0 / _938;
    bool _964 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _966 = isnan(_826);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _950 * _956;
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _990 = _974 * _980;
    float _992 = 1.0 / _960;
    float _994 = _988 * _894;
    float _996 = _914 * _990;
    float _998 = -_974;
    float _1000 = _998 + 1.0;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = _826 + _1006;
    float _1010 = 1.0 / _984;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1012;
    float _1016 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _996);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1022 = fma(_994, _1008, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = _1014 * _962;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1028 = _826 + _1026;
    float _1030 = 1.0 / _1004;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1036 = fma(_1024, _1028, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1038 = fma(_1022, _976, _1016);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1040;
    float _1044 = _1034 * _992;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1048 = _826 + _1046;
    float _1050 = 1.0 / _1020;
    float _1052 = fma(_1036, _952, _1038);
    float _1054 = _1042 * _1010;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1058 = _826 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1064 = fma(_1044, _1048, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1068 = _826 + _1066;
    float _1070 = fma(_1054, _1058, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1072 = _1062 * _1030;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1074;
    bool _1078 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1080 = isnan(_826);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = fma(_1064, _930, _1052);
    float _1092 = fma(_1072, _1068, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1096 = _826 + _1094;
    float _1098 = -_1088;
    float _1100 = _1098 + 1.0;
    float _1102 = _1076 * _1050;
    float _1104 = fma(_1070, _916, _1090);
    float _1106 = _842 * _1100;
    float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1110 = fma(_1092, _882, _1104);
    float _1112 = fma(_1108, _1106, _1110);
    float _1114 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    out.m_63.x = _1114;
    bool _1116 = !_892;
    float _1118 = _1030;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1050;
    float _1124 = _1038;
    float _1126 = _842;
    float _1128 = _882;
    float _1146;
    if (!_1116)
    {
        float _1130 = in.m_55.x;
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1134 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[14].y, _156);
        float _1138 = _1136 * _1132;
        float _1140 = floor(_1138);
        float _1142 = -_1140;
        float _1144 = _1138 + _1142;
        _1146 = _1144;
        _1148 = true;
    }
    else
    {
        float _1150 = float(_122);
        float _1152 = 1.0 / _1150;
        float _1154 = _156 * _1152;
        _1146 = _1154;
    }
    _1148 = false;
    float _1156 = _1146;
    float _1158 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1160 = int(_1158);
    float _1162 = float(_122);
    float _1164 = in.m_65.x;
    float _1166 = in.m_55.y;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1174 = int(_1172);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1178 = _1176 != 0;
    float _1180 = float(_1160);
    float _1182 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1184 = int(_1182);
    if (_1170)
    {
        float _1186 = in.m_55.x;
        _1118 = _1186;
    }
    float _1188 = _1118;
    float _1190 = float(uint(_1174));
    float _1192 = 1.0 / _1180;
    float _1194 = float(_1174);
    if (_1178)
    {
        float _1196 = in.m_55.z;
        _1120 = _1196;
    }
    float _1198 = _1120;
    int _1200 = ~_1174;
    int _1202 = _1200 + 1;
    float _1204 = 0.0;
    int _1206 = as_type<int>(_1198);
    float _1208 = _1164;
    if (!_1170)
    {
        _1204 = _1164;
    }
    float _1210 = _1204;
    float _1212 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1214 = int(_1212);
    float _1216 = float(_1184);
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1220 = _1218 != 0;
    float _1222 = _1192 * _156;
    float _1224 = 1.0 / _1190;
    float _1226 = float(_1214);
    float _1228 = trunc(_1222);
    int _1230 = int(_1228);
    float _1232 = _1210;
    bool _1234 = _1220;
    if (_1220)
    {
        float _1236 = in.m_55.x;
        _1122 = _1236;
    }
    float _1238 = _1122;
    int _1240 = 0;
    float _1242 = _1238;
    if (_1220)
    {
        _1240 = 0;
    }
    int _1244 = _1240;
    int _1246 = 0;
    int _1248 = _1244;
    if (_1220)
    {
        _1246 = 0;
    }
    int _1250 = _1246;
    float _1252 = _1010;
    int _1254 = _1250;
    if (_1220)
    {
        float _1256 = in.m_55.z;
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = 1.0 / _1216;
    int _1262 = as_type<int>(_1224) + (-2);
    float _1264 = _1194 * _156;
    if (_1220)
    {
        _1124 = 1.0;
    }
    float _1266 = _1124;
    float _1268 = _1266;
    if (_1220)
    {
        _1126 = 1.0;
    }
    float _1270 = _1126;
    float _1272 = _1270;
    if (_1220)
    {
        _1128 = 1.0;
    }
    float _1274 = _1128;
    float _1276 = 1.0 / _1226;
    float _1278 = float(uint(_1230));
    int _1280 = 0;
    float _1282 = _1274;
    if (_1220)
    {
        _1280 = as_type<int>(_1166);
    }
    int _1284 = _1280;
    float _1286 = 1.0 / _1162;
    float _1288 = as_type<float>(_1262) * _1278;
    float _1290 = _1260 * _156;
    int _1292 = as_type<int>(_1260);
    float _1294 = _1258;
    int _1296 = _1284;
    if (_1220)
    {
        _1292 = as_type<int>(_1258);
    }
    int _1298 = _1292;
    float _1300 = trunc(_1288);
    float _1302 = precise::max(_1300, 0.0);
    uint _1305 = uint(_1302);
    float _1307 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1309 = int(_1307);
    float _1311 = float(_1230);
    float _1313 = _1264 * _1286;
    float _1315 = in.m_55.w;
    bool _1317 = _1311 >= _1194;
    bool _1319 = isnan(_1311);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(_1194);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    float _1329 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1331 = int(_1329);
    int _1333 = _1202 * int(_1305);
    int _1335 = _1333 + _1230;
    float _1337 = float(uint(_1335));
    float _1339 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1341 = int(_1339);
    float _1343 = float(uint(_1309));
    float _1345 = as_type<float>(_1262) * _1337;
    float _1347 = _1337;
    float _1349 = as_type<float>(_1335);
    int _1351 = _1298;
    int _1353 = as_type<int>(_1345);
    if (_1220)
    {
        _1347 = _1238;
    }
    float _1355 = _1347;
    float _1357 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1359 = int(_1357);
    float _1361 = float(uint(_1331));
    float _1363 = _1355;
    if (_1220)
    {
        _1349 = _1355;
    }
    float _1365 = _1349;
    int _1367 = 0;
    float _1369 = _1365;
    if (_1220)
    {
        _1367 = as_type<int>(_1355);
    }
    int _1371 = _1367;
    float _1373 = float(uint(_1341));
    float _1375 = 1.0 / _1343;
    float _1377 = float(_1359);
    float _1379 = 1.0 / _1361;
    float _1381 = 1.0 / _1377;
    float _1383 = 1.0 / _1373;
    float _1385 = trunc(_1313);
    int _1387 = int(_1385);
    float _1389 = trunc(_1290);
    int _1391 = int(_1389);
    float _1393 = trunc(_1327);
    int _1395 = int(_1393);
    float _1397 = trunc(_1345);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    int _1403 = _1371;
    int _1405 = int(_1401);
    if (!_1220)
    {
        float _1407 = in.m_55.x;
        float _1409 = _1166 * 3.1415927410125732421875;
        float _1411 = in.m_55.z;
        float _1413 = _1409 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1407 * 3.1415927410125732421875;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1411 * 3.1415927410125732421875;
        float _1425 = _1423 * 0.15915493667125701904296875;
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1425 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        _1272 = 1.2345600128173828125;
        _1363 = _1166;
        _1268 = 7.345489978790283203125;
        _1242 = _1407;
        _1282 = 5.839270114898681640625;
        _1369 = _1411;
        _1294 = _1411;
        _1248 = 1;
        _1254 = 2;
        _1296 = as_type<int>(_1417);
        _1403 = as_type<int>(_1429);
        _1351 = as_type<int>(_1433);
    }
    float _1435 = _1272;
    float _1437 = _1363;
    float _1439 = _1268;
    float _1441 = _1242;
    float _1443 = _1282;
    float _1445 = _1369;
    float _1447 = _1294;
    int _1449 = _1248;
    int _1451 = _1254;
    int _1453 = _1296;
    int _1455 = _1403;
    int _1457 = _1351;
    int _1459 = as_type<int>(_1439);
    if (_1170)
    {
        float _1461 = -_1164;
        float _1463 = _1461 + 1.0;
        _1353 = as_type<int>(_1463);
    }
    int _1465 = _1353;
    bool _1467 = false;
    if (_1170)
    {
        bool _1469 = _1188 > 0.5;
        _1467 = _1469;
    }
    bool _1471 = _1467;
    float _1473 = _1435 * _1437;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1477 = _1475 != 0;
    float _1479 = _1439 * _1441;
    if (_1170)
    {
        float _1481 = _1471 ? as_type<float>(_1465) : _1164;
        _1232 = _1481;
    }
    float _1483 = _1232;
    float _1485 = _1443 * _1445;
    int _1487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1489 = _1487 != 0;
    float _1491 = _1439 * _1437;
    int _1493 = int(_1305) + int(_1401);
    float _1495 = floor(_1473);
    int _1497 = ~_1174;
    int _1499 = _1497 + 1;
    float _1501 = in.m_65.y;
    int _1503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1505 = _1503 != 0;
    if (_1178)
    {
        bool _1507 = _1198 > 0.5;
        _1234 = _1507;
    }
    bool _1509 = _1234;
    if (_1178)
    {
        float _1511 = -_1164;
        float _1513 = _1511 + 1.0;
        _1206 = as_type<int>(_1513);
    }
    int _1515 = _1206;
    int _1517 = _1499 * _1493;
    int _1519 = _1517 + _1230;
    if (_1477)
    {
        float _1521 = -_1164;
        float _1523 = _1521 + 1.0;
        _1405 = as_type<int>(_1523);
    }
    int _1525 = _1405;
    bool _1527 = _1166 > 0.5;
    float _1529 = as_type<float>(_1525);
    if (_1489)
    {
        float _1531 = -_1164;
        float _1533 = _1531 + 1.0;
        _1459 = as_type<int>(_1533);
    }
    int _1535 = _1459;
    float _1537 = 0.0;
    if (!_1178)
    {
        _1537 = _1164;
    }
    float _1539 = _1537;
    float _1541 = floor(_1485);
    float _1543 = _1539;
    if (_1178)
    {
        float _1545 = _1509 ? as_type<float>(_1515) : _1164;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = 0.0;
    if (!_1477)
    {
        _1549 = _1164;
    }
    float _1551 = _1549;
    int _1553 = 0;
    float _1555 = _1551;
    if (_1505)
    {
        float _1557 = -_1164;
        float _1559 = _1557 + 1.0;
        _1553 = as_type<int>(_1559);
    }
    int _1561 = _1553;
    bool _1563 = uint(_1519) >= uint(_1174);
    float _1565 = _1276 * _156;
    if (_1477)
    {
        float _1567 = _1527 ? as_type<float>(_1525) : _1164;
        _1555 = _1567;
    }
    float _1569 = _1555;
    float _1571 = floor(_1479);
    if (!_1489)
    {
        _1529 = _1164;
    }
    float _1573 = _1529;
    float _1575 = _1573;
    if (_1489)
    {
        float _1577 = _1527 ? as_type<float>(_1535) : _1164;
        _1575 = _1577;
    }
    float _1579 = _1575;
    bool _1581 = !_1563;
    int _1583 = _1581 ? 0 : (-1);
    if (_1505)
    {
        float _1585 = _1527 ? as_type<float>(_1561) : _1164;
        _1208 = _1585;
    }
    float _1587 = _1208;
    float _1589 = floor(_1491);
    int _1591 = ~_1493;
    int _1593 = _1591 + _1583;
    int _1595 = _1593 + 1;
    float _1597 = _1381 * _156;
    int _1599 = as_type<int>(_1375) + (-2);
    float _1601 = -_1495;
    float _1603 = _1473 + _1601;
    float _1605 = float(uint(_1391));
    int _1607 = _1174 * _1595;
    int _1609 = _1607 + _1230;
    bool _1611 = _1174 == 0;
    float _1613 = trunc(_1565);
    int _1615 = int(_1613);
    float _1617 = -_1541;
    float _1619 = _1485 + _1617;
    float _1621 = as_type<float>(_1599) * _1605;
    float _1623 = -_1571;
    float _1625 = _1479 + _1623;
    int _1627 = ~_1395;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    bool _1633 = !_1611;
    int _1635 = _1633 ? _1609 : (-1);
    float _1637 = _1625 * _1194;
    float _1639 = trunc(_1621);
    float _1641 = precise::max(_1639, 0.0);
    uint _1643 = uint(_1641);
    int _1645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1647 = _1645 != 0;
    float _1649 = -_1589;
    float _1651 = _1491 + _1649;
    int _1653 = _1635 * _1631;
    bool _1655 = !_1647;
    int _1657 = _1655 ? 0 : 1;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1661 = _1659 != 0;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1669 = _1667 != 0;
    float _1671 = trunc(_1597);
    int _1673 = int(_1671);
    int _1675 = abs(_1657);
    int _1677 = ~_1309;
    int _1679 = _1677 + 1;
    bool _1681 = !_1665;
    int _1683 = _1681 ? 0 : 1;
    int _1685 = as_type<int>(_1379) + (-2);
    float _1687 = trunc(_1637);
    int _1689 = int(_1687);
    float _1691 = float(uint(_1615));
    int _1693 = abs(_1683);
    int _1695 = _1679 * int(_1643);
    int _1697 = _1695 + _1391;
    int _1699 = _1174 + (-1);
    float _1701 = as_type<float>(_1685) * _1691;
    int _1703 = as_type<int>(_1383) + (-2);
    float _1705 = float(uint(_1697));
    int _1707 = _1395 * _1699;
    int _1709 = _1707 + _1653;
    float _1711 = float(uint(_1673));
    float _1713 = trunc(_1701);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    bool _1719 = !_1661;
    int _1721 = _1719 ? 0 : 1;
    int _1723 = _1709 * _1693;
    float _1725 = as_type<float>(_1599) * _1705;
    float _1727 = as_type<float>(_1703) * _1711;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1731 = _1729 != 0;
    int _1733 = _1689 * _1675;
    int _1735 = _1733 + _1230;
    bool _1737 = !_1669;
    int _1739 = _1737 ? 0 : 1;
    float _1741 = trunc(_1725);
    float _1743 = precise::max(_1741, 0.0);
    uint _1745 = uint(_1743);
    int _1747 = abs(_1721);
    bool _1749 = !_1731;
    int _1751 = _1749 ? 0 : 1;
    int _1753 = abs(_1739);
    float _1755 = trunc(_1727);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    int _1761 = ~_1331;
    int _1763 = _1761 + 1;
    int _1765 = abs(_1751);
    int _1767 = _1387 * _1747;
    int _1769 = _1767 + _1723;
    int _1771 = _1763 * int(_1717);
    int _1773 = _1771 + _1615;
    int _1775 = ~_1341;
    int _1777 = _1775 + 1;
    float _1779 = _1286 * _156;
    int _1781 = int(_1643) + int(_1745);
    int _1783 = _1735 * _1753;
    int _1785 = _1783 + _1769;
    float _1787 = float(uint(_1773));
    float _1789 = float(_1391);
    int _1791 = _1689 * _1765;
    int _1793 = _1791 + _1785;
    float _1795 = float(_1341);
    float _1797 = as_type<float>(_1685) * _1787;
    int _1799 = _1777 * int(_1759);
    int _1801 = _1799 + _1673;
    float _1803 = float(_1615);
    float _1805 = float(uint(_1793));
    float _1807 = trunc(_1797);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    float _1813 = float(uint(_1801));
    float _1815 = float(_1309);
    int _1817 = ~_1309;
    int _1819 = _1817 + 1;
    float _1821 = as_type<float>(_1703) * _1813;
    float _1823 = float(_1331);
    float _1825 = _1815 * _1603;
    float _1827 = as_type<float>(_1262) * _1805;
    float _1829 = trunc(_1821);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    int _1835 = ~_1174;
    int _1837 = _1835 + 1;
    float _1839 = _1815 * _1779;
    bool _1841 = _1789 >= _1815;
    bool _1843 = isnan(_1789);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(_1815);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1823 * _1619;
    bool _1855 = _1803 >= _1823;
    bool _1857 = isnan(_1803);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1823);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = _1823 * _1779;
    float _1869 = _1795 * _1779;
    float _1871 = trunc(_1827);
    float _1873 = precise::max(_1871, 0.0);
    uint _1875 = uint(_1873);
    float _1877 = float(_1673);
    float _1879 = _1795 * _1651;
    bool _1881 = _1877 >= _1795;
    bool _1883 = isnan(_1877);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(_1795);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    int _1893 = _1819 * _1781;
    int _1895 = _1893 + _1391;
    int _1897 = ~_1331;
    int _1899 = _1897 + 1;
    float _1901 = trunc(_1851);
    int _1903 = int(_1901);
    int _1905 = int(_1717) + int(_1811);
    bool _1907 = uint(_1895) >= uint(_1309);
    int _1909 = int(_1759) + int(_1833);
    int _1911 = _1837 * int(_1875);
    int _1913 = _1911 + _1793;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1917 = _1915 != 0;
    int _1919 = _1899 * _1905;
    int _1921 = _1919 + _1615;
    int _1923 = ~_1341;
    int _1925 = _1923 + 1;
    float _1927 = trunc(_1825);
    int _1929 = int(_1927);
    float _1931 = float(uint(_1913));
    int _1933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1935 = _1933 != 0;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1939 = _1937 != 0;
    int _1941 = _1925 * _1909;
    int _1943 = _1941 + _1673;
    bool _1945 = uint(_1921) >= uint(_1331);
    float _1947 = as_type<float>(_1262) * _1931;
    bool _1949 = !_1917;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = trunc(_1865);
    int _1955 = int(_1953);
    bool _1957 = !_1907;
    int _1959 = _1957 ? 0 : (-1);
    bool _1961 = !_1939;
    int _1963 = _1961 ? 0 : 1;
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1967 = _1965 != 0;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1971 = _1969 != 0;
    bool _1973 = !_1935;
    int _1975 = _1973 ? 0 : 1;
    float _1977 = trunc(_1947);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    bool _1983 = uint(_1943) >= uint(_1341);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1987 = _1985 != 0;
    bool _1989 = !_1945;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = ~_1781;
    int _1995 = _1993 + _1959;
    int _1997 = _1995 + 1;
    float _1999 = trunc(_1869);
    int _2001 = int(_1999);
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2009 = _2007 != 0;
    bool _2011 = !_1987;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1309 * _1997;
    int _2017 = _2015 + _1391;
    bool _2019 = !_1967;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = !_1971;
    int _2025 = _2023 ? 0 : 1;
    float _2027 = trunc(_1879);
    int _2029 = int(_2027);
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2033 = _2031 != 0;
    bool _2035 = _1309 == 0;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2039 = _2037 != 0;
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2043 = _2041 != 0;
    int _2045 = abs(_1951);
    bool _2047 = !_2033;
    int _2049 = _2047 ? 0 : 1;
    bool _2051 = !_1983;
    int _2053 = _2051 ? 0 : (-1);
    int _2055 = _1929 * _2045;
    int _2057 = _2055 + _1391;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2061 = _2059 != 0;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2065 = _2063 != 0;
    int _2067 = ~_1905;
    int _2069 = _2067 + _1991;
    int _2071 = _2069 + 1;
    int _2073 = ~_1903;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2035;
    int _2081 = _2079 ? _2017 : (-1);
    int _2083 = _1331 * _2071;
    int _2085 = _2083 + _1615;
    int _2087 = int(_1875) + int(_1981);
    float _2089 = trunc(_1891);
    int _2091 = int(_2089);
    int _2093 = ~_1174;
    int _2095 = _2093 + 1;
    int _2097 = _2077 * _2081;
    bool _2099 = !_2065;
    int _2101 = _2099 ? 0 : 1;
    bool _2103 = _1331 == 0;
    int _2105 = _2095 * _2087;
    int _2107 = _2105 + _1793;
    int _2109 = _1309 + (-1);
    int _2111 = ~_1955;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    bool _2117 = !_2103;
    int _2119 = _2117 ? _2085 : (-1);
    int _2121 = _1903 * _2109;
    int _2123 = _2121 + _2097;
    int _2125 = ~_1909;
    int _2127 = _2125 + _2053;
    int _2129 = _2127 + 1;
    float _2131 = trunc(_1839);
    int _2133 = int(_2131);
    bool _2135 = !_2043;
    int _2137 = _2135 ? 0 : 1;
    int _2139 = _2115 * _2119;
    int _2141 = abs(_1963);
    int _2143 = _1341 * _2129;
    int _2145 = _2143 + _1673;
    bool _2147 = uint(_2107) >= uint(_1174);
    int _2149 = abs(_1975);
    float _2151 = trunc(_1853);
    int _2153 = int(_2151);
    bool _2155 = !_2039;
    int _2157 = _2155 ? 0 : 1;
    bool _2159 = !_2147;
    int _2161 = _2159 ? 0 : (-1);
    int _2163 = _2123 * _2141;
    bool _2165 = !_2005;
    int _2167 = _2165 ? 0 : 1;
    float _2169 = trunc(_1867);
    int _2171 = int(_2169);
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2175 = _2173 != 0;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2179 = _2177 != 0;
    bool _2181 = _1341 == 0;
    int _2183 = abs(_2021);
    int _2185 = _1331 + (-1);
    int _2187 = ~_2091;
    int _2189 = _2187 + 1;
    int _2191 = _2189 + 1;
    int _2193 = _1955 * _2185;
    int _2195 = _2193 + _2139;
    bool _2197 = !_2181;
    int _2199 = _2197 ? _2145 : (-1);
    int _2201 = _2133 * _2149;
    int _2203 = _2201 + _2163;
    float _2205 = _1441 * 2.0;
    int _2207 = abs(_2025);
    int _2209 = _2191 * _2199;
    int _2211 = abs(_2013);
    int _2213 = _2057 * _2183;
    int _2215 = _2213 + _2203;
    float _2217 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2219 = !_2009;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = abs(_2167);
    int _2225 = _1929 * _2207;
    int _2227 = _2225 + _2215;
    int _2229 = abs(_2221);
    float _2231 = float(uint(_2227));
    int _2233 = _2195 * _2229;
    int _2235 = abs(_2049);
    float _2237 = as_type<float>(_1599) * _2231;
    int _2239 = abs(_2157);
    int _2241 = _2171 * _2223;
    int _2243 = _2241 + _2233;
    float _2245 = trunc(_2237);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    int _2251 = _2153 * _2211;
    int _2253 = _2251 + _1615;
    int _2255 = abs(_2137);
    int _2257 = _2253 * _2235;
    int _2259 = _2257 + _2243;
    bool _2261 = !_2061;
    int _2263 = _2261 ? 0 : 1;
    int _2265 = _1341 + (-1);
    int _2267 = _2153 * _2239;
    int _2269 = _2267 + _2259;
    int _2271 = abs(_2101);
    int _2273 = ~_1309;
    int _2275 = _2273 + 1;
    int _2277 = _2091 * _2265;
    int _2279 = _2277 + _2209;
    int _2281 = abs(_2263);
    int _2283 = _2275 * int(_2249);
    int _2285 = _2283 + _2227;
    bool _2287 = !_2175;
    int _2289 = _2287 ? 0 : 1;
    int _2291 = _2279 * _2271;
    int _2293 = _2029 * _2255;
    int _2295 = _2293 + _1673;
    int _2297 = ~_2087;
    int _2299 = _2297 + _2161;
    int _2301 = _2299 + 1;
    float _2303 = float(uint(_2269));
    int _2305 = _2001 * _2281;
    int _2307 = _2305 + _2291;
    float _2309 = float(uint(_2285));
    int _2311 = _1174 * _2301;
    int _2313 = _2311 + _1793;
    bool _2315 = !_2179;
    int _2317 = _2315 ? 0 : 1;
    float _2319 = as_type<float>(_1685) * _2303;
    int _2321 = abs(_2289);
    float _2323 = as_type<float>(_1599) * _2309;
    int _2325 = abs(_2317);
    float _2327 = trunc(_2319);
    float _2329 = precise::max(_2327, 0.0);
    uint _2331 = uint(_2329);
    bool _2333 = _1174 == 0;
    int _2335 = _2295 * _2321;
    int _2337 = _2335 + _2307;
    float _2339 = -_1501;
    float _2341 = _2339 + 1.0;
    bool _2343 = _1315 > 0.5;
    float _2345 = trunc(_2323);
    float _2347 = precise::max(_2345, 0.0);
    uint _2349 = uint(_2347);
    bool _2351 = !_2333;
    int _2353 = _2351 ? _2313 : (-1);
    int _2355 = _2029 * _2325;
    int _2357 = _2355 + _2337;
    int _2359 = _2343 ? as_type<int>(_2341) : as_type<int>(_1501);
    int _2361 = _2353 & 3;
    bool _2363 = _2361 != 0;
    int _2365 = _2353 & 3;
    bool _2367 = _2365 != 0;
    int _2369 = ~_1331;
    int _2371 = _2369 + 1;
    float _2373 = float(uint(_2357));
    int _2375 = _2363 ? 0 : 1;
    int _2377 = _2371 * int(_2331);
    int _2379 = _2377 + _2269;
    bool _2381 = uint(_2365) > 1u;
    float _2383 = as_type<float>(_1703) * _2373;
    int _2385 = int(_2249) + int(_2349);
    int _2387 = ~_1309;
    int _2389 = _2387 + 1;
    float _2391 = trunc(_2383);
    float _2393 = precise::max(_2391, 0.0);
    uint _2395 = uint(_2393);
    float _2397 = float(uint(_2379));
    int _2399 = ~_2375;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    float _2405 = as_type<float>(_1685) * _2397;
    int _2407 = ~_1341;
    int _2409 = _2407 + 1;
    int _2411 = _2389 * _2385;
    int _2413 = _2411 + _2227;
    int _2415 = _2403;
    if (!_2381)
    {
        int _2417 = ~_2375;
        int _2419 = _2417 + 1;
        _2415 = _2419;
    }
    int _2421 = _2415;
    float _2423 = trunc(_2405);
    float _2425 = precise::max(_2423, 0.0);
    uint _2427 = uint(_2425);
    bool _2429 = uint(_2365) >= 2u;
    bool _2431 = _1166 > 0.5;
    int _2433 = _2429 ? 0 : 1;
    int _2435 = _2409 * int(_2395);
    int _2437 = _2435 + _2357;
    bool _2439 = uint(_2413) >= uint(_1309);
    int _2441 = ~_2433;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    bool _2447 = !_2439;
    int _2449 = _2447 ? 0 : (-1);
    bool _2451 = _2365 != 3;
    float _2453 = float(uint(_2437));
    int _2455 = ~_1331;
    int _2457 = _2455 + 1;
    int _2459 = int(_2331) + int(_2427);
    float _2461 = as_type<float>(_1703) * _2453;
    int _2463 = ~_2385;
    int _2465 = _2463 + _2449;
    int _2467 = _2465 + 1;
    float _2469 = trunc(_2461);
    float _2471 = precise::max(_2469, 0.0);
    uint _2473 = uint(_2471);
    int _2475 = _2457 * _2459;
    int _2477 = _2475 + _2269;
    int _2479 = _2445;
    if (_2451)
    {
        int _2481 = ~_2433;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _1309 * _2467;
    int _2489 = _2487 + _2227;
    int _2491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2493 = _2491 != 0;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2499 = !_2493;
    int _2501 = _2499 ? 0 : 1;
    bool _2503 = uint(_2477) >= uint(_1331);
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2507 = _2505 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2509 = !_2035;
    int _2511 = _2509 ? _2489 : (-1);
    float _2513 = 1.0 / _2497;
    bool _2515 = !_2503;
    int _2517 = _2515 ? 0 : (-1);
    int _2519 = _2511 & 3;
    bool _2521 = _2519 != 0;
    int _2523 = ~_2459;
    int _2525 = _2523 + _2517;
    int _2527 = _2525 + 1;
    int _2529 = _2431 ? as_type<int>(_2341) : as_type<int>(_1501);
    float _2531 = 1.0 / _2507;
    bool _2533 = uint(_2519) >= 2u;
    int _2535 = _1331 * _2527;
    int _2537 = _2535 + _2269;
    int _2539 = _2521 ? 0 : 1;
    bool _2541 = _2519 != 3;
    int _2543 = int(_2395) + int(_2473);
    int _2545 = _2533 ? 0 : 1;
    int _2547 = ~_1341;
    int _2549 = _2547 + 1;
    bool _2551 = uint(_2519) > 1u;
    int _2553 = ~_2545;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    int _2559 = _2549 * _2543;
    int _2561 = _2559 + _2357;
    bool _2563 = !_2103;
    int _2565 = _2563 ? _2537 : (-1);
    int _2567 = _2557;
    if (_2541)
    {
        int _2569 = ~_2545;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    bool _2575 = uint(_2561) >= uint(_1341);
    int _2577 = ~_2539;
    int _2579 = _2577 + 1;
    int _2581 = _2579 + 1;
    bool _2583 = !_2575;
    int _2585 = _2583 ? 0 : (-1);
    int _2587 = _2581;
    if (!_2551)
    {
        int _2589 = ~_2539;
        int _2591 = _2589 + 1;
        _2587 = _2591;
    }
    int _2593 = _2587;
    int _2595 = _2565 & 3;
    bool _2597 = _2595 != 0;
    int _2599 = ~_2543;
    int _2601 = _2599 + _2585;
    int _2603 = _2601 + 1;
    bool _2605 = _2595 != 3;
    int _2607 = _2597 ? 0 : 1;
    int _2609 = _1341 * _2603;
    int _2611 = _2609 + _2357;
    bool _2613 = uint(_2595) >= 2u;
    int _2615 = ~_2607;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2613 ? 0 : 1;
    bool _2623 = uint(_2595) > 1u;
    bool _2625 = !_2181;
    int _2627 = _2625 ? _2611 : (-1);
    int _2629 = ~_2621;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    int _2635 = _2633;
    int _2637 = _2619;
    if (_2605)
    {
        int _2639 = ~_2621;
        int _2641 = _2639 + 1;
        _2635 = _2641;
    }
    int _2643 = _2635;
    int _2645 = _2627 & 3;
    bool _2647 = _2645 != 0;
    int _2649 = _2647 ? 0 : 1;
    bool _2651 = uint(_2645) >= 2u;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (!_2623)
    {
        int _2655 = ~_2607;
        int _2657 = _2655 + 1;
        _2637 = _2657;
    }
    int _2659 = _2637;
    bool _2661 = _2645 != 3;
    float _2663 = fma(_2217, -2.0, _2653);
    int _2665 = _2651 ? 0 : 1;
    bool _2667 = uint(_2645) > 1u;
    float _2669 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2663);
    int _2671 = ~_2665;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    int _2677 = ~_2649;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2675;
    int _2685 = _2681;
    if (_2661)
    {
        int _2687 = ~_2665;
        int _2689 = _2687 + 1;
        _2683 = _2689;
    }
    int _2691 = _2683;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    if (!_2667)
    {
        int _2701 = ~_2649;
        int _2703 = _2701 + 1;
        _2685 = _2703;
    }
    int _2705 = _2685;
    int _2707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2709 = _2707 != 0;
    out.m_67.x = (*spvDescriptorSet0.vp_c9)._m0[175].x;
    int _2711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2713 = _2711 != 0;
    float _2715 = 1.0 / _2695;
    bool _2717 = !_2709;
    int _2719 = _2717 ? 0 : 1;
    float _2721 = in.m_46.x;
    float _2723 = in.m_46.y;
    float _2725 = in.m_46.z;
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2729 = _2727 != 0;
    bool _2731 = !_2713;
    int _2733 = _2731 ? 0 : 1;
    float _2735 = _2729 ? as_type<float>(_2529) : _1501;
    float _2737 = 1.0 / _2699;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2741 = _2739 != 0;
    bool _2743 = _1447 > 0.5;
    float _2745 = _2741 ? as_type<float>(_2359) : _1501;
    int _2747 = _2743 ? as_type<int>(_2341) : as_type<int>(_1501);
    int _2749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2751 = _2749 != 0;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2755 = _2753 != 0;
    float _2757 = _2751 ? as_type<float>(_2747) : _1501;
    float _2759 = _2755 ? as_type<float>(_2747) : _1501;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2763 = _2761 != 0;
    float _2765 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2769 = _2767 != 0;
    float _2771 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2773 = floor(_2205);
    float _2775 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2777 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2765);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2785 = _2783 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2787 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2771);
    float _2789 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2775);
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2799 = 1.0 / _2781;
    float _2801 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2801;
    float _2805 = _2769 ? as_type<float>(_2747) : _1501;
    float _2807 = _2797 * _2513;
    bool _2809 = _2773 >= 0.0;
    bool _2811 = isnan(_2773);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan(0.0);
    bool _2817 = _2813 || _2815;
    float _2819 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2821 = _2819 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2823 = _2803 * _2531;
    float _2825 = 1.0 / _2785;
    int _2827 = _2817 ? 0 : 1;
    float _2829 = _1166 * 2.0;
    bool _2831 = _2773 > 0.0;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2833;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2841 = _2793 * _2715;
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2845 = _2843 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2847 = 1.0 / _2821;
    float _2849 = _2835 * _2737;
    float _2851 = _2839 * _2799;
    bool _2853 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2855 = isnan(_1156);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2861 = _2857 || _2859;
    float _2863 = float(_2861);
    float _2865 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2787);
    bool _2867 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2869 = isnan(_1156);
    bool _2871 = _2867 || _2869;
    bool _2873 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2875 = _2871 || _2873;
    float _2877 = float(_2875);
    float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2881 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2879;
    float _2883 = floor(_2829);
    float _2885 = _2845 * _2825;
    bool _2887 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2889 = isnan(_1156);
    bool _2891 = _2887 || _2889;
    bool _2893 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2895 = _2891 || _2893;
    float _2897 = float(_2895);
    float _2899 = -_2863;
    float _2901 = _2899 + 1.0;
    int _2903 = ~_2827;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2789);
    int _2911 = _2907;
    if (!_2831)
    {
        int _2913 = ~_2827;
        int _2915 = _2913 + 1;
        _2911 = _2915;
    }
    int _2917 = _2911;
    float _2919 = -_2897;
    float _2921 = _2919 + 1.0;
    bool _2923 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2925 = isnan(_1156);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2931 = _2927 || _2929;
    float _2933 = float(_2931);
    float _2935 = _2881 * _2847;
    float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2939 = _1156 + _2937;
    float _2941 = _2863 * _2921;
    bool _2943 = !_2763;
    int _2945 = _2943 ? 0 : 1;
    float _2947 = _2933 * _2901;
    float _2949 = -_2933;
    float _2951 = _2949 + 1.0;
    float _2953 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2777);
    bool _2955 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2957 = isnan(_1156);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2963 = _2959 || _2961;
    float _2965 = float(_2963);
    float _2967 = -_2877;
    float _2969 = _2967 + 1.0;
    bool _2971 = _2883 > 0.0;
    float _2973 = fma(_2841, _2939, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2975 = _2883 >= 0.0;
    bool _2977 = isnan(_2883);
    bool _2979 = _2975 || _2977;
    bool _2981 = isnan(0.0);
    bool _2983 = _2979 || _2981;
    float _2985 = _2877 * _2951;
    float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2989 = _1156 + _2987;
    bool _2991 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2993 = isnan(_1156);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2999 = _2995 || _2997;
    float _3001 = float(_2999);
    float _3003 = -_2965;
    float _3005 = _3003 + 1.0;
    bool _3007 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3009 = isnan(_1156);
    bool _3011 = _3007 || _3009;
    bool _3013 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3015 = _3011 || _3013;
    float _3017 = float(_3015);
    float _3019 = fma(_2807, _2989, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3021 = _2965 * _2969;
    float _3023 = -_3001;
    float _3025 = _3023 + 1.0;
    float _3027 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3029 = _1156 + _3027;
    float _3031 = _3001 * _3005;
    bool _3033 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3035 = isnan(_1156);
    bool _3037 = _3033 || _3035;
    bool _3039 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3041 = _3037 || _3039;
    float _3043 = float(_3041);
    float _3045 = -_3017;
    float _3047 = _3045 + 1.0;
    float _3049 = _3017 * _3025;
    float _3051 = fma(_2823, _3029, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3053 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3055 = _1156 + _3053;
    float _3057 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3059 = _1156 + _3057;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3063 = _1156 + _3061;
    float _3065 = _3043 * _3047;
    float _3067 = fma(_2849, _3055, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3069 = fma(_2885, _3059, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3071 = fma(_2851, _3063, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    int _3073 = _2983 ? 0 : 1;
    float _3075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3077 = _2973 * _3065;
    bool _3079 = _1449 != 1;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3083 = _1156 + _3081;
    float _3085 = float(uint(_1735));
    float _3087 = -_3043;
    float _3089 = _3087 + 1.0;
    float _3091 = float(uint(_2057));
    float _3093 = fma(_2935, _3083, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3095 = float(uint(_2253));
    float _3097 = as_type<float>(_1262) * _3085;
    float _3099 = fma(_3089, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3077);
    float _3101 = as_type<float>(_1599) * _3091;
    int _3103 = ~_3073;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = trunc(_3097);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = as_type<float>(_1685) * _3095;
    int _3117 = _3107;
    float _3119 = _3091;
    float _3121 = _3089;
    float _3123 = _3099;
    if (!_2971)
    {
        int _3125 = ~_3073;
        int _3127 = _3125 + 1;
        _3117 = _3127;
    }
    int _3129 = _3117;
    float _3131 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3133 = fma(_3019, _3049, _3099);
    float _3135 = float(uint(_2295));
    float _3137 = _2865 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3139 = fma(_3131, _1587, -0.5);
    float _3141 = trunc(_3101);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    int _3147 = ~_1174;
    int _3149 = _3147 + 1;
    float _3151 = as_type<float>(_1703) * _3135;
    int _3153 = ~_1309;
    int _3155 = _3153 + 1;
    float _3157 = fma(_3051, _3031, _3133);
    int _3159 = ~_1331;
    int _3161 = _3159 + 1;
    float _3163 = _2953 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3165 = _1451 != 2;
    float _3167 = trunc(_3115);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    float _3173 = _2909 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3177 = !_3079;
    float _3179 = _3177 ? as_type<float>(_1453) : as_type<float>(_1455);
    int _3181 = _3155 * int(_3145);
    int _3183 = _3181 + _2057;
    float _3185 = trunc(_3151);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    int _3191 = _3149 * int(_3113);
    int _3193 = _3191 + _1735;
    float _3195 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3199 = float(uint(_3183));
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3203 = float(uint(_3193));
    int _3205 = _3161 * int(_3171);
    int _3207 = _3205 + _2253;
    float _3209 = -_3175;
    float _3211 = fma(_3195, 2.0, _3209);
    float _3213 = as_type<float>(_1599) * _3199;
    int _3215 = ~_1341;
    int _3217 = _3215 + 1;
    float _3219 = as_type<float>(_1262) * _3203;
    float _3221 = float(uint(_3207));
    float _3223 = fma(as_type<float>(_1455), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3197);
    float _3225 = as_type<float>(_1455) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3227 = !_3079;
    float _3229 = _3227 ? as_type<float>(_1457) : as_type<float>(_1453);
    int _3231 = _3217 * int(_3189);
    int _3233 = _3231 + _2295;
    float _3235 = as_type<float>(_1685) * _3221;
    float _3237 = trunc(_3219);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = fma(as_type<float>(_1453), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3201);
    float _3245 = as_type<float>(_1453) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3247 = float(uint(_3233));
    float _3249 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3223);
    float _3251 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3243);
    float _3253 = trunc(_3213);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = as_type<float>(_1703) * _3247;
    float _3261 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3263 = _3075;
    float _3265 = _3225;
    if (!_3079)
    {
        _3263 = _1447;
    }
    float _3267 = _3263;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3271 = _3267;
    if (_3079)
    {
        _3271 = _1166;
    }
    float _3273 = _3271;
    float _3275 = -_3261;
    float _3277 = fma(_3225, 2.0, _3275);
    if (_3165)
    {
        _3265 = _1441;
    }
    float _3279 = _3265;
    float _3281 = trunc(_3235);
    float _3283 = precise::max(_3281, 0.0);
    uint _3285 = uint(_3283);
    float _3287 = fma(_3069, _3021, _3157);
    int _3289 = ~_1174;
    int _3291 = _3289 + 1;
    float _3293 = fma(_3245, -2.0, _3269);
    int _3295 = int(_3113) + int(_3241);
    float _3297 = fma(_3067, _2985, _3287);
    float _3299 = -_156;
    float _3301 = fma(_3299, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3211);
    int _3303 = int(_3145) + int(_3257);
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3307 = ~_1309;
    int _3309 = _3307 + 1;
    int _3311 = _3291 * _3295;
    int _3313 = _3311 + _1735;
    float _3315 = as_type<float>(_3291);
    float _3317 = _3279;
    if (_3165)
    {
        _3315 = _1166;
    }
    float _3319 = _3315;
    float _3321 = fma(_3071, _2947, _3297);
    float _3323 = _3319;
    if (!_3165)
    {
        _3317 = _1447;
    }
    float _3325 = _3317;
    int _3327 = _3309 * _3303;
    int _3329 = _3327 + _2057;
    if (!_3165)
    {
        _3323 = _1441;
    }
    float _3331 = _3323;
    float _3333 = trunc(_3259);
    float _3335 = precise::max(_3333, 0.0);
    uint _3337 = uint(_3335);
    bool _3339 = uint(_3313) >= uint(_1174);
    float _3341 = _1166 + _1441;
    int _3343 = int(_3171) + int(_3285);
    float _3345 = _3325 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3347 = ~_1331;
    int _3349 = _3347 + 1;
    float _3351 = _3341 + (-1.0);
    bool _3353 = !_3339;
    int _3355 = _3353 ? 0 : (-1);
    float _3357 = _3331 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3359 = uint(_3329) >= uint(_1309);
    int _3361 = _3349 * _3343;
    int _3363 = _3361 + _2253;
    float _3365 = fma(_3093, _2941, _3321);
    if (!_3079)
    {
        _3119 = _1166;
    }
    float _3367 = _3119;
    float _3369 = -_156;
    float _3371 = fma(_3369, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3277);
    float _3373 = _3367;
    if (!_3079)
    {
        _3121 = _1166;
    }
    float _3375 = _3121;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3379 = int(_3189) + int(_3337);
    float _3381 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3293);
    int _3383 = ~_1341;
    int _3385 = _3383 + 1;
    float _3387 = fma(_2897, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3365);
    bool _3389 = !_3359;
    int _3391 = _3389 ? 0 : (-1);
    bool _3393 = uint(_3363) >= uint(_1331);
    float _3395 = _1447 * 2.0;
    int _3397 = ~_3303;
    int _3399 = _3397 + _3391;
    int _3401 = _3399 + 1;
    float _3403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3405 = _3163 + _3403;
    bool _3407 = !_3393;
    int _3409 = _3407 ? 0 : (-1);
    int _3411 = _3385 * _3379;
    int _3413 = _3411 + _2295;
    float _3415 = _3375;
    if (!_3079)
    {
        _3123 = _1447;
    }
    float _3417 = _3123;
    float _3419 = floor(_3395);
    int _3421 = _1309 * _3401;
    int _3423 = _3421 + _2057;
    int _3425 = ~_3343;
    int _3427 = _3425 + _3409;
    int _3429 = _3427 + 1;
    out.m_69.x = _3387;
    bool _3431 = uint(_3413) >= uint(_1341);
    float _3433 = _3417;
    if (_3079)
    {
        _3373 = _1441;
    }
    float _3435 = _3373;
    bool _3437 = !_3431;
    int _3439 = _3437 ? 0 : (-1);
    if (_3079)
    {
        _3415 = _1441;
    }
    float _3441 = _3415;
    int _3443 = ~_3379;
    int _3445 = _3443 + _3439;
    int _3447 = _3445 + 1;
    int _3449 = _1331 * _3429;
    int _3451 = _3449 + _2253;
    float _3453 = _3273 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3455 = _2353 >> 31;
    float _3457 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3459 = int(_3457);
    if (_3079)
    {
        _3433 = _1166;
    }
    float _3461 = _3433;
    float _3463 = fma(_3453, -2.0, _3377);
    int _3465 = _3455 & 3;
    int _3467 = _1341 * _3447;
    int _3469 = _3467 + _2295;
    bool _3471 = _3419 > 0.0;
    float _3473 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3463);
    bool _3475 = _3419 >= 0.0;
    bool _3477 = isnan(_3419);
    bool _3479 = _3475 || _3477;
    bool _3481 = isnan(0.0);
    bool _3483 = _3479 || _3481;
    float _3485 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _3487 = _2353 + _3465;
    float _3489 = fma(_3485, _2805, -0.5);
    int _3491 = ~_3295;
    int _3493 = _3491 + _3355;
    int _3495 = _3493 + 1;
    float _3497 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3499 = _3137 + _3497;
    int _3501 = _3487 >> 2;
    float _3503 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3505 = _2511 >> 31;
    float _3507 = _3435 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3509 = _3499 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3511 = _1174 * _3495;
    int _3513 = _3511 + _1735;
    int _3515 = _3505 & 3;
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3519 = _3173 + _3517;
    float _3521 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3509);
    int _3523 = _2627 >> 31;
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3527 = _2511 + _3515;
    float _3529 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3521);
    int _3531 = _3523 & 3;
    float _3533 = -_3525;
    float _3535 = fma(_3345, 2.0, _3533);
    bool _3537 = !_2181;
    int _3539 = _3537 ? _3469 : (-1);
    float _3541 = -_156;
    float _3543 = fma(_3541, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3535);
    int _3545 = _2565 >> 31;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3549 = _3527 >> 2;
    bool _3551 = !_2333;
    int _3553 = _3551 ? _3513 : (-1);
    float _3555 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3547);
    int _3557 = _2627 + _3531;
    bool _3559 = _3529 >= 0.0;
    float _3561 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3555);
    bool _3563 = _2519 != 3;
    int _3565 = _3545 & 3;
    int _3567 = _3549 << 4;
    int _3569 = _3567 + 512;
    float _3571 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _3573 = !_2103;
    int _3575 = _3573 ? _3451 : (-1);
    int _3577 = _3501 << 4;
    int _3579 = _3577 + 368;
    float _3581 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3571);
    bool _3583 = _2365 != 3;
    float _3585 = _3229 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3587 = _3557 >> 2;
    uint _3589 = uint(int(uint(_3579) >> uint(2)));
    uint _3591 = uint(int(uint(int(_3589)) >> uint(2)));
    int _3593 = int(_3589) & 3;
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[int(_3591)][_3593];
    int _3597 = int(_3589) + 1;
    uint _3599 = uint(int(uint(_3597) >> uint(2)));
    int _3601 = _3597 & 3;
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[int(_3599)][_3601];
    float _3605 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3581);
    int _3607 = _2565 + _3565;
    float _3609 = as_type<float>(_3545);
    if (_3559)
    {
        out.m_49.x = 0.0;
    }
    bool _3611 = !_2035;
    int _3613 = _3611 ? _3423 : (-1);
    float _3615 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _3617 = uint(int(uint(_3569) >> uint(2)));
    uint _3619 = uint(int(uint(int(_3617)) >> uint(2)));
    int _3621 = int(_3617) & 3;
    float _3623 = (*spvDescriptorSet0.vp_c9)._m0[int(_3619)][_3621];
    int _3625 = int(_3617) + 1;
    uint _3627 = uint(int(uint(_3625) >> uint(2)));
    int _3629 = _3625 & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    float _3633 = -_3615;
    float _3635 = fma(_3507, 2.0, _3633);
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3639 = _3607 >> 2;
    float _3641 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3643 = !_2367;
    int _3645 = _3643 ? 0 : 1;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3649 = fma(_3461, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3637);
    int _3651 = _2565 & 3;
    bool _3653 = _3651 != 0;
    float _3655 = fma(_3585, -2.0, _3641);
    int _3657 = _3639 << 4;
    int _3659 = _3657 + 656;
    float _3661 = fma(_3179, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3647);
    int _3663 = _3587 << 4;
    int _3665 = _3663 + 800;
    float _3667 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3669 = _3179 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3671 = _2511 & 3;
    bool _3673 = _3671 != 0;
    float _3675 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3661);
    bool _3677 = !_3653;
    int _3679 = _3677 ? 0 : 1;
    uint _3681 = uint(int(uint(_3659) >> uint(2)));
    uint _3683 = uint(int(uint(int(_3681)) >> uint(2)));
    int _3685 = int(_3681) & 3;
    float _3687 = (*spvDescriptorSet0.vp_c9)._m0[int(_3683)][_3685];
    int _3689 = int(_3681) + 1;
    uint _3691 = uint(int(uint(_3689) >> uint(2)));
    int _3693 = _3689 & 3;
    float _3695 = (*spvDescriptorSet0.vp_c9)._m0[int(_3691)][_3693];
    int _3697 = _2627 & 3;
    bool _3699 = _3697 != 0;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_3559)
    {
        _3609 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3703 = _3609;
    float _3705 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3655);
    float _3707 = -_3667;
    float _3709 = fma(_3669, 2.0, _3707);
    int _3711 = abs(_2421);
    float _3713 = fma(_3357, -2.0, _3701);
    uint _3715 = uint(int(uint(_3665) >> uint(2)));
    uint _3717 = uint(int(uint(int(_3715)) >> uint(2)));
    int _3719 = int(_3715) & 3;
    float _3721 = (*spvDescriptorSet0.vp_c9)._m0[int(_3717)][_3719];
    int _3723 = int(_3715) + 1;
    uint _3725 = uint(int(uint(_3723) >> uint(2)));
    int _3727 = _3723 & 3;
    float _3729 = (*spvDescriptorSet0.vp_c9)._m0[int(_3725)][_3727];
    float _3731 = -_156;
    float _3733 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3709);
    int _3735 = as_type<int>(_3703);
    if (_3559)
    {
        float _3737 = _3703 * 5.0;
        _3735 = as_type<int>(_3737);
    }
    int _3739 = _3735;
    int _3741 = abs(_2593);
    float _3743 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3649);
    float _3745 = fma(_3675, _3139, _3733);
    int _3747 = abs(_2705);
    int _3749 = _3579 + 8;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    uint _3753 = uint(int(uint(int(_3751)) >> uint(2)));
    int _3755 = int(_3751) & 3;
    float _3757 = (*spvDescriptorSet0.vp_c9)._m0[int(_3753)][_3755];
    int _3759 = int(_3751) + 1;
    uint _3761 = uint(int(uint(_3759) >> uint(2)));
    int _3763 = _3759 & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    if (_3559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12021 = as_type<float>(_3739);
        out.gl_Position.z = _12021;
    }
    float _3767 = -_156;
    float _3769 = fma(_3767, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3635);
    bool _3771 = !_3673;
    int _3773 = _3771 ? 0 : 1;
    float _3775 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3713);
    int _3777 = abs(_3645);
    float _3779 = -_3705;
    float _3781 = fma(_3605, _3489, _3779);
    int _3783 = _3569 + 8;
    uint _3785 = uint(int(uint(_3783) >> uint(2)));
    uint _3787 = uint(int(uint(int(_3785)) >> uint(2)));
    int _3789 = int(_3785) & 3;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[int(_3787)][_3789];
    int _3793 = int(_3785) + 1;
    uint _3795 = uint(int(uint(_3793) >> uint(2)));
    int _3797 = _3793 & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    int _3801 = abs(_2659);
    int _3803 = abs(_3773);
    int _3805 = ~_3741;
    int _3807 = _3805 + 1;
    int _3809 = _3807 + 1;
    int _3811 = _3659 + 8;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = ~_3711;
    int _3831 = _3829 + 1;
    int _3833 = _3831 + 1;
    int _3835 = _3809 * as_type<int>(_3631);
    bool _3837 = !_3699;
    int _3839 = _3837 ? 0 : 1;
    int _3841 = _3665 + 8;
    uint _3843 = uint(int(uint(_3841) >> uint(2)));
    uint _3845 = uint(int(uint(int(_3843)) >> uint(2)));
    int _3847 = int(_3843) & 3;
    float _3849 = (*spvDescriptorSet0.vp_c9)._m0[int(_3845)][_3847];
    int _3851 = int(_3843) + 1;
    uint _3853 = uint(int(uint(_3851) >> uint(2)));
    int _3855 = _3851 & 3;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[int(_3853)][_3855];
    int _3859 = ~_3777;
    int _3861 = _3859 + 1;
    int _3863 = _3861 + 1;
    int _3865 = _3833 * as_type<int>(_3603);
    int _3867 = ~_3803;
    int _3869 = _3867 + 1;
    int _3871 = _3869 + 1;
    float _3873 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3875 = int(_3873);
    bool _3877 = _2595 != 3;
    int _3879 = _3863 * as_type<int>(_3595);
    int _3881 = _3879 + _3865;
    bool _3883 = !_3583;
    int _3885 = _3883 ? 0 : (-1);
    int _3887 = _3871 * as_type<int>(_3623);
    int _3889 = _3887 + _3835;
    bool _3891 = _2645 != 3;
    int _3893 = abs(_3839);
    bool _3895 = !_3563;
    int _3897 = _3895 ? 0 : (-1);
    bool _3899 = !_3877;
    int _3901 = _3899 ? 0 : (-1);
    int _3903 = ~_3801;
    int _3905 = _3903 + 1;
    int _3907 = _3905 + 1;
    int _3909 = abs(_2485);
    int _3911 = abs(_2573);
    int _3913 = _3907 * as_type<int>(_3695);
    int _3915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3917 = _3915 != 0;
    int _3919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3921 = _3919 != 0;
    int _3923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3925 = _3923 != 0;
    int _3927 = ~_3747;
    int _3929 = _3927 + 1;
    int _3931 = _3929 + 1;
    float _3933 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3935 = int(_3933);
    int _3937 = ~_3909;
    int _3939 = _3937 + 1;
    int _3941 = _3939 + 1;
    int _3943 = _3931 * as_type<int>(_3729);
    int _3945 = ~_3893;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    int _3951 = ~_3911;
    int _3953 = _3951 + 1;
    int _3955 = _3953 + 1;
    int _3957 = _3941 * as_type<int>(_3757);
    int _3959 = _3957 + _3881;
    int _3961 = abs(_3679);
    int _3963 = _3949 * as_type<int>(_3721);
    int _3965 = _3963 + _3943;
    int _3967 = abs(_2643);
    int _3969 = _3955 * as_type<int>(_3791);
    int _3971 = _3969 + _3889;
    int _3973 = ~_3961;
    int _3975 = _3973 + 1;
    int _3977 = _3975 + 1;
    float _3979 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3981 = int(_3979);
    int _3983 = abs(_2691);
    int _3985 = abs(_3897);
    int _3987 = _3977 * as_type<int>(_3687);
    int _3989 = _3987 + _3913;
    float _3991 = float(uint(_3459));
    int _3993 = ~_3967;
    int _3995 = _3993 + 1;
    int _3997 = _3995 + 1;
    float _3999 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4001 = log2(_3999);
    int _4003 = ~_3983;
    int _4005 = _4003 + 1;
    int _4007 = _4005 + 1;
    int _4009 = ~_3985;
    int _4011 = _4009 + 1;
    int _4013 = _4011 + 1;
    int _4015 = _3997 * as_type<int>(_3819);
    int _4017 = _4015 + _3989;
    int _4019 = abs(_3885);
    int _4021 = _4007 * as_type<int>(_3849);
    int _4023 = _4021 + _3965;
    float _4025 = float(uint(_3935));
    float _4027 = 1.0 / _3991;
    int _4029 = _4013 * as_type<int>(_3799);
    int _4031 = _4029 + _3971;
    int _4033 = ~_4019;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = float(uint(_3875));
    int _4041 = abs(_3901);
    int _4043 = _4037 * as_type<int>(_3765);
    int _4045 = _4043 + _3959;
    int _4047 = abs(_2501);
    float _4049 = 1.0 / _4025;
    int _4051 = abs(_2733);
    float _4053 = _4001 * _156;
    int _4055 = ~_4041;
    int _4057 = _4055 + 1;
    int _4059 = _4057 + 1;
    int _4061 = ~_4047;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    bool _4067 = !_3891;
    int _4069 = _4067 ? 0 : (-1);
    float _4071 = 1.0 / _4039;
    int _4073 = abs(_2719);
    int _4075 = _4059 * as_type<int>(_3827);
    int _4077 = _4075 + _4017;
    int _4079 = abs(_4069);
    int _4081 = _4045 * _4065;
    int _4083 = ~_4073;
    int _4085 = _4083 + 1;
    int _4087 = _4085 + 1;
    int _4089 = as_type<int>(_4027) + (-2);
    int _4091 = _3553 * _4047;
    int _4093 = _4091 + _4081;
    int _4095 = ~_4051;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = _4087 * _4077;
    float _4103 = exp2(_4053);
    float _4105 = float(uint(_4093));
    int _4107 = _4099 * _4031;
    int _4109 = ~_4079;
    int _4111 = _4109 + 1;
    int _4113 = _4111 + 1;
    int _4115 = _3575 * _4073;
    int _4117 = _4115 + _4101;
    int _4119 = as_type<int>(_4049) + (-2);
    int _4121 = _3613 * _4051;
    int _4123 = _4121 + _4107;
    int _4125 = abs(_2945);
    int _4127 = _4113 * as_type<int>(_3857);
    int _4129 = _4127 + _4023;
    float _4131 = as_type<float>(_4089) * _4105;
    int _4133 = as_type<int>(_4071) + (-2);
    float _4135 = float(uint(_4123));
    float _4137 = float(uint(_4117));
    float _4139 = trunc(_4131);
    float _4141 = precise::max(_4139, 0.0);
    uint _4143 = uint(_4141);
    int _4145 = ~_4125;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    float _4151 = as_type<float>(_4119) * _4135;
    float _4153 = float(uint(_3981));
    float _4155 = as_type<float>(_4133) * _4137;
    int _4157 = _3483 ? 0 : 1;
    int _4159 = _4149 * _4129;
    int _4161 = abs(_3459);
    float _4163 = trunc(_4151);
    float _4165 = precise::max(_4163, 0.0);
    uint _4167 = uint(_4165);
    int _4169 = ~_4157;
    int _4171 = _4169 + 1;
    int _4173 = _4171 + 1;
    int _4175 = _3539 * _4125;
    int _4177 = _4175 + _4159;
    int _4179 = _4173;
    if (!_3471)
    {
        int _4181 = ~_4157;
        int _4183 = _4181 + 1;
        _4179 = _4183;
    }
    int _4185 = _4179;
    float _4187 = -_4103;
    float _4189 = _4187 + 1.0;
    int _4191 = ~_3459;
    int _4193 = _4191 + 1;
    int _4195 = ~_3935;
    int _4197 = _4195 + 1;
    float _4199 = trunc(_4155);
    float _4201 = precise::max(_4199, 0.0);
    uint _4203 = uint(_4201);
    int _4205 = abs(_3935);
    int _4207 = _4193 * int(_4143);
    int _4209 = _4207 + _4093;
    float _4211 = float(uint(_4161));
    int _4213 = ~_3875;
    int _4215 = _4213 + 1;
    float _4217 = float(uint(_4205));
    float _4219 = 1.0 / _4153;
    int _4221 = _4197 * int(_4167);
    int _4223 = _4221 + _4123;
    int _4225 = abs(_3875);
    float _4227 = float(uint(_4209));
    float _4229 = float(uint(_4223));
    float _4231 = 1.0 / _4211;
    int _4233 = _4215 * int(_4203);
    int _4235 = _4233 + _4117;
    float _4237 = float(uint(_4225));
    float _4239 = as_type<float>(_4089) * _4227;
    int _4241 = abs(_3981);
    float _4243 = as_type<float>(_4119) * _4229;
    float _4245 = float(uint(_4235));
    float _4247 = 1.0 / _4217;
    int _4249 = as_type<int>(_4219) + (-2);
    float _4251 = as_type<float>(_4133) * _4245;
    float _4253 = float(uint(_4177));
    float _4255 = float(uint(_4241));
    float _4257 = 1.0 / _4237;
    int _4259 = abs(_4093);
    float _4261 = as_type<float>(_4249) * _4253;
    int _4263 = abs(_4123);
    int _4265 = as_type<int>(_4231) + (-2);
    float _4267 = float(uint(_4259));
    float _4269 = 1.0 / _4255;
    int _4271 = as_type<int>(_4247) + (-2);
    float _4273 = as_type<float>(_4265) * _4267;
    float _4275 = float(uint(_4263));
    bool _4277 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4279 = isnan(1.0);
    bool _4281 = _4277 || _4279;
    bool _4283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4285 = _4281 || _4283;
    float _4287 = trunc(_4261);
    float _4289 = precise::max(_4287, 0.0);
    uint _4291 = uint(_4289);
    float _4293 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4295 = 1.0 + _4293;
    int _4297 = abs(_4117);
    float _4299 = as_type<float>(_4271) * _4275;
    float _4301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4303 = as_type<int>(_4257) + (-2);
    float _4305 = trunc(_4273);
    float _4307 = precise::max(_4305, 0.0);
    uint _4309 = uint(_4307);
    float _4311 = float(uint(_4297));
    float _4313 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4315 = as_type<float>(_4303) * _4311;
    int _4317 = abs(_4177);
    float _4319 = 1.0 / _4295;
    int _4321 = ~_3981;
    int _4323 = _4321 + 1;
    float _4325 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4301);
    float _4327 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4313);
    float _4329 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4331 = as_type<int>(_4269) + (-2);
    float _4333 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4325);
    float _4335 = float(uint(_4317));
    float _4337 = trunc(_4299);
    float _4339 = precise::max(_4337, 0.0);
    uint _4341 = uint(_4339);
    bool _4343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    bool _4349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4351 = _4347 || _4349;
    float _4353 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4355 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4327);
    int _4357 = _4323 * int(_4291);
    int _4359 = _4357 + _4177;
    int _4361 = ~_4161;
    int _4363 = _4361 + 1;
    float _4365 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4329);
    float _4367 = as_type<float>(_4331) * _4335;
    float _4369 = trunc(_4315);
    float _4371 = precise::max(_4369, 0.0);
    uint _4373 = uint(_4371);
    float _4375 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4353);
    float _4377 = _4351 ? _4189 : 0.0;
    float _4379 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4365);
    float _4381 = float(uint(_4359));
    int _4383 = _4363 * int(_4309);
    int _4385 = _4383 + _4259;
    int _4387 = ~_4205;
    int _4389 = _4387 + 1;
    float _4391 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4375);
    float _4393 = trunc(_4243);
    float _4395 = precise::max(_4393, 0.0);
    uint _4397 = uint(_4395);
    if (_4285)
    {
        float _4399 = _4377 * _4319;
        _158 = _4399;
    }
    float _4401 = _158;
    float _4403 = as_type<float>(_4249) * _4381;
    float _4405 = float(uint(_4385));
    int _4407 = _4389 * int(_4341);
    int _4409 = _4407 + _4263;
    float _4411 = trunc(_4239);
    float _4413 = precise::max(_4411, 0.0);
    uint _4415 = uint(_4413);
    int _4417 = ~_4225;
    int _4419 = _4417 + 1;
    float _4421 = as_type<float>(_4265) * _4405;
    float _4423 = trunc(_4367);
    float _4425 = precise::max(_4423, 0.0);
    uint _4427 = uint(_4425);
    int _4429 = int(_4167) + int(_4397);
    int _4431 = _4419 * int(_4373);
    int _4433 = _4431 + _4297;
    int _4435 = ~_3981;
    int _4437 = _4435 + 1;
    float _4439 = float(uint(_4433));
    float _4441 = trunc(_4403);
    float _4443 = precise::max(_4441, 0.0);
    uint _4445 = uint(_4443);
    int _4447 = int(_4143) + int(_4415);
    int _4449 = ~_4241;
    int _4451 = _4449 + 1;
    float _4453 = as_type<float>(_4303) * _4439;
    float _4455 = trunc(_4251);
    float _4457 = precise::max(_4455, 0.0);
    uint _4459 = uint(_4457);
    float _4461 = trunc(_4453);
    float _4463 = precise::max(_4461, 0.0);
    uint _4465 = uint(_4463);
    float _4467 = float(uint(_4409));
    int _4469 = ~_3459;
    int _4471 = _4469 + 1;
    int _4473 = int(_4291) + int(_4445);
    float _4475 = as_type<float>(_4271) * _4467;
    int _4477 = _4451 * int(_4427);
    int _4479 = _4477 + _4317;
    float _4481 = trunc(_4421);
    float _4483 = precise::max(_4481, 0.0);
    uint _4485 = uint(_4483);
    int _4487 = ~_3935;
    int _4489 = _4487 + 1;
    float _4491 = float(uint(_4479));
    int _4493 = _4471 * _4447;
    int _4495 = _4493 + _4093;
    int _4497 = ~_3875;
    int _4499 = _4497 + 1;
    float _4501 = as_type<float>(_4331) * _4491;
    float _4503 = trunc(_4475);
    float _4505 = precise::max(_4503, 0.0);
    uint _4507 = uint(_4505);
    int _4509 = _4489 * _4429;
    int _4511 = _4509 + _4123;
    int _4513 = int(_4203) + int(_4459);
    int _4515 = _4437 * _4473;
    int _4517 = _4515 + _4177;
    bool _4519 = uint(_4511) >= uint(_3935);
    float _4521 = trunc(_4501);
    float _4523 = precise::max(_4521, 0.0);
    uint _4525 = uint(_4523);
    bool _4527 = uint(_4495) >= uint(_3459);
    int _4529 = _4499 * _4513;
    int _4531 = _4529 + _4117;
    int _4533 = int(_4373) + int(_4465);
    int _4535 = int(_4309) + int(_4485);
    int _4537 = ~_4161;
    int _4539 = _4537 + 1;
    bool _4541 = !_4519;
    int _4543 = _4541 ? 0 : (-1);
    bool _4545 = uint(_4517) >= uint(_3981);
    int _4547 = _4539 * _4535;
    int _4549 = _4547 + _4259;
    int _4551 = ~_4225;
    int _4553 = _4551 + 1;
    bool _4555 = !_4527;
    int _4557 = _4555 ? 0 : (-1);
    bool _4559 = uint(_4531) >= uint(_3875);
    int _4561 = _4553 * _4533;
    int _4563 = _4561 + _4297;
    int _4565 = int(_4341) + int(_4507);
    int _4567 = ~_4205;
    int _4569 = _4567 + 1;
    bool _4571 = !_4559;
    int _4573 = _4571 ? 0 : (-1);
    bool _4575 = uint(_4549) >= uint(_4161);
    int _4577 = _4569 * _4565;
    int _4579 = _4577 + _4263;
    int _4581 = ~_4241;
    int _4583 = _4581 + 1;
    bool _4585 = !_4575;
    int _4587 = _4585 ? 0 : (-1);
    bool _4589 = uint(_4563) >= uint(_4225);
    float _4591 = _3499 * _3499;
    int _4593 = int(_4427) + int(_4525);
    float _4595 = fma(_3405, _3405, _4591);
    bool _4597 = !_4545;
    int _4599 = _4597 ? 0 : (-1);
    bool _4601 = uint(_4579) >= uint(_4205);
    float _4603 = fma(_3519, _3519, _4595);
    int _4605 = _4583 * _4593;
    int _4607 = _4605 + _4317;
    int _4609 = ~_4447;
    int _4611 = _4609 + _4557;
    int _4613 = _4611 + 1;
    float _4615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4617 = !_4601;
    int _4619 = _4617 ? 0 : (-1);
    bool _4621 = uint(_4607) >= uint(_4241);
    int _4623 = _3459 * _4613;
    int _4625 = _4623 + _4093;
    int _4627 = ~_4513;
    int _4629 = _4627 + _4573;
    int _4631 = _4629 + 1;
    bool _4633 = !_4589;
    int _4635 = _4633 ? 0 : (-1);
    float _4637 = rsqrt(_4603);
    bool _4639 = _3459 == 0;
    int _4641 = ~_4473;
    int _4643 = _4641 + _4599;
    int _4645 = _4643 + 1;
    int _4647 = _3875 * _4631;
    int _4649 = _4647 + _4117;
    bool _4651 = !_4639;
    int _4653 = _4651 ? _4625 : (-1);
    bool _4655 = _3875 == 0;
    float _4657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4659 = ~_4429;
    int _4661 = _4659 + _4543;
    int _4663 = _4661 + 1;
    float _4665 = _4615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4667 = !_4655;
    int _4669 = _4667 ? _4649 : (-1);
    bool _4671 = _3459 == 0;
    int _4673 = _3935 * _4663;
    int _4675 = _4673 + _4123;
    int _4677 = _4093 ^ _3459;
    float _4679 = _3499 * _4637;
    int _4681 = _4123 ^ _3935;
    float _4683 = _3405 * _4637;
    uint _4685 = uint(int(uint(_4677) >> uint(31)));
    float _4687 = -_4679;
    float _4689 = fma(_4687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3499);
    uint _4691 = uint(int(uint(_4681) >> uint(31)));
    float _4693 = -_4683;
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3405);
    bool _4697 = !_4621;
    int _4699 = _4697 ? 0 : (-1);
    float _4701 = _3781 + 0.5;
    bool _4703 = _3935 == 0;
    float _4705 = fma(_4665, _1483, -0.5);
    int _4707 = ~_4587;
    int _4709 = _4535 + _4707;
    int _4711 = _4709 + 1;
    float _4713 = _4689 * _4689;
    int _4715 = ~int(_4685);
    int _4717 = _4715 + 1;
    float _4719 = _3745 + 0.5;
    int _4721 = ~_4619;
    int _4723 = _4565 + _4721;
    int _4725 = _4723 + 1;
    float _4727 = fma(_4695, _4695, _4713);
    int _4729 = ~int(_4691);
    int _4731 = _4729 + 1;
    float _4733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4735 = !_4703;
    int _4737 = _4735 ? _4675 : (-1);
    int _4739 = _3981 * _4645;
    int _4741 = _4739 + _4177;
    int _4743 = _4711 ^ _4717;
    out.m_71.x = _4719;
    out.m_71.y = _4701;
    bool _4745 = _3981 == 0;
    float _4747 = _4657 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4749 = _4725 ^ _4731;
    float _4751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4753 = ~_4717;
    int _4755 = _4753 + _4743;
    int _4757 = _4755 + 1;
    bool _4759 = !_4745;
    int _4761 = _4759 ? _4741 : (-1);
    int _4763 = ~_4731;
    int _4765 = _4763 + _4749;
    int _4767 = _4765 + 1;
    bool _4769 = _3935 == 0;
    float _4771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4773 = !_4671;
    int _4775 = _4773 ? _4757 : (-1);
    float _4777 = _4733 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4779 = _3875 == 0;
    int _4781 = _4117 ^ _3875;
    float _4783 = fma(_4777, _1547, -0.5);
    bool _4785 = !_4769;
    int _4787 = _4785 ? _4767 : (-1);
    float _4789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4791 = _3981 == 0;
    int _4793 = _4177 ^ _3981;
    float _4795 = float(_4653);
    uint _4797 = uint(int(uint(_4781) >> uint(31)));
    float _4799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _4801 = float(_4737);
    float _4803 = fma(_4665, _4795, _3301);
    float _4805 = float(_4669);
    float _4807 = _4751 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4809 = ~_4635;
    int _4811 = _4533 + _4809;
    int _4813 = _4811 + 1;
    float _4815 = fma(_4777, _4801, _3769);
    int _4817 = ~int(_4797);
    int _4819 = _4817 + 1;
    float _4821 = fma(_4807, _4805, _3543);
    float _4823 = float(_4761);
    float _4825 = _4771 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4827 = _4813 ^ _4819;
    float _4829 = fma(_4807, _1569, -0.5);
    float _4831 = float(_4775);
    float _4833 = fma(_4825, _1579, -0.5);
    int _4835 = ~_4819;
    int _4837 = _4835 + _4827;
    int _4839 = _4837 + 1;
    float _4841 = fma(_4825, _4823, _3371);
    uint _4843 = uint(int(uint(_4793) >> uint(31)));
    float _4845 = fma(_4747, _2735, -0.5);
    float _4847 = -_2669;
    float _4849 = fma(_4747, _4831, _4847);
    float _4851 = _4799 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _4853 = !_4779;
    int _4855 = _4853 ? _4839 : (-1);
    float _4857 = fma(_4379, _4829, _4821);
    int _4859 = ~_4699;
    int _4861 = _4593 + _4859;
    int _4863 = _4861 + 1;
    float _4865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4867 = ~int(_4843);
    int _4869 = _4867 + 1;
    float _4871 = _4789 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4873 = float(_4787);
    float _4875 = fma(_4391, _4705, _4803);
    float _4877 = float(_4855);
    float _4879 = fma(_4871, _2745, -0.5);
    int _4881 = _4863 ^ _4869;
    float _4883 = -_3473;
    float _4885 = fma(_4871, _4873, _4883);
    float _4887 = fma(_4851, _2757, -0.5);
    float _4889 = -_3775;
    float _4891 = fma(_4851, _4877, _4889);
    int _4893 = ~_4869;
    int _4895 = _4893 + _4881;
    int _4897 = _4895 + 1;
    float _4899 = _3519 * _4637;
    float _4901 = fma(_4333, _4845, _4849);
    float _4903 = fma(_3249, _4833, _4841);
    bool _4905 = !_4791;
    int _4907 = _4905 ? _4897 : (-1);
    float _4909 = -_4899;
    float _4911 = fma(_4909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3519);
    float _4913 = _4901 + 0.5;
    float _4915 = _4865 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _4917 = float(_4907);
    float _4919 = fma(_4911, _4911, _4727);
    float _4921 = fma(_3561, _4783, _4815);
    float _4923 = in.m_73.x;
    float _4925 = in.m_73.y;
    float _4927 = in.m_73.z;
    float _4929 = fma(_4915, _2759, -0.5);
    float _4931 = -_3381;
    float _4933 = fma(_4915, _4917, _4931);
    float _4935 = fma(_3743, _4879, _4885);
    float _4937 = fma(_4355, _4887, _4891);
    bool _4939 = !_3917;
    int _4941 = _4939 ? 0 : 1;
    float _4943 = fma(_3251, _4929, _4933);
    float _4945 = _4935 + 0.5;
    bool _4947 = !_3921;
    int _4949 = _4947 ? 0 : 1;
    float _4951 = _4857 + 0.5;
    float _4953 = _4875 + 0.5;
    float _4955 = _4921 + 0.5;
    float _4957 = _4903 + 0.5;
    float _4959 = _4937 + 0.5;
    float _4961 = _4943 + 0.5;
    int _4963 = abs(_4941);
    out.m_75.x = _4953;
    out.m_75.y = _4913;
    out.m_75.z = _4955;
    out.m_75.w = _4945;
    int _4965 = abs(_4949);
    out.m_77.x = _4951;
    out.m_77.y = _4959;
    float _4967 = float(_4185);
    bool _4969 = !_3925;
    int _4971 = _4969 ? 0 : 1;
    out.m_79.x = _4957;
    out.m_79.y = _4961;
    float _4973 = float(_4963);
    float _4975 = as_type<float>(_4717);
    float _4977 = as_type<float>(_4743);
    if (_3559)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4979 = -_4679;
    float _4981 = fma(_4979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3137);
    float _4983 = -_4683;
    float _4985 = fma(_4983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3163);
    float _4987 = float(_2917);
    float _4989 = _4973 * _4967;
    float _4991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4993 = _4981 + _4991;
    float _4995 = float(_4965);
    float _4997 = -_4899;
    float _4999 = fma(_4997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3173);
    float _5001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5003 = _4985 + _5001;
    float _5005 = _4993 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5007 = _4989 * (-2.0);
    float _5009 = _4995 * _4987;
    float _5011 = _1166 + _1447;
    float _5013 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5015 = _4999 + _5013;
    float _5017 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5005);
    float _5019 = _5011 + (-1.0);
    float _5021 = _5009 * (-2.0);
    float _5023 = fma(_5015, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5017);
    float _5025 = _1441 + (-0.5);
    float _5027 = fma(_5007, _4923, _4923);
    float _5029 = fma(_5019, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5031 = _1166 + (-0.5);
    float _5033 = fma(_5021, _4925, _4925);
    bool _5035 = _5023 >= 0.0;
    float _5037 = fma(_3503, _5007, _3503);
    float _5039 = fma(_5025, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5027);
    float _5041 = fma(_5029, _5021, _5029);
    float _5043 = fma(_5031, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5033);
    int _5045 = abs(_4971);
    float _5047 = fma(_5037, _4401, _5039);
    float _5049 = sqrt(_4919);
    float _5051 = fma(_5041, _4401, _5043);
    float _5053 = float(_5045);
    float _5055 = _5047 * 0.15915493667125701904296875;
    float _5057 = float(_3129);
    float _5059 = _5051 * 0.15915493667125701904296875;
    float _5061 = _5033;
    float _5063 = _5003;
    float _5065 = _4993;
    if (_5035)
    {
        _5061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5067 = _5061;
    float _5069 = _5055 * 6.283185482025146484375;
    float _5071 = sin(_5069);
    float _5073 = _5053 * _5057;
    float _5075 = _1441 + _1447;
    int _5077 = as_type<int>(_5067);
    if (_5035)
    {
        float _5079 = _5067 * 5.0;
        _5077 = as_type<int>(_5079);
    }
    int _5081 = _5077;
    if (_5035)
    {
        out.m_49.x = 0.0;
    }
    float _5083 = _5075 + (-1.0);
    float _5085 = _5073 * (-2.0);
    float _5087 = _5055 * 6.283185482025146484375;
    float _5089 = cos(_5087);
    if (_5035)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13889 = as_type<float>(_5081);
        out.gl_Position.z = _13889;
    }
    float _5091 = _5059 * 6.283185482025146484375;
    float _5093 = sin(_5091);
    if (_5035)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5095 = -_3137;
    float _5097 = _5095 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5099 = -_3163;
    float _5101 = _5099 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5103 = fma(_5083, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5105 = fma(_5085, _4927, _4927);
    float _5107 = _5097 * _5097;
    float _5109 = _1447 + (-0.5);
    float _5111 = -_3173;
    float _5113 = _5111 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5115 = fma(_5103, _5085, _5103);
    float _5117 = fma(_5101, _5101, _5107);
    float _5119 = fma(_5109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5105);
    float _5121 = _5059 * 6.283185482025146484375;
    float _5123 = cos(_5121);
    float _5125 = _4637 * _5049;
    float _5127 = fma(_5113, _5113, _5117);
    float _5129 = fma(_5115, _4401, _5119);
    float _5131 = _5071 * _5093;
    float _5133 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5135 = _5089 * _5093;
    float _5137 = _5129 * 0.15915493667125701904296875;
    float _5139 = rsqrt(_5127);
    float _5141 = _5137 * 6.283185482025146484375;
    float _5143 = sin(_5141);
    float _5145 = _5089 * _5123;
    float _5147 = _5071 * _5123;
    float _5149 = _5101 * _5139;
    float _5151 = _5113 * _5139;
    float _5153 = in.m_81.x;
    float _5155 = in.m_81.y;
    float _5157 = in.m_81.z;
    float _5159 = _5097 * _5139;
    float _5161 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5163 = _5149 * _5161;
    float _5165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5167 = _5151 * _5165;
    float _5169 = _5137 * 6.283185482025146484375;
    float _5171 = cos(_5169);
    float _5173 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5175 = _5159 * _5173;
    float _5177 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5179 = -_5163;
    float _5181 = fma(_5151, _5177, _5179);
    float _5183 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5185 = -_5167;
    float _5187 = fma(_5159, _5183, _5185);
    float _5189 = fma(_5143, _5145, _5131);
    float _5191 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5193 = -_5175;
    float _5195 = fma(_5149, _5191, _5193);
    float _5197 = _5181 * _5181;
    float _5199 = fma(_5143, _5131, _5145);
    float _5201 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5203 = fma(_5187, _5187, _5197);
    float _5205 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5207 = fma(_5195, _5195, _5203);
    float _5209 = _5125 * _5205;
    float _5211 = _5089 * _5171;
    float _5213 = _5071 * _5171;
    float _5215 = rsqrt(_5207);
    float _5217 = _5125 * _5133;
    float _5219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5155);
    float _5221 = _5123 * _5171;
    float _5223 = _5093 * _5171;
    float _5225 = _5219 * _5209;
    float _5227 = _5125 * _5201;
    float _5229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5153);
    float _5231 = -_5135;
    float _5233 = fma(_5143, _5147, _5231);
    float _5235 = -_5147;
    float _5237 = fma(_5143, _5135, _5235);
    float _5239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5157);
    float _5241 = _5229 * _5227;
    float _5243 = _5211 * _5225;
    float _5245 = -_5225;
    float _5247 = _5143 * _5245;
    float _5249 = _5213 * _5225;
    float _5251 = _5187 * _5215;
    float _5253 = _5239 * _5217;
    float _5255 = _5181 * _5215;
    float _5257 = fma(_5189, _5241, _5243);
    float _5259 = _5159 * _5251;
    float _5261 = _5195 * _5215;
    float _5263 = fma(_5221, _5241, _5247);
    float _5265 = fma(_5237, _5253, _5257);
    float _5267 = _5151 * _5255;
    float _5269 = -_5259;
    float _5271 = fma(_5149, _5255, _5269);
    float _5273 = fma(_5233, _5241, _5249);
    float _5275 = fma(_5223, _5253, _5263);
    float _5277 = -_5267;
    float _5279 = fma(_5159, _5261, _5277);
    float _5281 = _5271 * _5265;
    float _5283 = fma(_5199, _5253, _5273);
    float _5285 = _5149 * _5261;
    float _5287 = _5279 * _5265;
    float _5289 = fma(_5261, _5275, _5281);
    float _5291 = -_5285;
    float _5293 = fma(_5151, _5251, _5291);
    float _5295 = fma(_5251, _5275, _5287);
    float _5297 = fma(_5151, _5283, _5289);
    float _5299 = fma(_5149, _5283, _5295);
    float _5301 = _3173 + _5297;
    float _5303 = _3163 + _5299;
    float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5307 = _5301 + _5305;
    float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5311 = _5303 + _5309;
    float _5313 = _5307 * _5307;
    float _5315 = fma(_5311, _5311, _5313);
    float _5317 = _5293 * _5265;
    float _5319 = sqrt(_5315);
    float _5321 = fma(_5255, _5275, _5317);
    float _5323 = fma(_5159, _5283, _5321);
    float _5325 = _3137 + _5323;
    bool _5327 = _5319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5329 = _5323;
    float _5331 = _5283;
    float _5333 = _5321;
    if (!_5327)
    {
        _5329 = _5303;
    }
    float _5335 = _5329;
    float _5337 = _5335;
    if (!_5327)
    {
        _5331 = _5301;
    }
    float _5339 = _5331;
    float _5341 = _5339;
    if (!_5327)
    {
        _5333 = _5325;
    }
    float _5343 = _5333;
    bool _5345 = !_5327;
    float _5347 = _5343;
    if (!_5345)
    {
        float _5349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5353 = _5319 + _5351;
        float _5355 = _5325 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5357 = _5353 * _5349;
        float _5359 = rsqrt(_5315);
        float _5361 = _5357 * 0.15915493667125701904296875;
        float _5363 = _5361 * 6.283185482025146484375;
        float _5365 = sin(_5363);
        float _5367 = _5361 * 6.283185482025146484375;
        float _5369 = cos(_5367);
        float _5371 = fma(_5365, _5355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5373 = _5359 * _5371;
        float _5375 = _5369 + (-1.0);
        float _5377 = fma(_5311, _5373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5379 = fma(_5307, _5373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5381 = _5375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5383 = fma(_5325, _5369, _5381);
        _5347 = _5383;
        _5337 = _5377;
        _5341 = _5379;
    }
    float _5385 = _5347;
    float _5387 = _5337;
    float _5389 = _5341;
    float _5391 = -_3137;
    float _5393 = _5391 + _5385;
    float _5395 = -_3163;
    float _5397 = _5395 + _5387;
    float _5399 = -_3173;
    float _5401 = _5399 + _5389;
    float _5403 = _5393 * _5393;
    bool _5405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5407 = isnan(0.5);
    bool _5409 = _5405 || _5407;
    bool _5411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5413 = _5409 || _5411;
    float _5415 = fma(_5397, _5397, _5403);
    float _5417 = fma(_5401, _5401, _5415);
    float _5419 = sqrt(_5417);
    bool _5421 = _5419 > 0.0;
    bool _5423 = !_5421;
    float _5425 = _5387;
    float _5427 = _5385;
    float _5429 = _5389;
    if (!_5423)
    {
        float _5431 = _200 * _200;
        float _5433 = fma(_198, _198, _5431);
        float _5435 = fma(_202, _202, _5433);
        float _5437 = rsqrt(_5417);
        float _5439 = sqrt(_5435);
        float _5441 = _5393 * _5437;
        float _5443 = _5401 * _5437;
        bool _5445 = _5439 > 0.0;
        float _5447 = _5397 * _5437;
        bool _5449 = !_5445;
        if (!_5449)
        {
            float _5451 = rsqrt(_5435);
            float _5453 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5455 = _200 * _5451;
            float _5457 = _198 * _5451;
            float _5459 = _5441 * _5455;
            float _5461 = _202 * _5451;
            float _5463 = fma(_5447, _5457, _5459);
            float _5465 = _5453 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5467 = fma(_5443, _5461, _5463);
            float _5469 = _5467 * _5465;
            float _5471 = fma(_198, _5469, _5387);
            float _5473 = fma(_200, _5469, _5385);
            float _5475 = fma(_202, _5469, _5389);
            _5425 = _5471;
            _5427 = _5473;
            _5429 = _5475;
        }
    }
    float _5477 = _5425;
    float _5479 = _5427;
    float _5481 = _5429;
    float _5483 = -_4683;
    float _5485 = fma(_5483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5477);
    float _5487 = -_4679;
    float _5489 = fma(_5487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5479);
    float _5491 = -_4899;
    float _5493 = fma(_5491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5481);
    float _5495 = _5489;
    float _5497 = _5485;
    float _5499 = _5493;
    if (!_5413)
    {
        float _5501 = _4993 * _4993;
        float _5503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5505 = -_3173;
        float _5507 = _5505 + _5481;
        float _5509 = -_3163;
        float _5511 = _5509 + _5477;
        float _5513 = fma(_5003, _5003, _5501);
        float _5515 = -_3137;
        float _5517 = _5515 + _5479;
        float _5519 = fma(_5015, _5015, _5513);
        float _5521 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5523 = sqrt(_5519);
        float _5525 = 1.0 / _5125;
        float _5527 = _5521 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5529 = precise::min(_5523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5531 = _5529 * _5503;
        float _5533 = _5531 * _5525;
        float _5535 = _5527 * _5533;
        float _5537 = _5507 * _5533;
        float _5539 = fma(_5511, _5535, _4985);
        float _5541 = fma(_5517, _5535, _4981);
        float _5543 = fma(_5527, _5537, _4999);
        _5495 = _5541;
        _5497 = _5539;
        _5499 = _5543;
        _5063 = _5523;
        _5065 = _5501;
    }
    float _5545 = _5495;
    float _5547 = _5497;
    float _5549 = _5499;
    float _5551 = _5063;
    float _5553 = _5065;
    float _5555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5557 = _5545 + _5555;
    float _5559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5561 = _5547 + _5559;
    float _5563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5565 = _5549 + _5563;
    float _5567 = _5557 * _5557;
    float _5569 = fma(_5561, _5561, _5567);
    float _5571 = fma(_5565, _5565, _5569);
    float _5573 = rsqrt(_5571);
    float _5575 = sqrt(_5571);
    float _5577 = _5573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5579 = _5561 * _5577;
    float _5581 = _5565 * _5577;
    float _5583 = _5579 * _5579;
    float _5585 = _5581 * _5581;
    float _5587 = _5583 + _5585;
    float _5589 = sqrt(_5587);
    bool _5591 = _5589 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5595 = _5589 + _5593;
    float _5597 = _5565;
    float _5599 = _5553;
    float _5601 = _5595;
    float _5603 = _5551;
    float _5605 = _5577;
    if (_5591)
    {
        float _5607 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5597 = _5607;
    }
    float _5609 = _5597;
    if (_5591)
    {
        float _5611 = rsqrt(_5587);
        _5599 = _5611;
    }
    float _5613 = _5599;
    if (_5591)
    {
        float _5615 = _5595 * _5609;
        _5601 = _5615;
    }
    float _5617 = _5601;
    if (_5591)
    {
        float _5619 = _5617 * 0.15915493667125701904296875;
        _5603 = _5619;
    }
    float _5621 = _5603;
    float _5623 = _5569;
    if (_5591)
    {
        float _5625 = _5621 * 6.283185482025146484375;
        float _5627 = sin(_5625);
        _5623 = _5627;
    }
    float _5629 = _5623;
    float _5631 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5633 = precise::max(0.0, _5631);
    float _5635 = _5573;
    float _5637 = _5633;
    float _5639 = _5631;
    if (_5591)
    {
        float _5641 = _5621 * 6.283185482025146484375;
        float _5643 = cos(_5641);
        _5635 = _5643;
    }
    float _5645 = _5635;
    float _5647 = -_5577;
    float _5649 = -_5633;
    float _5651 = fma(_5557, _5647, _5649);
    float _5653 = _5651;
    if (_5591)
    {
        float _5655 = _5651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5637 = _5655;
    }
    float _5657 = _5637;
    float _5659 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5661 = _5629;
    float _5663 = _5657;
    if (_5591)
    {
        float _5665 = fma(_5629, _5657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5661 = _5665;
    }
    float _5667 = _5661;
    float _5669 = _5667;
    if (!_5591)
    {
        _5663 = _5579;
    }
    float _5671 = _5663;
    float _5673 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5659);
    float _5675 = _5671;
    float _5677 = _5645;
    if (_5591)
    {
        float _5679 = _5645 + (-1.0);
        _5639 = _5679;
    }
    float _5681 = _5639;
    float _5683 = _5681;
    if (_5591)
    {
        float _5685 = _5613 * _5667;
        _5605 = _5685;
    }
    float _5687 = _5605;
    if (!_5591)
    {
        _5669 = _5585;
    }
    float _5689 = _5669;
    float _5691 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5673);
    float _5693 = _5689;
    if (_5591)
    {
        float _5695 = _5681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5683 = _5695;
    }
    float _5697 = _5683;
    float _5699 = _5697;
    if (_5591)
    {
        float _5701 = _5579 * _5687;
        _5675 = _5701;
    }
    float _5703 = _5675;
    float _5705 = _5691 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_5591)
    {
        float _5707 = fma(_5651, _5645, _5697);
        _5653 = _5707;
    }
    float _5709 = _5653;
    if (!_5591)
    {
        _5699 = _5581;
    }
    float _5711 = _5699;
    float _5713 = _5711;
    if (_5591)
    {
        float _5715 = _5581 * _5687;
        _5713 = _5715;
    }
    float _5717 = _5713;
    if (!_5591)
    {
        _5677 = _5583;
    }
    float _5719 = _5677;
    float _5721 = _5719;
    if (_5591)
    {
        float _5723 = _5703 * _5703;
        _5721 = _5723;
    }
    float _5725 = _5721;
    if (_5591)
    {
        float _5727 = _5717 * _5717;
        _5693 = _5727;
    }
    float _5729 = _5693;
    float _5731 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5733 = fma(_5709, _5709, _5725);
    float _5735 = fma(_4985, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5737 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5731);
    float _5739 = _5733 + _5729;
    float _5741 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5743 = fma(_5575, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5741);
    float _5745 = precise::clamp(_5743, 0.0, 1.0);
    float _5747 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5737);
    float _5749 = rsqrt(_5739);
    float _5751 = -_5745;
    float _5753 = _5751 + 1.0;
    float _5755 = _5705 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5757 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5759 = _5747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5761 = fma(_4999, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5763 = -_5755;
    float _5765 = fma(_5763, _5757, 1.0);
    float _5767 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5769 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5771 = abs(_5753);
    float _5773 = log2(_5771);
    float _5775 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5767);
    float _5777 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5769);
    float _5779 = _5749 * _5703;
    float _5781 = _5749 * _5709;
    float _5783 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5775);
    float _5785 = _5749 * _5717;
    float _5787 = _5779 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5789 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5791 = _5783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5793 = floor(_5735);
    float _5795 = -_5787;
    float _5797 = fma(_5781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5795);
    float _5799 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5777);
    float _5801 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5803 = -_5785;
    float _5805 = fma(_5803, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5797);
    float _5807 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5789);
    float _5809 = _5799 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5811 = floor(_5761);
    float _5813 = fma(_5805, -0.5, 0.5);
    float _5815 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5807);
    float _5817 = fma(_5805, 0.5, 0.5);
    float _5819 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5815);
    float _5821 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5823 = log2(_5765);
    float _5825 = -_5793;
    float _5827 = _5735 + _5825;
    float _5829 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5821);
    float _5831 = _5781 + 1.0;
    float _5833 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5829);
    float _5835 = 1.0 / _5819;
    float _5837 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5839 = fma(_5817, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5841 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5833);
    float _5843 = fma(_5817, _5839, -0.212114393711090087890625);
    float _5845 = sqrt(_5813);
    float _5847 = _5823 * 0.693147182464599609375;
    float _5849 = fma(_5817, _5843, 1.570728778839111328125);
    float _5851 = _5847 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5853 = exp2(_5801);
    float _5855 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5837);
    float _5857 = _5841 * _5835;
    float _5859 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5855);
    float _5861 = _5845 * 0.636619746685028076171875;
    float _5863 = -_5811;
    float _5865 = _5761 + _5863;
    float _5867 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5859);
    float _5869 = -_5849;
    float _5871 = fma(_5861, _5869, 1.0);
    float2 _15136 = float2(_5827, _5865);
    float _5873 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15136, float2(0.0), isnan(_15136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15136, float2(0.0), isnan(_15136)), level(0.0)).x;
    float _5875 = _5867 * _5835;
    float _5877 = fma(_5857, 0.5, 0.5);
    float _5879 = -_5781;
    float _5881 = fma(_5853, _5831, _5879);
    float _5883 = fma(_5875, -0.5, 0.5);
    float _5885 = fma(_5881, 0.5, 0.5);
    float3 _15162 = float3(_5877, _5883, _5851);
    float _5887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15162, float3(0.0), isnan(_15162)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15162, float3(0.0), isnan(_15162)), level(0.0)).x;
    float3 _15173 = float3(_5877, _5883, _5851);
    float4 _5890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15173, float3(0.0), isnan(_15173)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15173, float3(0.0), isnan(_15173)), level(0.0)).xyzw;
    float _5892 = _5890.x;
    float _5894 = _5890.y;
    float _5896 = _5890.z;
    float _5898 = _5890.w;
    float2 _15189 = float2(_5871, _5885);
    float3 _5902 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15189, float2(0.0), isnan(_15189)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15189, float2(0.0), isnan(_15189)), level(0.0)).xyz;
    float _5904 = _5902.x;
    float _5906 = _5902.y;
    float _5908 = _5902.z;
    float _5910 = _4981 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5912 = _4981 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _5914 = _5155 != 0.0;
    bool _5916 = isnan(_5155);
    bool _5918 = _5914 || _5916;
    bool _5920 = isnan(0.0);
    bool _5922 = _5918 || _5920;
    float _5924 = _5237 * _5279;
    float _5926 = fma(_4985, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5910);
    float _5928 = fma(_4985, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5912);
    bool _5930 = _5153 == 0.0;
    bool _5932 = !_5922;
    bool _5934 = _5930 && _5932;
    float _5936 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5938 = fma(_4999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5926);
    float _5940 = fma(_4999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5928);
    float _5942 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5944 = _5938 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5946 = _5940 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _5948 = _5157 == 0.0;
    bool _5950 = _5948 && _5934;
    float _5952 = exp2(_5936);
    float _5954 = _5946 + _5944;
    float _5956 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5942);
    float _5958 = 1.0 / _5944;
    float _5960 = -_5952;
    float _5962 = _5960 + 1.0;
    float _5964 = _5954 * _5958;
    float _5966 = _5964 * 0.5;
    float _5968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5970 = fma(_5966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5968);
    float _5972 = in.m_83.x;
    float _5974 = in.m_83.y;
    float _5976 = in.m_83.z;
    float _5978 = 1.0 / _5970;
    float _5980 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5982 = _5978 * _5980;
    float _5984 = abs(_5982);
    float _5986 = log2(_5984);
    float _5988 = in.m_85.x;
    float _5990 = in.m_85.y;
    float _5992 = in.m_85.z;
    float _5994 = in.m_85.w;
    float _5996 = _5978;
    float _5998 = _5972;
    float _6000 = _5819;
    float _6002 = _5867;
    if (_5950)
    {
        _4975 = _5972;
    }
    float _6004 = _4975;
    float _6006 = _6004;
    if (_5950)
    {
        _4977 = _5974;
    }
    float _6008 = _4977;
    float _6010 = _6008;
    if (_5950)
    {
        _5996 = _6004;
    }
    float _6012 = _5996;
    float _6014 = _6012;
    if (!_5950)
    {
        _6006 = _5972;
    }
    float _6016 = _6006;
    if (_5950)
    {
        _5998 = _5976;
    }
    float _6018 = _5998;
    float _6020 = _6018;
    if (!_5950)
    {
        float _6022 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5976);
        _6020 = _6022;
    }
    float _6024 = _6020;
    if (!_5950)
    {
        float _6026 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6016);
        _6014 = _6026;
    }
    float _6028 = _6014;
    bool _6030 = _5982 <= 8000.0;
    bool _6032 = isnan(_5982);
    bool _6034 = _6030 || _6032;
    bool _6036 = isnan(8000.0);
    bool _6038 = _6034 || _6036;
    float _6040 = float(_6038);
    float _6042 = _5986 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6044 = _5986;
    if (_5950)
    {
        _6044 = _6008;
    }
    float _6046 = _6044;
    float _6048 = _6046;
    if (!_5950)
    {
        _6010 = _5974;
    }
    float _6050 = _6010;
    float _6052 = exp2(_6042);
    if (!_5950)
    {
        float _6054 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6050);
        _6048 = _6054;
    }
    float _6056 = _6048;
    float _6058 = _5990 * _5976;
    float _6060 = _5988 * _6050;
    float _6062 = _5992 * _6016;
    bool _6064 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6066 = isnan(_5575);
    bool _6068 = _6064 || _6066;
    bool _6070 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6072 = _6068 || _6070;
    float _6074 = -_6062;
    float _6076 = fma(_5988, _5976, _6074);
    float _6078 = _5189 * _5279;
    float _6080 = fma(_6052, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6082 = precise::clamp(_6080, 0.0, 1.0);
    float _6084 = -_6058;
    float _6086 = fma(_5992, _6050, _6084);
    float _6088 = -_6060;
    float _6090 = fma(_5990, _6016, _6088);
    float _6092 = _5211 * _5271;
    float _6094 = fma(_6082, -2.0, 3.0);
    float _6096 = _6082 * _6082;
    float _6098 = _6086 * _5994;
    float _6100 = _6090 * _5994;
    float _6102 = _5189 * _5293;
    float _6104 = _6096 * _6094;
    float _6106 = _5189 * _5271;
    float _6108 = _5211 * _5279;
    float _6110 = _5211 * _5293;
    float _6112 = _5237 * _5293;
    float _6114 = _6076 * _5994;
    float _6116 = -_5143;
    float _6118 = fma(_6116, _5251, _6108);
    float _6120 = fma(_5221, _5251, _6078);
    float _6122 = fma(_5221, _5255, _6102);
    float _6124 = fma(_5221, _5261, _6106);
    float _6126 = -_5143;
    float _6128 = fma(_6126, _5255, _6110);
    float _6130 = -_5143;
    float _6132 = fma(_6130, _5261, _6092);
    float _6134 = -_6104;
    float _6136 = _6134 + 1.0;
    float _6138 = fma(_5223, _5255, _6112);
    float _6140 = fma(_5213, _5149, _6118);
    float _6142 = _5237 * _5271;
    float _6144 = fma(_5213, _5159, _6128);
    float _6146 = fma(_5213, _5151, _6132);
    float _6148 = fma(_5223, _5251, _5924);
    float _6150 = fma(_6136, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6104);
    float _6152 = fma(_5233, _5159, _6122);
    float _6154 = fma(_5199, _5159, _6138);
    float _6156 = fma(_5233, _5149, _6120);
    float _6158 = _6140 * _5990;
    float _6160 = fma(_5223, _5261, _6142);
    float _6162 = fma(_5199, _5149, _6148);
    float _6164 = fma(_5233, _5151, _6124);
    float _6166 = _6144 * _5990;
    float _6168 = _6146 * _5990;
    float _6170 = fma(_6156, _5988, _6158);
    float _6172 = _6140 * _6056;
    float _6174 = fma(_6152, _5988, _6166);
    float _6176 = fma(_6164, _5988, _6168);
    float _6178 = fma(_6162, _5992, _6170);
    float _6180 = fma(_5199, _5151, _6160);
    float _6182 = _6114 * _6140;
    float _6184 = in.m_87.x;
    float _6186 = _6146 * _6056;
    float _6188 = _6114 * _6146;
    float _6190 = fma(_6156, _6028, _6172);
    float _6192 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5956);
    float _6194 = _6144 * _6056;
    float _6196 = _6114 * _6144;
    float _6198 = fma(_6098, _6156, _6182);
    float _6200 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6192);
    float _6202 = _6040 * _6150;
    float _6204 = fma(_6098, _6152, _6196);
    float _6206 = fma(_6098, _6164, _6188);
    float _6208 = fma(_6152, _6028, _6194);
    float _6210 = fma(_6100, _6162, _6198);
    float _6212 = fma(_6164, _6028, _6186);
    float _6214 = _6200 + _5819;
    float _6216 = _6202 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6218 = fma(_6154, _5992, _6174);
    float _6220 = fma(_6100, _6154, _6204);
    float _6222 = fma(_6180, _5992, _6176);
    float _6224 = fma(_6162, _6024, _6190);
    float _6226 = fma(_6154, _6024, _6208);
    float _6228 = fma(_6180, _6024, _6212);
    float _6230 = _6214 * 0.5;
    float _6232 = _5962 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6234 = fma(_6100, _6180, _6206);
    out.m_89.x = _6178;
    out.m_89.y = _6218;
    out.m_89.z = _6222;
    out.m_91.x = _6210;
    out.m_91.y = _6220;
    out.m_91.z = _6234;
    out.m_93.z = _6230;
    out.m_93.w = _5819;
    out.m_95.x = _6224;
    out.m_95.y = _6226;
    out.m_95.z = _6228;
    float _6236 = -_6232;
    float _6238 = _6236 + 1.0;
    out.gl_Position.x = _5841;
    out.gl_Position.y = _5867;
    out.gl_Position.z = _6200;
    out.gl_Position.w = _5819;
    float _6240 = _6234;
    float _6242 = _5841;
    float _6244 = _6238;
    if (!_6072)
    {
        _6240 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6246 = _6240;
    float _6248 = _6246;
    float _6250 = _6246;
    if (!_6072)
    {
        _6000 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6252 = _6000;
    float _6254 = _6252;
    float _6256 = _6252;
    if (!_6072)
    {
        _6242 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6258 = _6242;
    float _6260 = _6258;
    float _6262 = _6258;
    if (!_6072)
    {
        _6002 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6264 = _6002;
    float _6266 = -_5873;
    float _6268 = _6266 + 1.0;
    float _6270 = _6268 * _6216;
    float _6272 = precise::clamp(_6270, 0.0, 1.0);
    float _6274 = -_6272;
    float _6276 = fma(_6274, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6278 = _6232 * _5887;
    float _6280 = _5898 * _6238;
    float _6282 = _6264;
    float _6284 = _6264;
    if (!_6072)
    {
        _6244 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6286 = _6244;
    float _6288 = _6276 * _6184;
    float _6290 = _5898 * _6278;
    float _6292 = _5908 * _6278;
    float _6294 = _6288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6296 = fma(_5904, _6290, _5892);
    float _6298 = fma(_5906, _6290, _5894);
    float _6300 = fma(_5898, _6292, _5896);
    float _6302 = _6290;
    float _6304 = _6286;
    float _6306 = _6286;
    if (!_6072)
    {
        _6302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6308 = _6302;
    out.m_97.x = _6294;
    out.m_99.x = _6296;
    out.m_99.y = _6298;
    out.m_99.z = _6300;
    out.m_99.w = _6280;
    bool _6310 = !_6072;
    float _6312 = _6308;
    float _6314 = _6308;
    if (!_6310)
    {
        bool _6316 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6318 = isnan(_5575);
        bool _6320 = _6316 || _6318;
        bool _6322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6324 = _6320 || _6322;
        if (!_6324)
        {
            float _6326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6328 = _5575 + _6326;
            float _6330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6330;
            float _6334 = 1.0 / _6332;
            float _6336 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6338 = _6336 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6340 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6342 = _6340 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6344 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6346 = _6344 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6350 = _6348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6354 = _6352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6356 = _6328 * _6334;
            float _6358 = precise::clamp(_6356, 0.0, 1.0);
            float _6360 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6362 = _6360 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6364 = fma(_6358, _6342, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6366 = fma(_6358, _6362, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6368 = fma(_6358, _6338, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6370 = fma(_6358, _6346, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6372 = fma(_6358, _6350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6374 = fma(_6358, _6354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6314 = _6368;
            _6262 = _6372;
            _6250 = _6366;
            _6256 = _6370;
            _6306 = _6364;
            _6284 = _6374;
            _6376 = true;
        }
        else
        {
            bool _6378 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6380 = isnan(_5575);
            bool _6382 = _6378 || _6380;
            bool _6384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6386 = _6382 || _6384;
            if (!_6386)
            {
                _6254 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6388 = _6254;
            _6256 = _6388;
            if (!_6386)
            {
                _6260 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6390 = _6260;
            _6262 = _6390;
            if (!_6386)
            {
                _6282 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6392 = _6282;
            _6284 = _6392;
            if (!_6386)
            {
                _6248 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6394 = _6248;
            _6250 = _6394;
            if (!_6386)
            {
                _6312 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6396 = _6312;
            _6314 = _6396;
            if (!_6386)
            {
                _6304 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6398 = _6304;
            bool _6400 = !_6386;
            _6306 = _6398;
            if (!_6400)
            {
                bool _6402 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6404 = isnan(_5575);
                bool _6406 = _6402 || _6404;
                bool _6408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6410 = _6406 || _6408;
                if (!_6410)
                {
                    float _6412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6414 = _5575 + _6412;
                    float _6416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6416;
                    float _6420 = 1.0 / _6418;
                    float _6422 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6424 = _6422 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6426 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6428 = _6426 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6430 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6432 = _6430 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6436 = _6434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6440 = _6438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6442 = _6414 * _6420;
                    float _6444 = precise::clamp(_6442, 0.0, 1.0);
                    float _6446 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6448 = _6446 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6450 = fma(_6444, _6428, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6452 = fma(_6444, _6448, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6454 = fma(_6444, _6424, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6456 = fma(_6444, _6432, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6458 = fma(_6444, _6436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6460 = fma(_6444, _6440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6314 = _6454;
                    _6262 = _6458;
                    _6250 = _6452;
                    _6256 = _6456;
                    _6306 = _6450;
                    _6284 = _6460;
                    _6376 = true;
                }
                else
                {
                    _6314 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6262 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6250 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6256 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6306 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6284 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6376 = false;
    float _6462 = _6314;
    float _6464 = _6262;
    float _6466 = _6250;
    float _6468 = _6256;
    float _6470 = _6306;
    float _6472 = _6284;
    float _6474 = fma(_6226, -0.5, 0.5);
    float _6476 = precise::clamp(_6474, 0.0, 1.0);
    float _6478 = -_6462;
    float _6480 = _6464 + _6478;
    float _6482 = -_6466;
    float _6484 = _6468 + _6482;
    float _6486 = -_6470;
    float _6488 = _6472 + _6486;
    bool _6490 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6492 = fma(_6476, _6480, _6462);
    float _6494 = fma(_6476, _6484, _6466);
    float _6496 = fma(_6476, _6488, _6470);
    float _6498 = _6492 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _6500 = fma(_6494, 0.298911988735198974609375, _6498);
    float _6502 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6504 = fma(_6496, 0.114477999508380889892578125, _6500);
    out.m_49.x = _6502;
    float _6506 = -_6504;
    float _6508 = _6494 + _6506;
    float _6510 = -_6504;
    float _6512 = _6492 + _6510;
    float _6514 = -_6504;
    float _6516 = _6496 + _6514;
    float _6518 = fma(_6508, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    float _6520 = fma(_6512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    float _6522 = fma(_6516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    out.m_103.x = _6518;
    out.m_103.y = _6520;
    out.m_103.z = _6522;
    if (!_6490)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _6524 = -_5545;
    float _6526 = _6524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _6528 = -_5547;
    float _6530 = _6528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _6532 = -_5549;
    float _6534 = _6532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _6536 = _6526 * _6526;
    float _6538 = fma(_6530, _6530, _6536);
    float _6540 = fma(_6534, _6534, _6538);
    float _6542 = sqrt(_6540);
    float _6544 = rsqrt(_6540);
    float _6546 = -_6542;
    float _6548 = _6546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6550 = _6548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _6552 = precise::clamp(_6550, 0.0, 1.0);
    float _6554 = _6530 * _6544;
    float _6556 = _6526 * _6544;
    float _6558 = abs(_6552);
    float _6560 = log2(_6558);
    float _6562 = _6534 * _6544;
    float _6564 = _6554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _6566 = _6226 * _6556;
    float _6568 = -_6556;
    float _6570 = -_6564;
    float _6572 = fma(_6568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6570);
    float _6574 = fma(_6224, _6554, _6566);
    float _6576 = -_6562;
    float _6578 = fma(_6576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6572);
    float _6580 = fma(_6228, _6562, _6574);
    float _6582 = precise::clamp(_6580, 0.0, 1.0);
    float _6584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _6586 = _6578 + _6584;
    float _6588 = _6560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _6590 = _6586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _6592 = precise::clamp(_6590, 0.0, 1.0);
    float _6594 = exp2(_6588);
    float _6596 = _6594 * _6592;
    float _6598 = _6582 * _6596;
    float _6600 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _6602 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _6604 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _6600;
    out.m_101.y = _6602;
    out.m_101.z = _6604;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6376 = false;
    bool _1148 = false;
    bool _818 = false;
    bool _714 = false;
    bool _600 = false;
    bool _446 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6661 = as_type<float>(_138);
        out.gl_Position.z = _6661;
    }
    if (!_126)
    {
        return out;
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_49.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6731 = as_type<float>(_176);
        out.gl_Position.z = _6731;
    }
    if (_168)
    {
        return out;
    }
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _194);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    bool _204 = !_184;
    float _222;
    if (!_204)
    {
        float _206 = in.m_55.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_122);
        float _228 = 1.0 / _226;
        float _230 = _156 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _232 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _232 + _238;
    bool _242 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _244 = isnan(_232);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _232 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _266 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = 1.0 / _256;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = 1.0 / _268;
    float _276 = 1.0 / _264;
    float _278 = _236 * _270;
    bool _280 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _282 = isnan(_232);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_252;
    float _294 = _292 + 1.0;
    float _296 = _290 * _294;
    float _298 = _240 * _274;
    bool _300 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_232);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_232);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = -_290;
    float _334 = _332 + 1.0;
    float _336 = -_310;
    float _338 = _336 + 1.0;
    float _340 = _260 * _276;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = _326 * _338;
    float _352 = fma(_314, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = fma(_348, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = _310 * _334;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = _354 * _350;
    float _366 = _356 * _350;
    float _368 = _352 * _350;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _380 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _364);
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_330, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _390 = fma(_376, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_362, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_388, _358, _378);
    float _404 = fma(_386, _278, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _406 = fma(_396, _278, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _408 = fma(_400, _278, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _410 = fma(_390, _358, _380);
    float _412 = fma(_392, _358, _382);
    float _414 = fma(_404, _296, _402);
    float _416 = fma(_406, _296, _410);
    float _418 = fma(_408, _296, _412);
    float _420 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].x, _414);
    float _422 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].y, _416);
    float _424 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].z, _418);
    bool _426 = !_272;
    float _444;
    if (!_426)
    {
        float _428 = in.m_55.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_122);
        float _450 = 1.0 / _448;
        float _452 = _156 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _454 + _456;
    float _460 = in.m_57.x;
    float _462 = in.m_57.y;
    float _464 = in.m_57.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _472 = isnan(_454);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _486 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _488 = isnan(_454);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _498;
    bool _502 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _504 = isnan(_454);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _468;
    float _516 = -_480;
    float _518 = _516 + 1.0;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _522 = _496 * _518;
    float _524 = -_496;
    float _526 = _524 + 1.0;
    float _528 = 1.0 / _484;
    float _530 = _500 * _514;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _536 = _422 * _462;
    float _538 = _424 * _464;
    float _540 = fma(_530, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = _420 * _460;
    float _544 = _534 * _528;
    float _546 = _540 * _522;
    float _548 = -_512;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _554 = _454 + _552;
    float _556 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[115].x, _546);
    float _558 = _480 * _550;
    float _560 = fma(_544, _554, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _564 = fma(_560, _558, _556);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[117].x, _564);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _578 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _568;
    out.m_59.y = _578;
    out.m_59.z = _574;
    out.m_59.w = _576;
    bool _580 = !_520;
    float _598;
    if (!_580)
    {
        float _582 = in.m_55.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].z, _156);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_122);
        float _604 = 1.0 / _602;
        float _606 = _156 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _612 = _608 + _610;
    bool _614 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _616 = isnan(_608);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _626;
    bool _630 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _632 = isnan(_608);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _646;
    float _650 = 1.0 / _628;
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _654 = _640 * _644;
    float _656 = -_640;
    float _658 = _656 + 1.0;
    float _660 = _612 * _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _662;
    float _666 = fma(_648, _660, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _668;
    float _672 = fma(_664, _660, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _674 = _666 * _654;
    float _676 = fma(_670, _660, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _678 = _672 * _654;
    float _680 = _676 * _654;
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].x, _674);
    float _684 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].y, _680);
    float _686 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].z, _678);
    float _688 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].x, _682);
    float _690 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].y, _684);
    float _692 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].z, _686);
    bool _694 = !_652;
    float _712;
    if (!_694)
    {
        float _696 = in.m_55.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _156 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    bool _724 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = isnan(_722);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _740 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _742 = isnan(_722);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _758 = _722 + _756;
    float _760 = -_734;
    float _762 = _760 + 1.0;
    bool _764 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _766 = 1.0 / _738;
    float _768 = _750 * _762;
    float _770 = -_750;
    float _772 = _770 + 1.0;
    float _774 = _754 * _766;
    float _776 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _778 = fma(_774, _758, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _780 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _782 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _778 * _768;
    float _786 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _784);
    float _790 = _688 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _792 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[132].x, _788);
    float _794 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _794;
    out.m_61.y = _786;
    out.m_61.z = _782;
    out.m_61.w = _796;
    bool _798 = !_764;
    float _816;
    if (!_798)
    {
        float _800 = in.m_55.x;
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _804 = _800 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[14].x, _156);
        float _808 = _806 * _802;
        float _810 = floor(_808);
        float _812 = -_810;
        float _814 = _808 + _812;
        _816 = _814;
        _818 = true;
    }
    else
    {
        float _820 = float(_122);
        float _822 = 1.0 / _820;
        float _824 = _156 * _822;
        _816 = _824;
    }
    _818 = false;
    float _826 = _816;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _830 = _826 + _828;
    bool _832 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _834 = isnan(_826);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _848 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _850 = isnan(_826);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _860;
    bool _864 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _866 = isnan(_826);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -_842;
    float _878 = _876 + 1.0;
    float _880 = 1.0 / _846;
    float _882 = _858 * _878;
    float _884 = -_874;
    float _886 = _884 + 1.0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _892 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _894 = 1.0 / _890;
    float _896 = _862 * _880;
    float _898 = -_858;
    float _900 = _898 + 1.0;
    bool _902 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _904 = isnan(_826);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_896, _830, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _916 = _874 * _900;
    bool _918 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _920 = isnan(_826);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = _912 * _886;
    float _932 = -_912;
    float _934 = _932 + 1.0;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _940 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _942 = isnan(_826);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = _928 * _934;
    float _954 = -_928;
    float _956 = _954 + 1.0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _962 = 1.0 / _938;
    bool _964 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _966 = isnan(_826);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _950 * _956;
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _990 = _974 * _980;
    float _992 = 1.0 / _960;
    float _994 = _988 * _894;
    float _996 = _914 * _990;
    float _998 = -_974;
    float _1000 = _998 + 1.0;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = _826 + _1006;
    float _1010 = 1.0 / _984;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1012;
    float _1016 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _996);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1022 = fma(_994, _1008, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = _1014 * _962;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1028 = _826 + _1026;
    float _1030 = 1.0 / _1004;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1036 = fma(_1024, _1028, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1038 = fma(_1022, _976, _1016);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1040;
    float _1044 = _1034 * _992;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1048 = _826 + _1046;
    float _1050 = 1.0 / _1020;
    float _1052 = fma(_1036, _952, _1038);
    float _1054 = _1042 * _1010;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1058 = _826 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1064 = fma(_1044, _1048, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1068 = _826 + _1066;
    float _1070 = fma(_1054, _1058, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1072 = _1062 * _1030;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1074;
    bool _1078 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1080 = isnan(_826);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = fma(_1064, _930, _1052);
    float _1092 = fma(_1072, _1068, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1096 = _826 + _1094;
    float _1098 = -_1088;
    float _1100 = _1098 + 1.0;
    float _1102 = _1076 * _1050;
    float _1104 = fma(_1070, _916, _1090);
    float _1106 = _842 * _1100;
    float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1110 = fma(_1092, _882, _1104);
    float _1112 = fma(_1108, _1106, _1110);
    float _1114 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    out.m_63.x = _1114;
    bool _1116 = !_892;
    float _1118 = _1030;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1050;
    float _1124 = _1038;
    float _1126 = _842;
    float _1128 = _882;
    float _1146;
    if (!_1116)
    {
        float _1130 = in.m_55.x;
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1134 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[14].y, _156);
        float _1138 = _1136 * _1132;
        float _1140 = floor(_1138);
        float _1142 = -_1140;
        float _1144 = _1138 + _1142;
        _1146 = _1144;
        _1148 = true;
    }
    else
    {
        float _1150 = float(_122);
        float _1152 = 1.0 / _1150;
        float _1154 = _156 * _1152;
        _1146 = _1154;
    }
    _1148 = false;
    float _1156 = _1146;
    float _1158 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1160 = int(_1158);
    float _1162 = float(_122);
    float _1164 = in.m_65.x;
    float _1166 = in.m_55.y;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1174 = int(_1172);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1178 = _1176 != 0;
    float _1180 = float(_1160);
    float _1182 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1184 = int(_1182);
    if (_1170)
    {
        float _1186 = in.m_55.x;
        _1118 = _1186;
    }
    float _1188 = _1118;
    float _1190 = float(uint(_1174));
    float _1192 = 1.0 / _1180;
    float _1194 = float(_1174);
    if (_1178)
    {
        float _1196 = in.m_55.z;
        _1120 = _1196;
    }
    float _1198 = _1120;
    int _1200 = ~_1174;
    int _1202 = _1200 + 1;
    float _1204 = 0.0;
    int _1206 = as_type<int>(_1198);
    float _1208 = _1164;
    if (!_1170)
    {
        _1204 = _1164;
    }
    float _1210 = _1204;
    float _1212 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1214 = int(_1212);
    float _1216 = float(_1184);
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1220 = _1218 != 0;
    float _1222 = _1192 * _156;
    float _1224 = 1.0 / _1190;
    float _1226 = float(_1214);
    float _1228 = trunc(_1222);
    int _1230 = int(_1228);
    float _1232 = _1210;
    bool _1234 = _1220;
    if (_1220)
    {
        float _1236 = in.m_55.x;
        _1122 = _1236;
    }
    float _1238 = _1122;
    int _1240 = 0;
    float _1242 = _1238;
    if (_1220)
    {
        _1240 = 0;
    }
    int _1244 = _1240;
    int _1246 = 0;
    int _1248 = _1244;
    if (_1220)
    {
        _1246 = 0;
    }
    int _1250 = _1246;
    float _1252 = _1010;
    int _1254 = _1250;
    if (_1220)
    {
        float _1256 = in.m_55.z;
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = 1.0 / _1216;
    int _1262 = as_type<int>(_1224) + (-2);
    float _1264 = _1194 * _156;
    if (_1220)
    {
        _1124 = 1.0;
    }
    float _1266 = _1124;
    float _1268 = _1266;
    if (_1220)
    {
        _1126 = 1.0;
    }
    float _1270 = _1126;
    float _1272 = _1270;
    if (_1220)
    {
        _1128 = 1.0;
    }
    float _1274 = _1128;
    float _1276 = 1.0 / _1226;
    float _1278 = float(uint(_1230));
    int _1280 = 0;
    float _1282 = _1274;
    if (_1220)
    {
        _1280 = as_type<int>(_1166);
    }
    int _1284 = _1280;
    float _1286 = 1.0 / _1162;
    float _1288 = as_type<float>(_1262) * _1278;
    float _1290 = _1260 * _156;
    int _1292 = as_type<int>(_1260);
    float _1294 = _1258;
    int _1296 = _1284;
    if (_1220)
    {
        _1292 = as_type<int>(_1258);
    }
    int _1298 = _1292;
    float _1300 = trunc(_1288);
    float _1302 = precise::max(_1300, 0.0);
    uint _1305 = uint(_1302);
    float _1307 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1309 = int(_1307);
    float _1311 = float(_1230);
    float _1313 = _1264 * _1286;
    float _1315 = in.m_55.w;
    bool _1317 = _1311 >= _1194;
    bool _1319 = isnan(_1311);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(_1194);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    float _1329 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1331 = int(_1329);
    int _1333 = _1202 * int(_1305);
    int _1335 = _1333 + _1230;
    float _1337 = float(uint(_1335));
    float _1339 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1341 = int(_1339);
    float _1343 = float(uint(_1309));
    float _1345 = as_type<float>(_1262) * _1337;
    float _1347 = _1337;
    float _1349 = as_type<float>(_1335);
    int _1351 = _1298;
    int _1353 = as_type<int>(_1345);
    if (_1220)
    {
        _1347 = _1238;
    }
    float _1355 = _1347;
    float _1357 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1359 = int(_1357);
    float _1361 = float(uint(_1331));
    float _1363 = _1355;
    if (_1220)
    {
        _1349 = _1355;
    }
    float _1365 = _1349;
    int _1367 = 0;
    float _1369 = _1365;
    if (_1220)
    {
        _1367 = as_type<int>(_1355);
    }
    int _1371 = _1367;
    float _1373 = float(uint(_1341));
    float _1375 = 1.0 / _1343;
    float _1377 = float(_1359);
    float _1379 = 1.0 / _1361;
    float _1381 = 1.0 / _1377;
    float _1383 = 1.0 / _1373;
    float _1385 = trunc(_1313);
    int _1387 = int(_1385);
    float _1389 = trunc(_1290);
    int _1391 = int(_1389);
    float _1393 = trunc(_1327);
    int _1395 = int(_1393);
    float _1397 = trunc(_1345);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    int _1403 = _1371;
    int _1405 = int(_1401);
    if (!_1220)
    {
        float _1407 = in.m_55.x;
        float _1409 = _1166 * 3.1415927410125732421875;
        float _1411 = in.m_55.z;
        float _1413 = _1409 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1407 * 3.1415927410125732421875;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1411 * 3.1415927410125732421875;
        float _1425 = _1423 * 0.15915493667125701904296875;
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1425 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        _1272 = 1.2345600128173828125;
        _1363 = _1166;
        _1268 = 7.345489978790283203125;
        _1242 = _1407;
        _1282 = 5.839270114898681640625;
        _1369 = _1411;
        _1294 = _1411;
        _1248 = 1;
        _1254 = 2;
        _1296 = as_type<int>(_1417);
        _1403 = as_type<int>(_1429);
        _1351 = as_type<int>(_1433);
    }
    float _1435 = _1272;
    float _1437 = _1363;
    float _1439 = _1268;
    float _1441 = _1242;
    float _1443 = _1282;
    float _1445 = _1369;
    float _1447 = _1294;
    int _1449 = _1248;
    int _1451 = _1254;
    int _1453 = _1296;
    int _1455 = _1403;
    int _1457 = _1351;
    int _1459 = as_type<int>(_1439);
    if (_1170)
    {
        float _1461 = -_1164;
        float _1463 = _1461 + 1.0;
        _1353 = as_type<int>(_1463);
    }
    int _1465 = _1353;
    bool _1467 = false;
    if (_1170)
    {
        bool _1469 = _1188 > 0.5;
        _1467 = _1469;
    }
    bool _1471 = _1467;
    float _1473 = _1435 * _1437;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1477 = _1475 != 0;
    float _1479 = _1439 * _1441;
    if (_1170)
    {
        float _1481 = _1471 ? as_type<float>(_1465) : _1164;
        _1232 = _1481;
    }
    float _1483 = _1232;
    float _1485 = _1443 * _1445;
    int _1487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1489 = _1487 != 0;
    float _1491 = _1439 * _1437;
    int _1493 = int(_1305) + int(_1401);
    float _1495 = floor(_1473);
    int _1497 = ~_1174;
    int _1499 = _1497 + 1;
    float _1501 = in.m_65.y;
    int _1503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1505 = _1503 != 0;
    if (_1178)
    {
        bool _1507 = _1198 > 0.5;
        _1234 = _1507;
    }
    bool _1509 = _1234;
    if (_1178)
    {
        float _1511 = -_1164;
        float _1513 = _1511 + 1.0;
        _1206 = as_type<int>(_1513);
    }
    int _1515 = _1206;
    int _1517 = _1499 * _1493;
    int _1519 = _1517 + _1230;
    if (_1477)
    {
        float _1521 = -_1164;
        float _1523 = _1521 + 1.0;
        _1405 = as_type<int>(_1523);
    }
    int _1525 = _1405;
    bool _1527 = _1166 > 0.5;
    float _1529 = as_type<float>(_1525);
    if (_1489)
    {
        float _1531 = -_1164;
        float _1533 = _1531 + 1.0;
        _1459 = as_type<int>(_1533);
    }
    int _1535 = _1459;
    float _1537 = 0.0;
    if (!_1178)
    {
        _1537 = _1164;
    }
    float _1539 = _1537;
    float _1541 = floor(_1485);
    float _1543 = _1539;
    if (_1178)
    {
        float _1545 = _1509 ? as_type<float>(_1515) : _1164;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = 0.0;
    if (!_1477)
    {
        _1549 = _1164;
    }
    float _1551 = _1549;
    int _1553 = 0;
    float _1555 = _1551;
    if (_1505)
    {
        float _1557 = -_1164;
        float _1559 = _1557 + 1.0;
        _1553 = as_type<int>(_1559);
    }
    int _1561 = _1553;
    bool _1563 = uint(_1519) >= uint(_1174);
    float _1565 = _1276 * _156;
    if (_1477)
    {
        float _1567 = _1527 ? as_type<float>(_1525) : _1164;
        _1555 = _1567;
    }
    float _1569 = _1555;
    float _1571 = floor(_1479);
    if (!_1489)
    {
        _1529 = _1164;
    }
    float _1573 = _1529;
    float _1575 = _1573;
    if (_1489)
    {
        float _1577 = _1527 ? as_type<float>(_1535) : _1164;
        _1575 = _1577;
    }
    float _1579 = _1575;
    bool _1581 = !_1563;
    int _1583 = _1581 ? 0 : (-1);
    if (_1505)
    {
        float _1585 = _1527 ? as_type<float>(_1561) : _1164;
        _1208 = _1585;
    }
    float _1587 = _1208;
    float _1589 = floor(_1491);
    int _1591 = ~_1493;
    int _1593 = _1591 + _1583;
    int _1595 = _1593 + 1;
    float _1597 = _1381 * _156;
    int _1599 = as_type<int>(_1375) + (-2);
    float _1601 = -_1495;
    float _1603 = _1473 + _1601;
    float _1605 = float(uint(_1391));
    int _1607 = _1174 * _1595;
    int _1609 = _1607 + _1230;
    bool _1611 = _1174 == 0;
    float _1613 = trunc(_1565);
    int _1615 = int(_1613);
    float _1617 = -_1541;
    float _1619 = _1485 + _1617;
    float _1621 = as_type<float>(_1599) * _1605;
    float _1623 = -_1571;
    float _1625 = _1479 + _1623;
    int _1627 = ~_1395;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    bool _1633 = !_1611;
    int _1635 = _1633 ? _1609 : (-1);
    float _1637 = _1625 * _1194;
    float _1639 = trunc(_1621);
    float _1641 = precise::max(_1639, 0.0);
    uint _1643 = uint(_1641);
    int _1645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1647 = _1645 != 0;
    float _1649 = -_1589;
    float _1651 = _1491 + _1649;
    int _1653 = _1635 * _1631;
    bool _1655 = !_1647;
    int _1657 = _1655 ? 0 : 1;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1661 = _1659 != 0;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1669 = _1667 != 0;
    float _1671 = trunc(_1597);
    int _1673 = int(_1671);
    int _1675 = abs(_1657);
    int _1677 = ~_1309;
    int _1679 = _1677 + 1;
    bool _1681 = !_1665;
    int _1683 = _1681 ? 0 : 1;
    int _1685 = as_type<int>(_1379) + (-2);
    float _1687 = trunc(_1637);
    int _1689 = int(_1687);
    float _1691 = float(uint(_1615));
    int _1693 = abs(_1683);
    int _1695 = _1679 * int(_1643);
    int _1697 = _1695 + _1391;
    int _1699 = _1174 + (-1);
    float _1701 = as_type<float>(_1685) * _1691;
    int _1703 = as_type<int>(_1383) + (-2);
    float _1705 = float(uint(_1697));
    int _1707 = _1395 * _1699;
    int _1709 = _1707 + _1653;
    float _1711 = float(uint(_1673));
    float _1713 = trunc(_1701);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    bool _1719 = !_1661;
    int _1721 = _1719 ? 0 : 1;
    int _1723 = _1709 * _1693;
    float _1725 = as_type<float>(_1599) * _1705;
    float _1727 = as_type<float>(_1703) * _1711;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1731 = _1729 != 0;
    int _1733 = _1689 * _1675;
    int _1735 = _1733 + _1230;
    bool _1737 = !_1669;
    int _1739 = _1737 ? 0 : 1;
    float _1741 = trunc(_1725);
    float _1743 = precise::max(_1741, 0.0);
    uint _1745 = uint(_1743);
    int _1747 = abs(_1721);
    bool _1749 = !_1731;
    int _1751 = _1749 ? 0 : 1;
    int _1753 = abs(_1739);
    float _1755 = trunc(_1727);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    int _1761 = ~_1331;
    int _1763 = _1761 + 1;
    int _1765 = abs(_1751);
    int _1767 = _1387 * _1747;
    int _1769 = _1767 + _1723;
    int _1771 = _1763 * int(_1717);
    int _1773 = _1771 + _1615;
    int _1775 = ~_1341;
    int _1777 = _1775 + 1;
    float _1779 = _1286 * _156;
    int _1781 = int(_1643) + int(_1745);
    int _1783 = _1735 * _1753;
    int _1785 = _1783 + _1769;
    float _1787 = float(uint(_1773));
    float _1789 = float(_1391);
    int _1791 = _1689 * _1765;
    int _1793 = _1791 + _1785;
    float _1795 = float(_1341);
    float _1797 = as_type<float>(_1685) * _1787;
    int _1799 = _1777 * int(_1759);
    int _1801 = _1799 + _1673;
    float _1803 = float(_1615);
    float _1805 = float(uint(_1793));
    float _1807 = trunc(_1797);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    float _1813 = float(uint(_1801));
    float _1815 = float(_1309);
    int _1817 = ~_1309;
    int _1819 = _1817 + 1;
    float _1821 = as_type<float>(_1703) * _1813;
    float _1823 = float(_1331);
    float _1825 = _1815 * _1603;
    float _1827 = as_type<float>(_1262) * _1805;
    float _1829 = trunc(_1821);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    int _1835 = ~_1174;
    int _1837 = _1835 + 1;
    float _1839 = _1815 * _1779;
    bool _1841 = _1789 >= _1815;
    bool _1843 = isnan(_1789);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(_1815);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1823 * _1619;
    bool _1855 = _1803 >= _1823;
    bool _1857 = isnan(_1803);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1823);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = _1823 * _1779;
    float _1869 = _1795 * _1779;
    float _1871 = trunc(_1827);
    float _1873 = precise::max(_1871, 0.0);
    uint _1875 = uint(_1873);
    float _1877 = float(_1673);
    float _1879 = _1795 * _1651;
    bool _1881 = _1877 >= _1795;
    bool _1883 = isnan(_1877);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(_1795);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    int _1893 = _1819 * _1781;
    int _1895 = _1893 + _1391;
    int _1897 = ~_1331;
    int _1899 = _1897 + 1;
    float _1901 = trunc(_1851);
    int _1903 = int(_1901);
    int _1905 = int(_1717) + int(_1811);
    bool _1907 = uint(_1895) >= uint(_1309);
    int _1909 = int(_1759) + int(_1833);
    int _1911 = _1837 * int(_1875);
    int _1913 = _1911 + _1793;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1917 = _1915 != 0;
    int _1919 = _1899 * _1905;
    int _1921 = _1919 + _1615;
    int _1923 = ~_1341;
    int _1925 = _1923 + 1;
    float _1927 = trunc(_1825);
    int _1929 = int(_1927);
    float _1931 = float(uint(_1913));
    int _1933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1935 = _1933 != 0;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1939 = _1937 != 0;
    int _1941 = _1925 * _1909;
    int _1943 = _1941 + _1673;
    bool _1945 = uint(_1921) >= uint(_1331);
    float _1947 = as_type<float>(_1262) * _1931;
    bool _1949 = !_1917;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = trunc(_1865);
    int _1955 = int(_1953);
    bool _1957 = !_1907;
    int _1959 = _1957 ? 0 : (-1);
    bool _1961 = !_1939;
    int _1963 = _1961 ? 0 : 1;
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1967 = _1965 != 0;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1971 = _1969 != 0;
    bool _1973 = !_1935;
    int _1975 = _1973 ? 0 : 1;
    float _1977 = trunc(_1947);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    bool _1983 = uint(_1943) >= uint(_1341);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1987 = _1985 != 0;
    bool _1989 = !_1945;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = ~_1781;
    int _1995 = _1993 + _1959;
    int _1997 = _1995 + 1;
    float _1999 = trunc(_1869);
    int _2001 = int(_1999);
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2009 = _2007 != 0;
    bool _2011 = !_1987;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1309 * _1997;
    int _2017 = _2015 + _1391;
    bool _2019 = !_1967;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = !_1971;
    int _2025 = _2023 ? 0 : 1;
    float _2027 = trunc(_1879);
    int _2029 = int(_2027);
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2033 = _2031 != 0;
    bool _2035 = _1309 == 0;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2039 = _2037 != 0;
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2043 = _2041 != 0;
    int _2045 = abs(_1951);
    bool _2047 = !_2033;
    int _2049 = _2047 ? 0 : 1;
    bool _2051 = !_1983;
    int _2053 = _2051 ? 0 : (-1);
    int _2055 = _1929 * _2045;
    int _2057 = _2055 + _1391;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2061 = _2059 != 0;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2065 = _2063 != 0;
    int _2067 = ~_1905;
    int _2069 = _2067 + _1991;
    int _2071 = _2069 + 1;
    int _2073 = ~_1903;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2035;
    int _2081 = _2079 ? _2017 : (-1);
    int _2083 = _1331 * _2071;
    int _2085 = _2083 + _1615;
    int _2087 = int(_1875) + int(_1981);
    float _2089 = trunc(_1891);
    int _2091 = int(_2089);
    int _2093 = ~_1174;
    int _2095 = _2093 + 1;
    int _2097 = _2077 * _2081;
    bool _2099 = !_2065;
    int _2101 = _2099 ? 0 : 1;
    bool _2103 = _1331 == 0;
    int _2105 = _2095 * _2087;
    int _2107 = _2105 + _1793;
    int _2109 = _1309 + (-1);
    int _2111 = ~_1955;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    bool _2117 = !_2103;
    int _2119 = _2117 ? _2085 : (-1);
    int _2121 = _1903 * _2109;
    int _2123 = _2121 + _2097;
    int _2125 = ~_1909;
    int _2127 = _2125 + _2053;
    int _2129 = _2127 + 1;
    float _2131 = trunc(_1839);
    int _2133 = int(_2131);
    bool _2135 = !_2043;
    int _2137 = _2135 ? 0 : 1;
    int _2139 = _2115 * _2119;
    int _2141 = abs(_1963);
    int _2143 = _1341 * _2129;
    int _2145 = _2143 + _1673;
    bool _2147 = uint(_2107) >= uint(_1174);
    int _2149 = abs(_1975);
    float _2151 = trunc(_1853);
    int _2153 = int(_2151);
    bool _2155 = !_2039;
    int _2157 = _2155 ? 0 : 1;
    bool _2159 = !_2147;
    int _2161 = _2159 ? 0 : (-1);
    int _2163 = _2123 * _2141;
    bool _2165 = !_2005;
    int _2167 = _2165 ? 0 : 1;
    float _2169 = trunc(_1867);
    int _2171 = int(_2169);
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2175 = _2173 != 0;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2179 = _2177 != 0;
    bool _2181 = _1341 == 0;
    int _2183 = abs(_2021);
    int _2185 = _1331 + (-1);
    int _2187 = ~_2091;
    int _2189 = _2187 + 1;
    int _2191 = _2189 + 1;
    int _2193 = _1955 * _2185;
    int _2195 = _2193 + _2139;
    bool _2197 = !_2181;
    int _2199 = _2197 ? _2145 : (-1);
    int _2201 = _2133 * _2149;
    int _2203 = _2201 + _2163;
    float _2205 = _1441 * 2.0;
    int _2207 = abs(_2025);
    int _2209 = _2191 * _2199;
    int _2211 = abs(_2013);
    int _2213 = _2057 * _2183;
    int _2215 = _2213 + _2203;
    float _2217 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2219 = !_2009;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = abs(_2167);
    int _2225 = _1929 * _2207;
    int _2227 = _2225 + _2215;
    int _2229 = abs(_2221);
    float _2231 = float(uint(_2227));
    int _2233 = _2195 * _2229;
    int _2235 = abs(_2049);
    float _2237 = as_type<float>(_1599) * _2231;
    int _2239 = abs(_2157);
    int _2241 = _2171 * _2223;
    int _2243 = _2241 + _2233;
    float _2245 = trunc(_2237);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    int _2251 = _2153 * _2211;
    int _2253 = _2251 + _1615;
    int _2255 = abs(_2137);
    int _2257 = _2253 * _2235;
    int _2259 = _2257 + _2243;
    bool _2261 = !_2061;
    int _2263 = _2261 ? 0 : 1;
    int _2265 = _1341 + (-1);
    int _2267 = _2153 * _2239;
    int _2269 = _2267 + _2259;
    int _2271 = abs(_2101);
    int _2273 = ~_1309;
    int _2275 = _2273 + 1;
    int _2277 = _2091 * _2265;
    int _2279 = _2277 + _2209;
    int _2281 = abs(_2263);
    int _2283 = _2275 * int(_2249);
    int _2285 = _2283 + _2227;
    bool _2287 = !_2175;
    int _2289 = _2287 ? 0 : 1;
    int _2291 = _2279 * _2271;
    int _2293 = _2029 * _2255;
    int _2295 = _2293 + _1673;
    int _2297 = ~_2087;
    int _2299 = _2297 + _2161;
    int _2301 = _2299 + 1;
    float _2303 = float(uint(_2269));
    int _2305 = _2001 * _2281;
    int _2307 = _2305 + _2291;
    float _2309 = float(uint(_2285));
    int _2311 = _1174 * _2301;
    int _2313 = _2311 + _1793;
    bool _2315 = !_2179;
    int _2317 = _2315 ? 0 : 1;
    float _2319 = as_type<float>(_1685) * _2303;
    int _2321 = abs(_2289);
    float _2323 = as_type<float>(_1599) * _2309;
    int _2325 = abs(_2317);
    float _2327 = trunc(_2319);
    float _2329 = precise::max(_2327, 0.0);
    uint _2331 = uint(_2329);
    bool _2333 = _1174 == 0;
    int _2335 = _2295 * _2321;
    int _2337 = _2335 + _2307;
    float _2339 = -_1501;
    float _2341 = _2339 + 1.0;
    bool _2343 = _1315 > 0.5;
    float _2345 = trunc(_2323);
    float _2347 = precise::max(_2345, 0.0);
    uint _2349 = uint(_2347);
    bool _2351 = !_2333;
    int _2353 = _2351 ? _2313 : (-1);
    int _2355 = _2029 * _2325;
    int _2357 = _2355 + _2337;
    int _2359 = _2343 ? as_type<int>(_2341) : as_type<int>(_1501);
    int _2361 = _2353 & 3;
    bool _2363 = _2361 != 0;
    int _2365 = _2353 & 3;
    bool _2367 = _2365 != 0;
    int _2369 = ~_1331;
    int _2371 = _2369 + 1;
    float _2373 = float(uint(_2357));
    int _2375 = _2363 ? 0 : 1;
    int _2377 = _2371 * int(_2331);
    int _2379 = _2377 + _2269;
    bool _2381 = uint(_2365) > 1u;
    float _2383 = as_type<float>(_1703) * _2373;
    int _2385 = int(_2249) + int(_2349);
    int _2387 = ~_1309;
    int _2389 = _2387 + 1;
    float _2391 = trunc(_2383);
    float _2393 = precise::max(_2391, 0.0);
    uint _2395 = uint(_2393);
    float _2397 = float(uint(_2379));
    int _2399 = ~_2375;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    float _2405 = as_type<float>(_1685) * _2397;
    int _2407 = ~_1341;
    int _2409 = _2407 + 1;
    int _2411 = _2389 * _2385;
    int _2413 = _2411 + _2227;
    int _2415 = _2403;
    if (!_2381)
    {
        int _2417 = ~_2375;
        int _2419 = _2417 + 1;
        _2415 = _2419;
    }
    int _2421 = _2415;
    float _2423 = trunc(_2405);
    float _2425 = precise::max(_2423, 0.0);
    uint _2427 = uint(_2425);
    bool _2429 = uint(_2365) >= 2u;
    bool _2431 = _1166 > 0.5;
    int _2433 = _2429 ? 0 : 1;
    int _2435 = _2409 * int(_2395);
    int _2437 = _2435 + _2357;
    bool _2439 = uint(_2413) >= uint(_1309);
    int _2441 = ~_2433;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    bool _2447 = !_2439;
    int _2449 = _2447 ? 0 : (-1);
    bool _2451 = _2365 != 3;
    float _2453 = float(uint(_2437));
    int _2455 = ~_1331;
    int _2457 = _2455 + 1;
    int _2459 = int(_2331) + int(_2427);
    float _2461 = as_type<float>(_1703) * _2453;
    int _2463 = ~_2385;
    int _2465 = _2463 + _2449;
    int _2467 = _2465 + 1;
    float _2469 = trunc(_2461);
    float _2471 = precise::max(_2469, 0.0);
    uint _2473 = uint(_2471);
    int _2475 = _2457 * _2459;
    int _2477 = _2475 + _2269;
    int _2479 = _2445;
    if (_2451)
    {
        int _2481 = ~_2433;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _1309 * _2467;
    int _2489 = _2487 + _2227;
    int _2491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2493 = _2491 != 0;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2499 = !_2493;
    int _2501 = _2499 ? 0 : 1;
    bool _2503 = uint(_2477) >= uint(_1331);
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2507 = _2505 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2509 = !_2035;
    int _2511 = _2509 ? _2489 : (-1);
    float _2513 = 1.0 / _2497;
    bool _2515 = !_2503;
    int _2517 = _2515 ? 0 : (-1);
    int _2519 = _2511 & 3;
    bool _2521 = _2519 != 0;
    int _2523 = ~_2459;
    int _2525 = _2523 + _2517;
    int _2527 = _2525 + 1;
    int _2529 = _2431 ? as_type<int>(_2341) : as_type<int>(_1501);
    float _2531 = 1.0 / _2507;
    bool _2533 = uint(_2519) >= 2u;
    int _2535 = _1331 * _2527;
    int _2537 = _2535 + _2269;
    int _2539 = _2521 ? 0 : 1;
    bool _2541 = _2519 != 3;
    int _2543 = int(_2395) + int(_2473);
    int _2545 = _2533 ? 0 : 1;
    int _2547 = ~_1341;
    int _2549 = _2547 + 1;
    bool _2551 = uint(_2519) > 1u;
    int _2553 = ~_2545;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    int _2559 = _2549 * _2543;
    int _2561 = _2559 + _2357;
    bool _2563 = !_2103;
    int _2565 = _2563 ? _2537 : (-1);
    int _2567 = _2557;
    if (_2541)
    {
        int _2569 = ~_2545;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    bool _2575 = uint(_2561) >= uint(_1341);
    int _2577 = ~_2539;
    int _2579 = _2577 + 1;
    int _2581 = _2579 + 1;
    bool _2583 = !_2575;
    int _2585 = _2583 ? 0 : (-1);
    int _2587 = _2581;
    if (!_2551)
    {
        int _2589 = ~_2539;
        int _2591 = _2589 + 1;
        _2587 = _2591;
    }
    int _2593 = _2587;
    int _2595 = _2565 & 3;
    bool _2597 = _2595 != 0;
    int _2599 = ~_2543;
    int _2601 = _2599 + _2585;
    int _2603 = _2601 + 1;
    bool _2605 = _2595 != 3;
    int _2607 = _2597 ? 0 : 1;
    int _2609 = _1341 * _2603;
    int _2611 = _2609 + _2357;
    bool _2613 = uint(_2595) >= 2u;
    int _2615 = ~_2607;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2613 ? 0 : 1;
    bool _2623 = uint(_2595) > 1u;
    bool _2625 = !_2181;
    int _2627 = _2625 ? _2611 : (-1);
    int _2629 = ~_2621;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    int _2635 = _2633;
    int _2637 = _2619;
    if (_2605)
    {
        int _2639 = ~_2621;
        int _2641 = _2639 + 1;
        _2635 = _2641;
    }
    int _2643 = _2635;
    int _2645 = _2627 & 3;
    bool _2647 = _2645 != 0;
    int _2649 = _2647 ? 0 : 1;
    bool _2651 = uint(_2645) >= 2u;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (!_2623)
    {
        int _2655 = ~_2607;
        int _2657 = _2655 + 1;
        _2637 = _2657;
    }
    int _2659 = _2637;
    bool _2661 = _2645 != 3;
    float _2663 = fma(_2217, -2.0, _2653);
    int _2665 = _2651 ? 0 : 1;
    bool _2667 = uint(_2645) > 1u;
    float _2669 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2663);
    int _2671 = ~_2665;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    int _2677 = ~_2649;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2675;
    int _2685 = _2681;
    if (_2661)
    {
        int _2687 = ~_2665;
        int _2689 = _2687 + 1;
        _2683 = _2689;
    }
    int _2691 = _2683;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    if (!_2667)
    {
        int _2701 = ~_2649;
        int _2703 = _2701 + 1;
        _2685 = _2703;
    }
    int _2705 = _2685;
    int _2707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2709 = _2707 != 0;
    out.m_67.x = (*spvDescriptorSet0.vp_c9)._m0[175].x;
    int _2711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2713 = _2711 != 0;
    float _2715 = 1.0 / _2695;
    bool _2717 = !_2709;
    int _2719 = _2717 ? 0 : 1;
    float _2721 = in.m_46.x;
    float _2723 = in.m_46.y;
    float _2725 = in.m_46.z;
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2729 = _2727 != 0;
    bool _2731 = !_2713;
    int _2733 = _2731 ? 0 : 1;
    float _2735 = _2729 ? as_type<float>(_2529) : _1501;
    float _2737 = 1.0 / _2699;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2741 = _2739 != 0;
    bool _2743 = _1447 > 0.5;
    float _2745 = _2741 ? as_type<float>(_2359) : _1501;
    int _2747 = _2743 ? as_type<int>(_2341) : as_type<int>(_1501);
    int _2749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2751 = _2749 != 0;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2755 = _2753 != 0;
    float _2757 = _2751 ? as_type<float>(_2747) : _1501;
    float _2759 = _2755 ? as_type<float>(_2747) : _1501;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2763 = _2761 != 0;
    float _2765 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2769 = _2767 != 0;
    float _2771 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2773 = floor(_2205);
    float _2775 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2777 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2765);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2785 = _2783 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2787 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2771);
    float _2789 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2775);
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2799 = 1.0 / _2781;
    float _2801 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2801;
    float _2805 = _2769 ? as_type<float>(_2747) : _1501;
    float _2807 = _2797 * _2513;
    bool _2809 = _2773 >= 0.0;
    bool _2811 = isnan(_2773);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan(0.0);
    bool _2817 = _2813 || _2815;
    float _2819 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2821 = _2819 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2823 = _2803 * _2531;
    float _2825 = 1.0 / _2785;
    int _2827 = _2817 ? 0 : 1;
    float _2829 = _1166 * 2.0;
    bool _2831 = _2773 > 0.0;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2833;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2841 = _2793 * _2715;
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2845 = _2843 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2847 = 1.0 / _2821;
    float _2849 = _2835 * _2737;
    float _2851 = _2839 * _2799;
    bool _2853 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2855 = isnan(_1156);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2861 = _2857 || _2859;
    float _2863 = float(_2861);
    float _2865 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2787);
    bool _2867 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2869 = isnan(_1156);
    bool _2871 = _2867 || _2869;
    bool _2873 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2875 = _2871 || _2873;
    float _2877 = float(_2875);
    float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2881 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2879;
    float _2883 = floor(_2829);
    float _2885 = _2845 * _2825;
    bool _2887 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2889 = isnan(_1156);
    bool _2891 = _2887 || _2889;
    bool _2893 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2895 = _2891 || _2893;
    float _2897 = float(_2895);
    float _2899 = -_2863;
    float _2901 = _2899 + 1.0;
    int _2903 = ~_2827;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2789);
    int _2911 = _2907;
    if (!_2831)
    {
        int _2913 = ~_2827;
        int _2915 = _2913 + 1;
        _2911 = _2915;
    }
    int _2917 = _2911;
    float _2919 = -_2897;
    float _2921 = _2919 + 1.0;
    bool _2923 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2925 = isnan(_1156);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2931 = _2927 || _2929;
    float _2933 = float(_2931);
    float _2935 = _2881 * _2847;
    float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2939 = _1156 + _2937;
    float _2941 = _2863 * _2921;
    bool _2943 = !_2763;
    int _2945 = _2943 ? 0 : 1;
    float _2947 = _2933 * _2901;
    float _2949 = -_2933;
    float _2951 = _2949 + 1.0;
    float _2953 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2777);
    bool _2955 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2957 = isnan(_1156);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2963 = _2959 || _2961;
    float _2965 = float(_2963);
    float _2967 = -_2877;
    float _2969 = _2967 + 1.0;
    bool _2971 = _2883 > 0.0;
    float _2973 = fma(_2841, _2939, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2975 = _2883 >= 0.0;
    bool _2977 = isnan(_2883);
    bool _2979 = _2975 || _2977;
    bool _2981 = isnan(0.0);
    bool _2983 = _2979 || _2981;
    float _2985 = _2877 * _2951;
    float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2989 = _1156 + _2987;
    bool _2991 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2993 = isnan(_1156);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2999 = _2995 || _2997;
    float _3001 = float(_2999);
    float _3003 = -_2965;
    float _3005 = _3003 + 1.0;
    bool _3007 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3009 = isnan(_1156);
    bool _3011 = _3007 || _3009;
    bool _3013 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3015 = _3011 || _3013;
    float _3017 = float(_3015);
    float _3019 = fma(_2807, _2989, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3021 = _2965 * _2969;
    float _3023 = -_3001;
    float _3025 = _3023 + 1.0;
    float _3027 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3029 = _1156 + _3027;
    float _3031 = _3001 * _3005;
    bool _3033 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3035 = isnan(_1156);
    bool _3037 = _3033 || _3035;
    bool _3039 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3041 = _3037 || _3039;
    float _3043 = float(_3041);
    float _3045 = -_3017;
    float _3047 = _3045 + 1.0;
    float _3049 = _3017 * _3025;
    float _3051 = fma(_2823, _3029, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3053 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3055 = _1156 + _3053;
    float _3057 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3059 = _1156 + _3057;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3063 = _1156 + _3061;
    float _3065 = _3043 * _3047;
    float _3067 = fma(_2849, _3055, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3069 = fma(_2885, _3059, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3071 = fma(_2851, _3063, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    int _3073 = _2983 ? 0 : 1;
    float _3075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3077 = _2973 * _3065;
    bool _3079 = _1449 != 1;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3083 = _1156 + _3081;
    float _3085 = float(uint(_1735));
    float _3087 = -_3043;
    float _3089 = _3087 + 1.0;
    float _3091 = float(uint(_2057));
    float _3093 = fma(_2935, _3083, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3095 = float(uint(_2253));
    float _3097 = as_type<float>(_1262) * _3085;
    float _3099 = fma(_3089, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3077);
    float _3101 = as_type<float>(_1599) * _3091;
    int _3103 = ~_3073;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = trunc(_3097);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = as_type<float>(_1685) * _3095;
    int _3117 = _3107;
    float _3119 = _3091;
    float _3121 = _3089;
    float _3123 = _3099;
    if (!_2971)
    {
        int _3125 = ~_3073;
        int _3127 = _3125 + 1;
        _3117 = _3127;
    }
    int _3129 = _3117;
    float _3131 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3133 = fma(_3019, _3049, _3099);
    float _3135 = float(uint(_2295));
    float _3137 = _2865 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3139 = fma(_3131, _1587, -0.5);
    float _3141 = trunc(_3101);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    int _3147 = ~_1174;
    int _3149 = _3147 + 1;
    float _3151 = as_type<float>(_1703) * _3135;
    int _3153 = ~_1309;
    int _3155 = _3153 + 1;
    float _3157 = fma(_3051, _3031, _3133);
    int _3159 = ~_1331;
    int _3161 = _3159 + 1;
    float _3163 = _2953 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3165 = _1451 != 2;
    float _3167 = trunc(_3115);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    float _3173 = _2909 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3177 = !_3079;
    float _3179 = _3177 ? as_type<float>(_1453) : as_type<float>(_1455);
    int _3181 = _3155 * int(_3145);
    int _3183 = _3181 + _2057;
    float _3185 = trunc(_3151);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    int _3191 = _3149 * int(_3113);
    int _3193 = _3191 + _1735;
    float _3195 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3199 = float(uint(_3183));
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3203 = float(uint(_3193));
    int _3205 = _3161 * int(_3171);
    int _3207 = _3205 + _2253;
    float _3209 = -_3175;
    float _3211 = fma(_3195, 2.0, _3209);
    float _3213 = as_type<float>(_1599) * _3199;
    int _3215 = ~_1341;
    int _3217 = _3215 + 1;
    float _3219 = as_type<float>(_1262) * _3203;
    float _3221 = float(uint(_3207));
    float _3223 = fma(as_type<float>(_1455), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3197);
    float _3225 = as_type<float>(_1455) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3227 = !_3079;
    float _3229 = _3227 ? as_type<float>(_1457) : as_type<float>(_1453);
    int _3231 = _3217 * int(_3189);
    int _3233 = _3231 + _2295;
    float _3235 = as_type<float>(_1685) * _3221;
    float _3237 = trunc(_3219);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = fma(as_type<float>(_1453), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3201);
    float _3245 = as_type<float>(_1453) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3247 = float(uint(_3233));
    float _3249 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3223);
    float _3251 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3243);
    float _3253 = trunc(_3213);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = as_type<float>(_1703) * _3247;
    float _3261 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3263 = _3075;
    float _3265 = _3225;
    if (!_3079)
    {
        _3263 = _1447;
    }
    float _3267 = _3263;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3271 = _3267;
    if (_3079)
    {
        _3271 = _1166;
    }
    float _3273 = _3271;
    float _3275 = -_3261;
    float _3277 = fma(_3225, 2.0, _3275);
    if (_3165)
    {
        _3265 = _1441;
    }
    float _3279 = _3265;
    float _3281 = trunc(_3235);
    float _3283 = precise::max(_3281, 0.0);
    uint _3285 = uint(_3283);
    float _3287 = fma(_3069, _3021, _3157);
    int _3289 = ~_1174;
    int _3291 = _3289 + 1;
    float _3293 = fma(_3245, -2.0, _3269);
    int _3295 = int(_3113) + int(_3241);
    float _3297 = fma(_3067, _2985, _3287);
    float _3299 = -_156;
    float _3301 = fma(_3299, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3211);
    int _3303 = int(_3145) + int(_3257);
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3307 = ~_1309;
    int _3309 = _3307 + 1;
    int _3311 = _3291 * _3295;
    int _3313 = _3311 + _1735;
    float _3315 = as_type<float>(_3291);
    float _3317 = _3279;
    if (_3165)
    {
        _3315 = _1166;
    }
    float _3319 = _3315;
    float _3321 = fma(_3071, _2947, _3297);
    float _3323 = _3319;
    if (!_3165)
    {
        _3317 = _1447;
    }
    float _3325 = _3317;
    int _3327 = _3309 * _3303;
    int _3329 = _3327 + _2057;
    if (!_3165)
    {
        _3323 = _1441;
    }
    float _3331 = _3323;
    float _3333 = trunc(_3259);
    float _3335 = precise::max(_3333, 0.0);
    uint _3337 = uint(_3335);
    bool _3339 = uint(_3313) >= uint(_1174);
    float _3341 = _1166 + _1441;
    int _3343 = int(_3171) + int(_3285);
    float _3345 = _3325 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3347 = ~_1331;
    int _3349 = _3347 + 1;
    float _3351 = _3341 + (-1.0);
    bool _3353 = !_3339;
    int _3355 = _3353 ? 0 : (-1);
    float _3357 = _3331 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3359 = uint(_3329) >= uint(_1309);
    int _3361 = _3349 * _3343;
    int _3363 = _3361 + _2253;
    float _3365 = fma(_3093, _2941, _3321);
    if (!_3079)
    {
        _3119 = _1166;
    }
    float _3367 = _3119;
    float _3369 = -_156;
    float _3371 = fma(_3369, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3277);
    float _3373 = _3367;
    if (!_3079)
    {
        _3121 = _1166;
    }
    float _3375 = _3121;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3379 = int(_3189) + int(_3337);
    float _3381 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3293);
    int _3383 = ~_1341;
    int _3385 = _3383 + 1;
    float _3387 = fma(_2897, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3365);
    bool _3389 = !_3359;
    int _3391 = _3389 ? 0 : (-1);
    bool _3393 = uint(_3363) >= uint(_1331);
    float _3395 = _1447 * 2.0;
    int _3397 = ~_3303;
    int _3399 = _3397 + _3391;
    int _3401 = _3399 + 1;
    float _3403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3405 = _3163 + _3403;
    bool _3407 = !_3393;
    int _3409 = _3407 ? 0 : (-1);
    int _3411 = _3385 * _3379;
    int _3413 = _3411 + _2295;
    float _3415 = _3375;
    if (!_3079)
    {
        _3123 = _1447;
    }
    float _3417 = _3123;
    float _3419 = floor(_3395);
    int _3421 = _1309 * _3401;
    int _3423 = _3421 + _2057;
    int _3425 = ~_3343;
    int _3427 = _3425 + _3409;
    int _3429 = _3427 + 1;
    out.m_69.x = _3387;
    bool _3431 = uint(_3413) >= uint(_1341);
    float _3433 = _3417;
    if (_3079)
    {
        _3373 = _1441;
    }
    float _3435 = _3373;
    bool _3437 = !_3431;
    int _3439 = _3437 ? 0 : (-1);
    if (_3079)
    {
        _3415 = _1441;
    }
    float _3441 = _3415;
    int _3443 = ~_3379;
    int _3445 = _3443 + _3439;
    int _3447 = _3445 + 1;
    int _3449 = _1331 * _3429;
    int _3451 = _3449 + _2253;
    float _3453 = _3273 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3455 = _2353 >> 31;
    float _3457 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3459 = int(_3457);
    if (_3079)
    {
        _3433 = _1166;
    }
    float _3461 = _3433;
    float _3463 = fma(_3453, -2.0, _3377);
    int _3465 = _3455 & 3;
    int _3467 = _1341 * _3447;
    int _3469 = _3467 + _2295;
    bool _3471 = _3419 > 0.0;
    float _3473 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3463);
    bool _3475 = _3419 >= 0.0;
    bool _3477 = isnan(_3419);
    bool _3479 = _3475 || _3477;
    bool _3481 = isnan(0.0);
    bool _3483 = _3479 || _3481;
    float _3485 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _3487 = _2353 + _3465;
    float _3489 = fma(_3485, _2805, -0.5);
    int _3491 = ~_3295;
    int _3493 = _3491 + _3355;
    int _3495 = _3493 + 1;
    float _3497 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3499 = _3137 + _3497;
    int _3501 = _3487 >> 2;
    float _3503 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3505 = _2511 >> 31;
    float _3507 = _3435 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3509 = _3499 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3511 = _1174 * _3495;
    int _3513 = _3511 + _1735;
    int _3515 = _3505 & 3;
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3519 = _3173 + _3517;
    float _3521 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3509);
    int _3523 = _2627 >> 31;
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3527 = _2511 + _3515;
    float _3529 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3521);
    int _3531 = _3523 & 3;
    float _3533 = -_3525;
    float _3535 = fma(_3345, 2.0, _3533);
    bool _3537 = !_2181;
    int _3539 = _3537 ? _3469 : (-1);
    float _3541 = -_156;
    float _3543 = fma(_3541, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3535);
    int _3545 = _2565 >> 31;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3549 = _3527 >> 2;
    bool _3551 = !_2333;
    int _3553 = _3551 ? _3513 : (-1);
    float _3555 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3547);
    int _3557 = _2627 + _3531;
    bool _3559 = _3529 >= 0.0;
    float _3561 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3555);
    bool _3563 = _2519 != 3;
    int _3565 = _3545 & 3;
    int _3567 = _3549 << 4;
    int _3569 = _3567 + 512;
    float _3571 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _3573 = !_2103;
    int _3575 = _3573 ? _3451 : (-1);
    int _3577 = _3501 << 4;
    int _3579 = _3577 + 368;
    float _3581 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3571);
    bool _3583 = _2365 != 3;
    float _3585 = _3229 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3587 = _3557 >> 2;
    uint _3589 = uint(int(uint(_3579) >> uint(2)));
    uint _3591 = uint(int(uint(int(_3589)) >> uint(2)));
    int _3593 = int(_3589) & 3;
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[int(_3591)][_3593];
    int _3597 = int(_3589) + 1;
    uint _3599 = uint(int(uint(_3597) >> uint(2)));
    int _3601 = _3597 & 3;
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[int(_3599)][_3601];
    float _3605 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3581);
    int _3607 = _2565 + _3565;
    float _3609 = as_type<float>(_3545);
    if (_3559)
    {
        out.m_49.x = 0.0;
    }
    bool _3611 = !_2035;
    int _3613 = _3611 ? _3423 : (-1);
    float _3615 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _3617 = uint(int(uint(_3569) >> uint(2)));
    uint _3619 = uint(int(uint(int(_3617)) >> uint(2)));
    int _3621 = int(_3617) & 3;
    float _3623 = (*spvDescriptorSet0.vp_c9)._m0[int(_3619)][_3621];
    int _3625 = int(_3617) + 1;
    uint _3627 = uint(int(uint(_3625) >> uint(2)));
    int _3629 = _3625 & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    float _3633 = -_3615;
    float _3635 = fma(_3507, 2.0, _3633);
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3639 = _3607 >> 2;
    float _3641 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3643 = !_2367;
    int _3645 = _3643 ? 0 : 1;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3649 = fma(_3461, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3637);
    int _3651 = _2565 & 3;
    bool _3653 = _3651 != 0;
    float _3655 = fma(_3585, -2.0, _3641);
    int _3657 = _3639 << 4;
    int _3659 = _3657 + 656;
    float _3661 = fma(_3179, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3647);
    int _3663 = _3587 << 4;
    int _3665 = _3663 + 800;
    float _3667 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3669 = _3179 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3671 = _2511 & 3;
    bool _3673 = _3671 != 0;
    float _3675 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3661);
    bool _3677 = !_3653;
    int _3679 = _3677 ? 0 : 1;
    uint _3681 = uint(int(uint(_3659) >> uint(2)));
    uint _3683 = uint(int(uint(int(_3681)) >> uint(2)));
    int _3685 = int(_3681) & 3;
    float _3687 = (*spvDescriptorSet0.vp_c9)._m0[int(_3683)][_3685];
    int _3689 = int(_3681) + 1;
    uint _3691 = uint(int(uint(_3689) >> uint(2)));
    int _3693 = _3689 & 3;
    float _3695 = (*spvDescriptorSet0.vp_c9)._m0[int(_3691)][_3693];
    int _3697 = _2627 & 3;
    bool _3699 = _3697 != 0;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_3559)
    {
        _3609 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3703 = _3609;
    float _3705 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3655);
    float _3707 = -_3667;
    float _3709 = fma(_3669, 2.0, _3707);
    int _3711 = abs(_2421);
    float _3713 = fma(_3357, -2.0, _3701);
    uint _3715 = uint(int(uint(_3665) >> uint(2)));
    uint _3717 = uint(int(uint(int(_3715)) >> uint(2)));
    int _3719 = int(_3715) & 3;
    float _3721 = (*spvDescriptorSet0.vp_c9)._m0[int(_3717)][_3719];
    int _3723 = int(_3715) + 1;
    uint _3725 = uint(int(uint(_3723) >> uint(2)));
    int _3727 = _3723 & 3;
    float _3729 = (*spvDescriptorSet0.vp_c9)._m0[int(_3725)][_3727];
    float _3731 = -_156;
    float _3733 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3709);
    int _3735 = as_type<int>(_3703);
    if (_3559)
    {
        float _3737 = _3703 * 5.0;
        _3735 = as_type<int>(_3737);
    }
    int _3739 = _3735;
    int _3741 = abs(_2593);
    float _3743 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3649);
    float _3745 = fma(_3675, _3139, _3733);
    int _3747 = abs(_2705);
    int _3749 = _3579 + 8;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    uint _3753 = uint(int(uint(int(_3751)) >> uint(2)));
    int _3755 = int(_3751) & 3;
    float _3757 = (*spvDescriptorSet0.vp_c9)._m0[int(_3753)][_3755];
    int _3759 = int(_3751) + 1;
    uint _3761 = uint(int(uint(_3759) >> uint(2)));
    int _3763 = _3759 & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    if (_3559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12021 = as_type<float>(_3739);
        out.gl_Position.z = _12021;
    }
    float _3767 = -_156;
    float _3769 = fma(_3767, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3635);
    bool _3771 = !_3673;
    int _3773 = _3771 ? 0 : 1;
    float _3775 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3713);
    int _3777 = abs(_3645);
    float _3779 = -_3705;
    float _3781 = fma(_3605, _3489, _3779);
    int _3783 = _3569 + 8;
    uint _3785 = uint(int(uint(_3783) >> uint(2)));
    uint _3787 = uint(int(uint(int(_3785)) >> uint(2)));
    int _3789 = int(_3785) & 3;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[int(_3787)][_3789];
    int _3793 = int(_3785) + 1;
    uint _3795 = uint(int(uint(_3793) >> uint(2)));
    int _3797 = _3793 & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    int _3801 = abs(_2659);
    int _3803 = abs(_3773);
    int _3805 = ~_3741;
    int _3807 = _3805 + 1;
    int _3809 = _3807 + 1;
    int _3811 = _3659 + 8;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = ~_3711;
    int _3831 = _3829 + 1;
    int _3833 = _3831 + 1;
    int _3835 = _3809 * as_type<int>(_3631);
    bool _3837 = !_3699;
    int _3839 = _3837 ? 0 : 1;
    int _3841 = _3665 + 8;
    uint _3843 = uint(int(uint(_3841) >> uint(2)));
    uint _3845 = uint(int(uint(int(_3843)) >> uint(2)));
    int _3847 = int(_3843) & 3;
    float _3849 = (*spvDescriptorSet0.vp_c9)._m0[int(_3845)][_3847];
    int _3851 = int(_3843) + 1;
    uint _3853 = uint(int(uint(_3851) >> uint(2)));
    int _3855 = _3851 & 3;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[int(_3853)][_3855];
    int _3859 = ~_3777;
    int _3861 = _3859 + 1;
    int _3863 = _3861 + 1;
    int _3865 = _3833 * as_type<int>(_3603);
    int _3867 = ~_3803;
    int _3869 = _3867 + 1;
    int _3871 = _3869 + 1;
    float _3873 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3875 = int(_3873);
    bool _3877 = _2595 != 3;
    int _3879 = _3863 * as_type<int>(_3595);
    int _3881 = _3879 + _3865;
    bool _3883 = !_3583;
    int _3885 = _3883 ? 0 : (-1);
    int _3887 = _3871 * as_type<int>(_3623);
    int _3889 = _3887 + _3835;
    bool _3891 = _2645 != 3;
    int _3893 = abs(_3839);
    bool _3895 = !_3563;
    int _3897 = _3895 ? 0 : (-1);
    bool _3899 = !_3877;
    int _3901 = _3899 ? 0 : (-1);
    int _3903 = ~_3801;
    int _3905 = _3903 + 1;
    int _3907 = _3905 + 1;
    int _3909 = abs(_2485);
    int _3911 = abs(_2573);
    int _3913 = _3907 * as_type<int>(_3695);
    int _3915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3917 = _3915 != 0;
    int _3919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3921 = _3919 != 0;
    int _3923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3925 = _3923 != 0;
    int _3927 = ~_3747;
    int _3929 = _3927 + 1;
    int _3931 = _3929 + 1;
    float _3933 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3935 = int(_3933);
    int _3937 = ~_3909;
    int _3939 = _3937 + 1;
    int _3941 = _3939 + 1;
    int _3943 = _3931 * as_type<int>(_3729);
    int _3945 = ~_3893;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    int _3951 = ~_3911;
    int _3953 = _3951 + 1;
    int _3955 = _3953 + 1;
    int _3957 = _3941 * as_type<int>(_3757);
    int _3959 = _3957 + _3881;
    int _3961 = abs(_3679);
    int _3963 = _3949 * as_type<int>(_3721);
    int _3965 = _3963 + _3943;
    int _3967 = abs(_2643);
    int _3969 = _3955 * as_type<int>(_3791);
    int _3971 = _3969 + _3889;
    int _3973 = ~_3961;
    int _3975 = _3973 + 1;
    int _3977 = _3975 + 1;
    float _3979 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3981 = int(_3979);
    int _3983 = abs(_2691);
    int _3985 = abs(_3897);
    int _3987 = _3977 * as_type<int>(_3687);
    int _3989 = _3987 + _3913;
    float _3991 = float(uint(_3459));
    int _3993 = ~_3967;
    int _3995 = _3993 + 1;
    int _3997 = _3995 + 1;
    float _3999 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4001 = log2(_3999);
    int _4003 = ~_3983;
    int _4005 = _4003 + 1;
    int _4007 = _4005 + 1;
    int _4009 = ~_3985;
    int _4011 = _4009 + 1;
    int _4013 = _4011 + 1;
    int _4015 = _3997 * as_type<int>(_3819);
    int _4017 = _4015 + _3989;
    int _4019 = abs(_3885);
    int _4021 = _4007 * as_type<int>(_3849);
    int _4023 = _4021 + _3965;
    float _4025 = float(uint(_3935));
    float _4027 = 1.0 / _3991;
    int _4029 = _4013 * as_type<int>(_3799);
    int _4031 = _4029 + _3971;
    int _4033 = ~_4019;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = float(uint(_3875));
    int _4041 = abs(_3901);
    int _4043 = _4037 * as_type<int>(_3765);
    int _4045 = _4043 + _3959;
    int _4047 = abs(_2501);
    float _4049 = 1.0 / _4025;
    int _4051 = abs(_2733);
    float _4053 = _4001 * _156;
    int _4055 = ~_4041;
    int _4057 = _4055 + 1;
    int _4059 = _4057 + 1;
    int _4061 = ~_4047;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    bool _4067 = !_3891;
    int _4069 = _4067 ? 0 : (-1);
    float _4071 = 1.0 / _4039;
    int _4073 = abs(_2719);
    int _4075 = _4059 * as_type<int>(_3827);
    int _4077 = _4075 + _4017;
    int _4079 = abs(_4069);
    int _4081 = _4045 * _4065;
    int _4083 = ~_4073;
    int _4085 = _4083 + 1;
    int _4087 = _4085 + 1;
    int _4089 = as_type<int>(_4027) + (-2);
    int _4091 = _3553 * _4047;
    int _4093 = _4091 + _4081;
    int _4095 = ~_4051;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = _4087 * _4077;
    float _4103 = exp2(_4053);
    float _4105 = float(uint(_4093));
    int _4107 = _4099 * _4031;
    int _4109 = ~_4079;
    int _4111 = _4109 + 1;
    int _4113 = _4111 + 1;
    int _4115 = _3575 * _4073;
    int _4117 = _4115 + _4101;
    int _4119 = as_type<int>(_4049) + (-2);
    int _4121 = _3613 * _4051;
    int _4123 = _4121 + _4107;
    int _4125 = abs(_2945);
    int _4127 = _4113 * as_type<int>(_3857);
    int _4129 = _4127 + _4023;
    float _4131 = as_type<float>(_4089) * _4105;
    int _4133 = as_type<int>(_4071) + (-2);
    float _4135 = float(uint(_4123));
    float _4137 = float(uint(_4117));
    float _4139 = trunc(_4131);
    float _4141 = precise::max(_4139, 0.0);
    uint _4143 = uint(_4141);
    int _4145 = ~_4125;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    float _4151 = as_type<float>(_4119) * _4135;
    float _4153 = float(uint(_3981));
    float _4155 = as_type<float>(_4133) * _4137;
    int _4157 = _3483 ? 0 : 1;
    int _4159 = _4149 * _4129;
    int _4161 = abs(_3459);
    float _4163 = trunc(_4151);
    float _4165 = precise::max(_4163, 0.0);
    uint _4167 = uint(_4165);
    int _4169 = ~_4157;
    int _4171 = _4169 + 1;
    int _4173 = _4171 + 1;
    int _4175 = _3539 * _4125;
    int _4177 = _4175 + _4159;
    int _4179 = _4173;
    if (!_3471)
    {
        int _4181 = ~_4157;
        int _4183 = _4181 + 1;
        _4179 = _4183;
    }
    int _4185 = _4179;
    float _4187 = -_4103;
    float _4189 = _4187 + 1.0;
    int _4191 = ~_3459;
    int _4193 = _4191 + 1;
    int _4195 = ~_3935;
    int _4197 = _4195 + 1;
    float _4199 = trunc(_4155);
    float _4201 = precise::max(_4199, 0.0);
    uint _4203 = uint(_4201);
    int _4205 = abs(_3935);
    int _4207 = _4193 * int(_4143);
    int _4209 = _4207 + _4093;
    float _4211 = float(uint(_4161));
    int _4213 = ~_3875;
    int _4215 = _4213 + 1;
    float _4217 = float(uint(_4205));
    float _4219 = 1.0 / _4153;
    int _4221 = _4197 * int(_4167);
    int _4223 = _4221 + _4123;
    int _4225 = abs(_3875);
    float _4227 = float(uint(_4209));
    float _4229 = float(uint(_4223));
    float _4231 = 1.0 / _4211;
    int _4233 = _4215 * int(_4203);
    int _4235 = _4233 + _4117;
    float _4237 = float(uint(_4225));
    float _4239 = as_type<float>(_4089) * _4227;
    int _4241 = abs(_3981);
    float _4243 = as_type<float>(_4119) * _4229;
    float _4245 = float(uint(_4235));
    float _4247 = 1.0 / _4217;
    int _4249 = as_type<int>(_4219) + (-2);
    float _4251 = as_type<float>(_4133) * _4245;
    float _4253 = float(uint(_4177));
    float _4255 = float(uint(_4241));
    float _4257 = 1.0 / _4237;
    int _4259 = abs(_4093);
    float _4261 = as_type<float>(_4249) * _4253;
    int _4263 = abs(_4123);
    int _4265 = as_type<int>(_4231) + (-2);
    float _4267 = float(uint(_4259));
    float _4269 = 1.0 / _4255;
    int _4271 = as_type<int>(_4247) + (-2);
    float _4273 = as_type<float>(_4265) * _4267;
    float _4275 = float(uint(_4263));
    bool _4277 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4279 = isnan(1.0);
    bool _4281 = _4277 || _4279;
    bool _4283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4285 = _4281 || _4283;
    float _4287 = trunc(_4261);
    float _4289 = precise::max(_4287, 0.0);
    uint _4291 = uint(_4289);
    float _4293 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4295 = 1.0 + _4293;
    int _4297 = abs(_4117);
    float _4299 = as_type<float>(_4271) * _4275;
    float _4301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4303 = as_type<int>(_4257) + (-2);
    float _4305 = trunc(_4273);
    float _4307 = precise::max(_4305, 0.0);
    uint _4309 = uint(_4307);
    float _4311 = float(uint(_4297));
    float _4313 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4315 = as_type<float>(_4303) * _4311;
    int _4317 = abs(_4177);
    float _4319 = 1.0 / _4295;
    int _4321 = ~_3981;
    int _4323 = _4321 + 1;
    float _4325 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4301);
    float _4327 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4313);
    float _4329 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4331 = as_type<int>(_4269) + (-2);
    float _4333 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4325);
    float _4335 = float(uint(_4317));
    float _4337 = trunc(_4299);
    float _4339 = precise::max(_4337, 0.0);
    uint _4341 = uint(_4339);
    bool _4343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    bool _4349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4351 = _4347 || _4349;
    float _4353 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4355 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4327);
    int _4357 = _4323 * int(_4291);
    int _4359 = _4357 + _4177;
    int _4361 = ~_4161;
    int _4363 = _4361 + 1;
    float _4365 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4329);
    float _4367 = as_type<float>(_4331) * _4335;
    float _4369 = trunc(_4315);
    float _4371 = precise::max(_4369, 0.0);
    uint _4373 = uint(_4371);
    float _4375 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4353);
    float _4377 = _4351 ? _4189 : 0.0;
    float _4379 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4365);
    float _4381 = float(uint(_4359));
    int _4383 = _4363 * int(_4309);
    int _4385 = _4383 + _4259;
    int _4387 = ~_4205;
    int _4389 = _4387 + 1;
    float _4391 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4375);
    float _4393 = trunc(_4243);
    float _4395 = precise::max(_4393, 0.0);
    uint _4397 = uint(_4395);
    if (_4285)
    {
        float _4399 = _4377 * _4319;
        _158 = _4399;
    }
    float _4401 = _158;
    float _4403 = as_type<float>(_4249) * _4381;
    float _4405 = float(uint(_4385));
    int _4407 = _4389 * int(_4341);
    int _4409 = _4407 + _4263;
    float _4411 = trunc(_4239);
    float _4413 = precise::max(_4411, 0.0);
    uint _4415 = uint(_4413);
    int _4417 = ~_4225;
    int _4419 = _4417 + 1;
    float _4421 = as_type<float>(_4265) * _4405;
    float _4423 = trunc(_4367);
    float _4425 = precise::max(_4423, 0.0);
    uint _4427 = uint(_4425);
    int _4429 = int(_4167) + int(_4397);
    int _4431 = _4419 * int(_4373);
    int _4433 = _4431 + _4297;
    int _4435 = ~_3981;
    int _4437 = _4435 + 1;
    float _4439 = float(uint(_4433));
    float _4441 = trunc(_4403);
    float _4443 = precise::max(_4441, 0.0);
    uint _4445 = uint(_4443);
    int _4447 = int(_4143) + int(_4415);
    int _4449 = ~_4241;
    int _4451 = _4449 + 1;
    float _4453 = as_type<float>(_4303) * _4439;
    float _4455 = trunc(_4251);
    float _4457 = precise::max(_4455, 0.0);
    uint _4459 = uint(_4457);
    float _4461 = trunc(_4453);
    float _4463 = precise::max(_4461, 0.0);
    uint _4465 = uint(_4463);
    float _4467 = float(uint(_4409));
    int _4469 = ~_3459;
    int _4471 = _4469 + 1;
    int _4473 = int(_4291) + int(_4445);
    float _4475 = as_type<float>(_4271) * _4467;
    int _4477 = _4451 * int(_4427);
    int _4479 = _4477 + _4317;
    float _4481 = trunc(_4421);
    float _4483 = precise::max(_4481, 0.0);
    uint _4485 = uint(_4483);
    int _4487 = ~_3935;
    int _4489 = _4487 + 1;
    float _4491 = float(uint(_4479));
    int _4493 = _4471 * _4447;
    int _4495 = _4493 + _4093;
    int _4497 = ~_3875;
    int _4499 = _4497 + 1;
    float _4501 = as_type<float>(_4331) * _4491;
    float _4503 = trunc(_4475);
    float _4505 = precise::max(_4503, 0.0);
    uint _4507 = uint(_4505);
    int _4509 = _4489 * _4429;
    int _4511 = _4509 + _4123;
    int _4513 = int(_4203) + int(_4459);
    int _4515 = _4437 * _4473;
    int _4517 = _4515 + _4177;
    bool _4519 = uint(_4511) >= uint(_3935);
    float _4521 = trunc(_4501);
    float _4523 = precise::max(_4521, 0.0);
    uint _4525 = uint(_4523);
    bool _4527 = uint(_4495) >= uint(_3459);
    int _4529 = _4499 * _4513;
    int _4531 = _4529 + _4117;
    int _4533 = int(_4373) + int(_4465);
    int _4535 = int(_4309) + int(_4485);
    int _4537 = ~_4161;
    int _4539 = _4537 + 1;
    bool _4541 = !_4519;
    int _4543 = _4541 ? 0 : (-1);
    bool _4545 = uint(_4517) >= uint(_3981);
    int _4547 = _4539 * _4535;
    int _4549 = _4547 + _4259;
    int _4551 = ~_4225;
    int _4553 = _4551 + 1;
    bool _4555 = !_4527;
    int _4557 = _4555 ? 0 : (-1);
    bool _4559 = uint(_4531) >= uint(_3875);
    int _4561 = _4553 * _4533;
    int _4563 = _4561 + _4297;
    int _4565 = int(_4341) + int(_4507);
    int _4567 = ~_4205;
    int _4569 = _4567 + 1;
    bool _4571 = !_4559;
    int _4573 = _4571 ? 0 : (-1);
    bool _4575 = uint(_4549) >= uint(_4161);
    int _4577 = _4569 * _4565;
    int _4579 = _4577 + _4263;
    int _4581 = ~_4241;
    int _4583 = _4581 + 1;
    bool _4585 = !_4575;
    int _4587 = _4585 ? 0 : (-1);
    bool _4589 = uint(_4563) >= uint(_4225);
    float _4591 = _3499 * _3499;
    int _4593 = int(_4427) + int(_4525);
    float _4595 = fma(_3405, _3405, _4591);
    bool _4597 = !_4545;
    int _4599 = _4597 ? 0 : (-1);
    bool _4601 = uint(_4579) >= uint(_4205);
    float _4603 = fma(_3519, _3519, _4595);
    int _4605 = _4583 * _4593;
    int _4607 = _4605 + _4317;
    int _4609 = ~_4447;
    int _4611 = _4609 + _4557;
    int _4613 = _4611 + 1;
    float _4615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4617 = !_4601;
    int _4619 = _4617 ? 0 : (-1);
    bool _4621 = uint(_4607) >= uint(_4241);
    int _4623 = _3459 * _4613;
    int _4625 = _4623 + _4093;
    int _4627 = ~_4513;
    int _4629 = _4627 + _4573;
    int _4631 = _4629 + 1;
    bool _4633 = !_4589;
    int _4635 = _4633 ? 0 : (-1);
    float _4637 = rsqrt(_4603);
    bool _4639 = _3459 == 0;
    int _4641 = ~_4473;
    int _4643 = _4641 + _4599;
    int _4645 = _4643 + 1;
    int _4647 = _3875 * _4631;
    int _4649 = _4647 + _4117;
    bool _4651 = !_4639;
    int _4653 = _4651 ? _4625 : (-1);
    bool _4655 = _3875 == 0;
    float _4657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4659 = ~_4429;
    int _4661 = _4659 + _4543;
    int _4663 = _4661 + 1;
    float _4665 = _4615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4667 = !_4655;
    int _4669 = _4667 ? _4649 : (-1);
    bool _4671 = _3459 == 0;
    int _4673 = _3935 * _4663;
    int _4675 = _4673 + _4123;
    int _4677 = _4093 ^ _3459;
    float _4679 = _3499 * _4637;
    int _4681 = _4123 ^ _3935;
    float _4683 = _3405 * _4637;
    uint _4685 = uint(int(uint(_4677) >> uint(31)));
    float _4687 = -_4679;
    float _4689 = fma(_4687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3499);
    uint _4691 = uint(int(uint(_4681) >> uint(31)));
    float _4693 = -_4683;
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3405);
    bool _4697 = !_4621;
    int _4699 = _4697 ? 0 : (-1);
    float _4701 = _3781 + 0.5;
    bool _4703 = _3935 == 0;
    float _4705 = fma(_4665, _1483, -0.5);
    int _4707 = ~_4587;
    int _4709 = _4535 + _4707;
    int _4711 = _4709 + 1;
    float _4713 = _4689 * _4689;
    int _4715 = ~int(_4685);
    int _4717 = _4715 + 1;
    float _4719 = _3745 + 0.5;
    int _4721 = ~_4619;
    int _4723 = _4565 + _4721;
    int _4725 = _4723 + 1;
    float _4727 = fma(_4695, _4695, _4713);
    int _4729 = ~int(_4691);
    int _4731 = _4729 + 1;
    float _4733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4735 = !_4703;
    int _4737 = _4735 ? _4675 : (-1);
    int _4739 = _3981 * _4645;
    int _4741 = _4739 + _4177;
    int _4743 = _4711 ^ _4717;
    out.m_71.x = _4719;
    out.m_71.y = _4701;
    bool _4745 = _3981 == 0;
    float _4747 = _4657 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4749 = _4725 ^ _4731;
    float _4751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4753 = ~_4717;
    int _4755 = _4753 + _4743;
    int _4757 = _4755 + 1;
    bool _4759 = !_4745;
    int _4761 = _4759 ? _4741 : (-1);
    int _4763 = ~_4731;
    int _4765 = _4763 + _4749;
    int _4767 = _4765 + 1;
    bool _4769 = _3935 == 0;
    float _4771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4773 = !_4671;
    int _4775 = _4773 ? _4757 : (-1);
    float _4777 = _4733 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4779 = _3875 == 0;
    int _4781 = _4117 ^ _3875;
    float _4783 = fma(_4777, _1547, -0.5);
    bool _4785 = !_4769;
    int _4787 = _4785 ? _4767 : (-1);
    float _4789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4791 = _3981 == 0;
    int _4793 = _4177 ^ _3981;
    float _4795 = float(_4653);
    uint _4797 = uint(int(uint(_4781) >> uint(31)));
    float _4799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _4801 = float(_4737);
    float _4803 = fma(_4665, _4795, _3301);
    float _4805 = float(_4669);
    float _4807 = _4751 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4809 = ~_4635;
    int _4811 = _4533 + _4809;
    int _4813 = _4811 + 1;
    float _4815 = fma(_4777, _4801, _3769);
    int _4817 = ~int(_4797);
    int _4819 = _4817 + 1;
    float _4821 = fma(_4807, _4805, _3543);
    float _4823 = float(_4761);
    float _4825 = _4771 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4827 = _4813 ^ _4819;
    float _4829 = fma(_4807, _1569, -0.5);
    float _4831 = float(_4775);
    float _4833 = fma(_4825, _1579, -0.5);
    int _4835 = ~_4819;
    int _4837 = _4835 + _4827;
    int _4839 = _4837 + 1;
    float _4841 = fma(_4825, _4823, _3371);
    uint _4843 = uint(int(uint(_4793) >> uint(31)));
    float _4845 = fma(_4747, _2735, -0.5);
    float _4847 = -_2669;
    float _4849 = fma(_4747, _4831, _4847);
    float _4851 = _4799 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _4853 = !_4779;
    int _4855 = _4853 ? _4839 : (-1);
    float _4857 = fma(_4379, _4829, _4821);
    int _4859 = ~_4699;
    int _4861 = _4593 + _4859;
    int _4863 = _4861 + 1;
    float _4865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4867 = ~int(_4843);
    int _4869 = _4867 + 1;
    float _4871 = _4789 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4873 = float(_4787);
    float _4875 = fma(_4391, _4705, _4803);
    float _4877 = float(_4855);
    float _4879 = fma(_4871, _2745, -0.5);
    int _4881 = _4863 ^ _4869;
    float _4883 = -_3473;
    float _4885 = fma(_4871, _4873, _4883);
    float _4887 = fma(_4851, _2757, -0.5);
    float _4889 = -_3775;
    float _4891 = fma(_4851, _4877, _4889);
    int _4893 = ~_4869;
    int _4895 = _4893 + _4881;
    int _4897 = _4895 + 1;
    float _4899 = _3519 * _4637;
    float _4901 = fma(_4333, _4845, _4849);
    float _4903 = fma(_3249, _4833, _4841);
    bool _4905 = !_4791;
    int _4907 = _4905 ? _4897 : (-1);
    float _4909 = -_4899;
    float _4911 = fma(_4909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3519);
    float _4913 = _4901 + 0.5;
    float _4915 = _4865 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _4917 = float(_4907);
    float _4919 = fma(_4911, _4911, _4727);
    float _4921 = fma(_3561, _4783, _4815);
    float _4923 = in.m_73.x;
    float _4925 = in.m_73.y;
    float _4927 = in.m_73.z;
    float _4929 = fma(_4915, _2759, -0.5);
    float _4931 = -_3381;
    float _4933 = fma(_4915, _4917, _4931);
    float _4935 = fma(_3743, _4879, _4885);
    float _4937 = fma(_4355, _4887, _4891);
    bool _4939 = !_3917;
    int _4941 = _4939 ? 0 : 1;
    float _4943 = fma(_3251, _4929, _4933);
    float _4945 = _4935 + 0.5;
    bool _4947 = !_3921;
    int _4949 = _4947 ? 0 : 1;
    float _4951 = _4857 + 0.5;
    float _4953 = _4875 + 0.5;
    float _4955 = _4921 + 0.5;
    float _4957 = _4903 + 0.5;
    float _4959 = _4937 + 0.5;
    float _4961 = _4943 + 0.5;
    int _4963 = abs(_4941);
    out.m_75.x = _4953;
    out.m_75.y = _4913;
    out.m_75.z = _4955;
    out.m_75.w = _4945;
    int _4965 = abs(_4949);
    out.m_77.x = _4951;
    out.m_77.y = _4959;
    float _4967 = float(_4185);
    bool _4969 = !_3925;
    int _4971 = _4969 ? 0 : 1;
    out.m_79.x = _4957;
    out.m_79.y = _4961;
    float _4973 = float(_4963);
    float _4975 = as_type<float>(_4717);
    float _4977 = as_type<float>(_4743);
    if (_3559)
    {
        return out;
    }
    float _4979 = -_4679;
    float _4981 = fma(_4979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3137);
    float _4983 = -_4683;
    float _4985 = fma(_4983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3163);
    float _4987 = float(_2917);
    float _4989 = _4973 * _4967;
    float _4991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4993 = _4981 + _4991;
    float _4995 = float(_4965);
    float _4997 = -_4899;
    float _4999 = fma(_4997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3173);
    float _5001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5003 = _4985 + _5001;
    float _5005 = _4993 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5007 = _4989 * (-2.0);
    float _5009 = _4995 * _4987;
    float _5011 = _1166 + _1447;
    float _5013 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5015 = _4999 + _5013;
    float _5017 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5005);
    float _5019 = _5011 + (-1.0);
    float _5021 = _5009 * (-2.0);
    float _5023 = fma(_5015, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5017);
    float _5025 = _1441 + (-0.5);
    float _5027 = fma(_5007, _4923, _4923);
    float _5029 = fma(_5019, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5031 = _1166 + (-0.5);
    float _5033 = fma(_5021, _4925, _4925);
    bool _5035 = _5023 >= 0.0;
    float _5037 = fma(_3503, _5007, _3503);
    float _5039 = fma(_5025, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5027);
    float _5041 = fma(_5029, _5021, _5029);
    float _5043 = fma(_5031, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5033);
    int _5045 = abs(_4971);
    float _5047 = fma(_5037, _4401, _5039);
    float _5049 = sqrt(_4919);
    float _5051 = fma(_5041, _4401, _5043);
    float _5053 = float(_5045);
    float _5055 = _5047 * 0.15915493667125701904296875;
    float _5057 = float(_3129);
    float _5059 = _5051 * 0.15915493667125701904296875;
    float _5061 = _5033;
    float _5063 = _5003;
    float _5065 = _4993;
    if (_5035)
    {
        _5061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5067 = _5061;
    float _5069 = _5055 * 6.283185482025146484375;
    float _5071 = sin(_5069);
    float _5073 = _5053 * _5057;
    float _5075 = _1441 + _1447;
    int _5077 = as_type<int>(_5067);
    if (_5035)
    {
        float _5079 = _5067 * 5.0;
        _5077 = as_type<int>(_5079);
    }
    int _5081 = _5077;
    if (_5035)
    {
        out.m_49.x = 0.0;
    }
    float _5083 = _5075 + (-1.0);
    float _5085 = _5073 * (-2.0);
    float _5087 = _5055 * 6.283185482025146484375;
    float _5089 = cos(_5087);
    if (_5035)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13889 = as_type<float>(_5081);
        out.gl_Position.z = _13889;
    }
    float _5091 = _5059 * 6.283185482025146484375;
    float _5093 = sin(_5091);
    if (_5035)
    {
        return out;
    }
    float _5095 = -_3137;
    float _5097 = _5095 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5099 = -_3163;
    float _5101 = _5099 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5103 = fma(_5083, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5105 = fma(_5085, _4927, _4927);
    float _5107 = _5097 * _5097;
    float _5109 = _1447 + (-0.5);
    float _5111 = -_3173;
    float _5113 = _5111 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5115 = fma(_5103, _5085, _5103);
    float _5117 = fma(_5101, _5101, _5107);
    float _5119 = fma(_5109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5105);
    float _5121 = _5059 * 6.283185482025146484375;
    float _5123 = cos(_5121);
    float _5125 = _4637 * _5049;
    float _5127 = fma(_5113, _5113, _5117);
    float _5129 = fma(_5115, _4401, _5119);
    float _5131 = _5071 * _5093;
    float _5133 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5135 = _5089 * _5093;
    float _5137 = _5129 * 0.15915493667125701904296875;
    float _5139 = rsqrt(_5127);
    float _5141 = _5137 * 6.283185482025146484375;
    float _5143 = sin(_5141);
    float _5145 = _5089 * _5123;
    float _5147 = _5071 * _5123;
    float _5149 = _5101 * _5139;
    float _5151 = _5113 * _5139;
    float _5153 = in.m_81.x;
    float _5155 = in.m_81.y;
    float _5157 = in.m_81.z;
    float _5159 = _5097 * _5139;
    float _5161 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5163 = _5149 * _5161;
    float _5165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5167 = _5151 * _5165;
    float _5169 = _5137 * 6.283185482025146484375;
    float _5171 = cos(_5169);
    float _5173 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5175 = _5159 * _5173;
    float _5177 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5179 = -_5163;
    float _5181 = fma(_5151, _5177, _5179);
    float _5183 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5185 = -_5167;
    float _5187 = fma(_5159, _5183, _5185);
    float _5189 = fma(_5143, _5145, _5131);
    float _5191 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5193 = -_5175;
    float _5195 = fma(_5149, _5191, _5193);
    float _5197 = _5181 * _5181;
    float _5199 = fma(_5143, _5131, _5145);
    float _5201 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5203 = fma(_5187, _5187, _5197);
    float _5205 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5207 = fma(_5195, _5195, _5203);
    float _5209 = _5125 * _5205;
    float _5211 = _5089 * _5171;
    float _5213 = _5071 * _5171;
    float _5215 = rsqrt(_5207);
    float _5217 = _5125 * _5133;
    float _5219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5155);
    float _5221 = _5123 * _5171;
    float _5223 = _5093 * _5171;
    float _5225 = _5219 * _5209;
    float _5227 = _5125 * _5201;
    float _5229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5153);
    float _5231 = -_5135;
    float _5233 = fma(_5143, _5147, _5231);
    float _5235 = -_5147;
    float _5237 = fma(_5143, _5135, _5235);
    float _5239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5157);
    float _5241 = _5229 * _5227;
    float _5243 = _5211 * _5225;
    float _5245 = -_5225;
    float _5247 = _5143 * _5245;
    float _5249 = _5213 * _5225;
    float _5251 = _5187 * _5215;
    float _5253 = _5239 * _5217;
    float _5255 = _5181 * _5215;
    float _5257 = fma(_5189, _5241, _5243);
    float _5259 = _5159 * _5251;
    float _5261 = _5195 * _5215;
    float _5263 = fma(_5221, _5241, _5247);
    float _5265 = fma(_5237, _5253, _5257);
    float _5267 = _5151 * _5255;
    float _5269 = -_5259;
    float _5271 = fma(_5149, _5255, _5269);
    float _5273 = fma(_5233, _5241, _5249);
    float _5275 = fma(_5223, _5253, _5263);
    float _5277 = -_5267;
    float _5279 = fma(_5159, _5261, _5277);
    float _5281 = _5271 * _5265;
    float _5283 = fma(_5199, _5253, _5273);
    float _5285 = _5149 * _5261;
    float _5287 = _5279 * _5265;
    float _5289 = fma(_5261, _5275, _5281);
    float _5291 = -_5285;
    float _5293 = fma(_5151, _5251, _5291);
    float _5295 = fma(_5251, _5275, _5287);
    float _5297 = fma(_5151, _5283, _5289);
    float _5299 = fma(_5149, _5283, _5295);
    float _5301 = _3173 + _5297;
    float _5303 = _3163 + _5299;
    float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5307 = _5301 + _5305;
    float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5311 = _5303 + _5309;
    float _5313 = _5307 * _5307;
    float _5315 = fma(_5311, _5311, _5313);
    float _5317 = _5293 * _5265;
    float _5319 = sqrt(_5315);
    float _5321 = fma(_5255, _5275, _5317);
    float _5323 = fma(_5159, _5283, _5321);
    float _5325 = _3137 + _5323;
    bool _5327 = _5319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5329 = _5323;
    float _5331 = _5283;
    float _5333 = _5321;
    if (!_5327)
    {
        _5329 = _5303;
    }
    float _5335 = _5329;
    float _5337 = _5335;
    if (!_5327)
    {
        _5331 = _5301;
    }
    float _5339 = _5331;
    float _5341 = _5339;
    if (!_5327)
    {
        _5333 = _5325;
    }
    float _5343 = _5333;
    bool _5345 = !_5327;
    float _5347 = _5343;
    if (!_5345)
    {
        float _5349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5353 = _5319 + _5351;
        float _5355 = _5325 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5357 = _5353 * _5349;
        float _5359 = rsqrt(_5315);
        float _5361 = _5357 * 0.15915493667125701904296875;
        float _5363 = _5361 * 6.283185482025146484375;
        float _5365 = sin(_5363);
        float _5367 = _5361 * 6.283185482025146484375;
        float _5369 = cos(_5367);
        float _5371 = fma(_5365, _5355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5373 = _5359 * _5371;
        float _5375 = _5369 + (-1.0);
        float _5377 = fma(_5311, _5373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5379 = fma(_5307, _5373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5381 = _5375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5383 = fma(_5325, _5369, _5381);
        _5347 = _5383;
        _5337 = _5377;
        _5341 = _5379;
    }
    float _5385 = _5347;
    float _5387 = _5337;
    float _5389 = _5341;
    float _5391 = -_3137;
    float _5393 = _5391 + _5385;
    float _5395 = -_3163;
    float _5397 = _5395 + _5387;
    float _5399 = -_3173;
    float _5401 = _5399 + _5389;
    float _5403 = _5393 * _5393;
    bool _5405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5407 = isnan(0.5);
    bool _5409 = _5405 || _5407;
    bool _5411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5413 = _5409 || _5411;
    float _5415 = fma(_5397, _5397, _5403);
    float _5417 = fma(_5401, _5401, _5415);
    float _5419 = sqrt(_5417);
    bool _5421 = _5419 > 0.0;
    bool _5423 = !_5421;
    float _5425 = _5387;
    float _5427 = _5385;
    float _5429 = _5389;
    if (!_5423)
    {
        float _5431 = _200 * _200;
        float _5433 = fma(_198, _198, _5431);
        float _5435 = fma(_202, _202, _5433);
        float _5437 = rsqrt(_5417);
        float _5439 = sqrt(_5435);
        float _5441 = _5393 * _5437;
        float _5443 = _5401 * _5437;
        bool _5445 = _5439 > 0.0;
        float _5447 = _5397 * _5437;
        bool _5449 = !_5445;
        if (!_5449)
        {
            float _5451 = rsqrt(_5435);
            float _5453 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5455 = _200 * _5451;
            float _5457 = _198 * _5451;
            float _5459 = _5441 * _5455;
            float _5461 = _202 * _5451;
            float _5463 = fma(_5447, _5457, _5459);
            float _5465 = _5453 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5467 = fma(_5443, _5461, _5463);
            float _5469 = _5467 * _5465;
            float _5471 = fma(_198, _5469, _5387);
            float _5473 = fma(_200, _5469, _5385);
            float _5475 = fma(_202, _5469, _5389);
            _5425 = _5471;
            _5427 = _5473;
            _5429 = _5475;
        }
    }
    float _5477 = _5425;
    float _5479 = _5427;
    float _5481 = _5429;
    float _5483 = -_4683;
    float _5485 = fma(_5483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5477);
    float _5487 = -_4679;
    float _5489 = fma(_5487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5479);
    float _5491 = -_4899;
    float _5493 = fma(_5491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5481);
    float _5495 = _5489;
    float _5497 = _5485;
    float _5499 = _5493;
    if (!_5413)
    {
        float _5501 = _4993 * _4993;
        float _5503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5505 = -_3173;
        float _5507 = _5505 + _5481;
        float _5509 = -_3163;
        float _5511 = _5509 + _5477;
        float _5513 = fma(_5003, _5003, _5501);
        float _5515 = -_3137;
        float _5517 = _5515 + _5479;
        float _5519 = fma(_5015, _5015, _5513);
        float _5521 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5523 = sqrt(_5519);
        float _5525 = 1.0 / _5125;
        float _5527 = _5521 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5529 = precise::min(_5523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5531 = _5529 * _5503;
        float _5533 = _5531 * _5525;
        float _5535 = _5527 * _5533;
        float _5537 = _5507 * _5533;
        float _5539 = fma(_5511, _5535, _4985);
        float _5541 = fma(_5517, _5535, _4981);
        float _5543 = fma(_5527, _5537, _4999);
        _5495 = _5541;
        _5497 = _5539;
        _5499 = _5543;
        _5063 = _5523;
        _5065 = _5501;
    }
    float _5545 = _5495;
    float _5547 = _5497;
    float _5549 = _5499;
    float _5551 = _5063;
    float _5553 = _5065;
    float _5555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5557 = _5545 + _5555;
    float _5559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5561 = _5547 + _5559;
    float _5563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5565 = _5549 + _5563;
    float _5567 = _5557 * _5557;
    float _5569 = fma(_5561, _5561, _5567);
    float _5571 = fma(_5565, _5565, _5569);
    float _5573 = rsqrt(_5571);
    float _5575 = sqrt(_5571);
    float _5577 = _5573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5579 = _5561 * _5577;
    float _5581 = _5565 * _5577;
    float _5583 = _5579 * _5579;
    float _5585 = _5581 * _5581;
    float _5587 = _5583 + _5585;
    float _5589 = sqrt(_5587);
    bool _5591 = _5589 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5595 = _5589 + _5593;
    float _5597 = _5565;
    float _5599 = _5553;
    float _5601 = _5595;
    float _5603 = _5551;
    float _5605 = _5577;
    if (_5591)
    {
        float _5607 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5597 = _5607;
    }
    float _5609 = _5597;
    if (_5591)
    {
        float _5611 = rsqrt(_5587);
        _5599 = _5611;
    }
    float _5613 = _5599;
    if (_5591)
    {
        float _5615 = _5595 * _5609;
        _5601 = _5615;
    }
    float _5617 = _5601;
    if (_5591)
    {
        float _5619 = _5617 * 0.15915493667125701904296875;
        _5603 = _5619;
    }
    float _5621 = _5603;
    float _5623 = _5569;
    if (_5591)
    {
        float _5625 = _5621 * 6.283185482025146484375;
        float _5627 = sin(_5625);
        _5623 = _5627;
    }
    float _5629 = _5623;
    float _5631 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5633 = precise::max(0.0, _5631);
    float _5635 = _5573;
    float _5637 = _5633;
    float _5639 = _5631;
    if (_5591)
    {
        float _5641 = _5621 * 6.283185482025146484375;
        float _5643 = cos(_5641);
        _5635 = _5643;
    }
    float _5645 = _5635;
    float _5647 = -_5577;
    float _5649 = -_5633;
    float _5651 = fma(_5557, _5647, _5649);
    float _5653 = _5651;
    if (_5591)
    {
        float _5655 = _5651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5637 = _5655;
    }
    float _5657 = _5637;
    float _5659 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5661 = _5629;
    float _5663 = _5657;
    if (_5591)
    {
        float _5665 = fma(_5629, _5657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5661 = _5665;
    }
    float _5667 = _5661;
    float _5669 = _5667;
    if (!_5591)
    {
        _5663 = _5579;
    }
    float _5671 = _5663;
    float _5673 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5659);
    float _5675 = _5671;
    float _5677 = _5645;
    if (_5591)
    {
        float _5679 = _5645 + (-1.0);
        _5639 = _5679;
    }
    float _5681 = _5639;
    float _5683 = _5681;
    if (_5591)
    {
        float _5685 = _5613 * _5667;
        _5605 = _5685;
    }
    float _5687 = _5605;
    if (!_5591)
    {
        _5669 = _5585;
    }
    float _5689 = _5669;
    float _5691 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5673);
    float _5693 = _5689;
    if (_5591)
    {
        float _5695 = _5681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5683 = _5695;
    }
    float _5697 = _5683;
    float _5699 = _5697;
    if (_5591)
    {
        float _5701 = _5579 * _5687;
        _5675 = _5701;
    }
    float _5703 = _5675;
    float _5705 = _5691 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_5591)
    {
        float _5707 = fma(_5651, _5645, _5697);
        _5653 = _5707;
    }
    float _5709 = _5653;
    if (!_5591)
    {
        _5699 = _5581;
    }
    float _5711 = _5699;
    float _5713 = _5711;
    if (_5591)
    {
        float _5715 = _5581 * _5687;
        _5713 = _5715;
    }
    float _5717 = _5713;
    if (!_5591)
    {
        _5677 = _5583;
    }
    float _5719 = _5677;
    float _5721 = _5719;
    if (_5591)
    {
        float _5723 = _5703 * _5703;
        _5721 = _5723;
    }
    float _5725 = _5721;
    if (_5591)
    {
        float _5727 = _5717 * _5717;
        _5693 = _5727;
    }
    float _5729 = _5693;
    float _5731 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5733 = fma(_5709, _5709, _5725);
    float _5735 = fma(_4985, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5737 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5731);
    float _5739 = _5733 + _5729;
    float _5741 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5743 = fma(_5575, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5741);
    float _5745 = precise::clamp(_5743, 0.0, 1.0);
    float _5747 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5737);
    float _5749 = rsqrt(_5739);
    float _5751 = -_5745;
    float _5753 = _5751 + 1.0;
    float _5755 = _5705 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5757 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5759 = _5747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5761 = fma(_4999, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5763 = -_5755;
    float _5765 = fma(_5763, _5757, 1.0);
    float _5767 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5769 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5771 = abs(_5753);
    float _5773 = log2(_5771);
    float _5775 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5767);
    float _5777 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5769);
    float _5779 = _5749 * _5703;
    float _5781 = _5749 * _5709;
    float _5783 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5775);
    float _5785 = _5749 * _5717;
    float _5787 = _5779 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5789 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5791 = _5783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5793 = floor(_5735);
    float _5795 = -_5787;
    float _5797 = fma(_5781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5795);
    float _5799 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5777);
    float _5801 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5803 = -_5785;
    float _5805 = fma(_5803, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5797);
    float _5807 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5789);
    float _5809 = _5799 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5811 = floor(_5761);
    float _5813 = fma(_5805, -0.5, 0.5);
    float _5815 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5807);
    float _5817 = fma(_5805, 0.5, 0.5);
    float _5819 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5815);
    float _5821 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5823 = log2(_5765);
    float _5825 = -_5793;
    float _5827 = _5735 + _5825;
    float _5829 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5821);
    float _5831 = _5781 + 1.0;
    float _5833 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5829);
    float _5835 = 1.0 / _5819;
    float _5837 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5839 = fma(_5817, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5841 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5833);
    float _5843 = fma(_5817, _5839, -0.212114393711090087890625);
    float _5845 = sqrt(_5813);
    float _5847 = _5823 * 0.693147182464599609375;
    float _5849 = fma(_5817, _5843, 1.570728778839111328125);
    float _5851 = _5847 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5853 = exp2(_5801);
    float _5855 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5837);
    float _5857 = _5841 * _5835;
    float _5859 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5855);
    float _5861 = _5845 * 0.636619746685028076171875;
    float _5863 = -_5811;
    float _5865 = _5761 + _5863;
    float _5867 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5859);
    float _5869 = -_5849;
    float _5871 = fma(_5861, _5869, 1.0);
    float2 _15136 = float2(_5827, _5865);
    float _5873 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15136, float2(0.0), isnan(_15136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15136, float2(0.0), isnan(_15136)), level(0.0)).x;
    float _5875 = _5867 * _5835;
    float _5877 = fma(_5857, 0.5, 0.5);
    float _5879 = -_5781;
    float _5881 = fma(_5853, _5831, _5879);
    float _5883 = fma(_5875, -0.5, 0.5);
    float _5885 = fma(_5881, 0.5, 0.5);
    float3 _15162 = float3(_5877, _5883, _5851);
    float _5887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15162, float3(0.0), isnan(_15162)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15162, float3(0.0), isnan(_15162)), level(0.0)).x;
    float3 _15173 = float3(_5877, _5883, _5851);
    float4 _5890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15173, float3(0.0), isnan(_15173)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15173, float3(0.0), isnan(_15173)), level(0.0)).xyzw;
    float _5892 = _5890.x;
    float _5894 = _5890.y;
    float _5896 = _5890.z;
    float _5898 = _5890.w;
    float2 _15189 = float2(_5871, _5885);
    float3 _5902 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15189, float2(0.0), isnan(_15189)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15189, float2(0.0), isnan(_15189)), level(0.0)).xyz;
    float _5904 = _5902.x;
    float _5906 = _5902.y;
    float _5908 = _5902.z;
    float _5910 = _4981 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5912 = _4981 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _5914 = _5155 != 0.0;
    bool _5916 = isnan(_5155);
    bool _5918 = _5914 || _5916;
    bool _5920 = isnan(0.0);
    bool _5922 = _5918 || _5920;
    float _5924 = _5237 * _5279;
    float _5926 = fma(_4985, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5910);
    float _5928 = fma(_4985, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5912);
    bool _5930 = _5153 == 0.0;
    bool _5932 = !_5922;
    bool _5934 = _5930 && _5932;
    float _5936 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5938 = fma(_4999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5926);
    float _5940 = fma(_4999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5928);
    float _5942 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5944 = _5938 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5946 = _5940 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _5948 = _5157 == 0.0;
    bool _5950 = _5948 && _5934;
    float _5952 = exp2(_5936);
    float _5954 = _5946 + _5944;
    float _5956 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5942);
    float _5958 = 1.0 / _5944;
    float _5960 = -_5952;
    float _5962 = _5960 + 1.0;
    float _5964 = _5954 * _5958;
    float _5966 = _5964 * 0.5;
    float _5968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5970 = fma(_5966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5968);
    float _5972 = in.m_83.x;
    float _5974 = in.m_83.y;
    float _5976 = in.m_83.z;
    float _5978 = 1.0 / _5970;
    float _5980 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5982 = _5978 * _5980;
    float _5984 = abs(_5982);
    float _5986 = log2(_5984);
    float _5988 = in.m_85.x;
    float _5990 = in.m_85.y;
    float _5992 = in.m_85.z;
    float _5994 = in.m_85.w;
    float _5996 = _5978;
    float _5998 = _5972;
    float _6000 = _5819;
    float _6002 = _5867;
    if (_5950)
    {
        _4975 = _5972;
    }
    float _6004 = _4975;
    float _6006 = _6004;
    if (_5950)
    {
        _4977 = _5974;
    }
    float _6008 = _4977;
    float _6010 = _6008;
    if (_5950)
    {
        _5996 = _6004;
    }
    float _6012 = _5996;
    float _6014 = _6012;
    if (!_5950)
    {
        _6006 = _5972;
    }
    float _6016 = _6006;
    if (_5950)
    {
        _5998 = _5976;
    }
    float _6018 = _5998;
    float _6020 = _6018;
    if (!_5950)
    {
        float _6022 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5976);
        _6020 = _6022;
    }
    float _6024 = _6020;
    if (!_5950)
    {
        float _6026 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6016);
        _6014 = _6026;
    }
    float _6028 = _6014;
    bool _6030 = _5982 <= 8000.0;
    bool _6032 = isnan(_5982);
    bool _6034 = _6030 || _6032;
    bool _6036 = isnan(8000.0);
    bool _6038 = _6034 || _6036;
    float _6040 = float(_6038);
    float _6042 = _5986 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6044 = _5986;
    if (_5950)
    {
        _6044 = _6008;
    }
    float _6046 = _6044;
    float _6048 = _6046;
    if (!_5950)
    {
        _6010 = _5974;
    }
    float _6050 = _6010;
    float _6052 = exp2(_6042);
    if (!_5950)
    {
        float _6054 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6050);
        _6048 = _6054;
    }
    float _6056 = _6048;
    float _6058 = _5990 * _5976;
    float _6060 = _5988 * _6050;
    float _6062 = _5992 * _6016;
    bool _6064 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6066 = isnan(_5575);
    bool _6068 = _6064 || _6066;
    bool _6070 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6072 = _6068 || _6070;
    float _6074 = -_6062;
    float _6076 = fma(_5988, _5976, _6074);
    float _6078 = _5189 * _5279;
    float _6080 = fma(_6052, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6082 = precise::clamp(_6080, 0.0, 1.0);
    float _6084 = -_6058;
    float _6086 = fma(_5992, _6050, _6084);
    float _6088 = -_6060;
    float _6090 = fma(_5990, _6016, _6088);
    float _6092 = _5211 * _5271;
    float _6094 = fma(_6082, -2.0, 3.0);
    float _6096 = _6082 * _6082;
    float _6098 = _6086 * _5994;
    float _6100 = _6090 * _5994;
    float _6102 = _5189 * _5293;
    float _6104 = _6096 * _6094;
    float _6106 = _5189 * _5271;
    float _6108 = _5211 * _5279;
    float _6110 = _5211 * _5293;
    float _6112 = _5237 * _5293;
    float _6114 = _6076 * _5994;
    float _6116 = -_5143;
    float _6118 = fma(_6116, _5251, _6108);
    float _6120 = fma(_5221, _5251, _6078);
    float _6122 = fma(_5221, _5255, _6102);
    float _6124 = fma(_5221, _5261, _6106);
    float _6126 = -_5143;
    float _6128 = fma(_6126, _5255, _6110);
    float _6130 = -_5143;
    float _6132 = fma(_6130, _5261, _6092);
    float _6134 = -_6104;
    float _6136 = _6134 + 1.0;
    float _6138 = fma(_5223, _5255, _6112);
    float _6140 = fma(_5213, _5149, _6118);
    float _6142 = _5237 * _5271;
    float _6144 = fma(_5213, _5159, _6128);
    float _6146 = fma(_5213, _5151, _6132);
    float _6148 = fma(_5223, _5251, _5924);
    float _6150 = fma(_6136, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6104);
    float _6152 = fma(_5233, _5159, _6122);
    float _6154 = fma(_5199, _5159, _6138);
    float _6156 = fma(_5233, _5149, _6120);
    float _6158 = _6140 * _5990;
    float _6160 = fma(_5223, _5261, _6142);
    float _6162 = fma(_5199, _5149, _6148);
    float _6164 = fma(_5233, _5151, _6124);
    float _6166 = _6144 * _5990;
    float _6168 = _6146 * _5990;
    float _6170 = fma(_6156, _5988, _6158);
    float _6172 = _6140 * _6056;
    float _6174 = fma(_6152, _5988, _6166);
    float _6176 = fma(_6164, _5988, _6168);
    float _6178 = fma(_6162, _5992, _6170);
    float _6180 = fma(_5199, _5151, _6160);
    float _6182 = _6114 * _6140;
    float _6184 = in.m_87.x;
    float _6186 = _6146 * _6056;
    float _6188 = _6114 * _6146;
    float _6190 = fma(_6156, _6028, _6172);
    float _6192 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5956);
    float _6194 = _6144 * _6056;
    float _6196 = _6114 * _6144;
    float _6198 = fma(_6098, _6156, _6182);
    float _6200 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6192);
    float _6202 = _6040 * _6150;
    float _6204 = fma(_6098, _6152, _6196);
    float _6206 = fma(_6098, _6164, _6188);
    float _6208 = fma(_6152, _6028, _6194);
    float _6210 = fma(_6100, _6162, _6198);
    float _6212 = fma(_6164, _6028, _6186);
    float _6214 = _6200 + _5819;
    float _6216 = _6202 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6218 = fma(_6154, _5992, _6174);
    float _6220 = fma(_6100, _6154, _6204);
    float _6222 = fma(_6180, _5992, _6176);
    float _6224 = fma(_6162, _6024, _6190);
    float _6226 = fma(_6154, _6024, _6208);
    float _6228 = fma(_6180, _6024, _6212);
    float _6230 = _6214 * 0.5;
    float _6232 = _5962 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6234 = fma(_6100, _6180, _6206);
    out.m_89.x = _6178;
    out.m_89.y = _6218;
    out.m_89.z = _6222;
    out.m_91.x = _6210;
    out.m_91.y = _6220;
    out.m_91.z = _6234;
    out.m_93.z = _6230;
    out.m_93.w = _5819;
    out.m_95.x = _6224;
    out.m_95.y = _6226;
    out.m_95.z = _6228;
    float _6236 = -_6232;
    float _6238 = _6236 + 1.0;
    out.gl_Position.x = _5841;
    out.gl_Position.y = _5867;
    out.gl_Position.z = _6200;
    out.gl_Position.w = _5819;
    float _6240 = _6234;
    float _6242 = _5841;
    float _6244 = _6238;
    if (!_6072)
    {
        _6240 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6246 = _6240;
    float _6248 = _6246;
    float _6250 = _6246;
    if (!_6072)
    {
        _6000 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6252 = _6000;
    float _6254 = _6252;
    float _6256 = _6252;
    if (!_6072)
    {
        _6242 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6258 = _6242;
    float _6260 = _6258;
    float _6262 = _6258;
    if (!_6072)
    {
        _6002 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6264 = _6002;
    float _6266 = -_5873;
    float _6268 = _6266 + 1.0;
    float _6270 = _6268 * _6216;
    float _6272 = precise::clamp(_6270, 0.0, 1.0);
    float _6274 = -_6272;
    float _6276 = fma(_6274, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6278 = _6232 * _5887;
    float _6280 = _5898 * _6238;
    float _6282 = _6264;
    float _6284 = _6264;
    if (!_6072)
    {
        _6244 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6286 = _6244;
    float _6288 = _6276 * _6184;
    float _6290 = _5898 * _6278;
    float _6292 = _5908 * _6278;
    float _6294 = _6288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6296 = fma(_5904, _6290, _5892);
    float _6298 = fma(_5906, _6290, _5894);
    float _6300 = fma(_5898, _6292, _5896);
    float _6302 = _6290;
    float _6304 = _6286;
    float _6306 = _6286;
    if (!_6072)
    {
        _6302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6308 = _6302;
    out.m_97.x = _6294;
    out.m_99.x = _6296;
    out.m_99.y = _6298;
    out.m_99.z = _6300;
    out.m_99.w = _6280;
    bool _6310 = !_6072;
    float _6312 = _6308;
    float _6314 = _6308;
    if (!_6310)
    {
        bool _6316 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6318 = isnan(_5575);
        bool _6320 = _6316 || _6318;
        bool _6322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6324 = _6320 || _6322;
        if (!_6324)
        {
            float _6326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6328 = _5575 + _6326;
            float _6330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6330;
            float _6334 = 1.0 / _6332;
            float _6336 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6338 = _6336 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6340 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6342 = _6340 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6344 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6346 = _6344 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6350 = _6348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6354 = _6352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6356 = _6328 * _6334;
            float _6358 = precise::clamp(_6356, 0.0, 1.0);
            float _6360 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6362 = _6360 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6364 = fma(_6358, _6342, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6366 = fma(_6358, _6362, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6368 = fma(_6358, _6338, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6370 = fma(_6358, _6346, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6372 = fma(_6358, _6350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6374 = fma(_6358, _6354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6314 = _6368;
            _6262 = _6372;
            _6250 = _6366;
            _6256 = _6370;
            _6306 = _6364;
            _6284 = _6374;
            _6376 = true;
        }
        else
        {
            bool _6378 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6380 = isnan(_5575);
            bool _6382 = _6378 || _6380;
            bool _6384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6386 = _6382 || _6384;
            if (!_6386)
            {
                _6254 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6388 = _6254;
            _6256 = _6388;
            if (!_6386)
            {
                _6260 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6390 = _6260;
            _6262 = _6390;
            if (!_6386)
            {
                _6282 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6392 = _6282;
            _6284 = _6392;
            if (!_6386)
            {
                _6248 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6394 = _6248;
            _6250 = _6394;
            if (!_6386)
            {
                _6312 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6396 = _6312;
            _6314 = _6396;
            if (!_6386)
            {
                _6304 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6398 = _6304;
            bool _6400 = !_6386;
            _6306 = _6398;
            if (!_6400)
            {
                bool _6402 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6404 = isnan(_5575);
                bool _6406 = _6402 || _6404;
                bool _6408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6410 = _6406 || _6408;
                if (!_6410)
                {
                    float _6412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6414 = _5575 + _6412;
                    float _6416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6416;
                    float _6420 = 1.0 / _6418;
                    float _6422 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6424 = _6422 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6426 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6428 = _6426 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6430 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6432 = _6430 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6436 = _6434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6440 = _6438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6442 = _6414 * _6420;
                    float _6444 = precise::clamp(_6442, 0.0, 1.0);
                    float _6446 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6448 = _6446 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6450 = fma(_6444, _6428, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6452 = fma(_6444, _6448, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6454 = fma(_6444, _6424, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6456 = fma(_6444, _6432, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6458 = fma(_6444, _6436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6460 = fma(_6444, _6440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6314 = _6454;
                    _6262 = _6458;
                    _6250 = _6452;
                    _6256 = _6456;
                    _6306 = _6450;
                    _6284 = _6460;
                    _6376 = true;
                }
                else
                {
                    _6314 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6262 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6250 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6256 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6306 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6284 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6376 = false;
    float _6462 = _6314;
    float _6464 = _6262;
    float _6466 = _6250;
    float _6468 = _6256;
    float _6470 = _6306;
    float _6472 = _6284;
    float _6474 = fma(_6226, -0.5, 0.5);
    float _6476 = precise::clamp(_6474, 0.0, 1.0);
    float _6478 = -_6462;
    float _6480 = _6464 + _6478;
    float _6482 = -_6466;
    float _6484 = _6468 + _6482;
    float _6486 = -_6470;
    float _6488 = _6472 + _6486;
    bool _6490 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6492 = fma(_6476, _6480, _6462);
    float _6494 = fma(_6476, _6484, _6466);
    float _6496 = fma(_6476, _6488, _6470);
    float _6498 = _6492 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _6500 = fma(_6494, 0.298911988735198974609375, _6498);
    float _6502 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6504 = fma(_6496, 0.114477999508380889892578125, _6500);
    out.m_49.x = _6502;
    float _6506 = -_6504;
    float _6508 = _6494 + _6506;
    float _6510 = -_6504;
    float _6512 = _6492 + _6510;
    float _6514 = -_6504;
    float _6516 = _6496 + _6514;
    float _6518 = fma(_6508, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    float _6520 = fma(_6512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    float _6522 = fma(_6516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    out.m_103.x = _6518;
    out.m_103.y = _6520;
    out.m_103.z = _6522;
    if (!_6490)
    {
        return out;
    }
    float _6524 = -_5545;
    float _6526 = _6524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _6528 = -_5547;
    float _6530 = _6528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _6532 = -_5549;
    float _6534 = _6532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _6536 = _6526 * _6526;
    float _6538 = fma(_6530, _6530, _6536);
    float _6540 = fma(_6534, _6534, _6538);
    float _6542 = sqrt(_6540);
    float _6544 = rsqrt(_6540);
    float _6546 = -_6542;
    float _6548 = _6546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6550 = _6548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _6552 = precise::clamp(_6550, 0.0, 1.0);
    float _6554 = _6530 * _6544;
    float _6556 = _6526 * _6544;
    float _6558 = abs(_6552);
    float _6560 = log2(_6558);
    float _6562 = _6534 * _6544;
    float _6564 = _6554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _6566 = _6226 * _6556;
    float _6568 = -_6556;
    float _6570 = -_6564;
    float _6572 = fma(_6568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6570);
    float _6574 = fma(_6224, _6554, _6566);
    float _6576 = -_6562;
    float _6578 = fma(_6576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6572);
    float _6580 = fma(_6228, _6562, _6574);
    float _6582 = precise::clamp(_6580, 0.0, 1.0);
    float _6584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _6586 = _6578 + _6584;
    float _6588 = _6560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _6590 = _6586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _6592 = precise::clamp(_6590, 0.0, 1.0);
    float _6594 = exp2(_6588);
    float _6596 = _6594 * _6592;
    float _6598 = _6582 * _6596;
    float _6600 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _6602 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _6604 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _6600;
    out.m_101.y = _6602;
    out.m_101.z = _6604;
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
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6376 = false;
    bool _1148 = false;
    bool _818 = false;
    bool _714 = false;
    bool _600 = false;
    bool _446 = false;
    bool _224 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _117 = in.m_46.w;
    float _119 = trunc(_117);
    int _122 = int(_119);
    bool _126 = _122 >= 1;
    float _128 = 0.0;
    if (!_126)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _130 = _128;
    float _132 = _130;
    if (!_126)
    {
        out.m_49.x = 0.0;
    }
    int _134 = 0;
    if (!_126)
    {
        float _136 = _130 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_126)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6661 = as_type<float>(_138);
        out.gl_Position.z = _6661;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = _156;
    if (_152)
    {
        float _160 = float(_122);
        _132 = _160;
    }
    float _162 = _132;
    bool _164 = _156 >= _162;
    bool _166 = !_152;
    bool _168 = _164 || _166;
    float _170 = _162;
    if (_168)
    {
        _170 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _170;
    if (_168)
    {
        out.m_49.x = 0.0;
    }
    if (_168)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_168)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6731 = as_type<float>(_176);
        out.gl_Position.z = _6731;
    }
    if (_168)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _178 = in.m_53.x;
    float _180 = in.m_53.y;
    float _182 = in.m_53.z;
    bool _184 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _186 = _180 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _188 = _180 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _190 = _180 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _192 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].x, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].x, _190);
    float _198 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[4].z, _192);
    float _200 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[5].z, _194);
    float _202 = fma(_182, (*spvDescriptorSet0.vp_c10)._m0[6].z, _196);
    bool _204 = !_184;
    float _222;
    if (!_204)
    {
        float _206 = in.m_55.x;
        float _208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _210 = _206 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _212 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[12].x, _156);
        float _214 = _212 * _208;
        float _216 = floor(_214);
        float _218 = -_216;
        float _220 = _214 + _218;
        _222 = _220;
        _224 = true;
    }
    else
    {
        float _226 = float(_122);
        float _228 = 1.0 / _226;
        float _230 = _156 * _228;
        _222 = _230;
    }
    _224 = false;
    float _232 = _222;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _236 = _232 + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _232 + _238;
    bool _242 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _244 = isnan(_232);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _260 = _232 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _266 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _270 = 1.0 / _256;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _274 = 1.0 / _268;
    float _276 = 1.0 / _264;
    float _278 = _236 * _270;
    bool _280 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _282 = isnan(_232);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_252;
    float _294 = _292 + 1.0;
    float _296 = _290 * _294;
    float _298 = _240 * _274;
    bool _300 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _302 = isnan(_232);
    bool _304 = _300 || _302;
    bool _306 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _308 = _304 || _306;
    float _310 = float(_308);
    float _312 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _314 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _312;
    bool _316 = _232 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _318 = isnan(_232);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _330 = _328 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _332 = -_290;
    float _334 = _332 + 1.0;
    float _336 = -_310;
    float _338 = _336 + 1.0;
    float _340 = _260 * _276;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = _326 * _338;
    float _352 = fma(_314, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _354 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _356 = fma(_348, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _358 = _310 * _334;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _364 = _354 * _350;
    float _366 = _356 * _350;
    float _368 = _352 * _350;
    float _370 = -_326;
    float _372 = _370 + 1.0;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _376 = _374 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _378 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].x, _366);
    float _380 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].y, _364);
    float _382 = fma(_372, (*spvDescriptorSet0.vp_c9)._m0[143].z, _368);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_330, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _390 = fma(_376, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_362, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _398;
    float _402 = fma(_388, _358, _378);
    float _404 = fma(_386, _278, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _406 = fma(_396, _278, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _408 = fma(_400, _278, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _410 = fma(_390, _358, _380);
    float _412 = fma(_392, _358, _382);
    float _414 = fma(_404, _296, _402);
    float _416 = fma(_406, _296, _410);
    float _418 = fma(_408, _296, _412);
    float _420 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].x, _414);
    float _422 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].y, _416);
    float _424 = fma(_252, (*spvDescriptorSet0.vp_c9)._m0[146].z, _418);
    bool _426 = !_272;
    float _444;
    if (!_426)
    {
        float _428 = in.m_55.x;
        float _430 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _432 = _428 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _434 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[11].y, _156);
        float _436 = _434 * _430;
        float _438 = floor(_436);
        float _440 = -_438;
        float _442 = _436 + _440;
        _444 = _442;
        _446 = true;
    }
    else
    {
        float _448 = float(_122);
        float _450 = 1.0 / _448;
        float _452 = _156 * _450;
        _444 = _452;
    }
    _446 = false;
    float _454 = _444;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _458 = _454 + _456;
    float _460 = in.m_57.x;
    float _462 = in.m_57.y;
    float _464 = in.m_57.z;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _466 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _470 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _472 = isnan(_454);
    bool _474 = _470 || _472;
    bool _476 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _478 = _474 || _476;
    float _480 = float(_478);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _486 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _488 = isnan(_454);
    bool _490 = _486 || _488;
    bool _492 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _494 = _490 || _492;
    float _496 = float(_494);
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _500 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _498;
    bool _502 = _454 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _504 = isnan(_454);
    bool _506 = _502 || _504;
    bool _508 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _510 = _506 || _508;
    float _512 = float(_510);
    float _514 = 1.0 / _468;
    float _516 = -_480;
    float _518 = _516 + 1.0;
    bool _520 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _522 = _496 * _518;
    float _524 = -_496;
    float _526 = _524 + 1.0;
    float _528 = 1.0 / _484;
    float _530 = _500 * _514;
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _536 = _422 * _462;
    float _538 = _424 * _464;
    float _540 = fma(_530, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _542 = _420 * _460;
    float _544 = _534 * _528;
    float _546 = _540 * _522;
    float _548 = -_512;
    float _550 = _548 + 1.0;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _554 = _454 + _552;
    float _556 = fma(_526, (*spvDescriptorSet0.vp_c9)._m0[115].x, _546);
    float _558 = _480 * _550;
    float _560 = fma(_544, _554, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _564 = fma(_560, _558, _556);
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _568 = _562 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _570 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[117].x, _564);
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _570 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _578 = _572 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _568;
    out.m_59.y = _578;
    out.m_59.z = _574;
    out.m_59.w = _576;
    bool _580 = !_520;
    float _598;
    if (!_580)
    {
        float _582 = in.m_55.x;
        float _584 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _586 = _582 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _588 = fma(_586, (*spvDescriptorSet0.vp_c9)._m0[11].z, _156);
        float _590 = _588 * _584;
        float _592 = floor(_590);
        float _594 = -_592;
        float _596 = _590 + _594;
        _598 = _596;
        _600 = true;
    }
    else
    {
        float _602 = float(_122);
        float _604 = 1.0 / _602;
        float _606 = _156 * _604;
        _598 = _606;
    }
    _600 = false;
    float _608 = _598;
    float _610 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _612 = _608 + _610;
    bool _614 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _616 = isnan(_608);
    bool _618 = _614 || _616;
    bool _620 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _622 = _618 || _620;
    float _624 = float(_622);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _628 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _626;
    bool _630 = _608 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _632 = isnan(_608);
    bool _634 = _630 || _632;
    bool _636 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _638 = _634 || _636;
    float _640 = float(_638);
    float _642 = -_624;
    float _644 = _642 + 1.0;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _646;
    float _650 = 1.0 / _628;
    bool _652 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _654 = _640 * _644;
    float _656 = -_640;
    float _658 = _656 + 1.0;
    float _660 = _612 * _650;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _662;
    float _666 = fma(_648, _660, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _668 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _668;
    float _672 = fma(_664, _660, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _674 = _666 * _654;
    float _676 = fma(_670, _660, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _678 = _672 * _654;
    float _680 = _676 * _654;
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].x, _674);
    float _684 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].y, _680);
    float _686 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].z, _678);
    float _688 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].x, _682);
    float _690 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].y, _684);
    float _692 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[124].z, _686);
    bool _694 = !_652;
    float _712;
    if (!_694)
    {
        float _696 = in.m_55.x;
        float _698 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _700 = _696 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _702 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[11].w, _156);
        float _704 = _702 * _698;
        float _706 = floor(_704);
        float _708 = -_706;
        float _710 = _704 + _708;
        _712 = _710;
        _714 = true;
    }
    else
    {
        float _716 = float(_122);
        float _718 = 1.0 / _716;
        float _720 = _156 * _718;
        _712 = _720;
    }
    _714 = false;
    float _722 = _712;
    bool _724 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _726 = isnan(_722);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _740 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _742 = isnan(_722);
    bool _744 = _740 || _742;
    bool _746 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _748 = _744 || _746;
    float _750 = float(_748);
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _754 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _752;
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _758 = _722 + _756;
    float _760 = -_734;
    float _762 = _760 + 1.0;
    bool _764 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _766 = 1.0 / _738;
    float _768 = _750 * _762;
    float _770 = -_750;
    float _772 = _770 + 1.0;
    float _774 = _754 * _766;
    float _776 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _778 = fma(_774, _758, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _780 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _782 = _776 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _784 = _778 * _768;
    float _786 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _788 = fma(_772, (*spvDescriptorSet0.vp_c9)._m0[131].x, _784);
    float _790 = _688 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _792 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[132].x, _788);
    float _794 = _790 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _794;
    out.m_61.y = _786;
    out.m_61.z = _782;
    out.m_61.w = _796;
    bool _798 = !_764;
    float _816;
    if (!_798)
    {
        float _800 = in.m_55.x;
        float _802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _804 = _800 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _806 = fma(_804, (*spvDescriptorSet0.vp_c9)._m0[14].x, _156);
        float _808 = _806 * _802;
        float _810 = floor(_808);
        float _812 = -_810;
        float _814 = _808 + _812;
        _816 = _814;
        _818 = true;
    }
    else
    {
        float _820 = float(_122);
        float _822 = 1.0 / _820;
        float _824 = _156 * _822;
        _816 = _824;
    }
    _818 = false;
    float _826 = _816;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _830 = _826 + _828;
    bool _832 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _834 = isnan(_826);
    bool _836 = _832 || _834;
    bool _838 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _840 = _836 || _838;
    float _842 = float(_840);
    float _844 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _846 = _844 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _848 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _850 = isnan(_826);
    bool _852 = _848 || _850;
    bool _854 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _856 = _852 || _854;
    float _858 = float(_856);
    float _860 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _862 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _860;
    bool _864 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _866 = isnan(_826);
    bool _868 = _864 || _866;
    bool _870 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _872 = _868 || _870;
    float _874 = float(_872);
    float _876 = -_842;
    float _878 = _876 + 1.0;
    float _880 = 1.0 / _846;
    float _882 = _858 * _878;
    float _884 = -_874;
    float _886 = _884 + 1.0;
    float _888 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _890 = _888 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _892 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _894 = 1.0 / _890;
    float _896 = _862 * _880;
    float _898 = -_858;
    float _900 = _898 + 1.0;
    bool _902 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _904 = isnan(_826);
    bool _906 = _902 || _904;
    bool _908 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _910 = _906 || _908;
    float _912 = float(_910);
    float _914 = fma(_896, _830, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _916 = _874 * _900;
    bool _918 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _920 = isnan(_826);
    bool _922 = _918 || _920;
    bool _924 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _926 = _922 || _924;
    float _928 = float(_926);
    float _930 = _912 * _886;
    float _932 = -_912;
    float _934 = _932 + 1.0;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _938 = _936 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _940 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _942 = isnan(_826);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    float _952 = _928 * _934;
    float _954 = -_928;
    float _956 = _954 + 1.0;
    float _958 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _960 = _958 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _962 = 1.0 / _938;
    bool _964 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _966 = isnan(_826);
    bool _968 = _964 || _966;
    bool _970 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _972 = _968 || _970;
    float _974 = float(_972);
    float _976 = _950 * _956;
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _984 = _982 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _990 = _974 * _980;
    float _992 = 1.0 / _960;
    float _994 = _988 * _894;
    float _996 = _914 * _990;
    float _998 = -_974;
    float _1000 = _998 + 1.0;
    float _1002 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1004 = _1002 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1006 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1008 = _826 + _1006;
    float _1010 = 1.0 / _984;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1012;
    float _1016 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _996);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1022 = fma(_994, _1008, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = _1014 * _962;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1028 = _826 + _1026;
    float _1030 = 1.0 / _1004;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1036 = fma(_1024, _1028, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1038 = fma(_1022, _976, _1016);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1040;
    float _1044 = _1034 * _992;
    float _1046 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1048 = _826 + _1046;
    float _1050 = 1.0 / _1020;
    float _1052 = fma(_1036, _952, _1038);
    float _1054 = _1042 * _1010;
    float _1056 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1058 = _826 + _1056;
    float _1060 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1062 = _1060 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1064 = fma(_1044, _1048, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1068 = _826 + _1066;
    float _1070 = fma(_1054, _1058, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1072 = _1062 * _1030;
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1074;
    bool _1078 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1080 = isnan(_826);
    bool _1082 = _1078 || _1080;
    bool _1084 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1086 = _1082 || _1084;
    float _1088 = float(_1086);
    float _1090 = fma(_1064, _930, _1052);
    float _1092 = fma(_1072, _1068, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1096 = _826 + _1094;
    float _1098 = -_1088;
    float _1100 = _1098 + 1.0;
    float _1102 = _1076 * _1050;
    float _1104 = fma(_1070, _916, _1090);
    float _1106 = _842 * _1100;
    float _1108 = fma(_1102, _1096, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1110 = fma(_1092, _882, _1104);
    float _1112 = fma(_1108, _1106, _1110);
    float _1114 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    out.m_63.x = _1114;
    bool _1116 = !_892;
    float _1118 = _1030;
    float _1120 = (*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1050;
    float _1124 = _1038;
    float _1126 = _842;
    float _1128 = _882;
    float _1146;
    if (!_1116)
    {
        float _1130 = in.m_55.x;
        float _1132 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1134 = _1130 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1136 = fma(_1134, (*spvDescriptorSet0.vp_c9)._m0[14].y, _156);
        float _1138 = _1136 * _1132;
        float _1140 = floor(_1138);
        float _1142 = -_1140;
        float _1144 = _1138 + _1142;
        _1146 = _1144;
        _1148 = true;
    }
    else
    {
        float _1150 = float(_122);
        float _1152 = 1.0 / _1150;
        float _1154 = _156 * _1152;
        _1146 = _1154;
    }
    _1148 = false;
    float _1156 = _1146;
    float _1158 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1160 = int(_1158);
    float _1162 = float(_122);
    float _1164 = in.m_65.x;
    float _1166 = in.m_55.y;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1174 = int(_1172);
    int _1176 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1178 = _1176 != 0;
    float _1180 = float(_1160);
    float _1182 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1184 = int(_1182);
    if (_1170)
    {
        float _1186 = in.m_55.x;
        _1118 = _1186;
    }
    float _1188 = _1118;
    float _1190 = float(uint(_1174));
    float _1192 = 1.0 / _1180;
    float _1194 = float(_1174);
    if (_1178)
    {
        float _1196 = in.m_55.z;
        _1120 = _1196;
    }
    float _1198 = _1120;
    int _1200 = ~_1174;
    int _1202 = _1200 + 1;
    float _1204 = 0.0;
    int _1206 = as_type<int>(_1198);
    float _1208 = _1164;
    if (!_1170)
    {
        _1204 = _1164;
    }
    float _1210 = _1204;
    float _1212 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1214 = int(_1212);
    float _1216 = float(_1184);
    int _1218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1220 = _1218 != 0;
    float _1222 = _1192 * _156;
    float _1224 = 1.0 / _1190;
    float _1226 = float(_1214);
    float _1228 = trunc(_1222);
    int _1230 = int(_1228);
    float _1232 = _1210;
    bool _1234 = _1220;
    if (_1220)
    {
        float _1236 = in.m_55.x;
        _1122 = _1236;
    }
    float _1238 = _1122;
    int _1240 = 0;
    float _1242 = _1238;
    if (_1220)
    {
        _1240 = 0;
    }
    int _1244 = _1240;
    int _1246 = 0;
    int _1248 = _1244;
    if (_1220)
    {
        _1246 = 0;
    }
    int _1250 = _1246;
    float _1252 = _1010;
    int _1254 = _1250;
    if (_1220)
    {
        float _1256 = in.m_55.z;
        _1252 = _1256;
    }
    float _1258 = _1252;
    float _1260 = 1.0 / _1216;
    int _1262 = as_type<int>(_1224) + (-2);
    float _1264 = _1194 * _156;
    if (_1220)
    {
        _1124 = 1.0;
    }
    float _1266 = _1124;
    float _1268 = _1266;
    if (_1220)
    {
        _1126 = 1.0;
    }
    float _1270 = _1126;
    float _1272 = _1270;
    if (_1220)
    {
        _1128 = 1.0;
    }
    float _1274 = _1128;
    float _1276 = 1.0 / _1226;
    float _1278 = float(uint(_1230));
    int _1280 = 0;
    float _1282 = _1274;
    if (_1220)
    {
        _1280 = as_type<int>(_1166);
    }
    int _1284 = _1280;
    float _1286 = 1.0 / _1162;
    float _1288 = as_type<float>(_1262) * _1278;
    float _1290 = _1260 * _156;
    int _1292 = as_type<int>(_1260);
    float _1294 = _1258;
    int _1296 = _1284;
    if (_1220)
    {
        _1292 = as_type<int>(_1258);
    }
    int _1298 = _1292;
    float _1300 = trunc(_1288);
    float _1302 = precise::max(_1300, 0.0);
    uint _1305 = uint(_1302);
    float _1307 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1309 = int(_1307);
    float _1311 = float(_1230);
    float _1313 = _1264 * _1286;
    float _1315 = in.m_55.w;
    bool _1317 = _1311 >= _1194;
    bool _1319 = isnan(_1311);
    bool _1321 = _1317 || _1319;
    bool _1323 = isnan(_1194);
    bool _1325 = _1321 || _1323;
    float _1327 = float(_1325);
    float _1329 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1331 = int(_1329);
    int _1333 = _1202 * int(_1305);
    int _1335 = _1333 + _1230;
    float _1337 = float(uint(_1335));
    float _1339 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1341 = int(_1339);
    float _1343 = float(uint(_1309));
    float _1345 = as_type<float>(_1262) * _1337;
    float _1347 = _1337;
    float _1349 = as_type<float>(_1335);
    int _1351 = _1298;
    int _1353 = as_type<int>(_1345);
    if (_1220)
    {
        _1347 = _1238;
    }
    float _1355 = _1347;
    float _1357 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1359 = int(_1357);
    float _1361 = float(uint(_1331));
    float _1363 = _1355;
    if (_1220)
    {
        _1349 = _1355;
    }
    float _1365 = _1349;
    int _1367 = 0;
    float _1369 = _1365;
    if (_1220)
    {
        _1367 = as_type<int>(_1355);
    }
    int _1371 = _1367;
    float _1373 = float(uint(_1341));
    float _1375 = 1.0 / _1343;
    float _1377 = float(_1359);
    float _1379 = 1.0 / _1361;
    float _1381 = 1.0 / _1377;
    float _1383 = 1.0 / _1373;
    float _1385 = trunc(_1313);
    int _1387 = int(_1385);
    float _1389 = trunc(_1290);
    int _1391 = int(_1389);
    float _1393 = trunc(_1327);
    int _1395 = int(_1393);
    float _1397 = trunc(_1345);
    float _1399 = precise::max(_1397, 0.0);
    uint _1401 = uint(_1399);
    int _1403 = _1371;
    int _1405 = int(_1401);
    if (!_1220)
    {
        float _1407 = in.m_55.x;
        float _1409 = _1166 * 3.1415927410125732421875;
        float _1411 = in.m_55.z;
        float _1413 = _1409 * 0.15915493667125701904296875;
        float _1415 = _1413 * 6.283185482025146484375;
        float _1417 = sin(_1415);
        float _1419 = _1407 * 3.1415927410125732421875;
        float _1421 = _1419 * 0.15915493667125701904296875;
        float _1423 = _1411 * 3.1415927410125732421875;
        float _1425 = _1423 * 0.15915493667125701904296875;
        float _1427 = _1421 * 6.283185482025146484375;
        float _1429 = sin(_1427);
        float _1431 = _1425 * 6.283185482025146484375;
        float _1433 = sin(_1431);
        _1272 = 1.2345600128173828125;
        _1363 = _1166;
        _1268 = 7.345489978790283203125;
        _1242 = _1407;
        _1282 = 5.839270114898681640625;
        _1369 = _1411;
        _1294 = _1411;
        _1248 = 1;
        _1254 = 2;
        _1296 = as_type<int>(_1417);
        _1403 = as_type<int>(_1429);
        _1351 = as_type<int>(_1433);
    }
    float _1435 = _1272;
    float _1437 = _1363;
    float _1439 = _1268;
    float _1441 = _1242;
    float _1443 = _1282;
    float _1445 = _1369;
    float _1447 = _1294;
    int _1449 = _1248;
    int _1451 = _1254;
    int _1453 = _1296;
    int _1455 = _1403;
    int _1457 = _1351;
    int _1459 = as_type<int>(_1439);
    if (_1170)
    {
        float _1461 = -_1164;
        float _1463 = _1461 + 1.0;
        _1353 = as_type<int>(_1463);
    }
    int _1465 = _1353;
    bool _1467 = false;
    if (_1170)
    {
        bool _1469 = _1188 > 0.5;
        _1467 = _1469;
    }
    bool _1471 = _1467;
    float _1473 = _1435 * _1437;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1477 = _1475 != 0;
    float _1479 = _1439 * _1441;
    if (_1170)
    {
        float _1481 = _1471 ? as_type<float>(_1465) : _1164;
        _1232 = _1481;
    }
    float _1483 = _1232;
    float _1485 = _1443 * _1445;
    int _1487 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1489 = _1487 != 0;
    float _1491 = _1439 * _1437;
    int _1493 = int(_1305) + int(_1401);
    float _1495 = floor(_1473);
    int _1497 = ~_1174;
    int _1499 = _1497 + 1;
    float _1501 = in.m_65.y;
    int _1503 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1505 = _1503 != 0;
    if (_1178)
    {
        bool _1507 = _1198 > 0.5;
        _1234 = _1507;
    }
    bool _1509 = _1234;
    if (_1178)
    {
        float _1511 = -_1164;
        float _1513 = _1511 + 1.0;
        _1206 = as_type<int>(_1513);
    }
    int _1515 = _1206;
    int _1517 = _1499 * _1493;
    int _1519 = _1517 + _1230;
    if (_1477)
    {
        float _1521 = -_1164;
        float _1523 = _1521 + 1.0;
        _1405 = as_type<int>(_1523);
    }
    int _1525 = _1405;
    bool _1527 = _1166 > 0.5;
    float _1529 = as_type<float>(_1525);
    if (_1489)
    {
        float _1531 = -_1164;
        float _1533 = _1531 + 1.0;
        _1459 = as_type<int>(_1533);
    }
    int _1535 = _1459;
    float _1537 = 0.0;
    if (!_1178)
    {
        _1537 = _1164;
    }
    float _1539 = _1537;
    float _1541 = floor(_1485);
    float _1543 = _1539;
    if (_1178)
    {
        float _1545 = _1509 ? as_type<float>(_1515) : _1164;
        _1543 = _1545;
    }
    float _1547 = _1543;
    float _1549 = 0.0;
    if (!_1477)
    {
        _1549 = _1164;
    }
    float _1551 = _1549;
    int _1553 = 0;
    float _1555 = _1551;
    if (_1505)
    {
        float _1557 = -_1164;
        float _1559 = _1557 + 1.0;
        _1553 = as_type<int>(_1559);
    }
    int _1561 = _1553;
    bool _1563 = uint(_1519) >= uint(_1174);
    float _1565 = _1276 * _156;
    if (_1477)
    {
        float _1567 = _1527 ? as_type<float>(_1525) : _1164;
        _1555 = _1567;
    }
    float _1569 = _1555;
    float _1571 = floor(_1479);
    if (!_1489)
    {
        _1529 = _1164;
    }
    float _1573 = _1529;
    float _1575 = _1573;
    if (_1489)
    {
        float _1577 = _1527 ? as_type<float>(_1535) : _1164;
        _1575 = _1577;
    }
    float _1579 = _1575;
    bool _1581 = !_1563;
    int _1583 = _1581 ? 0 : (-1);
    if (_1505)
    {
        float _1585 = _1527 ? as_type<float>(_1561) : _1164;
        _1208 = _1585;
    }
    float _1587 = _1208;
    float _1589 = floor(_1491);
    int _1591 = ~_1493;
    int _1593 = _1591 + _1583;
    int _1595 = _1593 + 1;
    float _1597 = _1381 * _156;
    int _1599 = as_type<int>(_1375) + (-2);
    float _1601 = -_1495;
    float _1603 = _1473 + _1601;
    float _1605 = float(uint(_1391));
    int _1607 = _1174 * _1595;
    int _1609 = _1607 + _1230;
    bool _1611 = _1174 == 0;
    float _1613 = trunc(_1565);
    int _1615 = int(_1613);
    float _1617 = -_1541;
    float _1619 = _1485 + _1617;
    float _1621 = as_type<float>(_1599) * _1605;
    float _1623 = -_1571;
    float _1625 = _1479 + _1623;
    int _1627 = ~_1395;
    int _1629 = _1627 + 1;
    int _1631 = _1629 + 1;
    bool _1633 = !_1611;
    int _1635 = _1633 ? _1609 : (-1);
    float _1637 = _1625 * _1194;
    float _1639 = trunc(_1621);
    float _1641 = precise::max(_1639, 0.0);
    uint _1643 = uint(_1641);
    int _1645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1647 = _1645 != 0;
    float _1649 = -_1589;
    float _1651 = _1491 + _1649;
    int _1653 = _1635 * _1631;
    bool _1655 = !_1647;
    int _1657 = _1655 ? 0 : 1;
    int _1659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1661 = _1659 != 0;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1665 = _1663 != 0;
    int _1667 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1669 = _1667 != 0;
    float _1671 = trunc(_1597);
    int _1673 = int(_1671);
    int _1675 = abs(_1657);
    int _1677 = ~_1309;
    int _1679 = _1677 + 1;
    bool _1681 = !_1665;
    int _1683 = _1681 ? 0 : 1;
    int _1685 = as_type<int>(_1379) + (-2);
    float _1687 = trunc(_1637);
    int _1689 = int(_1687);
    float _1691 = float(uint(_1615));
    int _1693 = abs(_1683);
    int _1695 = _1679 * int(_1643);
    int _1697 = _1695 + _1391;
    int _1699 = _1174 + (-1);
    float _1701 = as_type<float>(_1685) * _1691;
    int _1703 = as_type<int>(_1383) + (-2);
    float _1705 = float(uint(_1697));
    int _1707 = _1395 * _1699;
    int _1709 = _1707 + _1653;
    float _1711 = float(uint(_1673));
    float _1713 = trunc(_1701);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    bool _1719 = !_1661;
    int _1721 = _1719 ? 0 : 1;
    int _1723 = _1709 * _1693;
    float _1725 = as_type<float>(_1599) * _1705;
    float _1727 = as_type<float>(_1703) * _1711;
    int _1729 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1731 = _1729 != 0;
    int _1733 = _1689 * _1675;
    int _1735 = _1733 + _1230;
    bool _1737 = !_1669;
    int _1739 = _1737 ? 0 : 1;
    float _1741 = trunc(_1725);
    float _1743 = precise::max(_1741, 0.0);
    uint _1745 = uint(_1743);
    int _1747 = abs(_1721);
    bool _1749 = !_1731;
    int _1751 = _1749 ? 0 : 1;
    int _1753 = abs(_1739);
    float _1755 = trunc(_1727);
    float _1757 = precise::max(_1755, 0.0);
    uint _1759 = uint(_1757);
    int _1761 = ~_1331;
    int _1763 = _1761 + 1;
    int _1765 = abs(_1751);
    int _1767 = _1387 * _1747;
    int _1769 = _1767 + _1723;
    int _1771 = _1763 * int(_1717);
    int _1773 = _1771 + _1615;
    int _1775 = ~_1341;
    int _1777 = _1775 + 1;
    float _1779 = _1286 * _156;
    int _1781 = int(_1643) + int(_1745);
    int _1783 = _1735 * _1753;
    int _1785 = _1783 + _1769;
    float _1787 = float(uint(_1773));
    float _1789 = float(_1391);
    int _1791 = _1689 * _1765;
    int _1793 = _1791 + _1785;
    float _1795 = float(_1341);
    float _1797 = as_type<float>(_1685) * _1787;
    int _1799 = _1777 * int(_1759);
    int _1801 = _1799 + _1673;
    float _1803 = float(_1615);
    float _1805 = float(uint(_1793));
    float _1807 = trunc(_1797);
    float _1809 = precise::max(_1807, 0.0);
    uint _1811 = uint(_1809);
    float _1813 = float(uint(_1801));
    float _1815 = float(_1309);
    int _1817 = ~_1309;
    int _1819 = _1817 + 1;
    float _1821 = as_type<float>(_1703) * _1813;
    float _1823 = float(_1331);
    float _1825 = _1815 * _1603;
    float _1827 = as_type<float>(_1262) * _1805;
    float _1829 = trunc(_1821);
    float _1831 = precise::max(_1829, 0.0);
    uint _1833 = uint(_1831);
    int _1835 = ~_1174;
    int _1837 = _1835 + 1;
    float _1839 = _1815 * _1779;
    bool _1841 = _1789 >= _1815;
    bool _1843 = isnan(_1789);
    bool _1845 = _1841 || _1843;
    bool _1847 = isnan(_1815);
    bool _1849 = _1845 || _1847;
    float _1851 = float(_1849);
    float _1853 = _1823 * _1619;
    bool _1855 = _1803 >= _1823;
    bool _1857 = isnan(_1803);
    bool _1859 = _1855 || _1857;
    bool _1861 = isnan(_1823);
    bool _1863 = _1859 || _1861;
    float _1865 = float(_1863);
    float _1867 = _1823 * _1779;
    float _1869 = _1795 * _1779;
    float _1871 = trunc(_1827);
    float _1873 = precise::max(_1871, 0.0);
    uint _1875 = uint(_1873);
    float _1877 = float(_1673);
    float _1879 = _1795 * _1651;
    bool _1881 = _1877 >= _1795;
    bool _1883 = isnan(_1877);
    bool _1885 = _1881 || _1883;
    bool _1887 = isnan(_1795);
    bool _1889 = _1885 || _1887;
    float _1891 = float(_1889);
    int _1893 = _1819 * _1781;
    int _1895 = _1893 + _1391;
    int _1897 = ~_1331;
    int _1899 = _1897 + 1;
    float _1901 = trunc(_1851);
    int _1903 = int(_1901);
    int _1905 = int(_1717) + int(_1811);
    bool _1907 = uint(_1895) >= uint(_1309);
    int _1909 = int(_1759) + int(_1833);
    int _1911 = _1837 * int(_1875);
    int _1913 = _1911 + _1793;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1917 = _1915 != 0;
    int _1919 = _1899 * _1905;
    int _1921 = _1919 + _1615;
    int _1923 = ~_1341;
    int _1925 = _1923 + 1;
    float _1927 = trunc(_1825);
    int _1929 = int(_1927);
    float _1931 = float(uint(_1913));
    int _1933 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1935 = _1933 != 0;
    int _1937 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1939 = _1937 != 0;
    int _1941 = _1925 * _1909;
    int _1943 = _1941 + _1673;
    bool _1945 = uint(_1921) >= uint(_1331);
    float _1947 = as_type<float>(_1262) * _1931;
    bool _1949 = !_1917;
    int _1951 = _1949 ? 0 : 1;
    float _1953 = trunc(_1865);
    int _1955 = int(_1953);
    bool _1957 = !_1907;
    int _1959 = _1957 ? 0 : (-1);
    bool _1961 = !_1939;
    int _1963 = _1961 ? 0 : 1;
    int _1965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1967 = _1965 != 0;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1971 = _1969 != 0;
    bool _1973 = !_1935;
    int _1975 = _1973 ? 0 : 1;
    float _1977 = trunc(_1947);
    float _1979 = precise::max(_1977, 0.0);
    uint _1981 = uint(_1979);
    bool _1983 = uint(_1943) >= uint(_1341);
    int _1985 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1987 = _1985 != 0;
    bool _1989 = !_1945;
    int _1991 = _1989 ? 0 : (-1);
    int _1993 = ~_1781;
    int _1995 = _1993 + _1959;
    int _1997 = _1995 + 1;
    float _1999 = trunc(_1869);
    int _2001 = int(_1999);
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2009 = _2007 != 0;
    bool _2011 = !_1987;
    int _2013 = _2011 ? 0 : 1;
    int _2015 = _1309 * _1997;
    int _2017 = _2015 + _1391;
    bool _2019 = !_1967;
    int _2021 = _2019 ? 0 : 1;
    bool _2023 = !_1971;
    int _2025 = _2023 ? 0 : 1;
    float _2027 = trunc(_1879);
    int _2029 = int(_2027);
    int _2031 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2033 = _2031 != 0;
    bool _2035 = _1309 == 0;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2039 = _2037 != 0;
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2043 = _2041 != 0;
    int _2045 = abs(_1951);
    bool _2047 = !_2033;
    int _2049 = _2047 ? 0 : 1;
    bool _2051 = !_1983;
    int _2053 = _2051 ? 0 : (-1);
    int _2055 = _1929 * _2045;
    int _2057 = _2055 + _1391;
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2061 = _2059 != 0;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2065 = _2063 != 0;
    int _2067 = ~_1905;
    int _2069 = _2067 + _1991;
    int _2071 = _2069 + 1;
    int _2073 = ~_1903;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    bool _2079 = !_2035;
    int _2081 = _2079 ? _2017 : (-1);
    int _2083 = _1331 * _2071;
    int _2085 = _2083 + _1615;
    int _2087 = int(_1875) + int(_1981);
    float _2089 = trunc(_1891);
    int _2091 = int(_2089);
    int _2093 = ~_1174;
    int _2095 = _2093 + 1;
    int _2097 = _2077 * _2081;
    bool _2099 = !_2065;
    int _2101 = _2099 ? 0 : 1;
    bool _2103 = _1331 == 0;
    int _2105 = _2095 * _2087;
    int _2107 = _2105 + _1793;
    int _2109 = _1309 + (-1);
    int _2111 = ~_1955;
    int _2113 = _2111 + 1;
    int _2115 = _2113 + 1;
    bool _2117 = !_2103;
    int _2119 = _2117 ? _2085 : (-1);
    int _2121 = _1903 * _2109;
    int _2123 = _2121 + _2097;
    int _2125 = ~_1909;
    int _2127 = _2125 + _2053;
    int _2129 = _2127 + 1;
    float _2131 = trunc(_1839);
    int _2133 = int(_2131);
    bool _2135 = !_2043;
    int _2137 = _2135 ? 0 : 1;
    int _2139 = _2115 * _2119;
    int _2141 = abs(_1963);
    int _2143 = _1341 * _2129;
    int _2145 = _2143 + _1673;
    bool _2147 = uint(_2107) >= uint(_1174);
    int _2149 = abs(_1975);
    float _2151 = trunc(_1853);
    int _2153 = int(_2151);
    bool _2155 = !_2039;
    int _2157 = _2155 ? 0 : 1;
    bool _2159 = !_2147;
    int _2161 = _2159 ? 0 : (-1);
    int _2163 = _2123 * _2141;
    bool _2165 = !_2005;
    int _2167 = _2165 ? 0 : 1;
    float _2169 = trunc(_1867);
    int _2171 = int(_2169);
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2175 = _2173 != 0;
    int _2177 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2179 = _2177 != 0;
    bool _2181 = _1341 == 0;
    int _2183 = abs(_2021);
    int _2185 = _1331 + (-1);
    int _2187 = ~_2091;
    int _2189 = _2187 + 1;
    int _2191 = _2189 + 1;
    int _2193 = _1955 * _2185;
    int _2195 = _2193 + _2139;
    bool _2197 = !_2181;
    int _2199 = _2197 ? _2145 : (-1);
    int _2201 = _2133 * _2149;
    int _2203 = _2201 + _2163;
    float _2205 = _1441 * 2.0;
    int _2207 = abs(_2025);
    int _2209 = _2191 * _2199;
    int _2211 = abs(_2013);
    int _2213 = _2057 * _2183;
    int _2215 = _2213 + _2203;
    float _2217 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2219 = !_2009;
    int _2221 = _2219 ? 0 : 1;
    int _2223 = abs(_2167);
    int _2225 = _1929 * _2207;
    int _2227 = _2225 + _2215;
    int _2229 = abs(_2221);
    float _2231 = float(uint(_2227));
    int _2233 = _2195 * _2229;
    int _2235 = abs(_2049);
    float _2237 = as_type<float>(_1599) * _2231;
    int _2239 = abs(_2157);
    int _2241 = _2171 * _2223;
    int _2243 = _2241 + _2233;
    float _2245 = trunc(_2237);
    float _2247 = precise::max(_2245, 0.0);
    uint _2249 = uint(_2247);
    int _2251 = _2153 * _2211;
    int _2253 = _2251 + _1615;
    int _2255 = abs(_2137);
    int _2257 = _2253 * _2235;
    int _2259 = _2257 + _2243;
    bool _2261 = !_2061;
    int _2263 = _2261 ? 0 : 1;
    int _2265 = _1341 + (-1);
    int _2267 = _2153 * _2239;
    int _2269 = _2267 + _2259;
    int _2271 = abs(_2101);
    int _2273 = ~_1309;
    int _2275 = _2273 + 1;
    int _2277 = _2091 * _2265;
    int _2279 = _2277 + _2209;
    int _2281 = abs(_2263);
    int _2283 = _2275 * int(_2249);
    int _2285 = _2283 + _2227;
    bool _2287 = !_2175;
    int _2289 = _2287 ? 0 : 1;
    int _2291 = _2279 * _2271;
    int _2293 = _2029 * _2255;
    int _2295 = _2293 + _1673;
    int _2297 = ~_2087;
    int _2299 = _2297 + _2161;
    int _2301 = _2299 + 1;
    float _2303 = float(uint(_2269));
    int _2305 = _2001 * _2281;
    int _2307 = _2305 + _2291;
    float _2309 = float(uint(_2285));
    int _2311 = _1174 * _2301;
    int _2313 = _2311 + _1793;
    bool _2315 = !_2179;
    int _2317 = _2315 ? 0 : 1;
    float _2319 = as_type<float>(_1685) * _2303;
    int _2321 = abs(_2289);
    float _2323 = as_type<float>(_1599) * _2309;
    int _2325 = abs(_2317);
    float _2327 = trunc(_2319);
    float _2329 = precise::max(_2327, 0.0);
    uint _2331 = uint(_2329);
    bool _2333 = _1174 == 0;
    int _2335 = _2295 * _2321;
    int _2337 = _2335 + _2307;
    float _2339 = -_1501;
    float _2341 = _2339 + 1.0;
    bool _2343 = _1315 > 0.5;
    float _2345 = trunc(_2323);
    float _2347 = precise::max(_2345, 0.0);
    uint _2349 = uint(_2347);
    bool _2351 = !_2333;
    int _2353 = _2351 ? _2313 : (-1);
    int _2355 = _2029 * _2325;
    int _2357 = _2355 + _2337;
    int _2359 = _2343 ? as_type<int>(_2341) : as_type<int>(_1501);
    int _2361 = _2353 & 3;
    bool _2363 = _2361 != 0;
    int _2365 = _2353 & 3;
    bool _2367 = _2365 != 0;
    int _2369 = ~_1331;
    int _2371 = _2369 + 1;
    float _2373 = float(uint(_2357));
    int _2375 = _2363 ? 0 : 1;
    int _2377 = _2371 * int(_2331);
    int _2379 = _2377 + _2269;
    bool _2381 = uint(_2365) > 1u;
    float _2383 = as_type<float>(_1703) * _2373;
    int _2385 = int(_2249) + int(_2349);
    int _2387 = ~_1309;
    int _2389 = _2387 + 1;
    float _2391 = trunc(_2383);
    float _2393 = precise::max(_2391, 0.0);
    uint _2395 = uint(_2393);
    float _2397 = float(uint(_2379));
    int _2399 = ~_2375;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    float _2405 = as_type<float>(_1685) * _2397;
    int _2407 = ~_1341;
    int _2409 = _2407 + 1;
    int _2411 = _2389 * _2385;
    int _2413 = _2411 + _2227;
    int _2415 = _2403;
    if (!_2381)
    {
        int _2417 = ~_2375;
        int _2419 = _2417 + 1;
        _2415 = _2419;
    }
    int _2421 = _2415;
    float _2423 = trunc(_2405);
    float _2425 = precise::max(_2423, 0.0);
    uint _2427 = uint(_2425);
    bool _2429 = uint(_2365) >= 2u;
    bool _2431 = _1166 > 0.5;
    int _2433 = _2429 ? 0 : 1;
    int _2435 = _2409 * int(_2395);
    int _2437 = _2435 + _2357;
    bool _2439 = uint(_2413) >= uint(_1309);
    int _2441 = ~_2433;
    int _2443 = _2441 + 1;
    int _2445 = _2443 + 1;
    bool _2447 = !_2439;
    int _2449 = _2447 ? 0 : (-1);
    bool _2451 = _2365 != 3;
    float _2453 = float(uint(_2437));
    int _2455 = ~_1331;
    int _2457 = _2455 + 1;
    int _2459 = int(_2331) + int(_2427);
    float _2461 = as_type<float>(_1703) * _2453;
    int _2463 = ~_2385;
    int _2465 = _2463 + _2449;
    int _2467 = _2465 + 1;
    float _2469 = trunc(_2461);
    float _2471 = precise::max(_2469, 0.0);
    uint _2473 = uint(_2471);
    int _2475 = _2457 * _2459;
    int _2477 = _2475 + _2269;
    int _2479 = _2445;
    if (_2451)
    {
        int _2481 = ~_2433;
        int _2483 = _2481 + 1;
        _2479 = _2483;
    }
    int _2485 = _2479;
    int _2487 = _1309 * _2467;
    int _2489 = _2487 + _2227;
    int _2491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2493 = _2491 != 0;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2497 = _2495 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2499 = !_2493;
    int _2501 = _2499 ? 0 : 1;
    bool _2503 = uint(_2477) >= uint(_1331);
    float _2505 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2507 = _2505 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2509 = !_2035;
    int _2511 = _2509 ? _2489 : (-1);
    float _2513 = 1.0 / _2497;
    bool _2515 = !_2503;
    int _2517 = _2515 ? 0 : (-1);
    int _2519 = _2511 & 3;
    bool _2521 = _2519 != 0;
    int _2523 = ~_2459;
    int _2525 = _2523 + _2517;
    int _2527 = _2525 + 1;
    int _2529 = _2431 ? as_type<int>(_2341) : as_type<int>(_1501);
    float _2531 = 1.0 / _2507;
    bool _2533 = uint(_2519) >= 2u;
    int _2535 = _1331 * _2527;
    int _2537 = _2535 + _2269;
    int _2539 = _2521 ? 0 : 1;
    bool _2541 = _2519 != 3;
    int _2543 = int(_2395) + int(_2473);
    int _2545 = _2533 ? 0 : 1;
    int _2547 = ~_1341;
    int _2549 = _2547 + 1;
    bool _2551 = uint(_2519) > 1u;
    int _2553 = ~_2545;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    int _2559 = _2549 * _2543;
    int _2561 = _2559 + _2357;
    bool _2563 = !_2103;
    int _2565 = _2563 ? _2537 : (-1);
    int _2567 = _2557;
    if (_2541)
    {
        int _2569 = ~_2545;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    bool _2575 = uint(_2561) >= uint(_1341);
    int _2577 = ~_2539;
    int _2579 = _2577 + 1;
    int _2581 = _2579 + 1;
    bool _2583 = !_2575;
    int _2585 = _2583 ? 0 : (-1);
    int _2587 = _2581;
    if (!_2551)
    {
        int _2589 = ~_2539;
        int _2591 = _2589 + 1;
        _2587 = _2591;
    }
    int _2593 = _2587;
    int _2595 = _2565 & 3;
    bool _2597 = _2595 != 0;
    int _2599 = ~_2543;
    int _2601 = _2599 + _2585;
    int _2603 = _2601 + 1;
    bool _2605 = _2595 != 3;
    int _2607 = _2597 ? 0 : 1;
    int _2609 = _1341 * _2603;
    int _2611 = _2609 + _2357;
    bool _2613 = uint(_2595) >= 2u;
    int _2615 = ~_2607;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2613 ? 0 : 1;
    bool _2623 = uint(_2595) > 1u;
    bool _2625 = !_2181;
    int _2627 = _2625 ? _2611 : (-1);
    int _2629 = ~_2621;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    int _2635 = _2633;
    int _2637 = _2619;
    if (_2605)
    {
        int _2639 = ~_2621;
        int _2641 = _2639 + 1;
        _2635 = _2641;
    }
    int _2643 = _2635;
    int _2645 = _2627 & 3;
    bool _2647 = _2645 != 0;
    int _2649 = _2647 ? 0 : 1;
    bool _2651 = uint(_2645) >= 2u;
    float _2653 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    if (!_2623)
    {
        int _2655 = ~_2607;
        int _2657 = _2655 + 1;
        _2637 = _2657;
    }
    int _2659 = _2637;
    bool _2661 = _2645 != 3;
    float _2663 = fma(_2217, -2.0, _2653);
    int _2665 = _2651 ? 0 : 1;
    bool _2667 = uint(_2645) > 1u;
    float _2669 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2663);
    int _2671 = ~_2665;
    int _2673 = _2671 + 1;
    int _2675 = _2673 + 1;
    int _2677 = ~_2649;
    int _2679 = _2677 + 1;
    int _2681 = _2679 + 1;
    int _2683 = _2675;
    int _2685 = _2681;
    if (_2661)
    {
        int _2687 = ~_2665;
        int _2689 = _2687 + 1;
        _2683 = _2689;
    }
    int _2691 = _2683;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2695 = _2693 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2697 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2699 = _2697 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    if (!_2667)
    {
        int _2701 = ~_2649;
        int _2703 = _2701 + 1;
        _2685 = _2703;
    }
    int _2705 = _2685;
    int _2707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2709 = _2707 != 0;
    out.m_67.x = (*spvDescriptorSet0.vp_c9)._m0[175].x;
    int _2711 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2713 = _2711 != 0;
    float _2715 = 1.0 / _2695;
    bool _2717 = !_2709;
    int _2719 = _2717 ? 0 : 1;
    float _2721 = in.m_46.x;
    float _2723 = in.m_46.y;
    float _2725 = in.m_46.z;
    int _2727 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2729 = _2727 != 0;
    bool _2731 = !_2713;
    int _2733 = _2731 ? 0 : 1;
    float _2735 = _2729 ? as_type<float>(_2529) : _1501;
    float _2737 = 1.0 / _2699;
    int _2739 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2741 = _2739 != 0;
    bool _2743 = _1447 > 0.5;
    float _2745 = _2741 ? as_type<float>(_2359) : _1501;
    int _2747 = _2743 ? as_type<int>(_2341) : as_type<int>(_1501);
    int _2749 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2751 = _2749 != 0;
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2755 = _2753 != 0;
    float _2757 = _2751 ? as_type<float>(_2747) : _1501;
    float _2759 = _2755 ? as_type<float>(_2747) : _1501;
    int _2761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2763 = _2761 != 0;
    float _2765 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _2767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2769 = _2767 != 0;
    float _2771 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2773 = floor(_2205);
    float _2775 = _2723 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2777 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2765);
    float _2779 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2781 = _2779 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2783 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2785 = _2783 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2787 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2771);
    float _2789 = fma(_2721, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2775);
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2793 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2791;
    float _2795 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2797 = _2795 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2799 = 1.0 / _2781;
    float _2801 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2803 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2801;
    float _2805 = _2769 ? as_type<float>(_2747) : _1501;
    float _2807 = _2797 * _2513;
    bool _2809 = _2773 >= 0.0;
    bool _2811 = isnan(_2773);
    bool _2813 = _2809 || _2811;
    bool _2815 = isnan(0.0);
    bool _2817 = _2813 || _2815;
    float _2819 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2821 = _2819 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2823 = _2803 * _2531;
    float _2825 = 1.0 / _2785;
    int _2827 = _2817 ? 0 : 1;
    float _2829 = _1166 * 2.0;
    bool _2831 = _2773 > 0.0;
    float _2833 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2835 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2833;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2841 = _2793 * _2715;
    float _2843 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2845 = _2843 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2847 = 1.0 / _2821;
    float _2849 = _2835 * _2737;
    float _2851 = _2839 * _2799;
    bool _2853 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _2855 = isnan(_1156);
    bool _2857 = _2853 || _2855;
    bool _2859 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _2861 = _2857 || _2859;
    float _2863 = float(_2861);
    float _2865 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2787);
    bool _2867 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2869 = isnan(_1156);
    bool _2871 = _2867 || _2869;
    bool _2873 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2875 = _2871 || _2873;
    float _2877 = float(_2875);
    float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2881 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2879;
    float _2883 = floor(_2829);
    float _2885 = _2845 * _2825;
    bool _2887 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2889 = isnan(_1156);
    bool _2891 = _2887 || _2889;
    bool _2893 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2895 = _2891 || _2893;
    float _2897 = float(_2895);
    float _2899 = -_2863;
    float _2901 = _2899 + 1.0;
    int _2903 = ~_2827;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2789);
    int _2911 = _2907;
    if (!_2831)
    {
        int _2913 = ~_2827;
        int _2915 = _2913 + 1;
        _2911 = _2915;
    }
    int _2917 = _2911;
    float _2919 = -_2897;
    float _2921 = _2919 + 1.0;
    bool _2923 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _2925 = isnan(_1156);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2931 = _2927 || _2929;
    float _2933 = float(_2931);
    float _2935 = _2881 * _2847;
    float _2937 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2939 = _1156 + _2937;
    float _2941 = _2863 * _2921;
    bool _2943 = !_2763;
    int _2945 = _2943 ? 0 : 1;
    float _2947 = _2933 * _2901;
    float _2949 = -_2933;
    float _2951 = _2949 + 1.0;
    float _2953 = fma(_2725, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2777);
    bool _2955 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2957 = isnan(_1156);
    bool _2959 = _2955 || _2957;
    bool _2961 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2963 = _2959 || _2961;
    float _2965 = float(_2963);
    float _2967 = -_2877;
    float _2969 = _2967 + 1.0;
    bool _2971 = _2883 > 0.0;
    float _2973 = fma(_2841, _2939, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    bool _2975 = _2883 >= 0.0;
    bool _2977 = isnan(_2883);
    bool _2979 = _2975 || _2977;
    bool _2981 = isnan(0.0);
    bool _2983 = _2979 || _2981;
    float _2985 = _2877 * _2951;
    float _2987 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2989 = _1156 + _2987;
    bool _2991 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2993 = isnan(_1156);
    bool _2995 = _2991 || _2993;
    bool _2997 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2999 = _2995 || _2997;
    float _3001 = float(_2999);
    float _3003 = -_2965;
    float _3005 = _3003 + 1.0;
    bool _3007 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3009 = isnan(_1156);
    bool _3011 = _3007 || _3009;
    bool _3013 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3015 = _3011 || _3013;
    float _3017 = float(_3015);
    float _3019 = fma(_2807, _2989, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3021 = _2965 * _2969;
    float _3023 = -_3001;
    float _3025 = _3023 + 1.0;
    float _3027 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _3029 = _1156 + _3027;
    float _3031 = _3001 * _3005;
    bool _3033 = _1156 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3035 = isnan(_1156);
    bool _3037 = _3033 || _3035;
    bool _3039 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3041 = _3037 || _3039;
    float _3043 = float(_3041);
    float _3045 = -_3017;
    float _3047 = _3045 + 1.0;
    float _3049 = _3017 * _3025;
    float _3051 = fma(_2823, _3029, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3053 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3055 = _1156 + _3053;
    float _3057 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3059 = _1156 + _3057;
    float _3061 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3063 = _1156 + _3061;
    float _3065 = _3043 * _3047;
    float _3067 = fma(_2849, _3055, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3069 = fma(_2885, _3059, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3071 = fma(_2851, _3063, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    int _3073 = _2983 ? 0 : 1;
    float _3075 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3077 = _2973 * _3065;
    bool _3079 = _1449 != 1;
    float _3081 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3083 = _1156 + _3081;
    float _3085 = float(uint(_1735));
    float _3087 = -_3043;
    float _3089 = _3087 + 1.0;
    float _3091 = float(uint(_2057));
    float _3093 = fma(_2935, _3083, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3095 = float(uint(_2253));
    float _3097 = as_type<float>(_1262) * _3085;
    float _3099 = fma(_3089, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3077);
    float _3101 = as_type<float>(_1599) * _3091;
    int _3103 = ~_3073;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    float _3109 = trunc(_3097);
    float _3111 = precise::max(_3109, 0.0);
    uint _3113 = uint(_3111);
    float _3115 = as_type<float>(_1685) * _3095;
    int _3117 = _3107;
    float _3119 = _3091;
    float _3121 = _3089;
    float _3123 = _3099;
    if (!_2971)
    {
        int _3125 = ~_3073;
        int _3127 = _3125 + 1;
        _3117 = _3127;
    }
    int _3129 = _3117;
    float _3131 = _3075 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3133 = fma(_3019, _3049, _3099);
    float _3135 = float(uint(_2295));
    float _3137 = _2865 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _3139 = fma(_3131, _1587, -0.5);
    float _3141 = trunc(_3101);
    float _3143 = precise::max(_3141, 0.0);
    uint _3145 = uint(_3143);
    int _3147 = ~_1174;
    int _3149 = _3147 + 1;
    float _3151 = as_type<float>(_1703) * _3135;
    int _3153 = ~_1309;
    int _3155 = _3153 + 1;
    float _3157 = fma(_3051, _3031, _3133);
    int _3159 = ~_1331;
    int _3161 = _3159 + 1;
    float _3163 = _2953 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3165 = _1451 != 2;
    float _3167 = trunc(_3115);
    float _3169 = precise::max(_3167, 0.0);
    uint _3171 = uint(_3169);
    float _3173 = _2909 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3175 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3177 = !_3079;
    float _3179 = _3177 ? as_type<float>(_1453) : as_type<float>(_1455);
    int _3181 = _3155 * int(_3145);
    int _3183 = _3181 + _2057;
    float _3185 = trunc(_3151);
    float _3187 = precise::max(_3185, 0.0);
    uint _3189 = uint(_3187);
    int _3191 = _3149 * int(_3113);
    int _3193 = _3191 + _1735;
    float _3195 = _1441 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3197 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3199 = float(uint(_3183));
    float _3201 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3203 = float(uint(_3193));
    int _3205 = _3161 * int(_3171);
    int _3207 = _3205 + _2253;
    float _3209 = -_3175;
    float _3211 = fma(_3195, 2.0, _3209);
    float _3213 = as_type<float>(_1599) * _3199;
    int _3215 = ~_1341;
    int _3217 = _3215 + 1;
    float _3219 = as_type<float>(_1262) * _3203;
    float _3221 = float(uint(_3207));
    float _3223 = fma(as_type<float>(_1455), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3197);
    float _3225 = as_type<float>(_1455) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3227 = !_3079;
    float _3229 = _3227 ? as_type<float>(_1457) : as_type<float>(_1453);
    int _3231 = _3217 * int(_3189);
    int _3233 = _3231 + _2295;
    float _3235 = as_type<float>(_1685) * _3221;
    float _3237 = trunc(_3219);
    float _3239 = precise::max(_3237, 0.0);
    uint _3241 = uint(_3239);
    float _3243 = fma(as_type<float>(_1453), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3201);
    float _3245 = as_type<float>(_1453) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3247 = float(uint(_3233));
    float _3249 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3223);
    float _3251 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3243);
    float _3253 = trunc(_3213);
    float _3255 = precise::max(_3253, 0.0);
    uint _3257 = uint(_3255);
    float _3259 = as_type<float>(_1703) * _3247;
    float _3261 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3263 = _3075;
    float _3265 = _3225;
    if (!_3079)
    {
        _3263 = _1447;
    }
    float _3267 = _3263;
    float _3269 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3271 = _3267;
    if (_3079)
    {
        _3271 = _1166;
    }
    float _3273 = _3271;
    float _3275 = -_3261;
    float _3277 = fma(_3225, 2.0, _3275);
    if (_3165)
    {
        _3265 = _1441;
    }
    float _3279 = _3265;
    float _3281 = trunc(_3235);
    float _3283 = precise::max(_3281, 0.0);
    uint _3285 = uint(_3283);
    float _3287 = fma(_3069, _3021, _3157);
    int _3289 = ~_1174;
    int _3291 = _3289 + 1;
    float _3293 = fma(_3245, -2.0, _3269);
    int _3295 = int(_3113) + int(_3241);
    float _3297 = fma(_3067, _2985, _3287);
    float _3299 = -_156;
    float _3301 = fma(_3299, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3211);
    int _3303 = int(_3145) + int(_3257);
    float _3305 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3307 = ~_1309;
    int _3309 = _3307 + 1;
    int _3311 = _3291 * _3295;
    int _3313 = _3311 + _1735;
    float _3315 = as_type<float>(_3291);
    float _3317 = _3279;
    if (_3165)
    {
        _3315 = _1166;
    }
    float _3319 = _3315;
    float _3321 = fma(_3071, _2947, _3297);
    float _3323 = _3319;
    if (!_3165)
    {
        _3317 = _1447;
    }
    float _3325 = _3317;
    int _3327 = _3309 * _3303;
    int _3329 = _3327 + _2057;
    if (!_3165)
    {
        _3323 = _1441;
    }
    float _3331 = _3323;
    float _3333 = trunc(_3259);
    float _3335 = precise::max(_3333, 0.0);
    uint _3337 = uint(_3335);
    bool _3339 = uint(_3313) >= uint(_1174);
    float _3341 = _1166 + _1441;
    int _3343 = int(_3171) + int(_3285);
    float _3345 = _3325 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3347 = ~_1331;
    int _3349 = _3347 + 1;
    float _3351 = _3341 + (-1.0);
    bool _3353 = !_3339;
    int _3355 = _3353 ? 0 : (-1);
    float _3357 = _3331 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3359 = uint(_3329) >= uint(_1309);
    int _3361 = _3349 * _3343;
    int _3363 = _3361 + _2253;
    float _3365 = fma(_3093, _2941, _3321);
    if (!_3079)
    {
        _3119 = _1166;
    }
    float _3367 = _3119;
    float _3369 = -_156;
    float _3371 = fma(_3369, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3277);
    float _3373 = _3367;
    if (!_3079)
    {
        _3121 = _1166;
    }
    float _3375 = _3121;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3379 = int(_3189) + int(_3337);
    float _3381 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3293);
    int _3383 = ~_1341;
    int _3385 = _3383 + 1;
    float _3387 = fma(_2897, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3365);
    bool _3389 = !_3359;
    int _3391 = _3389 ? 0 : (-1);
    bool _3393 = uint(_3363) >= uint(_1331);
    float _3395 = _1447 * 2.0;
    int _3397 = ~_3303;
    int _3399 = _3397 + _3391;
    int _3401 = _3399 + 1;
    float _3403 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3405 = _3163 + _3403;
    bool _3407 = !_3393;
    int _3409 = _3407 ? 0 : (-1);
    int _3411 = _3385 * _3379;
    int _3413 = _3411 + _2295;
    float _3415 = _3375;
    if (!_3079)
    {
        _3123 = _1447;
    }
    float _3417 = _3123;
    float _3419 = floor(_3395);
    int _3421 = _1309 * _3401;
    int _3423 = _3421 + _2057;
    int _3425 = ~_3343;
    int _3427 = _3425 + _3409;
    int _3429 = _3427 + 1;
    out.m_69.x = _3387;
    bool _3431 = uint(_3413) >= uint(_1341);
    float _3433 = _3417;
    if (_3079)
    {
        _3373 = _1441;
    }
    float _3435 = _3373;
    bool _3437 = !_3431;
    int _3439 = _3437 ? 0 : (-1);
    if (_3079)
    {
        _3415 = _1441;
    }
    float _3441 = _3415;
    int _3443 = ~_3379;
    int _3445 = _3443 + _3439;
    int _3447 = _3445 + 1;
    int _3449 = _1331 * _3429;
    int _3451 = _3449 + _2253;
    float _3453 = _3273 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3455 = _2353 >> 31;
    float _3457 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3459 = int(_3457);
    if (_3079)
    {
        _3433 = _1166;
    }
    float _3461 = _3433;
    float _3463 = fma(_3453, -2.0, _3377);
    int _3465 = _3455 & 3;
    int _3467 = _1341 * _3447;
    int _3469 = _3467 + _2295;
    bool _3471 = _3419 > 0.0;
    float _3473 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3463);
    bool _3475 = _3419 >= 0.0;
    bool _3477 = isnan(_3419);
    bool _3479 = _3475 || _3477;
    bool _3481 = isnan(0.0);
    bool _3483 = _3479 || _3481;
    float _3485 = _3305 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _3487 = _2353 + _3465;
    float _3489 = fma(_3485, _2805, -0.5);
    int _3491 = ~_3295;
    int _3493 = _3491 + _3355;
    int _3495 = _3493 + 1;
    float _3497 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3499 = _3137 + _3497;
    int _3501 = _3487 >> 2;
    float _3503 = fma(_3351, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3505 = _2511 >> 31;
    float _3507 = _3435 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _3509 = _3499 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _3511 = _1174 * _3495;
    int _3513 = _3511 + _1735;
    int _3515 = _3505 & 3;
    float _3517 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3519 = _3173 + _3517;
    float _3521 = fma(_3405, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3509);
    int _3523 = _2627 >> 31;
    float _3525 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3527 = _2511 + _3515;
    float _3529 = fma(_3519, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3521);
    int _3531 = _3523 & 3;
    float _3533 = -_3525;
    float _3535 = fma(_3345, 2.0, _3533);
    bool _3537 = !_2181;
    int _3539 = _3537 ? _3469 : (-1);
    float _3541 = -_156;
    float _3543 = fma(_3541, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3535);
    int _3545 = _2565 >> 31;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3549 = _3527 >> 2;
    bool _3551 = !_2333;
    int _3553 = _3551 ? _3513 : (-1);
    float _3555 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3547);
    int _3557 = _2627 + _3531;
    bool _3559 = _3529 >= 0.0;
    float _3561 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3555);
    bool _3563 = _2519 != 3;
    int _3565 = _3545 & 3;
    int _3567 = _3549 << 4;
    int _3569 = _3567 + 512;
    float _3571 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    bool _3573 = !_2103;
    int _3575 = _3573 ? _3451 : (-1);
    int _3577 = _3501 << 4;
    int _3579 = _3577 + 368;
    float _3581 = fma(_3229, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3571);
    bool _3583 = _2365 != 3;
    float _3585 = _3229 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3587 = _3557 >> 2;
    uint _3589 = uint(int(uint(_3579) >> uint(2)));
    uint _3591 = uint(int(uint(int(_3589)) >> uint(2)));
    int _3593 = int(_3589) & 3;
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[int(_3591)][_3593];
    int _3597 = int(_3589) + 1;
    uint _3599 = uint(int(uint(_3597) >> uint(2)));
    int _3601 = _3597 & 3;
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[int(_3599)][_3601];
    float _3605 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3581);
    int _3607 = _2565 + _3565;
    float _3609 = as_type<float>(_3545);
    if (_3559)
    {
        out.m_49.x = 0.0;
    }
    bool _3611 = !_2035;
    int _3613 = _3611 ? _3423 : (-1);
    float _3615 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    uint _3617 = uint(int(uint(_3569) >> uint(2)));
    uint _3619 = uint(int(uint(int(_3617)) >> uint(2)));
    int _3621 = int(_3617) & 3;
    float _3623 = (*spvDescriptorSet0.vp_c9)._m0[int(_3619)][_3621];
    int _3625 = int(_3617) + 1;
    uint _3627 = uint(int(uint(_3625) >> uint(2)));
    int _3629 = _3625 & 3;
    float _3631 = (*spvDescriptorSet0.vp_c9)._m0[int(_3627)][_3629];
    float _3633 = -_3615;
    float _3635 = fma(_3507, 2.0, _3633);
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3639 = _3607 >> 2;
    float _3641 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3643 = !_2367;
    int _3645 = _3643 ? 0 : 1;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3649 = fma(_3461, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3637);
    int _3651 = _2565 & 3;
    bool _3653 = _3651 != 0;
    float _3655 = fma(_3585, -2.0, _3641);
    int _3657 = _3639 << 4;
    int _3659 = _3657 + 656;
    float _3661 = fma(_3179, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3647);
    int _3663 = _3587 << 4;
    int _3665 = _3663 + 800;
    float _3667 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3669 = _3179 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3671 = _2511 & 3;
    bool _3673 = _3671 != 0;
    float _3675 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3661);
    bool _3677 = !_3653;
    int _3679 = _3677 ? 0 : 1;
    uint _3681 = uint(int(uint(_3659) >> uint(2)));
    uint _3683 = uint(int(uint(int(_3681)) >> uint(2)));
    int _3685 = int(_3681) & 3;
    float _3687 = (*spvDescriptorSet0.vp_c9)._m0[int(_3683)][_3685];
    int _3689 = int(_3681) + 1;
    uint _3691 = uint(int(uint(_3689) >> uint(2)));
    int _3693 = _3689 & 3;
    float _3695 = (*spvDescriptorSet0.vp_c9)._m0[int(_3691)][_3693];
    int _3697 = _2627 & 3;
    bool _3699 = _3697 != 0;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    if (_3559)
    {
        _3609 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3703 = _3609;
    float _3705 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3655);
    float _3707 = -_3667;
    float _3709 = fma(_3669, 2.0, _3707);
    int _3711 = abs(_2421);
    float _3713 = fma(_3357, -2.0, _3701);
    uint _3715 = uint(int(uint(_3665) >> uint(2)));
    uint _3717 = uint(int(uint(int(_3715)) >> uint(2)));
    int _3719 = int(_3715) & 3;
    float _3721 = (*spvDescriptorSet0.vp_c9)._m0[int(_3717)][_3719];
    int _3723 = int(_3715) + 1;
    uint _3725 = uint(int(uint(_3723) >> uint(2)));
    int _3727 = _3723 & 3;
    float _3729 = (*spvDescriptorSet0.vp_c9)._m0[int(_3725)][_3727];
    float _3731 = -_156;
    float _3733 = fma(_3731, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3709);
    int _3735 = as_type<int>(_3703);
    if (_3559)
    {
        float _3737 = _3703 * 5.0;
        _3735 = as_type<int>(_3737);
    }
    int _3739 = _3735;
    int _3741 = abs(_2593);
    float _3743 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3649);
    float _3745 = fma(_3675, _3139, _3733);
    int _3747 = abs(_2705);
    int _3749 = _3579 + 8;
    uint _3751 = uint(int(uint(_3749) >> uint(2)));
    uint _3753 = uint(int(uint(int(_3751)) >> uint(2)));
    int _3755 = int(_3751) & 3;
    float _3757 = (*spvDescriptorSet0.vp_c9)._m0[int(_3753)][_3755];
    int _3759 = int(_3751) + 1;
    uint _3761 = uint(int(uint(_3759) >> uint(2)));
    int _3763 = _3759 & 3;
    float _3765 = (*spvDescriptorSet0.vp_c9)._m0[int(_3761)][_3763];
    if (_3559)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12021 = as_type<float>(_3739);
        out.gl_Position.z = _12021;
    }
    float _3767 = -_156;
    float _3769 = fma(_3767, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3635);
    bool _3771 = !_3673;
    int _3773 = _3771 ? 0 : 1;
    float _3775 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3713);
    int _3777 = abs(_3645);
    float _3779 = -_3705;
    float _3781 = fma(_3605, _3489, _3779);
    int _3783 = _3569 + 8;
    uint _3785 = uint(int(uint(_3783) >> uint(2)));
    uint _3787 = uint(int(uint(int(_3785)) >> uint(2)));
    int _3789 = int(_3785) & 3;
    float _3791 = (*spvDescriptorSet0.vp_c9)._m0[int(_3787)][_3789];
    int _3793 = int(_3785) + 1;
    uint _3795 = uint(int(uint(_3793) >> uint(2)));
    int _3797 = _3793 & 3;
    float _3799 = (*spvDescriptorSet0.vp_c9)._m0[int(_3795)][_3797];
    int _3801 = abs(_2659);
    int _3803 = abs(_3773);
    int _3805 = ~_3741;
    int _3807 = _3805 + 1;
    int _3809 = _3807 + 1;
    int _3811 = _3659 + 8;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = ~_3711;
    int _3831 = _3829 + 1;
    int _3833 = _3831 + 1;
    int _3835 = _3809 * as_type<int>(_3631);
    bool _3837 = !_3699;
    int _3839 = _3837 ? 0 : 1;
    int _3841 = _3665 + 8;
    uint _3843 = uint(int(uint(_3841) >> uint(2)));
    uint _3845 = uint(int(uint(int(_3843)) >> uint(2)));
    int _3847 = int(_3843) & 3;
    float _3849 = (*spvDescriptorSet0.vp_c9)._m0[int(_3845)][_3847];
    int _3851 = int(_3843) + 1;
    uint _3853 = uint(int(uint(_3851) >> uint(2)));
    int _3855 = _3851 & 3;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[int(_3853)][_3855];
    int _3859 = ~_3777;
    int _3861 = _3859 + 1;
    int _3863 = _3861 + 1;
    int _3865 = _3833 * as_type<int>(_3603);
    int _3867 = ~_3803;
    int _3869 = _3867 + 1;
    int _3871 = _3869 + 1;
    float _3873 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3875 = int(_3873);
    bool _3877 = _2595 != 3;
    int _3879 = _3863 * as_type<int>(_3595);
    int _3881 = _3879 + _3865;
    bool _3883 = !_3583;
    int _3885 = _3883 ? 0 : (-1);
    int _3887 = _3871 * as_type<int>(_3623);
    int _3889 = _3887 + _3835;
    bool _3891 = _2645 != 3;
    int _3893 = abs(_3839);
    bool _3895 = !_3563;
    int _3897 = _3895 ? 0 : (-1);
    bool _3899 = !_3877;
    int _3901 = _3899 ? 0 : (-1);
    int _3903 = ~_3801;
    int _3905 = _3903 + 1;
    int _3907 = _3905 + 1;
    int _3909 = abs(_2485);
    int _3911 = abs(_2573);
    int _3913 = _3907 * as_type<int>(_3695);
    int _3915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3917 = _3915 != 0;
    int _3919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3921 = _3919 != 0;
    int _3923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3925 = _3923 != 0;
    int _3927 = ~_3747;
    int _3929 = _3927 + 1;
    int _3931 = _3929 + 1;
    float _3933 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3935 = int(_3933);
    int _3937 = ~_3909;
    int _3939 = _3937 + 1;
    int _3941 = _3939 + 1;
    int _3943 = _3931 * as_type<int>(_3729);
    int _3945 = ~_3893;
    int _3947 = _3945 + 1;
    int _3949 = _3947 + 1;
    int _3951 = ~_3911;
    int _3953 = _3951 + 1;
    int _3955 = _3953 + 1;
    int _3957 = _3941 * as_type<int>(_3757);
    int _3959 = _3957 + _3881;
    int _3961 = abs(_3679);
    int _3963 = _3949 * as_type<int>(_3721);
    int _3965 = _3963 + _3943;
    int _3967 = abs(_2643);
    int _3969 = _3955 * as_type<int>(_3791);
    int _3971 = _3969 + _3889;
    int _3973 = ~_3961;
    int _3975 = _3973 + 1;
    int _3977 = _3975 + 1;
    float _3979 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3981 = int(_3979);
    int _3983 = abs(_2691);
    int _3985 = abs(_3897);
    int _3987 = _3977 * as_type<int>(_3687);
    int _3989 = _3987 + _3913;
    float _3991 = float(uint(_3459));
    int _3993 = ~_3967;
    int _3995 = _3993 + 1;
    int _3997 = _3995 + 1;
    float _3999 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4001 = log2(_3999);
    int _4003 = ~_3983;
    int _4005 = _4003 + 1;
    int _4007 = _4005 + 1;
    int _4009 = ~_3985;
    int _4011 = _4009 + 1;
    int _4013 = _4011 + 1;
    int _4015 = _3997 * as_type<int>(_3819);
    int _4017 = _4015 + _3989;
    int _4019 = abs(_3885);
    int _4021 = _4007 * as_type<int>(_3849);
    int _4023 = _4021 + _3965;
    float _4025 = float(uint(_3935));
    float _4027 = 1.0 / _3991;
    int _4029 = _4013 * as_type<int>(_3799);
    int _4031 = _4029 + _3971;
    int _4033 = ~_4019;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = float(uint(_3875));
    int _4041 = abs(_3901);
    int _4043 = _4037 * as_type<int>(_3765);
    int _4045 = _4043 + _3959;
    int _4047 = abs(_2501);
    float _4049 = 1.0 / _4025;
    int _4051 = abs(_2733);
    float _4053 = _4001 * _156;
    int _4055 = ~_4041;
    int _4057 = _4055 + 1;
    int _4059 = _4057 + 1;
    int _4061 = ~_4047;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    bool _4067 = !_3891;
    int _4069 = _4067 ? 0 : (-1);
    float _4071 = 1.0 / _4039;
    int _4073 = abs(_2719);
    int _4075 = _4059 * as_type<int>(_3827);
    int _4077 = _4075 + _4017;
    int _4079 = abs(_4069);
    int _4081 = _4045 * _4065;
    int _4083 = ~_4073;
    int _4085 = _4083 + 1;
    int _4087 = _4085 + 1;
    int _4089 = as_type<int>(_4027) + (-2);
    int _4091 = _3553 * _4047;
    int _4093 = _4091 + _4081;
    int _4095 = ~_4051;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = _4087 * _4077;
    float _4103 = exp2(_4053);
    float _4105 = float(uint(_4093));
    int _4107 = _4099 * _4031;
    int _4109 = ~_4079;
    int _4111 = _4109 + 1;
    int _4113 = _4111 + 1;
    int _4115 = _3575 * _4073;
    int _4117 = _4115 + _4101;
    int _4119 = as_type<int>(_4049) + (-2);
    int _4121 = _3613 * _4051;
    int _4123 = _4121 + _4107;
    int _4125 = abs(_2945);
    int _4127 = _4113 * as_type<int>(_3857);
    int _4129 = _4127 + _4023;
    float _4131 = as_type<float>(_4089) * _4105;
    int _4133 = as_type<int>(_4071) + (-2);
    float _4135 = float(uint(_4123));
    float _4137 = float(uint(_4117));
    float _4139 = trunc(_4131);
    float _4141 = precise::max(_4139, 0.0);
    uint _4143 = uint(_4141);
    int _4145 = ~_4125;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    float _4151 = as_type<float>(_4119) * _4135;
    float _4153 = float(uint(_3981));
    float _4155 = as_type<float>(_4133) * _4137;
    int _4157 = _3483 ? 0 : 1;
    int _4159 = _4149 * _4129;
    int _4161 = abs(_3459);
    float _4163 = trunc(_4151);
    float _4165 = precise::max(_4163, 0.0);
    uint _4167 = uint(_4165);
    int _4169 = ~_4157;
    int _4171 = _4169 + 1;
    int _4173 = _4171 + 1;
    int _4175 = _3539 * _4125;
    int _4177 = _4175 + _4159;
    int _4179 = _4173;
    if (!_3471)
    {
        int _4181 = ~_4157;
        int _4183 = _4181 + 1;
        _4179 = _4183;
    }
    int _4185 = _4179;
    float _4187 = -_4103;
    float _4189 = _4187 + 1.0;
    int _4191 = ~_3459;
    int _4193 = _4191 + 1;
    int _4195 = ~_3935;
    int _4197 = _4195 + 1;
    float _4199 = trunc(_4155);
    float _4201 = precise::max(_4199, 0.0);
    uint _4203 = uint(_4201);
    int _4205 = abs(_3935);
    int _4207 = _4193 * int(_4143);
    int _4209 = _4207 + _4093;
    float _4211 = float(uint(_4161));
    int _4213 = ~_3875;
    int _4215 = _4213 + 1;
    float _4217 = float(uint(_4205));
    float _4219 = 1.0 / _4153;
    int _4221 = _4197 * int(_4167);
    int _4223 = _4221 + _4123;
    int _4225 = abs(_3875);
    float _4227 = float(uint(_4209));
    float _4229 = float(uint(_4223));
    float _4231 = 1.0 / _4211;
    int _4233 = _4215 * int(_4203);
    int _4235 = _4233 + _4117;
    float _4237 = float(uint(_4225));
    float _4239 = as_type<float>(_4089) * _4227;
    int _4241 = abs(_3981);
    float _4243 = as_type<float>(_4119) * _4229;
    float _4245 = float(uint(_4235));
    float _4247 = 1.0 / _4217;
    int _4249 = as_type<int>(_4219) + (-2);
    float _4251 = as_type<float>(_4133) * _4245;
    float _4253 = float(uint(_4177));
    float _4255 = float(uint(_4241));
    float _4257 = 1.0 / _4237;
    int _4259 = abs(_4093);
    float _4261 = as_type<float>(_4249) * _4253;
    int _4263 = abs(_4123);
    int _4265 = as_type<int>(_4231) + (-2);
    float _4267 = float(uint(_4259));
    float _4269 = 1.0 / _4255;
    int _4271 = as_type<int>(_4247) + (-2);
    float _4273 = as_type<float>(_4265) * _4267;
    float _4275 = float(uint(_4263));
    bool _4277 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4279 = isnan(1.0);
    bool _4281 = _4277 || _4279;
    bool _4283 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4285 = _4281 || _4283;
    float _4287 = trunc(_4261);
    float _4289 = precise::max(_4287, 0.0);
    uint _4291 = uint(_4289);
    float _4293 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4295 = 1.0 + _4293;
    int _4297 = abs(_4117);
    float _4299 = as_type<float>(_4271) * _4275;
    float _4301 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4303 = as_type<int>(_4257) + (-2);
    float _4305 = trunc(_4273);
    float _4307 = precise::max(_4305, 0.0);
    uint _4309 = uint(_4307);
    float _4311 = float(uint(_4297));
    float _4313 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4315 = as_type<float>(_4303) * _4311;
    int _4317 = abs(_4177);
    float _4319 = 1.0 / _4295;
    int _4321 = ~_3981;
    int _4323 = _4321 + 1;
    float _4325 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4301);
    float _4327 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4313);
    float _4329 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4331 = as_type<int>(_4269) + (-2);
    float _4333 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4325);
    float _4335 = float(uint(_4317));
    float _4337 = trunc(_4299);
    float _4339 = precise::max(_4337, 0.0);
    uint _4341 = uint(_4339);
    bool _4343 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4345 = isnan(0.0);
    bool _4347 = _4343 || _4345;
    bool _4349 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4351 = _4347 || _4349;
    float _4353 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _4355 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4327);
    int _4357 = _4323 * int(_4291);
    int _4359 = _4357 + _4177;
    int _4361 = ~_4161;
    int _4363 = _4361 + 1;
    float _4365 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4329);
    float _4367 = as_type<float>(_4331) * _4335;
    float _4369 = trunc(_4315);
    float _4371 = precise::max(_4369, 0.0);
    uint _4373 = uint(_4371);
    float _4375 = fma(_1441, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4353);
    float _4377 = _4351 ? _4189 : 0.0;
    float _4379 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4365);
    float _4381 = float(uint(_4359));
    int _4383 = _4363 * int(_4309);
    int _4385 = _4383 + _4259;
    int _4387 = ~_4205;
    int _4389 = _4387 + 1;
    float _4391 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4375);
    float _4393 = trunc(_4243);
    float _4395 = precise::max(_4393, 0.0);
    uint _4397 = uint(_4395);
    if (_4285)
    {
        float _4399 = _4377 * _4319;
        _158 = _4399;
    }
    float _4401 = _158;
    float _4403 = as_type<float>(_4249) * _4381;
    float _4405 = float(uint(_4385));
    int _4407 = _4389 * int(_4341);
    int _4409 = _4407 + _4263;
    float _4411 = trunc(_4239);
    float _4413 = precise::max(_4411, 0.0);
    uint _4415 = uint(_4413);
    int _4417 = ~_4225;
    int _4419 = _4417 + 1;
    float _4421 = as_type<float>(_4265) * _4405;
    float _4423 = trunc(_4367);
    float _4425 = precise::max(_4423, 0.0);
    uint _4427 = uint(_4425);
    int _4429 = int(_4167) + int(_4397);
    int _4431 = _4419 * int(_4373);
    int _4433 = _4431 + _4297;
    int _4435 = ~_3981;
    int _4437 = _4435 + 1;
    float _4439 = float(uint(_4433));
    float _4441 = trunc(_4403);
    float _4443 = precise::max(_4441, 0.0);
    uint _4445 = uint(_4443);
    int _4447 = int(_4143) + int(_4415);
    int _4449 = ~_4241;
    int _4451 = _4449 + 1;
    float _4453 = as_type<float>(_4303) * _4439;
    float _4455 = trunc(_4251);
    float _4457 = precise::max(_4455, 0.0);
    uint _4459 = uint(_4457);
    float _4461 = trunc(_4453);
    float _4463 = precise::max(_4461, 0.0);
    uint _4465 = uint(_4463);
    float _4467 = float(uint(_4409));
    int _4469 = ~_3459;
    int _4471 = _4469 + 1;
    int _4473 = int(_4291) + int(_4445);
    float _4475 = as_type<float>(_4271) * _4467;
    int _4477 = _4451 * int(_4427);
    int _4479 = _4477 + _4317;
    float _4481 = trunc(_4421);
    float _4483 = precise::max(_4481, 0.0);
    uint _4485 = uint(_4483);
    int _4487 = ~_3935;
    int _4489 = _4487 + 1;
    float _4491 = float(uint(_4479));
    int _4493 = _4471 * _4447;
    int _4495 = _4493 + _4093;
    int _4497 = ~_3875;
    int _4499 = _4497 + 1;
    float _4501 = as_type<float>(_4331) * _4491;
    float _4503 = trunc(_4475);
    float _4505 = precise::max(_4503, 0.0);
    uint _4507 = uint(_4505);
    int _4509 = _4489 * _4429;
    int _4511 = _4509 + _4123;
    int _4513 = int(_4203) + int(_4459);
    int _4515 = _4437 * _4473;
    int _4517 = _4515 + _4177;
    bool _4519 = uint(_4511) >= uint(_3935);
    float _4521 = trunc(_4501);
    float _4523 = precise::max(_4521, 0.0);
    uint _4525 = uint(_4523);
    bool _4527 = uint(_4495) >= uint(_3459);
    int _4529 = _4499 * _4513;
    int _4531 = _4529 + _4117;
    int _4533 = int(_4373) + int(_4465);
    int _4535 = int(_4309) + int(_4485);
    int _4537 = ~_4161;
    int _4539 = _4537 + 1;
    bool _4541 = !_4519;
    int _4543 = _4541 ? 0 : (-1);
    bool _4545 = uint(_4517) >= uint(_3981);
    int _4547 = _4539 * _4535;
    int _4549 = _4547 + _4259;
    int _4551 = ~_4225;
    int _4553 = _4551 + 1;
    bool _4555 = !_4527;
    int _4557 = _4555 ? 0 : (-1);
    bool _4559 = uint(_4531) >= uint(_3875);
    int _4561 = _4553 * _4533;
    int _4563 = _4561 + _4297;
    int _4565 = int(_4341) + int(_4507);
    int _4567 = ~_4205;
    int _4569 = _4567 + 1;
    bool _4571 = !_4559;
    int _4573 = _4571 ? 0 : (-1);
    bool _4575 = uint(_4549) >= uint(_4161);
    int _4577 = _4569 * _4565;
    int _4579 = _4577 + _4263;
    int _4581 = ~_4241;
    int _4583 = _4581 + 1;
    bool _4585 = !_4575;
    int _4587 = _4585 ? 0 : (-1);
    bool _4589 = uint(_4563) >= uint(_4225);
    float _4591 = _3499 * _3499;
    int _4593 = int(_4427) + int(_4525);
    float _4595 = fma(_3405, _3405, _4591);
    bool _4597 = !_4545;
    int _4599 = _4597 ? 0 : (-1);
    bool _4601 = uint(_4579) >= uint(_4205);
    float _4603 = fma(_3519, _3519, _4595);
    int _4605 = _4583 * _4593;
    int _4607 = _4605 + _4317;
    int _4609 = ~_4447;
    int _4611 = _4609 + _4557;
    int _4613 = _4611 + 1;
    float _4615 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4617 = !_4601;
    int _4619 = _4617 ? 0 : (-1);
    bool _4621 = uint(_4607) >= uint(_4241);
    int _4623 = _3459 * _4613;
    int _4625 = _4623 + _4093;
    int _4627 = ~_4513;
    int _4629 = _4627 + _4573;
    int _4631 = _4629 + 1;
    bool _4633 = !_4589;
    int _4635 = _4633 ? 0 : (-1);
    float _4637 = rsqrt(_4603);
    bool _4639 = _3459 == 0;
    int _4641 = ~_4473;
    int _4643 = _4641 + _4599;
    int _4645 = _4643 + 1;
    int _4647 = _3875 * _4631;
    int _4649 = _4647 + _4117;
    bool _4651 = !_4639;
    int _4653 = _4651 ? _4625 : (-1);
    bool _4655 = _3875 == 0;
    float _4657 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4659 = ~_4429;
    int _4661 = _4659 + _4543;
    int _4663 = _4661 + 1;
    float _4665 = _4615 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4667 = !_4655;
    int _4669 = _4667 ? _4649 : (-1);
    bool _4671 = _3459 == 0;
    int _4673 = _3935 * _4663;
    int _4675 = _4673 + _4123;
    int _4677 = _4093 ^ _3459;
    float _4679 = _3499 * _4637;
    int _4681 = _4123 ^ _3935;
    float _4683 = _3405 * _4637;
    uint _4685 = uint(int(uint(_4677) >> uint(31)));
    float _4687 = -_4679;
    float _4689 = fma(_4687, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3499);
    uint _4691 = uint(int(uint(_4681) >> uint(31)));
    float _4693 = -_4683;
    float _4695 = fma(_4693, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3405);
    bool _4697 = !_4621;
    int _4699 = _4697 ? 0 : (-1);
    float _4701 = _3781 + 0.5;
    bool _4703 = _3935 == 0;
    float _4705 = fma(_4665, _1483, -0.5);
    int _4707 = ~_4587;
    int _4709 = _4535 + _4707;
    int _4711 = _4709 + 1;
    float _4713 = _4689 * _4689;
    int _4715 = ~int(_4685);
    int _4717 = _4715 + 1;
    float _4719 = _3745 + 0.5;
    int _4721 = ~_4619;
    int _4723 = _4565 + _4721;
    int _4725 = _4723 + 1;
    float _4727 = fma(_4695, _4695, _4713);
    int _4729 = ~int(_4691);
    int _4731 = _4729 + 1;
    float _4733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4735 = !_4703;
    int _4737 = _4735 ? _4675 : (-1);
    int _4739 = _3981 * _4645;
    int _4741 = _4739 + _4177;
    int _4743 = _4711 ^ _4717;
    out.m_71.x = _4719;
    out.m_71.y = _4701;
    bool _4745 = _3981 == 0;
    float _4747 = _4657 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4749 = _4725 ^ _4731;
    float _4751 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _4753 = ~_4717;
    int _4755 = _4753 + _4743;
    int _4757 = _4755 + 1;
    bool _4759 = !_4745;
    int _4761 = _4759 ? _4741 : (-1);
    int _4763 = ~_4731;
    int _4765 = _4763 + _4749;
    int _4767 = _4765 + 1;
    bool _4769 = _3935 == 0;
    float _4771 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4773 = !_4671;
    int _4775 = _4773 ? _4757 : (-1);
    float _4777 = _4733 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4779 = _3875 == 0;
    int _4781 = _4117 ^ _3875;
    float _4783 = fma(_4777, _1547, -0.5);
    bool _4785 = !_4769;
    int _4787 = _4785 ? _4767 : (-1);
    float _4789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4791 = _3981 == 0;
    int _4793 = _4177 ^ _3981;
    float _4795 = float(_4653);
    uint _4797 = uint(int(uint(_4781) >> uint(31)));
    float _4799 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _4801 = float(_4737);
    float _4803 = fma(_4665, _4795, _3301);
    float _4805 = float(_4669);
    float _4807 = _4751 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _4809 = ~_4635;
    int _4811 = _4533 + _4809;
    int _4813 = _4811 + 1;
    float _4815 = fma(_4777, _4801, _3769);
    int _4817 = ~int(_4797);
    int _4819 = _4817 + 1;
    float _4821 = fma(_4807, _4805, _3543);
    float _4823 = float(_4761);
    float _4825 = _4771 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4827 = _4813 ^ _4819;
    float _4829 = fma(_4807, _1569, -0.5);
    float _4831 = float(_4775);
    float _4833 = fma(_4825, _1579, -0.5);
    int _4835 = ~_4819;
    int _4837 = _4835 + _4827;
    int _4839 = _4837 + 1;
    float _4841 = fma(_4825, _4823, _3371);
    uint _4843 = uint(int(uint(_4793) >> uint(31)));
    float _4845 = fma(_4747, _2735, -0.5);
    float _4847 = -_2669;
    float _4849 = fma(_4747, _4831, _4847);
    float _4851 = _4799 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _4853 = !_4779;
    int _4855 = _4853 ? _4839 : (-1);
    float _4857 = fma(_4379, _4829, _4821);
    int _4859 = ~_4699;
    int _4861 = _4593 + _4859;
    int _4863 = _4861 + 1;
    float _4865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4867 = ~int(_4843);
    int _4869 = _4867 + 1;
    float _4871 = _4789 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4873 = float(_4787);
    float _4875 = fma(_4391, _4705, _4803);
    float _4877 = float(_4855);
    float _4879 = fma(_4871, _2745, -0.5);
    int _4881 = _4863 ^ _4869;
    float _4883 = -_3473;
    float _4885 = fma(_4871, _4873, _4883);
    float _4887 = fma(_4851, _2757, -0.5);
    float _4889 = -_3775;
    float _4891 = fma(_4851, _4877, _4889);
    int _4893 = ~_4869;
    int _4895 = _4893 + _4881;
    int _4897 = _4895 + 1;
    float _4899 = _3519 * _4637;
    float _4901 = fma(_4333, _4845, _4849);
    float _4903 = fma(_3249, _4833, _4841);
    bool _4905 = !_4791;
    int _4907 = _4905 ? _4897 : (-1);
    float _4909 = -_4899;
    float _4911 = fma(_4909, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3519);
    float _4913 = _4901 + 0.5;
    float _4915 = _4865 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    float _4917 = float(_4907);
    float _4919 = fma(_4911, _4911, _4727);
    float _4921 = fma(_3561, _4783, _4815);
    float _4923 = in.m_73.x;
    float _4925 = in.m_73.y;
    float _4927 = in.m_73.z;
    float _4929 = fma(_4915, _2759, -0.5);
    float _4931 = -_3381;
    float _4933 = fma(_4915, _4917, _4931);
    float _4935 = fma(_3743, _4879, _4885);
    float _4937 = fma(_4355, _4887, _4891);
    bool _4939 = !_3917;
    int _4941 = _4939 ? 0 : 1;
    float _4943 = fma(_3251, _4929, _4933);
    float _4945 = _4935 + 0.5;
    bool _4947 = !_3921;
    int _4949 = _4947 ? 0 : 1;
    float _4951 = _4857 + 0.5;
    float _4953 = _4875 + 0.5;
    float _4955 = _4921 + 0.5;
    float _4957 = _4903 + 0.5;
    float _4959 = _4937 + 0.5;
    float _4961 = _4943 + 0.5;
    int _4963 = abs(_4941);
    out.m_75.x = _4953;
    out.m_75.y = _4913;
    out.m_75.z = _4955;
    out.m_75.w = _4945;
    int _4965 = abs(_4949);
    out.m_77.x = _4951;
    out.m_77.y = _4959;
    float _4967 = float(_4185);
    bool _4969 = !_3925;
    int _4971 = _4969 ? 0 : 1;
    out.m_79.x = _4957;
    out.m_79.y = _4961;
    float _4973 = float(_4963);
    float _4975 = as_type<float>(_4717);
    float _4977 = as_type<float>(_4743);
    if (_3559)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4979 = -_4679;
    float _4981 = fma(_4979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3137);
    float _4983 = -_4683;
    float _4985 = fma(_4983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3163);
    float _4987 = float(_2917);
    float _4989 = _4973 * _4967;
    float _4991 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4993 = _4981 + _4991;
    float _4995 = float(_4965);
    float _4997 = -_4899;
    float _4999 = fma(_4997, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3173);
    float _5001 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5003 = _4985 + _5001;
    float _5005 = _4993 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5007 = _4989 * (-2.0);
    float _5009 = _4995 * _4987;
    float _5011 = _1166 + _1447;
    float _5013 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5015 = _4999 + _5013;
    float _5017 = fma(_5003, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5005);
    float _5019 = _5011 + (-1.0);
    float _5021 = _5009 * (-2.0);
    float _5023 = fma(_5015, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5017);
    float _5025 = _1441 + (-0.5);
    float _5027 = fma(_5007, _4923, _4923);
    float _5029 = fma(_5019, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5031 = _1166 + (-0.5);
    float _5033 = fma(_5021, _4925, _4925);
    bool _5035 = _5023 >= 0.0;
    float _5037 = fma(_3503, _5007, _3503);
    float _5039 = fma(_5025, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5027);
    float _5041 = fma(_5029, _5021, _5029);
    float _5043 = fma(_5031, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5033);
    int _5045 = abs(_4971);
    float _5047 = fma(_5037, _4401, _5039);
    float _5049 = sqrt(_4919);
    float _5051 = fma(_5041, _4401, _5043);
    float _5053 = float(_5045);
    float _5055 = _5047 * 0.15915493667125701904296875;
    float _5057 = float(_3129);
    float _5059 = _5051 * 0.15915493667125701904296875;
    float _5061 = _5033;
    float _5063 = _5003;
    float _5065 = _4993;
    if (_5035)
    {
        _5061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5067 = _5061;
    float _5069 = _5055 * 6.283185482025146484375;
    float _5071 = sin(_5069);
    float _5073 = _5053 * _5057;
    float _5075 = _1441 + _1447;
    int _5077 = as_type<int>(_5067);
    if (_5035)
    {
        float _5079 = _5067 * 5.0;
        _5077 = as_type<int>(_5079);
    }
    int _5081 = _5077;
    if (_5035)
    {
        out.m_49.x = 0.0;
    }
    float _5083 = _5075 + (-1.0);
    float _5085 = _5073 * (-2.0);
    float _5087 = _5055 * 6.283185482025146484375;
    float _5089 = cos(_5087);
    if (_5035)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _13889 = as_type<float>(_5081);
        out.gl_Position.z = _13889;
    }
    float _5091 = _5059 * 6.283185482025146484375;
    float _5093 = sin(_5091);
    if (_5035)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5095 = -_3137;
    float _5097 = _5095 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5099 = -_3163;
    float _5101 = _5099 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5103 = fma(_5083, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5105 = fma(_5085, _4927, _4927);
    float _5107 = _5097 * _5097;
    float _5109 = _1447 + (-0.5);
    float _5111 = -_3173;
    float _5113 = _5111 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5115 = fma(_5103, _5085, _5103);
    float _5117 = fma(_5101, _5101, _5107);
    float _5119 = fma(_5109, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5105);
    float _5121 = _5059 * 6.283185482025146484375;
    float _5123 = cos(_5121);
    float _5125 = _4637 * _5049;
    float _5127 = fma(_5113, _5113, _5117);
    float _5129 = fma(_5115, _4401, _5119);
    float _5131 = _5071 * _5093;
    float _5133 = _538 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5135 = _5089 * _5093;
    float _5137 = _5129 * 0.15915493667125701904296875;
    float _5139 = rsqrt(_5127);
    float _5141 = _5137 * 6.283185482025146484375;
    float _5143 = sin(_5141);
    float _5145 = _5089 * _5123;
    float _5147 = _5071 * _5123;
    float _5149 = _5101 * _5139;
    float _5151 = _5113 * _5139;
    float _5153 = in.m_81.x;
    float _5155 = in.m_81.y;
    float _5157 = in.m_81.z;
    float _5159 = _5097 * _5139;
    float _5161 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5163 = _5149 * _5161;
    float _5165 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5167 = _5151 * _5165;
    float _5169 = _5137 * 6.283185482025146484375;
    float _5171 = cos(_5169);
    float _5173 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5175 = _5159 * _5173;
    float _5177 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5179 = -_5163;
    float _5181 = fma(_5151, _5177, _5179);
    float _5183 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5185 = -_5167;
    float _5187 = fma(_5159, _5183, _5185);
    float _5189 = fma(_5143, _5145, _5131);
    float _5191 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5193 = -_5175;
    float _5195 = fma(_5149, _5191, _5193);
    float _5197 = _5181 * _5181;
    float _5199 = fma(_5143, _5131, _5145);
    float _5201 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5203 = fma(_5187, _5187, _5197);
    float _5205 = _536 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5207 = fma(_5195, _5195, _5203);
    float _5209 = _5125 * _5205;
    float _5211 = _5089 * _5171;
    float _5213 = _5071 * _5171;
    float _5215 = rsqrt(_5207);
    float _5217 = _5125 * _5133;
    float _5219 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5155);
    float _5221 = _5123 * _5171;
    float _5223 = _5093 * _5171;
    float _5225 = _5219 * _5209;
    float _5227 = _5125 * _5201;
    float _5229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5153);
    float _5231 = -_5135;
    float _5233 = fma(_5143, _5147, _5231);
    float _5235 = -_5147;
    float _5237 = fma(_5143, _5135, _5235);
    float _5239 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5157);
    float _5241 = _5229 * _5227;
    float _5243 = _5211 * _5225;
    float _5245 = -_5225;
    float _5247 = _5143 * _5245;
    float _5249 = _5213 * _5225;
    float _5251 = _5187 * _5215;
    float _5253 = _5239 * _5217;
    float _5255 = _5181 * _5215;
    float _5257 = fma(_5189, _5241, _5243);
    float _5259 = _5159 * _5251;
    float _5261 = _5195 * _5215;
    float _5263 = fma(_5221, _5241, _5247);
    float _5265 = fma(_5237, _5253, _5257);
    float _5267 = _5151 * _5255;
    float _5269 = -_5259;
    float _5271 = fma(_5149, _5255, _5269);
    float _5273 = fma(_5233, _5241, _5249);
    float _5275 = fma(_5223, _5253, _5263);
    float _5277 = -_5267;
    float _5279 = fma(_5159, _5261, _5277);
    float _5281 = _5271 * _5265;
    float _5283 = fma(_5199, _5253, _5273);
    float _5285 = _5149 * _5261;
    float _5287 = _5279 * _5265;
    float _5289 = fma(_5261, _5275, _5281);
    float _5291 = -_5285;
    float _5293 = fma(_5151, _5251, _5291);
    float _5295 = fma(_5251, _5275, _5287);
    float _5297 = fma(_5151, _5283, _5289);
    float _5299 = fma(_5149, _5283, _5295);
    float _5301 = _3173 + _5297;
    float _5303 = _3163 + _5299;
    float _5305 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5307 = _5301 + _5305;
    float _5309 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5311 = _5303 + _5309;
    float _5313 = _5307 * _5307;
    float _5315 = fma(_5311, _5311, _5313);
    float _5317 = _5293 * _5265;
    float _5319 = sqrt(_5315);
    float _5321 = fma(_5255, _5275, _5317);
    float _5323 = fma(_5159, _5283, _5321);
    float _5325 = _3137 + _5323;
    bool _5327 = _5319 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5329 = _5323;
    float _5331 = _5283;
    float _5333 = _5321;
    if (!_5327)
    {
        _5329 = _5303;
    }
    float _5335 = _5329;
    float _5337 = _5335;
    if (!_5327)
    {
        _5331 = _5301;
    }
    float _5339 = _5331;
    float _5341 = _5339;
    if (!_5327)
    {
        _5333 = _5325;
    }
    float _5343 = _5333;
    bool _5345 = !_5327;
    float _5347 = _5343;
    if (!_5345)
    {
        float _5349 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5351 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5353 = _5319 + _5351;
        float _5355 = _5325 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5357 = _5353 * _5349;
        float _5359 = rsqrt(_5315);
        float _5361 = _5357 * 0.15915493667125701904296875;
        float _5363 = _5361 * 6.283185482025146484375;
        float _5365 = sin(_5363);
        float _5367 = _5361 * 6.283185482025146484375;
        float _5369 = cos(_5367);
        float _5371 = fma(_5365, _5355, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5373 = _5359 * _5371;
        float _5375 = _5369 + (-1.0);
        float _5377 = fma(_5311, _5373, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5379 = fma(_5307, _5373, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5381 = _5375 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5383 = fma(_5325, _5369, _5381);
        _5347 = _5383;
        _5337 = _5377;
        _5341 = _5379;
    }
    float _5385 = _5347;
    float _5387 = _5337;
    float _5389 = _5341;
    float _5391 = -_3137;
    float _5393 = _5391 + _5385;
    float _5395 = -_3163;
    float _5397 = _5395 + _5387;
    float _5399 = -_3173;
    float _5401 = _5399 + _5389;
    float _5403 = _5393 * _5393;
    bool _5405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5407 = isnan(0.5);
    bool _5409 = _5405 || _5407;
    bool _5411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5413 = _5409 || _5411;
    float _5415 = fma(_5397, _5397, _5403);
    float _5417 = fma(_5401, _5401, _5415);
    float _5419 = sqrt(_5417);
    bool _5421 = _5419 > 0.0;
    bool _5423 = !_5421;
    float _5425 = _5387;
    float _5427 = _5385;
    float _5429 = _5389;
    if (!_5423)
    {
        float _5431 = _200 * _200;
        float _5433 = fma(_198, _198, _5431);
        float _5435 = fma(_202, _202, _5433);
        float _5437 = rsqrt(_5417);
        float _5439 = sqrt(_5435);
        float _5441 = _5393 * _5437;
        float _5443 = _5401 * _5437;
        bool _5445 = _5439 > 0.0;
        float _5447 = _5397 * _5437;
        bool _5449 = !_5445;
        if (!_5449)
        {
            float _5451 = rsqrt(_5435);
            float _5453 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5455 = _200 * _5451;
            float _5457 = _198 * _5451;
            float _5459 = _5441 * _5455;
            float _5461 = _202 * _5451;
            float _5463 = fma(_5447, _5457, _5459);
            float _5465 = _5453 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5467 = fma(_5443, _5461, _5463);
            float _5469 = _5467 * _5465;
            float _5471 = fma(_198, _5469, _5387);
            float _5473 = fma(_200, _5469, _5385);
            float _5475 = fma(_202, _5469, _5389);
            _5425 = _5471;
            _5427 = _5473;
            _5429 = _5475;
        }
    }
    float _5477 = _5425;
    float _5479 = _5427;
    float _5481 = _5429;
    float _5483 = -_4683;
    float _5485 = fma(_5483, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5477);
    float _5487 = -_4679;
    float _5489 = fma(_5487, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5479);
    float _5491 = -_4899;
    float _5493 = fma(_5491, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5481);
    float _5495 = _5489;
    float _5497 = _5485;
    float _5499 = _5493;
    if (!_5413)
    {
        float _5501 = _4993 * _4993;
        float _5503 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5505 = -_3173;
        float _5507 = _5505 + _5481;
        float _5509 = -_3163;
        float _5511 = _5509 + _5477;
        float _5513 = fma(_5003, _5003, _5501);
        float _5515 = -_3137;
        float _5517 = _5515 + _5479;
        float _5519 = fma(_5015, _5015, _5513);
        float _5521 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5523 = sqrt(_5519);
        float _5525 = 1.0 / _5125;
        float _5527 = _5521 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5529 = precise::min(_5523, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5531 = _5529 * _5503;
        float _5533 = _5531 * _5525;
        float _5535 = _5527 * _5533;
        float _5537 = _5507 * _5533;
        float _5539 = fma(_5511, _5535, _4985);
        float _5541 = fma(_5517, _5535, _4981);
        float _5543 = fma(_5527, _5537, _4999);
        _5495 = _5541;
        _5497 = _5539;
        _5499 = _5543;
        _5063 = _5523;
        _5065 = _5501;
    }
    float _5545 = _5495;
    float _5547 = _5497;
    float _5549 = _5499;
    float _5551 = _5063;
    float _5553 = _5065;
    float _5555 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5557 = _5545 + _5555;
    float _5559 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5561 = _5547 + _5559;
    float _5563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5565 = _5549 + _5563;
    float _5567 = _5557 * _5557;
    float _5569 = fma(_5561, _5561, _5567);
    float _5571 = fma(_5565, _5565, _5569);
    float _5573 = rsqrt(_5571);
    float _5575 = sqrt(_5571);
    float _5577 = _5573 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5579 = _5561 * _5577;
    float _5581 = _5565 * _5577;
    float _5583 = _5579 * _5579;
    float _5585 = _5581 * _5581;
    float _5587 = _5583 + _5585;
    float _5589 = sqrt(_5587);
    bool _5591 = _5589 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5593 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5595 = _5589 + _5593;
    float _5597 = _5565;
    float _5599 = _5553;
    float _5601 = _5595;
    float _5603 = _5551;
    float _5605 = _5577;
    if (_5591)
    {
        float _5607 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5597 = _5607;
    }
    float _5609 = _5597;
    if (_5591)
    {
        float _5611 = rsqrt(_5587);
        _5599 = _5611;
    }
    float _5613 = _5599;
    if (_5591)
    {
        float _5615 = _5595 * _5609;
        _5601 = _5615;
    }
    float _5617 = _5601;
    if (_5591)
    {
        float _5619 = _5617 * 0.15915493667125701904296875;
        _5603 = _5619;
    }
    float _5621 = _5603;
    float _5623 = _5569;
    if (_5591)
    {
        float _5625 = _5621 * 6.283185482025146484375;
        float _5627 = sin(_5625);
        _5623 = _5627;
    }
    float _5629 = _5623;
    float _5631 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5633 = precise::max(0.0, _5631);
    float _5635 = _5573;
    float _5637 = _5633;
    float _5639 = _5631;
    if (_5591)
    {
        float _5641 = _5621 * 6.283185482025146484375;
        float _5643 = cos(_5641);
        _5635 = _5643;
    }
    float _5645 = _5635;
    float _5647 = -_5577;
    float _5649 = -_5633;
    float _5651 = fma(_5557, _5647, _5649);
    float _5653 = _5651;
    if (_5591)
    {
        float _5655 = _5651 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5637 = _5655;
    }
    float _5657 = _5637;
    float _5659 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _5661 = _5629;
    float _5663 = _5657;
    if (_5591)
    {
        float _5665 = fma(_5629, _5657, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5661 = _5665;
    }
    float _5667 = _5661;
    float _5669 = _5667;
    if (!_5591)
    {
        _5663 = _5579;
    }
    float _5671 = _5663;
    float _5673 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[2].x, _5659);
    float _5675 = _5671;
    float _5677 = _5645;
    if (_5591)
    {
        float _5679 = _5645 + (-1.0);
        _5639 = _5679;
    }
    float _5681 = _5639;
    float _5683 = _5681;
    if (_5591)
    {
        float _5685 = _5613 * _5667;
        _5605 = _5685;
    }
    float _5687 = _5605;
    if (!_5591)
    {
        _5669 = _5585;
    }
    float _5689 = _5669;
    float _5691 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[2].z, _5673);
    float _5693 = _5689;
    if (_5591)
    {
        float _5695 = _5681 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5683 = _5695;
    }
    float _5697 = _5683;
    float _5699 = _5697;
    if (_5591)
    {
        float _5701 = _5579 * _5687;
        _5675 = _5701;
    }
    float _5703 = _5675;
    float _5705 = _5691 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    if (_5591)
    {
        float _5707 = fma(_5651, _5645, _5697);
        _5653 = _5707;
    }
    float _5709 = _5653;
    if (!_5591)
    {
        _5699 = _5581;
    }
    float _5711 = _5699;
    float _5713 = _5711;
    if (_5591)
    {
        float _5715 = _5581 * _5687;
        _5713 = _5715;
    }
    float _5717 = _5713;
    if (!_5591)
    {
        _5677 = _5583;
    }
    float _5719 = _5677;
    float _5721 = _5719;
    if (_5591)
    {
        float _5723 = _5703 * _5703;
        _5721 = _5723;
    }
    float _5725 = _5721;
    if (_5591)
    {
        float _5727 = _5717 * _5717;
        _5693 = _5727;
    }
    float _5729 = _5693;
    float _5731 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5733 = fma(_5709, _5709, _5725);
    float _5735 = fma(_4985, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5737 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[1].x, _5731);
    float _5739 = _5733 + _5729;
    float _5741 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _5743 = fma(_5575, (*spvDescriptorSet0.vp_c15)._m0[23].w, _5741);
    float _5745 = precise::clamp(_5743, 0.0, 1.0);
    float _5747 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[1].z, _5737);
    float _5749 = rsqrt(_5739);
    float _5751 = -_5745;
    float _5753 = _5751 + 1.0;
    float _5755 = _5705 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _5757 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5759 = _5747 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _5761 = fma(_4999, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _5763 = -_5755;
    float _5765 = fma(_5763, _5757, 1.0);
    float _5767 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _5769 = _5545 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5771 = abs(_5753);
    float _5773 = log2(_5771);
    float _5775 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[0].x, _5767);
    float _5777 = fma(_5547, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5769);
    float _5779 = _5749 * _5703;
    float _5781 = _5749 * _5709;
    float _5783 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[0].z, _5775);
    float _5785 = _5749 * _5717;
    float _5787 = _5779 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _5789 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _5791 = _5783 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _5793 = floor(_5735);
    float _5795 = -_5787;
    float _5797 = fma(_5781, (*spvDescriptorSet0.vp_c15)._m0[21].y, _5795);
    float _5799 = fma(_5549, (*spvDescriptorSet0.vp_c8)._m0[3].z, _5777);
    float _5801 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _5803 = -_5785;
    float _5805 = fma(_5803, (*spvDescriptorSet0.vp_c15)._m0[21].z, _5797);
    float _5807 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[7].x, _5789);
    float _5809 = _5799 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _5811 = floor(_5761);
    float _5813 = fma(_5805, -0.5, 0.5);
    float _5815 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[7].z, _5807);
    float _5817 = fma(_5805, 0.5, 0.5);
    float _5819 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[7].w, _5815);
    float _5821 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _5823 = log2(_5765);
    float _5825 = -_5793;
    float _5827 = _5735 + _5825;
    float _5829 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[4].x, _5821);
    float _5831 = _5781 + 1.0;
    float _5833 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[4].z, _5829);
    float _5835 = 1.0 / _5819;
    float _5837 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _5839 = fma(_5817, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _5841 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[4].w, _5833);
    float _5843 = fma(_5817, _5839, -0.212114393711090087890625);
    float _5845 = sqrt(_5813);
    float _5847 = _5823 * 0.693147182464599609375;
    float _5849 = fma(_5817, _5843, 1.570728778839111328125);
    float _5851 = _5847 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5853 = exp2(_5801);
    float _5855 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[5].x, _5837);
    float _5857 = _5841 * _5835;
    float _5859 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[5].z, _5855);
    float _5861 = _5845 * 0.636619746685028076171875;
    float _5863 = -_5811;
    float _5865 = _5761 + _5863;
    float _5867 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[5].w, _5859);
    float _5869 = -_5849;
    float _5871 = fma(_5861, _5869, 1.0);
    float2 _15136 = float2(_5827, _5865);
    float _5873 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15136, float2(0.0), isnan(_15136)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15136, float2(0.0), isnan(_15136)), level(0.0)).x;
    float _5875 = _5867 * _5835;
    float _5877 = fma(_5857, 0.5, 0.5);
    float _5879 = -_5781;
    float _5881 = fma(_5853, _5831, _5879);
    float _5883 = fma(_5875, -0.5, 0.5);
    float _5885 = fma(_5881, 0.5, 0.5);
    float3 _15162 = float3(_5877, _5883, _5851);
    float _5887 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15162, float3(0.0), isnan(_15162)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15162, float3(0.0), isnan(_15162)), level(0.0)).x;
    float3 _15173 = float3(_5877, _5883, _5851);
    float4 _5890 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15173, float3(0.0), isnan(_15173)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15173, float3(0.0), isnan(_15173)), level(0.0)).xyzw;
    float _5892 = _5890.x;
    float _5894 = _5890.y;
    float _5896 = _5890.z;
    float _5898 = _5890.w;
    float2 _15189 = float2(_5871, _5885);
    float3 _5902 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15189, float2(0.0), isnan(_15189)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15189, float2(0.0), isnan(_15189)), level(0.0)).xyz;
    float _5904 = _5902.x;
    float _5906 = _5902.y;
    float _5908 = _5902.z;
    float _5910 = _4981 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5912 = _4981 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _5914 = _5155 != 0.0;
    bool _5916 = isnan(_5155);
    bool _5918 = _5914 || _5916;
    bool _5920 = isnan(0.0);
    bool _5922 = _5918 || _5920;
    float _5924 = _5237 * _5279;
    float _5926 = fma(_4985, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5910);
    float _5928 = fma(_4985, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5912);
    bool _5930 = _5153 == 0.0;
    bool _5932 = !_5922;
    bool _5934 = _5930 && _5932;
    float _5936 = _5773 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _5938 = fma(_4999, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5926);
    float _5940 = fma(_4999, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5928);
    float _5942 = _5759 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5944 = _5938 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5946 = _5940 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _5948 = _5157 == 0.0;
    bool _5950 = _5948 && _5934;
    float _5952 = exp2(_5936);
    float _5954 = _5946 + _5944;
    float _5956 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5942);
    float _5958 = 1.0 / _5944;
    float _5960 = -_5952;
    float _5962 = _5960 + 1.0;
    float _5964 = _5954 * _5958;
    float _5966 = _5964 * 0.5;
    float _5968 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5970 = fma(_5966, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5968);
    float _5972 = in.m_83.x;
    float _5974 = in.m_83.y;
    float _5976 = in.m_83.z;
    float _5978 = 1.0 / _5970;
    float _5980 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5982 = _5978 * _5980;
    float _5984 = abs(_5982);
    float _5986 = log2(_5984);
    float _5988 = in.m_85.x;
    float _5990 = in.m_85.y;
    float _5992 = in.m_85.z;
    float _5994 = in.m_85.w;
    float _5996 = _5978;
    float _5998 = _5972;
    float _6000 = _5819;
    float _6002 = _5867;
    if (_5950)
    {
        _4975 = _5972;
    }
    float _6004 = _4975;
    float _6006 = _6004;
    if (_5950)
    {
        _4977 = _5974;
    }
    float _6008 = _4977;
    float _6010 = _6008;
    if (_5950)
    {
        _5996 = _6004;
    }
    float _6012 = _5996;
    float _6014 = _6012;
    if (!_5950)
    {
        _6006 = _5972;
    }
    float _6016 = _6006;
    if (_5950)
    {
        _5998 = _5976;
    }
    float _6018 = _5998;
    float _6020 = _6018;
    if (!_5950)
    {
        float _6022 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5976);
        _6020 = _6022;
    }
    float _6024 = _6020;
    if (!_5950)
    {
        float _6026 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6016);
        _6014 = _6026;
    }
    float _6028 = _6014;
    bool _6030 = _5982 <= 8000.0;
    bool _6032 = isnan(_5982);
    bool _6034 = _6030 || _6032;
    bool _6036 = isnan(8000.0);
    bool _6038 = _6034 || _6036;
    float _6040 = float(_6038);
    float _6042 = _5986 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6044 = _5986;
    if (_5950)
    {
        _6044 = _6008;
    }
    float _6046 = _6044;
    float _6048 = _6046;
    if (!_5950)
    {
        _6010 = _5974;
    }
    float _6050 = _6010;
    float _6052 = exp2(_6042);
    if (!_5950)
    {
        float _6054 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6050);
        _6048 = _6054;
    }
    float _6056 = _6048;
    float _6058 = _5990 * _5976;
    float _6060 = _5988 * _6050;
    float _6062 = _5992 * _6016;
    bool _6064 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6066 = isnan(_5575);
    bool _6068 = _6064 || _6066;
    bool _6070 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6072 = _6068 || _6070;
    float _6074 = -_6062;
    float _6076 = fma(_5988, _5976, _6074);
    float _6078 = _5189 * _5279;
    float _6080 = fma(_6052, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6082 = precise::clamp(_6080, 0.0, 1.0);
    float _6084 = -_6058;
    float _6086 = fma(_5992, _6050, _6084);
    float _6088 = -_6060;
    float _6090 = fma(_5990, _6016, _6088);
    float _6092 = _5211 * _5271;
    float _6094 = fma(_6082, -2.0, 3.0);
    float _6096 = _6082 * _6082;
    float _6098 = _6086 * _5994;
    float _6100 = _6090 * _5994;
    float _6102 = _5189 * _5293;
    float _6104 = _6096 * _6094;
    float _6106 = _5189 * _5271;
    float _6108 = _5211 * _5279;
    float _6110 = _5211 * _5293;
    float _6112 = _5237 * _5293;
    float _6114 = _6076 * _5994;
    float _6116 = -_5143;
    float _6118 = fma(_6116, _5251, _6108);
    float _6120 = fma(_5221, _5251, _6078);
    float _6122 = fma(_5221, _5255, _6102);
    float _6124 = fma(_5221, _5261, _6106);
    float _6126 = -_5143;
    float _6128 = fma(_6126, _5255, _6110);
    float _6130 = -_5143;
    float _6132 = fma(_6130, _5261, _6092);
    float _6134 = -_6104;
    float _6136 = _6134 + 1.0;
    float _6138 = fma(_5223, _5255, _6112);
    float _6140 = fma(_5213, _5149, _6118);
    float _6142 = _5237 * _5271;
    float _6144 = fma(_5213, _5159, _6128);
    float _6146 = fma(_5213, _5151, _6132);
    float _6148 = fma(_5223, _5251, _5924);
    float _6150 = fma(_6136, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6104);
    float _6152 = fma(_5233, _5159, _6122);
    float _6154 = fma(_5199, _5159, _6138);
    float _6156 = fma(_5233, _5149, _6120);
    float _6158 = _6140 * _5990;
    float _6160 = fma(_5223, _5261, _6142);
    float _6162 = fma(_5199, _5149, _6148);
    float _6164 = fma(_5233, _5151, _6124);
    float _6166 = _6144 * _5990;
    float _6168 = _6146 * _5990;
    float _6170 = fma(_6156, _5988, _6158);
    float _6172 = _6140 * _6056;
    float _6174 = fma(_6152, _5988, _6166);
    float _6176 = fma(_6164, _5988, _6168);
    float _6178 = fma(_6162, _5992, _6170);
    float _6180 = fma(_5199, _5151, _6160);
    float _6182 = _6114 * _6140;
    float _6184 = in.m_87.x;
    float _6186 = _6146 * _6056;
    float _6188 = _6114 * _6146;
    float _6190 = fma(_6156, _6028, _6172);
    float _6192 = fma(_5705, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5956);
    float _6194 = _6144 * _6056;
    float _6196 = _6114 * _6144;
    float _6198 = fma(_6098, _6156, _6182);
    float _6200 = fma(_5809, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6192);
    float _6202 = _6040 * _6150;
    float _6204 = fma(_6098, _6152, _6196);
    float _6206 = fma(_6098, _6164, _6188);
    float _6208 = fma(_6152, _6028, _6194);
    float _6210 = fma(_6100, _6162, _6198);
    float _6212 = fma(_6164, _6028, _6186);
    float _6214 = _6200 + _5819;
    float _6216 = _6202 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6218 = fma(_6154, _5992, _6174);
    float _6220 = fma(_6100, _6154, _6204);
    float _6222 = fma(_6180, _5992, _6176);
    float _6224 = fma(_6162, _6024, _6190);
    float _6226 = fma(_6154, _6024, _6208);
    float _6228 = fma(_6180, _6024, _6212);
    float _6230 = _6214 * 0.5;
    float _6232 = _5962 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6234 = fma(_6100, _6180, _6206);
    out.m_89.x = _6178;
    out.m_89.y = _6218;
    out.m_89.z = _6222;
    out.m_91.x = _6210;
    out.m_91.y = _6220;
    out.m_91.z = _6234;
    out.m_93.z = _6230;
    out.m_93.w = _5819;
    out.m_95.x = _6224;
    out.m_95.y = _6226;
    out.m_95.z = _6228;
    float _6236 = -_6232;
    float _6238 = _6236 + 1.0;
    out.gl_Position.x = _5841;
    out.gl_Position.y = _5867;
    out.gl_Position.z = _6200;
    out.gl_Position.w = _5819;
    float _6240 = _6234;
    float _6242 = _5841;
    float _6244 = _6238;
    if (!_6072)
    {
        _6240 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6246 = _6240;
    float _6248 = _6246;
    float _6250 = _6246;
    if (!_6072)
    {
        _6000 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6252 = _6000;
    float _6254 = _6252;
    float _6256 = _6252;
    if (!_6072)
    {
        _6242 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6258 = _6242;
    float _6260 = _6258;
    float _6262 = _6258;
    if (!_6072)
    {
        _6002 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6264 = _6002;
    float _6266 = -_5873;
    float _6268 = _6266 + 1.0;
    float _6270 = _6268 * _6216;
    float _6272 = precise::clamp(_6270, 0.0, 1.0);
    float _6274 = -_6272;
    float _6276 = fma(_6274, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6278 = _6232 * _5887;
    float _6280 = _5898 * _6238;
    float _6282 = _6264;
    float _6284 = _6264;
    if (!_6072)
    {
        _6244 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6286 = _6244;
    float _6288 = _6276 * _6184;
    float _6290 = _5898 * _6278;
    float _6292 = _5908 * _6278;
    float _6294 = _6288 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6296 = fma(_5904, _6290, _5892);
    float _6298 = fma(_5906, _6290, _5894);
    float _6300 = fma(_5898, _6292, _5896);
    float _6302 = _6290;
    float _6304 = _6286;
    float _6306 = _6286;
    if (!_6072)
    {
        _6302 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6308 = _6302;
    out.m_97.x = _6294;
    out.m_99.x = _6296;
    out.m_99.y = _6298;
    out.m_99.z = _6300;
    out.m_99.w = _6280;
    bool _6310 = !_6072;
    float _6312 = _6308;
    float _6314 = _6308;
    if (!_6310)
    {
        bool _6316 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6318 = isnan(_5575);
        bool _6320 = _6316 || _6318;
        bool _6322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6324 = _6320 || _6322;
        if (!_6324)
        {
            float _6326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6328 = _5575 + _6326;
            float _6330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6330;
            float _6334 = 1.0 / _6332;
            float _6336 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6338 = _6336 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6340 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6342 = _6340 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6344 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6346 = _6344 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6350 = _6348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6354 = _6352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6356 = _6328 * _6334;
            float _6358 = precise::clamp(_6356, 0.0, 1.0);
            float _6360 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6362 = _6360 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6364 = fma(_6358, _6342, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6366 = fma(_6358, _6362, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6368 = fma(_6358, _6338, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6370 = fma(_6358, _6346, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6372 = fma(_6358, _6350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6374 = fma(_6358, _6354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6314 = _6368;
            _6262 = _6372;
            _6250 = _6366;
            _6256 = _6370;
            _6306 = _6364;
            _6284 = _6374;
            _6376 = true;
        }
        else
        {
            bool _6378 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6380 = isnan(_5575);
            bool _6382 = _6378 || _6380;
            bool _6384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6386 = _6382 || _6384;
            if (!_6386)
            {
                _6254 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6388 = _6254;
            _6256 = _6388;
            if (!_6386)
            {
                _6260 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6390 = _6260;
            _6262 = _6390;
            if (!_6386)
            {
                _6282 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6392 = _6282;
            _6284 = _6392;
            if (!_6386)
            {
                _6248 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6394 = _6248;
            _6250 = _6394;
            if (!_6386)
            {
                _6312 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6396 = _6312;
            _6314 = _6396;
            if (!_6386)
            {
                _6304 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6398 = _6304;
            bool _6400 = !_6386;
            _6306 = _6398;
            if (!_6400)
            {
                bool _6402 = _5575 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6404 = isnan(_5575);
                bool _6406 = _6402 || _6404;
                bool _6408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6410 = _6406 || _6408;
                if (!_6410)
                {
                    float _6412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6414 = _5575 + _6412;
                    float _6416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6416;
                    float _6420 = 1.0 / _6418;
                    float _6422 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6424 = _6422 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6426 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6428 = _6426 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6430 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6432 = _6430 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6436 = _6434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6440 = _6438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6442 = _6414 * _6420;
                    float _6444 = precise::clamp(_6442, 0.0, 1.0);
                    float _6446 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6448 = _6446 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6450 = fma(_6444, _6428, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6452 = fma(_6444, _6448, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6454 = fma(_6444, _6424, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6456 = fma(_6444, _6432, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6458 = fma(_6444, _6436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6460 = fma(_6444, _6440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6314 = _6454;
                    _6262 = _6458;
                    _6250 = _6452;
                    _6256 = _6456;
                    _6306 = _6450;
                    _6284 = _6460;
                    _6376 = true;
                }
                else
                {
                    _6314 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6262 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6250 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6256 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6306 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6284 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6376 = false;
    float _6462 = _6314;
    float _6464 = _6262;
    float _6466 = _6250;
    float _6468 = _6256;
    float _6470 = _6306;
    float _6472 = _6284;
    float _6474 = fma(_6226, -0.5, 0.5);
    float _6476 = precise::clamp(_6474, 0.0, 1.0);
    float _6478 = -_6462;
    float _6480 = _6464 + _6478;
    float _6482 = -_6466;
    float _6484 = _6468 + _6482;
    float _6486 = -_6470;
    float _6488 = _6472 + _6486;
    bool _6490 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6492 = fma(_6476, _6480, _6462);
    float _6494 = fma(_6476, _6484, _6466);
    float _6496 = fma(_6476, _6488, _6470);
    float _6498 = _6492 * 0.586610972881317138671875;
    out.m_101.x = 0.0;
    float _6500 = fma(_6494, 0.298911988735198974609375, _6498);
    float _6502 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6504 = fma(_6496, 0.114477999508380889892578125, _6500);
    out.m_49.x = _6502;
    float _6506 = -_6504;
    float _6508 = _6494 + _6506;
    float _6510 = -_6504;
    float _6512 = _6492 + _6510;
    float _6514 = -_6504;
    float _6516 = _6496 + _6514;
    float _6518 = fma(_6508, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    float _6520 = fma(_6512, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    float _6522 = fma(_6516, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6504);
    out.m_103.x = _6518;
    out.m_103.y = _6520;
    out.m_103.z = _6522;
    if (!_6490)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _6524 = -_5545;
    float _6526 = _6524 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _6528 = -_5547;
    float _6530 = _6528 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _6532 = -_5549;
    float _6534 = _6532 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _6536 = _6526 * _6526;
    float _6538 = fma(_6530, _6530, _6536);
    float _6540 = fma(_6534, _6534, _6538);
    float _6542 = sqrt(_6540);
    float _6544 = rsqrt(_6540);
    float _6546 = -_6542;
    float _6548 = _6546 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6550 = _6548 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _6552 = precise::clamp(_6550, 0.0, 1.0);
    float _6554 = _6530 * _6544;
    float _6556 = _6526 * _6544;
    float _6558 = abs(_6552);
    float _6560 = log2(_6558);
    float _6562 = _6534 * _6544;
    float _6564 = _6554 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _6566 = _6226 * _6556;
    float _6568 = -_6556;
    float _6570 = -_6564;
    float _6572 = fma(_6568, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6570);
    float _6574 = fma(_6224, _6554, _6566);
    float _6576 = -_6562;
    float _6578 = fma(_6576, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6572);
    float _6580 = fma(_6228, _6562, _6574);
    float _6582 = precise::clamp(_6580, 0.0, 1.0);
    float _6584 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _6586 = _6578 + _6584;
    float _6588 = _6560 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _6590 = _6586 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _6592 = precise::clamp(_6590, 0.0, 1.0);
    float _6594 = exp2(_6588);
    float _6596 = _6594 * _6592;
    float _6598 = _6582 * _6596;
    float _6600 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _6602 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _6604 = _6598 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_101.x = _6600;
    out.m_101.y = _6602;
    out.m_101.z = _6604;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

