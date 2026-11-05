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
    texture2d<float> vp_t_tcb_20 [[id(14)]];
    sampler vp_t_tcb_20Smplr [[id(15)]];
    sampler vp_t_tcb_24Smplr_w [[id(16)]];
    sampler vp_t_tcb_32Smplr_w [[id(17)]];
    sampler vp_t_tcb_30Smplr_w [[id(18)]];
    sampler vp_t_tcb_1CSmplr_w [[id(19)]];
    sampler vp_t_tcb_20Smplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_83 [[user(locn2)]];
    float4 m_101 [[user(locn3)]];
    float4 m_113 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_71 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_97 [[user(locn12)]];
    float4 m_103 [[user(locn13)]];
    float4 m_99 [[user(locn14)]];
    float4 m_111 [[user(locn15)]];
    float4 m_107 [[user(locn16)]];
    float4 m_105 [[user(locn17)]];
    float4 m_109 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_95 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_79 [[attribute(4)]];
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
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6728 = false;
    bool _1224 = false;
    bool _900 = false;
    bool _720 = false;
    bool _528 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _7033 = as_type<float>(_148);
        out.gl_Position.z = _7033;
    }
    if (!_136)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _152 = in.m_53.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_51.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7102 = as_type<float>(_186);
        out.gl_Position.z = _7102;
    }
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _188 = in.m_55.x;
    float _190 = in.m_55.y;
    float _192 = in.m_55.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_57.x;
    float _198 = in.m_57.y;
    float _200 = in.m_57.z;
    float _202 = in.m_59.x;
    float _204 = in.m_59.y;
    float _206 = in.m_59.z;
    float _208 = in.m_61.x;
    float _210 = in.m_61.y;
    float _212 = in.m_61.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_63.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = 1.0 / _280;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _284;
    bool _296 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_260);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _276;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _260 + _310;
    float _314 = _312 * _290;
    bool _316 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _318 = isnan(_260);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _288;
    float _330 = _264 * _294;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = _268 * _308;
    bool _342 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _344 = isnan(_260);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_326;
    float _356 = _354 + 1.0;
    float _358 = fma(_338, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _360 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = _352 * _356;
    float _364 = -_352;
    float _366 = _364 + 1.0;
    float _368 = _272 * _328;
    bool _370 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = isnan(_260);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    bool _386 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_260);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = fma(_384, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _380 * _366;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = _306 * _406;
    float _420 = -_306;
    float _422 = _420 + 1.0;
    float _424 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_412, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = _396 * _422;
    float _432 = -_396;
    float _434 = _432 + 1.0;
    float _436 = _358 * _430;
    float _438 = _360 * _430;
    float _440 = _402 * _430;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _442;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _448 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_424, _418, _446);
    float _462 = fma(_426, _418, _448);
    float _464 = fma(_428, _418, _450);
    float _466 = fma(_444, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_454, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_458, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_466, _408, _460);
    float _486 = fma(_474, _314, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _488 = fma(_478, _314, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _490 = fma(_482, _314, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_468, _408, _462);
    float _494 = fma(_470, _408, _464);
    float _496 = fma(_486, _362, _484);
    float _498 = fma(_488, _362, _492);
    float _500 = fma(_490, _362, _494);
    float _502 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _496);
    float _504 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _498);
    float _506 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].z, _500);
    bool _508 = !_292;
    float _526;
    if (!_508)
    {
        float _510 = in.m_63.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_132);
        float _532 = 1.0 / _530;
        float _534 = _166 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _536 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_536);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _568 = isnan(_536);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = 1.0 / _544;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _580;
    float _584 = -_560;
    float _586 = _584 + 1.0;
    bool _588 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_536);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _602 = 1.0 / _548;
    float _604 = 1.0 / _564;
    float _606 = _582 * _578;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _612 = _576 * _586;
    float _614 = -_576;
    float _616 = _614 + 1.0;
    float _618 = fma(_606, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _620;
    float _624 = _598 * _616;
    float _626 = _610 * _602;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _536 + _628;
    bool _632 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _634 = isnan(_536);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = _618 * _624;
    float _646 = -_598;
    float _648 = _646 + 1.0;
    float _650 = fma(_626, _630, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _536 + _652;
    float _656 = _622 * _604;
    float _658 = -_642;
    float _660 = _658 + 1.0;
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _664 = fma(_656, _654, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _666 = _560 * _660;
    float _668 = fma(_650, _612, _662);
    float _670 = in.m_65.x;
    float _672 = in.m_65.y;
    float _674 = in.m_65.z;
    float _676 = fma(_664, _666, _668);
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _680 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[118].x, _676);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _686;
    out.m_67.y = _690;
    out.m_67.z = _692;
    out.m_67.w = _688;
    float _694 = _506 * _674;
    float _696 = _504 * _672;
    float _698 = _502 * _670;
    bool _700 = !_600;
    float _718;
    if (!_700)
    {
        float _702 = in.m_63.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_132);
        float _724 = 1.0 / _722;
        float _726 = _166 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _738 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _740 = isnan(_728);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _758 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _760 = isnan(_728);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = 1.0 / _736;
    float _772 = -_748;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _776;
    bool _780 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _782 = isnan(_728);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _768 * _774;
    float _794 = -_768;
    float _796 = _794 + 1.0;
    bool _798 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _800 = 1.0 / _752;
    float _802 = _790 * _796;
    float _804 = -_790;
    float _806 = _804 + 1.0;
    float _808 = 1.0 / _756;
    float _810 = _778 * _770;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _816 = fma(_810, _732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _818 = _814 * _800;
    bool _820 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _822 = isnan(_728);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _838 = _728 + _836;
    float _840 = _816 * _802;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _844 = _728 + _842;
    float _846 = -_830;
    float _848 = _846 + 1.0;
    float _850 = fma(_818, _838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _852 = _834 * _808;
    float _854 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[131].x, _840);
    float _856 = _748 * _848;
    float _858 = fma(_852, _844, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _860 = fma(_850, _792, _854);
    float _862 = fma(_858, _856, _860);
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _870 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[134].x, _862);
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _872;
    out.m_69.y = _874;
    out.m_69.z = _876;
    out.m_69.w = _878;
    bool _880 = !_798;
    float _898;
    if (!_880)
    {
        float _882 = in.m_63.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_132);
        float _904 = 1.0 / _902;
        float _906 = _166 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _912 = _908 + _910;
    bool _914 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _916 = isnan(_908);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _930;
    bool _934 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _936 = isnan(_908);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -_924;
    float _948 = _946 + 1.0;
    bool _950 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _952 = isnan(_908);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = 1.0 / _928;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _968 = _944 * _948;
    float _970 = -_960;
    float _972 = _970 + 1.0;
    float _974 = 1.0 / _966;
    bool _976 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _978 = _932 * _962;
    float _980 = -_944;
    float _982 = _980 + 1.0;
    bool _984 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _986 = isnan(_908);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = fma(_978, _912, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _998 = _960 * _982;
    bool _1000 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1002 = isnan(_908);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _994 * _972;
    float _1014 = -_994;
    float _1016 = _1014 + 1.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1022 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1024 = isnan(_908);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = _1010 * _1016;
    float _1036 = -_1010;
    float _1038 = _1036 + 1.0;
    bool _1040 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1042 = isnan(_908);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = 1.0 / _1020;
    float _1054 = -_1032;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1062 = _1032 * _1038;
    float _1064 = _1050 * _1056;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1070 = -_1050;
    float _1072 = _1070 + 1.0;
    float _1074 = 1.0 / _1060;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1080 = _996 * _1064;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1088 = _908 + _1086;
    float _1090 = _1078 * _974;
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1080);
    float _1094 = 1.0 / _1068;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1096;
    float _1100 = fma(_1090, _1088, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1108 = _908 + _1106;
    float _1110 = _1098 * _1052;
    float _1112 = fma(_1100, _1062, _1092);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1116 = _908 + _1114;
    float _1118 = 1.0 / _1084;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = fma(_1110, _1108, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1126 = _1122 * _1074;
    bool _1128 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1130 = isnan(_908);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1140;
    float _1144 = 1.0 / _1104;
    float _1146 = fma(_1124, _1034, _1112);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = _1142 * _1094;
    float _1154 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1158 = _908 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1162 = _908 + _1160;
    float _1164 = _1150 * _1118;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1166;
    float _1170 = fma(_1152, _1158, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1172 = fma(_1154, _1012, _1146);
    float _1174 = fma(_1164, _1162, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1176 = -_1138;
    float _1178 = _1176 + 1.0;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1182 = _908 + _1180;
    float _1184 = fma(_1170, _998, _1172);
    float _1186 = _1168 * _1144;
    float _1188 = _924 * _1178;
    float _1190 = fma(_1174, _968, _1184);
    float _1192 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1194 = fma(_1192, _1188, _1190);
    float _1196 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1194);
    out.m_71.x = _1196;
    bool _1198 = !_976;
    int _1200 = as_type<int>(_968);
    float _1202 = _1094;
    float _1204 = _1144;
    float _1222;
    if (!_1198)
    {
        float _1206 = in.m_63.x;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1210 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].y, _166);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        float _1226 = float(_132);
        float _1228 = 1.0 / _1226;
        float _1230 = _166 * _1228;
        _1222 = _1230;
    }
    _1224 = false;
    float _1232 = _1222;
    float _1234 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1236 = int(_1234);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1248 = int(_1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1256 = _1254 != 0;
    float _1258 = 0.0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1262 = _1252;
    bool _1264 = _1256;
    if (_1240)
    {
        _1258 = 1.0;
    }
    float _1266 = _1258;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1270 = int(_1268);
    float _1272 = float(_1236);
    float _1274 = 0.0;
    float _1276 = _1266;
    if (_1240)
    {
        _1274 = 1.0;
    }
    float _1278 = _1274;
    float _1280 = 0.0;
    float _1282 = _1278;
    if (_1240)
    {
        _1280 = 1.0;
    }
    float _1284 = _1280;
    int _1286 = 0;
    float _1288 = _1284;
    if (_1240)
    {
        _1286 = 0;
    }
    int _1290 = _1286;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1294 = int(_1292);
    float _1296 = float(_1248);
    int _1298 = _1290;
    if (_1240)
    {
        _1260 = 0;
    }
    int _1300 = _1260;
    float _1302 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1304 = int(_1302);
    float _1306 = float(_1270);
    float _1308 = float(_1294);
    float _1310 = 1.0 / _1272;
    float _1312 = float(uint(_1304));
    float _1314 = 1.0 / _1296;
    float _1316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1318 = int(_1316);
    float _1320 = _1310 * _166;
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1324 = int(_1322);
    float _1326 = _1314 * _166;
    float _1328 = _1314;
    int _1330 = _1300;
    if (_1240)
    {
        float _1332 = in.m_63.z;
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1338 = int(_1336);
    float _1340 = float(uint(_1318));
    float _1342 = 1.0 / _1306;
    float _1344 = float(uint(_1324));
    float _1346 = 1.0 / _1308;
    float _1348 = float(uint(_1338));
    int _1350 = 0;
    float _1352 = _1334;
    if (_1240)
    {
        _1350 = as_type<int>(_1334);
    }
    int _1354 = _1350;
    float _1356 = 1.0 / _1312;
    float _1358 = _1342 * _166;
    float _1360 = _1346 * _166;
    float _1362 = 1.0 / _1344;
    int _1364 = as_type<int>(_1356) + (-2);
    float _1366 = 1.0 / _1348;
    float _1368 = in.m_73.x;
    float _1370 = _1356;
    int _1372 = _1354;
    if (_1240)
    {
        float _1374 = in.m_63.x;
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = trunc(_1320);
    int _1380 = int(_1378);
    int _1382 = as_type<int>(_1362) + (-2);
    float _1384 = trunc(_1326);
    int _1386 = int(_1384);
    int _1388 = as_type<int>(_1366) + (-2);
    float _1390 = 1.0 / _1340;
    float _1392 = float(uint(_1380));
    float _1394 = _1376;
    float _1396 = _1368;
    if (_1252)
    {
        float _1398 = -_1368;
        float _1400 = _1398 + 1.0;
        _1200 = as_type<int>(_1400);
    }
    int _1402 = _1200;
    if (!_1256)
    {
        _1202 = _1368;
    }
    float _1404 = _1202;
    float _1406 = 0.0;
    float _1408 = _1404;
    if (!_1252)
    {
        _1406 = _1368;
    }
    float _1410 = _1406;
    float _1412 = as_type<float>(_1382) * _1392;
    float _1414 = _1410;
    if (!_1244)
    {
        _1204 = _1368;
    }
    float _1416 = _1204;
    float _1418 = trunc(_1360);
    int _1420 = int(_1418);
    float _1422 = in.m_63.y;
    float _1424 = float(uint(_1386));
    float _1426 = as_type<float>(_1388) * _1424;
    float _1428 = trunc(_1358);
    int _1430 = int(_1428);
    int _1432 = as_type<int>(_1390) + (-2);
    float _1434 = float(uint(_1420));
    float _1436 = trunc(_1412);
    float _1438 = precise::max(_1436, 0.0);
    uint _1441 = uint(_1438);
    float _1443 = as_type<float>(_1364) * _1434;
    float _1445 = float(uint(_1430));
    float _1447 = trunc(_1426);
    float _1449 = precise::max(_1447, 0.0);
    uint _1451 = uint(_1449);
    bool _1453 = _1422 > 0.5;
    int _1455 = 0;
    float _1457 = _1416;
    if (_1240)
    {
        _1455 = as_type<int>(_1422);
    }
    int _1459 = _1455;
    float _1461 = as_type<float>(_1432) * _1445;
    float _1463 = _1461;
    int _1465 = _1459;
    if (_1252)
    {
        float _1467 = _1453 ? as_type<float>(_1402) : _1368;
        _1414 = _1467;
    }
    float _1469 = _1414;
    float _1471 = trunc(_1443);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = trunc(_1461);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    int _1483 = int(_1252);
    int _1485 = _1244 ? 2 : 0;
    int _1487 = _1483 | _1485;
    int _1489 = _1256 ? 4 : 0;
    int _1491 = _1487 | _1489;
    int _1493 = _1240 ? 8 : 0;
    int _1495 = _1491 | _1493;
    int _1497 = false ? 16 : 0;
    int _1499 = _1495 | _1497;
    int _1501 = _1453 ? 32 : 0;
    int _1503 = _1499 | _1501;
    int _1505 = false ? 64 : 0;
    int _1507 = _1503 | _1505;
    int _1509 = _1507 & 32;
    int _1511 = _1509;
    if (_1256)
    {
        float _1513 = -_1368;
        float _1515 = _1513 + 1.0;
        _1511 = as_type<int>(_1515);
    }
    int _1517 = _1511;
    float _1519 = as_type<float>(_1517);
    if (_1256)
    {
        float _1521 = _1453 ? as_type<float>(_1517) : _1368;
        _1408 = _1521;
    }
    float _1523 = _1408;
    if (_1240)
    {
        _1463 = _1376;
    }
    float _1525 = _1463;
    float _1527 = _1525;
    if (_1240)
    {
        _1519 = _1525;
    }
    float _1529 = _1519;
    int _1531 = 0;
    float _1533 = _1529;
    if (_1240)
    {
        _1531 = as_type<int>(_1525);
    }
    int _1535 = _1531;
    int _1537 = _1535;
    if (!_1240)
    {
        float _1539 = in.m_63.x;
        float _1541 = _1422 * 3.1415927410125732421875;
        float _1543 = in.m_63.z;
        float _1545 = _1541 * 0.15915493667125701904296875;
        float _1547 = _1545 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = _1539 * 3.1415927410125732421875;
        float _1553 = _1551 * 0.15915493667125701904296875;
        float _1555 = _1543 * 3.1415927410125732421875;
        float _1557 = _1555 * 0.15915493667125701904296875;
        float _1559 = _1553 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = _1557 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        _1533 = _1543;
        _1288 = 5.839270114898681640625;
        _1394 = _1539;
        _1276 = 7.345489978790283203125;
        _1527 = _1422;
        _1282 = 1.2345600128173828125;
        _1298 = 1;
        _1352 = _1543;
        _1372 = as_type<int>(_1565);
        _1465 = as_type<int>(_1549);
        _1330 = 2;
        _1537 = as_type<int>(_1561);
    }
    float _1567 = _1533;
    float _1569 = _1288;
    float _1571 = _1394;
    float _1573 = _1276;
    float _1575 = _1527;
    float _1577 = _1282;
    int _1579 = _1298;
    float _1581 = _1352;
    int _1583 = _1372;
    int _1585 = _1465;
    int _1587 = _1330;
    int _1589 = _1537;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1593 = _1591 != 0;
    float _1595 = _1567 * _1569;
    float _1597 = 0.0;
    if (_1244)
    {
        float _1599 = in.m_63.x;
        _1597 = _1599;
    }
    float _1601 = _1597;
    int _1603 = ~_1324;
    int _1605 = _1603 + 1;
    float _1607 = _1571 * _1573;
    int _1609 = ~_1318;
    int _1611 = _1609 + 1;
    float _1613 = floor(_1595);
    int _1615 = ~_1304;
    int _1617 = _1615 + 1;
    int _1619 = _1605 * int(_1441);
    int _1621 = _1619 + _1380;
    int _1623 = ~_1338;
    int _1625 = _1623 + 1;
    int _1627 = _1611 * int(_1481);
    int _1629 = _1627 + _1430;
    float _1631 = _1575 * _1577;
    int _1633 = _1617 * int(_1475);
    int _1635 = _1633 + _1420;
    int _1637 = as_type<int>(_1567);
    if (_1593)
    {
        float _1639 = in.m_63.z;
        _1637 = as_type<int>(_1639);
    }
    int _1641 = _1637;
    float _1643 = float(uint(_1621));
    int _1645 = _1625 * int(_1451);
    int _1647 = _1645 + _1386;
    float _1649 = float(uint(_1629));
    float _1651 = _1575 * _1573;
    float _1653 = float(uint(_1635));
    float _1655 = as_type<float>(_1382) * _1643;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1659 = _1657 != 0;
    float _1661 = as_type<float>(_1432) * _1649;
    float _1663 = floor(_1607);
    float _1665 = as_type<float>(_1364) * _1653;
    float _1667 = float(uint(_1647));
    int _1669 = 0;
    float _1671 = _1661;
    float _1673 = _1665;
    if (_1593)
    {
        float _1675 = -_1368;
        float _1677 = _1675 + 1.0;
        _1669 = as_type<int>(_1677);
    }
    int _1679 = _1669;
    if (_1244)
    {
        bool _1681 = _1601 > 0.5;
        _1262 = _1681;
    }
    bool _1683 = _1262;
    float _1685 = -_1613;
    float _1687 = _1595 + _1685;
    float _1689 = float(_1380);
    float _1691 = as_type<float>(_1388) * _1667;
    float _1693 = trunc(_1655);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    int _1699 = ~_1338;
    int _1701 = _1699 + 1;
    bool _1703 = _1579 != 1;
    int _1705 = 0;
    if (_1659)
    {
        float _1707 = -_1368;
        float _1709 = _1707 + 1.0;
        _1705 = as_type<int>(_1709);
    }
    int _1711 = _1705;
    float _1713 = in.m_57.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1717 = _1232 + _1715;
    int _1719 = ~_1318;
    int _1721 = _1719 + 1;
    int _1723 = _1641;
    if (_1593)
    {
        bool _1725 = as_type<float>(_1641) > 0.5;
        _1264 = _1725;
    }
    bool _1727 = _1264;
    if (_1244)
    {
        float _1729 = -_1368;
        float _1731 = _1729 + 1.0;
        _1723 = as_type<int>(_1731);
    }
    int _1733 = _1723;
    float _1735 = trunc(_1661);
    float _1737 = precise::max(_1735, 0.0);
    uint _1739 = uint(_1737);
    float _1741 = -_1663;
    float _1743 = _1607 + _1741;
    float _1745 = float(_1324);
    float _1747 = in.m_59.w;
    if (_1244)
    {
        float _1749 = _1683 ? as_type<float>(_1733) : _1368;
        _1457 = _1749;
    }
    float _1751 = _1457;
    float _1753 = float(_132);
    float _1755 = _1745 * _1687;
    float _1757 = floor(_1651);
    if (!_1593)
    {
        _1671 = _1368;
    }
    float _1759 = _1671;
    float _1761 = in.m_61.w;
    float _1763 = _1759;
    if (_1593)
    {
        float _1765 = _1727 ? as_type<float>(_1679) : _1368;
        _1763 = _1765;
    }
    float _1767 = _1763;
    int _1769 = int(_1441) + int(_1697);
    float _1771 = float(_1318);
    float _1773 = trunc(_1665);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    int _1779 = int(_1481) + int(_1739);
    int _1781 = ~_1318;
    int _1783 = _1781 + 1;
    float _1785 = _1743 * _1771;
    float _1787 = float(_1420);
    float _1789 = float(_1386);
    float _1791 = floor(_1631);
    if (!_1659)
    {
        _1673 = _1368;
    }
    float _1793 = _1673;
    float _1795 = -_1757;
    float _1797 = _1651 + _1795;
    float _1799 = _1793;
    if (_1659)
    {
        float _1801 = _1453 ? as_type<float>(_1711) : _1368;
        _1799 = _1801;
    }
    float _1803 = _1799;
    int _1805 = _1783 * _1779;
    int _1807 = _1805 + _1430;
    int _1809 = ~_1324;
    int _1811 = _1809 + 1;
    float _1813 = float(_1430);
    float _1815 = 1.0 / _1753;
    int _1817 = int(_1475) + int(_1777);
    bool _1819 = _1689 >= _1745;
    bool _1821 = isnan(_1689);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(_1745);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    int _1831 = _1811 * _1769;
    int _1833 = _1831 + _1380;
    bool _1835 = _1813 >= _1771;
    bool _1837 = isnan(_1813);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1771);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1771 * _166;
    bool _1849 = uint(_1807) >= uint(_1318);
    float _1851 = trunc(_1691);
    float _1853 = precise::max(_1851, 0.0);
    uint _1855 = uint(_1853);
    float _1857 = -_1791;
    float _1859 = _1631 + _1857;
    float _1861 = float(_1304);
    float _1863 = float(_1338);
    bool _1865 = _1787 >= _1861;
    bool _1867 = isnan(_1787);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(_1861);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = _1861 * _1859;
    float _1879 = _1815 * _166;
    bool _1881 = uint(_1833) >= uint(_1324);
    float _1883 = _1847 * _1815;
    float _1885 = trunc(_1845);
    int _1887 = int(_1885);
    float _1889 = _1863 * _1879;
    bool _1891 = _1789 >= _1863;
    bool _1893 = isnan(_1789);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(_1863);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = _1861 * _1879;
    bool _1905 = _1318 == 0;
    float _1907 = _1745 * _1879;
    int _1909 = int(_1451) + int(_1855);
    float _1911 = trunc(_1785);
    int _1913 = int(_1911);
    int _1915 = ~_1304;
    int _1917 = _1915 + 1;
    float _1919 = _1863 * _1797;
    bool _1921 = !_1849;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = _1701 * _1909;
    int _1927 = _1925 + _1386;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1931 = _1929 != 0;
    int _1933 = _1917 * _1817;
    int _1935 = _1933 + _1420;
    int _1937 = ~_1779;
    int _1939 = _1937 + _1923;
    int _1941 = _1939 + 1;
    float _1943 = trunc(_1875);
    int _1945 = int(_1943);
    bool _1947 = !_1931;
    int _1949 = _1947 ? 0 : 1;
    bool _1951 = uint(_1927) >= uint(_1338);
    bool _1953 = uint(_1935) >= uint(_1304);
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1957 = _1955 != 0;
    float _1959 = trunc(_1829);
    int _1961 = int(_1959);
    bool _1963 = !_1881;
    int _1965 = _1963 ? 0 : (-1);
    int _1967 = abs(_1949);
    int _1969 = ~_1769;
    int _1971 = _1969 + _1965;
    int _1973 = _1971 + 1;
    bool _1975 = !_1951;
    int _1977 = _1975 ? 0 : (-1);
    float _1979 = trunc(_1877);
    int _1981 = int(_1979);
    bool _1983 = !_1953;
    int _1985 = _1983 ? 0 : (-1);
    int _1987 = _1913 * _1967;
    int _1989 = _1987 + _1430;
    bool _1991 = !_1957;
    int _1993 = _1991 ? 0 : 1;
    int _1995 = _1318 * _1941;
    int _1997 = _1995 + _1430;
    int _1999 = ~_1817;
    int _2001 = _1999 + _1985;
    int _2003 = _2001 + 1;
    int _2005 = ~_1909;
    int _2007 = _2005 + _1977;
    int _2009 = _2007 + 1;
    float _2011 = trunc(_1883);
    int _2013 = int(_2011);
    int _2015 = abs(_1993);
    int _2017 = _1304 * _2003;
    int _2019 = _2017 + _1420;
    int _2021 = ~_1887;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    int _2027 = _1324 * _1973;
    int _2029 = _2027 + _1380;
    bool _2031 = !_1905;
    int _2033 = _2031 ? _1997 : (-1);
    int _2035 = _1338 * _2009;
    int _2037 = _2035 + _1386;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2041 = _2039 != 0;
    float _2043 = trunc(_1755);
    int _2045 = int(_2043);
    int _2047 = _1981 * _2015;
    int _2049 = _2047 + _1420;
    int _2051 = _2033 * _2025;
    bool _2053 = !_2041;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = _1318 + (-1);
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2061 = _2059 != 0;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2065 = _2063 != 0;
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2069 = _2067 != 0;
    float _2071 = trunc(_1901);
    int _2073 = int(_2071);
    int _2075 = abs(_2055);
    int _2077 = _1887 * _2057;
    int _2079 = _2077 + _2051;
    bool _2081 = _1304 == 0;
    bool _2083 = !_2065;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _2045 * _2075;
    int _2089 = _2087 + _1380;
    bool _2091 = !_2061;
    int _2093 = _2091 ? 0 : 1;
    float _2095 = trunc(_1889);
    int _2097 = int(_2095);
    bool _2099 = _1324 == 0;
    int _2101 = abs(_2085);
    int _2103 = ~_1945;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    bool _2109 = !_2081;
    int _2111 = _2109 ? _2019 : (-1);
    int _2113 = _2079 * _2101;
    int _2115 = abs(_2093);
    float _2117 = in.m_73.y;
    int _2119 = ~_1961;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    int _2125 = _2107 * _2111;
    bool _2127 = !_2099;
    int _2129 = _2127 ? _2029 : (-1);
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2133 = _2131 != 0;
    int _2135 = _2123 * _2129;
    bool _2137 = !_2069;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = _2013 * _2115;
    int _2143 = _2141 + _2113;
    bool _2145 = !_2133;
    int _2147 = _2145 ? 0 : 1;
    int _2149 = abs(_2139);
    int _2151 = abs(_2147);
    bool _2153 = _1338 == 0;
    int _2155 = _1304 + (-1);
    int _2157 = _1989 * _2149;
    int _2159 = _2157 + _2143;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2167 = _2165 != 0;
    int _2169 = ~_2073;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    int _2175 = _1913 * _2151;
    int _2177 = _2175 + _2159;
    bool _2179 = !_2153;
    int _2181 = _2179 ? _2037 : (-1);
    int _2183 = _1945 * _2155;
    int _2185 = _2183 + _2125;
    bool _2187 = !_2167;
    int _2189 = _2187 ? 0 : 1;
    float _2191 = trunc(_1903);
    int _2193 = int(_2191);
    float _2195 = float(uint(_2177));
    int _2197 = _2173 * _2181;
    int _2199 = abs(_2189);
    int _2201 = _1324 + (-1);
    float _2203 = as_type<float>(_1432) * _2195;
    bool _2205 = !_2163;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2211 = _2209 != 0;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2215 = _2213 != 0;
    int _2217 = _1961 * _2201;
    int _2219 = _2217 + _2135;
    int _2221 = abs(_2207);
    int _2223 = _2185 * _2199;
    float _2225 = trunc(_2203);
    float _2227 = precise::max(_2225, 0.0);
    uint _2229 = uint(_2227);
    bool _2231 = !_2211;
    int _2233 = _2231 ? 0 : 1;
    int _2235 = _2193 * _2221;
    int _2237 = _2235 + _2223;
    int _2239 = _1338 + (-1);
    int _2241 = abs(_2233);
    int _2243 = ~_1318;
    int _2245 = _2243 + 1;
    int _2247 = _2073 * _2239;
    int _2249 = _2247 + _2197;
    bool _2251 = !_2215;
    int _2253 = _2251 ? 0 : 1;
    int _2255 = _2049 * _2241;
    int _2257 = _2255 + _2237;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2265 = _2263 != 0;
    float _2267 = trunc(_1907);
    int _2269 = int(_2267);
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2273 = _2271 != 0;
    int _2275 = _2245 * int(_2229);
    int _2277 = _2275 + _2177;
    int _2279 = abs(_2253);
    bool _2281 = !_2265;
    int _2283 = _2281 ? 0 : 1;
    bool _2285 = !_2273;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2291 = _2289 != 0;
    int _2293 = _1981 * _2279;
    int _2295 = _2293 + _2257;
    float _2297 = float(uint(_2277));
    int _2299 = abs(_2283);
    float _2301 = trunc(_1919);
    int _2303 = int(_2301);
    bool _2305 = !_2291;
    int _2307 = _2305 ? 0 : 1;
    float _2309 = as_type<float>(_1432) * _2297;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2313 = _2311 != 0;
    int _2315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2317 = _2315 != 0;
    int _2319 = _2219 * _2299;
    int _2321 = abs(_2307);
    bool _2323 = !_2261;
    int _2325 = _2323 ? 0 : 1;
    float _2327 = trunc(_2309);
    float _2329 = precise::max(_2327, 0.0);
    uint _2331 = uint(_2329);
    int _2333 = abs(_2287);
    float _2335 = float(uint(_2295));
    bool _2337 = !_2317;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = abs(_2325);
    float _2343 = as_type<float>(_1364) * _2335;
    int _2345 = abs(_2339);
    float _2347 = trunc(_2343);
    float _2349 = precise::max(_2347, 0.0);
    uint _2351 = uint(_2349);
    int _2353 = _2269 * _2341;
    int _2355 = _2353 + _2319;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2359 = _2357 != 0;
    int _2361 = _2303 * _2321;
    int _2363 = _2361 + _1386;
    int _2365 = int(_2229) + int(_2331);
    int _2367 = _2249 * _2345;
    int _2369 = ~_1304;
    int _2371 = _2369 + 1;
    int _2373 = _2089 * _2333;
    int _2375 = _2373 + _2355;
    bool _2377 = !_2313;
    int _2379 = _2377 ? 0 : 1;
    bool _2381 = !_2359;
    int _2383 = _2381 ? 0 : 1;
    int _2385 = abs(_2379);
    int _2387 = _2371 * int(_2351);
    int _2389 = _2387 + _2295;
    int _2391 = ~_1318;
    int _2393 = _2391 + 1;
    int _2395 = abs(_2383);
    int _2397 = _2097 * _2385;
    int _2399 = _2397 + _2367;
    int _2401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2403 = _2401 != 0;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2407 = _2405 != 0;
    float _2409 = float(uint(_2389));
    int _2411 = _2045 * _2395;
    int _2413 = _2411 + _2375;
    bool _2415 = !_2403;
    int _2417 = _2415 ? 0 : 1;
    float _2419 = as_type<float>(_1364) * _2409;
    bool _2421 = !_2407;
    int _2423 = _2421 ? 0 : 1;
    int _2425 = _2393 * _2365;
    int _2427 = _2425 + _2177;
    float _2429 = float(uint(_2413));
    int _2431 = abs(_2417);
    float _2433 = trunc(_2419);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    bool _2439 = uint(_2427) >= uint(_1318);
    float _2441 = as_type<float>(_1382) * _2429;
    int _2443 = abs(_2423);
    bool _2445 = !_2439;
    int _2447 = _2445 ? 0 : (-1);
    float _2449 = trunc(_2441);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2457 = _2455 != 0;
    int _2459 = _2363 * _2431;
    int _2461 = _2459 + _2399;
    int _2463 = ~_2365;
    int _2465 = _2463 + _2447;
    int _2467 = _2465 + 1;
    bool _2469 = _1318 == 0;
    int _2471 = _2303 * _2443;
    int _2473 = _2471 + _2461;
    int _2475 = ~_1324;
    int _2477 = _2475 + 1;
    int _2479 = _1318 * _2467;
    int _2481 = _2479 + _2177;
    bool _2483 = _1422 > 0.5;
    float _2485 = in.m_63.w;
    float _2487 = float(uint(_2473));
    bool _2489 = !_2469;
    int _2491 = _2489 ? _2481 : (-1);
    int _2493 = _2385;
    if (_2457)
    {
        float _2495 = -_1368;
        float _2497 = _2495 + 1.0;
        _2493 = as_type<int>(_2497);
    }
    int _2499 = _2493;
    int _2501 = int(_2351) + int(_2437);
    float _2503 = as_type<float>(_1388) * _2487;
    int _2505 = _2491 & 3;
    bool _2507 = _2505 != 0;
    int _2509 = _2477 * int(_2453);
    int _2511 = _2509 + _2413;
    if (_2457)
    {
        float _2513 = _2483 ? as_type<float>(_2499) : _1368;
        _1396 = _2513;
    }
    float _2515 = _1396;
    float _2517 = trunc(_2503);
    float _2519 = precise::max(_2517, 0.0);
    uint _2521 = uint(_2519);
    int _2523 = ~_1304;
    int _2525 = _2523 + 1;
    float _2527 = -_2117;
    float _2529 = _2527 + 1.0;
    bool _2531 = uint(_2505) > 1u;
    float _2533 = float(uint(_2511));
    int _2535 = _2525 * _2501;
    int _2537 = _2535 + _2295;
    int _2539 = _2491 & 3;
    bool _2541 = _2539 != 0;
    int _2543 = _2483 ? as_type<int>(_2529) : as_type<int>(_2117);
    float _2545 = as_type<float>(_1382) * _2533;
    int _2547 = _2541 ? 0 : 1;
    bool _2549 = uint(_2537) >= uint(_1304);
    float _2551 = trunc(_2545);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = ~_1338;
    int _2559 = _2557 + 1;
    int _2561 = ~_2547;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2565;
    if (!_2531)
    {
        int _2569 = ~_2547;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    int _2575 = _2559 * int(_2521);
    int _2577 = _2575 + _2473;
    bool _2579 = !_2549;
    int _2581 = _2579 ? 0 : (-1);
    bool _2583 = _2505 != 3;
    int _2585 = ~_2501;
    int _2587 = _2585 + _2581;
    int _2589 = _2587 + 1;
    float _2591 = float(uint(_2577));
    bool _2593 = uint(_2505) >= 2u;
    int _2595 = _1304 * _2589;
    int _2597 = _2595 + _2295;
    bool _2599 = _1304 == 0;
    float _2601 = as_type<float>(_1388) * _2591;
    int _2603 = _2593 ? 0 : 1;
    bool _2605 = _2485 > 0.5;
    int _2607 = ~_1324;
    int _2609 = _2607 + 1;
    float _2611 = trunc(_2601);
    float _2613 = precise::max(_2611, 0.0);
    uint _2615 = uint(_2613);
    int _2617 = int(_2453) + int(_2555);
    bool _2619 = !_2599;
    int _2621 = _2619 ? _2597 : (-1);
    int _2623 = ~_2603;
    int _2625 = _2623 + 1;
    int _2627 = _2625 + 1;
    int _2629 = _2609 * _2617;
    int _2631 = _2629 + _2413;
    int _2633 = _2627;
    if (_2583)
    {
        int _2635 = ~_2603;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    int _2641 = _2605 ? as_type<int>(_2529) : as_type<int>(_2117);
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2645 = _2643 != 0;
    int _2647 = _2621 & 3;
    bool _2649 = _2647 != 0;
    bool _2651 = !_2645;
    int _2653 = _2651 ? 0 : 1;
    bool _2655 = uint(_2647) >= 2u;
    int _2657 = _2649 ? 0 : 1;
    bool _2659 = uint(_2631) >= uint(_1324);
    int _2661 = _2655 ? 0 : 1;
    bool _2663 = _2647 != 3;
    bool _2665 = !_2659;
    int _2667 = _2665 ? 0 : (-1);
    int _2669 = ~_1338;
    int _2671 = _2669 + 1;
    bool _2673 = uint(_2647) > 1u;
    int _2675 = ~_2617;
    int _2677 = _2675 + _2667;
    int _2679 = _2677 + 1;
    int _2681 = int(_2521) + int(_2615);
    int _2683 = _1324 * _2679;
    int _2685 = _2683 + _2413;
    bool _2687 = _1324 == 0;
    int _2689 = ~_2661;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2671 * _2681;
    int _2697 = _2695 + _2473;
    int _2699 = _2693;
    if (_2663)
    {
        int _2701 = ~_2661;
        int _2703 = _2701 + 1;
        _2699 = _2703;
    }
    int _2705 = _2699;
    int _2707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2709 = _2707 != 0;
    int _2711 = ~_2657;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    bool _2717 = !_2687;
    int _2719 = _2717 ? _2685 : (-1);
    int _2721 = _2715;
    if (!_2673)
    {
        int _2723 = ~_2657;
        int _2725 = _2723 + 1;
        _2721 = _2725;
    }
    int _2727 = _2721;
    bool _2729 = uint(_2697) >= uint(_1338);
    bool _2731 = !_2709;
    int _2733 = _2731 ? 0 : 1;
    int _2735 = _2719 & 3;
    bool _2737 = _2735 != 0;
    bool _2739 = !_2729;
    int _2741 = _2739 ? 0 : (-1);
    int _2743 = _2737 ? 0 : 1;
    bool _2745 = uint(_2735) >= 2u;
    bool _2747 = _2735 != 3;
    int _2749 = ~_2681;
    int _2751 = _2749 + _2741;
    int _2753 = _2751 + 1;
    int _2755 = _2745 ? 0 : 1;
    bool _2757 = uint(_2735) > 1u;
    int _2759 = _1338 * _2753;
    int _2761 = _2759 + _2473;
    bool _2763 = _1338 == 0;
    int _2765 = ~_2755;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    bool _2771 = !_2763;
    int _2773 = _2771 ? _2761 : (-1);
    int _2775 = _2769;
    if (_2747)
    {
        int _2777 = ~_2755;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    int _2783 = _2773 & 3;
    bool _2785 = _2783 != 0;
    int _2787 = ~_2743;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = _2791;
    if (!_2757)
    {
        int _2795 = ~_2743;
        int _2797 = _2795 + 1;
        _2793 = _2797;
    }
    int _2799 = _2793;
    bool _2801 = uint(_2783) >= 2u;
    int _2803 = _2785 ? 0 : 1;
    int _2805 = _2801 ? 0 : 1;
    bool _2807 = _2783 != 3;
    bool _2809 = uint(_2783) > 1u;
    int _2811 = ~_2805;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = ~_2803;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    float _2823 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2825 = _2823 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2827 = _2815;
    int _2829 = _2821;
    if (_2807)
    {
        int _2831 = ~_2805;
        int _2833 = _2831 + 1;
        _2827 = _2833;
    }
    int _2835 = _2827;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2809)
    {
        int _2841 = ~_2803;
        int _2843 = _2841 + 1;
        _2829 = _2843;
    }
    int _2845 = _2829;
    float _2847 = 1.0 / _2825;
    float _2849 = in.m_48.x;
    float _2851 = in.m_48.y;
    float _2853 = in.m_48.z;
    int _2855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2857 = _2855 != 0;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2861 = _2859 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2865 = _2863 != 0;
    bool _2867 = !_2857;
    int _2869 = _2867 ? 0 : 1;
    float _2871 = _2865 ? as_type<float>(_2543) : _2117;
    float _2873 = 1.0 / _2839;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2877 = _2875 != 0;
    bool _2879 = _1581 > 0.5;
    float _2881 = _2877 ? as_type<float>(_2641) : _2117;
    int _2883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2885 = _2883 != 0;
    float _2887 = 1.0 / _2861;
    int _2889 = _2879 ? as_type<int>(_2529) : as_type<int>(_2117);
    int _2891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2893 = _2891 != 0;
    float _2895 = _2885 ? as_type<float>(_2889) : _2117;
    float _2897 = _2893 ? as_type<float>(_2889) : _2117;
    float _2899 = _198 * _2851;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2903 = _2901 != 0;
    int _2905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2907 = _2905 != 0;
    float _2909 = _204 * _2851;
    int _2911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2913 = _2911 != 0;
    float _2915 = _210 * _2851;
    float _2917 = fma(_196, _2849, _2899);
    float _2919 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2921 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2923 = _2921 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2925 = fma(_202, _2849, _2909);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2929 = fma(_208, _2849, _2915);
    float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2935 = fma(_200, _2853, _2917);
    float _2937 = fma(_2919, -2.0, _2927);
    float _2939 = _1571 * 2.0;
    float _2941 = 1.0 / _2933;
    float _2943 = fma(_206, _2853, _2925);
    float _2945 = fma(_212, _2853, _2929);
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2949 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2947;
    float _2951 = floor(_2939);
    float _2953 = _2903 ? as_type<float>(_2889) : _2117;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2959 = _2907 ? as_type<float>(_2889) : _2117;
    float _2961 = _2949 * _2847;
    bool _2963 = !_2913;
    int _2965 = _2963 ? 0 : 1;
    float _2967 = _2935 + _1713;
    float _2969 = float(uint(_2049));
    float _2971 = 1.0 / _2923;
    float _2973 = float(uint(_2089));
    float _2975 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2937);
    int _2977 = ~_1304;
    int _2979 = _2977 + 1;
    float _2981 = float(uint(_2363));
    float _2983 = as_type<float>(_1382) * _2973;
    bool _2985 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2987 = isnan(_1232);
    bool _2989 = _2985 || _2987;
    bool _2991 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2993 = _2989 || _2991;
    float _2995 = float(_2993);
    float _2997 = 1.0 / _2957;
    float _2999 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3001 = _2999 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3003;
    bool _3007 = _2951 > 0.0;
    float _3009 = as_type<float>(_1388) * _2981;
    float _3011 = _3001 * _2873;
    float _3013 = _3005 * _2887;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3017 = _3015 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3019 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3021 = _3019 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _3023 = _2951 >= 0.0;
    bool _3025 = isnan(_2951);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan(0.0);
    bool _3031 = _3027 || _3029;
    float _3033 = 1.0 / _3017;
    float _3035 = _3021 * _2941;
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3037;
    int _3041 = _3031 ? 0 : 1;
    float _3043 = fma(_3013, _1717, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3045 = _3039 * _2971;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3049 = _3047 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3051 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3051;
    float _3055 = _1422 * 2.0;
    float _3057 = float(uint(_1989));
    float _3059 = _3049 * _2997;
    int _3061 = ~_3041;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    float _3067 = floor(_3055);
    int _3069 = _3065;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3073 = _2873;
    float _3075 = _2997;
    if (!_3007)
    {
        int _3077 = ~_3041;
        int _3079 = _3077 + 1;
        _3069 = _3079;
    }
    int _3081 = _3069;
    float _3083 = _3053 * _3033;
    bool _3085 = !_1703;
    float _3087 = _3085 ? as_type<float>(_1583) : as_type<float>(_1585);
    float _3089 = as_type<float>(_1432) * _3057;
    float _3091 = _3033;
    if (!_1703)
    {
        _3071 = _1422;
    }
    float _3093 = _3071;
    float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3097 = _1232 + _3095;
    float _3099 = _3093;
    if (!_1703)
    {
        _3073 = _1422;
    }
    float _3101 = _3073;
    float _3103 = trunc(_3089);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    float _3109 = _3101;
    if (!_1703)
    {
        _3075 = _1581;
    }
    float _3111 = _3075;
    float _3113 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3115 = _1232 + _3113;
    float _3117 = _3111;
    if (!_1703)
    {
        _3091 = _1581;
    }
    float _3119 = _3091;
    bool _3121 = _1587 != 2;
    bool _3123 = !_1703;
    float _3125 = _3123 ? as_type<float>(_1585) : as_type<float>(_1589);
    float _3127 = fma(_3011, _3115, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3129 = _3119;
    float _3131 = _3127;
    if (_1703)
    {
        _3099 = _1571;
    }
    float _3133 = _3099;
    float _3135 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3137 = _1232 + _3135;
    if (_1703)
    {
        _3109 = _1571;
    }
    float _3139 = _3109;
    float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3143 = _1232 + _3141;
    if (_1703)
    {
        _3117 = _1422;
    }
    float _3145 = _3117;
    float _3147 = _3133 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1703)
    {
        _3129 = _1422;
    }
    float _3149 = _3129;
    bool _3151 = _3067 > 0.0;
    int _3153 = _1721 * int(_3107);
    int _3155 = _3153 + _1989;
    bool _3157 = _3067 >= 0.0;
    bool _3159 = isnan(_3067);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan(0.0);
    bool _3165 = _3161 || _3163;
    float _3167 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3169 = _1232 + _3167;
    bool _3171 = _2783 != 3;
    float _3173 = float(uint(_3155));
    float _3175 = fma(_2961, _3169, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3179 = _1232 + _3177;
    float _3181 = as_type<float>(_1432) * _3173;
    float _3183 = fma(_3035, _3179, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3185 = fma(_3059, _3097, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3187 = fma(_3083, _3143, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3189 = _2943 + _1747;
    float _3191 = as_type<float>(_1364) * _2969;
    bool _3193 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3195 = isnan(_1232);
    bool _3197 = _3193 || _3195;
    bool _3199 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3201 = _3197 || _3199;
    float _3203 = float(_3201);
    float _3205 = fma(_3045, _3137, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _3207 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3209 = isnan(_1232);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = trunc(_3181);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    bool _3225 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3227 = isnan(_1232);
    bool _3229 = _3225 || _3227;
    bool _3231 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3233 = _3229 || _3231;
    float _3235 = float(_3233);
    float _3237 = -_3203;
    float _3239 = _3237 + 1.0;
    bool _3241 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3243 = isnan(_1232);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3249 = _3245 || _3247;
    float _3251 = float(_3249);
    float _3253 = -_3217;
    float _3255 = _3253 + 1.0;
    bool _3257 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3259 = isnan(_1232);
    bool _3261 = _3257 || _3259;
    bool _3263 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3265 = _3261 || _3263;
    float _3267 = float(_3265);
    float _3269 = _3217 * _3239;
    bool _3271 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3273 = isnan(_1232);
    bool _3275 = _3271 || _3273;
    bool _3277 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3279 = _3275 || _3277;
    float _3281 = float(_3279);
    float _3283 = trunc(_3191);
    float _3285 = precise::max(_3283, 0.0);
    uint _3287 = uint(_3285);
    float _3289 = _3235 * _3255;
    float _3291 = -_3235;
    float _3293 = _3291 + 1.0;
    bool _3295 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3297 = isnan(_1232);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3303 = _3299 || _3301;
    float _3305 = float(_3303);
    float _3307 = -_3281;
    float _3309 = _3307 + 1.0;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3313 = _3281 * _3293;
    int _3315 = abs(_2799);
    float _3317 = trunc(_2983);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = _2995 * _3309;
    float _3325 = -_2995;
    float _3327 = _3325 + 1.0;
    int _3329 = ~_3315;
    int _3331 = _3329 + 1;
    int _3333 = _3331 + 1;
    int _3335 = abs(_2781);
    float _3337 = _3251 * _3327;
    float _3339 = -_3251;
    float _3341 = _3339 + 1.0;
    int _3343 = _2979 * int(_3287);
    int _3345 = _3343 + _2049;
    int _3347 = ~_1338;
    int _3349 = _3347 + 1;
    int _3351 = ~_1324;
    int _3353 = _3351 + 1;
    float _3355 = _3267 * _3341;
    float _3357 = float(uint(_3345));
    float _3359 = trunc(_3009);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    int _3365 = _3353 * int(_3321);
    int _3367 = _3365 + _2089;
    int _3369 = ~_3335;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    float _3375 = as_type<float>(_1364) * _3357;
    float _3377 = -_3267;
    float _3379 = _3377 + 1.0;
    int _3381 = abs(_2965);
    float _3383 = float(uint(_3367));
    float _3385 = _3305 * _3379;
    float _3387 = trunc(_3375);
    float _3389 = precise::max(_3387, 0.0);
    uint _3391 = uint(_3389);
    float _3393 = -_3305;
    float _3395 = _3393 + 1.0;
    float _3397 = _3175 * _3385;
    float _3399 = as_type<float>(_1382) * _3383;
    int _3401 = _3165 ? 0 : 1;
    int _3403 = _3349 * int(_3363);
    int _3405 = _3403 + _2363;
    float _3407 = fma(_3395, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3397);
    float _3409 = trunc(_3399);
    float _3411 = precise::max(_3409, 0.0);
    uint _3413 = uint(_3411);
    int _3415 = ~_1318;
    int _3417 = _3415 + 1;
    float _3419 = float(uint(_3405));
    float _3421 = _2945 + _1761;
    int _3423 = int(_3107) + int(_3223);
    float _3425 = fma(_3127, _3355, _3407);
    int _3427 = ~_1304;
    int _3429 = _3427 + 1;
    float _3431 = as_type<float>(_1388) * _3419;
    int _3433 = int(_3287) + int(_3391);
    int _3435 = _3417 * _3423;
    int _3437 = _3435 + _1989;
    float _3439 = fma(_3043, _3337, _3425);
    int _3441 = ~_3401;
    int _3443 = _3441 + 1;
    int _3445 = _3443 + 1;
    float _3447 = trunc(_3431);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = _3445;
    float _3455 = as_type<float>(_3423);
    float _3457 = _3425;
    if (!_3151)
    {
        int _3459 = ~_3401;
        int _3461 = _3459 + 1;
        _3453 = _3461;
    }
    int _3463 = _3453;
    float _3465 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3467 = _3189 + _3465;
    bool _3469 = uint(_3437) >= uint(_1318);
    int _3471 = _3429 * _3433;
    int _3473 = _3471 + _2049;
    int _3475 = int(_3321) + int(_3413);
    float _3477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3479 = _2967 + _3477;
    int _3481 = ~_1324;
    int _3483 = _3481 + 1;
    float _3485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _3487 = !_3469;
    int _3489 = _3487 ? 0 : (-1);
    float _3491 = fma(_3183, _3323, _3439);
    int _3493 = ~_1338;
    int _3495 = _3493 + 1;
    int _3497 = _3483 * _3475;
    int _3499 = _3497 + _2089;
    bool _3501 = uint(_3473) >= uint(_1304);
    float _3503 = _3467 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3505 = fma(_3205, _3313, _3491);
    int _3507 = int(_3363) + int(_3451);
    float _3509 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3511 = !_3501;
    int _3513 = _3511 ? 0 : (-1);
    float _3515 = fma(_3479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3503);
    bool _3517 = uint(_3499) >= uint(_1324);
    int _3519 = _3495 * _3507;
    int _3521 = _3519 + _2363;
    float _3523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3525 = _3421 + _3523;
    float _3527 = _3485 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3529 = !_3517;
    int _3531 = _3529 ? 0 : (-1);
    float _3533 = fma(_3525, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3515);
    bool _3535 = uint(_3521) >= uint(_1338);
    float _3537 = _1581 * 2.0;
    float _3539 = fma(_3527, _1469, -0.5);
    bool _3541 = !_3535;
    int _3543 = _3541 ? 0 : (-1);
    bool _3545 = _3533 >= 0.0;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3549 = floor(_3537);
    float _3551 = -_3547;
    float _3553 = fma(_3509, 2.0, _3551);
    float _3555 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3557 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3559 = _1422 + _1571;
    float _3561 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3563 = fma(as_type<float>(_1589), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3555);
    float _3565 = as_type<float>(_1589) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3567 = fma(as_type<float>(_1585), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3557);
    float _3569 = as_type<float>(_1585) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3571 = ~_3423;
    int _3573 = _3571 + _3489;
    int _3575 = _3573 + 1;
    float _3577 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3563);
    float _3579 = fma(_3569, -2.0, _3561);
    if (_3545)
    {
        _3455 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3581 = _3455;
    float _3583 = _3559 + (-1.0);
    float _3585 = fma(_3185, _3289, _3505);
    bool _3587 = _3549 >= 0.0;
    bool _3589 = isnan(_3549);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan(0.0);
    bool _3595 = _3591 || _3593;
    int _3597 = as_type<int>(_3581);
    if (_3545)
    {
        float _3599 = _3581 * 5.0;
        _3597 = as_type<int>(_3599);
    }
    int _3601 = _3597;
    int _3603 = _1318 * _3575;
    int _3605 = _3603 + _1989;
    float _3607 = fma(_3187, _3269, _3585);
    if (_3545)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12035 = as_type<float>(_3601);
        out.gl_Position.z = _12035;
    }
    if (_3121)
    {
        _3131 = _1571;
    }
    float _3609 = _3131;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3613 = _3609;
    if (_3121)
    {
        _3457 = _1422;
    }
    float _3615 = _3457;
    float _3617 = fma(_3203, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3607);
    float _3619 = _3615;
    if (!_3121)
    {
        _3613 = _1581;
    }
    float _3621 = _3613;
    float _3623 = -_3611;
    float _3625 = fma(_3565, 2.0, _3623);
    if (!_3121)
    {
        _3619 = _1571;
    }
    float _3627 = _3619;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3631 = _3549 > 0.0;
    out.m_75.x = _3617;
    float _3633 = _3467 * _3467;
    float _3635 = fma(_3149, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3629);
    bool _3637 = !_2507;
    int _3639 = _3637 ? 0 : 1;
    float _3641 = fma(_3479, _3479, _3633);
    float _3643 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3645 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    int _3647 = _2621 & 3;
    bool _3649 = _3647 != 0;
    float _3651 = fma(_3525, _3525, _3641);
    int _3653 = _2621 >> 31;
    float _3655 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3645);
    float _3657 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3659 = rsqrt(_3651);
    bool _3661 = !_3649;
    int _3663 = _3661 ? 0 : 1;
    float _3665 = _3627 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3667 = -_3643;
    float _3669 = fma(_3657, 2.0, _3667);
    int _3671 = _2491 >> 31;
    float _3673 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3567);
    int _3675 = _2719 & 3;
    bool _3677 = _3675 != 0;
    float _3679 = -_166;
    float _3681 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3553);
    int _3683 = _3653 & 3;
    float _3685 = -_166;
    float _3687 = fma(_3685, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3625);
    int _3689 = _3671 & 3;
    float _3691 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3579);
    int _3693 = _2719 >> 31;
    float _3695 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3635);
    int _3697 = _2491 + _3689;
    float _3699 = -_166;
    float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3669);
    int _3703 = _3693 & 3;
    float _3705 = _3467 * _3659;
    bool _3707 = !_3677;
    int _3709 = _3707 ? 0 : 1;
    float _3711 = _3479 * _3659;
    int _3713 = _3697 >> 2;
    float _3715 = -_3705;
    float _3717 = fma(_3715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3467);
    int _3719 = _2773 & 3;
    bool _3721 = _3719 != 0;
    float _3723 = -_3711;
    float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3479);
    int _3727 = _2719 + _3703;
    float _3729 = _3717 * _3717;
    int _3731 = _2773 >> 31;
    float _3733 = _3681;
    if (_3545)
    {
        out.m_51.x = 0.0;
    }
    int _3735 = _3713 << 4;
    int _3737 = _3735 + 368;
    float _3739 = fma(_3725, _3725, _3729);
    bool _3741 = !_3721;
    int _3743 = _3741 ? 0 : 1;
    bool _3745 = _2505 != 3;
    int _3747 = _2621 + _3683;
    int _3749 = _3727 >> 2;
    int _3751 = _3731 & 3;
    uint _3753 = uint(int(uint(_3737) >> uint(2)));
    uint _3755 = uint(int(uint(int(_3753)) >> uint(2)));
    int _3757 = int(_3753) & 3;
    float _3759 = (*spvDescriptorSet0.vp_c9)._m0[int(_3755)][_3757];
    int _3761 = int(_3753) + 1;
    uint _3763 = uint(int(uint(_3761) >> uint(2)));
    int _3765 = _3761 & 3;
    float _3767 = (*spvDescriptorSet0.vp_c9)._m0[int(_3763)][_3765];
    int _3769 = ~_3433;
    int _3771 = _3769 + _3513;
    int _3773 = _3771 + 1;
    bool _3775 = !_3745;
    int _3777 = _3775 ? 0 : (-1);
    bool _3779 = _2647 != 3;
    int _3781 = _1304 * _3773;
    int _3783 = _3781 + _2049;
    int _3785 = _2773 + _3751;
    float _3787 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3789 = int(_3787);
    int _3791 = _3747 >> 2;
    int _3793 = _3785 >> 2;
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3797 = !_3779;
    int _3799 = _3797 ? 0 : (-1);
    bool _3801 = _2735 != 3;
    float _3803 = -_3795;
    float _3805 = fma(_3147, 2.0, _3803);
    int _3807 = _3791 << 4;
    int _3809 = _3807 + 512;
    float _3811 = _3145 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3813 = _3793 << 4;
    int _3815 = _3813 + 800;
    float _3817 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3819 = int(_3817);
    bool _3821 = !_2469;
    int _3823 = _3821 ? _3605 : (-1);
    uint _3825 = uint(int(uint(_3809) >> uint(2)));
    uint _3827 = uint(int(uint(int(_3825)) >> uint(2)));
    int _3829 = int(_3825) & 3;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[int(_3827)][_3829];
    int _3833 = int(_3825) + 1;
    uint _3835 = uint(int(uint(_3833) >> uint(2)));
    int _3837 = _3833 & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    bool _3841 = !_2599;
    int _3843 = _3841 ? _3783 : (-1);
    float _3845 = -_166;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3805);
    bool _3849 = !_3171;
    int _3851 = _3849 ? 0 : (-1);
    int _3853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3855 = _3853 != 0;
    int _3857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3859 = _3857 != 0;
    int _3861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3863 = _3861 != 0;
    uint _3865 = uint(int(uint(_3815) >> uint(2)));
    uint _3867 = uint(int(uint(int(_3865)) >> uint(2)));
    int _3869 = int(_3865) & 3;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[int(_3867)][_3869];
    int _3873 = int(_3865) + 1;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    int _3877 = _3873 & 3;
    float _3879 = (*spvDescriptorSet0.vp_c9)._m0[int(_3875)][_3877];
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3883 = _3595 ? 0 : 1;
    float _3885 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3887 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3889 = fma(_3811, -2.0, _3881);
    float _3891 = _3621 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3893 = ~_3883;
    int _3895 = _3893 + 1;
    int _3897 = _3895 + 1;
    float _3899 = fma(_3087, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3887);
    float _3901 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3905 = _3749 << 4;
    int _3907 = _3905 + 656;
    float _3909 = -_3311;
    float _3911 = fma(_3891, 2.0, _3909);
    int _3913 = _3897;
    float _3915 = _3885;
    if (!_3631)
    {
        int _3917 = ~_3883;
        int _3919 = _3917 + 1;
        _3913 = _3919;
    }
    int _3921 = _3913;
    float _3923 = fma(_3901, -2.0, _3903);
    int _3925 = ~_3475;
    int _3927 = _3925 + _3531;
    int _3929 = _3927 + 1;
    uint _3931 = uint(int(uint(_3907) >> uint(2)));
    uint _3933 = uint(int(uint(int(_3931)) >> uint(2)));
    int _3935 = int(_3931) & 3;
    float _3937 = (*spvDescriptorSet0.vp_c9)._m0[int(_3933)][_3935];
    int _3939 = int(_3931) + 1;
    uint _3941 = uint(int(uint(_3939) >> uint(2)));
    int _3943 = _3939 & 3;
    float _3945 = (*spvDescriptorSet0.vp_c9)._m0[int(_3941)][_3943];
    int _3947 = abs(_2727);
    float _3949 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3923);
    int _3951 = _1324 * _3929;
    int _3953 = _3951 + _2089;
    int _3955 = ~_3507;
    int _3957 = _3955 + _3543;
    int _3959 = _3957 + 1;
    float _3961 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3889);
    int _3963 = abs(_3663);
    int _3965 = _3737 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    float _3983 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3985 = _1338 * _3959;
    int _3987 = _3985 + _2363;
    int _3989 = abs(_3743);
    float _3991 = -_166;
    float _3993 = fma(_3991, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3911);
    float _3995 = fma(_3665, -2.0, _3983);
    int _3997 = abs(_2573);
    int _3999 = _3809 + 8;
    uint _4001 = uint(int(uint(_3999) >> uint(2)));
    uint _4003 = uint(int(uint(int(_4001)) >> uint(2)));
    int _4005 = int(_4001) & 3;
    float _4007 = (*spvDescriptorSet0.vp_c9)._m0[int(_4003)][_4005];
    int _4009 = int(_4001) + 1;
    uint _4011 = uint(int(uint(_4009) >> uint(2)));
    int _4013 = _4009 & 3;
    float _4015 = (*spvDescriptorSet0.vp_c9)._m0[int(_4011)][_4013];
    int _4017 = ~_3947;
    int _4019 = _4017 + 1;
    int _4021 = _4019 + 1;
    float _4023 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4025 = int(_4023);
    int _4027 = ~_3997;
    int _4029 = _4027 + 1;
    int _4031 = _4029 + 1;
    float _4033 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3995);
    int _4035 = _4021 * as_type<int>(_3839);
    bool _4037 = !_3801;
    int _4039 = _4037 ? 0 : (-1);
    int _4041 = _3907 + 8;
    uint _4043 = uint(int(uint(_4041) >> uint(2)));
    uint _4045 = uint(int(uint(int(_4043)) >> uint(2)));
    int _4047 = int(_4043) & 3;
    float _4049 = (*spvDescriptorSet0.vp_c9)._m0[int(_4045)][_4047];
    int _4051 = int(_4043) + 1;
    uint _4053 = uint(int(uint(_4051) >> uint(2)));
    int _4055 = _4051 & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = _4031 * as_type<int>(_3767);
    int _4061 = abs(_3639);
    float _4063 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4065 = abs(_3709);
    int _4067 = abs(_2845);
    float _4069 = fma(_3139, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4063);
    int _4071 = _3815 + 8;
    uint _4073 = uint(int(uint(_4071) >> uint(2)));
    uint _4075 = uint(int(uint(int(_4073)) >> uint(2)));
    int _4077 = int(_4073) & 3;
    float _4079 = (*spvDescriptorSet0.vp_c9)._m0[int(_4075)][_4077];
    int _4081 = int(_4073) + 1;
    uint _4083 = uint(int(uint(_4081) >> uint(2)));
    int _4085 = _4081 & 3;
    float _4087 = (*spvDescriptorSet0.vp_c9)._m0[int(_4083)][_4085];
    float _4089 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4091 = int(_4089);
    float _4093 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4069);
    int _4095 = ~_4067;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = ~_3963;
    int _4103 = _4101 + 1;
    int _4105 = _4103 + 1;
    int _4107 = ~_3989;
    int _4109 = _4107 + 1;
    int _4111 = _4109 + 1;
    int _4113 = _4099 * as_type<int>(_3879);
    int _4115 = ~_4061;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    int _4121 = _4105 * as_type<int>(_3831);
    int _4123 = _4121 + _4035;
    int _4125 = abs(_2639);
    int _4127 = _4111 * as_type<int>(_3871);
    int _4129 = _4127 + _4113;
    int _4131 = abs(_2705);
    int _4133 = _4119 * as_type<int>(_3759);
    int _4135 = _4133 + _4059;
    int _4137 = abs(_3777);
    int _4139 = _3333 * as_type<int>(_3945);
    int _4141 = ~_4125;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    float _4147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4149 = log2(_4147);
    int _4151 = ~_4131;
    int _4153 = _4151 + 1;
    int _4155 = _4153 + 1;
    int _4157 = ~_4137;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4145 * as_type<int>(_3973);
    int _4165 = _4163 + _4135;
    int _4167 = ~_4065;
    int _4169 = _4167 + 1;
    int _4171 = _4169 + 1;
    float _4173 = float(uint(_3789));
    int _4175 = _4161 * as_type<int>(_3981);
    int _4177 = _4175 + _4165;
    int _4179 = abs(_2835);
    int _4181 = _4171 * as_type<int>(_3937);
    int _4183 = _4181 + _4139;
    int _4185 = abs(_4039);
    int _4187 = _4155 * as_type<int>(_4007);
    int _4189 = _4187 + _4123;
    int _4191 = abs(_2653);
    float _4193 = 1.0 / _4173;
    float _4195 = float(uint(_4091));
    int _4197 = ~_4191;
    int _4199 = _4197 + 1;
    int _4201 = _4199 + 1;
    int _4203 = ~_4179;
    int _4205 = _4203 + 1;
    int _4207 = _4205 + 1;
    int _4209 = _3373 * as_type<int>(_4049);
    int _4211 = _4209 + _4183;
    int _4213 = abs(_3799);
    int _4215 = _4177 * _4201;
    float _4217 = 1.0 / _4195;
    float _4219 = float(uint(_3819));
    int _4221 = _3823 * _4191;
    int _4223 = _4221 + _4215;
    int _4225 = abs(_2733);
    int _4227 = _4207 * as_type<int>(_4079);
    int _4229 = _4227 + _4129;
    int _4231 = abs(_2869);
    float _4233 = _4149 * _166;
    int _4235 = ~_4225;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = 1.0 / _4219;
    int _4243 = ~_4213;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    int _4249 = ~_4185;
    int _4251 = _4249 + 1;
    int _4253 = _4251 + 1;
    float _4255 = float(uint(_4025));
    int _4257 = _4247 * as_type<int>(_4015);
    int _4259 = _4257 + _4189;
    int _4261 = ~_4231;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    int _4267 = _4253 * as_type<int>(_4057);
    int _4269 = _4267 + _4211;
    bool _4271 = _1324 == 0;
    int _4273 = _4239 * _4259;
    int _4275 = abs(_3851);
    float _4277 = 1.0 / _4255;
    bool _4279 = !_4271;
    int _4281 = _4279 ? _3953 : (-1);
    int _4283 = _3843 * _4225;
    int _4285 = _4283 + _4273;
    int _4287 = ~_4275;
    int _4289 = _4287 + 1;
    int _4291 = _4289 + 1;
    int _4293 = _4265 * _4269;
    int _4295 = as_type<int>(_4217) + (-2);
    float _4297 = float(uint(_4285));
    int _4299 = _4281 * _4231;
    int _4301 = _4299 + _4293;
    int _4303 = as_type<int>(_4193) + (-2);
    int _4305 = _4291 * as_type<int>(_4087);
    int _4307 = _4305 + _4229;
    float _4309 = float(uint(_4223));
    float _4311 = as_type<float>(_4295) * _4297;
    float _4313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4315 = as_type<int>(_4241) + (-2);
    float _4317 = as_type<float>(_4303) * _4309;
    float _4319 = float(uint(_4301));
    int _4321 = ~_3381;
    int _4323 = _4321 + 1;
    int _4325 = _4323 + 1;
    bool _4327 = _1338 == 0;
    float _4329 = trunc(_4317);
    float _4331 = precise::max(_4329, 0.0);
    uint _4333 = uint(_4331);
    int _4335 = as_type<int>(_4277) + (-2);
    float _4337 = as_type<float>(_4315) * _4319;
    bool _4339 = !_4327;
    int _4341 = _4339 ? _3987 : (-1);
    int _4343 = _4325 * _4307;
    int _4345 = ~_3789;
    int _4347 = _4345 + 1;
    int _4349 = ~_3819;
    int _4351 = _4349 + 1;
    float _4353 = trunc(_4311);
    float _4355 = precise::max(_4353, 0.0);
    uint _4357 = uint(_4355);
    int _4359 = _4341 * _3381;
    int _4361 = _4359 + _4343;
    float _4363 = _4313 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4365 = abs(_3789);
    float _4367 = _3525 * _3659;
    float _4369 = float(uint(_4361));
    float _4371 = fma(_4363, _2953, -0.5);
    float _4373 = trunc(_4337);
    float _4375 = precise::max(_4373, 0.0);
    uint _4377 = uint(_4375);
    int _4379 = ~_4091;
    int _4381 = _4379 + 1;
    int _4383 = _4347 * int(_4333);
    int _4385 = _4383 + _4223;
    float _4387 = as_type<float>(_4335) * _4369;
    float _4389 = float(uint(_4365));
    float _4391 = -_4367;
    float _4393 = fma(_4391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3525);
    int _4395 = abs(_3819);
    int _4397 = _4381 * int(_4357);
    int _4399 = _4397 + _4285;
    float _4401 = trunc(_4387);
    float _4403 = precise::max(_4401, 0.0);
    uint _4405 = uint(_4403);
    float _4407 = float(uint(_4385));
    float _4409 = fma(_4393, _4393, _3739);
    int _4411 = ~_4025;
    int _4413 = _4411 + 1;
    float _4415 = float(uint(_4399));
    float _4417 = as_type<float>(_4303) * _4407;
    int _4419 = _4351 * int(_4377);
    int _4421 = _4419 + _4301;
    float _4423 = 1.0 / _4389;
    int _4425 = abs(_4091);
    float _4427 = as_type<float>(_4295) * _4415;
    float _4429 = float(uint(_4395));
    float _4431 = float(uint(_4421));
    float _4433 = float(uint(_4425));
    int _4435 = _4413 * int(_4405);
    int _4437 = _4435 + _4361;
    int _4439 = abs(_4025);
    float _4441 = as_type<float>(_4315) * _4431;
    float _4443 = 1.0 / _4433;
    int _4445 = as_type<int>(_4423) + (-2);
    float _4447 = float(uint(_4439));
    float _4449 = 1.0 / _4429;
    int _4451 = abs(_4223);
    float _4453 = float(uint(_4437));
    float _4455 = float(uint(_4451));
    int _4457 = abs(_4301);
    float _4459 = 1.0 / _4447;
    float _4461 = as_type<float>(_4335) * _4453;
    float _4463 = as_type<float>(_4445) * _4455;
    float _4465 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4467 = abs(_4285);
    float _4469 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4465);
    float _4471 = exp2(_4233);
    int _4473 = as_type<int>(_4449) + (-2);
    float _4475 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4469);
    float _4477 = float(uint(_4457));
    int _4479 = as_type<int>(_4443) + (-2);
    float _4481 = float(uint(_4467));
    float _4483 = trunc(_4463);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    bool _4489 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4491 = isnan(1.0);
    bool _4493 = _4489 || _4491;
    bool _4495 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4497 = _4493 || _4495;
    float _4499 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4501 = 1.0 + _4499;
    float _4503 = as_type<float>(_4473) * _4477;
    int _4505 = abs(_4361);
    float _4507 = as_type<float>(_4479) * _4481;
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4511 = as_type<int>(_4459) + (-2);
    float _4513 = 1.0 / _4501;
    float _4515 = float(uint(_4505));
    float _4517 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4519 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4509);
    float _4521 = -_4471;
    float _4523 = _4521 + 1.0;
    float _4525 = as_type<float>(_4511) * _4515;
    float _4527 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4517);
    float _4529 = trunc(_4417);
    float _4531 = precise::max(_4529, 0.0);
    uint _4533 = uint(_4531);
    float _4535 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3899);
    bool _4537 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4539 = isnan(0.0);
    bool _4541 = _4537 || _4539;
    bool _4543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4545 = _4541 || _4543;
    float _4547 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4549 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4519);
    int _4551 = ~_4365;
    int _4553 = _4551 + 1;
    float _4555 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3655);
    float _4557 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4547);
    float _4559 = trunc(_4503);
    float _4561 = precise::max(_4559, 0.0);
    uint _4563 = uint(_4561);
    float _4565 = _4545 ? _4523 : 0.0;
    int _4567 = _4553 * int(_4487);
    int _4569 = _4567 + _4451;
    int _4571 = ~_4395;
    int _4573 = _4571 + 1;
    float _4575 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4527);
    float _4577 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4557);
    float _4579 = _4367;
    if (_4497)
    {
        float _4581 = _4565 * _4513;
        _170 = _4581;
    }
    float _4583 = _170;
    int _4585 = ~_4425;
    int _4587 = _4585 + 1;
    float _4589 = trunc(_4507);
    float _4591 = precise::max(_4589, 0.0);
    uint _4593 = uint(_4591);
    int _4595 = int(_4333) + int(_4533);
    float _4597 = fma(_4555, _3539, _3701);
    int _4599 = ~_4439;
    int _4601 = _4599 + 1;
    float _4603 = -_3949;
    float _4605 = fma(_4535, _4371, _4603);
    float _4607 = float(uint(_4569));
    float _4609 = float(_3921);
    float _4611 = trunc(_4441);
    float _4613 = precise::max(_4611, 0.0);
    uint _4615 = uint(_4613);
    int _4617 = _4573 * int(_4563);
    int _4619 = _4617 + _4457;
    float _4621 = as_type<float>(_4445) * _4607;
    float _4623 = _4605 + 0.5;
    float _4625 = float(uint(_4619));
    float _4627 = trunc(_4525);
    float _4629 = precise::max(_4627, 0.0);
    uint _4631 = uint(_4629);
    int _4633 = ~_3789;
    int _4635 = _4633 + 1;
    float _4637 = as_type<float>(_4473) * _4625;
    float _4639 = trunc(_4427);
    float _4641 = precise::max(_4639, 0.0);
    uint _4643 = uint(_4641);
    float _4645 = trunc(_4461);
    float _4647 = precise::max(_4645, 0.0);
    uint _4649 = uint(_4647);
    int _4651 = _4587 * int(_4593);
    int _4653 = _4651 + _4467;
    float _4655 = float(uint(_4653));
    float _4657 = trunc(_4621);
    float _4659 = precise::max(_4657, 0.0);
    uint _4661 = uint(_4659);
    int _4663 = int(_4377) + int(_4615);
    int _4665 = _4601 * int(_4631);
    int _4667 = _4665 + _4505;
    float _4669 = as_type<float>(_4479) * _4655;
    int _4671 = int(_4357) + int(_4643);
    float _4673 = float(uint(_4667));
    float _4675 = trunc(_4669);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    int _4681 = int(_4405) + int(_4649);
    int _4683 = _4635 * _4595;
    int _4685 = _4683 + _4223;
    int _4687 = ~_4091;
    int _4689 = _4687 + 1;
    float _4691 = as_type<float>(_4511) * _4673;
    int _4693 = ~_3819;
    int _4695 = _4693 + 1;
    bool _4697 = uint(_4685) >= uint(_3789);
    float _4699 = trunc(_4637);
    float _4701 = precise::max(_4699, 0.0);
    uint _4703 = uint(_4701);
    int _4705 = ~_4025;
    int _4707 = _4705 + 1;
    int _4709 = _4689 * _4671;
    int _4711 = _4709 + _4285;
    int _4713 = int(_4487) + int(_4661);
    float _4715 = trunc(_4691);
    float _4717 = precise::max(_4715, 0.0);
    uint _4719 = uint(_4717);
    int _4721 = int(_4593) + int(_4679);
    int _4723 = _4695 * _4663;
    int _4725 = _4723 + _4301;
    bool _4727 = uint(_4711) >= uint(_4091);
    int _4729 = _4707 * _4681;
    int _4731 = _4729 + _4361;
    int _4733 = ~_4425;
    int _4735 = _4733 + 1;
    int _4737 = ~_4365;
    int _4739 = _4737 + 1;
    int _4741 = ~_4395;
    int _4743 = _4741 + 1;
    bool _4745 = !_4697;
    int _4747 = _4745 ? 0 : (-1);
    int _4749 = _4739 * _4713;
    int _4751 = _4749 + _4451;
    bool _4753 = uint(_4725) >= uint(_3819);
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4757 = int(_4563) + int(_4703);
    int _4759 = int(_4631) + int(_4719);
    bool _4761 = !_4727;
    int _4763 = _4761 ? 0 : (-1);
    int _4765 = _4735 * _4721;
    int _4767 = _4765 + _4467;
    bool _4769 = uint(_4731) >= uint(_4025);
    int _4771 = _4743 * _4757;
    int _4773 = _4771 + _4457;
    int _4775 = ~_4439;
    int _4777 = _4775 + 1;
    float _4779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4781 = !_4753;
    int _4783 = _4781 ? 0 : (-1);
    bool _4785 = uint(_4751) >= uint(_4365);
    bool _4787 = !_4769;
    int _4789 = _4787 ? 0 : (-1);
    float _4791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4793 = uint(_4767) >= uint(_4425);
    bool _4795 = !_4785;
    int _4797 = _4795 ? 0 : (-1);
    int _4799 = _4777 * _4759;
    int _4801 = _4799 + _4505;
    int _4803 = ~_4595;
    int _4805 = _4803 + _4747;
    int _4807 = _4805 + 1;
    bool _4809 = uint(_4773) >= uint(_4395);
    int _4811 = ~_4663;
    int _4813 = _4811 + _4783;
    int _4815 = _4813 + 1;
    int _4817 = _3789 * _4807;
    int _4819 = _4817 + _4223;
    bool _4821 = !_4809;
    int _4823 = _4821 ? 0 : (-1);
    bool _4825 = _3789 == 0;
    bool _4827 = !_4793;
    int _4829 = _4827 ? 0 : (-1);
    float _4831 = _4791 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4833 = uint(_4801) >= uint(_4439);
    int _4835 = _3819 * _4815;
    int _4837 = _4835 + _4301;
    bool _4839 = !_4825;
    int _4841 = _4839 ? _4819 : (-1);
    float _4843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4845 = _3819 == 0;
    float _4847 = fma(_4831, _1751, -0.5);
    int _4849 = ~_4671;
    int _4851 = _4849 + _4763;
    int _4853 = _4851 + 1;
    float _4855 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _4857 = !_4845;
    int _4859 = _4857 ? _4837 : (-1);
    bool _4861 = _3789 == 0;
    int _4863 = _4091 * _4853;
    int _4865 = _4863 + _4285;
    int _4867 = _4223 ^ _3789;
    float _4869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4871 = _4285 ^ _4091;
    float _4873 = _4855 * _4779;
    uint _4875 = uint(int(uint(_4867) >> uint(31)));
    uint _4877 = uint(int(uint(_4871) >> uint(31)));
    int _4879 = ~_4681;
    int _4881 = _4879 + _4789;
    int _4883 = _4881 + 1;
    float _4885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4887 = !_4833;
    int _4889 = _4887 ? 0 : (-1);
    int _4891 = ~_4797;
    int _4893 = _4713 + _4891;
    int _4895 = _4893 + 1;
    int _4897 = _4025 * _4883;
    int _4899 = _4897 + _4361;
    int _4901 = ~int(_4875);
    int _4903 = _4901 + 1;
    bool _4905 = _4091 == 0;
    int _4907 = ~_4829;
    int _4909 = _4721 + _4907;
    int _4911 = _4909 + 1;
    float _4913 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4915 = ~int(_4877);
    int _4917 = _4915 + 1;
    int _4919 = _4895 ^ _4903;
    float _4921 = _4913 * _4843;
    bool _4923 = !_4905;
    int _4925 = _4923 ? _4865 : (-1);
    float _4927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4929 = _4025 == 0;
    int _4931 = _4911 ^ _4917;
    out.m_77.x = _4873;
    out.m_77.y = _4921;
    int _4933 = ~_4903;
    int _4935 = _4933 + _4919;
    int _4937 = _4935 + 1;
    bool _4939 = !_4929;
    int _4941 = _4939 ? _4899 : (-1);
    bool _4943 = _4091 == 0;
    int _4945 = ~_4917;
    int _4947 = _4945 + _4931;
    int _4949 = _4947 + 1;
    bool _4951 = !_4861;
    int _4953 = _4951 ? _4937 : (-1);
    float _4955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4957 = _3819 == 0;
    float _4959 = _4869 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4961 = _4301 ^ _3819;
    bool _4963 = !_4943;
    int _4965 = _4963 ? _4949 : (-1);
    float _4967 = fma(_4959, _1767, -0.5);
    bool _4969 = _4025 == 0;
    int _4971 = _4361 ^ _4025;
    float _4973 = _4927 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4975 = float(_4841);
    uint _4977 = uint(int(uint(_4971) >> uint(31)));
    float _4979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4981 = ~_4889;
    int _4983 = _4759 + _4981;
    int _4985 = _4983 + 1;
    float _4987 = fma(_4831, _4975, _3681);
    int _4989 = ~int(_4977);
    int _4991 = _4989 + 1;
    float _4993 = fma(_4973, _1803, -0.5);
    float _4995 = float(_4925);
    float _4997 = fma(_4475, _4847, _4987);
    float _4999 = float(_4859);
    float _5001 = _4755 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5003 = _4985 ^ _4991;
    float _5005 = fma(_4959, _4995, _3847);
    float _5007 = float(_4941);
    float _5009 = _4885 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5011 = fma(_4973, _4999, _3993);
    int _5013 = ~_4991;
    int _5015 = _5013 + _5003;
    int _5017 = _5015 + 1;
    float _5019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5021 = uint(int(uint(_4961) >> uint(31)));
    float _5023 = fma(_5009, _2515, -0.5);
    float _5025 = float(_4953);
    float _5027 = fma(_5009, _5007, _3687);
    bool _5029 = !_4969;
    int _5031 = _5029 ? _5017 : (-1);
    float _5033 = fma(_5001, _2871, -0.5);
    int _5035 = ~_4823;
    int _5037 = _4757 + _5035;
    int _5039 = _5037 + 1;
    float _5041 = -_2975;
    float _5043 = fma(_5001, _5025, _5041);
    int _5045 = ~int(_5021);
    int _5047 = _5045 + 1;
    float _5049 = fma(_3577, _5023, _5027);
    float _5051 = float(_4965);
    float _5053 = fma(_4093, _4967, _5005);
    float _5055 = _4955 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5057 = float(_5031);
    float _5059 = _4979 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5061 = _5039 ^ _5047;
    float _5063 = fma(_4577, _4993, _5011);
    float _5065 = fma(_5055, _2881, -0.5);
    float _5067 = -_3961;
    float _5069 = fma(_5055, _5051, _5067);
    int _5071 = ~_5047;
    int _5073 = _5071 + _5061;
    int _5075 = _5073 + 1;
    float _5077 = fma(_5059, _2897, -0.5);
    float _5079 = -_3691;
    float _5081 = fma(_5059, _5057, _5079);
    float _5083 = fma(_4549, _5033, _5043);
    bool _5085 = !_4957;
    int _5087 = _5085 ? _5075 : (-1);
    float _5089 = _5019 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5091 = fma(_3673, _5077, _5081);
    float _5093 = _5083 + 0.5;
    float _5095 = float(_5087);
    float _5097 = fma(_5089, _2895, -0.5);
    float _5099 = _5091 + 0.5;
    float _5101 = fma(_3695, _5065, _5069);
    float _5103 = in.m_79.x;
    float _5105 = in.m_79.y;
    float _5107 = in.m_79.z;
    float _5109 = -_4033;
    float _5111 = fma(_5089, _5095, _5109);
    float _5113 = _4997 + 0.5;
    float _5115 = _4597 + 0.5;
    float _5117 = _5063 + 0.5;
    float _5119 = fma(_4575, _5097, _5111);
    float _5121 = _5053 + 0.5;
    float _5123 = _5101 + 0.5;
    float _5125 = _5049 + 0.5;
    float _5127 = _5119 + 0.5;
    bool _5129 = !_3855;
    int _5131 = _5129 ? 0 : 1;
    out.m_81.x = _5115;
    out.m_81.y = _4623;
    bool _5133 = !_3859;
    int _5135 = _5133 ? 0 : 1;
    int _5137 = abs(_5131);
    out.m_83.x = _5113;
    out.m_83.y = _5093;
    out.m_83.z = _5121;
    out.m_83.w = _5123;
    int _5139 = abs(_5135);
    bool _5141 = !_3863;
    int _5143 = _5141 ? 0 : 1;
    out.m_85.x = _5117;
    out.m_85.y = _5127;
    float _5145 = float(_5137);
    out.m_87.x = _5125;
    out.m_87.y = _5099;
    if (_3545)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5147 = -_3705;
    float _5149 = fma(_5147, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3189);
    float _5151 = -_3711;
    float _5153 = fma(_5151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2967);
    float _5155 = _5145 * _4609;
    float _5157 = float(_3081);
    float _5159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5161 = _5149 + _5159;
    float _5163 = float(_5139);
    float _5165 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5167 = _5153 + _5165;
    float _5169 = _5155 * (-2.0);
    float _5171 = _5161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5173 = -_4367;
    float _5175 = fma(_5173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3421);
    float _5177 = _5163 * _5157;
    float _5179 = _1571 + (-0.5);
    float _5181 = fma(_5167, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5171);
    float _5183 = fma(_5169, _5103, _5103);
    float _5185 = _1422 + _1581;
    float _5187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5189 = _5175 + _5187;
    float _5191 = fma(_3885, _5169, _3885);
    float _5193 = fma(_5179, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5183);
    float _5195 = _5185 + (-1.0);
    float _5197 = _5177 * (-2.0);
    float _5199 = fma(_5189, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5181);
    float _5201 = fma(_5191, _4583, _5193);
    float _5203 = fma(_5195, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5205 = _1422 + (-0.5);
    float _5207 = fma(_5197, _5105, _5105);
    bool _5209 = _5199 >= 0.0;
    float _5211 = fma(_5203, _5197, _5203);
    int _5213 = abs(_5143);
    float _5215 = fma(_5205, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5207);
    float _5217 = _5201 * 0.15915493667125701904296875;
    float _5219 = sqrt(_4409);
    float _5221 = fma(_5211, _4583, _5215);
    float _5223 = float(_3463);
    float _5225 = _1571 + _1581;
    float _5227 = float(_5213);
    float _5229 = _5221 * 0.15915493667125701904296875;
    float _5231 = _5217 * 6.283185482025146484375;
    float _5233 = sin(_5231);
    float _5235 = _5197;
    float _5237 = _5167;
    if (_5209)
    {
        _5235 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5239 = _5235;
    float _5241 = _5227 * _5223;
    int _5243 = as_type<int>(_5239);
    if (_5209)
    {
        out.m_51.x = 0.0;
    }
    float _5245 = _5225 + (-1.0);
    if (_5209)
    {
        float _5247 = _5239 * 5.0;
        _5243 = as_type<int>(_5247);
    }
    int _5249 = _5243;
    float _5251 = _5241 * (-2.0);
    float _5253 = _5217 * 6.283185482025146484375;
    float _5255 = cos(_5253);
    if (_5209)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14453 = as_type<float>(_5249);
        out.gl_Position.z = _14453;
    }
    float _5257 = _5229 * 6.283185482025146484375;
    float _5259 = sin(_5257);
    if (_5209)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5261 = -_3189;
    float _5263 = _5261 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5265 = -_2967;
    float _5267 = _5265 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5269 = -_3421;
    float _5271 = _5269 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5273 = fma(_5245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5275 = _5263 * _5263;
    float _5277 = fma(_5251, _5107, _5107);
    float _5279 = _1581 + (-0.5);
    float _5281 = fma(_5273, _5251, _5273);
    float _5283 = fma(_5267, _5267, _5275);
    float _5285 = _5229 * 6.283185482025146484375;
    float _5287 = cos(_5285);
    float _5289 = fma(_5279, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5277);
    float _5291 = _3659 * _5219;
    float _5293 = fma(_5271, _5271, _5283);
    float _5295 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5297 = fma(_5281, _4583, _5289);
    float _5299 = in.m_89.x;
    float _5301 = in.m_89.y;
    float _5303 = in.m_89.z;
    float _5305 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5307 = rsqrt(_5293);
    float _5309 = _5297 * 0.15915493667125701904296875;
    float _5311 = _5233 * _5259;
    float _5313 = _5291 * _5305;
    float _5315 = _5255 * _5287;
    float _5317 = _5309 * 6.283185482025146484375;
    float _5319 = sin(_5317);
    float _5321 = _5233 * _5287;
    float _5323 = _5267 * _5307;
    float _5325 = _5271 * _5307;
    float _5327 = _5263 * _5307;
    float _5329 = _5309 * 6.283185482025146484375;
    float _5331 = cos(_5329);
    float _5333 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5335 = _5323 * _5333;
    float _5337 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5339 = _5325 * _5337;
    float _5341 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5343 = _5327 * _5341;
    float _5345 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5347 = -_5335;
    float _5349 = fma(_5325, _5345, _5347);
    float _5351 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5353 = -_5339;
    float _5355 = fma(_5327, _5351, _5353);
    float _5357 = fma(_5319, _5315, _5311);
    float _5359 = fma(_5319, _5311, _5315);
    float _5361 = _5349 * _5349;
    float _5363 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5365 = -_5343;
    float _5367 = fma(_5323, _5363, _5365);
    float _5369 = _5291 * _5295;
    float _5371 = fma(_5355, _5355, _5361);
    float _5373 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5375 = _5255 * _5259;
    float _5377 = _5287 * _5331;
    float _5379 = fma(_5367, _5367, _5371);
    float _5381 = _5291 * _5373;
    float _5383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5301);
    float _5385 = _5255 * _5331;
    float _5387 = _5233 * _5331;
    float _5389 = _5259 * _5331;
    float _5391 = rsqrt(_5379);
    float _5393 = _5383 * _5381;
    float _5395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5299);
    float _5397 = -_5375;
    float _5399 = fma(_5319, _5321, _5397);
    float _5401 = -_5321;
    float _5403 = fma(_5319, _5375, _5401);
    float _5405 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5303);
    float _5407 = _5395 * _5369;
    float _5409 = _5385 * _5393;
    float _5411 = -_5393;
    float _5413 = _5319 * _5411;
    float _5415 = _5405 * _5313;
    float _5417 = _5387 * _5393;
    float _5419 = fma(_5357, _5407, _5409);
    float _5421 = fma(_5377, _5407, _5413);
    float _5423 = fma(_5399, _5407, _5417);
    float _5425 = fma(_5403, _5415, _5419);
    float _5427 = _5355 * _5391;
    float _5429 = _5367 * _5391;
    float _5431 = _5349 * _5391;
    float _5433 = _5327 * _5427;
    float _5435 = _5323 * _5429;
    float _5437 = _5325 * _5431;
    float _5439 = -_5433;
    float _5441 = fma(_5323, _5431, _5439);
    float _5443 = fma(_5389, _5415, _5421);
    float _5445 = -_5437;
    float _5447 = fma(_5327, _5429, _5445);
    float _5449 = fma(_5359, _5415, _5423);
    float _5451 = _5441 * _5425;
    float _5453 = -_5435;
    float _5455 = fma(_5325, _5427, _5453);
    float _5457 = _5447 * _5425;
    float _5459 = fma(_5429, _5443, _5451);
    float _5461 = _5455 * _5425;
    float _5463 = fma(_5427, _5443, _5457);
    float _5465 = fma(_5325, _5449, _5459);
    float _5467 = fma(_5431, _5443, _5461);
    float _5469 = fma(_5323, _5449, _5463);
    float _5471 = _5149 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5473 = _3421 + _5465;
    float _5475 = fma(_5327, _5449, _5467);
    float _5477 = _2967 + _5469;
    float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5481 = _5473 + _5479;
    float _5483 = _3189 + _5475;
    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5487 = _5477 + _5485;
    float _5489 = _5481 * _5481;
    float _5491 = fma(_5487, _5487, _5489);
    float _5493 = fma(_5153, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5471);
    float _5495 = sqrt(_5491);
    float _5497 = fma(_5175, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5493);
    bool _5499 = _5495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5501 = _5475;
    float _5503 = _5471;
    float _5505 = _5493;
    float _5507 = _5487;
    if (!_5499)
    {
        _5501 = _5477;
    }
    float _5509 = _5501;
    float _5511 = _5509;
    if (!_5499)
    {
        _5503 = _5473;
    }
    float _5513 = _5503;
    float _5515 = _5513;
    if (!_5499)
    {
        _5505 = _5483;
    }
    float _5517 = _5505;
    bool _5519 = !_5499;
    float _5521 = _5517;
    if (!_5519)
    {
        float _5523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5525 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5527 = _5495 + _5525;
        float _5529 = rsqrt(_5491);
        float _5531 = _5527 * _5523;
        float _5533 = _5483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5535 = _5531 * 0.15915493667125701904296875;
        float _5537 = _5535 * 6.283185482025146484375;
        float _5539 = cos(_5537);
        float _5541 = _5535 * 6.283185482025146484375;
        float _5543 = sin(_5541);
        float _5545 = _5539 + (-1.0);
        float _5547 = _5545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5549 = fma(_5543, _5533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5551 = fma(_5483, _5539, _5547);
        float _5553 = _5529 * _5549;
        float _5555 = fma(_5487, _5553, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5557 = fma(_5481, _5553, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5521 = _5551;
        _5511 = _5555;
        _5515 = _5557;
    }
    float _5559 = _5521;
    float _5561 = _5511;
    float _5563 = _5515;
    float _5565 = -_3189;
    float _5567 = _5565 + _5559;
    float _5569 = -_2967;
    float _5571 = _5569 + _5561;
    float _5573 = _5497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5575 = _5149 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5577 = _5567 * _5567;
    float _5579 = -_3421;
    float _5581 = _5579 + _5563;
    float _5583 = 1.0 / _5573;
    float _5585 = fma(_5153, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5575);
    float _5587 = fma(_5571, _5571, _5577);
    float _5589 = fma(_5175, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5585);
    float _5591 = fma(_5581, _5581, _5587);
    bool _5593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5595 = isnan(0.5);
    bool _5597 = _5593 || _5595;
    bool _5599 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5601 = _5597 || _5599;
    float _5603 = _5589 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5605 = sqrt(_5591);
    bool _5607 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5609 = isnan(0.5);
    bool _5611 = _5607 || _5609;
    bool _5613 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5615 = _5611 || _5613;
    float _5617 = _5603 + _5573;
    float _5619 = _5617 * _5583;
    float _5621 = _5619 * 0.5;
    float _5623 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5625 = fma(_5621, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5623);
    float _5627 = 1.0 / _5625;
    bool _5629 = _5605 > 0.0;
    float _5631 = _5621;
    float _5633 = _5605;
    float _5635 = _5559;
    float _5637 = _5571;
    float _5639 = _5591;
    if (!_5629)
    {
        _5631 = _5561;
    }
    float _5641 = _5631;
    float _5643 = _5641;
    if (!_5629)
    {
        _5633 = _5563;
    }
    float _5645 = _5633;
    bool _5647 = !_5629;
    float _5649 = _5645;
    if (!_5647)
    {
        float _5651 = _228 * _228;
        float _5653 = fma(_224, _224, _5651);
        float _5655 = fma(_230, _230, _5653);
        float _5657 = rsqrt(_5591);
        float _5659 = sqrt(_5655);
        float _5661 = _5571 * _5657;
        float _5663 = _5567 * _5657;
        float _5665 = _5581 * _5657;
        bool _5667 = _5659 > 0.0;
        float _5669 = _5659;
        float _5671 = _5657;
        _5637 = _5663;
        _5507 = _5661;
        if (!_5667)
        {
            _5669 = _5561;
        }
        float _5673 = _5669;
        _5643 = _5673;
        if (!_5667)
        {
            _5671 = _5563;
        }
        float _5675 = _5671;
        bool _5677 = !_5667;
        _5649 = _5675;
        if (!_5677)
        {
            float _5679 = rsqrt(_5655);
            float _5681 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5683 = _228 * _5679;
            float _5685 = _224 * _5679;
            float _5687 = _230 * _5679;
            float _5689 = _5663 * _5683;
            float _5691 = fma(_5661, _5685, _5689);
            float _5693 = _5681 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5695 = fma(_5665, _5687, _5691);
            float _5697 = _5695 * _5693;
            float _5699 = fma(_228, _5697, _5559);
            float _5701 = fma(_224, _5697, _5561);
            float _5703 = fma(_230, _5697, _5563);
            _5643 = _5701;
            _5649 = _5703;
            _5635 = _5699;
            _5637 = _5691;
        }
    }
    float _5705 = _5643;
    float _5707 = _5649;
    float _5709 = _5635;
    float _5711 = _5637;
    float _5713 = _5507;
    float _5715 = -_3711;
    float _5717 = fma(_5715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5705);
    float _5719 = -_4367;
    float _5721 = fma(_5719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5707);
    float _5723 = -_3705;
    float _5725 = fma(_5723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5709);
    float _5727 = _5725;
    float _5729 = _5721;
    float _5731 = _5713;
    float _5733 = _5711;
    if (_5615)
    {
        _5639 = 1.0;
    }
    float _5735 = _5639;
    float _5737 = _5735;
    if (_5601)
    {
        _4579 = _5717;
    }
    float _5739 = _4579;
    float _5741 = _5739;
    if (!_5601)
    {
        float _5743 = _5161 * _5161;
        float _5745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5747 = -_3421;
        float _5749 = _5747 + _5707;
        float _5751 = -_3189;
        float _5753 = _5751 + _5709;
        float _5755 = fma(_5167, _5167, _5743);
        float _5757 = -_2967;
        float _5759 = _5757 + _5705;
        float _5761 = fma(_5189, _5189, _5755);
        float _5763 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5765 = sqrt(_5761);
        float _5767 = 1.0 / _5291;
        float _5769 = _5763 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5771 = precise::min(_5765, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5773 = _5771 * _5745;
        float _5775 = _5773 * _5767;
        float _5777 = _5769 * _5775;
        float _5779 = _5749 * _5775;
        float _5781 = fma(_5753, _5777, _5149);
        float _5783 = fma(_5759, _5777, _5153);
        float _5785 = fma(_5769, _5779, _5175);
        _5727 = _5781;
        _5741 = _5783;
        _5729 = _5785;
        _5237 = _5765;
    }
    float _5787 = _5727;
    float _5789 = _5741;
    float _5791 = _5729;
    float _5793 = _5237;
    float _5795 = _5793;
    if (_5615)
    {
        _5731 = 1.0;
    }
    float _5797 = _5731;
    float _5799 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5801 = _5627 * _5799;
    float _5803 = _5797;
    if (!_5615)
    {
        float _5805 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5807 = _5805 * 0.15915493667125701904296875;
        float _5809 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5811 = _5807 * 6.283185482025146484375;
        float _5813 = cos(_5811);
        float _5815 = _5809 * 0.15915493667125701904296875;
        float _5817 = _5807 * 6.283185482025146484375;
        float _5819 = sin(_5817);
        float _5821 = 1.0 / _5813;
        float _5823 = _5815 * 6.283185482025146484375;
        float _5825 = cos(_5823);
        float _5827 = _5819 * _5821;
        float _5829 = _5815 * 6.283185482025146484375;
        float _5831 = sin(_5829);
        float _5833 = _5825 * _5827;
        float _5835 = 1.0 / _5833;
        float _5837 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5839 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5837;
        float _5841 = 1.0 / _5839;
        float _5843 = _5831 * _5835;
        float _5845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5847 = fma(_5801, _5843, _5845);
        float _5849 = _5847 * _5841;
        float _5851 = precise::clamp(_5849, 0.0, 1.0);
        _5795 = _5841;
        _5737 = _5851;
    }
    float _5853 = _5795;
    float _5855 = _5737;
    float _5857 = _5853;
    if (!_5615)
    {
        float _5859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5861 = _5859 * 0.15915493667125701904296875;
        float _5863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5865 = _5861 * 6.283185482025146484375;
        float _5867 = cos(_5865);
        float _5869 = _5863 * 0.15915493667125701904296875;
        float _5871 = _5861 * 6.283185482025146484375;
        float _5873 = sin(_5871);
        float _5875 = 1.0 / _5867;
        float _5877 = _5869 * 6.283185482025146484375;
        float _5879 = cos(_5877);
        float _5881 = _5873 * _5875;
        float _5883 = _5869 * 6.283185482025146484375;
        float _5885 = sin(_5883);
        float _5887 = _5879 * _5881;
        float _5889 = 1.0 / _5887;
        float _5891 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5893 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _5891;
        float _5895 = 1.0 / _5893;
        float _5897 = _5885 * _5889;
        float _5899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5901 = fma(_5801, _5897, _5899);
        float _5903 = _5901 * _5895;
        float _5905 = precise::clamp(_5903, 0.0, 1.0);
        float _5907 = -_5905;
        float _5909 = _5907 + 1.0;
        _5857 = _5887;
        _5803 = _5909;
    }
    float _5911 = _5857;
    float _5913 = _5803;
    float _5915 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5917 = _5787 + _5915;
    float _5919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5921 = _5789 + _5919;
    float _5923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5925 = _5791 + _5923;
    float _5927 = _5917 * _5917;
    float _5929 = fma(_5921, _5921, _5927);
    float _5931 = fma(_5925, _5925, _5929);
    float _5933 = rsqrt(_5931);
    float _5935 = sqrt(_5931);
    float _5937 = _5933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5939 = _5921 * _5937;
    float _5941 = _5925 * _5937;
    float _5943 = _5939 * _5939;
    float _5945 = _5941 * _5941;
    float _5947 = _5943 + _5945;
    float _5949 = sqrt(_5947);
    bool _5951 = _5949 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5953 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5955 = _5949 + _5953;
    float _5957 = _5925;
    float _5959 = _5933;
    float _5961 = _5955;
    float _5963 = _5927;
    float _5965 = _5917;
    if (_5951)
    {
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5957 = _5967;
    }
    float _5969 = _5957;
    if (_5951)
    {
        float _5971 = rsqrt(_5947);
        _5959 = _5971;
    }
    float _5973 = _5959;
    float _5975 = _5973;
    if (_5951)
    {
        float _5977 = _5955 * _5969;
        _5961 = _5977;
    }
    float _5979 = _5961;
    if (_5951)
    {
        float _5981 = _5979 * 0.15915493667125701904296875;
        _5963 = _5981;
    }
    float _5983 = _5963;
    float _5985 = _5969;
    float _5987 = _5983;
    if (_5951)
    {
        float _5989 = _5983 * 6.283185482025146484375;
        float _5991 = sin(_5989);
        _5985 = _5991;
    }
    float _5993 = _5985;
    float _5995 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5997 = precise::max(0.0, _5995);
    float _5999 = _5911;
    float _6001 = _5997;
    if (_5951)
    {
        float _6003 = _5983 * 6.283185482025146484375;
        float _6005 = cos(_6003);
        _5999 = _6005;
    }
    float _6007 = _5999;
    float _6009 = -_5937;
    float _6011 = -_5997;
    float _6013 = fma(_5917, _6009, _6011);
    if (_5951)
    {
        float _6015 = _6013 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6001 = _6015;
    }
    float _6017 = _6001;
    float _6019 = _5993;
    float _6021 = _6017;
    if (_5951)
    {
        float _6023 = fma(_5993, _6017, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5965 = _6023;
    }
    float _6025 = _5965;
    float _6027 = _6025;
    if (!_5951)
    {
        _6019 = _5939;
    }
    float _6029 = _6019;
    float _6031 = _6029;
    float _6033 = _6007;
    if (_5951)
    {
        float _6035 = _6007 + (-1.0);
        _6021 = _6035;
    }
    float _6037 = _6021;
    float _6039 = _6037;
    if (_5951)
    {
        float _6041 = _5973 * _6025;
        _5733 = _6041;
    }
    float _6043 = _5733;
    if (!_5951)
    {
        _6027 = _6013;
    }
    float _6045 = _6027;
    float _6047 = _6045;
    if (_5951)
    {
        float _6049 = _6037 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5987 = _6049;
    }
    float _6051 = _5987;
    if (_5951)
    {
        float _6053 = _5939 * _6043;
        _6031 = _6053;
    }
    float _6055 = _6031;
    if (!_5951)
    {
        _6039 = _5941;
    }
    float _6057 = _6039;
    float _6059 = _6057;
    if (_5951)
    {
        float _6061 = _5941 * _6043;
        _6059 = _6061;
    }
    float _6063 = _6059;
    if (!_5951)
    {
        _5975 = _5943;
    }
    float _6065 = _5975;
    float _6067 = _6065;
    if (_5951)
    {
        float _6069 = fma(_6013, _6007, _6051);
        _6047 = _6069;
    }
    float _6071 = _6047;
    if (_5951)
    {
        float _6073 = _6055 * _6055;
        _6067 = _6073;
    }
    float _6075 = _6067;
    if (!_5951)
    {
        _6033 = _5945;
    }
    float _6077 = _6033;
    float _6079 = _6077;
    if (_5951)
    {
        float _6081 = _6063 * _6063;
        _6079 = _6081;
    }
    float _6083 = _6079;
    float _6085 = fma(_6071, _6071, _6075);
    float _6087 = _6085 + _6083;
    float _6089 = fma(_5153, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6091 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6093 = rsqrt(_6087);
    float _6095 = fma(_5175, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6097 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6091);
    float _6099 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6101 = fma(_5935, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6099);
    float _6103 = precise::clamp(_6101, 0.0, 1.0);
    float _6105 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6097);
    float _6107 = floor(_6089);
    float _6109 = -_6103;
    float _6111 = _6109 + 1.0;
    float _6113 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6115 = _6105 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6117 = _6093 * _6055;
    float _6119 = _6093 * _6063;
    float _6121 = _6093 * _6071;
    float _6123 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6113);
    float _6125 = _6117 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6129 = _6115 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6131 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6123);
    float _6133 = -_6125;
    float _6135 = fma(_6121, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6133);
    float _6137 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6139 = abs(_6111);
    float _6141 = log2(_6139);
    float _6143 = _6131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6145 = -_6119;
    float _6147 = fma(_6145, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6135);
    float _6149 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6137);
    float _6151 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6153 = -_6129;
    float _6155 = fma(_6153, _6127, 1.0);
    float _6157 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6159 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6149);
    float _6161 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6151);
    float _6163 = fma(_6147, -0.5, 0.5);
    float _6165 = floor(_6095);
    float _6167 = _6159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6169 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6161);
    float _6171 = -_6107;
    float _6173 = _6089 + _6171;
    float _6175 = fma(_6147, 0.5, 0.5);
    float _6177 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6157);
    float _6179 = _6169 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6181 = _6141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6183 = sqrt(_6163);
    float _6185 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6177);
    float _6187 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6189 = fma(_6175, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6191 = _6121 + 1.0;
    float _6193 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6185);
    float _6195 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6187);
    float _6197 = fma(_6175, _6189, -0.212114393711090087890625);
    float _6199 = exp2(_6181);
    float _6201 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6203 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6195);
    float _6205 = -_6165;
    float _6207 = _6095 + _6205;
    float _6209 = fma(_6175, _6197, 1.570728778839111328125);
    float _6211 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6203);
    float _6213 = log2(_6155);
    float _6215 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6201);
    float _6217 = _6183 * 0.636619746685028076171875;
    float _6219 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6215);
    float _6221 = 1.0 / _6193;
    float _6223 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6219);
    float _6225 = -_6121;
    float _6227 = fma(_6199, _6191, _6225);
    float2 _15971 = float2(_6173, _6207);
    float _6229 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15971, float2(0.0), isnan(_15971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15971, float2(0.0), isnan(_15971)), level(0.0)).x;
    float _6231 = -_6209;
    float _6233 = fma(_6217, _6231, 1.0);
    float _6235 = fma(_5561, 6.2500002968590706586837768554688e-05, 0.5);
    float _6237 = fma(_6227, 0.5, 0.5);
    float _6239 = fma(_5563, 6.2500002968590706586837768554688e-05, 0.5);
    float _6241 = _6213 * 0.693147182464599609375;
    float _6243 = _6241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6245 = _6211 * _6221;
    float _6247 = _6223 * _6221;
    float _6249 = fma(_6245, 0.5, 0.5);
    float _6251 = fma(_6247, -0.5, 0.5);
    float3 _16011 = float3(_6249, _6251, _6243);
    float _6253 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16011, float3(0.0), isnan(_16011)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16011, float3(0.0), isnan(_16011)), level(0.0)).x;
    float3 _16022 = float3(_6249, _6251, _6243);
    float4 _6256 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16022, float3(0.0), isnan(_16022)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16022, float3(0.0), isnan(_16022)), level(0.0)).xyzw;
    float _6258 = _6256.x;
    float _6260 = _6256.y;
    float _6262 = _6256.z;
    float _6264 = _6256.w;
    float2 _16038 = float2(_6233, _6237);
    float3 _6268 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16038, float2(0.0), isnan(_16038)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16038, float2(0.0), isnan(_16038)), level(0.0)).xyz;
    float _6270 = _6268.x;
    float _6272 = _6268.y;
    float _6274 = _6268.z;
    float2 _16052 = float2(_6235, _6239);
    float3 _6276 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_16052, float2(0.0), isnan(_16052)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_16052, float2(0.0), isnan(_16052)), level(0.0)).xyz;
    float _6278 = _6276.x;
    float _6280 = _6276.y;
    float _6282 = _6276.z;
    float _6284 = abs(_5801);
    float _6286 = log2(_6284);
    float _6288 = in.m_91.x;
    float _6290 = in.m_91.y;
    float _6292 = in.m_91.z;
    bool _6294 = _5301 != 0.0;
    bool _6296 = isnan(_5301);
    bool _6298 = _6294 || _6296;
    bool _6300 = isnan(0.0);
    bool _6302 = _6298 || _6300;
    float _6304 = _6141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6306 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6308 = in.m_93.x;
    float _6310 = in.m_93.y;
    float _6312 = in.m_93.z;
    float _6314 = in.m_93.w;
    bool _6316 = _5299 == 0.0;
    bool _6318 = !_6302;
    bool _6320 = _6316 && _6318;
    float _6322 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6306);
    bool _6324 = _5801 <= 8000.0;
    bool _6326 = isnan(_5801);
    bool _6328 = _6324 || _6326;
    bool _6330 = isnan(8000.0);
    bool _6332 = _6328 || _6330;
    float _6334 = float(_6332);
    bool _6336 = _5303 == 0.0;
    bool _6338 = _6336 && _6320;
    float _6340 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6322);
    float _6342 = _6286 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6344 = exp2(_6342);
    float _6346 = _6286;
    float _6348 = _6243;
    float _6350 = _6288;
    float _6352 = _6193;
    float _6354 = _6211;
    float _6356 = _6223;
    if (_6338)
    {
        _3733 = _6288;
    }
    float _6358 = _3733;
    float _6360 = _6358;
    if (_6338)
    {
        _3915 = _6290;
    }
    float _6362 = _3915;
    float _6364 = _6362;
    if (_6338)
    {
        _6346 = _6358;
    }
    float _6366 = _6346;
    float _6368 = _6366;
    if (!_6338)
    {
        _6360 = _6288;
    }
    float _6370 = _6360;
    if (_6338)
    {
        _6348 = _6362;
    }
    float _6372 = _6348;
    float _6374 = _6372;
    if (!_6338)
    {
        _6364 = _6290;
    }
    float _6376 = _6364;
    if (!_6338)
    {
        float _6378 = fma(_5299, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6370);
        _6368 = _6378;
    }
    float _6380 = _6368;
    if (_6338)
    {
        _6350 = _6292;
    }
    float _6382 = _6350;
    float _6384 = _6382;
    if (!_6338)
    {
        float _6386 = fma(_5303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6292);
        _6384 = _6386;
    }
    float _6388 = _6384;
    if (!_6338)
    {
        float _6390 = fma(_5301, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6376);
        _6374 = _6390;
    }
    float _6392 = _6374;
    float _6394 = _6310 * _6292;
    float _6396 = _6312 * _6370;
    float _6398 = fma(_6344, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6400 = precise::clamp(_6398, 0.0, 1.0);
    float _6402 = _6308 * _6376;
    float _6404 = -_6394;
    float _6406 = fma(_6312, _6376, _6404);
    float _6408 = -_6396;
    float _6410 = fma(_6308, _6292, _6408);
    float _6412 = fma(_6400, -2.0, 3.0);
    float _6414 = -_6402;
    float _6416 = fma(_6310, _6370, _6414);
    float _6418 = _6400 * _6400;
    float _6420 = _6410 * _6314;
    float _6422 = _6406 * _6314;
    float _6424 = _6416 * _6314;
    float _6426 = _6418 * _6412;
    float _6428 = _5357 * _5447;
    float _6430 = _5357 * _5455;
    float _6432 = _5357 * _5441;
    float _6434 = _5385 * _5455;
    float _6436 = _5385 * _5447;
    float _6438 = _5403 * _5455;
    float _6440 = _5385 * _5441;
    float _6442 = _5403 * _5447;
    float _6444 = _5403 * _5441;
    float _6446 = -_5319;
    float _6448 = fma(_6446, _5431, _6434);
    float _6450 = fma(_5377, _5431, _6430);
    float _6452 = -_5319;
    float _6454 = fma(_6452, _5429, _6440);
    float _6456 = fma(_5389, _5427, _6442);
    float _6458 = fma(_5389, _5431, _6438);
    float _6460 = fma(_5389, _5429, _6444);
    float _6462 = fma(_5377, _5427, _6428);
    float _6464 = fma(_5387, _5327, _6448);
    float _6466 = fma(_5377, _5429, _6432);
    float _6468 = fma(_5399, _5327, _6450);
    float _6470 = fma(_5359, _5323, _6456);
    float _6472 = fma(_5359, _5327, _6458);
    float _6474 = fma(_5359, _5325, _6460);
    float _6476 = -_5319;
    float _6478 = fma(_6476, _5427, _6436);
    float _6480 = _6464 * _6310;
    float _6482 = fma(_5387, _5325, _6454);
    float _6484 = fma(_5399, _5323, _6462);
    float _6486 = fma(_5387, _5323, _6478);
    float _6488 = fma(_6468, _6308, _6480);
    float _6490 = exp2(_6304);
    float _6492 = fma(_5399, _5325, _6466);
    float _6494 = _6486 * _6310;
    float _6496 = _6482 * _6310;
    float _6498 = fma(_6472, _6312, _6488);
    float _6500 = -_6426;
    float _6502 = _6500 + 1.0;
    float _6504 = in.m_95.x;
    float _6506 = _6464 * _6392;
    float _6508 = _6420 * _6464;
    float _6510 = fma(_6502, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6426);
    float _6512 = _6486 * _6392;
    float _6514 = _6482 * _6392;
    float _6516 = fma(_6484, _6308, _6494);
    float _6518 = _6334 * _6510;
    float _6520 = fma(_6468, _6380, _6506);
    float _6522 = _6420 * _6486;
    float _6524 = _6420 * _6482;
    float _6526 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6340);
    float _6528 = fma(_6484, _6380, _6512);
    float _6530 = fma(_6492, _6380, _6514);
    float _6532 = fma(_6422, _6468, _6508);
    float _6534 = _6518 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6536 = -_6490;
    float _6538 = _6536 + 1.0;
    float _6540 = fma(_6422, _6484, _6522);
    float _6542 = fma(_6422, _6492, _6524);
    float _6544 = fma(_6470, _6388, _6528);
    float _6546 = fma(_6472, _6388, _6520);
    float _6548 = fma(_6474, _6388, _6530);
    float _6550 = _6538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6552 = fma(_6424, _6470, _6540);
    float _6554 = fma(_6424, _6472, _6532);
    float _6556 = fma(_6424, _6474, _6542);
    float _6558 = fma(_6492, _6308, _6496);
    float _6560 = fma(_6470, _6312, _6516);
    float _6562 = _6526 + _6193;
    float _6564 = _6211 + _6193;
    out.m_97.x = _6552;
    out.m_97.y = _6554;
    out.m_97.z = _6556;
    float _6566 = _6193 * 0.5;
    float _6568 = fma(_6474, _6312, _6558);
    float _6570 = _6562 * 0.5;
    float _6572 = _6564 * 0.5;
    float _6574 = fma(_6223, -0.5, _6566);
    out.m_99.x = _6560;
    out.m_99.y = _6498;
    out.m_99.z = _6568;
    bool _6576 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6578 = isnan(_5935);
    bool _6580 = _6576 || _6578;
    bool _6582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6584 = _6580 || _6582;
    out.m_101.x = _6572;
    out.m_101.y = _6574;
    out.m_101.z = _6570;
    out.m_101.w = _6193;
    float _6586 = -_6550;
    float _6588 = _6586 + 1.0;
    out.m_103.x = _6544;
    out.m_103.y = _6546;
    out.m_103.z = _6548;
    out.gl_Position.x = _6211;
    out.gl_Position.y = _6223;
    out.gl_Position.z = _6526;
    out.gl_Position.w = _6193;
    float _6590 = _6556;
    if (!_6584)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6592 = _6590;
    float _6594 = _6592;
    float _6596 = _6592;
    if (!_6584)
    {
        _6352 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6598 = _6352;
    float _6600 = _6598;
    float _6602 = _6598;
    if (!_6584)
    {
        _6354 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6604 = _6354;
    float _6606 = _6604;
    float _6608 = _6604;
    if (!_6584)
    {
        _6356 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6610 = _6356;
    float _6612 = -_6229;
    float _6614 = _6612 + 1.0;
    float _6616 = _6614 * _6534;
    float _6618 = precise::clamp(_6616, 0.0, 1.0);
    float _6620 = -_6618;
    float _6622 = fma(_6620, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6624 = _6622 * _6504;
    float _6626 = _6624 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_105.x = _6626;
    float _6628 = _6550 * _6253;
    float _6630 = _6264 * _6588;
    float _6632 = _5855 * _5913;
    float _6634 = _6264 * _6628;
    float _6636 = _6274 * _6628;
    out.m_107.x = _6278;
    out.m_107.y = _6280;
    out.m_107.z = _6282;
    float _6638 = _6632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6640 = fma(_6270, _6634, _6258);
    float _6642 = fma(_6272, _6634, _6260);
    float _6644 = fma(_6264, _6636, _6262);
    float _6646 = _6634;
    float _6648 = _6632;
    float _6650 = _6610;
    float _6652 = _6610;
    if (!_6584)
    {
        _6646 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6654 = _6646;
    float _6656 = _6654;
    float _6658 = _6654;
    if (!_6584)
    {
        _6648 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6660 = _6648;
    out.m_109.x = _6640;
    out.m_109.y = _6642;
    out.m_109.z = _6644;
    out.m_109.w = _6630;
    bool _6662 = !_6584;
    float _6664 = _6660;
    float _6666 = _6660;
    if (!_6662)
    {
        bool _6668 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6670 = isnan(_5935);
        bool _6672 = _6668 || _6670;
        bool _6674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6676 = _6672 || _6674;
        if (!_6676)
        {
            float _6678 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6680 = _5935 + _6678;
            float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6684 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6682;
            float _6686 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6688 = _6686 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6690 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6692 = _6690 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6694 = 1.0 / _6684;
            float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6708 = _6680 * _6694;
            float _6710 = precise::clamp(_6708, 0.0, 1.0);
            float _6712 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6714 = _6712 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6716 = fma(_6710, _6688, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6718 = fma(_6710, _6692, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6720 = fma(_6710, _6714, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6722 = fma(_6710, _6698, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6724 = fma(_6710, _6702, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6726 = fma(_6710, _6706, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6658 = _6716;
            _6608 = _6724;
            _6596 = _6718;
            _6602 = _6722;
            _6666 = _6720;
            _6652 = _6726;
            _6728 = true;
        }
        else
        {
            bool _6730 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6732 = isnan(_5935);
            bool _6734 = _6730 || _6732;
            bool _6736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6738 = _6734 || _6736;
            if (!_6738)
            {
                _6600 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6740 = _6600;
            _6602 = _6740;
            if (!_6738)
            {
                _6606 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6742 = _6606;
            _6608 = _6742;
            if (!_6738)
            {
                _6650 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6744 = _6650;
            _6652 = _6744;
            if (!_6738)
            {
                _6594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6746 = _6594;
            _6596 = _6746;
            if (!_6738)
            {
                _6656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6748 = _6656;
            _6658 = _6748;
            if (!_6738)
            {
                _6664 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6750 = _6664;
            bool _6752 = !_6738;
            _6666 = _6750;
            if (!_6752)
            {
                bool _6754 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6756 = isnan(_5935);
                bool _6758 = _6754 || _6756;
                bool _6760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6762 = _6758 || _6760;
                if (!_6762)
                {
                    float _6764 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6766 = _5935 + _6764;
                    float _6768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6770 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6768;
                    float _6772 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6774 = _6772 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6776 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6778 = _6776 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6780 = 1.0 / _6770;
                    float _6782 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6784 = _6782 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6786 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6788 = _6786 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6792 = _6790 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6794 = _6766 * _6780;
                    float _6796 = precise::clamp(_6794, 0.0, 1.0);
                    float _6798 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6800 = _6798 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6802 = fma(_6796, _6774, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6804 = fma(_6796, _6778, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6806 = fma(_6796, _6800, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6808 = fma(_6796, _6784, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6810 = fma(_6796, _6788, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6812 = fma(_6796, _6792, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6658 = _6802;
                    _6608 = _6810;
                    _6596 = _6804;
                    _6602 = _6808;
                    _6666 = _6806;
                    _6652 = _6812;
                    _6728 = true;
                }
                else
                {
                    _6658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6608 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6602 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6666 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6652 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6728 = false;
    float _6814 = _6658;
    float _6816 = _6608;
    float _6818 = _6596;
    float _6820 = _6602;
    float _6822 = _6666;
    float _6824 = _6652;
    float _6826 = fma(_6546, -0.5, 0.5);
    float _6828 = precise::clamp(_6826, 0.0, 1.0);
    float _6830 = -_6814;
    float _6832 = _6816 + _6830;
    float _6834 = _6638 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6836 = -_6818;
    float _6838 = _6820 + _6836;
    float _6840 = fma(_6828, _6832, _6814);
    out.m_111.x = 0.0;
    float _6842 = -_6822;
    float _6844 = _6824 + _6842;
    float _6846 = fma(_6828, _6838, _6818);
    float _6848 = _6840 * 0.586610972881317138671875;
    out.m_51.x = _6834;
    bool _6850 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6852 = fma(_6828, _6844, _6822);
    float _6854 = fma(_6846, 0.298911988735198974609375, _6848);
    bool _6856 = _5855 > 0.0;
    bool _6858 = isnan(_5855);
    bool _6860 = _6856 || _6858;
    bool _6862 = isnan(0.0);
    bool _6864 = _6860 || _6862;
    float _6866 = fma(_6852, 0.114477999508380889892578125, _6854);
    bool _6868 = _5913 <= 0.0;
    bool _6870 = !_6864;
    bool _6872 = _6868 || _6870;
    float _6874 = -_6866;
    float _6876 = _6846 + _6874;
    float _6878 = -_6866;
    float _6880 = _6840 + _6878;
    float _6882 = -_6866;
    float _6884 = _6852 + _6882;
    float _6886 = fma(_6876, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    float _6888 = fma(_6880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    float _6890 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    bool _6892 = !_6850;
    if (!_6892)
    {
        float _6894 = -_5787;
        float _6896 = _6894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6898 = -_5789;
        float _6900 = _6898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6902 = -_5791;
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
        float _6936 = _6546 * _6926;
        float _6938 = -_6926;
        float _6940 = -_6934;
        float _6942 = fma(_6938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6940);
        float _6944 = fma(_6544, _6924, _6936);
        float _6946 = -_6932;
        float _6948 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6942);
        float _6950 = fma(_6548, _6932, _6944);
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
        out.m_111.x = _6970;
        out.m_111.y = _6972;
        out.m_111.z = _6974;
    }
    out.m_113.x = _6886;
    out.m_113.y = _6888;
    out.m_113.z = _6890;
    if (!_6872)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _6976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6976;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6728 = false;
    bool _1224 = false;
    bool _900 = false;
    bool _720 = false;
    bool _528 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _7033 = as_type<float>(_148);
        out.gl_Position.z = _7033;
    }
    if (!_136)
    {
        return out;
    }
    float _152 = in.m_53.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_51.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7102 = as_type<float>(_186);
        out.gl_Position.z = _7102;
    }
    if (_180)
    {
        return out;
    }
    float _188 = in.m_55.x;
    float _190 = in.m_55.y;
    float _192 = in.m_55.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_57.x;
    float _198 = in.m_57.y;
    float _200 = in.m_57.z;
    float _202 = in.m_59.x;
    float _204 = in.m_59.y;
    float _206 = in.m_59.z;
    float _208 = in.m_61.x;
    float _210 = in.m_61.y;
    float _212 = in.m_61.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_63.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = 1.0 / _280;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _284;
    bool _296 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_260);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _276;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _260 + _310;
    float _314 = _312 * _290;
    bool _316 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _318 = isnan(_260);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _288;
    float _330 = _264 * _294;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = _268 * _308;
    bool _342 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _344 = isnan(_260);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_326;
    float _356 = _354 + 1.0;
    float _358 = fma(_338, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _360 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = _352 * _356;
    float _364 = -_352;
    float _366 = _364 + 1.0;
    float _368 = _272 * _328;
    bool _370 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = isnan(_260);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    bool _386 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_260);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = fma(_384, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _380 * _366;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = _306 * _406;
    float _420 = -_306;
    float _422 = _420 + 1.0;
    float _424 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_412, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = _396 * _422;
    float _432 = -_396;
    float _434 = _432 + 1.0;
    float _436 = _358 * _430;
    float _438 = _360 * _430;
    float _440 = _402 * _430;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _442;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _448 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_424, _418, _446);
    float _462 = fma(_426, _418, _448);
    float _464 = fma(_428, _418, _450);
    float _466 = fma(_444, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_454, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_458, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_466, _408, _460);
    float _486 = fma(_474, _314, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _488 = fma(_478, _314, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _490 = fma(_482, _314, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_468, _408, _462);
    float _494 = fma(_470, _408, _464);
    float _496 = fma(_486, _362, _484);
    float _498 = fma(_488, _362, _492);
    float _500 = fma(_490, _362, _494);
    float _502 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _496);
    float _504 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _498);
    float _506 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].z, _500);
    bool _508 = !_292;
    float _526;
    if (!_508)
    {
        float _510 = in.m_63.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_132);
        float _532 = 1.0 / _530;
        float _534 = _166 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _536 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_536);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _568 = isnan(_536);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = 1.0 / _544;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _580;
    float _584 = -_560;
    float _586 = _584 + 1.0;
    bool _588 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_536);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _602 = 1.0 / _548;
    float _604 = 1.0 / _564;
    float _606 = _582 * _578;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _612 = _576 * _586;
    float _614 = -_576;
    float _616 = _614 + 1.0;
    float _618 = fma(_606, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _620;
    float _624 = _598 * _616;
    float _626 = _610 * _602;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _536 + _628;
    bool _632 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _634 = isnan(_536);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = _618 * _624;
    float _646 = -_598;
    float _648 = _646 + 1.0;
    float _650 = fma(_626, _630, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _536 + _652;
    float _656 = _622 * _604;
    float _658 = -_642;
    float _660 = _658 + 1.0;
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _664 = fma(_656, _654, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _666 = _560 * _660;
    float _668 = fma(_650, _612, _662);
    float _670 = in.m_65.x;
    float _672 = in.m_65.y;
    float _674 = in.m_65.z;
    float _676 = fma(_664, _666, _668);
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _680 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[118].x, _676);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _686;
    out.m_67.y = _690;
    out.m_67.z = _692;
    out.m_67.w = _688;
    float _694 = _506 * _674;
    float _696 = _504 * _672;
    float _698 = _502 * _670;
    bool _700 = !_600;
    float _718;
    if (!_700)
    {
        float _702 = in.m_63.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_132);
        float _724 = 1.0 / _722;
        float _726 = _166 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _738 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _740 = isnan(_728);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _758 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _760 = isnan(_728);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = 1.0 / _736;
    float _772 = -_748;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _776;
    bool _780 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _782 = isnan(_728);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _768 * _774;
    float _794 = -_768;
    float _796 = _794 + 1.0;
    bool _798 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _800 = 1.0 / _752;
    float _802 = _790 * _796;
    float _804 = -_790;
    float _806 = _804 + 1.0;
    float _808 = 1.0 / _756;
    float _810 = _778 * _770;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _816 = fma(_810, _732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _818 = _814 * _800;
    bool _820 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _822 = isnan(_728);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _838 = _728 + _836;
    float _840 = _816 * _802;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _844 = _728 + _842;
    float _846 = -_830;
    float _848 = _846 + 1.0;
    float _850 = fma(_818, _838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _852 = _834 * _808;
    float _854 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[131].x, _840);
    float _856 = _748 * _848;
    float _858 = fma(_852, _844, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _860 = fma(_850, _792, _854);
    float _862 = fma(_858, _856, _860);
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _870 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[134].x, _862);
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _872;
    out.m_69.y = _874;
    out.m_69.z = _876;
    out.m_69.w = _878;
    bool _880 = !_798;
    float _898;
    if (!_880)
    {
        float _882 = in.m_63.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_132);
        float _904 = 1.0 / _902;
        float _906 = _166 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _912 = _908 + _910;
    bool _914 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _916 = isnan(_908);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _930;
    bool _934 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _936 = isnan(_908);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -_924;
    float _948 = _946 + 1.0;
    bool _950 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _952 = isnan(_908);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = 1.0 / _928;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _968 = _944 * _948;
    float _970 = -_960;
    float _972 = _970 + 1.0;
    float _974 = 1.0 / _966;
    bool _976 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _978 = _932 * _962;
    float _980 = -_944;
    float _982 = _980 + 1.0;
    bool _984 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _986 = isnan(_908);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = fma(_978, _912, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _998 = _960 * _982;
    bool _1000 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1002 = isnan(_908);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _994 * _972;
    float _1014 = -_994;
    float _1016 = _1014 + 1.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1022 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1024 = isnan(_908);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = _1010 * _1016;
    float _1036 = -_1010;
    float _1038 = _1036 + 1.0;
    bool _1040 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1042 = isnan(_908);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = 1.0 / _1020;
    float _1054 = -_1032;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1062 = _1032 * _1038;
    float _1064 = _1050 * _1056;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1070 = -_1050;
    float _1072 = _1070 + 1.0;
    float _1074 = 1.0 / _1060;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1080 = _996 * _1064;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1088 = _908 + _1086;
    float _1090 = _1078 * _974;
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1080);
    float _1094 = 1.0 / _1068;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1096;
    float _1100 = fma(_1090, _1088, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1108 = _908 + _1106;
    float _1110 = _1098 * _1052;
    float _1112 = fma(_1100, _1062, _1092);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1116 = _908 + _1114;
    float _1118 = 1.0 / _1084;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = fma(_1110, _1108, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1126 = _1122 * _1074;
    bool _1128 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1130 = isnan(_908);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1140;
    float _1144 = 1.0 / _1104;
    float _1146 = fma(_1124, _1034, _1112);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = _1142 * _1094;
    float _1154 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1158 = _908 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1162 = _908 + _1160;
    float _1164 = _1150 * _1118;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1166;
    float _1170 = fma(_1152, _1158, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1172 = fma(_1154, _1012, _1146);
    float _1174 = fma(_1164, _1162, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1176 = -_1138;
    float _1178 = _1176 + 1.0;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1182 = _908 + _1180;
    float _1184 = fma(_1170, _998, _1172);
    float _1186 = _1168 * _1144;
    float _1188 = _924 * _1178;
    float _1190 = fma(_1174, _968, _1184);
    float _1192 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1194 = fma(_1192, _1188, _1190);
    float _1196 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1194);
    out.m_71.x = _1196;
    bool _1198 = !_976;
    int _1200 = as_type<int>(_968);
    float _1202 = _1094;
    float _1204 = _1144;
    float _1222;
    if (!_1198)
    {
        float _1206 = in.m_63.x;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1210 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].y, _166);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        float _1226 = float(_132);
        float _1228 = 1.0 / _1226;
        float _1230 = _166 * _1228;
        _1222 = _1230;
    }
    _1224 = false;
    float _1232 = _1222;
    float _1234 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1236 = int(_1234);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1248 = int(_1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1256 = _1254 != 0;
    float _1258 = 0.0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1262 = _1252;
    bool _1264 = _1256;
    if (_1240)
    {
        _1258 = 1.0;
    }
    float _1266 = _1258;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1270 = int(_1268);
    float _1272 = float(_1236);
    float _1274 = 0.0;
    float _1276 = _1266;
    if (_1240)
    {
        _1274 = 1.0;
    }
    float _1278 = _1274;
    float _1280 = 0.0;
    float _1282 = _1278;
    if (_1240)
    {
        _1280 = 1.0;
    }
    float _1284 = _1280;
    int _1286 = 0;
    float _1288 = _1284;
    if (_1240)
    {
        _1286 = 0;
    }
    int _1290 = _1286;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1294 = int(_1292);
    float _1296 = float(_1248);
    int _1298 = _1290;
    if (_1240)
    {
        _1260 = 0;
    }
    int _1300 = _1260;
    float _1302 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1304 = int(_1302);
    float _1306 = float(_1270);
    float _1308 = float(_1294);
    float _1310 = 1.0 / _1272;
    float _1312 = float(uint(_1304));
    float _1314 = 1.0 / _1296;
    float _1316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1318 = int(_1316);
    float _1320 = _1310 * _166;
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1324 = int(_1322);
    float _1326 = _1314 * _166;
    float _1328 = _1314;
    int _1330 = _1300;
    if (_1240)
    {
        float _1332 = in.m_63.z;
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1338 = int(_1336);
    float _1340 = float(uint(_1318));
    float _1342 = 1.0 / _1306;
    float _1344 = float(uint(_1324));
    float _1346 = 1.0 / _1308;
    float _1348 = float(uint(_1338));
    int _1350 = 0;
    float _1352 = _1334;
    if (_1240)
    {
        _1350 = as_type<int>(_1334);
    }
    int _1354 = _1350;
    float _1356 = 1.0 / _1312;
    float _1358 = _1342 * _166;
    float _1360 = _1346 * _166;
    float _1362 = 1.0 / _1344;
    int _1364 = as_type<int>(_1356) + (-2);
    float _1366 = 1.0 / _1348;
    float _1368 = in.m_73.x;
    float _1370 = _1356;
    int _1372 = _1354;
    if (_1240)
    {
        float _1374 = in.m_63.x;
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = trunc(_1320);
    int _1380 = int(_1378);
    int _1382 = as_type<int>(_1362) + (-2);
    float _1384 = trunc(_1326);
    int _1386 = int(_1384);
    int _1388 = as_type<int>(_1366) + (-2);
    float _1390 = 1.0 / _1340;
    float _1392 = float(uint(_1380));
    float _1394 = _1376;
    float _1396 = _1368;
    if (_1252)
    {
        float _1398 = -_1368;
        float _1400 = _1398 + 1.0;
        _1200 = as_type<int>(_1400);
    }
    int _1402 = _1200;
    if (!_1256)
    {
        _1202 = _1368;
    }
    float _1404 = _1202;
    float _1406 = 0.0;
    float _1408 = _1404;
    if (!_1252)
    {
        _1406 = _1368;
    }
    float _1410 = _1406;
    float _1412 = as_type<float>(_1382) * _1392;
    float _1414 = _1410;
    if (!_1244)
    {
        _1204 = _1368;
    }
    float _1416 = _1204;
    float _1418 = trunc(_1360);
    int _1420 = int(_1418);
    float _1422 = in.m_63.y;
    float _1424 = float(uint(_1386));
    float _1426 = as_type<float>(_1388) * _1424;
    float _1428 = trunc(_1358);
    int _1430 = int(_1428);
    int _1432 = as_type<int>(_1390) + (-2);
    float _1434 = float(uint(_1420));
    float _1436 = trunc(_1412);
    float _1438 = precise::max(_1436, 0.0);
    uint _1441 = uint(_1438);
    float _1443 = as_type<float>(_1364) * _1434;
    float _1445 = float(uint(_1430));
    float _1447 = trunc(_1426);
    float _1449 = precise::max(_1447, 0.0);
    uint _1451 = uint(_1449);
    bool _1453 = _1422 > 0.5;
    int _1455 = 0;
    float _1457 = _1416;
    if (_1240)
    {
        _1455 = as_type<int>(_1422);
    }
    int _1459 = _1455;
    float _1461 = as_type<float>(_1432) * _1445;
    float _1463 = _1461;
    int _1465 = _1459;
    if (_1252)
    {
        float _1467 = _1453 ? as_type<float>(_1402) : _1368;
        _1414 = _1467;
    }
    float _1469 = _1414;
    float _1471 = trunc(_1443);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = trunc(_1461);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    int _1483 = int(_1252);
    int _1485 = _1244 ? 2 : 0;
    int _1487 = _1483 | _1485;
    int _1489 = _1256 ? 4 : 0;
    int _1491 = _1487 | _1489;
    int _1493 = _1240 ? 8 : 0;
    int _1495 = _1491 | _1493;
    int _1497 = false ? 16 : 0;
    int _1499 = _1495 | _1497;
    int _1501 = _1453 ? 32 : 0;
    int _1503 = _1499 | _1501;
    int _1505 = false ? 64 : 0;
    int _1507 = _1503 | _1505;
    int _1509 = _1507 & 32;
    int _1511 = _1509;
    if (_1256)
    {
        float _1513 = -_1368;
        float _1515 = _1513 + 1.0;
        _1511 = as_type<int>(_1515);
    }
    int _1517 = _1511;
    float _1519 = as_type<float>(_1517);
    if (_1256)
    {
        float _1521 = _1453 ? as_type<float>(_1517) : _1368;
        _1408 = _1521;
    }
    float _1523 = _1408;
    if (_1240)
    {
        _1463 = _1376;
    }
    float _1525 = _1463;
    float _1527 = _1525;
    if (_1240)
    {
        _1519 = _1525;
    }
    float _1529 = _1519;
    int _1531 = 0;
    float _1533 = _1529;
    if (_1240)
    {
        _1531 = as_type<int>(_1525);
    }
    int _1535 = _1531;
    int _1537 = _1535;
    if (!_1240)
    {
        float _1539 = in.m_63.x;
        float _1541 = _1422 * 3.1415927410125732421875;
        float _1543 = in.m_63.z;
        float _1545 = _1541 * 0.15915493667125701904296875;
        float _1547 = _1545 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = _1539 * 3.1415927410125732421875;
        float _1553 = _1551 * 0.15915493667125701904296875;
        float _1555 = _1543 * 3.1415927410125732421875;
        float _1557 = _1555 * 0.15915493667125701904296875;
        float _1559 = _1553 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = _1557 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        _1533 = _1543;
        _1288 = 5.839270114898681640625;
        _1394 = _1539;
        _1276 = 7.345489978790283203125;
        _1527 = _1422;
        _1282 = 1.2345600128173828125;
        _1298 = 1;
        _1352 = _1543;
        _1372 = as_type<int>(_1565);
        _1465 = as_type<int>(_1549);
        _1330 = 2;
        _1537 = as_type<int>(_1561);
    }
    float _1567 = _1533;
    float _1569 = _1288;
    float _1571 = _1394;
    float _1573 = _1276;
    float _1575 = _1527;
    float _1577 = _1282;
    int _1579 = _1298;
    float _1581 = _1352;
    int _1583 = _1372;
    int _1585 = _1465;
    int _1587 = _1330;
    int _1589 = _1537;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1593 = _1591 != 0;
    float _1595 = _1567 * _1569;
    float _1597 = 0.0;
    if (_1244)
    {
        float _1599 = in.m_63.x;
        _1597 = _1599;
    }
    float _1601 = _1597;
    int _1603 = ~_1324;
    int _1605 = _1603 + 1;
    float _1607 = _1571 * _1573;
    int _1609 = ~_1318;
    int _1611 = _1609 + 1;
    float _1613 = floor(_1595);
    int _1615 = ~_1304;
    int _1617 = _1615 + 1;
    int _1619 = _1605 * int(_1441);
    int _1621 = _1619 + _1380;
    int _1623 = ~_1338;
    int _1625 = _1623 + 1;
    int _1627 = _1611 * int(_1481);
    int _1629 = _1627 + _1430;
    float _1631 = _1575 * _1577;
    int _1633 = _1617 * int(_1475);
    int _1635 = _1633 + _1420;
    int _1637 = as_type<int>(_1567);
    if (_1593)
    {
        float _1639 = in.m_63.z;
        _1637 = as_type<int>(_1639);
    }
    int _1641 = _1637;
    float _1643 = float(uint(_1621));
    int _1645 = _1625 * int(_1451);
    int _1647 = _1645 + _1386;
    float _1649 = float(uint(_1629));
    float _1651 = _1575 * _1573;
    float _1653 = float(uint(_1635));
    float _1655 = as_type<float>(_1382) * _1643;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1659 = _1657 != 0;
    float _1661 = as_type<float>(_1432) * _1649;
    float _1663 = floor(_1607);
    float _1665 = as_type<float>(_1364) * _1653;
    float _1667 = float(uint(_1647));
    int _1669 = 0;
    float _1671 = _1661;
    float _1673 = _1665;
    if (_1593)
    {
        float _1675 = -_1368;
        float _1677 = _1675 + 1.0;
        _1669 = as_type<int>(_1677);
    }
    int _1679 = _1669;
    if (_1244)
    {
        bool _1681 = _1601 > 0.5;
        _1262 = _1681;
    }
    bool _1683 = _1262;
    float _1685 = -_1613;
    float _1687 = _1595 + _1685;
    float _1689 = float(_1380);
    float _1691 = as_type<float>(_1388) * _1667;
    float _1693 = trunc(_1655);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    int _1699 = ~_1338;
    int _1701 = _1699 + 1;
    bool _1703 = _1579 != 1;
    int _1705 = 0;
    if (_1659)
    {
        float _1707 = -_1368;
        float _1709 = _1707 + 1.0;
        _1705 = as_type<int>(_1709);
    }
    int _1711 = _1705;
    float _1713 = in.m_57.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1717 = _1232 + _1715;
    int _1719 = ~_1318;
    int _1721 = _1719 + 1;
    int _1723 = _1641;
    if (_1593)
    {
        bool _1725 = as_type<float>(_1641) > 0.5;
        _1264 = _1725;
    }
    bool _1727 = _1264;
    if (_1244)
    {
        float _1729 = -_1368;
        float _1731 = _1729 + 1.0;
        _1723 = as_type<int>(_1731);
    }
    int _1733 = _1723;
    float _1735 = trunc(_1661);
    float _1737 = precise::max(_1735, 0.0);
    uint _1739 = uint(_1737);
    float _1741 = -_1663;
    float _1743 = _1607 + _1741;
    float _1745 = float(_1324);
    float _1747 = in.m_59.w;
    if (_1244)
    {
        float _1749 = _1683 ? as_type<float>(_1733) : _1368;
        _1457 = _1749;
    }
    float _1751 = _1457;
    float _1753 = float(_132);
    float _1755 = _1745 * _1687;
    float _1757 = floor(_1651);
    if (!_1593)
    {
        _1671 = _1368;
    }
    float _1759 = _1671;
    float _1761 = in.m_61.w;
    float _1763 = _1759;
    if (_1593)
    {
        float _1765 = _1727 ? as_type<float>(_1679) : _1368;
        _1763 = _1765;
    }
    float _1767 = _1763;
    int _1769 = int(_1441) + int(_1697);
    float _1771 = float(_1318);
    float _1773 = trunc(_1665);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    int _1779 = int(_1481) + int(_1739);
    int _1781 = ~_1318;
    int _1783 = _1781 + 1;
    float _1785 = _1743 * _1771;
    float _1787 = float(_1420);
    float _1789 = float(_1386);
    float _1791 = floor(_1631);
    if (!_1659)
    {
        _1673 = _1368;
    }
    float _1793 = _1673;
    float _1795 = -_1757;
    float _1797 = _1651 + _1795;
    float _1799 = _1793;
    if (_1659)
    {
        float _1801 = _1453 ? as_type<float>(_1711) : _1368;
        _1799 = _1801;
    }
    float _1803 = _1799;
    int _1805 = _1783 * _1779;
    int _1807 = _1805 + _1430;
    int _1809 = ~_1324;
    int _1811 = _1809 + 1;
    float _1813 = float(_1430);
    float _1815 = 1.0 / _1753;
    int _1817 = int(_1475) + int(_1777);
    bool _1819 = _1689 >= _1745;
    bool _1821 = isnan(_1689);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(_1745);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    int _1831 = _1811 * _1769;
    int _1833 = _1831 + _1380;
    bool _1835 = _1813 >= _1771;
    bool _1837 = isnan(_1813);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1771);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1771 * _166;
    bool _1849 = uint(_1807) >= uint(_1318);
    float _1851 = trunc(_1691);
    float _1853 = precise::max(_1851, 0.0);
    uint _1855 = uint(_1853);
    float _1857 = -_1791;
    float _1859 = _1631 + _1857;
    float _1861 = float(_1304);
    float _1863 = float(_1338);
    bool _1865 = _1787 >= _1861;
    bool _1867 = isnan(_1787);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(_1861);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = _1861 * _1859;
    float _1879 = _1815 * _166;
    bool _1881 = uint(_1833) >= uint(_1324);
    float _1883 = _1847 * _1815;
    float _1885 = trunc(_1845);
    int _1887 = int(_1885);
    float _1889 = _1863 * _1879;
    bool _1891 = _1789 >= _1863;
    bool _1893 = isnan(_1789);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(_1863);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = _1861 * _1879;
    bool _1905 = _1318 == 0;
    float _1907 = _1745 * _1879;
    int _1909 = int(_1451) + int(_1855);
    float _1911 = trunc(_1785);
    int _1913 = int(_1911);
    int _1915 = ~_1304;
    int _1917 = _1915 + 1;
    float _1919 = _1863 * _1797;
    bool _1921 = !_1849;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = _1701 * _1909;
    int _1927 = _1925 + _1386;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1931 = _1929 != 0;
    int _1933 = _1917 * _1817;
    int _1935 = _1933 + _1420;
    int _1937 = ~_1779;
    int _1939 = _1937 + _1923;
    int _1941 = _1939 + 1;
    float _1943 = trunc(_1875);
    int _1945 = int(_1943);
    bool _1947 = !_1931;
    int _1949 = _1947 ? 0 : 1;
    bool _1951 = uint(_1927) >= uint(_1338);
    bool _1953 = uint(_1935) >= uint(_1304);
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1957 = _1955 != 0;
    float _1959 = trunc(_1829);
    int _1961 = int(_1959);
    bool _1963 = !_1881;
    int _1965 = _1963 ? 0 : (-1);
    int _1967 = abs(_1949);
    int _1969 = ~_1769;
    int _1971 = _1969 + _1965;
    int _1973 = _1971 + 1;
    bool _1975 = !_1951;
    int _1977 = _1975 ? 0 : (-1);
    float _1979 = trunc(_1877);
    int _1981 = int(_1979);
    bool _1983 = !_1953;
    int _1985 = _1983 ? 0 : (-1);
    int _1987 = _1913 * _1967;
    int _1989 = _1987 + _1430;
    bool _1991 = !_1957;
    int _1993 = _1991 ? 0 : 1;
    int _1995 = _1318 * _1941;
    int _1997 = _1995 + _1430;
    int _1999 = ~_1817;
    int _2001 = _1999 + _1985;
    int _2003 = _2001 + 1;
    int _2005 = ~_1909;
    int _2007 = _2005 + _1977;
    int _2009 = _2007 + 1;
    float _2011 = trunc(_1883);
    int _2013 = int(_2011);
    int _2015 = abs(_1993);
    int _2017 = _1304 * _2003;
    int _2019 = _2017 + _1420;
    int _2021 = ~_1887;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    int _2027 = _1324 * _1973;
    int _2029 = _2027 + _1380;
    bool _2031 = !_1905;
    int _2033 = _2031 ? _1997 : (-1);
    int _2035 = _1338 * _2009;
    int _2037 = _2035 + _1386;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2041 = _2039 != 0;
    float _2043 = trunc(_1755);
    int _2045 = int(_2043);
    int _2047 = _1981 * _2015;
    int _2049 = _2047 + _1420;
    int _2051 = _2033 * _2025;
    bool _2053 = !_2041;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = _1318 + (-1);
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2061 = _2059 != 0;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2065 = _2063 != 0;
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2069 = _2067 != 0;
    float _2071 = trunc(_1901);
    int _2073 = int(_2071);
    int _2075 = abs(_2055);
    int _2077 = _1887 * _2057;
    int _2079 = _2077 + _2051;
    bool _2081 = _1304 == 0;
    bool _2083 = !_2065;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _2045 * _2075;
    int _2089 = _2087 + _1380;
    bool _2091 = !_2061;
    int _2093 = _2091 ? 0 : 1;
    float _2095 = trunc(_1889);
    int _2097 = int(_2095);
    bool _2099 = _1324 == 0;
    int _2101 = abs(_2085);
    int _2103 = ~_1945;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    bool _2109 = !_2081;
    int _2111 = _2109 ? _2019 : (-1);
    int _2113 = _2079 * _2101;
    int _2115 = abs(_2093);
    float _2117 = in.m_73.y;
    int _2119 = ~_1961;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    int _2125 = _2107 * _2111;
    bool _2127 = !_2099;
    int _2129 = _2127 ? _2029 : (-1);
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2133 = _2131 != 0;
    int _2135 = _2123 * _2129;
    bool _2137 = !_2069;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = _2013 * _2115;
    int _2143 = _2141 + _2113;
    bool _2145 = !_2133;
    int _2147 = _2145 ? 0 : 1;
    int _2149 = abs(_2139);
    int _2151 = abs(_2147);
    bool _2153 = _1338 == 0;
    int _2155 = _1304 + (-1);
    int _2157 = _1989 * _2149;
    int _2159 = _2157 + _2143;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2167 = _2165 != 0;
    int _2169 = ~_2073;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    int _2175 = _1913 * _2151;
    int _2177 = _2175 + _2159;
    bool _2179 = !_2153;
    int _2181 = _2179 ? _2037 : (-1);
    int _2183 = _1945 * _2155;
    int _2185 = _2183 + _2125;
    bool _2187 = !_2167;
    int _2189 = _2187 ? 0 : 1;
    float _2191 = trunc(_1903);
    int _2193 = int(_2191);
    float _2195 = float(uint(_2177));
    int _2197 = _2173 * _2181;
    int _2199 = abs(_2189);
    int _2201 = _1324 + (-1);
    float _2203 = as_type<float>(_1432) * _2195;
    bool _2205 = !_2163;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2211 = _2209 != 0;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2215 = _2213 != 0;
    int _2217 = _1961 * _2201;
    int _2219 = _2217 + _2135;
    int _2221 = abs(_2207);
    int _2223 = _2185 * _2199;
    float _2225 = trunc(_2203);
    float _2227 = precise::max(_2225, 0.0);
    uint _2229 = uint(_2227);
    bool _2231 = !_2211;
    int _2233 = _2231 ? 0 : 1;
    int _2235 = _2193 * _2221;
    int _2237 = _2235 + _2223;
    int _2239 = _1338 + (-1);
    int _2241 = abs(_2233);
    int _2243 = ~_1318;
    int _2245 = _2243 + 1;
    int _2247 = _2073 * _2239;
    int _2249 = _2247 + _2197;
    bool _2251 = !_2215;
    int _2253 = _2251 ? 0 : 1;
    int _2255 = _2049 * _2241;
    int _2257 = _2255 + _2237;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2265 = _2263 != 0;
    float _2267 = trunc(_1907);
    int _2269 = int(_2267);
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2273 = _2271 != 0;
    int _2275 = _2245 * int(_2229);
    int _2277 = _2275 + _2177;
    int _2279 = abs(_2253);
    bool _2281 = !_2265;
    int _2283 = _2281 ? 0 : 1;
    bool _2285 = !_2273;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2291 = _2289 != 0;
    int _2293 = _1981 * _2279;
    int _2295 = _2293 + _2257;
    float _2297 = float(uint(_2277));
    int _2299 = abs(_2283);
    float _2301 = trunc(_1919);
    int _2303 = int(_2301);
    bool _2305 = !_2291;
    int _2307 = _2305 ? 0 : 1;
    float _2309 = as_type<float>(_1432) * _2297;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2313 = _2311 != 0;
    int _2315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2317 = _2315 != 0;
    int _2319 = _2219 * _2299;
    int _2321 = abs(_2307);
    bool _2323 = !_2261;
    int _2325 = _2323 ? 0 : 1;
    float _2327 = trunc(_2309);
    float _2329 = precise::max(_2327, 0.0);
    uint _2331 = uint(_2329);
    int _2333 = abs(_2287);
    float _2335 = float(uint(_2295));
    bool _2337 = !_2317;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = abs(_2325);
    float _2343 = as_type<float>(_1364) * _2335;
    int _2345 = abs(_2339);
    float _2347 = trunc(_2343);
    float _2349 = precise::max(_2347, 0.0);
    uint _2351 = uint(_2349);
    int _2353 = _2269 * _2341;
    int _2355 = _2353 + _2319;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2359 = _2357 != 0;
    int _2361 = _2303 * _2321;
    int _2363 = _2361 + _1386;
    int _2365 = int(_2229) + int(_2331);
    int _2367 = _2249 * _2345;
    int _2369 = ~_1304;
    int _2371 = _2369 + 1;
    int _2373 = _2089 * _2333;
    int _2375 = _2373 + _2355;
    bool _2377 = !_2313;
    int _2379 = _2377 ? 0 : 1;
    bool _2381 = !_2359;
    int _2383 = _2381 ? 0 : 1;
    int _2385 = abs(_2379);
    int _2387 = _2371 * int(_2351);
    int _2389 = _2387 + _2295;
    int _2391 = ~_1318;
    int _2393 = _2391 + 1;
    int _2395 = abs(_2383);
    int _2397 = _2097 * _2385;
    int _2399 = _2397 + _2367;
    int _2401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2403 = _2401 != 0;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2407 = _2405 != 0;
    float _2409 = float(uint(_2389));
    int _2411 = _2045 * _2395;
    int _2413 = _2411 + _2375;
    bool _2415 = !_2403;
    int _2417 = _2415 ? 0 : 1;
    float _2419 = as_type<float>(_1364) * _2409;
    bool _2421 = !_2407;
    int _2423 = _2421 ? 0 : 1;
    int _2425 = _2393 * _2365;
    int _2427 = _2425 + _2177;
    float _2429 = float(uint(_2413));
    int _2431 = abs(_2417);
    float _2433 = trunc(_2419);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    bool _2439 = uint(_2427) >= uint(_1318);
    float _2441 = as_type<float>(_1382) * _2429;
    int _2443 = abs(_2423);
    bool _2445 = !_2439;
    int _2447 = _2445 ? 0 : (-1);
    float _2449 = trunc(_2441);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2457 = _2455 != 0;
    int _2459 = _2363 * _2431;
    int _2461 = _2459 + _2399;
    int _2463 = ~_2365;
    int _2465 = _2463 + _2447;
    int _2467 = _2465 + 1;
    bool _2469 = _1318 == 0;
    int _2471 = _2303 * _2443;
    int _2473 = _2471 + _2461;
    int _2475 = ~_1324;
    int _2477 = _2475 + 1;
    int _2479 = _1318 * _2467;
    int _2481 = _2479 + _2177;
    bool _2483 = _1422 > 0.5;
    float _2485 = in.m_63.w;
    float _2487 = float(uint(_2473));
    bool _2489 = !_2469;
    int _2491 = _2489 ? _2481 : (-1);
    int _2493 = _2385;
    if (_2457)
    {
        float _2495 = -_1368;
        float _2497 = _2495 + 1.0;
        _2493 = as_type<int>(_2497);
    }
    int _2499 = _2493;
    int _2501 = int(_2351) + int(_2437);
    float _2503 = as_type<float>(_1388) * _2487;
    int _2505 = _2491 & 3;
    bool _2507 = _2505 != 0;
    int _2509 = _2477 * int(_2453);
    int _2511 = _2509 + _2413;
    if (_2457)
    {
        float _2513 = _2483 ? as_type<float>(_2499) : _1368;
        _1396 = _2513;
    }
    float _2515 = _1396;
    float _2517 = trunc(_2503);
    float _2519 = precise::max(_2517, 0.0);
    uint _2521 = uint(_2519);
    int _2523 = ~_1304;
    int _2525 = _2523 + 1;
    float _2527 = -_2117;
    float _2529 = _2527 + 1.0;
    bool _2531 = uint(_2505) > 1u;
    float _2533 = float(uint(_2511));
    int _2535 = _2525 * _2501;
    int _2537 = _2535 + _2295;
    int _2539 = _2491 & 3;
    bool _2541 = _2539 != 0;
    int _2543 = _2483 ? as_type<int>(_2529) : as_type<int>(_2117);
    float _2545 = as_type<float>(_1382) * _2533;
    int _2547 = _2541 ? 0 : 1;
    bool _2549 = uint(_2537) >= uint(_1304);
    float _2551 = trunc(_2545);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = ~_1338;
    int _2559 = _2557 + 1;
    int _2561 = ~_2547;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2565;
    if (!_2531)
    {
        int _2569 = ~_2547;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    int _2575 = _2559 * int(_2521);
    int _2577 = _2575 + _2473;
    bool _2579 = !_2549;
    int _2581 = _2579 ? 0 : (-1);
    bool _2583 = _2505 != 3;
    int _2585 = ~_2501;
    int _2587 = _2585 + _2581;
    int _2589 = _2587 + 1;
    float _2591 = float(uint(_2577));
    bool _2593 = uint(_2505) >= 2u;
    int _2595 = _1304 * _2589;
    int _2597 = _2595 + _2295;
    bool _2599 = _1304 == 0;
    float _2601 = as_type<float>(_1388) * _2591;
    int _2603 = _2593 ? 0 : 1;
    bool _2605 = _2485 > 0.5;
    int _2607 = ~_1324;
    int _2609 = _2607 + 1;
    float _2611 = trunc(_2601);
    float _2613 = precise::max(_2611, 0.0);
    uint _2615 = uint(_2613);
    int _2617 = int(_2453) + int(_2555);
    bool _2619 = !_2599;
    int _2621 = _2619 ? _2597 : (-1);
    int _2623 = ~_2603;
    int _2625 = _2623 + 1;
    int _2627 = _2625 + 1;
    int _2629 = _2609 * _2617;
    int _2631 = _2629 + _2413;
    int _2633 = _2627;
    if (_2583)
    {
        int _2635 = ~_2603;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    int _2641 = _2605 ? as_type<int>(_2529) : as_type<int>(_2117);
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2645 = _2643 != 0;
    int _2647 = _2621 & 3;
    bool _2649 = _2647 != 0;
    bool _2651 = !_2645;
    int _2653 = _2651 ? 0 : 1;
    bool _2655 = uint(_2647) >= 2u;
    int _2657 = _2649 ? 0 : 1;
    bool _2659 = uint(_2631) >= uint(_1324);
    int _2661 = _2655 ? 0 : 1;
    bool _2663 = _2647 != 3;
    bool _2665 = !_2659;
    int _2667 = _2665 ? 0 : (-1);
    int _2669 = ~_1338;
    int _2671 = _2669 + 1;
    bool _2673 = uint(_2647) > 1u;
    int _2675 = ~_2617;
    int _2677 = _2675 + _2667;
    int _2679 = _2677 + 1;
    int _2681 = int(_2521) + int(_2615);
    int _2683 = _1324 * _2679;
    int _2685 = _2683 + _2413;
    bool _2687 = _1324 == 0;
    int _2689 = ~_2661;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2671 * _2681;
    int _2697 = _2695 + _2473;
    int _2699 = _2693;
    if (_2663)
    {
        int _2701 = ~_2661;
        int _2703 = _2701 + 1;
        _2699 = _2703;
    }
    int _2705 = _2699;
    int _2707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2709 = _2707 != 0;
    int _2711 = ~_2657;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    bool _2717 = !_2687;
    int _2719 = _2717 ? _2685 : (-1);
    int _2721 = _2715;
    if (!_2673)
    {
        int _2723 = ~_2657;
        int _2725 = _2723 + 1;
        _2721 = _2725;
    }
    int _2727 = _2721;
    bool _2729 = uint(_2697) >= uint(_1338);
    bool _2731 = !_2709;
    int _2733 = _2731 ? 0 : 1;
    int _2735 = _2719 & 3;
    bool _2737 = _2735 != 0;
    bool _2739 = !_2729;
    int _2741 = _2739 ? 0 : (-1);
    int _2743 = _2737 ? 0 : 1;
    bool _2745 = uint(_2735) >= 2u;
    bool _2747 = _2735 != 3;
    int _2749 = ~_2681;
    int _2751 = _2749 + _2741;
    int _2753 = _2751 + 1;
    int _2755 = _2745 ? 0 : 1;
    bool _2757 = uint(_2735) > 1u;
    int _2759 = _1338 * _2753;
    int _2761 = _2759 + _2473;
    bool _2763 = _1338 == 0;
    int _2765 = ~_2755;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    bool _2771 = !_2763;
    int _2773 = _2771 ? _2761 : (-1);
    int _2775 = _2769;
    if (_2747)
    {
        int _2777 = ~_2755;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    int _2783 = _2773 & 3;
    bool _2785 = _2783 != 0;
    int _2787 = ~_2743;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = _2791;
    if (!_2757)
    {
        int _2795 = ~_2743;
        int _2797 = _2795 + 1;
        _2793 = _2797;
    }
    int _2799 = _2793;
    bool _2801 = uint(_2783) >= 2u;
    int _2803 = _2785 ? 0 : 1;
    int _2805 = _2801 ? 0 : 1;
    bool _2807 = _2783 != 3;
    bool _2809 = uint(_2783) > 1u;
    int _2811 = ~_2805;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = ~_2803;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    float _2823 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2825 = _2823 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2827 = _2815;
    int _2829 = _2821;
    if (_2807)
    {
        int _2831 = ~_2805;
        int _2833 = _2831 + 1;
        _2827 = _2833;
    }
    int _2835 = _2827;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2809)
    {
        int _2841 = ~_2803;
        int _2843 = _2841 + 1;
        _2829 = _2843;
    }
    int _2845 = _2829;
    float _2847 = 1.0 / _2825;
    float _2849 = in.m_48.x;
    float _2851 = in.m_48.y;
    float _2853 = in.m_48.z;
    int _2855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2857 = _2855 != 0;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2861 = _2859 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2865 = _2863 != 0;
    bool _2867 = !_2857;
    int _2869 = _2867 ? 0 : 1;
    float _2871 = _2865 ? as_type<float>(_2543) : _2117;
    float _2873 = 1.0 / _2839;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2877 = _2875 != 0;
    bool _2879 = _1581 > 0.5;
    float _2881 = _2877 ? as_type<float>(_2641) : _2117;
    int _2883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2885 = _2883 != 0;
    float _2887 = 1.0 / _2861;
    int _2889 = _2879 ? as_type<int>(_2529) : as_type<int>(_2117);
    int _2891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2893 = _2891 != 0;
    float _2895 = _2885 ? as_type<float>(_2889) : _2117;
    float _2897 = _2893 ? as_type<float>(_2889) : _2117;
    float _2899 = _198 * _2851;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2903 = _2901 != 0;
    int _2905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2907 = _2905 != 0;
    float _2909 = _204 * _2851;
    int _2911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2913 = _2911 != 0;
    float _2915 = _210 * _2851;
    float _2917 = fma(_196, _2849, _2899);
    float _2919 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2921 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2923 = _2921 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2925 = fma(_202, _2849, _2909);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2929 = fma(_208, _2849, _2915);
    float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2935 = fma(_200, _2853, _2917);
    float _2937 = fma(_2919, -2.0, _2927);
    float _2939 = _1571 * 2.0;
    float _2941 = 1.0 / _2933;
    float _2943 = fma(_206, _2853, _2925);
    float _2945 = fma(_212, _2853, _2929);
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2949 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2947;
    float _2951 = floor(_2939);
    float _2953 = _2903 ? as_type<float>(_2889) : _2117;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2959 = _2907 ? as_type<float>(_2889) : _2117;
    float _2961 = _2949 * _2847;
    bool _2963 = !_2913;
    int _2965 = _2963 ? 0 : 1;
    float _2967 = _2935 + _1713;
    float _2969 = float(uint(_2049));
    float _2971 = 1.0 / _2923;
    float _2973 = float(uint(_2089));
    float _2975 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2937);
    int _2977 = ~_1304;
    int _2979 = _2977 + 1;
    float _2981 = float(uint(_2363));
    float _2983 = as_type<float>(_1382) * _2973;
    bool _2985 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2987 = isnan(_1232);
    bool _2989 = _2985 || _2987;
    bool _2991 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2993 = _2989 || _2991;
    float _2995 = float(_2993);
    float _2997 = 1.0 / _2957;
    float _2999 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3001 = _2999 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3003;
    bool _3007 = _2951 > 0.0;
    float _3009 = as_type<float>(_1388) * _2981;
    float _3011 = _3001 * _2873;
    float _3013 = _3005 * _2887;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3017 = _3015 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3019 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3021 = _3019 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _3023 = _2951 >= 0.0;
    bool _3025 = isnan(_2951);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan(0.0);
    bool _3031 = _3027 || _3029;
    float _3033 = 1.0 / _3017;
    float _3035 = _3021 * _2941;
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3037;
    int _3041 = _3031 ? 0 : 1;
    float _3043 = fma(_3013, _1717, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3045 = _3039 * _2971;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3049 = _3047 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3051 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3051;
    float _3055 = _1422 * 2.0;
    float _3057 = float(uint(_1989));
    float _3059 = _3049 * _2997;
    int _3061 = ~_3041;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    float _3067 = floor(_3055);
    int _3069 = _3065;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3073 = _2873;
    float _3075 = _2997;
    if (!_3007)
    {
        int _3077 = ~_3041;
        int _3079 = _3077 + 1;
        _3069 = _3079;
    }
    int _3081 = _3069;
    float _3083 = _3053 * _3033;
    bool _3085 = !_1703;
    float _3087 = _3085 ? as_type<float>(_1583) : as_type<float>(_1585);
    float _3089 = as_type<float>(_1432) * _3057;
    float _3091 = _3033;
    if (!_1703)
    {
        _3071 = _1422;
    }
    float _3093 = _3071;
    float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3097 = _1232 + _3095;
    float _3099 = _3093;
    if (!_1703)
    {
        _3073 = _1422;
    }
    float _3101 = _3073;
    float _3103 = trunc(_3089);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    float _3109 = _3101;
    if (!_1703)
    {
        _3075 = _1581;
    }
    float _3111 = _3075;
    float _3113 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3115 = _1232 + _3113;
    float _3117 = _3111;
    if (!_1703)
    {
        _3091 = _1581;
    }
    float _3119 = _3091;
    bool _3121 = _1587 != 2;
    bool _3123 = !_1703;
    float _3125 = _3123 ? as_type<float>(_1585) : as_type<float>(_1589);
    float _3127 = fma(_3011, _3115, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3129 = _3119;
    float _3131 = _3127;
    if (_1703)
    {
        _3099 = _1571;
    }
    float _3133 = _3099;
    float _3135 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3137 = _1232 + _3135;
    if (_1703)
    {
        _3109 = _1571;
    }
    float _3139 = _3109;
    float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3143 = _1232 + _3141;
    if (_1703)
    {
        _3117 = _1422;
    }
    float _3145 = _3117;
    float _3147 = _3133 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1703)
    {
        _3129 = _1422;
    }
    float _3149 = _3129;
    bool _3151 = _3067 > 0.0;
    int _3153 = _1721 * int(_3107);
    int _3155 = _3153 + _1989;
    bool _3157 = _3067 >= 0.0;
    bool _3159 = isnan(_3067);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan(0.0);
    bool _3165 = _3161 || _3163;
    float _3167 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3169 = _1232 + _3167;
    bool _3171 = _2783 != 3;
    float _3173 = float(uint(_3155));
    float _3175 = fma(_2961, _3169, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3179 = _1232 + _3177;
    float _3181 = as_type<float>(_1432) * _3173;
    float _3183 = fma(_3035, _3179, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3185 = fma(_3059, _3097, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3187 = fma(_3083, _3143, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3189 = _2943 + _1747;
    float _3191 = as_type<float>(_1364) * _2969;
    bool _3193 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3195 = isnan(_1232);
    bool _3197 = _3193 || _3195;
    bool _3199 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3201 = _3197 || _3199;
    float _3203 = float(_3201);
    float _3205 = fma(_3045, _3137, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _3207 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3209 = isnan(_1232);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = trunc(_3181);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    bool _3225 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3227 = isnan(_1232);
    bool _3229 = _3225 || _3227;
    bool _3231 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3233 = _3229 || _3231;
    float _3235 = float(_3233);
    float _3237 = -_3203;
    float _3239 = _3237 + 1.0;
    bool _3241 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3243 = isnan(_1232);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3249 = _3245 || _3247;
    float _3251 = float(_3249);
    float _3253 = -_3217;
    float _3255 = _3253 + 1.0;
    bool _3257 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3259 = isnan(_1232);
    bool _3261 = _3257 || _3259;
    bool _3263 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3265 = _3261 || _3263;
    float _3267 = float(_3265);
    float _3269 = _3217 * _3239;
    bool _3271 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3273 = isnan(_1232);
    bool _3275 = _3271 || _3273;
    bool _3277 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3279 = _3275 || _3277;
    float _3281 = float(_3279);
    float _3283 = trunc(_3191);
    float _3285 = precise::max(_3283, 0.0);
    uint _3287 = uint(_3285);
    float _3289 = _3235 * _3255;
    float _3291 = -_3235;
    float _3293 = _3291 + 1.0;
    bool _3295 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3297 = isnan(_1232);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3303 = _3299 || _3301;
    float _3305 = float(_3303);
    float _3307 = -_3281;
    float _3309 = _3307 + 1.0;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3313 = _3281 * _3293;
    int _3315 = abs(_2799);
    float _3317 = trunc(_2983);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = _2995 * _3309;
    float _3325 = -_2995;
    float _3327 = _3325 + 1.0;
    int _3329 = ~_3315;
    int _3331 = _3329 + 1;
    int _3333 = _3331 + 1;
    int _3335 = abs(_2781);
    float _3337 = _3251 * _3327;
    float _3339 = -_3251;
    float _3341 = _3339 + 1.0;
    int _3343 = _2979 * int(_3287);
    int _3345 = _3343 + _2049;
    int _3347 = ~_1338;
    int _3349 = _3347 + 1;
    int _3351 = ~_1324;
    int _3353 = _3351 + 1;
    float _3355 = _3267 * _3341;
    float _3357 = float(uint(_3345));
    float _3359 = trunc(_3009);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    int _3365 = _3353 * int(_3321);
    int _3367 = _3365 + _2089;
    int _3369 = ~_3335;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    float _3375 = as_type<float>(_1364) * _3357;
    float _3377 = -_3267;
    float _3379 = _3377 + 1.0;
    int _3381 = abs(_2965);
    float _3383 = float(uint(_3367));
    float _3385 = _3305 * _3379;
    float _3387 = trunc(_3375);
    float _3389 = precise::max(_3387, 0.0);
    uint _3391 = uint(_3389);
    float _3393 = -_3305;
    float _3395 = _3393 + 1.0;
    float _3397 = _3175 * _3385;
    float _3399 = as_type<float>(_1382) * _3383;
    int _3401 = _3165 ? 0 : 1;
    int _3403 = _3349 * int(_3363);
    int _3405 = _3403 + _2363;
    float _3407 = fma(_3395, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3397);
    float _3409 = trunc(_3399);
    float _3411 = precise::max(_3409, 0.0);
    uint _3413 = uint(_3411);
    int _3415 = ~_1318;
    int _3417 = _3415 + 1;
    float _3419 = float(uint(_3405));
    float _3421 = _2945 + _1761;
    int _3423 = int(_3107) + int(_3223);
    float _3425 = fma(_3127, _3355, _3407);
    int _3427 = ~_1304;
    int _3429 = _3427 + 1;
    float _3431 = as_type<float>(_1388) * _3419;
    int _3433 = int(_3287) + int(_3391);
    int _3435 = _3417 * _3423;
    int _3437 = _3435 + _1989;
    float _3439 = fma(_3043, _3337, _3425);
    int _3441 = ~_3401;
    int _3443 = _3441 + 1;
    int _3445 = _3443 + 1;
    float _3447 = trunc(_3431);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = _3445;
    float _3455 = as_type<float>(_3423);
    float _3457 = _3425;
    if (!_3151)
    {
        int _3459 = ~_3401;
        int _3461 = _3459 + 1;
        _3453 = _3461;
    }
    int _3463 = _3453;
    float _3465 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3467 = _3189 + _3465;
    bool _3469 = uint(_3437) >= uint(_1318);
    int _3471 = _3429 * _3433;
    int _3473 = _3471 + _2049;
    int _3475 = int(_3321) + int(_3413);
    float _3477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3479 = _2967 + _3477;
    int _3481 = ~_1324;
    int _3483 = _3481 + 1;
    float _3485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _3487 = !_3469;
    int _3489 = _3487 ? 0 : (-1);
    float _3491 = fma(_3183, _3323, _3439);
    int _3493 = ~_1338;
    int _3495 = _3493 + 1;
    int _3497 = _3483 * _3475;
    int _3499 = _3497 + _2089;
    bool _3501 = uint(_3473) >= uint(_1304);
    float _3503 = _3467 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3505 = fma(_3205, _3313, _3491);
    int _3507 = int(_3363) + int(_3451);
    float _3509 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3511 = !_3501;
    int _3513 = _3511 ? 0 : (-1);
    float _3515 = fma(_3479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3503);
    bool _3517 = uint(_3499) >= uint(_1324);
    int _3519 = _3495 * _3507;
    int _3521 = _3519 + _2363;
    float _3523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3525 = _3421 + _3523;
    float _3527 = _3485 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3529 = !_3517;
    int _3531 = _3529 ? 0 : (-1);
    float _3533 = fma(_3525, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3515);
    bool _3535 = uint(_3521) >= uint(_1338);
    float _3537 = _1581 * 2.0;
    float _3539 = fma(_3527, _1469, -0.5);
    bool _3541 = !_3535;
    int _3543 = _3541 ? 0 : (-1);
    bool _3545 = _3533 >= 0.0;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3549 = floor(_3537);
    float _3551 = -_3547;
    float _3553 = fma(_3509, 2.0, _3551);
    float _3555 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3557 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3559 = _1422 + _1571;
    float _3561 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3563 = fma(as_type<float>(_1589), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3555);
    float _3565 = as_type<float>(_1589) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3567 = fma(as_type<float>(_1585), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3557);
    float _3569 = as_type<float>(_1585) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3571 = ~_3423;
    int _3573 = _3571 + _3489;
    int _3575 = _3573 + 1;
    float _3577 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3563);
    float _3579 = fma(_3569, -2.0, _3561);
    if (_3545)
    {
        _3455 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3581 = _3455;
    float _3583 = _3559 + (-1.0);
    float _3585 = fma(_3185, _3289, _3505);
    bool _3587 = _3549 >= 0.0;
    bool _3589 = isnan(_3549);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan(0.0);
    bool _3595 = _3591 || _3593;
    int _3597 = as_type<int>(_3581);
    if (_3545)
    {
        float _3599 = _3581 * 5.0;
        _3597 = as_type<int>(_3599);
    }
    int _3601 = _3597;
    int _3603 = _1318 * _3575;
    int _3605 = _3603 + _1989;
    float _3607 = fma(_3187, _3269, _3585);
    if (_3545)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12035 = as_type<float>(_3601);
        out.gl_Position.z = _12035;
    }
    if (_3121)
    {
        _3131 = _1571;
    }
    float _3609 = _3131;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3613 = _3609;
    if (_3121)
    {
        _3457 = _1422;
    }
    float _3615 = _3457;
    float _3617 = fma(_3203, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3607);
    float _3619 = _3615;
    if (!_3121)
    {
        _3613 = _1581;
    }
    float _3621 = _3613;
    float _3623 = -_3611;
    float _3625 = fma(_3565, 2.0, _3623);
    if (!_3121)
    {
        _3619 = _1571;
    }
    float _3627 = _3619;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3631 = _3549 > 0.0;
    out.m_75.x = _3617;
    float _3633 = _3467 * _3467;
    float _3635 = fma(_3149, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3629);
    bool _3637 = !_2507;
    int _3639 = _3637 ? 0 : 1;
    float _3641 = fma(_3479, _3479, _3633);
    float _3643 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3645 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    int _3647 = _2621 & 3;
    bool _3649 = _3647 != 0;
    float _3651 = fma(_3525, _3525, _3641);
    int _3653 = _2621 >> 31;
    float _3655 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3645);
    float _3657 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3659 = rsqrt(_3651);
    bool _3661 = !_3649;
    int _3663 = _3661 ? 0 : 1;
    float _3665 = _3627 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3667 = -_3643;
    float _3669 = fma(_3657, 2.0, _3667);
    int _3671 = _2491 >> 31;
    float _3673 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3567);
    int _3675 = _2719 & 3;
    bool _3677 = _3675 != 0;
    float _3679 = -_166;
    float _3681 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3553);
    int _3683 = _3653 & 3;
    float _3685 = -_166;
    float _3687 = fma(_3685, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3625);
    int _3689 = _3671 & 3;
    float _3691 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3579);
    int _3693 = _2719 >> 31;
    float _3695 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3635);
    int _3697 = _2491 + _3689;
    float _3699 = -_166;
    float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3669);
    int _3703 = _3693 & 3;
    float _3705 = _3467 * _3659;
    bool _3707 = !_3677;
    int _3709 = _3707 ? 0 : 1;
    float _3711 = _3479 * _3659;
    int _3713 = _3697 >> 2;
    float _3715 = -_3705;
    float _3717 = fma(_3715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3467);
    int _3719 = _2773 & 3;
    bool _3721 = _3719 != 0;
    float _3723 = -_3711;
    float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3479);
    int _3727 = _2719 + _3703;
    float _3729 = _3717 * _3717;
    int _3731 = _2773 >> 31;
    float _3733 = _3681;
    if (_3545)
    {
        out.m_51.x = 0.0;
    }
    int _3735 = _3713 << 4;
    int _3737 = _3735 + 368;
    float _3739 = fma(_3725, _3725, _3729);
    bool _3741 = !_3721;
    int _3743 = _3741 ? 0 : 1;
    bool _3745 = _2505 != 3;
    int _3747 = _2621 + _3683;
    int _3749 = _3727 >> 2;
    int _3751 = _3731 & 3;
    uint _3753 = uint(int(uint(_3737) >> uint(2)));
    uint _3755 = uint(int(uint(int(_3753)) >> uint(2)));
    int _3757 = int(_3753) & 3;
    float _3759 = (*spvDescriptorSet0.vp_c9)._m0[int(_3755)][_3757];
    int _3761 = int(_3753) + 1;
    uint _3763 = uint(int(uint(_3761) >> uint(2)));
    int _3765 = _3761 & 3;
    float _3767 = (*spvDescriptorSet0.vp_c9)._m0[int(_3763)][_3765];
    int _3769 = ~_3433;
    int _3771 = _3769 + _3513;
    int _3773 = _3771 + 1;
    bool _3775 = !_3745;
    int _3777 = _3775 ? 0 : (-1);
    bool _3779 = _2647 != 3;
    int _3781 = _1304 * _3773;
    int _3783 = _3781 + _2049;
    int _3785 = _2773 + _3751;
    float _3787 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3789 = int(_3787);
    int _3791 = _3747 >> 2;
    int _3793 = _3785 >> 2;
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3797 = !_3779;
    int _3799 = _3797 ? 0 : (-1);
    bool _3801 = _2735 != 3;
    float _3803 = -_3795;
    float _3805 = fma(_3147, 2.0, _3803);
    int _3807 = _3791 << 4;
    int _3809 = _3807 + 512;
    float _3811 = _3145 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3813 = _3793 << 4;
    int _3815 = _3813 + 800;
    float _3817 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3819 = int(_3817);
    bool _3821 = !_2469;
    int _3823 = _3821 ? _3605 : (-1);
    uint _3825 = uint(int(uint(_3809) >> uint(2)));
    uint _3827 = uint(int(uint(int(_3825)) >> uint(2)));
    int _3829 = int(_3825) & 3;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[int(_3827)][_3829];
    int _3833 = int(_3825) + 1;
    uint _3835 = uint(int(uint(_3833) >> uint(2)));
    int _3837 = _3833 & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    bool _3841 = !_2599;
    int _3843 = _3841 ? _3783 : (-1);
    float _3845 = -_166;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3805);
    bool _3849 = !_3171;
    int _3851 = _3849 ? 0 : (-1);
    int _3853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3855 = _3853 != 0;
    int _3857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3859 = _3857 != 0;
    int _3861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3863 = _3861 != 0;
    uint _3865 = uint(int(uint(_3815) >> uint(2)));
    uint _3867 = uint(int(uint(int(_3865)) >> uint(2)));
    int _3869 = int(_3865) & 3;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[int(_3867)][_3869];
    int _3873 = int(_3865) + 1;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    int _3877 = _3873 & 3;
    float _3879 = (*spvDescriptorSet0.vp_c9)._m0[int(_3875)][_3877];
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3883 = _3595 ? 0 : 1;
    float _3885 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3887 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3889 = fma(_3811, -2.0, _3881);
    float _3891 = _3621 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3893 = ~_3883;
    int _3895 = _3893 + 1;
    int _3897 = _3895 + 1;
    float _3899 = fma(_3087, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3887);
    float _3901 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3905 = _3749 << 4;
    int _3907 = _3905 + 656;
    float _3909 = -_3311;
    float _3911 = fma(_3891, 2.0, _3909);
    int _3913 = _3897;
    float _3915 = _3885;
    if (!_3631)
    {
        int _3917 = ~_3883;
        int _3919 = _3917 + 1;
        _3913 = _3919;
    }
    int _3921 = _3913;
    float _3923 = fma(_3901, -2.0, _3903);
    int _3925 = ~_3475;
    int _3927 = _3925 + _3531;
    int _3929 = _3927 + 1;
    uint _3931 = uint(int(uint(_3907) >> uint(2)));
    uint _3933 = uint(int(uint(int(_3931)) >> uint(2)));
    int _3935 = int(_3931) & 3;
    float _3937 = (*spvDescriptorSet0.vp_c9)._m0[int(_3933)][_3935];
    int _3939 = int(_3931) + 1;
    uint _3941 = uint(int(uint(_3939) >> uint(2)));
    int _3943 = _3939 & 3;
    float _3945 = (*spvDescriptorSet0.vp_c9)._m0[int(_3941)][_3943];
    int _3947 = abs(_2727);
    float _3949 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3923);
    int _3951 = _1324 * _3929;
    int _3953 = _3951 + _2089;
    int _3955 = ~_3507;
    int _3957 = _3955 + _3543;
    int _3959 = _3957 + 1;
    float _3961 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3889);
    int _3963 = abs(_3663);
    int _3965 = _3737 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    float _3983 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3985 = _1338 * _3959;
    int _3987 = _3985 + _2363;
    int _3989 = abs(_3743);
    float _3991 = -_166;
    float _3993 = fma(_3991, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3911);
    float _3995 = fma(_3665, -2.0, _3983);
    int _3997 = abs(_2573);
    int _3999 = _3809 + 8;
    uint _4001 = uint(int(uint(_3999) >> uint(2)));
    uint _4003 = uint(int(uint(int(_4001)) >> uint(2)));
    int _4005 = int(_4001) & 3;
    float _4007 = (*spvDescriptorSet0.vp_c9)._m0[int(_4003)][_4005];
    int _4009 = int(_4001) + 1;
    uint _4011 = uint(int(uint(_4009) >> uint(2)));
    int _4013 = _4009 & 3;
    float _4015 = (*spvDescriptorSet0.vp_c9)._m0[int(_4011)][_4013];
    int _4017 = ~_3947;
    int _4019 = _4017 + 1;
    int _4021 = _4019 + 1;
    float _4023 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4025 = int(_4023);
    int _4027 = ~_3997;
    int _4029 = _4027 + 1;
    int _4031 = _4029 + 1;
    float _4033 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3995);
    int _4035 = _4021 * as_type<int>(_3839);
    bool _4037 = !_3801;
    int _4039 = _4037 ? 0 : (-1);
    int _4041 = _3907 + 8;
    uint _4043 = uint(int(uint(_4041) >> uint(2)));
    uint _4045 = uint(int(uint(int(_4043)) >> uint(2)));
    int _4047 = int(_4043) & 3;
    float _4049 = (*spvDescriptorSet0.vp_c9)._m0[int(_4045)][_4047];
    int _4051 = int(_4043) + 1;
    uint _4053 = uint(int(uint(_4051) >> uint(2)));
    int _4055 = _4051 & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = _4031 * as_type<int>(_3767);
    int _4061 = abs(_3639);
    float _4063 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4065 = abs(_3709);
    int _4067 = abs(_2845);
    float _4069 = fma(_3139, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4063);
    int _4071 = _3815 + 8;
    uint _4073 = uint(int(uint(_4071) >> uint(2)));
    uint _4075 = uint(int(uint(int(_4073)) >> uint(2)));
    int _4077 = int(_4073) & 3;
    float _4079 = (*spvDescriptorSet0.vp_c9)._m0[int(_4075)][_4077];
    int _4081 = int(_4073) + 1;
    uint _4083 = uint(int(uint(_4081) >> uint(2)));
    int _4085 = _4081 & 3;
    float _4087 = (*spvDescriptorSet0.vp_c9)._m0[int(_4083)][_4085];
    float _4089 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4091 = int(_4089);
    float _4093 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4069);
    int _4095 = ~_4067;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = ~_3963;
    int _4103 = _4101 + 1;
    int _4105 = _4103 + 1;
    int _4107 = ~_3989;
    int _4109 = _4107 + 1;
    int _4111 = _4109 + 1;
    int _4113 = _4099 * as_type<int>(_3879);
    int _4115 = ~_4061;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    int _4121 = _4105 * as_type<int>(_3831);
    int _4123 = _4121 + _4035;
    int _4125 = abs(_2639);
    int _4127 = _4111 * as_type<int>(_3871);
    int _4129 = _4127 + _4113;
    int _4131 = abs(_2705);
    int _4133 = _4119 * as_type<int>(_3759);
    int _4135 = _4133 + _4059;
    int _4137 = abs(_3777);
    int _4139 = _3333 * as_type<int>(_3945);
    int _4141 = ~_4125;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    float _4147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4149 = log2(_4147);
    int _4151 = ~_4131;
    int _4153 = _4151 + 1;
    int _4155 = _4153 + 1;
    int _4157 = ~_4137;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4145 * as_type<int>(_3973);
    int _4165 = _4163 + _4135;
    int _4167 = ~_4065;
    int _4169 = _4167 + 1;
    int _4171 = _4169 + 1;
    float _4173 = float(uint(_3789));
    int _4175 = _4161 * as_type<int>(_3981);
    int _4177 = _4175 + _4165;
    int _4179 = abs(_2835);
    int _4181 = _4171 * as_type<int>(_3937);
    int _4183 = _4181 + _4139;
    int _4185 = abs(_4039);
    int _4187 = _4155 * as_type<int>(_4007);
    int _4189 = _4187 + _4123;
    int _4191 = abs(_2653);
    float _4193 = 1.0 / _4173;
    float _4195 = float(uint(_4091));
    int _4197 = ~_4191;
    int _4199 = _4197 + 1;
    int _4201 = _4199 + 1;
    int _4203 = ~_4179;
    int _4205 = _4203 + 1;
    int _4207 = _4205 + 1;
    int _4209 = _3373 * as_type<int>(_4049);
    int _4211 = _4209 + _4183;
    int _4213 = abs(_3799);
    int _4215 = _4177 * _4201;
    float _4217 = 1.0 / _4195;
    float _4219 = float(uint(_3819));
    int _4221 = _3823 * _4191;
    int _4223 = _4221 + _4215;
    int _4225 = abs(_2733);
    int _4227 = _4207 * as_type<int>(_4079);
    int _4229 = _4227 + _4129;
    int _4231 = abs(_2869);
    float _4233 = _4149 * _166;
    int _4235 = ~_4225;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = 1.0 / _4219;
    int _4243 = ~_4213;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    int _4249 = ~_4185;
    int _4251 = _4249 + 1;
    int _4253 = _4251 + 1;
    float _4255 = float(uint(_4025));
    int _4257 = _4247 * as_type<int>(_4015);
    int _4259 = _4257 + _4189;
    int _4261 = ~_4231;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    int _4267 = _4253 * as_type<int>(_4057);
    int _4269 = _4267 + _4211;
    bool _4271 = _1324 == 0;
    int _4273 = _4239 * _4259;
    int _4275 = abs(_3851);
    float _4277 = 1.0 / _4255;
    bool _4279 = !_4271;
    int _4281 = _4279 ? _3953 : (-1);
    int _4283 = _3843 * _4225;
    int _4285 = _4283 + _4273;
    int _4287 = ~_4275;
    int _4289 = _4287 + 1;
    int _4291 = _4289 + 1;
    int _4293 = _4265 * _4269;
    int _4295 = as_type<int>(_4217) + (-2);
    float _4297 = float(uint(_4285));
    int _4299 = _4281 * _4231;
    int _4301 = _4299 + _4293;
    int _4303 = as_type<int>(_4193) + (-2);
    int _4305 = _4291 * as_type<int>(_4087);
    int _4307 = _4305 + _4229;
    float _4309 = float(uint(_4223));
    float _4311 = as_type<float>(_4295) * _4297;
    float _4313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4315 = as_type<int>(_4241) + (-2);
    float _4317 = as_type<float>(_4303) * _4309;
    float _4319 = float(uint(_4301));
    int _4321 = ~_3381;
    int _4323 = _4321 + 1;
    int _4325 = _4323 + 1;
    bool _4327 = _1338 == 0;
    float _4329 = trunc(_4317);
    float _4331 = precise::max(_4329, 0.0);
    uint _4333 = uint(_4331);
    int _4335 = as_type<int>(_4277) + (-2);
    float _4337 = as_type<float>(_4315) * _4319;
    bool _4339 = !_4327;
    int _4341 = _4339 ? _3987 : (-1);
    int _4343 = _4325 * _4307;
    int _4345 = ~_3789;
    int _4347 = _4345 + 1;
    int _4349 = ~_3819;
    int _4351 = _4349 + 1;
    float _4353 = trunc(_4311);
    float _4355 = precise::max(_4353, 0.0);
    uint _4357 = uint(_4355);
    int _4359 = _4341 * _3381;
    int _4361 = _4359 + _4343;
    float _4363 = _4313 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4365 = abs(_3789);
    float _4367 = _3525 * _3659;
    float _4369 = float(uint(_4361));
    float _4371 = fma(_4363, _2953, -0.5);
    float _4373 = trunc(_4337);
    float _4375 = precise::max(_4373, 0.0);
    uint _4377 = uint(_4375);
    int _4379 = ~_4091;
    int _4381 = _4379 + 1;
    int _4383 = _4347 * int(_4333);
    int _4385 = _4383 + _4223;
    float _4387 = as_type<float>(_4335) * _4369;
    float _4389 = float(uint(_4365));
    float _4391 = -_4367;
    float _4393 = fma(_4391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3525);
    int _4395 = abs(_3819);
    int _4397 = _4381 * int(_4357);
    int _4399 = _4397 + _4285;
    float _4401 = trunc(_4387);
    float _4403 = precise::max(_4401, 0.0);
    uint _4405 = uint(_4403);
    float _4407 = float(uint(_4385));
    float _4409 = fma(_4393, _4393, _3739);
    int _4411 = ~_4025;
    int _4413 = _4411 + 1;
    float _4415 = float(uint(_4399));
    float _4417 = as_type<float>(_4303) * _4407;
    int _4419 = _4351 * int(_4377);
    int _4421 = _4419 + _4301;
    float _4423 = 1.0 / _4389;
    int _4425 = abs(_4091);
    float _4427 = as_type<float>(_4295) * _4415;
    float _4429 = float(uint(_4395));
    float _4431 = float(uint(_4421));
    float _4433 = float(uint(_4425));
    int _4435 = _4413 * int(_4405);
    int _4437 = _4435 + _4361;
    int _4439 = abs(_4025);
    float _4441 = as_type<float>(_4315) * _4431;
    float _4443 = 1.0 / _4433;
    int _4445 = as_type<int>(_4423) + (-2);
    float _4447 = float(uint(_4439));
    float _4449 = 1.0 / _4429;
    int _4451 = abs(_4223);
    float _4453 = float(uint(_4437));
    float _4455 = float(uint(_4451));
    int _4457 = abs(_4301);
    float _4459 = 1.0 / _4447;
    float _4461 = as_type<float>(_4335) * _4453;
    float _4463 = as_type<float>(_4445) * _4455;
    float _4465 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4467 = abs(_4285);
    float _4469 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4465);
    float _4471 = exp2(_4233);
    int _4473 = as_type<int>(_4449) + (-2);
    float _4475 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4469);
    float _4477 = float(uint(_4457));
    int _4479 = as_type<int>(_4443) + (-2);
    float _4481 = float(uint(_4467));
    float _4483 = trunc(_4463);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    bool _4489 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4491 = isnan(1.0);
    bool _4493 = _4489 || _4491;
    bool _4495 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4497 = _4493 || _4495;
    float _4499 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4501 = 1.0 + _4499;
    float _4503 = as_type<float>(_4473) * _4477;
    int _4505 = abs(_4361);
    float _4507 = as_type<float>(_4479) * _4481;
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4511 = as_type<int>(_4459) + (-2);
    float _4513 = 1.0 / _4501;
    float _4515 = float(uint(_4505));
    float _4517 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4519 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4509);
    float _4521 = -_4471;
    float _4523 = _4521 + 1.0;
    float _4525 = as_type<float>(_4511) * _4515;
    float _4527 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4517);
    float _4529 = trunc(_4417);
    float _4531 = precise::max(_4529, 0.0);
    uint _4533 = uint(_4531);
    float _4535 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3899);
    bool _4537 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4539 = isnan(0.0);
    bool _4541 = _4537 || _4539;
    bool _4543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4545 = _4541 || _4543;
    float _4547 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4549 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4519);
    int _4551 = ~_4365;
    int _4553 = _4551 + 1;
    float _4555 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3655);
    float _4557 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4547);
    float _4559 = trunc(_4503);
    float _4561 = precise::max(_4559, 0.0);
    uint _4563 = uint(_4561);
    float _4565 = _4545 ? _4523 : 0.0;
    int _4567 = _4553 * int(_4487);
    int _4569 = _4567 + _4451;
    int _4571 = ~_4395;
    int _4573 = _4571 + 1;
    float _4575 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4527);
    float _4577 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4557);
    float _4579 = _4367;
    if (_4497)
    {
        float _4581 = _4565 * _4513;
        _170 = _4581;
    }
    float _4583 = _170;
    int _4585 = ~_4425;
    int _4587 = _4585 + 1;
    float _4589 = trunc(_4507);
    float _4591 = precise::max(_4589, 0.0);
    uint _4593 = uint(_4591);
    int _4595 = int(_4333) + int(_4533);
    float _4597 = fma(_4555, _3539, _3701);
    int _4599 = ~_4439;
    int _4601 = _4599 + 1;
    float _4603 = -_3949;
    float _4605 = fma(_4535, _4371, _4603);
    float _4607 = float(uint(_4569));
    float _4609 = float(_3921);
    float _4611 = trunc(_4441);
    float _4613 = precise::max(_4611, 0.0);
    uint _4615 = uint(_4613);
    int _4617 = _4573 * int(_4563);
    int _4619 = _4617 + _4457;
    float _4621 = as_type<float>(_4445) * _4607;
    float _4623 = _4605 + 0.5;
    float _4625 = float(uint(_4619));
    float _4627 = trunc(_4525);
    float _4629 = precise::max(_4627, 0.0);
    uint _4631 = uint(_4629);
    int _4633 = ~_3789;
    int _4635 = _4633 + 1;
    float _4637 = as_type<float>(_4473) * _4625;
    float _4639 = trunc(_4427);
    float _4641 = precise::max(_4639, 0.0);
    uint _4643 = uint(_4641);
    float _4645 = trunc(_4461);
    float _4647 = precise::max(_4645, 0.0);
    uint _4649 = uint(_4647);
    int _4651 = _4587 * int(_4593);
    int _4653 = _4651 + _4467;
    float _4655 = float(uint(_4653));
    float _4657 = trunc(_4621);
    float _4659 = precise::max(_4657, 0.0);
    uint _4661 = uint(_4659);
    int _4663 = int(_4377) + int(_4615);
    int _4665 = _4601 * int(_4631);
    int _4667 = _4665 + _4505;
    float _4669 = as_type<float>(_4479) * _4655;
    int _4671 = int(_4357) + int(_4643);
    float _4673 = float(uint(_4667));
    float _4675 = trunc(_4669);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    int _4681 = int(_4405) + int(_4649);
    int _4683 = _4635 * _4595;
    int _4685 = _4683 + _4223;
    int _4687 = ~_4091;
    int _4689 = _4687 + 1;
    float _4691 = as_type<float>(_4511) * _4673;
    int _4693 = ~_3819;
    int _4695 = _4693 + 1;
    bool _4697 = uint(_4685) >= uint(_3789);
    float _4699 = trunc(_4637);
    float _4701 = precise::max(_4699, 0.0);
    uint _4703 = uint(_4701);
    int _4705 = ~_4025;
    int _4707 = _4705 + 1;
    int _4709 = _4689 * _4671;
    int _4711 = _4709 + _4285;
    int _4713 = int(_4487) + int(_4661);
    float _4715 = trunc(_4691);
    float _4717 = precise::max(_4715, 0.0);
    uint _4719 = uint(_4717);
    int _4721 = int(_4593) + int(_4679);
    int _4723 = _4695 * _4663;
    int _4725 = _4723 + _4301;
    bool _4727 = uint(_4711) >= uint(_4091);
    int _4729 = _4707 * _4681;
    int _4731 = _4729 + _4361;
    int _4733 = ~_4425;
    int _4735 = _4733 + 1;
    int _4737 = ~_4365;
    int _4739 = _4737 + 1;
    int _4741 = ~_4395;
    int _4743 = _4741 + 1;
    bool _4745 = !_4697;
    int _4747 = _4745 ? 0 : (-1);
    int _4749 = _4739 * _4713;
    int _4751 = _4749 + _4451;
    bool _4753 = uint(_4725) >= uint(_3819);
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4757 = int(_4563) + int(_4703);
    int _4759 = int(_4631) + int(_4719);
    bool _4761 = !_4727;
    int _4763 = _4761 ? 0 : (-1);
    int _4765 = _4735 * _4721;
    int _4767 = _4765 + _4467;
    bool _4769 = uint(_4731) >= uint(_4025);
    int _4771 = _4743 * _4757;
    int _4773 = _4771 + _4457;
    int _4775 = ~_4439;
    int _4777 = _4775 + 1;
    float _4779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4781 = !_4753;
    int _4783 = _4781 ? 0 : (-1);
    bool _4785 = uint(_4751) >= uint(_4365);
    bool _4787 = !_4769;
    int _4789 = _4787 ? 0 : (-1);
    float _4791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4793 = uint(_4767) >= uint(_4425);
    bool _4795 = !_4785;
    int _4797 = _4795 ? 0 : (-1);
    int _4799 = _4777 * _4759;
    int _4801 = _4799 + _4505;
    int _4803 = ~_4595;
    int _4805 = _4803 + _4747;
    int _4807 = _4805 + 1;
    bool _4809 = uint(_4773) >= uint(_4395);
    int _4811 = ~_4663;
    int _4813 = _4811 + _4783;
    int _4815 = _4813 + 1;
    int _4817 = _3789 * _4807;
    int _4819 = _4817 + _4223;
    bool _4821 = !_4809;
    int _4823 = _4821 ? 0 : (-1);
    bool _4825 = _3789 == 0;
    bool _4827 = !_4793;
    int _4829 = _4827 ? 0 : (-1);
    float _4831 = _4791 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4833 = uint(_4801) >= uint(_4439);
    int _4835 = _3819 * _4815;
    int _4837 = _4835 + _4301;
    bool _4839 = !_4825;
    int _4841 = _4839 ? _4819 : (-1);
    float _4843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4845 = _3819 == 0;
    float _4847 = fma(_4831, _1751, -0.5);
    int _4849 = ~_4671;
    int _4851 = _4849 + _4763;
    int _4853 = _4851 + 1;
    float _4855 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _4857 = !_4845;
    int _4859 = _4857 ? _4837 : (-1);
    bool _4861 = _3789 == 0;
    int _4863 = _4091 * _4853;
    int _4865 = _4863 + _4285;
    int _4867 = _4223 ^ _3789;
    float _4869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4871 = _4285 ^ _4091;
    float _4873 = _4855 * _4779;
    uint _4875 = uint(int(uint(_4867) >> uint(31)));
    uint _4877 = uint(int(uint(_4871) >> uint(31)));
    int _4879 = ~_4681;
    int _4881 = _4879 + _4789;
    int _4883 = _4881 + 1;
    float _4885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4887 = !_4833;
    int _4889 = _4887 ? 0 : (-1);
    int _4891 = ~_4797;
    int _4893 = _4713 + _4891;
    int _4895 = _4893 + 1;
    int _4897 = _4025 * _4883;
    int _4899 = _4897 + _4361;
    int _4901 = ~int(_4875);
    int _4903 = _4901 + 1;
    bool _4905 = _4091 == 0;
    int _4907 = ~_4829;
    int _4909 = _4721 + _4907;
    int _4911 = _4909 + 1;
    float _4913 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4915 = ~int(_4877);
    int _4917 = _4915 + 1;
    int _4919 = _4895 ^ _4903;
    float _4921 = _4913 * _4843;
    bool _4923 = !_4905;
    int _4925 = _4923 ? _4865 : (-1);
    float _4927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4929 = _4025 == 0;
    int _4931 = _4911 ^ _4917;
    out.m_77.x = _4873;
    out.m_77.y = _4921;
    int _4933 = ~_4903;
    int _4935 = _4933 + _4919;
    int _4937 = _4935 + 1;
    bool _4939 = !_4929;
    int _4941 = _4939 ? _4899 : (-1);
    bool _4943 = _4091 == 0;
    int _4945 = ~_4917;
    int _4947 = _4945 + _4931;
    int _4949 = _4947 + 1;
    bool _4951 = !_4861;
    int _4953 = _4951 ? _4937 : (-1);
    float _4955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4957 = _3819 == 0;
    float _4959 = _4869 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4961 = _4301 ^ _3819;
    bool _4963 = !_4943;
    int _4965 = _4963 ? _4949 : (-1);
    float _4967 = fma(_4959, _1767, -0.5);
    bool _4969 = _4025 == 0;
    int _4971 = _4361 ^ _4025;
    float _4973 = _4927 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4975 = float(_4841);
    uint _4977 = uint(int(uint(_4971) >> uint(31)));
    float _4979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4981 = ~_4889;
    int _4983 = _4759 + _4981;
    int _4985 = _4983 + 1;
    float _4987 = fma(_4831, _4975, _3681);
    int _4989 = ~int(_4977);
    int _4991 = _4989 + 1;
    float _4993 = fma(_4973, _1803, -0.5);
    float _4995 = float(_4925);
    float _4997 = fma(_4475, _4847, _4987);
    float _4999 = float(_4859);
    float _5001 = _4755 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5003 = _4985 ^ _4991;
    float _5005 = fma(_4959, _4995, _3847);
    float _5007 = float(_4941);
    float _5009 = _4885 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5011 = fma(_4973, _4999, _3993);
    int _5013 = ~_4991;
    int _5015 = _5013 + _5003;
    int _5017 = _5015 + 1;
    float _5019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5021 = uint(int(uint(_4961) >> uint(31)));
    float _5023 = fma(_5009, _2515, -0.5);
    float _5025 = float(_4953);
    float _5027 = fma(_5009, _5007, _3687);
    bool _5029 = !_4969;
    int _5031 = _5029 ? _5017 : (-1);
    float _5033 = fma(_5001, _2871, -0.5);
    int _5035 = ~_4823;
    int _5037 = _4757 + _5035;
    int _5039 = _5037 + 1;
    float _5041 = -_2975;
    float _5043 = fma(_5001, _5025, _5041);
    int _5045 = ~int(_5021);
    int _5047 = _5045 + 1;
    float _5049 = fma(_3577, _5023, _5027);
    float _5051 = float(_4965);
    float _5053 = fma(_4093, _4967, _5005);
    float _5055 = _4955 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5057 = float(_5031);
    float _5059 = _4979 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5061 = _5039 ^ _5047;
    float _5063 = fma(_4577, _4993, _5011);
    float _5065 = fma(_5055, _2881, -0.5);
    float _5067 = -_3961;
    float _5069 = fma(_5055, _5051, _5067);
    int _5071 = ~_5047;
    int _5073 = _5071 + _5061;
    int _5075 = _5073 + 1;
    float _5077 = fma(_5059, _2897, -0.5);
    float _5079 = -_3691;
    float _5081 = fma(_5059, _5057, _5079);
    float _5083 = fma(_4549, _5033, _5043);
    bool _5085 = !_4957;
    int _5087 = _5085 ? _5075 : (-1);
    float _5089 = _5019 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5091 = fma(_3673, _5077, _5081);
    float _5093 = _5083 + 0.5;
    float _5095 = float(_5087);
    float _5097 = fma(_5089, _2895, -0.5);
    float _5099 = _5091 + 0.5;
    float _5101 = fma(_3695, _5065, _5069);
    float _5103 = in.m_79.x;
    float _5105 = in.m_79.y;
    float _5107 = in.m_79.z;
    float _5109 = -_4033;
    float _5111 = fma(_5089, _5095, _5109);
    float _5113 = _4997 + 0.5;
    float _5115 = _4597 + 0.5;
    float _5117 = _5063 + 0.5;
    float _5119 = fma(_4575, _5097, _5111);
    float _5121 = _5053 + 0.5;
    float _5123 = _5101 + 0.5;
    float _5125 = _5049 + 0.5;
    float _5127 = _5119 + 0.5;
    bool _5129 = !_3855;
    int _5131 = _5129 ? 0 : 1;
    out.m_81.x = _5115;
    out.m_81.y = _4623;
    bool _5133 = !_3859;
    int _5135 = _5133 ? 0 : 1;
    int _5137 = abs(_5131);
    out.m_83.x = _5113;
    out.m_83.y = _5093;
    out.m_83.z = _5121;
    out.m_83.w = _5123;
    int _5139 = abs(_5135);
    bool _5141 = !_3863;
    int _5143 = _5141 ? 0 : 1;
    out.m_85.x = _5117;
    out.m_85.y = _5127;
    float _5145 = float(_5137);
    out.m_87.x = _5125;
    out.m_87.y = _5099;
    if (_3545)
    {
        return out;
    }
    float _5147 = -_3705;
    float _5149 = fma(_5147, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3189);
    float _5151 = -_3711;
    float _5153 = fma(_5151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2967);
    float _5155 = _5145 * _4609;
    float _5157 = float(_3081);
    float _5159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5161 = _5149 + _5159;
    float _5163 = float(_5139);
    float _5165 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5167 = _5153 + _5165;
    float _5169 = _5155 * (-2.0);
    float _5171 = _5161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5173 = -_4367;
    float _5175 = fma(_5173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3421);
    float _5177 = _5163 * _5157;
    float _5179 = _1571 + (-0.5);
    float _5181 = fma(_5167, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5171);
    float _5183 = fma(_5169, _5103, _5103);
    float _5185 = _1422 + _1581;
    float _5187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5189 = _5175 + _5187;
    float _5191 = fma(_3885, _5169, _3885);
    float _5193 = fma(_5179, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5183);
    float _5195 = _5185 + (-1.0);
    float _5197 = _5177 * (-2.0);
    float _5199 = fma(_5189, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5181);
    float _5201 = fma(_5191, _4583, _5193);
    float _5203 = fma(_5195, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5205 = _1422 + (-0.5);
    float _5207 = fma(_5197, _5105, _5105);
    bool _5209 = _5199 >= 0.0;
    float _5211 = fma(_5203, _5197, _5203);
    int _5213 = abs(_5143);
    float _5215 = fma(_5205, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5207);
    float _5217 = _5201 * 0.15915493667125701904296875;
    float _5219 = sqrt(_4409);
    float _5221 = fma(_5211, _4583, _5215);
    float _5223 = float(_3463);
    float _5225 = _1571 + _1581;
    float _5227 = float(_5213);
    float _5229 = _5221 * 0.15915493667125701904296875;
    float _5231 = _5217 * 6.283185482025146484375;
    float _5233 = sin(_5231);
    float _5235 = _5197;
    float _5237 = _5167;
    if (_5209)
    {
        _5235 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5239 = _5235;
    float _5241 = _5227 * _5223;
    int _5243 = as_type<int>(_5239);
    if (_5209)
    {
        out.m_51.x = 0.0;
    }
    float _5245 = _5225 + (-1.0);
    if (_5209)
    {
        float _5247 = _5239 * 5.0;
        _5243 = as_type<int>(_5247);
    }
    int _5249 = _5243;
    float _5251 = _5241 * (-2.0);
    float _5253 = _5217 * 6.283185482025146484375;
    float _5255 = cos(_5253);
    if (_5209)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14453 = as_type<float>(_5249);
        out.gl_Position.z = _14453;
    }
    float _5257 = _5229 * 6.283185482025146484375;
    float _5259 = sin(_5257);
    if (_5209)
    {
        return out;
    }
    float _5261 = -_3189;
    float _5263 = _5261 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5265 = -_2967;
    float _5267 = _5265 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5269 = -_3421;
    float _5271 = _5269 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5273 = fma(_5245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5275 = _5263 * _5263;
    float _5277 = fma(_5251, _5107, _5107);
    float _5279 = _1581 + (-0.5);
    float _5281 = fma(_5273, _5251, _5273);
    float _5283 = fma(_5267, _5267, _5275);
    float _5285 = _5229 * 6.283185482025146484375;
    float _5287 = cos(_5285);
    float _5289 = fma(_5279, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5277);
    float _5291 = _3659 * _5219;
    float _5293 = fma(_5271, _5271, _5283);
    float _5295 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5297 = fma(_5281, _4583, _5289);
    float _5299 = in.m_89.x;
    float _5301 = in.m_89.y;
    float _5303 = in.m_89.z;
    float _5305 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5307 = rsqrt(_5293);
    float _5309 = _5297 * 0.15915493667125701904296875;
    float _5311 = _5233 * _5259;
    float _5313 = _5291 * _5305;
    float _5315 = _5255 * _5287;
    float _5317 = _5309 * 6.283185482025146484375;
    float _5319 = sin(_5317);
    float _5321 = _5233 * _5287;
    float _5323 = _5267 * _5307;
    float _5325 = _5271 * _5307;
    float _5327 = _5263 * _5307;
    float _5329 = _5309 * 6.283185482025146484375;
    float _5331 = cos(_5329);
    float _5333 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5335 = _5323 * _5333;
    float _5337 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5339 = _5325 * _5337;
    float _5341 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5343 = _5327 * _5341;
    float _5345 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5347 = -_5335;
    float _5349 = fma(_5325, _5345, _5347);
    float _5351 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5353 = -_5339;
    float _5355 = fma(_5327, _5351, _5353);
    float _5357 = fma(_5319, _5315, _5311);
    float _5359 = fma(_5319, _5311, _5315);
    float _5361 = _5349 * _5349;
    float _5363 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5365 = -_5343;
    float _5367 = fma(_5323, _5363, _5365);
    float _5369 = _5291 * _5295;
    float _5371 = fma(_5355, _5355, _5361);
    float _5373 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5375 = _5255 * _5259;
    float _5377 = _5287 * _5331;
    float _5379 = fma(_5367, _5367, _5371);
    float _5381 = _5291 * _5373;
    float _5383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5301);
    float _5385 = _5255 * _5331;
    float _5387 = _5233 * _5331;
    float _5389 = _5259 * _5331;
    float _5391 = rsqrt(_5379);
    float _5393 = _5383 * _5381;
    float _5395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5299);
    float _5397 = -_5375;
    float _5399 = fma(_5319, _5321, _5397);
    float _5401 = -_5321;
    float _5403 = fma(_5319, _5375, _5401);
    float _5405 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5303);
    float _5407 = _5395 * _5369;
    float _5409 = _5385 * _5393;
    float _5411 = -_5393;
    float _5413 = _5319 * _5411;
    float _5415 = _5405 * _5313;
    float _5417 = _5387 * _5393;
    float _5419 = fma(_5357, _5407, _5409);
    float _5421 = fma(_5377, _5407, _5413);
    float _5423 = fma(_5399, _5407, _5417);
    float _5425 = fma(_5403, _5415, _5419);
    float _5427 = _5355 * _5391;
    float _5429 = _5367 * _5391;
    float _5431 = _5349 * _5391;
    float _5433 = _5327 * _5427;
    float _5435 = _5323 * _5429;
    float _5437 = _5325 * _5431;
    float _5439 = -_5433;
    float _5441 = fma(_5323, _5431, _5439);
    float _5443 = fma(_5389, _5415, _5421);
    float _5445 = -_5437;
    float _5447 = fma(_5327, _5429, _5445);
    float _5449 = fma(_5359, _5415, _5423);
    float _5451 = _5441 * _5425;
    float _5453 = -_5435;
    float _5455 = fma(_5325, _5427, _5453);
    float _5457 = _5447 * _5425;
    float _5459 = fma(_5429, _5443, _5451);
    float _5461 = _5455 * _5425;
    float _5463 = fma(_5427, _5443, _5457);
    float _5465 = fma(_5325, _5449, _5459);
    float _5467 = fma(_5431, _5443, _5461);
    float _5469 = fma(_5323, _5449, _5463);
    float _5471 = _5149 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5473 = _3421 + _5465;
    float _5475 = fma(_5327, _5449, _5467);
    float _5477 = _2967 + _5469;
    float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5481 = _5473 + _5479;
    float _5483 = _3189 + _5475;
    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5487 = _5477 + _5485;
    float _5489 = _5481 * _5481;
    float _5491 = fma(_5487, _5487, _5489);
    float _5493 = fma(_5153, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5471);
    float _5495 = sqrt(_5491);
    float _5497 = fma(_5175, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5493);
    bool _5499 = _5495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5501 = _5475;
    float _5503 = _5471;
    float _5505 = _5493;
    float _5507 = _5487;
    if (!_5499)
    {
        _5501 = _5477;
    }
    float _5509 = _5501;
    float _5511 = _5509;
    if (!_5499)
    {
        _5503 = _5473;
    }
    float _5513 = _5503;
    float _5515 = _5513;
    if (!_5499)
    {
        _5505 = _5483;
    }
    float _5517 = _5505;
    bool _5519 = !_5499;
    float _5521 = _5517;
    if (!_5519)
    {
        float _5523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5525 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5527 = _5495 + _5525;
        float _5529 = rsqrt(_5491);
        float _5531 = _5527 * _5523;
        float _5533 = _5483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5535 = _5531 * 0.15915493667125701904296875;
        float _5537 = _5535 * 6.283185482025146484375;
        float _5539 = cos(_5537);
        float _5541 = _5535 * 6.283185482025146484375;
        float _5543 = sin(_5541);
        float _5545 = _5539 + (-1.0);
        float _5547 = _5545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5549 = fma(_5543, _5533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5551 = fma(_5483, _5539, _5547);
        float _5553 = _5529 * _5549;
        float _5555 = fma(_5487, _5553, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5557 = fma(_5481, _5553, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5521 = _5551;
        _5511 = _5555;
        _5515 = _5557;
    }
    float _5559 = _5521;
    float _5561 = _5511;
    float _5563 = _5515;
    float _5565 = -_3189;
    float _5567 = _5565 + _5559;
    float _5569 = -_2967;
    float _5571 = _5569 + _5561;
    float _5573 = _5497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5575 = _5149 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5577 = _5567 * _5567;
    float _5579 = -_3421;
    float _5581 = _5579 + _5563;
    float _5583 = 1.0 / _5573;
    float _5585 = fma(_5153, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5575);
    float _5587 = fma(_5571, _5571, _5577);
    float _5589 = fma(_5175, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5585);
    float _5591 = fma(_5581, _5581, _5587);
    bool _5593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5595 = isnan(0.5);
    bool _5597 = _5593 || _5595;
    bool _5599 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5601 = _5597 || _5599;
    float _5603 = _5589 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5605 = sqrt(_5591);
    bool _5607 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5609 = isnan(0.5);
    bool _5611 = _5607 || _5609;
    bool _5613 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5615 = _5611 || _5613;
    float _5617 = _5603 + _5573;
    float _5619 = _5617 * _5583;
    float _5621 = _5619 * 0.5;
    float _5623 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5625 = fma(_5621, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5623);
    float _5627 = 1.0 / _5625;
    bool _5629 = _5605 > 0.0;
    float _5631 = _5621;
    float _5633 = _5605;
    float _5635 = _5559;
    float _5637 = _5571;
    float _5639 = _5591;
    if (!_5629)
    {
        _5631 = _5561;
    }
    float _5641 = _5631;
    float _5643 = _5641;
    if (!_5629)
    {
        _5633 = _5563;
    }
    float _5645 = _5633;
    bool _5647 = !_5629;
    float _5649 = _5645;
    if (!_5647)
    {
        float _5651 = _228 * _228;
        float _5653 = fma(_224, _224, _5651);
        float _5655 = fma(_230, _230, _5653);
        float _5657 = rsqrt(_5591);
        float _5659 = sqrt(_5655);
        float _5661 = _5571 * _5657;
        float _5663 = _5567 * _5657;
        float _5665 = _5581 * _5657;
        bool _5667 = _5659 > 0.0;
        float _5669 = _5659;
        float _5671 = _5657;
        _5637 = _5663;
        _5507 = _5661;
        if (!_5667)
        {
            _5669 = _5561;
        }
        float _5673 = _5669;
        _5643 = _5673;
        if (!_5667)
        {
            _5671 = _5563;
        }
        float _5675 = _5671;
        bool _5677 = !_5667;
        _5649 = _5675;
        if (!_5677)
        {
            float _5679 = rsqrt(_5655);
            float _5681 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5683 = _228 * _5679;
            float _5685 = _224 * _5679;
            float _5687 = _230 * _5679;
            float _5689 = _5663 * _5683;
            float _5691 = fma(_5661, _5685, _5689);
            float _5693 = _5681 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5695 = fma(_5665, _5687, _5691);
            float _5697 = _5695 * _5693;
            float _5699 = fma(_228, _5697, _5559);
            float _5701 = fma(_224, _5697, _5561);
            float _5703 = fma(_230, _5697, _5563);
            _5643 = _5701;
            _5649 = _5703;
            _5635 = _5699;
            _5637 = _5691;
        }
    }
    float _5705 = _5643;
    float _5707 = _5649;
    float _5709 = _5635;
    float _5711 = _5637;
    float _5713 = _5507;
    float _5715 = -_3711;
    float _5717 = fma(_5715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5705);
    float _5719 = -_4367;
    float _5721 = fma(_5719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5707);
    float _5723 = -_3705;
    float _5725 = fma(_5723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5709);
    float _5727 = _5725;
    float _5729 = _5721;
    float _5731 = _5713;
    float _5733 = _5711;
    if (_5615)
    {
        _5639 = 1.0;
    }
    float _5735 = _5639;
    float _5737 = _5735;
    if (_5601)
    {
        _4579 = _5717;
    }
    float _5739 = _4579;
    float _5741 = _5739;
    if (!_5601)
    {
        float _5743 = _5161 * _5161;
        float _5745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5747 = -_3421;
        float _5749 = _5747 + _5707;
        float _5751 = -_3189;
        float _5753 = _5751 + _5709;
        float _5755 = fma(_5167, _5167, _5743);
        float _5757 = -_2967;
        float _5759 = _5757 + _5705;
        float _5761 = fma(_5189, _5189, _5755);
        float _5763 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5765 = sqrt(_5761);
        float _5767 = 1.0 / _5291;
        float _5769 = _5763 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5771 = precise::min(_5765, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5773 = _5771 * _5745;
        float _5775 = _5773 * _5767;
        float _5777 = _5769 * _5775;
        float _5779 = _5749 * _5775;
        float _5781 = fma(_5753, _5777, _5149);
        float _5783 = fma(_5759, _5777, _5153);
        float _5785 = fma(_5769, _5779, _5175);
        _5727 = _5781;
        _5741 = _5783;
        _5729 = _5785;
        _5237 = _5765;
    }
    float _5787 = _5727;
    float _5789 = _5741;
    float _5791 = _5729;
    float _5793 = _5237;
    float _5795 = _5793;
    if (_5615)
    {
        _5731 = 1.0;
    }
    float _5797 = _5731;
    float _5799 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5801 = _5627 * _5799;
    float _5803 = _5797;
    if (!_5615)
    {
        float _5805 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5807 = _5805 * 0.15915493667125701904296875;
        float _5809 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5811 = _5807 * 6.283185482025146484375;
        float _5813 = cos(_5811);
        float _5815 = _5809 * 0.15915493667125701904296875;
        float _5817 = _5807 * 6.283185482025146484375;
        float _5819 = sin(_5817);
        float _5821 = 1.0 / _5813;
        float _5823 = _5815 * 6.283185482025146484375;
        float _5825 = cos(_5823);
        float _5827 = _5819 * _5821;
        float _5829 = _5815 * 6.283185482025146484375;
        float _5831 = sin(_5829);
        float _5833 = _5825 * _5827;
        float _5835 = 1.0 / _5833;
        float _5837 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5839 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5837;
        float _5841 = 1.0 / _5839;
        float _5843 = _5831 * _5835;
        float _5845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5847 = fma(_5801, _5843, _5845);
        float _5849 = _5847 * _5841;
        float _5851 = precise::clamp(_5849, 0.0, 1.0);
        _5795 = _5841;
        _5737 = _5851;
    }
    float _5853 = _5795;
    float _5855 = _5737;
    float _5857 = _5853;
    if (!_5615)
    {
        float _5859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5861 = _5859 * 0.15915493667125701904296875;
        float _5863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5865 = _5861 * 6.283185482025146484375;
        float _5867 = cos(_5865);
        float _5869 = _5863 * 0.15915493667125701904296875;
        float _5871 = _5861 * 6.283185482025146484375;
        float _5873 = sin(_5871);
        float _5875 = 1.0 / _5867;
        float _5877 = _5869 * 6.283185482025146484375;
        float _5879 = cos(_5877);
        float _5881 = _5873 * _5875;
        float _5883 = _5869 * 6.283185482025146484375;
        float _5885 = sin(_5883);
        float _5887 = _5879 * _5881;
        float _5889 = 1.0 / _5887;
        float _5891 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5893 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _5891;
        float _5895 = 1.0 / _5893;
        float _5897 = _5885 * _5889;
        float _5899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5901 = fma(_5801, _5897, _5899);
        float _5903 = _5901 * _5895;
        float _5905 = precise::clamp(_5903, 0.0, 1.0);
        float _5907 = -_5905;
        float _5909 = _5907 + 1.0;
        _5857 = _5887;
        _5803 = _5909;
    }
    float _5911 = _5857;
    float _5913 = _5803;
    float _5915 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5917 = _5787 + _5915;
    float _5919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5921 = _5789 + _5919;
    float _5923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5925 = _5791 + _5923;
    float _5927 = _5917 * _5917;
    float _5929 = fma(_5921, _5921, _5927);
    float _5931 = fma(_5925, _5925, _5929);
    float _5933 = rsqrt(_5931);
    float _5935 = sqrt(_5931);
    float _5937 = _5933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5939 = _5921 * _5937;
    float _5941 = _5925 * _5937;
    float _5943 = _5939 * _5939;
    float _5945 = _5941 * _5941;
    float _5947 = _5943 + _5945;
    float _5949 = sqrt(_5947);
    bool _5951 = _5949 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5953 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5955 = _5949 + _5953;
    float _5957 = _5925;
    float _5959 = _5933;
    float _5961 = _5955;
    float _5963 = _5927;
    float _5965 = _5917;
    if (_5951)
    {
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5957 = _5967;
    }
    float _5969 = _5957;
    if (_5951)
    {
        float _5971 = rsqrt(_5947);
        _5959 = _5971;
    }
    float _5973 = _5959;
    float _5975 = _5973;
    if (_5951)
    {
        float _5977 = _5955 * _5969;
        _5961 = _5977;
    }
    float _5979 = _5961;
    if (_5951)
    {
        float _5981 = _5979 * 0.15915493667125701904296875;
        _5963 = _5981;
    }
    float _5983 = _5963;
    float _5985 = _5969;
    float _5987 = _5983;
    if (_5951)
    {
        float _5989 = _5983 * 6.283185482025146484375;
        float _5991 = sin(_5989);
        _5985 = _5991;
    }
    float _5993 = _5985;
    float _5995 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5997 = precise::max(0.0, _5995);
    float _5999 = _5911;
    float _6001 = _5997;
    if (_5951)
    {
        float _6003 = _5983 * 6.283185482025146484375;
        float _6005 = cos(_6003);
        _5999 = _6005;
    }
    float _6007 = _5999;
    float _6009 = -_5937;
    float _6011 = -_5997;
    float _6013 = fma(_5917, _6009, _6011);
    if (_5951)
    {
        float _6015 = _6013 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6001 = _6015;
    }
    float _6017 = _6001;
    float _6019 = _5993;
    float _6021 = _6017;
    if (_5951)
    {
        float _6023 = fma(_5993, _6017, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5965 = _6023;
    }
    float _6025 = _5965;
    float _6027 = _6025;
    if (!_5951)
    {
        _6019 = _5939;
    }
    float _6029 = _6019;
    float _6031 = _6029;
    float _6033 = _6007;
    if (_5951)
    {
        float _6035 = _6007 + (-1.0);
        _6021 = _6035;
    }
    float _6037 = _6021;
    float _6039 = _6037;
    if (_5951)
    {
        float _6041 = _5973 * _6025;
        _5733 = _6041;
    }
    float _6043 = _5733;
    if (!_5951)
    {
        _6027 = _6013;
    }
    float _6045 = _6027;
    float _6047 = _6045;
    if (_5951)
    {
        float _6049 = _6037 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5987 = _6049;
    }
    float _6051 = _5987;
    if (_5951)
    {
        float _6053 = _5939 * _6043;
        _6031 = _6053;
    }
    float _6055 = _6031;
    if (!_5951)
    {
        _6039 = _5941;
    }
    float _6057 = _6039;
    float _6059 = _6057;
    if (_5951)
    {
        float _6061 = _5941 * _6043;
        _6059 = _6061;
    }
    float _6063 = _6059;
    if (!_5951)
    {
        _5975 = _5943;
    }
    float _6065 = _5975;
    float _6067 = _6065;
    if (_5951)
    {
        float _6069 = fma(_6013, _6007, _6051);
        _6047 = _6069;
    }
    float _6071 = _6047;
    if (_5951)
    {
        float _6073 = _6055 * _6055;
        _6067 = _6073;
    }
    float _6075 = _6067;
    if (!_5951)
    {
        _6033 = _5945;
    }
    float _6077 = _6033;
    float _6079 = _6077;
    if (_5951)
    {
        float _6081 = _6063 * _6063;
        _6079 = _6081;
    }
    float _6083 = _6079;
    float _6085 = fma(_6071, _6071, _6075);
    float _6087 = _6085 + _6083;
    float _6089 = fma(_5153, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6091 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6093 = rsqrt(_6087);
    float _6095 = fma(_5175, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6097 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6091);
    float _6099 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6101 = fma(_5935, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6099);
    float _6103 = precise::clamp(_6101, 0.0, 1.0);
    float _6105 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6097);
    float _6107 = floor(_6089);
    float _6109 = -_6103;
    float _6111 = _6109 + 1.0;
    float _6113 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6115 = _6105 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6117 = _6093 * _6055;
    float _6119 = _6093 * _6063;
    float _6121 = _6093 * _6071;
    float _6123 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6113);
    float _6125 = _6117 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6129 = _6115 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6131 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6123);
    float _6133 = -_6125;
    float _6135 = fma(_6121, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6133);
    float _6137 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6139 = abs(_6111);
    float _6141 = log2(_6139);
    float _6143 = _6131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6145 = -_6119;
    float _6147 = fma(_6145, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6135);
    float _6149 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6137);
    float _6151 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6153 = -_6129;
    float _6155 = fma(_6153, _6127, 1.0);
    float _6157 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6159 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6149);
    float _6161 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6151);
    float _6163 = fma(_6147, -0.5, 0.5);
    float _6165 = floor(_6095);
    float _6167 = _6159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6169 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6161);
    float _6171 = -_6107;
    float _6173 = _6089 + _6171;
    float _6175 = fma(_6147, 0.5, 0.5);
    float _6177 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6157);
    float _6179 = _6169 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6181 = _6141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6183 = sqrt(_6163);
    float _6185 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6177);
    float _6187 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6189 = fma(_6175, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6191 = _6121 + 1.0;
    float _6193 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6185);
    float _6195 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6187);
    float _6197 = fma(_6175, _6189, -0.212114393711090087890625);
    float _6199 = exp2(_6181);
    float _6201 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6203 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6195);
    float _6205 = -_6165;
    float _6207 = _6095 + _6205;
    float _6209 = fma(_6175, _6197, 1.570728778839111328125);
    float _6211 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6203);
    float _6213 = log2(_6155);
    float _6215 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6201);
    float _6217 = _6183 * 0.636619746685028076171875;
    float _6219 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6215);
    float _6221 = 1.0 / _6193;
    float _6223 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6219);
    float _6225 = -_6121;
    float _6227 = fma(_6199, _6191, _6225);
    float2 _15971 = float2(_6173, _6207);
    float _6229 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15971, float2(0.0), isnan(_15971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15971, float2(0.0), isnan(_15971)), level(0.0)).x;
    float _6231 = -_6209;
    float _6233 = fma(_6217, _6231, 1.0);
    float _6235 = fma(_5561, 6.2500002968590706586837768554688e-05, 0.5);
    float _6237 = fma(_6227, 0.5, 0.5);
    float _6239 = fma(_5563, 6.2500002968590706586837768554688e-05, 0.5);
    float _6241 = _6213 * 0.693147182464599609375;
    float _6243 = _6241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6245 = _6211 * _6221;
    float _6247 = _6223 * _6221;
    float _6249 = fma(_6245, 0.5, 0.5);
    float _6251 = fma(_6247, -0.5, 0.5);
    float3 _16011 = float3(_6249, _6251, _6243);
    float _6253 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16011, float3(0.0), isnan(_16011)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16011, float3(0.0), isnan(_16011)), level(0.0)).x;
    float3 _16022 = float3(_6249, _6251, _6243);
    float4 _6256 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16022, float3(0.0), isnan(_16022)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16022, float3(0.0), isnan(_16022)), level(0.0)).xyzw;
    float _6258 = _6256.x;
    float _6260 = _6256.y;
    float _6262 = _6256.z;
    float _6264 = _6256.w;
    float2 _16038 = float2(_6233, _6237);
    float3 _6268 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16038, float2(0.0), isnan(_16038)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16038, float2(0.0), isnan(_16038)), level(0.0)).xyz;
    float _6270 = _6268.x;
    float _6272 = _6268.y;
    float _6274 = _6268.z;
    float2 _16052 = float2(_6235, _6239);
    float3 _6276 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_16052, float2(0.0), isnan(_16052)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_16052, float2(0.0), isnan(_16052)), level(0.0)).xyz;
    float _6278 = _6276.x;
    float _6280 = _6276.y;
    float _6282 = _6276.z;
    float _6284 = abs(_5801);
    float _6286 = log2(_6284);
    float _6288 = in.m_91.x;
    float _6290 = in.m_91.y;
    float _6292 = in.m_91.z;
    bool _6294 = _5301 != 0.0;
    bool _6296 = isnan(_5301);
    bool _6298 = _6294 || _6296;
    bool _6300 = isnan(0.0);
    bool _6302 = _6298 || _6300;
    float _6304 = _6141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6306 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6308 = in.m_93.x;
    float _6310 = in.m_93.y;
    float _6312 = in.m_93.z;
    float _6314 = in.m_93.w;
    bool _6316 = _5299 == 0.0;
    bool _6318 = !_6302;
    bool _6320 = _6316 && _6318;
    float _6322 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6306);
    bool _6324 = _5801 <= 8000.0;
    bool _6326 = isnan(_5801);
    bool _6328 = _6324 || _6326;
    bool _6330 = isnan(8000.0);
    bool _6332 = _6328 || _6330;
    float _6334 = float(_6332);
    bool _6336 = _5303 == 0.0;
    bool _6338 = _6336 && _6320;
    float _6340 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6322);
    float _6342 = _6286 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6344 = exp2(_6342);
    float _6346 = _6286;
    float _6348 = _6243;
    float _6350 = _6288;
    float _6352 = _6193;
    float _6354 = _6211;
    float _6356 = _6223;
    if (_6338)
    {
        _3733 = _6288;
    }
    float _6358 = _3733;
    float _6360 = _6358;
    if (_6338)
    {
        _3915 = _6290;
    }
    float _6362 = _3915;
    float _6364 = _6362;
    if (_6338)
    {
        _6346 = _6358;
    }
    float _6366 = _6346;
    float _6368 = _6366;
    if (!_6338)
    {
        _6360 = _6288;
    }
    float _6370 = _6360;
    if (_6338)
    {
        _6348 = _6362;
    }
    float _6372 = _6348;
    float _6374 = _6372;
    if (!_6338)
    {
        _6364 = _6290;
    }
    float _6376 = _6364;
    if (!_6338)
    {
        float _6378 = fma(_5299, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6370);
        _6368 = _6378;
    }
    float _6380 = _6368;
    if (_6338)
    {
        _6350 = _6292;
    }
    float _6382 = _6350;
    float _6384 = _6382;
    if (!_6338)
    {
        float _6386 = fma(_5303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6292);
        _6384 = _6386;
    }
    float _6388 = _6384;
    if (!_6338)
    {
        float _6390 = fma(_5301, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6376);
        _6374 = _6390;
    }
    float _6392 = _6374;
    float _6394 = _6310 * _6292;
    float _6396 = _6312 * _6370;
    float _6398 = fma(_6344, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6400 = precise::clamp(_6398, 0.0, 1.0);
    float _6402 = _6308 * _6376;
    float _6404 = -_6394;
    float _6406 = fma(_6312, _6376, _6404);
    float _6408 = -_6396;
    float _6410 = fma(_6308, _6292, _6408);
    float _6412 = fma(_6400, -2.0, 3.0);
    float _6414 = -_6402;
    float _6416 = fma(_6310, _6370, _6414);
    float _6418 = _6400 * _6400;
    float _6420 = _6410 * _6314;
    float _6422 = _6406 * _6314;
    float _6424 = _6416 * _6314;
    float _6426 = _6418 * _6412;
    float _6428 = _5357 * _5447;
    float _6430 = _5357 * _5455;
    float _6432 = _5357 * _5441;
    float _6434 = _5385 * _5455;
    float _6436 = _5385 * _5447;
    float _6438 = _5403 * _5455;
    float _6440 = _5385 * _5441;
    float _6442 = _5403 * _5447;
    float _6444 = _5403 * _5441;
    float _6446 = -_5319;
    float _6448 = fma(_6446, _5431, _6434);
    float _6450 = fma(_5377, _5431, _6430);
    float _6452 = -_5319;
    float _6454 = fma(_6452, _5429, _6440);
    float _6456 = fma(_5389, _5427, _6442);
    float _6458 = fma(_5389, _5431, _6438);
    float _6460 = fma(_5389, _5429, _6444);
    float _6462 = fma(_5377, _5427, _6428);
    float _6464 = fma(_5387, _5327, _6448);
    float _6466 = fma(_5377, _5429, _6432);
    float _6468 = fma(_5399, _5327, _6450);
    float _6470 = fma(_5359, _5323, _6456);
    float _6472 = fma(_5359, _5327, _6458);
    float _6474 = fma(_5359, _5325, _6460);
    float _6476 = -_5319;
    float _6478 = fma(_6476, _5427, _6436);
    float _6480 = _6464 * _6310;
    float _6482 = fma(_5387, _5325, _6454);
    float _6484 = fma(_5399, _5323, _6462);
    float _6486 = fma(_5387, _5323, _6478);
    float _6488 = fma(_6468, _6308, _6480);
    float _6490 = exp2(_6304);
    float _6492 = fma(_5399, _5325, _6466);
    float _6494 = _6486 * _6310;
    float _6496 = _6482 * _6310;
    float _6498 = fma(_6472, _6312, _6488);
    float _6500 = -_6426;
    float _6502 = _6500 + 1.0;
    float _6504 = in.m_95.x;
    float _6506 = _6464 * _6392;
    float _6508 = _6420 * _6464;
    float _6510 = fma(_6502, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6426);
    float _6512 = _6486 * _6392;
    float _6514 = _6482 * _6392;
    float _6516 = fma(_6484, _6308, _6494);
    float _6518 = _6334 * _6510;
    float _6520 = fma(_6468, _6380, _6506);
    float _6522 = _6420 * _6486;
    float _6524 = _6420 * _6482;
    float _6526 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6340);
    float _6528 = fma(_6484, _6380, _6512);
    float _6530 = fma(_6492, _6380, _6514);
    float _6532 = fma(_6422, _6468, _6508);
    float _6534 = _6518 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6536 = -_6490;
    float _6538 = _6536 + 1.0;
    float _6540 = fma(_6422, _6484, _6522);
    float _6542 = fma(_6422, _6492, _6524);
    float _6544 = fma(_6470, _6388, _6528);
    float _6546 = fma(_6472, _6388, _6520);
    float _6548 = fma(_6474, _6388, _6530);
    float _6550 = _6538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6552 = fma(_6424, _6470, _6540);
    float _6554 = fma(_6424, _6472, _6532);
    float _6556 = fma(_6424, _6474, _6542);
    float _6558 = fma(_6492, _6308, _6496);
    float _6560 = fma(_6470, _6312, _6516);
    float _6562 = _6526 + _6193;
    float _6564 = _6211 + _6193;
    out.m_97.x = _6552;
    out.m_97.y = _6554;
    out.m_97.z = _6556;
    float _6566 = _6193 * 0.5;
    float _6568 = fma(_6474, _6312, _6558);
    float _6570 = _6562 * 0.5;
    float _6572 = _6564 * 0.5;
    float _6574 = fma(_6223, -0.5, _6566);
    out.m_99.x = _6560;
    out.m_99.y = _6498;
    out.m_99.z = _6568;
    bool _6576 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6578 = isnan(_5935);
    bool _6580 = _6576 || _6578;
    bool _6582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6584 = _6580 || _6582;
    out.m_101.x = _6572;
    out.m_101.y = _6574;
    out.m_101.z = _6570;
    out.m_101.w = _6193;
    float _6586 = -_6550;
    float _6588 = _6586 + 1.0;
    out.m_103.x = _6544;
    out.m_103.y = _6546;
    out.m_103.z = _6548;
    out.gl_Position.x = _6211;
    out.gl_Position.y = _6223;
    out.gl_Position.z = _6526;
    out.gl_Position.w = _6193;
    float _6590 = _6556;
    if (!_6584)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6592 = _6590;
    float _6594 = _6592;
    float _6596 = _6592;
    if (!_6584)
    {
        _6352 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6598 = _6352;
    float _6600 = _6598;
    float _6602 = _6598;
    if (!_6584)
    {
        _6354 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6604 = _6354;
    float _6606 = _6604;
    float _6608 = _6604;
    if (!_6584)
    {
        _6356 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6610 = _6356;
    float _6612 = -_6229;
    float _6614 = _6612 + 1.0;
    float _6616 = _6614 * _6534;
    float _6618 = precise::clamp(_6616, 0.0, 1.0);
    float _6620 = -_6618;
    float _6622 = fma(_6620, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6624 = _6622 * _6504;
    float _6626 = _6624 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_105.x = _6626;
    float _6628 = _6550 * _6253;
    float _6630 = _6264 * _6588;
    float _6632 = _5855 * _5913;
    float _6634 = _6264 * _6628;
    float _6636 = _6274 * _6628;
    out.m_107.x = _6278;
    out.m_107.y = _6280;
    out.m_107.z = _6282;
    float _6638 = _6632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6640 = fma(_6270, _6634, _6258);
    float _6642 = fma(_6272, _6634, _6260);
    float _6644 = fma(_6264, _6636, _6262);
    float _6646 = _6634;
    float _6648 = _6632;
    float _6650 = _6610;
    float _6652 = _6610;
    if (!_6584)
    {
        _6646 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6654 = _6646;
    float _6656 = _6654;
    float _6658 = _6654;
    if (!_6584)
    {
        _6648 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6660 = _6648;
    out.m_109.x = _6640;
    out.m_109.y = _6642;
    out.m_109.z = _6644;
    out.m_109.w = _6630;
    bool _6662 = !_6584;
    float _6664 = _6660;
    float _6666 = _6660;
    if (!_6662)
    {
        bool _6668 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6670 = isnan(_5935);
        bool _6672 = _6668 || _6670;
        bool _6674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6676 = _6672 || _6674;
        if (!_6676)
        {
            float _6678 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6680 = _5935 + _6678;
            float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6684 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6682;
            float _6686 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6688 = _6686 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6690 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6692 = _6690 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6694 = 1.0 / _6684;
            float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6708 = _6680 * _6694;
            float _6710 = precise::clamp(_6708, 0.0, 1.0);
            float _6712 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6714 = _6712 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6716 = fma(_6710, _6688, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6718 = fma(_6710, _6692, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6720 = fma(_6710, _6714, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6722 = fma(_6710, _6698, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6724 = fma(_6710, _6702, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6726 = fma(_6710, _6706, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6658 = _6716;
            _6608 = _6724;
            _6596 = _6718;
            _6602 = _6722;
            _6666 = _6720;
            _6652 = _6726;
            _6728 = true;
        }
        else
        {
            bool _6730 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6732 = isnan(_5935);
            bool _6734 = _6730 || _6732;
            bool _6736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6738 = _6734 || _6736;
            if (!_6738)
            {
                _6600 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6740 = _6600;
            _6602 = _6740;
            if (!_6738)
            {
                _6606 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6742 = _6606;
            _6608 = _6742;
            if (!_6738)
            {
                _6650 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6744 = _6650;
            _6652 = _6744;
            if (!_6738)
            {
                _6594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6746 = _6594;
            _6596 = _6746;
            if (!_6738)
            {
                _6656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6748 = _6656;
            _6658 = _6748;
            if (!_6738)
            {
                _6664 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6750 = _6664;
            bool _6752 = !_6738;
            _6666 = _6750;
            if (!_6752)
            {
                bool _6754 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6756 = isnan(_5935);
                bool _6758 = _6754 || _6756;
                bool _6760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6762 = _6758 || _6760;
                if (!_6762)
                {
                    float _6764 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6766 = _5935 + _6764;
                    float _6768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6770 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6768;
                    float _6772 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6774 = _6772 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6776 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6778 = _6776 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6780 = 1.0 / _6770;
                    float _6782 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6784 = _6782 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6786 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6788 = _6786 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6792 = _6790 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6794 = _6766 * _6780;
                    float _6796 = precise::clamp(_6794, 0.0, 1.0);
                    float _6798 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6800 = _6798 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6802 = fma(_6796, _6774, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6804 = fma(_6796, _6778, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6806 = fma(_6796, _6800, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6808 = fma(_6796, _6784, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6810 = fma(_6796, _6788, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6812 = fma(_6796, _6792, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6658 = _6802;
                    _6608 = _6810;
                    _6596 = _6804;
                    _6602 = _6808;
                    _6666 = _6806;
                    _6652 = _6812;
                    _6728 = true;
                }
                else
                {
                    _6658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6608 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6602 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6666 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6652 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6728 = false;
    float _6814 = _6658;
    float _6816 = _6608;
    float _6818 = _6596;
    float _6820 = _6602;
    float _6822 = _6666;
    float _6824 = _6652;
    float _6826 = fma(_6546, -0.5, 0.5);
    float _6828 = precise::clamp(_6826, 0.0, 1.0);
    float _6830 = -_6814;
    float _6832 = _6816 + _6830;
    float _6834 = _6638 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6836 = -_6818;
    float _6838 = _6820 + _6836;
    float _6840 = fma(_6828, _6832, _6814);
    out.m_111.x = 0.0;
    float _6842 = -_6822;
    float _6844 = _6824 + _6842;
    float _6846 = fma(_6828, _6838, _6818);
    float _6848 = _6840 * 0.586610972881317138671875;
    out.m_51.x = _6834;
    bool _6850 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6852 = fma(_6828, _6844, _6822);
    float _6854 = fma(_6846, 0.298911988735198974609375, _6848);
    bool _6856 = _5855 > 0.0;
    bool _6858 = isnan(_5855);
    bool _6860 = _6856 || _6858;
    bool _6862 = isnan(0.0);
    bool _6864 = _6860 || _6862;
    float _6866 = fma(_6852, 0.114477999508380889892578125, _6854);
    bool _6868 = _5913 <= 0.0;
    bool _6870 = !_6864;
    bool _6872 = _6868 || _6870;
    float _6874 = -_6866;
    float _6876 = _6846 + _6874;
    float _6878 = -_6866;
    float _6880 = _6840 + _6878;
    float _6882 = -_6866;
    float _6884 = _6852 + _6882;
    float _6886 = fma(_6876, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    float _6888 = fma(_6880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    float _6890 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    bool _6892 = !_6850;
    if (!_6892)
    {
        float _6894 = -_5787;
        float _6896 = _6894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6898 = -_5789;
        float _6900 = _6898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6902 = -_5791;
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
        float _6936 = _6546 * _6926;
        float _6938 = -_6926;
        float _6940 = -_6934;
        float _6942 = fma(_6938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6940);
        float _6944 = fma(_6544, _6924, _6936);
        float _6946 = -_6932;
        float _6948 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6942);
        float _6950 = fma(_6548, _6932, _6944);
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
        out.m_111.x = _6970;
        out.m_111.y = _6972;
        out.m_111.z = _6974;
    }
    out.m_113.x = _6886;
    out.m_113.y = _6888;
    out.m_113.z = _6890;
    if (!_6872)
    {
        return out;
    }
    float _6976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
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
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6728 = false;
    bool _1224 = false;
    bool _900 = false;
    bool _720 = false;
    bool _528 = false;
    bool _252 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_48.w;
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
        out.m_51.x = 0.0;
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
        float _7033 = as_type<float>(_148);
        out.gl_Position.z = _7033;
    }
    if (!_136)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _152 = in.m_53.w;
    bool _154 = _152 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _156 = isnan(_152);
    bool _158 = _154 || _156;
    bool _160 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _162 = _158 || _160;
    float _164 = -_152;
    float _166 = _164 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _168 = 0.0;
    float _170 = _166;
    if (_162)
    {
        float _172 = float(_132);
        _168 = _172;
    }
    float _174 = _168;
    bool _176 = _166 >= _174;
    bool _178 = !_162;
    bool _180 = _176 || _178;
    if (_180)
    {
        _142 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _182 = _142;
    if (_180)
    {
        out.m_51.x = 0.0;
    }
    if (_180)
    {
        float _184 = _182 * 5.0;
        _150 = as_type<int>(_184);
    }
    int _186 = _150;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7102 = as_type<float>(_186);
        out.gl_Position.z = _7102;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _188 = in.m_55.x;
    float _190 = in.m_55.y;
    float _192 = in.m_55.z;
    bool _194 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _196 = in.m_57.x;
    float _198 = in.m_57.y;
    float _200 = in.m_57.z;
    float _202 = in.m_59.x;
    float _204 = in.m_59.y;
    float _206 = in.m_59.z;
    float _208 = in.m_61.x;
    float _210 = in.m_61.y;
    float _212 = in.m_61.z;
    float _214 = _190 * _198;
    float _216 = _190 * _204;
    float _218 = fma(_188, _196, _214);
    float _220 = _190 * _210;
    float _222 = fma(_188, _202, _216);
    float _224 = fma(_192, _200, _218);
    float _226 = fma(_188, _208, _220);
    float _228 = fma(_192, _206, _222);
    float _230 = fma(_192, _212, _226);
    bool _232 = !_194;
    float _250;
    if (!_232)
    {
        float _234 = in.m_63.x;
        float _236 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _238 = _234 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _240 = fma(_238, (*spvDescriptorSet0.vp_c9)._m0[12].x, _166);
        float _242 = _240 * _236;
        float _244 = floor(_242);
        float _246 = -_244;
        float _248 = _242 + _246;
        _250 = _248;
        _252 = true;
    }
    else
    {
        float _254 = float(_132);
        float _256 = 1.0 / _254;
        float _258 = _166 * _256;
        _250 = _258;
    }
    _252 = false;
    float _260 = _250;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _264 = _260 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _260 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _260 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = 1.0 / _280;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _284;
    bool _296 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_260);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _276;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _312 = _260 + _310;
    float _314 = _312 * _290;
    bool _316 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _318 = isnan(_260);
    bool _320 = _316 || _318;
    bool _322 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _324 = _320 || _322;
    float _326 = float(_324);
    float _328 = 1.0 / _288;
    float _330 = _264 * _294;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _334 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _332;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _338 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _336;
    float _340 = _268 * _308;
    bool _342 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _344 = isnan(_260);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -_326;
    float _356 = _354 + 1.0;
    float _358 = fma(_338, _330, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _360 = fma(_334, _330, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _362 = _352 * _356;
    float _364 = -_352;
    float _366 = _364 + 1.0;
    float _368 = _272 * _328;
    bool _370 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _372 = isnan(_260);
    bool _374 = _370 || _372;
    bool _376 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _378 = _374 || _376;
    float _380 = float(_378);
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _384 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _382;
    bool _386 = _260 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _388 = isnan(_260);
    bool _390 = _386 || _388;
    bool _392 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _394 = _390 || _392;
    float _396 = float(_394);
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _400 = _398 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = fma(_384, _330, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _404 = -_380;
    float _406 = _404 + 1.0;
    float _408 = _380 * _366;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _412 = _410 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = _306 * _406;
    float _420 = -_306;
    float _422 = _420 + 1.0;
    float _424 = fma(_400, _368, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _426 = fma(_416, _368, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _428 = fma(_412, _368, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _430 = _396 * _422;
    float _432 = -_396;
    float _434 = _432 + 1.0;
    float _436 = _358 * _430;
    float _438 = _360 * _430;
    float _440 = _402 * _430;
    float _442 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _444 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _442;
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _436);
    float _448 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _438);
    float _450 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _440);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_424, _418, _446);
    float _462 = fma(_426, _418, _448);
    float _464 = fma(_428, _418, _450);
    float _466 = fma(_444, _340, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _468 = fma(_454, _340, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _470 = fma(_458, _340, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _484 = fma(_466, _408, _460);
    float _486 = fma(_474, _314, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _488 = fma(_478, _314, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _490 = fma(_482, _314, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _492 = fma(_468, _408, _462);
    float _494 = fma(_470, _408, _464);
    float _496 = fma(_486, _362, _484);
    float _498 = fma(_488, _362, _492);
    float _500 = fma(_490, _362, _494);
    float _502 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].x, _496);
    float _504 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].y, _498);
    float _506 = fma(_326, (*spvDescriptorSet0.vp_c9)._m0[147].z, _500);
    bool _508 = !_292;
    float _526;
    if (!_508)
    {
        float _510 = in.m_63.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].y, _166);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_132);
        float _532 = 1.0 / _530;
        float _534 = _166 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _540 = _536 + _538;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _542 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _550 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _552 = isnan(_536);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _566 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _568 = isnan(_536);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = 1.0 / _544;
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _580;
    float _584 = -_560;
    float _586 = _584 + 1.0;
    bool _588 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _590 = isnan(_536);
    bool _592 = _588 || _590;
    bool _594 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _596 = _592 || _594;
    float _598 = float(_596);
    bool _600 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _602 = 1.0 / _548;
    float _604 = 1.0 / _564;
    float _606 = _582 * _578;
    float _608 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _610 = _608 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _612 = _576 * _586;
    float _614 = -_576;
    float _616 = _614 + 1.0;
    float _618 = fma(_606, _540, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _622 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _620;
    float _624 = _598 * _616;
    float _626 = _610 * _602;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _536 + _628;
    bool _632 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _634 = isnan(_536);
    bool _636 = _632 || _634;
    bool _638 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _640 = _636 || _638;
    float _642 = float(_640);
    float _644 = _618 * _624;
    float _646 = -_598;
    float _648 = _646 + 1.0;
    float _650 = fma(_626, _630, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _652 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _654 = _536 + _652;
    float _656 = _622 * _604;
    float _658 = -_642;
    float _660 = _658 + 1.0;
    float _662 = fma(_648, (*spvDescriptorSet0.vp_c9)._m0[115].x, _644);
    float _664 = fma(_656, _654, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _666 = _560 * _660;
    float _668 = fma(_650, _612, _662);
    float _670 = in.m_65.x;
    float _672 = in.m_65.y;
    float _674 = in.m_65.z;
    float _676 = fma(_664, _666, _668);
    float _678 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _680 = fma(_642, (*spvDescriptorSet0.vp_c9)._m0[118].x, _676);
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _686 = _678 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _688 = _680 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_67.x = _686;
    out.m_67.y = _690;
    out.m_67.z = _692;
    out.m_67.w = _688;
    float _694 = _506 * _674;
    float _696 = _504 * _672;
    float _698 = _502 * _670;
    bool _700 = !_600;
    float _718;
    if (!_700)
    {
        float _702 = in.m_63.x;
        float _704 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _706 = _702 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _708 = fma(_706, (*spvDescriptorSet0.vp_c9)._m0[11].w, _166);
        float _710 = _708 * _704;
        float _712 = floor(_710);
        float _714 = -_712;
        float _716 = _710 + _714;
        _718 = _716;
        _720 = true;
    }
    else
    {
        float _722 = float(_132);
        float _724 = 1.0 / _722;
        float _726 = _166 * _724;
        _718 = _726;
    }
    _720 = false;
    float _728 = _718;
    float _730 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _732 = _728 + _730;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _736 = _734 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _738 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _740 = isnan(_728);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _752 = _750 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _758 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _760 = isnan(_728);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = 1.0 / _736;
    float _772 = -_748;
    float _774 = _772 + 1.0;
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _778 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _776;
    bool _780 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _782 = isnan(_728);
    bool _784 = _780 || _782;
    bool _786 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _788 = _784 || _786;
    float _790 = float(_788);
    float _792 = _768 * _774;
    float _794 = -_768;
    float _796 = _794 + 1.0;
    bool _798 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _800 = 1.0 / _752;
    float _802 = _790 * _796;
    float _804 = -_790;
    float _806 = _804 + 1.0;
    float _808 = 1.0 / _756;
    float _810 = _778 * _770;
    float _812 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _814 = _812 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _816 = fma(_810, _732, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _818 = _814 * _800;
    bool _820 = _728 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _822 = isnan(_728);
    bool _824 = _820 || _822;
    bool _826 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _828 = _824 || _826;
    float _830 = float(_828);
    float _832 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _834 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _832;
    float _836 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _838 = _728 + _836;
    float _840 = _816 * _802;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _844 = _728 + _842;
    float _846 = -_830;
    float _848 = _846 + 1.0;
    float _850 = fma(_818, _838, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _852 = _834 * _808;
    float _854 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[131].x, _840);
    float _856 = _748 * _848;
    float _858 = fma(_852, _844, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _860 = fma(_850, _792, _854);
    float _862 = fma(_858, _856, _860);
    float _864 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _866 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _870 = fma(_830, (*spvDescriptorSet0.vp_c9)._m0[134].x, _862);
    float _872 = _864 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _874 = _866 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _876 = _868 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _878 = _870 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_69.x = _872;
    out.m_69.y = _874;
    out.m_69.z = _876;
    out.m_69.w = _878;
    bool _880 = !_798;
    float _898;
    if (!_880)
    {
        float _882 = in.m_63.x;
        float _884 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _886 = _882 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _888 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[14].x, _166);
        float _890 = _888 * _884;
        float _892 = floor(_890);
        float _894 = -_892;
        float _896 = _890 + _894;
        _898 = _896;
        _900 = true;
    }
    else
    {
        float _902 = float(_132);
        float _904 = 1.0 / _902;
        float _906 = _166 * _904;
        _898 = _906;
    }
    _900 = false;
    float _908 = _898;
    float _910 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _912 = _908 + _910;
    bool _914 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _916 = isnan(_908);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _928 = _926 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _930 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _932 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _930;
    bool _934 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _936 = isnan(_908);
    bool _938 = _934 || _936;
    bool _940 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _942 = _938 || _940;
    float _944 = float(_942);
    float _946 = -_924;
    float _948 = _946 + 1.0;
    bool _950 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _952 = isnan(_908);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = 1.0 / _928;
    float _964 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _966 = _964 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _968 = _944 * _948;
    float _970 = -_960;
    float _972 = _970 + 1.0;
    float _974 = 1.0 / _966;
    bool _976 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _978 = _932 * _962;
    float _980 = -_944;
    float _982 = _980 + 1.0;
    bool _984 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _986 = isnan(_908);
    bool _988 = _984 || _986;
    bool _990 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _992 = _988 || _990;
    float _994 = float(_992);
    float _996 = fma(_978, _912, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _998 = _960 * _982;
    bool _1000 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1002 = isnan(_908);
    bool _1004 = _1000 || _1002;
    bool _1006 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1008 = _1004 || _1006;
    float _1010 = float(_1008);
    float _1012 = _994 * _972;
    float _1014 = -_994;
    float _1016 = _1014 + 1.0;
    float _1018 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1020 = _1018 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1022 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1024 = isnan(_908);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = _1010 * _1016;
    float _1036 = -_1010;
    float _1038 = _1036 + 1.0;
    bool _1040 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1042 = isnan(_908);
    bool _1044 = _1040 || _1042;
    bool _1046 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1048 = _1044 || _1046;
    float _1050 = float(_1048);
    float _1052 = 1.0 / _1020;
    float _1054 = -_1032;
    float _1056 = _1054 + 1.0;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1062 = _1032 * _1038;
    float _1064 = _1050 * _1056;
    float _1066 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1068 = _1066 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1070 = -_1050;
    float _1072 = _1070 + 1.0;
    float _1074 = 1.0 / _1060;
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1080 = _996 * _1064;
    float _1082 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1086 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1088 = _908 + _1086;
    float _1090 = _1078 * _974;
    float _1092 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1080);
    float _1094 = 1.0 / _1068;
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1098 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1096;
    float _1100 = fma(_1090, _1088, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1106 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1108 = _908 + _1106;
    float _1110 = _1098 * _1052;
    float _1112 = fma(_1100, _1062, _1092);
    float _1114 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1116 = _908 + _1114;
    float _1118 = 1.0 / _1084;
    float _1120 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1122 = _1120 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = fma(_1110, _1108, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1126 = _1122 * _1074;
    bool _1128 = _908 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1130 = isnan(_908);
    bool _1132 = _1128 || _1130;
    bool _1134 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1136 = _1132 || _1134;
    float _1138 = float(_1136);
    float _1140 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1142 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1140;
    float _1144 = 1.0 / _1104;
    float _1146 = fma(_1124, _1034, _1112);
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1150 = _1148 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1152 = _1142 * _1094;
    float _1154 = fma(_1126, _1116, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1156 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1158 = _908 + _1156;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1162 = _908 + _1160;
    float _1164 = _1150 * _1118;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1166;
    float _1170 = fma(_1152, _1158, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1172 = fma(_1154, _1012, _1146);
    float _1174 = fma(_1164, _1162, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1176 = -_1138;
    float _1178 = _1176 + 1.0;
    float _1180 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1182 = _908 + _1180;
    float _1184 = fma(_1170, _998, _1172);
    float _1186 = _1168 * _1144;
    float _1188 = _924 * _1178;
    float _1190 = fma(_1174, _968, _1184);
    float _1192 = fma(_1186, _1182, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1194 = fma(_1192, _1188, _1190);
    float _1196 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1194);
    out.m_71.x = _1196;
    bool _1198 = !_976;
    int _1200 = as_type<int>(_968);
    float _1202 = _1094;
    float _1204 = _1144;
    float _1222;
    if (!_1198)
    {
        float _1206 = in.m_63.x;
        float _1208 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1210 = _1206 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1212 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[14].y, _166);
        float _1214 = _1212 * _1208;
        float _1216 = floor(_1214);
        float _1218 = -_1216;
        float _1220 = _1214 + _1218;
        _1222 = _1220;
        _1224 = true;
    }
    else
    {
        float _1226 = float(_132);
        float _1228 = 1.0 / _1226;
        float _1230 = _166 * _1228;
        _1222 = _1230;
    }
    _1224 = false;
    float _1232 = _1222;
    float _1234 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1236 = int(_1234);
    int _1238 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1240 = _1238 != 0;
    int _1242 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1244 = _1242 != 0;
    float _1246 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1248 = int(_1246);
    int _1250 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1252 = _1250 != 0;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1256 = _1254 != 0;
    float _1258 = 0.0;
    int _1260 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _1262 = _1252;
    bool _1264 = _1256;
    if (_1240)
    {
        _1258 = 1.0;
    }
    float _1266 = _1258;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1270 = int(_1268);
    float _1272 = float(_1236);
    float _1274 = 0.0;
    float _1276 = _1266;
    if (_1240)
    {
        _1274 = 1.0;
    }
    float _1278 = _1274;
    float _1280 = 0.0;
    float _1282 = _1278;
    if (_1240)
    {
        _1280 = 1.0;
    }
    float _1284 = _1280;
    int _1286 = 0;
    float _1288 = _1284;
    if (_1240)
    {
        _1286 = 0;
    }
    int _1290 = _1286;
    float _1292 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1294 = int(_1292);
    float _1296 = float(_1248);
    int _1298 = _1290;
    if (_1240)
    {
        _1260 = 0;
    }
    int _1300 = _1260;
    float _1302 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1304 = int(_1302);
    float _1306 = float(_1270);
    float _1308 = float(_1294);
    float _1310 = 1.0 / _1272;
    float _1312 = float(uint(_1304));
    float _1314 = 1.0 / _1296;
    float _1316 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1318 = int(_1316);
    float _1320 = _1310 * _166;
    float _1322 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1324 = int(_1322);
    float _1326 = _1314 * _166;
    float _1328 = _1314;
    int _1330 = _1300;
    if (_1240)
    {
        float _1332 = in.m_63.z;
        _1328 = _1332;
    }
    float _1334 = _1328;
    float _1336 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1338 = int(_1336);
    float _1340 = float(uint(_1318));
    float _1342 = 1.0 / _1306;
    float _1344 = float(uint(_1324));
    float _1346 = 1.0 / _1308;
    float _1348 = float(uint(_1338));
    int _1350 = 0;
    float _1352 = _1334;
    if (_1240)
    {
        _1350 = as_type<int>(_1334);
    }
    int _1354 = _1350;
    float _1356 = 1.0 / _1312;
    float _1358 = _1342 * _166;
    float _1360 = _1346 * _166;
    float _1362 = 1.0 / _1344;
    int _1364 = as_type<int>(_1356) + (-2);
    float _1366 = 1.0 / _1348;
    float _1368 = in.m_73.x;
    float _1370 = _1356;
    int _1372 = _1354;
    if (_1240)
    {
        float _1374 = in.m_63.x;
        _1370 = _1374;
    }
    float _1376 = _1370;
    float _1378 = trunc(_1320);
    int _1380 = int(_1378);
    int _1382 = as_type<int>(_1362) + (-2);
    float _1384 = trunc(_1326);
    int _1386 = int(_1384);
    int _1388 = as_type<int>(_1366) + (-2);
    float _1390 = 1.0 / _1340;
    float _1392 = float(uint(_1380));
    float _1394 = _1376;
    float _1396 = _1368;
    if (_1252)
    {
        float _1398 = -_1368;
        float _1400 = _1398 + 1.0;
        _1200 = as_type<int>(_1400);
    }
    int _1402 = _1200;
    if (!_1256)
    {
        _1202 = _1368;
    }
    float _1404 = _1202;
    float _1406 = 0.0;
    float _1408 = _1404;
    if (!_1252)
    {
        _1406 = _1368;
    }
    float _1410 = _1406;
    float _1412 = as_type<float>(_1382) * _1392;
    float _1414 = _1410;
    if (!_1244)
    {
        _1204 = _1368;
    }
    float _1416 = _1204;
    float _1418 = trunc(_1360);
    int _1420 = int(_1418);
    float _1422 = in.m_63.y;
    float _1424 = float(uint(_1386));
    float _1426 = as_type<float>(_1388) * _1424;
    float _1428 = trunc(_1358);
    int _1430 = int(_1428);
    int _1432 = as_type<int>(_1390) + (-2);
    float _1434 = float(uint(_1420));
    float _1436 = trunc(_1412);
    float _1438 = precise::max(_1436, 0.0);
    uint _1441 = uint(_1438);
    float _1443 = as_type<float>(_1364) * _1434;
    float _1445 = float(uint(_1430));
    float _1447 = trunc(_1426);
    float _1449 = precise::max(_1447, 0.0);
    uint _1451 = uint(_1449);
    bool _1453 = _1422 > 0.5;
    int _1455 = 0;
    float _1457 = _1416;
    if (_1240)
    {
        _1455 = as_type<int>(_1422);
    }
    int _1459 = _1455;
    float _1461 = as_type<float>(_1432) * _1445;
    float _1463 = _1461;
    int _1465 = _1459;
    if (_1252)
    {
        float _1467 = _1453 ? as_type<float>(_1402) : _1368;
        _1414 = _1467;
    }
    float _1469 = _1414;
    float _1471 = trunc(_1443);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    float _1477 = trunc(_1461);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    int _1483 = int(_1252);
    int _1485 = _1244 ? 2 : 0;
    int _1487 = _1483 | _1485;
    int _1489 = _1256 ? 4 : 0;
    int _1491 = _1487 | _1489;
    int _1493 = _1240 ? 8 : 0;
    int _1495 = _1491 | _1493;
    int _1497 = false ? 16 : 0;
    int _1499 = _1495 | _1497;
    int _1501 = _1453 ? 32 : 0;
    int _1503 = _1499 | _1501;
    int _1505 = false ? 64 : 0;
    int _1507 = _1503 | _1505;
    int _1509 = _1507 & 32;
    int _1511 = _1509;
    if (_1256)
    {
        float _1513 = -_1368;
        float _1515 = _1513 + 1.0;
        _1511 = as_type<int>(_1515);
    }
    int _1517 = _1511;
    float _1519 = as_type<float>(_1517);
    if (_1256)
    {
        float _1521 = _1453 ? as_type<float>(_1517) : _1368;
        _1408 = _1521;
    }
    float _1523 = _1408;
    if (_1240)
    {
        _1463 = _1376;
    }
    float _1525 = _1463;
    float _1527 = _1525;
    if (_1240)
    {
        _1519 = _1525;
    }
    float _1529 = _1519;
    int _1531 = 0;
    float _1533 = _1529;
    if (_1240)
    {
        _1531 = as_type<int>(_1525);
    }
    int _1535 = _1531;
    int _1537 = _1535;
    if (!_1240)
    {
        float _1539 = in.m_63.x;
        float _1541 = _1422 * 3.1415927410125732421875;
        float _1543 = in.m_63.z;
        float _1545 = _1541 * 0.15915493667125701904296875;
        float _1547 = _1545 * 6.283185482025146484375;
        float _1549 = sin(_1547);
        float _1551 = _1539 * 3.1415927410125732421875;
        float _1553 = _1551 * 0.15915493667125701904296875;
        float _1555 = _1543 * 3.1415927410125732421875;
        float _1557 = _1555 * 0.15915493667125701904296875;
        float _1559 = _1553 * 6.283185482025146484375;
        float _1561 = sin(_1559);
        float _1563 = _1557 * 6.283185482025146484375;
        float _1565 = sin(_1563);
        _1533 = _1543;
        _1288 = 5.839270114898681640625;
        _1394 = _1539;
        _1276 = 7.345489978790283203125;
        _1527 = _1422;
        _1282 = 1.2345600128173828125;
        _1298 = 1;
        _1352 = _1543;
        _1372 = as_type<int>(_1565);
        _1465 = as_type<int>(_1549);
        _1330 = 2;
        _1537 = as_type<int>(_1561);
    }
    float _1567 = _1533;
    float _1569 = _1288;
    float _1571 = _1394;
    float _1573 = _1276;
    float _1575 = _1527;
    float _1577 = _1282;
    int _1579 = _1298;
    float _1581 = _1352;
    int _1583 = _1372;
    int _1585 = _1465;
    int _1587 = _1330;
    int _1589 = _1537;
    int _1591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1593 = _1591 != 0;
    float _1595 = _1567 * _1569;
    float _1597 = 0.0;
    if (_1244)
    {
        float _1599 = in.m_63.x;
        _1597 = _1599;
    }
    float _1601 = _1597;
    int _1603 = ~_1324;
    int _1605 = _1603 + 1;
    float _1607 = _1571 * _1573;
    int _1609 = ~_1318;
    int _1611 = _1609 + 1;
    float _1613 = floor(_1595);
    int _1615 = ~_1304;
    int _1617 = _1615 + 1;
    int _1619 = _1605 * int(_1441);
    int _1621 = _1619 + _1380;
    int _1623 = ~_1338;
    int _1625 = _1623 + 1;
    int _1627 = _1611 * int(_1481);
    int _1629 = _1627 + _1430;
    float _1631 = _1575 * _1577;
    int _1633 = _1617 * int(_1475);
    int _1635 = _1633 + _1420;
    int _1637 = as_type<int>(_1567);
    if (_1593)
    {
        float _1639 = in.m_63.z;
        _1637 = as_type<int>(_1639);
    }
    int _1641 = _1637;
    float _1643 = float(uint(_1621));
    int _1645 = _1625 * int(_1451);
    int _1647 = _1645 + _1386;
    float _1649 = float(uint(_1629));
    float _1651 = _1575 * _1573;
    float _1653 = float(uint(_1635));
    float _1655 = as_type<float>(_1382) * _1643;
    int _1657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1659 = _1657 != 0;
    float _1661 = as_type<float>(_1432) * _1649;
    float _1663 = floor(_1607);
    float _1665 = as_type<float>(_1364) * _1653;
    float _1667 = float(uint(_1647));
    int _1669 = 0;
    float _1671 = _1661;
    float _1673 = _1665;
    if (_1593)
    {
        float _1675 = -_1368;
        float _1677 = _1675 + 1.0;
        _1669 = as_type<int>(_1677);
    }
    int _1679 = _1669;
    if (_1244)
    {
        bool _1681 = _1601 > 0.5;
        _1262 = _1681;
    }
    bool _1683 = _1262;
    float _1685 = -_1613;
    float _1687 = _1595 + _1685;
    float _1689 = float(_1380);
    float _1691 = as_type<float>(_1388) * _1667;
    float _1693 = trunc(_1655);
    float _1695 = precise::max(_1693, 0.0);
    uint _1697 = uint(_1695);
    int _1699 = ~_1338;
    int _1701 = _1699 + 1;
    bool _1703 = _1579 != 1;
    int _1705 = 0;
    if (_1659)
    {
        float _1707 = -_1368;
        float _1709 = _1707 + 1.0;
        _1705 = as_type<int>(_1709);
    }
    int _1711 = _1705;
    float _1713 = in.m_57.w;
    float _1715 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1717 = _1232 + _1715;
    int _1719 = ~_1318;
    int _1721 = _1719 + 1;
    int _1723 = _1641;
    if (_1593)
    {
        bool _1725 = as_type<float>(_1641) > 0.5;
        _1264 = _1725;
    }
    bool _1727 = _1264;
    if (_1244)
    {
        float _1729 = -_1368;
        float _1731 = _1729 + 1.0;
        _1723 = as_type<int>(_1731);
    }
    int _1733 = _1723;
    float _1735 = trunc(_1661);
    float _1737 = precise::max(_1735, 0.0);
    uint _1739 = uint(_1737);
    float _1741 = -_1663;
    float _1743 = _1607 + _1741;
    float _1745 = float(_1324);
    float _1747 = in.m_59.w;
    if (_1244)
    {
        float _1749 = _1683 ? as_type<float>(_1733) : _1368;
        _1457 = _1749;
    }
    float _1751 = _1457;
    float _1753 = float(_132);
    float _1755 = _1745 * _1687;
    float _1757 = floor(_1651);
    if (!_1593)
    {
        _1671 = _1368;
    }
    float _1759 = _1671;
    float _1761 = in.m_61.w;
    float _1763 = _1759;
    if (_1593)
    {
        float _1765 = _1727 ? as_type<float>(_1679) : _1368;
        _1763 = _1765;
    }
    float _1767 = _1763;
    int _1769 = int(_1441) + int(_1697);
    float _1771 = float(_1318);
    float _1773 = trunc(_1665);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    int _1779 = int(_1481) + int(_1739);
    int _1781 = ~_1318;
    int _1783 = _1781 + 1;
    float _1785 = _1743 * _1771;
    float _1787 = float(_1420);
    float _1789 = float(_1386);
    float _1791 = floor(_1631);
    if (!_1659)
    {
        _1673 = _1368;
    }
    float _1793 = _1673;
    float _1795 = -_1757;
    float _1797 = _1651 + _1795;
    float _1799 = _1793;
    if (_1659)
    {
        float _1801 = _1453 ? as_type<float>(_1711) : _1368;
        _1799 = _1801;
    }
    float _1803 = _1799;
    int _1805 = _1783 * _1779;
    int _1807 = _1805 + _1430;
    int _1809 = ~_1324;
    int _1811 = _1809 + 1;
    float _1813 = float(_1430);
    float _1815 = 1.0 / _1753;
    int _1817 = int(_1475) + int(_1777);
    bool _1819 = _1689 >= _1745;
    bool _1821 = isnan(_1689);
    bool _1823 = _1819 || _1821;
    bool _1825 = isnan(_1745);
    bool _1827 = _1823 || _1825;
    float _1829 = float(_1827);
    int _1831 = _1811 * _1769;
    int _1833 = _1831 + _1380;
    bool _1835 = _1813 >= _1771;
    bool _1837 = isnan(_1813);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan(_1771);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = _1771 * _166;
    bool _1849 = uint(_1807) >= uint(_1318);
    float _1851 = trunc(_1691);
    float _1853 = precise::max(_1851, 0.0);
    uint _1855 = uint(_1853);
    float _1857 = -_1791;
    float _1859 = _1631 + _1857;
    float _1861 = float(_1304);
    float _1863 = float(_1338);
    bool _1865 = _1787 >= _1861;
    bool _1867 = isnan(_1787);
    bool _1869 = _1865 || _1867;
    bool _1871 = isnan(_1861);
    bool _1873 = _1869 || _1871;
    float _1875 = float(_1873);
    float _1877 = _1861 * _1859;
    float _1879 = _1815 * _166;
    bool _1881 = uint(_1833) >= uint(_1324);
    float _1883 = _1847 * _1815;
    float _1885 = trunc(_1845);
    int _1887 = int(_1885);
    float _1889 = _1863 * _1879;
    bool _1891 = _1789 >= _1863;
    bool _1893 = isnan(_1789);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan(_1863);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = _1861 * _1879;
    bool _1905 = _1318 == 0;
    float _1907 = _1745 * _1879;
    int _1909 = int(_1451) + int(_1855);
    float _1911 = trunc(_1785);
    int _1913 = int(_1911);
    int _1915 = ~_1304;
    int _1917 = _1915 + 1;
    float _1919 = _1863 * _1797;
    bool _1921 = !_1849;
    int _1923 = _1921 ? 0 : (-1);
    int _1925 = _1701 * _1909;
    int _1927 = _1925 + _1386;
    int _1929 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1931 = _1929 != 0;
    int _1933 = _1917 * _1817;
    int _1935 = _1933 + _1420;
    int _1937 = ~_1779;
    int _1939 = _1937 + _1923;
    int _1941 = _1939 + 1;
    float _1943 = trunc(_1875);
    int _1945 = int(_1943);
    bool _1947 = !_1931;
    int _1949 = _1947 ? 0 : 1;
    bool _1951 = uint(_1927) >= uint(_1338);
    bool _1953 = uint(_1935) >= uint(_1304);
    int _1955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1957 = _1955 != 0;
    float _1959 = trunc(_1829);
    int _1961 = int(_1959);
    bool _1963 = !_1881;
    int _1965 = _1963 ? 0 : (-1);
    int _1967 = abs(_1949);
    int _1969 = ~_1769;
    int _1971 = _1969 + _1965;
    int _1973 = _1971 + 1;
    bool _1975 = !_1951;
    int _1977 = _1975 ? 0 : (-1);
    float _1979 = trunc(_1877);
    int _1981 = int(_1979);
    bool _1983 = !_1953;
    int _1985 = _1983 ? 0 : (-1);
    int _1987 = _1913 * _1967;
    int _1989 = _1987 + _1430;
    bool _1991 = !_1957;
    int _1993 = _1991 ? 0 : 1;
    int _1995 = _1318 * _1941;
    int _1997 = _1995 + _1430;
    int _1999 = ~_1817;
    int _2001 = _1999 + _1985;
    int _2003 = _2001 + 1;
    int _2005 = ~_1909;
    int _2007 = _2005 + _1977;
    int _2009 = _2007 + 1;
    float _2011 = trunc(_1883);
    int _2013 = int(_2011);
    int _2015 = abs(_1993);
    int _2017 = _1304 * _2003;
    int _2019 = _2017 + _1420;
    int _2021 = ~_1887;
    int _2023 = _2021 + 1;
    int _2025 = _2023 + 1;
    int _2027 = _1324 * _1973;
    int _2029 = _2027 + _1380;
    bool _2031 = !_1905;
    int _2033 = _2031 ? _1997 : (-1);
    int _2035 = _1338 * _2009;
    int _2037 = _2035 + _1386;
    int _2039 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _2041 = _2039 != 0;
    float _2043 = trunc(_1755);
    int _2045 = int(_2043);
    int _2047 = _1981 * _2015;
    int _2049 = _2047 + _1420;
    int _2051 = _2033 * _2025;
    bool _2053 = !_2041;
    int _2055 = _2053 ? 0 : 1;
    int _2057 = _1318 + (-1);
    int _2059 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _2061 = _2059 != 0;
    int _2063 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _2065 = _2063 != 0;
    int _2067 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _2069 = _2067 != 0;
    float _2071 = trunc(_1901);
    int _2073 = int(_2071);
    int _2075 = abs(_2055);
    int _2077 = _1887 * _2057;
    int _2079 = _2077 + _2051;
    bool _2081 = _1304 == 0;
    bool _2083 = !_2065;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _2045 * _2075;
    int _2089 = _2087 + _1380;
    bool _2091 = !_2061;
    int _2093 = _2091 ? 0 : 1;
    float _2095 = trunc(_1889);
    int _2097 = int(_2095);
    bool _2099 = _1324 == 0;
    int _2101 = abs(_2085);
    int _2103 = ~_1945;
    int _2105 = _2103 + 1;
    int _2107 = _2105 + 1;
    bool _2109 = !_2081;
    int _2111 = _2109 ? _2019 : (-1);
    int _2113 = _2079 * _2101;
    int _2115 = abs(_2093);
    float _2117 = in.m_73.y;
    int _2119 = ~_1961;
    int _2121 = _2119 + 1;
    int _2123 = _2121 + 1;
    int _2125 = _2107 * _2111;
    bool _2127 = !_2099;
    int _2129 = _2127 ? _2029 : (-1);
    int _2131 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2133 = _2131 != 0;
    int _2135 = _2123 * _2129;
    bool _2137 = !_2069;
    int _2139 = _2137 ? 0 : 1;
    int _2141 = _2013 * _2115;
    int _2143 = _2141 + _2113;
    bool _2145 = !_2133;
    int _2147 = _2145 ? 0 : 1;
    int _2149 = abs(_2139);
    int _2151 = abs(_2147);
    bool _2153 = _1338 == 0;
    int _2155 = _1304 + (-1);
    int _2157 = _1989 * _2149;
    int _2159 = _2157 + _2143;
    int _2161 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2163 = _2161 != 0;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2167 = _2165 != 0;
    int _2169 = ~_2073;
    int _2171 = _2169 + 1;
    int _2173 = _2171 + 1;
    int _2175 = _1913 * _2151;
    int _2177 = _2175 + _2159;
    bool _2179 = !_2153;
    int _2181 = _2179 ? _2037 : (-1);
    int _2183 = _1945 * _2155;
    int _2185 = _2183 + _2125;
    bool _2187 = !_2167;
    int _2189 = _2187 ? 0 : 1;
    float _2191 = trunc(_1903);
    int _2193 = int(_2191);
    float _2195 = float(uint(_2177));
    int _2197 = _2173 * _2181;
    int _2199 = abs(_2189);
    int _2201 = _1324 + (-1);
    float _2203 = as_type<float>(_1432) * _2195;
    bool _2205 = !_2163;
    int _2207 = _2205 ? 0 : 1;
    int _2209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2211 = _2209 != 0;
    int _2213 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2215 = _2213 != 0;
    int _2217 = _1961 * _2201;
    int _2219 = _2217 + _2135;
    int _2221 = abs(_2207);
    int _2223 = _2185 * _2199;
    float _2225 = trunc(_2203);
    float _2227 = precise::max(_2225, 0.0);
    uint _2229 = uint(_2227);
    bool _2231 = !_2211;
    int _2233 = _2231 ? 0 : 1;
    int _2235 = _2193 * _2221;
    int _2237 = _2235 + _2223;
    int _2239 = _1338 + (-1);
    int _2241 = abs(_2233);
    int _2243 = ~_1318;
    int _2245 = _2243 + 1;
    int _2247 = _2073 * _2239;
    int _2249 = _2247 + _2197;
    bool _2251 = !_2215;
    int _2253 = _2251 ? 0 : 1;
    int _2255 = _2049 * _2241;
    int _2257 = _2255 + _2237;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2261 = _2259 != 0;
    int _2263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2265 = _2263 != 0;
    float _2267 = trunc(_1907);
    int _2269 = int(_2267);
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2273 = _2271 != 0;
    int _2275 = _2245 * int(_2229);
    int _2277 = _2275 + _2177;
    int _2279 = abs(_2253);
    bool _2281 = !_2265;
    int _2283 = _2281 ? 0 : 1;
    bool _2285 = !_2273;
    int _2287 = _2285 ? 0 : 1;
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2291 = _2289 != 0;
    int _2293 = _1981 * _2279;
    int _2295 = _2293 + _2257;
    float _2297 = float(uint(_2277));
    int _2299 = abs(_2283);
    float _2301 = trunc(_1919);
    int _2303 = int(_2301);
    bool _2305 = !_2291;
    int _2307 = _2305 ? 0 : 1;
    float _2309 = as_type<float>(_1432) * _2297;
    int _2311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2313 = _2311 != 0;
    int _2315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2317 = _2315 != 0;
    int _2319 = _2219 * _2299;
    int _2321 = abs(_2307);
    bool _2323 = !_2261;
    int _2325 = _2323 ? 0 : 1;
    float _2327 = trunc(_2309);
    float _2329 = precise::max(_2327, 0.0);
    uint _2331 = uint(_2329);
    int _2333 = abs(_2287);
    float _2335 = float(uint(_2295));
    bool _2337 = !_2317;
    int _2339 = _2337 ? 0 : 1;
    int _2341 = abs(_2325);
    float _2343 = as_type<float>(_1364) * _2335;
    int _2345 = abs(_2339);
    float _2347 = trunc(_2343);
    float _2349 = precise::max(_2347, 0.0);
    uint _2351 = uint(_2349);
    int _2353 = _2269 * _2341;
    int _2355 = _2353 + _2319;
    int _2357 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2359 = _2357 != 0;
    int _2361 = _2303 * _2321;
    int _2363 = _2361 + _1386;
    int _2365 = int(_2229) + int(_2331);
    int _2367 = _2249 * _2345;
    int _2369 = ~_1304;
    int _2371 = _2369 + 1;
    int _2373 = _2089 * _2333;
    int _2375 = _2373 + _2355;
    bool _2377 = !_2313;
    int _2379 = _2377 ? 0 : 1;
    bool _2381 = !_2359;
    int _2383 = _2381 ? 0 : 1;
    int _2385 = abs(_2379);
    int _2387 = _2371 * int(_2351);
    int _2389 = _2387 + _2295;
    int _2391 = ~_1318;
    int _2393 = _2391 + 1;
    int _2395 = abs(_2383);
    int _2397 = _2097 * _2385;
    int _2399 = _2397 + _2367;
    int _2401 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2403 = _2401 != 0;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2407 = _2405 != 0;
    float _2409 = float(uint(_2389));
    int _2411 = _2045 * _2395;
    int _2413 = _2411 + _2375;
    bool _2415 = !_2403;
    int _2417 = _2415 ? 0 : 1;
    float _2419 = as_type<float>(_1364) * _2409;
    bool _2421 = !_2407;
    int _2423 = _2421 ? 0 : 1;
    int _2425 = _2393 * _2365;
    int _2427 = _2425 + _2177;
    float _2429 = float(uint(_2413));
    int _2431 = abs(_2417);
    float _2433 = trunc(_2419);
    float _2435 = precise::max(_2433, 0.0);
    uint _2437 = uint(_2435);
    bool _2439 = uint(_2427) >= uint(_1318);
    float _2441 = as_type<float>(_1382) * _2429;
    int _2443 = abs(_2423);
    bool _2445 = !_2439;
    int _2447 = _2445 ? 0 : (-1);
    float _2449 = trunc(_2441);
    float _2451 = precise::max(_2449, 0.0);
    uint _2453 = uint(_2451);
    int _2455 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2457 = _2455 != 0;
    int _2459 = _2363 * _2431;
    int _2461 = _2459 + _2399;
    int _2463 = ~_2365;
    int _2465 = _2463 + _2447;
    int _2467 = _2465 + 1;
    bool _2469 = _1318 == 0;
    int _2471 = _2303 * _2443;
    int _2473 = _2471 + _2461;
    int _2475 = ~_1324;
    int _2477 = _2475 + 1;
    int _2479 = _1318 * _2467;
    int _2481 = _2479 + _2177;
    bool _2483 = _1422 > 0.5;
    float _2485 = in.m_63.w;
    float _2487 = float(uint(_2473));
    bool _2489 = !_2469;
    int _2491 = _2489 ? _2481 : (-1);
    int _2493 = _2385;
    if (_2457)
    {
        float _2495 = -_1368;
        float _2497 = _2495 + 1.0;
        _2493 = as_type<int>(_2497);
    }
    int _2499 = _2493;
    int _2501 = int(_2351) + int(_2437);
    float _2503 = as_type<float>(_1388) * _2487;
    int _2505 = _2491 & 3;
    bool _2507 = _2505 != 0;
    int _2509 = _2477 * int(_2453);
    int _2511 = _2509 + _2413;
    if (_2457)
    {
        float _2513 = _2483 ? as_type<float>(_2499) : _1368;
        _1396 = _2513;
    }
    float _2515 = _1396;
    float _2517 = trunc(_2503);
    float _2519 = precise::max(_2517, 0.0);
    uint _2521 = uint(_2519);
    int _2523 = ~_1304;
    int _2525 = _2523 + 1;
    float _2527 = -_2117;
    float _2529 = _2527 + 1.0;
    bool _2531 = uint(_2505) > 1u;
    float _2533 = float(uint(_2511));
    int _2535 = _2525 * _2501;
    int _2537 = _2535 + _2295;
    int _2539 = _2491 & 3;
    bool _2541 = _2539 != 0;
    int _2543 = _2483 ? as_type<int>(_2529) : as_type<int>(_2117);
    float _2545 = as_type<float>(_1382) * _2533;
    int _2547 = _2541 ? 0 : 1;
    bool _2549 = uint(_2537) >= uint(_1304);
    float _2551 = trunc(_2545);
    float _2553 = precise::max(_2551, 0.0);
    uint _2555 = uint(_2553);
    int _2557 = ~_1338;
    int _2559 = _2557 + 1;
    int _2561 = ~_2547;
    int _2563 = _2561 + 1;
    int _2565 = _2563 + 1;
    int _2567 = _2565;
    if (!_2531)
    {
        int _2569 = ~_2547;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    int _2575 = _2559 * int(_2521);
    int _2577 = _2575 + _2473;
    bool _2579 = !_2549;
    int _2581 = _2579 ? 0 : (-1);
    bool _2583 = _2505 != 3;
    int _2585 = ~_2501;
    int _2587 = _2585 + _2581;
    int _2589 = _2587 + 1;
    float _2591 = float(uint(_2577));
    bool _2593 = uint(_2505) >= 2u;
    int _2595 = _1304 * _2589;
    int _2597 = _2595 + _2295;
    bool _2599 = _1304 == 0;
    float _2601 = as_type<float>(_1388) * _2591;
    int _2603 = _2593 ? 0 : 1;
    bool _2605 = _2485 > 0.5;
    int _2607 = ~_1324;
    int _2609 = _2607 + 1;
    float _2611 = trunc(_2601);
    float _2613 = precise::max(_2611, 0.0);
    uint _2615 = uint(_2613);
    int _2617 = int(_2453) + int(_2555);
    bool _2619 = !_2599;
    int _2621 = _2619 ? _2597 : (-1);
    int _2623 = ~_2603;
    int _2625 = _2623 + 1;
    int _2627 = _2625 + 1;
    int _2629 = _2609 * _2617;
    int _2631 = _2629 + _2413;
    int _2633 = _2627;
    if (_2583)
    {
        int _2635 = ~_2603;
        int _2637 = _2635 + 1;
        _2633 = _2637;
    }
    int _2639 = _2633;
    int _2641 = _2605 ? as_type<int>(_2529) : as_type<int>(_2117);
    int _2643 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2645 = _2643 != 0;
    int _2647 = _2621 & 3;
    bool _2649 = _2647 != 0;
    bool _2651 = !_2645;
    int _2653 = _2651 ? 0 : 1;
    bool _2655 = uint(_2647) >= 2u;
    int _2657 = _2649 ? 0 : 1;
    bool _2659 = uint(_2631) >= uint(_1324);
    int _2661 = _2655 ? 0 : 1;
    bool _2663 = _2647 != 3;
    bool _2665 = !_2659;
    int _2667 = _2665 ? 0 : (-1);
    int _2669 = ~_1338;
    int _2671 = _2669 + 1;
    bool _2673 = uint(_2647) > 1u;
    int _2675 = ~_2617;
    int _2677 = _2675 + _2667;
    int _2679 = _2677 + 1;
    int _2681 = int(_2521) + int(_2615);
    int _2683 = _1324 * _2679;
    int _2685 = _2683 + _2413;
    bool _2687 = _1324 == 0;
    int _2689 = ~_2661;
    int _2691 = _2689 + 1;
    int _2693 = _2691 + 1;
    int _2695 = _2671 * _2681;
    int _2697 = _2695 + _2473;
    int _2699 = _2693;
    if (_2663)
    {
        int _2701 = ~_2661;
        int _2703 = _2701 + 1;
        _2699 = _2703;
    }
    int _2705 = _2699;
    int _2707 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2709 = _2707 != 0;
    int _2711 = ~_2657;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    bool _2717 = !_2687;
    int _2719 = _2717 ? _2685 : (-1);
    int _2721 = _2715;
    if (!_2673)
    {
        int _2723 = ~_2657;
        int _2725 = _2723 + 1;
        _2721 = _2725;
    }
    int _2727 = _2721;
    bool _2729 = uint(_2697) >= uint(_1338);
    bool _2731 = !_2709;
    int _2733 = _2731 ? 0 : 1;
    int _2735 = _2719 & 3;
    bool _2737 = _2735 != 0;
    bool _2739 = !_2729;
    int _2741 = _2739 ? 0 : (-1);
    int _2743 = _2737 ? 0 : 1;
    bool _2745 = uint(_2735) >= 2u;
    bool _2747 = _2735 != 3;
    int _2749 = ~_2681;
    int _2751 = _2749 + _2741;
    int _2753 = _2751 + 1;
    int _2755 = _2745 ? 0 : 1;
    bool _2757 = uint(_2735) > 1u;
    int _2759 = _1338 * _2753;
    int _2761 = _2759 + _2473;
    bool _2763 = _1338 == 0;
    int _2765 = ~_2755;
    int _2767 = _2765 + 1;
    int _2769 = _2767 + 1;
    bool _2771 = !_2763;
    int _2773 = _2771 ? _2761 : (-1);
    int _2775 = _2769;
    if (_2747)
    {
        int _2777 = ~_2755;
        int _2779 = _2777 + 1;
        _2775 = _2779;
    }
    int _2781 = _2775;
    int _2783 = _2773 & 3;
    bool _2785 = _2783 != 0;
    int _2787 = ~_2743;
    int _2789 = _2787 + 1;
    int _2791 = _2789 + 1;
    int _2793 = _2791;
    if (!_2757)
    {
        int _2795 = ~_2743;
        int _2797 = _2795 + 1;
        _2793 = _2797;
    }
    int _2799 = _2793;
    bool _2801 = uint(_2783) >= 2u;
    int _2803 = _2785 ? 0 : 1;
    int _2805 = _2801 ? 0 : 1;
    bool _2807 = _2783 != 3;
    bool _2809 = uint(_2783) > 1u;
    int _2811 = ~_2805;
    int _2813 = _2811 + 1;
    int _2815 = _2813 + 1;
    int _2817 = ~_2803;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    float _2823 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2825 = _2823 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2827 = _2815;
    int _2829 = _2821;
    if (_2807)
    {
        int _2831 = ~_2805;
        int _2833 = _2831 + 1;
        _2827 = _2833;
    }
    int _2835 = _2827;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    if (!_2809)
    {
        int _2841 = ~_2803;
        int _2843 = _2841 + 1;
        _2829 = _2843;
    }
    int _2845 = _2829;
    float _2847 = 1.0 / _2825;
    float _2849 = in.m_48.x;
    float _2851 = in.m_48.y;
    float _2853 = in.m_48.z;
    int _2855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2857 = _2855 != 0;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2861 = _2859 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2865 = _2863 != 0;
    bool _2867 = !_2857;
    int _2869 = _2867 ? 0 : 1;
    float _2871 = _2865 ? as_type<float>(_2543) : _2117;
    float _2873 = 1.0 / _2839;
    int _2875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2877 = _2875 != 0;
    bool _2879 = _1581 > 0.5;
    float _2881 = _2877 ? as_type<float>(_2641) : _2117;
    int _2883 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2885 = _2883 != 0;
    float _2887 = 1.0 / _2861;
    int _2889 = _2879 ? as_type<int>(_2529) : as_type<int>(_2117);
    int _2891 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2893 = _2891 != 0;
    float _2895 = _2885 ? as_type<float>(_2889) : _2117;
    float _2897 = _2893 ? as_type<float>(_2889) : _2117;
    float _2899 = _198 * _2851;
    int _2901 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2903 = _2901 != 0;
    int _2905 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2907 = _2905 != 0;
    float _2909 = _204 * _2851;
    int _2911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2913 = _2911 != 0;
    float _2915 = _210 * _2851;
    float _2917 = fma(_196, _2849, _2899);
    float _2919 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2921 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2923 = _2921 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2925 = fma(_202, _2849, _2909);
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2929 = fma(_208, _2849, _2915);
    float _2931 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2933 = _2931 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2935 = fma(_200, _2853, _2917);
    float _2937 = fma(_2919, -2.0, _2927);
    float _2939 = _1571 * 2.0;
    float _2941 = 1.0 / _2933;
    float _2943 = fma(_206, _2853, _2925);
    float _2945 = fma(_212, _2853, _2929);
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2949 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2947;
    float _2951 = floor(_2939);
    float _2953 = _2903 ? as_type<float>(_2889) : _2117;
    float _2955 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2957 = _2955 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2959 = _2907 ? as_type<float>(_2889) : _2117;
    float _2961 = _2949 * _2847;
    bool _2963 = !_2913;
    int _2965 = _2963 ? 0 : 1;
    float _2967 = _2935 + _1713;
    float _2969 = float(uint(_2049));
    float _2971 = 1.0 / _2923;
    float _2973 = float(uint(_2089));
    float _2975 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2937);
    int _2977 = ~_1304;
    int _2979 = _2977 + 1;
    float _2981 = float(uint(_2363));
    float _2983 = as_type<float>(_1382) * _2973;
    bool _2985 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2987 = isnan(_1232);
    bool _2989 = _2985 || _2987;
    bool _2991 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2993 = _2989 || _2991;
    float _2995 = float(_2993);
    float _2997 = 1.0 / _2957;
    float _2999 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _3001 = _2999 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3003 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _3003;
    bool _3007 = _2951 > 0.0;
    float _3009 = as_type<float>(_1388) * _2981;
    float _3011 = _3001 * _2873;
    float _3013 = _3005 * _2887;
    float _3015 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3017 = _3015 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _3019 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3021 = _3019 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _3023 = _2951 >= 0.0;
    bool _3025 = isnan(_2951);
    bool _3027 = _3023 || _3025;
    bool _3029 = isnan(0.0);
    bool _3031 = _3027 || _3029;
    float _3033 = 1.0 / _3017;
    float _3035 = _3021 * _2941;
    float _3037 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _3039 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _3037;
    int _3041 = _3031 ? 0 : 1;
    float _3043 = fma(_3013, _1717, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3045 = _3039 * _2971;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3049 = _3047 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3051 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _3053 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _3051;
    float _3055 = _1422 * 2.0;
    float _3057 = float(uint(_1989));
    float _3059 = _3049 * _2997;
    int _3061 = ~_3041;
    int _3063 = _3061 + 1;
    int _3065 = _3063 + 1;
    float _3067 = floor(_3055);
    int _3069 = _3065;
    float _3071 = (*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _3073 = _2873;
    float _3075 = _2997;
    if (!_3007)
    {
        int _3077 = ~_3041;
        int _3079 = _3077 + 1;
        _3069 = _3079;
    }
    int _3081 = _3069;
    float _3083 = _3053 * _3033;
    bool _3085 = !_1703;
    float _3087 = _3085 ? as_type<float>(_1583) : as_type<float>(_1585);
    float _3089 = as_type<float>(_1432) * _3057;
    float _3091 = _3033;
    if (!_1703)
    {
        _3071 = _1422;
    }
    float _3093 = _3071;
    float _3095 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3097 = _1232 + _3095;
    float _3099 = _3093;
    if (!_1703)
    {
        _3073 = _1422;
    }
    float _3101 = _3073;
    float _3103 = trunc(_3089);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    float _3109 = _3101;
    if (!_1703)
    {
        _3075 = _1581;
    }
    float _3111 = _3075;
    float _3113 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3115 = _1232 + _3113;
    float _3117 = _3111;
    if (!_1703)
    {
        _3091 = _1581;
    }
    float _3119 = _3091;
    bool _3121 = _1587 != 2;
    bool _3123 = !_1703;
    float _3125 = _3123 ? as_type<float>(_1585) : as_type<float>(_1589);
    float _3127 = fma(_3011, _3115, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3129 = _3119;
    float _3131 = _3127;
    if (_1703)
    {
        _3099 = _1571;
    }
    float _3133 = _3099;
    float _3135 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3137 = _1232 + _3135;
    if (_1703)
    {
        _3109 = _1571;
    }
    float _3139 = _3109;
    float _3141 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3143 = _1232 + _3141;
    if (_1703)
    {
        _3117 = _1422;
    }
    float _3145 = _3117;
    float _3147 = _3133 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1703)
    {
        _3129 = _1422;
    }
    float _3149 = _3129;
    bool _3151 = _3067 > 0.0;
    int _3153 = _1721 * int(_3107);
    int _3155 = _3153 + _1989;
    bool _3157 = _3067 >= 0.0;
    bool _3159 = isnan(_3067);
    bool _3161 = _3157 || _3159;
    bool _3163 = isnan(0.0);
    bool _3165 = _3161 || _3163;
    float _3167 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3169 = _1232 + _3167;
    bool _3171 = _2783 != 3;
    float _3173 = float(uint(_3155));
    float _3175 = fma(_2961, _3169, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3177 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3179 = _1232 + _3177;
    float _3181 = as_type<float>(_1432) * _3173;
    float _3183 = fma(_3035, _3179, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3185 = fma(_3059, _3097, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _3187 = fma(_3083, _3143, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3189 = _2943 + _1747;
    float _3191 = as_type<float>(_1364) * _2969;
    bool _3193 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3195 = isnan(_1232);
    bool _3197 = _3193 || _3195;
    bool _3199 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3201 = _3197 || _3199;
    float _3203 = float(_3201);
    float _3205 = fma(_3045, _3137, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    bool _3207 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3209 = isnan(_1232);
    bool _3211 = _3207 || _3209;
    bool _3213 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3215 = _3211 || _3213;
    float _3217 = float(_3215);
    float _3219 = trunc(_3181);
    float _3221 = precise::max(_3219, 0.0);
    uint _3223 = uint(_3221);
    bool _3225 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3227 = isnan(_1232);
    bool _3229 = _3225 || _3227;
    bool _3231 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3233 = _3229 || _3231;
    float _3235 = float(_3233);
    float _3237 = -_3203;
    float _3239 = _3237 + 1.0;
    bool _3241 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3243 = isnan(_1232);
    bool _3245 = _3241 || _3243;
    bool _3247 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3249 = _3245 || _3247;
    float _3251 = float(_3249);
    float _3253 = -_3217;
    float _3255 = _3253 + 1.0;
    bool _3257 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3259 = isnan(_1232);
    bool _3261 = _3257 || _3259;
    bool _3263 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3265 = _3261 || _3263;
    float _3267 = float(_3265);
    float _3269 = _3217 * _3239;
    bool _3271 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3273 = isnan(_1232);
    bool _3275 = _3271 || _3273;
    bool _3277 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3279 = _3275 || _3277;
    float _3281 = float(_3279);
    float _3283 = trunc(_3191);
    float _3285 = precise::max(_3283, 0.0);
    uint _3287 = uint(_3285);
    float _3289 = _3235 * _3255;
    float _3291 = -_3235;
    float _3293 = _3291 + 1.0;
    bool _3295 = _1232 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3297 = isnan(_1232);
    bool _3299 = _3295 || _3297;
    bool _3301 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3303 = _3299 || _3301;
    float _3305 = float(_3303);
    float _3307 = -_3281;
    float _3309 = _3307 + 1.0;
    float _3311 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _3313 = _3281 * _3293;
    int _3315 = abs(_2799);
    float _3317 = trunc(_2983);
    float _3319 = precise::max(_3317, 0.0);
    uint _3321 = uint(_3319);
    float _3323 = _2995 * _3309;
    float _3325 = -_2995;
    float _3327 = _3325 + 1.0;
    int _3329 = ~_3315;
    int _3331 = _3329 + 1;
    int _3333 = _3331 + 1;
    int _3335 = abs(_2781);
    float _3337 = _3251 * _3327;
    float _3339 = -_3251;
    float _3341 = _3339 + 1.0;
    int _3343 = _2979 * int(_3287);
    int _3345 = _3343 + _2049;
    int _3347 = ~_1338;
    int _3349 = _3347 + 1;
    int _3351 = ~_1324;
    int _3353 = _3351 + 1;
    float _3355 = _3267 * _3341;
    float _3357 = float(uint(_3345));
    float _3359 = trunc(_3009);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    int _3365 = _3353 * int(_3321);
    int _3367 = _3365 + _2089;
    int _3369 = ~_3335;
    int _3371 = _3369 + 1;
    int _3373 = _3371 + 1;
    float _3375 = as_type<float>(_1364) * _3357;
    float _3377 = -_3267;
    float _3379 = _3377 + 1.0;
    int _3381 = abs(_2965);
    float _3383 = float(uint(_3367));
    float _3385 = _3305 * _3379;
    float _3387 = trunc(_3375);
    float _3389 = precise::max(_3387, 0.0);
    uint _3391 = uint(_3389);
    float _3393 = -_3305;
    float _3395 = _3393 + 1.0;
    float _3397 = _3175 * _3385;
    float _3399 = as_type<float>(_1382) * _3383;
    int _3401 = _3165 ? 0 : 1;
    int _3403 = _3349 * int(_3363);
    int _3405 = _3403 + _2363;
    float _3407 = fma(_3395, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3397);
    float _3409 = trunc(_3399);
    float _3411 = precise::max(_3409, 0.0);
    uint _3413 = uint(_3411);
    int _3415 = ~_1318;
    int _3417 = _3415 + 1;
    float _3419 = float(uint(_3405));
    float _3421 = _2945 + _1761;
    int _3423 = int(_3107) + int(_3223);
    float _3425 = fma(_3127, _3355, _3407);
    int _3427 = ~_1304;
    int _3429 = _3427 + 1;
    float _3431 = as_type<float>(_1388) * _3419;
    int _3433 = int(_3287) + int(_3391);
    int _3435 = _3417 * _3423;
    int _3437 = _3435 + _1989;
    float _3439 = fma(_3043, _3337, _3425);
    int _3441 = ~_3401;
    int _3443 = _3441 + 1;
    int _3445 = _3443 + 1;
    float _3447 = trunc(_3431);
    float _3449 = precise::max(_3447, 0.0);
    uint _3451 = uint(_3449);
    int _3453 = _3445;
    float _3455 = as_type<float>(_3423);
    float _3457 = _3425;
    if (!_3151)
    {
        int _3459 = ~_3401;
        int _3461 = _3459 + 1;
        _3453 = _3461;
    }
    int _3463 = _3453;
    float _3465 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3467 = _3189 + _3465;
    bool _3469 = uint(_3437) >= uint(_1318);
    int _3471 = _3429 * _3433;
    int _3473 = _3471 + _2049;
    int _3475 = int(_3321) + int(_3413);
    float _3477 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3479 = _2967 + _3477;
    int _3481 = ~_1324;
    int _3483 = _3481 + 1;
    float _3485 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    bool _3487 = !_3469;
    int _3489 = _3487 ? 0 : (-1);
    float _3491 = fma(_3183, _3323, _3439);
    int _3493 = ~_1338;
    int _3495 = _3493 + 1;
    int _3497 = _3483 * _3475;
    int _3499 = _3497 + _2089;
    bool _3501 = uint(_3473) >= uint(_1304);
    float _3503 = _3467 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3505 = fma(_3205, _3313, _3491);
    int _3507 = int(_3363) + int(_3451);
    float _3509 = _1571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3511 = !_3501;
    int _3513 = _3511 ? 0 : (-1);
    float _3515 = fma(_3479, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3503);
    bool _3517 = uint(_3499) >= uint(_1324);
    int _3519 = _3495 * _3507;
    int _3521 = _3519 + _2363;
    float _3523 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3525 = _3421 + _3523;
    float _3527 = _3485 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    bool _3529 = !_3517;
    int _3531 = _3529 ? 0 : (-1);
    float _3533 = fma(_3525, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3515);
    bool _3535 = uint(_3521) >= uint(_1338);
    float _3537 = _1581 * 2.0;
    float _3539 = fma(_3527, _1469, -0.5);
    bool _3541 = !_3535;
    int _3543 = _3541 ? 0 : (-1);
    bool _3545 = _3533 >= 0.0;
    float _3547 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _3549 = floor(_3537);
    float _3551 = -_3547;
    float _3553 = fma(_3509, 2.0, _3551);
    float _3555 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3557 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3559 = _1422 + _1571;
    float _3561 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _3563 = fma(as_type<float>(_1589), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3555);
    float _3565 = as_type<float>(_1589) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3567 = fma(as_type<float>(_1585), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3557);
    float _3569 = as_type<float>(_1585) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    int _3571 = ~_3423;
    int _3573 = _3571 + _3489;
    int _3575 = _3573 + 1;
    float _3577 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3563);
    float _3579 = fma(_3569, -2.0, _3561);
    if (_3545)
    {
        _3455 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3581 = _3455;
    float _3583 = _3559 + (-1.0);
    float _3585 = fma(_3185, _3289, _3505);
    bool _3587 = _3549 >= 0.0;
    bool _3589 = isnan(_3549);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan(0.0);
    bool _3595 = _3591 || _3593;
    int _3597 = as_type<int>(_3581);
    if (_3545)
    {
        float _3599 = _3581 * 5.0;
        _3597 = as_type<int>(_3599);
    }
    int _3601 = _3597;
    int _3603 = _1318 * _3575;
    int _3605 = _3603 + _1989;
    float _3607 = fma(_3187, _3269, _3585);
    if (_3545)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _12035 = as_type<float>(_3601);
        out.gl_Position.z = _12035;
    }
    if (_3121)
    {
        _3131 = _1571;
    }
    float _3609 = _3131;
    float _3611 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _3613 = _3609;
    if (_3121)
    {
        _3457 = _1422;
    }
    float _3615 = _3457;
    float _3617 = fma(_3203, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3607);
    float _3619 = _3615;
    if (!_3121)
    {
        _3613 = _1581;
    }
    float _3621 = _3613;
    float _3623 = -_3611;
    float _3625 = fma(_3565, 2.0, _3623);
    if (!_3121)
    {
        _3619 = _1571;
    }
    float _3627 = _3619;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _3631 = _3549 > 0.0;
    out.m_75.x = _3617;
    float _3633 = _3467 * _3467;
    float _3635 = fma(_3149, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3629);
    bool _3637 = !_2507;
    int _3639 = _3637 ? 0 : 1;
    float _3641 = fma(_3479, _3479, _3633);
    float _3643 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    float _3645 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    int _3647 = _2621 & 3;
    bool _3649 = _3647 != 0;
    float _3651 = fma(_3525, _3525, _3641);
    int _3653 = _2621 >> 31;
    float _3655 = fma(_3125, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3645);
    float _3657 = _3125 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    float _3659 = rsqrt(_3651);
    bool _3661 = !_3649;
    int _3663 = _3661 ? 0 : 1;
    float _3665 = _3627 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _3667 = -_3643;
    float _3669 = fma(_3657, 2.0, _3667);
    int _3671 = _2491 >> 31;
    float _3673 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3567);
    int _3675 = _2719 & 3;
    bool _3677 = _3675 != 0;
    float _3679 = -_166;
    float _3681 = fma(_3679, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3553);
    int _3683 = _3653 & 3;
    float _3685 = -_166;
    float _3687 = fma(_3685, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3625);
    int _3689 = _3671 & 3;
    float _3691 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3579);
    int _3693 = _2719 >> 31;
    float _3695 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3635);
    int _3697 = _2491 + _3689;
    float _3699 = -_166;
    float _3701 = fma(_3699, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3669);
    int _3703 = _3693 & 3;
    float _3705 = _3467 * _3659;
    bool _3707 = !_3677;
    int _3709 = _3707 ? 0 : 1;
    float _3711 = _3479 * _3659;
    int _3713 = _3697 >> 2;
    float _3715 = -_3705;
    float _3717 = fma(_3715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3467);
    int _3719 = _2773 & 3;
    bool _3721 = _3719 != 0;
    float _3723 = -_3711;
    float _3725 = fma(_3723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3479);
    int _3727 = _2719 + _3703;
    float _3729 = _3717 * _3717;
    int _3731 = _2773 >> 31;
    float _3733 = _3681;
    if (_3545)
    {
        out.m_51.x = 0.0;
    }
    int _3735 = _3713 << 4;
    int _3737 = _3735 + 368;
    float _3739 = fma(_3725, _3725, _3729);
    bool _3741 = !_3721;
    int _3743 = _3741 ? 0 : 1;
    bool _3745 = _2505 != 3;
    int _3747 = _2621 + _3683;
    int _3749 = _3727 >> 2;
    int _3751 = _3731 & 3;
    uint _3753 = uint(int(uint(_3737) >> uint(2)));
    uint _3755 = uint(int(uint(int(_3753)) >> uint(2)));
    int _3757 = int(_3753) & 3;
    float _3759 = (*spvDescriptorSet0.vp_c9)._m0[int(_3755)][_3757];
    int _3761 = int(_3753) + 1;
    uint _3763 = uint(int(uint(_3761) >> uint(2)));
    int _3765 = _3761 & 3;
    float _3767 = (*spvDescriptorSet0.vp_c9)._m0[int(_3763)][_3765];
    int _3769 = ~_3433;
    int _3771 = _3769 + _3513;
    int _3773 = _3771 + 1;
    bool _3775 = !_3745;
    int _3777 = _3775 ? 0 : (-1);
    bool _3779 = _2647 != 3;
    int _3781 = _1304 * _3773;
    int _3783 = _3781 + _2049;
    int _3785 = _2773 + _3751;
    float _3787 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3789 = int(_3787);
    int _3791 = _3747 >> 2;
    int _3793 = _3785 >> 2;
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3797 = !_3779;
    int _3799 = _3797 ? 0 : (-1);
    bool _3801 = _2735 != 3;
    float _3803 = -_3795;
    float _3805 = fma(_3147, 2.0, _3803);
    int _3807 = _3791 << 4;
    int _3809 = _3807 + 512;
    float _3811 = _3145 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3813 = _3793 << 4;
    int _3815 = _3813 + 800;
    float _3817 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3819 = int(_3817);
    bool _3821 = !_2469;
    int _3823 = _3821 ? _3605 : (-1);
    uint _3825 = uint(int(uint(_3809) >> uint(2)));
    uint _3827 = uint(int(uint(int(_3825)) >> uint(2)));
    int _3829 = int(_3825) & 3;
    float _3831 = (*spvDescriptorSet0.vp_c9)._m0[int(_3827)][_3829];
    int _3833 = int(_3825) + 1;
    uint _3835 = uint(int(uint(_3833) >> uint(2)));
    int _3837 = _3833 & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    bool _3841 = !_2599;
    int _3843 = _3841 ? _3783 : (-1);
    float _3845 = -_166;
    float _3847 = fma(_3845, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3805);
    bool _3849 = !_3171;
    int _3851 = _3849 ? 0 : (-1);
    int _3853 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3855 = _3853 != 0;
    int _3857 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3859 = _3857 != 0;
    int _3861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3863 = _3861 != 0;
    uint _3865 = uint(int(uint(_3815) >> uint(2)));
    uint _3867 = uint(int(uint(int(_3865)) >> uint(2)));
    int _3869 = int(_3865) & 3;
    float _3871 = (*spvDescriptorSet0.vp_c9)._m0[int(_3867)][_3869];
    int _3873 = int(_3865) + 1;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    int _3877 = _3873 & 3;
    float _3879 = (*spvDescriptorSet0.vp_c9)._m0[int(_3875)][_3877];
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3883 = _3595 ? 0 : 1;
    float _3885 = fma(_3583, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3887 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    float _3889 = fma(_3811, -2.0, _3881);
    float _3891 = _3621 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3893 = ~_3883;
    int _3895 = _3893 + 1;
    int _3897 = _3895 + 1;
    float _3899 = fma(_3087, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3887);
    float _3901 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    float _3903 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    int _3905 = _3749 << 4;
    int _3907 = _3905 + 656;
    float _3909 = -_3311;
    float _3911 = fma(_3891, 2.0, _3909);
    int _3913 = _3897;
    float _3915 = _3885;
    if (!_3631)
    {
        int _3917 = ~_3883;
        int _3919 = _3917 + 1;
        _3913 = _3919;
    }
    int _3921 = _3913;
    float _3923 = fma(_3901, -2.0, _3903);
    int _3925 = ~_3475;
    int _3927 = _3925 + _3531;
    int _3929 = _3927 + 1;
    uint _3931 = uint(int(uint(_3907) >> uint(2)));
    uint _3933 = uint(int(uint(int(_3931)) >> uint(2)));
    int _3935 = int(_3931) & 3;
    float _3937 = (*spvDescriptorSet0.vp_c9)._m0[int(_3933)][_3935];
    int _3939 = int(_3931) + 1;
    uint _3941 = uint(int(uint(_3939) >> uint(2)));
    int _3943 = _3939 & 3;
    float _3945 = (*spvDescriptorSet0.vp_c9)._m0[int(_3941)][_3943];
    int _3947 = abs(_2727);
    float _3949 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3923);
    int _3951 = _1324 * _3929;
    int _3953 = _3951 + _2089;
    int _3955 = ~_3507;
    int _3957 = _3955 + _3543;
    int _3959 = _3957 + 1;
    float _3961 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3889);
    int _3963 = abs(_3663);
    int _3965 = _3737 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    float _3983 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    int _3985 = _1338 * _3959;
    int _3987 = _3985 + _2363;
    int _3989 = abs(_3743);
    float _3991 = -_166;
    float _3993 = fma(_3991, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3911);
    float _3995 = fma(_3665, -2.0, _3983);
    int _3997 = abs(_2573);
    int _3999 = _3809 + 8;
    uint _4001 = uint(int(uint(_3999) >> uint(2)));
    uint _4003 = uint(int(uint(int(_4001)) >> uint(2)));
    int _4005 = int(_4001) & 3;
    float _4007 = (*spvDescriptorSet0.vp_c9)._m0[int(_4003)][_4005];
    int _4009 = int(_4001) + 1;
    uint _4011 = uint(int(uint(_4009) >> uint(2)));
    int _4013 = _4009 & 3;
    float _4015 = (*spvDescriptorSet0.vp_c9)._m0[int(_4011)][_4013];
    int _4017 = ~_3947;
    int _4019 = _4017 + 1;
    int _4021 = _4019 + 1;
    float _4023 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _4025 = int(_4023);
    int _4027 = ~_3997;
    int _4029 = _4027 + 1;
    int _4031 = _4029 + 1;
    float _4033 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3995);
    int _4035 = _4021 * as_type<int>(_3839);
    bool _4037 = !_3801;
    int _4039 = _4037 ? 0 : (-1);
    int _4041 = _3907 + 8;
    uint _4043 = uint(int(uint(_4041) >> uint(2)));
    uint _4045 = uint(int(uint(int(_4043)) >> uint(2)));
    int _4047 = int(_4043) & 3;
    float _4049 = (*spvDescriptorSet0.vp_c9)._m0[int(_4045)][_4047];
    int _4051 = int(_4043) + 1;
    uint _4053 = uint(int(uint(_4051) >> uint(2)));
    int _4055 = _4051 & 3;
    float _4057 = (*spvDescriptorSet0.vp_c9)._m0[int(_4053)][_4055];
    int _4059 = _4031 * as_type<int>(_3767);
    int _4061 = abs(_3639);
    float _4063 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _4065 = abs(_3709);
    int _4067 = abs(_2845);
    float _4069 = fma(_3139, (*spvDescriptorSet0.vp_c9)._m0[83].z, _4063);
    int _4071 = _3815 + 8;
    uint _4073 = uint(int(uint(_4071) >> uint(2)));
    uint _4075 = uint(int(uint(int(_4073)) >> uint(2)));
    int _4077 = int(_4073) & 3;
    float _4079 = (*spvDescriptorSet0.vp_c9)._m0[int(_4075)][_4077];
    int _4081 = int(_4073) + 1;
    uint _4083 = uint(int(uint(_4081) >> uint(2)));
    int _4085 = _4081 & 3;
    float _4087 = (*spvDescriptorSet0.vp_c9)._m0[int(_4083)][_4085];
    float _4089 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4091 = int(_4089);
    float _4093 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[82].z, _4069);
    int _4095 = ~_4067;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    int _4101 = ~_3963;
    int _4103 = _4101 + 1;
    int _4105 = _4103 + 1;
    int _4107 = ~_3989;
    int _4109 = _4107 + 1;
    int _4111 = _4109 + 1;
    int _4113 = _4099 * as_type<int>(_3879);
    int _4115 = ~_4061;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    int _4121 = _4105 * as_type<int>(_3831);
    int _4123 = _4121 + _4035;
    int _4125 = abs(_2639);
    int _4127 = _4111 * as_type<int>(_3871);
    int _4129 = _4127 + _4113;
    int _4131 = abs(_2705);
    int _4133 = _4119 * as_type<int>(_3759);
    int _4135 = _4133 + _4059;
    int _4137 = abs(_3777);
    int _4139 = _3333 * as_type<int>(_3945);
    int _4141 = ~_4125;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    float _4147 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4149 = log2(_4147);
    int _4151 = ~_4131;
    int _4153 = _4151 + 1;
    int _4155 = _4153 + 1;
    int _4157 = ~_4137;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4145 * as_type<int>(_3973);
    int _4165 = _4163 + _4135;
    int _4167 = ~_4065;
    int _4169 = _4167 + 1;
    int _4171 = _4169 + 1;
    float _4173 = float(uint(_3789));
    int _4175 = _4161 * as_type<int>(_3981);
    int _4177 = _4175 + _4165;
    int _4179 = abs(_2835);
    int _4181 = _4171 * as_type<int>(_3937);
    int _4183 = _4181 + _4139;
    int _4185 = abs(_4039);
    int _4187 = _4155 * as_type<int>(_4007);
    int _4189 = _4187 + _4123;
    int _4191 = abs(_2653);
    float _4193 = 1.0 / _4173;
    float _4195 = float(uint(_4091));
    int _4197 = ~_4191;
    int _4199 = _4197 + 1;
    int _4201 = _4199 + 1;
    int _4203 = ~_4179;
    int _4205 = _4203 + 1;
    int _4207 = _4205 + 1;
    int _4209 = _3373 * as_type<int>(_4049);
    int _4211 = _4209 + _4183;
    int _4213 = abs(_3799);
    int _4215 = _4177 * _4201;
    float _4217 = 1.0 / _4195;
    float _4219 = float(uint(_3819));
    int _4221 = _3823 * _4191;
    int _4223 = _4221 + _4215;
    int _4225 = abs(_2733);
    int _4227 = _4207 * as_type<int>(_4079);
    int _4229 = _4227 + _4129;
    int _4231 = abs(_2869);
    float _4233 = _4149 * _166;
    int _4235 = ~_4225;
    int _4237 = _4235 + 1;
    int _4239 = _4237 + 1;
    float _4241 = 1.0 / _4219;
    int _4243 = ~_4213;
    int _4245 = _4243 + 1;
    int _4247 = _4245 + 1;
    int _4249 = ~_4185;
    int _4251 = _4249 + 1;
    int _4253 = _4251 + 1;
    float _4255 = float(uint(_4025));
    int _4257 = _4247 * as_type<int>(_4015);
    int _4259 = _4257 + _4189;
    int _4261 = ~_4231;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    int _4267 = _4253 * as_type<int>(_4057);
    int _4269 = _4267 + _4211;
    bool _4271 = _1324 == 0;
    int _4273 = _4239 * _4259;
    int _4275 = abs(_3851);
    float _4277 = 1.0 / _4255;
    bool _4279 = !_4271;
    int _4281 = _4279 ? _3953 : (-1);
    int _4283 = _3843 * _4225;
    int _4285 = _4283 + _4273;
    int _4287 = ~_4275;
    int _4289 = _4287 + 1;
    int _4291 = _4289 + 1;
    int _4293 = _4265 * _4269;
    int _4295 = as_type<int>(_4217) + (-2);
    float _4297 = float(uint(_4285));
    int _4299 = _4281 * _4231;
    int _4301 = _4299 + _4293;
    int _4303 = as_type<int>(_4193) + (-2);
    int _4305 = _4291 * as_type<int>(_4087);
    int _4307 = _4305 + _4229;
    float _4309 = float(uint(_4223));
    float _4311 = as_type<float>(_4295) * _4297;
    float _4313 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _4315 = as_type<int>(_4241) + (-2);
    float _4317 = as_type<float>(_4303) * _4309;
    float _4319 = float(uint(_4301));
    int _4321 = ~_3381;
    int _4323 = _4321 + 1;
    int _4325 = _4323 + 1;
    bool _4327 = _1338 == 0;
    float _4329 = trunc(_4317);
    float _4331 = precise::max(_4329, 0.0);
    uint _4333 = uint(_4331);
    int _4335 = as_type<int>(_4277) + (-2);
    float _4337 = as_type<float>(_4315) * _4319;
    bool _4339 = !_4327;
    int _4341 = _4339 ? _3987 : (-1);
    int _4343 = _4325 * _4307;
    int _4345 = ~_3789;
    int _4347 = _4345 + 1;
    int _4349 = ~_3819;
    int _4351 = _4349 + 1;
    float _4353 = trunc(_4311);
    float _4355 = precise::max(_4353, 0.0);
    uint _4357 = uint(_4355);
    int _4359 = _4341 * _3381;
    int _4361 = _4359 + _4343;
    float _4363 = _4313 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4365 = abs(_3789);
    float _4367 = _3525 * _3659;
    float _4369 = float(uint(_4361));
    float _4371 = fma(_4363, _2953, -0.5);
    float _4373 = trunc(_4337);
    float _4375 = precise::max(_4373, 0.0);
    uint _4377 = uint(_4375);
    int _4379 = ~_4091;
    int _4381 = _4379 + 1;
    int _4383 = _4347 * int(_4333);
    int _4385 = _4383 + _4223;
    float _4387 = as_type<float>(_4335) * _4369;
    float _4389 = float(uint(_4365));
    float _4391 = -_4367;
    float _4393 = fma(_4391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3525);
    int _4395 = abs(_3819);
    int _4397 = _4381 * int(_4357);
    int _4399 = _4397 + _4285;
    float _4401 = trunc(_4387);
    float _4403 = precise::max(_4401, 0.0);
    uint _4405 = uint(_4403);
    float _4407 = float(uint(_4385));
    float _4409 = fma(_4393, _4393, _3739);
    int _4411 = ~_4025;
    int _4413 = _4411 + 1;
    float _4415 = float(uint(_4399));
    float _4417 = as_type<float>(_4303) * _4407;
    int _4419 = _4351 * int(_4377);
    int _4421 = _4419 + _4301;
    float _4423 = 1.0 / _4389;
    int _4425 = abs(_4091);
    float _4427 = as_type<float>(_4295) * _4415;
    float _4429 = float(uint(_4395));
    float _4431 = float(uint(_4421));
    float _4433 = float(uint(_4425));
    int _4435 = _4413 * int(_4405);
    int _4437 = _4435 + _4361;
    int _4439 = abs(_4025);
    float _4441 = as_type<float>(_4315) * _4431;
    float _4443 = 1.0 / _4433;
    int _4445 = as_type<int>(_4423) + (-2);
    float _4447 = float(uint(_4439));
    float _4449 = 1.0 / _4429;
    int _4451 = abs(_4223);
    float _4453 = float(uint(_4437));
    float _4455 = float(uint(_4451));
    int _4457 = abs(_4301);
    float _4459 = 1.0 / _4447;
    float _4461 = as_type<float>(_4335) * _4453;
    float _4463 = as_type<float>(_4445) * _4455;
    float _4465 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _4467 = abs(_4285);
    float _4469 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4465);
    float _4471 = exp2(_4233);
    int _4473 = as_type<int>(_4449) + (-2);
    float _4475 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4469);
    float _4477 = float(uint(_4457));
    int _4479 = as_type<int>(_4443) + (-2);
    float _4481 = float(uint(_4467));
    float _4483 = trunc(_4463);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    bool _4489 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4491 = isnan(1.0);
    bool _4493 = _4489 || _4491;
    bool _4495 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4497 = _4493 || _4495;
    float _4499 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4501 = 1.0 + _4499;
    float _4503 = as_type<float>(_4473) * _4477;
    int _4505 = abs(_4361);
    float _4507 = as_type<float>(_4479) * _4481;
    float _4509 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _4511 = as_type<int>(_4459) + (-2);
    float _4513 = 1.0 / _4501;
    float _4515 = float(uint(_4505));
    float _4517 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _4519 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4509);
    float _4521 = -_4471;
    float _4523 = _4521 + 1.0;
    float _4525 = as_type<float>(_4511) * _4515;
    float _4527 = fma(_1422, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4517);
    float _4529 = trunc(_4417);
    float _4531 = precise::max(_4529, 0.0);
    uint _4533 = uint(_4531);
    float _4535 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3899);
    bool _4537 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4539 = isnan(0.0);
    bool _4541 = _4537 || _4539;
    bool _4543 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4545 = _4541 || _4543;
    float _4547 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _4549 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4519);
    int _4551 = ~_4365;
    int _4553 = _4551 + 1;
    float _4555 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3655);
    float _4557 = fma(_1571, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4547);
    float _4559 = trunc(_4503);
    float _4561 = precise::max(_4559, 0.0);
    uint _4563 = uint(_4561);
    float _4565 = _4545 ? _4523 : 0.0;
    int _4567 = _4553 * int(_4487);
    int _4569 = _4567 + _4451;
    int _4571 = ~_4395;
    int _4573 = _4571 + 1;
    float _4575 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4527);
    float _4577 = fma(_166, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4557);
    float _4579 = _4367;
    if (_4497)
    {
        float _4581 = _4565 * _4513;
        _170 = _4581;
    }
    float _4583 = _170;
    int _4585 = ~_4425;
    int _4587 = _4585 + 1;
    float _4589 = trunc(_4507);
    float _4591 = precise::max(_4589, 0.0);
    uint _4593 = uint(_4591);
    int _4595 = int(_4333) + int(_4533);
    float _4597 = fma(_4555, _3539, _3701);
    int _4599 = ~_4439;
    int _4601 = _4599 + 1;
    float _4603 = -_3949;
    float _4605 = fma(_4535, _4371, _4603);
    float _4607 = float(uint(_4569));
    float _4609 = float(_3921);
    float _4611 = trunc(_4441);
    float _4613 = precise::max(_4611, 0.0);
    uint _4615 = uint(_4613);
    int _4617 = _4573 * int(_4563);
    int _4619 = _4617 + _4457;
    float _4621 = as_type<float>(_4445) * _4607;
    float _4623 = _4605 + 0.5;
    float _4625 = float(uint(_4619));
    float _4627 = trunc(_4525);
    float _4629 = precise::max(_4627, 0.0);
    uint _4631 = uint(_4629);
    int _4633 = ~_3789;
    int _4635 = _4633 + 1;
    float _4637 = as_type<float>(_4473) * _4625;
    float _4639 = trunc(_4427);
    float _4641 = precise::max(_4639, 0.0);
    uint _4643 = uint(_4641);
    float _4645 = trunc(_4461);
    float _4647 = precise::max(_4645, 0.0);
    uint _4649 = uint(_4647);
    int _4651 = _4587 * int(_4593);
    int _4653 = _4651 + _4467;
    float _4655 = float(uint(_4653));
    float _4657 = trunc(_4621);
    float _4659 = precise::max(_4657, 0.0);
    uint _4661 = uint(_4659);
    int _4663 = int(_4377) + int(_4615);
    int _4665 = _4601 * int(_4631);
    int _4667 = _4665 + _4505;
    float _4669 = as_type<float>(_4479) * _4655;
    int _4671 = int(_4357) + int(_4643);
    float _4673 = float(uint(_4667));
    float _4675 = trunc(_4669);
    float _4677 = precise::max(_4675, 0.0);
    uint _4679 = uint(_4677);
    int _4681 = int(_4405) + int(_4649);
    int _4683 = _4635 * _4595;
    int _4685 = _4683 + _4223;
    int _4687 = ~_4091;
    int _4689 = _4687 + 1;
    float _4691 = as_type<float>(_4511) * _4673;
    int _4693 = ~_3819;
    int _4695 = _4693 + 1;
    bool _4697 = uint(_4685) >= uint(_3789);
    float _4699 = trunc(_4637);
    float _4701 = precise::max(_4699, 0.0);
    uint _4703 = uint(_4701);
    int _4705 = ~_4025;
    int _4707 = _4705 + 1;
    int _4709 = _4689 * _4671;
    int _4711 = _4709 + _4285;
    int _4713 = int(_4487) + int(_4661);
    float _4715 = trunc(_4691);
    float _4717 = precise::max(_4715, 0.0);
    uint _4719 = uint(_4717);
    int _4721 = int(_4593) + int(_4679);
    int _4723 = _4695 * _4663;
    int _4725 = _4723 + _4301;
    bool _4727 = uint(_4711) >= uint(_4091);
    int _4729 = _4707 * _4681;
    int _4731 = _4729 + _4361;
    int _4733 = ~_4425;
    int _4735 = _4733 + 1;
    int _4737 = ~_4365;
    int _4739 = _4737 + 1;
    int _4741 = ~_4395;
    int _4743 = _4741 + 1;
    bool _4745 = !_4697;
    int _4747 = _4745 ? 0 : (-1);
    int _4749 = _4739 * _4713;
    int _4751 = _4749 + _4451;
    bool _4753 = uint(_4725) >= uint(_3819);
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4757 = int(_4563) + int(_4703);
    int _4759 = int(_4631) + int(_4719);
    bool _4761 = !_4727;
    int _4763 = _4761 ? 0 : (-1);
    int _4765 = _4735 * _4721;
    int _4767 = _4765 + _4467;
    bool _4769 = uint(_4731) >= uint(_4025);
    int _4771 = _4743 * _4757;
    int _4773 = _4771 + _4457;
    int _4775 = ~_4439;
    int _4777 = _4775 + 1;
    float _4779 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4781 = !_4753;
    int _4783 = _4781 ? 0 : (-1);
    bool _4785 = uint(_4751) >= uint(_4365);
    bool _4787 = !_4769;
    int _4789 = _4787 ? 0 : (-1);
    float _4791 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4793 = uint(_4767) >= uint(_4425);
    bool _4795 = !_4785;
    int _4797 = _4795 ? 0 : (-1);
    int _4799 = _4777 * _4759;
    int _4801 = _4799 + _4505;
    int _4803 = ~_4595;
    int _4805 = _4803 + _4747;
    int _4807 = _4805 + 1;
    bool _4809 = uint(_4773) >= uint(_4395);
    int _4811 = ~_4663;
    int _4813 = _4811 + _4783;
    int _4815 = _4813 + 1;
    int _4817 = _3789 * _4807;
    int _4819 = _4817 + _4223;
    bool _4821 = !_4809;
    int _4823 = _4821 ? 0 : (-1);
    bool _4825 = _3789 == 0;
    bool _4827 = !_4793;
    int _4829 = _4827 ? 0 : (-1);
    float _4831 = _4791 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4833 = uint(_4801) >= uint(_4439);
    int _4835 = _3819 * _4815;
    int _4837 = _4835 + _4301;
    bool _4839 = !_4825;
    int _4841 = _4839 ? _4819 : (-1);
    float _4843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4845 = _3819 == 0;
    float _4847 = fma(_4831, _1751, -0.5);
    int _4849 = ~_4671;
    int _4851 = _4849 + _4763;
    int _4853 = _4851 + 1;
    float _4855 = _1523 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    bool _4857 = !_4845;
    int _4859 = _4857 ? _4837 : (-1);
    bool _4861 = _3789 == 0;
    int _4863 = _4091 * _4853;
    int _4865 = _4863 + _4285;
    int _4867 = _4223 ^ _3789;
    float _4869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _4871 = _4285 ^ _4091;
    float _4873 = _4855 * _4779;
    uint _4875 = uint(int(uint(_4867) >> uint(31)));
    uint _4877 = uint(int(uint(_4871) >> uint(31)));
    int _4879 = ~_4681;
    int _4881 = _4879 + _4789;
    int _4883 = _4881 + 1;
    float _4885 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4887 = !_4833;
    int _4889 = _4887 ? 0 : (-1);
    int _4891 = ~_4797;
    int _4893 = _4713 + _4891;
    int _4895 = _4893 + 1;
    int _4897 = _4025 * _4883;
    int _4899 = _4897 + _4361;
    int _4901 = ~int(_4875);
    int _4903 = _4901 + 1;
    bool _4905 = _4091 == 0;
    int _4907 = ~_4829;
    int _4909 = _4721 + _4907;
    int _4911 = _4909 + 1;
    float _4913 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4915 = ~int(_4877);
    int _4917 = _4915 + 1;
    int _4919 = _4895 ^ _4903;
    float _4921 = _4913 * _4843;
    bool _4923 = !_4905;
    int _4925 = _4923 ? _4865 : (-1);
    float _4927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _4929 = _4025 == 0;
    int _4931 = _4911 ^ _4917;
    out.m_77.x = _4873;
    out.m_77.y = _4921;
    int _4933 = ~_4903;
    int _4935 = _4933 + _4919;
    int _4937 = _4935 + 1;
    bool _4939 = !_4929;
    int _4941 = _4939 ? _4899 : (-1);
    bool _4943 = _4091 == 0;
    int _4945 = ~_4917;
    int _4947 = _4945 + _4931;
    int _4949 = _4947 + 1;
    bool _4951 = !_4861;
    int _4953 = _4951 ? _4937 : (-1);
    float _4955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _4957 = _3819 == 0;
    float _4959 = _4869 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _4961 = _4301 ^ _3819;
    bool _4963 = !_4943;
    int _4965 = _4963 ? _4949 : (-1);
    float _4967 = fma(_4959, _1767, -0.5);
    bool _4969 = _4025 == 0;
    int _4971 = _4361 ^ _4025;
    float _4973 = _4927 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4975 = float(_4841);
    uint _4977 = uint(int(uint(_4971) >> uint(31)));
    float _4979 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    int _4981 = ~_4889;
    int _4983 = _4759 + _4981;
    int _4985 = _4983 + 1;
    float _4987 = fma(_4831, _4975, _3681);
    int _4989 = ~int(_4977);
    int _4991 = _4989 + 1;
    float _4993 = fma(_4973, _1803, -0.5);
    float _4995 = float(_4925);
    float _4997 = fma(_4475, _4847, _4987);
    float _4999 = float(_4859);
    float _5001 = _4755 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _5003 = _4985 ^ _4991;
    float _5005 = fma(_4959, _4995, _3847);
    float _5007 = float(_4941);
    float _5009 = _4885 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    float _5011 = fma(_4973, _4999, _3993);
    int _5013 = ~_4991;
    int _5015 = _5013 + _5003;
    int _5017 = _5015 + 1;
    float _5019 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    uint _5021 = uint(int(uint(_4961) >> uint(31)));
    float _5023 = fma(_5009, _2515, -0.5);
    float _5025 = float(_4953);
    float _5027 = fma(_5009, _5007, _3687);
    bool _5029 = !_4969;
    int _5031 = _5029 ? _5017 : (-1);
    float _5033 = fma(_5001, _2871, -0.5);
    int _5035 = ~_4823;
    int _5037 = _4757 + _5035;
    int _5039 = _5037 + 1;
    float _5041 = -_2975;
    float _5043 = fma(_5001, _5025, _5041);
    int _5045 = ~int(_5021);
    int _5047 = _5045 + 1;
    float _5049 = fma(_3577, _5023, _5027);
    float _5051 = float(_4965);
    float _5053 = fma(_4093, _4967, _5005);
    float _5055 = _4955 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5057 = float(_5031);
    float _5059 = _4979 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    int _5061 = _5039 ^ _5047;
    float _5063 = fma(_4577, _4993, _5011);
    float _5065 = fma(_5055, _2881, -0.5);
    float _5067 = -_3961;
    float _5069 = fma(_5055, _5051, _5067);
    int _5071 = ~_5047;
    int _5073 = _5071 + _5061;
    int _5075 = _5073 + 1;
    float _5077 = fma(_5059, _2897, -0.5);
    float _5079 = -_3691;
    float _5081 = fma(_5059, _5057, _5079);
    float _5083 = fma(_4549, _5033, _5043);
    bool _5085 = !_4957;
    int _5087 = _5085 ? _5075 : (-1);
    float _5089 = _5019 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _5091 = fma(_3673, _5077, _5081);
    float _5093 = _5083 + 0.5;
    float _5095 = float(_5087);
    float _5097 = fma(_5089, _2895, -0.5);
    float _5099 = _5091 + 0.5;
    float _5101 = fma(_3695, _5065, _5069);
    float _5103 = in.m_79.x;
    float _5105 = in.m_79.y;
    float _5107 = in.m_79.z;
    float _5109 = -_4033;
    float _5111 = fma(_5089, _5095, _5109);
    float _5113 = _4997 + 0.5;
    float _5115 = _4597 + 0.5;
    float _5117 = _5063 + 0.5;
    float _5119 = fma(_4575, _5097, _5111);
    float _5121 = _5053 + 0.5;
    float _5123 = _5101 + 0.5;
    float _5125 = _5049 + 0.5;
    float _5127 = _5119 + 0.5;
    bool _5129 = !_3855;
    int _5131 = _5129 ? 0 : 1;
    out.m_81.x = _5115;
    out.m_81.y = _4623;
    bool _5133 = !_3859;
    int _5135 = _5133 ? 0 : 1;
    int _5137 = abs(_5131);
    out.m_83.x = _5113;
    out.m_83.y = _5093;
    out.m_83.z = _5121;
    out.m_83.w = _5123;
    int _5139 = abs(_5135);
    bool _5141 = !_3863;
    int _5143 = _5141 ? 0 : 1;
    out.m_85.x = _5117;
    out.m_85.y = _5127;
    float _5145 = float(_5137);
    out.m_87.x = _5125;
    out.m_87.y = _5099;
    if (_3545)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5147 = -_3705;
    float _5149 = fma(_5147, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3189);
    float _5151 = -_3711;
    float _5153 = fma(_5151, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2967);
    float _5155 = _5145 * _4609;
    float _5157 = float(_3081);
    float _5159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5161 = _5149 + _5159;
    float _5163 = float(_5139);
    float _5165 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5167 = _5153 + _5165;
    float _5169 = _5155 * (-2.0);
    float _5171 = _5161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5173 = -_4367;
    float _5175 = fma(_5173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3421);
    float _5177 = _5163 * _5157;
    float _5179 = _1571 + (-0.5);
    float _5181 = fma(_5167, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5171);
    float _5183 = fma(_5169, _5103, _5103);
    float _5185 = _1422 + _1581;
    float _5187 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5189 = _5175 + _5187;
    float _5191 = fma(_3885, _5169, _3885);
    float _5193 = fma(_5179, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5183);
    float _5195 = _5185 + (-1.0);
    float _5197 = _5177 * (-2.0);
    float _5199 = fma(_5189, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5181);
    float _5201 = fma(_5191, _4583, _5193);
    float _5203 = fma(_5195, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5205 = _1422 + (-0.5);
    float _5207 = fma(_5197, _5105, _5105);
    bool _5209 = _5199 >= 0.0;
    float _5211 = fma(_5203, _5197, _5203);
    int _5213 = abs(_5143);
    float _5215 = fma(_5205, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5207);
    float _5217 = _5201 * 0.15915493667125701904296875;
    float _5219 = sqrt(_4409);
    float _5221 = fma(_5211, _4583, _5215);
    float _5223 = float(_3463);
    float _5225 = _1571 + _1581;
    float _5227 = float(_5213);
    float _5229 = _5221 * 0.15915493667125701904296875;
    float _5231 = _5217 * 6.283185482025146484375;
    float _5233 = sin(_5231);
    float _5235 = _5197;
    float _5237 = _5167;
    if (_5209)
    {
        _5235 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5239 = _5235;
    float _5241 = _5227 * _5223;
    int _5243 = as_type<int>(_5239);
    if (_5209)
    {
        out.m_51.x = 0.0;
    }
    float _5245 = _5225 + (-1.0);
    if (_5209)
    {
        float _5247 = _5239 * 5.0;
        _5243 = as_type<int>(_5247);
    }
    int _5249 = _5243;
    float _5251 = _5241 * (-2.0);
    float _5253 = _5217 * 6.283185482025146484375;
    float _5255 = cos(_5253);
    if (_5209)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14453 = as_type<float>(_5249);
        out.gl_Position.z = _14453;
    }
    float _5257 = _5229 * 6.283185482025146484375;
    float _5259 = sin(_5257);
    if (_5209)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5261 = -_3189;
    float _5263 = _5261 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5265 = -_2967;
    float _5267 = _5265 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5269 = -_3421;
    float _5271 = _5269 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5273 = fma(_5245, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5275 = _5263 * _5263;
    float _5277 = fma(_5251, _5107, _5107);
    float _5279 = _1581 + (-0.5);
    float _5281 = fma(_5273, _5251, _5273);
    float _5283 = fma(_5267, _5267, _5275);
    float _5285 = _5229 * 6.283185482025146484375;
    float _5287 = cos(_5285);
    float _5289 = fma(_5279, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5277);
    float _5291 = _3659 * _5219;
    float _5293 = fma(_5271, _5271, _5283);
    float _5295 = _698 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5297 = fma(_5281, _4583, _5289);
    float _5299 = in.m_89.x;
    float _5301 = in.m_89.y;
    float _5303 = in.m_89.z;
    float _5305 = _694 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5307 = rsqrt(_5293);
    float _5309 = _5297 * 0.15915493667125701904296875;
    float _5311 = _5233 * _5259;
    float _5313 = _5291 * _5305;
    float _5315 = _5255 * _5287;
    float _5317 = _5309 * 6.283185482025146484375;
    float _5319 = sin(_5317);
    float _5321 = _5233 * _5287;
    float _5323 = _5267 * _5307;
    float _5325 = _5271 * _5307;
    float _5327 = _5263 * _5307;
    float _5329 = _5309 * 6.283185482025146484375;
    float _5331 = cos(_5329);
    float _5333 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5335 = _5323 * _5333;
    float _5337 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5339 = _5325 * _5337;
    float _5341 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5343 = _5327 * _5341;
    float _5345 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5347 = -_5335;
    float _5349 = fma(_5325, _5345, _5347);
    float _5351 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5353 = -_5339;
    float _5355 = fma(_5327, _5351, _5353);
    float _5357 = fma(_5319, _5315, _5311);
    float _5359 = fma(_5319, _5311, _5315);
    float _5361 = _5349 * _5349;
    float _5363 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5365 = -_5343;
    float _5367 = fma(_5323, _5363, _5365);
    float _5369 = _5291 * _5295;
    float _5371 = fma(_5355, _5355, _5361);
    float _5373 = _696 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5375 = _5255 * _5259;
    float _5377 = _5287 * _5331;
    float _5379 = fma(_5367, _5367, _5371);
    float _5381 = _5291 * _5373;
    float _5383 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5301);
    float _5385 = _5255 * _5331;
    float _5387 = _5233 * _5331;
    float _5389 = _5259 * _5331;
    float _5391 = rsqrt(_5379);
    float _5393 = _5383 * _5381;
    float _5395 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5299);
    float _5397 = -_5375;
    float _5399 = fma(_5319, _5321, _5397);
    float _5401 = -_5321;
    float _5403 = fma(_5319, _5375, _5401);
    float _5405 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5303);
    float _5407 = _5395 * _5369;
    float _5409 = _5385 * _5393;
    float _5411 = -_5393;
    float _5413 = _5319 * _5411;
    float _5415 = _5405 * _5313;
    float _5417 = _5387 * _5393;
    float _5419 = fma(_5357, _5407, _5409);
    float _5421 = fma(_5377, _5407, _5413);
    float _5423 = fma(_5399, _5407, _5417);
    float _5425 = fma(_5403, _5415, _5419);
    float _5427 = _5355 * _5391;
    float _5429 = _5367 * _5391;
    float _5431 = _5349 * _5391;
    float _5433 = _5327 * _5427;
    float _5435 = _5323 * _5429;
    float _5437 = _5325 * _5431;
    float _5439 = -_5433;
    float _5441 = fma(_5323, _5431, _5439);
    float _5443 = fma(_5389, _5415, _5421);
    float _5445 = -_5437;
    float _5447 = fma(_5327, _5429, _5445);
    float _5449 = fma(_5359, _5415, _5423);
    float _5451 = _5441 * _5425;
    float _5453 = -_5435;
    float _5455 = fma(_5325, _5427, _5453);
    float _5457 = _5447 * _5425;
    float _5459 = fma(_5429, _5443, _5451);
    float _5461 = _5455 * _5425;
    float _5463 = fma(_5427, _5443, _5457);
    float _5465 = fma(_5325, _5449, _5459);
    float _5467 = fma(_5431, _5443, _5461);
    float _5469 = fma(_5323, _5449, _5463);
    float _5471 = _5149 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5473 = _3421 + _5465;
    float _5475 = fma(_5327, _5449, _5467);
    float _5477 = _2967 + _5469;
    float _5479 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5481 = _5473 + _5479;
    float _5483 = _3189 + _5475;
    float _5485 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5487 = _5477 + _5485;
    float _5489 = _5481 * _5481;
    float _5491 = fma(_5487, _5487, _5489);
    float _5493 = fma(_5153, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5471);
    float _5495 = sqrt(_5491);
    float _5497 = fma(_5175, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5493);
    bool _5499 = _5495 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5501 = _5475;
    float _5503 = _5471;
    float _5505 = _5493;
    float _5507 = _5487;
    if (!_5499)
    {
        _5501 = _5477;
    }
    float _5509 = _5501;
    float _5511 = _5509;
    if (!_5499)
    {
        _5503 = _5473;
    }
    float _5513 = _5503;
    float _5515 = _5513;
    if (!_5499)
    {
        _5505 = _5483;
    }
    float _5517 = _5505;
    bool _5519 = !_5499;
    float _5521 = _5517;
    if (!_5519)
    {
        float _5523 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5525 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5527 = _5495 + _5525;
        float _5529 = rsqrt(_5491);
        float _5531 = _5527 * _5523;
        float _5533 = _5483 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5535 = _5531 * 0.15915493667125701904296875;
        float _5537 = _5535 * 6.283185482025146484375;
        float _5539 = cos(_5537);
        float _5541 = _5535 * 6.283185482025146484375;
        float _5543 = sin(_5541);
        float _5545 = _5539 + (-1.0);
        float _5547 = _5545 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5549 = fma(_5543, _5533, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5551 = fma(_5483, _5539, _5547);
        float _5553 = _5529 * _5549;
        float _5555 = fma(_5487, _5553, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5557 = fma(_5481, _5553, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _5521 = _5551;
        _5511 = _5555;
        _5515 = _5557;
    }
    float _5559 = _5521;
    float _5561 = _5511;
    float _5563 = _5515;
    float _5565 = -_3189;
    float _5567 = _5565 + _5559;
    float _5569 = -_2967;
    float _5571 = _5569 + _5561;
    float _5573 = _5497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5575 = _5149 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5577 = _5567 * _5567;
    float _5579 = -_3421;
    float _5581 = _5579 + _5563;
    float _5583 = 1.0 / _5573;
    float _5585 = fma(_5153, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5575);
    float _5587 = fma(_5571, _5571, _5577);
    float _5589 = fma(_5175, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5585);
    float _5591 = fma(_5581, _5581, _5587);
    bool _5593 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _5595 = isnan(0.5);
    bool _5597 = _5593 || _5595;
    bool _5599 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5601 = _5597 || _5599;
    float _5603 = _5589 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5605 = sqrt(_5591);
    bool _5607 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _5609 = isnan(0.5);
    bool _5611 = _5607 || _5609;
    bool _5613 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5615 = _5611 || _5613;
    float _5617 = _5603 + _5573;
    float _5619 = _5617 * _5583;
    float _5621 = _5619 * 0.5;
    float _5623 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5625 = fma(_5621, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5623);
    float _5627 = 1.0 / _5625;
    bool _5629 = _5605 > 0.0;
    float _5631 = _5621;
    float _5633 = _5605;
    float _5635 = _5559;
    float _5637 = _5571;
    float _5639 = _5591;
    if (!_5629)
    {
        _5631 = _5561;
    }
    float _5641 = _5631;
    float _5643 = _5641;
    if (!_5629)
    {
        _5633 = _5563;
    }
    float _5645 = _5633;
    bool _5647 = !_5629;
    float _5649 = _5645;
    if (!_5647)
    {
        float _5651 = _228 * _228;
        float _5653 = fma(_224, _224, _5651);
        float _5655 = fma(_230, _230, _5653);
        float _5657 = rsqrt(_5591);
        float _5659 = sqrt(_5655);
        float _5661 = _5571 * _5657;
        float _5663 = _5567 * _5657;
        float _5665 = _5581 * _5657;
        bool _5667 = _5659 > 0.0;
        float _5669 = _5659;
        float _5671 = _5657;
        _5637 = _5663;
        _5507 = _5661;
        if (!_5667)
        {
            _5669 = _5561;
        }
        float _5673 = _5669;
        _5643 = _5673;
        if (!_5667)
        {
            _5671 = _5563;
        }
        float _5675 = _5671;
        bool _5677 = !_5667;
        _5649 = _5675;
        if (!_5677)
        {
            float _5679 = rsqrt(_5655);
            float _5681 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5683 = _228 * _5679;
            float _5685 = _224 * _5679;
            float _5687 = _230 * _5679;
            float _5689 = _5663 * _5683;
            float _5691 = fma(_5661, _5685, _5689);
            float _5693 = _5681 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5695 = fma(_5665, _5687, _5691);
            float _5697 = _5695 * _5693;
            float _5699 = fma(_228, _5697, _5559);
            float _5701 = fma(_224, _5697, _5561);
            float _5703 = fma(_230, _5697, _5563);
            _5643 = _5701;
            _5649 = _5703;
            _5635 = _5699;
            _5637 = _5691;
        }
    }
    float _5705 = _5643;
    float _5707 = _5649;
    float _5709 = _5635;
    float _5711 = _5637;
    float _5713 = _5507;
    float _5715 = -_3711;
    float _5717 = fma(_5715, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5705);
    float _5719 = -_4367;
    float _5721 = fma(_5719, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5707);
    float _5723 = -_3705;
    float _5725 = fma(_5723, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5709);
    float _5727 = _5725;
    float _5729 = _5721;
    float _5731 = _5713;
    float _5733 = _5711;
    if (_5615)
    {
        _5639 = 1.0;
    }
    float _5735 = _5639;
    float _5737 = _5735;
    if (_5601)
    {
        _4579 = _5717;
    }
    float _5739 = _4579;
    float _5741 = _5739;
    if (!_5601)
    {
        float _5743 = _5161 * _5161;
        float _5745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5747 = -_3421;
        float _5749 = _5747 + _5707;
        float _5751 = -_3189;
        float _5753 = _5751 + _5709;
        float _5755 = fma(_5167, _5167, _5743);
        float _5757 = -_2967;
        float _5759 = _5757 + _5705;
        float _5761 = fma(_5189, _5189, _5755);
        float _5763 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5765 = sqrt(_5761);
        float _5767 = 1.0 / _5291;
        float _5769 = _5763 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5771 = precise::min(_5765, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5773 = _5771 * _5745;
        float _5775 = _5773 * _5767;
        float _5777 = _5769 * _5775;
        float _5779 = _5749 * _5775;
        float _5781 = fma(_5753, _5777, _5149);
        float _5783 = fma(_5759, _5777, _5153);
        float _5785 = fma(_5769, _5779, _5175);
        _5727 = _5781;
        _5741 = _5783;
        _5729 = _5785;
        _5237 = _5765;
    }
    float _5787 = _5727;
    float _5789 = _5741;
    float _5791 = _5729;
    float _5793 = _5237;
    float _5795 = _5793;
    if (_5615)
    {
        _5731 = 1.0;
    }
    float _5797 = _5731;
    float _5799 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5801 = _5627 * _5799;
    float _5803 = _5797;
    if (!_5615)
    {
        float _5805 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5807 = _5805 * 0.15915493667125701904296875;
        float _5809 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5811 = _5807 * 6.283185482025146484375;
        float _5813 = cos(_5811);
        float _5815 = _5809 * 0.15915493667125701904296875;
        float _5817 = _5807 * 6.283185482025146484375;
        float _5819 = sin(_5817);
        float _5821 = 1.0 / _5813;
        float _5823 = _5815 * 6.283185482025146484375;
        float _5825 = cos(_5823);
        float _5827 = _5819 * _5821;
        float _5829 = _5815 * 6.283185482025146484375;
        float _5831 = sin(_5829);
        float _5833 = _5825 * _5827;
        float _5835 = 1.0 / _5833;
        float _5837 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5839 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _5837;
        float _5841 = 1.0 / _5839;
        float _5843 = _5831 * _5835;
        float _5845 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _5847 = fma(_5801, _5843, _5845);
        float _5849 = _5847 * _5841;
        float _5851 = precise::clamp(_5849, 0.0, 1.0);
        _5795 = _5841;
        _5737 = _5851;
    }
    float _5853 = _5795;
    float _5855 = _5737;
    float _5857 = _5853;
    if (!_5615)
    {
        float _5859 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5861 = _5859 * 0.15915493667125701904296875;
        float _5863 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5865 = _5861 * 6.283185482025146484375;
        float _5867 = cos(_5865);
        float _5869 = _5863 * 0.15915493667125701904296875;
        float _5871 = _5861 * 6.283185482025146484375;
        float _5873 = sin(_5871);
        float _5875 = 1.0 / _5867;
        float _5877 = _5869 * 6.283185482025146484375;
        float _5879 = cos(_5877);
        float _5881 = _5873 * _5875;
        float _5883 = _5869 * 6.283185482025146484375;
        float _5885 = sin(_5883);
        float _5887 = _5879 * _5881;
        float _5889 = 1.0 / _5887;
        float _5891 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5893 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _5891;
        float _5895 = 1.0 / _5893;
        float _5897 = _5885 * _5889;
        float _5899 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _5901 = fma(_5801, _5897, _5899);
        float _5903 = _5901 * _5895;
        float _5905 = precise::clamp(_5903, 0.0, 1.0);
        float _5907 = -_5905;
        float _5909 = _5907 + 1.0;
        _5857 = _5887;
        _5803 = _5909;
    }
    float _5911 = _5857;
    float _5913 = _5803;
    float _5915 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5917 = _5787 + _5915;
    float _5919 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5921 = _5789 + _5919;
    float _5923 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5925 = _5791 + _5923;
    float _5927 = _5917 * _5917;
    float _5929 = fma(_5921, _5921, _5927);
    float _5931 = fma(_5925, _5925, _5929);
    float _5933 = rsqrt(_5931);
    float _5935 = sqrt(_5931);
    float _5937 = _5933 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _5939 = _5921 * _5937;
    float _5941 = _5925 * _5937;
    float _5943 = _5939 * _5939;
    float _5945 = _5941 * _5941;
    float _5947 = _5943 + _5945;
    float _5949 = sqrt(_5947);
    bool _5951 = _5949 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5953 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5955 = _5949 + _5953;
    float _5957 = _5925;
    float _5959 = _5933;
    float _5961 = _5955;
    float _5963 = _5927;
    float _5965 = _5917;
    if (_5951)
    {
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5957 = _5967;
    }
    float _5969 = _5957;
    if (_5951)
    {
        float _5971 = rsqrt(_5947);
        _5959 = _5971;
    }
    float _5973 = _5959;
    float _5975 = _5973;
    if (_5951)
    {
        float _5977 = _5955 * _5969;
        _5961 = _5977;
    }
    float _5979 = _5961;
    if (_5951)
    {
        float _5981 = _5979 * 0.15915493667125701904296875;
        _5963 = _5981;
    }
    float _5983 = _5963;
    float _5985 = _5969;
    float _5987 = _5983;
    if (_5951)
    {
        float _5989 = _5983 * 6.283185482025146484375;
        float _5991 = sin(_5989);
        _5985 = _5991;
    }
    float _5993 = _5985;
    float _5995 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _5997 = precise::max(0.0, _5995);
    float _5999 = _5911;
    float _6001 = _5997;
    if (_5951)
    {
        float _6003 = _5983 * 6.283185482025146484375;
        float _6005 = cos(_6003);
        _5999 = _6005;
    }
    float _6007 = _5999;
    float _6009 = -_5937;
    float _6011 = -_5997;
    float _6013 = fma(_5917, _6009, _6011);
    if (_5951)
    {
        float _6015 = _6013 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6001 = _6015;
    }
    float _6017 = _6001;
    float _6019 = _5993;
    float _6021 = _6017;
    if (_5951)
    {
        float _6023 = fma(_5993, _6017, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _5965 = _6023;
    }
    float _6025 = _5965;
    float _6027 = _6025;
    if (!_5951)
    {
        _6019 = _5939;
    }
    float _6029 = _6019;
    float _6031 = _6029;
    float _6033 = _6007;
    if (_5951)
    {
        float _6035 = _6007 + (-1.0);
        _6021 = _6035;
    }
    float _6037 = _6021;
    float _6039 = _6037;
    if (_5951)
    {
        float _6041 = _5973 * _6025;
        _5733 = _6041;
    }
    float _6043 = _5733;
    if (!_5951)
    {
        _6027 = _6013;
    }
    float _6045 = _6027;
    float _6047 = _6045;
    if (_5951)
    {
        float _6049 = _6037 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _5987 = _6049;
    }
    float _6051 = _5987;
    if (_5951)
    {
        float _6053 = _5939 * _6043;
        _6031 = _6053;
    }
    float _6055 = _6031;
    if (!_5951)
    {
        _6039 = _5941;
    }
    float _6057 = _6039;
    float _6059 = _6057;
    if (_5951)
    {
        float _6061 = _5941 * _6043;
        _6059 = _6061;
    }
    float _6063 = _6059;
    if (!_5951)
    {
        _5975 = _5943;
    }
    float _6065 = _5975;
    float _6067 = _6065;
    if (_5951)
    {
        float _6069 = fma(_6013, _6007, _6051);
        _6047 = _6069;
    }
    float _6071 = _6047;
    if (_5951)
    {
        float _6073 = _6055 * _6055;
        _6067 = _6073;
    }
    float _6075 = _6067;
    if (!_5951)
    {
        _6033 = _5945;
    }
    float _6077 = _6033;
    float _6079 = _6077;
    if (_5951)
    {
        float _6081 = _6063 * _6063;
        _6079 = _6081;
    }
    float _6083 = _6079;
    float _6085 = fma(_6071, _6071, _6075);
    float _6087 = _6085 + _6083;
    float _6089 = fma(_5153, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6091 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6093 = rsqrt(_6087);
    float _6095 = fma(_5175, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6097 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6091);
    float _6099 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6101 = fma(_5935, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6099);
    float _6103 = precise::clamp(_6101, 0.0, 1.0);
    float _6105 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6097);
    float _6107 = floor(_6089);
    float _6109 = -_6103;
    float _6111 = _6109 + 1.0;
    float _6113 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6115 = _6105 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6117 = _6093 * _6055;
    float _6119 = _6093 * _6063;
    float _6121 = _6093 * _6071;
    float _6123 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6113);
    float _6125 = _6117 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6129 = _6115 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6131 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6123);
    float _6133 = -_6125;
    float _6135 = fma(_6121, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6133);
    float _6137 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6139 = abs(_6111);
    float _6141 = log2(_6139);
    float _6143 = _6131 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6145 = -_6119;
    float _6147 = fma(_6145, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6135);
    float _6149 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6137);
    float _6151 = _5787 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6153 = -_6129;
    float _6155 = fma(_6153, _6127, 1.0);
    float _6157 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6159 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6149);
    float _6161 = fma(_5789, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6151);
    float _6163 = fma(_6147, -0.5, 0.5);
    float _6165 = floor(_6095);
    float _6167 = _6159 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6169 = fma(_5791, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6161);
    float _6171 = -_6107;
    float _6173 = _6089 + _6171;
    float _6175 = fma(_6147, 0.5, 0.5);
    float _6177 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6157);
    float _6179 = _6169 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6181 = _6141 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6183 = sqrt(_6163);
    float _6185 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6177);
    float _6187 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6189 = fma(_6175, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6191 = _6121 + 1.0;
    float _6193 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6185);
    float _6195 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6187);
    float _6197 = fma(_6175, _6189, -0.212114393711090087890625);
    float _6199 = exp2(_6181);
    float _6201 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6203 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6195);
    float _6205 = -_6165;
    float _6207 = _6095 + _6205;
    float _6209 = fma(_6175, _6197, 1.570728778839111328125);
    float _6211 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6203);
    float _6213 = log2(_6155);
    float _6215 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6201);
    float _6217 = _6183 * 0.636619746685028076171875;
    float _6219 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6215);
    float _6221 = 1.0 / _6193;
    float _6223 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6219);
    float _6225 = -_6121;
    float _6227 = fma(_6199, _6191, _6225);
    float2 _15971 = float2(_6173, _6207);
    float _6229 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_15971, float2(0.0), isnan(_15971)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_15971, float2(0.0), isnan(_15971)), level(0.0)).x;
    float _6231 = -_6209;
    float _6233 = fma(_6217, _6231, 1.0);
    float _6235 = fma(_5561, 6.2500002968590706586837768554688e-05, 0.5);
    float _6237 = fma(_6227, 0.5, 0.5);
    float _6239 = fma(_5563, 6.2500002968590706586837768554688e-05, 0.5);
    float _6241 = _6213 * 0.693147182464599609375;
    float _6243 = _6241 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _6245 = _6211 * _6221;
    float _6247 = _6223 * _6221;
    float _6249 = fma(_6245, 0.5, 0.5);
    float _6251 = fma(_6247, -0.5, 0.5);
    float3 _16011 = float3(_6249, _6251, _6243);
    float _6253 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16011, float3(0.0), isnan(_16011)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16011, float3(0.0), isnan(_16011)), level(0.0)).x;
    float3 _16022 = float3(_6249, _6251, _6243);
    float4 _6256 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16022, float3(0.0), isnan(_16022)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16022, float3(0.0), isnan(_16022)), level(0.0)).xyzw;
    float _6258 = _6256.x;
    float _6260 = _6256.y;
    float _6262 = _6256.z;
    float _6264 = _6256.w;
    float2 _16038 = float2(_6233, _6237);
    float3 _6268 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16038, float2(0.0), isnan(_16038)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16038, float2(0.0), isnan(_16038)), level(0.0)).xyz;
    float _6270 = _6268.x;
    float _6272 = _6268.y;
    float _6274 = _6268.z;
    float2 _16052 = float2(_6235, _6239);
    float3 _6276 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_16052, float2(0.0), isnan(_16052)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_16052, float2(0.0), isnan(_16052)), level(0.0)).xyz;
    float _6278 = _6276.x;
    float _6280 = _6276.y;
    float _6282 = _6276.z;
    float _6284 = abs(_5801);
    float _6286 = log2(_6284);
    float _6288 = in.m_91.x;
    float _6290 = in.m_91.y;
    float _6292 = in.m_91.z;
    bool _6294 = _5301 != 0.0;
    bool _6296 = isnan(_5301);
    bool _6298 = _6294 || _6296;
    bool _6300 = isnan(0.0);
    bool _6302 = _6298 || _6300;
    float _6304 = _6141 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _6306 = _6143 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6308 = in.m_93.x;
    float _6310 = in.m_93.y;
    float _6312 = in.m_93.z;
    float _6314 = in.m_93.w;
    bool _6316 = _5299 == 0.0;
    bool _6318 = !_6302;
    bool _6320 = _6316 && _6318;
    float _6322 = fma(_6167, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6306);
    bool _6324 = _5801 <= 8000.0;
    bool _6326 = isnan(_5801);
    bool _6328 = _6324 || _6326;
    bool _6330 = isnan(8000.0);
    bool _6332 = _6328 || _6330;
    float _6334 = float(_6332);
    bool _6336 = _5303 == 0.0;
    bool _6338 = _6336 && _6320;
    float _6340 = fma(_6115, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6322);
    float _6342 = _6286 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6344 = exp2(_6342);
    float _6346 = _6286;
    float _6348 = _6243;
    float _6350 = _6288;
    float _6352 = _6193;
    float _6354 = _6211;
    float _6356 = _6223;
    if (_6338)
    {
        _3733 = _6288;
    }
    float _6358 = _3733;
    float _6360 = _6358;
    if (_6338)
    {
        _3915 = _6290;
    }
    float _6362 = _3915;
    float _6364 = _6362;
    if (_6338)
    {
        _6346 = _6358;
    }
    float _6366 = _6346;
    float _6368 = _6366;
    if (!_6338)
    {
        _6360 = _6288;
    }
    float _6370 = _6360;
    if (_6338)
    {
        _6348 = _6362;
    }
    float _6372 = _6348;
    float _6374 = _6372;
    if (!_6338)
    {
        _6364 = _6290;
    }
    float _6376 = _6364;
    if (!_6338)
    {
        float _6378 = fma(_5299, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6370);
        _6368 = _6378;
    }
    float _6380 = _6368;
    if (_6338)
    {
        _6350 = _6292;
    }
    float _6382 = _6350;
    float _6384 = _6382;
    if (!_6338)
    {
        float _6386 = fma(_5303, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6292);
        _6384 = _6386;
    }
    float _6388 = _6384;
    if (!_6338)
    {
        float _6390 = fma(_5301, (*spvDescriptorSet0.vp_c9)._m0[17].y, _6376);
        _6374 = _6390;
    }
    float _6392 = _6374;
    float _6394 = _6310 * _6292;
    float _6396 = _6312 * _6370;
    float _6398 = fma(_6344, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6400 = precise::clamp(_6398, 0.0, 1.0);
    float _6402 = _6308 * _6376;
    float _6404 = -_6394;
    float _6406 = fma(_6312, _6376, _6404);
    float _6408 = -_6396;
    float _6410 = fma(_6308, _6292, _6408);
    float _6412 = fma(_6400, -2.0, 3.0);
    float _6414 = -_6402;
    float _6416 = fma(_6310, _6370, _6414);
    float _6418 = _6400 * _6400;
    float _6420 = _6410 * _6314;
    float _6422 = _6406 * _6314;
    float _6424 = _6416 * _6314;
    float _6426 = _6418 * _6412;
    float _6428 = _5357 * _5447;
    float _6430 = _5357 * _5455;
    float _6432 = _5357 * _5441;
    float _6434 = _5385 * _5455;
    float _6436 = _5385 * _5447;
    float _6438 = _5403 * _5455;
    float _6440 = _5385 * _5441;
    float _6442 = _5403 * _5447;
    float _6444 = _5403 * _5441;
    float _6446 = -_5319;
    float _6448 = fma(_6446, _5431, _6434);
    float _6450 = fma(_5377, _5431, _6430);
    float _6452 = -_5319;
    float _6454 = fma(_6452, _5429, _6440);
    float _6456 = fma(_5389, _5427, _6442);
    float _6458 = fma(_5389, _5431, _6438);
    float _6460 = fma(_5389, _5429, _6444);
    float _6462 = fma(_5377, _5427, _6428);
    float _6464 = fma(_5387, _5327, _6448);
    float _6466 = fma(_5377, _5429, _6432);
    float _6468 = fma(_5399, _5327, _6450);
    float _6470 = fma(_5359, _5323, _6456);
    float _6472 = fma(_5359, _5327, _6458);
    float _6474 = fma(_5359, _5325, _6460);
    float _6476 = -_5319;
    float _6478 = fma(_6476, _5427, _6436);
    float _6480 = _6464 * _6310;
    float _6482 = fma(_5387, _5325, _6454);
    float _6484 = fma(_5399, _5323, _6462);
    float _6486 = fma(_5387, _5323, _6478);
    float _6488 = fma(_6468, _6308, _6480);
    float _6490 = exp2(_6304);
    float _6492 = fma(_5399, _5325, _6466);
    float _6494 = _6486 * _6310;
    float _6496 = _6482 * _6310;
    float _6498 = fma(_6472, _6312, _6488);
    float _6500 = -_6426;
    float _6502 = _6500 + 1.0;
    float _6504 = in.m_95.x;
    float _6506 = _6464 * _6392;
    float _6508 = _6420 * _6464;
    float _6510 = fma(_6502, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6426);
    float _6512 = _6486 * _6392;
    float _6514 = _6482 * _6392;
    float _6516 = fma(_6484, _6308, _6494);
    float _6518 = _6334 * _6510;
    float _6520 = fma(_6468, _6380, _6506);
    float _6522 = _6420 * _6486;
    float _6524 = _6420 * _6482;
    float _6526 = fma(_6179, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6340);
    float _6528 = fma(_6484, _6380, _6512);
    float _6530 = fma(_6492, _6380, _6514);
    float _6532 = fma(_6422, _6468, _6508);
    float _6534 = _6518 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6536 = -_6490;
    float _6538 = _6536 + 1.0;
    float _6540 = fma(_6422, _6484, _6522);
    float _6542 = fma(_6422, _6492, _6524);
    float _6544 = fma(_6470, _6388, _6528);
    float _6546 = fma(_6472, _6388, _6520);
    float _6548 = fma(_6474, _6388, _6530);
    float _6550 = _6538 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6552 = fma(_6424, _6470, _6540);
    float _6554 = fma(_6424, _6472, _6532);
    float _6556 = fma(_6424, _6474, _6542);
    float _6558 = fma(_6492, _6308, _6496);
    float _6560 = fma(_6470, _6312, _6516);
    float _6562 = _6526 + _6193;
    float _6564 = _6211 + _6193;
    out.m_97.x = _6552;
    out.m_97.y = _6554;
    out.m_97.z = _6556;
    float _6566 = _6193 * 0.5;
    float _6568 = fma(_6474, _6312, _6558);
    float _6570 = _6562 * 0.5;
    float _6572 = _6564 * 0.5;
    float _6574 = fma(_6223, -0.5, _6566);
    out.m_99.x = _6560;
    out.m_99.y = _6498;
    out.m_99.z = _6568;
    bool _6576 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6578 = isnan(_5935);
    bool _6580 = _6576 || _6578;
    bool _6582 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6584 = _6580 || _6582;
    out.m_101.x = _6572;
    out.m_101.y = _6574;
    out.m_101.z = _6570;
    out.m_101.w = _6193;
    float _6586 = -_6550;
    float _6588 = _6586 + 1.0;
    out.m_103.x = _6544;
    out.m_103.y = _6546;
    out.m_103.z = _6548;
    out.gl_Position.x = _6211;
    out.gl_Position.y = _6223;
    out.gl_Position.z = _6526;
    out.gl_Position.w = _6193;
    float _6590 = _6556;
    if (!_6584)
    {
        _6590 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6592 = _6590;
    float _6594 = _6592;
    float _6596 = _6592;
    if (!_6584)
    {
        _6352 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6598 = _6352;
    float _6600 = _6598;
    float _6602 = _6598;
    if (!_6584)
    {
        _6354 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6604 = _6354;
    float _6606 = _6604;
    float _6608 = _6604;
    if (!_6584)
    {
        _6356 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6610 = _6356;
    float _6612 = -_6229;
    float _6614 = _6612 + 1.0;
    float _6616 = _6614 * _6534;
    float _6618 = precise::clamp(_6616, 0.0, 1.0);
    float _6620 = -_6618;
    float _6622 = fma(_6620, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6624 = _6622 * _6504;
    float _6626 = _6624 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_105.x = _6626;
    float _6628 = _6550 * _6253;
    float _6630 = _6264 * _6588;
    float _6632 = _5855 * _5913;
    float _6634 = _6264 * _6628;
    float _6636 = _6274 * _6628;
    out.m_107.x = _6278;
    out.m_107.y = _6280;
    out.m_107.z = _6282;
    float _6638 = _6632 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6640 = fma(_6270, _6634, _6258);
    float _6642 = fma(_6272, _6634, _6260);
    float _6644 = fma(_6264, _6636, _6262);
    float _6646 = _6634;
    float _6648 = _6632;
    float _6650 = _6610;
    float _6652 = _6610;
    if (!_6584)
    {
        _6646 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6654 = _6646;
    float _6656 = _6654;
    float _6658 = _6654;
    if (!_6584)
    {
        _6648 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6660 = _6648;
    out.m_109.x = _6640;
    out.m_109.y = _6642;
    out.m_109.z = _6644;
    out.m_109.w = _6630;
    bool _6662 = !_6584;
    float _6664 = _6660;
    float _6666 = _6660;
    if (!_6662)
    {
        bool _6668 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6670 = isnan(_5935);
        bool _6672 = _6668 || _6670;
        bool _6674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6676 = _6672 || _6674;
        if (!_6676)
        {
            float _6678 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6680 = _5935 + _6678;
            float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6684 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6682;
            float _6686 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6688 = _6686 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6690 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6692 = _6690 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6694 = 1.0 / _6684;
            float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6708 = _6680 * _6694;
            float _6710 = precise::clamp(_6708, 0.0, 1.0);
            float _6712 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6714 = _6712 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6716 = fma(_6710, _6688, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6718 = fma(_6710, _6692, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6720 = fma(_6710, _6714, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6722 = fma(_6710, _6698, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6724 = fma(_6710, _6702, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6726 = fma(_6710, _6706, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6658 = _6716;
            _6608 = _6724;
            _6596 = _6718;
            _6602 = _6722;
            _6666 = _6720;
            _6652 = _6726;
            _6728 = true;
        }
        else
        {
            bool _6730 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6732 = isnan(_5935);
            bool _6734 = _6730 || _6732;
            bool _6736 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6738 = _6734 || _6736;
            if (!_6738)
            {
                _6600 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6740 = _6600;
            _6602 = _6740;
            if (!_6738)
            {
                _6606 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6742 = _6606;
            _6608 = _6742;
            if (!_6738)
            {
                _6650 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6744 = _6650;
            _6652 = _6744;
            if (!_6738)
            {
                _6594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6746 = _6594;
            _6596 = _6746;
            if (!_6738)
            {
                _6656 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6748 = _6656;
            _6658 = _6748;
            if (!_6738)
            {
                _6664 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6750 = _6664;
            bool _6752 = !_6738;
            _6666 = _6750;
            if (!_6752)
            {
                bool _6754 = _5935 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6756 = isnan(_5935);
                bool _6758 = _6754 || _6756;
                bool _6760 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6762 = _6758 || _6760;
                if (!_6762)
                {
                    float _6764 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6766 = _5935 + _6764;
                    float _6768 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6770 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6768;
                    float _6772 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6774 = _6772 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6776 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6778 = _6776 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6780 = 1.0 / _6770;
                    float _6782 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6784 = _6782 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6786 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6788 = _6786 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6792 = _6790 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6794 = _6766 * _6780;
                    float _6796 = precise::clamp(_6794, 0.0, 1.0);
                    float _6798 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6800 = _6798 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6802 = fma(_6796, _6774, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6804 = fma(_6796, _6778, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6806 = fma(_6796, _6800, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6808 = fma(_6796, _6784, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6810 = fma(_6796, _6788, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6812 = fma(_6796, _6792, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6658 = _6802;
                    _6608 = _6810;
                    _6596 = _6804;
                    _6602 = _6808;
                    _6666 = _6806;
                    _6652 = _6812;
                    _6728 = true;
                }
                else
                {
                    _6658 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6608 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6602 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6666 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6652 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6728 = false;
    float _6814 = _6658;
    float _6816 = _6608;
    float _6818 = _6596;
    float _6820 = _6602;
    float _6822 = _6666;
    float _6824 = _6652;
    float _6826 = fma(_6546, -0.5, 0.5);
    float _6828 = precise::clamp(_6826, 0.0, 1.0);
    float _6830 = -_6814;
    float _6832 = _6816 + _6830;
    float _6834 = _6638 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6836 = -_6818;
    float _6838 = _6820 + _6836;
    float _6840 = fma(_6828, _6832, _6814);
    out.m_111.x = 0.0;
    float _6842 = -_6822;
    float _6844 = _6824 + _6842;
    float _6846 = fma(_6828, _6838, _6818);
    float _6848 = _6840 * 0.586610972881317138671875;
    out.m_51.x = _6834;
    bool _6850 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6852 = fma(_6828, _6844, _6822);
    float _6854 = fma(_6846, 0.298911988735198974609375, _6848);
    bool _6856 = _5855 > 0.0;
    bool _6858 = isnan(_5855);
    bool _6860 = _6856 || _6858;
    bool _6862 = isnan(0.0);
    bool _6864 = _6860 || _6862;
    float _6866 = fma(_6852, 0.114477999508380889892578125, _6854);
    bool _6868 = _5913 <= 0.0;
    bool _6870 = !_6864;
    bool _6872 = _6868 || _6870;
    float _6874 = -_6866;
    float _6876 = _6846 + _6874;
    float _6878 = -_6866;
    float _6880 = _6840 + _6878;
    float _6882 = -_6866;
    float _6884 = _6852 + _6882;
    float _6886 = fma(_6876, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    float _6888 = fma(_6880, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    float _6890 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6866);
    bool _6892 = !_6850;
    if (!_6892)
    {
        float _6894 = -_5787;
        float _6896 = _6894 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6898 = -_5789;
        float _6900 = _6898 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6902 = -_5791;
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
        float _6936 = _6546 * _6926;
        float _6938 = -_6926;
        float _6940 = -_6934;
        float _6942 = fma(_6938, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6940);
        float _6944 = fma(_6544, _6924, _6936);
        float _6946 = -_6932;
        float _6948 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6942);
        float _6950 = fma(_6548, _6932, _6944);
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
        out.m_111.x = _6970;
        out.m_111.y = _6972;
        out.m_111.z = _6974;
    }
    out.m_113.x = _6886;
    out.m_113.y = _6888;
    out.m_113.z = _6890;
    if (!_6872)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _6976 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6976;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

