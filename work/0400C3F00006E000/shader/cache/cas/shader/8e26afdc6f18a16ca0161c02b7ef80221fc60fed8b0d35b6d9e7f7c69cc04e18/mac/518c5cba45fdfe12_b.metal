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
    float4 m_69 [[user(locn2)]];
    float4 m_79 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_71 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_91 [[user(locn13)]];
    float4 m_101 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_99 [[user(locn16)]];
    float4 m_103 [[user(locn17)]];
    float4 m_63 [[user(locn18)]];
    float4 m_65 [[user(locn19)]];
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
    float4 m_85 [[attribute(5)]];
    float4 m_81 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
    float4 m_83 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6734 = false;
    bool _1464 = false;
    bool _1136 = false;
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
        float _7033 = as_type<float>(_138);
        out.gl_Position.z = _7033;
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
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_49.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7102 = as_type<float>(_176);
        out.gl_Position.z = _7102;
    }
    if (_170)
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
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = _354 * _350;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = _356 * _350;
    float _372 = -_326;
    float _374 = _372 + 1.0;
    float _376 = _352 * _350;
    float _378 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _380 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _364);
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_330, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _390 = fma(_362, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_368, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
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
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _454 + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _526 = _496 * _518;
    float _528 = -_496;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _484;
    float _534 = _500 * _514;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _540 = _422 * _462;
    float _542 = _424 * _464;
    float _544 = fma(_534, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = _420 * _460;
    float _548 = _538 * _532;
    float _550 = -_512;
    float _552 = _550 + 1.0;
    float _554 = _544 * _526;
    float _556 = fma(_548, _522, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = _480 * _552;
    float _560 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _562 = fma(_556, _558, _560);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _568 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[117].x, _562);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _578 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _572;
    out.m_59.y = _574;
    out.m_59.z = _578;
    out.m_59.w = _576;
    bool _580 = !_524;
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
    float _674 = fma(_670, _660, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _676 = _666 * _654;
    float _678 = _672 * _654;
    float _680 = _674 * _654;
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].x, _676);
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
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _726 = _722 + _724;
    bool _728 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _730 = isnan(_722);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _744 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _746 = isnan(_722);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _756;
    float _760 = _688 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    bool _766 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _768 = 1.0 / _742;
    float _770 = _754 * _764;
    float _772 = -_754;
    float _774 = _772 + 1.0;
    float _776 = _758 * _768;
    float _778 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _780 = fma(_776, _726, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _782 = _780 * _770;
    float _784 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _788 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[132].x, _786);
    float _794 = _778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _788;
    out.m_61.y = _790;
    out.m_61.z = _794;
    out.m_61.w = _796;
    bool _798 = !_766;
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
    bool _962 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _964 = isnan(_826);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = 1.0 / _938;
    float _976 = _950 * _956;
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = 1.0 / _960;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _988 = _972 * _980;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _994 = _986 * _894;
    float _996 = _914 * _988;
    float _998 = -_972;
    float _1000 = _998 + 1.0;
    float _1002 = 1.0 / _992;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _826 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1012;
    float _1016 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _996);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1022 = fma(_994, _1010, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = _1014 * _974;
    float _1026 = 1.0 / _1006;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1030 = _826 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1036 = fma(_1022, _976, _1016);
    float _1038 = fma(_1024, _1030, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1042 = _826 + _1040;
    float _1044 = _1034 * _982;
    float _1046 = 1.0 / _1020;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1048;
    float _1052 = fma(_1038, _952, _1036);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1058 = _1050 * _1002;
    float _1060 = fma(_1044, _1042, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1064 = _826 + _1062;
    float _1066 = _1056 * _1026;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1068;
    bool _1072 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1074 = isnan(_826);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1086 = _826 + _1084;
    float _1088 = fma(_1058, _1064, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1090 = fma(_1060, _930, _1052);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1094 = _826 + _1092;
    float _1096 = fma(_1066, _1086, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1098 = _1070 * _1046;
    float _1100 = -_1082;
    float _1102 = _1100 + 1.0;
    float _1104 = fma(_1088, _916, _1090);
    float _1106 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1108 = _842 * _1102;
    float _1110 = fma(_1096, _882, _1104);
    float _1112 = fma(_1106, _1108, _1110);
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    out.m_63.x = _1114;
    bool _1116 = !_892;
    float _1134;
    if (!_1116)
    {
        float _1118 = in.m_55.x;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1122 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1124 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[14].y, _156);
        float _1126 = _1124 * _1120;
        float _1128 = floor(_1126);
        float _1130 = -_1128;
        float _1132 = _1126 + _1130;
        _1134 = _1132;
        _1136 = true;
    }
    else
    {
        float _1138 = float(_122);
        float _1140 = 1.0 / _1138;
        float _1142 = _156 * _1140;
        _1134 = _1142;
    }
    _1136 = false;
    float _1144 = _1134;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1148 = _1144 + _1146;
    bool _1150 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1152 = isnan(_1144);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1166 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1168 = isnan(_1144);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1178;
    bool _1182 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1184 = isnan(_1144);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -_1160;
    float _1196 = _1194 + 1.0;
    float _1198 = 1.0 / _1164;
    float _1200 = _1176 * _1196;
    float _1202 = -_1192;
    float _1204 = _1202 + 1.0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1212 = 1.0 / _1208;
    float _1214 = _1180 * _1198;
    float _1216 = -_1176;
    float _1218 = _1216 + 1.0;
    bool _1220 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1222 = isnan(_1144);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = fma(_1214, _1148, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1234 = _1192 * _1218;
    bool _1236 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1238 = isnan(_1144);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _1230 * _1204;
    float _1250 = -_1230;
    float _1252 = _1250 + 1.0;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1258 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1260 = isnan(_1144);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1246 * _1252;
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1280 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1282 = isnan(_1144);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = 1.0 / _1256;
    float _1294 = _1268 * _1274;
    float _1296 = -_1268;
    float _1298 = _1296 + 1.0;
    float _1300 = 1.0 / _1278;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1306 = _1290 * _1298;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1312 = _1304 * _1212;
    float _1314 = _1232 * _1306;
    float _1316 = -_1290;
    float _1318 = _1316 + 1.0;
    float _1320 = 1.0 / _1310;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1328 = _1144 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1330;
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1314);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1340 = fma(_1312, _1328, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1342 = _1332 * _1292;
    float _1344 = 1.0 / _1324;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1348 = _1144 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1354 = fma(_1340, _1294, _1334);
    float _1356 = fma(_1342, _1348, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1360 = _1144 + _1358;
    float _1362 = _1352 * _1300;
    float _1364 = 1.0 / _1338;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1366;
    float _1370 = fma(_1356, _1270, _1354);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1376 = _1368 * _1320;
    float _1378 = fma(_1362, _1360, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1382 = _1144 + _1380;
    float _1384 = _1374 * _1344;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1386;
    bool _1390 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1392 = isnan(_1144);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1404 = _1144 + _1402;
    float _1406 = fma(_1376, _1382, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1408 = fma(_1378, _1248, _1370);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1412 = _1144 + _1410;
    float _1414 = fma(_1384, _1404, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1416 = _1388 * _1364;
    float _1418 = -_1400;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1406, _1234, _1408);
    float _1424 = fma(_1416, _1412, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1426 = _1160 * _1420;
    float _1428 = fma(_1414, _1200, _1422);
    float _1430 = fma(_1424, _1426, _1428);
    float _1432 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1430);
    out.m_65.x = _1432;
    bool _1434 = !_1210;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1438 = _1354;
    float _1440 = _1234;
    float _1442 = _1248;
    float _1444 = _1270;
    float _1462;
    if (!_1434)
    {
        float _1446 = in.m_55.x;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1450 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[14].z, _156);
        float _1454 = _1452 * _1448;
        float _1456 = floor(_1454);
        float _1458 = -_1456;
        float _1460 = _1454 + _1458;
        _1462 = _1460;
        _1464 = true;
    }
    else
    {
        float _1466 = float(_122);
        float _1468 = 1.0 / _1466;
        float _1470 = _156 * _1468;
        _1462 = _1470;
    }
    _1464 = false;
    float _1472 = _1462;
    float _1474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1476 = int(_1474);
    float _1478 = in.m_55.y;
    float _1480 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1482 = int(_1480);
    float _1484 = float(_1476);
    float _1486 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1488 = int(_1486);
    float _1490 = float(uint(_1482));
    float _1492 = 1.0 / _1484;
    float _1494 = 1.0 / _1490;
    float _1496 = float(_1488);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1500 = _1498 != 0;
    float _1502 = _1492 * _156;
    float _1504 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1506 = int(_1504);
    int _1508 = as_type<int>(_1494) + (-2);
    float _1510 = trunc(_1502);
    int _1512 = int(_1510);
    float _1514 = float(_122);
    if (_1500)
    {
        float _1516 = in.m_55.x;
        _1436 = _1516;
    }
    float _1518 = _1436;
    int _1520 = ~_1482;
    int _1522 = _1520 + 1;
    int _1524 = 0;
    int _1526 = 0;
    float _1528 = _1518;
    if (_1500)
    {
        _1524 = 0;
        _1526 = 0;
    }
    int _1530 = _1524;
    int _1532 = _1526;
    int _1534 = _1530;
    int _1536 = _1532;
    if (_1500)
    {
        _1438 = 1.0;
    }
    float _1538 = _1438;
    float _1540 = _1364;
    float _1542 = _1538;
    if (_1500)
    {
        float _1544 = in.m_55.z;
        _1540 = _1544;
    }
    float _1546 = _1540;
    if (_1500)
    {
        _1440 = 1.0;
    }
    float _1548 = _1440;
    float _1550 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1552 = int(_1550);
    float _1554 = float(uint(_1506));
    float _1556 = _1548;
    if (_1500)
    {
        _1442 = 1.0;
    }
    float _1558 = _1442;
    int _1560 = 0;
    float _1562 = _1558;
    if (_1500)
    {
        _1560 = as_type<int>(_1478);
    }
    int _1564 = _1560;
    float _1566 = float(uint(_1512));
    float _1568 = 1.0 / _1496;
    float _1570 = as_type<float>(_1508) * _1566;
    float _1572 = float(_1552);
    float _1574 = trunc(_1570);
    float _1576 = precise::max(_1574, 0.0);
    uint _1579 = uint(_1576);
    int _1581 = 0;
    float _1583 = _1570;
    float _1585 = _1546;
    int _1587 = _1564;
    if (_1500)
    {
        _1581 = as_type<int>(_1546);
    }
    int _1589 = _1581;
    float _1591 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1593 = int(_1591);
    int _1595 = _1589;
    if (_1500)
    {
        _1583 = _1518;
    }
    float _1597 = _1583;
    float _1599 = _1597;
    if (_1500)
    {
        _1444 = _1597;
    }
    float _1601 = _1444;
    int _1603 = 0;
    float _1605 = _1601;
    if (_1500)
    {
        _1603 = as_type<int>(_1597);
    }
    int _1607 = _1603;
    int _1609 = _1522 * int(_1579);
    int _1611 = _1609 + _1512;
    float _1613 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1615 = int(_1613);
    float _1617 = float(uint(_1611));
    float _1619 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1621 = int(_1619);
    float _1623 = as_type<float>(_1508) * _1617;
    float _1625 = 1.0 / _1514;
    float _1627 = 1.0 / _1554;
    float _1629 = 1.0 / _1572;
    float _1631 = trunc(_1623);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    int _1637 = _1607;
    if (!_1500)
    {
        float _1639 = in.m_55.x;
        float _1641 = _1478 * 3.1415927410125732421875;
        float _1643 = in.m_55.z;
        float _1645 = _1641 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1639 * 3.1415927410125732421875;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = _1643 * 3.1415927410125732421875;
        float _1657 = _1655 * 0.15915493667125701904296875;
        float _1659 = _1653 * 6.283185482025146484375;
        float _1661 = sin(_1659);
        float _1663 = _1657 * 6.283185482025146484375;
        float _1665 = sin(_1663);
        _1542 = 7.345489978790283203125;
        _1528 = _1639;
        _1556 = 1.2345600128173828125;
        _1599 = _1478;
        _1562 = 5.839270114898681640625;
        _1605 = _1643;
        _1585 = _1643;
        _1534 = 1;
        _1587 = as_type<int>(_1649);
        _1637 = as_type<int>(_1661);
        _1595 = as_type<int>(_1665);
        _1536 = 2;
    }
    float _1667 = _1542;
    float _1669 = _1528;
    float _1671 = _1556;
    float _1673 = _1599;
    float _1675 = _1562;
    float _1677 = _1605;
    float _1679 = _1585;
    int _1681 = _1534;
    int _1683 = _1587;
    int _1685 = _1637;
    int _1687 = _1595;
    int _1689 = _1536;
    float _1691 = _1667 * _1669;
    int _1693 = ~_1482;
    int _1695 = _1693 + 1;
    float _1697 = _1568 * _156;
    int _1699 = int(_1579) + int(_1635);
    float _1701 = floor(_1691);
    float _1703 = float(_1482);
    float _1705 = in.m_67.x;
    float _1707 = float(_1512);
    int _1709 = _1695 * _1699;
    int _1711 = _1709 + _1512;
    float _1713 = _1671 * _1673;
    bool _1715 = _1707 >= _1703;
    bool _1717 = isnan(_1707);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(_1703);
    bool _1723 = _1719 || _1721;
    float _1725 = float(_1723);
    float _1727 = trunc(_1697);
    int _1729 = int(_1727);
    bool _1731 = uint(_1711) >= uint(_1482);
    float _1733 = _1667 * _1673;
    float _1735 = float(_1621);
    float _1737 = _1675 * _1677;
    bool _1739 = !_1731;
    int _1741 = _1739 ? 0 : (-1);
    float _1743 = in.m_67.y;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1747 = _1745 != 0;
    float _1749 = trunc(_1725);
    int _1751 = int(_1749);
    int _1753 = ~_1699;
    int _1755 = _1753 + _1741;
    int _1757 = _1755 + 1;
    float _1759 = -_1701;
    float _1761 = _1691 + _1759;
    bool _1763 = !_1747;
    int _1765 = _1763 ? 0 : 1;
    float _1767 = _1761 * _1703;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1771 = _1769 != 0;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1775 = _1773 != 0;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1779 = _1777 != 0;
    float _1781 = _1703 * _156;
    int _1783 = _1482 * _1757;
    int _1785 = _1783 + _1512;
    int _1787 = abs(_1765);
    float _1789 = 1.0 / _1735;
    bool _1791 = !_1775;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1781 * _1625;
    bool _1797 = _1482 == 0;
    int _1799 = ~_1751;
    int _1801 = _1799 + 1;
    int _1803 = _1801 + 1;
    bool _1805 = !_1797;
    int _1807 = _1805 ? _1785 : (-1);
    float _1809 = trunc(_1767);
    int _1811 = int(_1809);
    int _1813 = abs(_1793);
    int _1815 = _1807 * _1803;
    int _1817 = _1482 + (-1);
    float _1819 = trunc(_1795);
    int _1821 = int(_1819);
    bool _1823 = !_1771;
    int _1825 = _1823 ? 0 : 1;
    int _1827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1829 = _1827 != 0;
    int _1831 = _1751 * _1817;
    int _1833 = _1831 + _1815;
    int _1835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1837 = _1835 != 0;
    float _1839 = float(uint(_1615));
    int _1841 = _1811 * _1787;
    int _1843 = _1841 + _1512;
    bool _1845 = !_1779;
    int _1847 = _1845 ? 0 : 1;
    int _1849 = _1833 * _1813;
    int _1851 = abs(_1825);
    float _1853 = 1.0 / _1839;
    bool _1855 = !_1829;
    int _1857 = _1855 ? 0 : 1;
    int _1859 = abs(_1847);
    int _1861 = 0;
    float _1863 = as_type<float>(_1811);
    bool _1865 = false;
    bool _1867 = false;
    if (_1837)
    {
        float _1869 = in.m_55.x;
        _1861 = as_type<int>(_1869);
    }
    int _1871 = _1861;
    int _1873 = abs(_1857);
    float _1875 = _1629 * _156;
    int _1877 = _1821 * _1851;
    int _1879 = _1877 + _1849;
    float _1881 = _1789 * _156;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1885 = _1883 != 0;
    int _1887 = _1843 * _1859;
    int _1889 = _1887 + _1879;
    int _1891 = as_type<int>(_1627) + (-2);
    float _1893 = in.m_55.w;
    float _1895 = float(uint(_1729));
    int _1897 = _1811 * _1873;
    int _1899 = _1897 + _1889;
    float _1901 = float(uint(_1593));
    float _1903 = trunc(_1875);
    int _1905 = int(_1903);
    float _1907 = _1705;
    if (!_1837)
    {
        _1863 = _1705;
    }
    float _1909 = _1863;
    float _1911 = as_type<float>(_1891) * _1895;
    float _1913 = float(uint(_1899));
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1917 = _1915 != 0;
    float _1919 = as_type<float>(_1879);
    int _1921 = as_type<int>(_1913);
    float _1923 = _1909;
    if (_1885)
    {
        float _1925 = in.m_55.z;
        _1919 = _1925;
    }
    float _1927 = _1919;
    bool _1929 = _1478 > 0.5;
    float _1931 = as_type<float>(_1508) * _1913;
    float _1933 = 1.0 / _1901;
    if (_1837)
    {
        float _1935 = -_1705;
        float _1937 = _1935 + 1.0;
        _1921 = as_type<int>(_1937);
    }
    int _1939 = _1921;
    int _1941 = _1871;
    if (_1837)
    {
        bool _1943 = as_type<float>(_1871) > 0.5;
        _1865 = _1943;
    }
    bool _1945 = _1865;
    if (_1885)
    {
        float _1947 = -_1705;
        float _1949 = _1947 + 1.0;
        _1941 = as_type<int>(_1949);
    }
    int _1951 = _1941;
    int _1953 = ~_1506;
    int _1955 = _1953 + 1;
    int _1957 = _1951;
    if (_1837)
    {
        float _1959 = _1945 ? as_type<float>(_1939) : _1705;
        _1923 = _1959;
    }
    float _1961 = _1923;
    float _1963 = trunc(_1931);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1971 = _1969 != 0;
    int _1973 = 0;
    if (_1917)
    {
        float _1975 = -_1705;
        float _1977 = _1975 + 1.0;
        _1973 = as_type<int>(_1977);
    }
    int _1979 = _1973;
    float _1981 = float(uint(_1905));
    bool _1983 = _1893 > 0.5;
    int _1985 = ~_1615;
    int _1987 = _1985 + 1;
    float _1989 = trunc(_1881);
    int _1991 = int(_1989);
    int _1993 = ~_1482;
    int _1995 = _1993 + 1;
    int _1997 = as_type<int>(_1933) + (-2);
    float _1999 = _1927;
    float _2001 = as_type<float>(_1995);
    int _2003 = _1979;
    if (_1885)
    {
        bool _2005 = _1927 > 0.5;
        _1867 = _2005;
    }
    bool _2007 = _1867;
    if (!_1971)
    {
        _1999 = _1705;
    }
    float _2009 = _1999;
    int _2011 = _1995 * int(_1967);
    int _2013 = _2011 + _1899;
    float _2015 = _2009;
    if (!_1885)
    {
        _2001 = _1705;
    }
    float _2017 = _2001;
    float _2019 = as_type<float>(_1997) * _1981;
    float _2021 = _2017;
    if (_1885)
    {
        float _2023 = _2007 ? as_type<float>(_1951) : _1705;
        _2021 = _2023;
    }
    float _2025 = _2021;
    if (_1971)
    {
        float _2027 = -_1705;
        float _2029 = _2027 + 1.0;
        _1957 = as_type<int>(_2029);
    }
    int _2031 = _1957;
    float _2033 = float(uint(_2013));
    float _2035 = trunc(_1911);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2043 = _2041 != 0;
    int _2045 = as_type<int>(_1853) + (-2);
    float _2047 = as_type<float>(_1508) * _2033;
    float _2049 = float(uint(_1991));
    float _2051 = _2033;
    if (!_1917)
    {
        _2051 = _1705;
    }
    float _2053 = _2051;
    float _2055 = trunc(_2019);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    float _2061 = _2053;
    if (_1917)
    {
        float _2063 = _1929 ? as_type<float>(_1979) : _1705;
        _2061 = _2063;
    }
    float _2065 = _2061;
    float _2067 = as_type<float>(_2045) * _2049;
    if (_1971)
    {
        float _2069 = _1929 ? as_type<float>(_2031) : _1705;
        _2015 = _2069;
    }
    float _2071 = _2015;
    if (_2043)
    {
        float _2073 = -_1705;
        float _2075 = _2073 + 1.0;
        _2003 = as_type<int>(_2075);
    }
    int _2077 = _2003;
    int _2079 = ~_1593;
    int _2081 = _2079 + 1;
    float _2083 = trunc(_2047);
    float _2085 = precise::max(_2083, 0.0);
    uint _2087 = uint(_2085);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2091 = _2089 != 0;
    int _2093 = _1955 * int(_2039);
    int _2095 = _2093 + _1729;
    if (_2043)
    {
        float _2097 = _1929 ? as_type<float>(_2077) : _1705;
        _1907 = _2097;
    }
    float _2099 = _1907;
    int _2101 = ~_1482;
    int _2103 = _2101 + 1;
    float _2105 = floor(_1713);
    float _2107 = float(uint(_2095));
    bool _2109 = _1506 == 0;
    float _2111 = as_type<float>(_1891) * _2107;
    float _2113 = trunc(_2067);
    float _2115 = precise::max(_2113, 0.0);
    uint _2117 = uint(_2115);
    int _2119 = int(_1967) + int(_2087);
    int _2121 = _2081 * int(_2059);
    int _2123 = _2121 + _1905;
    float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2127 = _2125 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2133 = floor(_1733);
    float _2135 = -_2105;
    float _2137 = _1713 + _2135;
    float _2139 = float(uint(_2123));
    int _2141 = _2103 * _2119;
    int _2143 = _2141 + _1899;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    int _2149 = _1987 * int(_2117);
    int _2151 = _2149 + _1991;
    float _2153 = floor(_1737);
    float _2155 = as_type<float>(_1997) * _2139;
    bool _2157 = uint(_2143) >= uint(_1482);
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2163 = float(_1615);
    float _2165 = float(_1905);
    float _2167 = -_2133;
    float _2169 = _1733 + _2167;
    float _2171 = float(uint(_2151));
    float _2173 = trunc(_2111);
    float _2175 = precise::max(_2173, 0.0);
    uint _2177 = uint(_2175);
    float _2179 = _1625 * _156;
    float _2181 = float(_1506);
    float _2183 = as_type<float>(_2045) * _2171;
    bool _2185 = !_2157;
    int _2187 = _2185 ? 0 : (-1);
    float _2189 = -_2153;
    float _2191 = _1737 + _2189;
    float _2193 = trunc(_2155);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    float _2199 = float(_1593);
    float _2201 = _2181 * _2137;
    float _2203 = float(_1729);
    int _2205 = ~_2119;
    int _2207 = _2205 + _2187;
    int _2209 = _2207 + 1;
    float _2211 = _2199 * _2191;
    int _2213 = ~_1506;
    int _2215 = _2213 + 1;
    float _2217 = trunc(_2183);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = float(_1991);
    int _2225 = _1482 * _2209;
    int _2227 = _2225 + _1899;
    int _2229 = int(_2039) + int(_2177);
    bool _2231 = _2223 >= _2163;
    bool _2233 = isnan(_2223);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan(_2163);
    bool _2239 = _2235 || _2237;
    float _2241 = float(_2239);
    bool _2243 = _2203 >= _2181;
    bool _2245 = isnan(_2203);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(_2181);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = _2181 * _2179;
    bool _2257 = _2165 >= _2199;
    bool _2259 = isnan(_2165);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(_2199);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2265);
    float _2269 = _2199 * _2179;
    int _2271 = ~_1615;
    int _2273 = _2271 + 1;
    float _2275 = _2163 * _2179;
    float _2277 = _2163 * _2169;
    int _2279 = int(_2059) + int(_2197);
    int _2281 = _2215 * _2229;
    int _2283 = _2281 + _1729;
    int _2285 = int(_2117) + int(_2221);
    float _2287 = trunc(_2201);
    int _2289 = int(_2287);
    int _2291 = ~_1593;
    int _2293 = _2291 + 1;
    bool _2295 = !_2091;
    int _2297 = _2295 ? 0 : 1;
    int _2299 = _2273 * _2285;
    int _2301 = _2299 + _1991;
    bool _2303 = !_1797;
    int _2305 = _2303 ? _2227 : (-1);
    int _2307 = _2293 * _2279;
    int _2309 = _2307 + _1905;
    bool _2311 = uint(_2283) >= uint(_1506);
    float _2313 = trunc(_2255);
    int _2315 = int(_2313);
    bool _2317 = uint(_2301) >= uint(_1615);
    int _2319 = abs(_2297);
    int _2321 = _2305 & 3;
    bool _2323 = _2321 != 0;
    bool _2325 = !_2311;
    int _2327 = _2325 ? 0 : (-1);
    float _2329 = trunc(_2253);
    int _2331 = int(_2329);
    bool _2333 = uint(_2309) >= uint(_1593);
    bool _2335 = uint(_2321) > 1u;
    int _2337 = ~_2229;
    int _2339 = _2337 + _2327;
    int _2341 = _2339 + 1;
    int _2343 = _2289 * _2319;
    int _2345 = _2343 + _1729;
    bool _2347 = !_2333;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = trunc(_2275);
    int _2353 = int(_2351);
    int _2355 = _2305 & 3;
    bool _2357 = _2355 != 0;
    int _2359 = _1506 * _2341;
    int _2361 = _2359 + _1729;
    float _2363 = -_1743;
    float _2365 = _2363 + 1.0;
    bool _2367 = !_2317;
    int _2369 = _2367 ? 0 : (-1);
    int _2371 = _2357 ? 0 : 1;
    int _2373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2375 = _2373 != 0;
    float _2377 = 1.0 / _2127;
    int _2379 = ~_2279;
    int _2381 = _2379 + _2349;
    int _2383 = _2381 + 1;
    int _2385 = ~_2371;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    int _2391 = ~_2331;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _1593 * _2383;
    int _2399 = _2397 + _1905;
    bool _2401 = !_2109;
    int _2403 = _2401 ? _2361 : (-1);
    float _2405 = 1.0 / _2131;
    int _2407 = _2389;
    if (!_2335)
    {
        int _2409 = ~_2371;
        int _2411 = _2409 + 1;
        _2407 = _2411;
    }
    int _2413 = _2407;
    int _2415 = _1983 ? as_type<int>(_2365) : as_type<int>(_1743);
    int _2417 = _2395 * _2403;
    int _2419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2421 = _2419 != 0;
    int _2423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2425 = _2423 != 0;
    int _2427 = _1506 + (-1);
    float _2429 = trunc(_2211);
    int _2431 = int(_2429);
    bool _2433 = !_2375;
    int _2435 = _2433 ? 0 : 1;
    bool _2437 = !_2421;
    int _2439 = _2437 ? 0 : 1;
    int _2441 = _2331 * _2427;
    int _2443 = _2441 + _2417;
    int _2445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2447 = _2445 != 0;
    int _2449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2451 = _2449 != 0;
    int _2453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2455 = _2453 != 0;
    float _2457 = trunc(_2267);
    int _2459 = int(_2457);
    int _2461 = ~_2285;
    int _2463 = _2461 + _2369;
    int _2465 = _2463 + 1;
    bool _2467 = !_2425;
    int _2469 = _2467 ? 0 : 1;
    bool _2471 = !_2455;
    int _2473 = _2471 ? 0 : 1;
    int _2475 = _1615 * _2465;
    int _2477 = _2475 + _1991;
    int _2479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2481 = _2479 != 0;
    float _2483 = 1.0 / _2147;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2487 = _2485 != 0;
    int _2489 = abs(_2469);
    int _2491 = int(_2487);
    int _2493 = _2481 ? 2 : 0;
    int _2495 = _2491 | _2493;
    int _2497 = _2447 ? 4 : 0;
    int _2499 = _2495 | _2497;
    int _2501 = _2451 ? 8 : 0;
    int _2503 = _2499 | _2501;
    int _2505 = _2323 ? 16 : 0;
    int _2507 = _2503 | _2505;
    int _2509 = _1797 ? 32 : 0;
    int _2511 = _2507 | _2509;
    int _2513 = _2109 ? 64 : 0;
    int _2515 = _2511 | _2513;
    int _2517 = _2515 & 16;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2525 = _2523 != 0;
    int _2527 = _2443 * _2489;
    int _2529 = abs(_2435);
    float _2531 = trunc(_2241);
    int _2533 = int(_2531);
    bool _2535 = !_2481;
    int _2537 = _2535 ? 0 : 1;
    bool _2539 = !_2525;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = _2431 * _2529;
    int _2545 = _2543 + _1905;
    bool _2547 = _1593 == 0;
    bool _2549 = !_2487;
    int _2551 = _2549 ? 0 : 1;
    float _2553 = trunc(_2277);
    int _2555 = int(_2553);
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2559 = _2557 != 0;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2563 = _2561 != 0;
    int _2565 = abs(_2439);
    bool _2567 = !_2447;
    int _2569 = _2567 ? 0 : 1;
    bool _2571 = !_2451;
    int _2573 = _2571 ? 0 : 1;
    int _2575 = _2315 * _2565;
    int _2577 = _2575 + _2527;
    bool _2579 = !_2559;
    int _2581 = _2579 ? 0 : 1;
    float _2583 = 1.0 / _2161;
    int _2585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2587 = _2585 != 0;
    int _2589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2591 = _2589 != 0;
    bool _2593 = _1615 == 0;
    int _2595 = abs(_2569);
    int _2597 = abs(_2573);
    int _2599 = ~_2533;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    int _2605 = _2345 * _2595;
    int _2607 = _2605 + _2577;
    bool _2609 = !_2593;
    int _2611 = _2609 ? _2477 : (-1);
    float _2613 = float(uint(_1843));
    int _2615 = ~_2459;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2603 * _2611;
    bool _2623 = !_2547;
    int _2625 = _2623 ? _2399 : (-1);
    float _2627 = as_type<float>(_1508) * _2613;
    int _2629 = _1593 + (-1);
    int _2631 = _2619 * _2625;
    bool _2633 = !_2521;
    int _2635 = _2633 ? 0 : 1;
    float _2637 = trunc(_2269);
    int _2639 = int(_2637);
    int _2641 = _2289 * _2597;
    int _2643 = _2641 + _2607;
    int _2645 = abs(_2541);
    int _2647 = _2459 * _2629;
    int _2649 = _2647 + _2631;
    float _2651 = float(uint(_2345));
    int _2653 = abs(_2635);
    int _2655 = _2649 * _2645;
    float _2657 = trunc(_2627);
    float _2659 = precise::max(_2657, 0.0);
    uint _2661 = uint(_2659);
    float _2663 = float(uint(_2643));
    float _2665 = as_type<float>(_1891) * _2651;
    int _2667 = ~_1482;
    int _2669 = _2667 + 1;
    int _2671 = abs(_2473);
    float _2673 = as_type<float>(_1891) * _2663;
    int _2675 = abs(_2551);
    int _2677 = _2639 * _2653;
    int _2679 = _2677 + _2655;
    float _2681 = trunc(_2665);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = abs(_2537);
    int _2689 = _2555 * _2675;
    int _2691 = _2689 + _1991;
    bool _2693 = !_2563;
    int _2695 = _2693 ? 0 : 1;
    int _2697 = _2545 * _2671;
    int _2699 = _2697 + _2679;
    int _2701 = ~_1506;
    int _2703 = _2701 + 1;
    int _2705 = _2669 * int(_2661);
    int _2707 = _2705 + _1843;
    int _2709 = abs(_2695);
    float _2711 = trunc(_2673);
    float _2713 = precise::max(_2711, 0.0);
    uint _2715 = uint(_2713);
    int _2717 = ~_1506;
    int _2719 = _2717 + 1;
    int _2721 = _2431 * _2687;
    int _2723 = _2721 + _2699;
    float _2725 = float(uint(_2707));
    int _2727 = _1615 + (-1);
    float _2729 = float(uint(_2723));
    float _2731 = as_type<float>(_1508) * _2725;
    int _2733 = _2703 * int(_2685);
    int _2735 = _2733 + _2345;
    int _2737 = abs(_2581);
    float _2739 = as_type<float>(_1997) * _2729;
    int _2741 = _2533 * _2727;
    int _2743 = _2741 + _2621;
    bool _2745 = !_2587;
    int _2747 = _2745 ? 0 : 1;
    float _2749 = trunc(_2731);
    float _2751 = precise::max(_2749, 0.0);
    uint _2753 = uint(_2751);
    int _2755 = _2719 * int(_2715);
    int _2757 = _2755 + _2643;
    float _2759 = float(uint(_2735));
    float _2761 = float(uint(_2757));
    float _2763 = as_type<float>(_1891) * _2759;
    float _2765 = trunc(_2739);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    int _2771 = abs(_2747);
    int _2773 = _2743 * _2709;
    float _2775 = as_type<float>(_1891) * _2761;
    float _2777 = float(uint(_2545));
    float _2779 = trunc(_2775);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    int _2785 = _2353 * _2737;
    int _2787 = _2785 + _2773;
    float _2789 = as_type<float>(_1997) * _2777;
    int _2791 = ~_1593;
    int _2793 = _2791 + 1;
    bool _2795 = !_2591;
    int _2797 = _2795 ? 0 : 1;
    int _2799 = _2691 * _2771;
    int _2801 = _2799 + _2787;
    bool _2803 = uint(_2321) >= 2u;
    float _2805 = trunc(_2789);
    float _2807 = precise::max(_2805, 0.0);
    uint _2809 = uint(_2807);
    int _2811 = abs(_2797);
    int _2813 = _2793 * int(_2769);
    int _2815 = _2813 + _2723;
    int _2817 = _2803 ? 0 : 1;
    int _2819 = ~_1506;
    int _2821 = _2819 + 1;
    float _2823 = float(uint(_2815));
    int _2825 = _2555 * _2811;
    int _2827 = _2825 + _2801;
    bool _2829 = _2321 != 3;
    float _2831 = trunc(_2763);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = int(_2715) + int(_2783);
    float _2839 = as_type<float>(_1997) * _2823;
    int _2841 = ~_1593;
    int _2843 = _2841 + 1;
    float _2845 = float(uint(_2827));
    int _2847 = _2821 * _2837;
    int _2849 = _2847 + _2643;
    int _2851 = ~_2817;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    int _2857 = _2843 * int(_2809);
    int _2859 = _2857 + _2545;
    float _2861 = trunc(_2839);
    float _2863 = precise::max(_2861, 0.0);
    uint _2865 = uint(_2863);
    float _2867 = as_type<float>(_2045) * _2845;
    int _2869 = _2855;
    if (_2829)
    {
        int _2871 = ~_2817;
        int _2873 = _2871 + 1;
        _2869 = _2873;
    }
    int _2875 = _2869;
    bool _2877 = uint(_2849) >= uint(_1506);
    float _2879 = float(uint(_2859));
    int _2881 = int(_2661) + int(_2753);
    float _2883 = trunc(_2867);
    float _2885 = precise::max(_2883, 0.0);
    uint _2887 = uint(_2885);
    int _2889 = ~_1482;
    int _2891 = _2889 + 1;
    float _2893 = as_type<float>(_1997) * _2879;
    bool _2895 = !_2877;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2901 = _2899 != 0;
    int _2903 = _2891 * _2881;
    int _2905 = _2903 + _1843;
    int _2907 = ~_2837;
    int _2909 = _2907 + _2897;
    int _2911 = _2909 + 1;
    int _2913 = int(_2685) + int(_2835);
    bool _2915 = !_2901;
    int _2917 = _2915 ? 0 : 1;
    float _2919 = trunc(_2893);
    float _2921 = precise::max(_2919, 0.0);
    uint _2923 = uint(_2921);
    bool _2925 = uint(_2905) >= uint(_1482);
    int _2927 = _1506 * _2911;
    int _2929 = _2927 + _2643;
    int _2931 = ~_1615;
    int _2933 = _2931 + 1;
    bool _2935 = _1478 > 0.5;
    int _2937 = int(_2769) + int(_2865);
    int _2939 = _2933 * int(_2887);
    int _2941 = _2939 + _2827;
    int _2943 = _2935 ? as_type<int>(_2365) : as_type<int>(_1743);
    int _2945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2947 = _2945 != 0;
    bool _2949 = !_2109;
    int _2951 = _2949 ? _2929 : (-1);
    int _2953 = ~_1593;
    int _2955 = _2953 + 1;
    float _2957 = _2947 ? as_type<float>(_2943) : _1743;
    int _2959 = _2951 & 3;
    bool _2961 = _2959 != 0;
    int _2963 = _2955 * _2937;
    int _2965 = _2963 + _2723;
    float _2967 = float(uint(_2941));
    int _2969 = ~_1506;
    int _2971 = _2969 + 1;
    bool _2973 = !_2925;
    int _2975 = _2973 ? 0 : (-1);
    float _2977 = as_type<float>(_2045) * _2967;
    bool _2979 = uint(_2959) >= 2u;
    int _2981 = _2961 ? 0 : 1;
    float _2983 = trunc(_2977);
    float _2985 = precise::max(_2983, 0.0);
    uint _2987 = uint(_2985);
    int _2989 = _2979 ? 0 : 1;
    bool _2991 = _2959 != 3;
    bool _2993 = uint(_2965) >= uint(_1593);
    int _2995 = _2971 * _2913;
    int _2997 = _2995 + _2345;
    float _2999 = float(uint(_2691));
    bool _3001 = !_2993;
    int _3003 = _3001 ? 0 : (-1);
    bool _3005 = uint(_2959) > 1u;
    float _3007 = as_type<float>(_2045) * _2999;
    int _3009 = ~_2937;
    int _3011 = _3009 + _3003;
    int _3013 = _3011 + 1;
    int _3015 = ~_2989;
    int _3017 = _3015 + 1;
    int _3019 = _3017 + 1;
    int _3021 = _3019;
    if (_2991)
    {
        int _3023 = ~_2989;
        int _3025 = _3023 + 1;
        _3021 = _3025;
    }
    int _3027 = _3021;
    int _3029 = _1593 * _3013;
    int _3031 = _3029 + _2723;
    int _3033 = ~_1615;
    int _3035 = _3033 + 1;
    float _3037 = trunc(_3007);
    float _3039 = precise::max(_3037, 0.0);
    uint _3041 = uint(_3039);
    bool _3043 = uint(_2997) >= uint(_1506);
    int _3045 = ~_2981;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    int _3051 = _3049;
    if (!_3005)
    {
        int _3053 = ~_2981;
        int _3055 = _3053 + 1;
        _3051 = _3055;
    }
    int _3057 = _3051;
    int _3059 = int(_2887) + int(_2987);
    bool _3061 = !_2547;
    int _3063 = _3061 ? _3031 : (-1);
    int _3065 = int(_2809) + int(_2923);
    int _3067 = _3035 * _3059;
    int _3069 = _3067 + _2827;
    int _3071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3073 = _3071 != 0;
    bool _3075 = !_3043;
    int _3077 = _3075 ? 0 : (-1);
    int _3079 = _3063 & 3;
    bool _3081 = _3079 != 0;
    bool _3083 = !_3073;
    int _3085 = _3083 ? 0 : 1;
    bool _3087 = uint(_3079) >= 2u;
    int _3089 = _3081 ? 0 : 1;
    int _3091 = ~_1615;
    int _3093 = _3091 + 1;
    bool _3095 = uint(_3069) >= uint(_1615);
    int _3097 = _3087 ? 0 : 1;
    int _3099 = _3093 * int(_3041);
    int _3101 = _3099 + _2691;
    bool _3103 = _3079 != 3;
    bool _3105 = !_3095;
    int _3107 = _3105 ? 0 : (-1);
    int _3109 = ~_1593;
    int _3111 = _3109 + 1;
    bool _3113 = uint(_3079) > 1u;
    int _3115 = ~_3059;
    int _3117 = _3115 + _3107;
    int _3119 = _3117 + 1;
    int _3121 = _3111 * _3065;
    int _3123 = _3121 + _2545;
    float _3125 = float(uint(_3101));
    int _3127 = ~_3097;
    int _3129 = _3127 + 1;
    int _3131 = _3129 + 1;
    int _3133 = _1615 * _3119;
    int _3135 = _3133 + _2827;
    int _3137 = _3131;
    if (_3103)
    {
        int _3139 = ~_3097;
        int _3141 = _3139 + 1;
        _3137 = _3141;
    }
    int _3143 = _3137;
    float _3145 = as_type<float>(_2045) * _3125;
    bool _3147 = uint(_3123) >= uint(_1593);
    bool _3149 = !_2593;
    int _3151 = _3149 ? _3135 : (-1);
    float _3153 = trunc(_3145);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    int _3159 = ~_3089;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    int _3165 = _3163;
    if (!_3113)
    {
        int _3167 = ~_3089;
        int _3169 = _3167 + 1;
        _3165 = _3169;
    }
    int _3171 = _3165;
    int _3173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3175 = _3173 != 0;
    bool _3177 = !_3147;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = _3151 & 3;
    bool _3183 = _3181 != 0;
    bool _3185 = !_3175;
    int _3187 = _3185 ? 0 : 1;
    bool _3189 = uint(_3181) >= 2u;
    int _3191 = ~_1615;
    int _3193 = _3191 + 1;
    int _3195 = _3189 ? 0 : 1;
    bool _3197 = _3181 != 3;
    int _3199 = int(_3041) + int(_3157);
    int _3201 = _3183 ? 0 : 1;
    bool _3203 = uint(_3181) > 1u;
    int _3205 = ~_2881;
    int _3207 = _3205 + _2975;
    int _3209 = _3207 + 1;
    int _3211 = _3193 * _3199;
    int _3213 = _3211 + _2691;
    int _3215 = ~_2913;
    int _3217 = _3215 + _3077;
    int _3219 = _3217 + 1;
    int _3221 = ~_3195;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    int _3227 = _1482 * _3209;
    int _3229 = _3227 + _1843;
    int _3231 = _3225;
    if (_3197)
    {
        int _3233 = ~_3195;
        int _3235 = _3233 + 1;
        _3231 = _3235;
    }
    int _3237 = _3231;
    int _3239 = _1506 * _3219;
    int _3241 = _3239 + _2345;
    bool _3243 = _1482 == 0;
    float _3245 = in.m_46.x;
    float _3247 = in.m_46.y;
    float _3249 = in.m_46.z;
    int _3251 = ~_3201;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    float _3257 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _3259 = _3255;
    if (!_3203)
    {
        int _3261 = ~_3201;
        int _3263 = _3261 + 1;
        _3259 = _3263;
    }
    int _3265 = _3259;
    bool _3267 = !_3243;
    int _3269 = _3267 ? _3229 : (-1);
    int _3271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3273 = _3271 != 0;
    bool _3275 = uint(_3213) >= uint(_1615);
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _3279 = !_2109;
    int _3281 = _3279 ? _3241 : (-1);
    bool _3283 = !_3273;
    int _3285 = _3283 ? 0 : 1;
    float _3287 = fma(_3257, -2.0, _3277);
    int _3289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3291 = _3289 != 0;
    int _3293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3295 = _3293 != 0;
    float _3297 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3287);
    int _3299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3301 = _3299 != 0;
    int _3303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3305 = _3303 != 0;
    float _3307 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3309 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3311 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3313 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3315 = _3313 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3317 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3307);
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3321 = _3319 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3323 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3309);
    float _3325 = 1.0 / _3315;
    float _3327 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3311);
    float _3329 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3329;
    float _3333 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3335 = _3333 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _3337 = !_3275;
    int _3339 = _3337 ? 0 : (-1);
    float _3341 = _3331 * _2377;
    float _3343 = 1.0 / _3321;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3349 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3351 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3349;
    float _3353 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3355 = _3353 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3357 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3359 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3357;
    float _3361 = _1478 * 2.0;
    float _3363 = _3351 * _2405;
    float _3365 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3367 = _3365 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3369 = _3359 * _3325;
    float _3371 = floor(_3361);
    bool _3373 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3375 = isnan(_1472);
    bool _3377 = _3373 || _3375;
    bool _3379 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3381 = _3377 || _3379;
    float _3383 = float(_3381);
    float _3385 = _3335 * _2483;
    bool _3387 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3389 = isnan(_1472);
    bool _3391 = _3387 || _3389;
    bool _3393 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3395 = _3391 || _3393;
    float _3397 = float(_3395);
    float _3399 = _3355 * _2583;
    bool _3401 = _1679 > 0.5;
    float _3403 = -_3383;
    float _3405 = _3403 + 1.0;
    float _3407 = _3367 * _3343;
    float _3409 = 1.0 / _3347;
    float _3411 = _3291 ? as_type<float>(_2415) : _1743;
    float _3413 = -_3397;
    float _3415 = _3413 + 1.0;
    float _3417 = _3397 * _3405;
    int _3419 = _3401 ? as_type<int>(_2365) : as_type<int>(_1743);
    float _3421 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3323);
    bool _3423 = _2517 != 0;
    float _3425 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3427 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3425;
    bool _3429 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3431 = isnan(_1472);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    float _3441 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3327);
    float _3443 = _3295 ? as_type<float>(_3419) : _1743;
    float _3445 = _3421 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _3447 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3449 = isnan(_1472);
    bool _3451 = _3447 || _3449;
    bool _3453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3455 = _3451 || _3453;
    float _3457 = float(_3455);
    float _3459 = _3439 * _3415;
    bool _3461 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3463 = isnan(_1472);
    bool _3465 = _3461 || _3463;
    bool _3467 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3469 = _3465 || _3467;
    float _3471 = float(_3469);
    float _3473 = -_3439;
    float _3475 = _3473 + 1.0;
    bool _3477 = _3371 > 0.0;
    float _3479 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3317);
    bool _3481 = _3371 >= 0.0;
    bool _3483 = isnan(_3371);
    bool _3485 = _3481 || _3483;
    bool _3487 = isnan(0.0);
    bool _3489 = _3485 || _3487;
    float _3491 = _3427 * _3409;
    float _3493 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3495 = _1472 + _3493;
    bool _3497 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3499 = isnan(_1472);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3505 = _3501 || _3503;
    float _3507 = float(_3505);
    float _3509 = -_3471;
    float _3511 = _3509 + 1.0;
    float _3513 = _3457 * _3475;
    float _3515 = fma(_3341, _3495, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3517 = -_3457;
    float _3519 = _3517 + 1.0;
    float _3521 = _3507 * _3511;
    float _3523 = -_3507;
    float _3525 = _3523 + 1.0;
    bool _3527 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3529 = isnan(_1472);
    bool _3531 = _3527 || _3529;
    bool _3533 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3535 = _3531 || _3533;
    float _3537 = float(_3535);
    float _3539 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3541 = _1472 + _3539;
    float _3543 = _3471 * _3519;
    float _3545 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3547 = _1472 + _3545;
    bool _3549 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3551 = isnan(_1472);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = -_3537;
    float _3563 = _3561 + 1.0;
    float _3565 = fma(_3363, _3541, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3567 = fma(_3385, _3547, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3571 = _3559 * _3563;
    float _3573 = _3301 ? as_type<float>(_3419) : _1743;
    float _3575 = _3537 * _3525;
    bool _3577 = _1681 != 1;
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3581 = _1472 + _3579;
    float _3583 = _3515 * _3571;
    float _3585 = -_3559;
    float _3587 = _3585 + 1.0;
    float _3589 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3591 = _1472 + _3589;
    float _3593 = fma(_3399, _3581, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3595 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3597 = _1472 + _3595;
    float _3599 = fma(_3587, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3583);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3603 = _1472 + _3601;
    float _3605 = fma(_3369, _3591, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3607 = fma(_3567, _3575, _3599);
    float _3609 = fma(_3491, _3603, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3611 = _3569 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3613 = _3491;
    float _3615 = _3603;
    if (!_3577)
    {
        _3613 = _1478;
    }
    float _3617 = _3613;
    float _3619 = fma(_3565, _3521, _3607);
    float _3621 = _3617;
    if (!_3577)
    {
        _3615 = _1478;
    }
    float _3623 = _3615;
    float _3625 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3627 = 0.0;
    float _3629 = _3623;
    if (!_3577)
    {
        _3627 = _1679;
    }
    float _3631 = _3627;
    float _3633 = fma(_3407, _3597, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3635 = 0.0;
    float _3637 = _3631;
    if (!_3577)
    {
        _3635 = _1679;
    }
    float _3639 = _3635;
    float _3641 = _3479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3643 = !_3577;
    float _3645 = _3643 ? as_type<float>(_1683) : as_type<float>(_1685);
    float _3647 = _3441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3649 = _3639;
    float _3651 = _3647;
    if (_3577)
    {
        _3621 = _1669;
    }
    float _3653 = _3621;
    if (_3577)
    {
        _3629 = _1669;
    }
    float _3655 = _3629;
    if (_3577)
    {
        _3637 = _1478;
    }
    float _3657 = _3637;
    float _3659 = _3653 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_3577)
    {
        _3649 = _1478;
    }
    float _3661 = _3649;
    bool _3663 = !_3577;
    float _3665 = _3663 ? as_type<float>(_1687) : as_type<float>(_1683);
    float _3667 = _3657 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3669 = _1689 != 2;
    float _3671 = fma(_3611, _2099, -0.5);
    float _3673 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3675 = _3305 ? as_type<float>(_3419) : _1743;
    int _3677 = _2951 & 3;
    bool _3679 = _3677 != 0;
    float _3681 = -_3625;
    float _3683 = fma(_3673, 2.0, _3681);
    float _3685 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3687 = fma(_3593, _3543, _3619);
    float _3689 = _1478 + _1669;
    int _3691 = ~_3065;
    int _3693 = _3691 + _3179;
    int _3695 = _3693 + 1;
    float _3697 = fma(as_type<float>(_1685), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3685);
    float _3699 = _3689 + (-1.0);
    bool _3701 = !_3679;
    int _3703 = _3701 ? 0 : 1;
    int _3705 = _1593 * _3695;
    int _3707 = _3705 + _2545;
    bool _3709 = _2321 != 3;
    float _3711 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3713 = _2951 >> 31;
    float _3715 = as_type<float>(_1685) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3717 = !_3709;
    int _3719 = _3717 ? 0 : (-1);
    float _3721 = _1669 * 2.0;
    bool _3723 = _3079 != 3;
    float _3725 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3697);
    int _3727 = _3063 >> 31;
    float _3729 = -_156;
    float _3731 = fma(_3729, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3683);
    bool _3733 = !_2547;
    int _3735 = _3733 ? _3707 : (-1);
    float _3737 = floor(_3721);
    int _3739 = _2305 >> 31;
    float _3741 = fma(_3605, _3513, _3687);
    int _3743 = _3063 & 3;
    bool _3745 = _3743 != 0;
    int _3747 = _3713 & 3;
    float _3749 = fma(_3633, _3459, _3741);
    int _3751 = _3727 & 3;
    float _3753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3755 = _3739 & 3;
    float _3757 = fma(_3609, _3417, _3749);
    bool _3759 = !_3745;
    int _3761 = _3759 ? 0 : 1;
    bool _3763 = _2959 != 3;
    float _3765 = fma(_3383, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3757);
    int _3767 = _3063 + _3751;
    float _3769 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3771 = int(_3769);
    int _3773 = _2305 + _3755;
    bool _3775 = !_3763;
    int _3777 = _3775 ? 0 : (-1);
    out.m_69.x = _3765;
    bool _3779 = _3181 != 3;
    int _3781 = _3767 >> 2;
    int _3783 = _3773 >> 2;
    int _3785 = _3781 << 4;
    int _3787 = _3785 + 656;
    int _3789 = _3783 << 4;
    int _3791 = _3789 + 368;
    int _3793 = _2951 + _3747;
    uint _3795 = uint(int(uint(_3791) >> uint(2)));
    uint _3797 = uint(int(uint(int(_3795)) >> uint(2)));
    int _3799 = int(_3795) & 3;
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[int(_3797)][_3799];
    int _3803 = int(_3795) + 1;
    uint _3805 = uint(int(uint(_3803) >> uint(2)));
    int _3807 = _3803 & 3;
    float _3809 = (*spvDescriptorSet0.vp_c9)._m0[int(_3805)][_3807];
    int _3811 = _3151 >> 31;
    float _3813 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3815 = _3793 >> 2;
    int _3817 = _3811 & 3;
    float _3819 = fma(_3655, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3813);
    int _3821 = _3815 << 4;
    int _3823 = _3821 + 512;
    uint _3825 = uint(int(uint(_3787) >> uint(2)));
    uint _3827 = uint(int(uint(int(_3825)) >> uint(2)));
    int _3829 = int(_3825) & 3;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[int(_3827)][_3829];
    int _3833 = int(_3825) + 1;
    uint _3835 = uint(int(uint(_3833) >> uint(2)));
    int _3837 = _3833 & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    int _3841 = _3151 + _3817;
    float _3843 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3819);
    int _3845 = _3841 >> 2;
    bool _3847 = !_3423;
    int _3849 = _3847 ? 0 : 1;
    uint _3851 = uint(int(uint(_3823) >> uint(2)));
    uint _3853 = uint(int(uint(int(_3851)) >> uint(2)));
    int _3855 = int(_3851) & 3;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[int(_3853)][_3855];
    int _3859 = int(_3851) + 1;
    uint _3861 = uint(int(uint(_3859) >> uint(2)));
    int _3863 = _3859 & 3;
    float _3865 = (*spvDescriptorSet0.vp_c9)._m0[int(_3861)][_3863];
    int _3867 = _3845 << 4;
    int _3869 = _3867 + 800;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3873 = _3151 & 3;
    bool _3875 = _3873 != 0;
    float _3877 = fma(_3665, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3871);
    uint _3879 = uint(int(uint(_3869) >> uint(2)));
    uint _3881 = uint(int(uint(int(_3879)) >> uint(2)));
    int _3883 = int(_3879) & 3;
    float _3885 = (*spvDescriptorSet0.vp_c9)._m0[int(_3881)][_3883];
    int _3887 = int(_3879) + 1;
    uint _3889 = uint(int(uint(_3887) >> uint(2)));
    int _3891 = _3887 & 3;
    float _3893 = (*spvDescriptorSet0.vp_c9)._m0[int(_3889)][_3891];
    float _3895 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3897 = _3665 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3901 = ~_3199;
    int _3903 = _3901 + _3339;
    int _3905 = _3903 + 1;
    float _3907 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3895);
    float _3909 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3911 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3913 = fma(_3897, -2.0, _3899);
    int _3915 = abs(_2413);
    int _3917 = _1615 * _3905;
    int _3919 = _3917 + _2691;
    float _3921 = -_3909;
    float _3923 = fma(_3911, 2.0, _3921);
    int _3925 = abs(_3057);
    int _3927 = _3791 + 8;
    uint _3929 = uint(int(uint(_3927) >> uint(2)));
    uint _3931 = uint(int(uint(int(_3929)) >> uint(2)));
    int _3933 = int(_3929) & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = int(_3929) + 1;
    uint _3939 = uint(int(uint(_3937) >> uint(2)));
    int _3941 = _3937 & 3;
    float _3943 = (*spvDescriptorSet0.vp_c9)._m0[int(_3939)][_3941];
    int _3945 = abs(_3171);
    float _3947 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3907);
    int _3949 = ~_3915;
    int _3951 = _3949 + 1;
    int _3953 = _3951 + 1;
    float _3955 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3877);
    int _3957 = ~_3945;
    int _3959 = _3957 + 1;
    int _3961 = _3959 + 1;
    int _3963 = abs(_3849);
    int _3965 = _3823 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    int _3983 = _3953 * as_type<int>(_3809);
    int _3985 = abs(_3265);
    float _3987 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3989 = int(_3987);
    float _3991 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3993 = _3787 + 8;
    uint _3995 = uint(int(uint(_3993) >> uint(2)));
    uint _3997 = uint(int(uint(int(_3995)) >> uint(2)));
    int _3999 = int(_3995) & 3;
    float _4001 = (*spvDescriptorSet0.vp_c9)._m0[int(_3997)][_3999];
    int _4003 = int(_3995) + 1;
    uint _4005 = uint(int(uint(_4003) >> uint(2)));
    int _4007 = _4003 & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = _3961 * as_type<int>(_3839);
    int _4013 = abs(_3703);
    float _4015 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4017 = fma(as_type<float>(_1683), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3991);
    int _4019 = abs(_3761);
    int _4021 = _3869 + 8;
    uint _4023 = uint(int(uint(_4021) >> uint(2)));
    uint _4025 = uint(int(uint(int(_4023)) >> uint(2)));
    int _4027 = int(_4023) & 3;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[int(_4025)][_4027];
    int _4031 = int(_4023) + 1;
    uint _4033 = uint(int(uint(_4031) >> uint(2)));
    int _4035 = _4031 & 3;
    float _4037 = (*spvDescriptorSet0.vp_c9)._m0[int(_4033)][_4035];
    bool _4039 = !_3875;
    int _4041 = _4039 ? 0 : 1;
    float _4043 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4045 = as_type<float>(_1683) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _4047 = ~_3925;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    float _4053 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4055 = fma(_3661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4015);
    int _4057 = abs(_4041);
    float _4059 = fma(_4045, -2.0, _4043);
    int _4061 = ~_3985;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    float _4067 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4069 = int(_4067);
    int _4071 = ~_4013;
    int _4073 = _4071 + 1;
    int _4075 = _4073 + 1;
    float _4077 = fma(_3667, -2.0, _4053);
    int _4079 = _4051 * as_type<int>(_3865);
    int _4081 = ~_4057;
    int _4083 = _4081 + 1;
    int _4085 = _4083 + 1;
    int _4087 = _4065 * as_type<int>(_3893);
    bool _4089 = !_3723;
    int _4091 = _4089 ? 0 : (-1);
    int _4093 = _4075 * as_type<int>(_3857);
    int _4095 = _4093 + _4079;
    bool _4097 = !_3779;
    int _4099 = _4097 ? 0 : (-1);
    int _4101 = _4085 * as_type<int>(_3885);
    int _4103 = _4101 + _4087;
    bool _4105 = _3737 > 0.0;
    float _4107 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4017);
    bool _4109 = _3737 >= 0.0;
    bool _4111 = isnan(_3737);
    bool _4113 = _4109 || _4111;
    bool _4115 = isnan(0.0);
    bool _4117 = _4113 || _4115;
    float _4119 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4059);
    int _4121 = ~_3963;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    float _4127 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4055);
    float _4129 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4077);
    int _4131 = ~_4019;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    int _4137 = _4125 * as_type<int>(_3801);
    int _4139 = _4137 + _3983;
    int _4141 = abs(_2875);
    float _4143 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4145 = abs(_3027);
    int _4147 = _4135 * as_type<int>(_3831);
    int _4149 = _4147 + _4011;
    float _4151 = float(uint(_3771));
    float _4153 = -_4143;
    float _4155 = fma(_3659, 2.0, _4153);
    int _4157 = ~_4141;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    float _4163 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4165 = int(_4163);
    int _4167 = abs(_3719);
    float _4169 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3913);
    int _4171 = ~_4145;
    int _4173 = _4171 + 1;
    int _4175 = _4173 + 1;
    int _4177 = _4161 * as_type<int>(_3935);
    int _4179 = _4177 + _4139;
    int _4181 = abs(_3143);
    float _4183 = -_156;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4155);
    int _4187 = ~_4167;
    int _4189 = _4187 + 1;
    int _4191 = _4189 + 1;
    float _4193 = 1.0 / _4151;
    int _4195 = _4175 * as_type<int>(_3973);
    int _4197 = _4195 + _4095;
    int _4199 = ~_4181;
    int _4201 = _4199 + 1;
    int _4203 = _4201 + 1;
    float _4205 = float(uint(_4069));
    int _4207 = _4191 * as_type<int>(_3943);
    int _4209 = _4207 + _4179;
    int _4211 = abs(_3777);
    int _4213 = _4203 * as_type<int>(_4001);
    int _4215 = _4213 + _4149;
    float _4217 = 1.0 / _4205;
    int _4219 = abs(_2917);
    int _4221 = abs(_3237);
    int _4223 = abs(_4091);
    int _4225 = ~_4219;
    int _4227 = _4225 + 1;
    int _4229 = _4227 + 1;
    float _4231 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4233 = log2(_4231);
    int _4235 = ~_4211;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    int _4241 = ~_4221;
    int _4243 = _4241 + 1;
    int _4245 = _4243 + 1;
    int _4247 = _4209 * _4229;
    int _4249 = ~_4223;
    int _4251 = _4249 + 1;
    int _4253 = _4251 + 1;
    int _4255 = _4239 * as_type<int>(_3981);
    int _4257 = _4255 + _4197;
    int _4259 = abs(_3085);
    int _4261 = _4245 * as_type<int>(_4029);
    int _4263 = _4261 + _4103;
    float _4265 = float(uint(_4165));
    int _4267 = _4253 * as_type<int>(_4009);
    int _4269 = _4267 + _4215;
    int _4271 = as_type<int>(_4193) + (-2);
    int _4273 = _3269 * _4219;
    int _4275 = _4273 + _4247;
    int _4277 = abs(_4099);
    int _4279 = ~_4259;
    int _4281 = _4279 + 1;
    int _4283 = _4281 + 1;
    float _4285 = 1.0 / _4265;
    float _4287 = float(uint(_3989));
    int _4289 = abs(_3187);
    int _4291 = _4283 * _4257;
    int _4293 = abs(_3285);
    float _4295 = _4233 * _156;
    int _4297 = ~_4277;
    int _4299 = _4297 + 1;
    int _4301 = _4299 + 1;
    float _4303 = 1.0 / _4287;
    int _4305 = ~_4293;
    int _4307 = _4305 + 1;
    int _4309 = _4307 + 1;
    int _4311 = _3281 * _4259;
    int _4313 = _4311 + _4291;
    bool _4315 = !_2593;
    float _4317 = _4315 ? as_type<float>(_3919) : as_type<float>(0xffffffffu /* nan */);
    int _4319 = _4301 * as_type<int>(_4037);
    int _4321 = _4319 + _4263;
    float _4323 = float(uint(_4275));
    int _4325 = as_type<int>(_4217) + (-2);
    int _4327 = _4309 * _4321;
    int _4329 = ~_4289;
    int _4331 = _4329 + 1;
    int _4333 = _4331 + 1;
    float _4335 = as_type<float>(_4271) * _4323;
    float _4337 = float(uint(_4313));
    int _4339 = as_type<int>(_4317) * _4293;
    int _4341 = _4339 + _4327;
    int _4343 = as_type<int>(_4285) + (-2);
    int _4345 = _4333 * _4269;
    float _4347 = trunc(_4335);
    float _4349 = precise::max(_4347, 0.0);
    uint _4351 = uint(_4349);
    float _4353 = as_type<float>(_4325) * _4337;
    int _4355 = as_type<int>(_4303) + (-2);
    int _4357 = _3735 * _4289;
    int _4359 = _4357 + _4345;
    float _4361 = float(uint(_4341));
    float _4363 = _4317;
    float _4365 = _3715;
    float _4367 = _3741;
    float _4369 = _3749;
    if (_3669)
    {
        _4363 = _1478;
    }
    float _4371 = _4363;
    float _4373 = float(uint(_4359));
    float _4375 = as_type<float>(_4355) * _4361;
    float _4377 = trunc(_4353);
    float _4379 = precise::max(_4377, 0.0);
    uint _4381 = uint(_4379);
    float _4383 = _4371;
    if (!_3669)
    {
        _4383 = _1669;
    }
    float _4385 = _4383;
    float _4387 = as_type<float>(_4343) * _4373;
    float _4389 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _4391 = ~_3771;
    int _4393 = _4391 + 1;
    float _4395 = _4385 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _4397 = abs(_3771);
    float _4399 = trunc(_4387);
    float _4401 = precise::max(_4399, 0.0);
    uint _4403 = uint(_4401);
    float _4405 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _4407 = _4393 * int(_4351);
    int _4409 = _4407 + _4275;
    float _4411 = fma(_4395, -2.0, _4389);
    int _4413 = ~_4165;
    int _4415 = _4413 + 1;
    float _4417 = -_4405;
    float _4419 = fma(_3715, 2.0, _4417);
    if (_3669)
    {
        _4365 = _1669;
    }
    float _4421 = _4365;
    float _4423 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4411);
    float _4425 = trunc(_4375);
    float _4427 = precise::max(_4425, 0.0);
    uint _4429 = uint(_4427);
    float _4431 = _4421;
    if (!_3669)
    {
        _4431 = _1679;
    }
    float _4433 = _4431;
    float _4435 = -_156;
    float _4437 = fma(_4435, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4419);
    float _4439 = float(uint(_4409));
    float _4441 = float(uint(_4397));
    float _4443 = _4433 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _4445 = abs(_4069);
    int _4447 = _4415 * int(_4403);
    int _4449 = _4447 + _4359;
    float _4451 = as_type<float>(_4271) * _4439;
    int _4453 = ~_4069;
    int _4455 = _4453 + 1;
    float _4457 = 1.0 / _4441;
    int _4459 = ~_3989;
    int _4461 = _4459 + 1;
    float _4463 = float(uint(_4445));
    int _4465 = _4455 * int(_4381);
    int _4467 = _4465 + _4313;
    float _4469 = float(uint(_4449));
    int _4471 = _4461 * int(_4429);
    int _4473 = _4471 + _4341;
    int _4475 = abs(_4165);
    float _4477 = exp2(_4295);
    float _4479 = as_type<float>(_4343) * _4469;
    float _4481 = float(uint(_4475));
    float _4483 = float(uint(_4467));
    float _4485 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4487 = float(uint(_4473));
    float _4489 = 1.0 / _4463;
    int _4491 = abs(_3989);
    float _4493 = as_type<float>(_4325) * _4483;
    int _4495 = abs(_4275);
    float _4497 = -_4485;
    float _4499 = fma(_4443, 2.0, _4497);
    float _4501 = float(uint(_4491));
    float _4503 = as_type<float>(_4355) * _4487;
    int _4505 = as_type<int>(_4457) + (-2);
    float _4507 = 1.0 / _4481;
    float _4509 = float(uint(_4495));
    float _4511 = -_4477;
    float _4513 = _4511 + 1.0;
    float _4515 = -_156;
    float _4517 = fma(_4515, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4499);
    int _4519 = abs(_4313);
    float _4521 = as_type<float>(_4505) * _4509;
    bool _4523 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4525 = isnan(1.0);
    bool _4527 = _4523 || _4525;
    bool _4529 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4531 = _4527 || _4529;
    float _4533 = 1.0 / _4501;
    int _4535 = as_type<int>(_4489) + (-2);
    float _4537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4539 = 1.0 + _4537;
    float _4541 = float(uint(_4519));
    int _4543 = abs(_4359);
    float _4545 = trunc(_4521);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    float _4551 = as_type<float>(_4535) * _4541;
    int _4553 = as_type<int>(_4507) + (-2);
    float _4555 = float(uint(_4543));
    float _4557 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4559 = 1.0 / _4539;
    float _4561 = as_type<float>(_4553) * _4555;
    float _4563 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4565 = abs(_4341);
    float _4567 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _4569 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4571 = isnan(0.0);
    bool _4573 = _4569 || _4571;
    bool _4575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4577 = _4573 || _4575;
    float _4579 = trunc(_4551);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    float _4585 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _4587 = as_type<int>(_4533) + (-2);
    float _4589 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4557);
    float _4591 = float(uint(_4565));
    float _4593 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4563);
    int _4595 = ~_4397;
    int _4597 = _4595 + 1;
    float _4599 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4567);
    float _4601 = trunc(_4561);
    float _4603 = precise::max(_4601, 0.0);
    uint _4605 = uint(_4603);
    float _4607 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4585);
    float _4609 = _4577 ? _4513 : 0.0;
    float _4611 = as_type<float>(_4587) * _4591;
    int _4613 = _4597 * int(_4549);
    int _4615 = _4613 + _4495;
    float _4617 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4589);
    int _4619 = ~_4445;
    int _4621 = _4619 + 1;
    float _4623 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4607);
    float _4625 = trunc(_4451);
    float _4627 = precise::max(_4625, 0.0);
    uint _4629 = uint(_4627);
    float _4631 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4593);
    float _4633 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4599);
    float _4635 = -_156;
    float _4637 = fma(_4635, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3923);
    if (_4531)
    {
        float _4639 = _4609 * _4559;
        _160 = _4639;
    }
    float _4641 = _160;
    int _4643 = ~_4475;
    int _4645 = _4643 + 1;
    int _4647 = _4621 * int(_4583);
    int _4649 = _4647 + _4519;
    float _4651 = float(uint(_4615));
    float _4653 = trunc(_4493);
    float _4655 = precise::max(_4653, 0.0);
    uint _4657 = uint(_4655);
    bool _4659 = _3989 == 0;
    float _4661 = as_type<float>(_4505) * _4651;
    float _4663 = float(uint(_4649));
    float _4665 = trunc(_4611);
    float _4667 = precise::max(_4665, 0.0);
    uint _4669 = uint(_4667);
    int _4671 = int(_4351) + int(_4629);
    int _4673 = ~_4491;
    int _4675 = _4673 + 1;
    float _4677 = trunc(_4479);
    float _4679 = precise::max(_4677, 0.0);
    uint _4681 = uint(_4679);
    int _4683 = int(_4381) + int(_4657);
    float _4685 = as_type<float>(_4535) * _4663;
    int _4687 = ~_3989;
    int _4689 = _4687 + 1;
    float _4691 = trunc(_4503);
    float _4693 = precise::max(_4691, 0.0);
    uint _4695 = uint(_4693);
    int _4697 = _4645 * int(_4605);
    int _4699 = _4697 + _4543;
    float _4701 = float(uint(_4699));
    int _4703 = _4675 * int(_4669);
    int _4705 = _4703 + _4565;
    float _4707 = trunc(_4661);
    float _4709 = precise::max(_4707, 0.0);
    uint _4711 = uint(_4709);
    int _4713 = int(_4403) + int(_4681);
    float _4715 = as_type<float>(_4553) * _4701;
    int _4717 = ~_3771;
    int _4719 = _4717 + 1;
    int _4721 = ~_4069;
    int _4723 = _4721 + 1;
    float _4725 = trunc(_4685);
    float _4727 = precise::max(_4725, 0.0);
    uint _4729 = uint(_4727);
    int _4731 = int(_4429) + int(_4695);
    int _4733 = _4719 * _4671;
    int _4735 = _4733 + _4275;
    int _4737 = ~_4165;
    int _4739 = _4737 + 1;
    float _4741 = float(uint(_4705));
    float _4743 = trunc(_4715);
    float _4745 = precise::max(_4743, 0.0);
    uint _4747 = uint(_4745);
    float _4749 = as_type<float>(_4587) * _4741;
    bool _4751 = uint(_4735) >= uint(_3771);
    int _4753 = _4723 * _4683;
    int _4755 = _4753 + _4313;
    int _4757 = int(_4549) + int(_4711);
    int _4759 = _4739 * _4713;
    int _4761 = _4759 + _4359;
    float _4763 = trunc(_4749);
    float _4765 = precise::max(_4763, 0.0);
    uint _4767 = uint(_4765);
    bool _4769 = uint(_4755) >= uint(_4069);
    int _4771 = int(_4583) + int(_4729);
    int _4773 = _4689 * _4731;
    int _4775 = _4773 + _4341;
    bool _4777 = !_4751;
    int _4779 = _4777 ? 0 : (-1);
    bool _4781 = uint(_4761) >= uint(_4165);
    float _4783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4785 = ~_4397;
    int _4787 = _4785 + 1;
    int _4789 = int(_4605) + int(_4747);
    bool _4791 = !_4769;
    int _4793 = _4791 ? 0 : (-1);
    int _4795 = ~_4445;
    int _4797 = _4795 + 1;
    bool _4799 = uint(_4775) >= uint(_3989);
    int _4801 = ~_4475;
    int _4803 = _4801 + 1;
    int _4805 = _4787 * _4757;
    int _4807 = _4805 + _4495;
    int _4809 = ~_4491;
    int _4811 = _4809 + 1;
    int _4813 = _4797 * _4771;
    int _4815 = _4813 + _4519;
    int _4817 = int(_4669) + int(_4767);
    int _4819 = _4803 * _4789;
    int _4821 = _4819 + _4543;
    bool _4823 = !_4781;
    int _4825 = _4823 ? 0 : (-1);
    bool _4827 = uint(_4807) >= uint(_4397);
    int _4829 = _4811 * _4817;
    int _4831 = _4829 + _4565;
    bool _4833 = !_4799;
    int _4835 = _4833 ? 0 : (-1);
    bool _4837 = uint(_4815) >= uint(_4445);
    bool _4839 = !_4827;
    int _4841 = _4839 ? 0 : (-1);
    int _4843 = ~_4671;
    int _4845 = _4843 + _4779;
    int _4847 = _4845 + 1;
    int _4849 = ~_4731;
    int _4851 = _4849 + _4835;
    int _4853 = _4851 + 1;
    bool _4855 = uint(_4821) >= uint(_4475);
    bool _4857 = !_4837;
    int _4859 = _4857 ? 0 : (-1);
    int _4861 = _3989 * _4853;
    int _4863 = _4861 + _4341;
    bool _4865 = uint(_4831) >= uint(_4491);
    int _4867 = _3771 * _4847;
    int _4869 = _4867 + _4275;
    int _4871 = ~_4713;
    int _4873 = _4871 + _4825;
    int _4875 = _4873 + 1;
    float _4877 = _1679 * 2.0;
    bool _4879 = !_4855;
    int _4881 = _4879 ? 0 : (-1);
    int _4883 = ~_4683;
    int _4885 = _4883 + _4793;
    int _4887 = _4885 + 1;
    int _4889 = _4165 * _4875;
    int _4891 = _4889 + _4359;
    bool _4893 = _3771 == 0;
    float _4895 = floor(_4877);
    bool _4897 = !_4865;
    int _4899 = _4897 ? 0 : (-1);
    int _4901 = _4069 * _4887;
    int _4903 = _4901 + _4313;
    bool _4905 = !_4893;
    int _4907 = _4905 ? _4869 : (-1);
    bool _4909 = !_4659;
    int _4911 = _4909 ? _4863 : (-1);
    bool _4913 = _4069 == 0;
    bool _4915 = _4165 == 0;
    bool _4917 = _4069 == 0;
    int _4919 = _4275 ^ _3771;
    int _4921 = _4313 ^ _4069;
    bool _4923 = !_4915;
    int _4925 = _4923 ? _4891 : (-1);
    int _4927 = ~_4841;
    int _4929 = _4757 + _4927;
    int _4931 = _4929 + 1;
    float _4933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4935 = _3445 + _4933;
    uint _4937 = uint(int(uint(_4919) >> uint(31)));
    uint _4939 = uint(int(uint(_4921) >> uint(31)));
    float _4941 = _4935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4943 = ~_4859;
    int _4945 = _4771 + _4943;
    int _4947 = _4945 + 1;
    float _4949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4951 = _3641 + _4949;
    int _4953 = ~int(_4937);
    int _4955 = _4953 + 1;
    float _4957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4959 = _3647 + _4957;
    int _4961 = ~int(_4939);
    int _4963 = _4961 + 1;
    float _4965 = fma(_4951, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4941);
    int _4967 = _4931 ^ _4955;
    float _4969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4971 = _4947 ^ _4963;
    float _4973 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4965);
    bool _4975 = !_4913;
    int _4977 = _4975 ? _4903 : (-1);
    bool _4979 = _3771 == 0;
    int _4981 = ~_4955;
    int _4983 = _4981 + _4967;
    int _4985 = _4983 + 1;
    float _4987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4989 = ~_4963;
    int _4991 = _4989 + _4971;
    int _4993 = _4991 + 1;
    bool _4995 = !_4979;
    int _4997 = _4995 ? _4985 : (-1);
    bool _4999 = !_4917;
    int _5001 = _4999 ? _4993 : (-1);
    bool _5003 = _4973 >= 0.0;
    float _5005 = _4969 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5007 = _4359 ^ _4165;
    bool _5009 = _3989 == 0;
    float _5011 = fma(_5005, _2957, -0.5);
    int _5013 = _4341 ^ _3989;
    uint _5015 = uint(int(uint(_5007) >> uint(31)));
    float _5017 = _4987 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _5019 = uint(int(uint(_5013) >> uint(31)));
    float _5021 = _4783 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _5023 = ~_4881;
    int _5025 = _4789 + _5023;
    int _5027 = _5025 + 1;
    float _5029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5031 = ~int(_5015);
    int _5033 = _5031 + 1;
    float _5035 = fma(_5021, _3675, -0.5);
    int _5037 = ~_4899;
    int _5039 = _4817 + _5037;
    int _5041 = _5039 + 1;
    float _5043 = fma(_5017, _1961, -0.5);
    int _5045 = ~int(_5019);
    int _5047 = _5045 + 1;
    float _5049 = -_4169;
    float _5051 = fma(_3955, _5035, _5049);
    int _5053 = _4117 ? 0 : 1;
    float _5055 = _4895;
    int _5057 = _5047;
    if (_5003)
    {
        out.m_49.x = 0.0;
    }
    bool _5059 = _4895 > 0.0;
    float _5061 = _5051 + 0.5;
    bool _5063 = _4895 >= 0.0;
    bool _5065 = isnan(_4895);
    bool _5067 = _5063 || _5065;
    bool _5069 = isnan(0.0);
    bool _5071 = _5067 || _5069;
    int _5073 = _5027 ^ _5033;
    int _5075 = _5041 ^ _5047;
    float _5077 = _5029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_5003)
    {
        _5055 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5079 = _5055;
    int _5081 = ~_5053;
    int _5083 = _5081 + 1;
    int _5085 = _5083 + 1;
    float _5087 = fma(_5077, _3411, -0.5);
    int _5089 = ~_5033;
    int _5091 = _5089 + _5073;
    int _5093 = _5091 + 1;
    int _5095 = _5085;
    if (!_4105)
    {
        int _5097 = ~_5053;
        int _5099 = _5097 + 1;
        _5095 = _5099;
    }
    int _5101 = _5095;
    int _5103 = ~_5047;
    int _5105 = _5103 + _5075;
    int _5107 = _5105 + 1;
    float _5109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_5003)
    {
        float _5111 = _5079 * 5.0;
        _5057 = as_type<int>(_5111);
    }
    int _5113 = _5057;
    float _5115 = fma(_3947, _3671, _4637);
    bool _5117 = _4165 == 0;
    float _5119 = _5115 + 0.5;
    int _5121 = _5071 ? 0 : 1;
    if (_5003)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14276 = as_type<float>(_5113);
        out.gl_Position.z = _14276;
    }
    bool _5123 = !_5117;
    int _5125 = _5123 ? _5093 : (-1);
    float _5127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5129 = !_5009;
    int _5131 = _5129 ? _5107 : (-1);
    out.m_71.x = _5119;
    out.m_71.y = _5061;
    int _5133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _5135 = _5133 != 0;
    int _5137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _5139 = _5137 != 0;
    int _5141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _5143 = _5141 != 0;
    float _5145 = float(_4997);
    float _5147 = _5109 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5149 = ~_5121;
    int _5151 = _5149 + 1;
    int _5153 = _5151 + 1;
    int _5155 = _5153;
    if (!_5059)
    {
        int _5157 = ~_5121;
        int _5159 = _5157 + 1;
        _5155 = _5159;
    }
    int _5161 = _5155;
    float _5163 = _3753 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5165 = float(_4977);
    float _5167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5169 = float(_4925);
    float _5171 = fma(_5147, _2025, -0.5);
    float _5173 = fma(_5163, _2071, -0.5);
    float _5175 = fma(_5147, _5165, _4185);
    float _5177 = -_3297;
    float _5179 = fma(_5005, _5145, _5177);
    float _5181 = fma(_5163, _5169, _4517);
    float _5183 = float(_5125);
    float _5185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5187 = fma(_3843, _5171, _5175);
    float _5189 = fma(_4633, _5173, _5181);
    float _5191 = float(_5131);
    float _5193 = _4935 * _4935;
    bool _5195 = !_5135;
    int _5197 = _5195 ? 0 : 1;
    float _5199 = fma(_4617, _5011, _5179);
    float _5201 = _5187 + 0.5;
    float _5203 = _5167 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5205 = abs(_5197);
    float _5207 = _5127 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5209 = float(_4907);
    float _5211 = -_4119;
    float _5213 = fma(_5203, _5191, _5211);
    float _5215 = float(_5205);
    float _5217 = fma(_5207, _2065, -0.5);
    float _5219 = float(_4911);
    float _5221 = _5185 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5223 = float(_5001);
    float _5225 = fma(_5017, _5209, _3731);
    float _5227 = _5199 + 0.5;
    float _5229 = -_4423;
    float _5231 = fma(_5221, _5183, _5229);
    float _5233 = fma(_5221, _3443, -0.5);
    float _5235 = fma(_4951, _4951, _5193);
    float _5237 = fma(_5203, _3573, -0.5);
    float _5239 = fma(_5207, _5219, _4437);
    float _5241 = -_4129;
    float _5243 = fma(_5077, _5223, _5241);
    float _5245 = fma(_4959, _4959, _5235);
    float _5247 = fma(_4107, _5237, _5213);
    float _5249 = float(_5161);
    float _5251 = fma(_4631, _5043, _5225);
    float _5253 = fma(_3725, _5217, _5239);
    float _5255 = _5247 + 0.5;
    float _5257 = rsqrt(_5245);
    float _5259 = _5215 * _5249;
    float _5261 = fma(_4127, _5087, _5243);
    float _5263 = in.m_73.x;
    float _5265 = in.m_73.y;
    float _5267 = in.m_73.z;
    float _5269 = fma(_4623, _5233, _5231);
    float _5271 = _5189 + 0.5;
    float _5273 = _5253 + 0.5;
    float _5275 = _5251 + 0.5;
    float _5277 = _5261 + 0.5;
    float _5279 = _5269 + 0.5;
    bool _5281 = !_5139;
    int _5283 = _5281 ? 0 : 1;
    out.m_75.x = _5273;
    out.m_75.y = _5255;
    bool _5285 = !_5143;
    int _5287 = _5285 ? 0 : 1;
    int _5289 = abs(_5283);
    out.m_77.x = _5275;
    out.m_77.y = _5227;
    out.m_77.z = _5201;
    out.m_77.w = _5277;
    float _5291 = _4935 * _5257;
    float _5293 = _4951 * _5257;
    out.m_79.x = _5271;
    out.m_79.y = _5279;
    float _5295 = _5181;
    if (_5003)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5297 = -_5291;
    float _5299 = fma(_5297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    float _5301 = -_5293;
    float _5303 = fma(_5301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3641);
    float _5305 = _4959 * _5257;
    float _5307 = float(_5101);
    float _5309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5311 = _5299 + _5309;
    float _5313 = float(_5289);
    float _5315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5317 = _5303 + _5315;
    int _5319 = _3489 ? 0 : 1;
    float _5321 = _5311 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5323 = _5259 * (-2.0);
    float _5325 = -_5305;
    float _5327 = fma(_5325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3647);
    float _5329 = _5313 * _5307;
    float _5331 = fma(_5317, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5321);
    float _5333 = fma(_5323, _5263, _5263);
    float _5335 = _1669 + (-0.5);
    float _5337 = _1478 + _1679;
    float _5339 = fma(_3711, _5323, _3711);
    float _5341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5343 = _5327 + _5341;
    float _5345 = fma(_5335, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5333);
    float _5347 = _5337 + (-1.0);
    float _5349 = _5329 * (-2.0);
    float _5351 = fma(_5343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5331);
    float _5353 = fma(_5339, _4641, _5345);
    float _5355 = fma(_5347, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5357 = _1478 + (-0.5);
    float _5359 = fma(_5349, _5265, _5265);
    bool _5361 = _5351 >= 0.0;
    float _5363 = fma(_5355, _5349, _5355);
    int _5365 = abs(_5287);
    float _5367 = fma(_5357, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5359);
    float _5369 = _5353 * 0.15915493667125701904296875;
    int _5371 = ~_5319;
    int _5373 = _5371 + 1;
    int _5375 = _5373 + 1;
    float _5377 = _1669 + _1679;
    float _5379 = fma(_5363, _4641, _5367);
    int _5381 = _5375;
    float _5383 = _5331;
    if (!_3477)
    {
        int _5385 = ~_5319;
        int _5387 = _5385 + 1;
        _5381 = _5387;
    }
    int _5389 = _5381;
    float _5391 = _5369 * 6.283185482025146484375;
    float _5393 = sin(_5391);
    float _5395 = _5379 * 0.15915493667125701904296875;
    float _5397 = float(_5389);
    if (_5361)
    {
        _5383 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5399 = _5383;
    int _5401 = as_type<int>(_5399);
    if (_5361)
    {
        out.m_49.x = 0.0;
    }
    float _5403 = float(_5365);
    float _5405 = _5369 * 6.283185482025146484375;
    float _5407 = cos(_5405);
    if (_5361)
    {
        float _5409 = _5399 * 5.0;
        _5401 = as_type<int>(_5409);
    }
    int _5411 = _5401;
    float _5413 = _5377 + (-1.0);
    float _5415 = _5403 * _5397;
    if (_5361)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14738 = as_type<float>(_5411);
        out.gl_Position.z = _14738;
    }
    float _5417 = _5395 * 6.283185482025146484375;
    float _5419 = sin(_5417);
    float _5421 = _5415 * (-2.0);
    if (_5361)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5423 = -_3445;
    float _5425 = _5423 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5427 = -_3641;
    float _5429 = _5427 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5431 = fma(_5413, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5433 = fma(_5421, _5267, _5267);
    float _5435 = _5425 * _5425;
    float _5437 = _1679 + (-0.5);
    float _5439 = -_3647;
    float _5441 = _5439 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5443 = fma(_5431, _5421, _5431);
    float _5445 = fma(_5429, _5429, _5435);
    float _5447 = fma(_5437, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5433);
    float _5449 = -_5291;
    float _5451 = fma(_5449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4935);
    float _5453 = _5395 * 6.283185482025146484375;
    float _5455 = cos(_5453);
    float _5457 = fma(_5441, _5441, _5445);
    float _5459 = fma(_5443, _4641, _5447);
    float _5461 = -_5293;
    float _5463 = fma(_5461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4951);
    float _5465 = -_5305;
    float _5467 = fma(_5465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4959);
    float _5469 = _5393 * _5419;
    float _5471 = _5459 * 0.15915493667125701904296875;
    float _5473 = _5451 * _5451;
    float _5475 = rsqrt(_5457);
    float _5477 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5479 = _5407 * _5419;
    float _5481 = fma(_5463, _5463, _5473);
    float _5483 = fma(_5467, _5467, _5481);
    float _5485 = _5471 * 6.283185482025146484375;
    float _5487 = sin(_5485);
    float _5489 = _5407 * _5455;
    float _5491 = _5429 * _5475;
    float _5493 = sqrt(_5483);
    float _5495 = _5441 * _5475;
    float _5497 = in.m_81.x;
    float _5499 = in.m_81.y;
    float _5501 = in.m_81.z;
    float _5503 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5505 = _5491 * _5503;
    float _5507 = _5425 * _5475;
    float _5509 = fma(_5487, _5489, _5469);
    float _5511 = fma(_5487, _5469, _5489);
    float _5513 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5515 = _5495 * _5513;
    float _5517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5519 = -_5505;
    float _5521 = fma(_5495, _5517, _5519);
    float _5523 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5525 = _5507 * _5523;
    float _5527 = _5471 * 6.283185482025146484375;
    float _5529 = cos(_5527);
    float _5531 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5533 = -_5515;
    float _5535 = fma(_5507, _5531, _5533);
    float _5537 = _5521 * _5521;
    float _5539 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5541 = -_5525;
    float _5543 = fma(_5491, _5539, _5541);
    float _5545 = _5257 * _5493;
    float _5547 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5549 = fma(_5535, _5535, _5537);
    float _5551 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5553 = _5545 * _5547;
    float _5555 = fma(_5543, _5543, _5549);
    float _5557 = _5545 * _5551;
    float _5559 = _5545 * _5477;
    float _5561 = rsqrt(_5555);
    float _5563 = _5393 * _5455;
    float _5565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5499);
    float _5567 = _5407 * _5529;
    float _5569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5501);
    float _5571 = -_5479;
    float _5573 = fma(_5487, _5563, _5571);
    float _5575 = _5559 * _5565;
    float _5577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5497);
    float _5579 = -_5563;
    float _5581 = fma(_5487, _5479, _5579);
    float _5583 = _5455 * _5529;
    float _5585 = _5393 * _5529;
    float _5587 = _5557 * _5577;
    float _5589 = _5567 * _5575;
    float _5591 = _5553 * _5569;
    float _5593 = -_5575;
    float _5595 = _5487 * _5593;
    float _5597 = _5585 * _5575;
    float _5599 = _5535 * _5561;
    float _5601 = _5521 * _5561;
    float _5603 = fma(_5509, _5587, _5589);
    float _5605 = fma(_5583, _5587, _5595);
    float _5607 = _5507 * _5599;
    float _5609 = _5419 * _5529;
    float _5611 = _5543 * _5561;
    float _5613 = fma(_5581, _5591, _5603);
    float _5615 = _5495 * _5601;
    float _5617 = -_5607;
    float _5619 = fma(_5491, _5601, _5617);
    float _5621 = fma(_5573, _5587, _5597);
    float _5623 = fma(_5609, _5591, _5605);
    float _5625 = -_5615;
    float _5627 = fma(_5507, _5611, _5625);
    float _5629 = _5619 * _5613;
    float _5631 = fma(_5511, _5591, _5621);
    float _5633 = _5491 * _5611;
    float _5635 = _5627 * _5613;
    float _5637 = fma(_5611, _5623, _5629);
    float _5639 = -_5633;
    float _5641 = fma(_5495, _5599, _5639);
    float _5643 = fma(_5599, _5623, _5635);
    float _5645 = fma(_5495, _5631, _5637);
    float _5647 = _5641 * _5613;
    float _5649 = fma(_5491, _5631, _5643);
    float _5651 = _3647 + _5645;
    float _5653 = _3641 + _5649;
    float _5655 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5657 = _5651 + _5655;
    float _5659 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5661 = _5653 + _5659;
    float _5663 = _5657 * _5657;
    float _5665 = fma(_5661, _5661, _5663);
    float _5667 = fma(_5601, _5623, _5647);
    float _5669 = sqrt(_5665);
    float _5671 = fma(_5507, _5631, _5667);
    float _5673 = _3445 + _5671;
    bool _5675 = _5669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5677 = _5631;
    float _5679 = _5671;
    float _5681 = _5653;
    float _5683 = _5665;
    if (!_5675)
    {
        _5677 = _5651;
    }
    float _5685 = _5677;
    float _5687 = _5685;
    if (!_5675)
    {
        _5679 = _5673;
    }
    float _5689 = _5679;
    bool _5691 = !_5675;
    float _5693 = _5689;
    if (!_5691)
    {
        float _5695 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5699 = _5669 + _5697;
        float _5701 = _5673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5703 = rsqrt(_5665);
        float _5705 = _5699 * _5695;
        float _5707 = _5705 * 0.15915493667125701904296875;
        float _5709 = _5707 * 6.283185482025146484375;
        float _5711 = cos(_5709);
        float _5713 = _5707 * 6.283185482025146484375;
        float _5715 = sin(_5713);
        float _5717 = _5711 + (-1.0);
        float _5719 = _5717 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5721 = fma(_5715, _5701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5723 = fma(_5673, _5711, _5719);
        float _5725 = _5703 * _5721;
        float _5727 = fma(_5661, _5725, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5729 = fma(_5657, _5725, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5693 = _5723;
        _5681 = _5727;
        _5687 = _5729;
    }
    float _5731 = _5693;
    float _5733 = _5681;
    float _5735 = _5687;
    float _5737 = -_3445;
    float _5739 = _5737 + _5731;
    float _5741 = -_3641;
    float _5743 = _5741 + _5733;
    float _5745 = -_3647;
    float _5747 = _5745 + _5735;
    float _5749 = _5739 * _5739;
    float _5751 = fma(_5743, _5743, _5749);
    float _5753 = fma(_5747, _5747, _5751);
    float _5755 = sqrt(_5753);
    bool _5757 = _5755 > 0.0;
    bool _5759 = !_5757;
    float _5761 = _5731;
    float _5763 = _5733;
    float _5765 = _5735;
    float _5767 = _5739;
    float _5769 = _5755;
    if (!_5759)
    {
        float _5771 = _200 * _200;
        float _5773 = rsqrt(_5753);
        float _5775 = fma(_198, _198, _5771);
        float _5777 = fma(_202, _202, _5775);
        float _5779 = sqrt(_5777);
        float _5781 = _5743 * _5773;
        float _5783 = _5739 * _5773;
        float _5785 = _5747 * _5773;
        bool _5787 = _5779 > 0.0;
        bool _5789 = !_5787;
        _5767 = _5783;
        _5769 = _5779;
        if (!_5789)
        {
            float _5791 = rsqrt(_5777);
            float _5793 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5795 = _200 * _5791;
            float _5797 = _198 * _5791;
            float _5799 = _5783 * _5795;
            float _5801 = _202 * _5791;
            float _5803 = fma(_5781, _5797, _5799);
            float _5805 = _5793 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5807 = fma(_5785, _5801, _5803);
            float _5809 = _5807 * _5805;
            float _5811 = fma(_198, _5809, _5733);
            float _5813 = fma(_200, _5809, _5731);
            float _5815 = fma(_202, _5809, _5735);
            _5761 = _5813;
            _5763 = _5811;
            _5765 = _5815;
            _5767 = _5803;
            _5769 = _5809;
        }
    }
    float _5817 = _5761;
    float _5819 = _5763;
    float _5821 = _5765;
    float _5823 = _5767;
    float _5825 = _5769;
    float _5827 = -_5291;
    float _5829 = fma(_5827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5817);
    float _5831 = -_5293;
    float _5833 = fma(_5831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5819);
    float _5835 = -_5305;
    float _5837 = fma(_5835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5821);
    float _5839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5841 = _5829 + _5839;
    float _5843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5845 = _5833 + _5843;
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5849 = _5837 + _5847;
    float _5851 = _5841 * _5841;
    float _5853 = fma(_5845, _5845, _5851);
    float _5855 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5857 = fma(_5849, _5849, _5853);
    float _5859 = rsqrt(_5857);
    float _5861 = sqrt(_5857);
    float _5863 = _5859 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5865 = _5845 * _5863;
    float _5867 = _5849 * _5863;
    float _5869 = _5865 * _5865;
    float _5871 = _5867 * _5867;
    float _5873 = _5869 + _5871;
    float _5875 = sqrt(_5873);
    bool _5877 = _5875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5881 = _5875 + _5879;
    float _5883 = _5859;
    float _5885 = _5873;
    float _5887 = _5881;
    float _5889 = _5823;
    if (_5877)
    {
        float _5891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5883 = _5891;
    }
    float _5893 = _5883;
    if (_5877)
    {
        float _5895 = rsqrt(_5873);
        _5885 = _5895;
    }
    float _5897 = _5885;
    if (_5877)
    {
        float _5899 = _5881 * _5893;
        _5887 = _5899;
    }
    float _5901 = _5887;
    if (_5877)
    {
        float _5903 = _5901 * 0.15915493667125701904296875;
        _5889 = _5903;
    }
    float _5905 = _5889;
    float _5907 = _5849;
    float _5909 = _5905;
    if (_5877)
    {
        float _5911 = _5905 * 6.283185482025146484375;
        float _5913 = sin(_5911);
        _5907 = _5913;
    }
    float _5915 = _5907;
    float _5917 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5919 = precise::max(0.0, _5917);
    float _5921 = _5825;
    float _5923 = _5919;
    if (_5877)
    {
        float _5925 = _5905 * 6.283185482025146484375;
        float _5927 = cos(_5925);
        _5921 = _5927;
    }
    float _5929 = _5921;
    float _5931 = -_5863;
    float _5933 = -_5919;
    float _5935 = fma(_5841, _5931, _5933);
    float _5937 = fma(_5303, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5939 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _5941 = _5935;
    if (_5877)
    {
        float _5943 = _5935 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5923 = _5943;
    }
    float _5945 = _5923;
    float _5947 = floor(_5937);
    float _5949 = _5945;
    float _5951 = _5915;
    if (_5877)
    {
        float _5953 = fma(_5915, _5945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5949 = _5953;
    }
    float _5955 = _5949;
    float _5957 = _5955;
    if (!_5877)
    {
        _5951 = _5865;
    }
    float _5959 = _5951;
    float _5961 = _5959;
    float _5963 = _5929;
    if (_5877)
    {
        float _5965 = _5929 + (-1.0);
        _5939 = _5965;
    }
    float _5967 = _5939;
    float _5969 = _5967;
    if (_5877)
    {
        float _5971 = _5897 * _5955;
        _5683 = _5971;
    }
    float _5973 = _5683;
    if (!_5877)
    {
        _5957 = _5869;
    }
    float _5975 = _5957;
    float _5977 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5979 = _5975;
    if (_5877)
    {
        float _5981 = _5967 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5909 = _5981;
    }
    float _5983 = _5909;
    if (_5877)
    {
        float _5985 = _5865 * _5973;
        _5961 = _5985;
    }
    float _5987 = _5961;
    if (!_5877)
    {
        _5969 = _5867;
    }
    float _5989 = _5969;
    float _5991 = _5989;
    if (_5877)
    {
        float _5993 = _5867 * _5973;
        _5991 = _5993;
    }
    float _5995 = _5991;
    if (_5877)
    {
        float _5997 = fma(_5935, _5929, _5983);
        _5941 = _5997;
    }
    float _5999 = _5941;
    if (_5877)
    {
        float _6001 = _5987 * _5987;
        _5979 = _6001;
    }
    float _6003 = _5979;
    float _6005 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_5877)
    {
        _5963 = _5871;
    }
    float _6007 = _5963;
    float _6009 = _6007;
    if (_5877)
    {
        float _6011 = _5995 * _5995;
        _6009 = _6011;
    }
    float _6013 = _6009;
    float _6015 = fma(_5999, _5999, _6003);
    float _6017 = fma(_5327, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6019 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6021 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6005);
    float _6023 = _6015 + _6013;
    float _6025 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6027 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6019);
    float _6029 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6021);
    float _6031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6033 = fma(_5861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6031);
    float _6035 = precise::clamp(_6033, 0.0, 1.0);
    float _6037 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6025);
    float _6039 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6027);
    float _6041 = rsqrt(_6023);
    float _6043 = _6029 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6045 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6037);
    float _6047 = _6039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6049 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5977);
    float _6051 = -_6035;
    float _6053 = _6051 + 1.0;
    float _6055 = _6045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6057 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6059 = _6043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6061 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6049);
    float _6063 = floor(_6017);
    float _6065 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6057);
    float _6067 = -_6059;
    float _6069 = fma(_6067, _5855, 1.0);
    float _6071 = _6061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6073 = -_5947;
    float _6075 = _5937 + _6073;
    float _6077 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6065);
    float _6079 = _6041 * _5987;
    float _6081 = _6041 * _5999;
    float _6083 = abs(_6053);
    float _6085 = log2(_6083);
    float _6087 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6077);
    float _6089 = _6079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6091 = _6041 * _5995;
    float _6093 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6095 = -_6089;
    float _6097 = fma(_6081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6095);
    float _6099 = log2(_6069);
    float _6101 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6093);
    float _6103 = -_6091;
    float _6105 = fma(_6103, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6097);
    float _6107 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6109 = -_6063;
    float _6111 = _6017 + _6109;
    float _6113 = fma(_6105, -0.5, 0.5);
    float _6115 = fma(_6105, 0.5, 0.5);
    float _6117 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6119 = 1.0 / _6087;
    float _6121 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6107);
    float _6123 = fma(_6115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6125 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6101);
    float _6127 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6121);
    float _6129 = fma(_6115, _6123, -0.212114393711090087890625);
    float _6131 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6125);
    float _6133 = exp2(_6117);
    float _6135 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6127);
    float _6137 = fma(_6115, _6129, 1.570728778839111328125);
    float _6139 = _6099 * 0.693147182464599609375;
    float _6141 = sqrt(_6113);
    float _6143 = _6081 + 1.0;
    float _6145 = _6135 * _6119;
    float _6147 = _6131 * _6119;
    float _6149 = _6139 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6151 = fma(_6145, 0.5, 0.5);
    float _6153 = -_6081;
    float _6155 = fma(_6133, _6143, _6153);
    float _6157 = fma(_6147, -0.5, 0.5);
    float _6159 = fma(_6155, 0.5, 0.5);
    float _6161 = _6141 * 0.636619746685028076171875;
    float2 _15933 = float2(_6075, _6111);
    float _6163 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15933, float2(0.0), isnan(_15933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15933, float2(0.0), isnan(_15933)), level(0.0)).x;
    float3 _15944 = float3(_6151, _6157, _6149);
    float _6165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15944, float3(0.0), isnan(_15944)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15944, float3(0.0), isnan(_15944)), level(0.0)).x;
    float _6167 = -_6137;
    float _6169 = fma(_6161, _6167, 1.0);
    float3 _15960 = float3(_6151, _6157, _6149);
    float4 _6172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15960, float3(0.0), isnan(_15960)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15960, float3(0.0), isnan(_15960)), level(0.0)).xyzw;
    float _6174 = _6172.x;
    float _6176 = _6172.y;
    float _6178 = _6172.z;
    float _6180 = _6172.w;
    float2 _15976 = float2(_6169, _6159);
    float3 _6184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15976, float2(0.0), isnan(_15976)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15976, float2(0.0), isnan(_15976)), level(0.0)).xyz;
    float _6186 = _6184.x;
    float _6188 = _6184.y;
    float _6190 = _6184.z;
    float _6192 = _5299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _6194 = _5499 != 0.0;
    bool _6196 = isnan(_5499);
    bool _6198 = _6194 || _6196;
    bool _6200 = isnan(0.0);
    bool _6202 = _6198 || _6200;
    float _6204 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6206 = fma(_5303, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6192);
    bool _6208 = _5497 == 0.0;
    bool _6210 = !_6202;
    bool _6212 = _6208 && _6210;
    float _6214 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6216 = fma(_5327, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6206);
    float _6218 = _5299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6220 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6204);
    float _6222 = _6216 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6224 = fma(_5303, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6218);
    bool _6226 = _5501 == 0.0;
    bool _6228 = _6226 && _6212;
    float _6230 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6220);
    float _6232 = 1.0 / _6222;
    float _6234 = fma(_5327, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6224);
    float _6236 = _6234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6238 = exp2(_6214);
    float _6240 = _6236 + _6222;
    float _6242 = in.m_83.x;
    float _6244 = in.m_83.y;
    float _6246 = in.m_83.z;
    float _6248 = in.m_83.w;
    float _6250 = _6240 * _6232;
    float _6252 = _6250 * 0.5;
    float _6254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6256 = fma(_6252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6254);
    float _6258 = in.m_85.x;
    float _6260 = in.m_85.y;
    float _6262 = in.m_85.z;
    float _6264 = 1.0 / _6256;
    float _6266 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6268 = _6264 * _6266;
    float _6270 = abs(_6268);
    float _6272 = log2(_6270);
    float _6274 = _6264;
    float _6276 = _6087;
    if (_6228)
    {
        _4367 = _6260;
    }
    float _6278 = _4367;
    float _6280 = _6278;
    if (_6228)
    {
        _3651 = _6258;
    }
    float _6282 = _3651;
    float _6284 = _6282;
    if (_6228)
    {
        _5295 = _6262;
    }
    float _6286 = _5295;
    float _6288 = _6286;
    if (_6228)
    {
        _4369 = _6278;
    }
    float _6290 = _4369;
    float _6292 = _6290;
    if (_6228)
    {
        _6274 = _6282;
    }
    float _6294 = _6274;
    float _6296 = _6294;
    if (!_6228)
    {
        _6280 = _6260;
    }
    float _6298 = _6280;
    if (!_6228)
    {
        _6284 = _6258;
    }
    float _6300 = _6284;
    float _6302 = _6272 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6304 = _6272;
    if (_6228)
    {
        _6304 = _6286;
    }
    float _6306 = _6304;
    float _6308 = _6306;
    if (!_6228)
    {
        float _6310 = fma(_5499, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6298);
        _6292 = _6310;
    }
    float _6312 = _6292;
    if (!_6228)
    {
        _6288 = _6262;
    }
    float _6314 = _6288;
    if (!_6228)
    {
        float _6316 = fma(_5497, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6300);
        _6296 = _6316;
    }
    float _6318 = _6296;
    float _6320 = _6246 * _6300;
    float _6322 = exp2(_6302);
    float _6324 = _6242 * _6298;
    float _6326 = _6244 * _6314;
    float _6328 = -_6320;
    float _6330 = fma(_6242, _6314, _6328);
    if (!_6228)
    {
        float _6332 = fma(_5501, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6314);
        _6308 = _6332;
    }
    float _6334 = _6308;
    float _6336 = -_6324;
    float _6338 = fma(_6244, _6300, _6336);
    float _6340 = -_6326;
    float _6342 = fma(_6246, _6298, _6340);
    float _6344 = _6330 * _6248;
    float _6346 = _5509 * _5619;
    float _6348 = _6338 * _6248;
    float _6350 = _6342 * _6248;
    float _6352 = _5567 * _5627;
    float _6354 = _5581 * _5627;
    float _6356 = fma(_5583, _5611, _6346);
    bool _6358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6360 = isnan(0.5);
    bool _6362 = _6358 || _6360;
    bool _6364 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6366 = _6362 || _6364;
    float _6368 = fma(_6322, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6370 = precise::clamp(_6368, 0.0, 1.0);
    float _6372 = _5581 * _5641;
    float _6374 = _5581 * _5619;
    float _6376 = fma(_6370, -2.0, 3.0);
    float _6378 = _6370 * _6370;
    float _6380 = fma(_5609, _5601, _6372);
    float _6382 = _6378 * _6376;
    float _6384 = _5509 * _5627;
    float _6386 = _5509 * _5641;
    float _6388 = _5567 * _5641;
    float _6390 = _5567 * _5619;
    float _6392 = fma(_5583, _5599, _6384);
    float _6394 = fma(_5583, _5601, _6386);
    float _6396 = -_5487;
    float _6398 = fma(_6396, _5599, _6352);
    float _6400 = fma(_5609, _5599, _6354);
    float _6402 = -_5487;
    float _6404 = fma(_6402, _5601, _6388);
    float _6406 = -_5487;
    float _6408 = fma(_6406, _5611, _6390);
    float _6410 = fma(_5585, _5491, _6398);
    float _6412 = fma(_5573, _5507, _6394);
    float _6414 = fma(_5609, _5611, _6374);
    float _6416 = fma(_5573, _5491, _6392);
    float _6418 = fma(_5511, _5491, _6400);
    float _6420 = fma(_5585, _5507, _6404);
    float _6422 = fma(_5585, _5495, _6408);
    float _6424 = _6410 * _6244;
    float _6426 = fma(_5573, _5495, _6356);
    float _6428 = fma(_5511, _5507, _6380);
    float _6430 = fma(_5511, _5495, _6414);
    float _6432 = _6420 * _6244;
    float _6434 = _6422 * _6244;
    float _6436 = fma(_6416, _6242, _6424);
    float _6438 = _6344 * _6410;
    float _6440 = fma(_6412, _6242, _6432);
    float _6442 = fma(_6426, _6242, _6434);
    float _6444 = fma(_6418, _6246, _6436);
    float _6446 = _6344 * _6420;
    float _6448 = in.m_87.x;
    float _6450 = _6344 * _6422;
    float _6452 = fma(_6350, _6416, _6438);
    float _6454 = fma(_6350, _6412, _6446);
    float _6456 = -_6382;
    float _6458 = _6456 + 1.0;
    float _6460 = fma(_6350, _6426, _6450);
    float _6462 = fma(_6348, _6418, _6452);
    float _6464 = fma(_6348, _6428, _6454);
    float _6466 = _6420 * _6312;
    float _6468 = fma(_6348, _6430, _6460);
    float _6470 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6230);
    float _6472 = fma(_6428, _6246, _6440);
    float _6474 = fma(_6458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6382);
    float _6476 = fma(_6430, _6246, _6442);
    bool _6478 = _6268 <= 8000.0;
    bool _6480 = isnan(_6268);
    bool _6482 = _6478 || _6480;
    bool _6484 = isnan(8000.0);
    bool _6486 = _6482 || _6484;
    float _6488 = float(_6486);
    out.m_89.x = _6462;
    out.m_89.y = _6464;
    out.m_89.z = _6468;
    float _6490 = _6410 * _6312;
    float _6492 = _6422 * _6312;
    float _6494 = fma(_6412, _6318, _6466);
    out.m_91.x = _6444;
    out.m_91.y = _6472;
    out.m_91.z = _6476;
    float _6496 = _6488 * _6474;
    float _6498 = fma(_6416, _6318, _6490);
    float _6500 = fma(_6426, _6318, _6492);
    float _6502 = _6470 + _6087;
    float _6504 = _6502 * 0.5;
    float _6506 = _6502;
    float _6508 = _6464;
    float _6510 = _6470;
    if (_6366)
    {
        _6506 = 1.0;
    }
    float _6512 = _6506;
    float _6514 = _6512;
    if (!_6366)
    {
        float _6516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6518 = _6516 * 0.15915493667125701904296875;
        float _6520 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6522 = _6518 * 6.283185482025146484375;
        float _6524 = cos(_6522);
        float _6526 = _6520 * 0.15915493667125701904296875;
        float _6528 = _6518 * 6.283185482025146484375;
        float _6530 = sin(_6528);
        float _6532 = 1.0 / _6524;
        float _6534 = _6526 * 6.283185482025146484375;
        float _6536 = cos(_6534);
        float _6538 = _6530 * _6532;
        float _6540 = _6526 * 6.283185482025146484375;
        float _6542 = sin(_6540);
        float _6544 = _6536 * _6538;
        float _6546 = 1.0 / _6544;
        float _6548 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6550 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6548;
        float _6552 = 1.0 / _6550;
        float _6554 = _6542 * _6546;
        float _6556 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6558 = fma(_6268, _6554, _6556);
        float _6560 = _6558 * _6552;
        float _6562 = precise::clamp(_6560, 0.0, 1.0);
        _6514 = _6562;
        _6508 = _6546;
    }
    float _6564 = _6514;
    float _6566 = _6508;
    float _6568 = -_6238;
    float _6570 = _6568 + 1.0;
    float _6572 = _6496 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6574 = -_6163;
    float _6576 = _6574 + 1.0;
    float _6578 = _6570 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _6135;
    out.gl_Position.y = _6131;
    out.gl_Position.z = _6470;
    out.gl_Position.w = _6087;
    float _6580 = _6576 * _6572;
    float _6582 = precise::clamp(_6580, 0.0, 1.0);
    float _6584 = fma(_6418, _6334, _6498);
    float _6586 = fma(_6428, _6334, _6494);
    float _6588 = fma(_6430, _6334, _6500);
    float _6590 = -_6582;
    float _6592 = fma(_6590, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _6594 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6596 = isnan(_5861);
    bool _6598 = _6594 || _6596;
    bool _6600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6602 = _6598 || _6600;
    out.m_93.z = _6504;
    out.m_93.w = _6087;
    float _6604 = _6592 * _6448;
    out.m_95.x = _6584;
    out.m_95.y = _6586;
    out.m_95.z = _6588;
    float _6606 = _6604 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6608 = _6578 * _6165;
    float _6610 = -_6578;
    float _6612 = _6610 + 1.0;
    float _6614 = _6180 * _6608;
    float _6616 = _6190 * _6608;
    out.m_97.x = _6606;
    float _6618 = _6564 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6620 = fma(_6186, _6614, _6174);
    float _6622 = fma(_6188, _6614, _6176);
    float _6624 = _6180 * _6612;
    float _6626 = fma(_6180, _6616, _6178);
    float _6628 = _6566;
    float _6630 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _6632 = _6614;
    float _6634 = _6608;
    if (!_6602)
    {
        _6628 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6636 = _6628;
    float _6638 = _6636;
    float _6640 = _6636;
    if (!_6602)
    {
        _6630 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6642 = _6630;
    out.m_99.x = _6620;
    out.m_99.y = _6622;
    out.m_99.z = _6626;
    out.m_99.w = _6624;
    float _6644 = _6642;
    float _6646 = _6642;
    if (!_6602)
    {
        _6276 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6648 = _6276;
    float _6650 = _6648;
    float _6652 = _6648;
    if (!_6602)
    {
        _6510 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6654 = _6510;
    float _6656 = _6654;
    float _6658 = _6654;
    if (!_6602)
    {
        _6632 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6660 = _6632;
    float _6662 = _6660;
    float _6664 = _6660;
    if (!_6602)
    {
        _6634 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6666 = _6634;
    bool _6668 = !_6602;
    float _6670 = _6666;
    float _6672 = _6666;
    if (!_6668)
    {
        bool _6674 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6676 = isnan(_5861);
        bool _6678 = _6674 || _6676;
        bool _6680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6682 = _6678 || _6680;
        if (!_6682)
        {
            float _6684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6686 = _5861 + _6684;
            float _6688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6688;
            float _6692 = 1.0 / _6690;
            float _6694 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6696 = _6694 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6698 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6700 = _6698 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6704 = _6702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6708 = _6706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6712 = _6710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6714 = _6686 * _6692;
            float _6716 = precise::clamp(_6714, 0.0, 1.0);
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6722 = fma(_6716, _6700, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6724 = fma(_6716, _6720, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6726 = fma(_6716, _6696, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6728 = fma(_6716, _6704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6730 = fma(_6716, _6708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6732 = fma(_6716, _6712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6664 = _6726;
            _6646 = _6730;
            _6658 = _6724;
            _6640 = _6728;
            _6672 = _6722;
            _6652 = _6732;
            _6734 = true;
        }
        else
        {
            bool _6736 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6738 = isnan(_5861);
            bool _6740 = _6736 || _6738;
            bool _6742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6744 = _6740 || _6742;
            if (!_6744)
            {
                _6638 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6746 = _6638;
            _6640 = _6746;
            if (!_6744)
            {
                _6644 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6748 = _6644;
            _6646 = _6748;
            if (!_6744)
            {
                _6650 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6750 = _6650;
            _6652 = _6750;
            if (!_6744)
            {
                _6656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6752 = _6656;
            _6658 = _6752;
            if (!_6744)
            {
                _6662 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6754 = _6662;
            _6664 = _6754;
            if (!_6744)
            {
                _6670 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6756 = _6670;
            bool _6758 = !_6744;
            _6672 = _6756;
            if (!_6758)
            {
                bool _6760 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6762 = isnan(_5861);
                bool _6764 = _6760 || _6762;
                bool _6766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6768 = _6764 || _6766;
                if (!_6768)
                {
                    float _6770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6772 = _5861 + _6770;
                    float _6774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6774;
                    float _6778 = 1.0 / _6776;
                    float _6780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6782 = _6780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6784 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6786 = _6784 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6790 = _6788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6794 = _6792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6798 = _6796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6800 = _6772 * _6778;
                    float _6802 = precise::clamp(_6800, 0.0, 1.0);
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6808 = fma(_6802, _6786, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6810 = fma(_6802, _6806, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6812 = fma(_6802, _6782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6814 = fma(_6802, _6790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6816 = fma(_6802, _6794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6818 = fma(_6802, _6798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6664 = _6812;
                    _6646 = _6816;
                    _6658 = _6810;
                    _6640 = _6814;
                    _6672 = _6808;
                    _6652 = _6818;
                    _6734 = true;
                }
                else
                {
                    _6664 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6646 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6640 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6672 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6652 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6734 = false;
    float _6820 = _6664;
    float _6822 = _6646;
    float _6824 = _6658;
    float _6826 = _6640;
    float _6828 = _6672;
    float _6830 = _6652;
    float _6832 = fma(_6586, -0.5, 0.5);
    float _6834 = precise::clamp(_6832, 0.0, 1.0);
    float _6836 = -_6820;
    float _6838 = _6822 + _6836;
    float _6840 = _6618 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6842 = -_6824;
    float _6844 = _6826 + _6842;
    float _6846 = fma(_6834, _6838, _6820);
    out.m_101.x = 0.0;
    float _6848 = -_6828;
    float _6850 = _6830 + _6848;
    float _6852 = fma(_6834, _6844, _6824);
    float _6854 = _6846 * 0.586610972881317138671875;
    out.m_49.x = _6840;
    bool _6856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6858 = fma(_6834, _6850, _6828);
    float _6860 = fma(_6852, 0.298911988735198974609375, _6854);
    bool _6862 = _6564 > 0.0;
    bool _6864 = isnan(_6564);
    bool _6866 = _6862 || _6864;
    bool _6868 = isnan(0.0);
    bool _6870 = _6866 || _6868;
    float _6872 = fma(_6858, 0.114477999508380889892578125, _6860);
    float _6874 = -_6872;
    float _6876 = _6852 + _6874;
    float _6878 = -_6872;
    float _6880 = _6846 + _6878;
    float _6882 = -_6872;
    float _6884 = _6858 + _6882;
    float _6886 = fma(_6876, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    float _6888 = fma(_6880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    float _6890 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    bool _6892 = !_6856;
    if (!_6892)
    {
        float _6894 = -_5829;
        float _6896 = _6894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6898 = -_5833;
        float _6900 = _6898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6902 = -_5837;
        float _6904 = _6902 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6906 = _6896 * _6896;
        float _6908 = fma(_6900, _6900, _6906);
        float _6910 = fma(_6904, _6904, _6908);
        float _6912 = sqrt(_6910);
        float _6914 = rsqrt(_6910);
        float _6916 = -_6912;
        float _6918 = _6916 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6920 = _6918 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6922 = precise::clamp(_6920, 0.0, 1.0);
        float _6924 = _6900 * _6914;
        float _6926 = _6896 * _6914;
        float _6928 = abs(_6922);
        float _6930 = log2(_6928);
        float _6932 = _6904 * _6914;
        float _6934 = _6924 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6936 = _6586 * _6926;
        float _6938 = -_6926;
        float _6940 = -_6934;
        float _6942 = fma(_6938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6940);
        float _6944 = fma(_6584, _6924, _6936);
        float _6946 = -_6932;
        float _6948 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6942);
        float _6950 = fma(_6588, _6932, _6944);
        float _6952 = precise::clamp(_6950, 0.0, 1.0);
        float _6954 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6956 = _6948 + _6954;
        float _6958 = _6930 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6960 = _6956 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6962 = precise::clamp(_6960, 0.0, 1.0);
        float _6964 = exp2(_6958);
        float _6966 = _6964 * _6962;
        float _6968 = _6952 * _6966;
        float _6970 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6972 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6974 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _6970;
        out.m_101.y = _6972;
        out.m_101.z = _6974;
    }
    out.m_103.x = _6886;
    out.m_103.y = _6888;
    out.m_103.z = _6890;
    if (_6870)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _6976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6976;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6734 = false;
    bool _1464 = false;
    bool _1136 = false;
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
        float _7033 = as_type<float>(_138);
        out.gl_Position.z = _7033;
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
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_49.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7102 = as_type<float>(_176);
        out.gl_Position.z = _7102;
    }
    if (_170)
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
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = _354 * _350;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = _356 * _350;
    float _372 = -_326;
    float _374 = _372 + 1.0;
    float _376 = _352 * _350;
    float _378 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _380 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _364);
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_330, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _390 = fma(_362, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_368, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
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
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _454 + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _526 = _496 * _518;
    float _528 = -_496;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _484;
    float _534 = _500 * _514;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _540 = _422 * _462;
    float _542 = _424 * _464;
    float _544 = fma(_534, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = _420 * _460;
    float _548 = _538 * _532;
    float _550 = -_512;
    float _552 = _550 + 1.0;
    float _554 = _544 * _526;
    float _556 = fma(_548, _522, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = _480 * _552;
    float _560 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _562 = fma(_556, _558, _560);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _568 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[117].x, _562);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _578 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _572;
    out.m_59.y = _574;
    out.m_59.z = _578;
    out.m_59.w = _576;
    bool _580 = !_524;
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
    float _674 = fma(_670, _660, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _676 = _666 * _654;
    float _678 = _672 * _654;
    float _680 = _674 * _654;
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].x, _676);
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
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _726 = _722 + _724;
    bool _728 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _730 = isnan(_722);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _744 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _746 = isnan(_722);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _756;
    float _760 = _688 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    bool _766 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _768 = 1.0 / _742;
    float _770 = _754 * _764;
    float _772 = -_754;
    float _774 = _772 + 1.0;
    float _776 = _758 * _768;
    float _778 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _780 = fma(_776, _726, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _782 = _780 * _770;
    float _784 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _788 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[132].x, _786);
    float _794 = _778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _788;
    out.m_61.y = _790;
    out.m_61.z = _794;
    out.m_61.w = _796;
    bool _798 = !_766;
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
    bool _962 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _964 = isnan(_826);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = 1.0 / _938;
    float _976 = _950 * _956;
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = 1.0 / _960;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _988 = _972 * _980;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _994 = _986 * _894;
    float _996 = _914 * _988;
    float _998 = -_972;
    float _1000 = _998 + 1.0;
    float _1002 = 1.0 / _992;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _826 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1012;
    float _1016 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _996);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1022 = fma(_994, _1010, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = _1014 * _974;
    float _1026 = 1.0 / _1006;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1030 = _826 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1036 = fma(_1022, _976, _1016);
    float _1038 = fma(_1024, _1030, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1042 = _826 + _1040;
    float _1044 = _1034 * _982;
    float _1046 = 1.0 / _1020;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1048;
    float _1052 = fma(_1038, _952, _1036);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1058 = _1050 * _1002;
    float _1060 = fma(_1044, _1042, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1064 = _826 + _1062;
    float _1066 = _1056 * _1026;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1068;
    bool _1072 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1074 = isnan(_826);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1086 = _826 + _1084;
    float _1088 = fma(_1058, _1064, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1090 = fma(_1060, _930, _1052);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1094 = _826 + _1092;
    float _1096 = fma(_1066, _1086, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1098 = _1070 * _1046;
    float _1100 = -_1082;
    float _1102 = _1100 + 1.0;
    float _1104 = fma(_1088, _916, _1090);
    float _1106 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1108 = _842 * _1102;
    float _1110 = fma(_1096, _882, _1104);
    float _1112 = fma(_1106, _1108, _1110);
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    out.m_63.x = _1114;
    bool _1116 = !_892;
    float _1134;
    if (!_1116)
    {
        float _1118 = in.m_55.x;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1122 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1124 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[14].y, _156);
        float _1126 = _1124 * _1120;
        float _1128 = floor(_1126);
        float _1130 = -_1128;
        float _1132 = _1126 + _1130;
        _1134 = _1132;
        _1136 = true;
    }
    else
    {
        float _1138 = float(_122);
        float _1140 = 1.0 / _1138;
        float _1142 = _156 * _1140;
        _1134 = _1142;
    }
    _1136 = false;
    float _1144 = _1134;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1148 = _1144 + _1146;
    bool _1150 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1152 = isnan(_1144);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1166 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1168 = isnan(_1144);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1178;
    bool _1182 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1184 = isnan(_1144);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -_1160;
    float _1196 = _1194 + 1.0;
    float _1198 = 1.0 / _1164;
    float _1200 = _1176 * _1196;
    float _1202 = -_1192;
    float _1204 = _1202 + 1.0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1212 = 1.0 / _1208;
    float _1214 = _1180 * _1198;
    float _1216 = -_1176;
    float _1218 = _1216 + 1.0;
    bool _1220 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1222 = isnan(_1144);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = fma(_1214, _1148, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1234 = _1192 * _1218;
    bool _1236 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1238 = isnan(_1144);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _1230 * _1204;
    float _1250 = -_1230;
    float _1252 = _1250 + 1.0;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1258 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1260 = isnan(_1144);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1246 * _1252;
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1280 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1282 = isnan(_1144);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = 1.0 / _1256;
    float _1294 = _1268 * _1274;
    float _1296 = -_1268;
    float _1298 = _1296 + 1.0;
    float _1300 = 1.0 / _1278;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1306 = _1290 * _1298;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1312 = _1304 * _1212;
    float _1314 = _1232 * _1306;
    float _1316 = -_1290;
    float _1318 = _1316 + 1.0;
    float _1320 = 1.0 / _1310;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1328 = _1144 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1330;
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1314);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1340 = fma(_1312, _1328, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1342 = _1332 * _1292;
    float _1344 = 1.0 / _1324;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1348 = _1144 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1354 = fma(_1340, _1294, _1334);
    float _1356 = fma(_1342, _1348, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1360 = _1144 + _1358;
    float _1362 = _1352 * _1300;
    float _1364 = 1.0 / _1338;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1366;
    float _1370 = fma(_1356, _1270, _1354);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1376 = _1368 * _1320;
    float _1378 = fma(_1362, _1360, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1382 = _1144 + _1380;
    float _1384 = _1374 * _1344;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1386;
    bool _1390 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1392 = isnan(_1144);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1404 = _1144 + _1402;
    float _1406 = fma(_1376, _1382, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1408 = fma(_1378, _1248, _1370);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1412 = _1144 + _1410;
    float _1414 = fma(_1384, _1404, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1416 = _1388 * _1364;
    float _1418 = -_1400;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1406, _1234, _1408);
    float _1424 = fma(_1416, _1412, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1426 = _1160 * _1420;
    float _1428 = fma(_1414, _1200, _1422);
    float _1430 = fma(_1424, _1426, _1428);
    float _1432 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1430);
    out.m_65.x = _1432;
    bool _1434 = !_1210;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1438 = _1354;
    float _1440 = _1234;
    float _1442 = _1248;
    float _1444 = _1270;
    float _1462;
    if (!_1434)
    {
        float _1446 = in.m_55.x;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1450 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[14].z, _156);
        float _1454 = _1452 * _1448;
        float _1456 = floor(_1454);
        float _1458 = -_1456;
        float _1460 = _1454 + _1458;
        _1462 = _1460;
        _1464 = true;
    }
    else
    {
        float _1466 = float(_122);
        float _1468 = 1.0 / _1466;
        float _1470 = _156 * _1468;
        _1462 = _1470;
    }
    _1464 = false;
    float _1472 = _1462;
    float _1474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1476 = int(_1474);
    float _1478 = in.m_55.y;
    float _1480 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1482 = int(_1480);
    float _1484 = float(_1476);
    float _1486 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1488 = int(_1486);
    float _1490 = float(uint(_1482));
    float _1492 = 1.0 / _1484;
    float _1494 = 1.0 / _1490;
    float _1496 = float(_1488);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1500 = _1498 != 0;
    float _1502 = _1492 * _156;
    float _1504 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1506 = int(_1504);
    int _1508 = as_type<int>(_1494) + (-2);
    float _1510 = trunc(_1502);
    int _1512 = int(_1510);
    float _1514 = float(_122);
    if (_1500)
    {
        float _1516 = in.m_55.x;
        _1436 = _1516;
    }
    float _1518 = _1436;
    int _1520 = ~_1482;
    int _1522 = _1520 + 1;
    int _1524 = 0;
    int _1526 = 0;
    float _1528 = _1518;
    if (_1500)
    {
        _1524 = 0;
        _1526 = 0;
    }
    int _1530 = _1524;
    int _1532 = _1526;
    int _1534 = _1530;
    int _1536 = _1532;
    if (_1500)
    {
        _1438 = 1.0;
    }
    float _1538 = _1438;
    float _1540 = _1364;
    float _1542 = _1538;
    if (_1500)
    {
        float _1544 = in.m_55.z;
        _1540 = _1544;
    }
    float _1546 = _1540;
    if (_1500)
    {
        _1440 = 1.0;
    }
    float _1548 = _1440;
    float _1550 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1552 = int(_1550);
    float _1554 = float(uint(_1506));
    float _1556 = _1548;
    if (_1500)
    {
        _1442 = 1.0;
    }
    float _1558 = _1442;
    int _1560 = 0;
    float _1562 = _1558;
    if (_1500)
    {
        _1560 = as_type<int>(_1478);
    }
    int _1564 = _1560;
    float _1566 = float(uint(_1512));
    float _1568 = 1.0 / _1496;
    float _1570 = as_type<float>(_1508) * _1566;
    float _1572 = float(_1552);
    float _1574 = trunc(_1570);
    float _1576 = precise::max(_1574, 0.0);
    uint _1579 = uint(_1576);
    int _1581 = 0;
    float _1583 = _1570;
    float _1585 = _1546;
    int _1587 = _1564;
    if (_1500)
    {
        _1581 = as_type<int>(_1546);
    }
    int _1589 = _1581;
    float _1591 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1593 = int(_1591);
    int _1595 = _1589;
    if (_1500)
    {
        _1583 = _1518;
    }
    float _1597 = _1583;
    float _1599 = _1597;
    if (_1500)
    {
        _1444 = _1597;
    }
    float _1601 = _1444;
    int _1603 = 0;
    float _1605 = _1601;
    if (_1500)
    {
        _1603 = as_type<int>(_1597);
    }
    int _1607 = _1603;
    int _1609 = _1522 * int(_1579);
    int _1611 = _1609 + _1512;
    float _1613 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1615 = int(_1613);
    float _1617 = float(uint(_1611));
    float _1619 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1621 = int(_1619);
    float _1623 = as_type<float>(_1508) * _1617;
    float _1625 = 1.0 / _1514;
    float _1627 = 1.0 / _1554;
    float _1629 = 1.0 / _1572;
    float _1631 = trunc(_1623);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    int _1637 = _1607;
    if (!_1500)
    {
        float _1639 = in.m_55.x;
        float _1641 = _1478 * 3.1415927410125732421875;
        float _1643 = in.m_55.z;
        float _1645 = _1641 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1639 * 3.1415927410125732421875;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = _1643 * 3.1415927410125732421875;
        float _1657 = _1655 * 0.15915493667125701904296875;
        float _1659 = _1653 * 6.283185482025146484375;
        float _1661 = sin(_1659);
        float _1663 = _1657 * 6.283185482025146484375;
        float _1665 = sin(_1663);
        _1542 = 7.345489978790283203125;
        _1528 = _1639;
        _1556 = 1.2345600128173828125;
        _1599 = _1478;
        _1562 = 5.839270114898681640625;
        _1605 = _1643;
        _1585 = _1643;
        _1534 = 1;
        _1587 = as_type<int>(_1649);
        _1637 = as_type<int>(_1661);
        _1595 = as_type<int>(_1665);
        _1536 = 2;
    }
    float _1667 = _1542;
    float _1669 = _1528;
    float _1671 = _1556;
    float _1673 = _1599;
    float _1675 = _1562;
    float _1677 = _1605;
    float _1679 = _1585;
    int _1681 = _1534;
    int _1683 = _1587;
    int _1685 = _1637;
    int _1687 = _1595;
    int _1689 = _1536;
    float _1691 = _1667 * _1669;
    int _1693 = ~_1482;
    int _1695 = _1693 + 1;
    float _1697 = _1568 * _156;
    int _1699 = int(_1579) + int(_1635);
    float _1701 = floor(_1691);
    float _1703 = float(_1482);
    float _1705 = in.m_67.x;
    float _1707 = float(_1512);
    int _1709 = _1695 * _1699;
    int _1711 = _1709 + _1512;
    float _1713 = _1671 * _1673;
    bool _1715 = _1707 >= _1703;
    bool _1717 = isnan(_1707);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(_1703);
    bool _1723 = _1719 || _1721;
    float _1725 = float(_1723);
    float _1727 = trunc(_1697);
    int _1729 = int(_1727);
    bool _1731 = uint(_1711) >= uint(_1482);
    float _1733 = _1667 * _1673;
    float _1735 = float(_1621);
    float _1737 = _1675 * _1677;
    bool _1739 = !_1731;
    int _1741 = _1739 ? 0 : (-1);
    float _1743 = in.m_67.y;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1747 = _1745 != 0;
    float _1749 = trunc(_1725);
    int _1751 = int(_1749);
    int _1753 = ~_1699;
    int _1755 = _1753 + _1741;
    int _1757 = _1755 + 1;
    float _1759 = -_1701;
    float _1761 = _1691 + _1759;
    bool _1763 = !_1747;
    int _1765 = _1763 ? 0 : 1;
    float _1767 = _1761 * _1703;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1771 = _1769 != 0;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1775 = _1773 != 0;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1779 = _1777 != 0;
    float _1781 = _1703 * _156;
    int _1783 = _1482 * _1757;
    int _1785 = _1783 + _1512;
    int _1787 = abs(_1765);
    float _1789 = 1.0 / _1735;
    bool _1791 = !_1775;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1781 * _1625;
    bool _1797 = _1482 == 0;
    int _1799 = ~_1751;
    int _1801 = _1799 + 1;
    int _1803 = _1801 + 1;
    bool _1805 = !_1797;
    int _1807 = _1805 ? _1785 : (-1);
    float _1809 = trunc(_1767);
    int _1811 = int(_1809);
    int _1813 = abs(_1793);
    int _1815 = _1807 * _1803;
    int _1817 = _1482 + (-1);
    float _1819 = trunc(_1795);
    int _1821 = int(_1819);
    bool _1823 = !_1771;
    int _1825 = _1823 ? 0 : 1;
    int _1827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1829 = _1827 != 0;
    int _1831 = _1751 * _1817;
    int _1833 = _1831 + _1815;
    int _1835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1837 = _1835 != 0;
    float _1839 = float(uint(_1615));
    int _1841 = _1811 * _1787;
    int _1843 = _1841 + _1512;
    bool _1845 = !_1779;
    int _1847 = _1845 ? 0 : 1;
    int _1849 = _1833 * _1813;
    int _1851 = abs(_1825);
    float _1853 = 1.0 / _1839;
    bool _1855 = !_1829;
    int _1857 = _1855 ? 0 : 1;
    int _1859 = abs(_1847);
    int _1861 = 0;
    float _1863 = as_type<float>(_1811);
    bool _1865 = false;
    bool _1867 = false;
    if (_1837)
    {
        float _1869 = in.m_55.x;
        _1861 = as_type<int>(_1869);
    }
    int _1871 = _1861;
    int _1873 = abs(_1857);
    float _1875 = _1629 * _156;
    int _1877 = _1821 * _1851;
    int _1879 = _1877 + _1849;
    float _1881 = _1789 * _156;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1885 = _1883 != 0;
    int _1887 = _1843 * _1859;
    int _1889 = _1887 + _1879;
    int _1891 = as_type<int>(_1627) + (-2);
    float _1893 = in.m_55.w;
    float _1895 = float(uint(_1729));
    int _1897 = _1811 * _1873;
    int _1899 = _1897 + _1889;
    float _1901 = float(uint(_1593));
    float _1903 = trunc(_1875);
    int _1905 = int(_1903);
    float _1907 = _1705;
    if (!_1837)
    {
        _1863 = _1705;
    }
    float _1909 = _1863;
    float _1911 = as_type<float>(_1891) * _1895;
    float _1913 = float(uint(_1899));
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1917 = _1915 != 0;
    float _1919 = as_type<float>(_1879);
    int _1921 = as_type<int>(_1913);
    float _1923 = _1909;
    if (_1885)
    {
        float _1925 = in.m_55.z;
        _1919 = _1925;
    }
    float _1927 = _1919;
    bool _1929 = _1478 > 0.5;
    float _1931 = as_type<float>(_1508) * _1913;
    float _1933 = 1.0 / _1901;
    if (_1837)
    {
        float _1935 = -_1705;
        float _1937 = _1935 + 1.0;
        _1921 = as_type<int>(_1937);
    }
    int _1939 = _1921;
    int _1941 = _1871;
    if (_1837)
    {
        bool _1943 = as_type<float>(_1871) > 0.5;
        _1865 = _1943;
    }
    bool _1945 = _1865;
    if (_1885)
    {
        float _1947 = -_1705;
        float _1949 = _1947 + 1.0;
        _1941 = as_type<int>(_1949);
    }
    int _1951 = _1941;
    int _1953 = ~_1506;
    int _1955 = _1953 + 1;
    int _1957 = _1951;
    if (_1837)
    {
        float _1959 = _1945 ? as_type<float>(_1939) : _1705;
        _1923 = _1959;
    }
    float _1961 = _1923;
    float _1963 = trunc(_1931);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1971 = _1969 != 0;
    int _1973 = 0;
    if (_1917)
    {
        float _1975 = -_1705;
        float _1977 = _1975 + 1.0;
        _1973 = as_type<int>(_1977);
    }
    int _1979 = _1973;
    float _1981 = float(uint(_1905));
    bool _1983 = _1893 > 0.5;
    int _1985 = ~_1615;
    int _1987 = _1985 + 1;
    float _1989 = trunc(_1881);
    int _1991 = int(_1989);
    int _1993 = ~_1482;
    int _1995 = _1993 + 1;
    int _1997 = as_type<int>(_1933) + (-2);
    float _1999 = _1927;
    float _2001 = as_type<float>(_1995);
    int _2003 = _1979;
    if (_1885)
    {
        bool _2005 = _1927 > 0.5;
        _1867 = _2005;
    }
    bool _2007 = _1867;
    if (!_1971)
    {
        _1999 = _1705;
    }
    float _2009 = _1999;
    int _2011 = _1995 * int(_1967);
    int _2013 = _2011 + _1899;
    float _2015 = _2009;
    if (!_1885)
    {
        _2001 = _1705;
    }
    float _2017 = _2001;
    float _2019 = as_type<float>(_1997) * _1981;
    float _2021 = _2017;
    if (_1885)
    {
        float _2023 = _2007 ? as_type<float>(_1951) : _1705;
        _2021 = _2023;
    }
    float _2025 = _2021;
    if (_1971)
    {
        float _2027 = -_1705;
        float _2029 = _2027 + 1.0;
        _1957 = as_type<int>(_2029);
    }
    int _2031 = _1957;
    float _2033 = float(uint(_2013));
    float _2035 = trunc(_1911);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2043 = _2041 != 0;
    int _2045 = as_type<int>(_1853) + (-2);
    float _2047 = as_type<float>(_1508) * _2033;
    float _2049 = float(uint(_1991));
    float _2051 = _2033;
    if (!_1917)
    {
        _2051 = _1705;
    }
    float _2053 = _2051;
    float _2055 = trunc(_2019);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    float _2061 = _2053;
    if (_1917)
    {
        float _2063 = _1929 ? as_type<float>(_1979) : _1705;
        _2061 = _2063;
    }
    float _2065 = _2061;
    float _2067 = as_type<float>(_2045) * _2049;
    if (_1971)
    {
        float _2069 = _1929 ? as_type<float>(_2031) : _1705;
        _2015 = _2069;
    }
    float _2071 = _2015;
    if (_2043)
    {
        float _2073 = -_1705;
        float _2075 = _2073 + 1.0;
        _2003 = as_type<int>(_2075);
    }
    int _2077 = _2003;
    int _2079 = ~_1593;
    int _2081 = _2079 + 1;
    float _2083 = trunc(_2047);
    float _2085 = precise::max(_2083, 0.0);
    uint _2087 = uint(_2085);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2091 = _2089 != 0;
    int _2093 = _1955 * int(_2039);
    int _2095 = _2093 + _1729;
    if (_2043)
    {
        float _2097 = _1929 ? as_type<float>(_2077) : _1705;
        _1907 = _2097;
    }
    float _2099 = _1907;
    int _2101 = ~_1482;
    int _2103 = _2101 + 1;
    float _2105 = floor(_1713);
    float _2107 = float(uint(_2095));
    bool _2109 = _1506 == 0;
    float _2111 = as_type<float>(_1891) * _2107;
    float _2113 = trunc(_2067);
    float _2115 = precise::max(_2113, 0.0);
    uint _2117 = uint(_2115);
    int _2119 = int(_1967) + int(_2087);
    int _2121 = _2081 * int(_2059);
    int _2123 = _2121 + _1905;
    float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2127 = _2125 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2133 = floor(_1733);
    float _2135 = -_2105;
    float _2137 = _1713 + _2135;
    float _2139 = float(uint(_2123));
    int _2141 = _2103 * _2119;
    int _2143 = _2141 + _1899;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    int _2149 = _1987 * int(_2117);
    int _2151 = _2149 + _1991;
    float _2153 = floor(_1737);
    float _2155 = as_type<float>(_1997) * _2139;
    bool _2157 = uint(_2143) >= uint(_1482);
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2163 = float(_1615);
    float _2165 = float(_1905);
    float _2167 = -_2133;
    float _2169 = _1733 + _2167;
    float _2171 = float(uint(_2151));
    float _2173 = trunc(_2111);
    float _2175 = precise::max(_2173, 0.0);
    uint _2177 = uint(_2175);
    float _2179 = _1625 * _156;
    float _2181 = float(_1506);
    float _2183 = as_type<float>(_2045) * _2171;
    bool _2185 = !_2157;
    int _2187 = _2185 ? 0 : (-1);
    float _2189 = -_2153;
    float _2191 = _1737 + _2189;
    float _2193 = trunc(_2155);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    float _2199 = float(_1593);
    float _2201 = _2181 * _2137;
    float _2203 = float(_1729);
    int _2205 = ~_2119;
    int _2207 = _2205 + _2187;
    int _2209 = _2207 + 1;
    float _2211 = _2199 * _2191;
    int _2213 = ~_1506;
    int _2215 = _2213 + 1;
    float _2217 = trunc(_2183);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = float(_1991);
    int _2225 = _1482 * _2209;
    int _2227 = _2225 + _1899;
    int _2229 = int(_2039) + int(_2177);
    bool _2231 = _2223 >= _2163;
    bool _2233 = isnan(_2223);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan(_2163);
    bool _2239 = _2235 || _2237;
    float _2241 = float(_2239);
    bool _2243 = _2203 >= _2181;
    bool _2245 = isnan(_2203);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(_2181);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = _2181 * _2179;
    bool _2257 = _2165 >= _2199;
    bool _2259 = isnan(_2165);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(_2199);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2265);
    float _2269 = _2199 * _2179;
    int _2271 = ~_1615;
    int _2273 = _2271 + 1;
    float _2275 = _2163 * _2179;
    float _2277 = _2163 * _2169;
    int _2279 = int(_2059) + int(_2197);
    int _2281 = _2215 * _2229;
    int _2283 = _2281 + _1729;
    int _2285 = int(_2117) + int(_2221);
    float _2287 = trunc(_2201);
    int _2289 = int(_2287);
    int _2291 = ~_1593;
    int _2293 = _2291 + 1;
    bool _2295 = !_2091;
    int _2297 = _2295 ? 0 : 1;
    int _2299 = _2273 * _2285;
    int _2301 = _2299 + _1991;
    bool _2303 = !_1797;
    int _2305 = _2303 ? _2227 : (-1);
    int _2307 = _2293 * _2279;
    int _2309 = _2307 + _1905;
    bool _2311 = uint(_2283) >= uint(_1506);
    float _2313 = trunc(_2255);
    int _2315 = int(_2313);
    bool _2317 = uint(_2301) >= uint(_1615);
    int _2319 = abs(_2297);
    int _2321 = _2305 & 3;
    bool _2323 = _2321 != 0;
    bool _2325 = !_2311;
    int _2327 = _2325 ? 0 : (-1);
    float _2329 = trunc(_2253);
    int _2331 = int(_2329);
    bool _2333 = uint(_2309) >= uint(_1593);
    bool _2335 = uint(_2321) > 1u;
    int _2337 = ~_2229;
    int _2339 = _2337 + _2327;
    int _2341 = _2339 + 1;
    int _2343 = _2289 * _2319;
    int _2345 = _2343 + _1729;
    bool _2347 = !_2333;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = trunc(_2275);
    int _2353 = int(_2351);
    int _2355 = _2305 & 3;
    bool _2357 = _2355 != 0;
    int _2359 = _1506 * _2341;
    int _2361 = _2359 + _1729;
    float _2363 = -_1743;
    float _2365 = _2363 + 1.0;
    bool _2367 = !_2317;
    int _2369 = _2367 ? 0 : (-1);
    int _2371 = _2357 ? 0 : 1;
    int _2373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2375 = _2373 != 0;
    float _2377 = 1.0 / _2127;
    int _2379 = ~_2279;
    int _2381 = _2379 + _2349;
    int _2383 = _2381 + 1;
    int _2385 = ~_2371;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    int _2391 = ~_2331;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _1593 * _2383;
    int _2399 = _2397 + _1905;
    bool _2401 = !_2109;
    int _2403 = _2401 ? _2361 : (-1);
    float _2405 = 1.0 / _2131;
    int _2407 = _2389;
    if (!_2335)
    {
        int _2409 = ~_2371;
        int _2411 = _2409 + 1;
        _2407 = _2411;
    }
    int _2413 = _2407;
    int _2415 = _1983 ? as_type<int>(_2365) : as_type<int>(_1743);
    int _2417 = _2395 * _2403;
    int _2419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2421 = _2419 != 0;
    int _2423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2425 = _2423 != 0;
    int _2427 = _1506 + (-1);
    float _2429 = trunc(_2211);
    int _2431 = int(_2429);
    bool _2433 = !_2375;
    int _2435 = _2433 ? 0 : 1;
    bool _2437 = !_2421;
    int _2439 = _2437 ? 0 : 1;
    int _2441 = _2331 * _2427;
    int _2443 = _2441 + _2417;
    int _2445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2447 = _2445 != 0;
    int _2449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2451 = _2449 != 0;
    int _2453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2455 = _2453 != 0;
    float _2457 = trunc(_2267);
    int _2459 = int(_2457);
    int _2461 = ~_2285;
    int _2463 = _2461 + _2369;
    int _2465 = _2463 + 1;
    bool _2467 = !_2425;
    int _2469 = _2467 ? 0 : 1;
    bool _2471 = !_2455;
    int _2473 = _2471 ? 0 : 1;
    int _2475 = _1615 * _2465;
    int _2477 = _2475 + _1991;
    int _2479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2481 = _2479 != 0;
    float _2483 = 1.0 / _2147;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2487 = _2485 != 0;
    int _2489 = abs(_2469);
    int _2491 = int(_2487);
    int _2493 = _2481 ? 2 : 0;
    int _2495 = _2491 | _2493;
    int _2497 = _2447 ? 4 : 0;
    int _2499 = _2495 | _2497;
    int _2501 = _2451 ? 8 : 0;
    int _2503 = _2499 | _2501;
    int _2505 = _2323 ? 16 : 0;
    int _2507 = _2503 | _2505;
    int _2509 = _1797 ? 32 : 0;
    int _2511 = _2507 | _2509;
    int _2513 = _2109 ? 64 : 0;
    int _2515 = _2511 | _2513;
    int _2517 = _2515 & 16;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2525 = _2523 != 0;
    int _2527 = _2443 * _2489;
    int _2529 = abs(_2435);
    float _2531 = trunc(_2241);
    int _2533 = int(_2531);
    bool _2535 = !_2481;
    int _2537 = _2535 ? 0 : 1;
    bool _2539 = !_2525;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = _2431 * _2529;
    int _2545 = _2543 + _1905;
    bool _2547 = _1593 == 0;
    bool _2549 = !_2487;
    int _2551 = _2549 ? 0 : 1;
    float _2553 = trunc(_2277);
    int _2555 = int(_2553);
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2559 = _2557 != 0;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2563 = _2561 != 0;
    int _2565 = abs(_2439);
    bool _2567 = !_2447;
    int _2569 = _2567 ? 0 : 1;
    bool _2571 = !_2451;
    int _2573 = _2571 ? 0 : 1;
    int _2575 = _2315 * _2565;
    int _2577 = _2575 + _2527;
    bool _2579 = !_2559;
    int _2581 = _2579 ? 0 : 1;
    float _2583 = 1.0 / _2161;
    int _2585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2587 = _2585 != 0;
    int _2589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2591 = _2589 != 0;
    bool _2593 = _1615 == 0;
    int _2595 = abs(_2569);
    int _2597 = abs(_2573);
    int _2599 = ~_2533;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    int _2605 = _2345 * _2595;
    int _2607 = _2605 + _2577;
    bool _2609 = !_2593;
    int _2611 = _2609 ? _2477 : (-1);
    float _2613 = float(uint(_1843));
    int _2615 = ~_2459;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2603 * _2611;
    bool _2623 = !_2547;
    int _2625 = _2623 ? _2399 : (-1);
    float _2627 = as_type<float>(_1508) * _2613;
    int _2629 = _1593 + (-1);
    int _2631 = _2619 * _2625;
    bool _2633 = !_2521;
    int _2635 = _2633 ? 0 : 1;
    float _2637 = trunc(_2269);
    int _2639 = int(_2637);
    int _2641 = _2289 * _2597;
    int _2643 = _2641 + _2607;
    int _2645 = abs(_2541);
    int _2647 = _2459 * _2629;
    int _2649 = _2647 + _2631;
    float _2651 = float(uint(_2345));
    int _2653 = abs(_2635);
    int _2655 = _2649 * _2645;
    float _2657 = trunc(_2627);
    float _2659 = precise::max(_2657, 0.0);
    uint _2661 = uint(_2659);
    float _2663 = float(uint(_2643));
    float _2665 = as_type<float>(_1891) * _2651;
    int _2667 = ~_1482;
    int _2669 = _2667 + 1;
    int _2671 = abs(_2473);
    float _2673 = as_type<float>(_1891) * _2663;
    int _2675 = abs(_2551);
    int _2677 = _2639 * _2653;
    int _2679 = _2677 + _2655;
    float _2681 = trunc(_2665);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = abs(_2537);
    int _2689 = _2555 * _2675;
    int _2691 = _2689 + _1991;
    bool _2693 = !_2563;
    int _2695 = _2693 ? 0 : 1;
    int _2697 = _2545 * _2671;
    int _2699 = _2697 + _2679;
    int _2701 = ~_1506;
    int _2703 = _2701 + 1;
    int _2705 = _2669 * int(_2661);
    int _2707 = _2705 + _1843;
    int _2709 = abs(_2695);
    float _2711 = trunc(_2673);
    float _2713 = precise::max(_2711, 0.0);
    uint _2715 = uint(_2713);
    int _2717 = ~_1506;
    int _2719 = _2717 + 1;
    int _2721 = _2431 * _2687;
    int _2723 = _2721 + _2699;
    float _2725 = float(uint(_2707));
    int _2727 = _1615 + (-1);
    float _2729 = float(uint(_2723));
    float _2731 = as_type<float>(_1508) * _2725;
    int _2733 = _2703 * int(_2685);
    int _2735 = _2733 + _2345;
    int _2737 = abs(_2581);
    float _2739 = as_type<float>(_1997) * _2729;
    int _2741 = _2533 * _2727;
    int _2743 = _2741 + _2621;
    bool _2745 = !_2587;
    int _2747 = _2745 ? 0 : 1;
    float _2749 = trunc(_2731);
    float _2751 = precise::max(_2749, 0.0);
    uint _2753 = uint(_2751);
    int _2755 = _2719 * int(_2715);
    int _2757 = _2755 + _2643;
    float _2759 = float(uint(_2735));
    float _2761 = float(uint(_2757));
    float _2763 = as_type<float>(_1891) * _2759;
    float _2765 = trunc(_2739);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    int _2771 = abs(_2747);
    int _2773 = _2743 * _2709;
    float _2775 = as_type<float>(_1891) * _2761;
    float _2777 = float(uint(_2545));
    float _2779 = trunc(_2775);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    int _2785 = _2353 * _2737;
    int _2787 = _2785 + _2773;
    float _2789 = as_type<float>(_1997) * _2777;
    int _2791 = ~_1593;
    int _2793 = _2791 + 1;
    bool _2795 = !_2591;
    int _2797 = _2795 ? 0 : 1;
    int _2799 = _2691 * _2771;
    int _2801 = _2799 + _2787;
    bool _2803 = uint(_2321) >= 2u;
    float _2805 = trunc(_2789);
    float _2807 = precise::max(_2805, 0.0);
    uint _2809 = uint(_2807);
    int _2811 = abs(_2797);
    int _2813 = _2793 * int(_2769);
    int _2815 = _2813 + _2723;
    int _2817 = _2803 ? 0 : 1;
    int _2819 = ~_1506;
    int _2821 = _2819 + 1;
    float _2823 = float(uint(_2815));
    int _2825 = _2555 * _2811;
    int _2827 = _2825 + _2801;
    bool _2829 = _2321 != 3;
    float _2831 = trunc(_2763);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = int(_2715) + int(_2783);
    float _2839 = as_type<float>(_1997) * _2823;
    int _2841 = ~_1593;
    int _2843 = _2841 + 1;
    float _2845 = float(uint(_2827));
    int _2847 = _2821 * _2837;
    int _2849 = _2847 + _2643;
    int _2851 = ~_2817;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    int _2857 = _2843 * int(_2809);
    int _2859 = _2857 + _2545;
    float _2861 = trunc(_2839);
    float _2863 = precise::max(_2861, 0.0);
    uint _2865 = uint(_2863);
    float _2867 = as_type<float>(_2045) * _2845;
    int _2869 = _2855;
    if (_2829)
    {
        int _2871 = ~_2817;
        int _2873 = _2871 + 1;
        _2869 = _2873;
    }
    int _2875 = _2869;
    bool _2877 = uint(_2849) >= uint(_1506);
    float _2879 = float(uint(_2859));
    int _2881 = int(_2661) + int(_2753);
    float _2883 = trunc(_2867);
    float _2885 = precise::max(_2883, 0.0);
    uint _2887 = uint(_2885);
    int _2889 = ~_1482;
    int _2891 = _2889 + 1;
    float _2893 = as_type<float>(_1997) * _2879;
    bool _2895 = !_2877;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2901 = _2899 != 0;
    int _2903 = _2891 * _2881;
    int _2905 = _2903 + _1843;
    int _2907 = ~_2837;
    int _2909 = _2907 + _2897;
    int _2911 = _2909 + 1;
    int _2913 = int(_2685) + int(_2835);
    bool _2915 = !_2901;
    int _2917 = _2915 ? 0 : 1;
    float _2919 = trunc(_2893);
    float _2921 = precise::max(_2919, 0.0);
    uint _2923 = uint(_2921);
    bool _2925 = uint(_2905) >= uint(_1482);
    int _2927 = _1506 * _2911;
    int _2929 = _2927 + _2643;
    int _2931 = ~_1615;
    int _2933 = _2931 + 1;
    bool _2935 = _1478 > 0.5;
    int _2937 = int(_2769) + int(_2865);
    int _2939 = _2933 * int(_2887);
    int _2941 = _2939 + _2827;
    int _2943 = _2935 ? as_type<int>(_2365) : as_type<int>(_1743);
    int _2945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2947 = _2945 != 0;
    bool _2949 = !_2109;
    int _2951 = _2949 ? _2929 : (-1);
    int _2953 = ~_1593;
    int _2955 = _2953 + 1;
    float _2957 = _2947 ? as_type<float>(_2943) : _1743;
    int _2959 = _2951 & 3;
    bool _2961 = _2959 != 0;
    int _2963 = _2955 * _2937;
    int _2965 = _2963 + _2723;
    float _2967 = float(uint(_2941));
    int _2969 = ~_1506;
    int _2971 = _2969 + 1;
    bool _2973 = !_2925;
    int _2975 = _2973 ? 0 : (-1);
    float _2977 = as_type<float>(_2045) * _2967;
    bool _2979 = uint(_2959) >= 2u;
    int _2981 = _2961 ? 0 : 1;
    float _2983 = trunc(_2977);
    float _2985 = precise::max(_2983, 0.0);
    uint _2987 = uint(_2985);
    int _2989 = _2979 ? 0 : 1;
    bool _2991 = _2959 != 3;
    bool _2993 = uint(_2965) >= uint(_1593);
    int _2995 = _2971 * _2913;
    int _2997 = _2995 + _2345;
    float _2999 = float(uint(_2691));
    bool _3001 = !_2993;
    int _3003 = _3001 ? 0 : (-1);
    bool _3005 = uint(_2959) > 1u;
    float _3007 = as_type<float>(_2045) * _2999;
    int _3009 = ~_2937;
    int _3011 = _3009 + _3003;
    int _3013 = _3011 + 1;
    int _3015 = ~_2989;
    int _3017 = _3015 + 1;
    int _3019 = _3017 + 1;
    int _3021 = _3019;
    if (_2991)
    {
        int _3023 = ~_2989;
        int _3025 = _3023 + 1;
        _3021 = _3025;
    }
    int _3027 = _3021;
    int _3029 = _1593 * _3013;
    int _3031 = _3029 + _2723;
    int _3033 = ~_1615;
    int _3035 = _3033 + 1;
    float _3037 = trunc(_3007);
    float _3039 = precise::max(_3037, 0.0);
    uint _3041 = uint(_3039);
    bool _3043 = uint(_2997) >= uint(_1506);
    int _3045 = ~_2981;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    int _3051 = _3049;
    if (!_3005)
    {
        int _3053 = ~_2981;
        int _3055 = _3053 + 1;
        _3051 = _3055;
    }
    int _3057 = _3051;
    int _3059 = int(_2887) + int(_2987);
    bool _3061 = !_2547;
    int _3063 = _3061 ? _3031 : (-1);
    int _3065 = int(_2809) + int(_2923);
    int _3067 = _3035 * _3059;
    int _3069 = _3067 + _2827;
    int _3071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3073 = _3071 != 0;
    bool _3075 = !_3043;
    int _3077 = _3075 ? 0 : (-1);
    int _3079 = _3063 & 3;
    bool _3081 = _3079 != 0;
    bool _3083 = !_3073;
    int _3085 = _3083 ? 0 : 1;
    bool _3087 = uint(_3079) >= 2u;
    int _3089 = _3081 ? 0 : 1;
    int _3091 = ~_1615;
    int _3093 = _3091 + 1;
    bool _3095 = uint(_3069) >= uint(_1615);
    int _3097 = _3087 ? 0 : 1;
    int _3099 = _3093 * int(_3041);
    int _3101 = _3099 + _2691;
    bool _3103 = _3079 != 3;
    bool _3105 = !_3095;
    int _3107 = _3105 ? 0 : (-1);
    int _3109 = ~_1593;
    int _3111 = _3109 + 1;
    bool _3113 = uint(_3079) > 1u;
    int _3115 = ~_3059;
    int _3117 = _3115 + _3107;
    int _3119 = _3117 + 1;
    int _3121 = _3111 * _3065;
    int _3123 = _3121 + _2545;
    float _3125 = float(uint(_3101));
    int _3127 = ~_3097;
    int _3129 = _3127 + 1;
    int _3131 = _3129 + 1;
    int _3133 = _1615 * _3119;
    int _3135 = _3133 + _2827;
    int _3137 = _3131;
    if (_3103)
    {
        int _3139 = ~_3097;
        int _3141 = _3139 + 1;
        _3137 = _3141;
    }
    int _3143 = _3137;
    float _3145 = as_type<float>(_2045) * _3125;
    bool _3147 = uint(_3123) >= uint(_1593);
    bool _3149 = !_2593;
    int _3151 = _3149 ? _3135 : (-1);
    float _3153 = trunc(_3145);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    int _3159 = ~_3089;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    int _3165 = _3163;
    if (!_3113)
    {
        int _3167 = ~_3089;
        int _3169 = _3167 + 1;
        _3165 = _3169;
    }
    int _3171 = _3165;
    int _3173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3175 = _3173 != 0;
    bool _3177 = !_3147;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = _3151 & 3;
    bool _3183 = _3181 != 0;
    bool _3185 = !_3175;
    int _3187 = _3185 ? 0 : 1;
    bool _3189 = uint(_3181) >= 2u;
    int _3191 = ~_1615;
    int _3193 = _3191 + 1;
    int _3195 = _3189 ? 0 : 1;
    bool _3197 = _3181 != 3;
    int _3199 = int(_3041) + int(_3157);
    int _3201 = _3183 ? 0 : 1;
    bool _3203 = uint(_3181) > 1u;
    int _3205 = ~_2881;
    int _3207 = _3205 + _2975;
    int _3209 = _3207 + 1;
    int _3211 = _3193 * _3199;
    int _3213 = _3211 + _2691;
    int _3215 = ~_2913;
    int _3217 = _3215 + _3077;
    int _3219 = _3217 + 1;
    int _3221 = ~_3195;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    int _3227 = _1482 * _3209;
    int _3229 = _3227 + _1843;
    int _3231 = _3225;
    if (_3197)
    {
        int _3233 = ~_3195;
        int _3235 = _3233 + 1;
        _3231 = _3235;
    }
    int _3237 = _3231;
    int _3239 = _1506 * _3219;
    int _3241 = _3239 + _2345;
    bool _3243 = _1482 == 0;
    float _3245 = in.m_46.x;
    float _3247 = in.m_46.y;
    float _3249 = in.m_46.z;
    int _3251 = ~_3201;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    float _3257 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _3259 = _3255;
    if (!_3203)
    {
        int _3261 = ~_3201;
        int _3263 = _3261 + 1;
        _3259 = _3263;
    }
    int _3265 = _3259;
    bool _3267 = !_3243;
    int _3269 = _3267 ? _3229 : (-1);
    int _3271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3273 = _3271 != 0;
    bool _3275 = uint(_3213) >= uint(_1615);
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _3279 = !_2109;
    int _3281 = _3279 ? _3241 : (-1);
    bool _3283 = !_3273;
    int _3285 = _3283 ? 0 : 1;
    float _3287 = fma(_3257, -2.0, _3277);
    int _3289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3291 = _3289 != 0;
    int _3293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3295 = _3293 != 0;
    float _3297 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3287);
    int _3299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3301 = _3299 != 0;
    int _3303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3305 = _3303 != 0;
    float _3307 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3309 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3311 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3313 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3315 = _3313 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3317 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3307);
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3321 = _3319 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3323 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3309);
    float _3325 = 1.0 / _3315;
    float _3327 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3311);
    float _3329 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3329;
    float _3333 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3335 = _3333 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _3337 = !_3275;
    int _3339 = _3337 ? 0 : (-1);
    float _3341 = _3331 * _2377;
    float _3343 = 1.0 / _3321;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3349 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3351 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3349;
    float _3353 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3355 = _3353 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3357 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3359 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3357;
    float _3361 = _1478 * 2.0;
    float _3363 = _3351 * _2405;
    float _3365 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3367 = _3365 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3369 = _3359 * _3325;
    float _3371 = floor(_3361);
    bool _3373 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3375 = isnan(_1472);
    bool _3377 = _3373 || _3375;
    bool _3379 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3381 = _3377 || _3379;
    float _3383 = float(_3381);
    float _3385 = _3335 * _2483;
    bool _3387 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3389 = isnan(_1472);
    bool _3391 = _3387 || _3389;
    bool _3393 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3395 = _3391 || _3393;
    float _3397 = float(_3395);
    float _3399 = _3355 * _2583;
    bool _3401 = _1679 > 0.5;
    float _3403 = -_3383;
    float _3405 = _3403 + 1.0;
    float _3407 = _3367 * _3343;
    float _3409 = 1.0 / _3347;
    float _3411 = _3291 ? as_type<float>(_2415) : _1743;
    float _3413 = -_3397;
    float _3415 = _3413 + 1.0;
    float _3417 = _3397 * _3405;
    int _3419 = _3401 ? as_type<int>(_2365) : as_type<int>(_1743);
    float _3421 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3323);
    bool _3423 = _2517 != 0;
    float _3425 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3427 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3425;
    bool _3429 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3431 = isnan(_1472);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    float _3441 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3327);
    float _3443 = _3295 ? as_type<float>(_3419) : _1743;
    float _3445 = _3421 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _3447 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3449 = isnan(_1472);
    bool _3451 = _3447 || _3449;
    bool _3453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3455 = _3451 || _3453;
    float _3457 = float(_3455);
    float _3459 = _3439 * _3415;
    bool _3461 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3463 = isnan(_1472);
    bool _3465 = _3461 || _3463;
    bool _3467 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3469 = _3465 || _3467;
    float _3471 = float(_3469);
    float _3473 = -_3439;
    float _3475 = _3473 + 1.0;
    bool _3477 = _3371 > 0.0;
    float _3479 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3317);
    bool _3481 = _3371 >= 0.0;
    bool _3483 = isnan(_3371);
    bool _3485 = _3481 || _3483;
    bool _3487 = isnan(0.0);
    bool _3489 = _3485 || _3487;
    float _3491 = _3427 * _3409;
    float _3493 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3495 = _1472 + _3493;
    bool _3497 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3499 = isnan(_1472);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3505 = _3501 || _3503;
    float _3507 = float(_3505);
    float _3509 = -_3471;
    float _3511 = _3509 + 1.0;
    float _3513 = _3457 * _3475;
    float _3515 = fma(_3341, _3495, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3517 = -_3457;
    float _3519 = _3517 + 1.0;
    float _3521 = _3507 * _3511;
    float _3523 = -_3507;
    float _3525 = _3523 + 1.0;
    bool _3527 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3529 = isnan(_1472);
    bool _3531 = _3527 || _3529;
    bool _3533 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3535 = _3531 || _3533;
    float _3537 = float(_3535);
    float _3539 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3541 = _1472 + _3539;
    float _3543 = _3471 * _3519;
    float _3545 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3547 = _1472 + _3545;
    bool _3549 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3551 = isnan(_1472);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = -_3537;
    float _3563 = _3561 + 1.0;
    float _3565 = fma(_3363, _3541, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3567 = fma(_3385, _3547, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3571 = _3559 * _3563;
    float _3573 = _3301 ? as_type<float>(_3419) : _1743;
    float _3575 = _3537 * _3525;
    bool _3577 = _1681 != 1;
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3581 = _1472 + _3579;
    float _3583 = _3515 * _3571;
    float _3585 = -_3559;
    float _3587 = _3585 + 1.0;
    float _3589 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3591 = _1472 + _3589;
    float _3593 = fma(_3399, _3581, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3595 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3597 = _1472 + _3595;
    float _3599 = fma(_3587, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3583);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3603 = _1472 + _3601;
    float _3605 = fma(_3369, _3591, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3607 = fma(_3567, _3575, _3599);
    float _3609 = fma(_3491, _3603, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3611 = _3569 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3613 = _3491;
    float _3615 = _3603;
    if (!_3577)
    {
        _3613 = _1478;
    }
    float _3617 = _3613;
    float _3619 = fma(_3565, _3521, _3607);
    float _3621 = _3617;
    if (!_3577)
    {
        _3615 = _1478;
    }
    float _3623 = _3615;
    float _3625 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3627 = 0.0;
    float _3629 = _3623;
    if (!_3577)
    {
        _3627 = _1679;
    }
    float _3631 = _3627;
    float _3633 = fma(_3407, _3597, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3635 = 0.0;
    float _3637 = _3631;
    if (!_3577)
    {
        _3635 = _1679;
    }
    float _3639 = _3635;
    float _3641 = _3479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3643 = !_3577;
    float _3645 = _3643 ? as_type<float>(_1683) : as_type<float>(_1685);
    float _3647 = _3441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3649 = _3639;
    float _3651 = _3647;
    if (_3577)
    {
        _3621 = _1669;
    }
    float _3653 = _3621;
    if (_3577)
    {
        _3629 = _1669;
    }
    float _3655 = _3629;
    if (_3577)
    {
        _3637 = _1478;
    }
    float _3657 = _3637;
    float _3659 = _3653 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_3577)
    {
        _3649 = _1478;
    }
    float _3661 = _3649;
    bool _3663 = !_3577;
    float _3665 = _3663 ? as_type<float>(_1687) : as_type<float>(_1683);
    float _3667 = _3657 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3669 = _1689 != 2;
    float _3671 = fma(_3611, _2099, -0.5);
    float _3673 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3675 = _3305 ? as_type<float>(_3419) : _1743;
    int _3677 = _2951 & 3;
    bool _3679 = _3677 != 0;
    float _3681 = -_3625;
    float _3683 = fma(_3673, 2.0, _3681);
    float _3685 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3687 = fma(_3593, _3543, _3619);
    float _3689 = _1478 + _1669;
    int _3691 = ~_3065;
    int _3693 = _3691 + _3179;
    int _3695 = _3693 + 1;
    float _3697 = fma(as_type<float>(_1685), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3685);
    float _3699 = _3689 + (-1.0);
    bool _3701 = !_3679;
    int _3703 = _3701 ? 0 : 1;
    int _3705 = _1593 * _3695;
    int _3707 = _3705 + _2545;
    bool _3709 = _2321 != 3;
    float _3711 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3713 = _2951 >> 31;
    float _3715 = as_type<float>(_1685) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3717 = !_3709;
    int _3719 = _3717 ? 0 : (-1);
    float _3721 = _1669 * 2.0;
    bool _3723 = _3079 != 3;
    float _3725 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3697);
    int _3727 = _3063 >> 31;
    float _3729 = -_156;
    float _3731 = fma(_3729, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3683);
    bool _3733 = !_2547;
    int _3735 = _3733 ? _3707 : (-1);
    float _3737 = floor(_3721);
    int _3739 = _2305 >> 31;
    float _3741 = fma(_3605, _3513, _3687);
    int _3743 = _3063 & 3;
    bool _3745 = _3743 != 0;
    int _3747 = _3713 & 3;
    float _3749 = fma(_3633, _3459, _3741);
    int _3751 = _3727 & 3;
    float _3753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3755 = _3739 & 3;
    float _3757 = fma(_3609, _3417, _3749);
    bool _3759 = !_3745;
    int _3761 = _3759 ? 0 : 1;
    bool _3763 = _2959 != 3;
    float _3765 = fma(_3383, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3757);
    int _3767 = _3063 + _3751;
    float _3769 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3771 = int(_3769);
    int _3773 = _2305 + _3755;
    bool _3775 = !_3763;
    int _3777 = _3775 ? 0 : (-1);
    out.m_69.x = _3765;
    bool _3779 = _3181 != 3;
    int _3781 = _3767 >> 2;
    int _3783 = _3773 >> 2;
    int _3785 = _3781 << 4;
    int _3787 = _3785 + 656;
    int _3789 = _3783 << 4;
    int _3791 = _3789 + 368;
    int _3793 = _2951 + _3747;
    uint _3795 = uint(int(uint(_3791) >> uint(2)));
    uint _3797 = uint(int(uint(int(_3795)) >> uint(2)));
    int _3799 = int(_3795) & 3;
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[int(_3797)][_3799];
    int _3803 = int(_3795) + 1;
    uint _3805 = uint(int(uint(_3803) >> uint(2)));
    int _3807 = _3803 & 3;
    float _3809 = (*spvDescriptorSet0.vp_c9)._m0[int(_3805)][_3807];
    int _3811 = _3151 >> 31;
    float _3813 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3815 = _3793 >> 2;
    int _3817 = _3811 & 3;
    float _3819 = fma(_3655, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3813);
    int _3821 = _3815 << 4;
    int _3823 = _3821 + 512;
    uint _3825 = uint(int(uint(_3787) >> uint(2)));
    uint _3827 = uint(int(uint(int(_3825)) >> uint(2)));
    int _3829 = int(_3825) & 3;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[int(_3827)][_3829];
    int _3833 = int(_3825) + 1;
    uint _3835 = uint(int(uint(_3833) >> uint(2)));
    int _3837 = _3833 & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    int _3841 = _3151 + _3817;
    float _3843 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3819);
    int _3845 = _3841 >> 2;
    bool _3847 = !_3423;
    int _3849 = _3847 ? 0 : 1;
    uint _3851 = uint(int(uint(_3823) >> uint(2)));
    uint _3853 = uint(int(uint(int(_3851)) >> uint(2)));
    int _3855 = int(_3851) & 3;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[int(_3853)][_3855];
    int _3859 = int(_3851) + 1;
    uint _3861 = uint(int(uint(_3859) >> uint(2)));
    int _3863 = _3859 & 3;
    float _3865 = (*spvDescriptorSet0.vp_c9)._m0[int(_3861)][_3863];
    int _3867 = _3845 << 4;
    int _3869 = _3867 + 800;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3873 = _3151 & 3;
    bool _3875 = _3873 != 0;
    float _3877 = fma(_3665, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3871);
    uint _3879 = uint(int(uint(_3869) >> uint(2)));
    uint _3881 = uint(int(uint(int(_3879)) >> uint(2)));
    int _3883 = int(_3879) & 3;
    float _3885 = (*spvDescriptorSet0.vp_c9)._m0[int(_3881)][_3883];
    int _3887 = int(_3879) + 1;
    uint _3889 = uint(int(uint(_3887) >> uint(2)));
    int _3891 = _3887 & 3;
    float _3893 = (*spvDescriptorSet0.vp_c9)._m0[int(_3889)][_3891];
    float _3895 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3897 = _3665 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3901 = ~_3199;
    int _3903 = _3901 + _3339;
    int _3905 = _3903 + 1;
    float _3907 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3895);
    float _3909 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3911 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3913 = fma(_3897, -2.0, _3899);
    int _3915 = abs(_2413);
    int _3917 = _1615 * _3905;
    int _3919 = _3917 + _2691;
    float _3921 = -_3909;
    float _3923 = fma(_3911, 2.0, _3921);
    int _3925 = abs(_3057);
    int _3927 = _3791 + 8;
    uint _3929 = uint(int(uint(_3927) >> uint(2)));
    uint _3931 = uint(int(uint(int(_3929)) >> uint(2)));
    int _3933 = int(_3929) & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = int(_3929) + 1;
    uint _3939 = uint(int(uint(_3937) >> uint(2)));
    int _3941 = _3937 & 3;
    float _3943 = (*spvDescriptorSet0.vp_c9)._m0[int(_3939)][_3941];
    int _3945 = abs(_3171);
    float _3947 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3907);
    int _3949 = ~_3915;
    int _3951 = _3949 + 1;
    int _3953 = _3951 + 1;
    float _3955 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3877);
    int _3957 = ~_3945;
    int _3959 = _3957 + 1;
    int _3961 = _3959 + 1;
    int _3963 = abs(_3849);
    int _3965 = _3823 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    int _3983 = _3953 * as_type<int>(_3809);
    int _3985 = abs(_3265);
    float _3987 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3989 = int(_3987);
    float _3991 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3993 = _3787 + 8;
    uint _3995 = uint(int(uint(_3993) >> uint(2)));
    uint _3997 = uint(int(uint(int(_3995)) >> uint(2)));
    int _3999 = int(_3995) & 3;
    float _4001 = (*spvDescriptorSet0.vp_c9)._m0[int(_3997)][_3999];
    int _4003 = int(_3995) + 1;
    uint _4005 = uint(int(uint(_4003) >> uint(2)));
    int _4007 = _4003 & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = _3961 * as_type<int>(_3839);
    int _4013 = abs(_3703);
    float _4015 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4017 = fma(as_type<float>(_1683), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3991);
    int _4019 = abs(_3761);
    int _4021 = _3869 + 8;
    uint _4023 = uint(int(uint(_4021) >> uint(2)));
    uint _4025 = uint(int(uint(int(_4023)) >> uint(2)));
    int _4027 = int(_4023) & 3;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[int(_4025)][_4027];
    int _4031 = int(_4023) + 1;
    uint _4033 = uint(int(uint(_4031) >> uint(2)));
    int _4035 = _4031 & 3;
    float _4037 = (*spvDescriptorSet0.vp_c9)._m0[int(_4033)][_4035];
    bool _4039 = !_3875;
    int _4041 = _4039 ? 0 : 1;
    float _4043 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4045 = as_type<float>(_1683) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _4047 = ~_3925;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    float _4053 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4055 = fma(_3661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4015);
    int _4057 = abs(_4041);
    float _4059 = fma(_4045, -2.0, _4043);
    int _4061 = ~_3985;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    float _4067 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4069 = int(_4067);
    int _4071 = ~_4013;
    int _4073 = _4071 + 1;
    int _4075 = _4073 + 1;
    float _4077 = fma(_3667, -2.0, _4053);
    int _4079 = _4051 * as_type<int>(_3865);
    int _4081 = ~_4057;
    int _4083 = _4081 + 1;
    int _4085 = _4083 + 1;
    int _4087 = _4065 * as_type<int>(_3893);
    bool _4089 = !_3723;
    int _4091 = _4089 ? 0 : (-1);
    int _4093 = _4075 * as_type<int>(_3857);
    int _4095 = _4093 + _4079;
    bool _4097 = !_3779;
    int _4099 = _4097 ? 0 : (-1);
    int _4101 = _4085 * as_type<int>(_3885);
    int _4103 = _4101 + _4087;
    bool _4105 = _3737 > 0.0;
    float _4107 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4017);
    bool _4109 = _3737 >= 0.0;
    bool _4111 = isnan(_3737);
    bool _4113 = _4109 || _4111;
    bool _4115 = isnan(0.0);
    bool _4117 = _4113 || _4115;
    float _4119 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4059);
    int _4121 = ~_3963;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    float _4127 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4055);
    float _4129 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4077);
    int _4131 = ~_4019;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    int _4137 = _4125 * as_type<int>(_3801);
    int _4139 = _4137 + _3983;
    int _4141 = abs(_2875);
    float _4143 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4145 = abs(_3027);
    int _4147 = _4135 * as_type<int>(_3831);
    int _4149 = _4147 + _4011;
    float _4151 = float(uint(_3771));
    float _4153 = -_4143;
    float _4155 = fma(_3659, 2.0, _4153);
    int _4157 = ~_4141;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    float _4163 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4165 = int(_4163);
    int _4167 = abs(_3719);
    float _4169 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3913);
    int _4171 = ~_4145;
    int _4173 = _4171 + 1;
    int _4175 = _4173 + 1;
    int _4177 = _4161 * as_type<int>(_3935);
    int _4179 = _4177 + _4139;
    int _4181 = abs(_3143);
    float _4183 = -_156;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4155);
    int _4187 = ~_4167;
    int _4189 = _4187 + 1;
    int _4191 = _4189 + 1;
    float _4193 = 1.0 / _4151;
    int _4195 = _4175 * as_type<int>(_3973);
    int _4197 = _4195 + _4095;
    int _4199 = ~_4181;
    int _4201 = _4199 + 1;
    int _4203 = _4201 + 1;
    float _4205 = float(uint(_4069));
    int _4207 = _4191 * as_type<int>(_3943);
    int _4209 = _4207 + _4179;
    int _4211 = abs(_3777);
    int _4213 = _4203 * as_type<int>(_4001);
    int _4215 = _4213 + _4149;
    float _4217 = 1.0 / _4205;
    int _4219 = abs(_2917);
    int _4221 = abs(_3237);
    int _4223 = abs(_4091);
    int _4225 = ~_4219;
    int _4227 = _4225 + 1;
    int _4229 = _4227 + 1;
    float _4231 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4233 = log2(_4231);
    int _4235 = ~_4211;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    int _4241 = ~_4221;
    int _4243 = _4241 + 1;
    int _4245 = _4243 + 1;
    int _4247 = _4209 * _4229;
    int _4249 = ~_4223;
    int _4251 = _4249 + 1;
    int _4253 = _4251 + 1;
    int _4255 = _4239 * as_type<int>(_3981);
    int _4257 = _4255 + _4197;
    int _4259 = abs(_3085);
    int _4261 = _4245 * as_type<int>(_4029);
    int _4263 = _4261 + _4103;
    float _4265 = float(uint(_4165));
    int _4267 = _4253 * as_type<int>(_4009);
    int _4269 = _4267 + _4215;
    int _4271 = as_type<int>(_4193) + (-2);
    int _4273 = _3269 * _4219;
    int _4275 = _4273 + _4247;
    int _4277 = abs(_4099);
    int _4279 = ~_4259;
    int _4281 = _4279 + 1;
    int _4283 = _4281 + 1;
    float _4285 = 1.0 / _4265;
    float _4287 = float(uint(_3989));
    int _4289 = abs(_3187);
    int _4291 = _4283 * _4257;
    int _4293 = abs(_3285);
    float _4295 = _4233 * _156;
    int _4297 = ~_4277;
    int _4299 = _4297 + 1;
    int _4301 = _4299 + 1;
    float _4303 = 1.0 / _4287;
    int _4305 = ~_4293;
    int _4307 = _4305 + 1;
    int _4309 = _4307 + 1;
    int _4311 = _3281 * _4259;
    int _4313 = _4311 + _4291;
    bool _4315 = !_2593;
    float _4317 = _4315 ? as_type<float>(_3919) : as_type<float>(0xffffffffu /* nan */);
    int _4319 = _4301 * as_type<int>(_4037);
    int _4321 = _4319 + _4263;
    float _4323 = float(uint(_4275));
    int _4325 = as_type<int>(_4217) + (-2);
    int _4327 = _4309 * _4321;
    int _4329 = ~_4289;
    int _4331 = _4329 + 1;
    int _4333 = _4331 + 1;
    float _4335 = as_type<float>(_4271) * _4323;
    float _4337 = float(uint(_4313));
    int _4339 = as_type<int>(_4317) * _4293;
    int _4341 = _4339 + _4327;
    int _4343 = as_type<int>(_4285) + (-2);
    int _4345 = _4333 * _4269;
    float _4347 = trunc(_4335);
    float _4349 = precise::max(_4347, 0.0);
    uint _4351 = uint(_4349);
    float _4353 = as_type<float>(_4325) * _4337;
    int _4355 = as_type<int>(_4303) + (-2);
    int _4357 = _3735 * _4289;
    int _4359 = _4357 + _4345;
    float _4361 = float(uint(_4341));
    float _4363 = _4317;
    float _4365 = _3715;
    float _4367 = _3741;
    float _4369 = _3749;
    if (_3669)
    {
        _4363 = _1478;
    }
    float _4371 = _4363;
    float _4373 = float(uint(_4359));
    float _4375 = as_type<float>(_4355) * _4361;
    float _4377 = trunc(_4353);
    float _4379 = precise::max(_4377, 0.0);
    uint _4381 = uint(_4379);
    float _4383 = _4371;
    if (!_3669)
    {
        _4383 = _1669;
    }
    float _4385 = _4383;
    float _4387 = as_type<float>(_4343) * _4373;
    float _4389 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _4391 = ~_3771;
    int _4393 = _4391 + 1;
    float _4395 = _4385 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _4397 = abs(_3771);
    float _4399 = trunc(_4387);
    float _4401 = precise::max(_4399, 0.0);
    uint _4403 = uint(_4401);
    float _4405 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _4407 = _4393 * int(_4351);
    int _4409 = _4407 + _4275;
    float _4411 = fma(_4395, -2.0, _4389);
    int _4413 = ~_4165;
    int _4415 = _4413 + 1;
    float _4417 = -_4405;
    float _4419 = fma(_3715, 2.0, _4417);
    if (_3669)
    {
        _4365 = _1669;
    }
    float _4421 = _4365;
    float _4423 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4411);
    float _4425 = trunc(_4375);
    float _4427 = precise::max(_4425, 0.0);
    uint _4429 = uint(_4427);
    float _4431 = _4421;
    if (!_3669)
    {
        _4431 = _1679;
    }
    float _4433 = _4431;
    float _4435 = -_156;
    float _4437 = fma(_4435, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4419);
    float _4439 = float(uint(_4409));
    float _4441 = float(uint(_4397));
    float _4443 = _4433 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _4445 = abs(_4069);
    int _4447 = _4415 * int(_4403);
    int _4449 = _4447 + _4359;
    float _4451 = as_type<float>(_4271) * _4439;
    int _4453 = ~_4069;
    int _4455 = _4453 + 1;
    float _4457 = 1.0 / _4441;
    int _4459 = ~_3989;
    int _4461 = _4459 + 1;
    float _4463 = float(uint(_4445));
    int _4465 = _4455 * int(_4381);
    int _4467 = _4465 + _4313;
    float _4469 = float(uint(_4449));
    int _4471 = _4461 * int(_4429);
    int _4473 = _4471 + _4341;
    int _4475 = abs(_4165);
    float _4477 = exp2(_4295);
    float _4479 = as_type<float>(_4343) * _4469;
    float _4481 = float(uint(_4475));
    float _4483 = float(uint(_4467));
    float _4485 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4487 = float(uint(_4473));
    float _4489 = 1.0 / _4463;
    int _4491 = abs(_3989);
    float _4493 = as_type<float>(_4325) * _4483;
    int _4495 = abs(_4275);
    float _4497 = -_4485;
    float _4499 = fma(_4443, 2.0, _4497);
    float _4501 = float(uint(_4491));
    float _4503 = as_type<float>(_4355) * _4487;
    int _4505 = as_type<int>(_4457) + (-2);
    float _4507 = 1.0 / _4481;
    float _4509 = float(uint(_4495));
    float _4511 = -_4477;
    float _4513 = _4511 + 1.0;
    float _4515 = -_156;
    float _4517 = fma(_4515, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4499);
    int _4519 = abs(_4313);
    float _4521 = as_type<float>(_4505) * _4509;
    bool _4523 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4525 = isnan(1.0);
    bool _4527 = _4523 || _4525;
    bool _4529 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4531 = _4527 || _4529;
    float _4533 = 1.0 / _4501;
    int _4535 = as_type<int>(_4489) + (-2);
    float _4537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4539 = 1.0 + _4537;
    float _4541 = float(uint(_4519));
    int _4543 = abs(_4359);
    float _4545 = trunc(_4521);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    float _4551 = as_type<float>(_4535) * _4541;
    int _4553 = as_type<int>(_4507) + (-2);
    float _4555 = float(uint(_4543));
    float _4557 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4559 = 1.0 / _4539;
    float _4561 = as_type<float>(_4553) * _4555;
    float _4563 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4565 = abs(_4341);
    float _4567 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _4569 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4571 = isnan(0.0);
    bool _4573 = _4569 || _4571;
    bool _4575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4577 = _4573 || _4575;
    float _4579 = trunc(_4551);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    float _4585 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _4587 = as_type<int>(_4533) + (-2);
    float _4589 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4557);
    float _4591 = float(uint(_4565));
    float _4593 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4563);
    int _4595 = ~_4397;
    int _4597 = _4595 + 1;
    float _4599 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4567);
    float _4601 = trunc(_4561);
    float _4603 = precise::max(_4601, 0.0);
    uint _4605 = uint(_4603);
    float _4607 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4585);
    float _4609 = _4577 ? _4513 : 0.0;
    float _4611 = as_type<float>(_4587) * _4591;
    int _4613 = _4597 * int(_4549);
    int _4615 = _4613 + _4495;
    float _4617 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4589);
    int _4619 = ~_4445;
    int _4621 = _4619 + 1;
    float _4623 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4607);
    float _4625 = trunc(_4451);
    float _4627 = precise::max(_4625, 0.0);
    uint _4629 = uint(_4627);
    float _4631 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4593);
    float _4633 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4599);
    float _4635 = -_156;
    float _4637 = fma(_4635, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3923);
    if (_4531)
    {
        float _4639 = _4609 * _4559;
        _160 = _4639;
    }
    float _4641 = _160;
    int _4643 = ~_4475;
    int _4645 = _4643 + 1;
    int _4647 = _4621 * int(_4583);
    int _4649 = _4647 + _4519;
    float _4651 = float(uint(_4615));
    float _4653 = trunc(_4493);
    float _4655 = precise::max(_4653, 0.0);
    uint _4657 = uint(_4655);
    bool _4659 = _3989 == 0;
    float _4661 = as_type<float>(_4505) * _4651;
    float _4663 = float(uint(_4649));
    float _4665 = trunc(_4611);
    float _4667 = precise::max(_4665, 0.0);
    uint _4669 = uint(_4667);
    int _4671 = int(_4351) + int(_4629);
    int _4673 = ~_4491;
    int _4675 = _4673 + 1;
    float _4677 = trunc(_4479);
    float _4679 = precise::max(_4677, 0.0);
    uint _4681 = uint(_4679);
    int _4683 = int(_4381) + int(_4657);
    float _4685 = as_type<float>(_4535) * _4663;
    int _4687 = ~_3989;
    int _4689 = _4687 + 1;
    float _4691 = trunc(_4503);
    float _4693 = precise::max(_4691, 0.0);
    uint _4695 = uint(_4693);
    int _4697 = _4645 * int(_4605);
    int _4699 = _4697 + _4543;
    float _4701 = float(uint(_4699));
    int _4703 = _4675 * int(_4669);
    int _4705 = _4703 + _4565;
    float _4707 = trunc(_4661);
    float _4709 = precise::max(_4707, 0.0);
    uint _4711 = uint(_4709);
    int _4713 = int(_4403) + int(_4681);
    float _4715 = as_type<float>(_4553) * _4701;
    int _4717 = ~_3771;
    int _4719 = _4717 + 1;
    int _4721 = ~_4069;
    int _4723 = _4721 + 1;
    float _4725 = trunc(_4685);
    float _4727 = precise::max(_4725, 0.0);
    uint _4729 = uint(_4727);
    int _4731 = int(_4429) + int(_4695);
    int _4733 = _4719 * _4671;
    int _4735 = _4733 + _4275;
    int _4737 = ~_4165;
    int _4739 = _4737 + 1;
    float _4741 = float(uint(_4705));
    float _4743 = trunc(_4715);
    float _4745 = precise::max(_4743, 0.0);
    uint _4747 = uint(_4745);
    float _4749 = as_type<float>(_4587) * _4741;
    bool _4751 = uint(_4735) >= uint(_3771);
    int _4753 = _4723 * _4683;
    int _4755 = _4753 + _4313;
    int _4757 = int(_4549) + int(_4711);
    int _4759 = _4739 * _4713;
    int _4761 = _4759 + _4359;
    float _4763 = trunc(_4749);
    float _4765 = precise::max(_4763, 0.0);
    uint _4767 = uint(_4765);
    bool _4769 = uint(_4755) >= uint(_4069);
    int _4771 = int(_4583) + int(_4729);
    int _4773 = _4689 * _4731;
    int _4775 = _4773 + _4341;
    bool _4777 = !_4751;
    int _4779 = _4777 ? 0 : (-1);
    bool _4781 = uint(_4761) >= uint(_4165);
    float _4783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4785 = ~_4397;
    int _4787 = _4785 + 1;
    int _4789 = int(_4605) + int(_4747);
    bool _4791 = !_4769;
    int _4793 = _4791 ? 0 : (-1);
    int _4795 = ~_4445;
    int _4797 = _4795 + 1;
    bool _4799 = uint(_4775) >= uint(_3989);
    int _4801 = ~_4475;
    int _4803 = _4801 + 1;
    int _4805 = _4787 * _4757;
    int _4807 = _4805 + _4495;
    int _4809 = ~_4491;
    int _4811 = _4809 + 1;
    int _4813 = _4797 * _4771;
    int _4815 = _4813 + _4519;
    int _4817 = int(_4669) + int(_4767);
    int _4819 = _4803 * _4789;
    int _4821 = _4819 + _4543;
    bool _4823 = !_4781;
    int _4825 = _4823 ? 0 : (-1);
    bool _4827 = uint(_4807) >= uint(_4397);
    int _4829 = _4811 * _4817;
    int _4831 = _4829 + _4565;
    bool _4833 = !_4799;
    int _4835 = _4833 ? 0 : (-1);
    bool _4837 = uint(_4815) >= uint(_4445);
    bool _4839 = !_4827;
    int _4841 = _4839 ? 0 : (-1);
    int _4843 = ~_4671;
    int _4845 = _4843 + _4779;
    int _4847 = _4845 + 1;
    int _4849 = ~_4731;
    int _4851 = _4849 + _4835;
    int _4853 = _4851 + 1;
    bool _4855 = uint(_4821) >= uint(_4475);
    bool _4857 = !_4837;
    int _4859 = _4857 ? 0 : (-1);
    int _4861 = _3989 * _4853;
    int _4863 = _4861 + _4341;
    bool _4865 = uint(_4831) >= uint(_4491);
    int _4867 = _3771 * _4847;
    int _4869 = _4867 + _4275;
    int _4871 = ~_4713;
    int _4873 = _4871 + _4825;
    int _4875 = _4873 + 1;
    float _4877 = _1679 * 2.0;
    bool _4879 = !_4855;
    int _4881 = _4879 ? 0 : (-1);
    int _4883 = ~_4683;
    int _4885 = _4883 + _4793;
    int _4887 = _4885 + 1;
    int _4889 = _4165 * _4875;
    int _4891 = _4889 + _4359;
    bool _4893 = _3771 == 0;
    float _4895 = floor(_4877);
    bool _4897 = !_4865;
    int _4899 = _4897 ? 0 : (-1);
    int _4901 = _4069 * _4887;
    int _4903 = _4901 + _4313;
    bool _4905 = !_4893;
    int _4907 = _4905 ? _4869 : (-1);
    bool _4909 = !_4659;
    int _4911 = _4909 ? _4863 : (-1);
    bool _4913 = _4069 == 0;
    bool _4915 = _4165 == 0;
    bool _4917 = _4069 == 0;
    int _4919 = _4275 ^ _3771;
    int _4921 = _4313 ^ _4069;
    bool _4923 = !_4915;
    int _4925 = _4923 ? _4891 : (-1);
    int _4927 = ~_4841;
    int _4929 = _4757 + _4927;
    int _4931 = _4929 + 1;
    float _4933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4935 = _3445 + _4933;
    uint _4937 = uint(int(uint(_4919) >> uint(31)));
    uint _4939 = uint(int(uint(_4921) >> uint(31)));
    float _4941 = _4935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4943 = ~_4859;
    int _4945 = _4771 + _4943;
    int _4947 = _4945 + 1;
    float _4949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4951 = _3641 + _4949;
    int _4953 = ~int(_4937);
    int _4955 = _4953 + 1;
    float _4957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4959 = _3647 + _4957;
    int _4961 = ~int(_4939);
    int _4963 = _4961 + 1;
    float _4965 = fma(_4951, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4941);
    int _4967 = _4931 ^ _4955;
    float _4969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4971 = _4947 ^ _4963;
    float _4973 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4965);
    bool _4975 = !_4913;
    int _4977 = _4975 ? _4903 : (-1);
    bool _4979 = _3771 == 0;
    int _4981 = ~_4955;
    int _4983 = _4981 + _4967;
    int _4985 = _4983 + 1;
    float _4987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4989 = ~_4963;
    int _4991 = _4989 + _4971;
    int _4993 = _4991 + 1;
    bool _4995 = !_4979;
    int _4997 = _4995 ? _4985 : (-1);
    bool _4999 = !_4917;
    int _5001 = _4999 ? _4993 : (-1);
    bool _5003 = _4973 >= 0.0;
    float _5005 = _4969 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5007 = _4359 ^ _4165;
    bool _5009 = _3989 == 0;
    float _5011 = fma(_5005, _2957, -0.5);
    int _5013 = _4341 ^ _3989;
    uint _5015 = uint(int(uint(_5007) >> uint(31)));
    float _5017 = _4987 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _5019 = uint(int(uint(_5013) >> uint(31)));
    float _5021 = _4783 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _5023 = ~_4881;
    int _5025 = _4789 + _5023;
    int _5027 = _5025 + 1;
    float _5029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5031 = ~int(_5015);
    int _5033 = _5031 + 1;
    float _5035 = fma(_5021, _3675, -0.5);
    int _5037 = ~_4899;
    int _5039 = _4817 + _5037;
    int _5041 = _5039 + 1;
    float _5043 = fma(_5017, _1961, -0.5);
    int _5045 = ~int(_5019);
    int _5047 = _5045 + 1;
    float _5049 = -_4169;
    float _5051 = fma(_3955, _5035, _5049);
    int _5053 = _4117 ? 0 : 1;
    float _5055 = _4895;
    int _5057 = _5047;
    if (_5003)
    {
        out.m_49.x = 0.0;
    }
    bool _5059 = _4895 > 0.0;
    float _5061 = _5051 + 0.5;
    bool _5063 = _4895 >= 0.0;
    bool _5065 = isnan(_4895);
    bool _5067 = _5063 || _5065;
    bool _5069 = isnan(0.0);
    bool _5071 = _5067 || _5069;
    int _5073 = _5027 ^ _5033;
    int _5075 = _5041 ^ _5047;
    float _5077 = _5029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_5003)
    {
        _5055 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5079 = _5055;
    int _5081 = ~_5053;
    int _5083 = _5081 + 1;
    int _5085 = _5083 + 1;
    float _5087 = fma(_5077, _3411, -0.5);
    int _5089 = ~_5033;
    int _5091 = _5089 + _5073;
    int _5093 = _5091 + 1;
    int _5095 = _5085;
    if (!_4105)
    {
        int _5097 = ~_5053;
        int _5099 = _5097 + 1;
        _5095 = _5099;
    }
    int _5101 = _5095;
    int _5103 = ~_5047;
    int _5105 = _5103 + _5075;
    int _5107 = _5105 + 1;
    float _5109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_5003)
    {
        float _5111 = _5079 * 5.0;
        _5057 = as_type<int>(_5111);
    }
    int _5113 = _5057;
    float _5115 = fma(_3947, _3671, _4637);
    bool _5117 = _4165 == 0;
    float _5119 = _5115 + 0.5;
    int _5121 = _5071 ? 0 : 1;
    if (_5003)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14276 = as_type<float>(_5113);
        out.gl_Position.z = _14276;
    }
    bool _5123 = !_5117;
    int _5125 = _5123 ? _5093 : (-1);
    float _5127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5129 = !_5009;
    int _5131 = _5129 ? _5107 : (-1);
    out.m_71.x = _5119;
    out.m_71.y = _5061;
    int _5133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _5135 = _5133 != 0;
    int _5137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _5139 = _5137 != 0;
    int _5141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _5143 = _5141 != 0;
    float _5145 = float(_4997);
    float _5147 = _5109 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5149 = ~_5121;
    int _5151 = _5149 + 1;
    int _5153 = _5151 + 1;
    int _5155 = _5153;
    if (!_5059)
    {
        int _5157 = ~_5121;
        int _5159 = _5157 + 1;
        _5155 = _5159;
    }
    int _5161 = _5155;
    float _5163 = _3753 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5165 = float(_4977);
    float _5167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5169 = float(_4925);
    float _5171 = fma(_5147, _2025, -0.5);
    float _5173 = fma(_5163, _2071, -0.5);
    float _5175 = fma(_5147, _5165, _4185);
    float _5177 = -_3297;
    float _5179 = fma(_5005, _5145, _5177);
    float _5181 = fma(_5163, _5169, _4517);
    float _5183 = float(_5125);
    float _5185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5187 = fma(_3843, _5171, _5175);
    float _5189 = fma(_4633, _5173, _5181);
    float _5191 = float(_5131);
    float _5193 = _4935 * _4935;
    bool _5195 = !_5135;
    int _5197 = _5195 ? 0 : 1;
    float _5199 = fma(_4617, _5011, _5179);
    float _5201 = _5187 + 0.5;
    float _5203 = _5167 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5205 = abs(_5197);
    float _5207 = _5127 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5209 = float(_4907);
    float _5211 = -_4119;
    float _5213 = fma(_5203, _5191, _5211);
    float _5215 = float(_5205);
    float _5217 = fma(_5207, _2065, -0.5);
    float _5219 = float(_4911);
    float _5221 = _5185 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5223 = float(_5001);
    float _5225 = fma(_5017, _5209, _3731);
    float _5227 = _5199 + 0.5;
    float _5229 = -_4423;
    float _5231 = fma(_5221, _5183, _5229);
    float _5233 = fma(_5221, _3443, -0.5);
    float _5235 = fma(_4951, _4951, _5193);
    float _5237 = fma(_5203, _3573, -0.5);
    float _5239 = fma(_5207, _5219, _4437);
    float _5241 = -_4129;
    float _5243 = fma(_5077, _5223, _5241);
    float _5245 = fma(_4959, _4959, _5235);
    float _5247 = fma(_4107, _5237, _5213);
    float _5249 = float(_5161);
    float _5251 = fma(_4631, _5043, _5225);
    float _5253 = fma(_3725, _5217, _5239);
    float _5255 = _5247 + 0.5;
    float _5257 = rsqrt(_5245);
    float _5259 = _5215 * _5249;
    float _5261 = fma(_4127, _5087, _5243);
    float _5263 = in.m_73.x;
    float _5265 = in.m_73.y;
    float _5267 = in.m_73.z;
    float _5269 = fma(_4623, _5233, _5231);
    float _5271 = _5189 + 0.5;
    float _5273 = _5253 + 0.5;
    float _5275 = _5251 + 0.5;
    float _5277 = _5261 + 0.5;
    float _5279 = _5269 + 0.5;
    bool _5281 = !_5139;
    int _5283 = _5281 ? 0 : 1;
    out.m_75.x = _5273;
    out.m_75.y = _5255;
    bool _5285 = !_5143;
    int _5287 = _5285 ? 0 : 1;
    int _5289 = abs(_5283);
    out.m_77.x = _5275;
    out.m_77.y = _5227;
    out.m_77.z = _5201;
    out.m_77.w = _5277;
    float _5291 = _4935 * _5257;
    float _5293 = _4951 * _5257;
    out.m_79.x = _5271;
    out.m_79.y = _5279;
    float _5295 = _5181;
    if (_5003)
    {
        return out;
    }
    float _5297 = -_5291;
    float _5299 = fma(_5297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    float _5301 = -_5293;
    float _5303 = fma(_5301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3641);
    float _5305 = _4959 * _5257;
    float _5307 = float(_5101);
    float _5309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5311 = _5299 + _5309;
    float _5313 = float(_5289);
    float _5315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5317 = _5303 + _5315;
    int _5319 = _3489 ? 0 : 1;
    float _5321 = _5311 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5323 = _5259 * (-2.0);
    float _5325 = -_5305;
    float _5327 = fma(_5325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3647);
    float _5329 = _5313 * _5307;
    float _5331 = fma(_5317, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5321);
    float _5333 = fma(_5323, _5263, _5263);
    float _5335 = _1669 + (-0.5);
    float _5337 = _1478 + _1679;
    float _5339 = fma(_3711, _5323, _3711);
    float _5341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5343 = _5327 + _5341;
    float _5345 = fma(_5335, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5333);
    float _5347 = _5337 + (-1.0);
    float _5349 = _5329 * (-2.0);
    float _5351 = fma(_5343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5331);
    float _5353 = fma(_5339, _4641, _5345);
    float _5355 = fma(_5347, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5357 = _1478 + (-0.5);
    float _5359 = fma(_5349, _5265, _5265);
    bool _5361 = _5351 >= 0.0;
    float _5363 = fma(_5355, _5349, _5355);
    int _5365 = abs(_5287);
    float _5367 = fma(_5357, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5359);
    float _5369 = _5353 * 0.15915493667125701904296875;
    int _5371 = ~_5319;
    int _5373 = _5371 + 1;
    int _5375 = _5373 + 1;
    float _5377 = _1669 + _1679;
    float _5379 = fma(_5363, _4641, _5367);
    int _5381 = _5375;
    float _5383 = _5331;
    if (!_3477)
    {
        int _5385 = ~_5319;
        int _5387 = _5385 + 1;
        _5381 = _5387;
    }
    int _5389 = _5381;
    float _5391 = _5369 * 6.283185482025146484375;
    float _5393 = sin(_5391);
    float _5395 = _5379 * 0.15915493667125701904296875;
    float _5397 = float(_5389);
    if (_5361)
    {
        _5383 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5399 = _5383;
    int _5401 = as_type<int>(_5399);
    if (_5361)
    {
        out.m_49.x = 0.0;
    }
    float _5403 = float(_5365);
    float _5405 = _5369 * 6.283185482025146484375;
    float _5407 = cos(_5405);
    if (_5361)
    {
        float _5409 = _5399 * 5.0;
        _5401 = as_type<int>(_5409);
    }
    int _5411 = _5401;
    float _5413 = _5377 + (-1.0);
    float _5415 = _5403 * _5397;
    if (_5361)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14738 = as_type<float>(_5411);
        out.gl_Position.z = _14738;
    }
    float _5417 = _5395 * 6.283185482025146484375;
    float _5419 = sin(_5417);
    float _5421 = _5415 * (-2.0);
    if (_5361)
    {
        return out;
    }
    float _5423 = -_3445;
    float _5425 = _5423 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5427 = -_3641;
    float _5429 = _5427 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5431 = fma(_5413, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5433 = fma(_5421, _5267, _5267);
    float _5435 = _5425 * _5425;
    float _5437 = _1679 + (-0.5);
    float _5439 = -_3647;
    float _5441 = _5439 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5443 = fma(_5431, _5421, _5431);
    float _5445 = fma(_5429, _5429, _5435);
    float _5447 = fma(_5437, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5433);
    float _5449 = -_5291;
    float _5451 = fma(_5449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4935);
    float _5453 = _5395 * 6.283185482025146484375;
    float _5455 = cos(_5453);
    float _5457 = fma(_5441, _5441, _5445);
    float _5459 = fma(_5443, _4641, _5447);
    float _5461 = -_5293;
    float _5463 = fma(_5461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4951);
    float _5465 = -_5305;
    float _5467 = fma(_5465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4959);
    float _5469 = _5393 * _5419;
    float _5471 = _5459 * 0.15915493667125701904296875;
    float _5473 = _5451 * _5451;
    float _5475 = rsqrt(_5457);
    float _5477 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5479 = _5407 * _5419;
    float _5481 = fma(_5463, _5463, _5473);
    float _5483 = fma(_5467, _5467, _5481);
    float _5485 = _5471 * 6.283185482025146484375;
    float _5487 = sin(_5485);
    float _5489 = _5407 * _5455;
    float _5491 = _5429 * _5475;
    float _5493 = sqrt(_5483);
    float _5495 = _5441 * _5475;
    float _5497 = in.m_81.x;
    float _5499 = in.m_81.y;
    float _5501 = in.m_81.z;
    float _5503 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5505 = _5491 * _5503;
    float _5507 = _5425 * _5475;
    float _5509 = fma(_5487, _5489, _5469);
    float _5511 = fma(_5487, _5469, _5489);
    float _5513 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5515 = _5495 * _5513;
    float _5517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5519 = -_5505;
    float _5521 = fma(_5495, _5517, _5519);
    float _5523 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5525 = _5507 * _5523;
    float _5527 = _5471 * 6.283185482025146484375;
    float _5529 = cos(_5527);
    float _5531 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5533 = -_5515;
    float _5535 = fma(_5507, _5531, _5533);
    float _5537 = _5521 * _5521;
    float _5539 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5541 = -_5525;
    float _5543 = fma(_5491, _5539, _5541);
    float _5545 = _5257 * _5493;
    float _5547 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5549 = fma(_5535, _5535, _5537);
    float _5551 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5553 = _5545 * _5547;
    float _5555 = fma(_5543, _5543, _5549);
    float _5557 = _5545 * _5551;
    float _5559 = _5545 * _5477;
    float _5561 = rsqrt(_5555);
    float _5563 = _5393 * _5455;
    float _5565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5499);
    float _5567 = _5407 * _5529;
    float _5569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5501);
    float _5571 = -_5479;
    float _5573 = fma(_5487, _5563, _5571);
    float _5575 = _5559 * _5565;
    float _5577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5497);
    float _5579 = -_5563;
    float _5581 = fma(_5487, _5479, _5579);
    float _5583 = _5455 * _5529;
    float _5585 = _5393 * _5529;
    float _5587 = _5557 * _5577;
    float _5589 = _5567 * _5575;
    float _5591 = _5553 * _5569;
    float _5593 = -_5575;
    float _5595 = _5487 * _5593;
    float _5597 = _5585 * _5575;
    float _5599 = _5535 * _5561;
    float _5601 = _5521 * _5561;
    float _5603 = fma(_5509, _5587, _5589);
    float _5605 = fma(_5583, _5587, _5595);
    float _5607 = _5507 * _5599;
    float _5609 = _5419 * _5529;
    float _5611 = _5543 * _5561;
    float _5613 = fma(_5581, _5591, _5603);
    float _5615 = _5495 * _5601;
    float _5617 = -_5607;
    float _5619 = fma(_5491, _5601, _5617);
    float _5621 = fma(_5573, _5587, _5597);
    float _5623 = fma(_5609, _5591, _5605);
    float _5625 = -_5615;
    float _5627 = fma(_5507, _5611, _5625);
    float _5629 = _5619 * _5613;
    float _5631 = fma(_5511, _5591, _5621);
    float _5633 = _5491 * _5611;
    float _5635 = _5627 * _5613;
    float _5637 = fma(_5611, _5623, _5629);
    float _5639 = -_5633;
    float _5641 = fma(_5495, _5599, _5639);
    float _5643 = fma(_5599, _5623, _5635);
    float _5645 = fma(_5495, _5631, _5637);
    float _5647 = _5641 * _5613;
    float _5649 = fma(_5491, _5631, _5643);
    float _5651 = _3647 + _5645;
    float _5653 = _3641 + _5649;
    float _5655 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5657 = _5651 + _5655;
    float _5659 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5661 = _5653 + _5659;
    float _5663 = _5657 * _5657;
    float _5665 = fma(_5661, _5661, _5663);
    float _5667 = fma(_5601, _5623, _5647);
    float _5669 = sqrt(_5665);
    float _5671 = fma(_5507, _5631, _5667);
    float _5673 = _3445 + _5671;
    bool _5675 = _5669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5677 = _5631;
    float _5679 = _5671;
    float _5681 = _5653;
    float _5683 = _5665;
    if (!_5675)
    {
        _5677 = _5651;
    }
    float _5685 = _5677;
    float _5687 = _5685;
    if (!_5675)
    {
        _5679 = _5673;
    }
    float _5689 = _5679;
    bool _5691 = !_5675;
    float _5693 = _5689;
    if (!_5691)
    {
        float _5695 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5699 = _5669 + _5697;
        float _5701 = _5673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5703 = rsqrt(_5665);
        float _5705 = _5699 * _5695;
        float _5707 = _5705 * 0.15915493667125701904296875;
        float _5709 = _5707 * 6.283185482025146484375;
        float _5711 = cos(_5709);
        float _5713 = _5707 * 6.283185482025146484375;
        float _5715 = sin(_5713);
        float _5717 = _5711 + (-1.0);
        float _5719 = _5717 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5721 = fma(_5715, _5701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5723 = fma(_5673, _5711, _5719);
        float _5725 = _5703 * _5721;
        float _5727 = fma(_5661, _5725, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5729 = fma(_5657, _5725, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5693 = _5723;
        _5681 = _5727;
        _5687 = _5729;
    }
    float _5731 = _5693;
    float _5733 = _5681;
    float _5735 = _5687;
    float _5737 = -_3445;
    float _5739 = _5737 + _5731;
    float _5741 = -_3641;
    float _5743 = _5741 + _5733;
    float _5745 = -_3647;
    float _5747 = _5745 + _5735;
    float _5749 = _5739 * _5739;
    float _5751 = fma(_5743, _5743, _5749);
    float _5753 = fma(_5747, _5747, _5751);
    float _5755 = sqrt(_5753);
    bool _5757 = _5755 > 0.0;
    bool _5759 = !_5757;
    float _5761 = _5731;
    float _5763 = _5733;
    float _5765 = _5735;
    float _5767 = _5739;
    float _5769 = _5755;
    if (!_5759)
    {
        float _5771 = _200 * _200;
        float _5773 = rsqrt(_5753);
        float _5775 = fma(_198, _198, _5771);
        float _5777 = fma(_202, _202, _5775);
        float _5779 = sqrt(_5777);
        float _5781 = _5743 * _5773;
        float _5783 = _5739 * _5773;
        float _5785 = _5747 * _5773;
        bool _5787 = _5779 > 0.0;
        bool _5789 = !_5787;
        _5767 = _5783;
        _5769 = _5779;
        if (!_5789)
        {
            float _5791 = rsqrt(_5777);
            float _5793 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5795 = _200 * _5791;
            float _5797 = _198 * _5791;
            float _5799 = _5783 * _5795;
            float _5801 = _202 * _5791;
            float _5803 = fma(_5781, _5797, _5799);
            float _5805 = _5793 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5807 = fma(_5785, _5801, _5803);
            float _5809 = _5807 * _5805;
            float _5811 = fma(_198, _5809, _5733);
            float _5813 = fma(_200, _5809, _5731);
            float _5815 = fma(_202, _5809, _5735);
            _5761 = _5813;
            _5763 = _5811;
            _5765 = _5815;
            _5767 = _5803;
            _5769 = _5809;
        }
    }
    float _5817 = _5761;
    float _5819 = _5763;
    float _5821 = _5765;
    float _5823 = _5767;
    float _5825 = _5769;
    float _5827 = -_5291;
    float _5829 = fma(_5827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5817);
    float _5831 = -_5293;
    float _5833 = fma(_5831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5819);
    float _5835 = -_5305;
    float _5837 = fma(_5835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5821);
    float _5839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5841 = _5829 + _5839;
    float _5843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5845 = _5833 + _5843;
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5849 = _5837 + _5847;
    float _5851 = _5841 * _5841;
    float _5853 = fma(_5845, _5845, _5851);
    float _5855 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5857 = fma(_5849, _5849, _5853);
    float _5859 = rsqrt(_5857);
    float _5861 = sqrt(_5857);
    float _5863 = _5859 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5865 = _5845 * _5863;
    float _5867 = _5849 * _5863;
    float _5869 = _5865 * _5865;
    float _5871 = _5867 * _5867;
    float _5873 = _5869 + _5871;
    float _5875 = sqrt(_5873);
    bool _5877 = _5875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5881 = _5875 + _5879;
    float _5883 = _5859;
    float _5885 = _5873;
    float _5887 = _5881;
    float _5889 = _5823;
    if (_5877)
    {
        float _5891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5883 = _5891;
    }
    float _5893 = _5883;
    if (_5877)
    {
        float _5895 = rsqrt(_5873);
        _5885 = _5895;
    }
    float _5897 = _5885;
    if (_5877)
    {
        float _5899 = _5881 * _5893;
        _5887 = _5899;
    }
    float _5901 = _5887;
    if (_5877)
    {
        float _5903 = _5901 * 0.15915493667125701904296875;
        _5889 = _5903;
    }
    float _5905 = _5889;
    float _5907 = _5849;
    float _5909 = _5905;
    if (_5877)
    {
        float _5911 = _5905 * 6.283185482025146484375;
        float _5913 = sin(_5911);
        _5907 = _5913;
    }
    float _5915 = _5907;
    float _5917 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5919 = precise::max(0.0, _5917);
    float _5921 = _5825;
    float _5923 = _5919;
    if (_5877)
    {
        float _5925 = _5905 * 6.283185482025146484375;
        float _5927 = cos(_5925);
        _5921 = _5927;
    }
    float _5929 = _5921;
    float _5931 = -_5863;
    float _5933 = -_5919;
    float _5935 = fma(_5841, _5931, _5933);
    float _5937 = fma(_5303, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5939 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _5941 = _5935;
    if (_5877)
    {
        float _5943 = _5935 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5923 = _5943;
    }
    float _5945 = _5923;
    float _5947 = floor(_5937);
    float _5949 = _5945;
    float _5951 = _5915;
    if (_5877)
    {
        float _5953 = fma(_5915, _5945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5949 = _5953;
    }
    float _5955 = _5949;
    float _5957 = _5955;
    if (!_5877)
    {
        _5951 = _5865;
    }
    float _5959 = _5951;
    float _5961 = _5959;
    float _5963 = _5929;
    if (_5877)
    {
        float _5965 = _5929 + (-1.0);
        _5939 = _5965;
    }
    float _5967 = _5939;
    float _5969 = _5967;
    if (_5877)
    {
        float _5971 = _5897 * _5955;
        _5683 = _5971;
    }
    float _5973 = _5683;
    if (!_5877)
    {
        _5957 = _5869;
    }
    float _5975 = _5957;
    float _5977 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5979 = _5975;
    if (_5877)
    {
        float _5981 = _5967 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5909 = _5981;
    }
    float _5983 = _5909;
    if (_5877)
    {
        float _5985 = _5865 * _5973;
        _5961 = _5985;
    }
    float _5987 = _5961;
    if (!_5877)
    {
        _5969 = _5867;
    }
    float _5989 = _5969;
    float _5991 = _5989;
    if (_5877)
    {
        float _5993 = _5867 * _5973;
        _5991 = _5993;
    }
    float _5995 = _5991;
    if (_5877)
    {
        float _5997 = fma(_5935, _5929, _5983);
        _5941 = _5997;
    }
    float _5999 = _5941;
    if (_5877)
    {
        float _6001 = _5987 * _5987;
        _5979 = _6001;
    }
    float _6003 = _5979;
    float _6005 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_5877)
    {
        _5963 = _5871;
    }
    float _6007 = _5963;
    float _6009 = _6007;
    if (_5877)
    {
        float _6011 = _5995 * _5995;
        _6009 = _6011;
    }
    float _6013 = _6009;
    float _6015 = fma(_5999, _5999, _6003);
    float _6017 = fma(_5327, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6019 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6021 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6005);
    float _6023 = _6015 + _6013;
    float _6025 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6027 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6019);
    float _6029 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6021);
    float _6031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6033 = fma(_5861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6031);
    float _6035 = precise::clamp(_6033, 0.0, 1.0);
    float _6037 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6025);
    float _6039 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6027);
    float _6041 = rsqrt(_6023);
    float _6043 = _6029 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6045 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6037);
    float _6047 = _6039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6049 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5977);
    float _6051 = -_6035;
    float _6053 = _6051 + 1.0;
    float _6055 = _6045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6057 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6059 = _6043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6061 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6049);
    float _6063 = floor(_6017);
    float _6065 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6057);
    float _6067 = -_6059;
    float _6069 = fma(_6067, _5855, 1.0);
    float _6071 = _6061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6073 = -_5947;
    float _6075 = _5937 + _6073;
    float _6077 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6065);
    float _6079 = _6041 * _5987;
    float _6081 = _6041 * _5999;
    float _6083 = abs(_6053);
    float _6085 = log2(_6083);
    float _6087 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6077);
    float _6089 = _6079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6091 = _6041 * _5995;
    float _6093 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6095 = -_6089;
    float _6097 = fma(_6081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6095);
    float _6099 = log2(_6069);
    float _6101 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6093);
    float _6103 = -_6091;
    float _6105 = fma(_6103, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6097);
    float _6107 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6109 = -_6063;
    float _6111 = _6017 + _6109;
    float _6113 = fma(_6105, -0.5, 0.5);
    float _6115 = fma(_6105, 0.5, 0.5);
    float _6117 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6119 = 1.0 / _6087;
    float _6121 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6107);
    float _6123 = fma(_6115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6125 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6101);
    float _6127 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6121);
    float _6129 = fma(_6115, _6123, -0.212114393711090087890625);
    float _6131 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6125);
    float _6133 = exp2(_6117);
    float _6135 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6127);
    float _6137 = fma(_6115, _6129, 1.570728778839111328125);
    float _6139 = _6099 * 0.693147182464599609375;
    float _6141 = sqrt(_6113);
    float _6143 = _6081 + 1.0;
    float _6145 = _6135 * _6119;
    float _6147 = _6131 * _6119;
    float _6149 = _6139 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6151 = fma(_6145, 0.5, 0.5);
    float _6153 = -_6081;
    float _6155 = fma(_6133, _6143, _6153);
    float _6157 = fma(_6147, -0.5, 0.5);
    float _6159 = fma(_6155, 0.5, 0.5);
    float _6161 = _6141 * 0.636619746685028076171875;
    float2 _15933 = float2(_6075, _6111);
    float _6163 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15933, float2(0.0), isnan(_15933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15933, float2(0.0), isnan(_15933)), level(0.0)).x;
    float3 _15944 = float3(_6151, _6157, _6149);
    float _6165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15944, float3(0.0), isnan(_15944)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15944, float3(0.0), isnan(_15944)), level(0.0)).x;
    float _6167 = -_6137;
    float _6169 = fma(_6161, _6167, 1.0);
    float3 _15960 = float3(_6151, _6157, _6149);
    float4 _6172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15960, float3(0.0), isnan(_15960)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15960, float3(0.0), isnan(_15960)), level(0.0)).xyzw;
    float _6174 = _6172.x;
    float _6176 = _6172.y;
    float _6178 = _6172.z;
    float _6180 = _6172.w;
    float2 _15976 = float2(_6169, _6159);
    float3 _6184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15976, float2(0.0), isnan(_15976)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15976, float2(0.0), isnan(_15976)), level(0.0)).xyz;
    float _6186 = _6184.x;
    float _6188 = _6184.y;
    float _6190 = _6184.z;
    float _6192 = _5299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _6194 = _5499 != 0.0;
    bool _6196 = isnan(_5499);
    bool _6198 = _6194 || _6196;
    bool _6200 = isnan(0.0);
    bool _6202 = _6198 || _6200;
    float _6204 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6206 = fma(_5303, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6192);
    bool _6208 = _5497 == 0.0;
    bool _6210 = !_6202;
    bool _6212 = _6208 && _6210;
    float _6214 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6216 = fma(_5327, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6206);
    float _6218 = _5299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6220 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6204);
    float _6222 = _6216 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6224 = fma(_5303, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6218);
    bool _6226 = _5501 == 0.0;
    bool _6228 = _6226 && _6212;
    float _6230 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6220);
    float _6232 = 1.0 / _6222;
    float _6234 = fma(_5327, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6224);
    float _6236 = _6234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6238 = exp2(_6214);
    float _6240 = _6236 + _6222;
    float _6242 = in.m_83.x;
    float _6244 = in.m_83.y;
    float _6246 = in.m_83.z;
    float _6248 = in.m_83.w;
    float _6250 = _6240 * _6232;
    float _6252 = _6250 * 0.5;
    float _6254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6256 = fma(_6252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6254);
    float _6258 = in.m_85.x;
    float _6260 = in.m_85.y;
    float _6262 = in.m_85.z;
    float _6264 = 1.0 / _6256;
    float _6266 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6268 = _6264 * _6266;
    float _6270 = abs(_6268);
    float _6272 = log2(_6270);
    float _6274 = _6264;
    float _6276 = _6087;
    if (_6228)
    {
        _4367 = _6260;
    }
    float _6278 = _4367;
    float _6280 = _6278;
    if (_6228)
    {
        _3651 = _6258;
    }
    float _6282 = _3651;
    float _6284 = _6282;
    if (_6228)
    {
        _5295 = _6262;
    }
    float _6286 = _5295;
    float _6288 = _6286;
    if (_6228)
    {
        _4369 = _6278;
    }
    float _6290 = _4369;
    float _6292 = _6290;
    if (_6228)
    {
        _6274 = _6282;
    }
    float _6294 = _6274;
    float _6296 = _6294;
    if (!_6228)
    {
        _6280 = _6260;
    }
    float _6298 = _6280;
    if (!_6228)
    {
        _6284 = _6258;
    }
    float _6300 = _6284;
    float _6302 = _6272 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6304 = _6272;
    if (_6228)
    {
        _6304 = _6286;
    }
    float _6306 = _6304;
    float _6308 = _6306;
    if (!_6228)
    {
        float _6310 = fma(_5499, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6298);
        _6292 = _6310;
    }
    float _6312 = _6292;
    if (!_6228)
    {
        _6288 = _6262;
    }
    float _6314 = _6288;
    if (!_6228)
    {
        float _6316 = fma(_5497, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6300);
        _6296 = _6316;
    }
    float _6318 = _6296;
    float _6320 = _6246 * _6300;
    float _6322 = exp2(_6302);
    float _6324 = _6242 * _6298;
    float _6326 = _6244 * _6314;
    float _6328 = -_6320;
    float _6330 = fma(_6242, _6314, _6328);
    if (!_6228)
    {
        float _6332 = fma(_5501, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6314);
        _6308 = _6332;
    }
    float _6334 = _6308;
    float _6336 = -_6324;
    float _6338 = fma(_6244, _6300, _6336);
    float _6340 = -_6326;
    float _6342 = fma(_6246, _6298, _6340);
    float _6344 = _6330 * _6248;
    float _6346 = _5509 * _5619;
    float _6348 = _6338 * _6248;
    float _6350 = _6342 * _6248;
    float _6352 = _5567 * _5627;
    float _6354 = _5581 * _5627;
    float _6356 = fma(_5583, _5611, _6346);
    bool _6358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6360 = isnan(0.5);
    bool _6362 = _6358 || _6360;
    bool _6364 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6366 = _6362 || _6364;
    float _6368 = fma(_6322, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6370 = precise::clamp(_6368, 0.0, 1.0);
    float _6372 = _5581 * _5641;
    float _6374 = _5581 * _5619;
    float _6376 = fma(_6370, -2.0, 3.0);
    float _6378 = _6370 * _6370;
    float _6380 = fma(_5609, _5601, _6372);
    float _6382 = _6378 * _6376;
    float _6384 = _5509 * _5627;
    float _6386 = _5509 * _5641;
    float _6388 = _5567 * _5641;
    float _6390 = _5567 * _5619;
    float _6392 = fma(_5583, _5599, _6384);
    float _6394 = fma(_5583, _5601, _6386);
    float _6396 = -_5487;
    float _6398 = fma(_6396, _5599, _6352);
    float _6400 = fma(_5609, _5599, _6354);
    float _6402 = -_5487;
    float _6404 = fma(_6402, _5601, _6388);
    float _6406 = -_5487;
    float _6408 = fma(_6406, _5611, _6390);
    float _6410 = fma(_5585, _5491, _6398);
    float _6412 = fma(_5573, _5507, _6394);
    float _6414 = fma(_5609, _5611, _6374);
    float _6416 = fma(_5573, _5491, _6392);
    float _6418 = fma(_5511, _5491, _6400);
    float _6420 = fma(_5585, _5507, _6404);
    float _6422 = fma(_5585, _5495, _6408);
    float _6424 = _6410 * _6244;
    float _6426 = fma(_5573, _5495, _6356);
    float _6428 = fma(_5511, _5507, _6380);
    float _6430 = fma(_5511, _5495, _6414);
    float _6432 = _6420 * _6244;
    float _6434 = _6422 * _6244;
    float _6436 = fma(_6416, _6242, _6424);
    float _6438 = _6344 * _6410;
    float _6440 = fma(_6412, _6242, _6432);
    float _6442 = fma(_6426, _6242, _6434);
    float _6444 = fma(_6418, _6246, _6436);
    float _6446 = _6344 * _6420;
    float _6448 = in.m_87.x;
    float _6450 = _6344 * _6422;
    float _6452 = fma(_6350, _6416, _6438);
    float _6454 = fma(_6350, _6412, _6446);
    float _6456 = -_6382;
    float _6458 = _6456 + 1.0;
    float _6460 = fma(_6350, _6426, _6450);
    float _6462 = fma(_6348, _6418, _6452);
    float _6464 = fma(_6348, _6428, _6454);
    float _6466 = _6420 * _6312;
    float _6468 = fma(_6348, _6430, _6460);
    float _6470 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6230);
    float _6472 = fma(_6428, _6246, _6440);
    float _6474 = fma(_6458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6382);
    float _6476 = fma(_6430, _6246, _6442);
    bool _6478 = _6268 <= 8000.0;
    bool _6480 = isnan(_6268);
    bool _6482 = _6478 || _6480;
    bool _6484 = isnan(8000.0);
    bool _6486 = _6482 || _6484;
    float _6488 = float(_6486);
    out.m_89.x = _6462;
    out.m_89.y = _6464;
    out.m_89.z = _6468;
    float _6490 = _6410 * _6312;
    float _6492 = _6422 * _6312;
    float _6494 = fma(_6412, _6318, _6466);
    out.m_91.x = _6444;
    out.m_91.y = _6472;
    out.m_91.z = _6476;
    float _6496 = _6488 * _6474;
    float _6498 = fma(_6416, _6318, _6490);
    float _6500 = fma(_6426, _6318, _6492);
    float _6502 = _6470 + _6087;
    float _6504 = _6502 * 0.5;
    float _6506 = _6502;
    float _6508 = _6464;
    float _6510 = _6470;
    if (_6366)
    {
        _6506 = 1.0;
    }
    float _6512 = _6506;
    float _6514 = _6512;
    if (!_6366)
    {
        float _6516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6518 = _6516 * 0.15915493667125701904296875;
        float _6520 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6522 = _6518 * 6.283185482025146484375;
        float _6524 = cos(_6522);
        float _6526 = _6520 * 0.15915493667125701904296875;
        float _6528 = _6518 * 6.283185482025146484375;
        float _6530 = sin(_6528);
        float _6532 = 1.0 / _6524;
        float _6534 = _6526 * 6.283185482025146484375;
        float _6536 = cos(_6534);
        float _6538 = _6530 * _6532;
        float _6540 = _6526 * 6.283185482025146484375;
        float _6542 = sin(_6540);
        float _6544 = _6536 * _6538;
        float _6546 = 1.0 / _6544;
        float _6548 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6550 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6548;
        float _6552 = 1.0 / _6550;
        float _6554 = _6542 * _6546;
        float _6556 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6558 = fma(_6268, _6554, _6556);
        float _6560 = _6558 * _6552;
        float _6562 = precise::clamp(_6560, 0.0, 1.0);
        _6514 = _6562;
        _6508 = _6546;
    }
    float _6564 = _6514;
    float _6566 = _6508;
    float _6568 = -_6238;
    float _6570 = _6568 + 1.0;
    float _6572 = _6496 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6574 = -_6163;
    float _6576 = _6574 + 1.0;
    float _6578 = _6570 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _6135;
    out.gl_Position.y = _6131;
    out.gl_Position.z = _6470;
    out.gl_Position.w = _6087;
    float _6580 = _6576 * _6572;
    float _6582 = precise::clamp(_6580, 0.0, 1.0);
    float _6584 = fma(_6418, _6334, _6498);
    float _6586 = fma(_6428, _6334, _6494);
    float _6588 = fma(_6430, _6334, _6500);
    float _6590 = -_6582;
    float _6592 = fma(_6590, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _6594 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6596 = isnan(_5861);
    bool _6598 = _6594 || _6596;
    bool _6600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6602 = _6598 || _6600;
    out.m_93.z = _6504;
    out.m_93.w = _6087;
    float _6604 = _6592 * _6448;
    out.m_95.x = _6584;
    out.m_95.y = _6586;
    out.m_95.z = _6588;
    float _6606 = _6604 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6608 = _6578 * _6165;
    float _6610 = -_6578;
    float _6612 = _6610 + 1.0;
    float _6614 = _6180 * _6608;
    float _6616 = _6190 * _6608;
    out.m_97.x = _6606;
    float _6618 = _6564 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6620 = fma(_6186, _6614, _6174);
    float _6622 = fma(_6188, _6614, _6176);
    float _6624 = _6180 * _6612;
    float _6626 = fma(_6180, _6616, _6178);
    float _6628 = _6566;
    float _6630 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _6632 = _6614;
    float _6634 = _6608;
    if (!_6602)
    {
        _6628 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6636 = _6628;
    float _6638 = _6636;
    float _6640 = _6636;
    if (!_6602)
    {
        _6630 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6642 = _6630;
    out.m_99.x = _6620;
    out.m_99.y = _6622;
    out.m_99.z = _6626;
    out.m_99.w = _6624;
    float _6644 = _6642;
    float _6646 = _6642;
    if (!_6602)
    {
        _6276 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6648 = _6276;
    float _6650 = _6648;
    float _6652 = _6648;
    if (!_6602)
    {
        _6510 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6654 = _6510;
    float _6656 = _6654;
    float _6658 = _6654;
    if (!_6602)
    {
        _6632 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6660 = _6632;
    float _6662 = _6660;
    float _6664 = _6660;
    if (!_6602)
    {
        _6634 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6666 = _6634;
    bool _6668 = !_6602;
    float _6670 = _6666;
    float _6672 = _6666;
    if (!_6668)
    {
        bool _6674 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6676 = isnan(_5861);
        bool _6678 = _6674 || _6676;
        bool _6680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6682 = _6678 || _6680;
        if (!_6682)
        {
            float _6684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6686 = _5861 + _6684;
            float _6688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6688;
            float _6692 = 1.0 / _6690;
            float _6694 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6696 = _6694 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6698 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6700 = _6698 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6704 = _6702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6708 = _6706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6712 = _6710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6714 = _6686 * _6692;
            float _6716 = precise::clamp(_6714, 0.0, 1.0);
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6722 = fma(_6716, _6700, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6724 = fma(_6716, _6720, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6726 = fma(_6716, _6696, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6728 = fma(_6716, _6704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6730 = fma(_6716, _6708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6732 = fma(_6716, _6712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6664 = _6726;
            _6646 = _6730;
            _6658 = _6724;
            _6640 = _6728;
            _6672 = _6722;
            _6652 = _6732;
            _6734 = true;
        }
        else
        {
            bool _6736 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6738 = isnan(_5861);
            bool _6740 = _6736 || _6738;
            bool _6742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6744 = _6740 || _6742;
            if (!_6744)
            {
                _6638 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6746 = _6638;
            _6640 = _6746;
            if (!_6744)
            {
                _6644 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6748 = _6644;
            _6646 = _6748;
            if (!_6744)
            {
                _6650 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6750 = _6650;
            _6652 = _6750;
            if (!_6744)
            {
                _6656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6752 = _6656;
            _6658 = _6752;
            if (!_6744)
            {
                _6662 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6754 = _6662;
            _6664 = _6754;
            if (!_6744)
            {
                _6670 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6756 = _6670;
            bool _6758 = !_6744;
            _6672 = _6756;
            if (!_6758)
            {
                bool _6760 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6762 = isnan(_5861);
                bool _6764 = _6760 || _6762;
                bool _6766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6768 = _6764 || _6766;
                if (!_6768)
                {
                    float _6770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6772 = _5861 + _6770;
                    float _6774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6774;
                    float _6778 = 1.0 / _6776;
                    float _6780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6782 = _6780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6784 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6786 = _6784 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6790 = _6788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6794 = _6792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6798 = _6796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6800 = _6772 * _6778;
                    float _6802 = precise::clamp(_6800, 0.0, 1.0);
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6808 = fma(_6802, _6786, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6810 = fma(_6802, _6806, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6812 = fma(_6802, _6782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6814 = fma(_6802, _6790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6816 = fma(_6802, _6794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6818 = fma(_6802, _6798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6664 = _6812;
                    _6646 = _6816;
                    _6658 = _6810;
                    _6640 = _6814;
                    _6672 = _6808;
                    _6652 = _6818;
                    _6734 = true;
                }
                else
                {
                    _6664 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6646 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6640 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6672 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6652 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6734 = false;
    float _6820 = _6664;
    float _6822 = _6646;
    float _6824 = _6658;
    float _6826 = _6640;
    float _6828 = _6672;
    float _6830 = _6652;
    float _6832 = fma(_6586, -0.5, 0.5);
    float _6834 = precise::clamp(_6832, 0.0, 1.0);
    float _6836 = -_6820;
    float _6838 = _6822 + _6836;
    float _6840 = _6618 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6842 = -_6824;
    float _6844 = _6826 + _6842;
    float _6846 = fma(_6834, _6838, _6820);
    out.m_101.x = 0.0;
    float _6848 = -_6828;
    float _6850 = _6830 + _6848;
    float _6852 = fma(_6834, _6844, _6824);
    float _6854 = _6846 * 0.586610972881317138671875;
    out.m_49.x = _6840;
    bool _6856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6858 = fma(_6834, _6850, _6828);
    float _6860 = fma(_6852, 0.298911988735198974609375, _6854);
    bool _6862 = _6564 > 0.0;
    bool _6864 = isnan(_6564);
    bool _6866 = _6862 || _6864;
    bool _6868 = isnan(0.0);
    bool _6870 = _6866 || _6868;
    float _6872 = fma(_6858, 0.114477999508380889892578125, _6860);
    float _6874 = -_6872;
    float _6876 = _6852 + _6874;
    float _6878 = -_6872;
    float _6880 = _6846 + _6878;
    float _6882 = -_6872;
    float _6884 = _6858 + _6882;
    float _6886 = fma(_6876, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    float _6888 = fma(_6880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    float _6890 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    bool _6892 = !_6856;
    if (!_6892)
    {
        float _6894 = -_5829;
        float _6896 = _6894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6898 = -_5833;
        float _6900 = _6898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6902 = -_5837;
        float _6904 = _6902 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6906 = _6896 * _6896;
        float _6908 = fma(_6900, _6900, _6906);
        float _6910 = fma(_6904, _6904, _6908);
        float _6912 = sqrt(_6910);
        float _6914 = rsqrt(_6910);
        float _6916 = -_6912;
        float _6918 = _6916 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6920 = _6918 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6922 = precise::clamp(_6920, 0.0, 1.0);
        float _6924 = _6900 * _6914;
        float _6926 = _6896 * _6914;
        float _6928 = abs(_6922);
        float _6930 = log2(_6928);
        float _6932 = _6904 * _6914;
        float _6934 = _6924 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6936 = _6586 * _6926;
        float _6938 = -_6926;
        float _6940 = -_6934;
        float _6942 = fma(_6938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6940);
        float _6944 = fma(_6584, _6924, _6936);
        float _6946 = -_6932;
        float _6948 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6942);
        float _6950 = fma(_6588, _6932, _6944);
        float _6952 = precise::clamp(_6950, 0.0, 1.0);
        float _6954 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6956 = _6948 + _6954;
        float _6958 = _6930 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6960 = _6956 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6962 = precise::clamp(_6960, 0.0, 1.0);
        float _6964 = exp2(_6958);
        float _6966 = _6964 * _6962;
        float _6968 = _6952 * _6966;
        float _6970 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6972 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6974 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _6970;
        out.m_101.y = _6972;
        out.m_101.z = _6974;
    }
    out.m_103.x = _6886;
    out.m_103.y = _6888;
    out.m_103.z = _6890;
    if (_6870)
    {
        return out;
    }
    float _6976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6976;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6734 = false;
    bool _1464 = false;
    bool _1136 = false;
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
        float _7033 = as_type<float>(_138);
        out.gl_Position.z = _7033;
    }
    if (!_126)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _142 = in.m_51.w;
    bool _144 = _142 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _146 = isnan(_142);
    bool _148 = _144 || _146;
    bool _150 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _152 = _148 || _150;
    float _154 = -_142;
    float _156 = _154 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _158 = 0.0;
    float _160 = _156;
    if (_152)
    {
        float _162 = float(_122);
        _158 = _162;
    }
    float _164 = _158;
    bool _166 = _156 >= _164;
    bool _168 = !_152;
    bool _170 = _166 || _168;
    if (_170)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _172 = _132;
    if (_170)
    {
        out.m_49.x = 0.0;
    }
    if (_170)
    {
        float _174 = _172 * 5.0;
        _140 = as_type<int>(_174);
    }
    int _176 = _140;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7102 = as_type<float>(_176);
        out.gl_Position.z = _7102;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _362 = _360 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _364 = _354 * _350;
    float _366 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _368 = _366 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = _356 * _350;
    float _372 = -_326;
    float _374 = _372 + 1.0;
    float _376 = _352 * _350;
    float _378 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].x, _370);
    float _380 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].y, _364);
    float _382 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[143].z, _376);
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _386 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _384;
    float _388 = fma(_330, _298, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _390 = fma(_362, _298, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _392 = fma(_368, _298, (*spvDescriptorSet0.vp_c9)._m0[144].z);
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
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _454 + _520;
    bool _524 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _526 = _496 * _518;
    float _528 = -_496;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _484;
    float _534 = _500 * _514;
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _540 = _422 * _462;
    float _542 = _424 * _464;
    float _544 = fma(_534, _458, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _546 = _420 * _460;
    float _548 = _538 * _532;
    float _550 = -_512;
    float _552 = _550 + 1.0;
    float _554 = _544 * _526;
    float _556 = fma(_548, _522, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _558 = _480 * _552;
    float _560 = fma(_530, (*spvDescriptorSet0.vp_c9)._m0[115].x, _554);
    float _562 = fma(_556, _558, _560);
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _566 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _568 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[117].x, _562);
    float _570 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _572 = _564 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _574 = _566 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _576 = _568 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _578 = _570 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _572;
    out.m_59.y = _574;
    out.m_59.z = _578;
    out.m_59.w = _576;
    bool _580 = !_524;
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
    float _674 = fma(_670, _660, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _676 = _666 * _654;
    float _678 = _672 * _654;
    float _680 = _674 * _654;
    float _682 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[123].x, _676);
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
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _726 = _722 + _724;
    bool _728 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _730 = isnan(_722);
    bool _732 = _728 || _730;
    bool _734 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _736 = _732 || _734;
    float _738 = float(_736);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _744 = _722 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _746 = isnan(_722);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _758 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _756;
    float _760 = _688 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _762 = -_738;
    float _764 = _762 + 1.0;
    bool _766 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _768 = 1.0 / _742;
    float _770 = _754 * _764;
    float _772 = -_754;
    float _774 = _772 + 1.0;
    float _776 = _758 * _768;
    float _778 = _692 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _780 = fma(_776, _726, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _782 = _780 * _770;
    float _784 = _690 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _786 = fma(_774, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _788 = _760 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = _784 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _792 = fma(_738, (*spvDescriptorSet0.vp_c9)._m0[132].x, _786);
    float _794 = _778 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _796 = _792 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _788;
    out.m_61.y = _790;
    out.m_61.z = _794;
    out.m_61.w = _796;
    bool _798 = !_766;
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
    bool _962 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _964 = isnan(_826);
    bool _966 = _962 || _964;
    bool _968 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _970 = _966 || _968;
    float _972 = float(_970);
    float _974 = 1.0 / _938;
    float _976 = _950 * _956;
    float _978 = -_950;
    float _980 = _978 + 1.0;
    float _982 = 1.0 / _960;
    float _984 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _986 = _984 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _988 = _972 * _980;
    float _990 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _992 = _990 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _994 = _986 * _894;
    float _996 = _914 * _988;
    float _998 = -_972;
    float _1000 = _998 + 1.0;
    float _1002 = 1.0 / _992;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1008 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1010 = _826 + _1008;
    float _1012 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1014 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1012;
    float _1016 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _996);
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1022 = fma(_994, _1010, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1024 = _1014 * _974;
    float _1026 = 1.0 / _1006;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1030 = _826 + _1028;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1034 = _1032 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1036 = fma(_1022, _976, _1016);
    float _1038 = fma(_1024, _1030, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1042 = _826 + _1040;
    float _1044 = _1034 * _982;
    float _1046 = 1.0 / _1020;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1050 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1048;
    float _1052 = fma(_1038, _952, _1036);
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1056 = _1054 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1058 = _1050 * _1002;
    float _1060 = fma(_1044, _1042, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1062 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1064 = _826 + _1062;
    float _1066 = _1056 * _1026;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1068;
    bool _1072 = _826 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1074 = isnan(_826);
    bool _1076 = _1072 || _1074;
    bool _1078 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1080 = _1076 || _1078;
    float _1082 = float(_1080);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1086 = _826 + _1084;
    float _1088 = fma(_1058, _1064, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1090 = fma(_1060, _930, _1052);
    float _1092 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1094 = _826 + _1092;
    float _1096 = fma(_1066, _1086, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1098 = _1070 * _1046;
    float _1100 = -_1082;
    float _1102 = _1100 + 1.0;
    float _1104 = fma(_1088, _916, _1090);
    float _1106 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1108 = _842 * _1102;
    float _1110 = fma(_1096, _882, _1104);
    float _1112 = fma(_1106, _1108, _1110);
    float _1114 = fma(_1082, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1112);
    out.m_63.x = _1114;
    bool _1116 = !_892;
    float _1134;
    if (!_1116)
    {
        float _1118 = in.m_55.x;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1122 = _1118 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1124 = fma(_1122, (*spvDescriptorSet0.vp_c9)._m0[14].y, _156);
        float _1126 = _1124 * _1120;
        float _1128 = floor(_1126);
        float _1130 = -_1128;
        float _1132 = _1126 + _1130;
        _1134 = _1132;
        _1136 = true;
    }
    else
    {
        float _1138 = float(_122);
        float _1140 = 1.0 / _1138;
        float _1142 = _156 * _1140;
        _1134 = _1142;
    }
    _1136 = false;
    float _1144 = _1134;
    float _1146 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1148 = _1144 + _1146;
    bool _1150 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1152 = isnan(_1144);
    bool _1154 = _1150 || _1152;
    bool _1156 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1158 = _1154 || _1156;
    float _1160 = float(_1158);
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1164 = _1162 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1166 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1168 = isnan(_1144);
    bool _1170 = _1166 || _1168;
    bool _1172 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1174 = _1170 || _1172;
    float _1176 = float(_1174);
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1178;
    bool _1182 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1184 = isnan(_1144);
    bool _1186 = _1182 || _1184;
    bool _1188 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1190 = _1186 || _1188;
    float _1192 = float(_1190);
    float _1194 = -_1160;
    float _1196 = _1194 + 1.0;
    float _1198 = 1.0 / _1164;
    float _1200 = _1176 * _1196;
    float _1202 = -_1192;
    float _1204 = _1202 + 1.0;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1208 = _1206 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1210 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1212 = 1.0 / _1208;
    float _1214 = _1180 * _1198;
    float _1216 = -_1176;
    float _1218 = _1216 + 1.0;
    bool _1220 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1222 = isnan(_1144);
    bool _1224 = _1220 || _1222;
    bool _1226 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1228 = _1224 || _1226;
    float _1230 = float(_1228);
    float _1232 = fma(_1214, _1148, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1234 = _1192 * _1218;
    bool _1236 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1238 = isnan(_1144);
    bool _1240 = _1236 || _1238;
    bool _1242 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1244 = _1240 || _1242;
    float _1246 = float(_1244);
    float _1248 = _1230 * _1204;
    float _1250 = -_1230;
    float _1252 = _1250 + 1.0;
    float _1254 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1256 = _1254 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1258 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1260 = isnan(_1144);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1266 = _1262 || _1264;
    float _1268 = float(_1266);
    float _1270 = _1246 * _1252;
    float _1272 = -_1246;
    float _1274 = _1272 + 1.0;
    float _1276 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1278 = _1276 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1280 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1282 = isnan(_1144);
    bool _1284 = _1280 || _1282;
    bool _1286 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1288 = _1284 || _1286;
    float _1290 = float(_1288);
    float _1292 = 1.0 / _1256;
    float _1294 = _1268 * _1274;
    float _1296 = -_1268;
    float _1298 = _1296 + 1.0;
    float _1300 = 1.0 / _1278;
    float _1302 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1304 = _1302 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1306 = _1290 * _1298;
    float _1308 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1310 = _1308 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1312 = _1304 * _1212;
    float _1314 = _1232 * _1306;
    float _1316 = -_1290;
    float _1318 = _1316 + 1.0;
    float _1320 = 1.0 / _1310;
    float _1322 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1324 = _1322 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1326 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1328 = _1144 + _1326;
    float _1330 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1332 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _1330;
    float _1334 = fma(_1318, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1314);
    float _1336 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1338 = _1336 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _1340 = fma(_1312, _1328, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1342 = _1332 * _1292;
    float _1344 = 1.0 / _1324;
    float _1346 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1348 = _1144 + _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _1352 = _1350 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1354 = fma(_1340, _1294, _1334);
    float _1356 = fma(_1342, _1348, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _1358 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1360 = _1144 + _1358;
    float _1362 = _1352 * _1300;
    float _1364 = 1.0 / _1338;
    float _1366 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _1368 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _1366;
    float _1370 = fma(_1356, _1270, _1354);
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1376 = _1368 * _1320;
    float _1378 = fma(_1362, _1360, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _1380 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1382 = _1144 + _1380;
    float _1384 = _1374 * _1344;
    float _1386 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _1388 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _1386;
    bool _1390 = _1144 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1392 = isnan(_1144);
    bool _1394 = _1390 || _1392;
    bool _1396 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1398 = _1394 || _1396;
    float _1400 = float(_1398);
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1404 = _1144 + _1402;
    float _1406 = fma(_1376, _1382, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _1408 = fma(_1378, _1248, _1370);
    float _1410 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1412 = _1144 + _1410;
    float _1414 = fma(_1384, _1404, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _1416 = _1388 * _1364;
    float _1418 = -_1400;
    float _1420 = _1418 + 1.0;
    float _1422 = fma(_1406, _1234, _1408);
    float _1424 = fma(_1416, _1412, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _1426 = _1160 * _1420;
    float _1428 = fma(_1414, _1200, _1422);
    float _1430 = fma(_1424, _1426, _1428);
    float _1432 = fma(_1400, (*spvDescriptorSet0.vp_c9)._m0[174].x, _1430);
    out.m_65.x = _1432;
    bool _1434 = !_1210;
    float _1436 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _1438 = _1354;
    float _1440 = _1234;
    float _1442 = _1248;
    float _1444 = _1270;
    float _1462;
    if (!_1434)
    {
        float _1446 = in.m_55.x;
        float _1448 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _1450 = _1446 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _1452 = fma(_1450, (*spvDescriptorSet0.vp_c9)._m0[14].z, _156);
        float _1454 = _1452 * _1448;
        float _1456 = floor(_1454);
        float _1458 = -_1456;
        float _1460 = _1454 + _1458;
        _1462 = _1460;
        _1464 = true;
    }
    else
    {
        float _1466 = float(_122);
        float _1468 = 1.0 / _1466;
        float _1470 = _156 * _1468;
        _1462 = _1470;
    }
    _1464 = false;
    float _1472 = _1462;
    float _1474 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1476 = int(_1474);
    float _1478 = in.m_55.y;
    float _1480 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1482 = int(_1480);
    float _1484 = float(_1476);
    float _1486 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1488 = int(_1486);
    float _1490 = float(uint(_1482));
    float _1492 = 1.0 / _1484;
    float _1494 = 1.0 / _1490;
    float _1496 = float(_1488);
    int _1498 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1500 = _1498 != 0;
    float _1502 = _1492 * _156;
    float _1504 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1506 = int(_1504);
    int _1508 = as_type<int>(_1494) + (-2);
    float _1510 = trunc(_1502);
    int _1512 = int(_1510);
    float _1514 = float(_122);
    if (_1500)
    {
        float _1516 = in.m_55.x;
        _1436 = _1516;
    }
    float _1518 = _1436;
    int _1520 = ~_1482;
    int _1522 = _1520 + 1;
    int _1524 = 0;
    int _1526 = 0;
    float _1528 = _1518;
    if (_1500)
    {
        _1524 = 0;
        _1526 = 0;
    }
    int _1530 = _1524;
    int _1532 = _1526;
    int _1534 = _1530;
    int _1536 = _1532;
    if (_1500)
    {
        _1438 = 1.0;
    }
    float _1538 = _1438;
    float _1540 = _1364;
    float _1542 = _1538;
    if (_1500)
    {
        float _1544 = in.m_55.z;
        _1540 = _1544;
    }
    float _1546 = _1540;
    if (_1500)
    {
        _1440 = 1.0;
    }
    float _1548 = _1440;
    float _1550 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1552 = int(_1550);
    float _1554 = float(uint(_1506));
    float _1556 = _1548;
    if (_1500)
    {
        _1442 = 1.0;
    }
    float _1558 = _1442;
    int _1560 = 0;
    float _1562 = _1558;
    if (_1500)
    {
        _1560 = as_type<int>(_1478);
    }
    int _1564 = _1560;
    float _1566 = float(uint(_1512));
    float _1568 = 1.0 / _1496;
    float _1570 = as_type<float>(_1508) * _1566;
    float _1572 = float(_1552);
    float _1574 = trunc(_1570);
    float _1576 = precise::max(_1574, 0.0);
    uint _1579 = uint(_1576);
    int _1581 = 0;
    float _1583 = _1570;
    float _1585 = _1546;
    int _1587 = _1564;
    if (_1500)
    {
        _1581 = as_type<int>(_1546);
    }
    int _1589 = _1581;
    float _1591 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1593 = int(_1591);
    int _1595 = _1589;
    if (_1500)
    {
        _1583 = _1518;
    }
    float _1597 = _1583;
    float _1599 = _1597;
    if (_1500)
    {
        _1444 = _1597;
    }
    float _1601 = _1444;
    int _1603 = 0;
    float _1605 = _1601;
    if (_1500)
    {
        _1603 = as_type<int>(_1597);
    }
    int _1607 = _1603;
    int _1609 = _1522 * int(_1579);
    int _1611 = _1609 + _1512;
    float _1613 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1615 = int(_1613);
    float _1617 = float(uint(_1611));
    float _1619 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1621 = int(_1619);
    float _1623 = as_type<float>(_1508) * _1617;
    float _1625 = 1.0 / _1514;
    float _1627 = 1.0 / _1554;
    float _1629 = 1.0 / _1572;
    float _1631 = trunc(_1623);
    float _1633 = precise::max(_1631, 0.0);
    uint _1635 = uint(_1633);
    int _1637 = _1607;
    if (!_1500)
    {
        float _1639 = in.m_55.x;
        float _1641 = _1478 * 3.1415927410125732421875;
        float _1643 = in.m_55.z;
        float _1645 = _1641 * 0.15915493667125701904296875;
        float _1647 = _1645 * 6.283185482025146484375;
        float _1649 = sin(_1647);
        float _1651 = _1639 * 3.1415927410125732421875;
        float _1653 = _1651 * 0.15915493667125701904296875;
        float _1655 = _1643 * 3.1415927410125732421875;
        float _1657 = _1655 * 0.15915493667125701904296875;
        float _1659 = _1653 * 6.283185482025146484375;
        float _1661 = sin(_1659);
        float _1663 = _1657 * 6.283185482025146484375;
        float _1665 = sin(_1663);
        _1542 = 7.345489978790283203125;
        _1528 = _1639;
        _1556 = 1.2345600128173828125;
        _1599 = _1478;
        _1562 = 5.839270114898681640625;
        _1605 = _1643;
        _1585 = _1643;
        _1534 = 1;
        _1587 = as_type<int>(_1649);
        _1637 = as_type<int>(_1661);
        _1595 = as_type<int>(_1665);
        _1536 = 2;
    }
    float _1667 = _1542;
    float _1669 = _1528;
    float _1671 = _1556;
    float _1673 = _1599;
    float _1675 = _1562;
    float _1677 = _1605;
    float _1679 = _1585;
    int _1681 = _1534;
    int _1683 = _1587;
    int _1685 = _1637;
    int _1687 = _1595;
    int _1689 = _1536;
    float _1691 = _1667 * _1669;
    int _1693 = ~_1482;
    int _1695 = _1693 + 1;
    float _1697 = _1568 * _156;
    int _1699 = int(_1579) + int(_1635);
    float _1701 = floor(_1691);
    float _1703 = float(_1482);
    float _1705 = in.m_67.x;
    float _1707 = float(_1512);
    int _1709 = _1695 * _1699;
    int _1711 = _1709 + _1512;
    float _1713 = _1671 * _1673;
    bool _1715 = _1707 >= _1703;
    bool _1717 = isnan(_1707);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan(_1703);
    bool _1723 = _1719 || _1721;
    float _1725 = float(_1723);
    float _1727 = trunc(_1697);
    int _1729 = int(_1727);
    bool _1731 = uint(_1711) >= uint(_1482);
    float _1733 = _1667 * _1673;
    float _1735 = float(_1621);
    float _1737 = _1675 * _1677;
    bool _1739 = !_1731;
    int _1741 = _1739 ? 0 : (-1);
    float _1743 = in.m_67.y;
    int _1745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1747 = _1745 != 0;
    float _1749 = trunc(_1725);
    int _1751 = int(_1749);
    int _1753 = ~_1699;
    int _1755 = _1753 + _1741;
    int _1757 = _1755 + 1;
    float _1759 = -_1701;
    float _1761 = _1691 + _1759;
    bool _1763 = !_1747;
    int _1765 = _1763 ? 0 : 1;
    float _1767 = _1761 * _1703;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1771 = _1769 != 0;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1775 = _1773 != 0;
    int _1777 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1779 = _1777 != 0;
    float _1781 = _1703 * _156;
    int _1783 = _1482 * _1757;
    int _1785 = _1783 + _1512;
    int _1787 = abs(_1765);
    float _1789 = 1.0 / _1735;
    bool _1791 = !_1775;
    int _1793 = _1791 ? 0 : 1;
    float _1795 = _1781 * _1625;
    bool _1797 = _1482 == 0;
    int _1799 = ~_1751;
    int _1801 = _1799 + 1;
    int _1803 = _1801 + 1;
    bool _1805 = !_1797;
    int _1807 = _1805 ? _1785 : (-1);
    float _1809 = trunc(_1767);
    int _1811 = int(_1809);
    int _1813 = abs(_1793);
    int _1815 = _1807 * _1803;
    int _1817 = _1482 + (-1);
    float _1819 = trunc(_1795);
    int _1821 = int(_1819);
    bool _1823 = !_1771;
    int _1825 = _1823 ? 0 : 1;
    int _1827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1829 = _1827 != 0;
    int _1831 = _1751 * _1817;
    int _1833 = _1831 + _1815;
    int _1835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1837 = _1835 != 0;
    float _1839 = float(uint(_1615));
    int _1841 = _1811 * _1787;
    int _1843 = _1841 + _1512;
    bool _1845 = !_1779;
    int _1847 = _1845 ? 0 : 1;
    int _1849 = _1833 * _1813;
    int _1851 = abs(_1825);
    float _1853 = 1.0 / _1839;
    bool _1855 = !_1829;
    int _1857 = _1855 ? 0 : 1;
    int _1859 = abs(_1847);
    int _1861 = 0;
    float _1863 = as_type<float>(_1811);
    bool _1865 = false;
    bool _1867 = false;
    if (_1837)
    {
        float _1869 = in.m_55.x;
        _1861 = as_type<int>(_1869);
    }
    int _1871 = _1861;
    int _1873 = abs(_1857);
    float _1875 = _1629 * _156;
    int _1877 = _1821 * _1851;
    int _1879 = _1877 + _1849;
    float _1881 = _1789 * _156;
    int _1883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1885 = _1883 != 0;
    int _1887 = _1843 * _1859;
    int _1889 = _1887 + _1879;
    int _1891 = as_type<int>(_1627) + (-2);
    float _1893 = in.m_55.w;
    float _1895 = float(uint(_1729));
    int _1897 = _1811 * _1873;
    int _1899 = _1897 + _1889;
    float _1901 = float(uint(_1593));
    float _1903 = trunc(_1875);
    int _1905 = int(_1903);
    float _1907 = _1705;
    if (!_1837)
    {
        _1863 = _1705;
    }
    float _1909 = _1863;
    float _1911 = as_type<float>(_1891) * _1895;
    float _1913 = float(uint(_1899));
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _1917 = _1915 != 0;
    float _1919 = as_type<float>(_1879);
    int _1921 = as_type<int>(_1913);
    float _1923 = _1909;
    if (_1885)
    {
        float _1925 = in.m_55.z;
        _1919 = _1925;
    }
    float _1927 = _1919;
    bool _1929 = _1478 > 0.5;
    float _1931 = as_type<float>(_1508) * _1913;
    float _1933 = 1.0 / _1901;
    if (_1837)
    {
        float _1935 = -_1705;
        float _1937 = _1935 + 1.0;
        _1921 = as_type<int>(_1937);
    }
    int _1939 = _1921;
    int _1941 = _1871;
    if (_1837)
    {
        bool _1943 = as_type<float>(_1871) > 0.5;
        _1865 = _1943;
    }
    bool _1945 = _1865;
    if (_1885)
    {
        float _1947 = -_1705;
        float _1949 = _1947 + 1.0;
        _1941 = as_type<int>(_1949);
    }
    int _1951 = _1941;
    int _1953 = ~_1506;
    int _1955 = _1953 + 1;
    int _1957 = _1951;
    if (_1837)
    {
        float _1959 = _1945 ? as_type<float>(_1939) : _1705;
        _1923 = _1959;
    }
    float _1961 = _1923;
    float _1963 = trunc(_1931);
    float _1965 = precise::max(_1963, 0.0);
    uint _1967 = uint(_1965);
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1971 = _1969 != 0;
    int _1973 = 0;
    if (_1917)
    {
        float _1975 = -_1705;
        float _1977 = _1975 + 1.0;
        _1973 = as_type<int>(_1977);
    }
    int _1979 = _1973;
    float _1981 = float(uint(_1905));
    bool _1983 = _1893 > 0.5;
    int _1985 = ~_1615;
    int _1987 = _1985 + 1;
    float _1989 = trunc(_1881);
    int _1991 = int(_1989);
    int _1993 = ~_1482;
    int _1995 = _1993 + 1;
    int _1997 = as_type<int>(_1933) + (-2);
    float _1999 = _1927;
    float _2001 = as_type<float>(_1995);
    int _2003 = _1979;
    if (_1885)
    {
        bool _2005 = _1927 > 0.5;
        _1867 = _2005;
    }
    bool _2007 = _1867;
    if (!_1971)
    {
        _1999 = _1705;
    }
    float _2009 = _1999;
    int _2011 = _1995 * int(_1967);
    int _2013 = _2011 + _1899;
    float _2015 = _2009;
    if (!_1885)
    {
        _2001 = _1705;
    }
    float _2017 = _2001;
    float _2019 = as_type<float>(_1997) * _1981;
    float _2021 = _2017;
    if (_1885)
    {
        float _2023 = _2007 ? as_type<float>(_1951) : _1705;
        _2021 = _2023;
    }
    float _2025 = _2021;
    if (_1971)
    {
        float _2027 = -_1705;
        float _2029 = _2027 + 1.0;
        _1957 = as_type<int>(_2029);
    }
    int _2031 = _1957;
    float _2033 = float(uint(_2013));
    float _2035 = trunc(_1911);
    float _2037 = precise::max(_2035, 0.0);
    uint _2039 = uint(_2037);
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _2043 = _2041 != 0;
    int _2045 = as_type<int>(_1853) + (-2);
    float _2047 = as_type<float>(_1508) * _2033;
    float _2049 = float(uint(_1991));
    float _2051 = _2033;
    if (!_1917)
    {
        _2051 = _1705;
    }
    float _2053 = _2051;
    float _2055 = trunc(_2019);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    float _2061 = _2053;
    if (_1917)
    {
        float _2063 = _1929 ? as_type<float>(_1979) : _1705;
        _2061 = _2063;
    }
    float _2065 = _2061;
    float _2067 = as_type<float>(_2045) * _2049;
    if (_1971)
    {
        float _2069 = _1929 ? as_type<float>(_2031) : _1705;
        _2015 = _2069;
    }
    float _2071 = _2015;
    if (_2043)
    {
        float _2073 = -_1705;
        float _2075 = _2073 + 1.0;
        _2003 = as_type<int>(_2075);
    }
    int _2077 = _2003;
    int _2079 = ~_1593;
    int _2081 = _2079 + 1;
    float _2083 = trunc(_2047);
    float _2085 = precise::max(_2083, 0.0);
    uint _2087 = uint(_2085);
    int _2089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2091 = _2089 != 0;
    int _2093 = _1955 * int(_2039);
    int _2095 = _2093 + _1729;
    if (_2043)
    {
        float _2097 = _1929 ? as_type<float>(_2077) : _1705;
        _1907 = _2097;
    }
    float _2099 = _1907;
    int _2101 = ~_1482;
    int _2103 = _2101 + 1;
    float _2105 = floor(_1713);
    float _2107 = float(uint(_2095));
    bool _2109 = _1506 == 0;
    float _2111 = as_type<float>(_1891) * _2107;
    float _2113 = trunc(_2067);
    float _2115 = precise::max(_2113, 0.0);
    uint _2117 = uint(_2115);
    int _2119 = int(_1967) + int(_2087);
    int _2121 = _2081 * int(_2059);
    int _2123 = _2121 + _1905;
    float _2125 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _2127 = _2125 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2133 = floor(_1733);
    float _2135 = -_2105;
    float _2137 = _1713 + _2135;
    float _2139 = float(uint(_2123));
    int _2141 = _2103 * _2119;
    int _2143 = _2141 + _1899;
    float _2145 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _2147 = _2145 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    int _2149 = _1987 * int(_2117);
    int _2151 = _2149 + _1991;
    float _2153 = floor(_1737);
    float _2155 = as_type<float>(_1997) * _2139;
    bool _2157 = uint(_2143) >= uint(_1482);
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _2161 = _2159 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _2163 = float(_1615);
    float _2165 = float(_1905);
    float _2167 = -_2133;
    float _2169 = _1733 + _2167;
    float _2171 = float(uint(_2151));
    float _2173 = trunc(_2111);
    float _2175 = precise::max(_2173, 0.0);
    uint _2177 = uint(_2175);
    float _2179 = _1625 * _156;
    float _2181 = float(_1506);
    float _2183 = as_type<float>(_2045) * _2171;
    bool _2185 = !_2157;
    int _2187 = _2185 ? 0 : (-1);
    float _2189 = -_2153;
    float _2191 = _1737 + _2189;
    float _2193 = trunc(_2155);
    float _2195 = precise::max(_2193, 0.0);
    uint _2197 = uint(_2195);
    float _2199 = float(_1593);
    float _2201 = _2181 * _2137;
    float _2203 = float(_1729);
    int _2205 = ~_2119;
    int _2207 = _2205 + _2187;
    int _2209 = _2207 + 1;
    float _2211 = _2199 * _2191;
    int _2213 = ~_1506;
    int _2215 = _2213 + 1;
    float _2217 = trunc(_2183);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = float(_1991);
    int _2225 = _1482 * _2209;
    int _2227 = _2225 + _1899;
    int _2229 = int(_2039) + int(_2177);
    bool _2231 = _2223 >= _2163;
    bool _2233 = isnan(_2223);
    bool _2235 = _2231 || _2233;
    bool _2237 = isnan(_2163);
    bool _2239 = _2235 || _2237;
    float _2241 = float(_2239);
    bool _2243 = _2203 >= _2181;
    bool _2245 = isnan(_2203);
    bool _2247 = _2243 || _2245;
    bool _2249 = isnan(_2181);
    bool _2251 = _2247 || _2249;
    float _2253 = float(_2251);
    float _2255 = _2181 * _2179;
    bool _2257 = _2165 >= _2199;
    bool _2259 = isnan(_2165);
    bool _2261 = _2257 || _2259;
    bool _2263 = isnan(_2199);
    bool _2265 = _2261 || _2263;
    float _2267 = float(_2265);
    float _2269 = _2199 * _2179;
    int _2271 = ~_1615;
    int _2273 = _2271 + 1;
    float _2275 = _2163 * _2179;
    float _2277 = _2163 * _2169;
    int _2279 = int(_2059) + int(_2197);
    int _2281 = _2215 * _2229;
    int _2283 = _2281 + _1729;
    int _2285 = int(_2117) + int(_2221);
    float _2287 = trunc(_2201);
    int _2289 = int(_2287);
    int _2291 = ~_1593;
    int _2293 = _2291 + 1;
    bool _2295 = !_2091;
    int _2297 = _2295 ? 0 : 1;
    int _2299 = _2273 * _2285;
    int _2301 = _2299 + _1991;
    bool _2303 = !_1797;
    int _2305 = _2303 ? _2227 : (-1);
    int _2307 = _2293 * _2279;
    int _2309 = _2307 + _1905;
    bool _2311 = uint(_2283) >= uint(_1506);
    float _2313 = trunc(_2255);
    int _2315 = int(_2313);
    bool _2317 = uint(_2301) >= uint(_1615);
    int _2319 = abs(_2297);
    int _2321 = _2305 & 3;
    bool _2323 = _2321 != 0;
    bool _2325 = !_2311;
    int _2327 = _2325 ? 0 : (-1);
    float _2329 = trunc(_2253);
    int _2331 = int(_2329);
    bool _2333 = uint(_2309) >= uint(_1593);
    bool _2335 = uint(_2321) > 1u;
    int _2337 = ~_2229;
    int _2339 = _2337 + _2327;
    int _2341 = _2339 + 1;
    int _2343 = _2289 * _2319;
    int _2345 = _2343 + _1729;
    bool _2347 = !_2333;
    int _2349 = _2347 ? 0 : (-1);
    float _2351 = trunc(_2275);
    int _2353 = int(_2351);
    int _2355 = _2305 & 3;
    bool _2357 = _2355 != 0;
    int _2359 = _1506 * _2341;
    int _2361 = _2359 + _1729;
    float _2363 = -_1743;
    float _2365 = _2363 + 1.0;
    bool _2367 = !_2317;
    int _2369 = _2367 ? 0 : (-1);
    int _2371 = _2357 ? 0 : 1;
    int _2373 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2375 = _2373 != 0;
    float _2377 = 1.0 / _2127;
    int _2379 = ~_2279;
    int _2381 = _2379 + _2349;
    int _2383 = _2381 + 1;
    int _2385 = ~_2371;
    int _2387 = _2385 + 1;
    int _2389 = _2387 + 1;
    int _2391 = ~_2331;
    int _2393 = _2391 + 1;
    int _2395 = _2393 + 1;
    int _2397 = _1593 * _2383;
    int _2399 = _2397 + _1905;
    bool _2401 = !_2109;
    int _2403 = _2401 ? _2361 : (-1);
    float _2405 = 1.0 / _2131;
    int _2407 = _2389;
    if (!_2335)
    {
        int _2409 = ~_2371;
        int _2411 = _2409 + 1;
        _2407 = _2411;
    }
    int _2413 = _2407;
    int _2415 = _1983 ? as_type<int>(_2365) : as_type<int>(_1743);
    int _2417 = _2395 * _2403;
    int _2419 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2421 = _2419 != 0;
    int _2423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2425 = _2423 != 0;
    int _2427 = _1506 + (-1);
    float _2429 = trunc(_2211);
    int _2431 = int(_2429);
    bool _2433 = !_2375;
    int _2435 = _2433 ? 0 : 1;
    bool _2437 = !_2421;
    int _2439 = _2437 ? 0 : 1;
    int _2441 = _2331 * _2427;
    int _2443 = _2441 + _2417;
    int _2445 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2447 = _2445 != 0;
    int _2449 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2451 = _2449 != 0;
    int _2453 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2455 = _2453 != 0;
    float _2457 = trunc(_2267);
    int _2459 = int(_2457);
    int _2461 = ~_2285;
    int _2463 = _2461 + _2369;
    int _2465 = _2463 + 1;
    bool _2467 = !_2425;
    int _2469 = _2467 ? 0 : 1;
    bool _2471 = !_2455;
    int _2473 = _2471 ? 0 : 1;
    int _2475 = _1615 * _2465;
    int _2477 = _2475 + _1991;
    int _2479 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2481 = _2479 != 0;
    float _2483 = 1.0 / _2147;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2487 = _2485 != 0;
    int _2489 = abs(_2469);
    int _2491 = int(_2487);
    int _2493 = _2481 ? 2 : 0;
    int _2495 = _2491 | _2493;
    int _2497 = _2447 ? 4 : 0;
    int _2499 = _2495 | _2497;
    int _2501 = _2451 ? 8 : 0;
    int _2503 = _2499 | _2501;
    int _2505 = _2323 ? 16 : 0;
    int _2507 = _2503 | _2505;
    int _2509 = _1797 ? 32 : 0;
    int _2511 = _2507 | _2509;
    int _2513 = _2109 ? 64 : 0;
    int _2515 = _2511 | _2513;
    int _2517 = _2515 & 16;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2525 = _2523 != 0;
    int _2527 = _2443 * _2489;
    int _2529 = abs(_2435);
    float _2531 = trunc(_2241);
    int _2533 = int(_2531);
    bool _2535 = !_2481;
    int _2537 = _2535 ? 0 : 1;
    bool _2539 = !_2525;
    int _2541 = _2539 ? 0 : 1;
    int _2543 = _2431 * _2529;
    int _2545 = _2543 + _1905;
    bool _2547 = _1593 == 0;
    bool _2549 = !_2487;
    int _2551 = _2549 ? 0 : 1;
    float _2553 = trunc(_2277);
    int _2555 = int(_2553);
    int _2557 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2559 = _2557 != 0;
    int _2561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2563 = _2561 != 0;
    int _2565 = abs(_2439);
    bool _2567 = !_2447;
    int _2569 = _2567 ? 0 : 1;
    bool _2571 = !_2451;
    int _2573 = _2571 ? 0 : 1;
    int _2575 = _2315 * _2565;
    int _2577 = _2575 + _2527;
    bool _2579 = !_2559;
    int _2581 = _2579 ? 0 : 1;
    float _2583 = 1.0 / _2161;
    int _2585 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2587 = _2585 != 0;
    int _2589 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2591 = _2589 != 0;
    bool _2593 = _1615 == 0;
    int _2595 = abs(_2569);
    int _2597 = abs(_2573);
    int _2599 = ~_2533;
    int _2601 = _2599 + 1;
    int _2603 = _2601 + 1;
    int _2605 = _2345 * _2595;
    int _2607 = _2605 + _2577;
    bool _2609 = !_2593;
    int _2611 = _2609 ? _2477 : (-1);
    float _2613 = float(uint(_1843));
    int _2615 = ~_2459;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2603 * _2611;
    bool _2623 = !_2547;
    int _2625 = _2623 ? _2399 : (-1);
    float _2627 = as_type<float>(_1508) * _2613;
    int _2629 = _1593 + (-1);
    int _2631 = _2619 * _2625;
    bool _2633 = !_2521;
    int _2635 = _2633 ? 0 : 1;
    float _2637 = trunc(_2269);
    int _2639 = int(_2637);
    int _2641 = _2289 * _2597;
    int _2643 = _2641 + _2607;
    int _2645 = abs(_2541);
    int _2647 = _2459 * _2629;
    int _2649 = _2647 + _2631;
    float _2651 = float(uint(_2345));
    int _2653 = abs(_2635);
    int _2655 = _2649 * _2645;
    float _2657 = trunc(_2627);
    float _2659 = precise::max(_2657, 0.0);
    uint _2661 = uint(_2659);
    float _2663 = float(uint(_2643));
    float _2665 = as_type<float>(_1891) * _2651;
    int _2667 = ~_1482;
    int _2669 = _2667 + 1;
    int _2671 = abs(_2473);
    float _2673 = as_type<float>(_1891) * _2663;
    int _2675 = abs(_2551);
    int _2677 = _2639 * _2653;
    int _2679 = _2677 + _2655;
    float _2681 = trunc(_2665);
    float _2683 = precise::max(_2681, 0.0);
    uint _2685 = uint(_2683);
    int _2687 = abs(_2537);
    int _2689 = _2555 * _2675;
    int _2691 = _2689 + _1991;
    bool _2693 = !_2563;
    int _2695 = _2693 ? 0 : 1;
    int _2697 = _2545 * _2671;
    int _2699 = _2697 + _2679;
    int _2701 = ~_1506;
    int _2703 = _2701 + 1;
    int _2705 = _2669 * int(_2661);
    int _2707 = _2705 + _1843;
    int _2709 = abs(_2695);
    float _2711 = trunc(_2673);
    float _2713 = precise::max(_2711, 0.0);
    uint _2715 = uint(_2713);
    int _2717 = ~_1506;
    int _2719 = _2717 + 1;
    int _2721 = _2431 * _2687;
    int _2723 = _2721 + _2699;
    float _2725 = float(uint(_2707));
    int _2727 = _1615 + (-1);
    float _2729 = float(uint(_2723));
    float _2731 = as_type<float>(_1508) * _2725;
    int _2733 = _2703 * int(_2685);
    int _2735 = _2733 + _2345;
    int _2737 = abs(_2581);
    float _2739 = as_type<float>(_1997) * _2729;
    int _2741 = _2533 * _2727;
    int _2743 = _2741 + _2621;
    bool _2745 = !_2587;
    int _2747 = _2745 ? 0 : 1;
    float _2749 = trunc(_2731);
    float _2751 = precise::max(_2749, 0.0);
    uint _2753 = uint(_2751);
    int _2755 = _2719 * int(_2715);
    int _2757 = _2755 + _2643;
    float _2759 = float(uint(_2735));
    float _2761 = float(uint(_2757));
    float _2763 = as_type<float>(_1891) * _2759;
    float _2765 = trunc(_2739);
    float _2767 = precise::max(_2765, 0.0);
    uint _2769 = uint(_2767);
    int _2771 = abs(_2747);
    int _2773 = _2743 * _2709;
    float _2775 = as_type<float>(_1891) * _2761;
    float _2777 = float(uint(_2545));
    float _2779 = trunc(_2775);
    float _2781 = precise::max(_2779, 0.0);
    uint _2783 = uint(_2781);
    int _2785 = _2353 * _2737;
    int _2787 = _2785 + _2773;
    float _2789 = as_type<float>(_1997) * _2777;
    int _2791 = ~_1593;
    int _2793 = _2791 + 1;
    bool _2795 = !_2591;
    int _2797 = _2795 ? 0 : 1;
    int _2799 = _2691 * _2771;
    int _2801 = _2799 + _2787;
    bool _2803 = uint(_2321) >= 2u;
    float _2805 = trunc(_2789);
    float _2807 = precise::max(_2805, 0.0);
    uint _2809 = uint(_2807);
    int _2811 = abs(_2797);
    int _2813 = _2793 * int(_2769);
    int _2815 = _2813 + _2723;
    int _2817 = _2803 ? 0 : 1;
    int _2819 = ~_1506;
    int _2821 = _2819 + 1;
    float _2823 = float(uint(_2815));
    int _2825 = _2555 * _2811;
    int _2827 = _2825 + _2801;
    bool _2829 = _2321 != 3;
    float _2831 = trunc(_2763);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = int(_2715) + int(_2783);
    float _2839 = as_type<float>(_1997) * _2823;
    int _2841 = ~_1593;
    int _2843 = _2841 + 1;
    float _2845 = float(uint(_2827));
    int _2847 = _2821 * _2837;
    int _2849 = _2847 + _2643;
    int _2851 = ~_2817;
    int _2853 = _2851 + 1;
    int _2855 = _2853 + 1;
    int _2857 = _2843 * int(_2809);
    int _2859 = _2857 + _2545;
    float _2861 = trunc(_2839);
    float _2863 = precise::max(_2861, 0.0);
    uint _2865 = uint(_2863);
    float _2867 = as_type<float>(_2045) * _2845;
    int _2869 = _2855;
    if (_2829)
    {
        int _2871 = ~_2817;
        int _2873 = _2871 + 1;
        _2869 = _2873;
    }
    int _2875 = _2869;
    bool _2877 = uint(_2849) >= uint(_1506);
    float _2879 = float(uint(_2859));
    int _2881 = int(_2661) + int(_2753);
    float _2883 = trunc(_2867);
    float _2885 = precise::max(_2883, 0.0);
    uint _2887 = uint(_2885);
    int _2889 = ~_1482;
    int _2891 = _2889 + 1;
    float _2893 = as_type<float>(_1997) * _2879;
    bool _2895 = !_2877;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2901 = _2899 != 0;
    int _2903 = _2891 * _2881;
    int _2905 = _2903 + _1843;
    int _2907 = ~_2837;
    int _2909 = _2907 + _2897;
    int _2911 = _2909 + 1;
    int _2913 = int(_2685) + int(_2835);
    bool _2915 = !_2901;
    int _2917 = _2915 ? 0 : 1;
    float _2919 = trunc(_2893);
    float _2921 = precise::max(_2919, 0.0);
    uint _2923 = uint(_2921);
    bool _2925 = uint(_2905) >= uint(_1482);
    int _2927 = _1506 * _2911;
    int _2929 = _2927 + _2643;
    int _2931 = ~_1615;
    int _2933 = _2931 + 1;
    bool _2935 = _1478 > 0.5;
    int _2937 = int(_2769) + int(_2865);
    int _2939 = _2933 * int(_2887);
    int _2941 = _2939 + _2827;
    int _2943 = _2935 ? as_type<int>(_2365) : as_type<int>(_1743);
    int _2945 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2947 = _2945 != 0;
    bool _2949 = !_2109;
    int _2951 = _2949 ? _2929 : (-1);
    int _2953 = ~_1593;
    int _2955 = _2953 + 1;
    float _2957 = _2947 ? as_type<float>(_2943) : _1743;
    int _2959 = _2951 & 3;
    bool _2961 = _2959 != 0;
    int _2963 = _2955 * _2937;
    int _2965 = _2963 + _2723;
    float _2967 = float(uint(_2941));
    int _2969 = ~_1506;
    int _2971 = _2969 + 1;
    bool _2973 = !_2925;
    int _2975 = _2973 ? 0 : (-1);
    float _2977 = as_type<float>(_2045) * _2967;
    bool _2979 = uint(_2959) >= 2u;
    int _2981 = _2961 ? 0 : 1;
    float _2983 = trunc(_2977);
    float _2985 = precise::max(_2983, 0.0);
    uint _2987 = uint(_2985);
    int _2989 = _2979 ? 0 : 1;
    bool _2991 = _2959 != 3;
    bool _2993 = uint(_2965) >= uint(_1593);
    int _2995 = _2971 * _2913;
    int _2997 = _2995 + _2345;
    float _2999 = float(uint(_2691));
    bool _3001 = !_2993;
    int _3003 = _3001 ? 0 : (-1);
    bool _3005 = uint(_2959) > 1u;
    float _3007 = as_type<float>(_2045) * _2999;
    int _3009 = ~_2937;
    int _3011 = _3009 + _3003;
    int _3013 = _3011 + 1;
    int _3015 = ~_2989;
    int _3017 = _3015 + 1;
    int _3019 = _3017 + 1;
    int _3021 = _3019;
    if (_2991)
    {
        int _3023 = ~_2989;
        int _3025 = _3023 + 1;
        _3021 = _3025;
    }
    int _3027 = _3021;
    int _3029 = _1593 * _3013;
    int _3031 = _3029 + _2723;
    int _3033 = ~_1615;
    int _3035 = _3033 + 1;
    float _3037 = trunc(_3007);
    float _3039 = precise::max(_3037, 0.0);
    uint _3041 = uint(_3039);
    bool _3043 = uint(_2997) >= uint(_1506);
    int _3045 = ~_2981;
    int _3047 = _3045 + 1;
    int _3049 = _3047 + 1;
    int _3051 = _3049;
    if (!_3005)
    {
        int _3053 = ~_2981;
        int _3055 = _3053 + 1;
        _3051 = _3055;
    }
    int _3057 = _3051;
    int _3059 = int(_2887) + int(_2987);
    bool _3061 = !_2547;
    int _3063 = _3061 ? _3031 : (-1);
    int _3065 = int(_2809) + int(_2923);
    int _3067 = _3035 * _3059;
    int _3069 = _3067 + _2827;
    int _3071 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _3073 = _3071 != 0;
    bool _3075 = !_3043;
    int _3077 = _3075 ? 0 : (-1);
    int _3079 = _3063 & 3;
    bool _3081 = _3079 != 0;
    bool _3083 = !_3073;
    int _3085 = _3083 ? 0 : 1;
    bool _3087 = uint(_3079) >= 2u;
    int _3089 = _3081 ? 0 : 1;
    int _3091 = ~_1615;
    int _3093 = _3091 + 1;
    bool _3095 = uint(_3069) >= uint(_1615);
    int _3097 = _3087 ? 0 : 1;
    int _3099 = _3093 * int(_3041);
    int _3101 = _3099 + _2691;
    bool _3103 = _3079 != 3;
    bool _3105 = !_3095;
    int _3107 = _3105 ? 0 : (-1);
    int _3109 = ~_1593;
    int _3111 = _3109 + 1;
    bool _3113 = uint(_3079) > 1u;
    int _3115 = ~_3059;
    int _3117 = _3115 + _3107;
    int _3119 = _3117 + 1;
    int _3121 = _3111 * _3065;
    int _3123 = _3121 + _2545;
    float _3125 = float(uint(_3101));
    int _3127 = ~_3097;
    int _3129 = _3127 + 1;
    int _3131 = _3129 + 1;
    int _3133 = _1615 * _3119;
    int _3135 = _3133 + _2827;
    int _3137 = _3131;
    if (_3103)
    {
        int _3139 = ~_3097;
        int _3141 = _3139 + 1;
        _3137 = _3141;
    }
    int _3143 = _3137;
    float _3145 = as_type<float>(_2045) * _3125;
    bool _3147 = uint(_3123) >= uint(_1593);
    bool _3149 = !_2593;
    int _3151 = _3149 ? _3135 : (-1);
    float _3153 = trunc(_3145);
    float _3155 = precise::max(_3153, 0.0);
    uint _3157 = uint(_3155);
    int _3159 = ~_3089;
    int _3161 = _3159 + 1;
    int _3163 = _3161 + 1;
    int _3165 = _3163;
    if (!_3113)
    {
        int _3167 = ~_3089;
        int _3169 = _3167 + 1;
        _3165 = _3169;
    }
    int _3171 = _3165;
    int _3173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _3175 = _3173 != 0;
    bool _3177 = !_3147;
    int _3179 = _3177 ? 0 : (-1);
    int _3181 = _3151 & 3;
    bool _3183 = _3181 != 0;
    bool _3185 = !_3175;
    int _3187 = _3185 ? 0 : 1;
    bool _3189 = uint(_3181) >= 2u;
    int _3191 = ~_1615;
    int _3193 = _3191 + 1;
    int _3195 = _3189 ? 0 : 1;
    bool _3197 = _3181 != 3;
    int _3199 = int(_3041) + int(_3157);
    int _3201 = _3183 ? 0 : 1;
    bool _3203 = uint(_3181) > 1u;
    int _3205 = ~_2881;
    int _3207 = _3205 + _2975;
    int _3209 = _3207 + 1;
    int _3211 = _3193 * _3199;
    int _3213 = _3211 + _2691;
    int _3215 = ~_2913;
    int _3217 = _3215 + _3077;
    int _3219 = _3217 + 1;
    int _3221 = ~_3195;
    int _3223 = _3221 + 1;
    int _3225 = _3223 + 1;
    int _3227 = _1482 * _3209;
    int _3229 = _3227 + _1843;
    int _3231 = _3225;
    if (_3197)
    {
        int _3233 = ~_3195;
        int _3235 = _3233 + 1;
        _3231 = _3235;
    }
    int _3237 = _3231;
    int _3239 = _1506 * _3219;
    int _3241 = _3239 + _2345;
    bool _3243 = _1482 == 0;
    float _3245 = in.m_46.x;
    float _3247 = in.m_46.y;
    float _3249 = in.m_46.z;
    int _3251 = ~_3201;
    int _3253 = _3251 + 1;
    int _3255 = _3253 + 1;
    float _3257 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _3259 = _3255;
    if (!_3203)
    {
        int _3261 = ~_3201;
        int _3263 = _3261 + 1;
        _3259 = _3263;
    }
    int _3265 = _3259;
    bool _3267 = !_3243;
    int _3269 = _3267 ? _3229 : (-1);
    int _3271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3273 = _3271 != 0;
    bool _3275 = uint(_3213) >= uint(_1615);
    float _3277 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _3279 = !_2109;
    int _3281 = _3279 ? _3241 : (-1);
    bool _3283 = !_3273;
    int _3285 = _3283 ? 0 : 1;
    float _3287 = fma(_3257, -2.0, _3277);
    int _3289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _3291 = _3289 != 0;
    int _3293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _3295 = _3293 != 0;
    float _3297 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[76].y, _3287);
    int _3299 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _3301 = _3299 != 0;
    int _3303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _3305 = _3303 != 0;
    float _3307 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _3309 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _3311 = _3247 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _3313 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3315 = _3313 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3317 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[4].x, _3307);
    float _3319 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3321 = _3319 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3323 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[5].x, _3309);
    float _3325 = 1.0 / _3315;
    float _3327 = fma(_3245, (*spvDescriptorSet0.vp_c10)._m0[6].x, _3311);
    float _3329 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _3331 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _3329;
    float _3333 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _3335 = _3333 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    bool _3337 = !_3275;
    int _3339 = _3337 ? 0 : (-1);
    float _3341 = _3331 * _2377;
    float _3343 = 1.0 / _3321;
    float _3345 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3347 = _3345 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3349 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _3351 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _3349;
    float _3353 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _3355 = _3353 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3357 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _3359 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _3357;
    float _3361 = _1478 * 2.0;
    float _3363 = _3351 * _2405;
    float _3365 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _3367 = _3365 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3369 = _3359 * _3325;
    float _3371 = floor(_3361);
    bool _3373 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3375 = isnan(_1472);
    bool _3377 = _3373 || _3375;
    bool _3379 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3381 = _3377 || _3379;
    float _3383 = float(_3381);
    float _3385 = _3335 * _2483;
    bool _3387 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3389 = isnan(_1472);
    bool _3391 = _3387 || _3389;
    bool _3393 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3395 = _3391 || _3393;
    float _3397 = float(_3395);
    float _3399 = _3355 * _2583;
    bool _3401 = _1679 > 0.5;
    float _3403 = -_3383;
    float _3405 = _3403 + 1.0;
    float _3407 = _3367 * _3343;
    float _3409 = 1.0 / _3347;
    float _3411 = _3291 ? as_type<float>(_2415) : _1743;
    float _3413 = -_3397;
    float _3415 = _3413 + 1.0;
    float _3417 = _3397 * _3405;
    int _3419 = _3401 ? as_type<int>(_2365) : as_type<int>(_1743);
    float _3421 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[5].z, _3323);
    bool _3423 = _2517 != 0;
    float _3425 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _3427 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _3425;
    bool _3429 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3431 = isnan(_1472);
    bool _3433 = _3429 || _3431;
    bool _3435 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3437 = _3433 || _3435;
    float _3439 = float(_3437);
    float _3441 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[6].z, _3327);
    float _3443 = _3295 ? as_type<float>(_3419) : _1743;
    float _3445 = _3421 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _3447 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3449 = isnan(_1472);
    bool _3451 = _3447 || _3449;
    bool _3453 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3455 = _3451 || _3453;
    float _3457 = float(_3455);
    float _3459 = _3439 * _3415;
    bool _3461 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3463 = isnan(_1472);
    bool _3465 = _3461 || _3463;
    bool _3467 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3469 = _3465 || _3467;
    float _3471 = float(_3469);
    float _3473 = -_3439;
    float _3475 = _3473 + 1.0;
    bool _3477 = _3371 > 0.0;
    float _3479 = fma(_3249, (*spvDescriptorSet0.vp_c10)._m0[4].z, _3317);
    bool _3481 = _3371 >= 0.0;
    bool _3483 = isnan(_3371);
    bool _3485 = _3481 || _3483;
    bool _3487 = isnan(0.0);
    bool _3489 = _3485 || _3487;
    float _3491 = _3427 * _3409;
    float _3493 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3495 = _1472 + _3493;
    bool _3497 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3499 = isnan(_1472);
    bool _3501 = _3497 || _3499;
    bool _3503 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3505 = _3501 || _3503;
    float _3507 = float(_3505);
    float _3509 = -_3471;
    float _3511 = _3509 + 1.0;
    float _3513 = _3457 * _3475;
    float _3515 = fma(_3341, _3495, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _3517 = -_3457;
    float _3519 = _3517 + 1.0;
    float _3521 = _3507 * _3511;
    float _3523 = -_3507;
    float _3525 = _3523 + 1.0;
    bool _3527 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3529 = isnan(_1472);
    bool _3531 = _3527 || _3529;
    bool _3533 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3535 = _3531 || _3533;
    float _3537 = float(_3535);
    float _3539 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3541 = _1472 + _3539;
    float _3543 = _3471 * _3519;
    float _3545 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3547 = _1472 + _3545;
    bool _3549 = _1472 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3551 = isnan(_1472);
    bool _3553 = _3549 || _3551;
    bool _3555 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3557 = _3553 || _3555;
    float _3559 = float(_3557);
    float _3561 = -_3537;
    float _3563 = _3561 + 1.0;
    float _3565 = fma(_3363, _3541, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _3567 = fma(_3385, _3547, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _3569 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    float _3571 = _3559 * _3563;
    float _3573 = _3301 ? as_type<float>(_3419) : _1743;
    float _3575 = _3537 * _3525;
    bool _3577 = _1681 != 1;
    float _3579 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3581 = _1472 + _3579;
    float _3583 = _3515 * _3571;
    float _3585 = -_3559;
    float _3587 = _3585 + 1.0;
    float _3589 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3591 = _1472 + _3589;
    float _3593 = fma(_3399, _3581, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _3595 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3597 = _1472 + _3595;
    float _3599 = fma(_3587, (*spvDescriptorSet0.vp_c9)._m0[175].x, _3583);
    float _3601 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3603 = _1472 + _3601;
    float _3605 = fma(_3369, _3591, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _3607 = fma(_3567, _3575, _3599);
    float _3609 = fma(_3491, _3603, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    float _3611 = _3569 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3613 = _3491;
    float _3615 = _3603;
    if (!_3577)
    {
        _3613 = _1478;
    }
    float _3617 = _3613;
    float _3619 = fma(_3565, _3521, _3607);
    float _3621 = _3617;
    if (!_3577)
    {
        _3615 = _1478;
    }
    float _3623 = _3615;
    float _3625 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3627 = 0.0;
    float _3629 = _3623;
    if (!_3577)
    {
        _3627 = _1679;
    }
    float _3631 = _3627;
    float _3633 = fma(_3407, _3597, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _3635 = 0.0;
    float _3637 = _3631;
    if (!_3577)
    {
        _3635 = _1679;
    }
    float _3639 = _3635;
    float _3641 = _3479 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _3643 = !_3577;
    float _3645 = _3643 ? as_type<float>(_1683) : as_type<float>(_1685);
    float _3647 = _3441 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _3649 = _3639;
    float _3651 = _3647;
    if (_3577)
    {
        _3621 = _1669;
    }
    float _3653 = _3621;
    if (_3577)
    {
        _3629 = _1669;
    }
    float _3655 = _3629;
    if (_3577)
    {
        _3637 = _1478;
    }
    float _3657 = _3637;
    float _3659 = _3653 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_3577)
    {
        _3649 = _1478;
    }
    float _3661 = _3649;
    bool _3663 = !_3577;
    float _3665 = _3663 ? as_type<float>(_1687) : as_type<float>(_1683);
    float _3667 = _3657 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _3669 = _1689 != 2;
    float _3671 = fma(_3611, _2099, -0.5);
    float _3673 = _1669 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _3675 = _3305 ? as_type<float>(_3419) : _1743;
    int _3677 = _2951 & 3;
    bool _3679 = _3677 != 0;
    float _3681 = -_3625;
    float _3683 = fma(_3673, 2.0, _3681);
    float _3685 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3687 = fma(_3593, _3543, _3619);
    float _3689 = _1478 + _1669;
    int _3691 = ~_3065;
    int _3693 = _3691 + _3179;
    int _3695 = _3693 + 1;
    float _3697 = fma(as_type<float>(_1685), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3685);
    float _3699 = _3689 + (-1.0);
    bool _3701 = !_3679;
    int _3703 = _3701 ? 0 : 1;
    int _3705 = _1593 * _3695;
    int _3707 = _3705 + _2545;
    bool _3709 = _2321 != 3;
    float _3711 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _3713 = _2951 >> 31;
    float _3715 = as_type<float>(_1685) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    bool _3717 = !_3709;
    int _3719 = _3717 ? 0 : (-1);
    float _3721 = _1669 * 2.0;
    bool _3723 = _3079 != 3;
    float _3725 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3697);
    int _3727 = _3063 >> 31;
    float _3729 = -_156;
    float _3731 = fma(_3729, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3683);
    bool _3733 = !_2547;
    int _3735 = _3733 ? _3707 : (-1);
    float _3737 = floor(_3721);
    int _3739 = _2305 >> 31;
    float _3741 = fma(_3605, _3513, _3687);
    int _3743 = _3063 & 3;
    bool _3745 = _3743 != 0;
    int _3747 = _3713 & 3;
    float _3749 = fma(_3633, _3459, _3741);
    int _3751 = _3727 & 3;
    float _3753 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3755 = _3739 & 3;
    float _3757 = fma(_3609, _3417, _3749);
    bool _3759 = !_3745;
    int _3761 = _3759 ? 0 : 1;
    bool _3763 = _2959 != 3;
    float _3765 = fma(_3383, (*spvDescriptorSet0.vp_c9)._m0[182].x, _3757);
    int _3767 = _3063 + _3751;
    float _3769 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3771 = int(_3769);
    int _3773 = _2305 + _3755;
    bool _3775 = !_3763;
    int _3777 = _3775 ? 0 : (-1);
    out.m_69.x = _3765;
    bool _3779 = _3181 != 3;
    int _3781 = _3767 >> 2;
    int _3783 = _3773 >> 2;
    int _3785 = _3781 << 4;
    int _3787 = _3785 + 656;
    int _3789 = _3783 << 4;
    int _3791 = _3789 + 368;
    int _3793 = _2951 + _3747;
    uint _3795 = uint(int(uint(_3791) >> uint(2)));
    uint _3797 = uint(int(uint(int(_3795)) >> uint(2)));
    int _3799 = int(_3795) & 3;
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[int(_3797)][_3799];
    int _3803 = int(_3795) + 1;
    uint _3805 = uint(int(uint(_3803) >> uint(2)));
    int _3807 = _3803 & 3;
    float _3809 = (*spvDescriptorSet0.vp_c9)._m0[int(_3805)][_3807];
    int _3811 = _3151 >> 31;
    float _3813 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3815 = _3793 >> 2;
    int _3817 = _3811 & 3;
    float _3819 = fma(_3655, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3813);
    int _3821 = _3815 << 4;
    int _3823 = _3821 + 512;
    uint _3825 = uint(int(uint(_3787) >> uint(2)));
    uint _3827 = uint(int(uint(int(_3825)) >> uint(2)));
    int _3829 = int(_3825) & 3;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[int(_3827)][_3829];
    int _3833 = int(_3825) + 1;
    uint _3835 = uint(int(uint(_3833) >> uint(2)));
    int _3837 = _3833 & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    int _3841 = _3151 + _3817;
    float _3843 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3819);
    int _3845 = _3841 >> 2;
    bool _3847 = !_3423;
    int _3849 = _3847 ? 0 : 1;
    uint _3851 = uint(int(uint(_3823) >> uint(2)));
    uint _3853 = uint(int(uint(int(_3851)) >> uint(2)));
    int _3855 = int(_3851) & 3;
    float _3857 = (*spvDescriptorSet0.vp_c9)._m0[int(_3853)][_3855];
    int _3859 = int(_3851) + 1;
    uint _3861 = uint(int(uint(_3859) >> uint(2)));
    int _3863 = _3859 & 3;
    float _3865 = (*spvDescriptorSet0.vp_c9)._m0[int(_3861)][_3863];
    int _3867 = _3845 << 4;
    int _3869 = _3867 + 800;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3873 = _3151 & 3;
    bool _3875 = _3873 != 0;
    float _3877 = fma(_3665, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3871);
    uint _3879 = uint(int(uint(_3869) >> uint(2)));
    uint _3881 = uint(int(uint(int(_3879)) >> uint(2)));
    int _3883 = int(_3879) & 3;
    float _3885 = (*spvDescriptorSet0.vp_c9)._m0[int(_3881)][_3883];
    int _3887 = int(_3879) + 1;
    uint _3889 = uint(int(uint(_3887) >> uint(2)));
    int _3891 = _3887 & 3;
    float _3893 = (*spvDescriptorSet0.vp_c9)._m0[int(_3889)][_3891];
    float _3895 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3897 = _3665 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3899 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3901 = ~_3199;
    int _3903 = _3901 + _3339;
    int _3905 = _3903 + 1;
    float _3907 = fma(_3645, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3895);
    float _3909 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3911 = _3645 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3913 = fma(_3897, -2.0, _3899);
    int _3915 = abs(_2413);
    int _3917 = _1615 * _3905;
    int _3919 = _3917 + _2691;
    float _3921 = -_3909;
    float _3923 = fma(_3911, 2.0, _3921);
    int _3925 = abs(_3057);
    int _3927 = _3791 + 8;
    uint _3929 = uint(int(uint(_3927) >> uint(2)));
    uint _3931 = uint(int(uint(int(_3929)) >> uint(2)));
    int _3933 = int(_3929) & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = int(_3929) + 1;
    uint _3939 = uint(int(uint(_3937) >> uint(2)));
    int _3941 = _3937 & 3;
    float _3943 = (*spvDescriptorSet0.vp_c9)._m0[int(_3939)][_3941];
    int _3945 = abs(_3171);
    float _3947 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3907);
    int _3949 = ~_3915;
    int _3951 = _3949 + 1;
    int _3953 = _3951 + 1;
    float _3955 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3877);
    int _3957 = ~_3945;
    int _3959 = _3957 + 1;
    int _3961 = _3959 + 1;
    int _3963 = abs(_3849);
    int _3965 = _3823 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    int _3983 = _3953 * as_type<int>(_3809);
    int _3985 = abs(_3265);
    float _3987 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3989 = int(_3987);
    float _3991 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    int _3993 = _3787 + 8;
    uint _3995 = uint(int(uint(_3993) >> uint(2)));
    uint _3997 = uint(int(uint(int(_3995)) >> uint(2)));
    int _3999 = int(_3995) & 3;
    float _4001 = (*spvDescriptorSet0.vp_c9)._m0[int(_3997)][_3999];
    int _4003 = int(_3995) + 1;
    uint _4005 = uint(int(uint(_4003) >> uint(2)));
    int _4007 = _4003 & 3;
    float _4009 = (*spvDescriptorSet0.vp_c9)._m0[int(_4005)][_4007];
    int _4011 = _3961 * as_type<int>(_3839);
    int _4013 = abs(_3703);
    float _4015 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _4017 = fma(as_type<float>(_1683), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3991);
    int _4019 = abs(_3761);
    int _4021 = _3869 + 8;
    uint _4023 = uint(int(uint(_4021) >> uint(2)));
    uint _4025 = uint(int(uint(int(_4023)) >> uint(2)));
    int _4027 = int(_4023) & 3;
    float _4029 = (*spvDescriptorSet0.vp_c9)._m0[int(_4025)][_4027];
    int _4031 = int(_4023) + 1;
    uint _4033 = uint(int(uint(_4031) >> uint(2)));
    int _4035 = _4031 & 3;
    float _4037 = (*spvDescriptorSet0.vp_c9)._m0[int(_4033)][_4035];
    bool _4039 = !_3875;
    int _4041 = _4039 ? 0 : 1;
    float _4043 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _4045 = as_type<float>(_1683) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _4047 = ~_3925;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    float _4053 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _4055 = fma(_3661, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4015);
    int _4057 = abs(_4041);
    float _4059 = fma(_4045, -2.0, _4043);
    int _4061 = ~_3985;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    float _4067 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4069 = int(_4067);
    int _4071 = ~_4013;
    int _4073 = _4071 + 1;
    int _4075 = _4073 + 1;
    float _4077 = fma(_3667, -2.0, _4053);
    int _4079 = _4051 * as_type<int>(_3865);
    int _4081 = ~_4057;
    int _4083 = _4081 + 1;
    int _4085 = _4083 + 1;
    int _4087 = _4065 * as_type<int>(_3893);
    bool _4089 = !_3723;
    int _4091 = _4089 ? 0 : (-1);
    int _4093 = _4075 * as_type<int>(_3857);
    int _4095 = _4093 + _4079;
    bool _4097 = !_3779;
    int _4099 = _4097 ? 0 : (-1);
    int _4101 = _4085 * as_type<int>(_3885);
    int _4103 = _4101 + _4087;
    bool _4105 = _3737 > 0.0;
    float _4107 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[92].w, _4017);
    bool _4109 = _3737 >= 0.0;
    bool _4111 = isnan(_3737);
    bool _4113 = _4109 || _4111;
    bool _4115 = isnan(0.0);
    bool _4117 = _4113 || _4115;
    float _4119 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[91].y, _4059);
    int _4121 = ~_3963;
    int _4123 = _4121 + 1;
    int _4125 = _4123 + 1;
    float _4127 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4055);
    float _4129 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[81].y, _4077);
    int _4131 = ~_4019;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    int _4137 = _4125 * as_type<int>(_3801);
    int _4139 = _4137 + _3983;
    int _4141 = abs(_2875);
    float _4143 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _4145 = abs(_3027);
    int _4147 = _4135 * as_type<int>(_3831);
    int _4149 = _4147 + _4011;
    float _4151 = float(uint(_3771));
    float _4153 = -_4143;
    float _4155 = fma(_3659, 2.0, _4153);
    int _4157 = ~_4141;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    float _4163 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _4165 = int(_4163);
    int _4167 = abs(_3719);
    float _4169 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3913);
    int _4171 = ~_4145;
    int _4173 = _4171 + 1;
    int _4175 = _4173 + 1;
    int _4177 = _4161 * as_type<int>(_3935);
    int _4179 = _4177 + _4139;
    int _4181 = abs(_3143);
    float _4183 = -_156;
    float _4185 = fma(_4183, (*spvDescriptorSet0.vp_c9)._m0[81].x, _4155);
    int _4187 = ~_4167;
    int _4189 = _4187 + 1;
    int _4191 = _4189 + 1;
    float _4193 = 1.0 / _4151;
    int _4195 = _4175 * as_type<int>(_3973);
    int _4197 = _4195 + _4095;
    int _4199 = ~_4181;
    int _4201 = _4199 + 1;
    int _4203 = _4201 + 1;
    float _4205 = float(uint(_4069));
    int _4207 = _4191 * as_type<int>(_3943);
    int _4209 = _4207 + _4179;
    int _4211 = abs(_3777);
    int _4213 = _4203 * as_type<int>(_4001);
    int _4215 = _4213 + _4149;
    float _4217 = 1.0 / _4205;
    int _4219 = abs(_2917);
    int _4221 = abs(_3237);
    int _4223 = abs(_4091);
    int _4225 = ~_4219;
    int _4227 = _4225 + 1;
    int _4229 = _4227 + 1;
    float _4231 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4233 = log2(_4231);
    int _4235 = ~_4211;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    int _4241 = ~_4221;
    int _4243 = _4241 + 1;
    int _4245 = _4243 + 1;
    int _4247 = _4209 * _4229;
    int _4249 = ~_4223;
    int _4251 = _4249 + 1;
    int _4253 = _4251 + 1;
    int _4255 = _4239 * as_type<int>(_3981);
    int _4257 = _4255 + _4197;
    int _4259 = abs(_3085);
    int _4261 = _4245 * as_type<int>(_4029);
    int _4263 = _4261 + _4103;
    float _4265 = float(uint(_4165));
    int _4267 = _4253 * as_type<int>(_4009);
    int _4269 = _4267 + _4215;
    int _4271 = as_type<int>(_4193) + (-2);
    int _4273 = _3269 * _4219;
    int _4275 = _4273 + _4247;
    int _4277 = abs(_4099);
    int _4279 = ~_4259;
    int _4281 = _4279 + 1;
    int _4283 = _4281 + 1;
    float _4285 = 1.0 / _4265;
    float _4287 = float(uint(_3989));
    int _4289 = abs(_3187);
    int _4291 = _4283 * _4257;
    int _4293 = abs(_3285);
    float _4295 = _4233 * _156;
    int _4297 = ~_4277;
    int _4299 = _4297 + 1;
    int _4301 = _4299 + 1;
    float _4303 = 1.0 / _4287;
    int _4305 = ~_4293;
    int _4307 = _4305 + 1;
    int _4309 = _4307 + 1;
    int _4311 = _3281 * _4259;
    int _4313 = _4311 + _4291;
    bool _4315 = !_2593;
    float _4317 = _4315 ? as_type<float>(_3919) : as_type<float>(0xffffffffu /* nan */);
    int _4319 = _4301 * as_type<int>(_4037);
    int _4321 = _4319 + _4263;
    float _4323 = float(uint(_4275));
    int _4325 = as_type<int>(_4217) + (-2);
    int _4327 = _4309 * _4321;
    int _4329 = ~_4289;
    int _4331 = _4329 + 1;
    int _4333 = _4331 + 1;
    float _4335 = as_type<float>(_4271) * _4323;
    float _4337 = float(uint(_4313));
    int _4339 = as_type<int>(_4317) * _4293;
    int _4341 = _4339 + _4327;
    int _4343 = as_type<int>(_4285) + (-2);
    int _4345 = _4333 * _4269;
    float _4347 = trunc(_4335);
    float _4349 = precise::max(_4347, 0.0);
    uint _4351 = uint(_4349);
    float _4353 = as_type<float>(_4325) * _4337;
    int _4355 = as_type<int>(_4303) + (-2);
    int _4357 = _3735 * _4289;
    int _4359 = _4357 + _4345;
    float _4361 = float(uint(_4341));
    float _4363 = _4317;
    float _4365 = _3715;
    float _4367 = _3741;
    float _4369 = _3749;
    if (_3669)
    {
        _4363 = _1478;
    }
    float _4371 = _4363;
    float _4373 = float(uint(_4359));
    float _4375 = as_type<float>(_4355) * _4361;
    float _4377 = trunc(_4353);
    float _4379 = precise::max(_4377, 0.0);
    uint _4381 = uint(_4379);
    float _4383 = _4371;
    if (!_3669)
    {
        _4383 = _1669;
    }
    float _4385 = _4383;
    float _4387 = as_type<float>(_4343) * _4373;
    float _4389 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _4391 = ~_3771;
    int _4393 = _4391 + 1;
    float _4395 = _4385 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _4397 = abs(_3771);
    float _4399 = trunc(_4387);
    float _4401 = precise::max(_4399, 0.0);
    uint _4403 = uint(_4401);
    float _4405 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _4407 = _4393 * int(_4351);
    int _4409 = _4407 + _4275;
    float _4411 = fma(_4395, -2.0, _4389);
    int _4413 = ~_4165;
    int _4415 = _4413 + 1;
    float _4417 = -_4405;
    float _4419 = fma(_3715, 2.0, _4417);
    if (_3669)
    {
        _4365 = _1669;
    }
    float _4421 = _4365;
    float _4423 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[86].y, _4411);
    float _4425 = trunc(_4375);
    float _4427 = precise::max(_4425, 0.0);
    uint _4429 = uint(_4427);
    float _4431 = _4421;
    if (!_3669)
    {
        _4431 = _1679;
    }
    float _4433 = _4431;
    float _4435 = -_156;
    float _4437 = fma(_4435, (*spvDescriptorSet0.vp_c9)._m0[91].x, _4419);
    float _4439 = float(uint(_4409));
    float _4441 = float(uint(_4397));
    float _4443 = _4433 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _4445 = abs(_4069);
    int _4447 = _4415 * int(_4403);
    int _4449 = _4447 + _4359;
    float _4451 = as_type<float>(_4271) * _4439;
    int _4453 = ~_4069;
    int _4455 = _4453 + 1;
    float _4457 = 1.0 / _4441;
    int _4459 = ~_3989;
    int _4461 = _4459 + 1;
    float _4463 = float(uint(_4445));
    int _4465 = _4455 * int(_4381);
    int _4467 = _4465 + _4313;
    float _4469 = float(uint(_4449));
    int _4471 = _4461 * int(_4429);
    int _4473 = _4471 + _4341;
    int _4475 = abs(_4165);
    float _4477 = exp2(_4295);
    float _4479 = as_type<float>(_4343) * _4469;
    float _4481 = float(uint(_4475));
    float _4483 = float(uint(_4467));
    float _4485 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _4487 = float(uint(_4473));
    float _4489 = 1.0 / _4463;
    int _4491 = abs(_3989);
    float _4493 = as_type<float>(_4325) * _4483;
    int _4495 = abs(_4275);
    float _4497 = -_4485;
    float _4499 = fma(_4443, 2.0, _4497);
    float _4501 = float(uint(_4491));
    float _4503 = as_type<float>(_4355) * _4487;
    int _4505 = as_type<int>(_4457) + (-2);
    float _4507 = 1.0 / _4481;
    float _4509 = float(uint(_4495));
    float _4511 = -_4477;
    float _4513 = _4511 + 1.0;
    float _4515 = -_156;
    float _4517 = fma(_4515, (*spvDescriptorSet0.vp_c9)._m0[86].x, _4499);
    int _4519 = abs(_4313);
    float _4521 = as_type<float>(_4505) * _4509;
    bool _4523 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4525 = isnan(1.0);
    bool _4527 = _4523 || _4525;
    bool _4529 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4531 = _4527 || _4529;
    float _4533 = 1.0 / _4501;
    int _4535 = as_type<int>(_4489) + (-2);
    float _4537 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4539 = 1.0 + _4537;
    float _4541 = float(uint(_4519));
    int _4543 = abs(_4359);
    float _4545 = trunc(_4521);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    float _4551 = as_type<float>(_4535) * _4541;
    int _4553 = as_type<int>(_4507) + (-2);
    float _4555 = float(uint(_4543));
    float _4557 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4559 = 1.0 / _4539;
    float _4561 = as_type<float>(_4553) * _4555;
    float _4563 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4565 = abs(_4341);
    float _4567 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _4569 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4571 = isnan(0.0);
    bool _4573 = _4569 || _4571;
    bool _4575 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4577 = _4573 || _4575;
    float _4579 = trunc(_4551);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    float _4585 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    int _4587 = as_type<int>(_4533) + (-2);
    float _4589 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4557);
    float _4591 = float(uint(_4565));
    float _4593 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4563);
    int _4595 = ~_4397;
    int _4597 = _4595 + 1;
    float _4599 = fma(_1669, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4567);
    float _4601 = trunc(_4561);
    float _4603 = precise::max(_4601, 0.0);
    uint _4605 = uint(_4603);
    float _4607 = fma(_1478, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4585);
    float _4609 = _4577 ? _4513 : 0.0;
    float _4611 = as_type<float>(_4587) * _4591;
    int _4613 = _4597 * int(_4549);
    int _4615 = _4613 + _4495;
    float _4617 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4589);
    int _4619 = ~_4445;
    int _4621 = _4619 + 1;
    float _4623 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4607);
    float _4625 = trunc(_4451);
    float _4627 = precise::max(_4625, 0.0);
    uint _4629 = uint(_4627);
    float _4631 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4593);
    float _4633 = fma(_156, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4599);
    float _4635 = -_156;
    float _4637 = fma(_4635, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3923);
    if (_4531)
    {
        float _4639 = _4609 * _4559;
        _160 = _4639;
    }
    float _4641 = _160;
    int _4643 = ~_4475;
    int _4645 = _4643 + 1;
    int _4647 = _4621 * int(_4583);
    int _4649 = _4647 + _4519;
    float _4651 = float(uint(_4615));
    float _4653 = trunc(_4493);
    float _4655 = precise::max(_4653, 0.0);
    uint _4657 = uint(_4655);
    bool _4659 = _3989 == 0;
    float _4661 = as_type<float>(_4505) * _4651;
    float _4663 = float(uint(_4649));
    float _4665 = trunc(_4611);
    float _4667 = precise::max(_4665, 0.0);
    uint _4669 = uint(_4667);
    int _4671 = int(_4351) + int(_4629);
    int _4673 = ~_4491;
    int _4675 = _4673 + 1;
    float _4677 = trunc(_4479);
    float _4679 = precise::max(_4677, 0.0);
    uint _4681 = uint(_4679);
    int _4683 = int(_4381) + int(_4657);
    float _4685 = as_type<float>(_4535) * _4663;
    int _4687 = ~_3989;
    int _4689 = _4687 + 1;
    float _4691 = trunc(_4503);
    float _4693 = precise::max(_4691, 0.0);
    uint _4695 = uint(_4693);
    int _4697 = _4645 * int(_4605);
    int _4699 = _4697 + _4543;
    float _4701 = float(uint(_4699));
    int _4703 = _4675 * int(_4669);
    int _4705 = _4703 + _4565;
    float _4707 = trunc(_4661);
    float _4709 = precise::max(_4707, 0.0);
    uint _4711 = uint(_4709);
    int _4713 = int(_4403) + int(_4681);
    float _4715 = as_type<float>(_4553) * _4701;
    int _4717 = ~_3771;
    int _4719 = _4717 + 1;
    int _4721 = ~_4069;
    int _4723 = _4721 + 1;
    float _4725 = trunc(_4685);
    float _4727 = precise::max(_4725, 0.0);
    uint _4729 = uint(_4727);
    int _4731 = int(_4429) + int(_4695);
    int _4733 = _4719 * _4671;
    int _4735 = _4733 + _4275;
    int _4737 = ~_4165;
    int _4739 = _4737 + 1;
    float _4741 = float(uint(_4705));
    float _4743 = trunc(_4715);
    float _4745 = precise::max(_4743, 0.0);
    uint _4747 = uint(_4745);
    float _4749 = as_type<float>(_4587) * _4741;
    bool _4751 = uint(_4735) >= uint(_3771);
    int _4753 = _4723 * _4683;
    int _4755 = _4753 + _4313;
    int _4757 = int(_4549) + int(_4711);
    int _4759 = _4739 * _4713;
    int _4761 = _4759 + _4359;
    float _4763 = trunc(_4749);
    float _4765 = precise::max(_4763, 0.0);
    uint _4767 = uint(_4765);
    bool _4769 = uint(_4755) >= uint(_4069);
    int _4771 = int(_4583) + int(_4729);
    int _4773 = _4689 * _4731;
    int _4775 = _4773 + _4341;
    bool _4777 = !_4751;
    int _4779 = _4777 ? 0 : (-1);
    bool _4781 = uint(_4761) >= uint(_4165);
    float _4783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4785 = ~_4397;
    int _4787 = _4785 + 1;
    int _4789 = int(_4605) + int(_4747);
    bool _4791 = !_4769;
    int _4793 = _4791 ? 0 : (-1);
    int _4795 = ~_4445;
    int _4797 = _4795 + 1;
    bool _4799 = uint(_4775) >= uint(_3989);
    int _4801 = ~_4475;
    int _4803 = _4801 + 1;
    int _4805 = _4787 * _4757;
    int _4807 = _4805 + _4495;
    int _4809 = ~_4491;
    int _4811 = _4809 + 1;
    int _4813 = _4797 * _4771;
    int _4815 = _4813 + _4519;
    int _4817 = int(_4669) + int(_4767);
    int _4819 = _4803 * _4789;
    int _4821 = _4819 + _4543;
    bool _4823 = !_4781;
    int _4825 = _4823 ? 0 : (-1);
    bool _4827 = uint(_4807) >= uint(_4397);
    int _4829 = _4811 * _4817;
    int _4831 = _4829 + _4565;
    bool _4833 = !_4799;
    int _4835 = _4833 ? 0 : (-1);
    bool _4837 = uint(_4815) >= uint(_4445);
    bool _4839 = !_4827;
    int _4841 = _4839 ? 0 : (-1);
    int _4843 = ~_4671;
    int _4845 = _4843 + _4779;
    int _4847 = _4845 + 1;
    int _4849 = ~_4731;
    int _4851 = _4849 + _4835;
    int _4853 = _4851 + 1;
    bool _4855 = uint(_4821) >= uint(_4475);
    bool _4857 = !_4837;
    int _4859 = _4857 ? 0 : (-1);
    int _4861 = _3989 * _4853;
    int _4863 = _4861 + _4341;
    bool _4865 = uint(_4831) >= uint(_4491);
    int _4867 = _3771 * _4847;
    int _4869 = _4867 + _4275;
    int _4871 = ~_4713;
    int _4873 = _4871 + _4825;
    int _4875 = _4873 + 1;
    float _4877 = _1679 * 2.0;
    bool _4879 = !_4855;
    int _4881 = _4879 ? 0 : (-1);
    int _4883 = ~_4683;
    int _4885 = _4883 + _4793;
    int _4887 = _4885 + 1;
    int _4889 = _4165 * _4875;
    int _4891 = _4889 + _4359;
    bool _4893 = _3771 == 0;
    float _4895 = floor(_4877);
    bool _4897 = !_4865;
    int _4899 = _4897 ? 0 : (-1);
    int _4901 = _4069 * _4887;
    int _4903 = _4901 + _4313;
    bool _4905 = !_4893;
    int _4907 = _4905 ? _4869 : (-1);
    bool _4909 = !_4659;
    int _4911 = _4909 ? _4863 : (-1);
    bool _4913 = _4069 == 0;
    bool _4915 = _4165 == 0;
    bool _4917 = _4069 == 0;
    int _4919 = _4275 ^ _3771;
    int _4921 = _4313 ^ _4069;
    bool _4923 = !_4915;
    int _4925 = _4923 ? _4891 : (-1);
    int _4927 = ~_4841;
    int _4929 = _4757 + _4927;
    int _4931 = _4929 + 1;
    float _4933 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4935 = _3445 + _4933;
    uint _4937 = uint(int(uint(_4919) >> uint(31)));
    uint _4939 = uint(int(uint(_4921) >> uint(31)));
    float _4941 = _4935 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _4943 = ~_4859;
    int _4945 = _4771 + _4943;
    int _4947 = _4945 + 1;
    float _4949 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4951 = _3641 + _4949;
    int _4953 = ~int(_4937);
    int _4955 = _4953 + 1;
    float _4957 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4959 = _3647 + _4957;
    int _4961 = ~int(_4939);
    int _4963 = _4961 + 1;
    float _4965 = fma(_4951, (*spvDescriptorSet0.vp_c8)._m0[28].x, _4941);
    int _4967 = _4931 ^ _4955;
    float _4969 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4971 = _4947 ^ _4963;
    float _4973 = fma(_4959, (*spvDescriptorSet0.vp_c8)._m0[28].z, _4965);
    bool _4975 = !_4913;
    int _4977 = _4975 ? _4903 : (-1);
    bool _4979 = _3771 == 0;
    int _4981 = ~_4955;
    int _4983 = _4981 + _4967;
    int _4985 = _4983 + 1;
    float _4987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _4989 = ~_4963;
    int _4991 = _4989 + _4971;
    int _4993 = _4991 + 1;
    bool _4995 = !_4979;
    int _4997 = _4995 ? _4985 : (-1);
    bool _4999 = !_4917;
    int _5001 = _4999 ? _4993 : (-1);
    bool _5003 = _4973 >= 0.0;
    float _5005 = _4969 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5007 = _4359 ^ _4165;
    bool _5009 = _3989 == 0;
    float _5011 = fma(_5005, _2957, -0.5);
    int _5013 = _4341 ^ _3989;
    uint _5015 = uint(int(uint(_5007) >> uint(31)));
    float _5017 = _4987 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    uint _5019 = uint(int(uint(_5013) >> uint(31)));
    float _5021 = _4783 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _5023 = ~_4881;
    int _5025 = _4789 + _5023;
    int _5027 = _5025 + 1;
    float _5029 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _5031 = ~int(_5015);
    int _5033 = _5031 + 1;
    float _5035 = fma(_5021, _3675, -0.5);
    int _5037 = ~_4899;
    int _5039 = _4817 + _5037;
    int _5041 = _5039 + 1;
    float _5043 = fma(_5017, _1961, -0.5);
    int _5045 = ~int(_5019);
    int _5047 = _5045 + 1;
    float _5049 = -_4169;
    float _5051 = fma(_3955, _5035, _5049);
    int _5053 = _4117 ? 0 : 1;
    float _5055 = _4895;
    int _5057 = _5047;
    if (_5003)
    {
        out.m_49.x = 0.0;
    }
    bool _5059 = _4895 > 0.0;
    float _5061 = _5051 + 0.5;
    bool _5063 = _4895 >= 0.0;
    bool _5065 = isnan(_4895);
    bool _5067 = _5063 || _5065;
    bool _5069 = isnan(0.0);
    bool _5071 = _5067 || _5069;
    int _5073 = _5027 ^ _5033;
    int _5075 = _5041 ^ _5047;
    float _5077 = _5029 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    if (_5003)
    {
        _5055 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5079 = _5055;
    int _5081 = ~_5053;
    int _5083 = _5081 + 1;
    int _5085 = _5083 + 1;
    float _5087 = fma(_5077, _3411, -0.5);
    int _5089 = ~_5033;
    int _5091 = _5089 + _5073;
    int _5093 = _5091 + 1;
    int _5095 = _5085;
    if (!_4105)
    {
        int _5097 = ~_5053;
        int _5099 = _5097 + 1;
        _5095 = _5099;
    }
    int _5101 = _5095;
    int _5103 = ~_5047;
    int _5105 = _5103 + _5075;
    int _5107 = _5105 + 1;
    float _5109 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_5003)
    {
        float _5111 = _5079 * 5.0;
        _5057 = as_type<int>(_5111);
    }
    int _5113 = _5057;
    float _5115 = fma(_3947, _3671, _4637);
    bool _5117 = _4165 == 0;
    float _5119 = _5115 + 0.5;
    int _5121 = _5071 ? 0 : 1;
    if (_5003)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14276 = as_type<float>(_5113);
        out.gl_Position.z = _14276;
    }
    bool _5123 = !_5117;
    int _5125 = _5123 ? _5093 : (-1);
    float _5127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _5129 = !_5009;
    int _5131 = _5129 ? _5107 : (-1);
    out.m_71.x = _5119;
    out.m_71.y = _5061;
    int _5133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _5135 = _5133 != 0;
    int _5137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _5139 = _5137 != 0;
    int _5141 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _5143 = _5141 != 0;
    float _5145 = float(_4997);
    float _5147 = _5109 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _5149 = ~_5121;
    int _5151 = _5149 + 1;
    int _5153 = _5151 + 1;
    int _5155 = _5153;
    if (!_5059)
    {
        int _5157 = ~_5121;
        int _5159 = _5157 + 1;
        _5155 = _5159;
    }
    int _5161 = _5155;
    float _5163 = _3753 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _5165 = float(_4977);
    float _5167 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _5169 = float(_4925);
    float _5171 = fma(_5147, _2025, -0.5);
    float _5173 = fma(_5163, _2071, -0.5);
    float _5175 = fma(_5147, _5165, _4185);
    float _5177 = -_3297;
    float _5179 = fma(_5005, _5145, _5177);
    float _5181 = fma(_5163, _5169, _4517);
    float _5183 = float(_5125);
    float _5185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _5187 = fma(_3843, _5171, _5175);
    float _5189 = fma(_4633, _5173, _5181);
    float _5191 = float(_5131);
    float _5193 = _4935 * _4935;
    bool _5195 = !_5135;
    int _5197 = _5195 ? 0 : 1;
    float _5199 = fma(_4617, _5011, _5179);
    float _5201 = _5187 + 0.5;
    float _5203 = _5167 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5205 = abs(_5197);
    float _5207 = _5127 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5209 = float(_4907);
    float _5211 = -_4119;
    float _5213 = fma(_5203, _5191, _5211);
    float _5215 = float(_5205);
    float _5217 = fma(_5207, _2065, -0.5);
    float _5219 = float(_4911);
    float _5221 = _5185 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5223 = float(_5001);
    float _5225 = fma(_5017, _5209, _3731);
    float _5227 = _5199 + 0.5;
    float _5229 = -_4423;
    float _5231 = fma(_5221, _5183, _5229);
    float _5233 = fma(_5221, _3443, -0.5);
    float _5235 = fma(_4951, _4951, _5193);
    float _5237 = fma(_5203, _3573, -0.5);
    float _5239 = fma(_5207, _5219, _4437);
    float _5241 = -_4129;
    float _5243 = fma(_5077, _5223, _5241);
    float _5245 = fma(_4959, _4959, _5235);
    float _5247 = fma(_4107, _5237, _5213);
    float _5249 = float(_5161);
    float _5251 = fma(_4631, _5043, _5225);
    float _5253 = fma(_3725, _5217, _5239);
    float _5255 = _5247 + 0.5;
    float _5257 = rsqrt(_5245);
    float _5259 = _5215 * _5249;
    float _5261 = fma(_4127, _5087, _5243);
    float _5263 = in.m_73.x;
    float _5265 = in.m_73.y;
    float _5267 = in.m_73.z;
    float _5269 = fma(_4623, _5233, _5231);
    float _5271 = _5189 + 0.5;
    float _5273 = _5253 + 0.5;
    float _5275 = _5251 + 0.5;
    float _5277 = _5261 + 0.5;
    float _5279 = _5269 + 0.5;
    bool _5281 = !_5139;
    int _5283 = _5281 ? 0 : 1;
    out.m_75.x = _5273;
    out.m_75.y = _5255;
    bool _5285 = !_5143;
    int _5287 = _5285 ? 0 : 1;
    int _5289 = abs(_5283);
    out.m_77.x = _5275;
    out.m_77.y = _5227;
    out.m_77.z = _5201;
    out.m_77.w = _5277;
    float _5291 = _4935 * _5257;
    float _5293 = _4951 * _5257;
    out.m_79.x = _5271;
    out.m_79.y = _5279;
    float _5295 = _5181;
    if (_5003)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5297 = -_5291;
    float _5299 = fma(_5297, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3445);
    float _5301 = -_5293;
    float _5303 = fma(_5301, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3641);
    float _5305 = _4959 * _5257;
    float _5307 = float(_5101);
    float _5309 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5311 = _5299 + _5309;
    float _5313 = float(_5289);
    float _5315 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5317 = _5303 + _5315;
    int _5319 = _3489 ? 0 : 1;
    float _5321 = _5311 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5323 = _5259 * (-2.0);
    float _5325 = -_5305;
    float _5327 = fma(_5325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3647);
    float _5329 = _5313 * _5307;
    float _5331 = fma(_5317, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5321);
    float _5333 = fma(_5323, _5263, _5263);
    float _5335 = _1669 + (-0.5);
    float _5337 = _1478 + _1679;
    float _5339 = fma(_3711, _5323, _3711);
    float _5341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5343 = _5327 + _5341;
    float _5345 = fma(_5335, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5333);
    float _5347 = _5337 + (-1.0);
    float _5349 = _5329 * (-2.0);
    float _5351 = fma(_5343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5331);
    float _5353 = fma(_5339, _4641, _5345);
    float _5355 = fma(_5347, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5357 = _1478 + (-0.5);
    float _5359 = fma(_5349, _5265, _5265);
    bool _5361 = _5351 >= 0.0;
    float _5363 = fma(_5355, _5349, _5355);
    int _5365 = abs(_5287);
    float _5367 = fma(_5357, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5359);
    float _5369 = _5353 * 0.15915493667125701904296875;
    int _5371 = ~_5319;
    int _5373 = _5371 + 1;
    int _5375 = _5373 + 1;
    float _5377 = _1669 + _1679;
    float _5379 = fma(_5363, _4641, _5367);
    int _5381 = _5375;
    float _5383 = _5331;
    if (!_3477)
    {
        int _5385 = ~_5319;
        int _5387 = _5385 + 1;
        _5381 = _5387;
    }
    int _5389 = _5381;
    float _5391 = _5369 * 6.283185482025146484375;
    float _5393 = sin(_5391);
    float _5395 = _5379 * 0.15915493667125701904296875;
    float _5397 = float(_5389);
    if (_5361)
    {
        _5383 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5399 = _5383;
    int _5401 = as_type<int>(_5399);
    if (_5361)
    {
        out.m_49.x = 0.0;
    }
    float _5403 = float(_5365);
    float _5405 = _5369 * 6.283185482025146484375;
    float _5407 = cos(_5405);
    if (_5361)
    {
        float _5409 = _5399 * 5.0;
        _5401 = as_type<int>(_5409);
    }
    int _5411 = _5401;
    float _5413 = _5377 + (-1.0);
    float _5415 = _5403 * _5397;
    if (_5361)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14738 = as_type<float>(_5411);
        out.gl_Position.z = _14738;
    }
    float _5417 = _5395 * 6.283185482025146484375;
    float _5419 = sin(_5417);
    float _5421 = _5415 * (-2.0);
    if (_5361)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5423 = -_3445;
    float _5425 = _5423 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5427 = -_3641;
    float _5429 = _5427 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5431 = fma(_5413, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5433 = fma(_5421, _5267, _5267);
    float _5435 = _5425 * _5425;
    float _5437 = _1679 + (-0.5);
    float _5439 = -_3647;
    float _5441 = _5439 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5443 = fma(_5431, _5421, _5431);
    float _5445 = fma(_5429, _5429, _5435);
    float _5447 = fma(_5437, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5433);
    float _5449 = -_5291;
    float _5451 = fma(_5449, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4935);
    float _5453 = _5395 * 6.283185482025146484375;
    float _5455 = cos(_5453);
    float _5457 = fma(_5441, _5441, _5445);
    float _5459 = fma(_5443, _4641, _5447);
    float _5461 = -_5293;
    float _5463 = fma(_5461, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4951);
    float _5465 = -_5305;
    float _5467 = fma(_5465, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4959);
    float _5469 = _5393 * _5419;
    float _5471 = _5459 * 0.15915493667125701904296875;
    float _5473 = _5451 * _5451;
    float _5475 = rsqrt(_5457);
    float _5477 = _540 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5479 = _5407 * _5419;
    float _5481 = fma(_5463, _5463, _5473);
    float _5483 = fma(_5467, _5467, _5481);
    float _5485 = _5471 * 6.283185482025146484375;
    float _5487 = sin(_5485);
    float _5489 = _5407 * _5455;
    float _5491 = _5429 * _5475;
    float _5493 = sqrt(_5483);
    float _5495 = _5441 * _5475;
    float _5497 = in.m_81.x;
    float _5499 = in.m_81.y;
    float _5501 = in.m_81.z;
    float _5503 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5505 = _5491 * _5503;
    float _5507 = _5425 * _5475;
    float _5509 = fma(_5487, _5489, _5469);
    float _5511 = fma(_5487, _5469, _5489);
    float _5513 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5515 = _5495 * _5513;
    float _5517 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5519 = -_5505;
    float _5521 = fma(_5495, _5517, _5519);
    float _5523 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5525 = _5507 * _5523;
    float _5527 = _5471 * 6.283185482025146484375;
    float _5529 = cos(_5527);
    float _5531 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5533 = -_5515;
    float _5535 = fma(_5507, _5531, _5533);
    float _5537 = _5521 * _5521;
    float _5539 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5541 = -_5525;
    float _5543 = fma(_5491, _5539, _5541);
    float _5545 = _5257 * _5493;
    float _5547 = _542 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5549 = fma(_5535, _5535, _5537);
    float _5551 = _546 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5553 = _5545 * _5547;
    float _5555 = fma(_5543, _5543, _5549);
    float _5557 = _5545 * _5551;
    float _5559 = _5545 * _5477;
    float _5561 = rsqrt(_5555);
    float _5563 = _5393 * _5455;
    float _5565 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5499);
    float _5567 = _5407 * _5529;
    float _5569 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5501);
    float _5571 = -_5479;
    float _5573 = fma(_5487, _5563, _5571);
    float _5575 = _5559 * _5565;
    float _5577 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5497);
    float _5579 = -_5563;
    float _5581 = fma(_5487, _5479, _5579);
    float _5583 = _5455 * _5529;
    float _5585 = _5393 * _5529;
    float _5587 = _5557 * _5577;
    float _5589 = _5567 * _5575;
    float _5591 = _5553 * _5569;
    float _5593 = -_5575;
    float _5595 = _5487 * _5593;
    float _5597 = _5585 * _5575;
    float _5599 = _5535 * _5561;
    float _5601 = _5521 * _5561;
    float _5603 = fma(_5509, _5587, _5589);
    float _5605 = fma(_5583, _5587, _5595);
    float _5607 = _5507 * _5599;
    float _5609 = _5419 * _5529;
    float _5611 = _5543 * _5561;
    float _5613 = fma(_5581, _5591, _5603);
    float _5615 = _5495 * _5601;
    float _5617 = -_5607;
    float _5619 = fma(_5491, _5601, _5617);
    float _5621 = fma(_5573, _5587, _5597);
    float _5623 = fma(_5609, _5591, _5605);
    float _5625 = -_5615;
    float _5627 = fma(_5507, _5611, _5625);
    float _5629 = _5619 * _5613;
    float _5631 = fma(_5511, _5591, _5621);
    float _5633 = _5491 * _5611;
    float _5635 = _5627 * _5613;
    float _5637 = fma(_5611, _5623, _5629);
    float _5639 = -_5633;
    float _5641 = fma(_5495, _5599, _5639);
    float _5643 = fma(_5599, _5623, _5635);
    float _5645 = fma(_5495, _5631, _5637);
    float _5647 = _5641 * _5613;
    float _5649 = fma(_5491, _5631, _5643);
    float _5651 = _3647 + _5645;
    float _5653 = _3641 + _5649;
    float _5655 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5657 = _5651 + _5655;
    float _5659 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5661 = _5653 + _5659;
    float _5663 = _5657 * _5657;
    float _5665 = fma(_5661, _5661, _5663);
    float _5667 = fma(_5601, _5623, _5647);
    float _5669 = sqrt(_5665);
    float _5671 = fma(_5507, _5631, _5667);
    float _5673 = _3445 + _5671;
    bool _5675 = _5669 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5677 = _5631;
    float _5679 = _5671;
    float _5681 = _5653;
    float _5683 = _5665;
    if (!_5675)
    {
        _5677 = _5651;
    }
    float _5685 = _5677;
    float _5687 = _5685;
    if (!_5675)
    {
        _5679 = _5673;
    }
    float _5689 = _5679;
    bool _5691 = !_5675;
    float _5693 = _5689;
    if (!_5691)
    {
        float _5695 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5697 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5699 = _5669 + _5697;
        float _5701 = _5673 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5703 = rsqrt(_5665);
        float _5705 = _5699 * _5695;
        float _5707 = _5705 * 0.15915493667125701904296875;
        float _5709 = _5707 * 6.283185482025146484375;
        float _5711 = cos(_5709);
        float _5713 = _5707 * 6.283185482025146484375;
        float _5715 = sin(_5713);
        float _5717 = _5711 + (-1.0);
        float _5719 = _5717 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5721 = fma(_5715, _5701, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5723 = fma(_5673, _5711, _5719);
        float _5725 = _5703 * _5721;
        float _5727 = fma(_5661, _5725, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5729 = fma(_5657, _5725, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5693 = _5723;
        _5681 = _5727;
        _5687 = _5729;
    }
    float _5731 = _5693;
    float _5733 = _5681;
    float _5735 = _5687;
    float _5737 = -_3445;
    float _5739 = _5737 + _5731;
    float _5741 = -_3641;
    float _5743 = _5741 + _5733;
    float _5745 = -_3647;
    float _5747 = _5745 + _5735;
    float _5749 = _5739 * _5739;
    float _5751 = fma(_5743, _5743, _5749);
    float _5753 = fma(_5747, _5747, _5751);
    float _5755 = sqrt(_5753);
    bool _5757 = _5755 > 0.0;
    bool _5759 = !_5757;
    float _5761 = _5731;
    float _5763 = _5733;
    float _5765 = _5735;
    float _5767 = _5739;
    float _5769 = _5755;
    if (!_5759)
    {
        float _5771 = _200 * _200;
        float _5773 = rsqrt(_5753);
        float _5775 = fma(_198, _198, _5771);
        float _5777 = fma(_202, _202, _5775);
        float _5779 = sqrt(_5777);
        float _5781 = _5743 * _5773;
        float _5783 = _5739 * _5773;
        float _5785 = _5747 * _5773;
        bool _5787 = _5779 > 0.0;
        bool _5789 = !_5787;
        _5767 = _5783;
        _5769 = _5779;
        if (!_5789)
        {
            float _5791 = rsqrt(_5777);
            float _5793 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5795 = _200 * _5791;
            float _5797 = _198 * _5791;
            float _5799 = _5783 * _5795;
            float _5801 = _202 * _5791;
            float _5803 = fma(_5781, _5797, _5799);
            float _5805 = _5793 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5807 = fma(_5785, _5801, _5803);
            float _5809 = _5807 * _5805;
            float _5811 = fma(_198, _5809, _5733);
            float _5813 = fma(_200, _5809, _5731);
            float _5815 = fma(_202, _5809, _5735);
            _5761 = _5813;
            _5763 = _5811;
            _5765 = _5815;
            _5767 = _5803;
            _5769 = _5809;
        }
    }
    float _5817 = _5761;
    float _5819 = _5763;
    float _5821 = _5765;
    float _5823 = _5767;
    float _5825 = _5769;
    float _5827 = -_5291;
    float _5829 = fma(_5827, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5817);
    float _5831 = -_5293;
    float _5833 = fma(_5831, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5819);
    float _5835 = -_5305;
    float _5837 = fma(_5835, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5821);
    float _5839 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5841 = _5829 + _5839;
    float _5843 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5845 = _5833 + _5843;
    float _5847 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5849 = _5837 + _5847;
    float _5851 = _5841 * _5841;
    float _5853 = fma(_5845, _5845, _5851);
    float _5855 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _5857 = fma(_5849, _5849, _5853);
    float _5859 = rsqrt(_5857);
    float _5861 = sqrt(_5857);
    float _5863 = _5859 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5865 = _5845 * _5863;
    float _5867 = _5849 * _5863;
    float _5869 = _5865 * _5865;
    float _5871 = _5867 * _5867;
    float _5873 = _5869 + _5871;
    float _5875 = sqrt(_5873);
    bool _5877 = _5875 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5879 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5881 = _5875 + _5879;
    float _5883 = _5859;
    float _5885 = _5873;
    float _5887 = _5881;
    float _5889 = _5823;
    if (_5877)
    {
        float _5891 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5883 = _5891;
    }
    float _5893 = _5883;
    if (_5877)
    {
        float _5895 = rsqrt(_5873);
        _5885 = _5895;
    }
    float _5897 = _5885;
    if (_5877)
    {
        float _5899 = _5881 * _5893;
        _5887 = _5899;
    }
    float _5901 = _5887;
    if (_5877)
    {
        float _5903 = _5901 * 0.15915493667125701904296875;
        _5889 = _5903;
    }
    float _5905 = _5889;
    float _5907 = _5849;
    float _5909 = _5905;
    if (_5877)
    {
        float _5911 = _5905 * 6.283185482025146484375;
        float _5913 = sin(_5911);
        _5907 = _5913;
    }
    float _5915 = _5907;
    float _5917 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5919 = precise::max(0.0, _5917);
    float _5921 = _5825;
    float _5923 = _5919;
    if (_5877)
    {
        float _5925 = _5905 * 6.283185482025146484375;
        float _5927 = cos(_5925);
        _5921 = _5927;
    }
    float _5929 = _5921;
    float _5931 = -_5863;
    float _5933 = -_5919;
    float _5935 = fma(_5841, _5931, _5933);
    float _5937 = fma(_5303, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _5939 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _5941 = _5935;
    if (_5877)
    {
        float _5943 = _5935 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5923 = _5943;
    }
    float _5945 = _5923;
    float _5947 = floor(_5937);
    float _5949 = _5945;
    float _5951 = _5915;
    if (_5877)
    {
        float _5953 = fma(_5915, _5945, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5949 = _5953;
    }
    float _5955 = _5949;
    float _5957 = _5955;
    if (!_5877)
    {
        _5951 = _5865;
    }
    float _5959 = _5951;
    float _5961 = _5959;
    float _5963 = _5929;
    if (_5877)
    {
        float _5965 = _5929 + (-1.0);
        _5939 = _5965;
    }
    float _5967 = _5939;
    float _5969 = _5967;
    if (_5877)
    {
        float _5971 = _5897 * _5955;
        _5683 = _5971;
    }
    float _5973 = _5683;
    if (!_5877)
    {
        _5957 = _5869;
    }
    float _5975 = _5957;
    float _5977 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _5979 = _5975;
    if (_5877)
    {
        float _5981 = _5967 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5909 = _5981;
    }
    float _5983 = _5909;
    if (_5877)
    {
        float _5985 = _5865 * _5973;
        _5961 = _5985;
    }
    float _5987 = _5961;
    if (!_5877)
    {
        _5969 = _5867;
    }
    float _5989 = _5969;
    float _5991 = _5989;
    if (_5877)
    {
        float _5993 = _5867 * _5973;
        _5991 = _5993;
    }
    float _5995 = _5991;
    if (_5877)
    {
        float _5997 = fma(_5935, _5929, _5983);
        _5941 = _5997;
    }
    float _5999 = _5941;
    if (_5877)
    {
        float _6001 = _5987 * _5987;
        _5979 = _6001;
    }
    float _6003 = _5979;
    float _6005 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (!_5877)
    {
        _5963 = _5871;
    }
    float _6007 = _5963;
    float _6009 = _6007;
    if (_5877)
    {
        float _6011 = _5995 * _5995;
        _6009 = _6011;
    }
    float _6013 = _6009;
    float _6015 = fma(_5999, _5999, _6003);
    float _6017 = fma(_5327, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6019 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6021 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6005);
    float _6023 = _6015 + _6013;
    float _6025 = _5829 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6027 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6019);
    float _6029 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6021);
    float _6031 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6033 = fma(_5861, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6031);
    float _6035 = precise::clamp(_6033, 0.0, 1.0);
    float _6037 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6025);
    float _6039 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6027);
    float _6041 = rsqrt(_6023);
    float _6043 = _6029 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6045 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6037);
    float _6047 = _6039 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6049 = fma(_5833, (*spvDescriptorSet0.vp_c8)._m0[3].x, _5977);
    float _6051 = -_6035;
    float _6053 = _6051 + 1.0;
    float _6055 = _6045 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6057 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6059 = _6043 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6061 = fma(_5837, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6049);
    float _6063 = floor(_6017);
    float _6065 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6057);
    float _6067 = -_6059;
    float _6069 = fma(_6067, _5855, 1.0);
    float _6071 = _6061 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6073 = -_5947;
    float _6075 = _5937 + _6073;
    float _6077 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6065);
    float _6079 = _6041 * _5987;
    float _6081 = _6041 * _5999;
    float _6083 = abs(_6053);
    float _6085 = log2(_6083);
    float _6087 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6077);
    float _6089 = _6079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6091 = _6041 * _5995;
    float _6093 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6095 = -_6089;
    float _6097 = fma(_6081, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6095);
    float _6099 = log2(_6069);
    float _6101 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6093);
    float _6103 = -_6091;
    float _6105 = fma(_6103, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6097);
    float _6107 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6109 = -_6063;
    float _6111 = _6017 + _6109;
    float _6113 = fma(_6105, -0.5, 0.5);
    float _6115 = fma(_6105, 0.5, 0.5);
    float _6117 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6119 = 1.0 / _6087;
    float _6121 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6107);
    float _6123 = fma(_6115, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6125 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6101);
    float _6127 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6121);
    float _6129 = fma(_6115, _6123, -0.212114393711090087890625);
    float _6131 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6125);
    float _6133 = exp2(_6117);
    float _6135 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6127);
    float _6137 = fma(_6115, _6129, 1.570728778839111328125);
    float _6139 = _6099 * 0.693147182464599609375;
    float _6141 = sqrt(_6113);
    float _6143 = _6081 + 1.0;
    float _6145 = _6135 * _6119;
    float _6147 = _6131 * _6119;
    float _6149 = _6139 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6151 = fma(_6145, 0.5, 0.5);
    float _6153 = -_6081;
    float _6155 = fma(_6133, _6143, _6153);
    float _6157 = fma(_6147, -0.5, 0.5);
    float _6159 = fma(_6155, 0.5, 0.5);
    float _6161 = _6141 * 0.636619746685028076171875;
    float2 _15933 = float2(_6075, _6111);
    float _6163 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15933, float2(0.0), isnan(_15933)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15933, float2(0.0), isnan(_15933)), level(0.0)).x;
    float3 _15944 = float3(_6151, _6157, _6149);
    float _6165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_15944, float3(0.0), isnan(_15944)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_15944, float3(0.0), isnan(_15944)), level(0.0)).x;
    float _6167 = -_6137;
    float _6169 = fma(_6161, _6167, 1.0);
    float3 _15960 = float3(_6151, _6157, _6149);
    float4 _6172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_15960, float3(0.0), isnan(_15960)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_15960, float3(0.0), isnan(_15960)), level(0.0)).xyzw;
    float _6174 = _6172.x;
    float _6176 = _6172.y;
    float _6178 = _6172.z;
    float _6180 = _6172.w;
    float2 _15976 = float2(_6169, _6159);
    float3 _6184 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_15976, float2(0.0), isnan(_15976)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_15976, float2(0.0), isnan(_15976)), level(0.0)).xyz;
    float _6186 = _6184.x;
    float _6188 = _6184.y;
    float _6190 = _6184.z;
    float _6192 = _5299 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _6194 = _5499 != 0.0;
    bool _6196 = isnan(_5499);
    bool _6198 = _6194 || _6196;
    bool _6200 = isnan(0.0);
    bool _6202 = _6198 || _6200;
    float _6204 = _6047 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6206 = fma(_5303, (*spvDescriptorSet0.vp_c8)._m0[11].x, _6192);
    bool _6208 = _5497 == 0.0;
    bool _6210 = !_6202;
    bool _6212 = _6208 && _6210;
    float _6214 = _6085 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6216 = fma(_5327, (*spvDescriptorSet0.vp_c8)._m0[11].z, _6206);
    float _6218 = _5299 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _6220 = fma(_6055, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6204);
    float _6222 = _6216 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _6224 = fma(_5303, (*spvDescriptorSet0.vp_c8)._m0[10].x, _6218);
    bool _6226 = _5501 == 0.0;
    bool _6228 = _6226 && _6212;
    float _6230 = fma(_6043, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6220);
    float _6232 = 1.0 / _6222;
    float _6234 = fma(_5327, (*spvDescriptorSet0.vp_c8)._m0[10].z, _6224);
    float _6236 = _6234 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _6238 = exp2(_6214);
    float _6240 = _6236 + _6222;
    float _6242 = in.m_83.x;
    float _6244 = in.m_83.y;
    float _6246 = in.m_83.z;
    float _6248 = in.m_83.w;
    float _6250 = _6240 * _6232;
    float _6252 = _6250 * 0.5;
    float _6254 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _6256 = fma(_6252, (*spvDescriptorSet0.vp_c8)._m0[30].w, _6254);
    float _6258 = in.m_85.x;
    float _6260 = in.m_85.y;
    float _6262 = in.m_85.z;
    float _6264 = 1.0 / _6256;
    float _6266 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6268 = _6264 * _6266;
    float _6270 = abs(_6268);
    float _6272 = log2(_6270);
    float _6274 = _6264;
    float _6276 = _6087;
    if (_6228)
    {
        _4367 = _6260;
    }
    float _6278 = _4367;
    float _6280 = _6278;
    if (_6228)
    {
        _3651 = _6258;
    }
    float _6282 = _3651;
    float _6284 = _6282;
    if (_6228)
    {
        _5295 = _6262;
    }
    float _6286 = _5295;
    float _6288 = _6286;
    if (_6228)
    {
        _4369 = _6278;
    }
    float _6290 = _4369;
    float _6292 = _6290;
    if (_6228)
    {
        _6274 = _6282;
    }
    float _6294 = _6274;
    float _6296 = _6294;
    if (!_6228)
    {
        _6280 = _6260;
    }
    float _6298 = _6280;
    if (!_6228)
    {
        _6284 = _6258;
    }
    float _6300 = _6284;
    float _6302 = _6272 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6304 = _6272;
    if (_6228)
    {
        _6304 = _6286;
    }
    float _6306 = _6304;
    float _6308 = _6306;
    if (!_6228)
    {
        float _6310 = fma(_5499, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6298);
        _6292 = _6310;
    }
    float _6312 = _6292;
    if (!_6228)
    {
        _6288 = _6262;
    }
    float _6314 = _6288;
    if (!_6228)
    {
        float _6316 = fma(_5497, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6300);
        _6296 = _6316;
    }
    float _6318 = _6296;
    float _6320 = _6246 * _6300;
    float _6322 = exp2(_6302);
    float _6324 = _6242 * _6298;
    float _6326 = _6244 * _6314;
    float _6328 = -_6320;
    float _6330 = fma(_6242, _6314, _6328);
    if (!_6228)
    {
        float _6332 = fma(_5501, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6314);
        _6308 = _6332;
    }
    float _6334 = _6308;
    float _6336 = -_6324;
    float _6338 = fma(_6244, _6300, _6336);
    float _6340 = -_6326;
    float _6342 = fma(_6246, _6298, _6340);
    float _6344 = _6330 * _6248;
    float _6346 = _5509 * _5619;
    float _6348 = _6338 * _6248;
    float _6350 = _6342 * _6248;
    float _6352 = _5567 * _5627;
    float _6354 = _5581 * _5627;
    float _6356 = fma(_5583, _5611, _6346);
    bool _6358 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _6360 = isnan(0.5);
    bool _6362 = _6358 || _6360;
    bool _6364 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _6366 = _6362 || _6364;
    float _6368 = fma(_6322, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6370 = precise::clamp(_6368, 0.0, 1.0);
    float _6372 = _5581 * _5641;
    float _6374 = _5581 * _5619;
    float _6376 = fma(_6370, -2.0, 3.0);
    float _6378 = _6370 * _6370;
    float _6380 = fma(_5609, _5601, _6372);
    float _6382 = _6378 * _6376;
    float _6384 = _5509 * _5627;
    float _6386 = _5509 * _5641;
    float _6388 = _5567 * _5641;
    float _6390 = _5567 * _5619;
    float _6392 = fma(_5583, _5599, _6384);
    float _6394 = fma(_5583, _5601, _6386);
    float _6396 = -_5487;
    float _6398 = fma(_6396, _5599, _6352);
    float _6400 = fma(_5609, _5599, _6354);
    float _6402 = -_5487;
    float _6404 = fma(_6402, _5601, _6388);
    float _6406 = -_5487;
    float _6408 = fma(_6406, _5611, _6390);
    float _6410 = fma(_5585, _5491, _6398);
    float _6412 = fma(_5573, _5507, _6394);
    float _6414 = fma(_5609, _5611, _6374);
    float _6416 = fma(_5573, _5491, _6392);
    float _6418 = fma(_5511, _5491, _6400);
    float _6420 = fma(_5585, _5507, _6404);
    float _6422 = fma(_5585, _5495, _6408);
    float _6424 = _6410 * _6244;
    float _6426 = fma(_5573, _5495, _6356);
    float _6428 = fma(_5511, _5507, _6380);
    float _6430 = fma(_5511, _5495, _6414);
    float _6432 = _6420 * _6244;
    float _6434 = _6422 * _6244;
    float _6436 = fma(_6416, _6242, _6424);
    float _6438 = _6344 * _6410;
    float _6440 = fma(_6412, _6242, _6432);
    float _6442 = fma(_6426, _6242, _6434);
    float _6444 = fma(_6418, _6246, _6436);
    float _6446 = _6344 * _6420;
    float _6448 = in.m_87.x;
    float _6450 = _6344 * _6422;
    float _6452 = fma(_6350, _6416, _6438);
    float _6454 = fma(_6350, _6412, _6446);
    float _6456 = -_6382;
    float _6458 = _6456 + 1.0;
    float _6460 = fma(_6350, _6426, _6450);
    float _6462 = fma(_6348, _6418, _6452);
    float _6464 = fma(_6348, _6428, _6454);
    float _6466 = _6420 * _6312;
    float _6468 = fma(_6348, _6430, _6460);
    float _6470 = fma(_6071, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6230);
    float _6472 = fma(_6428, _6246, _6440);
    float _6474 = fma(_6458, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6382);
    float _6476 = fma(_6430, _6246, _6442);
    bool _6478 = _6268 <= 8000.0;
    bool _6480 = isnan(_6268);
    bool _6482 = _6478 || _6480;
    bool _6484 = isnan(8000.0);
    bool _6486 = _6482 || _6484;
    float _6488 = float(_6486);
    out.m_89.x = _6462;
    out.m_89.y = _6464;
    out.m_89.z = _6468;
    float _6490 = _6410 * _6312;
    float _6492 = _6422 * _6312;
    float _6494 = fma(_6412, _6318, _6466);
    out.m_91.x = _6444;
    out.m_91.y = _6472;
    out.m_91.z = _6476;
    float _6496 = _6488 * _6474;
    float _6498 = fma(_6416, _6318, _6490);
    float _6500 = fma(_6426, _6318, _6492);
    float _6502 = _6470 + _6087;
    float _6504 = _6502 * 0.5;
    float _6506 = _6502;
    float _6508 = _6464;
    float _6510 = _6470;
    if (_6366)
    {
        _6506 = 1.0;
    }
    float _6512 = _6506;
    float _6514 = _6512;
    if (!_6366)
    {
        float _6516 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6518 = _6516 * 0.15915493667125701904296875;
        float _6520 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6522 = _6518 * 6.283185482025146484375;
        float _6524 = cos(_6522);
        float _6526 = _6520 * 0.15915493667125701904296875;
        float _6528 = _6518 * 6.283185482025146484375;
        float _6530 = sin(_6528);
        float _6532 = 1.0 / _6524;
        float _6534 = _6526 * 6.283185482025146484375;
        float _6536 = cos(_6534);
        float _6538 = _6530 * _6532;
        float _6540 = _6526 * 6.283185482025146484375;
        float _6542 = sin(_6540);
        float _6544 = _6536 * _6538;
        float _6546 = 1.0 / _6544;
        float _6548 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6550 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6548;
        float _6552 = 1.0 / _6550;
        float _6554 = _6542 * _6546;
        float _6556 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6558 = fma(_6268, _6554, _6556);
        float _6560 = _6558 * _6552;
        float _6562 = precise::clamp(_6560, 0.0, 1.0);
        _6514 = _6562;
        _6508 = _6546;
    }
    float _6564 = _6514;
    float _6566 = _6508;
    float _6568 = -_6238;
    float _6570 = _6568 + 1.0;
    float _6572 = _6496 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6574 = -_6163;
    float _6576 = _6574 + 1.0;
    float _6578 = _6570 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.gl_Position.x = _6135;
    out.gl_Position.y = _6131;
    out.gl_Position.z = _6470;
    out.gl_Position.w = _6087;
    float _6580 = _6576 * _6572;
    float _6582 = precise::clamp(_6580, 0.0, 1.0);
    float _6584 = fma(_6418, _6334, _6498);
    float _6586 = fma(_6428, _6334, _6494);
    float _6588 = fma(_6430, _6334, _6500);
    float _6590 = -_6582;
    float _6592 = fma(_6590, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    bool _6594 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6596 = isnan(_5861);
    bool _6598 = _6594 || _6596;
    bool _6600 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6602 = _6598 || _6600;
    out.m_93.z = _6504;
    out.m_93.w = _6087;
    float _6604 = _6592 * _6448;
    out.m_95.x = _6584;
    out.m_95.y = _6586;
    out.m_95.z = _6588;
    float _6606 = _6604 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6608 = _6578 * _6165;
    float _6610 = -_6578;
    float _6612 = _6610 + 1.0;
    float _6614 = _6180 * _6608;
    float _6616 = _6190 * _6608;
    out.m_97.x = _6606;
    float _6618 = _6564 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6620 = fma(_6186, _6614, _6174);
    float _6622 = fma(_6188, _6614, _6176);
    float _6624 = _6180 * _6612;
    float _6626 = fma(_6180, _6616, _6178);
    float _6628 = _6566;
    float _6630 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _6632 = _6614;
    float _6634 = _6608;
    if (!_6602)
    {
        _6628 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6636 = _6628;
    float _6638 = _6636;
    float _6640 = _6636;
    if (!_6602)
    {
        _6630 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6642 = _6630;
    out.m_99.x = _6620;
    out.m_99.y = _6622;
    out.m_99.z = _6626;
    out.m_99.w = _6624;
    float _6644 = _6642;
    float _6646 = _6642;
    if (!_6602)
    {
        _6276 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6648 = _6276;
    float _6650 = _6648;
    float _6652 = _6648;
    if (!_6602)
    {
        _6510 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6654 = _6510;
    float _6656 = _6654;
    float _6658 = _6654;
    if (!_6602)
    {
        _6632 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6660 = _6632;
    float _6662 = _6660;
    float _6664 = _6660;
    if (!_6602)
    {
        _6634 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6666 = _6634;
    bool _6668 = !_6602;
    float _6670 = _6666;
    float _6672 = _6666;
    if (!_6668)
    {
        bool _6674 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6676 = isnan(_5861);
        bool _6678 = _6674 || _6676;
        bool _6680 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6682 = _6678 || _6680;
        if (!_6682)
        {
            float _6684 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6686 = _5861 + _6684;
            float _6688 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6690 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6688;
            float _6692 = 1.0 / _6690;
            float _6694 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6696 = _6694 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6698 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6700 = _6698 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6702 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6704 = _6702 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6706 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6708 = _6706 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6710 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6712 = _6710 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6714 = _6686 * _6692;
            float _6716 = precise::clamp(_6714, 0.0, 1.0);
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6722 = fma(_6716, _6700, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6724 = fma(_6716, _6720, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6726 = fma(_6716, _6696, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6728 = fma(_6716, _6704, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6730 = fma(_6716, _6708, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6732 = fma(_6716, _6712, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6664 = _6726;
            _6646 = _6730;
            _6658 = _6724;
            _6640 = _6728;
            _6672 = _6722;
            _6652 = _6732;
            _6734 = true;
        }
        else
        {
            bool _6736 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6738 = isnan(_5861);
            bool _6740 = _6736 || _6738;
            bool _6742 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6744 = _6740 || _6742;
            if (!_6744)
            {
                _6638 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6746 = _6638;
            _6640 = _6746;
            if (!_6744)
            {
                _6644 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6748 = _6644;
            _6646 = _6748;
            if (!_6744)
            {
                _6650 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6750 = _6650;
            _6652 = _6750;
            if (!_6744)
            {
                _6656 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6752 = _6656;
            _6658 = _6752;
            if (!_6744)
            {
                _6662 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6754 = _6662;
            _6664 = _6754;
            if (!_6744)
            {
                _6670 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6756 = _6670;
            bool _6758 = !_6744;
            _6672 = _6756;
            if (!_6758)
            {
                bool _6760 = _5861 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6762 = isnan(_5861);
                bool _6764 = _6760 || _6762;
                bool _6766 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6768 = _6764 || _6766;
                if (!_6768)
                {
                    float _6770 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6772 = _5861 + _6770;
                    float _6774 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6776 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6774;
                    float _6778 = 1.0 / _6776;
                    float _6780 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6782 = _6780 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6784 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6786 = _6784 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6788 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6790 = _6788 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6792 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6794 = _6792 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6796 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6798 = _6796 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6800 = _6772 * _6778;
                    float _6802 = precise::clamp(_6800, 0.0, 1.0);
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6808 = fma(_6802, _6786, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6810 = fma(_6802, _6806, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6812 = fma(_6802, _6782, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6814 = fma(_6802, _6790, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6816 = fma(_6802, _6794, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6818 = fma(_6802, _6798, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6664 = _6812;
                    _6646 = _6816;
                    _6658 = _6810;
                    _6640 = _6814;
                    _6672 = _6808;
                    _6652 = _6818;
                    _6734 = true;
                }
                else
                {
                    _6664 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6646 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6658 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6640 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6672 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6652 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6734 = false;
    float _6820 = _6664;
    float _6822 = _6646;
    float _6824 = _6658;
    float _6826 = _6640;
    float _6828 = _6672;
    float _6830 = _6652;
    float _6832 = fma(_6586, -0.5, 0.5);
    float _6834 = precise::clamp(_6832, 0.0, 1.0);
    float _6836 = -_6820;
    float _6838 = _6822 + _6836;
    float _6840 = _6618 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6842 = -_6824;
    float _6844 = _6826 + _6842;
    float _6846 = fma(_6834, _6838, _6820);
    out.m_101.x = 0.0;
    float _6848 = -_6828;
    float _6850 = _6830 + _6848;
    float _6852 = fma(_6834, _6844, _6824);
    float _6854 = _6846 * 0.586610972881317138671875;
    out.m_49.x = _6840;
    bool _6856 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6858 = fma(_6834, _6850, _6828);
    float _6860 = fma(_6852, 0.298911988735198974609375, _6854);
    bool _6862 = _6564 > 0.0;
    bool _6864 = isnan(_6564);
    bool _6866 = _6862 || _6864;
    bool _6868 = isnan(0.0);
    bool _6870 = _6866 || _6868;
    float _6872 = fma(_6858, 0.114477999508380889892578125, _6860);
    float _6874 = -_6872;
    float _6876 = _6852 + _6874;
    float _6878 = -_6872;
    float _6880 = _6846 + _6878;
    float _6882 = -_6872;
    float _6884 = _6858 + _6882;
    float _6886 = fma(_6876, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    float _6888 = fma(_6880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    float _6890 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6872);
    bool _6892 = !_6856;
    if (!_6892)
    {
        float _6894 = -_5829;
        float _6896 = _6894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6898 = -_5833;
        float _6900 = _6898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6902 = -_5837;
        float _6904 = _6902 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6906 = _6896 * _6896;
        float _6908 = fma(_6900, _6900, _6906);
        float _6910 = fma(_6904, _6904, _6908);
        float _6912 = sqrt(_6910);
        float _6914 = rsqrt(_6910);
        float _6916 = -_6912;
        float _6918 = _6916 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6920 = _6918 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6922 = precise::clamp(_6920, 0.0, 1.0);
        float _6924 = _6900 * _6914;
        float _6926 = _6896 * _6914;
        float _6928 = abs(_6922);
        float _6930 = log2(_6928);
        float _6932 = _6904 * _6914;
        float _6934 = _6924 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6936 = _6586 * _6926;
        float _6938 = -_6926;
        float _6940 = -_6934;
        float _6942 = fma(_6938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6940);
        float _6944 = fma(_6584, _6924, _6936);
        float _6946 = -_6932;
        float _6948 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6942);
        float _6950 = fma(_6588, _6932, _6944);
        float _6952 = precise::clamp(_6950, 0.0, 1.0);
        float _6954 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6956 = _6948 + _6954;
        float _6958 = _6930 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6960 = _6956 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6962 = precise::clamp(_6960, 0.0, 1.0);
        float _6964 = exp2(_6958);
        float _6966 = _6964 * _6962;
        float _6968 = _6952 * _6966;
        float _6970 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6972 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6974 = _6968 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_101.x = _6970;
        out.m_101.y = _6972;
        out.m_101.z = _6974;
    }
    out.m_103.x = _6886;
    out.m_103.y = _6888;
    out.m_103.z = _6890;
    if (_6870)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _6976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_49.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6976;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 92, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 93, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 94, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 95, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

