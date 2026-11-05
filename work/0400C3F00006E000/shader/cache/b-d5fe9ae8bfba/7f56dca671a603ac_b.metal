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
    float4 m_111 [[user(locn2)]];
    float4 m_79 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_89 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_103 [[user(locn9)]];
    float4 m_99 [[user(locn10)]];
    float4 m_107 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_105 [[user(locn14)]];
    float4 m_97 [[user(locn15)]];
    float4 m_113 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_93 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
    float4 m_71 [[attribute(11)]];
    float4 m_95 [[attribute(12)]];
    float4 m_57 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4674 = false;
    bool _3719 = false;
    bool _742 = false;
    bool _638 = false;
    bool _496 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4973 = as_type<float>(_148);
        out.gl_Position.z = _4973;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5043 = as_type<float>(_186);
        out.gl_Position.z = _5043;
    }
    if (_178)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _242 = _234;
    float _260;
    if (!_236)
    {
        float _244 = in.m_69.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_132);
        float _266 = 1.0 / _264;
        float _268 = _166 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    bool _292 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _294 = isnan(_270);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _270 + _304;
    float _308 = 1.0 / _286;
    float _310 = -_302;
    float _312 = _310 + 1.0;
    float _314 = 1.0 / _282;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _322 = 1.0 / _290;
    float _324 = _274 * _308;
    bool _326 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_270);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _336 * _312;
    float _340 = _278 * _314;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -_336;
    float _352 = _350 + 1.0;
    float _354 = fma(_348, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = _306 * _322;
    float _362 = fma(_318, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _364 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _366 = isnan(_270);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _382 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_270);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = _374 * _352;
    float _400 = -_374;
    float _402 = _400 + 1.0;
    float _404 = fma(_358, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_380, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = fma(_396, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = _392 * _402;
    float _412 = -_392;
    float _414 = _412 + 1.0;
    float _416 = in.m_71.x;
    float _418 = in.m_71.y;
    float _420 = in.m_71.z;
    float _422 = _354 * _410;
    float _424 = _376 * _410;
    float _426 = _362 * _410;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _428;
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _446 = fma(_430, _360, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_404, _398, _434);
    float _450 = fma(_438, _360, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _360, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_408, _398, _432);
    float _456 = fma(_406, _398, _444);
    float _458 = fma(_446, _338, _448);
    float _460 = fma(_450, _338, _454);
    float _462 = fma(_452, _338, _456);
    float _464 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].y, _458);
    float _466 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    float _470 = _464 * _418;
    float _472 = _466 * _416;
    float _474 = _468 * _420;
    bool _476 = !_320;
    float _494;
    if (!_476)
    {
        float _478 = in.m_69.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_132);
        float _500 = 1.0 / _498;
        float _502 = _166 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _504 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = isnan(_504);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _532 = isnan(_504);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    bool _546 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _548 = isnan(_504);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = 1.0 / _512;
    float _560 = -_524;
    float _562 = _560 + 1.0;
    bool _564 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _566 = _540 * _562;
    float _568 = -_540;
    float _570 = _568 + 1.0;
    float _572 = 1.0 / _528;
    float _574 = _544 * _558;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = fma(_574, _508, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -_556;
    float _584 = _582 + 1.0;
    float _586 = _580 * _566;
    float _588 = _578 * _572;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _504 + _590;
    float _594 = _524 * _584;
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = fma(_598, _594, _596);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _608 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _610;
    out.m_73.y = _612;
    out.m_73.z = _614;
    out.m_73.w = _616;
    bool _618 = !_564;
    float _636;
    if (!_618)
    {
        float _620 = in.m_69.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_132);
        float _642 = 1.0 / _640;
        float _644 = _166 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    bool _648 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _650 = isnan(_646);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _664 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _666 = isnan(_646);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _682 = _646 + _680;
    float _684 = -_658;
    float _686 = _684 + 1.0;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _690 = 1.0 / _662;
    float _692 = _674 * _686;
    float _694 = -_674;
    float _696 = _694 + 1.0;
    float _698 = _678 * _690;
    float _700 = fma(_698, _682, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _704 = _700 * _692;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[131].x, _704);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _712 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[132].x, _708);
    float _716 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _714 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _716;
    out.m_75.y = _712;
    out.m_75.z = _718;
    out.m_75.w = _720;
    bool _722 = !_688;
    float _740;
    if (!_722)
    {
        float _724 = in.m_69.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_132);
        float _746 = 1.0 / _744;
        float _748 = _166 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = in.m_69.x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _760 = _750 + _758;
    float _762 = float(_132);
    float _764 = in.m_77.y;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _768 = _766 != 0;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _772 = _750 + _770;
    float _774 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _776 = int(_774);
    float _778 = in.m_61.w;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _782 = _750 + _780;
    float _784 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _788 = int(_786);
    float _790 = float(_754);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _796 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _798 = isnan(_750);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    bool _808 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _810 = isnan(_750);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _790;
    float _822 = float(uint(_776));
    int _824 = ~_776;
    int _826 = _824 + 1;
    bool _828 = _776 == 0;
    float _830 = 1.0 / _822;
    int _832 = ~_776;
    int _834 = _832 + 1;
    float _836 = float(_788);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _840 = _820 * _166;
    float _842 = 1.0 / _836;
    int _844 = as_type<int>(_830) + (-2);
    float _846 = trunc(_840);
    int _848 = int(_846);
    float _850 = float(_776);
    float _852 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _854 = int(_852);
    float _856 = _842 * _166;
    float _858 = float(uint(_848));
    float _860 = trunc(_856);
    int _862 = int(_860);
    float _864 = as_type<float>(_844) * _858;
    float _866 = float(uint(_854));
    float _868 = 1.0 / _762;
    int _870 = ~_854;
    int _872 = _870 + 1;
    float _874 = trunc(_864);
    float _876 = precise::max(_874, 0.0);
    uint _879 = uint(_876);
    float _881 = 1.0 / _866;
    int _883 = _834 * int(_879);
    int _885 = _883 + _848;
    float _887 = 1.0 / _794;
    float _889 = float(uint(_885));
    int _891 = as_type<int>(_881) + (-2);
    float _893 = as_type<float>(_844) * _889;
    float _895 = _889;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _899 = as_type<float>(_854);
    if (_768)
    {
        _895 = 1.0;
    }
    float _901 = _895;
    float _903 = _901;
    if (!_768)
    {
        _903 = 7.345489978790283203125;
    }
    float _905 = _903;
    float _907 = trunc(_893);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    float _913 = _905 * _756;
    float _915 = floor(_913);
    int _917 = int(_879) + int(_911);
    float _919 = float(_848);
    float _921 = float(uint(_862));
    int _923 = _826 * _917;
    int _925 = _923 + _848;
    bool _927 = _919 >= _850;
    bool _929 = isnan(_919);
    bool _931 = _927 || _929;
    bool _933 = isnan(_850);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = -_915;
    float _941 = _913 + _939;
    float _943 = as_type<float>(_891) * _921;
    bool _945 = uint(_925) >= uint(_776);
    float _947 = trunc(_937);
    int _949 = int(_947);
    bool _951 = !_945;
    int _953 = _951 ? 0 : (-1);
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _965 = _963 != 0;
    int _967 = ~_917;
    int _969 = _967 + _953;
    int _971 = _969 + 1;
    float _973 = trunc(_943);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = in.m_69.y;
    float _981 = _850 * _166;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _985 = _983 != 0;
    int _987 = _776 * _971;
    int _989 = _987 + _848;
    float _991 = _981 * _868;
    int _993 = ~_949;
    int _995 = _993 + 1;
    int _997 = _995 + 1;
    bool _999 = !_828;
    float _1001 = _999 ? as_type<float>(_989) : as_type<float>(0xffffffffu /* nan */);
    float _1003 = _941 * _850;
    float _1005 = _941;
    float _1007 = _1001;
    if (_768)
    {
        _1005 = _756;
    }
    float _1009 = _1005;
    float _1011 = trunc(_991);
    int _1013 = int(_1011);
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>(_1001) * _997;
    float _1021 = _1009;
    if (_768)
    {
        _1007 = 1.0;
    }
    float _1023 = _1007;
    float _1025 = _1023;
    if (!_768)
    {
        _1025 = 1.2345600128173828125;
    }
    float _1027 = _1025;
    int _1029 = _872 * int(_977);
    int _1031 = _1029 + _862;
    int _1033 = _776 + (-1);
    float _1035 = trunc(_1003);
    int _1037 = int(_1035);
    if (!_768)
    {
        _1021 = _979;
    }
    float _1039 = _1021;
    float _1041 = float(uint(_1031));
    int _1043 = _949 * _1033;
    int _1045 = _1043 + _1019;
    bool _1047 = !_985;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = _1039 * _1027;
    bool _1053 = !_961;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = as_type<float>(_891) * _1041;
    bool _1059 = !_957;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = abs(_1049);
    int _1065 = abs(_1055);
    float _1067 = trunc(_1057);
    float _1069 = precise::max(_1067, 0.0);
    uint _1071 = uint(_1069);
    bool _1073 = !_965;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = abs(_1061);
    int _1079 = _1045 * _1065;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1083 = _1081 != 0;
    float _1085 = floor(_1051);
    int _1087 = abs(_1075);
    int _1089 = _1037 * _1063;
    int _1091 = _1089 + _848;
    bool _1093 = !_1083;
    int _1095 = _1093 ? 0 : 1;
    bool _1097 = _854 == 0;
    int _1099 = _1013 * _1077;
    int _1101 = _1099 + _1079;
    int _1103 = abs(_1095);
    int _1105 = int(_977) + int(_1071);
    int _1107 = _1091 * _1087;
    int _1109 = _1107 + _1101;
    int _1111 = ~_854;
    int _1113 = _1111 + 1;
    float _1115 = -_1085;
    float _1117 = _1051 + _1115;
    float _1119 = float(_854);
    int _1121 = _1037 * _1103;
    int _1123 = _1121 + _1109;
    float _1125 = float(_862);
    int _1127 = _1113 * _1105;
    int _1129 = _1127 + _862;
    float _1131 = _1119 * _1117;
    bool _1133 = _1125 >= _1119;
    bool _1135 = isnan(_1125);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(_1119);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = float(uint(_1123));
    bool _1147 = uint(_1129) >= uint(_854);
    float _1149 = trunc(_1131);
    int _1151 = int(_1149);
    float _1153 = as_type<float>(_844) * _1145;
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1165 = _1163 != 0;
    int _1167 = ~_1105;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = trunc(_1143);
    int _1175 = int(_1173);
    int _1177 = ~_776;
    int _1179 = _1177 + 1;
    int _1181 = _854 * _1171;
    int _1183 = _1181 + _862;
    float _1185 = _1119 * _166;
    float _1187 = trunc(_1153);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    float _1193 = _1185 * _868;
    bool _1195 = !_1097;
    int _1197 = _1195 ? _1183 : (-1);
    int _1199 = ~_1175;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    float _1205 = trunc(_1193);
    int _1207 = int(_1205);
    bool _1209 = !_1161;
    int _1211 = _1209 ? 0 : 1;
    int _1213 = _1203 * _1197;
    int _1215 = _854 + (-1);
    int _1217 = _1179 * int(_1191);
    int _1219 = _1217 + _1123;
    bool _1221 = !_1017;
    int _1223 = _1221 ? 0 : 1;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1231 = _1229 != 0;
    int _1233 = _1175 * _1215;
    int _1235 = _1233 + _1213;
    float _1237 = float(uint(_1219));
    bool _1239 = !_1165;
    int _1241 = _1239 ? 0 : 1;
    bool _1243 = !_1227;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = as_type<float>(_844) * _1237;
    int _1249 = abs(_1241);
    int _1251 = abs(_1223);
    float _1253 = trunc(_1247);
    float _1255 = precise::max(_1253, 0.0);
    uint _1257 = uint(_1255);
    int _1259 = abs(_1211);
    int _1261 = _1235 * _1249;
    int _1263 = abs(_1245);
    bool _1265 = !_1231;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1151 * _1251;
    int _1271 = _1269 + _862;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1275 = _1273 != 0;
    int _1277 = _1207 * _1259;
    int _1279 = _1277 + _1261;
    int _1281 = abs(_1267);
    float _1283 = in.m_69.z;
    int _1285 = ~_776;
    int _1287 = _1285 + 1;
    int _1289 = _1271 * _1263;
    int _1291 = _1289 + _1279;
    int _1293 = int(_1191) + int(_1257);
    float _1295 = in.m_69.w;
    int _1297 = _1151 * _1281;
    int _1299 = _1297 + _1291;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1303 = _1301 != 0;
    int _1305 = ~_854;
    int _1307 = _1305 + 1;
    int _1309 = _1287 * _1293;
    int _1311 = _1309 + _1123;
    float _1313 = float(uint(_1299));
    int _1315 = _1281;
    float _1317 = as_type<float>(_1207);
    int _1319 = _1279;
    float _1321 = as_type<float>(_1151);
    if (_1275)
    {
        float _1323 = -_188;
        float _1325 = _1323 + 1.0;
        _1315 = as_type<int>(_1325);
    }
    int _1327 = _1315;
    if (!_1275)
    {
        _1317 = _188;
    }
    float _1329 = _1317;
    bool _1331 = uint(_1311) >= uint(_776);
    float _1333 = as_type<float>(_891) * _1313;
    bool _1335 = _776 == 0;
    bool _1337 = !_1331;
    int _1339 = _1337 ? 0 : (-1);
    float _1341 = trunc(_1333);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    bool _1347 = _1331;
    float _1349 = _1329;
    if (_1275)
    {
        bool _1351 = _756 > 0.5;
        _1347 = _1351;
    }
    bool _1353 = _1347;
    if (_1303)
    {
        float _1355 = -_188;
        float _1357 = _1355 + 1.0;
        _1319 = as_type<int>(_1357);
    }
    int _1359 = _1319;
    int _1361 = ~_1293;
    int _1363 = _1361 + _1339;
    int _1365 = _1363 + 1;
    if (_1275)
    {
        float _1367 = _1353 ? as_type<float>(_1327) : _188;
        _1349 = _1367;
    }
    float _1369 = _1349;
    bool _1371 = _979 > 0.5;
    int _1373 = _776 * _1365;
    int _1375 = _1373 + _1123;
    float _1377 = -_192;
    float _1379 = _1377 + 1.0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1383 = _1381 != 0;
    bool _1385 = _1283 > 0.5;
    int _1387 = _1371 ? as_type<int>(_1379) : as_type<int>(_192);
    int _1389 = _1307 * int(_1345);
    int _1391 = _1389 + _1299;
    bool _1393 = _1295 > 0.5;
    bool _1395 = !_1335;
    int _1397 = _1395 ? _1375 : (-1);
    float _1399 = float(uint(_1391));
    if (!_1303)
    {
        _1321 = _188;
    }
    float _1401 = _1321;
    float _1403 = _1401;
    if (_1303)
    {
        float _1405 = _1385 ? as_type<float>(_1359) : _188;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = as_type<float>(_891) * _1399;
    float _1411 = _1383 ? as_type<float>(_1387) : _192;
    int _1413 = _1397 & 3;
    bool _1415 = _1413 != 0;
    float _1417 = trunc(_1409);
    float _1419 = precise::max(_1417, 0.0);
    uint _1421 = uint(_1419);
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1425 = _1423 != 0;
    int _1427 = _1393 ? as_type<int>(_1379) : as_type<int>(_192);
    int _1429 = _1397 & 3;
    bool _1431 = _1429 != 0;
    int _1433 = _1415 ? 0 : 1;
    float _1435 = _1425 ? as_type<float>(_1427) : _192;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1439 = _1437 != 0;
    bool _1441 = uint(_1429) > 1u;
    int _1443 = ~_1433;
    int _1445 = _1443 + 1;
    int _1447 = _1445 + 1;
    int _1449 = int(_1345) + int(_1421);
    int _1451 = ~_854;
    int _1453 = _1451 + 1;
    int _1455 = _1447;
    if (_1439)
    {
        float _1457 = _1385 ? _1379 : _192;
        _238 = _1457;
    }
    float _1459 = _238;
    int _1461 = _1453 * _1449;
    int _1463 = _1461 + _1299;
    float _1465 = as_type<float>(_1463);
    if (!_1441)
    {
        int _1467 = ~_1433;
        int _1469 = _1467 + 1;
        _1455 = _1469;
    }
    int _1471 = _1455;
    float _1473 = in.m_50.x;
    float _1475 = in.m_50.y;
    float _1477 = in.m_50.z;
    bool _1479 = _1429 != 3;
    bool _1481 = uint(_1429) >= 2u;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    int _1487 = _1481 ? 0 : 1;
    bool _1489 = _979 > 0.5;
    bool _1491 = _1489 && _1485;
    int _1493 = ~_1487;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    int _1499 = _1497;
    if (_1479)
    {
        int _1501 = ~_1487;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    bool _1507 = uint(_1463) >= uint(_854);
    if (!_1485)
    {
        _1465 = _188;
    }
    float _1509 = _1465;
    bool _1511 = !_1507;
    int _1513 = _1511 ? 0 : (-1);
    float _1515 = _1509;
    if (_1491)
    {
        float _1517 = -_188;
        float _1519 = _1517 + 1.0;
        _240 = _1519;
    }
    float _1521 = _240;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1525 = _1523 != 0;
    float _1527 = _214 * _1475;
    float _1529 = _202 * _1475;
    float _1531 = _208 * _1475;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1535 = _1533 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1537 = fma(_200, _1473, _1529);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1543 = fma(_206, _1473, _1531);
    float _1545 = 1.0 / _1535;
    float _1547 = fma(_212, _1473, _1527);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1553 = fma(_204, _1477, _1537);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1555;
    float _1559 = float(uint(_1091));
    float _1561 = _1475 + _764;
    float _1563 = 1.0 / _1541;
    float _1565 = _1557 * _887;
    float _1567 = as_type<float>(_844) * _1559;
    int _1569 = ~_1449;
    int _1571 = _1569 + _1513;
    int _1573 = _1571 + 1;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1579 = _1577 != 0;
    float _1581 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1587;
    int _1591 = _854 * _1573;
    int _1593 = _1591 + _1299;
    float _1595 = -_1575;
    float _1597 = fma(_1581, 2.0, _1595);
    float _1599 = trunc(_1567);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1607 = _979 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1609 = _1585 * _1545;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1615 = _1589 * _1563;
    if (_1485)
    {
        _1515 = _1521;
    }
    float _1617 = _1515;
    float _1619 = fma(_1607, -2.0, _1605);
    bool _1621 = !_1097;
    float _1623 = _1621 ? as_type<float>(_1593) : as_type<float>(0xffffffffu /* nan */);
    float _1625 = fma(_210, _1477, _1543);
    float _1627 = float(uint(_1271));
    float _1629 = 1.0 / _1613;
    int _1631 = ~_776;
    int _1633 = _1631 + 1;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1639 = fma(_216, _1477, _1547);
    float _1641 = as_type<float>(_891) * _1627;
    int _1643 = _1633 * int(_1603);
    int _1645 = _1643 + _1091;
    int _1647 = ~_854;
    int _1649 = _1647 + 1;
    float _1651 = 1.0 / _1551;
    int _1653 = as_type<int>(_1623) & 3;
    bool _1655 = _1653 != 0;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1661 = float(uint(_1645));
    float _1663 = _1553 + _778;
    int _1665 = _1655 ? 0 : 1;
    float _1667 = -_166;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1597);
    bool _1671 = uint(_1653) >= 2u;
    float _1673 = trunc(_1641);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    float _1679 = as_type<float>(_844) * _1661;
    int _1681 = _1671 ? 0 : 1;
    bool _1683 = _1653 != 3;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1689 = 1.0 / _1659;
    int _1691 = ~_1681;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    float _1697 = _1637 * _1651;
    int _1699 = ~_1665;
    int _1701 = _1699 + 1;
    int _1703 = _1701 + 1;
    bool _1705 = !_1525;
    int _1707 = _1705 ? 0 : 1;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1711 = _1709 != 0;
    float _1713 = trunc(_1679);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    int _1719 = _1695;
    int _1721 = _1703;
    float _1723 = _1625;
    float _1725 = _1623;
    float _1727 = _1619;
    if (_1683)
    {
        int _1729 = ~_1681;
        int _1731 = _1729 + 1;
        _1719 = _1731;
    }
    int _1733 = _1719;
    int _1735 = _1649 * int(_1677);
    int _1737 = _1735 + _1271;
    bool _1739 = uint(_1653) > 1u;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1741;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1749 = 1.0 / _1687;
    float _1751 = float(uint(_1737));
    float _1753 = _1743 * _1629;
    float _1755 = _756 * 2.0;
    float _1757 = _1747 * _1689;
    float _1759 = _756 + _979;
    float _1761 = as_type<float>(_891) * _1751;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1763;
    float _1767 = floor(_1755);
    int _1769 = int(_1603) + int(_1717);
    float _1771 = _1759 + (-1.0);
    float _1773 = _979 * 2.0;
    int _1775 = ~_776;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1757, _760, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    if (!_1739)
    {
        int _1781 = ~_1665;
        int _1783 = _1781 + 1;
        _1721 = _1783;
    }
    int _1785 = _1721;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1789 = trunc(_1761);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    float _1795 = _979 + _1283;
    float _1797 = _1765 * _1749;
    int _1799 = _1777 * _1769;
    int _1801 = _1799 + _1091;
    int _1803 = ~_854;
    int _1805 = _1803 + 1;
    float _1807 = _1795 + (-1.0);
    float _1809 = fma(_1797, _782, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1811 = _1767 > 0.0;
    float _1813 = floor(_1773);
    bool _1815 = _1767 >= 0.0;
    bool _1817 = isnan(_1767);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1827 = _1283 * 2.0;
    bool _1829 = !_1579;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = _1823 ? 0 : 1;
    int _1835 = int(_1677) + int(_1793);
    bool _1837 = uint(_1801) >= uint(_776);
    int _1839 = ~_1833;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    int _1845 = _1805 * _1835;
    int _1847 = _1845 + _1271;
    int _1849 = _1843;
    if (!_1811)
    {
        int _1851 = ~_1833;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    bool _1857 = !_1837;
    int _1859 = _1857 ? 0 : (-1);
    bool _1861 = uint(_1847) >= uint(_854);
    float _1863 = floor(_1827);
    bool _1865 = _1813 > 0.0;
    bool _1867 = _1813 >= 0.0;
    bool _1869 = isnan(_1813);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.0);
    bool _1875 = _1871 || _1873;
    int _1877 = ~_1769;
    int _1879 = _1877 + _1859;
    int _1881 = _1879 + 1;
    int _1883 = as_type<int>(_1813);
    if (_1711)
    {
        _1883 = 0;
    }
    int _1885 = _1883;
    int _1887 = _1885;
    if (_1711)
    {
        _897 = 0;
    }
    int _1889 = _897;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1893 = _750 + _1891;
    int _1895 = _1875 ? 0 : 1;
    int _1897 = _776 * _1881;
    int _1899 = _1897 + _1091;
    int _1901 = _1889;
    if (!_1711)
    {
        _1887 = 1;
    }
    int _1903 = _1887;
    float _1905 = fma(_1609, _1893, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1711)
    {
        _1901 = 2;
    }
    int _1907 = _1901;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1915 = _1913 != 0;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1919 = _1917 != 0;
    bool _1921 = _776 == 0;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1925 = _750 + _1923;
    bool _1927 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1929 = isnan(_750);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    int _1939 = ~_1895;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1565, _1925, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1947 = !_1861;
    int _1949 = _1947 ? 0 : (-1);
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1953 = _750 + _1951;
    int _1955 = _1943;
    if (!_1865)
    {
        int _1957 = ~_1895;
        int _1959 = _1957 + 1;
        _1955 = _1959;
    }
    int _1961 = _1955;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1965 = _750 + _1963;
    bool _1967 = _1863 > 0.0;
    bool _1969 = _1863 >= 0.0;
    bool _1971 = isnan(_1863);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan(0.0);
    bool _1977 = _1973 || _1975;
    float _1979 = -_1937;
    float _1981 = _1979 + 1.0;
    bool _1983 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1985 = isnan(_750);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    bool _1995 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1997 = isnan(_750);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2003 = _1999 || _2001;
    float _2005 = float(_2003);
    bool _2007 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2009 = isnan(_750);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2015 = _2011 || _2013;
    float _2017 = float(_2015);
    float _2019 = _1993 * _1981;
    float _2021 = -_1993;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1615, _1953, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2027 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2029 = isnan(_750);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = fma(_1697, _1965, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2041 = -_2005;
    float _2043 = _2041 + 1.0;
    bool _2045 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2047 = isnan(_750);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    float _2057 = -_2017;
    float _2059 = _2057 + 1.0;
    bool _2061 = !_1921;
    int _2063 = _2061 ? _1899 : (-1);
    float _2065 = _2037 * _2043;
    float _2067 = -_2037;
    float _2069 = _2067 + 1.0;
    float _2071 = -_2055;
    float _2073 = _2071 + 1.0;
    float _2075 = _2005 * _2023;
    bool _2077 = _1903 != 1;
    float _2079 = in.m_63.w;
    float _2081 = _2055 * _2069;
    float _2083 = _2017 * _2073;
    float _2085 = _806 * _2059;
    float _2087 = -_806;
    float _2089 = _2087 + 1.0;
    float _2091 = in.m_65.w;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2095 = _1977 ? 0 : 1;
    float _2097 = _818 * _2089;
    float _2099 = -_818;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1907 != 2;
    float _2105 = fma(_1753, _772, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2107 = _1945 * _2097;
    bool _2109 = !_1911;
    int _2111 = _2109 ? 0 : 1;
    float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2115 = ~_2095;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2107);
    int _2123 = _2119;
    float _2125 = _2089;
    if (!_1967)
    {
        int _2127 = ~_2095;
        int _2129 = _2127 + 1;
        _2123 = _2129;
    }
    int _2131 = _2123;
    float _2133 = fma(_1905, _2085, _2121);
    int _2135 = as_type<int>(_1623) & 3;
    bool _2137 = _2135 != 0;
    float _2139 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2143 = fma(_2025, _2083, _2133);
    float _2145 = _1625 + _2079;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2149 = _1663 + _2147;
    float _2151 = fma(_2139, _1459, -0.5);
    if (_2103)
    {
        _1723 = _756;
    }
    float _2153 = _1723;
    float _2155 = _1639 + _2091;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2159 = _2145 + _2157;
    float _2161 = _2149 * _2149;
    float _2163 = _2153;
    if (!_2103)
    {
        _2163 = _1283;
    }
    float _2165 = _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2169 = _2155 + _2167;
    int _2171 = abs(_2111);
    float _2173 = fma(_2159, _2159, _2161);
    float _2175 = float(_2131);
    float _2177 = _2165 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2179 = float(_2171);
    float _2181 = fma(_2169, _2169, _2173);
    bool _2183 = !_2137;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = -_2141;
    float _2189 = fma(_2177, 2.0, _2187);
    bool _2191 = _1429 != 3;
    float _2193 = sqrt(_2181);
    float _2195 = _2179 * _2175;
    int _2197 = _1397 >> 31;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2201 = _1561 + _2199;
    bool _2203 = !_2191;
    int _2205 = _2203 ? 0 : (-1);
    float _2207 = _784 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _2209 = _1653 != 3;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2213 = _2197 & 3;
    float _2215 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2217 = as_type<int>(_1623) >> 31;
    float _2219 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2211);
    int _2221 = _1397 + _2213;
    float _2223 = fma(_2215, _1617, -0.5);
    int _2225 = _2217 & 3;
    float _2227 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2219);
    int _2229 = _2221 >> 2;
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2233 = as_type<int>(_1623) + _2225;
    float _2235 = rsqrt(_2181);
    int _2237 = _2229 << 4;
    int _2239 = _2237 + 368;
    float _2241 = fma(_2039, _2081, _2143);
    int _2243 = _2233 >> 2;
    float _2245 = -_166;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2189);
    float _2249 = as_type<float>(_2233);
    if (!_2077)
    {
        _2249 = _979;
    }
    float _2251 = _2249;
    float _2253 = fma(_2105, _2065, _2241);
    int _2255 = _2239 + 8;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    uint _2259 = uint(int(uint(int(_2257)) >> uint(2)));
    int _2261 = int(_2257) & 3;
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[int(_2259)][_2261];
    int _2265 = int(_2257) + 1;
    uint _2267 = uint(int(uint(_2265) >> uint(2)));
    int _2269 = _2265 & 3;
    float _2271 = (*spvDescriptorSet0.vp_c9)._m0[int(_2267)][_2269];
    float _2273 = precise::min(_2207, _2231);
    int _2275 = _2243 << 4;
    int _2277 = _2275 + 512;
    float _2279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2281 = _2251;
    if (!_2077)
    {
        _2125 = _2251;
    }
    float _2283 = _2125;
    out.m_79.w = _2273;
    bool _2285 = !_2209;
    int _2287 = _2285 ? 0 : (-1);
    uint _2289 = uint(int(uint(_2239) >> uint(2)));
    uint _2291 = uint(int(uint(int(_2289)) >> uint(2)));
    int _2293 = int(_2289) & 3;
    float _2295 = (*spvDescriptorSet0.vp_c9)._m0[int(_2291)][_2293];
    int _2297 = int(_2289) + 1;
    uint _2299 = uint(int(uint(_2297) >> uint(2)));
    int _2301 = _2297 & 3;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[int(_2299)][_2301];
    float _2305 = _2283;
    if (_2077)
    {
        _2281 = _756;
    }
    float _2307 = _2281;
    float _2309 = _2235 * _2273;
    bool _2311 = _2227 >= 0.0;
    float _2313 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2279);
    if (!_2077)
    {
        _1725 = _1283;
    }
    float _2315 = _1725;
    uint _2317 = uint(int(uint(_2277) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    float _2333 = _2315;
    if (_2077)
    {
        _2333 = _979;
    }
    float _2335 = _2333;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2339 = _2159 * _2309;
    float _2341 = _2149 * _2309;
    if (_2077)
    {
        _2305 = _756;
    }
    float _2343 = _2305;
    float _2345 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _2347 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2337);
    float _2349 = -_2339;
    float _2351 = _2159 + _2349;
    int _2353 = _2277 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    float _2371 = -_2341;
    float _2373 = _2149 + _2371;
    float _2375 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2347);
    float _2377 = _2351 * _2351;
    float _2379 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2381 = fma(_2375, _2223, _2247);
    float _2383 = fma(_2373, _2373, _2377);
    float _2385 = _2169 * _2309;
    float _2387 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2389 = abs(_1471);
    float _2391 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2345);
    int _2393 = abs(_1785);
    float _2395 = -_2387;
    float _2397 = fma(_2379, 2.0, _2395);
    bool _2399 = !_1431;
    int _2401 = _2399 ? 0 : 1;
    float _2403 = -_2385;
    float _2405 = _2169 + _2403;
    if (_2311)
    {
        out.m_53.x = 0.0;
    }
    int _2407 = ~_2389;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    float _2413 = fma(_2405, _2405, _2383);
    int _2415 = abs(_2401);
    float _2417 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2419 = int(_2417);
    int _2421 = ~_2393;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    int _2427 = abs(_2185);
    int _2429 = abs(_1505);
    int _2431 = ~_1835;
    int _2433 = _2431 + _1949;
    int _2435 = _2433 + 1;
    int _2437 = ~_2415;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2411 * as_type<int>(_2303);
    int _2445 = abs(_1733);
    int _2447 = _854 * _2435;
    int _2449 = _2447 + _1271;
    int _2451 = ~_2427;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2441 * as_type<int>(_2295);
    int _2459 = _2457 + _2443;
    float _2461 = fma(_2201, _2201, _2161);
    int _2463 = _2425 * as_type<int>(_2331);
    int _2465 = abs(_2205);
    float _2467 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2469 = int(_2467);
    int _2471 = ~_2429;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = _2455 * as_type<int>(_2323);
    int _2479 = _2477 + _2463;
    int _2481 = ~_2445;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    float _2487 = fma(_2169, _2169, _2461);
    int _2489 = _2475 * as_type<int>(_2263);
    int _2491 = _2489 + _2459;
    int _2493 = abs(_1707);
    int _2495 = _2485 * as_type<int>(_2361);
    int _2497 = _2495 + _2479;
    int _2499 = ~_2465;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    float _2505 = rsqrt(_2487);
    int _2507 = abs(_2287);
    int _2509 = abs(_1831);
    int _2511 = _2503 * as_type<int>(_2271);
    int _2513 = _2511 + _2491;
    int _2515 = ~_2507;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    float _2521 = float(uint(_2419));
    int _2523 = ~_2493;
    int _2525 = _2523 + 1;
    int _2527 = _2525 + 1;
    int _2529 = _2519 * as_type<int>(_2369);
    int _2531 = _2529 + _2497;
    float _2533 = 1.0 / _2521;
    int _2535 = abs(_2419);
    int _2537 = _2513 * _2527;
    float _2539 = float(uint(_2469));
    float _2541 = in.m_81.x;
    float _2543 = in.m_81.y;
    float _2545 = in.m_81.z;
    float _2547 = float(uint(_2535));
    int _2549 = _2063 * _2493;
    int _2551 = _2549 + _2537;
    int _2553 = abs(_2469);
    float _2555 = 1.0 / _2539;
    bool _2557 = _854 == 0;
    int _2559 = ~_2509;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    if (!_2077)
    {
        _899 = _1283;
    }
    float _2565 = _899;
    float _2567 = _2565;
    if (_2077)
    {
        _2567 = _979;
    }
    float _2569 = _2567;
    float _2571 = 1.0 / _2547;
    float _2573 = float(uint(_2553));
    int _2575 = _2563 * _2531;
    bool _2577 = !_2557;
    int _2579 = _2577 ? _2449 : (-1);
    int _2581 = as_type<int>(_2533) + (-2);
    float _2583 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2585 = float(uint(_2551));
    float _2587 = 1.0 / _2573;
    float _2589 = _2195 * (-2.0);
    int _2591 = _2579 * _2509;
    int _2593 = _2591 + _2575;
    int _2595 = as_type<int>(_2555) + (-2);
    float _2597 = as_type<float>(_2581) * _2585;
    float _2599 = fma(_1787, _2589, _1787);
    float _2601 = fma(_2589, _2541, _2541);
    float _2603 = float(uint(_2593));
    float _2605 = trunc(_2597);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    int _2611 = abs(_2551);
    int _2613 = as_type<int>(_2571) + (-2);
    float _2615 = as_type<float>(_2595) * _2603;
    int _2617 = ~_2419;
    int _2619 = _2617 + 1;
    float _2621 = sqrt(_2413);
    float _2623 = float(uint(_2611));
    int _2625 = abs(_2593);
    float _2627 = float(uint(_2625));
    float _2629 = trunc(_2615);
    float _2631 = precise::max(_2629, 0.0);
    uint _2633 = uint(_2631);
    float _2635 = as_type<float>(_2613) * _2623;
    int _2637 = as_type<int>(_2587) + (-2);
    int _2639 = _2619 * int(_2609);
    int _2641 = _2639 + _2551;
    int _2643 = ~_2469;
    int _2645 = _2643 + 1;
    float _2647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2649 = ~_2535;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_2637) * _2627;
    float _2655 = trunc(_2635);
    float _2657 = precise::max(_2655, 0.0);
    uint _2659 = uint(_2657);
    float _2661 = _2587;
    float _2663 = as_type<float>(_2581);
    if (_2311)
    {
        _2661 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2665 = _2661;
    float _2667 = fma(_2583, -2.0, _2647);
    float _2669 = float(uint(_2641));
    float _2671 = _2235 * _2621;
    int _2673 = as_type<int>(_2665);
    if (_2311)
    {
        float _2675 = _2665 * 5.0;
        _2673 = as_type<int>(_2675);
    }
    int _2677 = _2673;
    int _2679 = ~_2469;
    int _2681 = _2679 + 1;
    float _2683 = trunc(_2653);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    int _2689 = _2645 * int(_2633);
    int _2691 = _2689 + _2593;
    float _2693 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2667);
    if (_2311)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8730 = as_type<float>(_2677);
        out.gl_Position.z = _8730;
    }
    int _2695 = _2651 * int(_2659);
    int _2697 = _2695 + _2611;
    float _2699 = fma(_1779, _2075, _2253);
    int _2701 = ~_2553;
    int _2703 = _2701 + 1;
    float _2705 = as_type<float>(_2581) * _2669;
    float _2707 = float(uint(_2691));
    float _2709 = fma(_1809, _2019, _2699);
    float _2711 = float(uint(_2697));
    float _2713 = _2709;
    if (_2103)
    {
        _2663 = _979;
    }
    float _2715 = _2663;
    float _2717 = as_type<float>(_2595) * _2707;
    float _2719 = as_type<float>(_2613) * _2711;
    float _2721 = _2715;
    if (!_2103)
    {
        _2721 = _756;
    }
    float _2723 = _2721;
    float _2725 = _784 * _2671;
    int _2727 = _2703 * int(_2687);
    int _2729 = _2727 + _2625;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2733 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2735 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2737 = float(uint(_2729));
    float _2739 = trunc(_2717);
    float _2741 = precise::max(_2739, 0.0);
    uint _2743 = uint(_2741);
    float _2745 = fma(_2733, -2.0, _2731);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2749 = _2735 * _2505;
    float _2751 = as_type<float>(_2637) * _2737;
    float _2753 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2745);
    float _2755 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2747);
    float _2757 = _2201 * _2749;
    float _2759 = trunc(_2705);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    float _2765 = _2149 * _2749;
    float _2767 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2709);
    float _2769 = -_2757;
    float _2771 = _2201 + _2769;
    float _2773 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2755);
    int _2775 = ~_2553;
    int _2777 = _2775 + 1;
    float _2779 = -_2765;
    float _2781 = _2149 + _2779;
    float _2783 = _2771 * _2771;
    float _2785 = trunc(_2751);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    float _2791 = -_2753;
    float _2793 = fma(_2773, _2151, _2791);
    int _2795 = ~_2419;
    int _2797 = _2795 + 1;
    float _2799 = fma(_2781, _2781, _2783);
    int _2801 = int(_2633) + int(_2743);
    out.m_83.x = _2767;
    float _2803 = _2169 * _2749;
    float _2805 = trunc(_2719);
    float _2807 = precise::max(_2805, 0.0);
    uint _2809 = uint(_2807);
    int _2811 = int(_2609) + int(_2763);
    int _2813 = ~_2535;
    int _2815 = _2813 + 1;
    int _2817 = _2797 * _2811;
    int _2819 = _2817 + _2551;
    int _2821 = int(_2687) + int(_2789);
    bool _2823 = uint(_2819) >= uint(_2419);
    int _2825 = _2777 * _2821;
    int _2827 = _2825 + _2625;
    bool _2829 = !_2823;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = int(_2659) + int(_2809);
    float _2835 = -_2803;
    float _2837 = _2169 + _2835;
    int _2839 = _2681 * _2801;
    int _2841 = _2839 + _2593;
    bool _2843 = uint(_2827) >= uint(_2553);
    int _2845 = _2815 * _2833;
    int _2847 = _2845 + _2611;
    float _2849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2851 = uint(_2841) >= uint(_2469);
    float _2853 = fma(_2837, _2837, _2799);
    int _2855 = ~_2811;
    int _2857 = _2855 + _2831;
    int _2859 = _2857 + 1;
    bool _2861 = uint(_2847) >= uint(_2535);
    bool _2863 = !_2851;
    int _2865 = _2863 ? 0 : (-1);
    int _2867 = _2419 * _2859;
    int _2869 = _2867 + _2551;
    bool _2871 = _2419 == 0;
    float _2873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2875 = ~_2801;
    int _2877 = _2875 + _2865;
    int _2879 = _2877 + 1;
    bool _2881 = !_2861;
    int _2883 = _2881 ? 0 : (-1);
    bool _2885 = _2419 == 0;
    int _2887 = _2469 * _2879;
    int _2889 = _2887 + _2593;
    int _2891 = _2551 ^ _2419;
    bool _2893 = !_2871;
    int _2895 = _2893 ? _2869 : (-1);
    bool _2897 = !_2843;
    int _2899 = _2897 ? 0 : (-1);
    float _2901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2903 = _2469 == 0;
    bool _2905 = _2469 == 0;
    float _2907 = _2873 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2909 = _2593 ^ _2469;
    float _2911 = _2849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2913 = float(_2895);
    float _2915 = fma(_2907, _1407, -0.5);
    float _2917 = fma(_2911, _1369, -0.5);
    uint _2919 = uint(int(uint(_2891) >> uint(31)));
    float _2921 = fma(_2911, _2913, _1669);
    uint _2923 = uint(int(uint(_2909) >> uint(31)));
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2927 = ~_2883;
    int _2929 = _2833 + _2927;
    int _2931 = _2929 + 1;
    int _2933 = ~int(_2919);
    int _2935 = _2933 + 1;
    float _2937 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2925);
    int _2939 = ~_2899;
    int _2941 = _2821 + _2939;
    int _2943 = _2941 + 1;
    float _2945 = -_166;
    float _2947 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2397);
    int _2949 = ~int(_2923);
    int _2951 = _2949 + 1;
    float _2953 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2937);
    bool _2955 = !_2903;
    int _2957 = _2955 ? _2889 : (-1);
    float _2959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2961 = _2931 ^ _2935;
    int _2963 = _2943 ^ _2951;
    float _2965 = float(_2957);
    int _2967 = ~_2935;
    int _2969 = _2967 + _2961;
    int _2971 = _2969 + 1;
    int _2973 = ~_2951;
    int _2975 = _2973 + _2963;
    int _2977 = _2975 + 1;
    float _2979 = fma(_2953, _2917, _2921);
    float _2981 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2983 = fma(_2907, _2965, _2947);
    bool _2985 = !_2885;
    int _2987 = _2985 ? _2971 : (-1);
    float _2989 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2991 = log2(_2989);
    float _2993 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1619);
    float _2995 = float(_2987);
    float _2997 = fma(_1411, _2981, -0.5);
    bool _2999 = !_2905;
    int _3001 = _2999 ? _2977 : (-1);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3005 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3007 = -_2993;
    float _3009 = fma(_2981, _2995, _3007);
    float _3011 = sqrt(_2853);
    float _3013 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3003);
    float _3015 = float(_3001);
    float _3017 = fma(_1435, _3005, -0.5);
    float _3019 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2313);
    float _3021 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3013);
    bool _3023 = !_1915;
    int _3025 = _3023 ? 0 : 1;
    float _3027 = _2991 * _166;
    float _3029 = -_2693;
    float _3031 = fma(_3005, _3015, _3029);
    float _3033 = fma(_3021, _2997, _3009);
    float _3035 = fma(_3019, _2915, _2983);
    float _3037 = _2793 + 0.5;
    float _3039 = fma(_2391, _3017, _3031);
    float _3041 = _3033 + 0.5;
    float _3043 = exp2(_3027);
    float _3045 = _2505 * _3011;
    float _3047 = _3035 + 0.5;
    bool _3049 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3051 = isnan(1.0);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3057 = _3053 || _3055;
    float _3059 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3061 = 1.0 + _3059;
    float _3063 = _2381 + 0.5;
    float _3065 = _2979 + 0.5;
    float _3067 = _3039 + 0.5;
    float _3069 = _2725 * _3045;
    bool _3071 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3073 = isnan(0.0);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3079 = _3075 || _3077;
    float _3081 = 1.0 / _3061;
    int _3083 = abs(_3025);
    out.m_85.x = _3063;
    out.m_85.y = _3037;
    float _3085 = _756 + (-0.5);
    float _3087 = -_3043;
    float _3089 = _3087 + 1.0;
    out.m_87.x = _3065;
    out.m_87.y = _3041;
    out.m_87.z = _3047;
    out.m_87.w = _3067;
    out.m_89.x = _3069;
    float _3091 = _3079 ? _3089 : 0.0;
    bool _3093 = !_1919;
    int _3095 = _3093 ? 0 : 1;
    float _3097 = _3091;
    float _3099 = _2783;
    float _3101 = _2757;
    if (_2311)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3103 = -_2757;
    float _3105 = _1561 + _3103;
    float _3107 = float(_1855);
    float _3109 = -_2765;
    float _3111 = _1663 + _3109;
    float _3113 = float(_3083);
    float _3115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3117 = _3105 + _3115;
    float _3119 = fma(_3085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2601);
    float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3123 = _3111 + _3121;
    float _3125 = _979 + (-0.5);
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3129 = _3113 * _3107;
    int _3131 = abs(_3095);
    if (_3057)
    {
        float _3133 = _3091 * _3081;
        _168 = _3133;
    }
    float _3135 = _168;
    float _3137 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3127);
    float _3139 = _3129 * (-2.0);
    float _3141 = float(_1961);
    float _3143 = -_2803;
    float _3145 = _2155 + _3143;
    float _3147 = float(_3131);
    float _3149 = fma(_3139, _2543, _2543);
    float _3151 = fma(_1825, _3139, _1825);
    float _3153 = _756 + _1283;
    float _3155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3157 = _3145 + _3155;
    float _3159 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3149);
    float _3161 = _3147 * _3141;
    float _3163 = _3153 + (-1.0);
    float _3165 = fma(_3151, _3135, _3159);
    float _3167 = _3161 * (-2.0);
    float _3169 = fma(_3157, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3137);
    float _3171 = fma(_3163, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3173 = _1283 + (-0.5);
    float _3175 = fma(_3167, _2545, _2545);
    float _3177 = fma(_2599, _3135, _3119);
    bool _3179 = _3169 >= 0.0;
    float _3181 = fma(_3171, _3167, _3171);
    float _3183 = fma(_3173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3175);
    float _3185 = _3177 * 0.15915493667125701904296875;
    float _3187 = _3165 * 0.15915493667125701904296875;
    float _3189 = fma(_3181, _3135, _3183);
    float _3191 = _3185 * 6.283185482025146484375;
    float _3193 = sin(_3191);
    float _3195 = _3189 * 0.15915493667125701904296875;
    float _3197 = _3165;
    if (_3179)
    {
        _3197 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3199 = _3197;
    int _3201 = as_type<int>(_3199);
    if (_3179)
    {
        out.m_53.x = 0.0;
    }
    float _3203 = _3185 * 6.283185482025146484375;
    float _3205 = cos(_3203);
    if (_3179)
    {
        float _3207 = _3199 * 5.0;
        _3201 = as_type<int>(_3207);
    }
    int _3209 = _3201;
    float _3211 = _3187 * 6.283185482025146484375;
    float _3213 = sin(_3211);
    if (_3179)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9530 = as_type<float>(_3209);
        out.gl_Position.z = _9530;
    }
    float _3215 = _3187 * 6.283185482025146484375;
    float _3217 = cos(_3215);
    float _3219 = _3195 * 6.283185482025146484375;
    float _3221 = sin(_3219);
    if (_3179)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3223 = in.m_91.x;
    float _3225 = in.m_91.y;
    float _3227 = in.m_91.z;
    float _3229 = _3195 * 6.283185482025146484375;
    float _3231 = cos(_3229);
    float _3233 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3235 = _2671 * _3045;
    float _3237 = _3193 * _3213;
    float _3239 = _3205 * _3217;
    float _3241 = _3205 * _3213;
    float _3243 = _3233 * _3235;
    float _3245 = _3193 * _3217;
    float _3247 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3249 = fma(_3221, _3239, _3237);
    float _3251 = fma(_3221, _3237, _3239);
    float _3253 = -_3241;
    float _3255 = fma(_3221, _3245, _3253);
    float _3257 = _3247 * _3235;
    float _3259 = _3205 * _3231;
    float _3261 = _3217 * _3231;
    float _3263 = _3193 * _3231;
    float _3265 = _3213 * _3231;
    float _3267 = -_3245;
    float _3269 = fma(_3221, _3241, _3267);
    float _3271 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3273 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3225);
    float _3277 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3227);
    float _3279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3223);
    float _3281 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3273);
    float _3283 = _3243 * _3275;
    float _3285 = _3257 * _3277;
    float _3287 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3289 = _3069 * _3279;
    float _3291 = _3259 * _3283;
    float _3293 = -_3283;
    float _3295 = _3221 * _3293;
    float _3297 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3287);
    float _3299 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3271);
    float _3301 = fma(_3249, _3289, _3291);
    float _3303 = fma(_3261, _3289, _3295);
    float _3305 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3307 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3309 = _3263 * _3283;
    float _3311 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3313 = fma(_3269, _3285, _3301);
    float _3315 = fma(_3265, _3285, _3303);
    float _3317 = fma(_3255, _3289, _3309);
    float _3319 = -_3221;
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3311);
    float _3323 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3325 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3327 = fma(_3251, _3285, _3317);
    float _3329 = -_3221;
    float _3331 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3307);
    float _3333 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3323);
    float _3335 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3325);
    float _3337 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3281);
    float _3339 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3297);
    float _3341 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3333);
    float _3343 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3299);
    float _3345 = -_3221;
    float _3347 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3305);
    float _3349 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3335);
    float _3353 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3355 = in.m_93.x;
    float _3357 = in.m_93.y;
    float _3359 = in.m_93.z;
    float _3361 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    bool _3363 = _3225 != 0.0;
    bool _3365 = isnan(_3225);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = _3351 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3375 = _2155 + _3353;
    float _3377 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3379 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3381 = _3223 == 0.0;
    bool _3383 = !_3371;
    bool _3385 = _3381 && _3383;
    float _3387 = _1663 + _3373;
    float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3391 = _3375 + _3389;
    float _3393 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3347);
    bool _3395 = _3227 == 0.0;
    bool _3397 = _3395 && _3385;
    float _3399 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3377);
    float _3401 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3379);
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3405 = _3387 + _3403;
    float _3407 = _3391 * _3391;
    float _3409 = in.m_95.x;
    float _3411 = in.m_95.y;
    float _3413 = in.m_95.z;
    float _3415 = in.m_95.w;
    float _3417 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3331);
    float _3419 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3321);
    float _3421 = fma(_3405, _3405, _3407);
    float _3423 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3361);
    float _3425 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3427 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3401);
    float _3429 = sqrt(_3421);
    float _3431 = _3321;
    float _3433 = _3263;
    float _3435 = _3343;
    if (_3397)
    {
        _2713 = _3355;
    }
    float _3437 = _2713;
    float _3439 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3425);
    float _3441 = _3437;
    if (_3397)
    {
        _3097 = _3357;
    }
    float _3443 = _3097;
    float _3445 = _3443;
    if (_3397)
    {
        _3099 = _3359;
    }
    float _3447 = _3099;
    float _3449 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3439);
    float _3451 = _3447;
    if (_3397)
    {
        _1727 = _3437;
    }
    float _3453 = _1727;
    float _3455 = _3453;
    if (_3397)
    {
        _3431 = _3443;
    }
    float _3457 = _3431;
    float _3459 = _3457;
    if (_3397)
    {
        _3433 = _3447;
    }
    float _3461 = _3433;
    float _3463 = _3461;
    if (!_3397)
    {
        _3441 = _3355;
    }
    float _3465 = _3441;
    if (!_3397)
    {
        _3445 = _3357;
    }
    float _3467 = _3445;
    float _3469 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3399);
    if (!_3397)
    {
        _3451 = _3359;
    }
    float _3471 = _3451;
    if (!_3397)
    {
        float _3473 = fma(_3223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3465);
        _3455 = _3473;
    }
    float _3475 = _3455;
    float _3477 = _3393 * _3411;
    if (!_3397)
    {
        float _3479 = fma(_3225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3467);
        _3459 = _3479;
    }
    float _3481 = _3459;
    float _3483 = _3413 * _3465;
    float _3485 = _3483;
    if (!_3397)
    {
        float _3487 = fma(_3227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3471);
        _3463 = _3487;
    }
    float _3489 = _3463;
    bool _3491 = _3429 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = _3417 * _3411;
    float _3495 = fma(_3343, _3409, _3477);
    float _3497 = _3409 * _3467;
    float _3499 = _3419 * _3411;
    float _3501 = fma(_3337, _3409, _3493);
    float _3503 = _3449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3505 = -_3483;
    float _3507 = fma(_3409, _3471, _3505);
    float _3509 = -_3497;
    float _3511 = fma(_3411, _3465, _3509);
    float _3513 = fma(_3339, _3409, _3499);
    float _3515 = _1561 + _3503;
    float _3517 = _3411 * _3471;
    float _3519 = _3503;
    float _3521 = _3497;
    if (!_3491)
    {
        _3519 = _3387;
    }
    float _3523 = _3519;
    float _3525 = _3523;
    if (!_3491)
    {
        _3521 = _3375;
    }
    float _3527 = _3521;
    float _3529 = _3527;
    if (!_3491)
    {
        _3485 = _3515;
    }
    float _3531 = _3485;
    bool _3533 = !_3491;
    float _3535 = _3531;
    if (!_3533)
    {
        float _3537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3541 = _3429 + _3539;
        float _3543 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3545 = rsqrt(_3421);
        float _3547 = _3541 * _3537;
        float _3549 = _3547 * 0.15915493667125701904296875;
        float _3551 = _3549 * 6.283185482025146484375;
        float _3553 = cos(_3551);
        float _3555 = _3549 * 6.283185482025146484375;
        float _3557 = sin(_3555);
        float _3559 = _3553 + (-1.0);
        float _3561 = _3559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3563 = fma(_3557, _3543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3565 = fma(_3515, _3553, _3561);
        float _3567 = _3545 * _3563;
        float _3569 = fma(_3405, _3567, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3571 = fma(_3391, _3567, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3535 = _3565;
        _3525 = _3569;
        _3529 = _3571;
    }
    float _3573 = _3535;
    float _3575 = _3525;
    float _3577 = _3529;
    float _3579 = -_2339;
    float _3581 = _3579 + _3573;
    float _3583 = -_2341;
    float _3585 = _3583 + _3575;
    float _3587 = -_3517;
    float _3589 = fma(_3413, _3467, _3587);
    float _3591 = _3419 * _3481;
    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3595 = _3581 + _3593;
    float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3599 = _3585 + _3597;
    float _3601 = _3589 * _3415;
    float _3603 = _3511 * _3415;
    float _3605 = _3595 * _3595;
    float _3607 = _3507 * _3415;
    float _3609 = _3417 * _3481;
    float _3611 = fma(_3423, _3413, _3495);
    float _3613 = fma(_3599, _3599, _3605);
    float _3615 = -_2385;
    float _3617 = _3615 + _3577;
    float _3619 = _3393 * _3481;
    float _3621 = _3607 * _3393;
    float _3623 = _3607 * _3417;
    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3627 = _3617 + _3625;
    float _3629 = _3607 * _3419;
    float _3631 = fma(_3343, _3475, _3619);
    float _3633 = fma(_3337, _3475, _3609);
    float _3635 = fma(_3627, _3627, _3613);
    float _3637 = fma(_3339, _3475, _3591);
    float _3639 = fma(_3601, _3343, _3621);
    float _3641 = fma(_3601, _3337, _3623);
    float _3643 = fma(_3601, _3339, _3629);
    float _3645 = fma(_3469, _3413, _3501);
    float _3647 = sqrt(_3635);
    float _3649 = fma(_3469, _3489, _3633);
    float _3651 = fma(_3427, _3413, _3513);
    float _3653 = fma(_3423, _3489, _3631);
    float _3655 = fma(_3603, _3423, _3639);
    float _3657 = fma(_3603, _3469, _3641);
    float _3659 = fma(_3603, _3427, _3643);
    float _3661 = fma(_3427, _3489, _3637);
    out.m_97.x = _3611;
    out.m_97.y = _3645;
    out.m_97.z = _3651;
    float _3663 = -_2341;
    float _3665 = _1663 + _3663;
    float _3667 = -_2339;
    float _3669 = _3667 + _1561;
    out.m_99.x = _3655;
    out.m_99.y = _3657;
    out.m_99.z = _3659;
    float _3671 = -_2385;
    float _3673 = _2155 + _3671;
    out.m_101.x = _3653;
    out.m_101.y = _3649;
    out.m_101.z = _3661;
    bool _3675 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3677 = isnan(_3647);
    bool _3679 = _3675 || _3677;
    bool _3681 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3683 = _3679 || _3681;
    if (!_3683)
    {
        _3435 = 1.0;
    }
    float _3685 = _3435;
    bool _3687 = !_3683;
    float _3689 = _3685;
    if (!_3687)
    {
        bool _3691 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3693 = isnan(_3647);
        bool _3695 = _3691 || _3693;
        bool _3697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3699 = _3695 || _3697;
        if (!_3699)
        {
            float _3701 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3703 = _3647 + _3701;
            float _3705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3707 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3705;
            float _3709 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3713 = 1.0 / _3707;
            float _3715 = _3703 * _3713;
            float _3717 = fma(_3715, _3711, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3689 = _3717;
            _3719 = true;
        }
        else
        {
            bool _3721 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3723 = isnan(_3647);
            bool _3725 = _3721 || _3723;
            bool _3727 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3729 = _3725 || _3727;
            if (!_3729)
            {
                float _3731 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3733 = _3647 + _3731;
                float _3735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3737 = _3735 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3739 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3741 = _3739 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3743 = 1.0 / _3737;
                float _3745 = _3733 * _3743;
                float _3747 = fma(_3745, _3741, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3689 = _3747;
                _3719 = true;
            }
            else
            {
                _3689 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3719 = false;
    float _3749 = _3689;
    float _3751 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3753 = _3585 + _3751;
    float _3755 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3757 = _3617 + _3755;
    float _3759 = fma(_3753, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3761 = fma(_3757, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3763 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3765 = _3759 + _3763;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3769 = _3761 + _3767;
    float _3771 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3773 = fma(_3769, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10506 = float2(_3771, _3773);
    float _3775 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10506, float2(0.0), isnan(_10506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10506, float2(0.0), isnan(_10506)), level(0.0)).x;
    float _3777 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3779 = _3581 + _3777;
    float _3781 = -_2765;
    float _3783 = _3781 + _3665;
    float _3785 = -_2803;
    float _3787 = _3785 + _3673;
    float _3789 = -_3665;
    float _3791 = _3789 + _3759;
    float _3793 = fma(_3779, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3795 = -_3673;
    float _3797 = _3795 + _3761;
    float _3799 = fma(_3775, 100.0, _3669);
    float _3801 = -_3669;
    float _3803 = _3801 + _3793;
    float _3805 = fma(_3775, 100.0, _3793);
    float _3807 = -_2757;
    float _3809 = _3807 + _3799;
    float _3811 = _3803 * _3803;
    float _3813 = _3809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3815 = fma(_3791, _3791, _3811);
    float _3817 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3813);
    float _3819 = fma(_3797, _3797, _3815);
    float _3821 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3817);
    float _3823 = sqrt(_3819);
    float _3825 = _3821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3827 = _3809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3829 = 1.0 / _3825;
    float _3831 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3827);
    float _3833 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3831);
    bool _3835 = _3823 > 0.0;
    float _3837 = _3833 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3839 = _3837 + _3825;
    bool _3841 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3843 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3845 = _3841 || _3843;
    bool _3847 = isnan(0.5);
    bool _3849 = _3845 || _3847;
    float _3851 = _3839 * _3829;
    float _3853 = _3851 * 0.5;
    bool _3855 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3857 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.5);
    bool _3863 = _3859 || _3861;
    float _3865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3867 = fma(_3853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3865);
    float _3869 = _3775;
    float _3871 = _3793;
    float _3873 = _3759;
    float _3875 = _3761;
    float _3877 = _3809;
    float _3879 = _3787;
    if (!_3835)
    {
        _3869 = _3761;
    }
    float _3881 = _3869;
    float _3883 = _3881;
    if (!_3835)
    {
        _3871 = _3805;
    }
    float _3885 = _3871;
    float _3887 = 1.0 / _3867;
    bool _3889 = !_3835;
    float _3891 = _3885;
    float _3893 = _3885;
    float _3895 = _3887;
    if (!_3889)
    {
        float _3897 = _232 * _232;
        float _3899 = rsqrt(_3819);
        float _3901 = fma(_230, _230, _3897);
        float _3903 = fma(_234, _234, _3901);
        float _3905 = sqrt(_3903);
        float _3907 = _3791 * _3899;
        float _3909 = _3803 * _3899;
        float _3911 = _3797 * _3899;
        bool _3913 = _3905 > 0.0;
        float _3915 = _3899;
        if (!_3913)
        {
            _3891 = _3805;
        }
        float _3917 = _3891;
        _3893 = _3917;
        if (!_3913)
        {
            _3915 = _3761;
        }
        float _3919 = _3915;
        bool _3921 = !_3913;
        _3883 = _3919;
        if (!_3921)
        {
            float _3923 = rsqrt(_3903);
            float _3925 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3927 = _232 * _3923;
            float _3929 = _230 * _3923;
            float _3931 = _3909 * _3927;
            float _3933 = _234 * _3923;
            float _3935 = fma(_3907, _3929, _3931);
            float _3937 = _3925 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3939 = fma(_3911, _3933, _3935);
            float _3941 = _3939 * _3937;
            float _3943 = fma(_230, _3941, _3759);
            float _3945 = fma(_232, _3941, _3805);
            float _3947 = fma(_234, _3941, _3761);
            _3893 = _3945;
            _3873 = _3943;
            _3883 = _3947;
        }
    }
    float _3949 = _3893;
    float _3951 = _3873;
    float _3953 = _3883;
    float _3955 = -_2757;
    float _3957 = _3955 + _3949;
    float _3959 = -_2765;
    float _3961 = _3959 + _3951;
    float _3963 = -_2803;
    float _3965 = _3963 + _3953;
    float _3967 = _3957;
    float _3969 = _3961;
    float _3971 = _3965;
    float _3973 = _3951;
    if (_3863)
    {
        _3101 = 1.0;
    }
    float _3975 = _3101;
    float _3977 = _3975;
    if (!_3849)
    {
        float _3979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3981 = _3809 + _3979;
        float _3983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3985 = _3783 + _3983;
        float _3987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3989 = -_3673;
        float _3991 = _3989 + _3953;
        float _3993 = _3981 * _3981;
        float _3995 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3997 = _3787 + _3995;
        float _3999 = -_3665;
        float _4001 = _3999 + _3951;
        float _4003 = -_3799;
        float _4005 = _4003 + _3949;
        float _4007 = fma(_3985, _3985, _3993);
        float _4009 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4011 = fma(_3997, _3997, _4007);
        float _4013 = sqrt(_4011);
        float _4015 = 1.0 / _3045;
        float _4017 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4019 = precise::min(_4013, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4021 = _4019 * _3987;
        float _4023 = _4021 * _4015;
        float _4025 = _4017 * _4023;
        float _4027 = _3991 * _4023;
        float _4029 = fma(_4001, _4025, _3783);
        float _4031 = fma(_4005, _4025, _3809);
        float _4033 = fma(_4017, _4027, _3787);
        _3967 = _4031;
        _3969 = _4029;
        _3971 = _4033;
        _3973 = _4001;
    }
    float _4035 = _3967;
    float _4037 = _3969;
    float _4039 = _3971;
    float _4041 = _3973;
    float _4043 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4045 = _3887 * _4043;
    float _4047 = _4041;
    if (!_3863)
    {
        float _4049 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4051 = _4049 * 0.15915493667125701904296875;
        float _4053 = _4051 * 6.283185482025146484375;
        float _4055 = cos(_4053);
        float _4057 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4059 = _4057 * 0.15915493667125701904296875;
        float _4061 = _4051 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        float _4065 = 1.0 / _4055;
        float _4067 = _4059 * 6.283185482025146484375;
        float _4069 = cos(_4067);
        float _4071 = _4063 * _4065;
        float _4073 = _4059 * 6.283185482025146484375;
        float _4075 = sin(_4073);
        float _4077 = _4069 * _4071;
        float _4079 = 1.0 / _4077;
        float _4081 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4083 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4081;
        float _4085 = 1.0 / _4083;
        float _4087 = _4075 * _4079;
        float _4089 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4091 = fma(_4045, _4087, _4089);
        float _4093 = _4091 * _4085;
        float _4095 = precise::clamp(_4093, 0.0, 1.0);
        _242 = _4059;
        _3977 = _4095;
    }
    float _4097 = _242;
    float _4099 = _3977;
    float _4101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4103 = _4035 + _4101;
    float _4105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4107 = _4037 + _4105;
    float _4109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4111 = _4039 + _4109;
    float _4113 = _4103 * _4103;
    float _4115 = fma(_4107, _4107, _4113);
    float _4117 = fma(_4111, _4111, _4115);
    float _4119 = rsqrt(_4117);
    float _4121 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4123 = _4107 * _4121;
    float _4125 = _4111 * _4121;
    float _4127 = _4123 * _4123;
    float _4129 = _4125 * _4125;
    float _4131 = _4127 + _4129;
    float _4133 = sqrt(_4131);
    bool _4135 = _4133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4139 = _4133 + _4137;
    float _4141 = _4111;
    float _4143 = _4097;
    float _4145 = _4139;
    float _4147 = _4103;
    if (_4135)
    {
        float _4149 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4141 = _4149;
    }
    float _4151 = _4141;
    if (_4135)
    {
        float _4153 = rsqrt(_4131);
        _4143 = _4153;
    }
    float _4155 = _4143;
    float _4157 = _4155;
    if (_4135)
    {
        float _4159 = _4139 * _4151;
        _4145 = _4159;
    }
    float _4161 = _4145;
    if (_4135)
    {
        float _4163 = _4161 * 0.15915493667125701904296875;
        _4047 = _4163;
    }
    float _4165 = _4047;
    float _4167 = _4151;
    if (_4135)
    {
        float _4169 = _4165 * 6.283185482025146484375;
        float _4171 = cos(_4169);
        _4167 = _4171;
    }
    float _4173 = _4167;
    float _4175 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4177 = precise::max(0.0, _4175);
    float _4179 = _4119;
    float _4181 = _4177;
    if (_4135)
    {
        float _4183 = _4165 * 6.283185482025146484375;
        float _4185 = sin(_4183);
        _4179 = _4185;
    }
    float _4187 = _4179;
    float _4189 = -_4121;
    float _4191 = -_4177;
    float _4193 = fma(_4103, _4189, _4191);
    float _4195 = _4193;
    if (_4135)
    {
        float _4197 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4181 = _4197;
    }
    float _4199 = _4181;
    float _4201 = _4199;
    if (_4135)
    {
        float _4203 = _4173 + (-1.0);
        _4147 = _4203;
    }
    float _4205 = _4147;
    float _4207 = _4205;
    float _4209 = _4187;
    if (_4135)
    {
        float _4211 = fma(_4187, _4199, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3895 = _4211;
    }
    float _4213 = _3895;
    if (_4135)
    {
        float _4215 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4201 = _4215;
    }
    float _4217 = _4201;
    if (!_4135)
    {
        _4207 = _4127;
    }
    float _4219 = _4207;
    float _4221 = _4219;
    if (_4135)
    {
        float _4223 = _4155 * _4213;
        _3875 = _4223;
    }
    float _4225 = _3875;
    if (!_4135)
    {
        _4157 = _4123;
    }
    float _4227 = _4157;
    float _4229 = _4227;
    if (_4135)
    {
        float _4231 = fma(_4193, _4173, _4217);
        _4195 = _4231;
    }
    float _4233 = _4195;
    float _4235 = sqrt(_4117);
    float _4237 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4135)
    {
        float _4239 = _4123 * _4225;
        _4229 = _4239;
    }
    float _4241 = _4229;
    if (!_4135)
    {
        _4209 = _4125;
    }
    float _4243 = _4209;
    float _4245 = _4243;
    if (_4135)
    {
        float _4247 = _4125 * _4225;
        _4245 = _4247;
    }
    float _4249 = _4245;
    float _4251 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4135)
    {
        float _4253 = _4241 * _4241;
        _4221 = _4253;
    }
    float _4255 = _4221;
    if (!_4135)
    {
        _4237 = _4129;
    }
    float _4257 = _4237;
    float _4259 = _4257;
    if (_4135)
    {
        float _4261 = _4249 * _4249;
        _4259 = _4261;
    }
    float _4263 = _4259;
    float _4265 = fma(_4233, _4233, _4255);
    float _4267 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4269 = floor(_4251);
    float _4271 = _4265 + _4263;
    float _4273 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4267);
    float _4275 = fma(_3787, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4279 = fma(_4235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4277);
    float _4281 = precise::clamp(_4279, 0.0, 1.0);
    float _4283 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4273);
    float _4285 = rsqrt(_4271);
    float _4287 = -_4281;
    float _4289 = _4287 + 1.0;
    float _4291 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4293 = _4283 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4295 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4297 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4291);
    float _4299 = _4293 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4301 = abs(_4289);
    float _4303 = log2(_4301);
    float _4305 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4297);
    float _4309 = -_4299;
    float _4311 = fma(_4309, _4295, 1.0);
    float _4313 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4315 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4317 = _4285 * _4241;
    float _4319 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4313);
    float _4321 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4315);
    float _4323 = _4285 * _4233;
    float _4325 = _4285 * _4249;
    float _4327 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4329 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4319);
    float _4331 = _4321 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4333 = floor(_4275);
    float _4335 = -_4327;
    float _4337 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4335);
    float _4339 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4341 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4343 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4345 = -_4325;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4337);
    float _4349 = _4307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4351 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4341);
    float _4353 = -_4269;
    float _4355 = _4251 + _4353;
    float _4357 = fma(_4347, -0.5, 0.5);
    float _4359 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4351);
    float _4361 = exp2(_4343);
    float _4363 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4365 = fma(_4347, 0.5, 0.5);
    float _4367 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4359);
    float _4369 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4371 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4363);
    float _4373 = -_4333;
    float _4375 = _4275 + _4373;
    float _4377 = _4323 + 1.0;
    float _4379 = log2(_4311);
    float _4381 = fma(_4365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4383 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4369);
    float _4385 = fma(_4365, _4381, -0.212114393711090087890625);
    float _4387 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4383);
    float _4389 = 1.0 / _4367;
    float _4391 = -_4323;
    float _4393 = fma(_4361, _4377, _4391);
    float _4395 = sqrt(_4357);
    float _4397 = _4379 * 0.693147182464599609375;
    float2 _11488 = float2(_4355, _4375);
    float _4399 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11488, float2(0.0), isnan(_11488)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11488, float2(0.0), isnan(_11488)), level(0.0)).x;
    float _4401 = fma(_4365, _4385, 1.570728778839111328125);
    float _4403 = _4397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4405 = fma(_4393, 0.5, 0.5);
    float _4407 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4371);
    float _4409 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4407);
    float _4411 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4387);
    float _4413 = _4395 * 0.636619746685028076171875;
    float _4415 = _4409 * _4389;
    float _4417 = _4411 * _4389;
    float _4419 = -_4401;
    float _4421 = fma(_4413, _4419, 1.0);
    float _4423 = fma(_4415, 0.5, 0.5);
    float _4425 = fma(_4417, -0.5, 0.5);
    float3 _11540 = float3(_4423, _4425, _4403);
    float _4427 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11540, float3(0.0), isnan(_11540)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11540, float3(0.0), isnan(_11540)), level(0.0)).x;
    float3 _11551 = float3(_4423, _4425, _4403);
    float4 _4430 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11551, float3(0.0), isnan(_11551)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11551, float3(0.0), isnan(_11551)), level(0.0)).xyzw;
    float _4432 = _4430.x;
    float _4434 = _4430.y;
    float _4436 = _4430.z;
    float _4438 = _4430.w;
    float2 _11567 = float2(_4421, _4405);
    float3 _4442 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11567, float2(0.0), isnan(_11567)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11567, float2(0.0), isnan(_11567)), level(0.0)).xyz;
    float _4444 = _4442.x;
    float _4446 = _4442.y;
    float _4448 = _4442.z;
    float _4450 = abs(_4045);
    float _4452 = log2(_4450);
    float _4454 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4456 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_103.x = _3783;
    out.m_103.y = _3809;
    out.m_103.z = _3787;
    float _4458 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4454);
    bool _4460 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4462 = isnan(_4235);
    bool _4464 = _4460 || _4462;
    bool _4466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4468 = _4464 || _4466;
    bool _4470 = _4045 <= 8000.0;
    bool _4472 = isnan(_4045);
    bool _4474 = _4470 || _4472;
    bool _4476 = isnan(8000.0);
    bool _4478 = _4474 || _4476;
    float _4480 = float(_4478);
    float _4482 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4458);
    float _4484 = exp2(_4456);
    out.m_105.x = _4037;
    out.m_105.y = _4035;
    out.m_105.z = _4039;
    float _4486 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4482);
    float _4488 = _4367 * 0.5;
    float _4490 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4492 = in.m_77.x;
    float _4494 = _4409 + _4367;
    float _4496 = _4409;
    if (!_4468)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4498 = _3877;
    out.gl_Position.x = _4409;
    out.gl_Position.y = _4411;
    out.gl_Position.z = _4486;
    out.gl_Position.w = _4367;
    float _4500 = exp2(_4490);
    float _4502 = _4494 * 0.5;
    float _4504 = _4498;
    float _4506 = _4498;
    if (!_4468)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4508 = _3879;
    float _4510 = -_4484;
    float _4512 = _4510 + 1.0;
    float _4514 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4516 = -_4514;
    float _4518 = _4516 + 1.0;
    float _4520 = _4518;
    float _4522 = _4514;
    float _4524 = _4508;
    float _4526 = _4508;
    if (!_4468)
    {
        _4496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4528 = _4496;
    float _4530 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4532 = precise::clamp(_4530, 0.0, 1.0);
    float _4534 = fma(_4411, -0.5, _4488);
    float _4536 = fma(_4532, -2.0, 3.0);
    float _4538 = _4532 * _4532;
    float _4540 = _4538 * _4536;
    float _4542 = -_4540;
    float _4544 = _4542 + 1.0;
    float _4546 = fma(_4544, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4540);
    float _4548 = _4486 + _4367;
    float _4550 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4552 = _4480 * _4546;
    float _4554 = _4548 * 0.5;
    float _4556 = _4552 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4502;
    out.m_107.y = _4534;
    out.m_107.z = _4554;
    out.m_107.w = _4367;
    float _4558 = -_4399;
    float _4560 = _4558 + 1.0;
    float _4562 = _4560 * _4556;
    float _4564 = precise::clamp(_4562, 0.0, 1.0);
    float _4566 = -_4564;
    float _4568 = fma(_4566, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4570 = _4568 * _4492;
    float _4572 = _4570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_109.x = _4572;
    float _4574 = _4514 * _4427;
    float _4576 = _4438 * _4518;
    float _4578 = _4528;
    float _4580 = _4528;
    if (!_4468)
    {
        _4520 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4582 = _4520;
    float _4584 = _4438 * _4574;
    float _4586 = _4448 * _4574;
    float _4588 = _4584;
    float _4590 = _4582;
    float _4592 = _4582;
    if (!_4468)
    {
        _4522 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4594 = _4522;
    float _4596 = fma(_4444, _4584, _4432);
    float _4598 = fma(_4446, _4584, _4434);
    float _4600 = fma(_4438, _4586, _4436);
    float _4602 = _4594;
    float _4604 = _4594;
    if (!_4468)
    {
        _4588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4606 = _4588;
    out.m_111.x = _4596;
    out.m_111.y = _4598;
    out.m_111.z = _4600;
    out.m_111.w = _4576;
    bool _4608 = !_4468;
    float _4610 = _4606;
    float _4612 = _4606;
    if (!_4608)
    {
        bool _4614 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4616 = isnan(_4235);
        bool _4618 = _4614 || _4616;
        bool _4620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4622 = _4618 || _4620;
        if (!_4622)
        {
            float _4624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4626 = _4235 + _4624;
            float _4628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4628;
            float _4632 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4634 = _4632 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4636 = 1.0 / _4630;
            float _4638 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4640 = _4638 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4644 = _4642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4648 = _4646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4652 = _4650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4654 = _4626 * _4636;
            float _4656 = precise::clamp(_4654, 0.0, 1.0);
            float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4660 = _4658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4662 = fma(_4656, _4634, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4664 = fma(_4656, _4660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4666 = fma(_4656, _4640, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4668 = fma(_4656, _4644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4670 = fma(_4656, _4648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4672 = fma(_4656, _4652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4580 = _4662;
            _4604 = _4670;
            _4506 = _4666;
            _4592 = _4668;
            _4526 = _4664;
            _4612 = _4672;
            _4674 = true;
        }
        else
        {
            bool _4676 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4678 = isnan(_4235);
            bool _4680 = _4676 || _4678;
            bool _4682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4684 = _4680 || _4682;
            if (!_4684)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4686 = _4504;
            _4506 = _4686;
            if (!_4684)
            {
                _4578 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4688 = _4578;
            _4580 = _4688;
            if (!_4684)
            {
                _4524 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4690 = _4524;
            _4526 = _4690;
            if (!_4684)
            {
                _4590 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4692 = _4590;
            _4592 = _4692;
            if (!_4684)
            {
                _4602 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4694 = _4602;
            _4604 = _4694;
            if (!_4684)
            {
                _4610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4696 = _4610;
            bool _4698 = !_4684;
            _4612 = _4696;
            if (!_4698)
            {
                bool _4700 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4702 = isnan(_4235);
                bool _4704 = _4700 || _4702;
                bool _4706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4708 = _4704 || _4706;
                if (!_4708)
                {
                    float _4710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4712 = _4235 + _4710;
                    float _4714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4714;
                    float _4718 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4720 = _4718 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4722 = 1.0 / _4716;
                    float _4724 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4726 = _4724 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4730 = _4728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4734 = _4732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4738 = _4736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4740 = _4712 * _4722;
                    float _4742 = precise::clamp(_4740, 0.0, 1.0);
                    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4748 = fma(_4742, _4720, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4750 = fma(_4742, _4746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4752 = fma(_4742, _4726, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4754 = fma(_4742, _4730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4756 = fma(_4742, _4734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4758 = fma(_4742, _4738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4580 = _4748;
                    _4604 = _4756;
                    _4506 = _4752;
                    _4592 = _4754;
                    _4526 = _4750;
                    _4612 = _4758;
                    _4674 = true;
                }
                else
                {
                    _4580 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4604 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4592 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4526 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4674 = false;
    float _4760 = _4580;
    float _4762 = _4604;
    float _4764 = _4506;
    float _4766 = _4592;
    float _4768 = _4526;
    float _4770 = _4612;
    float _4772 = fma(_3649, -0.5, 0.5);
    float _4774 = precise::clamp(_4772, 0.0, 1.0);
    float _4776 = -_4760;
    float _4778 = _4776 + _4762;
    float _4780 = _4550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4782 = -_4764;
    float _4784 = _4782 + _4766;
    float _4786 = fma(_4774, _4778, _4760);
    out.m_113.x = 0.0;
    float _4788 = -_4768;
    float _4790 = _4788 + _4770;
    float _4792 = fma(_4774, _4784, _4764);
    float _4794 = _4786 * 0.586610972881317138671875;
    out.m_53.x = _4780;
    bool _4796 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4798 = fma(_4774, _4790, _4768);
    float _4800 = fma(_4792, 0.298911988735198974609375, _4794);
    bool _4802 = _4099 > 0.0;
    bool _4804 = isnan(_4099);
    bool _4806 = _4802 || _4804;
    bool _4808 = isnan(0.0);
    bool _4810 = _4806 || _4808;
    float _4812 = fma(_4798, 0.114477999508380889892578125, _4800);
    float _4814 = -_4812;
    float _4816 = _4792 + _4814;
    float _4818 = -_4812;
    float _4820 = _4786 + _4818;
    float _4822 = -_4812;
    float _4824 = _4798 + _4822;
    float _4826 = fma(_4816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    float _4828 = fma(_4820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    float _4830 = fma(_4824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    bool _4832 = !_4796;
    if (!_4832)
    {
        float _4834 = -_4035;
        float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4838 = -_4037;
        float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4842 = -_4039;
        float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4846 = _4836 * _4836;
        float _4848 = fma(_4840, _4840, _4846);
        float _4850 = fma(_4844, _4844, _4848);
        float _4852 = sqrt(_4850);
        float _4854 = rsqrt(_4850);
        float _4856 = -_4852;
        float _4858 = _4856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4860 = _4858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4862 = precise::clamp(_4860, 0.0, 1.0);
        float _4864 = _4840 * _4854;
        float _4866 = _4836 * _4854;
        float _4868 = abs(_4862);
        float _4870 = log2(_4868);
        float _4872 = _4844 * _4854;
        float _4874 = _4864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4876 = _3649 * _4866;
        float _4878 = -_4866;
        float _4880 = -_4874;
        float _4882 = fma(_4878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4880);
        float _4884 = fma(_3653, _4864, _4876);
        float _4886 = -_4872;
        float _4888 = fma(_4886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4882);
        float _4890 = fma(_3661, _4872, _4884);
        float _4892 = precise::clamp(_4890, 0.0, 1.0);
        float _4894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4896 = _4888 + _4894;
        float _4898 = _4870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4900 = _4896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4902 = precise::clamp(_4900, 0.0, 1.0);
        float _4904 = exp2(_4898);
        float _4906 = _4904 * _4902;
        float _4908 = _4892 * _4906;
        float _4910 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4912 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4914 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4910;
        out.m_113.y = _4912;
        out.m_113.z = _4914;
    }
    out.m_79.x = _4826;
    out.m_79.y = _4828;
    out.m_79.z = _4830;
    if (_4810)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _4916 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4916;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4674 = false;
    bool _3719 = false;
    bool _742 = false;
    bool _638 = false;
    bool _496 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4973 = as_type<float>(_148);
        out.gl_Position.z = _4973;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5043 = as_type<float>(_186);
        out.gl_Position.z = _5043;
    }
    if (_178)
    {
        return out;
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _242 = _234;
    float _260;
    if (!_236)
    {
        float _244 = in.m_69.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_132);
        float _266 = 1.0 / _264;
        float _268 = _166 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    bool _292 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _294 = isnan(_270);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _270 + _304;
    float _308 = 1.0 / _286;
    float _310 = -_302;
    float _312 = _310 + 1.0;
    float _314 = 1.0 / _282;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _322 = 1.0 / _290;
    float _324 = _274 * _308;
    bool _326 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_270);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _336 * _312;
    float _340 = _278 * _314;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -_336;
    float _352 = _350 + 1.0;
    float _354 = fma(_348, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = _306 * _322;
    float _362 = fma(_318, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _364 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _366 = isnan(_270);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _382 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_270);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = _374 * _352;
    float _400 = -_374;
    float _402 = _400 + 1.0;
    float _404 = fma(_358, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_380, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = fma(_396, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = _392 * _402;
    float _412 = -_392;
    float _414 = _412 + 1.0;
    float _416 = in.m_71.x;
    float _418 = in.m_71.y;
    float _420 = in.m_71.z;
    float _422 = _354 * _410;
    float _424 = _376 * _410;
    float _426 = _362 * _410;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _428;
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _446 = fma(_430, _360, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_404, _398, _434);
    float _450 = fma(_438, _360, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _360, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_408, _398, _432);
    float _456 = fma(_406, _398, _444);
    float _458 = fma(_446, _338, _448);
    float _460 = fma(_450, _338, _454);
    float _462 = fma(_452, _338, _456);
    float _464 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].y, _458);
    float _466 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    float _470 = _464 * _418;
    float _472 = _466 * _416;
    float _474 = _468 * _420;
    bool _476 = !_320;
    float _494;
    if (!_476)
    {
        float _478 = in.m_69.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_132);
        float _500 = 1.0 / _498;
        float _502 = _166 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _504 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = isnan(_504);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _532 = isnan(_504);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    bool _546 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _548 = isnan(_504);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = 1.0 / _512;
    float _560 = -_524;
    float _562 = _560 + 1.0;
    bool _564 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _566 = _540 * _562;
    float _568 = -_540;
    float _570 = _568 + 1.0;
    float _572 = 1.0 / _528;
    float _574 = _544 * _558;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = fma(_574, _508, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -_556;
    float _584 = _582 + 1.0;
    float _586 = _580 * _566;
    float _588 = _578 * _572;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _504 + _590;
    float _594 = _524 * _584;
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = fma(_598, _594, _596);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _608 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _610;
    out.m_73.y = _612;
    out.m_73.z = _614;
    out.m_73.w = _616;
    bool _618 = !_564;
    float _636;
    if (!_618)
    {
        float _620 = in.m_69.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_132);
        float _642 = 1.0 / _640;
        float _644 = _166 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    bool _648 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _650 = isnan(_646);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _664 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _666 = isnan(_646);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _682 = _646 + _680;
    float _684 = -_658;
    float _686 = _684 + 1.0;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _690 = 1.0 / _662;
    float _692 = _674 * _686;
    float _694 = -_674;
    float _696 = _694 + 1.0;
    float _698 = _678 * _690;
    float _700 = fma(_698, _682, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _704 = _700 * _692;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[131].x, _704);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _712 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[132].x, _708);
    float _716 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _714 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _716;
    out.m_75.y = _712;
    out.m_75.z = _718;
    out.m_75.w = _720;
    bool _722 = !_688;
    float _740;
    if (!_722)
    {
        float _724 = in.m_69.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_132);
        float _746 = 1.0 / _744;
        float _748 = _166 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = in.m_69.x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _760 = _750 + _758;
    float _762 = float(_132);
    float _764 = in.m_77.y;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _768 = _766 != 0;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _772 = _750 + _770;
    float _774 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _776 = int(_774);
    float _778 = in.m_61.w;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _782 = _750 + _780;
    float _784 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _788 = int(_786);
    float _790 = float(_754);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _796 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _798 = isnan(_750);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    bool _808 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _810 = isnan(_750);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _790;
    float _822 = float(uint(_776));
    int _824 = ~_776;
    int _826 = _824 + 1;
    bool _828 = _776 == 0;
    float _830 = 1.0 / _822;
    int _832 = ~_776;
    int _834 = _832 + 1;
    float _836 = float(_788);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _840 = _820 * _166;
    float _842 = 1.0 / _836;
    int _844 = as_type<int>(_830) + (-2);
    float _846 = trunc(_840);
    int _848 = int(_846);
    float _850 = float(_776);
    float _852 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _854 = int(_852);
    float _856 = _842 * _166;
    float _858 = float(uint(_848));
    float _860 = trunc(_856);
    int _862 = int(_860);
    float _864 = as_type<float>(_844) * _858;
    float _866 = float(uint(_854));
    float _868 = 1.0 / _762;
    int _870 = ~_854;
    int _872 = _870 + 1;
    float _874 = trunc(_864);
    float _876 = precise::max(_874, 0.0);
    uint _879 = uint(_876);
    float _881 = 1.0 / _866;
    int _883 = _834 * int(_879);
    int _885 = _883 + _848;
    float _887 = 1.0 / _794;
    float _889 = float(uint(_885));
    int _891 = as_type<int>(_881) + (-2);
    float _893 = as_type<float>(_844) * _889;
    float _895 = _889;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _899 = as_type<float>(_854);
    if (_768)
    {
        _895 = 1.0;
    }
    float _901 = _895;
    float _903 = _901;
    if (!_768)
    {
        _903 = 7.345489978790283203125;
    }
    float _905 = _903;
    float _907 = trunc(_893);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    float _913 = _905 * _756;
    float _915 = floor(_913);
    int _917 = int(_879) + int(_911);
    float _919 = float(_848);
    float _921 = float(uint(_862));
    int _923 = _826 * _917;
    int _925 = _923 + _848;
    bool _927 = _919 >= _850;
    bool _929 = isnan(_919);
    bool _931 = _927 || _929;
    bool _933 = isnan(_850);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = -_915;
    float _941 = _913 + _939;
    float _943 = as_type<float>(_891) * _921;
    bool _945 = uint(_925) >= uint(_776);
    float _947 = trunc(_937);
    int _949 = int(_947);
    bool _951 = !_945;
    int _953 = _951 ? 0 : (-1);
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _965 = _963 != 0;
    int _967 = ~_917;
    int _969 = _967 + _953;
    int _971 = _969 + 1;
    float _973 = trunc(_943);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = in.m_69.y;
    float _981 = _850 * _166;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _985 = _983 != 0;
    int _987 = _776 * _971;
    int _989 = _987 + _848;
    float _991 = _981 * _868;
    int _993 = ~_949;
    int _995 = _993 + 1;
    int _997 = _995 + 1;
    bool _999 = !_828;
    float _1001 = _999 ? as_type<float>(_989) : as_type<float>(0xffffffffu /* nan */);
    float _1003 = _941 * _850;
    float _1005 = _941;
    float _1007 = _1001;
    if (_768)
    {
        _1005 = _756;
    }
    float _1009 = _1005;
    float _1011 = trunc(_991);
    int _1013 = int(_1011);
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>(_1001) * _997;
    float _1021 = _1009;
    if (_768)
    {
        _1007 = 1.0;
    }
    float _1023 = _1007;
    float _1025 = _1023;
    if (!_768)
    {
        _1025 = 1.2345600128173828125;
    }
    float _1027 = _1025;
    int _1029 = _872 * int(_977);
    int _1031 = _1029 + _862;
    int _1033 = _776 + (-1);
    float _1035 = trunc(_1003);
    int _1037 = int(_1035);
    if (!_768)
    {
        _1021 = _979;
    }
    float _1039 = _1021;
    float _1041 = float(uint(_1031));
    int _1043 = _949 * _1033;
    int _1045 = _1043 + _1019;
    bool _1047 = !_985;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = _1039 * _1027;
    bool _1053 = !_961;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = as_type<float>(_891) * _1041;
    bool _1059 = !_957;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = abs(_1049);
    int _1065 = abs(_1055);
    float _1067 = trunc(_1057);
    float _1069 = precise::max(_1067, 0.0);
    uint _1071 = uint(_1069);
    bool _1073 = !_965;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = abs(_1061);
    int _1079 = _1045 * _1065;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1083 = _1081 != 0;
    float _1085 = floor(_1051);
    int _1087 = abs(_1075);
    int _1089 = _1037 * _1063;
    int _1091 = _1089 + _848;
    bool _1093 = !_1083;
    int _1095 = _1093 ? 0 : 1;
    bool _1097 = _854 == 0;
    int _1099 = _1013 * _1077;
    int _1101 = _1099 + _1079;
    int _1103 = abs(_1095);
    int _1105 = int(_977) + int(_1071);
    int _1107 = _1091 * _1087;
    int _1109 = _1107 + _1101;
    int _1111 = ~_854;
    int _1113 = _1111 + 1;
    float _1115 = -_1085;
    float _1117 = _1051 + _1115;
    float _1119 = float(_854);
    int _1121 = _1037 * _1103;
    int _1123 = _1121 + _1109;
    float _1125 = float(_862);
    int _1127 = _1113 * _1105;
    int _1129 = _1127 + _862;
    float _1131 = _1119 * _1117;
    bool _1133 = _1125 >= _1119;
    bool _1135 = isnan(_1125);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(_1119);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = float(uint(_1123));
    bool _1147 = uint(_1129) >= uint(_854);
    float _1149 = trunc(_1131);
    int _1151 = int(_1149);
    float _1153 = as_type<float>(_844) * _1145;
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1165 = _1163 != 0;
    int _1167 = ~_1105;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = trunc(_1143);
    int _1175 = int(_1173);
    int _1177 = ~_776;
    int _1179 = _1177 + 1;
    int _1181 = _854 * _1171;
    int _1183 = _1181 + _862;
    float _1185 = _1119 * _166;
    float _1187 = trunc(_1153);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    float _1193 = _1185 * _868;
    bool _1195 = !_1097;
    int _1197 = _1195 ? _1183 : (-1);
    int _1199 = ~_1175;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    float _1205 = trunc(_1193);
    int _1207 = int(_1205);
    bool _1209 = !_1161;
    int _1211 = _1209 ? 0 : 1;
    int _1213 = _1203 * _1197;
    int _1215 = _854 + (-1);
    int _1217 = _1179 * int(_1191);
    int _1219 = _1217 + _1123;
    bool _1221 = !_1017;
    int _1223 = _1221 ? 0 : 1;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1231 = _1229 != 0;
    int _1233 = _1175 * _1215;
    int _1235 = _1233 + _1213;
    float _1237 = float(uint(_1219));
    bool _1239 = !_1165;
    int _1241 = _1239 ? 0 : 1;
    bool _1243 = !_1227;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = as_type<float>(_844) * _1237;
    int _1249 = abs(_1241);
    int _1251 = abs(_1223);
    float _1253 = trunc(_1247);
    float _1255 = precise::max(_1253, 0.0);
    uint _1257 = uint(_1255);
    int _1259 = abs(_1211);
    int _1261 = _1235 * _1249;
    int _1263 = abs(_1245);
    bool _1265 = !_1231;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1151 * _1251;
    int _1271 = _1269 + _862;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1275 = _1273 != 0;
    int _1277 = _1207 * _1259;
    int _1279 = _1277 + _1261;
    int _1281 = abs(_1267);
    float _1283 = in.m_69.z;
    int _1285 = ~_776;
    int _1287 = _1285 + 1;
    int _1289 = _1271 * _1263;
    int _1291 = _1289 + _1279;
    int _1293 = int(_1191) + int(_1257);
    float _1295 = in.m_69.w;
    int _1297 = _1151 * _1281;
    int _1299 = _1297 + _1291;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1303 = _1301 != 0;
    int _1305 = ~_854;
    int _1307 = _1305 + 1;
    int _1309 = _1287 * _1293;
    int _1311 = _1309 + _1123;
    float _1313 = float(uint(_1299));
    int _1315 = _1281;
    float _1317 = as_type<float>(_1207);
    int _1319 = _1279;
    float _1321 = as_type<float>(_1151);
    if (_1275)
    {
        float _1323 = -_188;
        float _1325 = _1323 + 1.0;
        _1315 = as_type<int>(_1325);
    }
    int _1327 = _1315;
    if (!_1275)
    {
        _1317 = _188;
    }
    float _1329 = _1317;
    bool _1331 = uint(_1311) >= uint(_776);
    float _1333 = as_type<float>(_891) * _1313;
    bool _1335 = _776 == 0;
    bool _1337 = !_1331;
    int _1339 = _1337 ? 0 : (-1);
    float _1341 = trunc(_1333);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    bool _1347 = _1331;
    float _1349 = _1329;
    if (_1275)
    {
        bool _1351 = _756 > 0.5;
        _1347 = _1351;
    }
    bool _1353 = _1347;
    if (_1303)
    {
        float _1355 = -_188;
        float _1357 = _1355 + 1.0;
        _1319 = as_type<int>(_1357);
    }
    int _1359 = _1319;
    int _1361 = ~_1293;
    int _1363 = _1361 + _1339;
    int _1365 = _1363 + 1;
    if (_1275)
    {
        float _1367 = _1353 ? as_type<float>(_1327) : _188;
        _1349 = _1367;
    }
    float _1369 = _1349;
    bool _1371 = _979 > 0.5;
    int _1373 = _776 * _1365;
    int _1375 = _1373 + _1123;
    float _1377 = -_192;
    float _1379 = _1377 + 1.0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1383 = _1381 != 0;
    bool _1385 = _1283 > 0.5;
    int _1387 = _1371 ? as_type<int>(_1379) : as_type<int>(_192);
    int _1389 = _1307 * int(_1345);
    int _1391 = _1389 + _1299;
    bool _1393 = _1295 > 0.5;
    bool _1395 = !_1335;
    int _1397 = _1395 ? _1375 : (-1);
    float _1399 = float(uint(_1391));
    if (!_1303)
    {
        _1321 = _188;
    }
    float _1401 = _1321;
    float _1403 = _1401;
    if (_1303)
    {
        float _1405 = _1385 ? as_type<float>(_1359) : _188;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = as_type<float>(_891) * _1399;
    float _1411 = _1383 ? as_type<float>(_1387) : _192;
    int _1413 = _1397 & 3;
    bool _1415 = _1413 != 0;
    float _1417 = trunc(_1409);
    float _1419 = precise::max(_1417, 0.0);
    uint _1421 = uint(_1419);
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1425 = _1423 != 0;
    int _1427 = _1393 ? as_type<int>(_1379) : as_type<int>(_192);
    int _1429 = _1397 & 3;
    bool _1431 = _1429 != 0;
    int _1433 = _1415 ? 0 : 1;
    float _1435 = _1425 ? as_type<float>(_1427) : _192;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1439 = _1437 != 0;
    bool _1441 = uint(_1429) > 1u;
    int _1443 = ~_1433;
    int _1445 = _1443 + 1;
    int _1447 = _1445 + 1;
    int _1449 = int(_1345) + int(_1421);
    int _1451 = ~_854;
    int _1453 = _1451 + 1;
    int _1455 = _1447;
    if (_1439)
    {
        float _1457 = _1385 ? _1379 : _192;
        _238 = _1457;
    }
    float _1459 = _238;
    int _1461 = _1453 * _1449;
    int _1463 = _1461 + _1299;
    float _1465 = as_type<float>(_1463);
    if (!_1441)
    {
        int _1467 = ~_1433;
        int _1469 = _1467 + 1;
        _1455 = _1469;
    }
    int _1471 = _1455;
    float _1473 = in.m_50.x;
    float _1475 = in.m_50.y;
    float _1477 = in.m_50.z;
    bool _1479 = _1429 != 3;
    bool _1481 = uint(_1429) >= 2u;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    int _1487 = _1481 ? 0 : 1;
    bool _1489 = _979 > 0.5;
    bool _1491 = _1489 && _1485;
    int _1493 = ~_1487;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    int _1499 = _1497;
    if (_1479)
    {
        int _1501 = ~_1487;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    bool _1507 = uint(_1463) >= uint(_854);
    if (!_1485)
    {
        _1465 = _188;
    }
    float _1509 = _1465;
    bool _1511 = !_1507;
    int _1513 = _1511 ? 0 : (-1);
    float _1515 = _1509;
    if (_1491)
    {
        float _1517 = -_188;
        float _1519 = _1517 + 1.0;
        _240 = _1519;
    }
    float _1521 = _240;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1525 = _1523 != 0;
    float _1527 = _214 * _1475;
    float _1529 = _202 * _1475;
    float _1531 = _208 * _1475;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1535 = _1533 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1537 = fma(_200, _1473, _1529);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1543 = fma(_206, _1473, _1531);
    float _1545 = 1.0 / _1535;
    float _1547 = fma(_212, _1473, _1527);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1553 = fma(_204, _1477, _1537);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1555;
    float _1559 = float(uint(_1091));
    float _1561 = _1475 + _764;
    float _1563 = 1.0 / _1541;
    float _1565 = _1557 * _887;
    float _1567 = as_type<float>(_844) * _1559;
    int _1569 = ~_1449;
    int _1571 = _1569 + _1513;
    int _1573 = _1571 + 1;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1579 = _1577 != 0;
    float _1581 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1587;
    int _1591 = _854 * _1573;
    int _1593 = _1591 + _1299;
    float _1595 = -_1575;
    float _1597 = fma(_1581, 2.0, _1595);
    float _1599 = trunc(_1567);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1607 = _979 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1609 = _1585 * _1545;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1615 = _1589 * _1563;
    if (_1485)
    {
        _1515 = _1521;
    }
    float _1617 = _1515;
    float _1619 = fma(_1607, -2.0, _1605);
    bool _1621 = !_1097;
    float _1623 = _1621 ? as_type<float>(_1593) : as_type<float>(0xffffffffu /* nan */);
    float _1625 = fma(_210, _1477, _1543);
    float _1627 = float(uint(_1271));
    float _1629 = 1.0 / _1613;
    int _1631 = ~_776;
    int _1633 = _1631 + 1;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1639 = fma(_216, _1477, _1547);
    float _1641 = as_type<float>(_891) * _1627;
    int _1643 = _1633 * int(_1603);
    int _1645 = _1643 + _1091;
    int _1647 = ~_854;
    int _1649 = _1647 + 1;
    float _1651 = 1.0 / _1551;
    int _1653 = as_type<int>(_1623) & 3;
    bool _1655 = _1653 != 0;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1661 = float(uint(_1645));
    float _1663 = _1553 + _778;
    int _1665 = _1655 ? 0 : 1;
    float _1667 = -_166;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1597);
    bool _1671 = uint(_1653) >= 2u;
    float _1673 = trunc(_1641);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    float _1679 = as_type<float>(_844) * _1661;
    int _1681 = _1671 ? 0 : 1;
    bool _1683 = _1653 != 3;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1689 = 1.0 / _1659;
    int _1691 = ~_1681;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    float _1697 = _1637 * _1651;
    int _1699 = ~_1665;
    int _1701 = _1699 + 1;
    int _1703 = _1701 + 1;
    bool _1705 = !_1525;
    int _1707 = _1705 ? 0 : 1;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1711 = _1709 != 0;
    float _1713 = trunc(_1679);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    int _1719 = _1695;
    int _1721 = _1703;
    float _1723 = _1625;
    float _1725 = _1623;
    float _1727 = _1619;
    if (_1683)
    {
        int _1729 = ~_1681;
        int _1731 = _1729 + 1;
        _1719 = _1731;
    }
    int _1733 = _1719;
    int _1735 = _1649 * int(_1677);
    int _1737 = _1735 + _1271;
    bool _1739 = uint(_1653) > 1u;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1741;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1749 = 1.0 / _1687;
    float _1751 = float(uint(_1737));
    float _1753 = _1743 * _1629;
    float _1755 = _756 * 2.0;
    float _1757 = _1747 * _1689;
    float _1759 = _756 + _979;
    float _1761 = as_type<float>(_891) * _1751;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1763;
    float _1767 = floor(_1755);
    int _1769 = int(_1603) + int(_1717);
    float _1771 = _1759 + (-1.0);
    float _1773 = _979 * 2.0;
    int _1775 = ~_776;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1757, _760, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    if (!_1739)
    {
        int _1781 = ~_1665;
        int _1783 = _1781 + 1;
        _1721 = _1783;
    }
    int _1785 = _1721;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1789 = trunc(_1761);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    float _1795 = _979 + _1283;
    float _1797 = _1765 * _1749;
    int _1799 = _1777 * _1769;
    int _1801 = _1799 + _1091;
    int _1803 = ~_854;
    int _1805 = _1803 + 1;
    float _1807 = _1795 + (-1.0);
    float _1809 = fma(_1797, _782, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1811 = _1767 > 0.0;
    float _1813 = floor(_1773);
    bool _1815 = _1767 >= 0.0;
    bool _1817 = isnan(_1767);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1827 = _1283 * 2.0;
    bool _1829 = !_1579;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = _1823 ? 0 : 1;
    int _1835 = int(_1677) + int(_1793);
    bool _1837 = uint(_1801) >= uint(_776);
    int _1839 = ~_1833;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    int _1845 = _1805 * _1835;
    int _1847 = _1845 + _1271;
    int _1849 = _1843;
    if (!_1811)
    {
        int _1851 = ~_1833;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    bool _1857 = !_1837;
    int _1859 = _1857 ? 0 : (-1);
    bool _1861 = uint(_1847) >= uint(_854);
    float _1863 = floor(_1827);
    bool _1865 = _1813 > 0.0;
    bool _1867 = _1813 >= 0.0;
    bool _1869 = isnan(_1813);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.0);
    bool _1875 = _1871 || _1873;
    int _1877 = ~_1769;
    int _1879 = _1877 + _1859;
    int _1881 = _1879 + 1;
    int _1883 = as_type<int>(_1813);
    if (_1711)
    {
        _1883 = 0;
    }
    int _1885 = _1883;
    int _1887 = _1885;
    if (_1711)
    {
        _897 = 0;
    }
    int _1889 = _897;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1893 = _750 + _1891;
    int _1895 = _1875 ? 0 : 1;
    int _1897 = _776 * _1881;
    int _1899 = _1897 + _1091;
    int _1901 = _1889;
    if (!_1711)
    {
        _1887 = 1;
    }
    int _1903 = _1887;
    float _1905 = fma(_1609, _1893, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1711)
    {
        _1901 = 2;
    }
    int _1907 = _1901;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1915 = _1913 != 0;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1919 = _1917 != 0;
    bool _1921 = _776 == 0;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1925 = _750 + _1923;
    bool _1927 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1929 = isnan(_750);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    int _1939 = ~_1895;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1565, _1925, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1947 = !_1861;
    int _1949 = _1947 ? 0 : (-1);
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1953 = _750 + _1951;
    int _1955 = _1943;
    if (!_1865)
    {
        int _1957 = ~_1895;
        int _1959 = _1957 + 1;
        _1955 = _1959;
    }
    int _1961 = _1955;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1965 = _750 + _1963;
    bool _1967 = _1863 > 0.0;
    bool _1969 = _1863 >= 0.0;
    bool _1971 = isnan(_1863);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan(0.0);
    bool _1977 = _1973 || _1975;
    float _1979 = -_1937;
    float _1981 = _1979 + 1.0;
    bool _1983 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1985 = isnan(_750);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    bool _1995 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1997 = isnan(_750);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2003 = _1999 || _2001;
    float _2005 = float(_2003);
    bool _2007 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2009 = isnan(_750);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2015 = _2011 || _2013;
    float _2017 = float(_2015);
    float _2019 = _1993 * _1981;
    float _2021 = -_1993;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1615, _1953, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2027 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2029 = isnan(_750);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = fma(_1697, _1965, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2041 = -_2005;
    float _2043 = _2041 + 1.0;
    bool _2045 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2047 = isnan(_750);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    float _2057 = -_2017;
    float _2059 = _2057 + 1.0;
    bool _2061 = !_1921;
    int _2063 = _2061 ? _1899 : (-1);
    float _2065 = _2037 * _2043;
    float _2067 = -_2037;
    float _2069 = _2067 + 1.0;
    float _2071 = -_2055;
    float _2073 = _2071 + 1.0;
    float _2075 = _2005 * _2023;
    bool _2077 = _1903 != 1;
    float _2079 = in.m_63.w;
    float _2081 = _2055 * _2069;
    float _2083 = _2017 * _2073;
    float _2085 = _806 * _2059;
    float _2087 = -_806;
    float _2089 = _2087 + 1.0;
    float _2091 = in.m_65.w;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2095 = _1977 ? 0 : 1;
    float _2097 = _818 * _2089;
    float _2099 = -_818;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1907 != 2;
    float _2105 = fma(_1753, _772, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2107 = _1945 * _2097;
    bool _2109 = !_1911;
    int _2111 = _2109 ? 0 : 1;
    float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2115 = ~_2095;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2107);
    int _2123 = _2119;
    float _2125 = _2089;
    if (!_1967)
    {
        int _2127 = ~_2095;
        int _2129 = _2127 + 1;
        _2123 = _2129;
    }
    int _2131 = _2123;
    float _2133 = fma(_1905, _2085, _2121);
    int _2135 = as_type<int>(_1623) & 3;
    bool _2137 = _2135 != 0;
    float _2139 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2143 = fma(_2025, _2083, _2133);
    float _2145 = _1625 + _2079;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2149 = _1663 + _2147;
    float _2151 = fma(_2139, _1459, -0.5);
    if (_2103)
    {
        _1723 = _756;
    }
    float _2153 = _1723;
    float _2155 = _1639 + _2091;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2159 = _2145 + _2157;
    float _2161 = _2149 * _2149;
    float _2163 = _2153;
    if (!_2103)
    {
        _2163 = _1283;
    }
    float _2165 = _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2169 = _2155 + _2167;
    int _2171 = abs(_2111);
    float _2173 = fma(_2159, _2159, _2161);
    float _2175 = float(_2131);
    float _2177 = _2165 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2179 = float(_2171);
    float _2181 = fma(_2169, _2169, _2173);
    bool _2183 = !_2137;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = -_2141;
    float _2189 = fma(_2177, 2.0, _2187);
    bool _2191 = _1429 != 3;
    float _2193 = sqrt(_2181);
    float _2195 = _2179 * _2175;
    int _2197 = _1397 >> 31;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2201 = _1561 + _2199;
    bool _2203 = !_2191;
    int _2205 = _2203 ? 0 : (-1);
    float _2207 = _784 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _2209 = _1653 != 3;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2213 = _2197 & 3;
    float _2215 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2217 = as_type<int>(_1623) >> 31;
    float _2219 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2211);
    int _2221 = _1397 + _2213;
    float _2223 = fma(_2215, _1617, -0.5);
    int _2225 = _2217 & 3;
    float _2227 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2219);
    int _2229 = _2221 >> 2;
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2233 = as_type<int>(_1623) + _2225;
    float _2235 = rsqrt(_2181);
    int _2237 = _2229 << 4;
    int _2239 = _2237 + 368;
    float _2241 = fma(_2039, _2081, _2143);
    int _2243 = _2233 >> 2;
    float _2245 = -_166;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2189);
    float _2249 = as_type<float>(_2233);
    if (!_2077)
    {
        _2249 = _979;
    }
    float _2251 = _2249;
    float _2253 = fma(_2105, _2065, _2241);
    int _2255 = _2239 + 8;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    uint _2259 = uint(int(uint(int(_2257)) >> uint(2)));
    int _2261 = int(_2257) & 3;
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[int(_2259)][_2261];
    int _2265 = int(_2257) + 1;
    uint _2267 = uint(int(uint(_2265) >> uint(2)));
    int _2269 = _2265 & 3;
    float _2271 = (*spvDescriptorSet0.vp_c9)._m0[int(_2267)][_2269];
    float _2273 = precise::min(_2207, _2231);
    int _2275 = _2243 << 4;
    int _2277 = _2275 + 512;
    float _2279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2281 = _2251;
    if (!_2077)
    {
        _2125 = _2251;
    }
    float _2283 = _2125;
    out.m_79.w = _2273;
    bool _2285 = !_2209;
    int _2287 = _2285 ? 0 : (-1);
    uint _2289 = uint(int(uint(_2239) >> uint(2)));
    uint _2291 = uint(int(uint(int(_2289)) >> uint(2)));
    int _2293 = int(_2289) & 3;
    float _2295 = (*spvDescriptorSet0.vp_c9)._m0[int(_2291)][_2293];
    int _2297 = int(_2289) + 1;
    uint _2299 = uint(int(uint(_2297) >> uint(2)));
    int _2301 = _2297 & 3;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[int(_2299)][_2301];
    float _2305 = _2283;
    if (_2077)
    {
        _2281 = _756;
    }
    float _2307 = _2281;
    float _2309 = _2235 * _2273;
    bool _2311 = _2227 >= 0.0;
    float _2313 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2279);
    if (!_2077)
    {
        _1725 = _1283;
    }
    float _2315 = _1725;
    uint _2317 = uint(int(uint(_2277) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    float _2333 = _2315;
    if (_2077)
    {
        _2333 = _979;
    }
    float _2335 = _2333;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2339 = _2159 * _2309;
    float _2341 = _2149 * _2309;
    if (_2077)
    {
        _2305 = _756;
    }
    float _2343 = _2305;
    float _2345 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _2347 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2337);
    float _2349 = -_2339;
    float _2351 = _2159 + _2349;
    int _2353 = _2277 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    float _2371 = -_2341;
    float _2373 = _2149 + _2371;
    float _2375 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2347);
    float _2377 = _2351 * _2351;
    float _2379 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2381 = fma(_2375, _2223, _2247);
    float _2383 = fma(_2373, _2373, _2377);
    float _2385 = _2169 * _2309;
    float _2387 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2389 = abs(_1471);
    float _2391 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2345);
    int _2393 = abs(_1785);
    float _2395 = -_2387;
    float _2397 = fma(_2379, 2.0, _2395);
    bool _2399 = !_1431;
    int _2401 = _2399 ? 0 : 1;
    float _2403 = -_2385;
    float _2405 = _2169 + _2403;
    if (_2311)
    {
        out.m_53.x = 0.0;
    }
    int _2407 = ~_2389;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    float _2413 = fma(_2405, _2405, _2383);
    int _2415 = abs(_2401);
    float _2417 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2419 = int(_2417);
    int _2421 = ~_2393;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    int _2427 = abs(_2185);
    int _2429 = abs(_1505);
    int _2431 = ~_1835;
    int _2433 = _2431 + _1949;
    int _2435 = _2433 + 1;
    int _2437 = ~_2415;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2411 * as_type<int>(_2303);
    int _2445 = abs(_1733);
    int _2447 = _854 * _2435;
    int _2449 = _2447 + _1271;
    int _2451 = ~_2427;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2441 * as_type<int>(_2295);
    int _2459 = _2457 + _2443;
    float _2461 = fma(_2201, _2201, _2161);
    int _2463 = _2425 * as_type<int>(_2331);
    int _2465 = abs(_2205);
    float _2467 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2469 = int(_2467);
    int _2471 = ~_2429;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = _2455 * as_type<int>(_2323);
    int _2479 = _2477 + _2463;
    int _2481 = ~_2445;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    float _2487 = fma(_2169, _2169, _2461);
    int _2489 = _2475 * as_type<int>(_2263);
    int _2491 = _2489 + _2459;
    int _2493 = abs(_1707);
    int _2495 = _2485 * as_type<int>(_2361);
    int _2497 = _2495 + _2479;
    int _2499 = ~_2465;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    float _2505 = rsqrt(_2487);
    int _2507 = abs(_2287);
    int _2509 = abs(_1831);
    int _2511 = _2503 * as_type<int>(_2271);
    int _2513 = _2511 + _2491;
    int _2515 = ~_2507;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    float _2521 = float(uint(_2419));
    int _2523 = ~_2493;
    int _2525 = _2523 + 1;
    int _2527 = _2525 + 1;
    int _2529 = _2519 * as_type<int>(_2369);
    int _2531 = _2529 + _2497;
    float _2533 = 1.0 / _2521;
    int _2535 = abs(_2419);
    int _2537 = _2513 * _2527;
    float _2539 = float(uint(_2469));
    float _2541 = in.m_81.x;
    float _2543 = in.m_81.y;
    float _2545 = in.m_81.z;
    float _2547 = float(uint(_2535));
    int _2549 = _2063 * _2493;
    int _2551 = _2549 + _2537;
    int _2553 = abs(_2469);
    float _2555 = 1.0 / _2539;
    bool _2557 = _854 == 0;
    int _2559 = ~_2509;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    if (!_2077)
    {
        _899 = _1283;
    }
    float _2565 = _899;
    float _2567 = _2565;
    if (_2077)
    {
        _2567 = _979;
    }
    float _2569 = _2567;
    float _2571 = 1.0 / _2547;
    float _2573 = float(uint(_2553));
    int _2575 = _2563 * _2531;
    bool _2577 = !_2557;
    int _2579 = _2577 ? _2449 : (-1);
    int _2581 = as_type<int>(_2533) + (-2);
    float _2583 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2585 = float(uint(_2551));
    float _2587 = 1.0 / _2573;
    float _2589 = _2195 * (-2.0);
    int _2591 = _2579 * _2509;
    int _2593 = _2591 + _2575;
    int _2595 = as_type<int>(_2555) + (-2);
    float _2597 = as_type<float>(_2581) * _2585;
    float _2599 = fma(_1787, _2589, _1787);
    float _2601 = fma(_2589, _2541, _2541);
    float _2603 = float(uint(_2593));
    float _2605 = trunc(_2597);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    int _2611 = abs(_2551);
    int _2613 = as_type<int>(_2571) + (-2);
    float _2615 = as_type<float>(_2595) * _2603;
    int _2617 = ~_2419;
    int _2619 = _2617 + 1;
    float _2621 = sqrt(_2413);
    float _2623 = float(uint(_2611));
    int _2625 = abs(_2593);
    float _2627 = float(uint(_2625));
    float _2629 = trunc(_2615);
    float _2631 = precise::max(_2629, 0.0);
    uint _2633 = uint(_2631);
    float _2635 = as_type<float>(_2613) * _2623;
    int _2637 = as_type<int>(_2587) + (-2);
    int _2639 = _2619 * int(_2609);
    int _2641 = _2639 + _2551;
    int _2643 = ~_2469;
    int _2645 = _2643 + 1;
    float _2647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2649 = ~_2535;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_2637) * _2627;
    float _2655 = trunc(_2635);
    float _2657 = precise::max(_2655, 0.0);
    uint _2659 = uint(_2657);
    float _2661 = _2587;
    float _2663 = as_type<float>(_2581);
    if (_2311)
    {
        _2661 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2665 = _2661;
    float _2667 = fma(_2583, -2.0, _2647);
    float _2669 = float(uint(_2641));
    float _2671 = _2235 * _2621;
    int _2673 = as_type<int>(_2665);
    if (_2311)
    {
        float _2675 = _2665 * 5.0;
        _2673 = as_type<int>(_2675);
    }
    int _2677 = _2673;
    int _2679 = ~_2469;
    int _2681 = _2679 + 1;
    float _2683 = trunc(_2653);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    int _2689 = _2645 * int(_2633);
    int _2691 = _2689 + _2593;
    float _2693 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2667);
    if (_2311)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8730 = as_type<float>(_2677);
        out.gl_Position.z = _8730;
    }
    int _2695 = _2651 * int(_2659);
    int _2697 = _2695 + _2611;
    float _2699 = fma(_1779, _2075, _2253);
    int _2701 = ~_2553;
    int _2703 = _2701 + 1;
    float _2705 = as_type<float>(_2581) * _2669;
    float _2707 = float(uint(_2691));
    float _2709 = fma(_1809, _2019, _2699);
    float _2711 = float(uint(_2697));
    float _2713 = _2709;
    if (_2103)
    {
        _2663 = _979;
    }
    float _2715 = _2663;
    float _2717 = as_type<float>(_2595) * _2707;
    float _2719 = as_type<float>(_2613) * _2711;
    float _2721 = _2715;
    if (!_2103)
    {
        _2721 = _756;
    }
    float _2723 = _2721;
    float _2725 = _784 * _2671;
    int _2727 = _2703 * int(_2687);
    int _2729 = _2727 + _2625;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2733 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2735 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2737 = float(uint(_2729));
    float _2739 = trunc(_2717);
    float _2741 = precise::max(_2739, 0.0);
    uint _2743 = uint(_2741);
    float _2745 = fma(_2733, -2.0, _2731);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2749 = _2735 * _2505;
    float _2751 = as_type<float>(_2637) * _2737;
    float _2753 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2745);
    float _2755 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2747);
    float _2757 = _2201 * _2749;
    float _2759 = trunc(_2705);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    float _2765 = _2149 * _2749;
    float _2767 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2709);
    float _2769 = -_2757;
    float _2771 = _2201 + _2769;
    float _2773 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2755);
    int _2775 = ~_2553;
    int _2777 = _2775 + 1;
    float _2779 = -_2765;
    float _2781 = _2149 + _2779;
    float _2783 = _2771 * _2771;
    float _2785 = trunc(_2751);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    float _2791 = -_2753;
    float _2793 = fma(_2773, _2151, _2791);
    int _2795 = ~_2419;
    int _2797 = _2795 + 1;
    float _2799 = fma(_2781, _2781, _2783);
    int _2801 = int(_2633) + int(_2743);
    out.m_83.x = _2767;
    float _2803 = _2169 * _2749;
    float _2805 = trunc(_2719);
    float _2807 = precise::max(_2805, 0.0);
    uint _2809 = uint(_2807);
    int _2811 = int(_2609) + int(_2763);
    int _2813 = ~_2535;
    int _2815 = _2813 + 1;
    int _2817 = _2797 * _2811;
    int _2819 = _2817 + _2551;
    int _2821 = int(_2687) + int(_2789);
    bool _2823 = uint(_2819) >= uint(_2419);
    int _2825 = _2777 * _2821;
    int _2827 = _2825 + _2625;
    bool _2829 = !_2823;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = int(_2659) + int(_2809);
    float _2835 = -_2803;
    float _2837 = _2169 + _2835;
    int _2839 = _2681 * _2801;
    int _2841 = _2839 + _2593;
    bool _2843 = uint(_2827) >= uint(_2553);
    int _2845 = _2815 * _2833;
    int _2847 = _2845 + _2611;
    float _2849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2851 = uint(_2841) >= uint(_2469);
    float _2853 = fma(_2837, _2837, _2799);
    int _2855 = ~_2811;
    int _2857 = _2855 + _2831;
    int _2859 = _2857 + 1;
    bool _2861 = uint(_2847) >= uint(_2535);
    bool _2863 = !_2851;
    int _2865 = _2863 ? 0 : (-1);
    int _2867 = _2419 * _2859;
    int _2869 = _2867 + _2551;
    bool _2871 = _2419 == 0;
    float _2873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2875 = ~_2801;
    int _2877 = _2875 + _2865;
    int _2879 = _2877 + 1;
    bool _2881 = !_2861;
    int _2883 = _2881 ? 0 : (-1);
    bool _2885 = _2419 == 0;
    int _2887 = _2469 * _2879;
    int _2889 = _2887 + _2593;
    int _2891 = _2551 ^ _2419;
    bool _2893 = !_2871;
    int _2895 = _2893 ? _2869 : (-1);
    bool _2897 = !_2843;
    int _2899 = _2897 ? 0 : (-1);
    float _2901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2903 = _2469 == 0;
    bool _2905 = _2469 == 0;
    float _2907 = _2873 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2909 = _2593 ^ _2469;
    float _2911 = _2849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2913 = float(_2895);
    float _2915 = fma(_2907, _1407, -0.5);
    float _2917 = fma(_2911, _1369, -0.5);
    uint _2919 = uint(int(uint(_2891) >> uint(31)));
    float _2921 = fma(_2911, _2913, _1669);
    uint _2923 = uint(int(uint(_2909) >> uint(31)));
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2927 = ~_2883;
    int _2929 = _2833 + _2927;
    int _2931 = _2929 + 1;
    int _2933 = ~int(_2919);
    int _2935 = _2933 + 1;
    float _2937 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2925);
    int _2939 = ~_2899;
    int _2941 = _2821 + _2939;
    int _2943 = _2941 + 1;
    float _2945 = -_166;
    float _2947 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2397);
    int _2949 = ~int(_2923);
    int _2951 = _2949 + 1;
    float _2953 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2937);
    bool _2955 = !_2903;
    int _2957 = _2955 ? _2889 : (-1);
    float _2959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2961 = _2931 ^ _2935;
    int _2963 = _2943 ^ _2951;
    float _2965 = float(_2957);
    int _2967 = ~_2935;
    int _2969 = _2967 + _2961;
    int _2971 = _2969 + 1;
    int _2973 = ~_2951;
    int _2975 = _2973 + _2963;
    int _2977 = _2975 + 1;
    float _2979 = fma(_2953, _2917, _2921);
    float _2981 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2983 = fma(_2907, _2965, _2947);
    bool _2985 = !_2885;
    int _2987 = _2985 ? _2971 : (-1);
    float _2989 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2991 = log2(_2989);
    float _2993 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1619);
    float _2995 = float(_2987);
    float _2997 = fma(_1411, _2981, -0.5);
    bool _2999 = !_2905;
    int _3001 = _2999 ? _2977 : (-1);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3005 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3007 = -_2993;
    float _3009 = fma(_2981, _2995, _3007);
    float _3011 = sqrt(_2853);
    float _3013 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3003);
    float _3015 = float(_3001);
    float _3017 = fma(_1435, _3005, -0.5);
    float _3019 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2313);
    float _3021 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3013);
    bool _3023 = !_1915;
    int _3025 = _3023 ? 0 : 1;
    float _3027 = _2991 * _166;
    float _3029 = -_2693;
    float _3031 = fma(_3005, _3015, _3029);
    float _3033 = fma(_3021, _2997, _3009);
    float _3035 = fma(_3019, _2915, _2983);
    float _3037 = _2793 + 0.5;
    float _3039 = fma(_2391, _3017, _3031);
    float _3041 = _3033 + 0.5;
    float _3043 = exp2(_3027);
    float _3045 = _2505 * _3011;
    float _3047 = _3035 + 0.5;
    bool _3049 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3051 = isnan(1.0);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3057 = _3053 || _3055;
    float _3059 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3061 = 1.0 + _3059;
    float _3063 = _2381 + 0.5;
    float _3065 = _2979 + 0.5;
    float _3067 = _3039 + 0.5;
    float _3069 = _2725 * _3045;
    bool _3071 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3073 = isnan(0.0);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3079 = _3075 || _3077;
    float _3081 = 1.0 / _3061;
    int _3083 = abs(_3025);
    out.m_85.x = _3063;
    out.m_85.y = _3037;
    float _3085 = _756 + (-0.5);
    float _3087 = -_3043;
    float _3089 = _3087 + 1.0;
    out.m_87.x = _3065;
    out.m_87.y = _3041;
    out.m_87.z = _3047;
    out.m_87.w = _3067;
    out.m_89.x = _3069;
    float _3091 = _3079 ? _3089 : 0.0;
    bool _3093 = !_1919;
    int _3095 = _3093 ? 0 : 1;
    float _3097 = _3091;
    float _3099 = _2783;
    float _3101 = _2757;
    if (_2311)
    {
        return out;
    }
    float _3103 = -_2757;
    float _3105 = _1561 + _3103;
    float _3107 = float(_1855);
    float _3109 = -_2765;
    float _3111 = _1663 + _3109;
    float _3113 = float(_3083);
    float _3115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3117 = _3105 + _3115;
    float _3119 = fma(_3085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2601);
    float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3123 = _3111 + _3121;
    float _3125 = _979 + (-0.5);
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3129 = _3113 * _3107;
    int _3131 = abs(_3095);
    if (_3057)
    {
        float _3133 = _3091 * _3081;
        _168 = _3133;
    }
    float _3135 = _168;
    float _3137 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3127);
    float _3139 = _3129 * (-2.0);
    float _3141 = float(_1961);
    float _3143 = -_2803;
    float _3145 = _2155 + _3143;
    float _3147 = float(_3131);
    float _3149 = fma(_3139, _2543, _2543);
    float _3151 = fma(_1825, _3139, _1825);
    float _3153 = _756 + _1283;
    float _3155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3157 = _3145 + _3155;
    float _3159 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3149);
    float _3161 = _3147 * _3141;
    float _3163 = _3153 + (-1.0);
    float _3165 = fma(_3151, _3135, _3159);
    float _3167 = _3161 * (-2.0);
    float _3169 = fma(_3157, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3137);
    float _3171 = fma(_3163, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3173 = _1283 + (-0.5);
    float _3175 = fma(_3167, _2545, _2545);
    float _3177 = fma(_2599, _3135, _3119);
    bool _3179 = _3169 >= 0.0;
    float _3181 = fma(_3171, _3167, _3171);
    float _3183 = fma(_3173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3175);
    float _3185 = _3177 * 0.15915493667125701904296875;
    float _3187 = _3165 * 0.15915493667125701904296875;
    float _3189 = fma(_3181, _3135, _3183);
    float _3191 = _3185 * 6.283185482025146484375;
    float _3193 = sin(_3191);
    float _3195 = _3189 * 0.15915493667125701904296875;
    float _3197 = _3165;
    if (_3179)
    {
        _3197 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3199 = _3197;
    int _3201 = as_type<int>(_3199);
    if (_3179)
    {
        out.m_53.x = 0.0;
    }
    float _3203 = _3185 * 6.283185482025146484375;
    float _3205 = cos(_3203);
    if (_3179)
    {
        float _3207 = _3199 * 5.0;
        _3201 = as_type<int>(_3207);
    }
    int _3209 = _3201;
    float _3211 = _3187 * 6.283185482025146484375;
    float _3213 = sin(_3211);
    if (_3179)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9530 = as_type<float>(_3209);
        out.gl_Position.z = _9530;
    }
    float _3215 = _3187 * 6.283185482025146484375;
    float _3217 = cos(_3215);
    float _3219 = _3195 * 6.283185482025146484375;
    float _3221 = sin(_3219);
    if (_3179)
    {
        return out;
    }
    float _3223 = in.m_91.x;
    float _3225 = in.m_91.y;
    float _3227 = in.m_91.z;
    float _3229 = _3195 * 6.283185482025146484375;
    float _3231 = cos(_3229);
    float _3233 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3235 = _2671 * _3045;
    float _3237 = _3193 * _3213;
    float _3239 = _3205 * _3217;
    float _3241 = _3205 * _3213;
    float _3243 = _3233 * _3235;
    float _3245 = _3193 * _3217;
    float _3247 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3249 = fma(_3221, _3239, _3237);
    float _3251 = fma(_3221, _3237, _3239);
    float _3253 = -_3241;
    float _3255 = fma(_3221, _3245, _3253);
    float _3257 = _3247 * _3235;
    float _3259 = _3205 * _3231;
    float _3261 = _3217 * _3231;
    float _3263 = _3193 * _3231;
    float _3265 = _3213 * _3231;
    float _3267 = -_3245;
    float _3269 = fma(_3221, _3241, _3267);
    float _3271 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3273 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3225);
    float _3277 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3227);
    float _3279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3223);
    float _3281 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3273);
    float _3283 = _3243 * _3275;
    float _3285 = _3257 * _3277;
    float _3287 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3289 = _3069 * _3279;
    float _3291 = _3259 * _3283;
    float _3293 = -_3283;
    float _3295 = _3221 * _3293;
    float _3297 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3287);
    float _3299 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3271);
    float _3301 = fma(_3249, _3289, _3291);
    float _3303 = fma(_3261, _3289, _3295);
    float _3305 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3307 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3309 = _3263 * _3283;
    float _3311 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3313 = fma(_3269, _3285, _3301);
    float _3315 = fma(_3265, _3285, _3303);
    float _3317 = fma(_3255, _3289, _3309);
    float _3319 = -_3221;
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3311);
    float _3323 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3325 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3327 = fma(_3251, _3285, _3317);
    float _3329 = -_3221;
    float _3331 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3307);
    float _3333 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3323);
    float _3335 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3325);
    float _3337 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3281);
    float _3339 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3297);
    float _3341 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3333);
    float _3343 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3299);
    float _3345 = -_3221;
    float _3347 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3305);
    float _3349 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3335);
    float _3353 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3355 = in.m_93.x;
    float _3357 = in.m_93.y;
    float _3359 = in.m_93.z;
    float _3361 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    bool _3363 = _3225 != 0.0;
    bool _3365 = isnan(_3225);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = _3351 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3375 = _2155 + _3353;
    float _3377 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3379 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3381 = _3223 == 0.0;
    bool _3383 = !_3371;
    bool _3385 = _3381 && _3383;
    float _3387 = _1663 + _3373;
    float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3391 = _3375 + _3389;
    float _3393 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3347);
    bool _3395 = _3227 == 0.0;
    bool _3397 = _3395 && _3385;
    float _3399 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3377);
    float _3401 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3379);
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3405 = _3387 + _3403;
    float _3407 = _3391 * _3391;
    float _3409 = in.m_95.x;
    float _3411 = in.m_95.y;
    float _3413 = in.m_95.z;
    float _3415 = in.m_95.w;
    float _3417 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3331);
    float _3419 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3321);
    float _3421 = fma(_3405, _3405, _3407);
    float _3423 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3361);
    float _3425 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3427 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3401);
    float _3429 = sqrt(_3421);
    float _3431 = _3321;
    float _3433 = _3263;
    float _3435 = _3343;
    if (_3397)
    {
        _2713 = _3355;
    }
    float _3437 = _2713;
    float _3439 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3425);
    float _3441 = _3437;
    if (_3397)
    {
        _3097 = _3357;
    }
    float _3443 = _3097;
    float _3445 = _3443;
    if (_3397)
    {
        _3099 = _3359;
    }
    float _3447 = _3099;
    float _3449 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3439);
    float _3451 = _3447;
    if (_3397)
    {
        _1727 = _3437;
    }
    float _3453 = _1727;
    float _3455 = _3453;
    if (_3397)
    {
        _3431 = _3443;
    }
    float _3457 = _3431;
    float _3459 = _3457;
    if (_3397)
    {
        _3433 = _3447;
    }
    float _3461 = _3433;
    float _3463 = _3461;
    if (!_3397)
    {
        _3441 = _3355;
    }
    float _3465 = _3441;
    if (!_3397)
    {
        _3445 = _3357;
    }
    float _3467 = _3445;
    float _3469 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3399);
    if (!_3397)
    {
        _3451 = _3359;
    }
    float _3471 = _3451;
    if (!_3397)
    {
        float _3473 = fma(_3223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3465);
        _3455 = _3473;
    }
    float _3475 = _3455;
    float _3477 = _3393 * _3411;
    if (!_3397)
    {
        float _3479 = fma(_3225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3467);
        _3459 = _3479;
    }
    float _3481 = _3459;
    float _3483 = _3413 * _3465;
    float _3485 = _3483;
    if (!_3397)
    {
        float _3487 = fma(_3227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3471);
        _3463 = _3487;
    }
    float _3489 = _3463;
    bool _3491 = _3429 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = _3417 * _3411;
    float _3495 = fma(_3343, _3409, _3477);
    float _3497 = _3409 * _3467;
    float _3499 = _3419 * _3411;
    float _3501 = fma(_3337, _3409, _3493);
    float _3503 = _3449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3505 = -_3483;
    float _3507 = fma(_3409, _3471, _3505);
    float _3509 = -_3497;
    float _3511 = fma(_3411, _3465, _3509);
    float _3513 = fma(_3339, _3409, _3499);
    float _3515 = _1561 + _3503;
    float _3517 = _3411 * _3471;
    float _3519 = _3503;
    float _3521 = _3497;
    if (!_3491)
    {
        _3519 = _3387;
    }
    float _3523 = _3519;
    float _3525 = _3523;
    if (!_3491)
    {
        _3521 = _3375;
    }
    float _3527 = _3521;
    float _3529 = _3527;
    if (!_3491)
    {
        _3485 = _3515;
    }
    float _3531 = _3485;
    bool _3533 = !_3491;
    float _3535 = _3531;
    if (!_3533)
    {
        float _3537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3541 = _3429 + _3539;
        float _3543 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3545 = rsqrt(_3421);
        float _3547 = _3541 * _3537;
        float _3549 = _3547 * 0.15915493667125701904296875;
        float _3551 = _3549 * 6.283185482025146484375;
        float _3553 = cos(_3551);
        float _3555 = _3549 * 6.283185482025146484375;
        float _3557 = sin(_3555);
        float _3559 = _3553 + (-1.0);
        float _3561 = _3559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3563 = fma(_3557, _3543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3565 = fma(_3515, _3553, _3561);
        float _3567 = _3545 * _3563;
        float _3569 = fma(_3405, _3567, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3571 = fma(_3391, _3567, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3535 = _3565;
        _3525 = _3569;
        _3529 = _3571;
    }
    float _3573 = _3535;
    float _3575 = _3525;
    float _3577 = _3529;
    float _3579 = -_2339;
    float _3581 = _3579 + _3573;
    float _3583 = -_2341;
    float _3585 = _3583 + _3575;
    float _3587 = -_3517;
    float _3589 = fma(_3413, _3467, _3587);
    float _3591 = _3419 * _3481;
    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3595 = _3581 + _3593;
    float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3599 = _3585 + _3597;
    float _3601 = _3589 * _3415;
    float _3603 = _3511 * _3415;
    float _3605 = _3595 * _3595;
    float _3607 = _3507 * _3415;
    float _3609 = _3417 * _3481;
    float _3611 = fma(_3423, _3413, _3495);
    float _3613 = fma(_3599, _3599, _3605);
    float _3615 = -_2385;
    float _3617 = _3615 + _3577;
    float _3619 = _3393 * _3481;
    float _3621 = _3607 * _3393;
    float _3623 = _3607 * _3417;
    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3627 = _3617 + _3625;
    float _3629 = _3607 * _3419;
    float _3631 = fma(_3343, _3475, _3619);
    float _3633 = fma(_3337, _3475, _3609);
    float _3635 = fma(_3627, _3627, _3613);
    float _3637 = fma(_3339, _3475, _3591);
    float _3639 = fma(_3601, _3343, _3621);
    float _3641 = fma(_3601, _3337, _3623);
    float _3643 = fma(_3601, _3339, _3629);
    float _3645 = fma(_3469, _3413, _3501);
    float _3647 = sqrt(_3635);
    float _3649 = fma(_3469, _3489, _3633);
    float _3651 = fma(_3427, _3413, _3513);
    float _3653 = fma(_3423, _3489, _3631);
    float _3655 = fma(_3603, _3423, _3639);
    float _3657 = fma(_3603, _3469, _3641);
    float _3659 = fma(_3603, _3427, _3643);
    float _3661 = fma(_3427, _3489, _3637);
    out.m_97.x = _3611;
    out.m_97.y = _3645;
    out.m_97.z = _3651;
    float _3663 = -_2341;
    float _3665 = _1663 + _3663;
    float _3667 = -_2339;
    float _3669 = _3667 + _1561;
    out.m_99.x = _3655;
    out.m_99.y = _3657;
    out.m_99.z = _3659;
    float _3671 = -_2385;
    float _3673 = _2155 + _3671;
    out.m_101.x = _3653;
    out.m_101.y = _3649;
    out.m_101.z = _3661;
    bool _3675 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3677 = isnan(_3647);
    bool _3679 = _3675 || _3677;
    bool _3681 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3683 = _3679 || _3681;
    if (!_3683)
    {
        _3435 = 1.0;
    }
    float _3685 = _3435;
    bool _3687 = !_3683;
    float _3689 = _3685;
    if (!_3687)
    {
        bool _3691 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3693 = isnan(_3647);
        bool _3695 = _3691 || _3693;
        bool _3697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3699 = _3695 || _3697;
        if (!_3699)
        {
            float _3701 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3703 = _3647 + _3701;
            float _3705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3707 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3705;
            float _3709 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3713 = 1.0 / _3707;
            float _3715 = _3703 * _3713;
            float _3717 = fma(_3715, _3711, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3689 = _3717;
            _3719 = true;
        }
        else
        {
            bool _3721 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3723 = isnan(_3647);
            bool _3725 = _3721 || _3723;
            bool _3727 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3729 = _3725 || _3727;
            if (!_3729)
            {
                float _3731 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3733 = _3647 + _3731;
                float _3735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3737 = _3735 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3739 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3741 = _3739 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3743 = 1.0 / _3737;
                float _3745 = _3733 * _3743;
                float _3747 = fma(_3745, _3741, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3689 = _3747;
                _3719 = true;
            }
            else
            {
                _3689 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3719 = false;
    float _3749 = _3689;
    float _3751 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3753 = _3585 + _3751;
    float _3755 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3757 = _3617 + _3755;
    float _3759 = fma(_3753, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3761 = fma(_3757, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3763 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3765 = _3759 + _3763;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3769 = _3761 + _3767;
    float _3771 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3773 = fma(_3769, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10506 = float2(_3771, _3773);
    float _3775 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10506, float2(0.0), isnan(_10506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10506, float2(0.0), isnan(_10506)), level(0.0)).x;
    float _3777 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3779 = _3581 + _3777;
    float _3781 = -_2765;
    float _3783 = _3781 + _3665;
    float _3785 = -_2803;
    float _3787 = _3785 + _3673;
    float _3789 = -_3665;
    float _3791 = _3789 + _3759;
    float _3793 = fma(_3779, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3795 = -_3673;
    float _3797 = _3795 + _3761;
    float _3799 = fma(_3775, 100.0, _3669);
    float _3801 = -_3669;
    float _3803 = _3801 + _3793;
    float _3805 = fma(_3775, 100.0, _3793);
    float _3807 = -_2757;
    float _3809 = _3807 + _3799;
    float _3811 = _3803 * _3803;
    float _3813 = _3809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3815 = fma(_3791, _3791, _3811);
    float _3817 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3813);
    float _3819 = fma(_3797, _3797, _3815);
    float _3821 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3817);
    float _3823 = sqrt(_3819);
    float _3825 = _3821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3827 = _3809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3829 = 1.0 / _3825;
    float _3831 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3827);
    float _3833 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3831);
    bool _3835 = _3823 > 0.0;
    float _3837 = _3833 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3839 = _3837 + _3825;
    bool _3841 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3843 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3845 = _3841 || _3843;
    bool _3847 = isnan(0.5);
    bool _3849 = _3845 || _3847;
    float _3851 = _3839 * _3829;
    float _3853 = _3851 * 0.5;
    bool _3855 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3857 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.5);
    bool _3863 = _3859 || _3861;
    float _3865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3867 = fma(_3853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3865);
    float _3869 = _3775;
    float _3871 = _3793;
    float _3873 = _3759;
    float _3875 = _3761;
    float _3877 = _3809;
    float _3879 = _3787;
    if (!_3835)
    {
        _3869 = _3761;
    }
    float _3881 = _3869;
    float _3883 = _3881;
    if (!_3835)
    {
        _3871 = _3805;
    }
    float _3885 = _3871;
    float _3887 = 1.0 / _3867;
    bool _3889 = !_3835;
    float _3891 = _3885;
    float _3893 = _3885;
    float _3895 = _3887;
    if (!_3889)
    {
        float _3897 = _232 * _232;
        float _3899 = rsqrt(_3819);
        float _3901 = fma(_230, _230, _3897);
        float _3903 = fma(_234, _234, _3901);
        float _3905 = sqrt(_3903);
        float _3907 = _3791 * _3899;
        float _3909 = _3803 * _3899;
        float _3911 = _3797 * _3899;
        bool _3913 = _3905 > 0.0;
        float _3915 = _3899;
        if (!_3913)
        {
            _3891 = _3805;
        }
        float _3917 = _3891;
        _3893 = _3917;
        if (!_3913)
        {
            _3915 = _3761;
        }
        float _3919 = _3915;
        bool _3921 = !_3913;
        _3883 = _3919;
        if (!_3921)
        {
            float _3923 = rsqrt(_3903);
            float _3925 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3927 = _232 * _3923;
            float _3929 = _230 * _3923;
            float _3931 = _3909 * _3927;
            float _3933 = _234 * _3923;
            float _3935 = fma(_3907, _3929, _3931);
            float _3937 = _3925 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3939 = fma(_3911, _3933, _3935);
            float _3941 = _3939 * _3937;
            float _3943 = fma(_230, _3941, _3759);
            float _3945 = fma(_232, _3941, _3805);
            float _3947 = fma(_234, _3941, _3761);
            _3893 = _3945;
            _3873 = _3943;
            _3883 = _3947;
        }
    }
    float _3949 = _3893;
    float _3951 = _3873;
    float _3953 = _3883;
    float _3955 = -_2757;
    float _3957 = _3955 + _3949;
    float _3959 = -_2765;
    float _3961 = _3959 + _3951;
    float _3963 = -_2803;
    float _3965 = _3963 + _3953;
    float _3967 = _3957;
    float _3969 = _3961;
    float _3971 = _3965;
    float _3973 = _3951;
    if (_3863)
    {
        _3101 = 1.0;
    }
    float _3975 = _3101;
    float _3977 = _3975;
    if (!_3849)
    {
        float _3979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3981 = _3809 + _3979;
        float _3983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3985 = _3783 + _3983;
        float _3987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3989 = -_3673;
        float _3991 = _3989 + _3953;
        float _3993 = _3981 * _3981;
        float _3995 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3997 = _3787 + _3995;
        float _3999 = -_3665;
        float _4001 = _3999 + _3951;
        float _4003 = -_3799;
        float _4005 = _4003 + _3949;
        float _4007 = fma(_3985, _3985, _3993);
        float _4009 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4011 = fma(_3997, _3997, _4007);
        float _4013 = sqrt(_4011);
        float _4015 = 1.0 / _3045;
        float _4017 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4019 = precise::min(_4013, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4021 = _4019 * _3987;
        float _4023 = _4021 * _4015;
        float _4025 = _4017 * _4023;
        float _4027 = _3991 * _4023;
        float _4029 = fma(_4001, _4025, _3783);
        float _4031 = fma(_4005, _4025, _3809);
        float _4033 = fma(_4017, _4027, _3787);
        _3967 = _4031;
        _3969 = _4029;
        _3971 = _4033;
        _3973 = _4001;
    }
    float _4035 = _3967;
    float _4037 = _3969;
    float _4039 = _3971;
    float _4041 = _3973;
    float _4043 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4045 = _3887 * _4043;
    float _4047 = _4041;
    if (!_3863)
    {
        float _4049 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4051 = _4049 * 0.15915493667125701904296875;
        float _4053 = _4051 * 6.283185482025146484375;
        float _4055 = cos(_4053);
        float _4057 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4059 = _4057 * 0.15915493667125701904296875;
        float _4061 = _4051 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        float _4065 = 1.0 / _4055;
        float _4067 = _4059 * 6.283185482025146484375;
        float _4069 = cos(_4067);
        float _4071 = _4063 * _4065;
        float _4073 = _4059 * 6.283185482025146484375;
        float _4075 = sin(_4073);
        float _4077 = _4069 * _4071;
        float _4079 = 1.0 / _4077;
        float _4081 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4083 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4081;
        float _4085 = 1.0 / _4083;
        float _4087 = _4075 * _4079;
        float _4089 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4091 = fma(_4045, _4087, _4089);
        float _4093 = _4091 * _4085;
        float _4095 = precise::clamp(_4093, 0.0, 1.0);
        _242 = _4059;
        _3977 = _4095;
    }
    float _4097 = _242;
    float _4099 = _3977;
    float _4101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4103 = _4035 + _4101;
    float _4105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4107 = _4037 + _4105;
    float _4109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4111 = _4039 + _4109;
    float _4113 = _4103 * _4103;
    float _4115 = fma(_4107, _4107, _4113);
    float _4117 = fma(_4111, _4111, _4115);
    float _4119 = rsqrt(_4117);
    float _4121 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4123 = _4107 * _4121;
    float _4125 = _4111 * _4121;
    float _4127 = _4123 * _4123;
    float _4129 = _4125 * _4125;
    float _4131 = _4127 + _4129;
    float _4133 = sqrt(_4131);
    bool _4135 = _4133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4139 = _4133 + _4137;
    float _4141 = _4111;
    float _4143 = _4097;
    float _4145 = _4139;
    float _4147 = _4103;
    if (_4135)
    {
        float _4149 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4141 = _4149;
    }
    float _4151 = _4141;
    if (_4135)
    {
        float _4153 = rsqrt(_4131);
        _4143 = _4153;
    }
    float _4155 = _4143;
    float _4157 = _4155;
    if (_4135)
    {
        float _4159 = _4139 * _4151;
        _4145 = _4159;
    }
    float _4161 = _4145;
    if (_4135)
    {
        float _4163 = _4161 * 0.15915493667125701904296875;
        _4047 = _4163;
    }
    float _4165 = _4047;
    float _4167 = _4151;
    if (_4135)
    {
        float _4169 = _4165 * 6.283185482025146484375;
        float _4171 = cos(_4169);
        _4167 = _4171;
    }
    float _4173 = _4167;
    float _4175 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4177 = precise::max(0.0, _4175);
    float _4179 = _4119;
    float _4181 = _4177;
    if (_4135)
    {
        float _4183 = _4165 * 6.283185482025146484375;
        float _4185 = sin(_4183);
        _4179 = _4185;
    }
    float _4187 = _4179;
    float _4189 = -_4121;
    float _4191 = -_4177;
    float _4193 = fma(_4103, _4189, _4191);
    float _4195 = _4193;
    if (_4135)
    {
        float _4197 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4181 = _4197;
    }
    float _4199 = _4181;
    float _4201 = _4199;
    if (_4135)
    {
        float _4203 = _4173 + (-1.0);
        _4147 = _4203;
    }
    float _4205 = _4147;
    float _4207 = _4205;
    float _4209 = _4187;
    if (_4135)
    {
        float _4211 = fma(_4187, _4199, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3895 = _4211;
    }
    float _4213 = _3895;
    if (_4135)
    {
        float _4215 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4201 = _4215;
    }
    float _4217 = _4201;
    if (!_4135)
    {
        _4207 = _4127;
    }
    float _4219 = _4207;
    float _4221 = _4219;
    if (_4135)
    {
        float _4223 = _4155 * _4213;
        _3875 = _4223;
    }
    float _4225 = _3875;
    if (!_4135)
    {
        _4157 = _4123;
    }
    float _4227 = _4157;
    float _4229 = _4227;
    if (_4135)
    {
        float _4231 = fma(_4193, _4173, _4217);
        _4195 = _4231;
    }
    float _4233 = _4195;
    float _4235 = sqrt(_4117);
    float _4237 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4135)
    {
        float _4239 = _4123 * _4225;
        _4229 = _4239;
    }
    float _4241 = _4229;
    if (!_4135)
    {
        _4209 = _4125;
    }
    float _4243 = _4209;
    float _4245 = _4243;
    if (_4135)
    {
        float _4247 = _4125 * _4225;
        _4245 = _4247;
    }
    float _4249 = _4245;
    float _4251 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4135)
    {
        float _4253 = _4241 * _4241;
        _4221 = _4253;
    }
    float _4255 = _4221;
    if (!_4135)
    {
        _4237 = _4129;
    }
    float _4257 = _4237;
    float _4259 = _4257;
    if (_4135)
    {
        float _4261 = _4249 * _4249;
        _4259 = _4261;
    }
    float _4263 = _4259;
    float _4265 = fma(_4233, _4233, _4255);
    float _4267 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4269 = floor(_4251);
    float _4271 = _4265 + _4263;
    float _4273 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4267);
    float _4275 = fma(_3787, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4279 = fma(_4235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4277);
    float _4281 = precise::clamp(_4279, 0.0, 1.0);
    float _4283 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4273);
    float _4285 = rsqrt(_4271);
    float _4287 = -_4281;
    float _4289 = _4287 + 1.0;
    float _4291 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4293 = _4283 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4295 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4297 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4291);
    float _4299 = _4293 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4301 = abs(_4289);
    float _4303 = log2(_4301);
    float _4305 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4297);
    float _4309 = -_4299;
    float _4311 = fma(_4309, _4295, 1.0);
    float _4313 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4315 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4317 = _4285 * _4241;
    float _4319 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4313);
    float _4321 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4315);
    float _4323 = _4285 * _4233;
    float _4325 = _4285 * _4249;
    float _4327 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4329 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4319);
    float _4331 = _4321 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4333 = floor(_4275);
    float _4335 = -_4327;
    float _4337 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4335);
    float _4339 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4341 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4343 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4345 = -_4325;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4337);
    float _4349 = _4307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4351 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4341);
    float _4353 = -_4269;
    float _4355 = _4251 + _4353;
    float _4357 = fma(_4347, -0.5, 0.5);
    float _4359 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4351);
    float _4361 = exp2(_4343);
    float _4363 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4365 = fma(_4347, 0.5, 0.5);
    float _4367 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4359);
    float _4369 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4371 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4363);
    float _4373 = -_4333;
    float _4375 = _4275 + _4373;
    float _4377 = _4323 + 1.0;
    float _4379 = log2(_4311);
    float _4381 = fma(_4365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4383 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4369);
    float _4385 = fma(_4365, _4381, -0.212114393711090087890625);
    float _4387 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4383);
    float _4389 = 1.0 / _4367;
    float _4391 = -_4323;
    float _4393 = fma(_4361, _4377, _4391);
    float _4395 = sqrt(_4357);
    float _4397 = _4379 * 0.693147182464599609375;
    float2 _11488 = float2(_4355, _4375);
    float _4399 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11488, float2(0.0), isnan(_11488)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11488, float2(0.0), isnan(_11488)), level(0.0)).x;
    float _4401 = fma(_4365, _4385, 1.570728778839111328125);
    float _4403 = _4397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4405 = fma(_4393, 0.5, 0.5);
    float _4407 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4371);
    float _4409 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4407);
    float _4411 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4387);
    float _4413 = _4395 * 0.636619746685028076171875;
    float _4415 = _4409 * _4389;
    float _4417 = _4411 * _4389;
    float _4419 = -_4401;
    float _4421 = fma(_4413, _4419, 1.0);
    float _4423 = fma(_4415, 0.5, 0.5);
    float _4425 = fma(_4417, -0.5, 0.5);
    float3 _11540 = float3(_4423, _4425, _4403);
    float _4427 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11540, float3(0.0), isnan(_11540)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11540, float3(0.0), isnan(_11540)), level(0.0)).x;
    float3 _11551 = float3(_4423, _4425, _4403);
    float4 _4430 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11551, float3(0.0), isnan(_11551)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11551, float3(0.0), isnan(_11551)), level(0.0)).xyzw;
    float _4432 = _4430.x;
    float _4434 = _4430.y;
    float _4436 = _4430.z;
    float _4438 = _4430.w;
    float2 _11567 = float2(_4421, _4405);
    float3 _4442 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11567, float2(0.0), isnan(_11567)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11567, float2(0.0), isnan(_11567)), level(0.0)).xyz;
    float _4444 = _4442.x;
    float _4446 = _4442.y;
    float _4448 = _4442.z;
    float _4450 = abs(_4045);
    float _4452 = log2(_4450);
    float _4454 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4456 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_103.x = _3783;
    out.m_103.y = _3809;
    out.m_103.z = _3787;
    float _4458 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4454);
    bool _4460 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4462 = isnan(_4235);
    bool _4464 = _4460 || _4462;
    bool _4466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4468 = _4464 || _4466;
    bool _4470 = _4045 <= 8000.0;
    bool _4472 = isnan(_4045);
    bool _4474 = _4470 || _4472;
    bool _4476 = isnan(8000.0);
    bool _4478 = _4474 || _4476;
    float _4480 = float(_4478);
    float _4482 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4458);
    float _4484 = exp2(_4456);
    out.m_105.x = _4037;
    out.m_105.y = _4035;
    out.m_105.z = _4039;
    float _4486 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4482);
    float _4488 = _4367 * 0.5;
    float _4490 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4492 = in.m_77.x;
    float _4494 = _4409 + _4367;
    float _4496 = _4409;
    if (!_4468)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4498 = _3877;
    out.gl_Position.x = _4409;
    out.gl_Position.y = _4411;
    out.gl_Position.z = _4486;
    out.gl_Position.w = _4367;
    float _4500 = exp2(_4490);
    float _4502 = _4494 * 0.5;
    float _4504 = _4498;
    float _4506 = _4498;
    if (!_4468)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4508 = _3879;
    float _4510 = -_4484;
    float _4512 = _4510 + 1.0;
    float _4514 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4516 = -_4514;
    float _4518 = _4516 + 1.0;
    float _4520 = _4518;
    float _4522 = _4514;
    float _4524 = _4508;
    float _4526 = _4508;
    if (!_4468)
    {
        _4496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4528 = _4496;
    float _4530 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4532 = precise::clamp(_4530, 0.0, 1.0);
    float _4534 = fma(_4411, -0.5, _4488);
    float _4536 = fma(_4532, -2.0, 3.0);
    float _4538 = _4532 * _4532;
    float _4540 = _4538 * _4536;
    float _4542 = -_4540;
    float _4544 = _4542 + 1.0;
    float _4546 = fma(_4544, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4540);
    float _4548 = _4486 + _4367;
    float _4550 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4552 = _4480 * _4546;
    float _4554 = _4548 * 0.5;
    float _4556 = _4552 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4502;
    out.m_107.y = _4534;
    out.m_107.z = _4554;
    out.m_107.w = _4367;
    float _4558 = -_4399;
    float _4560 = _4558 + 1.0;
    float _4562 = _4560 * _4556;
    float _4564 = precise::clamp(_4562, 0.0, 1.0);
    float _4566 = -_4564;
    float _4568 = fma(_4566, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4570 = _4568 * _4492;
    float _4572 = _4570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_109.x = _4572;
    float _4574 = _4514 * _4427;
    float _4576 = _4438 * _4518;
    float _4578 = _4528;
    float _4580 = _4528;
    if (!_4468)
    {
        _4520 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4582 = _4520;
    float _4584 = _4438 * _4574;
    float _4586 = _4448 * _4574;
    float _4588 = _4584;
    float _4590 = _4582;
    float _4592 = _4582;
    if (!_4468)
    {
        _4522 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4594 = _4522;
    float _4596 = fma(_4444, _4584, _4432);
    float _4598 = fma(_4446, _4584, _4434);
    float _4600 = fma(_4438, _4586, _4436);
    float _4602 = _4594;
    float _4604 = _4594;
    if (!_4468)
    {
        _4588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4606 = _4588;
    out.m_111.x = _4596;
    out.m_111.y = _4598;
    out.m_111.z = _4600;
    out.m_111.w = _4576;
    bool _4608 = !_4468;
    float _4610 = _4606;
    float _4612 = _4606;
    if (!_4608)
    {
        bool _4614 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4616 = isnan(_4235);
        bool _4618 = _4614 || _4616;
        bool _4620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4622 = _4618 || _4620;
        if (!_4622)
        {
            float _4624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4626 = _4235 + _4624;
            float _4628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4628;
            float _4632 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4634 = _4632 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4636 = 1.0 / _4630;
            float _4638 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4640 = _4638 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4644 = _4642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4648 = _4646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4652 = _4650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4654 = _4626 * _4636;
            float _4656 = precise::clamp(_4654, 0.0, 1.0);
            float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4660 = _4658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4662 = fma(_4656, _4634, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4664 = fma(_4656, _4660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4666 = fma(_4656, _4640, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4668 = fma(_4656, _4644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4670 = fma(_4656, _4648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4672 = fma(_4656, _4652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4580 = _4662;
            _4604 = _4670;
            _4506 = _4666;
            _4592 = _4668;
            _4526 = _4664;
            _4612 = _4672;
            _4674 = true;
        }
        else
        {
            bool _4676 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4678 = isnan(_4235);
            bool _4680 = _4676 || _4678;
            bool _4682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4684 = _4680 || _4682;
            if (!_4684)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4686 = _4504;
            _4506 = _4686;
            if (!_4684)
            {
                _4578 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4688 = _4578;
            _4580 = _4688;
            if (!_4684)
            {
                _4524 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4690 = _4524;
            _4526 = _4690;
            if (!_4684)
            {
                _4590 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4692 = _4590;
            _4592 = _4692;
            if (!_4684)
            {
                _4602 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4694 = _4602;
            _4604 = _4694;
            if (!_4684)
            {
                _4610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4696 = _4610;
            bool _4698 = !_4684;
            _4612 = _4696;
            if (!_4698)
            {
                bool _4700 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4702 = isnan(_4235);
                bool _4704 = _4700 || _4702;
                bool _4706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4708 = _4704 || _4706;
                if (!_4708)
                {
                    float _4710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4712 = _4235 + _4710;
                    float _4714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4714;
                    float _4718 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4720 = _4718 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4722 = 1.0 / _4716;
                    float _4724 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4726 = _4724 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4730 = _4728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4734 = _4732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4738 = _4736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4740 = _4712 * _4722;
                    float _4742 = precise::clamp(_4740, 0.0, 1.0);
                    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4748 = fma(_4742, _4720, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4750 = fma(_4742, _4746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4752 = fma(_4742, _4726, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4754 = fma(_4742, _4730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4756 = fma(_4742, _4734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4758 = fma(_4742, _4738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4580 = _4748;
                    _4604 = _4756;
                    _4506 = _4752;
                    _4592 = _4754;
                    _4526 = _4750;
                    _4612 = _4758;
                    _4674 = true;
                }
                else
                {
                    _4580 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4604 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4592 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4526 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4674 = false;
    float _4760 = _4580;
    float _4762 = _4604;
    float _4764 = _4506;
    float _4766 = _4592;
    float _4768 = _4526;
    float _4770 = _4612;
    float _4772 = fma(_3649, -0.5, 0.5);
    float _4774 = precise::clamp(_4772, 0.0, 1.0);
    float _4776 = -_4760;
    float _4778 = _4776 + _4762;
    float _4780 = _4550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4782 = -_4764;
    float _4784 = _4782 + _4766;
    float _4786 = fma(_4774, _4778, _4760);
    out.m_113.x = 0.0;
    float _4788 = -_4768;
    float _4790 = _4788 + _4770;
    float _4792 = fma(_4774, _4784, _4764);
    float _4794 = _4786 * 0.586610972881317138671875;
    out.m_53.x = _4780;
    bool _4796 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4798 = fma(_4774, _4790, _4768);
    float _4800 = fma(_4792, 0.298911988735198974609375, _4794);
    bool _4802 = _4099 > 0.0;
    bool _4804 = isnan(_4099);
    bool _4806 = _4802 || _4804;
    bool _4808 = isnan(0.0);
    bool _4810 = _4806 || _4808;
    float _4812 = fma(_4798, 0.114477999508380889892578125, _4800);
    float _4814 = -_4812;
    float _4816 = _4792 + _4814;
    float _4818 = -_4812;
    float _4820 = _4786 + _4818;
    float _4822 = -_4812;
    float _4824 = _4798 + _4822;
    float _4826 = fma(_4816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    float _4828 = fma(_4820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    float _4830 = fma(_4824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    bool _4832 = !_4796;
    if (!_4832)
    {
        float _4834 = -_4035;
        float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4838 = -_4037;
        float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4842 = -_4039;
        float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4846 = _4836 * _4836;
        float _4848 = fma(_4840, _4840, _4846);
        float _4850 = fma(_4844, _4844, _4848);
        float _4852 = sqrt(_4850);
        float _4854 = rsqrt(_4850);
        float _4856 = -_4852;
        float _4858 = _4856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4860 = _4858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4862 = precise::clamp(_4860, 0.0, 1.0);
        float _4864 = _4840 * _4854;
        float _4866 = _4836 * _4854;
        float _4868 = abs(_4862);
        float _4870 = log2(_4868);
        float _4872 = _4844 * _4854;
        float _4874 = _4864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4876 = _3649 * _4866;
        float _4878 = -_4866;
        float _4880 = -_4874;
        float _4882 = fma(_4878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4880);
        float _4884 = fma(_3653, _4864, _4876);
        float _4886 = -_4872;
        float _4888 = fma(_4886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4882);
        float _4890 = fma(_3661, _4872, _4884);
        float _4892 = precise::clamp(_4890, 0.0, 1.0);
        float _4894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4896 = _4888 + _4894;
        float _4898 = _4870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4900 = _4896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4902 = precise::clamp(_4900, 0.0, 1.0);
        float _4904 = exp2(_4898);
        float _4906 = _4904 * _4902;
        float _4908 = _4892 * _4906;
        float _4910 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4912 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4914 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4910;
        out.m_113.y = _4912;
        out.m_113.z = _4914;
    }
    out.m_79.x = _4826;
    out.m_79.y = _4828;
    out.m_79.z = _4830;
    if (_4810)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _4916 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4916;
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
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4674 = false;
    bool _3719 = false;
    bool _742 = false;
    bool _638 = false;
    bool _496 = false;
    bool _262 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = trunc(_127);
    int _132 = int(_129);
    bool _136 = _132 >= 1;
    float _138 = 0.0;
    if (!_136)
    {
        _138 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _140 = _138;
    float _142 = _140;
    if (!_136)
    {
        out.m_53.x = 0.0;
    }
    int _144 = 0;
    if (!_136)
    {
        float _146 = _140 * 5.0;
        _144 = as_type<int>(_146);
    }
    int _148 = _144;
    int _150 = _148;
    if (!_136)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4973 = as_type<float>(_148);
        out.gl_Position.z = _4973;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_55.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = _166;
    if (_162)
    {
        float _170 = float(_132);
        _142 = _170;
    }
    float _172 = _142;
    bool _174 = _166 >= _172;
    bool _176 = !_162;
    bool _178 = _174 || _176;
    float _180 = _172;
    if (_178)
    {
        _180 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _180;
    if (_178)
    {
        out.m_53.x = 0.0;
    }
    if (_178)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_178)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5043 = as_type<float>(_186);
        out.gl_Position.z = _5043;
    }
    if (_178)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_57.x;
    bool _190 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _192 = in.m_57.y;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = in.m_63.x;
    float _208 = in.m_63.y;
    float _210 = in.m_63.z;
    float _212 = in.m_65.x;
    float _214 = in.m_65.y;
    float _216 = in.m_65.z;
    out.m_67.x = _188;
    out.m_67.y = _192;
    float _218 = _196 * _202;
    float _220 = _196 * _208;
    float _222 = fma(_194, _200, _218);
    float _224 = _196 * _214;
    float _226 = fma(_194, _206, _220);
    float _228 = fma(_194, _212, _224);
    float _230 = fma(_198, _204, _222);
    float _232 = fma(_198, _210, _226);
    float _234 = fma(_198, _216, _228);
    bool _236 = !_190;
    float _238 = _192;
    float _240 = _188;
    float _242 = _234;
    float _260;
    if (!_236)
    {
        float _244 = in.m_69.x;
        float _246 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _248 = _244 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _250 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _252 = _250 * _246;
        float _254 = floor(_252);
        float _256 = -_254;
        float _258 = _252 + _256;
        _260 = _258;
        _262 = true;
    }
    else
    {
        float _264 = float(_132);
        float _266 = 1.0 / _264;
        float _268 = _166 * _266;
        _260 = _268;
    }
    _262 = false;
    float _270 = _260;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _274 = _270 + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = _270 + _276;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _282 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _286 = _284 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _288;
    bool _292 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _294 = isnan(_270);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _270 + _304;
    float _308 = 1.0 / _286;
    float _310 = -_302;
    float _312 = _310 + 1.0;
    float _314 = 1.0 / _282;
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _318 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _316;
    bool _320 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _322 = 1.0 / _290;
    float _324 = _274 * _308;
    bool _326 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _328 = isnan(_270);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = _336 * _312;
    float _340 = _278 * _314;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _346;
    float _350 = -_336;
    float _352 = _350 + 1.0;
    float _354 = fma(_348, _340, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _358 = _356 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _360 = _306 * _322;
    float _362 = fma(_318, _340, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _364 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _366 = isnan(_270);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = fma(_344, _340, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _382 = _270 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _384 = isnan(_270);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _396 = _394 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _398 = _374 * _352;
    float _400 = -_374;
    float _402 = _400 + 1.0;
    float _404 = fma(_358, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _406 = fma(_380, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _408 = fma(_396, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _410 = _392 * _402;
    float _412 = -_392;
    float _414 = _412 + 1.0;
    float _416 = in.m_71.x;
    float _418 = in.m_71.y;
    float _420 = in.m_71.z;
    float _422 = _354 * _410;
    float _424 = _376 * _410;
    float _426 = _362 * _410;
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _428;
    float _432 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].x, _422);
    float _434 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].y, _424);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _438 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _436;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _440;
    float _444 = fma(_414, (*spvDescriptorSet0.vp_c9)._m0[143].z, _426);
    float _446 = fma(_430, _360, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _448 = fma(_404, _398, _434);
    float _450 = fma(_438, _360, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _452 = fma(_442, _360, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _454 = fma(_408, _398, _432);
    float _456 = fma(_406, _398, _444);
    float _458 = fma(_446, _338, _448);
    float _460 = fma(_450, _338, _454);
    float _462 = fma(_452, _338, _456);
    float _464 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].y, _458);
    float _466 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].x, _460);
    float _468 = fma(_302, (*spvDescriptorSet0.vp_c9)._m0[146].z, _462);
    float _470 = _464 * _418;
    float _472 = _466 * _416;
    float _474 = _468 * _420;
    bool _476 = !_320;
    float _494;
    if (!_476)
    {
        float _478 = in.m_69.x;
        float _480 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _482 = _478 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _484 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _486 = _484 * _480;
        float _488 = floor(_486);
        float _490 = -_488;
        float _492 = _486 + _490;
        _494 = _492;
        _496 = true;
    }
    else
    {
        float _498 = float(_132);
        float _500 = 1.0 / _498;
        float _502 = _166 * _500;
        _494 = _502;
    }
    _496 = false;
    float _504 = _494;
    float _506 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _508 = _504 + _506;
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _514 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _516 = isnan(_504);
    bool _518 = _514 || _516;
    bool _520 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _522 = _518 || _520;
    float _524 = float(_522);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _532 = isnan(_504);
    bool _534 = _530 || _532;
    bool _536 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _538 = _534 || _536;
    float _540 = float(_538);
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _542;
    bool _546 = _504 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _548 = isnan(_504);
    bool _550 = _546 || _548;
    bool _552 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _554 = _550 || _552;
    float _556 = float(_554);
    float _558 = 1.0 / _512;
    float _560 = -_524;
    float _562 = _560 + 1.0;
    bool _564 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _566 = _540 * _562;
    float _568 = -_540;
    float _570 = _568 + 1.0;
    float _572 = 1.0 / _528;
    float _574 = _544 * _558;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _578 = _576 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _580 = fma(_574, _508, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _582 = -_556;
    float _584 = _582 + 1.0;
    float _586 = _580 * _566;
    float _588 = _578 * _572;
    float _590 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _592 = _504 + _590;
    float _594 = _524 * _584;
    float _596 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[115].x, _586);
    float _598 = fma(_588, _592, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _600 = fma(_598, _594, _596);
    float _602 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _608 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[117].x, _600);
    float _610 = _602 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _612 = _604 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_73.x = _610;
    out.m_73.y = _612;
    out.m_73.z = _614;
    out.m_73.w = _616;
    bool _618 = !_564;
    float _636;
    if (!_618)
    {
        float _620 = in.m_69.x;
        float _622 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _624 = _620 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _626 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _628 = _626 * _622;
        float _630 = floor(_628);
        float _632 = -_630;
        float _634 = _628 + _632;
        _636 = _634;
        _638 = true;
    }
    else
    {
        float _640 = float(_132);
        float _642 = 1.0 / _640;
        float _644 = _166 * _642;
        _636 = _644;
    }
    _638 = false;
    float _646 = _636;
    bool _648 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _650 = isnan(_646);
    bool _652 = _648 || _650;
    bool _654 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _656 = _652 || _654;
    float _658 = float(_656);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _662 = _660 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _664 = _646 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _666 = isnan(_646);
    bool _668 = _664 || _666;
    bool _670 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _672 = _668 || _670;
    float _674 = float(_672);
    float _676 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _676;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _682 = _646 + _680;
    float _684 = -_658;
    float _686 = _684 + 1.0;
    bool _688 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _690 = 1.0 / _662;
    float _692 = _674 * _686;
    float _694 = -_674;
    float _696 = _694 + 1.0;
    float _698 = _678 * _690;
    float _700 = fma(_698, _682, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _702 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _704 = _700 * _692;
    float _706 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[131].x, _704);
    float _710 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _712 = _702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _714 = fma(_658, (*spvDescriptorSet0.vp_c9)._m0[132].x, _708);
    float _716 = _706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _718 = _710 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _720 = _714 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_75.x = _716;
    out.m_75.y = _712;
    out.m_75.z = _718;
    out.m_75.w = _720;
    bool _722 = !_688;
    float _740;
    if (!_722)
    {
        float _724 = in.m_69.x;
        float _726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _728 = _724 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _730 = fma(_728, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _732 = _730 * _726;
        float _734 = floor(_732);
        float _736 = -_734;
        float _738 = _732 + _736;
        _740 = _738;
        _742 = true;
    }
    else
    {
        float _744 = float(_132);
        float _746 = 1.0 / _744;
        float _748 = _166 * _746;
        _740 = _748;
    }
    _742 = false;
    float _750 = _740;
    float _752 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _754 = int(_752);
    float _756 = in.m_69.x;
    float _758 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _760 = _750 + _758;
    float _762 = float(_132);
    float _764 = in.m_77.y;
    int _766 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _768 = _766 != 0;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _772 = _750 + _770;
    float _774 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _776 = int(_774);
    float _778 = in.m_61.w;
    float _780 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _782 = _750 + _780;
    float _784 = _472 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _786 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _788 = int(_786);
    float _790 = float(_754);
    float _792 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _794 = _792 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _796 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _798 = isnan(_750);
    bool _800 = _796 || _798;
    bool _802 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _804 = _800 || _802;
    float _806 = float(_804);
    bool _808 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _810 = isnan(_750);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = 1.0 / _790;
    float _822 = float(uint(_776));
    int _824 = ~_776;
    int _826 = _824 + 1;
    bool _828 = _776 == 0;
    float _830 = 1.0 / _822;
    int _832 = ~_776;
    int _834 = _832 + 1;
    float _836 = float(_788);
    float _838 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _840 = _820 * _166;
    float _842 = 1.0 / _836;
    int _844 = as_type<int>(_830) + (-2);
    float _846 = trunc(_840);
    int _848 = int(_846);
    float _850 = float(_776);
    float _852 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _854 = int(_852);
    float _856 = _842 * _166;
    float _858 = float(uint(_848));
    float _860 = trunc(_856);
    int _862 = int(_860);
    float _864 = as_type<float>(_844) * _858;
    float _866 = float(uint(_854));
    float _868 = 1.0 / _762;
    int _870 = ~_854;
    int _872 = _870 + 1;
    float _874 = trunc(_864);
    float _876 = precise::max(_874, 0.0);
    uint _879 = uint(_876);
    float _881 = 1.0 / _866;
    int _883 = _834 * int(_879);
    int _885 = _883 + _848;
    float _887 = 1.0 / _794;
    float _889 = float(uint(_885));
    int _891 = as_type<int>(_881) + (-2);
    float _893 = as_type<float>(_844) * _889;
    float _895 = _889;
    int _897 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    float _899 = as_type<float>(_854);
    if (_768)
    {
        _895 = 1.0;
    }
    float _901 = _895;
    float _903 = _901;
    if (!_768)
    {
        _903 = 7.345489978790283203125;
    }
    float _905 = _903;
    float _907 = trunc(_893);
    float _909 = precise::max(_907, 0.0);
    uint _911 = uint(_909);
    float _913 = _905 * _756;
    float _915 = floor(_913);
    int _917 = int(_879) + int(_911);
    float _919 = float(_848);
    float _921 = float(uint(_862));
    int _923 = _826 * _917;
    int _925 = _923 + _848;
    bool _927 = _919 >= _850;
    bool _929 = isnan(_919);
    bool _931 = _927 || _929;
    bool _933 = isnan(_850);
    bool _935 = _931 || _933;
    float _937 = float(_935);
    float _939 = -_915;
    float _941 = _913 + _939;
    float _943 = as_type<float>(_891) * _921;
    bool _945 = uint(_925) >= uint(_776);
    float _947 = trunc(_937);
    int _949 = int(_947);
    bool _951 = !_945;
    int _953 = _951 ? 0 : (-1);
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _965 = _963 != 0;
    int _967 = ~_917;
    int _969 = _967 + _953;
    int _971 = _969 + 1;
    float _973 = trunc(_943);
    float _975 = precise::max(_973, 0.0);
    uint _977 = uint(_975);
    float _979 = in.m_69.y;
    float _981 = _850 * _166;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _985 = _983 != 0;
    int _987 = _776 * _971;
    int _989 = _987 + _848;
    float _991 = _981 * _868;
    int _993 = ~_949;
    int _995 = _993 + 1;
    int _997 = _995 + 1;
    bool _999 = !_828;
    float _1001 = _999 ? as_type<float>(_989) : as_type<float>(0xffffffffu /* nan */);
    float _1003 = _941 * _850;
    float _1005 = _941;
    float _1007 = _1001;
    if (_768)
    {
        _1005 = _756;
    }
    float _1009 = _1005;
    float _1011 = trunc(_991);
    int _1013 = int(_1011);
    int _1015 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1017 = _1015 != 0;
    int _1019 = as_type<int>(_1001) * _997;
    float _1021 = _1009;
    if (_768)
    {
        _1007 = 1.0;
    }
    float _1023 = _1007;
    float _1025 = _1023;
    if (!_768)
    {
        _1025 = 1.2345600128173828125;
    }
    float _1027 = _1025;
    int _1029 = _872 * int(_977);
    int _1031 = _1029 + _862;
    int _1033 = _776 + (-1);
    float _1035 = trunc(_1003);
    int _1037 = int(_1035);
    if (!_768)
    {
        _1021 = _979;
    }
    float _1039 = _1021;
    float _1041 = float(uint(_1031));
    int _1043 = _949 * _1033;
    int _1045 = _1043 + _1019;
    bool _1047 = !_985;
    int _1049 = _1047 ? 0 : 1;
    float _1051 = _1039 * _1027;
    bool _1053 = !_961;
    int _1055 = _1053 ? 0 : 1;
    float _1057 = as_type<float>(_891) * _1041;
    bool _1059 = !_957;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = abs(_1049);
    int _1065 = abs(_1055);
    float _1067 = trunc(_1057);
    float _1069 = precise::max(_1067, 0.0);
    uint _1071 = uint(_1069);
    bool _1073 = !_965;
    int _1075 = _1073 ? 0 : 1;
    int _1077 = abs(_1061);
    int _1079 = _1045 * _1065;
    int _1081 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1083 = _1081 != 0;
    float _1085 = floor(_1051);
    int _1087 = abs(_1075);
    int _1089 = _1037 * _1063;
    int _1091 = _1089 + _848;
    bool _1093 = !_1083;
    int _1095 = _1093 ? 0 : 1;
    bool _1097 = _854 == 0;
    int _1099 = _1013 * _1077;
    int _1101 = _1099 + _1079;
    int _1103 = abs(_1095);
    int _1105 = int(_977) + int(_1071);
    int _1107 = _1091 * _1087;
    int _1109 = _1107 + _1101;
    int _1111 = ~_854;
    int _1113 = _1111 + 1;
    float _1115 = -_1085;
    float _1117 = _1051 + _1115;
    float _1119 = float(_854);
    int _1121 = _1037 * _1103;
    int _1123 = _1121 + _1109;
    float _1125 = float(_862);
    int _1127 = _1113 * _1105;
    int _1129 = _1127 + _862;
    float _1131 = _1119 * _1117;
    bool _1133 = _1125 >= _1119;
    bool _1135 = isnan(_1125);
    bool _1137 = _1133 || _1135;
    bool _1139 = isnan(_1119);
    bool _1141 = _1137 || _1139;
    float _1143 = float(_1141);
    float _1145 = float(uint(_1123));
    bool _1147 = uint(_1129) >= uint(_854);
    float _1149 = trunc(_1131);
    int _1151 = int(_1149);
    float _1153 = as_type<float>(_844) * _1145;
    bool _1155 = !_1147;
    int _1157 = _1155 ? 0 : (-1);
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1161 = _1159 != 0;
    int _1163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1165 = _1163 != 0;
    int _1167 = ~_1105;
    int _1169 = _1167 + _1157;
    int _1171 = _1169 + 1;
    float _1173 = trunc(_1143);
    int _1175 = int(_1173);
    int _1177 = ~_776;
    int _1179 = _1177 + 1;
    int _1181 = _854 * _1171;
    int _1183 = _1181 + _862;
    float _1185 = _1119 * _166;
    float _1187 = trunc(_1153);
    float _1189 = precise::max(_1187, 0.0);
    uint _1191 = uint(_1189);
    float _1193 = _1185 * _868;
    bool _1195 = !_1097;
    int _1197 = _1195 ? _1183 : (-1);
    int _1199 = ~_1175;
    int _1201 = _1199 + 1;
    int _1203 = _1201 + 1;
    float _1205 = trunc(_1193);
    int _1207 = int(_1205);
    bool _1209 = !_1161;
    int _1211 = _1209 ? 0 : 1;
    int _1213 = _1203 * _1197;
    int _1215 = _854 + (-1);
    int _1217 = _1179 * int(_1191);
    int _1219 = _1217 + _1123;
    bool _1221 = !_1017;
    int _1223 = _1221 ? 0 : 1;
    int _1225 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1227 = _1225 != 0;
    int _1229 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1231 = _1229 != 0;
    int _1233 = _1175 * _1215;
    int _1235 = _1233 + _1213;
    float _1237 = float(uint(_1219));
    bool _1239 = !_1165;
    int _1241 = _1239 ? 0 : 1;
    bool _1243 = !_1227;
    int _1245 = _1243 ? 0 : 1;
    float _1247 = as_type<float>(_844) * _1237;
    int _1249 = abs(_1241);
    int _1251 = abs(_1223);
    float _1253 = trunc(_1247);
    float _1255 = precise::max(_1253, 0.0);
    uint _1257 = uint(_1255);
    int _1259 = abs(_1211);
    int _1261 = _1235 * _1249;
    int _1263 = abs(_1245);
    bool _1265 = !_1231;
    int _1267 = _1265 ? 0 : 1;
    int _1269 = _1151 * _1251;
    int _1271 = _1269 + _862;
    int _1273 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1275 = _1273 != 0;
    int _1277 = _1207 * _1259;
    int _1279 = _1277 + _1261;
    int _1281 = abs(_1267);
    float _1283 = in.m_69.z;
    int _1285 = ~_776;
    int _1287 = _1285 + 1;
    int _1289 = _1271 * _1263;
    int _1291 = _1289 + _1279;
    int _1293 = int(_1191) + int(_1257);
    float _1295 = in.m_69.w;
    int _1297 = _1151 * _1281;
    int _1299 = _1297 + _1291;
    int _1301 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1303 = _1301 != 0;
    int _1305 = ~_854;
    int _1307 = _1305 + 1;
    int _1309 = _1287 * _1293;
    int _1311 = _1309 + _1123;
    float _1313 = float(uint(_1299));
    int _1315 = _1281;
    float _1317 = as_type<float>(_1207);
    int _1319 = _1279;
    float _1321 = as_type<float>(_1151);
    if (_1275)
    {
        float _1323 = -_188;
        float _1325 = _1323 + 1.0;
        _1315 = as_type<int>(_1325);
    }
    int _1327 = _1315;
    if (!_1275)
    {
        _1317 = _188;
    }
    float _1329 = _1317;
    bool _1331 = uint(_1311) >= uint(_776);
    float _1333 = as_type<float>(_891) * _1313;
    bool _1335 = _776 == 0;
    bool _1337 = !_1331;
    int _1339 = _1337 ? 0 : (-1);
    float _1341 = trunc(_1333);
    float _1343 = precise::max(_1341, 0.0);
    uint _1345 = uint(_1343);
    bool _1347 = _1331;
    float _1349 = _1329;
    if (_1275)
    {
        bool _1351 = _756 > 0.5;
        _1347 = _1351;
    }
    bool _1353 = _1347;
    if (_1303)
    {
        float _1355 = -_188;
        float _1357 = _1355 + 1.0;
        _1319 = as_type<int>(_1357);
    }
    int _1359 = _1319;
    int _1361 = ~_1293;
    int _1363 = _1361 + _1339;
    int _1365 = _1363 + 1;
    if (_1275)
    {
        float _1367 = _1353 ? as_type<float>(_1327) : _188;
        _1349 = _1367;
    }
    float _1369 = _1349;
    bool _1371 = _979 > 0.5;
    int _1373 = _776 * _1365;
    int _1375 = _1373 + _1123;
    float _1377 = -_192;
    float _1379 = _1377 + 1.0;
    int _1381 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1383 = _1381 != 0;
    bool _1385 = _1283 > 0.5;
    int _1387 = _1371 ? as_type<int>(_1379) : as_type<int>(_192);
    int _1389 = _1307 * int(_1345);
    int _1391 = _1389 + _1299;
    bool _1393 = _1295 > 0.5;
    bool _1395 = !_1335;
    int _1397 = _1395 ? _1375 : (-1);
    float _1399 = float(uint(_1391));
    if (!_1303)
    {
        _1321 = _188;
    }
    float _1401 = _1321;
    float _1403 = _1401;
    if (_1303)
    {
        float _1405 = _1385 ? as_type<float>(_1359) : _188;
        _1403 = _1405;
    }
    float _1407 = _1403;
    float _1409 = as_type<float>(_891) * _1399;
    float _1411 = _1383 ? as_type<float>(_1387) : _192;
    int _1413 = _1397 & 3;
    bool _1415 = _1413 != 0;
    float _1417 = trunc(_1409);
    float _1419 = precise::max(_1417, 0.0);
    uint _1421 = uint(_1419);
    int _1423 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1425 = _1423 != 0;
    int _1427 = _1393 ? as_type<int>(_1379) : as_type<int>(_192);
    int _1429 = _1397 & 3;
    bool _1431 = _1429 != 0;
    int _1433 = _1415 ? 0 : 1;
    float _1435 = _1425 ? as_type<float>(_1427) : _192;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1439 = _1437 != 0;
    bool _1441 = uint(_1429) > 1u;
    int _1443 = ~_1433;
    int _1445 = _1443 + 1;
    int _1447 = _1445 + 1;
    int _1449 = int(_1345) + int(_1421);
    int _1451 = ~_854;
    int _1453 = _1451 + 1;
    int _1455 = _1447;
    if (_1439)
    {
        float _1457 = _1385 ? _1379 : _192;
        _238 = _1457;
    }
    float _1459 = _238;
    int _1461 = _1453 * _1449;
    int _1463 = _1461 + _1299;
    float _1465 = as_type<float>(_1463);
    if (!_1441)
    {
        int _1467 = ~_1433;
        int _1469 = _1467 + 1;
        _1455 = _1469;
    }
    int _1471 = _1455;
    float _1473 = in.m_50.x;
    float _1475 = in.m_50.y;
    float _1477 = in.m_50.z;
    bool _1479 = _1429 != 3;
    bool _1481 = uint(_1429) >= 2u;
    int _1483 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1485 = _1483 != 0;
    int _1487 = _1481 ? 0 : 1;
    bool _1489 = _979 > 0.5;
    bool _1491 = _1489 && _1485;
    int _1493 = ~_1487;
    int _1495 = _1493 + 1;
    int _1497 = _1495 + 1;
    int _1499 = _1497;
    if (_1479)
    {
        int _1501 = ~_1487;
        int _1503 = _1501 + 1;
        _1499 = _1503;
    }
    int _1505 = _1499;
    bool _1507 = uint(_1463) >= uint(_854);
    if (!_1485)
    {
        _1465 = _188;
    }
    float _1509 = _1465;
    bool _1511 = !_1507;
    int _1513 = _1511 ? 0 : (-1);
    float _1515 = _1509;
    if (_1491)
    {
        float _1517 = -_188;
        float _1519 = _1517 + 1.0;
        _240 = _1519;
    }
    float _1521 = _240;
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1525 = _1523 != 0;
    float _1527 = _214 * _1475;
    float _1529 = _202 * _1475;
    float _1531 = _208 * _1475;
    float _1533 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1535 = _1533 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1537 = fma(_200, _1473, _1529);
    float _1539 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1541 = _1539 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1543 = fma(_206, _1473, _1531);
    float _1545 = 1.0 / _1535;
    float _1547 = fma(_212, _1473, _1527);
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1551 = _1549 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1553 = fma(_204, _1477, _1537);
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1555;
    float _1559 = float(uint(_1091));
    float _1561 = _1475 + _764;
    float _1563 = 1.0 / _1541;
    float _1565 = _1557 * _887;
    float _1567 = as_type<float>(_844) * _1559;
    int _1569 = ~_1449;
    int _1571 = _1569 + _1513;
    int _1573 = _1571 + 1;
    float _1575 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _1577 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1579 = _1577 != 0;
    float _1581 = _756 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1585 = _1583 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1587 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1589 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1587;
    int _1591 = _854 * _1573;
    int _1593 = _1591 + _1299;
    float _1595 = -_1575;
    float _1597 = fma(_1581, 2.0, _1595);
    float _1599 = trunc(_1567);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1607 = _979 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1609 = _1585 * _1545;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1613 = _1611 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1615 = _1589 * _1563;
    if (_1485)
    {
        _1515 = _1521;
    }
    float _1617 = _1515;
    float _1619 = fma(_1607, -2.0, _1605);
    bool _1621 = !_1097;
    float _1623 = _1621 ? as_type<float>(_1593) : as_type<float>(0xffffffffu /* nan */);
    float _1625 = fma(_210, _1477, _1543);
    float _1627 = float(uint(_1271));
    float _1629 = 1.0 / _1613;
    int _1631 = ~_776;
    int _1633 = _1631 + 1;
    float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1637 = _1635 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1639 = fma(_216, _1477, _1547);
    float _1641 = as_type<float>(_891) * _1627;
    int _1643 = _1633 * int(_1603);
    int _1645 = _1643 + _1091;
    int _1647 = ~_854;
    int _1649 = _1647 + 1;
    float _1651 = 1.0 / _1551;
    int _1653 = as_type<int>(_1623) & 3;
    bool _1655 = _1653 != 0;
    float _1657 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1659 = _1657 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1661 = float(uint(_1645));
    float _1663 = _1553 + _778;
    int _1665 = _1655 ? 0 : 1;
    float _1667 = -_166;
    float _1669 = fma(_1667, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1597);
    bool _1671 = uint(_1653) >= 2u;
    float _1673 = trunc(_1641);
    float _1675 = precise::max(_1673, 0.0);
    uint _1677 = uint(_1675);
    float _1679 = as_type<float>(_844) * _1661;
    int _1681 = _1671 ? 0 : 1;
    bool _1683 = _1653 != 3;
    float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1687 = _1685 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1689 = 1.0 / _1659;
    int _1691 = ~_1681;
    int _1693 = _1691 + 1;
    int _1695 = _1693 + 1;
    float _1697 = _1637 * _1651;
    int _1699 = ~_1665;
    int _1701 = _1699 + 1;
    int _1703 = _1701 + 1;
    bool _1705 = !_1525;
    int _1707 = _1705 ? 0 : 1;
    int _1709 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1711 = _1709 != 0;
    float _1713 = trunc(_1679);
    float _1715 = precise::max(_1713, 0.0);
    uint _1717 = uint(_1715);
    int _1719 = _1695;
    int _1721 = _1703;
    float _1723 = _1625;
    float _1725 = _1623;
    float _1727 = _1619;
    if (_1683)
    {
        int _1729 = ~_1681;
        int _1731 = _1729 + 1;
        _1719 = _1731;
    }
    int _1733 = _1719;
    int _1735 = _1649 * int(_1677);
    int _1737 = _1735 + _1271;
    bool _1739 = uint(_1653) > 1u;
    float _1741 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1741;
    float _1745 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1747 = _1745 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1749 = 1.0 / _1687;
    float _1751 = float(uint(_1737));
    float _1753 = _1743 * _1629;
    float _1755 = _756 * 2.0;
    float _1757 = _1747 * _1689;
    float _1759 = _756 + _979;
    float _1761 = as_type<float>(_891) * _1751;
    float _1763 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1765 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1763;
    float _1767 = floor(_1755);
    int _1769 = int(_1603) + int(_1717);
    float _1771 = _1759 + (-1.0);
    float _1773 = _979 * 2.0;
    int _1775 = ~_776;
    int _1777 = _1775 + 1;
    float _1779 = fma(_1757, _760, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    if (!_1739)
    {
        int _1781 = ~_1665;
        int _1783 = _1781 + 1;
        _1721 = _1783;
    }
    int _1785 = _1721;
    float _1787 = fma(_1771, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1789 = trunc(_1761);
    float _1791 = precise::max(_1789, 0.0);
    uint _1793 = uint(_1791);
    float _1795 = _979 + _1283;
    float _1797 = _1765 * _1749;
    int _1799 = _1777 * _1769;
    int _1801 = _1799 + _1091;
    int _1803 = ~_854;
    int _1805 = _1803 + 1;
    float _1807 = _1795 + (-1.0);
    float _1809 = fma(_1797, _782, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    bool _1811 = _1767 > 0.0;
    float _1813 = floor(_1773);
    bool _1815 = _1767 >= 0.0;
    bool _1817 = isnan(_1767);
    bool _1819 = _1815 || _1817;
    bool _1821 = isnan(0.0);
    bool _1823 = _1819 || _1821;
    float _1825 = fma(_1807, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1827 = _1283 * 2.0;
    bool _1829 = !_1579;
    int _1831 = _1829 ? 0 : 1;
    int _1833 = _1823 ? 0 : 1;
    int _1835 = int(_1677) + int(_1793);
    bool _1837 = uint(_1801) >= uint(_776);
    int _1839 = ~_1833;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    int _1845 = _1805 * _1835;
    int _1847 = _1845 + _1271;
    int _1849 = _1843;
    if (!_1811)
    {
        int _1851 = ~_1833;
        int _1853 = _1851 + 1;
        _1849 = _1853;
    }
    int _1855 = _1849;
    bool _1857 = !_1837;
    int _1859 = _1857 ? 0 : (-1);
    bool _1861 = uint(_1847) >= uint(_854);
    float _1863 = floor(_1827);
    bool _1865 = _1813 > 0.0;
    bool _1867 = _1813 >= 0.0;
    bool _1869 = isnan(_1813);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(0.0);
    bool _1875 = _1871 || _1873;
    int _1877 = ~_1769;
    int _1879 = _1877 + _1859;
    int _1881 = _1879 + 1;
    int _1883 = as_type<int>(_1813);
    if (_1711)
    {
        _1883 = 0;
    }
    int _1885 = _1883;
    int _1887 = _1885;
    if (_1711)
    {
        _897 = 0;
    }
    int _1889 = _897;
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1893 = _750 + _1891;
    int _1895 = _1875 ? 0 : 1;
    int _1897 = _776 * _1881;
    int _1899 = _1897 + _1091;
    int _1901 = _1889;
    if (!_1711)
    {
        _1887 = 1;
    }
    int _1903 = _1887;
    float _1905 = fma(_1609, _1893, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    if (!_1711)
    {
        _1901 = 2;
    }
    int _1907 = _1901;
    int _1909 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1911 = _1909 != 0;
    int _1913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1915 = _1913 != 0;
    int _1917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1919 = _1917 != 0;
    bool _1921 = _776 == 0;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1925 = _750 + _1923;
    bool _1927 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1929 = isnan(_750);
    bool _1931 = _1927 || _1929;
    bool _1933 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1935 = _1931 || _1933;
    float _1937 = float(_1935);
    int _1939 = ~_1895;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    float _1945 = fma(_1565, _1925, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1947 = !_1861;
    int _1949 = _1947 ? 0 : (-1);
    float _1951 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1953 = _750 + _1951;
    int _1955 = _1943;
    if (!_1865)
    {
        int _1957 = ~_1895;
        int _1959 = _1957 + 1;
        _1955 = _1959;
    }
    int _1961 = _1955;
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1965 = _750 + _1963;
    bool _1967 = _1863 > 0.0;
    bool _1969 = _1863 >= 0.0;
    bool _1971 = isnan(_1863);
    bool _1973 = _1969 || _1971;
    bool _1975 = isnan(0.0);
    bool _1977 = _1973 || _1975;
    float _1979 = -_1937;
    float _1981 = _1979 + 1.0;
    bool _1983 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1985 = isnan(_750);
    bool _1987 = _1983 || _1985;
    bool _1989 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1991 = _1987 || _1989;
    float _1993 = float(_1991);
    bool _1995 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1997 = isnan(_750);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2003 = _1999 || _2001;
    float _2005 = float(_2003);
    bool _2007 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2009 = isnan(_750);
    bool _2011 = _2007 || _2009;
    bool _2013 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2015 = _2011 || _2013;
    float _2017 = float(_2015);
    float _2019 = _1993 * _1981;
    float _2021 = -_1993;
    float _2023 = _2021 + 1.0;
    float _2025 = fma(_1615, _1953, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    bool _2027 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2029 = isnan(_750);
    bool _2031 = _2027 || _2029;
    bool _2033 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2035 = _2031 || _2033;
    float _2037 = float(_2035);
    float _2039 = fma(_1697, _1965, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2041 = -_2005;
    float _2043 = _2041 + 1.0;
    bool _2045 = _750 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2047 = isnan(_750);
    bool _2049 = _2045 || _2047;
    bool _2051 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2053 = _2049 || _2051;
    float _2055 = float(_2053);
    float _2057 = -_2017;
    float _2059 = _2057 + 1.0;
    bool _2061 = !_1921;
    int _2063 = _2061 ? _1899 : (-1);
    float _2065 = _2037 * _2043;
    float _2067 = -_2037;
    float _2069 = _2067 + 1.0;
    float _2071 = -_2055;
    float _2073 = _2071 + 1.0;
    float _2075 = _2005 * _2023;
    bool _2077 = _1903 != 1;
    float _2079 = in.m_63.w;
    float _2081 = _2055 * _2069;
    float _2083 = _2017 * _2073;
    float _2085 = _806 * _2059;
    float _2087 = -_806;
    float _2089 = _2087 + 1.0;
    float _2091 = in.m_65.w;
    float _2093 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _2095 = _1977 ? 0 : 1;
    float _2097 = _818 * _2089;
    float _2099 = -_818;
    float _2101 = _2099 + 1.0;
    bool _2103 = _1907 != 2;
    float _2105 = fma(_1753, _772, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2107 = _1945 * _2097;
    bool _2109 = !_1911;
    int _2111 = _2109 ? 0 : 1;
    float _2113 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _2115 = ~_2095;
    int _2117 = _2115 + 1;
    int _2119 = _2117 + 1;
    float _2121 = fma(_2101, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2107);
    int _2123 = _2119;
    float _2125 = _2089;
    if (!_1967)
    {
        int _2127 = ~_2095;
        int _2129 = _2127 + 1;
        _2123 = _2129;
    }
    int _2131 = _2123;
    float _2133 = fma(_1905, _2085, _2121);
    int _2135 = as_type<int>(_1623) & 3;
    bool _2137 = _2135 != 0;
    float _2139 = _2093 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _2141 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2143 = fma(_2025, _2083, _2133);
    float _2145 = _1625 + _2079;
    float _2147 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2149 = _1663 + _2147;
    float _2151 = fma(_2139, _1459, -0.5);
    if (_2103)
    {
        _1723 = _756;
    }
    float _2153 = _1723;
    float _2155 = _1639 + _2091;
    float _2157 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2159 = _2145 + _2157;
    float _2161 = _2149 * _2149;
    float _2163 = _2153;
    if (!_2103)
    {
        _2163 = _1283;
    }
    float _2165 = _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2169 = _2155 + _2167;
    int _2171 = abs(_2111);
    float _2173 = fma(_2159, _2159, _2161);
    float _2175 = float(_2131);
    float _2177 = _2165 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2179 = float(_2171);
    float _2181 = fma(_2169, _2169, _2173);
    bool _2183 = !_2137;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = -_2141;
    float _2189 = fma(_2177, 2.0, _2187);
    bool _2191 = _1429 != 3;
    float _2193 = sqrt(_2181);
    float _2195 = _2179 * _2175;
    int _2197 = _1397 >> 31;
    float _2199 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2201 = _1561 + _2199;
    bool _2203 = !_2191;
    int _2205 = _2203 ? 0 : (-1);
    float _2207 = _784 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _2209 = _1653 != 3;
    float _2211 = _2201 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2213 = _2197 & 3;
    float _2215 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _2217 = as_type<int>(_1623) >> 31;
    float _2219 = fma(_2149, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2211);
    int _2221 = _1397 + _2213;
    float _2223 = fma(_2215, _1617, -0.5);
    int _2225 = _2217 & 3;
    float _2227 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2219);
    int _2229 = _2221 >> 2;
    float _2231 = _2193 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    int _2233 = as_type<int>(_1623) + _2225;
    float _2235 = rsqrt(_2181);
    int _2237 = _2229 << 4;
    int _2239 = _2237 + 368;
    float _2241 = fma(_2039, _2081, _2143);
    int _2243 = _2233 >> 2;
    float _2245 = -_166;
    float _2247 = fma(_2245, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2189);
    float _2249 = as_type<float>(_2233);
    if (!_2077)
    {
        _2249 = _979;
    }
    float _2251 = _2249;
    float _2253 = fma(_2105, _2065, _2241);
    int _2255 = _2239 + 8;
    uint _2257 = uint(int(uint(_2255) >> uint(2)));
    uint _2259 = uint(int(uint(int(_2257)) >> uint(2)));
    int _2261 = int(_2257) & 3;
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[int(_2259)][_2261];
    int _2265 = int(_2257) + 1;
    uint _2267 = uint(int(uint(_2265) >> uint(2)));
    int _2269 = _2265 & 3;
    float _2271 = (*spvDescriptorSet0.vp_c9)._m0[int(_2267)][_2269];
    float _2273 = precise::min(_2207, _2231);
    int _2275 = _2243 << 4;
    int _2277 = _2275 + 512;
    float _2279 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2281 = _2251;
    if (!_2077)
    {
        _2125 = _2251;
    }
    float _2283 = _2125;
    out.m_79.w = _2273;
    bool _2285 = !_2209;
    int _2287 = _2285 ? 0 : (-1);
    uint _2289 = uint(int(uint(_2239) >> uint(2)));
    uint _2291 = uint(int(uint(int(_2289)) >> uint(2)));
    int _2293 = int(_2289) & 3;
    float _2295 = (*spvDescriptorSet0.vp_c9)._m0[int(_2291)][_2293];
    int _2297 = int(_2289) + 1;
    uint _2299 = uint(int(uint(_2297) >> uint(2)));
    int _2301 = _2297 & 3;
    float _2303 = (*spvDescriptorSet0.vp_c9)._m0[int(_2299)][_2301];
    float _2305 = _2283;
    if (_2077)
    {
        _2281 = _756;
    }
    float _2307 = _2281;
    float _2309 = _2235 * _2273;
    bool _2311 = _2227 >= 0.0;
    float _2313 = fma(_2307, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2279);
    if (!_2077)
    {
        _1725 = _1283;
    }
    float _2315 = _1725;
    uint _2317 = uint(int(uint(_2277) >> uint(2)));
    uint _2319 = uint(int(uint(int(_2317)) >> uint(2)));
    int _2321 = int(_2317) & 3;
    float _2323 = (*spvDescriptorSet0.vp_c9)._m0[int(_2319)][_2321];
    int _2325 = int(_2317) + 1;
    uint _2327 = uint(int(uint(_2325) >> uint(2)));
    int _2329 = _2325 & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    float _2333 = _2315;
    if (_2077)
    {
        _2333 = _979;
    }
    float _2335 = _2333;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _2339 = _2159 * _2309;
    float _2341 = _2149 * _2309;
    if (_2077)
    {
        _2305 = _756;
    }
    float _2343 = _2305;
    float _2345 = fma(_2335, (*spvDescriptorSet0.vp_c9)._m0[83].w, _838);
    float _2347 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2337);
    float _2349 = -_2339;
    float _2351 = _2159 + _2349;
    int _2353 = _2277 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    float _2371 = -_2341;
    float _2373 = _2149 + _2371;
    float _2375 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2347);
    float _2377 = _2351 * _2351;
    float _2379 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2381 = fma(_2375, _2223, _2247);
    float _2383 = fma(_2373, _2373, _2377);
    float _2385 = _2169 * _2309;
    float _2387 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2389 = abs(_1471);
    float _2391 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2345);
    int _2393 = abs(_1785);
    float _2395 = -_2387;
    float _2397 = fma(_2379, 2.0, _2395);
    bool _2399 = !_1431;
    int _2401 = _2399 ? 0 : 1;
    float _2403 = -_2385;
    float _2405 = _2169 + _2403;
    if (_2311)
    {
        out.m_53.x = 0.0;
    }
    int _2407 = ~_2389;
    int _2409 = _2407 + 1;
    int _2411 = _2409 + 1;
    float _2413 = fma(_2405, _2405, _2383);
    int _2415 = abs(_2401);
    float _2417 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2419 = int(_2417);
    int _2421 = ~_2393;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    int _2427 = abs(_2185);
    int _2429 = abs(_1505);
    int _2431 = ~_1835;
    int _2433 = _2431 + _1949;
    int _2435 = _2433 + 1;
    int _2437 = ~_2415;
    int _2439 = _2437 + 1;
    int _2441 = _2439 + 1;
    int _2443 = _2411 * as_type<int>(_2303);
    int _2445 = abs(_1733);
    int _2447 = _854 * _2435;
    int _2449 = _2447 + _1271;
    int _2451 = ~_2427;
    int _2453 = _2451 + 1;
    int _2455 = _2453 + 1;
    int _2457 = _2441 * as_type<int>(_2295);
    int _2459 = _2457 + _2443;
    float _2461 = fma(_2201, _2201, _2161);
    int _2463 = _2425 * as_type<int>(_2331);
    int _2465 = abs(_2205);
    float _2467 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2469 = int(_2467);
    int _2471 = ~_2429;
    int _2473 = _2471 + 1;
    int _2475 = _2473 + 1;
    int _2477 = _2455 * as_type<int>(_2323);
    int _2479 = _2477 + _2463;
    int _2481 = ~_2445;
    int _2483 = _2481 + 1;
    int _2485 = _2483 + 1;
    float _2487 = fma(_2169, _2169, _2461);
    int _2489 = _2475 * as_type<int>(_2263);
    int _2491 = _2489 + _2459;
    int _2493 = abs(_1707);
    int _2495 = _2485 * as_type<int>(_2361);
    int _2497 = _2495 + _2479;
    int _2499 = ~_2465;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    float _2505 = rsqrt(_2487);
    int _2507 = abs(_2287);
    int _2509 = abs(_1831);
    int _2511 = _2503 * as_type<int>(_2271);
    int _2513 = _2511 + _2491;
    int _2515 = ~_2507;
    int _2517 = _2515 + 1;
    int _2519 = _2517 + 1;
    float _2521 = float(uint(_2419));
    int _2523 = ~_2493;
    int _2525 = _2523 + 1;
    int _2527 = _2525 + 1;
    int _2529 = _2519 * as_type<int>(_2369);
    int _2531 = _2529 + _2497;
    float _2533 = 1.0 / _2521;
    int _2535 = abs(_2419);
    int _2537 = _2513 * _2527;
    float _2539 = float(uint(_2469));
    float _2541 = in.m_81.x;
    float _2543 = in.m_81.y;
    float _2545 = in.m_81.z;
    float _2547 = float(uint(_2535));
    int _2549 = _2063 * _2493;
    int _2551 = _2549 + _2537;
    int _2553 = abs(_2469);
    float _2555 = 1.0 / _2539;
    bool _2557 = _854 == 0;
    int _2559 = ~_2509;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    if (!_2077)
    {
        _899 = _1283;
    }
    float _2565 = _899;
    float _2567 = _2565;
    if (_2077)
    {
        _2567 = _979;
    }
    float _2569 = _2567;
    float _2571 = 1.0 / _2547;
    float _2573 = float(uint(_2553));
    int _2575 = _2563 * _2531;
    bool _2577 = !_2557;
    int _2579 = _2577 ? _2449 : (-1);
    int _2581 = as_type<int>(_2533) + (-2);
    float _2583 = _2569 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2585 = float(uint(_2551));
    float _2587 = 1.0 / _2573;
    float _2589 = _2195 * (-2.0);
    int _2591 = _2579 * _2509;
    int _2593 = _2591 + _2575;
    int _2595 = as_type<int>(_2555) + (-2);
    float _2597 = as_type<float>(_2581) * _2585;
    float _2599 = fma(_1787, _2589, _1787);
    float _2601 = fma(_2589, _2541, _2541);
    float _2603 = float(uint(_2593));
    float _2605 = trunc(_2597);
    float _2607 = precise::max(_2605, 0.0);
    uint _2609 = uint(_2607);
    int _2611 = abs(_2551);
    int _2613 = as_type<int>(_2571) + (-2);
    float _2615 = as_type<float>(_2595) * _2603;
    int _2617 = ~_2419;
    int _2619 = _2617 + 1;
    float _2621 = sqrt(_2413);
    float _2623 = float(uint(_2611));
    int _2625 = abs(_2593);
    float _2627 = float(uint(_2625));
    float _2629 = trunc(_2615);
    float _2631 = precise::max(_2629, 0.0);
    uint _2633 = uint(_2631);
    float _2635 = as_type<float>(_2613) * _2623;
    int _2637 = as_type<int>(_2587) + (-2);
    int _2639 = _2619 * int(_2609);
    int _2641 = _2639 + _2551;
    int _2643 = ~_2469;
    int _2645 = _2643 + 1;
    float _2647 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2649 = ~_2535;
    int _2651 = _2649 + 1;
    float _2653 = as_type<float>(_2637) * _2627;
    float _2655 = trunc(_2635);
    float _2657 = precise::max(_2655, 0.0);
    uint _2659 = uint(_2657);
    float _2661 = _2587;
    float _2663 = as_type<float>(_2581);
    if (_2311)
    {
        _2661 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2665 = _2661;
    float _2667 = fma(_2583, -2.0, _2647);
    float _2669 = float(uint(_2641));
    float _2671 = _2235 * _2621;
    int _2673 = as_type<int>(_2665);
    if (_2311)
    {
        float _2675 = _2665 * 5.0;
        _2673 = as_type<int>(_2675);
    }
    int _2677 = _2673;
    int _2679 = ~_2469;
    int _2681 = _2679 + 1;
    float _2683 = trunc(_2653);
    float _2685 = precise::max(_2683, 0.0);
    uint _2687 = uint(_2685);
    int _2689 = _2645 * int(_2633);
    int _2691 = _2689 + _2593;
    float _2693 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2667);
    if (_2311)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8730 = as_type<float>(_2677);
        out.gl_Position.z = _8730;
    }
    int _2695 = _2651 * int(_2659);
    int _2697 = _2695 + _2611;
    float _2699 = fma(_1779, _2075, _2253);
    int _2701 = ~_2553;
    int _2703 = _2701 + 1;
    float _2705 = as_type<float>(_2581) * _2669;
    float _2707 = float(uint(_2691));
    float _2709 = fma(_1809, _2019, _2699);
    float _2711 = float(uint(_2697));
    float _2713 = _2709;
    if (_2103)
    {
        _2663 = _979;
    }
    float _2715 = _2663;
    float _2717 = as_type<float>(_2595) * _2707;
    float _2719 = as_type<float>(_2613) * _2711;
    float _2721 = _2715;
    if (!_2103)
    {
        _2721 = _756;
    }
    float _2723 = _2721;
    float _2725 = _784 * _2671;
    int _2727 = _2703 * int(_2687);
    int _2729 = _2727 + _2625;
    float _2731 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2733 = _2723 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _2735 = _2725 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2737 = float(uint(_2729));
    float _2739 = trunc(_2717);
    float _2741 = precise::max(_2739, 0.0);
    uint _2743 = uint(_2741);
    float _2745 = fma(_2733, -2.0, _2731);
    float _2747 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2749 = _2735 * _2505;
    float _2751 = as_type<float>(_2637) * _2737;
    float _2753 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2745);
    float _2755 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2747);
    float _2757 = _2201 * _2749;
    float _2759 = trunc(_2705);
    float _2761 = precise::max(_2759, 0.0);
    uint _2763 = uint(_2761);
    float _2765 = _2149 * _2749;
    float _2767 = fma(_1937, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2709);
    float _2769 = -_2757;
    float _2771 = _2201 + _2769;
    float _2773 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2755);
    int _2775 = ~_2553;
    int _2777 = _2775 + 1;
    float _2779 = -_2765;
    float _2781 = _2149 + _2779;
    float _2783 = _2771 * _2771;
    float _2785 = trunc(_2751);
    float _2787 = precise::max(_2785, 0.0);
    uint _2789 = uint(_2787);
    float _2791 = -_2753;
    float _2793 = fma(_2773, _2151, _2791);
    int _2795 = ~_2419;
    int _2797 = _2795 + 1;
    float _2799 = fma(_2781, _2781, _2783);
    int _2801 = int(_2633) + int(_2743);
    out.m_83.x = _2767;
    float _2803 = _2169 * _2749;
    float _2805 = trunc(_2719);
    float _2807 = precise::max(_2805, 0.0);
    uint _2809 = uint(_2807);
    int _2811 = int(_2609) + int(_2763);
    int _2813 = ~_2535;
    int _2815 = _2813 + 1;
    int _2817 = _2797 * _2811;
    int _2819 = _2817 + _2551;
    int _2821 = int(_2687) + int(_2789);
    bool _2823 = uint(_2819) >= uint(_2419);
    int _2825 = _2777 * _2821;
    int _2827 = _2825 + _2625;
    bool _2829 = !_2823;
    int _2831 = _2829 ? 0 : (-1);
    int _2833 = int(_2659) + int(_2809);
    float _2835 = -_2803;
    float _2837 = _2169 + _2835;
    int _2839 = _2681 * _2801;
    int _2841 = _2839 + _2593;
    bool _2843 = uint(_2827) >= uint(_2553);
    int _2845 = _2815 * _2833;
    int _2847 = _2845 + _2611;
    float _2849 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2851 = uint(_2841) >= uint(_2469);
    float _2853 = fma(_2837, _2837, _2799);
    int _2855 = ~_2811;
    int _2857 = _2855 + _2831;
    int _2859 = _2857 + 1;
    bool _2861 = uint(_2847) >= uint(_2535);
    bool _2863 = !_2851;
    int _2865 = _2863 ? 0 : (-1);
    int _2867 = _2419 * _2859;
    int _2869 = _2867 + _2551;
    bool _2871 = _2419 == 0;
    float _2873 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2875 = ~_2801;
    int _2877 = _2875 + _2865;
    int _2879 = _2877 + 1;
    bool _2881 = !_2861;
    int _2883 = _2881 ? 0 : (-1);
    bool _2885 = _2419 == 0;
    int _2887 = _2469 * _2879;
    int _2889 = _2887 + _2593;
    int _2891 = _2551 ^ _2419;
    bool _2893 = !_2871;
    int _2895 = _2893 ? _2869 : (-1);
    bool _2897 = !_2843;
    int _2899 = _2897 ? 0 : (-1);
    float _2901 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2903 = _2469 == 0;
    bool _2905 = _2469 == 0;
    float _2907 = _2873 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _2909 = _2593 ^ _2469;
    float _2911 = _2849 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2913 = float(_2895);
    float _2915 = fma(_2907, _1407, -0.5);
    float _2917 = fma(_2911, _1369, -0.5);
    uint _2919 = uint(int(uint(_2891) >> uint(31)));
    float _2921 = fma(_2911, _2913, _1669);
    uint _2923 = uint(int(uint(_2909) >> uint(31)));
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _2927 = ~_2883;
    int _2929 = _2833 + _2927;
    int _2931 = _2929 + 1;
    int _2933 = ~int(_2919);
    int _2935 = _2933 + 1;
    float _2937 = fma(_756, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2925);
    int _2939 = ~_2899;
    int _2941 = _2821 + _2939;
    int _2943 = _2941 + 1;
    float _2945 = -_166;
    float _2947 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2397);
    int _2949 = ~int(_2923);
    int _2951 = _2949 + 1;
    float _2953 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2937);
    bool _2955 = !_2903;
    int _2957 = _2955 ? _2889 : (-1);
    float _2959 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _2961 = _2931 ^ _2935;
    int _2963 = _2943 ^ _2951;
    float _2965 = float(_2957);
    int _2967 = ~_2935;
    int _2969 = _2967 + _2961;
    int _2971 = _2969 + 1;
    int _2973 = ~_2951;
    int _2975 = _2973 + _2963;
    int _2977 = _2975 + 1;
    float _2979 = fma(_2953, _2917, _2921);
    float _2981 = _2901 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2983 = fma(_2907, _2965, _2947);
    bool _2985 = !_2885;
    int _2987 = _2985 ? _2971 : (-1);
    float _2989 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2991 = log2(_2989);
    float _2993 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1619);
    float _2995 = float(_2987);
    float _2997 = fma(_1411, _2981, -0.5);
    bool _2999 = !_2905;
    int _3001 = _2999 ? _2977 : (-1);
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _3005 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _3007 = -_2993;
    float _3009 = fma(_2981, _2995, _3007);
    float _3011 = sqrt(_2853);
    float _3013 = fma(_979, (*spvDescriptorSet0.vp_c9)._m0[78].w, _3003);
    float _3015 = float(_3001);
    float _3017 = fma(_1435, _3005, -0.5);
    float _3019 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2313);
    float _3021 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _3013);
    bool _3023 = !_1915;
    int _3025 = _3023 ? 0 : 1;
    float _3027 = _2991 * _166;
    float _3029 = -_2693;
    float _3031 = fma(_3005, _3015, _3029);
    float _3033 = fma(_3021, _2997, _3009);
    float _3035 = fma(_3019, _2915, _2983);
    float _3037 = _2793 + 0.5;
    float _3039 = fma(_2391, _3017, _3031);
    float _3041 = _3033 + 0.5;
    float _3043 = exp2(_3027);
    float _3045 = _2505 * _3011;
    float _3047 = _3035 + 0.5;
    bool _3049 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3051 = isnan(1.0);
    bool _3053 = _3049 || _3051;
    bool _3055 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3057 = _3053 || _3055;
    float _3059 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3061 = 1.0 + _3059;
    float _3063 = _2381 + 0.5;
    float _3065 = _2979 + 0.5;
    float _3067 = _3039 + 0.5;
    float _3069 = _2725 * _3045;
    bool _3071 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3073 = isnan(0.0);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3079 = _3075 || _3077;
    float _3081 = 1.0 / _3061;
    int _3083 = abs(_3025);
    out.m_85.x = _3063;
    out.m_85.y = _3037;
    float _3085 = _756 + (-0.5);
    float _3087 = -_3043;
    float _3089 = _3087 + 1.0;
    out.m_87.x = _3065;
    out.m_87.y = _3041;
    out.m_87.z = _3047;
    out.m_87.w = _3067;
    out.m_89.x = _3069;
    float _3091 = _3079 ? _3089 : 0.0;
    bool _3093 = !_1919;
    int _3095 = _3093 ? 0 : 1;
    float _3097 = _3091;
    float _3099 = _2783;
    float _3101 = _2757;
    if (_2311)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3103 = -_2757;
    float _3105 = _1561 + _3103;
    float _3107 = float(_1855);
    float _3109 = -_2765;
    float _3111 = _1663 + _3109;
    float _3113 = float(_3083);
    float _3115 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3117 = _3105 + _3115;
    float _3119 = fma(_3085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2601);
    float _3121 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3123 = _3111 + _3121;
    float _3125 = _979 + (-0.5);
    float _3127 = _3117 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3129 = _3113 * _3107;
    int _3131 = abs(_3095);
    if (_3057)
    {
        float _3133 = _3091 * _3081;
        _168 = _3133;
    }
    float _3135 = _168;
    float _3137 = fma(_3123, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3127);
    float _3139 = _3129 * (-2.0);
    float _3141 = float(_1961);
    float _3143 = -_2803;
    float _3145 = _2155 + _3143;
    float _3147 = float(_3131);
    float _3149 = fma(_3139, _2543, _2543);
    float _3151 = fma(_1825, _3139, _1825);
    float _3153 = _756 + _1283;
    float _3155 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3157 = _3145 + _3155;
    float _3159 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3149);
    float _3161 = _3147 * _3141;
    float _3163 = _3153 + (-1.0);
    float _3165 = fma(_3151, _3135, _3159);
    float _3167 = _3161 * (-2.0);
    float _3169 = fma(_3157, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3137);
    float _3171 = fma(_3163, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3173 = _1283 + (-0.5);
    float _3175 = fma(_3167, _2545, _2545);
    float _3177 = fma(_2599, _3135, _3119);
    bool _3179 = _3169 >= 0.0;
    float _3181 = fma(_3171, _3167, _3171);
    float _3183 = fma(_3173, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3175);
    float _3185 = _3177 * 0.15915493667125701904296875;
    float _3187 = _3165 * 0.15915493667125701904296875;
    float _3189 = fma(_3181, _3135, _3183);
    float _3191 = _3185 * 6.283185482025146484375;
    float _3193 = sin(_3191);
    float _3195 = _3189 * 0.15915493667125701904296875;
    float _3197 = _3165;
    if (_3179)
    {
        _3197 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3199 = _3197;
    int _3201 = as_type<int>(_3199);
    if (_3179)
    {
        out.m_53.x = 0.0;
    }
    float _3203 = _3185 * 6.283185482025146484375;
    float _3205 = cos(_3203);
    if (_3179)
    {
        float _3207 = _3199 * 5.0;
        _3201 = as_type<int>(_3207);
    }
    int _3209 = _3201;
    float _3211 = _3187 * 6.283185482025146484375;
    float _3213 = sin(_3211);
    if (_3179)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9530 = as_type<float>(_3209);
        out.gl_Position.z = _9530;
    }
    float _3215 = _3187 * 6.283185482025146484375;
    float _3217 = cos(_3215);
    float _3219 = _3195 * 6.283185482025146484375;
    float _3221 = sin(_3219);
    if (_3179)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3223 = in.m_91.x;
    float _3225 = in.m_91.y;
    float _3227 = in.m_91.z;
    float _3229 = _3195 * 6.283185482025146484375;
    float _3231 = cos(_3229);
    float _3233 = _470 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3235 = _2671 * _3045;
    float _3237 = _3193 * _3213;
    float _3239 = _3205 * _3217;
    float _3241 = _3205 * _3213;
    float _3243 = _3233 * _3235;
    float _3245 = _3193 * _3217;
    float _3247 = _474 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3249 = fma(_3221, _3239, _3237);
    float _3251 = fma(_3221, _3237, _3239);
    float _3253 = -_3241;
    float _3255 = fma(_3221, _3245, _3253);
    float _3257 = _3247 * _3235;
    float _3259 = _3205 * _3231;
    float _3261 = _3217 * _3231;
    float _3263 = _3193 * _3231;
    float _3265 = _3213 * _3231;
    float _3267 = -_3245;
    float _3269 = fma(_3221, _3241, _3267);
    float _3271 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3273 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3275 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3225);
    float _3277 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3227);
    float _3279 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3223);
    float _3281 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3273);
    float _3283 = _3243 * _3275;
    float _3285 = _3257 * _3277;
    float _3287 = _3249 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3289 = _3069 * _3279;
    float _3291 = _3259 * _3283;
    float _3293 = -_3283;
    float _3295 = _3221 * _3293;
    float _3297 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3287);
    float _3299 = fma(_3261, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3271);
    float _3301 = fma(_3249, _3289, _3291);
    float _3303 = fma(_3261, _3289, _3295);
    float _3305 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3307 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3309 = _3263 * _3283;
    float _3311 = _3259 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3313 = fma(_3269, _3285, _3301);
    float _3315 = fma(_3265, _3285, _3303);
    float _3317 = fma(_3255, _3289, _3309);
    float _3319 = -_3221;
    float _3321 = fma(_3319, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3311);
    float _3323 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _3325 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3327 = fma(_3251, _3285, _3317);
    float _3329 = -_3221;
    float _3331 = fma(_3329, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3307);
    float _3333 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3323);
    float _3335 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3325);
    float _3337 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3281);
    float _3339 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3297);
    float _3341 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3333);
    float _3343 = fma(_3255, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3299);
    float _3345 = -_3221;
    float _3347 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3305);
    float _3349 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _3351 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3335);
    float _3353 = _3341 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _3355 = in.m_93.x;
    float _3357 = in.m_93.y;
    float _3359 = in.m_93.z;
    float _3361 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[24].x, _3349);
    bool _3363 = _3225 != 0.0;
    bool _3365 = isnan(_3225);
    bool _3367 = _3363 || _3365;
    bool _3369 = isnan(0.0);
    bool _3371 = _3367 || _3369;
    float _3373 = _3351 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _3375 = _2155 + _3353;
    float _3377 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3379 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _3381 = _3223 == 0.0;
    bool _3383 = !_3371;
    bool _3385 = _3381 && _3383;
    float _3387 = _1663 + _3373;
    float _3389 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3391 = _3375 + _3389;
    float _3393 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3347);
    bool _3395 = _3227 == 0.0;
    bool _3397 = _3395 && _3385;
    float _3399 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3377);
    float _3401 = fma(_3265, (*spvDescriptorSet0.vp_c8)._m0[26].x, _3379);
    float _3403 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3405 = _3387 + _3403;
    float _3407 = _3391 * _3391;
    float _3409 = in.m_95.x;
    float _3411 = in.m_95.y;
    float _3413 = in.m_95.z;
    float _3415 = in.m_95.w;
    float _3417 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3331);
    float _3419 = fma(_3263, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3321);
    float _3421 = fma(_3405, _3405, _3407);
    float _3423 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[24].z, _3361);
    float _3425 = _3313 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _3427 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[26].z, _3401);
    float _3429 = sqrt(_3421);
    float _3431 = _3321;
    float _3433 = _3263;
    float _3435 = _3343;
    if (_3397)
    {
        _2713 = _3355;
    }
    float _3437 = _2713;
    float _3439 = fma(_3315, (*spvDescriptorSet0.vp_c8)._m0[25].x, _3425);
    float _3441 = _3437;
    if (_3397)
    {
        _3097 = _3357;
    }
    float _3443 = _3097;
    float _3445 = _3443;
    if (_3397)
    {
        _3099 = _3359;
    }
    float _3447 = _3099;
    float _3449 = fma(_3327, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3439);
    float _3451 = _3447;
    if (_3397)
    {
        _1727 = _3437;
    }
    float _3453 = _1727;
    float _3455 = _3453;
    if (_3397)
    {
        _3431 = _3443;
    }
    float _3457 = _3431;
    float _3459 = _3457;
    if (_3397)
    {
        _3433 = _3447;
    }
    float _3461 = _3433;
    float _3463 = _3461;
    if (!_3397)
    {
        _3441 = _3355;
    }
    float _3465 = _3441;
    if (!_3397)
    {
        _3445 = _3357;
    }
    float _3467 = _3445;
    float _3469 = fma(_3251, (*spvDescriptorSet0.vp_c8)._m0[25].z, _3399);
    if (!_3397)
    {
        _3451 = _3359;
    }
    float _3471 = _3451;
    if (!_3397)
    {
        float _3473 = fma(_3223, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3465);
        _3455 = _3473;
    }
    float _3475 = _3455;
    float _3477 = _3393 * _3411;
    if (!_3397)
    {
        float _3479 = fma(_3225, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3467);
        _3459 = _3479;
    }
    float _3481 = _3459;
    float _3483 = _3413 * _3465;
    float _3485 = _3483;
    if (!_3397)
    {
        float _3487 = fma(_3227, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3471);
        _3463 = _3487;
    }
    float _3489 = _3463;
    bool _3491 = _3429 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3493 = _3417 * _3411;
    float _3495 = fma(_3343, _3409, _3477);
    float _3497 = _3409 * _3467;
    float _3499 = _3419 * _3411;
    float _3501 = fma(_3337, _3409, _3493);
    float _3503 = _3449 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _3505 = -_3483;
    float _3507 = fma(_3409, _3471, _3505);
    float _3509 = -_3497;
    float _3511 = fma(_3411, _3465, _3509);
    float _3513 = fma(_3339, _3409, _3499);
    float _3515 = _1561 + _3503;
    float _3517 = _3411 * _3471;
    float _3519 = _3503;
    float _3521 = _3497;
    if (!_3491)
    {
        _3519 = _3387;
    }
    float _3523 = _3519;
    float _3525 = _3523;
    if (!_3491)
    {
        _3521 = _3375;
    }
    float _3527 = _3521;
    float _3529 = _3527;
    if (!_3491)
    {
        _3485 = _3515;
    }
    float _3531 = _3485;
    bool _3533 = !_3491;
    float _3535 = _3531;
    if (!_3533)
    {
        float _3537 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3539 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3541 = _3429 + _3539;
        float _3543 = _3515 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3545 = rsqrt(_3421);
        float _3547 = _3541 * _3537;
        float _3549 = _3547 * 0.15915493667125701904296875;
        float _3551 = _3549 * 6.283185482025146484375;
        float _3553 = cos(_3551);
        float _3555 = _3549 * 6.283185482025146484375;
        float _3557 = sin(_3555);
        float _3559 = _3553 + (-1.0);
        float _3561 = _3559 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3563 = fma(_3557, _3543, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3565 = fma(_3515, _3553, _3561);
        float _3567 = _3545 * _3563;
        float _3569 = fma(_3405, _3567, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3571 = fma(_3391, _3567, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _3535 = _3565;
        _3525 = _3569;
        _3529 = _3571;
    }
    float _3573 = _3535;
    float _3575 = _3525;
    float _3577 = _3529;
    float _3579 = -_2339;
    float _3581 = _3579 + _3573;
    float _3583 = -_2341;
    float _3585 = _3583 + _3575;
    float _3587 = -_3517;
    float _3589 = fma(_3413, _3467, _3587);
    float _3591 = _3419 * _3481;
    float _3593 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3595 = _3581 + _3593;
    float _3597 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3599 = _3585 + _3597;
    float _3601 = _3589 * _3415;
    float _3603 = _3511 * _3415;
    float _3605 = _3595 * _3595;
    float _3607 = _3507 * _3415;
    float _3609 = _3417 * _3481;
    float _3611 = fma(_3423, _3413, _3495);
    float _3613 = fma(_3599, _3599, _3605);
    float _3615 = -_2385;
    float _3617 = _3615 + _3577;
    float _3619 = _3393 * _3481;
    float _3621 = _3607 * _3393;
    float _3623 = _3607 * _3417;
    float _3625 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3627 = _3617 + _3625;
    float _3629 = _3607 * _3419;
    float _3631 = fma(_3343, _3475, _3619);
    float _3633 = fma(_3337, _3475, _3609);
    float _3635 = fma(_3627, _3627, _3613);
    float _3637 = fma(_3339, _3475, _3591);
    float _3639 = fma(_3601, _3343, _3621);
    float _3641 = fma(_3601, _3337, _3623);
    float _3643 = fma(_3601, _3339, _3629);
    float _3645 = fma(_3469, _3413, _3501);
    float _3647 = sqrt(_3635);
    float _3649 = fma(_3469, _3489, _3633);
    float _3651 = fma(_3427, _3413, _3513);
    float _3653 = fma(_3423, _3489, _3631);
    float _3655 = fma(_3603, _3423, _3639);
    float _3657 = fma(_3603, _3469, _3641);
    float _3659 = fma(_3603, _3427, _3643);
    float _3661 = fma(_3427, _3489, _3637);
    out.m_97.x = _3611;
    out.m_97.y = _3645;
    out.m_97.z = _3651;
    float _3663 = -_2341;
    float _3665 = _1663 + _3663;
    float _3667 = -_2339;
    float _3669 = _3667 + _1561;
    out.m_99.x = _3655;
    out.m_99.y = _3657;
    out.m_99.z = _3659;
    float _3671 = -_2385;
    float _3673 = _2155 + _3671;
    out.m_101.x = _3653;
    out.m_101.y = _3649;
    out.m_101.z = _3661;
    bool _3675 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3677 = isnan(_3647);
    bool _3679 = _3675 || _3677;
    bool _3681 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3683 = _3679 || _3681;
    if (!_3683)
    {
        _3435 = 1.0;
    }
    float _3685 = _3435;
    bool _3687 = !_3683;
    float _3689 = _3685;
    if (!_3687)
    {
        bool _3691 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3693 = isnan(_3647);
        bool _3695 = _3691 || _3693;
        bool _3697 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3699 = _3695 || _3697;
        if (!_3699)
        {
            float _3701 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3703 = _3647 + _3701;
            float _3705 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3707 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3705;
            float _3709 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3711 = _3709 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3713 = 1.0 / _3707;
            float _3715 = _3703 * _3713;
            float _3717 = fma(_3715, _3711, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3689 = _3717;
            _3719 = true;
        }
        else
        {
            bool _3721 = _3647 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3723 = isnan(_3647);
            bool _3725 = _3721 || _3723;
            bool _3727 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3729 = _3725 || _3727;
            if (!_3729)
            {
                float _3731 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3733 = _3647 + _3731;
                float _3735 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3737 = _3735 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3739 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3741 = _3739 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _3743 = 1.0 / _3737;
                float _3745 = _3733 * _3743;
                float _3747 = fma(_3745, _3741, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3689 = _3747;
                _3719 = true;
            }
            else
            {
                _3689 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3719 = false;
    float _3749 = _3689;
    float _3751 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _3753 = _3585 + _3751;
    float _3755 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _3757 = _3617 + _3755;
    float _3759 = fma(_3753, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _3761 = fma(_3757, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _3763 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _3765 = _3759 + _3763;
    float _3767 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _3769 = _3761 + _3767;
    float _3771 = fma(_3765, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _3773 = fma(_3769, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _10506 = float2(_3771, _3773);
    float _3775 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_10506, float2(0.0), isnan(_10506)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_10506, float2(0.0), isnan(_10506)), level(0.0)).x;
    float _3777 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _3779 = _3581 + _3777;
    float _3781 = -_2765;
    float _3783 = _3781 + _3665;
    float _3785 = -_2803;
    float _3787 = _3785 + _3673;
    float _3789 = -_3665;
    float _3791 = _3789 + _3759;
    float _3793 = fma(_3779, _3749, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _3795 = -_3673;
    float _3797 = _3795 + _3761;
    float _3799 = fma(_3775, 100.0, _3669);
    float _3801 = -_3669;
    float _3803 = _3801 + _3793;
    float _3805 = fma(_3775, 100.0, _3793);
    float _3807 = -_2757;
    float _3809 = _3807 + _3799;
    float _3811 = _3803 * _3803;
    float _3813 = _3809 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3815 = fma(_3791, _3791, _3811);
    float _3817 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3813);
    float _3819 = fma(_3797, _3797, _3815);
    float _3821 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3817);
    float _3823 = sqrt(_3819);
    float _3825 = _3821 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3827 = _3809 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3829 = 1.0 / _3825;
    float _3831 = fma(_3783, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3827);
    float _3833 = fma(_3787, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3831);
    bool _3835 = _3823 > 0.0;
    float _3837 = _3833 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3839 = _3837 + _3825;
    bool _3841 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _3843 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _3845 = _3841 || _3843;
    bool _3847 = isnan(0.5);
    bool _3849 = _3845 || _3847;
    float _3851 = _3839 * _3829;
    float _3853 = _3851 * 0.5;
    bool _3855 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _3857 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3859 = _3855 || _3857;
    bool _3861 = isnan(0.5);
    bool _3863 = _3859 || _3861;
    float _3865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3867 = fma(_3853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3865);
    float _3869 = _3775;
    float _3871 = _3793;
    float _3873 = _3759;
    float _3875 = _3761;
    float _3877 = _3809;
    float _3879 = _3787;
    if (!_3835)
    {
        _3869 = _3761;
    }
    float _3881 = _3869;
    float _3883 = _3881;
    if (!_3835)
    {
        _3871 = _3805;
    }
    float _3885 = _3871;
    float _3887 = 1.0 / _3867;
    bool _3889 = !_3835;
    float _3891 = _3885;
    float _3893 = _3885;
    float _3895 = _3887;
    if (!_3889)
    {
        float _3897 = _232 * _232;
        float _3899 = rsqrt(_3819);
        float _3901 = fma(_230, _230, _3897);
        float _3903 = fma(_234, _234, _3901);
        float _3905 = sqrt(_3903);
        float _3907 = _3791 * _3899;
        float _3909 = _3803 * _3899;
        float _3911 = _3797 * _3899;
        bool _3913 = _3905 > 0.0;
        float _3915 = _3899;
        if (!_3913)
        {
            _3891 = _3805;
        }
        float _3917 = _3891;
        _3893 = _3917;
        if (!_3913)
        {
            _3915 = _3761;
        }
        float _3919 = _3915;
        bool _3921 = !_3913;
        _3883 = _3919;
        if (!_3921)
        {
            float _3923 = rsqrt(_3903);
            float _3925 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _3927 = _232 * _3923;
            float _3929 = _230 * _3923;
            float _3931 = _3909 * _3927;
            float _3933 = _234 * _3923;
            float _3935 = fma(_3907, _3929, _3931);
            float _3937 = _3925 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _3939 = fma(_3911, _3933, _3935);
            float _3941 = _3939 * _3937;
            float _3943 = fma(_230, _3941, _3759);
            float _3945 = fma(_232, _3941, _3805);
            float _3947 = fma(_234, _3941, _3761);
            _3893 = _3945;
            _3873 = _3943;
            _3883 = _3947;
        }
    }
    float _3949 = _3893;
    float _3951 = _3873;
    float _3953 = _3883;
    float _3955 = -_2757;
    float _3957 = _3955 + _3949;
    float _3959 = -_2765;
    float _3961 = _3959 + _3951;
    float _3963 = -_2803;
    float _3965 = _3963 + _3953;
    float _3967 = _3957;
    float _3969 = _3961;
    float _3971 = _3965;
    float _3973 = _3951;
    if (_3863)
    {
        _3101 = 1.0;
    }
    float _3975 = _3101;
    float _3977 = _3975;
    if (!_3849)
    {
        float _3979 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _3981 = _3809 + _3979;
        float _3983 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _3985 = _3783 + _3983;
        float _3987 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _3989 = -_3673;
        float _3991 = _3989 + _3953;
        float _3993 = _3981 * _3981;
        float _3995 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _3997 = _3787 + _3995;
        float _3999 = -_3665;
        float _4001 = _3999 + _3951;
        float _4003 = -_3799;
        float _4005 = _4003 + _3949;
        float _4007 = fma(_3985, _3985, _3993);
        float _4009 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4011 = fma(_3997, _3997, _4007);
        float _4013 = sqrt(_4011);
        float _4015 = 1.0 / _3045;
        float _4017 = _4009 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4019 = precise::min(_4013, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4021 = _4019 * _3987;
        float _4023 = _4021 * _4015;
        float _4025 = _4017 * _4023;
        float _4027 = _3991 * _4023;
        float _4029 = fma(_4001, _4025, _3783);
        float _4031 = fma(_4005, _4025, _3809);
        float _4033 = fma(_4017, _4027, _3787);
        _3967 = _4031;
        _3969 = _4029;
        _3971 = _4033;
        _3973 = _4001;
    }
    float _4035 = _3967;
    float _4037 = _3969;
    float _4039 = _3971;
    float _4041 = _3973;
    float _4043 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4045 = _3887 * _4043;
    float _4047 = _4041;
    if (!_3863)
    {
        float _4049 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4051 = _4049 * 0.15915493667125701904296875;
        float _4053 = _4051 * 6.283185482025146484375;
        float _4055 = cos(_4053);
        float _4057 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4059 = _4057 * 0.15915493667125701904296875;
        float _4061 = _4051 * 6.283185482025146484375;
        float _4063 = sin(_4061);
        float _4065 = 1.0 / _4055;
        float _4067 = _4059 * 6.283185482025146484375;
        float _4069 = cos(_4067);
        float _4071 = _4063 * _4065;
        float _4073 = _4059 * 6.283185482025146484375;
        float _4075 = sin(_4073);
        float _4077 = _4069 * _4071;
        float _4079 = 1.0 / _4077;
        float _4081 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4083 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4081;
        float _4085 = 1.0 / _4083;
        float _4087 = _4075 * _4079;
        float _4089 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4091 = fma(_4045, _4087, _4089);
        float _4093 = _4091 * _4085;
        float _4095 = precise::clamp(_4093, 0.0, 1.0);
        _242 = _4059;
        _3977 = _4095;
    }
    float _4097 = _242;
    float _4099 = _3977;
    float _4101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4103 = _4035 + _4101;
    float _4105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4107 = _4037 + _4105;
    float _4109 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4111 = _4039 + _4109;
    float _4113 = _4103 * _4103;
    float _4115 = fma(_4107, _4107, _4113);
    float _4117 = fma(_4111, _4111, _4115);
    float _4119 = rsqrt(_4117);
    float _4121 = _4119 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4123 = _4107 * _4121;
    float _4125 = _4111 * _4121;
    float _4127 = _4123 * _4123;
    float _4129 = _4125 * _4125;
    float _4131 = _4127 + _4129;
    float _4133 = sqrt(_4131);
    bool _4135 = _4133 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4137 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4139 = _4133 + _4137;
    float _4141 = _4111;
    float _4143 = _4097;
    float _4145 = _4139;
    float _4147 = _4103;
    if (_4135)
    {
        float _4149 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4141 = _4149;
    }
    float _4151 = _4141;
    if (_4135)
    {
        float _4153 = rsqrt(_4131);
        _4143 = _4153;
    }
    float _4155 = _4143;
    float _4157 = _4155;
    if (_4135)
    {
        float _4159 = _4139 * _4151;
        _4145 = _4159;
    }
    float _4161 = _4145;
    if (_4135)
    {
        float _4163 = _4161 * 0.15915493667125701904296875;
        _4047 = _4163;
    }
    float _4165 = _4047;
    float _4167 = _4151;
    if (_4135)
    {
        float _4169 = _4165 * 6.283185482025146484375;
        float _4171 = cos(_4169);
        _4167 = _4171;
    }
    float _4173 = _4167;
    float _4175 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4177 = precise::max(0.0, _4175);
    float _4179 = _4119;
    float _4181 = _4177;
    if (_4135)
    {
        float _4183 = _4165 * 6.283185482025146484375;
        float _4185 = sin(_4183);
        _4179 = _4185;
    }
    float _4187 = _4179;
    float _4189 = -_4121;
    float _4191 = -_4177;
    float _4193 = fma(_4103, _4189, _4191);
    float _4195 = _4193;
    if (_4135)
    {
        float _4197 = _4193 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4181 = _4197;
    }
    float _4199 = _4181;
    float _4201 = _4199;
    if (_4135)
    {
        float _4203 = _4173 + (-1.0);
        _4147 = _4203;
    }
    float _4205 = _4147;
    float _4207 = _4205;
    float _4209 = _4187;
    if (_4135)
    {
        float _4211 = fma(_4187, _4199, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3895 = _4211;
    }
    float _4213 = _3895;
    if (_4135)
    {
        float _4215 = _4205 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4201 = _4215;
    }
    float _4217 = _4201;
    if (!_4135)
    {
        _4207 = _4127;
    }
    float _4219 = _4207;
    float _4221 = _4219;
    if (_4135)
    {
        float _4223 = _4155 * _4213;
        _3875 = _4223;
    }
    float _4225 = _3875;
    if (!_4135)
    {
        _4157 = _4123;
    }
    float _4227 = _4157;
    float _4229 = _4227;
    if (_4135)
    {
        float _4231 = fma(_4193, _4173, _4217);
        _4195 = _4231;
    }
    float _4233 = _4195;
    float _4235 = sqrt(_4117);
    float _4237 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4135)
    {
        float _4239 = _4123 * _4225;
        _4229 = _4239;
    }
    float _4241 = _4229;
    if (!_4135)
    {
        _4209 = _4125;
    }
    float _4243 = _4209;
    float _4245 = _4243;
    if (_4135)
    {
        float _4247 = _4125 * _4225;
        _4245 = _4247;
    }
    float _4249 = _4245;
    float _4251 = fma(_3783, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_4135)
    {
        float _4253 = _4241 * _4241;
        _4221 = _4253;
    }
    float _4255 = _4221;
    if (!_4135)
    {
        _4237 = _4129;
    }
    float _4257 = _4237;
    float _4259 = _4257;
    if (_4135)
    {
        float _4261 = _4249 * _4249;
        _4259 = _4261;
    }
    float _4263 = _4259;
    float _4265 = fma(_4233, _4233, _4255);
    float _4267 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4269 = floor(_4251);
    float _4271 = _4265 + _4263;
    float _4273 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4267);
    float _4275 = fma(_3787, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4277 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4279 = fma(_4235, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4277);
    float _4281 = precise::clamp(_4279, 0.0, 1.0);
    float _4283 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4273);
    float _4285 = rsqrt(_4271);
    float _4287 = -_4281;
    float _4289 = _4287 + 1.0;
    float _4291 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4293 = _4283 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4295 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4297 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4291);
    float _4299 = _4293 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4301 = abs(_4289);
    float _4303 = log2(_4301);
    float _4305 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4297);
    float _4309 = -_4299;
    float _4311 = fma(_4309, _4295, 1.0);
    float _4313 = _4035 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4315 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4317 = _4285 * _4241;
    float _4319 = fma(_4037, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4313);
    float _4321 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4315);
    float _4323 = _4285 * _4233;
    float _4325 = _4285 * _4249;
    float _4327 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4329 = fma(_4039, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4319);
    float _4331 = _4321 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4333 = floor(_4275);
    float _4335 = -_4327;
    float _4337 = fma(_4323, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4335);
    float _4339 = _4329 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4341 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4343 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4345 = -_4325;
    float _4347 = fma(_4345, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4337);
    float _4349 = _4307 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4351 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4341);
    float _4353 = -_4269;
    float _4355 = _4251 + _4353;
    float _4357 = fma(_4347, -0.5, 0.5);
    float _4359 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4351);
    float _4361 = exp2(_4343);
    float _4363 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4365 = fma(_4347, 0.5, 0.5);
    float _4367 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4359);
    float _4369 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4371 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4363);
    float _4373 = -_4333;
    float _4375 = _4275 + _4373;
    float _4377 = _4323 + 1.0;
    float _4379 = log2(_4311);
    float _4381 = fma(_4365, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4383 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4369);
    float _4385 = fma(_4365, _4381, -0.212114393711090087890625);
    float _4387 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4383);
    float _4389 = 1.0 / _4367;
    float _4391 = -_4323;
    float _4393 = fma(_4361, _4377, _4391);
    float _4395 = sqrt(_4357);
    float _4397 = _4379 * 0.693147182464599609375;
    float2 _11488 = float2(_4355, _4375);
    float _4399 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11488, float2(0.0), isnan(_11488)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11488, float2(0.0), isnan(_11488)), level(0.0)).x;
    float _4401 = fma(_4365, _4385, 1.570728778839111328125);
    float _4403 = _4397 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4405 = fma(_4393, 0.5, 0.5);
    float _4407 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4371);
    float _4409 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4407);
    float _4411 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4387);
    float _4413 = _4395 * 0.636619746685028076171875;
    float _4415 = _4409 * _4389;
    float _4417 = _4411 * _4389;
    float _4419 = -_4401;
    float _4421 = fma(_4413, _4419, 1.0);
    float _4423 = fma(_4415, 0.5, 0.5);
    float _4425 = fma(_4417, -0.5, 0.5);
    float3 _11540 = float3(_4423, _4425, _4403);
    float _4427 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11540, float3(0.0), isnan(_11540)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11540, float3(0.0), isnan(_11540)), level(0.0)).x;
    float3 _11551 = float3(_4423, _4425, _4403);
    float4 _4430 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11551, float3(0.0), isnan(_11551)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11551, float3(0.0), isnan(_11551)), level(0.0)).xyzw;
    float _4432 = _4430.x;
    float _4434 = _4430.y;
    float _4436 = _4430.z;
    float _4438 = _4430.w;
    float2 _11567 = float2(_4421, _4405);
    float3 _4442 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11567, float2(0.0), isnan(_11567)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11567, float2(0.0), isnan(_11567)), level(0.0)).xyz;
    float _4444 = _4442.x;
    float _4446 = _4442.y;
    float _4448 = _4442.z;
    float _4450 = abs(_4045);
    float _4452 = log2(_4450);
    float _4454 = _4331 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4456 = _4303 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_103.x = _3783;
    out.m_103.y = _3809;
    out.m_103.z = _3787;
    float _4458 = fma(_4339, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4454);
    bool _4460 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4462 = isnan(_4235);
    bool _4464 = _4460 || _4462;
    bool _4466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4468 = _4464 || _4466;
    bool _4470 = _4045 <= 8000.0;
    bool _4472 = isnan(_4045);
    bool _4474 = _4470 || _4472;
    bool _4476 = isnan(8000.0);
    bool _4478 = _4474 || _4476;
    float _4480 = float(_4478);
    float _4482 = fma(_4293, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4458);
    float _4484 = exp2(_4456);
    out.m_105.x = _4037;
    out.m_105.y = _4035;
    out.m_105.z = _4039;
    float _4486 = fma(_4349, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4482);
    float _4488 = _4367 * 0.5;
    float _4490 = _4452 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4492 = in.m_77.x;
    float _4494 = _4409 + _4367;
    float _4496 = _4409;
    if (!_4468)
    {
        _3877 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4498 = _3877;
    out.gl_Position.x = _4409;
    out.gl_Position.y = _4411;
    out.gl_Position.z = _4486;
    out.gl_Position.w = _4367;
    float _4500 = exp2(_4490);
    float _4502 = _4494 * 0.5;
    float _4504 = _4498;
    float _4506 = _4498;
    if (!_4468)
    {
        _3879 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4508 = _3879;
    float _4510 = -_4484;
    float _4512 = _4510 + 1.0;
    float _4514 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4516 = -_4514;
    float _4518 = _4516 + 1.0;
    float _4520 = _4518;
    float _4522 = _4514;
    float _4524 = _4508;
    float _4526 = _4508;
    if (!_4468)
    {
        _4496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4528 = _4496;
    float _4530 = fma(_4500, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4532 = precise::clamp(_4530, 0.0, 1.0);
    float _4534 = fma(_4411, -0.5, _4488);
    float _4536 = fma(_4532, -2.0, 3.0);
    float _4538 = _4532 * _4532;
    float _4540 = _4538 * _4536;
    float _4542 = -_4540;
    float _4544 = _4542 + 1.0;
    float _4546 = fma(_4544, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4540);
    float _4548 = _4486 + _4367;
    float _4550 = _4099 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _4552 = _4480 * _4546;
    float _4554 = _4548 * 0.5;
    float _4556 = _4552 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_107.x = _4502;
    out.m_107.y = _4534;
    out.m_107.z = _4554;
    out.m_107.w = _4367;
    float _4558 = -_4399;
    float _4560 = _4558 + 1.0;
    float _4562 = _4560 * _4556;
    float _4564 = precise::clamp(_4562, 0.0, 1.0);
    float _4566 = -_4564;
    float _4568 = fma(_4566, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4570 = _4568 * _4492;
    float _4572 = _4570 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_109.x = _4572;
    float _4574 = _4514 * _4427;
    float _4576 = _4438 * _4518;
    float _4578 = _4528;
    float _4580 = _4528;
    if (!_4468)
    {
        _4520 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4582 = _4520;
    float _4584 = _4438 * _4574;
    float _4586 = _4448 * _4574;
    float _4588 = _4584;
    float _4590 = _4582;
    float _4592 = _4582;
    if (!_4468)
    {
        _4522 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4594 = _4522;
    float _4596 = fma(_4444, _4584, _4432);
    float _4598 = fma(_4446, _4584, _4434);
    float _4600 = fma(_4438, _4586, _4436);
    float _4602 = _4594;
    float _4604 = _4594;
    if (!_4468)
    {
        _4588 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4606 = _4588;
    out.m_111.x = _4596;
    out.m_111.y = _4598;
    out.m_111.z = _4600;
    out.m_111.w = _4576;
    bool _4608 = !_4468;
    float _4610 = _4606;
    float _4612 = _4606;
    if (!_4608)
    {
        bool _4614 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4616 = isnan(_4235);
        bool _4618 = _4614 || _4616;
        bool _4620 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4622 = _4618 || _4620;
        if (!_4622)
        {
            float _4624 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4626 = _4235 + _4624;
            float _4628 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4630 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4628;
            float _4632 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4634 = _4632 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4636 = 1.0 / _4630;
            float _4638 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4640 = _4638 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4642 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4644 = _4642 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4646 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4648 = _4646 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4650 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4652 = _4650 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4654 = _4626 * _4636;
            float _4656 = precise::clamp(_4654, 0.0, 1.0);
            float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4660 = _4658 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4662 = fma(_4656, _4634, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4664 = fma(_4656, _4660, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4666 = fma(_4656, _4640, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4668 = fma(_4656, _4644, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4670 = fma(_4656, _4648, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4672 = fma(_4656, _4652, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4580 = _4662;
            _4604 = _4670;
            _4506 = _4666;
            _4592 = _4668;
            _4526 = _4664;
            _4612 = _4672;
            _4674 = true;
        }
        else
        {
            bool _4676 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4678 = isnan(_4235);
            bool _4680 = _4676 || _4678;
            bool _4682 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4684 = _4680 || _4682;
            if (!_4684)
            {
                _4504 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4686 = _4504;
            _4506 = _4686;
            if (!_4684)
            {
                _4578 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4688 = _4578;
            _4580 = _4688;
            if (!_4684)
            {
                _4524 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4690 = _4524;
            _4526 = _4690;
            if (!_4684)
            {
                _4590 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4692 = _4590;
            _4592 = _4692;
            if (!_4684)
            {
                _4602 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4694 = _4602;
            _4604 = _4694;
            if (!_4684)
            {
                _4610 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4696 = _4610;
            bool _4698 = !_4684;
            _4612 = _4696;
            if (!_4698)
            {
                bool _4700 = _4235 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4702 = isnan(_4235);
                bool _4704 = _4700 || _4702;
                bool _4706 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4708 = _4704 || _4706;
                if (!_4708)
                {
                    float _4710 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4712 = _4235 + _4710;
                    float _4714 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4716 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4714;
                    float _4718 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4720 = _4718 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4722 = 1.0 / _4716;
                    float _4724 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4726 = _4724 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4728 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4730 = _4728 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4732 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4734 = _4732 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4736 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4738 = _4736 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4740 = _4712 * _4722;
                    float _4742 = precise::clamp(_4740, 0.0, 1.0);
                    float _4744 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4746 = _4744 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4748 = fma(_4742, _4720, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4750 = fma(_4742, _4746, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4752 = fma(_4742, _4726, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4754 = fma(_4742, _4730, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4756 = fma(_4742, _4734, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4758 = fma(_4742, _4738, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4580 = _4748;
                    _4604 = _4756;
                    _4506 = _4752;
                    _4592 = _4754;
                    _4526 = _4750;
                    _4612 = _4758;
                    _4674 = true;
                }
                else
                {
                    _4580 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4604 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4506 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4592 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4526 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4612 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4674 = false;
    float _4760 = _4580;
    float _4762 = _4604;
    float _4764 = _4506;
    float _4766 = _4592;
    float _4768 = _4526;
    float _4770 = _4612;
    float _4772 = fma(_3649, -0.5, 0.5);
    float _4774 = precise::clamp(_4772, 0.0, 1.0);
    float _4776 = -_4760;
    float _4778 = _4776 + _4762;
    float _4780 = _4550 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4782 = -_4764;
    float _4784 = _4782 + _4766;
    float _4786 = fma(_4774, _4778, _4760);
    out.m_113.x = 0.0;
    float _4788 = -_4768;
    float _4790 = _4788 + _4770;
    float _4792 = fma(_4774, _4784, _4764);
    float _4794 = _4786 * 0.586610972881317138671875;
    out.m_53.x = _4780;
    bool _4796 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4798 = fma(_4774, _4790, _4768);
    float _4800 = fma(_4792, 0.298911988735198974609375, _4794);
    bool _4802 = _4099 > 0.0;
    bool _4804 = isnan(_4099);
    bool _4806 = _4802 || _4804;
    bool _4808 = isnan(0.0);
    bool _4810 = _4806 || _4808;
    float _4812 = fma(_4798, 0.114477999508380889892578125, _4800);
    float _4814 = -_4812;
    float _4816 = _4792 + _4814;
    float _4818 = -_4812;
    float _4820 = _4786 + _4818;
    float _4822 = -_4812;
    float _4824 = _4798 + _4822;
    float _4826 = fma(_4816, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    float _4828 = fma(_4820, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    float _4830 = fma(_4824, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4812);
    bool _4832 = !_4796;
    if (!_4832)
    {
        float _4834 = -_4035;
        float _4836 = _4834 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _4838 = -_4037;
        float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _4842 = -_4039;
        float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _4846 = _4836 * _4836;
        float _4848 = fma(_4840, _4840, _4846);
        float _4850 = fma(_4844, _4844, _4848);
        float _4852 = sqrt(_4850);
        float _4854 = rsqrt(_4850);
        float _4856 = -_4852;
        float _4858 = _4856 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _4860 = _4858 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _4862 = precise::clamp(_4860, 0.0, 1.0);
        float _4864 = _4840 * _4854;
        float _4866 = _4836 * _4854;
        float _4868 = abs(_4862);
        float _4870 = log2(_4868);
        float _4872 = _4844 * _4854;
        float _4874 = _4864 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _4876 = _3649 * _4866;
        float _4878 = -_4866;
        float _4880 = -_4874;
        float _4882 = fma(_4878, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4880);
        float _4884 = fma(_3653, _4864, _4876);
        float _4886 = -_4872;
        float _4888 = fma(_4886, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4882);
        float _4890 = fma(_3661, _4872, _4884);
        float _4892 = precise::clamp(_4890, 0.0, 1.0);
        float _4894 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _4896 = _4888 + _4894;
        float _4898 = _4870 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _4900 = _4896 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _4902 = precise::clamp(_4900, 0.0, 1.0);
        float _4904 = exp2(_4898);
        float _4906 = _4904 * _4902;
        float _4908 = _4892 * _4906;
        float _4910 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _4912 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _4914 = _4908 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _4910;
        out.m_113.y = _4912;
        out.m_113.z = _4914;
    }
    out.m_79.x = _4826;
    out.m_79.y = _4828;
    out.m_79.z = _4830;
    if (_4810)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _4916 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _4916;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

