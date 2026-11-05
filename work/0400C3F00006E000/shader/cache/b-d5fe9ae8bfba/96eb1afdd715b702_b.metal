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
    bool _6742 = false;
    bool _5815 = false;
    bool _1206 = false;
    bool _882 = false;
    bool _740 = false;
    bool _586 = false;
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
        float _7041 = as_type<float>(_150);
        out.gl_Position.z = _7041;
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
        float _7111 = as_type<float>(_188);
        out.gl_Position.z = _7111;
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
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _286 = 1.0 / _272;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _288;
    float _292 = 1.0 / _280;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _264 + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _284;
    float _302 = _296 * _286;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _264 + _304;
    float _308 = 1.0 / _276;
    float _310 = _306 * _292;
    bool _312 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_264);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_264);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = 1.0 / _290;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _344 = _264 + _342;
    float _346 = -_334;
    float _348 = _346 + 1.0;
    float _350 = _344 * _300;
    bool _352 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_264);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _268 * _308;
    bool _366 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_264);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = _264 + _378;
    float _382 = _362 * _338;
    bool _384 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_264);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -_362;
    float _398 = _396 + 1.0;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    bool _404 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_264);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = _380 * _340;
    float _418 = _322 * _402;
    float _420 = _394 * _348;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = -_394;
    float _428 = _426 + 1.0;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _434;
    float _438 = fma(_424, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = _414 * _428;
    float _442 = fma(_432, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = fma(_436, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = _334 * _398;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = _438 * _440;
    float _462 = -_414;
    float _464 = _462 + 1.0;
    float _466 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_450, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _470 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _472 = _442 * _440;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _480 = _444 * _440;
    float _482 = fma(_476, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _472);
    float _486 = fma(_466, _420, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _492;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _480);
    float _498 = fma(_468, _420, _484);
    float _500 = fma(_482, _446, _486);
    float _502 = fma(_490, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = fma(_494, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = fma(_470, _420, _496);
    float _520 = fma(_502, _446, _498);
    float _522 = fma(_506, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_512, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_516, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_508, _446, _518);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _538;
    float _542 = fma(_522, _382, _500);
    float _544 = fma(_532, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _546 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _548 = fma(_540, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _550 = fma(_524, _382, _520);
    float _552 = fma(_526, _382, _528);
    float _554 = fma(_544, _418, _542);
    float _556 = fma(_546, _418, _550);
    float _558 = fma(_548, _418, _552);
    float _560 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].x, _554);
    float _562 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].y, _556);
    float _564 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].z, _558);
    bool _566 = !_298;
    float _584;
    if (!_566)
    {
        float _568 = in.m_65.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_134);
        float _590 = 1.0 / _588;
        float _592 = _168 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _594 + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _604 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = isnan(_594);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _622 = isnan(_594);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    bool _636 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = isnan(_594);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _602;
    float _650 = -_614;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _594 + _654;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _630 * _652;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _618;
    float _668 = _634 * _648;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _598, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = -_646;
    float _678 = _676 + 1.0;
    float _680 = _672 * _666;
    float _682 = _674 * _660;
    float _684 = _614 * _678;
    float _686 = fma(_680, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _690 = fma(_686, _684, _688);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _696 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[117].x, _690);
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = in.m_67.x;
    float _702 = in.m_67.y;
    float _704 = in.m_67.z;
    float _706 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _706;
    out.m_69.y = _708;
    out.m_69.z = _710;
    out.m_69.w = _712;
    float _714 = _564 * _704;
    float _716 = _562 * _702;
    float _718 = _560 * _700;
    bool _720 = !_658;
    float _738;
    if (!_720)
    {
        float _722 = in.m_65.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        float _742 = float(_134);
        float _744 = 1.0 / _742;
        float _746 = _168 * _744;
        _738 = _746;
    }
    _740 = false;
    float _748 = _738;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _748 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _758 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _760 = isnan(_748);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _774 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _776 = isnan(_748);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _786;
    bool _790 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _792 = isnan(_748);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _756;
    float _804 = -_768;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _810 = _748 + _808;
    bool _812 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _814 = _784 * _806;
    float _816 = -_784;
    float _818 = _816 + 1.0;
    float _820 = 1.0 / _772;
    float _822 = _788 * _802;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _828 = fma(_822, _752, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _830 = -_800;
    float _832 = _830 + 1.0;
    float _834 = _826 * _820;
    float _836 = _828 * _814;
    float _838 = _768 * _832;
    float _840 = fma(_834, _810, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _842 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[131].x, _836);
    float _844 = fma(_840, _838, _842);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _852 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[133].x, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _854;
    out.m_71.y = _856;
    out.m_71.z = _858;
    out.m_71.w = _860;
    bool _862 = !_812;
    float _880;
    if (!_862)
    {
        float _864 = in.m_65.x;
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _868 = _864 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _872 = _870 * _866;
        float _874 = floor(_872);
        float _876 = -_874;
        float _878 = _872 + _876;
        _880 = _878;
        _882 = true;
    }
    else
    {
        float _884 = float(_134);
        float _886 = 1.0 / _884;
        float _888 = _168 * _886;
        _880 = _888;
    }
    _882 = false;
    float _890 = _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _894 = _890 + _892;
    bool _896 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _898 = isnan(_890);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _912;
    bool _916 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _918 = isnan(_890);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -_906;
    float _930 = _928 + 1.0;
    bool _932 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _934 = isnan(_890);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = 1.0 / _910;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _950 = _926 * _930;
    float _952 = -_942;
    float _954 = _952 + 1.0;
    float _956 = 1.0 / _948;
    bool _958 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _960 = _914 * _944;
    float _962 = -_926;
    float _964 = _962 + 1.0;
    bool _966 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = isnan(_890);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = fma(_960, _894, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _980 = _942 * _964;
    bool _982 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _984 = isnan(_890);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = _976 * _954;
    float _996 = -_976;
    float _998 = _996 + 1.0;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1004 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1006 = isnan(_890);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = _992 * _998;
    float _1018 = -_992;
    float _1020 = _1018 + 1.0;
    bool _1022 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1024 = isnan(_890);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = 1.0 / _1002;
    float _1036 = -_1014;
    float _1038 = _1036 + 1.0;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1044 = _1014 * _1020;
    float _1046 = _1032 * _1038;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1052 = -_1032;
    float _1054 = _1052 + 1.0;
    float _1056 = 1.0 / _1042;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1062 = _978 * _1046;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _890 + _1068;
    float _1072 = _1060 * _956;
    float _1074 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1062);
    float _1076 = 1.0 / _1050;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1078;
    float _1082 = fma(_1072, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1090 = _890 + _1088;
    float _1092 = _1080 * _1034;
    float _1094 = fma(_1082, _1044, _1074);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1098 = _890 + _1096;
    float _1100 = 1.0 / _1066;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = fma(_1092, _1090, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1108 = _1104 * _1056;
    bool _1110 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1112 = isnan(_890);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1122;
    float _1126 = 1.0 / _1086;
    float _1128 = fma(_1106, _1016, _1094);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1134 = _1124 * _1076;
    float _1136 = fma(_1108, _1098, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1140 = _890 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1144 = _890 + _1142;
    float _1146 = _1132 * _1100;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1148;
    float _1152 = fma(_1134, _1140, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1154 = fma(_1136, _994, _1128);
    float _1156 = fma(_1146, _1144, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1158 = -_1120;
    float _1160 = _1158 + 1.0;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1164 = _890 + _1162;
    float _1166 = fma(_1152, _980, _1154);
    float _1168 = _1150 * _1126;
    float _1170 = _906 * _1160;
    float _1172 = fma(_1156, _950, _1166);
    float _1174 = fma(_1168, _1164, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1176 = fma(_1174, _1170, _1172);
    float _1178 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1176);
    out.m_73.x = _1178;
    bool _1180 = !_958;
    float _1182 = _1094;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1186 = as_type<int>(_1126);
    float _1204;
    if (!_1180)
    {
        float _1188 = in.m_65.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_134);
        float _1210 = 1.0 / _1208;
        float _1212 = _168 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1218 = int(_1216);
    float _1220 = in.m_65.y;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1224 = _1222 != 0;
    float _1226 = in.m_75.x;
    float _1228 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1230 = int(_1228);
    float _1232 = 0.0;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1224)
    {
        _1232 = 1.0;
    }
    float _1236 = _1232;
    float _1238 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1240 = int(_1238);
    float _1242 = float(_1218);
    float _1244 = 0.0;
    float _1246 = _1236;
    if (_1224)
    {
        _1244 = 1.0;
    }
    float _1248 = _1244;
    float _1250 = 0.0;
    float _1252 = _1248;
    if (_1224)
    {
        _1250 = 1.0;
    }
    float _1254 = _1250;
    int _1256 = 0;
    float _1258 = _1254;
    if (_1224)
    {
        _1256 = 0;
    }
    int _1260 = _1256;
    int _1262 = _1260;
    if (_1224)
    {
        float _1264 = in.m_65.x;
        _1182 = _1264;
    }
    float _1266 = _1182;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1270 = int(_1268);
    float _1272 = float(_1230);
    float _1274 = _1266;
    if (_1224)
    {
        _1234 = 0;
    }
    int _1276 = _1234;
    float _1278 = _1170;
    int _1280 = _1276;
    if (_1224)
    {
        float _1282 = in.m_65.z;
        _1278 = _1282;
    }
    float _1284 = _1278;
    int _1286 = 0;
    if (_1224)
    {
        _1286 = as_type<int>(_1220);
    }
    int _1288 = _1286;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1292 = int(_1290);
    float _1294 = float(_1240);
    float _1296 = 1.0 / _1242;
    float _1298 = float(_1270);
    float _1300 = 1.0 / _1272;
    float _1302 = float(uint(_1292));
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1306 = int(_1304);
    float _1308 = _1296 * _168;
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1312 = int(_1310);
    float _1314 = _1300 * _168;
    float _1316 = 1.0 / _1294;
    float _1318 = float(uint(_1306));
    float _1320 = 1.0 / _1298;
    float _1322 = float(uint(_1312));
    float _1324 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1326 = int(_1324);
    float _1328 = _1316 * _168;
    float _1330 = 1.0 / _1302;
    float _1332 = _1320 * _168;
    float _1334 = trunc(_1308);
    int _1336 = int(_1334);
    float _1338 = float(uint(_1326));
    float _1340 = 1.0 / _1318;
    int _1342 = as_type<int>(_1330) + (-2);
    float _1344 = trunc(_1314);
    int _1346 = int(_1344);
    float _1348 = float(uint(_1336));
    float _1350 = as_type<float>(_1342) * _1348;
    float _1352 = 1.0 / _1322;
    int _1354 = as_type<int>(_1340) + (-2);
    float _1356 = trunc(_1328);
    int _1358 = int(_1356);
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1362 = _1360 != 0;
    float _1364 = 1.0 / _1338;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1372 = _1370 != 0;
    bool _1374 = _1220 > 0.5;
    int _1376 = as_type<int>(_1352) + (-2);
    float _1378 = trunc(_1332);
    int _1380 = int(_1378);
    float _1382 = float(uint(_1358));
    int _1384 = _1288;
    bool _1386 = _1368;
    bool _1388 = _1372;
    float _1390 = _1226;
    if (!_1362)
    {
        _1184 = _1226;
    }
    float _1392 = _1184;
    float _1394 = as_type<float>(_1376) * _1382;
    int _1396 = as_type<int>(_1394);
    float _1398 = _1392;
    if (_1368)
    {
        float _1400 = -_1226;
        float _1402 = _1400 + 1.0;
        _1186 = as_type<int>(_1402);
    }
    int _1404 = _1186;
    float _1406 = trunc(_1350);
    float _1408 = precise::max(_1406, 0.0);
    uint _1411 = uint(_1408);
    int _1413 = as_type<int>(_1364) + (-2);
    float _1415 = 0.0;
    if (!_1372)
    {
        _1415 = _1226;
    }
    float _1417 = _1415;
    float _1419 = 0.0;
    float _1421 = _1417;
    if (!_1368)
    {
        _1419 = _1226;
    }
    float _1423 = _1419;
    float _1425 = _1423;
    if (_1368)
    {
        float _1427 = _1374 ? as_type<float>(_1404) : _1226;
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = trunc(_1394);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    float _1437 = float(uint(_1346));
    float _1439 = float(uint(_1380));
    float _1441 = as_type<float>(_1354) * _1437;
    float _1443 = _1437;
    if (_1372)
    {
        float _1445 = -_1226;
        float _1447 = _1445 + 1.0;
        _1396 = as_type<int>(_1447);
    }
    int _1449 = _1396;
    float _1451 = as_type<float>(_1413) * _1439;
    float _1453 = trunc(_1441);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = _1449;
    float _1461 = _1451;
    if (_1372)
    {
        float _1463 = _1374 ? as_type<float>(_1449) : _1226;
        _1421 = _1463;
    }
    float _1465 = _1421;
    float _1467 = _1284;
    if (_1224)
    {
        _1459 = as_type<int>(_1284);
    }
    int _1469 = _1459;
    float _1471 = trunc(_1451);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    int _1477 = _1469;
    if (_1224)
    {
        _1461 = _1266;
    }
    float _1479 = _1461;
    float _1481 = _1479;
    if (_1224)
    {
        _1443 = _1479;
    }
    float _1483 = _1443;
    int _1485 = 0;
    float _1487 = _1483;
    if (_1224)
    {
        _1485 = as_type<int>(_1479);
    }
    int _1489 = _1485;
    int _1491 = _1489;
    if (!_1224)
    {
        float _1493 = in.m_65.x;
        float _1495 = _1220 * 3.1415927410125732421875;
        float _1497 = in.m_65.z;
        float _1499 = _1495 * 0.15915493667125701904296875;
        float _1501 = _1499 * 6.283185482025146484375;
        float _1503 = sin(_1501);
        float _1505 = _1493 * 3.1415927410125732421875;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = _1497 * 3.1415927410125732421875;
        float _1511 = _1509 * 0.15915493667125701904296875;
        float _1513 = _1507 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        float _1517 = _1511 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        _1481 = _1220;
        _1252 = 1.2345600128173828125;
        _1274 = _1493;
        _1246 = 7.345489978790283203125;
        _1487 = _1497;
        _1258 = 5.839270114898681640625;
        _1262 = 1;
        _1467 = _1497;
        _1280 = 2;
        _1477 = as_type<int>(_1519);
        _1384 = as_type<int>(_1503);
        _1491 = as_type<int>(_1515);
    }
    float _1521 = _1481;
    float _1523 = _1252;
    float _1525 = _1274;
    float _1527 = _1246;
    float _1529 = _1487;
    float _1531 = _1258;
    int _1533 = _1262;
    float _1535 = _1467;
    int _1537 = _1280;
    int _1539 = _1477;
    int _1541 = _1384;
    int _1543 = _1491;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1547 = _1545 != 0;
    int _1549 = 0;
    if (_1362)
    {
        float _1551 = in.m_65.x;
        _1549 = as_type<int>(_1551);
    }
    int _1553 = _1549;
    int _1555 = ~_1292;
    int _1557 = _1555 + 1;
    float _1559 = _1521 * _1523;
    int _1561 = ~_1312;
    int _1563 = _1561 + 1;
    float _1565 = _1525 * _1527;
    int _1567 = ~_1326;
    int _1569 = _1567 + 1;
    int _1571 = _1557 * int(_1411);
    int _1573 = _1571 + _1336;
    float _1575 = floor(_1559);
    float _1577 = _1529 * _1531;
    float _1579 = _1521 * _1527;
    int _1581 = _1569 * int(_1475);
    int _1583 = _1581 + _1380;
    float _1585 = float(uint(_1573));
    float _1587 = _950;
    if (_1547)
    {
        float _1589 = in.m_65.z;
        _1587 = _1589;
    }
    float _1591 = _1587;
    int _1593 = _1563 * int(_1435);
    int _1595 = _1593 + _1358;
    int _1597 = ~_1306;
    int _1599 = _1597 + 1;
    float _1601 = floor(_1565);
    float _1603 = as_type<float>(_1342) * _1585;
    float _1605 = float(uint(_1583));
    bool _1607 = _1533 != 1;
    float _1609 = float(uint(_1595));
    float _1611 = in.m_61.w;
    int _1613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1615 = _1613 != 0;
    float _1617 = as_type<float>(_1413) * _1605;
    float _1619 = trunc(_1603);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1553;
    float _1627 = _1603;
    if (_1362)
    {
        bool _1629 = as_type<float>(_1553) > 0.5;
        _1386 = _1629;
    }
    bool _1631 = _1386;
    if (_1547)
    {
        float _1633 = -_1226;
        float _1635 = _1633 + 1.0;
        _1625 = as_type<int>(_1635);
    }
    int _1637 = _1625;
    float _1639 = as_type<float>(_1376) * _1609;
    int _1641 = _1599 * int(_1457);
    int _1643 = _1641 + _1346;
    int _1645 = ~_1326;
    int _1647 = _1645 + 1;
    float _1649 = in.m_59.w;
    float _1651 = floor(_1577);
    int _1653 = _1643;
    float _1655 = _1639;
    if (!_1547)
    {
        _1627 = _1226;
    }
    float _1657 = _1627;
    float _1659 = -_1601;
    float _1661 = _1565 + _1659;
    float _1663 = float(uint(_1643));
    float _1665 = _1657;
    if (_1362)
    {
        float _1667 = -_1226;
        float _1669 = _1667 + 1.0;
        _1653 = as_type<int>(_1669);
    }
    int _1671 = _1653;
    if (_1547)
    {
        bool _1673 = _1591 > 0.5;
        _1388 = _1673;
    }
    bool _1675 = _1388;
    int _1677 = 0;
    if (_1615)
    {
        float _1679 = -_1226;
        float _1681 = _1679 + 1.0;
        _1677 = as_type<int>(_1681);
    }
    int _1683 = _1677;
    float _1685 = float(_1326);
    float _1687 = floor(_1579);
    if (_1547)
    {
        float _1689 = _1675 ? as_type<float>(_1637) : _1226;
        _1665 = _1689;
    }
    float _1691 = _1665;
    float _1693 = -_1575;
    float _1695 = _1559 + _1693;
    float _1697 = float(_134);
    float _1699 = as_type<float>(_1354) * _1663;
    if (_1362)
    {
        float _1701 = _1631 ? as_type<float>(_1671) : _1226;
        _1398 = _1701;
    }
    float _1703 = _1398;
    float _1705 = in.m_63.w;
    float _1707 = float(_1292);
    float _1709 = trunc(_1617);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    float _1715 = float(_1336);
    float _1717 = float(_1312);
    int _1719 = ~_1312;
    int _1721 = _1719 + 1;
    float _1723 = trunc(_1639);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = int(_1411) + int(_1623);
    float _1731 = -_1687;
    float _1733 = _1579 + _1731;
    float _1735 = _1661 * _1707;
    float _1737 = float(_1380);
    float _1739 = _1717 * _1695;
    float _1741 = float(_1346);
    float _1743 = 1.0 / _1697;
    if (!_1615)
    {
        _1655 = _1226;
    }
    float _1745 = _1655;
    float _1747 = _1745;
    if (_1615)
    {
        float _1749 = _1374 ? as_type<float>(_1683) : _1226;
        _1747 = _1749;
    }
    float _1751 = _1747;
    float _1753 = -_1651;
    float _1755 = _1577 + _1753;
    bool _1757 = _1715 >= _1707;
    bool _1759 = isnan(_1715);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan(_1707);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1707 * _168;
    float _1771 = float(_1358);
    float _1773 = trunc(_1699);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = float(_1306);
    float _1781 = _1685 * _1755;
    bool _1783 = _1771 >= _1717;
    bool _1785 = isnan(_1771);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(_1717);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    bool _1795 = _1737 >= _1685;
    bool _1797 = isnan(_1737);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan(_1685);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    int _1807 = int(_1475) + int(_1713);
    float _1809 = _1769 * _1743;
    int _1811 = int(_1435) + int(_1727);
    float _1813 = _1743 * _168;
    int _1815 = ~_1292;
    int _1817 = _1815 + 1;
    float _1819 = trunc(_1767);
    int _1821 = int(_1819);
    int _1823 = ~_1312;
    int _1825 = _1823 + 1;
    float _1827 = _1717 * _1813;
    float _1829 = _1685 * _1813;
    float _1831 = _1779 * _1813;
    int _1833 = _1817 * _1729;
    int _1835 = _1833 + _1336;
    float _1837 = _1779 * _1733;
    int _1839 = _1825 * _1811;
    int _1841 = _1839 + _1358;
    float _1843 = trunc(_1735);
    int _1845 = int(_1843);
    int _1847 = _1647 * _1807;
    int _1849 = _1847 + _1380;
    bool _1851 = uint(_1835) >= uint(_1292);
    float _1853 = in.m_75.y;
    bool _1855 = uint(_1841) >= uint(_1312);
    bool _1857 = !_1851;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1863 = _1861 != 0;
    float _1865 = trunc(_1739);
    int _1867 = int(_1865);
    bool _1869 = uint(_1849) >= uint(_1326);
    bool _1871 = !_1863;
    int _1873 = _1871 ? 0 : 1;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1877 = _1875 != 0;
    int _1879 = int(_1457) + int(_1777);
    float _1881 = trunc(_1781);
    int _1883 = int(_1881);
    int _1885 = ~_1306;
    int _1887 = _1885 + 1;
    bool _1889 = !_1855;
    int _1891 = _1889 ? 0 : (-1);
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1895 = _1893 != 0;
    int _1897 = _1887 * _1879;
    int _1899 = _1897 + _1346;
    int _1901 = ~_1729;
    int _1903 = _1901 + _1859;
    int _1905 = _1903 + 1;
    float _1907 = trunc(_1793);
    int _1909 = int(_1907);
    int _1911 = abs(_1873);
    bool _1913 = !_1877;
    int _1915 = _1913 ? 0 : 1;
    int _1917 = _1292 * _1905;
    int _1919 = _1917 + _1336;
    bool _1921 = _1741 >= _1779;
    bool _1923 = isnan(_1741);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan(_1779);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    int _1933 = _1845 * _1911;
    int _1935 = _1933 + _1336;
    bool _1937 = !_1895;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = trunc(_1805);
    int _1943 = int(_1941);
    int _1945 = ~_1811;
    int _1947 = _1945 + _1891;
    int _1949 = _1947 + 1;
    int _1951 = abs(_1915);
    bool _1953 = _1292 == 0;
    int _1955 = _1312 * _1949;
    int _1957 = _1955 + _1358;
    int _1959 = abs(_1939);
    int _1961 = _1867 * _1951;
    int _1963 = _1961 + _1358;
    bool _1965 = uint(_1899) >= uint(_1306);
    float _1967 = trunc(_1809);
    int _1969 = int(_1967);
    bool _1971 = !_1869;
    int _1973 = _1971 ? 0 : (-1);
    int _1975 = ~_1821;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    bool _1981 = !_1953;
    int _1983 = _1981 ? _1919 : (-1);
    float _1985 = trunc(_1931);
    int _1987 = int(_1985);
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1991 = _1989 != 0;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1995 = _1993 != 0;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1999 = _1997 != 0;
    int _2001 = _1983 * _1979;
    int _2003 = ~_1807;
    int _2005 = _2003 + _1973;
    int _2007 = _2005 + 1;
    int _2009 = _1883 * _1959;
    int _2011 = _2009 + _1380;
    bool _2013 = !_1965;
    int _2015 = _2013 ? 0 : (-1);
    int _2017 = _1292 + (-1);
    int _2019 = _1326 * _2007;
    int _2021 = _2019 + _1380;
    bool _2023 = !_1995;
    int _2025 = _2023 ? 0 : 1;
    bool _2027 = _1312 == 0;
    int _2029 = _1821 * _2017;
    int _2031 = _2029 + _2001;
    bool _2033 = !_1991;
    int _2035 = _2033 ? 0 : 1;
    int _2037 = ~_1879;
    int _2039 = _2037 + _2015;
    int _2041 = _2039 + 1;
    bool _2043 = _1326 == 0;
    int _2045 = abs(_2025);
    int _2047 = ~_1909;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    bool _2053 = !_2027;
    int _2055 = _2053 ? _1957 : (-1);
    int _2057 = abs(_2035);
    int _2059 = ~_1943;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    int _2065 = _2051 * _2055;
    bool _2067 = !_2043;
    int _2069 = _2067 ? _2021 : (-1);
    int _2071 = _2031 * _2045;
    int _2073 = _1306 * _2041;
    int _2075 = _2073 + _1346;
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2079 = _2077 != 0;
    int _2081 = _2063 * _2069;
    bool _2083 = !_1999;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1969 * _2057;
    int _2089 = _2087 + _2071;
    bool _2091 = !_2079;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = abs(_2085);
    int _2097 = abs(_2093);
    bool _2099 = _1306 == 0;
    int _2101 = _1935 * _2095;
    int _2103 = _2101 + _2089;
    int _2105 = _1312 + (-1);
    float _2107 = trunc(_1827);
    int _2109 = int(_2107);
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2113 = _2111 != 0;
    int _2115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2117 = _2115 != 0;
    int _2119 = _1845 * _2097;
    int _2121 = _2119 + _2103;
    bool _2123 = !_2099;
    int _2125 = _2123 ? _2075 : (-1);
    int _2127 = _1909 * _2105;
    int _2129 = _2127 + _2065;
    int _2131 = ~_1987;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    float _2137 = float(uint(_2121));
    bool _2139 = !_2117;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _2135 * _2125;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2147 = _2145 != 0;
    int _2149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2151 = _2149 != 0;
    float _2153 = as_type<float>(_1342) * _2137;
    int _2155 = abs(_2141);
    bool _2157 = !_2113;
    int _2159 = _2157 ? 0 : 1;
    int _2161 = _1326 + (-1);
    float _2163 = trunc(_2153);
    float _2165 = precise::max(_2163, 0.0);
    uint _2167 = uint(_2165);
    int _2169 = abs(_2159);
    bool _2171 = !_2147;
    int _2173 = _2171 ? 0 : 1;
    int _2175 = _1943 * _2161;
    int _2177 = _2175 + _2081;
    int _2179 = ~_1292;
    int _2181 = _2179 + 1;
    int _2183 = _2129 * _2155;
    int _2185 = abs(_2173);
    int _2187 = _1306 + (-1);
    int _2189 = _2109 * _2169;
    int _2191 = _2189 + _2183;
    bool _2193 = !_2151;
    int _2195 = _2193 ? 0 : 1;
    int _2197 = _1987 * _2187;
    int _2199 = _2197 + _2143;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2203 = _2201 != 0;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_1829);
    int _2211 = int(_2209);
    int _2213 = abs(_2195);
    int _2215 = _2181 * int(_2167);
    int _2217 = _2215 + _2121;
    int _2219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2221 = _2219 != 0;
    int _2223 = _1963 * _2185;
    int _2225 = _2223 + _2191;
    bool _2227 = !_2207;
    int _2229 = _2227 ? 0 : 1;
    float _2231 = float(uint(_2217));
    int _2233 = _1867 * _2213;
    int _2235 = _2233 + _2225;
    bool _2237 = !_2221;
    int _2239 = _2237 ? 0 : 1;
    float _2241 = trunc(_1837);
    int _2243 = int(_2241);
    int _2245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2247 = _2245 != 0;
    float _2249 = as_type<float>(_1342) * _2231;
    int _2251 = abs(_2229);
    bool _2253 = !_2247;
    int _2255 = _2253 ? 0 : 1;
    float _2257 = float(uint(_2235));
    int _2259 = _2177 * _2251;
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2263 = _2261 != 0;
    int _2265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2267 = _2265 != 0;
    int _2269 = abs(_2239);
    float _2271 = as_type<float>(_1376) * _2257;
    float _2273 = trunc(_2249);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    bool _2279 = !_2203;
    int _2281 = _2279 ? 0 : 1;
    bool _2283 = !_2267;
    int _2285 = _2283 ? 0 : 1;
    int _2287 = abs(_2281);
    int _2289 = abs(_2285);
    float _2291 = trunc(_2271);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2211 * _2287;
    int _2299 = _2297 + _2259;
    int _2301 = abs(_2255);
    int _2303 = _2199 * _2289;
    int _2305 = ~_1312;
    int _2307 = _2305 + 1;
    int _2309 = _2011 * _2269;
    int _2311 = _2309 + _2299;
    int _2313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2315 = _2313 != 0;
    float _2317 = trunc(_1831);
    int _2319 = int(_2317);
    int _2321 = _2243 * _2301;
    int _2323 = _2321 + _1346;
    int _2325 = int(_2167) + int(_2277);
    bool _2327 = !_2263;
    int _2329 = _2327 ? 0 : 1;
    bool _2331 = !_2315;
    int _2333 = _2331 ? 0 : 1;
    int _2335 = abs(_2329);
    int _2337 = _2307 * int(_2295);
    int _2339 = _2337 + _2235;
    int _2341 = abs(_2333);
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2349 = _2347 != 0;
    int _2351 = ~_1292;
    int _2353 = _2351 + 1;
    int _2355 = _1883 * _2341;
    int _2357 = _2355 + _2311;
    float _2359 = float(uint(_2339));
    int _2361 = _2319 * _2335;
    int _2363 = _2361 + _2303;
    bool _2365 = !_2345;
    int _2367 = _2365 ? 0 : 1;
    int _2369 = _2353 * _2325;
    int _2371 = _2369 + _2121;
    bool _2373 = !_2349;
    int _2375 = _2373 ? 0 : 1;
    float _2377 = as_type<float>(_1376) * _2359;
    int _2379 = abs(_2367);
    float _2381 = float(uint(_2357));
    float _2383 = trunc(_2377);
    float _2385 = precise::max(_2383, 0.0);
    uint _2387 = uint(_2385);
    bool _2389 = uint(_2371) >= uint(_1292);
    float _2391 = as_type<float>(_1413) * _2381;
    bool _2393 = !_2389;
    int _2395 = _2393 ? 0 : (-1);
    int _2397 = abs(_2375);
    float _2399 = trunc(_2391);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2407 = _2405 != 0;
    int _2409 = _2323 * _2379;
    int _2411 = _2409 + _2363;
    int _2413 = ~_2325;
    int _2415 = _2413 + _2395;
    int _2417 = _2415 + 1;
    bool _2419 = _1292 == 0;
    int _2421 = _2243 * _2397;
    int _2423 = _2421 + _2411;
    int _2425 = ~_1326;
    int _2427 = _2425 + 1;
    int _2429 = _1292 * _2417;
    int _2431 = _2429 + _2121;
    bool _2433 = _1220 > 0.5;
    float _2435 = in.m_65.w;
    float _2437 = float(uint(_2423));
    float _2439 = -_1853;
    float _2441 = _2439 + 1.0;
    bool _2443 = !_2419;
    int _2445 = _2443 ? _2431 : (-1);
    int _2447 = as_type<int>(_2271);
    if (_2407)
    {
        float _2449 = -_1226;
        float _2451 = _2449 + 1.0;
        _2447 = as_type<int>(_2451);
    }
    int _2453 = _2447;
    int _2455 = int(_2295) + int(_2387);
    float _2457 = as_type<float>(_1354) * _2437;
    int _2459 = _2427 * int(_2403);
    int _2461 = _2459 + _2357;
    int _2463 = _2445 & 3;
    bool _2465 = _2463 != 0;
    if (_2407)
    {
        float _2467 = _2433 ? as_type<float>(_2453) : _1226;
        _1390 = _2467;
    }
    float _2469 = _1390;
    int _2471 = ~_1312;
    int _2473 = _2471 + 1;
    float _2475 = trunc(_2457);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    bool _2481 = uint(_2463) > 1u;
    float _2483 = float(uint(_2461));
    int _2485 = _2473 * _2455;
    int _2487 = _2485 + _2235;
    int _2489 = _2445 & 3;
    bool _2491 = _2489 != 0;
    int _2493 = ~_1306;
    int _2495 = _2493 + 1;
    float _2497 = as_type<float>(_1413) * _2483;
    int _2499 = _2491 ? 0 : 1;
    bool _2501 = uint(_2487) >= uint(_1312);
    int _2503 = ~_2499;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = trunc(_2497);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    int _2515 = _2507;
    if (!_2481)
    {
        int _2517 = ~_2499;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    int _2523 = _2495 * int(_2479);
    int _2525 = _2523 + _2423;
    bool _2527 = !_2501;
    int _2529 = _2527 ? 0 : (-1);
    bool _2531 = _2463 != 3;
    bool _2533 = uint(_2463) >= 2u;
    int _2535 = ~_2455;
    int _2537 = _2535 + _2529;
    int _2539 = _2537 + 1;
    int _2541 = _2533 ? 0 : 1;
    float _2543 = float(uint(_2525));
    int _2545 = _1312 * _2539;
    int _2547 = _2545 + _2235;
    int _2549 = _2433 ? as_type<int>(_2441) : as_type<int>(_1853);
    bool _2551 = _2435 > 0.5;
    float _2553 = as_type<float>(_1354) * _2543;
    int _2555 = ~_1326;
    int _2557 = _2555 + 1;
    bool _2559 = _1312 == 0;
    float _2561 = trunc(_2553);
    float _2563 = precise::max(_2561, 0.0);
    uint _2565 = uint(_2563);
    int _2567 = ~_2541;
    int _2569 = _2567 + 1;
    int _2571 = _2569 + 1;
    int _2573 = _2571;
    if (_2531)
    {
        int _2575 = ~_2541;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    int _2581 = int(_2403) + int(_2513);
    bool _2583 = !_2559;
    int _2585 = _2583 ? _2547 : (-1);
    int _2587 = _2551 ? as_type<int>(_2441) : as_type<int>(_1853);
    int _2589 = _2557 * _2581;
    int _2591 = _2589 + _2357;
    int _2593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2595 = _2593 != 0;
    int _2597 = _2585 & 3;
    bool _2599 = _2597 != 0;
    bool _2601 = !_2595;
    int _2603 = _2601 ? 0 : 1;
    bool _2605 = uint(_2597) >= 2u;
    int _2607 = _2599 ? 0 : 1;
    bool _2609 = uint(_2591) >= uint(_1326);
    int _2611 = _2605 ? 0 : 1;
    bool _2613 = _2597 != 3;
    bool _2615 = !_2609;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = ~_1306;
    int _2621 = _2619 + 1;
    bool _2623 = uint(_2597) > 1u;
    int _2625 = ~_2581;
    int _2627 = _2625 + _2617;
    int _2629 = _2627 + 1;
    int _2631 = int(_2479) + int(_2565);
    int _2633 = _1326 * _2629;
    int _2635 = _2633 + _2357;
    bool _2637 = _1326 == 0;
    int _2639 = ~_2611;
    int _2641 = _2639 + 1;
    int _2643 = _2641 + 1;
    int _2645 = _2621 * _2631;
    int _2647 = _2645 + _2423;
    int _2649 = _2643;
    if (_2613)
    {
        int _2651 = ~_2611;
        int _2653 = _2651 + 1;
        _2649 = _2653;
    }
    int _2655 = _2649;
    int _2657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2659 = _2657 != 0;
    int _2661 = ~_2607;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    bool _2667 = !_2637;
    int _2669 = _2667 ? _2635 : (-1);
    int _2671 = _2665;
    if (!_2623)
    {
        int _2673 = ~_2607;
        int _2675 = _2673 + 1;
        _2671 = _2675;
    }
    int _2677 = _2671;
    bool _2679 = uint(_2647) >= uint(_1306);
    bool _2681 = !_2659;
    int _2683 = _2681 ? 0 : 1;
    int _2685 = _2669 & 3;
    bool _2687 = _2685 != 0;
    bool _2689 = !_2679;
    int _2691 = _2689 ? 0 : (-1);
    int _2693 = _2687 ? 0 : 1;
    bool _2695 = uint(_2685) >= 2u;
    bool _2697 = _2685 != 3;
    int _2699 = ~_2631;
    int _2701 = _2699 + _2691;
    int _2703 = _2701 + 1;
    int _2705 = _2695 ? 0 : 1;
    bool _2707 = uint(_2685) > 1u;
    int _2709 = _1306 * _2703;
    int _2711 = _2709 + _2423;
    bool _2713 = _1306 == 0;
    int _2715 = ~_2705;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    bool _2721 = !_2713;
    int _2723 = _2721 ? _2711 : (-1);
    int _2725 = _2719;
    if (_2697)
    {
        int _2727 = ~_2705;
        int _2729 = _2727 + 1;
        _2725 = _2729;
    }
    int _2731 = _2725;
    int _2733 = _2723 & 3;
    bool _2735 = _2733 != 0;
    int _2737 = ~_2693;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = _2741;
    if (!_2707)
    {
        int _2745 = ~_2693;
        int _2747 = _2745 + 1;
        _2743 = _2747;
    }
    int _2749 = _2743;
    bool _2751 = uint(_2733) >= 2u;
    int _2753 = _2735 ? 0 : 1;
    int _2755 = _2751 ? 0 : 1;
    bool _2757 = _2733 != 3;
    bool _2759 = uint(_2733) > 1u;
    int _2761 = ~_2755;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    int _2767 = ~_2753;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2777 = _2765;
    int _2779 = _2771;
    if (_2757)
    {
        int _2781 = ~_2755;
        int _2783 = _2781 + 1;
        _2777 = _2783;
    }
    int _2785 = _2777;
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2789 = _2787 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2759)
    {
        int _2791 = ~_2753;
        int _2793 = _2791 + 1;
        _2779 = _2793;
    }
    int _2795 = _2779;
    float _2797 = 1.0 / _2775;
    float _2799 = in.m_50.x;
    float _2801 = in.m_50.y;
    float _2803 = in.m_50.z;
    int _2805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2807 = _2805 != 0;
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2811 = _2809 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2815 = _2813 != 0;
    bool _2817 = !_2807;
    int _2819 = _2817 ? 0 : 1;
    float _2821 = _2815 ? as_type<float>(_2549) : _1853;
    float _2823 = 1.0 / _2789;
    int _2825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2827 = _2825 != 0;
    bool _2829 = _1535 > 0.5;
    float _2831 = _2827 ? as_type<float>(_2587) : _1853;
    int _2833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2835 = _2833 != 0;
    float _2837 = 1.0 / _2811;
    int _2839 = _2829 ? as_type<int>(_2441) : as_type<int>(_1853);
    int _2841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2843 = _2841 != 0;
    float _2845 = _2835 ? as_type<float>(_2839) : _1853;
    float _2847 = _200 * _2801;
    float _2849 = _2843 ? as_type<float>(_2839) : _1853;
    int _2851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2853 = _2851 != 0;
    int _2855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2857 = _2855 != 0;
    float _2859 = fma(_198, _2799, _2847);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2863 = _2861 != 0;
    float _2865 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2867 = _2865 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2869 = _206 * _2801;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2873 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2875 = _1525 * 2.0;
    float _2877 = 1.0 / _2867;
    float _2879 = _212 * _2801;
    float _2881 = fma(_204, _2799, _2869);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2885 = _2883 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2887 = fma(_2873, -2.0, _2871);
    float _2889 = fma(_210, _2799, _2879);
    float _2891 = floor(_2875);
    float _2893 = fma(_202, _2803, _2859);
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2895;
    float _2899 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2901 = _2899 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2903 = fma(_214, _2803, _2889);
    float _2905 = fma(_208, _2803, _2881);
    float _2907 = 1.0 / _2885;
    float _2909 = _2853 ? as_type<float>(_2839) : _1853;
    float _2911 = _2897 * _2837;
    float _2913 = _2857 ? as_type<float>(_2839) : _1853;
    float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2917 = _1214 + _2915;
    bool _2919 = !_2863;
    int _2921 = _2919 ? 0 : 1;
    float _2923 = _2893 + _1649;
    float _2925 = float(uint(_2011));
    float _2927 = 1.0 / _2901;
    float _2929 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2931 = _2929 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2933 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2933;
    bool _2937 = _2891 > 0.0;
    float _2939 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2887);
    float _2941 = _2931 * _2797;
    float _2943 = _2935 * _2823;
    float _2945 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2947 = _2945 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2953 = _2891 >= 0.0;
    bool _2955 = isnan(_2891);
    bool _2957 = _2953 || _2955;
    bool _2959 = isnan(0.0);
    bool _2961 = _2957 || _2959;
    float _2963 = 1.0 / _2947;
    float _2965 = _2951 * _2877;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2967;
    int _2971 = _2961 ? 0 : 1;
    float _2973 = _2969 * _2907;
    float _2975 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2977 = _2975 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2979 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2979;
    float _2983 = _1220 * 2.0;
    int _2985 = ~_2971;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    float _2991 = _2977 * _2927;
    float _2993 = float(uint(_1935));
    bool _2995 = _1537 != 2;
    int _2997 = _2989;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3001 = _2877;
    float _3003 = _2927;
    float _3005 = _2913;
    if (!_2937)
    {
        int _3007 = ~_2971;
        int _3009 = _3007 + 1;
        _2997 = _3009;
    }
    int _3011 = _2997;
    float _3013 = _2981 * _2963;
    float _3015 = floor(_2983);
    float _3017 = as_type<float>(_1342) * _2993;
    if (!_1607)
    {
        _2999 = _1220;
    }
    float _3019 = _2999;
    float _3021 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3023 = _1214 + _3021;
    float _3025 = _3019;
    if (!_1607)
    {
        _3001 = _1220;
    }
    float _3027 = _3001;
    float _3029 = _3027;
    if (!_1607)
    {
        _3003 = _1535;
    }
    float _3031 = _3003;
    float _3033 = fma(_2911, _3023, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3035 = trunc(_3017);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    float _3041 = 0.0;
    float _3043 = _3031;
    if (!_1607)
    {
        _3041 = _1535;
    }
    float _3045 = _3041;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3049 = _1214 + _3047;
    bool _3051 = !_1607;
    float _3053 = _3051 ? as_type<float>(_1539) : as_type<float>(_1541);
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3057 = _1214 + _3055;
    bool _3059 = !_1607;
    float _3061 = _3059 ? as_type<float>(_1541) : as_type<float>(_1543);
    float _3063 = fma(_2965, _3049, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3065 = _3045;
    if (_1607)
    {
        _3025 = _1525;
    }
    float _3067 = _3025;
    float _3069 = fma(_2991, _3057, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1607)
    {
        _3029 = _1525;
    }
    float _3071 = _3029;
    if (_1607)
    {
        _3043 = _1220;
    }
    float _3073 = _3043;
    if (_1607)
    {
        _3065 = _1220;
    }
    float _3075 = _3065;
    bool _3077 = _3015 > 0.0;
    bool _3079 = _3015 >= 0.0;
    bool _3081 = isnan(_3015);
    bool _3083 = _3079 || _3081;
    bool _3085 = isnan(0.0);
    bool _3087 = _3083 || _3085;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3091 = _1214 + _3089;
    int _3093 = ~_1292;
    int _3095 = _3093 + 1;
    float _3097 = float(uint(_1963));
    float _3099 = fma(_2941, _3091, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3101 = fma(_2943, _2917, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3103 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3105 = _1214 + _3103;
    int _3107 = _3095 * int(_3039);
    int _3109 = _3107 + _1935;
    float _3111 = as_type<float>(_1376) * _3097;
    bool _3113 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3115 = isnan(_1214);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = fma(_3013, _3105, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3127 = float(uint(_2323));
    float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3131 = _1214 + _3129;
    float _3133 = float(uint(_3109));
    float _3135 = _2905 + _1611;
    float _3137 = trunc(_3111);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    bool _3143 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3145 = isnan(_1214);
    bool _3147 = _3143 || _3145;
    bool _3149 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3151 = _3147 || _3149;
    float _3153 = float(_3151);
    float _3155 = -_3123;
    float _3157 = _3155 + 1.0;
    float _3159 = as_type<float>(_1342) * _3133;
    bool _3161 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3163 = isnan(_1214);
    bool _3165 = _3161 || _3163;
    bool _3167 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3169 = _3165 || _3167;
    float _3171 = float(_3169);
    float _3173 = as_type<float>(_1354) * _3127;
    float _3175 = -_3153;
    float _3177 = _3175 + 1.0;
    bool _3179 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3181 = isnan(_1214);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3187 = _3183 || _3185;
    float _3189 = float(_3187);
    float _3191 = fma(_2973, _3131, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3193 = -_3171;
    float _3195 = _3193 + 1.0;
    float _3197 = _3171 * _3177;
    bool _3199 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3201 = isnan(_1214);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3207 = _3203 || _3205;
    float _3209 = float(_3207);
    float _3211 = trunc(_3173);
    float _3213 = precise::max(_3211, 0.0);
    uint _3215 = uint(_3213);
    float _3217 = _3123 * _3195;
    float _3219 = as_type<float>(_1413) * _2925;
    bool _3221 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3223 = isnan(_1214);
    bool _3225 = _3221 || _3223;
    bool _3227 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3229 = _3225 || _3227;
    float _3231 = float(_3229);
    float _3233 = -_3209;
    float _3235 = _3233 + 1.0;
    int _3237 = _1721 * int(_3141);
    int _3239 = _3237 + _1963;
    float _3241 = _3209 * _3157;
    bool _3243 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3245 = isnan(_1214);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3251 = _3247 || _3249;
    float _3253 = float(_3251);
    float _3255 = trunc(_3219);
    float _3257 = precise::max(_3255, 0.0);
    uint _3259 = uint(_3257);
    float _3261 = _3189 * _3235;
    float _3263 = float(uint(_3239));
    float _3265 = -_3189;
    float _3267 = _3265 + 1.0;
    int _3269 = ~_1326;
    int _3271 = _3269 + 1;
    bool _3273 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3275 = isnan(_1214);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3281 = _3277 || _3279;
    float _3283 = float(_3281);
    float _3285 = as_type<float>(_1376) * _3263;
    float _3287 = -_3231;
    float _3289 = _3287 + 1.0;
    int _3291 = ~_1306;
    int _3293 = _3291 + 1;
    float _3295 = trunc(_3159);
    float _3297 = precise::max(_3295, 0.0);
    uint _3299 = uint(_3297);
    float _3301 = _3253 * _3267;
    float _3303 = _3283 * _3289;
    float _3305 = -_3253;
    float _3307 = _3305 + 1.0;
    int _3309 = _3293 * int(_3215);
    int _3311 = _3309 + _2323;
    float _3313 = -_3283;
    float _3315 = _3313 + 1.0;
    int _3317 = _3271 * int(_3259);
    int _3319 = _3317 + _2011;
    float _3321 = _3033 * _3303;
    float _3323 = trunc(_3285);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    float _3329 = _3231 * _3307;
    float _3331 = _3087 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3333 = fma(_3315, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3321);
    float _3335 = float(uint(_3319));
    float _3337 = _2903 + _1705;
    int _3339 = ~_1292;
    int _3341 = _3339 + 1;
    float _3343 = fma(_3099, _3329, _3333);
    float _3345 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3347 = _2923 + _3345;
    float _3349 = as_type<float>(_1413) * _3335;
    float _3351 = float(uint(_3311));
    float _3353 = fma(_3101, _3301, _3343);
    int _3355 = ~_1312;
    int _3357 = _3355 + 1;
    float _3359 = trunc(_3349);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    int _3365 = ~as_type<int>(_3331);
    int _3367 = _3365 + 1;
    int _3369 = _3367 + 1;
    float _3371 = as_type<float>(_1354) * _3351;
    int _3373 = int(_3039) + int(_3299);
    float _3375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3377 = _3135 + _3375;
    int _3379 = int(_3141) + int(_3327);
    float _3381 = fma(_3063, _3261, _3353);
    int _3383 = _3369;
    float _3385 = _3331;
    float _3387 = _3329;
    if (!_3077)
    {
        int _3389 = ~as_type<int>(_3331);
        int _3391 = _3389 + 1;
        _3383 = _3391;
    }
    int _3393 = _3383;
    float _3395 = trunc(_3371);
    float _3397 = precise::max(_3395, 0.0);
    uint _3399 = uint(_3397);
    int _3401 = _3341 * _3373;
    int _3403 = _3401 + _1935;
    int _3405 = ~_1326;
    int _3407 = _3405 + 1;
    float _3409 = fma(_3191, _3241, _3381);
    float _3411 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3413 = uint(_3403) >= uint(_1292);
    int _3415 = _3357 * _3379;
    int _3417 = _3415 + _1963;
    float _3419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3421 = int(_3259) + int(_3363);
    float _3423 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3425 = !_3413;
    int _3427 = _3425 ? 0 : (-1);
    float _3429 = _1535 * 2.0;
    bool _3431 = uint(_3417) >= uint(_1312);
    float _3433 = _3377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3435 = -_3423;
    float _3437 = fma(_3411, 2.0, _3435);
    int _3439 = int(_3215) + int(_3399);
    int _3441 = _3407 * _3421;
    int _3443 = _3441 + _2011;
    int _3445 = ~_1306;
    int _3447 = _3445 + 1;
    float _3449 = floor(_3429);
    bool _3451 = !_3431;
    int _3453 = _3451 ? 0 : (-1);
    float _3455 = -_168;
    float _3457 = fma(_3455, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3437);
    bool _3459 = uint(_3443) >= uint(_1326);
    float _3461 = fma(_3347, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3433);
    float _3463 = _3419 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3467 = _3337 + _3465;
    bool _3469 = !_3459;
    int _3471 = _3469 ? 0 : (-1);
    float _3473 = fma(_3463, _1429, -0.5);
    int _3475 = _3447 * _3439;
    int _3477 = _3475 + _2323;
    float _3479 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3461);
    bool _3481 = uint(_3477) >= uint(_1306);
    float _3483 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3489 = !_3481;
    int _3491 = _3489 ? 0 : (-1);
    float _3493 = fma(as_type<float>(_1543), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3483);
    bool _3495 = _3479 >= 0.0;
    float _3497 = as_type<float>(_1543) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3499 = fma(as_type<float>(_1541), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3485);
    float _3501 = as_type<float>(_1541) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3503 = _1220 + _1525;
    float _3505 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3493);
    float _3507 = fma(_3501, -2.0, _3487);
    float _3509 = _3503 + (-1.0);
    float _3511 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3513 = ~_3379;
    int _3515 = _3513 + _3453;
    int _3517 = _3515 + 1;
    float _3519 = fma(_3069, _3217, _3409);
    float _3521 = fma(_3509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3523 = _3509;
    if (_3495)
    {
        _3523 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3525 = _3523;
    float _3527 = -_3511;
    float _3529 = fma(_3497, 2.0, _3527);
    int _3531 = ~_3373;
    int _3533 = _3531 + _3427;
    int _3535 = _3533 + 1;
    bool _3537 = !_2465;
    int _3539 = _3537 ? 0 : 1;
    int _3541 = as_type<int>(_3525);
    if (_3495)
    {
        float _3543 = _3525 * 5.0;
        _3541 = as_type<int>(_3543);
    }
    int _3545 = _3541;
    int _3547 = _2585 & 3;
    bool _3549 = _3547 != 0;
    float _3551 = fma(_3125, _3197, _3519);
    int _3553 = _1292 * _3535;
    int _3555 = _3553 + _1935;
    if (_3495)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11987 = as_type<float>(_3545);
        out.gl_Position.z = _11987;
    }
    bool _3557 = !_3549;
    int _3559 = _3557 ? 0 : 1;
    float _3561 = fma(_3153, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3551);
    int _3563 = _2669 & 3;
    bool _3565 = _3563 != 0;
    float _3567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3569 = _1312 * _3517;
    int _3571 = _3569 + _1963;
    bool _3573 = !_3565;
    int _3575 = _3573 ? 0 : 1;
    float _3577 = fma(_3071, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3567);
    int _3579 = _2723 & 3;
    bool _3581 = _3579 != 0;
    out.m_77.x = _3561;
    float _3583 = _3377 * _3377;
    bool _3585 = !_3581;
    int _3587 = _3585 ? 0 : 1;
    float _3589 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3499);
    bool _3591 = _2463 != 3;
    float _3593 = fma(_3347, _3347, _3583);
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3597 = fma(_3467, _3467, _3593);
    bool _3599 = !_3591;
    int _3601 = _3599 ? 0 : (-1);
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3605 = _2445 >> 31;
    float _3607 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3609 = _2597 != 3;
    float _3611 = fma(_3053, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3603);
    float _3613 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3615 = _3605 & 3;
    float _3617 = rsqrt(_3597);
    int _3619 = _2669 >> 31;
    float _3621 = fma(_3613, -2.0, _3607);
    int _3623 = _2585 >> 31;
    float _3625 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3595);
    int _3627 = _2445 + _3615;
    float _3629 = _3061 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3631 = _3623 & 3;
    float _3633 = -_168;
    float _3635 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3529);
    int _3637 = _3627 >> 2;
    float _3639 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3507);
    int _3641 = _2585 + _3631;
    float _3643 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3625);
    int _3645 = _2723 >> 31;
    float _3647 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3577);
    int _3649 = _3619 & 3;
    float _3651 = _3347 * _3617;
    int _3653 = _3641 >> 2;
    float _3655 = _3377 * _3617;
    int _3657 = _3637 << 4;
    int _3659 = _3657 + 368;
    float _3661 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3621);
    bool _3663 = !_3609;
    int _3665 = _3663 ? 0 : (-1);
    float _3667 = -_3655;
    float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3377);
    bool _3671 = _2685 != 3;
    if (_3495)
    {
        out.m_53.x = 0.0;
    }
    if (_2995)
    {
        _3385 = _1525;
    }
    float _3673 = _3385;
    float _3675 = _3669 * _3669;
    float _3677 = _3673;
    if (_2995)
    {
        _3387 = _1220;
    }
    float _3679 = _3387;
    int _3681 = _3645 & 3;
    float _3683 = _3679;
    if (!_2995)
    {
        _3677 = _1535;
    }
    float _3685 = _3677;
    uint _3687 = uint(int(uint(_3659) >> uint(2)));
    uint _3689 = uint(int(uint(int(_3687)) >> uint(2)));
    int _3691 = int(_3687) & 3;
    float _3693 = (*spvDescriptorSet0.vp_c9)._m0[int(_3689)][_3691];
    int _3695 = int(_3687) + 1;
    uint _3697 = uint(int(uint(_3695) >> uint(2)));
    int _3699 = _3695 & 3;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[int(_3697)][_3699];
    if (!_2995)
    {
        _3683 = _1525;
    }
    float _3703 = _3683;
    int _3705 = _2669 + _3649;
    float _3707 = _3685 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3709 = _3653 << 4;
    int _3711 = _3709 + 512;
    float _3713 = _3703 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3715 = _3449 > 0.0;
    float _3717 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3719 = int(_3717);
    bool _3721 = _3449 >= 0.0;
    bool _3723 = isnan(_3449);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan(0.0);
    bool _3729 = _3725 || _3727;
    uint _3731 = uint(int(uint(_3711) >> uint(2)));
    uint _3733 = uint(int(uint(int(_3731)) >> uint(2)));
    int _3735 = int(_3731) & 3;
    float _3737 = (*spvDescriptorSet0.vp_c9)._m0[int(_3733)][_3735];
    int _3739 = int(_3731) + 1;
    uint _3741 = uint(int(uint(_3739) >> uint(2)));
    int _3743 = _3739 & 3;
    float _3745 = (*spvDescriptorSet0.vp_c9)._m0[int(_3741)][_3743];
    bool _3747 = _2733 != 3;
    float _3749 = -_3651;
    float _3751 = fma(_3749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3347);
    int _3753 = _2723 + _3681;
    float _3755 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3757 = _3705 >> 2;
    float _3759 = fma(_3751, _3751, _3675);
    float _3761 = -_3755;
    float _3763 = fma(_3629, 2.0, _3761);
    bool _3765 = !_2419;
    int _3767 = _3765 ? _3555 : (-1);
    float _3769 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3771 = int(_3769);
    bool _3773 = !_2559;
    int _3775 = _3773 ? _3571 : (-1);
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3779 = !_3747;
    int _3781 = _3779 ? 0 : (-1);
    float _3783 = _3073 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3785 = _3753 >> 2;
    int _3787 = _3757 << 4;
    int _3789 = _3787 + 656;
    int _3791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3793 = _3791 != 0;
    int _3795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3797 = _3795 != 0;
    int _3799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3801 = _3799 != 0;
    float _3803 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3805 = _3785 << 4;
    int _3807 = _3805 + 800;
    uint _3809 = uint(int(uint(_3789) >> uint(2)));
    uint _3811 = uint(int(uint(int(_3809)) >> uint(2)));
    int _3813 = int(_3809) & 3;
    float _3815 = (*spvDescriptorSet0.vp_c9)._m0[int(_3811)][_3813];
    int _3817 = int(_3809) + 1;
    uint _3819 = uint(int(uint(_3817) >> uint(2)));
    int _3821 = _3817 & 3;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[int(_3819)][_3821];
    float _3825 = -_3777;
    float _3827 = fma(_3803, 2.0, _3825);
    float _3829 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3831 = _3729 ? 0 : 1;
    uint _3833 = uint(int(uint(_3807) >> uint(2)));
    uint _3835 = uint(int(uint(int(_3833)) >> uint(2)));
    int _3837 = int(_3833) & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    int _3841 = int(_3833) + 1;
    uint _3843 = uint(int(uint(_3841) >> uint(2)));
    int _3845 = _3841 & 3;
    float _3847 = (*spvDescriptorSet0.vp_c9)._m0[int(_3843)][_3845];
    float _3849 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3851 = -_3829;
    float _3853 = fma(_3707, 2.0, _3851);
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3857 = ~_3421;
    int _3859 = _3857 + _3471;
    int _3861 = _3859 + 1;
    float _3863 = fma(_3713, -2.0, _3849);
    int _3865 = ~_3439;
    int _3867 = _3865 + _3491;
    int _3869 = _3867 + 1;
    float _3871 = fma(_3783, -2.0, _3855);
    int _3873 = _3659 + 8;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    uint _3877 = uint(int(uint(int(_3875)) >> uint(2)));
    int _3879 = int(_3875) & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = int(_3875) + 1;
    uint _3885 = uint(int(uint(_3883) >> uint(2)));
    int _3887 = _3883 & 3;
    float _3889 = (*spvDescriptorSet0.vp_c9)._m0[int(_3885)][_3887];
    int _3891 = ~_3831;
    int _3893 = _3891 + 1;
    int _3895 = _3893 + 1;
    float _3897 = -_168;
    float _3899 = fma(_3897, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3827);
    int _3901 = _3895;
    if (!_3715)
    {
        int _3903 = ~_3831;
        int _3905 = _3903 + 1;
        _3901 = _3905;
    }
    int _3907 = _3901;
    int _3909 = _1306 * _3869;
    int _3911 = _3909 + _2323;
    int _3913 = abs(_2677);
    float _3915 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3871);
    int _3917 = abs(_2521);
    int _3919 = _3789 + 8;
    uint _3921 = uint(int(uint(_3919) >> uint(2)));
    uint _3923 = uint(int(uint(int(_3921)) >> uint(2)));
    int _3925 = int(_3921) & 3;
    float _3927 = (*spvDescriptorSet0.vp_c9)._m0[int(_3923)][_3925];
    int _3929 = int(_3921) + 1;
    uint _3931 = uint(int(uint(_3929) >> uint(2)));
    int _3933 = _3929 & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = abs(_2749);
    int _3939 = _1326 * _3861;
    int _3941 = _3939 + _2011;
    int _3943 = ~_3917;
    int _3945 = _3943 + 1;
    int _3947 = _3945 + 1;
    float _3949 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3951 = int(_3949);
    int _3953 = ~_3913;
    int _3955 = _3953 + 1;
    int _3957 = _3955 + 1;
    float _3959 = -_168;
    float _3961 = fma(_3959, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3853);
    int _3963 = abs(_3575);
    int _3965 = _3711 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    int _3983 = _3947 * as_type<int>(_3701);
    int _3985 = abs(_3587);
    int _3987 = _3957 * as_type<int>(_3745);
    int _3989 = abs(_3539);
    float _3991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3993 = abs(_2795);
    float _3995 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3863);
    int _3997 = _3807 + 8;
    uint _3999 = uint(int(uint(_3997) >> uint(2)));
    uint _4001 = uint(int(uint(int(_3999)) >> uint(2)));
    int _4003 = int(_3999) & 3;
    float _4005 = (*spvDescriptorSet0.vp_c9)._m0[int(_4001)][_4003];
    int _4007 = int(_3999) + 1;
    uint _4009 = uint(int(uint(_4007) >> uint(2)));
    int _4011 = _4007 & 3;
    float _4013 = (*spvDescriptorSet0.vp_c9)._m0[int(_4009)][_4011];
    int _4015 = ~_3937;
    int _4017 = _4015 + 1;
    int _4019 = _4017 + 1;
    int _4021 = ~_3993;
    int _4023 = _4021 + 1;
    int _4025 = _4023 + 1;
    int _4027 = _4019 * as_type<int>(_3823);
    int _4029 = abs(_3559);
    int _4031 = ~_3989;
    int _4033 = _4031 + 1;
    int _4035 = _4033 + 1;
    float _4037 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4039 = ~_3985;
    int _4041 = _4039 + 1;
    int _4043 = _4041 + 1;
    int _4045 = _4025 * as_type<int>(_3847);
    int _4047 = ~_4029;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    int _4053 = _4035 * as_type<int>(_3693);
    int _4055 = _4053 + _3983;
    int _4057 = abs(_2579);
    int _4059 = _4043 * as_type<int>(_3839);
    int _4061 = _4059 + _4045;
    int _4063 = ~_3963;
    int _4065 = _4063 + 1;
    int _4067 = _4065 + 1;
    float _4069 = fma(_3075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4037);
    int _4071 = abs(_2731);
    float _4073 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4075 = int(_4073);
    int _4077 = _4051 * as_type<int>(_3737);
    int _4079 = _4077 + _3987;
    int _4081 = abs(_3601);
    int _4083 = _4067 * as_type<int>(_3815);
    int _4085 = _4083 + _4027;
    int _4087 = ~_4057;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    float _4093 = _3991 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4095 = ~_4071;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    float _4101 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4069);
    int _4103 = abs(_2655);
    int _4105 = _4091 * as_type<int>(_3881);
    int _4107 = _4105 + _4055;
    float _4109 = float(uint(_3771));
    int _4111 = _4099 * as_type<int>(_3927);
    int _4113 = _4111 + _4085;
    int _4115 = ~_4081;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    float _4121 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4123 = log2(_4121);
    int _4125 = abs(_2603);
    float _4127 = fma(_4093, _2909, -0.5);
    int _4129 = ~_4103;
    int _4131 = _4129 + 1;
    int _4133 = _4131 + 1;
    int _4135 = _4119 * as_type<int>(_3889);
    int _4137 = _4135 + _4107;
    int _4139 = abs(_3665);
    int _4141 = ~_4125;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    float _4147 = 1.0 / _4109;
    bool _4149 = !_3671;
    int _4151 = _4149 ? 0 : (-1);
    int _4153 = _4133 * as_type<int>(_3973);
    int _4155 = _4153 + _4079;
    int _4157 = ~_4139;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4137 * _4145;
    float _4165 = float(uint(_4075));
    int _4167 = abs(_2785);
    int _4169 = _4161 * as_type<int>(_3981);
    int _4171 = _4169 + _4155;
    int _4173 = abs(_4151);
    float _4175 = 1.0 / _4165;
    int _4177 = abs(_2683);
    int _4179 = _3767 * _4125;
    int _4181 = _4179 + _4163;
    float _4183 = float(uint(_3719));
    int _4185 = ~_4173;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    int _4191 = ~_4167;
    int _4193 = _4191 + 1;
    int _4195 = _4193 + 1;
    float _4197 = 1.0 / _4183;
    int _4199 = ~_4177;
    int _4201 = _4199 + 1;
    int _4203 = _4201 + 1;
    int _4205 = _4189 * as_type<int>(_3935);
    int _4207 = _4205 + _4113;
    int _4209 = abs(_3781);
    int _4211 = _4195 * as_type<int>(_4005);
    int _4213 = _4211 + _4061;
    int _4215 = as_type<int>(_4147) + (-2);
    int _4217 = _4203 * _4171;
    int _4219 = abs(_2819);
    float _4221 = float(uint(_4181));
    int _4223 = _3775 * _4177;
    int _4225 = _4223 + _4217;
    float _4227 = float(uint(_3951));
    int _4229 = abs(_2921);
    float _4231 = as_type<float>(_4215) * _4221;
    int _4233 = ~_4209;
    int _4235 = _4233 + 1;
    int _4237 = _4235 + 1;
    int _4239 = ~_4219;
    int _4241 = _4239 + 1;
    int _4243 = _4241 + 1;
    float _4245 = 1.0 / _4227;
    bool _4247 = _1326 == 0;
    int _4249 = _4237 * as_type<int>(_4013);
    int _4251 = _4249 + _4213;
    int _4253 = _4243 * _4207;
    bool _4255 = !_4247;
    int _4257 = _4255 ? _3941 : (-1);
    float _4259 = _4123 * _168;
    int _4261 = ~_4229;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    float _4267 = trunc(_4231);
    float _4269 = precise::max(_4267, 0.0);
    uint _4271 = uint(_4269);
    int _4273 = as_type<int>(_4175) + (-2);
    int _4275 = _4257 * _4219;
    int _4277 = _4275 + _4253;
    float _4279 = float(uint(_4225));
    int _4281 = _4265 * _4251;
    bool _4283 = _1306 == 0;
    float _4285 = _3467 * _3617;
    int _4287 = as_type<int>(_4197) + (-2);
    float _4289 = as_type<float>(_4273) * _4279;
    bool _4291 = !_4283;
    int _4293 = _4291 ? _3911 : (-1);
    float _4295 = exp2(_4259);
    float _4297 = float(uint(_4277));
    int _4299 = ~_3771;
    int _4301 = _4299 + 1;
    int _4303 = _4293 * _4229;
    int _4305 = _4303 + _4281;
    int _4307 = as_type<int>(_4245) + (-2);
    float _4309 = as_type<float>(_4287) * _4297;
    int _4311 = abs(_3771);
    float _4313 = trunc(_4289);
    float _4315 = precise::max(_4313, 0.0);
    uint _4317 = uint(_4315);
    float _4319 = float(uint(_4305));
    int _4321 = _4301 * int(_4271);
    int _4323 = _4321 + _4181;
    float _4325 = float(uint(_4311));
    float _4327 = -_4285;
    float _4329 = fma(_4327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3467);
    int _4331 = abs(_4075);
    float _4333 = as_type<float>(_4307) * _4319;
    float _4335 = float(uint(_4323));
    float _4337 = trunc(_4309);
    float _4339 = precise::max(_4337, 0.0);
    uint _4341 = uint(_4339);
    int _4343 = ~_4075;
    int _4345 = _4343 + 1;
    float _4347 = fma(_4329, _4329, _3759);
    int _4349 = ~_3719;
    int _4351 = _4349 + 1;
    float _4353 = as_type<float>(_4215) * _4335;
    float _4355 = float(uint(_4331));
    int _4357 = abs(_3719);
    float _4359 = trunc(_4333);
    float _4361 = precise::max(_4359, 0.0);
    uint _4363 = uint(_4361);
    int _4365 = _4345 * int(_4317);
    int _4367 = _4365 + _4225;
    int _4369 = ~_3951;
    int _4371 = _4369 + 1;
    float _4373 = float(uint(_4367));
    float _4375 = 1.0 / _4325;
    int _4377 = _4351 * int(_4341);
    int _4379 = _4377 + _4277;
    float _4381 = as_type<float>(_4273) * _4373;
    float _4383 = float(uint(_4357));
    float _4385 = float(uint(_4379));
    float _4387 = 1.0 / _4355;
    int _4389 = _4371 * int(_4363);
    int _4391 = _4389 + _4305;
    int _4393 = abs(_3951);
    float _4395 = as_type<float>(_4287) * _4385;
    int _4397 = abs(_4181);
    float _4399 = float(uint(_4391));
    float _4401 = 1.0 / _4383;
    float _4403 = float(uint(_4393));
    int _4405 = abs(_4225);
    float _4407 = as_type<float>(_4307) * _4399;
    int _4409 = as_type<int>(_4375) + (-2);
    float _4411 = float(uint(_4397));
    float _4413 = 1.0 / _4403;
    int _4415 = as_type<int>(_4387) + (-2);
    int _4417 = abs(_4277);
    float _4419 = as_type<float>(_4409) * _4411;
    float _4421 = float(uint(_4405));
    float _4423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4425 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4427 = isnan(1.0);
    bool _4429 = _4425 || _4427;
    bool _4431 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4433 = _4429 || _4431;
    float _4435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4437 = 1.0 + _4435;
    float _4439 = as_type<float>(_4415) * _4421;
    float _4441 = trunc(_4419);
    float _4443 = precise::max(_4441, 0.0);
    uint _4445 = uint(_4443);
    float _4447 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4423);
    int _4449 = as_type<int>(_4401) + (-2);
    float _4451 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4453 = float(uint(_4417));
    float _4455 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4457 = abs(_4305);
    float _4459 = 1.0 / _4437;
    float _4461 = as_type<float>(_4449) * _4453;
    int _4463 = as_type<int>(_4413) + (-2);
    float _4465 = -_4295;
    float _4467 = _4465 + 1.0;
    float _4469 = float(uint(_4457));
    float _4471 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4473 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4475 = isnan(0.0);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4481 = _4477 || _4479;
    float _4483 = trunc(_4439);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    float _4489 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4451);
    float _4491 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4455);
    float _4493 = as_type<float>(_4463) * _4469;
    int _4495 = ~_4311;
    int _4497 = _4495 + 1;
    float _4499 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4471);
    float _4501 = _4481 ? _4467 : 0.0;
    float _4503 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4489);
    float _4505 = trunc(_4461);
    float _4507 = precise::max(_4505, 0.0);
    uint _4509 = uint(_4507);
    int _4511 = ~_4331;
    int _4513 = _4511 + 1;
    float _4515 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3611);
    int _4517 = _4497 * int(_4445);
    int _4519 = _4517 + _4397;
    float _4521 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4499);
    float _4523 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4447);
    float _4525 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4491);
    int _4527 = ~_4393;
    int _4529 = _4527 + 1;
    float _4531 = trunc(_4381);
    float _4533 = precise::max(_4531, 0.0);
    uint _4535 = uint(_4533);
    float _4537 = float(uint(_4519));
    float _4539 = -_3661;
    float _4541 = fma(_4515, _4127, _4539);
    float _4543 = as_type<float>(_4409) * _4537;
    float _4545 = trunc(_4353);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    float _4551 = trunc(_4493);
    float _4553 = precise::max(_4551, 0.0);
    uint _4555 = uint(_4553);
    float _4557 = -_168;
    float _4559 = fma(_4557, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3763);
    float _4561 = _4285;
    if (_4433)
    {
        float _4563 = _4501 * _4459;
        _170 = _4563;
    }
    float _4565 = _170;
    int _4567 = _4513 * int(_4487);
    int _4569 = _4567 + _4405;
    int _4571 = ~_4357;
    int _4573 = _4571 + 1;
    float _4575 = fma(_3643, _3473, _4559);
    int _4577 = int(_4317) + int(_4535);
    float _4579 = trunc(_4395);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    int _4585 = int(_4271) + int(_4549);
    float _4587 = trunc(_4407);
    float _4589 = precise::max(_4587, 0.0);
    uint _4591 = uint(_4589);
    float _4593 = float(uint(_4569));
    int _4595 = _4573 * int(_4509);
    int _4597 = _4595 + _4417;
    int _4599 = _4529 * int(_4555);
    int _4601 = _4599 + _4457;
    float _4603 = as_type<float>(_4415) * _4593;
    int _4605 = ~_3771;
    int _4607 = _4605 + 1;
    float _4609 = trunc(_4543);
    float _4611 = precise::max(_4609, 0.0);
    uint _4613 = uint(_4611);
    float _4615 = float(uint(_4597));
    int _4617 = int(_4341) + int(_4583);
    float _4619 = as_type<float>(_4449) * _4615;
    int _4621 = ~_4075;
    int _4623 = _4621 + 1;
    float _4625 = trunc(_4603);
    float _4627 = precise::max(_4625, 0.0);
    uint _4629 = uint(_4627);
    int _4631 = int(_4363) + int(_4591);
    int _4633 = _4607 * _4585;
    int _4635 = _4633 + _4181;
    float _4637 = float(uint(_4601));
    int _4639 = ~_3951;
    int _4641 = _4639 + 1;
    float _4643 = as_type<float>(_4463) * _4637;
    int _4645 = ~_3719;
    int _4647 = _4645 + 1;
    float _4649 = trunc(_4619);
    float _4651 = precise::max(_4649, 0.0);
    uint _4653 = uint(_4651);
    bool _4655 = uint(_4635) >= uint(_3771);
    int _4657 = _4623 * _4577;
    int _4659 = _4657 + _4225;
    bool _4661 = uint(_4659) >= uint(_4075);
    float _4663 = trunc(_4643);
    float _4665 = precise::max(_4663, 0.0);
    uint _4667 = uint(_4665);
    int _4669 = _4641 * _4631;
    int _4671 = _4669 + _4305;
    bool _4673 = !_4655;
    int _4675 = _4673 ? 0 : (-1);
    int _4677 = _4647 * _4617;
    int _4679 = _4677 + _4277;
    int _4681 = int(_4445) + int(_4613);
    int _4683 = int(_4487) + int(_4629);
    bool _4685 = uint(_4679) >= uint(_3719);
    float _4687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4689 = !_4661;
    int _4691 = _4689 ? 0 : (-1);
    bool _4693 = uint(_4671) >= uint(_3951);
    int _4695 = ~_4331;
    int _4697 = _4695 + 1;
    int _4699 = ~_4311;
    int _4701 = _4699 + 1;
    int _4703 = int(_4555) + int(_4667);
    int _4705 = _4701 * _4681;
    int _4707 = _4705 + _4397;
    int _4709 = ~_4393;
    int _4711 = _4709 + 1;
    float _4713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4715 = int(_4509) + int(_4653);
    int _4717 = _4697 * _4683;
    int _4719 = _4717 + _4405;
    int _4721 = ~_4357;
    int _4723 = _4721 + 1;
    int _4725 = _4711 * _4703;
    int _4727 = _4725 + _4457;
    bool _4729 = !_4685;
    int _4731 = _4729 ? 0 : (-1);
    float _4733 = _4687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4735 = uint(_4707) >= uint(_4311);
    int _4737 = _4723 * _4715;
    int _4739 = _4737 + _4417;
    bool _4741 = !_4693;
    int _4743 = _4741 ? 0 : (-1);
    float _4745 = fma(_4733, _1703, -0.5);
    bool _4747 = uint(_4719) >= uint(_4331);
    int _4749 = ~_4585;
    int _4751 = _4749 + _4675;
    int _4753 = _4751 + 1;
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4757 = !_4747;
    int _4759 = _4757 ? 0 : (-1);
    float _4761 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4763 = ~_4577;
    int _4765 = _4763 + _4691;
    int _4767 = _4765 + 1;
    int _4769 = _3771 * _4753;
    int _4771 = _4769 + _4181;
    bool _4773 = uint(_4727) >= uint(_4393);
    float _4775 = _4713 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4777 = ~_4631;
    int _4779 = _4777 + _4743;
    int _4781 = _4779 + 1;
    int _4783 = _4075 * _4767;
    int _4785 = _4783 + _4225;
    bool _4787 = !_4773;
    int _4789 = _4787 ? 0 : (-1);
    float _4791 = fma(_4775, _2821, -0.5);
    bool _4793 = _4075 == 0;
    int _4795 = _3951 * _4781;
    int _4797 = _4795 + _4305;
    int _4799 = ~_4617;
    int _4801 = _4799 + _4731;
    int _4803 = _4801 + 1;
    bool _4805 = !_4793;
    int _4807 = _4805 ? _4785 : (-1);
    float _4809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4811 = _3951 == 0;
    bool _4813 = !_4735;
    int _4815 = _4813 ? 0 : (-1);
    int _4817 = _4181 ^ _3771;
    bool _4819 = uint(_4739) >= uint(_4357);
    int _4821 = _3719 * _4803;
    int _4823 = _4821 + _4277;
    bool _4825 = !_4811;
    int _4827 = _4825 ? _4797 : (-1);
    bool _4829 = _4075 == 0;
    int _4831 = _4225 ^ _4075;
    float _4833 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4835 = uint(int(uint(_4817) >> uint(31)));
    float _4837 = _4761 * _4809;
    bool _4839 = !_4819;
    int _4841 = _4839 ? 0 : (-1);
    float _4843 = _4833 * _4755;
    bool _4845 = _3771 == 0;
    float _4847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4849 = uint(int(uint(_4831) >> uint(31)));
    int _4851 = ~_4815;
    int _4853 = _4681 + _4851;
    int _4855 = _4853 + 1;
    out.m_79.x = _4843;
    out.m_79.y = _4837;
    int _4857 = ~int(_4835);
    int _4859 = _4857 + 1;
    bool _4861 = !_4845;
    int _4863 = _4861 ? _4771 : (-1);
    float _4865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4867 = _3719 == 0;
    int _4869 = ~_4759;
    int _4871 = _4683 + _4869;
    int _4873 = _4871 + 1;
    int _4875 = ~int(_4849);
    int _4877 = _4875 + 1;
    int _4879 = _4855 ^ _4859;
    float _4881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4883 = !_4867;
    int _4885 = _4883 ? _4823 : (-1);
    int _4887 = _4873 ^ _4877;
    bool _4889 = _3771 == 0;
    int _4891 = ~_4859;
    int _4893 = _4891 + _4879;
    int _4895 = _4893 + 1;
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4899 = ~_4877;
    int _4901 = _4899 + _4887;
    int _4903 = _4901 + 1;
    float _4905 = _4865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4907 = !_4889;
    int _4909 = _4907 ? _4895 : (-1);
    bool _4911 = _3719 == 0;
    float _4913 = fma(_4905, _1691, -0.5);
    int _4915 = _4277 ^ _3719;
    float _4917 = float(_4863);
    bool _4919 = !_4829;
    int _4921 = _4919 ? _4903 : (-1);
    float _4923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4925 = _3951 == 0;
    float _4927 = fma(_4733, _4917, _3457);
    int _4929 = _4305 ^ _3951;
    float _4931 = _4847 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4933 = float(_4885);
    float _4935 = fma(_4523, _4745, _4927);
    uint _4937 = uint(int(uint(_4929) >> uint(31)));
    float _4939 = fma(_4931, _1751, -0.5);
    int _4941 = ~_4789;
    int _4943 = _4703 + _4941;
    int _4945 = _4943 + 1;
    float _4947 = fma(_4931, _4933, _3961);
    int _4949 = ~int(_4937);
    int _4951 = _4949 + 1;
    float _4953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4955 = float(_4807);
    float _4957 = fma(_4525, _4939, _4947);
    int _4959 = _4945 ^ _4951;
    uint _4961 = uint(int(uint(_4915) >> uint(31)));
    float _4963 = fma(_4905, _4955, _3899);
    float _4965 = float(_4827);
    float _4967 = _4881 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4969 = ~_4951;
    int _4971 = _4969 + _4959;
    int _4973 = _4971 + 1;
    float _4975 = fma(_3647, _4913, _4963);
    int _4977 = ~_4841;
    int _4979 = _4715 + _4977;
    int _4981 = _4979 + 1;
    float _4983 = fma(_4967, _2469, -0.5);
    int _4985 = ~int(_4961);
    int _4987 = _4985 + 1;
    float _4989 = fma(_4967, _4965, _3635);
    float _4991 = float(_4909);
    float _4993 = _4953 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4995 = !_4925;
    int _4997 = _4995 ? _4973 : (-1);
    float _4999 = fma(_3505, _4983, _4989);
    int _5001 = _4981 ^ _4987;
    float _5003 = -_2939;
    float _5005 = fma(_4775, _4991, _5003);
    float _5007 = float(_4921);
    float _5009 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5011 = float(_4997);
    float _5013 = _4923 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5015 = ~_4987;
    int _5017 = _5015 + _5001;
    int _5019 = _5017 + 1;
    float _5021 = fma(_5009, _2831, -0.5);
    float _5023 = -_3915;
    float _5025 = fma(_5009, _5007, _5023);
    float _5027 = fma(_4993, _2849, -0.5);
    bool _5029 = !_4911;
    int _5031 = _5029 ? _5019 : (-1);
    float _5033 = -_3639;
    float _5035 = fma(_4993, _5011, _5033);
    float _5037 = fma(_4503, _4791, _5005);
    float _5039 = fma(_4101, _5021, _5025);
    float _5041 = float(_5031);
    float _5043 = fma(_3589, _5027, _5035);
    float _5045 = fma(_5013, _2845, -0.5);
    float _5047 = _4957 + 0.5;
    float _5049 = _4575 + 0.5;
    float _5051 = -_3995;
    float _5053 = fma(_5013, _5041, _5051);
    float _5055 = _5043 + 0.5;
    float _5057 = _4541 + 0.5;
    float _5059 = in.m_81.x;
    float _5061 = in.m_81.y;
    float _5063 = in.m_81.z;
    float _5065 = fma(_4521, _5045, _5053);
    float _5067 = _4935 + 0.5;
    float _5069 = _4975 + 0.5;
    float _5071 = _5037 + 0.5;
    float _5073 = _5065 + 0.5;
    float _5075 = _5039 + 0.5;
    float _5077 = _4999 + 0.5;
    bool _5079 = !_3793;
    int _5081 = _5079 ? 0 : 1;
    out.m_83.x = _5049;
    out.m_83.y = _5057;
    bool _5083 = !_3797;
    int _5085 = _5083 ? 0 : 1;
    int _5087 = abs(_5081);
    out.m_85.x = _5067;
    out.m_85.y = _5071;
    out.m_85.z = _5069;
    out.m_85.w = _5075;
    int _5089 = abs(_5085);
    bool _5091 = !_3801;
    int _5093 = _5091 ? 0 : 1;
    out.m_87.x = _5047;
    out.m_87.y = _5073;
    float _5095 = float(_5087);
    out.m_89.x = _5077;
    out.m_89.y = _5055;
    float _5097 = float(_3907);
    float _5099 = _4939;
    float _5101 = as_type<float>(_4739);
    float _5103 = as_type<float>(_4767);
    float _5105 = _4575;
    if (_3495)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5107 = -_3655;
    float _5109 = fma(_5107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3135);
    float _5111 = _5095 * _5097;
    float _5113 = float(_3011);
    float _5115 = -_3651;
    float _5117 = fma(_5115, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2923);
    float _5119 = float(_5089);
    float _5121 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5123 = _5109 + _5121;
    float _5125 = _5111 * (-2.0);
    float _5127 = -_4285;
    float _5129 = fma(_5127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3337);
    float _5131 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5133 = _5117 + _5131;
    float _5135 = _5123 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5137 = _5119 * _5113;
    float _5139 = _1525 + (-0.5);
    float _5141 = fma(_5125, _5059, _5059);
    float _5143 = _1220 + _1535;
    float _5145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5147 = _5129 + _5145;
    float _5149 = fma(_5133, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5135);
    float _5151 = fma(_5139, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5141);
    float _5153 = _5143 + (-1.0);
    float _5155 = _5137 * (-2.0);
    float _5157 = fma(_5147, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5149);
    float _5159 = _1220 + (-0.5);
    float _5161 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5163 = fma(_5155, _5061, _5061);
    float _5165 = fma(_3521, _5125, _3521);
    bool _5167 = _5157 >= 0.0;
    float _5169 = fma(_5161, _5155, _5161);
    float _5171 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5163);
    float _5173 = fma(_5165, _4565, _5151);
    int _5175 = abs(_5093);
    float _5177 = sqrt(_4347);
    float _5179 = fma(_5169, _4565, _5171);
    float _5181 = _5173 * 0.15915493667125701904296875;
    float _5183 = _1525 + _1535;
    float _5185 = _5179 * 0.15915493667125701904296875;
    float _5187 = float(_3393);
    float _5189 = _5155;
    float _5191 = _5137;
    if (_5167)
    {
        _5189 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5193 = _5189;
    float _5195 = _5181 * 6.283185482025146484375;
    float _5197 = sin(_5195);
    float _5199 = float(_5175);
    int _5201 = as_type<int>(_5193);
    if (_5167)
    {
        out.m_53.x = 0.0;
    }
    if (_5167)
    {
        float _5203 = _5193 * 5.0;
        _5201 = as_type<int>(_5203);
    }
    int _5205 = _5201;
    float _5207 = _5199 * _5187;
    float _5209 = _5183 + (-1.0);
    float _5211 = _5181 * 6.283185482025146484375;
    float _5213 = cos(_5211);
    if (_5167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14410 = as_type<float>(_5205);
        out.gl_Position.z = _14410;
    }
    float _5215 = _5207 * (-2.0);
    float _5217 = _5185 * 6.283185482025146484375;
    float _5219 = sin(_5217);
    if (_5167)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5221 = -_3135;
    float _5223 = _5221 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5225 = -_2923;
    float _5227 = _5225 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5229 = fma(_5215, _5063, _5063);
    float _5231 = -_3337;
    float _5233 = _5231 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5235 = _5223 * _5223;
    float _5237 = fma(_5209, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5239 = _1535 + (-0.5);
    float _5241 = _5185 * 6.283185482025146484375;
    float _5243 = cos(_5241);
    float _5245 = fma(_5227, _5227, _5235);
    float _5247 = fma(_5237, _5215, _5237);
    float _5249 = fma(_5239, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5229);
    float _5251 = _3617 * _5177;
    float _5253 = fma(_5233, _5233, _5245);
    float _5255 = _5197 * _5219;
    float _5257 = fma(_5247, _4565, _5249);
    float _5259 = rsqrt(_5253);
    float _5261 = _5257 * 0.15915493667125701904296875;
    float _5263 = in.m_91.x;
    float _5265 = in.m_91.y;
    float _5267 = in.m_91.z;
    float _5269 = _5213 * _5243;
    float _5271 = _5197 * _5243;
    float _5273 = _5261 * 6.283185482025146484375;
    float _5275 = sin(_5273);
    float _5277 = _5227 * _5259;
    float _5279 = _5233 * _5259;
    float _5281 = _5223 * _5259;
    float _5283 = _5261 * 6.283185482025146484375;
    float _5285 = cos(_5283);
    float _5287 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5289 = _5277 * _5287;
    float _5291 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5293 = _5279 * _5291;
    float _5295 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5297 = _5281 * _5295;
    float _5299 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5301 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5303 = -_5289;
    float _5305 = fma(_5279, _5301, _5303);
    float _5307 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5309 = -_5293;
    float _5311 = fma(_5281, _5307, _5309);
    float _5313 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5315 = -_5297;
    float _5317 = fma(_5277, _5313, _5315);
    float _5319 = fma(_5275, _5269, _5255);
    float _5321 = _5305 * _5305;
    float _5323 = fma(_5275, _5255, _5269);
    float _5325 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5327 = fma(_5311, _5311, _5321);
    float _5329 = _5213 * _5219;
    float _5331 = _5251 * _5325;
    float _5333 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5335 = fma(_5317, _5317, _5327);
    float _5337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5265);
    float _5339 = _5213 * _5285;
    float _5341 = _5243 * _5285;
    float _5343 = rsqrt(_5335);
    float _5345 = _5337 * _5331;
    float _5347 = _5251 * _5299;
    float _5349 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5263);
    float _5351 = _5197 * _5285;
    float _5353 = _5219 * _5285;
    float _5355 = _5251 * _5333;
    float _5357 = _5349 * _5347;
    float _5359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5267);
    float _5361 = _5339 * _5345;
    float _5363 = -_5329;
    float _5365 = fma(_5275, _5271, _5363);
    float _5367 = -_5271;
    float _5369 = fma(_5275, _5329, _5367);
    float _5371 = _5359 * _5355;
    float _5373 = fma(_5319, _5357, _5361);
    float _5375 = _5351 * _5345;
    float _5377 = _5311 * _5343;
    float _5379 = _5305 * _5343;
    float _5381 = _5317 * _5343;
    float _5383 = -_5345;
    float _5385 = _5275 * _5383;
    float _5387 = _5281 * _5377;
    float _5389 = _5279 * _5379;
    float _5391 = fma(_5369, _5371, _5373);
    float _5393 = fma(_5341, _5357, _5385);
    float _5395 = -_5387;
    float _5397 = fma(_5277, _5379, _5395);
    float _5399 = -_5389;
    float _5401 = fma(_5281, _5381, _5399);
    float _5403 = fma(_5365, _5357, _5375);
    float _5405 = fma(_5353, _5371, _5393);
    float _5407 = _5397 * _5391;
    float _5409 = _5401 * _5391;
    float _5411 = fma(_5323, _5371, _5403);
    float _5413 = fma(_5381, _5405, _5407);
    float _5415 = fma(_5377, _5405, _5409);
    float _5417 = fma(_5279, _5411, _5413);
    float _5419 = fma(_5277, _5411, _5415);
    float _5421 = _3337 + _5417;
    float _5423 = _2923 + _5419;
    float _5425 = _5277 * _5381;
    float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5429 = _5421 + _5427;
    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5433 = _5423 + _5431;
    float _5435 = -_5425;
    float _5437 = fma(_5279, _5377, _5435);
    float _5439 = _5429 * _5429;
    float _5441 = _5433 * _5433;
    float _5443 = _5437 * _5391;
    float _5445 = _5441 + _5439;
    float _5447 = fma(_5379, _5405, _5443);
    float _5449 = sqrt(_5445);
    float _5451 = fma(_5281, _5411, _5447);
    float _5453 = _3135 + _5451;
    bool _5455 = _5449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5457 = _5423;
    float _5459 = _5421;
    float _5461 = _5441;
    float _5463 = _5439;
    if (!_5455)
    {
        _5099 = _5453;
    }
    float _5465 = _5099;
    bool _5467 = !_5455;
    float _5469 = _5465;
    if (!_5467)
    {
        float _5471 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5475 = _5449 + _5473;
        float _5477 = rsqrt(_5445);
        float _5479 = _5475 * _5471;
        float _5481 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5483 = _5479 * 0.15915493667125701904296875;
        float _5485 = _5483 * 6.283185482025146484375;
        float _5487 = sin(_5485);
        float _5489 = _5483 * 6.283185482025146484375;
        float _5491 = cos(_5489);
        float _5493 = fma(_5487, _5481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5495 = _5477 * _5493;
        float _5497 = _5491 + (-1.0);
        float _5499 = fma(_5433, _5495, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5501 = fma(_5429, _5495, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5503 = _5497 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5507 = _5499 + _5505;
        float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5511 = _5501 + _5509;
        float _5513 = fma(_5453, _5491, _5503);
        float _5515 = _5507 * _5507;
        float _5517 = _5511 * _5511;
        _5457 = _5499;
        _5459 = _5501;
        _5469 = _5513;
        _5461 = _5515;
        _5463 = _5517;
    }
    float _5519 = _5457;
    float _5521 = _5459;
    float _5523 = _5469;
    float _5525 = _5461;
    float _5527 = _5463;
    float _5529 = fma(_5519, 6.2500002968590706586837768554688e-05, 0.5);
    float _5531 = fma(_5521, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14903 = float2(_5529, _5531);
    float3 _5535 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14903, float2(0.0), isnan(_14903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14903, float2(0.0), isnan(_14903)), level(0.0)).xyz;
    float _5537 = _5535.x;
    float _5539 = _5535.y;
    float _5541 = _5535.z;
    float _5543 = in.m_93.x;
    float _5545 = in.m_93.y;
    float _5547 = in.m_93.z;
    bool _5549 = _5265 != 0.0;
    bool _5551 = isnan(_5265);
    bool _5553 = _5549 || _5551;
    bool _5555 = isnan(0.0);
    bool _5557 = _5553 || _5555;
    float _5559 = in.m_95.x;
    float _5561 = in.m_95.y;
    float _5563 = in.m_95.z;
    float _5565 = in.m_95.w;
    bool _5567 = _5263 == 0.0;
    bool _5569 = !_5557;
    bool _5571 = _5567 && _5569;
    bool _5573 = _5267 == 0.0;
    bool _5575 = _5573 && _5571;
    float _5577 = _5543;
    if (_5575)
    {
        _5191 = _5543;
    }
    float _5579 = _5191;
    float _5581 = _5579;
    if (_5575)
    {
        _3005 = _5547;
    }
    float _5583 = _3005;
    float _5585 = _5583;
    if (_5575)
    {
        _5101 = _5545;
    }
    float _5587 = _5101;
    float _5589 = _5587;
    if (_5575)
    {
        _5103 = _5579;
    }
    float _5591 = _5103;
    float _5593 = _5591;
    if (!_5575)
    {
        _5581 = _5543;
    }
    float _5595 = _5581;
    if (_5575)
    {
        _5105 = _5583;
    }
    float _5597 = _5105;
    float _5599 = _5597;
    if (!_5575)
    {
        _5585 = _5547;
    }
    float _5601 = _5585;
    if (!_5575)
    {
        float _5603 = fma(_5263, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5595);
        _5593 = _5603;
    }
    float _5605 = _5593;
    if (_5575)
    {
        _5577 = _5587;
    }
    float _5607 = _5577;
    float _5609 = _5563 * _5595;
    float _5611 = _5607;
    if (!_5575)
    {
        _5589 = _5545;
    }
    float _5613 = _5589;
    float _5615 = _5561 * _5601;
    if (!_5575)
    {
        float _5617 = fma(_5267, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5601);
        _5599 = _5617;
    }
    float _5619 = _5599;
    float _5621 = -_5609;
    float _5623 = fma(_5559, _5601, _5621);
    float _5625 = _5339 * _5437;
    float _5627 = _5559 * _5613;
    float _5629 = -_5615;
    float _5631 = fma(_5563, _5613, _5629);
    if (!_5575)
    {
        float _5633 = fma(_5265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5613);
        _5611 = _5633;
    }
    float _5635 = _5611;
    float _5637 = _5319 * _5401;
    float _5639 = -_5627;
    float _5641 = fma(_5561, _5595, _5639);
    float _5643 = _5319 * _5437;
    float _5645 = _5319 * _5397;
    float _5647 = _5339 * _5401;
    float _5649 = _5623 * _5565;
    float _5651 = _5631 * _5565;
    float _5653 = _5339 * _5397;
    float _5655 = _5641 * _5565;
    float _5657 = _5369 * _5401;
    float _5659 = _5369 * _5437;
    float _5661 = _5369 * _5397;
    float _5663 = fma(_5341, _5377, _5637);
    float _5665 = fma(_5341, _5379, _5643);
    float _5667 = -_5275;
    float _5669 = fma(_5667, _5379, _5625);
    float _5671 = fma(_5341, _5381, _5645);
    float _5673 = -_5275;
    float _5675 = fma(_5673, _5377, _5647);
    float _5677 = -_5275;
    float _5679 = fma(_5677, _5381, _5653);
    float _5681 = fma(_5353, _5377, _5657);
    float _5683 = fma(_5353, _5379, _5659);
    float _5685 = fma(_5353, _5381, _5661);
    float _5687 = fma(_5351, _5281, _5669);
    float _5689 = fma(_5365, _5277, _5663);
    float _5691 = fma(_5351, _5277, _5675);
    float _5693 = fma(_5351, _5279, _5679);
    float _5695 = fma(_5323, _5277, _5681);
    float _5697 = fma(_5323, _5281, _5683);
    float _5699 = fma(_5323, _5279, _5685);
    float _5701 = fma(_5365, _5281, _5665);
    float _5703 = _5687 * _5561;
    float _5705 = _5687 * _5635;
    float _5707 = fma(_5365, _5279, _5671);
    float _5709 = _5691 * _5635;
    float _5711 = _5649 * _5691;
    float _5713 = _5649 * _5687;
    float _5715 = _5693 * _5561;
    float _5717 = _5693 * _5635;
    float _5719 = _5649 * _5693;
    float _5721 = fma(_5701, _5559, _5703);
    float _5723 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5725 = _5523 + _5723;
    float _5727 = _5691 * _5561;
    float _5729 = fma(_5689, _5605, _5709);
    float _5731 = fma(_5707, _5559, _5715);
    float _5733 = fma(_5725, _5725, _5525);
    float _5735 = fma(_5689, _5559, _5727);
    float _5737 = fma(_5651, _5689, _5711);
    float _5739 = fma(_5701, _5605, _5705);
    float _5741 = _5733 + _5527;
    float _5743 = fma(_5707, _5605, _5717);
    float _5745 = fma(_5651, _5701, _5713);
    float _5747 = fma(_5651, _5707, _5719);
    float _5749 = fma(_5695, _5563, _5735);
    float _5751 = fma(_5697, _5563, _5721);
    float _5753 = sqrt(_5741);
    float _5755 = fma(_5699, _5563, _5731);
    float _5757 = fma(_5695, _5619, _5729);
    float _5759 = fma(_5655, _5695, _5737);
    float _5761 = fma(_5655, _5697, _5745);
    float _5763 = fma(_5655, _5699, _5747);
    float _5765 = fma(_5697, _5619, _5739);
    float _5767 = fma(_5699, _5619, _5743);
    out.m_97.x = _5749;
    out.m_97.y = _5751;
    out.m_97.z = _5755;
    out.m_99.x = _5759;
    out.m_99.y = _5761;
    out.m_99.z = _5763;
    out.m_101.x = _5757;
    out.m_101.y = _5765;
    out.m_101.z = _5767;
    bool _5769 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5771 = isnan(_5753);
    bool _5773 = _5769 || _5771;
    bool _5775 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5777 = _5773 || _5775;
    float _5779 = _5655;
    if (!_5777)
    {
        _5779 = 1.0;
    }
    float _5781 = _5779;
    out.m_103.x = _5537;
    out.m_103.y = _5539;
    out.m_103.z = _5541;
    bool _5783 = !_5777;
    float _5785 = _5781;
    if (!_5783)
    {
        bool _5787 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5789 = isnan(_5753);
        bool _5791 = _5787 || _5789;
        bool _5793 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5795 = _5791 || _5793;
        if (!_5795)
        {
            float _5797 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5799 = _5753 + _5797;
            float _5801 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5803 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5801;
            float _5805 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5807 = _5805 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5809 = 1.0 / _5803;
            float _5811 = _5799 * _5809;
            float _5813 = fma(_5811, _5807, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5785 = _5813;
            _5815 = true;
        }
        else
        {
            bool _5817 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5819 = isnan(_5753);
            bool _5821 = _5817 || _5819;
            bool _5823 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5825 = _5821 || _5823;
            if (!_5825)
            {
                float _5827 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5829 = _5753 + _5827;
                float _5831 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5833 = _5831 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5835 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5837 = _5835 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5839 = 1.0 / _5833;
                float _5841 = _5829 * _5839;
                float _5843 = fma(_5841, _5837, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5785 = _5843;
                _5815 = true;
            }
            else
            {
                _5785 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5815 = false;
    float _5845 = _5785;
    float _5847 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5849 = _5523 + _5847;
    float _5851 = _5109 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5853 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5855 = _5519 + _5853;
    float _5857 = fma(_5849, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5859 = fma(_5117, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5851);
    float _5861 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5863 = _5521 + _5861;
    float _5865 = fma(_5855, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5867 = -_3135;
    float _5869 = _5867 + _5857;
    float _5871 = fma(_5129, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5859);
    float _5873 = fma(_5863, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5875 = -_2923;
    float _5877 = _5875 + _5865;
    float _5879 = _5869 * _5869;
    float _5881 = _5871 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5883 = _5109 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5885 = -_3337;
    float _5887 = _5885 + _5873;
    float _5889 = fma(_5877, _5877, _5879);
    float _5891 = 1.0 / _5881;
    float _5893 = fma(_5117, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5883);
    float _5895 = fma(_5887, _5887, _5889);
    float _5897 = fma(_5129, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5893);
    float _5899 = sqrt(_5895);
    float _5901 = _5897 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5903 = _5901 + _5881;
    float _5905 = _5903 * _5891;
    float _5907 = _5905 * 0.5;
    bool _5909 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5913 = _5909 || _5911;
    bool _5915 = isnan(0.5);
    bool _5917 = _5913 || _5915;
    float _5919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5921 = fma(_5907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5919);
    bool _5923 = _5899 > 0.0;
    float _5925 = 1.0 / _5921;
    bool _5927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5931 = _5927 || _5929;
    bool _5933 = isnan(0.5);
    bool _5935 = _5931 || _5933;
    float _5937 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5939 = _5907;
    float _5941 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5943 = _5895;
    float _5945 = _5873;
    float _5947 = _5865;
    if (!_5923)
    {
        _5937 = _5865;
    }
    float _5949 = _5937;
    float _5951 = _5949;
    if (!_5923)
    {
        _5939 = _5857;
    }
    float _5953 = _5939;
    float _5955 = _5953;
    float _5957 = _5953;
    if (!_5923)
    {
        _5941 = _5873;
    }
    float _5959 = _5941;
    bool _5961 = !_5923;
    float _5963 = _5959;
    if (!_5961)
    {
        float _5965 = _230 * _230;
        float _5967 = rsqrt(_5895);
        float _5969 = fma(_226, _226, _5965);
        float _5971 = fma(_232, _232, _5969);
        float _5973 = sqrt(_5971);
        float _5975 = _5877 * _5967;
        float _5977 = _5869 * _5967;
        float _5979 = _5887 * _5967;
        bool _5981 = _5973 > 0.0;
        float _5983 = _5973;
        float _5985 = _5967;
        if (!_5981)
        {
            _5983 = _5865;
        }
        float _5987 = _5983;
        _5951 = _5987;
        if (!_5981)
        {
            _5955 = _5857;
        }
        float _5989 = _5955;
        _5957 = _5989;
        if (!_5981)
        {
            _5985 = _5873;
        }
        float _5991 = _5985;
        bool _5993 = !_5981;
        _5963 = _5991;
        if (!_5993)
        {
            float _5995 = rsqrt(_5971);
            float _5997 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5999 = _230 * _5995;
            float _6001 = _226 * _5995;
            float _6003 = _232 * _5995;
            float _6005 = _5977 * _5999;
            float _6007 = fma(_5975, _6001, _6005);
            float _6009 = _5997 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6011 = fma(_5979, _6003, _6007);
            float _6013 = _6011 * _6009;
            float _6015 = fma(_226, _6013, _5865);
            float _6017 = fma(_230, _6013, _5857);
            float _6019 = fma(_232, _6013, _5873);
            _5957 = _6017;
            _5963 = _6019;
            _5951 = _6015;
            _5943 = _5997;
        }
    }
    float _6021 = _5957;
    float _6023 = _5963;
    float _6025 = _5951;
    float _6027 = _5943;
    float _6029 = -_3655;
    float _6031 = fma(_6029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6021);
    float _6033 = -_4285;
    float _6035 = fma(_6033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6023);
    float _6037 = -_3651;
    float _6039 = fma(_6037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6025);
    float _6041 = _6027;
    float _6043 = _6039;
    float _6045 = _6035;
    if (_5917)
    {
        _6041 = 1.0;
    }
    float _6047 = _6041;
    float _6049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6051 = _5925 * _6049;
    float _6053 = _6047;
    if (_5935)
    {
        _4561 = _6031;
    }
    float _6055 = _4561;
    float _6057 = _6055;
    if (!_5935)
    {
        float _6059 = _5123 * _5123;
        float _6061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6063 = -_3337;
        float _6065 = _6063 + _6023;
        float _6067 = -_3135;
        float _6069 = _6067 + _6021;
        float _6071 = fma(_5133, _5133, _6059);
        float _6073 = fma(_5147, _5147, _6071);
        float _6075 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6077 = sqrt(_6073);
        float _6079 = 1.0 / _5251;
        float _6081 = _6075 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6083 = precise::min(_6077, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6085 = _6083 * _6061;
        float _6087 = _6085 * _6079;
        float _6089 = -_2923;
        float _6091 = _6089 + _6025;
        float _6093 = _6081 * _6087;
        float _6095 = _6065 * _6087;
        float _6097 = fma(_6069, _6093, _5109);
        float _6099 = fma(_6091, _6093, _5117);
        float _6101 = fma(_6081, _6095, _5129);
        _6057 = _6097;
        _6043 = _6099;
        _6045 = _6101;
        _236 = _6061;
    }
    float _6103 = _6057;
    float _6105 = _6043;
    float _6107 = _6045;
    float _6109 = _236;
    float _6111 = _6109;
    if (!_5917)
    {
        float _6113 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6115 = _6113 * 0.15915493667125701904296875;
        float _6117 = _6115 * 6.283185482025146484375;
        float _6119 = cos(_6117);
        float _6121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6123 = _6121 * 0.15915493667125701904296875;
        float _6125 = _6115 * 6.283185482025146484375;
        float _6127 = sin(_6125);
        float _6129 = 1.0 / _6119;
        float _6131 = _6123 * 6.283185482025146484375;
        float _6133 = cos(_6131);
        float _6135 = _6127 * _6129;
        float _6137 = _6123 * 6.283185482025146484375;
        float _6139 = sin(_6137);
        float _6141 = _6133 * _6135;
        float _6143 = 1.0 / _6141;
        float _6145 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6147 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6145;
        float _6149 = 1.0 / _6147;
        float _6151 = _6139 * _6143;
        float _6153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6155 = fma(_6051, _6151, _6153);
        float _6157 = _6155 * _6149;
        float _6159 = precise::clamp(_6157, 0.0, 1.0);
        _6053 = _6159;
    }
    float _6161 = _6053;
    float _6163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6165 = _6103 + _6163;
    float _6167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6169 = _6105 + _6167;
    float _6171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6173 = _6107 + _6171;
    float _6175 = _6165 * _6165;
    float _6177 = fma(_6169, _6169, _6175);
    float _6179 = fma(_6173, _6173, _6177);
    float _6181 = rsqrt(_6179);
    float _6183 = sqrt(_6179);
    float _6185 = _6181 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6187 = _6169 * _6185;
    float _6189 = _6173 * _6185;
    float _6191 = _6187 * _6187;
    float _6193 = _6189 * _6189;
    float _6195 = _6191 + _6193;
    float _6197 = sqrt(_6195);
    bool _6199 = _6197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6203 = _6197 + _6201;
    float _6205 = _6181;
    float _6207 = _6195;
    float _6209 = _6203;
    float _6211 = _6165;
    if (_6199)
    {
        float _6213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6205 = _6213;
    }
    float _6215 = _6205;
    if (_6199)
    {
        float _6217 = rsqrt(_6195);
        _6207 = _6217;
    }
    float _6219 = _6207;
    float _6221 = _6219;
    if (_6199)
    {
        float _6223 = _6203 * _6215;
        _6209 = _6223;
    }
    float _6225 = _6209;
    if (_6199)
    {
        float _6227 = _6225 * 0.15915493667125701904296875;
        _5945 = _6227;
    }
    float _6229 = _5945;
    float _6231 = _6173;
    if (_6199)
    {
        float _6233 = _6229 * 6.283185482025146484375;
        float _6235 = sin(_6233);
        _6231 = _6235;
    }
    float _6237 = _6231;
    float _6239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6241 = precise::max(0.0, _6239);
    float _6243 = _6215;
    if (_6199)
    {
        float _6245 = _6229 * 6.283185482025146484375;
        float _6247 = cos(_6245);
        _6243 = _6247;
    }
    float _6249 = _6243;
    float _6251 = -_6185;
    float _6253 = -_6241;
    float _6255 = fma(_6165, _6251, _6253);
    float _6257 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6199)
    {
        float _6259 = _6255 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6211 = _6259;
    }
    float _6261 = _6211;
    float _6263 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6265 = fma(_5117, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6267 = _6261;
    float _6269 = _6237;
    if (_6199)
    {
        float _6271 = fma(_6237, _6261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6267 = _6271;
    }
    float _6273 = _6267;
    float _6275 = _6273;
    if (!_6199)
    {
        _6269 = _6187;
    }
    float _6277 = _6269;
    float _6279 = _6277;
    float _6281 = _6249;
    if (_6199)
    {
        float _6283 = _6249 + (-1.0);
        _6257 = _6283;
    }
    float _6285 = _6257;
    float _6287 = _6285;
    if (_6199)
    {
        float _6289 = _6219 * _6273;
        _5947 = _6289;
    }
    float _6291 = _5947;
    if (!_6199)
    {
        _6275 = _6255;
    }
    float _6293 = _6275;
    float _6295 = _6293;
    if (_6199)
    {
        float _6297 = _6285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6111 = _6297;
    }
    float _6299 = _6111;
    if (_6199)
    {
        float _6301 = _6187 * _6291;
        _6279 = _6301;
    }
    float _6303 = _6279;
    if (!_6199)
    {
        _6287 = _6189;
    }
    float _6305 = _6287;
    float _6307 = _6305;
    if (_6199)
    {
        float _6309 = _6189 * _6291;
        _6307 = _6309;
    }
    float _6311 = _6307;
    if (!_6199)
    {
        _6221 = _6191;
    }
    float _6313 = _6221;
    float _6315 = _6313;
    if (_6199)
    {
        float _6317 = fma(_6255, _6249, _6299);
        _6295 = _6317;
    }
    float _6319 = _6295;
    if (_6199)
    {
        float _6321 = _6303 * _6303;
        _6315 = _6321;
    }
    float _6323 = _6315;
    if (!_6199)
    {
        _6281 = _6193;
    }
    float _6325 = _6281;
    float _6327 = _6325;
    if (_6199)
    {
        float _6329 = _6311 * _6311;
        _6327 = _6329;
    }
    float _6331 = _6327;
    float _6333 = fma(_6319, _6319, _6323);
    float _6335 = floor(_6265);
    float _6337 = _6333 + _6331;
    float _6339 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6263);
    float _6341 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6343 = fma(_6183, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6341);
    float _6345 = precise::clamp(_6343, 0.0, 1.0);
    float _6347 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6339);
    float _6349 = rsqrt(_6337);
    float _6351 = -_6345;
    float _6353 = _6351 + 1.0;
    float _6355 = _6347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6359 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6361 = _6355 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6363 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6365 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6367 = abs(_6353);
    float _6369 = log2(_6367);
    float _6371 = -_6361;
    float _6373 = fma(_6371, _6357, 1.0);
    float _6375 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6377 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6359);
    float _6379 = -_6335;
    float _6381 = _6265 + _6379;
    float _6383 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6375);
    float _6385 = _6349 * _6303;
    float _6387 = floor(_6363);
    float _6389 = _6349 * _6319;
    float _6391 = _6349 * _6311;
    float _6393 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6365);
    float _6395 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6383);
    float _6397 = _6385 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6399 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6377);
    float _6401 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6393);
    float _6403 = _6395 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6405 = -_6397;
    float _6407 = fma(_6389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6405);
    float _6409 = _6369 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6411 = _6401 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6413 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6415 = -_6391;
    float _6417 = fma(_6415, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6407);
    float _6419 = _6399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6421 = exp2(_6409);
    float _6423 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6413);
    float _6425 = fma(_6417, -0.5, 0.5);
    float _6427 = fma(_6417, 0.5, 0.5);
    float _6429 = -_6387;
    float _6431 = _6363 + _6429;
    float _6433 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6423);
    float _6435 = fma(_6427, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6437 = log2(_6373);
    float _6439 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6433);
    float _6441 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6443 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6445 = fma(_6427, _6435, -0.212114393711090087890625);
    float _6447 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6441);
    float _6449 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6443);
    float _6451 = sqrt(_6425);
    float _6453 = fma(_6427, _6445, 1.570728778839111328125);
    float _6455 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6447);
    float _6457 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6449);
    float _6459 = 1.0 / _6439;
    float _6461 = _6389 + 1.0;
    float _6463 = _6437 * 0.693147182464599609375;
    float _6465 = -_6389;
    float _6467 = fma(_6421, _6461, _6465);
    float _6469 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6455);
    float _6471 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6457);
    float _6473 = _6451 * 0.636619746685028076171875;
    float _6475 = fma(_6467, 0.5, 0.5);
    float _6477 = -_6453;
    float _6479 = fma(_6473, _6477, 1.0);
    float _6481 = _6463 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16479 = float2(_6381, _6431);
    float _6483 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16479, float2(0.0), isnan(_16479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16479, float2(0.0), isnan(_16479)), level(0.0)).x;
    float _6485 = _6469 * _6459;
    float _6487 = _6471 * _6459;
    float _6489 = fma(_6485, 0.5, 0.5);
    float _6491 = fma(_6487, -0.5, 0.5);
    float3 _16498 = float3(_6489, _6491, _6481);
    float _6493 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16498, float3(0.0), isnan(_16498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16498, float3(0.0), isnan(_16498)), level(0.0)).x;
    float3 _16509 = float3(_6489, _6491, _6481);
    float4 _6496 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16509, float3(0.0), isnan(_16509)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16509, float3(0.0), isnan(_16509)), level(0.0)).xyzw;
    float _6498 = _6496.x;
    float _6500 = _6496.y;
    float _6502 = _6496.z;
    float _6504 = _6496.w;
    float2 _16525 = float2(_6479, _6475);
    float3 _6506 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16525, float2(0.0), isnan(_16525)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16525, float2(0.0), isnan(_16525)), level(0.0)).xyz;
    float _6508 = _6506.x;
    float _6510 = _6506.y;
    float _6512 = _6506.z;
    float _6514 = abs(_6051);
    float _6516 = log2(_6514);
    float _6518 = _6369 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6520 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6522 = isnan(_6183);
    bool _6524 = _6520 || _6522;
    bool _6526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6528 = _6524 || _6526;
    float _6530 = exp2(_6518);
    float _6532 = _6516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6534 = exp2(_6532);
    float _6536 = in.m_105.x;
    float _6538 = -_6530;
    float _6540 = _6538 + 1.0;
    float _6542 = _6540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6544 = fma(_6534, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6546 = precise::clamp(_6544, 0.0, 1.0);
    float _6548 = fma(_6546, -2.0, 3.0);
    float _6550 = _6546 * _6546;
    float _6552 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6554 = _6550 * _6548;
    float _6556 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6552);
    float _6558 = -_6554;
    float _6560 = _6558 + 1.0;
    float _6562 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6556);
    float _6564 = fma(_6560, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6554);
    bool _6566 = _6051 <= 8000.0;
    bool _6568 = isnan(_6051);
    bool _6570 = _6566 || _6568;
    bool _6572 = isnan(8000.0);
    bool _6574 = _6570 || _6572;
    float _6576 = float(_6574);
    float _6578 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6562);
    float _6580 = _6439 * 0.5;
    float _6582 = _6469 + _6439;
    float _6584 = _6576 * _6564;
    float _6586 = fma(_6471, -0.5, _6580);
    out.gl_Position.x = _6469;
    out.gl_Position.y = _6471;
    out.gl_Position.z = _6578;
    out.gl_Position.w = _6439;
    float _6588 = _6578 + _6439;
    float _6590 = _6584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6592 = _6582 * 0.5;
    float _6594 = _6588 * 0.5;
    out.m_107.x = _6592;
    out.m_107.y = _6586;
    out.m_107.z = _6594;
    out.m_107.w = _6439;
    float _6596 = -_6542;
    float _6598 = _6596 + 1.0;
    float _6600 = _6439;
    float _6602 = _6578;
    float _6604 = _6471;
    float _6606 = _6586;
    float _6608 = _6592;
    float _6610 = _6598;
    if (!_6528)
    {
        _6600 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6612 = _6600;
    float _6614 = _6612;
    float _6616 = _6612;
    if (!_6528)
    {
        _6602 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6618 = _6602;
    float _6620 = _6618;
    float _6622 = _6618;
    if (!_6528)
    {
        _6604 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6624 = _6604;
    float _6626 = _6161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6628 = _6624;
    float _6630 = _6624;
    if (!_6528)
    {
        _6606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6632 = _6606;
    float _6634 = _6632;
    float _6636 = _6632;
    if (!_6528)
    {
        _6608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6638 = _6608;
    float _6640 = -_6483;
    float _6642 = _6640 + 1.0;
    float _6644 = _6642 * _6590;
    float _6646 = precise::clamp(_6644, 0.0, 1.0);
    float _6648 = -_6646;
    float _6650 = fma(_6648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6652 = _6542 * _6493;
    float _6654 = _6650 * _6536;
    float _6656 = _6504 * _6652;
    float _6658 = _6512 * _6652;
    float _6660 = _6654 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6662 = fma(_6508, _6656, _6498);
    float _6664 = fma(_6510, _6656, _6500);
    float _6666 = _6504 * _6598;
    float _6668 = fma(_6504, _6658, _6502);
    out.m_109.x = _6660;
    float _6670 = _6638;
    float _6672 = _6638;
    if (!_6528)
    {
        _6610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6674 = _6610;
    out.m_111.x = _6662;
    out.m_111.y = _6664;
    out.m_111.z = _6668;
    out.m_111.w = _6666;
    bool _6676 = !_6528;
    float _6678 = _6674;
    float _6680 = _6674;
    if (!_6676)
    {
        bool _6682 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6684 = isnan(_6183);
        bool _6686 = _6682 || _6684;
        bool _6688 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6690 = _6686 || _6688;
        if (!_6690)
        {
            float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6694 = _6183 + _6692;
            float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6698 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6696;
            float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6708 = 1.0 / _6698;
            float _6710 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6712 = _6710 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6714 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6722 = _6694 * _6708;
            float _6724 = precise::clamp(_6722, 0.0, 1.0);
            float _6726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6728 = _6726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6730 = fma(_6724, _6702, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6732 = fma(_6724, _6706, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6734 = fma(_6724, _6728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6736 = fma(_6724, _6712, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6738 = fma(_6724, _6716, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6740 = fma(_6724, _6720, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6630 = _6730;
            _6672 = _6738;
            _6622 = _6732;
            _6636 = _6736;
            _6680 = _6734;
            _6616 = _6740;
            _6742 = true;
        }
        else
        {
            bool _6744 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6746 = isnan(_6183);
            bool _6748 = _6744 || _6746;
            bool _6750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6752 = _6748 || _6750;
            if (!_6752)
            {
                _6634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6754 = _6634;
            _6636 = _6754;
            if (!_6752)
            {
                _6670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6756 = _6670;
            _6672 = _6756;
            if (!_6752)
            {
                _6614 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6758 = _6614;
            _6616 = _6758;
            if (!_6752)
            {
                _6620 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6760 = _6620;
            _6622 = _6760;
            if (!_6752)
            {
                _6628 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6762 = _6628;
            _6630 = _6762;
            if (!_6752)
            {
                _6678 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6764 = _6678;
            bool _6766 = !_6752;
            _6680 = _6764;
            if (!_6766)
            {
                bool _6768 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6770 = isnan(_6183);
                bool _6772 = _6768 || _6770;
                bool _6774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6776 = _6772 || _6774;
                if (!_6776)
                {
                    float _6778 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6780 = _6183 + _6778;
                    float _6782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6784 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6782;
                    float _6786 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6788 = _6786 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6792 = _6790 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6794 = 1.0 / _6784;
                    float _6796 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6798 = _6796 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6800 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6802 = _6800 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6808 = _6780 * _6794;
                    float _6810 = precise::clamp(_6808, 0.0, 1.0);
                    float _6812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6814 = _6812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6816 = fma(_6810, _6788, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6818 = fma(_6810, _6792, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6820 = fma(_6810, _6814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6822 = fma(_6810, _6798, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6824 = fma(_6810, _6802, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6826 = fma(_6810, _6806, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6630 = _6816;
                    _6672 = _6824;
                    _6622 = _6818;
                    _6636 = _6822;
                    _6680 = _6820;
                    _6616 = _6826;
                    _6742 = true;
                }
                else
                {
                    _6630 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6622 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6680 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6616 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6742 = false;
    float _6828 = _6630;
    float _6830 = _6672;
    float _6832 = _6622;
    float _6834 = _6636;
    float _6836 = _6680;
    float _6838 = _6616;
    float _6840 = _6626 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6842 = fma(_5765, -0.5, 0.5);
    float _6844 = precise::clamp(_6842, 0.0, 1.0);
    float _6846 = -_6828;
    float _6848 = _6830 + _6846;
    float _6850 = -_6832;
    float _6852 = _6834 + _6850;
    out.m_53.x = _6840;
    float _6854 = fma(_6844, _6848, _6828);
    float _6856 = -_6836;
    float _6858 = _6838 + _6856;
    float _6860 = fma(_6844, _6852, _6832);
    float _6862 = _6854 * 0.586610972881317138671875;
    bool _6864 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6866 = fma(_6844, _6858, _6836);
    out.m_113.x = 0.0;
    float _6868 = fma(_6860, 0.298911988735198974609375, _6862);
    bool _6870 = _6161 > 0.0;
    bool _6872 = isnan(_6161);
    bool _6874 = _6870 || _6872;
    bool _6876 = isnan(0.0);
    bool _6878 = _6874 || _6876;
    float _6880 = fma(_6866, 0.114477999508380889892578125, _6868);
    float _6882 = -_6880;
    float _6884 = _6860 + _6882;
    float _6886 = -_6880;
    float _6888 = _6854 + _6886;
    float _6890 = -_6880;
    float _6892 = _6866 + _6890;
    float _6894 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    float _6896 = fma(_6888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    float _6898 = fma(_6892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    bool _6900 = !_6864;
    if (!_6900)
    {
        float _6902 = -_6103;
        float _6904 = _6902 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6906 = -_6105;
        float _6908 = _6906 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6910 = -_6107;
        float _6912 = _6910 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6914 = _6904 * _6904;
        float _6916 = fma(_6908, _6908, _6914);
        float _6918 = fma(_6912, _6912, _6916);
        float _6920 = sqrt(_6918);
        float _6922 = rsqrt(_6918);
        float _6924 = -_6920;
        float _6926 = _6924 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6928 = _6926 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6930 = precise::clamp(_6928, 0.0, 1.0);
        float _6932 = _6908 * _6922;
        float _6934 = _6904 * _6922;
        float _6936 = abs(_6930);
        float _6938 = log2(_6936);
        float _6940 = _6912 * _6922;
        float _6942 = _6932 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6944 = _5765 * _6934;
        float _6946 = -_6934;
        float _6948 = -_6942;
        float _6950 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6948);
        float _6952 = fma(_5757, _6932, _6944);
        float _6954 = -_6940;
        float _6956 = fma(_6954, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6950);
        float _6958 = fma(_5767, _6940, _6952);
        float _6960 = precise::clamp(_6958, 0.0, 1.0);
        float _6962 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6964 = _6956 + _6962;
        float _6966 = _6938 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6968 = _6964 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6970 = precise::clamp(_6968, 0.0, 1.0);
        float _6972 = exp2(_6966);
        float _6974 = _6972 * _6970;
        float _6976 = _6960 * _6974;
        float _6978 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6980 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6982 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6978;
        out.m_113.y = _6980;
        out.m_113.z = _6982;
    }
    out.m_115.x = _6894;
    out.m_115.y = _6896;
    out.m_115.z = _6898;
    if (_6878)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _6984 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6984;
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
    bool _6742 = false;
    bool _5815 = false;
    bool _1206 = false;
    bool _882 = false;
    bool _740 = false;
    bool _586 = false;
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
        float _7041 = as_type<float>(_150);
        out.gl_Position.z = _7041;
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
        float _7111 = as_type<float>(_188);
        out.gl_Position.z = _7111;
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
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _286 = 1.0 / _272;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _288;
    float _292 = 1.0 / _280;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _264 + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _284;
    float _302 = _296 * _286;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _264 + _304;
    float _308 = 1.0 / _276;
    float _310 = _306 * _292;
    bool _312 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_264);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_264);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = 1.0 / _290;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _344 = _264 + _342;
    float _346 = -_334;
    float _348 = _346 + 1.0;
    float _350 = _344 * _300;
    bool _352 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_264);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _268 * _308;
    bool _366 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_264);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = _264 + _378;
    float _382 = _362 * _338;
    bool _384 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_264);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -_362;
    float _398 = _396 + 1.0;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    bool _404 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_264);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = _380 * _340;
    float _418 = _322 * _402;
    float _420 = _394 * _348;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = -_394;
    float _428 = _426 + 1.0;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _434;
    float _438 = fma(_424, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = _414 * _428;
    float _442 = fma(_432, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = fma(_436, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = _334 * _398;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = _438 * _440;
    float _462 = -_414;
    float _464 = _462 + 1.0;
    float _466 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_450, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _470 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _472 = _442 * _440;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _480 = _444 * _440;
    float _482 = fma(_476, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _472);
    float _486 = fma(_466, _420, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _492;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _480);
    float _498 = fma(_468, _420, _484);
    float _500 = fma(_482, _446, _486);
    float _502 = fma(_490, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = fma(_494, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = fma(_470, _420, _496);
    float _520 = fma(_502, _446, _498);
    float _522 = fma(_506, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_512, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_516, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_508, _446, _518);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _538;
    float _542 = fma(_522, _382, _500);
    float _544 = fma(_532, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _546 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _548 = fma(_540, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _550 = fma(_524, _382, _520);
    float _552 = fma(_526, _382, _528);
    float _554 = fma(_544, _418, _542);
    float _556 = fma(_546, _418, _550);
    float _558 = fma(_548, _418, _552);
    float _560 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].x, _554);
    float _562 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].y, _556);
    float _564 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].z, _558);
    bool _566 = !_298;
    float _584;
    if (!_566)
    {
        float _568 = in.m_65.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_134);
        float _590 = 1.0 / _588;
        float _592 = _168 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _594 + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _604 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = isnan(_594);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _622 = isnan(_594);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    bool _636 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = isnan(_594);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _602;
    float _650 = -_614;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _594 + _654;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _630 * _652;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _618;
    float _668 = _634 * _648;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _598, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = -_646;
    float _678 = _676 + 1.0;
    float _680 = _672 * _666;
    float _682 = _674 * _660;
    float _684 = _614 * _678;
    float _686 = fma(_680, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _690 = fma(_686, _684, _688);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _696 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[117].x, _690);
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = in.m_67.x;
    float _702 = in.m_67.y;
    float _704 = in.m_67.z;
    float _706 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _706;
    out.m_69.y = _708;
    out.m_69.z = _710;
    out.m_69.w = _712;
    float _714 = _564 * _704;
    float _716 = _562 * _702;
    float _718 = _560 * _700;
    bool _720 = !_658;
    float _738;
    if (!_720)
    {
        float _722 = in.m_65.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        float _742 = float(_134);
        float _744 = 1.0 / _742;
        float _746 = _168 * _744;
        _738 = _746;
    }
    _740 = false;
    float _748 = _738;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _748 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _758 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _760 = isnan(_748);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _774 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _776 = isnan(_748);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _786;
    bool _790 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _792 = isnan(_748);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _756;
    float _804 = -_768;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _810 = _748 + _808;
    bool _812 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _814 = _784 * _806;
    float _816 = -_784;
    float _818 = _816 + 1.0;
    float _820 = 1.0 / _772;
    float _822 = _788 * _802;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _828 = fma(_822, _752, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _830 = -_800;
    float _832 = _830 + 1.0;
    float _834 = _826 * _820;
    float _836 = _828 * _814;
    float _838 = _768 * _832;
    float _840 = fma(_834, _810, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _842 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[131].x, _836);
    float _844 = fma(_840, _838, _842);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _852 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[133].x, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _854;
    out.m_71.y = _856;
    out.m_71.z = _858;
    out.m_71.w = _860;
    bool _862 = !_812;
    float _880;
    if (!_862)
    {
        float _864 = in.m_65.x;
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _868 = _864 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _872 = _870 * _866;
        float _874 = floor(_872);
        float _876 = -_874;
        float _878 = _872 + _876;
        _880 = _878;
        _882 = true;
    }
    else
    {
        float _884 = float(_134);
        float _886 = 1.0 / _884;
        float _888 = _168 * _886;
        _880 = _888;
    }
    _882 = false;
    float _890 = _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _894 = _890 + _892;
    bool _896 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _898 = isnan(_890);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _912;
    bool _916 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _918 = isnan(_890);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -_906;
    float _930 = _928 + 1.0;
    bool _932 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _934 = isnan(_890);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = 1.0 / _910;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _950 = _926 * _930;
    float _952 = -_942;
    float _954 = _952 + 1.0;
    float _956 = 1.0 / _948;
    bool _958 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _960 = _914 * _944;
    float _962 = -_926;
    float _964 = _962 + 1.0;
    bool _966 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = isnan(_890);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = fma(_960, _894, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _980 = _942 * _964;
    bool _982 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _984 = isnan(_890);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = _976 * _954;
    float _996 = -_976;
    float _998 = _996 + 1.0;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1004 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1006 = isnan(_890);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = _992 * _998;
    float _1018 = -_992;
    float _1020 = _1018 + 1.0;
    bool _1022 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1024 = isnan(_890);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = 1.0 / _1002;
    float _1036 = -_1014;
    float _1038 = _1036 + 1.0;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1044 = _1014 * _1020;
    float _1046 = _1032 * _1038;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1052 = -_1032;
    float _1054 = _1052 + 1.0;
    float _1056 = 1.0 / _1042;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1062 = _978 * _1046;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _890 + _1068;
    float _1072 = _1060 * _956;
    float _1074 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1062);
    float _1076 = 1.0 / _1050;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1078;
    float _1082 = fma(_1072, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1090 = _890 + _1088;
    float _1092 = _1080 * _1034;
    float _1094 = fma(_1082, _1044, _1074);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1098 = _890 + _1096;
    float _1100 = 1.0 / _1066;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = fma(_1092, _1090, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1108 = _1104 * _1056;
    bool _1110 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1112 = isnan(_890);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1122;
    float _1126 = 1.0 / _1086;
    float _1128 = fma(_1106, _1016, _1094);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1134 = _1124 * _1076;
    float _1136 = fma(_1108, _1098, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1140 = _890 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1144 = _890 + _1142;
    float _1146 = _1132 * _1100;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1148;
    float _1152 = fma(_1134, _1140, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1154 = fma(_1136, _994, _1128);
    float _1156 = fma(_1146, _1144, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1158 = -_1120;
    float _1160 = _1158 + 1.0;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1164 = _890 + _1162;
    float _1166 = fma(_1152, _980, _1154);
    float _1168 = _1150 * _1126;
    float _1170 = _906 * _1160;
    float _1172 = fma(_1156, _950, _1166);
    float _1174 = fma(_1168, _1164, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1176 = fma(_1174, _1170, _1172);
    float _1178 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1176);
    out.m_73.x = _1178;
    bool _1180 = !_958;
    float _1182 = _1094;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1186 = as_type<int>(_1126);
    float _1204;
    if (!_1180)
    {
        float _1188 = in.m_65.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_134);
        float _1210 = 1.0 / _1208;
        float _1212 = _168 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1218 = int(_1216);
    float _1220 = in.m_65.y;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1224 = _1222 != 0;
    float _1226 = in.m_75.x;
    float _1228 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1230 = int(_1228);
    float _1232 = 0.0;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1224)
    {
        _1232 = 1.0;
    }
    float _1236 = _1232;
    float _1238 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1240 = int(_1238);
    float _1242 = float(_1218);
    float _1244 = 0.0;
    float _1246 = _1236;
    if (_1224)
    {
        _1244 = 1.0;
    }
    float _1248 = _1244;
    float _1250 = 0.0;
    float _1252 = _1248;
    if (_1224)
    {
        _1250 = 1.0;
    }
    float _1254 = _1250;
    int _1256 = 0;
    float _1258 = _1254;
    if (_1224)
    {
        _1256 = 0;
    }
    int _1260 = _1256;
    int _1262 = _1260;
    if (_1224)
    {
        float _1264 = in.m_65.x;
        _1182 = _1264;
    }
    float _1266 = _1182;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1270 = int(_1268);
    float _1272 = float(_1230);
    float _1274 = _1266;
    if (_1224)
    {
        _1234 = 0;
    }
    int _1276 = _1234;
    float _1278 = _1170;
    int _1280 = _1276;
    if (_1224)
    {
        float _1282 = in.m_65.z;
        _1278 = _1282;
    }
    float _1284 = _1278;
    int _1286 = 0;
    if (_1224)
    {
        _1286 = as_type<int>(_1220);
    }
    int _1288 = _1286;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1292 = int(_1290);
    float _1294 = float(_1240);
    float _1296 = 1.0 / _1242;
    float _1298 = float(_1270);
    float _1300 = 1.0 / _1272;
    float _1302 = float(uint(_1292));
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1306 = int(_1304);
    float _1308 = _1296 * _168;
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1312 = int(_1310);
    float _1314 = _1300 * _168;
    float _1316 = 1.0 / _1294;
    float _1318 = float(uint(_1306));
    float _1320 = 1.0 / _1298;
    float _1322 = float(uint(_1312));
    float _1324 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1326 = int(_1324);
    float _1328 = _1316 * _168;
    float _1330 = 1.0 / _1302;
    float _1332 = _1320 * _168;
    float _1334 = trunc(_1308);
    int _1336 = int(_1334);
    float _1338 = float(uint(_1326));
    float _1340 = 1.0 / _1318;
    int _1342 = as_type<int>(_1330) + (-2);
    float _1344 = trunc(_1314);
    int _1346 = int(_1344);
    float _1348 = float(uint(_1336));
    float _1350 = as_type<float>(_1342) * _1348;
    float _1352 = 1.0 / _1322;
    int _1354 = as_type<int>(_1340) + (-2);
    float _1356 = trunc(_1328);
    int _1358 = int(_1356);
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1362 = _1360 != 0;
    float _1364 = 1.0 / _1338;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1372 = _1370 != 0;
    bool _1374 = _1220 > 0.5;
    int _1376 = as_type<int>(_1352) + (-2);
    float _1378 = trunc(_1332);
    int _1380 = int(_1378);
    float _1382 = float(uint(_1358));
    int _1384 = _1288;
    bool _1386 = _1368;
    bool _1388 = _1372;
    float _1390 = _1226;
    if (!_1362)
    {
        _1184 = _1226;
    }
    float _1392 = _1184;
    float _1394 = as_type<float>(_1376) * _1382;
    int _1396 = as_type<int>(_1394);
    float _1398 = _1392;
    if (_1368)
    {
        float _1400 = -_1226;
        float _1402 = _1400 + 1.0;
        _1186 = as_type<int>(_1402);
    }
    int _1404 = _1186;
    float _1406 = trunc(_1350);
    float _1408 = precise::max(_1406, 0.0);
    uint _1411 = uint(_1408);
    int _1413 = as_type<int>(_1364) + (-2);
    float _1415 = 0.0;
    if (!_1372)
    {
        _1415 = _1226;
    }
    float _1417 = _1415;
    float _1419 = 0.0;
    float _1421 = _1417;
    if (!_1368)
    {
        _1419 = _1226;
    }
    float _1423 = _1419;
    float _1425 = _1423;
    if (_1368)
    {
        float _1427 = _1374 ? as_type<float>(_1404) : _1226;
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = trunc(_1394);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    float _1437 = float(uint(_1346));
    float _1439 = float(uint(_1380));
    float _1441 = as_type<float>(_1354) * _1437;
    float _1443 = _1437;
    if (_1372)
    {
        float _1445 = -_1226;
        float _1447 = _1445 + 1.0;
        _1396 = as_type<int>(_1447);
    }
    int _1449 = _1396;
    float _1451 = as_type<float>(_1413) * _1439;
    float _1453 = trunc(_1441);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = _1449;
    float _1461 = _1451;
    if (_1372)
    {
        float _1463 = _1374 ? as_type<float>(_1449) : _1226;
        _1421 = _1463;
    }
    float _1465 = _1421;
    float _1467 = _1284;
    if (_1224)
    {
        _1459 = as_type<int>(_1284);
    }
    int _1469 = _1459;
    float _1471 = trunc(_1451);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    int _1477 = _1469;
    if (_1224)
    {
        _1461 = _1266;
    }
    float _1479 = _1461;
    float _1481 = _1479;
    if (_1224)
    {
        _1443 = _1479;
    }
    float _1483 = _1443;
    int _1485 = 0;
    float _1487 = _1483;
    if (_1224)
    {
        _1485 = as_type<int>(_1479);
    }
    int _1489 = _1485;
    int _1491 = _1489;
    if (!_1224)
    {
        float _1493 = in.m_65.x;
        float _1495 = _1220 * 3.1415927410125732421875;
        float _1497 = in.m_65.z;
        float _1499 = _1495 * 0.15915493667125701904296875;
        float _1501 = _1499 * 6.283185482025146484375;
        float _1503 = sin(_1501);
        float _1505 = _1493 * 3.1415927410125732421875;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = _1497 * 3.1415927410125732421875;
        float _1511 = _1509 * 0.15915493667125701904296875;
        float _1513 = _1507 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        float _1517 = _1511 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        _1481 = _1220;
        _1252 = 1.2345600128173828125;
        _1274 = _1493;
        _1246 = 7.345489978790283203125;
        _1487 = _1497;
        _1258 = 5.839270114898681640625;
        _1262 = 1;
        _1467 = _1497;
        _1280 = 2;
        _1477 = as_type<int>(_1519);
        _1384 = as_type<int>(_1503);
        _1491 = as_type<int>(_1515);
    }
    float _1521 = _1481;
    float _1523 = _1252;
    float _1525 = _1274;
    float _1527 = _1246;
    float _1529 = _1487;
    float _1531 = _1258;
    int _1533 = _1262;
    float _1535 = _1467;
    int _1537 = _1280;
    int _1539 = _1477;
    int _1541 = _1384;
    int _1543 = _1491;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1547 = _1545 != 0;
    int _1549 = 0;
    if (_1362)
    {
        float _1551 = in.m_65.x;
        _1549 = as_type<int>(_1551);
    }
    int _1553 = _1549;
    int _1555 = ~_1292;
    int _1557 = _1555 + 1;
    float _1559 = _1521 * _1523;
    int _1561 = ~_1312;
    int _1563 = _1561 + 1;
    float _1565 = _1525 * _1527;
    int _1567 = ~_1326;
    int _1569 = _1567 + 1;
    int _1571 = _1557 * int(_1411);
    int _1573 = _1571 + _1336;
    float _1575 = floor(_1559);
    float _1577 = _1529 * _1531;
    float _1579 = _1521 * _1527;
    int _1581 = _1569 * int(_1475);
    int _1583 = _1581 + _1380;
    float _1585 = float(uint(_1573));
    float _1587 = _950;
    if (_1547)
    {
        float _1589 = in.m_65.z;
        _1587 = _1589;
    }
    float _1591 = _1587;
    int _1593 = _1563 * int(_1435);
    int _1595 = _1593 + _1358;
    int _1597 = ~_1306;
    int _1599 = _1597 + 1;
    float _1601 = floor(_1565);
    float _1603 = as_type<float>(_1342) * _1585;
    float _1605 = float(uint(_1583));
    bool _1607 = _1533 != 1;
    float _1609 = float(uint(_1595));
    float _1611 = in.m_61.w;
    int _1613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1615 = _1613 != 0;
    float _1617 = as_type<float>(_1413) * _1605;
    float _1619 = trunc(_1603);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1553;
    float _1627 = _1603;
    if (_1362)
    {
        bool _1629 = as_type<float>(_1553) > 0.5;
        _1386 = _1629;
    }
    bool _1631 = _1386;
    if (_1547)
    {
        float _1633 = -_1226;
        float _1635 = _1633 + 1.0;
        _1625 = as_type<int>(_1635);
    }
    int _1637 = _1625;
    float _1639 = as_type<float>(_1376) * _1609;
    int _1641 = _1599 * int(_1457);
    int _1643 = _1641 + _1346;
    int _1645 = ~_1326;
    int _1647 = _1645 + 1;
    float _1649 = in.m_59.w;
    float _1651 = floor(_1577);
    int _1653 = _1643;
    float _1655 = _1639;
    if (!_1547)
    {
        _1627 = _1226;
    }
    float _1657 = _1627;
    float _1659 = -_1601;
    float _1661 = _1565 + _1659;
    float _1663 = float(uint(_1643));
    float _1665 = _1657;
    if (_1362)
    {
        float _1667 = -_1226;
        float _1669 = _1667 + 1.0;
        _1653 = as_type<int>(_1669);
    }
    int _1671 = _1653;
    if (_1547)
    {
        bool _1673 = _1591 > 0.5;
        _1388 = _1673;
    }
    bool _1675 = _1388;
    int _1677 = 0;
    if (_1615)
    {
        float _1679 = -_1226;
        float _1681 = _1679 + 1.0;
        _1677 = as_type<int>(_1681);
    }
    int _1683 = _1677;
    float _1685 = float(_1326);
    float _1687 = floor(_1579);
    if (_1547)
    {
        float _1689 = _1675 ? as_type<float>(_1637) : _1226;
        _1665 = _1689;
    }
    float _1691 = _1665;
    float _1693 = -_1575;
    float _1695 = _1559 + _1693;
    float _1697 = float(_134);
    float _1699 = as_type<float>(_1354) * _1663;
    if (_1362)
    {
        float _1701 = _1631 ? as_type<float>(_1671) : _1226;
        _1398 = _1701;
    }
    float _1703 = _1398;
    float _1705 = in.m_63.w;
    float _1707 = float(_1292);
    float _1709 = trunc(_1617);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    float _1715 = float(_1336);
    float _1717 = float(_1312);
    int _1719 = ~_1312;
    int _1721 = _1719 + 1;
    float _1723 = trunc(_1639);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = int(_1411) + int(_1623);
    float _1731 = -_1687;
    float _1733 = _1579 + _1731;
    float _1735 = _1661 * _1707;
    float _1737 = float(_1380);
    float _1739 = _1717 * _1695;
    float _1741 = float(_1346);
    float _1743 = 1.0 / _1697;
    if (!_1615)
    {
        _1655 = _1226;
    }
    float _1745 = _1655;
    float _1747 = _1745;
    if (_1615)
    {
        float _1749 = _1374 ? as_type<float>(_1683) : _1226;
        _1747 = _1749;
    }
    float _1751 = _1747;
    float _1753 = -_1651;
    float _1755 = _1577 + _1753;
    bool _1757 = _1715 >= _1707;
    bool _1759 = isnan(_1715);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan(_1707);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1707 * _168;
    float _1771 = float(_1358);
    float _1773 = trunc(_1699);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = float(_1306);
    float _1781 = _1685 * _1755;
    bool _1783 = _1771 >= _1717;
    bool _1785 = isnan(_1771);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(_1717);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    bool _1795 = _1737 >= _1685;
    bool _1797 = isnan(_1737);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan(_1685);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    int _1807 = int(_1475) + int(_1713);
    float _1809 = _1769 * _1743;
    int _1811 = int(_1435) + int(_1727);
    float _1813 = _1743 * _168;
    int _1815 = ~_1292;
    int _1817 = _1815 + 1;
    float _1819 = trunc(_1767);
    int _1821 = int(_1819);
    int _1823 = ~_1312;
    int _1825 = _1823 + 1;
    float _1827 = _1717 * _1813;
    float _1829 = _1685 * _1813;
    float _1831 = _1779 * _1813;
    int _1833 = _1817 * _1729;
    int _1835 = _1833 + _1336;
    float _1837 = _1779 * _1733;
    int _1839 = _1825 * _1811;
    int _1841 = _1839 + _1358;
    float _1843 = trunc(_1735);
    int _1845 = int(_1843);
    int _1847 = _1647 * _1807;
    int _1849 = _1847 + _1380;
    bool _1851 = uint(_1835) >= uint(_1292);
    float _1853 = in.m_75.y;
    bool _1855 = uint(_1841) >= uint(_1312);
    bool _1857 = !_1851;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1863 = _1861 != 0;
    float _1865 = trunc(_1739);
    int _1867 = int(_1865);
    bool _1869 = uint(_1849) >= uint(_1326);
    bool _1871 = !_1863;
    int _1873 = _1871 ? 0 : 1;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1877 = _1875 != 0;
    int _1879 = int(_1457) + int(_1777);
    float _1881 = trunc(_1781);
    int _1883 = int(_1881);
    int _1885 = ~_1306;
    int _1887 = _1885 + 1;
    bool _1889 = !_1855;
    int _1891 = _1889 ? 0 : (-1);
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1895 = _1893 != 0;
    int _1897 = _1887 * _1879;
    int _1899 = _1897 + _1346;
    int _1901 = ~_1729;
    int _1903 = _1901 + _1859;
    int _1905 = _1903 + 1;
    float _1907 = trunc(_1793);
    int _1909 = int(_1907);
    int _1911 = abs(_1873);
    bool _1913 = !_1877;
    int _1915 = _1913 ? 0 : 1;
    int _1917 = _1292 * _1905;
    int _1919 = _1917 + _1336;
    bool _1921 = _1741 >= _1779;
    bool _1923 = isnan(_1741);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan(_1779);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    int _1933 = _1845 * _1911;
    int _1935 = _1933 + _1336;
    bool _1937 = !_1895;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = trunc(_1805);
    int _1943 = int(_1941);
    int _1945 = ~_1811;
    int _1947 = _1945 + _1891;
    int _1949 = _1947 + 1;
    int _1951 = abs(_1915);
    bool _1953 = _1292 == 0;
    int _1955 = _1312 * _1949;
    int _1957 = _1955 + _1358;
    int _1959 = abs(_1939);
    int _1961 = _1867 * _1951;
    int _1963 = _1961 + _1358;
    bool _1965 = uint(_1899) >= uint(_1306);
    float _1967 = trunc(_1809);
    int _1969 = int(_1967);
    bool _1971 = !_1869;
    int _1973 = _1971 ? 0 : (-1);
    int _1975 = ~_1821;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    bool _1981 = !_1953;
    int _1983 = _1981 ? _1919 : (-1);
    float _1985 = trunc(_1931);
    int _1987 = int(_1985);
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1991 = _1989 != 0;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1995 = _1993 != 0;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1999 = _1997 != 0;
    int _2001 = _1983 * _1979;
    int _2003 = ~_1807;
    int _2005 = _2003 + _1973;
    int _2007 = _2005 + 1;
    int _2009 = _1883 * _1959;
    int _2011 = _2009 + _1380;
    bool _2013 = !_1965;
    int _2015 = _2013 ? 0 : (-1);
    int _2017 = _1292 + (-1);
    int _2019 = _1326 * _2007;
    int _2021 = _2019 + _1380;
    bool _2023 = !_1995;
    int _2025 = _2023 ? 0 : 1;
    bool _2027 = _1312 == 0;
    int _2029 = _1821 * _2017;
    int _2031 = _2029 + _2001;
    bool _2033 = !_1991;
    int _2035 = _2033 ? 0 : 1;
    int _2037 = ~_1879;
    int _2039 = _2037 + _2015;
    int _2041 = _2039 + 1;
    bool _2043 = _1326 == 0;
    int _2045 = abs(_2025);
    int _2047 = ~_1909;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    bool _2053 = !_2027;
    int _2055 = _2053 ? _1957 : (-1);
    int _2057 = abs(_2035);
    int _2059 = ~_1943;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    int _2065 = _2051 * _2055;
    bool _2067 = !_2043;
    int _2069 = _2067 ? _2021 : (-1);
    int _2071 = _2031 * _2045;
    int _2073 = _1306 * _2041;
    int _2075 = _2073 + _1346;
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2079 = _2077 != 0;
    int _2081 = _2063 * _2069;
    bool _2083 = !_1999;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1969 * _2057;
    int _2089 = _2087 + _2071;
    bool _2091 = !_2079;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = abs(_2085);
    int _2097 = abs(_2093);
    bool _2099 = _1306 == 0;
    int _2101 = _1935 * _2095;
    int _2103 = _2101 + _2089;
    int _2105 = _1312 + (-1);
    float _2107 = trunc(_1827);
    int _2109 = int(_2107);
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2113 = _2111 != 0;
    int _2115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2117 = _2115 != 0;
    int _2119 = _1845 * _2097;
    int _2121 = _2119 + _2103;
    bool _2123 = !_2099;
    int _2125 = _2123 ? _2075 : (-1);
    int _2127 = _1909 * _2105;
    int _2129 = _2127 + _2065;
    int _2131 = ~_1987;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    float _2137 = float(uint(_2121));
    bool _2139 = !_2117;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _2135 * _2125;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2147 = _2145 != 0;
    int _2149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2151 = _2149 != 0;
    float _2153 = as_type<float>(_1342) * _2137;
    int _2155 = abs(_2141);
    bool _2157 = !_2113;
    int _2159 = _2157 ? 0 : 1;
    int _2161 = _1326 + (-1);
    float _2163 = trunc(_2153);
    float _2165 = precise::max(_2163, 0.0);
    uint _2167 = uint(_2165);
    int _2169 = abs(_2159);
    bool _2171 = !_2147;
    int _2173 = _2171 ? 0 : 1;
    int _2175 = _1943 * _2161;
    int _2177 = _2175 + _2081;
    int _2179 = ~_1292;
    int _2181 = _2179 + 1;
    int _2183 = _2129 * _2155;
    int _2185 = abs(_2173);
    int _2187 = _1306 + (-1);
    int _2189 = _2109 * _2169;
    int _2191 = _2189 + _2183;
    bool _2193 = !_2151;
    int _2195 = _2193 ? 0 : 1;
    int _2197 = _1987 * _2187;
    int _2199 = _2197 + _2143;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2203 = _2201 != 0;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_1829);
    int _2211 = int(_2209);
    int _2213 = abs(_2195);
    int _2215 = _2181 * int(_2167);
    int _2217 = _2215 + _2121;
    int _2219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2221 = _2219 != 0;
    int _2223 = _1963 * _2185;
    int _2225 = _2223 + _2191;
    bool _2227 = !_2207;
    int _2229 = _2227 ? 0 : 1;
    float _2231 = float(uint(_2217));
    int _2233 = _1867 * _2213;
    int _2235 = _2233 + _2225;
    bool _2237 = !_2221;
    int _2239 = _2237 ? 0 : 1;
    float _2241 = trunc(_1837);
    int _2243 = int(_2241);
    int _2245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2247 = _2245 != 0;
    float _2249 = as_type<float>(_1342) * _2231;
    int _2251 = abs(_2229);
    bool _2253 = !_2247;
    int _2255 = _2253 ? 0 : 1;
    float _2257 = float(uint(_2235));
    int _2259 = _2177 * _2251;
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2263 = _2261 != 0;
    int _2265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2267 = _2265 != 0;
    int _2269 = abs(_2239);
    float _2271 = as_type<float>(_1376) * _2257;
    float _2273 = trunc(_2249);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    bool _2279 = !_2203;
    int _2281 = _2279 ? 0 : 1;
    bool _2283 = !_2267;
    int _2285 = _2283 ? 0 : 1;
    int _2287 = abs(_2281);
    int _2289 = abs(_2285);
    float _2291 = trunc(_2271);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2211 * _2287;
    int _2299 = _2297 + _2259;
    int _2301 = abs(_2255);
    int _2303 = _2199 * _2289;
    int _2305 = ~_1312;
    int _2307 = _2305 + 1;
    int _2309 = _2011 * _2269;
    int _2311 = _2309 + _2299;
    int _2313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2315 = _2313 != 0;
    float _2317 = trunc(_1831);
    int _2319 = int(_2317);
    int _2321 = _2243 * _2301;
    int _2323 = _2321 + _1346;
    int _2325 = int(_2167) + int(_2277);
    bool _2327 = !_2263;
    int _2329 = _2327 ? 0 : 1;
    bool _2331 = !_2315;
    int _2333 = _2331 ? 0 : 1;
    int _2335 = abs(_2329);
    int _2337 = _2307 * int(_2295);
    int _2339 = _2337 + _2235;
    int _2341 = abs(_2333);
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2349 = _2347 != 0;
    int _2351 = ~_1292;
    int _2353 = _2351 + 1;
    int _2355 = _1883 * _2341;
    int _2357 = _2355 + _2311;
    float _2359 = float(uint(_2339));
    int _2361 = _2319 * _2335;
    int _2363 = _2361 + _2303;
    bool _2365 = !_2345;
    int _2367 = _2365 ? 0 : 1;
    int _2369 = _2353 * _2325;
    int _2371 = _2369 + _2121;
    bool _2373 = !_2349;
    int _2375 = _2373 ? 0 : 1;
    float _2377 = as_type<float>(_1376) * _2359;
    int _2379 = abs(_2367);
    float _2381 = float(uint(_2357));
    float _2383 = trunc(_2377);
    float _2385 = precise::max(_2383, 0.0);
    uint _2387 = uint(_2385);
    bool _2389 = uint(_2371) >= uint(_1292);
    float _2391 = as_type<float>(_1413) * _2381;
    bool _2393 = !_2389;
    int _2395 = _2393 ? 0 : (-1);
    int _2397 = abs(_2375);
    float _2399 = trunc(_2391);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2407 = _2405 != 0;
    int _2409 = _2323 * _2379;
    int _2411 = _2409 + _2363;
    int _2413 = ~_2325;
    int _2415 = _2413 + _2395;
    int _2417 = _2415 + 1;
    bool _2419 = _1292 == 0;
    int _2421 = _2243 * _2397;
    int _2423 = _2421 + _2411;
    int _2425 = ~_1326;
    int _2427 = _2425 + 1;
    int _2429 = _1292 * _2417;
    int _2431 = _2429 + _2121;
    bool _2433 = _1220 > 0.5;
    float _2435 = in.m_65.w;
    float _2437 = float(uint(_2423));
    float _2439 = -_1853;
    float _2441 = _2439 + 1.0;
    bool _2443 = !_2419;
    int _2445 = _2443 ? _2431 : (-1);
    int _2447 = as_type<int>(_2271);
    if (_2407)
    {
        float _2449 = -_1226;
        float _2451 = _2449 + 1.0;
        _2447 = as_type<int>(_2451);
    }
    int _2453 = _2447;
    int _2455 = int(_2295) + int(_2387);
    float _2457 = as_type<float>(_1354) * _2437;
    int _2459 = _2427 * int(_2403);
    int _2461 = _2459 + _2357;
    int _2463 = _2445 & 3;
    bool _2465 = _2463 != 0;
    if (_2407)
    {
        float _2467 = _2433 ? as_type<float>(_2453) : _1226;
        _1390 = _2467;
    }
    float _2469 = _1390;
    int _2471 = ~_1312;
    int _2473 = _2471 + 1;
    float _2475 = trunc(_2457);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    bool _2481 = uint(_2463) > 1u;
    float _2483 = float(uint(_2461));
    int _2485 = _2473 * _2455;
    int _2487 = _2485 + _2235;
    int _2489 = _2445 & 3;
    bool _2491 = _2489 != 0;
    int _2493 = ~_1306;
    int _2495 = _2493 + 1;
    float _2497 = as_type<float>(_1413) * _2483;
    int _2499 = _2491 ? 0 : 1;
    bool _2501 = uint(_2487) >= uint(_1312);
    int _2503 = ~_2499;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = trunc(_2497);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    int _2515 = _2507;
    if (!_2481)
    {
        int _2517 = ~_2499;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    int _2523 = _2495 * int(_2479);
    int _2525 = _2523 + _2423;
    bool _2527 = !_2501;
    int _2529 = _2527 ? 0 : (-1);
    bool _2531 = _2463 != 3;
    bool _2533 = uint(_2463) >= 2u;
    int _2535 = ~_2455;
    int _2537 = _2535 + _2529;
    int _2539 = _2537 + 1;
    int _2541 = _2533 ? 0 : 1;
    float _2543 = float(uint(_2525));
    int _2545 = _1312 * _2539;
    int _2547 = _2545 + _2235;
    int _2549 = _2433 ? as_type<int>(_2441) : as_type<int>(_1853);
    bool _2551 = _2435 > 0.5;
    float _2553 = as_type<float>(_1354) * _2543;
    int _2555 = ~_1326;
    int _2557 = _2555 + 1;
    bool _2559 = _1312 == 0;
    float _2561 = trunc(_2553);
    float _2563 = precise::max(_2561, 0.0);
    uint _2565 = uint(_2563);
    int _2567 = ~_2541;
    int _2569 = _2567 + 1;
    int _2571 = _2569 + 1;
    int _2573 = _2571;
    if (_2531)
    {
        int _2575 = ~_2541;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    int _2581 = int(_2403) + int(_2513);
    bool _2583 = !_2559;
    int _2585 = _2583 ? _2547 : (-1);
    int _2587 = _2551 ? as_type<int>(_2441) : as_type<int>(_1853);
    int _2589 = _2557 * _2581;
    int _2591 = _2589 + _2357;
    int _2593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2595 = _2593 != 0;
    int _2597 = _2585 & 3;
    bool _2599 = _2597 != 0;
    bool _2601 = !_2595;
    int _2603 = _2601 ? 0 : 1;
    bool _2605 = uint(_2597) >= 2u;
    int _2607 = _2599 ? 0 : 1;
    bool _2609 = uint(_2591) >= uint(_1326);
    int _2611 = _2605 ? 0 : 1;
    bool _2613 = _2597 != 3;
    bool _2615 = !_2609;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = ~_1306;
    int _2621 = _2619 + 1;
    bool _2623 = uint(_2597) > 1u;
    int _2625 = ~_2581;
    int _2627 = _2625 + _2617;
    int _2629 = _2627 + 1;
    int _2631 = int(_2479) + int(_2565);
    int _2633 = _1326 * _2629;
    int _2635 = _2633 + _2357;
    bool _2637 = _1326 == 0;
    int _2639 = ~_2611;
    int _2641 = _2639 + 1;
    int _2643 = _2641 + 1;
    int _2645 = _2621 * _2631;
    int _2647 = _2645 + _2423;
    int _2649 = _2643;
    if (_2613)
    {
        int _2651 = ~_2611;
        int _2653 = _2651 + 1;
        _2649 = _2653;
    }
    int _2655 = _2649;
    int _2657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2659 = _2657 != 0;
    int _2661 = ~_2607;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    bool _2667 = !_2637;
    int _2669 = _2667 ? _2635 : (-1);
    int _2671 = _2665;
    if (!_2623)
    {
        int _2673 = ~_2607;
        int _2675 = _2673 + 1;
        _2671 = _2675;
    }
    int _2677 = _2671;
    bool _2679 = uint(_2647) >= uint(_1306);
    bool _2681 = !_2659;
    int _2683 = _2681 ? 0 : 1;
    int _2685 = _2669 & 3;
    bool _2687 = _2685 != 0;
    bool _2689 = !_2679;
    int _2691 = _2689 ? 0 : (-1);
    int _2693 = _2687 ? 0 : 1;
    bool _2695 = uint(_2685) >= 2u;
    bool _2697 = _2685 != 3;
    int _2699 = ~_2631;
    int _2701 = _2699 + _2691;
    int _2703 = _2701 + 1;
    int _2705 = _2695 ? 0 : 1;
    bool _2707 = uint(_2685) > 1u;
    int _2709 = _1306 * _2703;
    int _2711 = _2709 + _2423;
    bool _2713 = _1306 == 0;
    int _2715 = ~_2705;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    bool _2721 = !_2713;
    int _2723 = _2721 ? _2711 : (-1);
    int _2725 = _2719;
    if (_2697)
    {
        int _2727 = ~_2705;
        int _2729 = _2727 + 1;
        _2725 = _2729;
    }
    int _2731 = _2725;
    int _2733 = _2723 & 3;
    bool _2735 = _2733 != 0;
    int _2737 = ~_2693;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = _2741;
    if (!_2707)
    {
        int _2745 = ~_2693;
        int _2747 = _2745 + 1;
        _2743 = _2747;
    }
    int _2749 = _2743;
    bool _2751 = uint(_2733) >= 2u;
    int _2753 = _2735 ? 0 : 1;
    int _2755 = _2751 ? 0 : 1;
    bool _2757 = _2733 != 3;
    bool _2759 = uint(_2733) > 1u;
    int _2761 = ~_2755;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    int _2767 = ~_2753;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2777 = _2765;
    int _2779 = _2771;
    if (_2757)
    {
        int _2781 = ~_2755;
        int _2783 = _2781 + 1;
        _2777 = _2783;
    }
    int _2785 = _2777;
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2789 = _2787 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2759)
    {
        int _2791 = ~_2753;
        int _2793 = _2791 + 1;
        _2779 = _2793;
    }
    int _2795 = _2779;
    float _2797 = 1.0 / _2775;
    float _2799 = in.m_50.x;
    float _2801 = in.m_50.y;
    float _2803 = in.m_50.z;
    int _2805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2807 = _2805 != 0;
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2811 = _2809 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2815 = _2813 != 0;
    bool _2817 = !_2807;
    int _2819 = _2817 ? 0 : 1;
    float _2821 = _2815 ? as_type<float>(_2549) : _1853;
    float _2823 = 1.0 / _2789;
    int _2825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2827 = _2825 != 0;
    bool _2829 = _1535 > 0.5;
    float _2831 = _2827 ? as_type<float>(_2587) : _1853;
    int _2833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2835 = _2833 != 0;
    float _2837 = 1.0 / _2811;
    int _2839 = _2829 ? as_type<int>(_2441) : as_type<int>(_1853);
    int _2841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2843 = _2841 != 0;
    float _2845 = _2835 ? as_type<float>(_2839) : _1853;
    float _2847 = _200 * _2801;
    float _2849 = _2843 ? as_type<float>(_2839) : _1853;
    int _2851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2853 = _2851 != 0;
    int _2855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2857 = _2855 != 0;
    float _2859 = fma(_198, _2799, _2847);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2863 = _2861 != 0;
    float _2865 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2867 = _2865 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2869 = _206 * _2801;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2873 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2875 = _1525 * 2.0;
    float _2877 = 1.0 / _2867;
    float _2879 = _212 * _2801;
    float _2881 = fma(_204, _2799, _2869);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2885 = _2883 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2887 = fma(_2873, -2.0, _2871);
    float _2889 = fma(_210, _2799, _2879);
    float _2891 = floor(_2875);
    float _2893 = fma(_202, _2803, _2859);
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2895;
    float _2899 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2901 = _2899 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2903 = fma(_214, _2803, _2889);
    float _2905 = fma(_208, _2803, _2881);
    float _2907 = 1.0 / _2885;
    float _2909 = _2853 ? as_type<float>(_2839) : _1853;
    float _2911 = _2897 * _2837;
    float _2913 = _2857 ? as_type<float>(_2839) : _1853;
    float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2917 = _1214 + _2915;
    bool _2919 = !_2863;
    int _2921 = _2919 ? 0 : 1;
    float _2923 = _2893 + _1649;
    float _2925 = float(uint(_2011));
    float _2927 = 1.0 / _2901;
    float _2929 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2931 = _2929 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2933 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2933;
    bool _2937 = _2891 > 0.0;
    float _2939 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2887);
    float _2941 = _2931 * _2797;
    float _2943 = _2935 * _2823;
    float _2945 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2947 = _2945 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2953 = _2891 >= 0.0;
    bool _2955 = isnan(_2891);
    bool _2957 = _2953 || _2955;
    bool _2959 = isnan(0.0);
    bool _2961 = _2957 || _2959;
    float _2963 = 1.0 / _2947;
    float _2965 = _2951 * _2877;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2967;
    int _2971 = _2961 ? 0 : 1;
    float _2973 = _2969 * _2907;
    float _2975 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2977 = _2975 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2979 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2979;
    float _2983 = _1220 * 2.0;
    int _2985 = ~_2971;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    float _2991 = _2977 * _2927;
    float _2993 = float(uint(_1935));
    bool _2995 = _1537 != 2;
    int _2997 = _2989;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3001 = _2877;
    float _3003 = _2927;
    float _3005 = _2913;
    if (!_2937)
    {
        int _3007 = ~_2971;
        int _3009 = _3007 + 1;
        _2997 = _3009;
    }
    int _3011 = _2997;
    float _3013 = _2981 * _2963;
    float _3015 = floor(_2983);
    float _3017 = as_type<float>(_1342) * _2993;
    if (!_1607)
    {
        _2999 = _1220;
    }
    float _3019 = _2999;
    float _3021 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3023 = _1214 + _3021;
    float _3025 = _3019;
    if (!_1607)
    {
        _3001 = _1220;
    }
    float _3027 = _3001;
    float _3029 = _3027;
    if (!_1607)
    {
        _3003 = _1535;
    }
    float _3031 = _3003;
    float _3033 = fma(_2911, _3023, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3035 = trunc(_3017);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    float _3041 = 0.0;
    float _3043 = _3031;
    if (!_1607)
    {
        _3041 = _1535;
    }
    float _3045 = _3041;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3049 = _1214 + _3047;
    bool _3051 = !_1607;
    float _3053 = _3051 ? as_type<float>(_1539) : as_type<float>(_1541);
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3057 = _1214 + _3055;
    bool _3059 = !_1607;
    float _3061 = _3059 ? as_type<float>(_1541) : as_type<float>(_1543);
    float _3063 = fma(_2965, _3049, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3065 = _3045;
    if (_1607)
    {
        _3025 = _1525;
    }
    float _3067 = _3025;
    float _3069 = fma(_2991, _3057, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1607)
    {
        _3029 = _1525;
    }
    float _3071 = _3029;
    if (_1607)
    {
        _3043 = _1220;
    }
    float _3073 = _3043;
    if (_1607)
    {
        _3065 = _1220;
    }
    float _3075 = _3065;
    bool _3077 = _3015 > 0.0;
    bool _3079 = _3015 >= 0.0;
    bool _3081 = isnan(_3015);
    bool _3083 = _3079 || _3081;
    bool _3085 = isnan(0.0);
    bool _3087 = _3083 || _3085;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3091 = _1214 + _3089;
    int _3093 = ~_1292;
    int _3095 = _3093 + 1;
    float _3097 = float(uint(_1963));
    float _3099 = fma(_2941, _3091, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3101 = fma(_2943, _2917, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3103 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3105 = _1214 + _3103;
    int _3107 = _3095 * int(_3039);
    int _3109 = _3107 + _1935;
    float _3111 = as_type<float>(_1376) * _3097;
    bool _3113 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3115 = isnan(_1214);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = fma(_3013, _3105, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3127 = float(uint(_2323));
    float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3131 = _1214 + _3129;
    float _3133 = float(uint(_3109));
    float _3135 = _2905 + _1611;
    float _3137 = trunc(_3111);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    bool _3143 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3145 = isnan(_1214);
    bool _3147 = _3143 || _3145;
    bool _3149 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3151 = _3147 || _3149;
    float _3153 = float(_3151);
    float _3155 = -_3123;
    float _3157 = _3155 + 1.0;
    float _3159 = as_type<float>(_1342) * _3133;
    bool _3161 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3163 = isnan(_1214);
    bool _3165 = _3161 || _3163;
    bool _3167 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3169 = _3165 || _3167;
    float _3171 = float(_3169);
    float _3173 = as_type<float>(_1354) * _3127;
    float _3175 = -_3153;
    float _3177 = _3175 + 1.0;
    bool _3179 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3181 = isnan(_1214);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3187 = _3183 || _3185;
    float _3189 = float(_3187);
    float _3191 = fma(_2973, _3131, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3193 = -_3171;
    float _3195 = _3193 + 1.0;
    float _3197 = _3171 * _3177;
    bool _3199 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3201 = isnan(_1214);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3207 = _3203 || _3205;
    float _3209 = float(_3207);
    float _3211 = trunc(_3173);
    float _3213 = precise::max(_3211, 0.0);
    uint _3215 = uint(_3213);
    float _3217 = _3123 * _3195;
    float _3219 = as_type<float>(_1413) * _2925;
    bool _3221 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3223 = isnan(_1214);
    bool _3225 = _3221 || _3223;
    bool _3227 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3229 = _3225 || _3227;
    float _3231 = float(_3229);
    float _3233 = -_3209;
    float _3235 = _3233 + 1.0;
    int _3237 = _1721 * int(_3141);
    int _3239 = _3237 + _1963;
    float _3241 = _3209 * _3157;
    bool _3243 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3245 = isnan(_1214);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3251 = _3247 || _3249;
    float _3253 = float(_3251);
    float _3255 = trunc(_3219);
    float _3257 = precise::max(_3255, 0.0);
    uint _3259 = uint(_3257);
    float _3261 = _3189 * _3235;
    float _3263 = float(uint(_3239));
    float _3265 = -_3189;
    float _3267 = _3265 + 1.0;
    int _3269 = ~_1326;
    int _3271 = _3269 + 1;
    bool _3273 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3275 = isnan(_1214);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3281 = _3277 || _3279;
    float _3283 = float(_3281);
    float _3285 = as_type<float>(_1376) * _3263;
    float _3287 = -_3231;
    float _3289 = _3287 + 1.0;
    int _3291 = ~_1306;
    int _3293 = _3291 + 1;
    float _3295 = trunc(_3159);
    float _3297 = precise::max(_3295, 0.0);
    uint _3299 = uint(_3297);
    float _3301 = _3253 * _3267;
    float _3303 = _3283 * _3289;
    float _3305 = -_3253;
    float _3307 = _3305 + 1.0;
    int _3309 = _3293 * int(_3215);
    int _3311 = _3309 + _2323;
    float _3313 = -_3283;
    float _3315 = _3313 + 1.0;
    int _3317 = _3271 * int(_3259);
    int _3319 = _3317 + _2011;
    float _3321 = _3033 * _3303;
    float _3323 = trunc(_3285);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    float _3329 = _3231 * _3307;
    float _3331 = _3087 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3333 = fma(_3315, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3321);
    float _3335 = float(uint(_3319));
    float _3337 = _2903 + _1705;
    int _3339 = ~_1292;
    int _3341 = _3339 + 1;
    float _3343 = fma(_3099, _3329, _3333);
    float _3345 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3347 = _2923 + _3345;
    float _3349 = as_type<float>(_1413) * _3335;
    float _3351 = float(uint(_3311));
    float _3353 = fma(_3101, _3301, _3343);
    int _3355 = ~_1312;
    int _3357 = _3355 + 1;
    float _3359 = trunc(_3349);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    int _3365 = ~as_type<int>(_3331);
    int _3367 = _3365 + 1;
    int _3369 = _3367 + 1;
    float _3371 = as_type<float>(_1354) * _3351;
    int _3373 = int(_3039) + int(_3299);
    float _3375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3377 = _3135 + _3375;
    int _3379 = int(_3141) + int(_3327);
    float _3381 = fma(_3063, _3261, _3353);
    int _3383 = _3369;
    float _3385 = _3331;
    float _3387 = _3329;
    if (!_3077)
    {
        int _3389 = ~as_type<int>(_3331);
        int _3391 = _3389 + 1;
        _3383 = _3391;
    }
    int _3393 = _3383;
    float _3395 = trunc(_3371);
    float _3397 = precise::max(_3395, 0.0);
    uint _3399 = uint(_3397);
    int _3401 = _3341 * _3373;
    int _3403 = _3401 + _1935;
    int _3405 = ~_1326;
    int _3407 = _3405 + 1;
    float _3409 = fma(_3191, _3241, _3381);
    float _3411 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3413 = uint(_3403) >= uint(_1292);
    int _3415 = _3357 * _3379;
    int _3417 = _3415 + _1963;
    float _3419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3421 = int(_3259) + int(_3363);
    float _3423 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3425 = !_3413;
    int _3427 = _3425 ? 0 : (-1);
    float _3429 = _1535 * 2.0;
    bool _3431 = uint(_3417) >= uint(_1312);
    float _3433 = _3377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3435 = -_3423;
    float _3437 = fma(_3411, 2.0, _3435);
    int _3439 = int(_3215) + int(_3399);
    int _3441 = _3407 * _3421;
    int _3443 = _3441 + _2011;
    int _3445 = ~_1306;
    int _3447 = _3445 + 1;
    float _3449 = floor(_3429);
    bool _3451 = !_3431;
    int _3453 = _3451 ? 0 : (-1);
    float _3455 = -_168;
    float _3457 = fma(_3455, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3437);
    bool _3459 = uint(_3443) >= uint(_1326);
    float _3461 = fma(_3347, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3433);
    float _3463 = _3419 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3467 = _3337 + _3465;
    bool _3469 = !_3459;
    int _3471 = _3469 ? 0 : (-1);
    float _3473 = fma(_3463, _1429, -0.5);
    int _3475 = _3447 * _3439;
    int _3477 = _3475 + _2323;
    float _3479 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3461);
    bool _3481 = uint(_3477) >= uint(_1306);
    float _3483 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3489 = !_3481;
    int _3491 = _3489 ? 0 : (-1);
    float _3493 = fma(as_type<float>(_1543), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3483);
    bool _3495 = _3479 >= 0.0;
    float _3497 = as_type<float>(_1543) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3499 = fma(as_type<float>(_1541), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3485);
    float _3501 = as_type<float>(_1541) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3503 = _1220 + _1525;
    float _3505 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3493);
    float _3507 = fma(_3501, -2.0, _3487);
    float _3509 = _3503 + (-1.0);
    float _3511 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3513 = ~_3379;
    int _3515 = _3513 + _3453;
    int _3517 = _3515 + 1;
    float _3519 = fma(_3069, _3217, _3409);
    float _3521 = fma(_3509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3523 = _3509;
    if (_3495)
    {
        _3523 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3525 = _3523;
    float _3527 = -_3511;
    float _3529 = fma(_3497, 2.0, _3527);
    int _3531 = ~_3373;
    int _3533 = _3531 + _3427;
    int _3535 = _3533 + 1;
    bool _3537 = !_2465;
    int _3539 = _3537 ? 0 : 1;
    int _3541 = as_type<int>(_3525);
    if (_3495)
    {
        float _3543 = _3525 * 5.0;
        _3541 = as_type<int>(_3543);
    }
    int _3545 = _3541;
    int _3547 = _2585 & 3;
    bool _3549 = _3547 != 0;
    float _3551 = fma(_3125, _3197, _3519);
    int _3553 = _1292 * _3535;
    int _3555 = _3553 + _1935;
    if (_3495)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11987 = as_type<float>(_3545);
        out.gl_Position.z = _11987;
    }
    bool _3557 = !_3549;
    int _3559 = _3557 ? 0 : 1;
    float _3561 = fma(_3153, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3551);
    int _3563 = _2669 & 3;
    bool _3565 = _3563 != 0;
    float _3567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3569 = _1312 * _3517;
    int _3571 = _3569 + _1963;
    bool _3573 = !_3565;
    int _3575 = _3573 ? 0 : 1;
    float _3577 = fma(_3071, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3567);
    int _3579 = _2723 & 3;
    bool _3581 = _3579 != 0;
    out.m_77.x = _3561;
    float _3583 = _3377 * _3377;
    bool _3585 = !_3581;
    int _3587 = _3585 ? 0 : 1;
    float _3589 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3499);
    bool _3591 = _2463 != 3;
    float _3593 = fma(_3347, _3347, _3583);
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3597 = fma(_3467, _3467, _3593);
    bool _3599 = !_3591;
    int _3601 = _3599 ? 0 : (-1);
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3605 = _2445 >> 31;
    float _3607 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3609 = _2597 != 3;
    float _3611 = fma(_3053, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3603);
    float _3613 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3615 = _3605 & 3;
    float _3617 = rsqrt(_3597);
    int _3619 = _2669 >> 31;
    float _3621 = fma(_3613, -2.0, _3607);
    int _3623 = _2585 >> 31;
    float _3625 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3595);
    int _3627 = _2445 + _3615;
    float _3629 = _3061 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3631 = _3623 & 3;
    float _3633 = -_168;
    float _3635 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3529);
    int _3637 = _3627 >> 2;
    float _3639 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3507);
    int _3641 = _2585 + _3631;
    float _3643 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3625);
    int _3645 = _2723 >> 31;
    float _3647 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3577);
    int _3649 = _3619 & 3;
    float _3651 = _3347 * _3617;
    int _3653 = _3641 >> 2;
    float _3655 = _3377 * _3617;
    int _3657 = _3637 << 4;
    int _3659 = _3657 + 368;
    float _3661 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3621);
    bool _3663 = !_3609;
    int _3665 = _3663 ? 0 : (-1);
    float _3667 = -_3655;
    float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3377);
    bool _3671 = _2685 != 3;
    if (_3495)
    {
        out.m_53.x = 0.0;
    }
    if (_2995)
    {
        _3385 = _1525;
    }
    float _3673 = _3385;
    float _3675 = _3669 * _3669;
    float _3677 = _3673;
    if (_2995)
    {
        _3387 = _1220;
    }
    float _3679 = _3387;
    int _3681 = _3645 & 3;
    float _3683 = _3679;
    if (!_2995)
    {
        _3677 = _1535;
    }
    float _3685 = _3677;
    uint _3687 = uint(int(uint(_3659) >> uint(2)));
    uint _3689 = uint(int(uint(int(_3687)) >> uint(2)));
    int _3691 = int(_3687) & 3;
    float _3693 = (*spvDescriptorSet0.vp_c9)._m0[int(_3689)][_3691];
    int _3695 = int(_3687) + 1;
    uint _3697 = uint(int(uint(_3695) >> uint(2)));
    int _3699 = _3695 & 3;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[int(_3697)][_3699];
    if (!_2995)
    {
        _3683 = _1525;
    }
    float _3703 = _3683;
    int _3705 = _2669 + _3649;
    float _3707 = _3685 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3709 = _3653 << 4;
    int _3711 = _3709 + 512;
    float _3713 = _3703 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3715 = _3449 > 0.0;
    float _3717 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3719 = int(_3717);
    bool _3721 = _3449 >= 0.0;
    bool _3723 = isnan(_3449);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan(0.0);
    bool _3729 = _3725 || _3727;
    uint _3731 = uint(int(uint(_3711) >> uint(2)));
    uint _3733 = uint(int(uint(int(_3731)) >> uint(2)));
    int _3735 = int(_3731) & 3;
    float _3737 = (*spvDescriptorSet0.vp_c9)._m0[int(_3733)][_3735];
    int _3739 = int(_3731) + 1;
    uint _3741 = uint(int(uint(_3739) >> uint(2)));
    int _3743 = _3739 & 3;
    float _3745 = (*spvDescriptorSet0.vp_c9)._m0[int(_3741)][_3743];
    bool _3747 = _2733 != 3;
    float _3749 = -_3651;
    float _3751 = fma(_3749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3347);
    int _3753 = _2723 + _3681;
    float _3755 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3757 = _3705 >> 2;
    float _3759 = fma(_3751, _3751, _3675);
    float _3761 = -_3755;
    float _3763 = fma(_3629, 2.0, _3761);
    bool _3765 = !_2419;
    int _3767 = _3765 ? _3555 : (-1);
    float _3769 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3771 = int(_3769);
    bool _3773 = !_2559;
    int _3775 = _3773 ? _3571 : (-1);
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3779 = !_3747;
    int _3781 = _3779 ? 0 : (-1);
    float _3783 = _3073 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3785 = _3753 >> 2;
    int _3787 = _3757 << 4;
    int _3789 = _3787 + 656;
    int _3791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3793 = _3791 != 0;
    int _3795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3797 = _3795 != 0;
    int _3799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3801 = _3799 != 0;
    float _3803 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3805 = _3785 << 4;
    int _3807 = _3805 + 800;
    uint _3809 = uint(int(uint(_3789) >> uint(2)));
    uint _3811 = uint(int(uint(int(_3809)) >> uint(2)));
    int _3813 = int(_3809) & 3;
    float _3815 = (*spvDescriptorSet0.vp_c9)._m0[int(_3811)][_3813];
    int _3817 = int(_3809) + 1;
    uint _3819 = uint(int(uint(_3817) >> uint(2)));
    int _3821 = _3817 & 3;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[int(_3819)][_3821];
    float _3825 = -_3777;
    float _3827 = fma(_3803, 2.0, _3825);
    float _3829 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3831 = _3729 ? 0 : 1;
    uint _3833 = uint(int(uint(_3807) >> uint(2)));
    uint _3835 = uint(int(uint(int(_3833)) >> uint(2)));
    int _3837 = int(_3833) & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    int _3841 = int(_3833) + 1;
    uint _3843 = uint(int(uint(_3841) >> uint(2)));
    int _3845 = _3841 & 3;
    float _3847 = (*spvDescriptorSet0.vp_c9)._m0[int(_3843)][_3845];
    float _3849 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3851 = -_3829;
    float _3853 = fma(_3707, 2.0, _3851);
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3857 = ~_3421;
    int _3859 = _3857 + _3471;
    int _3861 = _3859 + 1;
    float _3863 = fma(_3713, -2.0, _3849);
    int _3865 = ~_3439;
    int _3867 = _3865 + _3491;
    int _3869 = _3867 + 1;
    float _3871 = fma(_3783, -2.0, _3855);
    int _3873 = _3659 + 8;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    uint _3877 = uint(int(uint(int(_3875)) >> uint(2)));
    int _3879 = int(_3875) & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = int(_3875) + 1;
    uint _3885 = uint(int(uint(_3883) >> uint(2)));
    int _3887 = _3883 & 3;
    float _3889 = (*spvDescriptorSet0.vp_c9)._m0[int(_3885)][_3887];
    int _3891 = ~_3831;
    int _3893 = _3891 + 1;
    int _3895 = _3893 + 1;
    float _3897 = -_168;
    float _3899 = fma(_3897, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3827);
    int _3901 = _3895;
    if (!_3715)
    {
        int _3903 = ~_3831;
        int _3905 = _3903 + 1;
        _3901 = _3905;
    }
    int _3907 = _3901;
    int _3909 = _1306 * _3869;
    int _3911 = _3909 + _2323;
    int _3913 = abs(_2677);
    float _3915 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3871);
    int _3917 = abs(_2521);
    int _3919 = _3789 + 8;
    uint _3921 = uint(int(uint(_3919) >> uint(2)));
    uint _3923 = uint(int(uint(int(_3921)) >> uint(2)));
    int _3925 = int(_3921) & 3;
    float _3927 = (*spvDescriptorSet0.vp_c9)._m0[int(_3923)][_3925];
    int _3929 = int(_3921) + 1;
    uint _3931 = uint(int(uint(_3929) >> uint(2)));
    int _3933 = _3929 & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = abs(_2749);
    int _3939 = _1326 * _3861;
    int _3941 = _3939 + _2011;
    int _3943 = ~_3917;
    int _3945 = _3943 + 1;
    int _3947 = _3945 + 1;
    float _3949 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3951 = int(_3949);
    int _3953 = ~_3913;
    int _3955 = _3953 + 1;
    int _3957 = _3955 + 1;
    float _3959 = -_168;
    float _3961 = fma(_3959, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3853);
    int _3963 = abs(_3575);
    int _3965 = _3711 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    int _3983 = _3947 * as_type<int>(_3701);
    int _3985 = abs(_3587);
    int _3987 = _3957 * as_type<int>(_3745);
    int _3989 = abs(_3539);
    float _3991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3993 = abs(_2795);
    float _3995 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3863);
    int _3997 = _3807 + 8;
    uint _3999 = uint(int(uint(_3997) >> uint(2)));
    uint _4001 = uint(int(uint(int(_3999)) >> uint(2)));
    int _4003 = int(_3999) & 3;
    float _4005 = (*spvDescriptorSet0.vp_c9)._m0[int(_4001)][_4003];
    int _4007 = int(_3999) + 1;
    uint _4009 = uint(int(uint(_4007) >> uint(2)));
    int _4011 = _4007 & 3;
    float _4013 = (*spvDescriptorSet0.vp_c9)._m0[int(_4009)][_4011];
    int _4015 = ~_3937;
    int _4017 = _4015 + 1;
    int _4019 = _4017 + 1;
    int _4021 = ~_3993;
    int _4023 = _4021 + 1;
    int _4025 = _4023 + 1;
    int _4027 = _4019 * as_type<int>(_3823);
    int _4029 = abs(_3559);
    int _4031 = ~_3989;
    int _4033 = _4031 + 1;
    int _4035 = _4033 + 1;
    float _4037 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4039 = ~_3985;
    int _4041 = _4039 + 1;
    int _4043 = _4041 + 1;
    int _4045 = _4025 * as_type<int>(_3847);
    int _4047 = ~_4029;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    int _4053 = _4035 * as_type<int>(_3693);
    int _4055 = _4053 + _3983;
    int _4057 = abs(_2579);
    int _4059 = _4043 * as_type<int>(_3839);
    int _4061 = _4059 + _4045;
    int _4063 = ~_3963;
    int _4065 = _4063 + 1;
    int _4067 = _4065 + 1;
    float _4069 = fma(_3075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4037);
    int _4071 = abs(_2731);
    float _4073 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4075 = int(_4073);
    int _4077 = _4051 * as_type<int>(_3737);
    int _4079 = _4077 + _3987;
    int _4081 = abs(_3601);
    int _4083 = _4067 * as_type<int>(_3815);
    int _4085 = _4083 + _4027;
    int _4087 = ~_4057;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    float _4093 = _3991 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4095 = ~_4071;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    float _4101 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4069);
    int _4103 = abs(_2655);
    int _4105 = _4091 * as_type<int>(_3881);
    int _4107 = _4105 + _4055;
    float _4109 = float(uint(_3771));
    int _4111 = _4099 * as_type<int>(_3927);
    int _4113 = _4111 + _4085;
    int _4115 = ~_4081;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    float _4121 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4123 = log2(_4121);
    int _4125 = abs(_2603);
    float _4127 = fma(_4093, _2909, -0.5);
    int _4129 = ~_4103;
    int _4131 = _4129 + 1;
    int _4133 = _4131 + 1;
    int _4135 = _4119 * as_type<int>(_3889);
    int _4137 = _4135 + _4107;
    int _4139 = abs(_3665);
    int _4141 = ~_4125;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    float _4147 = 1.0 / _4109;
    bool _4149 = !_3671;
    int _4151 = _4149 ? 0 : (-1);
    int _4153 = _4133 * as_type<int>(_3973);
    int _4155 = _4153 + _4079;
    int _4157 = ~_4139;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4137 * _4145;
    float _4165 = float(uint(_4075));
    int _4167 = abs(_2785);
    int _4169 = _4161 * as_type<int>(_3981);
    int _4171 = _4169 + _4155;
    int _4173 = abs(_4151);
    float _4175 = 1.0 / _4165;
    int _4177 = abs(_2683);
    int _4179 = _3767 * _4125;
    int _4181 = _4179 + _4163;
    float _4183 = float(uint(_3719));
    int _4185 = ~_4173;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    int _4191 = ~_4167;
    int _4193 = _4191 + 1;
    int _4195 = _4193 + 1;
    float _4197 = 1.0 / _4183;
    int _4199 = ~_4177;
    int _4201 = _4199 + 1;
    int _4203 = _4201 + 1;
    int _4205 = _4189 * as_type<int>(_3935);
    int _4207 = _4205 + _4113;
    int _4209 = abs(_3781);
    int _4211 = _4195 * as_type<int>(_4005);
    int _4213 = _4211 + _4061;
    int _4215 = as_type<int>(_4147) + (-2);
    int _4217 = _4203 * _4171;
    int _4219 = abs(_2819);
    float _4221 = float(uint(_4181));
    int _4223 = _3775 * _4177;
    int _4225 = _4223 + _4217;
    float _4227 = float(uint(_3951));
    int _4229 = abs(_2921);
    float _4231 = as_type<float>(_4215) * _4221;
    int _4233 = ~_4209;
    int _4235 = _4233 + 1;
    int _4237 = _4235 + 1;
    int _4239 = ~_4219;
    int _4241 = _4239 + 1;
    int _4243 = _4241 + 1;
    float _4245 = 1.0 / _4227;
    bool _4247 = _1326 == 0;
    int _4249 = _4237 * as_type<int>(_4013);
    int _4251 = _4249 + _4213;
    int _4253 = _4243 * _4207;
    bool _4255 = !_4247;
    int _4257 = _4255 ? _3941 : (-1);
    float _4259 = _4123 * _168;
    int _4261 = ~_4229;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    float _4267 = trunc(_4231);
    float _4269 = precise::max(_4267, 0.0);
    uint _4271 = uint(_4269);
    int _4273 = as_type<int>(_4175) + (-2);
    int _4275 = _4257 * _4219;
    int _4277 = _4275 + _4253;
    float _4279 = float(uint(_4225));
    int _4281 = _4265 * _4251;
    bool _4283 = _1306 == 0;
    float _4285 = _3467 * _3617;
    int _4287 = as_type<int>(_4197) + (-2);
    float _4289 = as_type<float>(_4273) * _4279;
    bool _4291 = !_4283;
    int _4293 = _4291 ? _3911 : (-1);
    float _4295 = exp2(_4259);
    float _4297 = float(uint(_4277));
    int _4299 = ~_3771;
    int _4301 = _4299 + 1;
    int _4303 = _4293 * _4229;
    int _4305 = _4303 + _4281;
    int _4307 = as_type<int>(_4245) + (-2);
    float _4309 = as_type<float>(_4287) * _4297;
    int _4311 = abs(_3771);
    float _4313 = trunc(_4289);
    float _4315 = precise::max(_4313, 0.0);
    uint _4317 = uint(_4315);
    float _4319 = float(uint(_4305));
    int _4321 = _4301 * int(_4271);
    int _4323 = _4321 + _4181;
    float _4325 = float(uint(_4311));
    float _4327 = -_4285;
    float _4329 = fma(_4327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3467);
    int _4331 = abs(_4075);
    float _4333 = as_type<float>(_4307) * _4319;
    float _4335 = float(uint(_4323));
    float _4337 = trunc(_4309);
    float _4339 = precise::max(_4337, 0.0);
    uint _4341 = uint(_4339);
    int _4343 = ~_4075;
    int _4345 = _4343 + 1;
    float _4347 = fma(_4329, _4329, _3759);
    int _4349 = ~_3719;
    int _4351 = _4349 + 1;
    float _4353 = as_type<float>(_4215) * _4335;
    float _4355 = float(uint(_4331));
    int _4357 = abs(_3719);
    float _4359 = trunc(_4333);
    float _4361 = precise::max(_4359, 0.0);
    uint _4363 = uint(_4361);
    int _4365 = _4345 * int(_4317);
    int _4367 = _4365 + _4225;
    int _4369 = ~_3951;
    int _4371 = _4369 + 1;
    float _4373 = float(uint(_4367));
    float _4375 = 1.0 / _4325;
    int _4377 = _4351 * int(_4341);
    int _4379 = _4377 + _4277;
    float _4381 = as_type<float>(_4273) * _4373;
    float _4383 = float(uint(_4357));
    float _4385 = float(uint(_4379));
    float _4387 = 1.0 / _4355;
    int _4389 = _4371 * int(_4363);
    int _4391 = _4389 + _4305;
    int _4393 = abs(_3951);
    float _4395 = as_type<float>(_4287) * _4385;
    int _4397 = abs(_4181);
    float _4399 = float(uint(_4391));
    float _4401 = 1.0 / _4383;
    float _4403 = float(uint(_4393));
    int _4405 = abs(_4225);
    float _4407 = as_type<float>(_4307) * _4399;
    int _4409 = as_type<int>(_4375) + (-2);
    float _4411 = float(uint(_4397));
    float _4413 = 1.0 / _4403;
    int _4415 = as_type<int>(_4387) + (-2);
    int _4417 = abs(_4277);
    float _4419 = as_type<float>(_4409) * _4411;
    float _4421 = float(uint(_4405));
    float _4423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4425 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4427 = isnan(1.0);
    bool _4429 = _4425 || _4427;
    bool _4431 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4433 = _4429 || _4431;
    float _4435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4437 = 1.0 + _4435;
    float _4439 = as_type<float>(_4415) * _4421;
    float _4441 = trunc(_4419);
    float _4443 = precise::max(_4441, 0.0);
    uint _4445 = uint(_4443);
    float _4447 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4423);
    int _4449 = as_type<int>(_4401) + (-2);
    float _4451 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4453 = float(uint(_4417));
    float _4455 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4457 = abs(_4305);
    float _4459 = 1.0 / _4437;
    float _4461 = as_type<float>(_4449) * _4453;
    int _4463 = as_type<int>(_4413) + (-2);
    float _4465 = -_4295;
    float _4467 = _4465 + 1.0;
    float _4469 = float(uint(_4457));
    float _4471 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4473 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4475 = isnan(0.0);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4481 = _4477 || _4479;
    float _4483 = trunc(_4439);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    float _4489 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4451);
    float _4491 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4455);
    float _4493 = as_type<float>(_4463) * _4469;
    int _4495 = ~_4311;
    int _4497 = _4495 + 1;
    float _4499 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4471);
    float _4501 = _4481 ? _4467 : 0.0;
    float _4503 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4489);
    float _4505 = trunc(_4461);
    float _4507 = precise::max(_4505, 0.0);
    uint _4509 = uint(_4507);
    int _4511 = ~_4331;
    int _4513 = _4511 + 1;
    float _4515 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3611);
    int _4517 = _4497 * int(_4445);
    int _4519 = _4517 + _4397;
    float _4521 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4499);
    float _4523 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4447);
    float _4525 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4491);
    int _4527 = ~_4393;
    int _4529 = _4527 + 1;
    float _4531 = trunc(_4381);
    float _4533 = precise::max(_4531, 0.0);
    uint _4535 = uint(_4533);
    float _4537 = float(uint(_4519));
    float _4539 = -_3661;
    float _4541 = fma(_4515, _4127, _4539);
    float _4543 = as_type<float>(_4409) * _4537;
    float _4545 = trunc(_4353);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    float _4551 = trunc(_4493);
    float _4553 = precise::max(_4551, 0.0);
    uint _4555 = uint(_4553);
    float _4557 = -_168;
    float _4559 = fma(_4557, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3763);
    float _4561 = _4285;
    if (_4433)
    {
        float _4563 = _4501 * _4459;
        _170 = _4563;
    }
    float _4565 = _170;
    int _4567 = _4513 * int(_4487);
    int _4569 = _4567 + _4405;
    int _4571 = ~_4357;
    int _4573 = _4571 + 1;
    float _4575 = fma(_3643, _3473, _4559);
    int _4577 = int(_4317) + int(_4535);
    float _4579 = trunc(_4395);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    int _4585 = int(_4271) + int(_4549);
    float _4587 = trunc(_4407);
    float _4589 = precise::max(_4587, 0.0);
    uint _4591 = uint(_4589);
    float _4593 = float(uint(_4569));
    int _4595 = _4573 * int(_4509);
    int _4597 = _4595 + _4417;
    int _4599 = _4529 * int(_4555);
    int _4601 = _4599 + _4457;
    float _4603 = as_type<float>(_4415) * _4593;
    int _4605 = ~_3771;
    int _4607 = _4605 + 1;
    float _4609 = trunc(_4543);
    float _4611 = precise::max(_4609, 0.0);
    uint _4613 = uint(_4611);
    float _4615 = float(uint(_4597));
    int _4617 = int(_4341) + int(_4583);
    float _4619 = as_type<float>(_4449) * _4615;
    int _4621 = ~_4075;
    int _4623 = _4621 + 1;
    float _4625 = trunc(_4603);
    float _4627 = precise::max(_4625, 0.0);
    uint _4629 = uint(_4627);
    int _4631 = int(_4363) + int(_4591);
    int _4633 = _4607 * _4585;
    int _4635 = _4633 + _4181;
    float _4637 = float(uint(_4601));
    int _4639 = ~_3951;
    int _4641 = _4639 + 1;
    float _4643 = as_type<float>(_4463) * _4637;
    int _4645 = ~_3719;
    int _4647 = _4645 + 1;
    float _4649 = trunc(_4619);
    float _4651 = precise::max(_4649, 0.0);
    uint _4653 = uint(_4651);
    bool _4655 = uint(_4635) >= uint(_3771);
    int _4657 = _4623 * _4577;
    int _4659 = _4657 + _4225;
    bool _4661 = uint(_4659) >= uint(_4075);
    float _4663 = trunc(_4643);
    float _4665 = precise::max(_4663, 0.0);
    uint _4667 = uint(_4665);
    int _4669 = _4641 * _4631;
    int _4671 = _4669 + _4305;
    bool _4673 = !_4655;
    int _4675 = _4673 ? 0 : (-1);
    int _4677 = _4647 * _4617;
    int _4679 = _4677 + _4277;
    int _4681 = int(_4445) + int(_4613);
    int _4683 = int(_4487) + int(_4629);
    bool _4685 = uint(_4679) >= uint(_3719);
    float _4687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4689 = !_4661;
    int _4691 = _4689 ? 0 : (-1);
    bool _4693 = uint(_4671) >= uint(_3951);
    int _4695 = ~_4331;
    int _4697 = _4695 + 1;
    int _4699 = ~_4311;
    int _4701 = _4699 + 1;
    int _4703 = int(_4555) + int(_4667);
    int _4705 = _4701 * _4681;
    int _4707 = _4705 + _4397;
    int _4709 = ~_4393;
    int _4711 = _4709 + 1;
    float _4713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4715 = int(_4509) + int(_4653);
    int _4717 = _4697 * _4683;
    int _4719 = _4717 + _4405;
    int _4721 = ~_4357;
    int _4723 = _4721 + 1;
    int _4725 = _4711 * _4703;
    int _4727 = _4725 + _4457;
    bool _4729 = !_4685;
    int _4731 = _4729 ? 0 : (-1);
    float _4733 = _4687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4735 = uint(_4707) >= uint(_4311);
    int _4737 = _4723 * _4715;
    int _4739 = _4737 + _4417;
    bool _4741 = !_4693;
    int _4743 = _4741 ? 0 : (-1);
    float _4745 = fma(_4733, _1703, -0.5);
    bool _4747 = uint(_4719) >= uint(_4331);
    int _4749 = ~_4585;
    int _4751 = _4749 + _4675;
    int _4753 = _4751 + 1;
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4757 = !_4747;
    int _4759 = _4757 ? 0 : (-1);
    float _4761 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4763 = ~_4577;
    int _4765 = _4763 + _4691;
    int _4767 = _4765 + 1;
    int _4769 = _3771 * _4753;
    int _4771 = _4769 + _4181;
    bool _4773 = uint(_4727) >= uint(_4393);
    float _4775 = _4713 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4777 = ~_4631;
    int _4779 = _4777 + _4743;
    int _4781 = _4779 + 1;
    int _4783 = _4075 * _4767;
    int _4785 = _4783 + _4225;
    bool _4787 = !_4773;
    int _4789 = _4787 ? 0 : (-1);
    float _4791 = fma(_4775, _2821, -0.5);
    bool _4793 = _4075 == 0;
    int _4795 = _3951 * _4781;
    int _4797 = _4795 + _4305;
    int _4799 = ~_4617;
    int _4801 = _4799 + _4731;
    int _4803 = _4801 + 1;
    bool _4805 = !_4793;
    int _4807 = _4805 ? _4785 : (-1);
    float _4809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4811 = _3951 == 0;
    bool _4813 = !_4735;
    int _4815 = _4813 ? 0 : (-1);
    int _4817 = _4181 ^ _3771;
    bool _4819 = uint(_4739) >= uint(_4357);
    int _4821 = _3719 * _4803;
    int _4823 = _4821 + _4277;
    bool _4825 = !_4811;
    int _4827 = _4825 ? _4797 : (-1);
    bool _4829 = _4075 == 0;
    int _4831 = _4225 ^ _4075;
    float _4833 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4835 = uint(int(uint(_4817) >> uint(31)));
    float _4837 = _4761 * _4809;
    bool _4839 = !_4819;
    int _4841 = _4839 ? 0 : (-1);
    float _4843 = _4833 * _4755;
    bool _4845 = _3771 == 0;
    float _4847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4849 = uint(int(uint(_4831) >> uint(31)));
    int _4851 = ~_4815;
    int _4853 = _4681 + _4851;
    int _4855 = _4853 + 1;
    out.m_79.x = _4843;
    out.m_79.y = _4837;
    int _4857 = ~int(_4835);
    int _4859 = _4857 + 1;
    bool _4861 = !_4845;
    int _4863 = _4861 ? _4771 : (-1);
    float _4865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4867 = _3719 == 0;
    int _4869 = ~_4759;
    int _4871 = _4683 + _4869;
    int _4873 = _4871 + 1;
    int _4875 = ~int(_4849);
    int _4877 = _4875 + 1;
    int _4879 = _4855 ^ _4859;
    float _4881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4883 = !_4867;
    int _4885 = _4883 ? _4823 : (-1);
    int _4887 = _4873 ^ _4877;
    bool _4889 = _3771 == 0;
    int _4891 = ~_4859;
    int _4893 = _4891 + _4879;
    int _4895 = _4893 + 1;
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4899 = ~_4877;
    int _4901 = _4899 + _4887;
    int _4903 = _4901 + 1;
    float _4905 = _4865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4907 = !_4889;
    int _4909 = _4907 ? _4895 : (-1);
    bool _4911 = _3719 == 0;
    float _4913 = fma(_4905, _1691, -0.5);
    int _4915 = _4277 ^ _3719;
    float _4917 = float(_4863);
    bool _4919 = !_4829;
    int _4921 = _4919 ? _4903 : (-1);
    float _4923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4925 = _3951 == 0;
    float _4927 = fma(_4733, _4917, _3457);
    int _4929 = _4305 ^ _3951;
    float _4931 = _4847 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4933 = float(_4885);
    float _4935 = fma(_4523, _4745, _4927);
    uint _4937 = uint(int(uint(_4929) >> uint(31)));
    float _4939 = fma(_4931, _1751, -0.5);
    int _4941 = ~_4789;
    int _4943 = _4703 + _4941;
    int _4945 = _4943 + 1;
    float _4947 = fma(_4931, _4933, _3961);
    int _4949 = ~int(_4937);
    int _4951 = _4949 + 1;
    float _4953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4955 = float(_4807);
    float _4957 = fma(_4525, _4939, _4947);
    int _4959 = _4945 ^ _4951;
    uint _4961 = uint(int(uint(_4915) >> uint(31)));
    float _4963 = fma(_4905, _4955, _3899);
    float _4965 = float(_4827);
    float _4967 = _4881 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4969 = ~_4951;
    int _4971 = _4969 + _4959;
    int _4973 = _4971 + 1;
    float _4975 = fma(_3647, _4913, _4963);
    int _4977 = ~_4841;
    int _4979 = _4715 + _4977;
    int _4981 = _4979 + 1;
    float _4983 = fma(_4967, _2469, -0.5);
    int _4985 = ~int(_4961);
    int _4987 = _4985 + 1;
    float _4989 = fma(_4967, _4965, _3635);
    float _4991 = float(_4909);
    float _4993 = _4953 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4995 = !_4925;
    int _4997 = _4995 ? _4973 : (-1);
    float _4999 = fma(_3505, _4983, _4989);
    int _5001 = _4981 ^ _4987;
    float _5003 = -_2939;
    float _5005 = fma(_4775, _4991, _5003);
    float _5007 = float(_4921);
    float _5009 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5011 = float(_4997);
    float _5013 = _4923 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5015 = ~_4987;
    int _5017 = _5015 + _5001;
    int _5019 = _5017 + 1;
    float _5021 = fma(_5009, _2831, -0.5);
    float _5023 = -_3915;
    float _5025 = fma(_5009, _5007, _5023);
    float _5027 = fma(_4993, _2849, -0.5);
    bool _5029 = !_4911;
    int _5031 = _5029 ? _5019 : (-1);
    float _5033 = -_3639;
    float _5035 = fma(_4993, _5011, _5033);
    float _5037 = fma(_4503, _4791, _5005);
    float _5039 = fma(_4101, _5021, _5025);
    float _5041 = float(_5031);
    float _5043 = fma(_3589, _5027, _5035);
    float _5045 = fma(_5013, _2845, -0.5);
    float _5047 = _4957 + 0.5;
    float _5049 = _4575 + 0.5;
    float _5051 = -_3995;
    float _5053 = fma(_5013, _5041, _5051);
    float _5055 = _5043 + 0.5;
    float _5057 = _4541 + 0.5;
    float _5059 = in.m_81.x;
    float _5061 = in.m_81.y;
    float _5063 = in.m_81.z;
    float _5065 = fma(_4521, _5045, _5053);
    float _5067 = _4935 + 0.5;
    float _5069 = _4975 + 0.5;
    float _5071 = _5037 + 0.5;
    float _5073 = _5065 + 0.5;
    float _5075 = _5039 + 0.5;
    float _5077 = _4999 + 0.5;
    bool _5079 = !_3793;
    int _5081 = _5079 ? 0 : 1;
    out.m_83.x = _5049;
    out.m_83.y = _5057;
    bool _5083 = !_3797;
    int _5085 = _5083 ? 0 : 1;
    int _5087 = abs(_5081);
    out.m_85.x = _5067;
    out.m_85.y = _5071;
    out.m_85.z = _5069;
    out.m_85.w = _5075;
    int _5089 = abs(_5085);
    bool _5091 = !_3801;
    int _5093 = _5091 ? 0 : 1;
    out.m_87.x = _5047;
    out.m_87.y = _5073;
    float _5095 = float(_5087);
    out.m_89.x = _5077;
    out.m_89.y = _5055;
    float _5097 = float(_3907);
    float _5099 = _4939;
    float _5101 = as_type<float>(_4739);
    float _5103 = as_type<float>(_4767);
    float _5105 = _4575;
    if (_3495)
    {
        return out;
    }
    float _5107 = -_3655;
    float _5109 = fma(_5107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3135);
    float _5111 = _5095 * _5097;
    float _5113 = float(_3011);
    float _5115 = -_3651;
    float _5117 = fma(_5115, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2923);
    float _5119 = float(_5089);
    float _5121 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5123 = _5109 + _5121;
    float _5125 = _5111 * (-2.0);
    float _5127 = -_4285;
    float _5129 = fma(_5127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3337);
    float _5131 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5133 = _5117 + _5131;
    float _5135 = _5123 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5137 = _5119 * _5113;
    float _5139 = _1525 + (-0.5);
    float _5141 = fma(_5125, _5059, _5059);
    float _5143 = _1220 + _1535;
    float _5145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5147 = _5129 + _5145;
    float _5149 = fma(_5133, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5135);
    float _5151 = fma(_5139, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5141);
    float _5153 = _5143 + (-1.0);
    float _5155 = _5137 * (-2.0);
    float _5157 = fma(_5147, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5149);
    float _5159 = _1220 + (-0.5);
    float _5161 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5163 = fma(_5155, _5061, _5061);
    float _5165 = fma(_3521, _5125, _3521);
    bool _5167 = _5157 >= 0.0;
    float _5169 = fma(_5161, _5155, _5161);
    float _5171 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5163);
    float _5173 = fma(_5165, _4565, _5151);
    int _5175 = abs(_5093);
    float _5177 = sqrt(_4347);
    float _5179 = fma(_5169, _4565, _5171);
    float _5181 = _5173 * 0.15915493667125701904296875;
    float _5183 = _1525 + _1535;
    float _5185 = _5179 * 0.15915493667125701904296875;
    float _5187 = float(_3393);
    float _5189 = _5155;
    float _5191 = _5137;
    if (_5167)
    {
        _5189 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5193 = _5189;
    float _5195 = _5181 * 6.283185482025146484375;
    float _5197 = sin(_5195);
    float _5199 = float(_5175);
    int _5201 = as_type<int>(_5193);
    if (_5167)
    {
        out.m_53.x = 0.0;
    }
    if (_5167)
    {
        float _5203 = _5193 * 5.0;
        _5201 = as_type<int>(_5203);
    }
    int _5205 = _5201;
    float _5207 = _5199 * _5187;
    float _5209 = _5183 + (-1.0);
    float _5211 = _5181 * 6.283185482025146484375;
    float _5213 = cos(_5211);
    if (_5167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14410 = as_type<float>(_5205);
        out.gl_Position.z = _14410;
    }
    float _5215 = _5207 * (-2.0);
    float _5217 = _5185 * 6.283185482025146484375;
    float _5219 = sin(_5217);
    if (_5167)
    {
        return out;
    }
    float _5221 = -_3135;
    float _5223 = _5221 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5225 = -_2923;
    float _5227 = _5225 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5229 = fma(_5215, _5063, _5063);
    float _5231 = -_3337;
    float _5233 = _5231 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5235 = _5223 * _5223;
    float _5237 = fma(_5209, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5239 = _1535 + (-0.5);
    float _5241 = _5185 * 6.283185482025146484375;
    float _5243 = cos(_5241);
    float _5245 = fma(_5227, _5227, _5235);
    float _5247 = fma(_5237, _5215, _5237);
    float _5249 = fma(_5239, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5229);
    float _5251 = _3617 * _5177;
    float _5253 = fma(_5233, _5233, _5245);
    float _5255 = _5197 * _5219;
    float _5257 = fma(_5247, _4565, _5249);
    float _5259 = rsqrt(_5253);
    float _5261 = _5257 * 0.15915493667125701904296875;
    float _5263 = in.m_91.x;
    float _5265 = in.m_91.y;
    float _5267 = in.m_91.z;
    float _5269 = _5213 * _5243;
    float _5271 = _5197 * _5243;
    float _5273 = _5261 * 6.283185482025146484375;
    float _5275 = sin(_5273);
    float _5277 = _5227 * _5259;
    float _5279 = _5233 * _5259;
    float _5281 = _5223 * _5259;
    float _5283 = _5261 * 6.283185482025146484375;
    float _5285 = cos(_5283);
    float _5287 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5289 = _5277 * _5287;
    float _5291 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5293 = _5279 * _5291;
    float _5295 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5297 = _5281 * _5295;
    float _5299 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5301 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5303 = -_5289;
    float _5305 = fma(_5279, _5301, _5303);
    float _5307 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5309 = -_5293;
    float _5311 = fma(_5281, _5307, _5309);
    float _5313 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5315 = -_5297;
    float _5317 = fma(_5277, _5313, _5315);
    float _5319 = fma(_5275, _5269, _5255);
    float _5321 = _5305 * _5305;
    float _5323 = fma(_5275, _5255, _5269);
    float _5325 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5327 = fma(_5311, _5311, _5321);
    float _5329 = _5213 * _5219;
    float _5331 = _5251 * _5325;
    float _5333 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5335 = fma(_5317, _5317, _5327);
    float _5337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5265);
    float _5339 = _5213 * _5285;
    float _5341 = _5243 * _5285;
    float _5343 = rsqrt(_5335);
    float _5345 = _5337 * _5331;
    float _5347 = _5251 * _5299;
    float _5349 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5263);
    float _5351 = _5197 * _5285;
    float _5353 = _5219 * _5285;
    float _5355 = _5251 * _5333;
    float _5357 = _5349 * _5347;
    float _5359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5267);
    float _5361 = _5339 * _5345;
    float _5363 = -_5329;
    float _5365 = fma(_5275, _5271, _5363);
    float _5367 = -_5271;
    float _5369 = fma(_5275, _5329, _5367);
    float _5371 = _5359 * _5355;
    float _5373 = fma(_5319, _5357, _5361);
    float _5375 = _5351 * _5345;
    float _5377 = _5311 * _5343;
    float _5379 = _5305 * _5343;
    float _5381 = _5317 * _5343;
    float _5383 = -_5345;
    float _5385 = _5275 * _5383;
    float _5387 = _5281 * _5377;
    float _5389 = _5279 * _5379;
    float _5391 = fma(_5369, _5371, _5373);
    float _5393 = fma(_5341, _5357, _5385);
    float _5395 = -_5387;
    float _5397 = fma(_5277, _5379, _5395);
    float _5399 = -_5389;
    float _5401 = fma(_5281, _5381, _5399);
    float _5403 = fma(_5365, _5357, _5375);
    float _5405 = fma(_5353, _5371, _5393);
    float _5407 = _5397 * _5391;
    float _5409 = _5401 * _5391;
    float _5411 = fma(_5323, _5371, _5403);
    float _5413 = fma(_5381, _5405, _5407);
    float _5415 = fma(_5377, _5405, _5409);
    float _5417 = fma(_5279, _5411, _5413);
    float _5419 = fma(_5277, _5411, _5415);
    float _5421 = _3337 + _5417;
    float _5423 = _2923 + _5419;
    float _5425 = _5277 * _5381;
    float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5429 = _5421 + _5427;
    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5433 = _5423 + _5431;
    float _5435 = -_5425;
    float _5437 = fma(_5279, _5377, _5435);
    float _5439 = _5429 * _5429;
    float _5441 = _5433 * _5433;
    float _5443 = _5437 * _5391;
    float _5445 = _5441 + _5439;
    float _5447 = fma(_5379, _5405, _5443);
    float _5449 = sqrt(_5445);
    float _5451 = fma(_5281, _5411, _5447);
    float _5453 = _3135 + _5451;
    bool _5455 = _5449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5457 = _5423;
    float _5459 = _5421;
    float _5461 = _5441;
    float _5463 = _5439;
    if (!_5455)
    {
        _5099 = _5453;
    }
    float _5465 = _5099;
    bool _5467 = !_5455;
    float _5469 = _5465;
    if (!_5467)
    {
        float _5471 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5475 = _5449 + _5473;
        float _5477 = rsqrt(_5445);
        float _5479 = _5475 * _5471;
        float _5481 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5483 = _5479 * 0.15915493667125701904296875;
        float _5485 = _5483 * 6.283185482025146484375;
        float _5487 = sin(_5485);
        float _5489 = _5483 * 6.283185482025146484375;
        float _5491 = cos(_5489);
        float _5493 = fma(_5487, _5481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5495 = _5477 * _5493;
        float _5497 = _5491 + (-1.0);
        float _5499 = fma(_5433, _5495, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5501 = fma(_5429, _5495, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5503 = _5497 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5507 = _5499 + _5505;
        float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5511 = _5501 + _5509;
        float _5513 = fma(_5453, _5491, _5503);
        float _5515 = _5507 * _5507;
        float _5517 = _5511 * _5511;
        _5457 = _5499;
        _5459 = _5501;
        _5469 = _5513;
        _5461 = _5515;
        _5463 = _5517;
    }
    float _5519 = _5457;
    float _5521 = _5459;
    float _5523 = _5469;
    float _5525 = _5461;
    float _5527 = _5463;
    float _5529 = fma(_5519, 6.2500002968590706586837768554688e-05, 0.5);
    float _5531 = fma(_5521, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14903 = float2(_5529, _5531);
    float3 _5535 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14903, float2(0.0), isnan(_14903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14903, float2(0.0), isnan(_14903)), level(0.0)).xyz;
    float _5537 = _5535.x;
    float _5539 = _5535.y;
    float _5541 = _5535.z;
    float _5543 = in.m_93.x;
    float _5545 = in.m_93.y;
    float _5547 = in.m_93.z;
    bool _5549 = _5265 != 0.0;
    bool _5551 = isnan(_5265);
    bool _5553 = _5549 || _5551;
    bool _5555 = isnan(0.0);
    bool _5557 = _5553 || _5555;
    float _5559 = in.m_95.x;
    float _5561 = in.m_95.y;
    float _5563 = in.m_95.z;
    float _5565 = in.m_95.w;
    bool _5567 = _5263 == 0.0;
    bool _5569 = !_5557;
    bool _5571 = _5567 && _5569;
    bool _5573 = _5267 == 0.0;
    bool _5575 = _5573 && _5571;
    float _5577 = _5543;
    if (_5575)
    {
        _5191 = _5543;
    }
    float _5579 = _5191;
    float _5581 = _5579;
    if (_5575)
    {
        _3005 = _5547;
    }
    float _5583 = _3005;
    float _5585 = _5583;
    if (_5575)
    {
        _5101 = _5545;
    }
    float _5587 = _5101;
    float _5589 = _5587;
    if (_5575)
    {
        _5103 = _5579;
    }
    float _5591 = _5103;
    float _5593 = _5591;
    if (!_5575)
    {
        _5581 = _5543;
    }
    float _5595 = _5581;
    if (_5575)
    {
        _5105 = _5583;
    }
    float _5597 = _5105;
    float _5599 = _5597;
    if (!_5575)
    {
        _5585 = _5547;
    }
    float _5601 = _5585;
    if (!_5575)
    {
        float _5603 = fma(_5263, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5595);
        _5593 = _5603;
    }
    float _5605 = _5593;
    if (_5575)
    {
        _5577 = _5587;
    }
    float _5607 = _5577;
    float _5609 = _5563 * _5595;
    float _5611 = _5607;
    if (!_5575)
    {
        _5589 = _5545;
    }
    float _5613 = _5589;
    float _5615 = _5561 * _5601;
    if (!_5575)
    {
        float _5617 = fma(_5267, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5601);
        _5599 = _5617;
    }
    float _5619 = _5599;
    float _5621 = -_5609;
    float _5623 = fma(_5559, _5601, _5621);
    float _5625 = _5339 * _5437;
    float _5627 = _5559 * _5613;
    float _5629 = -_5615;
    float _5631 = fma(_5563, _5613, _5629);
    if (!_5575)
    {
        float _5633 = fma(_5265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5613);
        _5611 = _5633;
    }
    float _5635 = _5611;
    float _5637 = _5319 * _5401;
    float _5639 = -_5627;
    float _5641 = fma(_5561, _5595, _5639);
    float _5643 = _5319 * _5437;
    float _5645 = _5319 * _5397;
    float _5647 = _5339 * _5401;
    float _5649 = _5623 * _5565;
    float _5651 = _5631 * _5565;
    float _5653 = _5339 * _5397;
    float _5655 = _5641 * _5565;
    float _5657 = _5369 * _5401;
    float _5659 = _5369 * _5437;
    float _5661 = _5369 * _5397;
    float _5663 = fma(_5341, _5377, _5637);
    float _5665 = fma(_5341, _5379, _5643);
    float _5667 = -_5275;
    float _5669 = fma(_5667, _5379, _5625);
    float _5671 = fma(_5341, _5381, _5645);
    float _5673 = -_5275;
    float _5675 = fma(_5673, _5377, _5647);
    float _5677 = -_5275;
    float _5679 = fma(_5677, _5381, _5653);
    float _5681 = fma(_5353, _5377, _5657);
    float _5683 = fma(_5353, _5379, _5659);
    float _5685 = fma(_5353, _5381, _5661);
    float _5687 = fma(_5351, _5281, _5669);
    float _5689 = fma(_5365, _5277, _5663);
    float _5691 = fma(_5351, _5277, _5675);
    float _5693 = fma(_5351, _5279, _5679);
    float _5695 = fma(_5323, _5277, _5681);
    float _5697 = fma(_5323, _5281, _5683);
    float _5699 = fma(_5323, _5279, _5685);
    float _5701 = fma(_5365, _5281, _5665);
    float _5703 = _5687 * _5561;
    float _5705 = _5687 * _5635;
    float _5707 = fma(_5365, _5279, _5671);
    float _5709 = _5691 * _5635;
    float _5711 = _5649 * _5691;
    float _5713 = _5649 * _5687;
    float _5715 = _5693 * _5561;
    float _5717 = _5693 * _5635;
    float _5719 = _5649 * _5693;
    float _5721 = fma(_5701, _5559, _5703);
    float _5723 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5725 = _5523 + _5723;
    float _5727 = _5691 * _5561;
    float _5729 = fma(_5689, _5605, _5709);
    float _5731 = fma(_5707, _5559, _5715);
    float _5733 = fma(_5725, _5725, _5525);
    float _5735 = fma(_5689, _5559, _5727);
    float _5737 = fma(_5651, _5689, _5711);
    float _5739 = fma(_5701, _5605, _5705);
    float _5741 = _5733 + _5527;
    float _5743 = fma(_5707, _5605, _5717);
    float _5745 = fma(_5651, _5701, _5713);
    float _5747 = fma(_5651, _5707, _5719);
    float _5749 = fma(_5695, _5563, _5735);
    float _5751 = fma(_5697, _5563, _5721);
    float _5753 = sqrt(_5741);
    float _5755 = fma(_5699, _5563, _5731);
    float _5757 = fma(_5695, _5619, _5729);
    float _5759 = fma(_5655, _5695, _5737);
    float _5761 = fma(_5655, _5697, _5745);
    float _5763 = fma(_5655, _5699, _5747);
    float _5765 = fma(_5697, _5619, _5739);
    float _5767 = fma(_5699, _5619, _5743);
    out.m_97.x = _5749;
    out.m_97.y = _5751;
    out.m_97.z = _5755;
    out.m_99.x = _5759;
    out.m_99.y = _5761;
    out.m_99.z = _5763;
    out.m_101.x = _5757;
    out.m_101.y = _5765;
    out.m_101.z = _5767;
    bool _5769 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5771 = isnan(_5753);
    bool _5773 = _5769 || _5771;
    bool _5775 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5777 = _5773 || _5775;
    float _5779 = _5655;
    if (!_5777)
    {
        _5779 = 1.0;
    }
    float _5781 = _5779;
    out.m_103.x = _5537;
    out.m_103.y = _5539;
    out.m_103.z = _5541;
    bool _5783 = !_5777;
    float _5785 = _5781;
    if (!_5783)
    {
        bool _5787 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5789 = isnan(_5753);
        bool _5791 = _5787 || _5789;
        bool _5793 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5795 = _5791 || _5793;
        if (!_5795)
        {
            float _5797 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5799 = _5753 + _5797;
            float _5801 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5803 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5801;
            float _5805 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5807 = _5805 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5809 = 1.0 / _5803;
            float _5811 = _5799 * _5809;
            float _5813 = fma(_5811, _5807, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5785 = _5813;
            _5815 = true;
        }
        else
        {
            bool _5817 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5819 = isnan(_5753);
            bool _5821 = _5817 || _5819;
            bool _5823 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5825 = _5821 || _5823;
            if (!_5825)
            {
                float _5827 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5829 = _5753 + _5827;
                float _5831 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5833 = _5831 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5835 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5837 = _5835 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5839 = 1.0 / _5833;
                float _5841 = _5829 * _5839;
                float _5843 = fma(_5841, _5837, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5785 = _5843;
                _5815 = true;
            }
            else
            {
                _5785 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5815 = false;
    float _5845 = _5785;
    float _5847 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5849 = _5523 + _5847;
    float _5851 = _5109 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5853 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5855 = _5519 + _5853;
    float _5857 = fma(_5849, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5859 = fma(_5117, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5851);
    float _5861 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5863 = _5521 + _5861;
    float _5865 = fma(_5855, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5867 = -_3135;
    float _5869 = _5867 + _5857;
    float _5871 = fma(_5129, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5859);
    float _5873 = fma(_5863, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5875 = -_2923;
    float _5877 = _5875 + _5865;
    float _5879 = _5869 * _5869;
    float _5881 = _5871 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5883 = _5109 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5885 = -_3337;
    float _5887 = _5885 + _5873;
    float _5889 = fma(_5877, _5877, _5879);
    float _5891 = 1.0 / _5881;
    float _5893 = fma(_5117, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5883);
    float _5895 = fma(_5887, _5887, _5889);
    float _5897 = fma(_5129, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5893);
    float _5899 = sqrt(_5895);
    float _5901 = _5897 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5903 = _5901 + _5881;
    float _5905 = _5903 * _5891;
    float _5907 = _5905 * 0.5;
    bool _5909 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5913 = _5909 || _5911;
    bool _5915 = isnan(0.5);
    bool _5917 = _5913 || _5915;
    float _5919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5921 = fma(_5907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5919);
    bool _5923 = _5899 > 0.0;
    float _5925 = 1.0 / _5921;
    bool _5927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5931 = _5927 || _5929;
    bool _5933 = isnan(0.5);
    bool _5935 = _5931 || _5933;
    float _5937 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5939 = _5907;
    float _5941 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5943 = _5895;
    float _5945 = _5873;
    float _5947 = _5865;
    if (!_5923)
    {
        _5937 = _5865;
    }
    float _5949 = _5937;
    float _5951 = _5949;
    if (!_5923)
    {
        _5939 = _5857;
    }
    float _5953 = _5939;
    float _5955 = _5953;
    float _5957 = _5953;
    if (!_5923)
    {
        _5941 = _5873;
    }
    float _5959 = _5941;
    bool _5961 = !_5923;
    float _5963 = _5959;
    if (!_5961)
    {
        float _5965 = _230 * _230;
        float _5967 = rsqrt(_5895);
        float _5969 = fma(_226, _226, _5965);
        float _5971 = fma(_232, _232, _5969);
        float _5973 = sqrt(_5971);
        float _5975 = _5877 * _5967;
        float _5977 = _5869 * _5967;
        float _5979 = _5887 * _5967;
        bool _5981 = _5973 > 0.0;
        float _5983 = _5973;
        float _5985 = _5967;
        if (!_5981)
        {
            _5983 = _5865;
        }
        float _5987 = _5983;
        _5951 = _5987;
        if (!_5981)
        {
            _5955 = _5857;
        }
        float _5989 = _5955;
        _5957 = _5989;
        if (!_5981)
        {
            _5985 = _5873;
        }
        float _5991 = _5985;
        bool _5993 = !_5981;
        _5963 = _5991;
        if (!_5993)
        {
            float _5995 = rsqrt(_5971);
            float _5997 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5999 = _230 * _5995;
            float _6001 = _226 * _5995;
            float _6003 = _232 * _5995;
            float _6005 = _5977 * _5999;
            float _6007 = fma(_5975, _6001, _6005);
            float _6009 = _5997 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6011 = fma(_5979, _6003, _6007);
            float _6013 = _6011 * _6009;
            float _6015 = fma(_226, _6013, _5865);
            float _6017 = fma(_230, _6013, _5857);
            float _6019 = fma(_232, _6013, _5873);
            _5957 = _6017;
            _5963 = _6019;
            _5951 = _6015;
            _5943 = _5997;
        }
    }
    float _6021 = _5957;
    float _6023 = _5963;
    float _6025 = _5951;
    float _6027 = _5943;
    float _6029 = -_3655;
    float _6031 = fma(_6029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6021);
    float _6033 = -_4285;
    float _6035 = fma(_6033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6023);
    float _6037 = -_3651;
    float _6039 = fma(_6037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6025);
    float _6041 = _6027;
    float _6043 = _6039;
    float _6045 = _6035;
    if (_5917)
    {
        _6041 = 1.0;
    }
    float _6047 = _6041;
    float _6049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6051 = _5925 * _6049;
    float _6053 = _6047;
    if (_5935)
    {
        _4561 = _6031;
    }
    float _6055 = _4561;
    float _6057 = _6055;
    if (!_5935)
    {
        float _6059 = _5123 * _5123;
        float _6061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6063 = -_3337;
        float _6065 = _6063 + _6023;
        float _6067 = -_3135;
        float _6069 = _6067 + _6021;
        float _6071 = fma(_5133, _5133, _6059);
        float _6073 = fma(_5147, _5147, _6071);
        float _6075 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6077 = sqrt(_6073);
        float _6079 = 1.0 / _5251;
        float _6081 = _6075 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6083 = precise::min(_6077, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6085 = _6083 * _6061;
        float _6087 = _6085 * _6079;
        float _6089 = -_2923;
        float _6091 = _6089 + _6025;
        float _6093 = _6081 * _6087;
        float _6095 = _6065 * _6087;
        float _6097 = fma(_6069, _6093, _5109);
        float _6099 = fma(_6091, _6093, _5117);
        float _6101 = fma(_6081, _6095, _5129);
        _6057 = _6097;
        _6043 = _6099;
        _6045 = _6101;
        _236 = _6061;
    }
    float _6103 = _6057;
    float _6105 = _6043;
    float _6107 = _6045;
    float _6109 = _236;
    float _6111 = _6109;
    if (!_5917)
    {
        float _6113 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6115 = _6113 * 0.15915493667125701904296875;
        float _6117 = _6115 * 6.283185482025146484375;
        float _6119 = cos(_6117);
        float _6121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6123 = _6121 * 0.15915493667125701904296875;
        float _6125 = _6115 * 6.283185482025146484375;
        float _6127 = sin(_6125);
        float _6129 = 1.0 / _6119;
        float _6131 = _6123 * 6.283185482025146484375;
        float _6133 = cos(_6131);
        float _6135 = _6127 * _6129;
        float _6137 = _6123 * 6.283185482025146484375;
        float _6139 = sin(_6137);
        float _6141 = _6133 * _6135;
        float _6143 = 1.0 / _6141;
        float _6145 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6147 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6145;
        float _6149 = 1.0 / _6147;
        float _6151 = _6139 * _6143;
        float _6153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6155 = fma(_6051, _6151, _6153);
        float _6157 = _6155 * _6149;
        float _6159 = precise::clamp(_6157, 0.0, 1.0);
        _6053 = _6159;
    }
    float _6161 = _6053;
    float _6163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6165 = _6103 + _6163;
    float _6167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6169 = _6105 + _6167;
    float _6171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6173 = _6107 + _6171;
    float _6175 = _6165 * _6165;
    float _6177 = fma(_6169, _6169, _6175);
    float _6179 = fma(_6173, _6173, _6177);
    float _6181 = rsqrt(_6179);
    float _6183 = sqrt(_6179);
    float _6185 = _6181 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6187 = _6169 * _6185;
    float _6189 = _6173 * _6185;
    float _6191 = _6187 * _6187;
    float _6193 = _6189 * _6189;
    float _6195 = _6191 + _6193;
    float _6197 = sqrt(_6195);
    bool _6199 = _6197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6203 = _6197 + _6201;
    float _6205 = _6181;
    float _6207 = _6195;
    float _6209 = _6203;
    float _6211 = _6165;
    if (_6199)
    {
        float _6213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6205 = _6213;
    }
    float _6215 = _6205;
    if (_6199)
    {
        float _6217 = rsqrt(_6195);
        _6207 = _6217;
    }
    float _6219 = _6207;
    float _6221 = _6219;
    if (_6199)
    {
        float _6223 = _6203 * _6215;
        _6209 = _6223;
    }
    float _6225 = _6209;
    if (_6199)
    {
        float _6227 = _6225 * 0.15915493667125701904296875;
        _5945 = _6227;
    }
    float _6229 = _5945;
    float _6231 = _6173;
    if (_6199)
    {
        float _6233 = _6229 * 6.283185482025146484375;
        float _6235 = sin(_6233);
        _6231 = _6235;
    }
    float _6237 = _6231;
    float _6239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6241 = precise::max(0.0, _6239);
    float _6243 = _6215;
    if (_6199)
    {
        float _6245 = _6229 * 6.283185482025146484375;
        float _6247 = cos(_6245);
        _6243 = _6247;
    }
    float _6249 = _6243;
    float _6251 = -_6185;
    float _6253 = -_6241;
    float _6255 = fma(_6165, _6251, _6253);
    float _6257 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6199)
    {
        float _6259 = _6255 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6211 = _6259;
    }
    float _6261 = _6211;
    float _6263 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6265 = fma(_5117, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6267 = _6261;
    float _6269 = _6237;
    if (_6199)
    {
        float _6271 = fma(_6237, _6261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6267 = _6271;
    }
    float _6273 = _6267;
    float _6275 = _6273;
    if (!_6199)
    {
        _6269 = _6187;
    }
    float _6277 = _6269;
    float _6279 = _6277;
    float _6281 = _6249;
    if (_6199)
    {
        float _6283 = _6249 + (-1.0);
        _6257 = _6283;
    }
    float _6285 = _6257;
    float _6287 = _6285;
    if (_6199)
    {
        float _6289 = _6219 * _6273;
        _5947 = _6289;
    }
    float _6291 = _5947;
    if (!_6199)
    {
        _6275 = _6255;
    }
    float _6293 = _6275;
    float _6295 = _6293;
    if (_6199)
    {
        float _6297 = _6285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6111 = _6297;
    }
    float _6299 = _6111;
    if (_6199)
    {
        float _6301 = _6187 * _6291;
        _6279 = _6301;
    }
    float _6303 = _6279;
    if (!_6199)
    {
        _6287 = _6189;
    }
    float _6305 = _6287;
    float _6307 = _6305;
    if (_6199)
    {
        float _6309 = _6189 * _6291;
        _6307 = _6309;
    }
    float _6311 = _6307;
    if (!_6199)
    {
        _6221 = _6191;
    }
    float _6313 = _6221;
    float _6315 = _6313;
    if (_6199)
    {
        float _6317 = fma(_6255, _6249, _6299);
        _6295 = _6317;
    }
    float _6319 = _6295;
    if (_6199)
    {
        float _6321 = _6303 * _6303;
        _6315 = _6321;
    }
    float _6323 = _6315;
    if (!_6199)
    {
        _6281 = _6193;
    }
    float _6325 = _6281;
    float _6327 = _6325;
    if (_6199)
    {
        float _6329 = _6311 * _6311;
        _6327 = _6329;
    }
    float _6331 = _6327;
    float _6333 = fma(_6319, _6319, _6323);
    float _6335 = floor(_6265);
    float _6337 = _6333 + _6331;
    float _6339 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6263);
    float _6341 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6343 = fma(_6183, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6341);
    float _6345 = precise::clamp(_6343, 0.0, 1.0);
    float _6347 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6339);
    float _6349 = rsqrt(_6337);
    float _6351 = -_6345;
    float _6353 = _6351 + 1.0;
    float _6355 = _6347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6359 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6361 = _6355 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6363 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6365 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6367 = abs(_6353);
    float _6369 = log2(_6367);
    float _6371 = -_6361;
    float _6373 = fma(_6371, _6357, 1.0);
    float _6375 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6377 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6359);
    float _6379 = -_6335;
    float _6381 = _6265 + _6379;
    float _6383 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6375);
    float _6385 = _6349 * _6303;
    float _6387 = floor(_6363);
    float _6389 = _6349 * _6319;
    float _6391 = _6349 * _6311;
    float _6393 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6365);
    float _6395 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6383);
    float _6397 = _6385 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6399 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6377);
    float _6401 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6393);
    float _6403 = _6395 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6405 = -_6397;
    float _6407 = fma(_6389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6405);
    float _6409 = _6369 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6411 = _6401 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6413 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6415 = -_6391;
    float _6417 = fma(_6415, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6407);
    float _6419 = _6399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6421 = exp2(_6409);
    float _6423 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6413);
    float _6425 = fma(_6417, -0.5, 0.5);
    float _6427 = fma(_6417, 0.5, 0.5);
    float _6429 = -_6387;
    float _6431 = _6363 + _6429;
    float _6433 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6423);
    float _6435 = fma(_6427, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6437 = log2(_6373);
    float _6439 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6433);
    float _6441 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6443 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6445 = fma(_6427, _6435, -0.212114393711090087890625);
    float _6447 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6441);
    float _6449 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6443);
    float _6451 = sqrt(_6425);
    float _6453 = fma(_6427, _6445, 1.570728778839111328125);
    float _6455 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6447);
    float _6457 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6449);
    float _6459 = 1.0 / _6439;
    float _6461 = _6389 + 1.0;
    float _6463 = _6437 * 0.693147182464599609375;
    float _6465 = -_6389;
    float _6467 = fma(_6421, _6461, _6465);
    float _6469 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6455);
    float _6471 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6457);
    float _6473 = _6451 * 0.636619746685028076171875;
    float _6475 = fma(_6467, 0.5, 0.5);
    float _6477 = -_6453;
    float _6479 = fma(_6473, _6477, 1.0);
    float _6481 = _6463 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16479 = float2(_6381, _6431);
    float _6483 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16479, float2(0.0), isnan(_16479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16479, float2(0.0), isnan(_16479)), level(0.0)).x;
    float _6485 = _6469 * _6459;
    float _6487 = _6471 * _6459;
    float _6489 = fma(_6485, 0.5, 0.5);
    float _6491 = fma(_6487, -0.5, 0.5);
    float3 _16498 = float3(_6489, _6491, _6481);
    float _6493 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16498, float3(0.0), isnan(_16498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16498, float3(0.0), isnan(_16498)), level(0.0)).x;
    float3 _16509 = float3(_6489, _6491, _6481);
    float4 _6496 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16509, float3(0.0), isnan(_16509)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16509, float3(0.0), isnan(_16509)), level(0.0)).xyzw;
    float _6498 = _6496.x;
    float _6500 = _6496.y;
    float _6502 = _6496.z;
    float _6504 = _6496.w;
    float2 _16525 = float2(_6479, _6475);
    float3 _6506 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16525, float2(0.0), isnan(_16525)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16525, float2(0.0), isnan(_16525)), level(0.0)).xyz;
    float _6508 = _6506.x;
    float _6510 = _6506.y;
    float _6512 = _6506.z;
    float _6514 = abs(_6051);
    float _6516 = log2(_6514);
    float _6518 = _6369 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6520 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6522 = isnan(_6183);
    bool _6524 = _6520 || _6522;
    bool _6526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6528 = _6524 || _6526;
    float _6530 = exp2(_6518);
    float _6532 = _6516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6534 = exp2(_6532);
    float _6536 = in.m_105.x;
    float _6538 = -_6530;
    float _6540 = _6538 + 1.0;
    float _6542 = _6540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6544 = fma(_6534, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6546 = precise::clamp(_6544, 0.0, 1.0);
    float _6548 = fma(_6546, -2.0, 3.0);
    float _6550 = _6546 * _6546;
    float _6552 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6554 = _6550 * _6548;
    float _6556 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6552);
    float _6558 = -_6554;
    float _6560 = _6558 + 1.0;
    float _6562 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6556);
    float _6564 = fma(_6560, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6554);
    bool _6566 = _6051 <= 8000.0;
    bool _6568 = isnan(_6051);
    bool _6570 = _6566 || _6568;
    bool _6572 = isnan(8000.0);
    bool _6574 = _6570 || _6572;
    float _6576 = float(_6574);
    float _6578 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6562);
    float _6580 = _6439 * 0.5;
    float _6582 = _6469 + _6439;
    float _6584 = _6576 * _6564;
    float _6586 = fma(_6471, -0.5, _6580);
    out.gl_Position.x = _6469;
    out.gl_Position.y = _6471;
    out.gl_Position.z = _6578;
    out.gl_Position.w = _6439;
    float _6588 = _6578 + _6439;
    float _6590 = _6584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6592 = _6582 * 0.5;
    float _6594 = _6588 * 0.5;
    out.m_107.x = _6592;
    out.m_107.y = _6586;
    out.m_107.z = _6594;
    out.m_107.w = _6439;
    float _6596 = -_6542;
    float _6598 = _6596 + 1.0;
    float _6600 = _6439;
    float _6602 = _6578;
    float _6604 = _6471;
    float _6606 = _6586;
    float _6608 = _6592;
    float _6610 = _6598;
    if (!_6528)
    {
        _6600 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6612 = _6600;
    float _6614 = _6612;
    float _6616 = _6612;
    if (!_6528)
    {
        _6602 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6618 = _6602;
    float _6620 = _6618;
    float _6622 = _6618;
    if (!_6528)
    {
        _6604 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6624 = _6604;
    float _6626 = _6161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6628 = _6624;
    float _6630 = _6624;
    if (!_6528)
    {
        _6606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6632 = _6606;
    float _6634 = _6632;
    float _6636 = _6632;
    if (!_6528)
    {
        _6608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6638 = _6608;
    float _6640 = -_6483;
    float _6642 = _6640 + 1.0;
    float _6644 = _6642 * _6590;
    float _6646 = precise::clamp(_6644, 0.0, 1.0);
    float _6648 = -_6646;
    float _6650 = fma(_6648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6652 = _6542 * _6493;
    float _6654 = _6650 * _6536;
    float _6656 = _6504 * _6652;
    float _6658 = _6512 * _6652;
    float _6660 = _6654 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6662 = fma(_6508, _6656, _6498);
    float _6664 = fma(_6510, _6656, _6500);
    float _6666 = _6504 * _6598;
    float _6668 = fma(_6504, _6658, _6502);
    out.m_109.x = _6660;
    float _6670 = _6638;
    float _6672 = _6638;
    if (!_6528)
    {
        _6610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6674 = _6610;
    out.m_111.x = _6662;
    out.m_111.y = _6664;
    out.m_111.z = _6668;
    out.m_111.w = _6666;
    bool _6676 = !_6528;
    float _6678 = _6674;
    float _6680 = _6674;
    if (!_6676)
    {
        bool _6682 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6684 = isnan(_6183);
        bool _6686 = _6682 || _6684;
        bool _6688 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6690 = _6686 || _6688;
        if (!_6690)
        {
            float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6694 = _6183 + _6692;
            float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6698 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6696;
            float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6708 = 1.0 / _6698;
            float _6710 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6712 = _6710 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6714 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6722 = _6694 * _6708;
            float _6724 = precise::clamp(_6722, 0.0, 1.0);
            float _6726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6728 = _6726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6730 = fma(_6724, _6702, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6732 = fma(_6724, _6706, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6734 = fma(_6724, _6728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6736 = fma(_6724, _6712, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6738 = fma(_6724, _6716, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6740 = fma(_6724, _6720, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6630 = _6730;
            _6672 = _6738;
            _6622 = _6732;
            _6636 = _6736;
            _6680 = _6734;
            _6616 = _6740;
            _6742 = true;
        }
        else
        {
            bool _6744 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6746 = isnan(_6183);
            bool _6748 = _6744 || _6746;
            bool _6750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6752 = _6748 || _6750;
            if (!_6752)
            {
                _6634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6754 = _6634;
            _6636 = _6754;
            if (!_6752)
            {
                _6670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6756 = _6670;
            _6672 = _6756;
            if (!_6752)
            {
                _6614 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6758 = _6614;
            _6616 = _6758;
            if (!_6752)
            {
                _6620 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6760 = _6620;
            _6622 = _6760;
            if (!_6752)
            {
                _6628 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6762 = _6628;
            _6630 = _6762;
            if (!_6752)
            {
                _6678 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6764 = _6678;
            bool _6766 = !_6752;
            _6680 = _6764;
            if (!_6766)
            {
                bool _6768 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6770 = isnan(_6183);
                bool _6772 = _6768 || _6770;
                bool _6774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6776 = _6772 || _6774;
                if (!_6776)
                {
                    float _6778 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6780 = _6183 + _6778;
                    float _6782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6784 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6782;
                    float _6786 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6788 = _6786 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6792 = _6790 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6794 = 1.0 / _6784;
                    float _6796 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6798 = _6796 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6800 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6802 = _6800 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6808 = _6780 * _6794;
                    float _6810 = precise::clamp(_6808, 0.0, 1.0);
                    float _6812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6814 = _6812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6816 = fma(_6810, _6788, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6818 = fma(_6810, _6792, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6820 = fma(_6810, _6814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6822 = fma(_6810, _6798, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6824 = fma(_6810, _6802, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6826 = fma(_6810, _6806, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6630 = _6816;
                    _6672 = _6824;
                    _6622 = _6818;
                    _6636 = _6822;
                    _6680 = _6820;
                    _6616 = _6826;
                    _6742 = true;
                }
                else
                {
                    _6630 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6622 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6680 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6616 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6742 = false;
    float _6828 = _6630;
    float _6830 = _6672;
    float _6832 = _6622;
    float _6834 = _6636;
    float _6836 = _6680;
    float _6838 = _6616;
    float _6840 = _6626 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6842 = fma(_5765, -0.5, 0.5);
    float _6844 = precise::clamp(_6842, 0.0, 1.0);
    float _6846 = -_6828;
    float _6848 = _6830 + _6846;
    float _6850 = -_6832;
    float _6852 = _6834 + _6850;
    out.m_53.x = _6840;
    float _6854 = fma(_6844, _6848, _6828);
    float _6856 = -_6836;
    float _6858 = _6838 + _6856;
    float _6860 = fma(_6844, _6852, _6832);
    float _6862 = _6854 * 0.586610972881317138671875;
    bool _6864 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6866 = fma(_6844, _6858, _6836);
    out.m_113.x = 0.0;
    float _6868 = fma(_6860, 0.298911988735198974609375, _6862);
    bool _6870 = _6161 > 0.0;
    bool _6872 = isnan(_6161);
    bool _6874 = _6870 || _6872;
    bool _6876 = isnan(0.0);
    bool _6878 = _6874 || _6876;
    float _6880 = fma(_6866, 0.114477999508380889892578125, _6868);
    float _6882 = -_6880;
    float _6884 = _6860 + _6882;
    float _6886 = -_6880;
    float _6888 = _6854 + _6886;
    float _6890 = -_6880;
    float _6892 = _6866 + _6890;
    float _6894 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    float _6896 = fma(_6888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    float _6898 = fma(_6892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    bool _6900 = !_6864;
    if (!_6900)
    {
        float _6902 = -_6103;
        float _6904 = _6902 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6906 = -_6105;
        float _6908 = _6906 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6910 = -_6107;
        float _6912 = _6910 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6914 = _6904 * _6904;
        float _6916 = fma(_6908, _6908, _6914);
        float _6918 = fma(_6912, _6912, _6916);
        float _6920 = sqrt(_6918);
        float _6922 = rsqrt(_6918);
        float _6924 = -_6920;
        float _6926 = _6924 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6928 = _6926 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6930 = precise::clamp(_6928, 0.0, 1.0);
        float _6932 = _6908 * _6922;
        float _6934 = _6904 * _6922;
        float _6936 = abs(_6930);
        float _6938 = log2(_6936);
        float _6940 = _6912 * _6922;
        float _6942 = _6932 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6944 = _5765 * _6934;
        float _6946 = -_6934;
        float _6948 = -_6942;
        float _6950 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6948);
        float _6952 = fma(_5757, _6932, _6944);
        float _6954 = -_6940;
        float _6956 = fma(_6954, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6950);
        float _6958 = fma(_5767, _6940, _6952);
        float _6960 = precise::clamp(_6958, 0.0, 1.0);
        float _6962 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6964 = _6956 + _6962;
        float _6966 = _6938 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6968 = _6964 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6970 = precise::clamp(_6968, 0.0, 1.0);
        float _6972 = exp2(_6966);
        float _6974 = _6972 * _6970;
        float _6976 = _6960 * _6974;
        float _6978 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6980 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6982 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6978;
        out.m_113.y = _6980;
        out.m_113.z = _6982;
    }
    out.m_115.x = _6894;
    out.m_115.y = _6896;
    out.m_115.z = _6898;
    if (_6878)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _6984 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6984;
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
    bool _6742 = false;
    bool _5815 = false;
    bool _1206 = false;
    bool _882 = false;
    bool _740 = false;
    bool _586 = false;
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
        float _7041 = as_type<float>(_150);
        out.gl_Position.z = _7041;
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
        float _7111 = as_type<float>(_188);
        out.gl_Position.z = _7111;
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
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _276 = _274 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _286 = 1.0 / _272;
    float _288 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _290 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _288;
    float _292 = 1.0 / _280;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _296 = _264 + _294;
    bool _298 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _300 = 1.0 / _284;
    float _302 = _296 * _286;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _306 = _264 + _304;
    float _308 = 1.0 / _276;
    float _310 = _306 * _292;
    bool _312 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _314 = isnan(_264);
    bool _316 = _312 || _314;
    bool _318 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _320 = _316 || _318;
    float _322 = float(_320);
    bool _324 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _326 = isnan(_264);
    bool _328 = _324 || _326;
    bool _330 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _332 = _328 || _330;
    float _334 = float(_332);
    float _336 = -_322;
    float _338 = _336 + 1.0;
    float _340 = 1.0 / _290;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _344 = _264 + _342;
    float _346 = -_334;
    float _348 = _346 + 1.0;
    float _350 = _344 * _300;
    bool _352 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_264);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _268 * _308;
    bool _366 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _368 = isnan(_264);
    bool _370 = _366 || _368;
    bool _372 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _374 = _370 || _372;
    float _376 = float(_374);
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _380 = _264 + _378;
    float _382 = _362 * _338;
    bool _384 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _386 = isnan(_264);
    bool _388 = _384 || _386;
    bool _390 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _392 = _388 || _390;
    float _394 = float(_392);
    float _396 = -_362;
    float _398 = _396 + 1.0;
    float _400 = -_376;
    float _402 = _400 + 1.0;
    bool _404 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _406 = isnan(_264);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = _380 * _340;
    float _418 = _322 * _402;
    float _420 = _394 * _348;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _422;
    float _426 = -_394;
    float _428 = _426 + 1.0;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _430;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _436 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _434;
    float _438 = fma(_424, _302, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _440 = _414 * _428;
    float _442 = fma(_432, _302, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _444 = fma(_436, _302, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _446 = _334 * _398;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _450 = _448 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _454 = _452 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _458 = _456 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _460 = _438 * _440;
    float _462 = -_414;
    float _464 = _462 + 1.0;
    float _466 = fma(_454, _364, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _468 = fma(_450, _364, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _470 = fma(_458, _364, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _472 = _442 * _440;
    float _474 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _474;
    float _478 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].x, _460);
    float _480 = _444 * _440;
    float _482 = fma(_476, _310, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _484 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].y, _472);
    float _486 = fma(_466, _420, _478);
    float _488 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _490 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _488;
    float _492 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _492;
    float _496 = fma(_464, (*spvDescriptorSet0.vp_c9)._m0[143].z, _480);
    float _498 = fma(_468, _420, _484);
    float _500 = fma(_482, _446, _486);
    float _502 = fma(_490, _310, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _504 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _506 = _504 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _508 = fma(_494, _310, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _510 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _512 = _510 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _514 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _516 = _514 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _518 = fma(_470, _420, _496);
    float _520 = fma(_502, _446, _498);
    float _522 = fma(_506, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _524 = fma(_512, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _526 = fma(_516, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _528 = fma(_508, _446, _518);
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _532 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _530;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _536 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _538;
    float _542 = fma(_522, _382, _500);
    float _544 = fma(_532, _416, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _546 = fma(_536, _416, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _548 = fma(_540, _416, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _550 = fma(_524, _382, _520);
    float _552 = fma(_526, _382, _528);
    float _554 = fma(_544, _418, _542);
    float _556 = fma(_546, _418, _550);
    float _558 = fma(_548, _418, _552);
    float _560 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].x, _554);
    float _562 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].y, _556);
    float _564 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[148].z, _558);
    bool _566 = !_298;
    float _584;
    if (!_566)
    {
        float _568 = in.m_65.x;
        float _570 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _572 = _568 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _574 = fma(_572, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _576 = _574 * _570;
        float _578 = floor(_576);
        float _580 = -_578;
        float _582 = _576 + _580;
        _584 = _582;
        _586 = true;
    }
    else
    {
        float _588 = float(_134);
        float _590 = 1.0 / _588;
        float _592 = _168 * _590;
        _584 = _592;
    }
    _586 = false;
    float _594 = _584;
    float _596 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _598 = _594 + _596;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _602 = _600 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _604 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _606 = isnan(_594);
    bool _608 = _604 || _606;
    bool _610 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _612 = _608 || _610;
    float _614 = float(_612);
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _620 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _622 = isnan(_594);
    bool _624 = _620 || _622;
    bool _626 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _628 = _624 || _626;
    float _630 = float(_628);
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _634 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _632;
    bool _636 = _594 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _638 = isnan(_594);
    bool _640 = _636 || _638;
    bool _642 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _644 = _640 || _642;
    float _646 = float(_644);
    float _648 = 1.0 / _602;
    float _650 = -_614;
    float _652 = _650 + 1.0;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _656 = _594 + _654;
    bool _658 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _660 = _630 * _652;
    float _662 = -_630;
    float _664 = _662 + 1.0;
    float _666 = 1.0 / _618;
    float _668 = _634 * _648;
    float _670 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _672 = _670 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _674 = fma(_668, _598, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _676 = -_646;
    float _678 = _676 + 1.0;
    float _680 = _672 * _666;
    float _682 = _674 * _660;
    float _684 = _614 * _678;
    float _686 = fma(_680, _656, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _688 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[115].x, _682);
    float _690 = fma(_686, _684, _688);
    float _692 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _694 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _696 = fma(_646, (*spvDescriptorSet0.vp_c9)._m0[117].x, _690);
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _700 = in.m_67.x;
    float _702 = in.m_67.y;
    float _704 = in.m_67.z;
    float _706 = _692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _708 = _694 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _710 = _698 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _712 = _696 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _706;
    out.m_69.y = _708;
    out.m_69.z = _710;
    out.m_69.w = _712;
    float _714 = _564 * _704;
    float _716 = _562 * _702;
    float _718 = _560 * _700;
    bool _720 = !_658;
    float _738;
    if (!_720)
    {
        float _722 = in.m_65.x;
        float _724 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _726 = _722 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _728 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _730 = _728 * _724;
        float _732 = floor(_730);
        float _734 = -_732;
        float _736 = _730 + _734;
        _738 = _736;
        _740 = true;
    }
    else
    {
        float _742 = float(_134);
        float _744 = 1.0 / _742;
        float _746 = _168 * _744;
        _738 = _746;
    }
    _740 = false;
    float _748 = _738;
    float _750 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _752 = _748 + _750;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _756 = _754 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _758 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _760 = isnan(_748);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _774 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _776 = isnan(_748);
    bool _778 = _774 || _776;
    bool _780 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _782 = _778 || _780;
    float _784 = float(_782);
    float _786 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _788 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _786;
    bool _790 = _748 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _792 = isnan(_748);
    bool _794 = _790 || _792;
    bool _796 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _798 = _794 || _796;
    float _800 = float(_798);
    float _802 = 1.0 / _756;
    float _804 = -_768;
    float _806 = _804 + 1.0;
    float _808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _810 = _748 + _808;
    bool _812 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _814 = _784 * _806;
    float _816 = -_784;
    float _818 = _816 + 1.0;
    float _820 = 1.0 / _772;
    float _822 = _788 * _802;
    float _824 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _826 = _824 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _828 = fma(_822, _752, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _830 = -_800;
    float _832 = _830 + 1.0;
    float _834 = _826 * _820;
    float _836 = _828 * _814;
    float _838 = _768 * _832;
    float _840 = fma(_834, _810, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _842 = fma(_818, (*spvDescriptorSet0.vp_c9)._m0[131].x, _836);
    float _844 = fma(_840, _838, _842);
    float _846 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _848 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _850 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _852 = fma(_800, (*spvDescriptorSet0.vp_c9)._m0[133].x, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _856 = _848 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _858 = _850 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _860 = _852 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _854;
    out.m_71.y = _856;
    out.m_71.z = _858;
    out.m_71.w = _860;
    bool _862 = !_812;
    float _880;
    if (!_862)
    {
        float _864 = in.m_65.x;
        float _866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _868 = _864 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _870 = fma(_868, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _872 = _870 * _866;
        float _874 = floor(_872);
        float _876 = -_874;
        float _878 = _872 + _876;
        _880 = _878;
        _882 = true;
    }
    else
    {
        float _884 = float(_134);
        float _886 = 1.0 / _884;
        float _888 = _168 * _886;
        _880 = _888;
    }
    _882 = false;
    float _890 = _880;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _894 = _890 + _892;
    bool _896 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _898 = isnan(_890);
    bool _900 = _896 || _898;
    bool _902 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _904 = _900 || _902;
    float _906 = float(_904);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _910 = _908 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _914 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _912;
    bool _916 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _918 = isnan(_890);
    bool _920 = _916 || _918;
    bool _922 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _924 = _920 || _922;
    float _926 = float(_924);
    float _928 = -_906;
    float _930 = _928 + 1.0;
    bool _932 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _934 = isnan(_890);
    bool _936 = _932 || _934;
    bool _938 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _940 = _936 || _938;
    float _942 = float(_940);
    float _944 = 1.0 / _910;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _950 = _926 * _930;
    float _952 = -_942;
    float _954 = _952 + 1.0;
    float _956 = 1.0 / _948;
    bool _958 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _960 = _914 * _944;
    float _962 = -_926;
    float _964 = _962 + 1.0;
    bool _966 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _968 = isnan(_890);
    bool _970 = _966 || _968;
    bool _972 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _974 = _970 || _972;
    float _976 = float(_974);
    float _978 = fma(_960, _894, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _980 = _942 * _964;
    bool _982 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _984 = isnan(_890);
    bool _986 = _982 || _984;
    bool _988 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = _976 * _954;
    float _996 = -_976;
    float _998 = _996 + 1.0;
    float _1000 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1002 = _1000 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1004 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1006 = isnan(_890);
    bool _1008 = _1004 || _1006;
    bool _1010 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1012 = _1008 || _1010;
    float _1014 = float(_1012);
    float _1016 = _992 * _998;
    float _1018 = -_992;
    float _1020 = _1018 + 1.0;
    bool _1022 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1024 = isnan(_890);
    bool _1026 = _1022 || _1024;
    bool _1028 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1030 = _1026 || _1028;
    float _1032 = float(_1030);
    float _1034 = 1.0 / _1002;
    float _1036 = -_1014;
    float _1038 = _1036 + 1.0;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1044 = _1014 * _1020;
    float _1046 = _1032 * _1038;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1052 = -_1032;
    float _1054 = _1052 + 1.0;
    float _1056 = 1.0 / _1042;
    float _1058 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1060 = _1058 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1062 = _978 * _1046;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1066 = _1064 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1070 = _890 + _1068;
    float _1072 = _1060 * _956;
    float _1074 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1062);
    float _1076 = 1.0 / _1050;
    float _1078 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1080 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1078;
    float _1082 = fma(_1072, _1070, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1086 = _1084 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1090 = _890 + _1088;
    float _1092 = _1080 * _1034;
    float _1094 = fma(_1082, _1044, _1074);
    float _1096 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1098 = _890 + _1096;
    float _1100 = 1.0 / _1066;
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1104 = _1102 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1106 = fma(_1092, _1090, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1108 = _1104 * _1056;
    bool _1110 = _890 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1112 = isnan(_890);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1118 = _1114 || _1116;
    float _1120 = float(_1118);
    float _1122 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1124 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1122;
    float _1126 = 1.0 / _1086;
    float _1128 = fma(_1106, _1016, _1094);
    float _1130 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1132 = _1130 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1134 = _1124 * _1076;
    float _1136 = fma(_1108, _1098, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1140 = _890 + _1138;
    float _1142 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1144 = _890 + _1142;
    float _1146 = _1132 * _1100;
    float _1148 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1150 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1148;
    float _1152 = fma(_1134, _1140, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1154 = fma(_1136, _994, _1128);
    float _1156 = fma(_1146, _1144, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1158 = -_1120;
    float _1160 = _1158 + 1.0;
    float _1162 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1164 = _890 + _1162;
    float _1166 = fma(_1152, _980, _1154);
    float _1168 = _1150 * _1126;
    float _1170 = _906 * _1160;
    float _1172 = fma(_1156, _950, _1166);
    float _1174 = fma(_1168, _1164, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1176 = fma(_1174, _1170, _1172);
    float _1178 = fma(_1120, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1176);
    out.m_73.x = _1178;
    bool _1180 = !_958;
    float _1182 = _1094;
    float _1184 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1186 = as_type<int>(_1126);
    float _1204;
    if (!_1180)
    {
        float _1188 = in.m_65.x;
        float _1190 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1192 = _1188 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1194 = fma(_1192, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1196 = _1194 * _1190;
        float _1198 = floor(_1196);
        float _1200 = -_1198;
        float _1202 = _1196 + _1200;
        _1204 = _1202;
        _1206 = true;
    }
    else
    {
        float _1208 = float(_134);
        float _1210 = 1.0 / _1208;
        float _1212 = _168 * _1210;
        _1204 = _1212;
    }
    _1206 = false;
    float _1214 = _1204;
    float _1216 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1218 = int(_1216);
    float _1220 = in.m_65.y;
    int _1222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1224 = _1222 != 0;
    float _1226 = in.m_75.x;
    float _1228 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1230 = int(_1228);
    float _1232 = 0.0;
    int _1234 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1224)
    {
        _1232 = 1.0;
    }
    float _1236 = _1232;
    float _1238 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1240 = int(_1238);
    float _1242 = float(_1218);
    float _1244 = 0.0;
    float _1246 = _1236;
    if (_1224)
    {
        _1244 = 1.0;
    }
    float _1248 = _1244;
    float _1250 = 0.0;
    float _1252 = _1248;
    if (_1224)
    {
        _1250 = 1.0;
    }
    float _1254 = _1250;
    int _1256 = 0;
    float _1258 = _1254;
    if (_1224)
    {
        _1256 = 0;
    }
    int _1260 = _1256;
    int _1262 = _1260;
    if (_1224)
    {
        float _1264 = in.m_65.x;
        _1182 = _1264;
    }
    float _1266 = _1182;
    float _1268 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1270 = int(_1268);
    float _1272 = float(_1230);
    float _1274 = _1266;
    if (_1224)
    {
        _1234 = 0;
    }
    int _1276 = _1234;
    float _1278 = _1170;
    int _1280 = _1276;
    if (_1224)
    {
        float _1282 = in.m_65.z;
        _1278 = _1282;
    }
    float _1284 = _1278;
    int _1286 = 0;
    if (_1224)
    {
        _1286 = as_type<int>(_1220);
    }
    int _1288 = _1286;
    float _1290 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1292 = int(_1290);
    float _1294 = float(_1240);
    float _1296 = 1.0 / _1242;
    float _1298 = float(_1270);
    float _1300 = 1.0 / _1272;
    float _1302 = float(uint(_1292));
    float _1304 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1306 = int(_1304);
    float _1308 = _1296 * _168;
    float _1310 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1312 = int(_1310);
    float _1314 = _1300 * _168;
    float _1316 = 1.0 / _1294;
    float _1318 = float(uint(_1306));
    float _1320 = 1.0 / _1298;
    float _1322 = float(uint(_1312));
    float _1324 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1326 = int(_1324);
    float _1328 = _1316 * _168;
    float _1330 = 1.0 / _1302;
    float _1332 = _1320 * _168;
    float _1334 = trunc(_1308);
    int _1336 = int(_1334);
    float _1338 = float(uint(_1326));
    float _1340 = 1.0 / _1318;
    int _1342 = as_type<int>(_1330) + (-2);
    float _1344 = trunc(_1314);
    int _1346 = int(_1344);
    float _1348 = float(uint(_1336));
    float _1350 = as_type<float>(_1342) * _1348;
    float _1352 = 1.0 / _1322;
    int _1354 = as_type<int>(_1340) + (-2);
    float _1356 = trunc(_1328);
    int _1358 = int(_1356);
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1362 = _1360 != 0;
    float _1364 = 1.0 / _1338;
    int _1366 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1368 = _1366 != 0;
    int _1370 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1372 = _1370 != 0;
    bool _1374 = _1220 > 0.5;
    int _1376 = as_type<int>(_1352) + (-2);
    float _1378 = trunc(_1332);
    int _1380 = int(_1378);
    float _1382 = float(uint(_1358));
    int _1384 = _1288;
    bool _1386 = _1368;
    bool _1388 = _1372;
    float _1390 = _1226;
    if (!_1362)
    {
        _1184 = _1226;
    }
    float _1392 = _1184;
    float _1394 = as_type<float>(_1376) * _1382;
    int _1396 = as_type<int>(_1394);
    float _1398 = _1392;
    if (_1368)
    {
        float _1400 = -_1226;
        float _1402 = _1400 + 1.0;
        _1186 = as_type<int>(_1402);
    }
    int _1404 = _1186;
    float _1406 = trunc(_1350);
    float _1408 = precise::max(_1406, 0.0);
    uint _1411 = uint(_1408);
    int _1413 = as_type<int>(_1364) + (-2);
    float _1415 = 0.0;
    if (!_1372)
    {
        _1415 = _1226;
    }
    float _1417 = _1415;
    float _1419 = 0.0;
    float _1421 = _1417;
    if (!_1368)
    {
        _1419 = _1226;
    }
    float _1423 = _1419;
    float _1425 = _1423;
    if (_1368)
    {
        float _1427 = _1374 ? as_type<float>(_1404) : _1226;
        _1425 = _1427;
    }
    float _1429 = _1425;
    float _1431 = trunc(_1394);
    float _1433 = precise::max(_1431, 0.0);
    uint _1435 = uint(_1433);
    float _1437 = float(uint(_1346));
    float _1439 = float(uint(_1380));
    float _1441 = as_type<float>(_1354) * _1437;
    float _1443 = _1437;
    if (_1372)
    {
        float _1445 = -_1226;
        float _1447 = _1445 + 1.0;
        _1396 = as_type<int>(_1447);
    }
    int _1449 = _1396;
    float _1451 = as_type<float>(_1413) * _1439;
    float _1453 = trunc(_1441);
    float _1455 = precise::max(_1453, 0.0);
    uint _1457 = uint(_1455);
    int _1459 = _1449;
    float _1461 = _1451;
    if (_1372)
    {
        float _1463 = _1374 ? as_type<float>(_1449) : _1226;
        _1421 = _1463;
    }
    float _1465 = _1421;
    float _1467 = _1284;
    if (_1224)
    {
        _1459 = as_type<int>(_1284);
    }
    int _1469 = _1459;
    float _1471 = trunc(_1451);
    float _1473 = precise::max(_1471, 0.0);
    uint _1475 = uint(_1473);
    int _1477 = _1469;
    if (_1224)
    {
        _1461 = _1266;
    }
    float _1479 = _1461;
    float _1481 = _1479;
    if (_1224)
    {
        _1443 = _1479;
    }
    float _1483 = _1443;
    int _1485 = 0;
    float _1487 = _1483;
    if (_1224)
    {
        _1485 = as_type<int>(_1479);
    }
    int _1489 = _1485;
    int _1491 = _1489;
    if (!_1224)
    {
        float _1493 = in.m_65.x;
        float _1495 = _1220 * 3.1415927410125732421875;
        float _1497 = in.m_65.z;
        float _1499 = _1495 * 0.15915493667125701904296875;
        float _1501 = _1499 * 6.283185482025146484375;
        float _1503 = sin(_1501);
        float _1505 = _1493 * 3.1415927410125732421875;
        float _1507 = _1505 * 0.15915493667125701904296875;
        float _1509 = _1497 * 3.1415927410125732421875;
        float _1511 = _1509 * 0.15915493667125701904296875;
        float _1513 = _1507 * 6.283185482025146484375;
        float _1515 = sin(_1513);
        float _1517 = _1511 * 6.283185482025146484375;
        float _1519 = sin(_1517);
        _1481 = _1220;
        _1252 = 1.2345600128173828125;
        _1274 = _1493;
        _1246 = 7.345489978790283203125;
        _1487 = _1497;
        _1258 = 5.839270114898681640625;
        _1262 = 1;
        _1467 = _1497;
        _1280 = 2;
        _1477 = as_type<int>(_1519);
        _1384 = as_type<int>(_1503);
        _1491 = as_type<int>(_1515);
    }
    float _1521 = _1481;
    float _1523 = _1252;
    float _1525 = _1274;
    float _1527 = _1246;
    float _1529 = _1487;
    float _1531 = _1258;
    int _1533 = _1262;
    float _1535 = _1467;
    int _1537 = _1280;
    int _1539 = _1477;
    int _1541 = _1384;
    int _1543 = _1491;
    int _1545 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1547 = _1545 != 0;
    int _1549 = 0;
    if (_1362)
    {
        float _1551 = in.m_65.x;
        _1549 = as_type<int>(_1551);
    }
    int _1553 = _1549;
    int _1555 = ~_1292;
    int _1557 = _1555 + 1;
    float _1559 = _1521 * _1523;
    int _1561 = ~_1312;
    int _1563 = _1561 + 1;
    float _1565 = _1525 * _1527;
    int _1567 = ~_1326;
    int _1569 = _1567 + 1;
    int _1571 = _1557 * int(_1411);
    int _1573 = _1571 + _1336;
    float _1575 = floor(_1559);
    float _1577 = _1529 * _1531;
    float _1579 = _1521 * _1527;
    int _1581 = _1569 * int(_1475);
    int _1583 = _1581 + _1380;
    float _1585 = float(uint(_1573));
    float _1587 = _950;
    if (_1547)
    {
        float _1589 = in.m_65.z;
        _1587 = _1589;
    }
    float _1591 = _1587;
    int _1593 = _1563 * int(_1435);
    int _1595 = _1593 + _1358;
    int _1597 = ~_1306;
    int _1599 = _1597 + 1;
    float _1601 = floor(_1565);
    float _1603 = as_type<float>(_1342) * _1585;
    float _1605 = float(uint(_1583));
    bool _1607 = _1533 != 1;
    float _1609 = float(uint(_1595));
    float _1611 = in.m_61.w;
    int _1613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1615 = _1613 != 0;
    float _1617 = as_type<float>(_1413) * _1605;
    float _1619 = trunc(_1603);
    float _1621 = precise::max(_1619, 0.0);
    uint _1623 = uint(_1621);
    int _1625 = _1553;
    float _1627 = _1603;
    if (_1362)
    {
        bool _1629 = as_type<float>(_1553) > 0.5;
        _1386 = _1629;
    }
    bool _1631 = _1386;
    if (_1547)
    {
        float _1633 = -_1226;
        float _1635 = _1633 + 1.0;
        _1625 = as_type<int>(_1635);
    }
    int _1637 = _1625;
    float _1639 = as_type<float>(_1376) * _1609;
    int _1641 = _1599 * int(_1457);
    int _1643 = _1641 + _1346;
    int _1645 = ~_1326;
    int _1647 = _1645 + 1;
    float _1649 = in.m_59.w;
    float _1651 = floor(_1577);
    int _1653 = _1643;
    float _1655 = _1639;
    if (!_1547)
    {
        _1627 = _1226;
    }
    float _1657 = _1627;
    float _1659 = -_1601;
    float _1661 = _1565 + _1659;
    float _1663 = float(uint(_1643));
    float _1665 = _1657;
    if (_1362)
    {
        float _1667 = -_1226;
        float _1669 = _1667 + 1.0;
        _1653 = as_type<int>(_1669);
    }
    int _1671 = _1653;
    if (_1547)
    {
        bool _1673 = _1591 > 0.5;
        _1388 = _1673;
    }
    bool _1675 = _1388;
    int _1677 = 0;
    if (_1615)
    {
        float _1679 = -_1226;
        float _1681 = _1679 + 1.0;
        _1677 = as_type<int>(_1681);
    }
    int _1683 = _1677;
    float _1685 = float(_1326);
    float _1687 = floor(_1579);
    if (_1547)
    {
        float _1689 = _1675 ? as_type<float>(_1637) : _1226;
        _1665 = _1689;
    }
    float _1691 = _1665;
    float _1693 = -_1575;
    float _1695 = _1559 + _1693;
    float _1697 = float(_134);
    float _1699 = as_type<float>(_1354) * _1663;
    if (_1362)
    {
        float _1701 = _1631 ? as_type<float>(_1671) : _1226;
        _1398 = _1701;
    }
    float _1703 = _1398;
    float _1705 = in.m_63.w;
    float _1707 = float(_1292);
    float _1709 = trunc(_1617);
    float _1711 = precise::max(_1709, 0.0);
    uint _1713 = uint(_1711);
    float _1715 = float(_1336);
    float _1717 = float(_1312);
    int _1719 = ~_1312;
    int _1721 = _1719 + 1;
    float _1723 = trunc(_1639);
    float _1725 = precise::max(_1723, 0.0);
    uint _1727 = uint(_1725);
    int _1729 = int(_1411) + int(_1623);
    float _1731 = -_1687;
    float _1733 = _1579 + _1731;
    float _1735 = _1661 * _1707;
    float _1737 = float(_1380);
    float _1739 = _1717 * _1695;
    float _1741 = float(_1346);
    float _1743 = 1.0 / _1697;
    if (!_1615)
    {
        _1655 = _1226;
    }
    float _1745 = _1655;
    float _1747 = _1745;
    if (_1615)
    {
        float _1749 = _1374 ? as_type<float>(_1683) : _1226;
        _1747 = _1749;
    }
    float _1751 = _1747;
    float _1753 = -_1651;
    float _1755 = _1577 + _1753;
    bool _1757 = _1715 >= _1707;
    bool _1759 = isnan(_1715);
    bool _1761 = _1757 || _1759;
    bool _1763 = isnan(_1707);
    bool _1765 = _1761 || _1763;
    float _1767 = float(_1765);
    float _1769 = _1707 * _168;
    float _1771 = float(_1358);
    float _1773 = trunc(_1699);
    float _1775 = precise::max(_1773, 0.0);
    uint _1777 = uint(_1775);
    float _1779 = float(_1306);
    float _1781 = _1685 * _1755;
    bool _1783 = _1771 >= _1717;
    bool _1785 = isnan(_1771);
    bool _1787 = _1783 || _1785;
    bool _1789 = isnan(_1717);
    bool _1791 = _1787 || _1789;
    float _1793 = float(_1791);
    bool _1795 = _1737 >= _1685;
    bool _1797 = isnan(_1737);
    bool _1799 = _1795 || _1797;
    bool _1801 = isnan(_1685);
    bool _1803 = _1799 || _1801;
    float _1805 = float(_1803);
    int _1807 = int(_1475) + int(_1713);
    float _1809 = _1769 * _1743;
    int _1811 = int(_1435) + int(_1727);
    float _1813 = _1743 * _168;
    int _1815 = ~_1292;
    int _1817 = _1815 + 1;
    float _1819 = trunc(_1767);
    int _1821 = int(_1819);
    int _1823 = ~_1312;
    int _1825 = _1823 + 1;
    float _1827 = _1717 * _1813;
    float _1829 = _1685 * _1813;
    float _1831 = _1779 * _1813;
    int _1833 = _1817 * _1729;
    int _1835 = _1833 + _1336;
    float _1837 = _1779 * _1733;
    int _1839 = _1825 * _1811;
    int _1841 = _1839 + _1358;
    float _1843 = trunc(_1735);
    int _1845 = int(_1843);
    int _1847 = _1647 * _1807;
    int _1849 = _1847 + _1380;
    bool _1851 = uint(_1835) >= uint(_1292);
    float _1853 = in.m_75.y;
    bool _1855 = uint(_1841) >= uint(_1312);
    bool _1857 = !_1851;
    int _1859 = _1857 ? 0 : (-1);
    int _1861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1863 = _1861 != 0;
    float _1865 = trunc(_1739);
    int _1867 = int(_1865);
    bool _1869 = uint(_1849) >= uint(_1326);
    bool _1871 = !_1863;
    int _1873 = _1871 ? 0 : 1;
    int _1875 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1877 = _1875 != 0;
    int _1879 = int(_1457) + int(_1777);
    float _1881 = trunc(_1781);
    int _1883 = int(_1881);
    int _1885 = ~_1306;
    int _1887 = _1885 + 1;
    bool _1889 = !_1855;
    int _1891 = _1889 ? 0 : (-1);
    int _1893 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1895 = _1893 != 0;
    int _1897 = _1887 * _1879;
    int _1899 = _1897 + _1346;
    int _1901 = ~_1729;
    int _1903 = _1901 + _1859;
    int _1905 = _1903 + 1;
    float _1907 = trunc(_1793);
    int _1909 = int(_1907);
    int _1911 = abs(_1873);
    bool _1913 = !_1877;
    int _1915 = _1913 ? 0 : 1;
    int _1917 = _1292 * _1905;
    int _1919 = _1917 + _1336;
    bool _1921 = _1741 >= _1779;
    bool _1923 = isnan(_1741);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan(_1779);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    int _1933 = _1845 * _1911;
    int _1935 = _1933 + _1336;
    bool _1937 = !_1895;
    int _1939 = _1937 ? 0 : 1;
    float _1941 = trunc(_1805);
    int _1943 = int(_1941);
    int _1945 = ~_1811;
    int _1947 = _1945 + _1891;
    int _1949 = _1947 + 1;
    int _1951 = abs(_1915);
    bool _1953 = _1292 == 0;
    int _1955 = _1312 * _1949;
    int _1957 = _1955 + _1358;
    int _1959 = abs(_1939);
    int _1961 = _1867 * _1951;
    int _1963 = _1961 + _1358;
    bool _1965 = uint(_1899) >= uint(_1306);
    float _1967 = trunc(_1809);
    int _1969 = int(_1967);
    bool _1971 = !_1869;
    int _1973 = _1971 ? 0 : (-1);
    int _1975 = ~_1821;
    int _1977 = _1975 + 1;
    int _1979 = _1977 + 1;
    bool _1981 = !_1953;
    int _1983 = _1981 ? _1919 : (-1);
    float _1985 = trunc(_1931);
    int _1987 = int(_1985);
    int _1989 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1991 = _1989 != 0;
    int _1993 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1995 = _1993 != 0;
    int _1997 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1999 = _1997 != 0;
    int _2001 = _1983 * _1979;
    int _2003 = ~_1807;
    int _2005 = _2003 + _1973;
    int _2007 = _2005 + 1;
    int _2009 = _1883 * _1959;
    int _2011 = _2009 + _1380;
    bool _2013 = !_1965;
    int _2015 = _2013 ? 0 : (-1);
    int _2017 = _1292 + (-1);
    int _2019 = _1326 * _2007;
    int _2021 = _2019 + _1380;
    bool _2023 = !_1995;
    int _2025 = _2023 ? 0 : 1;
    bool _2027 = _1312 == 0;
    int _2029 = _1821 * _2017;
    int _2031 = _2029 + _2001;
    bool _2033 = !_1991;
    int _2035 = _2033 ? 0 : 1;
    int _2037 = ~_1879;
    int _2039 = _2037 + _2015;
    int _2041 = _2039 + 1;
    bool _2043 = _1326 == 0;
    int _2045 = abs(_2025);
    int _2047 = ~_1909;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    bool _2053 = !_2027;
    int _2055 = _2053 ? _1957 : (-1);
    int _2057 = abs(_2035);
    int _2059 = ~_1943;
    int _2061 = _2059 + 1;
    int _2063 = _2061 + 1;
    int _2065 = _2051 * _2055;
    bool _2067 = !_2043;
    int _2069 = _2067 ? _2021 : (-1);
    int _2071 = _2031 * _2045;
    int _2073 = _1306 * _2041;
    int _2075 = _2073 + _1346;
    int _2077 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2079 = _2077 != 0;
    int _2081 = _2063 * _2069;
    bool _2083 = !_1999;
    int _2085 = _2083 ? 0 : 1;
    int _2087 = _1969 * _2057;
    int _2089 = _2087 + _2071;
    bool _2091 = !_2079;
    int _2093 = _2091 ? 0 : 1;
    int _2095 = abs(_2085);
    int _2097 = abs(_2093);
    bool _2099 = _1306 == 0;
    int _2101 = _1935 * _2095;
    int _2103 = _2101 + _2089;
    int _2105 = _1312 + (-1);
    float _2107 = trunc(_1827);
    int _2109 = int(_2107);
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2113 = _2111 != 0;
    int _2115 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2117 = _2115 != 0;
    int _2119 = _1845 * _2097;
    int _2121 = _2119 + _2103;
    bool _2123 = !_2099;
    int _2125 = _2123 ? _2075 : (-1);
    int _2127 = _1909 * _2105;
    int _2129 = _2127 + _2065;
    int _2131 = ~_1987;
    int _2133 = _2131 + 1;
    int _2135 = _2133 + 1;
    float _2137 = float(uint(_2121));
    bool _2139 = !_2117;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _2135 * _2125;
    int _2145 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2147 = _2145 != 0;
    int _2149 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2151 = _2149 != 0;
    float _2153 = as_type<float>(_1342) * _2137;
    int _2155 = abs(_2141);
    bool _2157 = !_2113;
    int _2159 = _2157 ? 0 : 1;
    int _2161 = _1326 + (-1);
    float _2163 = trunc(_2153);
    float _2165 = precise::max(_2163, 0.0);
    uint _2167 = uint(_2165);
    int _2169 = abs(_2159);
    bool _2171 = !_2147;
    int _2173 = _2171 ? 0 : 1;
    int _2175 = _1943 * _2161;
    int _2177 = _2175 + _2081;
    int _2179 = ~_1292;
    int _2181 = _2179 + 1;
    int _2183 = _2129 * _2155;
    int _2185 = abs(_2173);
    int _2187 = _1306 + (-1);
    int _2189 = _2109 * _2169;
    int _2191 = _2189 + _2183;
    bool _2193 = !_2151;
    int _2195 = _2193 ? 0 : 1;
    int _2197 = _1987 * _2187;
    int _2199 = _2197 + _2143;
    int _2201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2203 = _2201 != 0;
    int _2205 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2207 = _2205 != 0;
    float _2209 = trunc(_1829);
    int _2211 = int(_2209);
    int _2213 = abs(_2195);
    int _2215 = _2181 * int(_2167);
    int _2217 = _2215 + _2121;
    int _2219 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2221 = _2219 != 0;
    int _2223 = _1963 * _2185;
    int _2225 = _2223 + _2191;
    bool _2227 = !_2207;
    int _2229 = _2227 ? 0 : 1;
    float _2231 = float(uint(_2217));
    int _2233 = _1867 * _2213;
    int _2235 = _2233 + _2225;
    bool _2237 = !_2221;
    int _2239 = _2237 ? 0 : 1;
    float _2241 = trunc(_1837);
    int _2243 = int(_2241);
    int _2245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2247 = _2245 != 0;
    float _2249 = as_type<float>(_1342) * _2231;
    int _2251 = abs(_2229);
    bool _2253 = !_2247;
    int _2255 = _2253 ? 0 : 1;
    float _2257 = float(uint(_2235));
    int _2259 = _2177 * _2251;
    int _2261 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2263 = _2261 != 0;
    int _2265 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2267 = _2265 != 0;
    int _2269 = abs(_2239);
    float _2271 = as_type<float>(_1376) * _2257;
    float _2273 = trunc(_2249);
    float _2275 = precise::max(_2273, 0.0);
    uint _2277 = uint(_2275);
    bool _2279 = !_2203;
    int _2281 = _2279 ? 0 : 1;
    bool _2283 = !_2267;
    int _2285 = _2283 ? 0 : 1;
    int _2287 = abs(_2281);
    int _2289 = abs(_2285);
    float _2291 = trunc(_2271);
    float _2293 = precise::max(_2291, 0.0);
    uint _2295 = uint(_2293);
    int _2297 = _2211 * _2287;
    int _2299 = _2297 + _2259;
    int _2301 = abs(_2255);
    int _2303 = _2199 * _2289;
    int _2305 = ~_1312;
    int _2307 = _2305 + 1;
    int _2309 = _2011 * _2269;
    int _2311 = _2309 + _2299;
    int _2313 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2315 = _2313 != 0;
    float _2317 = trunc(_1831);
    int _2319 = int(_2317);
    int _2321 = _2243 * _2301;
    int _2323 = _2321 + _1346;
    int _2325 = int(_2167) + int(_2277);
    bool _2327 = !_2263;
    int _2329 = _2327 ? 0 : 1;
    bool _2331 = !_2315;
    int _2333 = _2331 ? 0 : 1;
    int _2335 = abs(_2329);
    int _2337 = _2307 * int(_2295);
    int _2339 = _2337 + _2235;
    int _2341 = abs(_2333);
    int _2343 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2345 = _2343 != 0;
    int _2347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2349 = _2347 != 0;
    int _2351 = ~_1292;
    int _2353 = _2351 + 1;
    int _2355 = _1883 * _2341;
    int _2357 = _2355 + _2311;
    float _2359 = float(uint(_2339));
    int _2361 = _2319 * _2335;
    int _2363 = _2361 + _2303;
    bool _2365 = !_2345;
    int _2367 = _2365 ? 0 : 1;
    int _2369 = _2353 * _2325;
    int _2371 = _2369 + _2121;
    bool _2373 = !_2349;
    int _2375 = _2373 ? 0 : 1;
    float _2377 = as_type<float>(_1376) * _2359;
    int _2379 = abs(_2367);
    float _2381 = float(uint(_2357));
    float _2383 = trunc(_2377);
    float _2385 = precise::max(_2383, 0.0);
    uint _2387 = uint(_2385);
    bool _2389 = uint(_2371) >= uint(_1292);
    float _2391 = as_type<float>(_1413) * _2381;
    bool _2393 = !_2389;
    int _2395 = _2393 ? 0 : (-1);
    int _2397 = abs(_2375);
    float _2399 = trunc(_2391);
    float _2401 = precise::max(_2399, 0.0);
    uint _2403 = uint(_2401);
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2407 = _2405 != 0;
    int _2409 = _2323 * _2379;
    int _2411 = _2409 + _2363;
    int _2413 = ~_2325;
    int _2415 = _2413 + _2395;
    int _2417 = _2415 + 1;
    bool _2419 = _1292 == 0;
    int _2421 = _2243 * _2397;
    int _2423 = _2421 + _2411;
    int _2425 = ~_1326;
    int _2427 = _2425 + 1;
    int _2429 = _1292 * _2417;
    int _2431 = _2429 + _2121;
    bool _2433 = _1220 > 0.5;
    float _2435 = in.m_65.w;
    float _2437 = float(uint(_2423));
    float _2439 = -_1853;
    float _2441 = _2439 + 1.0;
    bool _2443 = !_2419;
    int _2445 = _2443 ? _2431 : (-1);
    int _2447 = as_type<int>(_2271);
    if (_2407)
    {
        float _2449 = -_1226;
        float _2451 = _2449 + 1.0;
        _2447 = as_type<int>(_2451);
    }
    int _2453 = _2447;
    int _2455 = int(_2295) + int(_2387);
    float _2457 = as_type<float>(_1354) * _2437;
    int _2459 = _2427 * int(_2403);
    int _2461 = _2459 + _2357;
    int _2463 = _2445 & 3;
    bool _2465 = _2463 != 0;
    if (_2407)
    {
        float _2467 = _2433 ? as_type<float>(_2453) : _1226;
        _1390 = _2467;
    }
    float _2469 = _1390;
    int _2471 = ~_1312;
    int _2473 = _2471 + 1;
    float _2475 = trunc(_2457);
    float _2477 = precise::max(_2475, 0.0);
    uint _2479 = uint(_2477);
    bool _2481 = uint(_2463) > 1u;
    float _2483 = float(uint(_2461));
    int _2485 = _2473 * _2455;
    int _2487 = _2485 + _2235;
    int _2489 = _2445 & 3;
    bool _2491 = _2489 != 0;
    int _2493 = ~_1306;
    int _2495 = _2493 + 1;
    float _2497 = as_type<float>(_1413) * _2483;
    int _2499 = _2491 ? 0 : 1;
    bool _2501 = uint(_2487) >= uint(_1312);
    int _2503 = ~_2499;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = trunc(_2497);
    float _2511 = precise::max(_2509, 0.0);
    uint _2513 = uint(_2511);
    int _2515 = _2507;
    if (!_2481)
    {
        int _2517 = ~_2499;
        int _2519 = _2517 + 1;
        _2515 = _2519;
    }
    int _2521 = _2515;
    int _2523 = _2495 * int(_2479);
    int _2525 = _2523 + _2423;
    bool _2527 = !_2501;
    int _2529 = _2527 ? 0 : (-1);
    bool _2531 = _2463 != 3;
    bool _2533 = uint(_2463) >= 2u;
    int _2535 = ~_2455;
    int _2537 = _2535 + _2529;
    int _2539 = _2537 + 1;
    int _2541 = _2533 ? 0 : 1;
    float _2543 = float(uint(_2525));
    int _2545 = _1312 * _2539;
    int _2547 = _2545 + _2235;
    int _2549 = _2433 ? as_type<int>(_2441) : as_type<int>(_1853);
    bool _2551 = _2435 > 0.5;
    float _2553 = as_type<float>(_1354) * _2543;
    int _2555 = ~_1326;
    int _2557 = _2555 + 1;
    bool _2559 = _1312 == 0;
    float _2561 = trunc(_2553);
    float _2563 = precise::max(_2561, 0.0);
    uint _2565 = uint(_2563);
    int _2567 = ~_2541;
    int _2569 = _2567 + 1;
    int _2571 = _2569 + 1;
    int _2573 = _2571;
    if (_2531)
    {
        int _2575 = ~_2541;
        int _2577 = _2575 + 1;
        _2573 = _2577;
    }
    int _2579 = _2573;
    int _2581 = int(_2403) + int(_2513);
    bool _2583 = !_2559;
    int _2585 = _2583 ? _2547 : (-1);
    int _2587 = _2551 ? as_type<int>(_2441) : as_type<int>(_1853);
    int _2589 = _2557 * _2581;
    int _2591 = _2589 + _2357;
    int _2593 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2595 = _2593 != 0;
    int _2597 = _2585 & 3;
    bool _2599 = _2597 != 0;
    bool _2601 = !_2595;
    int _2603 = _2601 ? 0 : 1;
    bool _2605 = uint(_2597) >= 2u;
    int _2607 = _2599 ? 0 : 1;
    bool _2609 = uint(_2591) >= uint(_1326);
    int _2611 = _2605 ? 0 : 1;
    bool _2613 = _2597 != 3;
    bool _2615 = !_2609;
    int _2617 = _2615 ? 0 : (-1);
    int _2619 = ~_1306;
    int _2621 = _2619 + 1;
    bool _2623 = uint(_2597) > 1u;
    int _2625 = ~_2581;
    int _2627 = _2625 + _2617;
    int _2629 = _2627 + 1;
    int _2631 = int(_2479) + int(_2565);
    int _2633 = _1326 * _2629;
    int _2635 = _2633 + _2357;
    bool _2637 = _1326 == 0;
    int _2639 = ~_2611;
    int _2641 = _2639 + 1;
    int _2643 = _2641 + 1;
    int _2645 = _2621 * _2631;
    int _2647 = _2645 + _2423;
    int _2649 = _2643;
    if (_2613)
    {
        int _2651 = ~_2611;
        int _2653 = _2651 + 1;
        _2649 = _2653;
    }
    int _2655 = _2649;
    int _2657 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2659 = _2657 != 0;
    int _2661 = ~_2607;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    bool _2667 = !_2637;
    int _2669 = _2667 ? _2635 : (-1);
    int _2671 = _2665;
    if (!_2623)
    {
        int _2673 = ~_2607;
        int _2675 = _2673 + 1;
        _2671 = _2675;
    }
    int _2677 = _2671;
    bool _2679 = uint(_2647) >= uint(_1306);
    bool _2681 = !_2659;
    int _2683 = _2681 ? 0 : 1;
    int _2685 = _2669 & 3;
    bool _2687 = _2685 != 0;
    bool _2689 = !_2679;
    int _2691 = _2689 ? 0 : (-1);
    int _2693 = _2687 ? 0 : 1;
    bool _2695 = uint(_2685) >= 2u;
    bool _2697 = _2685 != 3;
    int _2699 = ~_2631;
    int _2701 = _2699 + _2691;
    int _2703 = _2701 + 1;
    int _2705 = _2695 ? 0 : 1;
    bool _2707 = uint(_2685) > 1u;
    int _2709 = _1306 * _2703;
    int _2711 = _2709 + _2423;
    bool _2713 = _1306 == 0;
    int _2715 = ~_2705;
    int _2717 = _2715 + 1;
    int _2719 = _2717 + 1;
    bool _2721 = !_2713;
    int _2723 = _2721 ? _2711 : (-1);
    int _2725 = _2719;
    if (_2697)
    {
        int _2727 = ~_2705;
        int _2729 = _2727 + 1;
        _2725 = _2729;
    }
    int _2731 = _2725;
    int _2733 = _2723 & 3;
    bool _2735 = _2733 != 0;
    int _2737 = ~_2693;
    int _2739 = _2737 + 1;
    int _2741 = _2739 + 1;
    int _2743 = _2741;
    if (!_2707)
    {
        int _2745 = ~_2693;
        int _2747 = _2745 + 1;
        _2743 = _2747;
    }
    int _2749 = _2743;
    bool _2751 = uint(_2733) >= 2u;
    int _2753 = _2735 ? 0 : 1;
    int _2755 = _2751 ? 0 : 1;
    bool _2757 = _2733 != 3;
    bool _2759 = uint(_2733) > 1u;
    int _2761 = ~_2755;
    int _2763 = _2761 + 1;
    int _2765 = _2763 + 1;
    int _2767 = ~_2753;
    int _2769 = _2767 + 1;
    int _2771 = _2769 + 1;
    float _2773 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2775 = _2773 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2777 = _2765;
    int _2779 = _2771;
    if (_2757)
    {
        int _2781 = ~_2755;
        int _2783 = _2781 + 1;
        _2777 = _2783;
    }
    int _2785 = _2777;
    float _2787 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2789 = _2787 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2759)
    {
        int _2791 = ~_2753;
        int _2793 = _2791 + 1;
        _2779 = _2793;
    }
    int _2795 = _2779;
    float _2797 = 1.0 / _2775;
    float _2799 = in.m_50.x;
    float _2801 = in.m_50.y;
    float _2803 = in.m_50.z;
    int _2805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2807 = _2805 != 0;
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2811 = _2809 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2815 = _2813 != 0;
    bool _2817 = !_2807;
    int _2819 = _2817 ? 0 : 1;
    float _2821 = _2815 ? as_type<float>(_2549) : _1853;
    float _2823 = 1.0 / _2789;
    int _2825 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2827 = _2825 != 0;
    bool _2829 = _1535 > 0.5;
    float _2831 = _2827 ? as_type<float>(_2587) : _1853;
    int _2833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2835 = _2833 != 0;
    float _2837 = 1.0 / _2811;
    int _2839 = _2829 ? as_type<int>(_2441) : as_type<int>(_1853);
    int _2841 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2843 = _2841 != 0;
    float _2845 = _2835 ? as_type<float>(_2839) : _1853;
    float _2847 = _200 * _2801;
    float _2849 = _2843 ? as_type<float>(_2839) : _1853;
    int _2851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2853 = _2851 != 0;
    int _2855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2857 = _2855 != 0;
    float _2859 = fma(_198, _2799, _2847);
    int _2861 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2863 = _2861 != 0;
    float _2865 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2867 = _2865 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2869 = _206 * _2801;
    float _2871 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2873 = _1220 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2875 = _1525 * 2.0;
    float _2877 = 1.0 / _2867;
    float _2879 = _212 * _2801;
    float _2881 = fma(_204, _2799, _2869);
    float _2883 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2885 = _2883 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2887 = fma(_2873, -2.0, _2871);
    float _2889 = fma(_210, _2799, _2879);
    float _2891 = floor(_2875);
    float _2893 = fma(_202, _2803, _2859);
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2897 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2895;
    float _2899 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2901 = _2899 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2903 = fma(_214, _2803, _2889);
    float _2905 = fma(_208, _2803, _2881);
    float _2907 = 1.0 / _2885;
    float _2909 = _2853 ? as_type<float>(_2839) : _1853;
    float _2911 = _2897 * _2837;
    float _2913 = _2857 ? as_type<float>(_2839) : _1853;
    float _2915 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2917 = _1214 + _2915;
    bool _2919 = !_2863;
    int _2921 = _2919 ? 0 : 1;
    float _2923 = _2893 + _1649;
    float _2925 = float(uint(_2011));
    float _2927 = 1.0 / _2901;
    float _2929 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2931 = _2929 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2933 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2935 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2933;
    bool _2937 = _2891 > 0.0;
    float _2939 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2887);
    float _2941 = _2931 * _2797;
    float _2943 = _2935 * _2823;
    float _2945 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2947 = _2945 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2949 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2951 = _2949 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2953 = _2891 >= 0.0;
    bool _2955 = isnan(_2891);
    bool _2957 = _2953 || _2955;
    bool _2959 = isnan(0.0);
    bool _2961 = _2957 || _2959;
    float _2963 = 1.0 / _2947;
    float _2965 = _2951 * _2877;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2967;
    int _2971 = _2961 ? 0 : 1;
    float _2973 = _2969 * _2907;
    float _2975 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2977 = _2975 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2979 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2981 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2979;
    float _2983 = _1220 * 2.0;
    int _2985 = ~_2971;
    int _2987 = _2985 + 1;
    int _2989 = _2987 + 1;
    float _2991 = _2977 * _2927;
    float _2993 = float(uint(_1935));
    bool _2995 = _1537 != 2;
    int _2997 = _2989;
    float _2999 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _3001 = _2877;
    float _3003 = _2927;
    float _3005 = _2913;
    if (!_2937)
    {
        int _3007 = ~_2971;
        int _3009 = _3007 + 1;
        _2997 = _3009;
    }
    int _3011 = _2997;
    float _3013 = _2981 * _2963;
    float _3015 = floor(_2983);
    float _3017 = as_type<float>(_1342) * _2993;
    if (!_1607)
    {
        _2999 = _1220;
    }
    float _3019 = _2999;
    float _3021 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _3023 = _1214 + _3021;
    float _3025 = _3019;
    if (!_1607)
    {
        _3001 = _1220;
    }
    float _3027 = _3001;
    float _3029 = _3027;
    if (!_1607)
    {
        _3003 = _1535;
    }
    float _3031 = _3003;
    float _3033 = fma(_2911, _3023, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _3035 = trunc(_3017);
    float _3037 = precise::max(_3035, 0.0);
    uint _3039 = uint(_3037);
    float _3041 = 0.0;
    float _3043 = _3031;
    if (!_1607)
    {
        _3041 = _1535;
    }
    float _3045 = _3041;
    float _3047 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _3049 = _1214 + _3047;
    bool _3051 = !_1607;
    float _3053 = _3051 ? as_type<float>(_1539) : as_type<float>(_1541);
    float _3055 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3057 = _1214 + _3055;
    bool _3059 = !_1607;
    float _3061 = _3059 ? as_type<float>(_1541) : as_type<float>(_1543);
    float _3063 = fma(_2965, _3049, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3065 = _3045;
    if (_1607)
    {
        _3025 = _1525;
    }
    float _3067 = _3025;
    float _3069 = fma(_2991, _3057, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1607)
    {
        _3029 = _1525;
    }
    float _3071 = _3029;
    if (_1607)
    {
        _3043 = _1220;
    }
    float _3073 = _3043;
    if (_1607)
    {
        _3065 = _1220;
    }
    float _3075 = _3065;
    bool _3077 = _3015 > 0.0;
    bool _3079 = _3015 >= 0.0;
    bool _3081 = isnan(_3015);
    bool _3083 = _3079 || _3081;
    bool _3085 = isnan(0.0);
    bool _3087 = _3083 || _3085;
    float _3089 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3091 = _1214 + _3089;
    int _3093 = ~_1292;
    int _3095 = _3093 + 1;
    float _3097 = float(uint(_1963));
    float _3099 = fma(_2941, _3091, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3101 = fma(_2943, _2917, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3103 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3105 = _1214 + _3103;
    int _3107 = _3095 * int(_3039);
    int _3109 = _3107 + _1935;
    float _3111 = as_type<float>(_1376) * _3097;
    bool _3113 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3115 = isnan(_1214);
    bool _3117 = _3113 || _3115;
    bool _3119 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3121 = _3117 || _3119;
    float _3123 = float(_3121);
    float _3125 = fma(_3013, _3105, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3127 = float(uint(_2323));
    float _3129 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3131 = _1214 + _3129;
    float _3133 = float(uint(_3109));
    float _3135 = _2905 + _1611;
    float _3137 = trunc(_3111);
    float _3139 = precise::max(_3137, 0.0);
    uint _3141 = uint(_3139);
    bool _3143 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3145 = isnan(_1214);
    bool _3147 = _3143 || _3145;
    bool _3149 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3151 = _3147 || _3149;
    float _3153 = float(_3151);
    float _3155 = -_3123;
    float _3157 = _3155 + 1.0;
    float _3159 = as_type<float>(_1342) * _3133;
    bool _3161 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3163 = isnan(_1214);
    bool _3165 = _3161 || _3163;
    bool _3167 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3169 = _3165 || _3167;
    float _3171 = float(_3169);
    float _3173 = as_type<float>(_1354) * _3127;
    float _3175 = -_3153;
    float _3177 = _3175 + 1.0;
    bool _3179 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3181 = isnan(_1214);
    bool _3183 = _3179 || _3181;
    bool _3185 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3187 = _3183 || _3185;
    float _3189 = float(_3187);
    float _3191 = fma(_2973, _3131, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3193 = -_3171;
    float _3195 = _3193 + 1.0;
    float _3197 = _3171 * _3177;
    bool _3199 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3201 = isnan(_1214);
    bool _3203 = _3199 || _3201;
    bool _3205 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3207 = _3203 || _3205;
    float _3209 = float(_3207);
    float _3211 = trunc(_3173);
    float _3213 = precise::max(_3211, 0.0);
    uint _3215 = uint(_3213);
    float _3217 = _3123 * _3195;
    float _3219 = as_type<float>(_1413) * _2925;
    bool _3221 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3223 = isnan(_1214);
    bool _3225 = _3221 || _3223;
    bool _3227 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3229 = _3225 || _3227;
    float _3231 = float(_3229);
    float _3233 = -_3209;
    float _3235 = _3233 + 1.0;
    int _3237 = _1721 * int(_3141);
    int _3239 = _3237 + _1963;
    float _3241 = _3209 * _3157;
    bool _3243 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3245 = isnan(_1214);
    bool _3247 = _3243 || _3245;
    bool _3249 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3251 = _3247 || _3249;
    float _3253 = float(_3251);
    float _3255 = trunc(_3219);
    float _3257 = precise::max(_3255, 0.0);
    uint _3259 = uint(_3257);
    float _3261 = _3189 * _3235;
    float _3263 = float(uint(_3239));
    float _3265 = -_3189;
    float _3267 = _3265 + 1.0;
    int _3269 = ~_1326;
    int _3271 = _3269 + 1;
    bool _3273 = _1214 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3275 = isnan(_1214);
    bool _3277 = _3273 || _3275;
    bool _3279 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3281 = _3277 || _3279;
    float _3283 = float(_3281);
    float _3285 = as_type<float>(_1376) * _3263;
    float _3287 = -_3231;
    float _3289 = _3287 + 1.0;
    int _3291 = ~_1306;
    int _3293 = _3291 + 1;
    float _3295 = trunc(_3159);
    float _3297 = precise::max(_3295, 0.0);
    uint _3299 = uint(_3297);
    float _3301 = _3253 * _3267;
    float _3303 = _3283 * _3289;
    float _3305 = -_3253;
    float _3307 = _3305 + 1.0;
    int _3309 = _3293 * int(_3215);
    int _3311 = _3309 + _2323;
    float _3313 = -_3283;
    float _3315 = _3313 + 1.0;
    int _3317 = _3271 * int(_3259);
    int _3319 = _3317 + _2011;
    float _3321 = _3033 * _3303;
    float _3323 = trunc(_3285);
    float _3325 = precise::max(_3323, 0.0);
    uint _3327 = uint(_3325);
    float _3329 = _3231 * _3307;
    float _3331 = _3087 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3333 = fma(_3315, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3321);
    float _3335 = float(uint(_3319));
    float _3337 = _2903 + _1705;
    int _3339 = ~_1292;
    int _3341 = _3339 + 1;
    float _3343 = fma(_3099, _3329, _3333);
    float _3345 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3347 = _2923 + _3345;
    float _3349 = as_type<float>(_1413) * _3335;
    float _3351 = float(uint(_3311));
    float _3353 = fma(_3101, _3301, _3343);
    int _3355 = ~_1312;
    int _3357 = _3355 + 1;
    float _3359 = trunc(_3349);
    float _3361 = precise::max(_3359, 0.0);
    uint _3363 = uint(_3361);
    int _3365 = ~as_type<int>(_3331);
    int _3367 = _3365 + 1;
    int _3369 = _3367 + 1;
    float _3371 = as_type<float>(_1354) * _3351;
    int _3373 = int(_3039) + int(_3299);
    float _3375 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3377 = _3135 + _3375;
    int _3379 = int(_3141) + int(_3327);
    float _3381 = fma(_3063, _3261, _3353);
    int _3383 = _3369;
    float _3385 = _3331;
    float _3387 = _3329;
    if (!_3077)
    {
        int _3389 = ~as_type<int>(_3331);
        int _3391 = _3389 + 1;
        _3383 = _3391;
    }
    int _3393 = _3383;
    float _3395 = trunc(_3371);
    float _3397 = precise::max(_3395, 0.0);
    uint _3399 = uint(_3397);
    int _3401 = _3341 * _3373;
    int _3403 = _3401 + _1935;
    int _3405 = ~_1326;
    int _3407 = _3405 + 1;
    float _3409 = fma(_3191, _3241, _3381);
    float _3411 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3413 = uint(_3403) >= uint(_1292);
    int _3415 = _3357 * _3379;
    int _3417 = _3415 + _1963;
    float _3419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3421 = int(_3259) + int(_3363);
    float _3423 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3425 = !_3413;
    int _3427 = _3425 ? 0 : (-1);
    float _3429 = _1535 * 2.0;
    bool _3431 = uint(_3417) >= uint(_1312);
    float _3433 = _3377 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3435 = -_3423;
    float _3437 = fma(_3411, 2.0, _3435);
    int _3439 = int(_3215) + int(_3399);
    int _3441 = _3407 * _3421;
    int _3443 = _3441 + _2011;
    int _3445 = ~_1306;
    int _3447 = _3445 + 1;
    float _3449 = floor(_3429);
    bool _3451 = !_3431;
    int _3453 = _3451 ? 0 : (-1);
    float _3455 = -_168;
    float _3457 = fma(_3455, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3437);
    bool _3459 = uint(_3443) >= uint(_1326);
    float _3461 = fma(_3347, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3433);
    float _3463 = _3419 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3465 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3467 = _3337 + _3465;
    bool _3469 = !_3459;
    int _3471 = _3469 ? 0 : (-1);
    float _3473 = fma(_3463, _1429, -0.5);
    int _3475 = _3447 * _3439;
    int _3477 = _3475 + _2323;
    float _3479 = fma(_3467, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3461);
    bool _3481 = uint(_3477) >= uint(_1306);
    float _3483 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3485 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3487 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3489 = !_3481;
    int _3491 = _3489 ? 0 : (-1);
    float _3493 = fma(as_type<float>(_1543), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3483);
    bool _3495 = _3479 >= 0.0;
    float _3497 = as_type<float>(_1543) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3499 = fma(as_type<float>(_1541), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3485);
    float _3501 = as_type<float>(_1541) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3503 = _1220 + _1525;
    float _3505 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3493);
    float _3507 = fma(_3501, -2.0, _3487);
    float _3509 = _3503 + (-1.0);
    float _3511 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3513 = ~_3379;
    int _3515 = _3513 + _3453;
    int _3517 = _3515 + 1;
    float _3519 = fma(_3069, _3217, _3409);
    float _3521 = fma(_3509, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3523 = _3509;
    if (_3495)
    {
        _3523 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3525 = _3523;
    float _3527 = -_3511;
    float _3529 = fma(_3497, 2.0, _3527);
    int _3531 = ~_3373;
    int _3533 = _3531 + _3427;
    int _3535 = _3533 + 1;
    bool _3537 = !_2465;
    int _3539 = _3537 ? 0 : 1;
    int _3541 = as_type<int>(_3525);
    if (_3495)
    {
        float _3543 = _3525 * 5.0;
        _3541 = as_type<int>(_3543);
    }
    int _3545 = _3541;
    int _3547 = _2585 & 3;
    bool _3549 = _3547 != 0;
    float _3551 = fma(_3125, _3197, _3519);
    int _3553 = _1292 * _3535;
    int _3555 = _3553 + _1935;
    if (_3495)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11987 = as_type<float>(_3545);
        out.gl_Position.z = _11987;
    }
    bool _3557 = !_3549;
    int _3559 = _3557 ? 0 : 1;
    float _3561 = fma(_3153, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3551);
    int _3563 = _2669 & 3;
    bool _3565 = _3563 != 0;
    float _3567 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3569 = _1312 * _3517;
    int _3571 = _3569 + _1963;
    bool _3573 = !_3565;
    int _3575 = _3573 ? 0 : 1;
    float _3577 = fma(_3071, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3567);
    int _3579 = _2723 & 3;
    bool _3581 = _3579 != 0;
    out.m_77.x = _3561;
    float _3583 = _3377 * _3377;
    bool _3585 = !_3581;
    int _3587 = _3585 ? 0 : 1;
    float _3589 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3499);
    bool _3591 = _2463 != 3;
    float _3593 = fma(_3347, _3347, _3583);
    float _3595 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3597 = fma(_3467, _3467, _3593);
    bool _3599 = !_3591;
    int _3601 = _3599 ? 0 : (-1);
    float _3603 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3605 = _2445 >> 31;
    float _3607 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3609 = _2597 != 3;
    float _3611 = fma(_3053, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3603);
    float _3613 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3615 = _3605 & 3;
    float _3617 = rsqrt(_3597);
    int _3619 = _2669 >> 31;
    float _3621 = fma(_3613, -2.0, _3607);
    int _3623 = _2585 >> 31;
    float _3625 = fma(_3061, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3595);
    int _3627 = _2445 + _3615;
    float _3629 = _3061 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3631 = _3623 & 3;
    float _3633 = -_168;
    float _3635 = fma(_3633, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3529);
    int _3637 = _3627 >> 2;
    float _3639 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3507);
    int _3641 = _2585 + _3631;
    float _3643 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3625);
    int _3645 = _2723 >> 31;
    float _3647 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3577);
    int _3649 = _3619 & 3;
    float _3651 = _3347 * _3617;
    int _3653 = _3641 >> 2;
    float _3655 = _3377 * _3617;
    int _3657 = _3637 << 4;
    int _3659 = _3657 + 368;
    float _3661 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3621);
    bool _3663 = !_3609;
    int _3665 = _3663 ? 0 : (-1);
    float _3667 = -_3655;
    float _3669 = fma(_3667, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3377);
    bool _3671 = _2685 != 3;
    if (_3495)
    {
        out.m_53.x = 0.0;
    }
    if (_2995)
    {
        _3385 = _1525;
    }
    float _3673 = _3385;
    float _3675 = _3669 * _3669;
    float _3677 = _3673;
    if (_2995)
    {
        _3387 = _1220;
    }
    float _3679 = _3387;
    int _3681 = _3645 & 3;
    float _3683 = _3679;
    if (!_2995)
    {
        _3677 = _1535;
    }
    float _3685 = _3677;
    uint _3687 = uint(int(uint(_3659) >> uint(2)));
    uint _3689 = uint(int(uint(int(_3687)) >> uint(2)));
    int _3691 = int(_3687) & 3;
    float _3693 = (*spvDescriptorSet0.vp_c9)._m0[int(_3689)][_3691];
    int _3695 = int(_3687) + 1;
    uint _3697 = uint(int(uint(_3695) >> uint(2)));
    int _3699 = _3695 & 3;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[int(_3697)][_3699];
    if (!_2995)
    {
        _3683 = _1525;
    }
    float _3703 = _3683;
    int _3705 = _2669 + _3649;
    float _3707 = _3685 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3709 = _3653 << 4;
    int _3711 = _3709 + 512;
    float _3713 = _3703 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3715 = _3449 > 0.0;
    float _3717 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3719 = int(_3717);
    bool _3721 = _3449 >= 0.0;
    bool _3723 = isnan(_3449);
    bool _3725 = _3721 || _3723;
    bool _3727 = isnan(0.0);
    bool _3729 = _3725 || _3727;
    uint _3731 = uint(int(uint(_3711) >> uint(2)));
    uint _3733 = uint(int(uint(int(_3731)) >> uint(2)));
    int _3735 = int(_3731) & 3;
    float _3737 = (*spvDescriptorSet0.vp_c9)._m0[int(_3733)][_3735];
    int _3739 = int(_3731) + 1;
    uint _3741 = uint(int(uint(_3739) >> uint(2)));
    int _3743 = _3739 & 3;
    float _3745 = (*spvDescriptorSet0.vp_c9)._m0[int(_3741)][_3743];
    bool _3747 = _2733 != 3;
    float _3749 = -_3651;
    float _3751 = fma(_3749, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3347);
    int _3753 = _2723 + _3681;
    float _3755 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3757 = _3705 >> 2;
    float _3759 = fma(_3751, _3751, _3675);
    float _3761 = -_3755;
    float _3763 = fma(_3629, 2.0, _3761);
    bool _3765 = !_2419;
    int _3767 = _3765 ? _3555 : (-1);
    float _3769 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3771 = int(_3769);
    bool _3773 = !_2559;
    int _3775 = _3773 ? _3571 : (-1);
    float _3777 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3779 = !_3747;
    int _3781 = _3779 ? 0 : (-1);
    float _3783 = _3073 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3785 = _3753 >> 2;
    int _3787 = _3757 << 4;
    int _3789 = _3787 + 656;
    int _3791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3793 = _3791 != 0;
    int _3795 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3797 = _3795 != 0;
    int _3799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3801 = _3799 != 0;
    float _3803 = _3067 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3805 = _3785 << 4;
    int _3807 = _3805 + 800;
    uint _3809 = uint(int(uint(_3789) >> uint(2)));
    uint _3811 = uint(int(uint(int(_3809)) >> uint(2)));
    int _3813 = int(_3809) & 3;
    float _3815 = (*spvDescriptorSet0.vp_c9)._m0[int(_3811)][_3813];
    int _3817 = int(_3809) + 1;
    uint _3819 = uint(int(uint(_3817) >> uint(2)));
    int _3821 = _3817 & 3;
    float _3823 = (*spvDescriptorSet0.vp_c9)._m0[int(_3819)][_3821];
    float _3825 = -_3777;
    float _3827 = fma(_3803, 2.0, _3825);
    float _3829 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3831 = _3729 ? 0 : 1;
    uint _3833 = uint(int(uint(_3807) >> uint(2)));
    uint _3835 = uint(int(uint(int(_3833)) >> uint(2)));
    int _3837 = int(_3833) & 3;
    float _3839 = (*spvDescriptorSet0.vp_c9)._m0[int(_3835)][_3837];
    int _3841 = int(_3833) + 1;
    uint _3843 = uint(int(uint(_3841) >> uint(2)));
    int _3845 = _3841 & 3;
    float _3847 = (*spvDescriptorSet0.vp_c9)._m0[int(_3843)][_3845];
    float _3849 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3851 = -_3829;
    float _3853 = fma(_3707, 2.0, _3851);
    float _3855 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3857 = ~_3421;
    int _3859 = _3857 + _3471;
    int _3861 = _3859 + 1;
    float _3863 = fma(_3713, -2.0, _3849);
    int _3865 = ~_3439;
    int _3867 = _3865 + _3491;
    int _3869 = _3867 + 1;
    float _3871 = fma(_3783, -2.0, _3855);
    int _3873 = _3659 + 8;
    uint _3875 = uint(int(uint(_3873) >> uint(2)));
    uint _3877 = uint(int(uint(int(_3875)) >> uint(2)));
    int _3879 = int(_3875) & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = int(_3875) + 1;
    uint _3885 = uint(int(uint(_3883) >> uint(2)));
    int _3887 = _3883 & 3;
    float _3889 = (*spvDescriptorSet0.vp_c9)._m0[int(_3885)][_3887];
    int _3891 = ~_3831;
    int _3893 = _3891 + 1;
    int _3895 = _3893 + 1;
    float _3897 = -_168;
    float _3899 = fma(_3897, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3827);
    int _3901 = _3895;
    if (!_3715)
    {
        int _3903 = ~_3831;
        int _3905 = _3903 + 1;
        _3901 = _3905;
    }
    int _3907 = _3901;
    int _3909 = _1306 * _3869;
    int _3911 = _3909 + _2323;
    int _3913 = abs(_2677);
    float _3915 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3871);
    int _3917 = abs(_2521);
    int _3919 = _3789 + 8;
    uint _3921 = uint(int(uint(_3919) >> uint(2)));
    uint _3923 = uint(int(uint(int(_3921)) >> uint(2)));
    int _3925 = int(_3921) & 3;
    float _3927 = (*spvDescriptorSet0.vp_c9)._m0[int(_3923)][_3925];
    int _3929 = int(_3921) + 1;
    uint _3931 = uint(int(uint(_3929) >> uint(2)));
    int _3933 = _3929 & 3;
    float _3935 = (*spvDescriptorSet0.vp_c9)._m0[int(_3931)][_3933];
    int _3937 = abs(_2749);
    int _3939 = _1326 * _3861;
    int _3941 = _3939 + _2011;
    int _3943 = ~_3917;
    int _3945 = _3943 + 1;
    int _3947 = _3945 + 1;
    float _3949 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3951 = int(_3949);
    int _3953 = ~_3913;
    int _3955 = _3953 + 1;
    int _3957 = _3955 + 1;
    float _3959 = -_168;
    float _3961 = fma(_3959, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3853);
    int _3963 = abs(_3575);
    int _3965 = _3711 + 8;
    uint _3967 = uint(int(uint(_3965) >> uint(2)));
    uint _3969 = uint(int(uint(int(_3967)) >> uint(2)));
    int _3971 = int(_3967) & 3;
    float _3973 = (*spvDescriptorSet0.vp_c9)._m0[int(_3969)][_3971];
    int _3975 = int(_3967) + 1;
    uint _3977 = uint(int(uint(_3975) >> uint(2)));
    int _3979 = _3975 & 3;
    float _3981 = (*spvDescriptorSet0.vp_c9)._m0[int(_3977)][_3979];
    int _3983 = _3947 * as_type<int>(_3701);
    int _3985 = abs(_3587);
    int _3987 = _3957 * as_type<int>(_3745);
    int _3989 = abs(_3539);
    float _3991 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3993 = abs(_2795);
    float _3995 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3863);
    int _3997 = _3807 + 8;
    uint _3999 = uint(int(uint(_3997) >> uint(2)));
    uint _4001 = uint(int(uint(int(_3999)) >> uint(2)));
    int _4003 = int(_3999) & 3;
    float _4005 = (*spvDescriptorSet0.vp_c9)._m0[int(_4001)][_4003];
    int _4007 = int(_3999) + 1;
    uint _4009 = uint(int(uint(_4007) >> uint(2)));
    int _4011 = _4007 & 3;
    float _4013 = (*spvDescriptorSet0.vp_c9)._m0[int(_4009)][_4011];
    int _4015 = ~_3937;
    int _4017 = _4015 + 1;
    int _4019 = _4017 + 1;
    int _4021 = ~_3993;
    int _4023 = _4021 + 1;
    int _4025 = _4023 + 1;
    int _4027 = _4019 * as_type<int>(_3823);
    int _4029 = abs(_3559);
    int _4031 = ~_3989;
    int _4033 = _4031 + 1;
    int _4035 = _4033 + 1;
    float _4037 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _4039 = ~_3985;
    int _4041 = _4039 + 1;
    int _4043 = _4041 + 1;
    int _4045 = _4025 * as_type<int>(_3847);
    int _4047 = ~_4029;
    int _4049 = _4047 + 1;
    int _4051 = _4049 + 1;
    int _4053 = _4035 * as_type<int>(_3693);
    int _4055 = _4053 + _3983;
    int _4057 = abs(_2579);
    int _4059 = _4043 * as_type<int>(_3839);
    int _4061 = _4059 + _4045;
    int _4063 = ~_3963;
    int _4065 = _4063 + 1;
    int _4067 = _4065 + 1;
    float _4069 = fma(_3075, (*spvDescriptorSet0.vp_c9)._m0[83].w, _4037);
    int _4071 = abs(_2731);
    float _4073 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4075 = int(_4073);
    int _4077 = _4051 * as_type<int>(_3737);
    int _4079 = _4077 + _3987;
    int _4081 = abs(_3601);
    int _4083 = _4067 * as_type<int>(_3815);
    int _4085 = _4083 + _4027;
    int _4087 = ~_4057;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    float _4093 = _3991 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4095 = ~_4071;
    int _4097 = _4095 + 1;
    int _4099 = _4097 + 1;
    float _4101 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4069);
    int _4103 = abs(_2655);
    int _4105 = _4091 * as_type<int>(_3881);
    int _4107 = _4105 + _4055;
    float _4109 = float(uint(_3771));
    int _4111 = _4099 * as_type<int>(_3927);
    int _4113 = _4111 + _4085;
    int _4115 = ~_4081;
    int _4117 = _4115 + 1;
    int _4119 = _4117 + 1;
    float _4121 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4123 = log2(_4121);
    int _4125 = abs(_2603);
    float _4127 = fma(_4093, _2909, -0.5);
    int _4129 = ~_4103;
    int _4131 = _4129 + 1;
    int _4133 = _4131 + 1;
    int _4135 = _4119 * as_type<int>(_3889);
    int _4137 = _4135 + _4107;
    int _4139 = abs(_3665);
    int _4141 = ~_4125;
    int _4143 = _4141 + 1;
    int _4145 = _4143 + 1;
    float _4147 = 1.0 / _4109;
    bool _4149 = !_3671;
    int _4151 = _4149 ? 0 : (-1);
    int _4153 = _4133 * as_type<int>(_3973);
    int _4155 = _4153 + _4079;
    int _4157 = ~_4139;
    int _4159 = _4157 + 1;
    int _4161 = _4159 + 1;
    int _4163 = _4137 * _4145;
    float _4165 = float(uint(_4075));
    int _4167 = abs(_2785);
    int _4169 = _4161 * as_type<int>(_3981);
    int _4171 = _4169 + _4155;
    int _4173 = abs(_4151);
    float _4175 = 1.0 / _4165;
    int _4177 = abs(_2683);
    int _4179 = _3767 * _4125;
    int _4181 = _4179 + _4163;
    float _4183 = float(uint(_3719));
    int _4185 = ~_4173;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    int _4191 = ~_4167;
    int _4193 = _4191 + 1;
    int _4195 = _4193 + 1;
    float _4197 = 1.0 / _4183;
    int _4199 = ~_4177;
    int _4201 = _4199 + 1;
    int _4203 = _4201 + 1;
    int _4205 = _4189 * as_type<int>(_3935);
    int _4207 = _4205 + _4113;
    int _4209 = abs(_3781);
    int _4211 = _4195 * as_type<int>(_4005);
    int _4213 = _4211 + _4061;
    int _4215 = as_type<int>(_4147) + (-2);
    int _4217 = _4203 * _4171;
    int _4219 = abs(_2819);
    float _4221 = float(uint(_4181));
    int _4223 = _3775 * _4177;
    int _4225 = _4223 + _4217;
    float _4227 = float(uint(_3951));
    int _4229 = abs(_2921);
    float _4231 = as_type<float>(_4215) * _4221;
    int _4233 = ~_4209;
    int _4235 = _4233 + 1;
    int _4237 = _4235 + 1;
    int _4239 = ~_4219;
    int _4241 = _4239 + 1;
    int _4243 = _4241 + 1;
    float _4245 = 1.0 / _4227;
    bool _4247 = _1326 == 0;
    int _4249 = _4237 * as_type<int>(_4013);
    int _4251 = _4249 + _4213;
    int _4253 = _4243 * _4207;
    bool _4255 = !_4247;
    int _4257 = _4255 ? _3941 : (-1);
    float _4259 = _4123 * _168;
    int _4261 = ~_4229;
    int _4263 = _4261 + 1;
    int _4265 = _4263 + 1;
    float _4267 = trunc(_4231);
    float _4269 = precise::max(_4267, 0.0);
    uint _4271 = uint(_4269);
    int _4273 = as_type<int>(_4175) + (-2);
    int _4275 = _4257 * _4219;
    int _4277 = _4275 + _4253;
    float _4279 = float(uint(_4225));
    int _4281 = _4265 * _4251;
    bool _4283 = _1306 == 0;
    float _4285 = _3467 * _3617;
    int _4287 = as_type<int>(_4197) + (-2);
    float _4289 = as_type<float>(_4273) * _4279;
    bool _4291 = !_4283;
    int _4293 = _4291 ? _3911 : (-1);
    float _4295 = exp2(_4259);
    float _4297 = float(uint(_4277));
    int _4299 = ~_3771;
    int _4301 = _4299 + 1;
    int _4303 = _4293 * _4229;
    int _4305 = _4303 + _4281;
    int _4307 = as_type<int>(_4245) + (-2);
    float _4309 = as_type<float>(_4287) * _4297;
    int _4311 = abs(_3771);
    float _4313 = trunc(_4289);
    float _4315 = precise::max(_4313, 0.0);
    uint _4317 = uint(_4315);
    float _4319 = float(uint(_4305));
    int _4321 = _4301 * int(_4271);
    int _4323 = _4321 + _4181;
    float _4325 = float(uint(_4311));
    float _4327 = -_4285;
    float _4329 = fma(_4327, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3467);
    int _4331 = abs(_4075);
    float _4333 = as_type<float>(_4307) * _4319;
    float _4335 = float(uint(_4323));
    float _4337 = trunc(_4309);
    float _4339 = precise::max(_4337, 0.0);
    uint _4341 = uint(_4339);
    int _4343 = ~_4075;
    int _4345 = _4343 + 1;
    float _4347 = fma(_4329, _4329, _3759);
    int _4349 = ~_3719;
    int _4351 = _4349 + 1;
    float _4353 = as_type<float>(_4215) * _4335;
    float _4355 = float(uint(_4331));
    int _4357 = abs(_3719);
    float _4359 = trunc(_4333);
    float _4361 = precise::max(_4359, 0.0);
    uint _4363 = uint(_4361);
    int _4365 = _4345 * int(_4317);
    int _4367 = _4365 + _4225;
    int _4369 = ~_3951;
    int _4371 = _4369 + 1;
    float _4373 = float(uint(_4367));
    float _4375 = 1.0 / _4325;
    int _4377 = _4351 * int(_4341);
    int _4379 = _4377 + _4277;
    float _4381 = as_type<float>(_4273) * _4373;
    float _4383 = float(uint(_4357));
    float _4385 = float(uint(_4379));
    float _4387 = 1.0 / _4355;
    int _4389 = _4371 * int(_4363);
    int _4391 = _4389 + _4305;
    int _4393 = abs(_3951);
    float _4395 = as_type<float>(_4287) * _4385;
    int _4397 = abs(_4181);
    float _4399 = float(uint(_4391));
    float _4401 = 1.0 / _4383;
    float _4403 = float(uint(_4393));
    int _4405 = abs(_4225);
    float _4407 = as_type<float>(_4307) * _4399;
    int _4409 = as_type<int>(_4375) + (-2);
    float _4411 = float(uint(_4397));
    float _4413 = 1.0 / _4403;
    int _4415 = as_type<int>(_4387) + (-2);
    int _4417 = abs(_4277);
    float _4419 = as_type<float>(_4409) * _4411;
    float _4421 = float(uint(_4405));
    float _4423 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4425 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4427 = isnan(1.0);
    bool _4429 = _4425 || _4427;
    bool _4431 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4433 = _4429 || _4431;
    float _4435 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4437 = 1.0 + _4435;
    float _4439 = as_type<float>(_4415) * _4421;
    float _4441 = trunc(_4419);
    float _4443 = precise::max(_4441, 0.0);
    uint _4445 = uint(_4443);
    float _4447 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4423);
    int _4449 = as_type<int>(_4401) + (-2);
    float _4451 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4453 = float(uint(_4417));
    float _4455 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4457 = abs(_4305);
    float _4459 = 1.0 / _4437;
    float _4461 = as_type<float>(_4449) * _4453;
    int _4463 = as_type<int>(_4413) + (-2);
    float _4465 = -_4295;
    float _4467 = _4465 + 1.0;
    float _4469 = float(uint(_4457));
    float _4471 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4473 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4475 = isnan(0.0);
    bool _4477 = _4473 || _4475;
    bool _4479 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4481 = _4477 || _4479;
    float _4483 = trunc(_4439);
    float _4485 = precise::max(_4483, 0.0);
    uint _4487 = uint(_4485);
    float _4489 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4451);
    float _4491 = fma(_1525, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4455);
    float _4493 = as_type<float>(_4463) * _4469;
    int _4495 = ~_4311;
    int _4497 = _4495 + 1;
    float _4499 = fma(_1220, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4471);
    float _4501 = _4481 ? _4467 : 0.0;
    float _4503 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4489);
    float _4505 = trunc(_4461);
    float _4507 = precise::max(_4505, 0.0);
    uint _4509 = uint(_4507);
    int _4511 = ~_4331;
    int _4513 = _4511 + 1;
    float _4515 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3611);
    int _4517 = _4497 * int(_4445);
    int _4519 = _4517 + _4397;
    float _4521 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4499);
    float _4523 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4447);
    float _4525 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4491);
    int _4527 = ~_4393;
    int _4529 = _4527 + 1;
    float _4531 = trunc(_4381);
    float _4533 = precise::max(_4531, 0.0);
    uint _4535 = uint(_4533);
    float _4537 = float(uint(_4519));
    float _4539 = -_3661;
    float _4541 = fma(_4515, _4127, _4539);
    float _4543 = as_type<float>(_4409) * _4537;
    float _4545 = trunc(_4353);
    float _4547 = precise::max(_4545, 0.0);
    uint _4549 = uint(_4547);
    float _4551 = trunc(_4493);
    float _4553 = precise::max(_4551, 0.0);
    uint _4555 = uint(_4553);
    float _4557 = -_168;
    float _4559 = fma(_4557, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3763);
    float _4561 = _4285;
    if (_4433)
    {
        float _4563 = _4501 * _4459;
        _170 = _4563;
    }
    float _4565 = _170;
    int _4567 = _4513 * int(_4487);
    int _4569 = _4567 + _4405;
    int _4571 = ~_4357;
    int _4573 = _4571 + 1;
    float _4575 = fma(_3643, _3473, _4559);
    int _4577 = int(_4317) + int(_4535);
    float _4579 = trunc(_4395);
    float _4581 = precise::max(_4579, 0.0);
    uint _4583 = uint(_4581);
    int _4585 = int(_4271) + int(_4549);
    float _4587 = trunc(_4407);
    float _4589 = precise::max(_4587, 0.0);
    uint _4591 = uint(_4589);
    float _4593 = float(uint(_4569));
    int _4595 = _4573 * int(_4509);
    int _4597 = _4595 + _4417;
    int _4599 = _4529 * int(_4555);
    int _4601 = _4599 + _4457;
    float _4603 = as_type<float>(_4415) * _4593;
    int _4605 = ~_3771;
    int _4607 = _4605 + 1;
    float _4609 = trunc(_4543);
    float _4611 = precise::max(_4609, 0.0);
    uint _4613 = uint(_4611);
    float _4615 = float(uint(_4597));
    int _4617 = int(_4341) + int(_4583);
    float _4619 = as_type<float>(_4449) * _4615;
    int _4621 = ~_4075;
    int _4623 = _4621 + 1;
    float _4625 = trunc(_4603);
    float _4627 = precise::max(_4625, 0.0);
    uint _4629 = uint(_4627);
    int _4631 = int(_4363) + int(_4591);
    int _4633 = _4607 * _4585;
    int _4635 = _4633 + _4181;
    float _4637 = float(uint(_4601));
    int _4639 = ~_3951;
    int _4641 = _4639 + 1;
    float _4643 = as_type<float>(_4463) * _4637;
    int _4645 = ~_3719;
    int _4647 = _4645 + 1;
    float _4649 = trunc(_4619);
    float _4651 = precise::max(_4649, 0.0);
    uint _4653 = uint(_4651);
    bool _4655 = uint(_4635) >= uint(_3771);
    int _4657 = _4623 * _4577;
    int _4659 = _4657 + _4225;
    bool _4661 = uint(_4659) >= uint(_4075);
    float _4663 = trunc(_4643);
    float _4665 = precise::max(_4663, 0.0);
    uint _4667 = uint(_4665);
    int _4669 = _4641 * _4631;
    int _4671 = _4669 + _4305;
    bool _4673 = !_4655;
    int _4675 = _4673 ? 0 : (-1);
    int _4677 = _4647 * _4617;
    int _4679 = _4677 + _4277;
    int _4681 = int(_4445) + int(_4613);
    int _4683 = int(_4487) + int(_4629);
    bool _4685 = uint(_4679) >= uint(_3719);
    float _4687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4689 = !_4661;
    int _4691 = _4689 ? 0 : (-1);
    bool _4693 = uint(_4671) >= uint(_3951);
    int _4695 = ~_4331;
    int _4697 = _4695 + 1;
    int _4699 = ~_4311;
    int _4701 = _4699 + 1;
    int _4703 = int(_4555) + int(_4667);
    int _4705 = _4701 * _4681;
    int _4707 = _4705 + _4397;
    int _4709 = ~_4393;
    int _4711 = _4709 + 1;
    float _4713 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4715 = int(_4509) + int(_4653);
    int _4717 = _4697 * _4683;
    int _4719 = _4717 + _4405;
    int _4721 = ~_4357;
    int _4723 = _4721 + 1;
    int _4725 = _4711 * _4703;
    int _4727 = _4725 + _4457;
    bool _4729 = !_4685;
    int _4731 = _4729 ? 0 : (-1);
    float _4733 = _4687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4735 = uint(_4707) >= uint(_4311);
    int _4737 = _4723 * _4715;
    int _4739 = _4737 + _4417;
    bool _4741 = !_4693;
    int _4743 = _4741 ? 0 : (-1);
    float _4745 = fma(_4733, _1703, -0.5);
    bool _4747 = uint(_4719) >= uint(_4331);
    int _4749 = ~_4585;
    int _4751 = _4749 + _4675;
    int _4753 = _4751 + 1;
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4757 = !_4747;
    int _4759 = _4757 ? 0 : (-1);
    float _4761 = _2913 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4763 = ~_4577;
    int _4765 = _4763 + _4691;
    int _4767 = _4765 + 1;
    int _4769 = _3771 * _4753;
    int _4771 = _4769 + _4181;
    bool _4773 = uint(_4727) >= uint(_4393);
    float _4775 = _4713 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4777 = ~_4631;
    int _4779 = _4777 + _4743;
    int _4781 = _4779 + 1;
    int _4783 = _4075 * _4767;
    int _4785 = _4783 + _4225;
    bool _4787 = !_4773;
    int _4789 = _4787 ? 0 : (-1);
    float _4791 = fma(_4775, _2821, -0.5);
    bool _4793 = _4075 == 0;
    int _4795 = _3951 * _4781;
    int _4797 = _4795 + _4305;
    int _4799 = ~_4617;
    int _4801 = _4799 + _4731;
    int _4803 = _4801 + 1;
    bool _4805 = !_4793;
    int _4807 = _4805 ? _4785 : (-1);
    float _4809 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4811 = _3951 == 0;
    bool _4813 = !_4735;
    int _4815 = _4813 ? 0 : (-1);
    int _4817 = _4181 ^ _3771;
    bool _4819 = uint(_4739) >= uint(_4357);
    int _4821 = _3719 * _4803;
    int _4823 = _4821 + _4277;
    bool _4825 = !_4811;
    int _4827 = _4825 ? _4797 : (-1);
    bool _4829 = _4075 == 0;
    int _4831 = _4225 ^ _4075;
    float _4833 = _1465 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4835 = uint(int(uint(_4817) >> uint(31)));
    float _4837 = _4761 * _4809;
    bool _4839 = !_4819;
    int _4841 = _4839 ? 0 : (-1);
    float _4843 = _4833 * _4755;
    bool _4845 = _3771 == 0;
    float _4847 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4849 = uint(int(uint(_4831) >> uint(31)));
    int _4851 = ~_4815;
    int _4853 = _4681 + _4851;
    int _4855 = _4853 + 1;
    out.m_79.x = _4843;
    out.m_79.y = _4837;
    int _4857 = ~int(_4835);
    int _4859 = _4857 + 1;
    bool _4861 = !_4845;
    int _4863 = _4861 ? _4771 : (-1);
    float _4865 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4867 = _3719 == 0;
    int _4869 = ~_4759;
    int _4871 = _4683 + _4869;
    int _4873 = _4871 + 1;
    int _4875 = ~int(_4849);
    int _4877 = _4875 + 1;
    int _4879 = _4855 ^ _4859;
    float _4881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4883 = !_4867;
    int _4885 = _4883 ? _4823 : (-1);
    int _4887 = _4873 ^ _4877;
    bool _4889 = _3771 == 0;
    int _4891 = ~_4859;
    int _4893 = _4891 + _4879;
    int _4895 = _4893 + 1;
    float _4897 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4899 = ~_4877;
    int _4901 = _4899 + _4887;
    int _4903 = _4901 + 1;
    float _4905 = _4865 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4907 = !_4889;
    int _4909 = _4907 ? _4895 : (-1);
    bool _4911 = _3719 == 0;
    float _4913 = fma(_4905, _1691, -0.5);
    int _4915 = _4277 ^ _3719;
    float _4917 = float(_4863);
    bool _4919 = !_4829;
    int _4921 = _4919 ? _4903 : (-1);
    float _4923 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4925 = _3951 == 0;
    float _4927 = fma(_4733, _4917, _3457);
    int _4929 = _4305 ^ _3951;
    float _4931 = _4847 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4933 = float(_4885);
    float _4935 = fma(_4523, _4745, _4927);
    uint _4937 = uint(int(uint(_4929) >> uint(31)));
    float _4939 = fma(_4931, _1751, -0.5);
    int _4941 = ~_4789;
    int _4943 = _4703 + _4941;
    int _4945 = _4943 + 1;
    float _4947 = fma(_4931, _4933, _3961);
    int _4949 = ~int(_4937);
    int _4951 = _4949 + 1;
    float _4953 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4955 = float(_4807);
    float _4957 = fma(_4525, _4939, _4947);
    int _4959 = _4945 ^ _4951;
    uint _4961 = uint(int(uint(_4915) >> uint(31)));
    float _4963 = fma(_4905, _4955, _3899);
    float _4965 = float(_4827);
    float _4967 = _4881 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4969 = ~_4951;
    int _4971 = _4969 + _4959;
    int _4973 = _4971 + 1;
    float _4975 = fma(_3647, _4913, _4963);
    int _4977 = ~_4841;
    int _4979 = _4715 + _4977;
    int _4981 = _4979 + 1;
    float _4983 = fma(_4967, _2469, -0.5);
    int _4985 = ~int(_4961);
    int _4987 = _4985 + 1;
    float _4989 = fma(_4967, _4965, _3635);
    float _4991 = float(_4909);
    float _4993 = _4953 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4995 = !_4925;
    int _4997 = _4995 ? _4973 : (-1);
    float _4999 = fma(_3505, _4983, _4989);
    int _5001 = _4981 ^ _4987;
    float _5003 = -_2939;
    float _5005 = fma(_4775, _4991, _5003);
    float _5007 = float(_4921);
    float _5009 = _4897 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _5011 = float(_4997);
    float _5013 = _4923 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _5015 = ~_4987;
    int _5017 = _5015 + _5001;
    int _5019 = _5017 + 1;
    float _5021 = fma(_5009, _2831, -0.5);
    float _5023 = -_3915;
    float _5025 = fma(_5009, _5007, _5023);
    float _5027 = fma(_4993, _2849, -0.5);
    bool _5029 = !_4911;
    int _5031 = _5029 ? _5019 : (-1);
    float _5033 = -_3639;
    float _5035 = fma(_4993, _5011, _5033);
    float _5037 = fma(_4503, _4791, _5005);
    float _5039 = fma(_4101, _5021, _5025);
    float _5041 = float(_5031);
    float _5043 = fma(_3589, _5027, _5035);
    float _5045 = fma(_5013, _2845, -0.5);
    float _5047 = _4957 + 0.5;
    float _5049 = _4575 + 0.5;
    float _5051 = -_3995;
    float _5053 = fma(_5013, _5041, _5051);
    float _5055 = _5043 + 0.5;
    float _5057 = _4541 + 0.5;
    float _5059 = in.m_81.x;
    float _5061 = in.m_81.y;
    float _5063 = in.m_81.z;
    float _5065 = fma(_4521, _5045, _5053);
    float _5067 = _4935 + 0.5;
    float _5069 = _4975 + 0.5;
    float _5071 = _5037 + 0.5;
    float _5073 = _5065 + 0.5;
    float _5075 = _5039 + 0.5;
    float _5077 = _4999 + 0.5;
    bool _5079 = !_3793;
    int _5081 = _5079 ? 0 : 1;
    out.m_83.x = _5049;
    out.m_83.y = _5057;
    bool _5083 = !_3797;
    int _5085 = _5083 ? 0 : 1;
    int _5087 = abs(_5081);
    out.m_85.x = _5067;
    out.m_85.y = _5071;
    out.m_85.z = _5069;
    out.m_85.w = _5075;
    int _5089 = abs(_5085);
    bool _5091 = !_3801;
    int _5093 = _5091 ? 0 : 1;
    out.m_87.x = _5047;
    out.m_87.y = _5073;
    float _5095 = float(_5087);
    out.m_89.x = _5077;
    out.m_89.y = _5055;
    float _5097 = float(_3907);
    float _5099 = _4939;
    float _5101 = as_type<float>(_4739);
    float _5103 = as_type<float>(_4767);
    float _5105 = _4575;
    if (_3495)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5107 = -_3655;
    float _5109 = fma(_5107, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3135);
    float _5111 = _5095 * _5097;
    float _5113 = float(_3011);
    float _5115 = -_3651;
    float _5117 = fma(_5115, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2923);
    float _5119 = float(_5089);
    float _5121 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5123 = _5109 + _5121;
    float _5125 = _5111 * (-2.0);
    float _5127 = -_4285;
    float _5129 = fma(_5127, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3337);
    float _5131 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5133 = _5117 + _5131;
    float _5135 = _5123 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5137 = _5119 * _5113;
    float _5139 = _1525 + (-0.5);
    float _5141 = fma(_5125, _5059, _5059);
    float _5143 = _1220 + _1535;
    float _5145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5147 = _5129 + _5145;
    float _5149 = fma(_5133, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5135);
    float _5151 = fma(_5139, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5141);
    float _5153 = _5143 + (-1.0);
    float _5155 = _5137 * (-2.0);
    float _5157 = fma(_5147, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5149);
    float _5159 = _1220 + (-0.5);
    float _5161 = fma(_5153, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5163 = fma(_5155, _5061, _5061);
    float _5165 = fma(_3521, _5125, _3521);
    bool _5167 = _5157 >= 0.0;
    float _5169 = fma(_5161, _5155, _5161);
    float _5171 = fma(_5159, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5163);
    float _5173 = fma(_5165, _4565, _5151);
    int _5175 = abs(_5093);
    float _5177 = sqrt(_4347);
    float _5179 = fma(_5169, _4565, _5171);
    float _5181 = _5173 * 0.15915493667125701904296875;
    float _5183 = _1525 + _1535;
    float _5185 = _5179 * 0.15915493667125701904296875;
    float _5187 = float(_3393);
    float _5189 = _5155;
    float _5191 = _5137;
    if (_5167)
    {
        _5189 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5193 = _5189;
    float _5195 = _5181 * 6.283185482025146484375;
    float _5197 = sin(_5195);
    float _5199 = float(_5175);
    int _5201 = as_type<int>(_5193);
    if (_5167)
    {
        out.m_53.x = 0.0;
    }
    if (_5167)
    {
        float _5203 = _5193 * 5.0;
        _5201 = as_type<int>(_5203);
    }
    int _5205 = _5201;
    float _5207 = _5199 * _5187;
    float _5209 = _5183 + (-1.0);
    float _5211 = _5181 * 6.283185482025146484375;
    float _5213 = cos(_5211);
    if (_5167)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14410 = as_type<float>(_5205);
        out.gl_Position.z = _14410;
    }
    float _5215 = _5207 * (-2.0);
    float _5217 = _5185 * 6.283185482025146484375;
    float _5219 = sin(_5217);
    if (_5167)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5221 = -_3135;
    float _5223 = _5221 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5225 = -_2923;
    float _5227 = _5225 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5229 = fma(_5215, _5063, _5063);
    float _5231 = -_3337;
    float _5233 = _5231 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5235 = _5223 * _5223;
    float _5237 = fma(_5209, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5239 = _1535 + (-0.5);
    float _5241 = _5185 * 6.283185482025146484375;
    float _5243 = cos(_5241);
    float _5245 = fma(_5227, _5227, _5235);
    float _5247 = fma(_5237, _5215, _5237);
    float _5249 = fma(_5239, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5229);
    float _5251 = _3617 * _5177;
    float _5253 = fma(_5233, _5233, _5245);
    float _5255 = _5197 * _5219;
    float _5257 = fma(_5247, _4565, _5249);
    float _5259 = rsqrt(_5253);
    float _5261 = _5257 * 0.15915493667125701904296875;
    float _5263 = in.m_91.x;
    float _5265 = in.m_91.y;
    float _5267 = in.m_91.z;
    float _5269 = _5213 * _5243;
    float _5271 = _5197 * _5243;
    float _5273 = _5261 * 6.283185482025146484375;
    float _5275 = sin(_5273);
    float _5277 = _5227 * _5259;
    float _5279 = _5233 * _5259;
    float _5281 = _5223 * _5259;
    float _5283 = _5261 * 6.283185482025146484375;
    float _5285 = cos(_5283);
    float _5287 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5289 = _5277 * _5287;
    float _5291 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5293 = _5279 * _5291;
    float _5295 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5297 = _5281 * _5295;
    float _5299 = _718 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5301 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5303 = -_5289;
    float _5305 = fma(_5279, _5301, _5303);
    float _5307 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5309 = -_5293;
    float _5311 = fma(_5281, _5307, _5309);
    float _5313 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5315 = -_5297;
    float _5317 = fma(_5277, _5313, _5315);
    float _5319 = fma(_5275, _5269, _5255);
    float _5321 = _5305 * _5305;
    float _5323 = fma(_5275, _5255, _5269);
    float _5325 = _716 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5327 = fma(_5311, _5311, _5321);
    float _5329 = _5213 * _5219;
    float _5331 = _5251 * _5325;
    float _5333 = _714 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5335 = fma(_5317, _5317, _5327);
    float _5337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5265);
    float _5339 = _5213 * _5285;
    float _5341 = _5243 * _5285;
    float _5343 = rsqrt(_5335);
    float _5345 = _5337 * _5331;
    float _5347 = _5251 * _5299;
    float _5349 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5263);
    float _5351 = _5197 * _5285;
    float _5353 = _5219 * _5285;
    float _5355 = _5251 * _5333;
    float _5357 = _5349 * _5347;
    float _5359 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5267);
    float _5361 = _5339 * _5345;
    float _5363 = -_5329;
    float _5365 = fma(_5275, _5271, _5363);
    float _5367 = -_5271;
    float _5369 = fma(_5275, _5329, _5367);
    float _5371 = _5359 * _5355;
    float _5373 = fma(_5319, _5357, _5361);
    float _5375 = _5351 * _5345;
    float _5377 = _5311 * _5343;
    float _5379 = _5305 * _5343;
    float _5381 = _5317 * _5343;
    float _5383 = -_5345;
    float _5385 = _5275 * _5383;
    float _5387 = _5281 * _5377;
    float _5389 = _5279 * _5379;
    float _5391 = fma(_5369, _5371, _5373);
    float _5393 = fma(_5341, _5357, _5385);
    float _5395 = -_5387;
    float _5397 = fma(_5277, _5379, _5395);
    float _5399 = -_5389;
    float _5401 = fma(_5281, _5381, _5399);
    float _5403 = fma(_5365, _5357, _5375);
    float _5405 = fma(_5353, _5371, _5393);
    float _5407 = _5397 * _5391;
    float _5409 = _5401 * _5391;
    float _5411 = fma(_5323, _5371, _5403);
    float _5413 = fma(_5381, _5405, _5407);
    float _5415 = fma(_5377, _5405, _5409);
    float _5417 = fma(_5279, _5411, _5413);
    float _5419 = fma(_5277, _5411, _5415);
    float _5421 = _3337 + _5417;
    float _5423 = _2923 + _5419;
    float _5425 = _5277 * _5381;
    float _5427 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5429 = _5421 + _5427;
    float _5431 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5433 = _5423 + _5431;
    float _5435 = -_5425;
    float _5437 = fma(_5279, _5377, _5435);
    float _5439 = _5429 * _5429;
    float _5441 = _5433 * _5433;
    float _5443 = _5437 * _5391;
    float _5445 = _5441 + _5439;
    float _5447 = fma(_5379, _5405, _5443);
    float _5449 = sqrt(_5445);
    float _5451 = fma(_5281, _5411, _5447);
    float _5453 = _3135 + _5451;
    bool _5455 = _5449 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5457 = _5423;
    float _5459 = _5421;
    float _5461 = _5441;
    float _5463 = _5439;
    if (!_5455)
    {
        _5099 = _5453;
    }
    float _5465 = _5099;
    bool _5467 = !_5455;
    float _5469 = _5465;
    if (!_5467)
    {
        float _5471 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5473 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5475 = _5449 + _5473;
        float _5477 = rsqrt(_5445);
        float _5479 = _5475 * _5471;
        float _5481 = _5453 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5483 = _5479 * 0.15915493667125701904296875;
        float _5485 = _5483 * 6.283185482025146484375;
        float _5487 = sin(_5485);
        float _5489 = _5483 * 6.283185482025146484375;
        float _5491 = cos(_5489);
        float _5493 = fma(_5487, _5481, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5495 = _5477 * _5493;
        float _5497 = _5491 + (-1.0);
        float _5499 = fma(_5433, _5495, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5501 = fma(_5429, _5495, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5503 = _5497 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5505 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5507 = _5499 + _5505;
        float _5509 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5511 = _5501 + _5509;
        float _5513 = fma(_5453, _5491, _5503);
        float _5515 = _5507 * _5507;
        float _5517 = _5511 * _5511;
        _5457 = _5499;
        _5459 = _5501;
        _5469 = _5513;
        _5461 = _5515;
        _5463 = _5517;
    }
    float _5519 = _5457;
    float _5521 = _5459;
    float _5523 = _5469;
    float _5525 = _5461;
    float _5527 = _5463;
    float _5529 = fma(_5519, 6.2500002968590706586837768554688e-05, 0.5);
    float _5531 = fma(_5521, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14903 = float2(_5529, _5531);
    float3 _5535 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14903, float2(0.0), isnan(_14903)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14903, float2(0.0), isnan(_14903)), level(0.0)).xyz;
    float _5537 = _5535.x;
    float _5539 = _5535.y;
    float _5541 = _5535.z;
    float _5543 = in.m_93.x;
    float _5545 = in.m_93.y;
    float _5547 = in.m_93.z;
    bool _5549 = _5265 != 0.0;
    bool _5551 = isnan(_5265);
    bool _5553 = _5549 || _5551;
    bool _5555 = isnan(0.0);
    bool _5557 = _5553 || _5555;
    float _5559 = in.m_95.x;
    float _5561 = in.m_95.y;
    float _5563 = in.m_95.z;
    float _5565 = in.m_95.w;
    bool _5567 = _5263 == 0.0;
    bool _5569 = !_5557;
    bool _5571 = _5567 && _5569;
    bool _5573 = _5267 == 0.0;
    bool _5575 = _5573 && _5571;
    float _5577 = _5543;
    if (_5575)
    {
        _5191 = _5543;
    }
    float _5579 = _5191;
    float _5581 = _5579;
    if (_5575)
    {
        _3005 = _5547;
    }
    float _5583 = _3005;
    float _5585 = _5583;
    if (_5575)
    {
        _5101 = _5545;
    }
    float _5587 = _5101;
    float _5589 = _5587;
    if (_5575)
    {
        _5103 = _5579;
    }
    float _5591 = _5103;
    float _5593 = _5591;
    if (!_5575)
    {
        _5581 = _5543;
    }
    float _5595 = _5581;
    if (_5575)
    {
        _5105 = _5583;
    }
    float _5597 = _5105;
    float _5599 = _5597;
    if (!_5575)
    {
        _5585 = _5547;
    }
    float _5601 = _5585;
    if (!_5575)
    {
        float _5603 = fma(_5263, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5595);
        _5593 = _5603;
    }
    float _5605 = _5593;
    if (_5575)
    {
        _5577 = _5587;
    }
    float _5607 = _5577;
    float _5609 = _5563 * _5595;
    float _5611 = _5607;
    if (!_5575)
    {
        _5589 = _5545;
    }
    float _5613 = _5589;
    float _5615 = _5561 * _5601;
    if (!_5575)
    {
        float _5617 = fma(_5267, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5601);
        _5599 = _5617;
    }
    float _5619 = _5599;
    float _5621 = -_5609;
    float _5623 = fma(_5559, _5601, _5621);
    float _5625 = _5339 * _5437;
    float _5627 = _5559 * _5613;
    float _5629 = -_5615;
    float _5631 = fma(_5563, _5613, _5629);
    if (!_5575)
    {
        float _5633 = fma(_5265, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5613);
        _5611 = _5633;
    }
    float _5635 = _5611;
    float _5637 = _5319 * _5401;
    float _5639 = -_5627;
    float _5641 = fma(_5561, _5595, _5639);
    float _5643 = _5319 * _5437;
    float _5645 = _5319 * _5397;
    float _5647 = _5339 * _5401;
    float _5649 = _5623 * _5565;
    float _5651 = _5631 * _5565;
    float _5653 = _5339 * _5397;
    float _5655 = _5641 * _5565;
    float _5657 = _5369 * _5401;
    float _5659 = _5369 * _5437;
    float _5661 = _5369 * _5397;
    float _5663 = fma(_5341, _5377, _5637);
    float _5665 = fma(_5341, _5379, _5643);
    float _5667 = -_5275;
    float _5669 = fma(_5667, _5379, _5625);
    float _5671 = fma(_5341, _5381, _5645);
    float _5673 = -_5275;
    float _5675 = fma(_5673, _5377, _5647);
    float _5677 = -_5275;
    float _5679 = fma(_5677, _5381, _5653);
    float _5681 = fma(_5353, _5377, _5657);
    float _5683 = fma(_5353, _5379, _5659);
    float _5685 = fma(_5353, _5381, _5661);
    float _5687 = fma(_5351, _5281, _5669);
    float _5689 = fma(_5365, _5277, _5663);
    float _5691 = fma(_5351, _5277, _5675);
    float _5693 = fma(_5351, _5279, _5679);
    float _5695 = fma(_5323, _5277, _5681);
    float _5697 = fma(_5323, _5281, _5683);
    float _5699 = fma(_5323, _5279, _5685);
    float _5701 = fma(_5365, _5281, _5665);
    float _5703 = _5687 * _5561;
    float _5705 = _5687 * _5635;
    float _5707 = fma(_5365, _5279, _5671);
    float _5709 = _5691 * _5635;
    float _5711 = _5649 * _5691;
    float _5713 = _5649 * _5687;
    float _5715 = _5693 * _5561;
    float _5717 = _5693 * _5635;
    float _5719 = _5649 * _5693;
    float _5721 = fma(_5701, _5559, _5703);
    float _5723 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5725 = _5523 + _5723;
    float _5727 = _5691 * _5561;
    float _5729 = fma(_5689, _5605, _5709);
    float _5731 = fma(_5707, _5559, _5715);
    float _5733 = fma(_5725, _5725, _5525);
    float _5735 = fma(_5689, _5559, _5727);
    float _5737 = fma(_5651, _5689, _5711);
    float _5739 = fma(_5701, _5605, _5705);
    float _5741 = _5733 + _5527;
    float _5743 = fma(_5707, _5605, _5717);
    float _5745 = fma(_5651, _5701, _5713);
    float _5747 = fma(_5651, _5707, _5719);
    float _5749 = fma(_5695, _5563, _5735);
    float _5751 = fma(_5697, _5563, _5721);
    float _5753 = sqrt(_5741);
    float _5755 = fma(_5699, _5563, _5731);
    float _5757 = fma(_5695, _5619, _5729);
    float _5759 = fma(_5655, _5695, _5737);
    float _5761 = fma(_5655, _5697, _5745);
    float _5763 = fma(_5655, _5699, _5747);
    float _5765 = fma(_5697, _5619, _5739);
    float _5767 = fma(_5699, _5619, _5743);
    out.m_97.x = _5749;
    out.m_97.y = _5751;
    out.m_97.z = _5755;
    out.m_99.x = _5759;
    out.m_99.y = _5761;
    out.m_99.z = _5763;
    out.m_101.x = _5757;
    out.m_101.y = _5765;
    out.m_101.z = _5767;
    bool _5769 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5771 = isnan(_5753);
    bool _5773 = _5769 || _5771;
    bool _5775 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5777 = _5773 || _5775;
    float _5779 = _5655;
    if (!_5777)
    {
        _5779 = 1.0;
    }
    float _5781 = _5779;
    out.m_103.x = _5537;
    out.m_103.y = _5539;
    out.m_103.z = _5541;
    bool _5783 = !_5777;
    float _5785 = _5781;
    if (!_5783)
    {
        bool _5787 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5789 = isnan(_5753);
        bool _5791 = _5787 || _5789;
        bool _5793 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5795 = _5791 || _5793;
        if (!_5795)
        {
            float _5797 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5799 = _5753 + _5797;
            float _5801 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5803 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5801;
            float _5805 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5807 = _5805 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5809 = 1.0 / _5803;
            float _5811 = _5799 * _5809;
            float _5813 = fma(_5811, _5807, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5785 = _5813;
            _5815 = true;
        }
        else
        {
            bool _5817 = _5753 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5819 = isnan(_5753);
            bool _5821 = _5817 || _5819;
            bool _5823 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5825 = _5821 || _5823;
            if (!_5825)
            {
                float _5827 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5829 = _5753 + _5827;
                float _5831 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5833 = _5831 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5835 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5837 = _5835 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5839 = 1.0 / _5833;
                float _5841 = _5829 * _5839;
                float _5843 = fma(_5841, _5837, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5785 = _5843;
                _5815 = true;
            }
            else
            {
                _5785 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5815 = false;
    float _5845 = _5785;
    float _5847 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5849 = _5523 + _5847;
    float _5851 = _5109 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5853 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5855 = _5519 + _5853;
    float _5857 = fma(_5849, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5859 = fma(_5117, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5851);
    float _5861 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5863 = _5521 + _5861;
    float _5865 = fma(_5855, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5867 = -_3135;
    float _5869 = _5867 + _5857;
    float _5871 = fma(_5129, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5859);
    float _5873 = fma(_5863, _5845, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5875 = -_2923;
    float _5877 = _5875 + _5865;
    float _5879 = _5869 * _5869;
    float _5881 = _5871 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5883 = _5109 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5885 = -_3337;
    float _5887 = _5885 + _5873;
    float _5889 = fma(_5877, _5877, _5879);
    float _5891 = 1.0 / _5881;
    float _5893 = fma(_5117, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5883);
    float _5895 = fma(_5887, _5887, _5889);
    float _5897 = fma(_5129, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5893);
    float _5899 = sqrt(_5895);
    float _5901 = _5897 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5903 = _5901 + _5881;
    float _5905 = _5903 * _5891;
    float _5907 = _5905 * 0.5;
    bool _5909 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5911 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5913 = _5909 || _5911;
    bool _5915 = isnan(0.5);
    bool _5917 = _5913 || _5915;
    float _5919 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5921 = fma(_5907, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5919);
    bool _5923 = _5899 > 0.0;
    float _5925 = 1.0 / _5921;
    bool _5927 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5929 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5931 = _5927 || _5929;
    bool _5933 = isnan(0.5);
    bool _5935 = _5931 || _5933;
    float _5937 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5939 = _5907;
    float _5941 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5943 = _5895;
    float _5945 = _5873;
    float _5947 = _5865;
    if (!_5923)
    {
        _5937 = _5865;
    }
    float _5949 = _5937;
    float _5951 = _5949;
    if (!_5923)
    {
        _5939 = _5857;
    }
    float _5953 = _5939;
    float _5955 = _5953;
    float _5957 = _5953;
    if (!_5923)
    {
        _5941 = _5873;
    }
    float _5959 = _5941;
    bool _5961 = !_5923;
    float _5963 = _5959;
    if (!_5961)
    {
        float _5965 = _230 * _230;
        float _5967 = rsqrt(_5895);
        float _5969 = fma(_226, _226, _5965);
        float _5971 = fma(_232, _232, _5969);
        float _5973 = sqrt(_5971);
        float _5975 = _5877 * _5967;
        float _5977 = _5869 * _5967;
        float _5979 = _5887 * _5967;
        bool _5981 = _5973 > 0.0;
        float _5983 = _5973;
        float _5985 = _5967;
        if (!_5981)
        {
            _5983 = _5865;
        }
        float _5987 = _5983;
        _5951 = _5987;
        if (!_5981)
        {
            _5955 = _5857;
        }
        float _5989 = _5955;
        _5957 = _5989;
        if (!_5981)
        {
            _5985 = _5873;
        }
        float _5991 = _5985;
        bool _5993 = !_5981;
        _5963 = _5991;
        if (!_5993)
        {
            float _5995 = rsqrt(_5971);
            float _5997 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5999 = _230 * _5995;
            float _6001 = _226 * _5995;
            float _6003 = _232 * _5995;
            float _6005 = _5977 * _5999;
            float _6007 = fma(_5975, _6001, _6005);
            float _6009 = _5997 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _6011 = fma(_5979, _6003, _6007);
            float _6013 = _6011 * _6009;
            float _6015 = fma(_226, _6013, _5865);
            float _6017 = fma(_230, _6013, _5857);
            float _6019 = fma(_232, _6013, _5873);
            _5957 = _6017;
            _5963 = _6019;
            _5951 = _6015;
            _5943 = _5997;
        }
    }
    float _6021 = _5957;
    float _6023 = _5963;
    float _6025 = _5951;
    float _6027 = _5943;
    float _6029 = -_3655;
    float _6031 = fma(_6029, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6021);
    float _6033 = -_4285;
    float _6035 = fma(_6033, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6023);
    float _6037 = -_3651;
    float _6039 = fma(_6037, (*spvDescriptorSet0.vp_c9)._m0[18].w, _6025);
    float _6041 = _6027;
    float _6043 = _6039;
    float _6045 = _6035;
    if (_5917)
    {
        _6041 = 1.0;
    }
    float _6047 = _6041;
    float _6049 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _6051 = _5925 * _6049;
    float _6053 = _6047;
    if (_5935)
    {
        _4561 = _6031;
    }
    float _6055 = _4561;
    float _6057 = _6055;
    if (!_5935)
    {
        float _6059 = _5123 * _5123;
        float _6061 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6063 = -_3337;
        float _6065 = _6063 + _6023;
        float _6067 = -_3135;
        float _6069 = _6067 + _6021;
        float _6071 = fma(_5133, _5133, _6059);
        float _6073 = fma(_5147, _5147, _6071);
        float _6075 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6077 = sqrt(_6073);
        float _6079 = 1.0 / _5251;
        float _6081 = _6075 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6083 = precise::min(_6077, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6085 = _6083 * _6061;
        float _6087 = _6085 * _6079;
        float _6089 = -_2923;
        float _6091 = _6089 + _6025;
        float _6093 = _6081 * _6087;
        float _6095 = _6065 * _6087;
        float _6097 = fma(_6069, _6093, _5109);
        float _6099 = fma(_6091, _6093, _5117);
        float _6101 = fma(_6081, _6095, _5129);
        _6057 = _6097;
        _6043 = _6099;
        _6045 = _6101;
        _236 = _6061;
    }
    float _6103 = _6057;
    float _6105 = _6043;
    float _6107 = _6045;
    float _6109 = _236;
    float _6111 = _6109;
    if (!_5917)
    {
        float _6113 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6115 = _6113 * 0.15915493667125701904296875;
        float _6117 = _6115 * 6.283185482025146484375;
        float _6119 = cos(_6117);
        float _6121 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6123 = _6121 * 0.15915493667125701904296875;
        float _6125 = _6115 * 6.283185482025146484375;
        float _6127 = sin(_6125);
        float _6129 = 1.0 / _6119;
        float _6131 = _6123 * 6.283185482025146484375;
        float _6133 = cos(_6131);
        float _6135 = _6127 * _6129;
        float _6137 = _6123 * 6.283185482025146484375;
        float _6139 = sin(_6137);
        float _6141 = _6133 * _6135;
        float _6143 = 1.0 / _6141;
        float _6145 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6147 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6145;
        float _6149 = 1.0 / _6147;
        float _6151 = _6139 * _6143;
        float _6153 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6155 = fma(_6051, _6151, _6153);
        float _6157 = _6155 * _6149;
        float _6159 = precise::clamp(_6157, 0.0, 1.0);
        _6053 = _6159;
    }
    float _6161 = _6053;
    float _6163 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6165 = _6103 + _6163;
    float _6167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6169 = _6105 + _6167;
    float _6171 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6173 = _6107 + _6171;
    float _6175 = _6165 * _6165;
    float _6177 = fma(_6169, _6169, _6175);
    float _6179 = fma(_6173, _6173, _6177);
    float _6181 = rsqrt(_6179);
    float _6183 = sqrt(_6179);
    float _6185 = _6181 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6187 = _6169 * _6185;
    float _6189 = _6173 * _6185;
    float _6191 = _6187 * _6187;
    float _6193 = _6189 * _6189;
    float _6195 = _6191 + _6193;
    float _6197 = sqrt(_6195);
    bool _6199 = _6197 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6201 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6203 = _6197 + _6201;
    float _6205 = _6181;
    float _6207 = _6195;
    float _6209 = _6203;
    float _6211 = _6165;
    if (_6199)
    {
        float _6213 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6205 = _6213;
    }
    float _6215 = _6205;
    if (_6199)
    {
        float _6217 = rsqrt(_6195);
        _6207 = _6217;
    }
    float _6219 = _6207;
    float _6221 = _6219;
    if (_6199)
    {
        float _6223 = _6203 * _6215;
        _6209 = _6223;
    }
    float _6225 = _6209;
    if (_6199)
    {
        float _6227 = _6225 * 0.15915493667125701904296875;
        _5945 = _6227;
    }
    float _6229 = _5945;
    float _6231 = _6173;
    if (_6199)
    {
        float _6233 = _6229 * 6.283185482025146484375;
        float _6235 = sin(_6233);
        _6231 = _6235;
    }
    float _6237 = _6231;
    float _6239 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6241 = precise::max(0.0, _6239);
    float _6243 = _6215;
    if (_6199)
    {
        float _6245 = _6229 * 6.283185482025146484375;
        float _6247 = cos(_6245);
        _6243 = _6247;
    }
    float _6249 = _6243;
    float _6251 = -_6185;
    float _6253 = -_6241;
    float _6255 = fma(_6165, _6251, _6253);
    float _6257 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6199)
    {
        float _6259 = _6255 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6211 = _6259;
    }
    float _6261 = _6211;
    float _6263 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6265 = fma(_5117, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6267 = _6261;
    float _6269 = _6237;
    if (_6199)
    {
        float _6271 = fma(_6237, _6261, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6267 = _6271;
    }
    float _6273 = _6267;
    float _6275 = _6273;
    if (!_6199)
    {
        _6269 = _6187;
    }
    float _6277 = _6269;
    float _6279 = _6277;
    float _6281 = _6249;
    if (_6199)
    {
        float _6283 = _6249 + (-1.0);
        _6257 = _6283;
    }
    float _6285 = _6257;
    float _6287 = _6285;
    if (_6199)
    {
        float _6289 = _6219 * _6273;
        _5947 = _6289;
    }
    float _6291 = _5947;
    if (!_6199)
    {
        _6275 = _6255;
    }
    float _6293 = _6275;
    float _6295 = _6293;
    if (_6199)
    {
        float _6297 = _6285 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6111 = _6297;
    }
    float _6299 = _6111;
    if (_6199)
    {
        float _6301 = _6187 * _6291;
        _6279 = _6301;
    }
    float _6303 = _6279;
    if (!_6199)
    {
        _6287 = _6189;
    }
    float _6305 = _6287;
    float _6307 = _6305;
    if (_6199)
    {
        float _6309 = _6189 * _6291;
        _6307 = _6309;
    }
    float _6311 = _6307;
    if (!_6199)
    {
        _6221 = _6191;
    }
    float _6313 = _6221;
    float _6315 = _6313;
    if (_6199)
    {
        float _6317 = fma(_6255, _6249, _6299);
        _6295 = _6317;
    }
    float _6319 = _6295;
    if (_6199)
    {
        float _6321 = _6303 * _6303;
        _6315 = _6321;
    }
    float _6323 = _6315;
    if (!_6199)
    {
        _6281 = _6193;
    }
    float _6325 = _6281;
    float _6327 = _6325;
    if (_6199)
    {
        float _6329 = _6311 * _6311;
        _6327 = _6329;
    }
    float _6331 = _6327;
    float _6333 = fma(_6319, _6319, _6323);
    float _6335 = floor(_6265);
    float _6337 = _6333 + _6331;
    float _6339 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6263);
    float _6341 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6343 = fma(_6183, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6341);
    float _6345 = precise::clamp(_6343, 0.0, 1.0);
    float _6347 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6339);
    float _6349 = rsqrt(_6337);
    float _6351 = -_6345;
    float _6353 = _6351 + 1.0;
    float _6355 = _6347 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6357 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6359 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6361 = _6355 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6363 = fma(_5129, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6365 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6367 = abs(_6353);
    float _6369 = log2(_6367);
    float _6371 = -_6361;
    float _6373 = fma(_6371, _6357, 1.0);
    float _6375 = _6103 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6377 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6359);
    float _6379 = -_6335;
    float _6381 = _6265 + _6379;
    float _6383 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6375);
    float _6385 = _6349 * _6303;
    float _6387 = floor(_6363);
    float _6389 = _6349 * _6319;
    float _6391 = _6349 * _6311;
    float _6393 = fma(_6105, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6365);
    float _6395 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6383);
    float _6397 = _6385 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6399 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6377);
    float _6401 = fma(_6107, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6393);
    float _6403 = _6395 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6405 = -_6397;
    float _6407 = fma(_6389, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6405);
    float _6409 = _6369 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6411 = _6401 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6413 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6415 = -_6391;
    float _6417 = fma(_6415, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6407);
    float _6419 = _6399 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6421 = exp2(_6409);
    float _6423 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6413);
    float _6425 = fma(_6417, -0.5, 0.5);
    float _6427 = fma(_6417, 0.5, 0.5);
    float _6429 = -_6387;
    float _6431 = _6363 + _6429;
    float _6433 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6423);
    float _6435 = fma(_6427, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6437 = log2(_6373);
    float _6439 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6433);
    float _6441 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6443 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6445 = fma(_6427, _6435, -0.212114393711090087890625);
    float _6447 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6441);
    float _6449 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6443);
    float _6451 = sqrt(_6425);
    float _6453 = fma(_6427, _6445, 1.570728778839111328125);
    float _6455 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6447);
    float _6457 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6449);
    float _6459 = 1.0 / _6439;
    float _6461 = _6389 + 1.0;
    float _6463 = _6437 * 0.693147182464599609375;
    float _6465 = -_6389;
    float _6467 = fma(_6421, _6461, _6465);
    float _6469 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6455);
    float _6471 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6457);
    float _6473 = _6451 * 0.636619746685028076171875;
    float _6475 = fma(_6467, 0.5, 0.5);
    float _6477 = -_6453;
    float _6479 = fma(_6473, _6477, 1.0);
    float _6481 = _6463 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16479 = float2(_6381, _6431);
    float _6483 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16479, float2(0.0), isnan(_16479)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16479, float2(0.0), isnan(_16479)), level(0.0)).x;
    float _6485 = _6469 * _6459;
    float _6487 = _6471 * _6459;
    float _6489 = fma(_6485, 0.5, 0.5);
    float _6491 = fma(_6487, -0.5, 0.5);
    float3 _16498 = float3(_6489, _6491, _6481);
    float _6493 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16498, float3(0.0), isnan(_16498)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16498, float3(0.0), isnan(_16498)), level(0.0)).x;
    float3 _16509 = float3(_6489, _6491, _6481);
    float4 _6496 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16509, float3(0.0), isnan(_16509)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16509, float3(0.0), isnan(_16509)), level(0.0)).xyzw;
    float _6498 = _6496.x;
    float _6500 = _6496.y;
    float _6502 = _6496.z;
    float _6504 = _6496.w;
    float2 _16525 = float2(_6479, _6475);
    float3 _6506 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16525, float2(0.0), isnan(_16525)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16525, float2(0.0), isnan(_16525)), level(0.0)).xyz;
    float _6508 = _6506.x;
    float _6510 = _6506.y;
    float _6512 = _6506.z;
    float _6514 = abs(_6051);
    float _6516 = log2(_6514);
    float _6518 = _6369 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6520 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6522 = isnan(_6183);
    bool _6524 = _6520 || _6522;
    bool _6526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6528 = _6524 || _6526;
    float _6530 = exp2(_6518);
    float _6532 = _6516 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6534 = exp2(_6532);
    float _6536 = in.m_105.x;
    float _6538 = -_6530;
    float _6540 = _6538 + 1.0;
    float _6542 = _6540 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6544 = fma(_6534, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6546 = precise::clamp(_6544, 0.0, 1.0);
    float _6548 = fma(_6546, -2.0, 3.0);
    float _6550 = _6546 * _6546;
    float _6552 = _6403 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6554 = _6550 * _6548;
    float _6556 = fma(_6411, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6552);
    float _6558 = -_6554;
    float _6560 = _6558 + 1.0;
    float _6562 = fma(_6355, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6556);
    float _6564 = fma(_6560, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6554);
    bool _6566 = _6051 <= 8000.0;
    bool _6568 = isnan(_6051);
    bool _6570 = _6566 || _6568;
    bool _6572 = isnan(8000.0);
    bool _6574 = _6570 || _6572;
    float _6576 = float(_6574);
    float _6578 = fma(_6419, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6562);
    float _6580 = _6439 * 0.5;
    float _6582 = _6469 + _6439;
    float _6584 = _6576 * _6564;
    float _6586 = fma(_6471, -0.5, _6580);
    out.gl_Position.x = _6469;
    out.gl_Position.y = _6471;
    out.gl_Position.z = _6578;
    out.gl_Position.w = _6439;
    float _6588 = _6578 + _6439;
    float _6590 = _6584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6592 = _6582 * 0.5;
    float _6594 = _6588 * 0.5;
    out.m_107.x = _6592;
    out.m_107.y = _6586;
    out.m_107.z = _6594;
    out.m_107.w = _6439;
    float _6596 = -_6542;
    float _6598 = _6596 + 1.0;
    float _6600 = _6439;
    float _6602 = _6578;
    float _6604 = _6471;
    float _6606 = _6586;
    float _6608 = _6592;
    float _6610 = _6598;
    if (!_6528)
    {
        _6600 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6612 = _6600;
    float _6614 = _6612;
    float _6616 = _6612;
    if (!_6528)
    {
        _6602 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6618 = _6602;
    float _6620 = _6618;
    float _6622 = _6618;
    if (!_6528)
    {
        _6604 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6624 = _6604;
    float _6626 = _6161 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6628 = _6624;
    float _6630 = _6624;
    if (!_6528)
    {
        _6606 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6632 = _6606;
    float _6634 = _6632;
    float _6636 = _6632;
    if (!_6528)
    {
        _6608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6638 = _6608;
    float _6640 = -_6483;
    float _6642 = _6640 + 1.0;
    float _6644 = _6642 * _6590;
    float _6646 = precise::clamp(_6644, 0.0, 1.0);
    float _6648 = -_6646;
    float _6650 = fma(_6648, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6652 = _6542 * _6493;
    float _6654 = _6650 * _6536;
    float _6656 = _6504 * _6652;
    float _6658 = _6512 * _6652;
    float _6660 = _6654 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6662 = fma(_6508, _6656, _6498);
    float _6664 = fma(_6510, _6656, _6500);
    float _6666 = _6504 * _6598;
    float _6668 = fma(_6504, _6658, _6502);
    out.m_109.x = _6660;
    float _6670 = _6638;
    float _6672 = _6638;
    if (!_6528)
    {
        _6610 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6674 = _6610;
    out.m_111.x = _6662;
    out.m_111.y = _6664;
    out.m_111.z = _6668;
    out.m_111.w = _6666;
    bool _6676 = !_6528;
    float _6678 = _6674;
    float _6680 = _6674;
    if (!_6676)
    {
        bool _6682 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6684 = isnan(_6183);
        bool _6686 = _6682 || _6684;
        bool _6688 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6690 = _6686 || _6688;
        if (!_6690)
        {
            float _6692 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6694 = _6183 + _6692;
            float _6696 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6698 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6696;
            float _6700 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6702 = _6700 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6704 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6706 = _6704 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6708 = 1.0 / _6698;
            float _6710 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6712 = _6710 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6714 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6716 = _6714 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6718 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6720 = _6718 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6722 = _6694 * _6708;
            float _6724 = precise::clamp(_6722, 0.0, 1.0);
            float _6726 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6728 = _6726 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6730 = fma(_6724, _6702, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6732 = fma(_6724, _6706, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6734 = fma(_6724, _6728, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6736 = fma(_6724, _6712, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6738 = fma(_6724, _6716, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6740 = fma(_6724, _6720, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6630 = _6730;
            _6672 = _6738;
            _6622 = _6732;
            _6636 = _6736;
            _6680 = _6734;
            _6616 = _6740;
            _6742 = true;
        }
        else
        {
            bool _6744 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6746 = isnan(_6183);
            bool _6748 = _6744 || _6746;
            bool _6750 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6752 = _6748 || _6750;
            if (!_6752)
            {
                _6634 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6754 = _6634;
            _6636 = _6754;
            if (!_6752)
            {
                _6670 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6756 = _6670;
            _6672 = _6756;
            if (!_6752)
            {
                _6614 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6758 = _6614;
            _6616 = _6758;
            if (!_6752)
            {
                _6620 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6760 = _6620;
            _6622 = _6760;
            if (!_6752)
            {
                _6628 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6762 = _6628;
            _6630 = _6762;
            if (!_6752)
            {
                _6678 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6764 = _6678;
            bool _6766 = !_6752;
            _6680 = _6764;
            if (!_6766)
            {
                bool _6768 = _6183 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6770 = isnan(_6183);
                bool _6772 = _6768 || _6770;
                bool _6774 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6776 = _6772 || _6774;
                if (!_6776)
                {
                    float _6778 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6780 = _6183 + _6778;
                    float _6782 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6784 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6782;
                    float _6786 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6788 = _6786 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6790 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6792 = _6790 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6794 = 1.0 / _6784;
                    float _6796 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6798 = _6796 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6800 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6802 = _6800 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6804 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6806 = _6804 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6808 = _6780 * _6794;
                    float _6810 = precise::clamp(_6808, 0.0, 1.0);
                    float _6812 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6814 = _6812 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6816 = fma(_6810, _6788, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6818 = fma(_6810, _6792, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6820 = fma(_6810, _6814, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6822 = fma(_6810, _6798, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6824 = fma(_6810, _6802, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6826 = fma(_6810, _6806, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6630 = _6816;
                    _6672 = _6824;
                    _6622 = _6818;
                    _6636 = _6822;
                    _6680 = _6820;
                    _6616 = _6826;
                    _6742 = true;
                }
                else
                {
                    _6630 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6672 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6622 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6636 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6680 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6616 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6742 = false;
    float _6828 = _6630;
    float _6830 = _6672;
    float _6832 = _6622;
    float _6834 = _6636;
    float _6836 = _6680;
    float _6838 = _6616;
    float _6840 = _6626 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6842 = fma(_5765, -0.5, 0.5);
    float _6844 = precise::clamp(_6842, 0.0, 1.0);
    float _6846 = -_6828;
    float _6848 = _6830 + _6846;
    float _6850 = -_6832;
    float _6852 = _6834 + _6850;
    out.m_53.x = _6840;
    float _6854 = fma(_6844, _6848, _6828);
    float _6856 = -_6836;
    float _6858 = _6838 + _6856;
    float _6860 = fma(_6844, _6852, _6832);
    float _6862 = _6854 * 0.586610972881317138671875;
    bool _6864 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6866 = fma(_6844, _6858, _6836);
    out.m_113.x = 0.0;
    float _6868 = fma(_6860, 0.298911988735198974609375, _6862);
    bool _6870 = _6161 > 0.0;
    bool _6872 = isnan(_6161);
    bool _6874 = _6870 || _6872;
    bool _6876 = isnan(0.0);
    bool _6878 = _6874 || _6876;
    float _6880 = fma(_6866, 0.114477999508380889892578125, _6868);
    float _6882 = -_6880;
    float _6884 = _6860 + _6882;
    float _6886 = -_6880;
    float _6888 = _6854 + _6886;
    float _6890 = -_6880;
    float _6892 = _6866 + _6890;
    float _6894 = fma(_6884, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    float _6896 = fma(_6888, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    float _6898 = fma(_6892, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6880);
    bool _6900 = !_6864;
    if (!_6900)
    {
        float _6902 = -_6103;
        float _6904 = _6902 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6906 = -_6105;
        float _6908 = _6906 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6910 = -_6107;
        float _6912 = _6910 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6914 = _6904 * _6904;
        float _6916 = fma(_6908, _6908, _6914);
        float _6918 = fma(_6912, _6912, _6916);
        float _6920 = sqrt(_6918);
        float _6922 = rsqrt(_6918);
        float _6924 = -_6920;
        float _6926 = _6924 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6928 = _6926 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6930 = precise::clamp(_6928, 0.0, 1.0);
        float _6932 = _6908 * _6922;
        float _6934 = _6904 * _6922;
        float _6936 = abs(_6930);
        float _6938 = log2(_6936);
        float _6940 = _6912 * _6922;
        float _6942 = _6932 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6944 = _5765 * _6934;
        float _6946 = -_6934;
        float _6948 = -_6942;
        float _6950 = fma(_6946, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6948);
        float _6952 = fma(_5757, _6932, _6944);
        float _6954 = -_6940;
        float _6956 = fma(_6954, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6950);
        float _6958 = fma(_5767, _6940, _6952);
        float _6960 = precise::clamp(_6958, 0.0, 1.0);
        float _6962 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6964 = _6956 + _6962;
        float _6966 = _6938 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6968 = _6964 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6970 = precise::clamp(_6968, 0.0, 1.0);
        float _6972 = exp2(_6966);
        float _6974 = _6972 * _6970;
        float _6976 = _6960 * _6974;
        float _6978 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6980 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6982 = _6976 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6978;
        out.m_113.y = _6980;
        out.m_113.z = _6982;
    }
    out.m_115.x = _6894;
    out.m_115.y = _6896;
    out.m_115.z = _6898;
    if (_6878)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _6984 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6984;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

