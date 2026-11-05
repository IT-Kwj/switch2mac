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
    bool _6688 = false;
    bool _5761 = false;
    bool _1152 = false;
    bool _828 = false;
    bool _686 = false;
    bool _532 = false;
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
        float _6987 = as_type<float>(_150);
        out.gl_Position.z = _6987;
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
        float _7057 = as_type<float>(_188);
        out.gl_Position.z = _7057;
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
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _264 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _264 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = 1.0 / _280;
    float _296 = 1.0 / _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _300 = _264 + _298;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 1.0 / _284;
    float _306 = _268 * _294;
    bool _308 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _310 = isnan(_264);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = fma(_322, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = 1.0 / _288;
    float _328 = _300 * _296;
    float _330 = -_318;
    float _332 = _330 + 1.0;
    float _334 = _272 * _304;
    bool _336 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_264);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    bool _352 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_264);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _346 * _332;
    float _366 = -_346;
    float _368 = _366 + 1.0;
    float _370 = _276 * _326;
    bool _372 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_264);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_362;
    float _386 = _384 + 1.0;
    float _388 = _362 * _368;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _394 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_264);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _382 * _386;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _408;
    float _412 = -_382;
    float _414 = _412 + 1.0;
    float _416 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = _404 * _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = -_404;
    float _432 = _430 + 1.0;
    float _434 = _422 * _424;
    float _436 = _324 * _424;
    float _438 = _416 * _424;
    float _440 = fma(_420, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _442 = fma(_428, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _444 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_440, _406, _446);
    float _466 = fma(_442, _406, _448);
    float _468 = fma(_444, _406, _450);
    float _470 = fma(_454, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_458, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_462, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_470, _388, _464);
    float _490 = fma(_478, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_486, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = fma(_472, _388, _466);
    float _498 = fma(_474, _388, _468);
    float _500 = fma(_490, _364, _488);
    float _502 = fma(_492, _364, _496);
    float _504 = fma(_494, _364, _498);
    float _506 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].x, _500);
    float _508 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].y, _502);
    float _510 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].z, _504);
    bool _512 = !_302;
    float _530;
    if (!_512)
    {
        float _514 = in.m_65.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_134);
        float _536 = 1.0 / _534;
        float _538 = _168 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _540 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = isnan(_540);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_540);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _578;
    bool _582 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_540);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _548;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _540 + _600;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _576 * _598;
    float _608 = -_576;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _564;
    float _614 = _580 * _594;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _544, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = -_592;
    float _624 = _622 + 1.0;
    float _626 = _618 * _612;
    float _628 = _620 * _606;
    float _630 = _560 * _624;
    float _632 = fma(_626, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _636 = fma(_632, _630, _634);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _646 = in.m_67.x;
    float _648 = in.m_67.y;
    float _650 = in.m_67.z;
    float _652 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _652;
    out.m_69.y = _654;
    out.m_69.z = _656;
    out.m_69.w = _658;
    float _660 = _510 * _650;
    float _662 = _508 * _648;
    float _664 = _506 * _646;
    bool _666 = !_604;
    float _684;
    if (!_666)
    {
        float _668 = in.m_65.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _684 = _682;
        _686 = true;
    }
    else
    {
        float _688 = float(_134);
        float _690 = 1.0 / _688;
        float _692 = _168 * _690;
        _684 = _692;
    }
    _686 = false;
    float _694 = _684;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _698 = _694 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _704 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _706 = isnan(_694);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _720 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _722 = isnan(_694);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _732;
    bool _736 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _738 = isnan(_694);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = 1.0 / _702;
    float _750 = -_714;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _756 = _694 + _754;
    bool _758 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _760 = _730 * _752;
    float _762 = -_730;
    float _764 = _762 + 1.0;
    float _766 = 1.0 / _718;
    float _768 = _734 * _748;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _774 = fma(_768, _698, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _776 = -_746;
    float _778 = _776 + 1.0;
    float _780 = _772 * _766;
    float _782 = _774 * _760;
    float _784 = _714 * _778;
    float _786 = fma(_780, _756, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _790 = fma(_786, _784, _788);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _798 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[133].x, _790);
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _800;
    out.m_71.y = _802;
    out.m_71.z = _804;
    out.m_71.w = _806;
    bool _808 = !_758;
    float _826;
    if (!_808)
    {
        float _810 = in.m_65.x;
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _814 = _810 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_134);
        float _832 = 1.0 / _830;
        float _834 = _168 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _840 = _836 + _838;
    bool _842 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _844 = isnan(_836);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _858;
    bool _862 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _864 = isnan(_836);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_852;
    float _876 = _874 + 1.0;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = 1.0 / _856;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _896 = _872 * _876;
    float _898 = -_888;
    float _900 = _898 + 1.0;
    float _902 = 1.0 / _894;
    bool _904 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _906 = _860 * _890;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    bool _912 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _914 = isnan(_836);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = fma(_906, _840, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _926 = _888 * _910;
    bool _928 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _930 = isnan(_836);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _922 * _900;
    float _942 = -_922;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _950 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _952 = isnan(_836);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _938 * _944;
    float _964 = -_938;
    float _966 = _964 + 1.0;
    bool _968 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _970 = isnan(_836);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _948;
    float _982 = -_960;
    float _984 = _982 + 1.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _960 * _966;
    float _992 = _978 * _984;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _998 = -_978;
    float _1000 = _998 + 1.0;
    float _1002 = 1.0 / _988;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1008 = _924 * _992;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _836 + _1014;
    float _1018 = _1006 * _902;
    float _1020 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1008);
    float _1022 = 1.0 / _996;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1024;
    float _1028 = fma(_1018, _1016, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1036 = _836 + _1034;
    float _1038 = _1026 * _980;
    float _1040 = fma(_1028, _990, _1020);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1044 = _836 + _1042;
    float _1046 = 1.0 / _1012;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1052 = fma(_1038, _1036, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1054 = _1050 * _1002;
    bool _1056 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1058 = isnan(_836);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1068;
    float _1072 = 1.0 / _1032;
    float _1074 = fma(_1052, _962, _1040);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1080 = _1070 * _1022;
    float _1082 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1086 = _836 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1090 = _836 + _1088;
    float _1092 = _1078 * _1046;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1094;
    float _1098 = fma(_1080, _1086, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1100 = fma(_1082, _940, _1074);
    float _1102 = fma(_1092, _1090, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1104 = -_1066;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1110 = _836 + _1108;
    float _1112 = fma(_1098, _926, _1100);
    float _1114 = _1096 * _1072;
    float _1116 = _852 * _1106;
    float _1118 = fma(_1102, _896, _1112);
    float _1120 = fma(_1114, _1110, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1122 = fma(_1120, _1116, _1118);
    float _1124 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1122);
    out.m_73.x = _1124;
    bool _1126 = !_904;
    float _1128 = _1040;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1132 = as_type<int>(_1072);
    float _1150;
    if (!_1126)
    {
        float _1134 = in.m_65.x;
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1138 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1142 = _1140 * _1136;
        float _1144 = floor(_1142);
        float _1146 = -_1144;
        float _1148 = _1142 + _1146;
        _1150 = _1148;
        _1152 = true;
    }
    else
    {
        float _1154 = float(_134);
        float _1156 = 1.0 / _1154;
        float _1158 = _168 * _1156;
        _1150 = _1158;
    }
    _1152 = false;
    float _1160 = _1150;
    float _1162 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1164 = int(_1162);
    float _1166 = in.m_65.y;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = in.m_75.x;
    float _1174 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1176 = int(_1174);
    float _1178 = 0.0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1170)
    {
        _1178 = 1.0;
    }
    float _1182 = _1178;
    float _1184 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1186 = int(_1184);
    float _1188 = float(_1164);
    float _1190 = 0.0;
    float _1192 = _1182;
    if (_1170)
    {
        _1190 = 1.0;
    }
    float _1194 = _1190;
    float _1196 = 0.0;
    float _1198 = _1194;
    if (_1170)
    {
        _1196 = 1.0;
    }
    float _1200 = _1196;
    int _1202 = 0;
    float _1204 = _1200;
    if (_1170)
    {
        _1202 = 0;
    }
    int _1206 = _1202;
    int _1208 = _1206;
    if (_1170)
    {
        float _1210 = in.m_65.x;
        _1128 = _1210;
    }
    float _1212 = _1128;
    float _1214 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1216 = int(_1214);
    float _1218 = float(_1176);
    float _1220 = _1212;
    if (_1170)
    {
        _1180 = 0;
    }
    int _1222 = _1180;
    float _1224 = _1116;
    int _1226 = _1222;
    if (_1170)
    {
        float _1228 = in.m_65.z;
        _1224 = _1228;
    }
    float _1230 = _1224;
    int _1232 = 0;
    if (_1170)
    {
        _1232 = as_type<int>(_1166);
    }
    int _1234 = _1232;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1238 = int(_1236);
    float _1240 = float(_1186);
    float _1242 = 1.0 / _1188;
    float _1244 = float(_1216);
    float _1246 = 1.0 / _1218;
    float _1248 = float(uint(_1238));
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1252 = int(_1250);
    float _1254 = _1242 * _168;
    float _1256 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1258 = int(_1256);
    float _1260 = _1246 * _168;
    float _1262 = 1.0 / _1240;
    float _1264 = float(uint(_1252));
    float _1266 = 1.0 / _1244;
    float _1268 = float(uint(_1258));
    float _1270 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1272 = int(_1270);
    float _1274 = _1262 * _168;
    float _1276 = 1.0 / _1248;
    float _1278 = _1266 * _168;
    float _1280 = trunc(_1254);
    int _1282 = int(_1280);
    float _1284 = float(uint(_1272));
    float _1286 = 1.0 / _1264;
    int _1288 = as_type<int>(_1276) + (-2);
    float _1290 = trunc(_1260);
    int _1292 = int(_1290);
    float _1294 = float(uint(_1282));
    float _1296 = as_type<float>(_1288) * _1294;
    float _1298 = 1.0 / _1268;
    int _1300 = as_type<int>(_1286) + (-2);
    float _1302 = trunc(_1274);
    int _1304 = int(_1302);
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1308 = _1306 != 0;
    float _1310 = 1.0 / _1284;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1318 = _1316 != 0;
    bool _1320 = _1166 > 0.5;
    int _1322 = as_type<int>(_1298) + (-2);
    float _1324 = trunc(_1278);
    int _1326 = int(_1324);
    float _1328 = float(uint(_1304));
    int _1330 = _1234;
    bool _1332 = _1314;
    bool _1334 = _1318;
    float _1336 = _1172;
    if (!_1308)
    {
        _1130 = _1172;
    }
    float _1338 = _1130;
    float _1340 = as_type<float>(_1322) * _1328;
    int _1342 = as_type<int>(_1340);
    float _1344 = _1338;
    if (_1314)
    {
        float _1346 = -_1172;
        float _1348 = _1346 + 1.0;
        _1132 = as_type<int>(_1348);
    }
    int _1350 = _1132;
    float _1352 = trunc(_1296);
    float _1354 = precise::max(_1352, 0.0);
    uint _1357 = uint(_1354);
    int _1359 = as_type<int>(_1310) + (-2);
    float _1361 = 0.0;
    if (!_1318)
    {
        _1361 = _1172;
    }
    float _1363 = _1361;
    float _1365 = 0.0;
    float _1367 = _1363;
    if (!_1314)
    {
        _1365 = _1172;
    }
    float _1369 = _1365;
    float _1371 = _1369;
    if (_1314)
    {
        float _1373 = _1320 ? as_type<float>(_1350) : _1172;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = trunc(_1340);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    float _1383 = float(uint(_1292));
    float _1385 = float(uint(_1326));
    float _1387 = as_type<float>(_1300) * _1383;
    float _1389 = _1383;
    if (_1318)
    {
        float _1391 = -_1172;
        float _1393 = _1391 + 1.0;
        _1342 = as_type<int>(_1393);
    }
    int _1395 = _1342;
    float _1397 = as_type<float>(_1359) * _1385;
    float _1399 = trunc(_1387);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    int _1405 = _1395;
    float _1407 = _1397;
    if (_1318)
    {
        float _1409 = _1320 ? as_type<float>(_1395) : _1172;
        _1367 = _1409;
    }
    float _1411 = _1367;
    float _1413 = _1230;
    if (_1170)
    {
        _1405 = as_type<int>(_1230);
    }
    int _1415 = _1405;
    float _1417 = trunc(_1397);
    float _1419 = precise::max(_1417, 0.0);
    uint _1421 = uint(_1419);
    int _1423 = _1415;
    if (_1170)
    {
        _1407 = _1212;
    }
    float _1425 = _1407;
    float _1427 = _1425;
    if (_1170)
    {
        _1389 = _1425;
    }
    float _1429 = _1389;
    int _1431 = 0;
    float _1433 = _1429;
    if (_1170)
    {
        _1431 = as_type<int>(_1425);
    }
    int _1435 = _1431;
    int _1437 = _1435;
    if (!_1170)
    {
        float _1439 = in.m_65.x;
        float _1441 = _1166 * 3.1415927410125732421875;
        float _1443 = in.m_65.z;
        float _1445 = _1441 * 0.15915493667125701904296875;
        float _1447 = _1445 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1439 * 3.1415927410125732421875;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = _1443 * 3.1415927410125732421875;
        float _1457 = _1455 * 0.15915493667125701904296875;
        float _1459 = _1453 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = _1457 * 6.283185482025146484375;
        float _1465 = sin(_1463);
        _1427 = _1166;
        _1198 = 1.2345600128173828125;
        _1220 = _1439;
        _1192 = 7.345489978790283203125;
        _1433 = _1443;
        _1204 = 5.839270114898681640625;
        _1208 = 1;
        _1413 = _1443;
        _1226 = 2;
        _1423 = as_type<int>(_1465);
        _1330 = as_type<int>(_1449);
        _1437 = as_type<int>(_1461);
    }
    float _1467 = _1427;
    float _1469 = _1198;
    float _1471 = _1220;
    float _1473 = _1192;
    float _1475 = _1433;
    float _1477 = _1204;
    int _1479 = _1208;
    float _1481 = _1413;
    int _1483 = _1226;
    int _1485 = _1423;
    int _1487 = _1330;
    int _1489 = _1437;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1493 = _1491 != 0;
    int _1495 = 0;
    if (_1308)
    {
        float _1497 = in.m_65.x;
        _1495 = as_type<int>(_1497);
    }
    int _1499 = _1495;
    int _1501 = ~_1238;
    int _1503 = _1501 + 1;
    float _1505 = _1467 * _1469;
    int _1507 = ~_1258;
    int _1509 = _1507 + 1;
    float _1511 = _1471 * _1473;
    int _1513 = ~_1272;
    int _1515 = _1513 + 1;
    int _1517 = _1503 * int(_1357);
    int _1519 = _1517 + _1282;
    float _1521 = floor(_1505);
    float _1523 = _1475 * _1477;
    float _1525 = _1467 * _1473;
    int _1527 = _1515 * int(_1421);
    int _1529 = _1527 + _1326;
    float _1531 = float(uint(_1519));
    float _1533 = _896;
    if (_1493)
    {
        float _1535 = in.m_65.z;
        _1533 = _1535;
    }
    float _1537 = _1533;
    int _1539 = _1509 * int(_1381);
    int _1541 = _1539 + _1304;
    int _1543 = ~_1252;
    int _1545 = _1543 + 1;
    float _1547 = floor(_1511);
    float _1549 = as_type<float>(_1288) * _1531;
    float _1551 = float(uint(_1529));
    bool _1553 = _1479 != 1;
    float _1555 = float(uint(_1541));
    float _1557 = in.m_61.w;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1561 = _1559 != 0;
    float _1563 = as_type<float>(_1359) * _1551;
    float _1565 = trunc(_1549);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = _1499;
    float _1573 = _1549;
    if (_1308)
    {
        bool _1575 = as_type<float>(_1499) > 0.5;
        _1332 = _1575;
    }
    bool _1577 = _1332;
    if (_1493)
    {
        float _1579 = -_1172;
        float _1581 = _1579 + 1.0;
        _1571 = as_type<int>(_1581);
    }
    int _1583 = _1571;
    float _1585 = as_type<float>(_1322) * _1555;
    int _1587 = _1545 * int(_1403);
    int _1589 = _1587 + _1292;
    int _1591 = ~_1272;
    int _1593 = _1591 + 1;
    float _1595 = in.m_59.w;
    float _1597 = floor(_1523);
    int _1599 = _1589;
    float _1601 = _1585;
    if (!_1493)
    {
        _1573 = _1172;
    }
    float _1603 = _1573;
    float _1605 = -_1547;
    float _1607 = _1511 + _1605;
    float _1609 = float(uint(_1589));
    float _1611 = _1603;
    if (_1308)
    {
        float _1613 = -_1172;
        float _1615 = _1613 + 1.0;
        _1599 = as_type<int>(_1615);
    }
    int _1617 = _1599;
    if (_1493)
    {
        bool _1619 = _1537 > 0.5;
        _1334 = _1619;
    }
    bool _1621 = _1334;
    int _1623 = 0;
    if (_1561)
    {
        float _1625 = -_1172;
        float _1627 = _1625 + 1.0;
        _1623 = as_type<int>(_1627);
    }
    int _1629 = _1623;
    float _1631 = float(_1272);
    float _1633 = floor(_1525);
    if (_1493)
    {
        float _1635 = _1621 ? as_type<float>(_1583) : _1172;
        _1611 = _1635;
    }
    float _1637 = _1611;
    float _1639 = -_1521;
    float _1641 = _1505 + _1639;
    float _1643 = float(_134);
    float _1645 = as_type<float>(_1300) * _1609;
    if (_1308)
    {
        float _1647 = _1577 ? as_type<float>(_1617) : _1172;
        _1344 = _1647;
    }
    float _1649 = _1344;
    float _1651 = in.m_63.w;
    float _1653 = float(_1238);
    float _1655 = trunc(_1563);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = float(_1282);
    float _1663 = float(_1258);
    int _1665 = ~_1258;
    int _1667 = _1665 + 1;
    float _1669 = trunc(_1585);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = int(_1357) + int(_1569);
    float _1677 = -_1633;
    float _1679 = _1525 + _1677;
    float _1681 = _1607 * _1653;
    float _1683 = float(_1326);
    float _1685 = _1663 * _1641;
    float _1687 = float(_1292);
    float _1689 = 1.0 / _1643;
    if (!_1561)
    {
        _1601 = _1172;
    }
    float _1691 = _1601;
    float _1693 = _1691;
    if (_1561)
    {
        float _1695 = _1320 ? as_type<float>(_1629) : _1172;
        _1693 = _1695;
    }
    float _1697 = _1693;
    float _1699 = -_1597;
    float _1701 = _1523 + _1699;
    bool _1703 = _1661 >= _1653;
    bool _1705 = isnan(_1661);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan(_1653);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = _1653 * _168;
    float _1717 = float(_1304);
    float _1719 = trunc(_1645);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = float(_1252);
    float _1727 = _1631 * _1701;
    bool _1729 = _1717 >= _1663;
    bool _1731 = isnan(_1717);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(_1663);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    bool _1741 = _1683 >= _1631;
    bool _1743 = isnan(_1683);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(_1631);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    int _1753 = int(_1421) + int(_1659);
    float _1755 = _1715 * _1689;
    int _1757 = int(_1381) + int(_1673);
    float _1759 = _1689 * _168;
    int _1761 = ~_1238;
    int _1763 = _1761 + 1;
    float _1765 = trunc(_1713);
    int _1767 = int(_1765);
    int _1769 = ~_1258;
    int _1771 = _1769 + 1;
    float _1773 = _1663 * _1759;
    float _1775 = _1631 * _1759;
    float _1777 = _1725 * _1759;
    int _1779 = _1763 * _1675;
    int _1781 = _1779 + _1282;
    float _1783 = _1725 * _1679;
    int _1785 = _1771 * _1757;
    int _1787 = _1785 + _1304;
    float _1789 = trunc(_1681);
    int _1791 = int(_1789);
    int _1793 = _1593 * _1753;
    int _1795 = _1793 + _1326;
    bool _1797 = uint(_1781) >= uint(_1238);
    float _1799 = in.m_75.y;
    bool _1801 = uint(_1787) >= uint(_1258);
    bool _1803 = !_1797;
    int _1805 = _1803 ? 0 : (-1);
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1809 = _1807 != 0;
    float _1811 = trunc(_1685);
    int _1813 = int(_1811);
    bool _1815 = uint(_1795) >= uint(_1272);
    bool _1817 = !_1809;
    int _1819 = _1817 ? 0 : 1;
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1823 = _1821 != 0;
    int _1825 = int(_1403) + int(_1723);
    float _1827 = trunc(_1727);
    int _1829 = int(_1827);
    int _1831 = ~_1252;
    int _1833 = _1831 + 1;
    bool _1835 = !_1801;
    int _1837 = _1835 ? 0 : (-1);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1841 = _1839 != 0;
    int _1843 = _1833 * _1825;
    int _1845 = _1843 + _1292;
    int _1847 = ~_1675;
    int _1849 = _1847 + _1805;
    int _1851 = _1849 + 1;
    float _1853 = trunc(_1739);
    int _1855 = int(_1853);
    int _1857 = abs(_1819);
    bool _1859 = !_1823;
    int _1861 = _1859 ? 0 : 1;
    int _1863 = _1238 * _1851;
    int _1865 = _1863 + _1282;
    bool _1867 = _1687 >= _1725;
    bool _1869 = isnan(_1687);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(_1725);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    int _1879 = _1791 * _1857;
    int _1881 = _1879 + _1282;
    bool _1883 = !_1841;
    int _1885 = _1883 ? 0 : 1;
    float _1887 = trunc(_1751);
    int _1889 = int(_1887);
    int _1891 = ~_1757;
    int _1893 = _1891 + _1837;
    int _1895 = _1893 + 1;
    int _1897 = abs(_1861);
    bool _1899 = _1238 == 0;
    int _1901 = _1258 * _1895;
    int _1903 = _1901 + _1304;
    int _1905 = abs(_1885);
    int _1907 = _1813 * _1897;
    int _1909 = _1907 + _1304;
    bool _1911 = uint(_1845) >= uint(_1252);
    float _1913 = trunc(_1755);
    int _1915 = int(_1913);
    bool _1917 = !_1815;
    int _1919 = _1917 ? 0 : (-1);
    int _1921 = ~_1767;
    int _1923 = _1921 + 1;
    int _1925 = _1923 + 1;
    bool _1927 = !_1899;
    int _1929 = _1927 ? _1865 : (-1);
    float _1931 = trunc(_1877);
    int _1933 = int(_1931);
    int _1935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1937 = _1935 != 0;
    int _1939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1941 = _1939 != 0;
    int _1943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1945 = _1943 != 0;
    int _1947 = _1929 * _1925;
    int _1949 = ~_1753;
    int _1951 = _1949 + _1919;
    int _1953 = _1951 + 1;
    int _1955 = _1829 * _1905;
    int _1957 = _1955 + _1326;
    bool _1959 = !_1911;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = _1238 + (-1);
    int _1965 = _1272 * _1953;
    int _1967 = _1965 + _1326;
    bool _1969 = !_1941;
    int _1971 = _1969 ? 0 : 1;
    bool _1973 = _1258 == 0;
    int _1975 = _1767 * _1963;
    int _1977 = _1975 + _1947;
    bool _1979 = !_1937;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = ~_1825;
    int _1985 = _1983 + _1961;
    int _1987 = _1985 + 1;
    bool _1989 = _1272 == 0;
    int _1991 = abs(_1971);
    int _1993 = ~_1855;
    int _1995 = _1993 + 1;
    int _1997 = _1995 + 1;
    bool _1999 = !_1973;
    int _2001 = _1999 ? _1903 : (-1);
    int _2003 = abs(_1981);
    int _2005 = ~_1889;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    int _2011 = _1997 * _2001;
    bool _2013 = !_1989;
    int _2015 = _2013 ? _1967 : (-1);
    int _2017 = _1977 * _1991;
    int _2019 = _1252 * _1987;
    int _2021 = _2019 + _1292;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2025 = _2023 != 0;
    int _2027 = _2009 * _2015;
    bool _2029 = !_1945;
    int _2031 = _2029 ? 0 : 1;
    int _2033 = _1915 * _2003;
    int _2035 = _2033 + _2017;
    bool _2037 = !_2025;
    int _2039 = _2037 ? 0 : 1;
    int _2041 = abs(_2031);
    int _2043 = abs(_2039);
    bool _2045 = _1252 == 0;
    int _2047 = _1881 * _2041;
    int _2049 = _2047 + _2035;
    int _2051 = _1258 + (-1);
    float _2053 = trunc(_1773);
    int _2055 = int(_2053);
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2063 = _2061 != 0;
    int _2065 = _1791 * _2043;
    int _2067 = _2065 + _2049;
    bool _2069 = !_2045;
    int _2071 = _2069 ? _2021 : (-1);
    int _2073 = _1855 * _2051;
    int _2075 = _2073 + _2011;
    int _2077 = ~_1933;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = float(uint(_2067));
    bool _2085 = !_2063;
    int _2087 = _2085 ? 0 : 1;
    int _2089 = _2081 * _2071;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2093 = _2091 != 0;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2097 = _2095 != 0;
    float _2099 = as_type<float>(_1288) * _2083;
    int _2101 = abs(_2087);
    bool _2103 = !_2059;
    int _2105 = _2103 ? 0 : 1;
    int _2107 = _1272 + (-1);
    float _2109 = trunc(_2099);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = abs(_2105);
    bool _2117 = !_2093;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = _1889 * _2107;
    int _2123 = _2121 + _2027;
    int _2125 = ~_1238;
    int _2127 = _2125 + 1;
    int _2129 = _2075 * _2101;
    int _2131 = abs(_2119);
    int _2133 = _1252 + (-1);
    int _2135 = _2055 * _2115;
    int _2137 = _2135 + _2129;
    bool _2139 = !_2097;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1933 * _2133;
    int _2145 = _2143 + _2089;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2149 = _2147 != 0;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2153 = _2151 != 0;
    float _2155 = trunc(_1775);
    int _2157 = int(_2155);
    int _2159 = abs(_2141);
    int _2161 = _2127 * int(_2113);
    int _2163 = _2161 + _2067;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2167 = _2165 != 0;
    int _2169 = _1909 * _2131;
    int _2171 = _2169 + _2137;
    bool _2173 = !_2153;
    int _2175 = _2173 ? 0 : 1;
    float _2177 = float(uint(_2163));
    int _2179 = _1813 * _2159;
    int _2181 = _2179 + _2171;
    bool _2183 = !_2167;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = trunc(_1783);
    int _2189 = int(_2187);
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2193 = _2191 != 0;
    float _2195 = as_type<float>(_1288) * _2177;
    int _2197 = abs(_2175);
    bool _2199 = !_2193;
    int _2201 = _2199 ? 0 : 1;
    float _2203 = float(uint(_2181));
    int _2205 = _2123 * _2197;
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2209 = _2207 != 0;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2213 = _2211 != 0;
    int _2215 = abs(_2185);
    float _2217 = as_type<float>(_1322) * _2203;
    float _2219 = trunc(_2195);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    bool _2225 = !_2149;
    int _2227 = _2225 ? 0 : 1;
    bool _2229 = !_2213;
    int _2231 = _2229 ? 0 : 1;
    int _2233 = abs(_2227);
    int _2235 = abs(_2231);
    float _2237 = trunc(_2217);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    int _2243 = _2157 * _2233;
    int _2245 = _2243 + _2205;
    int _2247 = abs(_2201);
    int _2249 = _2145 * _2235;
    int _2251 = ~_1258;
    int _2253 = _2251 + 1;
    int _2255 = _1957 * _2215;
    int _2257 = _2255 + _2245;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2261 = _2259 != 0;
    float _2263 = trunc(_1777);
    int _2265 = int(_2263);
    int _2267 = _2189 * _2247;
    int _2269 = _2267 + _1292;
    int _2271 = int(_2113) + int(_2223);
    bool _2273 = !_2209;
    int _2275 = _2273 ? 0 : 1;
    bool _2277 = !_2261;
    int _2279 = _2277 ? 0 : 1;
    int _2281 = abs(_2275);
    int _2283 = _2253 * int(_2241);
    int _2285 = _2283 + _2181;
    int _2287 = abs(_2279);
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2291 = _2289 != 0;
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2295 = _2293 != 0;
    int _2297 = ~_1238;
    int _2299 = _2297 + 1;
    int _2301 = _1829 * _2287;
    int _2303 = _2301 + _2257;
    float _2305 = float(uint(_2285));
    int _2307 = _2265 * _2281;
    int _2309 = _2307 + _2249;
    bool _2311 = !_2291;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2299 * _2271;
    int _2317 = _2315 + _2067;
    bool _2319 = !_2295;
    int _2321 = _2319 ? 0 : 1;
    float _2323 = as_type<float>(_1322) * _2305;
    int _2325 = abs(_2313);
    float _2327 = float(uint(_2303));
    float _2329 = trunc(_2323);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    bool _2335 = uint(_2317) >= uint(_1238);
    float _2337 = as_type<float>(_1359) * _2327;
    bool _2339 = !_2335;
    int _2341 = _2339 ? 0 : (-1);
    int _2343 = abs(_2321);
    float _2345 = trunc(_2337);
    float _2347 = precise::max(_2345, 0.0);
    uint _2349 = uint(_2347);
    int _2351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2353 = _2351 != 0;
    int _2355 = _2269 * _2325;
    int _2357 = _2355 + _2309;
    int _2359 = ~_2271;
    int _2361 = _2359 + _2341;
    int _2363 = _2361 + 1;
    bool _2365 = _1238 == 0;
    int _2367 = _2189 * _2343;
    int _2369 = _2367 + _2357;
    int _2371 = ~_1272;
    int _2373 = _2371 + 1;
    int _2375 = _1238 * _2363;
    int _2377 = _2375 + _2067;
    bool _2379 = _1166 > 0.5;
    float _2381 = in.m_65.w;
    float _2383 = float(uint(_2369));
    float _2385 = -_1799;
    float _2387 = _2385 + 1.0;
    bool _2389 = !_2365;
    int _2391 = _2389 ? _2377 : (-1);
    int _2393 = as_type<int>(_2217);
    if (_2353)
    {
        float _2395 = -_1172;
        float _2397 = _2395 + 1.0;
        _2393 = as_type<int>(_2397);
    }
    int _2399 = _2393;
    int _2401 = int(_2241) + int(_2333);
    float _2403 = as_type<float>(_1300) * _2383;
    int _2405 = _2373 * int(_2349);
    int _2407 = _2405 + _2303;
    int _2409 = _2391 & 3;
    bool _2411 = _2409 != 0;
    if (_2353)
    {
        float _2413 = _2379 ? as_type<float>(_2399) : _1172;
        _1336 = _2413;
    }
    float _2415 = _1336;
    int _2417 = ~_1258;
    int _2419 = _2417 + 1;
    float _2421 = trunc(_2403);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    bool _2427 = uint(_2409) > 1u;
    float _2429 = float(uint(_2407));
    int _2431 = _2419 * _2401;
    int _2433 = _2431 + _2181;
    int _2435 = _2391 & 3;
    bool _2437 = _2435 != 0;
    int _2439 = ~_1252;
    int _2441 = _2439 + 1;
    float _2443 = as_type<float>(_1359) * _2429;
    int _2445 = _2437 ? 0 : 1;
    bool _2447 = uint(_2433) >= uint(_1258);
    int _2449 = ~_2445;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    float _2455 = trunc(_2443);
    float _2457 = precise::max(_2455, 0.0);
    uint _2459 = uint(_2457);
    int _2461 = _2453;
    if (!_2427)
    {
        int _2463 = ~_2445;
        int _2465 = _2463 + 1;
        _2461 = _2465;
    }
    int _2467 = _2461;
    int _2469 = _2441 * int(_2425);
    int _2471 = _2469 + _2369;
    bool _2473 = !_2447;
    int _2475 = _2473 ? 0 : (-1);
    bool _2477 = _2409 != 3;
    bool _2479 = uint(_2409) >= 2u;
    int _2481 = ~_2401;
    int _2483 = _2481 + _2475;
    int _2485 = _2483 + 1;
    int _2487 = _2479 ? 0 : 1;
    float _2489 = float(uint(_2471));
    int _2491 = _1258 * _2485;
    int _2493 = _2491 + _2181;
    int _2495 = _2379 ? as_type<int>(_2387) : as_type<int>(_1799);
    bool _2497 = _2381 > 0.5;
    float _2499 = as_type<float>(_1300) * _2489;
    int _2501 = ~_1272;
    int _2503 = _2501 + 1;
    bool _2505 = _1258 == 0;
    float _2507 = trunc(_2499);
    float _2509 = precise::max(_2507, 0.0);
    uint _2511 = uint(_2509);
    int _2513 = ~_2487;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _2517;
    if (_2477)
    {
        int _2521 = ~_2487;
        int _2523 = _2521 + 1;
        _2519 = _2523;
    }
    int _2525 = _2519;
    int _2527 = int(_2349) + int(_2459);
    bool _2529 = !_2505;
    int _2531 = _2529 ? _2493 : (-1);
    int _2533 = _2497 ? as_type<int>(_2387) : as_type<int>(_1799);
    int _2535 = _2503 * _2527;
    int _2537 = _2535 + _2303;
    int _2539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2541 = _2539 != 0;
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = !_2541;
    int _2549 = _2547 ? 0 : 1;
    bool _2551 = uint(_2543) >= 2u;
    int _2553 = _2545 ? 0 : 1;
    bool _2555 = uint(_2537) >= uint(_1272);
    int _2557 = _2551 ? 0 : 1;
    bool _2559 = _2543 != 3;
    bool _2561 = !_2555;
    int _2563 = _2561 ? 0 : (-1);
    int _2565 = ~_1252;
    int _2567 = _2565 + 1;
    bool _2569 = uint(_2543) > 1u;
    int _2571 = ~_2527;
    int _2573 = _2571 + _2563;
    int _2575 = _2573 + 1;
    int _2577 = int(_2425) + int(_2511);
    int _2579 = _1272 * _2575;
    int _2581 = _2579 + _2303;
    bool _2583 = _1272 == 0;
    int _2585 = ~_2557;
    int _2587 = _2585 + 1;
    int _2589 = _2587 + 1;
    int _2591 = _2567 * _2577;
    int _2593 = _2591 + _2369;
    int _2595 = _2589;
    if (_2559)
    {
        int _2597 = ~_2557;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2605 = _2603 != 0;
    int _2607 = ~_2553;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2583;
    int _2615 = _2613 ? _2581 : (-1);
    int _2617 = _2611;
    if (!_2569)
    {
        int _2619 = ~_2553;
        int _2621 = _2619 + 1;
        _2617 = _2621;
    }
    int _2623 = _2617;
    bool _2625 = uint(_2593) >= uint(_1252);
    bool _2627 = !_2605;
    int _2629 = _2627 ? 0 : 1;
    int _2631 = _2615 & 3;
    bool _2633 = _2631 != 0;
    bool _2635 = !_2625;
    int _2637 = _2635 ? 0 : (-1);
    int _2639 = _2633 ? 0 : 1;
    bool _2641 = uint(_2631) >= 2u;
    bool _2643 = _2631 != 3;
    int _2645 = ~_2577;
    int _2647 = _2645 + _2637;
    int _2649 = _2647 + 1;
    int _2651 = _2641 ? 0 : 1;
    bool _2653 = uint(_2631) > 1u;
    int _2655 = _1252 * _2649;
    int _2657 = _2655 + _2369;
    bool _2659 = _1252 == 0;
    int _2661 = ~_2651;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    bool _2667 = !_2659;
    int _2669 = _2667 ? _2657 : (-1);
    int _2671 = _2665;
    if (_2643)
    {
        int _2673 = ~_2651;
        int _2675 = _2673 + 1;
        _2671 = _2675;
    }
    int _2677 = _2671;
    int _2679 = _2669 & 3;
    bool _2681 = _2679 != 0;
    int _2683 = ~_2639;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    int _2689 = _2687;
    if (!_2653)
    {
        int _2691 = ~_2639;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = uint(_2679) >= 2u;
    int _2699 = _2681 ? 0 : 1;
    int _2701 = _2697 ? 0 : 1;
    bool _2703 = _2679 != 3;
    bool _2705 = uint(_2679) > 1u;
    int _2707 = ~_2701;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = ~_2699;
    int _2715 = _2713 + 1;
    int _2717 = _2715 + 1;
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2723 = _2711;
    int _2725 = _2717;
    if (_2703)
    {
        int _2727 = ~_2701;
        int _2729 = _2727 + 1;
        _2723 = _2729;
    }
    int _2731 = _2723;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2735 = _2733 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2705)
    {
        int _2737 = ~_2699;
        int _2739 = _2737 + 1;
        _2725 = _2739;
    }
    int _2741 = _2725;
    float _2743 = 1.0 / _2721;
    float _2745 = in.m_50.x;
    float _2747 = in.m_50.y;
    float _2749 = in.m_50.z;
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2753 = _2751 != 0;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2757 = _2755 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2761 = _2759 != 0;
    bool _2763 = !_2753;
    int _2765 = _2763 ? 0 : 1;
    float _2767 = _2761 ? as_type<float>(_2495) : _1799;
    float _2769 = 1.0 / _2735;
    int _2771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2773 = _2771 != 0;
    bool _2775 = _1481 > 0.5;
    float _2777 = _2773 ? as_type<float>(_2533) : _1799;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2781 = _2779 != 0;
    float _2783 = 1.0 / _2757;
    int _2785 = _2775 ? as_type<int>(_2387) : as_type<int>(_1799);
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2789 = _2787 != 0;
    float _2791 = _2781 ? as_type<float>(_2785) : _1799;
    float _2793 = _200 * _2747;
    float _2795 = _2789 ? as_type<float>(_2785) : _1799;
    int _2797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2799 = _2797 != 0;
    int _2801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2803 = _2801 != 0;
    float _2805 = fma(_198, _2745, _2793);
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2809 = _2807 != 0;
    float _2811 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2813 = _2811 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2815 = _206 * _2747;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2819 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2821 = _1471 * 2.0;
    float _2823 = 1.0 / _2813;
    float _2825 = _212 * _2747;
    float _2827 = fma(_204, _2745, _2815);
    float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2831 = _2829 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2833 = fma(_2819, -2.0, _2817);
    float _2835 = fma(_210, _2745, _2825);
    float _2837 = floor(_2821);
    float _2839 = fma(_202, _2749, _2805);
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2843 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2841;
    float _2845 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2847 = _2845 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2849 = fma(_214, _2749, _2835);
    float _2851 = fma(_208, _2749, _2827);
    float _2853 = 1.0 / _2831;
    float _2855 = _2799 ? as_type<float>(_2785) : _1799;
    float _2857 = _2843 * _2783;
    float _2859 = _2803 ? as_type<float>(_2785) : _1799;
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2863 = _1160 + _2861;
    bool _2865 = !_2809;
    int _2867 = _2865 ? 0 : 1;
    float _2869 = _2839 + _1595;
    float _2871 = float(uint(_1957));
    float _2873 = 1.0 / _2847;
    float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2877 = _2875 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2881 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2879;
    bool _2883 = _2837 > 0.0;
    float _2885 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2833);
    float _2887 = _2877 * _2743;
    float _2889 = _2881 * _2769;
    float _2891 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2893 = _2891 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2897 = _2895 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2899 = _2837 >= 0.0;
    bool _2901 = isnan(_2837);
    bool _2903 = _2899 || _2901;
    bool _2905 = isnan(0.0);
    bool _2907 = _2903 || _2905;
    float _2909 = 1.0 / _2893;
    float _2911 = _2897 * _2823;
    float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2913;
    int _2917 = _2907 ? 0 : 1;
    float _2919 = _2915 * _2853;
    float _2921 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2923 = _2921 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2925 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2925;
    float _2929 = _1166 * 2.0;
    int _2931 = ~_2917;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    float _2937 = _2923 * _2873;
    float _2939 = float(uint(_1881));
    bool _2941 = _1483 != 2;
    int _2943 = _2935;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2947 = _2823;
    float _2949 = _2873;
    float _2951 = _2859;
    if (!_2883)
    {
        int _2953 = ~_2917;
        int _2955 = _2953 + 1;
        _2943 = _2955;
    }
    int _2957 = _2943;
    float _2959 = _2927 * _2909;
    float _2961 = floor(_2929);
    float _2963 = as_type<float>(_1288) * _2939;
    if (!_1553)
    {
        _2945 = _1166;
    }
    float _2965 = _2945;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2969 = _1160 + _2967;
    float _2971 = _2965;
    if (!_1553)
    {
        _2947 = _1166;
    }
    float _2973 = _2947;
    float _2975 = _2973;
    if (!_1553)
    {
        _2949 = _1481;
    }
    float _2977 = _2949;
    float _2979 = fma(_2857, _2969, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2981 = trunc(_2963);
    float _2983 = precise::max(_2981, 0.0);
    uint _2985 = uint(_2983);
    float _2987 = 0.0;
    float _2989 = _2977;
    if (!_1553)
    {
        _2987 = _1481;
    }
    float _2991 = _2987;
    float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2995 = _1160 + _2993;
    bool _2997 = !_1553;
    float _2999 = _2997 ? as_type<float>(_1485) : as_type<float>(_1487);
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3003 = _1160 + _3001;
    bool _3005 = !_1553;
    float _3007 = _3005 ? as_type<float>(_1487) : as_type<float>(_1489);
    float _3009 = fma(_2911, _2995, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3011 = _2991;
    if (_1553)
    {
        _2971 = _1471;
    }
    float _3013 = _2971;
    float _3015 = fma(_2937, _3003, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1553)
    {
        _2975 = _1471;
    }
    float _3017 = _2975;
    if (_1553)
    {
        _2989 = _1166;
    }
    float _3019 = _2989;
    if (_1553)
    {
        _3011 = _1166;
    }
    float _3021 = _3011;
    bool _3023 = _2961 > 0.0;
    bool _3025 = _2961 >= 0.0;
    bool _3027 = isnan(_2961);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan(0.0);
    bool _3033 = _3029 || _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3037 = _1160 + _3035;
    int _3039 = ~_1238;
    int _3041 = _3039 + 1;
    float _3043 = float(uint(_1909));
    float _3045 = fma(_2887, _3037, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3047 = fma(_2889, _2863, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3051 = _1160 + _3049;
    int _3053 = _3041 * int(_2985);
    int _3055 = _3053 + _1881;
    float _3057 = as_type<float>(_1322) * _3043;
    bool _3059 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3061 = isnan(_1160);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3067 = _3063 || _3065;
    float _3069 = float(_3067);
    float _3071 = fma(_2959, _3051, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3073 = float(uint(_2269));
    float _3075 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3077 = _1160 + _3075;
    float _3079 = float(uint(_3055));
    float _3081 = _2851 + _1557;
    float _3083 = trunc(_3057);
    float _3085 = precise::max(_3083, 0.0);
    uint _3087 = uint(_3085);
    bool _3089 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3091 = isnan(_1160);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = -_3069;
    float _3103 = _3101 + 1.0;
    float _3105 = as_type<float>(_1288) * _3079;
    bool _3107 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3109 = isnan(_1160);
    bool _3111 = _3107 || _3109;
    bool _3113 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3115 = _3111 || _3113;
    float _3117 = float(_3115);
    float _3119 = as_type<float>(_1300) * _3073;
    float _3121 = -_3099;
    float _3123 = _3121 + 1.0;
    bool _3125 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3127 = isnan(_1160);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3133 = _3129 || _3131;
    float _3135 = float(_3133);
    float _3137 = fma(_2919, _3077, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3139 = -_3117;
    float _3141 = _3139 + 1.0;
    float _3143 = _3117 * _3123;
    bool _3145 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3147 = isnan(_1160);
    bool _3149 = _3145 || _3147;
    bool _3151 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3153 = _3149 || _3151;
    float _3155 = float(_3153);
    float _3157 = trunc(_3119);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    float _3163 = _3069 * _3141;
    float _3165 = as_type<float>(_1359) * _2871;
    bool _3167 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3169 = isnan(_1160);
    bool _3171 = _3167 || _3169;
    bool _3173 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3175 = _3171 || _3173;
    float _3177 = float(_3175);
    float _3179 = -_3155;
    float _3181 = _3179 + 1.0;
    int _3183 = _1667 * int(_3087);
    int _3185 = _3183 + _1909;
    float _3187 = _3155 * _3103;
    bool _3189 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3191 = isnan(_1160);
    bool _3193 = _3189 || _3191;
    bool _3195 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3197 = _3193 || _3195;
    float _3199 = float(_3197);
    float _3201 = trunc(_3165);
    float _3203 = precise::max(_3201, 0.0);
    uint _3205 = uint(_3203);
    float _3207 = _3135 * _3181;
    float _3209 = float(uint(_3185));
    float _3211 = -_3135;
    float _3213 = _3211 + 1.0;
    int _3215 = ~_1272;
    int _3217 = _3215 + 1;
    bool _3219 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3221 = isnan(_1160);
    bool _3223 = _3219 || _3221;
    bool _3225 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3227 = _3223 || _3225;
    float _3229 = float(_3227);
    float _3231 = as_type<float>(_1322) * _3209;
    float _3233 = -_3177;
    float _3235 = _3233 + 1.0;
    int _3237 = ~_1252;
    int _3239 = _3237 + 1;
    float _3241 = trunc(_3105);
    float _3243 = precise::max(_3241, 0.0);
    uint _3245 = uint(_3243);
    float _3247 = _3199 * _3213;
    float _3249 = _3229 * _3235;
    float _3251 = -_3199;
    float _3253 = _3251 + 1.0;
    int _3255 = _3239 * int(_3161);
    int _3257 = _3255 + _2269;
    float _3259 = -_3229;
    float _3261 = _3259 + 1.0;
    int _3263 = _3217 * int(_3205);
    int _3265 = _3263 + _1957;
    float _3267 = _2979 * _3249;
    float _3269 = trunc(_3231);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = _3177 * _3253;
    float _3277 = _3033 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3279 = fma(_3261, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3267);
    float _3281 = float(uint(_3265));
    float _3283 = _2849 + _1651;
    int _3285 = ~_1238;
    int _3287 = _3285 + 1;
    float _3289 = fma(_3045, _3275, _3279);
    float _3291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3293 = _2869 + _3291;
    float _3295 = as_type<float>(_1359) * _3281;
    float _3297 = float(uint(_3257));
    float _3299 = fma(_3047, _3247, _3289);
    int _3301 = ~_1258;
    int _3303 = _3301 + 1;
    float _3305 = trunc(_3295);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    int _3311 = ~as_type<int>(_3277);
    int _3313 = _3311 + 1;
    int _3315 = _3313 + 1;
    float _3317 = as_type<float>(_1300) * _3297;
    int _3319 = int(_2985) + int(_3245);
    float _3321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3323 = _3081 + _3321;
    int _3325 = int(_3087) + int(_3273);
    float _3327 = fma(_3009, _3207, _3299);
    int _3329 = _3315;
    float _3331 = _3277;
    float _3333 = _3275;
    if (!_3023)
    {
        int _3335 = ~as_type<int>(_3277);
        int _3337 = _3335 + 1;
        _3329 = _3337;
    }
    int _3339 = _3329;
    float _3341 = trunc(_3317);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    int _3347 = _3287 * _3319;
    int _3349 = _3347 + _1881;
    int _3351 = ~_1272;
    int _3353 = _3351 + 1;
    float _3355 = fma(_3137, _3187, _3327);
    float _3357 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3359 = uint(_3349) >= uint(_1238);
    int _3361 = _3303 * _3325;
    int _3363 = _3361 + _1909;
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3367 = int(_3205) + int(_3309);
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3371 = !_3359;
    int _3373 = _3371 ? 0 : (-1);
    float _3375 = _1481 * 2.0;
    bool _3377 = uint(_3363) >= uint(_1258);
    float _3379 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3381 = -_3369;
    float _3383 = fma(_3357, 2.0, _3381);
    int _3385 = int(_3161) + int(_3345);
    int _3387 = _3353 * _3367;
    int _3389 = _3387 + _1957;
    int _3391 = ~_1252;
    int _3393 = _3391 + 1;
    float _3395 = floor(_3375);
    bool _3397 = !_3377;
    int _3399 = _3397 ? 0 : (-1);
    float _3401 = -_168;
    float _3403 = fma(_3401, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3383);
    bool _3405 = uint(_3389) >= uint(_1272);
    float _3407 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3379);
    float _3409 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3413 = _3283 + _3411;
    bool _3415 = !_3405;
    int _3417 = _3415 ? 0 : (-1);
    float _3419 = fma(_3409, _1375, -0.5);
    int _3421 = _3393 * _3385;
    int _3423 = _3421 + _2269;
    float _3425 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3407);
    bool _3427 = uint(_3423) >= uint(_1252);
    float _3429 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3431 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3435 = !_3427;
    int _3437 = _3435 ? 0 : (-1);
    float _3439 = fma(as_type<float>(_1489), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3429);
    bool _3441 = _3425 >= 0.0;
    float _3443 = as_type<float>(_1489) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3445 = fma(as_type<float>(_1487), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3431);
    float _3447 = as_type<float>(_1487) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3449 = _1166 + _1471;
    float _3451 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3439);
    float _3453 = fma(_3447, -2.0, _3433);
    float _3455 = _3449 + (-1.0);
    float _3457 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3459 = ~_3325;
    int _3461 = _3459 + _3399;
    int _3463 = _3461 + 1;
    float _3465 = fma(_3015, _3163, _3355);
    float _3467 = fma(_3455, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3469 = _3455;
    if (_3441)
    {
        _3469 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3471 = _3469;
    float _3473 = -_3457;
    float _3475 = fma(_3443, 2.0, _3473);
    int _3477 = ~_3319;
    int _3479 = _3477 + _3373;
    int _3481 = _3479 + 1;
    bool _3483 = !_2411;
    int _3485 = _3483 ? 0 : 1;
    int _3487 = as_type<int>(_3471);
    if (_3441)
    {
        float _3489 = _3471 * 5.0;
        _3487 = as_type<int>(_3489);
    }
    int _3491 = _3487;
    int _3493 = _2531 & 3;
    bool _3495 = _3493 != 0;
    float _3497 = fma(_3071, _3143, _3465);
    int _3499 = _1238 * _3481;
    int _3501 = _3499 + _1881;
    if (_3441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11842 = as_type<float>(_3491);
        out.gl_Position.z = _11842;
    }
    bool _3503 = !_3495;
    int _3505 = _3503 ? 0 : 1;
    float _3507 = fma(_3099, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3497);
    int _3509 = _2615 & 3;
    bool _3511 = _3509 != 0;
    float _3513 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3515 = _1258 * _3463;
    int _3517 = _3515 + _1909;
    bool _3519 = !_3511;
    int _3521 = _3519 ? 0 : 1;
    float _3523 = fma(_3017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3513);
    int _3525 = _2669 & 3;
    bool _3527 = _3525 != 0;
    out.m_77.x = _3507;
    float _3529 = _3323 * _3323;
    bool _3531 = !_3527;
    int _3533 = _3531 ? 0 : 1;
    float _3535 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3445);
    bool _3537 = _2409 != 3;
    float _3539 = fma(_3293, _3293, _3529);
    float _3541 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3543 = fma(_3413, _3413, _3539);
    bool _3545 = !_3537;
    int _3547 = _3545 ? 0 : (-1);
    float _3549 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3551 = _2391 >> 31;
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3555 = _2543 != 3;
    float _3557 = fma(_2999, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3549);
    float _3559 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3561 = _3551 & 3;
    float _3563 = rsqrt(_3543);
    int _3565 = _2615 >> 31;
    float _3567 = fma(_3559, -2.0, _3553);
    int _3569 = _2531 >> 31;
    float _3571 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3541);
    int _3573 = _2391 + _3561;
    float _3575 = _3007 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3577 = _3569 & 3;
    float _3579 = -_168;
    float _3581 = fma(_3579, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3475);
    int _3583 = _3573 >> 2;
    float _3585 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3453);
    int _3587 = _2531 + _3577;
    float _3589 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3571);
    int _3591 = _2669 >> 31;
    float _3593 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3523);
    int _3595 = _3565 & 3;
    float _3597 = _3293 * _3563;
    int _3599 = _3587 >> 2;
    float _3601 = _3323 * _3563;
    int _3603 = _3583 << 4;
    int _3605 = _3603 + 368;
    float _3607 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3567);
    bool _3609 = !_3555;
    int _3611 = _3609 ? 0 : (-1);
    float _3613 = -_3601;
    float _3615 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3323);
    bool _3617 = _2631 != 3;
    if (_3441)
    {
        out.m_53.x = 0.0;
    }
    if (_2941)
    {
        _3331 = _1471;
    }
    float _3619 = _3331;
    float _3621 = _3615 * _3615;
    float _3623 = _3619;
    if (_2941)
    {
        _3333 = _1166;
    }
    float _3625 = _3333;
    int _3627 = _3591 & 3;
    float _3629 = _3625;
    if (!_2941)
    {
        _3623 = _1481;
    }
    float _3631 = _3623;
    uint _3633 = uint(int(uint(_3605) >> uint(2)));
    uint _3635 = uint(int(uint(int(_3633)) >> uint(2)));
    int _3637 = int(_3633) & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = int(_3633) + 1;
    uint _3643 = uint(int(uint(_3641) >> uint(2)));
    int _3645 = _3641 & 3;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[int(_3643)][_3645];
    if (!_2941)
    {
        _3629 = _1471;
    }
    float _3649 = _3629;
    int _3651 = _2615 + _3595;
    float _3653 = _3631 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3655 = _3599 << 4;
    int _3657 = _3655 + 512;
    float _3659 = _3649 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3661 = _3395 > 0.0;
    float _3663 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3665 = int(_3663);
    bool _3667 = _3395 >= 0.0;
    bool _3669 = isnan(_3395);
    bool _3671 = _3667 || _3669;
    bool _3673 = isnan(0.0);
    bool _3675 = _3671 || _3673;
    uint _3677 = uint(int(uint(_3657) >> uint(2)));
    uint _3679 = uint(int(uint(int(_3677)) >> uint(2)));
    int _3681 = int(_3677) & 3;
    float _3683 = (*spvDescriptorSet0.vp_c9)._m0[int(_3679)][_3681];
    int _3685 = int(_3677) + 1;
    uint _3687 = uint(int(uint(_3685) >> uint(2)));
    int _3689 = _3685 & 3;
    float _3691 = (*spvDescriptorSet0.vp_c9)._m0[int(_3687)][_3689];
    bool _3693 = _2679 != 3;
    float _3695 = -_3597;
    float _3697 = fma(_3695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3293);
    int _3699 = _2669 + _3627;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3703 = _3651 >> 2;
    float _3705 = fma(_3697, _3697, _3621);
    float _3707 = -_3701;
    float _3709 = fma(_3575, 2.0, _3707);
    bool _3711 = !_2365;
    int _3713 = _3711 ? _3501 : (-1);
    float _3715 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3717 = int(_3715);
    bool _3719 = !_2505;
    int _3721 = _3719 ? _3517 : (-1);
    float _3723 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3725 = !_3693;
    int _3727 = _3725 ? 0 : (-1);
    float _3729 = _3019 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3731 = _3699 >> 2;
    int _3733 = _3703 << 4;
    int _3735 = _3733 + 656;
    int _3737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3739 = _3737 != 0;
    int _3741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3743 = _3741 != 0;
    int _3745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3747 = _3745 != 0;
    float _3749 = _3013 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3751 = _3731 << 4;
    int _3753 = _3751 + 800;
    uint _3755 = uint(int(uint(_3735) >> uint(2)));
    uint _3757 = uint(int(uint(int(_3755)) >> uint(2)));
    int _3759 = int(_3755) & 3;
    float _3761 = (*spvDescriptorSet0.vp_c9)._m0[int(_3757)][_3759];
    int _3763 = int(_3755) + 1;
    uint _3765 = uint(int(uint(_3763) >> uint(2)));
    int _3767 = _3763 & 3;
    float _3769 = (*spvDescriptorSet0.vp_c9)._m0[int(_3765)][_3767];
    float _3771 = -_3723;
    float _3773 = fma(_3749, 2.0, _3771);
    float _3775 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3777 = _3675 ? 0 : 1;
    uint _3779 = uint(int(uint(_3753) >> uint(2)));
    uint _3781 = uint(int(uint(int(_3779)) >> uint(2)));
    int _3783 = int(_3779) & 3;
    float _3785 = (*spvDescriptorSet0.vp_c9)._m0[int(_3781)][_3783];
    int _3787 = int(_3779) + 1;
    uint _3789 = uint(int(uint(_3787) >> uint(2)));
    int _3791 = _3787 & 3;
    float _3793 = (*spvDescriptorSet0.vp_c9)._m0[int(_3789)][_3791];
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3797 = -_3775;
    float _3799 = fma(_3653, 2.0, _3797);
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3803 = ~_3367;
    int _3805 = _3803 + _3417;
    int _3807 = _3805 + 1;
    float _3809 = fma(_3659, -2.0, _3795);
    int _3811 = ~_3385;
    int _3813 = _3811 + _3437;
    int _3815 = _3813 + 1;
    float _3817 = fma(_3729, -2.0, _3801);
    int _3819 = _3605 + 8;
    uint _3821 = uint(int(uint(_3819) >> uint(2)));
    uint _3823 = uint(int(uint(int(_3821)) >> uint(2)));
    int _3825 = int(_3821) & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = int(_3821) + 1;
    uint _3831 = uint(int(uint(_3829) >> uint(2)));
    int _3833 = _3829 & 3;
    float _3835 = (*spvDescriptorSet0.vp_c9)._m0[int(_3831)][_3833];
    int _3837 = ~_3777;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    float _3843 = -_168;
    float _3845 = fma(_3843, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3773);
    int _3847 = _3841;
    if (!_3661)
    {
        int _3849 = ~_3777;
        int _3851 = _3849 + 1;
        _3847 = _3851;
    }
    int _3853 = _3847;
    int _3855 = _1252 * _3815;
    int _3857 = _3855 + _2269;
    int _3859 = abs(_2623);
    float _3861 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3817);
    int _3863 = abs(_2467);
    int _3865 = _3735 + 8;
    uint _3867 = uint(int(uint(_3865) >> uint(2)));
    uint _3869 = uint(int(uint(int(_3867)) >> uint(2)));
    int _3871 = int(_3867) & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = int(_3867) + 1;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    int _3879 = _3875 & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = abs(_2695);
    int _3885 = _1272 * _3807;
    int _3887 = _3885 + _1957;
    int _3889 = ~_3863;
    int _3891 = _3889 + 1;
    int _3893 = _3891 + 1;
    float _3895 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3897 = int(_3895);
    int _3899 = ~_3859;
    int _3901 = _3899 + 1;
    int _3903 = _3901 + 1;
    float _3905 = -_168;
    float _3907 = fma(_3905, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3799);
    int _3909 = abs(_3521);
    int _3911 = _3657 + 8;
    uint _3913 = uint(int(uint(_3911) >> uint(2)));
    uint _3915 = uint(int(uint(int(_3913)) >> uint(2)));
    int _3917 = int(_3913) & 3;
    float _3919 = (*spvDescriptorSet0.vp_c9)._m0[int(_3915)][_3917];
    int _3921 = int(_3913) + 1;
    uint _3923 = uint(int(uint(_3921) >> uint(2)));
    int _3925 = _3921 & 3;
    float _3927 = (*spvDescriptorSet0.vp_c9)._m0[int(_3923)][_3925];
    int _3929 = _3893 * as_type<int>(_3647);
    int _3931 = abs(_3533);
    int _3933 = _3903 * as_type<int>(_3691);
    int _3935 = abs(_3485);
    float _3937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3939 = abs(_2741);
    float _3941 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3809);
    int _3943 = _3753 + 8;
    uint _3945 = uint(int(uint(_3943) >> uint(2)));
    uint _3947 = uint(int(uint(int(_3945)) >> uint(2)));
    int _3949 = int(_3945) & 3;
    float _3951 = (*spvDescriptorSet0.vp_c9)._m0[int(_3947)][_3949];
    int _3953 = int(_3945) + 1;
    uint _3955 = uint(int(uint(_3953) >> uint(2)));
    int _3957 = _3953 & 3;
    float _3959 = (*spvDescriptorSet0.vp_c9)._m0[int(_3955)][_3957];
    int _3961 = ~_3883;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = ~_3939;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    int _3973 = _3965 * as_type<int>(_3769);
    int _3975 = abs(_3505);
    int _3977 = ~_3935;
    int _3979 = _3977 + 1;
    int _3981 = _3979 + 1;
    float _3983 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3985 = ~_3931;
    int _3987 = _3985 + 1;
    int _3989 = _3987 + 1;
    int _3991 = _3971 * as_type<int>(_3793);
    int _3993 = ~_3975;
    int _3995 = _3993 + 1;
    int _3997 = _3995 + 1;
    int _3999 = _3981 * as_type<int>(_3639);
    int _4001 = _3999 + _3929;
    int _4003 = abs(_2525);
    int _4005 = _3989 * as_type<int>(_3785);
    int _4007 = _4005 + _3991;
    int _4009 = ~_3909;
    int _4011 = _4009 + 1;
    int _4013 = _4011 + 1;
    float _4015 = fma(_3021, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3983);
    int _4017 = abs(_2677);
    float _4019 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4021 = int(_4019);
    int _4023 = _3997 * as_type<int>(_3683);
    int _4025 = _4023 + _3933;
    int _4027 = abs(_3547);
    int _4029 = _4013 * as_type<int>(_3761);
    int _4031 = _4029 + _3973;
    int _4033 = ~_4003;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = _3937 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4041 = ~_4017;
    int _4043 = _4041 + 1;
    int _4045 = _4043 + 1;
    float _4047 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4015);
    int _4049 = abs(_2601);
    int _4051 = _4037 * as_type<int>(_3827);
    int _4053 = _4051 + _4001;
    float _4055 = float(uint(_3717));
    int _4057 = _4045 * as_type<int>(_3873);
    int _4059 = _4057 + _4031;
    int _4061 = ~_4027;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    float _4067 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4069 = log2(_4067);
    int _4071 = abs(_2549);
    float _4073 = fma(_4039, _2855, -0.5);
    int _4075 = ~_4049;
    int _4077 = _4075 + 1;
    int _4079 = _4077 + 1;
    int _4081 = _4065 * as_type<int>(_3835);
    int _4083 = _4081 + _4053;
    int _4085 = abs(_3611);
    int _4087 = ~_4071;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    float _4093 = 1.0 / _4055;
    bool _4095 = !_3617;
    int _4097 = _4095 ? 0 : (-1);
    int _4099 = _4079 * as_type<int>(_3919);
    int _4101 = _4099 + _4025;
    int _4103 = ~_4085;
    int _4105 = _4103 + 1;
    int _4107 = _4105 + 1;
    int _4109 = _4083 * _4091;
    float _4111 = float(uint(_4021));
    int _4113 = abs(_2731);
    int _4115 = _4107 * as_type<int>(_3927);
    int _4117 = _4115 + _4101;
    int _4119 = abs(_4097);
    float _4121 = 1.0 / _4111;
    int _4123 = abs(_2629);
    int _4125 = _3713 * _4071;
    int _4127 = _4125 + _4109;
    float _4129 = float(uint(_3665));
    int _4131 = ~_4119;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    int _4137 = ~_4113;
    int _4139 = _4137 + 1;
    int _4141 = _4139 + 1;
    float _4143 = 1.0 / _4129;
    int _4145 = ~_4123;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    int _4151 = _4135 * as_type<int>(_3881);
    int _4153 = _4151 + _4059;
    int _4155 = abs(_3727);
    int _4157 = _4141 * as_type<int>(_3951);
    int _4159 = _4157 + _4007;
    int _4161 = as_type<int>(_4093) + (-2);
    int _4163 = _4149 * _4117;
    int _4165 = abs(_2765);
    float _4167 = float(uint(_4127));
    int _4169 = _3721 * _4123;
    int _4171 = _4169 + _4163;
    float _4173 = float(uint(_3897));
    int _4175 = abs(_2867);
    float _4177 = as_type<float>(_4161) * _4167;
    int _4179 = ~_4155;
    int _4181 = _4179 + 1;
    int _4183 = _4181 + 1;
    int _4185 = ~_4165;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    float _4191 = 1.0 / _4173;
    bool _4193 = _1272 == 0;
    int _4195 = _4183 * as_type<int>(_3959);
    int _4197 = _4195 + _4159;
    int _4199 = _4189 * _4153;
    bool _4201 = !_4193;
    int _4203 = _4201 ? _3887 : (-1);
    float _4205 = _4069 * _168;
    int _4207 = ~_4175;
    int _4209 = _4207 + 1;
    int _4211 = _4209 + 1;
    float _4213 = trunc(_4177);
    float _4215 = precise::max(_4213, 0.0);
    uint _4217 = uint(_4215);
    int _4219 = as_type<int>(_4121) + (-2);
    int _4221 = _4203 * _4165;
    int _4223 = _4221 + _4199;
    float _4225 = float(uint(_4171));
    int _4227 = _4211 * _4197;
    bool _4229 = _1252 == 0;
    float _4231 = _3413 * _3563;
    int _4233 = as_type<int>(_4143) + (-2);
    float _4235 = as_type<float>(_4219) * _4225;
    bool _4237 = !_4229;
    int _4239 = _4237 ? _3857 : (-1);
    float _4241 = exp2(_4205);
    float _4243 = float(uint(_4223));
    int _4245 = ~_3717;
    int _4247 = _4245 + 1;
    int _4249 = _4239 * _4175;
    int _4251 = _4249 + _4227;
    int _4253 = as_type<int>(_4191) + (-2);
    float _4255 = as_type<float>(_4233) * _4243;
    int _4257 = abs(_3717);
    float _4259 = trunc(_4235);
    float _4261 = precise::max(_4259, 0.0);
    uint _4263 = uint(_4261);
    float _4265 = float(uint(_4251));
    int _4267 = _4247 * int(_4217);
    int _4269 = _4267 + _4127;
    float _4271 = float(uint(_4257));
    float _4273 = -_4231;
    float _4275 = fma(_4273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3413);
    int _4277 = abs(_4021);
    float _4279 = as_type<float>(_4253) * _4265;
    float _4281 = float(uint(_4269));
    float _4283 = trunc(_4255);
    float _4285 = precise::max(_4283, 0.0);
    uint _4287 = uint(_4285);
    int _4289 = ~_4021;
    int _4291 = _4289 + 1;
    float _4293 = fma(_4275, _4275, _3705);
    int _4295 = ~_3665;
    int _4297 = _4295 + 1;
    float _4299 = as_type<float>(_4161) * _4281;
    float _4301 = float(uint(_4277));
    int _4303 = abs(_3665);
    float _4305 = trunc(_4279);
    float _4307 = precise::max(_4305, 0.0);
    uint _4309 = uint(_4307);
    int _4311 = _4291 * int(_4263);
    int _4313 = _4311 + _4171;
    int _4315 = ~_3897;
    int _4317 = _4315 + 1;
    float _4319 = float(uint(_4313));
    float _4321 = 1.0 / _4271;
    int _4323 = _4297 * int(_4287);
    int _4325 = _4323 + _4223;
    float _4327 = as_type<float>(_4219) * _4319;
    float _4329 = float(uint(_4303));
    float _4331 = float(uint(_4325));
    float _4333 = 1.0 / _4301;
    int _4335 = _4317 * int(_4309);
    int _4337 = _4335 + _4251;
    int _4339 = abs(_3897);
    float _4341 = as_type<float>(_4233) * _4331;
    int _4343 = abs(_4127);
    float _4345 = float(uint(_4337));
    float _4347 = 1.0 / _4329;
    float _4349 = float(uint(_4339));
    int _4351 = abs(_4171);
    float _4353 = as_type<float>(_4253) * _4345;
    int _4355 = as_type<int>(_4321) + (-2);
    float _4357 = float(uint(_4343));
    float _4359 = 1.0 / _4349;
    int _4361 = as_type<int>(_4333) + (-2);
    int _4363 = abs(_4223);
    float _4365 = as_type<float>(_4355) * _4357;
    float _4367 = float(uint(_4351));
    float _4369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4371 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4373 = isnan(1.0);
    bool _4375 = _4371 || _4373;
    bool _4377 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4379 = _4375 || _4377;
    float _4381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4383 = 1.0 + _4381;
    float _4385 = as_type<float>(_4361) * _4367;
    float _4387 = trunc(_4365);
    float _4389 = precise::max(_4387, 0.0);
    uint _4391 = uint(_4389);
    float _4393 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4369);
    int _4395 = as_type<int>(_4347) + (-2);
    float _4397 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4399 = float(uint(_4363));
    float _4401 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4403 = abs(_4251);
    float _4405 = 1.0 / _4383;
    float _4407 = as_type<float>(_4395) * _4399;
    int _4409 = as_type<int>(_4359) + (-2);
    float _4411 = -_4241;
    float _4413 = _4411 + 1.0;
    float _4415 = float(uint(_4403));
    float _4417 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4419 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4421 = isnan(0.0);
    bool _4423 = _4419 || _4421;
    bool _4425 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4427 = _4423 || _4425;
    float _4429 = trunc(_4385);
    float _4431 = precise::max(_4429, 0.0);
    uint _4433 = uint(_4431);
    float _4435 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4397);
    float _4437 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4401);
    float _4439 = as_type<float>(_4409) * _4415;
    int _4441 = ~_4257;
    int _4443 = _4441 + 1;
    float _4445 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4417);
    float _4447 = _4427 ? _4413 : 0.0;
    float _4449 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4435);
    float _4451 = trunc(_4407);
    float _4453 = precise::max(_4451, 0.0);
    uint _4455 = uint(_4453);
    int _4457 = ~_4277;
    int _4459 = _4457 + 1;
    float _4461 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3557);
    int _4463 = _4443 * int(_4391);
    int _4465 = _4463 + _4343;
    float _4467 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4445);
    float _4469 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4393);
    float _4471 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4437);
    int _4473 = ~_4339;
    int _4475 = _4473 + 1;
    float _4477 = trunc(_4327);
    float _4479 = precise::max(_4477, 0.0);
    uint _4481 = uint(_4479);
    float _4483 = float(uint(_4465));
    float _4485 = -_3607;
    float _4487 = fma(_4461, _4073, _4485);
    float _4489 = as_type<float>(_4355) * _4483;
    float _4491 = trunc(_4299);
    float _4493 = precise::max(_4491, 0.0);
    uint _4495 = uint(_4493);
    float _4497 = trunc(_4439);
    float _4499 = precise::max(_4497, 0.0);
    uint _4501 = uint(_4499);
    float _4503 = -_168;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3709);
    float _4507 = _4231;
    if (_4379)
    {
        float _4509 = _4447 * _4405;
        _170 = _4509;
    }
    float _4511 = _170;
    int _4513 = _4459 * int(_4433);
    int _4515 = _4513 + _4351;
    int _4517 = ~_4303;
    int _4519 = _4517 + 1;
    float _4521 = fma(_3589, _3419, _4505);
    int _4523 = int(_4263) + int(_4481);
    float _4525 = trunc(_4341);
    float _4527 = precise::max(_4525, 0.0);
    uint _4529 = uint(_4527);
    int _4531 = int(_4217) + int(_4495);
    float _4533 = trunc(_4353);
    float _4535 = precise::max(_4533, 0.0);
    uint _4537 = uint(_4535);
    float _4539 = float(uint(_4515));
    int _4541 = _4519 * int(_4455);
    int _4543 = _4541 + _4363;
    int _4545 = _4475 * int(_4501);
    int _4547 = _4545 + _4403;
    float _4549 = as_type<float>(_4361) * _4539;
    int _4551 = ~_3717;
    int _4553 = _4551 + 1;
    float _4555 = trunc(_4489);
    float _4557 = precise::max(_4555, 0.0);
    uint _4559 = uint(_4557);
    float _4561 = float(uint(_4543));
    int _4563 = int(_4287) + int(_4529);
    float _4565 = as_type<float>(_4395) * _4561;
    int _4567 = ~_4021;
    int _4569 = _4567 + 1;
    float _4571 = trunc(_4549);
    float _4573 = precise::max(_4571, 0.0);
    uint _4575 = uint(_4573);
    int _4577 = int(_4309) + int(_4537);
    int _4579 = _4553 * _4531;
    int _4581 = _4579 + _4127;
    float _4583 = float(uint(_4547));
    int _4585 = ~_3897;
    int _4587 = _4585 + 1;
    float _4589 = as_type<float>(_4409) * _4583;
    int _4591 = ~_3665;
    int _4593 = _4591 + 1;
    float _4595 = trunc(_4565);
    float _4597 = precise::max(_4595, 0.0);
    uint _4599 = uint(_4597);
    bool _4601 = uint(_4581) >= uint(_3717);
    int _4603 = _4569 * _4523;
    int _4605 = _4603 + _4171;
    bool _4607 = uint(_4605) >= uint(_4021);
    float _4609 = trunc(_4589);
    float _4611 = precise::max(_4609, 0.0);
    uint _4613 = uint(_4611);
    int _4615 = _4587 * _4577;
    int _4617 = _4615 + _4251;
    bool _4619 = !_4601;
    int _4621 = _4619 ? 0 : (-1);
    int _4623 = _4593 * _4563;
    int _4625 = _4623 + _4223;
    int _4627 = int(_4391) + int(_4559);
    int _4629 = int(_4433) + int(_4575);
    bool _4631 = uint(_4625) >= uint(_3665);
    float _4633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4635 = !_4607;
    int _4637 = _4635 ? 0 : (-1);
    bool _4639 = uint(_4617) >= uint(_3897);
    int _4641 = ~_4277;
    int _4643 = _4641 + 1;
    int _4645 = ~_4257;
    int _4647 = _4645 + 1;
    int _4649 = int(_4501) + int(_4613);
    int _4651 = _4647 * _4627;
    int _4653 = _4651 + _4343;
    int _4655 = ~_4339;
    int _4657 = _4655 + 1;
    float _4659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4661 = int(_4455) + int(_4599);
    int _4663 = _4643 * _4629;
    int _4665 = _4663 + _4351;
    int _4667 = ~_4303;
    int _4669 = _4667 + 1;
    int _4671 = _4657 * _4649;
    int _4673 = _4671 + _4403;
    bool _4675 = !_4631;
    int _4677 = _4675 ? 0 : (-1);
    float _4679 = _4633 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4681 = uint(_4653) >= uint(_4257);
    int _4683 = _4669 * _4661;
    int _4685 = _4683 + _4363;
    bool _4687 = !_4639;
    int _4689 = _4687 ? 0 : (-1);
    float _4691 = fma(_4679, _1649, -0.5);
    bool _4693 = uint(_4665) >= uint(_4277);
    int _4695 = ~_4531;
    int _4697 = _4695 + _4621;
    int _4699 = _4697 + 1;
    float _4701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4703 = !_4693;
    int _4705 = _4703 ? 0 : (-1);
    float _4707 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4709 = ~_4523;
    int _4711 = _4709 + _4637;
    int _4713 = _4711 + 1;
    int _4715 = _3717 * _4699;
    int _4717 = _4715 + _4127;
    bool _4719 = uint(_4673) >= uint(_4339);
    float _4721 = _4659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4723 = ~_4577;
    int _4725 = _4723 + _4689;
    int _4727 = _4725 + 1;
    int _4729 = _4021 * _4713;
    int _4731 = _4729 + _4171;
    bool _4733 = !_4719;
    int _4735 = _4733 ? 0 : (-1);
    float _4737 = fma(_4721, _2767, -0.5);
    bool _4739 = _4021 == 0;
    int _4741 = _3897 * _4727;
    int _4743 = _4741 + _4251;
    int _4745 = ~_4563;
    int _4747 = _4745 + _4677;
    int _4749 = _4747 + 1;
    bool _4751 = !_4739;
    int _4753 = _4751 ? _4731 : (-1);
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4757 = _3897 == 0;
    bool _4759 = !_4681;
    int _4761 = _4759 ? 0 : (-1);
    int _4763 = _4127 ^ _3717;
    bool _4765 = uint(_4685) >= uint(_4303);
    int _4767 = _3665 * _4749;
    int _4769 = _4767 + _4223;
    bool _4771 = !_4757;
    int _4773 = _4771 ? _4743 : (-1);
    bool _4775 = _4021 == 0;
    int _4777 = _4171 ^ _4021;
    float _4779 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4781 = uint(int(uint(_4763) >> uint(31)));
    float _4783 = _4707 * _4755;
    bool _4785 = !_4765;
    int _4787 = _4785 ? 0 : (-1);
    float _4789 = _4779 * _4701;
    bool _4791 = _3717 == 0;
    float _4793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4795 = uint(int(uint(_4777) >> uint(31)));
    int _4797 = ~_4761;
    int _4799 = _4627 + _4797;
    int _4801 = _4799 + 1;
    out.m_79.x = _4789;
    out.m_79.y = _4783;
    int _4803 = ~int(_4781);
    int _4805 = _4803 + 1;
    bool _4807 = !_4791;
    int _4809 = _4807 ? _4717 : (-1);
    float _4811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4813 = _3665 == 0;
    int _4815 = ~_4705;
    int _4817 = _4629 + _4815;
    int _4819 = _4817 + 1;
    int _4821 = ~int(_4795);
    int _4823 = _4821 + 1;
    int _4825 = _4801 ^ _4805;
    float _4827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4829 = !_4813;
    int _4831 = _4829 ? _4769 : (-1);
    int _4833 = _4819 ^ _4823;
    bool _4835 = _3717 == 0;
    int _4837 = ~_4805;
    int _4839 = _4837 + _4825;
    int _4841 = _4839 + 1;
    float _4843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4845 = ~_4823;
    int _4847 = _4845 + _4833;
    int _4849 = _4847 + 1;
    float _4851 = _4811 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4853 = !_4835;
    int _4855 = _4853 ? _4841 : (-1);
    bool _4857 = _3665 == 0;
    float _4859 = fma(_4851, _1637, -0.5);
    int _4861 = _4223 ^ _3665;
    float _4863 = float(_4809);
    bool _4865 = !_4775;
    int _4867 = _4865 ? _4849 : (-1);
    float _4869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4871 = _3897 == 0;
    float _4873 = fma(_4679, _4863, _3403);
    int _4875 = _4251 ^ _3897;
    float _4877 = _4793 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4879 = float(_4831);
    float _4881 = fma(_4469, _4691, _4873);
    uint _4883 = uint(int(uint(_4875) >> uint(31)));
    float _4885 = fma(_4877, _1697, -0.5);
    int _4887 = ~_4735;
    int _4889 = _4649 + _4887;
    int _4891 = _4889 + 1;
    float _4893 = fma(_4877, _4879, _3907);
    int _4895 = ~int(_4883);
    int _4897 = _4895 + 1;
    float _4899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4901 = float(_4753);
    float _4903 = fma(_4471, _4885, _4893);
    int _4905 = _4891 ^ _4897;
    uint _4907 = uint(int(uint(_4861) >> uint(31)));
    float _4909 = fma(_4851, _4901, _3845);
    float _4911 = float(_4773);
    float _4913 = _4827 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4915 = ~_4897;
    int _4917 = _4915 + _4905;
    int _4919 = _4917 + 1;
    float _4921 = fma(_3593, _4859, _4909);
    int _4923 = ~_4787;
    int _4925 = _4661 + _4923;
    int _4927 = _4925 + 1;
    float _4929 = fma(_4913, _2415, -0.5);
    int _4931 = ~int(_4907);
    int _4933 = _4931 + 1;
    float _4935 = fma(_4913, _4911, _3581);
    float _4937 = float(_4855);
    float _4939 = _4899 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4941 = !_4871;
    int _4943 = _4941 ? _4919 : (-1);
    float _4945 = fma(_3451, _4929, _4935);
    int _4947 = _4927 ^ _4933;
    float _4949 = -_2885;
    float _4951 = fma(_4721, _4937, _4949);
    float _4953 = float(_4867);
    float _4955 = _4843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4957 = float(_4943);
    float _4959 = _4869 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4961 = ~_4933;
    int _4963 = _4961 + _4947;
    int _4965 = _4963 + 1;
    float _4967 = fma(_4955, _2777, -0.5);
    float _4969 = -_3861;
    float _4971 = fma(_4955, _4953, _4969);
    float _4973 = fma(_4939, _2795, -0.5);
    bool _4975 = !_4857;
    int _4977 = _4975 ? _4965 : (-1);
    float _4979 = -_3585;
    float _4981 = fma(_4939, _4957, _4979);
    float _4983 = fma(_4449, _4737, _4951);
    float _4985 = fma(_4047, _4967, _4971);
    float _4987 = float(_4977);
    float _4989 = fma(_3535, _4973, _4981);
    float _4991 = fma(_4959, _2791, -0.5);
    float _4993 = _4903 + 0.5;
    float _4995 = _4521 + 0.5;
    float _4997 = -_3941;
    float _4999 = fma(_4959, _4987, _4997);
    float _5001 = _4989 + 0.5;
    float _5003 = _4487 + 0.5;
    float _5005 = in.m_81.x;
    float _5007 = in.m_81.y;
    float _5009 = in.m_81.z;
    float _5011 = fma(_4467, _4991, _4999);
    float _5013 = _4881 + 0.5;
    float _5015 = _4921 + 0.5;
    float _5017 = _4983 + 0.5;
    float _5019 = _5011 + 0.5;
    float _5021 = _4985 + 0.5;
    float _5023 = _4945 + 0.5;
    bool _5025 = !_3739;
    int _5027 = _5025 ? 0 : 1;
    out.m_83.x = _4995;
    out.m_83.y = _5003;
    bool _5029 = !_3743;
    int _5031 = _5029 ? 0 : 1;
    int _5033 = abs(_5027);
    out.m_85.x = _5013;
    out.m_85.y = _5017;
    out.m_85.z = _5015;
    out.m_85.w = _5021;
    int _5035 = abs(_5031);
    bool _5037 = !_3747;
    int _5039 = _5037 ? 0 : 1;
    out.m_87.x = _4993;
    out.m_87.y = _5019;
    float _5041 = float(_5033);
    out.m_89.x = _5023;
    out.m_89.y = _5001;
    float _5043 = float(_3853);
    float _5045 = _4885;
    float _5047 = as_type<float>(_4685);
    float _5049 = as_type<float>(_4713);
    float _5051 = _4521;
    if (_3441)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5053 = -_3601;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3081);
    float _5057 = _5041 * _5043;
    float _5059 = float(_2957);
    float _5061 = -_3597;
    float _5063 = fma(_5061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2869);
    float _5065 = float(_5035);
    float _5067 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5069 = _5055 + _5067;
    float _5071 = _5057 * (-2.0);
    float _5073 = -_4231;
    float _5075 = fma(_5073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3283);
    float _5077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5079 = _5063 + _5077;
    float _5081 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5083 = _5065 * _5059;
    float _5085 = _1471 + (-0.5);
    float _5087 = fma(_5071, _5005, _5005);
    float _5089 = _1166 + _1481;
    float _5091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5093 = _5075 + _5091;
    float _5095 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5081);
    float _5097 = fma(_5085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5087);
    float _5099 = _5089 + (-1.0);
    float _5101 = _5083 * (-2.0);
    float _5103 = fma(_5093, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5095);
    float _5105 = _1166 + (-0.5);
    float _5107 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5109 = fma(_5101, _5007, _5007);
    float _5111 = fma(_3467, _5071, _3467);
    bool _5113 = _5103 >= 0.0;
    float _5115 = fma(_5107, _5101, _5107);
    float _5117 = fma(_5105, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5109);
    float _5119 = fma(_5111, _4511, _5097);
    int _5121 = abs(_5039);
    float _5123 = sqrt(_4293);
    float _5125 = fma(_5115, _4511, _5117);
    float _5127 = _5119 * 0.15915493667125701904296875;
    float _5129 = _1471 + _1481;
    float _5131 = _5125 * 0.15915493667125701904296875;
    float _5133 = float(_3339);
    float _5135 = _5101;
    float _5137 = _5083;
    if (_5113)
    {
        _5135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5139 = _5135;
    float _5141 = _5127 * 6.283185482025146484375;
    float _5143 = sin(_5141);
    float _5145 = float(_5121);
    int _5147 = as_type<int>(_5139);
    if (_5113)
    {
        out.m_53.x = 0.0;
    }
    if (_5113)
    {
        float _5149 = _5139 * 5.0;
        _5147 = as_type<int>(_5149);
    }
    int _5151 = _5147;
    float _5153 = _5145 * _5133;
    float _5155 = _5129 + (-1.0);
    float _5157 = _5127 * 6.283185482025146484375;
    float _5159 = cos(_5157);
    if (_5113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14265 = as_type<float>(_5151);
        out.gl_Position.z = _14265;
    }
    float _5161 = _5153 * (-2.0);
    float _5163 = _5131 * 6.283185482025146484375;
    float _5165 = sin(_5163);
    if (_5113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _5167 = -_3081;
    float _5169 = _5167 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5171 = -_2869;
    float _5173 = _5171 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5175 = fma(_5161, _5009, _5009);
    float _5177 = -_3283;
    float _5179 = _5177 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5181 = _5169 * _5169;
    float _5183 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5185 = _1481 + (-0.5);
    float _5187 = _5131 * 6.283185482025146484375;
    float _5189 = cos(_5187);
    float _5191 = fma(_5173, _5173, _5181);
    float _5193 = fma(_5183, _5161, _5183);
    float _5195 = fma(_5185, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5175);
    float _5197 = _3563 * _5123;
    float _5199 = fma(_5179, _5179, _5191);
    float _5201 = _5143 * _5165;
    float _5203 = fma(_5193, _4511, _5195);
    float _5205 = rsqrt(_5199);
    float _5207 = _5203 * 0.15915493667125701904296875;
    float _5209 = in.m_91.x;
    float _5211 = in.m_91.y;
    float _5213 = in.m_91.z;
    float _5215 = _5159 * _5189;
    float _5217 = _5143 * _5189;
    float _5219 = _5207 * 6.283185482025146484375;
    float _5221 = sin(_5219);
    float _5223 = _5173 * _5205;
    float _5225 = _5179 * _5205;
    float _5227 = _5169 * _5205;
    float _5229 = _5207 * 6.283185482025146484375;
    float _5231 = cos(_5229);
    float _5233 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5235 = _5223 * _5233;
    float _5237 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5239 = _5225 * _5237;
    float _5241 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5243 = _5227 * _5241;
    float _5245 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5247 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5249 = -_5235;
    float _5251 = fma(_5225, _5247, _5249);
    float _5253 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5255 = -_5239;
    float _5257 = fma(_5227, _5253, _5255);
    float _5259 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5261 = -_5243;
    float _5263 = fma(_5223, _5259, _5261);
    float _5265 = fma(_5221, _5215, _5201);
    float _5267 = _5251 * _5251;
    float _5269 = fma(_5221, _5201, _5215);
    float _5271 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5273 = fma(_5257, _5257, _5267);
    float _5275 = _5159 * _5165;
    float _5277 = _5197 * _5271;
    float _5279 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5281 = fma(_5263, _5263, _5273);
    float _5283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5211);
    float _5285 = _5159 * _5231;
    float _5287 = _5189 * _5231;
    float _5289 = rsqrt(_5281);
    float _5291 = _5283 * _5277;
    float _5293 = _5197 * _5245;
    float _5295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5209);
    float _5297 = _5143 * _5231;
    float _5299 = _5165 * _5231;
    float _5301 = _5197 * _5279;
    float _5303 = _5295 * _5293;
    float _5305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5213);
    float _5307 = _5285 * _5291;
    float _5309 = -_5275;
    float _5311 = fma(_5221, _5217, _5309);
    float _5313 = -_5217;
    float _5315 = fma(_5221, _5275, _5313);
    float _5317 = _5305 * _5301;
    float _5319 = fma(_5265, _5303, _5307);
    float _5321 = _5297 * _5291;
    float _5323 = _5257 * _5289;
    float _5325 = _5251 * _5289;
    float _5327 = _5263 * _5289;
    float _5329 = -_5291;
    float _5331 = _5221 * _5329;
    float _5333 = _5227 * _5323;
    float _5335 = _5225 * _5325;
    float _5337 = fma(_5315, _5317, _5319);
    float _5339 = fma(_5287, _5303, _5331);
    float _5341 = -_5333;
    float _5343 = fma(_5223, _5325, _5341);
    float _5345 = -_5335;
    float _5347 = fma(_5227, _5327, _5345);
    float _5349 = fma(_5311, _5303, _5321);
    float _5351 = fma(_5299, _5317, _5339);
    float _5353 = _5343 * _5337;
    float _5355 = _5347 * _5337;
    float _5357 = fma(_5269, _5317, _5349);
    float _5359 = fma(_5327, _5351, _5353);
    float _5361 = fma(_5323, _5351, _5355);
    float _5363 = fma(_5225, _5357, _5359);
    float _5365 = fma(_5223, _5357, _5361);
    float _5367 = _3283 + _5363;
    float _5369 = _2869 + _5365;
    float _5371 = _5223 * _5327;
    float _5373 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5375 = _5367 + _5373;
    float _5377 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5379 = _5369 + _5377;
    float _5381 = -_5371;
    float _5383 = fma(_5225, _5323, _5381);
    float _5385 = _5375 * _5375;
    float _5387 = _5379 * _5379;
    float _5389 = _5383 * _5337;
    float _5391 = _5387 + _5385;
    float _5393 = fma(_5325, _5351, _5389);
    float _5395 = sqrt(_5391);
    float _5397 = fma(_5227, _5357, _5393);
    float _5399 = _3081 + _5397;
    bool _5401 = _5395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5403 = _5369;
    float _5405 = _5367;
    float _5407 = _5387;
    float _5409 = _5385;
    if (!_5401)
    {
        _5045 = _5399;
    }
    float _5411 = _5045;
    bool _5413 = !_5401;
    float _5415 = _5411;
    if (!_5413)
    {
        float _5417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5421 = _5395 + _5419;
        float _5423 = rsqrt(_5391);
        float _5425 = _5421 * _5417;
        float _5427 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5429 = _5425 * 0.15915493667125701904296875;
        float _5431 = _5429 * 6.283185482025146484375;
        float _5433 = sin(_5431);
        float _5435 = _5429 * 6.283185482025146484375;
        float _5437 = cos(_5435);
        float _5439 = fma(_5433, _5427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5441 = _5423 * _5439;
        float _5443 = _5437 + (-1.0);
        float _5445 = fma(_5379, _5441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5447 = fma(_5375, _5441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5449 = _5443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5453 = _5445 + _5451;
        float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5457 = _5447 + _5455;
        float _5459 = fma(_5399, _5437, _5449);
        float _5461 = _5453 * _5453;
        float _5463 = _5457 * _5457;
        _5403 = _5445;
        _5405 = _5447;
        _5415 = _5459;
        _5407 = _5461;
        _5409 = _5463;
    }
    float _5465 = _5403;
    float _5467 = _5405;
    float _5469 = _5415;
    float _5471 = _5407;
    float _5473 = _5409;
    float _5475 = fma(_5465, 6.2500002968590706586837768554688e-05, 0.5);
    float _5477 = fma(_5467, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14758 = float2(_5475, _5477);
    float3 _5481 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14758, float2(0.0), isnan(_14758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14758, float2(0.0), isnan(_14758)), level(0.0)).xyz;
    float _5483 = _5481.x;
    float _5485 = _5481.y;
    float _5487 = _5481.z;
    float _5489 = in.m_93.x;
    float _5491 = in.m_93.y;
    float _5493 = in.m_93.z;
    bool _5495 = _5211 != 0.0;
    bool _5497 = isnan(_5211);
    bool _5499 = _5495 || _5497;
    bool _5501 = isnan(0.0);
    bool _5503 = _5499 || _5501;
    float _5505 = in.m_95.x;
    float _5507 = in.m_95.y;
    float _5509 = in.m_95.z;
    float _5511 = in.m_95.w;
    bool _5513 = _5209 == 0.0;
    bool _5515 = !_5503;
    bool _5517 = _5513 && _5515;
    bool _5519 = _5213 == 0.0;
    bool _5521 = _5519 && _5517;
    float _5523 = _5489;
    if (_5521)
    {
        _5137 = _5489;
    }
    float _5525 = _5137;
    float _5527 = _5525;
    if (_5521)
    {
        _2951 = _5493;
    }
    float _5529 = _2951;
    float _5531 = _5529;
    if (_5521)
    {
        _5047 = _5491;
    }
    float _5533 = _5047;
    float _5535 = _5533;
    if (_5521)
    {
        _5049 = _5525;
    }
    float _5537 = _5049;
    float _5539 = _5537;
    if (!_5521)
    {
        _5527 = _5489;
    }
    float _5541 = _5527;
    if (_5521)
    {
        _5051 = _5529;
    }
    float _5543 = _5051;
    float _5545 = _5543;
    if (!_5521)
    {
        _5531 = _5493;
    }
    float _5547 = _5531;
    if (!_5521)
    {
        float _5549 = fma(_5209, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5541);
        _5539 = _5549;
    }
    float _5551 = _5539;
    if (_5521)
    {
        _5523 = _5533;
    }
    float _5553 = _5523;
    float _5555 = _5509 * _5541;
    float _5557 = _5553;
    if (!_5521)
    {
        _5535 = _5491;
    }
    float _5559 = _5535;
    float _5561 = _5507 * _5547;
    if (!_5521)
    {
        float _5563 = fma(_5213, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5547);
        _5545 = _5563;
    }
    float _5565 = _5545;
    float _5567 = -_5555;
    float _5569 = fma(_5505, _5547, _5567);
    float _5571 = _5285 * _5383;
    float _5573 = _5505 * _5559;
    float _5575 = -_5561;
    float _5577 = fma(_5509, _5559, _5575);
    if (!_5521)
    {
        float _5579 = fma(_5211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5559);
        _5557 = _5579;
    }
    float _5581 = _5557;
    float _5583 = _5265 * _5347;
    float _5585 = -_5573;
    float _5587 = fma(_5507, _5541, _5585);
    float _5589 = _5265 * _5383;
    float _5591 = _5265 * _5343;
    float _5593 = _5285 * _5347;
    float _5595 = _5569 * _5511;
    float _5597 = _5577 * _5511;
    float _5599 = _5285 * _5343;
    float _5601 = _5587 * _5511;
    float _5603 = _5315 * _5347;
    float _5605 = _5315 * _5383;
    float _5607 = _5315 * _5343;
    float _5609 = fma(_5287, _5323, _5583);
    float _5611 = fma(_5287, _5325, _5589);
    float _5613 = -_5221;
    float _5615 = fma(_5613, _5325, _5571);
    float _5617 = fma(_5287, _5327, _5591);
    float _5619 = -_5221;
    float _5621 = fma(_5619, _5323, _5593);
    float _5623 = -_5221;
    float _5625 = fma(_5623, _5327, _5599);
    float _5627 = fma(_5299, _5323, _5603);
    float _5629 = fma(_5299, _5325, _5605);
    float _5631 = fma(_5299, _5327, _5607);
    float _5633 = fma(_5297, _5227, _5615);
    float _5635 = fma(_5311, _5223, _5609);
    float _5637 = fma(_5297, _5223, _5621);
    float _5639 = fma(_5297, _5225, _5625);
    float _5641 = fma(_5269, _5223, _5627);
    float _5643 = fma(_5269, _5227, _5629);
    float _5645 = fma(_5269, _5225, _5631);
    float _5647 = fma(_5311, _5227, _5611);
    float _5649 = _5633 * _5507;
    float _5651 = _5633 * _5581;
    float _5653 = fma(_5311, _5225, _5617);
    float _5655 = _5637 * _5581;
    float _5657 = _5595 * _5637;
    float _5659 = _5595 * _5633;
    float _5661 = _5639 * _5507;
    float _5663 = _5639 * _5581;
    float _5665 = _5595 * _5639;
    float _5667 = fma(_5647, _5505, _5649);
    float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5671 = _5469 + _5669;
    float _5673 = _5637 * _5507;
    float _5675 = fma(_5635, _5551, _5655);
    float _5677 = fma(_5653, _5505, _5661);
    float _5679 = fma(_5671, _5671, _5471);
    float _5681 = fma(_5635, _5505, _5673);
    float _5683 = fma(_5597, _5635, _5657);
    float _5685 = fma(_5647, _5551, _5651);
    float _5687 = _5679 + _5473;
    float _5689 = fma(_5653, _5551, _5663);
    float _5691 = fma(_5597, _5647, _5659);
    float _5693 = fma(_5597, _5653, _5665);
    float _5695 = fma(_5641, _5509, _5681);
    float _5697 = fma(_5643, _5509, _5667);
    float _5699 = sqrt(_5687);
    float _5701 = fma(_5645, _5509, _5677);
    float _5703 = fma(_5641, _5565, _5675);
    float _5705 = fma(_5601, _5641, _5683);
    float _5707 = fma(_5601, _5643, _5691);
    float _5709 = fma(_5601, _5645, _5693);
    float _5711 = fma(_5643, _5565, _5685);
    float _5713 = fma(_5645, _5565, _5689);
    out.m_97.x = _5695;
    out.m_97.y = _5697;
    out.m_97.z = _5701;
    out.m_99.x = _5705;
    out.m_99.y = _5707;
    out.m_99.z = _5709;
    out.m_101.x = _5703;
    out.m_101.y = _5711;
    out.m_101.z = _5713;
    bool _5715 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5717 = isnan(_5699);
    bool _5719 = _5715 || _5717;
    bool _5721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5723 = _5719 || _5721;
    float _5725 = _5601;
    if (!_5723)
    {
        _5725 = 1.0;
    }
    float _5727 = _5725;
    out.m_103.x = _5483;
    out.m_103.y = _5485;
    out.m_103.z = _5487;
    bool _5729 = !_5723;
    float _5731 = _5727;
    if (!_5729)
    {
        bool _5733 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5735 = isnan(_5699);
        bool _5737 = _5733 || _5735;
        bool _5739 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5741 = _5737 || _5739;
        if (!_5741)
        {
            float _5743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5745 = _5699 + _5743;
            float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5749 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5747;
            float _5751 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5753 = _5751 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5755 = 1.0 / _5749;
            float _5757 = _5745 * _5755;
            float _5759 = fma(_5757, _5753, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5731 = _5759;
            _5761 = true;
        }
        else
        {
            bool _5763 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5765 = isnan(_5699);
            bool _5767 = _5763 || _5765;
            bool _5769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5771 = _5767 || _5769;
            if (!_5771)
            {
                float _5773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5775 = _5699 + _5773;
                float _5777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5779 = _5777 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5781 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5783 = _5781 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5785 = 1.0 / _5779;
                float _5787 = _5775 * _5785;
                float _5789 = fma(_5787, _5783, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5731 = _5789;
                _5761 = true;
            }
            else
            {
                _5731 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5761 = false;
    float _5791 = _5731;
    float _5793 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5795 = _5469 + _5793;
    float _5797 = _5055 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5799 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5801 = _5465 + _5799;
    float _5803 = fma(_5795, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5805 = fma(_5063, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5797);
    float _5807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5809 = _5467 + _5807;
    float _5811 = fma(_5801, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5813 = -_3081;
    float _5815 = _5813 + _5803;
    float _5817 = fma(_5075, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5805);
    float _5819 = fma(_5809, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5821 = -_2869;
    float _5823 = _5821 + _5811;
    float _5825 = _5815 * _5815;
    float _5827 = _5817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5829 = _5055 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5831 = -_3283;
    float _5833 = _5831 + _5819;
    float _5835 = fma(_5823, _5823, _5825);
    float _5837 = 1.0 / _5827;
    float _5839 = fma(_5063, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5829);
    float _5841 = fma(_5833, _5833, _5835);
    float _5843 = fma(_5075, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5839);
    float _5845 = sqrt(_5841);
    float _5847 = _5843 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5849 = _5847 + _5827;
    float _5851 = _5849 * _5837;
    float _5853 = _5851 * 0.5;
    bool _5855 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5857 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5859 = _5855 || _5857;
    bool _5861 = isnan(0.5);
    bool _5863 = _5859 || _5861;
    float _5865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5867 = fma(_5853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5865);
    bool _5869 = _5845 > 0.0;
    float _5871 = 1.0 / _5867;
    bool _5873 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5875 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5877 = _5873 || _5875;
    bool _5879 = isnan(0.5);
    bool _5881 = _5877 || _5879;
    float _5883 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5885 = _5853;
    float _5887 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5889 = _5841;
    float _5891 = _5819;
    float _5893 = _5811;
    if (!_5869)
    {
        _5883 = _5811;
    }
    float _5895 = _5883;
    float _5897 = _5895;
    if (!_5869)
    {
        _5885 = _5803;
    }
    float _5899 = _5885;
    float _5901 = _5899;
    float _5903 = _5899;
    if (!_5869)
    {
        _5887 = _5819;
    }
    float _5905 = _5887;
    bool _5907 = !_5869;
    float _5909 = _5905;
    if (!_5907)
    {
        float _5911 = _230 * _230;
        float _5913 = rsqrt(_5841);
        float _5915 = fma(_226, _226, _5911);
        float _5917 = fma(_232, _232, _5915);
        float _5919 = sqrt(_5917);
        float _5921 = _5823 * _5913;
        float _5923 = _5815 * _5913;
        float _5925 = _5833 * _5913;
        bool _5927 = _5919 > 0.0;
        float _5929 = _5919;
        float _5931 = _5913;
        if (!_5927)
        {
            _5929 = _5811;
        }
        float _5933 = _5929;
        _5897 = _5933;
        if (!_5927)
        {
            _5901 = _5803;
        }
        float _5935 = _5901;
        _5903 = _5935;
        if (!_5927)
        {
            _5931 = _5819;
        }
        float _5937 = _5931;
        bool _5939 = !_5927;
        _5909 = _5937;
        if (!_5939)
        {
            float _5941 = rsqrt(_5917);
            float _5943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5945 = _230 * _5941;
            float _5947 = _226 * _5941;
            float _5949 = _232 * _5941;
            float _5951 = _5923 * _5945;
            float _5953 = fma(_5921, _5947, _5951);
            float _5955 = _5943 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5957 = fma(_5925, _5949, _5953);
            float _5959 = _5957 * _5955;
            float _5961 = fma(_226, _5959, _5811);
            float _5963 = fma(_230, _5959, _5803);
            float _5965 = fma(_232, _5959, _5819);
            _5903 = _5963;
            _5909 = _5965;
            _5897 = _5961;
            _5889 = _5943;
        }
    }
    float _5967 = _5903;
    float _5969 = _5909;
    float _5971 = _5897;
    float _5973 = _5889;
    float _5975 = -_3601;
    float _5977 = fma(_5975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5967);
    float _5979 = -_4231;
    float _5981 = fma(_5979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5969);
    float _5983 = -_3597;
    float _5985 = fma(_5983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5971);
    float _5987 = _5973;
    float _5989 = _5985;
    float _5991 = _5981;
    if (_5863)
    {
        _5987 = 1.0;
    }
    float _5993 = _5987;
    float _5995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5997 = _5871 * _5995;
    float _5999 = _5993;
    if (_5881)
    {
        _4507 = _5977;
    }
    float _6001 = _4507;
    float _6003 = _6001;
    if (!_5881)
    {
        float _6005 = _5069 * _5069;
        float _6007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6009 = -_3283;
        float _6011 = _6009 + _5969;
        float _6013 = -_3081;
        float _6015 = _6013 + _5967;
        float _6017 = fma(_5079, _5079, _6005);
        float _6019 = fma(_5093, _5093, _6017);
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6023 = sqrt(_6019);
        float _6025 = 1.0 / _5197;
        float _6027 = _6021 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6029 = precise::min(_6023, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6031 = _6029 * _6007;
        float _6033 = _6031 * _6025;
        float _6035 = -_2869;
        float _6037 = _6035 + _5971;
        float _6039 = _6027 * _6033;
        float _6041 = _6011 * _6033;
        float _6043 = fma(_6015, _6039, _5055);
        float _6045 = fma(_6037, _6039, _5063);
        float _6047 = fma(_6027, _6041, _5075);
        _6003 = _6043;
        _5989 = _6045;
        _5991 = _6047;
        _236 = _6007;
    }
    float _6049 = _6003;
    float _6051 = _5989;
    float _6053 = _5991;
    float _6055 = _236;
    float _6057 = _6055;
    if (!_5863)
    {
        float _6059 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6061 = _6059 * 0.15915493667125701904296875;
        float _6063 = _6061 * 6.283185482025146484375;
        float _6065 = cos(_6063);
        float _6067 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6069 = _6067 * 0.15915493667125701904296875;
        float _6071 = _6061 * 6.283185482025146484375;
        float _6073 = sin(_6071);
        float _6075 = 1.0 / _6065;
        float _6077 = _6069 * 6.283185482025146484375;
        float _6079 = cos(_6077);
        float _6081 = _6073 * _6075;
        float _6083 = _6069 * 6.283185482025146484375;
        float _6085 = sin(_6083);
        float _6087 = _6079 * _6081;
        float _6089 = 1.0 / _6087;
        float _6091 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6093 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6091;
        float _6095 = 1.0 / _6093;
        float _6097 = _6085 * _6089;
        float _6099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6101 = fma(_5997, _6097, _6099);
        float _6103 = _6101 * _6095;
        float _6105 = precise::clamp(_6103, 0.0, 1.0);
        _5999 = _6105;
    }
    float _6107 = _5999;
    float _6109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6111 = _6049 + _6109;
    float _6113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6115 = _6051 + _6113;
    float _6117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6119 = _6053 + _6117;
    float _6121 = _6111 * _6111;
    float _6123 = fma(_6115, _6115, _6121);
    float _6125 = fma(_6119, _6119, _6123);
    float _6127 = rsqrt(_6125);
    float _6129 = sqrt(_6125);
    float _6131 = _6127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6133 = _6115 * _6131;
    float _6135 = _6119 * _6131;
    float _6137 = _6133 * _6133;
    float _6139 = _6135 * _6135;
    float _6141 = _6137 + _6139;
    float _6143 = sqrt(_6141);
    bool _6145 = _6143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6149 = _6143 + _6147;
    float _6151 = _6127;
    float _6153 = _6141;
    float _6155 = _6149;
    float _6157 = _6111;
    if (_6145)
    {
        float _6159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6151 = _6159;
    }
    float _6161 = _6151;
    if (_6145)
    {
        float _6163 = rsqrt(_6141);
        _6153 = _6163;
    }
    float _6165 = _6153;
    float _6167 = _6165;
    if (_6145)
    {
        float _6169 = _6149 * _6161;
        _6155 = _6169;
    }
    float _6171 = _6155;
    if (_6145)
    {
        float _6173 = _6171 * 0.15915493667125701904296875;
        _5891 = _6173;
    }
    float _6175 = _5891;
    float _6177 = _6119;
    if (_6145)
    {
        float _6179 = _6175 * 6.283185482025146484375;
        float _6181 = sin(_6179);
        _6177 = _6181;
    }
    float _6183 = _6177;
    float _6185 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6187 = precise::max(0.0, _6185);
    float _6189 = _6161;
    if (_6145)
    {
        float _6191 = _6175 * 6.283185482025146484375;
        float _6193 = cos(_6191);
        _6189 = _6193;
    }
    float _6195 = _6189;
    float _6197 = -_6131;
    float _6199 = -_6187;
    float _6201 = fma(_6111, _6197, _6199);
    float _6203 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6145)
    {
        float _6205 = _6201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6157 = _6205;
    }
    float _6207 = _6157;
    float _6209 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6211 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6213 = _6207;
    float _6215 = _6183;
    if (_6145)
    {
        float _6217 = fma(_6183, _6207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6213 = _6217;
    }
    float _6219 = _6213;
    float _6221 = _6219;
    if (!_6145)
    {
        _6215 = _6133;
    }
    float _6223 = _6215;
    float _6225 = _6223;
    float _6227 = _6195;
    if (_6145)
    {
        float _6229 = _6195 + (-1.0);
        _6203 = _6229;
    }
    float _6231 = _6203;
    float _6233 = _6231;
    if (_6145)
    {
        float _6235 = _6165 * _6219;
        _5893 = _6235;
    }
    float _6237 = _5893;
    if (!_6145)
    {
        _6221 = _6201;
    }
    float _6239 = _6221;
    float _6241 = _6239;
    if (_6145)
    {
        float _6243 = _6231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6057 = _6243;
    }
    float _6245 = _6057;
    if (_6145)
    {
        float _6247 = _6133 * _6237;
        _6225 = _6247;
    }
    float _6249 = _6225;
    if (!_6145)
    {
        _6233 = _6135;
    }
    float _6251 = _6233;
    float _6253 = _6251;
    if (_6145)
    {
        float _6255 = _6135 * _6237;
        _6253 = _6255;
    }
    float _6257 = _6253;
    if (!_6145)
    {
        _6167 = _6137;
    }
    float _6259 = _6167;
    float _6261 = _6259;
    if (_6145)
    {
        float _6263 = fma(_6201, _6195, _6245);
        _6241 = _6263;
    }
    float _6265 = _6241;
    if (_6145)
    {
        float _6267 = _6249 * _6249;
        _6261 = _6267;
    }
    float _6269 = _6261;
    if (!_6145)
    {
        _6227 = _6139;
    }
    float _6271 = _6227;
    float _6273 = _6271;
    if (_6145)
    {
        float _6275 = _6257 * _6257;
        _6273 = _6275;
    }
    float _6277 = _6273;
    float _6279 = fma(_6265, _6265, _6269);
    float _6281 = floor(_6211);
    float _6283 = _6279 + _6277;
    float _6285 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6209);
    float _6287 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6289 = fma(_6129, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6287);
    float _6291 = precise::clamp(_6289, 0.0, 1.0);
    float _6293 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6285);
    float _6295 = rsqrt(_6283);
    float _6297 = -_6291;
    float _6299 = _6297 + 1.0;
    float _6301 = _6293 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6303 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6305 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6307 = _6301 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6309 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6311 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6313 = abs(_6299);
    float _6315 = log2(_6313);
    float _6317 = -_6307;
    float _6319 = fma(_6317, _6303, 1.0);
    float _6321 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6323 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6305);
    float _6325 = -_6281;
    float _6327 = _6211 + _6325;
    float _6329 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6321);
    float _6331 = _6295 * _6249;
    float _6333 = floor(_6309);
    float _6335 = _6295 * _6265;
    float _6337 = _6295 * _6257;
    float _6339 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6311);
    float _6341 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6329);
    float _6343 = _6331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6345 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6323);
    float _6347 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6339);
    float _6349 = _6341 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6351 = -_6343;
    float _6353 = fma(_6335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6351);
    float _6355 = _6315 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6357 = _6347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6359 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6361 = -_6337;
    float _6363 = fma(_6361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6353);
    float _6365 = _6345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6367 = exp2(_6355);
    float _6369 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6359);
    float _6371 = fma(_6363, -0.5, 0.5);
    float _6373 = fma(_6363, 0.5, 0.5);
    float _6375 = -_6333;
    float _6377 = _6309 + _6375;
    float _6379 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6369);
    float _6381 = fma(_6373, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6383 = log2(_6319);
    float _6385 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6379);
    float _6387 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6389 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6391 = fma(_6373, _6381, -0.212114393711090087890625);
    float _6393 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6387);
    float _6395 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6389);
    float _6397 = sqrt(_6371);
    float _6399 = fma(_6373, _6391, 1.570728778839111328125);
    float _6401 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6393);
    float _6403 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6395);
    float _6405 = 1.0 / _6385;
    float _6407 = _6335 + 1.0;
    float _6409 = _6383 * 0.693147182464599609375;
    float _6411 = -_6335;
    float _6413 = fma(_6367, _6407, _6411);
    float _6415 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6401);
    float _6417 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6403);
    float _6419 = _6397 * 0.636619746685028076171875;
    float _6421 = fma(_6413, 0.5, 0.5);
    float _6423 = -_6399;
    float _6425 = fma(_6419, _6423, 1.0);
    float _6427 = _6409 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16334 = float2(_6327, _6377);
    float _6429 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16334, float2(0.0), isnan(_16334)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16334, float2(0.0), isnan(_16334)), level(0.0)).x;
    float _6431 = _6415 * _6405;
    float _6433 = _6417 * _6405;
    float _6435 = fma(_6431, 0.5, 0.5);
    float _6437 = fma(_6433, -0.5, 0.5);
    float3 _16353 = float3(_6435, _6437, _6427);
    float _6439 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16353, float3(0.0), isnan(_16353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16353, float3(0.0), isnan(_16353)), level(0.0)).x;
    float3 _16364 = float3(_6435, _6437, _6427);
    float4 _6442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16364, float3(0.0), isnan(_16364)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16364, float3(0.0), isnan(_16364)), level(0.0)).xyzw;
    float _6444 = _6442.x;
    float _6446 = _6442.y;
    float _6448 = _6442.z;
    float _6450 = _6442.w;
    float2 _16380 = float2(_6425, _6421);
    float3 _6452 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16380, float2(0.0), isnan(_16380)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16380, float2(0.0), isnan(_16380)), level(0.0)).xyz;
    float _6454 = _6452.x;
    float _6456 = _6452.y;
    float _6458 = _6452.z;
    float _6460 = abs(_5997);
    float _6462 = log2(_6460);
    float _6464 = _6315 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6466 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6468 = isnan(_6129);
    bool _6470 = _6466 || _6468;
    bool _6472 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6474 = _6470 || _6472;
    float _6476 = exp2(_6464);
    float _6478 = _6462 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6480 = exp2(_6478);
    float _6482 = in.m_105.x;
    float _6484 = -_6476;
    float _6486 = _6484 + 1.0;
    float _6488 = _6486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6490 = fma(_6480, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6492 = precise::clamp(_6490, 0.0, 1.0);
    float _6494 = fma(_6492, -2.0, 3.0);
    float _6496 = _6492 * _6492;
    float _6498 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6500 = _6496 * _6494;
    float _6502 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6498);
    float _6504 = -_6500;
    float _6506 = _6504 + 1.0;
    float _6508 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6502);
    float _6510 = fma(_6506, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6500);
    bool _6512 = _5997 <= 8000.0;
    bool _6514 = isnan(_5997);
    bool _6516 = _6512 || _6514;
    bool _6518 = isnan(8000.0);
    bool _6520 = _6516 || _6518;
    float _6522 = float(_6520);
    float _6524 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6508);
    float _6526 = _6385 * 0.5;
    float _6528 = _6415 + _6385;
    float _6530 = _6522 * _6510;
    float _6532 = fma(_6417, -0.5, _6526);
    out.gl_Position.x = _6415;
    out.gl_Position.y = _6417;
    out.gl_Position.z = _6524;
    out.gl_Position.w = _6385;
    float _6534 = _6524 + _6385;
    float _6536 = _6530 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6538 = _6528 * 0.5;
    float _6540 = _6534 * 0.5;
    out.m_107.x = _6538;
    out.m_107.y = _6532;
    out.m_107.z = _6540;
    out.m_107.w = _6385;
    float _6542 = -_6488;
    float _6544 = _6542 + 1.0;
    float _6546 = _6385;
    float _6548 = _6524;
    float _6550 = _6417;
    float _6552 = _6532;
    float _6554 = _6538;
    float _6556 = _6544;
    if (!_6474)
    {
        _6546 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6558 = _6546;
    float _6560 = _6558;
    float _6562 = _6558;
    if (!_6474)
    {
        _6548 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6564 = _6548;
    float _6566 = _6564;
    float _6568 = _6564;
    if (!_6474)
    {
        _6550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6570 = _6550;
    float _6572 = _6107 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6574 = _6570;
    float _6576 = _6570;
    if (!_6474)
    {
        _6552 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6578 = _6552;
    float _6580 = _6578;
    float _6582 = _6578;
    if (!_6474)
    {
        _6554 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6584 = _6554;
    float _6586 = -_6429;
    float _6588 = _6586 + 1.0;
    float _6590 = _6588 * _6536;
    float _6592 = precise::clamp(_6590, 0.0, 1.0);
    float _6594 = -_6592;
    float _6596 = fma(_6594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6598 = _6488 * _6439;
    float _6600 = _6596 * _6482;
    float _6602 = _6450 * _6598;
    float _6604 = _6458 * _6598;
    float _6606 = _6600 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6608 = fma(_6454, _6602, _6444);
    float _6610 = fma(_6456, _6602, _6446);
    float _6612 = _6450 * _6544;
    float _6614 = fma(_6450, _6604, _6448);
    out.m_109.x = _6606;
    float _6616 = _6584;
    float _6618 = _6584;
    if (!_6474)
    {
        _6556 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6620 = _6556;
    out.m_111.x = _6608;
    out.m_111.y = _6610;
    out.m_111.z = _6614;
    out.m_111.w = _6612;
    bool _6622 = !_6474;
    float _6624 = _6620;
    float _6626 = _6620;
    if (!_6622)
    {
        bool _6628 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6630 = isnan(_6129);
        bool _6632 = _6628 || _6630;
        bool _6634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6636 = _6632 || _6634;
        if (!_6636)
        {
            float _6638 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6640 = _6129 + _6638;
            float _6642 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6644 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6642;
            float _6646 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6648 = _6646 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6650 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6652 = _6650 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6654 = 1.0 / _6644;
            float _6656 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6658 = _6656 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6660 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6662 = _6660 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6664 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6666 = _6664 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6668 = _6640 * _6654;
            float _6670 = precise::clamp(_6668, 0.0, 1.0);
            float _6672 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6674 = _6672 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6676 = fma(_6670, _6648, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6678 = fma(_6670, _6652, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6680 = fma(_6670, _6674, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6682 = fma(_6670, _6658, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6684 = fma(_6670, _6662, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6686 = fma(_6670, _6666, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6576 = _6676;
            _6618 = _6684;
            _6568 = _6678;
            _6582 = _6682;
            _6626 = _6680;
            _6562 = _6686;
            _6688 = true;
        }
        else
        {
            bool _6690 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6692 = isnan(_6129);
            bool _6694 = _6690 || _6692;
            bool _6696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6698 = _6694 || _6696;
            if (!_6698)
            {
                _6580 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6700 = _6580;
            _6582 = _6700;
            if (!_6698)
            {
                _6616 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6702 = _6616;
            _6618 = _6702;
            if (!_6698)
            {
                _6560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6704 = _6560;
            _6562 = _6704;
            if (!_6698)
            {
                _6566 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6706 = _6566;
            _6568 = _6706;
            if (!_6698)
            {
                _6574 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6708 = _6574;
            _6576 = _6708;
            if (!_6698)
            {
                _6624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6710 = _6624;
            bool _6712 = !_6698;
            _6626 = _6710;
            if (!_6712)
            {
                bool _6714 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6716 = isnan(_6129);
                bool _6718 = _6714 || _6716;
                bool _6720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6722 = _6718 || _6720;
                if (!_6722)
                {
                    float _6724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6726 = _6129 + _6724;
                    float _6728 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6730 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6728;
                    float _6732 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6734 = _6732 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6738 = _6736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6740 = 1.0 / _6730;
                    float _6742 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6744 = _6742 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6746 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6748 = _6746 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6750 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6752 = _6750 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6754 = _6726 * _6740;
                    float _6756 = precise::clamp(_6754, 0.0, 1.0);
                    float _6758 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6760 = _6758 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6762 = fma(_6756, _6734, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6764 = fma(_6756, _6738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6766 = fma(_6756, _6760, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6768 = fma(_6756, _6744, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6770 = fma(_6756, _6748, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6772 = fma(_6756, _6752, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6576 = _6762;
                    _6618 = _6770;
                    _6568 = _6764;
                    _6582 = _6768;
                    _6626 = _6766;
                    _6562 = _6772;
                    _6688 = true;
                }
                else
                {
                    _6576 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6618 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6568 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6582 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6688 = false;
    float _6774 = _6576;
    float _6776 = _6618;
    float _6778 = _6568;
    float _6780 = _6582;
    float _6782 = _6626;
    float _6784 = _6562;
    float _6786 = _6572 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6788 = fma(_5711, -0.5, 0.5);
    float _6790 = precise::clamp(_6788, 0.0, 1.0);
    float _6792 = -_6774;
    float _6794 = _6776 + _6792;
    float _6796 = -_6778;
    float _6798 = _6780 + _6796;
    out.m_53.x = _6786;
    float _6800 = fma(_6790, _6794, _6774);
    float _6802 = -_6782;
    float _6804 = _6784 + _6802;
    float _6806 = fma(_6790, _6798, _6778);
    float _6808 = _6800 * 0.586610972881317138671875;
    bool _6810 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6812 = fma(_6790, _6804, _6782);
    out.m_113.x = 0.0;
    float _6814 = fma(_6806, 0.298911988735198974609375, _6808);
    bool _6816 = _6107 > 0.0;
    bool _6818 = isnan(_6107);
    bool _6820 = _6816 || _6818;
    bool _6822 = isnan(0.0);
    bool _6824 = _6820 || _6822;
    float _6826 = fma(_6812, 0.114477999508380889892578125, _6814);
    float _6828 = -_6826;
    float _6830 = _6806 + _6828;
    float _6832 = -_6826;
    float _6834 = _6800 + _6832;
    float _6836 = -_6826;
    float _6838 = _6812 + _6836;
    float _6840 = fma(_6830, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    float _6842 = fma(_6834, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    float _6844 = fma(_6838, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    bool _6846 = !_6810;
    if (!_6846)
    {
        float _6848 = -_6049;
        float _6850 = _6848 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6852 = -_6051;
        float _6854 = _6852 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6856 = -_6053;
        float _6858 = _6856 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6860 = _6850 * _6850;
        float _6862 = fma(_6854, _6854, _6860);
        float _6864 = fma(_6858, _6858, _6862);
        float _6866 = sqrt(_6864);
        float _6868 = rsqrt(_6864);
        float _6870 = -_6866;
        float _6872 = _6870 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6874 = _6872 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6876 = precise::clamp(_6874, 0.0, 1.0);
        float _6878 = _6854 * _6868;
        float _6880 = _6850 * _6868;
        float _6882 = abs(_6876);
        float _6884 = log2(_6882);
        float _6886 = _6858 * _6868;
        float _6888 = _6878 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6890 = _5711 * _6880;
        float _6892 = -_6880;
        float _6894 = -_6888;
        float _6896 = fma(_6892, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6894);
        float _6898 = fma(_5703, _6878, _6890);
        float _6900 = -_6886;
        float _6902 = fma(_6900, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6896);
        float _6904 = fma(_5713, _6886, _6898);
        float _6906 = precise::clamp(_6904, 0.0, 1.0);
        float _6908 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6910 = _6902 + _6908;
        float _6912 = _6884 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6914 = _6910 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6916 = precise::clamp(_6914, 0.0, 1.0);
        float _6918 = exp2(_6912);
        float _6920 = _6918 * _6916;
        float _6922 = _6906 * _6920;
        float _6924 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6926 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6928 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6924;
        out.m_113.y = _6926;
        out.m_113.z = _6928;
    }
    out.m_115.x = _6840;
    out.m_115.y = _6842;
    out.m_115.z = _6844;
    if (_6824)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _6930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6930;
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
    bool _6688 = false;
    bool _5761 = false;
    bool _1152 = false;
    bool _828 = false;
    bool _686 = false;
    bool _532 = false;
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
        float _6987 = as_type<float>(_150);
        out.gl_Position.z = _6987;
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
        float _7057 = as_type<float>(_188);
        out.gl_Position.z = _7057;
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
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _264 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _264 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = 1.0 / _280;
    float _296 = 1.0 / _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _300 = _264 + _298;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 1.0 / _284;
    float _306 = _268 * _294;
    bool _308 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _310 = isnan(_264);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = fma(_322, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = 1.0 / _288;
    float _328 = _300 * _296;
    float _330 = -_318;
    float _332 = _330 + 1.0;
    float _334 = _272 * _304;
    bool _336 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_264);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    bool _352 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_264);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _346 * _332;
    float _366 = -_346;
    float _368 = _366 + 1.0;
    float _370 = _276 * _326;
    bool _372 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_264);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_362;
    float _386 = _384 + 1.0;
    float _388 = _362 * _368;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _394 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_264);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _382 * _386;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _408;
    float _412 = -_382;
    float _414 = _412 + 1.0;
    float _416 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = _404 * _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = -_404;
    float _432 = _430 + 1.0;
    float _434 = _422 * _424;
    float _436 = _324 * _424;
    float _438 = _416 * _424;
    float _440 = fma(_420, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _442 = fma(_428, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _444 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_440, _406, _446);
    float _466 = fma(_442, _406, _448);
    float _468 = fma(_444, _406, _450);
    float _470 = fma(_454, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_458, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_462, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_470, _388, _464);
    float _490 = fma(_478, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_486, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = fma(_472, _388, _466);
    float _498 = fma(_474, _388, _468);
    float _500 = fma(_490, _364, _488);
    float _502 = fma(_492, _364, _496);
    float _504 = fma(_494, _364, _498);
    float _506 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].x, _500);
    float _508 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].y, _502);
    float _510 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].z, _504);
    bool _512 = !_302;
    float _530;
    if (!_512)
    {
        float _514 = in.m_65.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_134);
        float _536 = 1.0 / _534;
        float _538 = _168 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _540 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = isnan(_540);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_540);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _578;
    bool _582 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_540);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _548;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _540 + _600;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _576 * _598;
    float _608 = -_576;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _564;
    float _614 = _580 * _594;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _544, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = -_592;
    float _624 = _622 + 1.0;
    float _626 = _618 * _612;
    float _628 = _620 * _606;
    float _630 = _560 * _624;
    float _632 = fma(_626, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _636 = fma(_632, _630, _634);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _646 = in.m_67.x;
    float _648 = in.m_67.y;
    float _650 = in.m_67.z;
    float _652 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _652;
    out.m_69.y = _654;
    out.m_69.z = _656;
    out.m_69.w = _658;
    float _660 = _510 * _650;
    float _662 = _508 * _648;
    float _664 = _506 * _646;
    bool _666 = !_604;
    float _684;
    if (!_666)
    {
        float _668 = in.m_65.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _684 = _682;
        _686 = true;
    }
    else
    {
        float _688 = float(_134);
        float _690 = 1.0 / _688;
        float _692 = _168 * _690;
        _684 = _692;
    }
    _686 = false;
    float _694 = _684;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _698 = _694 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _704 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _706 = isnan(_694);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _720 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _722 = isnan(_694);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _732;
    bool _736 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _738 = isnan(_694);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = 1.0 / _702;
    float _750 = -_714;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _756 = _694 + _754;
    bool _758 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _760 = _730 * _752;
    float _762 = -_730;
    float _764 = _762 + 1.0;
    float _766 = 1.0 / _718;
    float _768 = _734 * _748;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _774 = fma(_768, _698, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _776 = -_746;
    float _778 = _776 + 1.0;
    float _780 = _772 * _766;
    float _782 = _774 * _760;
    float _784 = _714 * _778;
    float _786 = fma(_780, _756, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _790 = fma(_786, _784, _788);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _798 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[133].x, _790);
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _800;
    out.m_71.y = _802;
    out.m_71.z = _804;
    out.m_71.w = _806;
    bool _808 = !_758;
    float _826;
    if (!_808)
    {
        float _810 = in.m_65.x;
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _814 = _810 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_134);
        float _832 = 1.0 / _830;
        float _834 = _168 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _840 = _836 + _838;
    bool _842 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _844 = isnan(_836);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _858;
    bool _862 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _864 = isnan(_836);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_852;
    float _876 = _874 + 1.0;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = 1.0 / _856;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _896 = _872 * _876;
    float _898 = -_888;
    float _900 = _898 + 1.0;
    float _902 = 1.0 / _894;
    bool _904 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _906 = _860 * _890;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    bool _912 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _914 = isnan(_836);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = fma(_906, _840, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _926 = _888 * _910;
    bool _928 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _930 = isnan(_836);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _922 * _900;
    float _942 = -_922;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _950 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _952 = isnan(_836);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _938 * _944;
    float _964 = -_938;
    float _966 = _964 + 1.0;
    bool _968 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _970 = isnan(_836);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _948;
    float _982 = -_960;
    float _984 = _982 + 1.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _960 * _966;
    float _992 = _978 * _984;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _998 = -_978;
    float _1000 = _998 + 1.0;
    float _1002 = 1.0 / _988;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1008 = _924 * _992;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _836 + _1014;
    float _1018 = _1006 * _902;
    float _1020 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1008);
    float _1022 = 1.0 / _996;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1024;
    float _1028 = fma(_1018, _1016, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1036 = _836 + _1034;
    float _1038 = _1026 * _980;
    float _1040 = fma(_1028, _990, _1020);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1044 = _836 + _1042;
    float _1046 = 1.0 / _1012;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1052 = fma(_1038, _1036, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1054 = _1050 * _1002;
    bool _1056 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1058 = isnan(_836);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1068;
    float _1072 = 1.0 / _1032;
    float _1074 = fma(_1052, _962, _1040);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1080 = _1070 * _1022;
    float _1082 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1086 = _836 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1090 = _836 + _1088;
    float _1092 = _1078 * _1046;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1094;
    float _1098 = fma(_1080, _1086, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1100 = fma(_1082, _940, _1074);
    float _1102 = fma(_1092, _1090, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1104 = -_1066;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1110 = _836 + _1108;
    float _1112 = fma(_1098, _926, _1100);
    float _1114 = _1096 * _1072;
    float _1116 = _852 * _1106;
    float _1118 = fma(_1102, _896, _1112);
    float _1120 = fma(_1114, _1110, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1122 = fma(_1120, _1116, _1118);
    float _1124 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1122);
    out.m_73.x = _1124;
    bool _1126 = !_904;
    float _1128 = _1040;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1132 = as_type<int>(_1072);
    float _1150;
    if (!_1126)
    {
        float _1134 = in.m_65.x;
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1138 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1142 = _1140 * _1136;
        float _1144 = floor(_1142);
        float _1146 = -_1144;
        float _1148 = _1142 + _1146;
        _1150 = _1148;
        _1152 = true;
    }
    else
    {
        float _1154 = float(_134);
        float _1156 = 1.0 / _1154;
        float _1158 = _168 * _1156;
        _1150 = _1158;
    }
    _1152 = false;
    float _1160 = _1150;
    float _1162 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1164 = int(_1162);
    float _1166 = in.m_65.y;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = in.m_75.x;
    float _1174 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1176 = int(_1174);
    float _1178 = 0.0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1170)
    {
        _1178 = 1.0;
    }
    float _1182 = _1178;
    float _1184 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1186 = int(_1184);
    float _1188 = float(_1164);
    float _1190 = 0.0;
    float _1192 = _1182;
    if (_1170)
    {
        _1190 = 1.0;
    }
    float _1194 = _1190;
    float _1196 = 0.0;
    float _1198 = _1194;
    if (_1170)
    {
        _1196 = 1.0;
    }
    float _1200 = _1196;
    int _1202 = 0;
    float _1204 = _1200;
    if (_1170)
    {
        _1202 = 0;
    }
    int _1206 = _1202;
    int _1208 = _1206;
    if (_1170)
    {
        float _1210 = in.m_65.x;
        _1128 = _1210;
    }
    float _1212 = _1128;
    float _1214 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1216 = int(_1214);
    float _1218 = float(_1176);
    float _1220 = _1212;
    if (_1170)
    {
        _1180 = 0;
    }
    int _1222 = _1180;
    float _1224 = _1116;
    int _1226 = _1222;
    if (_1170)
    {
        float _1228 = in.m_65.z;
        _1224 = _1228;
    }
    float _1230 = _1224;
    int _1232 = 0;
    if (_1170)
    {
        _1232 = as_type<int>(_1166);
    }
    int _1234 = _1232;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1238 = int(_1236);
    float _1240 = float(_1186);
    float _1242 = 1.0 / _1188;
    float _1244 = float(_1216);
    float _1246 = 1.0 / _1218;
    float _1248 = float(uint(_1238));
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1252 = int(_1250);
    float _1254 = _1242 * _168;
    float _1256 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1258 = int(_1256);
    float _1260 = _1246 * _168;
    float _1262 = 1.0 / _1240;
    float _1264 = float(uint(_1252));
    float _1266 = 1.0 / _1244;
    float _1268 = float(uint(_1258));
    float _1270 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1272 = int(_1270);
    float _1274 = _1262 * _168;
    float _1276 = 1.0 / _1248;
    float _1278 = _1266 * _168;
    float _1280 = trunc(_1254);
    int _1282 = int(_1280);
    float _1284 = float(uint(_1272));
    float _1286 = 1.0 / _1264;
    int _1288 = as_type<int>(_1276) + (-2);
    float _1290 = trunc(_1260);
    int _1292 = int(_1290);
    float _1294 = float(uint(_1282));
    float _1296 = as_type<float>(_1288) * _1294;
    float _1298 = 1.0 / _1268;
    int _1300 = as_type<int>(_1286) + (-2);
    float _1302 = trunc(_1274);
    int _1304 = int(_1302);
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1308 = _1306 != 0;
    float _1310 = 1.0 / _1284;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1318 = _1316 != 0;
    bool _1320 = _1166 > 0.5;
    int _1322 = as_type<int>(_1298) + (-2);
    float _1324 = trunc(_1278);
    int _1326 = int(_1324);
    float _1328 = float(uint(_1304));
    int _1330 = _1234;
    bool _1332 = _1314;
    bool _1334 = _1318;
    float _1336 = _1172;
    if (!_1308)
    {
        _1130 = _1172;
    }
    float _1338 = _1130;
    float _1340 = as_type<float>(_1322) * _1328;
    int _1342 = as_type<int>(_1340);
    float _1344 = _1338;
    if (_1314)
    {
        float _1346 = -_1172;
        float _1348 = _1346 + 1.0;
        _1132 = as_type<int>(_1348);
    }
    int _1350 = _1132;
    float _1352 = trunc(_1296);
    float _1354 = precise::max(_1352, 0.0);
    uint _1357 = uint(_1354);
    int _1359 = as_type<int>(_1310) + (-2);
    float _1361 = 0.0;
    if (!_1318)
    {
        _1361 = _1172;
    }
    float _1363 = _1361;
    float _1365 = 0.0;
    float _1367 = _1363;
    if (!_1314)
    {
        _1365 = _1172;
    }
    float _1369 = _1365;
    float _1371 = _1369;
    if (_1314)
    {
        float _1373 = _1320 ? as_type<float>(_1350) : _1172;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = trunc(_1340);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    float _1383 = float(uint(_1292));
    float _1385 = float(uint(_1326));
    float _1387 = as_type<float>(_1300) * _1383;
    float _1389 = _1383;
    if (_1318)
    {
        float _1391 = -_1172;
        float _1393 = _1391 + 1.0;
        _1342 = as_type<int>(_1393);
    }
    int _1395 = _1342;
    float _1397 = as_type<float>(_1359) * _1385;
    float _1399 = trunc(_1387);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    int _1405 = _1395;
    float _1407 = _1397;
    if (_1318)
    {
        float _1409 = _1320 ? as_type<float>(_1395) : _1172;
        _1367 = _1409;
    }
    float _1411 = _1367;
    float _1413 = _1230;
    if (_1170)
    {
        _1405 = as_type<int>(_1230);
    }
    int _1415 = _1405;
    float _1417 = trunc(_1397);
    float _1419 = precise::max(_1417, 0.0);
    uint _1421 = uint(_1419);
    int _1423 = _1415;
    if (_1170)
    {
        _1407 = _1212;
    }
    float _1425 = _1407;
    float _1427 = _1425;
    if (_1170)
    {
        _1389 = _1425;
    }
    float _1429 = _1389;
    int _1431 = 0;
    float _1433 = _1429;
    if (_1170)
    {
        _1431 = as_type<int>(_1425);
    }
    int _1435 = _1431;
    int _1437 = _1435;
    if (!_1170)
    {
        float _1439 = in.m_65.x;
        float _1441 = _1166 * 3.1415927410125732421875;
        float _1443 = in.m_65.z;
        float _1445 = _1441 * 0.15915493667125701904296875;
        float _1447 = _1445 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1439 * 3.1415927410125732421875;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = _1443 * 3.1415927410125732421875;
        float _1457 = _1455 * 0.15915493667125701904296875;
        float _1459 = _1453 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = _1457 * 6.283185482025146484375;
        float _1465 = sin(_1463);
        _1427 = _1166;
        _1198 = 1.2345600128173828125;
        _1220 = _1439;
        _1192 = 7.345489978790283203125;
        _1433 = _1443;
        _1204 = 5.839270114898681640625;
        _1208 = 1;
        _1413 = _1443;
        _1226 = 2;
        _1423 = as_type<int>(_1465);
        _1330 = as_type<int>(_1449);
        _1437 = as_type<int>(_1461);
    }
    float _1467 = _1427;
    float _1469 = _1198;
    float _1471 = _1220;
    float _1473 = _1192;
    float _1475 = _1433;
    float _1477 = _1204;
    int _1479 = _1208;
    float _1481 = _1413;
    int _1483 = _1226;
    int _1485 = _1423;
    int _1487 = _1330;
    int _1489 = _1437;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1493 = _1491 != 0;
    int _1495 = 0;
    if (_1308)
    {
        float _1497 = in.m_65.x;
        _1495 = as_type<int>(_1497);
    }
    int _1499 = _1495;
    int _1501 = ~_1238;
    int _1503 = _1501 + 1;
    float _1505 = _1467 * _1469;
    int _1507 = ~_1258;
    int _1509 = _1507 + 1;
    float _1511 = _1471 * _1473;
    int _1513 = ~_1272;
    int _1515 = _1513 + 1;
    int _1517 = _1503 * int(_1357);
    int _1519 = _1517 + _1282;
    float _1521 = floor(_1505);
    float _1523 = _1475 * _1477;
    float _1525 = _1467 * _1473;
    int _1527 = _1515 * int(_1421);
    int _1529 = _1527 + _1326;
    float _1531 = float(uint(_1519));
    float _1533 = _896;
    if (_1493)
    {
        float _1535 = in.m_65.z;
        _1533 = _1535;
    }
    float _1537 = _1533;
    int _1539 = _1509 * int(_1381);
    int _1541 = _1539 + _1304;
    int _1543 = ~_1252;
    int _1545 = _1543 + 1;
    float _1547 = floor(_1511);
    float _1549 = as_type<float>(_1288) * _1531;
    float _1551 = float(uint(_1529));
    bool _1553 = _1479 != 1;
    float _1555 = float(uint(_1541));
    float _1557 = in.m_61.w;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1561 = _1559 != 0;
    float _1563 = as_type<float>(_1359) * _1551;
    float _1565 = trunc(_1549);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = _1499;
    float _1573 = _1549;
    if (_1308)
    {
        bool _1575 = as_type<float>(_1499) > 0.5;
        _1332 = _1575;
    }
    bool _1577 = _1332;
    if (_1493)
    {
        float _1579 = -_1172;
        float _1581 = _1579 + 1.0;
        _1571 = as_type<int>(_1581);
    }
    int _1583 = _1571;
    float _1585 = as_type<float>(_1322) * _1555;
    int _1587 = _1545 * int(_1403);
    int _1589 = _1587 + _1292;
    int _1591 = ~_1272;
    int _1593 = _1591 + 1;
    float _1595 = in.m_59.w;
    float _1597 = floor(_1523);
    int _1599 = _1589;
    float _1601 = _1585;
    if (!_1493)
    {
        _1573 = _1172;
    }
    float _1603 = _1573;
    float _1605 = -_1547;
    float _1607 = _1511 + _1605;
    float _1609 = float(uint(_1589));
    float _1611 = _1603;
    if (_1308)
    {
        float _1613 = -_1172;
        float _1615 = _1613 + 1.0;
        _1599 = as_type<int>(_1615);
    }
    int _1617 = _1599;
    if (_1493)
    {
        bool _1619 = _1537 > 0.5;
        _1334 = _1619;
    }
    bool _1621 = _1334;
    int _1623 = 0;
    if (_1561)
    {
        float _1625 = -_1172;
        float _1627 = _1625 + 1.0;
        _1623 = as_type<int>(_1627);
    }
    int _1629 = _1623;
    float _1631 = float(_1272);
    float _1633 = floor(_1525);
    if (_1493)
    {
        float _1635 = _1621 ? as_type<float>(_1583) : _1172;
        _1611 = _1635;
    }
    float _1637 = _1611;
    float _1639 = -_1521;
    float _1641 = _1505 + _1639;
    float _1643 = float(_134);
    float _1645 = as_type<float>(_1300) * _1609;
    if (_1308)
    {
        float _1647 = _1577 ? as_type<float>(_1617) : _1172;
        _1344 = _1647;
    }
    float _1649 = _1344;
    float _1651 = in.m_63.w;
    float _1653 = float(_1238);
    float _1655 = trunc(_1563);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = float(_1282);
    float _1663 = float(_1258);
    int _1665 = ~_1258;
    int _1667 = _1665 + 1;
    float _1669 = trunc(_1585);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = int(_1357) + int(_1569);
    float _1677 = -_1633;
    float _1679 = _1525 + _1677;
    float _1681 = _1607 * _1653;
    float _1683 = float(_1326);
    float _1685 = _1663 * _1641;
    float _1687 = float(_1292);
    float _1689 = 1.0 / _1643;
    if (!_1561)
    {
        _1601 = _1172;
    }
    float _1691 = _1601;
    float _1693 = _1691;
    if (_1561)
    {
        float _1695 = _1320 ? as_type<float>(_1629) : _1172;
        _1693 = _1695;
    }
    float _1697 = _1693;
    float _1699 = -_1597;
    float _1701 = _1523 + _1699;
    bool _1703 = _1661 >= _1653;
    bool _1705 = isnan(_1661);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan(_1653);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = _1653 * _168;
    float _1717 = float(_1304);
    float _1719 = trunc(_1645);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = float(_1252);
    float _1727 = _1631 * _1701;
    bool _1729 = _1717 >= _1663;
    bool _1731 = isnan(_1717);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(_1663);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    bool _1741 = _1683 >= _1631;
    bool _1743 = isnan(_1683);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(_1631);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    int _1753 = int(_1421) + int(_1659);
    float _1755 = _1715 * _1689;
    int _1757 = int(_1381) + int(_1673);
    float _1759 = _1689 * _168;
    int _1761 = ~_1238;
    int _1763 = _1761 + 1;
    float _1765 = trunc(_1713);
    int _1767 = int(_1765);
    int _1769 = ~_1258;
    int _1771 = _1769 + 1;
    float _1773 = _1663 * _1759;
    float _1775 = _1631 * _1759;
    float _1777 = _1725 * _1759;
    int _1779 = _1763 * _1675;
    int _1781 = _1779 + _1282;
    float _1783 = _1725 * _1679;
    int _1785 = _1771 * _1757;
    int _1787 = _1785 + _1304;
    float _1789 = trunc(_1681);
    int _1791 = int(_1789);
    int _1793 = _1593 * _1753;
    int _1795 = _1793 + _1326;
    bool _1797 = uint(_1781) >= uint(_1238);
    float _1799 = in.m_75.y;
    bool _1801 = uint(_1787) >= uint(_1258);
    bool _1803 = !_1797;
    int _1805 = _1803 ? 0 : (-1);
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1809 = _1807 != 0;
    float _1811 = trunc(_1685);
    int _1813 = int(_1811);
    bool _1815 = uint(_1795) >= uint(_1272);
    bool _1817 = !_1809;
    int _1819 = _1817 ? 0 : 1;
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1823 = _1821 != 0;
    int _1825 = int(_1403) + int(_1723);
    float _1827 = trunc(_1727);
    int _1829 = int(_1827);
    int _1831 = ~_1252;
    int _1833 = _1831 + 1;
    bool _1835 = !_1801;
    int _1837 = _1835 ? 0 : (-1);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1841 = _1839 != 0;
    int _1843 = _1833 * _1825;
    int _1845 = _1843 + _1292;
    int _1847 = ~_1675;
    int _1849 = _1847 + _1805;
    int _1851 = _1849 + 1;
    float _1853 = trunc(_1739);
    int _1855 = int(_1853);
    int _1857 = abs(_1819);
    bool _1859 = !_1823;
    int _1861 = _1859 ? 0 : 1;
    int _1863 = _1238 * _1851;
    int _1865 = _1863 + _1282;
    bool _1867 = _1687 >= _1725;
    bool _1869 = isnan(_1687);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(_1725);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    int _1879 = _1791 * _1857;
    int _1881 = _1879 + _1282;
    bool _1883 = !_1841;
    int _1885 = _1883 ? 0 : 1;
    float _1887 = trunc(_1751);
    int _1889 = int(_1887);
    int _1891 = ~_1757;
    int _1893 = _1891 + _1837;
    int _1895 = _1893 + 1;
    int _1897 = abs(_1861);
    bool _1899 = _1238 == 0;
    int _1901 = _1258 * _1895;
    int _1903 = _1901 + _1304;
    int _1905 = abs(_1885);
    int _1907 = _1813 * _1897;
    int _1909 = _1907 + _1304;
    bool _1911 = uint(_1845) >= uint(_1252);
    float _1913 = trunc(_1755);
    int _1915 = int(_1913);
    bool _1917 = !_1815;
    int _1919 = _1917 ? 0 : (-1);
    int _1921 = ~_1767;
    int _1923 = _1921 + 1;
    int _1925 = _1923 + 1;
    bool _1927 = !_1899;
    int _1929 = _1927 ? _1865 : (-1);
    float _1931 = trunc(_1877);
    int _1933 = int(_1931);
    int _1935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1937 = _1935 != 0;
    int _1939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1941 = _1939 != 0;
    int _1943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1945 = _1943 != 0;
    int _1947 = _1929 * _1925;
    int _1949 = ~_1753;
    int _1951 = _1949 + _1919;
    int _1953 = _1951 + 1;
    int _1955 = _1829 * _1905;
    int _1957 = _1955 + _1326;
    bool _1959 = !_1911;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = _1238 + (-1);
    int _1965 = _1272 * _1953;
    int _1967 = _1965 + _1326;
    bool _1969 = !_1941;
    int _1971 = _1969 ? 0 : 1;
    bool _1973 = _1258 == 0;
    int _1975 = _1767 * _1963;
    int _1977 = _1975 + _1947;
    bool _1979 = !_1937;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = ~_1825;
    int _1985 = _1983 + _1961;
    int _1987 = _1985 + 1;
    bool _1989 = _1272 == 0;
    int _1991 = abs(_1971);
    int _1993 = ~_1855;
    int _1995 = _1993 + 1;
    int _1997 = _1995 + 1;
    bool _1999 = !_1973;
    int _2001 = _1999 ? _1903 : (-1);
    int _2003 = abs(_1981);
    int _2005 = ~_1889;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    int _2011 = _1997 * _2001;
    bool _2013 = !_1989;
    int _2015 = _2013 ? _1967 : (-1);
    int _2017 = _1977 * _1991;
    int _2019 = _1252 * _1987;
    int _2021 = _2019 + _1292;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2025 = _2023 != 0;
    int _2027 = _2009 * _2015;
    bool _2029 = !_1945;
    int _2031 = _2029 ? 0 : 1;
    int _2033 = _1915 * _2003;
    int _2035 = _2033 + _2017;
    bool _2037 = !_2025;
    int _2039 = _2037 ? 0 : 1;
    int _2041 = abs(_2031);
    int _2043 = abs(_2039);
    bool _2045 = _1252 == 0;
    int _2047 = _1881 * _2041;
    int _2049 = _2047 + _2035;
    int _2051 = _1258 + (-1);
    float _2053 = trunc(_1773);
    int _2055 = int(_2053);
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2063 = _2061 != 0;
    int _2065 = _1791 * _2043;
    int _2067 = _2065 + _2049;
    bool _2069 = !_2045;
    int _2071 = _2069 ? _2021 : (-1);
    int _2073 = _1855 * _2051;
    int _2075 = _2073 + _2011;
    int _2077 = ~_1933;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = float(uint(_2067));
    bool _2085 = !_2063;
    int _2087 = _2085 ? 0 : 1;
    int _2089 = _2081 * _2071;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2093 = _2091 != 0;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2097 = _2095 != 0;
    float _2099 = as_type<float>(_1288) * _2083;
    int _2101 = abs(_2087);
    bool _2103 = !_2059;
    int _2105 = _2103 ? 0 : 1;
    int _2107 = _1272 + (-1);
    float _2109 = trunc(_2099);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = abs(_2105);
    bool _2117 = !_2093;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = _1889 * _2107;
    int _2123 = _2121 + _2027;
    int _2125 = ~_1238;
    int _2127 = _2125 + 1;
    int _2129 = _2075 * _2101;
    int _2131 = abs(_2119);
    int _2133 = _1252 + (-1);
    int _2135 = _2055 * _2115;
    int _2137 = _2135 + _2129;
    bool _2139 = !_2097;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1933 * _2133;
    int _2145 = _2143 + _2089;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2149 = _2147 != 0;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2153 = _2151 != 0;
    float _2155 = trunc(_1775);
    int _2157 = int(_2155);
    int _2159 = abs(_2141);
    int _2161 = _2127 * int(_2113);
    int _2163 = _2161 + _2067;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2167 = _2165 != 0;
    int _2169 = _1909 * _2131;
    int _2171 = _2169 + _2137;
    bool _2173 = !_2153;
    int _2175 = _2173 ? 0 : 1;
    float _2177 = float(uint(_2163));
    int _2179 = _1813 * _2159;
    int _2181 = _2179 + _2171;
    bool _2183 = !_2167;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = trunc(_1783);
    int _2189 = int(_2187);
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2193 = _2191 != 0;
    float _2195 = as_type<float>(_1288) * _2177;
    int _2197 = abs(_2175);
    bool _2199 = !_2193;
    int _2201 = _2199 ? 0 : 1;
    float _2203 = float(uint(_2181));
    int _2205 = _2123 * _2197;
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2209 = _2207 != 0;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2213 = _2211 != 0;
    int _2215 = abs(_2185);
    float _2217 = as_type<float>(_1322) * _2203;
    float _2219 = trunc(_2195);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    bool _2225 = !_2149;
    int _2227 = _2225 ? 0 : 1;
    bool _2229 = !_2213;
    int _2231 = _2229 ? 0 : 1;
    int _2233 = abs(_2227);
    int _2235 = abs(_2231);
    float _2237 = trunc(_2217);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    int _2243 = _2157 * _2233;
    int _2245 = _2243 + _2205;
    int _2247 = abs(_2201);
    int _2249 = _2145 * _2235;
    int _2251 = ~_1258;
    int _2253 = _2251 + 1;
    int _2255 = _1957 * _2215;
    int _2257 = _2255 + _2245;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2261 = _2259 != 0;
    float _2263 = trunc(_1777);
    int _2265 = int(_2263);
    int _2267 = _2189 * _2247;
    int _2269 = _2267 + _1292;
    int _2271 = int(_2113) + int(_2223);
    bool _2273 = !_2209;
    int _2275 = _2273 ? 0 : 1;
    bool _2277 = !_2261;
    int _2279 = _2277 ? 0 : 1;
    int _2281 = abs(_2275);
    int _2283 = _2253 * int(_2241);
    int _2285 = _2283 + _2181;
    int _2287 = abs(_2279);
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2291 = _2289 != 0;
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2295 = _2293 != 0;
    int _2297 = ~_1238;
    int _2299 = _2297 + 1;
    int _2301 = _1829 * _2287;
    int _2303 = _2301 + _2257;
    float _2305 = float(uint(_2285));
    int _2307 = _2265 * _2281;
    int _2309 = _2307 + _2249;
    bool _2311 = !_2291;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2299 * _2271;
    int _2317 = _2315 + _2067;
    bool _2319 = !_2295;
    int _2321 = _2319 ? 0 : 1;
    float _2323 = as_type<float>(_1322) * _2305;
    int _2325 = abs(_2313);
    float _2327 = float(uint(_2303));
    float _2329 = trunc(_2323);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    bool _2335 = uint(_2317) >= uint(_1238);
    float _2337 = as_type<float>(_1359) * _2327;
    bool _2339 = !_2335;
    int _2341 = _2339 ? 0 : (-1);
    int _2343 = abs(_2321);
    float _2345 = trunc(_2337);
    float _2347 = precise::max(_2345, 0.0);
    uint _2349 = uint(_2347);
    int _2351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2353 = _2351 != 0;
    int _2355 = _2269 * _2325;
    int _2357 = _2355 + _2309;
    int _2359 = ~_2271;
    int _2361 = _2359 + _2341;
    int _2363 = _2361 + 1;
    bool _2365 = _1238 == 0;
    int _2367 = _2189 * _2343;
    int _2369 = _2367 + _2357;
    int _2371 = ~_1272;
    int _2373 = _2371 + 1;
    int _2375 = _1238 * _2363;
    int _2377 = _2375 + _2067;
    bool _2379 = _1166 > 0.5;
    float _2381 = in.m_65.w;
    float _2383 = float(uint(_2369));
    float _2385 = -_1799;
    float _2387 = _2385 + 1.0;
    bool _2389 = !_2365;
    int _2391 = _2389 ? _2377 : (-1);
    int _2393 = as_type<int>(_2217);
    if (_2353)
    {
        float _2395 = -_1172;
        float _2397 = _2395 + 1.0;
        _2393 = as_type<int>(_2397);
    }
    int _2399 = _2393;
    int _2401 = int(_2241) + int(_2333);
    float _2403 = as_type<float>(_1300) * _2383;
    int _2405 = _2373 * int(_2349);
    int _2407 = _2405 + _2303;
    int _2409 = _2391 & 3;
    bool _2411 = _2409 != 0;
    if (_2353)
    {
        float _2413 = _2379 ? as_type<float>(_2399) : _1172;
        _1336 = _2413;
    }
    float _2415 = _1336;
    int _2417 = ~_1258;
    int _2419 = _2417 + 1;
    float _2421 = trunc(_2403);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    bool _2427 = uint(_2409) > 1u;
    float _2429 = float(uint(_2407));
    int _2431 = _2419 * _2401;
    int _2433 = _2431 + _2181;
    int _2435 = _2391 & 3;
    bool _2437 = _2435 != 0;
    int _2439 = ~_1252;
    int _2441 = _2439 + 1;
    float _2443 = as_type<float>(_1359) * _2429;
    int _2445 = _2437 ? 0 : 1;
    bool _2447 = uint(_2433) >= uint(_1258);
    int _2449 = ~_2445;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    float _2455 = trunc(_2443);
    float _2457 = precise::max(_2455, 0.0);
    uint _2459 = uint(_2457);
    int _2461 = _2453;
    if (!_2427)
    {
        int _2463 = ~_2445;
        int _2465 = _2463 + 1;
        _2461 = _2465;
    }
    int _2467 = _2461;
    int _2469 = _2441 * int(_2425);
    int _2471 = _2469 + _2369;
    bool _2473 = !_2447;
    int _2475 = _2473 ? 0 : (-1);
    bool _2477 = _2409 != 3;
    bool _2479 = uint(_2409) >= 2u;
    int _2481 = ~_2401;
    int _2483 = _2481 + _2475;
    int _2485 = _2483 + 1;
    int _2487 = _2479 ? 0 : 1;
    float _2489 = float(uint(_2471));
    int _2491 = _1258 * _2485;
    int _2493 = _2491 + _2181;
    int _2495 = _2379 ? as_type<int>(_2387) : as_type<int>(_1799);
    bool _2497 = _2381 > 0.5;
    float _2499 = as_type<float>(_1300) * _2489;
    int _2501 = ~_1272;
    int _2503 = _2501 + 1;
    bool _2505 = _1258 == 0;
    float _2507 = trunc(_2499);
    float _2509 = precise::max(_2507, 0.0);
    uint _2511 = uint(_2509);
    int _2513 = ~_2487;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _2517;
    if (_2477)
    {
        int _2521 = ~_2487;
        int _2523 = _2521 + 1;
        _2519 = _2523;
    }
    int _2525 = _2519;
    int _2527 = int(_2349) + int(_2459);
    bool _2529 = !_2505;
    int _2531 = _2529 ? _2493 : (-1);
    int _2533 = _2497 ? as_type<int>(_2387) : as_type<int>(_1799);
    int _2535 = _2503 * _2527;
    int _2537 = _2535 + _2303;
    int _2539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2541 = _2539 != 0;
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = !_2541;
    int _2549 = _2547 ? 0 : 1;
    bool _2551 = uint(_2543) >= 2u;
    int _2553 = _2545 ? 0 : 1;
    bool _2555 = uint(_2537) >= uint(_1272);
    int _2557 = _2551 ? 0 : 1;
    bool _2559 = _2543 != 3;
    bool _2561 = !_2555;
    int _2563 = _2561 ? 0 : (-1);
    int _2565 = ~_1252;
    int _2567 = _2565 + 1;
    bool _2569 = uint(_2543) > 1u;
    int _2571 = ~_2527;
    int _2573 = _2571 + _2563;
    int _2575 = _2573 + 1;
    int _2577 = int(_2425) + int(_2511);
    int _2579 = _1272 * _2575;
    int _2581 = _2579 + _2303;
    bool _2583 = _1272 == 0;
    int _2585 = ~_2557;
    int _2587 = _2585 + 1;
    int _2589 = _2587 + 1;
    int _2591 = _2567 * _2577;
    int _2593 = _2591 + _2369;
    int _2595 = _2589;
    if (_2559)
    {
        int _2597 = ~_2557;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2605 = _2603 != 0;
    int _2607 = ~_2553;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2583;
    int _2615 = _2613 ? _2581 : (-1);
    int _2617 = _2611;
    if (!_2569)
    {
        int _2619 = ~_2553;
        int _2621 = _2619 + 1;
        _2617 = _2621;
    }
    int _2623 = _2617;
    bool _2625 = uint(_2593) >= uint(_1252);
    bool _2627 = !_2605;
    int _2629 = _2627 ? 0 : 1;
    int _2631 = _2615 & 3;
    bool _2633 = _2631 != 0;
    bool _2635 = !_2625;
    int _2637 = _2635 ? 0 : (-1);
    int _2639 = _2633 ? 0 : 1;
    bool _2641 = uint(_2631) >= 2u;
    bool _2643 = _2631 != 3;
    int _2645 = ~_2577;
    int _2647 = _2645 + _2637;
    int _2649 = _2647 + 1;
    int _2651 = _2641 ? 0 : 1;
    bool _2653 = uint(_2631) > 1u;
    int _2655 = _1252 * _2649;
    int _2657 = _2655 + _2369;
    bool _2659 = _1252 == 0;
    int _2661 = ~_2651;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    bool _2667 = !_2659;
    int _2669 = _2667 ? _2657 : (-1);
    int _2671 = _2665;
    if (_2643)
    {
        int _2673 = ~_2651;
        int _2675 = _2673 + 1;
        _2671 = _2675;
    }
    int _2677 = _2671;
    int _2679 = _2669 & 3;
    bool _2681 = _2679 != 0;
    int _2683 = ~_2639;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    int _2689 = _2687;
    if (!_2653)
    {
        int _2691 = ~_2639;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = uint(_2679) >= 2u;
    int _2699 = _2681 ? 0 : 1;
    int _2701 = _2697 ? 0 : 1;
    bool _2703 = _2679 != 3;
    bool _2705 = uint(_2679) > 1u;
    int _2707 = ~_2701;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = ~_2699;
    int _2715 = _2713 + 1;
    int _2717 = _2715 + 1;
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2723 = _2711;
    int _2725 = _2717;
    if (_2703)
    {
        int _2727 = ~_2701;
        int _2729 = _2727 + 1;
        _2723 = _2729;
    }
    int _2731 = _2723;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2735 = _2733 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2705)
    {
        int _2737 = ~_2699;
        int _2739 = _2737 + 1;
        _2725 = _2739;
    }
    int _2741 = _2725;
    float _2743 = 1.0 / _2721;
    float _2745 = in.m_50.x;
    float _2747 = in.m_50.y;
    float _2749 = in.m_50.z;
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2753 = _2751 != 0;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2757 = _2755 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2761 = _2759 != 0;
    bool _2763 = !_2753;
    int _2765 = _2763 ? 0 : 1;
    float _2767 = _2761 ? as_type<float>(_2495) : _1799;
    float _2769 = 1.0 / _2735;
    int _2771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2773 = _2771 != 0;
    bool _2775 = _1481 > 0.5;
    float _2777 = _2773 ? as_type<float>(_2533) : _1799;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2781 = _2779 != 0;
    float _2783 = 1.0 / _2757;
    int _2785 = _2775 ? as_type<int>(_2387) : as_type<int>(_1799);
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2789 = _2787 != 0;
    float _2791 = _2781 ? as_type<float>(_2785) : _1799;
    float _2793 = _200 * _2747;
    float _2795 = _2789 ? as_type<float>(_2785) : _1799;
    int _2797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2799 = _2797 != 0;
    int _2801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2803 = _2801 != 0;
    float _2805 = fma(_198, _2745, _2793);
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2809 = _2807 != 0;
    float _2811 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2813 = _2811 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2815 = _206 * _2747;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2819 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2821 = _1471 * 2.0;
    float _2823 = 1.0 / _2813;
    float _2825 = _212 * _2747;
    float _2827 = fma(_204, _2745, _2815);
    float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2831 = _2829 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2833 = fma(_2819, -2.0, _2817);
    float _2835 = fma(_210, _2745, _2825);
    float _2837 = floor(_2821);
    float _2839 = fma(_202, _2749, _2805);
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2843 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2841;
    float _2845 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2847 = _2845 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2849 = fma(_214, _2749, _2835);
    float _2851 = fma(_208, _2749, _2827);
    float _2853 = 1.0 / _2831;
    float _2855 = _2799 ? as_type<float>(_2785) : _1799;
    float _2857 = _2843 * _2783;
    float _2859 = _2803 ? as_type<float>(_2785) : _1799;
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2863 = _1160 + _2861;
    bool _2865 = !_2809;
    int _2867 = _2865 ? 0 : 1;
    float _2869 = _2839 + _1595;
    float _2871 = float(uint(_1957));
    float _2873 = 1.0 / _2847;
    float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2877 = _2875 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2881 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2879;
    bool _2883 = _2837 > 0.0;
    float _2885 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2833);
    float _2887 = _2877 * _2743;
    float _2889 = _2881 * _2769;
    float _2891 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2893 = _2891 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2897 = _2895 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2899 = _2837 >= 0.0;
    bool _2901 = isnan(_2837);
    bool _2903 = _2899 || _2901;
    bool _2905 = isnan(0.0);
    bool _2907 = _2903 || _2905;
    float _2909 = 1.0 / _2893;
    float _2911 = _2897 * _2823;
    float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2913;
    int _2917 = _2907 ? 0 : 1;
    float _2919 = _2915 * _2853;
    float _2921 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2923 = _2921 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2925 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2925;
    float _2929 = _1166 * 2.0;
    int _2931 = ~_2917;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    float _2937 = _2923 * _2873;
    float _2939 = float(uint(_1881));
    bool _2941 = _1483 != 2;
    int _2943 = _2935;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2947 = _2823;
    float _2949 = _2873;
    float _2951 = _2859;
    if (!_2883)
    {
        int _2953 = ~_2917;
        int _2955 = _2953 + 1;
        _2943 = _2955;
    }
    int _2957 = _2943;
    float _2959 = _2927 * _2909;
    float _2961 = floor(_2929);
    float _2963 = as_type<float>(_1288) * _2939;
    if (!_1553)
    {
        _2945 = _1166;
    }
    float _2965 = _2945;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2969 = _1160 + _2967;
    float _2971 = _2965;
    if (!_1553)
    {
        _2947 = _1166;
    }
    float _2973 = _2947;
    float _2975 = _2973;
    if (!_1553)
    {
        _2949 = _1481;
    }
    float _2977 = _2949;
    float _2979 = fma(_2857, _2969, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2981 = trunc(_2963);
    float _2983 = precise::max(_2981, 0.0);
    uint _2985 = uint(_2983);
    float _2987 = 0.0;
    float _2989 = _2977;
    if (!_1553)
    {
        _2987 = _1481;
    }
    float _2991 = _2987;
    float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2995 = _1160 + _2993;
    bool _2997 = !_1553;
    float _2999 = _2997 ? as_type<float>(_1485) : as_type<float>(_1487);
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3003 = _1160 + _3001;
    bool _3005 = !_1553;
    float _3007 = _3005 ? as_type<float>(_1487) : as_type<float>(_1489);
    float _3009 = fma(_2911, _2995, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3011 = _2991;
    if (_1553)
    {
        _2971 = _1471;
    }
    float _3013 = _2971;
    float _3015 = fma(_2937, _3003, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1553)
    {
        _2975 = _1471;
    }
    float _3017 = _2975;
    if (_1553)
    {
        _2989 = _1166;
    }
    float _3019 = _2989;
    if (_1553)
    {
        _3011 = _1166;
    }
    float _3021 = _3011;
    bool _3023 = _2961 > 0.0;
    bool _3025 = _2961 >= 0.0;
    bool _3027 = isnan(_2961);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan(0.0);
    bool _3033 = _3029 || _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3037 = _1160 + _3035;
    int _3039 = ~_1238;
    int _3041 = _3039 + 1;
    float _3043 = float(uint(_1909));
    float _3045 = fma(_2887, _3037, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3047 = fma(_2889, _2863, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3051 = _1160 + _3049;
    int _3053 = _3041 * int(_2985);
    int _3055 = _3053 + _1881;
    float _3057 = as_type<float>(_1322) * _3043;
    bool _3059 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3061 = isnan(_1160);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3067 = _3063 || _3065;
    float _3069 = float(_3067);
    float _3071 = fma(_2959, _3051, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3073 = float(uint(_2269));
    float _3075 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3077 = _1160 + _3075;
    float _3079 = float(uint(_3055));
    float _3081 = _2851 + _1557;
    float _3083 = trunc(_3057);
    float _3085 = precise::max(_3083, 0.0);
    uint _3087 = uint(_3085);
    bool _3089 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3091 = isnan(_1160);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = -_3069;
    float _3103 = _3101 + 1.0;
    float _3105 = as_type<float>(_1288) * _3079;
    bool _3107 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3109 = isnan(_1160);
    bool _3111 = _3107 || _3109;
    bool _3113 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3115 = _3111 || _3113;
    float _3117 = float(_3115);
    float _3119 = as_type<float>(_1300) * _3073;
    float _3121 = -_3099;
    float _3123 = _3121 + 1.0;
    bool _3125 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3127 = isnan(_1160);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3133 = _3129 || _3131;
    float _3135 = float(_3133);
    float _3137 = fma(_2919, _3077, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3139 = -_3117;
    float _3141 = _3139 + 1.0;
    float _3143 = _3117 * _3123;
    bool _3145 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3147 = isnan(_1160);
    bool _3149 = _3145 || _3147;
    bool _3151 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3153 = _3149 || _3151;
    float _3155 = float(_3153);
    float _3157 = trunc(_3119);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    float _3163 = _3069 * _3141;
    float _3165 = as_type<float>(_1359) * _2871;
    bool _3167 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3169 = isnan(_1160);
    bool _3171 = _3167 || _3169;
    bool _3173 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3175 = _3171 || _3173;
    float _3177 = float(_3175);
    float _3179 = -_3155;
    float _3181 = _3179 + 1.0;
    int _3183 = _1667 * int(_3087);
    int _3185 = _3183 + _1909;
    float _3187 = _3155 * _3103;
    bool _3189 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3191 = isnan(_1160);
    bool _3193 = _3189 || _3191;
    bool _3195 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3197 = _3193 || _3195;
    float _3199 = float(_3197);
    float _3201 = trunc(_3165);
    float _3203 = precise::max(_3201, 0.0);
    uint _3205 = uint(_3203);
    float _3207 = _3135 * _3181;
    float _3209 = float(uint(_3185));
    float _3211 = -_3135;
    float _3213 = _3211 + 1.0;
    int _3215 = ~_1272;
    int _3217 = _3215 + 1;
    bool _3219 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3221 = isnan(_1160);
    bool _3223 = _3219 || _3221;
    bool _3225 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3227 = _3223 || _3225;
    float _3229 = float(_3227);
    float _3231 = as_type<float>(_1322) * _3209;
    float _3233 = -_3177;
    float _3235 = _3233 + 1.0;
    int _3237 = ~_1252;
    int _3239 = _3237 + 1;
    float _3241 = trunc(_3105);
    float _3243 = precise::max(_3241, 0.0);
    uint _3245 = uint(_3243);
    float _3247 = _3199 * _3213;
    float _3249 = _3229 * _3235;
    float _3251 = -_3199;
    float _3253 = _3251 + 1.0;
    int _3255 = _3239 * int(_3161);
    int _3257 = _3255 + _2269;
    float _3259 = -_3229;
    float _3261 = _3259 + 1.0;
    int _3263 = _3217 * int(_3205);
    int _3265 = _3263 + _1957;
    float _3267 = _2979 * _3249;
    float _3269 = trunc(_3231);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = _3177 * _3253;
    float _3277 = _3033 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3279 = fma(_3261, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3267);
    float _3281 = float(uint(_3265));
    float _3283 = _2849 + _1651;
    int _3285 = ~_1238;
    int _3287 = _3285 + 1;
    float _3289 = fma(_3045, _3275, _3279);
    float _3291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3293 = _2869 + _3291;
    float _3295 = as_type<float>(_1359) * _3281;
    float _3297 = float(uint(_3257));
    float _3299 = fma(_3047, _3247, _3289);
    int _3301 = ~_1258;
    int _3303 = _3301 + 1;
    float _3305 = trunc(_3295);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    int _3311 = ~as_type<int>(_3277);
    int _3313 = _3311 + 1;
    int _3315 = _3313 + 1;
    float _3317 = as_type<float>(_1300) * _3297;
    int _3319 = int(_2985) + int(_3245);
    float _3321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3323 = _3081 + _3321;
    int _3325 = int(_3087) + int(_3273);
    float _3327 = fma(_3009, _3207, _3299);
    int _3329 = _3315;
    float _3331 = _3277;
    float _3333 = _3275;
    if (!_3023)
    {
        int _3335 = ~as_type<int>(_3277);
        int _3337 = _3335 + 1;
        _3329 = _3337;
    }
    int _3339 = _3329;
    float _3341 = trunc(_3317);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    int _3347 = _3287 * _3319;
    int _3349 = _3347 + _1881;
    int _3351 = ~_1272;
    int _3353 = _3351 + 1;
    float _3355 = fma(_3137, _3187, _3327);
    float _3357 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3359 = uint(_3349) >= uint(_1238);
    int _3361 = _3303 * _3325;
    int _3363 = _3361 + _1909;
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3367 = int(_3205) + int(_3309);
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3371 = !_3359;
    int _3373 = _3371 ? 0 : (-1);
    float _3375 = _1481 * 2.0;
    bool _3377 = uint(_3363) >= uint(_1258);
    float _3379 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3381 = -_3369;
    float _3383 = fma(_3357, 2.0, _3381);
    int _3385 = int(_3161) + int(_3345);
    int _3387 = _3353 * _3367;
    int _3389 = _3387 + _1957;
    int _3391 = ~_1252;
    int _3393 = _3391 + 1;
    float _3395 = floor(_3375);
    bool _3397 = !_3377;
    int _3399 = _3397 ? 0 : (-1);
    float _3401 = -_168;
    float _3403 = fma(_3401, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3383);
    bool _3405 = uint(_3389) >= uint(_1272);
    float _3407 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3379);
    float _3409 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3413 = _3283 + _3411;
    bool _3415 = !_3405;
    int _3417 = _3415 ? 0 : (-1);
    float _3419 = fma(_3409, _1375, -0.5);
    int _3421 = _3393 * _3385;
    int _3423 = _3421 + _2269;
    float _3425 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3407);
    bool _3427 = uint(_3423) >= uint(_1252);
    float _3429 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3431 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3435 = !_3427;
    int _3437 = _3435 ? 0 : (-1);
    float _3439 = fma(as_type<float>(_1489), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3429);
    bool _3441 = _3425 >= 0.0;
    float _3443 = as_type<float>(_1489) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3445 = fma(as_type<float>(_1487), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3431);
    float _3447 = as_type<float>(_1487) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3449 = _1166 + _1471;
    float _3451 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3439);
    float _3453 = fma(_3447, -2.0, _3433);
    float _3455 = _3449 + (-1.0);
    float _3457 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3459 = ~_3325;
    int _3461 = _3459 + _3399;
    int _3463 = _3461 + 1;
    float _3465 = fma(_3015, _3163, _3355);
    float _3467 = fma(_3455, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3469 = _3455;
    if (_3441)
    {
        _3469 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3471 = _3469;
    float _3473 = -_3457;
    float _3475 = fma(_3443, 2.0, _3473);
    int _3477 = ~_3319;
    int _3479 = _3477 + _3373;
    int _3481 = _3479 + 1;
    bool _3483 = !_2411;
    int _3485 = _3483 ? 0 : 1;
    int _3487 = as_type<int>(_3471);
    if (_3441)
    {
        float _3489 = _3471 * 5.0;
        _3487 = as_type<int>(_3489);
    }
    int _3491 = _3487;
    int _3493 = _2531 & 3;
    bool _3495 = _3493 != 0;
    float _3497 = fma(_3071, _3143, _3465);
    int _3499 = _1238 * _3481;
    int _3501 = _3499 + _1881;
    if (_3441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11842 = as_type<float>(_3491);
        out.gl_Position.z = _11842;
    }
    bool _3503 = !_3495;
    int _3505 = _3503 ? 0 : 1;
    float _3507 = fma(_3099, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3497);
    int _3509 = _2615 & 3;
    bool _3511 = _3509 != 0;
    float _3513 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3515 = _1258 * _3463;
    int _3517 = _3515 + _1909;
    bool _3519 = !_3511;
    int _3521 = _3519 ? 0 : 1;
    float _3523 = fma(_3017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3513);
    int _3525 = _2669 & 3;
    bool _3527 = _3525 != 0;
    out.m_77.x = _3507;
    float _3529 = _3323 * _3323;
    bool _3531 = !_3527;
    int _3533 = _3531 ? 0 : 1;
    float _3535 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3445);
    bool _3537 = _2409 != 3;
    float _3539 = fma(_3293, _3293, _3529);
    float _3541 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3543 = fma(_3413, _3413, _3539);
    bool _3545 = !_3537;
    int _3547 = _3545 ? 0 : (-1);
    float _3549 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3551 = _2391 >> 31;
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3555 = _2543 != 3;
    float _3557 = fma(_2999, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3549);
    float _3559 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3561 = _3551 & 3;
    float _3563 = rsqrt(_3543);
    int _3565 = _2615 >> 31;
    float _3567 = fma(_3559, -2.0, _3553);
    int _3569 = _2531 >> 31;
    float _3571 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3541);
    int _3573 = _2391 + _3561;
    float _3575 = _3007 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3577 = _3569 & 3;
    float _3579 = -_168;
    float _3581 = fma(_3579, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3475);
    int _3583 = _3573 >> 2;
    float _3585 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3453);
    int _3587 = _2531 + _3577;
    float _3589 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3571);
    int _3591 = _2669 >> 31;
    float _3593 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3523);
    int _3595 = _3565 & 3;
    float _3597 = _3293 * _3563;
    int _3599 = _3587 >> 2;
    float _3601 = _3323 * _3563;
    int _3603 = _3583 << 4;
    int _3605 = _3603 + 368;
    float _3607 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3567);
    bool _3609 = !_3555;
    int _3611 = _3609 ? 0 : (-1);
    float _3613 = -_3601;
    float _3615 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3323);
    bool _3617 = _2631 != 3;
    if (_3441)
    {
        out.m_53.x = 0.0;
    }
    if (_2941)
    {
        _3331 = _1471;
    }
    float _3619 = _3331;
    float _3621 = _3615 * _3615;
    float _3623 = _3619;
    if (_2941)
    {
        _3333 = _1166;
    }
    float _3625 = _3333;
    int _3627 = _3591 & 3;
    float _3629 = _3625;
    if (!_2941)
    {
        _3623 = _1481;
    }
    float _3631 = _3623;
    uint _3633 = uint(int(uint(_3605) >> uint(2)));
    uint _3635 = uint(int(uint(int(_3633)) >> uint(2)));
    int _3637 = int(_3633) & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = int(_3633) + 1;
    uint _3643 = uint(int(uint(_3641) >> uint(2)));
    int _3645 = _3641 & 3;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[int(_3643)][_3645];
    if (!_2941)
    {
        _3629 = _1471;
    }
    float _3649 = _3629;
    int _3651 = _2615 + _3595;
    float _3653 = _3631 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3655 = _3599 << 4;
    int _3657 = _3655 + 512;
    float _3659 = _3649 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3661 = _3395 > 0.0;
    float _3663 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3665 = int(_3663);
    bool _3667 = _3395 >= 0.0;
    bool _3669 = isnan(_3395);
    bool _3671 = _3667 || _3669;
    bool _3673 = isnan(0.0);
    bool _3675 = _3671 || _3673;
    uint _3677 = uint(int(uint(_3657) >> uint(2)));
    uint _3679 = uint(int(uint(int(_3677)) >> uint(2)));
    int _3681 = int(_3677) & 3;
    float _3683 = (*spvDescriptorSet0.vp_c9)._m0[int(_3679)][_3681];
    int _3685 = int(_3677) + 1;
    uint _3687 = uint(int(uint(_3685) >> uint(2)));
    int _3689 = _3685 & 3;
    float _3691 = (*spvDescriptorSet0.vp_c9)._m0[int(_3687)][_3689];
    bool _3693 = _2679 != 3;
    float _3695 = -_3597;
    float _3697 = fma(_3695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3293);
    int _3699 = _2669 + _3627;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3703 = _3651 >> 2;
    float _3705 = fma(_3697, _3697, _3621);
    float _3707 = -_3701;
    float _3709 = fma(_3575, 2.0, _3707);
    bool _3711 = !_2365;
    int _3713 = _3711 ? _3501 : (-1);
    float _3715 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3717 = int(_3715);
    bool _3719 = !_2505;
    int _3721 = _3719 ? _3517 : (-1);
    float _3723 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3725 = !_3693;
    int _3727 = _3725 ? 0 : (-1);
    float _3729 = _3019 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3731 = _3699 >> 2;
    int _3733 = _3703 << 4;
    int _3735 = _3733 + 656;
    int _3737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3739 = _3737 != 0;
    int _3741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3743 = _3741 != 0;
    int _3745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3747 = _3745 != 0;
    float _3749 = _3013 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3751 = _3731 << 4;
    int _3753 = _3751 + 800;
    uint _3755 = uint(int(uint(_3735) >> uint(2)));
    uint _3757 = uint(int(uint(int(_3755)) >> uint(2)));
    int _3759 = int(_3755) & 3;
    float _3761 = (*spvDescriptorSet0.vp_c9)._m0[int(_3757)][_3759];
    int _3763 = int(_3755) + 1;
    uint _3765 = uint(int(uint(_3763) >> uint(2)));
    int _3767 = _3763 & 3;
    float _3769 = (*spvDescriptorSet0.vp_c9)._m0[int(_3765)][_3767];
    float _3771 = -_3723;
    float _3773 = fma(_3749, 2.0, _3771);
    float _3775 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3777 = _3675 ? 0 : 1;
    uint _3779 = uint(int(uint(_3753) >> uint(2)));
    uint _3781 = uint(int(uint(int(_3779)) >> uint(2)));
    int _3783 = int(_3779) & 3;
    float _3785 = (*spvDescriptorSet0.vp_c9)._m0[int(_3781)][_3783];
    int _3787 = int(_3779) + 1;
    uint _3789 = uint(int(uint(_3787) >> uint(2)));
    int _3791 = _3787 & 3;
    float _3793 = (*spvDescriptorSet0.vp_c9)._m0[int(_3789)][_3791];
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3797 = -_3775;
    float _3799 = fma(_3653, 2.0, _3797);
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3803 = ~_3367;
    int _3805 = _3803 + _3417;
    int _3807 = _3805 + 1;
    float _3809 = fma(_3659, -2.0, _3795);
    int _3811 = ~_3385;
    int _3813 = _3811 + _3437;
    int _3815 = _3813 + 1;
    float _3817 = fma(_3729, -2.0, _3801);
    int _3819 = _3605 + 8;
    uint _3821 = uint(int(uint(_3819) >> uint(2)));
    uint _3823 = uint(int(uint(int(_3821)) >> uint(2)));
    int _3825 = int(_3821) & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = int(_3821) + 1;
    uint _3831 = uint(int(uint(_3829) >> uint(2)));
    int _3833 = _3829 & 3;
    float _3835 = (*spvDescriptorSet0.vp_c9)._m0[int(_3831)][_3833];
    int _3837 = ~_3777;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    float _3843 = -_168;
    float _3845 = fma(_3843, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3773);
    int _3847 = _3841;
    if (!_3661)
    {
        int _3849 = ~_3777;
        int _3851 = _3849 + 1;
        _3847 = _3851;
    }
    int _3853 = _3847;
    int _3855 = _1252 * _3815;
    int _3857 = _3855 + _2269;
    int _3859 = abs(_2623);
    float _3861 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3817);
    int _3863 = abs(_2467);
    int _3865 = _3735 + 8;
    uint _3867 = uint(int(uint(_3865) >> uint(2)));
    uint _3869 = uint(int(uint(int(_3867)) >> uint(2)));
    int _3871 = int(_3867) & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = int(_3867) + 1;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    int _3879 = _3875 & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = abs(_2695);
    int _3885 = _1272 * _3807;
    int _3887 = _3885 + _1957;
    int _3889 = ~_3863;
    int _3891 = _3889 + 1;
    int _3893 = _3891 + 1;
    float _3895 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3897 = int(_3895);
    int _3899 = ~_3859;
    int _3901 = _3899 + 1;
    int _3903 = _3901 + 1;
    float _3905 = -_168;
    float _3907 = fma(_3905, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3799);
    int _3909 = abs(_3521);
    int _3911 = _3657 + 8;
    uint _3913 = uint(int(uint(_3911) >> uint(2)));
    uint _3915 = uint(int(uint(int(_3913)) >> uint(2)));
    int _3917 = int(_3913) & 3;
    float _3919 = (*spvDescriptorSet0.vp_c9)._m0[int(_3915)][_3917];
    int _3921 = int(_3913) + 1;
    uint _3923 = uint(int(uint(_3921) >> uint(2)));
    int _3925 = _3921 & 3;
    float _3927 = (*spvDescriptorSet0.vp_c9)._m0[int(_3923)][_3925];
    int _3929 = _3893 * as_type<int>(_3647);
    int _3931 = abs(_3533);
    int _3933 = _3903 * as_type<int>(_3691);
    int _3935 = abs(_3485);
    float _3937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3939 = abs(_2741);
    float _3941 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3809);
    int _3943 = _3753 + 8;
    uint _3945 = uint(int(uint(_3943) >> uint(2)));
    uint _3947 = uint(int(uint(int(_3945)) >> uint(2)));
    int _3949 = int(_3945) & 3;
    float _3951 = (*spvDescriptorSet0.vp_c9)._m0[int(_3947)][_3949];
    int _3953 = int(_3945) + 1;
    uint _3955 = uint(int(uint(_3953) >> uint(2)));
    int _3957 = _3953 & 3;
    float _3959 = (*spvDescriptorSet0.vp_c9)._m0[int(_3955)][_3957];
    int _3961 = ~_3883;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = ~_3939;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    int _3973 = _3965 * as_type<int>(_3769);
    int _3975 = abs(_3505);
    int _3977 = ~_3935;
    int _3979 = _3977 + 1;
    int _3981 = _3979 + 1;
    float _3983 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3985 = ~_3931;
    int _3987 = _3985 + 1;
    int _3989 = _3987 + 1;
    int _3991 = _3971 * as_type<int>(_3793);
    int _3993 = ~_3975;
    int _3995 = _3993 + 1;
    int _3997 = _3995 + 1;
    int _3999 = _3981 * as_type<int>(_3639);
    int _4001 = _3999 + _3929;
    int _4003 = abs(_2525);
    int _4005 = _3989 * as_type<int>(_3785);
    int _4007 = _4005 + _3991;
    int _4009 = ~_3909;
    int _4011 = _4009 + 1;
    int _4013 = _4011 + 1;
    float _4015 = fma(_3021, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3983);
    int _4017 = abs(_2677);
    float _4019 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4021 = int(_4019);
    int _4023 = _3997 * as_type<int>(_3683);
    int _4025 = _4023 + _3933;
    int _4027 = abs(_3547);
    int _4029 = _4013 * as_type<int>(_3761);
    int _4031 = _4029 + _3973;
    int _4033 = ~_4003;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = _3937 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4041 = ~_4017;
    int _4043 = _4041 + 1;
    int _4045 = _4043 + 1;
    float _4047 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4015);
    int _4049 = abs(_2601);
    int _4051 = _4037 * as_type<int>(_3827);
    int _4053 = _4051 + _4001;
    float _4055 = float(uint(_3717));
    int _4057 = _4045 * as_type<int>(_3873);
    int _4059 = _4057 + _4031;
    int _4061 = ~_4027;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    float _4067 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4069 = log2(_4067);
    int _4071 = abs(_2549);
    float _4073 = fma(_4039, _2855, -0.5);
    int _4075 = ~_4049;
    int _4077 = _4075 + 1;
    int _4079 = _4077 + 1;
    int _4081 = _4065 * as_type<int>(_3835);
    int _4083 = _4081 + _4053;
    int _4085 = abs(_3611);
    int _4087 = ~_4071;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    float _4093 = 1.0 / _4055;
    bool _4095 = !_3617;
    int _4097 = _4095 ? 0 : (-1);
    int _4099 = _4079 * as_type<int>(_3919);
    int _4101 = _4099 + _4025;
    int _4103 = ~_4085;
    int _4105 = _4103 + 1;
    int _4107 = _4105 + 1;
    int _4109 = _4083 * _4091;
    float _4111 = float(uint(_4021));
    int _4113 = abs(_2731);
    int _4115 = _4107 * as_type<int>(_3927);
    int _4117 = _4115 + _4101;
    int _4119 = abs(_4097);
    float _4121 = 1.0 / _4111;
    int _4123 = abs(_2629);
    int _4125 = _3713 * _4071;
    int _4127 = _4125 + _4109;
    float _4129 = float(uint(_3665));
    int _4131 = ~_4119;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    int _4137 = ~_4113;
    int _4139 = _4137 + 1;
    int _4141 = _4139 + 1;
    float _4143 = 1.0 / _4129;
    int _4145 = ~_4123;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    int _4151 = _4135 * as_type<int>(_3881);
    int _4153 = _4151 + _4059;
    int _4155 = abs(_3727);
    int _4157 = _4141 * as_type<int>(_3951);
    int _4159 = _4157 + _4007;
    int _4161 = as_type<int>(_4093) + (-2);
    int _4163 = _4149 * _4117;
    int _4165 = abs(_2765);
    float _4167 = float(uint(_4127));
    int _4169 = _3721 * _4123;
    int _4171 = _4169 + _4163;
    float _4173 = float(uint(_3897));
    int _4175 = abs(_2867);
    float _4177 = as_type<float>(_4161) * _4167;
    int _4179 = ~_4155;
    int _4181 = _4179 + 1;
    int _4183 = _4181 + 1;
    int _4185 = ~_4165;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    float _4191 = 1.0 / _4173;
    bool _4193 = _1272 == 0;
    int _4195 = _4183 * as_type<int>(_3959);
    int _4197 = _4195 + _4159;
    int _4199 = _4189 * _4153;
    bool _4201 = !_4193;
    int _4203 = _4201 ? _3887 : (-1);
    float _4205 = _4069 * _168;
    int _4207 = ~_4175;
    int _4209 = _4207 + 1;
    int _4211 = _4209 + 1;
    float _4213 = trunc(_4177);
    float _4215 = precise::max(_4213, 0.0);
    uint _4217 = uint(_4215);
    int _4219 = as_type<int>(_4121) + (-2);
    int _4221 = _4203 * _4165;
    int _4223 = _4221 + _4199;
    float _4225 = float(uint(_4171));
    int _4227 = _4211 * _4197;
    bool _4229 = _1252 == 0;
    float _4231 = _3413 * _3563;
    int _4233 = as_type<int>(_4143) + (-2);
    float _4235 = as_type<float>(_4219) * _4225;
    bool _4237 = !_4229;
    int _4239 = _4237 ? _3857 : (-1);
    float _4241 = exp2(_4205);
    float _4243 = float(uint(_4223));
    int _4245 = ~_3717;
    int _4247 = _4245 + 1;
    int _4249 = _4239 * _4175;
    int _4251 = _4249 + _4227;
    int _4253 = as_type<int>(_4191) + (-2);
    float _4255 = as_type<float>(_4233) * _4243;
    int _4257 = abs(_3717);
    float _4259 = trunc(_4235);
    float _4261 = precise::max(_4259, 0.0);
    uint _4263 = uint(_4261);
    float _4265 = float(uint(_4251));
    int _4267 = _4247 * int(_4217);
    int _4269 = _4267 + _4127;
    float _4271 = float(uint(_4257));
    float _4273 = -_4231;
    float _4275 = fma(_4273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3413);
    int _4277 = abs(_4021);
    float _4279 = as_type<float>(_4253) * _4265;
    float _4281 = float(uint(_4269));
    float _4283 = trunc(_4255);
    float _4285 = precise::max(_4283, 0.0);
    uint _4287 = uint(_4285);
    int _4289 = ~_4021;
    int _4291 = _4289 + 1;
    float _4293 = fma(_4275, _4275, _3705);
    int _4295 = ~_3665;
    int _4297 = _4295 + 1;
    float _4299 = as_type<float>(_4161) * _4281;
    float _4301 = float(uint(_4277));
    int _4303 = abs(_3665);
    float _4305 = trunc(_4279);
    float _4307 = precise::max(_4305, 0.0);
    uint _4309 = uint(_4307);
    int _4311 = _4291 * int(_4263);
    int _4313 = _4311 + _4171;
    int _4315 = ~_3897;
    int _4317 = _4315 + 1;
    float _4319 = float(uint(_4313));
    float _4321 = 1.0 / _4271;
    int _4323 = _4297 * int(_4287);
    int _4325 = _4323 + _4223;
    float _4327 = as_type<float>(_4219) * _4319;
    float _4329 = float(uint(_4303));
    float _4331 = float(uint(_4325));
    float _4333 = 1.0 / _4301;
    int _4335 = _4317 * int(_4309);
    int _4337 = _4335 + _4251;
    int _4339 = abs(_3897);
    float _4341 = as_type<float>(_4233) * _4331;
    int _4343 = abs(_4127);
    float _4345 = float(uint(_4337));
    float _4347 = 1.0 / _4329;
    float _4349 = float(uint(_4339));
    int _4351 = abs(_4171);
    float _4353 = as_type<float>(_4253) * _4345;
    int _4355 = as_type<int>(_4321) + (-2);
    float _4357 = float(uint(_4343));
    float _4359 = 1.0 / _4349;
    int _4361 = as_type<int>(_4333) + (-2);
    int _4363 = abs(_4223);
    float _4365 = as_type<float>(_4355) * _4357;
    float _4367 = float(uint(_4351));
    float _4369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4371 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4373 = isnan(1.0);
    bool _4375 = _4371 || _4373;
    bool _4377 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4379 = _4375 || _4377;
    float _4381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4383 = 1.0 + _4381;
    float _4385 = as_type<float>(_4361) * _4367;
    float _4387 = trunc(_4365);
    float _4389 = precise::max(_4387, 0.0);
    uint _4391 = uint(_4389);
    float _4393 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4369);
    int _4395 = as_type<int>(_4347) + (-2);
    float _4397 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4399 = float(uint(_4363));
    float _4401 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4403 = abs(_4251);
    float _4405 = 1.0 / _4383;
    float _4407 = as_type<float>(_4395) * _4399;
    int _4409 = as_type<int>(_4359) + (-2);
    float _4411 = -_4241;
    float _4413 = _4411 + 1.0;
    float _4415 = float(uint(_4403));
    float _4417 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4419 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4421 = isnan(0.0);
    bool _4423 = _4419 || _4421;
    bool _4425 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4427 = _4423 || _4425;
    float _4429 = trunc(_4385);
    float _4431 = precise::max(_4429, 0.0);
    uint _4433 = uint(_4431);
    float _4435 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4397);
    float _4437 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4401);
    float _4439 = as_type<float>(_4409) * _4415;
    int _4441 = ~_4257;
    int _4443 = _4441 + 1;
    float _4445 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4417);
    float _4447 = _4427 ? _4413 : 0.0;
    float _4449 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4435);
    float _4451 = trunc(_4407);
    float _4453 = precise::max(_4451, 0.0);
    uint _4455 = uint(_4453);
    int _4457 = ~_4277;
    int _4459 = _4457 + 1;
    float _4461 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3557);
    int _4463 = _4443 * int(_4391);
    int _4465 = _4463 + _4343;
    float _4467 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4445);
    float _4469 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4393);
    float _4471 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4437);
    int _4473 = ~_4339;
    int _4475 = _4473 + 1;
    float _4477 = trunc(_4327);
    float _4479 = precise::max(_4477, 0.0);
    uint _4481 = uint(_4479);
    float _4483 = float(uint(_4465));
    float _4485 = -_3607;
    float _4487 = fma(_4461, _4073, _4485);
    float _4489 = as_type<float>(_4355) * _4483;
    float _4491 = trunc(_4299);
    float _4493 = precise::max(_4491, 0.0);
    uint _4495 = uint(_4493);
    float _4497 = trunc(_4439);
    float _4499 = precise::max(_4497, 0.0);
    uint _4501 = uint(_4499);
    float _4503 = -_168;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3709);
    float _4507 = _4231;
    if (_4379)
    {
        float _4509 = _4447 * _4405;
        _170 = _4509;
    }
    float _4511 = _170;
    int _4513 = _4459 * int(_4433);
    int _4515 = _4513 + _4351;
    int _4517 = ~_4303;
    int _4519 = _4517 + 1;
    float _4521 = fma(_3589, _3419, _4505);
    int _4523 = int(_4263) + int(_4481);
    float _4525 = trunc(_4341);
    float _4527 = precise::max(_4525, 0.0);
    uint _4529 = uint(_4527);
    int _4531 = int(_4217) + int(_4495);
    float _4533 = trunc(_4353);
    float _4535 = precise::max(_4533, 0.0);
    uint _4537 = uint(_4535);
    float _4539 = float(uint(_4515));
    int _4541 = _4519 * int(_4455);
    int _4543 = _4541 + _4363;
    int _4545 = _4475 * int(_4501);
    int _4547 = _4545 + _4403;
    float _4549 = as_type<float>(_4361) * _4539;
    int _4551 = ~_3717;
    int _4553 = _4551 + 1;
    float _4555 = trunc(_4489);
    float _4557 = precise::max(_4555, 0.0);
    uint _4559 = uint(_4557);
    float _4561 = float(uint(_4543));
    int _4563 = int(_4287) + int(_4529);
    float _4565 = as_type<float>(_4395) * _4561;
    int _4567 = ~_4021;
    int _4569 = _4567 + 1;
    float _4571 = trunc(_4549);
    float _4573 = precise::max(_4571, 0.0);
    uint _4575 = uint(_4573);
    int _4577 = int(_4309) + int(_4537);
    int _4579 = _4553 * _4531;
    int _4581 = _4579 + _4127;
    float _4583 = float(uint(_4547));
    int _4585 = ~_3897;
    int _4587 = _4585 + 1;
    float _4589 = as_type<float>(_4409) * _4583;
    int _4591 = ~_3665;
    int _4593 = _4591 + 1;
    float _4595 = trunc(_4565);
    float _4597 = precise::max(_4595, 0.0);
    uint _4599 = uint(_4597);
    bool _4601 = uint(_4581) >= uint(_3717);
    int _4603 = _4569 * _4523;
    int _4605 = _4603 + _4171;
    bool _4607 = uint(_4605) >= uint(_4021);
    float _4609 = trunc(_4589);
    float _4611 = precise::max(_4609, 0.0);
    uint _4613 = uint(_4611);
    int _4615 = _4587 * _4577;
    int _4617 = _4615 + _4251;
    bool _4619 = !_4601;
    int _4621 = _4619 ? 0 : (-1);
    int _4623 = _4593 * _4563;
    int _4625 = _4623 + _4223;
    int _4627 = int(_4391) + int(_4559);
    int _4629 = int(_4433) + int(_4575);
    bool _4631 = uint(_4625) >= uint(_3665);
    float _4633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4635 = !_4607;
    int _4637 = _4635 ? 0 : (-1);
    bool _4639 = uint(_4617) >= uint(_3897);
    int _4641 = ~_4277;
    int _4643 = _4641 + 1;
    int _4645 = ~_4257;
    int _4647 = _4645 + 1;
    int _4649 = int(_4501) + int(_4613);
    int _4651 = _4647 * _4627;
    int _4653 = _4651 + _4343;
    int _4655 = ~_4339;
    int _4657 = _4655 + 1;
    float _4659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4661 = int(_4455) + int(_4599);
    int _4663 = _4643 * _4629;
    int _4665 = _4663 + _4351;
    int _4667 = ~_4303;
    int _4669 = _4667 + 1;
    int _4671 = _4657 * _4649;
    int _4673 = _4671 + _4403;
    bool _4675 = !_4631;
    int _4677 = _4675 ? 0 : (-1);
    float _4679 = _4633 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4681 = uint(_4653) >= uint(_4257);
    int _4683 = _4669 * _4661;
    int _4685 = _4683 + _4363;
    bool _4687 = !_4639;
    int _4689 = _4687 ? 0 : (-1);
    float _4691 = fma(_4679, _1649, -0.5);
    bool _4693 = uint(_4665) >= uint(_4277);
    int _4695 = ~_4531;
    int _4697 = _4695 + _4621;
    int _4699 = _4697 + 1;
    float _4701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4703 = !_4693;
    int _4705 = _4703 ? 0 : (-1);
    float _4707 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4709 = ~_4523;
    int _4711 = _4709 + _4637;
    int _4713 = _4711 + 1;
    int _4715 = _3717 * _4699;
    int _4717 = _4715 + _4127;
    bool _4719 = uint(_4673) >= uint(_4339);
    float _4721 = _4659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4723 = ~_4577;
    int _4725 = _4723 + _4689;
    int _4727 = _4725 + 1;
    int _4729 = _4021 * _4713;
    int _4731 = _4729 + _4171;
    bool _4733 = !_4719;
    int _4735 = _4733 ? 0 : (-1);
    float _4737 = fma(_4721, _2767, -0.5);
    bool _4739 = _4021 == 0;
    int _4741 = _3897 * _4727;
    int _4743 = _4741 + _4251;
    int _4745 = ~_4563;
    int _4747 = _4745 + _4677;
    int _4749 = _4747 + 1;
    bool _4751 = !_4739;
    int _4753 = _4751 ? _4731 : (-1);
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4757 = _3897 == 0;
    bool _4759 = !_4681;
    int _4761 = _4759 ? 0 : (-1);
    int _4763 = _4127 ^ _3717;
    bool _4765 = uint(_4685) >= uint(_4303);
    int _4767 = _3665 * _4749;
    int _4769 = _4767 + _4223;
    bool _4771 = !_4757;
    int _4773 = _4771 ? _4743 : (-1);
    bool _4775 = _4021 == 0;
    int _4777 = _4171 ^ _4021;
    float _4779 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4781 = uint(int(uint(_4763) >> uint(31)));
    float _4783 = _4707 * _4755;
    bool _4785 = !_4765;
    int _4787 = _4785 ? 0 : (-1);
    float _4789 = _4779 * _4701;
    bool _4791 = _3717 == 0;
    float _4793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4795 = uint(int(uint(_4777) >> uint(31)));
    int _4797 = ~_4761;
    int _4799 = _4627 + _4797;
    int _4801 = _4799 + 1;
    out.m_79.x = _4789;
    out.m_79.y = _4783;
    int _4803 = ~int(_4781);
    int _4805 = _4803 + 1;
    bool _4807 = !_4791;
    int _4809 = _4807 ? _4717 : (-1);
    float _4811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4813 = _3665 == 0;
    int _4815 = ~_4705;
    int _4817 = _4629 + _4815;
    int _4819 = _4817 + 1;
    int _4821 = ~int(_4795);
    int _4823 = _4821 + 1;
    int _4825 = _4801 ^ _4805;
    float _4827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4829 = !_4813;
    int _4831 = _4829 ? _4769 : (-1);
    int _4833 = _4819 ^ _4823;
    bool _4835 = _3717 == 0;
    int _4837 = ~_4805;
    int _4839 = _4837 + _4825;
    int _4841 = _4839 + 1;
    float _4843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4845 = ~_4823;
    int _4847 = _4845 + _4833;
    int _4849 = _4847 + 1;
    float _4851 = _4811 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4853 = !_4835;
    int _4855 = _4853 ? _4841 : (-1);
    bool _4857 = _3665 == 0;
    float _4859 = fma(_4851, _1637, -0.5);
    int _4861 = _4223 ^ _3665;
    float _4863 = float(_4809);
    bool _4865 = !_4775;
    int _4867 = _4865 ? _4849 : (-1);
    float _4869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4871 = _3897 == 0;
    float _4873 = fma(_4679, _4863, _3403);
    int _4875 = _4251 ^ _3897;
    float _4877 = _4793 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4879 = float(_4831);
    float _4881 = fma(_4469, _4691, _4873);
    uint _4883 = uint(int(uint(_4875) >> uint(31)));
    float _4885 = fma(_4877, _1697, -0.5);
    int _4887 = ~_4735;
    int _4889 = _4649 + _4887;
    int _4891 = _4889 + 1;
    float _4893 = fma(_4877, _4879, _3907);
    int _4895 = ~int(_4883);
    int _4897 = _4895 + 1;
    float _4899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4901 = float(_4753);
    float _4903 = fma(_4471, _4885, _4893);
    int _4905 = _4891 ^ _4897;
    uint _4907 = uint(int(uint(_4861) >> uint(31)));
    float _4909 = fma(_4851, _4901, _3845);
    float _4911 = float(_4773);
    float _4913 = _4827 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4915 = ~_4897;
    int _4917 = _4915 + _4905;
    int _4919 = _4917 + 1;
    float _4921 = fma(_3593, _4859, _4909);
    int _4923 = ~_4787;
    int _4925 = _4661 + _4923;
    int _4927 = _4925 + 1;
    float _4929 = fma(_4913, _2415, -0.5);
    int _4931 = ~int(_4907);
    int _4933 = _4931 + 1;
    float _4935 = fma(_4913, _4911, _3581);
    float _4937 = float(_4855);
    float _4939 = _4899 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4941 = !_4871;
    int _4943 = _4941 ? _4919 : (-1);
    float _4945 = fma(_3451, _4929, _4935);
    int _4947 = _4927 ^ _4933;
    float _4949 = -_2885;
    float _4951 = fma(_4721, _4937, _4949);
    float _4953 = float(_4867);
    float _4955 = _4843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4957 = float(_4943);
    float _4959 = _4869 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4961 = ~_4933;
    int _4963 = _4961 + _4947;
    int _4965 = _4963 + 1;
    float _4967 = fma(_4955, _2777, -0.5);
    float _4969 = -_3861;
    float _4971 = fma(_4955, _4953, _4969);
    float _4973 = fma(_4939, _2795, -0.5);
    bool _4975 = !_4857;
    int _4977 = _4975 ? _4965 : (-1);
    float _4979 = -_3585;
    float _4981 = fma(_4939, _4957, _4979);
    float _4983 = fma(_4449, _4737, _4951);
    float _4985 = fma(_4047, _4967, _4971);
    float _4987 = float(_4977);
    float _4989 = fma(_3535, _4973, _4981);
    float _4991 = fma(_4959, _2791, -0.5);
    float _4993 = _4903 + 0.5;
    float _4995 = _4521 + 0.5;
    float _4997 = -_3941;
    float _4999 = fma(_4959, _4987, _4997);
    float _5001 = _4989 + 0.5;
    float _5003 = _4487 + 0.5;
    float _5005 = in.m_81.x;
    float _5007 = in.m_81.y;
    float _5009 = in.m_81.z;
    float _5011 = fma(_4467, _4991, _4999);
    float _5013 = _4881 + 0.5;
    float _5015 = _4921 + 0.5;
    float _5017 = _4983 + 0.5;
    float _5019 = _5011 + 0.5;
    float _5021 = _4985 + 0.5;
    float _5023 = _4945 + 0.5;
    bool _5025 = !_3739;
    int _5027 = _5025 ? 0 : 1;
    out.m_83.x = _4995;
    out.m_83.y = _5003;
    bool _5029 = !_3743;
    int _5031 = _5029 ? 0 : 1;
    int _5033 = abs(_5027);
    out.m_85.x = _5013;
    out.m_85.y = _5017;
    out.m_85.z = _5015;
    out.m_85.w = _5021;
    int _5035 = abs(_5031);
    bool _5037 = !_3747;
    int _5039 = _5037 ? 0 : 1;
    out.m_87.x = _4993;
    out.m_87.y = _5019;
    float _5041 = float(_5033);
    out.m_89.x = _5023;
    out.m_89.y = _5001;
    float _5043 = float(_3853);
    float _5045 = _4885;
    float _5047 = as_type<float>(_4685);
    float _5049 = as_type<float>(_4713);
    float _5051 = _4521;
    if (_3441)
    {
        return out;
    }
    float _5053 = -_3601;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3081);
    float _5057 = _5041 * _5043;
    float _5059 = float(_2957);
    float _5061 = -_3597;
    float _5063 = fma(_5061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2869);
    float _5065 = float(_5035);
    float _5067 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5069 = _5055 + _5067;
    float _5071 = _5057 * (-2.0);
    float _5073 = -_4231;
    float _5075 = fma(_5073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3283);
    float _5077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5079 = _5063 + _5077;
    float _5081 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5083 = _5065 * _5059;
    float _5085 = _1471 + (-0.5);
    float _5087 = fma(_5071, _5005, _5005);
    float _5089 = _1166 + _1481;
    float _5091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5093 = _5075 + _5091;
    float _5095 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5081);
    float _5097 = fma(_5085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5087);
    float _5099 = _5089 + (-1.0);
    float _5101 = _5083 * (-2.0);
    float _5103 = fma(_5093, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5095);
    float _5105 = _1166 + (-0.5);
    float _5107 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5109 = fma(_5101, _5007, _5007);
    float _5111 = fma(_3467, _5071, _3467);
    bool _5113 = _5103 >= 0.0;
    float _5115 = fma(_5107, _5101, _5107);
    float _5117 = fma(_5105, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5109);
    float _5119 = fma(_5111, _4511, _5097);
    int _5121 = abs(_5039);
    float _5123 = sqrt(_4293);
    float _5125 = fma(_5115, _4511, _5117);
    float _5127 = _5119 * 0.15915493667125701904296875;
    float _5129 = _1471 + _1481;
    float _5131 = _5125 * 0.15915493667125701904296875;
    float _5133 = float(_3339);
    float _5135 = _5101;
    float _5137 = _5083;
    if (_5113)
    {
        _5135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5139 = _5135;
    float _5141 = _5127 * 6.283185482025146484375;
    float _5143 = sin(_5141);
    float _5145 = float(_5121);
    int _5147 = as_type<int>(_5139);
    if (_5113)
    {
        out.m_53.x = 0.0;
    }
    if (_5113)
    {
        float _5149 = _5139 * 5.0;
        _5147 = as_type<int>(_5149);
    }
    int _5151 = _5147;
    float _5153 = _5145 * _5133;
    float _5155 = _5129 + (-1.0);
    float _5157 = _5127 * 6.283185482025146484375;
    float _5159 = cos(_5157);
    if (_5113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14265 = as_type<float>(_5151);
        out.gl_Position.z = _14265;
    }
    float _5161 = _5153 * (-2.0);
    float _5163 = _5131 * 6.283185482025146484375;
    float _5165 = sin(_5163);
    if (_5113)
    {
        return out;
    }
    float _5167 = -_3081;
    float _5169 = _5167 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5171 = -_2869;
    float _5173 = _5171 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5175 = fma(_5161, _5009, _5009);
    float _5177 = -_3283;
    float _5179 = _5177 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5181 = _5169 * _5169;
    float _5183 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5185 = _1481 + (-0.5);
    float _5187 = _5131 * 6.283185482025146484375;
    float _5189 = cos(_5187);
    float _5191 = fma(_5173, _5173, _5181);
    float _5193 = fma(_5183, _5161, _5183);
    float _5195 = fma(_5185, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5175);
    float _5197 = _3563 * _5123;
    float _5199 = fma(_5179, _5179, _5191);
    float _5201 = _5143 * _5165;
    float _5203 = fma(_5193, _4511, _5195);
    float _5205 = rsqrt(_5199);
    float _5207 = _5203 * 0.15915493667125701904296875;
    float _5209 = in.m_91.x;
    float _5211 = in.m_91.y;
    float _5213 = in.m_91.z;
    float _5215 = _5159 * _5189;
    float _5217 = _5143 * _5189;
    float _5219 = _5207 * 6.283185482025146484375;
    float _5221 = sin(_5219);
    float _5223 = _5173 * _5205;
    float _5225 = _5179 * _5205;
    float _5227 = _5169 * _5205;
    float _5229 = _5207 * 6.283185482025146484375;
    float _5231 = cos(_5229);
    float _5233 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5235 = _5223 * _5233;
    float _5237 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5239 = _5225 * _5237;
    float _5241 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5243 = _5227 * _5241;
    float _5245 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5247 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5249 = -_5235;
    float _5251 = fma(_5225, _5247, _5249);
    float _5253 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5255 = -_5239;
    float _5257 = fma(_5227, _5253, _5255);
    float _5259 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5261 = -_5243;
    float _5263 = fma(_5223, _5259, _5261);
    float _5265 = fma(_5221, _5215, _5201);
    float _5267 = _5251 * _5251;
    float _5269 = fma(_5221, _5201, _5215);
    float _5271 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5273 = fma(_5257, _5257, _5267);
    float _5275 = _5159 * _5165;
    float _5277 = _5197 * _5271;
    float _5279 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5281 = fma(_5263, _5263, _5273);
    float _5283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5211);
    float _5285 = _5159 * _5231;
    float _5287 = _5189 * _5231;
    float _5289 = rsqrt(_5281);
    float _5291 = _5283 * _5277;
    float _5293 = _5197 * _5245;
    float _5295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5209);
    float _5297 = _5143 * _5231;
    float _5299 = _5165 * _5231;
    float _5301 = _5197 * _5279;
    float _5303 = _5295 * _5293;
    float _5305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5213);
    float _5307 = _5285 * _5291;
    float _5309 = -_5275;
    float _5311 = fma(_5221, _5217, _5309);
    float _5313 = -_5217;
    float _5315 = fma(_5221, _5275, _5313);
    float _5317 = _5305 * _5301;
    float _5319 = fma(_5265, _5303, _5307);
    float _5321 = _5297 * _5291;
    float _5323 = _5257 * _5289;
    float _5325 = _5251 * _5289;
    float _5327 = _5263 * _5289;
    float _5329 = -_5291;
    float _5331 = _5221 * _5329;
    float _5333 = _5227 * _5323;
    float _5335 = _5225 * _5325;
    float _5337 = fma(_5315, _5317, _5319);
    float _5339 = fma(_5287, _5303, _5331);
    float _5341 = -_5333;
    float _5343 = fma(_5223, _5325, _5341);
    float _5345 = -_5335;
    float _5347 = fma(_5227, _5327, _5345);
    float _5349 = fma(_5311, _5303, _5321);
    float _5351 = fma(_5299, _5317, _5339);
    float _5353 = _5343 * _5337;
    float _5355 = _5347 * _5337;
    float _5357 = fma(_5269, _5317, _5349);
    float _5359 = fma(_5327, _5351, _5353);
    float _5361 = fma(_5323, _5351, _5355);
    float _5363 = fma(_5225, _5357, _5359);
    float _5365 = fma(_5223, _5357, _5361);
    float _5367 = _3283 + _5363;
    float _5369 = _2869 + _5365;
    float _5371 = _5223 * _5327;
    float _5373 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5375 = _5367 + _5373;
    float _5377 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5379 = _5369 + _5377;
    float _5381 = -_5371;
    float _5383 = fma(_5225, _5323, _5381);
    float _5385 = _5375 * _5375;
    float _5387 = _5379 * _5379;
    float _5389 = _5383 * _5337;
    float _5391 = _5387 + _5385;
    float _5393 = fma(_5325, _5351, _5389);
    float _5395 = sqrt(_5391);
    float _5397 = fma(_5227, _5357, _5393);
    float _5399 = _3081 + _5397;
    bool _5401 = _5395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5403 = _5369;
    float _5405 = _5367;
    float _5407 = _5387;
    float _5409 = _5385;
    if (!_5401)
    {
        _5045 = _5399;
    }
    float _5411 = _5045;
    bool _5413 = !_5401;
    float _5415 = _5411;
    if (!_5413)
    {
        float _5417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5421 = _5395 + _5419;
        float _5423 = rsqrt(_5391);
        float _5425 = _5421 * _5417;
        float _5427 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5429 = _5425 * 0.15915493667125701904296875;
        float _5431 = _5429 * 6.283185482025146484375;
        float _5433 = sin(_5431);
        float _5435 = _5429 * 6.283185482025146484375;
        float _5437 = cos(_5435);
        float _5439 = fma(_5433, _5427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5441 = _5423 * _5439;
        float _5443 = _5437 + (-1.0);
        float _5445 = fma(_5379, _5441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5447 = fma(_5375, _5441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5449 = _5443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5453 = _5445 + _5451;
        float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5457 = _5447 + _5455;
        float _5459 = fma(_5399, _5437, _5449);
        float _5461 = _5453 * _5453;
        float _5463 = _5457 * _5457;
        _5403 = _5445;
        _5405 = _5447;
        _5415 = _5459;
        _5407 = _5461;
        _5409 = _5463;
    }
    float _5465 = _5403;
    float _5467 = _5405;
    float _5469 = _5415;
    float _5471 = _5407;
    float _5473 = _5409;
    float _5475 = fma(_5465, 6.2500002968590706586837768554688e-05, 0.5);
    float _5477 = fma(_5467, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14758 = float2(_5475, _5477);
    float3 _5481 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14758, float2(0.0), isnan(_14758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14758, float2(0.0), isnan(_14758)), level(0.0)).xyz;
    float _5483 = _5481.x;
    float _5485 = _5481.y;
    float _5487 = _5481.z;
    float _5489 = in.m_93.x;
    float _5491 = in.m_93.y;
    float _5493 = in.m_93.z;
    bool _5495 = _5211 != 0.0;
    bool _5497 = isnan(_5211);
    bool _5499 = _5495 || _5497;
    bool _5501 = isnan(0.0);
    bool _5503 = _5499 || _5501;
    float _5505 = in.m_95.x;
    float _5507 = in.m_95.y;
    float _5509 = in.m_95.z;
    float _5511 = in.m_95.w;
    bool _5513 = _5209 == 0.0;
    bool _5515 = !_5503;
    bool _5517 = _5513 && _5515;
    bool _5519 = _5213 == 0.0;
    bool _5521 = _5519 && _5517;
    float _5523 = _5489;
    if (_5521)
    {
        _5137 = _5489;
    }
    float _5525 = _5137;
    float _5527 = _5525;
    if (_5521)
    {
        _2951 = _5493;
    }
    float _5529 = _2951;
    float _5531 = _5529;
    if (_5521)
    {
        _5047 = _5491;
    }
    float _5533 = _5047;
    float _5535 = _5533;
    if (_5521)
    {
        _5049 = _5525;
    }
    float _5537 = _5049;
    float _5539 = _5537;
    if (!_5521)
    {
        _5527 = _5489;
    }
    float _5541 = _5527;
    if (_5521)
    {
        _5051 = _5529;
    }
    float _5543 = _5051;
    float _5545 = _5543;
    if (!_5521)
    {
        _5531 = _5493;
    }
    float _5547 = _5531;
    if (!_5521)
    {
        float _5549 = fma(_5209, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5541);
        _5539 = _5549;
    }
    float _5551 = _5539;
    if (_5521)
    {
        _5523 = _5533;
    }
    float _5553 = _5523;
    float _5555 = _5509 * _5541;
    float _5557 = _5553;
    if (!_5521)
    {
        _5535 = _5491;
    }
    float _5559 = _5535;
    float _5561 = _5507 * _5547;
    if (!_5521)
    {
        float _5563 = fma(_5213, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5547);
        _5545 = _5563;
    }
    float _5565 = _5545;
    float _5567 = -_5555;
    float _5569 = fma(_5505, _5547, _5567);
    float _5571 = _5285 * _5383;
    float _5573 = _5505 * _5559;
    float _5575 = -_5561;
    float _5577 = fma(_5509, _5559, _5575);
    if (!_5521)
    {
        float _5579 = fma(_5211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5559);
        _5557 = _5579;
    }
    float _5581 = _5557;
    float _5583 = _5265 * _5347;
    float _5585 = -_5573;
    float _5587 = fma(_5507, _5541, _5585);
    float _5589 = _5265 * _5383;
    float _5591 = _5265 * _5343;
    float _5593 = _5285 * _5347;
    float _5595 = _5569 * _5511;
    float _5597 = _5577 * _5511;
    float _5599 = _5285 * _5343;
    float _5601 = _5587 * _5511;
    float _5603 = _5315 * _5347;
    float _5605 = _5315 * _5383;
    float _5607 = _5315 * _5343;
    float _5609 = fma(_5287, _5323, _5583);
    float _5611 = fma(_5287, _5325, _5589);
    float _5613 = -_5221;
    float _5615 = fma(_5613, _5325, _5571);
    float _5617 = fma(_5287, _5327, _5591);
    float _5619 = -_5221;
    float _5621 = fma(_5619, _5323, _5593);
    float _5623 = -_5221;
    float _5625 = fma(_5623, _5327, _5599);
    float _5627 = fma(_5299, _5323, _5603);
    float _5629 = fma(_5299, _5325, _5605);
    float _5631 = fma(_5299, _5327, _5607);
    float _5633 = fma(_5297, _5227, _5615);
    float _5635 = fma(_5311, _5223, _5609);
    float _5637 = fma(_5297, _5223, _5621);
    float _5639 = fma(_5297, _5225, _5625);
    float _5641 = fma(_5269, _5223, _5627);
    float _5643 = fma(_5269, _5227, _5629);
    float _5645 = fma(_5269, _5225, _5631);
    float _5647 = fma(_5311, _5227, _5611);
    float _5649 = _5633 * _5507;
    float _5651 = _5633 * _5581;
    float _5653 = fma(_5311, _5225, _5617);
    float _5655 = _5637 * _5581;
    float _5657 = _5595 * _5637;
    float _5659 = _5595 * _5633;
    float _5661 = _5639 * _5507;
    float _5663 = _5639 * _5581;
    float _5665 = _5595 * _5639;
    float _5667 = fma(_5647, _5505, _5649);
    float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5671 = _5469 + _5669;
    float _5673 = _5637 * _5507;
    float _5675 = fma(_5635, _5551, _5655);
    float _5677 = fma(_5653, _5505, _5661);
    float _5679 = fma(_5671, _5671, _5471);
    float _5681 = fma(_5635, _5505, _5673);
    float _5683 = fma(_5597, _5635, _5657);
    float _5685 = fma(_5647, _5551, _5651);
    float _5687 = _5679 + _5473;
    float _5689 = fma(_5653, _5551, _5663);
    float _5691 = fma(_5597, _5647, _5659);
    float _5693 = fma(_5597, _5653, _5665);
    float _5695 = fma(_5641, _5509, _5681);
    float _5697 = fma(_5643, _5509, _5667);
    float _5699 = sqrt(_5687);
    float _5701 = fma(_5645, _5509, _5677);
    float _5703 = fma(_5641, _5565, _5675);
    float _5705 = fma(_5601, _5641, _5683);
    float _5707 = fma(_5601, _5643, _5691);
    float _5709 = fma(_5601, _5645, _5693);
    float _5711 = fma(_5643, _5565, _5685);
    float _5713 = fma(_5645, _5565, _5689);
    out.m_97.x = _5695;
    out.m_97.y = _5697;
    out.m_97.z = _5701;
    out.m_99.x = _5705;
    out.m_99.y = _5707;
    out.m_99.z = _5709;
    out.m_101.x = _5703;
    out.m_101.y = _5711;
    out.m_101.z = _5713;
    bool _5715 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5717 = isnan(_5699);
    bool _5719 = _5715 || _5717;
    bool _5721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5723 = _5719 || _5721;
    float _5725 = _5601;
    if (!_5723)
    {
        _5725 = 1.0;
    }
    float _5727 = _5725;
    out.m_103.x = _5483;
    out.m_103.y = _5485;
    out.m_103.z = _5487;
    bool _5729 = !_5723;
    float _5731 = _5727;
    if (!_5729)
    {
        bool _5733 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5735 = isnan(_5699);
        bool _5737 = _5733 || _5735;
        bool _5739 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5741 = _5737 || _5739;
        if (!_5741)
        {
            float _5743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5745 = _5699 + _5743;
            float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5749 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5747;
            float _5751 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5753 = _5751 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5755 = 1.0 / _5749;
            float _5757 = _5745 * _5755;
            float _5759 = fma(_5757, _5753, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5731 = _5759;
            _5761 = true;
        }
        else
        {
            bool _5763 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5765 = isnan(_5699);
            bool _5767 = _5763 || _5765;
            bool _5769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5771 = _5767 || _5769;
            if (!_5771)
            {
                float _5773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5775 = _5699 + _5773;
                float _5777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5779 = _5777 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5781 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5783 = _5781 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5785 = 1.0 / _5779;
                float _5787 = _5775 * _5785;
                float _5789 = fma(_5787, _5783, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5731 = _5789;
                _5761 = true;
            }
            else
            {
                _5731 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5761 = false;
    float _5791 = _5731;
    float _5793 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5795 = _5469 + _5793;
    float _5797 = _5055 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5799 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5801 = _5465 + _5799;
    float _5803 = fma(_5795, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5805 = fma(_5063, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5797);
    float _5807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5809 = _5467 + _5807;
    float _5811 = fma(_5801, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5813 = -_3081;
    float _5815 = _5813 + _5803;
    float _5817 = fma(_5075, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5805);
    float _5819 = fma(_5809, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5821 = -_2869;
    float _5823 = _5821 + _5811;
    float _5825 = _5815 * _5815;
    float _5827 = _5817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5829 = _5055 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5831 = -_3283;
    float _5833 = _5831 + _5819;
    float _5835 = fma(_5823, _5823, _5825);
    float _5837 = 1.0 / _5827;
    float _5839 = fma(_5063, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5829);
    float _5841 = fma(_5833, _5833, _5835);
    float _5843 = fma(_5075, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5839);
    float _5845 = sqrt(_5841);
    float _5847 = _5843 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5849 = _5847 + _5827;
    float _5851 = _5849 * _5837;
    float _5853 = _5851 * 0.5;
    bool _5855 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5857 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5859 = _5855 || _5857;
    bool _5861 = isnan(0.5);
    bool _5863 = _5859 || _5861;
    float _5865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5867 = fma(_5853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5865);
    bool _5869 = _5845 > 0.0;
    float _5871 = 1.0 / _5867;
    bool _5873 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5875 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5877 = _5873 || _5875;
    bool _5879 = isnan(0.5);
    bool _5881 = _5877 || _5879;
    float _5883 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5885 = _5853;
    float _5887 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5889 = _5841;
    float _5891 = _5819;
    float _5893 = _5811;
    if (!_5869)
    {
        _5883 = _5811;
    }
    float _5895 = _5883;
    float _5897 = _5895;
    if (!_5869)
    {
        _5885 = _5803;
    }
    float _5899 = _5885;
    float _5901 = _5899;
    float _5903 = _5899;
    if (!_5869)
    {
        _5887 = _5819;
    }
    float _5905 = _5887;
    bool _5907 = !_5869;
    float _5909 = _5905;
    if (!_5907)
    {
        float _5911 = _230 * _230;
        float _5913 = rsqrt(_5841);
        float _5915 = fma(_226, _226, _5911);
        float _5917 = fma(_232, _232, _5915);
        float _5919 = sqrt(_5917);
        float _5921 = _5823 * _5913;
        float _5923 = _5815 * _5913;
        float _5925 = _5833 * _5913;
        bool _5927 = _5919 > 0.0;
        float _5929 = _5919;
        float _5931 = _5913;
        if (!_5927)
        {
            _5929 = _5811;
        }
        float _5933 = _5929;
        _5897 = _5933;
        if (!_5927)
        {
            _5901 = _5803;
        }
        float _5935 = _5901;
        _5903 = _5935;
        if (!_5927)
        {
            _5931 = _5819;
        }
        float _5937 = _5931;
        bool _5939 = !_5927;
        _5909 = _5937;
        if (!_5939)
        {
            float _5941 = rsqrt(_5917);
            float _5943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5945 = _230 * _5941;
            float _5947 = _226 * _5941;
            float _5949 = _232 * _5941;
            float _5951 = _5923 * _5945;
            float _5953 = fma(_5921, _5947, _5951);
            float _5955 = _5943 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5957 = fma(_5925, _5949, _5953);
            float _5959 = _5957 * _5955;
            float _5961 = fma(_226, _5959, _5811);
            float _5963 = fma(_230, _5959, _5803);
            float _5965 = fma(_232, _5959, _5819);
            _5903 = _5963;
            _5909 = _5965;
            _5897 = _5961;
            _5889 = _5943;
        }
    }
    float _5967 = _5903;
    float _5969 = _5909;
    float _5971 = _5897;
    float _5973 = _5889;
    float _5975 = -_3601;
    float _5977 = fma(_5975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5967);
    float _5979 = -_4231;
    float _5981 = fma(_5979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5969);
    float _5983 = -_3597;
    float _5985 = fma(_5983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5971);
    float _5987 = _5973;
    float _5989 = _5985;
    float _5991 = _5981;
    if (_5863)
    {
        _5987 = 1.0;
    }
    float _5993 = _5987;
    float _5995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5997 = _5871 * _5995;
    float _5999 = _5993;
    if (_5881)
    {
        _4507 = _5977;
    }
    float _6001 = _4507;
    float _6003 = _6001;
    if (!_5881)
    {
        float _6005 = _5069 * _5069;
        float _6007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6009 = -_3283;
        float _6011 = _6009 + _5969;
        float _6013 = -_3081;
        float _6015 = _6013 + _5967;
        float _6017 = fma(_5079, _5079, _6005);
        float _6019 = fma(_5093, _5093, _6017);
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6023 = sqrt(_6019);
        float _6025 = 1.0 / _5197;
        float _6027 = _6021 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6029 = precise::min(_6023, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6031 = _6029 * _6007;
        float _6033 = _6031 * _6025;
        float _6035 = -_2869;
        float _6037 = _6035 + _5971;
        float _6039 = _6027 * _6033;
        float _6041 = _6011 * _6033;
        float _6043 = fma(_6015, _6039, _5055);
        float _6045 = fma(_6037, _6039, _5063);
        float _6047 = fma(_6027, _6041, _5075);
        _6003 = _6043;
        _5989 = _6045;
        _5991 = _6047;
        _236 = _6007;
    }
    float _6049 = _6003;
    float _6051 = _5989;
    float _6053 = _5991;
    float _6055 = _236;
    float _6057 = _6055;
    if (!_5863)
    {
        float _6059 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6061 = _6059 * 0.15915493667125701904296875;
        float _6063 = _6061 * 6.283185482025146484375;
        float _6065 = cos(_6063);
        float _6067 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6069 = _6067 * 0.15915493667125701904296875;
        float _6071 = _6061 * 6.283185482025146484375;
        float _6073 = sin(_6071);
        float _6075 = 1.0 / _6065;
        float _6077 = _6069 * 6.283185482025146484375;
        float _6079 = cos(_6077);
        float _6081 = _6073 * _6075;
        float _6083 = _6069 * 6.283185482025146484375;
        float _6085 = sin(_6083);
        float _6087 = _6079 * _6081;
        float _6089 = 1.0 / _6087;
        float _6091 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6093 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6091;
        float _6095 = 1.0 / _6093;
        float _6097 = _6085 * _6089;
        float _6099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6101 = fma(_5997, _6097, _6099);
        float _6103 = _6101 * _6095;
        float _6105 = precise::clamp(_6103, 0.0, 1.0);
        _5999 = _6105;
    }
    float _6107 = _5999;
    float _6109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6111 = _6049 + _6109;
    float _6113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6115 = _6051 + _6113;
    float _6117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6119 = _6053 + _6117;
    float _6121 = _6111 * _6111;
    float _6123 = fma(_6115, _6115, _6121);
    float _6125 = fma(_6119, _6119, _6123);
    float _6127 = rsqrt(_6125);
    float _6129 = sqrt(_6125);
    float _6131 = _6127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6133 = _6115 * _6131;
    float _6135 = _6119 * _6131;
    float _6137 = _6133 * _6133;
    float _6139 = _6135 * _6135;
    float _6141 = _6137 + _6139;
    float _6143 = sqrt(_6141);
    bool _6145 = _6143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6149 = _6143 + _6147;
    float _6151 = _6127;
    float _6153 = _6141;
    float _6155 = _6149;
    float _6157 = _6111;
    if (_6145)
    {
        float _6159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6151 = _6159;
    }
    float _6161 = _6151;
    if (_6145)
    {
        float _6163 = rsqrt(_6141);
        _6153 = _6163;
    }
    float _6165 = _6153;
    float _6167 = _6165;
    if (_6145)
    {
        float _6169 = _6149 * _6161;
        _6155 = _6169;
    }
    float _6171 = _6155;
    if (_6145)
    {
        float _6173 = _6171 * 0.15915493667125701904296875;
        _5891 = _6173;
    }
    float _6175 = _5891;
    float _6177 = _6119;
    if (_6145)
    {
        float _6179 = _6175 * 6.283185482025146484375;
        float _6181 = sin(_6179);
        _6177 = _6181;
    }
    float _6183 = _6177;
    float _6185 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6187 = precise::max(0.0, _6185);
    float _6189 = _6161;
    if (_6145)
    {
        float _6191 = _6175 * 6.283185482025146484375;
        float _6193 = cos(_6191);
        _6189 = _6193;
    }
    float _6195 = _6189;
    float _6197 = -_6131;
    float _6199 = -_6187;
    float _6201 = fma(_6111, _6197, _6199);
    float _6203 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6145)
    {
        float _6205 = _6201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6157 = _6205;
    }
    float _6207 = _6157;
    float _6209 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6211 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6213 = _6207;
    float _6215 = _6183;
    if (_6145)
    {
        float _6217 = fma(_6183, _6207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6213 = _6217;
    }
    float _6219 = _6213;
    float _6221 = _6219;
    if (!_6145)
    {
        _6215 = _6133;
    }
    float _6223 = _6215;
    float _6225 = _6223;
    float _6227 = _6195;
    if (_6145)
    {
        float _6229 = _6195 + (-1.0);
        _6203 = _6229;
    }
    float _6231 = _6203;
    float _6233 = _6231;
    if (_6145)
    {
        float _6235 = _6165 * _6219;
        _5893 = _6235;
    }
    float _6237 = _5893;
    if (!_6145)
    {
        _6221 = _6201;
    }
    float _6239 = _6221;
    float _6241 = _6239;
    if (_6145)
    {
        float _6243 = _6231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6057 = _6243;
    }
    float _6245 = _6057;
    if (_6145)
    {
        float _6247 = _6133 * _6237;
        _6225 = _6247;
    }
    float _6249 = _6225;
    if (!_6145)
    {
        _6233 = _6135;
    }
    float _6251 = _6233;
    float _6253 = _6251;
    if (_6145)
    {
        float _6255 = _6135 * _6237;
        _6253 = _6255;
    }
    float _6257 = _6253;
    if (!_6145)
    {
        _6167 = _6137;
    }
    float _6259 = _6167;
    float _6261 = _6259;
    if (_6145)
    {
        float _6263 = fma(_6201, _6195, _6245);
        _6241 = _6263;
    }
    float _6265 = _6241;
    if (_6145)
    {
        float _6267 = _6249 * _6249;
        _6261 = _6267;
    }
    float _6269 = _6261;
    if (!_6145)
    {
        _6227 = _6139;
    }
    float _6271 = _6227;
    float _6273 = _6271;
    if (_6145)
    {
        float _6275 = _6257 * _6257;
        _6273 = _6275;
    }
    float _6277 = _6273;
    float _6279 = fma(_6265, _6265, _6269);
    float _6281 = floor(_6211);
    float _6283 = _6279 + _6277;
    float _6285 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6209);
    float _6287 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6289 = fma(_6129, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6287);
    float _6291 = precise::clamp(_6289, 0.0, 1.0);
    float _6293 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6285);
    float _6295 = rsqrt(_6283);
    float _6297 = -_6291;
    float _6299 = _6297 + 1.0;
    float _6301 = _6293 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6303 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6305 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6307 = _6301 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6309 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6311 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6313 = abs(_6299);
    float _6315 = log2(_6313);
    float _6317 = -_6307;
    float _6319 = fma(_6317, _6303, 1.0);
    float _6321 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6323 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6305);
    float _6325 = -_6281;
    float _6327 = _6211 + _6325;
    float _6329 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6321);
    float _6331 = _6295 * _6249;
    float _6333 = floor(_6309);
    float _6335 = _6295 * _6265;
    float _6337 = _6295 * _6257;
    float _6339 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6311);
    float _6341 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6329);
    float _6343 = _6331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6345 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6323);
    float _6347 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6339);
    float _6349 = _6341 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6351 = -_6343;
    float _6353 = fma(_6335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6351);
    float _6355 = _6315 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6357 = _6347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6359 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6361 = -_6337;
    float _6363 = fma(_6361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6353);
    float _6365 = _6345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6367 = exp2(_6355);
    float _6369 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6359);
    float _6371 = fma(_6363, -0.5, 0.5);
    float _6373 = fma(_6363, 0.5, 0.5);
    float _6375 = -_6333;
    float _6377 = _6309 + _6375;
    float _6379 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6369);
    float _6381 = fma(_6373, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6383 = log2(_6319);
    float _6385 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6379);
    float _6387 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6389 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6391 = fma(_6373, _6381, -0.212114393711090087890625);
    float _6393 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6387);
    float _6395 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6389);
    float _6397 = sqrt(_6371);
    float _6399 = fma(_6373, _6391, 1.570728778839111328125);
    float _6401 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6393);
    float _6403 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6395);
    float _6405 = 1.0 / _6385;
    float _6407 = _6335 + 1.0;
    float _6409 = _6383 * 0.693147182464599609375;
    float _6411 = -_6335;
    float _6413 = fma(_6367, _6407, _6411);
    float _6415 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6401);
    float _6417 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6403);
    float _6419 = _6397 * 0.636619746685028076171875;
    float _6421 = fma(_6413, 0.5, 0.5);
    float _6423 = -_6399;
    float _6425 = fma(_6419, _6423, 1.0);
    float _6427 = _6409 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16334 = float2(_6327, _6377);
    float _6429 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16334, float2(0.0), isnan(_16334)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16334, float2(0.0), isnan(_16334)), level(0.0)).x;
    float _6431 = _6415 * _6405;
    float _6433 = _6417 * _6405;
    float _6435 = fma(_6431, 0.5, 0.5);
    float _6437 = fma(_6433, -0.5, 0.5);
    float3 _16353 = float3(_6435, _6437, _6427);
    float _6439 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16353, float3(0.0), isnan(_16353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16353, float3(0.0), isnan(_16353)), level(0.0)).x;
    float3 _16364 = float3(_6435, _6437, _6427);
    float4 _6442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16364, float3(0.0), isnan(_16364)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16364, float3(0.0), isnan(_16364)), level(0.0)).xyzw;
    float _6444 = _6442.x;
    float _6446 = _6442.y;
    float _6448 = _6442.z;
    float _6450 = _6442.w;
    float2 _16380 = float2(_6425, _6421);
    float3 _6452 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16380, float2(0.0), isnan(_16380)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16380, float2(0.0), isnan(_16380)), level(0.0)).xyz;
    float _6454 = _6452.x;
    float _6456 = _6452.y;
    float _6458 = _6452.z;
    float _6460 = abs(_5997);
    float _6462 = log2(_6460);
    float _6464 = _6315 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6466 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6468 = isnan(_6129);
    bool _6470 = _6466 || _6468;
    bool _6472 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6474 = _6470 || _6472;
    float _6476 = exp2(_6464);
    float _6478 = _6462 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6480 = exp2(_6478);
    float _6482 = in.m_105.x;
    float _6484 = -_6476;
    float _6486 = _6484 + 1.0;
    float _6488 = _6486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6490 = fma(_6480, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6492 = precise::clamp(_6490, 0.0, 1.0);
    float _6494 = fma(_6492, -2.0, 3.0);
    float _6496 = _6492 * _6492;
    float _6498 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6500 = _6496 * _6494;
    float _6502 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6498);
    float _6504 = -_6500;
    float _6506 = _6504 + 1.0;
    float _6508 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6502);
    float _6510 = fma(_6506, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6500);
    bool _6512 = _5997 <= 8000.0;
    bool _6514 = isnan(_5997);
    bool _6516 = _6512 || _6514;
    bool _6518 = isnan(8000.0);
    bool _6520 = _6516 || _6518;
    float _6522 = float(_6520);
    float _6524 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6508);
    float _6526 = _6385 * 0.5;
    float _6528 = _6415 + _6385;
    float _6530 = _6522 * _6510;
    float _6532 = fma(_6417, -0.5, _6526);
    out.gl_Position.x = _6415;
    out.gl_Position.y = _6417;
    out.gl_Position.z = _6524;
    out.gl_Position.w = _6385;
    float _6534 = _6524 + _6385;
    float _6536 = _6530 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6538 = _6528 * 0.5;
    float _6540 = _6534 * 0.5;
    out.m_107.x = _6538;
    out.m_107.y = _6532;
    out.m_107.z = _6540;
    out.m_107.w = _6385;
    float _6542 = -_6488;
    float _6544 = _6542 + 1.0;
    float _6546 = _6385;
    float _6548 = _6524;
    float _6550 = _6417;
    float _6552 = _6532;
    float _6554 = _6538;
    float _6556 = _6544;
    if (!_6474)
    {
        _6546 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6558 = _6546;
    float _6560 = _6558;
    float _6562 = _6558;
    if (!_6474)
    {
        _6548 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6564 = _6548;
    float _6566 = _6564;
    float _6568 = _6564;
    if (!_6474)
    {
        _6550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6570 = _6550;
    float _6572 = _6107 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6574 = _6570;
    float _6576 = _6570;
    if (!_6474)
    {
        _6552 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6578 = _6552;
    float _6580 = _6578;
    float _6582 = _6578;
    if (!_6474)
    {
        _6554 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6584 = _6554;
    float _6586 = -_6429;
    float _6588 = _6586 + 1.0;
    float _6590 = _6588 * _6536;
    float _6592 = precise::clamp(_6590, 0.0, 1.0);
    float _6594 = -_6592;
    float _6596 = fma(_6594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6598 = _6488 * _6439;
    float _6600 = _6596 * _6482;
    float _6602 = _6450 * _6598;
    float _6604 = _6458 * _6598;
    float _6606 = _6600 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6608 = fma(_6454, _6602, _6444);
    float _6610 = fma(_6456, _6602, _6446);
    float _6612 = _6450 * _6544;
    float _6614 = fma(_6450, _6604, _6448);
    out.m_109.x = _6606;
    float _6616 = _6584;
    float _6618 = _6584;
    if (!_6474)
    {
        _6556 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6620 = _6556;
    out.m_111.x = _6608;
    out.m_111.y = _6610;
    out.m_111.z = _6614;
    out.m_111.w = _6612;
    bool _6622 = !_6474;
    float _6624 = _6620;
    float _6626 = _6620;
    if (!_6622)
    {
        bool _6628 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6630 = isnan(_6129);
        bool _6632 = _6628 || _6630;
        bool _6634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6636 = _6632 || _6634;
        if (!_6636)
        {
            float _6638 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6640 = _6129 + _6638;
            float _6642 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6644 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6642;
            float _6646 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6648 = _6646 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6650 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6652 = _6650 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6654 = 1.0 / _6644;
            float _6656 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6658 = _6656 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6660 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6662 = _6660 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6664 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6666 = _6664 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6668 = _6640 * _6654;
            float _6670 = precise::clamp(_6668, 0.0, 1.0);
            float _6672 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6674 = _6672 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6676 = fma(_6670, _6648, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6678 = fma(_6670, _6652, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6680 = fma(_6670, _6674, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6682 = fma(_6670, _6658, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6684 = fma(_6670, _6662, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6686 = fma(_6670, _6666, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6576 = _6676;
            _6618 = _6684;
            _6568 = _6678;
            _6582 = _6682;
            _6626 = _6680;
            _6562 = _6686;
            _6688 = true;
        }
        else
        {
            bool _6690 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6692 = isnan(_6129);
            bool _6694 = _6690 || _6692;
            bool _6696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6698 = _6694 || _6696;
            if (!_6698)
            {
                _6580 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6700 = _6580;
            _6582 = _6700;
            if (!_6698)
            {
                _6616 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6702 = _6616;
            _6618 = _6702;
            if (!_6698)
            {
                _6560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6704 = _6560;
            _6562 = _6704;
            if (!_6698)
            {
                _6566 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6706 = _6566;
            _6568 = _6706;
            if (!_6698)
            {
                _6574 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6708 = _6574;
            _6576 = _6708;
            if (!_6698)
            {
                _6624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6710 = _6624;
            bool _6712 = !_6698;
            _6626 = _6710;
            if (!_6712)
            {
                bool _6714 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6716 = isnan(_6129);
                bool _6718 = _6714 || _6716;
                bool _6720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6722 = _6718 || _6720;
                if (!_6722)
                {
                    float _6724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6726 = _6129 + _6724;
                    float _6728 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6730 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6728;
                    float _6732 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6734 = _6732 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6738 = _6736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6740 = 1.0 / _6730;
                    float _6742 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6744 = _6742 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6746 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6748 = _6746 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6750 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6752 = _6750 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6754 = _6726 * _6740;
                    float _6756 = precise::clamp(_6754, 0.0, 1.0);
                    float _6758 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6760 = _6758 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6762 = fma(_6756, _6734, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6764 = fma(_6756, _6738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6766 = fma(_6756, _6760, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6768 = fma(_6756, _6744, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6770 = fma(_6756, _6748, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6772 = fma(_6756, _6752, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6576 = _6762;
                    _6618 = _6770;
                    _6568 = _6764;
                    _6582 = _6768;
                    _6626 = _6766;
                    _6562 = _6772;
                    _6688 = true;
                }
                else
                {
                    _6576 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6618 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6568 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6582 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6688 = false;
    float _6774 = _6576;
    float _6776 = _6618;
    float _6778 = _6568;
    float _6780 = _6582;
    float _6782 = _6626;
    float _6784 = _6562;
    float _6786 = _6572 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6788 = fma(_5711, -0.5, 0.5);
    float _6790 = precise::clamp(_6788, 0.0, 1.0);
    float _6792 = -_6774;
    float _6794 = _6776 + _6792;
    float _6796 = -_6778;
    float _6798 = _6780 + _6796;
    out.m_53.x = _6786;
    float _6800 = fma(_6790, _6794, _6774);
    float _6802 = -_6782;
    float _6804 = _6784 + _6802;
    float _6806 = fma(_6790, _6798, _6778);
    float _6808 = _6800 * 0.586610972881317138671875;
    bool _6810 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6812 = fma(_6790, _6804, _6782);
    out.m_113.x = 0.0;
    float _6814 = fma(_6806, 0.298911988735198974609375, _6808);
    bool _6816 = _6107 > 0.0;
    bool _6818 = isnan(_6107);
    bool _6820 = _6816 || _6818;
    bool _6822 = isnan(0.0);
    bool _6824 = _6820 || _6822;
    float _6826 = fma(_6812, 0.114477999508380889892578125, _6814);
    float _6828 = -_6826;
    float _6830 = _6806 + _6828;
    float _6832 = -_6826;
    float _6834 = _6800 + _6832;
    float _6836 = -_6826;
    float _6838 = _6812 + _6836;
    float _6840 = fma(_6830, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    float _6842 = fma(_6834, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    float _6844 = fma(_6838, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    bool _6846 = !_6810;
    if (!_6846)
    {
        float _6848 = -_6049;
        float _6850 = _6848 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6852 = -_6051;
        float _6854 = _6852 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6856 = -_6053;
        float _6858 = _6856 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6860 = _6850 * _6850;
        float _6862 = fma(_6854, _6854, _6860);
        float _6864 = fma(_6858, _6858, _6862);
        float _6866 = sqrt(_6864);
        float _6868 = rsqrt(_6864);
        float _6870 = -_6866;
        float _6872 = _6870 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6874 = _6872 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6876 = precise::clamp(_6874, 0.0, 1.0);
        float _6878 = _6854 * _6868;
        float _6880 = _6850 * _6868;
        float _6882 = abs(_6876);
        float _6884 = log2(_6882);
        float _6886 = _6858 * _6868;
        float _6888 = _6878 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6890 = _5711 * _6880;
        float _6892 = -_6880;
        float _6894 = -_6888;
        float _6896 = fma(_6892, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6894);
        float _6898 = fma(_5703, _6878, _6890);
        float _6900 = -_6886;
        float _6902 = fma(_6900, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6896);
        float _6904 = fma(_5713, _6886, _6898);
        float _6906 = precise::clamp(_6904, 0.0, 1.0);
        float _6908 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6910 = _6902 + _6908;
        float _6912 = _6884 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6914 = _6910 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6916 = precise::clamp(_6914, 0.0, 1.0);
        float _6918 = exp2(_6912);
        float _6920 = _6918 * _6916;
        float _6922 = _6906 * _6920;
        float _6924 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6926 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6928 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6924;
        out.m_113.y = _6926;
        out.m_113.z = _6928;
    }
    out.m_115.x = _6840;
    out.m_115.y = _6842;
    out.m_115.z = _6844;
    if (_6824)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _6930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6930;
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
    bool _6688 = false;
    bool _5761 = false;
    bool _1152 = false;
    bool _828 = false;
    bool _686 = false;
    bool _532 = false;
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
        float _6987 = as_type<float>(_150);
        out.gl_Position.z = _6987;
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
        float _7057 = as_type<float>(_188);
        out.gl_Position.z = _7057;
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
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = _264 + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _264 + _270;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = _264 + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _280 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _278;
    float _282 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _284 = _282 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _288 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _286;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _292 = _290 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _294 = 1.0 / _280;
    float _296 = 1.0 / _292;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _300 = _264 + _298;
    bool _302 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _304 = 1.0 / _284;
    float _306 = _268 * _294;
    bool _308 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _310 = isnan(_264);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = fma(_322, _306, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _326 = 1.0 / _288;
    float _328 = _300 * _296;
    float _330 = -_318;
    float _332 = _330 + 1.0;
    float _334 = _272 * _304;
    bool _336 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _338 = isnan(_264);
    bool _340 = _336 || _338;
    bool _342 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _344 = _340 || _342;
    float _346 = float(_344);
    float _348 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _350 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _348;
    bool _352 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _354 = isnan(_264);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _346 * _332;
    float _366 = -_346;
    float _368 = _366 + 1.0;
    float _370 = _276 * _326;
    bool _372 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _374 = isnan(_264);
    bool _376 = _372 || _374;
    bool _378 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _380 = _376 || _378;
    float _382 = float(_380);
    float _384 = -_362;
    float _386 = _384 + 1.0;
    float _388 = _362 * _368;
    float _390 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _392 = _390 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _394 = _264 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _396 = isnan(_264);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = _382 * _386;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _410 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _408;
    float _412 = -_382;
    float _414 = _412 + 1.0;
    float _416 = fma(_350, _306, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _422 = fma(_410, _306, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _424 = _404 * _414;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _430 = -_404;
    float _432 = _430 + 1.0;
    float _434 = _422 * _424;
    float _436 = _324 * _424;
    float _438 = _416 * _424;
    float _440 = fma(_420, _334, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _442 = fma(_428, _334, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _444 = fma(_392, _334, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _446 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _448 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _450 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[143].z, _438);
    float _452 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _454 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _452;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _460;
    float _464 = fma(_440, _406, _446);
    float _466 = fma(_442, _406, _448);
    float _468 = fma(_444, _406, _450);
    float _470 = fma(_454, _370, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _472 = fma(_458, _370, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _474 = fma(_462, _370, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _480 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _482 = _480 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _484 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _486 = _484 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _488 = fma(_470, _388, _464);
    float _490 = fma(_478, _328, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _492 = fma(_482, _328, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _494 = fma(_486, _328, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _496 = fma(_472, _388, _466);
    float _498 = fma(_474, _388, _468);
    float _500 = fma(_490, _364, _488);
    float _502 = fma(_492, _364, _496);
    float _504 = fma(_494, _364, _498);
    float _506 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].x, _500);
    float _508 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].y, _502);
    float _510 = fma(_318, (*spvDescriptorSet0.vp_c9)._m0[147].z, _504);
    bool _512 = !_302;
    float _530;
    if (!_512)
    {
        float _514 = in.m_65.x;
        float _516 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _518 = _514 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _520 = fma(_518, (*spvDescriptorSet0.vp_c9)._m0[11].y, _168);
        float _522 = _520 * _516;
        float _524 = floor(_522);
        float _526 = -_524;
        float _528 = _522 + _526;
        _530 = _528;
        _532 = true;
    }
    else
    {
        float _534 = float(_134);
        float _536 = 1.0 / _534;
        float _538 = _168 * _536;
        _530 = _538;
    }
    _532 = false;
    float _540 = _530;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _544 = _540 + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _550 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = isnan(_540);
    bool _554 = _550 || _552;
    bool _556 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _558 = _554 || _556;
    float _560 = float(_558);
    float _562 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _564 = _562 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _566 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _568 = isnan(_540);
    bool _570 = _566 || _568;
    bool _572 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _574 = _570 || _572;
    float _576 = float(_574);
    float _578 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _580 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _578;
    bool _582 = _540 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _584 = isnan(_540);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = 1.0 / _548;
    float _596 = -_560;
    float _598 = _596 + 1.0;
    float _600 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _602 = _540 + _600;
    bool _604 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _606 = _576 * _598;
    float _608 = -_576;
    float _610 = _608 + 1.0;
    float _612 = 1.0 / _564;
    float _614 = _580 * _594;
    float _616 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _618 = _616 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _620 = fma(_614, _544, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _622 = -_592;
    float _624 = _622 + 1.0;
    float _626 = _618 * _612;
    float _628 = _620 * _606;
    float _630 = _560 * _624;
    float _632 = fma(_626, _602, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _634 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[115].x, _628);
    float _636 = fma(_632, _630, _634);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _642 = fma(_592, (*spvDescriptorSet0.vp_c9)._m0[117].x, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _646 = in.m_67.x;
    float _648 = in.m_67.y;
    float _650 = in.m_67.z;
    float _652 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _640 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _656 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _658 = _642 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_69.x = _652;
    out.m_69.y = _654;
    out.m_69.z = _656;
    out.m_69.w = _658;
    float _660 = _510 * _650;
    float _662 = _508 * _648;
    float _664 = _506 * _646;
    bool _666 = !_604;
    float _684;
    if (!_666)
    {
        float _668 = in.m_65.x;
        float _670 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _672 = _668 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _674 = fma(_672, (*spvDescriptorSet0.vp_c9)._m0[11].w, _168);
        float _676 = _674 * _670;
        float _678 = floor(_676);
        float _680 = -_678;
        float _682 = _676 + _680;
        _684 = _682;
        _686 = true;
    }
    else
    {
        float _688 = float(_134);
        float _690 = 1.0 / _688;
        float _692 = _168 * _690;
        _684 = _692;
    }
    _686 = false;
    float _694 = _684;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _698 = _694 + _696;
    float _700 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _702 = _700 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _704 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _706 = isnan(_694);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _718 = _716 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _720 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _722 = isnan(_694);
    bool _724 = _720 || _722;
    bool _726 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _728 = _724 || _726;
    float _730 = float(_728);
    float _732 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _734 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _732;
    bool _736 = _694 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _738 = isnan(_694);
    bool _740 = _736 || _738;
    bool _742 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _744 = _740 || _742;
    float _746 = float(_744);
    float _748 = 1.0 / _702;
    float _750 = -_714;
    float _752 = _750 + 1.0;
    float _754 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _756 = _694 + _754;
    bool _758 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _760 = _730 * _752;
    float _762 = -_730;
    float _764 = _762 + 1.0;
    float _766 = 1.0 / _718;
    float _768 = _734 * _748;
    float _770 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _772 = _770 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _774 = fma(_768, _698, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _776 = -_746;
    float _778 = _776 + 1.0;
    float _780 = _772 * _766;
    float _782 = _774 * _760;
    float _784 = _714 * _778;
    float _786 = fma(_780, _756, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _788 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[131].x, _782);
    float _790 = fma(_786, _784, _788);
    float _792 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _794 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _798 = fma(_746, (*spvDescriptorSet0.vp_c9)._m0[133].x, _790);
    float _800 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _804 = _796 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _806 = _798 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_71.x = _800;
    out.m_71.y = _802;
    out.m_71.z = _804;
    out.m_71.w = _806;
    bool _808 = !_758;
    float _826;
    if (!_808)
    {
        float _810 = in.m_65.x;
        float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _814 = _810 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _816 = fma(_814, (*spvDescriptorSet0.vp_c9)._m0[14].x, _168);
        float _818 = _816 * _812;
        float _820 = floor(_818);
        float _822 = -_820;
        float _824 = _818 + _822;
        _826 = _824;
        _828 = true;
    }
    else
    {
        float _830 = float(_134);
        float _832 = 1.0 / _830;
        float _834 = _168 * _832;
        _826 = _834;
    }
    _828 = false;
    float _836 = _826;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _840 = _836 + _838;
    bool _842 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _844 = isnan(_836);
    bool _846 = _842 || _844;
    bool _848 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _850 = _846 || _848;
    float _852 = float(_850);
    float _854 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _856 = _854 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _860 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _858;
    bool _862 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _864 = isnan(_836);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = -_852;
    float _876 = _874 + 1.0;
    bool _878 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _880 = isnan(_836);
    bool _882 = _878 || _880;
    bool _884 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _886 = _882 || _884;
    float _888 = float(_886);
    float _890 = 1.0 / _856;
    float _892 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _894 = _892 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _896 = _872 * _876;
    float _898 = -_888;
    float _900 = _898 + 1.0;
    float _902 = 1.0 / _894;
    bool _904 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _906 = _860 * _890;
    float _908 = -_872;
    float _910 = _908 + 1.0;
    bool _912 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _914 = isnan(_836);
    bool _916 = _912 || _914;
    bool _918 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _920 = _916 || _918;
    float _922 = float(_920);
    float _924 = fma(_906, _840, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _926 = _888 * _910;
    bool _928 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _930 = isnan(_836);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _922 * _900;
    float _942 = -_922;
    float _944 = _942 + 1.0;
    float _946 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _948 = _946 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _950 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _952 = isnan(_836);
    bool _954 = _950 || _952;
    bool _956 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    float _962 = _938 * _944;
    float _964 = -_938;
    float _966 = _964 + 1.0;
    bool _968 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _970 = isnan(_836);
    bool _972 = _968 || _970;
    bool _974 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _976 = _972 || _974;
    float _978 = float(_976);
    float _980 = 1.0 / _948;
    float _982 = -_960;
    float _984 = _982 + 1.0;
    float _986 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _988 = _986 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _990 = _960 * _966;
    float _992 = _978 * _984;
    float _994 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _996 = _994 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _998 = -_978;
    float _1000 = _998 + 1.0;
    float _1002 = 1.0 / _988;
    float _1004 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1006 = _1004 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1008 = _924 * _992;
    float _1010 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1012 = _1010 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1014 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1016 = _836 + _1014;
    float _1018 = _1006 * _902;
    float _1020 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1008);
    float _1022 = 1.0 / _996;
    float _1024 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1026 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1024;
    float _1028 = fma(_1018, _1016, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1030 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1032 = _1030 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _1034 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1036 = _836 + _1034;
    float _1038 = _1026 * _980;
    float _1040 = fma(_1028, _990, _1020);
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1044 = _836 + _1042;
    float _1046 = 1.0 / _1012;
    float _1048 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1050 = _1048 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1052 = fma(_1038, _1036, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1054 = _1050 * _1002;
    bool _1056 = _836 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1058 = isnan(_836);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1064 = _1060 || _1062;
    float _1066 = float(_1064);
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1070 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1068;
    float _1072 = 1.0 / _1032;
    float _1074 = fma(_1052, _962, _1040);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1078 = _1076 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1080 = _1070 * _1022;
    float _1082 = fma(_1054, _1044, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1084 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1086 = _836 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1090 = _836 + _1088;
    float _1092 = _1078 * _1046;
    float _1094 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1096 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1094;
    float _1098 = fma(_1080, _1086, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _1100 = fma(_1082, _940, _1074);
    float _1102 = fma(_1092, _1090, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1104 = -_1066;
    float _1106 = _1104 + 1.0;
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1110 = _836 + _1108;
    float _1112 = fma(_1098, _926, _1100);
    float _1114 = _1096 * _1072;
    float _1116 = _852 * _1106;
    float _1118 = fma(_1102, _896, _1112);
    float _1120 = fma(_1114, _1110, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1122 = fma(_1120, _1116, _1118);
    float _1124 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1122);
    out.m_73.x = _1124;
    bool _1126 = !_904;
    float _1128 = _1040;
    float _1130 = (*spvDescriptorSet0.vp_c9)._m0[164].x;
    int _1132 = as_type<int>(_1072);
    float _1150;
    if (!_1126)
    {
        float _1134 = in.m_65.x;
        float _1136 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1138 = _1134 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1140 = fma(_1138, (*spvDescriptorSet0.vp_c9)._m0[14].y, _168);
        float _1142 = _1140 * _1136;
        float _1144 = floor(_1142);
        float _1146 = -_1144;
        float _1148 = _1142 + _1146;
        _1150 = _1148;
        _1152 = true;
    }
    else
    {
        float _1154 = float(_134);
        float _1156 = 1.0 / _1154;
        float _1158 = _168 * _1156;
        _1150 = _1158;
    }
    _1152 = false;
    float _1160 = _1150;
    float _1162 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1164 = int(_1162);
    float _1166 = in.m_65.y;
    int _1168 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1170 = _1168 != 0;
    float _1172 = in.m_75.x;
    float _1174 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].y);
    int _1176 = int(_1174);
    float _1178 = 0.0;
    int _1180 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_1170)
    {
        _1178 = 1.0;
    }
    float _1182 = _1178;
    float _1184 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1186 = int(_1184);
    float _1188 = float(_1164);
    float _1190 = 0.0;
    float _1192 = _1182;
    if (_1170)
    {
        _1190 = 1.0;
    }
    float _1194 = _1190;
    float _1196 = 0.0;
    float _1198 = _1194;
    if (_1170)
    {
        _1196 = 1.0;
    }
    float _1200 = _1196;
    int _1202 = 0;
    float _1204 = _1200;
    if (_1170)
    {
        _1202 = 0;
    }
    int _1206 = _1202;
    int _1208 = _1206;
    if (_1170)
    {
        float _1210 = in.m_65.x;
        _1128 = _1210;
    }
    float _1212 = _1128;
    float _1214 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _1216 = int(_1214);
    float _1218 = float(_1176);
    float _1220 = _1212;
    if (_1170)
    {
        _1180 = 0;
    }
    int _1222 = _1180;
    float _1224 = _1116;
    int _1226 = _1222;
    if (_1170)
    {
        float _1228 = in.m_65.z;
        _1224 = _1228;
    }
    float _1230 = _1224;
    int _1232 = 0;
    if (_1170)
    {
        _1232 = as_type<int>(_1166);
    }
    int _1234 = _1232;
    float _1236 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1238 = int(_1236);
    float _1240 = float(_1186);
    float _1242 = 1.0 / _1188;
    float _1244 = float(_1216);
    float _1246 = 1.0 / _1218;
    float _1248 = float(uint(_1238));
    float _1250 = trunc((*spvDescriptorSet0.vp_c9)._m0[49].x);
    int _1252 = int(_1250);
    float _1254 = _1242 * _168;
    float _1256 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _1258 = int(_1256);
    float _1260 = _1246 * _168;
    float _1262 = 1.0 / _1240;
    float _1264 = float(uint(_1252));
    float _1266 = 1.0 / _1244;
    float _1268 = float(uint(_1258));
    float _1270 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _1272 = int(_1270);
    float _1274 = _1262 * _168;
    float _1276 = 1.0 / _1248;
    float _1278 = _1266 * _168;
    float _1280 = trunc(_1254);
    int _1282 = int(_1280);
    float _1284 = float(uint(_1272));
    float _1286 = 1.0 / _1264;
    int _1288 = as_type<int>(_1276) + (-2);
    float _1290 = trunc(_1260);
    int _1292 = int(_1290);
    float _1294 = float(uint(_1282));
    float _1296 = as_type<float>(_1288) * _1294;
    float _1298 = 1.0 / _1268;
    int _1300 = as_type<int>(_1286) + (-2);
    float _1302 = trunc(_1274);
    int _1304 = int(_1302);
    int _1306 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1308 = _1306 != 0;
    float _1310 = 1.0 / _1284;
    int _1312 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 256;
    bool _1314 = _1312 != 0;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1024;
    bool _1318 = _1316 != 0;
    bool _1320 = _1166 > 0.5;
    int _1322 = as_type<int>(_1298) + (-2);
    float _1324 = trunc(_1278);
    int _1326 = int(_1324);
    float _1328 = float(uint(_1304));
    int _1330 = _1234;
    bool _1332 = _1314;
    bool _1334 = _1318;
    float _1336 = _1172;
    if (!_1308)
    {
        _1130 = _1172;
    }
    float _1338 = _1130;
    float _1340 = as_type<float>(_1322) * _1328;
    int _1342 = as_type<int>(_1340);
    float _1344 = _1338;
    if (_1314)
    {
        float _1346 = -_1172;
        float _1348 = _1346 + 1.0;
        _1132 = as_type<int>(_1348);
    }
    int _1350 = _1132;
    float _1352 = trunc(_1296);
    float _1354 = precise::max(_1352, 0.0);
    uint _1357 = uint(_1354);
    int _1359 = as_type<int>(_1310) + (-2);
    float _1361 = 0.0;
    if (!_1318)
    {
        _1361 = _1172;
    }
    float _1363 = _1361;
    float _1365 = 0.0;
    float _1367 = _1363;
    if (!_1314)
    {
        _1365 = _1172;
    }
    float _1369 = _1365;
    float _1371 = _1369;
    if (_1314)
    {
        float _1373 = _1320 ? as_type<float>(_1350) : _1172;
        _1371 = _1373;
    }
    float _1375 = _1371;
    float _1377 = trunc(_1340);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    float _1383 = float(uint(_1292));
    float _1385 = float(uint(_1326));
    float _1387 = as_type<float>(_1300) * _1383;
    float _1389 = _1383;
    if (_1318)
    {
        float _1391 = -_1172;
        float _1393 = _1391 + 1.0;
        _1342 = as_type<int>(_1393);
    }
    int _1395 = _1342;
    float _1397 = as_type<float>(_1359) * _1385;
    float _1399 = trunc(_1387);
    float _1401 = precise::max(_1399, 0.0);
    uint _1403 = uint(_1401);
    int _1405 = _1395;
    float _1407 = _1397;
    if (_1318)
    {
        float _1409 = _1320 ? as_type<float>(_1395) : _1172;
        _1367 = _1409;
    }
    float _1411 = _1367;
    float _1413 = _1230;
    if (_1170)
    {
        _1405 = as_type<int>(_1230);
    }
    int _1415 = _1405;
    float _1417 = trunc(_1397);
    float _1419 = precise::max(_1417, 0.0);
    uint _1421 = uint(_1419);
    int _1423 = _1415;
    if (_1170)
    {
        _1407 = _1212;
    }
    float _1425 = _1407;
    float _1427 = _1425;
    if (_1170)
    {
        _1389 = _1425;
    }
    float _1429 = _1389;
    int _1431 = 0;
    float _1433 = _1429;
    if (_1170)
    {
        _1431 = as_type<int>(_1425);
    }
    int _1435 = _1431;
    int _1437 = _1435;
    if (!_1170)
    {
        float _1439 = in.m_65.x;
        float _1441 = _1166 * 3.1415927410125732421875;
        float _1443 = in.m_65.z;
        float _1445 = _1441 * 0.15915493667125701904296875;
        float _1447 = _1445 * 6.283185482025146484375;
        float _1449 = sin(_1447);
        float _1451 = _1439 * 3.1415927410125732421875;
        float _1453 = _1451 * 0.15915493667125701904296875;
        float _1455 = _1443 * 3.1415927410125732421875;
        float _1457 = _1455 * 0.15915493667125701904296875;
        float _1459 = _1453 * 6.283185482025146484375;
        float _1461 = sin(_1459);
        float _1463 = _1457 * 6.283185482025146484375;
        float _1465 = sin(_1463);
        _1427 = _1166;
        _1198 = 1.2345600128173828125;
        _1220 = _1439;
        _1192 = 7.345489978790283203125;
        _1433 = _1443;
        _1204 = 5.839270114898681640625;
        _1208 = 1;
        _1413 = _1443;
        _1226 = 2;
        _1423 = as_type<int>(_1465);
        _1330 = as_type<int>(_1449);
        _1437 = as_type<int>(_1461);
    }
    float _1467 = _1427;
    float _1469 = _1198;
    float _1471 = _1220;
    float _1473 = _1192;
    float _1475 = _1433;
    float _1477 = _1204;
    int _1479 = _1208;
    float _1481 = _1413;
    int _1483 = _1226;
    int _1485 = _1423;
    int _1487 = _1330;
    int _1489 = _1437;
    int _1491 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1493 = _1491 != 0;
    int _1495 = 0;
    if (_1308)
    {
        float _1497 = in.m_65.x;
        _1495 = as_type<int>(_1497);
    }
    int _1499 = _1495;
    int _1501 = ~_1238;
    int _1503 = _1501 + 1;
    float _1505 = _1467 * _1469;
    int _1507 = ~_1258;
    int _1509 = _1507 + 1;
    float _1511 = _1471 * _1473;
    int _1513 = ~_1272;
    int _1515 = _1513 + 1;
    int _1517 = _1503 * int(_1357);
    int _1519 = _1517 + _1282;
    float _1521 = floor(_1505);
    float _1523 = _1475 * _1477;
    float _1525 = _1467 * _1473;
    int _1527 = _1515 * int(_1421);
    int _1529 = _1527 + _1326;
    float _1531 = float(uint(_1519));
    float _1533 = _896;
    if (_1493)
    {
        float _1535 = in.m_65.z;
        _1533 = _1535;
    }
    float _1537 = _1533;
    int _1539 = _1509 * int(_1381);
    int _1541 = _1539 + _1304;
    int _1543 = ~_1252;
    int _1545 = _1543 + 1;
    float _1547 = floor(_1511);
    float _1549 = as_type<float>(_1288) * _1531;
    float _1551 = float(uint(_1529));
    bool _1553 = _1479 != 1;
    float _1555 = float(uint(_1541));
    float _1557 = in.m_61.w;
    int _1559 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1561 = _1559 != 0;
    float _1563 = as_type<float>(_1359) * _1551;
    float _1565 = trunc(_1549);
    float _1567 = precise::max(_1565, 0.0);
    uint _1569 = uint(_1567);
    int _1571 = _1499;
    float _1573 = _1549;
    if (_1308)
    {
        bool _1575 = as_type<float>(_1499) > 0.5;
        _1332 = _1575;
    }
    bool _1577 = _1332;
    if (_1493)
    {
        float _1579 = -_1172;
        float _1581 = _1579 + 1.0;
        _1571 = as_type<int>(_1581);
    }
    int _1583 = _1571;
    float _1585 = as_type<float>(_1322) * _1555;
    int _1587 = _1545 * int(_1403);
    int _1589 = _1587 + _1292;
    int _1591 = ~_1272;
    int _1593 = _1591 + 1;
    float _1595 = in.m_59.w;
    float _1597 = floor(_1523);
    int _1599 = _1589;
    float _1601 = _1585;
    if (!_1493)
    {
        _1573 = _1172;
    }
    float _1603 = _1573;
    float _1605 = -_1547;
    float _1607 = _1511 + _1605;
    float _1609 = float(uint(_1589));
    float _1611 = _1603;
    if (_1308)
    {
        float _1613 = -_1172;
        float _1615 = _1613 + 1.0;
        _1599 = as_type<int>(_1615);
    }
    int _1617 = _1599;
    if (_1493)
    {
        bool _1619 = _1537 > 0.5;
        _1334 = _1619;
    }
    bool _1621 = _1334;
    int _1623 = 0;
    if (_1561)
    {
        float _1625 = -_1172;
        float _1627 = _1625 + 1.0;
        _1623 = as_type<int>(_1627);
    }
    int _1629 = _1623;
    float _1631 = float(_1272);
    float _1633 = floor(_1525);
    if (_1493)
    {
        float _1635 = _1621 ? as_type<float>(_1583) : _1172;
        _1611 = _1635;
    }
    float _1637 = _1611;
    float _1639 = -_1521;
    float _1641 = _1505 + _1639;
    float _1643 = float(_134);
    float _1645 = as_type<float>(_1300) * _1609;
    if (_1308)
    {
        float _1647 = _1577 ? as_type<float>(_1617) : _1172;
        _1344 = _1647;
    }
    float _1649 = _1344;
    float _1651 = in.m_63.w;
    float _1653 = float(_1238);
    float _1655 = trunc(_1563);
    float _1657 = precise::max(_1655, 0.0);
    uint _1659 = uint(_1657);
    float _1661 = float(_1282);
    float _1663 = float(_1258);
    int _1665 = ~_1258;
    int _1667 = _1665 + 1;
    float _1669 = trunc(_1585);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = int(_1357) + int(_1569);
    float _1677 = -_1633;
    float _1679 = _1525 + _1677;
    float _1681 = _1607 * _1653;
    float _1683 = float(_1326);
    float _1685 = _1663 * _1641;
    float _1687 = float(_1292);
    float _1689 = 1.0 / _1643;
    if (!_1561)
    {
        _1601 = _1172;
    }
    float _1691 = _1601;
    float _1693 = _1691;
    if (_1561)
    {
        float _1695 = _1320 ? as_type<float>(_1629) : _1172;
        _1693 = _1695;
    }
    float _1697 = _1693;
    float _1699 = -_1597;
    float _1701 = _1523 + _1699;
    bool _1703 = _1661 >= _1653;
    bool _1705 = isnan(_1661);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan(_1653);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    float _1715 = _1653 * _168;
    float _1717 = float(_1304);
    float _1719 = trunc(_1645);
    float _1721 = precise::max(_1719, 0.0);
    uint _1723 = uint(_1721);
    float _1725 = float(_1252);
    float _1727 = _1631 * _1701;
    bool _1729 = _1717 >= _1663;
    bool _1731 = isnan(_1717);
    bool _1733 = _1729 || _1731;
    bool _1735 = isnan(_1663);
    bool _1737 = _1733 || _1735;
    float _1739 = float(_1737);
    bool _1741 = _1683 >= _1631;
    bool _1743 = isnan(_1683);
    bool _1745 = _1741 || _1743;
    bool _1747 = isnan(_1631);
    bool _1749 = _1745 || _1747;
    float _1751 = float(_1749);
    int _1753 = int(_1421) + int(_1659);
    float _1755 = _1715 * _1689;
    int _1757 = int(_1381) + int(_1673);
    float _1759 = _1689 * _168;
    int _1761 = ~_1238;
    int _1763 = _1761 + 1;
    float _1765 = trunc(_1713);
    int _1767 = int(_1765);
    int _1769 = ~_1258;
    int _1771 = _1769 + 1;
    float _1773 = _1663 * _1759;
    float _1775 = _1631 * _1759;
    float _1777 = _1725 * _1759;
    int _1779 = _1763 * _1675;
    int _1781 = _1779 + _1282;
    float _1783 = _1725 * _1679;
    int _1785 = _1771 * _1757;
    int _1787 = _1785 + _1304;
    float _1789 = trunc(_1681);
    int _1791 = int(_1789);
    int _1793 = _1593 * _1753;
    int _1795 = _1793 + _1326;
    bool _1797 = uint(_1781) >= uint(_1238);
    float _1799 = in.m_75.y;
    bool _1801 = uint(_1787) >= uint(_1258);
    bool _1803 = !_1797;
    int _1805 = _1803 ? 0 : (-1);
    int _1807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1809 = _1807 != 0;
    float _1811 = trunc(_1685);
    int _1813 = int(_1811);
    bool _1815 = uint(_1795) >= uint(_1272);
    bool _1817 = !_1809;
    int _1819 = _1817 ? 0 : 1;
    int _1821 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1823 = _1821 != 0;
    int _1825 = int(_1403) + int(_1723);
    float _1827 = trunc(_1727);
    int _1829 = int(_1827);
    int _1831 = ~_1252;
    int _1833 = _1831 + 1;
    bool _1835 = !_1801;
    int _1837 = _1835 ? 0 : (-1);
    int _1839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1841 = _1839 != 0;
    int _1843 = _1833 * _1825;
    int _1845 = _1843 + _1292;
    int _1847 = ~_1675;
    int _1849 = _1847 + _1805;
    int _1851 = _1849 + 1;
    float _1853 = trunc(_1739);
    int _1855 = int(_1853);
    int _1857 = abs(_1819);
    bool _1859 = !_1823;
    int _1861 = _1859 ? 0 : 1;
    int _1863 = _1238 * _1851;
    int _1865 = _1863 + _1282;
    bool _1867 = _1687 >= _1725;
    bool _1869 = isnan(_1687);
    bool _1871 = _1867 || _1869;
    bool _1873 = isnan(_1725);
    bool _1875 = _1871 || _1873;
    float _1877 = float(_1875);
    int _1879 = _1791 * _1857;
    int _1881 = _1879 + _1282;
    bool _1883 = !_1841;
    int _1885 = _1883 ? 0 : 1;
    float _1887 = trunc(_1751);
    int _1889 = int(_1887);
    int _1891 = ~_1757;
    int _1893 = _1891 + _1837;
    int _1895 = _1893 + 1;
    int _1897 = abs(_1861);
    bool _1899 = _1238 == 0;
    int _1901 = _1258 * _1895;
    int _1903 = _1901 + _1304;
    int _1905 = abs(_1885);
    int _1907 = _1813 * _1897;
    int _1909 = _1907 + _1304;
    bool _1911 = uint(_1845) >= uint(_1252);
    float _1913 = trunc(_1755);
    int _1915 = int(_1913);
    bool _1917 = !_1815;
    int _1919 = _1917 ? 0 : (-1);
    int _1921 = ~_1767;
    int _1923 = _1921 + 1;
    int _1925 = _1923 + 1;
    bool _1927 = !_1899;
    int _1929 = _1927 ? _1865 : (-1);
    float _1931 = trunc(_1877);
    int _1933 = int(_1931);
    int _1935 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _1937 = _1935 != 0;
    int _1939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1941 = _1939 != 0;
    int _1943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1945 = _1943 != 0;
    int _1947 = _1929 * _1925;
    int _1949 = ~_1753;
    int _1951 = _1949 + _1919;
    int _1953 = _1951 + 1;
    int _1955 = _1829 * _1905;
    int _1957 = _1955 + _1326;
    bool _1959 = !_1911;
    int _1961 = _1959 ? 0 : (-1);
    int _1963 = _1238 + (-1);
    int _1965 = _1272 * _1953;
    int _1967 = _1965 + _1326;
    bool _1969 = !_1941;
    int _1971 = _1969 ? 0 : 1;
    bool _1973 = _1258 == 0;
    int _1975 = _1767 * _1963;
    int _1977 = _1975 + _1947;
    bool _1979 = !_1937;
    int _1981 = _1979 ? 0 : 1;
    int _1983 = ~_1825;
    int _1985 = _1983 + _1961;
    int _1987 = _1985 + 1;
    bool _1989 = _1272 == 0;
    int _1991 = abs(_1971);
    int _1993 = ~_1855;
    int _1995 = _1993 + 1;
    int _1997 = _1995 + 1;
    bool _1999 = !_1973;
    int _2001 = _1999 ? _1903 : (-1);
    int _2003 = abs(_1981);
    int _2005 = ~_1889;
    int _2007 = _2005 + 1;
    int _2009 = _2007 + 1;
    int _2011 = _1997 * _2001;
    bool _2013 = !_1989;
    int _2015 = _2013 ? _1967 : (-1);
    int _2017 = _1977 * _1991;
    int _2019 = _1252 * _1987;
    int _2021 = _2019 + _1292;
    int _2023 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2025 = _2023 != 0;
    int _2027 = _2009 * _2015;
    bool _2029 = !_1945;
    int _2031 = _2029 ? 0 : 1;
    int _2033 = _1915 * _2003;
    int _2035 = _2033 + _2017;
    bool _2037 = !_2025;
    int _2039 = _2037 ? 0 : 1;
    int _2041 = abs(_2031);
    int _2043 = abs(_2039);
    bool _2045 = _1252 == 0;
    int _2047 = _1881 * _2041;
    int _2049 = _2047 + _2035;
    int _2051 = _1258 + (-1);
    float _2053 = trunc(_1773);
    int _2055 = int(_2053);
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _2063 = _2061 != 0;
    int _2065 = _1791 * _2043;
    int _2067 = _2065 + _2049;
    bool _2069 = !_2045;
    int _2071 = _2069 ? _2021 : (-1);
    int _2073 = _1855 * _2051;
    int _2075 = _2073 + _2011;
    int _2077 = ~_1933;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = float(uint(_2067));
    bool _2085 = !_2063;
    int _2087 = _2085 ? 0 : 1;
    int _2089 = _2081 * _2071;
    int _2091 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _2093 = _2091 != 0;
    int _2095 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _2097 = _2095 != 0;
    float _2099 = as_type<float>(_1288) * _2083;
    int _2101 = abs(_2087);
    bool _2103 = !_2059;
    int _2105 = _2103 ? 0 : 1;
    int _2107 = _1272 + (-1);
    float _2109 = trunc(_2099);
    float _2111 = precise::max(_2109, 0.0);
    uint _2113 = uint(_2111);
    int _2115 = abs(_2105);
    bool _2117 = !_2093;
    int _2119 = _2117 ? 0 : 1;
    int _2121 = _1889 * _2107;
    int _2123 = _2121 + _2027;
    int _2125 = ~_1238;
    int _2127 = _2125 + 1;
    int _2129 = _2075 * _2101;
    int _2131 = abs(_2119);
    int _2133 = _1252 + (-1);
    int _2135 = _2055 * _2115;
    int _2137 = _2135 + _2129;
    bool _2139 = !_2097;
    int _2141 = _2139 ? 0 : 1;
    int _2143 = _1933 * _2133;
    int _2145 = _2143 + _2089;
    int _2147 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _2149 = _2147 != 0;
    int _2151 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _2153 = _2151 != 0;
    float _2155 = trunc(_1775);
    int _2157 = int(_2155);
    int _2159 = abs(_2141);
    int _2161 = _2127 * int(_2113);
    int _2163 = _2161 + _2067;
    int _2165 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _2167 = _2165 != 0;
    int _2169 = _1909 * _2131;
    int _2171 = _2169 + _2137;
    bool _2173 = !_2153;
    int _2175 = _2173 ? 0 : 1;
    float _2177 = float(uint(_2163));
    int _2179 = _1813 * _2159;
    int _2181 = _2179 + _2171;
    bool _2183 = !_2167;
    int _2185 = _2183 ? 0 : 1;
    float _2187 = trunc(_1783);
    int _2189 = int(_2187);
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32768;
    bool _2193 = _2191 != 0;
    float _2195 = as_type<float>(_1288) * _2177;
    int _2197 = abs(_2175);
    bool _2199 = !_2193;
    int _2201 = _2199 ? 0 : 1;
    float _2203 = float(uint(_2181));
    int _2205 = _2123 * _2197;
    int _2207 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 65536;
    bool _2209 = _2207 != 0;
    int _2211 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 131072;
    bool _2213 = _2211 != 0;
    int _2215 = abs(_2185);
    float _2217 = as_type<float>(_1322) * _2203;
    float _2219 = trunc(_2195);
    float _2221 = precise::max(_2219, 0.0);
    uint _2223 = uint(_2221);
    bool _2225 = !_2149;
    int _2227 = _2225 ? 0 : 1;
    bool _2229 = !_2213;
    int _2231 = _2229 ? 0 : 1;
    int _2233 = abs(_2227);
    int _2235 = abs(_2231);
    float _2237 = trunc(_2217);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    int _2243 = _2157 * _2233;
    int _2245 = _2243 + _2205;
    int _2247 = abs(_2201);
    int _2249 = _2145 * _2235;
    int _2251 = ~_1258;
    int _2253 = _2251 + 1;
    int _2255 = _1957 * _2215;
    int _2257 = _2255 + _2245;
    int _2259 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _2261 = _2259 != 0;
    float _2263 = trunc(_1777);
    int _2265 = int(_2263);
    int _2267 = _2189 * _2247;
    int _2269 = _2267 + _1292;
    int _2271 = int(_2113) + int(_2223);
    bool _2273 = !_2209;
    int _2275 = _2273 ? 0 : 1;
    bool _2277 = !_2261;
    int _2279 = _2277 ? 0 : 1;
    int _2281 = abs(_2275);
    int _2283 = _2253 * int(_2241);
    int _2285 = _2283 + _2181;
    int _2287 = abs(_2279);
    int _2289 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 262144;
    bool _2291 = _2289 != 0;
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 524288;
    bool _2295 = _2293 != 0;
    int _2297 = ~_1238;
    int _2299 = _2297 + 1;
    int _2301 = _1829 * _2287;
    int _2303 = _2301 + _2257;
    float _2305 = float(uint(_2285));
    int _2307 = _2265 * _2281;
    int _2309 = _2307 + _2249;
    bool _2311 = !_2291;
    int _2313 = _2311 ? 0 : 1;
    int _2315 = _2299 * _2271;
    int _2317 = _2315 + _2067;
    bool _2319 = !_2295;
    int _2321 = _2319 ? 0 : 1;
    float _2323 = as_type<float>(_1322) * _2305;
    int _2325 = abs(_2313);
    float _2327 = float(uint(_2303));
    float _2329 = trunc(_2323);
    float _2331 = precise::max(_2329, 0.0);
    uint _2333 = uint(_2331);
    bool _2335 = uint(_2317) >= uint(_1238);
    float _2337 = as_type<float>(_1359) * _2327;
    bool _2339 = !_2335;
    int _2341 = _2339 ? 0 : (-1);
    int _2343 = abs(_2321);
    float _2345 = trunc(_2337);
    float _2347 = precise::max(_2345, 0.0);
    uint _2349 = uint(_2347);
    int _2351 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 64;
    bool _2353 = _2351 != 0;
    int _2355 = _2269 * _2325;
    int _2357 = _2355 + _2309;
    int _2359 = ~_2271;
    int _2361 = _2359 + _2341;
    int _2363 = _2361 + 1;
    bool _2365 = _1238 == 0;
    int _2367 = _2189 * _2343;
    int _2369 = _2367 + _2357;
    int _2371 = ~_1272;
    int _2373 = _2371 + 1;
    int _2375 = _1238 * _2363;
    int _2377 = _2375 + _2067;
    bool _2379 = _1166 > 0.5;
    float _2381 = in.m_65.w;
    float _2383 = float(uint(_2369));
    float _2385 = -_1799;
    float _2387 = _2385 + 1.0;
    bool _2389 = !_2365;
    int _2391 = _2389 ? _2377 : (-1);
    int _2393 = as_type<int>(_2217);
    if (_2353)
    {
        float _2395 = -_1172;
        float _2397 = _2395 + 1.0;
        _2393 = as_type<int>(_2397);
    }
    int _2399 = _2393;
    int _2401 = int(_2241) + int(_2333);
    float _2403 = as_type<float>(_1300) * _2383;
    int _2405 = _2373 * int(_2349);
    int _2407 = _2405 + _2303;
    int _2409 = _2391 & 3;
    bool _2411 = _2409 != 0;
    if (_2353)
    {
        float _2413 = _2379 ? as_type<float>(_2399) : _1172;
        _1336 = _2413;
    }
    float _2415 = _1336;
    int _2417 = ~_1258;
    int _2419 = _2417 + 1;
    float _2421 = trunc(_2403);
    float _2423 = precise::max(_2421, 0.0);
    uint _2425 = uint(_2423);
    bool _2427 = uint(_2409) > 1u;
    float _2429 = float(uint(_2407));
    int _2431 = _2419 * _2401;
    int _2433 = _2431 + _2181;
    int _2435 = _2391 & 3;
    bool _2437 = _2435 != 0;
    int _2439 = ~_1252;
    int _2441 = _2439 + 1;
    float _2443 = as_type<float>(_1359) * _2429;
    int _2445 = _2437 ? 0 : 1;
    bool _2447 = uint(_2433) >= uint(_1258);
    int _2449 = ~_2445;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    float _2455 = trunc(_2443);
    float _2457 = precise::max(_2455, 0.0);
    uint _2459 = uint(_2457);
    int _2461 = _2453;
    if (!_2427)
    {
        int _2463 = ~_2445;
        int _2465 = _2463 + 1;
        _2461 = _2465;
    }
    int _2467 = _2461;
    int _2469 = _2441 * int(_2425);
    int _2471 = _2469 + _2369;
    bool _2473 = !_2447;
    int _2475 = _2473 ? 0 : (-1);
    bool _2477 = _2409 != 3;
    bool _2479 = uint(_2409) >= 2u;
    int _2481 = ~_2401;
    int _2483 = _2481 + _2475;
    int _2485 = _2483 + 1;
    int _2487 = _2479 ? 0 : 1;
    float _2489 = float(uint(_2471));
    int _2491 = _1258 * _2485;
    int _2493 = _2491 + _2181;
    int _2495 = _2379 ? as_type<int>(_2387) : as_type<int>(_1799);
    bool _2497 = _2381 > 0.5;
    float _2499 = as_type<float>(_1300) * _2489;
    int _2501 = ~_1272;
    int _2503 = _2501 + 1;
    bool _2505 = _1258 == 0;
    float _2507 = trunc(_2499);
    float _2509 = precise::max(_2507, 0.0);
    uint _2511 = uint(_2509);
    int _2513 = ~_2487;
    int _2515 = _2513 + 1;
    int _2517 = _2515 + 1;
    int _2519 = _2517;
    if (_2477)
    {
        int _2521 = ~_2487;
        int _2523 = _2521 + 1;
        _2519 = _2523;
    }
    int _2525 = _2519;
    int _2527 = int(_2349) + int(_2459);
    bool _2529 = !_2505;
    int _2531 = _2529 ? _2493 : (-1);
    int _2533 = _2497 ? as_type<int>(_2387) : as_type<int>(_1799);
    int _2535 = _2503 * _2527;
    int _2537 = _2535 + _2303;
    int _2539 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2541 = _2539 != 0;
    int _2543 = _2531 & 3;
    bool _2545 = _2543 != 0;
    bool _2547 = !_2541;
    int _2549 = _2547 ? 0 : 1;
    bool _2551 = uint(_2543) >= 2u;
    int _2553 = _2545 ? 0 : 1;
    bool _2555 = uint(_2537) >= uint(_1272);
    int _2557 = _2551 ? 0 : 1;
    bool _2559 = _2543 != 3;
    bool _2561 = !_2555;
    int _2563 = _2561 ? 0 : (-1);
    int _2565 = ~_1252;
    int _2567 = _2565 + 1;
    bool _2569 = uint(_2543) > 1u;
    int _2571 = ~_2527;
    int _2573 = _2571 + _2563;
    int _2575 = _2573 + 1;
    int _2577 = int(_2425) + int(_2511);
    int _2579 = _1272 * _2575;
    int _2581 = _2579 + _2303;
    bool _2583 = _1272 == 0;
    int _2585 = ~_2557;
    int _2587 = _2585 + 1;
    int _2589 = _2587 + 1;
    int _2591 = _2567 * _2577;
    int _2593 = _2591 + _2369;
    int _2595 = _2589;
    if (_2559)
    {
        int _2597 = ~_2557;
        int _2599 = _2597 + 1;
        _2595 = _2599;
    }
    int _2601 = _2595;
    int _2603 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2605 = _2603 != 0;
    int _2607 = ~_2553;
    int _2609 = _2607 + 1;
    int _2611 = _2609 + 1;
    bool _2613 = !_2583;
    int _2615 = _2613 ? _2581 : (-1);
    int _2617 = _2611;
    if (!_2569)
    {
        int _2619 = ~_2553;
        int _2621 = _2619 + 1;
        _2617 = _2621;
    }
    int _2623 = _2617;
    bool _2625 = uint(_2593) >= uint(_1252);
    bool _2627 = !_2605;
    int _2629 = _2627 ? 0 : 1;
    int _2631 = _2615 & 3;
    bool _2633 = _2631 != 0;
    bool _2635 = !_2625;
    int _2637 = _2635 ? 0 : (-1);
    int _2639 = _2633 ? 0 : 1;
    bool _2641 = uint(_2631) >= 2u;
    bool _2643 = _2631 != 3;
    int _2645 = ~_2577;
    int _2647 = _2645 + _2637;
    int _2649 = _2647 + 1;
    int _2651 = _2641 ? 0 : 1;
    bool _2653 = uint(_2631) > 1u;
    int _2655 = _1252 * _2649;
    int _2657 = _2655 + _2369;
    bool _2659 = _1252 == 0;
    int _2661 = ~_2651;
    int _2663 = _2661 + 1;
    int _2665 = _2663 + 1;
    bool _2667 = !_2659;
    int _2669 = _2667 ? _2657 : (-1);
    int _2671 = _2665;
    if (_2643)
    {
        int _2673 = ~_2651;
        int _2675 = _2673 + 1;
        _2671 = _2675;
    }
    int _2677 = _2671;
    int _2679 = _2669 & 3;
    bool _2681 = _2679 != 0;
    int _2683 = ~_2639;
    int _2685 = _2683 + 1;
    int _2687 = _2685 + 1;
    int _2689 = _2687;
    if (!_2653)
    {
        int _2691 = ~_2639;
        int _2693 = _2691 + 1;
        _2689 = _2693;
    }
    int _2695 = _2689;
    bool _2697 = uint(_2679) >= 2u;
    int _2699 = _2681 ? 0 : 1;
    int _2701 = _2697 ? 0 : 1;
    bool _2703 = _2679 != 3;
    bool _2705 = uint(_2679) > 1u;
    int _2707 = ~_2701;
    int _2709 = _2707 + 1;
    int _2711 = _2709 + 1;
    int _2713 = ~_2699;
    int _2715 = _2713 + 1;
    int _2717 = _2715 + 1;
    float _2719 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2721 = _2719 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    int _2723 = _2711;
    int _2725 = _2717;
    if (_2703)
    {
        int _2727 = ~_2701;
        int _2729 = _2727 + 1;
        _2723 = _2729;
    }
    int _2731 = _2723;
    float _2733 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2735 = _2733 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    if (!_2705)
    {
        int _2737 = ~_2699;
        int _2739 = _2737 + 1;
        _2725 = _2739;
    }
    int _2741 = _2725;
    float _2743 = 1.0 / _2721;
    float _2745 = in.m_50.x;
    float _2747 = in.m_50.y;
    float _2749 = in.m_50.z;
    int _2751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _2753 = _2751 != 0;
    float _2755 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2757 = _2755 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    int _2759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2761 = _2759 != 0;
    bool _2763 = !_2753;
    int _2765 = _2763 ? 0 : 1;
    float _2767 = _2761 ? as_type<float>(_2495) : _1799;
    float _2769 = 1.0 / _2735;
    int _2771 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2773 = _2771 != 0;
    bool _2775 = _1481 > 0.5;
    float _2777 = _2773 ? as_type<float>(_2533) : _1799;
    int _2779 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _2781 = _2779 != 0;
    float _2783 = 1.0 / _2757;
    int _2785 = _2775 ? as_type<int>(_2387) : as_type<int>(_1799);
    int _2787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 128;
    bool _2789 = _2787 != 0;
    float _2791 = _2781 ? as_type<float>(_2785) : _1799;
    float _2793 = _200 * _2747;
    float _2795 = _2789 ? as_type<float>(_2785) : _1799;
    int _2797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 512;
    bool _2799 = _2797 != 0;
    int _2801 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2048;
    bool _2803 = _2801 != 0;
    float _2805 = fma(_198, _2745, _2793);
    int _2807 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16777216;
    bool _2809 = _2807 != 0;
    float _2811 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2813 = _2811 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2815 = _206 * _2747;
    float _2817 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2819 = _1166 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2821 = _1471 * 2.0;
    float _2823 = 1.0 / _2813;
    float _2825 = _212 * _2747;
    float _2827 = fma(_204, _2745, _2815);
    float _2829 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2831 = _2829 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2833 = fma(_2819, -2.0, _2817);
    float _2835 = fma(_210, _2745, _2825);
    float _2837 = floor(_2821);
    float _2839 = fma(_202, _2749, _2805);
    float _2841 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2843 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2841;
    float _2845 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2847 = _2845 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2849 = fma(_214, _2749, _2835);
    float _2851 = fma(_208, _2749, _2827);
    float _2853 = 1.0 / _2831;
    float _2855 = _2799 ? as_type<float>(_2785) : _1799;
    float _2857 = _2843 * _2783;
    float _2859 = _2803 ? as_type<float>(_2785) : _1799;
    float _2861 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2863 = _1160 + _2861;
    bool _2865 = !_2809;
    int _2867 = _2865 ? 0 : 1;
    float _2869 = _2839 + _1595;
    float _2871 = float(uint(_1957));
    float _2873 = 1.0 / _2847;
    float _2875 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2877 = _2875 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2879 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2881 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2879;
    bool _2883 = _2837 > 0.0;
    float _2885 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2833);
    float _2887 = _2877 * _2743;
    float _2889 = _2881 * _2769;
    float _2891 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2893 = _2891 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2895 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2897 = _2895 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    bool _2899 = _2837 >= 0.0;
    bool _2901 = isnan(_2837);
    bool _2903 = _2899 || _2901;
    bool _2905 = isnan(0.0);
    bool _2907 = _2903 || _2905;
    float _2909 = 1.0 / _2893;
    float _2911 = _2897 * _2823;
    float _2913 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2915 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2913;
    int _2917 = _2907 ? 0 : 1;
    float _2919 = _2915 * _2853;
    float _2921 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2923 = _2921 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2925 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2927 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2925;
    float _2929 = _1166 * 2.0;
    int _2931 = ~_2917;
    int _2933 = _2931 + 1;
    int _2935 = _2933 + 1;
    float _2937 = _2923 * _2873;
    float _2939 = float(uint(_1881));
    bool _2941 = _1483 != 2;
    int _2943 = _2935;
    float _2945 = (*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2947 = _2823;
    float _2949 = _2873;
    float _2951 = _2859;
    if (!_2883)
    {
        int _2953 = ~_2917;
        int _2955 = _2953 + 1;
        _2943 = _2955;
    }
    int _2957 = _2943;
    float _2959 = _2927 * _2909;
    float _2961 = floor(_2929);
    float _2963 = as_type<float>(_1288) * _2939;
    if (!_1553)
    {
        _2945 = _1166;
    }
    float _2965 = _2945;
    float _2967 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _2969 = _1160 + _2967;
    float _2971 = _2965;
    if (!_1553)
    {
        _2947 = _1166;
    }
    float _2973 = _2947;
    float _2975 = _2973;
    if (!_1553)
    {
        _2949 = _1481;
    }
    float _2977 = _2949;
    float _2979 = fma(_2857, _2969, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2981 = trunc(_2963);
    float _2983 = precise::max(_2981, 0.0);
    uint _2985 = uint(_2983);
    float _2987 = 0.0;
    float _2989 = _2977;
    if (!_1553)
    {
        _2987 = _1481;
    }
    float _2991 = _2987;
    float _2993 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2995 = _1160 + _2993;
    bool _2997 = !_1553;
    float _2999 = _2997 ? as_type<float>(_1485) : as_type<float>(_1487);
    float _3001 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _3003 = _1160 + _3001;
    bool _3005 = !_1553;
    float _3007 = _3005 ? as_type<float>(_1487) : as_type<float>(_1489);
    float _3009 = fma(_2911, _2995, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _3011 = _2991;
    if (_1553)
    {
        _2971 = _1471;
    }
    float _3013 = _2971;
    float _3015 = fma(_2937, _3003, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    if (_1553)
    {
        _2975 = _1471;
    }
    float _3017 = _2975;
    if (_1553)
    {
        _2989 = _1166;
    }
    float _3019 = _2989;
    if (_1553)
    {
        _3011 = _1166;
    }
    float _3021 = _3011;
    bool _3023 = _2961 > 0.0;
    bool _3025 = _2961 >= 0.0;
    bool _3027 = isnan(_2961);
    bool _3029 = _3025 || _3027;
    bool _3031 = isnan(0.0);
    bool _3033 = _3029 || _3031;
    float _3035 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _3037 = _1160 + _3035;
    int _3039 = ~_1238;
    int _3041 = _3039 + 1;
    float _3043 = float(uint(_1909));
    float _3045 = fma(_2887, _3037, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _3047 = fma(_2889, _2863, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _3049 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _3051 = _1160 + _3049;
    int _3053 = _3041 * int(_2985);
    int _3055 = _3053 + _1881;
    float _3057 = as_type<float>(_1322) * _3043;
    bool _3059 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _3061 = isnan(_1160);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _3067 = _3063 || _3065;
    float _3069 = float(_3067);
    float _3071 = fma(_2959, _3051, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _3073 = float(uint(_2269));
    float _3075 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _3077 = _1160 + _3075;
    float _3079 = float(uint(_3055));
    float _3081 = _2851 + _1557;
    float _3083 = trunc(_3057);
    float _3085 = precise::max(_3083, 0.0);
    uint _3087 = uint(_3085);
    bool _3089 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _3091 = isnan(_1160);
    bool _3093 = _3089 || _3091;
    bool _3095 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _3097 = _3093 || _3095;
    float _3099 = float(_3097);
    float _3101 = -_3069;
    float _3103 = _3101 + 1.0;
    float _3105 = as_type<float>(_1288) * _3079;
    bool _3107 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _3109 = isnan(_1160);
    bool _3111 = _3107 || _3109;
    bool _3113 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _3115 = _3111 || _3113;
    float _3117 = float(_3115);
    float _3119 = as_type<float>(_1300) * _3073;
    float _3121 = -_3099;
    float _3123 = _3121 + 1.0;
    bool _3125 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _3127 = isnan(_1160);
    bool _3129 = _3125 || _3127;
    bool _3131 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _3133 = _3129 || _3131;
    float _3135 = float(_3133);
    float _3137 = fma(_2919, _3077, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _3139 = -_3117;
    float _3141 = _3139 + 1.0;
    float _3143 = _3117 * _3123;
    bool _3145 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _3147 = isnan(_1160);
    bool _3149 = _3145 || _3147;
    bool _3151 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _3153 = _3149 || _3151;
    float _3155 = float(_3153);
    float _3157 = trunc(_3119);
    float _3159 = precise::max(_3157, 0.0);
    uint _3161 = uint(_3159);
    float _3163 = _3069 * _3141;
    float _3165 = as_type<float>(_1359) * _2871;
    bool _3167 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _3169 = isnan(_1160);
    bool _3171 = _3167 || _3169;
    bool _3173 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _3175 = _3171 || _3173;
    float _3177 = float(_3175);
    float _3179 = -_3155;
    float _3181 = _3179 + 1.0;
    int _3183 = _1667 * int(_3087);
    int _3185 = _3183 + _1909;
    float _3187 = _3155 * _3103;
    bool _3189 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _3191 = isnan(_1160);
    bool _3193 = _3189 || _3191;
    bool _3195 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _3197 = _3193 || _3195;
    float _3199 = float(_3197);
    float _3201 = trunc(_3165);
    float _3203 = precise::max(_3201, 0.0);
    uint _3205 = uint(_3203);
    float _3207 = _3135 * _3181;
    float _3209 = float(uint(_3185));
    float _3211 = -_3135;
    float _3213 = _3211 + 1.0;
    int _3215 = ~_1272;
    int _3217 = _3215 + 1;
    bool _3219 = _1160 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _3221 = isnan(_1160);
    bool _3223 = _3219 || _3221;
    bool _3225 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _3227 = _3223 || _3225;
    float _3229 = float(_3227);
    float _3231 = as_type<float>(_1322) * _3209;
    float _3233 = -_3177;
    float _3235 = _3233 + 1.0;
    int _3237 = ~_1252;
    int _3239 = _3237 + 1;
    float _3241 = trunc(_3105);
    float _3243 = precise::max(_3241, 0.0);
    uint _3245 = uint(_3243);
    float _3247 = _3199 * _3213;
    float _3249 = _3229 * _3235;
    float _3251 = -_3199;
    float _3253 = _3251 + 1.0;
    int _3255 = _3239 * int(_3161);
    int _3257 = _3255 + _2269;
    float _3259 = -_3229;
    float _3261 = _3259 + 1.0;
    int _3263 = _3217 * int(_3205);
    int _3265 = _3263 + _1957;
    float _3267 = _2979 * _3249;
    float _3269 = trunc(_3231);
    float _3271 = precise::max(_3269, 0.0);
    uint _3273 = uint(_3271);
    float _3275 = _3177 * _3253;
    float _3277 = _3033 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _3279 = fma(_3261, (*spvDescriptorSet0.vp_c9)._m0[167].x, _3267);
    float _3281 = float(uint(_3265));
    float _3283 = _2849 + _1651;
    int _3285 = ~_1238;
    int _3287 = _3285 + 1;
    float _3289 = fma(_3045, _3275, _3279);
    float _3291 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3293 = _2869 + _3291;
    float _3295 = as_type<float>(_1359) * _3281;
    float _3297 = float(uint(_3257));
    float _3299 = fma(_3047, _3247, _3289);
    int _3301 = ~_1258;
    int _3303 = _3301 + 1;
    float _3305 = trunc(_3295);
    float _3307 = precise::max(_3305, 0.0);
    uint _3309 = uint(_3307);
    int _3311 = ~as_type<int>(_3277);
    int _3313 = _3311 + 1;
    int _3315 = _3313 + 1;
    float _3317 = as_type<float>(_1300) * _3297;
    int _3319 = int(_2985) + int(_3245);
    float _3321 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3323 = _3081 + _3321;
    int _3325 = int(_3087) + int(_3273);
    float _3327 = fma(_3009, _3207, _3299);
    int _3329 = _3315;
    float _3331 = _3277;
    float _3333 = _3275;
    if (!_3023)
    {
        int _3335 = ~as_type<int>(_3277);
        int _3337 = _3335 + 1;
        _3329 = _3337;
    }
    int _3339 = _3329;
    float _3341 = trunc(_3317);
    float _3343 = precise::max(_3341, 0.0);
    uint _3345 = uint(_3343);
    int _3347 = _3287 * _3319;
    int _3349 = _3347 + _1881;
    int _3351 = ~_1272;
    int _3353 = _3351 + 1;
    float _3355 = fma(_3137, _3187, _3327);
    float _3357 = _1471 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _3359 = uint(_3349) >= uint(_1238);
    int _3361 = _3303 * _3325;
    int _3363 = _3361 + _1909;
    float _3365 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].z;
    int _3367 = int(_3205) + int(_3309);
    float _3369 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _3371 = !_3359;
    int _3373 = _3371 ? 0 : (-1);
    float _3375 = _1481 * 2.0;
    bool _3377 = uint(_3363) >= uint(_1258);
    float _3379 = _3323 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3381 = -_3369;
    float _3383 = fma(_3357, 2.0, _3381);
    int _3385 = int(_3161) + int(_3345);
    int _3387 = _3353 * _3367;
    int _3389 = _3387 + _1957;
    int _3391 = ~_1252;
    int _3393 = _3391 + 1;
    float _3395 = floor(_3375);
    bool _3397 = !_3377;
    int _3399 = _3397 ? 0 : (-1);
    float _3401 = -_168;
    float _3403 = fma(_3401, (*spvDescriptorSet0.vp_c9)._m0[76].x, _3383);
    bool _3405 = uint(_3389) >= uint(_1272);
    float _3407 = fma(_3293, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3379);
    float _3409 = _3365 * (*spvDescriptorSet0.vp_c9)._m0[100].x;
    float _3411 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3413 = _3283 + _3411;
    bool _3415 = !_3405;
    int _3417 = _3415 ? 0 : (-1);
    float _3419 = fma(_3409, _1375, -0.5);
    int _3421 = _3393 * _3385;
    int _3423 = _3421 + _2269;
    float _3425 = fma(_3413, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3407);
    bool _3427 = uint(_3423) >= uint(_1252);
    float _3429 = (*spvDescriptorSet0.vp_c9)._m0[93].z + (*spvDescriptorSet0.vp_c9)._m0[93].x;
    float _3431 = (*spvDescriptorSet0.vp_c9)._m0[93].w + (*spvDescriptorSet0.vp_c9)._m0[93].y;
    float _3433 = (*spvDescriptorSet0.vp_c9)._m0[92].y + (*spvDescriptorSet0.vp_c9)._m0[91].w;
    bool _3435 = !_3427;
    int _3437 = _3435 ? 0 : (-1);
    float _3439 = fma(as_type<float>(_1489), (*spvDescriptorSet0.vp_c9)._m0[93].z, _3429);
    bool _3441 = _3425 >= 0.0;
    float _3443 = as_type<float>(_1489) * (*spvDescriptorSet0.vp_c9)._m0[92].x;
    float _3445 = fma(as_type<float>(_1487), (*spvDescriptorSet0.vp_c9)._m0[93].w, _3431);
    float _3447 = as_type<float>(_1487) * (*spvDescriptorSet0.vp_c9)._m0[92].y;
    float _3449 = _1166 + _1471;
    float _3451 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].z, _3439);
    float _3453 = fma(_3447, -2.0, _3433);
    float _3455 = _3449 + (-1.0);
    float _3457 = (*spvDescriptorSet0.vp_c9)._m0[92].x + (*spvDescriptorSet0.vp_c9)._m0[91].z;
    int _3459 = ~_3325;
    int _3461 = _3459 + _3399;
    int _3463 = _3461 + 1;
    float _3465 = fma(_3015, _3163, _3355);
    float _3467 = fma(_3455, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _3469 = _3455;
    if (_3441)
    {
        _3469 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3471 = _3469;
    float _3473 = -_3457;
    float _3475 = fma(_3443, 2.0, _3473);
    int _3477 = ~_3319;
    int _3479 = _3477 + _3373;
    int _3481 = _3479 + 1;
    bool _3483 = !_2411;
    int _3485 = _3483 ? 0 : 1;
    int _3487 = as_type<int>(_3471);
    if (_3441)
    {
        float _3489 = _3471 * 5.0;
        _3487 = as_type<int>(_3489);
    }
    int _3491 = _3487;
    int _3493 = _2531 & 3;
    bool _3495 = _3493 != 0;
    float _3497 = fma(_3071, _3143, _3465);
    int _3499 = _1238 * _3481;
    int _3501 = _3499 + _1881;
    if (_3441)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _11842 = as_type<float>(_3491);
        out.gl_Position.z = _11842;
    }
    bool _3503 = !_3495;
    int _3505 = _3503 ? 0 : 1;
    float _3507 = fma(_3099, (*spvDescriptorSet0.vp_c9)._m0[174].x, _3497);
    int _3509 = _2615 & 3;
    bool _3511 = _3509 != 0;
    float _3513 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _3515 = _1258 * _3463;
    int _3517 = _3515 + _1909;
    bool _3519 = !_3511;
    int _3521 = _3519 ? 0 : 1;
    float _3523 = fma(_3017, (*spvDescriptorSet0.vp_c9)._m0[83].z, _3513);
    int _3525 = _2669 & 3;
    bool _3527 = _3525 != 0;
    out.m_77.x = _3507;
    float _3529 = _3323 * _3323;
    bool _3531 = !_3527;
    int _3533 = _3531 ? 0 : 1;
    float _3535 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[92].w, _3445);
    bool _3537 = _2409 != 3;
    float _3539 = fma(_3293, _3293, _3529);
    float _3541 = (*spvDescriptorSet0.vp_c9)._m0[98].z + (*spvDescriptorSet0.vp_c9)._m0[98].x;
    float _3543 = fma(_3413, _3413, _3539);
    bool _3545 = !_3537;
    int _3547 = _3545 ? 0 : (-1);
    float _3549 = (*spvDescriptorSet0.vp_c9)._m0[98].w + (*spvDescriptorSet0.vp_c9)._m0[98].y;
    int _3551 = _2391 >> 31;
    float _3553 = (*spvDescriptorSet0.vp_c9)._m0[97].y + (*spvDescriptorSet0.vp_c9)._m0[96].w;
    bool _3555 = _2543 != 3;
    float _3557 = fma(_2999, (*spvDescriptorSet0.vp_c9)._m0[98].w, _3549);
    float _3559 = _2999 * (*spvDescriptorSet0.vp_c9)._m0[97].y;
    int _3561 = _3551 & 3;
    float _3563 = rsqrt(_3543);
    int _3565 = _2615 >> 31;
    float _3567 = fma(_3559, -2.0, _3553);
    int _3569 = _2531 >> 31;
    float _3571 = fma(_3007, (*spvDescriptorSet0.vp_c9)._m0[98].z, _3541);
    int _3573 = _2391 + _3561;
    float _3575 = _3007 * (*spvDescriptorSet0.vp_c9)._m0[97].x;
    int _3577 = _3569 & 3;
    float _3579 = -_168;
    float _3581 = fma(_3579, (*spvDescriptorSet0.vp_c9)._m0[91].x, _3475);
    int _3583 = _3573 >> 2;
    float _3585 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[91].y, _3453);
    int _3587 = _2531 + _3577;
    float _3589 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].z, _3571);
    int _3591 = _2669 >> 31;
    float _3593 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].z, _3523);
    int _3595 = _3565 & 3;
    float _3597 = _3293 * _3563;
    int _3599 = _3587 >> 2;
    float _3601 = _3323 * _3563;
    int _3603 = _3583 << 4;
    int _3605 = _3603 + 368;
    float _3607 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[96].y, _3567);
    bool _3609 = !_3555;
    int _3611 = _3609 ? 0 : (-1);
    float _3613 = -_3601;
    float _3615 = fma(_3613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3323);
    bool _3617 = _2631 != 3;
    if (_3441)
    {
        out.m_53.x = 0.0;
    }
    if (_2941)
    {
        _3331 = _1471;
    }
    float _3619 = _3331;
    float _3621 = _3615 * _3615;
    float _3623 = _3619;
    if (_2941)
    {
        _3333 = _1166;
    }
    float _3625 = _3333;
    int _3627 = _3591 & 3;
    float _3629 = _3625;
    if (!_2941)
    {
        _3623 = _1481;
    }
    float _3631 = _3623;
    uint _3633 = uint(int(uint(_3605) >> uint(2)));
    uint _3635 = uint(int(uint(int(_3633)) >> uint(2)));
    int _3637 = int(_3633) & 3;
    float _3639 = (*spvDescriptorSet0.vp_c9)._m0[int(_3635)][_3637];
    int _3641 = int(_3633) + 1;
    uint _3643 = uint(int(uint(_3641) >> uint(2)));
    int _3645 = _3641 & 3;
    float _3647 = (*spvDescriptorSet0.vp_c9)._m0[int(_3643)][_3645];
    if (!_2941)
    {
        _3629 = _1471;
    }
    float _3649 = _3629;
    int _3651 = _2615 + _3595;
    float _3653 = _3631 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _3655 = _3599 << 4;
    int _3657 = _3655 + 512;
    float _3659 = _3649 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _3661 = _3395 > 0.0;
    float _3663 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _3665 = int(_3663);
    bool _3667 = _3395 >= 0.0;
    bool _3669 = isnan(_3395);
    bool _3671 = _3667 || _3669;
    bool _3673 = isnan(0.0);
    bool _3675 = _3671 || _3673;
    uint _3677 = uint(int(uint(_3657) >> uint(2)));
    uint _3679 = uint(int(uint(int(_3677)) >> uint(2)));
    int _3681 = int(_3677) & 3;
    float _3683 = (*spvDescriptorSet0.vp_c9)._m0[int(_3679)][_3681];
    int _3685 = int(_3677) + 1;
    uint _3687 = uint(int(uint(_3685) >> uint(2)));
    int _3689 = _3685 & 3;
    float _3691 = (*spvDescriptorSet0.vp_c9)._m0[int(_3687)][_3689];
    bool _3693 = _2679 != 3;
    float _3695 = -_3597;
    float _3697 = fma(_3695, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3293);
    int _3699 = _2669 + _3627;
    float _3701 = (*spvDescriptorSet0.vp_c9)._m0[97].x + (*spvDescriptorSet0.vp_c9)._m0[96].z;
    int _3703 = _3651 >> 2;
    float _3705 = fma(_3697, _3697, _3621);
    float _3707 = -_3701;
    float _3709 = fma(_3575, 2.0, _3707);
    bool _3711 = !_2365;
    int _3713 = _3711 ? _3501 : (-1);
    float _3715 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _3717 = int(_3715);
    bool _3719 = !_2505;
    int _3721 = _3719 ? _3517 : (-1);
    float _3723 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    bool _3725 = !_3693;
    int _3727 = _3725 ? 0 : (-1);
    float _3729 = _3019 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _3731 = _3699 >> 2;
    int _3733 = _3703 << 4;
    int _3735 = _3733 + 656;
    int _3737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _3739 = _3737 != 0;
    int _3741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _3743 = _3741 != 0;
    int _3745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _3747 = _3745 != 0;
    float _3749 = _3013 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _3751 = _3731 << 4;
    int _3753 = _3751 + 800;
    uint _3755 = uint(int(uint(_3735) >> uint(2)));
    uint _3757 = uint(int(uint(int(_3755)) >> uint(2)));
    int _3759 = int(_3755) & 3;
    float _3761 = (*spvDescriptorSet0.vp_c9)._m0[int(_3757)][_3759];
    int _3763 = int(_3755) + 1;
    uint _3765 = uint(int(uint(_3763) >> uint(2)));
    int _3767 = _3763 & 3;
    float _3769 = (*spvDescriptorSet0.vp_c9)._m0[int(_3765)][_3767];
    float _3771 = -_3723;
    float _3773 = fma(_3749, 2.0, _3771);
    float _3775 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    int _3777 = _3675 ? 0 : 1;
    uint _3779 = uint(int(uint(_3753) >> uint(2)));
    uint _3781 = uint(int(uint(int(_3779)) >> uint(2)));
    int _3783 = int(_3779) & 3;
    float _3785 = (*spvDescriptorSet0.vp_c9)._m0[int(_3781)][_3783];
    int _3787 = int(_3779) + 1;
    uint _3789 = uint(int(uint(_3787) >> uint(2)));
    int _3791 = _3787 & 3;
    float _3793 = (*spvDescriptorSet0.vp_c9)._m0[int(_3789)][_3791];
    float _3795 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _3797 = -_3775;
    float _3799 = fma(_3653, 2.0, _3797);
    float _3801 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _3803 = ~_3367;
    int _3805 = _3803 + _3417;
    int _3807 = _3805 + 1;
    float _3809 = fma(_3659, -2.0, _3795);
    int _3811 = ~_3385;
    int _3813 = _3811 + _3437;
    int _3815 = _3813 + 1;
    float _3817 = fma(_3729, -2.0, _3801);
    int _3819 = _3605 + 8;
    uint _3821 = uint(int(uint(_3819) >> uint(2)));
    uint _3823 = uint(int(uint(int(_3821)) >> uint(2)));
    int _3825 = int(_3821) & 3;
    float _3827 = (*spvDescriptorSet0.vp_c9)._m0[int(_3823)][_3825];
    int _3829 = int(_3821) + 1;
    uint _3831 = uint(int(uint(_3829) >> uint(2)));
    int _3833 = _3829 & 3;
    float _3835 = (*spvDescriptorSet0.vp_c9)._m0[int(_3831)][_3833];
    int _3837 = ~_3777;
    int _3839 = _3837 + 1;
    int _3841 = _3839 + 1;
    float _3843 = -_168;
    float _3845 = fma(_3843, (*spvDescriptorSet0.vp_c9)._m0[81].x, _3773);
    int _3847 = _3841;
    if (!_3661)
    {
        int _3849 = ~_3777;
        int _3851 = _3849 + 1;
        _3847 = _3851;
    }
    int _3853 = _3847;
    int _3855 = _1252 * _3815;
    int _3857 = _3855 + _2269;
    int _3859 = abs(_2623);
    float _3861 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[81].y, _3817);
    int _3863 = abs(_2467);
    int _3865 = _3735 + 8;
    uint _3867 = uint(int(uint(_3865) >> uint(2)));
    uint _3869 = uint(int(uint(int(_3867)) >> uint(2)));
    int _3871 = int(_3867) & 3;
    float _3873 = (*spvDescriptorSet0.vp_c9)._m0[int(_3869)][_3871];
    int _3875 = int(_3867) + 1;
    uint _3877 = uint(int(uint(_3875) >> uint(2)));
    int _3879 = _3875 & 3;
    float _3881 = (*spvDescriptorSet0.vp_c9)._m0[int(_3877)][_3879];
    int _3883 = abs(_2695);
    int _3885 = _1272 * _3807;
    int _3887 = _3885 + _1957;
    int _3889 = ~_3863;
    int _3891 = _3889 + 1;
    int _3893 = _3891 + 1;
    float _3895 = trunc((*spvDescriptorSet0.vp_c9)._m0[95].z);
    int _3897 = int(_3895);
    int _3899 = ~_3859;
    int _3901 = _3899 + 1;
    int _3903 = _3901 + 1;
    float _3905 = -_168;
    float _3907 = fma(_3905, (*spvDescriptorSet0.vp_c9)._m0[86].x, _3799);
    int _3909 = abs(_3521);
    int _3911 = _3657 + 8;
    uint _3913 = uint(int(uint(_3911) >> uint(2)));
    uint _3915 = uint(int(uint(int(_3913)) >> uint(2)));
    int _3917 = int(_3913) & 3;
    float _3919 = (*spvDescriptorSet0.vp_c9)._m0[int(_3915)][_3917];
    int _3921 = int(_3913) + 1;
    uint _3923 = uint(int(uint(_3921) >> uint(2)));
    int _3925 = _3921 & 3;
    float _3927 = (*spvDescriptorSet0.vp_c9)._m0[int(_3923)][_3925];
    int _3929 = _3893 * as_type<int>(_3647);
    int _3931 = abs(_3533);
    int _3933 = _3903 * as_type<int>(_3691);
    int _3935 = abs(_3485);
    float _3937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[100].w;
    int _3939 = abs(_2741);
    float _3941 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[86].y, _3809);
    int _3943 = _3753 + 8;
    uint _3945 = uint(int(uint(_3943) >> uint(2)));
    uint _3947 = uint(int(uint(int(_3945)) >> uint(2)));
    int _3949 = int(_3945) & 3;
    float _3951 = (*spvDescriptorSet0.vp_c9)._m0[int(_3947)][_3949];
    int _3953 = int(_3945) + 1;
    uint _3955 = uint(int(uint(_3953) >> uint(2)));
    int _3957 = _3953 & 3;
    float _3959 = (*spvDescriptorSet0.vp_c9)._m0[int(_3955)][_3957];
    int _3961 = ~_3883;
    int _3963 = _3961 + 1;
    int _3965 = _3963 + 1;
    int _3967 = ~_3939;
    int _3969 = _3967 + 1;
    int _3971 = _3969 + 1;
    int _3973 = _3965 * as_type<int>(_3769);
    int _3975 = abs(_3505);
    int _3977 = ~_3935;
    int _3979 = _3977 + 1;
    int _3981 = _3979 + 1;
    float _3983 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _3985 = ~_3931;
    int _3987 = _3985 + 1;
    int _3989 = _3987 + 1;
    int _3991 = _3971 * as_type<int>(_3793);
    int _3993 = ~_3975;
    int _3995 = _3993 + 1;
    int _3997 = _3995 + 1;
    int _3999 = _3981 * as_type<int>(_3639);
    int _4001 = _3999 + _3929;
    int _4003 = abs(_2525);
    int _4005 = _3989 * as_type<int>(_3785);
    int _4007 = _4005 + _3991;
    int _4009 = ~_3909;
    int _4011 = _4009 + 1;
    int _4013 = _4011 + 1;
    float _4015 = fma(_3021, (*spvDescriptorSet0.vp_c9)._m0[83].w, _3983);
    int _4017 = abs(_2677);
    float _4019 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _4021 = int(_4019);
    int _4023 = _3997 * as_type<int>(_3683);
    int _4025 = _4023 + _3933;
    int _4027 = abs(_3547);
    int _4029 = _4013 * as_type<int>(_3761);
    int _4031 = _4029 + _3973;
    int _4033 = ~_4003;
    int _4035 = _4033 + 1;
    int _4037 = _4035 + 1;
    float _4039 = _3937 * (*spvDescriptorSet0.vp_c9)._m0[100].y;
    int _4041 = ~_4017;
    int _4043 = _4041 + 1;
    int _4045 = _4043 + 1;
    float _4047 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[82].w, _4015);
    int _4049 = abs(_2601);
    int _4051 = _4037 * as_type<int>(_3827);
    int _4053 = _4051 + _4001;
    float _4055 = float(uint(_3717));
    int _4057 = _4045 * as_type<int>(_3873);
    int _4059 = _4057 + _4031;
    int _4061 = ~_4027;
    int _4063 = _4061 + 1;
    int _4065 = _4063 + 1;
    float _4067 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _4069 = log2(_4067);
    int _4071 = abs(_2549);
    float _4073 = fma(_4039, _2855, -0.5);
    int _4075 = ~_4049;
    int _4077 = _4075 + 1;
    int _4079 = _4077 + 1;
    int _4081 = _4065 * as_type<int>(_3835);
    int _4083 = _4081 + _4053;
    int _4085 = abs(_3611);
    int _4087 = ~_4071;
    int _4089 = _4087 + 1;
    int _4091 = _4089 + 1;
    float _4093 = 1.0 / _4055;
    bool _4095 = !_3617;
    int _4097 = _4095 ? 0 : (-1);
    int _4099 = _4079 * as_type<int>(_3919);
    int _4101 = _4099 + _4025;
    int _4103 = ~_4085;
    int _4105 = _4103 + 1;
    int _4107 = _4105 + 1;
    int _4109 = _4083 * _4091;
    float _4111 = float(uint(_4021));
    int _4113 = abs(_2731);
    int _4115 = _4107 * as_type<int>(_3927);
    int _4117 = _4115 + _4101;
    int _4119 = abs(_4097);
    float _4121 = 1.0 / _4111;
    int _4123 = abs(_2629);
    int _4125 = _3713 * _4071;
    int _4127 = _4125 + _4109;
    float _4129 = float(uint(_3665));
    int _4131 = ~_4119;
    int _4133 = _4131 + 1;
    int _4135 = _4133 + 1;
    int _4137 = ~_4113;
    int _4139 = _4137 + 1;
    int _4141 = _4139 + 1;
    float _4143 = 1.0 / _4129;
    int _4145 = ~_4123;
    int _4147 = _4145 + 1;
    int _4149 = _4147 + 1;
    int _4151 = _4135 * as_type<int>(_3881);
    int _4153 = _4151 + _4059;
    int _4155 = abs(_3727);
    int _4157 = _4141 * as_type<int>(_3951);
    int _4159 = _4157 + _4007;
    int _4161 = as_type<int>(_4093) + (-2);
    int _4163 = _4149 * _4117;
    int _4165 = abs(_2765);
    float _4167 = float(uint(_4127));
    int _4169 = _3721 * _4123;
    int _4171 = _4169 + _4163;
    float _4173 = float(uint(_3897));
    int _4175 = abs(_2867);
    float _4177 = as_type<float>(_4161) * _4167;
    int _4179 = ~_4155;
    int _4181 = _4179 + 1;
    int _4183 = _4181 + 1;
    int _4185 = ~_4165;
    int _4187 = _4185 + 1;
    int _4189 = _4187 + 1;
    float _4191 = 1.0 / _4173;
    bool _4193 = _1272 == 0;
    int _4195 = _4183 * as_type<int>(_3959);
    int _4197 = _4195 + _4159;
    int _4199 = _4189 * _4153;
    bool _4201 = !_4193;
    int _4203 = _4201 ? _3887 : (-1);
    float _4205 = _4069 * _168;
    int _4207 = ~_4175;
    int _4209 = _4207 + 1;
    int _4211 = _4209 + 1;
    float _4213 = trunc(_4177);
    float _4215 = precise::max(_4213, 0.0);
    uint _4217 = uint(_4215);
    int _4219 = as_type<int>(_4121) + (-2);
    int _4221 = _4203 * _4165;
    int _4223 = _4221 + _4199;
    float _4225 = float(uint(_4171));
    int _4227 = _4211 * _4197;
    bool _4229 = _1252 == 0;
    float _4231 = _3413 * _3563;
    int _4233 = as_type<int>(_4143) + (-2);
    float _4235 = as_type<float>(_4219) * _4225;
    bool _4237 = !_4229;
    int _4239 = _4237 ? _3857 : (-1);
    float _4241 = exp2(_4205);
    float _4243 = float(uint(_4223));
    int _4245 = ~_3717;
    int _4247 = _4245 + 1;
    int _4249 = _4239 * _4175;
    int _4251 = _4249 + _4227;
    int _4253 = as_type<int>(_4191) + (-2);
    float _4255 = as_type<float>(_4233) * _4243;
    int _4257 = abs(_3717);
    float _4259 = trunc(_4235);
    float _4261 = precise::max(_4259, 0.0);
    uint _4263 = uint(_4261);
    float _4265 = float(uint(_4251));
    int _4267 = _4247 * int(_4217);
    int _4269 = _4267 + _4127;
    float _4271 = float(uint(_4257));
    float _4273 = -_4231;
    float _4275 = fma(_4273, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3413);
    int _4277 = abs(_4021);
    float _4279 = as_type<float>(_4253) * _4265;
    float _4281 = float(uint(_4269));
    float _4283 = trunc(_4255);
    float _4285 = precise::max(_4283, 0.0);
    uint _4287 = uint(_4285);
    int _4289 = ~_4021;
    int _4291 = _4289 + 1;
    float _4293 = fma(_4275, _4275, _3705);
    int _4295 = ~_3665;
    int _4297 = _4295 + 1;
    float _4299 = as_type<float>(_4161) * _4281;
    float _4301 = float(uint(_4277));
    int _4303 = abs(_3665);
    float _4305 = trunc(_4279);
    float _4307 = precise::max(_4305, 0.0);
    uint _4309 = uint(_4307);
    int _4311 = _4291 * int(_4263);
    int _4313 = _4311 + _4171;
    int _4315 = ~_3897;
    int _4317 = _4315 + 1;
    float _4319 = float(uint(_4313));
    float _4321 = 1.0 / _4271;
    int _4323 = _4297 * int(_4287);
    int _4325 = _4323 + _4223;
    float _4327 = as_type<float>(_4219) * _4319;
    float _4329 = float(uint(_4303));
    float _4331 = float(uint(_4325));
    float _4333 = 1.0 / _4301;
    int _4335 = _4317 * int(_4309);
    int _4337 = _4335 + _4251;
    int _4339 = abs(_3897);
    float _4341 = as_type<float>(_4233) * _4331;
    int _4343 = abs(_4127);
    float _4345 = float(uint(_4337));
    float _4347 = 1.0 / _4329;
    float _4349 = float(uint(_4339));
    int _4351 = abs(_4171);
    float _4353 = as_type<float>(_4253) * _4345;
    int _4355 = as_type<int>(_4321) + (-2);
    float _4357 = float(uint(_4343));
    float _4359 = 1.0 / _4349;
    int _4361 = as_type<int>(_4333) + (-2);
    int _4363 = abs(_4223);
    float _4365 = as_type<float>(_4355) * _4357;
    float _4367 = float(uint(_4351));
    float _4369 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _4371 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4373 = isnan(1.0);
    bool _4375 = _4371 || _4373;
    bool _4377 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4379 = _4375 || _4377;
    float _4381 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _4383 = 1.0 + _4381;
    float _4385 = as_type<float>(_4361) * _4367;
    float _4387 = trunc(_4365);
    float _4389 = precise::max(_4387, 0.0);
    uint _4391 = uint(_4389);
    float _4393 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[78].z, _4369);
    int _4395 = as_type<int>(_4347) + (-2);
    float _4397 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _4399 = float(uint(_4363));
    float _4401 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _4403 = abs(_4251);
    float _4405 = 1.0 / _4383;
    float _4407 = as_type<float>(_4395) * _4399;
    int _4409 = as_type<int>(_4359) + (-2);
    float _4411 = -_4241;
    float _4413 = _4411 + 1.0;
    float _4415 = float(uint(_4403));
    float _4417 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    bool _4419 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _4421 = isnan(0.0);
    bool _4423 = _4419 || _4421;
    bool _4425 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _4427 = _4423 || _4425;
    float _4429 = trunc(_4385);
    float _4431 = precise::max(_4429, 0.0);
    uint _4433 = uint(_4431);
    float _4435 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[78].w, _4397);
    float _4437 = fma(_1471, (*spvDescriptorSet0.vp_c9)._m0[88].z, _4401);
    float _4439 = as_type<float>(_4409) * _4415;
    int _4441 = ~_4257;
    int _4443 = _4441 + 1;
    float _4445 = fma(_1166, (*spvDescriptorSet0.vp_c9)._m0[88].w, _4417);
    float _4447 = _4427 ? _4413 : 0.0;
    float _4449 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].w, _4435);
    float _4451 = trunc(_4407);
    float _4453 = precise::max(_4451, 0.0);
    uint _4455 = uint(_4453);
    int _4457 = ~_4277;
    int _4459 = _4457 + 1;
    float _4461 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[97].w, _3557);
    int _4463 = _4443 * int(_4391);
    int _4465 = _4463 + _4343;
    float _4467 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].w, _4445);
    float _4469 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[77].z, _4393);
    float _4471 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[87].z, _4437);
    int _4473 = ~_4339;
    int _4475 = _4473 + 1;
    float _4477 = trunc(_4327);
    float _4479 = precise::max(_4477, 0.0);
    uint _4481 = uint(_4479);
    float _4483 = float(uint(_4465));
    float _4485 = -_3607;
    float _4487 = fma(_4461, _4073, _4485);
    float _4489 = as_type<float>(_4355) * _4483;
    float _4491 = trunc(_4299);
    float _4493 = precise::max(_4491, 0.0);
    uint _4495 = uint(_4493);
    float _4497 = trunc(_4439);
    float _4499 = precise::max(_4497, 0.0);
    uint _4501 = uint(_4499);
    float _4503 = -_168;
    float _4505 = fma(_4503, (*spvDescriptorSet0.vp_c9)._m0[96].x, _3709);
    float _4507 = _4231;
    if (_4379)
    {
        float _4509 = _4447 * _4405;
        _170 = _4509;
    }
    float _4511 = _170;
    int _4513 = _4459 * int(_4433);
    int _4515 = _4513 + _4351;
    int _4517 = ~_4303;
    int _4519 = _4517 + 1;
    float _4521 = fma(_3589, _3419, _4505);
    int _4523 = int(_4263) + int(_4481);
    float _4525 = trunc(_4341);
    float _4527 = precise::max(_4525, 0.0);
    uint _4529 = uint(_4527);
    int _4531 = int(_4217) + int(_4495);
    float _4533 = trunc(_4353);
    float _4535 = precise::max(_4533, 0.0);
    uint _4537 = uint(_4535);
    float _4539 = float(uint(_4515));
    int _4541 = _4519 * int(_4455);
    int _4543 = _4541 + _4363;
    int _4545 = _4475 * int(_4501);
    int _4547 = _4545 + _4403;
    float _4549 = as_type<float>(_4361) * _4539;
    int _4551 = ~_3717;
    int _4553 = _4551 + 1;
    float _4555 = trunc(_4489);
    float _4557 = precise::max(_4555, 0.0);
    uint _4559 = uint(_4557);
    float _4561 = float(uint(_4543));
    int _4563 = int(_4287) + int(_4529);
    float _4565 = as_type<float>(_4395) * _4561;
    int _4567 = ~_4021;
    int _4569 = _4567 + 1;
    float _4571 = trunc(_4549);
    float _4573 = precise::max(_4571, 0.0);
    uint _4575 = uint(_4573);
    int _4577 = int(_4309) + int(_4537);
    int _4579 = _4553 * _4531;
    int _4581 = _4579 + _4127;
    float _4583 = float(uint(_4547));
    int _4585 = ~_3897;
    int _4587 = _4585 + 1;
    float _4589 = as_type<float>(_4409) * _4583;
    int _4591 = ~_3665;
    int _4593 = _4591 + 1;
    float _4595 = trunc(_4565);
    float _4597 = precise::max(_4595, 0.0);
    uint _4599 = uint(_4597);
    bool _4601 = uint(_4581) >= uint(_3717);
    int _4603 = _4569 * _4523;
    int _4605 = _4603 + _4171;
    bool _4607 = uint(_4605) >= uint(_4021);
    float _4609 = trunc(_4589);
    float _4611 = precise::max(_4609, 0.0);
    uint _4613 = uint(_4611);
    int _4615 = _4587 * _4577;
    int _4617 = _4615 + _4251;
    bool _4619 = !_4601;
    int _4621 = _4619 ? 0 : (-1);
    int _4623 = _4593 * _4563;
    int _4625 = _4623 + _4223;
    int _4627 = int(_4391) + int(_4559);
    int _4629 = int(_4433) + int(_4575);
    bool _4631 = uint(_4625) >= uint(_3665);
    float _4633 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _4635 = !_4607;
    int _4637 = _4635 ? 0 : (-1);
    bool _4639 = uint(_4617) >= uint(_3897);
    int _4641 = ~_4277;
    int _4643 = _4641 + 1;
    int _4645 = ~_4257;
    int _4647 = _4645 + 1;
    int _4649 = int(_4501) + int(_4613);
    int _4651 = _4647 * _4627;
    int _4653 = _4651 + _4343;
    int _4655 = ~_4339;
    int _4657 = _4655 + 1;
    float _4659 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _4661 = int(_4455) + int(_4599);
    int _4663 = _4643 * _4629;
    int _4665 = _4663 + _4351;
    int _4667 = ~_4303;
    int _4669 = _4667 + 1;
    int _4671 = _4657 * _4649;
    int _4673 = _4671 + _4403;
    bool _4675 = !_4631;
    int _4677 = _4675 ? 0 : (-1);
    float _4679 = _4633 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _4681 = uint(_4653) >= uint(_4257);
    int _4683 = _4669 * _4661;
    int _4685 = _4683 + _4363;
    bool _4687 = !_4639;
    int _4689 = _4687 ? 0 : (-1);
    float _4691 = fma(_4679, _1649, -0.5);
    bool _4693 = uint(_4665) >= uint(_4277);
    int _4695 = ~_4531;
    int _4697 = _4695 + _4621;
    int _4699 = _4697 + 1;
    float _4701 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].z;
    bool _4703 = !_4693;
    int _4705 = _4703 ? 0 : (-1);
    float _4707 = _2859 * (*spvDescriptorSet0.vp_c9)._m0[105].y;
    int _4709 = ~_4523;
    int _4711 = _4709 + _4637;
    int _4713 = _4711 + 1;
    int _4715 = _3717 * _4699;
    int _4717 = _4715 + _4127;
    bool _4719 = uint(_4673) >= uint(_4339);
    float _4721 = _4659 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _4723 = ~_4577;
    int _4725 = _4723 + _4689;
    int _4727 = _4725 + 1;
    int _4729 = _4021 * _4713;
    int _4731 = _4729 + _4171;
    bool _4733 = !_4719;
    int _4735 = _4733 ? 0 : (-1);
    float _4737 = fma(_4721, _2767, -0.5);
    bool _4739 = _4021 == 0;
    int _4741 = _3897 * _4727;
    int _4743 = _4741 + _4251;
    int _4745 = ~_4563;
    int _4747 = _4745 + _4677;
    int _4749 = _4747 + 1;
    bool _4751 = !_4739;
    int _4753 = _4751 ? _4731 : (-1);
    float _4755 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[105].w;
    bool _4757 = _3897 == 0;
    bool _4759 = !_4681;
    int _4761 = _4759 ? 0 : (-1);
    int _4763 = _4127 ^ _3717;
    bool _4765 = uint(_4685) >= uint(_4303);
    int _4767 = _3665 * _4749;
    int _4769 = _4767 + _4223;
    bool _4771 = !_4757;
    int _4773 = _4771 ? _4743 : (-1);
    bool _4775 = _4021 == 0;
    int _4777 = _4171 ^ _4021;
    float _4779 = _1411 * (*spvDescriptorSet0.vp_c9)._m0[105].x;
    uint _4781 = uint(int(uint(_4763) >> uint(31)));
    float _4783 = _4707 * _4755;
    bool _4785 = !_4765;
    int _4787 = _4785 ? 0 : (-1);
    float _4789 = _4779 * _4701;
    bool _4791 = _3717 == 0;
    float _4793 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    uint _4795 = uint(int(uint(_4777) >> uint(31)));
    int _4797 = ~_4761;
    int _4799 = _4627 + _4797;
    int _4801 = _4799 + 1;
    out.m_79.x = _4789;
    out.m_79.y = _4783;
    int _4803 = ~int(_4781);
    int _4805 = _4803 + 1;
    bool _4807 = !_4791;
    int _4809 = _4807 ? _4717 : (-1);
    float _4811 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _4813 = _3665 == 0;
    int _4815 = ~_4705;
    int _4817 = _4629 + _4815;
    int _4819 = _4817 + 1;
    int _4821 = ~int(_4795);
    int _4823 = _4821 + 1;
    int _4825 = _4801 ^ _4805;
    float _4827 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].z;
    bool _4829 = !_4813;
    int _4831 = _4829 ? _4769 : (-1);
    int _4833 = _4819 ^ _4823;
    bool _4835 = _3717 == 0;
    int _4837 = ~_4805;
    int _4839 = _4837 + _4825;
    int _4841 = _4839 + 1;
    float _4843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _4845 = ~_4823;
    int _4847 = _4845 + _4833;
    int _4849 = _4847 + 1;
    float _4851 = _4811 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _4853 = !_4835;
    int _4855 = _4853 ? _4841 : (-1);
    bool _4857 = _3665 == 0;
    float _4859 = fma(_4851, _1637, -0.5);
    int _4861 = _4223 ^ _3665;
    float _4863 = float(_4809);
    bool _4865 = !_4775;
    int _4867 = _4865 ? _4849 : (-1);
    float _4869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _4871 = _3897 == 0;
    float _4873 = fma(_4679, _4863, _3403);
    int _4875 = _4251 ^ _3897;
    float _4877 = _4793 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _4879 = float(_4831);
    float _4881 = fma(_4469, _4691, _4873);
    uint _4883 = uint(int(uint(_4875) >> uint(31)));
    float _4885 = fma(_4877, _1697, -0.5);
    int _4887 = ~_4735;
    int _4889 = _4649 + _4887;
    int _4891 = _4889 + 1;
    float _4893 = fma(_4877, _4879, _3907);
    int _4895 = ~int(_4883);
    int _4897 = _4895 + 1;
    float _4899 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[95].w;
    float _4901 = float(_4753);
    float _4903 = fma(_4471, _4885, _4893);
    int _4905 = _4891 ^ _4897;
    uint _4907 = uint(int(uint(_4861) >> uint(31)));
    float _4909 = fma(_4851, _4901, _3845);
    float _4911 = float(_4773);
    float _4913 = _4827 * (*spvDescriptorSet0.vp_c9)._m0[95].x;
    int _4915 = ~_4897;
    int _4917 = _4915 + _4905;
    int _4919 = _4917 + 1;
    float _4921 = fma(_3593, _4859, _4909);
    int _4923 = ~_4787;
    int _4925 = _4661 + _4923;
    int _4927 = _4925 + 1;
    float _4929 = fma(_4913, _2415, -0.5);
    int _4931 = ~int(_4907);
    int _4933 = _4931 + 1;
    float _4935 = fma(_4913, _4911, _3581);
    float _4937 = float(_4855);
    float _4939 = _4899 * (*spvDescriptorSet0.vp_c9)._m0[95].y;
    bool _4941 = !_4871;
    int _4943 = _4941 ? _4919 : (-1);
    float _4945 = fma(_3451, _4929, _4935);
    int _4947 = _4927 ^ _4933;
    float _4949 = -_2885;
    float _4951 = fma(_4721, _4937, _4949);
    float _4953 = float(_4867);
    float _4955 = _4843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _4957 = float(_4943);
    float _4959 = _4869 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    int _4961 = ~_4933;
    int _4963 = _4961 + _4947;
    int _4965 = _4963 + 1;
    float _4967 = fma(_4955, _2777, -0.5);
    float _4969 = -_3861;
    float _4971 = fma(_4955, _4953, _4969);
    float _4973 = fma(_4939, _2795, -0.5);
    bool _4975 = !_4857;
    int _4977 = _4975 ? _4965 : (-1);
    float _4979 = -_3585;
    float _4981 = fma(_4939, _4957, _4979);
    float _4983 = fma(_4449, _4737, _4951);
    float _4985 = fma(_4047, _4967, _4971);
    float _4987 = float(_4977);
    float _4989 = fma(_3535, _4973, _4981);
    float _4991 = fma(_4959, _2791, -0.5);
    float _4993 = _4903 + 0.5;
    float _4995 = _4521 + 0.5;
    float _4997 = -_3941;
    float _4999 = fma(_4959, _4987, _4997);
    float _5001 = _4989 + 0.5;
    float _5003 = _4487 + 0.5;
    float _5005 = in.m_81.x;
    float _5007 = in.m_81.y;
    float _5009 = in.m_81.z;
    float _5011 = fma(_4467, _4991, _4999);
    float _5013 = _4881 + 0.5;
    float _5015 = _4921 + 0.5;
    float _5017 = _4983 + 0.5;
    float _5019 = _5011 + 0.5;
    float _5021 = _4985 + 0.5;
    float _5023 = _4945 + 0.5;
    bool _5025 = !_3739;
    int _5027 = _5025 ? 0 : 1;
    out.m_83.x = _4995;
    out.m_83.y = _5003;
    bool _5029 = !_3743;
    int _5031 = _5029 ? 0 : 1;
    int _5033 = abs(_5027);
    out.m_85.x = _5013;
    out.m_85.y = _5017;
    out.m_85.z = _5015;
    out.m_85.w = _5021;
    int _5035 = abs(_5031);
    bool _5037 = !_3747;
    int _5039 = _5037 ? 0 : 1;
    out.m_87.x = _4993;
    out.m_87.y = _5019;
    float _5041 = float(_5033);
    out.m_89.x = _5023;
    out.m_89.y = _5001;
    float _5043 = float(_3853);
    float _5045 = _4885;
    float _5047 = as_type<float>(_4685);
    float _5049 = as_type<float>(_4713);
    float _5051 = _4521;
    if (_3441)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5053 = -_3601;
    float _5055 = fma(_5053, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3081);
    float _5057 = _5041 * _5043;
    float _5059 = float(_2957);
    float _5061 = -_3597;
    float _5063 = fma(_5061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2869);
    float _5065 = float(_5035);
    float _5067 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5069 = _5055 + _5067;
    float _5071 = _5057 * (-2.0);
    float _5073 = -_4231;
    float _5075 = fma(_5073, (*spvDescriptorSet0.vp_c9)._m0[18].w, _3283);
    float _5077 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5079 = _5063 + _5077;
    float _5081 = _5069 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _5083 = _5065 * _5059;
    float _5085 = _1471 + (-0.5);
    float _5087 = fma(_5071, _5005, _5005);
    float _5089 = _1166 + _1481;
    float _5091 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5093 = _5075 + _5091;
    float _5095 = fma(_5079, (*spvDescriptorSet0.vp_c8)._m0[28].x, _5081);
    float _5097 = fma(_5085, (*spvDescriptorSet0.vp_c9)._m0[196].x, _5087);
    float _5099 = _5089 + (-1.0);
    float _5101 = _5083 * (-2.0);
    float _5103 = fma(_5093, (*spvDescriptorSet0.vp_c8)._m0[28].z, _5095);
    float _5105 = _1166 + (-0.5);
    float _5107 = fma(_5099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _5109 = fma(_5101, _5007, _5007);
    float _5111 = fma(_3467, _5071, _3467);
    bool _5113 = _5103 >= 0.0;
    float _5115 = fma(_5107, _5101, _5107);
    float _5117 = fma(_5105, (*spvDescriptorSet0.vp_c9)._m0[196].y, _5109);
    float _5119 = fma(_5111, _4511, _5097);
    int _5121 = abs(_5039);
    float _5123 = sqrt(_4293);
    float _5125 = fma(_5115, _4511, _5117);
    float _5127 = _5119 * 0.15915493667125701904296875;
    float _5129 = _1471 + _1481;
    float _5131 = _5125 * 0.15915493667125701904296875;
    float _5133 = float(_3339);
    float _5135 = _5101;
    float _5137 = _5083;
    if (_5113)
    {
        _5135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _5139 = _5135;
    float _5141 = _5127 * 6.283185482025146484375;
    float _5143 = sin(_5141);
    float _5145 = float(_5121);
    int _5147 = as_type<int>(_5139);
    if (_5113)
    {
        out.m_53.x = 0.0;
    }
    if (_5113)
    {
        float _5149 = _5139 * 5.0;
        _5147 = as_type<int>(_5149);
    }
    int _5151 = _5147;
    float _5153 = _5145 * _5133;
    float _5155 = _5129 + (-1.0);
    float _5157 = _5127 * 6.283185482025146484375;
    float _5159 = cos(_5157);
    if (_5113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _14265 = as_type<float>(_5151);
        out.gl_Position.z = _14265;
    }
    float _5161 = _5153 * (-2.0);
    float _5163 = _5131 * 6.283185482025146484375;
    float _5165 = sin(_5163);
    if (_5113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _5167 = -_3081;
    float _5169 = _5167 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _5171 = -_2869;
    float _5173 = _5171 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _5175 = fma(_5161, _5009, _5009);
    float _5177 = -_3283;
    float _5179 = _5177 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _5181 = _5169 * _5169;
    float _5183 = fma(_5155, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _5185 = _1481 + (-0.5);
    float _5187 = _5131 * 6.283185482025146484375;
    float _5189 = cos(_5187);
    float _5191 = fma(_5173, _5173, _5181);
    float _5193 = fma(_5183, _5161, _5183);
    float _5195 = fma(_5185, (*spvDescriptorSet0.vp_c9)._m0[196].z, _5175);
    float _5197 = _3563 * _5123;
    float _5199 = fma(_5179, _5179, _5191);
    float _5201 = _5143 * _5165;
    float _5203 = fma(_5193, _4511, _5195);
    float _5205 = rsqrt(_5199);
    float _5207 = _5203 * 0.15915493667125701904296875;
    float _5209 = in.m_91.x;
    float _5211 = in.m_91.y;
    float _5213 = in.m_91.z;
    float _5215 = _5159 * _5189;
    float _5217 = _5143 * _5189;
    float _5219 = _5207 * 6.283185482025146484375;
    float _5221 = sin(_5219);
    float _5223 = _5173 * _5205;
    float _5225 = _5179 * _5205;
    float _5227 = _5169 * _5205;
    float _5229 = _5207 * 6.283185482025146484375;
    float _5231 = cos(_5229);
    float _5233 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5235 = _5223 * _5233;
    float _5237 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5239 = _5225 * _5237;
    float _5241 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5243 = _5227 * _5241;
    float _5245 = _664 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _5247 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _5249 = -_5235;
    float _5251 = fma(_5225, _5247, _5249);
    float _5253 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _5255 = -_5239;
    float _5257 = fma(_5227, _5253, _5255);
    float _5259 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _5261 = -_5243;
    float _5263 = fma(_5223, _5259, _5261);
    float _5265 = fma(_5221, _5215, _5201);
    float _5267 = _5251 * _5251;
    float _5269 = fma(_5221, _5201, _5215);
    float _5271 = _662 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _5273 = fma(_5257, _5257, _5267);
    float _5275 = _5159 * _5165;
    float _5277 = _5197 * _5271;
    float _5279 = _660 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _5281 = fma(_5263, _5263, _5273);
    float _5283 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _5211);
    float _5285 = _5159 * _5231;
    float _5287 = _5189 * _5231;
    float _5289 = rsqrt(_5281);
    float _5291 = _5283 * _5277;
    float _5293 = _5197 * _5245;
    float _5295 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _5209);
    float _5297 = _5143 * _5231;
    float _5299 = _5165 * _5231;
    float _5301 = _5197 * _5279;
    float _5303 = _5295 * _5293;
    float _5305 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _5213);
    float _5307 = _5285 * _5291;
    float _5309 = -_5275;
    float _5311 = fma(_5221, _5217, _5309);
    float _5313 = -_5217;
    float _5315 = fma(_5221, _5275, _5313);
    float _5317 = _5305 * _5301;
    float _5319 = fma(_5265, _5303, _5307);
    float _5321 = _5297 * _5291;
    float _5323 = _5257 * _5289;
    float _5325 = _5251 * _5289;
    float _5327 = _5263 * _5289;
    float _5329 = -_5291;
    float _5331 = _5221 * _5329;
    float _5333 = _5227 * _5323;
    float _5335 = _5225 * _5325;
    float _5337 = fma(_5315, _5317, _5319);
    float _5339 = fma(_5287, _5303, _5331);
    float _5341 = -_5333;
    float _5343 = fma(_5223, _5325, _5341);
    float _5345 = -_5335;
    float _5347 = fma(_5227, _5327, _5345);
    float _5349 = fma(_5311, _5303, _5321);
    float _5351 = fma(_5299, _5317, _5339);
    float _5353 = _5343 * _5337;
    float _5355 = _5347 * _5337;
    float _5357 = fma(_5269, _5317, _5349);
    float _5359 = fma(_5327, _5351, _5353);
    float _5361 = fma(_5323, _5351, _5355);
    float _5363 = fma(_5225, _5357, _5359);
    float _5365 = fma(_5223, _5357, _5361);
    float _5367 = _3283 + _5363;
    float _5369 = _2869 + _5365;
    float _5371 = _5223 * _5327;
    float _5373 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _5375 = _5367 + _5373;
    float _5377 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _5379 = _5369 + _5377;
    float _5381 = -_5371;
    float _5383 = fma(_5225, _5323, _5381);
    float _5385 = _5375 * _5375;
    float _5387 = _5379 * _5379;
    float _5389 = _5383 * _5337;
    float _5391 = _5387 + _5385;
    float _5393 = fma(_5325, _5351, _5389);
    float _5395 = sqrt(_5391);
    float _5397 = fma(_5227, _5357, _5393);
    float _5399 = _3081 + _5397;
    bool _5401 = _5395 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _5403 = _5369;
    float _5405 = _5367;
    float _5407 = _5387;
    float _5409 = _5385;
    if (!_5401)
    {
        _5045 = _5399;
    }
    float _5411 = _5045;
    bool _5413 = !_5401;
    float _5415 = _5411;
    if (!_5413)
    {
        float _5417 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5419 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _5421 = _5395 + _5419;
        float _5423 = rsqrt(_5391);
        float _5425 = _5421 * _5417;
        float _5427 = _5399 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5429 = _5425 * 0.15915493667125701904296875;
        float _5431 = _5429 * 6.283185482025146484375;
        float _5433 = sin(_5431);
        float _5435 = _5429 * 6.283185482025146484375;
        float _5437 = cos(_5435);
        float _5439 = fma(_5433, _5427, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _5441 = _5423 * _5439;
        float _5443 = _5437 + (-1.0);
        float _5445 = fma(_5379, _5441, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _5447 = fma(_5375, _5441, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _5449 = _5443 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _5451 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _5453 = _5445 + _5451;
        float _5455 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _5457 = _5447 + _5455;
        float _5459 = fma(_5399, _5437, _5449);
        float _5461 = _5453 * _5453;
        float _5463 = _5457 * _5457;
        _5403 = _5445;
        _5405 = _5447;
        _5415 = _5459;
        _5407 = _5461;
        _5409 = _5463;
    }
    float _5465 = _5403;
    float _5467 = _5405;
    float _5469 = _5415;
    float _5471 = _5407;
    float _5473 = _5409;
    float _5475 = fma(_5465, 6.2500002968590706586837768554688e-05, 0.5);
    float _5477 = fma(_5467, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _14758 = float2(_5475, _5477);
    float3 _5481 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_14758, float2(0.0), isnan(_14758)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_14758, float2(0.0), isnan(_14758)), level(0.0)).xyz;
    float _5483 = _5481.x;
    float _5485 = _5481.y;
    float _5487 = _5481.z;
    float _5489 = in.m_93.x;
    float _5491 = in.m_93.y;
    float _5493 = in.m_93.z;
    bool _5495 = _5211 != 0.0;
    bool _5497 = isnan(_5211);
    bool _5499 = _5495 || _5497;
    bool _5501 = isnan(0.0);
    bool _5503 = _5499 || _5501;
    float _5505 = in.m_95.x;
    float _5507 = in.m_95.y;
    float _5509 = in.m_95.z;
    float _5511 = in.m_95.w;
    bool _5513 = _5209 == 0.0;
    bool _5515 = !_5503;
    bool _5517 = _5513 && _5515;
    bool _5519 = _5213 == 0.0;
    bool _5521 = _5519 && _5517;
    float _5523 = _5489;
    if (_5521)
    {
        _5137 = _5489;
    }
    float _5525 = _5137;
    float _5527 = _5525;
    if (_5521)
    {
        _2951 = _5493;
    }
    float _5529 = _2951;
    float _5531 = _5529;
    if (_5521)
    {
        _5047 = _5491;
    }
    float _5533 = _5047;
    float _5535 = _5533;
    if (_5521)
    {
        _5049 = _5525;
    }
    float _5537 = _5049;
    float _5539 = _5537;
    if (!_5521)
    {
        _5527 = _5489;
    }
    float _5541 = _5527;
    if (_5521)
    {
        _5051 = _5529;
    }
    float _5543 = _5051;
    float _5545 = _5543;
    if (!_5521)
    {
        _5531 = _5493;
    }
    float _5547 = _5531;
    if (!_5521)
    {
        float _5549 = fma(_5209, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5541);
        _5539 = _5549;
    }
    float _5551 = _5539;
    if (_5521)
    {
        _5523 = _5533;
    }
    float _5553 = _5523;
    float _5555 = _5509 * _5541;
    float _5557 = _5553;
    if (!_5521)
    {
        _5535 = _5491;
    }
    float _5559 = _5535;
    float _5561 = _5507 * _5547;
    if (!_5521)
    {
        float _5563 = fma(_5213, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5547);
        _5545 = _5563;
    }
    float _5565 = _5545;
    float _5567 = -_5555;
    float _5569 = fma(_5505, _5547, _5567);
    float _5571 = _5285 * _5383;
    float _5573 = _5505 * _5559;
    float _5575 = -_5561;
    float _5577 = fma(_5509, _5559, _5575);
    if (!_5521)
    {
        float _5579 = fma(_5211, (*spvDescriptorSet0.vp_c9)._m0[17].y, _5559);
        _5557 = _5579;
    }
    float _5581 = _5557;
    float _5583 = _5265 * _5347;
    float _5585 = -_5573;
    float _5587 = fma(_5507, _5541, _5585);
    float _5589 = _5265 * _5383;
    float _5591 = _5265 * _5343;
    float _5593 = _5285 * _5347;
    float _5595 = _5569 * _5511;
    float _5597 = _5577 * _5511;
    float _5599 = _5285 * _5343;
    float _5601 = _5587 * _5511;
    float _5603 = _5315 * _5347;
    float _5605 = _5315 * _5383;
    float _5607 = _5315 * _5343;
    float _5609 = fma(_5287, _5323, _5583);
    float _5611 = fma(_5287, _5325, _5589);
    float _5613 = -_5221;
    float _5615 = fma(_5613, _5325, _5571);
    float _5617 = fma(_5287, _5327, _5591);
    float _5619 = -_5221;
    float _5621 = fma(_5619, _5323, _5593);
    float _5623 = -_5221;
    float _5625 = fma(_5623, _5327, _5599);
    float _5627 = fma(_5299, _5323, _5603);
    float _5629 = fma(_5299, _5325, _5605);
    float _5631 = fma(_5299, _5327, _5607);
    float _5633 = fma(_5297, _5227, _5615);
    float _5635 = fma(_5311, _5223, _5609);
    float _5637 = fma(_5297, _5223, _5621);
    float _5639 = fma(_5297, _5225, _5625);
    float _5641 = fma(_5269, _5223, _5627);
    float _5643 = fma(_5269, _5227, _5629);
    float _5645 = fma(_5269, _5225, _5631);
    float _5647 = fma(_5311, _5227, _5611);
    float _5649 = _5633 * _5507;
    float _5651 = _5633 * _5581;
    float _5653 = fma(_5311, _5225, _5617);
    float _5655 = _5637 * _5581;
    float _5657 = _5595 * _5637;
    float _5659 = _5595 * _5633;
    float _5661 = _5639 * _5507;
    float _5663 = _5639 * _5581;
    float _5665 = _5595 * _5639;
    float _5667 = fma(_5647, _5505, _5649);
    float _5669 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _5671 = _5469 + _5669;
    float _5673 = _5637 * _5507;
    float _5675 = fma(_5635, _5551, _5655);
    float _5677 = fma(_5653, _5505, _5661);
    float _5679 = fma(_5671, _5671, _5471);
    float _5681 = fma(_5635, _5505, _5673);
    float _5683 = fma(_5597, _5635, _5657);
    float _5685 = fma(_5647, _5551, _5651);
    float _5687 = _5679 + _5473;
    float _5689 = fma(_5653, _5551, _5663);
    float _5691 = fma(_5597, _5647, _5659);
    float _5693 = fma(_5597, _5653, _5665);
    float _5695 = fma(_5641, _5509, _5681);
    float _5697 = fma(_5643, _5509, _5667);
    float _5699 = sqrt(_5687);
    float _5701 = fma(_5645, _5509, _5677);
    float _5703 = fma(_5641, _5565, _5675);
    float _5705 = fma(_5601, _5641, _5683);
    float _5707 = fma(_5601, _5643, _5691);
    float _5709 = fma(_5601, _5645, _5693);
    float _5711 = fma(_5643, _5565, _5685);
    float _5713 = fma(_5645, _5565, _5689);
    out.m_97.x = _5695;
    out.m_97.y = _5697;
    out.m_97.z = _5701;
    out.m_99.x = _5705;
    out.m_99.y = _5707;
    out.m_99.z = _5709;
    out.m_101.x = _5703;
    out.m_101.y = _5711;
    out.m_101.z = _5713;
    bool _5715 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _5717 = isnan(_5699);
    bool _5719 = _5715 || _5717;
    bool _5721 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _5723 = _5719 || _5721;
    float _5725 = _5601;
    if (!_5723)
    {
        _5725 = 1.0;
    }
    float _5727 = _5725;
    out.m_103.x = _5483;
    out.m_103.y = _5485;
    out.m_103.z = _5487;
    bool _5729 = !_5723;
    float _5731 = _5727;
    if (!_5729)
    {
        bool _5733 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _5735 = isnan(_5699);
        bool _5737 = _5733 || _5735;
        bool _5739 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _5741 = _5737 || _5739;
        if (!_5741)
        {
            float _5743 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5745 = _5699 + _5743;
            float _5747 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _5749 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _5747;
            float _5751 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _5753 = _5751 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _5755 = 1.0 / _5749;
            float _5757 = _5745 * _5755;
            float _5759 = fma(_5757, _5753, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _5731 = _5759;
            _5761 = true;
        }
        else
        {
            bool _5763 = _5699 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _5765 = isnan(_5699);
            bool _5767 = _5763 || _5765;
            bool _5769 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _5771 = _5767 || _5769;
            if (!_5771)
            {
                float _5773 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5775 = _5699 + _5773;
                float _5777 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _5779 = _5777 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _5781 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _5783 = _5781 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _5785 = 1.0 / _5779;
                float _5787 = _5775 * _5785;
                float _5789 = fma(_5787, _5783, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _5731 = _5789;
                _5761 = true;
            }
            else
            {
                _5731 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _5761 = false;
    float _5791 = _5731;
    float _5793 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _5795 = _5469 + _5793;
    float _5797 = _5055 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _5799 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _5801 = _5465 + _5799;
    float _5803 = fma(_5795, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _5805 = fma(_5063, (*spvDescriptorSet0.vp_c8)._m0[11].x, _5797);
    float _5807 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _5809 = _5467 + _5807;
    float _5811 = fma(_5801, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _5813 = -_3081;
    float _5815 = _5813 + _5803;
    float _5817 = fma(_5075, (*spvDescriptorSet0.vp_c8)._m0[11].z, _5805);
    float _5819 = fma(_5809, _5791, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _5821 = -_2869;
    float _5823 = _5821 + _5811;
    float _5825 = _5815 * _5815;
    float _5827 = _5817 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _5829 = _5055 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _5831 = -_3283;
    float _5833 = _5831 + _5819;
    float _5835 = fma(_5823, _5823, _5825);
    float _5837 = 1.0 / _5827;
    float _5839 = fma(_5063, (*spvDescriptorSet0.vp_c8)._m0[10].x, _5829);
    float _5841 = fma(_5833, _5833, _5835);
    float _5843 = fma(_5075, (*spvDescriptorSet0.vp_c8)._m0[10].z, _5839);
    float _5845 = sqrt(_5841);
    float _5847 = _5843 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _5849 = _5847 + _5827;
    float _5851 = _5849 * _5837;
    float _5853 = _5851 * 0.5;
    bool _5855 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _5857 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _5859 = _5855 || _5857;
    bool _5861 = isnan(0.5);
    bool _5863 = _5859 || _5861;
    float _5865 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _5867 = fma(_5853, (*spvDescriptorSet0.vp_c8)._m0[30].w, _5865);
    bool _5869 = _5845 > 0.0;
    float _5871 = 1.0 / _5867;
    bool _5873 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _5875 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _5877 = _5873 || _5875;
    bool _5879 = isnan(0.5);
    bool _5881 = _5877 || _5879;
    float _5883 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _5885 = _5853;
    float _5887 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
    float _5889 = _5841;
    float _5891 = _5819;
    float _5893 = _5811;
    if (!_5869)
    {
        _5883 = _5811;
    }
    float _5895 = _5883;
    float _5897 = _5895;
    if (!_5869)
    {
        _5885 = _5803;
    }
    float _5899 = _5885;
    float _5901 = _5899;
    float _5903 = _5899;
    if (!_5869)
    {
        _5887 = _5819;
    }
    float _5905 = _5887;
    bool _5907 = !_5869;
    float _5909 = _5905;
    if (!_5907)
    {
        float _5911 = _230 * _230;
        float _5913 = rsqrt(_5841);
        float _5915 = fma(_226, _226, _5911);
        float _5917 = fma(_232, _232, _5915);
        float _5919 = sqrt(_5917);
        float _5921 = _5823 * _5913;
        float _5923 = _5815 * _5913;
        float _5925 = _5833 * _5913;
        bool _5927 = _5919 > 0.0;
        float _5929 = _5919;
        float _5931 = _5913;
        if (!_5927)
        {
            _5929 = _5811;
        }
        float _5933 = _5929;
        _5897 = _5933;
        if (!_5927)
        {
            _5901 = _5803;
        }
        float _5935 = _5901;
        _5903 = _5935;
        if (!_5927)
        {
            _5931 = _5819;
        }
        float _5937 = _5931;
        bool _5939 = !_5927;
        _5909 = _5937;
        if (!_5939)
        {
            float _5941 = rsqrt(_5917);
            float _5943 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _5945 = _230 * _5941;
            float _5947 = _226 * _5941;
            float _5949 = _232 * _5941;
            float _5951 = _5923 * _5945;
            float _5953 = fma(_5921, _5947, _5951);
            float _5955 = _5943 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _5957 = fma(_5925, _5949, _5953);
            float _5959 = _5957 * _5955;
            float _5961 = fma(_226, _5959, _5811);
            float _5963 = fma(_230, _5959, _5803);
            float _5965 = fma(_232, _5959, _5819);
            _5903 = _5963;
            _5909 = _5965;
            _5897 = _5961;
            _5889 = _5943;
        }
    }
    float _5967 = _5903;
    float _5969 = _5909;
    float _5971 = _5897;
    float _5973 = _5889;
    float _5975 = -_3601;
    float _5977 = fma(_5975, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5967);
    float _5979 = -_4231;
    float _5981 = fma(_5979, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5969);
    float _5983 = -_3597;
    float _5985 = fma(_5983, (*spvDescriptorSet0.vp_c9)._m0[18].w, _5971);
    float _5987 = _5973;
    float _5989 = _5985;
    float _5991 = _5981;
    if (_5863)
    {
        _5987 = 1.0;
    }
    float _5993 = _5987;
    float _5995 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _5997 = _5871 * _5995;
    float _5999 = _5993;
    if (_5881)
    {
        _4507 = _5977;
    }
    float _6001 = _4507;
    float _6003 = _6001;
    if (!_5881)
    {
        float _6005 = _5069 * _5069;
        float _6007 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _6009 = -_3283;
        float _6011 = _6009 + _5969;
        float _6013 = -_3081;
        float _6015 = _6013 + _5967;
        float _6017 = fma(_5079, _5079, _6005);
        float _6019 = fma(_5093, _5093, _6017);
        float _6021 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _6023 = sqrt(_6019);
        float _6025 = 1.0 / _5197;
        float _6027 = _6021 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _6029 = precise::min(_6023, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _6031 = _6029 * _6007;
        float _6033 = _6031 * _6025;
        float _6035 = -_2869;
        float _6037 = _6035 + _5971;
        float _6039 = _6027 * _6033;
        float _6041 = _6011 * _6033;
        float _6043 = fma(_6015, _6039, _5055);
        float _6045 = fma(_6037, _6039, _5063);
        float _6047 = fma(_6027, _6041, _5075);
        _6003 = _6043;
        _5989 = _6045;
        _5991 = _6047;
        _236 = _6007;
    }
    float _6049 = _6003;
    float _6051 = _5989;
    float _6053 = _5991;
    float _6055 = _236;
    float _6057 = _6055;
    if (!_5863)
    {
        float _6059 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _6061 = _6059 * 0.15915493667125701904296875;
        float _6063 = _6061 * 6.283185482025146484375;
        float _6065 = cos(_6063);
        float _6067 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _6069 = _6067 * 0.15915493667125701904296875;
        float _6071 = _6061 * 6.283185482025146484375;
        float _6073 = sin(_6071);
        float _6075 = 1.0 / _6065;
        float _6077 = _6069 * 6.283185482025146484375;
        float _6079 = cos(_6077);
        float _6081 = _6073 * _6075;
        float _6083 = _6069 * 6.283185482025146484375;
        float _6085 = sin(_6083);
        float _6087 = _6079 * _6081;
        float _6089 = 1.0 / _6087;
        float _6091 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6093 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _6091;
        float _6095 = 1.0 / _6093;
        float _6097 = _6085 * _6089;
        float _6099 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _6101 = fma(_5997, _6097, _6099);
        float _6103 = _6101 * _6095;
        float _6105 = precise::clamp(_6103, 0.0, 1.0);
        _5999 = _6105;
    }
    float _6107 = _5999;
    float _6109 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _6111 = _6049 + _6109;
    float _6113 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _6115 = _6051 + _6113;
    float _6117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _6119 = _6053 + _6117;
    float _6121 = _6111 * _6111;
    float _6123 = fma(_6115, _6115, _6121);
    float _6125 = fma(_6119, _6119, _6123);
    float _6127 = rsqrt(_6125);
    float _6129 = sqrt(_6125);
    float _6131 = _6127 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _6133 = _6115 * _6131;
    float _6135 = _6119 * _6131;
    float _6137 = _6133 * _6133;
    float _6139 = _6135 * _6135;
    float _6141 = _6137 + _6139;
    float _6143 = sqrt(_6141);
    bool _6145 = _6143 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6147 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _6149 = _6143 + _6147;
    float _6151 = _6127;
    float _6153 = _6141;
    float _6155 = _6149;
    float _6157 = _6111;
    if (_6145)
    {
        float _6159 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6151 = _6159;
    }
    float _6161 = _6151;
    if (_6145)
    {
        float _6163 = rsqrt(_6141);
        _6153 = _6163;
    }
    float _6165 = _6153;
    float _6167 = _6165;
    if (_6145)
    {
        float _6169 = _6149 * _6161;
        _6155 = _6169;
    }
    float _6171 = _6155;
    if (_6145)
    {
        float _6173 = _6171 * 0.15915493667125701904296875;
        _5891 = _6173;
    }
    float _6175 = _5891;
    float _6177 = _6119;
    if (_6145)
    {
        float _6179 = _6175 * 6.283185482025146484375;
        float _6181 = sin(_6179);
        _6177 = _6181;
    }
    float _6183 = _6177;
    float _6185 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _6187 = precise::max(0.0, _6185);
    float _6189 = _6161;
    if (_6145)
    {
        float _6191 = _6175 * 6.283185482025146484375;
        float _6193 = cos(_6191);
        _6189 = _6193;
    }
    float _6195 = _6189;
    float _6197 = -_6131;
    float _6199 = -_6187;
    float _6201 = fma(_6111, _6197, _6199);
    float _6203 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_6145)
    {
        float _6205 = _6201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6157 = _6205;
    }
    float _6207 = _6157;
    float _6209 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _6211 = fma(_5063, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _6213 = _6207;
    float _6215 = _6183;
    if (_6145)
    {
        float _6217 = fma(_6183, _6207, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _6213 = _6217;
    }
    float _6219 = _6213;
    float _6221 = _6219;
    if (!_6145)
    {
        _6215 = _6133;
    }
    float _6223 = _6215;
    float _6225 = _6223;
    float _6227 = _6195;
    if (_6145)
    {
        float _6229 = _6195 + (-1.0);
        _6203 = _6229;
    }
    float _6231 = _6203;
    float _6233 = _6231;
    if (_6145)
    {
        float _6235 = _6165 * _6219;
        _5893 = _6235;
    }
    float _6237 = _5893;
    if (!_6145)
    {
        _6221 = _6201;
    }
    float _6239 = _6221;
    float _6241 = _6239;
    if (_6145)
    {
        float _6243 = _6231 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _6057 = _6243;
    }
    float _6245 = _6057;
    if (_6145)
    {
        float _6247 = _6133 * _6237;
        _6225 = _6247;
    }
    float _6249 = _6225;
    if (!_6145)
    {
        _6233 = _6135;
    }
    float _6251 = _6233;
    float _6253 = _6251;
    if (_6145)
    {
        float _6255 = _6135 * _6237;
        _6253 = _6255;
    }
    float _6257 = _6253;
    if (!_6145)
    {
        _6167 = _6137;
    }
    float _6259 = _6167;
    float _6261 = _6259;
    if (_6145)
    {
        float _6263 = fma(_6201, _6195, _6245);
        _6241 = _6263;
    }
    float _6265 = _6241;
    if (_6145)
    {
        float _6267 = _6249 * _6249;
        _6261 = _6267;
    }
    float _6269 = _6261;
    if (!_6145)
    {
        _6227 = _6139;
    }
    float _6271 = _6227;
    float _6273 = _6271;
    if (_6145)
    {
        float _6275 = _6257 * _6257;
        _6273 = _6275;
    }
    float _6277 = _6273;
    float _6279 = fma(_6265, _6265, _6269);
    float _6281 = floor(_6211);
    float _6283 = _6279 + _6277;
    float _6285 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[2].x, _6209);
    float _6287 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _6289 = fma(_6129, (*spvDescriptorSet0.vp_c15)._m0[23].w, _6287);
    float _6291 = precise::clamp(_6289, 0.0, 1.0);
    float _6293 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[2].z, _6285);
    float _6295 = rsqrt(_6283);
    float _6297 = -_6291;
    float _6299 = _6297 + 1.0;
    float _6301 = _6293 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _6303 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _6305 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _6307 = _6301 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _6309 = fma(_5075, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _6311 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _6313 = abs(_6299);
    float _6315 = log2(_6313);
    float _6317 = -_6307;
    float _6319 = fma(_6317, _6303, 1.0);
    float _6321 = _6049 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _6323 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[3].x, _6305);
    float _6325 = -_6281;
    float _6327 = _6211 + _6325;
    float _6329 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[1].x, _6321);
    float _6331 = _6295 * _6249;
    float _6333 = floor(_6309);
    float _6335 = _6295 * _6265;
    float _6337 = _6295 * _6257;
    float _6339 = fma(_6051, (*spvDescriptorSet0.vp_c8)._m0[0].x, _6311);
    float _6341 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[1].z, _6329);
    float _6343 = _6331 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _6345 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[3].z, _6323);
    float _6347 = fma(_6053, (*spvDescriptorSet0.vp_c8)._m0[0].z, _6339);
    float _6349 = _6341 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _6351 = -_6343;
    float _6353 = fma(_6335, (*spvDescriptorSet0.vp_c15)._m0[21].y, _6351);
    float _6355 = _6315 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _6357 = _6347 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _6359 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _6361 = -_6337;
    float _6363 = fma(_6361, (*spvDescriptorSet0.vp_c15)._m0[21].z, _6353);
    float _6365 = _6345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _6367 = exp2(_6355);
    float _6369 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[7].x, _6359);
    float _6371 = fma(_6363, -0.5, 0.5);
    float _6373 = fma(_6363, 0.5, 0.5);
    float _6375 = -_6333;
    float _6377 = _6309 + _6375;
    float _6379 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[7].z, _6369);
    float _6381 = fma(_6373, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _6383 = log2(_6319);
    float _6385 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[7].w, _6379);
    float _6387 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _6389 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _6391 = fma(_6373, _6381, -0.212114393711090087890625);
    float _6393 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[4].x, _6387);
    float _6395 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[5].x, _6389);
    float _6397 = sqrt(_6371);
    float _6399 = fma(_6373, _6391, 1.570728778839111328125);
    float _6401 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[4].z, _6393);
    float _6403 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[5].z, _6395);
    float _6405 = 1.0 / _6385;
    float _6407 = _6335 + 1.0;
    float _6409 = _6383 * 0.693147182464599609375;
    float _6411 = -_6335;
    float _6413 = fma(_6367, _6407, _6411);
    float _6415 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[4].w, _6401);
    float _6417 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[5].w, _6403);
    float _6419 = _6397 * 0.636619746685028076171875;
    float _6421 = fma(_6413, 0.5, 0.5);
    float _6423 = -_6399;
    float _6425 = fma(_6419, _6423, 1.0);
    float _6427 = _6409 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float2 _16334 = float2(_6327, _6377);
    float _6429 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_16334, float2(0.0), isnan(_16334)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_16334, float2(0.0), isnan(_16334)), level(0.0)).x;
    float _6431 = _6415 * _6405;
    float _6433 = _6417 * _6405;
    float _6435 = fma(_6431, 0.5, 0.5);
    float _6437 = fma(_6433, -0.5, 0.5);
    float3 _16353 = float3(_6435, _6437, _6427);
    float _6439 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_16353, float3(0.0), isnan(_16353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_16353, float3(0.0), isnan(_16353)), level(0.0)).x;
    float3 _16364 = float3(_6435, _6437, _6427);
    float4 _6442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_16364, float3(0.0), isnan(_16364)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_16364, float3(0.0), isnan(_16364)), level(0.0)).xyzw;
    float _6444 = _6442.x;
    float _6446 = _6442.y;
    float _6448 = _6442.z;
    float _6450 = _6442.w;
    float2 _16380 = float2(_6425, _6421);
    float3 _6452 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_16380, float2(0.0), isnan(_16380)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_16380, float2(0.0), isnan(_16380)), level(0.0)).xyz;
    float _6454 = _6452.x;
    float _6456 = _6452.y;
    float _6458 = _6452.z;
    float _6460 = abs(_5997);
    float _6462 = log2(_6460);
    float _6464 = _6315 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _6466 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _6468 = isnan(_6129);
    bool _6470 = _6466 || _6468;
    bool _6472 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _6474 = _6470 || _6472;
    float _6476 = exp2(_6464);
    float _6478 = _6462 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _6480 = exp2(_6478);
    float _6482 = in.m_105.x;
    float _6484 = -_6476;
    float _6486 = _6484 + 1.0;
    float _6488 = _6486 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _6490 = fma(_6480, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _6492 = precise::clamp(_6490, 0.0, 1.0);
    float _6494 = fma(_6492, -2.0, 3.0);
    float _6496 = _6492 * _6492;
    float _6498 = _6349 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _6500 = _6496 * _6494;
    float _6502 = fma(_6357, (*spvDescriptorSet0.vp_c8)._m0[6].x, _6498);
    float _6504 = -_6500;
    float _6506 = _6504 + 1.0;
    float _6508 = fma(_6301, (*spvDescriptorSet0.vp_c8)._m0[6].z, _6502);
    float _6510 = fma(_6506, (*spvDescriptorSet0.vp_c15)._m0[654].w, _6500);
    bool _6512 = _5997 <= 8000.0;
    bool _6514 = isnan(_5997);
    bool _6516 = _6512 || _6514;
    bool _6518 = isnan(8000.0);
    bool _6520 = _6516 || _6518;
    float _6522 = float(_6520);
    float _6524 = fma(_6365, (*spvDescriptorSet0.vp_c8)._m0[6].w, _6508);
    float _6526 = _6385 * 0.5;
    float _6528 = _6415 + _6385;
    float _6530 = _6522 * _6510;
    float _6532 = fma(_6417, -0.5, _6526);
    out.gl_Position.x = _6415;
    out.gl_Position.y = _6417;
    out.gl_Position.z = _6524;
    out.gl_Position.w = _6385;
    float _6534 = _6524 + _6385;
    float _6536 = _6530 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _6538 = _6528 * 0.5;
    float _6540 = _6534 * 0.5;
    out.m_107.x = _6538;
    out.m_107.y = _6532;
    out.m_107.z = _6540;
    out.m_107.w = _6385;
    float _6542 = -_6488;
    float _6544 = _6542 + 1.0;
    float _6546 = _6385;
    float _6548 = _6524;
    float _6550 = _6417;
    float _6552 = _6532;
    float _6554 = _6538;
    float _6556 = _6544;
    if (!_6474)
    {
        _6546 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _6558 = _6546;
    float _6560 = _6558;
    float _6562 = _6558;
    if (!_6474)
    {
        _6548 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _6564 = _6548;
    float _6566 = _6564;
    float _6568 = _6564;
    if (!_6474)
    {
        _6550 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _6570 = _6550;
    float _6572 = _6107 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _6574 = _6570;
    float _6576 = _6570;
    if (!_6474)
    {
        _6552 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _6578 = _6552;
    float _6580 = _6578;
    float _6582 = _6578;
    if (!_6474)
    {
        _6554 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _6584 = _6554;
    float _6586 = -_6429;
    float _6588 = _6586 + 1.0;
    float _6590 = _6588 * _6536;
    float _6592 = precise::clamp(_6590, 0.0, 1.0);
    float _6594 = -_6592;
    float _6596 = fma(_6594, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _6598 = _6488 * _6439;
    float _6600 = _6596 * _6482;
    float _6602 = _6450 * _6598;
    float _6604 = _6458 * _6598;
    float _6606 = _6600 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _6608 = fma(_6454, _6602, _6444);
    float _6610 = fma(_6456, _6602, _6446);
    float _6612 = _6450 * _6544;
    float _6614 = fma(_6450, _6604, _6448);
    out.m_109.x = _6606;
    float _6616 = _6584;
    float _6618 = _6584;
    if (!_6474)
    {
        _6556 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _6620 = _6556;
    out.m_111.x = _6608;
    out.m_111.y = _6610;
    out.m_111.z = _6614;
    out.m_111.w = _6612;
    bool _6622 = !_6474;
    float _6624 = _6620;
    float _6626 = _6620;
    if (!_6622)
    {
        bool _6628 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _6630 = isnan(_6129);
        bool _6632 = _6628 || _6630;
        bool _6634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _6636 = _6632 || _6634;
        if (!_6636)
        {
            float _6638 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6640 = _6129 + _6638;
            float _6642 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _6644 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _6642;
            float _6646 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _6648 = _6646 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _6650 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _6652 = _6650 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _6654 = 1.0 / _6644;
            float _6656 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _6658 = _6656 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _6660 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _6662 = _6660 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _6664 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _6666 = _6664 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _6668 = _6640 * _6654;
            float _6670 = precise::clamp(_6668, 0.0, 1.0);
            float _6672 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _6674 = _6672 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _6676 = fma(_6670, _6648, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _6678 = fma(_6670, _6652, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _6680 = fma(_6670, _6674, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _6682 = fma(_6670, _6658, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _6684 = fma(_6670, _6662, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _6686 = fma(_6670, _6666, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _6576 = _6676;
            _6618 = _6684;
            _6568 = _6678;
            _6582 = _6682;
            _6626 = _6680;
            _6562 = _6686;
            _6688 = true;
        }
        else
        {
            bool _6690 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _6692 = isnan(_6129);
            bool _6694 = _6690 || _6692;
            bool _6696 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _6698 = _6694 || _6696;
            if (!_6698)
            {
                _6580 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _6700 = _6580;
            _6582 = _6700;
            if (!_6698)
            {
                _6616 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _6702 = _6616;
            _6618 = _6702;
            if (!_6698)
            {
                _6560 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _6704 = _6560;
            _6562 = _6704;
            if (!_6698)
            {
                _6566 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _6706 = _6566;
            _6568 = _6706;
            if (!_6698)
            {
                _6574 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _6708 = _6574;
            _6576 = _6708;
            if (!_6698)
            {
                _6624 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _6710 = _6624;
            bool _6712 = !_6698;
            _6626 = _6710;
            if (!_6712)
            {
                bool _6714 = _6129 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _6716 = isnan(_6129);
                bool _6718 = _6714 || _6716;
                bool _6720 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _6722 = _6718 || _6720;
                if (!_6722)
                {
                    float _6724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6726 = _6129 + _6724;
                    float _6728 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _6730 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _6728;
                    float _6732 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _6734 = _6732 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _6736 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _6738 = _6736 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _6740 = 1.0 / _6730;
                    float _6742 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _6744 = _6742 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _6746 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _6748 = _6746 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _6750 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _6752 = _6750 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _6754 = _6726 * _6740;
                    float _6756 = precise::clamp(_6754, 0.0, 1.0);
                    float _6758 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _6760 = _6758 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _6762 = fma(_6756, _6734, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _6764 = fma(_6756, _6738, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _6766 = fma(_6756, _6760, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _6768 = fma(_6756, _6744, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _6770 = fma(_6756, _6748, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _6772 = fma(_6756, _6752, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _6576 = _6762;
                    _6618 = _6770;
                    _6568 = _6764;
                    _6582 = _6768;
                    _6626 = _6766;
                    _6562 = _6772;
                    _6688 = true;
                }
                else
                {
                    _6576 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _6618 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _6568 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _6582 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _6626 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _6562 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _6688 = false;
    float _6774 = _6576;
    float _6776 = _6618;
    float _6778 = _6568;
    float _6780 = _6582;
    float _6782 = _6626;
    float _6784 = _6562;
    float _6786 = _6572 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _6788 = fma(_5711, -0.5, 0.5);
    float _6790 = precise::clamp(_6788, 0.0, 1.0);
    float _6792 = -_6774;
    float _6794 = _6776 + _6792;
    float _6796 = -_6778;
    float _6798 = _6780 + _6796;
    out.m_53.x = _6786;
    float _6800 = fma(_6790, _6794, _6774);
    float _6802 = -_6782;
    float _6804 = _6784 + _6802;
    float _6806 = fma(_6790, _6798, _6778);
    float _6808 = _6800 * 0.586610972881317138671875;
    bool _6810 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _6812 = fma(_6790, _6804, _6782);
    out.m_113.x = 0.0;
    float _6814 = fma(_6806, 0.298911988735198974609375, _6808);
    bool _6816 = _6107 > 0.0;
    bool _6818 = isnan(_6107);
    bool _6820 = _6816 || _6818;
    bool _6822 = isnan(0.0);
    bool _6824 = _6820 || _6822;
    float _6826 = fma(_6812, 0.114477999508380889892578125, _6814);
    float _6828 = -_6826;
    float _6830 = _6806 + _6828;
    float _6832 = -_6826;
    float _6834 = _6800 + _6832;
    float _6836 = -_6826;
    float _6838 = _6812 + _6836;
    float _6840 = fma(_6830, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    float _6842 = fma(_6834, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    float _6844 = fma(_6838, (*spvDescriptorSet0.vp_c13)._m0[1].z, _6826);
    bool _6846 = !_6810;
    if (!_6846)
    {
        float _6848 = -_6049;
        float _6850 = _6848 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _6852 = -_6051;
        float _6854 = _6852 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _6856 = -_6053;
        float _6858 = _6856 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _6860 = _6850 * _6850;
        float _6862 = fma(_6854, _6854, _6860);
        float _6864 = fma(_6858, _6858, _6862);
        float _6866 = sqrt(_6864);
        float _6868 = rsqrt(_6864);
        float _6870 = -_6866;
        float _6872 = _6870 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _6874 = _6872 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _6876 = precise::clamp(_6874, 0.0, 1.0);
        float _6878 = _6854 * _6868;
        float _6880 = _6850 * _6868;
        float _6882 = abs(_6876);
        float _6884 = log2(_6882);
        float _6886 = _6858 * _6868;
        float _6888 = _6878 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _6890 = _5711 * _6880;
        float _6892 = -_6880;
        float _6894 = -_6888;
        float _6896 = fma(_6892, (*spvDescriptorSet0.vp_c15)._m0[656].y, _6894);
        float _6898 = fma(_5703, _6878, _6890);
        float _6900 = -_6886;
        float _6902 = fma(_6900, (*spvDescriptorSet0.vp_c15)._m0[656].z, _6896);
        float _6904 = fma(_5713, _6886, _6898);
        float _6906 = precise::clamp(_6904, 0.0, 1.0);
        float _6908 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _6910 = _6902 + _6908;
        float _6912 = _6884 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _6914 = _6910 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _6916 = precise::clamp(_6914, 0.0, 1.0);
        float _6918 = exp2(_6912);
        float _6920 = _6918 * _6916;
        float _6922 = _6906 * _6920;
        float _6924 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _6926 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _6928 = _6922 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_113.x = _6924;
        out.m_113.y = _6926;
        out.m_113.z = _6928;
    }
    out.m_115.x = _6840;
    out.m_115.y = _6842;
    out.m_115.z = _6844;
    if (_6824)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _6930 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _6930;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_115.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_115.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_115.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_115.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_113.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_113.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_113.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_113.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 84, as_type<uint>(out.m_109.x)); dm_cw(dm_gs, dm_p, 85, as_type<uint>(out.m_109.y)); dm_cw(dm_gs, dm_p, 86, as_type<uint>(out.m_109.z)); dm_cw(dm_gs, dm_p, 87, as_type<uint>(out.m_109.w)); dm_cw(dm_gs, dm_p, 88, as_type<uint>(out.m_111.x)); dm_cw(dm_gs, dm_p, 89, as_type<uint>(out.m_111.y)); dm_cw(dm_gs, dm_p, 90, as_type<uint>(out.m_111.z)); dm_cw(dm_gs, dm_p, 91, as_type<uint>(out.m_111.w)); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

