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
    float4 m_69 [[user(locn0)]];
    float4 m_71 [[user(locn1)]];
    float4 m_85 [[user(locn2)]];
    float4 m_107 [[user(locn3)]];
    float4 m_115 [[user(locn4)]];
    float4 m_53 [[user(locn5)]];
    float4 m_73 [[user(locn6)]];
    float4 m_77 [[user(locn7)]];
    float4 m_87 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_79 [[user(locn11)]];
    float4 m_99 [[user(locn12)]];
    float4 m_101 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_113 [[user(locn15)]];
    float4 m_103 [[user(locn16)]];
    float4 m_109 [[user(locn17)]];
    float4 m_111 [[user(locn18)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_105 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_61 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_81 [[attribute(4)]];
    float4 m_57 [[attribute(5)]];
    float4 m_50 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_93 [[attribute(8)]];
    float4 m_91 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
    float4 m_67 [[attribute(11)]];
    float4 m_95 [[attribute(12)]];
    float4 m_75 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6634 = false;
    bool _5707 = false;
    bool _1098 = false;
    bool _774 = false;
    bool _632 = false;
    bool _478 = false;
    bool _256 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_50.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_53.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6933 = as_type<float>(_150);
        out.gl_Position.z = _6933;
    }
    if (!_138)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _154 = in.m_55.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_53.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7003 = as_type<float>(_188);
        out.gl_Position.z = _7003;
    }
    if (_180)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _190 = in.m_57.x;
    float _192 = in.m_57.y;
    float _194 = in.m_57.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
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
    float _236 = _226;
    float _254;
    if (!_234)
    {
        float _238 = in.m_65.x;
        float _240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _242 = _238 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _246 = _244 * _240;
        float _248 = floor(_246);
        float _250 = -_248;
        float _252 = _246 + _250;
        _254 = _252;
        _256 = true;
    }
    else
    {
        float _258 = float(_134);
        float _260 = 1.0 / _258;
        float _262 = _168 * _260;
        _254 = _262;
    }
    _256 = false;
    float _264 = _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _264 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _264 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = 1.0 / _280;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _288;
    bool _296 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_264);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _284;
    float _310 = _268 * _290;
    bool _312 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_264);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_264);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = _272 * _294;
    bool _342 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_264);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _354;
    float _358 = _306 * _338;
    float _360 = -_306;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = -_352;
    float _370 = _368 + 1.0;
    float _372 = _276 * _308;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = _334 * _370;
    float _384 = fma(_356, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = _352 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = _386 * _382;
    float _398 = _388 * _382;
    float _400 = _384 * _382;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = -_334;
    float _408 = _406 + 1.0;
    float _410 = fma(_366, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_394, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_404, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_410, _390, _422);
    float _436 = fma(_416, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = fma(_428, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_432, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = fma(_418, _390, _412);
    float _444 = fma(_420, _390, _424);
    float _446 = fma(_438, _358, _434);
    float _448 = fma(_436, _358, _442);
    float _450 = fma(_440, _358, _444);
    float _452 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].x, _446);
    float _454 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].y, _448);
    float _456 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].z, _450);
    bool _458 = !_292;
    float _476;
    if (!_458)
    {
        float _460 = in.m_65.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_134);
        float _482 = 1.0 / _480;
        float _484 = _168 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _486 + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_486);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _514 = isnan(_486);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    bool _528 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_486);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _494;
    float _542 = -_506;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _486 + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _522 * _544;
    float _554 = -_522;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _510;
    float _560 = _526 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = fma(_560, _490, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = -_538;
    float _570 = _568 + 1.0;
    float _572 = _564 * _558;
    float _574 = _566 * _552;
    float _576 = _506 * _570;
    float _578 = fma(_572, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = fma(_578, _576, _580);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _588 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = in.m_67.x;
    float _594 = in.m_67.y;
    float _596 = in.m_67.z;
    float _598 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _598;
    out.m_69.y = _600;
    out.m_69.z = _602;
    out.m_69.w = _604;
    float _606 = _456 * _596;
    float _608 = _454 * _594;
    float _610 = _452 * _592;
    bool _612 = !_550;
    float _630;
    if (!_612)
    {
        float _614 = in.m_65.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        float _634 = float(_134);
        float _636 = 1.0 / _634;
        float _638 = _168 * _636;
        _630 = _638;
    }
    _632 = false;
    float _640 = _630;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _644 = _640 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _650 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _652 = isnan(_640);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _666 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _668 = isnan(_640);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _678;
    bool _682 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _684 = isnan(_640);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _648;
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _702 = _640 + _700;
    bool _704 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _706 = _676 * _698;
    float _708 = -_676;
    float _710 = _708 + 1.0;
    float _712 = 1.0 / _664;
    float _714 = _680 * _694;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _720 = fma(_714, _644, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _722 = -_692;
    float _724 = _722 + 1.0;
    float _726 = _718 * _712;
    float _728 = _720 * _706;
    float _730 = _660 * _724;
    float _732 = fma(_726, _702, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _734 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[131].x, _728);
    float _736 = fma(_732, _730, _734);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _744 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[133].x, _736);
    float _746 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _746;
    out.m_71.y = _748;
    out.m_71.z = _750;
    out.m_71.w = _752;
    bool _754 = !_704;
    float _772;
    if (!_754)
    {
        float _756 = in.m_65.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_134);
        float _778 = 1.0 / _776;
        float _780 = _168 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _786 = _782 + _784;
    bool _788 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _790 = isnan(_782);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _804;
    bool _808 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _810 = isnan(_782);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -_798;
    float _822 = _820 + 1.0;
    bool _824 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _826 = isnan(_782);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = 1.0 / _802;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _818 * _822;
    float _844 = -_834;
    float _846 = _844 + 1.0;
    float _848 = 1.0 / _840;
    bool _850 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _852 = _806 * _836;
    float _854 = -_818;
    float _856 = _854 + 1.0;
    bool _858 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _860 = isnan(_782);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = fma(_852, _786, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _872 = _834 * _856;
    bool _874 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _876 = isnan(_782);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = _868 * _846;
    float _888 = -_868;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _896 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _898 = isnan(_782);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = _884 * _890;
    float _910 = -_884;
    float _912 = _910 + 1.0;
    bool _914 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _916 = isnan(_782);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = 1.0 / _894;
    float _928 = -_906;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _936 = _906 * _912;
    float _938 = _924 * _930;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _944 = -_924;
    float _946 = _944 + 1.0;
    float _948 = 1.0 / _934;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _954 = _870 * _938;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _962 = _782 + _960;
    float _964 = _952 * _848;
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[159].x, _954);
    float _968 = 1.0 / _942;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _970;
    float _974 = fma(_964, _962, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = _782 + _980;
    float _984 = _972 * _926;
    float _986 = fma(_974, _936, _966);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _990 = _782 + _988;
    float _992 = 1.0 / _958;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _998 = fma(_984, _982, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1000 = _996 * _948;
    bool _1002 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1004 = isnan(_782);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1014;
    float _1018 = 1.0 / _978;
    float _1020 = fma(_998, _908, _986);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1026 = _1016 * _968;
    float _1028 = fma(_1000, _990, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1032 = _782 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1036 = _782 + _1034;
    float _1038 = _1024 * _992;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1040;
    float _1044 = fma(_1026, _1032, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1046 = fma(_1028, _886, _1020);
    float _1048 = fma(_1038, _1036, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1050 = -_1012;
    float _1052 = _1050 + 1.0;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1056 = _782 + _1054;
    float _1058 = fma(_1044, _872, _1046);
    float _1060 = _1042 * _1018;
    float _1062 = _798 * _1052;
    float _1064 = fma(_1048, _842, _1058);
    float _1066 = fma(_1060, _1056, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1068 = fma(_1066, _1062, _1064);
    float _1070 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1068);
    out.m_73.x = _1070;
    bool _1072 = !_850;
    float _1074 = _986;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1078 = as_type<int>(_1018);
    float _1096;
    if (!_1072)
    {
        float _1080 = in.m_65.x;
        float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1084 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1088 = _1086 * _1082;
        float _1090 = floor(_1088);
        float _1092 = -_1090;
        float _1094 = _1088 + _1092;
        _1096 = _1094;
        _1098 = true;
    }
    else
    {
        float _1100 = float(_134);
        float _1102 = 1.0 / _1100;
        float _1104 = _168 * _1102;
        _1096 = _1104;
    }
    _1098 = false;
    float _1106 = _1096;
    float _1108 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1110 = int(_1108);
    float _1112 = in.m_65.y;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1116 = _1114 != 0;
    float _1118 = in.m_75.x;
    float _1120 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1122 = int(_1120);
    float _1124 = 0.0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1116)
    {
        _1124 = 1.0;
    }
    float _1128 = _1124;
    float _1130 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1132 = int(_1130);
    float _1134 = float(_1110);
    float _1136 = 0.0;
    float _1138 = _1128;
    if (_1116)
    {
        _1136 = 1.0;
    }
    float _1140 = _1136;
    float _1142 = 0.0;
    float _1144 = _1140;
    if (_1116)
    {
        _1142 = 1.0;
    }
    float _1146 = _1142;
    int _1148 = 0;
    float _1150 = _1146;
    if (_1116)
    {
        _1148 = 0;
    }
    int _1152 = _1148;
    int _1154 = _1152;
    if (_1116)
    {
        float _1156 = in.m_65.x;
        _1074 = _1156;
    }
    float _1158 = _1074;
    float _1160 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1162 = int(_1160);
    float _1164 = float(_1122);
    float _1166 = _1158;
    if (_1116)
    {
        _1126 = 0;
    }
    int _1168 = _1126;
    float _1170 = _1062;
    int _1172 = _1168;
    if (_1116)
    {
        float _1174 = in.m_65.z;
        _1170 = _1174;
    }
    float _1176 = _1170;
    int _1178 = 0;
    if (_1116)
    {
        _1178 = as_type<int>(_1112);
    }
    int _1180 = _1178;
    float _1182 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1184 = int(_1182);
    float _1186 = float(_1132);
    float _1188 = 1.0 / _1134;
    float _1190 = float(_1162);
    float _1192 = 1.0 / _1164;
    float _1194 = float(uint(_1184));
    float _1196 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1198 = int(_1196);
    float _1200 = _1188 * _168;
    float _1202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1204 = int(_1202);
    float _1206 = _1192 * _168;
    float _1208 = 1.0 / _1186;
    float _1210 = float(uint(_1198));
    float _1212 = 1.0 / _1190;
    float _1214 = float(uint(_1204));
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1218 = int(_1216);
    float _1220 = _1208 * _168;
    float _1222 = 1.0 / _1194;
    float _1224 = _1212 * _168;
    float _1226 = trunc(_1200);
    int _1228 = int(_1226);
    float _1230 = float(uint(_1218));
    float _1232 = 1.0 / _1210;
    int _1234 = as_type<int>(_1222) + (-2);
    float _1236 = trunc(_1206);
    int _1238 = int(_1236);
    float _1240 = float(uint(_1228));
    float _1242 = as_type<float>(_1234) * _1240;
    float _1244 = 1.0 / _1214;
    int _1246 = as_type<int>(_1232) + (-2);
    float _1248 = trunc(_1220);
    int _1250 = int(_1248);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = 1.0 / _1230;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1264 = _1262 != 0;
    bool _1266 = _1112 > 0.5;
    int _1268 = as_type<int>(_1244) + (-2);
    float _1270 = trunc(_1224);
    int _1272 = int(_1270);
    float _1274 = float(uint(_1250));
    int _1276 = _1180;
    bool _1278 = _1260;
    bool _1280 = _1264;
    float _1282 = _1118;
    if (!_1254)
    {
        _1076 = _1118;
    }
    float _1284 = _1076;
    float _1286 = as_type<float>(_1268) * _1274;
    int _1288 = as_type<int>(_1286);
    float _1290 = _1284;
    if (_1260)
    {
        float _1292 = -_1118;
        float _1294 = _1292 + 1.0;
        _1078 = as_type<int>(_1294);
    }
    int _1296 = _1078;
    float _1298 = trunc(_1242);
    float _1300 = precise::max(_1298, 0.0);
    uint _1303 = uint(_1300);
    int _1305 = as_type<int>(_1256) + (-2);
    float _1307 = 0.0;
    if (!_1264)
    {
        _1307 = _1118;
    }
    float _1309 = _1307;
    float _1311 = 0.0;
    float _1313 = _1309;
    if (!_1260)
    {
        _1311 = _1118;
    }
    float _1315 = _1311;
    float _1317 = _1315;
    if (_1260)
    {
        float _1319 = _1266 ? as_type<float>(_1296) : _1118;
        _1317 = _1319;
    }
    float _1321 = _1317;
    float _1323 = trunc(_1286);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    float _1329 = float(uint(_1238));
    float _1331 = float(uint(_1272));
    float _1333 = as_type<float>(_1246) * _1329;
    float _1335 = _1329;
    if (_1264)
    {
        float _1337 = -_1118;
        float _1339 = _1337 + 1.0;
        _1288 = as_type<int>(_1339);
    }
    int _1341 = _1288;
    float _1343 = as_type<float>(_1305) * _1331;
    float _1345 = trunc(_1333);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = _1341;
    float _1353 = _1343;
    if (_1264)
    {
        float _1355 = _1266 ? as_type<float>(_1341) : _1118;
        _1313 = _1355;
    }
    float _1357 = _1313;
    float _1359 = _1176;
    if (_1116)
    {
        _1351 = as_type<int>(_1176);
    }
    int _1361 = _1351;
    float _1363 = trunc(_1343);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = _1361;
    if (_1116)
    {
        _1353 = _1158;
    }
    float _1371 = _1353;
    float _1373 = _1371;
    if (_1116)
    {
        _1335 = _1371;
    }
    float _1375 = _1335;
    int _1377 = 0;
    float _1379 = _1375;
    if (_1116)
    {
        _1377 = as_type<int>(_1371);
    }
    int _1381 = _1377;
    int _1383 = _1381;
    if (!_1116)
    {
        float _1385 = in.m_65.x;
        float _1387 = _1112 * 3.1415927410125732421875;
        float _1389 = in.m_65.z;
        float _1391 = _1387 * 0.15915493667125701904296875;
        float _1393 = _1391 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = _1385 * 3.1415927410125732421875;
        float _1399 = _1397 * 0.15915493667125701904296875;
        float _1401 = _1389 * 3.1415927410125732421875;
        float _1403 = _1401 * 0.15915493667125701904296875;
        float _1405 = _1399 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = _1403 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        _1373 = _1112;
        _1144 = 1.2345600128173828125;
        _1166 = _1385;
        _1138 = 7.345489978790283203125;
        _1379 = _1389;
        _1150 = 5.839270114898681640625;
        _1154 = 1;
        _1359 = _1389;
        _1172 = 2;
        _1369 = as_type<int>(_1411);
        _1276 = as_type<int>(_1395);
        _1383 = as_type<int>(_1407);
    }
    float _1413 = _1373;
    float _1415 = _1144;
    float _1417 = _1166;
    float _1419 = _1138;
    float _1421 = _1379;
    float _1423 = _1150;
    int _1425 = _1154;
    float _1427 = _1359;
    int _1429 = _1172;
    int _1431 = _1369;
    int _1433 = _1276;
    int _1435 = _1383;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1439 = _1437 != 0;
    int _1441 = 0;
    if (_1254)
    {
        float _1443 = in.m_65.x;
        _1441 = as_type<int>(_1443);
    }
    int _1445 = _1441;
    int _1447 = ~_1184;
    int _1449 = _1447 + 1;
    float _1451 = _1413 * _1415;
    int _1453 = ~_1204;
    int _1455 = _1453 + 1;
    float _1457 = _1417 * _1419;
    int _1459 = ~_1218;
    int _1461 = _1459 + 1;
    int _1463 = _1449 * int(_1303);
    int _1465 = _1463 + _1228;
    float _1467 = floor(_1451);
    float _1469 = _1421 * _1423;
    float _1471 = _1413 * _1419;
    int _1473 = _1461 * int(_1367);
    int _1475 = _1473 + _1272;
    float _1477 = float(uint(_1465));
    float _1479 = _842;
    if (_1439)
    {
        float _1481 = in.m_65.z;
        _1479 = _1481;
    }
    float _1483 = _1479;
    int _1485 = _1455 * int(_1327);
    int _1487 = _1485 + _1250;
    int _1489 = ~_1198;
    int _1491 = _1489 + 1;
    float _1493 = floor(_1457);
    float _1495 = as_type<float>(_1234) * _1477;
    float _1497 = float(uint(_1475));
    bool _1499 = _1425 != 1;
    float _1501 = float(uint(_1487));
    float _1503 = in.m_61.w;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1507 = _1505 != 0;
    float _1509 = as_type<float>(_1305) * _1497;
    float _1511 = trunc(_1495);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = _1445;
    float _1519 = _1495;
    if (_1254)
    {
        bool _1521 = as_type<float>(_1445) > 0.5;
        _1278 = _1521;
    }
    bool _1523 = _1278;
    if (_1439)
    {
        float _1525 = -_1118;
        float _1527 = _1525 + 1.0;
        _1517 = as_type<int>(_1527);
    }
    int _1529 = _1517;
    float _1531 = as_type<float>(_1268) * _1501;
    int _1533 = _1491 * int(_1349);
    int _1535 = _1533 + _1238;
    int _1537 = ~_1218;
    int _1539 = _1537 + 1;
    float _1541 = in.m_59.w;
    float _1543 = floor(_1469);
    int _1545 = _1535;
    float _1547 = _1531;
    if (!_1439)
    {
        _1519 = _1118;
    }
    float _1549 = _1519;
    float _1551 = -_1493;
    float _1553 = _1457 + _1551;
    float _1555 = float(uint(_1535));
    float _1557 = _1549;
    if (_1254)
    {
        float _1559 = -_1118;
        float _1561 = _1559 + 1.0;
        _1545 = as_type<int>(_1561);
    }
    int _1563 = _1545;
    if (_1439)
    {
        bool _1565 = _1483 > 0.5;
        _1280 = _1565;
    }
    bool _1567 = _1280;
    int _1569 = 0;
    if (_1507)
    {
        float _1571 = -_1118;
        float _1573 = _1571 + 1.0;
        _1569 = as_type<int>(_1573);
    }
    int _1575 = _1569;
    float _1577 = float(_1218);
    float _1579 = floor(_1471);
    if (_1439)
    {
        float _1581 = _1567 ? as_type<float>(_1529) : _1118;
        _1557 = _1581;
    }
    float _1583 = _1557;
    float _1585 = -_1467;
    float _1587 = _1451 + _1585;
    float _1589 = float(_134);
    float _1591 = as_type<float>(_1246) * _1555;
    if (_1254)
    {
        float _1593 = _1523 ? as_type<float>(_1563) : _1118;
        _1290 = _1593;
    }
    float _1595 = _1290;
    float _1597 = in.m_63.w;
    float _1599 = float(_1184);
    float _1601 = trunc(_1509);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    float _1607 = float(_1228);
    float _1609 = float(_1204);
    int _1611 = ~_1204;
    int _1613 = _1611 + 1;
    float _1615 = trunc(_1531);
    float _1617 = precise::max(_1615, 0.0);
    uint _1619 = uint(_1617);
    int _1621 = int(_1303) + int(_1515);
    float _1623 = -_1579;
    float _1625 = _1471 + _1623;
    float _1627 = _1553 * _1599;
    float _1629 = float(_1272);
    float _1631 = _1609 * _1587;
    float _1633 = float(_1238);
    float _1635 = 1.0 / _1589;
    if (!_1507)
    {
        _1547 = _1118;
    }
    float _1637 = _1547;
    float _1639 = _1637;
    if (_1507)
    {
        float _1641 = _1266 ? as_type<float>(_1575) : _1118;
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = -_1543;
    float _1647 = _1469 + _1645;
    bool _1649 = _1607 >= _1599;
    bool _1651 = isnan(_1607);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(_1599);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = _1599 * _168;
    float _1663 = float(_1250);
    float _1665 = trunc(_1591);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    float _1671 = float(_1198);
    float _1673 = _1577 * _1647;
    bool _1675 = _1663 >= _1609;
    bool _1677 = isnan(_1663);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan(_1609);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    bool _1687 = _1629 >= _1577;
    bool _1689 = isnan(_1629);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(_1577);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    int _1699 = int(_1367) + int(_1605);
    float _1701 = _1661 * _1635;
    int _1703 = int(_1327) + int(_1619);
    float _1705 = _1635 * _168;
    int _1707 = ~_1184;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1659);
    int _1713 = int(_1711);
    int _1715 = ~_1204;
    int _1717 = _1715 + 1;
    float _1719 = _1609 * _1705;
    float _1721 = _1577 * _1705;
    float _1723 = _1671 * _1705;
    int _1725 = _1709 * _1621;
    int _1727 = _1725 + _1228;
    float _1729 = _1671 * _1625;
    int _1731 = _1717 * _1703;
    int _1733 = _1731 + _1250;
    float _1735 = trunc(_1627);
    int _1737 = int(_1735);
    int _1739 = _1539 * _1699;
    int _1741 = _1739 + _1272;
    bool _1743 = uint(_1727) >= uint(_1184);
    float _1745 = in.m_75.y;
    bool _1747 = uint(_1733) >= uint(_1204);
    bool _1749 = !_1743;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1755 = _1753 != 0;
    float _1757 = trunc(_1631);
    int _1759 = int(_1757);
    bool _1761 = uint(_1741) >= uint(_1218);
    bool _1763 = !_1755;
    int _1765 = _1763 ? 0 : 1;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1769 = _1767 != 0;
    int _1771 = int(_1349) + int(_1669);
    float _1773 = trunc(_1673);
    int _1775 = int(_1773);
    int _1777 = ~_1198;
    int _1779 = _1777 + 1;
    bool _1781 = !_1747;
    int _1783 = _1781 ? 0 : (-1);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1787 = _1785 != 0;
    int _1789 = _1779 * _1771;
    int _1791 = _1789 + _1238;
    int _1793 = ~_1621;
    int _1795 = _1793 + _1751;
    int _1797 = _1795 + 1;
    float _1799 = trunc(_1685);
    int _1801 = int(_1799);
    int _1803 = abs(_1765);
    bool _1805 = !_1769;
    int _1807 = _1805 ? 0 : 1;
    int _1809 = _1184 * _1797;
    int _1811 = _1809 + _1228;
    bool _1813 = _1633 >= _1671;
    bool _1815 = isnan(_1633);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(_1671);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    int _1825 = _1737 * _1803;
    int _1827 = _1825 + _1228;
    bool _1829 = !_1787;
    int _1831 = _1829 ? 0 : 1;
    float _1833 = trunc(_1697);
    int _1835 = int(_1833);
    int _1837 = ~_1703;
    int _1839 = _1837 + _1783;
    int _1841 = _1839 + 1;
    int _1843 = abs(_1807);
    bool _1845 = _1184 == 0;
    int _1847 = _1204 * _1841;
    int _1849 = _1847 + _1250;
    int _1851 = abs(_1831);
    int _1853 = _1759 * _1843;
    int _1855 = _1853 + _1250;
    bool _1857 = uint(_1791) >= uint(_1198);
    float _1859 = trunc(_1701);
    int _1861 = int(_1859);
    bool _1863 = !_1761;
    int _1865 = _1863 ? 0 : (-1);
    int _1867 = ~_1713;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    bool _1873 = !_1845;
    int _1875 = _1873 ? _1811 : (-1);
    float _1877 = trunc(_1823);
    int _1879 = int(_1877);
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1883 = _1881 != 0;
    int _1885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1887 = _1885 != 0;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1891 = _1889 != 0;
    int _1893 = _1875 * _1871;
    int _1895 = ~_1699;
    int _1897 = _1895 + _1865;
    int _1899 = _1897 + 1;
    int _1901 = _1775 * _1851;
    int _1903 = _1901 + _1272;
    bool _1905 = !_1857;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = _1184 + (-1);
    int _1911 = _1218 * _1899;
    int _1913 = _1911 + _1272;
    bool _1915 = !_1887;
    int _1917 = _1915 ? 0 : 1;
    bool _1919 = _1204 == 0;
    int _1921 = _1713 * _1909;
    int _1923 = _1921 + _1893;
    bool _1925 = !_1883;
    int _1927 = _1925 ? 0 : 1;
    int _1929 = ~_1771;
    int _1931 = _1929 + _1907;
    int _1933 = _1931 + 1;
    bool _1935 = _1218 == 0;
    int _1937 = abs(_1917);
    int _1939 = ~_1801;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    bool _1945 = !_1919;
    int _1947 = _1945 ? _1849 : (-1);
    int _1949 = abs(_1927);
    int _1951 = ~_1835;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1943 * _1947;
    bool _1959 = !_1935;
    int _1961 = _1959 ? _1913 : (-1);
    int _1963 = _1923 * _1937;
    int _1965 = _1198 * _1933;
    int _1967 = _1965 + _1238;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1971 = _1969 != 0;
    int _1973 = _1955 * _1961;
    bool _1975 = !_1891;
    int _1977 = _1975 ? 0 : 1;
    int _1979 = _1861 * _1949;
    int _1981 = _1979 + _1963;
    bool _1983 = !_1971;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = abs(_1977);
    int _1989 = abs(_1985);
    bool _1991 = _1198 == 0;
    int _1993 = _1827 * _1987;
    int _1995 = _1993 + _1981;
    int _1997 = _1204 + (-1);
    float _1999 = trunc(_1719);
    int _2001 = int(_1999);
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2009 = _2007 != 0;
    int _2011 = _1737 * _1989;
    int _2013 = _2011 + _1995;
    bool _2015 = !_1991;
    int _2017 = _2015 ? _1967 : (-1);
    int _2019 = _1801 * _1997;
    int _2021 = _2019 + _1957;
    int _2023 = ~_1879;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    float _2029 = float(uint(_2013));
    bool _2031 = !_2009;
    int _2033 = _2031 ? 0 : 1;
    int _2035 = _2027 * _2017;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2039 = _2037 != 0;
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2043 = _2041 != 0;
    float _2045 = as_type<float>(_1234) * _2029;
    int _2047 = abs(_2033);
    bool _2049 = !_2005;
    int _2051 = _2049 ? 0 : 1;
    int _2053 = _1218 + (-1);
    float _2055 = trunc(_2045);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    int _2061 = abs(_2051);
    bool _2063 = !_2039;
    int _2065 = _2063 ? 0 : 1;
    int _2067 = _1835 * _2053;
    int _2069 = _2067 + _1973;
    int _2071 = ~_1184;
    int _2073 = _2071 + 1;
    int _2075 = _2021 * _2047;
    int _2077 = abs(_2065);
    int _2079 = _1198 + (-1);
    int _2081 = _2001 * _2061;
    int _2083 = _2081 + _2075;
    bool _2085 = !_2043;
    int _2087 = _2085 ? 0 : 1;
    int _2089 = _1879 * _2079;
    int _2091 = _2089 + _2035;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2095 = _2093 != 0;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2099 = _2097 != 0;
    float _2101 = trunc(_1721);
    int _2103 = int(_2101);
    int _2105 = abs(_2087);
    int _2107 = _2073 * int(_2059);
    int _2109 = _2107 + _2013;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2113 = _2111 != 0;
    int _2115 = _1855 * _2077;
    int _2117 = _2115 + _2083;
    bool _2119 = !_2099;
    int _2121 = _2119 ? 0 : 1;
    float _2123 = float(uint(_2109));
    int _2125 = _1759 * _2105;
    int _2127 = _2125 + _2117;
    bool _2129 = !_2113;
    int _2131 = _2129 ? 0 : 1;
    float _2133 = trunc(_1729);
    int _2135 = int(_2133);
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2139 = _2137 != 0;
    float _2141 = as_type<float>(_1234) * _2123;
    int _2143 = abs(_2121);
    bool _2145 = !_2139;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = float(uint(_2127));
    int _2151 = _2069 * _2143;
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2155 = _2153 != 0;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2131);
    float _2163 = as_type<float>(_1268) * _2149;
    float _2165 = trunc(_2141);
    float _2167 = precise::max(_2165, 0.0);
    uint _2169 = uint(_2167);
    bool _2171 = !_2095;
    int _2173 = _2171 ? 0 : 1;
    bool _2175 = !_2159;
    int _2177 = _2175 ? 0 : 1;
    int _2179 = abs(_2173);
    int _2181 = abs(_2177);
    float _2183 = trunc(_2163);
    float _2185 = precise::max(_2183, 0.0);
    uint _2187 = uint(_2185);
    int _2189 = _2103 * _2179;
    int _2191 = _2189 + _2151;
    int _2193 = abs(_2147);
    int _2195 = _2091 * _2181;
    int _2197 = ~_1204;
    int _2199 = _2197 + 1;
    int _2201 = _1903 * _2161;
    int _2203 = _2201 + _2191;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_1723);
    int _2211 = int(_2209);
    int _2213 = _2135 * _2193;
    int _2215 = _2213 + _1238;
    int _2217 = int(_2059) + int(_2169);
    bool _2219 = !_2155;
    int _2221 = _2219 ? 0 : 1;
    bool _2223 = !_2207;
    int _2225 = _2223 ? 0 : 1;
    int _2227 = abs(_2221);
    int _2229 = _2199 * int(_2187);
    int _2231 = _2229 + _2127;
    int _2233 = abs(_2225);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2237 = _2235 != 0;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2241 = _2239 != 0;
    int _2243 = ~_1184;
    int _2245 = _2243 + 1;
    int _2247 = _1775 * _2233;
    int _2249 = _2247 + _2203;
    float _2251 = float(uint(_2231));
    int _2253 = _2211 * _2227;
    int _2255 = _2253 + _2195;
    bool _2257 = !_2237;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = _2245 * _2217;
    int _2263 = _2261 + _2013;
    bool _2265 = !_2241;
    int _2267 = _2265 ? 0 : 1;
    float _2269 = as_type<float>(_1268) * _2251;
    int _2271 = abs(_2259);
    float _2273 = float(uint(_2249));
    float _2275 = trunc(_2269);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    bool _2281 = uint(_2263) >= uint(_1184);
    float _2283 = as_type<float>(_1305) * _2273;
    bool _2285 = !_2281;
    int _2287 = _2285 ? 0 : (-1);
    int _2289 = abs(_2267);
    float _2291 = trunc(_2283);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2299 = _2297 != 0;
    int _2301 = _2215 * _2271;
    int _2303 = _2301 + _2255;
    int _2305 = ~_2217;
    int _2307 = _2305 + _2287;
    int _2309 = _2307 + 1;
    bool _2311 = _1184 == 0;
    int _2313 = _2135 * _2289;
    int _2315 = _2313 + _2303;
    int _2317 = ~_1218;
    int _2319 = _2317 + 1;
    int _2321 = _1184 * _2309;
    int _2323 = _2321 + _2013;
    bool _2325 = _1112 > 0.5;
    float _2327 = in.m_65.w;
    float _2329 = float(uint(_2315));
    float _2331 = -_1745;
    float _2333 = _2331 + 1.0;
    bool _2335 = !_2311;
    int _2337 = _2335 ? _2323 : (-1);
    int _2339 = as_type<int>(_2163);
    if (_2299)
    {
        float _2341 = -_1118;
        float _2343 = _2341 + 1.0;
        _2339 = as_type<int>(_2343);
    }
    int _2345 = _2339;
    int _2347 = int(_2187) + int(_2279);
    float _2349 = as_type<float>(_1246) * _2329;
    int _2351 = _2319 * int(_2295);
    int _2353 = _2351 + _2249;
    int _2355 = _2337 & 3;
    bool _2357 = _2355 != 0;
    if (_2299)
    {
        float _2359 = _2325 ? as_type<float>(_2345) : _1118;
        _1282 = _2359;
    }
    float _2361 = _1282;
    int _2363 = ~_1204;
    int _2365 = _2363 + 1;
    float _2367 = trunc(_2349);
    float _2369 = precise::max(_2367, 0.0);
    uint _2371 = uint(_2369);
    bool _2373 = uint(_2355) > 1u;
    float _2375 = float(uint(_2353));
    int _2377 = _2365 * _2347;
    int _2379 = _2377 + _2127;
    int _2381 = _2337 & 3;
    bool _2383 = _2381 != 0;
    int _2385 = ~_1198;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1305) * _2375;
    int _2391 = _2383 ? 0 : 1;
    bool _2393 = uint(_2379) >= uint(_1204);
    int _2395 = ~_2391;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = trunc(_2389);
    float _2403 = precise::max(_2401, 0.0);
    uint _2405 = uint(_2403);
    int _2407 = _2399;
    if (!_2373)
    {
        int _2409 = ~_2391;
        int _2411 = _2409 + 1;
        _2407 = _2411;
    }
    int _2413 = _2407;
    int _2415 = _2387 * int(_2371);
    int _2417 = _2415 + _2315;
    bool _2419 = !_2393;
    int _2421 = _2419 ? 0 : (-1);
    bool _2423 = _2355 != 3;
    bool _2425 = uint(_2355) >= 2u;
    int _2427 = ~_2347;
    int _2429 = _2427 + _2421;
    int _2431 = _2429 + 1;
    int _2433 = _2425 ? 0 : 1;
    float _2435 = float(uint(_2417));
    int _2437 = _1204 * _2431;
    int _2439 = _2437 + _2127;
    int _2441 = _2325 ? as_type<int>(_2333) : as_type<int>(_1745);
    bool _2443 = _2327 > 0.5;
    float _2445 = as_type<float>(_1246) * _2435;
    int _2447 = ~_1218;
    int _2449 = _2447 + 1;
    bool _2451 = _1204 == 0;
    float _2453 = trunc(_2445);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = ~_2433;
    int _2461 = _2459 + 1;
    int _2463 = _2461 + 1;
    int _2465 = _2463;
    if (_2423)
    {
        int _2467 = ~_2433;
        int _2469 = _2467 + 1;
        _2465 = _2469;
    }
    int _2471 = _2465;
    int _2473 = int(_2295) + int(_2405);
    bool _2475 = !_2451;
    int _2477 = _2475 ? _2439 : (-1);
    int _2479 = _2443 ? as_type<int>(_2333) : as_type<int>(_1745);
    int _2481 = _2449 * _2473;
    int _2483 = _2481 + _2249;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2487 = _2485 != 0;
    int _2489 = _2477 & 3;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2487;
    int _2495 = _2493 ? 0 : 1;
    bool _2497 = uint(_2489) >= 2u;
    int _2499 = _2491 ? 0 : 1;
    bool _2501 = uint(_2483) >= uint(_1218);
    int _2503 = _2497 ? 0 : 1;
    bool _2505 = _2489 != 3;
    bool _2507 = !_2501;
    int _2509 = _2507 ? 0 : (-1);
    int _2511 = ~_1198;
    int _2513 = _2511 + 1;
    bool _2515 = uint(_2489) > 1u;
    int _2517 = ~_2473;
    int _2519 = _2517 + _2509;
    int _2521 = _2519 + 1;
    int _2523 = int(_2371) + int(_2457);
    int _2525 = _1218 * _2521;
    int _2527 = _2525 + _2249;
    bool _2529 = _1218 == 0;
    int _2531 = ~_2503;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    int _2537 = _2513 * _2523;
    int _2539 = _2537 + _2315;
    int _2541 = _2535;
    if (_2505)
    {
        int _2543 = ~_2503;
        int _2545 = _2543 + 1;
        _2541 = _2545;
    }
    int _2547 = _2541;
    int _2549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2551 = _2549 != 0;
    int _2553 = ~_2499;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    bool _2559 = !_2529;
    int _2561 = _2559 ? _2527 : (-1);
    int _2563 = _2557;
    if (!_2515)
    {
        int _2565 = ~_2499;
        int _2567 = _2565 + 1;
        _2563 = _2567;
    }
    int _2569 = _2563;
    bool _2571 = uint(_2539) >= uint(_1198);
    bool _2573 = !_2551;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2561 & 3;
    bool _2579 = _2577 != 0;
    bool _2581 = !_2571;
    int _2583 = _2581 ? 0 : (-1);
    int _2585 = _2579 ? 0 : 1;
    bool _2587 = uint(_2577) >= 2u;
    bool _2589 = _2577 != 3;
    int _2591 = ~_2523;
    int _2593 = _2591 + _2583;
    int _2595 = _2593 + 1;
    int _2597 = _2587 ? 0 : 1;
    bool _2599 = uint(_2577) > 1u;
    int _2601 = _1198 * _2595;
    int _2603 = _2601 + _2315;
    bool _2605 = _1198 == 0;
    int _2607 = ~_2597;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2605;
    int _2615 = _2613 ? _2603 : (-1);
    int _2617 = _2611;
    if (_2589)
    {
        int _2619 = ~_2597;
        int _2621 = _2619 + 1;
        _2617 = _2621;
    }
    int _2623 = _2617;
    int _2625 = _2615 & 3;
    bool _2627 = _2625 != 0;
    int _2629 = ~_2585;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    int _2635 = _2633;
    if (!_2599)
    {
        int _2637 = ~_2585;
        int _2639 = _2637 + 1;
        _2635 = _2639;
    }
    int _2641 = _2635;
    bool _2643 = uint(_2625) >= 2u;
    int _2645 = _2627 ? 0 : 1;
    int _2647 = _2643 ? 0 : 1;
    bool _2649 = _2625 != 3;
    bool _2651 = uint(_2625) > 1u;
    int _2653 = ~_2647;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = ~_2645;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2667 = _2665 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2669 = _2657;
    int _2671 = _2663;
    if (_2649)
    {
        int _2673 = ~_2647;
        int _2675 = _2673 + 1;
        _2669 = _2675;
    }
    int _2677 = _2669;
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2651)
    {
        int _2683 = ~_2645;
        int _2685 = _2683 + 1;
        _2671 = _2685;
    }
    int _2687 = _2671;
    float _2689 = 1.0 / _2667;
    float _2691 = in.m_50.x;
    float _2693 = in.m_50.y;
    float _2695 = in.m_50.z;
    int _2697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2699 = _2697 != 0;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2707 = _2705 != 0;
    bool _2709 = !_2699;
    int _2711 = _2709 ? 0 : 1;
    float _2713 = _2707 ? as_type<float>(_2441) : _1745;
    float _2715 = 1.0 / _2681;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2719 = _2717 != 0;
    bool _2721 = _1427 > 0.5;
    float _2723 = _2719 ? as_type<float>(_2479) : _1745;
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2727 = _2725 != 0;
    float _2729 = 1.0 / _2703;
    int _2731 = _2721 ? as_type<int>(_2333) : as_type<int>(_1745);
    int _2733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2735 = _2733 != 0;
    float _2737 = _2727 ? as_type<float>(_2731) : _1745;
    float _2739 = _200 * _2693;
    float _2741 = _2735 ? as_type<float>(_2731) : _1745;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2745 = _2743 != 0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2749 = _2747 != 0;
    float _2751 = fma(_198, _2691, _2739);
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2755 = _2753 != 0;
    float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2761 = _206 * _2693;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2765 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2767 = _1417 * 2.0;
    float _2769 = 1.0 / _2759;
    float _2771 = _212 * _2693;
    float _2773 = fma(_204, _2691, _2761);
    float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2777 = _2775 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2779 = fma(_2765, -2.0, _2763);
    float _2781 = fma(_210, _2691, _2771);
    float _2783 = floor(_2767);
    float _2785 = fma(_202, _2695, _2751);
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2787;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2793 = _2791 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2795 = fma(_214, _2695, _2781);
    float _2797 = fma(_208, _2695, _2773);
    float _2799 = 1.0 / _2777;
    float _2801 = _2745 ? as_type<float>(_2731) : _1745;
    float _2803 = _2789 * _2729;
    float _2805 = _2749 ? as_type<float>(_2731) : _1745;
    float _2807 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2809 = _1106 + _2807;
    bool _2811 = !_2755;
    int _2813 = _2811 ? 0 : 1;
    float _2815 = _2785 + _1541;
    float _2817 = float(uint(_1903));
    float _2819 = 1.0 / _2793;
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2825;
    bool _2829 = _2783 > 0.0;
    float _2831 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2779);
    float _2833 = _2823 * _2689;
    float _2835 = _2827 * _2715;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2845 = _2783 >= 0.0;
    bool _2847 = isnan(_2783);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan(0.0);
    bool _2853 = _2849 || _2851;
    float _2855 = 1.0 / _2839;
    float _2857 = _2843 * _2769;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2859;
    int _2863 = _2853 ? 0 : 1;
    float _2865 = _2861 * _2799;
    float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2869 = _2867 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2871 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2871;
    float _2875 = _1112 * 2.0;
    int _2877 = ~_2863;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = _2869 * _2819;
    float _2885 = float(uint(_1827));
    bool _2887 = _1429 != 2;
    int _2889 = _2881;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2893 = _2769;
    float _2895 = _2819;
    float _2897 = _2805;
    if (!_2829)
    {
        int _2899 = ~_2863;
        int _2901 = _2899 + 1;
        _2889 = _2901;
    }
    int _2903 = _2889;
    float _2905 = _2873 * _2855;
    float _2907 = floor(_2875);
    float _2909 = as_type<float>(_1234) * _2885;
    if (!_1499)
    {
        _2891 = _1112;
    }
    float _2911 = _2891;
    float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2915 = _1106 + _2913;
    float _2917 = _2911;
    if (!_1499)
    {
        _2893 = _1112;
    }
    float _2919 = _2893;
    float _2921 = _2919;
    if (!_1499)
    {
        _2895 = _1427;
    }
    float _2923 = _2895;
    float _2925 = fma(_2803, _2915, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2927 = trunc(_2909);
    float _2929 = precise::max(_2927, 0.0);
    uint _2931 = uint(_2929);
    float _2933 = 0.0;
    float _2935 = _2923;
    if (!_1499)
    {
        _2933 = _1427;
    }
    float _2937 = _2933;
    float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2941 = _1106 + _2939;
    bool _2943 = !_1499;
    float _2945 = _2943 ? as_type<float>(_1431) : as_type<float>(_1433);
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2949 = _1106 + _2947;
    bool _2951 = !_1499;
    float _2953 = _2951 ? as_type<float>(_1433) : as_type<float>(_1435);
    float _2955 = fma(_2857, _2941, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2957 = _2937;
    if (_1499)
    {
        _2917 = _1417;
    }
    float _2959 = _2917;
    float _2961 = fma(_2883, _2949, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1499)
    {
        _2921 = _1417;
    }
    float _2963 = _2921;
    if (_1499)
    {
        _2935 = _1112;
    }
    float _2965 = _2935;
    if (_1499)
    {
        _2957 = _1112;
    }
    float _2967 = _2957;
    bool _2969 = _2907 > 0.0;
    bool _2971 = _2907 >= 0.0;
    bool _2973 = isnan(_2907);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan(0.0);
    bool _2979 = _2975 || _2977;
    float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2983 = _1106 + _2981;
    int _2985 = ~_1184;
    int _2987 = _2985 + 1;
    float _2989 = float(uint(_1855));
    float _2991 = fma(_2833, _2983, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2993 = fma(_2835, _2809, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2997 = _1106 + _2995;
    int _2999 = _2987 * int(_2931);
    int _3001 = _2999 + _1827;
    float _3003 = as_type<float>(_1268) * _2989;
    bool _3005 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3007 = isnan(_1106);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3013 = _3009 || _3011;
    float _3015 = float(_3013);
    float _3017 = fma(_2905, _2997, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3019 = float(uint(_2215));
    float _3021 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3023 = _1106 + _3021;
    float _3025 = float(uint(_3001));
    float _3027 = _2797 + _1503;
    float _3029 = trunc(_3003);
    float _3031 = precise::max(_3029, 0.0);
    uint _3033 = uint(_3031);
    bool _3035 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3037 = isnan(_1106);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3043 = _3039 || _3041;
    float _3045 = float(_3043);
    float _3047 = -_3015;
    float _3049 = _3047 + 1.0;
    float _3051 = as_type<float>(_1234) * _3025;
    bool _3053 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3055 = isnan(_1106);
    bool _3057 = _3053 || _3055;
    bool _3059 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3061 = _3057 || _3059;
    float _3063 = float(_3061);
    float _3065 = as_type<float>(_1246) * _3019;
    float _3067 = -_3045;
    float _3069 = _3067 + 1.0;
    bool _3071 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3073 = isnan(_1106);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3079 = _3075 || _3077;
    float _3081 = float(_3079);
    float _3083 = fma(_2865, _3023, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3085 = -_3063;
    float _3087 = _3085 + 1.0;
    float _3089 = _3063 * _3069;
    bool _3091 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3093 = isnan(_1106);
    bool _3095 = _3091 || _3093;
    bool _3097 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3099 = _3095 || _3097;
    float _3101 = float(_3099);
    float _3103 = trunc(_3065);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    float _3109 = _3015 * _3087;
    float _3111 = as_type<float>(_1305) * _2817;
    bool _3113 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3115 = isnan(_1106);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = -_3101;
    float _3127 = _3125 + 1.0;
    int _3129 = _1613 * int(_3033);
    int _3131 = _3129 + _1855;
    float _3133 = _3101 * _3049;
    bool _3135 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3137 = isnan(_1106);
    bool _3139 = _3135 || _3137;
    bool _3141 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3143 = _3139 || _3141;
    float _3145 = float(_3143);
    float _3147 = trunc(_3111);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = _3081 * _3127;
    float _3155 = float(uint(_3131));
    float _3157 = -_3081;
    float _3159 = _3157 + 1.0;
    int _3161 = ~_1218;
    int _3163 = _3161 + 1;
    bool _3165 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3167 = isnan(_1106);
    bool _3169 = _3165 || _3167;
    bool _3171 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3173 = _3169 || _3171;
    float _3175 = float(_3173);
    float _3177 = as_type<float>(_1268) * _3155;
    float _3179 = -_3123;
    float _3181 = _3179 + 1.0;
    int _3183 = ~_1198;
    int _3185 = _3183 + 1;
    float _3187 = trunc(_3051);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    float _3193 = _3145 * _3159;
    float _3195 = _3175 * _3181;
    float _3197 = -_3145;
    float _3199 = _3197 + 1.0;
    int _3201 = _3185 * int(_3107);
    int _3203 = _3201 + _2215;
    float _3205 = -_3175;
    float _3207 = _3205 + 1.0;
    int _3209 = _3163 * int(_3151);
    int _3211 = _3209 + _1903;
    float _3213 = _2925 * _3195;
    float _3215 = trunc(_3177);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    float _3221 = _3123 * _3199;
    float _3223 = _2979 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3225 = fma(_3207, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3213);
    float _3227 = float(uint(_3211));
    float _3229 = _2795 + _1597;
    int _3231 = ~_1184;
    int _3233 = _3231 + 1;
    float _3235 = fma(_2991, _3221, _3225);
    float _3237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3239 = _2815 + _3237;
    float _3241 = as_type<float>(_1305) * _3227;
    float _3243 = float(uint(_3203));
    float _3245 = fma(_2993, _3193, _3235);
    int _3247 = ~_1204;
    int _3249 = _3247 + 1;
    float _3251 = trunc(_3241);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    int _3257 = ~as_type<int>(_3223);
    int _3259 = _3257 + 1;
    int _3261 = _3259 + 1;
    float _3263 = as_type<float>(_1246) * _3243;
    int _3265 = int(_2931) + int(_3191);
    float _3267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3269 = _3027 + _3267;
    int _3271 = int(_3033) + int(_3219);
    float _3273 = fma(_2955, _3153, _3245);
    int _3275 = _3261;
    float _3277 = _3223;
    float _3279 = _3221;
    if (!_2969)
    {
        int _3281 = ~as_type<int>(_3223);
        int _3283 = _3281 + 1;
        _3275 = _3283;
    }
    int _3285 = _3275;
    float _3287 = trunc(_3263);
    float _3289 = precise::max(_3287, 0.0);
    uint _3291 = uint(_3289);
    int _3293 = _3233 * _3265;
    int _3295 = _3293 + _1827;
    int _3297 = ~_1218;
    int _3299 = _3297 + 1;
    float _3301 = fma(_3083, _3133, _3273);
    float _3303 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3305 = uint(_3295) >= uint(_1184);
    int _3307 = _3249 * _3271;
    int _3309 = _3307 + _1855;
    float _3311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3313 = int(_3151) + int(_3255);
    float _3315 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3317 = !_3305;
    int _3319 = _3317 ? 0 : (-1);
    float _3321 = _1427 * 2.0;
    bool _3323 = uint(_3309) >= uint(_1204);
    float _3325 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3327 = -_3315;
    float _3329 = fma(_3303, 2.0, _3327);
    int _3331 = int(_3107) + int(_3291);
    int _3333 = _3299 * _3313;
    int _3335 = _3333 + _1903;
    int _3337 = ~_1198;
    int _3339 = _3337 + 1;
    float _3341 = floor(_3321);
    bool _3343 = !_3323;
    int _3345 = _3343 ? 0 : (-1);
    float _3347 = -_168;
    float _3349 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3329);
    bool _3351 = uint(_3335) >= uint(_1218);
    float _3353 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3325);
    float _3355 = _3311 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3359 = _3229 + _3357;
    bool _3361 = !_3351;
    int _3363 = _3361 ? 0 : (-1);
    float _3365 = fma(_3355, _1321, -0.5);
    int _3367 = _3339 * _3331;
    int _3369 = _3367 + _2215;
    float _3371 = fma(_3359, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3353);
    bool _3373 = uint(_3369) >= uint(_1198);
    float _3375 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3381 = !_3373;
    int _3383 = _3381 ? 0 : (-1);
    float _3385 = fma(as_type<float>(_1435), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3375);
    bool _3387 = _3371 >= 0.0;
    float _3389 = as_type<float>(_1435) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3391 = fma(as_type<float>(_1433), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3377);
    float _3393 = as_type<float>(_1433) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3395 = _1112 + _1417;
    float _3397 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3385);
    float _3399 = fma(_3393, -2.0, _3379);
    float _3401 = _3395 + (-1.0);
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3405 = ~_3271;
    int _3407 = _3405 + _3345;
    int _3409 = _3407 + 1;
    float _3411 = fma(_2961, _3109, _3301);
    float _3413 = fma(_3401, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3415 = _3401;
    if (_3387)
    {
        _3415 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3417 = _3415;
    float _3419 = -_3403;
    float _3421 = fma(_3389, 2.0, _3419);
    int _3423 = ~_3265;
    int _3425 = _3423 + _3319;
    int _3427 = _3425 + 1;
    bool _3429 = !_2357;
    int _3431 = _3429 ? 0 : 1;
    int _3433 = as_type<int>(_3417);
    if (_3387)
    {
        float _3435 = _3417 * 5.0;
        _3433 = as_type<int>(_3435);
    }
    int _3437 = _3433;
    int _3439 = _2477 & 3;
    bool _3441 = _3439 != 0;
    float _3443 = fma(_3017, _3089, _3411);
    int _3445 = _1184 * _3427;
    int _3447 = _3445 + _1827;
    if (_3387)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11697 = as_type<float>(_3437);
        out.gl_Position.z = _11697;
    }
    bool _3449 = !_3441;
    int _3451 = _3449 ? 0 : 1;
    float _3453 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3443);
    int _3455 = _2561 & 3;
    bool _3457 = _3455 != 0;
    float _3459 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3461 = _1204 * _3409;
    int _3463 = _3461 + _1855;
    bool _3465 = !_3457;
    int _3467 = _3465 ? 0 : 1;
    float _3469 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3459);
    int _3471 = _2615 & 3;
    bool _3473 = _3471 != 0;
    out.m_77.x = _3453;
    float _3475 = _3269 * _3269;
    bool _3477 = !_3473;
    int _3479 = _3477 ? 0 : 1;
    float _3481 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3391);
    bool _3483 = _2355 != 3;
    float _3485 = fma(_3239, _3239, _3475);
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3489 = fma(_3359, _3359, _3485);
    bool _3491 = !_3483;
    int _3493 = _3491 ? 0 : (-1);
    float _3495 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3497 = _2337 >> 31;
    float _3499 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3501 = _2489 != 3;
    float _3503 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3495);
    float _3505 = _2945 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3507 = _3497 & 3;
    float _3509 = rsqrt(_3489);
    int _3511 = _2561 >> 31;
    float _3513 = fma(_3505, -2.0, _3499);
    int _3515 = _2477 >> 31;
    float _3517 = fma(_2953, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3487);
    int _3519 = _2337 + _3507;
    float _3521 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3523 = _3515 & 3;
    float _3525 = -_168;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3421);
    int _3529 = _3519 >> 2;
    float _3531 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3399);
    int _3533 = _2477 + _3523;
    float _3535 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3517);
    int _3537 = _2615 >> 31;
    float _3539 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3469);
    int _3541 = _3511 & 3;
    float _3543 = _3239 * _3509;
    int _3545 = _3533 >> 2;
    float _3547 = _3269 * _3509;
    int _3549 = _3529 << 4;
    int _3551 = _3549 + 368;
    float _3553 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3513);
    bool _3555 = !_3501;
    int _3557 = _3555 ? 0 : (-1);
    float _3559 = -_3547;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3269);
    bool _3563 = _2577 != 3;
    if (_3387)
    {
        out.m_53.x = 0.0;
    }
    if (_2887)
    {
        _3277 = _1417;
    }
    float _3565 = _3277;
    float _3567 = _3561 * _3561;
    float _3569 = _3565;
    if (_2887)
    {
        _3279 = _1112;
    }
    float _3571 = _3279;
    int _3573 = _3537 & 3;
    float _3575 = _3571;
    if (!_2887)
    {
        _3569 = _1427;
    }
    float _3577 = _3569;
    uint _3579 = uint(int(uint(_3551) >> uint(2)));
    uint _3581 = uint(int(uint(int(_3579)) >> uint(2)));
    int _3583 = int(_3579) & 3;
    float _3585 = (*spvDescriptorSet0.vp_c9)._m0[int(_3581)][_3583];
    int _3587 = int(_3579) + 1;
    uint _3589 = uint(int(uint(_3587) >> uint(2)));
    int _3591 = _3587 & 3;
    float _3593 = (*spvDescriptorSet0.vp_c9)._m0[int(_3589)][_3591];
    if (!_2887)
    {
        _3575 = _1417;
    }
    float _3595 = _3575;
    int _3597 = _2561 + _3541;
    float _3599 = _3577 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3601 = _3545 << 4;
    int _3603 = _3601 + 512;
    float _3605 = _3595 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3607 = _3341 > 0.0;
    float _3609 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3611 = int(_3609);
    bool _3613 = _3341 >= 0.0;
    bool _3615 = isnan(_3341);
    bool _3617 = _3613 || _3615;
    bool _3619 = isnan(0.0);
    bool _3621 = _3617 || _3619;
    uint _3623 = uint(int(uint(_3603) >> uint(2)));
    uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
    int _3627 = int(_3623) & 3;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[int(_3625)][_3627];
    int _3631 = int(_3623) + 1;
    uint _3633 = uint(int(uint(_3631) >> uint(2)));
    int _3635 = _3631 & 3;
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[int(_3633)][_3635];
    bool _3639 = _2625 != 3;
    float _3641 = -_3543;
    float _3643 = fma(_3641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3239);
    int _3645 = _2615 + _3573;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3649 = _3597 >> 2;
    float _3651 = fma(_3643, _3643, _3567);
    float _3653 = -_3647;
    float _3655 = fma(_3521, 2.0, _3653);
    bool _3657 = !_2311;
    int _3659 = _3657 ? _3447 : (-1);
    float _3661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3663 = int(_3661);
    bool _3665 = !_2451;
    int _3667 = _3665 ? _3463 : (-1);
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3671 = !_3639;
    int _3673 = _3671 ? 0 : (-1);
    float _3675 = _2965 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3677 = _3645 >> 2;
    int _3679 = _3649 << 4;
    int _3681 = _3679 + 656;
    int _3683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3685 = _3683 != 0;
    int _3687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3689 = _3687 != 0;
    int _3691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3693 = _3691 != 0;
    float _3695 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3697 = _3677 << 4;
    int _3699 = _3697 + 800;
    uint _3701 = uint(int(uint(_3681) >> uint(2)));
    uint _3703 = uint(int(uint(int(_3701)) >> uint(2)));
    int _3705 = int(_3701) & 3;
    float _3707 = (*spvDescriptorSet0.vp_c9)._m0[int(_3703)][_3705];
    int _3709 = int(_3701) + 1;
    uint _3711 = uint(int(uint(_3709) >> uint(2)));
    int _3713 = _3709 & 3;
    float _3715 = (*spvDescriptorSet0.vp_c9)._m0[int(_3711)][_3713];
    float _3717 = -_3669;
    float _3719 = fma(_3695, 2.0, _3717);
    float _3721 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3723 = _3621 ? 0 : 1;
    uint _3725 = uint(int(uint(_3699) >> uint(2)));
    uint _3727 = uint(int(uint(int(_3725)) >> uint(2)));
    int _3729 = int(_3725) & 3;
    float _3731 = (*spvDescriptorSet0.vp_c9)._m0[int(_3727)][_3729];
    int _3733 = int(_3725) + 1;
    uint _3735 = uint(int(uint(_3733) >> uint(2)));
    int _3737 = _3733 & 3;
    float _3739 = (*spvDescriptorSet0.vp_c9)._m0[int(_3735)][_3737];
    float _3741 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3743 = -_3721;
    float _3745 = fma(_3599, 2.0, _3743);
    float _3747 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3749 = ~_3313;
    int _3751 = _3749 + _3363;
    int _3753 = _3751 + 1;
    float _3755 = fma(_3605, -2.0, _3741);
    int _3757 = ~_3331;
    int _3759 = _3757 + _3383;
    int _3761 = _3759 + 1;
    float _3763 = fma(_3675, -2.0, _3747);
    int _3765 = _3551 + 8;
    uint _3767 = uint(int(uint(_3765) >> uint(2)));
    uint _3769 = uint(int(uint(int(_3767)) >> uint(2)));
    int _3771 = int(_3767) & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = int(_3767) + 1;
    uint _3777 = uint(int(uint(_3775) >> uint(2)));
    int _3779 = _3775 & 3;
    float _3781 = (*spvDescriptorSet0.vp_c9)._m0[int(_3777)][_3779];
    int _3783 = ~_3723;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    float _3789 = -_168;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3719);
    int _3793 = _3787;
    if (!_3607)
    {
        int _3795 = ~_3723;
        int _3797 = _3795 + 1;
        _3793 = _3797;
    }
    int _3799 = _3793;
    int _3801 = _1198 * _3761;
    int _3803 = _3801 + _2215;
    int _3805 = abs(_2569);
    float _3807 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3763);
    int _3809 = abs(_2413);
    int _3811 = _3681 + 8;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = abs(_2641);
    int _3831 = _1218 * _3753;
    int _3833 = _3831 + _1903;
    int _3835 = ~_3809;
    int _3837 = _3835 + 1;
    int _3839 = _3837 + 1;
    float _3841 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3843 = int(_3841);
    int _3845 = ~_3805;
    int _3847 = _3845 + 1;
    int _3849 = _3847 + 1;
    float _3851 = -_168;
    float _3853 = fma(_3851, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3745);
    int _3855 = abs(_3467);
    int _3857 = _3603 + 8;
    uint _3859 = uint(int(uint(_3857) >> uint(2)));
    uint _3861 = uint(int(uint(int(_3859)) >> uint(2)));
    int _3863 = int(_3859) & 3;
    float _3865 = (*spvDescriptorSet0.vp_c9)._m0[int(_3861)][_3863];
    int _3867 = int(_3859) + 1;
    uint _3869 = uint(int(uint(_3867) >> uint(2)));
    int _3871 = _3867 & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = _3839 * as_type<int>(_3593);
    int _3877 = abs(_3479);
    int _3879 = _3849 * as_type<int>(_3637);
    int _3881 = abs(_3431);
    float _3883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3885 = abs(_2687);
    float _3887 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3755);
    int _3889 = _3699 + 8;
    uint _3891 = uint(int(uint(_3889) >> uint(2)));
    uint _3893 = uint(int(uint(int(_3891)) >> uint(2)));
    int _3895 = int(_3891) & 3;
    float _3897 = (*spvDescriptorSet0.vp_c9)._m0[int(_3893)][_3895];
    int _3899 = int(_3891) + 1;
    uint _3901 = uint(int(uint(_3899) >> uint(2)));
    int _3903 = _3899 & 3;
    float _3905 = (*spvDescriptorSet0.vp_c9)._m0[int(_3901)][_3903];
    int _3907 = ~_3829;
    int _3909 = _3907 + 1;
    int _3911 = _3909 + 1;
    int _3913 = ~_3885;
    int _3915 = _3913 + 1;
    int _3917 = _3915 + 1;
    int _3919 = _3911 * as_type<int>(_3715);
    int _3921 = abs(_3451);
    int _3923 = ~_3881;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    float _3929 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3931 = ~_3877;
    int _3933 = _3931 + 1;
    int _3935 = _3933 + 1;
    int _3937 = _3917 * as_type<int>(_3739);
    int _3939 = ~_3921;
    int _3941 = _3939 + 1;
    int _3943 = _3941 + 1;
    int _3945 = _3927 * as_type<int>(_3585);
    int _3947 = _3945 + _3875;
    int _3949 = abs(_2471);
    int _3951 = _3935 * as_type<int>(_3731);
    int _3953 = _3951 + _3937;
    int _3955 = ~_3855;
    int _3957 = _3955 + 1;
    int _3959 = _3957 + 1;
    float _3961 = fma(_2967, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3929);
    int _3963 = abs(_2623);
    float _3965 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3967 = int(_3965);
    int _3969 = _3943 * as_type<int>(_3629);
    int _3971 = _3969 + _3879;
    int _3973 = abs(_3493);
    int _3975 = _3959 * as_type<int>(_3707);
    int _3977 = _3975 + _3919;
    int _3979 = ~_3949;
    int _3981 = _3979 + 1;
    int _3983 = _3981 + 1;
    float _3985 = _3883 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _3987 = ~_3963;
    int _3989 = _3987 + 1;
    int _3991 = _3989 + 1;
    float _3993 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3961);
    int _3995 = abs(_2547);
    int _3997 = _3983 * as_type<int>(_3773);
    int _3999 = _3997 + _3947;
    float _4001 = float(uint(_3663));
    int _4003 = _3991 * as_type<int>(_3819);
    int _4005 = _4003 + _3977;
    int _4007 = ~_3973;
    int _4009 = _4007 + 1;
    int _4011 = _4009 + 1;
    float _4013 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4015 = log2(_4013);
    int _4017 = abs(_2495);
    float _4019 = fma(_3985, _2801, -0.5);
    int _4021 = ~_3995;
    int _4023 = _4021 + 1;
    int _4025 = _4023 + 1;
    int _4027 = _4011 * as_type<int>(_3781);
    int _4029 = _4027 + _3999;
    int _4031 = abs(_3557);
    int _4033 = ~_4017;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = 1.0 / _4001;
    bool _4041 = !_3563;
    int _4043 = _4041 ? 0 : (-1);
    int _4045 = _4025 * as_type<int>(_3865);
    int _4047 = _4045 + _3971;
    int _4049 = ~_4031;
    int _4051 = _4049 + 1;
    int _4053 = _4051 + 1;
    int _4055 = _4029 * _4037;
    float _4057 = float(uint(_3967));
    int _4059 = abs(_2677);
    int _4061 = _4053 * as_type<int>(_3873);
    int _4063 = _4061 + _4047;
    int _4065 = abs(_4043);
    float _4067 = 1.0 / _4057;
    int _4069 = abs(_2575);
    int _4071 = _3659 * _4017;
    int _4073 = _4071 + _4055;
    float _4075 = float(uint(_3611));
    int _4077 = ~_4065;
    int _4079 = _4077 + 1;
    int _4081 = _4079 + 1;
    int _4083 = ~_4059;
    int _4085 = _4083 + 1;
    int _4087 = _4085 + 1;
    float _4089 = 1.0 / _4075;
    int _4091 = ~_4069;
    int _4093 = _4091 + 1;
    int _4095 = _4093 + 1;
    int _4097 = _4081 * as_type<int>(_3827);
    int _4099 = _4097 + _4005;
    int _4101 = abs(_3673);
    int _4103 = _4087 * as_type<int>(_3897);
    int _4105 = _4103 + _3953;
    int _4107 = as_type<int>(_4039) + (-2);
    int _4109 = _4095 * _4063;
    int _4111 = abs(_2711);
    float _4113 = float(uint(_4073));
    int _4115 = _3667 * _4069;
    int _4117 = _4115 + _4109;
    float _4119 = float(uint(_3843));
    int _4121 = abs(_2813);
    float _4123 = as_type<float>(_4107) * _4113;
    int _4125 = ~_4101;
    int _4127 = _4125 + 1;
    int _4129 = _4127 + 1;
    int _4131 = ~_4111;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    float _4137 = 1.0 / _4119;
    bool _4139 = _1218 == 0;
    int _4141 = _4129 * as_type<int>(_3905);
    int _4143 = _4141 + _4105;
    int _4145 = _4135 * _4099;
    bool _4147 = !_4139;
    int _4149 = _4147 ? _3833 : (-1);
    float _4151 = _4015 * _168;
    int _4153 = ~_4121;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    float _4159 = trunc(_4123);
    float _4161 = precise::max(_4159, 0.0);
    uint _4163 = uint(_4161);
    int _4165 = as_type<int>(_4067) + (-2);
    int _4167 = _4149 * _4111;
    int _4169 = _4167 + _4145;
    float _4171 = float(uint(_4117));
    int _4173 = _4157 * _4143;
    bool _4175 = _1198 == 0;
    float _4177 = _3359 * _3509;
    int _4179 = as_type<int>(_4089) + (-2);
    float _4181 = as_type<float>(_4165) * _4171;
    bool _4183 = !_4175;
    int _4185 = _4183 ? _3803 : (-1);
    float _4187 = exp2(_4151);
    float _4189 = float(uint(_4169));
    int _4191 = ~_3663;
    int _4193 = _4191 + 1;
    int _4195 = _4185 * _4121;
    int _4197 = _4195 + _4173;
    int _4199 = as_type<int>(_4137) + (-2);
    float _4201 = as_type<float>(_4179) * _4189;
    int _4203 = abs(_3663);
    float _4205 = trunc(_4181);
    float _4207 = precise::max(_4205, 0.0);
    uint _4209 = uint(_4207);
    float _4211 = float(uint(_4197));
    int _4213 = _4193 * int(_4163);
    int _4215 = _4213 + _4073;
    float _4217 = float(uint(_4203));
    float _4219 = -_4177;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3359);
    int _4223 = abs(_3967);
    float _4225 = as_type<float>(_4199) * _4211;
    float _4227 = float(uint(_4215));
    float _4229 = trunc(_4201);
    float _4231 = precise::max(_4229, 0.0);
    uint _4233 = uint(_4231);
    int _4235 = ~_3967;
    int _4237 = _4235 + 1;
    float _4239 = fma(_4221, _4221, _3651);
    int _4241 = ~_3611;
    int _4243 = _4241 + 1;
    float _4245 = as_type<float>(_4107) * _4227;
    float _4247 = float(uint(_4223));
    int _4249 = abs(_3611);
    float _4251 = trunc(_4225);
    float _4253 = precise::max(_4251, 0.0);
    uint _4255 = uint(_4253);
    int _4257 = _4237 * int(_4209);
    int _4259 = _4257 + _4117;
    int _4261 = ~_3843;
    int _4263 = _4261 + 1;
    float _4265 = float(uint(_4259));
    float _4267 = 1.0 / _4217;
    int _4269 = _4243 * int(_4233);
    int _4271 = _4269 + _4169;
    float _4273 = as_type<float>(_4165) * _4265;
    float _4275 = float(uint(_4249));
    float _4277 = float(uint(_4271));
    float _4279 = 1.0 / _4247;
    int _4281 = _4263 * int(_4255);
    int _4283 = _4281 + _4197;
    int _4285 = abs(_3843);
    float _4287 = as_type<float>(_4179) * _4277;
    int _4289 = abs(_4073);
    float _4291 = float(uint(_4283));
    float _4293 = 1.0 / _4275;
    float _4295 = float(uint(_4285));
    int _4297 = abs(_4117);
    float _4299 = as_type<float>(_4199) * _4291;
    int _4301 = as_type<int>(_4267) + (-2);
    float _4303 = float(uint(_4289));
    float _4305 = 1.0 / _4295;
    int _4307 = as_type<int>(_4279) + (-2);
    int _4309 = abs(_4169);
    float _4311 = as_type<float>(_4301) * _4303;
    float _4313 = float(uint(_4297));
    float _4315 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4317 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4319 = isnan(1.0);
    bool _4321 = _4317 || _4319;
    bool _4323 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4325 = _4321 || _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4329 = 1.0 + _4327;
    float _4331 = as_type<float>(_4307) * _4313;
    float _4333 = trunc(_4311);
    float _4335 = precise::max(_4333, 0.0);
    uint _4337 = uint(_4335);
    float _4339 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4315);
    int _4341 = as_type<int>(_4293) + (-2);
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4345 = float(uint(_4309));
    float _4347 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4349 = abs(_4197);
    float _4351 = 1.0 / _4329;
    float _4353 = as_type<float>(_4341) * _4345;
    int _4355 = as_type<int>(_4305) + (-2);
    float _4357 = -_4187;
    float _4359 = _4357 + 1.0;
    float _4361 = float(uint(_4349));
    float _4363 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4367 = isnan(0.0);
    bool _4369 = _4365 || _4367;
    bool _4371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4373 = _4369 || _4371;
    float _4375 = trunc(_4331);
    float _4377 = precise::max(_4375, 0.0);
    uint _4379 = uint(_4377);
    float _4381 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4343);
    float _4383 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4347);
    float _4385 = as_type<float>(_4355) * _4361;
    int _4387 = ~_4203;
    int _4389 = _4387 + 1;
    float _4391 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4363);
    float _4393 = _4373 ? _4359 : 0.0;
    float _4395 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4381);
    float _4397 = trunc(_4353);
    float _4399 = precise::max(_4397, 0.0);
    uint _4401 = uint(_4399);
    int _4403 = ~_4223;
    int _4405 = _4403 + 1;
    float _4407 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3503);
    int _4409 = _4389 * int(_4337);
    int _4411 = _4409 + _4289;
    float _4413 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4391);
    float _4415 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4339);
    float _4417 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4383);
    int _4419 = ~_4285;
    int _4421 = _4419 + 1;
    float _4423 = trunc(_4273);
    float _4425 = precise::max(_4423, 0.0);
    uint _4427 = uint(_4425);
    float _4429 = float(uint(_4411));
    float _4431 = -_3553;
    float _4433 = fma(_4407, _4019, _4431);
    float _4435 = as_type<float>(_4301) * _4429;
    float _4437 = trunc(_4245);
    float _4439 = precise::max(_4437, 0.0);
    uint _4441 = uint(_4439);
    float _4443 = trunc(_4385);
    float _4445 = precise::max(_4443, 0.0);
    uint _4447 = uint(_4445);
    float _4449 = -_168;
    float _4451 = fma(_4449, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3655);
    float _4453 = _4177;
    if (_4325)
    {
        float _4455 = _4393 * _4351;
        _170 = _4455;
    }
    float _4457 = _170;
    int _4459 = _4405 * int(_4379);
    int _4461 = _4459 + _4297;
    int _4463 = ~_4249;
    int _4465 = _4463 + 1;
    float _4467 = fma(_3535, _3365, _4451);
    int _4469 = int(_4209) + int(_4427);
    float _4471 = trunc(_4287);
    float _4473 = precise::max(_4471, 0.0);
    uint _4475 = uint(_4473);
    int _4477 = int(_4163) + int(_4441);
    float _4479 = trunc(_4299);
    float _4481 = precise::max(_4479, 0.0);
    uint _4483 = uint(_4481);
    float _4485 = float(uint(_4461));
    int _4487 = _4465 * int(_4401);
    int _4489 = _4487 + _4309;
    int _4491 = _4421 * int(_4447);
    int _4493 = _4491 + _4349;
    float _4495 = as_type<float>(_4307) * _4485;
    int _4497 = ~_3663;
    int _4499 = _4497 + 1;
    float _4501 = trunc(_4435);
    float _4503 = precise::max(_4501, 0.0);
    uint _4505 = uint(_4503);
    float _4507 = float(uint(_4489));
    int _4509 = int(_4233) + int(_4475);
    float _4511 = as_type<float>(_4341) * _4507;
    int _4513 = ~_3967;
    int _4515 = _4513 + 1;
    float _4517 = trunc(_4495);
    float _4519 = precise::max(_4517, 0.0);
    uint _4521 = uint(_4519);
    int _4523 = int(_4255) + int(_4483);
    int _4525 = _4499 * _4477;
    int _4527 = _4525 + _4073;
    float _4529 = float(uint(_4493));
    int _4531 = ~_3843;
    int _4533 = _4531 + 1;
    float _4535 = as_type<float>(_4355) * _4529;
    int _4537 = ~_3611;
    int _4539 = _4537 + 1;
    float _4541 = trunc(_4511);
    float _4543 = precise::max(_4541, 0.0);
    uint _4545 = uint(_4543);
    bool _4547 = uint(_4527) >= uint(_3663);
    int _4549 = _4515 * _4469;
    int _4551 = _4549 + _4117;
    bool _4553 = uint(_4551) >= uint(_3967);
    float _4555 = trunc(_4535);
    float _4557 = precise::max(_4555, 0.0);
    uint _4559 = uint(_4557);
    int _4561 = _4533 * _4523;
    int _4563 = _4561 + _4197;
    bool _4565 = !_4547;
    int _4567 = _4565 ? 0 : (-1);
    int _4569 = _4539 * _4509;
    int _4571 = _4569 + _4169;
    int _4573 = int(_4337) + int(_4505);
    int _4575 = int(_4379) + int(_4521);
    bool _4577 = uint(_4571) >= uint(_3611);
    float _4579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4581 = !_4553;
    int _4583 = _4581 ? 0 : (-1);
    bool _4585 = uint(_4563) >= uint(_3843);
    int _4587 = ~_4223;
    int _4589 = _4587 + 1;
    int _4591 = ~_4203;
    int _4593 = _4591 + 1;
    int _4595 = int(_4447) + int(_4559);
    int _4597 = _4593 * _4573;
    int _4599 = _4597 + _4289;
    int _4601 = ~_4285;
    int _4603 = _4601 + 1;
    float _4605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4607 = int(_4401) + int(_4545);
    int _4609 = _4589 * _4575;
    int _4611 = _4609 + _4297;
    int _4613 = ~_4249;
    int _4615 = _4613 + 1;
    int _4617 = _4603 * _4595;
    int _4619 = _4617 + _4349;
    bool _4621 = !_4577;
    int _4623 = _4621 ? 0 : (-1);
    float _4625 = _4579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4627 = uint(_4599) >= uint(_4203);
    int _4629 = _4615 * _4607;
    int _4631 = _4629 + _4309;
    bool _4633 = !_4585;
    int _4635 = _4633 ? 0 : (-1);
    float _4637 = fma(_4625, _1595, -0.5);
    bool _4639 = uint(_4611) >= uint(_4223);
    int _4641 = ~_4477;
    int _4643 = _4641 + _4567;
    int _4645 = _4643 + 1;
    float _4647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4649 = !_4639;
    int _4651 = _4649 ? 0 : (-1);
    float _4653 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4655 = ~_4469;
    int _4657 = _4655 + _4583;
    int _4659 = _4657 + 1;
    int _4661 = _3663 * _4645;
    int _4663 = _4661 + _4073;
    bool _4665 = uint(_4619) >= uint(_4285);
    float _4667 = _4605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4669 = ~_4523;
    int _4671 = _4669 + _4635;
    int _4673 = _4671 + 1;
    int _4675 = _3967 * _4659;
    int _4677 = _4675 + _4117;
    bool _4679 = !_4665;
    int _4681 = _4679 ? 0 : (-1);
    float _4683 = fma(_4667, _2713, -0.5);
    bool _4685 = _3967 == 0;
    int _4687 = _3843 * _4673;
    int _4689 = _4687 + _4197;
    int _4691 = ~_4509;
    int _4693 = _4691 + _4623;
    int _4695 = _4693 + 1;
    bool _4697 = !_4685;
    int _4699 = _4697 ? _4677 : (-1);
    float _4701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4703 = _3843 == 0;
    bool _4705 = !_4627;
    int _4707 = _4705 ? 0 : (-1);
    int _4709 = _4073 ^ _3663;
    bool _4711 = uint(_4631) >= uint(_4249);
    int _4713 = _3611 * _4695;
    int _4715 = _4713 + _4169;
    bool _4717 = !_4703;
    int _4719 = _4717 ? _4689 : (-1);
    bool _4721 = _3967 == 0;
    int _4723 = _4117 ^ _3967;
    float _4725 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4727 = uint(int(uint(_4709) >> uint(31)));
    float _4729 = _4653 * _4701;
    bool _4731 = !_4711;
    int _4733 = _4731 ? 0 : (-1);
    float _4735 = _4725 * _4647;
    bool _4737 = _3663 == 0;
    float _4739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4741 = uint(int(uint(_4723) >> uint(31)));
    int _4743 = ~_4707;
    int _4745 = _4573 + _4743;
    int _4747 = _4745 + 1;
    out.m_79.x = _4735;
    out.m_79.y = _4729;
    int _4749 = ~int(_4727);
    int _4751 = _4749 + 1;
    bool _4753 = !_4737;
    int _4755 = _4753 ? _4663 : (-1);
    float _4757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4759 = _3611 == 0;
    int _4761 = ~_4651;
    int _4763 = _4575 + _4761;
    int _4765 = _4763 + 1;
    int _4767 = ~int(_4741);
    int _4769 = _4767 + 1;
    int _4771 = _4747 ^ _4751;
    float _4773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4775 = !_4759;
    int _4777 = _4775 ? _4715 : (-1);
    int _4779 = _4765 ^ _4769;
    bool _4781 = _3663 == 0;
    int _4783 = ~_4751;
    int _4785 = _4783 + _4771;
    int _4787 = _4785 + 1;
    float _4789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4791 = ~_4769;
    int _4793 = _4791 + _4779;
    int _4795 = _4793 + 1;
    float _4797 = _4757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4799 = !_4781;
    int _4801 = _4799 ? _4787 : (-1);
    bool _4803 = _3611 == 0;
    float _4805 = fma(_4797, _1583, -0.5);
    int _4807 = _4169 ^ _3611;
    float _4809 = float(_4755);
    bool _4811 = !_4721;
    int _4813 = _4811 ? _4795 : (-1);
    float _4815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4817 = _3843 == 0;
    float _4819 = fma(_4625, _4809, _3349);
    int _4821 = _4197 ^ _3843;
    float _4823 = _4739 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4825 = float(_4777);
    float _4827 = fma(_4415, _4637, _4819);
    uint _4829 = uint(int(uint(_4821) >> uint(31)));
    float _4831 = fma(_4823, _1643, -0.5);
    int _4833 = ~_4681;
    int _4835 = _4595 + _4833;
    int _4837 = _4835 + 1;
    float _4839 = fma(_4823, _4825, _3853);
    int _4841 = ~int(_4829);
    int _4843 = _4841 + 1;
    float _4845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4847 = float(_4699);
    float _4849 = fma(_4417, _4831, _4839);
    int _4851 = _4837 ^ _4843;
    uint _4853 = uint(int(uint(_4807) >> uint(31)));
    float _4855 = fma(_4797, _4847, _3791);
    float _4857 = float(_4719);
    float _4859 = _4773 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4861 = ~_4843;
    int _4863 = _4861 + _4851;
    int _4865 = _4863 + 1;
    float _4867 = fma(_3539, _4805, _4855);
    int _4869 = ~_4733;
    int _4871 = _4607 + _4869;
    int _4873 = _4871 + 1;
    float _4875 = fma(_4859, _2361, -0.5);
    int _4877 = ~int(_4853);
    int _4879 = _4877 + 1;
    float _4881 = fma(_4859, _4857, _3527);
    float _4883 = float(_4801);
    float _4885 = _4845 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4887 = !_4817;
    int _4889 = _4887 ? _4865 : (-1);
    float _4891 = fma(_3397, _4875, _4881);
    int _4893 = _4873 ^ _4879;
    float _4895 = -_2831;
    float _4897 = fma(_4667, _4883, _4895);
    float _4899 = float(_4813);
    float _4901 = _4789 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4903 = float(_4889);
    float _4905 = _4815 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4907 = ~_4879;
    int _4909 = _4907 + _4893;
    int _4911 = _4909 + 1;
    float _4913 = fma(_4901, _2723, -0.5);
    float _4915 = -_3807;
    float _4917 = fma(_4901, _4899, _4915);
    float _4919 = fma(_4885, _2741, -0.5);
    bool _4921 = !_4803;
    int _4923 = _4921 ? _4911 : (-1);
    float _4925 = -_3531;
    float _4927 = fma(_4885, _4903, _4925);
    float _4929 = fma(_4395, _4683, _4897);
    float _4931 = fma(_3993, _4913, _4917);
    float _4933 = float(_4923);
    float _4935 = fma(_3481, _4919, _4927);
    float _4937 = fma(_4905, _2737, -0.5);
    float _4939 = _4849 + 0.5;
    float _4941 = _4467 + 0.5;
    float _4943 = -_3887;
    float _4945 = fma(_4905, _4933, _4943);
    float _4947 = _4935 + 0.5;
    float _4949 = _4433 + 0.5;
    float _4951 = in.m_81.x;
    float _4953 = in.m_81.y;
    float _4955 = in.m_81.z;
    float _4957 = fma(_4413, _4937, _4945);
    float _4959 = _4827 + 0.5;
    float _4961 = _4867 + 0.5;
    float _4963 = _4929 + 0.5;
    float _4965 = _4957 + 0.5;
    float _4967 = _4931 + 0.5;
    float _4969 = _4891 + 0.5;
    bool _4971 = !_3685;
    int _4973 = _4971 ? 0 : 1;
    out.m_83.x = _4941;
    out.m_83.y = _4949;
    bool _4975 = !_3689;
    int _4977 = _4975 ? 0 : 1;
    int _4979 = abs(_4973);
    out.m_85.x = _4959;
    out.m_85.y = _4963;
    out.m_85.z = _4961;
    out.m_85.w = _4967;
    int _4981 = abs(_4977);
    bool _4983 = !_3693;
    int _4985 = _4983 ? 0 : 1;
    out.m_87.x = _4939;
    out.m_87.y = _4965;
    float _4987 = float(_4979);
    out.m_89.x = _4969;
    out.m_89.y = _4947;
    float _4989 = float(_3799);
    float _4991 = _4831;
    float _4993 = as_type<float>(_4631);
    float _4995 = as_type<float>(_4659);
    float _4997 = _4467;
    if (_3387)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4999 = -_3547;
    float _5001 = fma(_4999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3027);
    float _5003 = _4987 * _4989;
    float _5005 = float(_2903);
    float _5007 = -_3543;
    float _5009 = fma(_5007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2815);
    float _5011 = float(_4981);
    float _5013 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5015 = _5001 + _5013;
    float _5017 = _5003 * (-2.0);
    float _5019 = -_4177;
    float _5021 = fma(_5019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3229);
    float _5023 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5025 = _5009 + _5023;
    float _5027 = _5015 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5029 = _5011 * _5005;
    float _5031 = _1417 + (-0.5);
    float _5033 = fma(_5017, _4951, _4951);
    float _5035 = _1112 + _1427;
    float _5037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5039 = _5021 + _5037;
    float _5041 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5027);
    float _5043 = fma(_5031, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5033);
    float _5045 = _5035 + (-1.0);
    float _5047 = _5029 * (-2.0);
    float _5049 = fma(_5039, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5041);
    float _5051 = _1112 + (-0.5);
    float _5053 = fma(_5045, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5055 = fma(_5047, _4953, _4953);
    float _5057 = fma(_3413, _5017, _3413);
    bool _5059 = _5049 >= 0.0;
    float _5061 = fma(_5053, _5047, _5053);
    float _5063 = fma(_5051, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5055);
    float _5065 = fma(_5057, _4457, _5043);
    int _5067 = abs(_4985);
    float _5069 = sqrt(_4239);
    float _5071 = fma(_5061, _4457, _5063);
    float _5073 = _5065 * 0.15915493667125701904296875;
    float _5075 = _1417 + _1427;
    float _5077 = _5071 * 0.15915493667125701904296875;
    float _5079 = float(_3285);
    float _5081 = _5047;
    float _5083 = _5029;
    if (_5059)
    {
        _5081 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5085 = _5081;
    float _5087 = _5073 * 6.283185482025146484375;
    float _5089 = sin(_5087);
    float _5091 = float(_5067);
    int _5093 = as_type<int>(_5085);
    if (_5059)
    {
        out.m_53.x = 0.0;
    }
    if (_5059)
    {
        float _5095 = _5085 * 5.0;
        _5093 = as_type<int>(_5095);
    }
    int _5097 = _5093;
    float _5099 = _5091 * _5079;
    float _5101 = _5075 + (-1.0);
    float _5103 = _5073 * 6.283185482025146484375;
    float _5105 = cos(_5103);
    if (_5059)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14120 = as_type<float>(_5097);
        out.gl_Position.z = _14120;
    }
    float _5107 = _5099 * (-2.0);
    float _5109 = _5077 * 6.283185482025146484375;
    float _5111 = sin(_5109);
    if (_5059)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5113 = -_3027;
    float _5115 = _5113 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5117 = -_2815;
    float _5119 = _5117 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5121 = fma(_5107, _4955, _4955);
    float _5123 = -_3229;
    float _5125 = _5123 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5127 = _5115 * _5115;
    float _5129 = fma(_5101, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5131 = _1427 + (-0.5);
    float _5133 = _5077 * 6.283185482025146484375;
    float _5135 = cos(_5133);
    float _5137 = fma(_5119, _5119, _5127);
    float _5139 = fma(_5129, _5107, _5129);
    float _5141 = fma(_5131, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5121);
    float _5143 = _3509 * _5069;
    float _5145 = fma(_5125, _5125, _5137);
    float _5147 = _5089 * _5111;
    float _5149 = fma(_5139, _4457, _5141);
    float _5151 = rsqrt(_5145);
    float _5153 = _5149 * 0.15915493667125701904296875;
    float _5155 = in.m_91.x;
    float _5157 = in.m_91.y;
    float _5159 = in.m_91.z;
    float _5161 = _5105 * _5135;
    float _5163 = _5089 * _5135;
    float _5165 = _5153 * 6.283185482025146484375;
    float _5167 = sin(_5165);
    float _5169 = _5119 * _5151;
    float _5171 = _5125 * _5151;
    float _5173 = _5115 * _5151;
    float _5175 = _5153 * 6.283185482025146484375;
    float _5177 = cos(_5175);
    float _5179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5181 = _5169 * _5179;
    float _5183 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5185 = _5171 * _5183;
    float _5187 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5189 = _5173 * _5187;
    float _5191 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5193 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5195 = -_5181;
    float _5197 = fma(_5171, _5193, _5195);
    float _5199 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5201 = -_5185;
    float _5203 = fma(_5173, _5199, _5201);
    float _5205 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5207 = -_5189;
    float _5209 = fma(_5169, _5205, _5207);
    float _5211 = fma(_5167, _5161, _5147);
    float _5213 = _5197 * _5197;
    float _5215 = fma(_5167, _5147, _5161);
    float _5217 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5219 = fma(_5203, _5203, _5213);
    float _5221 = _5105 * _5111;
    float _5223 = _5143 * _5217;
    float _5225 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5227 = fma(_5209, _5209, _5219);
    float _5229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5157);
    float _5231 = _5105 * _5177;
    float _5233 = _5135 * _5177;
    float _5235 = rsqrt(_5227);
    float _5237 = _5229 * _5223;
    float _5239 = _5143 * _5191;
    float _5241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5155);
    float _5243 = _5089 * _5177;
    float _5245 = _5111 * _5177;
    float _5247 = _5143 * _5225;
    float _5249 = _5241 * _5239;
    float _5251 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5159);
    float _5253 = _5231 * _5237;
    float _5255 = -_5221;
    float _5257 = fma(_5167, _5163, _5255);
    float _5259 = -_5163;
    float _5261 = fma(_5167, _5221, _5259);
    float _5263 = _5251 * _5247;
    float _5265 = fma(_5211, _5249, _5253);
    float _5267 = _5243 * _5237;
    float _5269 = _5203 * _5235;
    float _5271 = _5197 * _5235;
    float _5273 = _5209 * _5235;
    float _5275 = -_5237;
    float _5277 = _5167 * _5275;
    float _5279 = _5173 * _5269;
    float _5281 = _5171 * _5271;
    float _5283 = fma(_5261, _5263, _5265);
    float _5285 = fma(_5233, _5249, _5277);
    float _5287 = -_5279;
    float _5289 = fma(_5169, _5271, _5287);
    float _5291 = -_5281;
    float _5293 = fma(_5173, _5273, _5291);
    float _5295 = fma(_5257, _5249, _5267);
    float _5297 = fma(_5245, _5263, _5285);
    float _5299 = _5289 * _5283;
    float _5301 = _5293 * _5283;
    float _5303 = fma(_5215, _5263, _5295);
    float _5305 = fma(_5273, _5297, _5299);
    float _5307 = fma(_5269, _5297, _5301);
    float _5309 = fma(_5171, _5303, _5305);
    float _5311 = fma(_5169, _5303, _5307);
    float _5313 = _3229 + _5309;
    float _5315 = _2815 + _5311;
    float _5317 = _5169 * _5273;
    float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5321 = _5313 + _5319;
    float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5325 = _5315 + _5323;
    float _5327 = -_5317;
    float _5329 = fma(_5171, _5269, _5327);
    float _5331 = _5321 * _5321;
    float _5333 = _5325 * _5325;
    float _5335 = _5329 * _5283;
    float _5337 = _5333 + _5331;
    float _5339 = fma(_5271, _5297, _5335);
    float _5341 = sqrt(_5337);
    float _5343 = fma(_5173, _5303, _5339);
    float _5345 = _3027 + _5343;
    bool _5347 = _5341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5349 = _5315;
    float _5351 = _5313;
    float _5353 = _5333;
    float _5355 = _5331;
    if (!_5347)
    {
        _4991 = _5345;
    }
    float _5357 = _4991;
    bool _5359 = !_5347;
    float _5361 = _5357;
    if (!_5359)
    {
        float _5363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5367 = _5341 + _5365;
        float _5369 = rsqrt(_5337);
        float _5371 = _5367 * _5363;
        float _5373 = _5345 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5375 = _5371 * 0.15915493667125701904296875;
        float _5377 = _5375 * 6.283185482025146484375;
        float _5379 = sin(_5377);
        float _5381 = _5375 * 6.283185482025146484375;
        float _5383 = cos(_5381);
        float _5385 = fma(_5379, _5373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5387 = _5369 * _5385;
        float _5389 = _5383 + (-1.0);
        float _5391 = fma(_5325, _5387, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5393 = fma(_5321, _5387, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5395 = _5389 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5399 = _5391 + _5397;
        float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5403 = _5393 + _5401;
        float _5405 = fma(_5345, _5383, _5395);
        float _5407 = _5399 * _5399;
        float _5409 = _5403 * _5403;
        _5349 = _5391;
        _5351 = _5393;
        _5361 = _5405;
        _5353 = _5407;
        _5355 = _5409;
    }
    float _5411 = _5349;
    float _5413 = _5351;
    float _5415 = _5361;
    float _5417 = _5353;
    float _5419 = _5355;
    float _5421 = fma(_5411, 6.2500002968590706586837768554688e-05, 0.5);
    float _5423 = fma(_5413, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14613 = float2(_5421, _5423);
    float3 _5427 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14613, float2(0.0), isnan(_14613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14613, float2(0.0), isnan(_14613)), level(0.0)).xyz;
    float _5429 = _5427.x;
    float _5431 = _5427.y;
    float _5433 = _5427.z;
    float _5435 = in.m_93.x;
    float _5437 = in.m_93.y;
    float _5439 = in.m_93.z;
    bool _5441 = _5157 != 0.0;
    bool _5443 = isnan(_5157);
    bool _5445 = _5441 || _5443;
    bool _5447 = isnan(0.0);
    bool _5449 = _5445 || _5447;
    float _5451 = in.m_95.x;
    float _5453 = in.m_95.y;
    float _5455 = in.m_95.z;
    float _5457 = in.m_95.w;
    bool _5459 = _5155 == 0.0;
    bool _5461 = !_5449;
    bool _5463 = _5459 && _5461;
    bool _5465 = _5159 == 0.0;
    bool _5467 = _5465 && _5463;
    float _5469 = _5435;
    if (_5467)
    {
        _5083 = _5435;
    }
    float _5471 = _5083;
    float _5473 = _5471;
    if (_5467)
    {
        _2897 = _5439;
    }
    float _5475 = _2897;
    float _5477 = _5475;
    if (_5467)
    {
        _4993 = _5437;
    }
    float _5479 = _4993;
    float _5481 = _5479;
    if (_5467)
    {
        _4995 = _5471;
    }
    float _5483 = _4995;
    float _5485 = _5483;
    if (!_5467)
    {
        _5473 = _5435;
    }
    float _5487 = _5473;
    if (_5467)
    {
        _4997 = _5475;
    }
    float _5489 = _4997;
    float _5491 = _5489;
    if (!_5467)
    {
        _5477 = _5439;
    }
    float _5493 = _5477;
    if (!_5467)
    {
        float _5495 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5487);
        _5485 = _5495;
    }
    float _5497 = _5485;
    if (_5467)
    {
        _5469 = _5479;
    }
    float _5499 = _5469;
    float _5501 = _5455 * _5487;
    float _5503 = _5499;
    if (!_5467)
    {
        _5481 = _5437;
    }
    float _5505 = _5481;
    float _5507 = _5453 * _5493;
    if (!_5467)
    {
        float _5509 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5493);
        _5491 = _5509;
    }
    float _5511 = _5491;
    float _5513 = -_5501;
    float _5515 = fma(_5451, _5493, _5513);
    float _5517 = _5231 * _5329;
    float _5519 = _5451 * _5505;
    float _5521 = -_5507;
    float _5523 = fma(_5455, _5505, _5521);
    if (!_5467)
    {
        float _5525 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5505);
        _5503 = _5525;
    }
    float _5527 = _5503;
    float _5529 = _5211 * _5293;
    float _5531 = -_5519;
    float _5533 = fma(_5453, _5487, _5531);
    float _5535 = _5211 * _5329;
    float _5537 = _5211 * _5289;
    float _5539 = _5231 * _5293;
    float _5541 = _5515 * _5457;
    float _5543 = _5523 * _5457;
    float _5545 = _5231 * _5289;
    float _5547 = _5533 * _5457;
    float _5549 = _5261 * _5293;
    float _5551 = _5261 * _5329;
    float _5553 = _5261 * _5289;
    float _5555 = fma(_5233, _5269, _5529);
    float _5557 = fma(_5233, _5271, _5535);
    float _5559 = -_5167;
    float _5561 = fma(_5559, _5271, _5517);
    float _5563 = fma(_5233, _5273, _5537);
    float _5565 = -_5167;
    float _5567 = fma(_5565, _5269, _5539);
    float _5569 = -_5167;
    float _5571 = fma(_5569, _5273, _5545);
    float _5573 = fma(_5245, _5269, _5549);
    float _5575 = fma(_5245, _5271, _5551);
    float _5577 = fma(_5245, _5273, _5553);
    float _5579 = fma(_5243, _5173, _5561);
    float _5581 = fma(_5257, _5169, _5555);
    float _5583 = fma(_5243, _5169, _5567);
    float _5585 = fma(_5243, _5171, _5571);
    float _5587 = fma(_5215, _5169, _5573);
    float _5589 = fma(_5215, _5173, _5575);
    float _5591 = fma(_5215, _5171, _5577);
    float _5593 = fma(_5257, _5173, _5557);
    float _5595 = _5579 * _5453;
    float _5597 = _5579 * _5527;
    float _5599 = fma(_5257, _5171, _5563);
    float _5601 = _5583 * _5527;
    float _5603 = _5541 * _5583;
    float _5605 = _5541 * _5579;
    float _5607 = _5585 * _5453;
    float _5609 = _5585 * _5527;
    float _5611 = _5541 * _5585;
    float _5613 = fma(_5593, _5451, _5595);
    float _5615 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5617 = _5415 + _5615;
    float _5619 = _5583 * _5453;
    float _5621 = fma(_5581, _5497, _5601);
    float _5623 = fma(_5599, _5451, _5607);
    float _5625 = fma(_5617, _5617, _5417);
    float _5627 = fma(_5581, _5451, _5619);
    float _5629 = fma(_5543, _5581, _5603);
    float _5631 = fma(_5593, _5497, _5597);
    float _5633 = _5625 + _5419;
    float _5635 = fma(_5599, _5497, _5609);
    float _5637 = fma(_5543, _5593, _5605);
    float _5639 = fma(_5543, _5599, _5611);
    float _5641 = fma(_5587, _5455, _5627);
    float _5643 = fma(_5589, _5455, _5613);
    float _5645 = sqrt(_5633);
    float _5647 = fma(_5591, _5455, _5623);
    float _5649 = fma(_5587, _5511, _5621);
    float _5651 = fma(_5547, _5587, _5629);
    float _5653 = fma(_5547, _5589, _5637);
    float _5655 = fma(_5547, _5591, _5639);
    float _5657 = fma(_5589, _5511, _5631);
    float _5659 = fma(_5591, _5511, _5635);
    out.m_97.x = _5641;
    out.m_97.y = _5643;
    out.m_97.z = _5647;
    out.m_99.x = _5651;
    out.m_99.y = _5653;
    out.m_99.z = _5655;
    out.m_101.x = _5649;
    out.m_101.y = _5657;
    out.m_101.z = _5659;
    bool _5661 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5663 = isnan(_5645);
    bool _5665 = _5661 || _5663;
    bool _5667 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5669 = _5665 || _5667;
    float _5671 = _5547;
    if (!_5669)
    {
        _5671 = 1.0;
    }
    float _5673 = _5671;
    out.m_103.x = _5429;
    out.m_103.y = _5431;
    out.m_103.z = _5433;
    bool _5675 = !_5669;
    float _5677 = _5673;
    if (!_5675)
    {
        bool _5679 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5681 = isnan(_5645);
        bool _5683 = _5679 || _5681;
        bool _5685 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5687 = _5683 || _5685;
        if (!_5687)
        {
            float _5689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5691 = _5645 + _5689;
            float _5693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5695 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5693;
            float _5697 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5699 = _5697 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5701 = 1.0 / _5695;
            float _5703 = _5691 * _5701;
            float _5705 = fma(_5703, _5699, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5677 = _5705;
            _5707 = true;
        }
        else
        {
            bool _5709 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5711 = isnan(_5645);
            bool _5713 = _5709 || _5711;
            bool _5715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5717 = _5713 || _5715;
            if (!_5717)
            {
                float _5719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5721 = _5645 + _5719;
                float _5723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5725 = _5723 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5727 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5729 = _5727 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5731 = 1.0 / _5725;
                float _5733 = _5721 * _5731;
                float _5735 = fma(_5733, _5729, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5677 = _5735;
                _5707 = true;
            }
            else
            {
                _5677 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5707 = false;
    float _5737 = _5677;
    float _5739 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5741 = _5415 + _5739;
    float _5743 = _5001 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5745 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5747 = _5411 + _5745;
    float _5749 = fma(_5741, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5751 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5743);
    float _5753 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5755 = _5413 + _5753;
    float _5757 = fma(_5747, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5759 = -_3027;
    float _5761 = _5759 + _5749;
    float _5763 = fma(_5021, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5751);
    float _5765 = fma(_5755, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5767 = -_2815;
    float _5769 = _5767 + _5757;
    float _5771 = _5761 * _5761;
    float _5773 = _5763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5775 = _5001 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5777 = -_3229;
    float _5779 = _5777 + _5765;
    float _5781 = fma(_5769, _5769, _5771);
    float _5783 = 1.0 / _5773;
    float _5785 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5775);
    float _5787 = fma(_5779, _5779, _5781);
    float _5789 = fma(_5021, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5785);
    float _5791 = sqrt(_5787);
    float _5793 = _5789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5795 = _5793 + _5773;
    float _5797 = _5795 * _5783;
    float _5799 = _5797 * 0.5;
    bool _5801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5805 = _5801 || _5803;
    bool _5807 = isnan(0.5);
    bool _5809 = _5805 || _5807;
    float _5811 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5813 = fma(_5799, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5811);
    bool _5815 = _5791 > 0.0;
    float _5817 = 1.0 / _5813;
    bool _5819 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5821 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5823 = _5819 || _5821;
    bool _5825 = isnan(0.5);
    bool _5827 = _5823 || _5825;
    float _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5831 = _5799;
    float _5833 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5835 = _5787;
    float _5837 = _5765;
    float _5839 = _5757;
    if (!_5815)
    {
        _5829 = _5757;
    }
    float _5841 = _5829;
    float _5843 = _5841;
    if (!_5815)
    {
        _5831 = _5749;
    }
    float _5845 = _5831;
    float _5847 = _5845;
    float _5849 = _5845;
    if (!_5815)
    {
        _5833 = _5765;
    }
    float _5851 = _5833;
    bool _5853 = !_5815;
    float _5855 = _5851;
    if (!_5853)
    {
        float _5857 = _230 * _230;
        float _5859 = rsqrt(_5787);
        float _5861 = fma(_226, _226, _5857);
        float _5863 = fma(_232, _232, _5861);
        float _5865 = sqrt(_5863);
        float _5867 = _5769 * _5859;
        float _5869 = _5761 * _5859;
        float _5871 = _5779 * _5859;
        bool _5873 = _5865 > 0.0;
        float _5875 = _5865;
        float _5877 = _5859;
        if (!_5873)
        {
            _5875 = _5757;
        }
        float _5879 = _5875;
        _5843 = _5879;
        if (!_5873)
        {
            _5847 = _5749;
        }
        float _5881 = _5847;
        _5849 = _5881;
        if (!_5873)
        {
            _5877 = _5765;
        }
        float _5883 = _5877;
        bool _5885 = !_5873;
        _5855 = _5883;
        if (!_5885)
        {
            float _5887 = rsqrt(_5863);
            float _5889 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5891 = _230 * _5887;
            float _5893 = _226 * _5887;
            float _5895 = _232 * _5887;
            float _5897 = _5869 * _5891;
            float _5899 = fma(_5867, _5893, _5897);
            float _5901 = _5889 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5903 = fma(_5871, _5895, _5899);
            float _5905 = _5903 * _5901;
            float _5907 = fma(_226, _5905, _5757);
            float _5909 = fma(_230, _5905, _5749);
            float _5911 = fma(_232, _5905, _5765);
            _5849 = _5909;
            _5855 = _5911;
            _5843 = _5907;
            _5835 = _5889;
        }
    }
    float _5913 = _5849;
    float _5915 = _5855;
    float _5917 = _5843;
    float _5919 = _5835;
    float _5921 = -_3547;
    float _5923 = fma(_5921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5913);
    float _5925 = -_4177;
    float _5927 = fma(_5925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5915);
    float _5929 = -_3543;
    float _5931 = fma(_5929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5917);
    float _5933 = _5919;
    float _5935 = _5931;
    float _5937 = _5927;
    if (_5809)
    {
        _5933 = 1.0;
    }
    float _5939 = _5933;
    float _5941 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5943 = _5817 * _5941;
    float _5945 = _5939;
    if (_5827)
    {
        _4453 = _5923;
    }
    float _5947 = _4453;
    float _5949 = _5947;
    if (!_5827)
    {
        float _5951 = _5015 * _5015;
        float _5953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5955 = -_3229;
        float _5957 = _5955 + _5915;
        float _5959 = -_3027;
        float _5961 = _5959 + _5913;
        float _5963 = fma(_5025, _5025, _5951);
        float _5965 = fma(_5039, _5039, _5963);
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5969 = sqrt(_5965);
        float _5971 = 1.0 / _5143;
        float _5973 = _5967 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5975 = precise::min(_5969, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5977 = _5975 * _5953;
        float _5979 = _5977 * _5971;
        float _5981 = -_2815;
        float _5983 = _5981 + _5917;
        float _5985 = _5973 * _5979;
        float _5987 = _5957 * _5979;
        float _5989 = fma(_5961, _5985, _5001);
        float _5991 = fma(_5983, _5985, _5009);
        float _5993 = fma(_5973, _5987, _5021);
        _5949 = _5989;
        _5935 = _5991;
        _5937 = _5993;
        _236 = _5953;
    }
    float _5995 = _5949;
    float _5997 = _5935;
    float _5999 = _5937;
    float _6001 = _236;
    float _6003 = _6001;
    if (!_5809)
    {
        float _6005 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6007 = _6005 * 0.15915493667125701904296875;
        float _6009 = _6007 * 6.283185482025146484375;
        float _6011 = cos(_6009);
        float _6013 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6015 = _6013 * 0.15915493667125701904296875;
        float _6017 = _6007 * 6.283185482025146484375;
        float _6019 = sin(_6017);
        float _6021 = 1.0 / _6011;
        float _6023 = _6015 * 6.283185482025146484375;
        float _6025 = cos(_6023);
        float _6027 = _6019 * _6021;
        float _6029 = _6015 * 6.283185482025146484375;
        float _6031 = sin(_6029);
        float _6033 = _6025 * _6027;
        float _6035 = 1.0 / _6033;
        float _6037 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6039 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6037;
        float _6041 = 1.0 / _6039;
        float _6043 = _6031 * _6035;
        float _6045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6047 = fma(_5943, _6043, _6045);
        float _6049 = _6047 * _6041;
        float _6051 = precise::clamp(_6049, 0.0, 1.0);
        _5945 = _6051;
    }
    float _6053 = _5945;
    float _6055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6057 = _5995 + _6055;
    float _6059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6061 = _5997 + _6059;
    float _6063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6065 = _5999 + _6063;
    float _6067 = _6057 * _6057;
    float _6069 = fma(_6061, _6061, _6067);
    float _6071 = fma(_6065, _6065, _6069);
    float _6073 = rsqrt(_6071);
    float _6075 = sqrt(_6071);
    float _6077 = _6073 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6079 = _6061 * _6077;
    float _6081 = _6065 * _6077;
    float _6083 = _6079 * _6079;
    float _6085 = _6081 * _6081;
    float _6087 = _6083 + _6085;
    float _6089 = sqrt(_6087);
    bool _6091 = _6089 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6095 = _6089 + _6093;
    float _6097 = _6073;
    float _6099 = _6087;
    float _6101 = _6095;
    float _6103 = _6057;
    if (_6091)
    {
        float _6105 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6097 = _6105;
    }
    float _6107 = _6097;
    if (_6091)
    {
        float _6109 = rsqrt(_6087);
        _6099 = _6109;
    }
    float _6111 = _6099;
    float _6113 = _6111;
    if (_6091)
    {
        float _6115 = _6095 * _6107;
        _6101 = _6115;
    }
    float _6117 = _6101;
    if (_6091)
    {
        float _6119 = _6117 * 0.15915493667125701904296875;
        _5837 = _6119;
    }
    float _6121 = _5837;
    float _6123 = _6065;
    if (_6091)
    {
        float _6125 = _6121 * 6.283185482025146484375;
        float _6127 = sin(_6125);
        _6123 = _6127;
    }
    float _6129 = _6123;
    float _6131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6133 = precise::max(0.0, _6131);
    float _6135 = _6107;
    if (_6091)
    {
        float _6137 = _6121 * 6.283185482025146484375;
        float _6139 = cos(_6137);
        _6135 = _6139;
    }
    float _6141 = _6135;
    float _6143 = -_6077;
    float _6145 = -_6133;
    float _6147 = fma(_6057, _6143, _6145);
    float _6149 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6091)
    {
        float _6151 = _6147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6103 = _6151;
    }
    float _6153 = _6103;
    float _6155 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6157 = fma(_5009, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6159 = _6153;
    float _6161 = _6129;
    if (_6091)
    {
        float _6163 = fma(_6129, _6153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6159 = _6163;
    }
    float _6165 = _6159;
    float _6167 = _6165;
    if (!_6091)
    {
        _6161 = _6079;
    }
    float _6169 = _6161;
    float _6171 = _6169;
    float _6173 = _6141;
    if (_6091)
    {
        float _6175 = _6141 + (-1.0);
        _6149 = _6175;
    }
    float _6177 = _6149;
    float _6179 = _6177;
    if (_6091)
    {
        float _6181 = _6111 * _6165;
        _5839 = _6181;
    }
    float _6183 = _5839;
    if (!_6091)
    {
        _6167 = _6147;
    }
    float _6185 = _6167;
    float _6187 = _6185;
    if (_6091)
    {
        float _6189 = _6177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6003 = _6189;
    }
    float _6191 = _6003;
    if (_6091)
    {
        float _6193 = _6079 * _6183;
        _6171 = _6193;
    }
    float _6195 = _6171;
    if (!_6091)
    {
        _6179 = _6081;
    }
    float _6197 = _6179;
    float _6199 = _6197;
    if (_6091)
    {
        float _6201 = _6081 * _6183;
        _6199 = _6201;
    }
    float _6203 = _6199;
    if (!_6091)
    {
        _6113 = _6083;
    }
    float _6205 = _6113;
    float _6207 = _6205;
    if (_6091)
    {
        float _6209 = fma(_6147, _6141, _6191);
        _6187 = _6209;
    }
    float _6211 = _6187;
    if (_6091)
    {
        float _6213 = _6195 * _6195;
        _6207 = _6213;
    }
    float _6215 = _6207;
    if (!_6091)
    {
        _6173 = _6085;
    }
    float _6217 = _6173;
    float _6219 = _6217;
    if (_6091)
    {
        float _6221 = _6203 * _6203;
        _6219 = _6221;
    }
    float _6223 = _6219;
    float _6225 = fma(_6211, _6211, _6215);
    float _6227 = floor(_6157);
    float _6229 = _6225 + _6223;
    float _6231 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6155);
    float _6233 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6235 = fma(_6075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6233);
    float _6237 = precise::clamp(_6235, 0.0, 1.0);
    float _6239 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6231);
    float _6241 = rsqrt(_6229);
    float _6243 = -_6237;
    float _6245 = _6243 + 1.0;
    float _6247 = _6239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6251 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6253 = _6247 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6255 = fma(_5021, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6257 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6259 = abs(_6245);
    float _6261 = log2(_6259);
    float _6263 = -_6253;
    float _6265 = fma(_6263, _6249, 1.0);
    float _6267 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6269 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6251);
    float _6271 = -_6227;
    float _6273 = _6157 + _6271;
    float _6275 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6267);
    float _6277 = _6241 * _6195;
    float _6279 = floor(_6255);
    float _6281 = _6241 * _6211;
    float _6283 = _6241 * _6203;
    float _6285 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6257);
    float _6287 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6275);
    float _6289 = _6277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6291 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6269);
    float _6293 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6285);
    float _6295 = _6287 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6297 = -_6289;
    float _6299 = fma(_6281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6297);
    float _6301 = _6261 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6303 = _6293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6305 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6307 = -_6283;
    float _6309 = fma(_6307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6299);
    float _6311 = _6291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6313 = exp2(_6301);
    float _6315 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6305);
    float _6317 = fma(_6309, -0.5, 0.5);
    float _6319 = fma(_6309, 0.5, 0.5);
    float _6321 = -_6279;
    float _6323 = _6255 + _6321;
    float _6325 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6315);
    float _6327 = fma(_6319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6329 = log2(_6265);
    float _6331 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6325);
    float _6333 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6335 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6337 = fma(_6319, _6327, -0.212114393711090087890625);
    float _6339 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6333);
    float _6341 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6335);
    float _6343 = sqrt(_6317);
    float _6345 = fma(_6319, _6337, 1.570728778839111328125);
    float _6347 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6339);
    float _6349 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6341);
    float _6351 = 1.0 / _6331;
    float _6353 = _6281 + 1.0;
    float _6355 = _6329 * 0.693147182464599609375;
    float _6357 = -_6281;
    float _6359 = fma(_6313, _6353, _6357);
    float _6361 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6347);
    float _6363 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6349);
    float _6365 = _6343 * 0.636619746685028076171875;
    float _6367 = fma(_6359, 0.5, 0.5);
    float _6369 = -_6345;
    float _6371 = fma(_6365, _6369, 1.0);
    float _6373 = _6355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16189 = float2(_6273, _6323);
    float _6375 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16189, float2(0.0), isnan(_16189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16189, float2(0.0), isnan(_16189)), level(0.0)).x;
    float _6377 = _6361 * _6351;
    float _6379 = _6363 * _6351;
    float _6381 = fma(_6377, 0.5, 0.5);
    float _6383 = fma(_6379, -0.5, 0.5);
    float3 _16208 = float3(_6381, _6383, _6373);
    float _6385 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16208, float3(0.0), isnan(_16208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16208, float3(0.0), isnan(_16208)), level(0.0)).x;
    float3 _16219 = float3(_6381, _6383, _6373);
    float4 _6388 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16219, float3(0.0), isnan(_16219)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16219, float3(0.0), isnan(_16219)), level(0.0)).xyzw;
    float _6390 = _6388.x;
    float _6392 = _6388.y;
    float _6394 = _6388.z;
    float _6396 = _6388.w;
    float2 _16235 = float2(_6371, _6367);
    float3 _6398 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16235, float2(0.0), isnan(_16235)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16235, float2(0.0), isnan(_16235)), level(0.0)).xyz;
    float _6400 = _6398.x;
    float _6402 = _6398.y;
    float _6404 = _6398.z;
    float _6406 = abs(_5943);
    float _6408 = log2(_6406);
    float _6410 = _6261 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6412 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6414 = isnan(_6075);
    bool _6416 = _6412 || _6414;
    bool _6418 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6420 = _6416 || _6418;
    float _6422 = exp2(_6410);
    float _6424 = _6408 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6426 = exp2(_6424);
    float _6428 = in.m_105.x;
    float _6430 = -_6422;
    float _6432 = _6430 + 1.0;
    float _6434 = _6432 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6436 = fma(_6426, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6438 = precise::clamp(_6436, 0.0, 1.0);
    float _6440 = fma(_6438, -2.0, 3.0);
    float _6442 = _6438 * _6438;
    float _6444 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6446 = _6442 * _6440;
    float _6448 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6444);
    float _6450 = -_6446;
    float _6452 = _6450 + 1.0;
    float _6454 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6448);
    float _6456 = fma(_6452, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6446);
    bool _6458 = _5943 <= 8000.0;
    bool _6460 = isnan(_5943);
    bool _6462 = _6458 || _6460;
    bool _6464 = isnan(8000.0);
    bool _6466 = _6462 || _6464;
    float _6468 = float(_6466);
    float _6470 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6454);
    float _6472 = _6331 * 0.5;
    float _6474 = _6361 + _6331;
    float _6476 = _6468 * _6456;
    float _6478 = fma(_6363, -0.5, _6472);
    out.gl_Position.x = _6361;
    out.gl_Position.y = _6363;
    out.gl_Position.z = _6470;
    out.gl_Position.w = _6331;
    float _6480 = _6470 + _6331;
    float _6482 = _6476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6484 = _6474 * 0.5;
    float _6486 = _6480 * 0.5;
    out.m_107.x = _6484;
    out.m_107.y = _6478;
    out.m_107.z = _6486;
    out.m_107.w = _6331;
    float _6488 = -_6434;
    float _6490 = _6488 + 1.0;
    float _6492 = _6331;
    float _6494 = _6470;
    float _6496 = _6363;
    float _6498 = _6478;
    float _6500 = _6484;
    float _6502 = _6490;
    if (!_6420)
    {
        _6492 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6504 = _6492;
    float _6506 = _6504;
    float _6508 = _6504;
    if (!_6420)
    {
        _6494 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6510 = _6494;
    float _6512 = _6510;
    float _6514 = _6510;
    if (!_6420)
    {
        _6496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6516 = _6496;
    float _6518 = _6053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6520 = _6516;
    float _6522 = _6516;
    if (!_6420)
    {
        _6498 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6524 = _6498;
    float _6526 = _6524;
    float _6528 = _6524;
    if (!_6420)
    {
        _6500 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6530 = _6500;
    float _6532 = -_6375;
    float _6534 = _6532 + 1.0;
    float _6536 = _6534 * _6482;
    float _6538 = precise::clamp(_6536, 0.0, 1.0);
    float _6540 = -_6538;
    float _6542 = fma(_6540, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6544 = _6434 * _6385;
    float _6546 = _6542 * _6428;
    float _6548 = _6396 * _6544;
    float _6550 = _6404 * _6544;
    float _6552 = _6546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6554 = fma(_6400, _6548, _6390);
    float _6556 = fma(_6402, _6548, _6392);
    float _6558 = _6396 * _6490;
    float _6560 = fma(_6396, _6550, _6394);
    out.m_109.x = _6552;
    float _6562 = _6530;
    float _6564 = _6530;
    if (!_6420)
    {
        _6502 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6566 = _6502;
    out.m_111.x = _6554;
    out.m_111.y = _6556;
    out.m_111.z = _6560;
    out.m_111.w = _6558;
    bool _6568 = !_6420;
    float _6570 = _6566;
    float _6572 = _6566;
    if (!_6568)
    {
        bool _6574 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6576 = isnan(_6075);
        bool _6578 = _6574 || _6576;
        bool _6580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6582 = _6578 || _6580;
        if (!_6582)
        {
            float _6584 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6586 = _6075 + _6584;
            float _6588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6590 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6588;
            float _6592 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6594 = _6592 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6596 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6598 = _6596 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6600 = 1.0 / _6590;
            float _6602 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6604 = _6602 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6606 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6608 = _6606 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6610 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6612 = _6610 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6614 = _6586 * _6600;
            float _6616 = precise::clamp(_6614, 0.0, 1.0);
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6622 = fma(_6616, _6594, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6624 = fma(_6616, _6598, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6626 = fma(_6616, _6620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6628 = fma(_6616, _6604, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6630 = fma(_6616, _6608, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6632 = fma(_6616, _6612, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6522 = _6622;
            _6564 = _6630;
            _6514 = _6624;
            _6528 = _6628;
            _6572 = _6626;
            _6508 = _6632;
            _6634 = true;
        }
        else
        {
            bool _6636 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6638 = isnan(_6075);
            bool _6640 = _6636 || _6638;
            bool _6642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6644 = _6640 || _6642;
            if (!_6644)
            {
                _6526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6646 = _6526;
            _6528 = _6646;
            if (!_6644)
            {
                _6562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6648 = _6562;
            _6564 = _6648;
            if (!_6644)
            {
                _6506 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6650 = _6506;
            _6508 = _6650;
            if (!_6644)
            {
                _6512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6652 = _6512;
            _6514 = _6652;
            if (!_6644)
            {
                _6520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6654 = _6520;
            _6522 = _6654;
            if (!_6644)
            {
                _6570 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6656 = _6570;
            bool _6658 = !_6644;
            _6572 = _6656;
            if (!_6658)
            {
                bool _6660 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6662 = isnan(_6075);
                bool _6664 = _6660 || _6662;
                bool _6666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6668 = _6664 || _6666;
                if (!_6668)
                {
                    float _6670 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6672 = _6075 + _6670;
                    float _6674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6676 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6674;
                    float _6678 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6680 = _6678 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6684 = _6682 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6686 = 1.0 / _6676;
                    float _6688 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6690 = _6688 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6694 = _6692 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6700 = _6672 * _6686;
                    float _6702 = precise::clamp(_6700, 0.0, 1.0);
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6708 = fma(_6702, _6680, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6710 = fma(_6702, _6684, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6712 = fma(_6702, _6706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6714 = fma(_6702, _6690, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6716 = fma(_6702, _6694, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6718 = fma(_6702, _6698, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6522 = _6708;
                    _6564 = _6716;
                    _6514 = _6710;
                    _6528 = _6714;
                    _6572 = _6712;
                    _6508 = _6718;
                    _6634 = true;
                }
                else
                {
                    _6522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6572 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6508 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6634 = false;
    float _6720 = _6522;
    float _6722 = _6564;
    float _6724 = _6514;
    float _6726 = _6528;
    float _6728 = _6572;
    float _6730 = _6508;
    float _6732 = _6518 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6734 = fma(_5657, -0.5, 0.5);
    float _6736 = precise::clamp(_6734, 0.0, 1.0);
    float _6738 = -_6720;
    float _6740 = _6722 + _6738;
    float _6742 = -_6724;
    float _6744 = _6726 + _6742;
    out.m_53.x = _6732;
    float _6746 = fma(_6736, _6740, _6720);
    float _6748 = -_6728;
    float _6750 = _6730 + _6748;
    float _6752 = fma(_6736, _6744, _6724);
    float _6754 = _6746 * 0.586610972881317138671875;
    bool _6756 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6758 = fma(_6736, _6750, _6728);
    out.m_113.x = 0.0;
    float _6760 = fma(_6752, 0.298911988735198974609375, _6754);
    bool _6762 = _6053 > 0.0;
    bool _6764 = isnan(_6053);
    bool _6766 = _6762 || _6764;
    bool _6768 = isnan(0.0);
    bool _6770 = _6766 || _6768;
    float _6772 = fma(_6758, 0.114477999508380889892578125, _6760);
    float _6774 = -_6772;
    float _6776 = _6752 + _6774;
    float _6778 = -_6772;
    float _6780 = _6746 + _6778;
    float _6782 = -_6772;
    float _6784 = _6758 + _6782;
    float _6786 = fma(_6776, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    float _6788 = fma(_6780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    float _6790 = fma(_6784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    bool _6792 = !_6756;
    if (!_6792)
    {
        float _6794 = -_5995;
        float _6796 = _6794 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6798 = -_5997;
        float _6800 = _6798 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6802 = -_5999;
        float _6804 = _6802 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6806 = _6796 * _6796;
        float _6808 = fma(_6800, _6800, _6806);
        float _6810 = fma(_6804, _6804, _6808);
        float _6812 = sqrt(_6810);
        float _6814 = rsqrt(_6810);
        float _6816 = -_6812;
        float _6818 = _6816 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6820 = _6818 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6822 = precise::clamp(_6820, 0.0, 1.0);
        float _6824 = _6800 * _6814;
        float _6826 = _6796 * _6814;
        float _6828 = abs(_6822);
        float _6830 = log2(_6828);
        float _6832 = _6804 * _6814;
        float _6834 = _6824 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6836 = _5657 * _6826;
        float _6838 = -_6826;
        float _6840 = -_6834;
        float _6842 = fma(_6838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6840);
        float _6844 = fma(_5649, _6824, _6836);
        float _6846 = -_6832;
        float _6848 = fma(_6846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6842);
        float _6850 = fma(_5659, _6832, _6844);
        float _6852 = precise::clamp(_6850, 0.0, 1.0);
        float _6854 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6856 = _6848 + _6854;
        float _6858 = _6830 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6860 = _6856 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6862 = precise::clamp(_6860, 0.0, 1.0);
        float _6864 = exp2(_6858);
        float _6866 = _6864 * _6862;
        float _6868 = _6852 * _6866;
        float _6870 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6872 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6874 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6870;
        out.m_113.y = _6872;
        out.m_113.z = _6874;
    }
    out.m_115.x = _6786;
    out.m_115.y = _6788;
    out.m_115.z = _6790;
    if (_6770)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _6876 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6876;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6634 = false;
    bool _5707 = false;
    bool _1098 = false;
    bool _774 = false;
    bool _632 = false;
    bool _478 = false;
    bool _256 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_50.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_53.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6933 = as_type<float>(_150);
        out.gl_Position.z = _6933;
    }
    if (!_138)
    {
        return out;
    }
    float _154 = in.m_55.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_53.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7003 = as_type<float>(_188);
        out.gl_Position.z = _7003;
    }
    if (_180)
    {
        return out;
    }
    float _190 = in.m_57.x;
    float _192 = in.m_57.y;
    float _194 = in.m_57.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
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
    float _236 = _226;
    float _254;
    if (!_234)
    {
        float _238 = in.m_65.x;
        float _240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _242 = _238 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _246 = _244 * _240;
        float _248 = floor(_246);
        float _250 = -_248;
        float _252 = _246 + _250;
        _254 = _252;
        _256 = true;
    }
    else
    {
        float _258 = float(_134);
        float _260 = 1.0 / _258;
        float _262 = _168 * _260;
        _254 = _262;
    }
    _256 = false;
    float _264 = _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _264 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _264 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = 1.0 / _280;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _288;
    bool _296 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_264);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _284;
    float _310 = _268 * _290;
    bool _312 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_264);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_264);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = _272 * _294;
    bool _342 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_264);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _354;
    float _358 = _306 * _338;
    float _360 = -_306;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = -_352;
    float _370 = _368 + 1.0;
    float _372 = _276 * _308;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = _334 * _370;
    float _384 = fma(_356, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = _352 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = _386 * _382;
    float _398 = _388 * _382;
    float _400 = _384 * _382;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = -_334;
    float _408 = _406 + 1.0;
    float _410 = fma(_366, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_394, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_404, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_410, _390, _422);
    float _436 = fma(_416, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = fma(_428, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_432, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = fma(_418, _390, _412);
    float _444 = fma(_420, _390, _424);
    float _446 = fma(_438, _358, _434);
    float _448 = fma(_436, _358, _442);
    float _450 = fma(_440, _358, _444);
    float _452 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].x, _446);
    float _454 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].y, _448);
    float _456 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].z, _450);
    bool _458 = !_292;
    float _476;
    if (!_458)
    {
        float _460 = in.m_65.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_134);
        float _482 = 1.0 / _480;
        float _484 = _168 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _486 + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_486);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _514 = isnan(_486);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    bool _528 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_486);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _494;
    float _542 = -_506;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _486 + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _522 * _544;
    float _554 = -_522;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _510;
    float _560 = _526 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = fma(_560, _490, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = -_538;
    float _570 = _568 + 1.0;
    float _572 = _564 * _558;
    float _574 = _566 * _552;
    float _576 = _506 * _570;
    float _578 = fma(_572, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = fma(_578, _576, _580);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _588 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = in.m_67.x;
    float _594 = in.m_67.y;
    float _596 = in.m_67.z;
    float _598 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _598;
    out.m_69.y = _600;
    out.m_69.z = _602;
    out.m_69.w = _604;
    float _606 = _456 * _596;
    float _608 = _454 * _594;
    float _610 = _452 * _592;
    bool _612 = !_550;
    float _630;
    if (!_612)
    {
        float _614 = in.m_65.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        float _634 = float(_134);
        float _636 = 1.0 / _634;
        float _638 = _168 * _636;
        _630 = _638;
    }
    _632 = false;
    float _640 = _630;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _644 = _640 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _650 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _652 = isnan(_640);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _666 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _668 = isnan(_640);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _678;
    bool _682 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _684 = isnan(_640);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _648;
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _702 = _640 + _700;
    bool _704 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _706 = _676 * _698;
    float _708 = -_676;
    float _710 = _708 + 1.0;
    float _712 = 1.0 / _664;
    float _714 = _680 * _694;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _720 = fma(_714, _644, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _722 = -_692;
    float _724 = _722 + 1.0;
    float _726 = _718 * _712;
    float _728 = _720 * _706;
    float _730 = _660 * _724;
    float _732 = fma(_726, _702, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _734 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[131].x, _728);
    float _736 = fma(_732, _730, _734);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _744 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[133].x, _736);
    float _746 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _746;
    out.m_71.y = _748;
    out.m_71.z = _750;
    out.m_71.w = _752;
    bool _754 = !_704;
    float _772;
    if (!_754)
    {
        float _756 = in.m_65.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_134);
        float _778 = 1.0 / _776;
        float _780 = _168 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _786 = _782 + _784;
    bool _788 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _790 = isnan(_782);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _804;
    bool _808 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _810 = isnan(_782);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -_798;
    float _822 = _820 + 1.0;
    bool _824 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _826 = isnan(_782);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = 1.0 / _802;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _818 * _822;
    float _844 = -_834;
    float _846 = _844 + 1.0;
    float _848 = 1.0 / _840;
    bool _850 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _852 = _806 * _836;
    float _854 = -_818;
    float _856 = _854 + 1.0;
    bool _858 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _860 = isnan(_782);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = fma(_852, _786, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _872 = _834 * _856;
    bool _874 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _876 = isnan(_782);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = _868 * _846;
    float _888 = -_868;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _896 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _898 = isnan(_782);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = _884 * _890;
    float _910 = -_884;
    float _912 = _910 + 1.0;
    bool _914 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _916 = isnan(_782);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = 1.0 / _894;
    float _928 = -_906;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _936 = _906 * _912;
    float _938 = _924 * _930;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _944 = -_924;
    float _946 = _944 + 1.0;
    float _948 = 1.0 / _934;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _954 = _870 * _938;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _962 = _782 + _960;
    float _964 = _952 * _848;
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[159].x, _954);
    float _968 = 1.0 / _942;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _970;
    float _974 = fma(_964, _962, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = _782 + _980;
    float _984 = _972 * _926;
    float _986 = fma(_974, _936, _966);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _990 = _782 + _988;
    float _992 = 1.0 / _958;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _998 = fma(_984, _982, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1000 = _996 * _948;
    bool _1002 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1004 = isnan(_782);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1014;
    float _1018 = 1.0 / _978;
    float _1020 = fma(_998, _908, _986);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1026 = _1016 * _968;
    float _1028 = fma(_1000, _990, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1032 = _782 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1036 = _782 + _1034;
    float _1038 = _1024 * _992;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1040;
    float _1044 = fma(_1026, _1032, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1046 = fma(_1028, _886, _1020);
    float _1048 = fma(_1038, _1036, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1050 = -_1012;
    float _1052 = _1050 + 1.0;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1056 = _782 + _1054;
    float _1058 = fma(_1044, _872, _1046);
    float _1060 = _1042 * _1018;
    float _1062 = _798 * _1052;
    float _1064 = fma(_1048, _842, _1058);
    float _1066 = fma(_1060, _1056, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1068 = fma(_1066, _1062, _1064);
    float _1070 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1068);
    out.m_73.x = _1070;
    bool _1072 = !_850;
    float _1074 = _986;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1078 = as_type<int>(_1018);
    float _1096;
    if (!_1072)
    {
        float _1080 = in.m_65.x;
        float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1084 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1088 = _1086 * _1082;
        float _1090 = floor(_1088);
        float _1092 = -_1090;
        float _1094 = _1088 + _1092;
        _1096 = _1094;
        _1098 = true;
    }
    else
    {
        float _1100 = float(_134);
        float _1102 = 1.0 / _1100;
        float _1104 = _168 * _1102;
        _1096 = _1104;
    }
    _1098 = false;
    float _1106 = _1096;
    float _1108 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1110 = int(_1108);
    float _1112 = in.m_65.y;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1116 = _1114 != 0;
    float _1118 = in.m_75.x;
    float _1120 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1122 = int(_1120);
    float _1124 = 0.0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1116)
    {
        _1124 = 1.0;
    }
    float _1128 = _1124;
    float _1130 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1132 = int(_1130);
    float _1134 = float(_1110);
    float _1136 = 0.0;
    float _1138 = _1128;
    if (_1116)
    {
        _1136 = 1.0;
    }
    float _1140 = _1136;
    float _1142 = 0.0;
    float _1144 = _1140;
    if (_1116)
    {
        _1142 = 1.0;
    }
    float _1146 = _1142;
    int _1148 = 0;
    float _1150 = _1146;
    if (_1116)
    {
        _1148 = 0;
    }
    int _1152 = _1148;
    int _1154 = _1152;
    if (_1116)
    {
        float _1156 = in.m_65.x;
        _1074 = _1156;
    }
    float _1158 = _1074;
    float _1160 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1162 = int(_1160);
    float _1164 = float(_1122);
    float _1166 = _1158;
    if (_1116)
    {
        _1126 = 0;
    }
    int _1168 = _1126;
    float _1170 = _1062;
    int _1172 = _1168;
    if (_1116)
    {
        float _1174 = in.m_65.z;
        _1170 = _1174;
    }
    float _1176 = _1170;
    int _1178 = 0;
    if (_1116)
    {
        _1178 = as_type<int>(_1112);
    }
    int _1180 = _1178;
    float _1182 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1184 = int(_1182);
    float _1186 = float(_1132);
    float _1188 = 1.0 / _1134;
    float _1190 = float(_1162);
    float _1192 = 1.0 / _1164;
    float _1194 = float(uint(_1184));
    float _1196 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1198 = int(_1196);
    float _1200 = _1188 * _168;
    float _1202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1204 = int(_1202);
    float _1206 = _1192 * _168;
    float _1208 = 1.0 / _1186;
    float _1210 = float(uint(_1198));
    float _1212 = 1.0 / _1190;
    float _1214 = float(uint(_1204));
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1218 = int(_1216);
    float _1220 = _1208 * _168;
    float _1222 = 1.0 / _1194;
    float _1224 = _1212 * _168;
    float _1226 = trunc(_1200);
    int _1228 = int(_1226);
    float _1230 = float(uint(_1218));
    float _1232 = 1.0 / _1210;
    int _1234 = as_type<int>(_1222) + (-2);
    float _1236 = trunc(_1206);
    int _1238 = int(_1236);
    float _1240 = float(uint(_1228));
    float _1242 = as_type<float>(_1234) * _1240;
    float _1244 = 1.0 / _1214;
    int _1246 = as_type<int>(_1232) + (-2);
    float _1248 = trunc(_1220);
    int _1250 = int(_1248);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = 1.0 / _1230;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1264 = _1262 != 0;
    bool _1266 = _1112 > 0.5;
    int _1268 = as_type<int>(_1244) + (-2);
    float _1270 = trunc(_1224);
    int _1272 = int(_1270);
    float _1274 = float(uint(_1250));
    int _1276 = _1180;
    bool _1278 = _1260;
    bool _1280 = _1264;
    float _1282 = _1118;
    if (!_1254)
    {
        _1076 = _1118;
    }
    float _1284 = _1076;
    float _1286 = as_type<float>(_1268) * _1274;
    int _1288 = as_type<int>(_1286);
    float _1290 = _1284;
    if (_1260)
    {
        float _1292 = -_1118;
        float _1294 = _1292 + 1.0;
        _1078 = as_type<int>(_1294);
    }
    int _1296 = _1078;
    float _1298 = trunc(_1242);
    float _1300 = precise::max(_1298, 0.0);
    uint _1303 = uint(_1300);
    int _1305 = as_type<int>(_1256) + (-2);
    float _1307 = 0.0;
    if (!_1264)
    {
        _1307 = _1118;
    }
    float _1309 = _1307;
    float _1311 = 0.0;
    float _1313 = _1309;
    if (!_1260)
    {
        _1311 = _1118;
    }
    float _1315 = _1311;
    float _1317 = _1315;
    if (_1260)
    {
        float _1319 = _1266 ? as_type<float>(_1296) : _1118;
        _1317 = _1319;
    }
    float _1321 = _1317;
    float _1323 = trunc(_1286);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    float _1329 = float(uint(_1238));
    float _1331 = float(uint(_1272));
    float _1333 = as_type<float>(_1246) * _1329;
    float _1335 = _1329;
    if (_1264)
    {
        float _1337 = -_1118;
        float _1339 = _1337 + 1.0;
        _1288 = as_type<int>(_1339);
    }
    int _1341 = _1288;
    float _1343 = as_type<float>(_1305) * _1331;
    float _1345 = trunc(_1333);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = _1341;
    float _1353 = _1343;
    if (_1264)
    {
        float _1355 = _1266 ? as_type<float>(_1341) : _1118;
        _1313 = _1355;
    }
    float _1357 = _1313;
    float _1359 = _1176;
    if (_1116)
    {
        _1351 = as_type<int>(_1176);
    }
    int _1361 = _1351;
    float _1363 = trunc(_1343);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = _1361;
    if (_1116)
    {
        _1353 = _1158;
    }
    float _1371 = _1353;
    float _1373 = _1371;
    if (_1116)
    {
        _1335 = _1371;
    }
    float _1375 = _1335;
    int _1377 = 0;
    float _1379 = _1375;
    if (_1116)
    {
        _1377 = as_type<int>(_1371);
    }
    int _1381 = _1377;
    int _1383 = _1381;
    if (!_1116)
    {
        float _1385 = in.m_65.x;
        float _1387 = _1112 * 3.1415927410125732421875;
        float _1389 = in.m_65.z;
        float _1391 = _1387 * 0.15915493667125701904296875;
        float _1393 = _1391 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = _1385 * 3.1415927410125732421875;
        float _1399 = _1397 * 0.15915493667125701904296875;
        float _1401 = _1389 * 3.1415927410125732421875;
        float _1403 = _1401 * 0.15915493667125701904296875;
        float _1405 = _1399 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = _1403 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        _1373 = _1112;
        _1144 = 1.2345600128173828125;
        _1166 = _1385;
        _1138 = 7.345489978790283203125;
        _1379 = _1389;
        _1150 = 5.839270114898681640625;
        _1154 = 1;
        _1359 = _1389;
        _1172 = 2;
        _1369 = as_type<int>(_1411);
        _1276 = as_type<int>(_1395);
        _1383 = as_type<int>(_1407);
    }
    float _1413 = _1373;
    float _1415 = _1144;
    float _1417 = _1166;
    float _1419 = _1138;
    float _1421 = _1379;
    float _1423 = _1150;
    int _1425 = _1154;
    float _1427 = _1359;
    int _1429 = _1172;
    int _1431 = _1369;
    int _1433 = _1276;
    int _1435 = _1383;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1439 = _1437 != 0;
    int _1441 = 0;
    if (_1254)
    {
        float _1443 = in.m_65.x;
        _1441 = as_type<int>(_1443);
    }
    int _1445 = _1441;
    int _1447 = ~_1184;
    int _1449 = _1447 + 1;
    float _1451 = _1413 * _1415;
    int _1453 = ~_1204;
    int _1455 = _1453 + 1;
    float _1457 = _1417 * _1419;
    int _1459 = ~_1218;
    int _1461 = _1459 + 1;
    int _1463 = _1449 * int(_1303);
    int _1465 = _1463 + _1228;
    float _1467 = floor(_1451);
    float _1469 = _1421 * _1423;
    float _1471 = _1413 * _1419;
    int _1473 = _1461 * int(_1367);
    int _1475 = _1473 + _1272;
    float _1477 = float(uint(_1465));
    float _1479 = _842;
    if (_1439)
    {
        float _1481 = in.m_65.z;
        _1479 = _1481;
    }
    float _1483 = _1479;
    int _1485 = _1455 * int(_1327);
    int _1487 = _1485 + _1250;
    int _1489 = ~_1198;
    int _1491 = _1489 + 1;
    float _1493 = floor(_1457);
    float _1495 = as_type<float>(_1234) * _1477;
    float _1497 = float(uint(_1475));
    bool _1499 = _1425 != 1;
    float _1501 = float(uint(_1487));
    float _1503 = in.m_61.w;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1507 = _1505 != 0;
    float _1509 = as_type<float>(_1305) * _1497;
    float _1511 = trunc(_1495);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = _1445;
    float _1519 = _1495;
    if (_1254)
    {
        bool _1521 = as_type<float>(_1445) > 0.5;
        _1278 = _1521;
    }
    bool _1523 = _1278;
    if (_1439)
    {
        float _1525 = -_1118;
        float _1527 = _1525 + 1.0;
        _1517 = as_type<int>(_1527);
    }
    int _1529 = _1517;
    float _1531 = as_type<float>(_1268) * _1501;
    int _1533 = _1491 * int(_1349);
    int _1535 = _1533 + _1238;
    int _1537 = ~_1218;
    int _1539 = _1537 + 1;
    float _1541 = in.m_59.w;
    float _1543 = floor(_1469);
    int _1545 = _1535;
    float _1547 = _1531;
    if (!_1439)
    {
        _1519 = _1118;
    }
    float _1549 = _1519;
    float _1551 = -_1493;
    float _1553 = _1457 + _1551;
    float _1555 = float(uint(_1535));
    float _1557 = _1549;
    if (_1254)
    {
        float _1559 = -_1118;
        float _1561 = _1559 + 1.0;
        _1545 = as_type<int>(_1561);
    }
    int _1563 = _1545;
    if (_1439)
    {
        bool _1565 = _1483 > 0.5;
        _1280 = _1565;
    }
    bool _1567 = _1280;
    int _1569 = 0;
    if (_1507)
    {
        float _1571 = -_1118;
        float _1573 = _1571 + 1.0;
        _1569 = as_type<int>(_1573);
    }
    int _1575 = _1569;
    float _1577 = float(_1218);
    float _1579 = floor(_1471);
    if (_1439)
    {
        float _1581 = _1567 ? as_type<float>(_1529) : _1118;
        _1557 = _1581;
    }
    float _1583 = _1557;
    float _1585 = -_1467;
    float _1587 = _1451 + _1585;
    float _1589 = float(_134);
    float _1591 = as_type<float>(_1246) * _1555;
    if (_1254)
    {
        float _1593 = _1523 ? as_type<float>(_1563) : _1118;
        _1290 = _1593;
    }
    float _1595 = _1290;
    float _1597 = in.m_63.w;
    float _1599 = float(_1184);
    float _1601 = trunc(_1509);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    float _1607 = float(_1228);
    float _1609 = float(_1204);
    int _1611 = ~_1204;
    int _1613 = _1611 + 1;
    float _1615 = trunc(_1531);
    float _1617 = precise::max(_1615, 0.0);
    uint _1619 = uint(_1617);
    int _1621 = int(_1303) + int(_1515);
    float _1623 = -_1579;
    float _1625 = _1471 + _1623;
    float _1627 = _1553 * _1599;
    float _1629 = float(_1272);
    float _1631 = _1609 * _1587;
    float _1633 = float(_1238);
    float _1635 = 1.0 / _1589;
    if (!_1507)
    {
        _1547 = _1118;
    }
    float _1637 = _1547;
    float _1639 = _1637;
    if (_1507)
    {
        float _1641 = _1266 ? as_type<float>(_1575) : _1118;
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = -_1543;
    float _1647 = _1469 + _1645;
    bool _1649 = _1607 >= _1599;
    bool _1651 = isnan(_1607);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(_1599);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = _1599 * _168;
    float _1663 = float(_1250);
    float _1665 = trunc(_1591);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    float _1671 = float(_1198);
    float _1673 = _1577 * _1647;
    bool _1675 = _1663 >= _1609;
    bool _1677 = isnan(_1663);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan(_1609);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    bool _1687 = _1629 >= _1577;
    bool _1689 = isnan(_1629);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(_1577);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    int _1699 = int(_1367) + int(_1605);
    float _1701 = _1661 * _1635;
    int _1703 = int(_1327) + int(_1619);
    float _1705 = _1635 * _168;
    int _1707 = ~_1184;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1659);
    int _1713 = int(_1711);
    int _1715 = ~_1204;
    int _1717 = _1715 + 1;
    float _1719 = _1609 * _1705;
    float _1721 = _1577 * _1705;
    float _1723 = _1671 * _1705;
    int _1725 = _1709 * _1621;
    int _1727 = _1725 + _1228;
    float _1729 = _1671 * _1625;
    int _1731 = _1717 * _1703;
    int _1733 = _1731 + _1250;
    float _1735 = trunc(_1627);
    int _1737 = int(_1735);
    int _1739 = _1539 * _1699;
    int _1741 = _1739 + _1272;
    bool _1743 = uint(_1727) >= uint(_1184);
    float _1745 = in.m_75.y;
    bool _1747 = uint(_1733) >= uint(_1204);
    bool _1749 = !_1743;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1755 = _1753 != 0;
    float _1757 = trunc(_1631);
    int _1759 = int(_1757);
    bool _1761 = uint(_1741) >= uint(_1218);
    bool _1763 = !_1755;
    int _1765 = _1763 ? 0 : 1;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1769 = _1767 != 0;
    int _1771 = int(_1349) + int(_1669);
    float _1773 = trunc(_1673);
    int _1775 = int(_1773);
    int _1777 = ~_1198;
    int _1779 = _1777 + 1;
    bool _1781 = !_1747;
    int _1783 = _1781 ? 0 : (-1);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1787 = _1785 != 0;
    int _1789 = _1779 * _1771;
    int _1791 = _1789 + _1238;
    int _1793 = ~_1621;
    int _1795 = _1793 + _1751;
    int _1797 = _1795 + 1;
    float _1799 = trunc(_1685);
    int _1801 = int(_1799);
    int _1803 = abs(_1765);
    bool _1805 = !_1769;
    int _1807 = _1805 ? 0 : 1;
    int _1809 = _1184 * _1797;
    int _1811 = _1809 + _1228;
    bool _1813 = _1633 >= _1671;
    bool _1815 = isnan(_1633);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(_1671);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    int _1825 = _1737 * _1803;
    int _1827 = _1825 + _1228;
    bool _1829 = !_1787;
    int _1831 = _1829 ? 0 : 1;
    float _1833 = trunc(_1697);
    int _1835 = int(_1833);
    int _1837 = ~_1703;
    int _1839 = _1837 + _1783;
    int _1841 = _1839 + 1;
    int _1843 = abs(_1807);
    bool _1845 = _1184 == 0;
    int _1847 = _1204 * _1841;
    int _1849 = _1847 + _1250;
    int _1851 = abs(_1831);
    int _1853 = _1759 * _1843;
    int _1855 = _1853 + _1250;
    bool _1857 = uint(_1791) >= uint(_1198);
    float _1859 = trunc(_1701);
    int _1861 = int(_1859);
    bool _1863 = !_1761;
    int _1865 = _1863 ? 0 : (-1);
    int _1867 = ~_1713;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    bool _1873 = !_1845;
    int _1875 = _1873 ? _1811 : (-1);
    float _1877 = trunc(_1823);
    int _1879 = int(_1877);
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1883 = _1881 != 0;
    int _1885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1887 = _1885 != 0;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1891 = _1889 != 0;
    int _1893 = _1875 * _1871;
    int _1895 = ~_1699;
    int _1897 = _1895 + _1865;
    int _1899 = _1897 + 1;
    int _1901 = _1775 * _1851;
    int _1903 = _1901 + _1272;
    bool _1905 = !_1857;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = _1184 + (-1);
    int _1911 = _1218 * _1899;
    int _1913 = _1911 + _1272;
    bool _1915 = !_1887;
    int _1917 = _1915 ? 0 : 1;
    bool _1919 = _1204 == 0;
    int _1921 = _1713 * _1909;
    int _1923 = _1921 + _1893;
    bool _1925 = !_1883;
    int _1927 = _1925 ? 0 : 1;
    int _1929 = ~_1771;
    int _1931 = _1929 + _1907;
    int _1933 = _1931 + 1;
    bool _1935 = _1218 == 0;
    int _1937 = abs(_1917);
    int _1939 = ~_1801;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    bool _1945 = !_1919;
    int _1947 = _1945 ? _1849 : (-1);
    int _1949 = abs(_1927);
    int _1951 = ~_1835;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1943 * _1947;
    bool _1959 = !_1935;
    int _1961 = _1959 ? _1913 : (-1);
    int _1963 = _1923 * _1937;
    int _1965 = _1198 * _1933;
    int _1967 = _1965 + _1238;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1971 = _1969 != 0;
    int _1973 = _1955 * _1961;
    bool _1975 = !_1891;
    int _1977 = _1975 ? 0 : 1;
    int _1979 = _1861 * _1949;
    int _1981 = _1979 + _1963;
    bool _1983 = !_1971;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = abs(_1977);
    int _1989 = abs(_1985);
    bool _1991 = _1198 == 0;
    int _1993 = _1827 * _1987;
    int _1995 = _1993 + _1981;
    int _1997 = _1204 + (-1);
    float _1999 = trunc(_1719);
    int _2001 = int(_1999);
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2009 = _2007 != 0;
    int _2011 = _1737 * _1989;
    int _2013 = _2011 + _1995;
    bool _2015 = !_1991;
    int _2017 = _2015 ? _1967 : (-1);
    int _2019 = _1801 * _1997;
    int _2021 = _2019 + _1957;
    int _2023 = ~_1879;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    float _2029 = float(uint(_2013));
    bool _2031 = !_2009;
    int _2033 = _2031 ? 0 : 1;
    int _2035 = _2027 * _2017;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2039 = _2037 != 0;
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2043 = _2041 != 0;
    float _2045 = as_type<float>(_1234) * _2029;
    int _2047 = abs(_2033);
    bool _2049 = !_2005;
    int _2051 = _2049 ? 0 : 1;
    int _2053 = _1218 + (-1);
    float _2055 = trunc(_2045);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    int _2061 = abs(_2051);
    bool _2063 = !_2039;
    int _2065 = _2063 ? 0 : 1;
    int _2067 = _1835 * _2053;
    int _2069 = _2067 + _1973;
    int _2071 = ~_1184;
    int _2073 = _2071 + 1;
    int _2075 = _2021 * _2047;
    int _2077 = abs(_2065);
    int _2079 = _1198 + (-1);
    int _2081 = _2001 * _2061;
    int _2083 = _2081 + _2075;
    bool _2085 = !_2043;
    int _2087 = _2085 ? 0 : 1;
    int _2089 = _1879 * _2079;
    int _2091 = _2089 + _2035;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2095 = _2093 != 0;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2099 = _2097 != 0;
    float _2101 = trunc(_1721);
    int _2103 = int(_2101);
    int _2105 = abs(_2087);
    int _2107 = _2073 * int(_2059);
    int _2109 = _2107 + _2013;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2113 = _2111 != 0;
    int _2115 = _1855 * _2077;
    int _2117 = _2115 + _2083;
    bool _2119 = !_2099;
    int _2121 = _2119 ? 0 : 1;
    float _2123 = float(uint(_2109));
    int _2125 = _1759 * _2105;
    int _2127 = _2125 + _2117;
    bool _2129 = !_2113;
    int _2131 = _2129 ? 0 : 1;
    float _2133 = trunc(_1729);
    int _2135 = int(_2133);
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2139 = _2137 != 0;
    float _2141 = as_type<float>(_1234) * _2123;
    int _2143 = abs(_2121);
    bool _2145 = !_2139;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = float(uint(_2127));
    int _2151 = _2069 * _2143;
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2155 = _2153 != 0;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2131);
    float _2163 = as_type<float>(_1268) * _2149;
    float _2165 = trunc(_2141);
    float _2167 = precise::max(_2165, 0.0);
    uint _2169 = uint(_2167);
    bool _2171 = !_2095;
    int _2173 = _2171 ? 0 : 1;
    bool _2175 = !_2159;
    int _2177 = _2175 ? 0 : 1;
    int _2179 = abs(_2173);
    int _2181 = abs(_2177);
    float _2183 = trunc(_2163);
    float _2185 = precise::max(_2183, 0.0);
    uint _2187 = uint(_2185);
    int _2189 = _2103 * _2179;
    int _2191 = _2189 + _2151;
    int _2193 = abs(_2147);
    int _2195 = _2091 * _2181;
    int _2197 = ~_1204;
    int _2199 = _2197 + 1;
    int _2201 = _1903 * _2161;
    int _2203 = _2201 + _2191;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_1723);
    int _2211 = int(_2209);
    int _2213 = _2135 * _2193;
    int _2215 = _2213 + _1238;
    int _2217 = int(_2059) + int(_2169);
    bool _2219 = !_2155;
    int _2221 = _2219 ? 0 : 1;
    bool _2223 = !_2207;
    int _2225 = _2223 ? 0 : 1;
    int _2227 = abs(_2221);
    int _2229 = _2199 * int(_2187);
    int _2231 = _2229 + _2127;
    int _2233 = abs(_2225);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2237 = _2235 != 0;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2241 = _2239 != 0;
    int _2243 = ~_1184;
    int _2245 = _2243 + 1;
    int _2247 = _1775 * _2233;
    int _2249 = _2247 + _2203;
    float _2251 = float(uint(_2231));
    int _2253 = _2211 * _2227;
    int _2255 = _2253 + _2195;
    bool _2257 = !_2237;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = _2245 * _2217;
    int _2263 = _2261 + _2013;
    bool _2265 = !_2241;
    int _2267 = _2265 ? 0 : 1;
    float _2269 = as_type<float>(_1268) * _2251;
    int _2271 = abs(_2259);
    float _2273 = float(uint(_2249));
    float _2275 = trunc(_2269);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    bool _2281 = uint(_2263) >= uint(_1184);
    float _2283 = as_type<float>(_1305) * _2273;
    bool _2285 = !_2281;
    int _2287 = _2285 ? 0 : (-1);
    int _2289 = abs(_2267);
    float _2291 = trunc(_2283);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2299 = _2297 != 0;
    int _2301 = _2215 * _2271;
    int _2303 = _2301 + _2255;
    int _2305 = ~_2217;
    int _2307 = _2305 + _2287;
    int _2309 = _2307 + 1;
    bool _2311 = _1184 == 0;
    int _2313 = _2135 * _2289;
    int _2315 = _2313 + _2303;
    int _2317 = ~_1218;
    int _2319 = _2317 + 1;
    int _2321 = _1184 * _2309;
    int _2323 = _2321 + _2013;
    bool _2325 = _1112 > 0.5;
    float _2327 = in.m_65.w;
    float _2329 = float(uint(_2315));
    float _2331 = -_1745;
    float _2333 = _2331 + 1.0;
    bool _2335 = !_2311;
    int _2337 = _2335 ? _2323 : (-1);
    int _2339 = as_type<int>(_2163);
    if (_2299)
    {
        float _2341 = -_1118;
        float _2343 = _2341 + 1.0;
        _2339 = as_type<int>(_2343);
    }
    int _2345 = _2339;
    int _2347 = int(_2187) + int(_2279);
    float _2349 = as_type<float>(_1246) * _2329;
    int _2351 = _2319 * int(_2295);
    int _2353 = _2351 + _2249;
    int _2355 = _2337 & 3;
    bool _2357 = _2355 != 0;
    if (_2299)
    {
        float _2359 = _2325 ? as_type<float>(_2345) : _1118;
        _1282 = _2359;
    }
    float _2361 = _1282;
    int _2363 = ~_1204;
    int _2365 = _2363 + 1;
    float _2367 = trunc(_2349);
    float _2369 = precise::max(_2367, 0.0);
    uint _2371 = uint(_2369);
    bool _2373 = uint(_2355) > 1u;
    float _2375 = float(uint(_2353));
    int _2377 = _2365 * _2347;
    int _2379 = _2377 + _2127;
    int _2381 = _2337 & 3;
    bool _2383 = _2381 != 0;
    int _2385 = ~_1198;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1305) * _2375;
    int _2391 = _2383 ? 0 : 1;
    bool _2393 = uint(_2379) >= uint(_1204);
    int _2395 = ~_2391;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = trunc(_2389);
    float _2403 = precise::max(_2401, 0.0);
    uint _2405 = uint(_2403);
    int _2407 = _2399;
    if (!_2373)
    {
        int _2409 = ~_2391;
        int _2411 = _2409 + 1;
        _2407 = _2411;
    }
    int _2413 = _2407;
    int _2415 = _2387 * int(_2371);
    int _2417 = _2415 + _2315;
    bool _2419 = !_2393;
    int _2421 = _2419 ? 0 : (-1);
    bool _2423 = _2355 != 3;
    bool _2425 = uint(_2355) >= 2u;
    int _2427 = ~_2347;
    int _2429 = _2427 + _2421;
    int _2431 = _2429 + 1;
    int _2433 = _2425 ? 0 : 1;
    float _2435 = float(uint(_2417));
    int _2437 = _1204 * _2431;
    int _2439 = _2437 + _2127;
    int _2441 = _2325 ? as_type<int>(_2333) : as_type<int>(_1745);
    bool _2443 = _2327 > 0.5;
    float _2445 = as_type<float>(_1246) * _2435;
    int _2447 = ~_1218;
    int _2449 = _2447 + 1;
    bool _2451 = _1204 == 0;
    float _2453 = trunc(_2445);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = ~_2433;
    int _2461 = _2459 + 1;
    int _2463 = _2461 + 1;
    int _2465 = _2463;
    if (_2423)
    {
        int _2467 = ~_2433;
        int _2469 = _2467 + 1;
        _2465 = _2469;
    }
    int _2471 = _2465;
    int _2473 = int(_2295) + int(_2405);
    bool _2475 = !_2451;
    int _2477 = _2475 ? _2439 : (-1);
    int _2479 = _2443 ? as_type<int>(_2333) : as_type<int>(_1745);
    int _2481 = _2449 * _2473;
    int _2483 = _2481 + _2249;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2487 = _2485 != 0;
    int _2489 = _2477 & 3;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2487;
    int _2495 = _2493 ? 0 : 1;
    bool _2497 = uint(_2489) >= 2u;
    int _2499 = _2491 ? 0 : 1;
    bool _2501 = uint(_2483) >= uint(_1218);
    int _2503 = _2497 ? 0 : 1;
    bool _2505 = _2489 != 3;
    bool _2507 = !_2501;
    int _2509 = _2507 ? 0 : (-1);
    int _2511 = ~_1198;
    int _2513 = _2511 + 1;
    bool _2515 = uint(_2489) > 1u;
    int _2517 = ~_2473;
    int _2519 = _2517 + _2509;
    int _2521 = _2519 + 1;
    int _2523 = int(_2371) + int(_2457);
    int _2525 = _1218 * _2521;
    int _2527 = _2525 + _2249;
    bool _2529 = _1218 == 0;
    int _2531 = ~_2503;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    int _2537 = _2513 * _2523;
    int _2539 = _2537 + _2315;
    int _2541 = _2535;
    if (_2505)
    {
        int _2543 = ~_2503;
        int _2545 = _2543 + 1;
        _2541 = _2545;
    }
    int _2547 = _2541;
    int _2549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2551 = _2549 != 0;
    int _2553 = ~_2499;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    bool _2559 = !_2529;
    int _2561 = _2559 ? _2527 : (-1);
    int _2563 = _2557;
    if (!_2515)
    {
        int _2565 = ~_2499;
        int _2567 = _2565 + 1;
        _2563 = _2567;
    }
    int _2569 = _2563;
    bool _2571 = uint(_2539) >= uint(_1198);
    bool _2573 = !_2551;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2561 & 3;
    bool _2579 = _2577 != 0;
    bool _2581 = !_2571;
    int _2583 = _2581 ? 0 : (-1);
    int _2585 = _2579 ? 0 : 1;
    bool _2587 = uint(_2577) >= 2u;
    bool _2589 = _2577 != 3;
    int _2591 = ~_2523;
    int _2593 = _2591 + _2583;
    int _2595 = _2593 + 1;
    int _2597 = _2587 ? 0 : 1;
    bool _2599 = uint(_2577) > 1u;
    int _2601 = _1198 * _2595;
    int _2603 = _2601 + _2315;
    bool _2605 = _1198 == 0;
    int _2607 = ~_2597;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2605;
    int _2615 = _2613 ? _2603 : (-1);
    int _2617 = _2611;
    if (_2589)
    {
        int _2619 = ~_2597;
        int _2621 = _2619 + 1;
        _2617 = _2621;
    }
    int _2623 = _2617;
    int _2625 = _2615 & 3;
    bool _2627 = _2625 != 0;
    int _2629 = ~_2585;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    int _2635 = _2633;
    if (!_2599)
    {
        int _2637 = ~_2585;
        int _2639 = _2637 + 1;
        _2635 = _2639;
    }
    int _2641 = _2635;
    bool _2643 = uint(_2625) >= 2u;
    int _2645 = _2627 ? 0 : 1;
    int _2647 = _2643 ? 0 : 1;
    bool _2649 = _2625 != 3;
    bool _2651 = uint(_2625) > 1u;
    int _2653 = ~_2647;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = ~_2645;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2667 = _2665 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2669 = _2657;
    int _2671 = _2663;
    if (_2649)
    {
        int _2673 = ~_2647;
        int _2675 = _2673 + 1;
        _2669 = _2675;
    }
    int _2677 = _2669;
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2651)
    {
        int _2683 = ~_2645;
        int _2685 = _2683 + 1;
        _2671 = _2685;
    }
    int _2687 = _2671;
    float _2689 = 1.0 / _2667;
    float _2691 = in.m_50.x;
    float _2693 = in.m_50.y;
    float _2695 = in.m_50.z;
    int _2697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2699 = _2697 != 0;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2707 = _2705 != 0;
    bool _2709 = !_2699;
    int _2711 = _2709 ? 0 : 1;
    float _2713 = _2707 ? as_type<float>(_2441) : _1745;
    float _2715 = 1.0 / _2681;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2719 = _2717 != 0;
    bool _2721 = _1427 > 0.5;
    float _2723 = _2719 ? as_type<float>(_2479) : _1745;
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2727 = _2725 != 0;
    float _2729 = 1.0 / _2703;
    int _2731 = _2721 ? as_type<int>(_2333) : as_type<int>(_1745);
    int _2733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2735 = _2733 != 0;
    float _2737 = _2727 ? as_type<float>(_2731) : _1745;
    float _2739 = _200 * _2693;
    float _2741 = _2735 ? as_type<float>(_2731) : _1745;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2745 = _2743 != 0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2749 = _2747 != 0;
    float _2751 = fma(_198, _2691, _2739);
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2755 = _2753 != 0;
    float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2761 = _206 * _2693;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2765 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2767 = _1417 * 2.0;
    float _2769 = 1.0 / _2759;
    float _2771 = _212 * _2693;
    float _2773 = fma(_204, _2691, _2761);
    float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2777 = _2775 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2779 = fma(_2765, -2.0, _2763);
    float _2781 = fma(_210, _2691, _2771);
    float _2783 = floor(_2767);
    float _2785 = fma(_202, _2695, _2751);
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2787;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2793 = _2791 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2795 = fma(_214, _2695, _2781);
    float _2797 = fma(_208, _2695, _2773);
    float _2799 = 1.0 / _2777;
    float _2801 = _2745 ? as_type<float>(_2731) : _1745;
    float _2803 = _2789 * _2729;
    float _2805 = _2749 ? as_type<float>(_2731) : _1745;
    float _2807 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2809 = _1106 + _2807;
    bool _2811 = !_2755;
    int _2813 = _2811 ? 0 : 1;
    float _2815 = _2785 + _1541;
    float _2817 = float(uint(_1903));
    float _2819 = 1.0 / _2793;
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2825;
    bool _2829 = _2783 > 0.0;
    float _2831 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2779);
    float _2833 = _2823 * _2689;
    float _2835 = _2827 * _2715;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2845 = _2783 >= 0.0;
    bool _2847 = isnan(_2783);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan(0.0);
    bool _2853 = _2849 || _2851;
    float _2855 = 1.0 / _2839;
    float _2857 = _2843 * _2769;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2859;
    int _2863 = _2853 ? 0 : 1;
    float _2865 = _2861 * _2799;
    float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2869 = _2867 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2871 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2871;
    float _2875 = _1112 * 2.0;
    int _2877 = ~_2863;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = _2869 * _2819;
    float _2885 = float(uint(_1827));
    bool _2887 = _1429 != 2;
    int _2889 = _2881;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2893 = _2769;
    float _2895 = _2819;
    float _2897 = _2805;
    if (!_2829)
    {
        int _2899 = ~_2863;
        int _2901 = _2899 + 1;
        _2889 = _2901;
    }
    int _2903 = _2889;
    float _2905 = _2873 * _2855;
    float _2907 = floor(_2875);
    float _2909 = as_type<float>(_1234) * _2885;
    if (!_1499)
    {
        _2891 = _1112;
    }
    float _2911 = _2891;
    float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2915 = _1106 + _2913;
    float _2917 = _2911;
    if (!_1499)
    {
        _2893 = _1112;
    }
    float _2919 = _2893;
    float _2921 = _2919;
    if (!_1499)
    {
        _2895 = _1427;
    }
    float _2923 = _2895;
    float _2925 = fma(_2803, _2915, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2927 = trunc(_2909);
    float _2929 = precise::max(_2927, 0.0);
    uint _2931 = uint(_2929);
    float _2933 = 0.0;
    float _2935 = _2923;
    if (!_1499)
    {
        _2933 = _1427;
    }
    float _2937 = _2933;
    float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2941 = _1106 + _2939;
    bool _2943 = !_1499;
    float _2945 = _2943 ? as_type<float>(_1431) : as_type<float>(_1433);
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2949 = _1106 + _2947;
    bool _2951 = !_1499;
    float _2953 = _2951 ? as_type<float>(_1433) : as_type<float>(_1435);
    float _2955 = fma(_2857, _2941, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2957 = _2937;
    if (_1499)
    {
        _2917 = _1417;
    }
    float _2959 = _2917;
    float _2961 = fma(_2883, _2949, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1499)
    {
        _2921 = _1417;
    }
    float _2963 = _2921;
    if (_1499)
    {
        _2935 = _1112;
    }
    float _2965 = _2935;
    if (_1499)
    {
        _2957 = _1112;
    }
    float _2967 = _2957;
    bool _2969 = _2907 > 0.0;
    bool _2971 = _2907 >= 0.0;
    bool _2973 = isnan(_2907);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan(0.0);
    bool _2979 = _2975 || _2977;
    float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2983 = _1106 + _2981;
    int _2985 = ~_1184;
    int _2987 = _2985 + 1;
    float _2989 = float(uint(_1855));
    float _2991 = fma(_2833, _2983, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2993 = fma(_2835, _2809, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2997 = _1106 + _2995;
    int _2999 = _2987 * int(_2931);
    int _3001 = _2999 + _1827;
    float _3003 = as_type<float>(_1268) * _2989;
    bool _3005 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3007 = isnan(_1106);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3013 = _3009 || _3011;
    float _3015 = float(_3013);
    float _3017 = fma(_2905, _2997, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3019 = float(uint(_2215));
    float _3021 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3023 = _1106 + _3021;
    float _3025 = float(uint(_3001));
    float _3027 = _2797 + _1503;
    float _3029 = trunc(_3003);
    float _3031 = precise::max(_3029, 0.0);
    uint _3033 = uint(_3031);
    bool _3035 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3037 = isnan(_1106);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3043 = _3039 || _3041;
    float _3045 = float(_3043);
    float _3047 = -_3015;
    float _3049 = _3047 + 1.0;
    float _3051 = as_type<float>(_1234) * _3025;
    bool _3053 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3055 = isnan(_1106);
    bool _3057 = _3053 || _3055;
    bool _3059 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3061 = _3057 || _3059;
    float _3063 = float(_3061);
    float _3065 = as_type<float>(_1246) * _3019;
    float _3067 = -_3045;
    float _3069 = _3067 + 1.0;
    bool _3071 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3073 = isnan(_1106);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3079 = _3075 || _3077;
    float _3081 = float(_3079);
    float _3083 = fma(_2865, _3023, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3085 = -_3063;
    float _3087 = _3085 + 1.0;
    float _3089 = _3063 * _3069;
    bool _3091 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3093 = isnan(_1106);
    bool _3095 = _3091 || _3093;
    bool _3097 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3099 = _3095 || _3097;
    float _3101 = float(_3099);
    float _3103 = trunc(_3065);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    float _3109 = _3015 * _3087;
    float _3111 = as_type<float>(_1305) * _2817;
    bool _3113 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3115 = isnan(_1106);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = -_3101;
    float _3127 = _3125 + 1.0;
    int _3129 = _1613 * int(_3033);
    int _3131 = _3129 + _1855;
    float _3133 = _3101 * _3049;
    bool _3135 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3137 = isnan(_1106);
    bool _3139 = _3135 || _3137;
    bool _3141 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3143 = _3139 || _3141;
    float _3145 = float(_3143);
    float _3147 = trunc(_3111);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = _3081 * _3127;
    float _3155 = float(uint(_3131));
    float _3157 = -_3081;
    float _3159 = _3157 + 1.0;
    int _3161 = ~_1218;
    int _3163 = _3161 + 1;
    bool _3165 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3167 = isnan(_1106);
    bool _3169 = _3165 || _3167;
    bool _3171 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3173 = _3169 || _3171;
    float _3175 = float(_3173);
    float _3177 = as_type<float>(_1268) * _3155;
    float _3179 = -_3123;
    float _3181 = _3179 + 1.0;
    int _3183 = ~_1198;
    int _3185 = _3183 + 1;
    float _3187 = trunc(_3051);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    float _3193 = _3145 * _3159;
    float _3195 = _3175 * _3181;
    float _3197 = -_3145;
    float _3199 = _3197 + 1.0;
    int _3201 = _3185 * int(_3107);
    int _3203 = _3201 + _2215;
    float _3205 = -_3175;
    float _3207 = _3205 + 1.0;
    int _3209 = _3163 * int(_3151);
    int _3211 = _3209 + _1903;
    float _3213 = _2925 * _3195;
    float _3215 = trunc(_3177);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    float _3221 = _3123 * _3199;
    float _3223 = _2979 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3225 = fma(_3207, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3213);
    float _3227 = float(uint(_3211));
    float _3229 = _2795 + _1597;
    int _3231 = ~_1184;
    int _3233 = _3231 + 1;
    float _3235 = fma(_2991, _3221, _3225);
    float _3237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3239 = _2815 + _3237;
    float _3241 = as_type<float>(_1305) * _3227;
    float _3243 = float(uint(_3203));
    float _3245 = fma(_2993, _3193, _3235);
    int _3247 = ~_1204;
    int _3249 = _3247 + 1;
    float _3251 = trunc(_3241);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    int _3257 = ~as_type<int>(_3223);
    int _3259 = _3257 + 1;
    int _3261 = _3259 + 1;
    float _3263 = as_type<float>(_1246) * _3243;
    int _3265 = int(_2931) + int(_3191);
    float _3267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3269 = _3027 + _3267;
    int _3271 = int(_3033) + int(_3219);
    float _3273 = fma(_2955, _3153, _3245);
    int _3275 = _3261;
    float _3277 = _3223;
    float _3279 = _3221;
    if (!_2969)
    {
        int _3281 = ~as_type<int>(_3223);
        int _3283 = _3281 + 1;
        _3275 = _3283;
    }
    int _3285 = _3275;
    float _3287 = trunc(_3263);
    float _3289 = precise::max(_3287, 0.0);
    uint _3291 = uint(_3289);
    int _3293 = _3233 * _3265;
    int _3295 = _3293 + _1827;
    int _3297 = ~_1218;
    int _3299 = _3297 + 1;
    float _3301 = fma(_3083, _3133, _3273);
    float _3303 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3305 = uint(_3295) >= uint(_1184);
    int _3307 = _3249 * _3271;
    int _3309 = _3307 + _1855;
    float _3311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3313 = int(_3151) + int(_3255);
    float _3315 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3317 = !_3305;
    int _3319 = _3317 ? 0 : (-1);
    float _3321 = _1427 * 2.0;
    bool _3323 = uint(_3309) >= uint(_1204);
    float _3325 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3327 = -_3315;
    float _3329 = fma(_3303, 2.0, _3327);
    int _3331 = int(_3107) + int(_3291);
    int _3333 = _3299 * _3313;
    int _3335 = _3333 + _1903;
    int _3337 = ~_1198;
    int _3339 = _3337 + 1;
    float _3341 = floor(_3321);
    bool _3343 = !_3323;
    int _3345 = _3343 ? 0 : (-1);
    float _3347 = -_168;
    float _3349 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3329);
    bool _3351 = uint(_3335) >= uint(_1218);
    float _3353 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3325);
    float _3355 = _3311 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3359 = _3229 + _3357;
    bool _3361 = !_3351;
    int _3363 = _3361 ? 0 : (-1);
    float _3365 = fma(_3355, _1321, -0.5);
    int _3367 = _3339 * _3331;
    int _3369 = _3367 + _2215;
    float _3371 = fma(_3359, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3353);
    bool _3373 = uint(_3369) >= uint(_1198);
    float _3375 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3381 = !_3373;
    int _3383 = _3381 ? 0 : (-1);
    float _3385 = fma(as_type<float>(_1435), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3375);
    bool _3387 = _3371 >= 0.0;
    float _3389 = as_type<float>(_1435) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3391 = fma(as_type<float>(_1433), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3377);
    float _3393 = as_type<float>(_1433) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3395 = _1112 + _1417;
    float _3397 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3385);
    float _3399 = fma(_3393, -2.0, _3379);
    float _3401 = _3395 + (-1.0);
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3405 = ~_3271;
    int _3407 = _3405 + _3345;
    int _3409 = _3407 + 1;
    float _3411 = fma(_2961, _3109, _3301);
    float _3413 = fma(_3401, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3415 = _3401;
    if (_3387)
    {
        _3415 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3417 = _3415;
    float _3419 = -_3403;
    float _3421 = fma(_3389, 2.0, _3419);
    int _3423 = ~_3265;
    int _3425 = _3423 + _3319;
    int _3427 = _3425 + 1;
    bool _3429 = !_2357;
    int _3431 = _3429 ? 0 : 1;
    int _3433 = as_type<int>(_3417);
    if (_3387)
    {
        float _3435 = _3417 * 5.0;
        _3433 = as_type<int>(_3435);
    }
    int _3437 = _3433;
    int _3439 = _2477 & 3;
    bool _3441 = _3439 != 0;
    float _3443 = fma(_3017, _3089, _3411);
    int _3445 = _1184 * _3427;
    int _3447 = _3445 + _1827;
    if (_3387)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11697 = as_type<float>(_3437);
        out.gl_Position.z = _11697;
    }
    bool _3449 = !_3441;
    int _3451 = _3449 ? 0 : 1;
    float _3453 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3443);
    int _3455 = _2561 & 3;
    bool _3457 = _3455 != 0;
    float _3459 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3461 = _1204 * _3409;
    int _3463 = _3461 + _1855;
    bool _3465 = !_3457;
    int _3467 = _3465 ? 0 : 1;
    float _3469 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3459);
    int _3471 = _2615 & 3;
    bool _3473 = _3471 != 0;
    out.m_77.x = _3453;
    float _3475 = _3269 * _3269;
    bool _3477 = !_3473;
    int _3479 = _3477 ? 0 : 1;
    float _3481 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3391);
    bool _3483 = _2355 != 3;
    float _3485 = fma(_3239, _3239, _3475);
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3489 = fma(_3359, _3359, _3485);
    bool _3491 = !_3483;
    int _3493 = _3491 ? 0 : (-1);
    float _3495 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3497 = _2337 >> 31;
    float _3499 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3501 = _2489 != 3;
    float _3503 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3495);
    float _3505 = _2945 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3507 = _3497 & 3;
    float _3509 = rsqrt(_3489);
    int _3511 = _2561 >> 31;
    float _3513 = fma(_3505, -2.0, _3499);
    int _3515 = _2477 >> 31;
    float _3517 = fma(_2953, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3487);
    int _3519 = _2337 + _3507;
    float _3521 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3523 = _3515 & 3;
    float _3525 = -_168;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3421);
    int _3529 = _3519 >> 2;
    float _3531 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3399);
    int _3533 = _2477 + _3523;
    float _3535 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3517);
    int _3537 = _2615 >> 31;
    float _3539 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3469);
    int _3541 = _3511 & 3;
    float _3543 = _3239 * _3509;
    int _3545 = _3533 >> 2;
    float _3547 = _3269 * _3509;
    int _3549 = _3529 << 4;
    int _3551 = _3549 + 368;
    float _3553 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3513);
    bool _3555 = !_3501;
    int _3557 = _3555 ? 0 : (-1);
    float _3559 = -_3547;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3269);
    bool _3563 = _2577 != 3;
    if (_3387)
    {
        out.m_53.x = 0.0;
    }
    if (_2887)
    {
        _3277 = _1417;
    }
    float _3565 = _3277;
    float _3567 = _3561 * _3561;
    float _3569 = _3565;
    if (_2887)
    {
        _3279 = _1112;
    }
    float _3571 = _3279;
    int _3573 = _3537 & 3;
    float _3575 = _3571;
    if (!_2887)
    {
        _3569 = _1427;
    }
    float _3577 = _3569;
    uint _3579 = uint(int(uint(_3551) >> uint(2)));
    uint _3581 = uint(int(uint(int(_3579)) >> uint(2)));
    int _3583 = int(_3579) & 3;
    float _3585 = (*spvDescriptorSet0.vp_c9)._m0[int(_3581)][_3583];
    int _3587 = int(_3579) + 1;
    uint _3589 = uint(int(uint(_3587) >> uint(2)));
    int _3591 = _3587 & 3;
    float _3593 = (*spvDescriptorSet0.vp_c9)._m0[int(_3589)][_3591];
    if (!_2887)
    {
        _3575 = _1417;
    }
    float _3595 = _3575;
    int _3597 = _2561 + _3541;
    float _3599 = _3577 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3601 = _3545 << 4;
    int _3603 = _3601 + 512;
    float _3605 = _3595 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3607 = _3341 > 0.0;
    float _3609 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3611 = int(_3609);
    bool _3613 = _3341 >= 0.0;
    bool _3615 = isnan(_3341);
    bool _3617 = _3613 || _3615;
    bool _3619 = isnan(0.0);
    bool _3621 = _3617 || _3619;
    uint _3623 = uint(int(uint(_3603) >> uint(2)));
    uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
    int _3627 = int(_3623) & 3;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[int(_3625)][_3627];
    int _3631 = int(_3623) + 1;
    uint _3633 = uint(int(uint(_3631) >> uint(2)));
    int _3635 = _3631 & 3;
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[int(_3633)][_3635];
    bool _3639 = _2625 != 3;
    float _3641 = -_3543;
    float _3643 = fma(_3641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3239);
    int _3645 = _2615 + _3573;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3649 = _3597 >> 2;
    float _3651 = fma(_3643, _3643, _3567);
    float _3653 = -_3647;
    float _3655 = fma(_3521, 2.0, _3653);
    bool _3657 = !_2311;
    int _3659 = _3657 ? _3447 : (-1);
    float _3661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3663 = int(_3661);
    bool _3665 = !_2451;
    int _3667 = _3665 ? _3463 : (-1);
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3671 = !_3639;
    int _3673 = _3671 ? 0 : (-1);
    float _3675 = _2965 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3677 = _3645 >> 2;
    int _3679 = _3649 << 4;
    int _3681 = _3679 + 656;
    int _3683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3685 = _3683 != 0;
    int _3687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3689 = _3687 != 0;
    int _3691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3693 = _3691 != 0;
    float _3695 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3697 = _3677 << 4;
    int _3699 = _3697 + 800;
    uint _3701 = uint(int(uint(_3681) >> uint(2)));
    uint _3703 = uint(int(uint(int(_3701)) >> uint(2)));
    int _3705 = int(_3701) & 3;
    float _3707 = (*spvDescriptorSet0.vp_c9)._m0[int(_3703)][_3705];
    int _3709 = int(_3701) + 1;
    uint _3711 = uint(int(uint(_3709) >> uint(2)));
    int _3713 = _3709 & 3;
    float _3715 = (*spvDescriptorSet0.vp_c9)._m0[int(_3711)][_3713];
    float _3717 = -_3669;
    float _3719 = fma(_3695, 2.0, _3717);
    float _3721 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3723 = _3621 ? 0 : 1;
    uint _3725 = uint(int(uint(_3699) >> uint(2)));
    uint _3727 = uint(int(uint(int(_3725)) >> uint(2)));
    int _3729 = int(_3725) & 3;
    float _3731 = (*spvDescriptorSet0.vp_c9)._m0[int(_3727)][_3729];
    int _3733 = int(_3725) + 1;
    uint _3735 = uint(int(uint(_3733) >> uint(2)));
    int _3737 = _3733 & 3;
    float _3739 = (*spvDescriptorSet0.vp_c9)._m0[int(_3735)][_3737];
    float _3741 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3743 = -_3721;
    float _3745 = fma(_3599, 2.0, _3743);
    float _3747 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3749 = ~_3313;
    int _3751 = _3749 + _3363;
    int _3753 = _3751 + 1;
    float _3755 = fma(_3605, -2.0, _3741);
    int _3757 = ~_3331;
    int _3759 = _3757 + _3383;
    int _3761 = _3759 + 1;
    float _3763 = fma(_3675, -2.0, _3747);
    int _3765 = _3551 + 8;
    uint _3767 = uint(int(uint(_3765) >> uint(2)));
    uint _3769 = uint(int(uint(int(_3767)) >> uint(2)));
    int _3771 = int(_3767) & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = int(_3767) + 1;
    uint _3777 = uint(int(uint(_3775) >> uint(2)));
    int _3779 = _3775 & 3;
    float _3781 = (*spvDescriptorSet0.vp_c9)._m0[int(_3777)][_3779];
    int _3783 = ~_3723;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    float _3789 = -_168;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3719);
    int _3793 = _3787;
    if (!_3607)
    {
        int _3795 = ~_3723;
        int _3797 = _3795 + 1;
        _3793 = _3797;
    }
    int _3799 = _3793;
    int _3801 = _1198 * _3761;
    int _3803 = _3801 + _2215;
    int _3805 = abs(_2569);
    float _3807 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3763);
    int _3809 = abs(_2413);
    int _3811 = _3681 + 8;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = abs(_2641);
    int _3831 = _1218 * _3753;
    int _3833 = _3831 + _1903;
    int _3835 = ~_3809;
    int _3837 = _3835 + 1;
    int _3839 = _3837 + 1;
    float _3841 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3843 = int(_3841);
    int _3845 = ~_3805;
    int _3847 = _3845 + 1;
    int _3849 = _3847 + 1;
    float _3851 = -_168;
    float _3853 = fma(_3851, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3745);
    int _3855 = abs(_3467);
    int _3857 = _3603 + 8;
    uint _3859 = uint(int(uint(_3857) >> uint(2)));
    uint _3861 = uint(int(uint(int(_3859)) >> uint(2)));
    int _3863 = int(_3859) & 3;
    float _3865 = (*spvDescriptorSet0.vp_c9)._m0[int(_3861)][_3863];
    int _3867 = int(_3859) + 1;
    uint _3869 = uint(int(uint(_3867) >> uint(2)));
    int _3871 = _3867 & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = _3839 * as_type<int>(_3593);
    int _3877 = abs(_3479);
    int _3879 = _3849 * as_type<int>(_3637);
    int _3881 = abs(_3431);
    float _3883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3885 = abs(_2687);
    float _3887 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3755);
    int _3889 = _3699 + 8;
    uint _3891 = uint(int(uint(_3889) >> uint(2)));
    uint _3893 = uint(int(uint(int(_3891)) >> uint(2)));
    int _3895 = int(_3891) & 3;
    float _3897 = (*spvDescriptorSet0.vp_c9)._m0[int(_3893)][_3895];
    int _3899 = int(_3891) + 1;
    uint _3901 = uint(int(uint(_3899) >> uint(2)));
    int _3903 = _3899 & 3;
    float _3905 = (*spvDescriptorSet0.vp_c9)._m0[int(_3901)][_3903];
    int _3907 = ~_3829;
    int _3909 = _3907 + 1;
    int _3911 = _3909 + 1;
    int _3913 = ~_3885;
    int _3915 = _3913 + 1;
    int _3917 = _3915 + 1;
    int _3919 = _3911 * as_type<int>(_3715);
    int _3921 = abs(_3451);
    int _3923 = ~_3881;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    float _3929 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3931 = ~_3877;
    int _3933 = _3931 + 1;
    int _3935 = _3933 + 1;
    int _3937 = _3917 * as_type<int>(_3739);
    int _3939 = ~_3921;
    int _3941 = _3939 + 1;
    int _3943 = _3941 + 1;
    int _3945 = _3927 * as_type<int>(_3585);
    int _3947 = _3945 + _3875;
    int _3949 = abs(_2471);
    int _3951 = _3935 * as_type<int>(_3731);
    int _3953 = _3951 + _3937;
    int _3955 = ~_3855;
    int _3957 = _3955 + 1;
    int _3959 = _3957 + 1;
    float _3961 = fma(_2967, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3929);
    int _3963 = abs(_2623);
    float _3965 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3967 = int(_3965);
    int _3969 = _3943 * as_type<int>(_3629);
    int _3971 = _3969 + _3879;
    int _3973 = abs(_3493);
    int _3975 = _3959 * as_type<int>(_3707);
    int _3977 = _3975 + _3919;
    int _3979 = ~_3949;
    int _3981 = _3979 + 1;
    int _3983 = _3981 + 1;
    float _3985 = _3883 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _3987 = ~_3963;
    int _3989 = _3987 + 1;
    int _3991 = _3989 + 1;
    float _3993 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3961);
    int _3995 = abs(_2547);
    int _3997 = _3983 * as_type<int>(_3773);
    int _3999 = _3997 + _3947;
    float _4001 = float(uint(_3663));
    int _4003 = _3991 * as_type<int>(_3819);
    int _4005 = _4003 + _3977;
    int _4007 = ~_3973;
    int _4009 = _4007 + 1;
    int _4011 = _4009 + 1;
    float _4013 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4015 = log2(_4013);
    int _4017 = abs(_2495);
    float _4019 = fma(_3985, _2801, -0.5);
    int _4021 = ~_3995;
    int _4023 = _4021 + 1;
    int _4025 = _4023 + 1;
    int _4027 = _4011 * as_type<int>(_3781);
    int _4029 = _4027 + _3999;
    int _4031 = abs(_3557);
    int _4033 = ~_4017;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = 1.0 / _4001;
    bool _4041 = !_3563;
    int _4043 = _4041 ? 0 : (-1);
    int _4045 = _4025 * as_type<int>(_3865);
    int _4047 = _4045 + _3971;
    int _4049 = ~_4031;
    int _4051 = _4049 + 1;
    int _4053 = _4051 + 1;
    int _4055 = _4029 * _4037;
    float _4057 = float(uint(_3967));
    int _4059 = abs(_2677);
    int _4061 = _4053 * as_type<int>(_3873);
    int _4063 = _4061 + _4047;
    int _4065 = abs(_4043);
    float _4067 = 1.0 / _4057;
    int _4069 = abs(_2575);
    int _4071 = _3659 * _4017;
    int _4073 = _4071 + _4055;
    float _4075 = float(uint(_3611));
    int _4077 = ~_4065;
    int _4079 = _4077 + 1;
    int _4081 = _4079 + 1;
    int _4083 = ~_4059;
    int _4085 = _4083 + 1;
    int _4087 = _4085 + 1;
    float _4089 = 1.0 / _4075;
    int _4091 = ~_4069;
    int _4093 = _4091 + 1;
    int _4095 = _4093 + 1;
    int _4097 = _4081 * as_type<int>(_3827);
    int _4099 = _4097 + _4005;
    int _4101 = abs(_3673);
    int _4103 = _4087 * as_type<int>(_3897);
    int _4105 = _4103 + _3953;
    int _4107 = as_type<int>(_4039) + (-2);
    int _4109 = _4095 * _4063;
    int _4111 = abs(_2711);
    float _4113 = float(uint(_4073));
    int _4115 = _3667 * _4069;
    int _4117 = _4115 + _4109;
    float _4119 = float(uint(_3843));
    int _4121 = abs(_2813);
    float _4123 = as_type<float>(_4107) * _4113;
    int _4125 = ~_4101;
    int _4127 = _4125 + 1;
    int _4129 = _4127 + 1;
    int _4131 = ~_4111;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    float _4137 = 1.0 / _4119;
    bool _4139 = _1218 == 0;
    int _4141 = _4129 * as_type<int>(_3905);
    int _4143 = _4141 + _4105;
    int _4145 = _4135 * _4099;
    bool _4147 = !_4139;
    int _4149 = _4147 ? _3833 : (-1);
    float _4151 = _4015 * _168;
    int _4153 = ~_4121;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    float _4159 = trunc(_4123);
    float _4161 = precise::max(_4159, 0.0);
    uint _4163 = uint(_4161);
    int _4165 = as_type<int>(_4067) + (-2);
    int _4167 = _4149 * _4111;
    int _4169 = _4167 + _4145;
    float _4171 = float(uint(_4117));
    int _4173 = _4157 * _4143;
    bool _4175 = _1198 == 0;
    float _4177 = _3359 * _3509;
    int _4179 = as_type<int>(_4089) + (-2);
    float _4181 = as_type<float>(_4165) * _4171;
    bool _4183 = !_4175;
    int _4185 = _4183 ? _3803 : (-1);
    float _4187 = exp2(_4151);
    float _4189 = float(uint(_4169));
    int _4191 = ~_3663;
    int _4193 = _4191 + 1;
    int _4195 = _4185 * _4121;
    int _4197 = _4195 + _4173;
    int _4199 = as_type<int>(_4137) + (-2);
    float _4201 = as_type<float>(_4179) * _4189;
    int _4203 = abs(_3663);
    float _4205 = trunc(_4181);
    float _4207 = precise::max(_4205, 0.0);
    uint _4209 = uint(_4207);
    float _4211 = float(uint(_4197));
    int _4213 = _4193 * int(_4163);
    int _4215 = _4213 + _4073;
    float _4217 = float(uint(_4203));
    float _4219 = -_4177;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3359);
    int _4223 = abs(_3967);
    float _4225 = as_type<float>(_4199) * _4211;
    float _4227 = float(uint(_4215));
    float _4229 = trunc(_4201);
    float _4231 = precise::max(_4229, 0.0);
    uint _4233 = uint(_4231);
    int _4235 = ~_3967;
    int _4237 = _4235 + 1;
    float _4239 = fma(_4221, _4221, _3651);
    int _4241 = ~_3611;
    int _4243 = _4241 + 1;
    float _4245 = as_type<float>(_4107) * _4227;
    float _4247 = float(uint(_4223));
    int _4249 = abs(_3611);
    float _4251 = trunc(_4225);
    float _4253 = precise::max(_4251, 0.0);
    uint _4255 = uint(_4253);
    int _4257 = _4237 * int(_4209);
    int _4259 = _4257 + _4117;
    int _4261 = ~_3843;
    int _4263 = _4261 + 1;
    float _4265 = float(uint(_4259));
    float _4267 = 1.0 / _4217;
    int _4269 = _4243 * int(_4233);
    int _4271 = _4269 + _4169;
    float _4273 = as_type<float>(_4165) * _4265;
    float _4275 = float(uint(_4249));
    float _4277 = float(uint(_4271));
    float _4279 = 1.0 / _4247;
    int _4281 = _4263 * int(_4255);
    int _4283 = _4281 + _4197;
    int _4285 = abs(_3843);
    float _4287 = as_type<float>(_4179) * _4277;
    int _4289 = abs(_4073);
    float _4291 = float(uint(_4283));
    float _4293 = 1.0 / _4275;
    float _4295 = float(uint(_4285));
    int _4297 = abs(_4117);
    float _4299 = as_type<float>(_4199) * _4291;
    int _4301 = as_type<int>(_4267) + (-2);
    float _4303 = float(uint(_4289));
    float _4305 = 1.0 / _4295;
    int _4307 = as_type<int>(_4279) + (-2);
    int _4309 = abs(_4169);
    float _4311 = as_type<float>(_4301) * _4303;
    float _4313 = float(uint(_4297));
    float _4315 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4317 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4319 = isnan(1.0);
    bool _4321 = _4317 || _4319;
    bool _4323 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4325 = _4321 || _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4329 = 1.0 + _4327;
    float _4331 = as_type<float>(_4307) * _4313;
    float _4333 = trunc(_4311);
    float _4335 = precise::max(_4333, 0.0);
    uint _4337 = uint(_4335);
    float _4339 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4315);
    int _4341 = as_type<int>(_4293) + (-2);
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4345 = float(uint(_4309));
    float _4347 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4349 = abs(_4197);
    float _4351 = 1.0 / _4329;
    float _4353 = as_type<float>(_4341) * _4345;
    int _4355 = as_type<int>(_4305) + (-2);
    float _4357 = -_4187;
    float _4359 = _4357 + 1.0;
    float _4361 = float(uint(_4349));
    float _4363 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4367 = isnan(0.0);
    bool _4369 = _4365 || _4367;
    bool _4371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4373 = _4369 || _4371;
    float _4375 = trunc(_4331);
    float _4377 = precise::max(_4375, 0.0);
    uint _4379 = uint(_4377);
    float _4381 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4343);
    float _4383 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4347);
    float _4385 = as_type<float>(_4355) * _4361;
    int _4387 = ~_4203;
    int _4389 = _4387 + 1;
    float _4391 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4363);
    float _4393 = _4373 ? _4359 : 0.0;
    float _4395 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4381);
    float _4397 = trunc(_4353);
    float _4399 = precise::max(_4397, 0.0);
    uint _4401 = uint(_4399);
    int _4403 = ~_4223;
    int _4405 = _4403 + 1;
    float _4407 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3503);
    int _4409 = _4389 * int(_4337);
    int _4411 = _4409 + _4289;
    float _4413 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4391);
    float _4415 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4339);
    float _4417 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4383);
    int _4419 = ~_4285;
    int _4421 = _4419 + 1;
    float _4423 = trunc(_4273);
    float _4425 = precise::max(_4423, 0.0);
    uint _4427 = uint(_4425);
    float _4429 = float(uint(_4411));
    float _4431 = -_3553;
    float _4433 = fma(_4407, _4019, _4431);
    float _4435 = as_type<float>(_4301) * _4429;
    float _4437 = trunc(_4245);
    float _4439 = precise::max(_4437, 0.0);
    uint _4441 = uint(_4439);
    float _4443 = trunc(_4385);
    float _4445 = precise::max(_4443, 0.0);
    uint _4447 = uint(_4445);
    float _4449 = -_168;
    float _4451 = fma(_4449, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3655);
    float _4453 = _4177;
    if (_4325)
    {
        float _4455 = _4393 * _4351;
        _170 = _4455;
    }
    float _4457 = _170;
    int _4459 = _4405 * int(_4379);
    int _4461 = _4459 + _4297;
    int _4463 = ~_4249;
    int _4465 = _4463 + 1;
    float _4467 = fma(_3535, _3365, _4451);
    int _4469 = int(_4209) + int(_4427);
    float _4471 = trunc(_4287);
    float _4473 = precise::max(_4471, 0.0);
    uint _4475 = uint(_4473);
    int _4477 = int(_4163) + int(_4441);
    float _4479 = trunc(_4299);
    float _4481 = precise::max(_4479, 0.0);
    uint _4483 = uint(_4481);
    float _4485 = float(uint(_4461));
    int _4487 = _4465 * int(_4401);
    int _4489 = _4487 + _4309;
    int _4491 = _4421 * int(_4447);
    int _4493 = _4491 + _4349;
    float _4495 = as_type<float>(_4307) * _4485;
    int _4497 = ~_3663;
    int _4499 = _4497 + 1;
    float _4501 = trunc(_4435);
    float _4503 = precise::max(_4501, 0.0);
    uint _4505 = uint(_4503);
    float _4507 = float(uint(_4489));
    int _4509 = int(_4233) + int(_4475);
    float _4511 = as_type<float>(_4341) * _4507;
    int _4513 = ~_3967;
    int _4515 = _4513 + 1;
    float _4517 = trunc(_4495);
    float _4519 = precise::max(_4517, 0.0);
    uint _4521 = uint(_4519);
    int _4523 = int(_4255) + int(_4483);
    int _4525 = _4499 * _4477;
    int _4527 = _4525 + _4073;
    float _4529 = float(uint(_4493));
    int _4531 = ~_3843;
    int _4533 = _4531 + 1;
    float _4535 = as_type<float>(_4355) * _4529;
    int _4537 = ~_3611;
    int _4539 = _4537 + 1;
    float _4541 = trunc(_4511);
    float _4543 = precise::max(_4541, 0.0);
    uint _4545 = uint(_4543);
    bool _4547 = uint(_4527) >= uint(_3663);
    int _4549 = _4515 * _4469;
    int _4551 = _4549 + _4117;
    bool _4553 = uint(_4551) >= uint(_3967);
    float _4555 = trunc(_4535);
    float _4557 = precise::max(_4555, 0.0);
    uint _4559 = uint(_4557);
    int _4561 = _4533 * _4523;
    int _4563 = _4561 + _4197;
    bool _4565 = !_4547;
    int _4567 = _4565 ? 0 : (-1);
    int _4569 = _4539 * _4509;
    int _4571 = _4569 + _4169;
    int _4573 = int(_4337) + int(_4505);
    int _4575 = int(_4379) + int(_4521);
    bool _4577 = uint(_4571) >= uint(_3611);
    float _4579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4581 = !_4553;
    int _4583 = _4581 ? 0 : (-1);
    bool _4585 = uint(_4563) >= uint(_3843);
    int _4587 = ~_4223;
    int _4589 = _4587 + 1;
    int _4591 = ~_4203;
    int _4593 = _4591 + 1;
    int _4595 = int(_4447) + int(_4559);
    int _4597 = _4593 * _4573;
    int _4599 = _4597 + _4289;
    int _4601 = ~_4285;
    int _4603 = _4601 + 1;
    float _4605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4607 = int(_4401) + int(_4545);
    int _4609 = _4589 * _4575;
    int _4611 = _4609 + _4297;
    int _4613 = ~_4249;
    int _4615 = _4613 + 1;
    int _4617 = _4603 * _4595;
    int _4619 = _4617 + _4349;
    bool _4621 = !_4577;
    int _4623 = _4621 ? 0 : (-1);
    float _4625 = _4579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4627 = uint(_4599) >= uint(_4203);
    int _4629 = _4615 * _4607;
    int _4631 = _4629 + _4309;
    bool _4633 = !_4585;
    int _4635 = _4633 ? 0 : (-1);
    float _4637 = fma(_4625, _1595, -0.5);
    bool _4639 = uint(_4611) >= uint(_4223);
    int _4641 = ~_4477;
    int _4643 = _4641 + _4567;
    int _4645 = _4643 + 1;
    float _4647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4649 = !_4639;
    int _4651 = _4649 ? 0 : (-1);
    float _4653 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4655 = ~_4469;
    int _4657 = _4655 + _4583;
    int _4659 = _4657 + 1;
    int _4661 = _3663 * _4645;
    int _4663 = _4661 + _4073;
    bool _4665 = uint(_4619) >= uint(_4285);
    float _4667 = _4605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4669 = ~_4523;
    int _4671 = _4669 + _4635;
    int _4673 = _4671 + 1;
    int _4675 = _3967 * _4659;
    int _4677 = _4675 + _4117;
    bool _4679 = !_4665;
    int _4681 = _4679 ? 0 : (-1);
    float _4683 = fma(_4667, _2713, -0.5);
    bool _4685 = _3967 == 0;
    int _4687 = _3843 * _4673;
    int _4689 = _4687 + _4197;
    int _4691 = ~_4509;
    int _4693 = _4691 + _4623;
    int _4695 = _4693 + 1;
    bool _4697 = !_4685;
    int _4699 = _4697 ? _4677 : (-1);
    float _4701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4703 = _3843 == 0;
    bool _4705 = !_4627;
    int _4707 = _4705 ? 0 : (-1);
    int _4709 = _4073 ^ _3663;
    bool _4711 = uint(_4631) >= uint(_4249);
    int _4713 = _3611 * _4695;
    int _4715 = _4713 + _4169;
    bool _4717 = !_4703;
    int _4719 = _4717 ? _4689 : (-1);
    bool _4721 = _3967 == 0;
    int _4723 = _4117 ^ _3967;
    float _4725 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4727 = uint(int(uint(_4709) >> uint(31)));
    float _4729 = _4653 * _4701;
    bool _4731 = !_4711;
    int _4733 = _4731 ? 0 : (-1);
    float _4735 = _4725 * _4647;
    bool _4737 = _3663 == 0;
    float _4739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4741 = uint(int(uint(_4723) >> uint(31)));
    int _4743 = ~_4707;
    int _4745 = _4573 + _4743;
    int _4747 = _4745 + 1;
    out.m_79.x = _4735;
    out.m_79.y = _4729;
    int _4749 = ~int(_4727);
    int _4751 = _4749 + 1;
    bool _4753 = !_4737;
    int _4755 = _4753 ? _4663 : (-1);
    float _4757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4759 = _3611 == 0;
    int _4761 = ~_4651;
    int _4763 = _4575 + _4761;
    int _4765 = _4763 + 1;
    int _4767 = ~int(_4741);
    int _4769 = _4767 + 1;
    int _4771 = _4747 ^ _4751;
    float _4773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4775 = !_4759;
    int _4777 = _4775 ? _4715 : (-1);
    int _4779 = _4765 ^ _4769;
    bool _4781 = _3663 == 0;
    int _4783 = ~_4751;
    int _4785 = _4783 + _4771;
    int _4787 = _4785 + 1;
    float _4789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4791 = ~_4769;
    int _4793 = _4791 + _4779;
    int _4795 = _4793 + 1;
    float _4797 = _4757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4799 = !_4781;
    int _4801 = _4799 ? _4787 : (-1);
    bool _4803 = _3611 == 0;
    float _4805 = fma(_4797, _1583, -0.5);
    int _4807 = _4169 ^ _3611;
    float _4809 = float(_4755);
    bool _4811 = !_4721;
    int _4813 = _4811 ? _4795 : (-1);
    float _4815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4817 = _3843 == 0;
    float _4819 = fma(_4625, _4809, _3349);
    int _4821 = _4197 ^ _3843;
    float _4823 = _4739 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4825 = float(_4777);
    float _4827 = fma(_4415, _4637, _4819);
    uint _4829 = uint(int(uint(_4821) >> uint(31)));
    float _4831 = fma(_4823, _1643, -0.5);
    int _4833 = ~_4681;
    int _4835 = _4595 + _4833;
    int _4837 = _4835 + 1;
    float _4839 = fma(_4823, _4825, _3853);
    int _4841 = ~int(_4829);
    int _4843 = _4841 + 1;
    float _4845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4847 = float(_4699);
    float _4849 = fma(_4417, _4831, _4839);
    int _4851 = _4837 ^ _4843;
    uint _4853 = uint(int(uint(_4807) >> uint(31)));
    float _4855 = fma(_4797, _4847, _3791);
    float _4857 = float(_4719);
    float _4859 = _4773 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4861 = ~_4843;
    int _4863 = _4861 + _4851;
    int _4865 = _4863 + 1;
    float _4867 = fma(_3539, _4805, _4855);
    int _4869 = ~_4733;
    int _4871 = _4607 + _4869;
    int _4873 = _4871 + 1;
    float _4875 = fma(_4859, _2361, -0.5);
    int _4877 = ~int(_4853);
    int _4879 = _4877 + 1;
    float _4881 = fma(_4859, _4857, _3527);
    float _4883 = float(_4801);
    float _4885 = _4845 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4887 = !_4817;
    int _4889 = _4887 ? _4865 : (-1);
    float _4891 = fma(_3397, _4875, _4881);
    int _4893 = _4873 ^ _4879;
    float _4895 = -_2831;
    float _4897 = fma(_4667, _4883, _4895);
    float _4899 = float(_4813);
    float _4901 = _4789 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4903 = float(_4889);
    float _4905 = _4815 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4907 = ~_4879;
    int _4909 = _4907 + _4893;
    int _4911 = _4909 + 1;
    float _4913 = fma(_4901, _2723, -0.5);
    float _4915 = -_3807;
    float _4917 = fma(_4901, _4899, _4915);
    float _4919 = fma(_4885, _2741, -0.5);
    bool _4921 = !_4803;
    int _4923 = _4921 ? _4911 : (-1);
    float _4925 = -_3531;
    float _4927 = fma(_4885, _4903, _4925);
    float _4929 = fma(_4395, _4683, _4897);
    float _4931 = fma(_3993, _4913, _4917);
    float _4933 = float(_4923);
    float _4935 = fma(_3481, _4919, _4927);
    float _4937 = fma(_4905, _2737, -0.5);
    float _4939 = _4849 + 0.5;
    float _4941 = _4467 + 0.5;
    float _4943 = -_3887;
    float _4945 = fma(_4905, _4933, _4943);
    float _4947 = _4935 + 0.5;
    float _4949 = _4433 + 0.5;
    float _4951 = in.m_81.x;
    float _4953 = in.m_81.y;
    float _4955 = in.m_81.z;
    float _4957 = fma(_4413, _4937, _4945);
    float _4959 = _4827 + 0.5;
    float _4961 = _4867 + 0.5;
    float _4963 = _4929 + 0.5;
    float _4965 = _4957 + 0.5;
    float _4967 = _4931 + 0.5;
    float _4969 = _4891 + 0.5;
    bool _4971 = !_3685;
    int _4973 = _4971 ? 0 : 1;
    out.m_83.x = _4941;
    out.m_83.y = _4949;
    bool _4975 = !_3689;
    int _4977 = _4975 ? 0 : 1;
    int _4979 = abs(_4973);
    out.m_85.x = _4959;
    out.m_85.y = _4963;
    out.m_85.z = _4961;
    out.m_85.w = _4967;
    int _4981 = abs(_4977);
    bool _4983 = !_3693;
    int _4985 = _4983 ? 0 : 1;
    out.m_87.x = _4939;
    out.m_87.y = _4965;
    float _4987 = float(_4979);
    out.m_89.x = _4969;
    out.m_89.y = _4947;
    float _4989 = float(_3799);
    float _4991 = _4831;
    float _4993 = as_type<float>(_4631);
    float _4995 = as_type<float>(_4659);
    float _4997 = _4467;
    if (_3387)
    {
        return out;
    }
    float _4999 = -_3547;
    float _5001 = fma(_4999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3027);
    float _5003 = _4987 * _4989;
    float _5005 = float(_2903);
    float _5007 = -_3543;
    float _5009 = fma(_5007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2815);
    float _5011 = float(_4981);
    float _5013 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5015 = _5001 + _5013;
    float _5017 = _5003 * (-2.0);
    float _5019 = -_4177;
    float _5021 = fma(_5019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3229);
    float _5023 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5025 = _5009 + _5023;
    float _5027 = _5015 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5029 = _5011 * _5005;
    float _5031 = _1417 + (-0.5);
    float _5033 = fma(_5017, _4951, _4951);
    float _5035 = _1112 + _1427;
    float _5037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5039 = _5021 + _5037;
    float _5041 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5027);
    float _5043 = fma(_5031, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5033);
    float _5045 = _5035 + (-1.0);
    float _5047 = _5029 * (-2.0);
    float _5049 = fma(_5039, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5041);
    float _5051 = _1112 + (-0.5);
    float _5053 = fma(_5045, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5055 = fma(_5047, _4953, _4953);
    float _5057 = fma(_3413, _5017, _3413);
    bool _5059 = _5049 >= 0.0;
    float _5061 = fma(_5053, _5047, _5053);
    float _5063 = fma(_5051, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5055);
    float _5065 = fma(_5057, _4457, _5043);
    int _5067 = abs(_4985);
    float _5069 = sqrt(_4239);
    float _5071 = fma(_5061, _4457, _5063);
    float _5073 = _5065 * 0.15915493667125701904296875;
    float _5075 = _1417 + _1427;
    float _5077 = _5071 * 0.15915493667125701904296875;
    float _5079 = float(_3285);
    float _5081 = _5047;
    float _5083 = _5029;
    if (_5059)
    {
        _5081 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5085 = _5081;
    float _5087 = _5073 * 6.283185482025146484375;
    float _5089 = sin(_5087);
    float _5091 = float(_5067);
    int _5093 = as_type<int>(_5085);
    if (_5059)
    {
        out.m_53.x = 0.0;
    }
    if (_5059)
    {
        float _5095 = _5085 * 5.0;
        _5093 = as_type<int>(_5095);
    }
    int _5097 = _5093;
    float _5099 = _5091 * _5079;
    float _5101 = _5075 + (-1.0);
    float _5103 = _5073 * 6.283185482025146484375;
    float _5105 = cos(_5103);
    if (_5059)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14120 = as_type<float>(_5097);
        out.gl_Position.z = _14120;
    }
    float _5107 = _5099 * (-2.0);
    float _5109 = _5077 * 6.283185482025146484375;
    float _5111 = sin(_5109);
    if (_5059)
    {
        return out;
    }
    float _5113 = -_3027;
    float _5115 = _5113 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5117 = -_2815;
    float _5119 = _5117 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5121 = fma(_5107, _4955, _4955);
    float _5123 = -_3229;
    float _5125 = _5123 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5127 = _5115 * _5115;
    float _5129 = fma(_5101, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5131 = _1427 + (-0.5);
    float _5133 = _5077 * 6.283185482025146484375;
    float _5135 = cos(_5133);
    float _5137 = fma(_5119, _5119, _5127);
    float _5139 = fma(_5129, _5107, _5129);
    float _5141 = fma(_5131, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5121);
    float _5143 = _3509 * _5069;
    float _5145 = fma(_5125, _5125, _5137);
    float _5147 = _5089 * _5111;
    float _5149 = fma(_5139, _4457, _5141);
    float _5151 = rsqrt(_5145);
    float _5153 = _5149 * 0.15915493667125701904296875;
    float _5155 = in.m_91.x;
    float _5157 = in.m_91.y;
    float _5159 = in.m_91.z;
    float _5161 = _5105 * _5135;
    float _5163 = _5089 * _5135;
    float _5165 = _5153 * 6.283185482025146484375;
    float _5167 = sin(_5165);
    float _5169 = _5119 * _5151;
    float _5171 = _5125 * _5151;
    float _5173 = _5115 * _5151;
    float _5175 = _5153 * 6.283185482025146484375;
    float _5177 = cos(_5175);
    float _5179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5181 = _5169 * _5179;
    float _5183 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5185 = _5171 * _5183;
    float _5187 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5189 = _5173 * _5187;
    float _5191 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5193 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5195 = -_5181;
    float _5197 = fma(_5171, _5193, _5195);
    float _5199 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5201 = -_5185;
    float _5203 = fma(_5173, _5199, _5201);
    float _5205 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5207 = -_5189;
    float _5209 = fma(_5169, _5205, _5207);
    float _5211 = fma(_5167, _5161, _5147);
    float _5213 = _5197 * _5197;
    float _5215 = fma(_5167, _5147, _5161);
    float _5217 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5219 = fma(_5203, _5203, _5213);
    float _5221 = _5105 * _5111;
    float _5223 = _5143 * _5217;
    float _5225 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5227 = fma(_5209, _5209, _5219);
    float _5229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5157);
    float _5231 = _5105 * _5177;
    float _5233 = _5135 * _5177;
    float _5235 = rsqrt(_5227);
    float _5237 = _5229 * _5223;
    float _5239 = _5143 * _5191;
    float _5241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5155);
    float _5243 = _5089 * _5177;
    float _5245 = _5111 * _5177;
    float _5247 = _5143 * _5225;
    float _5249 = _5241 * _5239;
    float _5251 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5159);
    float _5253 = _5231 * _5237;
    float _5255 = -_5221;
    float _5257 = fma(_5167, _5163, _5255);
    float _5259 = -_5163;
    float _5261 = fma(_5167, _5221, _5259);
    float _5263 = _5251 * _5247;
    float _5265 = fma(_5211, _5249, _5253);
    float _5267 = _5243 * _5237;
    float _5269 = _5203 * _5235;
    float _5271 = _5197 * _5235;
    float _5273 = _5209 * _5235;
    float _5275 = -_5237;
    float _5277 = _5167 * _5275;
    float _5279 = _5173 * _5269;
    float _5281 = _5171 * _5271;
    float _5283 = fma(_5261, _5263, _5265);
    float _5285 = fma(_5233, _5249, _5277);
    float _5287 = -_5279;
    float _5289 = fma(_5169, _5271, _5287);
    float _5291 = -_5281;
    float _5293 = fma(_5173, _5273, _5291);
    float _5295 = fma(_5257, _5249, _5267);
    float _5297 = fma(_5245, _5263, _5285);
    float _5299 = _5289 * _5283;
    float _5301 = _5293 * _5283;
    float _5303 = fma(_5215, _5263, _5295);
    float _5305 = fma(_5273, _5297, _5299);
    float _5307 = fma(_5269, _5297, _5301);
    float _5309 = fma(_5171, _5303, _5305);
    float _5311 = fma(_5169, _5303, _5307);
    float _5313 = _3229 + _5309;
    float _5315 = _2815 + _5311;
    float _5317 = _5169 * _5273;
    float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5321 = _5313 + _5319;
    float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5325 = _5315 + _5323;
    float _5327 = -_5317;
    float _5329 = fma(_5171, _5269, _5327);
    float _5331 = _5321 * _5321;
    float _5333 = _5325 * _5325;
    float _5335 = _5329 * _5283;
    float _5337 = _5333 + _5331;
    float _5339 = fma(_5271, _5297, _5335);
    float _5341 = sqrt(_5337);
    float _5343 = fma(_5173, _5303, _5339);
    float _5345 = _3027 + _5343;
    bool _5347 = _5341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5349 = _5315;
    float _5351 = _5313;
    float _5353 = _5333;
    float _5355 = _5331;
    if (!_5347)
    {
        _4991 = _5345;
    }
    float _5357 = _4991;
    bool _5359 = !_5347;
    float _5361 = _5357;
    if (!_5359)
    {
        float _5363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5367 = _5341 + _5365;
        float _5369 = rsqrt(_5337);
        float _5371 = _5367 * _5363;
        float _5373 = _5345 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5375 = _5371 * 0.15915493667125701904296875;
        float _5377 = _5375 * 6.283185482025146484375;
        float _5379 = sin(_5377);
        float _5381 = _5375 * 6.283185482025146484375;
        float _5383 = cos(_5381);
        float _5385 = fma(_5379, _5373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5387 = _5369 * _5385;
        float _5389 = _5383 + (-1.0);
        float _5391 = fma(_5325, _5387, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5393 = fma(_5321, _5387, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5395 = _5389 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5399 = _5391 + _5397;
        float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5403 = _5393 + _5401;
        float _5405 = fma(_5345, _5383, _5395);
        float _5407 = _5399 * _5399;
        float _5409 = _5403 * _5403;
        _5349 = _5391;
        _5351 = _5393;
        _5361 = _5405;
        _5353 = _5407;
        _5355 = _5409;
    }
    float _5411 = _5349;
    float _5413 = _5351;
    float _5415 = _5361;
    float _5417 = _5353;
    float _5419 = _5355;
    float _5421 = fma(_5411, 6.2500002968590706586837768554688e-05, 0.5);
    float _5423 = fma(_5413, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14613 = float2(_5421, _5423);
    float3 _5427 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14613, float2(0.0), isnan(_14613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14613, float2(0.0), isnan(_14613)), level(0.0)).xyz;
    float _5429 = _5427.x;
    float _5431 = _5427.y;
    float _5433 = _5427.z;
    float _5435 = in.m_93.x;
    float _5437 = in.m_93.y;
    float _5439 = in.m_93.z;
    bool _5441 = _5157 != 0.0;
    bool _5443 = isnan(_5157);
    bool _5445 = _5441 || _5443;
    bool _5447 = isnan(0.0);
    bool _5449 = _5445 || _5447;
    float _5451 = in.m_95.x;
    float _5453 = in.m_95.y;
    float _5455 = in.m_95.z;
    float _5457 = in.m_95.w;
    bool _5459 = _5155 == 0.0;
    bool _5461 = !_5449;
    bool _5463 = _5459 && _5461;
    bool _5465 = _5159 == 0.0;
    bool _5467 = _5465 && _5463;
    float _5469 = _5435;
    if (_5467)
    {
        _5083 = _5435;
    }
    float _5471 = _5083;
    float _5473 = _5471;
    if (_5467)
    {
        _2897 = _5439;
    }
    float _5475 = _2897;
    float _5477 = _5475;
    if (_5467)
    {
        _4993 = _5437;
    }
    float _5479 = _4993;
    float _5481 = _5479;
    if (_5467)
    {
        _4995 = _5471;
    }
    float _5483 = _4995;
    float _5485 = _5483;
    if (!_5467)
    {
        _5473 = _5435;
    }
    float _5487 = _5473;
    if (_5467)
    {
        _4997 = _5475;
    }
    float _5489 = _4997;
    float _5491 = _5489;
    if (!_5467)
    {
        _5477 = _5439;
    }
    float _5493 = _5477;
    if (!_5467)
    {
        float _5495 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5487);
        _5485 = _5495;
    }
    float _5497 = _5485;
    if (_5467)
    {
        _5469 = _5479;
    }
    float _5499 = _5469;
    float _5501 = _5455 * _5487;
    float _5503 = _5499;
    if (!_5467)
    {
        _5481 = _5437;
    }
    float _5505 = _5481;
    float _5507 = _5453 * _5493;
    if (!_5467)
    {
        float _5509 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5493);
        _5491 = _5509;
    }
    float _5511 = _5491;
    float _5513 = -_5501;
    float _5515 = fma(_5451, _5493, _5513);
    float _5517 = _5231 * _5329;
    float _5519 = _5451 * _5505;
    float _5521 = -_5507;
    float _5523 = fma(_5455, _5505, _5521);
    if (!_5467)
    {
        float _5525 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5505);
        _5503 = _5525;
    }
    float _5527 = _5503;
    float _5529 = _5211 * _5293;
    float _5531 = -_5519;
    float _5533 = fma(_5453, _5487, _5531);
    float _5535 = _5211 * _5329;
    float _5537 = _5211 * _5289;
    float _5539 = _5231 * _5293;
    float _5541 = _5515 * _5457;
    float _5543 = _5523 * _5457;
    float _5545 = _5231 * _5289;
    float _5547 = _5533 * _5457;
    float _5549 = _5261 * _5293;
    float _5551 = _5261 * _5329;
    float _5553 = _5261 * _5289;
    float _5555 = fma(_5233, _5269, _5529);
    float _5557 = fma(_5233, _5271, _5535);
    float _5559 = -_5167;
    float _5561 = fma(_5559, _5271, _5517);
    float _5563 = fma(_5233, _5273, _5537);
    float _5565 = -_5167;
    float _5567 = fma(_5565, _5269, _5539);
    float _5569 = -_5167;
    float _5571 = fma(_5569, _5273, _5545);
    float _5573 = fma(_5245, _5269, _5549);
    float _5575 = fma(_5245, _5271, _5551);
    float _5577 = fma(_5245, _5273, _5553);
    float _5579 = fma(_5243, _5173, _5561);
    float _5581 = fma(_5257, _5169, _5555);
    float _5583 = fma(_5243, _5169, _5567);
    float _5585 = fma(_5243, _5171, _5571);
    float _5587 = fma(_5215, _5169, _5573);
    float _5589 = fma(_5215, _5173, _5575);
    float _5591 = fma(_5215, _5171, _5577);
    float _5593 = fma(_5257, _5173, _5557);
    float _5595 = _5579 * _5453;
    float _5597 = _5579 * _5527;
    float _5599 = fma(_5257, _5171, _5563);
    float _5601 = _5583 * _5527;
    float _5603 = _5541 * _5583;
    float _5605 = _5541 * _5579;
    float _5607 = _5585 * _5453;
    float _5609 = _5585 * _5527;
    float _5611 = _5541 * _5585;
    float _5613 = fma(_5593, _5451, _5595);
    float _5615 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5617 = _5415 + _5615;
    float _5619 = _5583 * _5453;
    float _5621 = fma(_5581, _5497, _5601);
    float _5623 = fma(_5599, _5451, _5607);
    float _5625 = fma(_5617, _5617, _5417);
    float _5627 = fma(_5581, _5451, _5619);
    float _5629 = fma(_5543, _5581, _5603);
    float _5631 = fma(_5593, _5497, _5597);
    float _5633 = _5625 + _5419;
    float _5635 = fma(_5599, _5497, _5609);
    float _5637 = fma(_5543, _5593, _5605);
    float _5639 = fma(_5543, _5599, _5611);
    float _5641 = fma(_5587, _5455, _5627);
    float _5643 = fma(_5589, _5455, _5613);
    float _5645 = sqrt(_5633);
    float _5647 = fma(_5591, _5455, _5623);
    float _5649 = fma(_5587, _5511, _5621);
    float _5651 = fma(_5547, _5587, _5629);
    float _5653 = fma(_5547, _5589, _5637);
    float _5655 = fma(_5547, _5591, _5639);
    float _5657 = fma(_5589, _5511, _5631);
    float _5659 = fma(_5591, _5511, _5635);
    out.m_97.x = _5641;
    out.m_97.y = _5643;
    out.m_97.z = _5647;
    out.m_99.x = _5651;
    out.m_99.y = _5653;
    out.m_99.z = _5655;
    out.m_101.x = _5649;
    out.m_101.y = _5657;
    out.m_101.z = _5659;
    bool _5661 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5663 = isnan(_5645);
    bool _5665 = _5661 || _5663;
    bool _5667 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5669 = _5665 || _5667;
    float _5671 = _5547;
    if (!_5669)
    {
        _5671 = 1.0;
    }
    float _5673 = _5671;
    out.m_103.x = _5429;
    out.m_103.y = _5431;
    out.m_103.z = _5433;
    bool _5675 = !_5669;
    float _5677 = _5673;
    if (!_5675)
    {
        bool _5679 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5681 = isnan(_5645);
        bool _5683 = _5679 || _5681;
        bool _5685 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5687 = _5683 || _5685;
        if (!_5687)
        {
            float _5689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5691 = _5645 + _5689;
            float _5693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5695 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5693;
            float _5697 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5699 = _5697 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5701 = 1.0 / _5695;
            float _5703 = _5691 * _5701;
            float _5705 = fma(_5703, _5699, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5677 = _5705;
            _5707 = true;
        }
        else
        {
            bool _5709 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5711 = isnan(_5645);
            bool _5713 = _5709 || _5711;
            bool _5715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5717 = _5713 || _5715;
            if (!_5717)
            {
                float _5719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5721 = _5645 + _5719;
                float _5723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5725 = _5723 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5727 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5729 = _5727 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5731 = 1.0 / _5725;
                float _5733 = _5721 * _5731;
                float _5735 = fma(_5733, _5729, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5677 = _5735;
                _5707 = true;
            }
            else
            {
                _5677 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5707 = false;
    float _5737 = _5677;
    float _5739 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5741 = _5415 + _5739;
    float _5743 = _5001 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5745 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5747 = _5411 + _5745;
    float _5749 = fma(_5741, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5751 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5743);
    float _5753 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5755 = _5413 + _5753;
    float _5757 = fma(_5747, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5759 = -_3027;
    float _5761 = _5759 + _5749;
    float _5763 = fma(_5021, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5751);
    float _5765 = fma(_5755, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5767 = -_2815;
    float _5769 = _5767 + _5757;
    float _5771 = _5761 * _5761;
    float _5773 = _5763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5775 = _5001 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5777 = -_3229;
    float _5779 = _5777 + _5765;
    float _5781 = fma(_5769, _5769, _5771);
    float _5783 = 1.0 / _5773;
    float _5785 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5775);
    float _5787 = fma(_5779, _5779, _5781);
    float _5789 = fma(_5021, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5785);
    float _5791 = sqrt(_5787);
    float _5793 = _5789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5795 = _5793 + _5773;
    float _5797 = _5795 * _5783;
    float _5799 = _5797 * 0.5;
    bool _5801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5805 = _5801 || _5803;
    bool _5807 = isnan(0.5);
    bool _5809 = _5805 || _5807;
    float _5811 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5813 = fma(_5799, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5811);
    bool _5815 = _5791 > 0.0;
    float _5817 = 1.0 / _5813;
    bool _5819 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5821 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5823 = _5819 || _5821;
    bool _5825 = isnan(0.5);
    bool _5827 = _5823 || _5825;
    float _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5831 = _5799;
    float _5833 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5835 = _5787;
    float _5837 = _5765;
    float _5839 = _5757;
    if (!_5815)
    {
        _5829 = _5757;
    }
    float _5841 = _5829;
    float _5843 = _5841;
    if (!_5815)
    {
        _5831 = _5749;
    }
    float _5845 = _5831;
    float _5847 = _5845;
    float _5849 = _5845;
    if (!_5815)
    {
        _5833 = _5765;
    }
    float _5851 = _5833;
    bool _5853 = !_5815;
    float _5855 = _5851;
    if (!_5853)
    {
        float _5857 = _230 * _230;
        float _5859 = rsqrt(_5787);
        float _5861 = fma(_226, _226, _5857);
        float _5863 = fma(_232, _232, _5861);
        float _5865 = sqrt(_5863);
        float _5867 = _5769 * _5859;
        float _5869 = _5761 * _5859;
        float _5871 = _5779 * _5859;
        bool _5873 = _5865 > 0.0;
        float _5875 = _5865;
        float _5877 = _5859;
        if (!_5873)
        {
            _5875 = _5757;
        }
        float _5879 = _5875;
        _5843 = _5879;
        if (!_5873)
        {
            _5847 = _5749;
        }
        float _5881 = _5847;
        _5849 = _5881;
        if (!_5873)
        {
            _5877 = _5765;
        }
        float _5883 = _5877;
        bool _5885 = !_5873;
        _5855 = _5883;
        if (!_5885)
        {
            float _5887 = rsqrt(_5863);
            float _5889 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5891 = _230 * _5887;
            float _5893 = _226 * _5887;
            float _5895 = _232 * _5887;
            float _5897 = _5869 * _5891;
            float _5899 = fma(_5867, _5893, _5897);
            float _5901 = _5889 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5903 = fma(_5871, _5895, _5899);
            float _5905 = _5903 * _5901;
            float _5907 = fma(_226, _5905, _5757);
            float _5909 = fma(_230, _5905, _5749);
            float _5911 = fma(_232, _5905, _5765);
            _5849 = _5909;
            _5855 = _5911;
            _5843 = _5907;
            _5835 = _5889;
        }
    }
    float _5913 = _5849;
    float _5915 = _5855;
    float _5917 = _5843;
    float _5919 = _5835;
    float _5921 = -_3547;
    float _5923 = fma(_5921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5913);
    float _5925 = -_4177;
    float _5927 = fma(_5925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5915);
    float _5929 = -_3543;
    float _5931 = fma(_5929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5917);
    float _5933 = _5919;
    float _5935 = _5931;
    float _5937 = _5927;
    if (_5809)
    {
        _5933 = 1.0;
    }
    float _5939 = _5933;
    float _5941 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5943 = _5817 * _5941;
    float _5945 = _5939;
    if (_5827)
    {
        _4453 = _5923;
    }
    float _5947 = _4453;
    float _5949 = _5947;
    if (!_5827)
    {
        float _5951 = _5015 * _5015;
        float _5953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5955 = -_3229;
        float _5957 = _5955 + _5915;
        float _5959 = -_3027;
        float _5961 = _5959 + _5913;
        float _5963 = fma(_5025, _5025, _5951);
        float _5965 = fma(_5039, _5039, _5963);
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5969 = sqrt(_5965);
        float _5971 = 1.0 / _5143;
        float _5973 = _5967 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5975 = precise::min(_5969, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5977 = _5975 * _5953;
        float _5979 = _5977 * _5971;
        float _5981 = -_2815;
        float _5983 = _5981 + _5917;
        float _5985 = _5973 * _5979;
        float _5987 = _5957 * _5979;
        float _5989 = fma(_5961, _5985, _5001);
        float _5991 = fma(_5983, _5985, _5009);
        float _5993 = fma(_5973, _5987, _5021);
        _5949 = _5989;
        _5935 = _5991;
        _5937 = _5993;
        _236 = _5953;
    }
    float _5995 = _5949;
    float _5997 = _5935;
    float _5999 = _5937;
    float _6001 = _236;
    float _6003 = _6001;
    if (!_5809)
    {
        float _6005 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6007 = _6005 * 0.15915493667125701904296875;
        float _6009 = _6007 * 6.283185482025146484375;
        float _6011 = cos(_6009);
        float _6013 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6015 = _6013 * 0.15915493667125701904296875;
        float _6017 = _6007 * 6.283185482025146484375;
        float _6019 = sin(_6017);
        float _6021 = 1.0 / _6011;
        float _6023 = _6015 * 6.283185482025146484375;
        float _6025 = cos(_6023);
        float _6027 = _6019 * _6021;
        float _6029 = _6015 * 6.283185482025146484375;
        float _6031 = sin(_6029);
        float _6033 = _6025 * _6027;
        float _6035 = 1.0 / _6033;
        float _6037 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6039 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6037;
        float _6041 = 1.0 / _6039;
        float _6043 = _6031 * _6035;
        float _6045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6047 = fma(_5943, _6043, _6045);
        float _6049 = _6047 * _6041;
        float _6051 = precise::clamp(_6049, 0.0, 1.0);
        _5945 = _6051;
    }
    float _6053 = _5945;
    float _6055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6057 = _5995 + _6055;
    float _6059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6061 = _5997 + _6059;
    float _6063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6065 = _5999 + _6063;
    float _6067 = _6057 * _6057;
    float _6069 = fma(_6061, _6061, _6067);
    float _6071 = fma(_6065, _6065, _6069);
    float _6073 = rsqrt(_6071);
    float _6075 = sqrt(_6071);
    float _6077 = _6073 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6079 = _6061 * _6077;
    float _6081 = _6065 * _6077;
    float _6083 = _6079 * _6079;
    float _6085 = _6081 * _6081;
    float _6087 = _6083 + _6085;
    float _6089 = sqrt(_6087);
    bool _6091 = _6089 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6095 = _6089 + _6093;
    float _6097 = _6073;
    float _6099 = _6087;
    float _6101 = _6095;
    float _6103 = _6057;
    if (_6091)
    {
        float _6105 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6097 = _6105;
    }
    float _6107 = _6097;
    if (_6091)
    {
        float _6109 = rsqrt(_6087);
        _6099 = _6109;
    }
    float _6111 = _6099;
    float _6113 = _6111;
    if (_6091)
    {
        float _6115 = _6095 * _6107;
        _6101 = _6115;
    }
    float _6117 = _6101;
    if (_6091)
    {
        float _6119 = _6117 * 0.15915493667125701904296875;
        _5837 = _6119;
    }
    float _6121 = _5837;
    float _6123 = _6065;
    if (_6091)
    {
        float _6125 = _6121 * 6.283185482025146484375;
        float _6127 = sin(_6125);
        _6123 = _6127;
    }
    float _6129 = _6123;
    float _6131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6133 = precise::max(0.0, _6131);
    float _6135 = _6107;
    if (_6091)
    {
        float _6137 = _6121 * 6.283185482025146484375;
        float _6139 = cos(_6137);
        _6135 = _6139;
    }
    float _6141 = _6135;
    float _6143 = -_6077;
    float _6145 = -_6133;
    float _6147 = fma(_6057, _6143, _6145);
    float _6149 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6091)
    {
        float _6151 = _6147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6103 = _6151;
    }
    float _6153 = _6103;
    float _6155 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6157 = fma(_5009, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6159 = _6153;
    float _6161 = _6129;
    if (_6091)
    {
        float _6163 = fma(_6129, _6153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6159 = _6163;
    }
    float _6165 = _6159;
    float _6167 = _6165;
    if (!_6091)
    {
        _6161 = _6079;
    }
    float _6169 = _6161;
    float _6171 = _6169;
    float _6173 = _6141;
    if (_6091)
    {
        float _6175 = _6141 + (-1.0);
        _6149 = _6175;
    }
    float _6177 = _6149;
    float _6179 = _6177;
    if (_6091)
    {
        float _6181 = _6111 * _6165;
        _5839 = _6181;
    }
    float _6183 = _5839;
    if (!_6091)
    {
        _6167 = _6147;
    }
    float _6185 = _6167;
    float _6187 = _6185;
    if (_6091)
    {
        float _6189 = _6177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6003 = _6189;
    }
    float _6191 = _6003;
    if (_6091)
    {
        float _6193 = _6079 * _6183;
        _6171 = _6193;
    }
    float _6195 = _6171;
    if (!_6091)
    {
        _6179 = _6081;
    }
    float _6197 = _6179;
    float _6199 = _6197;
    if (_6091)
    {
        float _6201 = _6081 * _6183;
        _6199 = _6201;
    }
    float _6203 = _6199;
    if (!_6091)
    {
        _6113 = _6083;
    }
    float _6205 = _6113;
    float _6207 = _6205;
    if (_6091)
    {
        float _6209 = fma(_6147, _6141, _6191);
        _6187 = _6209;
    }
    float _6211 = _6187;
    if (_6091)
    {
        float _6213 = _6195 * _6195;
        _6207 = _6213;
    }
    float _6215 = _6207;
    if (!_6091)
    {
        _6173 = _6085;
    }
    float _6217 = _6173;
    float _6219 = _6217;
    if (_6091)
    {
        float _6221 = _6203 * _6203;
        _6219 = _6221;
    }
    float _6223 = _6219;
    float _6225 = fma(_6211, _6211, _6215);
    float _6227 = floor(_6157);
    float _6229 = _6225 + _6223;
    float _6231 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6155);
    float _6233 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6235 = fma(_6075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6233);
    float _6237 = precise::clamp(_6235, 0.0, 1.0);
    float _6239 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6231);
    float _6241 = rsqrt(_6229);
    float _6243 = -_6237;
    float _6245 = _6243 + 1.0;
    float _6247 = _6239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6251 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6253 = _6247 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6255 = fma(_5021, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6257 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6259 = abs(_6245);
    float _6261 = log2(_6259);
    float _6263 = -_6253;
    float _6265 = fma(_6263, _6249, 1.0);
    float _6267 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6269 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6251);
    float _6271 = -_6227;
    float _6273 = _6157 + _6271;
    float _6275 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6267);
    float _6277 = _6241 * _6195;
    float _6279 = floor(_6255);
    float _6281 = _6241 * _6211;
    float _6283 = _6241 * _6203;
    float _6285 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6257);
    float _6287 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6275);
    float _6289 = _6277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6291 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6269);
    float _6293 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6285);
    float _6295 = _6287 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6297 = -_6289;
    float _6299 = fma(_6281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6297);
    float _6301 = _6261 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6303 = _6293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6305 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6307 = -_6283;
    float _6309 = fma(_6307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6299);
    float _6311 = _6291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6313 = exp2(_6301);
    float _6315 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6305);
    float _6317 = fma(_6309, -0.5, 0.5);
    float _6319 = fma(_6309, 0.5, 0.5);
    float _6321 = -_6279;
    float _6323 = _6255 + _6321;
    float _6325 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6315);
    float _6327 = fma(_6319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6329 = log2(_6265);
    float _6331 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6325);
    float _6333 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6335 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6337 = fma(_6319, _6327, -0.212114393711090087890625);
    float _6339 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6333);
    float _6341 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6335);
    float _6343 = sqrt(_6317);
    float _6345 = fma(_6319, _6337, 1.570728778839111328125);
    float _6347 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6339);
    float _6349 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6341);
    float _6351 = 1.0 / _6331;
    float _6353 = _6281 + 1.0;
    float _6355 = _6329 * 0.693147182464599609375;
    float _6357 = -_6281;
    float _6359 = fma(_6313, _6353, _6357);
    float _6361 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6347);
    float _6363 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6349);
    float _6365 = _6343 * 0.636619746685028076171875;
    float _6367 = fma(_6359, 0.5, 0.5);
    float _6369 = -_6345;
    float _6371 = fma(_6365, _6369, 1.0);
    float _6373 = _6355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16189 = float2(_6273, _6323);
    float _6375 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16189, float2(0.0), isnan(_16189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16189, float2(0.0), isnan(_16189)), level(0.0)).x;
    float _6377 = _6361 * _6351;
    float _6379 = _6363 * _6351;
    float _6381 = fma(_6377, 0.5, 0.5);
    float _6383 = fma(_6379, -0.5, 0.5);
    float3 _16208 = float3(_6381, _6383, _6373);
    float _6385 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16208, float3(0.0), isnan(_16208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16208, float3(0.0), isnan(_16208)), level(0.0)).x;
    float3 _16219 = float3(_6381, _6383, _6373);
    float4 _6388 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16219, float3(0.0), isnan(_16219)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16219, float3(0.0), isnan(_16219)), level(0.0)).xyzw;
    float _6390 = _6388.x;
    float _6392 = _6388.y;
    float _6394 = _6388.z;
    float _6396 = _6388.w;
    float2 _16235 = float2(_6371, _6367);
    float3 _6398 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16235, float2(0.0), isnan(_16235)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16235, float2(0.0), isnan(_16235)), level(0.0)).xyz;
    float _6400 = _6398.x;
    float _6402 = _6398.y;
    float _6404 = _6398.z;
    float _6406 = abs(_5943);
    float _6408 = log2(_6406);
    float _6410 = _6261 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6412 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6414 = isnan(_6075);
    bool _6416 = _6412 || _6414;
    bool _6418 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6420 = _6416 || _6418;
    float _6422 = exp2(_6410);
    float _6424 = _6408 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6426 = exp2(_6424);
    float _6428 = in.m_105.x;
    float _6430 = -_6422;
    float _6432 = _6430 + 1.0;
    float _6434 = _6432 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6436 = fma(_6426, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6438 = precise::clamp(_6436, 0.0, 1.0);
    float _6440 = fma(_6438, -2.0, 3.0);
    float _6442 = _6438 * _6438;
    float _6444 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6446 = _6442 * _6440;
    float _6448 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6444);
    float _6450 = -_6446;
    float _6452 = _6450 + 1.0;
    float _6454 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6448);
    float _6456 = fma(_6452, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6446);
    bool _6458 = _5943 <= 8000.0;
    bool _6460 = isnan(_5943);
    bool _6462 = _6458 || _6460;
    bool _6464 = isnan(8000.0);
    bool _6466 = _6462 || _6464;
    float _6468 = float(_6466);
    float _6470 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6454);
    float _6472 = _6331 * 0.5;
    float _6474 = _6361 + _6331;
    float _6476 = _6468 * _6456;
    float _6478 = fma(_6363, -0.5, _6472);
    out.gl_Position.x = _6361;
    out.gl_Position.y = _6363;
    out.gl_Position.z = _6470;
    out.gl_Position.w = _6331;
    float _6480 = _6470 + _6331;
    float _6482 = _6476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6484 = _6474 * 0.5;
    float _6486 = _6480 * 0.5;
    out.m_107.x = _6484;
    out.m_107.y = _6478;
    out.m_107.z = _6486;
    out.m_107.w = _6331;
    float _6488 = -_6434;
    float _6490 = _6488 + 1.0;
    float _6492 = _6331;
    float _6494 = _6470;
    float _6496 = _6363;
    float _6498 = _6478;
    float _6500 = _6484;
    float _6502 = _6490;
    if (!_6420)
    {
        _6492 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6504 = _6492;
    float _6506 = _6504;
    float _6508 = _6504;
    if (!_6420)
    {
        _6494 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6510 = _6494;
    float _6512 = _6510;
    float _6514 = _6510;
    if (!_6420)
    {
        _6496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6516 = _6496;
    float _6518 = _6053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6520 = _6516;
    float _6522 = _6516;
    if (!_6420)
    {
        _6498 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6524 = _6498;
    float _6526 = _6524;
    float _6528 = _6524;
    if (!_6420)
    {
        _6500 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6530 = _6500;
    float _6532 = -_6375;
    float _6534 = _6532 + 1.0;
    float _6536 = _6534 * _6482;
    float _6538 = precise::clamp(_6536, 0.0, 1.0);
    float _6540 = -_6538;
    float _6542 = fma(_6540, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6544 = _6434 * _6385;
    float _6546 = _6542 * _6428;
    float _6548 = _6396 * _6544;
    float _6550 = _6404 * _6544;
    float _6552 = _6546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6554 = fma(_6400, _6548, _6390);
    float _6556 = fma(_6402, _6548, _6392);
    float _6558 = _6396 * _6490;
    float _6560 = fma(_6396, _6550, _6394);
    out.m_109.x = _6552;
    float _6562 = _6530;
    float _6564 = _6530;
    if (!_6420)
    {
        _6502 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6566 = _6502;
    out.m_111.x = _6554;
    out.m_111.y = _6556;
    out.m_111.z = _6560;
    out.m_111.w = _6558;
    bool _6568 = !_6420;
    float _6570 = _6566;
    float _6572 = _6566;
    if (!_6568)
    {
        bool _6574 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6576 = isnan(_6075);
        bool _6578 = _6574 || _6576;
        bool _6580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6582 = _6578 || _6580;
        if (!_6582)
        {
            float _6584 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6586 = _6075 + _6584;
            float _6588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6590 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6588;
            float _6592 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6594 = _6592 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6596 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6598 = _6596 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6600 = 1.0 / _6590;
            float _6602 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6604 = _6602 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6606 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6608 = _6606 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6610 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6612 = _6610 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6614 = _6586 * _6600;
            float _6616 = precise::clamp(_6614, 0.0, 1.0);
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6622 = fma(_6616, _6594, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6624 = fma(_6616, _6598, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6626 = fma(_6616, _6620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6628 = fma(_6616, _6604, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6630 = fma(_6616, _6608, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6632 = fma(_6616, _6612, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6522 = _6622;
            _6564 = _6630;
            _6514 = _6624;
            _6528 = _6628;
            _6572 = _6626;
            _6508 = _6632;
            _6634 = true;
        }
        else
        {
            bool _6636 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6638 = isnan(_6075);
            bool _6640 = _6636 || _6638;
            bool _6642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6644 = _6640 || _6642;
            if (!_6644)
            {
                _6526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6646 = _6526;
            _6528 = _6646;
            if (!_6644)
            {
                _6562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6648 = _6562;
            _6564 = _6648;
            if (!_6644)
            {
                _6506 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6650 = _6506;
            _6508 = _6650;
            if (!_6644)
            {
                _6512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6652 = _6512;
            _6514 = _6652;
            if (!_6644)
            {
                _6520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6654 = _6520;
            _6522 = _6654;
            if (!_6644)
            {
                _6570 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6656 = _6570;
            bool _6658 = !_6644;
            _6572 = _6656;
            if (!_6658)
            {
                bool _6660 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6662 = isnan(_6075);
                bool _6664 = _6660 || _6662;
                bool _6666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6668 = _6664 || _6666;
                if (!_6668)
                {
                    float _6670 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6672 = _6075 + _6670;
                    float _6674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6676 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6674;
                    float _6678 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6680 = _6678 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6684 = _6682 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6686 = 1.0 / _6676;
                    float _6688 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6690 = _6688 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6694 = _6692 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6700 = _6672 * _6686;
                    float _6702 = precise::clamp(_6700, 0.0, 1.0);
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6708 = fma(_6702, _6680, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6710 = fma(_6702, _6684, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6712 = fma(_6702, _6706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6714 = fma(_6702, _6690, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6716 = fma(_6702, _6694, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6718 = fma(_6702, _6698, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6522 = _6708;
                    _6564 = _6716;
                    _6514 = _6710;
                    _6528 = _6714;
                    _6572 = _6712;
                    _6508 = _6718;
                    _6634 = true;
                }
                else
                {
                    _6522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6572 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6508 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6634 = false;
    float _6720 = _6522;
    float _6722 = _6564;
    float _6724 = _6514;
    float _6726 = _6528;
    float _6728 = _6572;
    float _6730 = _6508;
    float _6732 = _6518 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6734 = fma(_5657, -0.5, 0.5);
    float _6736 = precise::clamp(_6734, 0.0, 1.0);
    float _6738 = -_6720;
    float _6740 = _6722 + _6738;
    float _6742 = -_6724;
    float _6744 = _6726 + _6742;
    out.m_53.x = _6732;
    float _6746 = fma(_6736, _6740, _6720);
    float _6748 = -_6728;
    float _6750 = _6730 + _6748;
    float _6752 = fma(_6736, _6744, _6724);
    float _6754 = _6746 * 0.586610972881317138671875;
    bool _6756 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6758 = fma(_6736, _6750, _6728);
    out.m_113.x = 0.0;
    float _6760 = fma(_6752, 0.298911988735198974609375, _6754);
    bool _6762 = _6053 > 0.0;
    bool _6764 = isnan(_6053);
    bool _6766 = _6762 || _6764;
    bool _6768 = isnan(0.0);
    bool _6770 = _6766 || _6768;
    float _6772 = fma(_6758, 0.114477999508380889892578125, _6760);
    float _6774 = -_6772;
    float _6776 = _6752 + _6774;
    float _6778 = -_6772;
    float _6780 = _6746 + _6778;
    float _6782 = -_6772;
    float _6784 = _6758 + _6782;
    float _6786 = fma(_6776, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    float _6788 = fma(_6780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    float _6790 = fma(_6784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    bool _6792 = !_6756;
    if (!_6792)
    {
        float _6794 = -_5995;
        float _6796 = _6794 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6798 = -_5997;
        float _6800 = _6798 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6802 = -_5999;
        float _6804 = _6802 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6806 = _6796 * _6796;
        float _6808 = fma(_6800, _6800, _6806);
        float _6810 = fma(_6804, _6804, _6808);
        float _6812 = sqrt(_6810);
        float _6814 = rsqrt(_6810);
        float _6816 = -_6812;
        float _6818 = _6816 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6820 = _6818 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6822 = precise::clamp(_6820, 0.0, 1.0);
        float _6824 = _6800 * _6814;
        float _6826 = _6796 * _6814;
        float _6828 = abs(_6822);
        float _6830 = log2(_6828);
        float _6832 = _6804 * _6814;
        float _6834 = _6824 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6836 = _5657 * _6826;
        float _6838 = -_6826;
        float _6840 = -_6834;
        float _6842 = fma(_6838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6840);
        float _6844 = fma(_5649, _6824, _6836);
        float _6846 = -_6832;
        float _6848 = fma(_6846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6842);
        float _6850 = fma(_5659, _6832, _6844);
        float _6852 = precise::clamp(_6850, 0.0, 1.0);
        float _6854 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6856 = _6848 + _6854;
        float _6858 = _6830 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6860 = _6856 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6862 = precise::clamp(_6860, 0.0, 1.0);
        float _6864 = exp2(_6858);
        float _6866 = _6864 * _6862;
        float _6868 = _6852 * _6866;
        float _6870 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6872 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6874 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6870;
        out.m_113.y = _6872;
        out.m_113.z = _6874;
    }
    out.m_115.x = _6786;
    out.m_115.y = _6788;
    out.m_115.z = _6790;
    if (_6770)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _6876 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6876;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_115 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_113 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_109 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_111 = float4(0.0, 0.0, 0.0, 1.0);
    bool _6634 = false;
    bool _5707 = false;
    bool _1098 = false;
    bool _774 = false;
    bool _632 = false;
    bool _478 = false;
    bool _256 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _129 = in.m_50.w;
    float _131 = trunc(_129);
    int _134 = int(_131);
    bool _138 = _134 >= 1;
    float _140 = 0.0;
    if (!_138)
    {
        _140 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _142 = _140;
    float _144 = _142;
    if (!_138)
    {
        out.m_53.x = 0.0;
    }
    int _146 = 0;
    if (!_138)
    {
        float _148 = _142 * 5.0;
        _146 = as_type<int>(_148);
    }
    int _150 = _146;
    int _152 = _150;
    if (!_138)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6933 = as_type<float>(_150);
        out.gl_Position.z = _6933;
    }
    if (!_138)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _154 = in.m_55.w;
    bool _156 = _154 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _158 = isnan(_154);
    bool _160 = _156 || _158;
    bool _162 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _164 = _160 || _162;
    float _166 = -_154;
    float _168 = _166 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _170 = _168;
    if (_164)
    {
        float _172 = float(_134);
        _144 = _172;
    }
    float _174 = _144;
    bool _176 = _168 >= _174;
    bool _178 = !_164;
    bool _180 = _176 || _178;
    float _182 = _174;
    if (_180)
    {
        _182 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _184 = _182;
    if (_180)
    {
        out.m_53.x = 0.0;
    }
    if (_180)
    {
        float _186 = _184 * 5.0;
        _152 = as_type<int>(_186);
    }
    int _188 = _152;
    if (_180)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7003 = as_type<float>(_188);
        out.gl_Position.z = _7003;
    }
    if (_180)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _190 = in.m_57.x;
    float _192 = in.m_57.y;
    float _194 = in.m_57.z;
    bool _196 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _198 = in.m_59.x;
    float _200 = in.m_59.y;
    float _202 = in.m_59.z;
    float _204 = in.m_61.x;
    float _206 = in.m_61.y;
    float _208 = in.m_61.z;
    float _210 = in.m_63.x;
    float _212 = in.m_63.y;
    float _214 = in.m_63.z;
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
    float _236 = _226;
    float _254;
    if (!_234)
    {
        float _238 = in.m_65.x;
        float _240 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _242 = _238 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _244 = fma(_242, (*spvDescriptorSet0.vp_c9)._m0[12].x, _168);
        float _246 = _244 * _240;
        float _248 = floor(_246);
        float _250 = -_248;
        float _252 = _246 + _250;
        _254 = _252;
        _256 = true;
    }
    else
    {
        float _258 = float(_134);
        float _260 = 1.0 / _258;
        float _262 = _168 * _260;
        _254 = _262;
    }
    _256 = false;
    float _264 = _254;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _264 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _264 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _284 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _282;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _290 = 1.0 / _280;
    bool _292 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _294 = 1.0 / _288;
    bool _296 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _298 = isnan(_264);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _284;
    float _310 = _268 * _290;
    bool _312 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _314 = isnan(_264);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _326 = isnan(_264);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = _272 * _294;
    bool _342 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _344 = isnan(_264);
    bool _346 = _342 || _344;
    bool _348 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _350 = _346 || _348;
    float _352 = float(_350);
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _356 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _354;
    float _358 = _306 * _338;
    float _360 = -_306;
    float _362 = _360 + 1.0;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _368 = -_352;
    float _370 = _368 + 1.0;
    float _372 = _276 * _308;
    float _374 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _376 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _374;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _380 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _378;
    float _382 = _334 * _370;
    float _384 = fma(_356, _372, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _386 = fma(_376, _372, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_380, _372, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _390 = _352 * _362;
    float _392 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _394 = _392 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _396 = _386 * _382;
    float _398 = _388 * _382;
    float _400 = _384 * _382;
    float _402 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _404 = _402 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _406 = -_334;
    float _408 = _406 + 1.0;
    float _410 = fma(_366, _340, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _412 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].y, _398);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _414;
    float _418 = fma(_394, _340, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_404, _340, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _422 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].x, _396);
    float _424 = fma(_408, (*spvDescriptorSet0.vp_c9)._m0[143].z, _400);
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _430;
    float _434 = fma(_410, _390, _422);
    float _436 = fma(_416, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = fma(_428, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _440 = fma(_432, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _442 = fma(_418, _390, _412);
    float _444 = fma(_420, _390, _424);
    float _446 = fma(_438, _358, _434);
    float _448 = fma(_436, _358, _442);
    float _450 = fma(_440, _358, _444);
    float _452 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].x, _446);
    float _454 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].y, _448);
    float _456 = fma(_322, (*spvDescriptorSet0.vp_c9)._m0[146].z, _450);
    bool _458 = !_292;
    float _476;
    if (!_458)
    {
        float _460 = in.m_65.x;
        float _462 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _464 = _460 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _466 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _468 = _466 * _462;
        float _470 = floor(_468);
        float _472 = -_470;
        float _474 = _468 + _472;
        _476 = _474;
        _478 = true;
    }
    else
    {
        float _480 = float(_134);
        float _482 = 1.0 / _480;
        float _484 = _168 * _482;
        _476 = _484;
    }
    _478 = false;
    float _486 = _476;
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _490 = _486 + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _494 = _492 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _496 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _498 = isnan(_486);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _512 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _514 = isnan(_486);
    bool _516 = _512 || _514;
    bool _518 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _520 = _516 || _518;
    float _522 = float(_520);
    float _524 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _526 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _524;
    bool _528 = _486 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _530 = isnan(_486);
    bool _532 = _528 || _530;
    bool _534 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _536 = _532 || _534;
    float _538 = float(_536);
    float _540 = 1.0 / _494;
    float _542 = -_506;
    float _544 = _542 + 1.0;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _548 = _486 + _546;
    bool _550 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _552 = _522 * _544;
    float _554 = -_522;
    float _556 = _554 + 1.0;
    float _558 = 1.0 / _510;
    float _560 = _526 * _540;
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _566 = fma(_560, _490, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _568 = -_538;
    float _570 = _568 + 1.0;
    float _572 = _564 * _558;
    float _574 = _566 * _552;
    float _576 = _506 * _570;
    float _578 = fma(_572, _548, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _580 = fma(_556, (*spvDescriptorSet0.vp_c9)._m0[115].x, _574);
    float _582 = fma(_578, _576, _580);
    float _584 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _588 = fma(_538, (*spvDescriptorSet0.vp_c9)._m0[117].x, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _592 = in.m_67.x;
    float _594 = in.m_67.y;
    float _596 = in.m_67.z;
    float _598 = _584 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _600 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _604 = _588 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _598;
    out.m_69.y = _600;
    out.m_69.z = _602;
    out.m_69.w = _604;
    float _606 = _456 * _596;
    float _608 = _454 * _594;
    float _610 = _452 * _592;
    bool _612 = !_550;
    float _630;
    if (!_612)
    {
        float _614 = in.m_65.x;
        float _616 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _618 = _614 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _620 = fma(_618, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _622 = _620 * _616;
        float _624 = floor(_622);
        float _626 = -_624;
        float _628 = _622 + _626;
        _630 = _628;
        _632 = true;
    }
    else
    {
        float _634 = float(_134);
        float _636 = 1.0 / _634;
        float _638 = _168 * _636;
        _630 = _638;
    }
    _632 = false;
    float _640 = _630;
    float _642 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _644 = _640 + _642;
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _648 = _646 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _650 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _652 = isnan(_640);
    bool _654 = _650 || _652;
    bool _656 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _658 = _654 || _656;
    float _660 = float(_658);
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _666 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _668 = isnan(_640);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _678;
    bool _682 = _640 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _684 = isnan(_640);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _648;
    float _696 = -_660;
    float _698 = _696 + 1.0;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _702 = _640 + _700;
    bool _704 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _706 = _676 * _698;
    float _708 = -_676;
    float _710 = _708 + 1.0;
    float _712 = 1.0 / _664;
    float _714 = _680 * _694;
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _720 = fma(_714, _644, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _722 = -_692;
    float _724 = _722 + 1.0;
    float _726 = _718 * _712;
    float _728 = _720 * _706;
    float _730 = _660 * _724;
    float _732 = fma(_726, _702, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _734 = fma(_710, (*spvDescriptorSet0.vp_c9)._m0[131].x, _728);
    float _736 = fma(_732, _730, _734);
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _740 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _744 = fma(_692, (*spvDescriptorSet0.vp_c9)._m0[133].x, _736);
    float _746 = _738 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _748 = _740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _750 = _742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _752 = _744 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _746;
    out.m_71.y = _748;
    out.m_71.z = _750;
    out.m_71.w = _752;
    bool _754 = !_704;
    float _772;
    if (!_754)
    {
        float _756 = in.m_65.x;
        float _758 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _760 = _756 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _762 = fma(_760, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _764 = _762 * _758;
        float _766 = floor(_764);
        float _768 = -_766;
        float _770 = _764 + _768;
        _772 = _770;
        _774 = true;
    }
    else
    {
        float _776 = float(_134);
        float _778 = 1.0 / _776;
        float _780 = _168 * _778;
        _772 = _780;
    }
    _774 = false;
    float _782 = _772;
    float _784 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _786 = _782 + _784;
    bool _788 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _790 = isnan(_782);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _802 = _800 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _804 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _806 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _804;
    bool _808 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _810 = isnan(_782);
    bool _812 = _808 || _810;
    bool _814 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _816 = _812 || _814;
    float _818 = float(_816);
    float _820 = -_798;
    float _822 = _820 + 1.0;
    bool _824 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _826 = isnan(_782);
    bool _828 = _824 || _826;
    bool _830 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _832 = _828 || _830;
    float _834 = float(_832);
    float _836 = 1.0 / _802;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _842 = _818 * _822;
    float _844 = -_834;
    float _846 = _844 + 1.0;
    float _848 = 1.0 / _840;
    bool _850 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _852 = _806 * _836;
    float _854 = -_818;
    float _856 = _854 + 1.0;
    bool _858 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _860 = isnan(_782);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _866 = _862 || _864;
    float _868 = float(_866);
    float _870 = fma(_852, _786, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _872 = _834 * _856;
    bool _874 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _876 = isnan(_782);
    bool _878 = _874 || _876;
    bool _880 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _882 = _878 || _880;
    float _884 = float(_882);
    float _886 = _868 * _846;
    float _888 = -_868;
    float _890 = _888 + 1.0;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _896 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _898 = isnan(_782);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = _884 * _890;
    float _910 = -_884;
    float _912 = _910 + 1.0;
    bool _914 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _916 = isnan(_782);
    bool _918 = _914 || _916;
    bool _920 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _922 = _918 || _920;
    float _924 = float(_922);
    float _926 = 1.0 / _894;
    float _928 = -_906;
    float _930 = _928 + 1.0;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _934 = _932 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _936 = _906 * _912;
    float _938 = _924 * _930;
    float _940 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _942 = _940 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _944 = -_924;
    float _946 = _944 + 1.0;
    float _948 = 1.0 / _934;
    float _950 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _952 = _950 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _954 = _870 * _938;
    float _956 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _958 = _956 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _960 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _962 = _782 + _960;
    float _964 = _952 * _848;
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[159].x, _954);
    float _968 = 1.0 / _942;
    float _970 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _972 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _970;
    float _974 = fma(_964, _962, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _976 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _978 = _976 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _980 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _982 = _782 + _980;
    float _984 = _972 * _926;
    float _986 = fma(_974, _936, _966);
    float _988 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _990 = _782 + _988;
    float _992 = 1.0 / _958;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _998 = fma(_984, _982, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1000 = _996 * _948;
    bool _1002 = _782 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1004 = isnan(_782);
    bool _1006 = _1002 || _1004;
    bool _1008 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1010 = _1006 || _1008;
    float _1012 = float(_1010);
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1016 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1014;
    float _1018 = 1.0 / _978;
    float _1020 = fma(_998, _908, _986);
    float _1022 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1024 = _1022 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1026 = _1016 * _968;
    float _1028 = fma(_1000, _990, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1032 = _782 + _1030;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1036 = _782 + _1034;
    float _1038 = _1024 * _992;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1042 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1040;
    float _1044 = fma(_1026, _1032, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1046 = fma(_1028, _886, _1020);
    float _1048 = fma(_1038, _1036, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1050 = -_1012;
    float _1052 = _1050 + 1.0;
    float _1054 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1056 = _782 + _1054;
    float _1058 = fma(_1044, _872, _1046);
    float _1060 = _1042 * _1018;
    float _1062 = _798 * _1052;
    float _1064 = fma(_1048, _842, _1058);
    float _1066 = fma(_1060, _1056, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1068 = fma(_1066, _1062, _1064);
    float _1070 = fma(_1012, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1068);
    out.m_73.x = _1070;
    bool _1072 = !_850;
    float _1074 = _986;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1078 = as_type<int>(_1018);
    float _1096;
    if (!_1072)
    {
        float _1080 = in.m_65.x;
        float _1082 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1084 = _1080 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1086 = fma(_1084, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1088 = _1086 * _1082;
        float _1090 = floor(_1088);
        float _1092 = -_1090;
        float _1094 = _1088 + _1092;
        _1096 = _1094;
        _1098 = true;
    }
    else
    {
        float _1100 = float(_134);
        float _1102 = 1.0 / _1100;
        float _1104 = _168 * _1102;
        _1096 = _1104;
    }
    _1098 = false;
    float _1106 = _1096;
    float _1108 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1110 = int(_1108);
    float _1112 = in.m_65.y;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1116 = _1114 != 0;
    float _1118 = in.m_75.x;
    float _1120 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1122 = int(_1120);
    float _1124 = 0.0;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1116)
    {
        _1124 = 1.0;
    }
    float _1128 = _1124;
    float _1130 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1132 = int(_1130);
    float _1134 = float(_1110);
    float _1136 = 0.0;
    float _1138 = _1128;
    if (_1116)
    {
        _1136 = 1.0;
    }
    float _1140 = _1136;
    float _1142 = 0.0;
    float _1144 = _1140;
    if (_1116)
    {
        _1142 = 1.0;
    }
    float _1146 = _1142;
    int _1148 = 0;
    float _1150 = _1146;
    if (_1116)
    {
        _1148 = 0;
    }
    int _1152 = _1148;
    int _1154 = _1152;
    if (_1116)
    {
        float _1156 = in.m_65.x;
        _1074 = _1156;
    }
    float _1158 = _1074;
    float _1160 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1162 = int(_1160);
    float _1164 = float(_1122);
    float _1166 = _1158;
    if (_1116)
    {
        _1126 = 0;
    }
    int _1168 = _1126;
    float _1170 = _1062;
    int _1172 = _1168;
    if (_1116)
    {
        float _1174 = in.m_65.z;
        _1170 = _1174;
    }
    float _1176 = _1170;
    int _1178 = 0;
    if (_1116)
    {
        _1178 = as_type<int>(_1112);
    }
    int _1180 = _1178;
    float _1182 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1184 = int(_1182);
    float _1186 = float(_1132);
    float _1188 = 1.0 / _1134;
    float _1190 = float(_1162);
    float _1192 = 1.0 / _1164;
    float _1194 = float(uint(_1184));
    float _1196 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1198 = int(_1196);
    float _1200 = _1188 * _168;
    float _1202 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1204 = int(_1202);
    float _1206 = _1192 * _168;
    float _1208 = 1.0 / _1186;
    float _1210 = float(uint(_1198));
    float _1212 = 1.0 / _1190;
    float _1214 = float(uint(_1204));
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1218 = int(_1216);
    float _1220 = _1208 * _168;
    float _1222 = 1.0 / _1194;
    float _1224 = _1212 * _168;
    float _1226 = trunc(_1200);
    int _1228 = int(_1226);
    float _1230 = float(uint(_1218));
    float _1232 = 1.0 / _1210;
    int _1234 = as_type<int>(_1222) + (-2);
    float _1236 = trunc(_1206);
    int _1238 = int(_1236);
    float _1240 = float(uint(_1228));
    float _1242 = as_type<float>(_1234) * _1240;
    float _1244 = 1.0 / _1214;
    int _1246 = as_type<int>(_1232) + (-2);
    float _1248 = trunc(_1220);
    int _1250 = int(_1248);
    int _1252 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1254 = _1252 != 0;
    float _1256 = 1.0 / _1230;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1260 = _1258 != 0;
    int _1262 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1264 = _1262 != 0;
    bool _1266 = _1112 > 0.5;
    int _1268 = as_type<int>(_1244) + (-2);
    float _1270 = trunc(_1224);
    int _1272 = int(_1270);
    float _1274 = float(uint(_1250));
    int _1276 = _1180;
    bool _1278 = _1260;
    bool _1280 = _1264;
    float _1282 = _1118;
    if (!_1254)
    {
        _1076 = _1118;
    }
    float _1284 = _1076;
    float _1286 = as_type<float>(_1268) * _1274;
    int _1288 = as_type<int>(_1286);
    float _1290 = _1284;
    if (_1260)
    {
        float _1292 = -_1118;
        float _1294 = _1292 + 1.0;
        _1078 = as_type<int>(_1294);
    }
    int _1296 = _1078;
    float _1298 = trunc(_1242);
    float _1300 = precise::max(_1298, 0.0);
    uint _1303 = uint(_1300);
    int _1305 = as_type<int>(_1256) + (-2);
    float _1307 = 0.0;
    if (!_1264)
    {
        _1307 = _1118;
    }
    float _1309 = _1307;
    float _1311 = 0.0;
    float _1313 = _1309;
    if (!_1260)
    {
        _1311 = _1118;
    }
    float _1315 = _1311;
    float _1317 = _1315;
    if (_1260)
    {
        float _1319 = _1266 ? as_type<float>(_1296) : _1118;
        _1317 = _1319;
    }
    float _1321 = _1317;
    float _1323 = trunc(_1286);
    float _1325 = precise::max(_1323, 0.0);
    uint _1327 = uint(_1325);
    float _1329 = float(uint(_1238));
    float _1331 = float(uint(_1272));
    float _1333 = as_type<float>(_1246) * _1329;
    float _1335 = _1329;
    if (_1264)
    {
        float _1337 = -_1118;
        float _1339 = _1337 + 1.0;
        _1288 = as_type<int>(_1339);
    }
    int _1341 = _1288;
    float _1343 = as_type<float>(_1305) * _1331;
    float _1345 = trunc(_1333);
    float _1347 = precise::max(_1345, 0.0);
    uint _1349 = uint(_1347);
    int _1351 = _1341;
    float _1353 = _1343;
    if (_1264)
    {
        float _1355 = _1266 ? as_type<float>(_1341) : _1118;
        _1313 = _1355;
    }
    float _1357 = _1313;
    float _1359 = _1176;
    if (_1116)
    {
        _1351 = as_type<int>(_1176);
    }
    int _1361 = _1351;
    float _1363 = trunc(_1343);
    float _1365 = precise::max(_1363, 0.0);
    uint _1367 = uint(_1365);
    int _1369 = _1361;
    if (_1116)
    {
        _1353 = _1158;
    }
    float _1371 = _1353;
    float _1373 = _1371;
    if (_1116)
    {
        _1335 = _1371;
    }
    float _1375 = _1335;
    int _1377 = 0;
    float _1379 = _1375;
    if (_1116)
    {
        _1377 = as_type<int>(_1371);
    }
    int _1381 = _1377;
    int _1383 = _1381;
    if (!_1116)
    {
        float _1385 = in.m_65.x;
        float _1387 = _1112 * 3.1415927410125732421875;
        float _1389 = in.m_65.z;
        float _1391 = _1387 * 0.15915493667125701904296875;
        float _1393 = _1391 * 6.283185482025146484375;
        float _1395 = sin(_1393);
        float _1397 = _1385 * 3.1415927410125732421875;
        float _1399 = _1397 * 0.15915493667125701904296875;
        float _1401 = _1389 * 3.1415927410125732421875;
        float _1403 = _1401 * 0.15915493667125701904296875;
        float _1405 = _1399 * 6.283185482025146484375;
        float _1407 = sin(_1405);
        float _1409 = _1403 * 6.283185482025146484375;
        float _1411 = sin(_1409);
        _1373 = _1112;
        _1144 = 1.2345600128173828125;
        _1166 = _1385;
        _1138 = 7.345489978790283203125;
        _1379 = _1389;
        _1150 = 5.839270114898681640625;
        _1154 = 1;
        _1359 = _1389;
        _1172 = 2;
        _1369 = as_type<int>(_1411);
        _1276 = as_type<int>(_1395);
        _1383 = as_type<int>(_1407);
    }
    float _1413 = _1373;
    float _1415 = _1144;
    float _1417 = _1166;
    float _1419 = _1138;
    float _1421 = _1379;
    float _1423 = _1150;
    int _1425 = _1154;
    float _1427 = _1359;
    int _1429 = _1172;
    int _1431 = _1369;
    int _1433 = _1276;
    int _1435 = _1383;
    int _1437 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1439 = _1437 != 0;
    int _1441 = 0;
    if (_1254)
    {
        float _1443 = in.m_65.x;
        _1441 = as_type<int>(_1443);
    }
    int _1445 = _1441;
    int _1447 = ~_1184;
    int _1449 = _1447 + 1;
    float _1451 = _1413 * _1415;
    int _1453 = ~_1204;
    int _1455 = _1453 + 1;
    float _1457 = _1417 * _1419;
    int _1459 = ~_1218;
    int _1461 = _1459 + 1;
    int _1463 = _1449 * int(_1303);
    int _1465 = _1463 + _1228;
    float _1467 = floor(_1451);
    float _1469 = _1421 * _1423;
    float _1471 = _1413 * _1419;
    int _1473 = _1461 * int(_1367);
    int _1475 = _1473 + _1272;
    float _1477 = float(uint(_1465));
    float _1479 = _842;
    if (_1439)
    {
        float _1481 = in.m_65.z;
        _1479 = _1481;
    }
    float _1483 = _1479;
    int _1485 = _1455 * int(_1327);
    int _1487 = _1485 + _1250;
    int _1489 = ~_1198;
    int _1491 = _1489 + 1;
    float _1493 = floor(_1457);
    float _1495 = as_type<float>(_1234) * _1477;
    float _1497 = float(uint(_1475));
    bool _1499 = _1425 != 1;
    float _1501 = float(uint(_1487));
    float _1503 = in.m_61.w;
    int _1505 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1507 = _1505 != 0;
    float _1509 = as_type<float>(_1305) * _1497;
    float _1511 = trunc(_1495);
    float _1513 = precise::max(_1511, 0.0);
    uint _1515 = uint(_1513);
    int _1517 = _1445;
    float _1519 = _1495;
    if (_1254)
    {
        bool _1521 = as_type<float>(_1445) > 0.5;
        _1278 = _1521;
    }
    bool _1523 = _1278;
    if (_1439)
    {
        float _1525 = -_1118;
        float _1527 = _1525 + 1.0;
        _1517 = as_type<int>(_1527);
    }
    int _1529 = _1517;
    float _1531 = as_type<float>(_1268) * _1501;
    int _1533 = _1491 * int(_1349);
    int _1535 = _1533 + _1238;
    int _1537 = ~_1218;
    int _1539 = _1537 + 1;
    float _1541 = in.m_59.w;
    float _1543 = floor(_1469);
    int _1545 = _1535;
    float _1547 = _1531;
    if (!_1439)
    {
        _1519 = _1118;
    }
    float _1549 = _1519;
    float _1551 = -_1493;
    float _1553 = _1457 + _1551;
    float _1555 = float(uint(_1535));
    float _1557 = _1549;
    if (_1254)
    {
        float _1559 = -_1118;
        float _1561 = _1559 + 1.0;
        _1545 = as_type<int>(_1561);
    }
    int _1563 = _1545;
    if (_1439)
    {
        bool _1565 = _1483 > 0.5;
        _1280 = _1565;
    }
    bool _1567 = _1280;
    int _1569 = 0;
    if (_1507)
    {
        float _1571 = -_1118;
        float _1573 = _1571 + 1.0;
        _1569 = as_type<int>(_1573);
    }
    int _1575 = _1569;
    float _1577 = float(_1218);
    float _1579 = floor(_1471);
    if (_1439)
    {
        float _1581 = _1567 ? as_type<float>(_1529) : _1118;
        _1557 = _1581;
    }
    float _1583 = _1557;
    float _1585 = -_1467;
    float _1587 = _1451 + _1585;
    float _1589 = float(_134);
    float _1591 = as_type<float>(_1246) * _1555;
    if (_1254)
    {
        float _1593 = _1523 ? as_type<float>(_1563) : _1118;
        _1290 = _1593;
    }
    float _1595 = _1290;
    float _1597 = in.m_63.w;
    float _1599 = float(_1184);
    float _1601 = trunc(_1509);
    float _1603 = precise::max(_1601, 0.0);
    uint _1605 = uint(_1603);
    float _1607 = float(_1228);
    float _1609 = float(_1204);
    int _1611 = ~_1204;
    int _1613 = _1611 + 1;
    float _1615 = trunc(_1531);
    float _1617 = precise::max(_1615, 0.0);
    uint _1619 = uint(_1617);
    int _1621 = int(_1303) + int(_1515);
    float _1623 = -_1579;
    float _1625 = _1471 + _1623;
    float _1627 = _1553 * _1599;
    float _1629 = float(_1272);
    float _1631 = _1609 * _1587;
    float _1633 = float(_1238);
    float _1635 = 1.0 / _1589;
    if (!_1507)
    {
        _1547 = _1118;
    }
    float _1637 = _1547;
    float _1639 = _1637;
    if (_1507)
    {
        float _1641 = _1266 ? as_type<float>(_1575) : _1118;
        _1639 = _1641;
    }
    float _1643 = _1639;
    float _1645 = -_1543;
    float _1647 = _1469 + _1645;
    bool _1649 = _1607 >= _1599;
    bool _1651 = isnan(_1607);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan(_1599);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = _1599 * _168;
    float _1663 = float(_1250);
    float _1665 = trunc(_1591);
    float _1667 = precise::max(_1665, 0.0);
    uint _1669 = uint(_1667);
    float _1671 = float(_1198);
    float _1673 = _1577 * _1647;
    bool _1675 = _1663 >= _1609;
    bool _1677 = isnan(_1663);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan(_1609);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    bool _1687 = _1629 >= _1577;
    bool _1689 = isnan(_1629);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan(_1577);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    int _1699 = int(_1367) + int(_1605);
    float _1701 = _1661 * _1635;
    int _1703 = int(_1327) + int(_1619);
    float _1705 = _1635 * _168;
    int _1707 = ~_1184;
    int _1709 = _1707 + 1;
    float _1711 = trunc(_1659);
    int _1713 = int(_1711);
    int _1715 = ~_1204;
    int _1717 = _1715 + 1;
    float _1719 = _1609 * _1705;
    float _1721 = _1577 * _1705;
    float _1723 = _1671 * _1705;
    int _1725 = _1709 * _1621;
    int _1727 = _1725 + _1228;
    float _1729 = _1671 * _1625;
    int _1731 = _1717 * _1703;
    int _1733 = _1731 + _1250;
    float _1735 = trunc(_1627);
    int _1737 = int(_1735);
    int _1739 = _1539 * _1699;
    int _1741 = _1739 + _1272;
    bool _1743 = uint(_1727) >= uint(_1184);
    float _1745 = in.m_75.y;
    bool _1747 = uint(_1733) >= uint(_1204);
    bool _1749 = !_1743;
    int _1751 = _1749 ? 0 : (-1);
    int _1753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1755 = _1753 != 0;
    float _1757 = trunc(_1631);
    int _1759 = int(_1757);
    bool _1761 = uint(_1741) >= uint(_1218);
    bool _1763 = !_1755;
    int _1765 = _1763 ? 0 : 1;
    int _1767 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1769 = _1767 != 0;
    int _1771 = int(_1349) + int(_1669);
    float _1773 = trunc(_1673);
    int _1775 = int(_1773);
    int _1777 = ~_1198;
    int _1779 = _1777 + 1;
    bool _1781 = !_1747;
    int _1783 = _1781 ? 0 : (-1);
    int _1785 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1787 = _1785 != 0;
    int _1789 = _1779 * _1771;
    int _1791 = _1789 + _1238;
    int _1793 = ~_1621;
    int _1795 = _1793 + _1751;
    int _1797 = _1795 + 1;
    float _1799 = trunc(_1685);
    int _1801 = int(_1799);
    int _1803 = abs(_1765);
    bool _1805 = !_1769;
    int _1807 = _1805 ? 0 : 1;
    int _1809 = _1184 * _1797;
    int _1811 = _1809 + _1228;
    bool _1813 = _1633 >= _1671;
    bool _1815 = isnan(_1633);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan(_1671);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    int _1825 = _1737 * _1803;
    int _1827 = _1825 + _1228;
    bool _1829 = !_1787;
    int _1831 = _1829 ? 0 : 1;
    float _1833 = trunc(_1697);
    int _1835 = int(_1833);
    int _1837 = ~_1703;
    int _1839 = _1837 + _1783;
    int _1841 = _1839 + 1;
    int _1843 = abs(_1807);
    bool _1845 = _1184 == 0;
    int _1847 = _1204 * _1841;
    int _1849 = _1847 + _1250;
    int _1851 = abs(_1831);
    int _1853 = _1759 * _1843;
    int _1855 = _1853 + _1250;
    bool _1857 = uint(_1791) >= uint(_1198);
    float _1859 = trunc(_1701);
    int _1861 = int(_1859);
    bool _1863 = !_1761;
    int _1865 = _1863 ? 0 : (-1);
    int _1867 = ~_1713;
    int _1869 = _1867 + 1;
    int _1871 = _1869 + 1;
    bool _1873 = !_1845;
    int _1875 = _1873 ? _1811 : (-1);
    float _1877 = trunc(_1823);
    int _1879 = int(_1877);
    int _1881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1883 = _1881 != 0;
    int _1885 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1887 = _1885 != 0;
    int _1889 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1891 = _1889 != 0;
    int _1893 = _1875 * _1871;
    int _1895 = ~_1699;
    int _1897 = _1895 + _1865;
    int _1899 = _1897 + 1;
    int _1901 = _1775 * _1851;
    int _1903 = _1901 + _1272;
    bool _1905 = !_1857;
    int _1907 = _1905 ? 0 : (-1);
    int _1909 = _1184 + (-1);
    int _1911 = _1218 * _1899;
    int _1913 = _1911 + _1272;
    bool _1915 = !_1887;
    int _1917 = _1915 ? 0 : 1;
    bool _1919 = _1204 == 0;
    int _1921 = _1713 * _1909;
    int _1923 = _1921 + _1893;
    bool _1925 = !_1883;
    int _1927 = _1925 ? 0 : 1;
    int _1929 = ~_1771;
    int _1931 = _1929 + _1907;
    int _1933 = _1931 + 1;
    bool _1935 = _1218 == 0;
    int _1937 = abs(_1917);
    int _1939 = ~_1801;
    int _1941 = _1939 + 1;
    int _1943 = _1941 + 1;
    bool _1945 = !_1919;
    int _1947 = _1945 ? _1849 : (-1);
    int _1949 = abs(_1927);
    int _1951 = ~_1835;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = _1943 * _1947;
    bool _1959 = !_1935;
    int _1961 = _1959 ? _1913 : (-1);
    int _1963 = _1923 * _1937;
    int _1965 = _1198 * _1933;
    int _1967 = _1965 + _1238;
    int _1969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1971 = _1969 != 0;
    int _1973 = _1955 * _1961;
    bool _1975 = !_1891;
    int _1977 = _1975 ? 0 : 1;
    int _1979 = _1861 * _1949;
    int _1981 = _1979 + _1963;
    bool _1983 = !_1971;
    int _1985 = _1983 ? 0 : 1;
    int _1987 = abs(_1977);
    int _1989 = abs(_1985);
    bool _1991 = _1198 == 0;
    int _1993 = _1827 * _1987;
    int _1995 = _1993 + _1981;
    int _1997 = _1204 + (-1);
    float _1999 = trunc(_1719);
    int _2001 = int(_1999);
    int _2003 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2005 = _2003 != 0;
    int _2007 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2009 = _2007 != 0;
    int _2011 = _1737 * _1989;
    int _2013 = _2011 + _1995;
    bool _2015 = !_1991;
    int _2017 = _2015 ? _1967 : (-1);
    int _2019 = _1801 * _1997;
    int _2021 = _2019 + _1957;
    int _2023 = ~_1879;
    int _2025 = _2023 + 1;
    int _2027 = _2025 + 1;
    float _2029 = float(uint(_2013));
    bool _2031 = !_2009;
    int _2033 = _2031 ? 0 : 1;
    int _2035 = _2027 * _2017;
    int _2037 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2039 = _2037 != 0;
    int _2041 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2043 = _2041 != 0;
    float _2045 = as_type<float>(_1234) * _2029;
    int _2047 = abs(_2033);
    bool _2049 = !_2005;
    int _2051 = _2049 ? 0 : 1;
    int _2053 = _1218 + (-1);
    float _2055 = trunc(_2045);
    float _2057 = precise::max(_2055, 0.0);
    uint _2059 = uint(_2057);
    int _2061 = abs(_2051);
    bool _2063 = !_2039;
    int _2065 = _2063 ? 0 : 1;
    int _2067 = _1835 * _2053;
    int _2069 = _2067 + _1973;
    int _2071 = ~_1184;
    int _2073 = _2071 + 1;
    int _2075 = _2021 * _2047;
    int _2077 = abs(_2065);
    int _2079 = _1198 + (-1);
    int _2081 = _2001 * _2061;
    int _2083 = _2081 + _2075;
    bool _2085 = !_2043;
    int _2087 = _2085 ? 0 : 1;
    int _2089 = _1879 * _2079;
    int _2091 = _2089 + _2035;
    int _2093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2095 = _2093 != 0;
    int _2097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2099 = _2097 != 0;
    float _2101 = trunc(_1721);
    int _2103 = int(_2101);
    int _2105 = abs(_2087);
    int _2107 = _2073 * int(_2059);
    int _2109 = _2107 + _2013;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2113 = _2111 != 0;
    int _2115 = _1855 * _2077;
    int _2117 = _2115 + _2083;
    bool _2119 = !_2099;
    int _2121 = _2119 ? 0 : 1;
    float _2123 = float(uint(_2109));
    int _2125 = _1759 * _2105;
    int _2127 = _2125 + _2117;
    bool _2129 = !_2113;
    int _2131 = _2129 ? 0 : 1;
    float _2133 = trunc(_1729);
    int _2135 = int(_2133);
    int _2137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2139 = _2137 != 0;
    float _2141 = as_type<float>(_1234) * _2123;
    int _2143 = abs(_2121);
    bool _2145 = !_2139;
    int _2147 = _2145 ? 0 : 1;
    float _2149 = float(uint(_2127));
    int _2151 = _2069 * _2143;
    int _2153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2155 = _2153 != 0;
    int _2157 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2159 = _2157 != 0;
    int _2161 = abs(_2131);
    float _2163 = as_type<float>(_1268) * _2149;
    float _2165 = trunc(_2141);
    float _2167 = precise::max(_2165, 0.0);
    uint _2169 = uint(_2167);
    bool _2171 = !_2095;
    int _2173 = _2171 ? 0 : 1;
    bool _2175 = !_2159;
    int _2177 = _2175 ? 0 : 1;
    int _2179 = abs(_2173);
    int _2181 = abs(_2177);
    float _2183 = trunc(_2163);
    float _2185 = precise::max(_2183, 0.0);
    uint _2187 = uint(_2185);
    int _2189 = _2103 * _2179;
    int _2191 = _2189 + _2151;
    int _2193 = abs(_2147);
    int _2195 = _2091 * _2181;
    int _2197 = ~_1204;
    int _2199 = _2197 + 1;
    int _2201 = _1903 * _2161;
    int _2203 = _2201 + _2191;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_1723);
    int _2211 = int(_2209);
    int _2213 = _2135 * _2193;
    int _2215 = _2213 + _1238;
    int _2217 = int(_2059) + int(_2169);
    bool _2219 = !_2155;
    int _2221 = _2219 ? 0 : 1;
    bool _2223 = !_2207;
    int _2225 = _2223 ? 0 : 1;
    int _2227 = abs(_2221);
    int _2229 = _2199 * int(_2187);
    int _2231 = _2229 + _2127;
    int _2233 = abs(_2225);
    int _2235 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2237 = _2235 != 0;
    int _2239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2241 = _2239 != 0;
    int _2243 = ~_1184;
    int _2245 = _2243 + 1;
    int _2247 = _1775 * _2233;
    int _2249 = _2247 + _2203;
    float _2251 = float(uint(_2231));
    int _2253 = _2211 * _2227;
    int _2255 = _2253 + _2195;
    bool _2257 = !_2237;
    int _2259 = _2257 ? 0 : 1;
    int _2261 = _2245 * _2217;
    int _2263 = _2261 + _2013;
    bool _2265 = !_2241;
    int _2267 = _2265 ? 0 : 1;
    float _2269 = as_type<float>(_1268) * _2251;
    int _2271 = abs(_2259);
    float _2273 = float(uint(_2249));
    float _2275 = trunc(_2269);
    float _2277 = precise::max(_2275, 0.0);
    uint _2279 = uint(_2277);
    bool _2281 = uint(_2263) >= uint(_1184);
    float _2283 = as_type<float>(_1305) * _2273;
    bool _2285 = !_2281;
    int _2287 = _2285 ? 0 : (-1);
    int _2289 = abs(_2267);
    float _2291 = trunc(_2283);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2299 = _2297 != 0;
    int _2301 = _2215 * _2271;
    int _2303 = _2301 + _2255;
    int _2305 = ~_2217;
    int _2307 = _2305 + _2287;
    int _2309 = _2307 + 1;
    bool _2311 = _1184 == 0;
    int _2313 = _2135 * _2289;
    int _2315 = _2313 + _2303;
    int _2317 = ~_1218;
    int _2319 = _2317 + 1;
    int _2321 = _1184 * _2309;
    int _2323 = _2321 + _2013;
    bool _2325 = _1112 > 0.5;
    float _2327 = in.m_65.w;
    float _2329 = float(uint(_2315));
    float _2331 = -_1745;
    float _2333 = _2331 + 1.0;
    bool _2335 = !_2311;
    int _2337 = _2335 ? _2323 : (-1);
    int _2339 = as_type<int>(_2163);
    if (_2299)
    {
        float _2341 = -_1118;
        float _2343 = _2341 + 1.0;
        _2339 = as_type<int>(_2343);
    }
    int _2345 = _2339;
    int _2347 = int(_2187) + int(_2279);
    float _2349 = as_type<float>(_1246) * _2329;
    int _2351 = _2319 * int(_2295);
    int _2353 = _2351 + _2249;
    int _2355 = _2337 & 3;
    bool _2357 = _2355 != 0;
    if (_2299)
    {
        float _2359 = _2325 ? as_type<float>(_2345) : _1118;
        _1282 = _2359;
    }
    float _2361 = _1282;
    int _2363 = ~_1204;
    int _2365 = _2363 + 1;
    float _2367 = trunc(_2349);
    float _2369 = precise::max(_2367, 0.0);
    uint _2371 = uint(_2369);
    bool _2373 = uint(_2355) > 1u;
    float _2375 = float(uint(_2353));
    int _2377 = _2365 * _2347;
    int _2379 = _2377 + _2127;
    int _2381 = _2337 & 3;
    bool _2383 = _2381 != 0;
    int _2385 = ~_1198;
    int _2387 = _2385 + 1;
    float _2389 = as_type<float>(_1305) * _2375;
    int _2391 = _2383 ? 0 : 1;
    bool _2393 = uint(_2379) >= uint(_1204);
    int _2395 = ~_2391;
    int _2397 = _2395 + 1;
    int _2399 = _2397 + 1;
    float _2401 = trunc(_2389);
    float _2403 = precise::max(_2401, 0.0);
    uint _2405 = uint(_2403);
    int _2407 = _2399;
    if (!_2373)
    {
        int _2409 = ~_2391;
        int _2411 = _2409 + 1;
        _2407 = _2411;
    }
    int _2413 = _2407;
    int _2415 = _2387 * int(_2371);
    int _2417 = _2415 + _2315;
    bool _2419 = !_2393;
    int _2421 = _2419 ? 0 : (-1);
    bool _2423 = _2355 != 3;
    bool _2425 = uint(_2355) >= 2u;
    int _2427 = ~_2347;
    int _2429 = _2427 + _2421;
    int _2431 = _2429 + 1;
    int _2433 = _2425 ? 0 : 1;
    float _2435 = float(uint(_2417));
    int _2437 = _1204 * _2431;
    int _2439 = _2437 + _2127;
    int _2441 = _2325 ? as_type<int>(_2333) : as_type<int>(_1745);
    bool _2443 = _2327 > 0.5;
    float _2445 = as_type<float>(_1246) * _2435;
    int _2447 = ~_1218;
    int _2449 = _2447 + 1;
    bool _2451 = _1204 == 0;
    float _2453 = trunc(_2445);
    float _2455 = precise::max(_2453, 0.0);
    uint _2457 = uint(_2455);
    int _2459 = ~_2433;
    int _2461 = _2459 + 1;
    int _2463 = _2461 + 1;
    int _2465 = _2463;
    if (_2423)
    {
        int _2467 = ~_2433;
        int _2469 = _2467 + 1;
        _2465 = _2469;
    }
    int _2471 = _2465;
    int _2473 = int(_2295) + int(_2405);
    bool _2475 = !_2451;
    int _2477 = _2475 ? _2439 : (-1);
    int _2479 = _2443 ? as_type<int>(_2333) : as_type<int>(_1745);
    int _2481 = _2449 * _2473;
    int _2483 = _2481 + _2249;
    int _2485 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2487 = _2485 != 0;
    int _2489 = _2477 & 3;
    bool _2491 = _2489 != 0;
    bool _2493 = !_2487;
    int _2495 = _2493 ? 0 : 1;
    bool _2497 = uint(_2489) >= 2u;
    int _2499 = _2491 ? 0 : 1;
    bool _2501 = uint(_2483) >= uint(_1218);
    int _2503 = _2497 ? 0 : 1;
    bool _2505 = _2489 != 3;
    bool _2507 = !_2501;
    int _2509 = _2507 ? 0 : (-1);
    int _2511 = ~_1198;
    int _2513 = _2511 + 1;
    bool _2515 = uint(_2489) > 1u;
    int _2517 = ~_2473;
    int _2519 = _2517 + _2509;
    int _2521 = _2519 + 1;
    int _2523 = int(_2371) + int(_2457);
    int _2525 = _1218 * _2521;
    int _2527 = _2525 + _2249;
    bool _2529 = _1218 == 0;
    int _2531 = ~_2503;
    int _2533 = _2531 + 1;
    int _2535 = _2533 + 1;
    int _2537 = _2513 * _2523;
    int _2539 = _2537 + _2315;
    int _2541 = _2535;
    if (_2505)
    {
        int _2543 = ~_2503;
        int _2545 = _2543 + 1;
        _2541 = _2545;
    }
    int _2547 = _2541;
    int _2549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2551 = _2549 != 0;
    int _2553 = ~_2499;
    int _2555 = _2553 + 1;
    int _2557 = _2555 + 1;
    bool _2559 = !_2529;
    int _2561 = _2559 ? _2527 : (-1);
    int _2563 = _2557;
    if (!_2515)
    {
        int _2565 = ~_2499;
        int _2567 = _2565 + 1;
        _2563 = _2567;
    }
    int _2569 = _2563;
    bool _2571 = uint(_2539) >= uint(_1198);
    bool _2573 = !_2551;
    int _2575 = _2573 ? 0 : 1;
    int _2577 = _2561 & 3;
    bool _2579 = _2577 != 0;
    bool _2581 = !_2571;
    int _2583 = _2581 ? 0 : (-1);
    int _2585 = _2579 ? 0 : 1;
    bool _2587 = uint(_2577) >= 2u;
    bool _2589 = _2577 != 3;
    int _2591 = ~_2523;
    int _2593 = _2591 + _2583;
    int _2595 = _2593 + 1;
    int _2597 = _2587 ? 0 : 1;
    bool _2599 = uint(_2577) > 1u;
    int _2601 = _1198 * _2595;
    int _2603 = _2601 + _2315;
    bool _2605 = _1198 == 0;
    int _2607 = ~_2597;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2605;
    int _2615 = _2613 ? _2603 : (-1);
    int _2617 = _2611;
    if (_2589)
    {
        int _2619 = ~_2597;
        int _2621 = _2619 + 1;
        _2617 = _2621;
    }
    int _2623 = _2617;
    int _2625 = _2615 & 3;
    bool _2627 = _2625 != 0;
    int _2629 = ~_2585;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    int _2635 = _2633;
    if (!_2599)
    {
        int _2637 = ~_2585;
        int _2639 = _2637 + 1;
        _2635 = _2639;
    }
    int _2641 = _2635;
    bool _2643 = uint(_2625) >= 2u;
    int _2645 = _2627 ? 0 : 1;
    int _2647 = _2643 ? 0 : 1;
    bool _2649 = _2625 != 3;
    bool _2651 = uint(_2625) > 1u;
    int _2653 = ~_2647;
    int _2655 = _2653 + 1;
    int _2657 = _2655 + 1;
    int _2659 = ~_2645;
    int _2661 = _2659 + 1;
    int _2663 = _2661 + 1;
    float _2665 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2667 = _2665 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2669 = _2657;
    int _2671 = _2663;
    if (_2649)
    {
        int _2673 = ~_2647;
        int _2675 = _2673 + 1;
        _2669 = _2675;
    }
    int _2677 = _2669;
    float _2679 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2681 = _2679 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2651)
    {
        int _2683 = ~_2645;
        int _2685 = _2683 + 1;
        _2671 = _2685;
    }
    int _2687 = _2671;
    float _2689 = 1.0 / _2667;
    float _2691 = in.m_50.x;
    float _2693 = in.m_50.y;
    float _2695 = in.m_50.z;
    int _2697 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2699 = _2697 != 0;
    float _2701 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2703 = _2701 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2707 = _2705 != 0;
    bool _2709 = !_2699;
    int _2711 = _2709 ? 0 : 1;
    float _2713 = _2707 ? as_type<float>(_2441) : _1745;
    float _2715 = 1.0 / _2681;
    int _2717 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2719 = _2717 != 0;
    bool _2721 = _1427 > 0.5;
    float _2723 = _2719 ? as_type<float>(_2479) : _1745;
    int _2725 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2727 = _2725 != 0;
    float _2729 = 1.0 / _2703;
    int _2731 = _2721 ? as_type<int>(_2333) : as_type<int>(_1745);
    int _2733 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2735 = _2733 != 0;
    float _2737 = _2727 ? as_type<float>(_2731) : _1745;
    float _2739 = _200 * _2693;
    float _2741 = _2735 ? as_type<float>(_2731) : _1745;
    int _2743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2745 = _2743 != 0;
    int _2747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2749 = _2747 != 0;
    float _2751 = fma(_198, _2691, _2739);
    int _2753 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2755 = _2753 != 0;
    float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2759 = _2757 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2761 = _206 * _2693;
    float _2763 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2765 = _1112 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2767 = _1417 * 2.0;
    float _2769 = 1.0 / _2759;
    float _2771 = _212 * _2693;
    float _2773 = fma(_204, _2691, _2761);
    float _2775 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2777 = _2775 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2779 = fma(_2765, -2.0, _2763);
    float _2781 = fma(_210, _2691, _2771);
    float _2783 = floor(_2767);
    float _2785 = fma(_202, _2695, _2751);
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2787;
    float _2791 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2793 = _2791 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2795 = fma(_214, _2695, _2781);
    float _2797 = fma(_208, _2695, _2773);
    float _2799 = 1.0 / _2777;
    float _2801 = _2745 ? as_type<float>(_2731) : _1745;
    float _2803 = _2789 * _2729;
    float _2805 = _2749 ? as_type<float>(_2731) : _1745;
    float _2807 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2809 = _1106 + _2807;
    bool _2811 = !_2755;
    int _2813 = _2811 ? 0 : 1;
    float _2815 = _2785 + _1541;
    float _2817 = float(uint(_1903));
    float _2819 = 1.0 / _2793;
    float _2821 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2823 = _2821 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2825 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2827 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2825;
    bool _2829 = _2783 > 0.0;
    float _2831 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2779);
    float _2833 = _2823 * _2689;
    float _2835 = _2827 * _2715;
    float _2837 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2839 = _2837 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2843 = _2841 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2845 = _2783 >= 0.0;
    bool _2847 = isnan(_2783);
    bool _2849 = _2845 || _2847;
    bool _2851 = isnan(0.0);
    bool _2853 = _2849 || _2851;
    float _2855 = 1.0 / _2839;
    float _2857 = _2843 * _2769;
    float _2859 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2861 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2859;
    int _2863 = _2853 ? 0 : 1;
    float _2865 = _2861 * _2799;
    float _2867 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2869 = _2867 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2871 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2873 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2871;
    float _2875 = _1112 * 2.0;
    int _2877 = ~_2863;
    int _2879 = _2877 + 1;
    int _2881 = _2879 + 1;
    float _2883 = _2869 * _2819;
    float _2885 = float(uint(_1827));
    bool _2887 = _1429 != 2;
    int _2889 = _2881;
    float _2891 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2893 = _2769;
    float _2895 = _2819;
    float _2897 = _2805;
    if (!_2829)
    {
        int _2899 = ~_2863;
        int _2901 = _2899 + 1;
        _2889 = _2901;
    }
    int _2903 = _2889;
    float _2905 = _2873 * _2855;
    float _2907 = floor(_2875);
    float _2909 = as_type<float>(_1234) * _2885;
    if (!_1499)
    {
        _2891 = _1112;
    }
    float _2911 = _2891;
    float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2915 = _1106 + _2913;
    float _2917 = _2911;
    if (!_1499)
    {
        _2893 = _1112;
    }
    float _2919 = _2893;
    float _2921 = _2919;
    if (!_1499)
    {
        _2895 = _1427;
    }
    float _2923 = _2895;
    float _2925 = fma(_2803, _2915, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2927 = trunc(_2909);
    float _2929 = precise::max(_2927, 0.0);
    uint _2931 = uint(_2929);
    float _2933 = 0.0;
    float _2935 = _2923;
    if (!_1499)
    {
        _2933 = _1427;
    }
    float _2937 = _2933;
    float _2939 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2941 = _1106 + _2939;
    bool _2943 = !_1499;
    float _2945 = _2943 ? as_type<float>(_1431) : as_type<float>(_1433);
    float _2947 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2949 = _1106 + _2947;
    bool _2951 = !_1499;
    float _2953 = _2951 ? as_type<float>(_1433) : as_type<float>(_1435);
    float _2955 = fma(_2857, _2941, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2957 = _2937;
    if (_1499)
    {
        _2917 = _1417;
    }
    float _2959 = _2917;
    float _2961 = fma(_2883, _2949, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1499)
    {
        _2921 = _1417;
    }
    float _2963 = _2921;
    if (_1499)
    {
        _2935 = _1112;
    }
    float _2965 = _2935;
    if (_1499)
    {
        _2957 = _1112;
    }
    float _2967 = _2957;
    bool _2969 = _2907 > 0.0;
    bool _2971 = _2907 >= 0.0;
    bool _2973 = isnan(_2907);
    bool _2975 = _2971 || _2973;
    bool _2977 = isnan(0.0);
    bool _2979 = _2975 || _2977;
    float _2981 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2983 = _1106 + _2981;
    int _2985 = ~_1184;
    int _2987 = _2985 + 1;
    float _2989 = float(uint(_1855));
    float _2991 = fma(_2833, _2983, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2993 = fma(_2835, _2809, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2995 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2997 = _1106 + _2995;
    int _2999 = _2987 * int(_2931);
    int _3001 = _2999 + _1827;
    float _3003 = as_type<float>(_1268) * _2989;
    bool _3005 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3007 = isnan(_1106);
    bool _3009 = _3005 || _3007;
    bool _3011 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3013 = _3009 || _3011;
    float _3015 = float(_3013);
    float _3017 = fma(_2905, _2997, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3019 = float(uint(_2215));
    float _3021 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3023 = _1106 + _3021;
    float _3025 = float(uint(_3001));
    float _3027 = _2797 + _1503;
    float _3029 = trunc(_3003);
    float _3031 = precise::max(_3029, 0.0);
    uint _3033 = uint(_3031);
    bool _3035 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3037 = isnan(_1106);
    bool _3039 = _3035 || _3037;
    bool _3041 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3043 = _3039 || _3041;
    float _3045 = float(_3043);
    float _3047 = -_3015;
    float _3049 = _3047 + 1.0;
    float _3051 = as_type<float>(_1234) * _3025;
    bool _3053 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3055 = isnan(_1106);
    bool _3057 = _3053 || _3055;
    bool _3059 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3061 = _3057 || _3059;
    float _3063 = float(_3061);
    float _3065 = as_type<float>(_1246) * _3019;
    float _3067 = -_3045;
    float _3069 = _3067 + 1.0;
    bool _3071 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3073 = isnan(_1106);
    bool _3075 = _3071 || _3073;
    bool _3077 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3079 = _3075 || _3077;
    float _3081 = float(_3079);
    float _3083 = fma(_2865, _3023, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3085 = -_3063;
    float _3087 = _3085 + 1.0;
    float _3089 = _3063 * _3069;
    bool _3091 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3093 = isnan(_1106);
    bool _3095 = _3091 || _3093;
    bool _3097 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3099 = _3095 || _3097;
    float _3101 = float(_3099);
    float _3103 = trunc(_3065);
    float _3105 = precise::max(_3103, 0.0);
    uint _3107 = uint(_3105);
    float _3109 = _3015 * _3087;
    float _3111 = as_type<float>(_1305) * _2817;
    bool _3113 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3115 = isnan(_1106);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = -_3101;
    float _3127 = _3125 + 1.0;
    int _3129 = _1613 * int(_3033);
    int _3131 = _3129 + _1855;
    float _3133 = _3101 * _3049;
    bool _3135 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3137 = isnan(_1106);
    bool _3139 = _3135 || _3137;
    bool _3141 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3143 = _3139 || _3141;
    float _3145 = float(_3143);
    float _3147 = trunc(_3111);
    float _3149 = precise::max(_3147, 0.0);
    uint _3151 = uint(_3149);
    float _3153 = _3081 * _3127;
    float _3155 = float(uint(_3131));
    float _3157 = -_3081;
    float _3159 = _3157 + 1.0;
    int _3161 = ~_1218;
    int _3163 = _3161 + 1;
    bool _3165 = _1106 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3167 = isnan(_1106);
    bool _3169 = _3165 || _3167;
    bool _3171 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3173 = _3169 || _3171;
    float _3175 = float(_3173);
    float _3177 = as_type<float>(_1268) * _3155;
    float _3179 = -_3123;
    float _3181 = _3179 + 1.0;
    int _3183 = ~_1198;
    int _3185 = _3183 + 1;
    float _3187 = trunc(_3051);
    float _3189 = precise::max(_3187, 0.0);
    uint _3191 = uint(_3189);
    float _3193 = _3145 * _3159;
    float _3195 = _3175 * _3181;
    float _3197 = -_3145;
    float _3199 = _3197 + 1.0;
    int _3201 = _3185 * int(_3107);
    int _3203 = _3201 + _2215;
    float _3205 = -_3175;
    float _3207 = _3205 + 1.0;
    int _3209 = _3163 * int(_3151);
    int _3211 = _3209 + _1903;
    float _3213 = _2925 * _3195;
    float _3215 = trunc(_3177);
    float _3217 = precise::max(_3215, 0.0);
    uint _3219 = uint(_3217);
    float _3221 = _3123 * _3199;
    float _3223 = _2979 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3225 = fma(_3207, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3213);
    float _3227 = float(uint(_3211));
    float _3229 = _2795 + _1597;
    int _3231 = ~_1184;
    int _3233 = _3231 + 1;
    float _3235 = fma(_2991, _3221, _3225);
    float _3237 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3239 = _2815 + _3237;
    float _3241 = as_type<float>(_1305) * _3227;
    float _3243 = float(uint(_3203));
    float _3245 = fma(_2993, _3193, _3235);
    int _3247 = ~_1204;
    int _3249 = _3247 + 1;
    float _3251 = trunc(_3241);
    float _3253 = precise::max(_3251, 0.0);
    uint _3255 = uint(_3253);
    int _3257 = ~as_type<int>(_3223);
    int _3259 = _3257 + 1;
    int _3261 = _3259 + 1;
    float _3263 = as_type<float>(_1246) * _3243;
    int _3265 = int(_2931) + int(_3191);
    float _3267 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3269 = _3027 + _3267;
    int _3271 = int(_3033) + int(_3219);
    float _3273 = fma(_2955, _3153, _3245);
    int _3275 = _3261;
    float _3277 = _3223;
    float _3279 = _3221;
    if (!_2969)
    {
        int _3281 = ~as_type<int>(_3223);
        int _3283 = _3281 + 1;
        _3275 = _3283;
    }
    int _3285 = _3275;
    float _3287 = trunc(_3263);
    float _3289 = precise::max(_3287, 0.0);
    uint _3291 = uint(_3289);
    int _3293 = _3233 * _3265;
    int _3295 = _3293 + _1827;
    int _3297 = ~_1218;
    int _3299 = _3297 + 1;
    float _3301 = fma(_3083, _3133, _3273);
    float _3303 = _1417 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3305 = uint(_3295) >= uint(_1184);
    int _3307 = _3249 * _3271;
    int _3309 = _3307 + _1855;
    float _3311 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3313 = int(_3151) + int(_3255);
    float _3315 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3317 = !_3305;
    int _3319 = _3317 ? 0 : (-1);
    float _3321 = _1427 * 2.0;
    bool _3323 = uint(_3309) >= uint(_1204);
    float _3325 = _3269 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3327 = -_3315;
    float _3329 = fma(_3303, 2.0, _3327);
    int _3331 = int(_3107) + int(_3291);
    int _3333 = _3299 * _3313;
    int _3335 = _3333 + _1903;
    int _3337 = ~_1198;
    int _3339 = _3337 + 1;
    float _3341 = floor(_3321);
    bool _3343 = !_3323;
    int _3345 = _3343 ? 0 : (-1);
    float _3347 = -_168;
    float _3349 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3329);
    bool _3351 = uint(_3335) >= uint(_1218);
    float _3353 = fma(_3239, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3325);
    float _3355 = _3311 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3357 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3359 = _3229 + _3357;
    bool _3361 = !_3351;
    int _3363 = _3361 ? 0 : (-1);
    float _3365 = fma(_3355, _1321, -0.5);
    int _3367 = _3339 * _3331;
    int _3369 = _3367 + _2215;
    float _3371 = fma(_3359, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3353);
    bool _3373 = uint(_3369) >= uint(_1198);
    float _3375 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3377 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3379 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3381 = !_3373;
    int _3383 = _3381 ? 0 : (-1);
    float _3385 = fma(as_type<float>(_1435), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3375);
    bool _3387 = _3371 >= 0.0;
    float _3389 = as_type<float>(_1435) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3391 = fma(as_type<float>(_1433), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3377);
    float _3393 = as_type<float>(_1433) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3395 = _1112 + _1417;
    float _3397 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3385);
    float _3399 = fma(_3393, -2.0, _3379);
    float _3401 = _3395 + (-1.0);
    float _3403 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3405 = ~_3271;
    int _3407 = _3405 + _3345;
    int _3409 = _3407 + 1;
    float _3411 = fma(_2961, _3109, _3301);
    float _3413 = fma(_3401, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3415 = _3401;
    if (_3387)
    {
        _3415 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3417 = _3415;
    float _3419 = -_3403;
    float _3421 = fma(_3389, 2.0, _3419);
    int _3423 = ~_3265;
    int _3425 = _3423 + _3319;
    int _3427 = _3425 + 1;
    bool _3429 = !_2357;
    int _3431 = _3429 ? 0 : 1;
    int _3433 = as_type<int>(_3417);
    if (_3387)
    {
        float _3435 = _3417 * 5.0;
        _3433 = as_type<int>(_3435);
    }
    int _3437 = _3433;
    int _3439 = _2477 & 3;
    bool _3441 = _3439 != 0;
    float _3443 = fma(_3017, _3089, _3411);
    int _3445 = _1184 * _3427;
    int _3447 = _3445 + _1827;
    if (_3387)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11697 = as_type<float>(_3437);
        out.gl_Position.z = _11697;
    }
    bool _3449 = !_3441;
    int _3451 = _3449 ? 0 : 1;
    float _3453 = fma(_3045, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3443);
    int _3455 = _2561 & 3;
    bool _3457 = _3455 != 0;
    float _3459 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3461 = _1204 * _3409;
    int _3463 = _3461 + _1855;
    bool _3465 = !_3457;
    int _3467 = _3465 ? 0 : 1;
    float _3469 = fma(_2963, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3459);
    int _3471 = _2615 & 3;
    bool _3473 = _3471 != 0;
    out.m_77.x = _3453;
    float _3475 = _3269 * _3269;
    bool _3477 = !_3473;
    int _3479 = _3477 ? 0 : 1;
    float _3481 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3391);
    bool _3483 = _2355 != 3;
    float _3485 = fma(_3239, _3239, _3475);
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3489 = fma(_3359, _3359, _3485);
    bool _3491 = !_3483;
    int _3493 = _3491 ? 0 : (-1);
    float _3495 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3497 = _2337 >> 31;
    float _3499 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3501 = _2489 != 3;
    float _3503 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3495);
    float _3505 = _2945 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3507 = _3497 & 3;
    float _3509 = rsqrt(_3489);
    int _3511 = _2561 >> 31;
    float _3513 = fma(_3505, -2.0, _3499);
    int _3515 = _2477 >> 31;
    float _3517 = fma(_2953, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3487);
    int _3519 = _2337 + _3507;
    float _3521 = _2953 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3523 = _3515 & 3;
    float _3525 = -_168;
    float _3527 = fma(_3525, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3421);
    int _3529 = _3519 >> 2;
    float _3531 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3399);
    int _3533 = _2477 + _3523;
    float _3535 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3517);
    int _3537 = _2615 >> 31;
    float _3539 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3469);
    int _3541 = _3511 & 3;
    float _3543 = _3239 * _3509;
    int _3545 = _3533 >> 2;
    float _3547 = _3269 * _3509;
    int _3549 = _3529 << 4;
    int _3551 = _3549 + 368;
    float _3553 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3513);
    bool _3555 = !_3501;
    int _3557 = _3555 ? 0 : (-1);
    float _3559 = -_3547;
    float _3561 = fma(_3559, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3269);
    bool _3563 = _2577 != 3;
    if (_3387)
    {
        out.m_53.x = 0.0;
    }
    if (_2887)
    {
        _3277 = _1417;
    }
    float _3565 = _3277;
    float _3567 = _3561 * _3561;
    float _3569 = _3565;
    if (_2887)
    {
        _3279 = _1112;
    }
    float _3571 = _3279;
    int _3573 = _3537 & 3;
    float _3575 = _3571;
    if (!_2887)
    {
        _3569 = _1427;
    }
    float _3577 = _3569;
    uint _3579 = uint(int(uint(_3551) >> uint(2)));
    uint _3581 = uint(int(uint(int(_3579)) >> uint(2)));
    int _3583 = int(_3579) & 3;
    float _3585 = (*spvDescriptorSet0.vp_c9)._m0[int(_3581)][_3583];
    int _3587 = int(_3579) + 1;
    uint _3589 = uint(int(uint(_3587) >> uint(2)));
    int _3591 = _3587 & 3;
    float _3593 = (*spvDescriptorSet0.vp_c9)._m0[int(_3589)][_3591];
    if (!_2887)
    {
        _3575 = _1417;
    }
    float _3595 = _3575;
    int _3597 = _2561 + _3541;
    float _3599 = _3577 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3601 = _3545 << 4;
    int _3603 = _3601 + 512;
    float _3605 = _3595 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3607 = _3341 > 0.0;
    float _3609 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3611 = int(_3609);
    bool _3613 = _3341 >= 0.0;
    bool _3615 = isnan(_3341);
    bool _3617 = _3613 || _3615;
    bool _3619 = isnan(0.0);
    bool _3621 = _3617 || _3619;
    uint _3623 = uint(int(uint(_3603) >> uint(2)));
    uint _3625 = uint(int(uint(int(_3623)) >> uint(2)));
    int _3627 = int(_3623) & 3;
    float _3629 = (*spvDescriptorSet0.vp_c9)._m0[int(_3625)][_3627];
    int _3631 = int(_3623) + 1;
    uint _3633 = uint(int(uint(_3631) >> uint(2)));
    int _3635 = _3631 & 3;
    float _3637 = (*spvDescriptorSet0.vp_c9)._m0[int(_3633)][_3635];
    bool _3639 = _2625 != 3;
    float _3641 = -_3543;
    float _3643 = fma(_3641, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3239);
    int _3645 = _2615 + _3573;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3649 = _3597 >> 2;
    float _3651 = fma(_3643, _3643, _3567);
    float _3653 = -_3647;
    float _3655 = fma(_3521, 2.0, _3653);
    bool _3657 = !_2311;
    int _3659 = _3657 ? _3447 : (-1);
    float _3661 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3663 = int(_3661);
    bool _3665 = !_2451;
    int _3667 = _3665 ? _3463 : (-1);
    float _3669 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3671 = !_3639;
    int _3673 = _3671 ? 0 : (-1);
    float _3675 = _2965 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3677 = _3645 >> 2;
    int _3679 = _3649 << 4;
    int _3681 = _3679 + 656;
    int _3683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3685 = _3683 != 0;
    int _3687 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3689 = _3687 != 0;
    int _3691 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3693 = _3691 != 0;
    float _3695 = _2959 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3697 = _3677 << 4;
    int _3699 = _3697 + 800;
    uint _3701 = uint(int(uint(_3681) >> uint(2)));
    uint _3703 = uint(int(uint(int(_3701)) >> uint(2)));
    int _3705 = int(_3701) & 3;
    float _3707 = (*spvDescriptorSet0.vp_c9)._m0[int(_3703)][_3705];
    int _3709 = int(_3701) + 1;
    uint _3711 = uint(int(uint(_3709) >> uint(2)));
    int _3713 = _3709 & 3;
    float _3715 = (*spvDescriptorSet0.vp_c9)._m0[int(_3711)][_3713];
    float _3717 = -_3669;
    float _3719 = fma(_3695, 2.0, _3717);
    float _3721 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3723 = _3621 ? 0 : 1;
    uint _3725 = uint(int(uint(_3699) >> uint(2)));
    uint _3727 = uint(int(uint(int(_3725)) >> uint(2)));
    int _3729 = int(_3725) & 3;
    float _3731 = (*spvDescriptorSet0.vp_c9)._m0[int(_3727)][_3729];
    int _3733 = int(_3725) + 1;
    uint _3735 = uint(int(uint(_3733) >> uint(2)));
    int _3737 = _3733 & 3;
    float _3739 = (*spvDescriptorSet0.vp_c9)._m0[int(_3735)][_3737];
    float _3741 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3743 = -_3721;
    float _3745 = fma(_3599, 2.0, _3743);
    float _3747 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3749 = ~_3313;
    int _3751 = _3749 + _3363;
    int _3753 = _3751 + 1;
    float _3755 = fma(_3605, -2.0, _3741);
    int _3757 = ~_3331;
    int _3759 = _3757 + _3383;
    int _3761 = _3759 + 1;
    float _3763 = fma(_3675, -2.0, _3747);
    int _3765 = _3551 + 8;
    uint _3767 = uint(int(uint(_3765) >> uint(2)));
    uint _3769 = uint(int(uint(int(_3767)) >> uint(2)));
    int _3771 = int(_3767) & 3;
    float _3773 = (*spvDescriptorSet0.vp_c9)._m0[int(_3769)][_3771];
    int _3775 = int(_3767) + 1;
    uint _3777 = uint(int(uint(_3775) >> uint(2)));
    int _3779 = _3775 & 3;
    float _3781 = (*spvDescriptorSet0.vp_c9)._m0[int(_3777)][_3779];
    int _3783 = ~_3723;
    int _3785 = _3783 + 1;
    int _3787 = _3785 + 1;
    float _3789 = -_168;
    float _3791 = fma(_3789, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3719);
    int _3793 = _3787;
    if (!_3607)
    {
        int _3795 = ~_3723;
        int _3797 = _3795 + 1;
        _3793 = _3797;
    }
    int _3799 = _3793;
    int _3801 = _1198 * _3761;
    int _3803 = _3801 + _2215;
    int _3805 = abs(_2569);
    float _3807 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3763);
    int _3809 = abs(_2413);
    int _3811 = _3681 + 8;
    uint _3813 = uint(int(uint(_3811) >> uint(2)));
    uint _3815 = uint(int(uint(int(_3813)) >> uint(2)));
    int _3817 = int(_3813) & 3;
    float _3819 = (*spvDescriptorSet0.vp_c9)._m0[int(_3815)][_3817];
    int _3821 = int(_3813) + 1;
    uint _3823 = uint(int(uint(_3821) >> uint(2)));
    int _3825 = _3821 & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = abs(_2641);
    int _3831 = _1218 * _3753;
    int _3833 = _3831 + _1903;
    int _3835 = ~_3809;
    int _3837 = _3835 + 1;
    int _3839 = _3837 + 1;
    float _3841 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3843 = int(_3841);
    int _3845 = ~_3805;
    int _3847 = _3845 + 1;
    int _3849 = _3847 + 1;
    float _3851 = -_168;
    float _3853 = fma(_3851, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3745);
    int _3855 = abs(_3467);
    int _3857 = _3603 + 8;
    uint _3859 = uint(int(uint(_3857) >> uint(2)));
    uint _3861 = uint(int(uint(int(_3859)) >> uint(2)));
    int _3863 = int(_3859) & 3;
    float _3865 = (*spvDescriptorSet0.vp_c9)._m0[int(_3861)][_3863];
    int _3867 = int(_3859) + 1;
    uint _3869 = uint(int(uint(_3867) >> uint(2)));
    int _3871 = _3867 & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = _3839 * as_type<int>(_3593);
    int _3877 = abs(_3479);
    int _3879 = _3849 * as_type<int>(_3637);
    int _3881 = abs(_3431);
    float _3883 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3885 = abs(_2687);
    float _3887 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3755);
    int _3889 = _3699 + 8;
    uint _3891 = uint(int(uint(_3889) >> uint(2)));
    uint _3893 = uint(int(uint(int(_3891)) >> uint(2)));
    int _3895 = int(_3891) & 3;
    float _3897 = (*spvDescriptorSet0.vp_c9)._m0[int(_3893)][_3895];
    int _3899 = int(_3891) + 1;
    uint _3901 = uint(int(uint(_3899) >> uint(2)));
    int _3903 = _3899 & 3;
    float _3905 = (*spvDescriptorSet0.vp_c9)._m0[int(_3901)][_3903];
    int _3907 = ~_3829;
    int _3909 = _3907 + 1;
    int _3911 = _3909 + 1;
    int _3913 = ~_3885;
    int _3915 = _3913 + 1;
    int _3917 = _3915 + 1;
    int _3919 = _3911 * as_type<int>(_3715);
    int _3921 = abs(_3451);
    int _3923 = ~_3881;
    int _3925 = _3923 + 1;
    int _3927 = _3925 + 1;
    float _3929 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3931 = ~_3877;
    int _3933 = _3931 + 1;
    int _3935 = _3933 + 1;
    int _3937 = _3917 * as_type<int>(_3739);
    int _3939 = ~_3921;
    int _3941 = _3939 + 1;
    int _3943 = _3941 + 1;
    int _3945 = _3927 * as_type<int>(_3585);
    int _3947 = _3945 + _3875;
    int _3949 = abs(_2471);
    int _3951 = _3935 * as_type<int>(_3731);
    int _3953 = _3951 + _3937;
    int _3955 = ~_3855;
    int _3957 = _3955 + 1;
    int _3959 = _3957 + 1;
    float _3961 = fma(_2967, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3929);
    int _3963 = abs(_2623);
    float _3965 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _3967 = int(_3965);
    int _3969 = _3943 * as_type<int>(_3629);
    int _3971 = _3969 + _3879;
    int _3973 = abs(_3493);
    int _3975 = _3959 * as_type<int>(_3707);
    int _3977 = _3975 + _3919;
    int _3979 = ~_3949;
    int _3981 = _3979 + 1;
    int _3983 = _3981 + 1;
    float _3985 = _3883 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _3987 = ~_3963;
    int _3989 = _3987 + 1;
    int _3991 = _3989 + 1;
    float _3993 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _3961);
    int _3995 = abs(_2547);
    int _3997 = _3983 * as_type<int>(_3773);
    int _3999 = _3997 + _3947;
    float _4001 = float(uint(_3663));
    int _4003 = _3991 * as_type<int>(_3819);
    int _4005 = _4003 + _3977;
    int _4007 = ~_3973;
    int _4009 = _4007 + 1;
    int _4011 = _4009 + 1;
    float _4013 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4015 = log2(_4013);
    int _4017 = abs(_2495);
    float _4019 = fma(_3985, _2801, -0.5);
    int _4021 = ~_3995;
    int _4023 = _4021 + 1;
    int _4025 = _4023 + 1;
    int _4027 = _4011 * as_type<int>(_3781);
    int _4029 = _4027 + _3999;
    int _4031 = abs(_3557);
    int _4033 = ~_4017;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = 1.0 / _4001;
    bool _4041 = !_3563;
    int _4043 = _4041 ? 0 : (-1);
    int _4045 = _4025 * as_type<int>(_3865);
    int _4047 = _4045 + _3971;
    int _4049 = ~_4031;
    int _4051 = _4049 + 1;
    int _4053 = _4051 + 1;
    int _4055 = _4029 * _4037;
    float _4057 = float(uint(_3967));
    int _4059 = abs(_2677);
    int _4061 = _4053 * as_type<int>(_3873);
    int _4063 = _4061 + _4047;
    int _4065 = abs(_4043);
    float _4067 = 1.0 / _4057;
    int _4069 = abs(_2575);
    int _4071 = _3659 * _4017;
    int _4073 = _4071 + _4055;
    float _4075 = float(uint(_3611));
    int _4077 = ~_4065;
    int _4079 = _4077 + 1;
    int _4081 = _4079 + 1;
    int _4083 = ~_4059;
    int _4085 = _4083 + 1;
    int _4087 = _4085 + 1;
    float _4089 = 1.0 / _4075;
    int _4091 = ~_4069;
    int _4093 = _4091 + 1;
    int _4095 = _4093 + 1;
    int _4097 = _4081 * as_type<int>(_3827);
    int _4099 = _4097 + _4005;
    int _4101 = abs(_3673);
    int _4103 = _4087 * as_type<int>(_3897);
    int _4105 = _4103 + _3953;
    int _4107 = as_type<int>(_4039) + (-2);
    int _4109 = _4095 * _4063;
    int _4111 = abs(_2711);
    float _4113 = float(uint(_4073));
    int _4115 = _3667 * _4069;
    int _4117 = _4115 + _4109;
    float _4119 = float(uint(_3843));
    int _4121 = abs(_2813);
    float _4123 = as_type<float>(_4107) * _4113;
    int _4125 = ~_4101;
    int _4127 = _4125 + 1;
    int _4129 = _4127 + 1;
    int _4131 = ~_4111;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    float _4137 = 1.0 / _4119;
    bool _4139 = _1218 == 0;
    int _4141 = _4129 * as_type<int>(_3905);
    int _4143 = _4141 + _4105;
    int _4145 = _4135 * _4099;
    bool _4147 = !_4139;
    int _4149 = _4147 ? _3833 : (-1);
    float _4151 = _4015 * _168;
    int _4153 = ~_4121;
    int _4155 = _4153 + 1;
    int _4157 = _4155 + 1;
    float _4159 = trunc(_4123);
    float _4161 = precise::max(_4159, 0.0);
    uint _4163 = uint(_4161);
    int _4165 = as_type<int>(_4067) + (-2);
    int _4167 = _4149 * _4111;
    int _4169 = _4167 + _4145;
    float _4171 = float(uint(_4117));
    int _4173 = _4157 * _4143;
    bool _4175 = _1198 == 0;
    float _4177 = _3359 * _3509;
    int _4179 = as_type<int>(_4089) + (-2);
    float _4181 = as_type<float>(_4165) * _4171;
    bool _4183 = !_4175;
    int _4185 = _4183 ? _3803 : (-1);
    float _4187 = exp2(_4151);
    float _4189 = float(uint(_4169));
    int _4191 = ~_3663;
    int _4193 = _4191 + 1;
    int _4195 = _4185 * _4121;
    int _4197 = _4195 + _4173;
    int _4199 = as_type<int>(_4137) + (-2);
    float _4201 = as_type<float>(_4179) * _4189;
    int _4203 = abs(_3663);
    float _4205 = trunc(_4181);
    float _4207 = precise::max(_4205, 0.0);
    uint _4209 = uint(_4207);
    float _4211 = float(uint(_4197));
    int _4213 = _4193 * int(_4163);
    int _4215 = _4213 + _4073;
    float _4217 = float(uint(_4203));
    float _4219 = -_4177;
    float _4221 = fma(_4219, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3359);
    int _4223 = abs(_3967);
    float _4225 = as_type<float>(_4199) * _4211;
    float _4227 = float(uint(_4215));
    float _4229 = trunc(_4201);
    float _4231 = precise::max(_4229, 0.0);
    uint _4233 = uint(_4231);
    int _4235 = ~_3967;
    int _4237 = _4235 + 1;
    float _4239 = fma(_4221, _4221, _3651);
    int _4241 = ~_3611;
    int _4243 = _4241 + 1;
    float _4245 = as_type<float>(_4107) * _4227;
    float _4247 = float(uint(_4223));
    int _4249 = abs(_3611);
    float _4251 = trunc(_4225);
    float _4253 = precise::max(_4251, 0.0);
    uint _4255 = uint(_4253);
    int _4257 = _4237 * int(_4209);
    int _4259 = _4257 + _4117;
    int _4261 = ~_3843;
    int _4263 = _4261 + 1;
    float _4265 = float(uint(_4259));
    float _4267 = 1.0 / _4217;
    int _4269 = _4243 * int(_4233);
    int _4271 = _4269 + _4169;
    float _4273 = as_type<float>(_4165) * _4265;
    float _4275 = float(uint(_4249));
    float _4277 = float(uint(_4271));
    float _4279 = 1.0 / _4247;
    int _4281 = _4263 * int(_4255);
    int _4283 = _4281 + _4197;
    int _4285 = abs(_3843);
    float _4287 = as_type<float>(_4179) * _4277;
    int _4289 = abs(_4073);
    float _4291 = float(uint(_4283));
    float _4293 = 1.0 / _4275;
    float _4295 = float(uint(_4285));
    int _4297 = abs(_4117);
    float _4299 = as_type<float>(_4199) * _4291;
    int _4301 = as_type<int>(_4267) + (-2);
    float _4303 = float(uint(_4289));
    float _4305 = 1.0 / _4295;
    int _4307 = as_type<int>(_4279) + (-2);
    int _4309 = abs(_4169);
    float _4311 = as_type<float>(_4301) * _4303;
    float _4313 = float(uint(_4297));
    float _4315 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4317 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4319 = isnan(1.0);
    bool _4321 = _4317 || _4319;
    bool _4323 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4325 = _4321 || _4323;
    float _4327 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4329 = 1.0 + _4327;
    float _4331 = as_type<float>(_4307) * _4313;
    float _4333 = trunc(_4311);
    float _4335 = precise::max(_4333, 0.0);
    uint _4337 = uint(_4335);
    float _4339 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4315);
    int _4341 = as_type<int>(_4293) + (-2);
    float _4343 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4345 = float(uint(_4309));
    float _4347 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4349 = abs(_4197);
    float _4351 = 1.0 / _4329;
    float _4353 = as_type<float>(_4341) * _4345;
    int _4355 = as_type<int>(_4305) + (-2);
    float _4357 = -_4187;
    float _4359 = _4357 + 1.0;
    float _4361 = float(uint(_4349));
    float _4363 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4365 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4367 = isnan(0.0);
    bool _4369 = _4365 || _4367;
    bool _4371 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4373 = _4369 || _4371;
    float _4375 = trunc(_4331);
    float _4377 = precise::max(_4375, 0.0);
    uint _4379 = uint(_4377);
    float _4381 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4343);
    float _4383 = fma(_1417, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4347);
    float _4385 = as_type<float>(_4355) * _4361;
    int _4387 = ~_4203;
    int _4389 = _4387 + 1;
    float _4391 = fma(_1112, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4363);
    float _4393 = _4373 ? _4359 : 0.0;
    float _4395 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4381);
    float _4397 = trunc(_4353);
    float _4399 = precise::max(_4397, 0.0);
    uint _4401 = uint(_4399);
    int _4403 = ~_4223;
    int _4405 = _4403 + 1;
    float _4407 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3503);
    int _4409 = _4389 * int(_4337);
    int _4411 = _4409 + _4289;
    float _4413 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4391);
    float _4415 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4339);
    float _4417 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4383);
    int _4419 = ~_4285;
    int _4421 = _4419 + 1;
    float _4423 = trunc(_4273);
    float _4425 = precise::max(_4423, 0.0);
    uint _4427 = uint(_4425);
    float _4429 = float(uint(_4411));
    float _4431 = -_3553;
    float _4433 = fma(_4407, _4019, _4431);
    float _4435 = as_type<float>(_4301) * _4429;
    float _4437 = trunc(_4245);
    float _4439 = precise::max(_4437, 0.0);
    uint _4441 = uint(_4439);
    float _4443 = trunc(_4385);
    float _4445 = precise::max(_4443, 0.0);
    uint _4447 = uint(_4445);
    float _4449 = -_168;
    float _4451 = fma(_4449, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3655);
    float _4453 = _4177;
    if (_4325)
    {
        float _4455 = _4393 * _4351;
        _170 = _4455;
    }
    float _4457 = _170;
    int _4459 = _4405 * int(_4379);
    int _4461 = _4459 + _4297;
    int _4463 = ~_4249;
    int _4465 = _4463 + 1;
    float _4467 = fma(_3535, _3365, _4451);
    int _4469 = int(_4209) + int(_4427);
    float _4471 = trunc(_4287);
    float _4473 = precise::max(_4471, 0.0);
    uint _4475 = uint(_4473);
    int _4477 = int(_4163) + int(_4441);
    float _4479 = trunc(_4299);
    float _4481 = precise::max(_4479, 0.0);
    uint _4483 = uint(_4481);
    float _4485 = float(uint(_4461));
    int _4487 = _4465 * int(_4401);
    int _4489 = _4487 + _4309;
    int _4491 = _4421 * int(_4447);
    int _4493 = _4491 + _4349;
    float _4495 = as_type<float>(_4307) * _4485;
    int _4497 = ~_3663;
    int _4499 = _4497 + 1;
    float _4501 = trunc(_4435);
    float _4503 = precise::max(_4501, 0.0);
    uint _4505 = uint(_4503);
    float _4507 = float(uint(_4489));
    int _4509 = int(_4233) + int(_4475);
    float _4511 = as_type<float>(_4341) * _4507;
    int _4513 = ~_3967;
    int _4515 = _4513 + 1;
    float _4517 = trunc(_4495);
    float _4519 = precise::max(_4517, 0.0);
    uint _4521 = uint(_4519);
    int _4523 = int(_4255) + int(_4483);
    int _4525 = _4499 * _4477;
    int _4527 = _4525 + _4073;
    float _4529 = float(uint(_4493));
    int _4531 = ~_3843;
    int _4533 = _4531 + 1;
    float _4535 = as_type<float>(_4355) * _4529;
    int _4537 = ~_3611;
    int _4539 = _4537 + 1;
    float _4541 = trunc(_4511);
    float _4543 = precise::max(_4541, 0.0);
    uint _4545 = uint(_4543);
    bool _4547 = uint(_4527) >= uint(_3663);
    int _4549 = _4515 * _4469;
    int _4551 = _4549 + _4117;
    bool _4553 = uint(_4551) >= uint(_3967);
    float _4555 = trunc(_4535);
    float _4557 = precise::max(_4555, 0.0);
    uint _4559 = uint(_4557);
    int _4561 = _4533 * _4523;
    int _4563 = _4561 + _4197;
    bool _4565 = !_4547;
    int _4567 = _4565 ? 0 : (-1);
    int _4569 = _4539 * _4509;
    int _4571 = _4569 + _4169;
    int _4573 = int(_4337) + int(_4505);
    int _4575 = int(_4379) + int(_4521);
    bool _4577 = uint(_4571) >= uint(_3611);
    float _4579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4581 = !_4553;
    int _4583 = _4581 ? 0 : (-1);
    bool _4585 = uint(_4563) >= uint(_3843);
    int _4587 = ~_4223;
    int _4589 = _4587 + 1;
    int _4591 = ~_4203;
    int _4593 = _4591 + 1;
    int _4595 = int(_4447) + int(_4559);
    int _4597 = _4593 * _4573;
    int _4599 = _4597 + _4289;
    int _4601 = ~_4285;
    int _4603 = _4601 + 1;
    float _4605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4607 = int(_4401) + int(_4545);
    int _4609 = _4589 * _4575;
    int _4611 = _4609 + _4297;
    int _4613 = ~_4249;
    int _4615 = _4613 + 1;
    int _4617 = _4603 * _4595;
    int _4619 = _4617 + _4349;
    bool _4621 = !_4577;
    int _4623 = _4621 ? 0 : (-1);
    float _4625 = _4579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4627 = uint(_4599) >= uint(_4203);
    int _4629 = _4615 * _4607;
    int _4631 = _4629 + _4309;
    bool _4633 = !_4585;
    int _4635 = _4633 ? 0 : (-1);
    float _4637 = fma(_4625, _1595, -0.5);
    bool _4639 = uint(_4611) >= uint(_4223);
    int _4641 = ~_4477;
    int _4643 = _4641 + _4567;
    int _4645 = _4643 + 1;
    float _4647 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4649 = !_4639;
    int _4651 = _4649 ? 0 : (-1);
    float _4653 = _2805 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4655 = ~_4469;
    int _4657 = _4655 + _4583;
    int _4659 = _4657 + 1;
    int _4661 = _3663 * _4645;
    int _4663 = _4661 + _4073;
    bool _4665 = uint(_4619) >= uint(_4285);
    float _4667 = _4605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4669 = ~_4523;
    int _4671 = _4669 + _4635;
    int _4673 = _4671 + 1;
    int _4675 = _3967 * _4659;
    int _4677 = _4675 + _4117;
    bool _4679 = !_4665;
    int _4681 = _4679 ? 0 : (-1);
    float _4683 = fma(_4667, _2713, -0.5);
    bool _4685 = _3967 == 0;
    int _4687 = _3843 * _4673;
    int _4689 = _4687 + _4197;
    int _4691 = ~_4509;
    int _4693 = _4691 + _4623;
    int _4695 = _4693 + 1;
    bool _4697 = !_4685;
    int _4699 = _4697 ? _4677 : (-1);
    float _4701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4703 = _3843 == 0;
    bool _4705 = !_4627;
    int _4707 = _4705 ? 0 : (-1);
    int _4709 = _4073 ^ _3663;
    bool _4711 = uint(_4631) >= uint(_4249);
    int _4713 = _3611 * _4695;
    int _4715 = _4713 + _4169;
    bool _4717 = !_4703;
    int _4719 = _4717 ? _4689 : (-1);
    bool _4721 = _3967 == 0;
    int _4723 = _4117 ^ _3967;
    float _4725 = _1357 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4727 = uint(int(uint(_4709) >> uint(31)));
    float _4729 = _4653 * _4701;
    bool _4731 = !_4711;
    int _4733 = _4731 ? 0 : (-1);
    float _4735 = _4725 * _4647;
    bool _4737 = _3663 == 0;
    float _4739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4741 = uint(int(uint(_4723) >> uint(31)));
    int _4743 = ~_4707;
    int _4745 = _4573 + _4743;
    int _4747 = _4745 + 1;
    out.m_79.x = _4735;
    out.m_79.y = _4729;
    int _4749 = ~int(_4727);
    int _4751 = _4749 + 1;
    bool _4753 = !_4737;
    int _4755 = _4753 ? _4663 : (-1);
    float _4757 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4759 = _3611 == 0;
    int _4761 = ~_4651;
    int _4763 = _4575 + _4761;
    int _4765 = _4763 + 1;
    int _4767 = ~int(_4741);
    int _4769 = _4767 + 1;
    int _4771 = _4747 ^ _4751;
    float _4773 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4775 = !_4759;
    int _4777 = _4775 ? _4715 : (-1);
    int _4779 = _4765 ^ _4769;
    bool _4781 = _3663 == 0;
    int _4783 = ~_4751;
    int _4785 = _4783 + _4771;
    int _4787 = _4785 + 1;
    float _4789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4791 = ~_4769;
    int _4793 = _4791 + _4779;
    int _4795 = _4793 + 1;
    float _4797 = _4757 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4799 = !_4781;
    int _4801 = _4799 ? _4787 : (-1);
    bool _4803 = _3611 == 0;
    float _4805 = fma(_4797, _1583, -0.5);
    int _4807 = _4169 ^ _3611;
    float _4809 = float(_4755);
    bool _4811 = !_4721;
    int _4813 = _4811 ? _4795 : (-1);
    float _4815 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4817 = _3843 == 0;
    float _4819 = fma(_4625, _4809, _3349);
    int _4821 = _4197 ^ _3843;
    float _4823 = _4739 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4825 = float(_4777);
    float _4827 = fma(_4415, _4637, _4819);
    uint _4829 = uint(int(uint(_4821) >> uint(31)));
    float _4831 = fma(_4823, _1643, -0.5);
    int _4833 = ~_4681;
    int _4835 = _4595 + _4833;
    int _4837 = _4835 + 1;
    float _4839 = fma(_4823, _4825, _3853);
    int _4841 = ~int(_4829);
    int _4843 = _4841 + 1;
    float _4845 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4847 = float(_4699);
    float _4849 = fma(_4417, _4831, _4839);
    int _4851 = _4837 ^ _4843;
    uint _4853 = uint(int(uint(_4807) >> uint(31)));
    float _4855 = fma(_4797, _4847, _3791);
    float _4857 = float(_4719);
    float _4859 = _4773 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4861 = ~_4843;
    int _4863 = _4861 + _4851;
    int _4865 = _4863 + 1;
    float _4867 = fma(_3539, _4805, _4855);
    int _4869 = ~_4733;
    int _4871 = _4607 + _4869;
    int _4873 = _4871 + 1;
    float _4875 = fma(_4859, _2361, -0.5);
    int _4877 = ~int(_4853);
    int _4879 = _4877 + 1;
    float _4881 = fma(_4859, _4857, _3527);
    float _4883 = float(_4801);
    float _4885 = _4845 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4887 = !_4817;
    int _4889 = _4887 ? _4865 : (-1);
    float _4891 = fma(_3397, _4875, _4881);
    int _4893 = _4873 ^ _4879;
    float _4895 = -_2831;
    float _4897 = fma(_4667, _4883, _4895);
    float _4899 = float(_4813);
    float _4901 = _4789 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4903 = float(_4889);
    float _4905 = _4815 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4907 = ~_4879;
    int _4909 = _4907 + _4893;
    int _4911 = _4909 + 1;
    float _4913 = fma(_4901, _2723, -0.5);
    float _4915 = -_3807;
    float _4917 = fma(_4901, _4899, _4915);
    float _4919 = fma(_4885, _2741, -0.5);
    bool _4921 = !_4803;
    int _4923 = _4921 ? _4911 : (-1);
    float _4925 = -_3531;
    float _4927 = fma(_4885, _4903, _4925);
    float _4929 = fma(_4395, _4683, _4897);
    float _4931 = fma(_3993, _4913, _4917);
    float _4933 = float(_4923);
    float _4935 = fma(_3481, _4919, _4927);
    float _4937 = fma(_4905, _2737, -0.5);
    float _4939 = _4849 + 0.5;
    float _4941 = _4467 + 0.5;
    float _4943 = -_3887;
    float _4945 = fma(_4905, _4933, _4943);
    float _4947 = _4935 + 0.5;
    float _4949 = _4433 + 0.5;
    float _4951 = in.m_81.x;
    float _4953 = in.m_81.y;
    float _4955 = in.m_81.z;
    float _4957 = fma(_4413, _4937, _4945);
    float _4959 = _4827 + 0.5;
    float _4961 = _4867 + 0.5;
    float _4963 = _4929 + 0.5;
    float _4965 = _4957 + 0.5;
    float _4967 = _4931 + 0.5;
    float _4969 = _4891 + 0.5;
    bool _4971 = !_3685;
    int _4973 = _4971 ? 0 : 1;
    out.m_83.x = _4941;
    out.m_83.y = _4949;
    bool _4975 = !_3689;
    int _4977 = _4975 ? 0 : 1;
    int _4979 = abs(_4973);
    out.m_85.x = _4959;
    out.m_85.y = _4963;
    out.m_85.z = _4961;
    out.m_85.w = _4967;
    int _4981 = abs(_4977);
    bool _4983 = !_3693;
    int _4985 = _4983 ? 0 : 1;
    out.m_87.x = _4939;
    out.m_87.y = _4965;
    float _4987 = float(_4979);
    out.m_89.x = _4969;
    out.m_89.y = _4947;
    float _4989 = float(_3799);
    float _4991 = _4831;
    float _4993 = as_type<float>(_4631);
    float _4995 = as_type<float>(_4659);
    float _4997 = _4467;
    if (_3387)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4999 = -_3547;
    float _5001 = fma(_4999, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3027);
    float _5003 = _4987 * _4989;
    float _5005 = float(_2903);
    float _5007 = -_3543;
    float _5009 = fma(_5007, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2815);
    float _5011 = float(_4981);
    float _5013 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5015 = _5001 + _5013;
    float _5017 = _5003 * (-2.0);
    float _5019 = -_4177;
    float _5021 = fma(_5019, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3229);
    float _5023 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5025 = _5009 + _5023;
    float _5027 = _5015 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5029 = _5011 * _5005;
    float _5031 = _1417 + (-0.5);
    float _5033 = fma(_5017, _4951, _4951);
    float _5035 = _1112 + _1427;
    float _5037 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5039 = _5021 + _5037;
    float _5041 = fma(_5025, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5027);
    float _5043 = fma(_5031, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5033);
    float _5045 = _5035 + (-1.0);
    float _5047 = _5029 * (-2.0);
    float _5049 = fma(_5039, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5041);
    float _5051 = _1112 + (-0.5);
    float _5053 = fma(_5045, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5055 = fma(_5047, _4953, _4953);
    float _5057 = fma(_3413, _5017, _3413);
    bool _5059 = _5049 >= 0.0;
    float _5061 = fma(_5053, _5047, _5053);
    float _5063 = fma(_5051, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5055);
    float _5065 = fma(_5057, _4457, _5043);
    int _5067 = abs(_4985);
    float _5069 = sqrt(_4239);
    float _5071 = fma(_5061, _4457, _5063);
    float _5073 = _5065 * 0.15915493667125701904296875;
    float _5075 = _1417 + _1427;
    float _5077 = _5071 * 0.15915493667125701904296875;
    float _5079 = float(_3285);
    float _5081 = _5047;
    float _5083 = _5029;
    if (_5059)
    {
        _5081 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5085 = _5081;
    float _5087 = _5073 * 6.283185482025146484375;
    float _5089 = sin(_5087);
    float _5091 = float(_5067);
    int _5093 = as_type<int>(_5085);
    if (_5059)
    {
        out.m_53.x = 0.0;
    }
    if (_5059)
    {
        float _5095 = _5085 * 5.0;
        _5093 = as_type<int>(_5095);
    }
    int _5097 = _5093;
    float _5099 = _5091 * _5079;
    float _5101 = _5075 + (-1.0);
    float _5103 = _5073 * 6.283185482025146484375;
    float _5105 = cos(_5103);
    if (_5059)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14120 = as_type<float>(_5097);
        out.gl_Position.z = _14120;
    }
    float _5107 = _5099 * (-2.0);
    float _5109 = _5077 * 6.283185482025146484375;
    float _5111 = sin(_5109);
    if (_5059)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5113 = -_3027;
    float _5115 = _5113 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5117 = -_2815;
    float _5119 = _5117 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5121 = fma(_5107, _4955, _4955);
    float _5123 = -_3229;
    float _5125 = _5123 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5127 = _5115 * _5115;
    float _5129 = fma(_5101, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5131 = _1427 + (-0.5);
    float _5133 = _5077 * 6.283185482025146484375;
    float _5135 = cos(_5133);
    float _5137 = fma(_5119, _5119, _5127);
    float _5139 = fma(_5129, _5107, _5129);
    float _5141 = fma(_5131, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5121);
    float _5143 = _3509 * _5069;
    float _5145 = fma(_5125, _5125, _5137);
    float _5147 = _5089 * _5111;
    float _5149 = fma(_5139, _4457, _5141);
    float _5151 = rsqrt(_5145);
    float _5153 = _5149 * 0.15915493667125701904296875;
    float _5155 = in.m_91.x;
    float _5157 = in.m_91.y;
    float _5159 = in.m_91.z;
    float _5161 = _5105 * _5135;
    float _5163 = _5089 * _5135;
    float _5165 = _5153 * 6.283185482025146484375;
    float _5167 = sin(_5165);
    float _5169 = _5119 * _5151;
    float _5171 = _5125 * _5151;
    float _5173 = _5115 * _5151;
    float _5175 = _5153 * 6.283185482025146484375;
    float _5177 = cos(_5175);
    float _5179 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5181 = _5169 * _5179;
    float _5183 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5185 = _5171 * _5183;
    float _5187 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5189 = _5173 * _5187;
    float _5191 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5193 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5195 = -_5181;
    float _5197 = fma(_5171, _5193, _5195);
    float _5199 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5201 = -_5185;
    float _5203 = fma(_5173, _5199, _5201);
    float _5205 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5207 = -_5189;
    float _5209 = fma(_5169, _5205, _5207);
    float _5211 = fma(_5167, _5161, _5147);
    float _5213 = _5197 * _5197;
    float _5215 = fma(_5167, _5147, _5161);
    float _5217 = _608 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5219 = fma(_5203, _5203, _5213);
    float _5221 = _5105 * _5111;
    float _5223 = _5143 * _5217;
    float _5225 = _606 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5227 = fma(_5209, _5209, _5219);
    float _5229 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5157);
    float _5231 = _5105 * _5177;
    float _5233 = _5135 * _5177;
    float _5235 = rsqrt(_5227);
    float _5237 = _5229 * _5223;
    float _5239 = _5143 * _5191;
    float _5241 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5155);
    float _5243 = _5089 * _5177;
    float _5245 = _5111 * _5177;
    float _5247 = _5143 * _5225;
    float _5249 = _5241 * _5239;
    float _5251 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5159);
    float _5253 = _5231 * _5237;
    float _5255 = -_5221;
    float _5257 = fma(_5167, _5163, _5255);
    float _5259 = -_5163;
    float _5261 = fma(_5167, _5221, _5259);
    float _5263 = _5251 * _5247;
    float _5265 = fma(_5211, _5249, _5253);
    float _5267 = _5243 * _5237;
    float _5269 = _5203 * _5235;
    float _5271 = _5197 * _5235;
    float _5273 = _5209 * _5235;
    float _5275 = -_5237;
    float _5277 = _5167 * _5275;
    float _5279 = _5173 * _5269;
    float _5281 = _5171 * _5271;
    float _5283 = fma(_5261, _5263, _5265);
    float _5285 = fma(_5233, _5249, _5277);
    float _5287 = -_5279;
    float _5289 = fma(_5169, _5271, _5287);
    float _5291 = -_5281;
    float _5293 = fma(_5173, _5273, _5291);
    float _5295 = fma(_5257, _5249, _5267);
    float _5297 = fma(_5245, _5263, _5285);
    float _5299 = _5289 * _5283;
    float _5301 = _5293 * _5283;
    float _5303 = fma(_5215, _5263, _5295);
    float _5305 = fma(_5273, _5297, _5299);
    float _5307 = fma(_5269, _5297, _5301);
    float _5309 = fma(_5171, _5303, _5305);
    float _5311 = fma(_5169, _5303, _5307);
    float _5313 = _3229 + _5309;
    float _5315 = _2815 + _5311;
    float _5317 = _5169 * _5273;
    float _5319 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5321 = _5313 + _5319;
    float _5323 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5325 = _5315 + _5323;
    float _5327 = -_5317;
    float _5329 = fma(_5171, _5269, _5327);
    float _5331 = _5321 * _5321;
    float _5333 = _5325 * _5325;
    float _5335 = _5329 * _5283;
    float _5337 = _5333 + _5331;
    float _5339 = fma(_5271, _5297, _5335);
    float _5341 = sqrt(_5337);
    float _5343 = fma(_5173, _5303, _5339);
    float _5345 = _3027 + _5343;
    bool _5347 = _5341 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5349 = _5315;
    float _5351 = _5313;
    float _5353 = _5333;
    float _5355 = _5331;
    if (!_5347)
    {
        _4991 = _5345;
    }
    float _5357 = _4991;
    bool _5359 = !_5347;
    float _5361 = _5357;
    if (!_5359)
    {
        float _5363 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5365 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5367 = _5341 + _5365;
        float _5369 = rsqrt(_5337);
        float _5371 = _5367 * _5363;
        float _5373 = _5345 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5375 = _5371 * 0.15915493667125701904296875;
        float _5377 = _5375 * 6.283185482025146484375;
        float _5379 = sin(_5377);
        float _5381 = _5375 * 6.283185482025146484375;
        float _5383 = cos(_5381);
        float _5385 = fma(_5379, _5373, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5387 = _5369 * _5385;
        float _5389 = _5383 + (-1.0);
        float _5391 = fma(_5325, _5387, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5393 = fma(_5321, _5387, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5395 = _5389 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5399 = _5391 + _5397;
        float _5401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5403 = _5393 + _5401;
        float _5405 = fma(_5345, _5383, _5395);
        float _5407 = _5399 * _5399;
        float _5409 = _5403 * _5403;
        _5349 = _5391;
        _5351 = _5393;
        _5361 = _5405;
        _5353 = _5407;
        _5355 = _5409;
    }
    float _5411 = _5349;
    float _5413 = _5351;
    float _5415 = _5361;
    float _5417 = _5353;
    float _5419 = _5355;
    float _5421 = fma(_5411, 6.2500002968590706586837768554688e-05, 0.5);
    float _5423 = fma(_5413, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14613 = float2(_5421, _5423);
    float3 _5427 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14613, float2(0.0), isnan(_14613)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14613, float2(0.0), isnan(_14613)), level(0.0)).xyz;
    float _5429 = _5427.x;
    float _5431 = _5427.y;
    float _5433 = _5427.z;
    float _5435 = in.m_93.x;
    float _5437 = in.m_93.y;
    float _5439 = in.m_93.z;
    bool _5441 = _5157 != 0.0;
    bool _5443 = isnan(_5157);
    bool _5445 = _5441 || _5443;
    bool _5447 = isnan(0.0);
    bool _5449 = _5445 || _5447;
    float _5451 = in.m_95.x;
    float _5453 = in.m_95.y;
    float _5455 = in.m_95.z;
    float _5457 = in.m_95.w;
    bool _5459 = _5155 == 0.0;
    bool _5461 = !_5449;
    bool _5463 = _5459 && _5461;
    bool _5465 = _5159 == 0.0;
    bool _5467 = _5465 && _5463;
    float _5469 = _5435;
    if (_5467)
    {
        _5083 = _5435;
    }
    float _5471 = _5083;
    float _5473 = _5471;
    if (_5467)
    {
        _2897 = _5439;
    }
    float _5475 = _2897;
    float _5477 = _5475;
    if (_5467)
    {
        _4993 = _5437;
    }
    float _5479 = _4993;
    float _5481 = _5479;
    if (_5467)
    {
        _4995 = _5471;
    }
    float _5483 = _4995;
    float _5485 = _5483;
    if (!_5467)
    {
        _5473 = _5435;
    }
    float _5487 = _5473;
    if (_5467)
    {
        _4997 = _5475;
    }
    float _5489 = _4997;
    float _5491 = _5489;
    if (!_5467)
    {
        _5477 = _5439;
    }
    float _5493 = _5477;
    if (!_5467)
    {
        float _5495 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5487);
        _5485 = _5495;
    }
    float _5497 = _5485;
    if (_5467)
    {
        _5469 = _5479;
    }
    float _5499 = _5469;
    float _5501 = _5455 * _5487;
    float _5503 = _5499;
    if (!_5467)
    {
        _5481 = _5437;
    }
    float _5505 = _5481;
    float _5507 = _5453 * _5493;
    if (!_5467)
    {
        float _5509 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5493);
        _5491 = _5509;
    }
    float _5511 = _5491;
    float _5513 = -_5501;
    float _5515 = fma(_5451, _5493, _5513);
    float _5517 = _5231 * _5329;
    float _5519 = _5451 * _5505;
    float _5521 = -_5507;
    float _5523 = fma(_5455, _5505, _5521);
    if (!_5467)
    {
        float _5525 = fma(_5157, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5505);
        _5503 = _5525;
    }
    float _5527 = _5503;
    float _5529 = _5211 * _5293;
    float _5531 = -_5519;
    float _5533 = fma(_5453, _5487, _5531);
    float _5535 = _5211 * _5329;
    float _5537 = _5211 * _5289;
    float _5539 = _5231 * _5293;
    float _5541 = _5515 * _5457;
    float _5543 = _5523 * _5457;
    float _5545 = _5231 * _5289;
    float _5547 = _5533 * _5457;
    float _5549 = _5261 * _5293;
    float _5551 = _5261 * _5329;
    float _5553 = _5261 * _5289;
    float _5555 = fma(_5233, _5269, _5529);
    float _5557 = fma(_5233, _5271, _5535);
    float _5559 = -_5167;
    float _5561 = fma(_5559, _5271, _5517);
    float _5563 = fma(_5233, _5273, _5537);
    float _5565 = -_5167;
    float _5567 = fma(_5565, _5269, _5539);
    float _5569 = -_5167;
    float _5571 = fma(_5569, _5273, _5545);
    float _5573 = fma(_5245, _5269, _5549);
    float _5575 = fma(_5245, _5271, _5551);
    float _5577 = fma(_5245, _5273, _5553);
    float _5579 = fma(_5243, _5173, _5561);
    float _5581 = fma(_5257, _5169, _5555);
    float _5583 = fma(_5243, _5169, _5567);
    float _5585 = fma(_5243, _5171, _5571);
    float _5587 = fma(_5215, _5169, _5573);
    float _5589 = fma(_5215, _5173, _5575);
    float _5591 = fma(_5215, _5171, _5577);
    float _5593 = fma(_5257, _5173, _5557);
    float _5595 = _5579 * _5453;
    float _5597 = _5579 * _5527;
    float _5599 = fma(_5257, _5171, _5563);
    float _5601 = _5583 * _5527;
    float _5603 = _5541 * _5583;
    float _5605 = _5541 * _5579;
    float _5607 = _5585 * _5453;
    float _5609 = _5585 * _5527;
    float _5611 = _5541 * _5585;
    float _5613 = fma(_5593, _5451, _5595);
    float _5615 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5617 = _5415 + _5615;
    float _5619 = _5583 * _5453;
    float _5621 = fma(_5581, _5497, _5601);
    float _5623 = fma(_5599, _5451, _5607);
    float _5625 = fma(_5617, _5617, _5417);
    float _5627 = fma(_5581, _5451, _5619);
    float _5629 = fma(_5543, _5581, _5603);
    float _5631 = fma(_5593, _5497, _5597);
    float _5633 = _5625 + _5419;
    float _5635 = fma(_5599, _5497, _5609);
    float _5637 = fma(_5543, _5593, _5605);
    float _5639 = fma(_5543, _5599, _5611);
    float _5641 = fma(_5587, _5455, _5627);
    float _5643 = fma(_5589, _5455, _5613);
    float _5645 = sqrt(_5633);
    float _5647 = fma(_5591, _5455, _5623);
    float _5649 = fma(_5587, _5511, _5621);
    float _5651 = fma(_5547, _5587, _5629);
    float _5653 = fma(_5547, _5589, _5637);
    float _5655 = fma(_5547, _5591, _5639);
    float _5657 = fma(_5589, _5511, _5631);
    float _5659 = fma(_5591, _5511, _5635);
    out.m_97.x = _5641;
    out.m_97.y = _5643;
    out.m_97.z = _5647;
    out.m_99.x = _5651;
    out.m_99.y = _5653;
    out.m_99.z = _5655;
    out.m_101.x = _5649;
    out.m_101.y = _5657;
    out.m_101.z = _5659;
    bool _5661 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5663 = isnan(_5645);
    bool _5665 = _5661 || _5663;
    bool _5667 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5669 = _5665 || _5667;
    float _5671 = _5547;
    if (!_5669)
    {
        _5671 = 1.0;
    }
    float _5673 = _5671;
    out.m_103.x = _5429;
    out.m_103.y = _5431;
    out.m_103.z = _5433;
    bool _5675 = !_5669;
    float _5677 = _5673;
    if (!_5675)
    {
        bool _5679 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5681 = isnan(_5645);
        bool _5683 = _5679 || _5681;
        bool _5685 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5687 = _5683 || _5685;
        if (!_5687)
        {
            float _5689 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5691 = _5645 + _5689;
            float _5693 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5695 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5693;
            float _5697 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5699 = _5697 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5701 = 1.0 / _5695;
            float _5703 = _5691 * _5701;
            float _5705 = fma(_5703, _5699, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5677 = _5705;
            _5707 = true;
        }
        else
        {
            bool _5709 = _5645 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5711 = isnan(_5645);
            bool _5713 = _5709 || _5711;
            bool _5715 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5717 = _5713 || _5715;
            if (!_5717)
            {
                float _5719 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5721 = _5645 + _5719;
                float _5723 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5725 = _5723 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5727 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5729 = _5727 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5731 = 1.0 / _5725;
                float _5733 = _5721 * _5731;
                float _5735 = fma(_5733, _5729, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5677 = _5735;
                _5707 = true;
            }
            else
            {
                _5677 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5707 = false;
    float _5737 = _5677;
    float _5739 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5741 = _5415 + _5739;
    float _5743 = _5001 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5745 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5747 = _5411 + _5745;
    float _5749 = fma(_5741, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5751 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5743);
    float _5753 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5755 = _5413 + _5753;
    float _5757 = fma(_5747, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5759 = -_3027;
    float _5761 = _5759 + _5749;
    float _5763 = fma(_5021, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5751);
    float _5765 = fma(_5755, _5737, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5767 = -_2815;
    float _5769 = _5767 + _5757;
    float _5771 = _5761 * _5761;
    float _5773 = _5763 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5775 = _5001 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5777 = -_3229;
    float _5779 = _5777 + _5765;
    float _5781 = fma(_5769, _5769, _5771);
    float _5783 = 1.0 / _5773;
    float _5785 = fma(_5009, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5775);
    float _5787 = fma(_5779, _5779, _5781);
    float _5789 = fma(_5021, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5785);
    float _5791 = sqrt(_5787);
    float _5793 = _5789 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5795 = _5793 + _5773;
    float _5797 = _5795 * _5783;
    float _5799 = _5797 * 0.5;
    bool _5801 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5803 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5805 = _5801 || _5803;
    bool _5807 = isnan(0.5);
    bool _5809 = _5805 || _5807;
    float _5811 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5813 = fma(_5799, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5811);
    bool _5815 = _5791 > 0.0;
    float _5817 = 1.0 / _5813;
    bool _5819 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5821 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5823 = _5819 || _5821;
    bool _5825 = isnan(0.5);
    bool _5827 = _5823 || _5825;
    float _5829 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5831 = _5799;
    float _5833 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5835 = _5787;
    float _5837 = _5765;
    float _5839 = _5757;
    if (!_5815)
    {
        _5829 = _5757;
    }
    float _5841 = _5829;
    float _5843 = _5841;
    if (!_5815)
    {
        _5831 = _5749;
    }
    float _5845 = _5831;
    float _5847 = _5845;
    float _5849 = _5845;
    if (!_5815)
    {
        _5833 = _5765;
    }
    float _5851 = _5833;
    bool _5853 = !_5815;
    float _5855 = _5851;
    if (!_5853)
    {
        float _5857 = _230 * _230;
        float _5859 = rsqrt(_5787);
        float _5861 = fma(_226, _226, _5857);
        float _5863 = fma(_232, _232, _5861);
        float _5865 = sqrt(_5863);
        float _5867 = _5769 * _5859;
        float _5869 = _5761 * _5859;
        float _5871 = _5779 * _5859;
        bool _5873 = _5865 > 0.0;
        float _5875 = _5865;
        float _5877 = _5859;
        if (!_5873)
        {
            _5875 = _5757;
        }
        float _5879 = _5875;
        _5843 = _5879;
        if (!_5873)
        {
            _5847 = _5749;
        }
        float _5881 = _5847;
        _5849 = _5881;
        if (!_5873)
        {
            _5877 = _5765;
        }
        float _5883 = _5877;
        bool _5885 = !_5873;
        _5855 = _5883;
        if (!_5885)
        {
            float _5887 = rsqrt(_5863);
            float _5889 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5891 = _230 * _5887;
            float _5893 = _226 * _5887;
            float _5895 = _232 * _5887;
            float _5897 = _5869 * _5891;
            float _5899 = fma(_5867, _5893, _5897);
            float _5901 = _5889 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5903 = fma(_5871, _5895, _5899);
            float _5905 = _5903 * _5901;
            float _5907 = fma(_226, _5905, _5757);
            float _5909 = fma(_230, _5905, _5749);
            float _5911 = fma(_232, _5905, _5765);
            _5849 = _5909;
            _5855 = _5911;
            _5843 = _5907;
            _5835 = _5889;
        }
    }
    float _5913 = _5849;
    float _5915 = _5855;
    float _5917 = _5843;
    float _5919 = _5835;
    float _5921 = -_3547;
    float _5923 = fma(_5921, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5913);
    float _5925 = -_4177;
    float _5927 = fma(_5925, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5915);
    float _5929 = -_3543;
    float _5931 = fma(_5929, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5917);
    float _5933 = _5919;
    float _5935 = _5931;
    float _5937 = _5927;
    if (_5809)
    {
        _5933 = 1.0;
    }
    float _5939 = _5933;
    float _5941 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5943 = _5817 * _5941;
    float _5945 = _5939;
    if (_5827)
    {
        _4453 = _5923;
    }
    float _5947 = _4453;
    float _5949 = _5947;
    if (!_5827)
    {
        float _5951 = _5015 * _5015;
        float _5953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _5955 = -_3229;
        float _5957 = _5955 + _5915;
        float _5959 = -_3027;
        float _5961 = _5959 + _5913;
        float _5963 = fma(_5025, _5025, _5951);
        float _5965 = fma(_5039, _5039, _5963);
        float _5967 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _5969 = sqrt(_5965);
        float _5971 = 1.0 / _5143;
        float _5973 = _5967 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _5975 = precise::min(_5969, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _5977 = _5975 * _5953;
        float _5979 = _5977 * _5971;
        float _5981 = -_2815;
        float _5983 = _5981 + _5917;
        float _5985 = _5973 * _5979;
        float _5987 = _5957 * _5979;
        float _5989 = fma(_5961, _5985, _5001);
        float _5991 = fma(_5983, _5985, _5009);
        float _5993 = fma(_5973, _5987, _5021);
        _5949 = _5989;
        _5935 = _5991;
        _5937 = _5993;
        _236 = _5953;
    }
    float _5995 = _5949;
    float _5997 = _5935;
    float _5999 = _5937;
    float _6001 = _236;
    float _6003 = _6001;
    if (!_5809)
    {
        float _6005 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6007 = _6005 * 0.15915493667125701904296875;
        float _6009 = _6007 * 6.283185482025146484375;
        float _6011 = cos(_6009);
        float _6013 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6015 = _6013 * 0.15915493667125701904296875;
        float _6017 = _6007 * 6.283185482025146484375;
        float _6019 = sin(_6017);
        float _6021 = 1.0 / _6011;
        float _6023 = _6015 * 6.283185482025146484375;
        float _6025 = cos(_6023);
        float _6027 = _6019 * _6021;
        float _6029 = _6015 * 6.283185482025146484375;
        float _6031 = sin(_6029);
        float _6033 = _6025 * _6027;
        float _6035 = 1.0 / _6033;
        float _6037 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6039 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6037;
        float _6041 = 1.0 / _6039;
        float _6043 = _6031 * _6035;
        float _6045 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6047 = fma(_5943, _6043, _6045);
        float _6049 = _6047 * _6041;
        float _6051 = precise::clamp(_6049, 0.0, 1.0);
        _5945 = _6051;
    }
    float _6053 = _5945;
    float _6055 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6057 = _5995 + _6055;
    float _6059 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6061 = _5997 + _6059;
    float _6063 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6065 = _5999 + _6063;
    float _6067 = _6057 * _6057;
    float _6069 = fma(_6061, _6061, _6067);
    float _6071 = fma(_6065, _6065, _6069);
    float _6073 = rsqrt(_6071);
    float _6075 = sqrt(_6071);
    float _6077 = _6073 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6079 = _6061 * _6077;
    float _6081 = _6065 * _6077;
    float _6083 = _6079 * _6079;
    float _6085 = _6081 * _6081;
    float _6087 = _6083 + _6085;
    float _6089 = sqrt(_6087);
    bool _6091 = _6089 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6093 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6095 = _6089 + _6093;
    float _6097 = _6073;
    float _6099 = _6087;
    float _6101 = _6095;
    float _6103 = _6057;
    if (_6091)
    {
        float _6105 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6097 = _6105;
    }
    float _6107 = _6097;
    if (_6091)
    {
        float _6109 = rsqrt(_6087);
        _6099 = _6109;
    }
    float _6111 = _6099;
    float _6113 = _6111;
    if (_6091)
    {
        float _6115 = _6095 * _6107;
        _6101 = _6115;
    }
    float _6117 = _6101;
    if (_6091)
    {
        float _6119 = _6117 * 0.15915493667125701904296875;
        _5837 = _6119;
    }
    float _6121 = _5837;
    float _6123 = _6065;
    if (_6091)
    {
        float _6125 = _6121 * 6.283185482025146484375;
        float _6127 = sin(_6125);
        _6123 = _6127;
    }
    float _6129 = _6123;
    float _6131 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6133 = precise::max(0.0, _6131);
    float _6135 = _6107;
    if (_6091)
    {
        float _6137 = _6121 * 6.283185482025146484375;
        float _6139 = cos(_6137);
        _6135 = _6139;
    }
    float _6141 = _6135;
    float _6143 = -_6077;
    float _6145 = -_6133;
    float _6147 = fma(_6057, _6143, _6145);
    float _6149 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6091)
    {
        float _6151 = _6147 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6103 = _6151;
    }
    float _6153 = _6103;
    float _6155 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6157 = fma(_5009, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6159 = _6153;
    float _6161 = _6129;
    if (_6091)
    {
        float _6163 = fma(_6129, _6153, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6159 = _6163;
    }
    float _6165 = _6159;
    float _6167 = _6165;
    if (!_6091)
    {
        _6161 = _6079;
    }
    float _6169 = _6161;
    float _6171 = _6169;
    float _6173 = _6141;
    if (_6091)
    {
        float _6175 = _6141 + (-1.0);
        _6149 = _6175;
    }
    float _6177 = _6149;
    float _6179 = _6177;
    if (_6091)
    {
        float _6181 = _6111 * _6165;
        _5839 = _6181;
    }
    float _6183 = _5839;
    if (!_6091)
    {
        _6167 = _6147;
    }
    float _6185 = _6167;
    float _6187 = _6185;
    if (_6091)
    {
        float _6189 = _6177 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6003 = _6189;
    }
    float _6191 = _6003;
    if (_6091)
    {
        float _6193 = _6079 * _6183;
        _6171 = _6193;
    }
    float _6195 = _6171;
    if (!_6091)
    {
        _6179 = _6081;
    }
    float _6197 = _6179;
    float _6199 = _6197;
    if (_6091)
    {
        float _6201 = _6081 * _6183;
        _6199 = _6201;
    }
    float _6203 = _6199;
    if (!_6091)
    {
        _6113 = _6083;
    }
    float _6205 = _6113;
    float _6207 = _6205;
    if (_6091)
    {
        float _6209 = fma(_6147, _6141, _6191);
        _6187 = _6209;
    }
    float _6211 = _6187;
    if (_6091)
    {
        float _6213 = _6195 * _6195;
        _6207 = _6213;
    }
    float _6215 = _6207;
    if (!_6091)
    {
        _6173 = _6085;
    }
    float _6217 = _6173;
    float _6219 = _6217;
    if (_6091)
    {
        float _6221 = _6203 * _6203;
        _6219 = _6221;
    }
    float _6223 = _6219;
    float _6225 = fma(_6211, _6211, _6215);
    float _6227 = floor(_6157);
    float _6229 = _6225 + _6223;
    float _6231 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6155);
    float _6233 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6235 = fma(_6075, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6233);
    float _6237 = precise::clamp(_6235, 0.0, 1.0);
    float _6239 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6231);
    float _6241 = rsqrt(_6229);
    float _6243 = -_6237;
    float _6245 = _6243 + 1.0;
    float _6247 = _6239 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6249 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6251 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6253 = _6247 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6255 = fma(_5021, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6257 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6259 = abs(_6245);
    float _6261 = log2(_6259);
    float _6263 = -_6253;
    float _6265 = fma(_6263, _6249, 1.0);
    float _6267 = _5995 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6269 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6251);
    float _6271 = -_6227;
    float _6273 = _6157 + _6271;
    float _6275 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6267);
    float _6277 = _6241 * _6195;
    float _6279 = floor(_6255);
    float _6281 = _6241 * _6211;
    float _6283 = _6241 * _6203;
    float _6285 = fma(_5997, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6257);
    float _6287 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6275);
    float _6289 = _6277 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6291 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6269);
    float _6293 = fma(_5999, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6285);
    float _6295 = _6287 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6297 = -_6289;
    float _6299 = fma(_6281, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6297);
    float _6301 = _6261 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6303 = _6293 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6305 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6307 = -_6283;
    float _6309 = fma(_6307, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6299);
    float _6311 = _6291 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6313 = exp2(_6301);
    float _6315 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6305);
    float _6317 = fma(_6309, -0.5, 0.5);
    float _6319 = fma(_6309, 0.5, 0.5);
    float _6321 = -_6279;
    float _6323 = _6255 + _6321;
    float _6325 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6315);
    float _6327 = fma(_6319, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6329 = log2(_6265);
    float _6331 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6325);
    float _6333 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6335 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6337 = fma(_6319, _6327, -0.212114393711090087890625);
    float _6339 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6333);
    float _6341 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6335);
    float _6343 = sqrt(_6317);
    float _6345 = fma(_6319, _6337, 1.570728778839111328125);
    float _6347 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6339);
    float _6349 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6341);
    float _6351 = 1.0 / _6331;
    float _6353 = _6281 + 1.0;
    float _6355 = _6329 * 0.693147182464599609375;
    float _6357 = -_6281;
    float _6359 = fma(_6313, _6353, _6357);
    float _6361 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6347);
    float _6363 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6349);
    float _6365 = _6343 * 0.636619746685028076171875;
    float _6367 = fma(_6359, 0.5, 0.5);
    float _6369 = -_6345;
    float _6371 = fma(_6365, _6369, 1.0);
    float _6373 = _6355 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16189 = float2(_6273, _6323);
    float _6375 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16189, float2(0.0), isnan(_16189)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16189, float2(0.0), isnan(_16189)), level(0.0)).x;
    float _6377 = _6361 * _6351;
    float _6379 = _6363 * _6351;
    float _6381 = fma(_6377, 0.5, 0.5);
    float _6383 = fma(_6379, -0.5, 0.5);
    float3 _16208 = float3(_6381, _6383, _6373);
    float _6385 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16208, float3(0.0), isnan(_16208)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16208, float3(0.0), isnan(_16208)), level(0.0)).x;
    float3 _16219 = float3(_6381, _6383, _6373);
    float4 _6388 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16219, float3(0.0), isnan(_16219)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16219, float3(0.0), isnan(_16219)), level(0.0)).xyzw;
    float _6390 = _6388.x;
    float _6392 = _6388.y;
    float _6394 = _6388.z;
    float _6396 = _6388.w;
    float2 _16235 = float2(_6371, _6367);
    float3 _6398 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16235, float2(0.0), isnan(_16235)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16235, float2(0.0), isnan(_16235)), level(0.0)).xyz;
    float _6400 = _6398.x;
    float _6402 = _6398.y;
    float _6404 = _6398.z;
    float _6406 = abs(_5943);
    float _6408 = log2(_6406);
    float _6410 = _6261 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6412 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6414 = isnan(_6075);
    bool _6416 = _6412 || _6414;
    bool _6418 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6420 = _6416 || _6418;
    float _6422 = exp2(_6410);
    float _6424 = _6408 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6426 = exp2(_6424);
    float _6428 = in.m_105.x;
    float _6430 = -_6422;
    float _6432 = _6430 + 1.0;
    float _6434 = _6432 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6436 = fma(_6426, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6438 = precise::clamp(_6436, 0.0, 1.0);
    float _6440 = fma(_6438, -2.0, 3.0);
    float _6442 = _6438 * _6438;
    float _6444 = _6295 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6446 = _6442 * _6440;
    float _6448 = fma(_6303, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6444);
    float _6450 = -_6446;
    float _6452 = _6450 + 1.0;
    float _6454 = fma(_6247, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6448);
    float _6456 = fma(_6452, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6446);
    bool _6458 = _5943 <= 8000.0;
    bool _6460 = isnan(_5943);
    bool _6462 = _6458 || _6460;
    bool _6464 = isnan(8000.0);
    bool _6466 = _6462 || _6464;
    float _6468 = float(_6466);
    float _6470 = fma(_6311, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6454);
    float _6472 = _6331 * 0.5;
    float _6474 = _6361 + _6331;
    float _6476 = _6468 * _6456;
    float _6478 = fma(_6363, -0.5, _6472);
    out.gl_Position.x = _6361;
    out.gl_Position.y = _6363;
    out.gl_Position.z = _6470;
    out.gl_Position.w = _6331;
    float _6480 = _6470 + _6331;
    float _6482 = _6476 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6484 = _6474 * 0.5;
    float _6486 = _6480 * 0.5;
    out.m_107.x = _6484;
    out.m_107.y = _6478;
    out.m_107.z = _6486;
    out.m_107.w = _6331;
    float _6488 = -_6434;
    float _6490 = _6488 + 1.0;
    float _6492 = _6331;
    float _6494 = _6470;
    float _6496 = _6363;
    float _6498 = _6478;
    float _6500 = _6484;
    float _6502 = _6490;
    if (!_6420)
    {
        _6492 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6504 = _6492;
    float _6506 = _6504;
    float _6508 = _6504;
    if (!_6420)
    {
        _6494 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6510 = _6494;
    float _6512 = _6510;
    float _6514 = _6510;
    if (!_6420)
    {
        _6496 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6516 = _6496;
    float _6518 = _6053 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6520 = _6516;
    float _6522 = _6516;
    if (!_6420)
    {
        _6498 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6524 = _6498;
    float _6526 = _6524;
    float _6528 = _6524;
    if (!_6420)
    {
        _6500 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6530 = _6500;
    float _6532 = -_6375;
    float _6534 = _6532 + 1.0;
    float _6536 = _6534 * _6482;
    float _6538 = precise::clamp(_6536, 0.0, 1.0);
    float _6540 = -_6538;
    float _6542 = fma(_6540, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6544 = _6434 * _6385;
    float _6546 = _6542 * _6428;
    float _6548 = _6396 * _6544;
    float _6550 = _6404 * _6544;
    float _6552 = _6546 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6554 = fma(_6400, _6548, _6390);
    float _6556 = fma(_6402, _6548, _6392);
    float _6558 = _6396 * _6490;
    float _6560 = fma(_6396, _6550, _6394);
    out.m_109.x = _6552;
    float _6562 = _6530;
    float _6564 = _6530;
    if (!_6420)
    {
        _6502 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6566 = _6502;
    out.m_111.x = _6554;
    out.m_111.y = _6556;
    out.m_111.z = _6560;
    out.m_111.w = _6558;
    bool _6568 = !_6420;
    float _6570 = _6566;
    float _6572 = _6566;
    if (!_6568)
    {
        bool _6574 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6576 = isnan(_6075);
        bool _6578 = _6574 || _6576;
        bool _6580 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6582 = _6578 || _6580;
        if (!_6582)
        {
            float _6584 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6586 = _6075 + _6584;
            float _6588 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6590 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6588;
            float _6592 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6594 = _6592 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6596 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6598 = _6596 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6600 = 1.0 / _6590;
            float _6602 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6604 = _6602 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6606 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6608 = _6606 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6610 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6612 = _6610 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6614 = _6586 * _6600;
            float _6616 = precise::clamp(_6614, 0.0, 1.0);
            float _6618 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6620 = _6618 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6622 = fma(_6616, _6594, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6624 = fma(_6616, _6598, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6626 = fma(_6616, _6620, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6628 = fma(_6616, _6604, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6630 = fma(_6616, _6608, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6632 = fma(_6616, _6612, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6522 = _6622;
            _6564 = _6630;
            _6514 = _6624;
            _6528 = _6628;
            _6572 = _6626;
            _6508 = _6632;
            _6634 = true;
        }
        else
        {
            bool _6636 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6638 = isnan(_6075);
            bool _6640 = _6636 || _6638;
            bool _6642 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6644 = _6640 || _6642;
            if (!_6644)
            {
                _6526 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6646 = _6526;
            _6528 = _6646;
            if (!_6644)
            {
                _6562 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6648 = _6562;
            _6564 = _6648;
            if (!_6644)
            {
                _6506 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6650 = _6506;
            _6508 = _6650;
            if (!_6644)
            {
                _6512 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6652 = _6512;
            _6514 = _6652;
            if (!_6644)
            {
                _6520 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6654 = _6520;
            _6522 = _6654;
            if (!_6644)
            {
                _6570 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6656 = _6570;
            bool _6658 = !_6644;
            _6572 = _6656;
            if (!_6658)
            {
                bool _6660 = _6075 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6662 = isnan(_6075);
                bool _6664 = _6660 || _6662;
                bool _6666 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6668 = _6664 || _6666;
                if (!_6668)
                {
                    float _6670 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6672 = _6075 + _6670;
                    float _6674 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6676 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6674;
                    float _6678 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6680 = _6678 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6682 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6684 = _6682 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6686 = 1.0 / _6676;
                    float _6688 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6690 = _6688 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6694 = _6692 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6698 = _6696 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6700 = _6672 * _6686;
                    float _6702 = precise::clamp(_6700, 0.0, 1.0);
                    float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6708 = fma(_6702, _6680, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6710 = fma(_6702, _6684, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6712 = fma(_6702, _6706, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6714 = fma(_6702, _6690, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6716 = fma(_6702, _6694, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6718 = fma(_6702, _6698, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6522 = _6708;
                    _6564 = _6716;
                    _6514 = _6710;
                    _6528 = _6714;
                    _6572 = _6712;
                    _6508 = _6718;
                    _6634 = true;
                }
                else
                {
                    _6522 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6564 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6514 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6528 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6572 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6508 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6634 = false;
    float _6720 = _6522;
    float _6722 = _6564;
    float _6724 = _6514;
    float _6726 = _6528;
    float _6728 = _6572;
    float _6730 = _6508;
    float _6732 = _6518 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6734 = fma(_5657, -0.5, 0.5);
    float _6736 = precise::clamp(_6734, 0.0, 1.0);
    float _6738 = -_6720;
    float _6740 = _6722 + _6738;
    float _6742 = -_6724;
    float _6744 = _6726 + _6742;
    out.m_53.x = _6732;
    float _6746 = fma(_6736, _6740, _6720);
    float _6748 = -_6728;
    float _6750 = _6730 + _6748;
    float _6752 = fma(_6736, _6744, _6724);
    float _6754 = _6746 * 0.586610972881317138671875;
    bool _6756 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6758 = fma(_6736, _6750, _6728);
    out.m_113.x = 0.0;
    float _6760 = fma(_6752, 0.298911988735198974609375, _6754);
    bool _6762 = _6053 > 0.0;
    bool _6764 = isnan(_6053);
    bool _6766 = _6762 || _6764;
    bool _6768 = isnan(0.0);
    bool _6770 = _6766 || _6768;
    float _6772 = fma(_6758, 0.114477999508380889892578125, _6760);
    float _6774 = -_6772;
    float _6776 = _6752 + _6774;
    float _6778 = -_6772;
    float _6780 = _6746 + _6778;
    float _6782 = -_6772;
    float _6784 = _6758 + _6782;
    float _6786 = fma(_6776, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    float _6788 = fma(_6780, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    float _6790 = fma(_6784, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6772);
    bool _6792 = !_6756;
    if (!_6792)
    {
        float _6794 = -_5995;
        float _6796 = _6794 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6798 = -_5997;
        float _6800 = _6798 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6802 = -_5999;
        float _6804 = _6802 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6806 = _6796 * _6796;
        float _6808 = fma(_6800, _6800, _6806);
        float _6810 = fma(_6804, _6804, _6808);
        float _6812 = sqrt(_6810);
        float _6814 = rsqrt(_6810);
        float _6816 = -_6812;
        float _6818 = _6816 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6820 = _6818 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6822 = precise::clamp(_6820, 0.0, 1.0);
        float _6824 = _6800 * _6814;
        float _6826 = _6796 * _6814;
        float _6828 = abs(_6822);
        float _6830 = log2(_6828);
        float _6832 = _6804 * _6814;
        float _6834 = _6824 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6836 = _5657 * _6826;
        float _6838 = -_6826;
        float _6840 = -_6834;
        float _6842 = fma(_6838, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6840);
        float _6844 = fma(_5649, _6824, _6836);
        float _6846 = -_6832;
        float _6848 = fma(_6846, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6842);
        float _6850 = fma(_5659, _6832, _6844);
        float _6852 = precise::clamp(_6850, 0.0, 1.0);
        float _6854 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6856 = _6848 + _6854;
        float _6858 = _6830 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6860 = _6856 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6862 = precise::clamp(_6860, 0.0, 1.0);
        float _6864 = exp2(_6858);
        float _6866 = _6864 * _6862;
        float _6868 = _6852 * _6866;
        float _6870 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6872 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6874 = _6868 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6870;
        out.m_113.y = _6872;
        out.m_113.z = _6874;
    }
    out.m_115.x = _6786;
    out.m_115.y = _6788;
    out.m_115.z = _6790;
    if (_6770)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _6876 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6876;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

