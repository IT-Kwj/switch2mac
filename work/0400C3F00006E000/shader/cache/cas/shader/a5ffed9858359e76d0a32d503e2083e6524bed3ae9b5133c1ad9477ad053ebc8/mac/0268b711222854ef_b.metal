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
    float4 m_59 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_73 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_99 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_75 [[user(locn6)]];
    float4 m_85 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_83 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_93 [[user(locn11)]];
    float4 m_95 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_89 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_81 [[attribute(11)]];
    float4 m_63 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4860 = false;
    bool _4161 = false;
    bool _696 = false;
    bool _580 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5092 = as_type<float>(_132);
        out.gl_Position.z = _5092;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5162 = as_type<float>(_172);
        out.gl_Position.z = _5162;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_55.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _150 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = 1.0 / _208;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _232 = 1.0 / _216;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _204 + _234;
    bool _238 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_204);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = 1.0 / _212;
    float _252 = _236 * _222;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _204 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = _204 + _258;
    bool _262 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _264 = isnan(_204);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _226;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _204 + _278;
    float _282 = _256 * _232;
    bool _284 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _286 = isnan(_204);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -_272;
    float _298 = _296 + 1.0;
    float _300 = 1.0 / _230;
    float _302 = _280 * _250;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _204 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = fma(_310, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = 1.0 / _220;
    float _316 = _260 * _276;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _318;
    float _322 = fma(_320, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _326 = _204 + _324;
    float _328 = _326 * _300;
    float _330 = -_294;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _306 * _314;
    bool _340 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _342 = isnan(_204);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _272 * _332;
    float _354 = fma(_336, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _356 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_204);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = -_350;
    float _374 = _372 + 1.0;
    float _376 = _350 * _298;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = _366 * _374;
    bool _388 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_204);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -_366;
    float _402 = _400 + 1.0;
    bool _404 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _406 = isnan(_204);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = fma(_380, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = _248 * _402;
    float _420 = -_248;
    float _422 = _420 + 1.0;
    float _424 = -_414;
    float _426 = _424 + 1.0;
    float _428 = fma(_384, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_370, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _414 * _422;
    float _434 = _398 * _426;
    float _436 = -_398;
    float _438 = _436 + 1.0;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = _354 * _434;
    float _450 = _322 * _434;
    float _452 = _312 * _434;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _460 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _472 = fma(_416, _432, _458);
    float _474 = fma(_428, _432, _460);
    float _476 = fma(_430, _432, _462);
    float _478 = fma(_442, _282, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _486 = fma(_466, _282, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = fma(_478, _418, _472);
    float _490 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _500;
    float _504 = fma(_484, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _506 = fma(_480, _418, _476);
    float _508 = fma(_470, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _510 = fma(_486, _418, _474);
    float _512 = fma(_494, _316, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _514 = fma(_498, _316, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _516 = fma(_502, _316, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _518 = fma(_490, _386, _488);
    float _520 = fma(_504, _386, _506);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _530 = fma(_508, _386, _510);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _536 = fma(_512, _376, _518);
    float _538 = fma(_524, _328, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _540 = fma(_528, _328, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _542 = fma(_534, _328, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _544 = fma(_514, _376, _530);
    float _546 = fma(_516, _376, _520);
    float _548 = fma(_538, _352, _536);
    float _550 = fma(_540, _352, _544);
    float _552 = fma(_542, _352, _546);
    float _554 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].x, _548);
    float _556 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].y, _550);
    float _558 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].z, _552);
    bool _560 = !_274;
    float _578;
    if (!_560)
    {
        float _562 = in.m_55.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_118);
        float _584 = 1.0 / _582;
        float _586 = _150 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = _642 * _634;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _650 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _654 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = in.m_57.x;
    float _658 = in.m_57.y;
    float _660 = in.m_57.z;
    float _662 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = _662 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _654;
    out.m_59.y = _650;
    out.m_59.z = _668;
    out.m_59.w = _666;
    float _670 = _558 * _660;
    float _672 = _556 * _658;
    float _674 = _554 * _656;
    bool _676 = !_630;
    float _694;
    if (!_676)
    {
        float _678 = in.m_55.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_118);
        float _700 = 1.0 / _698;
        float _702 = _150 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _708 = int(_706);
    float _710 = in.m_55.y;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _714 = _712 != 0;
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _726 = int(_724);
    float _728 = float(_708);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _732 = float(_718);
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _736 = int(_734);
    float _738 = _710 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _740 = float(_726);
    float _742 = 1.0 / _728;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _750 = int(_748);
    float _752 = float(uint(_736));
    float _754 = in.m_55.x;
    bool _756 = _736 == 0;
    int _758 = ~_736;
    int _760 = _758 + 1;
    float _762 = 1.0 / _732;
    float _764 = _742 * _150;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _768 = int(_766);
    float _770 = float(uint(_750));
    float _772 = _732;
    if (_746)
    {
        _772 = 1.0;
    }
    float _774 = _772;
    float _776 = _774;
    if (!_746)
    {
        _776 = 7.345489978790283203125;
    }
    float _778 = _776;
    bool _780 = _750 == 0;
    float _782 = 1.0 / _740;
    float _784 = _762 * _150;
    float _786 = _778 * _754;
    int _788 = ~_750;
    int _790 = _788 + 1;
    float _792 = in.m_55.z;
    float _794 = 1.0 / _752;
    float _796 = float(uint(_768));
    int _798 = ~_768;
    int _800 = _798 + 1;
    int _802 = ~_768;
    int _804 = _802 + 1;
    float _806 = trunc(_764);
    int _808 = int(_806);
    float _810 = _782 * _150;
    float _812 = 1.0 / _770;
    int _814 = as_type<int>(_794) + (-2);
    float _816 = trunc(_784);
    int _818 = int(_816);
    float _820 = float(uint(_808));
    float _822 = as_type<float>(_814) * _820;
    float _824 = _820;
    float _826 = _822;
    if (_746)
    {
        _824 = 1.0;
    }
    float _828 = _824;
    float _830 = 1.0 / _796;
    int _832 = as_type<int>(_812) + (-2);
    float _834 = _828;
    if (!_746)
    {
        _834 = 1.2345600128173828125;
    }
    float _836 = _834;
    float _838 = trunc(_810);
    int _840 = int(_838);
    float _842 = float(uint(_818));
    float _844 = as_type<float>(_832) * _842;
    float _846 = _842;
    if (_746)
    {
        _846 = _754;
    }
    float _848 = _846;
    float _850 = trunc(_822);
    float _852 = precise::max(_850, 0.0);
    uint _855 = uint(_852);
    int _857 = as_type<int>(_830) + (-2);
    float _859 = _848;
    if (!_746)
    {
        _859 = _710;
    }
    float _861 = _859;
    float _863 = float(uint(_840));
    float _865 = trunc(_844);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _861 * _836;
    int _873 = ~_736;
    int _875 = _873 + 1;
    float _877 = as_type<float>(_857) * _863;
    float _879 = _863;
    if (_746)
    {
        _879 = _754;
    }
    float _881 = _879;
    int _883 = _875 * int(_855);
    int _885 = _883 + _808;
    float _887 = trunc(_877);
    float _889 = precise::max(_887, 0.0);
    uint _891 = uint(_889);
    float _893 = _881;
    if (_746)
    {
        _826 = 1.0;
    }
    float _895 = _826;
    float _897 = _895;
    if (!_746)
    {
        _893 = _792;
    }
    float _899 = _893;
    float _901 = float(uint(_885));
    if (!_746)
    {
        _897 = 5.839270114898681640625;
    }
    float _903 = _897;
    float _905 = floor(_786);
    int _907 = ~_750;
    int _909 = _907 + 1;
    float _911 = as_type<float>(_814) * _901;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _915 = _913 != 0;
    float _917 = _899 * _903;
    int _919 = _909 * int(_869);
    int _921 = _919 + _818;
    int _923 = _800 * int(_891);
    int _925 = _923 + _840;
    float _927 = trunc(_911);
    float _929 = precise::max(_927, 0.0);
    uint _931 = uint(_929);
    float _933 = float(uint(_921));
    float _935 = float(uint(_925));
    float _937 = as_type<float>(_832) * _933;
    float _939 = floor(_871);
    float _941 = as_type<float>(_857) * _935;
    float _943 = float(_736);
    float _945 = -_905;
    float _947 = _786 + _945;
    float _949 = float(_808);
    float _951 = float(_750);
    float _953 = trunc(_937);
    float _955 = precise::max(_953, 0.0);
    uint _957 = uint(_955);
    int _959 = int(_855) + int(_931);
    int _961 = ~_750;
    int _963 = _961 + 1;
    bool _965 = _949 >= _943;
    bool _967 = isnan(_949);
    bool _969 = _965 || _967;
    bool _971 = isnan(_943);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = floor(_917);
    float _979 = -_939;
    float _981 = _871 + _979;
    float _983 = _947 * _943;
    float _985 = _943 * _150;
    float _987 = trunc(_941);
    float _989 = precise::max(_987, 0.0);
    uint _991 = uint(_989);
    int _993 = int(_869) + int(_957);
    float _995 = -_977;
    float _997 = _917 + _995;
    int _999 = ~_736;
    int _1001 = _999 + 1;
    float _1003 = trunc(_975);
    int _1005 = int(_1003);
    int _1007 = _963 * _993;
    int _1009 = _1007 + _818;
    int _1011 = _1001 * _959;
    int _1013 = _1011 + _808;
    bool _1015 = uint(_1009) >= uint(_750);
    float _1017 = float(_118);
    float _1019 = _951 * _981;
    float _1021 = float(_818);
    float _1023 = trunc(_983);
    int _1025 = int(_1023);
    bool _1027 = uint(_1013) >= uint(_736);
    bool _1029 = _1021 >= _951;
    bool _1031 = isnan(_1021);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(_951);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    bool _1041 = !_915;
    int _1043 = _1041 ? 0 : 1;
    bool _1045 = !_714;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = trunc(_1019);
    int _1051 = int(_1049);
    int _1053 = int(_891) + int(_991);
    int _1055 = abs(_1043);
    int _1057 = abs(_1047);
    bool _1059 = !_1027;
    int _1061 = _1059 ? 0 : (-1);
    float _1063 = trunc(_1039);
    int _1065 = int(_1063);
    bool _1067 = !_1015;
    int _1069 = _1067 ? 0 : (-1);
    int _1071 = _1025 * _1055;
    int _1073 = _1071 + _808;
    int _1075 = ~_959;
    int _1077 = _1075 + _1061;
    int _1079 = _1077 + 1;
    int _1081 = ~_993;
    int _1083 = _1081 + _1069;
    int _1085 = _1083 + 1;
    float _1087 = 1.0 / _1017;
    int _1089 = _736 * _1079;
    int _1091 = _1089 + _808;
    int _1093 = ~_1005;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _750 * _1085;
    int _1101 = _1099 + _818;
    int _1103 = _1051 * _1057;
    int _1105 = _1103 + _818;
    bool _1107 = !_756;
    int _1109 = _1107 ? _1091 : (-1);
    int _1111 = ~_1065;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = 1.0 / _722;
    bool _1119 = !_780;
    int _1121 = _1119 ? _1101 : (-1);
    int _1123 = _1109 * _1097;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1127 = _1125 != 0;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1131 = _1129 != 0;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1135 = _1133 != 0;
    int _1137 = ~_768;
    int _1139 = _1137 + 1;
    int _1141 = _1115 * _1121;
    float _1143 = _985 * _1087;
    bool _1145 = !_1131;
    int _1147 = _1145 ? 0 : 1;
    bool _1149 = !_1127;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = _1139 * _1053;
    int _1155 = _1153 + _840;
    int _1157 = _736 + (-1);
    float _1159 = trunc(_1143);
    int _1161 = int(_1159);
    int _1163 = abs(_1147);
    int _1165 = _750 + (-1);
    int _1167 = _1005 * _1157;
    int _1169 = _1167 + _1123;
    int _1171 = abs(_1151);
    int _1173 = _1065 * _1165;
    int _1175 = _1173 + _1141;
    bool _1177 = uint(_1155) >= uint(_768);
    float _1179 = _1087 * _150;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1183 = _1181 != 0;
    int _1185 = _1169 * _1163;
    float _1187 = _951 * _1179;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1195 = _1193 != 0;
    float _1197 = in.m_61.x;
    float _1199 = in.m_61.y;
    float _1201 = in.m_61.z;
    bool _1203 = !_1135;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = _1161 * _1171;
    int _1209 = _1207 + _1185;
    bool _1211 = !_1183;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = trunc(_1187);
    int _1217 = int(_1215);
    bool _1219 = !_1195;
    int _1221 = _1219 ? 0 : 1;
    int _1223 = abs(_1205);
    int _1225 = abs(_1221);
    int _1227 = abs(_1213);
    int _1229 = _1175 * _1225;
    float _1231 = float(_768);
    int _1233 = _1073 * _1223;
    int _1235 = _1233 + _1209;
    float _1237 = float(_840);
    float _1239 = in.m_63.x;
    bool _1241 = !_1191;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = _1025 * _1227;
    int _1247 = _1245 + _1235;
    bool _1249 = _1237 >= _1231;
    bool _1251 = isnan(_1237);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan(_1231);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = _1231 * _1179;
    int _1263 = abs(_1243);
    float _1265 = trunc(_1259);
    int _1267 = int(_1265);
    float _1269 = float(uint(_1247));
    bool _1271 = !_1177;
    int _1273 = _1271 ? 0 : (-1);
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1277 = _1275 != 0;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1281 = _1279 != 0;
    int _1283 = _1217 * _1263;
    int _1285 = _1283 + _1229;
    int _1287 = ~_1053;
    int _1289 = _1287 + _1273;
    int _1291 = _1289 + 1;
    float _1293 = as_type<float>(_814) * _1269;
    bool _1295 = _768 == 0;
    bool _1297 = !_1277;
    int _1299 = _1297 ? 0 : 1;
    int _1301 = _768 * _1291;
    int _1303 = _1301 + _840;
    float _1305 = trunc(_1293);
    float _1307 = precise::max(_1305, 0.0);
    uint _1309 = uint(_1307);
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1313 = _1311 != 0;
    int _1315 = abs(_1299);
    int _1317 = ~_1267;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    bool _1323 = !_1295;
    int _1325 = _1323 ? _1303 : (-1);
    float _1327 = _1231 * _997;
    int _1329 = ~_736;
    int _1331 = _1329 + 1;
    int _1333 = _1105 * _1315;
    int _1335 = _1333 + _1285;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1339 = _1337 != 0;
    int _1341 = _1321 * _1325;
    bool _1343 = !_1281;
    int _1345 = _1343 ? 0 : 1;
    float _1347 = trunc(_1261);
    int _1349 = int(_1347);
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1357 = _1355 != 0;
    int _1359 = abs(_1345);
    int _1361 = _1331 * int(_1309);
    int _1363 = _1361 + _1247;
    int _1365 = _768 + (-1);
    float _1367 = as_type<float>(_1315);
    bool _1369 = _1339;
    if (!_1313)
    {
        _1367 = _1239;
    }
    float _1371 = _1367;
    float _1373 = trunc(_1327);
    int _1375 = int(_1373);
    float _1377 = float(uint(_1363));
    int _1379 = _1051 * _1359;
    int _1381 = _1379 + _1335;
    bool _1383 = !_1357;
    int _1385 = _1383 ? 0 : 1;
    int _1387 = _1267 * _1365;
    int _1389 = _1387 + _1341;
    bool _1391 = !_1339;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = as_type<float>(_814) * _1377;
    int _1397 = abs(_1385);
    float _1399 = float(uint(_1381));
    float _1401 = 0.0;
    float _1403 = _1371;
    if (!_1313)
    {
        _1401 = _1371;
    }
    float _1405 = _1401;
    int _1407 = _1389 * _1397;
    float _1409 = _1405;
    if (_1313)
    {
        _1403 = _1239;
    }
    float _1411 = _1403;
    float _1413 = trunc(_1395);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    bool _1419 = !_1353;
    int _1421 = _1419 ? 0 : 1;
    int _1423 = abs(_1393);
    float _1425 = as_type<float>(_832) * _1399;
    int _1427 = abs(_1421);
    int _1429 = _1421;
    float _1431 = _1411;
    if (_1313)
    {
        float _1433 = -_1411;
        float _1435 = _1433 + 1.0;
        _1429 = as_type<int>(_1435);
    }
    int _1437 = _1429;
    if (_1313)
    {
        bool _1439 = _754 > 0.5;
        _1369 = _1439;
    }
    bool _1441 = _1369;
    float _1443 = trunc(_1425);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    int _1449 = _1375 * _1423;
    int _1451 = _1449 + _840;
    if (_1313)
    {
        float _1453 = _1441 ? as_type<float>(_1437) : _1411;
        _1409 = _1453;
    }
    float _1455 = _1409;
    float _1457 = in.m_55.w;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1461 = _1459 != 0;
    int _1463 = _1349 * _1427;
    int _1465 = _1463 + _1407;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1469 = _1467 != 0;
    bool _1471 = !_1461;
    int _1473 = _1471 ? 0 : 1;
    bool _1475 = !_1469;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = ~_750;
    int _1481 = _1479 + 1;
    int _1483 = abs(_1473);
    int _1485 = abs(_1477);
    int _1487 = _1481 * int(_1447);
    int _1489 = _1487 + _1381;
    float _1491 = in.m_63.y;
    int _1493 = _1451 * _1483;
    int _1495 = _1493 + _1465;
    int _1497 = int(_1309) + int(_1417);
    int _1499 = ~_736;
    int _1501 = _1499 + 1;
    int _1503 = _1375 * _1485;
    int _1505 = _1503 + _1495;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1509 = _1507 != 0;
    float _1511 = float(uint(_1489));
    int _1513 = _1501 * _1497;
    int _1515 = _1513 + _1247;
    float _1517 = float(uint(_1505));
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1521 = _1519 != 0;
    float _1523 = as_type<float>(_832) * _1511;
    bool _1525 = uint(_1515) >= uint(_736);
    float _1527 = as_type<float>(_857) * _1517;
    int _1529 = ~_768;
    int _1531 = _1529 + 1;
    bool _1533 = !_1525;
    int _1535 = _1533 ? 0 : (-1);
    int _1537 = _1515;
    if (_1509)
    {
        float _1539 = -_1411;
        float _1541 = _1539 + 1.0;
        _1537 = as_type<int>(_1541);
    }
    int _1543 = _1537;
    bool _1545 = _792 > 0.5;
    float _1547 = trunc(_1527);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    float _1553 = 0.0;
    int _1555 = _1543;
    if (!_1509)
    {
        _1553 = _1411;
    }
    float _1557 = _1553;
    float _1559 = -_1491;
    float _1561 = _1559 + 1.0;
    float _1563 = _1557;
    float _1565 = _1491;
    if (_1509)
    {
        float _1567 = _1545 ? as_type<float>(_1543) : _1411;
        _1563 = _1567;
    }
    float _1569 = _1563;
    if (_1521)
    {
        float _1571 = -_1411;
        float _1573 = _1571 + 1.0;
        _1555 = as_type<int>(_1573);
    }
    int _1575 = _1555;
    bool _1577 = _710 > 0.5;
    int _1579 = ~_1497;
    int _1581 = _1579 + _1535;
    int _1583 = _1581 + 1;
    float _1585 = trunc(_1523);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    if (_1521)
    {
        float _1591 = _1577 ? as_type<float>(_1575) : _1411;
        _1431 = _1591;
    }
    float _1593 = _1431;
    int _1595 = _1577 ? as_type<int>(_1561) : as_type<int>(_1491);
    int _1597 = _736 * _1583;
    int _1599 = _1597 + _1247;
    int _1601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1603 = _1601 != 0;
    bool _1605 = _1457 > 0.5;
    int _1607 = _1531 * int(_1551);
    int _1609 = _1607 + _1505;
    float _1611 = _1603 ? as_type<float>(_1595) : _1491;
    int _1613 = ~_750;
    int _1615 = _1613 + 1;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1619 = _1617 != 0;
    float _1621 = float(uint(_1609));
    int _1623 = int(_1447) + int(_1589);
    int _1625 = _1605 ? as_type<int>(_1561) : as_type<int>(_1491);
    float _1627 = as_type<float>(_857) * _1621;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1631 = _1629 != 0;
    int _1633 = _1615 * _1623;
    int _1635 = _1633 + _1381;
    bool _1637 = _736 == 0;
    float _1639 = _710 * 2.0;
    float _1641 = _1631 ? as_type<float>(_1625) : _1491;
    bool _1643 = uint(_1635) >= uint(_750);
    float _1645 = trunc(_1627);
    float _1647 = precise::max(_1645, 0.0);
    uint _1649 = uint(_1647);
    bool _1651 = !_1637;
    int _1653 = _1651 ? _1599 : (-1);
    if (_1619)
    {
        float _1655 = _1545 ? _1561 : _1491;
        _1565 = _1655;
    }
    float _1657 = _1565;
    bool _1659 = !_1643;
    int _1661 = _1659 ? 0 : (-1);
    int _1663 = _1653 & 3;
    bool _1665 = _1663 != 0;
    float _1667 = floor(_1639);
    int _1669 = _1653 & 3;
    bool _1671 = _1669 != 0;
    int _1673 = ~_1623;
    int _1675 = _1673 + _1661;
    int _1677 = _1675 + 1;
    bool _1679 = uint(_1663) >= 2u;
    int _1681 = _1671 ? 0 : 1;
    int _1683 = _750 * _1677;
    int _1685 = _1683 + _1381;
    bool _1687 = uint(_1663) > 1u;
    int _1689 = _1679 ? 0 : 1;
    bool _1691 = _1663 != 3;
    bool _1693 = _750 == 0;
    int _1695 = ~_1681;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    bool _1701 = !_1693;
    int _1703 = _1701 ? _1685 : (-1);
    int _1705 = ~_768;
    int _1707 = _1705 + 1;
    int _1709 = int(_1551) + int(_1649);
    int _1711 = _1699;
    if (!_1687)
    {
        int _1713 = ~_1681;
        int _1715 = _1713 + 1;
        _1711 = _1715;
    }
    int _1717 = _1711;
    int _1719 = _1703 & 3;
    bool _1721 = _1719 != 0;
    int _1723 = _1707 * _1709;
    int _1725 = _1723 + _1505;
    int _1727 = ~_1689;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    int _1733 = _1731;
    if (_1691)
    {
        int _1735 = ~_1689;
        int _1737 = _1735 + 1;
        _1733 = _1737;
    }
    int _1739 = _1733;
    bool _1741 = uint(_1719) >= 2u;
    int _1743 = _1721 ? 0 : 1;
    int _1745 = _1741 ? 0 : 1;
    bool _1747 = uint(_1725) >= uint(_768);
    float _1749 = _754 * 2.0;
    bool _1751 = _1719 != 3;
    bool _1753 = !_1747;
    int _1755 = _1753 ? 0 : (-1);
    int _1757 = ~_1745;
    int _1759 = _1757 + 1;
    int _1761 = _1759 + 1;
    float _1763 = floor(_1749);
    int _1765 = ~_1709;
    int _1767 = _1765 + _1755;
    int _1769 = _1767 + 1;
    float _1771 = float(uint(_1451));
    bool _1773 = uint(_1719) > 1u;
    int _1775 = _768 * _1769;
    int _1777 = _1775 + _1505;
    float _1779 = float(uint(_1105));
    float _1781 = as_type<float>(_857) * _1771;
    int _1783 = _1761;
    int _1785 = _1743;
    if (_1751)
    {
        int _1787 = ~_1745;
        int _1789 = _1787 + 1;
        _1783 = _1789;
    }
    int _1791 = _1783;
    float _1793 = float(uint(_1073));
    float _1795 = as_type<float>(_832) * _1779;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1799 = _1797 != 0;
    float _1801 = trunc(_1781);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1809 = _1807 != 0;
    float _1811 = as_type<float>(_814) * _1793;
    bool _1813 = !_1799;
    int _1815 = _1813 ? 0 : 1;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1819 = _1817 != 0;
    int _1821 = ~_736;
    int _1823 = _1821 + 1;
    float _1825 = trunc(_1811);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    int _1831 = ~_750;
    int _1833 = _1831 + 1;
    bool _1835 = !_1295;
    int _1837 = _1835 ? _1777 : (-1);
    int _1839 = ~_768;
    int _1841 = _1839 + 1;
    bool _1843 = !_1819;
    int _1845 = _1843 ? 0 : 1;
    float _1847 = trunc(_1795);
    float _1849 = precise::max(_1847, 0.0);
    uint _1851 = uint(_1849);
    int _1853 = _1837 & 3;
    bool _1855 = _1853 != 0;
    int _1857 = _1841 * int(_1805);
    int _1859 = _1857 + _1451;
    int _1861 = ~_1743;
    int _1863 = _1861 + 1;
    int _1865 = _1863 + 1;
    int _1867 = _1865;
    int _1869 = as_type<int>(_1811);
    if (!_1773)
    {
        int _1871 = ~_1743;
        int _1873 = _1871 + 1;
        _1867 = _1873;
    }
    int _1875 = _1867;
    if (_1809)
    {
        _1785 = 0;
        _1869 = 0;
    }
    int _1877 = _1785;
    int _1879 = _1869;
    int _1881 = _1823 * int(_1829);
    int _1883 = _1881 + _1073;
    bool _1885 = uint(_1853) >= 2u;
    bool _1887 = _1853 != 3;
    int _1889 = _1877;
    int _1891 = _1879;
    if (!_1809)
    {
        _1889 = 1;
    }
    int _1893 = _1889;
    float _1895 = float(uint(_1883));
    int _1897 = _1833 * int(_1851);
    int _1899 = _1897 + _1105;
    int _1901 = _1885 ? 0 : 1;
    float _1903 = float(uint(_1859));
    float _1905 = as_type<float>(_814) * _1895;
    float _1907 = float(uint(_1899));
    bool _1909 = _1893 != 1;
    float _1911 = as_type<float>(_857) * _1903;
    if (!_1809)
    {
        _1891 = 2;
    }
    int _1913 = _1891;
    float _1915 = as_type<float>(_832) * _1907;
    int _1917 = ~_1901;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    float _1923 = trunc(_1905);
    float _1925 = precise::max(_1923, 0.0);
    uint _1927 = uint(_1925);
    float _1929 = _1855 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1931 = uint(_1853) > 1u;
    int _1933 = _1921;
    float _1935 = _1929;
    if (_1887)
    {
        int _1937 = ~_1901;
        int _1939 = _1937 + 1;
        _1933 = _1939;
    }
    int _1941 = _1933;
    bool _1943 = _1913 != 2;
    float _1945 = trunc(_1915);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    float _1951 = 0.0;
    if (!_1909)
    {
        _1951 = _710;
    }
    float _1953 = _1951;
    float _1955 = 0.0;
    float _1957 = _1953;
    if (!_1909)
    {
        _1955 = _792;
    }
    float _1959 = _1955;
    float _1961 = 0.0;
    float _1963 = _1959;
    if (!_1909)
    {
        _1961 = _1953;
    }
    float _1965 = _1961;
    float _1967 = 0.0;
    float _1969 = _1965;
    if (!_1909)
    {
        _1967 = _792;
    }
    float _1971 = _1967;
    float _1973 = trunc(_1911);
    float _1975 = precise::max(_1973, 0.0);
    uint _1977 = uint(_1975);
    float _1979 = _1971;
    if (_1909)
    {
        _1969 = _754;
    }
    float _1981 = _1969;
    if (_1909)
    {
        _1957 = _754;
    }
    float _1983 = _1957;
    if (_1909)
    {
        _1963 = _710;
    }
    float _1985 = _1963;
    if (_1909)
    {
        _1979 = _710;
    }
    float _1987 = _1979;
    bool _1989 = _1763 >= 0.0;
    bool _1991 = isnan(_1763);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    int _1999 = ~as_type<int>(_1929);
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003;
    if (!_1931)
    {
        int _2007 = ~as_type<int>(_1929);
        int _2009 = _2007 + 1;
        _2005 = _2009;
    }
    int _2011 = _2005;
    bool _2013 = _1763 > 0.0;
    if (_1943)
    {
        _1935 = _754;
    }
    float _2015 = _1935;
    float _2017 = 0.0;
    float _2019 = _2015;
    if (_1943)
    {
        _2017 = _710;
    }
    float _2021 = _2017;
    int _2023 = _1997 ? 0 : 1;
    float _2025 = _2021;
    if (!_1943)
    {
        _2019 = _792;
    }
    float _2027 = _2019;
    if (!_1943)
    {
        _2025 = _754;
    }
    float _2029 = _2025;
    bool _2031 = _1667 > 0.0;
    bool _2033 = _1667 >= 0.0;
    bool _2035 = isnan(_1667);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(0.0);
    bool _2041 = _2037 || _2039;
    int _2043 = int(_1829) + int(_1927);
    int _2045 = int(_1851) + int(_1949);
    float _2047 = in.m_65.x;
    float _2049 = in.m_65.y;
    float _2051 = in.m_65.z;
    int _2053 = int(_1805) + int(_1977);
    int _2055 = _760 * _2043;
    int _2057 = _2055 + _1073;
    int _2059 = ~_2023;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    float _2065 = in.m_48.x;
    float _2067 = in.m_48.y;
    float _2069 = in.m_48.z;
    int _2071 = _2063;
    if (!_2013)
    {
        int _2073 = ~_2023;
        int _2075 = _2073 + 1;
        _2071 = _2075;
    }
    int _2077 = _2071;
    int _2079 = _804 * _2053;
    int _2081 = _2079 + _1451;
    bool _2083 = uint(_2057) >= uint(_736);
    float _2085 = in.m_67.x;
    float _2087 = in.m_67.y;
    float _2089 = in.m_67.z;
    int _2091 = _790 * _2045;
    int _2093 = _2091 + _1105;
    int _2095 = _2041 ? 0 : 1;
    bool _2097 = !_2083;
    int _2099 = _2097 ? 0 : (-1);
    bool _2101 = uint(_2081) >= uint(_768);
    bool _2103 = uint(_2093) >= uint(_750);
    bool _2105 = !_2101;
    int _2107 = _2105 ? 0 : (-1);
    bool _2109 = !_2103;
    int _2111 = _2109 ? 0 : (-1);
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2115 = _2113 != 0;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2119 = _2117 != 0;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2123 = _2121 != 0;
    int _2125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2127 = _2125 != 0;
    int _2129 = ~_2095;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    float _2135 = _2067 * _2049;
    int _2137 = _2133;
    if (!_2031)
    {
        int _2139 = ~_2095;
        int _2141 = _2139 + 1;
        _2137 = _2141;
    }
    int _2143 = _2137;
    float _2145 = _2067 * _2087;
    float _2147 = _2067 * _1199;
    float _2149 = fma(_2065, _2047, _2135);
    float _2151 = fma(_2065, _2085, _2145);
    float _2153 = fma(_2065, _1197, _2147);
    float _2155 = _792 * 2.0;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2157;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2163 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2165 = _2159 * _1117;
    float _2167 = floor(_2155);
    bool _2169 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2171 = isnan(_704);
    bool _2173 = _2169 || _2171;
    bool _2175 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2177 = _2173 || _2175;
    float _2179 = float(_2177);
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2183 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2185 = isnan(_704);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2191 = _2187 || _2189;
    float _2193 = float(_2191);
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2197 = _704 + _2195;
    float _2199 = -_2161;
    float _2201 = fma(_2163, 2.0, _2199);
    float _2203 = -_2179;
    float _2205 = _2203 + 1.0;
    float _2207 = fma(_738, -2.0, _2181);
    float _2209 = fma(_2165, _2197, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2211 = fma(_2069, _2089, _2151);
    float _2213 = _2193 * _2205;
    float _2215 = _754 + _710;
    float _2217 = fma(_2069, _2051, _2149);
    float _2219 = _2209 * _2213;
    float _2221 = -_2193;
    float _2223 = _2221 + 1.0;
    float _2225 = _2215 + (-1.0);
    bool _2227 = _2167 >= 0.0;
    bool _2229 = isnan(_2167);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = fma(_2069, _1201, _2153);
    float _2239 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2219);
    float _2241 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2243 = _2235 ? 0 : 1;
    float _2245 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2239);
    bool _2247 = _2167 > 0.0;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2251 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2253 = _2211 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2255 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2259 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2261 = -_2249;
    float _2263 = fma(_2251, 2.0, _2261);
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2267 = _710 + _792;
    int _2269 = ~_2043;
    int _2271 = _2269 + _2099;
    int _2273 = _2271 + 1;
    float _2275 = _2217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2279 = _2253 + _2277;
    float _2281 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2283 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2285 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2287 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2289 = _2237 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2293 = _2275 + _2291;
    float _2295 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2297 = _2267 + (-1.0);
    int _2299 = ~_2243;
    int _2301 = _2299 + 1;
    int _2303 = _2301 + 1;
    out.m_69.x = _2281;
    out.m_69.y = _2283;
    out.m_69.z = _2285;
    out.m_69.w = _2255;
    int _2305 = _2303;
    if (!_2247)
    {
        int _2307 = ~_2243;
        int _2309 = _2307 + 1;
        _2305 = _2309;
    }
    int _2311 = _2305;
    float _2313 = fma(_1983, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2287);
    int _2315 = _736 * _2273;
    int _2317 = _2315 + _1073;
    float _2319 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2321 = !_2119;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2327 = !_2115;
    int _2329 = _2327 ? 0 : 1;
    float _2331 = fma(_2297, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2333 = abs(_2323);
    float _2335 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2325);
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2339 = _2289 + _2337;
    float _2341 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2295);
    int _2343 = _1653 >> 31;
    float _2345 = -_150;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2201);
    int _2349 = _1703 >> 31;
    float _2351 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2341);
    int _2353 = _2343 & 3;
    float _2355 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2207);
    int _2357 = _2349 & 3;
    float _2359 = -_150;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2263);
    bool _2363 = _2351 >= 0.0;
    float _2365 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2313);
    int _2367 = _1653 + _2353;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2371 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2373 = _1703 + _2357;
    float _2375 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2377 = _2367 >> 2;
    float _2379 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2335);
    int _2381 = _2373 >> 2;
    float _2383 = -_2369;
    float _2385 = fma(_2375, 2.0, _2383);
    int _2387 = _2377 << 4;
    int _2389 = _2387 + 368;
    int _2391 = abs(_2329);
    float _2393 = in.m_71.x;
    float _2395 = in.m_71.y;
    float _2397 = in.m_71.z;
    uint _2399 = uint(int(uint(_2389) >> uint(2)));
    uint _2401 = uint(int(uint(int(_2399)) >> uint(2)));
    int _2403 = int(_2399) & 3;
    float _2405 = (*spvDescriptorSet0.vp_c9)._m0[int(_2401)][_2403];
    int _2407 = int(_2399) + 1;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    int _2411 = _2407 & 3;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[int(_2409)][_2411];
    int _2415 = _2381 << 4;
    int _2417 = _2415 + 512;
    float _2419 = -_150;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2385);
    float _2423 = float(_2077);
    float _2425 = as_type<float>(_2311);
    float _2427 = _2347;
    float _2429 = _2355;
    if (_2363)
    {
        out.m_51.x = 0.0;
    }
    float _2431 = float(_2333);
    float _2433 = float(_2311);
    uint _2435 = uint(int(uint(_2417) >> uint(2)));
    uint _2437 = uint(int(uint(int(_2435)) >> uint(2)));
    int _2439 = int(_2435) & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    int _2443 = int(_2435) + 1;
    uint _2445 = uint(int(uint(_2443) >> uint(2)));
    int _2447 = _2443 & 3;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[int(_2445)][_2447];
    float _2451 = float(_2391);
    float _2453 = _2431 * _2423;
    bool _2455 = _736 == 0;
    float _2457 = _2451 * _2433;
    if (_2363)
    {
        _2425 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2459 = _2425;
    int _2461 = _2389 + 8;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    uint _2465 = uint(int(uint(int(_2463)) >> uint(2)));
    int _2467 = int(_2463) & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    int _2471 = int(_2463) + 1;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    int _2475 = _2471 & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    float _2479 = fma(_2319, -2.0, _730);
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2483 = _2457 * (-2.0);
    int _2485 = as_type<int>(_2459);
    if (_2363)
    {
        float _2487 = _2459 * 5.0;
        _2485 = as_type<int>(_2487);
    }
    int _2489 = _2485;
    int _2491 = ~_2045;
    int _2493 = _2491 + _2111;
    int _2495 = _2493 + 1;
    float _2497 = fma(_2371, -2.0, _2481);
    bool _2499 = !_1665;
    int _2501 = _2499 ? 0 : 1;
    int _2503 = abs(_1717);
    int _2505 = _750 * _2495;
    int _2507 = _2505 + _1105;
    int _2509 = _1703 & 3;
    bool _2511 = _2509 != 0;
    float _2513 = fma(_2241, _2483, _2241);
    if (_2363)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8581 = as_type<float>(_2489);
        out.gl_Position.z = _8581;
    }
    int _2515 = ~_2053;
    int _2517 = _2515 + _2107;
    int _2519 = _2517 + 1;
    float _2521 = fma(_2483, _2393, _2393);
    int _2523 = _1837 >> 31;
    float _2525 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2497);
    int _2527 = abs(_1875);
    float _2529 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2479);
    float _2531 = _2453 * (-2.0);
    int _2533 = _2523 & 3;
    int _2535 = ~_2503;
    int _2537 = _2535 + 1;
    int _2539 = _2537 + 1;
    int _2541 = _2417 + 8;
    uint _2543 = uint(int(uint(_2541) >> uint(2)));
    uint _2545 = uint(int(uint(int(_2543)) >> uint(2)));
    int _2547 = int(_2543) & 3;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[int(_2545)][_2547];
    int _2551 = int(_2543) + 1;
    uint _2553 = uint(int(uint(_2551) >> uint(2)));
    int _2555 = _2551 & 3;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[int(_2553)][_2555];
    int _2559 = _1837 & 3;
    bool _2561 = _2559 != 0;
    float _2563 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2565 = int(_2563);
    bool _2567 = !_2511;
    int _2569 = _2567 ? 0 : 1;
    int _2571 = _1837 + _2533;
    int _2573 = abs(_2501);
    int _2575 = _2539 * as_type<int>(_2413);
    int _2577 = abs(_2569);
    float _2579 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2581 = int(_2579);
    int _2583 = _2571 >> 2;
    int _2585 = abs(_1739);
    int _2587 = ~_2573;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = _2583 << 4;
    int _2595 = _2593 + 656;
    int _2597 = ~_2585;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = _2591 * as_type<int>(_2405);
    int _2605 = _2603 + _2575;
    bool _2607 = _1663 != 3;
    uint _2609 = uint(int(uint(_2595) >> uint(2)));
    uint _2611 = uint(int(uint(int(_2609)) >> uint(2)));
    int _2613 = int(_2609) & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    int _2617 = int(_2609) + 1;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    int _2621 = _2617 & 3;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[int(_2619)][_2621];
    int _2625 = ~_2527;
    int _2627 = _2625 + 1;
    int _2629 = _2627 + 1;
    int _2631 = _2601 * as_type<int>(_2469);
    int _2633 = _2631 + _2605;
    bool _2635 = !_2607;
    int _2637 = _2635 ? 0 : (-1);
    bool _2639 = _1719 != 3;
    int _2641 = _2629 * as_type<int>(_2449);
    int _2643 = ~_2577;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    bool _2649 = !_2639;
    int _2651 = _2649 ? 0 : (-1);
    int _2653 = abs(_1791);
    int _2655 = _2647 * as_type<int>(_2441);
    int _2657 = _2655 + _2641;
    int _2659 = abs(_2637);
    int _2661 = _2595 + 8;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    uint _2665 = uint(int(uint(int(_2663)) >> uint(2)));
    int _2667 = int(_2663) & 3;
    float _2669 = (*spvDescriptorSet0.vp_c9)._m0[int(_2665)][_2667];
    int _2671 = int(_2663) + 1;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    int _2675 = _2671 & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = abs(_2651);
    int _2681 = abs(_1845);
    float _2683 = float(uint(_2565));
    int _2685 = abs(_1815);
    int _2687 = ~_2653;
    int _2689 = _2687 + 1;
    int _2691 = _2689 + 1;
    float _2693 = 1.0 / _2683;
    int _2695 = _2691 * as_type<int>(_2549);
    int _2697 = _2695 + _2657;
    int _2699 = ~_2659;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = float(uint(_2581));
    int _2707 = _2703 * as_type<int>(_2477);
    int _2709 = _2707 + _2633;
    int _2711 = ~_2679;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    float _2717 = 1.0 / _2705;
    int _2719 = ~_2685;
    int _2721 = _2719 + 1;
    int _2723 = _2721 + 1;
    bool _2725 = !_2455;
    int _2727 = _2725 ? _2317 : (-1);
    int _2729 = _2715 * as_type<int>(_2557);
    int _2731 = _2729 + _2697;
    int _2733 = ~_2681;
    int _2735 = _2733 + 1;
    int _2737 = _2735 + 1;
    int _2739 = _2709 * _2723;
    bool _2741 = _750 == 0;
    float _2743 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2745 = int(_2743);
    bool _2747 = _1853 != 3;
    int _2749 = _2737 * _2731;
    bool _2751 = !_2741;
    int _2753 = _2751 ? _2507 : (-1);
    int _2755 = _2727 * _2685;
    int _2757 = _2755 + _2739;
    int _2759 = as_type<int>(_2693) + (-2);
    bool _2761 = !_2561;
    int _2763 = _2761 ? 0 : 1;
    int _2765 = _2753 * _2681;
    int _2767 = _2765 + _2749;
    bool _2769 = !_2747;
    int _2771 = _2769 ? 0 : (-1);
    float _2773 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2775 = log2(_2773);
    float _2777 = float(uint(_2757));
    int _2779 = abs(_2011);
    int _2781 = as_type<int>(_2717) + (-2);
    int _2783 = abs(_2771);
    float _2785 = as_type<float>(_2759) * _2777;
    int _2787 = abs(_2763);
    int _2789 = ~_2779;
    int _2791 = _2789 + 1;
    int _2793 = _2791 + 1;
    int _2795 = abs(_1941);
    float _2797 = trunc(_2785);
    float _2799 = precise::max(_2797, 0.0);
    uint _2801 = uint(_2799);
    float _2803 = float(uint(_2767));
    int _2805 = _2793 * as_type<int>(_2623);
    int _2807 = ~_2787;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    float _2813 = _2775 * _150;
    float _2815 = as_type<float>(_2781) * _2803;
    int _2817 = ~_2795;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = _2811 * as_type<int>(_2615);
    int _2825 = _2823 + _2805;
    bool _2827 = !_2127;
    int _2829 = _2827 ? 0 : 1;
    float _2831 = trunc(_2815);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = ~_2783;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2821 * as_type<int>(_2669);
    int _2845 = _2843 + _2825;
    int _2847 = abs(_2829);
    int _2849 = _768 * _2519;
    int _2851 = _2849 + _1451;
    int _2853 = ~_2581;
    int _2855 = _2853 + 1;
    int _2857 = _2841 * as_type<int>(_2677);
    int _2859 = _2857 + _2845;
    int _2861 = ~_2565;
    int _2863 = _2861 + 1;
    float _2865 = exp2(_2813);
    float _2867 = float(uint(_2745));
    int _2869 = _2863 * int(_2801);
    int _2871 = _2869 + _2757;
    int _2873 = ~_2847;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    int _2879 = abs(_2565);
    int _2881 = _2855 * int(_2835);
    int _2883 = _2881 + _2767;
    float _2885 = float(uint(_2871));
    int _2887 = _2877 * _2859;
    float _2889 = 1.0 / _2867;
    bool _2891 = !_1295;
    int _2893 = _2891 ? _2851 : (-1);
    float _2895 = float(uint(_2883));
    float _2897 = as_type<float>(_2759) * _2885;
    int _2899 = abs(_2581);
    int _2901 = _2893 * _2847;
    int _2903 = _2901 + _2887;
    float _2905 = float(uint(_2879));
    float _2907 = as_type<float>(_2781) * _2895;
    float _2909 = trunc(_2897);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    float _2915 = float(uint(_2899));
    int _2917 = abs(_2745);
    float _2919 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2921 = 1.0 + _2919;
    int _2923 = as_type<int>(_2889) + (-2);
    float _2925 = 1.0 / _2905;
    float _2927 = float(uint(_2917));
    float _2929 = float(uint(_2903));
    int _2931 = abs(_2767);
    float _2933 = 1.0 / _2915;
    float _2935 = as_type<float>(_2923) * _2929;
    float _2937 = float(uint(_2931));
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2941 = 1.0 / _2927;
    float _2943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2945 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2947 = isnan(1.0);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2953 = _2949 || _2951;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2957 = abs(_2757);
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2961 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2963 = isnan(0.0);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2969 = _2965 || _2967;
    float _2971 = 1.0 / _2921;
    int _2973 = as_type<int>(_2933) + (-2);
    float _2975 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2939);
    int _2977 = as_type<int>(_2925) + (-2);
    float _2979 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2943);
    float _2981 = float(uint(_2957));
    float _2983 = as_type<float>(_2973) * _2937;
    float _2985 = -_2865;
    float _2987 = _2985 + 1.0;
    float _2989 = trunc(_2935);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    int _2995 = abs(_2903);
    float _2997 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2955);
    float _2999 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2959);
    float _3001 = _2969 ? _2987 : 0.0;
    float _3003 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2975);
    float _3005 = as_type<float>(_2977) * _2981;
    float _3007 = _2279 * _2279;
    int _3009 = ~_2745;
    int _3011 = _3009 + 1;
    float _3013 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2979);
    int _3015 = as_type<int>(_2941) + (-2);
    float _3017 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2997);
    float _3019 = float(uint(_2995));
    float _3021 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2999);
    if (_2953)
    {
        float _3023 = _3001 * _2971;
        _154 = _3023;
    }
    float _3025 = _154;
    int _3027 = ~_2879;
    int _3029 = _3027 + 1;
    float _3031 = fma(_2293, _2293, _3007);
    float _3033 = trunc(_3005);
    float _3035 = precise::max(_3033, 0.0);
    uint _3037 = uint(_3035);
    float _3039 = as_type<float>(_3015) * _3019;
    int _3041 = _3011 * int(_2993);
    int _3043 = _3041 + _2903;
    float _3045 = fma(_2339, _2339, _3031);
    int _3047 = ~_2899;
    int _3049 = _3047 + 1;
    float _3051 = float(uint(_3043));
    float _3053 = trunc(_2983);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = ~_2917;
    int _3061 = _3059 + 1;
    int _3063 = int(_2801) + int(_2913);
    float _3065 = as_type<float>(_2923) * _3051;
    int _3067 = ~_2565;
    int _3069 = _3067 + 1;
    float _3071 = trunc(_3039);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    int _3077 = _3029 * int(_3037);
    int _3079 = _3077 + _2957;
    float _3081 = float(uint(_3079));
    float _3083 = rsqrt(_3045);
    int _3085 = _3049 * int(_3057);
    int _3087 = _3085 + _2931;
    float _3089 = as_type<float>(_2977) * _3081;
    int _3091 = ~_2581;
    int _3093 = _3091 + 1;
    float _3095 = float(uint(_3087));
    float _3097 = trunc(_2907);
    float _3099 = precise::max(_3097, 0.0);
    uint _3101 = uint(_3099);
    int _3103 = _3061 * int(_3075);
    int _3105 = _3103 + _2995;
    float _3107 = as_type<float>(_2973) * _3095;
    float _3109 = float(uint(_3105));
    float _3111 = trunc(_3089);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    float _3117 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3119 = _3117 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3121 = int(_2835) + int(_3101);
    float _3123 = _3119 * _3083;
    float _3125 = trunc(_3065);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    float _3131 = as_type<float>(_3015) * _3109;
    float _3133 = _754 + (-0.5);
    float _3135 = _2279 * _3123;
    float _3137 = _2293 * _3123;
    int _3139 = _3093 * _3121;
    int _3141 = _3139 + _2767;
    float _3143 = fma(_3133, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2521);
    float _3145 = -_3135;
    float _3147 = _2279 + _3145;
    float _3149 = trunc(_3107);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    float _3155 = -_3137;
    float _3157 = _2293 + _3155;
    float _3159 = _3147 * _3147;
    bool _3161 = uint(_3141) >= uint(_2581);
    int _3163 = _3069 * _3063;
    int _3165 = _3163 + _2757;
    int _3167 = int(_3037) + int(_3115);
    float _3169 = fma(_3157, _3157, _3159);
    int _3171 = int(_2993) + int(_3129);
    float _3173 = trunc(_3131);
    float _3175 = precise::max(_3173, 0.0);
    uint _3177 = uint(_3175);
    int _3179 = ~_2745;
    int _3181 = _3179 + 1;
    float _3183 = _2339 * _3123;
    int _3185 = ~_2917;
    int _3187 = _3185 + 1;
    float _3189 = fma(_2513, _3025, _3143);
    int _3191 = ~_2879;
    int _3193 = _3191 + 1;
    int _3195 = int(_3057) + int(_3153);
    int _3197 = _3181 * _3171;
    int _3199 = _3197 + _2903;
    bool _3201 = uint(_3165) >= uint(_2565);
    int _3203 = ~_2899;
    int _3205 = _3203 + 1;
    int _3207 = _3193 * _3167;
    int _3209 = _3207 + _2957;
    int _3211 = int(_3075) + int(_3177);
    float _3213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3215 = _3205 * _3195;
    int _3217 = _3215 + _2931;
    bool _3219 = !_3161;
    int _3221 = _3219 ? 0 : (-1);
    bool _3223 = uint(_3199) >= uint(_2745);
    int _3225 = _3187 * _3211;
    int _3227 = _3225 + _2995;
    bool _3229 = !_3201;
    int _3231 = _3229 ? 0 : (-1);
    float _3233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3235 = uint(_3209) >= uint(_2879);
    int _3237 = ~_3063;
    int _3239 = _3237 + _3231;
    int _3241 = _3239 + 1;
    bool _3243 = uint(_3217) >= uint(_2899);
    int _3245 = ~_3121;
    int _3247 = _3245 + _3221;
    int _3249 = _3247 + 1;
    int _3251 = _2565 * _3241;
    int _3253 = _3251 + _2757;
    bool _3255 = uint(_3227) >= uint(_2917);
    float _3257 = _3213 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3259 = !_3223;
    int _3261 = _3259 ? 0 : (-1);
    int _3263 = _2581 * _3249;
    int _3265 = _3263 + _2767;
    bool _3267 = !_3235;
    int _3269 = _3267 ? 0 : (-1);
    bool _3271 = _2565 == 0;
    float _3273 = _3233 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3275 = _2565 == 0;
    int _3277 = _2757 ^ _2565;
    float _3279 = fma(_3273, _1455, -0.5);
    float _3281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3283 = !_3243;
    int _3285 = _3283 ? 0 : (-1);
    bool _3287 = _2581 == 0;
    int _3289 = _2767 ^ _2581;
    int _3291 = ~_3171;
    int _3293 = _3291 + _3261;
    int _3295 = _3293 + 1;
    float _3297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3299 = !_3271;
    int _3301 = _3299 ? _3253 : (-1);
    bool _3303 = !_3287;
    int _3305 = _3303 ? _3265 : (-1);
    bool _3307 = !_3255;
    int _3309 = _3307 ? 0 : (-1);
    bool _3311 = _2581 == 0;
    int _3313 = ~_3269;
    int _3315 = _3167 + _3313;
    int _3317 = _3315 + 1;
    int _3319 = _2903 ^ _2745;
    int _3321 = _2745 * _3295;
    int _3323 = _3321 + _2903;
    int _3325 = ~_3285;
    int _3327 = _3195 + _3325;
    int _3329 = _3327 + 1;
    float _3331 = float(_3301);
    float _3333 = _3281 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3335 = float(_3305);
    float _3337 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3339 = _2745 == 0;
    float _3341 = fma(_3273, _3331, _2347);
    bool _3343 = _2745 == 0;
    float _3345 = fma(_3333, _3335, _2421);
    float _3347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3349 = uint(int(uint(_3289) >> uint(31)));
    float _3351 = fma(_3337, _1593, -0.5);
    uint _3353 = uint(int(uint(_3277) >> uint(31)));
    float _3355 = fma(_3333, _1569, -0.5);
    uint _3357 = uint(int(uint(_3319) >> uint(31)));
    float _3359 = fma(_3013, _3279, _3341);
    bool _3361 = !_3339;
    int _3363 = _3361 ? _3323 : (-1);
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3367 = ~int(_3349);
    int _3369 = _3367 + 1;
    float _3371 = fma(_2365, _3355, _3345);
    int _3373 = ~_3309;
    int _3375 = _3211 + _3373;
    int _3377 = _3375 + 1;
    int _3379 = ~int(_3353);
    int _3381 = _3379 + 1;
    int _3383 = ~int(_3357);
    int _3385 = _3383 + 1;
    float _3387 = float(_3363);
    int _3389 = _3329 ^ _3369;
    int _3391 = _3317 ^ _3381;
    float _3393 = fma(_3337, _3387, _2361);
    int _3395 = _3377 ^ _3385;
    int _3397 = ~_3369;
    int _3399 = _3397 + _3389;
    int _3401 = _3399 + 1;
    float _3403 = fma(_3021, _3351, _3393);
    int _3405 = ~_3381;
    int _3407 = _3405 + _3391;
    int _3409 = _3407 + 1;
    float _3411 = _3347 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3413 = ~_3385;
    int _3415 = _3413 + _3395;
    int _3417 = _3415 + 1;
    float _3419 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3421 = !_3311;
    int _3423 = _3421 ? _3401 : (-1);
    float _3425 = fma(_1641, _3411, -0.5);
    bool _3427 = !_3275;
    int _3429 = _3427 ? _3409 : (-1);
    float _3431 = fma(_1611, _3257, -0.5);
    bool _3433 = !_3343;
    int _3435 = _3433 ? _3417 : (-1);
    float _3437 = fma(_2331, _2531, _2331);
    float _3439 = float(_3423);
    float _3441 = float(_3429);
    float _3443 = float(_3435);
    float _3445 = -_2525;
    float _3447 = fma(_3411, _3439, _3445);
    float _3449 = fma(_3419, _1657, -0.5);
    float _3451 = -_2355;
    float _3453 = fma(_3257, _3441, _3451);
    float _3455 = _3371 + 0.5;
    float _3457 = -_2529;
    float _3459 = fma(_3419, _3443, _3457);
    float _3461 = fma(_2379, _3425, _3447);
    float _3463 = fma(_3017, _3431, _3453);
    float _3465 = _3403 + 0.5;
    float _3467 = fma(_3003, _3449, _3459);
    float _3469 = _3359 + 0.5;
    float _3471 = _3463 + 0.5;
    float _3473 = _3461 + 0.5;
    float _3475 = _3467 + 0.5;
    float _3477 = -_3183;
    float _3479 = _2339 + _3477;
    float _3481 = fma(_2531, _2395, _2395);
    bool _3483 = !_2123;
    int _3485 = _3483 ? 0 : 1;
    out.m_73.x = _3469;
    out.m_73.y = _3471;
    out.m_73.z = _3455;
    out.m_73.w = _3473;
    float _3487 = fma(_3479, _3479, _3169);
    float _3489 = _710 + (-0.5);
    out.m_75.x = _3465;
    out.m_75.y = _3475;
    float _3491 = as_type<float>(_3187);
    if (_2363)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3493 = -_3135;
    float _3495 = _2253 + _3493;
    int _3497 = abs(_3485);
    float _3499 = -_3137;
    float _3501 = _2275 + _3499;
    float _3503 = float(_2143);
    float _3505 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3507 = _3495 + _3505;
    float _3509 = -_3183;
    float _3511 = _2289 + _3509;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3515 = _3501 + _3513;
    float _3517 = _754 + _792;
    float _3519 = _3507 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3523 = _3511 + _3521;
    float _3525 = _792 + (-0.5);
    float _3527 = _3517 + (-1.0);
    float _3529 = fma(_3515, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3519);
    float _3531 = float(_3497);
    float _3533 = fma(_3489, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3481);
    float _3535 = _3189 * 0.15915493667125701904296875;
    float _3537 = fma(_3523, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3529);
    float _3539 = sqrt(_3487);
    float _3541 = _3531 * _3503;
    float _3543 = fma(_3437, _3025, _3533);
    bool _3545 = _3537 >= 0.0;
    float _3547 = _3541 * (-2.0);
    float _3549 = fma(_3527, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3551 = _3543 * 0.15915493667125701904296875;
    float _3553 = fma(_3547, _2397, _2397);
    float _3555 = _3535 * 6.283185482025146484375;
    float _3557 = sin(_3555);
    float _3559 = fma(_3549, _3547, _3549);
    float _3561 = fma(_3525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3553);
    float _3563 = fma(_3559, _3025, _3561);
    float _3565 = _3543;
    float _3567 = _3507;
    float _3569 = _3515;
    float _3571 = _3523;
    if (_3545)
    {
        _3565 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3573 = _3565;
    float _3575 = _3535 * 6.283185482025146484375;
    float _3577 = cos(_3575);
    float _3579 = _3563 * 0.15915493667125701904296875;
    int _3581 = as_type<int>(_3573);
    if (_3545)
    {
        out.m_51.x = 0.0;
    }
    if (_3545)
    {
        float _3583 = _3573 * 5.0;
        _3581 = as_type<int>(_3583);
    }
    int _3585 = _3581;
    float _3587 = _3551 * 6.283185482025146484375;
    float _3589 = sin(_3587);
    if (_3545)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10107 = as_type<float>(_3585);
        out.gl_Position.z = _10107;
    }
    float _3591 = _3551 * 6.283185482025146484375;
    float _3593 = cos(_3591);
    float _3595 = _3579 * 6.283185482025146484375;
    float _3597 = sin(_3595);
    if (_3545)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3599 = -_2253;
    float _3601 = _3599 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3603 = -_2275;
    float _3605 = _3603 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3607 = -_2289;
    float _3609 = _3607 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3611 = in.m_77.x;
    float _3613 = in.m_77.y;
    float _3615 = in.m_77.z;
    float _3617 = _3601 * _3601;
    float _3619 = _3579 * 6.283185482025146484375;
    float _3621 = cos(_3619);
    float _3623 = _3083 * _3539;
    float _3625 = _3557 * _3589;
    float _3627 = fma(_3605, _3605, _3617);
    float _3629 = _3577 * _3593;
    float _3631 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3633 = _3577 * _3589;
    float _3635 = fma(_3609, _3609, _3627);
    float _3637 = fma(_3597, _3629, _3625);
    float _3639 = fma(_3597, _3625, _3629);
    float _3641 = rsqrt(_3635);
    float _3643 = _3557 * _3593;
    float _3645 = _3623 * _3631;
    float _3647 = _3589 * _3621;
    float _3649 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3651 = _3577 * _3621;
    float _3653 = _3593 * _3621;
    float _3655 = _3557 * _3621;
    float _3657 = _3117 * _3623;
    float _3659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3611);
    float _3661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3613);
    float _3663 = _3623 * _3649;
    float _3665 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3615);
    float _3667 = _3659 * _3657;
    float _3669 = _3605 * _3641;
    float _3671 = _3609 * _3641;
    float _3673 = _3661 * _3645;
    float _3675 = _3665 * _3663;
    float _3677 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3679 = _3669 * _3677;
    float _3681 = in.m_79.x;
    float _3683 = in.m_79.y;
    float _3685 = in.m_79.z;
    float _3687 = _3601 * _3641;
    float _3689 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3691 = _3671 * _3689;
    float _3693 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3695 = -_3679;
    float _3697 = fma(_3671, _3693, _3695);
    bool _3699 = _3613 != 0.0;
    bool _3701 = isnan(_3613);
    bool _3703 = _3699 || _3701;
    bool _3705 = isnan(0.0);
    bool _3707 = _3703 || _3705;
    float _3709 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3711 = _3687 * _3709;
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3715 = -_3691;
    float _3717 = fma(_3687, _3713, _3715);
    float _3719 = _3697 * _3697;
    bool _3721 = _3611 == 0.0;
    bool _3723 = !_3707;
    bool _3725 = _3721 && _3723;
    float _3727 = -_3633;
    float _3729 = fma(_3597, _3643, _3727);
    float _3731 = -_3643;
    float _3733 = fma(_3597, _3633, _3731);
    float _3735 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3737 = -_3711;
    float _3739 = fma(_3669, _3735, _3737);
    float _3741 = fma(_3717, _3717, _3719);
    float _3743 = in.m_81.x;
    float _3745 = in.m_81.y;
    float _3747 = in.m_81.z;
    float _3749 = in.m_81.w;
    bool _3751 = _3615 == 0.0;
    bool _3753 = _3751 && _3725;
    float _3755 = -_3673;
    float _3757 = _3597 * _3755;
    float _3759 = fma(_3739, _3739, _3741);
    float _3761 = _3651 * _3673;
    float _3763 = _3655 * _3673;
    float _3765 = fma(_3653, _3667, _3757);
    float _3767 = rsqrt(_3759);
    float _3769 = fma(_3637, _3667, _3761);
    float _3771 = fma(_3729, _3667, _3763);
    float _3773 = fma(_3647, _3675, _3765);
    float _3775 = fma(_3733, _3675, _3769);
    float _3777 = _3667;
    float _3779 = _3741;
    float _3781 = _3763;
    float _3783 = _3639;
    if (_3753)
    {
        _2427 = _3681;
    }
    float _3785 = _2427;
    float _3787 = _3785;
    if (_3753)
    {
        _2429 = _3685;
    }
    float _3789 = _2429;
    float _3791 = _3789;
    if (_3753)
    {
        _3491 = _3683;
    }
    float _3793 = _3491;
    float _3795 = _3793;
    if (_3753)
    {
        _3777 = _3785;
    }
    float _3797 = _3777;
    float _3799 = _3797;
    if (!_3753)
    {
        _3787 = _3681;
    }
    float _3801 = _3787;
    float _3803 = _3717 * _3767;
    if (_3753)
    {
        _3779 = _3789;
    }
    float _3805 = _3779;
    float _3807 = _3697 * _3767;
    float _3809 = _3805;
    if (_3753)
    {
        _3781 = _3793;
    }
    float _3811 = _3781;
    float _3813 = _3739 * _3767;
    float _3815 = _3811;
    if (!_3753)
    {
        _3791 = _3685;
    }
    float _3817 = _3791;
    float _3819 = _3671 * _3807;
    if (!_3753)
    {
        _3795 = _3683;
    }
    float _3821 = _3795;
    float _3823 = _3747 * _3801;
    float _3825 = _3687 * _3803;
    if (!_3753)
    {
        float _3827 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3817);
        _3809 = _3827;
    }
    float _3829 = _3809;
    float _3831 = -_3819;
    float _3833 = fma(_3687, _3813, _3831);
    float _3835 = -_3823;
    float _3837 = fma(_3743, _3817, _3835);
    float _3839 = _3745 * _3817;
    float _3841 = _3743 * _3821;
    float _3843 = -_3825;
    float _3845 = fma(_3669, _3807, _3843);
    float _3847 = _3829;
    if (!_3753)
    {
        float _3849 = fma(_3611, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3801);
        _3799 = _3849;
    }
    float _3851 = _3799;
    float _3853 = -_3839;
    float _3855 = fma(_3747, _3821, _3853);
    float _3857 = fma(_3639, _3675, _3771);
    float _3859 = -_3841;
    float _3861 = fma(_3745, _3801, _3859);
    float _3863 = _3833 * _3775;
    float _3865 = _3845 * _3775;
    if (!_3753)
    {
        float _3867 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3821);
        _3815 = _3867;
    }
    float _3869 = _3815;
    float _3871 = _3837 * _3749;
    float _3873 = _3855 * _3749;
    float _3875 = _3669 * _3813;
    float _3877 = _3861 * _3749;
    float _3879 = fma(_3803, _3773, _3863);
    float _3881 = fma(_3813, _3773, _3865);
    float _3883 = -_3875;
    float _3885 = fma(_3671, _3803, _3883);
    float _3887 = _3637 * _3833;
    float _3889 = fma(_3669, _3857, _3879);
    float _3891 = fma(_3671, _3857, _3881);
    float _3893 = _3637 * _3885;
    float _3895 = _3637 * _3845;
    float _3897 = _2275 + _3889;
    float _3899 = _2289 + _3891;
    float _3901 = _3651 * _3833;
    float _3903 = _3651 * _3885;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3907 = _3897 + _3905;
    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3911 = _3899 + _3909;
    float _3913 = _3651 * _3845;
    float _3915 = _3733 * _3885;
    float _3917 = _3907 * _3907;
    float _3919 = _3911 * _3911;
    float _3921 = _3733 * _3833;
    float _3923 = _3733 * _3845;
    float _3925 = _3885 * _3775;
    float _3927 = _3917 + _3919;
    float _3929 = fma(_3653, _3803, _3887);
    float _3931 = fma(_3653, _3807, _3893);
    float _3933 = fma(_3653, _3813, _3895);
    float _3935 = -_3597;
    float _3937 = fma(_3935, _3803, _3901);
    float _3939 = sqrt(_3927);
    float _3941 = -_3597;
    float _3943 = fma(_3941, _3807, _3903);
    float _3945 = -_3597;
    float _3947 = fma(_3945, _3813, _3913);
    float _3949 = fma(_3647, _3803, _3921);
    float _3951 = fma(_3647, _3813, _3923);
    float _3953 = fma(_3647, _3807, _3915);
    float _3955 = fma(_3807, _3773, _3925);
    float _3957 = fma(_3655, _3669, _3937);
    float _3959 = fma(_3655, _3687, _3943);
    float _3961 = fma(_3655, _3671, _3947);
    float _3963 = fma(_3729, _3669, _3929);
    float _3965 = fma(_3729, _3687, _3931);
    float _3967 = fma(_3687, _3857, _3955);
    float _3969 = fma(_3729, _3671, _3933);
    float _3971 = _3957 * _3745;
    float _3973 = _3959 * _3745;
    bool _3975 = _3939 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3977 = _3961 * _3745;
    float _3979 = _3959 * _3869;
    float _3981 = _3871 * _3959;
    float _3983 = _2253 + _3967;
    float _3985 = fma(_3639, _3687, _3953);
    float _3987 = _3957 * _3869;
    float _3989 = fma(_3639, _3669, _3949);
    float _3991 = fma(_3639, _3671, _3951);
    float _3993 = _3961 * _3869;
    float _3995 = _3871 * _3957;
    float _3997 = _3871 * _3961;
    float _3999 = _3917;
    float _4001 = _3919;
    float _4003 = _3897;
    float _4005 = _3899;
    if (!_3975)
    {
        _3783 = _3983;
    }
    float _4007 = _3783;
    bool _4009 = !_3975;
    float _4011 = _4007;
    if (!_4009)
    {
        float _4013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4017 = _3939 + _4015;
        float _4019 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4021 = rsqrt(_3927);
        float _4023 = _4017 * _4013;
        float _4025 = _4023 * 0.15915493667125701904296875;
        float _4027 = _4025 * 6.283185482025146484375;
        float _4029 = sin(_4027);
        float _4031 = _4025 * 6.283185482025146484375;
        float _4033 = cos(_4031);
        float _4035 = fma(_4029, _4019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4037 = _4021 * _4035;
        float _4039 = _4033 + (-1.0);
        float _4041 = fma(_3907, _4037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4043 = fma(_3911, _4037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4045 = _4039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4049 = _4041 + _4047;
        float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4053 = _4043 + _4051;
        float _4055 = fma(_3983, _4033, _4045);
        float _4057 = _4049 * _4049;
        float _4059 = _4053 * _4053;
        _4011 = _4055;
        _3999 = _4057;
        _4001 = _4059;
        _4003 = _4041;
        _4005 = _4043;
    }
    float _4061 = _4011;
    float _4063 = _3999;
    float _4065 = _4001;
    float _4067 = _4003;
    float _4069 = _4005;
    float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4073 = _4061 + _4071;
    float _4075 = fma(_3963, _3851, _3987);
    float _4077 = fma(_3965, _3851, _3979);
    float _4079 = fma(_3969, _3851, _3993);
    float _4081 = fma(_4073, _4073, _4063);
    float _4083 = fma(_3963, _3743, _3971);
    float _4085 = fma(_3965, _3743, _3973);
    float _4087 = fma(_3873, _3963, _3995);
    float _4089 = _4081 + _4065;
    float _4091 = fma(_3873, _3965, _3981);
    float _4093 = fma(_3969, _3743, _3977);
    float _4095 = fma(_3873, _3969, _3997);
    float _4097 = fma(_3989, _3747, _4083);
    float _4099 = fma(_3985, _3747, _4085);
    float _4101 = sqrt(_4089);
    float _4103 = fma(_3877, _3989, _4087);
    float _4105 = fma(_3985, _3829, _4077);
    float _4107 = fma(_3877, _3985, _4091);
    float _4109 = fma(_3991, _3747, _4093);
    float _4111 = fma(_3989, _3829, _4075);
    float _4113 = fma(_3877, _3991, _4095);
    float _4115 = fma(_3991, _3829, _4079);
    out.m_83.x = _4097;
    out.m_83.y = _4099;
    out.m_83.z = _4109;
    out.m_85.x = _4103;
    out.m_85.y = _4107;
    out.m_85.z = _4113;
    bool _4117 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4119 = isnan(_4101);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4125 = _4121 || _4123;
    out.m_87.x = _4111;
    out.m_87.y = _4105;
    out.m_87.z = _4115;
    if (!_4125)
    {
        _3847 = 1.0;
    }
    float _4127 = _3847;
    bool _4129 = !_4125;
    float _4131 = _4127;
    if (!_4129)
    {
        bool _4133 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4135 = isnan(_4101);
        bool _4137 = _4133 || _4135;
        bool _4139 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4141 = _4137 || _4139;
        if (!_4141)
        {
            float _4143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4145 = _4101 + _4143;
            float _4147 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4149 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4147;
            float _4151 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4153 = _4151 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4155 = 1.0 / _4149;
            float _4157 = _4145 * _4155;
            float _4159 = fma(_4157, _4153, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4131 = _4159;
            _4161 = true;
        }
        else
        {
            bool _4163 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4165 = isnan(_4101);
            bool _4167 = _4163 || _4165;
            bool _4169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4171 = _4167 || _4169;
            if (!_4171)
            {
                float _4173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4175 = _4101 + _4173;
                float _4177 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4179 = _4177 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4181 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4183 = _4181 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4185 = 1.0 / _4179;
                float _4187 = _4175 * _4185;
                float _4189 = fma(_4187, _4183, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4131 = _4189;
                _4161 = true;
            }
            else
            {
                _4131 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4161 = false;
    float _4191 = _4131;
    float _4193 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4195 = _4067 + _4193;
    float _4197 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4199 = _4061 + _4197;
    float _4201 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4203 = _4069 + _4201;
    bool _4205 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4207 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4209 = _4205 || _4207;
    bool _4211 = isnan(0.5);
    bool _4213 = _4209 || _4211;
    float _4215 = fma(_4195, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4217 = fma(_4199, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4219 = fma(_4203, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4221 = -_3137;
    float _4223 = _4221 + _4215;
    float _4225 = -_3135;
    float _4227 = _4225 + _4217;
    float _4229 = -_3183;
    float _4231 = _4229 + _4219;
    float _4233 = _4227;
    float _4235 = _4223;
    float _4237 = _4231;
    if (!_4213)
    {
        float _4239 = _3507 * _3507;
        float _4241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4243 = -_2289;
        float _4245 = _4243 + _4219;
        float _4247 = -_2275;
        float _4249 = _4247 + _4215;
        float _4251 = fma(_3515, _3515, _4239);
        float _4253 = fma(_3523, _3523, _4251);
        float _4255 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4257 = sqrt(_4253);
        float _4259 = 1.0 / _3623;
        float _4261 = _4255 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4263 = precise::min(_4257, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4265 = _4263 * _4241;
        float _4267 = -_2253;
        float _4269 = _4267 + _4217;
        float _4271 = _4265 * _4259;
        float _4273 = _4261 * _4271;
        float _4275 = _4245 * _4271;
        float _4277 = fma(_4249, _4273, _3501);
        float _4279 = fma(_4269, _4273, _3495);
        float _4281 = fma(_4261, _4275, _3511);
        _4233 = _4279;
        _4235 = _4277;
        _4237 = _4281;
        _3567 = _4239;
        _3569 = _4257;
    }
    float _4283 = _4233;
    float _4285 = _4235;
    float _4287 = _4237;
    float _4289 = _3567;
    float _4291 = _3569;
    float _4293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4295 = _4283 + _4293;
    float _4297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4299 = _4285 + _4297;
    float _4301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4303 = _4287 + _4301;
    float _4305 = _4295 * _4295;
    float _4307 = fma(_4299, _4299, _4305);
    float _4309 = fma(_4303, _4303, _4307);
    float _4311 = rsqrt(_4309);
    float _4313 = sqrt(_4309);
    float _4315 = _4311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4317 = _4299 * _4315;
    float _4319 = _4303 * _4315;
    float _4321 = _4317 * _4317;
    float _4323 = _4319 * _4319;
    float _4325 = _4321 + _4323;
    float _4327 = sqrt(_4325);
    bool _4329 = _4327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4333 = _4327 + _4331;
    float _4335 = _4311;
    float _4337 = _4333;
    float _4339 = _4289;
    float _4341 = _4295;
    float _4343 = _4291;
    float _4345 = _4315;
    if (_4329)
    {
        float _4347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4335 = _4347;
    }
    float _4349 = _4335;
    if (_4329)
    {
        float _4351 = rsqrt(_4325);
        _3571 = _4351;
    }
    float _4353 = _3571;
    float _4355 = _4353;
    if (_4329)
    {
        float _4357 = _4333 * _4349;
        _4337 = _4357;
    }
    float _4359 = _4337;
    if (_4329)
    {
        float _4361 = _4359 * 0.15915493667125701904296875;
        _4339 = _4361;
    }
    float _4363 = _4339;
    float _4365 = _4349;
    float _4367 = _4363;
    if (_4329)
    {
        float _4369 = _4363 * 6.283185482025146484375;
        float _4371 = sin(_4369);
        _4365 = _4371;
    }
    float _4373 = _4365;
    float _4375 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4377 = precise::max(0.0, _4375);
    float _4379 = _4303;
    float _4381 = _4377;
    if (_4329)
    {
        float _4383 = _4363 * 6.283185482025146484375;
        float _4385 = cos(_4383);
        _4379 = _4385;
    }
    float _4387 = _4379;
    float _4389 = -_4315;
    float _4391 = -_4377;
    float _4393 = fma(_4295, _4389, _4391);
    if (!_4329)
    {
        _4341 = _4319;
    }
    float _4395 = _4341;
    float _4397 = _4395;
    if (_4329)
    {
        float _4399 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4381 = _4399;
    }
    float _4401 = _4381;
    float _4403 = _4373;
    float _4405 = _4401;
    if (_4329)
    {
        float _4407 = fma(_4373, _4401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4343 = _4407;
    }
    float _4409 = _4343;
    float _4411 = _4409;
    if (!_4329)
    {
        _4403 = _4317;
    }
    float _4413 = _4403;
    float _4415 = _4413;
    if (_4329)
    {
        float _4417 = _4387 + (-1.0);
        _4405 = _4417;
    }
    float _4419 = _4405;
    float _4421 = _4419;
    if (_4329)
    {
        float _4423 = _4353 * _4409;
        _4345 = _4423;
    }
    float _4425 = _4345;
    if (!_4329)
    {
        _4411 = _4393;
    }
    float _4427 = _4411;
    float _4429 = _4427;
    if (_4329)
    {
        float _4431 = _4419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4367 = _4431;
    }
    float _4433 = _4367;
    if (_4329)
    {
        float _4435 = _4317 * _4425;
        _4415 = _4435;
    }
    float _4437 = _4415;
    if (!_4329)
    {
        _4355 = _4321;
    }
    float _4439 = _4355;
    float _4441 = _4439;
    if (_4329)
    {
        float _4443 = _4319 * _4425;
        _4397 = _4443;
    }
    float _4445 = _4397;
    if (_4329)
    {
        float _4447 = fma(_4393, _4387, _4433);
        _4429 = _4447;
    }
    float _4449 = _4429;
    if (_4329)
    {
        float _4451 = _4437 * _4437;
        _4441 = _4451;
    }
    float _4453 = _4441;
    if (!_4329)
    {
        _4421 = _4323;
    }
    float _4455 = _4421;
    float _4457 = _4455;
    if (_4329)
    {
        float _4459 = _4445 * _4445;
        _4457 = _4459;
    }
    float _4461 = _4457;
    float _4463 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4465 = fma(_4449, _4449, _4453);
    float _4467 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4469 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4471 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4463);
    float _4473 = _4465 + _4461;
    float _4475 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4477 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4467);
    float _4479 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4471);
    float _4481 = rsqrt(_4473);
    float _4483 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4475);
    float _4485 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4477);
    float _4487 = _4479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4489 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4483);
    float _4491 = _4485 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4493 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4495 = _4489 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4499 = fma(_4313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4497);
    float _4501 = precise::clamp(_4499, 0.0, 1.0);
    float _4503 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4469);
    float _4505 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4507 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4493);
    float _4509 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4511 = -_4501;
    float _4513 = _4511 + 1.0;
    float _4515 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4503);
    float _4517 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4507);
    float _4519 = _4481 * _4437;
    float _4521 = _4481 * _4449;
    float _4523 = floor(_4509);
    float _4525 = _4515 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4527 = _4519 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4529 = _4481 * _4445;
    float _4531 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4517);
    float _4533 = -_4527;
    float _4535 = fma(_4521, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4533);
    float _4537 = abs(_4513);
    float _4539 = log2(_4537);
    float _4541 = -_4529;
    float _4543 = fma(_4541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4535);
    float _4545 = _4491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4547 = fma(_4543, -0.5, 0.5);
    float _4549 = fma(_4543, 0.5, 0.5);
    float _4551 = floor(_4505);
    float _4553 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4555 = -_4523;
    float _4557 = _4509 + _4555;
    float _4559 = fma(_4549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4561 = -_4545;
    float _4563 = fma(_4561, _4553, 1.0);
    float _4565 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4567 = fma(_4549, _4559, -0.212114393711090087890625);
    float _4569 = _4539 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4571 = 1.0 / _4531;
    float _4573 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4565);
    float _4575 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4573);
    float _4577 = -_4551;
    float _4579 = _4505 + _4577;
    float _4581 = exp2(_4569);
    float _4583 = fma(_4549, _4567, 1.570728778839111328125);
    float _4585 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4575);
    float _4587 = log2(_4563);
    float _4589 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4591 = _4585 * _4571;
    float _4593 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4589);
    float _4595 = sqrt(_4547);
    float _4597 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4593);
    float _4599 = _4521 + 1.0;
    float _4601 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4597);
    float2 _11761 = float2(_4557, _4579);
    float _4603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11761, float2(0.0), isnan(_11761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11761, float2(0.0), isnan(_11761)), level(0.0)).x;
    float _4605 = -_4521;
    float _4607 = fma(_4581, _4599, _4605);
    float _4609 = _4587 * 0.693147182464599609375;
    float _4611 = _4601 * _4571;
    float _4613 = fma(_4591, 0.5, 0.5);
    float _4615 = fma(_4607, 0.5, 0.5);
    float _4617 = _4609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4619 = fma(_4611, -0.5, 0.5);
    float _4621 = _4595 * 0.636619746685028076171875;
    float _4623 = -_4583;
    float _4625 = fma(_4621, _4623, 1.0);
    float3 _11802 = float3(_4613, _4619, _4617);
    float _4627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11802, float3(0.0), isnan(_11802)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11802, float3(0.0), isnan(_11802)), level(0.0)).x;
    float3 _11813 = float3(_4613, _4619, _4617);
    float4 _4630 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11813, float3(0.0), isnan(_11813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11813, float3(0.0), isnan(_11813)), level(0.0)).xyzw;
    float _4632 = _4630.x;
    float _4634 = _4630.y;
    float _4636 = _4630.z;
    float _4638 = _4630.w;
    float2 _11829 = float2(_4625, _4615);
    float3 _4642 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11829, float2(0.0), isnan(_11829)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11829, float2(0.0), isnan(_11829)), level(0.0)).xyz;
    float _4644 = _4642.x;
    float _4646 = _4642.y;
    float _4648 = _4642.z;
    float _4650 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4652 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4654 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4656 = isnan(_4313);
    bool _4658 = _4654 || _4656;
    bool _4660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4662 = _4658 || _4660;
    float _4664 = fma(_3501, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4650);
    float _4666 = fma(_3501, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4652);
    float _4668 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4664);
    float _4670 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4666);
    float _4672 = _4668 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4674 = _4670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4676 = 1.0 / _4672;
    float _4678 = _4674 + _4672;
    float _4680 = _4678 * _4676;
    float _4682 = _4680 * 0.5;
    float _4684 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4686 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4684);
    float _4688 = 1.0 / _4686;
    float _4690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4692 = _4688 * _4690;
    float _4694 = abs(_4692);
    float _4696 = log2(_4694);
    bool _4698 = _4692 <= 8000.0;
    bool _4700 = isnan(_4692);
    bool _4702 = _4698 || _4700;
    bool _4704 = isnan(8000.0);
    bool _4706 = _4702 || _4704;
    float _4708 = float(_4706);
    float _4710 = _4696 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4712 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4714 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4712);
    float _4716 = exp2(_4710);
    float _4718 = _4539 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4720 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4714);
    float _4722 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4720);
    float _4724 = exp2(_4718);
    float _4726 = _4722 + _4531;
    out.gl_Position.x = _4585;
    out.gl_Position.y = _4601;
    out.gl_Position.z = _4722;
    out.gl_Position.w = _4531;
    float _4728 = _4726 * 0.5;
    float _4730 = fma(_4716, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4732 = precise::clamp(_4730, 0.0, 1.0);
    float _4734 = in.m_89.x;
    float _4736 = fma(_4732, -2.0, 3.0);
    float _4738 = _4732 * _4732;
    float _4740 = -_4724;
    float _4742 = _4740 + 1.0;
    float _4744 = _4738 * _4736;
    float _4746 = _4601;
    if (!_4662)
    {
        _4746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4748 = _4746;
    float _4750 = -_4744;
    float _4752 = _4750 + 1.0;
    float _4754 = fma(_4752, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4744);
    float _4756 = _4708 * _4754;
    float _4758 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.z = _4728;
    out.m_91.w = _4531;
    float _4760 = _4756 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4762 = -_4758;
    float _4764 = _4762 + 1.0;
    float _4766 = -_4603;
    float _4768 = _4766 + 1.0;
    float _4770 = _4768 * _4760;
    float _4772 = precise::clamp(_4770, 0.0, 1.0);
    float _4774 = -_4772;
    float _4776 = fma(_4774, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4778 = _4776 * _4734;
    float _4780 = _4758 * _4627;
    float _4782 = _4638 * _4764;
    float _4784 = _4778 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4786 = _4764;
    float _4788 = _4748;
    float _4790 = _4748;
    if (!_4662)
    {
        _4786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4792 = _4786;
    float _4794 = _4638 * _4780;
    float _4796 = _4648 * _4780;
    out.m_93.x = _4784;
    float _4798 = fma(_4644, _4794, _4632);
    float _4800 = fma(_4646, _4794, _4634);
    float _4802 = fma(_4638, _4796, _4636);
    float _4804 = _4796;
    float _4806 = _4792;
    float _4808 = _4792;
    if (!_4662)
    {
        _4804 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4810 = _4804;
    out.m_95.x = _4798;
    out.m_95.y = _4800;
    out.m_95.z = _4802;
    out.m_95.w = _4782;
    bool _4812 = !_4662;
    float _4814 = _4810;
    float _4816 = _4810;
    if (!_4812)
    {
        bool _4818 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4820 = isnan(_4313);
        bool _4822 = _4818 || _4820;
        bool _4824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4826 = _4822 || _4824;
        if (!_4826)
        {
            float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4830 = _4313 + _4828;
            float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4834 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4832;
            float _4836 = 1.0 / _4834;
            float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4842 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4846 = _4830 * _4836;
            float _4848 = precise::clamp(_4846, 0.0, 1.0);
            float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4854 = fma(_4848, _4844, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4856 = fma(_4848, _4852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4858 = fma(_4848, _4840, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4808 = _4858;
            _4790 = _4856;
            _4816 = _4854;
            _4860 = true;
        }
        else
        {
            bool _4862 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4864 = isnan(_4313);
            bool _4866 = _4862 || _4864;
            bool _4868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4870 = _4866 || _4868;
            if (!_4870)
            {
                _4788 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4872 = _4788;
            _4790 = _4872;
            if (!_4870)
            {
                _4806 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4874 = _4806;
            _4808 = _4874;
            if (!_4870)
            {
                _4814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4876 = _4814;
            bool _4878 = !_4870;
            _4816 = _4876;
            if (!_4878)
            {
                bool _4880 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4882 = isnan(_4313);
                bool _4884 = _4880 || _4882;
                bool _4886 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4888 = _4884 || _4886;
                if (!_4888)
                {
                    float _4890 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4892 = _4313 + _4890;
                    float _4894 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4896 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4894;
                    float _4898 = 1.0 / _4896;
                    float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4902 = _4900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4904 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4906 = _4904 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4908 = _4892 * _4898;
                    float _4910 = precise::clamp(_4908, 0.0, 1.0);
                    float _4912 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4914 = _4912 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4916 = fma(_4910, _4906, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4918 = fma(_4910, _4914, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4920 = fma(_4910, _4902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4808 = _4920;
                    _4790 = _4918;
                    _4816 = _4916;
                    _4860 = true;
                }
                else
                {
                    _4808 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4790 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4860 = false;
    float _4922 = _4808;
    float _4924 = _4790;
    float _4926 = _4816;
    float _4928 = _4922 * 0.586610972881317138671875;
    bool _4930 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4932 = fma(_4924, 0.298911988735198974609375, _4928);
    out.m_97.x = 0.0;
    float _4934 = fma(_4926, 0.114477999508380889892578125, _4932);
    float _4936 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4938 = -_4934;
    float _4940 = _4938 + _4924;
    float _4942 = -_4934;
    float _4944 = _4942 + _4922;
    float _4946 = -_4934;
    float _4948 = _4946 + _4926;
    out.m_93.w = _4936;
    float _4950 = fma(_4940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    float _4952 = fma(_4944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    float _4954 = fma(_4948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    out.m_99.x = _4950;
    out.m_99.y = _4952;
    out.m_99.z = _4954;
    if (!_4930)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4956 = -_4283;
    float _4958 = _4956 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4960 = -_4285;
    float _4962 = _4960 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4964 = -_4287;
    float _4966 = _4964 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4968 = _4958 * _4958;
    float _4970 = fma(_4962, _4962, _4968);
    float _4972 = fma(_4966, _4966, _4970);
    float _4974 = sqrt(_4972);
    float _4976 = rsqrt(_4972);
    float _4978 = -_4974;
    float _4980 = _4978 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4982 = _4980 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4984 = precise::clamp(_4982, 0.0, 1.0);
    float _4986 = _4962 * _4976;
    float _4988 = _4958 * _4976;
    float _4990 = abs(_4984);
    float _4992 = log2(_4990);
    float _4994 = _4966 * _4976;
    float _4996 = _4986 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4998 = _4105 * _4988;
    float _5000 = -_4988;
    float _5002 = -_4996;
    float _5004 = fma(_5000, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5002);
    float _5006 = fma(_4111, _4986, _4998);
    float _5008 = -_4994;
    float _5010 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5004);
    float _5012 = fma(_4115, _4994, _5006);
    float _5014 = precise::clamp(_5012, 0.0, 1.0);
    float _5016 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5018 = _5010 + _5016;
    float _5020 = _4992 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5022 = _5018 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5024 = precise::clamp(_5022, 0.0, 1.0);
    float _5026 = exp2(_5020);
    float _5028 = _5026 * _5024;
    float _5030 = _5014 * _5028;
    float _5032 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5034 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5036 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _5032;
    out.m_97.y = _5034;
    out.m_97.z = _5036;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4860 = false;
    bool _4161 = false;
    bool _696 = false;
    bool _580 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5092 = as_type<float>(_132);
        out.gl_Position.z = _5092;
    }
    if (!_122)
    {
        return out;
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5162 = as_type<float>(_172);
        out.gl_Position.z = _5162;
    }
    if (_164)
    {
        return out;
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_55.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _150 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = 1.0 / _208;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _232 = 1.0 / _216;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _204 + _234;
    bool _238 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_204);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = 1.0 / _212;
    float _252 = _236 * _222;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _204 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = _204 + _258;
    bool _262 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _264 = isnan(_204);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _226;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _204 + _278;
    float _282 = _256 * _232;
    bool _284 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _286 = isnan(_204);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -_272;
    float _298 = _296 + 1.0;
    float _300 = 1.0 / _230;
    float _302 = _280 * _250;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _204 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = fma(_310, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = 1.0 / _220;
    float _316 = _260 * _276;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _318;
    float _322 = fma(_320, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _326 = _204 + _324;
    float _328 = _326 * _300;
    float _330 = -_294;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _306 * _314;
    bool _340 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _342 = isnan(_204);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _272 * _332;
    float _354 = fma(_336, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _356 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_204);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = -_350;
    float _374 = _372 + 1.0;
    float _376 = _350 * _298;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = _366 * _374;
    bool _388 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_204);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -_366;
    float _402 = _400 + 1.0;
    bool _404 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _406 = isnan(_204);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = fma(_380, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = _248 * _402;
    float _420 = -_248;
    float _422 = _420 + 1.0;
    float _424 = -_414;
    float _426 = _424 + 1.0;
    float _428 = fma(_384, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_370, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _414 * _422;
    float _434 = _398 * _426;
    float _436 = -_398;
    float _438 = _436 + 1.0;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = _354 * _434;
    float _450 = _322 * _434;
    float _452 = _312 * _434;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _460 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _472 = fma(_416, _432, _458);
    float _474 = fma(_428, _432, _460);
    float _476 = fma(_430, _432, _462);
    float _478 = fma(_442, _282, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _486 = fma(_466, _282, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = fma(_478, _418, _472);
    float _490 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _500;
    float _504 = fma(_484, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _506 = fma(_480, _418, _476);
    float _508 = fma(_470, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _510 = fma(_486, _418, _474);
    float _512 = fma(_494, _316, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _514 = fma(_498, _316, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _516 = fma(_502, _316, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _518 = fma(_490, _386, _488);
    float _520 = fma(_504, _386, _506);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _530 = fma(_508, _386, _510);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _536 = fma(_512, _376, _518);
    float _538 = fma(_524, _328, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _540 = fma(_528, _328, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _542 = fma(_534, _328, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _544 = fma(_514, _376, _530);
    float _546 = fma(_516, _376, _520);
    float _548 = fma(_538, _352, _536);
    float _550 = fma(_540, _352, _544);
    float _552 = fma(_542, _352, _546);
    float _554 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].x, _548);
    float _556 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].y, _550);
    float _558 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].z, _552);
    bool _560 = !_274;
    float _578;
    if (!_560)
    {
        float _562 = in.m_55.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_118);
        float _584 = 1.0 / _582;
        float _586 = _150 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = _642 * _634;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _650 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _654 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = in.m_57.x;
    float _658 = in.m_57.y;
    float _660 = in.m_57.z;
    float _662 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = _662 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _654;
    out.m_59.y = _650;
    out.m_59.z = _668;
    out.m_59.w = _666;
    float _670 = _558 * _660;
    float _672 = _556 * _658;
    float _674 = _554 * _656;
    bool _676 = !_630;
    float _694;
    if (!_676)
    {
        float _678 = in.m_55.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_118);
        float _700 = 1.0 / _698;
        float _702 = _150 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _708 = int(_706);
    float _710 = in.m_55.y;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _714 = _712 != 0;
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _726 = int(_724);
    float _728 = float(_708);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _732 = float(_718);
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _736 = int(_734);
    float _738 = _710 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _740 = float(_726);
    float _742 = 1.0 / _728;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _750 = int(_748);
    float _752 = float(uint(_736));
    float _754 = in.m_55.x;
    bool _756 = _736 == 0;
    int _758 = ~_736;
    int _760 = _758 + 1;
    float _762 = 1.0 / _732;
    float _764 = _742 * _150;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _768 = int(_766);
    float _770 = float(uint(_750));
    float _772 = _732;
    if (_746)
    {
        _772 = 1.0;
    }
    float _774 = _772;
    float _776 = _774;
    if (!_746)
    {
        _776 = 7.345489978790283203125;
    }
    float _778 = _776;
    bool _780 = _750 == 0;
    float _782 = 1.0 / _740;
    float _784 = _762 * _150;
    float _786 = _778 * _754;
    int _788 = ~_750;
    int _790 = _788 + 1;
    float _792 = in.m_55.z;
    float _794 = 1.0 / _752;
    float _796 = float(uint(_768));
    int _798 = ~_768;
    int _800 = _798 + 1;
    int _802 = ~_768;
    int _804 = _802 + 1;
    float _806 = trunc(_764);
    int _808 = int(_806);
    float _810 = _782 * _150;
    float _812 = 1.0 / _770;
    int _814 = as_type<int>(_794) + (-2);
    float _816 = trunc(_784);
    int _818 = int(_816);
    float _820 = float(uint(_808));
    float _822 = as_type<float>(_814) * _820;
    float _824 = _820;
    float _826 = _822;
    if (_746)
    {
        _824 = 1.0;
    }
    float _828 = _824;
    float _830 = 1.0 / _796;
    int _832 = as_type<int>(_812) + (-2);
    float _834 = _828;
    if (!_746)
    {
        _834 = 1.2345600128173828125;
    }
    float _836 = _834;
    float _838 = trunc(_810);
    int _840 = int(_838);
    float _842 = float(uint(_818));
    float _844 = as_type<float>(_832) * _842;
    float _846 = _842;
    if (_746)
    {
        _846 = _754;
    }
    float _848 = _846;
    float _850 = trunc(_822);
    float _852 = precise::max(_850, 0.0);
    uint _855 = uint(_852);
    int _857 = as_type<int>(_830) + (-2);
    float _859 = _848;
    if (!_746)
    {
        _859 = _710;
    }
    float _861 = _859;
    float _863 = float(uint(_840));
    float _865 = trunc(_844);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _861 * _836;
    int _873 = ~_736;
    int _875 = _873 + 1;
    float _877 = as_type<float>(_857) * _863;
    float _879 = _863;
    if (_746)
    {
        _879 = _754;
    }
    float _881 = _879;
    int _883 = _875 * int(_855);
    int _885 = _883 + _808;
    float _887 = trunc(_877);
    float _889 = precise::max(_887, 0.0);
    uint _891 = uint(_889);
    float _893 = _881;
    if (_746)
    {
        _826 = 1.0;
    }
    float _895 = _826;
    float _897 = _895;
    if (!_746)
    {
        _893 = _792;
    }
    float _899 = _893;
    float _901 = float(uint(_885));
    if (!_746)
    {
        _897 = 5.839270114898681640625;
    }
    float _903 = _897;
    float _905 = floor(_786);
    int _907 = ~_750;
    int _909 = _907 + 1;
    float _911 = as_type<float>(_814) * _901;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _915 = _913 != 0;
    float _917 = _899 * _903;
    int _919 = _909 * int(_869);
    int _921 = _919 + _818;
    int _923 = _800 * int(_891);
    int _925 = _923 + _840;
    float _927 = trunc(_911);
    float _929 = precise::max(_927, 0.0);
    uint _931 = uint(_929);
    float _933 = float(uint(_921));
    float _935 = float(uint(_925));
    float _937 = as_type<float>(_832) * _933;
    float _939 = floor(_871);
    float _941 = as_type<float>(_857) * _935;
    float _943 = float(_736);
    float _945 = -_905;
    float _947 = _786 + _945;
    float _949 = float(_808);
    float _951 = float(_750);
    float _953 = trunc(_937);
    float _955 = precise::max(_953, 0.0);
    uint _957 = uint(_955);
    int _959 = int(_855) + int(_931);
    int _961 = ~_750;
    int _963 = _961 + 1;
    bool _965 = _949 >= _943;
    bool _967 = isnan(_949);
    bool _969 = _965 || _967;
    bool _971 = isnan(_943);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = floor(_917);
    float _979 = -_939;
    float _981 = _871 + _979;
    float _983 = _947 * _943;
    float _985 = _943 * _150;
    float _987 = trunc(_941);
    float _989 = precise::max(_987, 0.0);
    uint _991 = uint(_989);
    int _993 = int(_869) + int(_957);
    float _995 = -_977;
    float _997 = _917 + _995;
    int _999 = ~_736;
    int _1001 = _999 + 1;
    float _1003 = trunc(_975);
    int _1005 = int(_1003);
    int _1007 = _963 * _993;
    int _1009 = _1007 + _818;
    int _1011 = _1001 * _959;
    int _1013 = _1011 + _808;
    bool _1015 = uint(_1009) >= uint(_750);
    float _1017 = float(_118);
    float _1019 = _951 * _981;
    float _1021 = float(_818);
    float _1023 = trunc(_983);
    int _1025 = int(_1023);
    bool _1027 = uint(_1013) >= uint(_736);
    bool _1029 = _1021 >= _951;
    bool _1031 = isnan(_1021);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(_951);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    bool _1041 = !_915;
    int _1043 = _1041 ? 0 : 1;
    bool _1045 = !_714;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = trunc(_1019);
    int _1051 = int(_1049);
    int _1053 = int(_891) + int(_991);
    int _1055 = abs(_1043);
    int _1057 = abs(_1047);
    bool _1059 = !_1027;
    int _1061 = _1059 ? 0 : (-1);
    float _1063 = trunc(_1039);
    int _1065 = int(_1063);
    bool _1067 = !_1015;
    int _1069 = _1067 ? 0 : (-1);
    int _1071 = _1025 * _1055;
    int _1073 = _1071 + _808;
    int _1075 = ~_959;
    int _1077 = _1075 + _1061;
    int _1079 = _1077 + 1;
    int _1081 = ~_993;
    int _1083 = _1081 + _1069;
    int _1085 = _1083 + 1;
    float _1087 = 1.0 / _1017;
    int _1089 = _736 * _1079;
    int _1091 = _1089 + _808;
    int _1093 = ~_1005;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _750 * _1085;
    int _1101 = _1099 + _818;
    int _1103 = _1051 * _1057;
    int _1105 = _1103 + _818;
    bool _1107 = !_756;
    int _1109 = _1107 ? _1091 : (-1);
    int _1111 = ~_1065;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = 1.0 / _722;
    bool _1119 = !_780;
    int _1121 = _1119 ? _1101 : (-1);
    int _1123 = _1109 * _1097;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1127 = _1125 != 0;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1131 = _1129 != 0;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1135 = _1133 != 0;
    int _1137 = ~_768;
    int _1139 = _1137 + 1;
    int _1141 = _1115 * _1121;
    float _1143 = _985 * _1087;
    bool _1145 = !_1131;
    int _1147 = _1145 ? 0 : 1;
    bool _1149 = !_1127;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = _1139 * _1053;
    int _1155 = _1153 + _840;
    int _1157 = _736 + (-1);
    float _1159 = trunc(_1143);
    int _1161 = int(_1159);
    int _1163 = abs(_1147);
    int _1165 = _750 + (-1);
    int _1167 = _1005 * _1157;
    int _1169 = _1167 + _1123;
    int _1171 = abs(_1151);
    int _1173 = _1065 * _1165;
    int _1175 = _1173 + _1141;
    bool _1177 = uint(_1155) >= uint(_768);
    float _1179 = _1087 * _150;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1183 = _1181 != 0;
    int _1185 = _1169 * _1163;
    float _1187 = _951 * _1179;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1195 = _1193 != 0;
    float _1197 = in.m_61.x;
    float _1199 = in.m_61.y;
    float _1201 = in.m_61.z;
    bool _1203 = !_1135;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = _1161 * _1171;
    int _1209 = _1207 + _1185;
    bool _1211 = !_1183;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = trunc(_1187);
    int _1217 = int(_1215);
    bool _1219 = !_1195;
    int _1221 = _1219 ? 0 : 1;
    int _1223 = abs(_1205);
    int _1225 = abs(_1221);
    int _1227 = abs(_1213);
    int _1229 = _1175 * _1225;
    float _1231 = float(_768);
    int _1233 = _1073 * _1223;
    int _1235 = _1233 + _1209;
    float _1237 = float(_840);
    float _1239 = in.m_63.x;
    bool _1241 = !_1191;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = _1025 * _1227;
    int _1247 = _1245 + _1235;
    bool _1249 = _1237 >= _1231;
    bool _1251 = isnan(_1237);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan(_1231);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = _1231 * _1179;
    int _1263 = abs(_1243);
    float _1265 = trunc(_1259);
    int _1267 = int(_1265);
    float _1269 = float(uint(_1247));
    bool _1271 = !_1177;
    int _1273 = _1271 ? 0 : (-1);
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1277 = _1275 != 0;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1281 = _1279 != 0;
    int _1283 = _1217 * _1263;
    int _1285 = _1283 + _1229;
    int _1287 = ~_1053;
    int _1289 = _1287 + _1273;
    int _1291 = _1289 + 1;
    float _1293 = as_type<float>(_814) * _1269;
    bool _1295 = _768 == 0;
    bool _1297 = !_1277;
    int _1299 = _1297 ? 0 : 1;
    int _1301 = _768 * _1291;
    int _1303 = _1301 + _840;
    float _1305 = trunc(_1293);
    float _1307 = precise::max(_1305, 0.0);
    uint _1309 = uint(_1307);
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1313 = _1311 != 0;
    int _1315 = abs(_1299);
    int _1317 = ~_1267;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    bool _1323 = !_1295;
    int _1325 = _1323 ? _1303 : (-1);
    float _1327 = _1231 * _997;
    int _1329 = ~_736;
    int _1331 = _1329 + 1;
    int _1333 = _1105 * _1315;
    int _1335 = _1333 + _1285;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1339 = _1337 != 0;
    int _1341 = _1321 * _1325;
    bool _1343 = !_1281;
    int _1345 = _1343 ? 0 : 1;
    float _1347 = trunc(_1261);
    int _1349 = int(_1347);
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1357 = _1355 != 0;
    int _1359 = abs(_1345);
    int _1361 = _1331 * int(_1309);
    int _1363 = _1361 + _1247;
    int _1365 = _768 + (-1);
    float _1367 = as_type<float>(_1315);
    bool _1369 = _1339;
    if (!_1313)
    {
        _1367 = _1239;
    }
    float _1371 = _1367;
    float _1373 = trunc(_1327);
    int _1375 = int(_1373);
    float _1377 = float(uint(_1363));
    int _1379 = _1051 * _1359;
    int _1381 = _1379 + _1335;
    bool _1383 = !_1357;
    int _1385 = _1383 ? 0 : 1;
    int _1387 = _1267 * _1365;
    int _1389 = _1387 + _1341;
    bool _1391 = !_1339;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = as_type<float>(_814) * _1377;
    int _1397 = abs(_1385);
    float _1399 = float(uint(_1381));
    float _1401 = 0.0;
    float _1403 = _1371;
    if (!_1313)
    {
        _1401 = _1371;
    }
    float _1405 = _1401;
    int _1407 = _1389 * _1397;
    float _1409 = _1405;
    if (_1313)
    {
        _1403 = _1239;
    }
    float _1411 = _1403;
    float _1413 = trunc(_1395);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    bool _1419 = !_1353;
    int _1421 = _1419 ? 0 : 1;
    int _1423 = abs(_1393);
    float _1425 = as_type<float>(_832) * _1399;
    int _1427 = abs(_1421);
    int _1429 = _1421;
    float _1431 = _1411;
    if (_1313)
    {
        float _1433 = -_1411;
        float _1435 = _1433 + 1.0;
        _1429 = as_type<int>(_1435);
    }
    int _1437 = _1429;
    if (_1313)
    {
        bool _1439 = _754 > 0.5;
        _1369 = _1439;
    }
    bool _1441 = _1369;
    float _1443 = trunc(_1425);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    int _1449 = _1375 * _1423;
    int _1451 = _1449 + _840;
    if (_1313)
    {
        float _1453 = _1441 ? as_type<float>(_1437) : _1411;
        _1409 = _1453;
    }
    float _1455 = _1409;
    float _1457 = in.m_55.w;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1461 = _1459 != 0;
    int _1463 = _1349 * _1427;
    int _1465 = _1463 + _1407;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1469 = _1467 != 0;
    bool _1471 = !_1461;
    int _1473 = _1471 ? 0 : 1;
    bool _1475 = !_1469;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = ~_750;
    int _1481 = _1479 + 1;
    int _1483 = abs(_1473);
    int _1485 = abs(_1477);
    int _1487 = _1481 * int(_1447);
    int _1489 = _1487 + _1381;
    float _1491 = in.m_63.y;
    int _1493 = _1451 * _1483;
    int _1495 = _1493 + _1465;
    int _1497 = int(_1309) + int(_1417);
    int _1499 = ~_736;
    int _1501 = _1499 + 1;
    int _1503 = _1375 * _1485;
    int _1505 = _1503 + _1495;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1509 = _1507 != 0;
    float _1511 = float(uint(_1489));
    int _1513 = _1501 * _1497;
    int _1515 = _1513 + _1247;
    float _1517 = float(uint(_1505));
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1521 = _1519 != 0;
    float _1523 = as_type<float>(_832) * _1511;
    bool _1525 = uint(_1515) >= uint(_736);
    float _1527 = as_type<float>(_857) * _1517;
    int _1529 = ~_768;
    int _1531 = _1529 + 1;
    bool _1533 = !_1525;
    int _1535 = _1533 ? 0 : (-1);
    int _1537 = _1515;
    if (_1509)
    {
        float _1539 = -_1411;
        float _1541 = _1539 + 1.0;
        _1537 = as_type<int>(_1541);
    }
    int _1543 = _1537;
    bool _1545 = _792 > 0.5;
    float _1547 = trunc(_1527);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    float _1553 = 0.0;
    int _1555 = _1543;
    if (!_1509)
    {
        _1553 = _1411;
    }
    float _1557 = _1553;
    float _1559 = -_1491;
    float _1561 = _1559 + 1.0;
    float _1563 = _1557;
    float _1565 = _1491;
    if (_1509)
    {
        float _1567 = _1545 ? as_type<float>(_1543) : _1411;
        _1563 = _1567;
    }
    float _1569 = _1563;
    if (_1521)
    {
        float _1571 = -_1411;
        float _1573 = _1571 + 1.0;
        _1555 = as_type<int>(_1573);
    }
    int _1575 = _1555;
    bool _1577 = _710 > 0.5;
    int _1579 = ~_1497;
    int _1581 = _1579 + _1535;
    int _1583 = _1581 + 1;
    float _1585 = trunc(_1523);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    if (_1521)
    {
        float _1591 = _1577 ? as_type<float>(_1575) : _1411;
        _1431 = _1591;
    }
    float _1593 = _1431;
    int _1595 = _1577 ? as_type<int>(_1561) : as_type<int>(_1491);
    int _1597 = _736 * _1583;
    int _1599 = _1597 + _1247;
    int _1601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1603 = _1601 != 0;
    bool _1605 = _1457 > 0.5;
    int _1607 = _1531 * int(_1551);
    int _1609 = _1607 + _1505;
    float _1611 = _1603 ? as_type<float>(_1595) : _1491;
    int _1613 = ~_750;
    int _1615 = _1613 + 1;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1619 = _1617 != 0;
    float _1621 = float(uint(_1609));
    int _1623 = int(_1447) + int(_1589);
    int _1625 = _1605 ? as_type<int>(_1561) : as_type<int>(_1491);
    float _1627 = as_type<float>(_857) * _1621;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1631 = _1629 != 0;
    int _1633 = _1615 * _1623;
    int _1635 = _1633 + _1381;
    bool _1637 = _736 == 0;
    float _1639 = _710 * 2.0;
    float _1641 = _1631 ? as_type<float>(_1625) : _1491;
    bool _1643 = uint(_1635) >= uint(_750);
    float _1645 = trunc(_1627);
    float _1647 = precise::max(_1645, 0.0);
    uint _1649 = uint(_1647);
    bool _1651 = !_1637;
    int _1653 = _1651 ? _1599 : (-1);
    if (_1619)
    {
        float _1655 = _1545 ? _1561 : _1491;
        _1565 = _1655;
    }
    float _1657 = _1565;
    bool _1659 = !_1643;
    int _1661 = _1659 ? 0 : (-1);
    int _1663 = _1653 & 3;
    bool _1665 = _1663 != 0;
    float _1667 = floor(_1639);
    int _1669 = _1653 & 3;
    bool _1671 = _1669 != 0;
    int _1673 = ~_1623;
    int _1675 = _1673 + _1661;
    int _1677 = _1675 + 1;
    bool _1679 = uint(_1663) >= 2u;
    int _1681 = _1671 ? 0 : 1;
    int _1683 = _750 * _1677;
    int _1685 = _1683 + _1381;
    bool _1687 = uint(_1663) > 1u;
    int _1689 = _1679 ? 0 : 1;
    bool _1691 = _1663 != 3;
    bool _1693 = _750 == 0;
    int _1695 = ~_1681;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    bool _1701 = !_1693;
    int _1703 = _1701 ? _1685 : (-1);
    int _1705 = ~_768;
    int _1707 = _1705 + 1;
    int _1709 = int(_1551) + int(_1649);
    int _1711 = _1699;
    if (!_1687)
    {
        int _1713 = ~_1681;
        int _1715 = _1713 + 1;
        _1711 = _1715;
    }
    int _1717 = _1711;
    int _1719 = _1703 & 3;
    bool _1721 = _1719 != 0;
    int _1723 = _1707 * _1709;
    int _1725 = _1723 + _1505;
    int _1727 = ~_1689;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    int _1733 = _1731;
    if (_1691)
    {
        int _1735 = ~_1689;
        int _1737 = _1735 + 1;
        _1733 = _1737;
    }
    int _1739 = _1733;
    bool _1741 = uint(_1719) >= 2u;
    int _1743 = _1721 ? 0 : 1;
    int _1745 = _1741 ? 0 : 1;
    bool _1747 = uint(_1725) >= uint(_768);
    float _1749 = _754 * 2.0;
    bool _1751 = _1719 != 3;
    bool _1753 = !_1747;
    int _1755 = _1753 ? 0 : (-1);
    int _1757 = ~_1745;
    int _1759 = _1757 + 1;
    int _1761 = _1759 + 1;
    float _1763 = floor(_1749);
    int _1765 = ~_1709;
    int _1767 = _1765 + _1755;
    int _1769 = _1767 + 1;
    float _1771 = float(uint(_1451));
    bool _1773 = uint(_1719) > 1u;
    int _1775 = _768 * _1769;
    int _1777 = _1775 + _1505;
    float _1779 = float(uint(_1105));
    float _1781 = as_type<float>(_857) * _1771;
    int _1783 = _1761;
    int _1785 = _1743;
    if (_1751)
    {
        int _1787 = ~_1745;
        int _1789 = _1787 + 1;
        _1783 = _1789;
    }
    int _1791 = _1783;
    float _1793 = float(uint(_1073));
    float _1795 = as_type<float>(_832) * _1779;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1799 = _1797 != 0;
    float _1801 = trunc(_1781);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1809 = _1807 != 0;
    float _1811 = as_type<float>(_814) * _1793;
    bool _1813 = !_1799;
    int _1815 = _1813 ? 0 : 1;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1819 = _1817 != 0;
    int _1821 = ~_736;
    int _1823 = _1821 + 1;
    float _1825 = trunc(_1811);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    int _1831 = ~_750;
    int _1833 = _1831 + 1;
    bool _1835 = !_1295;
    int _1837 = _1835 ? _1777 : (-1);
    int _1839 = ~_768;
    int _1841 = _1839 + 1;
    bool _1843 = !_1819;
    int _1845 = _1843 ? 0 : 1;
    float _1847 = trunc(_1795);
    float _1849 = precise::max(_1847, 0.0);
    uint _1851 = uint(_1849);
    int _1853 = _1837 & 3;
    bool _1855 = _1853 != 0;
    int _1857 = _1841 * int(_1805);
    int _1859 = _1857 + _1451;
    int _1861 = ~_1743;
    int _1863 = _1861 + 1;
    int _1865 = _1863 + 1;
    int _1867 = _1865;
    int _1869 = as_type<int>(_1811);
    if (!_1773)
    {
        int _1871 = ~_1743;
        int _1873 = _1871 + 1;
        _1867 = _1873;
    }
    int _1875 = _1867;
    if (_1809)
    {
        _1785 = 0;
        _1869 = 0;
    }
    int _1877 = _1785;
    int _1879 = _1869;
    int _1881 = _1823 * int(_1829);
    int _1883 = _1881 + _1073;
    bool _1885 = uint(_1853) >= 2u;
    bool _1887 = _1853 != 3;
    int _1889 = _1877;
    int _1891 = _1879;
    if (!_1809)
    {
        _1889 = 1;
    }
    int _1893 = _1889;
    float _1895 = float(uint(_1883));
    int _1897 = _1833 * int(_1851);
    int _1899 = _1897 + _1105;
    int _1901 = _1885 ? 0 : 1;
    float _1903 = float(uint(_1859));
    float _1905 = as_type<float>(_814) * _1895;
    float _1907 = float(uint(_1899));
    bool _1909 = _1893 != 1;
    float _1911 = as_type<float>(_857) * _1903;
    if (!_1809)
    {
        _1891 = 2;
    }
    int _1913 = _1891;
    float _1915 = as_type<float>(_832) * _1907;
    int _1917 = ~_1901;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    float _1923 = trunc(_1905);
    float _1925 = precise::max(_1923, 0.0);
    uint _1927 = uint(_1925);
    float _1929 = _1855 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1931 = uint(_1853) > 1u;
    int _1933 = _1921;
    float _1935 = _1929;
    if (_1887)
    {
        int _1937 = ~_1901;
        int _1939 = _1937 + 1;
        _1933 = _1939;
    }
    int _1941 = _1933;
    bool _1943 = _1913 != 2;
    float _1945 = trunc(_1915);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    float _1951 = 0.0;
    if (!_1909)
    {
        _1951 = _710;
    }
    float _1953 = _1951;
    float _1955 = 0.0;
    float _1957 = _1953;
    if (!_1909)
    {
        _1955 = _792;
    }
    float _1959 = _1955;
    float _1961 = 0.0;
    float _1963 = _1959;
    if (!_1909)
    {
        _1961 = _1953;
    }
    float _1965 = _1961;
    float _1967 = 0.0;
    float _1969 = _1965;
    if (!_1909)
    {
        _1967 = _792;
    }
    float _1971 = _1967;
    float _1973 = trunc(_1911);
    float _1975 = precise::max(_1973, 0.0);
    uint _1977 = uint(_1975);
    float _1979 = _1971;
    if (_1909)
    {
        _1969 = _754;
    }
    float _1981 = _1969;
    if (_1909)
    {
        _1957 = _754;
    }
    float _1983 = _1957;
    if (_1909)
    {
        _1963 = _710;
    }
    float _1985 = _1963;
    if (_1909)
    {
        _1979 = _710;
    }
    float _1987 = _1979;
    bool _1989 = _1763 >= 0.0;
    bool _1991 = isnan(_1763);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    int _1999 = ~as_type<int>(_1929);
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003;
    if (!_1931)
    {
        int _2007 = ~as_type<int>(_1929);
        int _2009 = _2007 + 1;
        _2005 = _2009;
    }
    int _2011 = _2005;
    bool _2013 = _1763 > 0.0;
    if (_1943)
    {
        _1935 = _754;
    }
    float _2015 = _1935;
    float _2017 = 0.0;
    float _2019 = _2015;
    if (_1943)
    {
        _2017 = _710;
    }
    float _2021 = _2017;
    int _2023 = _1997 ? 0 : 1;
    float _2025 = _2021;
    if (!_1943)
    {
        _2019 = _792;
    }
    float _2027 = _2019;
    if (!_1943)
    {
        _2025 = _754;
    }
    float _2029 = _2025;
    bool _2031 = _1667 > 0.0;
    bool _2033 = _1667 >= 0.0;
    bool _2035 = isnan(_1667);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(0.0);
    bool _2041 = _2037 || _2039;
    int _2043 = int(_1829) + int(_1927);
    int _2045 = int(_1851) + int(_1949);
    float _2047 = in.m_65.x;
    float _2049 = in.m_65.y;
    float _2051 = in.m_65.z;
    int _2053 = int(_1805) + int(_1977);
    int _2055 = _760 * _2043;
    int _2057 = _2055 + _1073;
    int _2059 = ~_2023;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    float _2065 = in.m_48.x;
    float _2067 = in.m_48.y;
    float _2069 = in.m_48.z;
    int _2071 = _2063;
    if (!_2013)
    {
        int _2073 = ~_2023;
        int _2075 = _2073 + 1;
        _2071 = _2075;
    }
    int _2077 = _2071;
    int _2079 = _804 * _2053;
    int _2081 = _2079 + _1451;
    bool _2083 = uint(_2057) >= uint(_736);
    float _2085 = in.m_67.x;
    float _2087 = in.m_67.y;
    float _2089 = in.m_67.z;
    int _2091 = _790 * _2045;
    int _2093 = _2091 + _1105;
    int _2095 = _2041 ? 0 : 1;
    bool _2097 = !_2083;
    int _2099 = _2097 ? 0 : (-1);
    bool _2101 = uint(_2081) >= uint(_768);
    bool _2103 = uint(_2093) >= uint(_750);
    bool _2105 = !_2101;
    int _2107 = _2105 ? 0 : (-1);
    bool _2109 = !_2103;
    int _2111 = _2109 ? 0 : (-1);
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2115 = _2113 != 0;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2119 = _2117 != 0;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2123 = _2121 != 0;
    int _2125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2127 = _2125 != 0;
    int _2129 = ~_2095;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    float _2135 = _2067 * _2049;
    int _2137 = _2133;
    if (!_2031)
    {
        int _2139 = ~_2095;
        int _2141 = _2139 + 1;
        _2137 = _2141;
    }
    int _2143 = _2137;
    float _2145 = _2067 * _2087;
    float _2147 = _2067 * _1199;
    float _2149 = fma(_2065, _2047, _2135);
    float _2151 = fma(_2065, _2085, _2145);
    float _2153 = fma(_2065, _1197, _2147);
    float _2155 = _792 * 2.0;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2157;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2163 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2165 = _2159 * _1117;
    float _2167 = floor(_2155);
    bool _2169 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2171 = isnan(_704);
    bool _2173 = _2169 || _2171;
    bool _2175 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2177 = _2173 || _2175;
    float _2179 = float(_2177);
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2183 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2185 = isnan(_704);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2191 = _2187 || _2189;
    float _2193 = float(_2191);
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2197 = _704 + _2195;
    float _2199 = -_2161;
    float _2201 = fma(_2163, 2.0, _2199);
    float _2203 = -_2179;
    float _2205 = _2203 + 1.0;
    float _2207 = fma(_738, -2.0, _2181);
    float _2209 = fma(_2165, _2197, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2211 = fma(_2069, _2089, _2151);
    float _2213 = _2193 * _2205;
    float _2215 = _754 + _710;
    float _2217 = fma(_2069, _2051, _2149);
    float _2219 = _2209 * _2213;
    float _2221 = -_2193;
    float _2223 = _2221 + 1.0;
    float _2225 = _2215 + (-1.0);
    bool _2227 = _2167 >= 0.0;
    bool _2229 = isnan(_2167);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = fma(_2069, _1201, _2153);
    float _2239 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2219);
    float _2241 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2243 = _2235 ? 0 : 1;
    float _2245 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2239);
    bool _2247 = _2167 > 0.0;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2251 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2253 = _2211 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2255 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2259 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2261 = -_2249;
    float _2263 = fma(_2251, 2.0, _2261);
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2267 = _710 + _792;
    int _2269 = ~_2043;
    int _2271 = _2269 + _2099;
    int _2273 = _2271 + 1;
    float _2275 = _2217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2279 = _2253 + _2277;
    float _2281 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2283 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2285 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2287 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2289 = _2237 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2293 = _2275 + _2291;
    float _2295 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2297 = _2267 + (-1.0);
    int _2299 = ~_2243;
    int _2301 = _2299 + 1;
    int _2303 = _2301 + 1;
    out.m_69.x = _2281;
    out.m_69.y = _2283;
    out.m_69.z = _2285;
    out.m_69.w = _2255;
    int _2305 = _2303;
    if (!_2247)
    {
        int _2307 = ~_2243;
        int _2309 = _2307 + 1;
        _2305 = _2309;
    }
    int _2311 = _2305;
    float _2313 = fma(_1983, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2287);
    int _2315 = _736 * _2273;
    int _2317 = _2315 + _1073;
    float _2319 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2321 = !_2119;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2327 = !_2115;
    int _2329 = _2327 ? 0 : 1;
    float _2331 = fma(_2297, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2333 = abs(_2323);
    float _2335 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2325);
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2339 = _2289 + _2337;
    float _2341 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2295);
    int _2343 = _1653 >> 31;
    float _2345 = -_150;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2201);
    int _2349 = _1703 >> 31;
    float _2351 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2341);
    int _2353 = _2343 & 3;
    float _2355 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2207);
    int _2357 = _2349 & 3;
    float _2359 = -_150;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2263);
    bool _2363 = _2351 >= 0.0;
    float _2365 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2313);
    int _2367 = _1653 + _2353;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2371 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2373 = _1703 + _2357;
    float _2375 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2377 = _2367 >> 2;
    float _2379 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2335);
    int _2381 = _2373 >> 2;
    float _2383 = -_2369;
    float _2385 = fma(_2375, 2.0, _2383);
    int _2387 = _2377 << 4;
    int _2389 = _2387 + 368;
    int _2391 = abs(_2329);
    float _2393 = in.m_71.x;
    float _2395 = in.m_71.y;
    float _2397 = in.m_71.z;
    uint _2399 = uint(int(uint(_2389) >> uint(2)));
    uint _2401 = uint(int(uint(int(_2399)) >> uint(2)));
    int _2403 = int(_2399) & 3;
    float _2405 = (*spvDescriptorSet0.vp_c9)._m0[int(_2401)][_2403];
    int _2407 = int(_2399) + 1;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    int _2411 = _2407 & 3;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[int(_2409)][_2411];
    int _2415 = _2381 << 4;
    int _2417 = _2415 + 512;
    float _2419 = -_150;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2385);
    float _2423 = float(_2077);
    float _2425 = as_type<float>(_2311);
    float _2427 = _2347;
    float _2429 = _2355;
    if (_2363)
    {
        out.m_51.x = 0.0;
    }
    float _2431 = float(_2333);
    float _2433 = float(_2311);
    uint _2435 = uint(int(uint(_2417) >> uint(2)));
    uint _2437 = uint(int(uint(int(_2435)) >> uint(2)));
    int _2439 = int(_2435) & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    int _2443 = int(_2435) + 1;
    uint _2445 = uint(int(uint(_2443) >> uint(2)));
    int _2447 = _2443 & 3;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[int(_2445)][_2447];
    float _2451 = float(_2391);
    float _2453 = _2431 * _2423;
    bool _2455 = _736 == 0;
    float _2457 = _2451 * _2433;
    if (_2363)
    {
        _2425 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2459 = _2425;
    int _2461 = _2389 + 8;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    uint _2465 = uint(int(uint(int(_2463)) >> uint(2)));
    int _2467 = int(_2463) & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    int _2471 = int(_2463) + 1;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    int _2475 = _2471 & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    float _2479 = fma(_2319, -2.0, _730);
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2483 = _2457 * (-2.0);
    int _2485 = as_type<int>(_2459);
    if (_2363)
    {
        float _2487 = _2459 * 5.0;
        _2485 = as_type<int>(_2487);
    }
    int _2489 = _2485;
    int _2491 = ~_2045;
    int _2493 = _2491 + _2111;
    int _2495 = _2493 + 1;
    float _2497 = fma(_2371, -2.0, _2481);
    bool _2499 = !_1665;
    int _2501 = _2499 ? 0 : 1;
    int _2503 = abs(_1717);
    int _2505 = _750 * _2495;
    int _2507 = _2505 + _1105;
    int _2509 = _1703 & 3;
    bool _2511 = _2509 != 0;
    float _2513 = fma(_2241, _2483, _2241);
    if (_2363)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8581 = as_type<float>(_2489);
        out.gl_Position.z = _8581;
    }
    int _2515 = ~_2053;
    int _2517 = _2515 + _2107;
    int _2519 = _2517 + 1;
    float _2521 = fma(_2483, _2393, _2393);
    int _2523 = _1837 >> 31;
    float _2525 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2497);
    int _2527 = abs(_1875);
    float _2529 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2479);
    float _2531 = _2453 * (-2.0);
    int _2533 = _2523 & 3;
    int _2535 = ~_2503;
    int _2537 = _2535 + 1;
    int _2539 = _2537 + 1;
    int _2541 = _2417 + 8;
    uint _2543 = uint(int(uint(_2541) >> uint(2)));
    uint _2545 = uint(int(uint(int(_2543)) >> uint(2)));
    int _2547 = int(_2543) & 3;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[int(_2545)][_2547];
    int _2551 = int(_2543) + 1;
    uint _2553 = uint(int(uint(_2551) >> uint(2)));
    int _2555 = _2551 & 3;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[int(_2553)][_2555];
    int _2559 = _1837 & 3;
    bool _2561 = _2559 != 0;
    float _2563 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2565 = int(_2563);
    bool _2567 = !_2511;
    int _2569 = _2567 ? 0 : 1;
    int _2571 = _1837 + _2533;
    int _2573 = abs(_2501);
    int _2575 = _2539 * as_type<int>(_2413);
    int _2577 = abs(_2569);
    float _2579 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2581 = int(_2579);
    int _2583 = _2571 >> 2;
    int _2585 = abs(_1739);
    int _2587 = ~_2573;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = _2583 << 4;
    int _2595 = _2593 + 656;
    int _2597 = ~_2585;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = _2591 * as_type<int>(_2405);
    int _2605 = _2603 + _2575;
    bool _2607 = _1663 != 3;
    uint _2609 = uint(int(uint(_2595) >> uint(2)));
    uint _2611 = uint(int(uint(int(_2609)) >> uint(2)));
    int _2613 = int(_2609) & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    int _2617 = int(_2609) + 1;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    int _2621 = _2617 & 3;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[int(_2619)][_2621];
    int _2625 = ~_2527;
    int _2627 = _2625 + 1;
    int _2629 = _2627 + 1;
    int _2631 = _2601 * as_type<int>(_2469);
    int _2633 = _2631 + _2605;
    bool _2635 = !_2607;
    int _2637 = _2635 ? 0 : (-1);
    bool _2639 = _1719 != 3;
    int _2641 = _2629 * as_type<int>(_2449);
    int _2643 = ~_2577;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    bool _2649 = !_2639;
    int _2651 = _2649 ? 0 : (-1);
    int _2653 = abs(_1791);
    int _2655 = _2647 * as_type<int>(_2441);
    int _2657 = _2655 + _2641;
    int _2659 = abs(_2637);
    int _2661 = _2595 + 8;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    uint _2665 = uint(int(uint(int(_2663)) >> uint(2)));
    int _2667 = int(_2663) & 3;
    float _2669 = (*spvDescriptorSet0.vp_c9)._m0[int(_2665)][_2667];
    int _2671 = int(_2663) + 1;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    int _2675 = _2671 & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = abs(_2651);
    int _2681 = abs(_1845);
    float _2683 = float(uint(_2565));
    int _2685 = abs(_1815);
    int _2687 = ~_2653;
    int _2689 = _2687 + 1;
    int _2691 = _2689 + 1;
    float _2693 = 1.0 / _2683;
    int _2695 = _2691 * as_type<int>(_2549);
    int _2697 = _2695 + _2657;
    int _2699 = ~_2659;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = float(uint(_2581));
    int _2707 = _2703 * as_type<int>(_2477);
    int _2709 = _2707 + _2633;
    int _2711 = ~_2679;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    float _2717 = 1.0 / _2705;
    int _2719 = ~_2685;
    int _2721 = _2719 + 1;
    int _2723 = _2721 + 1;
    bool _2725 = !_2455;
    int _2727 = _2725 ? _2317 : (-1);
    int _2729 = _2715 * as_type<int>(_2557);
    int _2731 = _2729 + _2697;
    int _2733 = ~_2681;
    int _2735 = _2733 + 1;
    int _2737 = _2735 + 1;
    int _2739 = _2709 * _2723;
    bool _2741 = _750 == 0;
    float _2743 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2745 = int(_2743);
    bool _2747 = _1853 != 3;
    int _2749 = _2737 * _2731;
    bool _2751 = !_2741;
    int _2753 = _2751 ? _2507 : (-1);
    int _2755 = _2727 * _2685;
    int _2757 = _2755 + _2739;
    int _2759 = as_type<int>(_2693) + (-2);
    bool _2761 = !_2561;
    int _2763 = _2761 ? 0 : 1;
    int _2765 = _2753 * _2681;
    int _2767 = _2765 + _2749;
    bool _2769 = !_2747;
    int _2771 = _2769 ? 0 : (-1);
    float _2773 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2775 = log2(_2773);
    float _2777 = float(uint(_2757));
    int _2779 = abs(_2011);
    int _2781 = as_type<int>(_2717) + (-2);
    int _2783 = abs(_2771);
    float _2785 = as_type<float>(_2759) * _2777;
    int _2787 = abs(_2763);
    int _2789 = ~_2779;
    int _2791 = _2789 + 1;
    int _2793 = _2791 + 1;
    int _2795 = abs(_1941);
    float _2797 = trunc(_2785);
    float _2799 = precise::max(_2797, 0.0);
    uint _2801 = uint(_2799);
    float _2803 = float(uint(_2767));
    int _2805 = _2793 * as_type<int>(_2623);
    int _2807 = ~_2787;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    float _2813 = _2775 * _150;
    float _2815 = as_type<float>(_2781) * _2803;
    int _2817 = ~_2795;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = _2811 * as_type<int>(_2615);
    int _2825 = _2823 + _2805;
    bool _2827 = !_2127;
    int _2829 = _2827 ? 0 : 1;
    float _2831 = trunc(_2815);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = ~_2783;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2821 * as_type<int>(_2669);
    int _2845 = _2843 + _2825;
    int _2847 = abs(_2829);
    int _2849 = _768 * _2519;
    int _2851 = _2849 + _1451;
    int _2853 = ~_2581;
    int _2855 = _2853 + 1;
    int _2857 = _2841 * as_type<int>(_2677);
    int _2859 = _2857 + _2845;
    int _2861 = ~_2565;
    int _2863 = _2861 + 1;
    float _2865 = exp2(_2813);
    float _2867 = float(uint(_2745));
    int _2869 = _2863 * int(_2801);
    int _2871 = _2869 + _2757;
    int _2873 = ~_2847;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    int _2879 = abs(_2565);
    int _2881 = _2855 * int(_2835);
    int _2883 = _2881 + _2767;
    float _2885 = float(uint(_2871));
    int _2887 = _2877 * _2859;
    float _2889 = 1.0 / _2867;
    bool _2891 = !_1295;
    int _2893 = _2891 ? _2851 : (-1);
    float _2895 = float(uint(_2883));
    float _2897 = as_type<float>(_2759) * _2885;
    int _2899 = abs(_2581);
    int _2901 = _2893 * _2847;
    int _2903 = _2901 + _2887;
    float _2905 = float(uint(_2879));
    float _2907 = as_type<float>(_2781) * _2895;
    float _2909 = trunc(_2897);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    float _2915 = float(uint(_2899));
    int _2917 = abs(_2745);
    float _2919 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2921 = 1.0 + _2919;
    int _2923 = as_type<int>(_2889) + (-2);
    float _2925 = 1.0 / _2905;
    float _2927 = float(uint(_2917));
    float _2929 = float(uint(_2903));
    int _2931 = abs(_2767);
    float _2933 = 1.0 / _2915;
    float _2935 = as_type<float>(_2923) * _2929;
    float _2937 = float(uint(_2931));
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2941 = 1.0 / _2927;
    float _2943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2945 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2947 = isnan(1.0);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2953 = _2949 || _2951;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2957 = abs(_2757);
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2961 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2963 = isnan(0.0);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2969 = _2965 || _2967;
    float _2971 = 1.0 / _2921;
    int _2973 = as_type<int>(_2933) + (-2);
    float _2975 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2939);
    int _2977 = as_type<int>(_2925) + (-2);
    float _2979 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2943);
    float _2981 = float(uint(_2957));
    float _2983 = as_type<float>(_2973) * _2937;
    float _2985 = -_2865;
    float _2987 = _2985 + 1.0;
    float _2989 = trunc(_2935);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    int _2995 = abs(_2903);
    float _2997 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2955);
    float _2999 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2959);
    float _3001 = _2969 ? _2987 : 0.0;
    float _3003 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2975);
    float _3005 = as_type<float>(_2977) * _2981;
    float _3007 = _2279 * _2279;
    int _3009 = ~_2745;
    int _3011 = _3009 + 1;
    float _3013 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2979);
    int _3015 = as_type<int>(_2941) + (-2);
    float _3017 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2997);
    float _3019 = float(uint(_2995));
    float _3021 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2999);
    if (_2953)
    {
        float _3023 = _3001 * _2971;
        _154 = _3023;
    }
    float _3025 = _154;
    int _3027 = ~_2879;
    int _3029 = _3027 + 1;
    float _3031 = fma(_2293, _2293, _3007);
    float _3033 = trunc(_3005);
    float _3035 = precise::max(_3033, 0.0);
    uint _3037 = uint(_3035);
    float _3039 = as_type<float>(_3015) * _3019;
    int _3041 = _3011 * int(_2993);
    int _3043 = _3041 + _2903;
    float _3045 = fma(_2339, _2339, _3031);
    int _3047 = ~_2899;
    int _3049 = _3047 + 1;
    float _3051 = float(uint(_3043));
    float _3053 = trunc(_2983);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = ~_2917;
    int _3061 = _3059 + 1;
    int _3063 = int(_2801) + int(_2913);
    float _3065 = as_type<float>(_2923) * _3051;
    int _3067 = ~_2565;
    int _3069 = _3067 + 1;
    float _3071 = trunc(_3039);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    int _3077 = _3029 * int(_3037);
    int _3079 = _3077 + _2957;
    float _3081 = float(uint(_3079));
    float _3083 = rsqrt(_3045);
    int _3085 = _3049 * int(_3057);
    int _3087 = _3085 + _2931;
    float _3089 = as_type<float>(_2977) * _3081;
    int _3091 = ~_2581;
    int _3093 = _3091 + 1;
    float _3095 = float(uint(_3087));
    float _3097 = trunc(_2907);
    float _3099 = precise::max(_3097, 0.0);
    uint _3101 = uint(_3099);
    int _3103 = _3061 * int(_3075);
    int _3105 = _3103 + _2995;
    float _3107 = as_type<float>(_2973) * _3095;
    float _3109 = float(uint(_3105));
    float _3111 = trunc(_3089);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    float _3117 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3119 = _3117 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3121 = int(_2835) + int(_3101);
    float _3123 = _3119 * _3083;
    float _3125 = trunc(_3065);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    float _3131 = as_type<float>(_3015) * _3109;
    float _3133 = _754 + (-0.5);
    float _3135 = _2279 * _3123;
    float _3137 = _2293 * _3123;
    int _3139 = _3093 * _3121;
    int _3141 = _3139 + _2767;
    float _3143 = fma(_3133, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2521);
    float _3145 = -_3135;
    float _3147 = _2279 + _3145;
    float _3149 = trunc(_3107);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    float _3155 = -_3137;
    float _3157 = _2293 + _3155;
    float _3159 = _3147 * _3147;
    bool _3161 = uint(_3141) >= uint(_2581);
    int _3163 = _3069 * _3063;
    int _3165 = _3163 + _2757;
    int _3167 = int(_3037) + int(_3115);
    float _3169 = fma(_3157, _3157, _3159);
    int _3171 = int(_2993) + int(_3129);
    float _3173 = trunc(_3131);
    float _3175 = precise::max(_3173, 0.0);
    uint _3177 = uint(_3175);
    int _3179 = ~_2745;
    int _3181 = _3179 + 1;
    float _3183 = _2339 * _3123;
    int _3185 = ~_2917;
    int _3187 = _3185 + 1;
    float _3189 = fma(_2513, _3025, _3143);
    int _3191 = ~_2879;
    int _3193 = _3191 + 1;
    int _3195 = int(_3057) + int(_3153);
    int _3197 = _3181 * _3171;
    int _3199 = _3197 + _2903;
    bool _3201 = uint(_3165) >= uint(_2565);
    int _3203 = ~_2899;
    int _3205 = _3203 + 1;
    int _3207 = _3193 * _3167;
    int _3209 = _3207 + _2957;
    int _3211 = int(_3075) + int(_3177);
    float _3213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3215 = _3205 * _3195;
    int _3217 = _3215 + _2931;
    bool _3219 = !_3161;
    int _3221 = _3219 ? 0 : (-1);
    bool _3223 = uint(_3199) >= uint(_2745);
    int _3225 = _3187 * _3211;
    int _3227 = _3225 + _2995;
    bool _3229 = !_3201;
    int _3231 = _3229 ? 0 : (-1);
    float _3233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3235 = uint(_3209) >= uint(_2879);
    int _3237 = ~_3063;
    int _3239 = _3237 + _3231;
    int _3241 = _3239 + 1;
    bool _3243 = uint(_3217) >= uint(_2899);
    int _3245 = ~_3121;
    int _3247 = _3245 + _3221;
    int _3249 = _3247 + 1;
    int _3251 = _2565 * _3241;
    int _3253 = _3251 + _2757;
    bool _3255 = uint(_3227) >= uint(_2917);
    float _3257 = _3213 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3259 = !_3223;
    int _3261 = _3259 ? 0 : (-1);
    int _3263 = _2581 * _3249;
    int _3265 = _3263 + _2767;
    bool _3267 = !_3235;
    int _3269 = _3267 ? 0 : (-1);
    bool _3271 = _2565 == 0;
    float _3273 = _3233 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3275 = _2565 == 0;
    int _3277 = _2757 ^ _2565;
    float _3279 = fma(_3273, _1455, -0.5);
    float _3281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3283 = !_3243;
    int _3285 = _3283 ? 0 : (-1);
    bool _3287 = _2581 == 0;
    int _3289 = _2767 ^ _2581;
    int _3291 = ~_3171;
    int _3293 = _3291 + _3261;
    int _3295 = _3293 + 1;
    float _3297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3299 = !_3271;
    int _3301 = _3299 ? _3253 : (-1);
    bool _3303 = !_3287;
    int _3305 = _3303 ? _3265 : (-1);
    bool _3307 = !_3255;
    int _3309 = _3307 ? 0 : (-1);
    bool _3311 = _2581 == 0;
    int _3313 = ~_3269;
    int _3315 = _3167 + _3313;
    int _3317 = _3315 + 1;
    int _3319 = _2903 ^ _2745;
    int _3321 = _2745 * _3295;
    int _3323 = _3321 + _2903;
    int _3325 = ~_3285;
    int _3327 = _3195 + _3325;
    int _3329 = _3327 + 1;
    float _3331 = float(_3301);
    float _3333 = _3281 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3335 = float(_3305);
    float _3337 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3339 = _2745 == 0;
    float _3341 = fma(_3273, _3331, _2347);
    bool _3343 = _2745 == 0;
    float _3345 = fma(_3333, _3335, _2421);
    float _3347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3349 = uint(int(uint(_3289) >> uint(31)));
    float _3351 = fma(_3337, _1593, -0.5);
    uint _3353 = uint(int(uint(_3277) >> uint(31)));
    float _3355 = fma(_3333, _1569, -0.5);
    uint _3357 = uint(int(uint(_3319) >> uint(31)));
    float _3359 = fma(_3013, _3279, _3341);
    bool _3361 = !_3339;
    int _3363 = _3361 ? _3323 : (-1);
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3367 = ~int(_3349);
    int _3369 = _3367 + 1;
    float _3371 = fma(_2365, _3355, _3345);
    int _3373 = ~_3309;
    int _3375 = _3211 + _3373;
    int _3377 = _3375 + 1;
    int _3379 = ~int(_3353);
    int _3381 = _3379 + 1;
    int _3383 = ~int(_3357);
    int _3385 = _3383 + 1;
    float _3387 = float(_3363);
    int _3389 = _3329 ^ _3369;
    int _3391 = _3317 ^ _3381;
    float _3393 = fma(_3337, _3387, _2361);
    int _3395 = _3377 ^ _3385;
    int _3397 = ~_3369;
    int _3399 = _3397 + _3389;
    int _3401 = _3399 + 1;
    float _3403 = fma(_3021, _3351, _3393);
    int _3405 = ~_3381;
    int _3407 = _3405 + _3391;
    int _3409 = _3407 + 1;
    float _3411 = _3347 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3413 = ~_3385;
    int _3415 = _3413 + _3395;
    int _3417 = _3415 + 1;
    float _3419 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3421 = !_3311;
    int _3423 = _3421 ? _3401 : (-1);
    float _3425 = fma(_1641, _3411, -0.5);
    bool _3427 = !_3275;
    int _3429 = _3427 ? _3409 : (-1);
    float _3431 = fma(_1611, _3257, -0.5);
    bool _3433 = !_3343;
    int _3435 = _3433 ? _3417 : (-1);
    float _3437 = fma(_2331, _2531, _2331);
    float _3439 = float(_3423);
    float _3441 = float(_3429);
    float _3443 = float(_3435);
    float _3445 = -_2525;
    float _3447 = fma(_3411, _3439, _3445);
    float _3449 = fma(_3419, _1657, -0.5);
    float _3451 = -_2355;
    float _3453 = fma(_3257, _3441, _3451);
    float _3455 = _3371 + 0.5;
    float _3457 = -_2529;
    float _3459 = fma(_3419, _3443, _3457);
    float _3461 = fma(_2379, _3425, _3447);
    float _3463 = fma(_3017, _3431, _3453);
    float _3465 = _3403 + 0.5;
    float _3467 = fma(_3003, _3449, _3459);
    float _3469 = _3359 + 0.5;
    float _3471 = _3463 + 0.5;
    float _3473 = _3461 + 0.5;
    float _3475 = _3467 + 0.5;
    float _3477 = -_3183;
    float _3479 = _2339 + _3477;
    float _3481 = fma(_2531, _2395, _2395);
    bool _3483 = !_2123;
    int _3485 = _3483 ? 0 : 1;
    out.m_73.x = _3469;
    out.m_73.y = _3471;
    out.m_73.z = _3455;
    out.m_73.w = _3473;
    float _3487 = fma(_3479, _3479, _3169);
    float _3489 = _710 + (-0.5);
    out.m_75.x = _3465;
    out.m_75.y = _3475;
    float _3491 = as_type<float>(_3187);
    if (_2363)
    {
        return out;
    }
    float _3493 = -_3135;
    float _3495 = _2253 + _3493;
    int _3497 = abs(_3485);
    float _3499 = -_3137;
    float _3501 = _2275 + _3499;
    float _3503 = float(_2143);
    float _3505 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3507 = _3495 + _3505;
    float _3509 = -_3183;
    float _3511 = _2289 + _3509;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3515 = _3501 + _3513;
    float _3517 = _754 + _792;
    float _3519 = _3507 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3523 = _3511 + _3521;
    float _3525 = _792 + (-0.5);
    float _3527 = _3517 + (-1.0);
    float _3529 = fma(_3515, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3519);
    float _3531 = float(_3497);
    float _3533 = fma(_3489, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3481);
    float _3535 = _3189 * 0.15915493667125701904296875;
    float _3537 = fma(_3523, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3529);
    float _3539 = sqrt(_3487);
    float _3541 = _3531 * _3503;
    float _3543 = fma(_3437, _3025, _3533);
    bool _3545 = _3537 >= 0.0;
    float _3547 = _3541 * (-2.0);
    float _3549 = fma(_3527, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3551 = _3543 * 0.15915493667125701904296875;
    float _3553 = fma(_3547, _2397, _2397);
    float _3555 = _3535 * 6.283185482025146484375;
    float _3557 = sin(_3555);
    float _3559 = fma(_3549, _3547, _3549);
    float _3561 = fma(_3525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3553);
    float _3563 = fma(_3559, _3025, _3561);
    float _3565 = _3543;
    float _3567 = _3507;
    float _3569 = _3515;
    float _3571 = _3523;
    if (_3545)
    {
        _3565 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3573 = _3565;
    float _3575 = _3535 * 6.283185482025146484375;
    float _3577 = cos(_3575);
    float _3579 = _3563 * 0.15915493667125701904296875;
    int _3581 = as_type<int>(_3573);
    if (_3545)
    {
        out.m_51.x = 0.0;
    }
    if (_3545)
    {
        float _3583 = _3573 * 5.0;
        _3581 = as_type<int>(_3583);
    }
    int _3585 = _3581;
    float _3587 = _3551 * 6.283185482025146484375;
    float _3589 = sin(_3587);
    if (_3545)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10107 = as_type<float>(_3585);
        out.gl_Position.z = _10107;
    }
    float _3591 = _3551 * 6.283185482025146484375;
    float _3593 = cos(_3591);
    float _3595 = _3579 * 6.283185482025146484375;
    float _3597 = sin(_3595);
    if (_3545)
    {
        return out;
    }
    float _3599 = -_2253;
    float _3601 = _3599 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3603 = -_2275;
    float _3605 = _3603 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3607 = -_2289;
    float _3609 = _3607 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3611 = in.m_77.x;
    float _3613 = in.m_77.y;
    float _3615 = in.m_77.z;
    float _3617 = _3601 * _3601;
    float _3619 = _3579 * 6.283185482025146484375;
    float _3621 = cos(_3619);
    float _3623 = _3083 * _3539;
    float _3625 = _3557 * _3589;
    float _3627 = fma(_3605, _3605, _3617);
    float _3629 = _3577 * _3593;
    float _3631 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3633 = _3577 * _3589;
    float _3635 = fma(_3609, _3609, _3627);
    float _3637 = fma(_3597, _3629, _3625);
    float _3639 = fma(_3597, _3625, _3629);
    float _3641 = rsqrt(_3635);
    float _3643 = _3557 * _3593;
    float _3645 = _3623 * _3631;
    float _3647 = _3589 * _3621;
    float _3649 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3651 = _3577 * _3621;
    float _3653 = _3593 * _3621;
    float _3655 = _3557 * _3621;
    float _3657 = _3117 * _3623;
    float _3659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3611);
    float _3661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3613);
    float _3663 = _3623 * _3649;
    float _3665 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3615);
    float _3667 = _3659 * _3657;
    float _3669 = _3605 * _3641;
    float _3671 = _3609 * _3641;
    float _3673 = _3661 * _3645;
    float _3675 = _3665 * _3663;
    float _3677 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3679 = _3669 * _3677;
    float _3681 = in.m_79.x;
    float _3683 = in.m_79.y;
    float _3685 = in.m_79.z;
    float _3687 = _3601 * _3641;
    float _3689 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3691 = _3671 * _3689;
    float _3693 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3695 = -_3679;
    float _3697 = fma(_3671, _3693, _3695);
    bool _3699 = _3613 != 0.0;
    bool _3701 = isnan(_3613);
    bool _3703 = _3699 || _3701;
    bool _3705 = isnan(0.0);
    bool _3707 = _3703 || _3705;
    float _3709 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3711 = _3687 * _3709;
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3715 = -_3691;
    float _3717 = fma(_3687, _3713, _3715);
    float _3719 = _3697 * _3697;
    bool _3721 = _3611 == 0.0;
    bool _3723 = !_3707;
    bool _3725 = _3721 && _3723;
    float _3727 = -_3633;
    float _3729 = fma(_3597, _3643, _3727);
    float _3731 = -_3643;
    float _3733 = fma(_3597, _3633, _3731);
    float _3735 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3737 = -_3711;
    float _3739 = fma(_3669, _3735, _3737);
    float _3741 = fma(_3717, _3717, _3719);
    float _3743 = in.m_81.x;
    float _3745 = in.m_81.y;
    float _3747 = in.m_81.z;
    float _3749 = in.m_81.w;
    bool _3751 = _3615 == 0.0;
    bool _3753 = _3751 && _3725;
    float _3755 = -_3673;
    float _3757 = _3597 * _3755;
    float _3759 = fma(_3739, _3739, _3741);
    float _3761 = _3651 * _3673;
    float _3763 = _3655 * _3673;
    float _3765 = fma(_3653, _3667, _3757);
    float _3767 = rsqrt(_3759);
    float _3769 = fma(_3637, _3667, _3761);
    float _3771 = fma(_3729, _3667, _3763);
    float _3773 = fma(_3647, _3675, _3765);
    float _3775 = fma(_3733, _3675, _3769);
    float _3777 = _3667;
    float _3779 = _3741;
    float _3781 = _3763;
    float _3783 = _3639;
    if (_3753)
    {
        _2427 = _3681;
    }
    float _3785 = _2427;
    float _3787 = _3785;
    if (_3753)
    {
        _2429 = _3685;
    }
    float _3789 = _2429;
    float _3791 = _3789;
    if (_3753)
    {
        _3491 = _3683;
    }
    float _3793 = _3491;
    float _3795 = _3793;
    if (_3753)
    {
        _3777 = _3785;
    }
    float _3797 = _3777;
    float _3799 = _3797;
    if (!_3753)
    {
        _3787 = _3681;
    }
    float _3801 = _3787;
    float _3803 = _3717 * _3767;
    if (_3753)
    {
        _3779 = _3789;
    }
    float _3805 = _3779;
    float _3807 = _3697 * _3767;
    float _3809 = _3805;
    if (_3753)
    {
        _3781 = _3793;
    }
    float _3811 = _3781;
    float _3813 = _3739 * _3767;
    float _3815 = _3811;
    if (!_3753)
    {
        _3791 = _3685;
    }
    float _3817 = _3791;
    float _3819 = _3671 * _3807;
    if (!_3753)
    {
        _3795 = _3683;
    }
    float _3821 = _3795;
    float _3823 = _3747 * _3801;
    float _3825 = _3687 * _3803;
    if (!_3753)
    {
        float _3827 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3817);
        _3809 = _3827;
    }
    float _3829 = _3809;
    float _3831 = -_3819;
    float _3833 = fma(_3687, _3813, _3831);
    float _3835 = -_3823;
    float _3837 = fma(_3743, _3817, _3835);
    float _3839 = _3745 * _3817;
    float _3841 = _3743 * _3821;
    float _3843 = -_3825;
    float _3845 = fma(_3669, _3807, _3843);
    float _3847 = _3829;
    if (!_3753)
    {
        float _3849 = fma(_3611, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3801);
        _3799 = _3849;
    }
    float _3851 = _3799;
    float _3853 = -_3839;
    float _3855 = fma(_3747, _3821, _3853);
    float _3857 = fma(_3639, _3675, _3771);
    float _3859 = -_3841;
    float _3861 = fma(_3745, _3801, _3859);
    float _3863 = _3833 * _3775;
    float _3865 = _3845 * _3775;
    if (!_3753)
    {
        float _3867 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3821);
        _3815 = _3867;
    }
    float _3869 = _3815;
    float _3871 = _3837 * _3749;
    float _3873 = _3855 * _3749;
    float _3875 = _3669 * _3813;
    float _3877 = _3861 * _3749;
    float _3879 = fma(_3803, _3773, _3863);
    float _3881 = fma(_3813, _3773, _3865);
    float _3883 = -_3875;
    float _3885 = fma(_3671, _3803, _3883);
    float _3887 = _3637 * _3833;
    float _3889 = fma(_3669, _3857, _3879);
    float _3891 = fma(_3671, _3857, _3881);
    float _3893 = _3637 * _3885;
    float _3895 = _3637 * _3845;
    float _3897 = _2275 + _3889;
    float _3899 = _2289 + _3891;
    float _3901 = _3651 * _3833;
    float _3903 = _3651 * _3885;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3907 = _3897 + _3905;
    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3911 = _3899 + _3909;
    float _3913 = _3651 * _3845;
    float _3915 = _3733 * _3885;
    float _3917 = _3907 * _3907;
    float _3919 = _3911 * _3911;
    float _3921 = _3733 * _3833;
    float _3923 = _3733 * _3845;
    float _3925 = _3885 * _3775;
    float _3927 = _3917 + _3919;
    float _3929 = fma(_3653, _3803, _3887);
    float _3931 = fma(_3653, _3807, _3893);
    float _3933 = fma(_3653, _3813, _3895);
    float _3935 = -_3597;
    float _3937 = fma(_3935, _3803, _3901);
    float _3939 = sqrt(_3927);
    float _3941 = -_3597;
    float _3943 = fma(_3941, _3807, _3903);
    float _3945 = -_3597;
    float _3947 = fma(_3945, _3813, _3913);
    float _3949 = fma(_3647, _3803, _3921);
    float _3951 = fma(_3647, _3813, _3923);
    float _3953 = fma(_3647, _3807, _3915);
    float _3955 = fma(_3807, _3773, _3925);
    float _3957 = fma(_3655, _3669, _3937);
    float _3959 = fma(_3655, _3687, _3943);
    float _3961 = fma(_3655, _3671, _3947);
    float _3963 = fma(_3729, _3669, _3929);
    float _3965 = fma(_3729, _3687, _3931);
    float _3967 = fma(_3687, _3857, _3955);
    float _3969 = fma(_3729, _3671, _3933);
    float _3971 = _3957 * _3745;
    float _3973 = _3959 * _3745;
    bool _3975 = _3939 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3977 = _3961 * _3745;
    float _3979 = _3959 * _3869;
    float _3981 = _3871 * _3959;
    float _3983 = _2253 + _3967;
    float _3985 = fma(_3639, _3687, _3953);
    float _3987 = _3957 * _3869;
    float _3989 = fma(_3639, _3669, _3949);
    float _3991 = fma(_3639, _3671, _3951);
    float _3993 = _3961 * _3869;
    float _3995 = _3871 * _3957;
    float _3997 = _3871 * _3961;
    float _3999 = _3917;
    float _4001 = _3919;
    float _4003 = _3897;
    float _4005 = _3899;
    if (!_3975)
    {
        _3783 = _3983;
    }
    float _4007 = _3783;
    bool _4009 = !_3975;
    float _4011 = _4007;
    if (!_4009)
    {
        float _4013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4017 = _3939 + _4015;
        float _4019 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4021 = rsqrt(_3927);
        float _4023 = _4017 * _4013;
        float _4025 = _4023 * 0.15915493667125701904296875;
        float _4027 = _4025 * 6.283185482025146484375;
        float _4029 = sin(_4027);
        float _4031 = _4025 * 6.283185482025146484375;
        float _4033 = cos(_4031);
        float _4035 = fma(_4029, _4019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4037 = _4021 * _4035;
        float _4039 = _4033 + (-1.0);
        float _4041 = fma(_3907, _4037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4043 = fma(_3911, _4037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4045 = _4039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4049 = _4041 + _4047;
        float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4053 = _4043 + _4051;
        float _4055 = fma(_3983, _4033, _4045);
        float _4057 = _4049 * _4049;
        float _4059 = _4053 * _4053;
        _4011 = _4055;
        _3999 = _4057;
        _4001 = _4059;
        _4003 = _4041;
        _4005 = _4043;
    }
    float _4061 = _4011;
    float _4063 = _3999;
    float _4065 = _4001;
    float _4067 = _4003;
    float _4069 = _4005;
    float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4073 = _4061 + _4071;
    float _4075 = fma(_3963, _3851, _3987);
    float _4077 = fma(_3965, _3851, _3979);
    float _4079 = fma(_3969, _3851, _3993);
    float _4081 = fma(_4073, _4073, _4063);
    float _4083 = fma(_3963, _3743, _3971);
    float _4085 = fma(_3965, _3743, _3973);
    float _4087 = fma(_3873, _3963, _3995);
    float _4089 = _4081 + _4065;
    float _4091 = fma(_3873, _3965, _3981);
    float _4093 = fma(_3969, _3743, _3977);
    float _4095 = fma(_3873, _3969, _3997);
    float _4097 = fma(_3989, _3747, _4083);
    float _4099 = fma(_3985, _3747, _4085);
    float _4101 = sqrt(_4089);
    float _4103 = fma(_3877, _3989, _4087);
    float _4105 = fma(_3985, _3829, _4077);
    float _4107 = fma(_3877, _3985, _4091);
    float _4109 = fma(_3991, _3747, _4093);
    float _4111 = fma(_3989, _3829, _4075);
    float _4113 = fma(_3877, _3991, _4095);
    float _4115 = fma(_3991, _3829, _4079);
    out.m_83.x = _4097;
    out.m_83.y = _4099;
    out.m_83.z = _4109;
    out.m_85.x = _4103;
    out.m_85.y = _4107;
    out.m_85.z = _4113;
    bool _4117 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4119 = isnan(_4101);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4125 = _4121 || _4123;
    out.m_87.x = _4111;
    out.m_87.y = _4105;
    out.m_87.z = _4115;
    if (!_4125)
    {
        _3847 = 1.0;
    }
    float _4127 = _3847;
    bool _4129 = !_4125;
    float _4131 = _4127;
    if (!_4129)
    {
        bool _4133 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4135 = isnan(_4101);
        bool _4137 = _4133 || _4135;
        bool _4139 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4141 = _4137 || _4139;
        if (!_4141)
        {
            float _4143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4145 = _4101 + _4143;
            float _4147 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4149 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4147;
            float _4151 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4153 = _4151 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4155 = 1.0 / _4149;
            float _4157 = _4145 * _4155;
            float _4159 = fma(_4157, _4153, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4131 = _4159;
            _4161 = true;
        }
        else
        {
            bool _4163 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4165 = isnan(_4101);
            bool _4167 = _4163 || _4165;
            bool _4169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4171 = _4167 || _4169;
            if (!_4171)
            {
                float _4173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4175 = _4101 + _4173;
                float _4177 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4179 = _4177 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4181 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4183 = _4181 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4185 = 1.0 / _4179;
                float _4187 = _4175 * _4185;
                float _4189 = fma(_4187, _4183, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4131 = _4189;
                _4161 = true;
            }
            else
            {
                _4131 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4161 = false;
    float _4191 = _4131;
    float _4193 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4195 = _4067 + _4193;
    float _4197 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4199 = _4061 + _4197;
    float _4201 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4203 = _4069 + _4201;
    bool _4205 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4207 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4209 = _4205 || _4207;
    bool _4211 = isnan(0.5);
    bool _4213 = _4209 || _4211;
    float _4215 = fma(_4195, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4217 = fma(_4199, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4219 = fma(_4203, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4221 = -_3137;
    float _4223 = _4221 + _4215;
    float _4225 = -_3135;
    float _4227 = _4225 + _4217;
    float _4229 = -_3183;
    float _4231 = _4229 + _4219;
    float _4233 = _4227;
    float _4235 = _4223;
    float _4237 = _4231;
    if (!_4213)
    {
        float _4239 = _3507 * _3507;
        float _4241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4243 = -_2289;
        float _4245 = _4243 + _4219;
        float _4247 = -_2275;
        float _4249 = _4247 + _4215;
        float _4251 = fma(_3515, _3515, _4239);
        float _4253 = fma(_3523, _3523, _4251);
        float _4255 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4257 = sqrt(_4253);
        float _4259 = 1.0 / _3623;
        float _4261 = _4255 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4263 = precise::min(_4257, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4265 = _4263 * _4241;
        float _4267 = -_2253;
        float _4269 = _4267 + _4217;
        float _4271 = _4265 * _4259;
        float _4273 = _4261 * _4271;
        float _4275 = _4245 * _4271;
        float _4277 = fma(_4249, _4273, _3501);
        float _4279 = fma(_4269, _4273, _3495);
        float _4281 = fma(_4261, _4275, _3511);
        _4233 = _4279;
        _4235 = _4277;
        _4237 = _4281;
        _3567 = _4239;
        _3569 = _4257;
    }
    float _4283 = _4233;
    float _4285 = _4235;
    float _4287 = _4237;
    float _4289 = _3567;
    float _4291 = _3569;
    float _4293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4295 = _4283 + _4293;
    float _4297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4299 = _4285 + _4297;
    float _4301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4303 = _4287 + _4301;
    float _4305 = _4295 * _4295;
    float _4307 = fma(_4299, _4299, _4305);
    float _4309 = fma(_4303, _4303, _4307);
    float _4311 = rsqrt(_4309);
    float _4313 = sqrt(_4309);
    float _4315 = _4311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4317 = _4299 * _4315;
    float _4319 = _4303 * _4315;
    float _4321 = _4317 * _4317;
    float _4323 = _4319 * _4319;
    float _4325 = _4321 + _4323;
    float _4327 = sqrt(_4325);
    bool _4329 = _4327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4333 = _4327 + _4331;
    float _4335 = _4311;
    float _4337 = _4333;
    float _4339 = _4289;
    float _4341 = _4295;
    float _4343 = _4291;
    float _4345 = _4315;
    if (_4329)
    {
        float _4347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4335 = _4347;
    }
    float _4349 = _4335;
    if (_4329)
    {
        float _4351 = rsqrt(_4325);
        _3571 = _4351;
    }
    float _4353 = _3571;
    float _4355 = _4353;
    if (_4329)
    {
        float _4357 = _4333 * _4349;
        _4337 = _4357;
    }
    float _4359 = _4337;
    if (_4329)
    {
        float _4361 = _4359 * 0.15915493667125701904296875;
        _4339 = _4361;
    }
    float _4363 = _4339;
    float _4365 = _4349;
    float _4367 = _4363;
    if (_4329)
    {
        float _4369 = _4363 * 6.283185482025146484375;
        float _4371 = sin(_4369);
        _4365 = _4371;
    }
    float _4373 = _4365;
    float _4375 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4377 = precise::max(0.0, _4375);
    float _4379 = _4303;
    float _4381 = _4377;
    if (_4329)
    {
        float _4383 = _4363 * 6.283185482025146484375;
        float _4385 = cos(_4383);
        _4379 = _4385;
    }
    float _4387 = _4379;
    float _4389 = -_4315;
    float _4391 = -_4377;
    float _4393 = fma(_4295, _4389, _4391);
    if (!_4329)
    {
        _4341 = _4319;
    }
    float _4395 = _4341;
    float _4397 = _4395;
    if (_4329)
    {
        float _4399 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4381 = _4399;
    }
    float _4401 = _4381;
    float _4403 = _4373;
    float _4405 = _4401;
    if (_4329)
    {
        float _4407 = fma(_4373, _4401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4343 = _4407;
    }
    float _4409 = _4343;
    float _4411 = _4409;
    if (!_4329)
    {
        _4403 = _4317;
    }
    float _4413 = _4403;
    float _4415 = _4413;
    if (_4329)
    {
        float _4417 = _4387 + (-1.0);
        _4405 = _4417;
    }
    float _4419 = _4405;
    float _4421 = _4419;
    if (_4329)
    {
        float _4423 = _4353 * _4409;
        _4345 = _4423;
    }
    float _4425 = _4345;
    if (!_4329)
    {
        _4411 = _4393;
    }
    float _4427 = _4411;
    float _4429 = _4427;
    if (_4329)
    {
        float _4431 = _4419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4367 = _4431;
    }
    float _4433 = _4367;
    if (_4329)
    {
        float _4435 = _4317 * _4425;
        _4415 = _4435;
    }
    float _4437 = _4415;
    if (!_4329)
    {
        _4355 = _4321;
    }
    float _4439 = _4355;
    float _4441 = _4439;
    if (_4329)
    {
        float _4443 = _4319 * _4425;
        _4397 = _4443;
    }
    float _4445 = _4397;
    if (_4329)
    {
        float _4447 = fma(_4393, _4387, _4433);
        _4429 = _4447;
    }
    float _4449 = _4429;
    if (_4329)
    {
        float _4451 = _4437 * _4437;
        _4441 = _4451;
    }
    float _4453 = _4441;
    if (!_4329)
    {
        _4421 = _4323;
    }
    float _4455 = _4421;
    float _4457 = _4455;
    if (_4329)
    {
        float _4459 = _4445 * _4445;
        _4457 = _4459;
    }
    float _4461 = _4457;
    float _4463 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4465 = fma(_4449, _4449, _4453);
    float _4467 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4469 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4471 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4463);
    float _4473 = _4465 + _4461;
    float _4475 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4477 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4467);
    float _4479 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4471);
    float _4481 = rsqrt(_4473);
    float _4483 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4475);
    float _4485 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4477);
    float _4487 = _4479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4489 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4483);
    float _4491 = _4485 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4493 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4495 = _4489 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4499 = fma(_4313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4497);
    float _4501 = precise::clamp(_4499, 0.0, 1.0);
    float _4503 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4469);
    float _4505 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4507 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4493);
    float _4509 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4511 = -_4501;
    float _4513 = _4511 + 1.0;
    float _4515 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4503);
    float _4517 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4507);
    float _4519 = _4481 * _4437;
    float _4521 = _4481 * _4449;
    float _4523 = floor(_4509);
    float _4525 = _4515 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4527 = _4519 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4529 = _4481 * _4445;
    float _4531 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4517);
    float _4533 = -_4527;
    float _4535 = fma(_4521, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4533);
    float _4537 = abs(_4513);
    float _4539 = log2(_4537);
    float _4541 = -_4529;
    float _4543 = fma(_4541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4535);
    float _4545 = _4491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4547 = fma(_4543, -0.5, 0.5);
    float _4549 = fma(_4543, 0.5, 0.5);
    float _4551 = floor(_4505);
    float _4553 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4555 = -_4523;
    float _4557 = _4509 + _4555;
    float _4559 = fma(_4549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4561 = -_4545;
    float _4563 = fma(_4561, _4553, 1.0);
    float _4565 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4567 = fma(_4549, _4559, -0.212114393711090087890625);
    float _4569 = _4539 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4571 = 1.0 / _4531;
    float _4573 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4565);
    float _4575 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4573);
    float _4577 = -_4551;
    float _4579 = _4505 + _4577;
    float _4581 = exp2(_4569);
    float _4583 = fma(_4549, _4567, 1.570728778839111328125);
    float _4585 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4575);
    float _4587 = log2(_4563);
    float _4589 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4591 = _4585 * _4571;
    float _4593 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4589);
    float _4595 = sqrt(_4547);
    float _4597 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4593);
    float _4599 = _4521 + 1.0;
    float _4601 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4597);
    float2 _11761 = float2(_4557, _4579);
    float _4603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11761, float2(0.0), isnan(_11761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11761, float2(0.0), isnan(_11761)), level(0.0)).x;
    float _4605 = -_4521;
    float _4607 = fma(_4581, _4599, _4605);
    float _4609 = _4587 * 0.693147182464599609375;
    float _4611 = _4601 * _4571;
    float _4613 = fma(_4591, 0.5, 0.5);
    float _4615 = fma(_4607, 0.5, 0.5);
    float _4617 = _4609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4619 = fma(_4611, -0.5, 0.5);
    float _4621 = _4595 * 0.636619746685028076171875;
    float _4623 = -_4583;
    float _4625 = fma(_4621, _4623, 1.0);
    float3 _11802 = float3(_4613, _4619, _4617);
    float _4627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11802, float3(0.0), isnan(_11802)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11802, float3(0.0), isnan(_11802)), level(0.0)).x;
    float3 _11813 = float3(_4613, _4619, _4617);
    float4 _4630 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11813, float3(0.0), isnan(_11813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11813, float3(0.0), isnan(_11813)), level(0.0)).xyzw;
    float _4632 = _4630.x;
    float _4634 = _4630.y;
    float _4636 = _4630.z;
    float _4638 = _4630.w;
    float2 _11829 = float2(_4625, _4615);
    float3 _4642 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11829, float2(0.0), isnan(_11829)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11829, float2(0.0), isnan(_11829)), level(0.0)).xyz;
    float _4644 = _4642.x;
    float _4646 = _4642.y;
    float _4648 = _4642.z;
    float _4650 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4652 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4654 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4656 = isnan(_4313);
    bool _4658 = _4654 || _4656;
    bool _4660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4662 = _4658 || _4660;
    float _4664 = fma(_3501, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4650);
    float _4666 = fma(_3501, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4652);
    float _4668 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4664);
    float _4670 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4666);
    float _4672 = _4668 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4674 = _4670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4676 = 1.0 / _4672;
    float _4678 = _4674 + _4672;
    float _4680 = _4678 * _4676;
    float _4682 = _4680 * 0.5;
    float _4684 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4686 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4684);
    float _4688 = 1.0 / _4686;
    float _4690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4692 = _4688 * _4690;
    float _4694 = abs(_4692);
    float _4696 = log2(_4694);
    bool _4698 = _4692 <= 8000.0;
    bool _4700 = isnan(_4692);
    bool _4702 = _4698 || _4700;
    bool _4704 = isnan(8000.0);
    bool _4706 = _4702 || _4704;
    float _4708 = float(_4706);
    float _4710 = _4696 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4712 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4714 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4712);
    float _4716 = exp2(_4710);
    float _4718 = _4539 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4720 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4714);
    float _4722 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4720);
    float _4724 = exp2(_4718);
    float _4726 = _4722 + _4531;
    out.gl_Position.x = _4585;
    out.gl_Position.y = _4601;
    out.gl_Position.z = _4722;
    out.gl_Position.w = _4531;
    float _4728 = _4726 * 0.5;
    float _4730 = fma(_4716, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4732 = precise::clamp(_4730, 0.0, 1.0);
    float _4734 = in.m_89.x;
    float _4736 = fma(_4732, -2.0, 3.0);
    float _4738 = _4732 * _4732;
    float _4740 = -_4724;
    float _4742 = _4740 + 1.0;
    float _4744 = _4738 * _4736;
    float _4746 = _4601;
    if (!_4662)
    {
        _4746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4748 = _4746;
    float _4750 = -_4744;
    float _4752 = _4750 + 1.0;
    float _4754 = fma(_4752, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4744);
    float _4756 = _4708 * _4754;
    float _4758 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.z = _4728;
    out.m_91.w = _4531;
    float _4760 = _4756 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4762 = -_4758;
    float _4764 = _4762 + 1.0;
    float _4766 = -_4603;
    float _4768 = _4766 + 1.0;
    float _4770 = _4768 * _4760;
    float _4772 = precise::clamp(_4770, 0.0, 1.0);
    float _4774 = -_4772;
    float _4776 = fma(_4774, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4778 = _4776 * _4734;
    float _4780 = _4758 * _4627;
    float _4782 = _4638 * _4764;
    float _4784 = _4778 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4786 = _4764;
    float _4788 = _4748;
    float _4790 = _4748;
    if (!_4662)
    {
        _4786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4792 = _4786;
    float _4794 = _4638 * _4780;
    float _4796 = _4648 * _4780;
    out.m_93.x = _4784;
    float _4798 = fma(_4644, _4794, _4632);
    float _4800 = fma(_4646, _4794, _4634);
    float _4802 = fma(_4638, _4796, _4636);
    float _4804 = _4796;
    float _4806 = _4792;
    float _4808 = _4792;
    if (!_4662)
    {
        _4804 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4810 = _4804;
    out.m_95.x = _4798;
    out.m_95.y = _4800;
    out.m_95.z = _4802;
    out.m_95.w = _4782;
    bool _4812 = !_4662;
    float _4814 = _4810;
    float _4816 = _4810;
    if (!_4812)
    {
        bool _4818 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4820 = isnan(_4313);
        bool _4822 = _4818 || _4820;
        bool _4824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4826 = _4822 || _4824;
        if (!_4826)
        {
            float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4830 = _4313 + _4828;
            float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4834 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4832;
            float _4836 = 1.0 / _4834;
            float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4842 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4846 = _4830 * _4836;
            float _4848 = precise::clamp(_4846, 0.0, 1.0);
            float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4854 = fma(_4848, _4844, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4856 = fma(_4848, _4852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4858 = fma(_4848, _4840, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4808 = _4858;
            _4790 = _4856;
            _4816 = _4854;
            _4860 = true;
        }
        else
        {
            bool _4862 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4864 = isnan(_4313);
            bool _4866 = _4862 || _4864;
            bool _4868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4870 = _4866 || _4868;
            if (!_4870)
            {
                _4788 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4872 = _4788;
            _4790 = _4872;
            if (!_4870)
            {
                _4806 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4874 = _4806;
            _4808 = _4874;
            if (!_4870)
            {
                _4814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4876 = _4814;
            bool _4878 = !_4870;
            _4816 = _4876;
            if (!_4878)
            {
                bool _4880 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4882 = isnan(_4313);
                bool _4884 = _4880 || _4882;
                bool _4886 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4888 = _4884 || _4886;
                if (!_4888)
                {
                    float _4890 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4892 = _4313 + _4890;
                    float _4894 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4896 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4894;
                    float _4898 = 1.0 / _4896;
                    float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4902 = _4900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4904 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4906 = _4904 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4908 = _4892 * _4898;
                    float _4910 = precise::clamp(_4908, 0.0, 1.0);
                    float _4912 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4914 = _4912 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4916 = fma(_4910, _4906, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4918 = fma(_4910, _4914, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4920 = fma(_4910, _4902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4808 = _4920;
                    _4790 = _4918;
                    _4816 = _4916;
                    _4860 = true;
                }
                else
                {
                    _4808 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4790 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4860 = false;
    float _4922 = _4808;
    float _4924 = _4790;
    float _4926 = _4816;
    float _4928 = _4922 * 0.586610972881317138671875;
    bool _4930 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4932 = fma(_4924, 0.298911988735198974609375, _4928);
    out.m_97.x = 0.0;
    float _4934 = fma(_4926, 0.114477999508380889892578125, _4932);
    float _4936 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4938 = -_4934;
    float _4940 = _4938 + _4924;
    float _4942 = -_4934;
    float _4944 = _4942 + _4922;
    float _4946 = -_4934;
    float _4948 = _4946 + _4926;
    out.m_93.w = _4936;
    float _4950 = fma(_4940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    float _4952 = fma(_4944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    float _4954 = fma(_4948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    out.m_99.x = _4950;
    out.m_99.y = _4952;
    out.m_99.z = _4954;
    if (!_4930)
    {
        return out;
    }
    float _4956 = -_4283;
    float _4958 = _4956 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4960 = -_4285;
    float _4962 = _4960 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4964 = -_4287;
    float _4966 = _4964 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4968 = _4958 * _4958;
    float _4970 = fma(_4962, _4962, _4968);
    float _4972 = fma(_4966, _4966, _4970);
    float _4974 = sqrt(_4972);
    float _4976 = rsqrt(_4972);
    float _4978 = -_4974;
    float _4980 = _4978 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4982 = _4980 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4984 = precise::clamp(_4982, 0.0, 1.0);
    float _4986 = _4962 * _4976;
    float _4988 = _4958 * _4976;
    float _4990 = abs(_4984);
    float _4992 = log2(_4990);
    float _4994 = _4966 * _4976;
    float _4996 = _4986 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4998 = _4105 * _4988;
    float _5000 = -_4988;
    float _5002 = -_4996;
    float _5004 = fma(_5000, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5002);
    float _5006 = fma(_4111, _4986, _4998);
    float _5008 = -_4994;
    float _5010 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5004);
    float _5012 = fma(_4115, _4994, _5006);
    float _5014 = precise::clamp(_5012, 0.0, 1.0);
    float _5016 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5018 = _5010 + _5016;
    float _5020 = _4992 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5022 = _5018 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5024 = precise::clamp(_5022, 0.0, 1.0);
    float _5026 = exp2(_5020);
    float _5028 = _5026 * _5024;
    float _5030 = _5014 * _5028;
    float _5032 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5034 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5036 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _5032;
    out.m_97.y = _5034;
    out.m_97.z = _5036;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4860 = false;
    bool _4161 = false;
    bool _696 = false;
    bool _580 = false;
    bool _196 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_48.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5092 = as_type<float>(_132);
        out.gl_Position.z = _5092;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    float _166 = _158;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_51.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5162 = as_type<float>(_172);
        out.gl_Position.z = _5162;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _174 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _176 = !_174;
    float _194;
    if (!_176)
    {
        float _178 = in.m_55.x;
        float _180 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _182 = _178 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _184 = fma(_182, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _186 = _184 * _180;
        float _188 = floor(_186);
        float _190 = -_188;
        float _192 = _186 + _190;
        _194 = _192;
        _196 = true;
    }
    else
    {
        float _198 = float(_118);
        float _200 = 1.0 / _198;
        float _202 = _150 * _200;
        _194 = _202;
    }
    _196 = false;
    float _204 = _194;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _208 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _212 = _210 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _216 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _214;
    float _218 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _220 = _218 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = 1.0 / _208;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _232 = 1.0 / _216;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = _204 + _234;
    bool _238 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_204);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = 1.0 / _212;
    float _252 = _236 * _222;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _204 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _260 = _204 + _258;
    bool _262 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _264 = isnan(_204);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    bool _274 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _276 = 1.0 / _226;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _280 = _204 + _278;
    float _282 = _256 * _232;
    bool _284 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _286 = isnan(_204);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    float _296 = -_272;
    float _298 = _296 + 1.0;
    float _300 = 1.0 / _230;
    float _302 = _280 * _250;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _306 = _204 + _304;
    float _308 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _310 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _308;
    float _312 = fma(_310, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _314 = 1.0 / _220;
    float _316 = _260 * _276;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _318;
    float _322 = fma(_320, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _326 = _204 + _324;
    float _328 = _326 * _300;
    float _330 = -_294;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _334;
    float _338 = _306 * _314;
    bool _340 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _342 = isnan(_204);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _272 * _332;
    float _354 = fma(_336, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _356 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _358 = isnan(_204);
    bool _360 = _356 || _358;
    bool _362 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _364 = _360 || _362;
    float _366 = float(_364);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _372 = -_350;
    float _374 = _372 + 1.0;
    float _376 = _350 * _298;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _380 = _378 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = _366 * _374;
    bool _388 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _390 = isnan(_204);
    bool _392 = _388 || _390;
    bool _394 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _396 = _392 || _394;
    float _398 = float(_396);
    float _400 = -_366;
    float _402 = _400 + 1.0;
    bool _404 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _406 = isnan(_204);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = fma(_380, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _418 = _248 * _402;
    float _420 = -_248;
    float _422 = _420 + 1.0;
    float _424 = -_414;
    float _426 = _424 + 1.0;
    float _428 = fma(_384, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _430 = fma(_370, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _432 = _414 * _422;
    float _434 = _398 * _426;
    float _436 = -_398;
    float _438 = _436 + 1.0;
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _442 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _440;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _446 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _444;
    float _448 = _354 * _434;
    float _450 = _322 * _434;
    float _452 = _312 * _434;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _456 = _454 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _458 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].x, _448);
    float _460 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].y, _450);
    float _462 = fma(_438, (*spvDescriptorSet0.vp_c9)._m0[143].z, _452);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _466 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _464;
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _472 = fma(_416, _432, _458);
    float _474 = fma(_428, _432, _460);
    float _476 = fma(_430, _432, _462);
    float _478 = fma(_442, _282, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _480 = fma(_446, _282, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _482 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _484 = _482 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _486 = fma(_466, _282, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _488 = fma(_478, _418, _472);
    float _490 = fma(_456, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _492;
    float _496 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _498 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _496;
    float _500 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _502 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _500;
    float _504 = fma(_484, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _506 = fma(_480, _418, _476);
    float _508 = fma(_470, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _510 = fma(_486, _418, _474);
    float _512 = fma(_494, _316, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _514 = fma(_498, _316, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _516 = fma(_502, _316, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _518 = fma(_490, _386, _488);
    float _520 = fma(_504, _386, _506);
    float _522 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _524 = _522 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _528 = _526 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _530 = fma(_508, _386, _510);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _534 = _532 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    float _536 = fma(_512, _376, _518);
    float _538 = fma(_524, _328, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _540 = fma(_528, _328, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _542 = fma(_534, _328, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    float _544 = fma(_514, _376, _530);
    float _546 = fma(_516, _376, _520);
    float _548 = fma(_538, _352, _536);
    float _550 = fma(_540, _352, _544);
    float _552 = fma(_542, _352, _546);
    float _554 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].x, _548);
    float _556 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].y, _550);
    float _558 = fma(_294, (*spvDescriptorSet0.vp_c9)._m0[149].z, _552);
    bool _560 = !_274;
    float _578;
    if (!_560)
    {
        float _562 = in.m_55.x;
        float _564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _566 = _562 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _568 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _570 = _568 * _564;
        float _572 = floor(_570);
        float _574 = -_572;
        float _576 = _570 + _574;
        _578 = _576;
        _580 = true;
    }
    else
    {
        float _582 = float(_118);
        float _584 = 1.0 / _582;
        float _586 = _150 * _584;
        _578 = _586;
    }
    _580 = false;
    float _588 = _578;
    bool _590 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _592 = isnan(_588);
    bool _594 = _590 || _592;
    bool _596 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _598 = _594 || _596;
    float _600 = float(_598);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _604 = _602 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = _588 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _608 = isnan(_588);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _624 = _588 + _622;
    float _626 = -_600;
    float _628 = _626 + 1.0;
    bool _630 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _632 = 1.0 / _604;
    float _634 = _616 * _628;
    float _636 = -_616;
    float _638 = _636 + 1.0;
    float _640 = _620 * _632;
    float _642 = fma(_640, _624, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _646 = _642 * _634;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _650 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = fma(_638, (*spvDescriptorSet0.vp_c9)._m0[115].x, _646);
    float _654 = _648 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = in.m_57.x;
    float _658 = in.m_57.y;
    float _660 = in.m_57.z;
    float _662 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[116].x, _652);
    float _664 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _666 = _662 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _668 = _664 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _654;
    out.m_59.y = _650;
    out.m_59.z = _668;
    out.m_59.w = _666;
    float _670 = _558 * _660;
    float _672 = _556 * _658;
    float _674 = _554 * _656;
    bool _676 = !_630;
    float _694;
    if (!_676)
    {
        float _678 = in.m_55.x;
        float _680 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _682 = _678 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _684 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _686 = _684 * _680;
        float _688 = floor(_686);
        float _690 = -_688;
        float _692 = _686 + _690;
        _694 = _692;
        _696 = true;
    }
    else
    {
        float _698 = float(_118);
        float _700 = 1.0 / _698;
        float _702 = _150 * _700;
        _694 = _702;
    }
    _696 = false;
    float _704 = _694;
    float _706 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _708 = int(_706);
    float _710 = in.m_55.y;
    int _712 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _714 = _712 != 0;
    float _716 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _718 = int(_716);
    float _720 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _722 = _720 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _724 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _726 = int(_724);
    float _728 = float(_708);
    float _730 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _732 = float(_718);
    float _734 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _736 = int(_734);
    float _738 = _710 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _740 = float(_726);
    float _742 = 1.0 / _728;
    int _744 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _746 = _744 != 0;
    float _748 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _750 = int(_748);
    float _752 = float(uint(_736));
    float _754 = in.m_55.x;
    bool _756 = _736 == 0;
    int _758 = ~_736;
    int _760 = _758 + 1;
    float _762 = 1.0 / _732;
    float _764 = _742 * _150;
    float _766 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _768 = int(_766);
    float _770 = float(uint(_750));
    float _772 = _732;
    if (_746)
    {
        _772 = 1.0;
    }
    float _774 = _772;
    float _776 = _774;
    if (!_746)
    {
        _776 = 7.345489978790283203125;
    }
    float _778 = _776;
    bool _780 = _750 == 0;
    float _782 = 1.0 / _740;
    float _784 = _762 * _150;
    float _786 = _778 * _754;
    int _788 = ~_750;
    int _790 = _788 + 1;
    float _792 = in.m_55.z;
    float _794 = 1.0 / _752;
    float _796 = float(uint(_768));
    int _798 = ~_768;
    int _800 = _798 + 1;
    int _802 = ~_768;
    int _804 = _802 + 1;
    float _806 = trunc(_764);
    int _808 = int(_806);
    float _810 = _782 * _150;
    float _812 = 1.0 / _770;
    int _814 = as_type<int>(_794) + (-2);
    float _816 = trunc(_784);
    int _818 = int(_816);
    float _820 = float(uint(_808));
    float _822 = as_type<float>(_814) * _820;
    float _824 = _820;
    float _826 = _822;
    if (_746)
    {
        _824 = 1.0;
    }
    float _828 = _824;
    float _830 = 1.0 / _796;
    int _832 = as_type<int>(_812) + (-2);
    float _834 = _828;
    if (!_746)
    {
        _834 = 1.2345600128173828125;
    }
    float _836 = _834;
    float _838 = trunc(_810);
    int _840 = int(_838);
    float _842 = float(uint(_818));
    float _844 = as_type<float>(_832) * _842;
    float _846 = _842;
    if (_746)
    {
        _846 = _754;
    }
    float _848 = _846;
    float _850 = trunc(_822);
    float _852 = precise::max(_850, 0.0);
    uint _855 = uint(_852);
    int _857 = as_type<int>(_830) + (-2);
    float _859 = _848;
    if (!_746)
    {
        _859 = _710;
    }
    float _861 = _859;
    float _863 = float(uint(_840));
    float _865 = trunc(_844);
    float _867 = precise::max(_865, 0.0);
    uint _869 = uint(_867);
    float _871 = _861 * _836;
    int _873 = ~_736;
    int _875 = _873 + 1;
    float _877 = as_type<float>(_857) * _863;
    float _879 = _863;
    if (_746)
    {
        _879 = _754;
    }
    float _881 = _879;
    int _883 = _875 * int(_855);
    int _885 = _883 + _808;
    float _887 = trunc(_877);
    float _889 = precise::max(_887, 0.0);
    uint _891 = uint(_889);
    float _893 = _881;
    if (_746)
    {
        _826 = 1.0;
    }
    float _895 = _826;
    float _897 = _895;
    if (!_746)
    {
        _893 = _792;
    }
    float _899 = _893;
    float _901 = float(uint(_885));
    if (!_746)
    {
        _897 = 5.839270114898681640625;
    }
    float _903 = _897;
    float _905 = floor(_786);
    int _907 = ~_750;
    int _909 = _907 + 1;
    float _911 = as_type<float>(_814) * _901;
    int _913 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _915 = _913 != 0;
    float _917 = _899 * _903;
    int _919 = _909 * int(_869);
    int _921 = _919 + _818;
    int _923 = _800 * int(_891);
    int _925 = _923 + _840;
    float _927 = trunc(_911);
    float _929 = precise::max(_927, 0.0);
    uint _931 = uint(_929);
    float _933 = float(uint(_921));
    float _935 = float(uint(_925));
    float _937 = as_type<float>(_832) * _933;
    float _939 = floor(_871);
    float _941 = as_type<float>(_857) * _935;
    float _943 = float(_736);
    float _945 = -_905;
    float _947 = _786 + _945;
    float _949 = float(_808);
    float _951 = float(_750);
    float _953 = trunc(_937);
    float _955 = precise::max(_953, 0.0);
    uint _957 = uint(_955);
    int _959 = int(_855) + int(_931);
    int _961 = ~_750;
    int _963 = _961 + 1;
    bool _965 = _949 >= _943;
    bool _967 = isnan(_949);
    bool _969 = _965 || _967;
    bool _971 = isnan(_943);
    bool _973 = _969 || _971;
    float _975 = float(_973);
    float _977 = floor(_917);
    float _979 = -_939;
    float _981 = _871 + _979;
    float _983 = _947 * _943;
    float _985 = _943 * _150;
    float _987 = trunc(_941);
    float _989 = precise::max(_987, 0.0);
    uint _991 = uint(_989);
    int _993 = int(_869) + int(_957);
    float _995 = -_977;
    float _997 = _917 + _995;
    int _999 = ~_736;
    int _1001 = _999 + 1;
    float _1003 = trunc(_975);
    int _1005 = int(_1003);
    int _1007 = _963 * _993;
    int _1009 = _1007 + _818;
    int _1011 = _1001 * _959;
    int _1013 = _1011 + _808;
    bool _1015 = uint(_1009) >= uint(_750);
    float _1017 = float(_118);
    float _1019 = _951 * _981;
    float _1021 = float(_818);
    float _1023 = trunc(_983);
    int _1025 = int(_1023);
    bool _1027 = uint(_1013) >= uint(_736);
    bool _1029 = _1021 >= _951;
    bool _1031 = isnan(_1021);
    bool _1033 = _1029 || _1031;
    bool _1035 = isnan(_951);
    bool _1037 = _1033 || _1035;
    float _1039 = float(_1037);
    bool _1041 = !_915;
    int _1043 = _1041 ? 0 : 1;
    bool _1045 = !_714;
    int _1047 = _1045 ? 0 : 1;
    float _1049 = trunc(_1019);
    int _1051 = int(_1049);
    int _1053 = int(_891) + int(_991);
    int _1055 = abs(_1043);
    int _1057 = abs(_1047);
    bool _1059 = !_1027;
    int _1061 = _1059 ? 0 : (-1);
    float _1063 = trunc(_1039);
    int _1065 = int(_1063);
    bool _1067 = !_1015;
    int _1069 = _1067 ? 0 : (-1);
    int _1071 = _1025 * _1055;
    int _1073 = _1071 + _808;
    int _1075 = ~_959;
    int _1077 = _1075 + _1061;
    int _1079 = _1077 + 1;
    int _1081 = ~_993;
    int _1083 = _1081 + _1069;
    int _1085 = _1083 + 1;
    float _1087 = 1.0 / _1017;
    int _1089 = _736 * _1079;
    int _1091 = _1089 + _808;
    int _1093 = ~_1005;
    int _1095 = _1093 + 1;
    int _1097 = _1095 + 1;
    int _1099 = _750 * _1085;
    int _1101 = _1099 + _818;
    int _1103 = _1051 * _1057;
    int _1105 = _1103 + _818;
    bool _1107 = !_756;
    int _1109 = _1107 ? _1091 : (-1);
    int _1111 = ~_1065;
    int _1113 = _1111 + 1;
    int _1115 = _1113 + 1;
    float _1117 = 1.0 / _722;
    bool _1119 = !_780;
    int _1121 = _1119 ? _1101 : (-1);
    int _1123 = _1109 * _1097;
    int _1125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1127 = _1125 != 0;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1131 = _1129 != 0;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1135 = _1133 != 0;
    int _1137 = ~_768;
    int _1139 = _1137 + 1;
    int _1141 = _1115 * _1121;
    float _1143 = _985 * _1087;
    bool _1145 = !_1131;
    int _1147 = _1145 ? 0 : 1;
    bool _1149 = !_1127;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = _1139 * _1053;
    int _1155 = _1153 + _840;
    int _1157 = _736 + (-1);
    float _1159 = trunc(_1143);
    int _1161 = int(_1159);
    int _1163 = abs(_1147);
    int _1165 = _750 + (-1);
    int _1167 = _1005 * _1157;
    int _1169 = _1167 + _1123;
    int _1171 = abs(_1151);
    int _1173 = _1065 * _1165;
    int _1175 = _1173 + _1141;
    bool _1177 = uint(_1155) >= uint(_768);
    float _1179 = _1087 * _150;
    int _1181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1183 = _1181 != 0;
    int _1185 = _1169 * _1163;
    float _1187 = _951 * _1179;
    int _1189 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1191 = _1189 != 0;
    int _1193 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1195 = _1193 != 0;
    float _1197 = in.m_61.x;
    float _1199 = in.m_61.y;
    float _1201 = in.m_61.z;
    bool _1203 = !_1135;
    int _1205 = _1203 ? 0 : 1;
    int _1207 = _1161 * _1171;
    int _1209 = _1207 + _1185;
    bool _1211 = !_1183;
    int _1213 = _1211 ? 0 : 1;
    float _1215 = trunc(_1187);
    int _1217 = int(_1215);
    bool _1219 = !_1195;
    int _1221 = _1219 ? 0 : 1;
    int _1223 = abs(_1205);
    int _1225 = abs(_1221);
    int _1227 = abs(_1213);
    int _1229 = _1175 * _1225;
    float _1231 = float(_768);
    int _1233 = _1073 * _1223;
    int _1235 = _1233 + _1209;
    float _1237 = float(_840);
    float _1239 = in.m_63.x;
    bool _1241 = !_1191;
    int _1243 = _1241 ? 0 : 1;
    int _1245 = _1025 * _1227;
    int _1247 = _1245 + _1235;
    bool _1249 = _1237 >= _1231;
    bool _1251 = isnan(_1237);
    bool _1253 = _1249 || _1251;
    bool _1255 = isnan(_1231);
    bool _1257 = _1253 || _1255;
    float _1259 = float(_1257);
    float _1261 = _1231 * _1179;
    int _1263 = abs(_1243);
    float _1265 = trunc(_1259);
    int _1267 = int(_1265);
    float _1269 = float(uint(_1247));
    bool _1271 = !_1177;
    int _1273 = _1271 ? 0 : (-1);
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1277 = _1275 != 0;
    int _1279 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1281 = _1279 != 0;
    int _1283 = _1217 * _1263;
    int _1285 = _1283 + _1229;
    int _1287 = ~_1053;
    int _1289 = _1287 + _1273;
    int _1291 = _1289 + 1;
    float _1293 = as_type<float>(_814) * _1269;
    bool _1295 = _768 == 0;
    bool _1297 = !_1277;
    int _1299 = _1297 ? 0 : 1;
    int _1301 = _768 * _1291;
    int _1303 = _1301 + _840;
    float _1305 = trunc(_1293);
    float _1307 = precise::max(_1305, 0.0);
    uint _1309 = uint(_1307);
    int _1311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1313 = _1311 != 0;
    int _1315 = abs(_1299);
    int _1317 = ~_1267;
    int _1319 = _1317 + 1;
    int _1321 = _1319 + 1;
    bool _1323 = !_1295;
    int _1325 = _1323 ? _1303 : (-1);
    float _1327 = _1231 * _997;
    int _1329 = ~_736;
    int _1331 = _1329 + 1;
    int _1333 = _1105 * _1315;
    int _1335 = _1333 + _1285;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1339 = _1337 != 0;
    int _1341 = _1321 * _1325;
    bool _1343 = !_1281;
    int _1345 = _1343 ? 0 : 1;
    float _1347 = trunc(_1261);
    int _1349 = int(_1347);
    int _1351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1353 = _1351 != 0;
    int _1355 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1357 = _1355 != 0;
    int _1359 = abs(_1345);
    int _1361 = _1331 * int(_1309);
    int _1363 = _1361 + _1247;
    int _1365 = _768 + (-1);
    float _1367 = as_type<float>(_1315);
    bool _1369 = _1339;
    if (!_1313)
    {
        _1367 = _1239;
    }
    float _1371 = _1367;
    float _1373 = trunc(_1327);
    int _1375 = int(_1373);
    float _1377 = float(uint(_1363));
    int _1379 = _1051 * _1359;
    int _1381 = _1379 + _1335;
    bool _1383 = !_1357;
    int _1385 = _1383 ? 0 : 1;
    int _1387 = _1267 * _1365;
    int _1389 = _1387 + _1341;
    bool _1391 = !_1339;
    int _1393 = _1391 ? 0 : 1;
    float _1395 = as_type<float>(_814) * _1377;
    int _1397 = abs(_1385);
    float _1399 = float(uint(_1381));
    float _1401 = 0.0;
    float _1403 = _1371;
    if (!_1313)
    {
        _1401 = _1371;
    }
    float _1405 = _1401;
    int _1407 = _1389 * _1397;
    float _1409 = _1405;
    if (_1313)
    {
        _1403 = _1239;
    }
    float _1411 = _1403;
    float _1413 = trunc(_1395);
    float _1415 = precise::max(_1413, 0.0);
    uint _1417 = uint(_1415);
    bool _1419 = !_1353;
    int _1421 = _1419 ? 0 : 1;
    int _1423 = abs(_1393);
    float _1425 = as_type<float>(_832) * _1399;
    int _1427 = abs(_1421);
    int _1429 = _1421;
    float _1431 = _1411;
    if (_1313)
    {
        float _1433 = -_1411;
        float _1435 = _1433 + 1.0;
        _1429 = as_type<int>(_1435);
    }
    int _1437 = _1429;
    if (_1313)
    {
        bool _1439 = _754 > 0.5;
        _1369 = _1439;
    }
    bool _1441 = _1369;
    float _1443 = trunc(_1425);
    float _1445 = precise::max(_1443, 0.0);
    uint _1447 = uint(_1445);
    int _1449 = _1375 * _1423;
    int _1451 = _1449 + _840;
    if (_1313)
    {
        float _1453 = _1441 ? as_type<float>(_1437) : _1411;
        _1409 = _1453;
    }
    float _1455 = _1409;
    float _1457 = in.m_55.w;
    int _1459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1461 = _1459 != 0;
    int _1463 = _1349 * _1427;
    int _1465 = _1463 + _1407;
    int _1467 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1469 = _1467 != 0;
    bool _1471 = !_1461;
    int _1473 = _1471 ? 0 : 1;
    bool _1475 = !_1469;
    int _1477 = _1475 ? 0 : 1;
    int _1479 = ~_750;
    int _1481 = _1479 + 1;
    int _1483 = abs(_1473);
    int _1485 = abs(_1477);
    int _1487 = _1481 * int(_1447);
    int _1489 = _1487 + _1381;
    float _1491 = in.m_63.y;
    int _1493 = _1451 * _1483;
    int _1495 = _1493 + _1465;
    int _1497 = int(_1309) + int(_1417);
    int _1499 = ~_736;
    int _1501 = _1499 + 1;
    int _1503 = _1375 * _1485;
    int _1505 = _1503 + _1495;
    int _1507 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1509 = _1507 != 0;
    float _1511 = float(uint(_1489));
    int _1513 = _1501 * _1497;
    int _1515 = _1513 + _1247;
    float _1517 = float(uint(_1505));
    int _1519 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1521 = _1519 != 0;
    float _1523 = as_type<float>(_832) * _1511;
    bool _1525 = uint(_1515) >= uint(_736);
    float _1527 = as_type<float>(_857) * _1517;
    int _1529 = ~_768;
    int _1531 = _1529 + 1;
    bool _1533 = !_1525;
    int _1535 = _1533 ? 0 : (-1);
    int _1537 = _1515;
    if (_1509)
    {
        float _1539 = -_1411;
        float _1541 = _1539 + 1.0;
        _1537 = as_type<int>(_1541);
    }
    int _1543 = _1537;
    bool _1545 = _792 > 0.5;
    float _1547 = trunc(_1527);
    float _1549 = precise::max(_1547, 0.0);
    uint _1551 = uint(_1549);
    float _1553 = 0.0;
    int _1555 = _1543;
    if (!_1509)
    {
        _1553 = _1411;
    }
    float _1557 = _1553;
    float _1559 = -_1491;
    float _1561 = _1559 + 1.0;
    float _1563 = _1557;
    float _1565 = _1491;
    if (_1509)
    {
        float _1567 = _1545 ? as_type<float>(_1543) : _1411;
        _1563 = _1567;
    }
    float _1569 = _1563;
    if (_1521)
    {
        float _1571 = -_1411;
        float _1573 = _1571 + 1.0;
        _1555 = as_type<int>(_1573);
    }
    int _1575 = _1555;
    bool _1577 = _710 > 0.5;
    int _1579 = ~_1497;
    int _1581 = _1579 + _1535;
    int _1583 = _1581 + 1;
    float _1585 = trunc(_1523);
    float _1587 = precise::max(_1585, 0.0);
    uint _1589 = uint(_1587);
    if (_1521)
    {
        float _1591 = _1577 ? as_type<float>(_1575) : _1411;
        _1431 = _1591;
    }
    float _1593 = _1431;
    int _1595 = _1577 ? as_type<int>(_1561) : as_type<int>(_1491);
    int _1597 = _736 * _1583;
    int _1599 = _1597 + _1247;
    int _1601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1603 = _1601 != 0;
    bool _1605 = _1457 > 0.5;
    int _1607 = _1531 * int(_1551);
    int _1609 = _1607 + _1505;
    float _1611 = _1603 ? as_type<float>(_1595) : _1491;
    int _1613 = ~_750;
    int _1615 = _1613 + 1;
    int _1617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1619 = _1617 != 0;
    float _1621 = float(uint(_1609));
    int _1623 = int(_1447) + int(_1589);
    int _1625 = _1605 ? as_type<int>(_1561) : as_type<int>(_1491);
    float _1627 = as_type<float>(_857) * _1621;
    int _1629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1631 = _1629 != 0;
    int _1633 = _1615 * _1623;
    int _1635 = _1633 + _1381;
    bool _1637 = _736 == 0;
    float _1639 = _710 * 2.0;
    float _1641 = _1631 ? as_type<float>(_1625) : _1491;
    bool _1643 = uint(_1635) >= uint(_750);
    float _1645 = trunc(_1627);
    float _1647 = precise::max(_1645, 0.0);
    uint _1649 = uint(_1647);
    bool _1651 = !_1637;
    int _1653 = _1651 ? _1599 : (-1);
    if (_1619)
    {
        float _1655 = _1545 ? _1561 : _1491;
        _1565 = _1655;
    }
    float _1657 = _1565;
    bool _1659 = !_1643;
    int _1661 = _1659 ? 0 : (-1);
    int _1663 = _1653 & 3;
    bool _1665 = _1663 != 0;
    float _1667 = floor(_1639);
    int _1669 = _1653 & 3;
    bool _1671 = _1669 != 0;
    int _1673 = ~_1623;
    int _1675 = _1673 + _1661;
    int _1677 = _1675 + 1;
    bool _1679 = uint(_1663) >= 2u;
    int _1681 = _1671 ? 0 : 1;
    int _1683 = _750 * _1677;
    int _1685 = _1683 + _1381;
    bool _1687 = uint(_1663) > 1u;
    int _1689 = _1679 ? 0 : 1;
    bool _1691 = _1663 != 3;
    bool _1693 = _750 == 0;
    int _1695 = ~_1681;
    int _1697 = _1695 + 1;
    int _1699 = _1697 + 1;
    bool _1701 = !_1693;
    int _1703 = _1701 ? _1685 : (-1);
    int _1705 = ~_768;
    int _1707 = _1705 + 1;
    int _1709 = int(_1551) + int(_1649);
    int _1711 = _1699;
    if (!_1687)
    {
        int _1713 = ~_1681;
        int _1715 = _1713 + 1;
        _1711 = _1715;
    }
    int _1717 = _1711;
    int _1719 = _1703 & 3;
    bool _1721 = _1719 != 0;
    int _1723 = _1707 * _1709;
    int _1725 = _1723 + _1505;
    int _1727 = ~_1689;
    int _1729 = _1727 + 1;
    int _1731 = _1729 + 1;
    int _1733 = _1731;
    if (_1691)
    {
        int _1735 = ~_1689;
        int _1737 = _1735 + 1;
        _1733 = _1737;
    }
    int _1739 = _1733;
    bool _1741 = uint(_1719) >= 2u;
    int _1743 = _1721 ? 0 : 1;
    int _1745 = _1741 ? 0 : 1;
    bool _1747 = uint(_1725) >= uint(_768);
    float _1749 = _754 * 2.0;
    bool _1751 = _1719 != 3;
    bool _1753 = !_1747;
    int _1755 = _1753 ? 0 : (-1);
    int _1757 = ~_1745;
    int _1759 = _1757 + 1;
    int _1761 = _1759 + 1;
    float _1763 = floor(_1749);
    int _1765 = ~_1709;
    int _1767 = _1765 + _1755;
    int _1769 = _1767 + 1;
    float _1771 = float(uint(_1451));
    bool _1773 = uint(_1719) > 1u;
    int _1775 = _768 * _1769;
    int _1777 = _1775 + _1505;
    float _1779 = float(uint(_1105));
    float _1781 = as_type<float>(_857) * _1771;
    int _1783 = _1761;
    int _1785 = _1743;
    if (_1751)
    {
        int _1787 = ~_1745;
        int _1789 = _1787 + 1;
        _1783 = _1789;
    }
    int _1791 = _1783;
    float _1793 = float(uint(_1073));
    float _1795 = as_type<float>(_832) * _1779;
    int _1797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1799 = _1797 != 0;
    float _1801 = trunc(_1781);
    float _1803 = precise::max(_1801, 0.0);
    uint _1805 = uint(_1803);
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1809 = _1807 != 0;
    float _1811 = as_type<float>(_814) * _1793;
    bool _1813 = !_1799;
    int _1815 = _1813 ? 0 : 1;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1819 = _1817 != 0;
    int _1821 = ~_736;
    int _1823 = _1821 + 1;
    float _1825 = trunc(_1811);
    float _1827 = precise::max(_1825, 0.0);
    uint _1829 = uint(_1827);
    int _1831 = ~_750;
    int _1833 = _1831 + 1;
    bool _1835 = !_1295;
    int _1837 = _1835 ? _1777 : (-1);
    int _1839 = ~_768;
    int _1841 = _1839 + 1;
    bool _1843 = !_1819;
    int _1845 = _1843 ? 0 : 1;
    float _1847 = trunc(_1795);
    float _1849 = precise::max(_1847, 0.0);
    uint _1851 = uint(_1849);
    int _1853 = _1837 & 3;
    bool _1855 = _1853 != 0;
    int _1857 = _1841 * int(_1805);
    int _1859 = _1857 + _1451;
    int _1861 = ~_1743;
    int _1863 = _1861 + 1;
    int _1865 = _1863 + 1;
    int _1867 = _1865;
    int _1869 = as_type<int>(_1811);
    if (!_1773)
    {
        int _1871 = ~_1743;
        int _1873 = _1871 + 1;
        _1867 = _1873;
    }
    int _1875 = _1867;
    if (_1809)
    {
        _1785 = 0;
        _1869 = 0;
    }
    int _1877 = _1785;
    int _1879 = _1869;
    int _1881 = _1823 * int(_1829);
    int _1883 = _1881 + _1073;
    bool _1885 = uint(_1853) >= 2u;
    bool _1887 = _1853 != 3;
    int _1889 = _1877;
    int _1891 = _1879;
    if (!_1809)
    {
        _1889 = 1;
    }
    int _1893 = _1889;
    float _1895 = float(uint(_1883));
    int _1897 = _1833 * int(_1851);
    int _1899 = _1897 + _1105;
    int _1901 = _1885 ? 0 : 1;
    float _1903 = float(uint(_1859));
    float _1905 = as_type<float>(_814) * _1895;
    float _1907 = float(uint(_1899));
    bool _1909 = _1893 != 1;
    float _1911 = as_type<float>(_857) * _1903;
    if (!_1809)
    {
        _1891 = 2;
    }
    int _1913 = _1891;
    float _1915 = as_type<float>(_832) * _1907;
    int _1917 = ~_1901;
    int _1919 = _1917 + 1;
    int _1921 = _1919 + 1;
    float _1923 = trunc(_1905);
    float _1925 = precise::max(_1923, 0.0);
    uint _1927 = uint(_1925);
    float _1929 = _1855 ? 0.0 : 1.4012984643248170709237295832899e-45;
    bool _1931 = uint(_1853) > 1u;
    int _1933 = _1921;
    float _1935 = _1929;
    if (_1887)
    {
        int _1937 = ~_1901;
        int _1939 = _1937 + 1;
        _1933 = _1939;
    }
    int _1941 = _1933;
    bool _1943 = _1913 != 2;
    float _1945 = trunc(_1915);
    float _1947 = precise::max(_1945, 0.0);
    uint _1949 = uint(_1947);
    float _1951 = 0.0;
    if (!_1909)
    {
        _1951 = _710;
    }
    float _1953 = _1951;
    float _1955 = 0.0;
    float _1957 = _1953;
    if (!_1909)
    {
        _1955 = _792;
    }
    float _1959 = _1955;
    float _1961 = 0.0;
    float _1963 = _1959;
    if (!_1909)
    {
        _1961 = _1953;
    }
    float _1965 = _1961;
    float _1967 = 0.0;
    float _1969 = _1965;
    if (!_1909)
    {
        _1967 = _792;
    }
    float _1971 = _1967;
    float _1973 = trunc(_1911);
    float _1975 = precise::max(_1973, 0.0);
    uint _1977 = uint(_1975);
    float _1979 = _1971;
    if (_1909)
    {
        _1969 = _754;
    }
    float _1981 = _1969;
    if (_1909)
    {
        _1957 = _754;
    }
    float _1983 = _1957;
    if (_1909)
    {
        _1963 = _710;
    }
    float _1985 = _1963;
    if (_1909)
    {
        _1979 = _710;
    }
    float _1987 = _1979;
    bool _1989 = _1763 >= 0.0;
    bool _1991 = isnan(_1763);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan(0.0);
    bool _1997 = _1993 || _1995;
    int _1999 = ~as_type<int>(_1929);
    int _2001 = _1999 + 1;
    int _2003 = _2001 + 1;
    int _2005 = _2003;
    if (!_1931)
    {
        int _2007 = ~as_type<int>(_1929);
        int _2009 = _2007 + 1;
        _2005 = _2009;
    }
    int _2011 = _2005;
    bool _2013 = _1763 > 0.0;
    if (_1943)
    {
        _1935 = _754;
    }
    float _2015 = _1935;
    float _2017 = 0.0;
    float _2019 = _2015;
    if (_1943)
    {
        _2017 = _710;
    }
    float _2021 = _2017;
    int _2023 = _1997 ? 0 : 1;
    float _2025 = _2021;
    if (!_1943)
    {
        _2019 = _792;
    }
    float _2027 = _2019;
    if (!_1943)
    {
        _2025 = _754;
    }
    float _2029 = _2025;
    bool _2031 = _1667 > 0.0;
    bool _2033 = _1667 >= 0.0;
    bool _2035 = isnan(_1667);
    bool _2037 = _2033 || _2035;
    bool _2039 = isnan(0.0);
    bool _2041 = _2037 || _2039;
    int _2043 = int(_1829) + int(_1927);
    int _2045 = int(_1851) + int(_1949);
    float _2047 = in.m_65.x;
    float _2049 = in.m_65.y;
    float _2051 = in.m_65.z;
    int _2053 = int(_1805) + int(_1977);
    int _2055 = _760 * _2043;
    int _2057 = _2055 + _1073;
    int _2059 = ~_2023;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    float _2065 = in.m_48.x;
    float _2067 = in.m_48.y;
    float _2069 = in.m_48.z;
    int _2071 = _2063;
    if (!_2013)
    {
        int _2073 = ~_2023;
        int _2075 = _2073 + 1;
        _2071 = _2075;
    }
    int _2077 = _2071;
    int _2079 = _804 * _2053;
    int _2081 = _2079 + _1451;
    bool _2083 = uint(_2057) >= uint(_736);
    float _2085 = in.m_67.x;
    float _2087 = in.m_67.y;
    float _2089 = in.m_67.z;
    int _2091 = _790 * _2045;
    int _2093 = _2091 + _1105;
    int _2095 = _2041 ? 0 : 1;
    bool _2097 = !_2083;
    int _2099 = _2097 ? 0 : (-1);
    bool _2101 = uint(_2081) >= uint(_768);
    bool _2103 = uint(_2093) >= uint(_750);
    bool _2105 = !_2101;
    int _2107 = _2105 ? 0 : (-1);
    bool _2109 = !_2103;
    int _2111 = _2109 ? 0 : (-1);
    int _2113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2115 = _2113 != 0;
    int _2117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2119 = _2117 != 0;
    int _2121 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2123 = _2121 != 0;
    int _2125 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2127 = _2125 != 0;
    int _2129 = ~_2095;
    int _2131 = _2129 + 1;
    int _2133 = _2131 + 1;
    float _2135 = _2067 * _2049;
    int _2137 = _2133;
    if (!_2031)
    {
        int _2139 = ~_2095;
        int _2141 = _2139 + 1;
        _2137 = _2141;
    }
    int _2143 = _2137;
    float _2145 = _2067 * _2087;
    float _2147 = _2067 * _1199;
    float _2149 = fma(_2065, _2047, _2135);
    float _2151 = fma(_2065, _2085, _2145);
    float _2153 = fma(_2065, _1197, _2147);
    float _2155 = _792 * 2.0;
    float _2157 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2159 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2157;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2163 = _754 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _2165 = _2159 * _1117;
    float _2167 = floor(_2155);
    bool _2169 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2171 = isnan(_704);
    bool _2173 = _2169 || _2171;
    bool _2175 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2177 = _2173 || _2175;
    float _2179 = float(_2177);
    float _2181 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _2183 = _704 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2185 = isnan(_704);
    bool _2187 = _2183 || _2185;
    bool _2189 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2191 = _2187 || _2189;
    float _2193 = float(_2191);
    float _2195 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2197 = _704 + _2195;
    float _2199 = -_2161;
    float _2201 = fma(_2163, 2.0, _2199);
    float _2203 = -_2179;
    float _2205 = _2203 + 1.0;
    float _2207 = fma(_738, -2.0, _2181);
    float _2209 = fma(_2165, _2197, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2211 = fma(_2069, _2089, _2151);
    float _2213 = _2193 * _2205;
    float _2215 = _754 + _710;
    float _2217 = fma(_2069, _2051, _2149);
    float _2219 = _2209 * _2213;
    float _2221 = -_2193;
    float _2223 = _2221 + 1.0;
    float _2225 = _2215 + (-1.0);
    bool _2227 = _2167 >= 0.0;
    bool _2229 = isnan(_2167);
    bool _2231 = _2227 || _2229;
    bool _2233 = isnan(0.0);
    bool _2235 = _2231 || _2233;
    float _2237 = fma(_2069, _1201, _2153);
    float _2239 = fma(_2223, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2219);
    float _2241 = fma(_2225, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2243 = _2235 ? 0 : 1;
    float _2245 = fma(_2179, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2239);
    bool _2247 = _2167 > 0.0;
    float _2249 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2251 = _2027 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _2253 = _2211 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2255 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2259 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2261 = -_2249;
    float _2263 = fma(_2251, 2.0, _2261);
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2267 = _710 + _792;
    int _2269 = ~_2043;
    int _2271 = _2269 + _2099;
    int _2273 = _2271 + 1;
    float _2275 = _2217 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2277 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2279 = _2253 + _2277;
    float _2281 = _2257 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2283 = _2259 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2285 = _2265 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2287 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2289 = _2237 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2293 = _2275 + _2291;
    float _2295 = _2279 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2297 = _2267 + (-1.0);
    int _2299 = ~_2243;
    int _2301 = _2299 + 1;
    int _2303 = _2301 + 1;
    out.m_69.x = _2281;
    out.m_69.y = _2283;
    out.m_69.z = _2285;
    out.m_69.w = _2255;
    int _2305 = _2303;
    if (!_2247)
    {
        int _2307 = ~_2243;
        int _2309 = _2307 + 1;
        _2305 = _2309;
    }
    int _2311 = _2305;
    float _2313 = fma(_1983, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2287);
    int _2315 = _736 * _2273;
    int _2317 = _2315 + _1073;
    float _2319 = _2029 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _2321 = !_2119;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _2327 = !_2115;
    int _2329 = _2327 ? 0 : 1;
    float _2331 = fma(_2297, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2333 = abs(_2323);
    float _2335 = fma(_1987, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2325);
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2339 = _2289 + _2337;
    float _2341 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2295);
    int _2343 = _1653 >> 31;
    float _2345 = -_150;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2201);
    int _2349 = _1703 >> 31;
    float _2351 = fma(_2339, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2341);
    int _2353 = _2343 & 3;
    float _2355 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2207);
    int _2357 = _2349 & 3;
    float _2359 = -_150;
    float _2361 = fma(_2359, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2263);
    bool _2363 = _2351 >= 0.0;
    float _2365 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2313);
    int _2367 = _1653 + _2353;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2371 = _1985 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _2373 = _1703 + _2357;
    float _2375 = _1981 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _2377 = _2367 >> 2;
    float _2379 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2335);
    int _2381 = _2373 >> 2;
    float _2383 = -_2369;
    float _2385 = fma(_2375, 2.0, _2383);
    int _2387 = _2377 << 4;
    int _2389 = _2387 + 368;
    int _2391 = abs(_2329);
    float _2393 = in.m_71.x;
    float _2395 = in.m_71.y;
    float _2397 = in.m_71.z;
    uint _2399 = uint(int(uint(_2389) >> uint(2)));
    uint _2401 = uint(int(uint(int(_2399)) >> uint(2)));
    int _2403 = int(_2399) & 3;
    float _2405 = (*spvDescriptorSet0.vp_c9)._m0[int(_2401)][_2403];
    int _2407 = int(_2399) + 1;
    uint _2409 = uint(int(uint(_2407) >> uint(2)));
    int _2411 = _2407 & 3;
    float _2413 = (*spvDescriptorSet0.vp_c9)._m0[int(_2409)][_2411];
    int _2415 = _2381 << 4;
    int _2417 = _2415 + 512;
    float _2419 = -_150;
    float _2421 = fma(_2419, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2385);
    float _2423 = float(_2077);
    float _2425 = as_type<float>(_2311);
    float _2427 = _2347;
    float _2429 = _2355;
    if (_2363)
    {
        out.m_51.x = 0.0;
    }
    float _2431 = float(_2333);
    float _2433 = float(_2311);
    uint _2435 = uint(int(uint(_2417) >> uint(2)));
    uint _2437 = uint(int(uint(int(_2435)) >> uint(2)));
    int _2439 = int(_2435) & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    int _2443 = int(_2435) + 1;
    uint _2445 = uint(int(uint(_2443) >> uint(2)));
    int _2447 = _2443 & 3;
    float _2449 = (*spvDescriptorSet0.vp_c9)._m0[int(_2445)][_2447];
    float _2451 = float(_2391);
    float _2453 = _2431 * _2423;
    bool _2455 = _736 == 0;
    float _2457 = _2451 * _2433;
    if (_2363)
    {
        _2425 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2459 = _2425;
    int _2461 = _2389 + 8;
    uint _2463 = uint(int(uint(_2461) >> uint(2)));
    uint _2465 = uint(int(uint(int(_2463)) >> uint(2)));
    int _2467 = int(_2463) & 3;
    float _2469 = (*spvDescriptorSet0.vp_c9)._m0[int(_2465)][_2467];
    int _2471 = int(_2463) + 1;
    uint _2473 = uint(int(uint(_2471) >> uint(2)));
    int _2475 = _2471 & 3;
    float _2477 = (*spvDescriptorSet0.vp_c9)._m0[int(_2473)][_2475];
    float _2479 = fma(_2319, -2.0, _730);
    float _2481 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2483 = _2457 * (-2.0);
    int _2485 = as_type<int>(_2459);
    if (_2363)
    {
        float _2487 = _2459 * 5.0;
        _2485 = as_type<int>(_2487);
    }
    int _2489 = _2485;
    int _2491 = ~_2045;
    int _2493 = _2491 + _2111;
    int _2495 = _2493 + 1;
    float _2497 = fma(_2371, -2.0, _2481);
    bool _2499 = !_1665;
    int _2501 = _2499 ? 0 : 1;
    int _2503 = abs(_1717);
    int _2505 = _750 * _2495;
    int _2507 = _2505 + _1105;
    int _2509 = _1703 & 3;
    bool _2511 = _2509 != 0;
    float _2513 = fma(_2241, _2483, _2241);
    if (_2363)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8581 = as_type<float>(_2489);
        out.gl_Position.z = _8581;
    }
    int _2515 = ~_2053;
    int _2517 = _2515 + _2107;
    int _2519 = _2517 + 1;
    float _2521 = fma(_2483, _2393, _2393);
    int _2523 = _1837 >> 31;
    float _2525 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2497);
    int _2527 = abs(_1875);
    float _2529 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2479);
    float _2531 = _2453 * (-2.0);
    int _2533 = _2523 & 3;
    int _2535 = ~_2503;
    int _2537 = _2535 + 1;
    int _2539 = _2537 + 1;
    int _2541 = _2417 + 8;
    uint _2543 = uint(int(uint(_2541) >> uint(2)));
    uint _2545 = uint(int(uint(int(_2543)) >> uint(2)));
    int _2547 = int(_2543) & 3;
    float _2549 = (*spvDescriptorSet0.vp_c9)._m0[int(_2545)][_2547];
    int _2551 = int(_2543) + 1;
    uint _2553 = uint(int(uint(_2551) >> uint(2)));
    int _2555 = _2551 & 3;
    float _2557 = (*spvDescriptorSet0.vp_c9)._m0[int(_2553)][_2555];
    int _2559 = _1837 & 3;
    bool _2561 = _2559 != 0;
    float _2563 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2565 = int(_2563);
    bool _2567 = !_2511;
    int _2569 = _2567 ? 0 : 1;
    int _2571 = _1837 + _2533;
    int _2573 = abs(_2501);
    int _2575 = _2539 * as_type<int>(_2413);
    int _2577 = abs(_2569);
    float _2579 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2581 = int(_2579);
    int _2583 = _2571 >> 2;
    int _2585 = abs(_1739);
    int _2587 = ~_2573;
    int _2589 = _2587 + 1;
    int _2591 = _2589 + 1;
    int _2593 = _2583 << 4;
    int _2595 = _2593 + 656;
    int _2597 = ~_2585;
    int _2599 = _2597 + 1;
    int _2601 = _2599 + 1;
    int _2603 = _2591 * as_type<int>(_2405);
    int _2605 = _2603 + _2575;
    bool _2607 = _1663 != 3;
    uint _2609 = uint(int(uint(_2595) >> uint(2)));
    uint _2611 = uint(int(uint(int(_2609)) >> uint(2)));
    int _2613 = int(_2609) & 3;
    float _2615 = (*spvDescriptorSet0.vp_c9)._m0[int(_2611)][_2613];
    int _2617 = int(_2609) + 1;
    uint _2619 = uint(int(uint(_2617) >> uint(2)));
    int _2621 = _2617 & 3;
    float _2623 = (*spvDescriptorSet0.vp_c9)._m0[int(_2619)][_2621];
    int _2625 = ~_2527;
    int _2627 = _2625 + 1;
    int _2629 = _2627 + 1;
    int _2631 = _2601 * as_type<int>(_2469);
    int _2633 = _2631 + _2605;
    bool _2635 = !_2607;
    int _2637 = _2635 ? 0 : (-1);
    bool _2639 = _1719 != 3;
    int _2641 = _2629 * as_type<int>(_2449);
    int _2643 = ~_2577;
    int _2645 = _2643 + 1;
    int _2647 = _2645 + 1;
    bool _2649 = !_2639;
    int _2651 = _2649 ? 0 : (-1);
    int _2653 = abs(_1791);
    int _2655 = _2647 * as_type<int>(_2441);
    int _2657 = _2655 + _2641;
    int _2659 = abs(_2637);
    int _2661 = _2595 + 8;
    uint _2663 = uint(int(uint(_2661) >> uint(2)));
    uint _2665 = uint(int(uint(int(_2663)) >> uint(2)));
    int _2667 = int(_2663) & 3;
    float _2669 = (*spvDescriptorSet0.vp_c9)._m0[int(_2665)][_2667];
    int _2671 = int(_2663) + 1;
    uint _2673 = uint(int(uint(_2671) >> uint(2)));
    int _2675 = _2671 & 3;
    float _2677 = (*spvDescriptorSet0.vp_c9)._m0[int(_2673)][_2675];
    int _2679 = abs(_2651);
    int _2681 = abs(_1845);
    float _2683 = float(uint(_2565));
    int _2685 = abs(_1815);
    int _2687 = ~_2653;
    int _2689 = _2687 + 1;
    int _2691 = _2689 + 1;
    float _2693 = 1.0 / _2683;
    int _2695 = _2691 * as_type<int>(_2549);
    int _2697 = _2695 + _2657;
    int _2699 = ~_2659;
    int _2701 = _2699 + 1;
    int _2703 = _2701 + 1;
    float _2705 = float(uint(_2581));
    int _2707 = _2703 * as_type<int>(_2477);
    int _2709 = _2707 + _2633;
    int _2711 = ~_2679;
    int _2713 = _2711 + 1;
    int _2715 = _2713 + 1;
    float _2717 = 1.0 / _2705;
    int _2719 = ~_2685;
    int _2721 = _2719 + 1;
    int _2723 = _2721 + 1;
    bool _2725 = !_2455;
    int _2727 = _2725 ? _2317 : (-1);
    int _2729 = _2715 * as_type<int>(_2557);
    int _2731 = _2729 + _2697;
    int _2733 = ~_2681;
    int _2735 = _2733 + 1;
    int _2737 = _2735 + 1;
    int _2739 = _2709 * _2723;
    bool _2741 = _750 == 0;
    float _2743 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2745 = int(_2743);
    bool _2747 = _1853 != 3;
    int _2749 = _2737 * _2731;
    bool _2751 = !_2741;
    int _2753 = _2751 ? _2507 : (-1);
    int _2755 = _2727 * _2685;
    int _2757 = _2755 + _2739;
    int _2759 = as_type<int>(_2693) + (-2);
    bool _2761 = !_2561;
    int _2763 = _2761 ? 0 : 1;
    int _2765 = _2753 * _2681;
    int _2767 = _2765 + _2749;
    bool _2769 = !_2747;
    int _2771 = _2769 ? 0 : (-1);
    float _2773 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2775 = log2(_2773);
    float _2777 = float(uint(_2757));
    int _2779 = abs(_2011);
    int _2781 = as_type<int>(_2717) + (-2);
    int _2783 = abs(_2771);
    float _2785 = as_type<float>(_2759) * _2777;
    int _2787 = abs(_2763);
    int _2789 = ~_2779;
    int _2791 = _2789 + 1;
    int _2793 = _2791 + 1;
    int _2795 = abs(_1941);
    float _2797 = trunc(_2785);
    float _2799 = precise::max(_2797, 0.0);
    uint _2801 = uint(_2799);
    float _2803 = float(uint(_2767));
    int _2805 = _2793 * as_type<int>(_2623);
    int _2807 = ~_2787;
    int _2809 = _2807 + 1;
    int _2811 = _2809 + 1;
    float _2813 = _2775 * _150;
    float _2815 = as_type<float>(_2781) * _2803;
    int _2817 = ~_2795;
    int _2819 = _2817 + 1;
    int _2821 = _2819 + 1;
    int _2823 = _2811 * as_type<int>(_2615);
    int _2825 = _2823 + _2805;
    bool _2827 = !_2127;
    int _2829 = _2827 ? 0 : 1;
    float _2831 = trunc(_2815);
    float _2833 = precise::max(_2831, 0.0);
    uint _2835 = uint(_2833);
    int _2837 = ~_2783;
    int _2839 = _2837 + 1;
    int _2841 = _2839 + 1;
    int _2843 = _2821 * as_type<int>(_2669);
    int _2845 = _2843 + _2825;
    int _2847 = abs(_2829);
    int _2849 = _768 * _2519;
    int _2851 = _2849 + _1451;
    int _2853 = ~_2581;
    int _2855 = _2853 + 1;
    int _2857 = _2841 * as_type<int>(_2677);
    int _2859 = _2857 + _2845;
    int _2861 = ~_2565;
    int _2863 = _2861 + 1;
    float _2865 = exp2(_2813);
    float _2867 = float(uint(_2745));
    int _2869 = _2863 * int(_2801);
    int _2871 = _2869 + _2757;
    int _2873 = ~_2847;
    int _2875 = _2873 + 1;
    int _2877 = _2875 + 1;
    int _2879 = abs(_2565);
    int _2881 = _2855 * int(_2835);
    int _2883 = _2881 + _2767;
    float _2885 = float(uint(_2871));
    int _2887 = _2877 * _2859;
    float _2889 = 1.0 / _2867;
    bool _2891 = !_1295;
    int _2893 = _2891 ? _2851 : (-1);
    float _2895 = float(uint(_2883));
    float _2897 = as_type<float>(_2759) * _2885;
    int _2899 = abs(_2581);
    int _2901 = _2893 * _2847;
    int _2903 = _2901 + _2887;
    float _2905 = float(uint(_2879));
    float _2907 = as_type<float>(_2781) * _2895;
    float _2909 = trunc(_2897);
    float _2911 = precise::max(_2909, 0.0);
    uint _2913 = uint(_2911);
    float _2915 = float(uint(_2899));
    int _2917 = abs(_2745);
    float _2919 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2921 = 1.0 + _2919;
    int _2923 = as_type<int>(_2889) + (-2);
    float _2925 = 1.0 / _2905;
    float _2927 = float(uint(_2917));
    float _2929 = float(uint(_2903));
    int _2931 = abs(_2767);
    float _2933 = 1.0 / _2915;
    float _2935 = as_type<float>(_2923) * _2929;
    float _2937 = float(uint(_2931));
    float _2939 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2941 = 1.0 / _2927;
    float _2943 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2945 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2947 = isnan(1.0);
    bool _2949 = _2945 || _2947;
    bool _2951 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2953 = _2949 || _2951;
    float _2955 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2957 = abs(_2757);
    float _2959 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _2961 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2963 = isnan(0.0);
    bool _2965 = _2961 || _2963;
    bool _2967 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2969 = _2965 || _2967;
    float _2971 = 1.0 / _2921;
    int _2973 = as_type<int>(_2933) + (-2);
    float _2975 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2939);
    int _2977 = as_type<int>(_2925) + (-2);
    float _2979 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2943);
    float _2981 = float(uint(_2957));
    float _2983 = as_type<float>(_2973) * _2937;
    float _2985 = -_2865;
    float _2987 = _2985 + 1.0;
    float _2989 = trunc(_2935);
    float _2991 = precise::max(_2989, 0.0);
    uint _2993 = uint(_2991);
    int _2995 = abs(_2903);
    float _2997 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2955);
    float _2999 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2959);
    float _3001 = _2969 ? _2987 : 0.0;
    float _3003 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2975);
    float _3005 = as_type<float>(_2977) * _2981;
    float _3007 = _2279 * _2279;
    int _3009 = ~_2745;
    int _3011 = _3009 + 1;
    float _3013 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2979);
    int _3015 = as_type<int>(_2941) + (-2);
    float _3017 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2997);
    float _3019 = float(uint(_2995));
    float _3021 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2999);
    if (_2953)
    {
        float _3023 = _3001 * _2971;
        _154 = _3023;
    }
    float _3025 = _154;
    int _3027 = ~_2879;
    int _3029 = _3027 + 1;
    float _3031 = fma(_2293, _2293, _3007);
    float _3033 = trunc(_3005);
    float _3035 = precise::max(_3033, 0.0);
    uint _3037 = uint(_3035);
    float _3039 = as_type<float>(_3015) * _3019;
    int _3041 = _3011 * int(_2993);
    int _3043 = _3041 + _2903;
    float _3045 = fma(_2339, _2339, _3031);
    int _3047 = ~_2899;
    int _3049 = _3047 + 1;
    float _3051 = float(uint(_3043));
    float _3053 = trunc(_2983);
    float _3055 = precise::max(_3053, 0.0);
    uint _3057 = uint(_3055);
    int _3059 = ~_2917;
    int _3061 = _3059 + 1;
    int _3063 = int(_2801) + int(_2913);
    float _3065 = as_type<float>(_2923) * _3051;
    int _3067 = ~_2565;
    int _3069 = _3067 + 1;
    float _3071 = trunc(_3039);
    float _3073 = precise::max(_3071, 0.0);
    uint _3075 = uint(_3073);
    int _3077 = _3029 * int(_3037);
    int _3079 = _3077 + _2957;
    float _3081 = float(uint(_3079));
    float _3083 = rsqrt(_3045);
    int _3085 = _3049 * int(_3057);
    int _3087 = _3085 + _2931;
    float _3089 = as_type<float>(_2977) * _3081;
    int _3091 = ~_2581;
    int _3093 = _3091 + 1;
    float _3095 = float(uint(_3087));
    float _3097 = trunc(_2907);
    float _3099 = precise::max(_3097, 0.0);
    uint _3101 = uint(_3099);
    int _3103 = _3061 * int(_3075);
    int _3105 = _3103 + _2995;
    float _3107 = as_type<float>(_2973) * _3095;
    float _3109 = float(uint(_3105));
    float _3111 = trunc(_3089);
    float _3113 = precise::max(_3111, 0.0);
    uint _3115 = uint(_3113);
    float _3117 = _674 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3119 = _3117 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _3121 = int(_2835) + int(_3101);
    float _3123 = _3119 * _3083;
    float _3125 = trunc(_3065);
    float _3127 = precise::max(_3125, 0.0);
    uint _3129 = uint(_3127);
    float _3131 = as_type<float>(_3015) * _3109;
    float _3133 = _754 + (-0.5);
    float _3135 = _2279 * _3123;
    float _3137 = _2293 * _3123;
    int _3139 = _3093 * _3121;
    int _3141 = _3139 + _2767;
    float _3143 = fma(_3133, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2521);
    float _3145 = -_3135;
    float _3147 = _2279 + _3145;
    float _3149 = trunc(_3107);
    float _3151 = precise::max(_3149, 0.0);
    uint _3153 = uint(_3151);
    float _3155 = -_3137;
    float _3157 = _2293 + _3155;
    float _3159 = _3147 * _3147;
    bool _3161 = uint(_3141) >= uint(_2581);
    int _3163 = _3069 * _3063;
    int _3165 = _3163 + _2757;
    int _3167 = int(_3037) + int(_3115);
    float _3169 = fma(_3157, _3157, _3159);
    int _3171 = int(_2993) + int(_3129);
    float _3173 = trunc(_3131);
    float _3175 = precise::max(_3173, 0.0);
    uint _3177 = uint(_3175);
    int _3179 = ~_2745;
    int _3181 = _3179 + 1;
    float _3183 = _2339 * _3123;
    int _3185 = ~_2917;
    int _3187 = _3185 + 1;
    float _3189 = fma(_2513, _3025, _3143);
    int _3191 = ~_2879;
    int _3193 = _3191 + 1;
    int _3195 = int(_3057) + int(_3153);
    int _3197 = _3181 * _3171;
    int _3199 = _3197 + _2903;
    bool _3201 = uint(_3165) >= uint(_2565);
    int _3203 = ~_2899;
    int _3205 = _3203 + 1;
    int _3207 = _3193 * _3167;
    int _3209 = _3207 + _2957;
    int _3211 = int(_3075) + int(_3177);
    float _3213 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _3215 = _3205 * _3195;
    int _3217 = _3215 + _2931;
    bool _3219 = !_3161;
    int _3221 = _3219 ? 0 : (-1);
    bool _3223 = uint(_3199) >= uint(_2745);
    int _3225 = _3187 * _3211;
    int _3227 = _3225 + _2995;
    bool _3229 = !_3201;
    int _3231 = _3229 ? 0 : (-1);
    float _3233 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3235 = uint(_3209) >= uint(_2879);
    int _3237 = ~_3063;
    int _3239 = _3237 + _3231;
    int _3241 = _3239 + 1;
    bool _3243 = uint(_3217) >= uint(_2899);
    int _3245 = ~_3121;
    int _3247 = _3245 + _3221;
    int _3249 = _3247 + 1;
    int _3251 = _2565 * _3241;
    int _3253 = _3251 + _2757;
    bool _3255 = uint(_3227) >= uint(_2917);
    float _3257 = _3213 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _3259 = !_3223;
    int _3261 = _3259 ? 0 : (-1);
    int _3263 = _2581 * _3249;
    int _3265 = _3263 + _2767;
    bool _3267 = !_3235;
    int _3269 = _3267 ? 0 : (-1);
    bool _3271 = _2565 == 0;
    float _3273 = _3233 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3275 = _2565 == 0;
    int _3277 = _2757 ^ _2565;
    float _3279 = fma(_3273, _1455, -0.5);
    float _3281 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3283 = !_3243;
    int _3285 = _3283 ? 0 : (-1);
    bool _3287 = _2581 == 0;
    int _3289 = _2767 ^ _2581;
    int _3291 = ~_3171;
    int _3293 = _3291 + _3261;
    int _3295 = _3293 + 1;
    float _3297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3299 = !_3271;
    int _3301 = _3299 ? _3253 : (-1);
    bool _3303 = !_3287;
    int _3305 = _3303 ? _3265 : (-1);
    bool _3307 = !_3255;
    int _3309 = _3307 ? 0 : (-1);
    bool _3311 = _2581 == 0;
    int _3313 = ~_3269;
    int _3315 = _3167 + _3313;
    int _3317 = _3315 + 1;
    int _3319 = _2903 ^ _2745;
    int _3321 = _2745 * _3295;
    int _3323 = _3321 + _2903;
    int _3325 = ~_3285;
    int _3327 = _3195 + _3325;
    int _3329 = _3327 + 1;
    float _3331 = float(_3301);
    float _3333 = _3281 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3335 = float(_3305);
    float _3337 = _3297 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3339 = _2745 == 0;
    float _3341 = fma(_3273, _3331, _2347);
    bool _3343 = _2745 == 0;
    float _3345 = fma(_3333, _3335, _2421);
    float _3347 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3349 = uint(int(uint(_3289) >> uint(31)));
    float _3351 = fma(_3337, _1593, -0.5);
    uint _3353 = uint(int(uint(_3277) >> uint(31)));
    float _3355 = fma(_3333, _1569, -0.5);
    uint _3357 = uint(int(uint(_3319) >> uint(31)));
    float _3359 = fma(_3013, _3279, _3341);
    bool _3361 = !_3339;
    int _3363 = _3361 ? _3323 : (-1);
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _3367 = ~int(_3349);
    int _3369 = _3367 + 1;
    float _3371 = fma(_2365, _3355, _3345);
    int _3373 = ~_3309;
    int _3375 = _3211 + _3373;
    int _3377 = _3375 + 1;
    int _3379 = ~int(_3353);
    int _3381 = _3379 + 1;
    int _3383 = ~int(_3357);
    int _3385 = _3383 + 1;
    float _3387 = float(_3363);
    int _3389 = _3329 ^ _3369;
    int _3391 = _3317 ^ _3381;
    float _3393 = fma(_3337, _3387, _2361);
    int _3395 = _3377 ^ _3385;
    int _3397 = ~_3369;
    int _3399 = _3397 + _3389;
    int _3401 = _3399 + 1;
    float _3403 = fma(_3021, _3351, _3393);
    int _3405 = ~_3381;
    int _3407 = _3405 + _3391;
    int _3409 = _3407 + 1;
    float _3411 = _3347 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _3413 = ~_3385;
    int _3415 = _3413 + _3395;
    int _3417 = _3415 + 1;
    float _3419 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3421 = !_3311;
    int _3423 = _3421 ? _3401 : (-1);
    float _3425 = fma(_1641, _3411, -0.5);
    bool _3427 = !_3275;
    int _3429 = _3427 ? _3409 : (-1);
    float _3431 = fma(_1611, _3257, -0.5);
    bool _3433 = !_3343;
    int _3435 = _3433 ? _3417 : (-1);
    float _3437 = fma(_2331, _2531, _2331);
    float _3439 = float(_3423);
    float _3441 = float(_3429);
    float _3443 = float(_3435);
    float _3445 = -_2525;
    float _3447 = fma(_3411, _3439, _3445);
    float _3449 = fma(_3419, _1657, -0.5);
    float _3451 = -_2355;
    float _3453 = fma(_3257, _3441, _3451);
    float _3455 = _3371 + 0.5;
    float _3457 = -_2529;
    float _3459 = fma(_3419, _3443, _3457);
    float _3461 = fma(_2379, _3425, _3447);
    float _3463 = fma(_3017, _3431, _3453);
    float _3465 = _3403 + 0.5;
    float _3467 = fma(_3003, _3449, _3459);
    float _3469 = _3359 + 0.5;
    float _3471 = _3463 + 0.5;
    float _3473 = _3461 + 0.5;
    float _3475 = _3467 + 0.5;
    float _3477 = -_3183;
    float _3479 = _2339 + _3477;
    float _3481 = fma(_2531, _2395, _2395);
    bool _3483 = !_2123;
    int _3485 = _3483 ? 0 : 1;
    out.m_73.x = _3469;
    out.m_73.y = _3471;
    out.m_73.z = _3455;
    out.m_73.w = _3473;
    float _3487 = fma(_3479, _3479, _3169);
    float _3489 = _710 + (-0.5);
    out.m_75.x = _3465;
    out.m_75.y = _3475;
    float _3491 = as_type<float>(_3187);
    if (_2363)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3493 = -_3135;
    float _3495 = _2253 + _3493;
    int _3497 = abs(_3485);
    float _3499 = -_3137;
    float _3501 = _2275 + _3499;
    float _3503 = float(_2143);
    float _3505 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3507 = _3495 + _3505;
    float _3509 = -_3183;
    float _3511 = _2289 + _3509;
    float _3513 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3515 = _3501 + _3513;
    float _3517 = _754 + _792;
    float _3519 = _3507 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3523 = _3511 + _3521;
    float _3525 = _792 + (-0.5);
    float _3527 = _3517 + (-1.0);
    float _3529 = fma(_3515, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3519);
    float _3531 = float(_3497);
    float _3533 = fma(_3489, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3481);
    float _3535 = _3189 * 0.15915493667125701904296875;
    float _3537 = fma(_3523, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3529);
    float _3539 = sqrt(_3487);
    float _3541 = _3531 * _3503;
    float _3543 = fma(_3437, _3025, _3533);
    bool _3545 = _3537 >= 0.0;
    float _3547 = _3541 * (-2.0);
    float _3549 = fma(_3527, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3551 = _3543 * 0.15915493667125701904296875;
    float _3553 = fma(_3547, _2397, _2397);
    float _3555 = _3535 * 6.283185482025146484375;
    float _3557 = sin(_3555);
    float _3559 = fma(_3549, _3547, _3549);
    float _3561 = fma(_3525, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3553);
    float _3563 = fma(_3559, _3025, _3561);
    float _3565 = _3543;
    float _3567 = _3507;
    float _3569 = _3515;
    float _3571 = _3523;
    if (_3545)
    {
        _3565 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3573 = _3565;
    float _3575 = _3535 * 6.283185482025146484375;
    float _3577 = cos(_3575);
    float _3579 = _3563 * 0.15915493667125701904296875;
    int _3581 = as_type<int>(_3573);
    if (_3545)
    {
        out.m_51.x = 0.0;
    }
    if (_3545)
    {
        float _3583 = _3573 * 5.0;
        _3581 = as_type<int>(_3583);
    }
    int _3585 = _3581;
    float _3587 = _3551 * 6.283185482025146484375;
    float _3589 = sin(_3587);
    if (_3545)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _10107 = as_type<float>(_3585);
        out.gl_Position.z = _10107;
    }
    float _3591 = _3551 * 6.283185482025146484375;
    float _3593 = cos(_3591);
    float _3595 = _3579 * 6.283185482025146484375;
    float _3597 = sin(_3595);
    if (_3545)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3599 = -_2253;
    float _3601 = _3599 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3603 = -_2275;
    float _3605 = _3603 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3607 = -_2289;
    float _3609 = _3607 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3611 = in.m_77.x;
    float _3613 = in.m_77.y;
    float _3615 = in.m_77.z;
    float _3617 = _3601 * _3601;
    float _3619 = _3579 * 6.283185482025146484375;
    float _3621 = cos(_3619);
    float _3623 = _3083 * _3539;
    float _3625 = _3557 * _3589;
    float _3627 = fma(_3605, _3605, _3617);
    float _3629 = _3577 * _3593;
    float _3631 = _672 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3633 = _3577 * _3589;
    float _3635 = fma(_3609, _3609, _3627);
    float _3637 = fma(_3597, _3629, _3625);
    float _3639 = fma(_3597, _3625, _3629);
    float _3641 = rsqrt(_3635);
    float _3643 = _3557 * _3593;
    float _3645 = _3623 * _3631;
    float _3647 = _3589 * _3621;
    float _3649 = _670 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3651 = _3577 * _3621;
    float _3653 = _3593 * _3621;
    float _3655 = _3557 * _3621;
    float _3657 = _3117 * _3623;
    float _3659 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3611);
    float _3661 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3613);
    float _3663 = _3623 * _3649;
    float _3665 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3615);
    float _3667 = _3659 * _3657;
    float _3669 = _3605 * _3641;
    float _3671 = _3609 * _3641;
    float _3673 = _3661 * _3645;
    float _3675 = _3665 * _3663;
    float _3677 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3679 = _3669 * _3677;
    float _3681 = in.m_79.x;
    float _3683 = in.m_79.y;
    float _3685 = in.m_79.z;
    float _3687 = _3601 * _3641;
    float _3689 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3691 = _3671 * _3689;
    float _3693 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3695 = -_3679;
    float _3697 = fma(_3671, _3693, _3695);
    bool _3699 = _3613 != 0.0;
    bool _3701 = isnan(_3613);
    bool _3703 = _3699 || _3701;
    bool _3705 = isnan(0.0);
    bool _3707 = _3703 || _3705;
    float _3709 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3711 = _3687 * _3709;
    float _3713 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3715 = -_3691;
    float _3717 = fma(_3687, _3713, _3715);
    float _3719 = _3697 * _3697;
    bool _3721 = _3611 == 0.0;
    bool _3723 = !_3707;
    bool _3725 = _3721 && _3723;
    float _3727 = -_3633;
    float _3729 = fma(_3597, _3643, _3727);
    float _3731 = -_3643;
    float _3733 = fma(_3597, _3633, _3731);
    float _3735 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3737 = -_3711;
    float _3739 = fma(_3669, _3735, _3737);
    float _3741 = fma(_3717, _3717, _3719);
    float _3743 = in.m_81.x;
    float _3745 = in.m_81.y;
    float _3747 = in.m_81.z;
    float _3749 = in.m_81.w;
    bool _3751 = _3615 == 0.0;
    bool _3753 = _3751 && _3725;
    float _3755 = -_3673;
    float _3757 = _3597 * _3755;
    float _3759 = fma(_3739, _3739, _3741);
    float _3761 = _3651 * _3673;
    float _3763 = _3655 * _3673;
    float _3765 = fma(_3653, _3667, _3757);
    float _3767 = rsqrt(_3759);
    float _3769 = fma(_3637, _3667, _3761);
    float _3771 = fma(_3729, _3667, _3763);
    float _3773 = fma(_3647, _3675, _3765);
    float _3775 = fma(_3733, _3675, _3769);
    float _3777 = _3667;
    float _3779 = _3741;
    float _3781 = _3763;
    float _3783 = _3639;
    if (_3753)
    {
        _2427 = _3681;
    }
    float _3785 = _2427;
    float _3787 = _3785;
    if (_3753)
    {
        _2429 = _3685;
    }
    float _3789 = _2429;
    float _3791 = _3789;
    if (_3753)
    {
        _3491 = _3683;
    }
    float _3793 = _3491;
    float _3795 = _3793;
    if (_3753)
    {
        _3777 = _3785;
    }
    float _3797 = _3777;
    float _3799 = _3797;
    if (!_3753)
    {
        _3787 = _3681;
    }
    float _3801 = _3787;
    float _3803 = _3717 * _3767;
    if (_3753)
    {
        _3779 = _3789;
    }
    float _3805 = _3779;
    float _3807 = _3697 * _3767;
    float _3809 = _3805;
    if (_3753)
    {
        _3781 = _3793;
    }
    float _3811 = _3781;
    float _3813 = _3739 * _3767;
    float _3815 = _3811;
    if (!_3753)
    {
        _3791 = _3685;
    }
    float _3817 = _3791;
    float _3819 = _3671 * _3807;
    if (!_3753)
    {
        _3795 = _3683;
    }
    float _3821 = _3795;
    float _3823 = _3747 * _3801;
    float _3825 = _3687 * _3803;
    if (!_3753)
    {
        float _3827 = fma(_3615, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3817);
        _3809 = _3827;
    }
    float _3829 = _3809;
    float _3831 = -_3819;
    float _3833 = fma(_3687, _3813, _3831);
    float _3835 = -_3823;
    float _3837 = fma(_3743, _3817, _3835);
    float _3839 = _3745 * _3817;
    float _3841 = _3743 * _3821;
    float _3843 = -_3825;
    float _3845 = fma(_3669, _3807, _3843);
    float _3847 = _3829;
    if (!_3753)
    {
        float _3849 = fma(_3611, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3801);
        _3799 = _3849;
    }
    float _3851 = _3799;
    float _3853 = -_3839;
    float _3855 = fma(_3747, _3821, _3853);
    float _3857 = fma(_3639, _3675, _3771);
    float _3859 = -_3841;
    float _3861 = fma(_3745, _3801, _3859);
    float _3863 = _3833 * _3775;
    float _3865 = _3845 * _3775;
    if (!_3753)
    {
        float _3867 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3821);
        _3815 = _3867;
    }
    float _3869 = _3815;
    float _3871 = _3837 * _3749;
    float _3873 = _3855 * _3749;
    float _3875 = _3669 * _3813;
    float _3877 = _3861 * _3749;
    float _3879 = fma(_3803, _3773, _3863);
    float _3881 = fma(_3813, _3773, _3865);
    float _3883 = -_3875;
    float _3885 = fma(_3671, _3803, _3883);
    float _3887 = _3637 * _3833;
    float _3889 = fma(_3669, _3857, _3879);
    float _3891 = fma(_3671, _3857, _3881);
    float _3893 = _3637 * _3885;
    float _3895 = _3637 * _3845;
    float _3897 = _2275 + _3889;
    float _3899 = _2289 + _3891;
    float _3901 = _3651 * _3833;
    float _3903 = _3651 * _3885;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3907 = _3897 + _3905;
    float _3909 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3911 = _3899 + _3909;
    float _3913 = _3651 * _3845;
    float _3915 = _3733 * _3885;
    float _3917 = _3907 * _3907;
    float _3919 = _3911 * _3911;
    float _3921 = _3733 * _3833;
    float _3923 = _3733 * _3845;
    float _3925 = _3885 * _3775;
    float _3927 = _3917 + _3919;
    float _3929 = fma(_3653, _3803, _3887);
    float _3931 = fma(_3653, _3807, _3893);
    float _3933 = fma(_3653, _3813, _3895);
    float _3935 = -_3597;
    float _3937 = fma(_3935, _3803, _3901);
    float _3939 = sqrt(_3927);
    float _3941 = -_3597;
    float _3943 = fma(_3941, _3807, _3903);
    float _3945 = -_3597;
    float _3947 = fma(_3945, _3813, _3913);
    float _3949 = fma(_3647, _3803, _3921);
    float _3951 = fma(_3647, _3813, _3923);
    float _3953 = fma(_3647, _3807, _3915);
    float _3955 = fma(_3807, _3773, _3925);
    float _3957 = fma(_3655, _3669, _3937);
    float _3959 = fma(_3655, _3687, _3943);
    float _3961 = fma(_3655, _3671, _3947);
    float _3963 = fma(_3729, _3669, _3929);
    float _3965 = fma(_3729, _3687, _3931);
    float _3967 = fma(_3687, _3857, _3955);
    float _3969 = fma(_3729, _3671, _3933);
    float _3971 = _3957 * _3745;
    float _3973 = _3959 * _3745;
    bool _3975 = _3939 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3977 = _3961 * _3745;
    float _3979 = _3959 * _3869;
    float _3981 = _3871 * _3959;
    float _3983 = _2253 + _3967;
    float _3985 = fma(_3639, _3687, _3953);
    float _3987 = _3957 * _3869;
    float _3989 = fma(_3639, _3669, _3949);
    float _3991 = fma(_3639, _3671, _3951);
    float _3993 = _3961 * _3869;
    float _3995 = _3871 * _3957;
    float _3997 = _3871 * _3961;
    float _3999 = _3917;
    float _4001 = _3919;
    float _4003 = _3897;
    float _4005 = _3899;
    if (!_3975)
    {
        _3783 = _3983;
    }
    float _4007 = _3783;
    bool _4009 = !_3975;
    float _4011 = _4007;
    if (!_4009)
    {
        float _4013 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4015 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _4017 = _3939 + _4015;
        float _4019 = _3983 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4021 = rsqrt(_3927);
        float _4023 = _4017 * _4013;
        float _4025 = _4023 * 0.15915493667125701904296875;
        float _4027 = _4025 * 6.283185482025146484375;
        float _4029 = sin(_4027);
        float _4031 = _4025 * 6.283185482025146484375;
        float _4033 = cos(_4031);
        float _4035 = fma(_4029, _4019, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _4037 = _4021 * _4035;
        float _4039 = _4033 + (-1.0);
        float _4041 = fma(_3907, _4037, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _4043 = fma(_3911, _4037, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _4045 = _4039 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _4047 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _4049 = _4041 + _4047;
        float _4051 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _4053 = _4043 + _4051;
        float _4055 = fma(_3983, _4033, _4045);
        float _4057 = _4049 * _4049;
        float _4059 = _4053 * _4053;
        _4011 = _4055;
        _3999 = _4057;
        _4001 = _4059;
        _4003 = _4041;
        _4005 = _4043;
    }
    float _4061 = _4011;
    float _4063 = _3999;
    float _4065 = _4001;
    float _4067 = _4003;
    float _4069 = _4005;
    float _4071 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _4073 = _4061 + _4071;
    float _4075 = fma(_3963, _3851, _3987);
    float _4077 = fma(_3965, _3851, _3979);
    float _4079 = fma(_3969, _3851, _3993);
    float _4081 = fma(_4073, _4073, _4063);
    float _4083 = fma(_3963, _3743, _3971);
    float _4085 = fma(_3965, _3743, _3973);
    float _4087 = fma(_3873, _3963, _3995);
    float _4089 = _4081 + _4065;
    float _4091 = fma(_3873, _3965, _3981);
    float _4093 = fma(_3969, _3743, _3977);
    float _4095 = fma(_3873, _3969, _3997);
    float _4097 = fma(_3989, _3747, _4083);
    float _4099 = fma(_3985, _3747, _4085);
    float _4101 = sqrt(_4089);
    float _4103 = fma(_3877, _3989, _4087);
    float _4105 = fma(_3985, _3829, _4077);
    float _4107 = fma(_3877, _3985, _4091);
    float _4109 = fma(_3991, _3747, _4093);
    float _4111 = fma(_3989, _3829, _4075);
    float _4113 = fma(_3877, _3991, _4095);
    float _4115 = fma(_3991, _3829, _4079);
    out.m_83.x = _4097;
    out.m_83.y = _4099;
    out.m_83.z = _4109;
    out.m_85.x = _4103;
    out.m_85.y = _4107;
    out.m_85.z = _4113;
    bool _4117 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _4119 = isnan(_4101);
    bool _4121 = _4117 || _4119;
    bool _4123 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _4125 = _4121 || _4123;
    out.m_87.x = _4111;
    out.m_87.y = _4105;
    out.m_87.z = _4115;
    if (!_4125)
    {
        _3847 = 1.0;
    }
    float _4127 = _3847;
    bool _4129 = !_4125;
    float _4131 = _4127;
    if (!_4129)
    {
        bool _4133 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _4135 = isnan(_4101);
        bool _4137 = _4133 || _4135;
        bool _4139 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _4141 = _4137 || _4139;
        if (!_4141)
        {
            float _4143 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4145 = _4101 + _4143;
            float _4147 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _4149 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _4147;
            float _4151 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _4153 = _4151 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _4155 = 1.0 / _4149;
            float _4157 = _4145 * _4155;
            float _4159 = fma(_4157, _4153, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _4131 = _4159;
            _4161 = true;
        }
        else
        {
            bool _4163 = _4101 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4165 = isnan(_4101);
            bool _4167 = _4163 || _4165;
            bool _4169 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4171 = _4167 || _4169;
            if (!_4171)
            {
                float _4173 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4175 = _4101 + _4173;
                float _4177 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4179 = _4177 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4181 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4183 = _4181 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4185 = 1.0 / _4179;
                float _4187 = _4175 * _4185;
                float _4189 = fma(_4187, _4183, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _4131 = _4189;
                _4161 = true;
            }
            else
            {
                _4131 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _4161 = false;
    float _4191 = _4131;
    float _4193 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4195 = _4067 + _4193;
    float _4197 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4199 = _4061 + _4197;
    float _4201 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4203 = _4069 + _4201;
    bool _4205 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4207 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4209 = _4205 || _4207;
    bool _4211 = isnan(0.5);
    bool _4213 = _4209 || _4211;
    float _4215 = fma(_4195, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4217 = fma(_4199, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4219 = fma(_4203, _4191, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4221 = -_3137;
    float _4223 = _4221 + _4215;
    float _4225 = -_3135;
    float _4227 = _4225 + _4217;
    float _4229 = -_3183;
    float _4231 = _4229 + _4219;
    float _4233 = _4227;
    float _4235 = _4223;
    float _4237 = _4231;
    if (!_4213)
    {
        float _4239 = _3507 * _3507;
        float _4241 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4243 = -_2289;
        float _4245 = _4243 + _4219;
        float _4247 = -_2275;
        float _4249 = _4247 + _4215;
        float _4251 = fma(_3515, _3515, _4239);
        float _4253 = fma(_3523, _3523, _4251);
        float _4255 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4257 = sqrt(_4253);
        float _4259 = 1.0 / _3623;
        float _4261 = _4255 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4263 = precise::min(_4257, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4265 = _4263 * _4241;
        float _4267 = -_2253;
        float _4269 = _4267 + _4217;
        float _4271 = _4265 * _4259;
        float _4273 = _4261 * _4271;
        float _4275 = _4245 * _4271;
        float _4277 = fma(_4249, _4273, _3501);
        float _4279 = fma(_4269, _4273, _3495);
        float _4281 = fma(_4261, _4275, _3511);
        _4233 = _4279;
        _4235 = _4277;
        _4237 = _4281;
        _3567 = _4239;
        _3569 = _4257;
    }
    float _4283 = _4233;
    float _4285 = _4235;
    float _4287 = _4237;
    float _4289 = _3567;
    float _4291 = _3569;
    float _4293 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4295 = _4283 + _4293;
    float _4297 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4299 = _4285 + _4297;
    float _4301 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4303 = _4287 + _4301;
    float _4305 = _4295 * _4295;
    float _4307 = fma(_4299, _4299, _4305);
    float _4309 = fma(_4303, _4303, _4307);
    float _4311 = rsqrt(_4309);
    float _4313 = sqrt(_4309);
    float _4315 = _4311 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4317 = _4299 * _4315;
    float _4319 = _4303 * _4315;
    float _4321 = _4317 * _4317;
    float _4323 = _4319 * _4319;
    float _4325 = _4321 + _4323;
    float _4327 = sqrt(_4325);
    bool _4329 = _4327 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4331 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4333 = _4327 + _4331;
    float _4335 = _4311;
    float _4337 = _4333;
    float _4339 = _4289;
    float _4341 = _4295;
    float _4343 = _4291;
    float _4345 = _4315;
    if (_4329)
    {
        float _4347 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4335 = _4347;
    }
    float _4349 = _4335;
    if (_4329)
    {
        float _4351 = rsqrt(_4325);
        _3571 = _4351;
    }
    float _4353 = _3571;
    float _4355 = _4353;
    if (_4329)
    {
        float _4357 = _4333 * _4349;
        _4337 = _4357;
    }
    float _4359 = _4337;
    if (_4329)
    {
        float _4361 = _4359 * 0.15915493667125701904296875;
        _4339 = _4361;
    }
    float _4363 = _4339;
    float _4365 = _4349;
    float _4367 = _4363;
    if (_4329)
    {
        float _4369 = _4363 * 6.283185482025146484375;
        float _4371 = sin(_4369);
        _4365 = _4371;
    }
    float _4373 = _4365;
    float _4375 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4377 = precise::max(0.0, _4375);
    float _4379 = _4303;
    float _4381 = _4377;
    if (_4329)
    {
        float _4383 = _4363 * 6.283185482025146484375;
        float _4385 = cos(_4383);
        _4379 = _4385;
    }
    float _4387 = _4379;
    float _4389 = -_4315;
    float _4391 = -_4377;
    float _4393 = fma(_4295, _4389, _4391);
    if (!_4329)
    {
        _4341 = _4319;
    }
    float _4395 = _4341;
    float _4397 = _4395;
    if (_4329)
    {
        float _4399 = _4393 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4381 = _4399;
    }
    float _4401 = _4381;
    float _4403 = _4373;
    float _4405 = _4401;
    if (_4329)
    {
        float _4407 = fma(_4373, _4401, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4343 = _4407;
    }
    float _4409 = _4343;
    float _4411 = _4409;
    if (!_4329)
    {
        _4403 = _4317;
    }
    float _4413 = _4403;
    float _4415 = _4413;
    if (_4329)
    {
        float _4417 = _4387 + (-1.0);
        _4405 = _4417;
    }
    float _4419 = _4405;
    float _4421 = _4419;
    if (_4329)
    {
        float _4423 = _4353 * _4409;
        _4345 = _4423;
    }
    float _4425 = _4345;
    if (!_4329)
    {
        _4411 = _4393;
    }
    float _4427 = _4411;
    float _4429 = _4427;
    if (_4329)
    {
        float _4431 = _4419 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4367 = _4431;
    }
    float _4433 = _4367;
    if (_4329)
    {
        float _4435 = _4317 * _4425;
        _4415 = _4435;
    }
    float _4437 = _4415;
    if (!_4329)
    {
        _4355 = _4321;
    }
    float _4439 = _4355;
    float _4441 = _4439;
    if (_4329)
    {
        float _4443 = _4319 * _4425;
        _4397 = _4443;
    }
    float _4445 = _4397;
    if (_4329)
    {
        float _4447 = fma(_4393, _4387, _4433);
        _4429 = _4447;
    }
    float _4449 = _4429;
    if (_4329)
    {
        float _4451 = _4437 * _4437;
        _4441 = _4451;
    }
    float _4453 = _4441;
    if (!_4329)
    {
        _4421 = _4323;
    }
    float _4455 = _4421;
    float _4457 = _4455;
    if (_4329)
    {
        float _4459 = _4445 * _4445;
        _4457 = _4459;
    }
    float _4461 = _4457;
    float _4463 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4465 = fma(_4449, _4449, _4453);
    float _4467 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4469 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4471 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4463);
    float _4473 = _4465 + _4461;
    float _4475 = _4283 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4477 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4467);
    float _4479 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4471);
    float _4481 = rsqrt(_4473);
    float _4483 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4475);
    float _4485 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4477);
    float _4487 = _4479 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4489 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4483);
    float _4491 = _4485 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4493 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4495 = _4489 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4497 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4499 = fma(_4313, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4497);
    float _4501 = precise::clamp(_4499, 0.0, 1.0);
    float _4503 = fma(_4285, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4469);
    float _4505 = fma(_3511, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4507 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4493);
    float _4509 = fma(_3501, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4511 = -_4501;
    float _4513 = _4511 + 1.0;
    float _4515 = fma(_4287, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4503);
    float _4517 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4507);
    float _4519 = _4481 * _4437;
    float _4521 = _4481 * _4449;
    float _4523 = floor(_4509);
    float _4525 = _4515 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4527 = _4519 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4529 = _4481 * _4445;
    float _4531 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4517);
    float _4533 = -_4527;
    float _4535 = fma(_4521, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4533);
    float _4537 = abs(_4513);
    float _4539 = log2(_4537);
    float _4541 = -_4529;
    float _4543 = fma(_4541, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4535);
    float _4545 = _4491 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4547 = fma(_4543, -0.5, 0.5);
    float _4549 = fma(_4543, 0.5, 0.5);
    float _4551 = floor(_4505);
    float _4553 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4555 = -_4523;
    float _4557 = _4509 + _4555;
    float _4559 = fma(_4549, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4561 = -_4545;
    float _4563 = fma(_4561, _4553, 1.0);
    float _4565 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4567 = fma(_4549, _4559, -0.212114393711090087890625);
    float _4569 = _4539 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4571 = 1.0 / _4531;
    float _4573 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4565);
    float _4575 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4573);
    float _4577 = -_4551;
    float _4579 = _4505 + _4577;
    float _4581 = exp2(_4569);
    float _4583 = fma(_4549, _4567, 1.570728778839111328125);
    float _4585 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4575);
    float _4587 = log2(_4563);
    float _4589 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4591 = _4585 * _4571;
    float _4593 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4589);
    float _4595 = sqrt(_4547);
    float _4597 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4593);
    float _4599 = _4521 + 1.0;
    float _4601 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4597);
    float2 _11761 = float2(_4557, _4579);
    float _4603 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11761, float2(0.0), isnan(_11761)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11761, float2(0.0), isnan(_11761)), level(0.0)).x;
    float _4605 = -_4521;
    float _4607 = fma(_4581, _4599, _4605);
    float _4609 = _4587 * 0.693147182464599609375;
    float _4611 = _4601 * _4571;
    float _4613 = fma(_4591, 0.5, 0.5);
    float _4615 = fma(_4607, 0.5, 0.5);
    float _4617 = _4609 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4619 = fma(_4611, -0.5, 0.5);
    float _4621 = _4595 * 0.636619746685028076171875;
    float _4623 = -_4583;
    float _4625 = fma(_4621, _4623, 1.0);
    float3 _11802 = float3(_4613, _4619, _4617);
    float _4627 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11802, float3(0.0), isnan(_11802)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11802, float3(0.0), isnan(_11802)), level(0.0)).x;
    float3 _11813 = float3(_4613, _4619, _4617);
    float4 _4630 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11813, float3(0.0), isnan(_11813)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11813, float3(0.0), isnan(_11813)), level(0.0)).xyzw;
    float _4632 = _4630.x;
    float _4634 = _4630.y;
    float _4636 = _4630.z;
    float _4638 = _4630.w;
    float2 _11829 = float2(_4625, _4615);
    float3 _4642 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11829, float2(0.0), isnan(_11829)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11829, float2(0.0), isnan(_11829)), level(0.0)).xyz;
    float _4644 = _4642.x;
    float _4646 = _4642.y;
    float _4648 = _4642.z;
    float _4650 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4652 = _3495 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _4654 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4656 = isnan(_4313);
    bool _4658 = _4654 || _4656;
    bool _4660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4662 = _4658 || _4660;
    float _4664 = fma(_3501, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4650);
    float _4666 = fma(_3501, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4652);
    float _4668 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4664);
    float _4670 = fma(_3511, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4666);
    float _4672 = _4668 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4674 = _4670 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4676 = 1.0 / _4672;
    float _4678 = _4674 + _4672;
    float _4680 = _4678 * _4676;
    float _4682 = _4680 * 0.5;
    float _4684 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4686 = fma(_4682, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4684);
    float _4688 = 1.0 / _4686;
    float _4690 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4692 = _4688 * _4690;
    float _4694 = abs(_4692);
    float _4696 = log2(_4694);
    bool _4698 = _4692 <= 8000.0;
    bool _4700 = isnan(_4692);
    bool _4702 = _4698 || _4700;
    bool _4704 = isnan(8000.0);
    bool _4706 = _4702 || _4704;
    float _4708 = float(_4706);
    float _4710 = _4696 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4712 = _4487 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4714 = fma(_4495, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4712);
    float _4716 = exp2(_4710);
    float _4718 = _4539 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4720 = fma(_4491, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4714);
    float _4722 = fma(_4525, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4720);
    float _4724 = exp2(_4718);
    float _4726 = _4722 + _4531;
    out.gl_Position.x = _4585;
    out.gl_Position.y = _4601;
    out.gl_Position.z = _4722;
    out.gl_Position.w = _4531;
    float _4728 = _4726 * 0.5;
    float _4730 = fma(_4716, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4732 = precise::clamp(_4730, 0.0, 1.0);
    float _4734 = in.m_89.x;
    float _4736 = fma(_4732, -2.0, 3.0);
    float _4738 = _4732 * _4732;
    float _4740 = -_4724;
    float _4742 = _4740 + 1.0;
    float _4744 = _4738 * _4736;
    float _4746 = _4601;
    if (!_4662)
    {
        _4746 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4748 = _4746;
    float _4750 = -_4744;
    float _4752 = _4750 + 1.0;
    float _4754 = fma(_4752, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4744);
    float _4756 = _4708 * _4754;
    float _4758 = _4742 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_91.z = _4728;
    out.m_91.w = _4531;
    float _4760 = _4756 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4762 = -_4758;
    float _4764 = _4762 + 1.0;
    float _4766 = -_4603;
    float _4768 = _4766 + 1.0;
    float _4770 = _4768 * _4760;
    float _4772 = precise::clamp(_4770, 0.0, 1.0);
    float _4774 = -_4772;
    float _4776 = fma(_4774, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4778 = _4776 * _4734;
    float _4780 = _4758 * _4627;
    float _4782 = _4638 * _4764;
    float _4784 = _4778 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4786 = _4764;
    float _4788 = _4748;
    float _4790 = _4748;
    if (!_4662)
    {
        _4786 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4792 = _4786;
    float _4794 = _4638 * _4780;
    float _4796 = _4648 * _4780;
    out.m_93.x = _4784;
    float _4798 = fma(_4644, _4794, _4632);
    float _4800 = fma(_4646, _4794, _4634);
    float _4802 = fma(_4638, _4796, _4636);
    float _4804 = _4796;
    float _4806 = _4792;
    float _4808 = _4792;
    if (!_4662)
    {
        _4804 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4810 = _4804;
    out.m_95.x = _4798;
    out.m_95.y = _4800;
    out.m_95.z = _4802;
    out.m_95.w = _4782;
    bool _4812 = !_4662;
    float _4814 = _4810;
    float _4816 = _4810;
    if (!_4812)
    {
        bool _4818 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4820 = isnan(_4313);
        bool _4822 = _4818 || _4820;
        bool _4824 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4826 = _4822 || _4824;
        if (!_4826)
        {
            float _4828 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4830 = _4313 + _4828;
            float _4832 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4834 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4832;
            float _4836 = 1.0 / _4834;
            float _4838 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4840 = _4838 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4842 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4844 = _4842 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4846 = _4830 * _4836;
            float _4848 = precise::clamp(_4846, 0.0, 1.0);
            float _4850 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4852 = _4850 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4854 = fma(_4848, _4844, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4856 = fma(_4848, _4852, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4858 = fma(_4848, _4840, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4808 = _4858;
            _4790 = _4856;
            _4816 = _4854;
            _4860 = true;
        }
        else
        {
            bool _4862 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4864 = isnan(_4313);
            bool _4866 = _4862 || _4864;
            bool _4868 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4870 = _4866 || _4868;
            if (!_4870)
            {
                _4788 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4872 = _4788;
            _4790 = _4872;
            if (!_4870)
            {
                _4806 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4874 = _4806;
            _4808 = _4874;
            if (!_4870)
            {
                _4814 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4876 = _4814;
            bool _4878 = !_4870;
            _4816 = _4876;
            if (!_4878)
            {
                bool _4880 = _4313 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4882 = isnan(_4313);
                bool _4884 = _4880 || _4882;
                bool _4886 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4888 = _4884 || _4886;
                if (!_4888)
                {
                    float _4890 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4892 = _4313 + _4890;
                    float _4894 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4896 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4894;
                    float _4898 = 1.0 / _4896;
                    float _4900 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4902 = _4900 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4904 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4906 = _4904 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4908 = _4892 * _4898;
                    float _4910 = precise::clamp(_4908, 0.0, 1.0);
                    float _4912 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4914 = _4912 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4916 = fma(_4910, _4906, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4918 = fma(_4910, _4914, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4920 = fma(_4910, _4902, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4808 = _4920;
                    _4790 = _4918;
                    _4816 = _4916;
                    _4860 = true;
                }
                else
                {
                    _4808 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4790 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4816 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4860 = false;
    float _4922 = _4808;
    float _4924 = _4790;
    float _4926 = _4816;
    float _4928 = _4922 * 0.586610972881317138671875;
    bool _4930 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4932 = fma(_4924, 0.298911988735198974609375, _4928);
    out.m_97.x = 0.0;
    float _4934 = fma(_4926, 0.114477999508380889892578125, _4932);
    float _4936 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4938 = -_4934;
    float _4940 = _4938 + _4924;
    float _4942 = -_4934;
    float _4944 = _4942 + _4922;
    float _4946 = -_4934;
    float _4948 = _4946 + _4926;
    out.m_93.w = _4936;
    float _4950 = fma(_4940, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    float _4952 = fma(_4944, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    float _4954 = fma(_4948, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4934);
    out.m_99.x = _4950;
    out.m_99.y = _4952;
    out.m_99.z = _4954;
    if (!_4930)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4956 = -_4283;
    float _4958 = _4956 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4960 = -_4285;
    float _4962 = _4960 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4964 = -_4287;
    float _4966 = _4964 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4968 = _4958 * _4958;
    float _4970 = fma(_4962, _4962, _4968);
    float _4972 = fma(_4966, _4966, _4970);
    float _4974 = sqrt(_4972);
    float _4976 = rsqrt(_4972);
    float _4978 = -_4974;
    float _4980 = _4978 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4982 = _4980 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4984 = precise::clamp(_4982, 0.0, 1.0);
    float _4986 = _4962 * _4976;
    float _4988 = _4958 * _4976;
    float _4990 = abs(_4984);
    float _4992 = log2(_4990);
    float _4994 = _4966 * _4976;
    float _4996 = _4986 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4998 = _4105 * _4988;
    float _5000 = -_4988;
    float _5002 = -_4996;
    float _5004 = fma(_5000, (*spvDescriptorSet0.vp_c15)._m0[656].y, _5002);
    float _5006 = fma(_4111, _4986, _4998);
    float _5008 = -_4994;
    float _5010 = fma(_5008, (*spvDescriptorSet0.vp_c15)._m0[656].z, _5004);
    float _5012 = fma(_4115, _4994, _5006);
    float _5014 = precise::clamp(_5012, 0.0, 1.0);
    float _5016 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _5018 = _5010 + _5016;
    float _5020 = _4992 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _5022 = _5018 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _5024 = precise::clamp(_5022, 0.0, 1.0);
    float _5026 = exp2(_5020);
    float _5028 = _5026 * _5024;
    float _5030 = _5014 * _5028;
    float _5032 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _5034 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _5036 = _5030 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _5032;
    out.m_97.y = _5034;
    out.m_97.z = _5036;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

