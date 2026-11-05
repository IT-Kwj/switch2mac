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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_71 [[user(locn0)]];
    float4 m_73 [[user(locn1)]];
    float4 m_57 [[user(locn2)]];
    float4 m_113 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_81 [[user(locn5)]];
    float4 m_105 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_97 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 m_111 [[user(locn14)]];
    float4 m_101 [[user(locn15)]];
    float4 m_107 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_103 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_63 [[attribute(2)]];
    float4 m_65 [[attribute(3)]];
    float4 m_85 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_52 [[attribute(7)]];
    float4 m_91 [[attribute(8)]];
    float4 m_89 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
    float4 m_69 [[attribute(11)]];
    float4 m_93 [[attribute(12)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5274 = false;
    bool _4361 = false;
    bool _712 = false;
    bool _526 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = in.m_52.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = as_type<float>(_134);
    float _148 = _138;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _144;
    if (!_142)
    {
        out.m_57.x = 0.0;
    }
    int _152 = 0;
    if (!_142)
    {
        float _154 = _150 * 5.0;
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    int _158 = _156;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5585 = as_type<float>(_156);
        out.gl_Position.z = _5585;
    }
    if (!_142)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _160 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_129);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = float(_134);
    bool _172 = _138 >= _170;
    bool _174 = !_168;
    bool _176 = _172 || _174;
    float _178 = 1.0 / _170;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _146;
    if (_176)
    {
        out.m_57.x = 0.0;
    }
    float _182 = _138 * _178;
    float _184 = _182;
    if (_176)
    {
        float _186 = _180 * 5.0;
        _158 = as_type<int>(_186);
    }
    int _188 = _158;
    out.m_55.x = _182;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5648 = as_type<float>(_188);
        out.gl_Position.z = _5648;
    }
    if (_176)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    float _210 = in.m_65.x;
    float _212 = in.m_65.y;
    float _214 = in.m_65.z;
    float _216 = _192 * _200;
    float _218 = _192 * _206;
    float _220 = fma(_190, _198, _216);
    float _222 = _192 * _212;
    float _224 = fma(_190, _204, _218);
    float _226 = fma(_194, _202, _220);
    float _228 = fma(_190, _210, _222);
    float _230 = fma(_194, _208, _224);
    float _232 = fma(_194, _214, _228);
    bool _234 = !_196;
    float _252;
    if (!_234)
    {
        float _236 = in.m_67.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        _252 = _182;
    }
    _254 = false;
    float _256 = _252;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _256 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _256 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = 1.0 / _276;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _272;
    bool _292 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_256);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _284;
    float _306 = 1.0 / _280;
    float _308 = _260 * _290;
    bool _310 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_256);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = _264 * _304;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _256 + _328;
    bool _332 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _334 = isnan(_256);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = isnan(_256);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _330 * _286;
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = -_342;
    float _364 = _362 + 1.0;
    float _366 = _268 * _306;
    float _368 = _354 * _360;
    float _370 = -_354;
    float _372 = _370 + 1.0;
    float _374 = _320 * _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _380 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_256);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _302 * _372;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -_302;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = fma(_396, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = fma(_400, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = _390 * _404;
    float _420 = fma(_324, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = fma(_408, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_378, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _410 * _418;
    float _430 = _412 * _418;
    float _432 = -_390;
    float _434 = _432 + 1.0;
    float _436 = _420 * _418;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _444 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_422, _392, _442);
    float _458 = fma(_424, _392, _444);
    float _460 = fma(_426, _392, _446);
    float _462 = fma(_450, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_440, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_454, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_462, _368, _456);
    float _482 = fma(_470, _356, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _356, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _356, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_464, _368, _458);
    float _490 = fma(_466, _368, _460);
    float _492 = fma(_482, _374, _480);
    float _494 = fma(_484, _374, _488);
    float _496 = fma(_486, _374, _490);
    float _498 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].x, _492);
    float _500 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].y, _494);
    float _502 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].z, _496);
    bool _504 = !_288;
    float _506 = _308;
    float _524;
    if (!_504)
    {
        float _508 = in.m_67.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _524 = _522;
        _526 = true;
    }
    else
    {
        _524 = _182;
    }
    _526 = false;
    float _528 = _524;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _528 + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_528);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _558 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _560 = isnan(_528);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = 1.0 / _536;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _572;
    float _576 = -_552;
    float _578 = _576 + 1.0;
    bool _580 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_528);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    bool _592 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _594 = 1.0 / _540;
    float _596 = 1.0 / _556;
    float _598 = _574 * _570;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _604 = _568 * _578;
    float _606 = -_568;
    float _608 = _606 + 1.0;
    float _610 = fma(_598, _532, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _612 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _614 = isnan(_528);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = _590 * _608;
    float _626 = _602 * _594;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _634 = _528 + _632;
    float _636 = _610 * _624;
    float _638 = -_590;
    float _640 = _638 + 1.0;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    float _646 = fma(_626, _634, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _648 = _630 * _596;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _652 = _528 + _650;
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _636);
    float _656 = _552 * _644;
    float _658 = fma(_648, _652, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _660 = fma(_646, _604, _654);
    float _662 = fma(_658, _656, _660);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _662);
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _678 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = in.m_69.x;
    float _682 = in.m_69.y;
    float _684 = in.m_69.z;
    out.m_71.x = _672;
    out.m_71.y = _674;
    out.m_71.z = _678;
    out.m_71.w = _676;
    float _686 = _502 * _684;
    float _688 = _500 * _682;
    float _690 = _498 * _680;
    bool _692 = !_592;
    float _710;
    if (!_692)
    {
        float _694 = in.m_67.x;
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        _710 = _182;
    }
    _712 = false;
    float _714 = _710;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _718 = _714 + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _726 = isnan(_714);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _744 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_714);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = 1.0 / _722;
    float _758 = -_734;
    float _760 = _758 + 1.0;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _762;
    bool _766 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _768 = isnan(_714);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _754 * _760;
    float _780 = -_754;
    float _782 = _780 + 1.0;
    bool _784 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _786 = 1.0 / _738;
    float _788 = _776 * _782;
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = 1.0 / _742;
    float _796 = _764 * _756;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _802 = fma(_796, _718, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _804 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _806 = isnan(_714);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _800 * _786;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _824 = _714 + _822;
    float _826 = _802 * _788;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _830 = _714 + _828;
    float _832 = fma(_816, _824, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _834 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[131].x, _826);
    float _836 = _820 * _794;
    float _838 = -_814;
    float _840 = _838 + 1.0;
    float _842 = fma(_832, _778, _834);
    float _844 = fma(_836, _830, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _846 = _734 * _840;
    float _848 = fma(_844, _846, _842);
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _856 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[134].x, _848);
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _862 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = _856 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _858;
    out.m_73.y = _860;
    out.m_73.z = _862;
    out.m_73.w = _864;
    bool _866 = !_784;
    if (!_866)
    {
        float _868 = in.m_67.x;
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _184 = _882;
    }
    float _884 = _184;
    float _886 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _888 = int(_886);
    float _890 = in.m_75.x;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _898 = _896 != 0;
    float _900 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _902 = int(_900);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _910 = _908 != 0;
    float _912 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _914 = int(_912);
    float _916 = float(_888);
    float _918 = 0.0;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _922 = _894;
    float _924 = _890;
    if (_894)
    {
        _918 = 1.0;
    }
    float _926 = _918;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _930 = _928 != 0;
    float _932 = 0.0;
    float _934 = _926;
    bool _936 = _910;
    if (_894)
    {
        _932 = 1.0;
    }
    float _938 = _932;
    float _940 = float(_902);
    float _942 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _944 = int(_942);
    float _946 = 0.0;
    float _948 = _938;
    if (_898)
    {
        float _950 = in.m_67.x;
        _946 = _950;
    }
    float _952 = _946;
    int _954 = 0;
    if (_894)
    {
        _954 = 0;
    }
    int _956 = _954;
    int _958 = _956;
    if (_894)
    {
        _920 = 0;
    }
    int _960 = _920;
    int _962 = int(_894);
    int _964 = _910 ? 2 : 0;
    int _966 = _962 | _964;
    int _968 = _898 ? 4 : 0;
    int _970 = _966 | _968;
    int _972 = _906 ? 8 : 0;
    int _974 = _970 | _972;
    int _976 = false ? 16 : 0;
    int _978 = _974 | _976;
    int _980 = false ? 32 : 0;
    int _982 = _978 | _980;
    int _984 = _930 ? 64 : 0;
    int _986 = _982 | _984;
    int _988 = _986 & 2;
    float _990 = float(_914);
    float _992 = 1.0 / _916;
    int _994 = _960;
    float _996 = as_type<float>(_988);
    if (_906)
    {
        float _998 = in.m_67.z;
        _506 = _998;
    }
    float _1000 = _506;
    float _1002 = 1.0 / _940;
    float _1004 = float(uint(_944));
    float _1006 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1008 = int(_1006);
    float _1010 = _992 * _138;
    float _1012 = 1.0 / _990;
    float _1014 = _1002 * _138;
    float _1016 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1018 = int(_1016);
    float _1020 = float(uint(_1008));
    float _1022 = 1.0 / _1004;
    float _1024 = _1012 * _138;
    float _1026 = trunc(_1010);
    int _1028 = int(_1026);
    float _1030 = float(uint(_1018));
    float _1032 = 1.0 / _1020;
    int _1034 = as_type<int>(_1022) + (-2);
    float _1036 = _1022;
    if (_894)
    {
        float _1038 = in.m_67.x;
        _1036 = _1038;
    }
    float _1040 = _1036;
    float _1042 = trunc(_1014);
    int _1044 = int(_1042);
    float _1046 = float(uint(_1028));
    float _1048 = in.m_67.y;
    float _1050 = 1.0 / _1030;
    int _1052 = as_type<int>(_1032) + (-2);
    int _1054 = ~_1008;
    int _1056 = _1054 + 1;
    float _1058 = trunc(_1024);
    int _1060 = int(_1058);
    float _1062 = float(uint(_1044));
    float _1064 = as_type<float>(_1034) * _1046;
    float _1066 = as_type<float>(_1052) * _1062;
    int _1068 = as_type<int>(_1050) + (-2);
    float _1070 = trunc(_1064);
    float _1072 = precise::max(_1070, 0.0);
    uint _1075 = uint(_1072);
    float _1077 = 0.0;
    float _1079 = _1066;
    float _1081 = _1040;
    if (_894)
    {
        _1077 = _1048;
    }
    float _1083 = _1077;
    float _1085 = float(uint(_1060));
    float _1087 = trunc(_1066);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = as_type<float>(_1068) * _1085;
    float _1095 = _1085;
    float _1097 = _1083;
    if (_894)
    {
        _1095 = _1040;
    }
    float _1099 = _1095;
    float _1101 = _1099;
    if (_894)
    {
        _1079 = _1099;
    }
    float _1103 = _1079;
    float _1105 = trunc(_1093);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    float _1111 = 0.0;
    float _1113 = _1103;
    if (_894)
    {
        _1111 = _1099;
    }
    float _1115 = _1111;
    int _1117 = _1056 * int(_1091);
    int _1119 = _1117 + _1044;
    float _1121 = _1115;
    int _1123 = _1119;
    if (!_894)
    {
        float _1125 = in.m_67.x;
        float _1127 = _1048 * 3.1415927410125732421875;
        float _1129 = in.m_67.z;
        float _1131 = _1127 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1125 * 3.1415927410125732421875;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = _1139 * 6.283185482025146484375;
        float _1143 = sin(_1141);
        _1081 = _1125;
        _934 = 7.345489978790283203125;
        _1113 = _1129;
        _948 = 5.839270114898681640625;
        _1101 = _1048;
        _994 = 2;
        _958 = 1;
        _1097 = _1135;
        _1121 = _1143;
    }
    float _1145 = _1081;
    float _1147 = _934;
    float _1149 = _1113;
    float _1151 = _948;
    float _1153 = _1101;
    int _1155 = _994;
    int _1157 = _958;
    float _1159 = _1097;
    float _1161 = _1121;
    float _1163 = float(uint(_1119));
    float _1165 = _1145 * _1147;
    float _1167 = _1149 * _1151;
    int _1169 = ~_944;
    int _1171 = _1169 + 1;
    int _1173 = _1171;
    if (_898)
    {
        float _1175 = -_890;
        float _1177 = _1175 + 1.0;
        _1123 = as_type<int>(_1177);
    }
    int _1179 = _1123;
    float _1181 = as_type<float>(_1052) * _1163;
    float _1183 = floor(_1165);
    if (_898)
    {
        bool _1185 = _952 > 0.5;
        _922 = _1185;
    }
    bool _1187 = _922;
    float _1189 = _1153 * _1147;
    if (_906)
    {
        bool _1191 = _1000 > 0.5;
        _936 = _1191;
    }
    bool _1193 = _936;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1197 = _1195 != 0;
    if (_906)
    {
        float _1199 = -_890;
        float _1201 = _1199 + 1.0;
        _1173 = as_type<int>(_1201);
    }
    int _1203 = _1173;
    float _1205 = 0.0;
    if (!_898)
    {
        _1205 = _890;
    }
    float _1207 = _1205;
    float _1209 = trunc(_1181);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    float _1215 = _1207;
    if (_898)
    {
        float _1217 = _1187 ? as_type<float>(_1179) : _890;
        _1215 = _1217;
    }
    float _1219 = _1215;
    int _1221 = _1171 * int(_1075);
    int _1223 = _1221 + _1028;
    int _1225 = ~_1018;
    int _1227 = _1225 + 1;
    bool _1229 = !_1197;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = 0.0;
    if (!_906)
    {
        _1233 = _890;
    }
    float _1235 = _1233;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1239 = _1237 != 0;
    float _1241 = _1235;
    if (_906)
    {
        float _1243 = _1193 ? as_type<float>(_1203) : _890;
        _1241 = _1243;
    }
    float _1245 = _1241;
    float _1247 = floor(_1167);
    int _1249 = ~_1008;
    int _1251 = _1249 + 1;
    float _1253 = _178 * _138;
    float _1255 = float(_1008);
    float _1257 = in.m_75.y;
    int _1259 = abs(_1231);
    bool _1261 = !_1239;
    int _1263 = _1261 ? 0 : 1;
    float _1265 = floor(_1189);
    int _1267 = int(_1091) + int(_1213);
    int _1269 = _1227 * int(_1109);
    int _1271 = _1269 + _1060;
    float _1273 = float(uint(_1223));
    float _1275 = -_1183;
    float _1277 = _1165 + _1275;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1281 = _1279 != 0;
    int _1283 = _1251 * _1267;
    int _1285 = _1283 + _1044;
    float _1287 = float(uint(_1271));
    float _1289 = as_type<float>(_1034) * _1273;
    float _1291 = -_1247;
    float _1293 = _1167 + _1291;
    float _1295 = _1255 * _1253;
    bool _1297 = uint(_1285) >= uint(_1008);
    float _1299 = trunc(_1289);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = as_type<float>(_1068) * _1287;
    float _1307 = float(_1018);
    bool _1309 = _1155 != 2;
    float _1311 = -_1265;
    float _1313 = _1189 + _1311;
    float _1315 = float(_944);
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1319 = _1317 != 0;
    float _1321 = float(_1028);
    float _1323 = trunc(_1305);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    float _1329 = _1255 * _1293;
    float _1331 = float(_1060);
    float _1333 = _1145 * 2.0;
    bool _1335 = _1321 >= _1315;
    bool _1337 = isnan(_1321);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan(_1315);
    bool _1343 = _1339 || _1341;
    float _1345 = float(_1343);
    float _1347 = _1315 * _1277;
    float _1349 = float(_1044);
    float _1351 = _1315 * _1253;
    float _1353 = trunc(_1329);
    int _1355 = int(_1353);
    float _1357 = _1307 * _1253;
    bool _1359 = _1349 >= _1255;
    bool _1361 = isnan(_1349);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(_1255);
    bool _1367 = _1363 || _1365;
    float _1369 = float(_1367);
    float _1371 = _1307 * _1313;
    bool _1373 = _1331 >= _1307;
    bool _1375 = isnan(_1331);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan(_1307);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = in.m_63.w;
    bool _1387 = !_1297;
    int _1389 = _1387 ? 0 : (-1);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1393 = _884 + _1391;
    float _1395 = trunc(_1369);
    int _1397 = int(_1395);
    int _1399 = int(_1075) + int(_1303);
    float _1401 = in.m_61.w;
    int _1403 = ~_1267;
    int _1405 = _1403 + _1389;
    int _1407 = _1405 + 1;
    int _1409 = ~_944;
    int _1411 = _1409 + 1;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1415 = _1413 != 0;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1419 = _1417 != 0;
    int _1421 = _1355 * _1259;
    int _1423 = _1421 + _1044;
    bool _1425 = _1008 == 0;
    int _1427 = _1008 * _1407;
    int _1429 = _1427 + _1044;
    float _1431 = trunc(_1295);
    int _1433 = int(_1431);
    int _1435 = int(_1109) + int(_1327);
    int _1437 = ~_1018;
    int _1439 = _1437 + 1;
    int _1441 = _1411 * _1399;
    int _1443 = _1441 + _1028;
    int _1445 = ~_1397;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    bool _1451 = !_1419;
    int _1453 = _1451 ? 0 : 1;
    int _1455 = _1439 * _1435;
    int _1457 = _1455 + _1060;
    bool _1459 = !_1425;
    int _1461 = _1459 ? _1429 : (-1);
    float _1463 = trunc(_1345);
    int _1465 = int(_1463);
    bool _1467 = !_1415;
    int _1469 = _1467 ? 0 : 1;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1473 = _1471 != 0;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1477 = _1475 != 0;
    bool _1479 = uint(_1443) >= uint(_944);
    int _1481 = _1461 * _1449;
    int _1483 = _1008 + (-1);
    float _1485 = trunc(_1383);
    int _1487 = int(_1485);
    bool _1489 = !_1477;
    int _1491 = _1489 ? 0 : 1;
    bool _1493 = uint(_1457) >= uint(_1018);
    int _1495 = _1397 * _1483;
    int _1497 = _1495 + _1481;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1501 = _1499 != 0;
    bool _1503 = !_1473;
    int _1505 = _1503 ? 0 : 1;
    float _1507 = trunc(_1351);
    int _1509 = int(_1507);
    int _1511 = abs(_1491);
    bool _1513 = !_1501;
    int _1515 = _1513 ? 0 : 1;
    int _1517 = abs(_1505);
    float _1519 = floor(_1333);
    int _1521 = abs(_1515);
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1525 = _1523 != 0;
    int _1527 = _1497 * _1511;
    bool _1529 = !_1525;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1535 = _1433 * _1517;
    int _1537 = _1535 + _1527;
    int _1539 = abs(_1531);
    int _1541 = _1521;
    int _1543 = _1487;
    float _1545 = as_type<float>(_1399);
    if (_930)
    {
        float _1547 = -_890;
        float _1549 = _1547 + 1.0;
        _1541 = as_type<int>(_1549);
    }
    int _1551 = _1541;
    bool _1553 = !_1479;
    int _1555 = _1553 ? 0 : (-1);
    int _1557 = _1423 * _1521;
    int _1559 = _1557 + _1537;
    bool _1561 = _944 == 0;
    float _1563 = trunc(_1347);
    int _1565 = int(_1563);
    int _1567 = ~_1399;
    int _1569 = _1567 + _1555;
    int _1571 = _1569 + 1;
    int _1573 = _1355 * _1539;
    int _1575 = _1573 + _1559;
    bool _1577 = !_1493;
    int _1579 = _1577 ? 0 : (-1);
    int _1581 = ~_1465;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    int _1587 = _944 * _1571;
    int _1589 = _1587 + _1028;
    int _1591 = ~_1435;
    int _1593 = _1591 + _1579;
    int _1595 = _1593 + 1;
    float _1597 = float(uint(_1575));
    bool _1599 = !_1561;
    int _1601 = _1599 ? _1589 : (-1);
    int _1603 = _1018 * _1595;
    int _1605 = _1603 + _1060;
    int _1607 = _944 + (-1);
    float _1609 = as_type<float>(_1052) * _1597;
    bool _1611 = _1018 == 0;
    int _1613 = _1601 * _1585;
    int _1615 = abs(_1263);
    bool _1617 = !_1281;
    int _1619 = _1617 ? 0 : 1;
    int _1621 = abs(_1453);
    float _1623 = trunc(_1609);
    float _1625 = precise::max(_1623, 0.0);
    uint _1627 = uint(_1625);
    int _1629 = _1465 * _1607;
    int _1631 = _1629 + _1613;
    int _1633 = abs(_1469);
    int _1635 = _1565 * _1615;
    int _1637 = _1635 + _1028;
    int _1639 = ~_1487;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1631 * _1621;
    bool _1647 = !_1611;
    int _1649 = _1647 ? _1605 : (-1);
    bool _1651 = _1157 != 1;
    int _1653 = ~_1008;
    int _1655 = _1653 + 1;
    int _1657 = _1509 * _1633;
    int _1659 = _1657 + _1645;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1663 = _1661 != 0;
    int _1665 = _1649 * _1643;
    float _1667 = in.m_67.w;
    bool _1669 = !_1663;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1675 = _1673 != 0;
    int _1677 = _1655 * int(_1627);
    int _1679 = _1677 + _1575;
    int _1681 = abs(_1671);
    float _1683 = trunc(_1357);
    int _1685 = int(_1683);
    bool _1687 = !_1675;
    int _1689 = _1687 ? 0 : 1;
    float _1691 = float(uint(_1679));
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1695 = _1693 != 0;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1699 = _1697 != 0;
    float _1701 = as_type<float>(_1052) * _1691;
    int _1703 = _1018 + (-1);
    int _1705 = _1637 * _1681;
    int _1707 = _1705 + _1659;
    int _1709 = abs(_1689);
    float _1711 = trunc(_1701);
    float _1713 = precise::max(_1711, 0.0);
    uint _1715 = uint(_1713);
    bool _1717 = !_1699;
    int _1719 = _1717 ? 0 : 1;
    int _1721 = _1487 * _1703;
    int _1723 = _1721 + _1665;
    float _1725 = float(uint(_1423));
    int _1727 = _1565 * _1709;
    int _1729 = _1727 + _1707;
    int _1731 = abs(_1719);
    bool _1733 = !_1695;
    int _1735 = _1733 ? 0 : 1;
    float _1737 = as_type<float>(_1052) * _1725;
    int _1739 = ~_1008;
    int _1741 = _1739 + 1;
    int _1743 = _1723 * _1731;
    float _1745 = float(uint(_1729));
    float _1747 = trunc(_1737);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    int _1753 = abs(_1735);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1757 = _1755 != 0;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1761 = _1759 != 0;
    float _1763 = as_type<float>(_1034) * _1745;
    int _1765 = int(_1627) + int(_1715);
    int _1767 = _1685 * _1753;
    int _1769 = _1767 + _1743;
    float _1771 = trunc(_1763);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    bool _1777 = _1667 > 0.5;
    int _1779 = ~_1008;
    int _1781 = _1779 + 1;
    int _1783 = _1741 * _1765;
    int _1785 = _1783 + _1575;
    bool _1787 = !_1757;
    int _1789 = _1787 ? 0 : 1;
    int _1791 = ~_944;
    int _1793 = _1791 + 1;
    float _1795 = trunc(_1371);
    int _1797 = int(_1795);
    bool _1799 = uint(_1785) >= uint(_1008);
    int _1801 = _1781 * int(_1751);
    int _1803 = _1801 + _1423;
    int _1805 = abs(_1789);
    float _1807 = float(uint(_1637));
    bool _1809 = _988 != 0;
    int _1811 = _1793 * int(_1775);
    int _1813 = _1811 + _1729;
    int _1815 = abs(_1619);
    float _1817 = as_type<float>(_1034) * _1807;
    float _1819 = float(uint(_1803));
    float _1821 = float(uint(_1813));
    bool _1823 = !_1799;
    int _1825 = _1823 ? 0 : (-1);
    int _1827 = _1797 * _1815;
    int _1829 = _1827 + _1060;
    bool _1831 = !_1761;
    int _1833 = _1831 ? 0 : 1;
    float _1835 = as_type<float>(_1034) * _1821;
    float _1837 = as_type<float>(_1052) * _1819;
    int _1839 = _1829 * _1805;
    int _1841 = _1839 + _1769;
    int _1843 = abs(_1833);
    float _1845 = as_type<float>(_1575);
    if (_1809)
    {
        float _1847 = -_890;
        float _1849 = _1847 + 1.0;
        _1543 = as_type<int>(_1849);
    }
    int _1851 = _1543;
    float _1853 = trunc(_1817);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    int _1859 = ~_944;
    int _1861 = _1859 + 1;
    int _1863 = ~_1765;
    int _1865 = _1863 + _1825;
    int _1867 = _1865 + 1;
    bool _1869 = _1008 == 0;
    int _1871 = _1797 * _1843;
    int _1873 = _1871 + _1841;
    float _1875 = trunc(_1835);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    int _1881 = _1008 * _1867;
    int _1883 = _1881 + _1575;
    bool _1885 = _1048 > 0.5;
    float _1887 = float(uint(_1873));
    int _1889 = _1861 * int(_1857);
    int _1891 = _1889 + _1637;
    bool _1893 = !_1869;
    int _1895 = _1893 ? _1883 : (-1);
    float _1897 = trunc(_1837);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    float _1903 = as_type<float>(_1068) * _1887;
    if (!_1809)
    {
        _1845 = _890;
    }
    float _1905 = _1845;
    float _1907 = float(uint(_1891));
    float _1909 = _1905;
    if (_1809)
    {
        float _1911 = _1885 ? as_type<float>(_1851) : _890;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    int _1921 = int(_1775) + int(_1879);
    float _1923 = as_type<float>(_1034) * _1907;
    float _1925 = float(uint(_1829));
    int _1927 = _1895 & 3;
    bool _1929 = _1927 != 0;
    int _1931 = _1895 & 3;
    bool _1933 = _1931 != 0;
    float _1935 = as_type<float>(_1068) * _1925;
    int _1937 = _1929 ? 0 : 1;
    float _1939 = in.m_67.z;
    bool _1941 = uint(_1931) > 1u;
    float _1943 = trunc(_1923);
    float _1945 = precise::max(_1943, 0.0);
    uint _1947 = uint(_1945);
    int _1949 = ~_1018;
    int _1951 = _1949 + 1;
    int _1953 = ~_944;
    int _1955 = _1953 + 1;
    int _1957 = int(_1751) + int(_1901);
    int _1959 = _1951 * int(_1919);
    int _1961 = _1959 + _1873;
    float _1963 = -_1257;
    float _1965 = _1963 + 1.0;
    float _1967 = trunc(_1935);
    float _1969 = precise::max(_1967, 0.0);
    uint _1971 = uint(_1969);
    int _1973 = _1955 * _1921;
    int _1975 = _1973 + _1729;
    int _1977 = ~_1937;
    int _1979 = _1977 + 1;
    int _1981 = _1979 + 1;
    float _1983 = float(uint(_1961));
    int _1985 = _1981;
    float _1987 = as_type<float>(_1919);
    if (!_1941)
    {
        int _1989 = ~_1937;
        int _1991 = _1989 + 1;
        _1985 = _1991;
    }
    int _1993 = _1985;
    int _1995 = ~_1018;
    int _1997 = _1995 + 1;
    float _1999 = as_type<float>(_1068) * _1983;
    int _2001 = _1777 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2003 = uint(_1975) >= uint(_944);
    float _2005 = trunc(_1999);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    if (_930)
    {
        float _2011 = _1885 ? as_type<float>(_1551) : _890;
        _924 = _2011;
    }
    float _2013 = _924;
    int _2015 = _1997 * int(_1971);
    int _2017 = _2015 + _1829;
    bool _2019 = !_2003;
    int _2021 = _2019 ? 0 : (-1);
    int _2023 = _1885 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2025 = uint(_1931) >= 2u;
    bool _2027 = _1931 != 3;
    float _2029 = float(uint(_2017));
    int _2031 = _2025 ? 0 : 1;
    float _2033 = as_type<float>(_1068) * _2029;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2037 = _2035 != 0;
    int _2039 = ~_1921;
    int _2041 = _2039 + _2021;
    int _2043 = _2041 + 1;
    int _2045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2047 = _2045 != 0;
    int _2049 = ~_2031;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    int _2055 = ~_1008;
    int _2057 = _2055 + 1;
    int _2059 = _2053;
    if (_2027)
    {
        int _2061 = ~_2031;
        int _2063 = _2061 + 1;
        _2059 = _2063;
    }
    int _2065 = _2059;
    int _2067 = ~_1018;
    int _2069 = _2067 + 1;
    int _2071 = _2057 * _1957;
    int _2073 = _2071 + _1423;
    int _2075 = int(_1919) + int(_2009);
    int _2077 = int(_1857) + int(_1947);
    int _2079 = _944 * _2043;
    int _2081 = _2079 + _1729;
    if (_1309)
    {
        _1987 = _1145;
    }
    float _2083 = _1987;
    int _2085 = _2069 * _2075;
    int _2087 = _2085 + _1873;
    float _2089 = 0.0;
    float _2091 = _2083;
    if (_1309)
    {
        _2089 = _1048;
    }
    float _2093 = _2089;
    float _2095 = trunc(_2033);
    float _2097 = precise::max(_2095, 0.0);
    uint _2099 = uint(_2097);
    bool _2101 = _944 == 0;
    float _2103 = _2093;
    if (!_1309)
    {
        _2091 = _1939;
    }
    float _2105 = _2091;
    if (!_1309)
    {
        _2103 = _1145;
    }
    float _2107 = _2103;
    bool _2109 = _1939 > 0.5;
    bool _2111 = !_2101;
    int _2113 = _2111 ? _2081 : (-1);
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_1651)
    {
        _996 = _1048;
    }
    float _2117 = _996;
    float _2119 = 0.0;
    float _2121 = _2117;
    if (!_1651)
    {
        _2119 = _1048;
    }
    float _2123 = _2119;
    float _2125 = 0.0;
    float _2127 = _2123;
    if (!_1651)
    {
        _2125 = _1939;
    }
    float _2129 = _2125;
    float _2131 = _2129;
    if (!_1651)
    {
        _1545 = _1939;
    }
    float _2133 = _1545;
    bool _2135 = uint(_2073) >= uint(_1008);
    float _2137 = _2133;
    if (_1651)
    {
        _2121 = _1145;
    }
    float _2139 = _2121;
    if (_1651)
    {
        _2127 = _1145;
    }
    float _2141 = _2127;
    if (_1651)
    {
        _2131 = _1048;
    }
    float _2143 = _2131;
    float _2145 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1651)
    {
        _2137 = _1048;
    }
    float _2147 = _2137;
    int _2149 = _2109 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2151 = uint(_2087) >= uint(_1018);
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2155 = _2153 != 0;
    int _2157 = _2113 & 3;
    bool _2159 = !_2135;
    int _2161 = _2159 ? 0 : (-1);
    float _2163 = _1319 ? as_type<float>(_2149) : _1257;
    bool _2165 = !_2151;
    int _2167 = _2165 ? 0 : (-1);
    int _2169 = ~_944;
    int _2171 = _2169 + 1;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2175 = _2173 != 0;
    bool _2177 = uint(_2157) > 1u;
    int _2179 = _2171 * _2077;
    int _2181 = _2179 + _1637;
    float _2183 = _2037 ? as_type<float>(_2023) : _1257;
    bool _2185 = !_2175;
    int _2187 = _2185 ? 0 : 1;
    int _2189 = _2113 & 3;
    bool _2191 = _2189 != 0;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2195 = _2193 != 0;
    float _2197 = _2047 ? as_type<float>(_2001) : _1257;
    int _2199 = _2191 ? 0 : 1;
    float _2201 = _2155 ? as_type<float>(_2149) : _1257;
    bool _2203 = uint(_2181) >= uint(_944);
    int _2205 = int(_1971) + int(_2099);
    int _2207 = ~_2199;
    int _2209 = _2207 + 1;
    int _2211 = _2209 + 1;
    int _2213 = _2211;
    if (!_2177)
    {
        int _2215 = ~_2199;
        int _2217 = _2215 + 1;
        _2213 = _2217;
    }
    int _2219 = _2213;
    bool _2221 = !_2203;
    int _2223 = _2221 ? 0 : (-1);
    int _2225 = ~_2075;
    int _2227 = _2225 + _2167;
    int _2229 = _2227 + 1;
    bool _2231 = _2157 != 3;
    float _2233 = in.m_50.x;
    float _2235 = in.m_50.y;
    float _2237 = in.m_50.z;
    int _2239 = ~_1018;
    int _2241 = _2239 + 1;
    int _2243 = _1018 * _2229;
    int _2245 = _2243 + _1873;
    bool _2247 = uint(_2157) >= 2u;
    int _2249 = _2241 * _2205;
    int _2251 = _2249 + _1829;
    int _2253 = _2247 ? 0 : 1;
    bool _2255 = !_1611;
    int _2257 = _2255 ? _2245 : (-1);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2261 = _2259 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2263 = ~_2253;
    int _2265 = _2263 + 1;
    int _2267 = _2265 + 1;
    bool _2269 = uint(_2251) >= uint(_1018);
    int _2271 = _2267;
    if (_2231)
    {
        int _2273 = ~_2253;
        int _2275 = _2273 + 1;
        _2271 = _2275;
    }
    int _2277 = _2271;
    float _2279 = 1.0 / _2261;
    int _2281 = _2257 & 3;
    bool _2283 = !_2269;
    int _2285 = _2283 ? 0 : (-1);
    bool _2287 = uint(_2281) > 1u;
    int _2289 = _2257 & 3;
    bool _2291 = _2289 != 0;
    float _2293 = _206 * _2235;
    float _2295 = _200 * _2235;
    float _2297 = _212 * _2235;
    int _2299 = _2291 ? 0 : 1;
    float _2301 = fma(_204, _2233, _2293);
    float _2303 = fma(_198, _2233, _2295);
    float _2305 = fma(_210, _2233, _2297);
    int _2307 = ~_2299;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = fma(_202, _2237, _2303);
    int _2315 = _2311;
    if (!_2287)
    {
        int _2317 = ~_2299;
        int _2319 = _2317 + 1;
        _2315 = _2319;
    }
    int _2321 = _2315;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2327 = uint(_2281) >= 2u;
    float _2329 = fma(_208, _2237, _2301);
    float _2331 = fma(_214, _2237, _2305);
    int _2333 = _2327 ? 0 : 1;
    float _2335 = _1048 * 2.0;
    bool _2337 = _2281 != 3;
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2341 = _2339 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2343 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2345 = 1.0 / _2325;
    int _2347 = ~_2333;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2359 = _2329 + _1385;
    float _2361 = floor(_2335);
    int _2363 = _2351;
    if (_2337)
    {
        int _2365 = ~_2333;
        int _2367 = _2365 + 1;
        _2363 = _2367;
    }
    int _2369 = _2363;
    float _2371 = fma(_2343, -2.0, _2357);
    bool _2373 = _1519 >= 0.0;
    bool _2375 = isnan(_1519);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2385 = _2383 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2389 = _2387 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2391 = _2381 ? 0 : 1;
    float _2393 = 1.0 / _2341;
    bool _2395 = _1519 > 0.0;
    float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2399 = _2397 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2401;
    int _2405 = ~_2391;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    float _2411 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2413 = 1.0 / _2355;
    float _2415 = _2403 * _2279;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2419 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2417;
    int _2421 = ~_1957;
    int _2423 = _2421 + _2161;
    int _2425 = _2423 + 1;
    float _2427 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2371);
    bool _2429 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2431 = isnan(_884);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = _2409;
    if (!_2395)
    {
        int _2443 = ~_2391;
        int _2445 = _2443 + 1;
        _2441 = _2445;
    }
    int _2447 = _2441;
    float _2449 = 1.0 / _2385;
    bool _2451 = _2361 >= 0.0;
    bool _2453 = isnan(_2361);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan(0.0);
    bool _2459 = _2455 || _2457;
    float _2461 = _2419 * _2393;
    int _2463 = _1008 * _2425;
    int _2465 = _2463 + _1423;
    int _2467 = _2459 ? 0 : 1;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2471 = _884 + _2469;
    bool _2473 = _2361 > 0.0;
    float _2475 = 1.0 / _2389;
    float _2477 = fma(_2415, _2471, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2479 = ~_2467;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    float _2485 = -_2439;
    float _2487 = _2485 + 1.0;
    bool _2489 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2491 = isnan(_884);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    bool _2501 = !_1869;
    int _2503 = _2501 ? _2465 : (-1);
    float _2505 = 1.0 / _2399;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2513 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2511;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2517 = _2515 != 0;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2525 = _2523 != 0;
    float _2527 = _2509 * _2345;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2537;
    float _2541 = _2513 * _2475;
    float _2543 = _2531 * _2413;
    float _2545 = _1048 + _1939;
    float _2547 = _2535 * _2449;
    bool _2549 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2551 = isnan(_884);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2557 = _2553 || _2555;
    float _2559 = float(_2557);
    float _2561 = _1939 * 2.0;
    float _2563 = _2545 + (-1.0);
    float _2565 = _2539 * _2505;
    int _2567 = _2483;
    if (!_2473)
    {
        int _2569 = ~_2467;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = floor(_2561);
    float _2577 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2579 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2581 = isnan(_884);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2587 = _2583 || _2585;
    float _2589 = float(_2587);
    float _2591 = -_2559;
    float _2593 = _2591 + 1.0;
    bool _2595 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2597 = isnan(_884);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2603 = _2599 || _2601;
    float _2605 = float(_2603);
    bool _2607 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2609 = isnan(_884);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2615 = _2611 || _2613;
    float _2617 = float(_2615);
    float _2619 = _2589 * _2593;
    float _2621 = -_2589;
    float _2623 = _2621 + 1.0;
    float _2625 = -_2499;
    float _2627 = _2625 + 1.0;
    bool _2629 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2631 = isnan(_884);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2637 = _2633 || _2635;
    float _2639 = float(_2637);
    float _2641 = _2605 * _2623;
    float _2643 = -_2605;
    float _2645 = _2643 + 1.0;
    bool _2647 = !_1933;
    int _2649 = _2647 ? 0 : 1;
    bool _2651 = _2575 >= 0.0;
    bool _2653 = isnan(_2575);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan(0.0);
    bool _2659 = _2655 || _2657;
    float _2661 = _2499 * _2645;
    float _2663 = _2617 * _2627;
    float _2665 = -_2617;
    float _2667 = _2665 + 1.0;
    bool _2669 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2671 = isnan(_884);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    int _2681 = _2659 ? 0 : 1;
    float _2683 = _2639 * _2667;
    bool _2685 = _2575 > 0.0;
    float _2687 = in.m_65.w;
    float _2689 = -_2639;
    float _2691 = _2689 + 1.0;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2695 = _884 + _2693;
    float _2697 = _2679 * _2487;
    float _2699 = -_2679;
    float _2701 = _2699 + 1.0;
    float _2703 = _2439 * _2691;
    float _2705 = fma(_2527, _2695, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2707 = fma(_2461, _1393, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2709 = _2477 * _2697;
    float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2713 = _884 + _2711;
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2717 = _884 + _2715;
    bool _2719 = !_2517;
    int _2721 = _2719 ? 0 : 1;
    float _2723 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2709);
    float _2725 = fma(_2543, _2713, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2729 = _884 + _2727;
    float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2733 = _884 + _2731;
    float _2735 = fma(_2705, _2703, _2723);
    float _2737 = fma(_2541, _2717, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2739 = _2313 + _1401;
    float _2741 = fma(_2565, _2733, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2743 = fma(_2707, _2683, _2735);
    float _2745 = fma(_2411, _1245, -0.5);
    float _2747 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2749 = _2331 + _2687;
    float _2751 = fma(_2725, _2663, _2743);
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2755 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2757 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2761 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2765 = _2359 + _2763;
    float _2767 = -_2753;
    float _2769 = fma(_2755, 2.0, _2767);
    float _2771 = fma(_2747, -2.0, _2759);
    float _2773 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2761);
    float _2775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2777 = _2739 + _2775;
    float _2779 = _2765 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2783 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2787 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2779);
    float _2789 = -_2781;
    float _2791 = fma(_2783, 2.0, _2789);
    bool _2793 = !_2191;
    int _2795 = _2793 ? 0 : 1;
    float _2797 = fma(_2547, _2729, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2799 = _1931 != 3;
    float _2801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2803 = _2749 + _2801;
    float _2805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2807 = fma(_2737, _2661, _2751);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2787);
    float _2811 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2805);
    bool _2813 = !_2799;
    int _2815 = _2813 ? 0 : (-1);
    float _2817 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    float _2819 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2773);
    bool _2821 = _2809 >= 0.0;
    float _2823 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2811);
    float _2825 = -_138;
    float _2827 = fma(_2825, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2791);
    float _2829 = -_138;
    float _2831 = fma(_2829, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2769);
    float _2833 = fma(_2797, _2641, _2807);
    float _2835 = fma(_2823, _2757, _2827);
    float _2837 = fma(_2819, _2817, _2831);
    float _2839 = fma(_2183, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2841 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2843 = _2785 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2845 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2771);
    float _2847 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2841);
    float _2849 = fma(_2843, _2197, -0.5);
    float _2851 = _2757;
    float _2853 = _2749;
    if (_2821)
    {
        _2851 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2855 = _2851;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2859 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2847);
    float _2861 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    float _2863 = fma(_2741, _2619, _2833);
    float _2865 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2857);
    float _2867 = _2765 * _2765;
    int _2869 = as_type<int>(_2855);
    if (_2821)
    {
        float _2871 = _2855 * 5.0;
        _2869 = as_type<int>(_2871);
    }
    int _2873 = _2869;
    float _2875 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2865);
    float _2877 = fma(_2777, _2777, _2867);
    float _2879 = -_2845;
    float _2881 = fma(_2859, _2861, _2879);
    float _2883 = -_2427;
    float _2885 = fma(_2875, _2839, _2883);
    float _2887 = fma(_2803, _2803, _2877);
    float _2889 = _2885;
    if (_2821)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9602 = as_type<float>(_2873);
        out.gl_Position.z = _9602;
    }
    float _2891 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2893 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2895 = rsqrt(_2887);
    int _2897 = ~_2681;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    float _2903 = _1048 + _1145;
    int _2905 = _2901;
    if (!_2685)
    {
        int _2907 = ~_2681;
        int _2909 = _2907 + 1;
        _2905 = _2909;
    }
    int _2911 = _2905;
    if (_2821)
    {
        out.m_57.x = 0.0;
    }
    int _2913 = ~_2205;
    int _2915 = _2913 + _2285;
    int _2917 = _2915 + 1;
    float _2919 = _2903 + (-1.0);
    int _2921 = _1895 >> 31;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2927 = abs(_2369);
    int _2929 = _2921 & 3;
    float _2931 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2923);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2935 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2925);
    int _2937 = _1895 + _2929;
    float _2939 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2863);
    float _2941 = -_2933;
    float _2943 = fma(_2145, 2.0, _2941);
    float _2945 = _2765 * _2895;
    int _2947 = _2937 >> 2;
    float _2949 = _2777 * _2895;
    float _2951 = -_2945;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2765);
    int _2955 = _2947 << 4;
    int _2957 = _2955 + 656;
    float _2959 = -_2949;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2777);
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2965 = uint(int(uint(_2957) >> uint(2)));
    uint _2967 = uint(int(uint(int(_2965)) >> uint(2)));
    int _2969 = int(_2965) & 3;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[int(_2967)][_2969];
    int _2973 = int(_2965) + 1;
    uint _2975 = uint(int(uint(_2973) >> uint(2)));
    int _2977 = _2973 & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    float _2981 = _2953 * _2953;
    float _2983 = _2881 + 0.5;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2987 = -_2963;
    float _2989 = fma(_2893, 2.0, _2987);
    float _2991 = fma(_2961, _2961, _2981);
    float _2993 = fma(_2891, -2.0, _2985);
    int _2995 = _2957 + 8;
    uint _2997 = uint(int(uint(_2995) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = _2113 >> 31;
    out.m_77.x = _2939;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3017 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2935);
    int _3019 = _3013 & 3;
    float _3021 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2993);
    float _3023 = fma(_2115, -2.0, _3015);
    float _3025 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2931);
    float _3027 = -_138;
    float _3029 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2943);
    int _3031 = abs(_2721);
    float _3033 = -_3021;
    float _3035 = fma(_3017, _2849, _3033);
    int _3037 = _2113 + _3019;
    float _3039 = _2837 + 0.5;
    float _3041 = fma(_3025, _2745, _3029);
    float _3043 = float(_2911);
    float _3045 = _3035 + 0.5;
    int _3047 = _3037 >> 2;
    out.m_79.x = _3039;
    out.m_79.y = _2983;
    int _3049 = abs(_2649);
    float _3051 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3053 = int(_3051);
    int _3055 = _3047 << 4;
    int _3057 = _3055 + 368;
    float _3059 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3023);
    int _3061 = abs(_1993);
    uint _3063 = uint(int(uint(_3057) >> uint(2)));
    uint _3065 = uint(int(uint(int(_3063)) >> uint(2)));
    int _3067 = int(_3063) & 3;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[int(_3065)][_3067];
    int _3071 = int(_3063) + 1;
    uint _3073 = uint(int(uint(_3071) >> uint(2)));
    int _3075 = _3071 & 3;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[int(_3073)][_3075];
    int _3079 = _2257 >> 31;
    float _3081 = _2835 + 0.5;
    float _3083 = float(_3031);
    float _3085 = _2885 + 0.5;
    int _3087 = _3079 & 3;
    float _3089 = _3041 + 0.5;
    int _3091 = ~_3061;
    int _3093 = _3091 + 1;
    int _3095 = _3093 + 1;
    float _3097 = _3083 * _3043;
    int _3099 = _2257 + _3087;
    int _3101 = ~_3049;
    int _3103 = _3101 + 1;
    int _3105 = _3103 + 1;
    out.m_81.x = _3081;
    out.m_81.y = _3085;
    out.m_81.z = _3089;
    out.m_81.w = _3045;
    int _3107 = _3099 >> 2;
    int _3109 = _3095 * as_type<int>(_2979);
    int _3111 = ~_2077;
    int _3113 = _3111 + _2223;
    int _3115 = _3113 + 1;
    int _3117 = _3107 << 4;
    int _3119 = _3117 + 800;
    int _3121 = _3105 * as_type<int>(_2971);
    int _3123 = _3121 + _3109;
    float _3125 = float(uint(_3053));
    int _3127 = _944 * _3115;
    int _3129 = _3127 + _1637;
    int _3131 = abs(_2815);
    int _3133 = abs(_2187);
    bool _3135 = !_2195;
    int _3137 = _3135 ? 0 : 1;
    int _3139 = ~_3131;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    uint _3145 = uint(int(uint(_3119) >> uint(2)));
    uint _3147 = uint(int(uint(int(_3145)) >> uint(2)));
    int _3149 = int(_3145) & 3;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[int(_3147)][_3149];
    int _3153 = int(_3145) + 1;
    uint _3155 = uint(int(uint(_3153) >> uint(2)));
    int _3157 = _3153 & 3;
    float _3159 = (*spvDescriptorSet0.vp_c9)._m0[int(_3155)][_3157];
    int _3161 = abs(_2065);
    float _3163 = 1.0 / _3125;
    int _3165 = abs(_3053);
    int _3167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3169 = _3167 != 0;
    int _3171 = ~_3161;
    int _3173 = _3171 + 1;
    int _3175 = _3173 + 1;
    float _3177 = float(uint(_3165));
    bool _3179 = _944 == 0;
    int _3181 = _3175 * as_type<int>(_3003);
    int _3183 = _3181 + _3123;
    int _3185 = ~_3133;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    int _3191 = _3057 + 8;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    uint _3195 = uint(int(uint(int(_3193)) >> uint(2)));
    int _3197 = int(_3193) & 3;
    float _3199 = (*spvDescriptorSet0.vp_c9)._m0[int(_3195)][_3197];
    int _3201 = int(_3193) + 1;
    uint _3203 = uint(int(uint(_3201) >> uint(2)));
    int _3205 = _3201 & 3;
    float _3207 = (*spvDescriptorSet0.vp_c9)._m0[int(_3203)][_3205];
    float _3209 = 1.0 / _3177;
    int _3211 = _3143 * as_type<int>(_3011);
    int _3213 = _3211 + _3183;
    bool _3215 = !_2291;
    int _3217 = _3215 ? 0 : 1;
    bool _3219 = _2157 != 3;
    int _3221 = _3213 * _3189;
    int _3223 = abs(_2219);
    bool _3225 = !_3219;
    float _3227 = _3225 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _3229 = _2503 * _3133;
    int _3231 = _3229 + _3221;
    int _3233 = ~_3223;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    int _3239 = _3119 + 8;
    uint _3241 = uint(int(uint(_3239) >> uint(2)));
    uint _3243 = uint(int(uint(int(_3241)) >> uint(2)));
    int _3245 = int(_3241) & 3;
    float _3247 = (*spvDescriptorSet0.vp_c9)._m0[int(_3243)][_3245];
    int _3249 = int(_3241) + 1;
    uint _3251 = uint(int(uint(_3249) >> uint(2)));
    int _3253 = _3249 & 3;
    float _3255 = (*spvDescriptorSet0.vp_c9)._m0[int(_3251)][_3253];
    bool _3257 = _2281 != 3;
    int _3259 = as_type<int>(_3163) + (-2);
    int _3261 = _3237 * as_type<int>(_3077);
    float _3263 = float(uint(_3231));
    int _3265 = abs(_3231);
    int _3267 = as_type<int>(_3209) + (-2);
    float _3269 = as_type<float>(_3259) * _3263;
    float _3271 = float(uint(_3265));
    int _3273 = abs(_2321);
    int _3275 = abs(_3217);
    float _3277 = trunc(_3269);
    float _3279 = precise::max(_3277, 0.0);
    uint _3281 = uint(_3279);
    float _3283 = as_type<float>(_3267) * _3271;
    int _3285 = abs(_2795);
    int _3287 = ~_3053;
    int _3289 = _3287 + 1;
    int _3291 = ~_3273;
    int _3293 = _3291 + 1;
    int _3295 = _3293 + 1;
    float _3297 = trunc(_3283);
    float _3299 = precise::max(_3297, 0.0);
    uint _3301 = uint(_3299);
    int _3303 = ~_3285;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    int _3309 = abs(_2277);
    int _3311 = _3295 * as_type<int>(_3159);
    int _3313 = _3307 * as_type<int>(_3069);
    int _3315 = _3313 + _3261;
    int _3317 = ~_3275;
    int _3319 = _3317 + 1;
    int _3321 = _3319 + 1;
    int _3323 = ~_3165;
    int _3325 = _3323 + 1;
    int _3327 = _3289 * int(_3281);
    int _3329 = _3327 + _3231;
    int _3331 = _3321 * as_type<int>(_3151);
    int _3333 = _3331 + _3311;
    float _3335 = float(uint(_3329));
    int _3337 = ~_3309;
    int _3339 = _3337 + 1;
    int _3341 = _3339 + 1;
    int _3343 = _3325 * int(_3301);
    int _3345 = _3343 + _3265;
    bool _3347 = !_3179;
    int _3349 = _3347 ? _3129 : (-1);
    float _3351 = as_type<float>(_3259) * _3335;
    bool _3353 = !_3257;
    int _3355 = _3353 ? 0 : (-1);
    int _3357 = _3341 * as_type<int>(_3199);
    int _3359 = _3357 + _3315;
    float _3361 = float(uint(_3345));
    float _3363 = trunc(_3351);
    float _3365 = precise::max(_3363, 0.0);
    uint _3367 = uint(_3365);
    int _3369 = abs(as_type<int>(_3227));
    int _3371 = ~_2927;
    int _3373 = _3371 + 1;
    int _3375 = _3373 + 1;
    float _3377 = as_type<float>(_3267) * _3361;
    int _3379 = ~_3369;
    int _3381 = _3379 + 1;
    int _3383 = _3381 + 1;
    bool _3385 = _1018 == 0;
    int _3387 = _3375 * as_type<int>(_3247);
    int _3389 = _3387 + _3333;
    int _3391 = abs(_3355);
    float _3393 = trunc(_3377);
    float _3395 = precise::max(_3393, 0.0);
    uint _3397 = uint(_3395);
    int _3399 = _3383 * as_type<int>(_3207);
    int _3401 = _3399 + _3359;
    int _3403 = ~_3053;
    int _3405 = _3403 + 1;
    int _3407 = int(_3281) + int(_3367);
    int _3409 = ~_3391;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = abs(_3137);
    int _3417 = _3405 * _3407;
    int _3419 = _3417 + _3231;
    bool _3421 = !_3169;
    int _3423 = _3421 ? 0 : 1;
    int _3425 = _3413 * as_type<int>(_3255);
    int _3427 = _3425 + _3389;
    int _3429 = ~_3165;
    int _3431 = _3429 + 1;
    int _3433 = int(_3301) + int(_3397);
    bool _3435 = uint(_3419) >= uint(_3053);
    float _3437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3439 = ~_3415;
    int _3441 = _3439 + 1;
    int _3443 = _3441 + 1;
    int _3445 = _3431 * _3433;
    int _3447 = _3445 + _3265;
    int _3449 = abs(_3423);
    bool _3451 = !_3435;
    int _3453 = _3451 ? 0 : (-1);
    int _3455 = _3401 * _3443;
    int _3457 = ~_3449;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    int _3463 = _1018 * _2917;
    int _3465 = _3463 + _1829;
    int _3467 = ~_3407;
    int _3469 = _3467 + _3453;
    int _3471 = _3469 + 1;
    int _3473 = _3349 * _3415;
    int _3475 = _3473 + _3455;
    bool _3477 = uint(_3447) >= uint(_3165);
    int _3479 = _3427 * _3461;
    bool _3481 = !_3385;
    int _3483 = _3481 ? _3465 : (-1);
    int _3485 = _3053 * _3471;
    int _3487 = _3485 + _3231;
    int _3489 = _3231 ^ _3053;
    float _3491 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3493 = log2(_3491);
    bool _3495 = _3053 == 0;
    int _3497 = _3483 * _3449;
    int _3499 = _3497 + _3479;
    bool _3501 = !_3477;
    int _3503 = _3501 ? 0 : (-1);
    float _3505 = _2803 * _2895;
    uint _3507 = uint(int(uint(_3489) >> uint(31)));
    bool _3509 = !_3495;
    int _3511 = _3509 ? _3487 : (-1);
    int _3513 = ~_3503;
    int _3515 = _3433 + _3513;
    int _3517 = _3515 + 1;
    float _3519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3521 = ~int(_3507);
    int _3523 = _3521 + 1;
    float _3525 = _3437 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3527 = float(_3511);
    float _3529 = -_138;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2989);
    int _3533 = _3517 ^ _3523;
    float _3535 = fma(_3525, _1913, -0.5);
    bool _3537 = _3053 == 0;
    float _3539 = fma(_3525, _3527, _3531);
    int _3541 = ~_3523;
    int _3543 = _3541 + _3533;
    int _3545 = _3543 + 1;
    float _3547 = _3493 * _138;
    bool _3549 = !_3537;
    int _3551 = _3549 ? _3545 : (-1);
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3555 = _3519 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3557 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3559 = float(_3551);
    float _3561 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3553);
    float _3563 = exp2(_3547);
    float _3565 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3557);
    float _3567 = fma(_3555, _2163, -0.5);
    float _3569 = -_3059;
    float _3571 = fma(_3555, _3559, _3569);
    float _3573 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3561);
    float _3575 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3565);
    float _3577 = float(_3475);
    float _3579 = fma(_3573, _3535, _3539);
    float _3581 = fma(_3575, _3567, _3571);
    out.m_83.x = _3577;
    float _3583 = _3579 + 0.5;
    float _3585 = _3581 + 0.5;
    bool _3587 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3589 = isnan(1.0);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3595 = _3591 || _3593;
    float _3597 = in.m_85.x;
    float _3599 = in.m_85.y;
    float _3601 = in.m_85.z;
    float _3603 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3605 = 1.0 + _3603;
    float _3607 = float(_3499);
    float _3609 = -_3563;
    float _3611 = _3609 + 1.0;
    float _3613 = 1.0 / _3605;
    bool _3615 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3617 = isnan(0.0);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3623 = _3619 || _3621;
    out.m_83.w = _3607;
    bool _3625 = !_2525;
    int _3627 = _3625 ? 0 : 1;
    float _3629 = fma(_2919, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3631 = _3623 ? _3611 : 0.0;
    out.m_87.x = _3583;
    out.m_87.y = _3585;
    bool _3633 = !_2521;
    float _3635 = _3633 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3637 = _3635;
    float _3639 = _3227;
    float _3641 = as_type<float>(_3049);
    float _3643 = as_type<float>(_3309);
    float _3645 = as_type<float>(_3311);
    if (_2821)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3647 = -_2945;
    float _3649 = fma(_3647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2359);
    float _3651 = -_2949;
    float _3653 = fma(_3651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2739);
    float _3655 = -_3505;
    float _3657 = fma(_3655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2749);
    float _3659 = _3097 * (-2.0);
    float _3661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3663 = _3649 + _3661;
    float _3665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3667 = _3653 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3671 = _3657 + _3669;
    int _3673 = abs(as_type<int>(_3635));
    float _3675 = _3663 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3677 = _1145 + (-0.5);
    float _3679 = float(_2447);
    float _3681 = _3663;
    float _3683 = _3653;
    if (_3595)
    {
        float _3685 = _3631 * _3613;
        _148 = _3685;
    }
    float _3687 = _148;
    float _3689 = fma(_3667, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3675);
    float _3691 = fma(_3659, _3597, _3597);
    float _3693 = float(_3673);
    float _3695 = fma(_3629, _3659, _3629);
    float _3697 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3689);
    float _3699 = fma(_3677, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3691);
    float _3701 = -_3505;
    float _3703 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2803);
    float _3705 = _3693 * _3679;
    float _3707 = _1048 + (-0.5);
    bool _3709 = _3697 >= 0.0;
    float _3711 = fma(_3695, _3687, _3699);
    float _3713 = _3705 * (-2.0);
    float _3715 = fma(_3703, _3703, _2991);
    float _3717 = _3711 * 0.15915493667125701904296875;
    float _3719 = fma(_3713, _3599, _3599);
    int _3721 = abs(_3627);
    float _3723 = fma(_2577, _3713, _2577);
    float _3725 = sqrt(_3715);
    float _3727 = fma(_3707, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3719);
    float _3729 = _3723;
    if (_3709)
    {
        _3637 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3731 = _3637;
    int _3733 = as_type<int>(_3731);
    if (_3709)
    {
        out.m_57.x = 0.0;
    }
    float _3735 = float(_2573);
    float _3737 = fma(_3723, _3687, _3727);
    float _3739 = _3717 * 6.283185482025146484375;
    float _3741 = sin(_3739);
    if (_3709)
    {
        float _3743 = _3731 * 5.0;
        _3733 = as_type<int>(_3743);
    }
    int _3745 = _3733;
    float _3747 = float(_3721);
    if (_3709)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10870 = as_type<float>(_3745);
        out.gl_Position.z = _10870;
    }
    float _3749 = _3747 * _3735;
    float _3751 = _3717 * 6.283185482025146484375;
    float _3753 = cos(_3751);
    if (_3709)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3755 = -_2359;
    float _3757 = _3755 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3759 = -_2739;
    float _3761 = _3759 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3763 = -_2749;
    float _3765 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3767 = _1145 + _1939;
    float _3769 = _3757 * _3757;
    float _3771 = _1939 + (-0.5);
    float _3773 = _3737 * 0.15915493667125701904296875;
    float _3775 = _3767 + (-1.0);
    float _3777 = fma(_3761, _3761, _3769);
    float _3779 = _3749 * (-2.0);
    float _3781 = _3773 * 6.283185482025146484375;
    float _3783 = sin(_3781);
    float _3785 = fma(_3775, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3787 = fma(_3765, _3765, _3777);
    float _3789 = fma(_3779, _3601, _3601);
    float _3791 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3793 = fma(_3785, _3779, _3785);
    float _3795 = _2895 * _3725;
    float _3797 = fma(_3771, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3789);
    float _3799 = rsqrt(_3787);
    float _3801 = _3795 * _3791;
    float _3803 = fma(_3793, _3687, _3797);
    float _3805 = _3803 * 0.15915493667125701904296875;
    float _3807 = _3773 * 6.283185482025146484375;
    float _3809 = cos(_3807);
    float _3811 = in.m_89.x;
    float _3813 = in.m_89.y;
    float _3815 = in.m_89.z;
    float _3817 = _3753 * _3783;
    float _3819 = _3761 * _3799;
    float _3821 = _3757 * _3799;
    float _3823 = _3765 * _3799;
    float _3825 = _3805 * 6.283185482025146484375;
    float _3827 = sin(_3825);
    float _3829 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3831 = _3819 * _3829;
    float _3833 = _3741 * _3783;
    float _3835 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3837 = _3823 * _3835;
    float _3839 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3841 = -_3831;
    float _3843 = fma(_3823, _3839, _3841);
    float _3845 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3847 = _3821 * _3845;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3851 = -_3837;
    float _3853 = fma(_3821, _3849, _3851);
    float _3855 = _3805 * 6.283185482025146484375;
    float _3857 = cos(_3855);
    float _3859 = _3843 * _3843;
    float _3861 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3863 = -_3847;
    float _3865 = fma(_3819, _3861, _3863);
    float _3867 = _3753 * _3809;
    float _3869 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3871 = fma(_3853, _3853, _3859);
    float _3873 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3875 = _3741 * _3809;
    float _3877 = fma(_3827, _3867, _3833);
    float _3879 = fma(_3865, _3865, _3871);
    float _3881 = fma(_3827, _3833, _3867);
    float _3883 = _3795 * _3873;
    float _3885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3813);
    float _3887 = rsqrt(_3879);
    float _3889 = _3885 * _3883;
    float _3891 = _3795 * _3869;
    float _3893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3815);
    float _3895 = _3753 * _3857;
    float _3897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3811);
    float _3899 = _3741 * _3857;
    float _3901 = _3893 * _3801;
    float _3903 = _3895 * _3889;
    float _3905 = _3897 * _3891;
    float _3907 = -_3817;
    float _3909 = fma(_3827, _3875, _3907);
    float _3911 = -_3875;
    float _3913 = fma(_3827, _3817, _3911);
    float _3915 = -_3889;
    float _3917 = _3827 * _3915;
    float _3919 = _3809 * _3857;
    float _3921 = fma(_3877, _3905, _3903);
    float _3923 = _3783 * _3857;
    float _3925 = _3853 * _3887;
    float _3927 = _3843 * _3887;
    float _3929 = _3865 * _3887;
    float _3931 = _3899 * _3889;
    float _3933 = _3821 * _3925;
    float _3935 = _3823 * _3927;
    float _3937 = fma(_3919, _3905, _3917);
    float _3939 = fma(_3913, _3901, _3921);
    float _3941 = -_3933;
    float _3943 = fma(_3819, _3927, _3941);
    float _3945 = -_3935;
    float _3947 = fma(_3821, _3929, _3945);
    float _3949 = fma(_3909, _3905, _3931);
    float _3951 = fma(_3923, _3901, _3937);
    float _3953 = _3943 * _3939;
    float _3955 = _3947 * _3939;
    float _3957 = fma(_3881, _3901, _3949);
    float _3959 = _3819 * _3929;
    float _3961 = fma(_3929, _3951, _3953);
    float _3963 = fma(_3925, _3951, _3955);
    float _3965 = -_3959;
    float _3967 = fma(_3823, _3925, _3965);
    float _3969 = fma(_3823, _3957, _3961);
    float _3971 = fma(_3819, _3957, _3963);
    float _3973 = _3967 * _3939;
    float _3975 = _2749 + _3969;
    float _3977 = _2739 + _3971;
    float _3979 = fma(_3927, _3951, _3973);
    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3983 = _3975 + _3981;
    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3987 = _3977 + _3985;
    float _3989 = fma(_3821, _3957, _3979);
    float _3991 = _3983 * _3983;
    float _3993 = _3987 * _3987;
    float _3995 = _2359 + _3989;
    float _3997 = _3993 + _3991;
    float _3999 = sqrt(_3997);
    bool _4001 = _3999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = _3977;
    float _4005 = _3975;
    float _4007 = _3993;
    float _4009 = _3991;
    if (!_4001)
    {
        _3639 = _3995;
    }
    float _4011 = _3639;
    bool _4013 = !_4001;
    float _4015 = _4011;
    if (!_4013)
    {
        float _4017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4021 = _3999 + _4019;
        float _4023 = rsqrt(_3997);
        float _4025 = _4021 * _4017;
        float _4027 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4029 = _4025 * 0.15915493667125701904296875;
        float _4031 = _4029 * 6.283185482025146484375;
        float _4033 = sin(_4031);
        float _4035 = _4029 * 6.283185482025146484375;
        float _4037 = cos(_4035);
        float _4039 = fma(_4033, _4027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4041 = _4023 * _4039;
        float _4043 = _4037 + (-1.0);
        float _4045 = fma(_3987, _4041, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4047 = fma(_3983, _4041, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4049 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4053 = _4045 + _4051;
        float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4057 = _4047 + _4055;
        float _4059 = fma(_3995, _4037, _4049);
        float _4061 = _4053 * _4053;
        float _4063 = _4057 * _4057;
        _4003 = _4045;
        _4005 = _4047;
        _4015 = _4059;
        _4007 = _4061;
        _4009 = _4063;
    }
    float _4065 = _4003;
    float _4067 = _4005;
    float _4069 = _4015;
    float _4071 = _4007;
    float _4073 = _4009;
    float _4075 = fma(_4065, 6.2500002968590706586837768554688e-05, 0.5);
    float _4077 = fma(_4067, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11377 = float2(_4075, _4077);
    float3 _4081 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11377, float2(0.0), isnan(_11377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11377, float2(0.0), isnan(_11377)), level(0.0)).xyz;
    float _4083 = _4081.x;
    float _4085 = _4081.y;
    float _4087 = _4081.z;
    float _4089 = in.m_91.x;
    float _4091 = in.m_91.y;
    float _4093 = in.m_91.z;
    bool _4095 = _3813 != 0.0;
    bool _4097 = isnan(_3813);
    bool _4099 = _4095 || _4097;
    bool _4101 = isnan(0.0);
    bool _4103 = _4099 || _4101;
    float _4105 = _3895 * _3947;
    float _4107 = _3895 * _3967;
    float _4109 = in.m_93.x;
    float _4111 = in.m_93.y;
    float _4113 = in.m_93.z;
    float _4115 = in.m_93.w;
    bool _4117 = _3811 == 0.0;
    bool _4119 = !_4103;
    bool _4121 = _4117 && _4119;
    float _4123 = _3877 * _3943;
    float _4125 = _3895 * _3943;
    float _4127 = _3913 * _3943;
    bool _4129 = _3815 == 0.0;
    bool _4131 = _4129 && _4121;
    float _4133 = -_3827;
    float _4135 = fma(_4133, _3925, _4105);
    float _4137 = -_3827;
    float _4139 = fma(_4137, _3927, _4107);
    float _4141 = -_3827;
    float _4143 = fma(_4141, _3929, _4125);
    float _4145 = fma(_3923, _3929, _4127);
    float _4147 = fma(_3881, _3823, _4145);
    float _4149 = _4089;
    if (_4131)
    {
        _3641 = _4089;
    }
    float _4151 = _3641;
    float _4153 = _4151;
    if (_4131)
    {
        _2889 = _4093;
    }
    float _4155 = _2889;
    float _4157 = _4155;
    if (_4131)
    {
        _3643 = _4091;
    }
    float _4159 = _3643;
    float _4161 = _4159;
    if (_4131)
    {
        _3729 = _4151;
    }
    float _4163 = _3729;
    float _4165 = _4163;
    if (!_4131)
    {
        _4153 = _4089;
    }
    float _4167 = _4153;
    if (_4131)
    {
        _3645 = _4155;
    }
    float _4169 = _3645;
    float _4171 = _4169;
    if (!_4131)
    {
        _4157 = _4093;
    }
    float _4173 = _4157;
    if (!_4131)
    {
        float _4175 = fma(_3811, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4167);
        _4165 = _4175;
    }
    float _4177 = _4165;
    if (_4131)
    {
        _4149 = _4159;
    }
    float _4179 = _4149;
    float _4181 = _4113 * _4167;
    float _4183 = _4179;
    if (!_4131)
    {
        _4161 = _4091;
    }
    float _4185 = _4161;
    float _4187 = _4111 * _4173;
    if (!_4131)
    {
        float _4189 = fma(_3815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4173);
        _4171 = _4189;
    }
    float _4191 = _4171;
    float _4193 = -_4181;
    float _4195 = fma(_4109, _4173, _4193);
    float _4197 = _4109 * _4185;
    if (!_4131)
    {
        float _4199 = fma(_3813, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4185);
        _4183 = _4199;
    }
    float _4201 = _4183;
    float _4203 = -_4187;
    float _4205 = fma(_4113, _4185, _4203);
    float _4207 = _3877 * _3947;
    float _4209 = -_4197;
    float _4211 = fma(_4111, _4167, _4209);
    float _4213 = _3913 * _3947;
    float _4215 = _4205 * _4115;
    float _4217 = fma(_3919, _3925, _4207);
    float _4219 = _4211 * _4115;
    float _4221 = _3877 * _3967;
    float _4223 = fma(_3919, _3929, _4123);
    float _4225 = _4195 * _4115;
    float _4227 = fma(_3899, _3819, _4135);
    float _4229 = fma(_3919, _3927, _4221);
    float _4231 = fma(_3923, _3925, _4213);
    float _4233 = fma(_3899, _3821, _4139);
    float _4235 = fma(_3909, _3819, _4217);
    float _4237 = fma(_3909, _3821, _4229);
    float _4239 = fma(_3909, _3823, _4223);
    float _4241 = fma(_3899, _3823, _4143);
    float _4243 = fma(_3881, _3819, _4231);
    float _4245 = _4227 * _4111;
    float _4247 = _4233 * _4111;
    float _4249 = _4227 * _4201;
    float _4251 = _4233 * _4201;
    float _4253 = _4225 * _4227;
    float _4255 = _4225 * _4233;
    float _4257 = _4241 * _4111;
    float _4259 = _4241 * _4201;
    float _4261 = _4225 * _4241;
    float _4263 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4265 = _4069 + _4263;
    float _4267 = _3913 * _3967;
    float _4269 = fma(_4237, _4109, _4247);
    float _4271 = fma(_4235, _4177, _4249);
    float _4273 = fma(_4265, _4265, _4071);
    float _4275 = fma(_3923, _3927, _4267);
    float _4277 = fma(_4235, _4109, _4245);
    float _4279 = fma(_4215, _4235, _4253);
    float _4281 = _4273 + _4073;
    float _4283 = fma(_3881, _3821, _4275);
    float _4285 = fma(_4215, _4237, _4255);
    float _4287 = fma(_4239, _4109, _4257);
    float _4289 = fma(_4237, _4177, _4251);
    float _4291 = fma(_4239, _4177, _4259);
    float _4293 = sqrt(_4281);
    float _4295 = fma(_4215, _4239, _4261);
    float _4297 = fma(_4243, _4113, _4277);
    float _4299 = fma(_4283, _4113, _4269);
    float _4301 = fma(_4243, _4191, _4271);
    float _4303 = fma(_4219, _4243, _4279);
    float _4305 = fma(_4219, _4283, _4285);
    float _4307 = fma(_4147, _4113, _4287);
    float _4309 = fma(_4219, _4147, _4295);
    float _4311 = fma(_4283, _4191, _4289);
    float _4313 = fma(_4147, _4191, _4291);
    out.m_95.x = _4297;
    out.m_95.y = _4299;
    out.m_95.z = _4307;
    out.m_97.x = _4303;
    out.m_97.y = _4305;
    out.m_97.z = _4309;
    bool _4315 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4317 = isnan(_4293);
    bool _4319 = _4315 || _4317;
    bool _4321 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4323 = _4319 || _4321;
    out.m_99.x = _4301;
    out.m_99.y = _4311;
    out.m_99.z = _4313;
    float _4325 = _4237;
    if (!_4323)
    {
        _4325 = 1.0;
    }
    float _4327 = _4325;
    out.m_101.x = _4083;
    out.m_101.y = _4085;
    out.m_101.z = _4087;
    bool _4329 = !_4323;
    float _4331 = _4327;
    if (!_4329)
    {
        bool _4333 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4335 = isnan(_4293);
        bool _4337 = _4333 || _4335;
        bool _4339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4341 = _4337 || _4339;
        if (!_4341)
        {
            float _4343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4345 = _4293 + _4343;
            float _4347 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4349 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4347;
            float _4351 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4353 = _4351 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4355 = 1.0 / _4349;
            float _4357 = _4345 * _4355;
            float _4359 = fma(_4357, _4353, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4331 = _4359;
            _4361 = true;
        }
        else
        {
            bool _4363 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4365 = isnan(_4293);
            bool _4367 = _4363 || _4365;
            bool _4369 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4371 = _4367 || _4369;
            if (!_4371)
            {
                float _4373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4375 = _4293 + _4373;
                float _4377 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4379 = _4377 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4381 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4383 = _4381 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4385 = 1.0 / _4379;
                float _4387 = _4375 * _4385;
                float _4389 = fma(_4387, _4383, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4331 = _4389;
                _4361 = true;
            }
            else
            {
                _4331 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4361 = false;
    float _4391 = _4331;
    float _4393 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4395 = _4069 + _4393;
    float _4397 = _3649 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4399 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4401 = _4065 + _4399;
    float _4403 = fma(_4395, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4405 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4397);
    float _4407 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4409 = _4067 + _4407;
    float _4411 = fma(_4401, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4413 = -_2359;
    float _4415 = _4413 + _4403;
    float _4417 = fma(_3657, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4405);
    float _4419 = fma(_4409, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4421 = -_2739;
    float _4423 = _4421 + _4411;
    float _4425 = _4415 * _4415;
    float _4427 = _4417 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4429 = _3649 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4431 = -_2749;
    float _4433 = _4431 + _4419;
    float _4435 = fma(_4423, _4423, _4425);
    float _4437 = 1.0 / _4427;
    float _4439 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4429);
    float _4441 = fma(_4433, _4433, _4435);
    float _4443 = fma(_3657, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4439);
    float _4445 = sqrt(_4441);
    float _4447 = _4443 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4449 = _4447 + _4427;
    float _4451 = _4449 * _4437;
    float _4453 = _4451 * 0.5;
    float _4455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4457 = fma(_4453, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4455);
    bool _4459 = _4445 > 0.0;
    float _4461 = 1.0 / _4457;
    bool _4463 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4467 = _4463 || _4465;
    bool _4469 = isnan(0.5);
    bool _4471 = _4467 || _4469;
    bool _4473 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4475 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan(0.5);
    bool _4481 = _4477 || _4479;
    float _4483 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4485 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4487 = _4411;
    float _4489 = _4403;
    if (!_4459)
    {
        _4483 = _4403;
    }
    float _4491 = _4483;
    float _4493 = _4491;
    if (!_4459)
    {
        _4485 = _4419;
    }
    float _4495 = _4485;
    bool _4497 = !_4459;
    float _4499 = _4495;
    if (!_4497)
    {
        float _4501 = _230 * _230;
        float _4503 = fma(_226, _226, _4501);
        float _4505 = fma(_232, _232, _4503);
        float _4507 = rsqrt(_4441);
        float _4509 = sqrt(_4505);
        float _4511 = _4423 * _4507;
        float _4513 = _4415 * _4507;
        float _4515 = _4433 * _4507;
        bool _4517 = _4509 > 0.0;
        float _4519 = _4509;
        float _4521 = _4507;
        if (!_4517)
        {
            _4519 = _4403;
        }
        float _4523 = _4519;
        _4493 = _4523;
        if (!_4517)
        {
            _4521 = _4419;
        }
        float _4525 = _4521;
        bool _4527 = !_4517;
        _4499 = _4525;
        if (!_4527)
        {
            float _4529 = rsqrt(_4505);
            float _4531 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4533 = _230 * _4529;
            float _4535 = _226 * _4529;
            float _4537 = _232 * _4529;
            float _4539 = _4513 * _4533;
            float _4541 = fma(_4511, _4535, _4539);
            float _4543 = _4531 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4545 = fma(_4515, _4537, _4541);
            float _4547 = _4545 * _4543;
            float _4549 = fma(_226, _4547, _4411);
            float _4551 = fma(_230, _4547, _4403);
            float _4553 = fma(_232, _4547, _4419);
            _4487 = _4549;
            _4493 = _4551;
            _4499 = _4553;
        }
    }
    float _4555 = _4487;
    float _4557 = _4493;
    float _4559 = _4499;
    float _4561 = -_2949;
    float _4563 = fma(_4561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4555);
    float _4565 = -_2945;
    float _4567 = fma(_4565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4557);
    float _4569 = -_3505;
    float _4571 = fma(_4569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4559);
    float _4573 = _4567;
    float _4575 = _4563;
    float _4577 = _4571;
    if (_4471)
    {
        _4489 = 1.0;
    }
    float _4579 = _4489;
    float _4581 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4583 = _4461 * _4581;
    float _4585 = _4579;
    if (!_4481)
    {
        float _4587 = _3663 * _3663;
        float _4589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4591 = -_2749;
        float _4593 = _4591 + _4559;
        float _4595 = -_2359;
        float _4597 = _4595 + _4557;
        float _4599 = fma(_3667, _3667, _4587);
        float _4601 = -_2739;
        float _4603 = _4601 + _4555;
        float _4605 = fma(_3671, _3671, _4599);
        float _4607 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4609 = sqrt(_4605);
        float _4611 = 1.0 / _3795;
        float _4613 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4615 = precise::min(_4609, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4617 = _4615 * _4589;
        float _4619 = _4617 * _4611;
        float _4621 = _4613 * _4619;
        float _4623 = _4593 * _4619;
        float _4625 = fma(_4597, _4621, _3649);
        float _4627 = fma(_4603, _4621, _3653);
        float _4629 = fma(_4613, _4623, _3657);
        _4573 = _4625;
        _4575 = _4627;
        _4577 = _4629;
        _3681 = _4609;
    }
    float _4631 = _4573;
    float _4633 = _4575;
    float _4635 = _4577;
    float _4637 = _3681;
    float _4639 = _4637;
    if (!_4471)
    {
        float _4641 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4643 = _4641 * 0.15915493667125701904296875;
        float _4645 = _4643 * 6.283185482025146484375;
        float _4647 = cos(_4645);
        float _4649 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4651 = _4649 * 0.15915493667125701904296875;
        float _4653 = _4643 * 6.283185482025146484375;
        float _4655 = sin(_4653);
        float _4657 = 1.0 / _4647;
        float _4659 = _4651 * 6.283185482025146484375;
        float _4661 = cos(_4659);
        float _4663 = _4655 * _4657;
        float _4665 = _4651 * 6.283185482025146484375;
        float _4667 = sin(_4665);
        float _4669 = _4661 * _4663;
        float _4671 = 1.0 / _4669;
        float _4673 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4675 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4673;
        float _4677 = 1.0 / _4675;
        float _4679 = _4667 * _4671;
        float _4681 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4683 = fma(_4583, _4679, _4681);
        float _4685 = _4683 * _4677;
        float _4687 = precise::clamp(_4685, 0.0, 1.0);
        _4639 = _4683;
        _4585 = _4687;
    }
    float _4689 = _4639;
    float _4691 = _4585;
    float _4693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4695 = _4631 + _4693;
    float _4697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4699 = _4633 + _4697;
    float _4701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4703 = _4635 + _4701;
    float _4705 = _4695 * _4695;
    float _4707 = fma(_4699, _4699, _4705);
    float _4709 = fma(_4703, _4703, _4707);
    float _4711 = rsqrt(_4709);
    float _4713 = sqrt(_4709);
    float _4715 = _4711 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4717 = _4699 * _4715;
    float _4719 = _4703 * _4715;
    float _4721 = _4717 * _4717;
    float _4723 = _4719 * _4719;
    float _4725 = _4721 + _4723;
    float _4727 = sqrt(_4725);
    bool _4729 = _4727 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4733 = _4727 + _4731;
    float _4735 = _4711;
    float _4737 = _4733;
    float _4739 = _4695;
    if (_4729)
    {
        float _4741 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4735 = _4741;
    }
    float _4743 = _4735;
    float _4745 = _4743;
    if (_4729)
    {
        float _4747 = _4733 * _4743;
        _4737 = _4747;
    }
    float _4749 = _4737;
    if (_4729)
    {
        float _4751 = rsqrt(_4725);
        _4745 = _4751;
    }
    float _4753 = _4745;
    float _4755 = _4753;
    if (_4729)
    {
        float _4757 = _4749 * 0.15915493667125701904296875;
        _2853 = _4757;
    }
    float _4759 = _2853;
    float _4761 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4763 = _4703;
    float _4765 = _4759;
    if (_4729)
    {
        float _4767 = _4759 * 6.283185482025146484375;
        float _4769 = sin(_4767);
        _4763 = _4769;
    }
    float _4771 = _4763;
    float _4773 = precise::max(0.0, _4761);
    float _4775 = _4689;
    if (_4729)
    {
        float _4777 = _4759 * 6.283185482025146484375;
        float _4779 = cos(_4777);
        _4775 = _4779;
    }
    float _4781 = _4775;
    float _4783 = -_4715;
    float _4785 = -_4773;
    float _4787 = fma(_4695, _4783, _4785);
    float _4789 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4729)
    {
        float _4791 = _4787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4739 = _4791;
    }
    float _4793 = _4739;
    float _4795 = fma(_3653, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4797 = _4771;
    float _4799 = _4793;
    if (_4729)
    {
        float _4801 = fma(_4771, _4793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4797 = _4801;
    }
    float _4803 = _4797;
    float _4805 = _4803;
    if (!_4729)
    {
        _4799 = _4787;
    }
    float _4807 = _4799;
    float _4809 = floor(_4795);
    float _4811 = _4807;
    if (_4729)
    {
        float _4813 = _4753 * _4803;
        _3683 = _4813;
    }
    float _4815 = _3683;
    if (!_4729)
    {
        _4755 = _4717;
    }
    float _4817 = _4755;
    float _4819 = _4817;
    float _4821 = _4781;
    if (_4729)
    {
        float _4823 = _4781 + (-1.0);
        _4789 = _4823;
    }
    float _4825 = _4789;
    float _4827 = _4825;
    if (_4729)
    {
        float _4829 = _4717 * _4815;
        _4819 = _4829;
    }
    float _4831 = _4819;
    if (!_4729)
    {
        _4805 = _4721;
    }
    float _4833 = _4805;
    float _4835 = _4833;
    if (_4729)
    {
        float _4837 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4765 = _4837;
    }
    float _4839 = _4765;
    if (!_4729)
    {
        _4827 = _4719;
    }
    float _4841 = _4827;
    float _4843 = _4841;
    if (_4729)
    {
        float _4845 = _4719 * _4815;
        _4843 = _4845;
    }
    float _4847 = _4843;
    if (_4729)
    {
        float _4849 = _4831 * _4831;
        _4835 = _4849;
    }
    float _4851 = _4835;
    if (_4729)
    {
        float _4853 = fma(_4787, _4781, _4839);
        _4811 = _4853;
    }
    float _4855 = _4811;
    if (!_4729)
    {
        _4821 = _4723;
    }
    float _4857 = _4821;
    float _4859 = _4857;
    if (_4729)
    {
        float _4861 = _4847 * _4847;
        _4859 = _4861;
    }
    float _4863 = _4859;
    float _4865 = fma(_4855, _4855, _4851);
    float _4867 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4869 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4871 = _4865 + _4863;
    float _4873 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4867);
    float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4877 = fma(_4713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4875);
    float _4879 = precise::clamp(_4877, 0.0, 1.0);
    float _4881 = rsqrt(_4871);
    float _4883 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4873);
    float _4885 = -_4879;
    float _4887 = _4885 + 1.0;
    float _4889 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4891 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4893 = _4883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4895 = -_4809;
    float _4897 = _4795 + _4895;
    float _4899 = abs(_4887);
    float _4901 = log2(_4899);
    float _4903 = _4893 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4905 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4907 = -_4903;
    float _4909 = fma(_4907, _4891, 1.0);
    float _4911 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4913 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4905);
    float _4915 = _4881 * _4831;
    float _4917 = _4881 * _4855;
    float _4919 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4911);
    float _4921 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4913);
    float _4923 = _4881 * _4847;
    float _4925 = _4915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4927 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4919);
    float _4929 = _4921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4931 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4869);
    float _4933 = -_4925;
    float _4935 = fma(_4917, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4933);
    float _4937 = _4927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4939 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4941 = floor(_4889);
    float _4943 = -_4923;
    float _4945 = fma(_4943, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4935);
    float _4947 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4931);
    float _4949 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4939);
    float _4951 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4953 = fma(_4945, -0.5, 0.5);
    float _4955 = _4947 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4957 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4949);
    float _4959 = exp2(_4951);
    float _4961 = fma(_4945, 0.5, 0.5);
    float _4963 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4957);
    float _4965 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4967 = log2(_4909);
    float _4969 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4971 = -_4941;
    float _4973 = _4889 + _4971;
    float _4975 = fma(_4961, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4977 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4965);
    float _4979 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4969);
    float _4981 = _4917 + 1.0;
    float _4983 = fma(_4961, _4975, -0.212114393711090087890625);
    float _4985 = 1.0 / _4963;
    float _4987 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4977);
    float _4989 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4979);
    float _4991 = -_4917;
    float _4993 = fma(_4959, _4981, _4991);
    float _4995 = fma(_4961, _4983, 1.570728778839111328125);
    float _4997 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4987);
    float _4999 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4989);
    float _5001 = sqrt(_4953);
    float _5003 = _4967 * 0.693147182464599609375;
    float _5005 = _5003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5007 = _4997 * _4985;
    float _5009 = _4999 * _4985;
    float2 _12927 = float2(_4897, _4973);
    float _5011 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12927, float2(0.0), isnan(_12927)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12927, float2(0.0), isnan(_12927)), level(0.0)).x;
    float _5013 = fma(_5007, 0.5, 0.5);
    float _5015 = fma(_5009, -0.5, 0.5);
    float _5017 = _5001 * 0.636619746685028076171875;
    float3 _12943 = float3(_5013, _5015, _5005);
    float _5019 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12943, float3(0.0), isnan(_12943)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12943, float3(0.0), isnan(_12943)), level(0.0)).x;
    float3 _12954 = float3(_5013, _5015, _5005);
    float4 _5022 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12954, float3(0.0), isnan(_12954)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12954, float3(0.0), isnan(_12954)), level(0.0)).xyzw;
    float _5024 = _5022.x;
    float _5026 = _5022.y;
    float _5028 = _5022.z;
    float _5030 = _5022.w;
    float _5032 = -_4995;
    float _5034 = fma(_5017, _5032, 1.0);
    float _5036 = fma(_4993, 0.5, 0.5);
    float2 _12977 = float2(_5034, _5036);
    float3 _5038 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12977, float2(0.0), isnan(_12977)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12977, float2(0.0), isnan(_12977)), level(0.0)).xyz;
    float _5040 = _5038.x;
    float _5042 = _5038.y;
    float _5044 = _5038.z;
    float _5046 = abs(_4583);
    float _5048 = log2(_5046);
    float _5050 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5052 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _5054 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5056 = isnan(_4713);
    bool _5058 = _5054 || _5056;
    bool _5060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5062 = _5058 || _5060;
    float _5064 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5050);
    float _5066 = _4963 * 0.5;
    bool _5068 = _4583 <= 8000.0;
    bool _5070 = isnan(_4583);
    bool _5072 = _5068 || _5070;
    bool _5074 = isnan(8000.0);
    bool _5076 = _5072 || _5074;
    float _5078 = float(_5076);
    float _5080 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5064);
    float _5082 = exp2(_5052);
    float _5084 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5080);
    float _5086 = _4997 + _4963;
    float _5088 = _5048 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5090 = in.m_103.x;
    out.gl_Position.x = _4997;
    out.gl_Position.y = _4999;
    out.gl_Position.z = _5084;
    out.gl_Position.w = _4963;
    float _5092 = exp2(_5088);
    float _5094 = -_5082;
    float _5096 = _5094 + 1.0;
    float _5098 = _5086 * 0.5;
    float _5100 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5102 = -_5100;
    float _5104 = _5102 + 1.0;
    float _5106 = fma(_5092, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5108 = precise::clamp(_5106, 0.0, 1.0);
    float _5110 = fma(_4999, -0.5, _5066);
    float _5112 = fma(_5108, -2.0, 3.0);
    float _5114 = _5108 * _5108;
    float _5116 = _4999;
    float _5118 = _4963;
    float _5120 = _5084;
    float _5122 = _5104;
    if (!_5062)
    {
        _5116 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5124 = _5116;
    float _5126 = _5114 * _5112;
    float _5128 = -_5126;
    float _5130 = _5128 + 1.0;
    float _5132 = fma(_5130, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5126);
    float _5134 = _5084 + _4963;
    float _5136 = _5124;
    float _5138 = _5124;
    if (!_5062)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5140 = _5118;
    float _5142 = _5078 * _5132;
    float _5144 = _5134 * 0.5;
    float _5146 = _5140;
    float _5148 = _5140;
    if (!_5062)
    {
        _5120 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5150 = _5120;
    float _5152 = _5142 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_105.x = _5098;
    out.m_105.y = _5110;
    out.m_105.z = _5144;
    out.m_105.w = _4963;
    float _5154 = -_5011;
    float _5156 = _5154 + 1.0;
    float _5158 = _5156 * _5152;
    float _5160 = precise::clamp(_5158, 0.0, 1.0);
    float _5162 = _5100 * _5019;
    float _5164 = -_5160;
    float _5166 = fma(_5164, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5168 = _5030 * _5162;
    float _5170 = _5166 * _5090;
    float _5172 = _5044 * _5162;
    float _5174 = fma(_5040, _5168, _5024);
    float _5176 = fma(_5042, _5168, _5026);
    float _5178 = _5170 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5180 = _5030 * _5104;
    float _5182 = fma(_5030, _5172, _5028);
    float _5184 = _4691 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5186 = _5168;
    float _5188 = _5170;
    float _5190 = _5150;
    float _5192 = _5150;
    if (!_5062)
    {
        _5186 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5194 = _5186;
    out.m_107.x = _5178;
    float _5196 = _5194;
    float _5198 = _5194;
    if (!_5062)
    {
        _5122 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5200 = _5122;
    float _5202 = _5200;
    float _5204 = _5200;
    if (!_5062)
    {
        _5188 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5206 = _5188;
    out.m_109.x = _5174;
    out.m_109.y = _5176;
    out.m_109.z = _5182;
    out.m_109.w = _5180;
    bool _5208 = !_5062;
    float _5210 = _5206;
    float _5212 = _5206;
    if (!_5208)
    {
        bool _5214 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5216 = isnan(_4713);
        bool _5218 = _5214 || _5216;
        bool _5220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5222 = _5218 || _5220;
        if (!_5222)
        {
            float _5224 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5226 = _4713 + _5224;
            float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5230 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5228;
            float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5234 = _5232 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5236 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5238 = _5236 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5240 = 1.0 / _5230;
            float _5242 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5244 = _5242 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5246 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5248 = _5246 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5250 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5252 = _5250 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5254 = _5226 * _5240;
            float _5256 = precise::clamp(_5254, 0.0, 1.0);
            float _5258 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5260 = _5258 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5262 = fma(_5256, _5234, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5264 = fma(_5256, _5238, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5266 = fma(_5256, _5260, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5268 = fma(_5256, _5244, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5270 = fma(_5256, _5248, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5272 = fma(_5256, _5252, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5204 = _5262;
            _5148 = _5270;
            _5138 = _5264;
            _5198 = _5268;
            _5212 = _5266;
            _5192 = _5272;
            _5274 = true;
        }
        else
        {
            bool _5276 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5278 = isnan(_4713);
            bool _5280 = _5276 || _5278;
            bool _5282 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5284 = _5280 || _5282;
            if (!_5284)
            {
                _5196 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5286 = _5196;
            _5198 = _5286;
            if (!_5284)
            {
                _5146 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5288 = _5146;
            _5148 = _5288;
            if (!_5284)
            {
                _5190 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5290 = _5190;
            _5192 = _5290;
            if (!_5284)
            {
                _5136 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5292 = _5136;
            _5138 = _5292;
            if (!_5284)
            {
                _5202 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5294 = _5202;
            _5204 = _5294;
            if (!_5284)
            {
                _5210 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5296 = _5210;
            bool _5298 = !_5284;
            _5212 = _5296;
            if (!_5298)
            {
                bool _5300 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5302 = isnan(_4713);
                bool _5304 = _5300 || _5302;
                bool _5306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5308 = _5304 || _5306;
                if (!_5308)
                {
                    float _5310 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5312 = _4713 + _5310;
                    float _5314 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5316 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5314;
                    float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5320 = _5318 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5324 = _5322 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5326 = 1.0 / _5316;
                    float _5328 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5330 = _5328 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5332 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5334 = _5332 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5336 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5338 = _5336 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5340 = _5312 * _5326;
                    float _5342 = precise::clamp(_5340, 0.0, 1.0);
                    float _5344 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5346 = _5344 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5348 = fma(_5342, _5320, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5350 = fma(_5342, _5324, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5352 = fma(_5342, _5346, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5354 = fma(_5342, _5330, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5356 = fma(_5342, _5334, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5358 = fma(_5342, _5338, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5204 = _5348;
                    _5148 = _5356;
                    _5138 = _5350;
                    _5198 = _5354;
                    _5212 = _5352;
                    _5192 = _5358;
                    _5274 = true;
                }
                else
                {
                    _5204 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5148 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5138 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5198 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5212 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5192 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5274 = false;
    float _5360 = _5204;
    float _5362 = _5148;
    float _5364 = _5138;
    float _5366 = _5198;
    float _5368 = _5212;
    float _5370 = _5192;
    float _5372 = _5184 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5374 = fma(_4311, -0.5, 0.5);
    float _5376 = precise::clamp(_5374, 0.0, 1.0);
    float _5378 = -_5360;
    float _5380 = _5362 + _5378;
    float _5382 = -_5364;
    float _5384 = _5366 + _5382;
    out.m_57.x = _5372;
    float _5386 = -_5368;
    float _5388 = _5370 + _5386;
    float _5390 = fma(_5376, _5380, _5360);
    float _5392 = fma(_5376, _5384, _5364);
    bool _5394 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5396 = _5390 * 0.586610972881317138671875;
    float _5398 = fma(_5376, _5388, _5368);
    out.m_111.x = 0.0;
    bool _5400 = _4691 > 0.0;
    bool _5402 = isnan(_4691);
    bool _5404 = _5400 || _5402;
    bool _5406 = isnan(0.0);
    bool _5408 = _5404 || _5406;
    float _5410 = fma(_5392, 0.298911988735198974609375, _5396);
    float _5412 = fma(_5398, 0.114477999508380889892578125, _5410);
    float _5414 = -_5412;
    float _5416 = _5392 + _5414;
    float _5418 = -_5412;
    float _5420 = _5390 + _5418;
    float _5422 = -_5412;
    float _5424 = _5398 + _5422;
    float _5426 = fma(_5416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    float _5428 = fma(_5420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    float _5430 = fma(_5424, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    bool _5432 = !_5394;
    if (!_5432)
    {
        float _5434 = -_4631;
        float _5436 = _5434 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5438 = -_4633;
        float _5440 = _5438 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5442 = -_4635;
        float _5444 = _5442 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5446 = _5436 * _5436;
        float _5448 = fma(_5440, _5440, _5446);
        float _5450 = fma(_5444, _5444, _5448);
        float _5452 = sqrt(_5450);
        float _5454 = rsqrt(_5450);
        float _5456 = -_5452;
        float _5458 = _5456 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5460 = _5458 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5462 = precise::clamp(_5460, 0.0, 1.0);
        float _5464 = _5440 * _5454;
        float _5466 = _5436 * _5454;
        float _5468 = abs(_5462);
        float _5470 = log2(_5468);
        float _5472 = _5444 * _5454;
        float _5474 = _5464 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5476 = _4311 * _5466;
        float _5478 = -_5466;
        float _5480 = -_5474;
        float _5482 = fma(_5478, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5480);
        float _5484 = fma(_4301, _5464, _5476);
        float _5486 = -_5472;
        float _5488 = fma(_5486, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5482);
        float _5490 = fma(_4313, _5472, _5484);
        float _5492 = precise::clamp(_5490, 0.0, 1.0);
        float _5494 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5496 = _5488 + _5494;
        float _5498 = _5470 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5500 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5502 = precise::clamp(_5500, 0.0, 1.0);
        float _5504 = exp2(_5498);
        float _5506 = _5504 * _5502;
        float _5508 = _5492 * _5506;
        float _5510 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5512 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5514 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _5510;
        out.m_111.y = _5512;
        out.m_111.z = _5514;
    }
    out.m_113.x = _5426;
    out.m_113.y = _5428;
    out.m_113.z = _5430;
    if (_5408)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_57.x = 0.0;
    float _5516 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5516;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5274 = false;
    bool _4361 = false;
    bool _712 = false;
    bool _526 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = in.m_52.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = as_type<float>(_134);
    float _148 = _138;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _144;
    if (!_142)
    {
        out.m_57.x = 0.0;
    }
    int _152 = 0;
    if (!_142)
    {
        float _154 = _150 * 5.0;
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    int _158 = _156;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5585 = as_type<float>(_156);
        out.gl_Position.z = _5585;
    }
    if (!_142)
    {
        return out;
    }
    bool _160 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_129);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = float(_134);
    bool _172 = _138 >= _170;
    bool _174 = !_168;
    bool _176 = _172 || _174;
    float _178 = 1.0 / _170;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _146;
    if (_176)
    {
        out.m_57.x = 0.0;
    }
    float _182 = _138 * _178;
    float _184 = _182;
    if (_176)
    {
        float _186 = _180 * 5.0;
        _158 = as_type<int>(_186);
    }
    int _188 = _158;
    out.m_55.x = _182;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5648 = as_type<float>(_188);
        out.gl_Position.z = _5648;
    }
    if (_176)
    {
        return out;
    }
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    float _210 = in.m_65.x;
    float _212 = in.m_65.y;
    float _214 = in.m_65.z;
    float _216 = _192 * _200;
    float _218 = _192 * _206;
    float _220 = fma(_190, _198, _216);
    float _222 = _192 * _212;
    float _224 = fma(_190, _204, _218);
    float _226 = fma(_194, _202, _220);
    float _228 = fma(_190, _210, _222);
    float _230 = fma(_194, _208, _224);
    float _232 = fma(_194, _214, _228);
    bool _234 = !_196;
    float _252;
    if (!_234)
    {
        float _236 = in.m_67.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        _252 = _182;
    }
    _254 = false;
    float _256 = _252;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _256 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _256 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = 1.0 / _276;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _272;
    bool _292 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_256);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _284;
    float _306 = 1.0 / _280;
    float _308 = _260 * _290;
    bool _310 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_256);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = _264 * _304;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _256 + _328;
    bool _332 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _334 = isnan(_256);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = isnan(_256);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _330 * _286;
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = -_342;
    float _364 = _362 + 1.0;
    float _366 = _268 * _306;
    float _368 = _354 * _360;
    float _370 = -_354;
    float _372 = _370 + 1.0;
    float _374 = _320 * _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _380 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_256);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _302 * _372;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -_302;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = fma(_396, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = fma(_400, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = _390 * _404;
    float _420 = fma(_324, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = fma(_408, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_378, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _410 * _418;
    float _430 = _412 * _418;
    float _432 = -_390;
    float _434 = _432 + 1.0;
    float _436 = _420 * _418;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _444 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_422, _392, _442);
    float _458 = fma(_424, _392, _444);
    float _460 = fma(_426, _392, _446);
    float _462 = fma(_450, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_440, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_454, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_462, _368, _456);
    float _482 = fma(_470, _356, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _356, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _356, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_464, _368, _458);
    float _490 = fma(_466, _368, _460);
    float _492 = fma(_482, _374, _480);
    float _494 = fma(_484, _374, _488);
    float _496 = fma(_486, _374, _490);
    float _498 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].x, _492);
    float _500 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].y, _494);
    float _502 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].z, _496);
    bool _504 = !_288;
    float _506 = _308;
    float _524;
    if (!_504)
    {
        float _508 = in.m_67.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _524 = _522;
        _526 = true;
    }
    else
    {
        _524 = _182;
    }
    _526 = false;
    float _528 = _524;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _528 + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_528);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _558 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _560 = isnan(_528);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = 1.0 / _536;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _572;
    float _576 = -_552;
    float _578 = _576 + 1.0;
    bool _580 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_528);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    bool _592 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _594 = 1.0 / _540;
    float _596 = 1.0 / _556;
    float _598 = _574 * _570;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _604 = _568 * _578;
    float _606 = -_568;
    float _608 = _606 + 1.0;
    float _610 = fma(_598, _532, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _612 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _614 = isnan(_528);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = _590 * _608;
    float _626 = _602 * _594;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _634 = _528 + _632;
    float _636 = _610 * _624;
    float _638 = -_590;
    float _640 = _638 + 1.0;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    float _646 = fma(_626, _634, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _648 = _630 * _596;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _652 = _528 + _650;
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _636);
    float _656 = _552 * _644;
    float _658 = fma(_648, _652, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _660 = fma(_646, _604, _654);
    float _662 = fma(_658, _656, _660);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _662);
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _678 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = in.m_69.x;
    float _682 = in.m_69.y;
    float _684 = in.m_69.z;
    out.m_71.x = _672;
    out.m_71.y = _674;
    out.m_71.z = _678;
    out.m_71.w = _676;
    float _686 = _502 * _684;
    float _688 = _500 * _682;
    float _690 = _498 * _680;
    bool _692 = !_592;
    float _710;
    if (!_692)
    {
        float _694 = in.m_67.x;
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        _710 = _182;
    }
    _712 = false;
    float _714 = _710;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _718 = _714 + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _726 = isnan(_714);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _744 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_714);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = 1.0 / _722;
    float _758 = -_734;
    float _760 = _758 + 1.0;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _762;
    bool _766 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _768 = isnan(_714);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _754 * _760;
    float _780 = -_754;
    float _782 = _780 + 1.0;
    bool _784 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _786 = 1.0 / _738;
    float _788 = _776 * _782;
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = 1.0 / _742;
    float _796 = _764 * _756;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _802 = fma(_796, _718, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _804 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _806 = isnan(_714);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _800 * _786;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _824 = _714 + _822;
    float _826 = _802 * _788;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _830 = _714 + _828;
    float _832 = fma(_816, _824, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _834 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[131].x, _826);
    float _836 = _820 * _794;
    float _838 = -_814;
    float _840 = _838 + 1.0;
    float _842 = fma(_832, _778, _834);
    float _844 = fma(_836, _830, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _846 = _734 * _840;
    float _848 = fma(_844, _846, _842);
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _856 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[134].x, _848);
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _862 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = _856 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _858;
    out.m_73.y = _860;
    out.m_73.z = _862;
    out.m_73.w = _864;
    bool _866 = !_784;
    if (!_866)
    {
        float _868 = in.m_67.x;
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _184 = _882;
    }
    float _884 = _184;
    float _886 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _888 = int(_886);
    float _890 = in.m_75.x;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _898 = _896 != 0;
    float _900 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _902 = int(_900);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _910 = _908 != 0;
    float _912 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _914 = int(_912);
    float _916 = float(_888);
    float _918 = 0.0;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _922 = _894;
    float _924 = _890;
    if (_894)
    {
        _918 = 1.0;
    }
    float _926 = _918;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _930 = _928 != 0;
    float _932 = 0.0;
    float _934 = _926;
    bool _936 = _910;
    if (_894)
    {
        _932 = 1.0;
    }
    float _938 = _932;
    float _940 = float(_902);
    float _942 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _944 = int(_942);
    float _946 = 0.0;
    float _948 = _938;
    if (_898)
    {
        float _950 = in.m_67.x;
        _946 = _950;
    }
    float _952 = _946;
    int _954 = 0;
    if (_894)
    {
        _954 = 0;
    }
    int _956 = _954;
    int _958 = _956;
    if (_894)
    {
        _920 = 0;
    }
    int _960 = _920;
    int _962 = int(_894);
    int _964 = _910 ? 2 : 0;
    int _966 = _962 | _964;
    int _968 = _898 ? 4 : 0;
    int _970 = _966 | _968;
    int _972 = _906 ? 8 : 0;
    int _974 = _970 | _972;
    int _976 = false ? 16 : 0;
    int _978 = _974 | _976;
    int _980 = false ? 32 : 0;
    int _982 = _978 | _980;
    int _984 = _930 ? 64 : 0;
    int _986 = _982 | _984;
    int _988 = _986 & 2;
    float _990 = float(_914);
    float _992 = 1.0 / _916;
    int _994 = _960;
    float _996 = as_type<float>(_988);
    if (_906)
    {
        float _998 = in.m_67.z;
        _506 = _998;
    }
    float _1000 = _506;
    float _1002 = 1.0 / _940;
    float _1004 = float(uint(_944));
    float _1006 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1008 = int(_1006);
    float _1010 = _992 * _138;
    float _1012 = 1.0 / _990;
    float _1014 = _1002 * _138;
    float _1016 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1018 = int(_1016);
    float _1020 = float(uint(_1008));
    float _1022 = 1.0 / _1004;
    float _1024 = _1012 * _138;
    float _1026 = trunc(_1010);
    int _1028 = int(_1026);
    float _1030 = float(uint(_1018));
    float _1032 = 1.0 / _1020;
    int _1034 = as_type<int>(_1022) + (-2);
    float _1036 = _1022;
    if (_894)
    {
        float _1038 = in.m_67.x;
        _1036 = _1038;
    }
    float _1040 = _1036;
    float _1042 = trunc(_1014);
    int _1044 = int(_1042);
    float _1046 = float(uint(_1028));
    float _1048 = in.m_67.y;
    float _1050 = 1.0 / _1030;
    int _1052 = as_type<int>(_1032) + (-2);
    int _1054 = ~_1008;
    int _1056 = _1054 + 1;
    float _1058 = trunc(_1024);
    int _1060 = int(_1058);
    float _1062 = float(uint(_1044));
    float _1064 = as_type<float>(_1034) * _1046;
    float _1066 = as_type<float>(_1052) * _1062;
    int _1068 = as_type<int>(_1050) + (-2);
    float _1070 = trunc(_1064);
    float _1072 = precise::max(_1070, 0.0);
    uint _1075 = uint(_1072);
    float _1077 = 0.0;
    float _1079 = _1066;
    float _1081 = _1040;
    if (_894)
    {
        _1077 = _1048;
    }
    float _1083 = _1077;
    float _1085 = float(uint(_1060));
    float _1087 = trunc(_1066);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = as_type<float>(_1068) * _1085;
    float _1095 = _1085;
    float _1097 = _1083;
    if (_894)
    {
        _1095 = _1040;
    }
    float _1099 = _1095;
    float _1101 = _1099;
    if (_894)
    {
        _1079 = _1099;
    }
    float _1103 = _1079;
    float _1105 = trunc(_1093);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    float _1111 = 0.0;
    float _1113 = _1103;
    if (_894)
    {
        _1111 = _1099;
    }
    float _1115 = _1111;
    int _1117 = _1056 * int(_1091);
    int _1119 = _1117 + _1044;
    float _1121 = _1115;
    int _1123 = _1119;
    if (!_894)
    {
        float _1125 = in.m_67.x;
        float _1127 = _1048 * 3.1415927410125732421875;
        float _1129 = in.m_67.z;
        float _1131 = _1127 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1125 * 3.1415927410125732421875;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = _1139 * 6.283185482025146484375;
        float _1143 = sin(_1141);
        _1081 = _1125;
        _934 = 7.345489978790283203125;
        _1113 = _1129;
        _948 = 5.839270114898681640625;
        _1101 = _1048;
        _994 = 2;
        _958 = 1;
        _1097 = _1135;
        _1121 = _1143;
    }
    float _1145 = _1081;
    float _1147 = _934;
    float _1149 = _1113;
    float _1151 = _948;
    float _1153 = _1101;
    int _1155 = _994;
    int _1157 = _958;
    float _1159 = _1097;
    float _1161 = _1121;
    float _1163 = float(uint(_1119));
    float _1165 = _1145 * _1147;
    float _1167 = _1149 * _1151;
    int _1169 = ~_944;
    int _1171 = _1169 + 1;
    int _1173 = _1171;
    if (_898)
    {
        float _1175 = -_890;
        float _1177 = _1175 + 1.0;
        _1123 = as_type<int>(_1177);
    }
    int _1179 = _1123;
    float _1181 = as_type<float>(_1052) * _1163;
    float _1183 = floor(_1165);
    if (_898)
    {
        bool _1185 = _952 > 0.5;
        _922 = _1185;
    }
    bool _1187 = _922;
    float _1189 = _1153 * _1147;
    if (_906)
    {
        bool _1191 = _1000 > 0.5;
        _936 = _1191;
    }
    bool _1193 = _936;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1197 = _1195 != 0;
    if (_906)
    {
        float _1199 = -_890;
        float _1201 = _1199 + 1.0;
        _1173 = as_type<int>(_1201);
    }
    int _1203 = _1173;
    float _1205 = 0.0;
    if (!_898)
    {
        _1205 = _890;
    }
    float _1207 = _1205;
    float _1209 = trunc(_1181);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    float _1215 = _1207;
    if (_898)
    {
        float _1217 = _1187 ? as_type<float>(_1179) : _890;
        _1215 = _1217;
    }
    float _1219 = _1215;
    int _1221 = _1171 * int(_1075);
    int _1223 = _1221 + _1028;
    int _1225 = ~_1018;
    int _1227 = _1225 + 1;
    bool _1229 = !_1197;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = 0.0;
    if (!_906)
    {
        _1233 = _890;
    }
    float _1235 = _1233;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1239 = _1237 != 0;
    float _1241 = _1235;
    if (_906)
    {
        float _1243 = _1193 ? as_type<float>(_1203) : _890;
        _1241 = _1243;
    }
    float _1245 = _1241;
    float _1247 = floor(_1167);
    int _1249 = ~_1008;
    int _1251 = _1249 + 1;
    float _1253 = _178 * _138;
    float _1255 = float(_1008);
    float _1257 = in.m_75.y;
    int _1259 = abs(_1231);
    bool _1261 = !_1239;
    int _1263 = _1261 ? 0 : 1;
    float _1265 = floor(_1189);
    int _1267 = int(_1091) + int(_1213);
    int _1269 = _1227 * int(_1109);
    int _1271 = _1269 + _1060;
    float _1273 = float(uint(_1223));
    float _1275 = -_1183;
    float _1277 = _1165 + _1275;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1281 = _1279 != 0;
    int _1283 = _1251 * _1267;
    int _1285 = _1283 + _1044;
    float _1287 = float(uint(_1271));
    float _1289 = as_type<float>(_1034) * _1273;
    float _1291 = -_1247;
    float _1293 = _1167 + _1291;
    float _1295 = _1255 * _1253;
    bool _1297 = uint(_1285) >= uint(_1008);
    float _1299 = trunc(_1289);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = as_type<float>(_1068) * _1287;
    float _1307 = float(_1018);
    bool _1309 = _1155 != 2;
    float _1311 = -_1265;
    float _1313 = _1189 + _1311;
    float _1315 = float(_944);
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1319 = _1317 != 0;
    float _1321 = float(_1028);
    float _1323 = trunc(_1305);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    float _1329 = _1255 * _1293;
    float _1331 = float(_1060);
    float _1333 = _1145 * 2.0;
    bool _1335 = _1321 >= _1315;
    bool _1337 = isnan(_1321);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan(_1315);
    bool _1343 = _1339 || _1341;
    float _1345 = float(_1343);
    float _1347 = _1315 * _1277;
    float _1349 = float(_1044);
    float _1351 = _1315 * _1253;
    float _1353 = trunc(_1329);
    int _1355 = int(_1353);
    float _1357 = _1307 * _1253;
    bool _1359 = _1349 >= _1255;
    bool _1361 = isnan(_1349);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(_1255);
    bool _1367 = _1363 || _1365;
    float _1369 = float(_1367);
    float _1371 = _1307 * _1313;
    bool _1373 = _1331 >= _1307;
    bool _1375 = isnan(_1331);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan(_1307);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = in.m_63.w;
    bool _1387 = !_1297;
    int _1389 = _1387 ? 0 : (-1);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1393 = _884 + _1391;
    float _1395 = trunc(_1369);
    int _1397 = int(_1395);
    int _1399 = int(_1075) + int(_1303);
    float _1401 = in.m_61.w;
    int _1403 = ~_1267;
    int _1405 = _1403 + _1389;
    int _1407 = _1405 + 1;
    int _1409 = ~_944;
    int _1411 = _1409 + 1;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1415 = _1413 != 0;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1419 = _1417 != 0;
    int _1421 = _1355 * _1259;
    int _1423 = _1421 + _1044;
    bool _1425 = _1008 == 0;
    int _1427 = _1008 * _1407;
    int _1429 = _1427 + _1044;
    float _1431 = trunc(_1295);
    int _1433 = int(_1431);
    int _1435 = int(_1109) + int(_1327);
    int _1437 = ~_1018;
    int _1439 = _1437 + 1;
    int _1441 = _1411 * _1399;
    int _1443 = _1441 + _1028;
    int _1445 = ~_1397;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    bool _1451 = !_1419;
    int _1453 = _1451 ? 0 : 1;
    int _1455 = _1439 * _1435;
    int _1457 = _1455 + _1060;
    bool _1459 = !_1425;
    int _1461 = _1459 ? _1429 : (-1);
    float _1463 = trunc(_1345);
    int _1465 = int(_1463);
    bool _1467 = !_1415;
    int _1469 = _1467 ? 0 : 1;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1473 = _1471 != 0;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1477 = _1475 != 0;
    bool _1479 = uint(_1443) >= uint(_944);
    int _1481 = _1461 * _1449;
    int _1483 = _1008 + (-1);
    float _1485 = trunc(_1383);
    int _1487 = int(_1485);
    bool _1489 = !_1477;
    int _1491 = _1489 ? 0 : 1;
    bool _1493 = uint(_1457) >= uint(_1018);
    int _1495 = _1397 * _1483;
    int _1497 = _1495 + _1481;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1501 = _1499 != 0;
    bool _1503 = !_1473;
    int _1505 = _1503 ? 0 : 1;
    float _1507 = trunc(_1351);
    int _1509 = int(_1507);
    int _1511 = abs(_1491);
    bool _1513 = !_1501;
    int _1515 = _1513 ? 0 : 1;
    int _1517 = abs(_1505);
    float _1519 = floor(_1333);
    int _1521 = abs(_1515);
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1525 = _1523 != 0;
    int _1527 = _1497 * _1511;
    bool _1529 = !_1525;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1535 = _1433 * _1517;
    int _1537 = _1535 + _1527;
    int _1539 = abs(_1531);
    int _1541 = _1521;
    int _1543 = _1487;
    float _1545 = as_type<float>(_1399);
    if (_930)
    {
        float _1547 = -_890;
        float _1549 = _1547 + 1.0;
        _1541 = as_type<int>(_1549);
    }
    int _1551 = _1541;
    bool _1553 = !_1479;
    int _1555 = _1553 ? 0 : (-1);
    int _1557 = _1423 * _1521;
    int _1559 = _1557 + _1537;
    bool _1561 = _944 == 0;
    float _1563 = trunc(_1347);
    int _1565 = int(_1563);
    int _1567 = ~_1399;
    int _1569 = _1567 + _1555;
    int _1571 = _1569 + 1;
    int _1573 = _1355 * _1539;
    int _1575 = _1573 + _1559;
    bool _1577 = !_1493;
    int _1579 = _1577 ? 0 : (-1);
    int _1581 = ~_1465;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    int _1587 = _944 * _1571;
    int _1589 = _1587 + _1028;
    int _1591 = ~_1435;
    int _1593 = _1591 + _1579;
    int _1595 = _1593 + 1;
    float _1597 = float(uint(_1575));
    bool _1599 = !_1561;
    int _1601 = _1599 ? _1589 : (-1);
    int _1603 = _1018 * _1595;
    int _1605 = _1603 + _1060;
    int _1607 = _944 + (-1);
    float _1609 = as_type<float>(_1052) * _1597;
    bool _1611 = _1018 == 0;
    int _1613 = _1601 * _1585;
    int _1615 = abs(_1263);
    bool _1617 = !_1281;
    int _1619 = _1617 ? 0 : 1;
    int _1621 = abs(_1453);
    float _1623 = trunc(_1609);
    float _1625 = precise::max(_1623, 0.0);
    uint _1627 = uint(_1625);
    int _1629 = _1465 * _1607;
    int _1631 = _1629 + _1613;
    int _1633 = abs(_1469);
    int _1635 = _1565 * _1615;
    int _1637 = _1635 + _1028;
    int _1639 = ~_1487;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1631 * _1621;
    bool _1647 = !_1611;
    int _1649 = _1647 ? _1605 : (-1);
    bool _1651 = _1157 != 1;
    int _1653 = ~_1008;
    int _1655 = _1653 + 1;
    int _1657 = _1509 * _1633;
    int _1659 = _1657 + _1645;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1663 = _1661 != 0;
    int _1665 = _1649 * _1643;
    float _1667 = in.m_67.w;
    bool _1669 = !_1663;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1675 = _1673 != 0;
    int _1677 = _1655 * int(_1627);
    int _1679 = _1677 + _1575;
    int _1681 = abs(_1671);
    float _1683 = trunc(_1357);
    int _1685 = int(_1683);
    bool _1687 = !_1675;
    int _1689 = _1687 ? 0 : 1;
    float _1691 = float(uint(_1679));
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1695 = _1693 != 0;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1699 = _1697 != 0;
    float _1701 = as_type<float>(_1052) * _1691;
    int _1703 = _1018 + (-1);
    int _1705 = _1637 * _1681;
    int _1707 = _1705 + _1659;
    int _1709 = abs(_1689);
    float _1711 = trunc(_1701);
    float _1713 = precise::max(_1711, 0.0);
    uint _1715 = uint(_1713);
    bool _1717 = !_1699;
    int _1719 = _1717 ? 0 : 1;
    int _1721 = _1487 * _1703;
    int _1723 = _1721 + _1665;
    float _1725 = float(uint(_1423));
    int _1727 = _1565 * _1709;
    int _1729 = _1727 + _1707;
    int _1731 = abs(_1719);
    bool _1733 = !_1695;
    int _1735 = _1733 ? 0 : 1;
    float _1737 = as_type<float>(_1052) * _1725;
    int _1739 = ~_1008;
    int _1741 = _1739 + 1;
    int _1743 = _1723 * _1731;
    float _1745 = float(uint(_1729));
    float _1747 = trunc(_1737);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    int _1753 = abs(_1735);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1757 = _1755 != 0;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1761 = _1759 != 0;
    float _1763 = as_type<float>(_1034) * _1745;
    int _1765 = int(_1627) + int(_1715);
    int _1767 = _1685 * _1753;
    int _1769 = _1767 + _1743;
    float _1771 = trunc(_1763);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    bool _1777 = _1667 > 0.5;
    int _1779 = ~_1008;
    int _1781 = _1779 + 1;
    int _1783 = _1741 * _1765;
    int _1785 = _1783 + _1575;
    bool _1787 = !_1757;
    int _1789 = _1787 ? 0 : 1;
    int _1791 = ~_944;
    int _1793 = _1791 + 1;
    float _1795 = trunc(_1371);
    int _1797 = int(_1795);
    bool _1799 = uint(_1785) >= uint(_1008);
    int _1801 = _1781 * int(_1751);
    int _1803 = _1801 + _1423;
    int _1805 = abs(_1789);
    float _1807 = float(uint(_1637));
    bool _1809 = _988 != 0;
    int _1811 = _1793 * int(_1775);
    int _1813 = _1811 + _1729;
    int _1815 = abs(_1619);
    float _1817 = as_type<float>(_1034) * _1807;
    float _1819 = float(uint(_1803));
    float _1821 = float(uint(_1813));
    bool _1823 = !_1799;
    int _1825 = _1823 ? 0 : (-1);
    int _1827 = _1797 * _1815;
    int _1829 = _1827 + _1060;
    bool _1831 = !_1761;
    int _1833 = _1831 ? 0 : 1;
    float _1835 = as_type<float>(_1034) * _1821;
    float _1837 = as_type<float>(_1052) * _1819;
    int _1839 = _1829 * _1805;
    int _1841 = _1839 + _1769;
    int _1843 = abs(_1833);
    float _1845 = as_type<float>(_1575);
    if (_1809)
    {
        float _1847 = -_890;
        float _1849 = _1847 + 1.0;
        _1543 = as_type<int>(_1849);
    }
    int _1851 = _1543;
    float _1853 = trunc(_1817);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    int _1859 = ~_944;
    int _1861 = _1859 + 1;
    int _1863 = ~_1765;
    int _1865 = _1863 + _1825;
    int _1867 = _1865 + 1;
    bool _1869 = _1008 == 0;
    int _1871 = _1797 * _1843;
    int _1873 = _1871 + _1841;
    float _1875 = trunc(_1835);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    int _1881 = _1008 * _1867;
    int _1883 = _1881 + _1575;
    bool _1885 = _1048 > 0.5;
    float _1887 = float(uint(_1873));
    int _1889 = _1861 * int(_1857);
    int _1891 = _1889 + _1637;
    bool _1893 = !_1869;
    int _1895 = _1893 ? _1883 : (-1);
    float _1897 = trunc(_1837);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    float _1903 = as_type<float>(_1068) * _1887;
    if (!_1809)
    {
        _1845 = _890;
    }
    float _1905 = _1845;
    float _1907 = float(uint(_1891));
    float _1909 = _1905;
    if (_1809)
    {
        float _1911 = _1885 ? as_type<float>(_1851) : _890;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    int _1921 = int(_1775) + int(_1879);
    float _1923 = as_type<float>(_1034) * _1907;
    float _1925 = float(uint(_1829));
    int _1927 = _1895 & 3;
    bool _1929 = _1927 != 0;
    int _1931 = _1895 & 3;
    bool _1933 = _1931 != 0;
    float _1935 = as_type<float>(_1068) * _1925;
    int _1937 = _1929 ? 0 : 1;
    float _1939 = in.m_67.z;
    bool _1941 = uint(_1931) > 1u;
    float _1943 = trunc(_1923);
    float _1945 = precise::max(_1943, 0.0);
    uint _1947 = uint(_1945);
    int _1949 = ~_1018;
    int _1951 = _1949 + 1;
    int _1953 = ~_944;
    int _1955 = _1953 + 1;
    int _1957 = int(_1751) + int(_1901);
    int _1959 = _1951 * int(_1919);
    int _1961 = _1959 + _1873;
    float _1963 = -_1257;
    float _1965 = _1963 + 1.0;
    float _1967 = trunc(_1935);
    float _1969 = precise::max(_1967, 0.0);
    uint _1971 = uint(_1969);
    int _1973 = _1955 * _1921;
    int _1975 = _1973 + _1729;
    int _1977 = ~_1937;
    int _1979 = _1977 + 1;
    int _1981 = _1979 + 1;
    float _1983 = float(uint(_1961));
    int _1985 = _1981;
    float _1987 = as_type<float>(_1919);
    if (!_1941)
    {
        int _1989 = ~_1937;
        int _1991 = _1989 + 1;
        _1985 = _1991;
    }
    int _1993 = _1985;
    int _1995 = ~_1018;
    int _1997 = _1995 + 1;
    float _1999 = as_type<float>(_1068) * _1983;
    int _2001 = _1777 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2003 = uint(_1975) >= uint(_944);
    float _2005 = trunc(_1999);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    if (_930)
    {
        float _2011 = _1885 ? as_type<float>(_1551) : _890;
        _924 = _2011;
    }
    float _2013 = _924;
    int _2015 = _1997 * int(_1971);
    int _2017 = _2015 + _1829;
    bool _2019 = !_2003;
    int _2021 = _2019 ? 0 : (-1);
    int _2023 = _1885 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2025 = uint(_1931) >= 2u;
    bool _2027 = _1931 != 3;
    float _2029 = float(uint(_2017));
    int _2031 = _2025 ? 0 : 1;
    float _2033 = as_type<float>(_1068) * _2029;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2037 = _2035 != 0;
    int _2039 = ~_1921;
    int _2041 = _2039 + _2021;
    int _2043 = _2041 + 1;
    int _2045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2047 = _2045 != 0;
    int _2049 = ~_2031;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    int _2055 = ~_1008;
    int _2057 = _2055 + 1;
    int _2059 = _2053;
    if (_2027)
    {
        int _2061 = ~_2031;
        int _2063 = _2061 + 1;
        _2059 = _2063;
    }
    int _2065 = _2059;
    int _2067 = ~_1018;
    int _2069 = _2067 + 1;
    int _2071 = _2057 * _1957;
    int _2073 = _2071 + _1423;
    int _2075 = int(_1919) + int(_2009);
    int _2077 = int(_1857) + int(_1947);
    int _2079 = _944 * _2043;
    int _2081 = _2079 + _1729;
    if (_1309)
    {
        _1987 = _1145;
    }
    float _2083 = _1987;
    int _2085 = _2069 * _2075;
    int _2087 = _2085 + _1873;
    float _2089 = 0.0;
    float _2091 = _2083;
    if (_1309)
    {
        _2089 = _1048;
    }
    float _2093 = _2089;
    float _2095 = trunc(_2033);
    float _2097 = precise::max(_2095, 0.0);
    uint _2099 = uint(_2097);
    bool _2101 = _944 == 0;
    float _2103 = _2093;
    if (!_1309)
    {
        _2091 = _1939;
    }
    float _2105 = _2091;
    if (!_1309)
    {
        _2103 = _1145;
    }
    float _2107 = _2103;
    bool _2109 = _1939 > 0.5;
    bool _2111 = !_2101;
    int _2113 = _2111 ? _2081 : (-1);
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_1651)
    {
        _996 = _1048;
    }
    float _2117 = _996;
    float _2119 = 0.0;
    float _2121 = _2117;
    if (!_1651)
    {
        _2119 = _1048;
    }
    float _2123 = _2119;
    float _2125 = 0.0;
    float _2127 = _2123;
    if (!_1651)
    {
        _2125 = _1939;
    }
    float _2129 = _2125;
    float _2131 = _2129;
    if (!_1651)
    {
        _1545 = _1939;
    }
    float _2133 = _1545;
    bool _2135 = uint(_2073) >= uint(_1008);
    float _2137 = _2133;
    if (_1651)
    {
        _2121 = _1145;
    }
    float _2139 = _2121;
    if (_1651)
    {
        _2127 = _1145;
    }
    float _2141 = _2127;
    if (_1651)
    {
        _2131 = _1048;
    }
    float _2143 = _2131;
    float _2145 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1651)
    {
        _2137 = _1048;
    }
    float _2147 = _2137;
    int _2149 = _2109 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2151 = uint(_2087) >= uint(_1018);
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2155 = _2153 != 0;
    int _2157 = _2113 & 3;
    bool _2159 = !_2135;
    int _2161 = _2159 ? 0 : (-1);
    float _2163 = _1319 ? as_type<float>(_2149) : _1257;
    bool _2165 = !_2151;
    int _2167 = _2165 ? 0 : (-1);
    int _2169 = ~_944;
    int _2171 = _2169 + 1;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2175 = _2173 != 0;
    bool _2177 = uint(_2157) > 1u;
    int _2179 = _2171 * _2077;
    int _2181 = _2179 + _1637;
    float _2183 = _2037 ? as_type<float>(_2023) : _1257;
    bool _2185 = !_2175;
    int _2187 = _2185 ? 0 : 1;
    int _2189 = _2113 & 3;
    bool _2191 = _2189 != 0;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2195 = _2193 != 0;
    float _2197 = _2047 ? as_type<float>(_2001) : _1257;
    int _2199 = _2191 ? 0 : 1;
    float _2201 = _2155 ? as_type<float>(_2149) : _1257;
    bool _2203 = uint(_2181) >= uint(_944);
    int _2205 = int(_1971) + int(_2099);
    int _2207 = ~_2199;
    int _2209 = _2207 + 1;
    int _2211 = _2209 + 1;
    int _2213 = _2211;
    if (!_2177)
    {
        int _2215 = ~_2199;
        int _2217 = _2215 + 1;
        _2213 = _2217;
    }
    int _2219 = _2213;
    bool _2221 = !_2203;
    int _2223 = _2221 ? 0 : (-1);
    int _2225 = ~_2075;
    int _2227 = _2225 + _2167;
    int _2229 = _2227 + 1;
    bool _2231 = _2157 != 3;
    float _2233 = in.m_50.x;
    float _2235 = in.m_50.y;
    float _2237 = in.m_50.z;
    int _2239 = ~_1018;
    int _2241 = _2239 + 1;
    int _2243 = _1018 * _2229;
    int _2245 = _2243 + _1873;
    bool _2247 = uint(_2157) >= 2u;
    int _2249 = _2241 * _2205;
    int _2251 = _2249 + _1829;
    int _2253 = _2247 ? 0 : 1;
    bool _2255 = !_1611;
    int _2257 = _2255 ? _2245 : (-1);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2261 = _2259 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2263 = ~_2253;
    int _2265 = _2263 + 1;
    int _2267 = _2265 + 1;
    bool _2269 = uint(_2251) >= uint(_1018);
    int _2271 = _2267;
    if (_2231)
    {
        int _2273 = ~_2253;
        int _2275 = _2273 + 1;
        _2271 = _2275;
    }
    int _2277 = _2271;
    float _2279 = 1.0 / _2261;
    int _2281 = _2257 & 3;
    bool _2283 = !_2269;
    int _2285 = _2283 ? 0 : (-1);
    bool _2287 = uint(_2281) > 1u;
    int _2289 = _2257 & 3;
    bool _2291 = _2289 != 0;
    float _2293 = _206 * _2235;
    float _2295 = _200 * _2235;
    float _2297 = _212 * _2235;
    int _2299 = _2291 ? 0 : 1;
    float _2301 = fma(_204, _2233, _2293);
    float _2303 = fma(_198, _2233, _2295);
    float _2305 = fma(_210, _2233, _2297);
    int _2307 = ~_2299;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = fma(_202, _2237, _2303);
    int _2315 = _2311;
    if (!_2287)
    {
        int _2317 = ~_2299;
        int _2319 = _2317 + 1;
        _2315 = _2319;
    }
    int _2321 = _2315;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2327 = uint(_2281) >= 2u;
    float _2329 = fma(_208, _2237, _2301);
    float _2331 = fma(_214, _2237, _2305);
    int _2333 = _2327 ? 0 : 1;
    float _2335 = _1048 * 2.0;
    bool _2337 = _2281 != 3;
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2341 = _2339 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2343 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2345 = 1.0 / _2325;
    int _2347 = ~_2333;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2359 = _2329 + _1385;
    float _2361 = floor(_2335);
    int _2363 = _2351;
    if (_2337)
    {
        int _2365 = ~_2333;
        int _2367 = _2365 + 1;
        _2363 = _2367;
    }
    int _2369 = _2363;
    float _2371 = fma(_2343, -2.0, _2357);
    bool _2373 = _1519 >= 0.0;
    bool _2375 = isnan(_1519);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2385 = _2383 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2389 = _2387 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2391 = _2381 ? 0 : 1;
    float _2393 = 1.0 / _2341;
    bool _2395 = _1519 > 0.0;
    float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2399 = _2397 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2401;
    int _2405 = ~_2391;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    float _2411 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2413 = 1.0 / _2355;
    float _2415 = _2403 * _2279;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2419 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2417;
    int _2421 = ~_1957;
    int _2423 = _2421 + _2161;
    int _2425 = _2423 + 1;
    float _2427 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2371);
    bool _2429 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2431 = isnan(_884);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = _2409;
    if (!_2395)
    {
        int _2443 = ~_2391;
        int _2445 = _2443 + 1;
        _2441 = _2445;
    }
    int _2447 = _2441;
    float _2449 = 1.0 / _2385;
    bool _2451 = _2361 >= 0.0;
    bool _2453 = isnan(_2361);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan(0.0);
    bool _2459 = _2455 || _2457;
    float _2461 = _2419 * _2393;
    int _2463 = _1008 * _2425;
    int _2465 = _2463 + _1423;
    int _2467 = _2459 ? 0 : 1;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2471 = _884 + _2469;
    bool _2473 = _2361 > 0.0;
    float _2475 = 1.0 / _2389;
    float _2477 = fma(_2415, _2471, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2479 = ~_2467;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    float _2485 = -_2439;
    float _2487 = _2485 + 1.0;
    bool _2489 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2491 = isnan(_884);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    bool _2501 = !_1869;
    int _2503 = _2501 ? _2465 : (-1);
    float _2505 = 1.0 / _2399;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2513 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2511;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2517 = _2515 != 0;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2525 = _2523 != 0;
    float _2527 = _2509 * _2345;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2537;
    float _2541 = _2513 * _2475;
    float _2543 = _2531 * _2413;
    float _2545 = _1048 + _1939;
    float _2547 = _2535 * _2449;
    bool _2549 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2551 = isnan(_884);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2557 = _2553 || _2555;
    float _2559 = float(_2557);
    float _2561 = _1939 * 2.0;
    float _2563 = _2545 + (-1.0);
    float _2565 = _2539 * _2505;
    int _2567 = _2483;
    if (!_2473)
    {
        int _2569 = ~_2467;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = floor(_2561);
    float _2577 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2579 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2581 = isnan(_884);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2587 = _2583 || _2585;
    float _2589 = float(_2587);
    float _2591 = -_2559;
    float _2593 = _2591 + 1.0;
    bool _2595 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2597 = isnan(_884);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2603 = _2599 || _2601;
    float _2605 = float(_2603);
    bool _2607 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2609 = isnan(_884);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2615 = _2611 || _2613;
    float _2617 = float(_2615);
    float _2619 = _2589 * _2593;
    float _2621 = -_2589;
    float _2623 = _2621 + 1.0;
    float _2625 = -_2499;
    float _2627 = _2625 + 1.0;
    bool _2629 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2631 = isnan(_884);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2637 = _2633 || _2635;
    float _2639 = float(_2637);
    float _2641 = _2605 * _2623;
    float _2643 = -_2605;
    float _2645 = _2643 + 1.0;
    bool _2647 = !_1933;
    int _2649 = _2647 ? 0 : 1;
    bool _2651 = _2575 >= 0.0;
    bool _2653 = isnan(_2575);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan(0.0);
    bool _2659 = _2655 || _2657;
    float _2661 = _2499 * _2645;
    float _2663 = _2617 * _2627;
    float _2665 = -_2617;
    float _2667 = _2665 + 1.0;
    bool _2669 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2671 = isnan(_884);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    int _2681 = _2659 ? 0 : 1;
    float _2683 = _2639 * _2667;
    bool _2685 = _2575 > 0.0;
    float _2687 = in.m_65.w;
    float _2689 = -_2639;
    float _2691 = _2689 + 1.0;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2695 = _884 + _2693;
    float _2697 = _2679 * _2487;
    float _2699 = -_2679;
    float _2701 = _2699 + 1.0;
    float _2703 = _2439 * _2691;
    float _2705 = fma(_2527, _2695, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2707 = fma(_2461, _1393, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2709 = _2477 * _2697;
    float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2713 = _884 + _2711;
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2717 = _884 + _2715;
    bool _2719 = !_2517;
    int _2721 = _2719 ? 0 : 1;
    float _2723 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2709);
    float _2725 = fma(_2543, _2713, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2729 = _884 + _2727;
    float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2733 = _884 + _2731;
    float _2735 = fma(_2705, _2703, _2723);
    float _2737 = fma(_2541, _2717, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2739 = _2313 + _1401;
    float _2741 = fma(_2565, _2733, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2743 = fma(_2707, _2683, _2735);
    float _2745 = fma(_2411, _1245, -0.5);
    float _2747 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2749 = _2331 + _2687;
    float _2751 = fma(_2725, _2663, _2743);
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2755 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2757 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2761 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2765 = _2359 + _2763;
    float _2767 = -_2753;
    float _2769 = fma(_2755, 2.0, _2767);
    float _2771 = fma(_2747, -2.0, _2759);
    float _2773 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2761);
    float _2775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2777 = _2739 + _2775;
    float _2779 = _2765 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2783 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2787 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2779);
    float _2789 = -_2781;
    float _2791 = fma(_2783, 2.0, _2789);
    bool _2793 = !_2191;
    int _2795 = _2793 ? 0 : 1;
    float _2797 = fma(_2547, _2729, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2799 = _1931 != 3;
    float _2801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2803 = _2749 + _2801;
    float _2805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2807 = fma(_2737, _2661, _2751);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2787);
    float _2811 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2805);
    bool _2813 = !_2799;
    int _2815 = _2813 ? 0 : (-1);
    float _2817 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    float _2819 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2773);
    bool _2821 = _2809 >= 0.0;
    float _2823 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2811);
    float _2825 = -_138;
    float _2827 = fma(_2825, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2791);
    float _2829 = -_138;
    float _2831 = fma(_2829, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2769);
    float _2833 = fma(_2797, _2641, _2807);
    float _2835 = fma(_2823, _2757, _2827);
    float _2837 = fma(_2819, _2817, _2831);
    float _2839 = fma(_2183, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2841 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2843 = _2785 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2845 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2771);
    float _2847 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2841);
    float _2849 = fma(_2843, _2197, -0.5);
    float _2851 = _2757;
    float _2853 = _2749;
    if (_2821)
    {
        _2851 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2855 = _2851;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2859 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2847);
    float _2861 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    float _2863 = fma(_2741, _2619, _2833);
    float _2865 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2857);
    float _2867 = _2765 * _2765;
    int _2869 = as_type<int>(_2855);
    if (_2821)
    {
        float _2871 = _2855 * 5.0;
        _2869 = as_type<int>(_2871);
    }
    int _2873 = _2869;
    float _2875 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2865);
    float _2877 = fma(_2777, _2777, _2867);
    float _2879 = -_2845;
    float _2881 = fma(_2859, _2861, _2879);
    float _2883 = -_2427;
    float _2885 = fma(_2875, _2839, _2883);
    float _2887 = fma(_2803, _2803, _2877);
    float _2889 = _2885;
    if (_2821)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9602 = as_type<float>(_2873);
        out.gl_Position.z = _9602;
    }
    float _2891 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2893 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2895 = rsqrt(_2887);
    int _2897 = ~_2681;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    float _2903 = _1048 + _1145;
    int _2905 = _2901;
    if (!_2685)
    {
        int _2907 = ~_2681;
        int _2909 = _2907 + 1;
        _2905 = _2909;
    }
    int _2911 = _2905;
    if (_2821)
    {
        out.m_57.x = 0.0;
    }
    int _2913 = ~_2205;
    int _2915 = _2913 + _2285;
    int _2917 = _2915 + 1;
    float _2919 = _2903 + (-1.0);
    int _2921 = _1895 >> 31;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2927 = abs(_2369);
    int _2929 = _2921 & 3;
    float _2931 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2923);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2935 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2925);
    int _2937 = _1895 + _2929;
    float _2939 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2863);
    float _2941 = -_2933;
    float _2943 = fma(_2145, 2.0, _2941);
    float _2945 = _2765 * _2895;
    int _2947 = _2937 >> 2;
    float _2949 = _2777 * _2895;
    float _2951 = -_2945;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2765);
    int _2955 = _2947 << 4;
    int _2957 = _2955 + 656;
    float _2959 = -_2949;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2777);
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2965 = uint(int(uint(_2957) >> uint(2)));
    uint _2967 = uint(int(uint(int(_2965)) >> uint(2)));
    int _2969 = int(_2965) & 3;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[int(_2967)][_2969];
    int _2973 = int(_2965) + 1;
    uint _2975 = uint(int(uint(_2973) >> uint(2)));
    int _2977 = _2973 & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    float _2981 = _2953 * _2953;
    float _2983 = _2881 + 0.5;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2987 = -_2963;
    float _2989 = fma(_2893, 2.0, _2987);
    float _2991 = fma(_2961, _2961, _2981);
    float _2993 = fma(_2891, -2.0, _2985);
    int _2995 = _2957 + 8;
    uint _2997 = uint(int(uint(_2995) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = _2113 >> 31;
    out.m_77.x = _2939;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3017 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2935);
    int _3019 = _3013 & 3;
    float _3021 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2993);
    float _3023 = fma(_2115, -2.0, _3015);
    float _3025 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2931);
    float _3027 = -_138;
    float _3029 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2943);
    int _3031 = abs(_2721);
    float _3033 = -_3021;
    float _3035 = fma(_3017, _2849, _3033);
    int _3037 = _2113 + _3019;
    float _3039 = _2837 + 0.5;
    float _3041 = fma(_3025, _2745, _3029);
    float _3043 = float(_2911);
    float _3045 = _3035 + 0.5;
    int _3047 = _3037 >> 2;
    out.m_79.x = _3039;
    out.m_79.y = _2983;
    int _3049 = abs(_2649);
    float _3051 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3053 = int(_3051);
    int _3055 = _3047 << 4;
    int _3057 = _3055 + 368;
    float _3059 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3023);
    int _3061 = abs(_1993);
    uint _3063 = uint(int(uint(_3057) >> uint(2)));
    uint _3065 = uint(int(uint(int(_3063)) >> uint(2)));
    int _3067 = int(_3063) & 3;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[int(_3065)][_3067];
    int _3071 = int(_3063) + 1;
    uint _3073 = uint(int(uint(_3071) >> uint(2)));
    int _3075 = _3071 & 3;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[int(_3073)][_3075];
    int _3079 = _2257 >> 31;
    float _3081 = _2835 + 0.5;
    float _3083 = float(_3031);
    float _3085 = _2885 + 0.5;
    int _3087 = _3079 & 3;
    float _3089 = _3041 + 0.5;
    int _3091 = ~_3061;
    int _3093 = _3091 + 1;
    int _3095 = _3093 + 1;
    float _3097 = _3083 * _3043;
    int _3099 = _2257 + _3087;
    int _3101 = ~_3049;
    int _3103 = _3101 + 1;
    int _3105 = _3103 + 1;
    out.m_81.x = _3081;
    out.m_81.y = _3085;
    out.m_81.z = _3089;
    out.m_81.w = _3045;
    int _3107 = _3099 >> 2;
    int _3109 = _3095 * as_type<int>(_2979);
    int _3111 = ~_2077;
    int _3113 = _3111 + _2223;
    int _3115 = _3113 + 1;
    int _3117 = _3107 << 4;
    int _3119 = _3117 + 800;
    int _3121 = _3105 * as_type<int>(_2971);
    int _3123 = _3121 + _3109;
    float _3125 = float(uint(_3053));
    int _3127 = _944 * _3115;
    int _3129 = _3127 + _1637;
    int _3131 = abs(_2815);
    int _3133 = abs(_2187);
    bool _3135 = !_2195;
    int _3137 = _3135 ? 0 : 1;
    int _3139 = ~_3131;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    uint _3145 = uint(int(uint(_3119) >> uint(2)));
    uint _3147 = uint(int(uint(int(_3145)) >> uint(2)));
    int _3149 = int(_3145) & 3;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[int(_3147)][_3149];
    int _3153 = int(_3145) + 1;
    uint _3155 = uint(int(uint(_3153) >> uint(2)));
    int _3157 = _3153 & 3;
    float _3159 = (*spvDescriptorSet0.vp_c9)._m0[int(_3155)][_3157];
    int _3161 = abs(_2065);
    float _3163 = 1.0 / _3125;
    int _3165 = abs(_3053);
    int _3167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3169 = _3167 != 0;
    int _3171 = ~_3161;
    int _3173 = _3171 + 1;
    int _3175 = _3173 + 1;
    float _3177 = float(uint(_3165));
    bool _3179 = _944 == 0;
    int _3181 = _3175 * as_type<int>(_3003);
    int _3183 = _3181 + _3123;
    int _3185 = ~_3133;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    int _3191 = _3057 + 8;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    uint _3195 = uint(int(uint(int(_3193)) >> uint(2)));
    int _3197 = int(_3193) & 3;
    float _3199 = (*spvDescriptorSet0.vp_c9)._m0[int(_3195)][_3197];
    int _3201 = int(_3193) + 1;
    uint _3203 = uint(int(uint(_3201) >> uint(2)));
    int _3205 = _3201 & 3;
    float _3207 = (*spvDescriptorSet0.vp_c9)._m0[int(_3203)][_3205];
    float _3209 = 1.0 / _3177;
    int _3211 = _3143 * as_type<int>(_3011);
    int _3213 = _3211 + _3183;
    bool _3215 = !_2291;
    int _3217 = _3215 ? 0 : 1;
    bool _3219 = _2157 != 3;
    int _3221 = _3213 * _3189;
    int _3223 = abs(_2219);
    bool _3225 = !_3219;
    float _3227 = _3225 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _3229 = _2503 * _3133;
    int _3231 = _3229 + _3221;
    int _3233 = ~_3223;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    int _3239 = _3119 + 8;
    uint _3241 = uint(int(uint(_3239) >> uint(2)));
    uint _3243 = uint(int(uint(int(_3241)) >> uint(2)));
    int _3245 = int(_3241) & 3;
    float _3247 = (*spvDescriptorSet0.vp_c9)._m0[int(_3243)][_3245];
    int _3249 = int(_3241) + 1;
    uint _3251 = uint(int(uint(_3249) >> uint(2)));
    int _3253 = _3249 & 3;
    float _3255 = (*spvDescriptorSet0.vp_c9)._m0[int(_3251)][_3253];
    bool _3257 = _2281 != 3;
    int _3259 = as_type<int>(_3163) + (-2);
    int _3261 = _3237 * as_type<int>(_3077);
    float _3263 = float(uint(_3231));
    int _3265 = abs(_3231);
    int _3267 = as_type<int>(_3209) + (-2);
    float _3269 = as_type<float>(_3259) * _3263;
    float _3271 = float(uint(_3265));
    int _3273 = abs(_2321);
    int _3275 = abs(_3217);
    float _3277 = trunc(_3269);
    float _3279 = precise::max(_3277, 0.0);
    uint _3281 = uint(_3279);
    float _3283 = as_type<float>(_3267) * _3271;
    int _3285 = abs(_2795);
    int _3287 = ~_3053;
    int _3289 = _3287 + 1;
    int _3291 = ~_3273;
    int _3293 = _3291 + 1;
    int _3295 = _3293 + 1;
    float _3297 = trunc(_3283);
    float _3299 = precise::max(_3297, 0.0);
    uint _3301 = uint(_3299);
    int _3303 = ~_3285;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    int _3309 = abs(_2277);
    int _3311 = _3295 * as_type<int>(_3159);
    int _3313 = _3307 * as_type<int>(_3069);
    int _3315 = _3313 + _3261;
    int _3317 = ~_3275;
    int _3319 = _3317 + 1;
    int _3321 = _3319 + 1;
    int _3323 = ~_3165;
    int _3325 = _3323 + 1;
    int _3327 = _3289 * int(_3281);
    int _3329 = _3327 + _3231;
    int _3331 = _3321 * as_type<int>(_3151);
    int _3333 = _3331 + _3311;
    float _3335 = float(uint(_3329));
    int _3337 = ~_3309;
    int _3339 = _3337 + 1;
    int _3341 = _3339 + 1;
    int _3343 = _3325 * int(_3301);
    int _3345 = _3343 + _3265;
    bool _3347 = !_3179;
    int _3349 = _3347 ? _3129 : (-1);
    float _3351 = as_type<float>(_3259) * _3335;
    bool _3353 = !_3257;
    int _3355 = _3353 ? 0 : (-1);
    int _3357 = _3341 * as_type<int>(_3199);
    int _3359 = _3357 + _3315;
    float _3361 = float(uint(_3345));
    float _3363 = trunc(_3351);
    float _3365 = precise::max(_3363, 0.0);
    uint _3367 = uint(_3365);
    int _3369 = abs(as_type<int>(_3227));
    int _3371 = ~_2927;
    int _3373 = _3371 + 1;
    int _3375 = _3373 + 1;
    float _3377 = as_type<float>(_3267) * _3361;
    int _3379 = ~_3369;
    int _3381 = _3379 + 1;
    int _3383 = _3381 + 1;
    bool _3385 = _1018 == 0;
    int _3387 = _3375 * as_type<int>(_3247);
    int _3389 = _3387 + _3333;
    int _3391 = abs(_3355);
    float _3393 = trunc(_3377);
    float _3395 = precise::max(_3393, 0.0);
    uint _3397 = uint(_3395);
    int _3399 = _3383 * as_type<int>(_3207);
    int _3401 = _3399 + _3359;
    int _3403 = ~_3053;
    int _3405 = _3403 + 1;
    int _3407 = int(_3281) + int(_3367);
    int _3409 = ~_3391;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = abs(_3137);
    int _3417 = _3405 * _3407;
    int _3419 = _3417 + _3231;
    bool _3421 = !_3169;
    int _3423 = _3421 ? 0 : 1;
    int _3425 = _3413 * as_type<int>(_3255);
    int _3427 = _3425 + _3389;
    int _3429 = ~_3165;
    int _3431 = _3429 + 1;
    int _3433 = int(_3301) + int(_3397);
    bool _3435 = uint(_3419) >= uint(_3053);
    float _3437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3439 = ~_3415;
    int _3441 = _3439 + 1;
    int _3443 = _3441 + 1;
    int _3445 = _3431 * _3433;
    int _3447 = _3445 + _3265;
    int _3449 = abs(_3423);
    bool _3451 = !_3435;
    int _3453 = _3451 ? 0 : (-1);
    int _3455 = _3401 * _3443;
    int _3457 = ~_3449;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    int _3463 = _1018 * _2917;
    int _3465 = _3463 + _1829;
    int _3467 = ~_3407;
    int _3469 = _3467 + _3453;
    int _3471 = _3469 + 1;
    int _3473 = _3349 * _3415;
    int _3475 = _3473 + _3455;
    bool _3477 = uint(_3447) >= uint(_3165);
    int _3479 = _3427 * _3461;
    bool _3481 = !_3385;
    int _3483 = _3481 ? _3465 : (-1);
    int _3485 = _3053 * _3471;
    int _3487 = _3485 + _3231;
    int _3489 = _3231 ^ _3053;
    float _3491 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3493 = log2(_3491);
    bool _3495 = _3053 == 0;
    int _3497 = _3483 * _3449;
    int _3499 = _3497 + _3479;
    bool _3501 = !_3477;
    int _3503 = _3501 ? 0 : (-1);
    float _3505 = _2803 * _2895;
    uint _3507 = uint(int(uint(_3489) >> uint(31)));
    bool _3509 = !_3495;
    int _3511 = _3509 ? _3487 : (-1);
    int _3513 = ~_3503;
    int _3515 = _3433 + _3513;
    int _3517 = _3515 + 1;
    float _3519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3521 = ~int(_3507);
    int _3523 = _3521 + 1;
    float _3525 = _3437 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3527 = float(_3511);
    float _3529 = -_138;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2989);
    int _3533 = _3517 ^ _3523;
    float _3535 = fma(_3525, _1913, -0.5);
    bool _3537 = _3053 == 0;
    float _3539 = fma(_3525, _3527, _3531);
    int _3541 = ~_3523;
    int _3543 = _3541 + _3533;
    int _3545 = _3543 + 1;
    float _3547 = _3493 * _138;
    bool _3549 = !_3537;
    int _3551 = _3549 ? _3545 : (-1);
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3555 = _3519 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3557 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3559 = float(_3551);
    float _3561 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3553);
    float _3563 = exp2(_3547);
    float _3565 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3557);
    float _3567 = fma(_3555, _2163, -0.5);
    float _3569 = -_3059;
    float _3571 = fma(_3555, _3559, _3569);
    float _3573 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3561);
    float _3575 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3565);
    float _3577 = float(_3475);
    float _3579 = fma(_3573, _3535, _3539);
    float _3581 = fma(_3575, _3567, _3571);
    out.m_83.x = _3577;
    float _3583 = _3579 + 0.5;
    float _3585 = _3581 + 0.5;
    bool _3587 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3589 = isnan(1.0);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3595 = _3591 || _3593;
    float _3597 = in.m_85.x;
    float _3599 = in.m_85.y;
    float _3601 = in.m_85.z;
    float _3603 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3605 = 1.0 + _3603;
    float _3607 = float(_3499);
    float _3609 = -_3563;
    float _3611 = _3609 + 1.0;
    float _3613 = 1.0 / _3605;
    bool _3615 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3617 = isnan(0.0);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3623 = _3619 || _3621;
    out.m_83.w = _3607;
    bool _3625 = !_2525;
    int _3627 = _3625 ? 0 : 1;
    float _3629 = fma(_2919, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3631 = _3623 ? _3611 : 0.0;
    out.m_87.x = _3583;
    out.m_87.y = _3585;
    bool _3633 = !_2521;
    float _3635 = _3633 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3637 = _3635;
    float _3639 = _3227;
    float _3641 = as_type<float>(_3049);
    float _3643 = as_type<float>(_3309);
    float _3645 = as_type<float>(_3311);
    if (_2821)
    {
        return out;
    }
    float _3647 = -_2945;
    float _3649 = fma(_3647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2359);
    float _3651 = -_2949;
    float _3653 = fma(_3651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2739);
    float _3655 = -_3505;
    float _3657 = fma(_3655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2749);
    float _3659 = _3097 * (-2.0);
    float _3661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3663 = _3649 + _3661;
    float _3665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3667 = _3653 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3671 = _3657 + _3669;
    int _3673 = abs(as_type<int>(_3635));
    float _3675 = _3663 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3677 = _1145 + (-0.5);
    float _3679 = float(_2447);
    float _3681 = _3663;
    float _3683 = _3653;
    if (_3595)
    {
        float _3685 = _3631 * _3613;
        _148 = _3685;
    }
    float _3687 = _148;
    float _3689 = fma(_3667, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3675);
    float _3691 = fma(_3659, _3597, _3597);
    float _3693 = float(_3673);
    float _3695 = fma(_3629, _3659, _3629);
    float _3697 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3689);
    float _3699 = fma(_3677, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3691);
    float _3701 = -_3505;
    float _3703 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2803);
    float _3705 = _3693 * _3679;
    float _3707 = _1048 + (-0.5);
    bool _3709 = _3697 >= 0.0;
    float _3711 = fma(_3695, _3687, _3699);
    float _3713 = _3705 * (-2.0);
    float _3715 = fma(_3703, _3703, _2991);
    float _3717 = _3711 * 0.15915493667125701904296875;
    float _3719 = fma(_3713, _3599, _3599);
    int _3721 = abs(_3627);
    float _3723 = fma(_2577, _3713, _2577);
    float _3725 = sqrt(_3715);
    float _3727 = fma(_3707, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3719);
    float _3729 = _3723;
    if (_3709)
    {
        _3637 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3731 = _3637;
    int _3733 = as_type<int>(_3731);
    if (_3709)
    {
        out.m_57.x = 0.0;
    }
    float _3735 = float(_2573);
    float _3737 = fma(_3723, _3687, _3727);
    float _3739 = _3717 * 6.283185482025146484375;
    float _3741 = sin(_3739);
    if (_3709)
    {
        float _3743 = _3731 * 5.0;
        _3733 = as_type<int>(_3743);
    }
    int _3745 = _3733;
    float _3747 = float(_3721);
    if (_3709)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10870 = as_type<float>(_3745);
        out.gl_Position.z = _10870;
    }
    float _3749 = _3747 * _3735;
    float _3751 = _3717 * 6.283185482025146484375;
    float _3753 = cos(_3751);
    if (_3709)
    {
        return out;
    }
    float _3755 = -_2359;
    float _3757 = _3755 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3759 = -_2739;
    float _3761 = _3759 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3763 = -_2749;
    float _3765 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3767 = _1145 + _1939;
    float _3769 = _3757 * _3757;
    float _3771 = _1939 + (-0.5);
    float _3773 = _3737 * 0.15915493667125701904296875;
    float _3775 = _3767 + (-1.0);
    float _3777 = fma(_3761, _3761, _3769);
    float _3779 = _3749 * (-2.0);
    float _3781 = _3773 * 6.283185482025146484375;
    float _3783 = sin(_3781);
    float _3785 = fma(_3775, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3787 = fma(_3765, _3765, _3777);
    float _3789 = fma(_3779, _3601, _3601);
    float _3791 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3793 = fma(_3785, _3779, _3785);
    float _3795 = _2895 * _3725;
    float _3797 = fma(_3771, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3789);
    float _3799 = rsqrt(_3787);
    float _3801 = _3795 * _3791;
    float _3803 = fma(_3793, _3687, _3797);
    float _3805 = _3803 * 0.15915493667125701904296875;
    float _3807 = _3773 * 6.283185482025146484375;
    float _3809 = cos(_3807);
    float _3811 = in.m_89.x;
    float _3813 = in.m_89.y;
    float _3815 = in.m_89.z;
    float _3817 = _3753 * _3783;
    float _3819 = _3761 * _3799;
    float _3821 = _3757 * _3799;
    float _3823 = _3765 * _3799;
    float _3825 = _3805 * 6.283185482025146484375;
    float _3827 = sin(_3825);
    float _3829 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3831 = _3819 * _3829;
    float _3833 = _3741 * _3783;
    float _3835 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3837 = _3823 * _3835;
    float _3839 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3841 = -_3831;
    float _3843 = fma(_3823, _3839, _3841);
    float _3845 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3847 = _3821 * _3845;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3851 = -_3837;
    float _3853 = fma(_3821, _3849, _3851);
    float _3855 = _3805 * 6.283185482025146484375;
    float _3857 = cos(_3855);
    float _3859 = _3843 * _3843;
    float _3861 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3863 = -_3847;
    float _3865 = fma(_3819, _3861, _3863);
    float _3867 = _3753 * _3809;
    float _3869 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3871 = fma(_3853, _3853, _3859);
    float _3873 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3875 = _3741 * _3809;
    float _3877 = fma(_3827, _3867, _3833);
    float _3879 = fma(_3865, _3865, _3871);
    float _3881 = fma(_3827, _3833, _3867);
    float _3883 = _3795 * _3873;
    float _3885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3813);
    float _3887 = rsqrt(_3879);
    float _3889 = _3885 * _3883;
    float _3891 = _3795 * _3869;
    float _3893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3815);
    float _3895 = _3753 * _3857;
    float _3897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3811);
    float _3899 = _3741 * _3857;
    float _3901 = _3893 * _3801;
    float _3903 = _3895 * _3889;
    float _3905 = _3897 * _3891;
    float _3907 = -_3817;
    float _3909 = fma(_3827, _3875, _3907);
    float _3911 = -_3875;
    float _3913 = fma(_3827, _3817, _3911);
    float _3915 = -_3889;
    float _3917 = _3827 * _3915;
    float _3919 = _3809 * _3857;
    float _3921 = fma(_3877, _3905, _3903);
    float _3923 = _3783 * _3857;
    float _3925 = _3853 * _3887;
    float _3927 = _3843 * _3887;
    float _3929 = _3865 * _3887;
    float _3931 = _3899 * _3889;
    float _3933 = _3821 * _3925;
    float _3935 = _3823 * _3927;
    float _3937 = fma(_3919, _3905, _3917);
    float _3939 = fma(_3913, _3901, _3921);
    float _3941 = -_3933;
    float _3943 = fma(_3819, _3927, _3941);
    float _3945 = -_3935;
    float _3947 = fma(_3821, _3929, _3945);
    float _3949 = fma(_3909, _3905, _3931);
    float _3951 = fma(_3923, _3901, _3937);
    float _3953 = _3943 * _3939;
    float _3955 = _3947 * _3939;
    float _3957 = fma(_3881, _3901, _3949);
    float _3959 = _3819 * _3929;
    float _3961 = fma(_3929, _3951, _3953);
    float _3963 = fma(_3925, _3951, _3955);
    float _3965 = -_3959;
    float _3967 = fma(_3823, _3925, _3965);
    float _3969 = fma(_3823, _3957, _3961);
    float _3971 = fma(_3819, _3957, _3963);
    float _3973 = _3967 * _3939;
    float _3975 = _2749 + _3969;
    float _3977 = _2739 + _3971;
    float _3979 = fma(_3927, _3951, _3973);
    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3983 = _3975 + _3981;
    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3987 = _3977 + _3985;
    float _3989 = fma(_3821, _3957, _3979);
    float _3991 = _3983 * _3983;
    float _3993 = _3987 * _3987;
    float _3995 = _2359 + _3989;
    float _3997 = _3993 + _3991;
    float _3999 = sqrt(_3997);
    bool _4001 = _3999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = _3977;
    float _4005 = _3975;
    float _4007 = _3993;
    float _4009 = _3991;
    if (!_4001)
    {
        _3639 = _3995;
    }
    float _4011 = _3639;
    bool _4013 = !_4001;
    float _4015 = _4011;
    if (!_4013)
    {
        float _4017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4021 = _3999 + _4019;
        float _4023 = rsqrt(_3997);
        float _4025 = _4021 * _4017;
        float _4027 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4029 = _4025 * 0.15915493667125701904296875;
        float _4031 = _4029 * 6.283185482025146484375;
        float _4033 = sin(_4031);
        float _4035 = _4029 * 6.283185482025146484375;
        float _4037 = cos(_4035);
        float _4039 = fma(_4033, _4027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4041 = _4023 * _4039;
        float _4043 = _4037 + (-1.0);
        float _4045 = fma(_3987, _4041, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4047 = fma(_3983, _4041, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4049 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4053 = _4045 + _4051;
        float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4057 = _4047 + _4055;
        float _4059 = fma(_3995, _4037, _4049);
        float _4061 = _4053 * _4053;
        float _4063 = _4057 * _4057;
        _4003 = _4045;
        _4005 = _4047;
        _4015 = _4059;
        _4007 = _4061;
        _4009 = _4063;
    }
    float _4065 = _4003;
    float _4067 = _4005;
    float _4069 = _4015;
    float _4071 = _4007;
    float _4073 = _4009;
    float _4075 = fma(_4065, 6.2500002968590706586837768554688e-05, 0.5);
    float _4077 = fma(_4067, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11377 = float2(_4075, _4077);
    float3 _4081 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11377, float2(0.0), isnan(_11377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11377, float2(0.0), isnan(_11377)), level(0.0)).xyz;
    float _4083 = _4081.x;
    float _4085 = _4081.y;
    float _4087 = _4081.z;
    float _4089 = in.m_91.x;
    float _4091 = in.m_91.y;
    float _4093 = in.m_91.z;
    bool _4095 = _3813 != 0.0;
    bool _4097 = isnan(_3813);
    bool _4099 = _4095 || _4097;
    bool _4101 = isnan(0.0);
    bool _4103 = _4099 || _4101;
    float _4105 = _3895 * _3947;
    float _4107 = _3895 * _3967;
    float _4109 = in.m_93.x;
    float _4111 = in.m_93.y;
    float _4113 = in.m_93.z;
    float _4115 = in.m_93.w;
    bool _4117 = _3811 == 0.0;
    bool _4119 = !_4103;
    bool _4121 = _4117 && _4119;
    float _4123 = _3877 * _3943;
    float _4125 = _3895 * _3943;
    float _4127 = _3913 * _3943;
    bool _4129 = _3815 == 0.0;
    bool _4131 = _4129 && _4121;
    float _4133 = -_3827;
    float _4135 = fma(_4133, _3925, _4105);
    float _4137 = -_3827;
    float _4139 = fma(_4137, _3927, _4107);
    float _4141 = -_3827;
    float _4143 = fma(_4141, _3929, _4125);
    float _4145 = fma(_3923, _3929, _4127);
    float _4147 = fma(_3881, _3823, _4145);
    float _4149 = _4089;
    if (_4131)
    {
        _3641 = _4089;
    }
    float _4151 = _3641;
    float _4153 = _4151;
    if (_4131)
    {
        _2889 = _4093;
    }
    float _4155 = _2889;
    float _4157 = _4155;
    if (_4131)
    {
        _3643 = _4091;
    }
    float _4159 = _3643;
    float _4161 = _4159;
    if (_4131)
    {
        _3729 = _4151;
    }
    float _4163 = _3729;
    float _4165 = _4163;
    if (!_4131)
    {
        _4153 = _4089;
    }
    float _4167 = _4153;
    if (_4131)
    {
        _3645 = _4155;
    }
    float _4169 = _3645;
    float _4171 = _4169;
    if (!_4131)
    {
        _4157 = _4093;
    }
    float _4173 = _4157;
    if (!_4131)
    {
        float _4175 = fma(_3811, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4167);
        _4165 = _4175;
    }
    float _4177 = _4165;
    if (_4131)
    {
        _4149 = _4159;
    }
    float _4179 = _4149;
    float _4181 = _4113 * _4167;
    float _4183 = _4179;
    if (!_4131)
    {
        _4161 = _4091;
    }
    float _4185 = _4161;
    float _4187 = _4111 * _4173;
    if (!_4131)
    {
        float _4189 = fma(_3815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4173);
        _4171 = _4189;
    }
    float _4191 = _4171;
    float _4193 = -_4181;
    float _4195 = fma(_4109, _4173, _4193);
    float _4197 = _4109 * _4185;
    if (!_4131)
    {
        float _4199 = fma(_3813, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4185);
        _4183 = _4199;
    }
    float _4201 = _4183;
    float _4203 = -_4187;
    float _4205 = fma(_4113, _4185, _4203);
    float _4207 = _3877 * _3947;
    float _4209 = -_4197;
    float _4211 = fma(_4111, _4167, _4209);
    float _4213 = _3913 * _3947;
    float _4215 = _4205 * _4115;
    float _4217 = fma(_3919, _3925, _4207);
    float _4219 = _4211 * _4115;
    float _4221 = _3877 * _3967;
    float _4223 = fma(_3919, _3929, _4123);
    float _4225 = _4195 * _4115;
    float _4227 = fma(_3899, _3819, _4135);
    float _4229 = fma(_3919, _3927, _4221);
    float _4231 = fma(_3923, _3925, _4213);
    float _4233 = fma(_3899, _3821, _4139);
    float _4235 = fma(_3909, _3819, _4217);
    float _4237 = fma(_3909, _3821, _4229);
    float _4239 = fma(_3909, _3823, _4223);
    float _4241 = fma(_3899, _3823, _4143);
    float _4243 = fma(_3881, _3819, _4231);
    float _4245 = _4227 * _4111;
    float _4247 = _4233 * _4111;
    float _4249 = _4227 * _4201;
    float _4251 = _4233 * _4201;
    float _4253 = _4225 * _4227;
    float _4255 = _4225 * _4233;
    float _4257 = _4241 * _4111;
    float _4259 = _4241 * _4201;
    float _4261 = _4225 * _4241;
    float _4263 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4265 = _4069 + _4263;
    float _4267 = _3913 * _3967;
    float _4269 = fma(_4237, _4109, _4247);
    float _4271 = fma(_4235, _4177, _4249);
    float _4273 = fma(_4265, _4265, _4071);
    float _4275 = fma(_3923, _3927, _4267);
    float _4277 = fma(_4235, _4109, _4245);
    float _4279 = fma(_4215, _4235, _4253);
    float _4281 = _4273 + _4073;
    float _4283 = fma(_3881, _3821, _4275);
    float _4285 = fma(_4215, _4237, _4255);
    float _4287 = fma(_4239, _4109, _4257);
    float _4289 = fma(_4237, _4177, _4251);
    float _4291 = fma(_4239, _4177, _4259);
    float _4293 = sqrt(_4281);
    float _4295 = fma(_4215, _4239, _4261);
    float _4297 = fma(_4243, _4113, _4277);
    float _4299 = fma(_4283, _4113, _4269);
    float _4301 = fma(_4243, _4191, _4271);
    float _4303 = fma(_4219, _4243, _4279);
    float _4305 = fma(_4219, _4283, _4285);
    float _4307 = fma(_4147, _4113, _4287);
    float _4309 = fma(_4219, _4147, _4295);
    float _4311 = fma(_4283, _4191, _4289);
    float _4313 = fma(_4147, _4191, _4291);
    out.m_95.x = _4297;
    out.m_95.y = _4299;
    out.m_95.z = _4307;
    out.m_97.x = _4303;
    out.m_97.y = _4305;
    out.m_97.z = _4309;
    bool _4315 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4317 = isnan(_4293);
    bool _4319 = _4315 || _4317;
    bool _4321 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4323 = _4319 || _4321;
    out.m_99.x = _4301;
    out.m_99.y = _4311;
    out.m_99.z = _4313;
    float _4325 = _4237;
    if (!_4323)
    {
        _4325 = 1.0;
    }
    float _4327 = _4325;
    out.m_101.x = _4083;
    out.m_101.y = _4085;
    out.m_101.z = _4087;
    bool _4329 = !_4323;
    float _4331 = _4327;
    if (!_4329)
    {
        bool _4333 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4335 = isnan(_4293);
        bool _4337 = _4333 || _4335;
        bool _4339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4341 = _4337 || _4339;
        if (!_4341)
        {
            float _4343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4345 = _4293 + _4343;
            float _4347 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4349 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4347;
            float _4351 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4353 = _4351 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4355 = 1.0 / _4349;
            float _4357 = _4345 * _4355;
            float _4359 = fma(_4357, _4353, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4331 = _4359;
            _4361 = true;
        }
        else
        {
            bool _4363 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4365 = isnan(_4293);
            bool _4367 = _4363 || _4365;
            bool _4369 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4371 = _4367 || _4369;
            if (!_4371)
            {
                float _4373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4375 = _4293 + _4373;
                float _4377 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4379 = _4377 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4381 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4383 = _4381 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4385 = 1.0 / _4379;
                float _4387 = _4375 * _4385;
                float _4389 = fma(_4387, _4383, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4331 = _4389;
                _4361 = true;
            }
            else
            {
                _4331 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4361 = false;
    float _4391 = _4331;
    float _4393 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4395 = _4069 + _4393;
    float _4397 = _3649 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4399 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4401 = _4065 + _4399;
    float _4403 = fma(_4395, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4405 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4397);
    float _4407 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4409 = _4067 + _4407;
    float _4411 = fma(_4401, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4413 = -_2359;
    float _4415 = _4413 + _4403;
    float _4417 = fma(_3657, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4405);
    float _4419 = fma(_4409, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4421 = -_2739;
    float _4423 = _4421 + _4411;
    float _4425 = _4415 * _4415;
    float _4427 = _4417 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4429 = _3649 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4431 = -_2749;
    float _4433 = _4431 + _4419;
    float _4435 = fma(_4423, _4423, _4425);
    float _4437 = 1.0 / _4427;
    float _4439 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4429);
    float _4441 = fma(_4433, _4433, _4435);
    float _4443 = fma(_3657, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4439);
    float _4445 = sqrt(_4441);
    float _4447 = _4443 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4449 = _4447 + _4427;
    float _4451 = _4449 * _4437;
    float _4453 = _4451 * 0.5;
    float _4455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4457 = fma(_4453, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4455);
    bool _4459 = _4445 > 0.0;
    float _4461 = 1.0 / _4457;
    bool _4463 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4467 = _4463 || _4465;
    bool _4469 = isnan(0.5);
    bool _4471 = _4467 || _4469;
    bool _4473 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4475 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan(0.5);
    bool _4481 = _4477 || _4479;
    float _4483 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4485 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4487 = _4411;
    float _4489 = _4403;
    if (!_4459)
    {
        _4483 = _4403;
    }
    float _4491 = _4483;
    float _4493 = _4491;
    if (!_4459)
    {
        _4485 = _4419;
    }
    float _4495 = _4485;
    bool _4497 = !_4459;
    float _4499 = _4495;
    if (!_4497)
    {
        float _4501 = _230 * _230;
        float _4503 = fma(_226, _226, _4501);
        float _4505 = fma(_232, _232, _4503);
        float _4507 = rsqrt(_4441);
        float _4509 = sqrt(_4505);
        float _4511 = _4423 * _4507;
        float _4513 = _4415 * _4507;
        float _4515 = _4433 * _4507;
        bool _4517 = _4509 > 0.0;
        float _4519 = _4509;
        float _4521 = _4507;
        if (!_4517)
        {
            _4519 = _4403;
        }
        float _4523 = _4519;
        _4493 = _4523;
        if (!_4517)
        {
            _4521 = _4419;
        }
        float _4525 = _4521;
        bool _4527 = !_4517;
        _4499 = _4525;
        if (!_4527)
        {
            float _4529 = rsqrt(_4505);
            float _4531 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4533 = _230 * _4529;
            float _4535 = _226 * _4529;
            float _4537 = _232 * _4529;
            float _4539 = _4513 * _4533;
            float _4541 = fma(_4511, _4535, _4539);
            float _4543 = _4531 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4545 = fma(_4515, _4537, _4541);
            float _4547 = _4545 * _4543;
            float _4549 = fma(_226, _4547, _4411);
            float _4551 = fma(_230, _4547, _4403);
            float _4553 = fma(_232, _4547, _4419);
            _4487 = _4549;
            _4493 = _4551;
            _4499 = _4553;
        }
    }
    float _4555 = _4487;
    float _4557 = _4493;
    float _4559 = _4499;
    float _4561 = -_2949;
    float _4563 = fma(_4561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4555);
    float _4565 = -_2945;
    float _4567 = fma(_4565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4557);
    float _4569 = -_3505;
    float _4571 = fma(_4569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4559);
    float _4573 = _4567;
    float _4575 = _4563;
    float _4577 = _4571;
    if (_4471)
    {
        _4489 = 1.0;
    }
    float _4579 = _4489;
    float _4581 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4583 = _4461 * _4581;
    float _4585 = _4579;
    if (!_4481)
    {
        float _4587 = _3663 * _3663;
        float _4589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4591 = -_2749;
        float _4593 = _4591 + _4559;
        float _4595 = -_2359;
        float _4597 = _4595 + _4557;
        float _4599 = fma(_3667, _3667, _4587);
        float _4601 = -_2739;
        float _4603 = _4601 + _4555;
        float _4605 = fma(_3671, _3671, _4599);
        float _4607 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4609 = sqrt(_4605);
        float _4611 = 1.0 / _3795;
        float _4613 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4615 = precise::min(_4609, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4617 = _4615 * _4589;
        float _4619 = _4617 * _4611;
        float _4621 = _4613 * _4619;
        float _4623 = _4593 * _4619;
        float _4625 = fma(_4597, _4621, _3649);
        float _4627 = fma(_4603, _4621, _3653);
        float _4629 = fma(_4613, _4623, _3657);
        _4573 = _4625;
        _4575 = _4627;
        _4577 = _4629;
        _3681 = _4609;
    }
    float _4631 = _4573;
    float _4633 = _4575;
    float _4635 = _4577;
    float _4637 = _3681;
    float _4639 = _4637;
    if (!_4471)
    {
        float _4641 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4643 = _4641 * 0.15915493667125701904296875;
        float _4645 = _4643 * 6.283185482025146484375;
        float _4647 = cos(_4645);
        float _4649 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4651 = _4649 * 0.15915493667125701904296875;
        float _4653 = _4643 * 6.283185482025146484375;
        float _4655 = sin(_4653);
        float _4657 = 1.0 / _4647;
        float _4659 = _4651 * 6.283185482025146484375;
        float _4661 = cos(_4659);
        float _4663 = _4655 * _4657;
        float _4665 = _4651 * 6.283185482025146484375;
        float _4667 = sin(_4665);
        float _4669 = _4661 * _4663;
        float _4671 = 1.0 / _4669;
        float _4673 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4675 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4673;
        float _4677 = 1.0 / _4675;
        float _4679 = _4667 * _4671;
        float _4681 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4683 = fma(_4583, _4679, _4681);
        float _4685 = _4683 * _4677;
        float _4687 = precise::clamp(_4685, 0.0, 1.0);
        _4639 = _4683;
        _4585 = _4687;
    }
    float _4689 = _4639;
    float _4691 = _4585;
    float _4693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4695 = _4631 + _4693;
    float _4697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4699 = _4633 + _4697;
    float _4701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4703 = _4635 + _4701;
    float _4705 = _4695 * _4695;
    float _4707 = fma(_4699, _4699, _4705);
    float _4709 = fma(_4703, _4703, _4707);
    float _4711 = rsqrt(_4709);
    float _4713 = sqrt(_4709);
    float _4715 = _4711 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4717 = _4699 * _4715;
    float _4719 = _4703 * _4715;
    float _4721 = _4717 * _4717;
    float _4723 = _4719 * _4719;
    float _4725 = _4721 + _4723;
    float _4727 = sqrt(_4725);
    bool _4729 = _4727 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4733 = _4727 + _4731;
    float _4735 = _4711;
    float _4737 = _4733;
    float _4739 = _4695;
    if (_4729)
    {
        float _4741 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4735 = _4741;
    }
    float _4743 = _4735;
    float _4745 = _4743;
    if (_4729)
    {
        float _4747 = _4733 * _4743;
        _4737 = _4747;
    }
    float _4749 = _4737;
    if (_4729)
    {
        float _4751 = rsqrt(_4725);
        _4745 = _4751;
    }
    float _4753 = _4745;
    float _4755 = _4753;
    if (_4729)
    {
        float _4757 = _4749 * 0.15915493667125701904296875;
        _2853 = _4757;
    }
    float _4759 = _2853;
    float _4761 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4763 = _4703;
    float _4765 = _4759;
    if (_4729)
    {
        float _4767 = _4759 * 6.283185482025146484375;
        float _4769 = sin(_4767);
        _4763 = _4769;
    }
    float _4771 = _4763;
    float _4773 = precise::max(0.0, _4761);
    float _4775 = _4689;
    if (_4729)
    {
        float _4777 = _4759 * 6.283185482025146484375;
        float _4779 = cos(_4777);
        _4775 = _4779;
    }
    float _4781 = _4775;
    float _4783 = -_4715;
    float _4785 = -_4773;
    float _4787 = fma(_4695, _4783, _4785);
    float _4789 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4729)
    {
        float _4791 = _4787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4739 = _4791;
    }
    float _4793 = _4739;
    float _4795 = fma(_3653, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4797 = _4771;
    float _4799 = _4793;
    if (_4729)
    {
        float _4801 = fma(_4771, _4793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4797 = _4801;
    }
    float _4803 = _4797;
    float _4805 = _4803;
    if (!_4729)
    {
        _4799 = _4787;
    }
    float _4807 = _4799;
    float _4809 = floor(_4795);
    float _4811 = _4807;
    if (_4729)
    {
        float _4813 = _4753 * _4803;
        _3683 = _4813;
    }
    float _4815 = _3683;
    if (!_4729)
    {
        _4755 = _4717;
    }
    float _4817 = _4755;
    float _4819 = _4817;
    float _4821 = _4781;
    if (_4729)
    {
        float _4823 = _4781 + (-1.0);
        _4789 = _4823;
    }
    float _4825 = _4789;
    float _4827 = _4825;
    if (_4729)
    {
        float _4829 = _4717 * _4815;
        _4819 = _4829;
    }
    float _4831 = _4819;
    if (!_4729)
    {
        _4805 = _4721;
    }
    float _4833 = _4805;
    float _4835 = _4833;
    if (_4729)
    {
        float _4837 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4765 = _4837;
    }
    float _4839 = _4765;
    if (!_4729)
    {
        _4827 = _4719;
    }
    float _4841 = _4827;
    float _4843 = _4841;
    if (_4729)
    {
        float _4845 = _4719 * _4815;
        _4843 = _4845;
    }
    float _4847 = _4843;
    if (_4729)
    {
        float _4849 = _4831 * _4831;
        _4835 = _4849;
    }
    float _4851 = _4835;
    if (_4729)
    {
        float _4853 = fma(_4787, _4781, _4839);
        _4811 = _4853;
    }
    float _4855 = _4811;
    if (!_4729)
    {
        _4821 = _4723;
    }
    float _4857 = _4821;
    float _4859 = _4857;
    if (_4729)
    {
        float _4861 = _4847 * _4847;
        _4859 = _4861;
    }
    float _4863 = _4859;
    float _4865 = fma(_4855, _4855, _4851);
    float _4867 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4869 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4871 = _4865 + _4863;
    float _4873 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4867);
    float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4877 = fma(_4713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4875);
    float _4879 = precise::clamp(_4877, 0.0, 1.0);
    float _4881 = rsqrt(_4871);
    float _4883 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4873);
    float _4885 = -_4879;
    float _4887 = _4885 + 1.0;
    float _4889 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4891 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4893 = _4883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4895 = -_4809;
    float _4897 = _4795 + _4895;
    float _4899 = abs(_4887);
    float _4901 = log2(_4899);
    float _4903 = _4893 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4905 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4907 = -_4903;
    float _4909 = fma(_4907, _4891, 1.0);
    float _4911 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4913 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4905);
    float _4915 = _4881 * _4831;
    float _4917 = _4881 * _4855;
    float _4919 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4911);
    float _4921 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4913);
    float _4923 = _4881 * _4847;
    float _4925 = _4915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4927 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4919);
    float _4929 = _4921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4931 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4869);
    float _4933 = -_4925;
    float _4935 = fma(_4917, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4933);
    float _4937 = _4927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4939 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4941 = floor(_4889);
    float _4943 = -_4923;
    float _4945 = fma(_4943, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4935);
    float _4947 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4931);
    float _4949 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4939);
    float _4951 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4953 = fma(_4945, -0.5, 0.5);
    float _4955 = _4947 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4957 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4949);
    float _4959 = exp2(_4951);
    float _4961 = fma(_4945, 0.5, 0.5);
    float _4963 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4957);
    float _4965 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4967 = log2(_4909);
    float _4969 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4971 = -_4941;
    float _4973 = _4889 + _4971;
    float _4975 = fma(_4961, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4977 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4965);
    float _4979 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4969);
    float _4981 = _4917 + 1.0;
    float _4983 = fma(_4961, _4975, -0.212114393711090087890625);
    float _4985 = 1.0 / _4963;
    float _4987 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4977);
    float _4989 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4979);
    float _4991 = -_4917;
    float _4993 = fma(_4959, _4981, _4991);
    float _4995 = fma(_4961, _4983, 1.570728778839111328125);
    float _4997 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4987);
    float _4999 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4989);
    float _5001 = sqrt(_4953);
    float _5003 = _4967 * 0.693147182464599609375;
    float _5005 = _5003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5007 = _4997 * _4985;
    float _5009 = _4999 * _4985;
    float2 _12927 = float2(_4897, _4973);
    float _5011 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12927, float2(0.0), isnan(_12927)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12927, float2(0.0), isnan(_12927)), level(0.0)).x;
    float _5013 = fma(_5007, 0.5, 0.5);
    float _5015 = fma(_5009, -0.5, 0.5);
    float _5017 = _5001 * 0.636619746685028076171875;
    float3 _12943 = float3(_5013, _5015, _5005);
    float _5019 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12943, float3(0.0), isnan(_12943)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12943, float3(0.0), isnan(_12943)), level(0.0)).x;
    float3 _12954 = float3(_5013, _5015, _5005);
    float4 _5022 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12954, float3(0.0), isnan(_12954)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12954, float3(0.0), isnan(_12954)), level(0.0)).xyzw;
    float _5024 = _5022.x;
    float _5026 = _5022.y;
    float _5028 = _5022.z;
    float _5030 = _5022.w;
    float _5032 = -_4995;
    float _5034 = fma(_5017, _5032, 1.0);
    float _5036 = fma(_4993, 0.5, 0.5);
    float2 _12977 = float2(_5034, _5036);
    float3 _5038 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12977, float2(0.0), isnan(_12977)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12977, float2(0.0), isnan(_12977)), level(0.0)).xyz;
    float _5040 = _5038.x;
    float _5042 = _5038.y;
    float _5044 = _5038.z;
    float _5046 = abs(_4583);
    float _5048 = log2(_5046);
    float _5050 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5052 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _5054 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5056 = isnan(_4713);
    bool _5058 = _5054 || _5056;
    bool _5060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5062 = _5058 || _5060;
    float _5064 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5050);
    float _5066 = _4963 * 0.5;
    bool _5068 = _4583 <= 8000.0;
    bool _5070 = isnan(_4583);
    bool _5072 = _5068 || _5070;
    bool _5074 = isnan(8000.0);
    bool _5076 = _5072 || _5074;
    float _5078 = float(_5076);
    float _5080 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5064);
    float _5082 = exp2(_5052);
    float _5084 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5080);
    float _5086 = _4997 + _4963;
    float _5088 = _5048 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5090 = in.m_103.x;
    out.gl_Position.x = _4997;
    out.gl_Position.y = _4999;
    out.gl_Position.z = _5084;
    out.gl_Position.w = _4963;
    float _5092 = exp2(_5088);
    float _5094 = -_5082;
    float _5096 = _5094 + 1.0;
    float _5098 = _5086 * 0.5;
    float _5100 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5102 = -_5100;
    float _5104 = _5102 + 1.0;
    float _5106 = fma(_5092, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5108 = precise::clamp(_5106, 0.0, 1.0);
    float _5110 = fma(_4999, -0.5, _5066);
    float _5112 = fma(_5108, -2.0, 3.0);
    float _5114 = _5108 * _5108;
    float _5116 = _4999;
    float _5118 = _4963;
    float _5120 = _5084;
    float _5122 = _5104;
    if (!_5062)
    {
        _5116 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5124 = _5116;
    float _5126 = _5114 * _5112;
    float _5128 = -_5126;
    float _5130 = _5128 + 1.0;
    float _5132 = fma(_5130, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5126);
    float _5134 = _5084 + _4963;
    float _5136 = _5124;
    float _5138 = _5124;
    if (!_5062)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5140 = _5118;
    float _5142 = _5078 * _5132;
    float _5144 = _5134 * 0.5;
    float _5146 = _5140;
    float _5148 = _5140;
    if (!_5062)
    {
        _5120 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5150 = _5120;
    float _5152 = _5142 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_105.x = _5098;
    out.m_105.y = _5110;
    out.m_105.z = _5144;
    out.m_105.w = _4963;
    float _5154 = -_5011;
    float _5156 = _5154 + 1.0;
    float _5158 = _5156 * _5152;
    float _5160 = precise::clamp(_5158, 0.0, 1.0);
    float _5162 = _5100 * _5019;
    float _5164 = -_5160;
    float _5166 = fma(_5164, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5168 = _5030 * _5162;
    float _5170 = _5166 * _5090;
    float _5172 = _5044 * _5162;
    float _5174 = fma(_5040, _5168, _5024);
    float _5176 = fma(_5042, _5168, _5026);
    float _5178 = _5170 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5180 = _5030 * _5104;
    float _5182 = fma(_5030, _5172, _5028);
    float _5184 = _4691 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5186 = _5168;
    float _5188 = _5170;
    float _5190 = _5150;
    float _5192 = _5150;
    if (!_5062)
    {
        _5186 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5194 = _5186;
    out.m_107.x = _5178;
    float _5196 = _5194;
    float _5198 = _5194;
    if (!_5062)
    {
        _5122 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5200 = _5122;
    float _5202 = _5200;
    float _5204 = _5200;
    if (!_5062)
    {
        _5188 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5206 = _5188;
    out.m_109.x = _5174;
    out.m_109.y = _5176;
    out.m_109.z = _5182;
    out.m_109.w = _5180;
    bool _5208 = !_5062;
    float _5210 = _5206;
    float _5212 = _5206;
    if (!_5208)
    {
        bool _5214 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5216 = isnan(_4713);
        bool _5218 = _5214 || _5216;
        bool _5220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5222 = _5218 || _5220;
        if (!_5222)
        {
            float _5224 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5226 = _4713 + _5224;
            float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5230 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5228;
            float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5234 = _5232 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5236 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5238 = _5236 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5240 = 1.0 / _5230;
            float _5242 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5244 = _5242 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5246 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5248 = _5246 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5250 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5252 = _5250 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5254 = _5226 * _5240;
            float _5256 = precise::clamp(_5254, 0.0, 1.0);
            float _5258 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5260 = _5258 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5262 = fma(_5256, _5234, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5264 = fma(_5256, _5238, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5266 = fma(_5256, _5260, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5268 = fma(_5256, _5244, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5270 = fma(_5256, _5248, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5272 = fma(_5256, _5252, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5204 = _5262;
            _5148 = _5270;
            _5138 = _5264;
            _5198 = _5268;
            _5212 = _5266;
            _5192 = _5272;
            _5274 = true;
        }
        else
        {
            bool _5276 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5278 = isnan(_4713);
            bool _5280 = _5276 || _5278;
            bool _5282 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5284 = _5280 || _5282;
            if (!_5284)
            {
                _5196 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5286 = _5196;
            _5198 = _5286;
            if (!_5284)
            {
                _5146 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5288 = _5146;
            _5148 = _5288;
            if (!_5284)
            {
                _5190 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5290 = _5190;
            _5192 = _5290;
            if (!_5284)
            {
                _5136 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5292 = _5136;
            _5138 = _5292;
            if (!_5284)
            {
                _5202 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5294 = _5202;
            _5204 = _5294;
            if (!_5284)
            {
                _5210 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5296 = _5210;
            bool _5298 = !_5284;
            _5212 = _5296;
            if (!_5298)
            {
                bool _5300 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5302 = isnan(_4713);
                bool _5304 = _5300 || _5302;
                bool _5306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5308 = _5304 || _5306;
                if (!_5308)
                {
                    float _5310 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5312 = _4713 + _5310;
                    float _5314 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5316 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5314;
                    float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5320 = _5318 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5324 = _5322 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5326 = 1.0 / _5316;
                    float _5328 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5330 = _5328 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5332 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5334 = _5332 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5336 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5338 = _5336 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5340 = _5312 * _5326;
                    float _5342 = precise::clamp(_5340, 0.0, 1.0);
                    float _5344 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5346 = _5344 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5348 = fma(_5342, _5320, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5350 = fma(_5342, _5324, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5352 = fma(_5342, _5346, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5354 = fma(_5342, _5330, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5356 = fma(_5342, _5334, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5358 = fma(_5342, _5338, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5204 = _5348;
                    _5148 = _5356;
                    _5138 = _5350;
                    _5198 = _5354;
                    _5212 = _5352;
                    _5192 = _5358;
                    _5274 = true;
                }
                else
                {
                    _5204 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5148 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5138 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5198 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5212 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5192 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5274 = false;
    float _5360 = _5204;
    float _5362 = _5148;
    float _5364 = _5138;
    float _5366 = _5198;
    float _5368 = _5212;
    float _5370 = _5192;
    float _5372 = _5184 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5374 = fma(_4311, -0.5, 0.5);
    float _5376 = precise::clamp(_5374, 0.0, 1.0);
    float _5378 = -_5360;
    float _5380 = _5362 + _5378;
    float _5382 = -_5364;
    float _5384 = _5366 + _5382;
    out.m_57.x = _5372;
    float _5386 = -_5368;
    float _5388 = _5370 + _5386;
    float _5390 = fma(_5376, _5380, _5360);
    float _5392 = fma(_5376, _5384, _5364);
    bool _5394 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5396 = _5390 * 0.586610972881317138671875;
    float _5398 = fma(_5376, _5388, _5368);
    out.m_111.x = 0.0;
    bool _5400 = _4691 > 0.0;
    bool _5402 = isnan(_4691);
    bool _5404 = _5400 || _5402;
    bool _5406 = isnan(0.0);
    bool _5408 = _5404 || _5406;
    float _5410 = fma(_5392, 0.298911988735198974609375, _5396);
    float _5412 = fma(_5398, 0.114477999508380889892578125, _5410);
    float _5414 = -_5412;
    float _5416 = _5392 + _5414;
    float _5418 = -_5412;
    float _5420 = _5390 + _5418;
    float _5422 = -_5412;
    float _5424 = _5398 + _5422;
    float _5426 = fma(_5416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    float _5428 = fma(_5420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    float _5430 = fma(_5424, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    bool _5432 = !_5394;
    if (!_5432)
    {
        float _5434 = -_4631;
        float _5436 = _5434 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5438 = -_4633;
        float _5440 = _5438 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5442 = -_4635;
        float _5444 = _5442 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5446 = _5436 * _5436;
        float _5448 = fma(_5440, _5440, _5446);
        float _5450 = fma(_5444, _5444, _5448);
        float _5452 = sqrt(_5450);
        float _5454 = rsqrt(_5450);
        float _5456 = -_5452;
        float _5458 = _5456 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5460 = _5458 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5462 = precise::clamp(_5460, 0.0, 1.0);
        float _5464 = _5440 * _5454;
        float _5466 = _5436 * _5454;
        float _5468 = abs(_5462);
        float _5470 = log2(_5468);
        float _5472 = _5444 * _5454;
        float _5474 = _5464 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5476 = _4311 * _5466;
        float _5478 = -_5466;
        float _5480 = -_5474;
        float _5482 = fma(_5478, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5480);
        float _5484 = fma(_4301, _5464, _5476);
        float _5486 = -_5472;
        float _5488 = fma(_5486, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5482);
        float _5490 = fma(_4313, _5472, _5484);
        float _5492 = precise::clamp(_5490, 0.0, 1.0);
        float _5494 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5496 = _5488 + _5494;
        float _5498 = _5470 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5500 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5502 = precise::clamp(_5500, 0.0, 1.0);
        float _5504 = exp2(_5498);
        float _5506 = _5504 * _5502;
        float _5508 = _5492 * _5506;
        float _5510 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5512 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5514 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _5510;
        out.m_111.y = _5512;
        out.m_111.z = _5514;
    }
    out.m_113.x = _5426;
    out.m_113.y = _5428;
    out.m_113.z = _5430;
    if (_5408)
    {
        return out;
    }
    out.m_57.x = 0.0;
    float _5516 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5516;
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
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    bool _5274 = false;
    bool _4361 = false;
    bool _712 = false;
    bool _526 = false;
    bool _254 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _127 = in.m_50.w;
    float _129 = in.m_52.w;
    float _131 = trunc(_127);
    int _134 = int(_131);
    float _136 = -_129;
    float _138 = _136 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_55.y = _138;
    bool _142 = _134 >= 1;
    float _144 = 0.0;
    float _146 = as_type<float>(_134);
    float _148 = _138;
    if (!_142)
    {
        _144 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _150 = _144;
    if (!_142)
    {
        out.m_57.x = 0.0;
    }
    int _152 = 0;
    if (!_142)
    {
        float _154 = _150 * 5.0;
        _152 = as_type<int>(_154);
    }
    int _156 = _152;
    int _158 = _156;
    if (!_142)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5585 = as_type<float>(_156);
        out.gl_Position.z = _5585;
    }
    if (!_142)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _160 = _129 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _162 = isnan(_129);
    bool _164 = _160 || _162;
    bool _166 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _168 = _164 || _166;
    float _170 = float(_134);
    bool _172 = _138 >= _170;
    bool _174 = !_168;
    bool _176 = _172 || _174;
    float _178 = 1.0 / _170;
    if (_176)
    {
        _146 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _180 = _146;
    if (_176)
    {
        out.m_57.x = 0.0;
    }
    float _182 = _138 * _178;
    float _184 = _182;
    if (_176)
    {
        float _186 = _180 * 5.0;
        _158 = as_type<int>(_186);
    }
    int _188 = _158;
    out.m_55.x = _182;
    if (_176)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5648 = as_type<float>(_188);
        out.gl_Position.z = _5648;
    }
    if (_176)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _190 = in.m_59.x;
    float _192 = in.m_59.y;
    float _194 = in.m_59.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_61.x;
    float _200 = in.m_61.y;
    float _202 = in.m_61.z;
    float _204 = in.m_63.x;
    float _206 = in.m_63.y;
    float _208 = in.m_63.z;
    float _210 = in.m_65.x;
    float _212 = in.m_65.y;
    float _214 = in.m_65.z;
    float _216 = _192 * _200;
    float _218 = _192 * _206;
    float _220 = fma(_190, _198, _216);
    float _222 = _192 * _212;
    float _224 = fma(_190, _204, _218);
    float _226 = fma(_194, _202, _220);
    float _228 = fma(_190, _210, _222);
    float _230 = fma(_194, _208, _224);
    float _232 = fma(_194, _214, _228);
    bool _234 = !_196;
    float _252;
    if (!_234)
    {
        float _236 = in.m_67.x;
        float _238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _240 = _236 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _242 = fma(_240, (*spvDescriptorSet0.vp_c9)._m0[12].x, _138);
        float _244 = _242 * _238;
        float _246 = floor(_244);
        float _248 = -_246;
        float _250 = _244 + _248;
        _252 = _250;
        _254 = true;
    }
    else
    {
        _252 = _182;
    }
    _254 = false;
    float _256 = _252;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _256 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _264 = _256 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _256 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = 1.0 / _276;
    bool _288 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _290 = 1.0 / _272;
    bool _292 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _294 = isnan(_256);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    float _304 = 1.0 / _284;
    float _306 = 1.0 / _280;
    float _308 = _260 * _290;
    bool _310 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_256);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _324 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _322;
    float _326 = _264 * _304;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _330 = _256 + _328;
    bool _332 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _334 = isnan(_256);
    bool _336 = _332 || _334;
    bool _338 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _340 = _336 || _338;
    float _342 = float(_340);
    bool _344 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _346 = isnan(_256);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = _330 * _286;
    float _358 = -_320;
    float _360 = _358 + 1.0;
    float _362 = -_342;
    float _364 = _362 + 1.0;
    float _366 = _268 * _306;
    float _368 = _354 * _360;
    float _370 = -_354;
    float _372 = _370 + 1.0;
    float _374 = _320 * _364;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _380 = _256 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _382 = isnan(_256);
    bool _384 = _380 || _382;
    bool _386 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _388 = _384 || _386;
    float _390 = float(_388);
    float _392 = _302 * _372;
    float _394 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _396 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _394;
    float _398 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _400 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _398;
    float _402 = -_302;
    float _404 = _402 + 1.0;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _408 = _406 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _410 = fma(_396, _366, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _412 = fma(_400, _366, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = _390 * _404;
    float _420 = fma(_324, _366, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _422 = fma(_408, _326, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _424 = fma(_416, _326, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _426 = fma(_378, _326, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _428 = _410 * _418;
    float _430 = _412 * _418;
    float _432 = -_390;
    float _434 = _432 + 1.0;
    float _436 = _420 * _418;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _440 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _438;
    float _442 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].x, _428);
    float _444 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].y, _430);
    float _446 = fma(_434, (*spvDescriptorSet0.vp_c9)._m0[143].z, _436);
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _448;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _452;
    float _456 = fma(_422, _392, _442);
    float _458 = fma(_424, _392, _444);
    float _460 = fma(_426, _392, _446);
    float _462 = fma(_450, _308, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _464 = fma(_440, _308, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _466 = fma(_454, _308, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_462, _368, _456);
    float _482 = fma(_470, _356, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _356, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _356, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_464, _368, _458);
    float _490 = fma(_466, _368, _460);
    float _492 = fma(_482, _374, _480);
    float _494 = fma(_484, _374, _488);
    float _496 = fma(_486, _374, _490);
    float _498 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].x, _492);
    float _500 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].y, _494);
    float _502 = fma(_342, (*spvDescriptorSet0.vp_c9)._m0[147].z, _496);
    bool _504 = !_288;
    float _506 = _308;
    float _524;
    if (!_504)
    {
        float _508 = in.m_67.x;
        float _510 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _512 = _508 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[11].y, _138);
        float _516 = _514 * _510;
        float _518 = floor(_516);
        float _520 = -_518;
        float _522 = _516 + _520;
        _524 = _522;
        _526 = true;
    }
    else
    {
        _524 = _182;
    }
    _526 = false;
    float _528 = _524;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _532 = _528 + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _536 = _534 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _542 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _544 = isnan(_528);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _558 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _560 = isnan(_528);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = 1.0 / _536;
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _572;
    float _576 = -_552;
    float _578 = _576 + 1.0;
    bool _580 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _582 = isnan(_528);
    bool _584 = _580 || _582;
    bool _586 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _588 = _584 || _586;
    float _590 = float(_588);
    bool _592 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _594 = 1.0 / _540;
    float _596 = 1.0 / _556;
    float _598 = _574 * _570;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _604 = _568 * _578;
    float _606 = -_568;
    float _608 = _606 + 1.0;
    float _610 = fma(_598, _532, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _612 = _528 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _614 = isnan(_528);
    bool _616 = _612 || _614;
    bool _618 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _620 = _616 || _618;
    float _622 = float(_620);
    float _624 = _590 * _608;
    float _626 = _602 * _594;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _630 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _628;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _634 = _528 + _632;
    float _636 = _610 * _624;
    float _638 = -_590;
    float _640 = _638 + 1.0;
    float _642 = -_622;
    float _644 = _642 + 1.0;
    float _646 = fma(_626, _634, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _648 = _630 * _596;
    float _650 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _652 = _528 + _650;
    float _654 = fma(_640, (*spvDescriptorSet0.vp_c9)._m0[115].x, _636);
    float _656 = _552 * _644;
    float _658 = fma(_648, _652, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _660 = fma(_646, _604, _654);
    float _662 = fma(_658, _656, _660);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _666 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _668 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[118].x, _662);
    float _670 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _672 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _674 = _666 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _676 = _668 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _678 = _670 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _680 = in.m_69.x;
    float _682 = in.m_69.y;
    float _684 = in.m_69.z;
    out.m_71.x = _672;
    out.m_71.y = _674;
    out.m_71.z = _678;
    out.m_71.w = _676;
    float _686 = _502 * _684;
    float _688 = _500 * _682;
    float _690 = _498 * _680;
    bool _692 = !_592;
    float _710;
    if (!_692)
    {
        float _694 = in.m_67.x;
        float _696 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _698 = _694 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _700 = fma(_698, (*spvDescriptorSet0.vp_c9)._m0[11].w, _138);
        float _702 = _700 * _696;
        float _704 = floor(_702);
        float _706 = -_704;
        float _708 = _702 + _706;
        _710 = _708;
        _712 = true;
    }
    else
    {
        _710 = _182;
    }
    _712 = false;
    float _714 = _710;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _718 = _714 + _716;
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _724 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _726 = isnan(_714);
    bool _728 = _724 || _726;
    bool _730 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _732 = _728 || _730;
    float _734 = float(_732);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _738 = _736 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _742 = _740 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _744 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _746 = isnan(_714);
    bool _748 = _744 || _746;
    bool _750 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _752 = _748 || _750;
    float _754 = float(_752);
    float _756 = 1.0 / _722;
    float _758 = -_734;
    float _760 = _758 + 1.0;
    float _762 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _764 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _762;
    bool _766 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _768 = isnan(_714);
    bool _770 = _766 || _768;
    bool _772 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _774 = _770 || _772;
    float _776 = float(_774);
    float _778 = _754 * _760;
    float _780 = -_754;
    float _782 = _780 + 1.0;
    bool _784 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _786 = 1.0 / _738;
    float _788 = _776 * _782;
    float _790 = -_776;
    float _792 = _790 + 1.0;
    float _794 = 1.0 / _742;
    float _796 = _764 * _756;
    float _798 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _800 = _798 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _802 = fma(_796, _718, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _804 = _714 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _806 = isnan(_714);
    bool _808 = _804 || _806;
    bool _810 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _812 = _808 || _810;
    float _814 = float(_812);
    float _816 = _800 * _786;
    float _818 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _818;
    float _822 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _824 = _714 + _822;
    float _826 = _802 * _788;
    float _828 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _830 = _714 + _828;
    float _832 = fma(_816, _824, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _834 = fma(_792, (*spvDescriptorSet0.vp_c9)._m0[131].x, _826);
    float _836 = _820 * _794;
    float _838 = -_814;
    float _840 = _838 + 1.0;
    float _842 = fma(_832, _778, _834);
    float _844 = fma(_836, _830, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _846 = _734 * _840;
    float _848 = fma(_844, _846, _842);
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _852 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _854 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _856 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[134].x, _848);
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _852 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _862 = _854 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _864 = _856 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_73.x = _858;
    out.m_73.y = _860;
    out.m_73.z = _862;
    out.m_73.w = _864;
    bool _866 = !_784;
    if (!_866)
    {
        float _868 = in.m_67.x;
        float _870 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _872 = _868 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _874 = fma(_872, (*spvDescriptorSet0.vp_c9)._m0[14].x, _138);
        float _876 = _874 * _870;
        float _878 = floor(_876);
        float _880 = -_878;
        float _882 = _876 + _880;
        _184 = _882;
    }
    float _884 = _184;
    float _886 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _888 = int(_886);
    float _890 = in.m_75.x;
    int _892 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _894 = _892 != 0;
    int _896 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _898 = _896 != 0;
    float _900 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _902 = int(_900);
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _906 = _904 != 0;
    int _908 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _910 = _908 != 0;
    float _912 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _914 = int(_912);
    float _916 = float(_888);
    float _918 = 0.0;
    int _920 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    bool _922 = _894;
    float _924 = _890;
    if (_894)
    {
        _918 = 1.0;
    }
    float _926 = _918;
    int _928 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _930 = _928 != 0;
    float _932 = 0.0;
    float _934 = _926;
    bool _936 = _910;
    if (_894)
    {
        _932 = 1.0;
    }
    float _938 = _932;
    float _940 = float(_902);
    float _942 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _944 = int(_942);
    float _946 = 0.0;
    float _948 = _938;
    if (_898)
    {
        float _950 = in.m_67.x;
        _946 = _950;
    }
    float _952 = _946;
    int _954 = 0;
    if (_894)
    {
        _954 = 0;
    }
    int _956 = _954;
    int _958 = _956;
    if (_894)
    {
        _920 = 0;
    }
    int _960 = _920;
    int _962 = int(_894);
    int _964 = _910 ? 2 : 0;
    int _966 = _962 | _964;
    int _968 = _898 ? 4 : 0;
    int _970 = _966 | _968;
    int _972 = _906 ? 8 : 0;
    int _974 = _970 | _972;
    int _976 = false ? 16 : 0;
    int _978 = _974 | _976;
    int _980 = false ? 32 : 0;
    int _982 = _978 | _980;
    int _984 = _930 ? 64 : 0;
    int _986 = _982 | _984;
    int _988 = _986 & 2;
    float _990 = float(_914);
    float _992 = 1.0 / _916;
    int _994 = _960;
    float _996 = as_type<float>(_988);
    if (_906)
    {
        float _998 = in.m_67.z;
        _506 = _998;
    }
    float _1000 = _506;
    float _1002 = 1.0 / _940;
    float _1004 = float(uint(_944));
    float _1006 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1008 = int(_1006);
    float _1010 = _992 * _138;
    float _1012 = 1.0 / _990;
    float _1014 = _1002 * _138;
    float _1016 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1018 = int(_1016);
    float _1020 = float(uint(_1008));
    float _1022 = 1.0 / _1004;
    float _1024 = _1012 * _138;
    float _1026 = trunc(_1010);
    int _1028 = int(_1026);
    float _1030 = float(uint(_1018));
    float _1032 = 1.0 / _1020;
    int _1034 = as_type<int>(_1022) + (-2);
    float _1036 = _1022;
    if (_894)
    {
        float _1038 = in.m_67.x;
        _1036 = _1038;
    }
    float _1040 = _1036;
    float _1042 = trunc(_1014);
    int _1044 = int(_1042);
    float _1046 = float(uint(_1028));
    float _1048 = in.m_67.y;
    float _1050 = 1.0 / _1030;
    int _1052 = as_type<int>(_1032) + (-2);
    int _1054 = ~_1008;
    int _1056 = _1054 + 1;
    float _1058 = trunc(_1024);
    int _1060 = int(_1058);
    float _1062 = float(uint(_1044));
    float _1064 = as_type<float>(_1034) * _1046;
    float _1066 = as_type<float>(_1052) * _1062;
    int _1068 = as_type<int>(_1050) + (-2);
    float _1070 = trunc(_1064);
    float _1072 = precise::max(_1070, 0.0);
    uint _1075 = uint(_1072);
    float _1077 = 0.0;
    float _1079 = _1066;
    float _1081 = _1040;
    if (_894)
    {
        _1077 = _1048;
    }
    float _1083 = _1077;
    float _1085 = float(uint(_1060));
    float _1087 = trunc(_1066);
    float _1089 = precise::max(_1087, 0.0);
    uint _1091 = uint(_1089);
    float _1093 = as_type<float>(_1068) * _1085;
    float _1095 = _1085;
    float _1097 = _1083;
    if (_894)
    {
        _1095 = _1040;
    }
    float _1099 = _1095;
    float _1101 = _1099;
    if (_894)
    {
        _1079 = _1099;
    }
    float _1103 = _1079;
    float _1105 = trunc(_1093);
    float _1107 = precise::max(_1105, 0.0);
    uint _1109 = uint(_1107);
    float _1111 = 0.0;
    float _1113 = _1103;
    if (_894)
    {
        _1111 = _1099;
    }
    float _1115 = _1111;
    int _1117 = _1056 * int(_1091);
    int _1119 = _1117 + _1044;
    float _1121 = _1115;
    int _1123 = _1119;
    if (!_894)
    {
        float _1125 = in.m_67.x;
        float _1127 = _1048 * 3.1415927410125732421875;
        float _1129 = in.m_67.z;
        float _1131 = _1127 * 0.15915493667125701904296875;
        float _1133 = _1131 * 6.283185482025146484375;
        float _1135 = sin(_1133);
        float _1137 = _1125 * 3.1415927410125732421875;
        float _1139 = _1137 * 0.15915493667125701904296875;
        float _1141 = _1139 * 6.283185482025146484375;
        float _1143 = sin(_1141);
        _1081 = _1125;
        _934 = 7.345489978790283203125;
        _1113 = _1129;
        _948 = 5.839270114898681640625;
        _1101 = _1048;
        _994 = 2;
        _958 = 1;
        _1097 = _1135;
        _1121 = _1143;
    }
    float _1145 = _1081;
    float _1147 = _934;
    float _1149 = _1113;
    float _1151 = _948;
    float _1153 = _1101;
    int _1155 = _994;
    int _1157 = _958;
    float _1159 = _1097;
    float _1161 = _1121;
    float _1163 = float(uint(_1119));
    float _1165 = _1145 * _1147;
    float _1167 = _1149 * _1151;
    int _1169 = ~_944;
    int _1171 = _1169 + 1;
    int _1173 = _1171;
    if (_898)
    {
        float _1175 = -_890;
        float _1177 = _1175 + 1.0;
        _1123 = as_type<int>(_1177);
    }
    int _1179 = _1123;
    float _1181 = as_type<float>(_1052) * _1163;
    float _1183 = floor(_1165);
    if (_898)
    {
        bool _1185 = _952 > 0.5;
        _922 = _1185;
    }
    bool _1187 = _922;
    float _1189 = _1153 * _1147;
    if (_906)
    {
        bool _1191 = _1000 > 0.5;
        _936 = _1191;
    }
    bool _1193 = _936;
    int _1195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1197 = _1195 != 0;
    if (_906)
    {
        float _1199 = -_890;
        float _1201 = _1199 + 1.0;
        _1173 = as_type<int>(_1201);
    }
    int _1203 = _1173;
    float _1205 = 0.0;
    if (!_898)
    {
        _1205 = _890;
    }
    float _1207 = _1205;
    float _1209 = trunc(_1181);
    float _1211 = precise::max(_1209, 0.0);
    uint _1213 = uint(_1211);
    float _1215 = _1207;
    if (_898)
    {
        float _1217 = _1187 ? as_type<float>(_1179) : _890;
        _1215 = _1217;
    }
    float _1219 = _1215;
    int _1221 = _1171 * int(_1075);
    int _1223 = _1221 + _1028;
    int _1225 = ~_1018;
    int _1227 = _1225 + 1;
    bool _1229 = !_1197;
    int _1231 = _1229 ? 0 : 1;
    float _1233 = 0.0;
    if (!_906)
    {
        _1233 = _890;
    }
    float _1235 = _1233;
    int _1237 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1239 = _1237 != 0;
    float _1241 = _1235;
    if (_906)
    {
        float _1243 = _1193 ? as_type<float>(_1203) : _890;
        _1241 = _1243;
    }
    float _1245 = _1241;
    float _1247 = floor(_1167);
    int _1249 = ~_1008;
    int _1251 = _1249 + 1;
    float _1253 = _178 * _138;
    float _1255 = float(_1008);
    float _1257 = in.m_75.y;
    int _1259 = abs(_1231);
    bool _1261 = !_1239;
    int _1263 = _1261 ? 0 : 1;
    float _1265 = floor(_1189);
    int _1267 = int(_1091) + int(_1213);
    int _1269 = _1227 * int(_1109);
    int _1271 = _1269 + _1060;
    float _1273 = float(uint(_1223));
    float _1275 = -_1183;
    float _1277 = _1165 + _1275;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _1281 = _1279 != 0;
    int _1283 = _1251 * _1267;
    int _1285 = _1283 + _1044;
    float _1287 = float(uint(_1271));
    float _1289 = as_type<float>(_1034) * _1273;
    float _1291 = -_1247;
    float _1293 = _1167 + _1291;
    float _1295 = _1255 * _1253;
    bool _1297 = uint(_1285) >= uint(_1008);
    float _1299 = trunc(_1289);
    float _1301 = precise::max(_1299, 0.0);
    uint _1303 = uint(_1301);
    float _1305 = as_type<float>(_1068) * _1287;
    float _1307 = float(_1018);
    bool _1309 = _1155 != 2;
    float _1311 = -_1265;
    float _1313 = _1189 + _1311;
    float _1315 = float(_944);
    int _1317 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1319 = _1317 != 0;
    float _1321 = float(_1028);
    float _1323 = trunc(_1305);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    float _1329 = _1255 * _1293;
    float _1331 = float(_1060);
    float _1333 = _1145 * 2.0;
    bool _1335 = _1321 >= _1315;
    bool _1337 = isnan(_1321);
    bool _1339 = _1335 || _1337;
    bool _1341 = isnan(_1315);
    bool _1343 = _1339 || _1341;
    float _1345 = float(_1343);
    float _1347 = _1315 * _1277;
    float _1349 = float(_1044);
    float _1351 = _1315 * _1253;
    float _1353 = trunc(_1329);
    int _1355 = int(_1353);
    float _1357 = _1307 * _1253;
    bool _1359 = _1349 >= _1255;
    bool _1361 = isnan(_1349);
    bool _1363 = _1359 || _1361;
    bool _1365 = isnan(_1255);
    bool _1367 = _1363 || _1365;
    float _1369 = float(_1367);
    float _1371 = _1307 * _1313;
    bool _1373 = _1331 >= _1307;
    bool _1375 = isnan(_1331);
    bool _1377 = _1373 || _1375;
    bool _1379 = isnan(_1307);
    bool _1381 = _1377 || _1379;
    float _1383 = float(_1381);
    float _1385 = in.m_63.w;
    bool _1387 = !_1297;
    int _1389 = _1387 ? 0 : (-1);
    float _1391 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1393 = _884 + _1391;
    float _1395 = trunc(_1369);
    int _1397 = int(_1395);
    int _1399 = int(_1075) + int(_1303);
    float _1401 = in.m_61.w;
    int _1403 = ~_1267;
    int _1405 = _1403 + _1389;
    int _1407 = _1405 + 1;
    int _1409 = ~_944;
    int _1411 = _1409 + 1;
    int _1413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1415 = _1413 != 0;
    int _1417 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1419 = _1417 != 0;
    int _1421 = _1355 * _1259;
    int _1423 = _1421 + _1044;
    bool _1425 = _1008 == 0;
    int _1427 = _1008 * _1407;
    int _1429 = _1427 + _1044;
    float _1431 = trunc(_1295);
    int _1433 = int(_1431);
    int _1435 = int(_1109) + int(_1327);
    int _1437 = ~_1018;
    int _1439 = _1437 + 1;
    int _1441 = _1411 * _1399;
    int _1443 = _1441 + _1028;
    int _1445 = ~_1397;
    int _1447 = _1445 + 1;
    int _1449 = _1447 + 1;
    bool _1451 = !_1419;
    int _1453 = _1451 ? 0 : 1;
    int _1455 = _1439 * _1435;
    int _1457 = _1455 + _1060;
    bool _1459 = !_1425;
    int _1461 = _1459 ? _1429 : (-1);
    float _1463 = trunc(_1345);
    int _1465 = int(_1463);
    bool _1467 = !_1415;
    int _1469 = _1467 ? 0 : 1;
    int _1471 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1473 = _1471 != 0;
    int _1475 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1477 = _1475 != 0;
    bool _1479 = uint(_1443) >= uint(_944);
    int _1481 = _1461 * _1449;
    int _1483 = _1008 + (-1);
    float _1485 = trunc(_1383);
    int _1487 = int(_1485);
    bool _1489 = !_1477;
    int _1491 = _1489 ? 0 : 1;
    bool _1493 = uint(_1457) >= uint(_1018);
    int _1495 = _1397 * _1483;
    int _1497 = _1495 + _1481;
    int _1499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1501 = _1499 != 0;
    bool _1503 = !_1473;
    int _1505 = _1503 ? 0 : 1;
    float _1507 = trunc(_1351);
    int _1509 = int(_1507);
    int _1511 = abs(_1491);
    bool _1513 = !_1501;
    int _1515 = _1513 ? 0 : 1;
    int _1517 = abs(_1505);
    float _1519 = floor(_1333);
    int _1521 = abs(_1515);
    int _1523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1525 = _1523 != 0;
    int _1527 = _1497 * _1511;
    bool _1529 = !_1525;
    int _1531 = _1529 ? 0 : 1;
    float _1533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _1535 = _1433 * _1517;
    int _1537 = _1535 + _1527;
    int _1539 = abs(_1531);
    int _1541 = _1521;
    int _1543 = _1487;
    float _1545 = as_type<float>(_1399);
    if (_930)
    {
        float _1547 = -_890;
        float _1549 = _1547 + 1.0;
        _1541 = as_type<int>(_1549);
    }
    int _1551 = _1541;
    bool _1553 = !_1479;
    int _1555 = _1553 ? 0 : (-1);
    int _1557 = _1423 * _1521;
    int _1559 = _1557 + _1537;
    bool _1561 = _944 == 0;
    float _1563 = trunc(_1347);
    int _1565 = int(_1563);
    int _1567 = ~_1399;
    int _1569 = _1567 + _1555;
    int _1571 = _1569 + 1;
    int _1573 = _1355 * _1539;
    int _1575 = _1573 + _1559;
    bool _1577 = !_1493;
    int _1579 = _1577 ? 0 : (-1);
    int _1581 = ~_1465;
    int _1583 = _1581 + 1;
    int _1585 = _1583 + 1;
    int _1587 = _944 * _1571;
    int _1589 = _1587 + _1028;
    int _1591 = ~_1435;
    int _1593 = _1591 + _1579;
    int _1595 = _1593 + 1;
    float _1597 = float(uint(_1575));
    bool _1599 = !_1561;
    int _1601 = _1599 ? _1589 : (-1);
    int _1603 = _1018 * _1595;
    int _1605 = _1603 + _1060;
    int _1607 = _944 + (-1);
    float _1609 = as_type<float>(_1052) * _1597;
    bool _1611 = _1018 == 0;
    int _1613 = _1601 * _1585;
    int _1615 = abs(_1263);
    bool _1617 = !_1281;
    int _1619 = _1617 ? 0 : 1;
    int _1621 = abs(_1453);
    float _1623 = trunc(_1609);
    float _1625 = precise::max(_1623, 0.0);
    uint _1627 = uint(_1625);
    int _1629 = _1465 * _1607;
    int _1631 = _1629 + _1613;
    int _1633 = abs(_1469);
    int _1635 = _1565 * _1615;
    int _1637 = _1635 + _1028;
    int _1639 = ~_1487;
    int _1641 = _1639 + 1;
    int _1643 = _1641 + 1;
    int _1645 = _1631 * _1621;
    bool _1647 = !_1611;
    int _1649 = _1647 ? _1605 : (-1);
    bool _1651 = _1157 != 1;
    int _1653 = ~_1008;
    int _1655 = _1653 + 1;
    int _1657 = _1509 * _1633;
    int _1659 = _1657 + _1645;
    int _1661 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1663 = _1661 != 0;
    int _1665 = _1649 * _1643;
    float _1667 = in.m_67.w;
    bool _1669 = !_1663;
    int _1671 = _1669 ? 0 : 1;
    int _1673 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1675 = _1673 != 0;
    int _1677 = _1655 * int(_1627);
    int _1679 = _1677 + _1575;
    int _1681 = abs(_1671);
    float _1683 = trunc(_1357);
    int _1685 = int(_1683);
    bool _1687 = !_1675;
    int _1689 = _1687 ? 0 : 1;
    float _1691 = float(uint(_1679));
    int _1693 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _1695 = _1693 != 0;
    int _1697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _1699 = _1697 != 0;
    float _1701 = as_type<float>(_1052) * _1691;
    int _1703 = _1018 + (-1);
    int _1705 = _1637 * _1681;
    int _1707 = _1705 + _1659;
    int _1709 = abs(_1689);
    float _1711 = trunc(_1701);
    float _1713 = precise::max(_1711, 0.0);
    uint _1715 = uint(_1713);
    bool _1717 = !_1699;
    int _1719 = _1717 ? 0 : 1;
    int _1721 = _1487 * _1703;
    int _1723 = _1721 + _1665;
    float _1725 = float(uint(_1423));
    int _1727 = _1565 * _1709;
    int _1729 = _1727 + _1707;
    int _1731 = abs(_1719);
    bool _1733 = !_1695;
    int _1735 = _1733 ? 0 : 1;
    float _1737 = as_type<float>(_1052) * _1725;
    int _1739 = ~_1008;
    int _1741 = _1739 + 1;
    int _1743 = _1723 * _1731;
    float _1745 = float(uint(_1729));
    float _1747 = trunc(_1737);
    float _1749 = precise::max(_1747, 0.0);
    uint _1751 = uint(_1749);
    int _1753 = abs(_1735);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _1757 = _1755 != 0;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _1761 = _1759 != 0;
    float _1763 = as_type<float>(_1034) * _1745;
    int _1765 = int(_1627) + int(_1715);
    int _1767 = _1685 * _1753;
    int _1769 = _1767 + _1743;
    float _1771 = trunc(_1763);
    float _1773 = precise::max(_1771, 0.0);
    uint _1775 = uint(_1773);
    bool _1777 = _1667 > 0.5;
    int _1779 = ~_1008;
    int _1781 = _1779 + 1;
    int _1783 = _1741 * _1765;
    int _1785 = _1783 + _1575;
    bool _1787 = !_1757;
    int _1789 = _1787 ? 0 : 1;
    int _1791 = ~_944;
    int _1793 = _1791 + 1;
    float _1795 = trunc(_1371);
    int _1797 = int(_1795);
    bool _1799 = uint(_1785) >= uint(_1008);
    int _1801 = _1781 * int(_1751);
    int _1803 = _1801 + _1423;
    int _1805 = abs(_1789);
    float _1807 = float(uint(_1637));
    bool _1809 = _988 != 0;
    int _1811 = _1793 * int(_1775);
    int _1813 = _1811 + _1729;
    int _1815 = abs(_1619);
    float _1817 = as_type<float>(_1034) * _1807;
    float _1819 = float(uint(_1803));
    float _1821 = float(uint(_1813));
    bool _1823 = !_1799;
    int _1825 = _1823 ? 0 : (-1);
    int _1827 = _1797 * _1815;
    int _1829 = _1827 + _1060;
    bool _1831 = !_1761;
    int _1833 = _1831 ? 0 : 1;
    float _1835 = as_type<float>(_1034) * _1821;
    float _1837 = as_type<float>(_1052) * _1819;
    int _1839 = _1829 * _1805;
    int _1841 = _1839 + _1769;
    int _1843 = abs(_1833);
    float _1845 = as_type<float>(_1575);
    if (_1809)
    {
        float _1847 = -_890;
        float _1849 = _1847 + 1.0;
        _1543 = as_type<int>(_1849);
    }
    int _1851 = _1543;
    float _1853 = trunc(_1817);
    float _1855 = precise::max(_1853, 0.0);
    uint _1857 = uint(_1855);
    int _1859 = ~_944;
    int _1861 = _1859 + 1;
    int _1863 = ~_1765;
    int _1865 = _1863 + _1825;
    int _1867 = _1865 + 1;
    bool _1869 = _1008 == 0;
    int _1871 = _1797 * _1843;
    int _1873 = _1871 + _1841;
    float _1875 = trunc(_1835);
    float _1877 = precise::max(_1875, 0.0);
    uint _1879 = uint(_1877);
    int _1881 = _1008 * _1867;
    int _1883 = _1881 + _1575;
    bool _1885 = _1048 > 0.5;
    float _1887 = float(uint(_1873));
    int _1889 = _1861 * int(_1857);
    int _1891 = _1889 + _1637;
    bool _1893 = !_1869;
    int _1895 = _1893 ? _1883 : (-1);
    float _1897 = trunc(_1837);
    float _1899 = precise::max(_1897, 0.0);
    uint _1901 = uint(_1899);
    float _1903 = as_type<float>(_1068) * _1887;
    if (!_1809)
    {
        _1845 = _890;
    }
    float _1905 = _1845;
    float _1907 = float(uint(_1891));
    float _1909 = _1905;
    if (_1809)
    {
        float _1911 = _1885 ? as_type<float>(_1851) : _890;
        _1909 = _1911;
    }
    float _1913 = _1909;
    float _1915 = trunc(_1903);
    float _1917 = precise::max(_1915, 0.0);
    uint _1919 = uint(_1917);
    int _1921 = int(_1775) + int(_1879);
    float _1923 = as_type<float>(_1034) * _1907;
    float _1925 = float(uint(_1829));
    int _1927 = _1895 & 3;
    bool _1929 = _1927 != 0;
    int _1931 = _1895 & 3;
    bool _1933 = _1931 != 0;
    float _1935 = as_type<float>(_1068) * _1925;
    int _1937 = _1929 ? 0 : 1;
    float _1939 = in.m_67.z;
    bool _1941 = uint(_1931) > 1u;
    float _1943 = trunc(_1923);
    float _1945 = precise::max(_1943, 0.0);
    uint _1947 = uint(_1945);
    int _1949 = ~_1018;
    int _1951 = _1949 + 1;
    int _1953 = ~_944;
    int _1955 = _1953 + 1;
    int _1957 = int(_1751) + int(_1901);
    int _1959 = _1951 * int(_1919);
    int _1961 = _1959 + _1873;
    float _1963 = -_1257;
    float _1965 = _1963 + 1.0;
    float _1967 = trunc(_1935);
    float _1969 = precise::max(_1967, 0.0);
    uint _1971 = uint(_1969);
    int _1973 = _1955 * _1921;
    int _1975 = _1973 + _1729;
    int _1977 = ~_1937;
    int _1979 = _1977 + 1;
    int _1981 = _1979 + 1;
    float _1983 = float(uint(_1961));
    int _1985 = _1981;
    float _1987 = as_type<float>(_1919);
    if (!_1941)
    {
        int _1989 = ~_1937;
        int _1991 = _1989 + 1;
        _1985 = _1991;
    }
    int _1993 = _1985;
    int _1995 = ~_1018;
    int _1997 = _1995 + 1;
    float _1999 = as_type<float>(_1068) * _1983;
    int _2001 = _1777 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2003 = uint(_1975) >= uint(_944);
    float _2005 = trunc(_1999);
    float _2007 = precise::max(_2005, 0.0);
    uint _2009 = uint(_2007);
    if (_930)
    {
        float _2011 = _1885 ? as_type<float>(_1551) : _890;
        _924 = _2011;
    }
    float _2013 = _924;
    int _2015 = _1997 * int(_1971);
    int _2017 = _2015 + _1829;
    bool _2019 = !_2003;
    int _2021 = _2019 ? 0 : (-1);
    int _2023 = _1885 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2025 = uint(_1931) >= 2u;
    bool _2027 = _1931 != 3;
    float _2029 = float(uint(_2017));
    int _2031 = _2025 ? 0 : 1;
    float _2033 = as_type<float>(_1068) * _2029;
    int _2035 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2037 = _2035 != 0;
    int _2039 = ~_1921;
    int _2041 = _2039 + _2021;
    int _2043 = _2041 + 1;
    int _2045 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2047 = _2045 != 0;
    int _2049 = ~_2031;
    int _2051 = _2049 + 1;
    int _2053 = _2051 + 1;
    int _2055 = ~_1008;
    int _2057 = _2055 + 1;
    int _2059 = _2053;
    if (_2027)
    {
        int _2061 = ~_2031;
        int _2063 = _2061 + 1;
        _2059 = _2063;
    }
    int _2065 = _2059;
    int _2067 = ~_1018;
    int _2069 = _2067 + 1;
    int _2071 = _2057 * _1957;
    int _2073 = _2071 + _1423;
    int _2075 = int(_1919) + int(_2009);
    int _2077 = int(_1857) + int(_1947);
    int _2079 = _944 * _2043;
    int _2081 = _2079 + _1729;
    if (_1309)
    {
        _1987 = _1145;
    }
    float _2083 = _1987;
    int _2085 = _2069 * _2075;
    int _2087 = _2085 + _1873;
    float _2089 = 0.0;
    float _2091 = _2083;
    if (_1309)
    {
        _2089 = _1048;
    }
    float _2093 = _2089;
    float _2095 = trunc(_2033);
    float _2097 = precise::max(_2095, 0.0);
    uint _2099 = uint(_2097);
    bool _2101 = _944 == 0;
    float _2103 = _2093;
    if (!_1309)
    {
        _2091 = _1939;
    }
    float _2105 = _2091;
    if (!_1309)
    {
        _2103 = _1145;
    }
    float _2107 = _2103;
    bool _2109 = _1939 > 0.5;
    bool _2111 = !_2101;
    int _2113 = _2111 ? _2081 : (-1);
    float _2115 = _2107 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    if (!_1651)
    {
        _996 = _1048;
    }
    float _2117 = _996;
    float _2119 = 0.0;
    float _2121 = _2117;
    if (!_1651)
    {
        _2119 = _1048;
    }
    float _2123 = _2119;
    float _2125 = 0.0;
    float _2127 = _2123;
    if (!_1651)
    {
        _2125 = _1939;
    }
    float _2129 = _2125;
    float _2131 = _2129;
    if (!_1651)
    {
        _1545 = _1939;
    }
    float _2133 = _1545;
    bool _2135 = uint(_2073) >= uint(_1008);
    float _2137 = _2133;
    if (_1651)
    {
        _2121 = _1145;
    }
    float _2139 = _2121;
    if (_1651)
    {
        _2127 = _1145;
    }
    float _2141 = _2127;
    if (_1651)
    {
        _2131 = _1048;
    }
    float _2143 = _2131;
    float _2145 = _2139 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_1651)
    {
        _2137 = _1048;
    }
    float _2147 = _2137;
    int _2149 = _2109 ? as_type<int>(_1965) : as_type<int>(_1257);
    bool _2151 = uint(_2087) >= uint(_1018);
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2155 = _2153 != 0;
    int _2157 = _2113 & 3;
    bool _2159 = !_2135;
    int _2161 = _2159 ? 0 : (-1);
    float _2163 = _1319 ? as_type<float>(_2149) : _1257;
    bool _2165 = !_2151;
    int _2167 = _2165 ? 0 : (-1);
    int _2169 = ~_944;
    int _2171 = _2169 + 1;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2175 = _2173 != 0;
    bool _2177 = uint(_2157) > 1u;
    int _2179 = _2171 * _2077;
    int _2181 = _2179 + _1637;
    float _2183 = _2037 ? as_type<float>(_2023) : _1257;
    bool _2185 = !_2175;
    int _2187 = _2185 ? 0 : 1;
    int _2189 = _2113 & 3;
    bool _2191 = _2189 != 0;
    int _2193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2195 = _2193 != 0;
    float _2197 = _2047 ? as_type<float>(_2001) : _1257;
    int _2199 = _2191 ? 0 : 1;
    float _2201 = _2155 ? as_type<float>(_2149) : _1257;
    bool _2203 = uint(_2181) >= uint(_944);
    int _2205 = int(_1971) + int(_2099);
    int _2207 = ~_2199;
    int _2209 = _2207 + 1;
    int _2211 = _2209 + 1;
    int _2213 = _2211;
    if (!_2177)
    {
        int _2215 = ~_2199;
        int _2217 = _2215 + 1;
        _2213 = _2217;
    }
    int _2219 = _2213;
    bool _2221 = !_2203;
    int _2223 = _2221 ? 0 : (-1);
    int _2225 = ~_2075;
    int _2227 = _2225 + _2167;
    int _2229 = _2227 + 1;
    bool _2231 = _2157 != 3;
    float _2233 = in.m_50.x;
    float _2235 = in.m_50.y;
    float _2237 = in.m_50.z;
    int _2239 = ~_1018;
    int _2241 = _2239 + 1;
    int _2243 = _1018 * _2229;
    int _2245 = _2243 + _1873;
    bool _2247 = uint(_2157) >= 2u;
    int _2249 = _2241 * _2205;
    int _2251 = _2249 + _1829;
    int _2253 = _2247 ? 0 : 1;
    bool _2255 = !_1611;
    int _2257 = _2255 ? _2245 : (-1);
    float _2259 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2261 = _2259 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2263 = ~_2253;
    int _2265 = _2263 + 1;
    int _2267 = _2265 + 1;
    bool _2269 = uint(_2251) >= uint(_1018);
    int _2271 = _2267;
    if (_2231)
    {
        int _2273 = ~_2253;
        int _2275 = _2273 + 1;
        _2271 = _2275;
    }
    int _2277 = _2271;
    float _2279 = 1.0 / _2261;
    int _2281 = _2257 & 3;
    bool _2283 = !_2269;
    int _2285 = _2283 ? 0 : (-1);
    bool _2287 = uint(_2281) > 1u;
    int _2289 = _2257 & 3;
    bool _2291 = _2289 != 0;
    float _2293 = _206 * _2235;
    float _2295 = _200 * _2235;
    float _2297 = _212 * _2235;
    int _2299 = _2291 ? 0 : 1;
    float _2301 = fma(_204, _2233, _2293);
    float _2303 = fma(_198, _2233, _2295);
    float _2305 = fma(_210, _2233, _2297);
    int _2307 = ~_2299;
    int _2309 = _2307 + 1;
    int _2311 = _2309 + 1;
    float _2313 = fma(_202, _2237, _2303);
    int _2315 = _2311;
    if (!_2287)
    {
        int _2317 = ~_2299;
        int _2319 = _2317 + 1;
        _2315 = _2319;
    }
    int _2321 = _2315;
    float _2323 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2325 = _2323 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2327 = uint(_2281) >= 2u;
    float _2329 = fma(_208, _2237, _2301);
    float _2331 = fma(_214, _2237, _2305);
    int _2333 = _2327 ? 0 : 1;
    float _2335 = _1048 * 2.0;
    bool _2337 = _2281 != 3;
    float _2339 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2341 = _2339 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2343 = _1048 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2345 = 1.0 / _2325;
    int _2347 = ~_2333;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2357 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2359 = _2329 + _1385;
    float _2361 = floor(_2335);
    int _2363 = _2351;
    if (_2337)
    {
        int _2365 = ~_2333;
        int _2367 = _2365 + 1;
        _2363 = _2367;
    }
    int _2369 = _2363;
    float _2371 = fma(_2343, -2.0, _2357);
    bool _2373 = _1519 >= 0.0;
    bool _2375 = isnan(_1519);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan(0.0);
    bool _2381 = _2377 || _2379;
    float _2383 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2385 = _2383 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2387 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2389 = _2387 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    int _2391 = _2381 ? 0 : 1;
    float _2393 = 1.0 / _2341;
    bool _2395 = _1519 > 0.0;
    float _2397 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2399 = _2397 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2401 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2403 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2401;
    int _2405 = ~_2391;
    int _2407 = _2405 + 1;
    int _2409 = _2407 + 1;
    float _2411 = _1533 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2413 = 1.0 / _2355;
    float _2415 = _2403 * _2279;
    float _2417 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2419 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2417;
    int _2421 = ~_1957;
    int _2423 = _2421 + _2161;
    int _2425 = _2423 + 1;
    float _2427 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2371);
    bool _2429 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2431 = isnan(_884);
    bool _2433 = _2429 || _2431;
    bool _2435 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2437 = _2433 || _2435;
    float _2439 = float(_2437);
    int _2441 = _2409;
    if (!_2395)
    {
        int _2443 = ~_2391;
        int _2445 = _2443 + 1;
        _2441 = _2445;
    }
    int _2447 = _2441;
    float _2449 = 1.0 / _2385;
    bool _2451 = _2361 >= 0.0;
    bool _2453 = isnan(_2361);
    bool _2455 = _2451 || _2453;
    bool _2457 = isnan(0.0);
    bool _2459 = _2455 || _2457;
    float _2461 = _2419 * _2393;
    int _2463 = _1008 * _2425;
    int _2465 = _2463 + _1423;
    int _2467 = _2459 ? 0 : 1;
    float _2469 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2471 = _884 + _2469;
    bool _2473 = _2361 > 0.0;
    float _2475 = 1.0 / _2389;
    float _2477 = fma(_2415, _2471, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    int _2479 = ~_2467;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    float _2485 = -_2439;
    float _2487 = _2485 + 1.0;
    bool _2489 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2491 = isnan(_884);
    bool _2493 = _2489 || _2491;
    bool _2495 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2497 = _2493 || _2495;
    float _2499 = float(_2497);
    bool _2501 = !_1869;
    int _2503 = _2501 ? _2465 : (-1);
    float _2505 = 1.0 / _2399;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2509 = _2507 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2511 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2513 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2511;
    int _2515 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2517 = _2515 != 0;
    int _2519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2521 = _2519 != 0;
    int _2523 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2525 = _2523 != 0;
    float _2527 = _2509 * _2345;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2531 = _2529 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2533 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2535 = _2533 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2537 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2539 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2537;
    float _2541 = _2513 * _2475;
    float _2543 = _2531 * _2413;
    float _2545 = _1048 + _1939;
    float _2547 = _2535 * _2449;
    bool _2549 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2551 = isnan(_884);
    bool _2553 = _2549 || _2551;
    bool _2555 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2557 = _2553 || _2555;
    float _2559 = float(_2557);
    float _2561 = _1939 * 2.0;
    float _2563 = _2545 + (-1.0);
    float _2565 = _2539 * _2505;
    int _2567 = _2483;
    if (!_2473)
    {
        int _2569 = ~_2467;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = floor(_2561);
    float _2577 = fma(_2563, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _2579 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2581 = isnan(_884);
    bool _2583 = _2579 || _2581;
    bool _2585 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2587 = _2583 || _2585;
    float _2589 = float(_2587);
    float _2591 = -_2559;
    float _2593 = _2591 + 1.0;
    bool _2595 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2597 = isnan(_884);
    bool _2599 = _2595 || _2597;
    bool _2601 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2603 = _2599 || _2601;
    float _2605 = float(_2603);
    bool _2607 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2609 = isnan(_884);
    bool _2611 = _2607 || _2609;
    bool _2613 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2615 = _2611 || _2613;
    float _2617 = float(_2615);
    float _2619 = _2589 * _2593;
    float _2621 = -_2589;
    float _2623 = _2621 + 1.0;
    float _2625 = -_2499;
    float _2627 = _2625 + 1.0;
    bool _2629 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2631 = isnan(_884);
    bool _2633 = _2629 || _2631;
    bool _2635 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2637 = _2633 || _2635;
    float _2639 = float(_2637);
    float _2641 = _2605 * _2623;
    float _2643 = -_2605;
    float _2645 = _2643 + 1.0;
    bool _2647 = !_1933;
    int _2649 = _2647 ? 0 : 1;
    bool _2651 = _2575 >= 0.0;
    bool _2653 = isnan(_2575);
    bool _2655 = _2651 || _2653;
    bool _2657 = isnan(0.0);
    bool _2659 = _2655 || _2657;
    float _2661 = _2499 * _2645;
    float _2663 = _2617 * _2627;
    float _2665 = -_2617;
    float _2667 = _2665 + 1.0;
    bool _2669 = _884 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2671 = isnan(_884);
    bool _2673 = _2669 || _2671;
    bool _2675 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2677 = _2673 || _2675;
    float _2679 = float(_2677);
    int _2681 = _2659 ? 0 : 1;
    float _2683 = _2639 * _2667;
    bool _2685 = _2575 > 0.0;
    float _2687 = in.m_65.w;
    float _2689 = -_2639;
    float _2691 = _2689 + 1.0;
    float _2693 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2695 = _884 + _2693;
    float _2697 = _2679 * _2487;
    float _2699 = -_2679;
    float _2701 = _2699 + 1.0;
    float _2703 = _2439 * _2691;
    float _2705 = fma(_2527, _2695, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2707 = fma(_2461, _1393, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2709 = _2477 * _2697;
    float _2711 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2713 = _884 + _2711;
    float _2715 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2717 = _884 + _2715;
    bool _2719 = !_2517;
    int _2721 = _2719 ? 0 : 1;
    float _2723 = fma(_2701, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2709);
    float _2725 = fma(_2543, _2713, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2727 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2729 = _884 + _2727;
    float _2731 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2733 = _884 + _2731;
    float _2735 = fma(_2705, _2703, _2723);
    float _2737 = fma(_2541, _2717, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2739 = _2313 + _1401;
    float _2741 = fma(_2565, _2733, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2743 = fma(_2707, _2683, _2735);
    float _2745 = fma(_2411, _1245, -0.5);
    float _2747 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _2749 = _2331 + _2687;
    float _2751 = fma(_2725, _2663, _2743);
    float _2753 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    float _2755 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _2757 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    float _2761 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _2763 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2765 = _2359 + _2763;
    float _2767 = -_2753;
    float _2769 = fma(_2755, 2.0, _2767);
    float _2771 = fma(_2747, -2.0, _2759);
    float _2773 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[93].z, _2761);
    float _2775 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2777 = _2739 + _2775;
    float _2779 = _2765 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2781 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2783 = _1145 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2785 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _2787 = fma(_2777, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2779);
    float _2789 = -_2781;
    float _2791 = fma(_2783, 2.0, _2789);
    bool _2793 = !_2191;
    int _2795 = _2793 ? 0 : 1;
    float _2797 = fma(_2547, _2729, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    bool _2799 = _1931 != 3;
    float _2801 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2803 = _2749 + _2801;
    float _2805 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2807 = fma(_2737, _2661, _2751);
    float _2809 = fma(_2803, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2787);
    float _2811 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2805);
    bool _2813 = !_2799;
    int _2815 = _2813 ? 0 : (-1);
    float _2817 = fma(_2013, (*spvDescriptorSet0.vp_c9)._m0[95].x, -0.5);
    float _2819 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].z, _2773);
    bool _2821 = _2809 >= 0.0;
    float _2823 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2811);
    float _2825 = -_138;
    float _2827 = fma(_2825, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2791);
    float _2829 = -_138;
    float _2831 = fma(_2829, (*spvDescriptorSet0.vp_c9)._m0[91].x, _2769);
    float _2833 = fma(_2797, _2641, _2807);
    float _2835 = fma(_2823, _2757, _2827);
    float _2837 = fma(_2819, _2817, _2831);
    float _2839 = fma(_2183, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _2841 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _2843 = _2785 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _2845 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[91].y, _2771);
    float _2847 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[93].w, _2841);
    float _2849 = fma(_2843, _2197, -0.5);
    float _2851 = _2757;
    float _2853 = _2749;
    if (_2821)
    {
        _2851 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2855 = _2851;
    float _2857 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2859 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[92].w, _2847);
    float _2861 = fma(_2201, (*spvDescriptorSet0.vp_c9)._m0[95].y, -0.5);
    float _2863 = fma(_2741, _2619, _2833);
    float _2865 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2857);
    float _2867 = _2765 * _2765;
    int _2869 = as_type<int>(_2855);
    if (_2821)
    {
        float _2871 = _2855 * 5.0;
        _2869 = as_type<int>(_2871);
    }
    int _2873 = _2869;
    float _2875 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2865);
    float _2877 = fma(_2777, _2777, _2867);
    float _2879 = -_2845;
    float _2881 = fma(_2859, _2861, _2879);
    float _2883 = -_2427;
    float _2885 = fma(_2875, _2839, _2883);
    float _2887 = fma(_2803, _2803, _2877);
    float _2889 = _2885;
    if (_2821)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9602 = as_type<float>(_2873);
        out.gl_Position.z = _9602;
    }
    float _2891 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2893 = _2105 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2895 = rsqrt(_2887);
    int _2897 = ~_2681;
    int _2899 = _2897 + 1;
    int _2901 = _2899 + 1;
    float _2903 = _1048 + _1145;
    int _2905 = _2901;
    if (!_2685)
    {
        int _2907 = ~_2681;
        int _2909 = _2907 + 1;
        _2905 = _2909;
    }
    int _2911 = _2905;
    if (_2821)
    {
        out.m_57.x = 0.0;
    }
    int _2913 = ~_2205;
    int _2915 = _2913 + _2285;
    int _2917 = _2915 + 1;
    float _2919 = _2903 + (-1.0);
    int _2921 = _1895 >> 31;
    float _2923 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2925 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2927 = abs(_2369);
    int _2929 = _2921 & 3;
    float _2931 = fma(_2141, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2923);
    float _2933 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2935 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2925);
    int _2937 = _1895 + _2929;
    float _2939 = fma(_2559, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2863);
    float _2941 = -_2933;
    float _2943 = fma(_2145, 2.0, _2941);
    float _2945 = _2765 * _2895;
    int _2947 = _2937 >> 2;
    float _2949 = _2777 * _2895;
    float _2951 = -_2945;
    float _2953 = fma(_2951, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2765);
    int _2955 = _2947 << 4;
    int _2957 = _2955 + 656;
    float _2959 = -_2949;
    float _2961 = fma(_2959, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2777);
    float _2963 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    uint _2965 = uint(int(uint(_2957) >> uint(2)));
    uint _2967 = uint(int(uint(int(_2965)) >> uint(2)));
    int _2969 = int(_2965) & 3;
    float _2971 = (*spvDescriptorSet0.vp_c9)._m0[int(_2967)][_2969];
    int _2973 = int(_2965) + 1;
    uint _2975 = uint(int(uint(_2973) >> uint(2)));
    int _2977 = _2973 & 3;
    float _2979 = (*spvDescriptorSet0.vp_c9)._m0[int(_2975)][_2977];
    float _2981 = _2953 * _2953;
    float _2983 = _2881 + 0.5;
    float _2985 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2987 = -_2963;
    float _2989 = fma(_2893, 2.0, _2987);
    float _2991 = fma(_2961, _2961, _2981);
    float _2993 = fma(_2891, -2.0, _2985);
    int _2995 = _2957 + 8;
    uint _2997 = uint(int(uint(_2995) >> uint(2)));
    uint _2999 = uint(int(uint(int(_2997)) >> uint(2)));
    int _3001 = int(_2997) & 3;
    float _3003 = (*spvDescriptorSet0.vp_c9)._m0[int(_2999)][_3001];
    int _3005 = int(_2997) + 1;
    uint _3007 = uint(int(uint(_3005) >> uint(2)));
    int _3009 = _3005 & 3;
    float _3011 = (*spvDescriptorSet0.vp_c9)._m0[int(_3007)][_3009];
    int _3013 = _2113 >> 31;
    out.m_77.x = _2939;
    float _3015 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3017 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2935);
    int _3019 = _3013 & 3;
    float _3021 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2993);
    float _3023 = fma(_2115, -2.0, _3015);
    float _3025 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2931);
    float _3027 = -_138;
    float _3029 = fma(_3027, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2943);
    int _3031 = abs(_2721);
    float _3033 = -_3021;
    float _3035 = fma(_3017, _2849, _3033);
    int _3037 = _2113 + _3019;
    float _3039 = _2837 + 0.5;
    float _3041 = fma(_3025, _2745, _3029);
    float _3043 = float(_2911);
    float _3045 = _3035 + 0.5;
    int _3047 = _3037 >> 2;
    out.m_79.x = _3039;
    out.m_79.y = _2983;
    int _3049 = abs(_2649);
    float _3051 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3053 = int(_3051);
    int _3055 = _3047 << 4;
    int _3057 = _3055 + 368;
    float _3059 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3023);
    int _3061 = abs(_1993);
    uint _3063 = uint(int(uint(_3057) >> uint(2)));
    uint _3065 = uint(int(uint(int(_3063)) >> uint(2)));
    int _3067 = int(_3063) & 3;
    float _3069 = (*spvDescriptorSet0.vp_c9)._m0[int(_3065)][_3067];
    int _3071 = int(_3063) + 1;
    uint _3073 = uint(int(uint(_3071) >> uint(2)));
    int _3075 = _3071 & 3;
    float _3077 = (*spvDescriptorSet0.vp_c9)._m0[int(_3073)][_3075];
    int _3079 = _2257 >> 31;
    float _3081 = _2835 + 0.5;
    float _3083 = float(_3031);
    float _3085 = _2885 + 0.5;
    int _3087 = _3079 & 3;
    float _3089 = _3041 + 0.5;
    int _3091 = ~_3061;
    int _3093 = _3091 + 1;
    int _3095 = _3093 + 1;
    float _3097 = _3083 * _3043;
    int _3099 = _2257 + _3087;
    int _3101 = ~_3049;
    int _3103 = _3101 + 1;
    int _3105 = _3103 + 1;
    out.m_81.x = _3081;
    out.m_81.y = _3085;
    out.m_81.z = _3089;
    out.m_81.w = _3045;
    int _3107 = _3099 >> 2;
    int _3109 = _3095 * as_type<int>(_2979);
    int _3111 = ~_2077;
    int _3113 = _3111 + _2223;
    int _3115 = _3113 + 1;
    int _3117 = _3107 << 4;
    int _3119 = _3117 + 800;
    int _3121 = _3105 * as_type<int>(_2971);
    int _3123 = _3121 + _3109;
    float _3125 = float(uint(_3053));
    int _3127 = _944 * _3115;
    int _3129 = _3127 + _1637;
    int _3131 = abs(_2815);
    int _3133 = abs(_2187);
    bool _3135 = !_2195;
    int _3137 = _3135 ? 0 : 1;
    int _3139 = ~_3131;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    uint _3145 = uint(int(uint(_3119) >> uint(2)));
    uint _3147 = uint(int(uint(int(_3145)) >> uint(2)));
    int _3149 = int(_3145) & 3;
    float _3151 = (*spvDescriptorSet0.vp_c9)._m0[int(_3147)][_3149];
    int _3153 = int(_3145) + 1;
    uint _3155 = uint(int(uint(_3153) >> uint(2)));
    int _3157 = _3153 & 3;
    float _3159 = (*spvDescriptorSet0.vp_c9)._m0[int(_3155)][_3157];
    int _3161 = abs(_2065);
    float _3163 = 1.0 / _3125;
    int _3165 = abs(_3053);
    int _3167 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _3169 = _3167 != 0;
    int _3171 = ~_3161;
    int _3173 = _3171 + 1;
    int _3175 = _3173 + 1;
    float _3177 = float(uint(_3165));
    bool _3179 = _944 == 0;
    int _3181 = _3175 * as_type<int>(_3003);
    int _3183 = _3181 + _3123;
    int _3185 = ~_3133;
    int _3187 = _3185 + 1;
    int _3189 = _3187 + 1;
    int _3191 = _3057 + 8;
    uint _3193 = uint(int(uint(_3191) >> uint(2)));
    uint _3195 = uint(int(uint(int(_3193)) >> uint(2)));
    int _3197 = int(_3193) & 3;
    float _3199 = (*spvDescriptorSet0.vp_c9)._m0[int(_3195)][_3197];
    int _3201 = int(_3193) + 1;
    uint _3203 = uint(int(uint(_3201) >> uint(2)));
    int _3205 = _3201 & 3;
    float _3207 = (*spvDescriptorSet0.vp_c9)._m0[int(_3203)][_3205];
    float _3209 = 1.0 / _3177;
    int _3211 = _3143 * as_type<int>(_3011);
    int _3213 = _3211 + _3183;
    bool _3215 = !_2291;
    int _3217 = _3215 ? 0 : 1;
    bool _3219 = _2157 != 3;
    int _3221 = _3213 * _3189;
    int _3223 = abs(_2219);
    bool _3225 = !_3219;
    float _3227 = _3225 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _3229 = _2503 * _3133;
    int _3231 = _3229 + _3221;
    int _3233 = ~_3223;
    int _3235 = _3233 + 1;
    int _3237 = _3235 + 1;
    int _3239 = _3119 + 8;
    uint _3241 = uint(int(uint(_3239) >> uint(2)));
    uint _3243 = uint(int(uint(int(_3241)) >> uint(2)));
    int _3245 = int(_3241) & 3;
    float _3247 = (*spvDescriptorSet0.vp_c9)._m0[int(_3243)][_3245];
    int _3249 = int(_3241) + 1;
    uint _3251 = uint(int(uint(_3249) >> uint(2)));
    int _3253 = _3249 & 3;
    float _3255 = (*spvDescriptorSet0.vp_c9)._m0[int(_3251)][_3253];
    bool _3257 = _2281 != 3;
    int _3259 = as_type<int>(_3163) + (-2);
    int _3261 = _3237 * as_type<int>(_3077);
    float _3263 = float(uint(_3231));
    int _3265 = abs(_3231);
    int _3267 = as_type<int>(_3209) + (-2);
    float _3269 = as_type<float>(_3259) * _3263;
    float _3271 = float(uint(_3265));
    int _3273 = abs(_2321);
    int _3275 = abs(_3217);
    float _3277 = trunc(_3269);
    float _3279 = precise::max(_3277, 0.0);
    uint _3281 = uint(_3279);
    float _3283 = as_type<float>(_3267) * _3271;
    int _3285 = abs(_2795);
    int _3287 = ~_3053;
    int _3289 = _3287 + 1;
    int _3291 = ~_3273;
    int _3293 = _3291 + 1;
    int _3295 = _3293 + 1;
    float _3297 = trunc(_3283);
    float _3299 = precise::max(_3297, 0.0);
    uint _3301 = uint(_3299);
    int _3303 = ~_3285;
    int _3305 = _3303 + 1;
    int _3307 = _3305 + 1;
    int _3309 = abs(_2277);
    int _3311 = _3295 * as_type<int>(_3159);
    int _3313 = _3307 * as_type<int>(_3069);
    int _3315 = _3313 + _3261;
    int _3317 = ~_3275;
    int _3319 = _3317 + 1;
    int _3321 = _3319 + 1;
    int _3323 = ~_3165;
    int _3325 = _3323 + 1;
    int _3327 = _3289 * int(_3281);
    int _3329 = _3327 + _3231;
    int _3331 = _3321 * as_type<int>(_3151);
    int _3333 = _3331 + _3311;
    float _3335 = float(uint(_3329));
    int _3337 = ~_3309;
    int _3339 = _3337 + 1;
    int _3341 = _3339 + 1;
    int _3343 = _3325 * int(_3301);
    int _3345 = _3343 + _3265;
    bool _3347 = !_3179;
    int _3349 = _3347 ? _3129 : (-1);
    float _3351 = as_type<float>(_3259) * _3335;
    bool _3353 = !_3257;
    int _3355 = _3353 ? 0 : (-1);
    int _3357 = _3341 * as_type<int>(_3199);
    int _3359 = _3357 + _3315;
    float _3361 = float(uint(_3345));
    float _3363 = trunc(_3351);
    float _3365 = precise::max(_3363, 0.0);
    uint _3367 = uint(_3365);
    int _3369 = abs(as_type<int>(_3227));
    int _3371 = ~_2927;
    int _3373 = _3371 + 1;
    int _3375 = _3373 + 1;
    float _3377 = as_type<float>(_3267) * _3361;
    int _3379 = ~_3369;
    int _3381 = _3379 + 1;
    int _3383 = _3381 + 1;
    bool _3385 = _1018 == 0;
    int _3387 = _3375 * as_type<int>(_3247);
    int _3389 = _3387 + _3333;
    int _3391 = abs(_3355);
    float _3393 = trunc(_3377);
    float _3395 = precise::max(_3393, 0.0);
    uint _3397 = uint(_3395);
    int _3399 = _3383 * as_type<int>(_3207);
    int _3401 = _3399 + _3359;
    int _3403 = ~_3053;
    int _3405 = _3403 + 1;
    int _3407 = int(_3281) + int(_3367);
    int _3409 = ~_3391;
    int _3411 = _3409 + 1;
    int _3413 = _3411 + 1;
    int _3415 = abs(_3137);
    int _3417 = _3405 * _3407;
    int _3419 = _3417 + _3231;
    bool _3421 = !_3169;
    int _3423 = _3421 ? 0 : 1;
    int _3425 = _3413 * as_type<int>(_3255);
    int _3427 = _3425 + _3389;
    int _3429 = ~_3165;
    int _3431 = _3429 + 1;
    int _3433 = int(_3301) + int(_3397);
    bool _3435 = uint(_3419) >= uint(_3053);
    float _3437 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _3439 = ~_3415;
    int _3441 = _3439 + 1;
    int _3443 = _3441 + 1;
    int _3445 = _3431 * _3433;
    int _3447 = _3445 + _3265;
    int _3449 = abs(_3423);
    bool _3451 = !_3435;
    int _3453 = _3451 ? 0 : (-1);
    int _3455 = _3401 * _3443;
    int _3457 = ~_3449;
    int _3459 = _3457 + 1;
    int _3461 = _3459 + 1;
    int _3463 = _1018 * _2917;
    int _3465 = _3463 + _1829;
    int _3467 = ~_3407;
    int _3469 = _3467 + _3453;
    int _3471 = _3469 + 1;
    int _3473 = _3349 * _3415;
    int _3475 = _3473 + _3455;
    bool _3477 = uint(_3447) >= uint(_3165);
    int _3479 = _3427 * _3461;
    bool _3481 = !_3385;
    int _3483 = _3481 ? _3465 : (-1);
    int _3485 = _3053 * _3471;
    int _3487 = _3485 + _3231;
    int _3489 = _3231 ^ _3053;
    float _3491 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _3493 = log2(_3491);
    bool _3495 = _3053 == 0;
    int _3497 = _3483 * _3449;
    int _3499 = _3497 + _3479;
    bool _3501 = !_3477;
    int _3503 = _3501 ? 0 : (-1);
    float _3505 = _2803 * _2895;
    uint _3507 = uint(int(uint(_3489) >> uint(31)));
    bool _3509 = !_3495;
    int _3511 = _3509 ? _3487 : (-1);
    int _3513 = ~_3503;
    int _3515 = _3433 + _3513;
    int _3517 = _3515 + 1;
    float _3519 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3521 = ~int(_3507);
    int _3523 = _3521 + 1;
    float _3525 = _3437 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _3527 = float(_3511);
    float _3529 = -_138;
    float _3531 = fma(_3529, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2989);
    int _3533 = _3517 ^ _3523;
    float _3535 = fma(_3525, _1913, -0.5);
    bool _3537 = _3053 == 0;
    float _3539 = fma(_3525, _3527, _3531);
    int _3541 = ~_3523;
    int _3543 = _3541 + _3533;
    int _3545 = _3543 + 1;
    float _3547 = _3493 * _138;
    bool _3549 = !_3537;
    int _3551 = _3549 ? _3545 : (-1);
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _3555 = _3519 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _3557 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _3559 = float(_3551);
    float _3561 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[88].z, _3553);
    float _3563 = exp2(_3547);
    float _3565 = fma(_1048, (*spvDescriptorSet0.vp_c9)._m0[88].w, _3557);
    float _3567 = fma(_3555, _2163, -0.5);
    float _3569 = -_3059;
    float _3571 = fma(_3555, _3559, _3569);
    float _3573 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].z, _3561);
    float _3575 = fma(_138, (*spvDescriptorSet0.vp_c9)._m0[87].w, _3565);
    float _3577 = float(_3475);
    float _3579 = fma(_3573, _3535, _3539);
    float _3581 = fma(_3575, _3567, _3571);
    out.m_83.x = _3577;
    float _3583 = _3579 + 0.5;
    float _3585 = _3581 + 0.5;
    bool _3587 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3589 = isnan(1.0);
    bool _3591 = _3587 || _3589;
    bool _3593 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3595 = _3591 || _3593;
    float _3597 = in.m_85.x;
    float _3599 = in.m_85.y;
    float _3601 = in.m_85.z;
    float _3603 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _3605 = 1.0 + _3603;
    float _3607 = float(_3499);
    float _3609 = -_3563;
    float _3611 = _3609 + 1.0;
    float _3613 = 1.0 / _3605;
    bool _3615 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _3617 = isnan(0.0);
    bool _3619 = _3615 || _3617;
    bool _3621 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _3623 = _3619 || _3621;
    out.m_83.w = _3607;
    bool _3625 = !_2525;
    int _3627 = _3625 ? 0 : 1;
    float _3629 = fma(_2919, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3631 = _3623 ? _3611 : 0.0;
    out.m_87.x = _3583;
    out.m_87.y = _3585;
    bool _3633 = !_2521;
    float _3635 = _3633 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3637 = _3635;
    float _3639 = _3227;
    float _3641 = as_type<float>(_3049);
    float _3643 = as_type<float>(_3309);
    float _3645 = as_type<float>(_3311);
    if (_2821)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3647 = -_2945;
    float _3649 = fma(_3647, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2359);
    float _3651 = -_2949;
    float _3653 = fma(_3651, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2739);
    float _3655 = -_3505;
    float _3657 = fma(_3655, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2749);
    float _3659 = _3097 * (-2.0);
    float _3661 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3663 = _3649 + _3661;
    float _3665 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3667 = _3653 + _3665;
    float _3669 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3671 = _3657 + _3669;
    int _3673 = abs(as_type<int>(_3635));
    float _3675 = _3663 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3677 = _1145 + (-0.5);
    float _3679 = float(_2447);
    float _3681 = _3663;
    float _3683 = _3653;
    if (_3595)
    {
        float _3685 = _3631 * _3613;
        _148 = _3685;
    }
    float _3687 = _148;
    float _3689 = fma(_3667, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3675);
    float _3691 = fma(_3659, _3597, _3597);
    float _3693 = float(_3673);
    float _3695 = fma(_3629, _3659, _3629);
    float _3697 = fma(_3671, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3689);
    float _3699 = fma(_3677, (*spvDescriptorSet0.vp_c9)._m0[196].x, _3691);
    float _3701 = -_3505;
    float _3703 = fma(_3701, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2803);
    float _3705 = _3693 * _3679;
    float _3707 = _1048 + (-0.5);
    bool _3709 = _3697 >= 0.0;
    float _3711 = fma(_3695, _3687, _3699);
    float _3713 = _3705 * (-2.0);
    float _3715 = fma(_3703, _3703, _2991);
    float _3717 = _3711 * 0.15915493667125701904296875;
    float _3719 = fma(_3713, _3599, _3599);
    int _3721 = abs(_3627);
    float _3723 = fma(_2577, _3713, _2577);
    float _3725 = sqrt(_3715);
    float _3727 = fma(_3707, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3719);
    float _3729 = _3723;
    if (_3709)
    {
        _3637 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3731 = _3637;
    int _3733 = as_type<int>(_3731);
    if (_3709)
    {
        out.m_57.x = 0.0;
    }
    float _3735 = float(_2573);
    float _3737 = fma(_3723, _3687, _3727);
    float _3739 = _3717 * 6.283185482025146484375;
    float _3741 = sin(_3739);
    if (_3709)
    {
        float _3743 = _3731 * 5.0;
        _3733 = as_type<int>(_3743);
    }
    int _3745 = _3733;
    float _3747 = float(_3721);
    if (_3709)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10870 = as_type<float>(_3745);
        out.gl_Position.z = _10870;
    }
    float _3749 = _3747 * _3735;
    float _3751 = _3717 * 6.283185482025146484375;
    float _3753 = cos(_3751);
    if (_3709)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3755 = -_2359;
    float _3757 = _3755 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3759 = -_2739;
    float _3761 = _3759 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3763 = -_2749;
    float _3765 = _3763 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3767 = _1145 + _1939;
    float _3769 = _3757 * _3757;
    float _3771 = _1939 + (-0.5);
    float _3773 = _3737 * 0.15915493667125701904296875;
    float _3775 = _3767 + (-1.0);
    float _3777 = fma(_3761, _3761, _3769);
    float _3779 = _3749 * (-2.0);
    float _3781 = _3773 * 6.283185482025146484375;
    float _3783 = sin(_3781);
    float _3785 = fma(_3775, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3787 = fma(_3765, _3765, _3777);
    float _3789 = fma(_3779, _3601, _3601);
    float _3791 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3793 = fma(_3785, _3779, _3785);
    float _3795 = _2895 * _3725;
    float _3797 = fma(_3771, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3789);
    float _3799 = rsqrt(_3787);
    float _3801 = _3795 * _3791;
    float _3803 = fma(_3793, _3687, _3797);
    float _3805 = _3803 * 0.15915493667125701904296875;
    float _3807 = _3773 * 6.283185482025146484375;
    float _3809 = cos(_3807);
    float _3811 = in.m_89.x;
    float _3813 = in.m_89.y;
    float _3815 = in.m_89.z;
    float _3817 = _3753 * _3783;
    float _3819 = _3761 * _3799;
    float _3821 = _3757 * _3799;
    float _3823 = _3765 * _3799;
    float _3825 = _3805 * 6.283185482025146484375;
    float _3827 = sin(_3825);
    float _3829 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3831 = _3819 * _3829;
    float _3833 = _3741 * _3783;
    float _3835 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3837 = _3823 * _3835;
    float _3839 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3841 = -_3831;
    float _3843 = fma(_3823, _3839, _3841);
    float _3845 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3847 = _3821 * _3845;
    float _3849 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3851 = -_3837;
    float _3853 = fma(_3821, _3849, _3851);
    float _3855 = _3805 * 6.283185482025146484375;
    float _3857 = cos(_3855);
    float _3859 = _3843 * _3843;
    float _3861 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3863 = -_3847;
    float _3865 = fma(_3819, _3861, _3863);
    float _3867 = _3753 * _3809;
    float _3869 = _690 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3871 = fma(_3853, _3853, _3859);
    float _3873 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3875 = _3741 * _3809;
    float _3877 = fma(_3827, _3867, _3833);
    float _3879 = fma(_3865, _3865, _3871);
    float _3881 = fma(_3827, _3833, _3867);
    float _3883 = _3795 * _3873;
    float _3885 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3813);
    float _3887 = rsqrt(_3879);
    float _3889 = _3885 * _3883;
    float _3891 = _3795 * _3869;
    float _3893 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3815);
    float _3895 = _3753 * _3857;
    float _3897 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3811);
    float _3899 = _3741 * _3857;
    float _3901 = _3893 * _3801;
    float _3903 = _3895 * _3889;
    float _3905 = _3897 * _3891;
    float _3907 = -_3817;
    float _3909 = fma(_3827, _3875, _3907);
    float _3911 = -_3875;
    float _3913 = fma(_3827, _3817, _3911);
    float _3915 = -_3889;
    float _3917 = _3827 * _3915;
    float _3919 = _3809 * _3857;
    float _3921 = fma(_3877, _3905, _3903);
    float _3923 = _3783 * _3857;
    float _3925 = _3853 * _3887;
    float _3927 = _3843 * _3887;
    float _3929 = _3865 * _3887;
    float _3931 = _3899 * _3889;
    float _3933 = _3821 * _3925;
    float _3935 = _3823 * _3927;
    float _3937 = fma(_3919, _3905, _3917);
    float _3939 = fma(_3913, _3901, _3921);
    float _3941 = -_3933;
    float _3943 = fma(_3819, _3927, _3941);
    float _3945 = -_3935;
    float _3947 = fma(_3821, _3929, _3945);
    float _3949 = fma(_3909, _3905, _3931);
    float _3951 = fma(_3923, _3901, _3937);
    float _3953 = _3943 * _3939;
    float _3955 = _3947 * _3939;
    float _3957 = fma(_3881, _3901, _3949);
    float _3959 = _3819 * _3929;
    float _3961 = fma(_3929, _3951, _3953);
    float _3963 = fma(_3925, _3951, _3955);
    float _3965 = -_3959;
    float _3967 = fma(_3823, _3925, _3965);
    float _3969 = fma(_3823, _3957, _3961);
    float _3971 = fma(_3819, _3957, _3963);
    float _3973 = _3967 * _3939;
    float _3975 = _2749 + _3969;
    float _3977 = _2739 + _3971;
    float _3979 = fma(_3927, _3951, _3973);
    float _3981 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3983 = _3975 + _3981;
    float _3985 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3987 = _3977 + _3985;
    float _3989 = fma(_3821, _3957, _3979);
    float _3991 = _3983 * _3983;
    float _3993 = _3987 * _3987;
    float _3995 = _2359 + _3989;
    float _3997 = _3993 + _3991;
    float _3999 = sqrt(_3997);
    bool _4001 = _3999 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4003 = _3977;
    float _4005 = _3975;
    float _4007 = _3993;
    float _4009 = _3991;
    if (!_4001)
    {
        _3639 = _3995;
    }
    float _4011 = _3639;
    bool _4013 = !_4001;
    float _4015 = _4011;
    if (!_4013)
    {
        float _4017 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4019 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4021 = _3999 + _4019;
        float _4023 = rsqrt(_3997);
        float _4025 = _4021 * _4017;
        float _4027 = _3995 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4029 = _4025 * 0.15915493667125701904296875;
        float _4031 = _4029 * 6.283185482025146484375;
        float _4033 = sin(_4031);
        float _4035 = _4029 * 6.283185482025146484375;
        float _4037 = cos(_4035);
        float _4039 = fma(_4033, _4027, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4041 = _4023 * _4039;
        float _4043 = _4037 + (-1.0);
        float _4045 = fma(_3987, _4041, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4047 = fma(_3983, _4041, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4049 = _4043 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4053 = _4045 + _4051;
        float _4055 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4057 = _4047 + _4055;
        float _4059 = fma(_3995, _4037, _4049);
        float _4061 = _4053 * _4053;
        float _4063 = _4057 * _4057;
        _4003 = _4045;
        _4005 = _4047;
        _4015 = _4059;
        _4007 = _4061;
        _4009 = _4063;
    }
    float _4065 = _4003;
    float _4067 = _4005;
    float _4069 = _4015;
    float _4071 = _4007;
    float _4073 = _4009;
    float _4075 = fma(_4065, 6.2500002968590706586837768554688e-05, 0.5);
    float _4077 = fma(_4067, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _11377 = float2(_4075, _4077);
    float3 _4081 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_11377, float2(0.0), isnan(_11377)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_11377, float2(0.0), isnan(_11377)), level(0.0)).xyz;
    float _4083 = _4081.x;
    float _4085 = _4081.y;
    float _4087 = _4081.z;
    float _4089 = in.m_91.x;
    float _4091 = in.m_91.y;
    float _4093 = in.m_91.z;
    bool _4095 = _3813 != 0.0;
    bool _4097 = isnan(_3813);
    bool _4099 = _4095 || _4097;
    bool _4101 = isnan(0.0);
    bool _4103 = _4099 || _4101;
    float _4105 = _3895 * _3947;
    float _4107 = _3895 * _3967;
    float _4109 = in.m_93.x;
    float _4111 = in.m_93.y;
    float _4113 = in.m_93.z;
    float _4115 = in.m_93.w;
    bool _4117 = _3811 == 0.0;
    bool _4119 = !_4103;
    bool _4121 = _4117 && _4119;
    float _4123 = _3877 * _3943;
    float _4125 = _3895 * _3943;
    float _4127 = _3913 * _3943;
    bool _4129 = _3815 == 0.0;
    bool _4131 = _4129 && _4121;
    float _4133 = -_3827;
    float _4135 = fma(_4133, _3925, _4105);
    float _4137 = -_3827;
    float _4139 = fma(_4137, _3927, _4107);
    float _4141 = -_3827;
    float _4143 = fma(_4141, _3929, _4125);
    float _4145 = fma(_3923, _3929, _4127);
    float _4147 = fma(_3881, _3823, _4145);
    float _4149 = _4089;
    if (_4131)
    {
        _3641 = _4089;
    }
    float _4151 = _3641;
    float _4153 = _4151;
    if (_4131)
    {
        _2889 = _4093;
    }
    float _4155 = _2889;
    float _4157 = _4155;
    if (_4131)
    {
        _3643 = _4091;
    }
    float _4159 = _3643;
    float _4161 = _4159;
    if (_4131)
    {
        _3729 = _4151;
    }
    float _4163 = _3729;
    float _4165 = _4163;
    if (!_4131)
    {
        _4153 = _4089;
    }
    float _4167 = _4153;
    if (_4131)
    {
        _3645 = _4155;
    }
    float _4169 = _3645;
    float _4171 = _4169;
    if (!_4131)
    {
        _4157 = _4093;
    }
    float _4173 = _4157;
    if (!_4131)
    {
        float _4175 = fma(_3811, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4167);
        _4165 = _4175;
    }
    float _4177 = _4165;
    if (_4131)
    {
        _4149 = _4159;
    }
    float _4179 = _4149;
    float _4181 = _4113 * _4167;
    float _4183 = _4179;
    if (!_4131)
    {
        _4161 = _4091;
    }
    float _4185 = _4161;
    float _4187 = _4111 * _4173;
    if (!_4131)
    {
        float _4189 = fma(_3815, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4173);
        _4171 = _4189;
    }
    float _4191 = _4171;
    float _4193 = -_4181;
    float _4195 = fma(_4109, _4173, _4193);
    float _4197 = _4109 * _4185;
    if (!_4131)
    {
        float _4199 = fma(_3813, (*spvDescriptorSet0.vp_c9)._m0[17].y, _4185);
        _4183 = _4199;
    }
    float _4201 = _4183;
    float _4203 = -_4187;
    float _4205 = fma(_4113, _4185, _4203);
    float _4207 = _3877 * _3947;
    float _4209 = -_4197;
    float _4211 = fma(_4111, _4167, _4209);
    float _4213 = _3913 * _3947;
    float _4215 = _4205 * _4115;
    float _4217 = fma(_3919, _3925, _4207);
    float _4219 = _4211 * _4115;
    float _4221 = _3877 * _3967;
    float _4223 = fma(_3919, _3929, _4123);
    float _4225 = _4195 * _4115;
    float _4227 = fma(_3899, _3819, _4135);
    float _4229 = fma(_3919, _3927, _4221);
    float _4231 = fma(_3923, _3925, _4213);
    float _4233 = fma(_3899, _3821, _4139);
    float _4235 = fma(_3909, _3819, _4217);
    float _4237 = fma(_3909, _3821, _4229);
    float _4239 = fma(_3909, _3823, _4223);
    float _4241 = fma(_3899, _3823, _4143);
    float _4243 = fma(_3881, _3819, _4231);
    float _4245 = _4227 * _4111;
    float _4247 = _4233 * _4111;
    float _4249 = _4227 * _4201;
    float _4251 = _4233 * _4201;
    float _4253 = _4225 * _4227;
    float _4255 = _4225 * _4233;
    float _4257 = _4241 * _4111;
    float _4259 = _4241 * _4201;
    float _4261 = _4225 * _4241;
    float _4263 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4265 = _4069 + _4263;
    float _4267 = _3913 * _3967;
    float _4269 = fma(_4237, _4109, _4247);
    float _4271 = fma(_4235, _4177, _4249);
    float _4273 = fma(_4265, _4265, _4071);
    float _4275 = fma(_3923, _3927, _4267);
    float _4277 = fma(_4235, _4109, _4245);
    float _4279 = fma(_4215, _4235, _4253);
    float _4281 = _4273 + _4073;
    float _4283 = fma(_3881, _3821, _4275);
    float _4285 = fma(_4215, _4237, _4255);
    float _4287 = fma(_4239, _4109, _4257);
    float _4289 = fma(_4237, _4177, _4251);
    float _4291 = fma(_4239, _4177, _4259);
    float _4293 = sqrt(_4281);
    float _4295 = fma(_4215, _4239, _4261);
    float _4297 = fma(_4243, _4113, _4277);
    float _4299 = fma(_4283, _4113, _4269);
    float _4301 = fma(_4243, _4191, _4271);
    float _4303 = fma(_4219, _4243, _4279);
    float _4305 = fma(_4219, _4283, _4285);
    float _4307 = fma(_4147, _4113, _4287);
    float _4309 = fma(_4219, _4147, _4295);
    float _4311 = fma(_4283, _4191, _4289);
    float _4313 = fma(_4147, _4191, _4291);
    out.m_95.x = _4297;
    out.m_95.y = _4299;
    out.m_95.z = _4307;
    out.m_97.x = _4303;
    out.m_97.y = _4305;
    out.m_97.z = _4309;
    bool _4315 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4317 = isnan(_4293);
    bool _4319 = _4315 || _4317;
    bool _4321 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4323 = _4319 || _4321;
    out.m_99.x = _4301;
    out.m_99.y = _4311;
    out.m_99.z = _4313;
    float _4325 = _4237;
    if (!_4323)
    {
        _4325 = 1.0;
    }
    float _4327 = _4325;
    out.m_101.x = _4083;
    out.m_101.y = _4085;
    out.m_101.z = _4087;
    bool _4329 = !_4323;
    float _4331 = _4327;
    if (!_4329)
    {
        bool _4333 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4335 = isnan(_4293);
        bool _4337 = _4333 || _4335;
        bool _4339 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4341 = _4337 || _4339;
        if (!_4341)
        {
            float _4343 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4345 = _4293 + _4343;
            float _4347 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4349 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4347;
            float _4351 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4353 = _4351 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4355 = 1.0 / _4349;
            float _4357 = _4345 * _4355;
            float _4359 = fma(_4357, _4353, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4331 = _4359;
            _4361 = true;
        }
        else
        {
            bool _4363 = _4293 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4365 = isnan(_4293);
            bool _4367 = _4363 || _4365;
            bool _4369 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4371 = _4367 || _4369;
            if (!_4371)
            {
                float _4373 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4375 = _4293 + _4373;
                float _4377 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4379 = _4377 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4381 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4383 = _4381 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4385 = 1.0 / _4379;
                float _4387 = _4375 * _4385;
                float _4389 = fma(_4387, _4383, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4331 = _4389;
                _4361 = true;
            }
            else
            {
                _4331 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4361 = false;
    float _4391 = _4331;
    float _4393 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4395 = _4069 + _4393;
    float _4397 = _3649 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4399 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4401 = _4065 + _4399;
    float _4403 = fma(_4395, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4405 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4397);
    float _4407 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4409 = _4067 + _4407;
    float _4411 = fma(_4401, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4413 = -_2359;
    float _4415 = _4413 + _4403;
    float _4417 = fma(_3657, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4405);
    float _4419 = fma(_4409, _4391, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4421 = -_2739;
    float _4423 = _4421 + _4411;
    float _4425 = _4415 * _4415;
    float _4427 = _4417 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4429 = _3649 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4431 = -_2749;
    float _4433 = _4431 + _4419;
    float _4435 = fma(_4423, _4423, _4425);
    float _4437 = 1.0 / _4427;
    float _4439 = fma(_3653, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4429);
    float _4441 = fma(_4433, _4433, _4435);
    float _4443 = fma(_3657, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4439);
    float _4445 = sqrt(_4441);
    float _4447 = _4443 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4449 = _4447 + _4427;
    float _4451 = _4449 * _4437;
    float _4453 = _4451 * 0.5;
    float _4455 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4457 = fma(_4453, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4455);
    bool _4459 = _4445 > 0.0;
    float _4461 = 1.0 / _4457;
    bool _4463 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _4465 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _4467 = _4463 || _4465;
    bool _4469 = isnan(0.5);
    bool _4471 = _4467 || _4469;
    bool _4473 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4475 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan(0.5);
    bool _4481 = _4477 || _4479;
    float _4483 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _4485 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _4487 = _4411;
    float _4489 = _4403;
    if (!_4459)
    {
        _4483 = _4403;
    }
    float _4491 = _4483;
    float _4493 = _4491;
    if (!_4459)
    {
        _4485 = _4419;
    }
    float _4495 = _4485;
    bool _4497 = !_4459;
    float _4499 = _4495;
    if (!_4497)
    {
        float _4501 = _230 * _230;
        float _4503 = fma(_226, _226, _4501);
        float _4505 = fma(_232, _232, _4503);
        float _4507 = rsqrt(_4441);
        float _4509 = sqrt(_4505);
        float _4511 = _4423 * _4507;
        float _4513 = _4415 * _4507;
        float _4515 = _4433 * _4507;
        bool _4517 = _4509 > 0.0;
        float _4519 = _4509;
        float _4521 = _4507;
        if (!_4517)
        {
            _4519 = _4403;
        }
        float _4523 = _4519;
        _4493 = _4523;
        if (!_4517)
        {
            _4521 = _4419;
        }
        float _4525 = _4521;
        bool _4527 = !_4517;
        _4499 = _4525;
        if (!_4527)
        {
            float _4529 = rsqrt(_4505);
            float _4531 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _4533 = _230 * _4529;
            float _4535 = _226 * _4529;
            float _4537 = _232 * _4529;
            float _4539 = _4513 * _4533;
            float _4541 = fma(_4511, _4535, _4539);
            float _4543 = _4531 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _4545 = fma(_4515, _4537, _4541);
            float _4547 = _4545 * _4543;
            float _4549 = fma(_226, _4547, _4411);
            float _4551 = fma(_230, _4547, _4403);
            float _4553 = fma(_232, _4547, _4419);
            _4487 = _4549;
            _4493 = _4551;
            _4499 = _4553;
        }
    }
    float _4555 = _4487;
    float _4557 = _4493;
    float _4559 = _4499;
    float _4561 = -_2949;
    float _4563 = fma(_4561, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4555);
    float _4565 = -_2945;
    float _4567 = fma(_4565, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4557);
    float _4569 = -_3505;
    float _4571 = fma(_4569, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4559);
    float _4573 = _4567;
    float _4575 = _4563;
    float _4577 = _4571;
    if (_4471)
    {
        _4489 = 1.0;
    }
    float _4579 = _4489;
    float _4581 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4583 = _4461 * _4581;
    float _4585 = _4579;
    if (!_4481)
    {
        float _4587 = _3663 * _3663;
        float _4589 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4591 = -_2749;
        float _4593 = _4591 + _4559;
        float _4595 = -_2359;
        float _4597 = _4595 + _4557;
        float _4599 = fma(_3667, _3667, _4587);
        float _4601 = -_2739;
        float _4603 = _4601 + _4555;
        float _4605 = fma(_3671, _3671, _4599);
        float _4607 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4609 = sqrt(_4605);
        float _4611 = 1.0 / _3795;
        float _4613 = _4607 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4615 = precise::min(_4609, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4617 = _4615 * _4589;
        float _4619 = _4617 * _4611;
        float _4621 = _4613 * _4619;
        float _4623 = _4593 * _4619;
        float _4625 = fma(_4597, _4621, _3649);
        float _4627 = fma(_4603, _4621, _3653);
        float _4629 = fma(_4613, _4623, _3657);
        _4573 = _4625;
        _4575 = _4627;
        _4577 = _4629;
        _3681 = _4609;
    }
    float _4631 = _4573;
    float _4633 = _4575;
    float _4635 = _4577;
    float _4637 = _3681;
    float _4639 = _4637;
    if (!_4471)
    {
        float _4641 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _4643 = _4641 * 0.15915493667125701904296875;
        float _4645 = _4643 * 6.283185482025146484375;
        float _4647 = cos(_4645);
        float _4649 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _4651 = _4649 * 0.15915493667125701904296875;
        float _4653 = _4643 * 6.283185482025146484375;
        float _4655 = sin(_4653);
        float _4657 = 1.0 / _4647;
        float _4659 = _4651 * 6.283185482025146484375;
        float _4661 = cos(_4659);
        float _4663 = _4655 * _4657;
        float _4665 = _4651 * 6.283185482025146484375;
        float _4667 = sin(_4665);
        float _4669 = _4661 * _4663;
        float _4671 = 1.0 / _4669;
        float _4673 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4675 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _4673;
        float _4677 = 1.0 / _4675;
        float _4679 = _4667 * _4671;
        float _4681 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _4683 = fma(_4583, _4679, _4681);
        float _4685 = _4683 * _4677;
        float _4687 = precise::clamp(_4685, 0.0, 1.0);
        _4639 = _4683;
        _4585 = _4687;
    }
    float _4689 = _4639;
    float _4691 = _4585;
    float _4693 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4695 = _4631 + _4693;
    float _4697 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4699 = _4633 + _4697;
    float _4701 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4703 = _4635 + _4701;
    float _4705 = _4695 * _4695;
    float _4707 = fma(_4699, _4699, _4705);
    float _4709 = fma(_4703, _4703, _4707);
    float _4711 = rsqrt(_4709);
    float _4713 = sqrt(_4709);
    float _4715 = _4711 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4717 = _4699 * _4715;
    float _4719 = _4703 * _4715;
    float _4721 = _4717 * _4717;
    float _4723 = _4719 * _4719;
    float _4725 = _4721 + _4723;
    float _4727 = sqrt(_4725);
    bool _4729 = _4727 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4731 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4733 = _4727 + _4731;
    float _4735 = _4711;
    float _4737 = _4733;
    float _4739 = _4695;
    if (_4729)
    {
        float _4741 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4735 = _4741;
    }
    float _4743 = _4735;
    float _4745 = _4743;
    if (_4729)
    {
        float _4747 = _4733 * _4743;
        _4737 = _4747;
    }
    float _4749 = _4737;
    if (_4729)
    {
        float _4751 = rsqrt(_4725);
        _4745 = _4751;
    }
    float _4753 = _4745;
    float _4755 = _4753;
    if (_4729)
    {
        float _4757 = _4749 * 0.15915493667125701904296875;
        _2853 = _4757;
    }
    float _4759 = _2853;
    float _4761 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4763 = _4703;
    float _4765 = _4759;
    if (_4729)
    {
        float _4767 = _4759 * 6.283185482025146484375;
        float _4769 = sin(_4767);
        _4763 = _4769;
    }
    float _4771 = _4763;
    float _4773 = precise::max(0.0, _4761);
    float _4775 = _4689;
    if (_4729)
    {
        float _4777 = _4759 * 6.283185482025146484375;
        float _4779 = cos(_4777);
        _4775 = _4779;
    }
    float _4781 = _4775;
    float _4783 = -_4715;
    float _4785 = -_4773;
    float _4787 = fma(_4695, _4783, _4785);
    float _4789 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_4729)
    {
        float _4791 = _4787 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4739 = _4791;
    }
    float _4793 = _4739;
    float _4795 = fma(_3653, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4797 = _4771;
    float _4799 = _4793;
    if (_4729)
    {
        float _4801 = fma(_4771, _4793, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4797 = _4801;
    }
    float _4803 = _4797;
    float _4805 = _4803;
    if (!_4729)
    {
        _4799 = _4787;
    }
    float _4807 = _4799;
    float _4809 = floor(_4795);
    float _4811 = _4807;
    if (_4729)
    {
        float _4813 = _4753 * _4803;
        _3683 = _4813;
    }
    float _4815 = _3683;
    if (!_4729)
    {
        _4755 = _4717;
    }
    float _4817 = _4755;
    float _4819 = _4817;
    float _4821 = _4781;
    if (_4729)
    {
        float _4823 = _4781 + (-1.0);
        _4789 = _4823;
    }
    float _4825 = _4789;
    float _4827 = _4825;
    if (_4729)
    {
        float _4829 = _4717 * _4815;
        _4819 = _4829;
    }
    float _4831 = _4819;
    if (!_4729)
    {
        _4805 = _4721;
    }
    float _4833 = _4805;
    float _4835 = _4833;
    if (_4729)
    {
        float _4837 = _4825 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4765 = _4837;
    }
    float _4839 = _4765;
    if (!_4729)
    {
        _4827 = _4719;
    }
    float _4841 = _4827;
    float _4843 = _4841;
    if (_4729)
    {
        float _4845 = _4719 * _4815;
        _4843 = _4845;
    }
    float _4847 = _4843;
    if (_4729)
    {
        float _4849 = _4831 * _4831;
        _4835 = _4849;
    }
    float _4851 = _4835;
    if (_4729)
    {
        float _4853 = fma(_4787, _4781, _4839);
        _4811 = _4853;
    }
    float _4855 = _4811;
    if (!_4729)
    {
        _4821 = _4723;
    }
    float _4857 = _4821;
    float _4859 = _4857;
    if (_4729)
    {
        float _4861 = _4847 * _4847;
        _4859 = _4861;
    }
    float _4863 = _4859;
    float _4865 = fma(_4855, _4855, _4851);
    float _4867 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4869 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4871 = _4865 + _4863;
    float _4873 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4867);
    float _4875 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4877 = fma(_4713, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4875);
    float _4879 = precise::clamp(_4877, 0.0, 1.0);
    float _4881 = rsqrt(_4871);
    float _4883 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4873);
    float _4885 = -_4879;
    float _4887 = _4885 + 1.0;
    float _4889 = fma(_3657, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4891 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4893 = _4883 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4895 = -_4809;
    float _4897 = _4795 + _4895;
    float _4899 = abs(_4887);
    float _4901 = log2(_4899);
    float _4903 = _4893 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4905 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4907 = -_4903;
    float _4909 = fma(_4907, _4891, 1.0);
    float _4911 = _4631 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4913 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4905);
    float _4915 = _4881 * _4831;
    float _4917 = _4881 * _4855;
    float _4919 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4911);
    float _4921 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4913);
    float _4923 = _4881 * _4847;
    float _4925 = _4915 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4927 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4919);
    float _4929 = _4921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4931 = fma(_4633, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4869);
    float _4933 = -_4925;
    float _4935 = fma(_4917, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4933);
    float _4937 = _4927 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4939 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4941 = floor(_4889);
    float _4943 = -_4923;
    float _4945 = fma(_4943, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4935);
    float _4947 = fma(_4635, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4931);
    float _4949 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4939);
    float _4951 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4953 = fma(_4945, -0.5, 0.5);
    float _4955 = _4947 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4957 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4949);
    float _4959 = exp2(_4951);
    float _4961 = fma(_4945, 0.5, 0.5);
    float _4963 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4957);
    float _4965 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4967 = log2(_4909);
    float _4969 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4971 = -_4941;
    float _4973 = _4889 + _4971;
    float _4975 = fma(_4961, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4977 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4965);
    float _4979 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4969);
    float _4981 = _4917 + 1.0;
    float _4983 = fma(_4961, _4975, -0.212114393711090087890625);
    float _4985 = 1.0 / _4963;
    float _4987 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4977);
    float _4989 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4979);
    float _4991 = -_4917;
    float _4993 = fma(_4959, _4981, _4991);
    float _4995 = fma(_4961, _4983, 1.570728778839111328125);
    float _4997 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4987);
    float _4999 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4989);
    float _5001 = sqrt(_4953);
    float _5003 = _4967 * 0.693147182464599609375;
    float _5005 = _5003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _5007 = _4997 * _4985;
    float _5009 = _4999 * _4985;
    float2 _12927 = float2(_4897, _4973);
    float _5011 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_12927, float2(0.0), isnan(_12927)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_12927, float2(0.0), isnan(_12927)), level(0.0)).x;
    float _5013 = fma(_5007, 0.5, 0.5);
    float _5015 = fma(_5009, -0.5, 0.5);
    float _5017 = _5001 * 0.636619746685028076171875;
    float3 _12943 = float3(_5013, _5015, _5005);
    float _5019 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_12943, float3(0.0), isnan(_12943)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_12943, float3(0.0), isnan(_12943)), level(0.0)).x;
    float3 _12954 = float3(_5013, _5015, _5005);
    float4 _5022 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_12954, float3(0.0), isnan(_12954)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_12954, float3(0.0), isnan(_12954)), level(0.0)).xyzw;
    float _5024 = _5022.x;
    float _5026 = _5022.y;
    float _5028 = _5022.z;
    float _5030 = _5022.w;
    float _5032 = -_4995;
    float _5034 = fma(_5017, _5032, 1.0);
    float _5036 = fma(_4993, 0.5, 0.5);
    float2 _12977 = float2(_5034, _5036);
    float3 _5038 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_12977, float2(0.0), isnan(_12977)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_12977, float2(0.0), isnan(_12977)), level(0.0)).xyz;
    float _5040 = _5038.x;
    float _5042 = _5038.y;
    float _5044 = _5038.z;
    float _5046 = abs(_4583);
    float _5048 = log2(_5046);
    float _5050 = _4929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _5052 = _4901 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _5054 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _5056 = isnan(_4713);
    bool _5058 = _5054 || _5056;
    bool _5060 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _5062 = _5058 || _5060;
    float _5064 = fma(_4937, (*spvDescriptorSet0.vp_c8)._m0[6].x, _5050);
    float _5066 = _4963 * 0.5;
    bool _5068 = _4583 <= 8000.0;
    bool _5070 = isnan(_4583);
    bool _5072 = _5068 || _5070;
    bool _5074 = isnan(8000.0);
    bool _5076 = _5072 || _5074;
    float _5078 = float(_5076);
    float _5080 = fma(_4893, (*spvDescriptorSet0.vp_c8)._m0[6].z, _5064);
    float _5082 = exp2(_5052);
    float _5084 = fma(_4955, (*spvDescriptorSet0.vp_c8)._m0[6].w, _5080);
    float _5086 = _4997 + _4963;
    float _5088 = _5048 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _5090 = in.m_103.x;
    out.gl_Position.x = _4997;
    out.gl_Position.y = _4999;
    out.gl_Position.z = _5084;
    out.gl_Position.w = _4963;
    float _5092 = exp2(_5088);
    float _5094 = -_5082;
    float _5096 = _5094 + 1.0;
    float _5098 = _5086 * 0.5;
    float _5100 = _5096 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _5102 = -_5100;
    float _5104 = _5102 + 1.0;
    float _5106 = fma(_5092, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _5108 = precise::clamp(_5106, 0.0, 1.0);
    float _5110 = fma(_4999, -0.5, _5066);
    float _5112 = fma(_5108, -2.0, 3.0);
    float _5114 = _5108 * _5108;
    float _5116 = _4999;
    float _5118 = _4963;
    float _5120 = _5084;
    float _5122 = _5104;
    if (!_5062)
    {
        _5116 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _5124 = _5116;
    float _5126 = _5114 * _5112;
    float _5128 = -_5126;
    float _5130 = _5128 + 1.0;
    float _5132 = fma(_5130, (*spvDescriptorSet0.vp_c15)._m0[654].w, _5126);
    float _5134 = _5084 + _4963;
    float _5136 = _5124;
    float _5138 = _5124;
    if (!_5062)
    {
        _5118 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _5140 = _5118;
    float _5142 = _5078 * _5132;
    float _5144 = _5134 * 0.5;
    float _5146 = _5140;
    float _5148 = _5140;
    if (!_5062)
    {
        _5120 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _5150 = _5120;
    float _5152 = _5142 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_105.x = _5098;
    out.m_105.y = _5110;
    out.m_105.z = _5144;
    out.m_105.w = _4963;
    float _5154 = -_5011;
    float _5156 = _5154 + 1.0;
    float _5158 = _5156 * _5152;
    float _5160 = precise::clamp(_5158, 0.0, 1.0);
    float _5162 = _5100 * _5019;
    float _5164 = -_5160;
    float _5166 = fma(_5164, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _5168 = _5030 * _5162;
    float _5170 = _5166 * _5090;
    float _5172 = _5044 * _5162;
    float _5174 = fma(_5040, _5168, _5024);
    float _5176 = fma(_5042, _5168, _5026);
    float _5178 = _5170 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _5180 = _5030 * _5104;
    float _5182 = fma(_5030, _5172, _5028);
    float _5184 = _4691 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _5186 = _5168;
    float _5188 = _5170;
    float _5190 = _5150;
    float _5192 = _5150;
    if (!_5062)
    {
        _5186 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _5194 = _5186;
    out.m_107.x = _5178;
    float _5196 = _5194;
    float _5198 = _5194;
    if (!_5062)
    {
        _5122 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _5200 = _5122;
    float _5202 = _5200;
    float _5204 = _5200;
    if (!_5062)
    {
        _5188 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _5206 = _5188;
    out.m_109.x = _5174;
    out.m_109.y = _5176;
    out.m_109.z = _5182;
    out.m_109.w = _5180;
    bool _5208 = !_5062;
    float _5210 = _5206;
    float _5212 = _5206;
    if (!_5208)
    {
        bool _5214 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _5216 = isnan(_4713);
        bool _5218 = _5214 || _5216;
        bool _5220 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _5222 = _5218 || _5220;
        if (!_5222)
        {
            float _5224 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5226 = _4713 + _5224;
            float _5228 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _5230 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _5228;
            float _5232 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _5234 = _5232 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _5236 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _5238 = _5236 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _5240 = 1.0 / _5230;
            float _5242 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _5244 = _5242 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _5246 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _5248 = _5246 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _5250 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _5252 = _5250 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _5254 = _5226 * _5240;
            float _5256 = precise::clamp(_5254, 0.0, 1.0);
            float _5258 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _5260 = _5258 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _5262 = fma(_5256, _5234, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _5264 = fma(_5256, _5238, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _5266 = fma(_5256, _5260, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _5268 = fma(_5256, _5244, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _5270 = fma(_5256, _5248, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _5272 = fma(_5256, _5252, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _5204 = _5262;
            _5148 = _5270;
            _5138 = _5264;
            _5198 = _5268;
            _5212 = _5266;
            _5192 = _5272;
            _5274 = true;
        }
        else
        {
            bool _5276 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _5278 = isnan(_4713);
            bool _5280 = _5276 || _5278;
            bool _5282 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _5284 = _5280 || _5282;
            if (!_5284)
            {
                _5196 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _5286 = _5196;
            _5198 = _5286;
            if (!_5284)
            {
                _5146 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _5288 = _5146;
            _5148 = _5288;
            if (!_5284)
            {
                _5190 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _5290 = _5190;
            _5192 = _5290;
            if (!_5284)
            {
                _5136 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _5292 = _5136;
            _5138 = _5292;
            if (!_5284)
            {
                _5202 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _5294 = _5202;
            _5204 = _5294;
            if (!_5284)
            {
                _5210 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _5296 = _5210;
            bool _5298 = !_5284;
            _5212 = _5296;
            if (!_5298)
            {
                bool _5300 = _4713 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _5302 = isnan(_4713);
                bool _5304 = _5300 || _5302;
                bool _5306 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _5308 = _5304 || _5306;
                if (!_5308)
                {
                    float _5310 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5312 = _4713 + _5310;
                    float _5314 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _5316 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _5314;
                    float _5318 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _5320 = _5318 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _5322 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _5324 = _5322 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _5326 = 1.0 / _5316;
                    float _5328 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _5330 = _5328 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _5332 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _5334 = _5332 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _5336 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _5338 = _5336 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _5340 = _5312 * _5326;
                    float _5342 = precise::clamp(_5340, 0.0, 1.0);
                    float _5344 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _5346 = _5344 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _5348 = fma(_5342, _5320, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _5350 = fma(_5342, _5324, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _5352 = fma(_5342, _5346, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _5354 = fma(_5342, _5330, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _5356 = fma(_5342, _5334, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _5358 = fma(_5342, _5338, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _5204 = _5348;
                    _5148 = _5356;
                    _5138 = _5350;
                    _5198 = _5354;
                    _5212 = _5352;
                    _5192 = _5358;
                    _5274 = true;
                }
                else
                {
                    _5204 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _5148 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _5138 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _5198 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _5212 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _5192 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _5274 = false;
    float _5360 = _5204;
    float _5362 = _5148;
    float _5364 = _5138;
    float _5366 = _5198;
    float _5368 = _5212;
    float _5370 = _5192;
    float _5372 = _5184 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _5374 = fma(_4311, -0.5, 0.5);
    float _5376 = precise::clamp(_5374, 0.0, 1.0);
    float _5378 = -_5360;
    float _5380 = _5362 + _5378;
    float _5382 = -_5364;
    float _5384 = _5366 + _5382;
    out.m_57.x = _5372;
    float _5386 = -_5368;
    float _5388 = _5370 + _5386;
    float _5390 = fma(_5376, _5380, _5360);
    float _5392 = fma(_5376, _5384, _5364);
    bool _5394 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _5396 = _5390 * 0.586610972881317138671875;
    float _5398 = fma(_5376, _5388, _5368);
    out.m_111.x = 0.0;
    bool _5400 = _4691 > 0.0;
    bool _5402 = isnan(_4691);
    bool _5404 = _5400 || _5402;
    bool _5406 = isnan(0.0);
    bool _5408 = _5404 || _5406;
    float _5410 = fma(_5392, 0.298911988735198974609375, _5396);
    float _5412 = fma(_5398, 0.114477999508380889892578125, _5410);
    float _5414 = -_5412;
    float _5416 = _5392 + _5414;
    float _5418 = -_5412;
    float _5420 = _5390 + _5418;
    float _5422 = -_5412;
    float _5424 = _5398 + _5422;
    float _5426 = fma(_5416, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    float _5428 = fma(_5420, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    float _5430 = fma(_5424, (*spvDescriptorSet0.vp_c13)._m0[1].z, _5412);
    bool _5432 = !_5394;
    if (!_5432)
    {
        float _5434 = -_4631;
        float _5436 = _5434 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _5438 = -_4633;
        float _5440 = _5438 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _5442 = -_4635;
        float _5444 = _5442 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _5446 = _5436 * _5436;
        float _5448 = fma(_5440, _5440, _5446);
        float _5450 = fma(_5444, _5444, _5448);
        float _5452 = sqrt(_5450);
        float _5454 = rsqrt(_5450);
        float _5456 = -_5452;
        float _5458 = _5456 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _5460 = _5458 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _5462 = precise::clamp(_5460, 0.0, 1.0);
        float _5464 = _5440 * _5454;
        float _5466 = _5436 * _5454;
        float _5468 = abs(_5462);
        float _5470 = log2(_5468);
        float _5472 = _5444 * _5454;
        float _5474 = _5464 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _5476 = _4311 * _5466;
        float _5478 = -_5466;
        float _5480 = -_5474;
        float _5482 = fma(_5478, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5480);
        float _5484 = fma(_4301, _5464, _5476);
        float _5486 = -_5472;
        float _5488 = fma(_5486, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5482);
        float _5490 = fma(_4313, _5472, _5484);
        float _5492 = precise::clamp(_5490, 0.0, 1.0);
        float _5494 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _5496 = _5488 + _5494;
        float _5498 = _5470 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _5500 = _5496 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _5502 = precise::clamp(_5500, 0.0, 1.0);
        float _5504 = exp2(_5498);
        float _5506 = _5504 * _5502;
        float _5508 = _5492 * _5506;
        float _5510 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _5512 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _5514 = _5508 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_111.x = _5510;
        out.m_111.y = _5512;
        out.m_111.z = _5514;
    }
    out.m_113.x = _5426;
    out.m_113.y = _5428;
    out.m_113.z = _5430;
    if (_5408)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_57.x = 0.0;
    float _5516 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _5516;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

