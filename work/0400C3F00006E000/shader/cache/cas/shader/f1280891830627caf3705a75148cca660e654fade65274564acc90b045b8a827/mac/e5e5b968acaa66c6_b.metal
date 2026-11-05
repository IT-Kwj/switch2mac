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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
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
    float4 m_67 [[user(locn0)]];
    float4 m_83 [[user(locn1)]];
    float4 m_107 [[user(locn2)]];
    float4 m_103 [[user(locn3)]];
    float4 m_105 [[user(locn4)]];
    float4 m_85 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_89 [[user(locn7)]];
    float4 m_91 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_95 [[user(locn10)]];
    float4 m_101 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_93 [[user(locn13)]];
    float4 m_97 [[user(locn14)]];
    float4 m_71 [[user(locn15)]];
    float4 m_75 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_99 [[attribute(0)]];
    float4 m_57 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_61 [[attribute(3)]];
    float4 m_55 [[attribute(5)]];
    float4 m_48 [[attribute(6)]];
    float4 m_53 [[attribute(7)]];
    float4 m_79 [[attribute(8)]];
    float4 m_77 [[attribute(9)]];
    float4 m_63 [[attribute(10)]];
    float4 m_65 [[attribute(11)]];
    float4 m_73 [[attribute(12)]];
    float4 m_69 [[attribute(13)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2381 = false;
    bool _1542 = false;
    bool _680 = false;
    bool _534 = false;
    bool _244 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_142);
        out.gl_Position.z = _2680;
    }
    if (!_130)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2749 = as_type<float>(_178);
        out.gl_Position.z = _2749;
    }
    if (_170)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = _182 * _190;
    float _208 = _182 * _196;
    float _210 = fma(_180, _188, _206);
    float _212 = _182 * _202;
    float _214 = fma(_180, _194, _208);
    float _216 = fma(_180, _200, _212);
    float _218 = fma(_184, _192, _210);
    float _220 = fma(_184, _198, _214);
    float _222 = fma(_184, _204, _216);
    bool _224 = !_186;
    float _242;
    if (!_224)
    {
        float _226 = in.m_63.x;
        float _228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _234 = _232 * _228;
        float _236 = floor(_234);
        float _238 = -_236;
        float _240 = _234 + _238;
        _242 = _240;
        _244 = true;
    }
    else
    {
        float _246 = float(_126);
        float _248 = 1.0 / _246;
        float _250 = _160 * _248;
        _242 = _250;
    }
    _244 = false;
    float _252 = _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _252 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _252 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _252 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = 1.0 / _268;
    bool _284 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_252);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_252);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _272;
    float _310 = -_306;
    float _312 = _310 + 1.0;
    bool _314 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _316 = 1.0 / _280;
    float _318 = _256 * _282;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _252 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = fma(_326, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _330 = 1.0 / _276;
    float _332 = _260 * _308;
    bool _334 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_252);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_344;
    float _348 = _346 + 1.0;
    float _350 = _322 * _316;
    bool _352 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_252);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _362 * _348;
    float _366 = _264 * _330;
    float _368 = -_362;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = _294 * _370;
    float _382 = -_294;
    float _384 = _382 + 1.0;
    float _386 = fma(_374, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_378, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _390 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_252);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _306 * _384;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _400 * _312;
    float _418 = fma(_406, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_414, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = _388 * _416;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = _386 * _416;
    float _436 = _328 * _416;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = in.m_65.x;
    float _444 = in.m_65.y;
    float _446 = in.m_65.z;
    float _448 = fma(_428, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_432, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _462 = fma(_420, _402, _452);
    float _464 = fma(_418, _402, _454);
    float _466 = fma(_458, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_422, _402, _460);
    float _482 = fma(_470, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_448, _380, _462);
    float _490 = fma(_450, _380, _464);
    float _492 = fma(_466, _380, _480);
    float _494 = fma(_482, _364, _488);
    float _496 = fma(_484, _364, _490);
    float _498 = fma(_486, _364, _492);
    float _500 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _494);
    float _502 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _496);
    float _504 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _498);
    float _506 = _500 * _442;
    float _508 = _502 * _444;
    float _510 = _504 * _446;
    bool _512 = !_314;
    float _514 = _510;
    float _532;
    if (!_512)
    {
        float _516 = in.m_63.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_126);
        float _538 = 1.0 / _536;
        float _540 = _160 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _546 = _542 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = isnan(_542);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _568 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_542);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _580;
    bool _584 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = isnan(_542);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _550;
    float _598 = -_562;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = _578 * _600;
    float _606 = -_578;
    float _608 = _606 + 1.0;
    float _610 = 1.0 / _566;
    float _612 = _582 * _596;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = fma(_612, _546, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = _616 * _610;
    float _622 = _618 * _604;
    float _624 = -_594;
    float _626 = _624 + 1.0;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _542 + _628;
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[115].x, _622);
    float _634 = _562 * _626;
    float _636 = fma(_620, _630, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = fma(_636, _634, _632);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _646 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[117].x, _640);
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _648;
    out.m_67.y = _650;
    out.m_67.z = _652;
    out.m_67.w = _654;
    bool _656 = !_602;
    float _658 = _654;
    float _660 = _652;
    float _678;
    if (!_656)
    {
        float _662 = in.m_63.x;
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        float _682 = float(_126);
        float _684 = 1.0 / _682;
        float _686 = _160 * _684;
        _678 = _686;
    }
    _680 = false;
    float _688 = _678;
    float _690 = in.m_63.w;
    float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _694 = in.m_69.y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _702 = in.m_63.x;
    float _704 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = in.m_48.x;
    float _708 = in.m_48.y;
    float _710 = in.m_48.z;
    float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _716 = _714 != 0;
    float _718 = in.m_63.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _728 = _726 != 0;
    float _730 = in.m_63.y;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _734 = _732 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _736 = _690 > 0.5;
    float _738 = -_694;
    float _740 = _738 + 1.0;
    float _742 = in.m_57.w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _746 = _712 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _748 = in.m_61.w;
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].z, _744);
    int _752 = _736 ? as_type<int>(_740) : as_type<int>(_694);
    float _754 = _196 * _708;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _758 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _760 = _202 * _708;
    float _762 = fma(_194, _706, _754);
    float _764 = _716 ? as_type<float>(_752) : _694;
    float _766 = -_756;
    float _768 = fma(_758, 2.0, _766);
    float _770 = fma(_200, _706, _760);
    float _772 = in.m_73.x;
    float _774 = in.m_73.y;
    float _776 = in.m_73.z;
    float _778 = in.m_73.w;
    float _780 = _190 * _708;
    bool _782 = _718 > 0.5;
    float _784 = in.m_59.w;
    float _786 = _718;
    float _788 = _694;
    float _790 = _692;
    float _792 = _700;
    if (!_698)
    {
        _658 = _730;
    }
    float _794 = _658;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _798 = _794;
    if (!_698)
    {
        _660 = _718;
    }
    float _800 = _660;
    float _802 = in.m_69.x;
    float _804 = _800;
    if (_698)
    {
        _798 = _702;
    }
    float _806 = _798;
    float _808 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].w, _796);
    if (_698)
    {
        _804 = _730;
    }
    float _810 = _804;
    float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _814 = as_type<int>(_810);
    if (_698)
    {
        _786 = _730;
    }
    float _816 = _786;
    float _818 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _750);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _828 = _826 != 0;
    float _830 = fma(_188, _706, _780);
    bool _832 = _730 > 0.5;
    float _834 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _836 = fma(_204, _710, _770);
    float _838 = fma(_192, _710, _830);
    float _840 = fma(_198, _710, _762);
    int _842 = _832 ? as_type<int>(_740) : as_type<int>(_694);
    float _844 = _774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _846 = fma(_834, -2.0, _724);
    float _848 = _838 + _742;
    float _850 = _840 + _784;
    float _852 = _822 ? as_type<float>(_842) : _694;
    float _854 = _774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _856 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _844);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _850 + _858;
    float _862 = _836 + _748;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _868 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _848 + _874;
    float _878 = _860 * _860;
    bool _880 = _822;
    float _882 = _848;
    if (_722)
    {
        bool _884 = _702 > 0.5;
        _880 = _884;
    }
    bool _886 = _880;
    float _888 = _774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _890 = 1.0 / _866;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _862 + _892;
    float _896 = fma(_876, _876, _878);
    float _898 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _888);
    float _900 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[26].z, _898);
    float _902 = 1.0 / _872;
    float _904 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[25].z, _868);
    float _906 = fma(_894, _894, _896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = _896;
    if (!_722)
    {
        _916 = _802;
    }
    float _918 = _916;
    float _920 = _918;
    if (_828)
    {
        float _922 = _782 ? _740 : _694;
        _788 = _922;
    }
    float _924 = _788;
    float _926 = sqrt(_906);
    float _928 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[24].z, _856);
    float _930 = _914 * _890;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _934 = _688 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _938 = _688 + _936;
    bool _940 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _942 = isnan(_688);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    out.m_75.x = _928;
    out.m_75.y = _904;
    out.m_75.z = _900;
    float _952 = _910 * _902;
    float _954 = fma(_930, _938, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _956 = -_950;
    float _958 = _956 + 1.0;
    float _960 = fma(_952, _934, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _962 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_722)
    {
        _790 = _918;
    }
    float _964 = _790;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _968 = _964;
    if (_722)
    {
        _920 = _802;
    }
    float _970 = _920;
    float _972 = _926 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _974 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _808);
    float _976 = _812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _978 = rsqrt(_906);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _982 = _700 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _984 = fma(_962, _852, -0.5);
    float _986 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _846);
    bool _988 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _990 = isnan(_688);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[83].w, _980);
    float _1002 = precise::min(_982, _972);
    float _1004 = -_986;
    float _1006 = fma(_974, _984, _1004);
    bool _1008 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1010 = isnan(_688);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = -_998;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_764, _976, -0.5);
    float _1026 = in.m_77.x;
    float _1028 = in.m_77.y;
    float _1030 = in.m_77.z;
    float _1032 = _1018 * _1022;
    float _1034 = -_1018;
    float _1036 = _1034 + 1.0;
    float _1038 = _978 * _1002;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1042 = _950 * _1036;
    float _1044 = _860 * _1038;
    float _1046 = _876 * _1038;
    float _1048 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1040);
    float _1050 = _960 * _1042;
    float _1052 = -_1044;
    float _1054 = _860 + _1052;
    float _1056 = -_1046;
    float _1058 = _876 + _1056;
    float _1060 = _894 * _1038;
    float _1062 = -_966;
    float _1064 = fma(_818, 2.0, _1062);
    float _1066 = _1054 * _1054;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1070 = -_1060;
    float _1072 = _894 + _1070;
    float _1074 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1076 = fma(_1058, _1058, _1066);
    float _1078 = _1068;
    if (_722)
    {
        float _1080 = -_970;
        float _1082 = _1080 + 1.0;
        _814 = as_type<int>(_1082);
    }
    int _1084 = _814;
    float _1086 = in.m_79.x;
    float _1088 = in.m_79.y;
    float _1090 = in.m_79.z;
    int _1092 = 0;
    float _1094 = as_type<float>(_1084);
    if (_728)
    {
        float _1096 = -_970;
        float _1098 = _1096 + 1.0;
        _1092 = as_type<int>(_1098);
    }
    int _1100 = _1092;
    float _1102 = fma(_1072, _1072, _1076);
    bool _1104 = _1028 != 0.0;
    bool _1106 = isnan(_1028);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    int _1114 = 0;
    if (_734)
    {
        float _1116 = -_970;
        float _1118 = _1116 + 1.0;
        _1114 = as_type<int>(_1118);
    }
    int _1120 = _1114;
    float _1122 = fma(_1074, -2.0, _1068);
    float _1124 = sqrt(_1102);
    bool _1126 = _1026 == 0.0;
    bool _1128 = !_1112;
    bool _1130 = _1126 && _1128;
    float _1132 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1050);
    if (_722)
    {
        float _1134 = _886 ? as_type<float>(_1084) : _970;
        _968 = _1134;
    }
    float _1136 = _968;
    float _1138 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1000);
    if (!_728)
    {
        _1094 = _970;
    }
    float _1140 = _1094;
    float _1142 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1048);
    float _1144 = _1140;
    if (!_734)
    {
        _1078 = _970;
    }
    float _1146 = _1078;
    float _1148 = -_160;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1064);
    bool _1152 = _1030 == 0.0;
    bool _1154 = _1152 && _1130;
    float _1156 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1122);
    float _1158 = _1146;
    if (_728)
    {
        float _1160 = _782 ? as_type<float>(_1100) : _970;
        _1144 = _1160;
    }
    float _1162 = _1144;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_734)
    {
        float _1166 = _832 ? as_type<float>(_1120) : _970;
        _1158 = _1166;
    }
    float _1168 = _1158;
    float _1170 = -_160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _768);
    float _1174 = _978 * _1124;
    float _1176 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1178 = -_1156;
    float _1180 = fma(_1138, _1024, _1178);
    float _1182 = fma(_746, _1136, -0.5);
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1028);
    float _1186 = _704 * _1174;
    float _1188 = _700 * _1174;
    float _1190 = _1176 * _1174;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1026);
    float _1194 = _1186 * _1184;
    float _1196 = _1184;
    if (_1154)
    {
        _1196 = _1088;
    }
    float _1198 = _1196;
    float _1200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1030);
    float _1202 = _1188 * _1192;
    float _1204 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1206 = _1198;
    float _1208 = _1204;
    if (_1154)
    {
        _792 = _1198;
    }
    float _1210 = _792;
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1214 = _1210;
    if (!_1154)
    {
        _1206 = _1088;
    }
    float _1216 = _1206;
    float _1218 = _1190 * _1200;
    float _1220 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1204);
    float _1224 = _1222;
    if (_1154)
    {
        _1208 = _1090;
    }
    float _1226 = _1208;
    float _1228 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1230 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1234 = _1226;
    if (_1154)
    {
        _1224 = _1226;
    }
    float _1236 = _1224;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1240 = _1236;
    if (!_1154)
    {
        _1234 = _1090;
    }
    float _1242 = _1234;
    float _1244 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1230);
    float _1246 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1248 = fma(_954, _1032, _1132);
    float _1250 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1252 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1254 = _862 + _1246;
    if (!_1154)
    {
        float _1256 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1240 = _1256;
    }
    float _1258 = _1240;
    float _1260 = fma(_1250, _1162, -0.5);
    float _1262 = _848 + _1252;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1254 + _1264;
    float _1268 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1228);
    float _1270 = _1262;
    if (!_1154)
    {
        float _1272 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1214 = _1272;
    }
    float _1274 = _1214;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1262 + _1276;
    float _1280 = _1266 * _1266;
    float _1282 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1154)
    {
        _514 = _1086;
    }
    float _1284 = _514;
    float _1286 = _924 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1288 = fma(_1278, _1278, _1280);
    float _1290 = _1284;
    if (!_1154)
    {
        float _1292 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = _774 * _1242;
    float _1298 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1268);
    float _1300 = sqrt(_1288);
    float _1302 = _1282 * _1212;
    float _1304 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1306 = _776 * _1086;
    float _1308 = -_1296;
    float _1310 = fma(_776, _1216, _1308);
    float _1312 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1248);
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1304);
    float _1316 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1318 = _772 * _1216;
    float _1320 = _1286 * _1238;
    float _1322 = -_1306;
    float _1324 = fma(_772, _1242, _1322);
    float _1326 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1328 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1330 = _850 + _1316;
    float _1332 = -_1318;
    float _1334 = fma(_774, _1086, _1332);
    bool _1336 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1326);
    float _1340 = fma(_824, _1182, _1172);
    float _1342 = fma(_1142, _1260, _1150);
    out.m_81.x = _1302;
    out.m_81.y = _1320;
    float _1344 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1328);
    float _1346 = _1328;
    float _1348 = _1320;
    if (!_1336)
    {
        _1346 = _1254;
    }
    float _1350 = _1346;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = _1350;
    if (!_1336)
    {
        _1348 = _1330;
    }
    float _1356 = _1348;
    bool _1358 = !_1336;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1300 + _1364;
        float _1368 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = rsqrt(_1288);
        float _1372 = _1366 * _1362;
        float _1374 = _1372 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = sin(_1380);
        float _1384 = _1378 + (-1.0);
        float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = fma(_1382, _1368, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1390 = fma(_1330, _1378, _1386);
        float _1392 = _1370 * _1388;
        float _1394 = fma(_1278, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1396 = fma(_1266, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1360 = _1390;
        _1270 = _1394;
        _1354 = _1396;
    }
    float _1398 = _1360;
    float _1400 = _1270;
    float _1402 = _1354;
    float _1404 = -_1044;
    float _1406 = _1404 + _1398;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1412 = -_1046;
    float _1414 = _1412 + _1400;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1418 = _1406 + _1416;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1414 + _1424;
    float _1428 = _1418 * _1418;
    float _1430 = _1324 * _778;
    float _1432 = _1310 * _778;
    float _1434 = _1334 * _778;
    float _1436 = -_1060;
    float _1438 = _1436 + _1402;
    float _1440 = fma(_1426, _1426, _1428);
    float _1442 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1444 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1446 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1438 + _1448;
    float _1452 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1456 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1442);
    float _1458 = fma(_1450, _1450, _1440);
    float _1460 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1444);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1446);
    float _1464 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1456);
    out.m_83.x = _1452;
    out.m_83.y = _1420;
    out.m_83.z = _1422;
    out.m_83.w = _1454;
    float _1466 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1460);
    float _1468 = sqrt(_1458);
    float _1470 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1462);
    float _1472 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1314);
    float _1474 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1338);
    float _1476 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1344);
    out.m_85.w = _1002;
    float _1478 = -_1046;
    float _1480 = _848 + _1478;
    float _1482 = -_1044;
    float _1484 = _850 + _1482;
    out.m_87.x = _1464;
    out.m_87.y = _1466;
    out.m_87.z = _1470;
    float _1486 = -_1060;
    float _1488 = _862 + _1486;
    float _1490 = _1006 + 0.5;
    float _1492 = _1180 + 0.5;
    float _1494 = _1342 + 0.5;
    float _1496 = _1340 + 0.5;
    out.m_89.x = _1188;
    bool _1498 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1500 = isnan(_1468);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1506 = _1502 || _1504;
    out.m_91.x = _1496;
    out.m_91.y = _1490;
    out.m_91.z = _1494;
    out.m_91.w = _1492;
    out.m_93.x = _1472;
    out.m_93.y = _1474;
    out.m_93.z = _1476;
    if (!_1506)
    {
        _882 = 1.0;
    }
    float _1508 = _882;
    bool _1510 = !_1506;
    float _1512 = _1508;
    if (!_1510)
    {
        bool _1514 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1516 = isnan(_1468);
        bool _1518 = _1514 || _1516;
        bool _1520 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1522 = _1518 || _1520;
        if (!_1522)
        {
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = _1468 + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1530 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1528;
            float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1534 = _1532 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1536 = 1.0 / _1530;
            float _1538 = _1526 * _1536;
            float _1540 = fma(_1538, _1534, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1512 = _1540;
            _1542 = true;
        }
        else
        {
            bool _1544 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1546 = isnan(_1468);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1552 = _1548 || _1550;
            if (!_1552)
            {
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1468 + _1554;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1564 = _1562 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1566 = 1.0 / _1560;
                float _1568 = _1556 * _1566;
                float _1570 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1512 = _1570;
                _1542 = true;
            }
            else
            {
                _1512 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1542 = false;
    float _1572 = _1512;
    float _1574 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1578 = _1406 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1582 = _1414 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1586 = _1438 + _1584;
    float _1588 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1574);
    float _1590 = fma(_1578, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1592 = fma(_1582, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1594 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1596 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1588);
    float _1598 = -_1484;
    float _1600 = _1598 + _1590;
    float _1602 = fma(_1586, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1604 = -_1480;
    float _1606 = _1604 + _1592;
    float _1608 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1610 = _1600 * _1600;
    float _1612 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1594);
    float _1614 = -_1488;
    float _1616 = _1614 + _1602;
    float _1618 = 1.0 / _1608;
    float _1620 = fma(_1606, _1606, _1610);
    float _1622 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1612);
    float _1624 = fma(_1616, _1616, _1620);
    float _1626 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1628 = sqrt(_1624);
    float _1630 = _1626 + _1608;
    bool _1632 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.5);
    bool _1640 = _1636 || _1638;
    float _1642 = _1630 * _1618;
    float _1644 = _1642 * 0.5;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1648 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1646);
    float _1650 = 1.0 / _1648;
    bool _1652 = _1628 > 0.0;
    float _1654 = _1628;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1658 = _1582;
    float _1660 = _1618;
    float _1662 = _1624;
    if (_1640)
    {
        _1654 = 1.0;
    }
    float _1664 = _1654;
    float _1666 = _1664;
    if (!_1652)
    {
        _1656 = _1592;
    }
    float _1668 = _1656;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1672 = _1650 * _1670;
    float _1674 = _1668;
    if (!_1652)
    {
        _1658 = _1590;
    }
    float _1676 = _1658;
    float _1678 = _1676;
    if (!_1652)
    {
        _1660 = _1602;
    }
    float _1680 = _1660;
    bool _1682 = !_1652;
    float _1684 = _1680;
    float _1686 = _1680;
    if (!_1682)
    {
        float _1688 = _220 * _220;
        float _1690 = fma(_218, _218, _1688);
        float _1692 = fma(_222, _222, _1690);
        float _1694 = rsqrt(_1624);
        float _1696 = sqrt(_1692);
        float _1698 = _1600 * _1694;
        float _1700 = _1606 * _1694;
        float _1702 = _1616 * _1694;
        bool _1704 = _1696 > 0.0;
        float _1706 = _1694;
        float _1708 = _1696;
        if (!_1704)
        {
            _1706 = _1592;
        }
        float _1710 = _1706;
        _1674 = _1710;
        if (!_1704)
        {
            _1708 = _1590;
        }
        float _1712 = _1708;
        _1678 = _1712;
        if (!_1704)
        {
            _1684 = _1602;
        }
        float _1714 = _1684;
        bool _1716 = !_1704;
        _1686 = _1714;
        if (!_1716)
        {
            float _1718 = rsqrt(_1692);
            float _1720 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1722 = _220 * _1718;
            float _1724 = _218 * _1718;
            float _1726 = _1698 * _1722;
            float _1728 = _222 * _1718;
            float _1730 = fma(_1700, _1724, _1726);
            float _1732 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1734 = fma(_1702, _1728, _1730);
            float _1736 = _1734 * _1732;
            float _1738 = fma(_218, _1736, _1592);
            float _1740 = fma(_220, _1736, _1590);
            float _1742 = fma(_222, _1736, _1602);
            _1678 = _1740;
            _1674 = _1738;
            _1686 = _1742;
        }
    }
    float _1744 = _1678;
    float _1746 = _1674;
    float _1748 = _1686;
    if (!_1640)
    {
        float _1750 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1752 = _1750 * 0.15915493667125701904296875;
        float _1754 = _1752 * 6.283185482025146484375;
        float _1756 = cos(_1754);
        float _1758 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1760 = _1758 * 0.15915493667125701904296875;
        float _1762 = _1752 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = 1.0 / _1756;
        float _1768 = _1760 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        float _1772 = _1764 * _1766;
        float _1774 = _1760 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        float _1778 = _1770 * _1772;
        float _1780 = 1.0 / _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1784 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1782;
        float _1786 = 1.0 / _1784;
        float _1788 = _1776 * _1780;
        float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1792 = fma(_1672, _1788, _1790);
        float _1794 = _1792 * _1786;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        _1666 = _1796;
    }
    float _1798 = _1666;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1744 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1806 = _1746 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1810 = _1748 + _1808;
    float _1812 = _1802 * _1802;
    float _1814 = fma(_1806, _1806, _1812);
    float _1816 = fma(_1810, _1810, _1814);
    float _1818 = rsqrt(_1816);
    float _1820 = sqrt(_1816);
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1824 = _1806 * _1822;
    float _1826 = _1810 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 * _1826;
    float _1832 = _1828 + _1830;
    float _1834 = sqrt(_1832);
    bool _1836 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1840 = _1834 + _1838;
    float _1842 = _1818;
    float _1844 = _1832;
    float _1846 = _1840;
    float _1848 = _1802;
    if (_1836)
    {
        float _1850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1842 = _1850;
    }
    float _1852 = _1842;
    if (_1836)
    {
        float _1854 = rsqrt(_1832);
        _1844 = _1854;
    }
    float _1856 = _1844;
    float _1858 = _1856;
    if (_1836)
    {
        float _1860 = _1840 * _1852;
        _1846 = _1860;
    }
    float _1862 = _1846;
    if (_1836)
    {
        float _1864 = _1862 * 0.15915493667125701904296875;
        _1662 = _1864;
    }
    float _1866 = _1662;
    float _1868 = _1852;
    float _1870 = _1866;
    if (_1836)
    {
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1880 = precise::max(0.0, _1878);
    float _1882 = _1810;
    float _1884 = _1880;
    if (_1836)
    {
        float _1886 = _1866 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        _1882 = _1888;
    }
    float _1890 = _1882;
    float _1892 = -_1822;
    float _1894 = -_1880;
    float _1896 = fma(_1802, _1892, _1894);
    float _1898 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1900 = _1896;
    if (_1836)
    {
        float _1902 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1902;
    }
    float _1904 = _1884;
    float _1906 = _1904;
    if (!_1836)
    {
        _1870 = _1824;
    }
    float _1908 = _1870;
    float _1910 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1898);
    float _1912 = _1876;
    float _1914 = _1908;
    if (_1836)
    {
        float _1916 = fma(_1876, _1904, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1906 = _1916;
    }
    float _1918 = _1906;
    float _1920 = _1918;
    if (!_1836)
    {
        _1912 = _1826;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    float _1926 = _1890;
    if (_1836)
    {
        float _1928 = _1890 + (-1.0);
        _1848 = _1928;
    }
    float _1930 = _1848;
    float _1932 = _1930;
    if (_1836)
    {
        float _1934 = _1856 * _1918;
        _1920 = _1934;
    }
    float _1936 = _1920;
    if (!_1836)
    {
        _1858 = _1828;
    }
    float _1938 = _1858;
    float _1940 = _1938;
    if (_1836)
    {
        float _1942 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _1942;
    }
    float _1944 = _1932;
    if (_1836)
    {
        float _1946 = _1824 * _1936;
        _1914 = _1946;
    }
    float _1948 = _1914;
    if (_1836)
    {
        float _1950 = _1826 * _1936;
        _1924 = _1950;
    }
    float _1952 = _1924;
    if (_1836)
    {
        float _1954 = fma(_1896, _1890, _1944);
        _1900 = _1954;
    }
    float _1956 = _1900;
    if (_1836)
    {
        float _1958 = _1948 * _1948;
        _1940 = _1958;
    }
    float _1960 = _1940;
    if (!_1836)
    {
        _1926 = _1830;
    }
    float _1962 = _1926;
    float _1964 = _1962;
    if (_1836)
    {
        float _1966 = _1952 * _1952;
        _1964 = _1966;
    }
    float _1968 = _1964;
    float _1970 = fma(_1956, _1956, _1960);
    float _1972 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = _1970 + _1968;
    float _1976 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1980 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1978);
    float _1982 = precise::clamp(_1980, 0.0, 1.0);
    float _1984 = fma(_1480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1986 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1988 = rsqrt(_1974);
    float _1990 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1992 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = -_1982;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2002 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2004 = floor(_1984);
    float _2006 = -_2000;
    float _2008 = fma(_2006, _1990, 1.0);
    float _2010 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2012 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2002);
    float _2014 = _1988 * _1948;
    float _2016 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2010);
    float _2018 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2012);
    float _2020 = abs(_1996);
    float _2022 = log2(_2020);
    float _2024 = _1988 * _1956;
    float _2026 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2016);
    float _2030 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2032 = _1988 * _1952;
    float _2034 = -_2026;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2042 = floor(_1998);
    float _2044 = -_2032;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1910);
    float _2050 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2040);
    float _2052 = -_2004;
    float _2054 = _1984 + _2052;
    float _2056 = fma(_2046, -0.5, 0.5);
    float _2058 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2060 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2050);
    float _2062 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2066 = log2(_2008);
    float _2068 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2060);
    float _2070 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2064);
    float _2074 = fma(_2046, 0.5, 0.5);
    float _2076 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2078 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2072);
    float _2080 = exp2(_2062);
    float _2082 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2076);
    float _2084 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2078);
    float _2086 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2082);
    float _2088 = 1.0 / _2068;
    float _2090 = -_2042;
    float _2092 = _1998 + _2090;
    float _2094 = fma(_2074, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = _2066 * 0.693147182464599609375;
    float _2098 = fma(_2074, _2094, -0.212114393711090087890625);
    float _2100 = sqrt(_2056);
    float2 _5977 = float2(_2054, _2092);
    float _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5977, float2(0.0), isnan(_5977)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5977, float2(0.0), isnan(_5977)), level(0.0)).x;
    float _2104 = fma(_2074, _2098, 1.570728778839111328125);
    float _2106 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2108 = _2084 * _2088;
    float _2110 = _2024 + 1.0;
    float _2112 = fma(_2108, 0.5, 0.5);
    float _2114 = -_2024;
    float _2116 = fma(_2080, _2110, _2114);
    float _2118 = _2086 * _2088;
    float _2120 = _2100 * 0.636619746685028076171875;
    float _2122 = fma(_2116, 0.5, 0.5);
    float _2124 = fma(_2118, -0.5, 0.5);
    float _2126 = -_2104;
    float _2128 = fma(_2120, _2126, 1.0);
    float3 _6024 = float3(_2112, _2124, _2106);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6024, float3(0.0), isnan(_6024)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6024, float3(0.0), isnan(_6024)), level(0.0)).x;
    float3 _6035 = float3(_2112, _2124, _2106);
    float4 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6035, float3(0.0), isnan(_6035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6035, float3(0.0), isnan(_6035)), level(0.0)).xyzw;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _2133.w;
    float2 _6051 = float2(_2128, _2122);
    float3 _2145 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6051, float2(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6051, float2(0.0), isnan(_6051)), level(0.0)).xyz;
    float _2147 = _2145.x;
    float _2149 = _2145.y;
    float _2151 = _2145.z;
    float _2153 = abs(_1672);
    float _2155 = log2(_2153);
    float _2157 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _1480;
    out.m_95.y = _1484;
    out.m_95.z = _1488;
    bool _2159 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2161 = isnan(_1820);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2167 = _2163 || _2165;
    float _2169 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    out.m_97.x = _1746;
    out.m_97.y = _1744;
    out.m_97.z = _1748;
    bool _2171 = _1672 <= 8000.0;
    bool _2173 = isnan(_1672);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan(8000.0);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2169);
    float _2185 = _2084 + _2068;
    float _2187 = in.m_99.x;
    float _2189 = _2185 * 0.5;
    float _2191 = _2155 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2193 = exp2(_2191);
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2201 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2183);
    float _2203 = fma(_2197, -2.0, 3.0);
    float _2205 = _2197 * _2197;
    float _2207 = _2201 + _2068;
    float _2209 = exp2(_2199);
    out.gl_Position.x = _2084;
    out.gl_Position.y = _2086;
    out.gl_Position.z = _2201;
    out.gl_Position.w = _2068;
    float _2211 = _2205 * _2203;
    float _2213 = _2207 * 0.5;
    float _2215 = -_2211;
    float _2217 = _2215 + 1.0;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2211);
    float _2221 = _2068 * 0.5;
    float _2223 = _2181 * _2219;
    float _2225 = fma(_2086, -0.5, _2221);
    float _2227 = -_2209;
    float _2229 = _2227 + 1.0;
    float _2231 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2233 = _2068;
    float _2235 = _2201;
    float _2237 = _2086;
    float _2239 = _2084;
    if (!_2167)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2241 = _2233;
    float _2243 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_101.x = _2189;
    out.m_101.y = _2225;
    out.m_101.z = _2213;
    out.m_101.w = _2068;
    float _2245 = _2241;
    float _2247 = _2241;
    if (!_2167)
    {
        _2235 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2249 = _2235;
    float _2251 = _2249;
    float _2253 = _2249;
    if (!_2167)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2255 = _2237;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2167)
    {
        _2239 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2261 = _2239;
    float _2263 = _1798 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2265 = -_2102;
    float _2267 = _2265 + 1.0;
    float _2269 = _2267 * _2231;
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = -_2271;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2277 = _2275 * _2187;
    float _2279 = _2243 * _2130;
    float _2281 = -_2243;
    float _2283 = _2281 + 1.0;
    float _2285 = _2141 * _2279;
    float _2287 = _2151 * _2279;
    float _2289 = _2141 * _2283;
    float _2291 = fma(_2147, _2285, _2135);
    float _2293 = fma(_2149, _2285, _2137);
    float _2295 = _2277 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2297 = fma(_2141, _2287, _2139);
    float _2299 = _2135;
    float _2301 = _2277;
    float _2303 = _2261;
    float _2305 = _2261;
    if (!_2167)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2307 = _2299;
    float _2309 = _2307;
    float _2311 = _2307;
    if (!_2167)
    {
        _2301 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2313 = _2301;
    out.m_103.x = _2295;
    out.m_105.x = _2291;
    out.m_105.y = _2293;
    out.m_105.z = _2297;
    out.m_105.w = _2289;
    bool _2315 = !_2167;
    float _2317 = _2313;
    float _2319 = _2313;
    if (!_2315)
    {
        bool _2321 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2323 = isnan(_1820);
        bool _2325 = _2321 || _2323;
        bool _2327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2329 = _2325 || _2327;
        if (!_2329)
        {
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2333 = _1820 + _2331;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2337 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2335;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2343 = 1.0 / _2337;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2361 = _2333 * _2343;
            float _2363 = precise::clamp(_2361, 0.0, 1.0);
            float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2367 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2369 = fma(_2363, _2341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2371 = fma(_2363, _2367, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2373 = fma(_2363, _2347, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2375 = fma(_2363, _2351, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2377 = fma(_2363, _2355, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2379 = fma(_2363, _2359, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2247 = _2373;
            _2305 = _2377;
            _2311 = _2369;
            _2259 = _2375;
            _2253 = _2371;
            _2319 = _2379;
            _2381 = true;
        }
        else
        {
            bool _2383 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2385 = isnan(_1820);
            bool _2387 = _2383 || _2385;
            bool _2389 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2391 = _2387 || _2389;
            if (!_2391)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2393 = _2309;
            _2311 = _2393;
            if (!_2391)
            {
                _2245 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2395 = _2245;
            _2247 = _2395;
            if (!_2391)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2397 = _2251;
            _2253 = _2397;
            if (!_2391)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2399 = _2257;
            _2259 = _2399;
            if (!_2391)
            {
                _2303 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2401 = _2303;
            _2305 = _2401;
            if (!_2391)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2403 = _2317;
            bool _2405 = !_2391;
            _2319 = _2403;
            if (!_2405)
            {
                bool _2407 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2409 = isnan(_1820);
                bool _2411 = _2407 || _2409;
                bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2415 = _2411 || _2413;
                if (!_2415)
                {
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2419 = _1820 + _2417;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2423 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2421;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2429 = 1.0 / _2423;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2447 = _2419 * _2429;
                    float _2449 = precise::clamp(_2447, 0.0, 1.0);
                    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2455 = fma(_2449, _2427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2457 = fma(_2449, _2453, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2459 = fma(_2449, _2433, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2461 = fma(_2449, _2437, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2463 = fma(_2449, _2441, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2465 = fma(_2449, _2445, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2247 = _2459;
                    _2305 = _2463;
                    _2311 = _2455;
                    _2259 = _2461;
                    _2253 = _2457;
                    _2319 = _2465;
                    _2381 = true;
                }
                else
                {
                    _2247 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2305 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2381 = false;
    float _2467 = _2247;
    float _2469 = _2305;
    float _2471 = _2311;
    float _2473 = _2259;
    float _2475 = _2253;
    float _2477 = _2319;
    float _2479 = fma(_1474, -0.5, 0.5);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = -_2467;
    float _2485 = _2483 + _2469;
    float _2487 = _2263 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2489 = -_2471;
    float _2491 = _2489 + _2473;
    out.m_107.x = 0.0;
    float _2493 = fma(_2481, _2485, _2467);
    float _2495 = fma(_2481, _2491, _2471);
    out.m_51.x = _2487;
    float _2497 = -_2475;
    float _2499 = _2497 + _2477;
    float _2501 = _2493 * 0.586610972881317138671875;
    bool _2503 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2505 = fma(_2481, _2499, _2475);
    float _2507 = fma(_2495, 0.298911988735198974609375, _2501);
    bool _2509 = _1798 > 0.0;
    bool _2511 = isnan(_1798);
    bool _2513 = _2509 || _2511;
    bool _2515 = isnan(0.0);
    bool _2517 = _2513 || _2515;
    float _2519 = fma(_2505, 0.114477999508380889892578125, _2507);
    float _2521 = -_2519;
    float _2523 = _2495 + _2521;
    float _2525 = -_2519;
    float _2527 = _2493 + _2525;
    float _2529 = -_2519;
    float _2531 = _2505 + _2529;
    float _2533 = fma(_2523, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    float _2535 = fma(_2527, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    float _2537 = fma(_2531, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    bool _2539 = !_2503;
    if (!_2539)
    {
        float _2541 = -_1744;
        float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2545 = -_1746;
        float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2549 = -_1748;
        float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2553 = _2543 * _2543;
        float _2555 = fma(_2547, _2547, _2553);
        float _2557 = fma(_2551, _2551, _2555);
        float _2559 = sqrt(_2557);
        float _2561 = rsqrt(_2557);
        float _2563 = -_2559;
        float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2567 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2569 = precise::clamp(_2567, 0.0, 1.0);
        float _2571 = _2547 * _2561;
        float _2573 = _2543 * _2561;
        float _2575 = abs(_2569);
        float _2577 = log2(_2575);
        float _2579 = _2551 * _2561;
        float _2581 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2583 = _1474 * _2573;
        float _2585 = -_2573;
        float _2587 = -_2581;
        float _2589 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2587);
        float _2591 = fma(_1472, _2571, _2583);
        float _2593 = -_2579;
        float _2595 = fma(_2593, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2589);
        float _2597 = fma(_1476, _2579, _2591);
        float _2599 = precise::clamp(_2597, 0.0, 1.0);
        float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2603 = _2595 + _2601;
        float _2605 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2607 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2609 = precise::clamp(_2607, 0.0, 1.0);
        float _2611 = exp2(_2605);
        float _2613 = _2611 * _2609;
        float _2615 = _2599 * _2613;
        float _2617 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2619 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2621 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2617;
        out.m_107.y = _2619;
        out.m_107.z = _2621;
    }
    out.m_85.x = _2533;
    out.m_85.y = _2535;
    out.m_85.z = _2537;
    if (_2517)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2623 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2623;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2381 = false;
    bool _1542 = false;
    bool _680 = false;
    bool _534 = false;
    bool _244 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_142);
        out.gl_Position.z = _2680;
    }
    if (!_130)
    {
        return out;
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2749 = as_type<float>(_178);
        out.gl_Position.z = _2749;
    }
    if (_170)
    {
        return out;
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = _182 * _190;
    float _208 = _182 * _196;
    float _210 = fma(_180, _188, _206);
    float _212 = _182 * _202;
    float _214 = fma(_180, _194, _208);
    float _216 = fma(_180, _200, _212);
    float _218 = fma(_184, _192, _210);
    float _220 = fma(_184, _198, _214);
    float _222 = fma(_184, _204, _216);
    bool _224 = !_186;
    float _242;
    if (!_224)
    {
        float _226 = in.m_63.x;
        float _228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _234 = _232 * _228;
        float _236 = floor(_234);
        float _238 = -_236;
        float _240 = _234 + _238;
        _242 = _240;
        _244 = true;
    }
    else
    {
        float _246 = float(_126);
        float _248 = 1.0 / _246;
        float _250 = _160 * _248;
        _242 = _250;
    }
    _244 = false;
    float _252 = _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _252 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _252 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _252 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = 1.0 / _268;
    bool _284 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_252);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_252);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _272;
    float _310 = -_306;
    float _312 = _310 + 1.0;
    bool _314 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _316 = 1.0 / _280;
    float _318 = _256 * _282;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _252 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = fma(_326, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _330 = 1.0 / _276;
    float _332 = _260 * _308;
    bool _334 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_252);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_344;
    float _348 = _346 + 1.0;
    float _350 = _322 * _316;
    bool _352 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_252);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _362 * _348;
    float _366 = _264 * _330;
    float _368 = -_362;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = _294 * _370;
    float _382 = -_294;
    float _384 = _382 + 1.0;
    float _386 = fma(_374, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_378, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _390 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_252);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _306 * _384;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _400 * _312;
    float _418 = fma(_406, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_414, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = _388 * _416;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = _386 * _416;
    float _436 = _328 * _416;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = in.m_65.x;
    float _444 = in.m_65.y;
    float _446 = in.m_65.z;
    float _448 = fma(_428, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_432, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _462 = fma(_420, _402, _452);
    float _464 = fma(_418, _402, _454);
    float _466 = fma(_458, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_422, _402, _460);
    float _482 = fma(_470, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_448, _380, _462);
    float _490 = fma(_450, _380, _464);
    float _492 = fma(_466, _380, _480);
    float _494 = fma(_482, _364, _488);
    float _496 = fma(_484, _364, _490);
    float _498 = fma(_486, _364, _492);
    float _500 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _494);
    float _502 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _496);
    float _504 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _498);
    float _506 = _500 * _442;
    float _508 = _502 * _444;
    float _510 = _504 * _446;
    bool _512 = !_314;
    float _514 = _510;
    float _532;
    if (!_512)
    {
        float _516 = in.m_63.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_126);
        float _538 = 1.0 / _536;
        float _540 = _160 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _546 = _542 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = isnan(_542);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _568 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_542);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _580;
    bool _584 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = isnan(_542);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _550;
    float _598 = -_562;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = _578 * _600;
    float _606 = -_578;
    float _608 = _606 + 1.0;
    float _610 = 1.0 / _566;
    float _612 = _582 * _596;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = fma(_612, _546, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = _616 * _610;
    float _622 = _618 * _604;
    float _624 = -_594;
    float _626 = _624 + 1.0;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _542 + _628;
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[115].x, _622);
    float _634 = _562 * _626;
    float _636 = fma(_620, _630, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = fma(_636, _634, _632);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _646 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[117].x, _640);
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _648;
    out.m_67.y = _650;
    out.m_67.z = _652;
    out.m_67.w = _654;
    bool _656 = !_602;
    float _658 = _654;
    float _660 = _652;
    float _678;
    if (!_656)
    {
        float _662 = in.m_63.x;
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        float _682 = float(_126);
        float _684 = 1.0 / _682;
        float _686 = _160 * _684;
        _678 = _686;
    }
    _680 = false;
    float _688 = _678;
    float _690 = in.m_63.w;
    float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _694 = in.m_69.y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _702 = in.m_63.x;
    float _704 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = in.m_48.x;
    float _708 = in.m_48.y;
    float _710 = in.m_48.z;
    float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _716 = _714 != 0;
    float _718 = in.m_63.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _728 = _726 != 0;
    float _730 = in.m_63.y;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _734 = _732 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _736 = _690 > 0.5;
    float _738 = -_694;
    float _740 = _738 + 1.0;
    float _742 = in.m_57.w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _746 = _712 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _748 = in.m_61.w;
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].z, _744);
    int _752 = _736 ? as_type<int>(_740) : as_type<int>(_694);
    float _754 = _196 * _708;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _758 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _760 = _202 * _708;
    float _762 = fma(_194, _706, _754);
    float _764 = _716 ? as_type<float>(_752) : _694;
    float _766 = -_756;
    float _768 = fma(_758, 2.0, _766);
    float _770 = fma(_200, _706, _760);
    float _772 = in.m_73.x;
    float _774 = in.m_73.y;
    float _776 = in.m_73.z;
    float _778 = in.m_73.w;
    float _780 = _190 * _708;
    bool _782 = _718 > 0.5;
    float _784 = in.m_59.w;
    float _786 = _718;
    float _788 = _694;
    float _790 = _692;
    float _792 = _700;
    if (!_698)
    {
        _658 = _730;
    }
    float _794 = _658;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _798 = _794;
    if (!_698)
    {
        _660 = _718;
    }
    float _800 = _660;
    float _802 = in.m_69.x;
    float _804 = _800;
    if (_698)
    {
        _798 = _702;
    }
    float _806 = _798;
    float _808 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].w, _796);
    if (_698)
    {
        _804 = _730;
    }
    float _810 = _804;
    float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _814 = as_type<int>(_810);
    if (_698)
    {
        _786 = _730;
    }
    float _816 = _786;
    float _818 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _750);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _828 = _826 != 0;
    float _830 = fma(_188, _706, _780);
    bool _832 = _730 > 0.5;
    float _834 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _836 = fma(_204, _710, _770);
    float _838 = fma(_192, _710, _830);
    float _840 = fma(_198, _710, _762);
    int _842 = _832 ? as_type<int>(_740) : as_type<int>(_694);
    float _844 = _774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _846 = fma(_834, -2.0, _724);
    float _848 = _838 + _742;
    float _850 = _840 + _784;
    float _852 = _822 ? as_type<float>(_842) : _694;
    float _854 = _774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _856 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _844);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _850 + _858;
    float _862 = _836 + _748;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _868 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _848 + _874;
    float _878 = _860 * _860;
    bool _880 = _822;
    float _882 = _848;
    if (_722)
    {
        bool _884 = _702 > 0.5;
        _880 = _884;
    }
    bool _886 = _880;
    float _888 = _774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _890 = 1.0 / _866;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _862 + _892;
    float _896 = fma(_876, _876, _878);
    float _898 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _888);
    float _900 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[26].z, _898);
    float _902 = 1.0 / _872;
    float _904 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[25].z, _868);
    float _906 = fma(_894, _894, _896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = _896;
    if (!_722)
    {
        _916 = _802;
    }
    float _918 = _916;
    float _920 = _918;
    if (_828)
    {
        float _922 = _782 ? _740 : _694;
        _788 = _922;
    }
    float _924 = _788;
    float _926 = sqrt(_906);
    float _928 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[24].z, _856);
    float _930 = _914 * _890;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _934 = _688 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _938 = _688 + _936;
    bool _940 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _942 = isnan(_688);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    out.m_75.x = _928;
    out.m_75.y = _904;
    out.m_75.z = _900;
    float _952 = _910 * _902;
    float _954 = fma(_930, _938, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _956 = -_950;
    float _958 = _956 + 1.0;
    float _960 = fma(_952, _934, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _962 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_722)
    {
        _790 = _918;
    }
    float _964 = _790;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _968 = _964;
    if (_722)
    {
        _920 = _802;
    }
    float _970 = _920;
    float _972 = _926 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _974 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _808);
    float _976 = _812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _978 = rsqrt(_906);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _982 = _700 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _984 = fma(_962, _852, -0.5);
    float _986 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _846);
    bool _988 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _990 = isnan(_688);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[83].w, _980);
    float _1002 = precise::min(_982, _972);
    float _1004 = -_986;
    float _1006 = fma(_974, _984, _1004);
    bool _1008 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1010 = isnan(_688);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = -_998;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_764, _976, -0.5);
    float _1026 = in.m_77.x;
    float _1028 = in.m_77.y;
    float _1030 = in.m_77.z;
    float _1032 = _1018 * _1022;
    float _1034 = -_1018;
    float _1036 = _1034 + 1.0;
    float _1038 = _978 * _1002;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1042 = _950 * _1036;
    float _1044 = _860 * _1038;
    float _1046 = _876 * _1038;
    float _1048 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1040);
    float _1050 = _960 * _1042;
    float _1052 = -_1044;
    float _1054 = _860 + _1052;
    float _1056 = -_1046;
    float _1058 = _876 + _1056;
    float _1060 = _894 * _1038;
    float _1062 = -_966;
    float _1064 = fma(_818, 2.0, _1062);
    float _1066 = _1054 * _1054;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1070 = -_1060;
    float _1072 = _894 + _1070;
    float _1074 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1076 = fma(_1058, _1058, _1066);
    float _1078 = _1068;
    if (_722)
    {
        float _1080 = -_970;
        float _1082 = _1080 + 1.0;
        _814 = as_type<int>(_1082);
    }
    int _1084 = _814;
    float _1086 = in.m_79.x;
    float _1088 = in.m_79.y;
    float _1090 = in.m_79.z;
    int _1092 = 0;
    float _1094 = as_type<float>(_1084);
    if (_728)
    {
        float _1096 = -_970;
        float _1098 = _1096 + 1.0;
        _1092 = as_type<int>(_1098);
    }
    int _1100 = _1092;
    float _1102 = fma(_1072, _1072, _1076);
    bool _1104 = _1028 != 0.0;
    bool _1106 = isnan(_1028);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    int _1114 = 0;
    if (_734)
    {
        float _1116 = -_970;
        float _1118 = _1116 + 1.0;
        _1114 = as_type<int>(_1118);
    }
    int _1120 = _1114;
    float _1122 = fma(_1074, -2.0, _1068);
    float _1124 = sqrt(_1102);
    bool _1126 = _1026 == 0.0;
    bool _1128 = !_1112;
    bool _1130 = _1126 && _1128;
    float _1132 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1050);
    if (_722)
    {
        float _1134 = _886 ? as_type<float>(_1084) : _970;
        _968 = _1134;
    }
    float _1136 = _968;
    float _1138 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1000);
    if (!_728)
    {
        _1094 = _970;
    }
    float _1140 = _1094;
    float _1142 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1048);
    float _1144 = _1140;
    if (!_734)
    {
        _1078 = _970;
    }
    float _1146 = _1078;
    float _1148 = -_160;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1064);
    bool _1152 = _1030 == 0.0;
    bool _1154 = _1152 && _1130;
    float _1156 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1122);
    float _1158 = _1146;
    if (_728)
    {
        float _1160 = _782 ? as_type<float>(_1100) : _970;
        _1144 = _1160;
    }
    float _1162 = _1144;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_734)
    {
        float _1166 = _832 ? as_type<float>(_1120) : _970;
        _1158 = _1166;
    }
    float _1168 = _1158;
    float _1170 = -_160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _768);
    float _1174 = _978 * _1124;
    float _1176 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1178 = -_1156;
    float _1180 = fma(_1138, _1024, _1178);
    float _1182 = fma(_746, _1136, -0.5);
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1028);
    float _1186 = _704 * _1174;
    float _1188 = _700 * _1174;
    float _1190 = _1176 * _1174;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1026);
    float _1194 = _1186 * _1184;
    float _1196 = _1184;
    if (_1154)
    {
        _1196 = _1088;
    }
    float _1198 = _1196;
    float _1200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1030);
    float _1202 = _1188 * _1192;
    float _1204 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1206 = _1198;
    float _1208 = _1204;
    if (_1154)
    {
        _792 = _1198;
    }
    float _1210 = _792;
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1214 = _1210;
    if (!_1154)
    {
        _1206 = _1088;
    }
    float _1216 = _1206;
    float _1218 = _1190 * _1200;
    float _1220 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1204);
    float _1224 = _1222;
    if (_1154)
    {
        _1208 = _1090;
    }
    float _1226 = _1208;
    float _1228 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1230 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1234 = _1226;
    if (_1154)
    {
        _1224 = _1226;
    }
    float _1236 = _1224;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1240 = _1236;
    if (!_1154)
    {
        _1234 = _1090;
    }
    float _1242 = _1234;
    float _1244 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1230);
    float _1246 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1248 = fma(_954, _1032, _1132);
    float _1250 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1252 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1254 = _862 + _1246;
    if (!_1154)
    {
        float _1256 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1240 = _1256;
    }
    float _1258 = _1240;
    float _1260 = fma(_1250, _1162, -0.5);
    float _1262 = _848 + _1252;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1254 + _1264;
    float _1268 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1228);
    float _1270 = _1262;
    if (!_1154)
    {
        float _1272 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1214 = _1272;
    }
    float _1274 = _1214;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1262 + _1276;
    float _1280 = _1266 * _1266;
    float _1282 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1154)
    {
        _514 = _1086;
    }
    float _1284 = _514;
    float _1286 = _924 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1288 = fma(_1278, _1278, _1280);
    float _1290 = _1284;
    if (!_1154)
    {
        float _1292 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = _774 * _1242;
    float _1298 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1268);
    float _1300 = sqrt(_1288);
    float _1302 = _1282 * _1212;
    float _1304 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1306 = _776 * _1086;
    float _1308 = -_1296;
    float _1310 = fma(_776, _1216, _1308);
    float _1312 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1248);
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1304);
    float _1316 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1318 = _772 * _1216;
    float _1320 = _1286 * _1238;
    float _1322 = -_1306;
    float _1324 = fma(_772, _1242, _1322);
    float _1326 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1328 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1330 = _850 + _1316;
    float _1332 = -_1318;
    float _1334 = fma(_774, _1086, _1332);
    bool _1336 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1326);
    float _1340 = fma(_824, _1182, _1172);
    float _1342 = fma(_1142, _1260, _1150);
    out.m_81.x = _1302;
    out.m_81.y = _1320;
    float _1344 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1328);
    float _1346 = _1328;
    float _1348 = _1320;
    if (!_1336)
    {
        _1346 = _1254;
    }
    float _1350 = _1346;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = _1350;
    if (!_1336)
    {
        _1348 = _1330;
    }
    float _1356 = _1348;
    bool _1358 = !_1336;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1300 + _1364;
        float _1368 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = rsqrt(_1288);
        float _1372 = _1366 * _1362;
        float _1374 = _1372 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = sin(_1380);
        float _1384 = _1378 + (-1.0);
        float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = fma(_1382, _1368, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1390 = fma(_1330, _1378, _1386);
        float _1392 = _1370 * _1388;
        float _1394 = fma(_1278, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1396 = fma(_1266, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1360 = _1390;
        _1270 = _1394;
        _1354 = _1396;
    }
    float _1398 = _1360;
    float _1400 = _1270;
    float _1402 = _1354;
    float _1404 = -_1044;
    float _1406 = _1404 + _1398;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1412 = -_1046;
    float _1414 = _1412 + _1400;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1418 = _1406 + _1416;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1414 + _1424;
    float _1428 = _1418 * _1418;
    float _1430 = _1324 * _778;
    float _1432 = _1310 * _778;
    float _1434 = _1334 * _778;
    float _1436 = -_1060;
    float _1438 = _1436 + _1402;
    float _1440 = fma(_1426, _1426, _1428);
    float _1442 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1444 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1446 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1438 + _1448;
    float _1452 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1456 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1442);
    float _1458 = fma(_1450, _1450, _1440);
    float _1460 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1444);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1446);
    float _1464 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1456);
    out.m_83.x = _1452;
    out.m_83.y = _1420;
    out.m_83.z = _1422;
    out.m_83.w = _1454;
    float _1466 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1460);
    float _1468 = sqrt(_1458);
    float _1470 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1462);
    float _1472 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1314);
    float _1474 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1338);
    float _1476 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1344);
    out.m_85.w = _1002;
    float _1478 = -_1046;
    float _1480 = _848 + _1478;
    float _1482 = -_1044;
    float _1484 = _850 + _1482;
    out.m_87.x = _1464;
    out.m_87.y = _1466;
    out.m_87.z = _1470;
    float _1486 = -_1060;
    float _1488 = _862 + _1486;
    float _1490 = _1006 + 0.5;
    float _1492 = _1180 + 0.5;
    float _1494 = _1342 + 0.5;
    float _1496 = _1340 + 0.5;
    out.m_89.x = _1188;
    bool _1498 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1500 = isnan(_1468);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1506 = _1502 || _1504;
    out.m_91.x = _1496;
    out.m_91.y = _1490;
    out.m_91.z = _1494;
    out.m_91.w = _1492;
    out.m_93.x = _1472;
    out.m_93.y = _1474;
    out.m_93.z = _1476;
    if (!_1506)
    {
        _882 = 1.0;
    }
    float _1508 = _882;
    bool _1510 = !_1506;
    float _1512 = _1508;
    if (!_1510)
    {
        bool _1514 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1516 = isnan(_1468);
        bool _1518 = _1514 || _1516;
        bool _1520 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1522 = _1518 || _1520;
        if (!_1522)
        {
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = _1468 + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1530 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1528;
            float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1534 = _1532 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1536 = 1.0 / _1530;
            float _1538 = _1526 * _1536;
            float _1540 = fma(_1538, _1534, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1512 = _1540;
            _1542 = true;
        }
        else
        {
            bool _1544 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1546 = isnan(_1468);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1552 = _1548 || _1550;
            if (!_1552)
            {
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1468 + _1554;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1564 = _1562 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1566 = 1.0 / _1560;
                float _1568 = _1556 * _1566;
                float _1570 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1512 = _1570;
                _1542 = true;
            }
            else
            {
                _1512 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1542 = false;
    float _1572 = _1512;
    float _1574 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1578 = _1406 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1582 = _1414 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1586 = _1438 + _1584;
    float _1588 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1574);
    float _1590 = fma(_1578, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1592 = fma(_1582, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1594 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1596 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1588);
    float _1598 = -_1484;
    float _1600 = _1598 + _1590;
    float _1602 = fma(_1586, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1604 = -_1480;
    float _1606 = _1604 + _1592;
    float _1608 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1610 = _1600 * _1600;
    float _1612 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1594);
    float _1614 = -_1488;
    float _1616 = _1614 + _1602;
    float _1618 = 1.0 / _1608;
    float _1620 = fma(_1606, _1606, _1610);
    float _1622 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1612);
    float _1624 = fma(_1616, _1616, _1620);
    float _1626 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1628 = sqrt(_1624);
    float _1630 = _1626 + _1608;
    bool _1632 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.5);
    bool _1640 = _1636 || _1638;
    float _1642 = _1630 * _1618;
    float _1644 = _1642 * 0.5;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1648 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1646);
    float _1650 = 1.0 / _1648;
    bool _1652 = _1628 > 0.0;
    float _1654 = _1628;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1658 = _1582;
    float _1660 = _1618;
    float _1662 = _1624;
    if (_1640)
    {
        _1654 = 1.0;
    }
    float _1664 = _1654;
    float _1666 = _1664;
    if (!_1652)
    {
        _1656 = _1592;
    }
    float _1668 = _1656;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1672 = _1650 * _1670;
    float _1674 = _1668;
    if (!_1652)
    {
        _1658 = _1590;
    }
    float _1676 = _1658;
    float _1678 = _1676;
    if (!_1652)
    {
        _1660 = _1602;
    }
    float _1680 = _1660;
    bool _1682 = !_1652;
    float _1684 = _1680;
    float _1686 = _1680;
    if (!_1682)
    {
        float _1688 = _220 * _220;
        float _1690 = fma(_218, _218, _1688);
        float _1692 = fma(_222, _222, _1690);
        float _1694 = rsqrt(_1624);
        float _1696 = sqrt(_1692);
        float _1698 = _1600 * _1694;
        float _1700 = _1606 * _1694;
        float _1702 = _1616 * _1694;
        bool _1704 = _1696 > 0.0;
        float _1706 = _1694;
        float _1708 = _1696;
        if (!_1704)
        {
            _1706 = _1592;
        }
        float _1710 = _1706;
        _1674 = _1710;
        if (!_1704)
        {
            _1708 = _1590;
        }
        float _1712 = _1708;
        _1678 = _1712;
        if (!_1704)
        {
            _1684 = _1602;
        }
        float _1714 = _1684;
        bool _1716 = !_1704;
        _1686 = _1714;
        if (!_1716)
        {
            float _1718 = rsqrt(_1692);
            float _1720 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1722 = _220 * _1718;
            float _1724 = _218 * _1718;
            float _1726 = _1698 * _1722;
            float _1728 = _222 * _1718;
            float _1730 = fma(_1700, _1724, _1726);
            float _1732 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1734 = fma(_1702, _1728, _1730);
            float _1736 = _1734 * _1732;
            float _1738 = fma(_218, _1736, _1592);
            float _1740 = fma(_220, _1736, _1590);
            float _1742 = fma(_222, _1736, _1602);
            _1678 = _1740;
            _1674 = _1738;
            _1686 = _1742;
        }
    }
    float _1744 = _1678;
    float _1746 = _1674;
    float _1748 = _1686;
    if (!_1640)
    {
        float _1750 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1752 = _1750 * 0.15915493667125701904296875;
        float _1754 = _1752 * 6.283185482025146484375;
        float _1756 = cos(_1754);
        float _1758 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1760 = _1758 * 0.15915493667125701904296875;
        float _1762 = _1752 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = 1.0 / _1756;
        float _1768 = _1760 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        float _1772 = _1764 * _1766;
        float _1774 = _1760 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        float _1778 = _1770 * _1772;
        float _1780 = 1.0 / _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1784 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1782;
        float _1786 = 1.0 / _1784;
        float _1788 = _1776 * _1780;
        float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1792 = fma(_1672, _1788, _1790);
        float _1794 = _1792 * _1786;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        _1666 = _1796;
    }
    float _1798 = _1666;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1744 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1806 = _1746 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1810 = _1748 + _1808;
    float _1812 = _1802 * _1802;
    float _1814 = fma(_1806, _1806, _1812);
    float _1816 = fma(_1810, _1810, _1814);
    float _1818 = rsqrt(_1816);
    float _1820 = sqrt(_1816);
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1824 = _1806 * _1822;
    float _1826 = _1810 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 * _1826;
    float _1832 = _1828 + _1830;
    float _1834 = sqrt(_1832);
    bool _1836 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1840 = _1834 + _1838;
    float _1842 = _1818;
    float _1844 = _1832;
    float _1846 = _1840;
    float _1848 = _1802;
    if (_1836)
    {
        float _1850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1842 = _1850;
    }
    float _1852 = _1842;
    if (_1836)
    {
        float _1854 = rsqrt(_1832);
        _1844 = _1854;
    }
    float _1856 = _1844;
    float _1858 = _1856;
    if (_1836)
    {
        float _1860 = _1840 * _1852;
        _1846 = _1860;
    }
    float _1862 = _1846;
    if (_1836)
    {
        float _1864 = _1862 * 0.15915493667125701904296875;
        _1662 = _1864;
    }
    float _1866 = _1662;
    float _1868 = _1852;
    float _1870 = _1866;
    if (_1836)
    {
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1880 = precise::max(0.0, _1878);
    float _1882 = _1810;
    float _1884 = _1880;
    if (_1836)
    {
        float _1886 = _1866 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        _1882 = _1888;
    }
    float _1890 = _1882;
    float _1892 = -_1822;
    float _1894 = -_1880;
    float _1896 = fma(_1802, _1892, _1894);
    float _1898 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1900 = _1896;
    if (_1836)
    {
        float _1902 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1902;
    }
    float _1904 = _1884;
    float _1906 = _1904;
    if (!_1836)
    {
        _1870 = _1824;
    }
    float _1908 = _1870;
    float _1910 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1898);
    float _1912 = _1876;
    float _1914 = _1908;
    if (_1836)
    {
        float _1916 = fma(_1876, _1904, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1906 = _1916;
    }
    float _1918 = _1906;
    float _1920 = _1918;
    if (!_1836)
    {
        _1912 = _1826;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    float _1926 = _1890;
    if (_1836)
    {
        float _1928 = _1890 + (-1.0);
        _1848 = _1928;
    }
    float _1930 = _1848;
    float _1932 = _1930;
    if (_1836)
    {
        float _1934 = _1856 * _1918;
        _1920 = _1934;
    }
    float _1936 = _1920;
    if (!_1836)
    {
        _1858 = _1828;
    }
    float _1938 = _1858;
    float _1940 = _1938;
    if (_1836)
    {
        float _1942 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _1942;
    }
    float _1944 = _1932;
    if (_1836)
    {
        float _1946 = _1824 * _1936;
        _1914 = _1946;
    }
    float _1948 = _1914;
    if (_1836)
    {
        float _1950 = _1826 * _1936;
        _1924 = _1950;
    }
    float _1952 = _1924;
    if (_1836)
    {
        float _1954 = fma(_1896, _1890, _1944);
        _1900 = _1954;
    }
    float _1956 = _1900;
    if (_1836)
    {
        float _1958 = _1948 * _1948;
        _1940 = _1958;
    }
    float _1960 = _1940;
    if (!_1836)
    {
        _1926 = _1830;
    }
    float _1962 = _1926;
    float _1964 = _1962;
    if (_1836)
    {
        float _1966 = _1952 * _1952;
        _1964 = _1966;
    }
    float _1968 = _1964;
    float _1970 = fma(_1956, _1956, _1960);
    float _1972 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = _1970 + _1968;
    float _1976 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1980 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1978);
    float _1982 = precise::clamp(_1980, 0.0, 1.0);
    float _1984 = fma(_1480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1986 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1988 = rsqrt(_1974);
    float _1990 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1992 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = -_1982;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2002 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2004 = floor(_1984);
    float _2006 = -_2000;
    float _2008 = fma(_2006, _1990, 1.0);
    float _2010 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2012 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2002);
    float _2014 = _1988 * _1948;
    float _2016 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2010);
    float _2018 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2012);
    float _2020 = abs(_1996);
    float _2022 = log2(_2020);
    float _2024 = _1988 * _1956;
    float _2026 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2016);
    float _2030 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2032 = _1988 * _1952;
    float _2034 = -_2026;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2042 = floor(_1998);
    float _2044 = -_2032;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1910);
    float _2050 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2040);
    float _2052 = -_2004;
    float _2054 = _1984 + _2052;
    float _2056 = fma(_2046, -0.5, 0.5);
    float _2058 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2060 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2050);
    float _2062 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2066 = log2(_2008);
    float _2068 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2060);
    float _2070 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2064);
    float _2074 = fma(_2046, 0.5, 0.5);
    float _2076 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2078 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2072);
    float _2080 = exp2(_2062);
    float _2082 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2076);
    float _2084 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2078);
    float _2086 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2082);
    float _2088 = 1.0 / _2068;
    float _2090 = -_2042;
    float _2092 = _1998 + _2090;
    float _2094 = fma(_2074, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = _2066 * 0.693147182464599609375;
    float _2098 = fma(_2074, _2094, -0.212114393711090087890625);
    float _2100 = sqrt(_2056);
    float2 _5977 = float2(_2054, _2092);
    float _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5977, float2(0.0), isnan(_5977)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5977, float2(0.0), isnan(_5977)), level(0.0)).x;
    float _2104 = fma(_2074, _2098, 1.570728778839111328125);
    float _2106 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2108 = _2084 * _2088;
    float _2110 = _2024 + 1.0;
    float _2112 = fma(_2108, 0.5, 0.5);
    float _2114 = -_2024;
    float _2116 = fma(_2080, _2110, _2114);
    float _2118 = _2086 * _2088;
    float _2120 = _2100 * 0.636619746685028076171875;
    float _2122 = fma(_2116, 0.5, 0.5);
    float _2124 = fma(_2118, -0.5, 0.5);
    float _2126 = -_2104;
    float _2128 = fma(_2120, _2126, 1.0);
    float3 _6024 = float3(_2112, _2124, _2106);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6024, float3(0.0), isnan(_6024)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6024, float3(0.0), isnan(_6024)), level(0.0)).x;
    float3 _6035 = float3(_2112, _2124, _2106);
    float4 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6035, float3(0.0), isnan(_6035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6035, float3(0.0), isnan(_6035)), level(0.0)).xyzw;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _2133.w;
    float2 _6051 = float2(_2128, _2122);
    float3 _2145 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6051, float2(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6051, float2(0.0), isnan(_6051)), level(0.0)).xyz;
    float _2147 = _2145.x;
    float _2149 = _2145.y;
    float _2151 = _2145.z;
    float _2153 = abs(_1672);
    float _2155 = log2(_2153);
    float _2157 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _1480;
    out.m_95.y = _1484;
    out.m_95.z = _1488;
    bool _2159 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2161 = isnan(_1820);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2167 = _2163 || _2165;
    float _2169 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    out.m_97.x = _1746;
    out.m_97.y = _1744;
    out.m_97.z = _1748;
    bool _2171 = _1672 <= 8000.0;
    bool _2173 = isnan(_1672);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan(8000.0);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2169);
    float _2185 = _2084 + _2068;
    float _2187 = in.m_99.x;
    float _2189 = _2185 * 0.5;
    float _2191 = _2155 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2193 = exp2(_2191);
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2201 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2183);
    float _2203 = fma(_2197, -2.0, 3.0);
    float _2205 = _2197 * _2197;
    float _2207 = _2201 + _2068;
    float _2209 = exp2(_2199);
    out.gl_Position.x = _2084;
    out.gl_Position.y = _2086;
    out.gl_Position.z = _2201;
    out.gl_Position.w = _2068;
    float _2211 = _2205 * _2203;
    float _2213 = _2207 * 0.5;
    float _2215 = -_2211;
    float _2217 = _2215 + 1.0;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2211);
    float _2221 = _2068 * 0.5;
    float _2223 = _2181 * _2219;
    float _2225 = fma(_2086, -0.5, _2221);
    float _2227 = -_2209;
    float _2229 = _2227 + 1.0;
    float _2231 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2233 = _2068;
    float _2235 = _2201;
    float _2237 = _2086;
    float _2239 = _2084;
    if (!_2167)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2241 = _2233;
    float _2243 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_101.x = _2189;
    out.m_101.y = _2225;
    out.m_101.z = _2213;
    out.m_101.w = _2068;
    float _2245 = _2241;
    float _2247 = _2241;
    if (!_2167)
    {
        _2235 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2249 = _2235;
    float _2251 = _2249;
    float _2253 = _2249;
    if (!_2167)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2255 = _2237;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2167)
    {
        _2239 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2261 = _2239;
    float _2263 = _1798 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2265 = -_2102;
    float _2267 = _2265 + 1.0;
    float _2269 = _2267 * _2231;
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = -_2271;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2277 = _2275 * _2187;
    float _2279 = _2243 * _2130;
    float _2281 = -_2243;
    float _2283 = _2281 + 1.0;
    float _2285 = _2141 * _2279;
    float _2287 = _2151 * _2279;
    float _2289 = _2141 * _2283;
    float _2291 = fma(_2147, _2285, _2135);
    float _2293 = fma(_2149, _2285, _2137);
    float _2295 = _2277 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2297 = fma(_2141, _2287, _2139);
    float _2299 = _2135;
    float _2301 = _2277;
    float _2303 = _2261;
    float _2305 = _2261;
    if (!_2167)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2307 = _2299;
    float _2309 = _2307;
    float _2311 = _2307;
    if (!_2167)
    {
        _2301 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2313 = _2301;
    out.m_103.x = _2295;
    out.m_105.x = _2291;
    out.m_105.y = _2293;
    out.m_105.z = _2297;
    out.m_105.w = _2289;
    bool _2315 = !_2167;
    float _2317 = _2313;
    float _2319 = _2313;
    if (!_2315)
    {
        bool _2321 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2323 = isnan(_1820);
        bool _2325 = _2321 || _2323;
        bool _2327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2329 = _2325 || _2327;
        if (!_2329)
        {
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2333 = _1820 + _2331;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2337 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2335;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2343 = 1.0 / _2337;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2361 = _2333 * _2343;
            float _2363 = precise::clamp(_2361, 0.0, 1.0);
            float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2367 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2369 = fma(_2363, _2341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2371 = fma(_2363, _2367, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2373 = fma(_2363, _2347, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2375 = fma(_2363, _2351, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2377 = fma(_2363, _2355, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2379 = fma(_2363, _2359, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2247 = _2373;
            _2305 = _2377;
            _2311 = _2369;
            _2259 = _2375;
            _2253 = _2371;
            _2319 = _2379;
            _2381 = true;
        }
        else
        {
            bool _2383 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2385 = isnan(_1820);
            bool _2387 = _2383 || _2385;
            bool _2389 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2391 = _2387 || _2389;
            if (!_2391)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2393 = _2309;
            _2311 = _2393;
            if (!_2391)
            {
                _2245 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2395 = _2245;
            _2247 = _2395;
            if (!_2391)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2397 = _2251;
            _2253 = _2397;
            if (!_2391)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2399 = _2257;
            _2259 = _2399;
            if (!_2391)
            {
                _2303 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2401 = _2303;
            _2305 = _2401;
            if (!_2391)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2403 = _2317;
            bool _2405 = !_2391;
            _2319 = _2403;
            if (!_2405)
            {
                bool _2407 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2409 = isnan(_1820);
                bool _2411 = _2407 || _2409;
                bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2415 = _2411 || _2413;
                if (!_2415)
                {
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2419 = _1820 + _2417;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2423 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2421;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2429 = 1.0 / _2423;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2447 = _2419 * _2429;
                    float _2449 = precise::clamp(_2447, 0.0, 1.0);
                    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2455 = fma(_2449, _2427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2457 = fma(_2449, _2453, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2459 = fma(_2449, _2433, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2461 = fma(_2449, _2437, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2463 = fma(_2449, _2441, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2465 = fma(_2449, _2445, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2247 = _2459;
                    _2305 = _2463;
                    _2311 = _2455;
                    _2259 = _2461;
                    _2253 = _2457;
                    _2319 = _2465;
                    _2381 = true;
                }
                else
                {
                    _2247 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2305 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2381 = false;
    float _2467 = _2247;
    float _2469 = _2305;
    float _2471 = _2311;
    float _2473 = _2259;
    float _2475 = _2253;
    float _2477 = _2319;
    float _2479 = fma(_1474, -0.5, 0.5);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = -_2467;
    float _2485 = _2483 + _2469;
    float _2487 = _2263 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2489 = -_2471;
    float _2491 = _2489 + _2473;
    out.m_107.x = 0.0;
    float _2493 = fma(_2481, _2485, _2467);
    float _2495 = fma(_2481, _2491, _2471);
    out.m_51.x = _2487;
    float _2497 = -_2475;
    float _2499 = _2497 + _2477;
    float _2501 = _2493 * 0.586610972881317138671875;
    bool _2503 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2505 = fma(_2481, _2499, _2475);
    float _2507 = fma(_2495, 0.298911988735198974609375, _2501);
    bool _2509 = _1798 > 0.0;
    bool _2511 = isnan(_1798);
    bool _2513 = _2509 || _2511;
    bool _2515 = isnan(0.0);
    bool _2517 = _2513 || _2515;
    float _2519 = fma(_2505, 0.114477999508380889892578125, _2507);
    float _2521 = -_2519;
    float _2523 = _2495 + _2521;
    float _2525 = -_2519;
    float _2527 = _2493 + _2525;
    float _2529 = -_2519;
    float _2531 = _2505 + _2529;
    float _2533 = fma(_2523, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    float _2535 = fma(_2527, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    float _2537 = fma(_2531, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    bool _2539 = !_2503;
    if (!_2539)
    {
        float _2541 = -_1744;
        float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2545 = -_1746;
        float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2549 = -_1748;
        float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2553 = _2543 * _2543;
        float _2555 = fma(_2547, _2547, _2553);
        float _2557 = fma(_2551, _2551, _2555);
        float _2559 = sqrt(_2557);
        float _2561 = rsqrt(_2557);
        float _2563 = -_2559;
        float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2567 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2569 = precise::clamp(_2567, 0.0, 1.0);
        float _2571 = _2547 * _2561;
        float _2573 = _2543 * _2561;
        float _2575 = abs(_2569);
        float _2577 = log2(_2575);
        float _2579 = _2551 * _2561;
        float _2581 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2583 = _1474 * _2573;
        float _2585 = -_2573;
        float _2587 = -_2581;
        float _2589 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2587);
        float _2591 = fma(_1472, _2571, _2583);
        float _2593 = -_2579;
        float _2595 = fma(_2593, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2589);
        float _2597 = fma(_1476, _2579, _2591);
        float _2599 = precise::clamp(_2597, 0.0, 1.0);
        float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2603 = _2595 + _2601;
        float _2605 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2607 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2609 = precise::clamp(_2607, 0.0, 1.0);
        float _2611 = exp2(_2605);
        float _2613 = _2611 * _2609;
        float _2615 = _2599 * _2613;
        float _2617 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2619 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2621 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2617;
        out.m_107.y = _2619;
        out.m_107.z = _2621;
    }
    out.m_85.x = _2533;
    out.m_85.y = _2535;
    out.m_85.z = _2537;
    if (_2517)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2623 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2623;
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
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_107 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_103 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_105 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_101 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2381 = false;
    bool _1542 = false;
    bool _680 = false;
    bool _534 = false;
    bool _244 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _121 = in.m_48.w;
    float _123 = trunc(_121);
    int _126 = int(_123);
    bool _130 = _126 >= 1;
    float _132 = 0.0;
    if (!_130)
    {
        _132 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _134 = _132;
    float _136 = _134;
    if (!_130)
    {
        out.m_51.x = 0.0;
    }
    int _138 = 0;
    if (!_130)
    {
        float _140 = _134 * 5.0;
        _138 = as_type<int>(_140);
    }
    int _142 = _138;
    int _144 = _142;
    if (!_130)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2680 = as_type<float>(_142);
        out.gl_Position.z = _2680;
    }
    if (!_130)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _146 = in.m_53.w;
    bool _148 = _146 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _150 = isnan(_146);
    bool _152 = _148 || _150;
    bool _154 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _156 = _152 || _154;
    float _158 = -_146;
    float _160 = _158 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_156)
    {
        float _162 = float(_126);
        _136 = _162;
    }
    float _164 = _136;
    bool _166 = _160 >= _164;
    bool _168 = !_156;
    bool _170 = _166 || _168;
    float _172 = _164;
    if (_170)
    {
        _172 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _174 = _172;
    if (_170)
    {
        out.m_51.x = 0.0;
    }
    if (_170)
    {
        float _176 = _174 * 5.0;
        _144 = as_type<int>(_176);
    }
    int _178 = _144;
    if (_170)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2749 = as_type<float>(_178);
        out.gl_Position.z = _2749;
    }
    if (_170)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _180 = in.m_55.x;
    float _182 = in.m_55.y;
    float _184 = in.m_55.z;
    bool _186 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _188 = in.m_57.x;
    float _190 = in.m_57.y;
    float _192 = in.m_57.z;
    float _194 = in.m_59.x;
    float _196 = in.m_59.y;
    float _198 = in.m_59.z;
    float _200 = in.m_61.x;
    float _202 = in.m_61.y;
    float _204 = in.m_61.z;
    float _206 = _182 * _190;
    float _208 = _182 * _196;
    float _210 = fma(_180, _188, _206);
    float _212 = _182 * _202;
    float _214 = fma(_180, _194, _208);
    float _216 = fma(_180, _200, _212);
    float _218 = fma(_184, _192, _210);
    float _220 = fma(_184, _198, _214);
    float _222 = fma(_184, _204, _216);
    bool _224 = !_186;
    float _242;
    if (!_224)
    {
        float _226 = in.m_63.x;
        float _228 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _230 = _226 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _232 = fma(_230, (*spvDescriptorSet0.vp_c9)._m0[12].x, _160);
        float _234 = _232 * _228;
        float _236 = floor(_234);
        float _238 = -_236;
        float _240 = _234 + _238;
        _242 = _240;
        _244 = true;
    }
    else
    {
        float _246 = float(_126);
        float _248 = 1.0 / _246;
        float _250 = _160 * _248;
        _242 = _250;
    }
    _244 = false;
    float _252 = _242;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _256 = _252 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _260 = _252 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _264 = _252 + _262;
    float _266 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _268 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _266;
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _272 = _270 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _276 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _274;
    float _278 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _280 = _278 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _282 = 1.0 / _268;
    bool _284 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _286 = isnan(_252);
    bool _288 = _284 || _286;
    bool _290 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _292 = _288 || _290;
    float _294 = float(_292);
    bool _296 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _298 = isnan(_252);
    bool _300 = _296 || _298;
    bool _302 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _304 = _300 || _302;
    float _306 = float(_304);
    float _308 = 1.0 / _272;
    float _310 = -_306;
    float _312 = _310 + 1.0;
    bool _314 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _316 = 1.0 / _280;
    float _318 = _256 * _282;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _322 = _252 + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _324;
    float _328 = fma(_326, _318, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _330 = 1.0 / _276;
    float _332 = _260 * _308;
    bool _334 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _336 = isnan(_252);
    bool _338 = _334 || _336;
    bool _340 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _342 = _338 || _340;
    float _344 = float(_342);
    float _346 = -_344;
    float _348 = _346 + 1.0;
    float _350 = _322 * _316;
    bool _352 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _354 = isnan(_252);
    bool _356 = _352 || _354;
    bool _358 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _360 = _356 || _358;
    float _362 = float(_360);
    float _364 = _362 * _348;
    float _366 = _264 * _330;
    float _368 = -_362;
    float _370 = _368 + 1.0;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _372;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _376;
    float _380 = _294 * _370;
    float _382 = -_294;
    float _384 = _382 + 1.0;
    float _386 = fma(_374, _318, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _388 = fma(_378, _318, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _390 = _252 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _392 = isnan(_252);
    bool _394 = _390 || _392;
    bool _396 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _398 = _394 || _396;
    float _400 = float(_398);
    float _402 = _306 * _384;
    float _404 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _406 = _404 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _414 = _412 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _416 = _400 * _312;
    float _418 = fma(_406, _332, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _420 = fma(_410, _332, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _422 = fma(_414, _332, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _424 = _388 * _416;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _426;
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = _386 * _416;
    float _436 = _328 * _416;
    float _438 = -_400;
    float _440 = _438 + 1.0;
    float _442 = in.m_65.x;
    float _444 = in.m_65.y;
    float _446 = in.m_65.z;
    float _448 = fma(_428, _366, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _450 = fma(_432, _366, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _452 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].x, _434);
    float _454 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].y, _436);
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _456;
    float _460 = fma(_440, (*spvDescriptorSet0.vp_c9)._m0[143].z, _424);
    float _462 = fma(_420, _402, _452);
    float _464 = fma(_418, _402, _454);
    float _466 = fma(_458, _366, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _468 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _470 = _468 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _476 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _478 = _476 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _480 = fma(_422, _402, _460);
    float _482 = fma(_470, _350, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _484 = fma(_474, _350, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _486 = fma(_478, _350, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _488 = fma(_448, _380, _462);
    float _490 = fma(_450, _380, _464);
    float _492 = fma(_466, _380, _480);
    float _494 = fma(_482, _364, _488);
    float _496 = fma(_484, _364, _490);
    float _498 = fma(_486, _364, _492);
    float _500 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].x, _494);
    float _502 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].y, _496);
    float _504 = fma(_344, (*spvDescriptorSet0.vp_c9)._m0[147].z, _498);
    float _506 = _500 * _442;
    float _508 = _502 * _444;
    float _510 = _504 * _446;
    bool _512 = !_314;
    float _514 = _510;
    float _532;
    if (!_512)
    {
        float _516 = in.m_63.x;
        float _518 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _520 = _516 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _522 = fma(_520, (*spvDescriptorSet0.vp_c9)._m0[11].y, _160);
        float _524 = _522 * _518;
        float _526 = floor(_524);
        float _528 = -_526;
        float _530 = _524 + _528;
        _532 = _530;
        _534 = true;
    }
    else
    {
        float _536 = float(_126);
        float _538 = 1.0 / _536;
        float _540 = _160 * _538;
        _532 = _540;
    }
    _534 = false;
    float _542 = _532;
    float _544 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _546 = _542 + _544;
    float _548 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _550 = _548 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _552 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _554 = isnan(_542);
    bool _556 = _552 || _554;
    bool _558 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _560 = _556 || _558;
    float _562 = float(_560);
    float _564 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _566 = _564 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _568 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _570 = isnan(_542);
    bool _572 = _568 || _570;
    bool _574 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _576 = _572 || _574;
    float _578 = float(_576);
    float _580 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _582 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _580;
    bool _584 = _542 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _586 = isnan(_542);
    bool _588 = _584 || _586;
    bool _590 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _592 = _588 || _590;
    float _594 = float(_592);
    float _596 = 1.0 / _550;
    float _598 = -_562;
    float _600 = _598 + 1.0;
    bool _602 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _604 = _578 * _600;
    float _606 = -_578;
    float _608 = _606 + 1.0;
    float _610 = 1.0 / _566;
    float _612 = _582 * _596;
    float _614 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _616 = _614 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _618 = fma(_612, _546, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _620 = _616 * _610;
    float _622 = _618 * _604;
    float _624 = -_594;
    float _626 = _624 + 1.0;
    float _628 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _630 = _542 + _628;
    float _632 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[115].x, _622);
    float _634 = _562 * _626;
    float _636 = fma(_620, _630, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _638 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _640 = fma(_636, _634, _632);
    float _642 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _646 = fma(_594, (*spvDescriptorSet0.vp_c9)._m0[117].x, _640);
    float _648 = _638 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = _642 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _652 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _654 = _646 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_67.x = _648;
    out.m_67.y = _650;
    out.m_67.z = _652;
    out.m_67.w = _654;
    bool _656 = !_602;
    float _658 = _654;
    float _660 = _652;
    float _678;
    if (!_656)
    {
        float _662 = in.m_63.x;
        float _664 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _666 = _662 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _668 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[11].w, _160);
        float _670 = _668 * _664;
        float _672 = floor(_670);
        float _674 = -_672;
        float _676 = _670 + _674;
        _678 = _676;
        _680 = true;
    }
    else
    {
        float _682 = float(_126);
        float _684 = 1.0 / _682;
        float _686 = _160 * _684;
        _678 = _686;
    }
    _680 = false;
    float _688 = _678;
    float _690 = in.m_63.w;
    float _692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _694 = in.m_69.y;
    int _696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _698 = _696 != 0;
    float _700 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _702 = in.m_63.x;
    float _704 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _706 = in.m_48.x;
    float _708 = in.m_48.y;
    float _710 = in.m_48.z;
    float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _714 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _716 = _714 != 0;
    float _718 = in.m_63.z;
    int _720 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _722 = _720 != 0;
    float _724 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _726 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _728 = _726 != 0;
    float _730 = in.m_63.y;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _734 = _732 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    bool _736 = _690 > 0.5;
    float _738 = -_694;
    float _740 = _738 + 1.0;
    float _742 = in.m_57.w;
    float _744 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _746 = _712 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _748 = in.m_61.w;
    float _750 = fma(_702, (*spvDescriptorSet0.vp_c9)._m0[78].z, _744);
    int _752 = _736 ? as_type<int>(_740) : as_type<int>(_694);
    float _754 = _196 * _708;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _758 = _702 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _760 = _202 * _708;
    float _762 = fma(_194, _706, _754);
    float _764 = _716 ? as_type<float>(_752) : _694;
    float _766 = -_756;
    float _768 = fma(_758, 2.0, _766);
    float _770 = fma(_200, _706, _760);
    float _772 = in.m_73.x;
    float _774 = in.m_73.y;
    float _776 = in.m_73.z;
    float _778 = in.m_73.w;
    float _780 = _190 * _708;
    bool _782 = _718 > 0.5;
    float _784 = in.m_59.w;
    float _786 = _718;
    float _788 = _694;
    float _790 = _692;
    float _792 = _700;
    if (!_698)
    {
        _658 = _730;
    }
    float _794 = _658;
    float _796 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _798 = _794;
    if (!_698)
    {
        _660 = _718;
    }
    float _800 = _660;
    float _802 = in.m_69.x;
    float _804 = _800;
    if (_698)
    {
        _798 = _702;
    }
    float _806 = _798;
    float _808 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[78].w, _796);
    if (_698)
    {
        _804 = _730;
    }
    float _810 = _804;
    float _812 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _814 = as_type<int>(_810);
    if (_698)
    {
        _786 = _730;
    }
    float _816 = _786;
    float _818 = _806 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _820 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _822 = _820 != 0;
    float _824 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].z, _750);
    int _826 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _828 = _826 != 0;
    float _830 = fma(_188, _706, _780);
    bool _832 = _730 > 0.5;
    float _834 = _730 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _836 = fma(_204, _710, _770);
    float _838 = fma(_192, _710, _830);
    float _840 = fma(_198, _710, _762);
    int _842 = _832 ? as_type<int>(_740) : as_type<int>(_694);
    float _844 = _774 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _846 = fma(_834, -2.0, _724);
    float _848 = _838 + _742;
    float _850 = _840 + _784;
    float _852 = _822 ? as_type<float>(_842) : _694;
    float _854 = _774 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _856 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[24].x, _844);
    float _858 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _860 = _850 + _858;
    float _862 = _836 + _748;
    float _864 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _866 = _864 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _868 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _870 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _872 = _870 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _874 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _876 = _848 + _874;
    float _878 = _860 * _860;
    bool _880 = _822;
    float _882 = _848;
    if (_722)
    {
        bool _884 = _702 > 0.5;
        _880 = _884;
    }
    bool _886 = _880;
    float _888 = _774 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _890 = 1.0 / _866;
    float _892 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _894 = _862 + _892;
    float _896 = fma(_876, _876, _878);
    float _898 = fma(_772, (*spvDescriptorSet0.vp_c8)._m0[26].x, _888);
    float _900 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[26].z, _898);
    float _902 = 1.0 / _872;
    float _904 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[25].z, _868);
    float _906 = fma(_894, _894, _896);
    float _908 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _910 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _908;
    float _912 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _914 = _912 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _916 = _896;
    if (!_722)
    {
        _916 = _802;
    }
    float _918 = _916;
    float _920 = _918;
    if (_828)
    {
        float _922 = _782 ? _740 : _694;
        _788 = _922;
    }
    float _924 = _788;
    float _926 = sqrt(_906);
    float _928 = fma(_776, (*spvDescriptorSet0.vp_c8)._m0[24].z, _856);
    float _930 = _914 * _890;
    float _932 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _934 = _688 + _932;
    float _936 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _938 = _688 + _936;
    bool _940 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _942 = isnan(_688);
    bool _944 = _940 || _942;
    bool _946 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _948 = _944 || _946;
    float _950 = float(_948);
    out.m_75.x = _928;
    out.m_75.y = _904;
    out.m_75.z = _900;
    float _952 = _910 * _902;
    float _954 = fma(_930, _938, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _956 = -_950;
    float _958 = _956 + 1.0;
    float _960 = fma(_952, _934, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _962 = _692 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (!_722)
    {
        _790 = _918;
    }
    float _964 = _790;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _968 = _964;
    if (_722)
    {
        _920 = _802;
    }
    float _970 = _920;
    float _972 = _926 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _974 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[77].w, _808);
    float _976 = _812 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _978 = rsqrt(_906);
    float _980 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _982 = _700 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _984 = fma(_962, _852, -0.5);
    float _986 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[76].y, _846);
    bool _988 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _990 = isnan(_688);
    bool _992 = _988 || _990;
    bool _994 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _996 = _992 || _994;
    float _998 = float(_996);
    float _1000 = fma(_816, (*spvDescriptorSet0.vp_c9)._m0[83].w, _980);
    float _1002 = precise::min(_982, _972);
    float _1004 = -_986;
    float _1006 = fma(_974, _984, _1004);
    bool _1008 = _688 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1010 = isnan(_688);
    bool _1012 = _1008 || _1010;
    bool _1014 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1016 = _1012 || _1014;
    float _1018 = float(_1016);
    float _1020 = -_998;
    float _1022 = _1020 + 1.0;
    float _1024 = fma(_764, _976, -0.5);
    float _1026 = in.m_77.x;
    float _1028 = in.m_77.y;
    float _1030 = in.m_77.z;
    float _1032 = _1018 * _1022;
    float _1034 = -_1018;
    float _1036 = _1034 + 1.0;
    float _1038 = _978 * _1002;
    float _1040 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1042 = _950 * _1036;
    float _1044 = _860 * _1038;
    float _1046 = _876 * _1038;
    float _1048 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1040);
    float _1050 = _960 * _1042;
    float _1052 = -_1044;
    float _1054 = _860 + _1052;
    float _1056 = -_1046;
    float _1058 = _876 + _1056;
    float _1060 = _894 * _1038;
    float _1062 = -_966;
    float _1064 = fma(_818, 2.0, _1062);
    float _1066 = _1054 * _1054;
    float _1068 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1070 = -_1060;
    float _1072 = _894 + _1070;
    float _1074 = _810 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1076 = fma(_1058, _1058, _1066);
    float _1078 = _1068;
    if (_722)
    {
        float _1080 = -_970;
        float _1082 = _1080 + 1.0;
        _814 = as_type<int>(_1082);
    }
    int _1084 = _814;
    float _1086 = in.m_79.x;
    float _1088 = in.m_79.y;
    float _1090 = in.m_79.z;
    int _1092 = 0;
    float _1094 = as_type<float>(_1084);
    if (_728)
    {
        float _1096 = -_970;
        float _1098 = _1096 + 1.0;
        _1092 = as_type<int>(_1098);
    }
    int _1100 = _1092;
    float _1102 = fma(_1072, _1072, _1076);
    bool _1104 = _1028 != 0.0;
    bool _1106 = isnan(_1028);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    int _1114 = 0;
    if (_734)
    {
        float _1116 = -_970;
        float _1118 = _1116 + 1.0;
        _1114 = as_type<int>(_1118);
    }
    int _1120 = _1114;
    float _1122 = fma(_1074, -2.0, _1068);
    float _1124 = sqrt(_1102);
    bool _1126 = _1026 == 0.0;
    bool _1128 = !_1112;
    bool _1130 = _1126 && _1128;
    float _1132 = fma(_958, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1050);
    if (_722)
    {
        float _1134 = _886 ? as_type<float>(_1084) : _970;
        _968 = _1134;
    }
    float _1136 = _968;
    float _1138 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1000);
    if (!_728)
    {
        _1094 = _970;
    }
    float _1140 = _1094;
    float _1142 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1048);
    float _1144 = _1140;
    if (!_734)
    {
        _1078 = _970;
    }
    float _1146 = _1078;
    float _1148 = -_160;
    float _1150 = fma(_1148, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1064);
    bool _1152 = _1030 == 0.0;
    bool _1154 = _1152 && _1130;
    float _1156 = fma(_160, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1122);
    float _1158 = _1146;
    if (_728)
    {
        float _1160 = _782 ? as_type<float>(_1100) : _970;
        _1144 = _1160;
    }
    float _1162 = _1144;
    float _1164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_734)
    {
        float _1166 = _832 ? as_type<float>(_1120) : _970;
        _1158 = _1166;
    }
    float _1168 = _1158;
    float _1170 = -_160;
    float _1172 = fma(_1170, (*spvDescriptorSet0.vp_c9)._m0[76].x, _768);
    float _1174 = _978 * _1124;
    float _1176 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1178 = -_1156;
    float _1180 = fma(_1138, _1024, _1178);
    float _1182 = fma(_746, _1136, -0.5);
    float _1184 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1028);
    float _1186 = _704 * _1174;
    float _1188 = _700 * _1174;
    float _1190 = _1176 * _1174;
    float _1192 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1026);
    float _1194 = _1186 * _1184;
    float _1196 = _1184;
    if (_1154)
    {
        _1196 = _1088;
    }
    float _1198 = _1196;
    float _1200 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1030);
    float _1202 = _1188 * _1192;
    float _1204 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1206 = _1198;
    float _1208 = _1204;
    if (_1154)
    {
        _792 = _1198;
    }
    float _1210 = _792;
    float _1212 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1214 = _1210;
    if (!_1154)
    {
        _1206 = _1088;
    }
    float _1216 = _1206;
    float _1218 = _1190 * _1200;
    float _1220 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1222 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1204);
    float _1224 = _1222;
    if (_1154)
    {
        _1208 = _1090;
    }
    float _1226 = _1208;
    float _1228 = _1194 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1230 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1220);
    float _1232 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1222);
    float _1234 = _1226;
    if (_1154)
    {
        _1224 = _1226;
    }
    float _1236 = _1224;
    float _1238 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1240 = _1236;
    if (!_1154)
    {
        _1234 = _1090;
    }
    float _1242 = _1234;
    float _1244 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1230);
    float _1246 = _1232 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1248 = fma(_954, _1032, _1132);
    float _1250 = _1164 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1252 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1254 = _862 + _1246;
    if (!_1154)
    {
        float _1256 = fma(_1030, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1242);
        _1240 = _1256;
    }
    float _1258 = _1240;
    float _1260 = fma(_1250, _1162, -0.5);
    float _1262 = _848 + _1252;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1266 = _1254 + _1264;
    float _1268 = fma(_1202, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1228);
    float _1270 = _1262;
    if (!_1154)
    {
        float _1272 = fma(_1028, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1216);
        _1214 = _1272;
    }
    float _1274 = _1214;
    float _1276 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1278 = _1262 + _1276;
    float _1280 = _1266 * _1266;
    float _1282 = _1168 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    if (_1154)
    {
        _514 = _1086;
    }
    float _1284 = _514;
    float _1286 = _924 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1288 = fma(_1278, _1278, _1280);
    float _1290 = _1284;
    if (!_1154)
    {
        float _1292 = fma(_1026, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1086);
        _1290 = _1292;
    }
    float _1294 = _1290;
    float _1296 = _774 * _1242;
    float _1298 = fma(_1218, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1268);
    float _1300 = sqrt(_1288);
    float _1302 = _1282 * _1212;
    float _1304 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1306 = _776 * _1086;
    float _1308 = -_1296;
    float _1310 = fma(_776, _1216, _1308);
    float _1312 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1248);
    float _1314 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1304);
    float _1316 = _1298 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1318 = _772 * _1216;
    float _1320 = _1286 * _1238;
    float _1322 = -_1306;
    float _1324 = fma(_772, _1242, _1322);
    float _1326 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1328 = _1274 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1330 = _850 + _1316;
    float _1332 = -_1318;
    float _1334 = fma(_774, _1086, _1332);
    bool _1336 = _1300 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1338 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1326);
    float _1340 = fma(_824, _1182, _1172);
    float _1342 = fma(_1142, _1260, _1150);
    out.m_81.x = _1302;
    out.m_81.y = _1320;
    float _1344 = fma(_1294, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1328);
    float _1346 = _1328;
    float _1348 = _1320;
    if (!_1336)
    {
        _1346 = _1254;
    }
    float _1350 = _1346;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1354 = _1350;
    if (!_1336)
    {
        _1348 = _1330;
    }
    float _1356 = _1348;
    bool _1358 = !_1336;
    float _1360 = _1356;
    if (!_1358)
    {
        float _1362 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1364 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1366 = _1300 + _1364;
        float _1368 = _1330 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1370 = rsqrt(_1288);
        float _1372 = _1366 * _1362;
        float _1374 = _1372 * 0.15915493667125701904296875;
        float _1376 = _1374 * 6.283185482025146484375;
        float _1378 = cos(_1376);
        float _1380 = _1374 * 6.283185482025146484375;
        float _1382 = sin(_1380);
        float _1384 = _1378 + (-1.0);
        float _1386 = _1384 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1388 = fma(_1382, _1368, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1390 = fma(_1330, _1378, _1386);
        float _1392 = _1370 * _1388;
        float _1394 = fma(_1278, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1396 = fma(_1266, _1392, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1360 = _1390;
        _1270 = _1394;
        _1354 = _1396;
    }
    float _1398 = _1360;
    float _1400 = _1270;
    float _1402 = _1354;
    float _1404 = -_1044;
    float _1406 = _1404 + _1398;
    float _1408 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1410 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1412 = -_1046;
    float _1414 = _1412 + _1400;
    float _1416 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1418 = _1406 + _1416;
    float _1420 = _1408 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1422 = _1410 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1424 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1426 = _1414 + _1424;
    float _1428 = _1418 * _1418;
    float _1430 = _1324 * _778;
    float _1432 = _1310 * _778;
    float _1434 = _1334 * _778;
    float _1436 = -_1060;
    float _1438 = _1436 + _1402;
    float _1440 = fma(_1426, _1426, _1428);
    float _1442 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1444 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1446 = _1430 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1438 + _1448;
    float _1452 = _1352 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1454 = _1312 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1456 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1442);
    float _1458 = fma(_1450, _1450, _1440);
    float _1460 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1444);
    float _1462 = fma(_1432, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1446);
    float _1464 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1456);
    out.m_83.x = _1452;
    out.m_83.y = _1420;
    out.m_83.z = _1422;
    out.m_83.w = _1454;
    float _1466 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1460);
    float _1468 = sqrt(_1458);
    float _1470 = fma(_1434, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1462);
    float _1472 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1314);
    float _1474 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1338);
    float _1476 = fma(_1258, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1344);
    out.m_85.w = _1002;
    float _1478 = -_1046;
    float _1480 = _848 + _1478;
    float _1482 = -_1044;
    float _1484 = _850 + _1482;
    out.m_87.x = _1464;
    out.m_87.y = _1466;
    out.m_87.z = _1470;
    float _1486 = -_1060;
    float _1488 = _862 + _1486;
    float _1490 = _1006 + 0.5;
    float _1492 = _1180 + 0.5;
    float _1494 = _1342 + 0.5;
    float _1496 = _1340 + 0.5;
    out.m_89.x = _1188;
    bool _1498 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1500 = isnan(_1468);
    bool _1502 = _1498 || _1500;
    bool _1504 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1506 = _1502 || _1504;
    out.m_91.x = _1496;
    out.m_91.y = _1490;
    out.m_91.z = _1494;
    out.m_91.w = _1492;
    out.m_93.x = _1472;
    out.m_93.y = _1474;
    out.m_93.z = _1476;
    if (!_1506)
    {
        _882 = 1.0;
    }
    float _1508 = _882;
    bool _1510 = !_1506;
    float _1512 = _1508;
    if (!_1510)
    {
        bool _1514 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1516 = isnan(_1468);
        bool _1518 = _1514 || _1516;
        bool _1520 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1522 = _1518 || _1520;
        if (!_1522)
        {
            float _1524 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1526 = _1468 + _1524;
            float _1528 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1530 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1528;
            float _1532 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1534 = _1532 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1536 = 1.0 / _1530;
            float _1538 = _1526 * _1536;
            float _1540 = fma(_1538, _1534, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1512 = _1540;
            _1542 = true;
        }
        else
        {
            bool _1544 = _1468 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1546 = isnan(_1468);
            bool _1548 = _1544 || _1546;
            bool _1550 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1552 = _1548 || _1550;
            if (!_1552)
            {
                float _1554 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1556 = _1468 + _1554;
                float _1558 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1560 = _1558 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1562 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1564 = _1562 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1566 = 1.0 / _1560;
                float _1568 = _1556 * _1566;
                float _1570 = fma(_1568, _1564, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1512 = _1570;
                _1542 = true;
            }
            else
            {
                _1512 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1542 = false;
    float _1572 = _1512;
    float _1574 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1576 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1578 = _1406 + _1576;
    float _1580 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1582 = _1414 + _1580;
    float _1584 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1586 = _1438 + _1584;
    float _1588 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1574);
    float _1590 = fma(_1578, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1592 = fma(_1582, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1594 = _1484 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1596 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1588);
    float _1598 = -_1484;
    float _1600 = _1598 + _1590;
    float _1602 = fma(_1586, _1572, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1604 = -_1480;
    float _1606 = _1604 + _1592;
    float _1608 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1610 = _1600 * _1600;
    float _1612 = fma(_1480, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1594);
    float _1614 = -_1488;
    float _1616 = _1614 + _1602;
    float _1618 = 1.0 / _1608;
    float _1620 = fma(_1606, _1606, _1610);
    float _1622 = fma(_1488, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1612);
    float _1624 = fma(_1616, _1616, _1620);
    float _1626 = _1622 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1628 = sqrt(_1624);
    float _1630 = _1626 + _1608;
    bool _1632 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1634 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1636 = _1632 || _1634;
    bool _1638 = isnan(0.5);
    bool _1640 = _1636 || _1638;
    float _1642 = _1630 * _1618;
    float _1644 = _1642 * 0.5;
    float _1646 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1648 = fma(_1644, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1646);
    float _1650 = 1.0 / _1648;
    bool _1652 = _1628 > 0.0;
    float _1654 = _1628;
    float _1656 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1658 = _1582;
    float _1660 = _1618;
    float _1662 = _1624;
    if (_1640)
    {
        _1654 = 1.0;
    }
    float _1664 = _1654;
    float _1666 = _1664;
    if (!_1652)
    {
        _1656 = _1592;
    }
    float _1668 = _1656;
    float _1670 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1672 = _1650 * _1670;
    float _1674 = _1668;
    if (!_1652)
    {
        _1658 = _1590;
    }
    float _1676 = _1658;
    float _1678 = _1676;
    if (!_1652)
    {
        _1660 = _1602;
    }
    float _1680 = _1660;
    bool _1682 = !_1652;
    float _1684 = _1680;
    float _1686 = _1680;
    if (!_1682)
    {
        float _1688 = _220 * _220;
        float _1690 = fma(_218, _218, _1688);
        float _1692 = fma(_222, _222, _1690);
        float _1694 = rsqrt(_1624);
        float _1696 = sqrt(_1692);
        float _1698 = _1600 * _1694;
        float _1700 = _1606 * _1694;
        float _1702 = _1616 * _1694;
        bool _1704 = _1696 > 0.0;
        float _1706 = _1694;
        float _1708 = _1696;
        if (!_1704)
        {
            _1706 = _1592;
        }
        float _1710 = _1706;
        _1674 = _1710;
        if (!_1704)
        {
            _1708 = _1590;
        }
        float _1712 = _1708;
        _1678 = _1712;
        if (!_1704)
        {
            _1684 = _1602;
        }
        float _1714 = _1684;
        bool _1716 = !_1704;
        _1686 = _1714;
        if (!_1716)
        {
            float _1718 = rsqrt(_1692);
            float _1720 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1722 = _220 * _1718;
            float _1724 = _218 * _1718;
            float _1726 = _1698 * _1722;
            float _1728 = _222 * _1718;
            float _1730 = fma(_1700, _1724, _1726);
            float _1732 = _1720 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1734 = fma(_1702, _1728, _1730);
            float _1736 = _1734 * _1732;
            float _1738 = fma(_218, _1736, _1592);
            float _1740 = fma(_220, _1736, _1590);
            float _1742 = fma(_222, _1736, _1602);
            _1678 = _1740;
            _1674 = _1738;
            _1686 = _1742;
        }
    }
    float _1744 = _1678;
    float _1746 = _1674;
    float _1748 = _1686;
    if (!_1640)
    {
        float _1750 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1752 = _1750 * 0.15915493667125701904296875;
        float _1754 = _1752 * 6.283185482025146484375;
        float _1756 = cos(_1754);
        float _1758 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1760 = _1758 * 0.15915493667125701904296875;
        float _1762 = _1752 * 6.283185482025146484375;
        float _1764 = sin(_1762);
        float _1766 = 1.0 / _1756;
        float _1768 = _1760 * 6.283185482025146484375;
        float _1770 = cos(_1768);
        float _1772 = _1764 * _1766;
        float _1774 = _1760 * 6.283185482025146484375;
        float _1776 = sin(_1774);
        float _1778 = _1770 * _1772;
        float _1780 = 1.0 / _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1784 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1782;
        float _1786 = 1.0 / _1784;
        float _1788 = _1776 * _1780;
        float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1792 = fma(_1672, _1788, _1790);
        float _1794 = _1792 * _1786;
        float _1796 = precise::clamp(_1794, 0.0, 1.0);
        _1666 = _1796;
    }
    float _1798 = _1666;
    float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1802 = _1744 + _1800;
    float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1806 = _1746 + _1804;
    float _1808 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1810 = _1748 + _1808;
    float _1812 = _1802 * _1802;
    float _1814 = fma(_1806, _1806, _1812);
    float _1816 = fma(_1810, _1810, _1814);
    float _1818 = rsqrt(_1816);
    float _1820 = sqrt(_1816);
    float _1822 = _1818 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1824 = _1806 * _1822;
    float _1826 = _1810 * _1822;
    float _1828 = _1824 * _1824;
    float _1830 = _1826 * _1826;
    float _1832 = _1828 + _1830;
    float _1834 = sqrt(_1832);
    bool _1836 = _1834 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1838 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1840 = _1834 + _1838;
    float _1842 = _1818;
    float _1844 = _1832;
    float _1846 = _1840;
    float _1848 = _1802;
    if (_1836)
    {
        float _1850 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1842 = _1850;
    }
    float _1852 = _1842;
    if (_1836)
    {
        float _1854 = rsqrt(_1832);
        _1844 = _1854;
    }
    float _1856 = _1844;
    float _1858 = _1856;
    if (_1836)
    {
        float _1860 = _1840 * _1852;
        _1846 = _1860;
    }
    float _1862 = _1846;
    if (_1836)
    {
        float _1864 = _1862 * 0.15915493667125701904296875;
        _1662 = _1864;
    }
    float _1866 = _1662;
    float _1868 = _1852;
    float _1870 = _1866;
    if (_1836)
    {
        float _1872 = _1866 * 6.283185482025146484375;
        float _1874 = sin(_1872);
        _1868 = _1874;
    }
    float _1876 = _1868;
    float _1878 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1880 = precise::max(0.0, _1878);
    float _1882 = _1810;
    float _1884 = _1880;
    if (_1836)
    {
        float _1886 = _1866 * 6.283185482025146484375;
        float _1888 = cos(_1886);
        _1882 = _1888;
    }
    float _1890 = _1882;
    float _1892 = -_1822;
    float _1894 = -_1880;
    float _1896 = fma(_1802, _1892, _1894);
    float _1898 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1900 = _1896;
    if (_1836)
    {
        float _1902 = _1896 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1884 = _1902;
    }
    float _1904 = _1884;
    float _1906 = _1904;
    if (!_1836)
    {
        _1870 = _1824;
    }
    float _1908 = _1870;
    float _1910 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1898);
    float _1912 = _1876;
    float _1914 = _1908;
    if (_1836)
    {
        float _1916 = fma(_1876, _1904, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1906 = _1916;
    }
    float _1918 = _1906;
    float _1920 = _1918;
    if (!_1836)
    {
        _1912 = _1826;
    }
    float _1922 = _1912;
    float _1924 = _1922;
    float _1926 = _1890;
    if (_1836)
    {
        float _1928 = _1890 + (-1.0);
        _1848 = _1928;
    }
    float _1930 = _1848;
    float _1932 = _1930;
    if (_1836)
    {
        float _1934 = _1856 * _1918;
        _1920 = _1934;
    }
    float _1936 = _1920;
    if (!_1836)
    {
        _1858 = _1828;
    }
    float _1938 = _1858;
    float _1940 = _1938;
    if (_1836)
    {
        float _1942 = _1930 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1932 = _1942;
    }
    float _1944 = _1932;
    if (_1836)
    {
        float _1946 = _1824 * _1936;
        _1914 = _1946;
    }
    float _1948 = _1914;
    if (_1836)
    {
        float _1950 = _1826 * _1936;
        _1924 = _1950;
    }
    float _1952 = _1924;
    if (_1836)
    {
        float _1954 = fma(_1896, _1890, _1944);
        _1900 = _1954;
    }
    float _1956 = _1900;
    if (_1836)
    {
        float _1958 = _1948 * _1948;
        _1940 = _1958;
    }
    float _1960 = _1940;
    if (!_1836)
    {
        _1926 = _1830;
    }
    float _1962 = _1926;
    float _1964 = _1962;
    if (_1836)
    {
        float _1966 = _1952 * _1952;
        _1964 = _1966;
    }
    float _1968 = _1964;
    float _1970 = fma(_1956, _1956, _1960);
    float _1972 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1974 = _1970 + _1968;
    float _1976 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1972);
    float _1978 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1980 = fma(_1820, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1978);
    float _1982 = precise::clamp(_1980, 0.0, 1.0);
    float _1984 = fma(_1480, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1986 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1976);
    float _1988 = rsqrt(_1974);
    float _1990 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1992 = _1986 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1994 = -_1982;
    float _1996 = _1994 + 1.0;
    float _1998 = fma(_1488, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2000 = _1992 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2002 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2004 = floor(_1984);
    float _2006 = -_2000;
    float _2008 = fma(_2006, _1990, 1.0);
    float _2010 = _1744 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2012 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2002);
    float _2014 = _1988 * _1948;
    float _2016 = fma(_1746, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2010);
    float _2018 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2012);
    float _2020 = abs(_1996);
    float _2022 = log2(_2020);
    float _2024 = _1988 * _1956;
    float _2026 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2028 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2016);
    float _2030 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2032 = _1988 * _1952;
    float _2034 = -_2026;
    float _2036 = fma(_2024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2034);
    float _2038 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2040 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2042 = floor(_1998);
    float _2044 = -_2032;
    float _2046 = fma(_2044, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2036);
    float _2048 = fma(_1748, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1910);
    float _2050 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2040);
    float _2052 = -_2004;
    float _2054 = _1984 + _2052;
    float _2056 = fma(_2046, -0.5, 0.5);
    float _2058 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2060 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2050);
    float _2062 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2064 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2066 = log2(_2008);
    float _2068 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2060);
    float _2070 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2072 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2064);
    float _2074 = fma(_2046, 0.5, 0.5);
    float _2076 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2070);
    float _2078 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2072);
    float _2080 = exp2(_2062);
    float _2082 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2076);
    float _2084 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2078);
    float _2086 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2082);
    float _2088 = 1.0 / _2068;
    float _2090 = -_2042;
    float _2092 = _1998 + _2090;
    float _2094 = fma(_2074, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2096 = _2066 * 0.693147182464599609375;
    float _2098 = fma(_2074, _2094, -0.212114393711090087890625);
    float _2100 = sqrt(_2056);
    float2 _5977 = float2(_2054, _2092);
    float _2102 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5977, float2(0.0), isnan(_5977)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5977, float2(0.0), isnan(_5977)), level(0.0)).x;
    float _2104 = fma(_2074, _2098, 1.570728778839111328125);
    float _2106 = _2096 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2108 = _2084 * _2088;
    float _2110 = _2024 + 1.0;
    float _2112 = fma(_2108, 0.5, 0.5);
    float _2114 = -_2024;
    float _2116 = fma(_2080, _2110, _2114);
    float _2118 = _2086 * _2088;
    float _2120 = _2100 * 0.636619746685028076171875;
    float _2122 = fma(_2116, 0.5, 0.5);
    float _2124 = fma(_2118, -0.5, 0.5);
    float _2126 = -_2104;
    float _2128 = fma(_2120, _2126, 1.0);
    float3 _6024 = float3(_2112, _2124, _2106);
    float _2130 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6024, float3(0.0), isnan(_6024)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6024, float3(0.0), isnan(_6024)), level(0.0)).x;
    float3 _6035 = float3(_2112, _2124, _2106);
    float4 _2133 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6035, float3(0.0), isnan(_6035)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6035, float3(0.0), isnan(_6035)), level(0.0)).xyzw;
    float _2135 = _2133.x;
    float _2137 = _2133.y;
    float _2139 = _2133.z;
    float _2141 = _2133.w;
    float2 _6051 = float2(_2128, _2122);
    float3 _2145 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6051, float2(0.0), isnan(_6051)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6051, float2(0.0), isnan(_6051)), level(0.0)).xyz;
    float _2147 = _2145.x;
    float _2149 = _2145.y;
    float _2151 = _2145.z;
    float _2153 = abs(_1672);
    float _2155 = log2(_2153);
    float _2157 = _2030 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_95.x = _1480;
    out.m_95.y = _1484;
    out.m_95.z = _1488;
    bool _2159 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2161 = isnan(_1820);
    bool _2163 = _2159 || _2161;
    bool _2165 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2167 = _2163 || _2165;
    float _2169 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2157);
    out.m_97.x = _1746;
    out.m_97.y = _1744;
    out.m_97.z = _1748;
    bool _2171 = _1672 <= 8000.0;
    bool _2173 = isnan(_1672);
    bool _2175 = _2171 || _2173;
    bool _2177 = isnan(8000.0);
    bool _2179 = _2175 || _2177;
    float _2181 = float(_2179);
    float _2183 = fma(_1992, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2169);
    float _2185 = _2084 + _2068;
    float _2187 = in.m_99.x;
    float _2189 = _2185 * 0.5;
    float _2191 = _2155 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2193 = exp2(_2191);
    float _2195 = fma(_2193, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2197 = precise::clamp(_2195, 0.0, 1.0);
    float _2199 = _2022 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2201 = fma(_2058, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2183);
    float _2203 = fma(_2197, -2.0, 3.0);
    float _2205 = _2197 * _2197;
    float _2207 = _2201 + _2068;
    float _2209 = exp2(_2199);
    out.gl_Position.x = _2084;
    out.gl_Position.y = _2086;
    out.gl_Position.z = _2201;
    out.gl_Position.w = _2068;
    float _2211 = _2205 * _2203;
    float _2213 = _2207 * 0.5;
    float _2215 = -_2211;
    float _2217 = _2215 + 1.0;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2211);
    float _2221 = _2068 * 0.5;
    float _2223 = _2181 * _2219;
    float _2225 = fma(_2086, -0.5, _2221);
    float _2227 = -_2209;
    float _2229 = _2227 + 1.0;
    float _2231 = _2223 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2233 = _2068;
    float _2235 = _2201;
    float _2237 = _2086;
    float _2239 = _2084;
    if (!_2167)
    {
        _2233 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2241 = _2233;
    float _2243 = _2229 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_101.x = _2189;
    out.m_101.y = _2225;
    out.m_101.z = _2213;
    out.m_101.w = _2068;
    float _2245 = _2241;
    float _2247 = _2241;
    if (!_2167)
    {
        _2235 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2249 = _2235;
    float _2251 = _2249;
    float _2253 = _2249;
    if (!_2167)
    {
        _2237 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2255 = _2237;
    float _2257 = _2255;
    float _2259 = _2255;
    if (!_2167)
    {
        _2239 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2261 = _2239;
    float _2263 = _1798 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2265 = -_2102;
    float _2267 = _2265 + 1.0;
    float _2269 = _2267 * _2231;
    float _2271 = precise::clamp(_2269, 0.0, 1.0);
    float _2273 = -_2271;
    float _2275 = fma(_2273, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2277 = _2275 * _2187;
    float _2279 = _2243 * _2130;
    float _2281 = -_2243;
    float _2283 = _2281 + 1.0;
    float _2285 = _2141 * _2279;
    float _2287 = _2151 * _2279;
    float _2289 = _2141 * _2283;
    float _2291 = fma(_2147, _2285, _2135);
    float _2293 = fma(_2149, _2285, _2137);
    float _2295 = _2277 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2297 = fma(_2141, _2287, _2139);
    float _2299 = _2135;
    float _2301 = _2277;
    float _2303 = _2261;
    float _2305 = _2261;
    if (!_2167)
    {
        _2299 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2307 = _2299;
    float _2309 = _2307;
    float _2311 = _2307;
    if (!_2167)
    {
        _2301 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2313 = _2301;
    out.m_103.x = _2295;
    out.m_105.x = _2291;
    out.m_105.y = _2293;
    out.m_105.z = _2297;
    out.m_105.w = _2289;
    bool _2315 = !_2167;
    float _2317 = _2313;
    float _2319 = _2313;
    if (!_2315)
    {
        bool _2321 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2323 = isnan(_1820);
        bool _2325 = _2321 || _2323;
        bool _2327 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2329 = _2325 || _2327;
        if (!_2329)
        {
            float _2331 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2333 = _1820 + _2331;
            float _2335 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2337 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2335;
            float _2339 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2341 = _2339 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2343 = 1.0 / _2337;
            float _2345 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2347 = _2345 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2349 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2351 = _2349 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2353 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2355 = _2353 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2357 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2359 = _2357 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2361 = _2333 * _2343;
            float _2363 = precise::clamp(_2361, 0.0, 1.0);
            float _2365 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2367 = _2365 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2369 = fma(_2363, _2341, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2371 = fma(_2363, _2367, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2373 = fma(_2363, _2347, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2375 = fma(_2363, _2351, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2377 = fma(_2363, _2355, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2379 = fma(_2363, _2359, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2247 = _2373;
            _2305 = _2377;
            _2311 = _2369;
            _2259 = _2375;
            _2253 = _2371;
            _2319 = _2379;
            _2381 = true;
        }
        else
        {
            bool _2383 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2385 = isnan(_1820);
            bool _2387 = _2383 || _2385;
            bool _2389 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2391 = _2387 || _2389;
            if (!_2391)
            {
                _2309 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2393 = _2309;
            _2311 = _2393;
            if (!_2391)
            {
                _2245 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2395 = _2245;
            _2247 = _2395;
            if (!_2391)
            {
                _2251 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2397 = _2251;
            _2253 = _2397;
            if (!_2391)
            {
                _2257 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2399 = _2257;
            _2259 = _2399;
            if (!_2391)
            {
                _2303 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2401 = _2303;
            _2305 = _2401;
            if (!_2391)
            {
                _2317 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2403 = _2317;
            bool _2405 = !_2391;
            _2319 = _2403;
            if (!_2405)
            {
                bool _2407 = _1820 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2409 = isnan(_1820);
                bool _2411 = _2407 || _2409;
                bool _2413 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2415 = _2411 || _2413;
                if (!_2415)
                {
                    float _2417 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2419 = _1820 + _2417;
                    float _2421 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2423 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2421;
                    float _2425 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2427 = _2425 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2429 = 1.0 / _2423;
                    float _2431 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2433 = _2431 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2435 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2437 = _2435 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2439 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2441 = _2439 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2443 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2445 = _2443 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2447 = _2419 * _2429;
                    float _2449 = precise::clamp(_2447, 0.0, 1.0);
                    float _2451 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2453 = _2451 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2455 = fma(_2449, _2427, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2457 = fma(_2449, _2453, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2459 = fma(_2449, _2433, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2461 = fma(_2449, _2437, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2463 = fma(_2449, _2441, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2465 = fma(_2449, _2445, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2247 = _2459;
                    _2305 = _2463;
                    _2311 = _2455;
                    _2259 = _2461;
                    _2253 = _2457;
                    _2319 = _2465;
                    _2381 = true;
                }
                else
                {
                    _2247 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2305 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2311 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2259 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2253 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2319 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2381 = false;
    float _2467 = _2247;
    float _2469 = _2305;
    float _2471 = _2311;
    float _2473 = _2259;
    float _2475 = _2253;
    float _2477 = _2319;
    float _2479 = fma(_1474, -0.5, 0.5);
    float _2481 = precise::clamp(_2479, 0.0, 1.0);
    float _2483 = -_2467;
    float _2485 = _2483 + _2469;
    float _2487 = _2263 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2489 = -_2471;
    float _2491 = _2489 + _2473;
    out.m_107.x = 0.0;
    float _2493 = fma(_2481, _2485, _2467);
    float _2495 = fma(_2481, _2491, _2471);
    out.m_51.x = _2487;
    float _2497 = -_2475;
    float _2499 = _2497 + _2477;
    float _2501 = _2493 * 0.586610972881317138671875;
    bool _2503 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2505 = fma(_2481, _2499, _2475);
    float _2507 = fma(_2495, 0.298911988735198974609375, _2501);
    bool _2509 = _1798 > 0.0;
    bool _2511 = isnan(_1798);
    bool _2513 = _2509 || _2511;
    bool _2515 = isnan(0.0);
    bool _2517 = _2513 || _2515;
    float _2519 = fma(_2505, 0.114477999508380889892578125, _2507);
    float _2521 = -_2519;
    float _2523 = _2495 + _2521;
    float _2525 = -_2519;
    float _2527 = _2493 + _2525;
    float _2529 = -_2519;
    float _2531 = _2505 + _2529;
    float _2533 = fma(_2523, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    float _2535 = fma(_2527, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    float _2537 = fma(_2531, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2519);
    bool _2539 = !_2503;
    if (!_2539)
    {
        float _2541 = -_1744;
        float _2543 = _2541 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2545 = -_1746;
        float _2547 = _2545 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2549 = -_1748;
        float _2551 = _2549 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2553 = _2543 * _2543;
        float _2555 = fma(_2547, _2547, _2553);
        float _2557 = fma(_2551, _2551, _2555);
        float _2559 = sqrt(_2557);
        float _2561 = rsqrt(_2557);
        float _2563 = -_2559;
        float _2565 = _2563 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2567 = _2565 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2569 = precise::clamp(_2567, 0.0, 1.0);
        float _2571 = _2547 * _2561;
        float _2573 = _2543 * _2561;
        float _2575 = abs(_2569);
        float _2577 = log2(_2575);
        float _2579 = _2551 * _2561;
        float _2581 = _2571 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2583 = _1474 * _2573;
        float _2585 = -_2573;
        float _2587 = -_2581;
        float _2589 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2587);
        float _2591 = fma(_1472, _2571, _2583);
        float _2593 = -_2579;
        float _2595 = fma(_2593, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2589);
        float _2597 = fma(_1476, _2579, _2591);
        float _2599 = precise::clamp(_2597, 0.0, 1.0);
        float _2601 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2603 = _2595 + _2601;
        float _2605 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2607 = _2603 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2609 = precise::clamp(_2607, 0.0, 1.0);
        float _2611 = exp2(_2605);
        float _2613 = _2611 * _2609;
        float _2615 = _2599 * _2613;
        float _2617 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2619 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2621 = _2615 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_107.x = _2617;
        out.m_107.y = _2619;
        out.m_107.z = _2621;
    }
    out.m_85.x = _2533;
    out.m_85.y = _2535;
    out.m_85.z = _2537;
    if (_2517)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2623 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2623;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_107.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_107.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_107.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_107.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_103.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_103.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_103.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_103.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_105.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_105.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_105.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_105.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_101.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_101.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_101.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_101.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

