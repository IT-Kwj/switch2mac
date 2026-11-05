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
    float4 m_89 [[user(locn3)]];
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
    float4 m_91 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_67 [[attribute(2)]];
    float4 m_63 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_79 [[attribute(7)]];
    float4 m_77 [[attribute(8)]];
    float4 m_55 [[attribute(9)]];
    float4 m_57 [[attribute(10)]];
    float4 m_81 [[attribute(11)]];
    float4 m_61 [[attribute(12)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4690 = false;
    bool _3997 = false;
    bool _536 = false;
    bool _418 = false;
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
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_134);
        out.gl_Position.z = _4922;
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
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_118);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    int _168 = 0;
    if (_162)
    {
        float _170 = _166 * 5.0;
        _168 = as_type<int>(_170);
    }
    int _172 = _168;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4992 = as_type<float>(_172);
        out.gl_Position.z = _4992;
    }
    if (_162)
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
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _236;
    float _248 = 1.0 / _240;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = _262 * _266;
    float _270 = _212 * _246;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    bool _280 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _282 = isnan(_204);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_262;
    float _294 = _292 + 1.0;
    float _296 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_278, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _304 = _232 * _248;
    bool _306 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_204);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = fma(_302, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _328 = fma(_320, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = -_316;
    float _332 = _330 + 1.0;
    float _334 = _316 * _294;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _340 = fma(_324, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = _290 * _332;
    float _344 = -_290;
    float _346 = _344 + 1.0;
    float _348 = fma(_338, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = _296 * _342;
    float _352 = _298 * _342;
    float _354 = _328 * _342;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _362;
    float _366 = fma(_340, _334, _356);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _372;
    float _376 = fma(_364, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_348, _334, _358);
    float _380 = fma(_370, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _382 = fma(_374, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_326, _334, _360);
    float _386 = fma(_376, _268, _366);
    float _388 = fma(_380, _268, _378);
    float _390 = fma(_382, _268, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_55.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _150 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_57.x;
    float _430 = in.m_57.y;
    float _432 = in.m_57.z;
    bool _434 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_426);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_426);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _426 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _464 * _476;
    float _486 = fma(_484, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _478;
    float _490 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _508 = _396 * _432;
    float _510 = _394 * _430;
    float _512 = _392 * _428;
    out.m_59.x = _500;
    out.m_59.y = _502;
    out.m_59.z = _504;
    out.m_59.w = _506;
    bool _514 = !_474;
    float _516 = _430;
    float _534;
    if (!_514)
    {
        float _518 = in.m_55.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_118);
        float _540 = 1.0 / _538;
        float _542 = _150 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _548 = int(_546);
    float _550 = in.m_55.y;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _558 = _556 != 0;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _562 = int(_560);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _566 = _564 != 0;
    float _568 = float(_548);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _572 = int(_570);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _576 = float(_562);
    float _578 = 1.0 / _568;
    float _580 = in.m_55.x;
    float _582 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _584 = int(_582);
    float _586 = float(_572);
    float _588 = 1.0 / _576;
    float _590 = _578 * _150;
    float _592 = in.m_55.z;
    float _594 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _596 = int(_594);
    float _598 = float(uint(_584));
    float _600 = _586;
    float _602 = _588;
    bool _604 = _554;
    if (_554)
    {
        _516 = _580;
    }
    float _606 = _516;
    float _608 = 1.0 / _586;
    float _610 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _612 = int(_610);
    float _614 = float(uint(_596));
    float _616 = _606;
    float _618 = _608;
    if (_554)
    {
        _600 = 1.0;
    }
    float _620 = _600;
    float _622 = _620;
    if (!_554)
    {
        _622 = 1.2345600128173828125;
    }
    float _624 = _622;
    if (!_554)
    {
        _616 = _592;
    }
    float _626 = _616;
    float _628 = 1.0 / _598;
    int _630 = ~_596;
    int _632 = _630 + 1;
    bool _634 = _592 > 0.5;
    float _636 = trunc(_590);
    int _638 = int(_636);
    float _640 = _588 * _150;
    if (_554)
    {
        _602 = 1.0;
    }
    float _642 = _602;
    float _644 = _642;
    if (!_554)
    {
        _644 = 7.345489978790283203125;
    }
    float _646 = _644;
    float _648 = float(uint(_612));
    float _650 = 1.0 / _614;
    float _652 = _646 * _580;
    int _654 = as_type<int>(_628) + (-2);
    int _656 = ~_612;
    int _658 = _656 + 1;
    int _660 = ~_612;
    int _662 = _660 + 1;
    float _664 = float(uint(_638));
    float _666 = _608 * _150;
    float _668 = _664;
    int _670 = as_type<int>(_652);
    float _672 = as_type<float>(_654);
    if (_554)
    {
        _618 = _580;
    }
    float _674 = _618;
    float _676 = trunc(_640);
    int _678 = int(_676);
    float _680 = _674;
    if (!_554)
    {
        _680 = _550;
    }
    float _682 = _680;
    float _684 = as_type<float>(_654) * _664;
    if (_554)
    {
        _668 = 1.0;
    }
    float _686 = _668;
    float _688 = _686;
    if (!_554)
    {
        _688 = 5.839270114898681640625;
    }
    float _690 = _688;
    float _692 = _682 * _624;
    int _694 = as_type<int>(_650) + (-2);
    float _696 = 1.0 / _648;
    float _698 = in.m_61.x;
    float _700 = _626 * _690;
    int _702 = ~_584;
    int _704 = _702 + 1;
    float _706 = _698;
    int _708 = _704;
    if (_558)
    {
        bool _710 = _580 > 0.5;
        _604 = _710;
    }
    bool _712 = _604;
    int _714 = ~_612;
    int _716 = _714 + 1;
    float _718 = trunc(_684);
    float _720 = precise::max(_718, 0.0);
    uint _723 = uint(_720);
    float _725 = in.m_55.w;
    float _727 = float(uint(_678));
    float _729 = trunc(_666);
    int _731 = int(_729);
    float _733 = as_type<float>(_694) * _727;
    int _735 = as_type<int>(_696) + (-2);
    int _737 = _704 * int(_723);
    int _739 = _737 + _638;
    float _741 = trunc(_733);
    float _743 = precise::max(_741, 0.0);
    uint _745 = uint(_743);
    float _747 = float(uint(_739));
    float _749 = float(uint(_731));
    float _751 = floor(_652);
    bool _753 = _725 > 0.5;
    float _755 = as_type<float>(_654) * _747;
    float _757 = _725;
    float _759 = as_type<float>(_739);
    float _761 = as_type<float>(_735);
    if (!_558)
    {
        _757 = _698;
    }
    float _763 = _757;
    float _765 = as_type<float>(_735) * _749;
    float _767 = _763;
    if (!_558)
    {
        _759 = _763;
    }
    float _769 = _759;
    float _771 = trunc(_755);
    float _773 = precise::max(_771, 0.0);
    uint _775 = uint(_773);
    float _777 = _769;
    if (_558)
    {
        _767 = _698;
    }
    float _779 = _767;
    if (!_566)
    {
        _706 = _779;
    }
    float _781 = _706;
    float _783 = _781;
    if (_558)
    {
        float _785 = -_779;
        float _787 = _785 + 1.0;
        _708 = as_type<int>(_787);
    }
    int _789 = _708;
    float _791 = floor(_692);
    float _793 = -_751;
    float _795 = _652 + _793;
    if (_566)
    {
        float _797 = -_779;
        float _799 = _797 + 1.0;
        _670 = as_type<int>(_799);
    }
    int _801 = _670;
    if (_558)
    {
        float _803 = _712 ? as_type<float>(_789) : _779;
        _777 = _803;
    }
    float _805 = _777;
    int _807 = _632 * int(_745);
    int _809 = _807 + _678;
    float _811 = float(_118);
    if (_566)
    {
        float _813 = _634 ? as_type<float>(_801) : _779;
        _783 = _813;
    }
    float _815 = _783;
    float _817 = trunc(_765);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    float _823 = float(uint(_809));
    int _825 = int(_723) + int(_775);
    float _827 = float(_638);
    float _829 = as_type<float>(_694) * _823;
    float _831 = float(_584);
    float _833 = floor(_700);
    float _835 = -_791;
    float _837 = _692 + _835;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _841 = _839 != 0;
    bool _843 = _827 >= _831;
    bool _845 = isnan(_827);
    bool _847 = _843 || _845;
    bool _849 = isnan(_831);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _795 * _831;
    float _857 = _831 * _150;
    int _859 = _658 * int(_821);
    int _861 = _859 + _731;
    float _863 = trunc(_829);
    float _865 = precise::max(_863, 0.0);
    uint _867 = uint(_865);
    float _869 = float(uint(_861));
    float _871 = float(_596);
    float _873 = -_833;
    float _875 = _700 + _873;
    int _877 = ~_584;
    int _879 = _877 + 1;
    float _881 = as_type<float>(_735) * _869;
    float _883 = 1.0 / _811;
    float _885 = _871 * _837;
    float _887 = float(_612);
    float _889 = float(_678);
    int _891 = _879 * _825;
    int _893 = _891 + _638;
    float _895 = trunc(_881);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = float(_731);
    bool _903 = !_841;
    int _905 = _903 ? 0 : 1;
    bool _907 = uint(_893) >= uint(_584);
    bool _909 = _901 >= _887;
    bool _911 = isnan(_901);
    bool _913 = _909 || _911;
    bool _915 = isnan(_887);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = trunc(_855);
    int _923 = int(_921);
    int _925 = int(_745) + int(_867);
    float _927 = _883 * _150;
    int _929 = ~_596;
    int _931 = _929 + 1;
    float _933 = _857 * _883;
    int _935 = abs(_905);
    float _937 = _871 * _927;
    float _939 = trunc(_853);
    int _941 = int(_939);
    bool _943 = !_907;
    int _945 = _943 ? 0 : (-1);
    int _947 = _931 * _925;
    int _949 = _947 + _678;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _961 = _959 != 0;
    int _963 = ~_825;
    int _965 = _963 + _945;
    int _967 = _965 + 1;
    bool _969 = uint(_949) >= uint(_596);
    int _971 = _923 * _935;
    int _973 = _971 + _638;
    int _975 = int(_821) + int(_899);
    float _977 = in.m_61.y;
    int _979 = ~_612;
    int _981 = _979 + 1;
    int _983 = _584 * _967;
    int _985 = _983 + _638;
    bool _987 = !_969;
    int _989 = _987 ? 0 : (-1);
    float _991 = trunc(_933);
    int _993 = int(_991);
    bool _995 = _584 == 0;
    int _997 = _981 * _975;
    int _999 = _997 + _731;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1003 = _1001 != 0;
    bool _1005 = _889 >= _871;
    bool _1007 = isnan(_889);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(_871);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _887 * _927;
    float _1019 = _887 * _875;
    int _1021 = ~_941;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = trunc(_885);
    int _1029 = int(_1027);
    bool _1031 = !_995;
    int _1033 = _1031 ? _985 : (-1);
    bool _1035 = !_1003;
    int _1037 = _1035 ? 0 : 1;
    bool _1039 = uint(_999) >= uint(_612);
    bool _1041 = !_957;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = trunc(_919);
    int _1047 = int(_1045);
    int _1049 = ~_925;
    int _1051 = _1049 + _989;
    int _1053 = _1051 + 1;
    int _1055 = _1033 * _1025;
    int _1057 = abs(_1037);
    bool _1059 = !_1039;
    int _1061 = _1059 ? 0 : (-1);
    int _1063 = _584 + (-1);
    int _1065 = _1029 * _1057;
    int _1067 = _1065 + _678;
    int _1069 = abs(_1043);
    float _1071 = trunc(_1019);
    int _1073 = int(_1071);
    int _1075 = ~_975;
    int _1077 = _1075 + _1061;
    int _1079 = _1077 + 1;
    int _1081 = _941 * _1063;
    int _1083 = _1081 + _1055;
    bool _1085 = !_953;
    int _1087 = _1085 ? 0 : 1;
    int _1089 = _596 * _1053;
    int _1091 = _1089 + _678;
    int _1093 = _612 * _1079;
    int _1095 = _1093 + _731;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1099 = _1097 != 0;
    int _1101 = abs(_1087);
    int _1103 = _1083 * _1069;
    float _1105 = -_977;
    float _1107 = _1105 + 1.0;
    bool _1109 = !_1099;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1115 = _1113 != 0;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1119 = _1117 != 0;
    int _1121 = _993 * _1101;
    int _1123 = _1121 + _1103;
    int _1125 = _753 ? as_type<int>(_1107) : as_type<int>(_977);
    float _1127 = trunc(_1015);
    int _1129 = int(_1127);
    bool _1131 = !_961;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1137 = _1135 != 0;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1141 = _1139 != 0;
    bool _1143 = !_1119;
    int _1145 = _1143 ? 0 : 1;
    bool _1147 = _550 > 0.5;
    bool _1149 = !_1137;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1155 = _1153 != 0;
    int _1157 = abs(_1133);
    bool _1159 = !_1155;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = abs(_1111);
    int _1165 = _973 * _1157;
    int _1167 = _1165 + _1123;
    bool _1169 = !_1115;
    int _1171 = _1169 ? 0 : 1;
    int _1173 = abs(_1161);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1177 = _1175 != 0;
    int _1179 = _1147 ? as_type<int>(_1107) : as_type<int>(_977);
    int _1181 = _1073 * _1173;
    int _1183 = _1181 + _731;
    float _1185 = _1177 ? as_type<float>(_1179) : _977;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1189 = _1187 != 0;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1193 = _1191 != 0;
    int _1195 = _923 * _1163;
    int _1197 = _1195 + _1167;
    bool _1199 = _612 == 0;
    float _1201 = trunc(_937);
    int _1203 = int(_1201);
    bool _1205 = _596 == 0;
    int _1207 = ~_1047;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    bool _1213 = !_1199;
    int _1215 = _1213 ? _1095 : (-1);
    float _1217 = float(uint(_1197));
    int _1219 = ~_1129;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    int _1225 = _1211 * _1215;
    bool _1227 = !_1205;
    int _1229 = _1227 ? _1091 : (-1);
    float _1231 = as_type<float>(_654) * _1217;
    bool _1233 = !_1193;
    int _1235 = _1233 ? 0 : 1;
    int _1237 = abs(_1145);
    int _1239 = _1223 * _1229;
    int _1241 = _596 + (-1);
    float _1243 = trunc(_1231);
    float _1245 = precise::max(_1243, 0.0);
    uint _1247 = uint(_1245);
    int _1249 = abs(_1171);
    int _1251 = abs(_1235);
    int _1253 = _1129 * _1241;
    int _1255 = _1253 + _1239;
    int _1257 = _612 + (-1);
    bool _1259 = !_1141;
    int _1261 = _1259 ? 0 : 1;
    int _1263 = _1255 * _1237;
    int _1265 = abs(_1151);
    int _1267 = _1047 * _1257;
    int _1269 = _1267 + _1225;
    int _1271 = ~_584;
    int _1273 = _1271 + 1;
    int _1275 = _1203 * _1249;
    int _1277 = _1275 + _1263;
    int _1279 = abs(_1261);
    float _1281 = trunc(_1017);
    int _1283 = int(_1281);
    int _1285 = _1067 * _1265;
    int _1287 = _1285 + _1277;
    int _1289 = _1273 * int(_1247);
    int _1291 = _1289 + _1197;
    bool _1293 = !_1189;
    int _1295 = _1293 ? 0 : 1;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1299 = _1297 != 0;
    int _1301 = _1029 * _1279;
    int _1303 = _1301 + _1287;
    float _1305 = float(uint(_1291));
    int _1307 = abs(_1295);
    bool _1309 = !_1299;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = as_type<float>(_654) * _1305;
    float _1315 = float(uint(_1303));
    float _1317 = trunc(_1313);
    float _1319 = precise::max(_1317, 0.0);
    uint _1321 = uint(_1319);
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1325 = _1323 != 0;
    int _1327 = abs(_1311);
    float _1329 = as_type<float>(_694) * _1315;
    int _1331 = _1269 * _1251;
    bool _1333 = !_1325;
    int _1335 = _1333 ? 0 : 1;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1339 = _1337 != 0;
    int _1341 = _1283 * _1307;
    int _1343 = _1341 + _1331;
    int _1345 = abs(_1335);
    float _1347 = trunc(_1329);
    float _1349 = precise::max(_1347, 0.0);
    uint _1351 = uint(_1349);
    float _1353 = float(uint(_973));
    int _1355 = _1183 * _1327;
    int _1357 = _1355 + _1343;
    float _1359 = _1339 ? as_type<float>(_1125) : _977;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1363 = _1361 != 0;
    float _1365 = as_type<float>(_654) * _1353;
    int _1367 = ~_584;
    int _1369 = _1367 + 1;
    int _1371 = _1073 * _1345;
    int _1373 = _1371 + _1357;
    int _1375 = int(_1247) + int(_1321);
    int _1377 = ~_596;
    int _1379 = _1377 + 1;
    float _1381 = trunc(_1365);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    bool _1387 = _592 > 0.5;
    int _1389 = _1369 * _1375;
    int _1391 = _1389 + _1197;
    float _1393 = float(uint(_1373));
    int _1395 = ~_584;
    int _1397 = _1395 + 1;
    float _1399 = _977;
    int _1401 = _1197;
    if (_1363)
    {
        float _1403 = _1387 ? _1107 : _977;
        _1399 = _1403;
    }
    float _1405 = _1399;
    int _1407 = _1379 * int(_1351);
    int _1409 = _1407 + _1303;
    bool _1411 = uint(_1391) >= uint(_584);
    float _1413 = as_type<float>(_735) * _1393;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1417 = _1415 != 0;
    float _1419 = float(uint(_1409));
    float _1421 = trunc(_1413);
    float _1423 = precise::max(_1421, 0.0);
    uint _1425 = uint(_1423);
    bool _1427 = !_1411;
    int _1429 = _1427 ? 0 : (-1);
    int _1431 = _1397 * int(_1385);
    int _1433 = _1431 + _973;
    bool _1435 = _584 == 0;
    float _1437 = as_type<float>(_694) * _1419;
    int _1439 = ~_1375;
    int _1441 = _1439 + _1429;
    int _1443 = _1441 + 1;
    float _1445 = in.m_63.x;
    float _1447 = in.m_63.y;
    float _1449 = in.m_63.z;
    float _1451 = float(uint(_1433));
    int _1453 = ~_612;
    int _1455 = _1453 + 1;
    float _1457 = trunc(_1437);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    int _1463 = _584 * _1443;
    int _1465 = _1463 + _1197;
    float _1467 = _1449;
    if (_1417)
    {
        float _1469 = -_779;
        float _1471 = _1469 + 1.0;
        _1401 = as_type<int>(_1471);
    }
    int _1473 = _1401;
    float _1475 = as_type<float>(_654) * _1451;
    if (!_1417)
    {
        _672 = _779;
    }
    float _1477 = _672;
    bool _1479 = !_1435;
    int _1481 = _1479 ? _1465 : (-1);
    float _1483 = _1477;
    if (_1417)
    {
        float _1485 = _1147 ? as_type<float>(_1473) : _779;
        _1483 = _1485;
    }
    float _1487 = _1483;
    int _1489 = _1455 * int(_1425);
    int _1491 = _1489 + _1373;
    int _1493 = _1481 & 3;
    bool _1495 = _1493 != 0;
    float _1497 = trunc(_1475);
    float _1499 = precise::max(_1497, 0.0);
    uint _1501 = uint(_1499);
    int _1503 = _1481 & 3;
    bool _1505 = _1503 != 0;
    bool _1507 = uint(_1493) > 1u;
    int _1509 = int(_1351) + int(_1461);
    float _1511 = float(uint(_1491));
    int _1513 = ~_596;
    int _1515 = _1513 + 1;
    int _1517 = _1505 ? 0 : 1;
    float _1519 = as_type<float>(_735) * _1511;
    bool _1521 = uint(_1493) >= 2u;
    int _1523 = _1515 * _1509;
    int _1525 = _1523 + _1303;
    int _1527 = ~_1517;
    int _1529 = _1527 + 1;
    int _1531 = _1529 + 1;
    float _1533 = trunc(_1519);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    int _1539 = _1531;
    if (!_1507)
    {
        int _1541 = ~_1517;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    bool _1547 = uint(_1525) >= uint(_596);
    int _1549 = int(_1385) + int(_1501);
    bool _1551 = !_1547;
    int _1553 = _1551 ? 0 : (-1);
    int _1555 = ~_584;
    int _1557 = _1555 + 1;
    int _1559 = _1521 ? 0 : 1;
    bool _1561 = _1493 != 3;
    int _1563 = _1557 * _1549;
    int _1565 = _1563 + _973;
    int _1567 = ~_1509;
    int _1569 = _1567 + _1553;
    int _1571 = _1569 + 1;
    int _1573 = ~_1559;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    bool _1579 = uint(_1565) >= uint(_584);
    int _1581 = _596 * _1571;
    int _1583 = _1581 + _1303;
    int _1585 = int(_1425) + int(_1537);
    float _1587 = in.m_65.x;
    float _1589 = in.m_65.y;
    float _1591 = in.m_65.z;
    bool _1593 = !_1579;
    int _1595 = _1593 ? 0 : (-1);
    bool _1597 = !_1205;
    int _1599 = _1597 ? _1583 : (-1);
    float _1601 = in.m_67.x;
    float _1603 = in.m_67.y;
    float _1605 = in.m_67.z;
    int _1607 = _1577;
    if (_1561)
    {
        int _1609 = ~_1559;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    int _1615 = _662 * _1585;
    int _1617 = _1615 + _1373;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1621 = _1619 != 0;
    float _1623 = in.m_48.x;
    float _1625 = in.m_48.y;
    float _1627 = in.m_48.z;
    int _1629 = _1599 & 3;
    bool _1631 = _1629 != 0;
    bool _1633 = !_1621;
    int _1635 = _1633 ? 0 : 1;
    int _1637 = _1631 ? 0 : 1;
    bool _1639 = uint(_1629) >= 2u;
    bool _1641 = _1629 != 3;
    int _1643 = _1639 ? 0 : 1;
    bool _1645 = uint(_1629) > 1u;
    float _1647 = float(uint(_1067));
    int _1649 = ~_1643;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = ~_1637;
    int _1657 = _1655 + 1;
    int _1659 = _1657 + 1;
    float _1661 = as_type<float>(_694) * _1647;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1665 = _1663 != 0;
    int _1667 = _1653;
    int _1669 = _1659;
    if (_1641)
    {
        int _1671 = ~_1643;
        int _1673 = _1671 + 1;
        _1667 = _1673;
    }
    int _1675 = _1667;
    float _1677 = trunc(_1661);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    bool _1683 = uint(_1617) >= uint(_612);
    float _1685 = _1625 * _1589;
    if (!_1645)
    {
        int _1687 = ~_1637;
        int _1689 = _1687 + 1;
        _1669 = _1689;
    }
    int _1691 = _1669;
    bool _1693 = !_1683;
    int _1695 = _1693 ? 0 : (-1);
    float _1697 = fma(_1623, _1587, _1685);
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1701 = _1699 != 0;
    float _1703 = fma(_1627, _1591, _1697);
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1707 = _1705 != 0;
    float _1709 = _1625 * _1603;
    float _1711 = _1625 * _1447;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1717 = ~_596;
    int _1719 = _1717 + 1;
    float _1721 = fma(_1623, _1601, _1709);
    float _1723 = fma(_1623, _1445, _1711);
    float _1725 = 1.0 / _1715;
    int _1727 = _1719 * int(_1681);
    int _1729 = _1727 + _1067;
    float _1731 = float(uint(_1183));
    float _1733 = _550 * 2.0;
    int _1735 = ~_1585;
    int _1737 = _1735 + _1695;
    int _1739 = _1737 + 1;
    float _1741 = _1703 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1743 = float(uint(_1729));
    float _1745 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1747;
    int _1751 = ~_612;
    int _1753 = _1751 + 1;
    int _1755 = _612 * _1739;
    int _1757 = _1755 + _1373;
    float _1759 = as_type<float>(_694) * _1743;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_1665)
    {
        _1761 = 0;
    }
    int _1763 = _1761;
    float _1765 = _1749 * _1725;
    float _1767 = as_type<float>(_735) * _1731;
    float _1769 = trunc(_1759);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    int _1775 = _1763;
    if (!_1665)
    {
        _1775 = 1;
    }
    int _1777 = _1775;
    float _1779 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1781 = !_1701;
    int _1783 = _1781 ? 0 : 1;
    bool _1785 = !_1199;
    int _1787 = _1785 ? _1757 : (-1);
    float _1789 = -_1779;
    float _1791 = fma(_1745, 2.0, _1789);
    float _1793 = trunc(_1767);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    bool _1799 = _1777 != 1;
    float _1801 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1803 = _1777;
    if (_1665)
    {
        _1803 = 0;
    }
    int _1805 = _1803;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1809 = _1805;
    if (!_1665)
    {
        _1809 = 2;
    }
    int _1811 = _1809;
    int _1813 = _1787 & 3;
    bool _1815 = _1813 != 0;
    float _1817 = fma(_1801, -2.0, _1807);
    int _1819 = int(_1681) + int(_1773);
    float _1821 = _580 * 2.0;
    int _1823 = _1815 ? 0 : 1;
    bool _1825 = uint(_1813) >= 2u;
    bool _1827 = !_1707;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1753 * int(_1797);
    int _1833 = _1831 + _1183;
    bool _1835 = _1813 != 3;
    float _1837 = floor(_1821);
    int _1839 = _1825 ? 0 : 1;
    float _1841 = float(uint(_1833));
    bool _1843 = uint(_1813) > 1u;
    int _1845 = ~_596;
    int _1847 = _1845 + 1;
    float _1849 = as_type<float>(_735) * _1841;
    float _1851 = floor(_1733);
    int _1853 = ~_1839;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    int _1859 = _1847 * _1819;
    int _1861 = _1859 + _1067;
    int _1863 = _1857;
    float _1865 = as_type<float>(_1861);
    if (_1835)
    {
        int _1867 = ~_1839;
        int _1869 = _1867 + 1;
        _1863 = _1869;
    }
    int _1871 = _1863;
    int _1873 = ~_1823;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    float _1879 = trunc(_1849);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    bool _1885 = uint(_1861) >= uint(_596);
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1889 = _544 + _1887;
    int _1891 = _1877;
    if (!_1843)
    {
        int _1893 = ~_1823;
        int _1895 = _1893 + 1;
        _1891 = _1895;
    }
    int _1897 = _1891;
    bool _1899 = _1837 > 0.0;
    float _1901 = fma(_1765, _1889, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1903 = _1837;
    if (!_1799)
    {
        _1865 = _550;
    }
    float _1905 = _1865;
    bool _1907 = !_1885;
    int _1909 = _1907 ? 0 : (-1);
    bool _1911 = _1837 >= 0.0;
    bool _1913 = isnan(_1837);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(0.0);
    bool _1919 = _1915 || _1917;
    float _1921 = 0.0;
    float _1923 = _1905;
    if (!_1799)
    {
        _1921 = _1905;
    }
    float _1925 = _1921;
    float _1927 = _1925;
    if (!_1799)
    {
        _761 = _592;
    }
    float _1929 = _761;
    int _1931 = int(_1797) + int(_1883);
    float _1933 = _592 * 2.0;
    float _1935 = _1929;
    if (!_1799)
    {
        _1903 = _592;
    }
    float _1937 = _1903;
    bool _1939 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1941 = isnan(_544);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    int _1951 = _716 * _1931;
    int _1953 = _1951 + _1183;
    float _1955 = _1937;
    if (_1799)
    {
        _1927 = _580;
    }
    float _1957 = _1927;
    float _1959 = floor(_1933);
    if (_1799)
    {
        _1923 = _580;
    }
    float _1961 = _1923;
    float _1963 = -_1949;
    float _1965 = _1963 + 1.0;
    if (_1799)
    {
        _1935 = _550;
    }
    float _1967 = _1935;
    if (_1799)
    {
        _1955 = _550;
    }
    float _1969 = _1955;
    bool _1971 = _1851 > 0.0;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1975 = _1919 ? 0 : 1;
    bool _1977 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1979 = isnan(_544);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    int _1989 = ~_1549;
    int _1991 = _1989 + _1595;
    int _1993 = _1991 + 1;
    bool _1995 = _1851 >= 0.0;
    bool _1997 = isnan(_1851);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(0.0);
    bool _2003 = _1999 || _2001;
    float _2005 = _1987 * _1965;
    int _2007 = ~_1975;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    int _2013 = _584 * _1993;
    int _2015 = _2013 + _973;
    int _2017 = _2011;
    if (!_1899)
    {
        int _2019 = ~_1975;
        int _2021 = _2019 + 1;
        _2017 = _2021;
    }
    int _2023 = _2017;
    float _2025 = fma(_1627, _1605, _1721);
    bool _2027 = uint(_1953) >= uint(_612);
    float _2029 = _1901 * _2005;
    int _2031 = _2003 ? 0 : 1;
    float _2033 = -_1987;
    float _2035 = _2033 + 1.0;
    bool _2037 = !_2027;
    int _2039 = _2037 ? 0 : (-1);
    int _2041 = ~_2031;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    bool _2047 = !_1435;
    int _2049 = _2047 ? _2015 : (-1);
    float _2051 = fma(_1627, _1449, _1723);
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2055 = _2053 != 0;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2063 = _2061 != 0;
    float _2065 = fma(_2035, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2029);
    int _2067 = _2045;
    if (!_1971)
    {
        int _2069 = ~_2031;
        int _2071 = _2069 + 1;
        _2067 = _2071;
    }
    int _2073 = _2067;
    float _2075 = _550 + _592;
    bool _2077 = _1959 >= 0.0;
    bool _2079 = isnan(_1959);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2065);
    bool _2089 = !_2055;
    int _2091 = _2089 ? 0 : 1;
    float _2093 = _2075 + (-1.0);
    int _2095 = _2085 ? 0 : 1;
    float _2097 = _2087 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2099 = _1811 != 2;
    float _2101 = _2051 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2103 = _1959 > 0.0;
    float _2105 = _580 + _550;
    float _2107 = _2105 + (-1.0);
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2099)
    {
        _1467 = _580;
    }
    float _2115 = _1467;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2119 = _2115;
    if (!_2099)
    {
        _2119 = _592;
    }
    float _2121 = _2119;
    float _2123 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2125 = ~_2095;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _2129;
    if (!_2103)
    {
        int _2135 = ~_2095;
        int _2137 = _2135 + 1;
        _2133 = _2137;
    }
    int _2139 = _2133;
    float _2141 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2143 = _1481 >> 31;
    float _2145 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2147 = _1599 >> 31;
    float _2149 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2151 = -_2117;
    float _2153 = fma(_2141, 2.0, _2151);
    int _2155 = _2143 & 3;
    int _2157 = _2147 & 3;
    out.m_69.x = _2131;
    out.m_69.y = _2145;
    out.m_69.z = _2149;
    out.m_69.w = _2097;
    float _2159 = -_150;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2153);
    bool _2163 = !_1495;
    int _2165 = _2163 ? 0 : 1;
    int _2167 = _1599 + _2157;
    float _2169 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2171 = _1599 & 3;
    bool _2173 = _2171 != 0;
    int _2175 = _1787 >> 31;
    int _2177 = _2167 >> 2;
    bool _2179 = !_2173;
    int _2181 = _2179 ? 0 : 1;
    int _2183 = _1481 + _2155;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2187 = _1741 + _2185;
    int _2189 = _1787 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2195 = _2183 >> 2;
    int _2197 = _2175 & 3;
    float _2199 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2193);
    bool _2201 = !_2191;
    int _2203 = _2201 ? 0 : 1;
    float _2205 = _2025 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2207 = _2195 << 4;
    int _2209 = _2207 + 368;
    float _2211 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2199);
    bool _2213 = _1493 != 3;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2217 = _2205 + _2215;
    int _2219 = _1787 + _2197;
    uint _2221 = uint(int(uint(_2209) >> uint(2)));
    uint _2223 = uint(int(uint(int(_2221)) >> uint(2)));
    int _2225 = int(_2221) & 3;
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[int(_2223)][_2225];
    int _2229 = int(_2221) + 1;
    uint _2231 = uint(int(uint(_2229) >> uint(2)));
    int _2233 = _2229 & 3;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[int(_2231)][_2233];
    bool _2237 = !_2213;
    int _2239 = _2237 ? 0 : (-1);
    int _2241 = _2219 >> 2;
    bool _2243 = _1629 != 3;
    float _2245 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2247 = _2241 << 4;
    int _2249 = _2247 + 656;
    float _2251 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2245);
    bool _2253 = !_2243;
    int _2255 = _2253 ? 0 : (-1);
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2259 = _2177 << 4;
    int _2261 = _2259 + 512;
    uint _2263 = uint(int(uint(_2249) >> uint(2)));
    uint _2265 = uint(int(uint(int(_2263)) >> uint(2)));
    int _2267 = int(_2263) & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    int _2271 = int(_2263) + 1;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    int _2275 = _2271 & 3;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[int(_2273)][_2275];
    bool _2279 = _1813 != 3;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2283 = _2101 + _2281;
    int _2285 = abs(_2091);
    float _2287 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2257);
    float _2289 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2251);
    float _2291 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    uint _2293 = uint(int(uint(_2261) >> uint(2)));
    uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
    int _2297 = int(_2293) & 3;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[int(_2295)][_2297];
    int _2301 = int(_2293) + 1;
    uint _2303 = uint(int(uint(_2301) >> uint(2)));
    int _2305 = _2301 & 3;
    float _2307 = (*spvDescriptorSet0.vp_c9)._m0[int(_2303)][_2305];
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2311 = -_574;
    float _2313 = fma(_2291, 2.0, _2311);
    int _2315 = abs(_1545);
    float _2317 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2287);
    int _2319 = abs(_1897);
    float _2321 = fma(_1973, -2.0, _2309);
    int _2323 = _2209 + 8;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[int(_2335)][_2337];
    bool _2341 = !_2279;
    int _2343 = _2341 ? 0 : (-1);
    float _2345 = -_150;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2313);
    bool _2349 = _2289 >= 0.0;
    float _2351 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2321);
    int _2353 = ~_2315;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = ~_1819;
    int _2361 = _2359 + _1909;
    int _2363 = _2361 + 1;
    int _2365 = _2261 + 8;
    uint _2367 = uint(int(uint(_2365) >> uint(2)));
    uint _2369 = uint(int(uint(int(_2367)) >> uint(2)));
    int _2371 = int(_2367) & 3;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[int(_2369)][_2371];
    int _2375 = int(_2367) + 1;
    uint _2377 = uint(int(uint(_2375) >> uint(2)));
    int _2379 = _2375 & 3;
    float _2381 = (*spvDescriptorSet0.vp_c9)._m0[int(_2377)][_2379];
    float _2383 = float(_2139);
    float _2385 = float(_2285);
    int _2387 = _596 * _2363;
    int _2389 = _2387 + _1067;
    int _2391 = abs(_1691);
    float _2393 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2395 = int(_2393);
    int _2397 = abs(_2203);
    int _2399 = _2249 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    int _2417 = ~_2319;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    int _2423 = _2357 * as_type<int>(_2235);
    int _2425 = abs(_2165);
    float _2427 = _2385 * _2383;
    int _2429 = ~_1931;
    int _2431 = _2429 + _2039;
    int _2433 = _2431 + 1;
    float _2435 = _2187;
    if (_2349)
    {
        out.m_51.x = 0.0;
    }
    int _2437 = abs(_1613);
    int _2439 = ~_2425;
    int _2441 = _2439 + 1;
    int _2443 = _2441 + 1;
    int _2445 = _612 * _2433;
    int _2447 = _2445 + _1183;
    int _2449 = ~_2391;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    float _2455 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2457 = int(_2455);
    int _2459 = abs(_2181);
    int _2461 = _2443 * as_type<int>(_2227);
    int _2463 = _2461 + _2423;
    int _2465 = ~_2397;
    int _2467 = _2465 + 1;
    int _2469 = _2467 + 1;
    int _2471 = _2421 * as_type<int>(_2277);
    int _2473 = ~_2437;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = ~_2459;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    int _2485 = _2469 * as_type<int>(_2269);
    int _2487 = _2485 + _2471;
    int _2489 = abs(_1675);
    float _2491 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2493 = int(_2491);
    int _2495 = abs(_2255);
    int _2497 = _2453 * as_type<int>(_2307);
    int _2499 = ~_2489;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    int _2505 = abs(_1871);
    int _2507 = _2483 * as_type<int>(_2299);
    int _2509 = _2507 + _2497;
    int _2511 = ~_2495;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    float _2517 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2519 = log2(_2517);
    int _2521 = ~_2505;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    int _2527 = _2477 * as_type<int>(_2331);
    int _2529 = _2527 + _2463;
    int _2531 = abs(_2239);
    int _2533 = abs(_1635);
    int _2535 = ~_2531;
    int _2537 = _2535 + 1;
    int _2539 = _2537 + 1;
    float _2541 = float(uint(_2457));
    int _2543 = _2503 * as_type<int>(_2373);
    int _2545 = _2543 + _2509;
    int _2547 = abs(_1829);
    int _2549 = _2539 * as_type<int>(_2339);
    int _2551 = _2549 + _2529;
    int _2553 = abs(_2343);
    int _2555 = _2515 * as_type<int>(_2381);
    int _2557 = _2555 + _2545;
    int _2559 = abs(_1783);
    float _2561 = 1.0 / _2541;
    int _2563 = _2525 * as_type<int>(_2407);
    int _2565 = _2563 + _2487;
    float _2567 = float(uint(_2395));
    int _2569 = ~_2553;
    int _2571 = _2569 + 1;
    int _2573 = _2571 + 1;
    float _2575 = float(uint(_2493));
    float _2577 = 1.0 / _2567;
    int _2579 = ~_2559;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    int _2585 = _2573 * as_type<int>(_2415);
    int _2587 = _2585 + _2565;
    int _2589 = ~_2533;
    int _2591 = _2589 + 1;
    int _2593 = _2591 + 1;
    int _2595 = ~_2547;
    int _2597 = _2595 + 1;
    int _2599 = _2597 + 1;
    int _2601 = _2583 * _2557;
    bool _2603 = !_1205;
    int _2605 = _2603 ? _2389 : (-1);
    float _2607 = 1.0 / _2575;
    int _2609 = _2551 * _2593;
    bool _2611 = !_1199;
    int _2613 = _2611 ? _2447 : (-1);
    int _2615 = _2599 * _2587;
    int _2617 = as_type<int>(_2561) + (-2);
    int _2619 = _2049 * _2533;
    int _2621 = _2619 + _2609;
    float _2623 = _2519 * _150;
    int _2625 = _2605 * _2559;
    int _2627 = _2625 + _2601;
    int _2629 = as_type<int>(_2577) + (-2);
    int _2631 = _2613 * _2547;
    int _2633 = _2631 + _2615;
    bool _2635 = !_2059;
    int _2637 = _2635 ? 0 : 1;
    float _2639 = in.m_71.x;
    float _2641 = in.m_71.y;
    float _2643 = in.m_71.z;
    float _2645 = float(uint(_2621));
    float _2647 = float(uint(_2627));
    float _2649 = exp2(_2623);
    int _2651 = as_type<int>(_2607) + (-2);
    float _2653 = float(uint(_2633));
    float _2655 = as_type<float>(_2617) * _2647;
    int _2657 = abs(_2637);
    float _2659 = as_type<float>(_2629) * _2645;
    float _2661 = _2645;
    float _2663 = _2299;
    if (_2099)
    {
        _2661 = _550;
    }
    float _2665 = _2661;
    float _2667 = as_type<float>(_2651) * _2653;
    float _2669 = trunc(_2655);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = _2665;
    if (!_2099)
    {
        _2675 = _580;
    }
    float _2677 = _2675;
    float _2679 = float(_2023);
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2683 = float(_2657);
    float _2685 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2687 = as_type<int>(_2677);
    if (_2349)
    {
        _2663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2689 = _2663;
    float _2691 = trunc(_2667);
    float _2693 = precise::max(_2691, 0.0);
    uint _2695 = uint(_2693);
    int _2697 = abs(_2395);
    float _2699 = fma(_2685, -2.0, _2681);
    float _2701 = _2427 * (-2.0);
    if (_2349)
    {
        float _2703 = _2689 * 5.0;
        _2687 = as_type<int>(_2703);
    }
    int _2705 = _2687;
    int _2707 = abs(_2457);
    float _2709 = _2683 * _2679;
    float _2711 = fma(_2169, _2701, _2169);
    float _2713 = trunc(_2659);
    float _2715 = precise::max(_2713, 0.0);
    uint _2717 = uint(_2715);
    if (_2349)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8624 = as_type<float>(_2705);
        out.gl_Position.z = _8624;
    }
    int _2719 = ~_2457;
    int _2721 = _2719 + 1;
    float _2723 = fma(_2701, _2639, _2639);
    float _2725 = float(uint(_2697));
    float _2727 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2699);
    int _2729 = ~_2395;
    int _2731 = _2729 + 1;
    int _2733 = _2721 * int(_2673);
    int _2735 = _2733 + _2627;
    float _2737 = float(uint(_2707));
    float _2739 = _2709 * (-2.0);
    float _2741 = 1.0 / _2725;
    int _2743 = abs(_2621);
    int _2745 = ~_2493;
    int _2747 = _2745 + 1;
    float _2749 = fma(_2123, _2739, _2123);
    int _2751 = abs(_2493);
    int _2753 = _2731 * int(_2717);
    int _2755 = _2753 + _2621;
    float _2757 = float(uint(_2735));
    int _2759 = _2747 * int(_2695);
    int _2761 = _2759 + _2633;
    float _2763 = 1.0 / _2737;
    int _2765 = abs(_2627);
    float _2767 = float(uint(_2755));
    float _2769 = as_type<float>(_2617) * _2757;
    float _2771 = float(uint(_2761));
    float _2773 = as_type<float>(_2629) * _2767;
    float _2775 = _2217 * _2217;
    float _2777 = as_type<float>(_2651) * _2771;
    float _2779 = float(uint(_2751));
    float _2781 = fma(_2187, _2187, _2775);
    int _2783 = as_type<int>(_2741) + (-2);
    float _2785 = 1.0 / _2779;
    float _2787 = float(uint(_2743));
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2791 = abs(_2633);
    float _2793 = fma(_2283, _2283, _2781);
    int _2795 = as_type<int>(_2763) + (-2);
    float _2797 = as_type<float>(_2783) * _2787;
    float _2799 = float(uint(_2765));
    float _2801 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2789);
    float _2803 = rsqrt(_2793);
    float _2805 = as_type<float>(_2795) * _2799;
    float _2807 = float(uint(_2791));
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2811 = 1.0 + _2809;
    int _2813 = as_type<int>(_2785) + (-2);
    float _2815 = trunc(_2797);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2823 = as_type<float>(_2813) * _2807;
    int _2825 = ~_2697;
    int _2827 = _2825 + 1;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2831 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2833 = isnan(1.0);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2839 = _2835 || _2837;
    float _2841 = trunc(_2805);
    float _2843 = precise::max(_2841, 0.0);
    uint _2845 = uint(_2843);
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2849 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2829);
    float _2851 = -_150;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1791);
    bool _2855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    bool _2861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2863 = _2859 || _2861;
    float _2865 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2847);
    float _2867 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2821);
    float _2869 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1817);
    float _2871 = trunc(_2823);
    float _2873 = precise::max(_2871, 0.0);
    uint _2875 = uint(_2873);
    int _2877 = _2827 * int(_2819);
    int _2879 = _2877 + _2743;
    float _2881 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2849);
    float _2883 = -_2649;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2865);
    int _2889 = ~_2707;
    int _2891 = _2889 + 1;
    float _2893 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2801);
    int _2895 = ~_2751;
    int _2897 = _2895 + 1;
    float _2899 = 1.0 / _2811;
    float _2901 = float(uint(_2879));
    int _2903 = _2891 * int(_2845);
    int _2905 = _2903 + _2765;
    float _2907 = _2863 ? _2885 : 0.0;
    float _2909 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2867);
    float _2911 = as_type<float>(_2783) * _2901;
    float _2913 = trunc(_2769);
    float _2915 = precise::max(_2913, 0.0);
    uint _2917 = uint(_2915);
    int _2919 = _2897 * int(_2875);
    int _2921 = _2919 + _2791;
    float _2923 = float(uint(_2921));
    if (_2839)
    {
        float _2925 = _2907 * _2899;
        _152 = _2925;
    }
    float _2927 = _152;
    float _2929 = trunc(_2773);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = float(uint(_2905));
    float _2937 = _2217 * _2803;
    int _2939 = ~_2395;
    int _2941 = _2939 + 1;
    float _2943 = as_type<float>(_2795) * _2935;
    float _2945 = as_type<float>(_2813) * _2923;
    float _2947 = trunc(_2911);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = int(_2673) + int(_2917);
    float _2955 = _580 + (-0.5);
    int _2957 = ~_2457;
    int _2959 = _2957 + 1;
    float _2961 = -_2937;
    float _2963 = fma(_2961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2217);
    float _2965 = fma(_2955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2723);
    float _2967 = trunc(_2777);
    float _2969 = precise::max(_2967, 0.0);
    uint _2971 = uint(_2969);
    int _2973 = _2959 * _2953;
    int _2975 = _2973 + _2627;
    int _2977 = int(_2717) + int(_2933);
    float _2979 = _2963 * _2963;
    int _2981 = ~_2707;
    int _2983 = _2981 + 1;
    float _2985 = fma(_2711, _2927, _2965);
    bool _2987 = uint(_2975) >= uint(_2457);
    int _2989 = _2941 * _2977;
    int _2991 = _2989 + _2621;
    float _2993 = trunc(_2945);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    int _2999 = int(_2819) + int(_2951);
    float _3001 = _2187 * _2803;
    int _3003 = ~_2697;
    int _3005 = _3003 + 1;
    bool _3007 = uint(_2991) >= uint(_2395);
    float _3009 = -_3001;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2187);
    int _3013 = ~_2751;
    int _3015 = _3013 + 1;
    float _3017 = trunc(_2943);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    int _3023 = int(_2695) + int(_2971);
    int _3025 = _3005 * _2999;
    int _3027 = _3025 + _2743;
    int _3029 = ~_2493;
    int _3031 = _3029 + 1;
    float _3033 = fma(_3011, _3011, _2979);
    bool _3035 = !_2987;
    int _3037 = _3035 ? 0 : (-1);
    bool _3039 = uint(_3027) >= uint(_2697);
    int _3041 = _3031 * _3023;
    int _3043 = _3041 + _2633;
    int _3045 = int(_2875) + int(_2997);
    bool _3047 = !_3007;
    int _3049 = _3047 ? 0 : (-1);
    bool _3051 = uint(_3043) >= uint(_2493);
    int _3053 = _3015 * _3045;
    int _3055 = _3053 + _2791;
    float _3057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3059 = int(_2845) + int(_3021);
    int _3061 = ~_2977;
    int _3063 = _3061 + _3049;
    int _3065 = _3063 + 1;
    bool _3067 = uint(_3055) >= uint(_2751);
    int _3069 = _2983 * _3059;
    int _3071 = _3069 + _2765;
    int _3073 = ~_2953;
    int _3075 = _3073 + _3037;
    int _3077 = _3075 + 1;
    int _3079 = _2395 * _3065;
    int _3081 = _3079 + _2621;
    bool _3083 = !_3051;
    int _3085 = _3083 ? 0 : (-1);
    float _3087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3089 = _2395 == 0;
    int _3091 = _2457 * _3077;
    int _3093 = _3091 + _2627;
    bool _3095 = !_3039;
    int _3097 = _3095 ? 0 : (-1);
    bool _3099 = uint(_3071) >= uint(_2707);
    float _3101 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3103 = _2395 == 0;
    float _3105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3107 = _2621 ^ _2395;
    int _3109 = _2627 ^ _2457;
    int _3111 = ~_3023;
    int _3113 = _3111 + _3085;
    int _3115 = _3113 + 1;
    bool _3117 = !_3089;
    int _3119 = _3117 ? _3081 : (-1);
    float _3121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3123 = !_3099;
    float _3125 = _3123 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _3127 = _2457 == 0;
    bool _3129 = !_3067;
    int _3131 = _3129 ? 0 : (-1);
    float _3133 = float(_3119);
    float _3135 = _3105 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3137 = _2457 == 0;
    int _3139 = _2633 ^ _2493;
    int _3141 = _2493 * _3115;
    int _3143 = _3141 + _2633;
    bool _3145 = !_3127;
    int _3147 = _3145 ? _3093 : (-1);
    float _3149 = fma(_3101, _3133, _2853);
    bool _3151 = _2493 == 0;
    float _3153 = _3121 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3155 = _2493 == 0;
    float _3157 = fma(_3135, _815, -0.5);
    uint _3159 = uint(int(uint(_3107) >> uint(31)));
    float _3161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3163 = uint(int(uint(_3109) >> uint(31)));
    float _3165 = fma(_3153, _1487, -0.5);
    uint _3167 = uint(int(uint(_3139) >> uint(31)));
    int _3169 = ~_3097;
    int _3171 = _2999 + _3169;
    int _3173 = _3171 + 1;
    bool _3175 = !_3151;
    int _3177 = _3175 ? _3143 : (-1);
    int _3179 = ~int(_3159);
    int _3181 = _3179 + 1;
    int _3183 = ~_3131;
    int _3185 = _3045 + _3183;
    int _3187 = _3185 + 1;
    float _3189 = fma(_3101, _805, -0.5);
    int _3191 = ~as_type<int>(_3125);
    int _3193 = _3059 + _3191;
    int _3195 = _3193 + 1;
    float _3197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3199 = float(_3147);
    float _3201 = fma(_2887, _3189, _3149);
    int _3203 = ~int(_3163);
    int _3205 = _3203 + 1;
    int _3207 = ~int(_3167);
    int _3209 = _3207 + 1;
    float _3211 = fma(_3135, _3199, _2347);
    float _3213 = float(_3177);
    int _3215 = _3173 ^ _3181;
    float _3217 = fma(_2317, _3157, _3211);
    int _3219 = _3195 ^ _3205;
    float _3221 = fma(_3153, _3213, _2161);
    int _3223 = _3187 ^ _3209;
    int _3225 = ~_3181;
    int _3227 = _3225 + _3215;
    int _3229 = _3227 + 1;
    float _3231 = fma(_2893, _3165, _3221);
    int _3233 = ~_3205;
    int _3235 = _3233 + _3219;
    int _3237 = _3235 + 1;
    float _3239 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3241 = ~_3209;
    int _3243 = _3241 + _3223;
    int _3245 = _3243 + 1;
    float _3247 = _3197 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3249 = !_3103;
    int _3251 = _3249 ? _3229 : (-1);
    float _3253 = _3161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3255 = !_3137;
    int _3257 = _3255 ? _3237 : (-1);
    float _3259 = fma(_1185, _3239, -0.5);
    bool _3261 = !_3155;
    int _3263 = _3261 ? _3245 : (-1);
    float _3265 = fma(_1359, _3253, -0.5);
    float _3267 = float(_3251);
    float _3269 = fma(_3247, _1405, -0.5);
    float _3271 = float(_3257);
    float _3273 = _3231 + 0.5;
    float _3275 = float(_3263);
    float _3277 = -_2869;
    float _3279 = fma(_3239, _3267, _3277);
    float _3281 = _3201 + 0.5;
    float _3283 = -_2351;
    float _3285 = fma(_3253, _3271, _3283);
    float _3287 = _2283 * _2803;
    float _3289 = -_2727;
    float _3291 = fma(_3247, _3275, _3289);
    float _3293 = fma(_2881, _3259, _3279);
    float _3295 = fma(_2211, _3265, _3285);
    float _3297 = _3217 + 0.5;
    float _3299 = fma(_2909, _3269, _3291);
    float _3301 = _3293 + 0.5;
    float _3303 = _3295 + 0.5;
    float _3305 = -_3287;
    float _3307 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2283);
    float _3309 = _3299 + 0.5;
    float _3311 = fma(_2739, _2641, _2641);
    float _3313 = _550 + (-0.5);
    out.m_73.x = _3281;
    out.m_73.y = _3301;
    out.m_73.z = _3297;
    out.m_73.w = _3303;
    float _3315 = fma(_3307, _3307, _3033);
    bool _3317 = !_2063;
    int _3319 = _3317 ? 0 : 1;
    out.m_75.x = _3273;
    out.m_75.y = _3309;
    float _3321 = _3125;
    float _3323 = _2937;
    if (_2349)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3325 = -_2937;
    float _3327 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    int _3329 = abs(_3319);
    float _3331 = -_3001;
    float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _3335 = float(_2073);
    float _3337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3339 = _3327 + _3337;
    float _3341 = float(_3329);
    float _3343 = -_3287;
    float _3345 = fma(_3343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2101);
    float _3347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3349 = _3333 + _3347;
    float _3351 = _3339 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3353 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3311);
    float _3355 = _3341 * _3335;
    float _3357 = _580 + _592;
    float _3359 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3361 = _3345 + _3359;
    float _3363 = fma(_3349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3351);
    float _3365 = fma(_2749, _2927, _3353);
    float _3367 = _3357 + (-1.0);
    float _3369 = _3355 * (-2.0);
    float _3371 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3363);
    float _3373 = _3365 * 0.15915493667125701904296875;
    float _3375 = fma(_3367, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3377 = fma(_3369, _2643, _2643);
    float _3379 = _592 + (-0.5);
    bool _3381 = _3371 >= 0.0;
    float _3383 = fma(_3375, _3369, _3375);
    float _3385 = _2985 * 0.15915493667125701904296875;
    float _3387 = fma(_3379, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3377);
    float _3389 = _3373 * 6.283185482025146484375;
    float _3391 = sin(_3389);
    float _3393 = fma(_3383, _2927, _3387);
    float _3395 = _3393 * 0.15915493667125701904296875;
    float _3397 = _3385 * 6.283185482025146484375;
    float _3399 = sin(_3397);
    float _3401 = _3351;
    float _3403 = _3349;
    float _3405 = _3361;
    if (_3381)
    {
        _3401 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3407 = _3401;
    int _3409 = as_type<int>(_3407);
    if (_3381)
    {
        out.m_51.x = 0.0;
    }
    if (_3381)
    {
        float _3411 = _3407 * 5.0;
        _3409 = as_type<int>(_3411);
    }
    int _3413 = _3409;
    float _3415 = sqrt(_3315);
    if (_3381)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9674 = as_type<float>(_3413);
        out.gl_Position.z = _9674;
    }
    float _3417 = _3385 * 6.283185482025146484375;
    float _3419 = cos(_3417);
    float _3421 = _3399 * _3391;
    float _3423 = _3373 * 6.283185482025146484375;
    float _3425 = cos(_3423);
    float _3427 = _3395 * 6.283185482025146484375;
    float _3429 = sin(_3427);
    if (_3381)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3431 = -_2205;
    float _3433 = _3431 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3435 = -_1741;
    float _3437 = _3435 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3439 = in.m_77.x;
    float _3441 = in.m_77.y;
    float _3443 = in.m_77.z;
    float _3445 = -_2101;
    float _3447 = _3445 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3449 = _3433 * _3433;
    float _3451 = _3395 * 6.283185482025146484375;
    float _3453 = cos(_3451);
    float _3455 = _3419 * _3425;
    float _3457 = _2803 * _3415;
    float _3459 = fma(_3437, _3437, _3449);
    float _3461 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3463 = fma(_3429, _3455, _3421);
    float _3465 = fma(_3429, _3421, _3455);
    float _3467 = fma(_3447, _3447, _3459);
    float _3469 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3471 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3473 = _3399 * _3425;
    float _3475 = _3457 * _3469;
    float _3477 = rsqrt(_3467);
    float _3479 = _3419 * _3391;
    float _3481 = _3457 * _3471;
    float _3483 = _3419 * _3453;
    float _3485 = _3425 * _3453;
    float _3487 = _3399 * _3453;
    float _3489 = _3391 * _3453;
    float _3491 = -_3479;
    float _3493 = fma(_3429, _3473, _3491);
    float _3495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3439);
    float _3497 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3441);
    float _3499 = -_3473;
    float _3501 = fma(_3429, _3479, _3499);
    bool _3503 = _3441 != 0.0;
    bool _3505 = isnan(_3441);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _3495 * _3475;
    float _3515 = _3457 * _3461;
    float _3517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3443);
    float _3519 = _3497 * _3481;
    float _3521 = _3437 * _3477;
    float _3523 = _3447 * _3477;
    float _3525 = in.m_79.x;
    float _3527 = in.m_79.y;
    float _3529 = in.m_79.z;
    float _3531 = _3517 * _3515;
    float _3533 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3535 = _3521 * _3533;
    float _3537 = _3433 * _3477;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3541 = _3523 * _3539;
    bool _3543 = _3439 == 0.0;
    bool _3545 = !_3511;
    bool _3547 = _3543 && _3545;
    float _3549 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3551 = -_3535;
    float _3553 = fma(_3523, _3549, _3551);
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3557 = _3537 * _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3561 = -_3541;
    float _3563 = fma(_3537, _3559, _3561);
    bool _3565 = _3443 == 0.0;
    bool _3567 = _3565 && _3547;
    float _3569 = _3553 * _3553;
    float _3571 = in.m_81.x;
    float _3573 = in.m_81.y;
    float _3575 = in.m_81.z;
    float _3577 = in.m_81.w;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3581 = -_3557;
    float _3583 = fma(_3521, _3579, _3581);
    float _3585 = _3483 * _3519;
    float _3587 = fma(_3563, _3563, _3569);
    float _3589 = -_3519;
    float _3591 = _3429 * _3589;
    float _3593 = _3487 * _3519;
    float _3595 = fma(_3463, _3513, _3585);
    float _3597 = fma(_3583, _3583, _3587);
    float _3599 = fma(_3485, _3513, _3591);
    float _3601 = fma(_3493, _3513, _3593);
    float _3603 = fma(_3501, _3531, _3595);
    float _3605 = fma(_3489, _3531, _3599);
    float _3607 = rsqrt(_3597);
    float _3609 = _3585;
    float _3611 = _3587;
    float _3613 = _3513;
    if (_3567)
    {
        _3321 = _3527;
    }
    float _3615 = _3321;
    float _3617 = _3615;
    if (_3567)
    {
        _2435 = _3525;
    }
    float _3619 = _2435;
    float _3621 = _3619;
    if (_3567)
    {
        _3609 = _3615;
    }
    float _3623 = _3609;
    float _3625 = _3623;
    if (_3567)
    {
        _3611 = _3619;
    }
    float _3627 = _3611;
    float _3629 = _3627;
    if (!_3567)
    {
        _3617 = _3527;
    }
    float _3631 = _3617;
    float _3633 = fma(_3465, _3531, _3601);
    if (!_3567)
    {
        _3621 = _3525;
    }
    float _3635 = _3621;
    if (_3567)
    {
        _3613 = _3529;
    }
    float _3637 = _3613;
    float _3639 = _3637;
    if (!_3567)
    {
        float _3641 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3631);
        _3625 = _3641;
    }
    float _3643 = _3625;
    if (!_3567)
    {
        float _3645 = fma(_3443, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3529);
        _3639 = _3645;
    }
    float _3647 = _3639;
    float _3649 = _3575 * _3635;
    float _3651 = _3563 * _3607;
    float _3653 = _3553 * _3607;
    if (!_3567)
    {
        float _3655 = fma(_3439, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3635);
        _3629 = _3655;
    }
    float _3657 = _3629;
    float _3659 = -_3649;
    float _3661 = fma(_3571, _3529, _3659);
    float _3663 = _3573 * _3529;
    float _3665 = _3583 * _3607;
    float _3667 = _3523 * _3653;
    float _3669 = _3537 * _3651;
    float _3671 = _3571 * _3631;
    float _3673 = -_3663;
    float _3675 = fma(_3575, _3631, _3673);
    float _3677 = -_3667;
    float _3679 = fma(_3537, _3665, _3677);
    float _3681 = -_3669;
    float _3683 = fma(_3521, _3653, _3681);
    float _3685 = -_3671;
    float _3687 = fma(_3573, _3635, _3685);
    float _3689 = _3661 * _3577;
    float _3691 = _3675 * _3577;
    float _3693 = _3679 * _3603;
    float _3695 = _3683 * _3603;
    float _3697 = _3521 * _3665;
    float _3699 = _3687 * _3577;
    float _3701 = fma(_3651, _3605, _3693);
    float _3703 = fma(_3665, _3605, _3695);
    float _3705 = -_3697;
    float _3707 = fma(_3523, _3651, _3705);
    float _3709 = _3463 * _3679;
    float _3711 = fma(_3521, _3633, _3701);
    float _3713 = fma(_3523, _3633, _3703);
    float _3715 = _3463 * _3707;
    float _3717 = _3463 * _3683;
    float _3719 = _1741 + _3711;
    float _3721 = _2101 + _3713;
    float _3723 = _3483 * _3679;
    float _3725 = _3501 * _3679;
    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3729 = _3719 + _3727;
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3733 = _3721 + _3731;
    float _3735 = _3483 * _3707;
    float _3737 = _3483 * _3683;
    float _3739 = _3729 * _3729;
    float _3741 = _3733 * _3733;
    float _3743 = _3501 * _3707;
    float _3745 = _3707 * _3603;
    float _3747 = fma(_3485, _3651, _3709);
    float _3749 = _3739 + _3741;
    float _3751 = fma(_3485, _3653, _3715);
    float _3753 = fma(_3485, _3665, _3717);
    float _3755 = _3501 * _3683;
    float _3757 = sqrt(_3749);
    float _3759 = -_3429;
    float _3761 = fma(_3759, _3651, _3723);
    float _3763 = fma(_3489, _3651, _3725);
    float _3765 = -_3429;
    float _3767 = fma(_3765, _3653, _3735);
    float _3769 = fma(_3489, _3653, _3743);
    float _3771 = fma(_3653, _3605, _3745);
    float _3773 = -_3429;
    float _3775 = fma(_3773, _3665, _3737);
    float _3777 = fma(_3489, _3665, _3755);
    float _3779 = fma(_3487, _3521, _3761);
    float _3781 = fma(_3537, _3633, _3771);
    float _3783 = fma(_3487, _3537, _3767);
    float _3785 = fma(_3487, _3523, _3775);
    float _3787 = fma(_3493, _3537, _3751);
    float _3789 = _2205 + _3781;
    float _3791 = fma(_3493, _3521, _3747);
    float _3793 = fma(_3465, _3521, _3763);
    bool _3795 = _3757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3797 = fma(_3465, _3523, _3777);
    float _3799 = fma(_3493, _3523, _3753);
    float _3801 = fma(_3465, _3537, _3769);
    float _3803 = _3779 * _3573;
    float _3805 = _3783 * _3573;
    float _3807 = _3785 * _3573;
    float _3809 = _3779 * _3643;
    float _3811 = _3689 * _3779;
    float _3813 = _3783 * _3643;
    float _3815 = _3785 * _3643;
    float _3817 = _3689 * _3783;
    float _3819 = _3689 * _3785;
    float _3821 = _3779;
    float _3823 = _3781;
    float _3825 = _3739;
    float _3827 = _3741;
    float _3829 = _3719;
    float _3831 = _3757;
    float _3833 = _3699;
    if (!_3795)
    {
        _3821 = _3721;
    }
    float _3835 = _3821;
    float _3837 = _3835;
    if (!_3795)
    {
        _3823 = _3789;
    }
    float _3839 = _3823;
    bool _3841 = !_3795;
    float _3843 = _3839;
    if (!_3841)
    {
        float _3845 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3849 = _3757 + _3847;
        float _3851 = _3789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3853 = rsqrt(_3749);
        float _3855 = _3849 * _3845;
        float _3857 = _3855 * 0.15915493667125701904296875;
        float _3859 = _3857 * 6.283185482025146484375;
        float _3861 = sin(_3859);
        float _3863 = _3857 * 6.283185482025146484375;
        float _3865 = cos(_3863);
        float _3867 = fma(_3861, _3851, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3869 = _3853 * _3867;
        float _3871 = _3865 + (-1.0);
        float _3873 = fma(_3729, _3869, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3875 = fma(_3733, _3869, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3877 = _3871 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3881 = _3873 + _3879;
        float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3885 = _3875 + _3883;
        float _3887 = fma(_3789, _3865, _3877);
        float _3889 = _3881 * _3881;
        float _3891 = _3885 * _3885;
        _3843 = _3887;
        _3825 = _3889;
        _3827 = _3891;
        _3829 = _3873;
        _3837 = _3875;
        _3831 = _3857;
    }
    float _3893 = _3843;
    float _3895 = _3825;
    float _3897 = _3827;
    float _3899 = _3829;
    float _3901 = _3837;
    float _3903 = _3831;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3907 = _3893 + _3905;
    float _3909 = fma(_3791, _3571, _3803);
    float _3911 = fma(_3787, _3571, _3805);
    float _3913 = fma(_3691, _3787, _3817);
    float _3915 = fma(_3907, _3907, _3895);
    float _3917 = fma(_3799, _3571, _3807);
    float _3919 = fma(_3791, _3657, _3809);
    float _3921 = fma(_3691, _3791, _3811);
    float _3923 = _3915 + _3897;
    float _3925 = fma(_3787, _3657, _3813);
    float _3927 = fma(_3799, _3657, _3815);
    float _3929 = fma(_3691, _3799, _3819);
    float _3931 = fma(_3793, _3575, _3909);
    float _3933 = fma(_3801, _3575, _3911);
    float _3935 = sqrt(_3923);
    float _3937 = fma(_3699, _3801, _3913);
    float _3939 = fma(_3797, _3575, _3917);
    float _3941 = fma(_3793, _3647, _3919);
    float _3943 = fma(_3699, _3793, _3921);
    float _3945 = fma(_3801, _3647, _3925);
    float _3947 = fma(_3699, _3797, _3929);
    float _3949 = fma(_3797, _3647, _3927);
    out.m_83.x = _3931;
    out.m_83.y = _3933;
    out.m_83.z = _3939;
    out.m_85.x = _3943;
    out.m_85.y = _3937;
    out.m_85.z = _3947;
    out.m_87.x = _3941;
    out.m_87.y = _3945;
    out.m_87.z = _3949;
    bool _3951 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3953 = isnan(_3935);
    bool _3955 = _3951 || _3953;
    bool _3957 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3959 = _3955 || _3957;
    float _3961 = _3903;
    if (!_3959)
    {
        _3833 = 1.0;
    }
    float _3963 = _3833;
    bool _3965 = !_3959;
    float _3967 = _3963;
    if (!_3965)
    {
        bool _3969 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3971 = isnan(_3935);
        bool _3973 = _3969 || _3971;
        bool _3975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3977 = _3973 || _3975;
        if (!_3977)
        {
            float _3979 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3981 = _3935 + _3979;
            float _3983 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3985 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3983;
            float _3987 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3989 = _3987 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3991 = 1.0 / _3985;
            float _3993 = _3981 * _3991;
            float _3995 = fma(_3993, _3989, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3967 = _3995;
            _3997 = true;
        }
        else
        {
            bool _3999 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4001 = isnan(_3935);
            bool _4003 = _3999 || _4001;
            bool _4005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4007 = _4003 || _4005;
            if (!_4007)
            {
                float _4009 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4011 = _3935 + _4009;
                float _4013 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4015 = _4013 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4017 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4019 = _4017 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4021 = 1.0 / _4015;
                float _4023 = _4011 * _4021;
                float _4025 = fma(_4023, _4019, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3967 = _4025;
                _3997 = true;
            }
            else
            {
                _3967 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3997 = false;
    float _4027 = _3967;
    float _4029 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4031 = _3899 + _4029;
    float _4033 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4035 = _3893 + _4033;
    float _4037 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4039 = _3901 + _4037;
    bool _4041 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4043 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4045 = _4041 || _4043;
    bool _4047 = isnan(0.5);
    bool _4049 = _4045 || _4047;
    float _4051 = fma(_4031, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4053 = fma(_4035, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4055 = fma(_4039, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4057 = -_3001;
    float _4059 = fma(_4057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4051);
    float _4061 = -_2937;
    float _4063 = fma(_4061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4053);
    float _4065 = -_3287;
    float _4067 = fma(_4065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4055);
    float _4069 = _4063;
    float _4071 = _4059;
    float _4073 = _4067;
    if (!_4049)
    {
        float _4075 = _3339 * _3339;
        float _4077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4079 = -_2101;
        float _4081 = _4079 + _4055;
        float _4083 = -_1741;
        float _4085 = _4083 + _4051;
        float _4087 = fma(_3349, _3349, _4075);
        float _4089 = fma(_3361, _3361, _4087);
        float _4091 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4093 = sqrt(_4089);
        float _4095 = 1.0 / _3457;
        float _4097 = _4091 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4099 = precise::min(_4093, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4101 = _4099 * _4077;
        float _4103 = _4101 * _4095;
        float _4105 = -_2205;
        float _4107 = _4105 + _4053;
        float _4109 = _4097 * _4103;
        float _4111 = _4081 * _4103;
        float _4113 = fma(_4085, _4109, _3333);
        float _4115 = fma(_4107, _4109, _3327);
        float _4117 = fma(_4097, _4111, _3345);
        _4069 = _4115;
        _4071 = _4113;
        _4073 = _4117;
        _3403 = _4093;
    }
    float _4119 = _4069;
    float _4121 = _4071;
    float _4123 = _4073;
    float _4125 = _3403;
    float _4127 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4129 = _4119 + _4127;
    float _4131 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4133 = _4121 + _4131;
    float _4135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4137 = _4123 + _4135;
    float _4139 = _4129 * _4129;
    float _4141 = fma(_4133, _4133, _4139);
    float _4143 = fma(_4137, _4137, _4141);
    float _4145 = rsqrt(_4143);
    float _4147 = sqrt(_4143);
    float _4149 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4151 = _4133 * _4149;
    float _4153 = _4137 * _4149;
    float _4155 = _4151 * _4151;
    float _4157 = _4153 * _4153;
    float _4159 = _4155 + _4157;
    float _4161 = sqrt(_4159);
    bool _4163 = _4161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4167 = _4161 + _4165;
    float _4169 = _4145;
    float _4171 = _4167;
    float _4173 = _4125;
    float _4175 = _4129;
    if (_4163)
    {
        float _4177 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4169 = _4177;
    }
    float _4179 = _4169;
    if (_4163)
    {
        float _4181 = rsqrt(_4159);
        _3323 = _4181;
    }
    float _4183 = _3323;
    float _4185 = _4183;
    if (_4163)
    {
        float _4187 = _4167 * _4179;
        _4171 = _4187;
    }
    float _4189 = _4171;
    if (_4163)
    {
        float _4191 = _4189 * 0.15915493667125701904296875;
        _4173 = _4191;
    }
    float _4193 = _4173;
    float _4195 = _4179;
    float _4197 = _4193;
    if (_4163)
    {
        float _4199 = _4193 * 6.283185482025146484375;
        float _4201 = sin(_4199);
        _4195 = _4201;
    }
    float _4203 = _4195;
    float _4205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4207 = precise::max(0.0, _4205);
    float _4209 = _4137;
    float _4211 = _4207;
    if (_4163)
    {
        float _4213 = _4193 * 6.283185482025146484375;
        float _4215 = cos(_4213);
        _4209 = _4215;
    }
    float _4217 = _4209;
    float _4219 = -_4149;
    float _4221 = -_4207;
    float _4223 = fma(_4129, _4219, _4221);
    if (!_4163)
    {
        _4175 = _4153;
    }
    float _4225 = _4175;
    float _4227 = _4225;
    if (_4163)
    {
        float _4229 = _4223 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4211 = _4229;
    }
    float _4231 = _4211;
    float _4233 = _4203;
    float _4235 = _4231;
    if (_4163)
    {
        float _4237 = fma(_4203, _4231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3405 = _4237;
    }
    float _4239 = _3405;
    float _4241 = _4239;
    if (!_4163)
    {
        _4233 = _4151;
    }
    float _4243 = _4233;
    float _4245 = _4243;
    if (_4163)
    {
        float _4247 = _4217 + (-1.0);
        _4235 = _4247;
    }
    float _4249 = _4235;
    float _4251 = _4249;
    if (_4163)
    {
        float _4253 = _4183 * _4239;
        _3961 = _4253;
    }
    float _4255 = _3961;
    if (!_4163)
    {
        _4241 = _4223;
    }
    float _4257 = _4241;
    float _4259 = _4257;
    if (_4163)
    {
        float _4261 = _4249 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4197 = _4261;
    }
    float _4263 = _4197;
    if (_4163)
    {
        float _4265 = _4151 * _4255;
        _4245 = _4265;
    }
    float _4267 = _4245;
    if (!_4163)
    {
        _4185 = _4155;
    }
    float _4269 = _4185;
    float _4271 = _4269;
    if (_4163)
    {
        float _4273 = _4153 * _4255;
        _4227 = _4273;
    }
    float _4275 = _4227;
    if (_4163)
    {
        float _4277 = fma(_4223, _4217, _4263);
        _4259 = _4277;
    }
    float _4279 = _4259;
    if (_4163)
    {
        float _4281 = _4267 * _4267;
        _4271 = _4281;
    }
    float _4283 = _4271;
    if (!_4163)
    {
        _4251 = _4157;
    }
    float _4285 = _4251;
    float _4287 = _4285;
    if (_4163)
    {
        float _4289 = _4275 * _4275;
        _4287 = _4289;
    }
    float _4291 = _4287;
    float _4293 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4295 = fma(_4279, _4279, _4283);
    float _4297 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4299 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4301 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4293);
    float _4303 = _4295 + _4291;
    float _4305 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4307 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4299);
    float _4309 = rsqrt(_4303);
    float _4311 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4305);
    float _4313 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4307);
    float _4315 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4301);
    float _4317 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4319 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4311);
    float _4321 = _4313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4323 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4325 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4323);
    float _4327 = precise::clamp(_4325, 0.0, 1.0);
    float _4329 = _4315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4331 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4333 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4335 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4317);
    float _4337 = -_4327;
    float _4339 = _4337 + 1.0;
    float _4341 = floor(_4297);
    float _4343 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4333);
    float _4345 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4335);
    float _4347 = _4309 * _4279;
    float _4349 = _4309 * _4275;
    float _4351 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4343);
    float _4353 = _4309 * _4267;
    float _4355 = _4345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4357 = abs(_4339);
    float _4359 = log2(_4357);
    float _4361 = fma(_3345, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4363 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4365 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4351);
    float _4367 = -_4363;
    float _4369 = fma(_4347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4367);
    float _4371 = floor(_4361);
    float _4373 = -_4341;
    float _4375 = _4297 + _4373;
    float _4377 = -_4349;
    float _4379 = fma(_4377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4369);
    float _4381 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4383 = fma(_4379, -0.5, 0.5);
    float _4385 = fma(_4379, 0.5, 0.5);
    float _4387 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4389 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4391 = 1.0 / _4365;
    float _4393 = -_4381;
    float _4395 = fma(_4393, _4387, 1.0);
    float _4397 = fma(_4385, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4399 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4401 = fma(_4385, _4397, -0.212114393711090087890625);
    float _4403 = exp2(_4389);
    float _4405 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4399);
    float _4407 = fma(_4385, _4401, 1.570728778839111328125);
    float _4409 = log2(_4395);
    float _4411 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4413 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4411);
    float _4415 = sqrt(_4383);
    float _4417 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4413);
    float _4419 = _4347 + 1.0;
    float _4421 = -_4347;
    float _4423 = fma(_4403, _4419, _4421);
    float _4425 = _4409 * 0.693147182464599609375;
    float _4427 = -_4371;
    float _4429 = _4361 + _4427;
    float _4431 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4405);
    float _4433 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4417);
    float _4435 = fma(_4423, 0.5, 0.5);
    float _4437 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4431);
    float _4439 = _4433 * _4391;
    float2 _11348 = float2(_4375, _4429);
    float _4441 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11348, float2(0.0), isnan(_11348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11348, float2(0.0), isnan(_11348)), level(0.0)).x;
    float _4443 = _4415 * 0.636619746685028076171875;
    float _4445 = _4437 * _4391;
    float _4447 = fma(_4439, -0.5, 0.5);
    float _4449 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4451 = -_4407;
    float _4453 = fma(_4443, _4451, 1.0);
    float _4455 = fma(_4445, 0.5, 0.5);
    float3 _11378 = float3(_4455, _4447, _4449);
    float _4457 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11378, float3(0.0), isnan(_11378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11378, float3(0.0), isnan(_11378)), level(0.0)).x;
    float3 _11389 = float3(_4455, _4447, _4449);
    float4 _4460 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11389, float3(0.0), isnan(_11389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11389, float3(0.0), isnan(_11389)), level(0.0)).xyzw;
    float _4462 = _4460.x;
    float _4464 = _4460.y;
    float _4466 = _4460.z;
    float _4468 = _4460.w;
    float2 _11405 = float2(_4453, _4435);
    float3 _4472 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11405, float2(0.0), isnan(_11405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11405, float2(0.0), isnan(_11405)), level(0.0)).xyz;
    float _4474 = _4472.x;
    float _4476 = _4472.y;
    float _4478 = _4472.z;
    float _4480 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4482 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4484 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4486 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4488 = isnan(_4147);
    bool _4490 = _4486 || _4488;
    bool _4492 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4494 = _4490 || _4492;
    float _4496 = fma(_3333, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4480);
    float _4498 = fma(_3333, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4482);
    float _4500 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4484);
    float _4502 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4504 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4496);
    float _4506 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4498);
    float _4508 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4500);
    float _4510 = _4504 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4512 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4514 = exp2(_4502);
    float _4516 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4508);
    float _4518 = _4512 + _4510;
    float _4520 = 1.0 / _4510;
    float _4522 = -_4514;
    float _4524 = _4522 + 1.0;
    float _4526 = _4524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4528 = _4518 * _4520;
    float _4530 = _4528 * 0.5;
    float _4532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4534 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4532);
    float _4536 = 1.0 / _4534;
    float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4540 = _4536 * _4538;
    float _4542 = _4516 + _4365;
    float _4544 = abs(_4540);
    float _4546 = log2(_4544);
    bool _4548 = _4540 <= 8000.0;
    bool _4550 = isnan(_4540);
    bool _4552 = _4548 || _4550;
    bool _4554 = isnan(8000.0);
    bool _4556 = _4552 || _4554;
    float _4558 = float(_4556);
    float _4560 = _4546 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4562 = exp2(_4560);
    float _4564 = fma(_4562, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4566 = precise::clamp(_4564, 0.0, 1.0);
    float _4568 = _4542 * 0.5;
    float _4570 = fma(_4566, -2.0, 3.0);
    float _4572 = _4566 * _4566;
    out.m_89.z = _4568;
    out.m_89.w = _4365;
    float _4574 = _4572 * _4570;
    float _4576 = in.m_91.x;
    float _4578 = -_4574;
    float _4580 = _4578 + 1.0;
    float _4582 = fma(_4580, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4574);
    float _4584 = _4558 * _4582;
    out.gl_Position.x = _4437;
    out.gl_Position.y = _4433;
    out.gl_Position.z = _4516;
    out.gl_Position.w = _4365;
    float _4586 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4588 = _4433;
    float _4590 = _4437;
    if (!_4494)
    {
        _4588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4592 = _4588;
    float _4594 = _4592;
    float _4596 = _4592;
    if (!_4494)
    {
        _4590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4598 = _4590;
    float _4600 = -_4441;
    float _4602 = _4600 + 1.0;
    float _4604 = _4602 * _4586;
    float _4606 = precise::clamp(_4604, 0.0, 1.0);
    float _4608 = -_4606;
    float _4610 = fma(_4608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4612 = _4526 * _4457;
    float _4614 = -_4526;
    float _4616 = _4614 + 1.0;
    float _4618 = _4610 * _4576;
    float _4620 = _4468 * _4612;
    float _4622 = _4478 * _4612;
    float _4624 = _4468 * _4616;
    float _4626 = _4618 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4628 = fma(_4474, _4620, _4462);
    float _4630 = fma(_4476, _4620, _4464);
    float _4632 = fma(_4468, _4622, _4466);
    float _4634 = _4622;
    float _4636 = _4598;
    float _4638 = _4598;
    if (!_4494)
    {
        _4634 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4640 = _4634;
    out.m_93.x = _4626;
    out.m_95.x = _4628;
    out.m_95.y = _4630;
    out.m_95.z = _4632;
    out.m_95.w = _4624;
    bool _4642 = !_4494;
    float _4644 = _4640;
    float _4646 = _4640;
    if (!_4642)
    {
        bool _4648 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4650 = isnan(_4147);
        bool _4652 = _4648 || _4650;
        bool _4654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4656 = _4652 || _4654;
        if (!_4656)
        {
            float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4660 = _4147 + _4658;
            float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4664 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4662;
            float _4666 = 1.0 / _4664;
            float _4668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4670 = _4668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4672 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4674 = _4672 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4676 = _4660 * _4666;
            float _4678 = precise::clamp(_4676, 0.0, 1.0);
            float _4680 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4682 = _4680 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4684 = fma(_4678, _4674, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4686 = fma(_4678, _4682, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4688 = fma(_4678, _4670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4638 = _4688;
            _4596 = _4686;
            _4646 = _4684;
            _4690 = true;
        }
        else
        {
            bool _4692 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4694 = isnan(_4147);
            bool _4696 = _4692 || _4694;
            bool _4698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4700 = _4696 || _4698;
            if (!_4700)
            {
                _4594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4702 = _4594;
            _4596 = _4702;
            if (!_4700)
            {
                _4636 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4704 = _4636;
            _4638 = _4704;
            if (!_4700)
            {
                _4644 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4706 = _4644;
            bool _4708 = !_4700;
            _4646 = _4706;
            if (!_4708)
            {
                bool _4710 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4712 = isnan(_4147);
                bool _4714 = _4710 || _4712;
                bool _4716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4718 = _4714 || _4716;
                if (!_4718)
                {
                    float _4720 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4722 = _4147 + _4720;
                    float _4724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4726 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4724;
                    float _4728 = 1.0 / _4726;
                    float _4730 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4732 = _4730 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4736 = _4734 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4738 = _4722 * _4728;
                    float _4740 = precise::clamp(_4738, 0.0, 1.0);
                    float _4742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4744 = _4742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4746 = fma(_4740, _4736, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4748 = fma(_4740, _4744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4750 = fma(_4740, _4732, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4638 = _4750;
                    _4596 = _4748;
                    _4646 = _4746;
                    _4690 = true;
                }
                else
                {
                    _4638 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4646 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4690 = false;
    float _4752 = _4638;
    float _4754 = _4596;
    float _4756 = _4646;
    float _4758 = _4752 * 0.586610972881317138671875;
    bool _4760 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4762 = fma(_4754, 0.298911988735198974609375, _4758);
    out.m_97.x = 0.0;
    float _4764 = fma(_4756, 0.114477999508380889892578125, _4762);
    float _4766 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4768 = -_4764;
    float _4770 = _4768 + _4754;
    float _4772 = -_4764;
    float _4774 = _4772 + _4752;
    float _4776 = -_4764;
    float _4778 = _4776 + _4756;
    out.m_93.w = _4766;
    float _4780 = fma(_4770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    float _4782 = fma(_4774, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    float _4784 = fma(_4778, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    out.m_99.x = _4780;
    out.m_99.y = _4782;
    out.m_99.z = _4784;
    if (!_4760)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4786 = -_4119;
    float _4788 = _4786 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4790 = -_4121;
    float _4792 = _4790 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4794 = -_4123;
    float _4796 = _4794 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4798 = _4788 * _4788;
    float _4800 = fma(_4792, _4792, _4798);
    float _4802 = fma(_4796, _4796, _4800);
    float _4804 = sqrt(_4802);
    float _4806 = rsqrt(_4802);
    float _4808 = -_4804;
    float _4810 = _4808 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4812 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4814 = precise::clamp(_4812, 0.0, 1.0);
    float _4816 = _4792 * _4806;
    float _4818 = _4788 * _4806;
    float _4820 = abs(_4814);
    float _4822 = log2(_4820);
    float _4824 = _4796 * _4806;
    float _4826 = _4816 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4828 = _3945 * _4818;
    float _4830 = -_4818;
    float _4832 = -_4826;
    float _4834 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4832);
    float _4836 = fma(_3941, _4816, _4828);
    float _4838 = -_4824;
    float _4840 = fma(_4838, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4834);
    float _4842 = fma(_3949, _4824, _4836);
    float _4844 = precise::clamp(_4842, 0.0, 1.0);
    float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4848 = _4840 + _4846;
    float _4850 = _4822 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4852 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4854 = precise::clamp(_4852, 0.0, 1.0);
    float _4856 = exp2(_4850);
    float _4858 = _4856 * _4854;
    float _4860 = _4844 * _4858;
    float _4862 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4864 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4866 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4862;
    out.m_97.y = _4864;
    out.m_97.z = _4866;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4690 = false;
    bool _3997 = false;
    bool _536 = false;
    bool _418 = false;
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
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_134);
        out.gl_Position.z = _4922;
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
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_118);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    int _168 = 0;
    if (_162)
    {
        float _170 = _166 * 5.0;
        _168 = as_type<int>(_170);
    }
    int _172 = _168;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4992 = as_type<float>(_172);
        out.gl_Position.z = _4992;
    }
    if (_162)
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
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _236;
    float _248 = 1.0 / _240;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = _262 * _266;
    float _270 = _212 * _246;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    bool _280 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _282 = isnan(_204);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_262;
    float _294 = _292 + 1.0;
    float _296 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_278, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _304 = _232 * _248;
    bool _306 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_204);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = fma(_302, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _328 = fma(_320, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = -_316;
    float _332 = _330 + 1.0;
    float _334 = _316 * _294;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _340 = fma(_324, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = _290 * _332;
    float _344 = -_290;
    float _346 = _344 + 1.0;
    float _348 = fma(_338, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = _296 * _342;
    float _352 = _298 * _342;
    float _354 = _328 * _342;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _362;
    float _366 = fma(_340, _334, _356);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _372;
    float _376 = fma(_364, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_348, _334, _358);
    float _380 = fma(_370, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _382 = fma(_374, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_326, _334, _360);
    float _386 = fma(_376, _268, _366);
    float _388 = fma(_380, _268, _378);
    float _390 = fma(_382, _268, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_55.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _150 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_57.x;
    float _430 = in.m_57.y;
    float _432 = in.m_57.z;
    bool _434 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_426);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_426);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _426 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _464 * _476;
    float _486 = fma(_484, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _478;
    float _490 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _508 = _396 * _432;
    float _510 = _394 * _430;
    float _512 = _392 * _428;
    out.m_59.x = _500;
    out.m_59.y = _502;
    out.m_59.z = _504;
    out.m_59.w = _506;
    bool _514 = !_474;
    float _516 = _430;
    float _534;
    if (!_514)
    {
        float _518 = in.m_55.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_118);
        float _540 = 1.0 / _538;
        float _542 = _150 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _548 = int(_546);
    float _550 = in.m_55.y;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _558 = _556 != 0;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _562 = int(_560);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _566 = _564 != 0;
    float _568 = float(_548);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _572 = int(_570);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _576 = float(_562);
    float _578 = 1.0 / _568;
    float _580 = in.m_55.x;
    float _582 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _584 = int(_582);
    float _586 = float(_572);
    float _588 = 1.0 / _576;
    float _590 = _578 * _150;
    float _592 = in.m_55.z;
    float _594 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _596 = int(_594);
    float _598 = float(uint(_584));
    float _600 = _586;
    float _602 = _588;
    bool _604 = _554;
    if (_554)
    {
        _516 = _580;
    }
    float _606 = _516;
    float _608 = 1.0 / _586;
    float _610 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _612 = int(_610);
    float _614 = float(uint(_596));
    float _616 = _606;
    float _618 = _608;
    if (_554)
    {
        _600 = 1.0;
    }
    float _620 = _600;
    float _622 = _620;
    if (!_554)
    {
        _622 = 1.2345600128173828125;
    }
    float _624 = _622;
    if (!_554)
    {
        _616 = _592;
    }
    float _626 = _616;
    float _628 = 1.0 / _598;
    int _630 = ~_596;
    int _632 = _630 + 1;
    bool _634 = _592 > 0.5;
    float _636 = trunc(_590);
    int _638 = int(_636);
    float _640 = _588 * _150;
    if (_554)
    {
        _602 = 1.0;
    }
    float _642 = _602;
    float _644 = _642;
    if (!_554)
    {
        _644 = 7.345489978790283203125;
    }
    float _646 = _644;
    float _648 = float(uint(_612));
    float _650 = 1.0 / _614;
    float _652 = _646 * _580;
    int _654 = as_type<int>(_628) + (-2);
    int _656 = ~_612;
    int _658 = _656 + 1;
    int _660 = ~_612;
    int _662 = _660 + 1;
    float _664 = float(uint(_638));
    float _666 = _608 * _150;
    float _668 = _664;
    int _670 = as_type<int>(_652);
    float _672 = as_type<float>(_654);
    if (_554)
    {
        _618 = _580;
    }
    float _674 = _618;
    float _676 = trunc(_640);
    int _678 = int(_676);
    float _680 = _674;
    if (!_554)
    {
        _680 = _550;
    }
    float _682 = _680;
    float _684 = as_type<float>(_654) * _664;
    if (_554)
    {
        _668 = 1.0;
    }
    float _686 = _668;
    float _688 = _686;
    if (!_554)
    {
        _688 = 5.839270114898681640625;
    }
    float _690 = _688;
    float _692 = _682 * _624;
    int _694 = as_type<int>(_650) + (-2);
    float _696 = 1.0 / _648;
    float _698 = in.m_61.x;
    float _700 = _626 * _690;
    int _702 = ~_584;
    int _704 = _702 + 1;
    float _706 = _698;
    int _708 = _704;
    if (_558)
    {
        bool _710 = _580 > 0.5;
        _604 = _710;
    }
    bool _712 = _604;
    int _714 = ~_612;
    int _716 = _714 + 1;
    float _718 = trunc(_684);
    float _720 = precise::max(_718, 0.0);
    uint _723 = uint(_720);
    float _725 = in.m_55.w;
    float _727 = float(uint(_678));
    float _729 = trunc(_666);
    int _731 = int(_729);
    float _733 = as_type<float>(_694) * _727;
    int _735 = as_type<int>(_696) + (-2);
    int _737 = _704 * int(_723);
    int _739 = _737 + _638;
    float _741 = trunc(_733);
    float _743 = precise::max(_741, 0.0);
    uint _745 = uint(_743);
    float _747 = float(uint(_739));
    float _749 = float(uint(_731));
    float _751 = floor(_652);
    bool _753 = _725 > 0.5;
    float _755 = as_type<float>(_654) * _747;
    float _757 = _725;
    float _759 = as_type<float>(_739);
    float _761 = as_type<float>(_735);
    if (!_558)
    {
        _757 = _698;
    }
    float _763 = _757;
    float _765 = as_type<float>(_735) * _749;
    float _767 = _763;
    if (!_558)
    {
        _759 = _763;
    }
    float _769 = _759;
    float _771 = trunc(_755);
    float _773 = precise::max(_771, 0.0);
    uint _775 = uint(_773);
    float _777 = _769;
    if (_558)
    {
        _767 = _698;
    }
    float _779 = _767;
    if (!_566)
    {
        _706 = _779;
    }
    float _781 = _706;
    float _783 = _781;
    if (_558)
    {
        float _785 = -_779;
        float _787 = _785 + 1.0;
        _708 = as_type<int>(_787);
    }
    int _789 = _708;
    float _791 = floor(_692);
    float _793 = -_751;
    float _795 = _652 + _793;
    if (_566)
    {
        float _797 = -_779;
        float _799 = _797 + 1.0;
        _670 = as_type<int>(_799);
    }
    int _801 = _670;
    if (_558)
    {
        float _803 = _712 ? as_type<float>(_789) : _779;
        _777 = _803;
    }
    float _805 = _777;
    int _807 = _632 * int(_745);
    int _809 = _807 + _678;
    float _811 = float(_118);
    if (_566)
    {
        float _813 = _634 ? as_type<float>(_801) : _779;
        _783 = _813;
    }
    float _815 = _783;
    float _817 = trunc(_765);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    float _823 = float(uint(_809));
    int _825 = int(_723) + int(_775);
    float _827 = float(_638);
    float _829 = as_type<float>(_694) * _823;
    float _831 = float(_584);
    float _833 = floor(_700);
    float _835 = -_791;
    float _837 = _692 + _835;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _841 = _839 != 0;
    bool _843 = _827 >= _831;
    bool _845 = isnan(_827);
    bool _847 = _843 || _845;
    bool _849 = isnan(_831);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _795 * _831;
    float _857 = _831 * _150;
    int _859 = _658 * int(_821);
    int _861 = _859 + _731;
    float _863 = trunc(_829);
    float _865 = precise::max(_863, 0.0);
    uint _867 = uint(_865);
    float _869 = float(uint(_861));
    float _871 = float(_596);
    float _873 = -_833;
    float _875 = _700 + _873;
    int _877 = ~_584;
    int _879 = _877 + 1;
    float _881 = as_type<float>(_735) * _869;
    float _883 = 1.0 / _811;
    float _885 = _871 * _837;
    float _887 = float(_612);
    float _889 = float(_678);
    int _891 = _879 * _825;
    int _893 = _891 + _638;
    float _895 = trunc(_881);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = float(_731);
    bool _903 = !_841;
    int _905 = _903 ? 0 : 1;
    bool _907 = uint(_893) >= uint(_584);
    bool _909 = _901 >= _887;
    bool _911 = isnan(_901);
    bool _913 = _909 || _911;
    bool _915 = isnan(_887);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = trunc(_855);
    int _923 = int(_921);
    int _925 = int(_745) + int(_867);
    float _927 = _883 * _150;
    int _929 = ~_596;
    int _931 = _929 + 1;
    float _933 = _857 * _883;
    int _935 = abs(_905);
    float _937 = _871 * _927;
    float _939 = trunc(_853);
    int _941 = int(_939);
    bool _943 = !_907;
    int _945 = _943 ? 0 : (-1);
    int _947 = _931 * _925;
    int _949 = _947 + _678;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _961 = _959 != 0;
    int _963 = ~_825;
    int _965 = _963 + _945;
    int _967 = _965 + 1;
    bool _969 = uint(_949) >= uint(_596);
    int _971 = _923 * _935;
    int _973 = _971 + _638;
    int _975 = int(_821) + int(_899);
    float _977 = in.m_61.y;
    int _979 = ~_612;
    int _981 = _979 + 1;
    int _983 = _584 * _967;
    int _985 = _983 + _638;
    bool _987 = !_969;
    int _989 = _987 ? 0 : (-1);
    float _991 = trunc(_933);
    int _993 = int(_991);
    bool _995 = _584 == 0;
    int _997 = _981 * _975;
    int _999 = _997 + _731;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1003 = _1001 != 0;
    bool _1005 = _889 >= _871;
    bool _1007 = isnan(_889);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(_871);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _887 * _927;
    float _1019 = _887 * _875;
    int _1021 = ~_941;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = trunc(_885);
    int _1029 = int(_1027);
    bool _1031 = !_995;
    int _1033 = _1031 ? _985 : (-1);
    bool _1035 = !_1003;
    int _1037 = _1035 ? 0 : 1;
    bool _1039 = uint(_999) >= uint(_612);
    bool _1041 = !_957;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = trunc(_919);
    int _1047 = int(_1045);
    int _1049 = ~_925;
    int _1051 = _1049 + _989;
    int _1053 = _1051 + 1;
    int _1055 = _1033 * _1025;
    int _1057 = abs(_1037);
    bool _1059 = !_1039;
    int _1061 = _1059 ? 0 : (-1);
    int _1063 = _584 + (-1);
    int _1065 = _1029 * _1057;
    int _1067 = _1065 + _678;
    int _1069 = abs(_1043);
    float _1071 = trunc(_1019);
    int _1073 = int(_1071);
    int _1075 = ~_975;
    int _1077 = _1075 + _1061;
    int _1079 = _1077 + 1;
    int _1081 = _941 * _1063;
    int _1083 = _1081 + _1055;
    bool _1085 = !_953;
    int _1087 = _1085 ? 0 : 1;
    int _1089 = _596 * _1053;
    int _1091 = _1089 + _678;
    int _1093 = _612 * _1079;
    int _1095 = _1093 + _731;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1099 = _1097 != 0;
    int _1101 = abs(_1087);
    int _1103 = _1083 * _1069;
    float _1105 = -_977;
    float _1107 = _1105 + 1.0;
    bool _1109 = !_1099;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1115 = _1113 != 0;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1119 = _1117 != 0;
    int _1121 = _993 * _1101;
    int _1123 = _1121 + _1103;
    int _1125 = _753 ? as_type<int>(_1107) : as_type<int>(_977);
    float _1127 = trunc(_1015);
    int _1129 = int(_1127);
    bool _1131 = !_961;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1137 = _1135 != 0;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1141 = _1139 != 0;
    bool _1143 = !_1119;
    int _1145 = _1143 ? 0 : 1;
    bool _1147 = _550 > 0.5;
    bool _1149 = !_1137;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1155 = _1153 != 0;
    int _1157 = abs(_1133);
    bool _1159 = !_1155;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = abs(_1111);
    int _1165 = _973 * _1157;
    int _1167 = _1165 + _1123;
    bool _1169 = !_1115;
    int _1171 = _1169 ? 0 : 1;
    int _1173 = abs(_1161);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1177 = _1175 != 0;
    int _1179 = _1147 ? as_type<int>(_1107) : as_type<int>(_977);
    int _1181 = _1073 * _1173;
    int _1183 = _1181 + _731;
    float _1185 = _1177 ? as_type<float>(_1179) : _977;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1189 = _1187 != 0;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1193 = _1191 != 0;
    int _1195 = _923 * _1163;
    int _1197 = _1195 + _1167;
    bool _1199 = _612 == 0;
    float _1201 = trunc(_937);
    int _1203 = int(_1201);
    bool _1205 = _596 == 0;
    int _1207 = ~_1047;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    bool _1213 = !_1199;
    int _1215 = _1213 ? _1095 : (-1);
    float _1217 = float(uint(_1197));
    int _1219 = ~_1129;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    int _1225 = _1211 * _1215;
    bool _1227 = !_1205;
    int _1229 = _1227 ? _1091 : (-1);
    float _1231 = as_type<float>(_654) * _1217;
    bool _1233 = !_1193;
    int _1235 = _1233 ? 0 : 1;
    int _1237 = abs(_1145);
    int _1239 = _1223 * _1229;
    int _1241 = _596 + (-1);
    float _1243 = trunc(_1231);
    float _1245 = precise::max(_1243, 0.0);
    uint _1247 = uint(_1245);
    int _1249 = abs(_1171);
    int _1251 = abs(_1235);
    int _1253 = _1129 * _1241;
    int _1255 = _1253 + _1239;
    int _1257 = _612 + (-1);
    bool _1259 = !_1141;
    int _1261 = _1259 ? 0 : 1;
    int _1263 = _1255 * _1237;
    int _1265 = abs(_1151);
    int _1267 = _1047 * _1257;
    int _1269 = _1267 + _1225;
    int _1271 = ~_584;
    int _1273 = _1271 + 1;
    int _1275 = _1203 * _1249;
    int _1277 = _1275 + _1263;
    int _1279 = abs(_1261);
    float _1281 = trunc(_1017);
    int _1283 = int(_1281);
    int _1285 = _1067 * _1265;
    int _1287 = _1285 + _1277;
    int _1289 = _1273 * int(_1247);
    int _1291 = _1289 + _1197;
    bool _1293 = !_1189;
    int _1295 = _1293 ? 0 : 1;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1299 = _1297 != 0;
    int _1301 = _1029 * _1279;
    int _1303 = _1301 + _1287;
    float _1305 = float(uint(_1291));
    int _1307 = abs(_1295);
    bool _1309 = !_1299;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = as_type<float>(_654) * _1305;
    float _1315 = float(uint(_1303));
    float _1317 = trunc(_1313);
    float _1319 = precise::max(_1317, 0.0);
    uint _1321 = uint(_1319);
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1325 = _1323 != 0;
    int _1327 = abs(_1311);
    float _1329 = as_type<float>(_694) * _1315;
    int _1331 = _1269 * _1251;
    bool _1333 = !_1325;
    int _1335 = _1333 ? 0 : 1;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1339 = _1337 != 0;
    int _1341 = _1283 * _1307;
    int _1343 = _1341 + _1331;
    int _1345 = abs(_1335);
    float _1347 = trunc(_1329);
    float _1349 = precise::max(_1347, 0.0);
    uint _1351 = uint(_1349);
    float _1353 = float(uint(_973));
    int _1355 = _1183 * _1327;
    int _1357 = _1355 + _1343;
    float _1359 = _1339 ? as_type<float>(_1125) : _977;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1363 = _1361 != 0;
    float _1365 = as_type<float>(_654) * _1353;
    int _1367 = ~_584;
    int _1369 = _1367 + 1;
    int _1371 = _1073 * _1345;
    int _1373 = _1371 + _1357;
    int _1375 = int(_1247) + int(_1321);
    int _1377 = ~_596;
    int _1379 = _1377 + 1;
    float _1381 = trunc(_1365);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    bool _1387 = _592 > 0.5;
    int _1389 = _1369 * _1375;
    int _1391 = _1389 + _1197;
    float _1393 = float(uint(_1373));
    int _1395 = ~_584;
    int _1397 = _1395 + 1;
    float _1399 = _977;
    int _1401 = _1197;
    if (_1363)
    {
        float _1403 = _1387 ? _1107 : _977;
        _1399 = _1403;
    }
    float _1405 = _1399;
    int _1407 = _1379 * int(_1351);
    int _1409 = _1407 + _1303;
    bool _1411 = uint(_1391) >= uint(_584);
    float _1413 = as_type<float>(_735) * _1393;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1417 = _1415 != 0;
    float _1419 = float(uint(_1409));
    float _1421 = trunc(_1413);
    float _1423 = precise::max(_1421, 0.0);
    uint _1425 = uint(_1423);
    bool _1427 = !_1411;
    int _1429 = _1427 ? 0 : (-1);
    int _1431 = _1397 * int(_1385);
    int _1433 = _1431 + _973;
    bool _1435 = _584 == 0;
    float _1437 = as_type<float>(_694) * _1419;
    int _1439 = ~_1375;
    int _1441 = _1439 + _1429;
    int _1443 = _1441 + 1;
    float _1445 = in.m_63.x;
    float _1447 = in.m_63.y;
    float _1449 = in.m_63.z;
    float _1451 = float(uint(_1433));
    int _1453 = ~_612;
    int _1455 = _1453 + 1;
    float _1457 = trunc(_1437);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    int _1463 = _584 * _1443;
    int _1465 = _1463 + _1197;
    float _1467 = _1449;
    if (_1417)
    {
        float _1469 = -_779;
        float _1471 = _1469 + 1.0;
        _1401 = as_type<int>(_1471);
    }
    int _1473 = _1401;
    float _1475 = as_type<float>(_654) * _1451;
    if (!_1417)
    {
        _672 = _779;
    }
    float _1477 = _672;
    bool _1479 = !_1435;
    int _1481 = _1479 ? _1465 : (-1);
    float _1483 = _1477;
    if (_1417)
    {
        float _1485 = _1147 ? as_type<float>(_1473) : _779;
        _1483 = _1485;
    }
    float _1487 = _1483;
    int _1489 = _1455 * int(_1425);
    int _1491 = _1489 + _1373;
    int _1493 = _1481 & 3;
    bool _1495 = _1493 != 0;
    float _1497 = trunc(_1475);
    float _1499 = precise::max(_1497, 0.0);
    uint _1501 = uint(_1499);
    int _1503 = _1481 & 3;
    bool _1505 = _1503 != 0;
    bool _1507 = uint(_1493) > 1u;
    int _1509 = int(_1351) + int(_1461);
    float _1511 = float(uint(_1491));
    int _1513 = ~_596;
    int _1515 = _1513 + 1;
    int _1517 = _1505 ? 0 : 1;
    float _1519 = as_type<float>(_735) * _1511;
    bool _1521 = uint(_1493) >= 2u;
    int _1523 = _1515 * _1509;
    int _1525 = _1523 + _1303;
    int _1527 = ~_1517;
    int _1529 = _1527 + 1;
    int _1531 = _1529 + 1;
    float _1533 = trunc(_1519);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    int _1539 = _1531;
    if (!_1507)
    {
        int _1541 = ~_1517;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    bool _1547 = uint(_1525) >= uint(_596);
    int _1549 = int(_1385) + int(_1501);
    bool _1551 = !_1547;
    int _1553 = _1551 ? 0 : (-1);
    int _1555 = ~_584;
    int _1557 = _1555 + 1;
    int _1559 = _1521 ? 0 : 1;
    bool _1561 = _1493 != 3;
    int _1563 = _1557 * _1549;
    int _1565 = _1563 + _973;
    int _1567 = ~_1509;
    int _1569 = _1567 + _1553;
    int _1571 = _1569 + 1;
    int _1573 = ~_1559;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    bool _1579 = uint(_1565) >= uint(_584);
    int _1581 = _596 * _1571;
    int _1583 = _1581 + _1303;
    int _1585 = int(_1425) + int(_1537);
    float _1587 = in.m_65.x;
    float _1589 = in.m_65.y;
    float _1591 = in.m_65.z;
    bool _1593 = !_1579;
    int _1595 = _1593 ? 0 : (-1);
    bool _1597 = !_1205;
    int _1599 = _1597 ? _1583 : (-1);
    float _1601 = in.m_67.x;
    float _1603 = in.m_67.y;
    float _1605 = in.m_67.z;
    int _1607 = _1577;
    if (_1561)
    {
        int _1609 = ~_1559;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    int _1615 = _662 * _1585;
    int _1617 = _1615 + _1373;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1621 = _1619 != 0;
    float _1623 = in.m_48.x;
    float _1625 = in.m_48.y;
    float _1627 = in.m_48.z;
    int _1629 = _1599 & 3;
    bool _1631 = _1629 != 0;
    bool _1633 = !_1621;
    int _1635 = _1633 ? 0 : 1;
    int _1637 = _1631 ? 0 : 1;
    bool _1639 = uint(_1629) >= 2u;
    bool _1641 = _1629 != 3;
    int _1643 = _1639 ? 0 : 1;
    bool _1645 = uint(_1629) > 1u;
    float _1647 = float(uint(_1067));
    int _1649 = ~_1643;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = ~_1637;
    int _1657 = _1655 + 1;
    int _1659 = _1657 + 1;
    float _1661 = as_type<float>(_694) * _1647;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1665 = _1663 != 0;
    int _1667 = _1653;
    int _1669 = _1659;
    if (_1641)
    {
        int _1671 = ~_1643;
        int _1673 = _1671 + 1;
        _1667 = _1673;
    }
    int _1675 = _1667;
    float _1677 = trunc(_1661);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    bool _1683 = uint(_1617) >= uint(_612);
    float _1685 = _1625 * _1589;
    if (!_1645)
    {
        int _1687 = ~_1637;
        int _1689 = _1687 + 1;
        _1669 = _1689;
    }
    int _1691 = _1669;
    bool _1693 = !_1683;
    int _1695 = _1693 ? 0 : (-1);
    float _1697 = fma(_1623, _1587, _1685);
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1701 = _1699 != 0;
    float _1703 = fma(_1627, _1591, _1697);
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1707 = _1705 != 0;
    float _1709 = _1625 * _1603;
    float _1711 = _1625 * _1447;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1717 = ~_596;
    int _1719 = _1717 + 1;
    float _1721 = fma(_1623, _1601, _1709);
    float _1723 = fma(_1623, _1445, _1711);
    float _1725 = 1.0 / _1715;
    int _1727 = _1719 * int(_1681);
    int _1729 = _1727 + _1067;
    float _1731 = float(uint(_1183));
    float _1733 = _550 * 2.0;
    int _1735 = ~_1585;
    int _1737 = _1735 + _1695;
    int _1739 = _1737 + 1;
    float _1741 = _1703 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1743 = float(uint(_1729));
    float _1745 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1747;
    int _1751 = ~_612;
    int _1753 = _1751 + 1;
    int _1755 = _612 * _1739;
    int _1757 = _1755 + _1373;
    float _1759 = as_type<float>(_694) * _1743;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_1665)
    {
        _1761 = 0;
    }
    int _1763 = _1761;
    float _1765 = _1749 * _1725;
    float _1767 = as_type<float>(_735) * _1731;
    float _1769 = trunc(_1759);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    int _1775 = _1763;
    if (!_1665)
    {
        _1775 = 1;
    }
    int _1777 = _1775;
    float _1779 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1781 = !_1701;
    int _1783 = _1781 ? 0 : 1;
    bool _1785 = !_1199;
    int _1787 = _1785 ? _1757 : (-1);
    float _1789 = -_1779;
    float _1791 = fma(_1745, 2.0, _1789);
    float _1793 = trunc(_1767);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    bool _1799 = _1777 != 1;
    float _1801 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1803 = _1777;
    if (_1665)
    {
        _1803 = 0;
    }
    int _1805 = _1803;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1809 = _1805;
    if (!_1665)
    {
        _1809 = 2;
    }
    int _1811 = _1809;
    int _1813 = _1787 & 3;
    bool _1815 = _1813 != 0;
    float _1817 = fma(_1801, -2.0, _1807);
    int _1819 = int(_1681) + int(_1773);
    float _1821 = _580 * 2.0;
    int _1823 = _1815 ? 0 : 1;
    bool _1825 = uint(_1813) >= 2u;
    bool _1827 = !_1707;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1753 * int(_1797);
    int _1833 = _1831 + _1183;
    bool _1835 = _1813 != 3;
    float _1837 = floor(_1821);
    int _1839 = _1825 ? 0 : 1;
    float _1841 = float(uint(_1833));
    bool _1843 = uint(_1813) > 1u;
    int _1845 = ~_596;
    int _1847 = _1845 + 1;
    float _1849 = as_type<float>(_735) * _1841;
    float _1851 = floor(_1733);
    int _1853 = ~_1839;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    int _1859 = _1847 * _1819;
    int _1861 = _1859 + _1067;
    int _1863 = _1857;
    float _1865 = as_type<float>(_1861);
    if (_1835)
    {
        int _1867 = ~_1839;
        int _1869 = _1867 + 1;
        _1863 = _1869;
    }
    int _1871 = _1863;
    int _1873 = ~_1823;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    float _1879 = trunc(_1849);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    bool _1885 = uint(_1861) >= uint(_596);
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1889 = _544 + _1887;
    int _1891 = _1877;
    if (!_1843)
    {
        int _1893 = ~_1823;
        int _1895 = _1893 + 1;
        _1891 = _1895;
    }
    int _1897 = _1891;
    bool _1899 = _1837 > 0.0;
    float _1901 = fma(_1765, _1889, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1903 = _1837;
    if (!_1799)
    {
        _1865 = _550;
    }
    float _1905 = _1865;
    bool _1907 = !_1885;
    int _1909 = _1907 ? 0 : (-1);
    bool _1911 = _1837 >= 0.0;
    bool _1913 = isnan(_1837);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(0.0);
    bool _1919 = _1915 || _1917;
    float _1921 = 0.0;
    float _1923 = _1905;
    if (!_1799)
    {
        _1921 = _1905;
    }
    float _1925 = _1921;
    float _1927 = _1925;
    if (!_1799)
    {
        _761 = _592;
    }
    float _1929 = _761;
    int _1931 = int(_1797) + int(_1883);
    float _1933 = _592 * 2.0;
    float _1935 = _1929;
    if (!_1799)
    {
        _1903 = _592;
    }
    float _1937 = _1903;
    bool _1939 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1941 = isnan(_544);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    int _1951 = _716 * _1931;
    int _1953 = _1951 + _1183;
    float _1955 = _1937;
    if (_1799)
    {
        _1927 = _580;
    }
    float _1957 = _1927;
    float _1959 = floor(_1933);
    if (_1799)
    {
        _1923 = _580;
    }
    float _1961 = _1923;
    float _1963 = -_1949;
    float _1965 = _1963 + 1.0;
    if (_1799)
    {
        _1935 = _550;
    }
    float _1967 = _1935;
    if (_1799)
    {
        _1955 = _550;
    }
    float _1969 = _1955;
    bool _1971 = _1851 > 0.0;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1975 = _1919 ? 0 : 1;
    bool _1977 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1979 = isnan(_544);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    int _1989 = ~_1549;
    int _1991 = _1989 + _1595;
    int _1993 = _1991 + 1;
    bool _1995 = _1851 >= 0.0;
    bool _1997 = isnan(_1851);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(0.0);
    bool _2003 = _1999 || _2001;
    float _2005 = _1987 * _1965;
    int _2007 = ~_1975;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    int _2013 = _584 * _1993;
    int _2015 = _2013 + _973;
    int _2017 = _2011;
    if (!_1899)
    {
        int _2019 = ~_1975;
        int _2021 = _2019 + 1;
        _2017 = _2021;
    }
    int _2023 = _2017;
    float _2025 = fma(_1627, _1605, _1721);
    bool _2027 = uint(_1953) >= uint(_612);
    float _2029 = _1901 * _2005;
    int _2031 = _2003 ? 0 : 1;
    float _2033 = -_1987;
    float _2035 = _2033 + 1.0;
    bool _2037 = !_2027;
    int _2039 = _2037 ? 0 : (-1);
    int _2041 = ~_2031;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    bool _2047 = !_1435;
    int _2049 = _2047 ? _2015 : (-1);
    float _2051 = fma(_1627, _1449, _1723);
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2055 = _2053 != 0;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2063 = _2061 != 0;
    float _2065 = fma(_2035, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2029);
    int _2067 = _2045;
    if (!_1971)
    {
        int _2069 = ~_2031;
        int _2071 = _2069 + 1;
        _2067 = _2071;
    }
    int _2073 = _2067;
    float _2075 = _550 + _592;
    bool _2077 = _1959 >= 0.0;
    bool _2079 = isnan(_1959);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2065);
    bool _2089 = !_2055;
    int _2091 = _2089 ? 0 : 1;
    float _2093 = _2075 + (-1.0);
    int _2095 = _2085 ? 0 : 1;
    float _2097 = _2087 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2099 = _1811 != 2;
    float _2101 = _2051 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2103 = _1959 > 0.0;
    float _2105 = _580 + _550;
    float _2107 = _2105 + (-1.0);
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2099)
    {
        _1467 = _580;
    }
    float _2115 = _1467;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2119 = _2115;
    if (!_2099)
    {
        _2119 = _592;
    }
    float _2121 = _2119;
    float _2123 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2125 = ~_2095;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _2129;
    if (!_2103)
    {
        int _2135 = ~_2095;
        int _2137 = _2135 + 1;
        _2133 = _2137;
    }
    int _2139 = _2133;
    float _2141 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2143 = _1481 >> 31;
    float _2145 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2147 = _1599 >> 31;
    float _2149 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2151 = -_2117;
    float _2153 = fma(_2141, 2.0, _2151);
    int _2155 = _2143 & 3;
    int _2157 = _2147 & 3;
    out.m_69.x = _2131;
    out.m_69.y = _2145;
    out.m_69.z = _2149;
    out.m_69.w = _2097;
    float _2159 = -_150;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2153);
    bool _2163 = !_1495;
    int _2165 = _2163 ? 0 : 1;
    int _2167 = _1599 + _2157;
    float _2169 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2171 = _1599 & 3;
    bool _2173 = _2171 != 0;
    int _2175 = _1787 >> 31;
    int _2177 = _2167 >> 2;
    bool _2179 = !_2173;
    int _2181 = _2179 ? 0 : 1;
    int _2183 = _1481 + _2155;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2187 = _1741 + _2185;
    int _2189 = _1787 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2195 = _2183 >> 2;
    int _2197 = _2175 & 3;
    float _2199 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2193);
    bool _2201 = !_2191;
    int _2203 = _2201 ? 0 : 1;
    float _2205 = _2025 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2207 = _2195 << 4;
    int _2209 = _2207 + 368;
    float _2211 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2199);
    bool _2213 = _1493 != 3;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2217 = _2205 + _2215;
    int _2219 = _1787 + _2197;
    uint _2221 = uint(int(uint(_2209) >> uint(2)));
    uint _2223 = uint(int(uint(int(_2221)) >> uint(2)));
    int _2225 = int(_2221) & 3;
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[int(_2223)][_2225];
    int _2229 = int(_2221) + 1;
    uint _2231 = uint(int(uint(_2229) >> uint(2)));
    int _2233 = _2229 & 3;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[int(_2231)][_2233];
    bool _2237 = !_2213;
    int _2239 = _2237 ? 0 : (-1);
    int _2241 = _2219 >> 2;
    bool _2243 = _1629 != 3;
    float _2245 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2247 = _2241 << 4;
    int _2249 = _2247 + 656;
    float _2251 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2245);
    bool _2253 = !_2243;
    int _2255 = _2253 ? 0 : (-1);
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2259 = _2177 << 4;
    int _2261 = _2259 + 512;
    uint _2263 = uint(int(uint(_2249) >> uint(2)));
    uint _2265 = uint(int(uint(int(_2263)) >> uint(2)));
    int _2267 = int(_2263) & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    int _2271 = int(_2263) + 1;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    int _2275 = _2271 & 3;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[int(_2273)][_2275];
    bool _2279 = _1813 != 3;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2283 = _2101 + _2281;
    int _2285 = abs(_2091);
    float _2287 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2257);
    float _2289 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2251);
    float _2291 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    uint _2293 = uint(int(uint(_2261) >> uint(2)));
    uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
    int _2297 = int(_2293) & 3;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[int(_2295)][_2297];
    int _2301 = int(_2293) + 1;
    uint _2303 = uint(int(uint(_2301) >> uint(2)));
    int _2305 = _2301 & 3;
    float _2307 = (*spvDescriptorSet0.vp_c9)._m0[int(_2303)][_2305];
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2311 = -_574;
    float _2313 = fma(_2291, 2.0, _2311);
    int _2315 = abs(_1545);
    float _2317 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2287);
    int _2319 = abs(_1897);
    float _2321 = fma(_1973, -2.0, _2309);
    int _2323 = _2209 + 8;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[int(_2335)][_2337];
    bool _2341 = !_2279;
    int _2343 = _2341 ? 0 : (-1);
    float _2345 = -_150;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2313);
    bool _2349 = _2289 >= 0.0;
    float _2351 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2321);
    int _2353 = ~_2315;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = ~_1819;
    int _2361 = _2359 + _1909;
    int _2363 = _2361 + 1;
    int _2365 = _2261 + 8;
    uint _2367 = uint(int(uint(_2365) >> uint(2)));
    uint _2369 = uint(int(uint(int(_2367)) >> uint(2)));
    int _2371 = int(_2367) & 3;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[int(_2369)][_2371];
    int _2375 = int(_2367) + 1;
    uint _2377 = uint(int(uint(_2375) >> uint(2)));
    int _2379 = _2375 & 3;
    float _2381 = (*spvDescriptorSet0.vp_c9)._m0[int(_2377)][_2379];
    float _2383 = float(_2139);
    float _2385 = float(_2285);
    int _2387 = _596 * _2363;
    int _2389 = _2387 + _1067;
    int _2391 = abs(_1691);
    float _2393 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2395 = int(_2393);
    int _2397 = abs(_2203);
    int _2399 = _2249 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    int _2417 = ~_2319;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    int _2423 = _2357 * as_type<int>(_2235);
    int _2425 = abs(_2165);
    float _2427 = _2385 * _2383;
    int _2429 = ~_1931;
    int _2431 = _2429 + _2039;
    int _2433 = _2431 + 1;
    float _2435 = _2187;
    if (_2349)
    {
        out.m_51.x = 0.0;
    }
    int _2437 = abs(_1613);
    int _2439 = ~_2425;
    int _2441 = _2439 + 1;
    int _2443 = _2441 + 1;
    int _2445 = _612 * _2433;
    int _2447 = _2445 + _1183;
    int _2449 = ~_2391;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    float _2455 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2457 = int(_2455);
    int _2459 = abs(_2181);
    int _2461 = _2443 * as_type<int>(_2227);
    int _2463 = _2461 + _2423;
    int _2465 = ~_2397;
    int _2467 = _2465 + 1;
    int _2469 = _2467 + 1;
    int _2471 = _2421 * as_type<int>(_2277);
    int _2473 = ~_2437;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = ~_2459;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    int _2485 = _2469 * as_type<int>(_2269);
    int _2487 = _2485 + _2471;
    int _2489 = abs(_1675);
    float _2491 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2493 = int(_2491);
    int _2495 = abs(_2255);
    int _2497 = _2453 * as_type<int>(_2307);
    int _2499 = ~_2489;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    int _2505 = abs(_1871);
    int _2507 = _2483 * as_type<int>(_2299);
    int _2509 = _2507 + _2497;
    int _2511 = ~_2495;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    float _2517 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2519 = log2(_2517);
    int _2521 = ~_2505;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    int _2527 = _2477 * as_type<int>(_2331);
    int _2529 = _2527 + _2463;
    int _2531 = abs(_2239);
    int _2533 = abs(_1635);
    int _2535 = ~_2531;
    int _2537 = _2535 + 1;
    int _2539 = _2537 + 1;
    float _2541 = float(uint(_2457));
    int _2543 = _2503 * as_type<int>(_2373);
    int _2545 = _2543 + _2509;
    int _2547 = abs(_1829);
    int _2549 = _2539 * as_type<int>(_2339);
    int _2551 = _2549 + _2529;
    int _2553 = abs(_2343);
    int _2555 = _2515 * as_type<int>(_2381);
    int _2557 = _2555 + _2545;
    int _2559 = abs(_1783);
    float _2561 = 1.0 / _2541;
    int _2563 = _2525 * as_type<int>(_2407);
    int _2565 = _2563 + _2487;
    float _2567 = float(uint(_2395));
    int _2569 = ~_2553;
    int _2571 = _2569 + 1;
    int _2573 = _2571 + 1;
    float _2575 = float(uint(_2493));
    float _2577 = 1.0 / _2567;
    int _2579 = ~_2559;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    int _2585 = _2573 * as_type<int>(_2415);
    int _2587 = _2585 + _2565;
    int _2589 = ~_2533;
    int _2591 = _2589 + 1;
    int _2593 = _2591 + 1;
    int _2595 = ~_2547;
    int _2597 = _2595 + 1;
    int _2599 = _2597 + 1;
    int _2601 = _2583 * _2557;
    bool _2603 = !_1205;
    int _2605 = _2603 ? _2389 : (-1);
    float _2607 = 1.0 / _2575;
    int _2609 = _2551 * _2593;
    bool _2611 = !_1199;
    int _2613 = _2611 ? _2447 : (-1);
    int _2615 = _2599 * _2587;
    int _2617 = as_type<int>(_2561) + (-2);
    int _2619 = _2049 * _2533;
    int _2621 = _2619 + _2609;
    float _2623 = _2519 * _150;
    int _2625 = _2605 * _2559;
    int _2627 = _2625 + _2601;
    int _2629 = as_type<int>(_2577) + (-2);
    int _2631 = _2613 * _2547;
    int _2633 = _2631 + _2615;
    bool _2635 = !_2059;
    int _2637 = _2635 ? 0 : 1;
    float _2639 = in.m_71.x;
    float _2641 = in.m_71.y;
    float _2643 = in.m_71.z;
    float _2645 = float(uint(_2621));
    float _2647 = float(uint(_2627));
    float _2649 = exp2(_2623);
    int _2651 = as_type<int>(_2607) + (-2);
    float _2653 = float(uint(_2633));
    float _2655 = as_type<float>(_2617) * _2647;
    int _2657 = abs(_2637);
    float _2659 = as_type<float>(_2629) * _2645;
    float _2661 = _2645;
    float _2663 = _2299;
    if (_2099)
    {
        _2661 = _550;
    }
    float _2665 = _2661;
    float _2667 = as_type<float>(_2651) * _2653;
    float _2669 = trunc(_2655);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = _2665;
    if (!_2099)
    {
        _2675 = _580;
    }
    float _2677 = _2675;
    float _2679 = float(_2023);
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2683 = float(_2657);
    float _2685 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2687 = as_type<int>(_2677);
    if (_2349)
    {
        _2663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2689 = _2663;
    float _2691 = trunc(_2667);
    float _2693 = precise::max(_2691, 0.0);
    uint _2695 = uint(_2693);
    int _2697 = abs(_2395);
    float _2699 = fma(_2685, -2.0, _2681);
    float _2701 = _2427 * (-2.0);
    if (_2349)
    {
        float _2703 = _2689 * 5.0;
        _2687 = as_type<int>(_2703);
    }
    int _2705 = _2687;
    int _2707 = abs(_2457);
    float _2709 = _2683 * _2679;
    float _2711 = fma(_2169, _2701, _2169);
    float _2713 = trunc(_2659);
    float _2715 = precise::max(_2713, 0.0);
    uint _2717 = uint(_2715);
    if (_2349)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8624 = as_type<float>(_2705);
        out.gl_Position.z = _8624;
    }
    int _2719 = ~_2457;
    int _2721 = _2719 + 1;
    float _2723 = fma(_2701, _2639, _2639);
    float _2725 = float(uint(_2697));
    float _2727 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2699);
    int _2729 = ~_2395;
    int _2731 = _2729 + 1;
    int _2733 = _2721 * int(_2673);
    int _2735 = _2733 + _2627;
    float _2737 = float(uint(_2707));
    float _2739 = _2709 * (-2.0);
    float _2741 = 1.0 / _2725;
    int _2743 = abs(_2621);
    int _2745 = ~_2493;
    int _2747 = _2745 + 1;
    float _2749 = fma(_2123, _2739, _2123);
    int _2751 = abs(_2493);
    int _2753 = _2731 * int(_2717);
    int _2755 = _2753 + _2621;
    float _2757 = float(uint(_2735));
    int _2759 = _2747 * int(_2695);
    int _2761 = _2759 + _2633;
    float _2763 = 1.0 / _2737;
    int _2765 = abs(_2627);
    float _2767 = float(uint(_2755));
    float _2769 = as_type<float>(_2617) * _2757;
    float _2771 = float(uint(_2761));
    float _2773 = as_type<float>(_2629) * _2767;
    float _2775 = _2217 * _2217;
    float _2777 = as_type<float>(_2651) * _2771;
    float _2779 = float(uint(_2751));
    float _2781 = fma(_2187, _2187, _2775);
    int _2783 = as_type<int>(_2741) + (-2);
    float _2785 = 1.0 / _2779;
    float _2787 = float(uint(_2743));
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2791 = abs(_2633);
    float _2793 = fma(_2283, _2283, _2781);
    int _2795 = as_type<int>(_2763) + (-2);
    float _2797 = as_type<float>(_2783) * _2787;
    float _2799 = float(uint(_2765));
    float _2801 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2789);
    float _2803 = rsqrt(_2793);
    float _2805 = as_type<float>(_2795) * _2799;
    float _2807 = float(uint(_2791));
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2811 = 1.0 + _2809;
    int _2813 = as_type<int>(_2785) + (-2);
    float _2815 = trunc(_2797);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2823 = as_type<float>(_2813) * _2807;
    int _2825 = ~_2697;
    int _2827 = _2825 + 1;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2831 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2833 = isnan(1.0);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2839 = _2835 || _2837;
    float _2841 = trunc(_2805);
    float _2843 = precise::max(_2841, 0.0);
    uint _2845 = uint(_2843);
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2849 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2829);
    float _2851 = -_150;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1791);
    bool _2855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    bool _2861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2863 = _2859 || _2861;
    float _2865 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2847);
    float _2867 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2821);
    float _2869 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1817);
    float _2871 = trunc(_2823);
    float _2873 = precise::max(_2871, 0.0);
    uint _2875 = uint(_2873);
    int _2877 = _2827 * int(_2819);
    int _2879 = _2877 + _2743;
    float _2881 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2849);
    float _2883 = -_2649;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2865);
    int _2889 = ~_2707;
    int _2891 = _2889 + 1;
    float _2893 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2801);
    int _2895 = ~_2751;
    int _2897 = _2895 + 1;
    float _2899 = 1.0 / _2811;
    float _2901 = float(uint(_2879));
    int _2903 = _2891 * int(_2845);
    int _2905 = _2903 + _2765;
    float _2907 = _2863 ? _2885 : 0.0;
    float _2909 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2867);
    float _2911 = as_type<float>(_2783) * _2901;
    float _2913 = trunc(_2769);
    float _2915 = precise::max(_2913, 0.0);
    uint _2917 = uint(_2915);
    int _2919 = _2897 * int(_2875);
    int _2921 = _2919 + _2791;
    float _2923 = float(uint(_2921));
    if (_2839)
    {
        float _2925 = _2907 * _2899;
        _152 = _2925;
    }
    float _2927 = _152;
    float _2929 = trunc(_2773);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = float(uint(_2905));
    float _2937 = _2217 * _2803;
    int _2939 = ~_2395;
    int _2941 = _2939 + 1;
    float _2943 = as_type<float>(_2795) * _2935;
    float _2945 = as_type<float>(_2813) * _2923;
    float _2947 = trunc(_2911);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = int(_2673) + int(_2917);
    float _2955 = _580 + (-0.5);
    int _2957 = ~_2457;
    int _2959 = _2957 + 1;
    float _2961 = -_2937;
    float _2963 = fma(_2961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2217);
    float _2965 = fma(_2955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2723);
    float _2967 = trunc(_2777);
    float _2969 = precise::max(_2967, 0.0);
    uint _2971 = uint(_2969);
    int _2973 = _2959 * _2953;
    int _2975 = _2973 + _2627;
    int _2977 = int(_2717) + int(_2933);
    float _2979 = _2963 * _2963;
    int _2981 = ~_2707;
    int _2983 = _2981 + 1;
    float _2985 = fma(_2711, _2927, _2965);
    bool _2987 = uint(_2975) >= uint(_2457);
    int _2989 = _2941 * _2977;
    int _2991 = _2989 + _2621;
    float _2993 = trunc(_2945);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    int _2999 = int(_2819) + int(_2951);
    float _3001 = _2187 * _2803;
    int _3003 = ~_2697;
    int _3005 = _3003 + 1;
    bool _3007 = uint(_2991) >= uint(_2395);
    float _3009 = -_3001;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2187);
    int _3013 = ~_2751;
    int _3015 = _3013 + 1;
    float _3017 = trunc(_2943);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    int _3023 = int(_2695) + int(_2971);
    int _3025 = _3005 * _2999;
    int _3027 = _3025 + _2743;
    int _3029 = ~_2493;
    int _3031 = _3029 + 1;
    float _3033 = fma(_3011, _3011, _2979);
    bool _3035 = !_2987;
    int _3037 = _3035 ? 0 : (-1);
    bool _3039 = uint(_3027) >= uint(_2697);
    int _3041 = _3031 * _3023;
    int _3043 = _3041 + _2633;
    int _3045 = int(_2875) + int(_2997);
    bool _3047 = !_3007;
    int _3049 = _3047 ? 0 : (-1);
    bool _3051 = uint(_3043) >= uint(_2493);
    int _3053 = _3015 * _3045;
    int _3055 = _3053 + _2791;
    float _3057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3059 = int(_2845) + int(_3021);
    int _3061 = ~_2977;
    int _3063 = _3061 + _3049;
    int _3065 = _3063 + 1;
    bool _3067 = uint(_3055) >= uint(_2751);
    int _3069 = _2983 * _3059;
    int _3071 = _3069 + _2765;
    int _3073 = ~_2953;
    int _3075 = _3073 + _3037;
    int _3077 = _3075 + 1;
    int _3079 = _2395 * _3065;
    int _3081 = _3079 + _2621;
    bool _3083 = !_3051;
    int _3085 = _3083 ? 0 : (-1);
    float _3087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3089 = _2395 == 0;
    int _3091 = _2457 * _3077;
    int _3093 = _3091 + _2627;
    bool _3095 = !_3039;
    int _3097 = _3095 ? 0 : (-1);
    bool _3099 = uint(_3071) >= uint(_2707);
    float _3101 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3103 = _2395 == 0;
    float _3105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3107 = _2621 ^ _2395;
    int _3109 = _2627 ^ _2457;
    int _3111 = ~_3023;
    int _3113 = _3111 + _3085;
    int _3115 = _3113 + 1;
    bool _3117 = !_3089;
    int _3119 = _3117 ? _3081 : (-1);
    float _3121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3123 = !_3099;
    float _3125 = _3123 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _3127 = _2457 == 0;
    bool _3129 = !_3067;
    int _3131 = _3129 ? 0 : (-1);
    float _3133 = float(_3119);
    float _3135 = _3105 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3137 = _2457 == 0;
    int _3139 = _2633 ^ _2493;
    int _3141 = _2493 * _3115;
    int _3143 = _3141 + _2633;
    bool _3145 = !_3127;
    int _3147 = _3145 ? _3093 : (-1);
    float _3149 = fma(_3101, _3133, _2853);
    bool _3151 = _2493 == 0;
    float _3153 = _3121 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3155 = _2493 == 0;
    float _3157 = fma(_3135, _815, -0.5);
    uint _3159 = uint(int(uint(_3107) >> uint(31)));
    float _3161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3163 = uint(int(uint(_3109) >> uint(31)));
    float _3165 = fma(_3153, _1487, -0.5);
    uint _3167 = uint(int(uint(_3139) >> uint(31)));
    int _3169 = ~_3097;
    int _3171 = _2999 + _3169;
    int _3173 = _3171 + 1;
    bool _3175 = !_3151;
    int _3177 = _3175 ? _3143 : (-1);
    int _3179 = ~int(_3159);
    int _3181 = _3179 + 1;
    int _3183 = ~_3131;
    int _3185 = _3045 + _3183;
    int _3187 = _3185 + 1;
    float _3189 = fma(_3101, _805, -0.5);
    int _3191 = ~as_type<int>(_3125);
    int _3193 = _3059 + _3191;
    int _3195 = _3193 + 1;
    float _3197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3199 = float(_3147);
    float _3201 = fma(_2887, _3189, _3149);
    int _3203 = ~int(_3163);
    int _3205 = _3203 + 1;
    int _3207 = ~int(_3167);
    int _3209 = _3207 + 1;
    float _3211 = fma(_3135, _3199, _2347);
    float _3213 = float(_3177);
    int _3215 = _3173 ^ _3181;
    float _3217 = fma(_2317, _3157, _3211);
    int _3219 = _3195 ^ _3205;
    float _3221 = fma(_3153, _3213, _2161);
    int _3223 = _3187 ^ _3209;
    int _3225 = ~_3181;
    int _3227 = _3225 + _3215;
    int _3229 = _3227 + 1;
    float _3231 = fma(_2893, _3165, _3221);
    int _3233 = ~_3205;
    int _3235 = _3233 + _3219;
    int _3237 = _3235 + 1;
    float _3239 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3241 = ~_3209;
    int _3243 = _3241 + _3223;
    int _3245 = _3243 + 1;
    float _3247 = _3197 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3249 = !_3103;
    int _3251 = _3249 ? _3229 : (-1);
    float _3253 = _3161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3255 = !_3137;
    int _3257 = _3255 ? _3237 : (-1);
    float _3259 = fma(_1185, _3239, -0.5);
    bool _3261 = !_3155;
    int _3263 = _3261 ? _3245 : (-1);
    float _3265 = fma(_1359, _3253, -0.5);
    float _3267 = float(_3251);
    float _3269 = fma(_3247, _1405, -0.5);
    float _3271 = float(_3257);
    float _3273 = _3231 + 0.5;
    float _3275 = float(_3263);
    float _3277 = -_2869;
    float _3279 = fma(_3239, _3267, _3277);
    float _3281 = _3201 + 0.5;
    float _3283 = -_2351;
    float _3285 = fma(_3253, _3271, _3283);
    float _3287 = _2283 * _2803;
    float _3289 = -_2727;
    float _3291 = fma(_3247, _3275, _3289);
    float _3293 = fma(_2881, _3259, _3279);
    float _3295 = fma(_2211, _3265, _3285);
    float _3297 = _3217 + 0.5;
    float _3299 = fma(_2909, _3269, _3291);
    float _3301 = _3293 + 0.5;
    float _3303 = _3295 + 0.5;
    float _3305 = -_3287;
    float _3307 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2283);
    float _3309 = _3299 + 0.5;
    float _3311 = fma(_2739, _2641, _2641);
    float _3313 = _550 + (-0.5);
    out.m_73.x = _3281;
    out.m_73.y = _3301;
    out.m_73.z = _3297;
    out.m_73.w = _3303;
    float _3315 = fma(_3307, _3307, _3033);
    bool _3317 = !_2063;
    int _3319 = _3317 ? 0 : 1;
    out.m_75.x = _3273;
    out.m_75.y = _3309;
    float _3321 = _3125;
    float _3323 = _2937;
    if (_2349)
    {
        return out;
    }
    float _3325 = -_2937;
    float _3327 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    int _3329 = abs(_3319);
    float _3331 = -_3001;
    float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _3335 = float(_2073);
    float _3337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3339 = _3327 + _3337;
    float _3341 = float(_3329);
    float _3343 = -_3287;
    float _3345 = fma(_3343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2101);
    float _3347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3349 = _3333 + _3347;
    float _3351 = _3339 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3353 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3311);
    float _3355 = _3341 * _3335;
    float _3357 = _580 + _592;
    float _3359 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3361 = _3345 + _3359;
    float _3363 = fma(_3349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3351);
    float _3365 = fma(_2749, _2927, _3353);
    float _3367 = _3357 + (-1.0);
    float _3369 = _3355 * (-2.0);
    float _3371 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3363);
    float _3373 = _3365 * 0.15915493667125701904296875;
    float _3375 = fma(_3367, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3377 = fma(_3369, _2643, _2643);
    float _3379 = _592 + (-0.5);
    bool _3381 = _3371 >= 0.0;
    float _3383 = fma(_3375, _3369, _3375);
    float _3385 = _2985 * 0.15915493667125701904296875;
    float _3387 = fma(_3379, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3377);
    float _3389 = _3373 * 6.283185482025146484375;
    float _3391 = sin(_3389);
    float _3393 = fma(_3383, _2927, _3387);
    float _3395 = _3393 * 0.15915493667125701904296875;
    float _3397 = _3385 * 6.283185482025146484375;
    float _3399 = sin(_3397);
    float _3401 = _3351;
    float _3403 = _3349;
    float _3405 = _3361;
    if (_3381)
    {
        _3401 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3407 = _3401;
    int _3409 = as_type<int>(_3407);
    if (_3381)
    {
        out.m_51.x = 0.0;
    }
    if (_3381)
    {
        float _3411 = _3407 * 5.0;
        _3409 = as_type<int>(_3411);
    }
    int _3413 = _3409;
    float _3415 = sqrt(_3315);
    if (_3381)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9674 = as_type<float>(_3413);
        out.gl_Position.z = _9674;
    }
    float _3417 = _3385 * 6.283185482025146484375;
    float _3419 = cos(_3417);
    float _3421 = _3399 * _3391;
    float _3423 = _3373 * 6.283185482025146484375;
    float _3425 = cos(_3423);
    float _3427 = _3395 * 6.283185482025146484375;
    float _3429 = sin(_3427);
    if (_3381)
    {
        return out;
    }
    float _3431 = -_2205;
    float _3433 = _3431 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3435 = -_1741;
    float _3437 = _3435 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3439 = in.m_77.x;
    float _3441 = in.m_77.y;
    float _3443 = in.m_77.z;
    float _3445 = -_2101;
    float _3447 = _3445 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3449 = _3433 * _3433;
    float _3451 = _3395 * 6.283185482025146484375;
    float _3453 = cos(_3451);
    float _3455 = _3419 * _3425;
    float _3457 = _2803 * _3415;
    float _3459 = fma(_3437, _3437, _3449);
    float _3461 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3463 = fma(_3429, _3455, _3421);
    float _3465 = fma(_3429, _3421, _3455);
    float _3467 = fma(_3447, _3447, _3459);
    float _3469 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3471 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3473 = _3399 * _3425;
    float _3475 = _3457 * _3469;
    float _3477 = rsqrt(_3467);
    float _3479 = _3419 * _3391;
    float _3481 = _3457 * _3471;
    float _3483 = _3419 * _3453;
    float _3485 = _3425 * _3453;
    float _3487 = _3399 * _3453;
    float _3489 = _3391 * _3453;
    float _3491 = -_3479;
    float _3493 = fma(_3429, _3473, _3491);
    float _3495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3439);
    float _3497 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3441);
    float _3499 = -_3473;
    float _3501 = fma(_3429, _3479, _3499);
    bool _3503 = _3441 != 0.0;
    bool _3505 = isnan(_3441);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _3495 * _3475;
    float _3515 = _3457 * _3461;
    float _3517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3443);
    float _3519 = _3497 * _3481;
    float _3521 = _3437 * _3477;
    float _3523 = _3447 * _3477;
    float _3525 = in.m_79.x;
    float _3527 = in.m_79.y;
    float _3529 = in.m_79.z;
    float _3531 = _3517 * _3515;
    float _3533 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3535 = _3521 * _3533;
    float _3537 = _3433 * _3477;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3541 = _3523 * _3539;
    bool _3543 = _3439 == 0.0;
    bool _3545 = !_3511;
    bool _3547 = _3543 && _3545;
    float _3549 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3551 = -_3535;
    float _3553 = fma(_3523, _3549, _3551);
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3557 = _3537 * _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3561 = -_3541;
    float _3563 = fma(_3537, _3559, _3561);
    bool _3565 = _3443 == 0.0;
    bool _3567 = _3565 && _3547;
    float _3569 = _3553 * _3553;
    float _3571 = in.m_81.x;
    float _3573 = in.m_81.y;
    float _3575 = in.m_81.z;
    float _3577 = in.m_81.w;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3581 = -_3557;
    float _3583 = fma(_3521, _3579, _3581);
    float _3585 = _3483 * _3519;
    float _3587 = fma(_3563, _3563, _3569);
    float _3589 = -_3519;
    float _3591 = _3429 * _3589;
    float _3593 = _3487 * _3519;
    float _3595 = fma(_3463, _3513, _3585);
    float _3597 = fma(_3583, _3583, _3587);
    float _3599 = fma(_3485, _3513, _3591);
    float _3601 = fma(_3493, _3513, _3593);
    float _3603 = fma(_3501, _3531, _3595);
    float _3605 = fma(_3489, _3531, _3599);
    float _3607 = rsqrt(_3597);
    float _3609 = _3585;
    float _3611 = _3587;
    float _3613 = _3513;
    if (_3567)
    {
        _3321 = _3527;
    }
    float _3615 = _3321;
    float _3617 = _3615;
    if (_3567)
    {
        _2435 = _3525;
    }
    float _3619 = _2435;
    float _3621 = _3619;
    if (_3567)
    {
        _3609 = _3615;
    }
    float _3623 = _3609;
    float _3625 = _3623;
    if (_3567)
    {
        _3611 = _3619;
    }
    float _3627 = _3611;
    float _3629 = _3627;
    if (!_3567)
    {
        _3617 = _3527;
    }
    float _3631 = _3617;
    float _3633 = fma(_3465, _3531, _3601);
    if (!_3567)
    {
        _3621 = _3525;
    }
    float _3635 = _3621;
    if (_3567)
    {
        _3613 = _3529;
    }
    float _3637 = _3613;
    float _3639 = _3637;
    if (!_3567)
    {
        float _3641 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3631);
        _3625 = _3641;
    }
    float _3643 = _3625;
    if (!_3567)
    {
        float _3645 = fma(_3443, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3529);
        _3639 = _3645;
    }
    float _3647 = _3639;
    float _3649 = _3575 * _3635;
    float _3651 = _3563 * _3607;
    float _3653 = _3553 * _3607;
    if (!_3567)
    {
        float _3655 = fma(_3439, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3635);
        _3629 = _3655;
    }
    float _3657 = _3629;
    float _3659 = -_3649;
    float _3661 = fma(_3571, _3529, _3659);
    float _3663 = _3573 * _3529;
    float _3665 = _3583 * _3607;
    float _3667 = _3523 * _3653;
    float _3669 = _3537 * _3651;
    float _3671 = _3571 * _3631;
    float _3673 = -_3663;
    float _3675 = fma(_3575, _3631, _3673);
    float _3677 = -_3667;
    float _3679 = fma(_3537, _3665, _3677);
    float _3681 = -_3669;
    float _3683 = fma(_3521, _3653, _3681);
    float _3685 = -_3671;
    float _3687 = fma(_3573, _3635, _3685);
    float _3689 = _3661 * _3577;
    float _3691 = _3675 * _3577;
    float _3693 = _3679 * _3603;
    float _3695 = _3683 * _3603;
    float _3697 = _3521 * _3665;
    float _3699 = _3687 * _3577;
    float _3701 = fma(_3651, _3605, _3693);
    float _3703 = fma(_3665, _3605, _3695);
    float _3705 = -_3697;
    float _3707 = fma(_3523, _3651, _3705);
    float _3709 = _3463 * _3679;
    float _3711 = fma(_3521, _3633, _3701);
    float _3713 = fma(_3523, _3633, _3703);
    float _3715 = _3463 * _3707;
    float _3717 = _3463 * _3683;
    float _3719 = _1741 + _3711;
    float _3721 = _2101 + _3713;
    float _3723 = _3483 * _3679;
    float _3725 = _3501 * _3679;
    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3729 = _3719 + _3727;
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3733 = _3721 + _3731;
    float _3735 = _3483 * _3707;
    float _3737 = _3483 * _3683;
    float _3739 = _3729 * _3729;
    float _3741 = _3733 * _3733;
    float _3743 = _3501 * _3707;
    float _3745 = _3707 * _3603;
    float _3747 = fma(_3485, _3651, _3709);
    float _3749 = _3739 + _3741;
    float _3751 = fma(_3485, _3653, _3715);
    float _3753 = fma(_3485, _3665, _3717);
    float _3755 = _3501 * _3683;
    float _3757 = sqrt(_3749);
    float _3759 = -_3429;
    float _3761 = fma(_3759, _3651, _3723);
    float _3763 = fma(_3489, _3651, _3725);
    float _3765 = -_3429;
    float _3767 = fma(_3765, _3653, _3735);
    float _3769 = fma(_3489, _3653, _3743);
    float _3771 = fma(_3653, _3605, _3745);
    float _3773 = -_3429;
    float _3775 = fma(_3773, _3665, _3737);
    float _3777 = fma(_3489, _3665, _3755);
    float _3779 = fma(_3487, _3521, _3761);
    float _3781 = fma(_3537, _3633, _3771);
    float _3783 = fma(_3487, _3537, _3767);
    float _3785 = fma(_3487, _3523, _3775);
    float _3787 = fma(_3493, _3537, _3751);
    float _3789 = _2205 + _3781;
    float _3791 = fma(_3493, _3521, _3747);
    float _3793 = fma(_3465, _3521, _3763);
    bool _3795 = _3757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3797 = fma(_3465, _3523, _3777);
    float _3799 = fma(_3493, _3523, _3753);
    float _3801 = fma(_3465, _3537, _3769);
    float _3803 = _3779 * _3573;
    float _3805 = _3783 * _3573;
    float _3807 = _3785 * _3573;
    float _3809 = _3779 * _3643;
    float _3811 = _3689 * _3779;
    float _3813 = _3783 * _3643;
    float _3815 = _3785 * _3643;
    float _3817 = _3689 * _3783;
    float _3819 = _3689 * _3785;
    float _3821 = _3779;
    float _3823 = _3781;
    float _3825 = _3739;
    float _3827 = _3741;
    float _3829 = _3719;
    float _3831 = _3757;
    float _3833 = _3699;
    if (!_3795)
    {
        _3821 = _3721;
    }
    float _3835 = _3821;
    float _3837 = _3835;
    if (!_3795)
    {
        _3823 = _3789;
    }
    float _3839 = _3823;
    bool _3841 = !_3795;
    float _3843 = _3839;
    if (!_3841)
    {
        float _3845 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3849 = _3757 + _3847;
        float _3851 = _3789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3853 = rsqrt(_3749);
        float _3855 = _3849 * _3845;
        float _3857 = _3855 * 0.15915493667125701904296875;
        float _3859 = _3857 * 6.283185482025146484375;
        float _3861 = sin(_3859);
        float _3863 = _3857 * 6.283185482025146484375;
        float _3865 = cos(_3863);
        float _3867 = fma(_3861, _3851, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3869 = _3853 * _3867;
        float _3871 = _3865 + (-1.0);
        float _3873 = fma(_3729, _3869, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3875 = fma(_3733, _3869, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3877 = _3871 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3881 = _3873 + _3879;
        float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3885 = _3875 + _3883;
        float _3887 = fma(_3789, _3865, _3877);
        float _3889 = _3881 * _3881;
        float _3891 = _3885 * _3885;
        _3843 = _3887;
        _3825 = _3889;
        _3827 = _3891;
        _3829 = _3873;
        _3837 = _3875;
        _3831 = _3857;
    }
    float _3893 = _3843;
    float _3895 = _3825;
    float _3897 = _3827;
    float _3899 = _3829;
    float _3901 = _3837;
    float _3903 = _3831;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3907 = _3893 + _3905;
    float _3909 = fma(_3791, _3571, _3803);
    float _3911 = fma(_3787, _3571, _3805);
    float _3913 = fma(_3691, _3787, _3817);
    float _3915 = fma(_3907, _3907, _3895);
    float _3917 = fma(_3799, _3571, _3807);
    float _3919 = fma(_3791, _3657, _3809);
    float _3921 = fma(_3691, _3791, _3811);
    float _3923 = _3915 + _3897;
    float _3925 = fma(_3787, _3657, _3813);
    float _3927 = fma(_3799, _3657, _3815);
    float _3929 = fma(_3691, _3799, _3819);
    float _3931 = fma(_3793, _3575, _3909);
    float _3933 = fma(_3801, _3575, _3911);
    float _3935 = sqrt(_3923);
    float _3937 = fma(_3699, _3801, _3913);
    float _3939 = fma(_3797, _3575, _3917);
    float _3941 = fma(_3793, _3647, _3919);
    float _3943 = fma(_3699, _3793, _3921);
    float _3945 = fma(_3801, _3647, _3925);
    float _3947 = fma(_3699, _3797, _3929);
    float _3949 = fma(_3797, _3647, _3927);
    out.m_83.x = _3931;
    out.m_83.y = _3933;
    out.m_83.z = _3939;
    out.m_85.x = _3943;
    out.m_85.y = _3937;
    out.m_85.z = _3947;
    out.m_87.x = _3941;
    out.m_87.y = _3945;
    out.m_87.z = _3949;
    bool _3951 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3953 = isnan(_3935);
    bool _3955 = _3951 || _3953;
    bool _3957 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3959 = _3955 || _3957;
    float _3961 = _3903;
    if (!_3959)
    {
        _3833 = 1.0;
    }
    float _3963 = _3833;
    bool _3965 = !_3959;
    float _3967 = _3963;
    if (!_3965)
    {
        bool _3969 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3971 = isnan(_3935);
        bool _3973 = _3969 || _3971;
        bool _3975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3977 = _3973 || _3975;
        if (!_3977)
        {
            float _3979 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3981 = _3935 + _3979;
            float _3983 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3985 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3983;
            float _3987 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3989 = _3987 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3991 = 1.0 / _3985;
            float _3993 = _3981 * _3991;
            float _3995 = fma(_3993, _3989, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3967 = _3995;
            _3997 = true;
        }
        else
        {
            bool _3999 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4001 = isnan(_3935);
            bool _4003 = _3999 || _4001;
            bool _4005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4007 = _4003 || _4005;
            if (!_4007)
            {
                float _4009 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4011 = _3935 + _4009;
                float _4013 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4015 = _4013 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4017 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4019 = _4017 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4021 = 1.0 / _4015;
                float _4023 = _4011 * _4021;
                float _4025 = fma(_4023, _4019, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3967 = _4025;
                _3997 = true;
            }
            else
            {
                _3967 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3997 = false;
    float _4027 = _3967;
    float _4029 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4031 = _3899 + _4029;
    float _4033 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4035 = _3893 + _4033;
    float _4037 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4039 = _3901 + _4037;
    bool _4041 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4043 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4045 = _4041 || _4043;
    bool _4047 = isnan(0.5);
    bool _4049 = _4045 || _4047;
    float _4051 = fma(_4031, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4053 = fma(_4035, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4055 = fma(_4039, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4057 = -_3001;
    float _4059 = fma(_4057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4051);
    float _4061 = -_2937;
    float _4063 = fma(_4061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4053);
    float _4065 = -_3287;
    float _4067 = fma(_4065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4055);
    float _4069 = _4063;
    float _4071 = _4059;
    float _4073 = _4067;
    if (!_4049)
    {
        float _4075 = _3339 * _3339;
        float _4077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4079 = -_2101;
        float _4081 = _4079 + _4055;
        float _4083 = -_1741;
        float _4085 = _4083 + _4051;
        float _4087 = fma(_3349, _3349, _4075);
        float _4089 = fma(_3361, _3361, _4087);
        float _4091 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4093 = sqrt(_4089);
        float _4095 = 1.0 / _3457;
        float _4097 = _4091 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4099 = precise::min(_4093, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4101 = _4099 * _4077;
        float _4103 = _4101 * _4095;
        float _4105 = -_2205;
        float _4107 = _4105 + _4053;
        float _4109 = _4097 * _4103;
        float _4111 = _4081 * _4103;
        float _4113 = fma(_4085, _4109, _3333);
        float _4115 = fma(_4107, _4109, _3327);
        float _4117 = fma(_4097, _4111, _3345);
        _4069 = _4115;
        _4071 = _4113;
        _4073 = _4117;
        _3403 = _4093;
    }
    float _4119 = _4069;
    float _4121 = _4071;
    float _4123 = _4073;
    float _4125 = _3403;
    float _4127 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4129 = _4119 + _4127;
    float _4131 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4133 = _4121 + _4131;
    float _4135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4137 = _4123 + _4135;
    float _4139 = _4129 * _4129;
    float _4141 = fma(_4133, _4133, _4139);
    float _4143 = fma(_4137, _4137, _4141);
    float _4145 = rsqrt(_4143);
    float _4147 = sqrt(_4143);
    float _4149 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4151 = _4133 * _4149;
    float _4153 = _4137 * _4149;
    float _4155 = _4151 * _4151;
    float _4157 = _4153 * _4153;
    float _4159 = _4155 + _4157;
    float _4161 = sqrt(_4159);
    bool _4163 = _4161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4167 = _4161 + _4165;
    float _4169 = _4145;
    float _4171 = _4167;
    float _4173 = _4125;
    float _4175 = _4129;
    if (_4163)
    {
        float _4177 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4169 = _4177;
    }
    float _4179 = _4169;
    if (_4163)
    {
        float _4181 = rsqrt(_4159);
        _3323 = _4181;
    }
    float _4183 = _3323;
    float _4185 = _4183;
    if (_4163)
    {
        float _4187 = _4167 * _4179;
        _4171 = _4187;
    }
    float _4189 = _4171;
    if (_4163)
    {
        float _4191 = _4189 * 0.15915493667125701904296875;
        _4173 = _4191;
    }
    float _4193 = _4173;
    float _4195 = _4179;
    float _4197 = _4193;
    if (_4163)
    {
        float _4199 = _4193 * 6.283185482025146484375;
        float _4201 = sin(_4199);
        _4195 = _4201;
    }
    float _4203 = _4195;
    float _4205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4207 = precise::max(0.0, _4205);
    float _4209 = _4137;
    float _4211 = _4207;
    if (_4163)
    {
        float _4213 = _4193 * 6.283185482025146484375;
        float _4215 = cos(_4213);
        _4209 = _4215;
    }
    float _4217 = _4209;
    float _4219 = -_4149;
    float _4221 = -_4207;
    float _4223 = fma(_4129, _4219, _4221);
    if (!_4163)
    {
        _4175 = _4153;
    }
    float _4225 = _4175;
    float _4227 = _4225;
    if (_4163)
    {
        float _4229 = _4223 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4211 = _4229;
    }
    float _4231 = _4211;
    float _4233 = _4203;
    float _4235 = _4231;
    if (_4163)
    {
        float _4237 = fma(_4203, _4231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3405 = _4237;
    }
    float _4239 = _3405;
    float _4241 = _4239;
    if (!_4163)
    {
        _4233 = _4151;
    }
    float _4243 = _4233;
    float _4245 = _4243;
    if (_4163)
    {
        float _4247 = _4217 + (-1.0);
        _4235 = _4247;
    }
    float _4249 = _4235;
    float _4251 = _4249;
    if (_4163)
    {
        float _4253 = _4183 * _4239;
        _3961 = _4253;
    }
    float _4255 = _3961;
    if (!_4163)
    {
        _4241 = _4223;
    }
    float _4257 = _4241;
    float _4259 = _4257;
    if (_4163)
    {
        float _4261 = _4249 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4197 = _4261;
    }
    float _4263 = _4197;
    if (_4163)
    {
        float _4265 = _4151 * _4255;
        _4245 = _4265;
    }
    float _4267 = _4245;
    if (!_4163)
    {
        _4185 = _4155;
    }
    float _4269 = _4185;
    float _4271 = _4269;
    if (_4163)
    {
        float _4273 = _4153 * _4255;
        _4227 = _4273;
    }
    float _4275 = _4227;
    if (_4163)
    {
        float _4277 = fma(_4223, _4217, _4263);
        _4259 = _4277;
    }
    float _4279 = _4259;
    if (_4163)
    {
        float _4281 = _4267 * _4267;
        _4271 = _4281;
    }
    float _4283 = _4271;
    if (!_4163)
    {
        _4251 = _4157;
    }
    float _4285 = _4251;
    float _4287 = _4285;
    if (_4163)
    {
        float _4289 = _4275 * _4275;
        _4287 = _4289;
    }
    float _4291 = _4287;
    float _4293 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4295 = fma(_4279, _4279, _4283);
    float _4297 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4299 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4301 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4293);
    float _4303 = _4295 + _4291;
    float _4305 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4307 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4299);
    float _4309 = rsqrt(_4303);
    float _4311 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4305);
    float _4313 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4307);
    float _4315 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4301);
    float _4317 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4319 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4311);
    float _4321 = _4313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4323 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4325 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4323);
    float _4327 = precise::clamp(_4325, 0.0, 1.0);
    float _4329 = _4315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4331 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4333 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4335 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4317);
    float _4337 = -_4327;
    float _4339 = _4337 + 1.0;
    float _4341 = floor(_4297);
    float _4343 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4333);
    float _4345 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4335);
    float _4347 = _4309 * _4279;
    float _4349 = _4309 * _4275;
    float _4351 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4343);
    float _4353 = _4309 * _4267;
    float _4355 = _4345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4357 = abs(_4339);
    float _4359 = log2(_4357);
    float _4361 = fma(_3345, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4363 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4365 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4351);
    float _4367 = -_4363;
    float _4369 = fma(_4347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4367);
    float _4371 = floor(_4361);
    float _4373 = -_4341;
    float _4375 = _4297 + _4373;
    float _4377 = -_4349;
    float _4379 = fma(_4377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4369);
    float _4381 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4383 = fma(_4379, -0.5, 0.5);
    float _4385 = fma(_4379, 0.5, 0.5);
    float _4387 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4389 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4391 = 1.0 / _4365;
    float _4393 = -_4381;
    float _4395 = fma(_4393, _4387, 1.0);
    float _4397 = fma(_4385, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4399 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4401 = fma(_4385, _4397, -0.212114393711090087890625);
    float _4403 = exp2(_4389);
    float _4405 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4399);
    float _4407 = fma(_4385, _4401, 1.570728778839111328125);
    float _4409 = log2(_4395);
    float _4411 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4413 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4411);
    float _4415 = sqrt(_4383);
    float _4417 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4413);
    float _4419 = _4347 + 1.0;
    float _4421 = -_4347;
    float _4423 = fma(_4403, _4419, _4421);
    float _4425 = _4409 * 0.693147182464599609375;
    float _4427 = -_4371;
    float _4429 = _4361 + _4427;
    float _4431 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4405);
    float _4433 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4417);
    float _4435 = fma(_4423, 0.5, 0.5);
    float _4437 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4431);
    float _4439 = _4433 * _4391;
    float2 _11348 = float2(_4375, _4429);
    float _4441 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11348, float2(0.0), isnan(_11348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11348, float2(0.0), isnan(_11348)), level(0.0)).x;
    float _4443 = _4415 * 0.636619746685028076171875;
    float _4445 = _4437 * _4391;
    float _4447 = fma(_4439, -0.5, 0.5);
    float _4449 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4451 = -_4407;
    float _4453 = fma(_4443, _4451, 1.0);
    float _4455 = fma(_4445, 0.5, 0.5);
    float3 _11378 = float3(_4455, _4447, _4449);
    float _4457 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11378, float3(0.0), isnan(_11378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11378, float3(0.0), isnan(_11378)), level(0.0)).x;
    float3 _11389 = float3(_4455, _4447, _4449);
    float4 _4460 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11389, float3(0.0), isnan(_11389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11389, float3(0.0), isnan(_11389)), level(0.0)).xyzw;
    float _4462 = _4460.x;
    float _4464 = _4460.y;
    float _4466 = _4460.z;
    float _4468 = _4460.w;
    float2 _11405 = float2(_4453, _4435);
    float3 _4472 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11405, float2(0.0), isnan(_11405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11405, float2(0.0), isnan(_11405)), level(0.0)).xyz;
    float _4474 = _4472.x;
    float _4476 = _4472.y;
    float _4478 = _4472.z;
    float _4480 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4482 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4484 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4486 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4488 = isnan(_4147);
    bool _4490 = _4486 || _4488;
    bool _4492 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4494 = _4490 || _4492;
    float _4496 = fma(_3333, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4480);
    float _4498 = fma(_3333, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4482);
    float _4500 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4484);
    float _4502 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4504 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4496);
    float _4506 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4498);
    float _4508 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4500);
    float _4510 = _4504 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4512 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4514 = exp2(_4502);
    float _4516 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4508);
    float _4518 = _4512 + _4510;
    float _4520 = 1.0 / _4510;
    float _4522 = -_4514;
    float _4524 = _4522 + 1.0;
    float _4526 = _4524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4528 = _4518 * _4520;
    float _4530 = _4528 * 0.5;
    float _4532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4534 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4532);
    float _4536 = 1.0 / _4534;
    float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4540 = _4536 * _4538;
    float _4542 = _4516 + _4365;
    float _4544 = abs(_4540);
    float _4546 = log2(_4544);
    bool _4548 = _4540 <= 8000.0;
    bool _4550 = isnan(_4540);
    bool _4552 = _4548 || _4550;
    bool _4554 = isnan(8000.0);
    bool _4556 = _4552 || _4554;
    float _4558 = float(_4556);
    float _4560 = _4546 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4562 = exp2(_4560);
    float _4564 = fma(_4562, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4566 = precise::clamp(_4564, 0.0, 1.0);
    float _4568 = _4542 * 0.5;
    float _4570 = fma(_4566, -2.0, 3.0);
    float _4572 = _4566 * _4566;
    out.m_89.z = _4568;
    out.m_89.w = _4365;
    float _4574 = _4572 * _4570;
    float _4576 = in.m_91.x;
    float _4578 = -_4574;
    float _4580 = _4578 + 1.0;
    float _4582 = fma(_4580, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4574);
    float _4584 = _4558 * _4582;
    out.gl_Position.x = _4437;
    out.gl_Position.y = _4433;
    out.gl_Position.z = _4516;
    out.gl_Position.w = _4365;
    float _4586 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4588 = _4433;
    float _4590 = _4437;
    if (!_4494)
    {
        _4588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4592 = _4588;
    float _4594 = _4592;
    float _4596 = _4592;
    if (!_4494)
    {
        _4590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4598 = _4590;
    float _4600 = -_4441;
    float _4602 = _4600 + 1.0;
    float _4604 = _4602 * _4586;
    float _4606 = precise::clamp(_4604, 0.0, 1.0);
    float _4608 = -_4606;
    float _4610 = fma(_4608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4612 = _4526 * _4457;
    float _4614 = -_4526;
    float _4616 = _4614 + 1.0;
    float _4618 = _4610 * _4576;
    float _4620 = _4468 * _4612;
    float _4622 = _4478 * _4612;
    float _4624 = _4468 * _4616;
    float _4626 = _4618 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4628 = fma(_4474, _4620, _4462);
    float _4630 = fma(_4476, _4620, _4464);
    float _4632 = fma(_4468, _4622, _4466);
    float _4634 = _4622;
    float _4636 = _4598;
    float _4638 = _4598;
    if (!_4494)
    {
        _4634 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4640 = _4634;
    out.m_93.x = _4626;
    out.m_95.x = _4628;
    out.m_95.y = _4630;
    out.m_95.z = _4632;
    out.m_95.w = _4624;
    bool _4642 = !_4494;
    float _4644 = _4640;
    float _4646 = _4640;
    if (!_4642)
    {
        bool _4648 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4650 = isnan(_4147);
        bool _4652 = _4648 || _4650;
        bool _4654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4656 = _4652 || _4654;
        if (!_4656)
        {
            float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4660 = _4147 + _4658;
            float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4664 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4662;
            float _4666 = 1.0 / _4664;
            float _4668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4670 = _4668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4672 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4674 = _4672 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4676 = _4660 * _4666;
            float _4678 = precise::clamp(_4676, 0.0, 1.0);
            float _4680 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4682 = _4680 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4684 = fma(_4678, _4674, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4686 = fma(_4678, _4682, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4688 = fma(_4678, _4670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4638 = _4688;
            _4596 = _4686;
            _4646 = _4684;
            _4690 = true;
        }
        else
        {
            bool _4692 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4694 = isnan(_4147);
            bool _4696 = _4692 || _4694;
            bool _4698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4700 = _4696 || _4698;
            if (!_4700)
            {
                _4594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4702 = _4594;
            _4596 = _4702;
            if (!_4700)
            {
                _4636 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4704 = _4636;
            _4638 = _4704;
            if (!_4700)
            {
                _4644 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4706 = _4644;
            bool _4708 = !_4700;
            _4646 = _4706;
            if (!_4708)
            {
                bool _4710 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4712 = isnan(_4147);
                bool _4714 = _4710 || _4712;
                bool _4716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4718 = _4714 || _4716;
                if (!_4718)
                {
                    float _4720 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4722 = _4147 + _4720;
                    float _4724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4726 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4724;
                    float _4728 = 1.0 / _4726;
                    float _4730 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4732 = _4730 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4736 = _4734 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4738 = _4722 * _4728;
                    float _4740 = precise::clamp(_4738, 0.0, 1.0);
                    float _4742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4744 = _4742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4746 = fma(_4740, _4736, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4748 = fma(_4740, _4744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4750 = fma(_4740, _4732, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4638 = _4750;
                    _4596 = _4748;
                    _4646 = _4746;
                    _4690 = true;
                }
                else
                {
                    _4638 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4646 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4690 = false;
    float _4752 = _4638;
    float _4754 = _4596;
    float _4756 = _4646;
    float _4758 = _4752 * 0.586610972881317138671875;
    bool _4760 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4762 = fma(_4754, 0.298911988735198974609375, _4758);
    out.m_97.x = 0.0;
    float _4764 = fma(_4756, 0.114477999508380889892578125, _4762);
    float _4766 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4768 = -_4764;
    float _4770 = _4768 + _4754;
    float _4772 = -_4764;
    float _4774 = _4772 + _4752;
    float _4776 = -_4764;
    float _4778 = _4776 + _4756;
    out.m_93.w = _4766;
    float _4780 = fma(_4770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    float _4782 = fma(_4774, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    float _4784 = fma(_4778, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    out.m_99.x = _4780;
    out.m_99.y = _4782;
    out.m_99.z = _4784;
    if (!_4760)
    {
        return out;
    }
    float _4786 = -_4119;
    float _4788 = _4786 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4790 = -_4121;
    float _4792 = _4790 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4794 = -_4123;
    float _4796 = _4794 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4798 = _4788 * _4788;
    float _4800 = fma(_4792, _4792, _4798);
    float _4802 = fma(_4796, _4796, _4800);
    float _4804 = sqrt(_4802);
    float _4806 = rsqrt(_4802);
    float _4808 = -_4804;
    float _4810 = _4808 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4812 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4814 = precise::clamp(_4812, 0.0, 1.0);
    float _4816 = _4792 * _4806;
    float _4818 = _4788 * _4806;
    float _4820 = abs(_4814);
    float _4822 = log2(_4820);
    float _4824 = _4796 * _4806;
    float _4826 = _4816 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4828 = _3945 * _4818;
    float _4830 = -_4818;
    float _4832 = -_4826;
    float _4834 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4832);
    float _4836 = fma(_3941, _4816, _4828);
    float _4838 = -_4824;
    float _4840 = fma(_4838, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4834);
    float _4842 = fma(_3949, _4824, _4836);
    float _4844 = precise::clamp(_4842, 0.0, 1.0);
    float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4848 = _4840 + _4846;
    float _4850 = _4822 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4852 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4854 = precise::clamp(_4852, 0.0, 1.0);
    float _4856 = exp2(_4850);
    float _4858 = _4856 * _4854;
    float _4860 = _4844 * _4858;
    float _4862 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4864 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4866 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4862;
    out.m_97.y = _4864;
    out.m_97.z = _4866;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4690 = false;
    bool _3997 = false;
    bool _536 = false;
    bool _418 = false;
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
    float _128 = _126;
    if (!_122)
    {
        out.m_51.x = 0.0;
    }
    int _130 = 0;
    if (!_122)
    {
        float _132 = _126 * 5.0;
        _130 = as_type<int>(_132);
    }
    int _134 = _130;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4922 = as_type<float>(_134);
        out.gl_Position.z = _4922;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_53.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = _150;
    if (_146)
    {
        float _154 = float(_118);
        _128 = _154;
    }
    float _156 = _128;
    bool _158 = _150 >= _156;
    bool _160 = !_146;
    bool _162 = _158 || _160;
    float _164 = _156;
    if (_162)
    {
        _164 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _166 = _164;
    if (_162)
    {
        out.m_51.x = 0.0;
    }
    int _168 = 0;
    if (_162)
    {
        float _170 = _166 * 5.0;
        _168 = as_type<int>(_170);
    }
    int _172 = _168;
    if (_162)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4992 = as_type<float>(_172);
        out.gl_Position.z = _4992;
    }
    if (_162)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _208 = _204 + _206;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _212 = _204 + _210;
    bool _214 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _216 = isnan(_204);
    bool _218 = _214 || _216;
    bool _220 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _222 = _218 || _220;
    float _224 = float(_222);
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _226;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _232 = _204 + _230;
    float _234 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _236 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _234;
    float _238 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _240 = _238 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _242 = 1.0 / _228;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _236;
    float _248 = 1.0 / _240;
    float _250 = _208 * _242;
    bool _252 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _254 = isnan(_204);
    bool _256 = _252 || _254;
    bool _258 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _260 = _256 || _258;
    float _262 = float(_260);
    float _264 = -_224;
    float _266 = _264 + 1.0;
    float _268 = _262 * _266;
    float _270 = _212 * _246;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _276;
    bool _280 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _282 = isnan(_204);
    bool _284 = _280 || _282;
    bool _286 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _288 = _284 || _286;
    float _290 = float(_288);
    float _292 = -_262;
    float _294 = _292 + 1.0;
    float _296 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _298 = fma(_278, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _302 = _300 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _304 = _232 * _248;
    bool _306 = _204 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _308 = isnan(_204);
    bool _310 = _306 || _308;
    bool _312 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _314 = _310 || _312;
    float _316 = float(_314);
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _320 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _318;
    float _322 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _324 = _322 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _326 = fma(_302, _304, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _328 = fma(_320, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _330 = -_316;
    float _332 = _330 + 1.0;
    float _334 = _316 * _294;
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _340 = fma(_324, _304, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = _290 * _332;
    float _344 = -_290;
    float _346 = _344 + 1.0;
    float _348 = fma(_338, _304, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = _296 * _342;
    float _352 = _298 * _342;
    float _354 = _328 * _342;
    float _356 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _358 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _360 = fma(_346, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _362 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _364 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _362;
    float _366 = fma(_340, _334, _356);
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _368;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _372;
    float _376 = fma(_364, _250, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _378 = fma(_348, _334, _358);
    float _380 = fma(_370, _250, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _382 = fma(_374, _250, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _384 = fma(_326, _334, _360);
    float _386 = fma(_376, _268, _366);
    float _388 = fma(_380, _268, _378);
    float _390 = fma(_382, _268, _384);
    float _392 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_224, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    bool _398 = !_244;
    float _416;
    if (!_398)
    {
        float _400 = in.m_55.x;
        float _402 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _404 = _400 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _406 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _408 = _406 * _402;
        float _410 = floor(_408);
        float _412 = -_410;
        float _414 = _408 + _412;
        _416 = _414;
        _418 = true;
    }
    else
    {
        float _420 = float(_118);
        float _422 = 1.0 / _420;
        float _424 = _150 * _422;
        _416 = _424;
    }
    _418 = false;
    float _426 = _416;
    float _428 = in.m_57.x;
    float _430 = in.m_57.y;
    float _432 = in.m_57.z;
    bool _434 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _436 = isnan(_426);
    bool _438 = _434 || _436;
    bool _440 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _442 = _438 || _440;
    float _444 = float(_442);
    float _446 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _448 = _446 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _450 = _426 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _452 = isnan(_426);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _462;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _468 = _426 + _466;
    float _470 = -_444;
    float _472 = _470 + 1.0;
    bool _474 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _476 = 1.0 / _448;
    float _478 = _460 * _472;
    float _480 = -_460;
    float _482 = _480 + 1.0;
    float _484 = _464 * _476;
    float _486 = fma(_484, _468, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _488 = _486 * _478;
    float _490 = fma(_482, (*spvDescriptorSet0.vp_c9)._m0[115].x, _488);
    float _492 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _494 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = fma(_444, (*spvDescriptorSet0.vp_c9)._m0[116].x, _490);
    float _500 = _492 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _502 = _494 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _504 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _506 = _498 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _508 = _396 * _432;
    float _510 = _394 * _430;
    float _512 = _392 * _428;
    out.m_59.x = _500;
    out.m_59.y = _502;
    out.m_59.z = _504;
    out.m_59.w = _506;
    bool _514 = !_474;
    float _516 = _430;
    float _534;
    if (!_514)
    {
        float _518 = in.m_55.x;
        float _520 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _522 = _518 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _524 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _526 = _524 * _520;
        float _528 = floor(_526);
        float _530 = -_528;
        float _532 = _526 + _530;
        _534 = _532;
        _536 = true;
    }
    else
    {
        float _538 = float(_118);
        float _540 = 1.0 / _538;
        float _542 = _150 * _540;
        _534 = _542;
    }
    _536 = false;
    float _544 = _534;
    float _546 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _548 = int(_546);
    float _550 = in.m_55.y;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _558 = _556 != 0;
    float _560 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _562 = int(_560);
    int _564 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _566 = _564 != 0;
    float _568 = float(_548);
    float _570 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _572 = int(_570);
    float _574 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _576 = float(_562);
    float _578 = 1.0 / _568;
    float _580 = in.m_55.x;
    float _582 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _584 = int(_582);
    float _586 = float(_572);
    float _588 = 1.0 / _576;
    float _590 = _578 * _150;
    float _592 = in.m_55.z;
    float _594 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _596 = int(_594);
    float _598 = float(uint(_584));
    float _600 = _586;
    float _602 = _588;
    bool _604 = _554;
    if (_554)
    {
        _516 = _580;
    }
    float _606 = _516;
    float _608 = 1.0 / _586;
    float _610 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _612 = int(_610);
    float _614 = float(uint(_596));
    float _616 = _606;
    float _618 = _608;
    if (_554)
    {
        _600 = 1.0;
    }
    float _620 = _600;
    float _622 = _620;
    if (!_554)
    {
        _622 = 1.2345600128173828125;
    }
    float _624 = _622;
    if (!_554)
    {
        _616 = _592;
    }
    float _626 = _616;
    float _628 = 1.0 / _598;
    int _630 = ~_596;
    int _632 = _630 + 1;
    bool _634 = _592 > 0.5;
    float _636 = trunc(_590);
    int _638 = int(_636);
    float _640 = _588 * _150;
    if (_554)
    {
        _602 = 1.0;
    }
    float _642 = _602;
    float _644 = _642;
    if (!_554)
    {
        _644 = 7.345489978790283203125;
    }
    float _646 = _644;
    float _648 = float(uint(_612));
    float _650 = 1.0 / _614;
    float _652 = _646 * _580;
    int _654 = as_type<int>(_628) + (-2);
    int _656 = ~_612;
    int _658 = _656 + 1;
    int _660 = ~_612;
    int _662 = _660 + 1;
    float _664 = float(uint(_638));
    float _666 = _608 * _150;
    float _668 = _664;
    int _670 = as_type<int>(_652);
    float _672 = as_type<float>(_654);
    if (_554)
    {
        _618 = _580;
    }
    float _674 = _618;
    float _676 = trunc(_640);
    int _678 = int(_676);
    float _680 = _674;
    if (!_554)
    {
        _680 = _550;
    }
    float _682 = _680;
    float _684 = as_type<float>(_654) * _664;
    if (_554)
    {
        _668 = 1.0;
    }
    float _686 = _668;
    float _688 = _686;
    if (!_554)
    {
        _688 = 5.839270114898681640625;
    }
    float _690 = _688;
    float _692 = _682 * _624;
    int _694 = as_type<int>(_650) + (-2);
    float _696 = 1.0 / _648;
    float _698 = in.m_61.x;
    float _700 = _626 * _690;
    int _702 = ~_584;
    int _704 = _702 + 1;
    float _706 = _698;
    int _708 = _704;
    if (_558)
    {
        bool _710 = _580 > 0.5;
        _604 = _710;
    }
    bool _712 = _604;
    int _714 = ~_612;
    int _716 = _714 + 1;
    float _718 = trunc(_684);
    float _720 = precise::max(_718, 0.0);
    uint _723 = uint(_720);
    float _725 = in.m_55.w;
    float _727 = float(uint(_678));
    float _729 = trunc(_666);
    int _731 = int(_729);
    float _733 = as_type<float>(_694) * _727;
    int _735 = as_type<int>(_696) + (-2);
    int _737 = _704 * int(_723);
    int _739 = _737 + _638;
    float _741 = trunc(_733);
    float _743 = precise::max(_741, 0.0);
    uint _745 = uint(_743);
    float _747 = float(uint(_739));
    float _749 = float(uint(_731));
    float _751 = floor(_652);
    bool _753 = _725 > 0.5;
    float _755 = as_type<float>(_654) * _747;
    float _757 = _725;
    float _759 = as_type<float>(_739);
    float _761 = as_type<float>(_735);
    if (!_558)
    {
        _757 = _698;
    }
    float _763 = _757;
    float _765 = as_type<float>(_735) * _749;
    float _767 = _763;
    if (!_558)
    {
        _759 = _763;
    }
    float _769 = _759;
    float _771 = trunc(_755);
    float _773 = precise::max(_771, 0.0);
    uint _775 = uint(_773);
    float _777 = _769;
    if (_558)
    {
        _767 = _698;
    }
    float _779 = _767;
    if (!_566)
    {
        _706 = _779;
    }
    float _781 = _706;
    float _783 = _781;
    if (_558)
    {
        float _785 = -_779;
        float _787 = _785 + 1.0;
        _708 = as_type<int>(_787);
    }
    int _789 = _708;
    float _791 = floor(_692);
    float _793 = -_751;
    float _795 = _652 + _793;
    if (_566)
    {
        float _797 = -_779;
        float _799 = _797 + 1.0;
        _670 = as_type<int>(_799);
    }
    int _801 = _670;
    if (_558)
    {
        float _803 = _712 ? as_type<float>(_789) : _779;
        _777 = _803;
    }
    float _805 = _777;
    int _807 = _632 * int(_745);
    int _809 = _807 + _678;
    float _811 = float(_118);
    if (_566)
    {
        float _813 = _634 ? as_type<float>(_801) : _779;
        _783 = _813;
    }
    float _815 = _783;
    float _817 = trunc(_765);
    float _819 = precise::max(_817, 0.0);
    uint _821 = uint(_819);
    float _823 = float(uint(_809));
    int _825 = int(_723) + int(_775);
    float _827 = float(_638);
    float _829 = as_type<float>(_694) * _823;
    float _831 = float(_584);
    float _833 = floor(_700);
    float _835 = -_791;
    float _837 = _692 + _835;
    int _839 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _841 = _839 != 0;
    bool _843 = _827 >= _831;
    bool _845 = isnan(_827);
    bool _847 = _843 || _845;
    bool _849 = isnan(_831);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = _795 * _831;
    float _857 = _831 * _150;
    int _859 = _658 * int(_821);
    int _861 = _859 + _731;
    float _863 = trunc(_829);
    float _865 = precise::max(_863, 0.0);
    uint _867 = uint(_865);
    float _869 = float(uint(_861));
    float _871 = float(_596);
    float _873 = -_833;
    float _875 = _700 + _873;
    int _877 = ~_584;
    int _879 = _877 + 1;
    float _881 = as_type<float>(_735) * _869;
    float _883 = 1.0 / _811;
    float _885 = _871 * _837;
    float _887 = float(_612);
    float _889 = float(_678);
    int _891 = _879 * _825;
    int _893 = _891 + _638;
    float _895 = trunc(_881);
    float _897 = precise::max(_895, 0.0);
    uint _899 = uint(_897);
    float _901 = float(_731);
    bool _903 = !_841;
    int _905 = _903 ? 0 : 1;
    bool _907 = uint(_893) >= uint(_584);
    bool _909 = _901 >= _887;
    bool _911 = isnan(_901);
    bool _913 = _909 || _911;
    bool _915 = isnan(_887);
    bool _917 = _913 || _915;
    float _919 = float(_917);
    float _921 = trunc(_855);
    int _923 = int(_921);
    int _925 = int(_745) + int(_867);
    float _927 = _883 * _150;
    int _929 = ~_596;
    int _931 = _929 + 1;
    float _933 = _857 * _883;
    int _935 = abs(_905);
    float _937 = _871 * _927;
    float _939 = trunc(_853);
    int _941 = int(_939);
    bool _943 = !_907;
    int _945 = _943 ? 0 : (-1);
    int _947 = _931 * _925;
    int _949 = _947 + _678;
    int _951 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _953 = _951 != 0;
    int _955 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _957 = _955 != 0;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _961 = _959 != 0;
    int _963 = ~_825;
    int _965 = _963 + _945;
    int _967 = _965 + 1;
    bool _969 = uint(_949) >= uint(_596);
    int _971 = _923 * _935;
    int _973 = _971 + _638;
    int _975 = int(_821) + int(_899);
    float _977 = in.m_61.y;
    int _979 = ~_612;
    int _981 = _979 + 1;
    int _983 = _584 * _967;
    int _985 = _983 + _638;
    bool _987 = !_969;
    int _989 = _987 ? 0 : (-1);
    float _991 = trunc(_933);
    int _993 = int(_991);
    bool _995 = _584 == 0;
    int _997 = _981 * _975;
    int _999 = _997 + _731;
    int _1001 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1003 = _1001 != 0;
    bool _1005 = _889 >= _871;
    bool _1007 = isnan(_889);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(_871);
    bool _1013 = _1009 || _1011;
    float _1015 = float(_1013);
    float _1017 = _887 * _927;
    float _1019 = _887 * _875;
    int _1021 = ~_941;
    int _1023 = _1021 + 1;
    int _1025 = _1023 + 1;
    float _1027 = trunc(_885);
    int _1029 = int(_1027);
    bool _1031 = !_995;
    int _1033 = _1031 ? _985 : (-1);
    bool _1035 = !_1003;
    int _1037 = _1035 ? 0 : 1;
    bool _1039 = uint(_999) >= uint(_612);
    bool _1041 = !_957;
    int _1043 = _1041 ? 0 : 1;
    float _1045 = trunc(_919);
    int _1047 = int(_1045);
    int _1049 = ~_925;
    int _1051 = _1049 + _989;
    int _1053 = _1051 + 1;
    int _1055 = _1033 * _1025;
    int _1057 = abs(_1037);
    bool _1059 = !_1039;
    int _1061 = _1059 ? 0 : (-1);
    int _1063 = _584 + (-1);
    int _1065 = _1029 * _1057;
    int _1067 = _1065 + _678;
    int _1069 = abs(_1043);
    float _1071 = trunc(_1019);
    int _1073 = int(_1071);
    int _1075 = ~_975;
    int _1077 = _1075 + _1061;
    int _1079 = _1077 + 1;
    int _1081 = _941 * _1063;
    int _1083 = _1081 + _1055;
    bool _1085 = !_953;
    int _1087 = _1085 ? 0 : 1;
    int _1089 = _596 * _1053;
    int _1091 = _1089 + _678;
    int _1093 = _612 * _1079;
    int _1095 = _1093 + _731;
    int _1097 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1099 = _1097 != 0;
    int _1101 = abs(_1087);
    int _1103 = _1083 * _1069;
    float _1105 = -_977;
    float _1107 = _1105 + 1.0;
    bool _1109 = !_1099;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1115 = _1113 != 0;
    int _1117 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1119 = _1117 != 0;
    int _1121 = _993 * _1101;
    int _1123 = _1121 + _1103;
    int _1125 = _753 ? as_type<int>(_1107) : as_type<int>(_977);
    float _1127 = trunc(_1015);
    int _1129 = int(_1127);
    bool _1131 = !_961;
    int _1133 = _1131 ? 0 : 1;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1137 = _1135 != 0;
    int _1139 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1141 = _1139 != 0;
    bool _1143 = !_1119;
    int _1145 = _1143 ? 0 : 1;
    bool _1147 = _550 > 0.5;
    bool _1149 = !_1137;
    int _1151 = _1149 ? 0 : 1;
    int _1153 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1155 = _1153 != 0;
    int _1157 = abs(_1133);
    bool _1159 = !_1155;
    int _1161 = _1159 ? 0 : 1;
    int _1163 = abs(_1111);
    int _1165 = _973 * _1157;
    int _1167 = _1165 + _1123;
    bool _1169 = !_1115;
    int _1171 = _1169 ? 0 : 1;
    int _1173 = abs(_1161);
    int _1175 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1177 = _1175 != 0;
    int _1179 = _1147 ? as_type<int>(_1107) : as_type<int>(_977);
    int _1181 = _1073 * _1173;
    int _1183 = _1181 + _731;
    float _1185 = _1177 ? as_type<float>(_1179) : _977;
    int _1187 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1189 = _1187 != 0;
    int _1191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1193 = _1191 != 0;
    int _1195 = _923 * _1163;
    int _1197 = _1195 + _1167;
    bool _1199 = _612 == 0;
    float _1201 = trunc(_937);
    int _1203 = int(_1201);
    bool _1205 = _596 == 0;
    int _1207 = ~_1047;
    int _1209 = _1207 + 1;
    int _1211 = _1209 + 1;
    bool _1213 = !_1199;
    int _1215 = _1213 ? _1095 : (-1);
    float _1217 = float(uint(_1197));
    int _1219 = ~_1129;
    int _1221 = _1219 + 1;
    int _1223 = _1221 + 1;
    int _1225 = _1211 * _1215;
    bool _1227 = !_1205;
    int _1229 = _1227 ? _1091 : (-1);
    float _1231 = as_type<float>(_654) * _1217;
    bool _1233 = !_1193;
    int _1235 = _1233 ? 0 : 1;
    int _1237 = abs(_1145);
    int _1239 = _1223 * _1229;
    int _1241 = _596 + (-1);
    float _1243 = trunc(_1231);
    float _1245 = precise::max(_1243, 0.0);
    uint _1247 = uint(_1245);
    int _1249 = abs(_1171);
    int _1251 = abs(_1235);
    int _1253 = _1129 * _1241;
    int _1255 = _1253 + _1239;
    int _1257 = _612 + (-1);
    bool _1259 = !_1141;
    int _1261 = _1259 ? 0 : 1;
    int _1263 = _1255 * _1237;
    int _1265 = abs(_1151);
    int _1267 = _1047 * _1257;
    int _1269 = _1267 + _1225;
    int _1271 = ~_584;
    int _1273 = _1271 + 1;
    int _1275 = _1203 * _1249;
    int _1277 = _1275 + _1263;
    int _1279 = abs(_1261);
    float _1281 = trunc(_1017);
    int _1283 = int(_1281);
    int _1285 = _1067 * _1265;
    int _1287 = _1285 + _1277;
    int _1289 = _1273 * int(_1247);
    int _1291 = _1289 + _1197;
    bool _1293 = !_1189;
    int _1295 = _1293 ? 0 : 1;
    int _1297 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1299 = _1297 != 0;
    int _1301 = _1029 * _1279;
    int _1303 = _1301 + _1287;
    float _1305 = float(uint(_1291));
    int _1307 = abs(_1295);
    bool _1309 = !_1299;
    int _1311 = _1309 ? 0 : 1;
    float _1313 = as_type<float>(_654) * _1305;
    float _1315 = float(uint(_1303));
    float _1317 = trunc(_1313);
    float _1319 = precise::max(_1317, 0.0);
    uint _1321 = uint(_1319);
    int _1323 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1325 = _1323 != 0;
    int _1327 = abs(_1311);
    float _1329 = as_type<float>(_694) * _1315;
    int _1331 = _1269 * _1251;
    bool _1333 = !_1325;
    int _1335 = _1333 ? 0 : 1;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1339 = _1337 != 0;
    int _1341 = _1283 * _1307;
    int _1343 = _1341 + _1331;
    int _1345 = abs(_1335);
    float _1347 = trunc(_1329);
    float _1349 = precise::max(_1347, 0.0);
    uint _1351 = uint(_1349);
    float _1353 = float(uint(_973));
    int _1355 = _1183 * _1327;
    int _1357 = _1355 + _1343;
    float _1359 = _1339 ? as_type<float>(_1125) : _977;
    int _1361 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1363 = _1361 != 0;
    float _1365 = as_type<float>(_654) * _1353;
    int _1367 = ~_584;
    int _1369 = _1367 + 1;
    int _1371 = _1073 * _1345;
    int _1373 = _1371 + _1357;
    int _1375 = int(_1247) + int(_1321);
    int _1377 = ~_596;
    int _1379 = _1377 + 1;
    float _1381 = trunc(_1365);
    float _1383 = precise::max(_1381, 0.0);
    uint _1385 = uint(_1383);
    bool _1387 = _592 > 0.5;
    int _1389 = _1369 * _1375;
    int _1391 = _1389 + _1197;
    float _1393 = float(uint(_1373));
    int _1395 = ~_584;
    int _1397 = _1395 + 1;
    float _1399 = _977;
    int _1401 = _1197;
    if (_1363)
    {
        float _1403 = _1387 ? _1107 : _977;
        _1399 = _1403;
    }
    float _1405 = _1399;
    int _1407 = _1379 * int(_1351);
    int _1409 = _1407 + _1303;
    bool _1411 = uint(_1391) >= uint(_584);
    float _1413 = as_type<float>(_735) * _1393;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1417 = _1415 != 0;
    float _1419 = float(uint(_1409));
    float _1421 = trunc(_1413);
    float _1423 = precise::max(_1421, 0.0);
    uint _1425 = uint(_1423);
    bool _1427 = !_1411;
    int _1429 = _1427 ? 0 : (-1);
    int _1431 = _1397 * int(_1385);
    int _1433 = _1431 + _973;
    bool _1435 = _584 == 0;
    float _1437 = as_type<float>(_694) * _1419;
    int _1439 = ~_1375;
    int _1441 = _1439 + _1429;
    int _1443 = _1441 + 1;
    float _1445 = in.m_63.x;
    float _1447 = in.m_63.y;
    float _1449 = in.m_63.z;
    float _1451 = float(uint(_1433));
    int _1453 = ~_612;
    int _1455 = _1453 + 1;
    float _1457 = trunc(_1437);
    float _1459 = precise::max(_1457, 0.0);
    uint _1461 = uint(_1459);
    int _1463 = _584 * _1443;
    int _1465 = _1463 + _1197;
    float _1467 = _1449;
    if (_1417)
    {
        float _1469 = -_779;
        float _1471 = _1469 + 1.0;
        _1401 = as_type<int>(_1471);
    }
    int _1473 = _1401;
    float _1475 = as_type<float>(_654) * _1451;
    if (!_1417)
    {
        _672 = _779;
    }
    float _1477 = _672;
    bool _1479 = !_1435;
    int _1481 = _1479 ? _1465 : (-1);
    float _1483 = _1477;
    if (_1417)
    {
        float _1485 = _1147 ? as_type<float>(_1473) : _779;
        _1483 = _1485;
    }
    float _1487 = _1483;
    int _1489 = _1455 * int(_1425);
    int _1491 = _1489 + _1373;
    int _1493 = _1481 & 3;
    bool _1495 = _1493 != 0;
    float _1497 = trunc(_1475);
    float _1499 = precise::max(_1497, 0.0);
    uint _1501 = uint(_1499);
    int _1503 = _1481 & 3;
    bool _1505 = _1503 != 0;
    bool _1507 = uint(_1493) > 1u;
    int _1509 = int(_1351) + int(_1461);
    float _1511 = float(uint(_1491));
    int _1513 = ~_596;
    int _1515 = _1513 + 1;
    int _1517 = _1505 ? 0 : 1;
    float _1519 = as_type<float>(_735) * _1511;
    bool _1521 = uint(_1493) >= 2u;
    int _1523 = _1515 * _1509;
    int _1525 = _1523 + _1303;
    int _1527 = ~_1517;
    int _1529 = _1527 + 1;
    int _1531 = _1529 + 1;
    float _1533 = trunc(_1519);
    float _1535 = precise::max(_1533, 0.0);
    uint _1537 = uint(_1535);
    int _1539 = _1531;
    if (!_1507)
    {
        int _1541 = ~_1517;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    bool _1547 = uint(_1525) >= uint(_596);
    int _1549 = int(_1385) + int(_1501);
    bool _1551 = !_1547;
    int _1553 = _1551 ? 0 : (-1);
    int _1555 = ~_584;
    int _1557 = _1555 + 1;
    int _1559 = _1521 ? 0 : 1;
    bool _1561 = _1493 != 3;
    int _1563 = _1557 * _1549;
    int _1565 = _1563 + _973;
    int _1567 = ~_1509;
    int _1569 = _1567 + _1553;
    int _1571 = _1569 + 1;
    int _1573 = ~_1559;
    int _1575 = _1573 + 1;
    int _1577 = _1575 + 1;
    bool _1579 = uint(_1565) >= uint(_584);
    int _1581 = _596 * _1571;
    int _1583 = _1581 + _1303;
    int _1585 = int(_1425) + int(_1537);
    float _1587 = in.m_65.x;
    float _1589 = in.m_65.y;
    float _1591 = in.m_65.z;
    bool _1593 = !_1579;
    int _1595 = _1593 ? 0 : (-1);
    bool _1597 = !_1205;
    int _1599 = _1597 ? _1583 : (-1);
    float _1601 = in.m_67.x;
    float _1603 = in.m_67.y;
    float _1605 = in.m_67.z;
    int _1607 = _1577;
    if (_1561)
    {
        int _1609 = ~_1559;
        int _1611 = _1609 + 1;
        _1607 = _1611;
    }
    int _1613 = _1607;
    int _1615 = _662 * _1585;
    int _1617 = _1615 + _1373;
    int _1619 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1621 = _1619 != 0;
    float _1623 = in.m_48.x;
    float _1625 = in.m_48.y;
    float _1627 = in.m_48.z;
    int _1629 = _1599 & 3;
    bool _1631 = _1629 != 0;
    bool _1633 = !_1621;
    int _1635 = _1633 ? 0 : 1;
    int _1637 = _1631 ? 0 : 1;
    bool _1639 = uint(_1629) >= 2u;
    bool _1641 = _1629 != 3;
    int _1643 = _1639 ? 0 : 1;
    bool _1645 = uint(_1629) > 1u;
    float _1647 = float(uint(_1067));
    int _1649 = ~_1643;
    int _1651 = _1649 + 1;
    int _1653 = _1651 + 1;
    int _1655 = ~_1637;
    int _1657 = _1655 + 1;
    int _1659 = _1657 + 1;
    float _1661 = as_type<float>(_694) * _1647;
    int _1663 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1665 = _1663 != 0;
    int _1667 = _1653;
    int _1669 = _1659;
    if (_1641)
    {
        int _1671 = ~_1643;
        int _1673 = _1671 + 1;
        _1667 = _1673;
    }
    int _1675 = _1667;
    float _1677 = trunc(_1661);
    float _1679 = precise::max(_1677, 0.0);
    uint _1681 = uint(_1679);
    bool _1683 = uint(_1617) >= uint(_612);
    float _1685 = _1625 * _1589;
    if (!_1645)
    {
        int _1687 = ~_1637;
        int _1689 = _1687 + 1;
        _1669 = _1689;
    }
    int _1691 = _1669;
    bool _1693 = !_1683;
    int _1695 = _1693 ? 0 : (-1);
    float _1697 = fma(_1623, _1587, _1685);
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1701 = _1699 != 0;
    float _1703 = fma(_1627, _1591, _1697);
    int _1705 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1707 = _1705 != 0;
    float _1709 = _1625 * _1603;
    float _1711 = _1625 * _1447;
    float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1715 = _1713 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1717 = ~_596;
    int _1719 = _1717 + 1;
    float _1721 = fma(_1623, _1601, _1709);
    float _1723 = fma(_1623, _1445, _1711);
    float _1725 = 1.0 / _1715;
    int _1727 = _1719 * int(_1681);
    int _1729 = _1727 + _1067;
    float _1731 = float(uint(_1183));
    float _1733 = _550 * 2.0;
    int _1735 = ~_1585;
    int _1737 = _1735 + _1695;
    int _1739 = _1737 + 1;
    float _1741 = _1703 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1743 = float(uint(_1729));
    float _1745 = _580 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1747 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1749 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1747;
    int _1751 = ~_612;
    int _1753 = _1751 + 1;
    int _1755 = _612 * _1739;
    int _1757 = _1755 + _1373;
    float _1759 = as_type<float>(_694) * _1743;
    int _1761 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[132].x);
    if (_1665)
    {
        _1761 = 0;
    }
    int _1763 = _1761;
    float _1765 = _1749 * _1725;
    float _1767 = as_type<float>(_735) * _1731;
    float _1769 = trunc(_1759);
    float _1771 = precise::max(_1769, 0.0);
    uint _1773 = uint(_1771);
    int _1775 = _1763;
    if (!_1665)
    {
        _1775 = 1;
    }
    int _1777 = _1775;
    float _1779 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1781 = !_1701;
    int _1783 = _1781 ? 0 : 1;
    bool _1785 = !_1199;
    int _1787 = _1785 ? _1757 : (-1);
    float _1789 = -_1779;
    float _1791 = fma(_1745, 2.0, _1789);
    float _1793 = trunc(_1767);
    float _1795 = precise::max(_1793, 0.0);
    uint _1797 = uint(_1795);
    bool _1799 = _1777 != 1;
    float _1801 = _550 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1803 = _1777;
    if (_1665)
    {
        _1803 = 0;
    }
    int _1805 = _1803;
    float _1807 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1809 = _1805;
    if (!_1665)
    {
        _1809 = 2;
    }
    int _1811 = _1809;
    int _1813 = _1787 & 3;
    bool _1815 = _1813 != 0;
    float _1817 = fma(_1801, -2.0, _1807);
    int _1819 = int(_1681) + int(_1773);
    float _1821 = _580 * 2.0;
    int _1823 = _1815 ? 0 : 1;
    bool _1825 = uint(_1813) >= 2u;
    bool _1827 = !_1707;
    int _1829 = _1827 ? 0 : 1;
    int _1831 = _1753 * int(_1797);
    int _1833 = _1831 + _1183;
    bool _1835 = _1813 != 3;
    float _1837 = floor(_1821);
    int _1839 = _1825 ? 0 : 1;
    float _1841 = float(uint(_1833));
    bool _1843 = uint(_1813) > 1u;
    int _1845 = ~_596;
    int _1847 = _1845 + 1;
    float _1849 = as_type<float>(_735) * _1841;
    float _1851 = floor(_1733);
    int _1853 = ~_1839;
    int _1855 = _1853 + 1;
    int _1857 = _1855 + 1;
    int _1859 = _1847 * _1819;
    int _1861 = _1859 + _1067;
    int _1863 = _1857;
    float _1865 = as_type<float>(_1861);
    if (_1835)
    {
        int _1867 = ~_1839;
        int _1869 = _1867 + 1;
        _1863 = _1869;
    }
    int _1871 = _1863;
    int _1873 = ~_1823;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    float _1879 = trunc(_1849);
    float _1881 = precise::max(_1879, 0.0);
    uint _1883 = uint(_1881);
    bool _1885 = uint(_1861) >= uint(_596);
    float _1887 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1889 = _544 + _1887;
    int _1891 = _1877;
    if (!_1843)
    {
        int _1893 = ~_1823;
        int _1895 = _1893 + 1;
        _1891 = _1895;
    }
    int _1897 = _1891;
    bool _1899 = _1837 > 0.0;
    float _1901 = fma(_1765, _1889, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1903 = _1837;
    if (!_1799)
    {
        _1865 = _550;
    }
    float _1905 = _1865;
    bool _1907 = !_1885;
    int _1909 = _1907 ? 0 : (-1);
    bool _1911 = _1837 >= 0.0;
    bool _1913 = isnan(_1837);
    bool _1915 = _1911 || _1913;
    bool _1917 = isnan(0.0);
    bool _1919 = _1915 || _1917;
    float _1921 = 0.0;
    float _1923 = _1905;
    if (!_1799)
    {
        _1921 = _1905;
    }
    float _1925 = _1921;
    float _1927 = _1925;
    if (!_1799)
    {
        _761 = _592;
    }
    float _1929 = _761;
    int _1931 = int(_1797) + int(_1883);
    float _1933 = _592 * 2.0;
    float _1935 = _1929;
    if (!_1799)
    {
        _1903 = _592;
    }
    float _1937 = _1903;
    bool _1939 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1941 = isnan(_544);
    bool _1943 = _1939 || _1941;
    bool _1945 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1947 = _1943 || _1945;
    float _1949 = float(_1947);
    int _1951 = _716 * _1931;
    int _1953 = _1951 + _1183;
    float _1955 = _1937;
    if (_1799)
    {
        _1927 = _580;
    }
    float _1957 = _1927;
    float _1959 = floor(_1933);
    if (_1799)
    {
        _1923 = _580;
    }
    float _1961 = _1923;
    float _1963 = -_1949;
    float _1965 = _1963 + 1.0;
    if (_1799)
    {
        _1935 = _550;
    }
    float _1967 = _1935;
    if (_1799)
    {
        _1955 = _550;
    }
    float _1969 = _1955;
    bool _1971 = _1851 > 0.0;
    float _1973 = _1967 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _1975 = _1919 ? 0 : 1;
    bool _1977 = _544 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1979 = isnan(_544);
    bool _1981 = _1977 || _1979;
    bool _1983 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1985 = _1981 || _1983;
    float _1987 = float(_1985);
    int _1989 = ~_1549;
    int _1991 = _1989 + _1595;
    int _1993 = _1991 + 1;
    bool _1995 = _1851 >= 0.0;
    bool _1997 = isnan(_1851);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan(0.0);
    bool _2003 = _1999 || _2001;
    float _2005 = _1987 * _1965;
    int _2007 = ~_1975;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    int _2013 = _584 * _1993;
    int _2015 = _2013 + _973;
    int _2017 = _2011;
    if (!_1899)
    {
        int _2019 = ~_1975;
        int _2021 = _2019 + 1;
        _2017 = _2021;
    }
    int _2023 = _2017;
    float _2025 = fma(_1627, _1605, _1721);
    bool _2027 = uint(_1953) >= uint(_612);
    float _2029 = _1901 * _2005;
    int _2031 = _2003 ? 0 : 1;
    float _2033 = -_1987;
    float _2035 = _2033 + 1.0;
    bool _2037 = !_2027;
    int _2039 = _2037 ? 0 : (-1);
    int _2041 = ~_2031;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    bool _2047 = !_1435;
    int _2049 = _2047 ? _2015 : (-1);
    float _2051 = fma(_1627, _1449, _1723);
    int _2053 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2055 = _2053 != 0;
    int _2057 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2059 = _2057 != 0;
    int _2061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2063 = _2061 != 0;
    float _2065 = fma(_2035, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2029);
    int _2067 = _2045;
    if (!_1971)
    {
        int _2069 = ~_2031;
        int _2071 = _2069 + 1;
        _2067 = _2071;
    }
    int _2073 = _2067;
    float _2075 = _550 + _592;
    bool _2077 = _1959 >= 0.0;
    bool _2079 = isnan(_1959);
    bool _2081 = _2077 || _2079;
    bool _2083 = isnan(0.0);
    bool _2085 = _2081 || _2083;
    float _2087 = fma(_1949, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2065);
    bool _2089 = !_2055;
    int _2091 = _2089 ? 0 : 1;
    float _2093 = _2075 + (-1.0);
    int _2095 = _2085 ? 0 : 1;
    float _2097 = _2087 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2099 = _1811 != 2;
    float _2101 = _2051 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _2103 = _1959 > 0.0;
    float _2105 = _580 + _550;
    float _2107 = _2105 + (-1.0);
    float _2109 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2113 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_2099)
    {
        _1467 = _580;
    }
    float _2115 = _1467;
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2119 = _2115;
    if (!_2099)
    {
        _2119 = _592;
    }
    float _2121 = _2119;
    float _2123 = fma(_2093, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _2125 = ~_2095;
    int _2127 = _2125 + 1;
    int _2129 = _2127 + 1;
    float _2131 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2133 = _2129;
    if (!_2103)
    {
        int _2135 = ~_2095;
        int _2137 = _2135 + 1;
        _2133 = _2137;
    }
    int _2139 = _2133;
    float _2141 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2143 = _1481 >> 31;
    float _2145 = _2111 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2147 = _1599 >> 31;
    float _2149 = _2113 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2151 = -_2117;
    float _2153 = fma(_2141, 2.0, _2151);
    int _2155 = _2143 & 3;
    int _2157 = _2147 & 3;
    out.m_69.x = _2131;
    out.m_69.y = _2145;
    out.m_69.z = _2149;
    out.m_69.w = _2097;
    float _2159 = -_150;
    float _2161 = fma(_2159, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2153);
    bool _2163 = !_1495;
    int _2165 = _2163 ? 0 : 1;
    int _2167 = _1599 + _2157;
    float _2169 = fma(_2107, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _2171 = _1599 & 3;
    bool _2173 = _2171 != 0;
    int _2175 = _1787 >> 31;
    int _2177 = _2167 >> 2;
    bool _2179 = !_2173;
    int _2181 = _2179 ? 0 : 1;
    int _2183 = _1481 + _2155;
    float _2185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2187 = _1741 + _2185;
    int _2189 = _1787 & 3;
    bool _2191 = _2189 != 0;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _2195 = _2183 >> 2;
    int _2197 = _2175 & 3;
    float _2199 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2193);
    bool _2201 = !_2191;
    int _2203 = _2201 ? 0 : 1;
    float _2205 = _2025 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _2207 = _2195 << 4;
    int _2209 = _2207 + 368;
    float _2211 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2199);
    bool _2213 = _1493 != 3;
    float _2215 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2217 = _2205 + _2215;
    int _2219 = _1787 + _2197;
    uint _2221 = uint(int(uint(_2209) >> uint(2)));
    uint _2223 = uint(int(uint(int(_2221)) >> uint(2)));
    int _2225 = int(_2221) & 3;
    float _2227 = (*spvDescriptorSet0.vp_c9)._m0[int(_2223)][_2225];
    int _2229 = int(_2221) + 1;
    uint _2231 = uint(int(uint(_2229) >> uint(2)));
    int _2233 = _2229 & 3;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[int(_2231)][_2233];
    bool _2237 = !_2213;
    int _2239 = _2237 ? 0 : (-1);
    int _2241 = _2219 >> 2;
    bool _2243 = _1629 != 3;
    float _2245 = _2217 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2247 = _2241 << 4;
    int _2249 = _2247 + 656;
    float _2251 = fma(_2187, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2245);
    bool _2253 = !_2243;
    int _2255 = _2253 ? 0 : (-1);
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _2259 = _2177 << 4;
    int _2261 = _2259 + 512;
    uint _2263 = uint(int(uint(_2249) >> uint(2)));
    uint _2265 = uint(int(uint(int(_2263)) >> uint(2)));
    int _2267 = int(_2263) & 3;
    float _2269 = (*spvDescriptorSet0.vp_c9)._m0[int(_2265)][_2267];
    int _2271 = int(_2263) + 1;
    uint _2273 = uint(int(uint(_2271) >> uint(2)));
    int _2275 = _2271 & 3;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[int(_2273)][_2275];
    bool _2279 = _1813 != 3;
    float _2281 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2283 = _2101 + _2281;
    int _2285 = abs(_2091);
    float _2287 = fma(_1961, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2257);
    float _2289 = fma(_2283, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2251);
    float _2291 = _1957 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    uint _2293 = uint(int(uint(_2261) >> uint(2)));
    uint _2295 = uint(int(uint(int(_2293)) >> uint(2)));
    int _2297 = int(_2293) & 3;
    float _2299 = (*spvDescriptorSet0.vp_c9)._m0[int(_2295)][_2297];
    int _2301 = int(_2293) + 1;
    uint _2303 = uint(int(uint(_2301) >> uint(2)));
    int _2305 = _2301 & 3;
    float _2307 = (*spvDescriptorSet0.vp_c9)._m0[int(_2303)][_2305];
    float _2309 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2311 = -_574;
    float _2313 = fma(_2291, 2.0, _2311);
    int _2315 = abs(_1545);
    float _2317 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2287);
    int _2319 = abs(_1897);
    float _2321 = fma(_1973, -2.0, _2309);
    int _2323 = _2209 + 8;
    uint _2325 = uint(int(uint(_2323) >> uint(2)));
    uint _2327 = uint(int(uint(int(_2325)) >> uint(2)));
    int _2329 = int(_2325) & 3;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[int(_2327)][_2329];
    int _2333 = int(_2325) + 1;
    uint _2335 = uint(int(uint(_2333) >> uint(2)));
    int _2337 = _2333 & 3;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[int(_2335)][_2337];
    bool _2341 = !_2279;
    int _2343 = _2341 ? 0 : (-1);
    float _2345 = -_150;
    float _2347 = fma(_2345, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2313);
    bool _2349 = _2289 >= 0.0;
    float _2351 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2321);
    int _2353 = ~_2315;
    int _2355 = _2353 + 1;
    int _2357 = _2355 + 1;
    int _2359 = ~_1819;
    int _2361 = _2359 + _1909;
    int _2363 = _2361 + 1;
    int _2365 = _2261 + 8;
    uint _2367 = uint(int(uint(_2365) >> uint(2)));
    uint _2369 = uint(int(uint(int(_2367)) >> uint(2)));
    int _2371 = int(_2367) & 3;
    float _2373 = (*spvDescriptorSet0.vp_c9)._m0[int(_2369)][_2371];
    int _2375 = int(_2367) + 1;
    uint _2377 = uint(int(uint(_2375) >> uint(2)));
    int _2379 = _2375 & 3;
    float _2381 = (*spvDescriptorSet0.vp_c9)._m0[int(_2377)][_2379];
    float _2383 = float(_2139);
    float _2385 = float(_2285);
    int _2387 = _596 * _2363;
    int _2389 = _2387 + _1067;
    int _2391 = abs(_1691);
    float _2393 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2395 = int(_2393);
    int _2397 = abs(_2203);
    int _2399 = _2249 + 8;
    uint _2401 = uint(int(uint(_2399) >> uint(2)));
    uint _2403 = uint(int(uint(int(_2401)) >> uint(2)));
    int _2405 = int(_2401) & 3;
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[int(_2403)][_2405];
    int _2409 = int(_2401) + 1;
    uint _2411 = uint(int(uint(_2409) >> uint(2)));
    int _2413 = _2409 & 3;
    float _2415 = (*spvDescriptorSet0.vp_c9)._m0[int(_2411)][_2413];
    int _2417 = ~_2319;
    int _2419 = _2417 + 1;
    int _2421 = _2419 + 1;
    int _2423 = _2357 * as_type<int>(_2235);
    int _2425 = abs(_2165);
    float _2427 = _2385 * _2383;
    int _2429 = ~_1931;
    int _2431 = _2429 + _2039;
    int _2433 = _2431 + 1;
    float _2435 = _2187;
    if (_2349)
    {
        out.m_51.x = 0.0;
    }
    int _2437 = abs(_1613);
    int _2439 = ~_2425;
    int _2441 = _2439 + 1;
    int _2443 = _2441 + 1;
    int _2445 = _612 * _2433;
    int _2447 = _2445 + _1183;
    int _2449 = ~_2391;
    int _2451 = _2449 + 1;
    int _2453 = _2451 + 1;
    float _2455 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2457 = int(_2455);
    int _2459 = abs(_2181);
    int _2461 = _2443 * as_type<int>(_2227);
    int _2463 = _2461 + _2423;
    int _2465 = ~_2397;
    int _2467 = _2465 + 1;
    int _2469 = _2467 + 1;
    int _2471 = _2421 * as_type<int>(_2277);
    int _2473 = ~_2437;
    int _2475 = _2473 + 1;
    int _2477 = _2475 + 1;
    int _2479 = ~_2459;
    int _2481 = _2479 + 1;
    int _2483 = _2481 + 1;
    int _2485 = _2469 * as_type<int>(_2269);
    int _2487 = _2485 + _2471;
    int _2489 = abs(_1675);
    float _2491 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2493 = int(_2491);
    int _2495 = abs(_2255);
    int _2497 = _2453 * as_type<int>(_2307);
    int _2499 = ~_2489;
    int _2501 = _2499 + 1;
    int _2503 = _2501 + 1;
    int _2505 = abs(_1871);
    int _2507 = _2483 * as_type<int>(_2299);
    int _2509 = _2507 + _2497;
    int _2511 = ~_2495;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    float _2517 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2519 = log2(_2517);
    int _2521 = ~_2505;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    int _2527 = _2477 * as_type<int>(_2331);
    int _2529 = _2527 + _2463;
    int _2531 = abs(_2239);
    int _2533 = abs(_1635);
    int _2535 = ~_2531;
    int _2537 = _2535 + 1;
    int _2539 = _2537 + 1;
    float _2541 = float(uint(_2457));
    int _2543 = _2503 * as_type<int>(_2373);
    int _2545 = _2543 + _2509;
    int _2547 = abs(_1829);
    int _2549 = _2539 * as_type<int>(_2339);
    int _2551 = _2549 + _2529;
    int _2553 = abs(_2343);
    int _2555 = _2515 * as_type<int>(_2381);
    int _2557 = _2555 + _2545;
    int _2559 = abs(_1783);
    float _2561 = 1.0 / _2541;
    int _2563 = _2525 * as_type<int>(_2407);
    int _2565 = _2563 + _2487;
    float _2567 = float(uint(_2395));
    int _2569 = ~_2553;
    int _2571 = _2569 + 1;
    int _2573 = _2571 + 1;
    float _2575 = float(uint(_2493));
    float _2577 = 1.0 / _2567;
    int _2579 = ~_2559;
    int _2581 = _2579 + 1;
    int _2583 = _2581 + 1;
    int _2585 = _2573 * as_type<int>(_2415);
    int _2587 = _2585 + _2565;
    int _2589 = ~_2533;
    int _2591 = _2589 + 1;
    int _2593 = _2591 + 1;
    int _2595 = ~_2547;
    int _2597 = _2595 + 1;
    int _2599 = _2597 + 1;
    int _2601 = _2583 * _2557;
    bool _2603 = !_1205;
    int _2605 = _2603 ? _2389 : (-1);
    float _2607 = 1.0 / _2575;
    int _2609 = _2551 * _2593;
    bool _2611 = !_1199;
    int _2613 = _2611 ? _2447 : (-1);
    int _2615 = _2599 * _2587;
    int _2617 = as_type<int>(_2561) + (-2);
    int _2619 = _2049 * _2533;
    int _2621 = _2619 + _2609;
    float _2623 = _2519 * _150;
    int _2625 = _2605 * _2559;
    int _2627 = _2625 + _2601;
    int _2629 = as_type<int>(_2577) + (-2);
    int _2631 = _2613 * _2547;
    int _2633 = _2631 + _2615;
    bool _2635 = !_2059;
    int _2637 = _2635 ? 0 : 1;
    float _2639 = in.m_71.x;
    float _2641 = in.m_71.y;
    float _2643 = in.m_71.z;
    float _2645 = float(uint(_2621));
    float _2647 = float(uint(_2627));
    float _2649 = exp2(_2623);
    int _2651 = as_type<int>(_2607) + (-2);
    float _2653 = float(uint(_2633));
    float _2655 = as_type<float>(_2617) * _2647;
    int _2657 = abs(_2637);
    float _2659 = as_type<float>(_2629) * _2645;
    float _2661 = _2645;
    float _2663 = _2299;
    if (_2099)
    {
        _2661 = _550;
    }
    float _2665 = _2661;
    float _2667 = as_type<float>(_2651) * _2653;
    float _2669 = trunc(_2655);
    float _2671 = precise::max(_2669, 0.0);
    uint _2673 = uint(_2671);
    float _2675 = _2665;
    if (!_2099)
    {
        _2675 = _580;
    }
    float _2677 = _2675;
    float _2679 = float(_2023);
    float _2681 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2683 = float(_2657);
    float _2685 = _2677 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2687 = as_type<int>(_2677);
    if (_2349)
    {
        _2663 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2689 = _2663;
    float _2691 = trunc(_2667);
    float _2693 = precise::max(_2691, 0.0);
    uint _2695 = uint(_2693);
    int _2697 = abs(_2395);
    float _2699 = fma(_2685, -2.0, _2681);
    float _2701 = _2427 * (-2.0);
    if (_2349)
    {
        float _2703 = _2689 * 5.0;
        _2687 = as_type<int>(_2703);
    }
    int _2705 = _2687;
    int _2707 = abs(_2457);
    float _2709 = _2683 * _2679;
    float _2711 = fma(_2169, _2701, _2169);
    float _2713 = trunc(_2659);
    float _2715 = precise::max(_2713, 0.0);
    uint _2717 = uint(_2715);
    if (_2349)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8624 = as_type<float>(_2705);
        out.gl_Position.z = _8624;
    }
    int _2719 = ~_2457;
    int _2721 = _2719 + 1;
    float _2723 = fma(_2701, _2639, _2639);
    float _2725 = float(uint(_2697));
    float _2727 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2699);
    int _2729 = ~_2395;
    int _2731 = _2729 + 1;
    int _2733 = _2721 * int(_2673);
    int _2735 = _2733 + _2627;
    float _2737 = float(uint(_2707));
    float _2739 = _2709 * (-2.0);
    float _2741 = 1.0 / _2725;
    int _2743 = abs(_2621);
    int _2745 = ~_2493;
    int _2747 = _2745 + 1;
    float _2749 = fma(_2123, _2739, _2123);
    int _2751 = abs(_2493);
    int _2753 = _2731 * int(_2717);
    int _2755 = _2753 + _2621;
    float _2757 = float(uint(_2735));
    int _2759 = _2747 * int(_2695);
    int _2761 = _2759 + _2633;
    float _2763 = 1.0 / _2737;
    int _2765 = abs(_2627);
    float _2767 = float(uint(_2755));
    float _2769 = as_type<float>(_2617) * _2757;
    float _2771 = float(uint(_2761));
    float _2773 = as_type<float>(_2629) * _2767;
    float _2775 = _2217 * _2217;
    float _2777 = as_type<float>(_2651) * _2771;
    float _2779 = float(uint(_2751));
    float _2781 = fma(_2187, _2187, _2775);
    int _2783 = as_type<int>(_2741) + (-2);
    float _2785 = 1.0 / _2779;
    float _2787 = float(uint(_2743));
    float _2789 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2791 = abs(_2633);
    float _2793 = fma(_2283, _2283, _2781);
    int _2795 = as_type<int>(_2763) + (-2);
    float _2797 = as_type<float>(_2783) * _2787;
    float _2799 = float(uint(_2765));
    float _2801 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2789);
    float _2803 = rsqrt(_2793);
    float _2805 = as_type<float>(_2795) * _2799;
    float _2807 = float(uint(_2791));
    float _2809 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2811 = 1.0 + _2809;
    int _2813 = as_type<int>(_2785) + (-2);
    float _2815 = trunc(_2797);
    float _2817 = precise::max(_2815, 0.0);
    uint _2819 = uint(_2817);
    float _2821 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2823 = as_type<float>(_2813) * _2807;
    int _2825 = ~_2697;
    int _2827 = _2825 + 1;
    float _2829 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _2831 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2833 = isnan(1.0);
    bool _2835 = _2831 || _2833;
    bool _2837 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2839 = _2835 || _2837;
    float _2841 = trunc(_2805);
    float _2843 = precise::max(_2841, 0.0);
    uint _2845 = uint(_2843);
    float _2847 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2849 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2829);
    float _2851 = -_150;
    float _2853 = fma(_2851, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1791);
    bool _2855 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2857 = isnan(0.0);
    bool _2859 = _2855 || _2857;
    bool _2861 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2863 = _2859 || _2861;
    float _2865 = fma(_580, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2847);
    float _2867 = fma(_550, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2821);
    float _2869 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1817);
    float _2871 = trunc(_2823);
    float _2873 = precise::max(_2871, 0.0);
    uint _2875 = uint(_2873);
    int _2877 = _2827 * int(_2819);
    int _2879 = _2877 + _2743;
    float _2881 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2849);
    float _2883 = -_2649;
    float _2885 = _2883 + 1.0;
    float _2887 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2865);
    int _2889 = ~_2707;
    int _2891 = _2889 + 1;
    float _2893 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2801);
    int _2895 = ~_2751;
    int _2897 = _2895 + 1;
    float _2899 = 1.0 / _2811;
    float _2901 = float(uint(_2879));
    int _2903 = _2891 * int(_2845);
    int _2905 = _2903 + _2765;
    float _2907 = _2863 ? _2885 : 0.0;
    float _2909 = fma(_150, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2867);
    float _2911 = as_type<float>(_2783) * _2901;
    float _2913 = trunc(_2769);
    float _2915 = precise::max(_2913, 0.0);
    uint _2917 = uint(_2915);
    int _2919 = _2897 * int(_2875);
    int _2921 = _2919 + _2791;
    float _2923 = float(uint(_2921));
    if (_2839)
    {
        float _2925 = _2907 * _2899;
        _152 = _2925;
    }
    float _2927 = _152;
    float _2929 = trunc(_2773);
    float _2931 = precise::max(_2929, 0.0);
    uint _2933 = uint(_2931);
    float _2935 = float(uint(_2905));
    float _2937 = _2217 * _2803;
    int _2939 = ~_2395;
    int _2941 = _2939 + 1;
    float _2943 = as_type<float>(_2795) * _2935;
    float _2945 = as_type<float>(_2813) * _2923;
    float _2947 = trunc(_2911);
    float _2949 = precise::max(_2947, 0.0);
    uint _2951 = uint(_2949);
    int _2953 = int(_2673) + int(_2917);
    float _2955 = _580 + (-0.5);
    int _2957 = ~_2457;
    int _2959 = _2957 + 1;
    float _2961 = -_2937;
    float _2963 = fma(_2961, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2217);
    float _2965 = fma(_2955, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2723);
    float _2967 = trunc(_2777);
    float _2969 = precise::max(_2967, 0.0);
    uint _2971 = uint(_2969);
    int _2973 = _2959 * _2953;
    int _2975 = _2973 + _2627;
    int _2977 = int(_2717) + int(_2933);
    float _2979 = _2963 * _2963;
    int _2981 = ~_2707;
    int _2983 = _2981 + 1;
    float _2985 = fma(_2711, _2927, _2965);
    bool _2987 = uint(_2975) >= uint(_2457);
    int _2989 = _2941 * _2977;
    int _2991 = _2989 + _2621;
    float _2993 = trunc(_2945);
    float _2995 = precise::max(_2993, 0.0);
    uint _2997 = uint(_2995);
    int _2999 = int(_2819) + int(_2951);
    float _3001 = _2187 * _2803;
    int _3003 = ~_2697;
    int _3005 = _3003 + 1;
    bool _3007 = uint(_2991) >= uint(_2395);
    float _3009 = -_3001;
    float _3011 = fma(_3009, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2187);
    int _3013 = ~_2751;
    int _3015 = _3013 + 1;
    float _3017 = trunc(_2943);
    float _3019 = precise::max(_3017, 0.0);
    uint _3021 = uint(_3019);
    int _3023 = int(_2695) + int(_2971);
    int _3025 = _3005 * _2999;
    int _3027 = _3025 + _2743;
    int _3029 = ~_2493;
    int _3031 = _3029 + 1;
    float _3033 = fma(_3011, _3011, _2979);
    bool _3035 = !_2987;
    int _3037 = _3035 ? 0 : (-1);
    bool _3039 = uint(_3027) >= uint(_2697);
    int _3041 = _3031 * _3023;
    int _3043 = _3041 + _2633;
    int _3045 = int(_2875) + int(_2997);
    bool _3047 = !_3007;
    int _3049 = _3047 ? 0 : (-1);
    bool _3051 = uint(_3043) >= uint(_2493);
    int _3053 = _3015 * _3045;
    int _3055 = _3053 + _2791;
    float _3057 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _3059 = int(_2845) + int(_3021);
    int _3061 = ~_2977;
    int _3063 = _3061 + _3049;
    int _3065 = _3063 + 1;
    bool _3067 = uint(_3055) >= uint(_2751);
    int _3069 = _2983 * _3059;
    int _3071 = _3069 + _2765;
    int _3073 = ~_2953;
    int _3075 = _3073 + _3037;
    int _3077 = _3075 + 1;
    int _3079 = _2395 * _3065;
    int _3081 = _3079 + _2621;
    bool _3083 = !_3051;
    int _3085 = _3083 ? 0 : (-1);
    float _3087 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3089 = _2395 == 0;
    int _3091 = _2457 * _3077;
    int _3093 = _3091 + _2627;
    bool _3095 = !_3039;
    int _3097 = _3095 ? 0 : (-1);
    bool _3099 = uint(_3071) >= uint(_2707);
    float _3101 = _3057 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _3103 = _2395 == 0;
    float _3105 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _3107 = _2621 ^ _2395;
    int _3109 = _2627 ^ _2457;
    int _3111 = ~_3023;
    int _3113 = _3111 + _3085;
    int _3115 = _3113 + 1;
    bool _3117 = !_3089;
    int _3119 = _3117 ? _3081 : (-1);
    float _3121 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3123 = !_3099;
    float _3125 = _3123 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    bool _3127 = _2457 == 0;
    bool _3129 = !_3067;
    int _3131 = _3129 ? 0 : (-1);
    float _3133 = float(_3119);
    float _3135 = _3105 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _3137 = _2457 == 0;
    int _3139 = _2633 ^ _2493;
    int _3141 = _2493 * _3115;
    int _3143 = _3141 + _2633;
    bool _3145 = !_3127;
    int _3147 = _3145 ? _3093 : (-1);
    float _3149 = fma(_3101, _3133, _2853);
    bool _3151 = _2493 == 0;
    float _3153 = _3121 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3155 = _2493 == 0;
    float _3157 = fma(_3135, _815, -0.5);
    uint _3159 = uint(int(uint(_3107) >> uint(31)));
    float _3161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3163 = uint(int(uint(_3109) >> uint(31)));
    float _3165 = fma(_3153, _1487, -0.5);
    uint _3167 = uint(int(uint(_3139) >> uint(31)));
    int _3169 = ~_3097;
    int _3171 = _2999 + _3169;
    int _3173 = _3171 + 1;
    bool _3175 = !_3151;
    int _3177 = _3175 ? _3143 : (-1);
    int _3179 = ~int(_3159);
    int _3181 = _3179 + 1;
    int _3183 = ~_3131;
    int _3185 = _3045 + _3183;
    int _3187 = _3185 + 1;
    float _3189 = fma(_3101, _805, -0.5);
    int _3191 = ~as_type<int>(_3125);
    int _3193 = _3059 + _3191;
    int _3195 = _3193 + 1;
    float _3197 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _3199 = float(_3147);
    float _3201 = fma(_2887, _3189, _3149);
    int _3203 = ~int(_3163);
    int _3205 = _3203 + 1;
    int _3207 = ~int(_3167);
    int _3209 = _3207 + 1;
    float _3211 = fma(_3135, _3199, _2347);
    float _3213 = float(_3177);
    int _3215 = _3173 ^ _3181;
    float _3217 = fma(_2317, _3157, _3211);
    int _3219 = _3195 ^ _3205;
    float _3221 = fma(_3153, _3213, _2161);
    int _3223 = _3187 ^ _3209;
    int _3225 = ~_3181;
    int _3227 = _3225 + _3215;
    int _3229 = _3227 + 1;
    float _3231 = fma(_2893, _3165, _3221);
    int _3233 = ~_3205;
    int _3235 = _3233 + _3219;
    int _3237 = _3235 + 1;
    float _3239 = _3087 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3241 = ~_3209;
    int _3243 = _3241 + _3223;
    int _3245 = _3243 + 1;
    float _3247 = _3197 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3249 = !_3103;
    int _3251 = _3249 ? _3229 : (-1);
    float _3253 = _3161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3255 = !_3137;
    int _3257 = _3255 ? _3237 : (-1);
    float _3259 = fma(_1185, _3239, -0.5);
    bool _3261 = !_3155;
    int _3263 = _3261 ? _3245 : (-1);
    float _3265 = fma(_1359, _3253, -0.5);
    float _3267 = float(_3251);
    float _3269 = fma(_3247, _1405, -0.5);
    float _3271 = float(_3257);
    float _3273 = _3231 + 0.5;
    float _3275 = float(_3263);
    float _3277 = -_2869;
    float _3279 = fma(_3239, _3267, _3277);
    float _3281 = _3201 + 0.5;
    float _3283 = -_2351;
    float _3285 = fma(_3253, _3271, _3283);
    float _3287 = _2283 * _2803;
    float _3289 = -_2727;
    float _3291 = fma(_3247, _3275, _3289);
    float _3293 = fma(_2881, _3259, _3279);
    float _3295 = fma(_2211, _3265, _3285);
    float _3297 = _3217 + 0.5;
    float _3299 = fma(_2909, _3269, _3291);
    float _3301 = _3293 + 0.5;
    float _3303 = _3295 + 0.5;
    float _3305 = -_3287;
    float _3307 = fma(_3305, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2283);
    float _3309 = _3299 + 0.5;
    float _3311 = fma(_2739, _2641, _2641);
    float _3313 = _550 + (-0.5);
    out.m_73.x = _3281;
    out.m_73.y = _3301;
    out.m_73.z = _3297;
    out.m_73.w = _3303;
    float _3315 = fma(_3307, _3307, _3033);
    bool _3317 = !_2063;
    int _3319 = _3317 ? 0 : 1;
    out.m_75.x = _3273;
    out.m_75.y = _3309;
    float _3321 = _3125;
    float _3323 = _2937;
    if (_2349)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3325 = -_2937;
    float _3327 = fma(_3325, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2205);
    int _3329 = abs(_3319);
    float _3331 = -_3001;
    float _3333 = fma(_3331, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1741);
    float _3335 = float(_2073);
    float _3337 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3339 = _3327 + _3337;
    float _3341 = float(_3329);
    float _3343 = -_3287;
    float _3345 = fma(_3343, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2101);
    float _3347 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3349 = _3333 + _3347;
    float _3351 = _3339 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3353 = fma(_3313, (*spvDescriptorSet0.vp_c9)._m0[196].y, _3311);
    float _3355 = _3341 * _3335;
    float _3357 = _580 + _592;
    float _3359 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3361 = _3345 + _3359;
    float _3363 = fma(_3349, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3351);
    float _3365 = fma(_2749, _2927, _3353);
    float _3367 = _3357 + (-1.0);
    float _3369 = _3355 * (-2.0);
    float _3371 = fma(_3361, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3363);
    float _3373 = _3365 * 0.15915493667125701904296875;
    float _3375 = fma(_3367, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _3377 = fma(_3369, _2643, _2643);
    float _3379 = _592 + (-0.5);
    bool _3381 = _3371 >= 0.0;
    float _3383 = fma(_3375, _3369, _3375);
    float _3385 = _2985 * 0.15915493667125701904296875;
    float _3387 = fma(_3379, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3377);
    float _3389 = _3373 * 6.283185482025146484375;
    float _3391 = sin(_3389);
    float _3393 = fma(_3383, _2927, _3387);
    float _3395 = _3393 * 0.15915493667125701904296875;
    float _3397 = _3385 * 6.283185482025146484375;
    float _3399 = sin(_3397);
    float _3401 = _3351;
    float _3403 = _3349;
    float _3405 = _3361;
    if (_3381)
    {
        _3401 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3407 = _3401;
    int _3409 = as_type<int>(_3407);
    if (_3381)
    {
        out.m_51.x = 0.0;
    }
    if (_3381)
    {
        float _3411 = _3407 * 5.0;
        _3409 = as_type<int>(_3411);
    }
    int _3413 = _3409;
    float _3415 = sqrt(_3315);
    if (_3381)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9674 = as_type<float>(_3413);
        out.gl_Position.z = _9674;
    }
    float _3417 = _3385 * 6.283185482025146484375;
    float _3419 = cos(_3417);
    float _3421 = _3399 * _3391;
    float _3423 = _3373 * 6.283185482025146484375;
    float _3425 = cos(_3423);
    float _3427 = _3395 * 6.283185482025146484375;
    float _3429 = sin(_3427);
    if (_3381)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3431 = -_2205;
    float _3433 = _3431 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3435 = -_1741;
    float _3437 = _3435 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3439 = in.m_77.x;
    float _3441 = in.m_77.y;
    float _3443 = in.m_77.z;
    float _3445 = -_2101;
    float _3447 = _3445 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3449 = _3433 * _3433;
    float _3451 = _3395 * 6.283185482025146484375;
    float _3453 = cos(_3451);
    float _3455 = _3419 * _3425;
    float _3457 = _2803 * _3415;
    float _3459 = fma(_3437, _3437, _3449);
    float _3461 = _508 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3463 = fma(_3429, _3455, _3421);
    float _3465 = fma(_3429, _3421, _3455);
    float _3467 = fma(_3447, _3447, _3459);
    float _3469 = _512 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _3471 = _510 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3473 = _3399 * _3425;
    float _3475 = _3457 * _3469;
    float _3477 = rsqrt(_3467);
    float _3479 = _3419 * _3391;
    float _3481 = _3457 * _3471;
    float _3483 = _3419 * _3453;
    float _3485 = _3425 * _3453;
    float _3487 = _3399 * _3453;
    float _3489 = _3391 * _3453;
    float _3491 = -_3479;
    float _3493 = fma(_3429, _3473, _3491);
    float _3495 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3439);
    float _3497 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3441);
    float _3499 = -_3473;
    float _3501 = fma(_3429, _3479, _3499);
    bool _3503 = _3441 != 0.0;
    bool _3505 = isnan(_3441);
    bool _3507 = _3503 || _3505;
    bool _3509 = isnan(0.0);
    bool _3511 = _3507 || _3509;
    float _3513 = _3495 * _3475;
    float _3515 = _3457 * _3461;
    float _3517 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3443);
    float _3519 = _3497 * _3481;
    float _3521 = _3437 * _3477;
    float _3523 = _3447 * _3477;
    float _3525 = in.m_79.x;
    float _3527 = in.m_79.y;
    float _3529 = in.m_79.z;
    float _3531 = _3517 * _3515;
    float _3533 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3535 = _3521 * _3533;
    float _3537 = _3433 * _3477;
    float _3539 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3541 = _3523 * _3539;
    bool _3543 = _3439 == 0.0;
    bool _3545 = !_3511;
    bool _3547 = _3543 && _3545;
    float _3549 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3551 = -_3535;
    float _3553 = fma(_3523, _3549, _3551);
    float _3555 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3557 = _3537 * _3555;
    float _3559 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3561 = -_3541;
    float _3563 = fma(_3537, _3559, _3561);
    bool _3565 = _3443 == 0.0;
    bool _3567 = _3565 && _3547;
    float _3569 = _3553 * _3553;
    float _3571 = in.m_81.x;
    float _3573 = in.m_81.y;
    float _3575 = in.m_81.z;
    float _3577 = in.m_81.w;
    float _3579 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3581 = -_3557;
    float _3583 = fma(_3521, _3579, _3581);
    float _3585 = _3483 * _3519;
    float _3587 = fma(_3563, _3563, _3569);
    float _3589 = -_3519;
    float _3591 = _3429 * _3589;
    float _3593 = _3487 * _3519;
    float _3595 = fma(_3463, _3513, _3585);
    float _3597 = fma(_3583, _3583, _3587);
    float _3599 = fma(_3485, _3513, _3591);
    float _3601 = fma(_3493, _3513, _3593);
    float _3603 = fma(_3501, _3531, _3595);
    float _3605 = fma(_3489, _3531, _3599);
    float _3607 = rsqrt(_3597);
    float _3609 = _3585;
    float _3611 = _3587;
    float _3613 = _3513;
    if (_3567)
    {
        _3321 = _3527;
    }
    float _3615 = _3321;
    float _3617 = _3615;
    if (_3567)
    {
        _2435 = _3525;
    }
    float _3619 = _2435;
    float _3621 = _3619;
    if (_3567)
    {
        _3609 = _3615;
    }
    float _3623 = _3609;
    float _3625 = _3623;
    if (_3567)
    {
        _3611 = _3619;
    }
    float _3627 = _3611;
    float _3629 = _3627;
    if (!_3567)
    {
        _3617 = _3527;
    }
    float _3631 = _3617;
    float _3633 = fma(_3465, _3531, _3601);
    if (!_3567)
    {
        _3621 = _3525;
    }
    float _3635 = _3621;
    if (_3567)
    {
        _3613 = _3529;
    }
    float _3637 = _3613;
    float _3639 = _3637;
    if (!_3567)
    {
        float _3641 = fma(_3441, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3631);
        _3625 = _3641;
    }
    float _3643 = _3625;
    if (!_3567)
    {
        float _3645 = fma(_3443, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3529);
        _3639 = _3645;
    }
    float _3647 = _3639;
    float _3649 = _3575 * _3635;
    float _3651 = _3563 * _3607;
    float _3653 = _3553 * _3607;
    if (!_3567)
    {
        float _3655 = fma(_3439, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3635);
        _3629 = _3655;
    }
    float _3657 = _3629;
    float _3659 = -_3649;
    float _3661 = fma(_3571, _3529, _3659);
    float _3663 = _3573 * _3529;
    float _3665 = _3583 * _3607;
    float _3667 = _3523 * _3653;
    float _3669 = _3537 * _3651;
    float _3671 = _3571 * _3631;
    float _3673 = -_3663;
    float _3675 = fma(_3575, _3631, _3673);
    float _3677 = -_3667;
    float _3679 = fma(_3537, _3665, _3677);
    float _3681 = -_3669;
    float _3683 = fma(_3521, _3653, _3681);
    float _3685 = -_3671;
    float _3687 = fma(_3573, _3635, _3685);
    float _3689 = _3661 * _3577;
    float _3691 = _3675 * _3577;
    float _3693 = _3679 * _3603;
    float _3695 = _3683 * _3603;
    float _3697 = _3521 * _3665;
    float _3699 = _3687 * _3577;
    float _3701 = fma(_3651, _3605, _3693);
    float _3703 = fma(_3665, _3605, _3695);
    float _3705 = -_3697;
    float _3707 = fma(_3523, _3651, _3705);
    float _3709 = _3463 * _3679;
    float _3711 = fma(_3521, _3633, _3701);
    float _3713 = fma(_3523, _3633, _3703);
    float _3715 = _3463 * _3707;
    float _3717 = _3463 * _3683;
    float _3719 = _1741 + _3711;
    float _3721 = _2101 + _3713;
    float _3723 = _3483 * _3679;
    float _3725 = _3501 * _3679;
    float _3727 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3729 = _3719 + _3727;
    float _3731 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3733 = _3721 + _3731;
    float _3735 = _3483 * _3707;
    float _3737 = _3483 * _3683;
    float _3739 = _3729 * _3729;
    float _3741 = _3733 * _3733;
    float _3743 = _3501 * _3707;
    float _3745 = _3707 * _3603;
    float _3747 = fma(_3485, _3651, _3709);
    float _3749 = _3739 + _3741;
    float _3751 = fma(_3485, _3653, _3715);
    float _3753 = fma(_3485, _3665, _3717);
    float _3755 = _3501 * _3683;
    float _3757 = sqrt(_3749);
    float _3759 = -_3429;
    float _3761 = fma(_3759, _3651, _3723);
    float _3763 = fma(_3489, _3651, _3725);
    float _3765 = -_3429;
    float _3767 = fma(_3765, _3653, _3735);
    float _3769 = fma(_3489, _3653, _3743);
    float _3771 = fma(_3653, _3605, _3745);
    float _3773 = -_3429;
    float _3775 = fma(_3773, _3665, _3737);
    float _3777 = fma(_3489, _3665, _3755);
    float _3779 = fma(_3487, _3521, _3761);
    float _3781 = fma(_3537, _3633, _3771);
    float _3783 = fma(_3487, _3537, _3767);
    float _3785 = fma(_3487, _3523, _3775);
    float _3787 = fma(_3493, _3537, _3751);
    float _3789 = _2205 + _3781;
    float _3791 = fma(_3493, _3521, _3747);
    float _3793 = fma(_3465, _3521, _3763);
    bool _3795 = _3757 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3797 = fma(_3465, _3523, _3777);
    float _3799 = fma(_3493, _3523, _3753);
    float _3801 = fma(_3465, _3537, _3769);
    float _3803 = _3779 * _3573;
    float _3805 = _3783 * _3573;
    float _3807 = _3785 * _3573;
    float _3809 = _3779 * _3643;
    float _3811 = _3689 * _3779;
    float _3813 = _3783 * _3643;
    float _3815 = _3785 * _3643;
    float _3817 = _3689 * _3783;
    float _3819 = _3689 * _3785;
    float _3821 = _3779;
    float _3823 = _3781;
    float _3825 = _3739;
    float _3827 = _3741;
    float _3829 = _3719;
    float _3831 = _3757;
    float _3833 = _3699;
    if (!_3795)
    {
        _3821 = _3721;
    }
    float _3835 = _3821;
    float _3837 = _3835;
    if (!_3795)
    {
        _3823 = _3789;
    }
    float _3839 = _3823;
    bool _3841 = !_3795;
    float _3843 = _3839;
    if (!_3841)
    {
        float _3845 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3847 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3849 = _3757 + _3847;
        float _3851 = _3789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3853 = rsqrt(_3749);
        float _3855 = _3849 * _3845;
        float _3857 = _3855 * 0.15915493667125701904296875;
        float _3859 = _3857 * 6.283185482025146484375;
        float _3861 = sin(_3859);
        float _3863 = _3857 * 6.283185482025146484375;
        float _3865 = cos(_3863);
        float _3867 = fma(_3861, _3851, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3869 = _3853 * _3867;
        float _3871 = _3865 + (-1.0);
        float _3873 = fma(_3729, _3869, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3875 = fma(_3733, _3869, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3877 = _3871 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3879 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3881 = _3873 + _3879;
        float _3883 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3885 = _3875 + _3883;
        float _3887 = fma(_3789, _3865, _3877);
        float _3889 = _3881 * _3881;
        float _3891 = _3885 * _3885;
        _3843 = _3887;
        _3825 = _3889;
        _3827 = _3891;
        _3829 = _3873;
        _3837 = _3875;
        _3831 = _3857;
    }
    float _3893 = _3843;
    float _3895 = _3825;
    float _3897 = _3827;
    float _3899 = _3829;
    float _3901 = _3837;
    float _3903 = _3831;
    float _3905 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3907 = _3893 + _3905;
    float _3909 = fma(_3791, _3571, _3803);
    float _3911 = fma(_3787, _3571, _3805);
    float _3913 = fma(_3691, _3787, _3817);
    float _3915 = fma(_3907, _3907, _3895);
    float _3917 = fma(_3799, _3571, _3807);
    float _3919 = fma(_3791, _3657, _3809);
    float _3921 = fma(_3691, _3791, _3811);
    float _3923 = _3915 + _3897;
    float _3925 = fma(_3787, _3657, _3813);
    float _3927 = fma(_3799, _3657, _3815);
    float _3929 = fma(_3691, _3799, _3819);
    float _3931 = fma(_3793, _3575, _3909);
    float _3933 = fma(_3801, _3575, _3911);
    float _3935 = sqrt(_3923);
    float _3937 = fma(_3699, _3801, _3913);
    float _3939 = fma(_3797, _3575, _3917);
    float _3941 = fma(_3793, _3647, _3919);
    float _3943 = fma(_3699, _3793, _3921);
    float _3945 = fma(_3801, _3647, _3925);
    float _3947 = fma(_3699, _3797, _3929);
    float _3949 = fma(_3797, _3647, _3927);
    out.m_83.x = _3931;
    out.m_83.y = _3933;
    out.m_83.z = _3939;
    out.m_85.x = _3943;
    out.m_85.y = _3937;
    out.m_85.z = _3947;
    out.m_87.x = _3941;
    out.m_87.y = _3945;
    out.m_87.z = _3949;
    bool _3951 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3953 = isnan(_3935);
    bool _3955 = _3951 || _3953;
    bool _3957 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3959 = _3955 || _3957;
    float _3961 = _3903;
    if (!_3959)
    {
        _3833 = 1.0;
    }
    float _3963 = _3833;
    bool _3965 = !_3959;
    float _3967 = _3963;
    if (!_3965)
    {
        bool _3969 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3971 = isnan(_3935);
        bool _3973 = _3969 || _3971;
        bool _3975 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3977 = _3973 || _3975;
        if (!_3977)
        {
            float _3979 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3981 = _3935 + _3979;
            float _3983 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3985 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3983;
            float _3987 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3989 = _3987 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3991 = 1.0 / _3985;
            float _3993 = _3981 * _3991;
            float _3995 = fma(_3993, _3989, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3967 = _3995;
            _3997 = true;
        }
        else
        {
            bool _3999 = _3935 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _4001 = isnan(_3935);
            bool _4003 = _3999 || _4001;
            bool _4005 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _4007 = _4003 || _4005;
            if (!_4007)
            {
                float _4009 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4011 = _3935 + _4009;
                float _4013 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _4015 = _4013 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _4017 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _4019 = _4017 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4021 = 1.0 / _4015;
                float _4023 = _4011 * _4021;
                float _4025 = fma(_4023, _4019, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3967 = _4025;
                _3997 = true;
            }
            else
            {
                _3967 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3997 = false;
    float _4027 = _3967;
    float _4029 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4031 = _3899 + _4029;
    float _4033 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4035 = _3893 + _4033;
    float _4037 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4039 = _3901 + _4037;
    bool _4041 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4043 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4045 = _4041 || _4043;
    bool _4047 = isnan(0.5);
    bool _4049 = _4045 || _4047;
    float _4051 = fma(_4031, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4053 = fma(_4035, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4055 = fma(_4039, _4027, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4057 = -_3001;
    float _4059 = fma(_4057, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4051);
    float _4061 = -_2937;
    float _4063 = fma(_4061, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4053);
    float _4065 = -_3287;
    float _4067 = fma(_4065, (*spvDescriptorSet0.vp_c9)._m0[18].w, _4055);
    float _4069 = _4063;
    float _4071 = _4059;
    float _4073 = _4067;
    if (!_4049)
    {
        float _4075 = _3339 * _3339;
        float _4077 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4079 = -_2101;
        float _4081 = _4079 + _4055;
        float _4083 = -_1741;
        float _4085 = _4083 + _4051;
        float _4087 = fma(_3349, _3349, _4075);
        float _4089 = fma(_3361, _3361, _4087);
        float _4091 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4093 = sqrt(_4089);
        float _4095 = 1.0 / _3457;
        float _4097 = _4091 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4099 = precise::min(_4093, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4101 = _4099 * _4077;
        float _4103 = _4101 * _4095;
        float _4105 = -_2205;
        float _4107 = _4105 + _4053;
        float _4109 = _4097 * _4103;
        float _4111 = _4081 * _4103;
        float _4113 = fma(_4085, _4109, _3333);
        float _4115 = fma(_4107, _4109, _3327);
        float _4117 = fma(_4097, _4111, _3345);
        _4069 = _4115;
        _4071 = _4113;
        _4073 = _4117;
        _3403 = _4093;
    }
    float _4119 = _4069;
    float _4121 = _4071;
    float _4123 = _4073;
    float _4125 = _3403;
    float _4127 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4129 = _4119 + _4127;
    float _4131 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4133 = _4121 + _4131;
    float _4135 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4137 = _4123 + _4135;
    float _4139 = _4129 * _4129;
    float _4141 = fma(_4133, _4133, _4139);
    float _4143 = fma(_4137, _4137, _4141);
    float _4145 = rsqrt(_4143);
    float _4147 = sqrt(_4143);
    float _4149 = _4145 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4151 = _4133 * _4149;
    float _4153 = _4137 * _4149;
    float _4155 = _4151 * _4151;
    float _4157 = _4153 * _4153;
    float _4159 = _4155 + _4157;
    float _4161 = sqrt(_4159);
    bool _4163 = _4161 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4165 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4167 = _4161 + _4165;
    float _4169 = _4145;
    float _4171 = _4167;
    float _4173 = _4125;
    float _4175 = _4129;
    if (_4163)
    {
        float _4177 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4169 = _4177;
    }
    float _4179 = _4169;
    if (_4163)
    {
        float _4181 = rsqrt(_4159);
        _3323 = _4181;
    }
    float _4183 = _3323;
    float _4185 = _4183;
    if (_4163)
    {
        float _4187 = _4167 * _4179;
        _4171 = _4187;
    }
    float _4189 = _4171;
    if (_4163)
    {
        float _4191 = _4189 * 0.15915493667125701904296875;
        _4173 = _4191;
    }
    float _4193 = _4173;
    float _4195 = _4179;
    float _4197 = _4193;
    if (_4163)
    {
        float _4199 = _4193 * 6.283185482025146484375;
        float _4201 = sin(_4199);
        _4195 = _4201;
    }
    float _4203 = _4195;
    float _4205 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4207 = precise::max(0.0, _4205);
    float _4209 = _4137;
    float _4211 = _4207;
    if (_4163)
    {
        float _4213 = _4193 * 6.283185482025146484375;
        float _4215 = cos(_4213);
        _4209 = _4215;
    }
    float _4217 = _4209;
    float _4219 = -_4149;
    float _4221 = -_4207;
    float _4223 = fma(_4129, _4219, _4221);
    if (!_4163)
    {
        _4175 = _4153;
    }
    float _4225 = _4175;
    float _4227 = _4225;
    if (_4163)
    {
        float _4229 = _4223 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4211 = _4229;
    }
    float _4231 = _4211;
    float _4233 = _4203;
    float _4235 = _4231;
    if (_4163)
    {
        float _4237 = fma(_4203, _4231, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3405 = _4237;
    }
    float _4239 = _3405;
    float _4241 = _4239;
    if (!_4163)
    {
        _4233 = _4151;
    }
    float _4243 = _4233;
    float _4245 = _4243;
    if (_4163)
    {
        float _4247 = _4217 + (-1.0);
        _4235 = _4247;
    }
    float _4249 = _4235;
    float _4251 = _4249;
    if (_4163)
    {
        float _4253 = _4183 * _4239;
        _3961 = _4253;
    }
    float _4255 = _3961;
    if (!_4163)
    {
        _4241 = _4223;
    }
    float _4257 = _4241;
    float _4259 = _4257;
    if (_4163)
    {
        float _4261 = _4249 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4197 = _4261;
    }
    float _4263 = _4197;
    if (_4163)
    {
        float _4265 = _4151 * _4255;
        _4245 = _4265;
    }
    float _4267 = _4245;
    if (!_4163)
    {
        _4185 = _4155;
    }
    float _4269 = _4185;
    float _4271 = _4269;
    if (_4163)
    {
        float _4273 = _4153 * _4255;
        _4227 = _4273;
    }
    float _4275 = _4227;
    if (_4163)
    {
        float _4277 = fma(_4223, _4217, _4263);
        _4259 = _4277;
    }
    float _4279 = _4259;
    if (_4163)
    {
        float _4281 = _4267 * _4267;
        _4271 = _4281;
    }
    float _4283 = _4271;
    if (!_4163)
    {
        _4251 = _4157;
    }
    float _4285 = _4251;
    float _4287 = _4285;
    if (_4163)
    {
        float _4289 = _4275 * _4275;
        _4287 = _4289;
    }
    float _4291 = _4287;
    float _4293 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4295 = fma(_4279, _4279, _4283);
    float _4297 = fma(_3333, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4299 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4301 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4293);
    float _4303 = _4295 + _4291;
    float _4305 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4307 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4299);
    float _4309 = rsqrt(_4303);
    float _4311 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4305);
    float _4313 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4307);
    float _4315 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4301);
    float _4317 = _4119 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4319 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4311);
    float _4321 = _4313 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4323 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4325 = fma(_4147, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4323);
    float _4327 = precise::clamp(_4325, 0.0, 1.0);
    float _4329 = _4315 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4331 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4333 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4335 = fma(_4121, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4317);
    float _4337 = -_4327;
    float _4339 = _4337 + 1.0;
    float _4341 = floor(_4297);
    float _4343 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4333);
    float _4345 = fma(_4123, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4335);
    float _4347 = _4309 * _4279;
    float _4349 = _4309 * _4275;
    float _4351 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4343);
    float _4353 = _4309 * _4267;
    float _4355 = _4345 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4357 = abs(_4339);
    float _4359 = log2(_4357);
    float _4361 = fma(_3345, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4363 = _4353 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4365 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4351);
    float _4367 = -_4363;
    float _4369 = fma(_4347, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4367);
    float _4371 = floor(_4361);
    float _4373 = -_4341;
    float _4375 = _4297 + _4373;
    float _4377 = -_4349;
    float _4379 = fma(_4377, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4369);
    float _4381 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4383 = fma(_4379, -0.5, 0.5);
    float _4385 = fma(_4379, 0.5, 0.5);
    float _4387 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _4389 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4391 = 1.0 / _4365;
    float _4393 = -_4381;
    float _4395 = fma(_4393, _4387, 1.0);
    float _4397 = fma(_4385, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4399 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4401 = fma(_4385, _4397, -0.212114393711090087890625);
    float _4403 = exp2(_4389);
    float _4405 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4399);
    float _4407 = fma(_4385, _4401, 1.570728778839111328125);
    float _4409 = log2(_4395);
    float _4411 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4413 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4411);
    float _4415 = sqrt(_4383);
    float _4417 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4413);
    float _4419 = _4347 + 1.0;
    float _4421 = -_4347;
    float _4423 = fma(_4403, _4419, _4421);
    float _4425 = _4409 * 0.693147182464599609375;
    float _4427 = -_4371;
    float _4429 = _4361 + _4427;
    float _4431 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4405);
    float _4433 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4417);
    float _4435 = fma(_4423, 0.5, 0.5);
    float _4437 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4431);
    float _4439 = _4433 * _4391;
    float2 _11348 = float2(_4375, _4429);
    float _4441 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11348, float2(0.0), isnan(_11348)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11348, float2(0.0), isnan(_11348)), level(0.0)).x;
    float _4443 = _4415 * 0.636619746685028076171875;
    float _4445 = _4437 * _4391;
    float _4447 = fma(_4439, -0.5, 0.5);
    float _4449 = _4425 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4451 = -_4407;
    float _4453 = fma(_4443, _4451, 1.0);
    float _4455 = fma(_4445, 0.5, 0.5);
    float3 _11378 = float3(_4455, _4447, _4449);
    float _4457 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11378, float3(0.0), isnan(_11378)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11378, float3(0.0), isnan(_11378)), level(0.0)).x;
    float3 _11389 = float3(_4455, _4447, _4449);
    float4 _4460 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11389, float3(0.0), isnan(_11389)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11389, float3(0.0), isnan(_11389)), level(0.0)).xyzw;
    float _4462 = _4460.x;
    float _4464 = _4460.y;
    float _4466 = _4460.z;
    float _4468 = _4460.w;
    float2 _11405 = float2(_4453, _4435);
    float3 _4472 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11405, float2(0.0), isnan(_11405)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11405, float2(0.0), isnan(_11405)), level(0.0)).xyz;
    float _4474 = _4472.x;
    float _4476 = _4472.y;
    float _4478 = _4472.z;
    float _4480 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _4482 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4484 = _4321 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _4486 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4488 = isnan(_4147);
    bool _4490 = _4486 || _4488;
    bool _4492 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4494 = _4490 || _4492;
    float _4496 = fma(_3333, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4480);
    float _4498 = fma(_3333, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4482);
    float _4500 = fma(_4331, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4484);
    float _4502 = _4359 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4504 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4496);
    float _4506 = fma(_3345, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4498);
    float _4508 = fma(_4329, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4500);
    float _4510 = _4504 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4512 = _4506 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4514 = exp2(_4502);
    float _4516 = fma(_4355, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4508);
    float _4518 = _4512 + _4510;
    float _4520 = 1.0 / _4510;
    float _4522 = -_4514;
    float _4524 = _4522 + 1.0;
    float _4526 = _4524 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4528 = _4518 * _4520;
    float _4530 = _4528 * 0.5;
    float _4532 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4534 = fma(_4530, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4532);
    float _4536 = 1.0 / _4534;
    float _4538 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4540 = _4536 * _4538;
    float _4542 = _4516 + _4365;
    float _4544 = abs(_4540);
    float _4546 = log2(_4544);
    bool _4548 = _4540 <= 8000.0;
    bool _4550 = isnan(_4540);
    bool _4552 = _4548 || _4550;
    bool _4554 = isnan(8000.0);
    bool _4556 = _4552 || _4554;
    float _4558 = float(_4556);
    float _4560 = _4546 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4562 = exp2(_4560);
    float _4564 = fma(_4562, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4566 = precise::clamp(_4564, 0.0, 1.0);
    float _4568 = _4542 * 0.5;
    float _4570 = fma(_4566, -2.0, 3.0);
    float _4572 = _4566 * _4566;
    out.m_89.z = _4568;
    out.m_89.w = _4365;
    float _4574 = _4572 * _4570;
    float _4576 = in.m_91.x;
    float _4578 = -_4574;
    float _4580 = _4578 + 1.0;
    float _4582 = fma(_4580, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4574);
    float _4584 = _4558 * _4582;
    out.gl_Position.x = _4437;
    out.gl_Position.y = _4433;
    out.gl_Position.z = _4516;
    out.gl_Position.w = _4365;
    float _4586 = _4584 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4588 = _4433;
    float _4590 = _4437;
    if (!_4494)
    {
        _4588 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4592 = _4588;
    float _4594 = _4592;
    float _4596 = _4592;
    if (!_4494)
    {
        _4590 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4598 = _4590;
    float _4600 = -_4441;
    float _4602 = _4600 + 1.0;
    float _4604 = _4602 * _4586;
    float _4606 = precise::clamp(_4604, 0.0, 1.0);
    float _4608 = -_4606;
    float _4610 = fma(_4608, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4612 = _4526 * _4457;
    float _4614 = -_4526;
    float _4616 = _4614 + 1.0;
    float _4618 = _4610 * _4576;
    float _4620 = _4468 * _4612;
    float _4622 = _4478 * _4612;
    float _4624 = _4468 * _4616;
    float _4626 = _4618 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4628 = fma(_4474, _4620, _4462);
    float _4630 = fma(_4476, _4620, _4464);
    float _4632 = fma(_4468, _4622, _4466);
    float _4634 = _4622;
    float _4636 = _4598;
    float _4638 = _4598;
    if (!_4494)
    {
        _4634 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4640 = _4634;
    out.m_93.x = _4626;
    out.m_95.x = _4628;
    out.m_95.y = _4630;
    out.m_95.z = _4632;
    out.m_95.w = _4624;
    bool _4642 = !_4494;
    float _4644 = _4640;
    float _4646 = _4640;
    if (!_4642)
    {
        bool _4648 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4650 = isnan(_4147);
        bool _4652 = _4648 || _4650;
        bool _4654 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4656 = _4652 || _4654;
        if (!_4656)
        {
            float _4658 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4660 = _4147 + _4658;
            float _4662 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4664 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4662;
            float _4666 = 1.0 / _4664;
            float _4668 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4670 = _4668 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4672 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4674 = _4672 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4676 = _4660 * _4666;
            float _4678 = precise::clamp(_4676, 0.0, 1.0);
            float _4680 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4682 = _4680 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4684 = fma(_4678, _4674, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4686 = fma(_4678, _4682, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4688 = fma(_4678, _4670, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _4638 = _4688;
            _4596 = _4686;
            _4646 = _4684;
            _4690 = true;
        }
        else
        {
            bool _4692 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4694 = isnan(_4147);
            bool _4696 = _4692 || _4694;
            bool _4698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4700 = _4696 || _4698;
            if (!_4700)
            {
                _4594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4702 = _4594;
            _4596 = _4702;
            if (!_4700)
            {
                _4636 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4704 = _4636;
            _4638 = _4704;
            if (!_4700)
            {
                _4644 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4706 = _4644;
            bool _4708 = !_4700;
            _4646 = _4706;
            if (!_4708)
            {
                bool _4710 = _4147 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4712 = isnan(_4147);
                bool _4714 = _4710 || _4712;
                bool _4716 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4718 = _4714 || _4716;
                if (!_4718)
                {
                    float _4720 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4722 = _4147 + _4720;
                    float _4724 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4726 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4724;
                    float _4728 = 1.0 / _4726;
                    float _4730 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4732 = _4730 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4734 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4736 = _4734 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4738 = _4722 * _4728;
                    float _4740 = precise::clamp(_4738, 0.0, 1.0);
                    float _4742 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4744 = _4742 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4746 = fma(_4740, _4736, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4748 = fma(_4740, _4744, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4750 = fma(_4740, _4732, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _4638 = _4750;
                    _4596 = _4748;
                    _4646 = _4746;
                    _4690 = true;
                }
                else
                {
                    _4638 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4646 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _4690 = false;
    float _4752 = _4638;
    float _4754 = _4596;
    float _4756 = _4646;
    float _4758 = _4752 * 0.586610972881317138671875;
    bool _4760 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = 1.0;
    float _4762 = fma(_4754, 0.298911988735198974609375, _4758);
    out.m_97.x = 0.0;
    float _4764 = fma(_4756, 0.114477999508380889892578125, _4762);
    float _4766 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _4768 = -_4764;
    float _4770 = _4768 + _4754;
    float _4772 = -_4764;
    float _4774 = _4772 + _4752;
    float _4776 = -_4764;
    float _4778 = _4776 + _4756;
    out.m_93.w = _4766;
    float _4780 = fma(_4770, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    float _4782 = fma(_4774, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    float _4784 = fma(_4778, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4764);
    out.m_99.x = _4780;
    out.m_99.y = _4782;
    out.m_99.z = _4784;
    if (!_4760)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4786 = -_4119;
    float _4788 = _4786 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4790 = -_4121;
    float _4792 = _4790 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4794 = -_4123;
    float _4796 = _4794 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4798 = _4788 * _4788;
    float _4800 = fma(_4792, _4792, _4798);
    float _4802 = fma(_4796, _4796, _4800);
    float _4804 = sqrt(_4802);
    float _4806 = rsqrt(_4802);
    float _4808 = -_4804;
    float _4810 = _4808 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4812 = _4810 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4814 = precise::clamp(_4812, 0.0, 1.0);
    float _4816 = _4792 * _4806;
    float _4818 = _4788 * _4806;
    float _4820 = abs(_4814);
    float _4822 = log2(_4820);
    float _4824 = _4796 * _4806;
    float _4826 = _4816 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4828 = _3945 * _4818;
    float _4830 = -_4818;
    float _4832 = -_4826;
    float _4834 = fma(_4830, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4832);
    float _4836 = fma(_3941, _4816, _4828);
    float _4838 = -_4824;
    float _4840 = fma(_4838, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4834);
    float _4842 = fma(_3949, _4824, _4836);
    float _4844 = precise::clamp(_4842, 0.0, 1.0);
    float _4846 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4848 = _4840 + _4846;
    float _4850 = _4822 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4852 = _4848 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4854 = precise::clamp(_4852, 0.0, 1.0);
    float _4856 = exp2(_4850);
    float _4858 = _4856 * _4854;
    float _4860 = _4844 * _4858;
    float _4862 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4864 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4866 = _4860 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _4862;
    out.m_97.y = _4864;
    out.m_97.z = _4866;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

