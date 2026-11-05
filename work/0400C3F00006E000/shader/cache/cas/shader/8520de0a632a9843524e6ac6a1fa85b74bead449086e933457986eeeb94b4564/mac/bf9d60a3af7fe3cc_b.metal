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
    float4 m_63 [[user(locn1)]];
    float4 m_67 [[user(locn2)]];
    float4 m_85 [[user(locn3)]];
    float4 m_93 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_79 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_77 [[user(locn9)]];
    float4 m_91 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_89 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_75 [[attribute(8)]];
    float4 m_61 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4714 = false;
    bool _3977 = false;
    bool _528 = false;
    bool _412 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4998 = as_type<float>(_126);
        out.gl_Position.z = _4998;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5068 = as_type<float>(_166);
        out.gl_Position.z = _5068;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _144 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = 1.0 / _218;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _230;
    float _234 = 1.0 / _214;
    float _236 = _202 * _224;
    bool _238 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _240 = isnan(_198);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    bool _250 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_198);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = _206 * _228;
    bool _264 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_198);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_248;
    float _278 = _276 + 1.0;
    float _280 = _274 * _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _210 * _234;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -_274;
    float _306 = _304 + 1.0;
    float _308 = fma(_232, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _310 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _314 = -_260;
    float _316 = _314 + 1.0;
    float _318 = _260 * _306;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = _292 * _316;
    float _330 = -_292;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = _310 * _328;
    float _340 = _312 * _328;
    float _342 = _308 * _328;
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _338);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _340);
    float _348 = fma(_336, _236, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _350;
    float _354 = fma(_322, _236, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_326, _236, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].z, _342);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_348, _318, _344);
    float _370 = fma(_352, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_362, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_366, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_354, _318, _346);
    float _378 = fma(_356, _318, _358);
    float _380 = fma(_372, _280, _368);
    float _382 = fma(_370, _280, _376);
    float _384 = fma(_374, _280, _378);
    float _386 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_226;
    float _410;
    if (!_392)
    {
        float _394 = in.m_55.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_112);
        float _416 = 1.0 / _414;
        float _418 = _144 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    bool _422 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _424 = isnan(_420);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _438 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _440 = isnan(_420);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _420 + _454;
    float _458 = -_432;
    float _460 = _458 + 1.0;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _464 = 1.0 / _436;
    float _466 = _448 * _460;
    float _468 = -_448;
    float _470 = _468 + 1.0;
    float _472 = _452 * _464;
    float _474 = fma(_472, _456, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = _474 * _466;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = in.m_57.z;
    float _488 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _490 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[116].x, _488);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = _494 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _490;
    out.m_59.y = _492;
    out.m_59.z = _500;
    out.m_59.w = _498;
    float _502 = _388 * _484;
    float _504 = _390 * _486;
    float _506 = _386 * _482;
    bool _508 = !_462;
    float _526;
    if (!_508)
    {
        float _510 = in.m_55.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _144 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.w;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _546 = _544 != 0;
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _550 = int(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _552;
    float _556 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _558 = int(_556);
    float _560 = float(_540);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _566 = float(_550);
    float _568 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _570 = int(_568);
    float _572 = float(_558);
    float _574 = 1.0 / _560;
    float _576 = 1.0 / _566;
    float _578 = in.m_55.x;
    float _580 = float(uint(_570));
    int _582 = ~_570;
    int _584 = _582 + 1;
    bool _586 = _570 == 0;
    float _588 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _590 = int(_588);
    float _592 = _574 * _144;
    float _594 = _566;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_546)
    {
        _594 = 1.0;
    }
    float _598 = _594;
    float _600 = _598;
    if (!_546)
    {
        _600 = 7.345489978790283203125;
    }
    float _602 = _600;
    float _604 = 1.0 / _572;
    float _606 = _576 * _144;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _610 = int(_608);
    float _612 = float(uint(_590));
    int _614 = ~_590;
    int _616 = _614 + 1;
    int _618 = ~_590;
    int _620 = _618 + 1;
    float _622 = _604 * _144;
    float _624 = 1.0 / _580;
    float _626 = float(uint(_610));
    float _628 = trunc(_592);
    int _630 = int(_628);
    int _632 = ~_610;
    int _634 = _632 + 1;
    float _636 = 1.0 / _612;
    int _638 = as_type<int>(_624) + (-2);
    float _640 = _624;
    int _642 = _638;
    if (_546)
    {
        _640 = _578;
    }
    float _644 = _640;
    float _646 = trunc(_606);
    int _648 = int(_646);
    float _650 = in.m_55.y;
    float _652 = 1.0 / _626;
    int _654 = as_type<int>(_636) + (-2);
    float _656 = trunc(_622);
    int _658 = int(_656);
    float _660 = _602 * _578;
    float _662 = float(uint(_630));
    float _664 = float(uint(_648));
    float _666 = as_type<float>(_638) * _662;
    int _668 = as_type<int>(_652) + (-2);
    float _670 = as_type<float>(_654) * _664;
    float _672 = _664;
    float _674 = _644;
    if (_546)
    {
        _672 = 1.0;
    }
    float _676 = _672;
    float _678 = trunc(_666);
    float _680 = precise::max(_678, 0.0);
    uint _683 = uint(_680);
    float _685 = _676;
    if (!_546)
    {
        _674 = _650;
    }
    float _687 = _674;
    float _689 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_546)
    {
        _685 = 1.2345600128173828125;
    }
    float _691 = _685;
    float _693 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _564);
    float _695 = float(uint(_658));
    float _697 = trunc(_670);
    float _699 = precise::max(_697, 0.0);
    uint _701 = uint(_699);
    float _703 = in.m_55.z;
    float _705 = as_type<float>(_668) * _695;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _711 = uint(_709);
    float _713 = _687 * _691;
    int _715 = _584 * int(_683);
    int _717 = _715 + _630;
    int _719 = ~_610;
    int _721 = _719 + 1;
    int _723 = _616 * int(_701);
    int _725 = _723 + _648;
    float _727 = float(uint(_717));
    float _729 = floor(_660);
    float _731 = float(uint(_725));
    float _733 = as_type<float>(_638) * _727;
    float _735 = _727;
    float _737 = _731;
    if (_546)
    {
        _735 = _578;
    }
    float _739 = _735;
    int _741 = _721 * int(_711);
    int _743 = _741 + _658;
    float _745 = _739;
    if (!_546)
    {
        _745 = _703;
    }
    float _747 = _745;
    float _749 = as_type<float>(_654) * _731;
    float _751 = trunc(_733);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    if (_546)
    {
        _737 = 1.0;
    }
    float _757 = _737;
    float _759 = float(uint(_743));
    float _761 = _757;
    if (!_546)
    {
        _761 = 5.839270114898681640625;
    }
    float _763 = _761;
    float _765 = -_729;
    float _767 = _660 + _765;
    float _769 = as_type<float>(_668) * _759;
    float _771 = trunc(_749);
    float _773 = precise::max(_771, 0.0);
    uint _775 = uint(_773);
    float _777 = _747 * _763;
    int _779 = ~_610;
    int _781 = _779 + 1;
    float _783 = float(_630);
    int _785 = int(_683) + int(_755);
    float _787 = floor(_713);
    int _789 = ~_570;
    int _791 = _789 + 1;
    int _793 = _791 * _785;
    int _795 = _793 + _630;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _799 = _797 != 0;
    float _801 = trunc(_769);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    int _807 = int(_701) + int(_775);
    float _809 = float(_570);
    bool _811 = uint(_795) >= uint(_570);
    bool _813 = _783 >= _809;
    bool _815 = isnan(_783);
    bool _817 = _813 || _815;
    bool _819 = isnan(_809);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = floor(_777);
    float _827 = -_787;
    float _829 = _713 + _827;
    int _831 = ~_590;
    int _833 = _831 + 1;
    float _835 = float(_112);
    int _837 = _833 * _807;
    int _839 = _837 + _648;
    int _841 = int(_711) + int(_805);
    float _843 = trunc(_823);
    int _845 = int(_843);
    float _847 = _767 * _809;
    bool _849 = uint(_839) >= uint(_590);
    float _851 = float(_590);
    int _853 = _781 * _841;
    int _855 = _853 + _658;
    float _857 = -_825;
    float _859 = _777 + _857;
    float _861 = trunc(_847);
    int _863 = int(_861);
    bool _865 = !_811;
    int _867 = _865 ? 0 : (-1);
    float _869 = _851 * _829;
    bool _871 = uint(_855) >= uint(_610);
    int _873 = ~_785;
    int _875 = _873 + _867;
    int _877 = _875 + 1;
    bool _879 = !_871;
    int _881 = _879 ? 0 : (-1);
    float _883 = trunc(_869);
    int _885 = int(_883);
    bool _887 = !_799;
    int _889 = _887 ? 0 : 1;
    int _891 = _570 * _877;
    int _893 = _891 + _630;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _897 = _895 != 0;
    int _899 = ~_841;
    int _901 = _899 + _881;
    int _903 = _901 + 1;
    int _905 = abs(_889);
    float _907 = 1.0 / _835;
    bool _909 = !_897;
    int _911 = _909 ? 0 : 1;
    int _913 = _610 * _903;
    int _915 = _913 + _658;
    float _917 = float(_648);
    int _919 = _863 * _905;
    int _921 = _919 + _630;
    bool _923 = !_849;
    int _925 = _923 ? 0 : (-1);
    float _927 = _809 * _144;
    int _929 = abs(_911);
    bool _931 = _917 >= _851;
    bool _933 = isnan(_917);
    bool _935 = _931 || _933;
    bool _937 = isnan(_851);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    int _943 = ~_807;
    int _945 = _943 + _925;
    int _947 = _945 + 1;
    int _949 = _885 * _929;
    int _951 = _949 + _648;
    int _953 = ~_845;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    bool _959 = !_586;
    int _961 = _959 ? _893 : (-1);
    int _963 = _590 * _947;
    int _965 = _963 + _648;
    float _967 = trunc(_941);
    int _969 = int(_967);
    float _971 = float(_658);
    int _973 = _961 * _957;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _985 = _983 != 0;
    float _987 = _927 * _907;
    float _989 = float(_610);
    float _991 = _907 * _144;
    int _993 = _570 + (-1);
    float _995 = trunc(_987);
    int _997 = int(_995);
    bool _999 = _971 >= _989;
    bool _1001 = isnan(_971);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_989);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = _851 * _991;
    bool _1013 = !_981;
    int _1015 = _1013 ? 0 : 1;
    int _1017 = _845 * _993;
    int _1019 = _1017 + _973;
    bool _1021 = _590 == 0;
    float _1023 = _989 * _859;
    int _1025 = abs(_1015);
    float _1027 = trunc(_1009);
    int _1029 = int(_1027);
    bool _1031 = !_977;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_985;
    int _1037 = _1035 ? 0 : 1;
    int _1039 = _1019 * _1025;
    int _1041 = abs(_1033);
    bool _1043 = !_1021;
    int _1045 = _1043 ? _965 : (-1);
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1049 = _1047 != 0;
    int _1051 = abs(_1037);
    int _1053 = ~_969;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    bool _1059 = !_1049;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = _1057 * _1045;
    bool _1065 = _610 == 0;
    int _1067 = _997 * _1041;
    int _1069 = _1067 + _1039;
    int _1071 = abs(_1061);
    int _1073 = ~_1029;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    int _1079 = _921 * _1051;
    int _1081 = _1079 + _1069;
    bool _1083 = !_1065;
    int _1085 = _1083 ? _915 : (-1);
    float _1087 = in.m_61.x;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1091 = _1089 != 0;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1095 = _1093 != 0;
    int _1097 = _1077 * _1085;
    int _1099 = _590 + (-1);
    int _1101 = _863 * _1071;
    int _1103 = _1101 + _1081;
    float _1105 = trunc(_1011);
    int _1107 = int(_1105);
    bool _1109 = !_1095;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _969 * _1099;
    int _1115 = _1113 + _1063;
    float _1117 = float(uint(_1103));
    int _1119 = _610 + (-1);
    bool _1121 = !_1091;
    int _1123 = _1121 ? 0 : 1;
    float _1125 = as_type<float>(_638) * _1117;
    int _1127 = abs(_1111);
    int _1129 = _1029 * _1119;
    int _1131 = _1129 + _1097;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1139 = _1137 != 0;
    int _1141 = abs(_1123);
    int _1143 = _1115 * _1127;
    bool _1145 = !_1135;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = trunc(_1125);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1161 = _1159 != 0;
    int _1163 = _1107 * _1141;
    int _1165 = _1163 + _1143;
    bool _1167 = !_1139;
    int _1169 = _1167 ? 0 : 1;
    int _1171 = abs(_1147);
    float _1173 = _989 * _991;
    bool _1175 = !_1161;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = trunc(_1023);
    int _1181 = int(_1179);
    int _1183 = ~_570;
    int _1185 = _1183 + 1;
    int _1187 = abs(_1169);
    int _1189 = abs(_1177);
    float _1191 = trunc(_1173);
    int _1193 = int(_1191);
    int _1195 = _951 * _1171;
    int _1197 = _1195 + _1165;
    int _1199 = _1131 * _1189;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1203 = _1201 != 0;
    int _1205 = _1185 * int(_1153);
    int _1207 = _1205 + _1103;
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1211 = _1209 != 0;
    int _1213 = _885 * _1187;
    int _1215 = _1213 + _1197;
    bool _1217 = !_1203;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = float(uint(_1207));
    float _1223 = float(uint(_1215));
    bool _1225 = !_1157;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = as_type<float>(_638) * _1221;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1233 = _1231 != 0;
    float _1235 = as_type<float>(_654) * _1223;
    int _1237 = abs(_1227);
    float _1239 = trunc(_1229);
    float _1241 = precise::max(_1239, 0.0);
    uint _1243 = uint(_1241);
    int _1245 = abs(_1219);
    bool _1247 = !_1233;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = trunc(_1235);
    float _1253 = precise::max(_1251, 0.0);
    uint _1255 = uint(_1253);
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1259 = _1257 != 0;
    int _1261 = _1193 * _1237;
    int _1263 = _1261 + _1199;
    float _1265 = as_type<float>(_1245);
    float _1267 = as_type<float>(_1237);
    bool _1269 = _1135;
    if (!_1211)
    {
        _1265 = _1087;
    }
    float _1271 = _1265;
    int _1273 = _1181 * _1245;
    int _1275 = _1273 + _658;
    int _1277 = abs(_1249);
    float _1279 = _1271;
    if (!_1211)
    {
        _1267 = _1271;
    }
    float _1281 = _1267;
    bool _1283 = !_1259;
    int _1285 = _1283 ? 0 : 1;
    int _1287 = _1285;
    float _1289 = _1281;
    if (_1211)
    {
        _1279 = _1087;
    }
    float _1291 = _1279;
    int _1293 = ~_590;
    int _1295 = _1293 + 1;
    int _1297 = abs(_1285);
    int _1299 = _1297;
    if (_1211)
    {
        float _1301 = -_1291;
        float _1303 = _1301 + 1.0;
        _1287 = as_type<int>(_1303);
    }
    int _1305 = _1287;
    int _1307 = int(_1153) + int(_1243);
    int _1309 = _1295 * int(_1255);
    int _1311 = _1309 + _1215;
    if (_1211)
    {
        bool _1313 = _578 > 0.5;
        _1269 = _1313;
    }
    bool _1315 = _1269;
    int _1317 = _1275 * _1277;
    int _1319 = _1317 + _1263;
    float _1321 = in.m_61.y;
    int _1323 = ~_570;
    int _1325 = _1323 + 1;
    float _1327 = as_type<float>(_1297);
    if (_1211)
    {
        float _1329 = _1315 ? as_type<float>(_1305) : _1291;
        _1289 = _1329;
    }
    float _1331 = _1289;
    int _1333 = _1181 * _1297;
    int _1335 = _1333 + _1319;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1339 = _1337 != 0;
    int _1341 = _1325 * _1307;
    int _1343 = _1341 + _1103;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1347 = _1345 != 0;
    float _1349 = float(uint(_1335));
    float _1351 = float(uint(_1311));
    bool _1353 = uint(_1343) >= uint(_570);
    float _1355 = as_type<float>(_668) * _1349;
    int _1357 = ~_610;
    int _1359 = _1357 + 1;
    float _1361 = as_type<float>(_654) * _1351;
    bool _1363 = !_1353;
    int _1365 = _1363 ? 0 : (-1);
    float _1367 = _1349;
    if (_1339)
    {
        float _1369 = -_1291;
        float _1371 = _1369 + 1.0;
        _1299 = as_type<int>(_1371);
    }
    int _1373 = _1299;
    bool _1375 = _703 > 0.5;
    float _1377 = trunc(_1355);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    int _1383 = _1373;
    if (!_1339)
    {
        _1327 = _1291;
    }
    float _1385 = _1327;
    float _1387 = _1385;
    if (_1339)
    {
        float _1389 = _1375 ? as_type<float>(_1373) : _1291;
        _1387 = _1389;
    }
    float _1391 = _1387;
    if (_1347)
    {
        float _1393 = -_1291;
        float _1395 = _1393 + 1.0;
        _1383 = as_type<int>(_1395);
    }
    int _1397 = _1383;
    bool _1399 = _650 > 0.5;
    if (!_1347)
    {
        _1367 = _1291;
    }
    float _1401 = _1367;
    float _1403 = trunc(_1361);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    float _1409 = _1401;
    if (_1347)
    {
        float _1411 = _1399 ? as_type<float>(_1397) : _1291;
        _1409 = _1411;
    }
    float _1413 = _1409;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1417 = _1415 != 0;
    int _1419 = ~_590;
    int _1421 = _1419 + 1;
    int _1423 = _1359 * int(_1381);
    int _1425 = _1423 + _1335;
    float _1427 = -_1321;
    float _1429 = _1427 + 1.0;
    int _1431 = ~_1307;
    int _1433 = _1431 + _1365;
    int _1435 = _1433 + 1;
    bool _1437 = _570 == 0;
    int _1439 = _1399 ? as_type<int>(_1429) : as_type<int>(_1321);
    int _1441 = _570 * _1435;
    int _1443 = _1441 + _1103;
    bool _1445 = _542 > 0.5;
    float _1447 = _1417 ? as_type<float>(_1439) : _1321;
    int _1449 = int(_1255) + int(_1407);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1453 = _1451 != 0;
    float _1455 = float(uint(_1425));
    int _1457 = _1421 * _1449;
    int _1459 = _1457 + _1215;
    int _1461 = _1445 ? as_type<int>(_1429) : as_type<int>(_1321);
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1465 = _1463 != 0;
    float _1467 = as_type<float>(_668) * _1455;
    bool _1469 = !_1437;
    int _1471 = _1469 ? _1443 : (-1);
    float _1473 = _1465 ? as_type<float>(_1461) : _1321;
    bool _1475 = uint(_1459) >= uint(_590);
    float _1477 = trunc(_1467);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    float _1483 = _1321;
    if (_1453)
    {
        float _1485 = _1375 ? _1429 : _1321;
        _1483 = _1485;
    }
    float _1487 = _1483;
    bool _1489 = !_1475;
    int _1491 = _1489 ? 0 : (-1);
    int _1493 = _1471 & 3;
    bool _1495 = _1493 != 0;
    int _1497 = _1471 & 3;
    bool _1499 = _1497 != 0;
    int _1501 = ~_1449;
    int _1503 = _1501 + _1491;
    int _1505 = _1503 + 1;
    int _1507 = _1495 ? 0 : 1;
    bool _1509 = uint(_1497) > 1u;
    int _1511 = _590 * _1505;
    int _1513 = _1511 + _1215;
    bool _1515 = uint(_1497) >= 2u;
    int _1517 = ~_610;
    int _1519 = _1517 + 1;
    int _1521 = _1515 ? 0 : 1;
    bool _1523 = _590 == 0;
    bool _1525 = _1497 != 3;
    int _1527 = int(_1381) + int(_1481);
    bool _1529 = !_1523;
    int _1531 = _1529 ? _1513 : (-1);
    int _1533 = ~_1507;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    int _1539 = _1537;
    if (!_1509)
    {
        int _1541 = ~_1507;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    int _1547 = _1519 * _1527;
    int _1549 = _1547 + _1335;
    int _1551 = _1531 & 3;
    bool _1553 = _1551 != 0;
    float _1555 = _578 * 2.0;
    int _1557 = ~_1521;
    int _1559 = _1557 + 1;
    int _1561 = _1559 + 1;
    int _1563 = _1553 ? 0 : 1;
    bool _1565 = uint(_1549) >= uint(_610);
    float _1567 = floor(_1555);
    int _1569 = _1561;
    if (_1525)
    {
        int _1571 = ~_1521;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    bool _1577 = uint(_1551) >= 2u;
    bool _1579 = !_1565;
    int _1581 = _1579 ? 0 : (-1);
    float _1583 = float(uint(_921));
    int _1585 = _1577 ? 0 : 1;
    bool _1587 = _1551 != 3;
    float _1589 = as_type<float>(_638) * _1583;
    int _1591 = ~_1527;
    int _1593 = _1591 + _1581;
    int _1595 = _1593 + 1;
    bool _1597 = uint(_1551) > 1u;
    float _1599 = trunc(_1589);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = float(uint(_951));
    int _1607 = _610 * _1595;
    int _1609 = _1607 + _1335;
    float _1611 = float(uint(_1275));
    int _1613 = ~_1585;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = as_type<float>(_654) * _1605;
    bool _1621 = !_1065;
    int _1623 = _1621 ? _1609 : (-1);
    float _1625 = as_type<float>(_668) * _1611;
    int _1627 = _1617;
    if (_1587)
    {
        int _1629 = ~_1585;
        int _1631 = _1629 + 1;
        _1627 = _1631;
    }
    int _1633 = _1627;
    float _1635 = _650 * 2.0;
    int _1637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1639 = _1637 != 0;
    float _1641 = trunc(_1619);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    int _1647 = ~_1563;
    int _1649 = _1647 + 1;
    int _1651 = _1649 + 1;
    int _1653 = _1651;
    if (!_1597)
    {
        int _1655 = ~_1563;
        int _1657 = _1655 + 1;
        _1653 = _1657;
    }
    int _1659 = _1653;
    bool _1661 = !_1639;
    int _1663 = _1661 ? 0 : 1;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1667 = _1665 != 0;
    float _1669 = trunc(_1625);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = ~_570;
    int _1677 = _1675 + 1;
    int _1679 = _1623 & 3;
    bool _1681 = _1679 != 0;
    bool _1683 = !_1667;
    int _1685 = _1683 ? 0 : 1;
    int _1687 = _1677 * int(_1603);
    int _1689 = _1687 + _921;
    bool _1691 = _1679 != 3;
    float _1693 = floor(_1635);
    int _1695 = _620 * int(_1645);
    int _1697 = _1695 + _951;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1701 = _1699 != 0;
    float _1703 = float(uint(_1689));
    float _1705 = float(uint(_1697));
    int _1707 = _634 * int(_1673);
    int _1709 = _1707 + _1275;
    int _1711 = _1681 ? 0 : 1;
    float _1713 = as_type<float>(_638) * _1703;
    bool _1715 = uint(_1679) >= 2u;
    float _1717 = as_type<float>(_654) * _1705;
    bool _1719 = _1567 >= 0.0;
    bool _1721 = isnan(_1567);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan(0.0);
    bool _1727 = _1723 || _1725;
    float _1729 = trunc(_1713);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    int _1735 = _1715 ? 0 : 1;
    bool _1737 = uint(_1679) > 1u;
    int _1739 = ~_1735;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = _1743;
    if (_1691)
    {
        int _1747 = ~_1735;
        int _1749 = _1747 + 1;
        _1745 = _1749;
    }
    int _1751 = _1745;
    float _1753 = trunc(_1717);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    float _1759 = float(uint(_1709));
    bool _1761 = _1567 > 0.0;
    int _1763 = ~_1711;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = as_type<float>(_668) * _1759;
    int _1771 = _1727 ? 0 : 1;
    int _1773 = _1767;
    if (_1701)
    {
        _642 = 0;
    }
    int _1775 = _642;
    int _1777 = _1775;
    if (!_1737)
    {
        int _1779 = ~_1711;
        int _1781 = _1779 + 1;
        _1773 = _1781;
    }
    int _1783 = _1773;
    float _1785 = trunc(_1769);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    if (!_1701)
    {
        _1777 = 2;
    }
    int _1791 = _1777;
    bool _1793 = _1693 > 0.0;
    int _1795 = ~_1771;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = _1799;
    if (!_1761)
    {
        int _1803 = ~_1771;
        int _1805 = _1803 + 1;
        _1801 = _1805;
    }
    int _1807 = _1801;
    bool _1809 = _1693 >= 0.0;
    bool _1811 = isnan(_1693);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    bool _1819 = _1791 != 2;
    int _1821 = int(_1603) + int(_1733);
    int _1823 = ~_570;
    int _1825 = _1823 + 1;
    float _1827 = as_type<float>(_1733);
    if (_1701)
    {
        _596 = 0;
    }
    int _1829 = _596;
    float _1831 = _1817 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1833 = _1825 * _1821;
    int _1835 = _1833 + _921;
    int _1837 = _1829;
    float _1839 = _1831;
    if (!_1701)
    {
        _1837 = 1;
    }
    int _1841 = _1837;
    int _1843 = int(_1645) + int(_1757);
    int _1845 = ~_590;
    int _1847 = _1845 + 1;
    int _1849 = int(_1673) + int(_1789);
    int _1851 = ~_610;
    int _1853 = _1851 + 1;
    int _1855 = _1847 * _1843;
    int _1857 = _1855 + _951;
    int _1859 = ~as_type<int>(_1831);
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1863;
    float _1867 = as_type<float>(_1789);
    float _1869 = as_type<float>(_1757);
    if (!_1793)
    {
        int _1871 = ~as_type<int>(_1831);
        int _1873 = _1871 + 1;
        _1865 = _1873;
    }
    int _1875 = _1865;
    int _1877 = _1853 * _1849;
    int _1879 = _1877 + _1275;
    bool _1881 = _1841 != 1;
    bool _1883 = uint(_1835) >= uint(_570);
    float _1885 = in.m_48.x;
    float _1887 = in.m_48.y;
    float _1889 = in.m_48.z;
    if (_1819)
    {
        _1839 = _578;
    }
    float _1891 = _1839;
    float _1893 = _1891;
    if (_1819)
    {
        _1867 = _650;
    }
    float _1895 = _1867;
    float _1897 = _1895;
    if (!_1819)
    {
        _1893 = _703;
    }
    float _1899 = _1893;
    if (!_1819)
    {
        _1897 = _578;
    }
    float _1901 = _1897;
    bool _1903 = uint(_1857) >= uint(_590);
    bool _1905 = !_1883;
    int _1907 = _1905 ? 0 : (-1);
    bool _1909 = uint(_1879) >= uint(_610);
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1913 = _1911 != 0;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1917 = _1915 != 0;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1921 = _1919 != 0;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1927 = !_1909;
    int _1929 = _1927 ? 0 : (-1);
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1933 = _1931 != 0;
    float _1935 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1937 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1939 = 1.0 / _1925;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1943 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1947 = _578 + _650;
    float _1949 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1935);
    float _1951 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1937);
    float _1953 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1943);
    float _1955 = fma(_689, -2.0, _1945);
    float _1957 = _1947 + (-1.0);
    bool _1959 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1961 = isnan(_536);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1967 = _1963 || _1965;
    float _1969 = float(_1967);
    float _1971 = _703 * 2.0;
    float _1973 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1977 = !_1903;
    int _1979 = _1977 ? 0 : (-1);
    float _1981 = floor(_1971);
    float _1983 = _554 * _1939;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1987 = _536 + _1985;
    bool _1989 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1991 = isnan(_536);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = -_1969;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1941;
    float _2007 = fma(_1973, 2.0, _2005);
    float _2009 = _650 + _703;
    float _2011 = fma(_1983, _1987, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2013 = _1999 * _2003;
    float _2015 = _2009 + (-1.0);
    float _2017 = -_1999;
    float _2019 = _2017 + 1.0;
    float _2021 = _2011 * _2013;
    float _2023 = 0.0;
    if (!_1881)
    {
        _2023 = _650;
    }
    float _2025 = _2023;
    float _2027 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2029 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2021);
    bool _2031 = _1981 >= 0.0;
    bool _2033 = isnan(_1981);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan(0.0);
    bool _2039 = _2035 || _2037;
    float _2041 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1949);
    float _2043 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2029);
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2047 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1951);
    float _2049 = _1899 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2051 = _2039 ? 0 : 1;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2055 = _1981 > 0.0;
    float _2057 = -_2045;
    float _2059 = fma(_2049, 2.0, _2057);
    float _2061 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2063 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2067 = _2025;
    if (!_1881)
    {
        _1827 = _2025;
    }
    float _2069 = _1827;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2073 = _2069;
    if (_1881)
    {
        _2067 = _578;
    }
    float _2075 = _2067;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2079 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2083 = ~_2051;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = _2047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2091 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2077);
    float _2093 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1953);
    int _2095 = _2087;
    if (!_2055)
    {
        int _2097 = ~_2051;
        int _2099 = _2097 + 1;
        _2095 = _2099;
    }
    int _2101 = _2095;
    out.m_63.x = _2061;
    out.m_63.y = _2079;
    out.m_63.z = _2081;
    out.m_63.w = _2063;
    int _2103 = _1471 >> 31;
    float _2105 = -_144;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2059);
    float _2109 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2091);
    int _2111 = ~_1821;
    int _2113 = _2111 + _1907;
    int _2115 = _2113 + 1;
    float _2117 = _2041 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2121 = _2089 + _2119;
    float _2123 = 0.0;
    if (!_1881)
    {
        _2123 = _703;
    }
    float _2125 = _2123;
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2129 = _2125;
    if (_1881)
    {
        _2129 = _650;
    }
    float _2131 = _2129;
    float _2133 = _2093 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2137 = _2117 + _2135;
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2141 = _2103 & 3;
    float _2143 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2127);
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2147 = _2133 + _2145;
    float _2149 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2139);
    int _2151 = _1471 + _2141;
    int _2153 = _570 * _2115;
    int _2155 = _2153 + _921;
    if (!_1881)
    {
        _1869 = _703;
    }
    float _2157 = _1869;
    float _2159 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2149);
    int _2161 = _2151 >> 2;
    float _2163 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2143);
    float _2165 = _2157;
    if (_1881)
    {
        _2165 = _650;
    }
    float _2167 = _2165;
    int _2169 = _2161 << 4;
    int _2171 = _2169 + 368;
    int _2173 = _1531 >> 31;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2177 = _2159 >= 0.0;
    uint _2179 = uint(int(uint(_2171) >> uint(2)));
    uint _2181 = uint(int(uint(int(_2179)) >> uint(2)));
    int _2183 = int(_2179) & 3;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[int(_2181)][_2183];
    int _2187 = int(_2179) + 1;
    uint _2189 = uint(int(uint(_2187) >> uint(2)));
    int _2191 = _2187 & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = _2173 & 3;
    float _2197 = fma(_2175, -2.0, _562);
    if (_1881)
    {
        _2073 = _578;
    }
    float _2199 = _2073;
    int _2201 = _1531 + _2195;
    float _2203 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2197);
    bool _2205 = !_1913;
    int _2207 = _2205 ? 0 : 1;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2211 = !_1917;
    int _2213 = _2211 ? 0 : 1;
    if (_2177)
    {
        out.m_51.x = 0.0;
    }
    int _2215 = _2201 >> 2;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2219 = abs(_2207);
    float _2221 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2223 = _2215 << 4;
    int _2225 = _2223 + 512;
    float _2227 = -_2217;
    float _2229 = fma(_2209, 2.0, _2227);
    int _2231 = abs(_2213);
    float _2233 = in.m_65.x;
    float _2235 = in.m_65.y;
    float _2237 = in.m_65.z;
    float _2239 = float(_1807);
    float _2241 = -_144;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2229);
    float _2245 = float(_2101);
    float _2247 = float(_2219);
    bool _2249 = _570 == 0;
    uint _2251 = uint(int(uint(_2225) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = _2247 * _2245;
    float _2269 = 0.0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].y);
    if (_2177)
    {
        _2269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2273 = _2269;
    int _2275 = abs(_1545);
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2279 = _2267 * (-2.0);
    int _2281 = _2171 + 8;
    uint _2283 = uint(int(uint(_2281) >> uint(2)));
    uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
    int _2287 = int(_2283) & 3;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[int(_2285)][_2287];
    int _2291 = int(_2283) + 1;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    int _2295 = _2291 & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    if (_2177)
    {
        float _2299 = _2273 * 5.0;
        _2271 = as_type<int>(_2299);
    }
    int _2301 = _2271;
    float _2303 = fma(_2221, -2.0, _2277);
    int _2305 = ~_1843;
    int _2307 = _2305 + _1979;
    int _2309 = _2307 + 1;
    float _2311 = fma(_1975, _2279, _1975);
    int _2313 = abs(_1659);
    if (_2177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8210 = as_type<float>(_2301);
        out.gl_Position.z = _8210;
    }
    bool _2315 = !_2249;
    int _2317 = _2315 ? _2155 : (-1);
    float _2319 = fma(_2279, _2233, _2233);
    bool _2321 = !_1499;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2303);
    int _2327 = _1623 & 3;
    bool _2329 = _2327 != 0;
    int _2331 = _1531 & 3;
    bool _2333 = _2331 != 0;
    int _2335 = _590 * _2309;
    int _2337 = _2335 + _951;
    int _2339 = ~_1849;
    int _2341 = _2339 + _1929;
    int _2343 = _2341 + 1;
    float _2345 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2347 = int(_2345);
    bool _2349 = !_2333;
    int _2351 = _2349 ? 0 : 1;
    int _2353 = _2225 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    int _2371 = _1623 >> 31;
    int _2373 = _610 * _2343;
    int _2375 = _2373 + _1275;
    bool _2377 = _1497 != 3;
    int _2379 = _2371 & 3;
    int _2381 = ~_2275;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _1623 + _2379;
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2391 = int(_2389);
    int _2393 = _2385 * as_type<int>(_2193);
    int _2395 = abs(_2323);
    int _2397 = _2387 >> 2;
    int _2399 = abs(_1575);
    int _2401 = ~_2395;
    int _2403 = _2401 + 1;
    int _2405 = _2403 + 1;
    int _2407 = _2397 << 4;
    int _2409 = _2407 + 656;
    int _2411 = ~_2399;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    int _2417 = _2405 * as_type<int>(_2185);
    int _2419 = _2417 + _2393;
    int _2421 = ~_2313;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    uint _2427 = uint(int(uint(_2409) >> uint(2)));
    uint _2429 = uint(int(uint(int(_2427)) >> uint(2)));
    int _2431 = int(_2427) & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = int(_2427) + 1;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    int _2439 = _2435 & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    int _2443 = abs(_2351);
    bool _2445 = !_2377;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = _2425 * as_type<int>(_2265);
    bool _2451 = _1551 != 3;
    int _2453 = _2415 * as_type<int>(_2289);
    int _2455 = _2453 + _2419;
    int _2457 = ~_2443;
    int _2459 = _2457 + 1;
    int _2461 = _2459 + 1;
    float _2463 = float(uint(_2391));
    bool _2465 = !_2451;
    int _2467 = _2465 ? 0 : (-1);
    int _2469 = _2461 * as_type<int>(_2257);
    int _2471 = _2469 + _2449;
    float _2473 = 1.0 / _2463;
    int _2475 = abs(_1633);
    int _2477 = abs(_2447);
    int _2479 = abs(_2467);
    int _2481 = abs(_1685);
    int _2483 = abs(_1663);
    int _2485 = _2409 + 8;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    uint _2489 = uint(int(uint(int(_2487)) >> uint(2)));
    int _2491 = int(_2487) & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    int _2495 = int(_2487) + 1;
    uint _2497 = uint(int(uint(_2495) >> uint(2)));
    int _2499 = _2495 & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = ~_2475;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = float(uint(_2347));
    int _2511 = ~_2477;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    int _2517 = _2507 * as_type<int>(_2361);
    int _2519 = _2517 + _2471;
    int _2521 = ~_2479;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    float _2527 = 1.0 / _2509;
    int _2529 = ~_2483;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    int _2535 = _2515 * as_type<int>(_2297);
    int _2537 = _2535 + _2455;
    int _2539 = ~_2481;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    int _2545 = _2525 * as_type<int>(_2369);
    int _2547 = _2545 + _2519;
    bool _2549 = _590 == 0;
    int _2551 = _2537 * _2533;
    bool _2553 = _1679 != 3;
    int _2555 = _2543 * _2547;
    bool _2557 = !_2549;
    int _2559 = _2557 ? _2337 : (-1);
    int _2561 = _2317 * _2483;
    int _2563 = _2561 + _2551;
    bool _2565 = !_2329;
    int _2567 = _2565 ? 0 : 1;
    float _2569 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2571 = int(_2569);
    int _2573 = abs(_1751);
    int _2575 = _2559 * _2481;
    int _2577 = _2575 + _2555;
    int _2579 = abs(_2567);
    bool _2581 = !_2553;
    int _2583 = _2581 ? 0 : (-1);
    int _2585 = abs(_1783);
    float _2587 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2589 = log2(_2587);
    int _2591 = as_type<int>(_2527) + (-2);
    float _2593 = float(uint(_2563));
    int _2595 = abs(_2583);
    float _2597 = as_type<float>(_2591) * _2593;
    int _2599 = as_type<int>(_2473) + (-2);
    int _2601 = ~_2585;
    int _2603 = _2601 + 1;
    int _2605 = _2603 + 1;
    float _2607 = float(uint(_2577));
    float _2609 = trunc(_2597);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    int _2615 = ~_2579;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2605 * as_type<int>(_2441);
    float _2623 = as_type<float>(_2599) * _2607;
    int _2625 = _2619 * as_type<int>(_2433);
    int _2627 = _2625 + _2621;
    int _2629 = ~_2573;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    float _2635 = _2589 * _144;
    bool _2637 = !_1933;
    int _2639 = _2637 ? 0 : 1;
    float _2641 = trunc(_2623);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = ~_2595;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    int _2653 = _2633 * as_type<int>(_2493);
    int _2655 = _2653 + _2627;
    int _2657 = abs(_2639);
    int _2659 = ~_2347;
    int _2661 = _2659 + 1;
    int _2663 = _2651 * as_type<int>(_2501);
    int _2665 = _2663 + _2655;
    float _2667 = float(uint(_2571));
    float _2669 = exp2(_2635);
    int _2671 = ~_2391;
    int _2673 = _2671 + 1;
    int _2675 = ~_2657;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    bool _2681 = _610 == 0;
    int _2683 = _2661 * int(_2613);
    int _2685 = _2683 + _2563;
    int _2687 = abs(_2347);
    float _2689 = 1.0 / _2667;
    int _2691 = _2679 * _2665;
    bool _2693 = !_2681;
    int _2695 = _2693 ? _2375 : (-1);
    float _2697 = -_144;
    float _2699 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2007);
    float _2701 = float(uint(_2685));
    int _2703 = _2695 * _2657;
    int _2705 = _2703 + _2691;
    int _2707 = abs(_2391);
    int _2709 = _2673 * int(_2645);
    int _2711 = _2709 + _2577;
    float _2713 = as_type<float>(_2591) * _2701;
    float _2715 = float(uint(_2687));
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2719 = 1.0 + _2717;
    float _2721 = -_2669;
    float _2723 = _2721 + 1.0;
    float _2725 = float(uint(_2711));
    float _2727 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _693);
    float _2729 = 1.0 / _2715;
    int _2731 = as_type<int>(_2689) + (-2);
    float _2733 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2735 = as_type<float>(_2599) * _2725;
    int _2737 = abs(_2571);
    float _2739 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2733);
    float _2741 = float(uint(_2707));
    float _2743 = 1.0 / _2719;
    float _2745 = float(uint(_2737));
    float _2747 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2739);
    float _2749 = float(uint(_2705));
    float _2751 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1955);
    int _2753 = abs(_2563);
    float _2755 = 1.0 / _2741;
    float _2757 = as_type<float>(_2731) * _2749;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2761 = as_type<int>(_2729) + (-2);
    int _2763 = abs(_2577);
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2767 = 1.0 / _2745;
    float _2769 = float(uint(_2753));
    float _2771 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2759);
    bool _2773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2775 = isnan(1.0);
    bool _2777 = _2773 || _2775;
    bool _2779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2781 = _2777 || _2779;
    float _2783 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2765);
    float _2785 = float(uint(_2763));
    float _2787 = as_type<float>(_2761) * _2769;
    bool _2789 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2791 = isnan(0.0);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2797 = _2793 || _2795;
    float _2799 = trunc(_2757);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = as_type<int>(_2755) + (-2);
    float _2807 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2771);
    int _2809 = abs(_2705);
    float _2811 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2783);
    float _2813 = _2797 ? _2723 : 0.0;
    float _2815 = as_type<float>(_2805) * _2785;
    float _2817 = float(uint(_2809));
    float _2819 = trunc(_2787);
    float _2821 = precise::max(_2819, 0.0);
    uint _2823 = uint(_2821);
    int _2825 = as_type<int>(_2767) + (-2);
    float _2827 = _2121 * _2121;
    float _2829 = float(_2231);
    if (_2781)
    {
        float _2831 = _2813 * _2743;
        _148 = _2831;
    }
    float _2833 = _148;
    int _2835 = ~_2571;
    int _2837 = _2835 + 1;
    float _2839 = fma(_2137, _2137, _2827);
    float _2841 = as_type<float>(_2825) * _2817;
    float _2843 = trunc(_2815);
    float _2845 = precise::max(_2843, 0.0);
    uint _2847 = uint(_2845);
    float _2849 = _2829 * _2239;
    int _2851 = _2837 * int(_2803);
    int _2853 = _2851 + _2705;
    float _2855 = fma(_2147, _2147, _2839);
    int _2857 = ~_2687;
    int _2859 = _2857 + 1;
    float _2861 = _2849 * (-2.0);
    int _2863 = ~_2707;
    int _2865 = _2863 + 1;
    float _2867 = trunc(_2713);
    float _2869 = precise::max(_2867, 0.0);
    uint _2871 = uint(_2869);
    int _2873 = _2859 * int(_2823);
    int _2875 = _2873 + _2753;
    float _2877 = float(uint(_2853));
    float _2879 = fma(_2861, _2235, _2235);
    int _2881 = ~_2737;
    int _2883 = _2881 + 1;
    float _2885 = float(uint(_2875));
    float _2887 = trunc(_2841);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = _2865 * int(_2847);
    int _2895 = _2893 + _2763;
    int _2897 = ~_2347;
    int _2899 = _2897 + 1;
    float _2901 = rsqrt(_2855);
    float _2903 = trunc(_2735);
    float _2905 = precise::max(_2903, 0.0);
    uint _2907 = uint(_2905);
    int _2909 = _2883 * int(_2891);
    int _2911 = _2909 + _2809;
    float _2913 = float(uint(_2911));
    float _2915 = as_type<float>(_2731) * _2877;
    float _2917 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2919 = int(_2613) + int(_2871);
    float _2921 = as_type<float>(_2825) * _2913;
    float _2923 = float(uint(_2895));
    float _2925 = as_type<float>(_2761) * _2885;
    float _2927 = _2917 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2929 = int(_2645) + int(_2907);
    float _2931 = trunc(_2915);
    float _2933 = precise::max(_2931, 0.0);
    uint _2935 = uint(_2933);
    float _2937 = as_type<float>(_2805) * _2923;
    float _2939 = _2927 * _2901;
    int _2941 = ~_2391;
    int _2943 = _2941 + 1;
    float _2945 = _578 + (-0.5);
    float _2947 = _2121 * _2939;
    float _2949 = _2137 * _2939;
    float _2951 = trunc(_2937);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    float _2957 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2319);
    float _2959 = -_2947;
    float _2961 = _2121 + _2959;
    float _2963 = -_2949;
    float _2965 = _2137 + _2963;
    int _2967 = _2943 * _2929;
    int _2969 = _2967 + _2577;
    float _2971 = _2961 * _2961;
    int _2973 = ~_2707;
    int _2975 = _2973 + 1;
    float _2977 = trunc(_2925);
    float _2979 = precise::max(_2977, 0.0);
    uint _2981 = uint(_2979);
    int _2983 = int(_2803) + int(_2935);
    float _2985 = fma(_2965, _2965, _2971);
    int _2987 = ~_2687;
    int _2989 = _2987 + 1;
    float _2991 = _2147 * _2939;
    int _2993 = ~_2571;
    int _2995 = _2993 + 1;
    float _2997 = fma(_2311, _2833, _2957);
    bool _2999 = uint(_2969) >= uint(_2391);
    float _3001 = -_2991;
    float _3003 = _2147 + _3001;
    int _3005 = _2899 * _2919;
    int _3007 = _3005 + _2563;
    int _3009 = int(_2847) + int(_2955);
    float _3011 = trunc(_2921);
    float _3013 = precise::max(_3011, 0.0);
    uint _3015 = uint(_3013);
    int _3017 = _2995 * _2983;
    int _3019 = _3017 + _2705;
    bool _3021 = uint(_3007) >= uint(_2347);
    int _3023 = _2975 * _3009;
    int _3025 = _3023 + _2763;
    int _3027 = int(_2823) + int(_2981);
    float _3029 = _650 + (-0.5);
    bool _3031 = uint(_3019) >= uint(_2571);
    float _3033 = fma(_3003, _3003, _2985);
    int _3035 = ~_2737;
    int _3037 = _3035 + 1;
    int _3039 = _2989 * _3027;
    int _3041 = _3039 + _2753;
    float _3043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3045 = uint(_3025) >= uint(_2707);
    bool _3047 = !_3031;
    int _3049 = _3047 ? 0 : (-1);
    int _3051 = int(_2891) + int(_3015);
    float _3053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3055 = uint(_3041) >= uint(_2687);
    bool _3057 = !_3021;
    int _3059 = _3057 ? 0 : (-1);
    int _3061 = _3037 * _3051;
    int _3063 = _3061 + _2809;
    bool _3065 = !_2999;
    int _3067 = _3065 ? 0 : (-1);
    int _3069 = ~_2919;
    int _3071 = _3069 + _3059;
    int _3073 = _3071 + 1;
    float _3075 = _3043 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3077 = ~_2929;
    int _3079 = _3077 + _3067;
    int _3081 = _3079 + 1;
    float _3083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3085 = uint(_3063) >= uint(_2737);
    int _3087 = _2347 * _3073;
    int _3089 = _3087 + _2563;
    int _3091 = _2577 ^ _2391;
    int _3093 = _2391 * _3081;
    int _3095 = _3093 + _2577;
    bool _3097 = _2347 == 0;
    bool _3099 = !_3045;
    int _3101 = _3099 ? 0 : (-1);
    float _3103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3105 = _2391 == 0;
    bool _3107 = !_3085;
    int _3109 = _3107 ? 0 : (-1);
    bool _3111 = _2391 == 0;
    int _3113 = ~_2983;
    int _3115 = _3113 + _3049;
    int _3117 = _3115 + 1;
    bool _3119 = !_3097;
    int _3121 = _3119 ? _3089 : (-1);
    bool _3123 = !_3105;
    int _3125 = _3123 ? _3095 : (-1);
    int _3127 = _2705 ^ _2571;
    int _3129 = _2571 * _3117;
    int _3131 = _3129 + _2705;
    int _3133 = _2563 ^ _2347;
    int _3135 = ~_3101;
    int _3137 = _3009 + _3135;
    int _3139 = _3137 + 1;
    float _3141 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3143 = float(_3121);
    float _3145 = fma(_3075, _1331, -0.5);
    float _3147 = float(_3125);
    float _3149 = fma(_3141, _1391, -0.5);
    bool _3151 = _2571 == 0;
    float _3153 = fma(_3075, _3143, _2699);
    bool _3155 = _2571 == 0;
    float _3157 = fma(_3141, _3147, _2243);
    uint _3159 = uint(int(uint(_3091) >> uint(31)));
    float _3161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3163 = uint(int(uint(_3133) >> uint(31)));
    float _3165 = _3103 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3167 = !_3055;
    int _3169 = _3167 ? 0 : (-1);
    float _3171 = fma(_2747, _3145, _3153);
    uint _3173 = uint(int(uint(_3127) >> uint(31)));
    float _3175 = fma(_3165, _1413, -0.5);
    int _3177 = ~int(_3159);
    int _3179 = _3177 + 1;
    float _3181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3183 = !_3151;
    int _3185 = _3183 ? _3131 : (-1);
    float _3187 = fma(_2109, _3149, _3157);
    int _3189 = ~int(_3163);
    int _3191 = _3189 + 1;
    float _3193 = fma(_2027, _2861, _2027);
    int _3195 = ~_3169;
    int _3197 = _3027 + _3195;
    int _3199 = _3197 + 1;
    int _3201 = ~_3109;
    int _3203 = _3051 + _3201;
    int _3205 = _3203 + 1;
    int _3207 = ~int(_3173);
    int _3209 = _3207 + 1;
    int _3211 = _3139 ^ _3179;
    float _3213 = float(_3185);
    int _3215 = _3199 ^ _3191;
    int _3217 = _3205 ^ _3209;
    float _3219 = fma(_3165, _3213, _2107);
    int _3221 = ~_3179;
    int _3223 = _3221 + _3211;
    int _3225 = _3223 + 1;
    bool _3227 = _2347 == 0;
    float _3229 = fma(_2807, _3175, _3219);
    int _3231 = ~_3191;
    int _3233 = _3231 + _3215;
    int _3235 = _3233 + 1;
    float _3237 = _3083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3239 = ~_3209;
    int _3241 = _3239 + _3217;
    int _3243 = _3241 + 1;
    float _3245 = _3161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3247 = !_3111;
    int _3249 = _3247 ? _3225 : (-1);
    float _3251 = _3181 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3253 = !_3227;
    int _3255 = _3253 ? _3235 : (-1);
    float _3257 = fma(_1473, _3245, -0.5);
    bool _3259 = !_3155;
    int _3261 = _3259 ? _3243 : (-1);
    float _3263 = fma(_3251, _1487, -0.5);
    float _3265 = float(_3249);
    float _3267 = fma(_1447, _3237, -0.5);
    float _3269 = float(_3255);
    float _3271 = float(_3261);
    float _3273 = -_2203;
    float _3275 = fma(_3245, _3265, _3273);
    bool _3277 = !_1921;
    int _3279 = _3277 ? 0 : 1;
    float _3281 = -_2751;
    float _3283 = fma(_3237, _3269, _3281);
    float _3285 = _3229 + 0.5;
    float _3287 = -_2325;
    float _3289 = fma(_3251, _3271, _3287);
    float _3291 = fma(_2163, _3257, _3275);
    float _3293 = fma(_2727, _3267, _3283);
    float _3295 = _3171 + 0.5;
    float _3297 = fma(_2811, _3263, _3289);
    float _3299 = _3187 + 0.5;
    float _3301 = _3293 + 0.5;
    float _3303 = _3291 + 0.5;
    float _3305 = _3297 + 0.5;
    out.m_67.x = _3295;
    out.m_67.y = _3301;
    out.m_67.z = _3299;
    out.m_67.w = _3303;
    out.m_69.x = _3285;
    out.m_69.y = _3305;
    float _3307 = _3219;
    float _3309 = as_type<float>(_3063);
    float _3311 = _3229;
    if (_2177)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3313 = -_2947;
    float _3315 = _2089 + _3313;
    float _3317 = float(_1875);
    float _3319 = -_2949;
    float _3321 = _2117 + _3319;
    int _3323 = abs(_3279);
    float _3325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3327 = _3315 + _3325;
    float _3329 = -_2991;
    float _3331 = _2133 + _3329;
    float _3333 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3335 = _3321 + _3333;
    float _3337 = _578 + _703;
    float _3339 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3343 = _3331 + _3341;
    float _3345 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2879);
    float _3347 = _3337 + (-1.0);
    float _3349 = fma(_3335, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3339);
    float _3351 = float(_3323);
    float _3353 = _703 + (-0.5);
    float _3355 = fma(_3343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3349);
    float _3357 = fma(_3193, _2833, _3345);
    float _3359 = _3351 * _3317;
    float _3361 = _2997 * 0.15915493667125701904296875;
    float _3363 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3365 = _3355 >= 0.0;
    float _3367 = _3359 * (-2.0);
    float _3369 = _3357 * 0.15915493667125701904296875;
    float _3371 = sqrt(_3033);
    float _3373 = fma(_3367, _2237, _2237);
    float _3375 = fma(_3363, _3367, _3363);
    float _3377 = fma(_3353, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3373);
    float _3379 = _3361 * 6.283185482025146484375;
    float _3381 = sin(_3379);
    float _3383 = fma(_3375, _2833, _3377);
    float _3385 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_3365)
    {
        _3385 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3387 = _3385;
    int _3389 = as_type<int>(_3387);
    if (_3365)
    {
        out.m_51.x = 0.0;
    }
    float _3391 = _3383 * 0.15915493667125701904296875;
    float _3393 = _3361 * 6.283185482025146484375;
    float _3395 = cos(_3393);
    if (_3365)
    {
        float _3397 = _3387 * 5.0;
        _3389 = as_type<int>(_3397);
    }
    int _3399 = _3389;
    if (_3365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9747 = as_type<float>(_3399);
        out.gl_Position.z = _9747;
    }
    float _3401 = _3369 * 6.283185482025146484375;
    float _3403 = sin(_3401);
    float _3405 = _3369 * 6.283185482025146484375;
    float _3407 = cos(_3405);
    float _3409 = _3391 * 6.283185482025146484375;
    float _3411 = sin(_3409);
    if (_3365)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3413 = -_2089;
    float _3415 = _3413 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3417 = -_2117;
    float _3419 = _3417 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3421 = -_2133;
    float _3423 = _3421 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3425 = in.m_71.x;
    float _3427 = in.m_71.y;
    float _3429 = in.m_71.z;
    float _3431 = _3415 * _3415;
    float _3433 = _3391 * 6.283185482025146484375;
    float _3435 = cos(_3433);
    float _3437 = _3381 * _3403;
    float _3439 = _3395 * _3407;
    float _3441 = fma(_3419, _3419, _3431);
    float _3443 = _3395 * _3403;
    float _3445 = _3381 * _3407;
    float _3447 = fma(_3411, _3439, _3437);
    float _3449 = fma(_3423, _3423, _3441);
    float _3451 = fma(_3411, _3437, _3439);
    float _3453 = _2901 * _3371;
    float _3455 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3457 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3459 = rsqrt(_3449);
    float _3461 = -_3443;
    float _3463 = fma(_3411, _3445, _3461);
    float _3465 = _3453 * _3455;
    float _3467 = _3395 * _3435;
    float _3469 = _3407 * _3435;
    float _3471 = _3381 * _3435;
    float _3473 = _3403 * _3435;
    float _3475 = -_3445;
    float _3477 = fma(_3411, _3443, _3475);
    float _3479 = _2917 * _3453;
    float _3481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3425);
    float _3483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3427);
    float _3485 = _3453 * _3457;
    float _3487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3429);
    float _3489 = _3481 * _3479;
    float _3491 = _3483 * _3465;
    bool _3493 = _3427 != 0.0;
    bool _3495 = isnan(_3427);
    bool _3497 = _3493 || _3495;
    bool _3499 = isnan(0.0);
    bool _3501 = _3497 || _3499;
    float _3503 = _3419 * _3459;
    float _3505 = _3423 * _3459;
    float _3507 = in.m_73.x;
    float _3509 = in.m_73.y;
    float _3511 = in.m_73.z;
    float _3513 = _3487 * _3485;
    float _3515 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3517 = _3503 * _3515;
    float _3519 = _3415 * _3459;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3523 = _3505 * _3521;
    bool _3525 = _3425 == 0.0;
    bool _3527 = !_3501;
    bool _3529 = _3525 && _3527;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3533 = -_3517;
    float _3535 = fma(_3505, _3531, _3533);
    float _3537 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3539 = _3519 * _3537;
    float _3541 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3543 = -_3523;
    float _3545 = fma(_3519, _3541, _3543);
    float _3547 = in.m_75.x;
    float _3549 = in.m_75.y;
    float _3551 = in.m_75.z;
    float _3553 = in.m_75.w;
    float _3555 = _3535 * _3535;
    float _3557 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3559 = -_3539;
    float _3561 = fma(_3503, _3557, _3559);
    bool _3563 = _3429 == 0.0;
    bool _3565 = _3563 && _3529;
    float _3567 = -_3491;
    float _3569 = _3411 * _3567;
    float _3571 = fma(_3545, _3545, _3555);
    float _3573 = _3467 * _3491;
    float _3575 = _3471 * _3491;
    float _3577 = fma(_3469, _3489, _3569);
    float _3579 = fma(_3561, _3561, _3571);
    float _3581 = fma(_3447, _3489, _3573);
    float _3583 = fma(_3463, _3489, _3575);
    float _3585 = fma(_3473, _3513, _3577);
    float _3587 = rsqrt(_3579);
    float _3589 = fma(_3477, _3513, _3581);
    float _3591 = _3491;
    float _3593 = _3571;
    float _3595 = _3489;
    float _3597 = _3451;
    if (_3565)
    {
        _3307 = _3507;
    }
    float _3599 = _3307;
    float _3601 = _3599;
    if (_3565)
    {
        _3309 = _3511;
    }
    float _3603 = _3309;
    float _3605 = _3603;
    if (_3565)
    {
        _3311 = _3509;
    }
    float _3607 = _3311;
    float _3609 = _3607;
    if (_3565)
    {
        _3591 = _3599;
    }
    float _3611 = _3591;
    float _3613 = _3611;
    if (!_3565)
    {
        _3601 = _3507;
    }
    float _3615 = _3601;
    if (_3565)
    {
        _3593 = _3603;
    }
    float _3617 = _3593;
    float _3619 = _3617;
    if (_3565)
    {
        _3595 = _3607;
    }
    float _3621 = _3595;
    float _3623 = _3545 * _3587;
    float _3625 = _3621;
    if (!_3565)
    {
        _3605 = _3511;
    }
    float _3627 = _3605;
    float _3629 = _3535 * _3587;
    if (!_3565)
    {
        _3609 = _3509;
    }
    float _3631 = _3609;
    float _3633 = _3551 * _3615;
    float _3635 = _3561 * _3587;
    if (!_3565)
    {
        float _3637 = fma(_3429, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3627);
        _3619 = _3637;
    }
    float _3639 = _3619;
    float _3641 = _3505 * _3629;
    float _3643 = _3519 * _3623;
    float _3645 = -_3633;
    float _3647 = fma(_3547, _3627, _3645);
    float _3649 = _3549 * _3627;
    float _3651 = fma(_3451, _3513, _3583);
    float _3653 = _3547 * _3631;
    float _3655 = -_3641;
    float _3657 = fma(_3519, _3635, _3655);
    float _3659 = -_3643;
    float _3661 = fma(_3503, _3629, _3659);
    float _3663 = _3639;
    if (!_3565)
    {
        float _3665 = fma(_3425, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3615);
        _3613 = _3665;
    }
    float _3667 = _3613;
    float _3669 = -_3649;
    float _3671 = fma(_3551, _3631, _3669);
    float _3673 = -_3653;
    float _3675 = fma(_3549, _3615, _3673);
    float _3677 = _3657 * _3589;
    float _3679 = _3661 * _3589;
    if (!_3565)
    {
        float _3681 = fma(_3427, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3631);
        _3625 = _3681;
    }
    float _3683 = _3625;
    float _3685 = _3647 * _3553;
    float _3687 = _3671 * _3553;
    float _3689 = _3503 * _3635;
    float _3691 = _3675 * _3553;
    float _3693 = fma(_3623, _3585, _3677);
    float _3695 = fma(_3635, _3585, _3679);
    float _3697 = -_3689;
    float _3699 = fma(_3505, _3623, _3697);
    float _3701 = _3447 * _3657;
    float _3703 = fma(_3503, _3651, _3693);
    float _3705 = fma(_3505, _3651, _3695);
    float _3707 = _3447 * _3699;
    float _3709 = _3447 * _3661;
    float _3711 = _2117 + _3703;
    float _3713 = _2133 + _3705;
    float _3715 = _3467 * _3657;
    float _3717 = _3477 * _3657;
    float _3719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3721 = _3711 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3725 = _3713 + _3723;
    float _3727 = _3467 * _3699;
    float _3729 = _3467 * _3661;
    float _3731 = _3721 * _3721;
    float _3733 = _3725 * _3725;
    float _3735 = _3477 * _3661;
    float _3737 = _3477 * _3699;
    float _3739 = fma(_3469, _3623, _3701);
    float _3741 = _3731 + _3733;
    float _3743 = fma(_3469, _3629, _3707);
    float _3745 = fma(_3469, _3635, _3709);
    float _3747 = _3699 * _3589;
    float _3749 = sqrt(_3741);
    float _3751 = -_3411;
    float _3753 = fma(_3751, _3623, _3715);
    float _3755 = fma(_3473, _3623, _3717);
    float _3757 = fma(_3629, _3585, _3747);
    float _3759 = -_3411;
    float _3761 = fma(_3759, _3629, _3727);
    float _3763 = -_3411;
    float _3765 = fma(_3763, _3635, _3729);
    float _3767 = fma(_3473, _3635, _3735);
    float _3769 = fma(_3473, _3629, _3737);
    float _3771 = fma(_3463, _3503, _3739);
    float _3773 = fma(_3471, _3503, _3753);
    float _3775 = fma(_3451, _3503, _3755);
    float _3777 = fma(_3519, _3651, _3757);
    float _3779 = fma(_3471, _3519, _3761);
    float _3781 = fma(_3471, _3505, _3765);
    float _3783 = fma(_3463, _3519, _3743);
    float _3785 = _2089 + _3777;
    bool _3787 = _3749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3789 = fma(_3463, _3505, _3745);
    float _3791 = fma(_3451, _3519, _3769);
    float _3793 = fma(_3451, _3505, _3767);
    float _3795 = _3773 * _3549;
    float _3797 = _3779 * _3549;
    float _3799 = _3781 * _3549;
    float _3801 = _3773 * _3683;
    float _3803 = _3685 * _3773;
    float _3805 = _3779 * _3683;
    float _3807 = _3781 * _3683;
    float _3809 = _3685 * _3779;
    float _3811 = _3685 * _3781;
    float _3813 = _3731;
    float _3815 = _3733;
    float _3817 = _3711;
    float _3819 = _3713;
    if (!_3787)
    {
        _3597 = _3785;
    }
    float _3821 = _3597;
    bool _3823 = !_3787;
    float _3825 = _3821;
    if (!_3823)
    {
        float _3827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3831 = _3749 + _3829;
        float _3833 = rsqrt(_3741);
        float _3835 = _3831 * _3827;
        float _3837 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3839 = _3835 * 0.15915493667125701904296875;
        float _3841 = _3839 * 6.283185482025146484375;
        float _3843 = sin(_3841);
        float _3845 = _3839 * 6.283185482025146484375;
        float _3847 = cos(_3845);
        float _3849 = fma(_3843, _3837, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3851 = _3833 * _3849;
        float _3853 = _3847 + (-1.0);
        float _3855 = fma(_3721, _3851, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3857 = fma(_3725, _3851, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3859 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3863 = _3855 + _3861;
        float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3867 = _3857 + _3865;
        float _3869 = fma(_3785, _3847, _3859);
        float _3871 = _3863 * _3863;
        float _3873 = _3867 * _3867;
        _3825 = _3869;
        _3813 = _3871;
        _3815 = _3873;
        _3817 = _3855;
        _3819 = _3857;
    }
    float _3875 = _3825;
    float _3877 = _3813;
    float _3879 = _3815;
    float _3881 = _3817;
    float _3883 = _3819;
    float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3887 = _3875 + _3885;
    float _3889 = fma(_3771, _3667, _3801);
    float _3891 = fma(_3783, _3667, _3805);
    float _3893 = fma(_3789, _3667, _3807);
    float _3895 = fma(_3887, _3887, _3877);
    float _3897 = fma(_3771, _3547, _3795);
    float _3899 = fma(_3783, _3547, _3797);
    float _3901 = fma(_3687, _3771, _3803);
    float _3903 = _3895 + _3879;
    float _3905 = fma(_3687, _3783, _3809);
    float _3907 = fma(_3789, _3547, _3799);
    float _3909 = fma(_3687, _3789, _3811);
    float _3911 = fma(_3775, _3551, _3897);
    float _3913 = fma(_3791, _3551, _3899);
    float _3915 = sqrt(_3903);
    float _3917 = fma(_3691, _3775, _3901);
    float _3919 = fma(_3791, _3639, _3891);
    float _3921 = fma(_3691, _3791, _3905);
    float _3923 = fma(_3793, _3551, _3907);
    float _3925 = fma(_3775, _3639, _3889);
    float _3927 = fma(_3691, _3793, _3909);
    float _3929 = fma(_3793, _3639, _3893);
    out.m_77.x = _3911;
    out.m_77.y = _3913;
    out.m_77.z = _3923;
    out.m_79.x = _3917;
    out.m_79.y = _3921;
    out.m_79.z = _3927;
    bool _3931 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3933 = isnan(_3915);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3939 = _3935 || _3937;
    out.m_81.x = _3925;
    out.m_81.y = _3919;
    out.m_81.z = _3929;
    float _3941 = _3911;
    if (!_3939)
    {
        _3663 = 1.0;
    }
    float _3943 = _3663;
    bool _3945 = !_3939;
    float _3947 = _3943;
    if (!_3945)
    {
        bool _3949 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3951 = isnan(_3915);
        bool _3953 = _3949 || _3951;
        bool _3955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3957 = _3953 || _3955;
        if (!_3957)
        {
            float _3959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3961 = _3915 + _3959;
            float _3963 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3965 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3963;
            float _3967 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3971 = 1.0 / _3965;
            float _3973 = _3961 * _3971;
            float _3975 = fma(_3973, _3969, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3947 = _3975;
            _3977 = true;
        }
        else
        {
            bool _3979 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3981 = isnan(_3915);
            bool _3983 = _3979 || _3981;
            bool _3985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3987 = _3983 || _3985;
            if (!_3987)
            {
                float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3991 = _3915 + _3989;
                float _3993 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3995 = _3993 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3997 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3999 = _3997 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4001 = 1.0 / _3995;
                float _4003 = _3991 * _4001;
                float _4005 = fma(_4003, _3999, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3947 = _4005;
                _3977 = true;
            }
            else
            {
                _3947 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3977 = false;
    float _4007 = _3947;
    float _4009 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4011 = _3881 + _4009;
    float _4013 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4015 = _3875 + _4013;
    float _4017 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4019 = _3883 + _4017;
    bool _4021 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4023 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4025 = _4021 || _4023;
    bool _4027 = isnan(0.5);
    bool _4029 = _4025 || _4027;
    float _4031 = fma(_4011, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4033 = fma(_4015, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4035 = fma(_4019, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4037 = -_2949;
    float _4039 = _4037 + _4031;
    float _4041 = -_2947;
    float _4043 = _4041 + _4033;
    float _4045 = -_2991;
    float _4047 = _4045 + _4035;
    float _4049 = _4043;
    float _4051 = _4039;
    float _4053 = _4047;
    float _4055 = _4035;
    if (!_4029)
    {
        float _4057 = _3327 * _3327;
        float _4059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4061 = -_2133;
        float _4063 = _4061 + _4035;
        float _4065 = -_2089;
        float _4067 = _4065 + _4033;
        float _4069 = fma(_3335, _3335, _4057);
        float _4071 = fma(_3343, _3343, _4069);
        float _4073 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4075 = sqrt(_4071);
        float _4077 = 1.0 / _3453;
        float _4079 = _4073 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4081 = precise::min(_4075, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4083 = _4081 * _4059;
        float _4085 = _4083 * _4077;
        float _4087 = -_2117;
        float _4089 = _4087 + _4031;
        float _4091 = _4079 * _4085;
        float _4093 = _4063 * _4085;
        float _4095 = fma(_4089, _4091, _3321);
        float _4097 = fma(_4067, _4091, _3315);
        float _4099 = fma(_4079, _4093, _3331);
        _4049 = _4097;
        _4051 = _4095;
        _4053 = _4099;
    }
    float _4101 = _4049;
    float _4103 = _4051;
    float _4105 = _4053;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4109 = _4101 + _4107;
    float _4111 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4113 = _4103 + _4111;
    float _4115 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4117 = _4105 + _4115;
    float _4119 = _4109 * _4109;
    float _4121 = fma(_4113, _4113, _4119);
    float _4123 = fma(_4117, _4117, _4121);
    float _4125 = rsqrt(_4123);
    float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4129 = _4113 * _4127;
    float _4131 = _4117 * _4127;
    float _4133 = _4129 * _4129;
    float _4135 = _4131 * _4131;
    float _4137 = _4133 + _4135;
    float _4139 = sqrt(_4137);
    bool _4141 = _4139 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4145 = _4139 + _4143;
    float _4147 = _4117;
    float _4149 = _4137;
    float _4151 = _4145;
    float _4153 = _4109;
    if (_4141)
    {
        float _4155 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4147 = _4155;
    }
    float _4157 = _4147;
    if (_4141)
    {
        float _4159 = rsqrt(_4137);
        _4149 = _4159;
    }
    float _4161 = _4149;
    float _4163 = _4161;
    if (_4141)
    {
        float _4165 = _4145 * _4157;
        _4151 = _4165;
    }
    float _4167 = _4151;
    if (_4141)
    {
        float _4169 = _4167 * 0.15915493667125701904296875;
        _3941 = _4169;
    }
    float _4171 = _3941;
    float _4173 = _4125;
    float _4175 = _4171;
    if (_4141)
    {
        float _4177 = _4171 * 6.283185482025146484375;
        float _4179 = sin(_4177);
        _4173 = _4179;
    }
    float _4181 = _4173;
    float _4183 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4185 = precise::max(0.0, _4183);
    float _4187 = _4157;
    float _4189 = _4185;
    if (_4141)
    {
        float _4191 = _4171 * 6.283185482025146484375;
        float _4193 = cos(_4191);
        _4187 = _4193;
    }
    float _4195 = _4187;
    float _4197 = -_4127;
    float _4199 = -_4185;
    float _4201 = fma(_4109, _4197, _4199);
    if (_4141)
    {
        float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4153 = _4203;
    }
    float _4205 = _4153;
    float _4207 = _4205;
    if (!_4141)
    {
        _4175 = _4129;
    }
    float _4209 = _4175;
    float _4211 = _4181;
    float _4213 = _4209;
    if (_4141)
    {
        float _4215 = fma(_4181, _4205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4055 = _4215;
    }
    float _4217 = _4055;
    float _4219 = _4217;
    if (!_4141)
    {
        _4211 = _4201;
    }
    float _4221 = _4211;
    float _4223 = _4221;
    if (!_4141)
    {
        _4207 = _4133;
    }
    float _4225 = _4207;
    float _4227 = _4195;
    float _4229 = _4225;
    if (_4141)
    {
        float _4231 = _4195 + (-1.0);
        _4189 = _4231;
    }
    float _4233 = _4189;
    float _4235 = _4233;
    if (_4141)
    {
        float _4237 = _4161 * _4217;
        _4219 = _4237;
    }
    float _4239 = _4219;
    if (!_4141)
    {
        _4163 = _4135;
    }
    float _4241 = _4163;
    float _4243 = _4241;
    if (_4141)
    {
        float _4245 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4235 = _4245;
    }
    float _4247 = _4235;
    if (_4141)
    {
        float _4249 = _4129 * _4239;
        _4213 = _4249;
    }
    float _4251 = _4213;
    if (_4141)
    {
        float _4253 = fma(_4201, _4195, _4247);
        _4223 = _4253;
    }
    float _4255 = _4223;
    if (!_4141)
    {
        _4227 = _4131;
    }
    float _4257 = _4227;
    float _4259 = _4257;
    if (_4141)
    {
        float _4261 = _4131 * _4239;
        _4259 = _4261;
    }
    float _4263 = _4259;
    if (_4141)
    {
        float _4265 = _4251 * _4251;
        _4229 = _4265;
    }
    float _4267 = _4229;
    float _4269 = sqrt(_4123);
    float _4271 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (_4141)
    {
        float _4273 = _4263 * _4263;
        _4243 = _4273;
    }
    float _4275 = _4243;
    float _4277 = fma(_4255, _4255, _4267);
    float _4279 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4281 = _4277 + _4275;
    float _4283 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4285 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4279);
    float _4287 = rsqrt(_4281);
    float _4289 = fma(_3321, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4291 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4283);
    float _4293 = fma(_3331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4297 = fma(_4269, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4295);
    float _4299 = precise::clamp(_4297, 0.0, 1.0);
    float _4301 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4291);
    float _4303 = floor(_4289);
    float _4305 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = _4301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4309 = -_4299;
    float _4311 = _4309 + 1.0;
    float _4313 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4315 = _4307 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4317 = _4287 * _4251;
    float _4319 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4313);
    float _4321 = -_4315;
    float _4323 = fma(_4321, _4271, 1.0);
    float _4325 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4327 = abs(_4311);
    float _4329 = log2(_4327);
    float _4331 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4333 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4335 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4325);
    float _4337 = _4287 * _4255;
    float _4339 = _4287 * _4263;
    float _4341 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4343 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4335);
    float _4345 = -_4331;
    float _4347 = fma(_4337, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4345);
    float _4349 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4285);
    float _4351 = floor(_4293);
    float _4353 = _4343 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4355 = -_4339;
    float _4357 = fma(_4355, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4347);
    float _4359 = _4349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4361 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4363 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4341);
    float _4365 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4367 = fma(_4357, -0.5, 0.5);
    float _4369 = log2(_4323);
    float _4371 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4363);
    float _4373 = -_4303;
    float _4375 = _4289 + _4373;
    float _4377 = fma(_4357, 0.5, 0.5);
    float _4379 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4371);
    float _4381 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4383 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4361);
    float _4385 = exp2(_4365);
    float _4387 = fma(_4377, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4389 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4381);
    float _4391 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4383);
    float _4393 = -_4351;
    float _4395 = _4293 + _4393;
    float _4397 = _4337 + 1.0;
    float _4399 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4389);
    float _4401 = fma(_4377, _4387, -0.212114393711090087890625);
    float _4403 = 1.0 / _4379;
    float _4405 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4391);
    float _4407 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4399);
    float _4409 = fma(_4377, _4401, 1.570728778839111328125);
    float _4411 = _4369 * 0.693147182464599609375;
    float _4413 = sqrt(_4367);
    float _4415 = -_4337;
    float _4417 = fma(_4385, _4397, _4415);
    float2 _11408 = float2(_4375, _4395);
    float _4419 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11408, float2(0.0), isnan(_11408)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11408, float2(0.0), isnan(_11408)), level(0.0)).x;
    float _4421 = _4411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4423 = _4407 * _4403;
    float _4425 = _4405 * _4403;
    float _4427 = fma(_4423, 0.5, 0.5);
    float _4429 = fma(_4425, -0.5, 0.5);
    float _4431 = _4413 * 0.636619746685028076171875;
    float3 _11436 = float3(_4427, _4429, _4421);
    float _4433 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11436, float3(0.0), isnan(_11436)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11436, float3(0.0), isnan(_11436)), level(0.0)).x;
    float _4435 = -_4409;
    float _4437 = fma(_4431, _4435, 1.0);
    float _4439 = fma(_4417, 0.5, 0.5);
    float3 _11454 = float3(_4427, _4429, _4421);
    float4 _4442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11454, float3(0.0), isnan(_11454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11454, float3(0.0), isnan(_11454)), level(0.0)).xyzw;
    float _4444 = _4442.x;
    float _4446 = _4442.y;
    float _4448 = _4442.z;
    float _4450 = _4442.w;
    float2 _11470 = float2(_4437, _4439);
    float3 _4454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11470, float2(0.0), isnan(_11470)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11470, float2(0.0), isnan(_11470)), level(0.0)).xyz;
    float _4456 = _4454.x;
    float _4458 = _4454.y;
    float _4460 = _4454.z;
    float _4462 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _4464 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4466 = isnan(_4269);
    bool _4468 = _4464 || _4466;
    bool _4470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4472 = _4468 || _4470;
    float _4474 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4462);
    float _4476 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4474);
    float _4478 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4480 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4482 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4478);
    float _4484 = 1.0 / _4480;
    float _4486 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4482);
    float _4488 = _4486 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4490 = _4488 + _4480;
    float _4492 = _4490 * _4484;
    float _4494 = _4492 * 0.5;
    float _4496 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4498 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4496);
    float _4500 = 1.0 / _4498;
    float _4502 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4504 = exp2(_4502);
    float _4506 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4508 = _4500 * _4506;
    float _4510 = abs(_4508);
    float _4512 = log2(_4510);
    float _4514 = -_4504;
    float _4516 = _4514 + 1.0;
    bool _4518 = _4508 <= 8000.0;
    bool _4520 = isnan(_4508);
    bool _4522 = _4518 || _4520;
    bool _4524 = isnan(8000.0);
    bool _4526 = _4522 || _4524;
    float _4528 = float(_4526);
    float _4530 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4532 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4534 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4536 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4534);
    float _4538 = exp2(_4532);
    float _4540 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4536);
    float _4542 = in.m_83.x;
    float _4544 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4540);
    float _4546 = _4544 + _4379;
    out.gl_Position.x = _4407;
    out.gl_Position.y = _4405;
    out.gl_Position.z = _4544;
    out.gl_Position.w = _4379;
    float _4548 = _4546 * 0.5;
    float _4550 = fma(_4538, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4552 = precise::clamp(_4550, 0.0, 1.0);
    float _4554 = _4546;
    float _4556 = _4548;
    if (!_4472)
    {
        _4554 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4558 = _4554;
    float _4560 = fma(_4552, -2.0, 3.0);
    float _4562 = _4552 * _4552;
    float _4564 = _4562 * _4560;
    float _4566 = -_4564;
    float _4568 = _4566 + 1.0;
    float _4570 = fma(_4568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4564);
    float _4572 = _4528 * _4570;
    out.m_85.z = _4548;
    out.m_85.w = _4379;
    float _4574 = _4572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4576 = _4379;
    float _4578 = _4558;
    float _4580 = _4558;
    if (!_4472)
    {
        _4576 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4582 = _4576;
    float _4584 = _4582;
    float _4586 = _4582;
    if (!_4472)
    {
        _4556 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4588 = _4556;
    float _4590 = -_4419;
    float _4592 = _4590 + 1.0;
    float _4594 = _4592 * _4574;
    float _4596 = precise::clamp(_4594, 0.0, 1.0);
    float _4598 = -_4596;
    float _4600 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4602 = _4600 * _4542;
    float _4604 = _4542;
    float _4606 = _4444;
    float _4608 = _4602;
    float _4610 = _4588;
    float _4612 = _4588;
    if (!_4472)
    {
        _4604 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4614 = _4604;
    float _4616 = _4530 * _4433;
    float _4618 = -_4530;
    float _4620 = _4618 + 1.0;
    float _4622 = _4450 * _4616;
    float _4624 = _4460 * _4616;
    float _4626 = fma(_4456, _4622, _4444);
    float _4628 = fma(_4458, _4622, _4446);
    float _4630 = _4602 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4632 = _4450 * _4620;
    float _4634 = fma(_4450, _4624, _4448);
    float _4636 = _4614;
    float _4638 = _4614;
    if (!_4472)
    {
        _4606 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4640 = _4606;
    out.m_87.x = _4630;
    float _4642 = _4640;
    float _4644 = _4640;
    if (!_4472)
    {
        _4608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4646 = _4608;
    out.m_89.x = _4626;
    out.m_89.y = _4628;
    out.m_89.z = _4634;
    out.m_89.w = _4632;
    bool _4648 = !_4472;
    float _4650 = _4646;
    float _4652 = _4646;
    if (!_4648)
    {
        bool _4654 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4656 = isnan(_4269);
        bool _4658 = _4654 || _4656;
        bool _4660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4662 = _4658 || _4660;
        if (!_4662)
        {
            float _4664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4666 = _4269 + _4664;
            float _4668 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4670 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4668;
            float _4672 = 1.0 / _4670;
            float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4676 = _4674 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4678 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4680 = _4678 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4682 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4684 = _4682 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4686 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4688 = _4686 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4690 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4692 = _4690 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4694 = _4666 * _4672;
            float _4696 = precise::clamp(_4694, 0.0, 1.0);
            float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4700 = _4698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4702 = fma(_4696, _4676, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4704 = fma(_4696, _4700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4706 = fma(_4696, _4680, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4708 = fma(_4696, _4684, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4710 = fma(_4696, _4688, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4712 = fma(_4696, _4692, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4638 = _4702;
            _4652 = _4710;
            _4586 = _4704;
            _4612 = _4708;
            _4644 = _4706;
            _4580 = _4712;
            _4714 = true;
        }
        else
        {
            bool _4716 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4718 = isnan(_4269);
            bool _4720 = _4716 || _4718;
            bool _4722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4724 = _4720 || _4722;
            if (!_4724)
            {
                _4584 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4726 = _4584;
            _4586 = _4726;
            if (!_4724)
            {
                _4636 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4728 = _4636;
            _4638 = _4728;
            if (!_4724)
            {
                _4642 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4730 = _4642;
            _4644 = _4730;
            if (!_4724)
            {
                _4610 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4732 = _4610;
            _4612 = _4732;
            if (!_4724)
            {
                _4650 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4734 = _4650;
            _4652 = _4734;
            if (!_4724)
            {
                _4578 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4736 = _4578;
            bool _4738 = !_4724;
            _4580 = _4736;
            if (!_4738)
            {
                bool _4740 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4742 = isnan(_4269);
                bool _4744 = _4740 || _4742;
                bool _4746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4748 = _4744 || _4746;
                if (!_4748)
                {
                    float _4750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4752 = _4269 + _4750;
                    float _4754 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4756 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4754;
                    float _4758 = 1.0 / _4756;
                    float _4760 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4762 = _4760 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4764 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4768 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4770 = _4768 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4772 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4776 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4778 = _4776 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4780 = _4752 * _4758;
                    float _4782 = precise::clamp(_4780, 0.0, 1.0);
                    float _4784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4786 = _4784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4788 = fma(_4782, _4762, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4790 = fma(_4782, _4786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4792 = fma(_4782, _4766, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4794 = fma(_4782, _4770, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4796 = fma(_4782, _4774, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4798 = fma(_4782, _4778, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4638 = _4788;
                    _4652 = _4796;
                    _4586 = _4790;
                    _4612 = _4794;
                    _4644 = _4792;
                    _4580 = _4798;
                    _4714 = true;
                }
                else
                {
                    _4638 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4652 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4586 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4612 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4644 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4580 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4714 = false;
    float _4800 = _4638;
    float _4802 = _4652;
    float _4804 = _4586;
    float _4806 = _4612;
    float _4808 = _4644;
    float _4810 = _4580;
    float _4812 = fma(_3919, -0.5, 0.5);
    float _4814 = precise::clamp(_4812, 0.0, 1.0);
    float _4816 = -_4800;
    float _4818 = _4816 + _4802;
    float _4820 = -_4804;
    float _4822 = _4820 + _4806;
    float _4824 = -_4808;
    float _4826 = _4824 + _4810;
    bool _4828 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4830 = fma(_4814, _4818, _4800);
    float _4832 = fma(_4814, _4822, _4804);
    float _4834 = fma(_4814, _4826, _4808);
    float _4836 = _4830 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _4838 = fma(_4832, 0.298911988735198974609375, _4836);
    float _4840 = fma(_4834, 0.114477999508380889892578125, _4838);
    float _4842 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _4844 = -_4840;
    float _4846 = _4832 + _4844;
    float _4848 = -_4840;
    float _4850 = _4830 + _4848;
    float _4852 = -_4840;
    float _4854 = _4834 + _4852;
    out.m_87.w = _4842;
    float _4856 = fma(_4846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    float _4858 = fma(_4850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    float _4860 = fma(_4854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    out.m_93.x = _4856;
    out.m_93.y = _4858;
    out.m_93.z = _4860;
    if (!_4828)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _4862 = -_4101;
    float _4864 = _4862 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4866 = -_4103;
    float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4870 = -_4105;
    float _4872 = _4870 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4874 = _4864 * _4864;
    float _4876 = fma(_4868, _4868, _4874);
    float _4878 = fma(_4872, _4872, _4876);
    float _4880 = sqrt(_4878);
    float _4882 = rsqrt(_4878);
    float _4884 = -_4880;
    float _4886 = _4884 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4888 = _4886 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4890 = precise::clamp(_4888, 0.0, 1.0);
    float _4892 = _4868 * _4882;
    float _4894 = _4864 * _4882;
    float _4896 = abs(_4890);
    float _4898 = log2(_4896);
    float _4900 = _4872 * _4882;
    float _4902 = _4892 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4904 = _3919 * _4894;
    float _4906 = -_4894;
    float _4908 = -_4902;
    float _4910 = fma(_4906, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4908);
    float _4912 = fma(_3925, _4892, _4904);
    float _4914 = -_4900;
    float _4916 = fma(_4914, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4910);
    float _4918 = fma(_3929, _4900, _4912);
    float _4920 = precise::clamp(_4918, 0.0, 1.0);
    float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4924 = _4916 + _4922;
    float _4926 = _4898 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4928 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4930 = precise::clamp(_4928, 0.0, 1.0);
    float _4932 = exp2(_4926);
    float _4934 = _4932 * _4930;
    float _4936 = _4920 * _4934;
    float _4938 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4940 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4942 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4938;
    out.m_91.y = _4940;
    out.m_91.z = _4942;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4714 = false;
    bool _3977 = false;
    bool _528 = false;
    bool _412 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4998 = as_type<float>(_126);
        out.gl_Position.z = _4998;
    }
    if (!_116)
    {
        return out;
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5068 = as_type<float>(_166);
        out.gl_Position.z = _5068;
    }
    if (_158)
    {
        return out;
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _144 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = 1.0 / _218;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _230;
    float _234 = 1.0 / _214;
    float _236 = _202 * _224;
    bool _238 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _240 = isnan(_198);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    bool _250 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_198);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = _206 * _228;
    bool _264 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_198);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_248;
    float _278 = _276 + 1.0;
    float _280 = _274 * _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _210 * _234;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -_274;
    float _306 = _304 + 1.0;
    float _308 = fma(_232, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _310 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _314 = -_260;
    float _316 = _314 + 1.0;
    float _318 = _260 * _306;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = _292 * _316;
    float _330 = -_292;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = _310 * _328;
    float _340 = _312 * _328;
    float _342 = _308 * _328;
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _338);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _340);
    float _348 = fma(_336, _236, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _350;
    float _354 = fma(_322, _236, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_326, _236, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].z, _342);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_348, _318, _344);
    float _370 = fma(_352, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_362, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_366, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_354, _318, _346);
    float _378 = fma(_356, _318, _358);
    float _380 = fma(_372, _280, _368);
    float _382 = fma(_370, _280, _376);
    float _384 = fma(_374, _280, _378);
    float _386 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_226;
    float _410;
    if (!_392)
    {
        float _394 = in.m_55.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_112);
        float _416 = 1.0 / _414;
        float _418 = _144 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    bool _422 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _424 = isnan(_420);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _438 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _440 = isnan(_420);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _420 + _454;
    float _458 = -_432;
    float _460 = _458 + 1.0;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _464 = 1.0 / _436;
    float _466 = _448 * _460;
    float _468 = -_448;
    float _470 = _468 + 1.0;
    float _472 = _452 * _464;
    float _474 = fma(_472, _456, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = _474 * _466;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = in.m_57.z;
    float _488 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _490 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[116].x, _488);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = _494 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _490;
    out.m_59.y = _492;
    out.m_59.z = _500;
    out.m_59.w = _498;
    float _502 = _388 * _484;
    float _504 = _390 * _486;
    float _506 = _386 * _482;
    bool _508 = !_462;
    float _526;
    if (!_508)
    {
        float _510 = in.m_55.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _144 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.w;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _546 = _544 != 0;
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _550 = int(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _552;
    float _556 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _558 = int(_556);
    float _560 = float(_540);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _566 = float(_550);
    float _568 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _570 = int(_568);
    float _572 = float(_558);
    float _574 = 1.0 / _560;
    float _576 = 1.0 / _566;
    float _578 = in.m_55.x;
    float _580 = float(uint(_570));
    int _582 = ~_570;
    int _584 = _582 + 1;
    bool _586 = _570 == 0;
    float _588 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _590 = int(_588);
    float _592 = _574 * _144;
    float _594 = _566;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_546)
    {
        _594 = 1.0;
    }
    float _598 = _594;
    float _600 = _598;
    if (!_546)
    {
        _600 = 7.345489978790283203125;
    }
    float _602 = _600;
    float _604 = 1.0 / _572;
    float _606 = _576 * _144;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _610 = int(_608);
    float _612 = float(uint(_590));
    int _614 = ~_590;
    int _616 = _614 + 1;
    int _618 = ~_590;
    int _620 = _618 + 1;
    float _622 = _604 * _144;
    float _624 = 1.0 / _580;
    float _626 = float(uint(_610));
    float _628 = trunc(_592);
    int _630 = int(_628);
    int _632 = ~_610;
    int _634 = _632 + 1;
    float _636 = 1.0 / _612;
    int _638 = as_type<int>(_624) + (-2);
    float _640 = _624;
    int _642 = _638;
    if (_546)
    {
        _640 = _578;
    }
    float _644 = _640;
    float _646 = trunc(_606);
    int _648 = int(_646);
    float _650 = in.m_55.y;
    float _652 = 1.0 / _626;
    int _654 = as_type<int>(_636) + (-2);
    float _656 = trunc(_622);
    int _658 = int(_656);
    float _660 = _602 * _578;
    float _662 = float(uint(_630));
    float _664 = float(uint(_648));
    float _666 = as_type<float>(_638) * _662;
    int _668 = as_type<int>(_652) + (-2);
    float _670 = as_type<float>(_654) * _664;
    float _672 = _664;
    float _674 = _644;
    if (_546)
    {
        _672 = 1.0;
    }
    float _676 = _672;
    float _678 = trunc(_666);
    float _680 = precise::max(_678, 0.0);
    uint _683 = uint(_680);
    float _685 = _676;
    if (!_546)
    {
        _674 = _650;
    }
    float _687 = _674;
    float _689 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_546)
    {
        _685 = 1.2345600128173828125;
    }
    float _691 = _685;
    float _693 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _564);
    float _695 = float(uint(_658));
    float _697 = trunc(_670);
    float _699 = precise::max(_697, 0.0);
    uint _701 = uint(_699);
    float _703 = in.m_55.z;
    float _705 = as_type<float>(_668) * _695;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _711 = uint(_709);
    float _713 = _687 * _691;
    int _715 = _584 * int(_683);
    int _717 = _715 + _630;
    int _719 = ~_610;
    int _721 = _719 + 1;
    int _723 = _616 * int(_701);
    int _725 = _723 + _648;
    float _727 = float(uint(_717));
    float _729 = floor(_660);
    float _731 = float(uint(_725));
    float _733 = as_type<float>(_638) * _727;
    float _735 = _727;
    float _737 = _731;
    if (_546)
    {
        _735 = _578;
    }
    float _739 = _735;
    int _741 = _721 * int(_711);
    int _743 = _741 + _658;
    float _745 = _739;
    if (!_546)
    {
        _745 = _703;
    }
    float _747 = _745;
    float _749 = as_type<float>(_654) * _731;
    float _751 = trunc(_733);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    if (_546)
    {
        _737 = 1.0;
    }
    float _757 = _737;
    float _759 = float(uint(_743));
    float _761 = _757;
    if (!_546)
    {
        _761 = 5.839270114898681640625;
    }
    float _763 = _761;
    float _765 = -_729;
    float _767 = _660 + _765;
    float _769 = as_type<float>(_668) * _759;
    float _771 = trunc(_749);
    float _773 = precise::max(_771, 0.0);
    uint _775 = uint(_773);
    float _777 = _747 * _763;
    int _779 = ~_610;
    int _781 = _779 + 1;
    float _783 = float(_630);
    int _785 = int(_683) + int(_755);
    float _787 = floor(_713);
    int _789 = ~_570;
    int _791 = _789 + 1;
    int _793 = _791 * _785;
    int _795 = _793 + _630;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _799 = _797 != 0;
    float _801 = trunc(_769);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    int _807 = int(_701) + int(_775);
    float _809 = float(_570);
    bool _811 = uint(_795) >= uint(_570);
    bool _813 = _783 >= _809;
    bool _815 = isnan(_783);
    bool _817 = _813 || _815;
    bool _819 = isnan(_809);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = floor(_777);
    float _827 = -_787;
    float _829 = _713 + _827;
    int _831 = ~_590;
    int _833 = _831 + 1;
    float _835 = float(_112);
    int _837 = _833 * _807;
    int _839 = _837 + _648;
    int _841 = int(_711) + int(_805);
    float _843 = trunc(_823);
    int _845 = int(_843);
    float _847 = _767 * _809;
    bool _849 = uint(_839) >= uint(_590);
    float _851 = float(_590);
    int _853 = _781 * _841;
    int _855 = _853 + _658;
    float _857 = -_825;
    float _859 = _777 + _857;
    float _861 = trunc(_847);
    int _863 = int(_861);
    bool _865 = !_811;
    int _867 = _865 ? 0 : (-1);
    float _869 = _851 * _829;
    bool _871 = uint(_855) >= uint(_610);
    int _873 = ~_785;
    int _875 = _873 + _867;
    int _877 = _875 + 1;
    bool _879 = !_871;
    int _881 = _879 ? 0 : (-1);
    float _883 = trunc(_869);
    int _885 = int(_883);
    bool _887 = !_799;
    int _889 = _887 ? 0 : 1;
    int _891 = _570 * _877;
    int _893 = _891 + _630;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _897 = _895 != 0;
    int _899 = ~_841;
    int _901 = _899 + _881;
    int _903 = _901 + 1;
    int _905 = abs(_889);
    float _907 = 1.0 / _835;
    bool _909 = !_897;
    int _911 = _909 ? 0 : 1;
    int _913 = _610 * _903;
    int _915 = _913 + _658;
    float _917 = float(_648);
    int _919 = _863 * _905;
    int _921 = _919 + _630;
    bool _923 = !_849;
    int _925 = _923 ? 0 : (-1);
    float _927 = _809 * _144;
    int _929 = abs(_911);
    bool _931 = _917 >= _851;
    bool _933 = isnan(_917);
    bool _935 = _931 || _933;
    bool _937 = isnan(_851);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    int _943 = ~_807;
    int _945 = _943 + _925;
    int _947 = _945 + 1;
    int _949 = _885 * _929;
    int _951 = _949 + _648;
    int _953 = ~_845;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    bool _959 = !_586;
    int _961 = _959 ? _893 : (-1);
    int _963 = _590 * _947;
    int _965 = _963 + _648;
    float _967 = trunc(_941);
    int _969 = int(_967);
    float _971 = float(_658);
    int _973 = _961 * _957;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _985 = _983 != 0;
    float _987 = _927 * _907;
    float _989 = float(_610);
    float _991 = _907 * _144;
    int _993 = _570 + (-1);
    float _995 = trunc(_987);
    int _997 = int(_995);
    bool _999 = _971 >= _989;
    bool _1001 = isnan(_971);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_989);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = _851 * _991;
    bool _1013 = !_981;
    int _1015 = _1013 ? 0 : 1;
    int _1017 = _845 * _993;
    int _1019 = _1017 + _973;
    bool _1021 = _590 == 0;
    float _1023 = _989 * _859;
    int _1025 = abs(_1015);
    float _1027 = trunc(_1009);
    int _1029 = int(_1027);
    bool _1031 = !_977;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_985;
    int _1037 = _1035 ? 0 : 1;
    int _1039 = _1019 * _1025;
    int _1041 = abs(_1033);
    bool _1043 = !_1021;
    int _1045 = _1043 ? _965 : (-1);
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1049 = _1047 != 0;
    int _1051 = abs(_1037);
    int _1053 = ~_969;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    bool _1059 = !_1049;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = _1057 * _1045;
    bool _1065 = _610 == 0;
    int _1067 = _997 * _1041;
    int _1069 = _1067 + _1039;
    int _1071 = abs(_1061);
    int _1073 = ~_1029;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    int _1079 = _921 * _1051;
    int _1081 = _1079 + _1069;
    bool _1083 = !_1065;
    int _1085 = _1083 ? _915 : (-1);
    float _1087 = in.m_61.x;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1091 = _1089 != 0;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1095 = _1093 != 0;
    int _1097 = _1077 * _1085;
    int _1099 = _590 + (-1);
    int _1101 = _863 * _1071;
    int _1103 = _1101 + _1081;
    float _1105 = trunc(_1011);
    int _1107 = int(_1105);
    bool _1109 = !_1095;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _969 * _1099;
    int _1115 = _1113 + _1063;
    float _1117 = float(uint(_1103));
    int _1119 = _610 + (-1);
    bool _1121 = !_1091;
    int _1123 = _1121 ? 0 : 1;
    float _1125 = as_type<float>(_638) * _1117;
    int _1127 = abs(_1111);
    int _1129 = _1029 * _1119;
    int _1131 = _1129 + _1097;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1139 = _1137 != 0;
    int _1141 = abs(_1123);
    int _1143 = _1115 * _1127;
    bool _1145 = !_1135;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = trunc(_1125);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1161 = _1159 != 0;
    int _1163 = _1107 * _1141;
    int _1165 = _1163 + _1143;
    bool _1167 = !_1139;
    int _1169 = _1167 ? 0 : 1;
    int _1171 = abs(_1147);
    float _1173 = _989 * _991;
    bool _1175 = !_1161;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = trunc(_1023);
    int _1181 = int(_1179);
    int _1183 = ~_570;
    int _1185 = _1183 + 1;
    int _1187 = abs(_1169);
    int _1189 = abs(_1177);
    float _1191 = trunc(_1173);
    int _1193 = int(_1191);
    int _1195 = _951 * _1171;
    int _1197 = _1195 + _1165;
    int _1199 = _1131 * _1189;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1203 = _1201 != 0;
    int _1205 = _1185 * int(_1153);
    int _1207 = _1205 + _1103;
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1211 = _1209 != 0;
    int _1213 = _885 * _1187;
    int _1215 = _1213 + _1197;
    bool _1217 = !_1203;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = float(uint(_1207));
    float _1223 = float(uint(_1215));
    bool _1225 = !_1157;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = as_type<float>(_638) * _1221;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1233 = _1231 != 0;
    float _1235 = as_type<float>(_654) * _1223;
    int _1237 = abs(_1227);
    float _1239 = trunc(_1229);
    float _1241 = precise::max(_1239, 0.0);
    uint _1243 = uint(_1241);
    int _1245 = abs(_1219);
    bool _1247 = !_1233;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = trunc(_1235);
    float _1253 = precise::max(_1251, 0.0);
    uint _1255 = uint(_1253);
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1259 = _1257 != 0;
    int _1261 = _1193 * _1237;
    int _1263 = _1261 + _1199;
    float _1265 = as_type<float>(_1245);
    float _1267 = as_type<float>(_1237);
    bool _1269 = _1135;
    if (!_1211)
    {
        _1265 = _1087;
    }
    float _1271 = _1265;
    int _1273 = _1181 * _1245;
    int _1275 = _1273 + _658;
    int _1277 = abs(_1249);
    float _1279 = _1271;
    if (!_1211)
    {
        _1267 = _1271;
    }
    float _1281 = _1267;
    bool _1283 = !_1259;
    int _1285 = _1283 ? 0 : 1;
    int _1287 = _1285;
    float _1289 = _1281;
    if (_1211)
    {
        _1279 = _1087;
    }
    float _1291 = _1279;
    int _1293 = ~_590;
    int _1295 = _1293 + 1;
    int _1297 = abs(_1285);
    int _1299 = _1297;
    if (_1211)
    {
        float _1301 = -_1291;
        float _1303 = _1301 + 1.0;
        _1287 = as_type<int>(_1303);
    }
    int _1305 = _1287;
    int _1307 = int(_1153) + int(_1243);
    int _1309 = _1295 * int(_1255);
    int _1311 = _1309 + _1215;
    if (_1211)
    {
        bool _1313 = _578 > 0.5;
        _1269 = _1313;
    }
    bool _1315 = _1269;
    int _1317 = _1275 * _1277;
    int _1319 = _1317 + _1263;
    float _1321 = in.m_61.y;
    int _1323 = ~_570;
    int _1325 = _1323 + 1;
    float _1327 = as_type<float>(_1297);
    if (_1211)
    {
        float _1329 = _1315 ? as_type<float>(_1305) : _1291;
        _1289 = _1329;
    }
    float _1331 = _1289;
    int _1333 = _1181 * _1297;
    int _1335 = _1333 + _1319;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1339 = _1337 != 0;
    int _1341 = _1325 * _1307;
    int _1343 = _1341 + _1103;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1347 = _1345 != 0;
    float _1349 = float(uint(_1335));
    float _1351 = float(uint(_1311));
    bool _1353 = uint(_1343) >= uint(_570);
    float _1355 = as_type<float>(_668) * _1349;
    int _1357 = ~_610;
    int _1359 = _1357 + 1;
    float _1361 = as_type<float>(_654) * _1351;
    bool _1363 = !_1353;
    int _1365 = _1363 ? 0 : (-1);
    float _1367 = _1349;
    if (_1339)
    {
        float _1369 = -_1291;
        float _1371 = _1369 + 1.0;
        _1299 = as_type<int>(_1371);
    }
    int _1373 = _1299;
    bool _1375 = _703 > 0.5;
    float _1377 = trunc(_1355);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    int _1383 = _1373;
    if (!_1339)
    {
        _1327 = _1291;
    }
    float _1385 = _1327;
    float _1387 = _1385;
    if (_1339)
    {
        float _1389 = _1375 ? as_type<float>(_1373) : _1291;
        _1387 = _1389;
    }
    float _1391 = _1387;
    if (_1347)
    {
        float _1393 = -_1291;
        float _1395 = _1393 + 1.0;
        _1383 = as_type<int>(_1395);
    }
    int _1397 = _1383;
    bool _1399 = _650 > 0.5;
    if (!_1347)
    {
        _1367 = _1291;
    }
    float _1401 = _1367;
    float _1403 = trunc(_1361);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    float _1409 = _1401;
    if (_1347)
    {
        float _1411 = _1399 ? as_type<float>(_1397) : _1291;
        _1409 = _1411;
    }
    float _1413 = _1409;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1417 = _1415 != 0;
    int _1419 = ~_590;
    int _1421 = _1419 + 1;
    int _1423 = _1359 * int(_1381);
    int _1425 = _1423 + _1335;
    float _1427 = -_1321;
    float _1429 = _1427 + 1.0;
    int _1431 = ~_1307;
    int _1433 = _1431 + _1365;
    int _1435 = _1433 + 1;
    bool _1437 = _570 == 0;
    int _1439 = _1399 ? as_type<int>(_1429) : as_type<int>(_1321);
    int _1441 = _570 * _1435;
    int _1443 = _1441 + _1103;
    bool _1445 = _542 > 0.5;
    float _1447 = _1417 ? as_type<float>(_1439) : _1321;
    int _1449 = int(_1255) + int(_1407);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1453 = _1451 != 0;
    float _1455 = float(uint(_1425));
    int _1457 = _1421 * _1449;
    int _1459 = _1457 + _1215;
    int _1461 = _1445 ? as_type<int>(_1429) : as_type<int>(_1321);
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1465 = _1463 != 0;
    float _1467 = as_type<float>(_668) * _1455;
    bool _1469 = !_1437;
    int _1471 = _1469 ? _1443 : (-1);
    float _1473 = _1465 ? as_type<float>(_1461) : _1321;
    bool _1475 = uint(_1459) >= uint(_590);
    float _1477 = trunc(_1467);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    float _1483 = _1321;
    if (_1453)
    {
        float _1485 = _1375 ? _1429 : _1321;
        _1483 = _1485;
    }
    float _1487 = _1483;
    bool _1489 = !_1475;
    int _1491 = _1489 ? 0 : (-1);
    int _1493 = _1471 & 3;
    bool _1495 = _1493 != 0;
    int _1497 = _1471 & 3;
    bool _1499 = _1497 != 0;
    int _1501 = ~_1449;
    int _1503 = _1501 + _1491;
    int _1505 = _1503 + 1;
    int _1507 = _1495 ? 0 : 1;
    bool _1509 = uint(_1497) > 1u;
    int _1511 = _590 * _1505;
    int _1513 = _1511 + _1215;
    bool _1515 = uint(_1497) >= 2u;
    int _1517 = ~_610;
    int _1519 = _1517 + 1;
    int _1521 = _1515 ? 0 : 1;
    bool _1523 = _590 == 0;
    bool _1525 = _1497 != 3;
    int _1527 = int(_1381) + int(_1481);
    bool _1529 = !_1523;
    int _1531 = _1529 ? _1513 : (-1);
    int _1533 = ~_1507;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    int _1539 = _1537;
    if (!_1509)
    {
        int _1541 = ~_1507;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    int _1547 = _1519 * _1527;
    int _1549 = _1547 + _1335;
    int _1551 = _1531 & 3;
    bool _1553 = _1551 != 0;
    float _1555 = _578 * 2.0;
    int _1557 = ~_1521;
    int _1559 = _1557 + 1;
    int _1561 = _1559 + 1;
    int _1563 = _1553 ? 0 : 1;
    bool _1565 = uint(_1549) >= uint(_610);
    float _1567 = floor(_1555);
    int _1569 = _1561;
    if (_1525)
    {
        int _1571 = ~_1521;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    bool _1577 = uint(_1551) >= 2u;
    bool _1579 = !_1565;
    int _1581 = _1579 ? 0 : (-1);
    float _1583 = float(uint(_921));
    int _1585 = _1577 ? 0 : 1;
    bool _1587 = _1551 != 3;
    float _1589 = as_type<float>(_638) * _1583;
    int _1591 = ~_1527;
    int _1593 = _1591 + _1581;
    int _1595 = _1593 + 1;
    bool _1597 = uint(_1551) > 1u;
    float _1599 = trunc(_1589);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = float(uint(_951));
    int _1607 = _610 * _1595;
    int _1609 = _1607 + _1335;
    float _1611 = float(uint(_1275));
    int _1613 = ~_1585;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = as_type<float>(_654) * _1605;
    bool _1621 = !_1065;
    int _1623 = _1621 ? _1609 : (-1);
    float _1625 = as_type<float>(_668) * _1611;
    int _1627 = _1617;
    if (_1587)
    {
        int _1629 = ~_1585;
        int _1631 = _1629 + 1;
        _1627 = _1631;
    }
    int _1633 = _1627;
    float _1635 = _650 * 2.0;
    int _1637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1639 = _1637 != 0;
    float _1641 = trunc(_1619);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    int _1647 = ~_1563;
    int _1649 = _1647 + 1;
    int _1651 = _1649 + 1;
    int _1653 = _1651;
    if (!_1597)
    {
        int _1655 = ~_1563;
        int _1657 = _1655 + 1;
        _1653 = _1657;
    }
    int _1659 = _1653;
    bool _1661 = !_1639;
    int _1663 = _1661 ? 0 : 1;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1667 = _1665 != 0;
    float _1669 = trunc(_1625);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = ~_570;
    int _1677 = _1675 + 1;
    int _1679 = _1623 & 3;
    bool _1681 = _1679 != 0;
    bool _1683 = !_1667;
    int _1685 = _1683 ? 0 : 1;
    int _1687 = _1677 * int(_1603);
    int _1689 = _1687 + _921;
    bool _1691 = _1679 != 3;
    float _1693 = floor(_1635);
    int _1695 = _620 * int(_1645);
    int _1697 = _1695 + _951;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1701 = _1699 != 0;
    float _1703 = float(uint(_1689));
    float _1705 = float(uint(_1697));
    int _1707 = _634 * int(_1673);
    int _1709 = _1707 + _1275;
    int _1711 = _1681 ? 0 : 1;
    float _1713 = as_type<float>(_638) * _1703;
    bool _1715 = uint(_1679) >= 2u;
    float _1717 = as_type<float>(_654) * _1705;
    bool _1719 = _1567 >= 0.0;
    bool _1721 = isnan(_1567);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan(0.0);
    bool _1727 = _1723 || _1725;
    float _1729 = trunc(_1713);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    int _1735 = _1715 ? 0 : 1;
    bool _1737 = uint(_1679) > 1u;
    int _1739 = ~_1735;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = _1743;
    if (_1691)
    {
        int _1747 = ~_1735;
        int _1749 = _1747 + 1;
        _1745 = _1749;
    }
    int _1751 = _1745;
    float _1753 = trunc(_1717);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    float _1759 = float(uint(_1709));
    bool _1761 = _1567 > 0.0;
    int _1763 = ~_1711;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = as_type<float>(_668) * _1759;
    int _1771 = _1727 ? 0 : 1;
    int _1773 = _1767;
    if (_1701)
    {
        _642 = 0;
    }
    int _1775 = _642;
    int _1777 = _1775;
    if (!_1737)
    {
        int _1779 = ~_1711;
        int _1781 = _1779 + 1;
        _1773 = _1781;
    }
    int _1783 = _1773;
    float _1785 = trunc(_1769);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    if (!_1701)
    {
        _1777 = 2;
    }
    int _1791 = _1777;
    bool _1793 = _1693 > 0.0;
    int _1795 = ~_1771;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = _1799;
    if (!_1761)
    {
        int _1803 = ~_1771;
        int _1805 = _1803 + 1;
        _1801 = _1805;
    }
    int _1807 = _1801;
    bool _1809 = _1693 >= 0.0;
    bool _1811 = isnan(_1693);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    bool _1819 = _1791 != 2;
    int _1821 = int(_1603) + int(_1733);
    int _1823 = ~_570;
    int _1825 = _1823 + 1;
    float _1827 = as_type<float>(_1733);
    if (_1701)
    {
        _596 = 0;
    }
    int _1829 = _596;
    float _1831 = _1817 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1833 = _1825 * _1821;
    int _1835 = _1833 + _921;
    int _1837 = _1829;
    float _1839 = _1831;
    if (!_1701)
    {
        _1837 = 1;
    }
    int _1841 = _1837;
    int _1843 = int(_1645) + int(_1757);
    int _1845 = ~_590;
    int _1847 = _1845 + 1;
    int _1849 = int(_1673) + int(_1789);
    int _1851 = ~_610;
    int _1853 = _1851 + 1;
    int _1855 = _1847 * _1843;
    int _1857 = _1855 + _951;
    int _1859 = ~as_type<int>(_1831);
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1863;
    float _1867 = as_type<float>(_1789);
    float _1869 = as_type<float>(_1757);
    if (!_1793)
    {
        int _1871 = ~as_type<int>(_1831);
        int _1873 = _1871 + 1;
        _1865 = _1873;
    }
    int _1875 = _1865;
    int _1877 = _1853 * _1849;
    int _1879 = _1877 + _1275;
    bool _1881 = _1841 != 1;
    bool _1883 = uint(_1835) >= uint(_570);
    float _1885 = in.m_48.x;
    float _1887 = in.m_48.y;
    float _1889 = in.m_48.z;
    if (_1819)
    {
        _1839 = _578;
    }
    float _1891 = _1839;
    float _1893 = _1891;
    if (_1819)
    {
        _1867 = _650;
    }
    float _1895 = _1867;
    float _1897 = _1895;
    if (!_1819)
    {
        _1893 = _703;
    }
    float _1899 = _1893;
    if (!_1819)
    {
        _1897 = _578;
    }
    float _1901 = _1897;
    bool _1903 = uint(_1857) >= uint(_590);
    bool _1905 = !_1883;
    int _1907 = _1905 ? 0 : (-1);
    bool _1909 = uint(_1879) >= uint(_610);
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1913 = _1911 != 0;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1917 = _1915 != 0;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1921 = _1919 != 0;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1927 = !_1909;
    int _1929 = _1927 ? 0 : (-1);
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1933 = _1931 != 0;
    float _1935 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1937 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1939 = 1.0 / _1925;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1943 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1947 = _578 + _650;
    float _1949 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1935);
    float _1951 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1937);
    float _1953 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1943);
    float _1955 = fma(_689, -2.0, _1945);
    float _1957 = _1947 + (-1.0);
    bool _1959 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1961 = isnan(_536);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1967 = _1963 || _1965;
    float _1969 = float(_1967);
    float _1971 = _703 * 2.0;
    float _1973 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1977 = !_1903;
    int _1979 = _1977 ? 0 : (-1);
    float _1981 = floor(_1971);
    float _1983 = _554 * _1939;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1987 = _536 + _1985;
    bool _1989 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1991 = isnan(_536);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = -_1969;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1941;
    float _2007 = fma(_1973, 2.0, _2005);
    float _2009 = _650 + _703;
    float _2011 = fma(_1983, _1987, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2013 = _1999 * _2003;
    float _2015 = _2009 + (-1.0);
    float _2017 = -_1999;
    float _2019 = _2017 + 1.0;
    float _2021 = _2011 * _2013;
    float _2023 = 0.0;
    if (!_1881)
    {
        _2023 = _650;
    }
    float _2025 = _2023;
    float _2027 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2029 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2021);
    bool _2031 = _1981 >= 0.0;
    bool _2033 = isnan(_1981);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan(0.0);
    bool _2039 = _2035 || _2037;
    float _2041 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1949);
    float _2043 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2029);
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2047 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1951);
    float _2049 = _1899 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2051 = _2039 ? 0 : 1;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2055 = _1981 > 0.0;
    float _2057 = -_2045;
    float _2059 = fma(_2049, 2.0, _2057);
    float _2061 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2063 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2067 = _2025;
    if (!_1881)
    {
        _1827 = _2025;
    }
    float _2069 = _1827;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2073 = _2069;
    if (_1881)
    {
        _2067 = _578;
    }
    float _2075 = _2067;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2079 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2083 = ~_2051;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = _2047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2091 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2077);
    float _2093 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1953);
    int _2095 = _2087;
    if (!_2055)
    {
        int _2097 = ~_2051;
        int _2099 = _2097 + 1;
        _2095 = _2099;
    }
    int _2101 = _2095;
    out.m_63.x = _2061;
    out.m_63.y = _2079;
    out.m_63.z = _2081;
    out.m_63.w = _2063;
    int _2103 = _1471 >> 31;
    float _2105 = -_144;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2059);
    float _2109 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2091);
    int _2111 = ~_1821;
    int _2113 = _2111 + _1907;
    int _2115 = _2113 + 1;
    float _2117 = _2041 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2121 = _2089 + _2119;
    float _2123 = 0.0;
    if (!_1881)
    {
        _2123 = _703;
    }
    float _2125 = _2123;
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2129 = _2125;
    if (_1881)
    {
        _2129 = _650;
    }
    float _2131 = _2129;
    float _2133 = _2093 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2137 = _2117 + _2135;
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2141 = _2103 & 3;
    float _2143 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2127);
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2147 = _2133 + _2145;
    float _2149 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2139);
    int _2151 = _1471 + _2141;
    int _2153 = _570 * _2115;
    int _2155 = _2153 + _921;
    if (!_1881)
    {
        _1869 = _703;
    }
    float _2157 = _1869;
    float _2159 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2149);
    int _2161 = _2151 >> 2;
    float _2163 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2143);
    float _2165 = _2157;
    if (_1881)
    {
        _2165 = _650;
    }
    float _2167 = _2165;
    int _2169 = _2161 << 4;
    int _2171 = _2169 + 368;
    int _2173 = _1531 >> 31;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2177 = _2159 >= 0.0;
    uint _2179 = uint(int(uint(_2171) >> uint(2)));
    uint _2181 = uint(int(uint(int(_2179)) >> uint(2)));
    int _2183 = int(_2179) & 3;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[int(_2181)][_2183];
    int _2187 = int(_2179) + 1;
    uint _2189 = uint(int(uint(_2187) >> uint(2)));
    int _2191 = _2187 & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = _2173 & 3;
    float _2197 = fma(_2175, -2.0, _562);
    if (_1881)
    {
        _2073 = _578;
    }
    float _2199 = _2073;
    int _2201 = _1531 + _2195;
    float _2203 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2197);
    bool _2205 = !_1913;
    int _2207 = _2205 ? 0 : 1;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2211 = !_1917;
    int _2213 = _2211 ? 0 : 1;
    if (_2177)
    {
        out.m_51.x = 0.0;
    }
    int _2215 = _2201 >> 2;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2219 = abs(_2207);
    float _2221 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2223 = _2215 << 4;
    int _2225 = _2223 + 512;
    float _2227 = -_2217;
    float _2229 = fma(_2209, 2.0, _2227);
    int _2231 = abs(_2213);
    float _2233 = in.m_65.x;
    float _2235 = in.m_65.y;
    float _2237 = in.m_65.z;
    float _2239 = float(_1807);
    float _2241 = -_144;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2229);
    float _2245 = float(_2101);
    float _2247 = float(_2219);
    bool _2249 = _570 == 0;
    uint _2251 = uint(int(uint(_2225) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = _2247 * _2245;
    float _2269 = 0.0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].y);
    if (_2177)
    {
        _2269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2273 = _2269;
    int _2275 = abs(_1545);
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2279 = _2267 * (-2.0);
    int _2281 = _2171 + 8;
    uint _2283 = uint(int(uint(_2281) >> uint(2)));
    uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
    int _2287 = int(_2283) & 3;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[int(_2285)][_2287];
    int _2291 = int(_2283) + 1;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    int _2295 = _2291 & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    if (_2177)
    {
        float _2299 = _2273 * 5.0;
        _2271 = as_type<int>(_2299);
    }
    int _2301 = _2271;
    float _2303 = fma(_2221, -2.0, _2277);
    int _2305 = ~_1843;
    int _2307 = _2305 + _1979;
    int _2309 = _2307 + 1;
    float _2311 = fma(_1975, _2279, _1975);
    int _2313 = abs(_1659);
    if (_2177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8210 = as_type<float>(_2301);
        out.gl_Position.z = _8210;
    }
    bool _2315 = !_2249;
    int _2317 = _2315 ? _2155 : (-1);
    float _2319 = fma(_2279, _2233, _2233);
    bool _2321 = !_1499;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2303);
    int _2327 = _1623 & 3;
    bool _2329 = _2327 != 0;
    int _2331 = _1531 & 3;
    bool _2333 = _2331 != 0;
    int _2335 = _590 * _2309;
    int _2337 = _2335 + _951;
    int _2339 = ~_1849;
    int _2341 = _2339 + _1929;
    int _2343 = _2341 + 1;
    float _2345 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2347 = int(_2345);
    bool _2349 = !_2333;
    int _2351 = _2349 ? 0 : 1;
    int _2353 = _2225 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    int _2371 = _1623 >> 31;
    int _2373 = _610 * _2343;
    int _2375 = _2373 + _1275;
    bool _2377 = _1497 != 3;
    int _2379 = _2371 & 3;
    int _2381 = ~_2275;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _1623 + _2379;
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2391 = int(_2389);
    int _2393 = _2385 * as_type<int>(_2193);
    int _2395 = abs(_2323);
    int _2397 = _2387 >> 2;
    int _2399 = abs(_1575);
    int _2401 = ~_2395;
    int _2403 = _2401 + 1;
    int _2405 = _2403 + 1;
    int _2407 = _2397 << 4;
    int _2409 = _2407 + 656;
    int _2411 = ~_2399;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    int _2417 = _2405 * as_type<int>(_2185);
    int _2419 = _2417 + _2393;
    int _2421 = ~_2313;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    uint _2427 = uint(int(uint(_2409) >> uint(2)));
    uint _2429 = uint(int(uint(int(_2427)) >> uint(2)));
    int _2431 = int(_2427) & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = int(_2427) + 1;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    int _2439 = _2435 & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    int _2443 = abs(_2351);
    bool _2445 = !_2377;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = _2425 * as_type<int>(_2265);
    bool _2451 = _1551 != 3;
    int _2453 = _2415 * as_type<int>(_2289);
    int _2455 = _2453 + _2419;
    int _2457 = ~_2443;
    int _2459 = _2457 + 1;
    int _2461 = _2459 + 1;
    float _2463 = float(uint(_2391));
    bool _2465 = !_2451;
    int _2467 = _2465 ? 0 : (-1);
    int _2469 = _2461 * as_type<int>(_2257);
    int _2471 = _2469 + _2449;
    float _2473 = 1.0 / _2463;
    int _2475 = abs(_1633);
    int _2477 = abs(_2447);
    int _2479 = abs(_2467);
    int _2481 = abs(_1685);
    int _2483 = abs(_1663);
    int _2485 = _2409 + 8;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    uint _2489 = uint(int(uint(int(_2487)) >> uint(2)));
    int _2491 = int(_2487) & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    int _2495 = int(_2487) + 1;
    uint _2497 = uint(int(uint(_2495) >> uint(2)));
    int _2499 = _2495 & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = ~_2475;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = float(uint(_2347));
    int _2511 = ~_2477;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    int _2517 = _2507 * as_type<int>(_2361);
    int _2519 = _2517 + _2471;
    int _2521 = ~_2479;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    float _2527 = 1.0 / _2509;
    int _2529 = ~_2483;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    int _2535 = _2515 * as_type<int>(_2297);
    int _2537 = _2535 + _2455;
    int _2539 = ~_2481;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    int _2545 = _2525 * as_type<int>(_2369);
    int _2547 = _2545 + _2519;
    bool _2549 = _590 == 0;
    int _2551 = _2537 * _2533;
    bool _2553 = _1679 != 3;
    int _2555 = _2543 * _2547;
    bool _2557 = !_2549;
    int _2559 = _2557 ? _2337 : (-1);
    int _2561 = _2317 * _2483;
    int _2563 = _2561 + _2551;
    bool _2565 = !_2329;
    int _2567 = _2565 ? 0 : 1;
    float _2569 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2571 = int(_2569);
    int _2573 = abs(_1751);
    int _2575 = _2559 * _2481;
    int _2577 = _2575 + _2555;
    int _2579 = abs(_2567);
    bool _2581 = !_2553;
    int _2583 = _2581 ? 0 : (-1);
    int _2585 = abs(_1783);
    float _2587 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2589 = log2(_2587);
    int _2591 = as_type<int>(_2527) + (-2);
    float _2593 = float(uint(_2563));
    int _2595 = abs(_2583);
    float _2597 = as_type<float>(_2591) * _2593;
    int _2599 = as_type<int>(_2473) + (-2);
    int _2601 = ~_2585;
    int _2603 = _2601 + 1;
    int _2605 = _2603 + 1;
    float _2607 = float(uint(_2577));
    float _2609 = trunc(_2597);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    int _2615 = ~_2579;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2605 * as_type<int>(_2441);
    float _2623 = as_type<float>(_2599) * _2607;
    int _2625 = _2619 * as_type<int>(_2433);
    int _2627 = _2625 + _2621;
    int _2629 = ~_2573;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    float _2635 = _2589 * _144;
    bool _2637 = !_1933;
    int _2639 = _2637 ? 0 : 1;
    float _2641 = trunc(_2623);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = ~_2595;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    int _2653 = _2633 * as_type<int>(_2493);
    int _2655 = _2653 + _2627;
    int _2657 = abs(_2639);
    int _2659 = ~_2347;
    int _2661 = _2659 + 1;
    int _2663 = _2651 * as_type<int>(_2501);
    int _2665 = _2663 + _2655;
    float _2667 = float(uint(_2571));
    float _2669 = exp2(_2635);
    int _2671 = ~_2391;
    int _2673 = _2671 + 1;
    int _2675 = ~_2657;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    bool _2681 = _610 == 0;
    int _2683 = _2661 * int(_2613);
    int _2685 = _2683 + _2563;
    int _2687 = abs(_2347);
    float _2689 = 1.0 / _2667;
    int _2691 = _2679 * _2665;
    bool _2693 = !_2681;
    int _2695 = _2693 ? _2375 : (-1);
    float _2697 = -_144;
    float _2699 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2007);
    float _2701 = float(uint(_2685));
    int _2703 = _2695 * _2657;
    int _2705 = _2703 + _2691;
    int _2707 = abs(_2391);
    int _2709 = _2673 * int(_2645);
    int _2711 = _2709 + _2577;
    float _2713 = as_type<float>(_2591) * _2701;
    float _2715 = float(uint(_2687));
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2719 = 1.0 + _2717;
    float _2721 = -_2669;
    float _2723 = _2721 + 1.0;
    float _2725 = float(uint(_2711));
    float _2727 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _693);
    float _2729 = 1.0 / _2715;
    int _2731 = as_type<int>(_2689) + (-2);
    float _2733 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2735 = as_type<float>(_2599) * _2725;
    int _2737 = abs(_2571);
    float _2739 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2733);
    float _2741 = float(uint(_2707));
    float _2743 = 1.0 / _2719;
    float _2745 = float(uint(_2737));
    float _2747 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2739);
    float _2749 = float(uint(_2705));
    float _2751 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1955);
    int _2753 = abs(_2563);
    float _2755 = 1.0 / _2741;
    float _2757 = as_type<float>(_2731) * _2749;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2761 = as_type<int>(_2729) + (-2);
    int _2763 = abs(_2577);
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2767 = 1.0 / _2745;
    float _2769 = float(uint(_2753));
    float _2771 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2759);
    bool _2773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2775 = isnan(1.0);
    bool _2777 = _2773 || _2775;
    bool _2779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2781 = _2777 || _2779;
    float _2783 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2765);
    float _2785 = float(uint(_2763));
    float _2787 = as_type<float>(_2761) * _2769;
    bool _2789 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2791 = isnan(0.0);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2797 = _2793 || _2795;
    float _2799 = trunc(_2757);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = as_type<int>(_2755) + (-2);
    float _2807 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2771);
    int _2809 = abs(_2705);
    float _2811 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2783);
    float _2813 = _2797 ? _2723 : 0.0;
    float _2815 = as_type<float>(_2805) * _2785;
    float _2817 = float(uint(_2809));
    float _2819 = trunc(_2787);
    float _2821 = precise::max(_2819, 0.0);
    uint _2823 = uint(_2821);
    int _2825 = as_type<int>(_2767) + (-2);
    float _2827 = _2121 * _2121;
    float _2829 = float(_2231);
    if (_2781)
    {
        float _2831 = _2813 * _2743;
        _148 = _2831;
    }
    float _2833 = _148;
    int _2835 = ~_2571;
    int _2837 = _2835 + 1;
    float _2839 = fma(_2137, _2137, _2827);
    float _2841 = as_type<float>(_2825) * _2817;
    float _2843 = trunc(_2815);
    float _2845 = precise::max(_2843, 0.0);
    uint _2847 = uint(_2845);
    float _2849 = _2829 * _2239;
    int _2851 = _2837 * int(_2803);
    int _2853 = _2851 + _2705;
    float _2855 = fma(_2147, _2147, _2839);
    int _2857 = ~_2687;
    int _2859 = _2857 + 1;
    float _2861 = _2849 * (-2.0);
    int _2863 = ~_2707;
    int _2865 = _2863 + 1;
    float _2867 = trunc(_2713);
    float _2869 = precise::max(_2867, 0.0);
    uint _2871 = uint(_2869);
    int _2873 = _2859 * int(_2823);
    int _2875 = _2873 + _2753;
    float _2877 = float(uint(_2853));
    float _2879 = fma(_2861, _2235, _2235);
    int _2881 = ~_2737;
    int _2883 = _2881 + 1;
    float _2885 = float(uint(_2875));
    float _2887 = trunc(_2841);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = _2865 * int(_2847);
    int _2895 = _2893 + _2763;
    int _2897 = ~_2347;
    int _2899 = _2897 + 1;
    float _2901 = rsqrt(_2855);
    float _2903 = trunc(_2735);
    float _2905 = precise::max(_2903, 0.0);
    uint _2907 = uint(_2905);
    int _2909 = _2883 * int(_2891);
    int _2911 = _2909 + _2809;
    float _2913 = float(uint(_2911));
    float _2915 = as_type<float>(_2731) * _2877;
    float _2917 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2919 = int(_2613) + int(_2871);
    float _2921 = as_type<float>(_2825) * _2913;
    float _2923 = float(uint(_2895));
    float _2925 = as_type<float>(_2761) * _2885;
    float _2927 = _2917 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2929 = int(_2645) + int(_2907);
    float _2931 = trunc(_2915);
    float _2933 = precise::max(_2931, 0.0);
    uint _2935 = uint(_2933);
    float _2937 = as_type<float>(_2805) * _2923;
    float _2939 = _2927 * _2901;
    int _2941 = ~_2391;
    int _2943 = _2941 + 1;
    float _2945 = _578 + (-0.5);
    float _2947 = _2121 * _2939;
    float _2949 = _2137 * _2939;
    float _2951 = trunc(_2937);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    float _2957 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2319);
    float _2959 = -_2947;
    float _2961 = _2121 + _2959;
    float _2963 = -_2949;
    float _2965 = _2137 + _2963;
    int _2967 = _2943 * _2929;
    int _2969 = _2967 + _2577;
    float _2971 = _2961 * _2961;
    int _2973 = ~_2707;
    int _2975 = _2973 + 1;
    float _2977 = trunc(_2925);
    float _2979 = precise::max(_2977, 0.0);
    uint _2981 = uint(_2979);
    int _2983 = int(_2803) + int(_2935);
    float _2985 = fma(_2965, _2965, _2971);
    int _2987 = ~_2687;
    int _2989 = _2987 + 1;
    float _2991 = _2147 * _2939;
    int _2993 = ~_2571;
    int _2995 = _2993 + 1;
    float _2997 = fma(_2311, _2833, _2957);
    bool _2999 = uint(_2969) >= uint(_2391);
    float _3001 = -_2991;
    float _3003 = _2147 + _3001;
    int _3005 = _2899 * _2919;
    int _3007 = _3005 + _2563;
    int _3009 = int(_2847) + int(_2955);
    float _3011 = trunc(_2921);
    float _3013 = precise::max(_3011, 0.0);
    uint _3015 = uint(_3013);
    int _3017 = _2995 * _2983;
    int _3019 = _3017 + _2705;
    bool _3021 = uint(_3007) >= uint(_2347);
    int _3023 = _2975 * _3009;
    int _3025 = _3023 + _2763;
    int _3027 = int(_2823) + int(_2981);
    float _3029 = _650 + (-0.5);
    bool _3031 = uint(_3019) >= uint(_2571);
    float _3033 = fma(_3003, _3003, _2985);
    int _3035 = ~_2737;
    int _3037 = _3035 + 1;
    int _3039 = _2989 * _3027;
    int _3041 = _3039 + _2753;
    float _3043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3045 = uint(_3025) >= uint(_2707);
    bool _3047 = !_3031;
    int _3049 = _3047 ? 0 : (-1);
    int _3051 = int(_2891) + int(_3015);
    float _3053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3055 = uint(_3041) >= uint(_2687);
    bool _3057 = !_3021;
    int _3059 = _3057 ? 0 : (-1);
    int _3061 = _3037 * _3051;
    int _3063 = _3061 + _2809;
    bool _3065 = !_2999;
    int _3067 = _3065 ? 0 : (-1);
    int _3069 = ~_2919;
    int _3071 = _3069 + _3059;
    int _3073 = _3071 + 1;
    float _3075 = _3043 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3077 = ~_2929;
    int _3079 = _3077 + _3067;
    int _3081 = _3079 + 1;
    float _3083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3085 = uint(_3063) >= uint(_2737);
    int _3087 = _2347 * _3073;
    int _3089 = _3087 + _2563;
    int _3091 = _2577 ^ _2391;
    int _3093 = _2391 * _3081;
    int _3095 = _3093 + _2577;
    bool _3097 = _2347 == 0;
    bool _3099 = !_3045;
    int _3101 = _3099 ? 0 : (-1);
    float _3103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3105 = _2391 == 0;
    bool _3107 = !_3085;
    int _3109 = _3107 ? 0 : (-1);
    bool _3111 = _2391 == 0;
    int _3113 = ~_2983;
    int _3115 = _3113 + _3049;
    int _3117 = _3115 + 1;
    bool _3119 = !_3097;
    int _3121 = _3119 ? _3089 : (-1);
    bool _3123 = !_3105;
    int _3125 = _3123 ? _3095 : (-1);
    int _3127 = _2705 ^ _2571;
    int _3129 = _2571 * _3117;
    int _3131 = _3129 + _2705;
    int _3133 = _2563 ^ _2347;
    int _3135 = ~_3101;
    int _3137 = _3009 + _3135;
    int _3139 = _3137 + 1;
    float _3141 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3143 = float(_3121);
    float _3145 = fma(_3075, _1331, -0.5);
    float _3147 = float(_3125);
    float _3149 = fma(_3141, _1391, -0.5);
    bool _3151 = _2571 == 0;
    float _3153 = fma(_3075, _3143, _2699);
    bool _3155 = _2571 == 0;
    float _3157 = fma(_3141, _3147, _2243);
    uint _3159 = uint(int(uint(_3091) >> uint(31)));
    float _3161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3163 = uint(int(uint(_3133) >> uint(31)));
    float _3165 = _3103 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3167 = !_3055;
    int _3169 = _3167 ? 0 : (-1);
    float _3171 = fma(_2747, _3145, _3153);
    uint _3173 = uint(int(uint(_3127) >> uint(31)));
    float _3175 = fma(_3165, _1413, -0.5);
    int _3177 = ~int(_3159);
    int _3179 = _3177 + 1;
    float _3181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3183 = !_3151;
    int _3185 = _3183 ? _3131 : (-1);
    float _3187 = fma(_2109, _3149, _3157);
    int _3189 = ~int(_3163);
    int _3191 = _3189 + 1;
    float _3193 = fma(_2027, _2861, _2027);
    int _3195 = ~_3169;
    int _3197 = _3027 + _3195;
    int _3199 = _3197 + 1;
    int _3201 = ~_3109;
    int _3203 = _3051 + _3201;
    int _3205 = _3203 + 1;
    int _3207 = ~int(_3173);
    int _3209 = _3207 + 1;
    int _3211 = _3139 ^ _3179;
    float _3213 = float(_3185);
    int _3215 = _3199 ^ _3191;
    int _3217 = _3205 ^ _3209;
    float _3219 = fma(_3165, _3213, _2107);
    int _3221 = ~_3179;
    int _3223 = _3221 + _3211;
    int _3225 = _3223 + 1;
    bool _3227 = _2347 == 0;
    float _3229 = fma(_2807, _3175, _3219);
    int _3231 = ~_3191;
    int _3233 = _3231 + _3215;
    int _3235 = _3233 + 1;
    float _3237 = _3083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3239 = ~_3209;
    int _3241 = _3239 + _3217;
    int _3243 = _3241 + 1;
    float _3245 = _3161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3247 = !_3111;
    int _3249 = _3247 ? _3225 : (-1);
    float _3251 = _3181 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3253 = !_3227;
    int _3255 = _3253 ? _3235 : (-1);
    float _3257 = fma(_1473, _3245, -0.5);
    bool _3259 = !_3155;
    int _3261 = _3259 ? _3243 : (-1);
    float _3263 = fma(_3251, _1487, -0.5);
    float _3265 = float(_3249);
    float _3267 = fma(_1447, _3237, -0.5);
    float _3269 = float(_3255);
    float _3271 = float(_3261);
    float _3273 = -_2203;
    float _3275 = fma(_3245, _3265, _3273);
    bool _3277 = !_1921;
    int _3279 = _3277 ? 0 : 1;
    float _3281 = -_2751;
    float _3283 = fma(_3237, _3269, _3281);
    float _3285 = _3229 + 0.5;
    float _3287 = -_2325;
    float _3289 = fma(_3251, _3271, _3287);
    float _3291 = fma(_2163, _3257, _3275);
    float _3293 = fma(_2727, _3267, _3283);
    float _3295 = _3171 + 0.5;
    float _3297 = fma(_2811, _3263, _3289);
    float _3299 = _3187 + 0.5;
    float _3301 = _3293 + 0.5;
    float _3303 = _3291 + 0.5;
    float _3305 = _3297 + 0.5;
    out.m_67.x = _3295;
    out.m_67.y = _3301;
    out.m_67.z = _3299;
    out.m_67.w = _3303;
    out.m_69.x = _3285;
    out.m_69.y = _3305;
    float _3307 = _3219;
    float _3309 = as_type<float>(_3063);
    float _3311 = _3229;
    if (_2177)
    {
        return out;
    }
    float _3313 = -_2947;
    float _3315 = _2089 + _3313;
    float _3317 = float(_1875);
    float _3319 = -_2949;
    float _3321 = _2117 + _3319;
    int _3323 = abs(_3279);
    float _3325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3327 = _3315 + _3325;
    float _3329 = -_2991;
    float _3331 = _2133 + _3329;
    float _3333 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3335 = _3321 + _3333;
    float _3337 = _578 + _703;
    float _3339 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3343 = _3331 + _3341;
    float _3345 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2879);
    float _3347 = _3337 + (-1.0);
    float _3349 = fma(_3335, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3339);
    float _3351 = float(_3323);
    float _3353 = _703 + (-0.5);
    float _3355 = fma(_3343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3349);
    float _3357 = fma(_3193, _2833, _3345);
    float _3359 = _3351 * _3317;
    float _3361 = _2997 * 0.15915493667125701904296875;
    float _3363 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3365 = _3355 >= 0.0;
    float _3367 = _3359 * (-2.0);
    float _3369 = _3357 * 0.15915493667125701904296875;
    float _3371 = sqrt(_3033);
    float _3373 = fma(_3367, _2237, _2237);
    float _3375 = fma(_3363, _3367, _3363);
    float _3377 = fma(_3353, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3373);
    float _3379 = _3361 * 6.283185482025146484375;
    float _3381 = sin(_3379);
    float _3383 = fma(_3375, _2833, _3377);
    float _3385 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_3365)
    {
        _3385 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3387 = _3385;
    int _3389 = as_type<int>(_3387);
    if (_3365)
    {
        out.m_51.x = 0.0;
    }
    float _3391 = _3383 * 0.15915493667125701904296875;
    float _3393 = _3361 * 6.283185482025146484375;
    float _3395 = cos(_3393);
    if (_3365)
    {
        float _3397 = _3387 * 5.0;
        _3389 = as_type<int>(_3397);
    }
    int _3399 = _3389;
    if (_3365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9747 = as_type<float>(_3399);
        out.gl_Position.z = _9747;
    }
    float _3401 = _3369 * 6.283185482025146484375;
    float _3403 = sin(_3401);
    float _3405 = _3369 * 6.283185482025146484375;
    float _3407 = cos(_3405);
    float _3409 = _3391 * 6.283185482025146484375;
    float _3411 = sin(_3409);
    if (_3365)
    {
        return out;
    }
    float _3413 = -_2089;
    float _3415 = _3413 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3417 = -_2117;
    float _3419 = _3417 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3421 = -_2133;
    float _3423 = _3421 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3425 = in.m_71.x;
    float _3427 = in.m_71.y;
    float _3429 = in.m_71.z;
    float _3431 = _3415 * _3415;
    float _3433 = _3391 * 6.283185482025146484375;
    float _3435 = cos(_3433);
    float _3437 = _3381 * _3403;
    float _3439 = _3395 * _3407;
    float _3441 = fma(_3419, _3419, _3431);
    float _3443 = _3395 * _3403;
    float _3445 = _3381 * _3407;
    float _3447 = fma(_3411, _3439, _3437);
    float _3449 = fma(_3423, _3423, _3441);
    float _3451 = fma(_3411, _3437, _3439);
    float _3453 = _2901 * _3371;
    float _3455 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3457 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3459 = rsqrt(_3449);
    float _3461 = -_3443;
    float _3463 = fma(_3411, _3445, _3461);
    float _3465 = _3453 * _3455;
    float _3467 = _3395 * _3435;
    float _3469 = _3407 * _3435;
    float _3471 = _3381 * _3435;
    float _3473 = _3403 * _3435;
    float _3475 = -_3445;
    float _3477 = fma(_3411, _3443, _3475);
    float _3479 = _2917 * _3453;
    float _3481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3425);
    float _3483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3427);
    float _3485 = _3453 * _3457;
    float _3487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3429);
    float _3489 = _3481 * _3479;
    float _3491 = _3483 * _3465;
    bool _3493 = _3427 != 0.0;
    bool _3495 = isnan(_3427);
    bool _3497 = _3493 || _3495;
    bool _3499 = isnan(0.0);
    bool _3501 = _3497 || _3499;
    float _3503 = _3419 * _3459;
    float _3505 = _3423 * _3459;
    float _3507 = in.m_73.x;
    float _3509 = in.m_73.y;
    float _3511 = in.m_73.z;
    float _3513 = _3487 * _3485;
    float _3515 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3517 = _3503 * _3515;
    float _3519 = _3415 * _3459;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3523 = _3505 * _3521;
    bool _3525 = _3425 == 0.0;
    bool _3527 = !_3501;
    bool _3529 = _3525 && _3527;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3533 = -_3517;
    float _3535 = fma(_3505, _3531, _3533);
    float _3537 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3539 = _3519 * _3537;
    float _3541 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3543 = -_3523;
    float _3545 = fma(_3519, _3541, _3543);
    float _3547 = in.m_75.x;
    float _3549 = in.m_75.y;
    float _3551 = in.m_75.z;
    float _3553 = in.m_75.w;
    float _3555 = _3535 * _3535;
    float _3557 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3559 = -_3539;
    float _3561 = fma(_3503, _3557, _3559);
    bool _3563 = _3429 == 0.0;
    bool _3565 = _3563 && _3529;
    float _3567 = -_3491;
    float _3569 = _3411 * _3567;
    float _3571 = fma(_3545, _3545, _3555);
    float _3573 = _3467 * _3491;
    float _3575 = _3471 * _3491;
    float _3577 = fma(_3469, _3489, _3569);
    float _3579 = fma(_3561, _3561, _3571);
    float _3581 = fma(_3447, _3489, _3573);
    float _3583 = fma(_3463, _3489, _3575);
    float _3585 = fma(_3473, _3513, _3577);
    float _3587 = rsqrt(_3579);
    float _3589 = fma(_3477, _3513, _3581);
    float _3591 = _3491;
    float _3593 = _3571;
    float _3595 = _3489;
    float _3597 = _3451;
    if (_3565)
    {
        _3307 = _3507;
    }
    float _3599 = _3307;
    float _3601 = _3599;
    if (_3565)
    {
        _3309 = _3511;
    }
    float _3603 = _3309;
    float _3605 = _3603;
    if (_3565)
    {
        _3311 = _3509;
    }
    float _3607 = _3311;
    float _3609 = _3607;
    if (_3565)
    {
        _3591 = _3599;
    }
    float _3611 = _3591;
    float _3613 = _3611;
    if (!_3565)
    {
        _3601 = _3507;
    }
    float _3615 = _3601;
    if (_3565)
    {
        _3593 = _3603;
    }
    float _3617 = _3593;
    float _3619 = _3617;
    if (_3565)
    {
        _3595 = _3607;
    }
    float _3621 = _3595;
    float _3623 = _3545 * _3587;
    float _3625 = _3621;
    if (!_3565)
    {
        _3605 = _3511;
    }
    float _3627 = _3605;
    float _3629 = _3535 * _3587;
    if (!_3565)
    {
        _3609 = _3509;
    }
    float _3631 = _3609;
    float _3633 = _3551 * _3615;
    float _3635 = _3561 * _3587;
    if (!_3565)
    {
        float _3637 = fma(_3429, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3627);
        _3619 = _3637;
    }
    float _3639 = _3619;
    float _3641 = _3505 * _3629;
    float _3643 = _3519 * _3623;
    float _3645 = -_3633;
    float _3647 = fma(_3547, _3627, _3645);
    float _3649 = _3549 * _3627;
    float _3651 = fma(_3451, _3513, _3583);
    float _3653 = _3547 * _3631;
    float _3655 = -_3641;
    float _3657 = fma(_3519, _3635, _3655);
    float _3659 = -_3643;
    float _3661 = fma(_3503, _3629, _3659);
    float _3663 = _3639;
    if (!_3565)
    {
        float _3665 = fma(_3425, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3615);
        _3613 = _3665;
    }
    float _3667 = _3613;
    float _3669 = -_3649;
    float _3671 = fma(_3551, _3631, _3669);
    float _3673 = -_3653;
    float _3675 = fma(_3549, _3615, _3673);
    float _3677 = _3657 * _3589;
    float _3679 = _3661 * _3589;
    if (!_3565)
    {
        float _3681 = fma(_3427, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3631);
        _3625 = _3681;
    }
    float _3683 = _3625;
    float _3685 = _3647 * _3553;
    float _3687 = _3671 * _3553;
    float _3689 = _3503 * _3635;
    float _3691 = _3675 * _3553;
    float _3693 = fma(_3623, _3585, _3677);
    float _3695 = fma(_3635, _3585, _3679);
    float _3697 = -_3689;
    float _3699 = fma(_3505, _3623, _3697);
    float _3701 = _3447 * _3657;
    float _3703 = fma(_3503, _3651, _3693);
    float _3705 = fma(_3505, _3651, _3695);
    float _3707 = _3447 * _3699;
    float _3709 = _3447 * _3661;
    float _3711 = _2117 + _3703;
    float _3713 = _2133 + _3705;
    float _3715 = _3467 * _3657;
    float _3717 = _3477 * _3657;
    float _3719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3721 = _3711 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3725 = _3713 + _3723;
    float _3727 = _3467 * _3699;
    float _3729 = _3467 * _3661;
    float _3731 = _3721 * _3721;
    float _3733 = _3725 * _3725;
    float _3735 = _3477 * _3661;
    float _3737 = _3477 * _3699;
    float _3739 = fma(_3469, _3623, _3701);
    float _3741 = _3731 + _3733;
    float _3743 = fma(_3469, _3629, _3707);
    float _3745 = fma(_3469, _3635, _3709);
    float _3747 = _3699 * _3589;
    float _3749 = sqrt(_3741);
    float _3751 = -_3411;
    float _3753 = fma(_3751, _3623, _3715);
    float _3755 = fma(_3473, _3623, _3717);
    float _3757 = fma(_3629, _3585, _3747);
    float _3759 = -_3411;
    float _3761 = fma(_3759, _3629, _3727);
    float _3763 = -_3411;
    float _3765 = fma(_3763, _3635, _3729);
    float _3767 = fma(_3473, _3635, _3735);
    float _3769 = fma(_3473, _3629, _3737);
    float _3771 = fma(_3463, _3503, _3739);
    float _3773 = fma(_3471, _3503, _3753);
    float _3775 = fma(_3451, _3503, _3755);
    float _3777 = fma(_3519, _3651, _3757);
    float _3779 = fma(_3471, _3519, _3761);
    float _3781 = fma(_3471, _3505, _3765);
    float _3783 = fma(_3463, _3519, _3743);
    float _3785 = _2089 + _3777;
    bool _3787 = _3749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3789 = fma(_3463, _3505, _3745);
    float _3791 = fma(_3451, _3519, _3769);
    float _3793 = fma(_3451, _3505, _3767);
    float _3795 = _3773 * _3549;
    float _3797 = _3779 * _3549;
    float _3799 = _3781 * _3549;
    float _3801 = _3773 * _3683;
    float _3803 = _3685 * _3773;
    float _3805 = _3779 * _3683;
    float _3807 = _3781 * _3683;
    float _3809 = _3685 * _3779;
    float _3811 = _3685 * _3781;
    float _3813 = _3731;
    float _3815 = _3733;
    float _3817 = _3711;
    float _3819 = _3713;
    if (!_3787)
    {
        _3597 = _3785;
    }
    float _3821 = _3597;
    bool _3823 = !_3787;
    float _3825 = _3821;
    if (!_3823)
    {
        float _3827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3831 = _3749 + _3829;
        float _3833 = rsqrt(_3741);
        float _3835 = _3831 * _3827;
        float _3837 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3839 = _3835 * 0.15915493667125701904296875;
        float _3841 = _3839 * 6.283185482025146484375;
        float _3843 = sin(_3841);
        float _3845 = _3839 * 6.283185482025146484375;
        float _3847 = cos(_3845);
        float _3849 = fma(_3843, _3837, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3851 = _3833 * _3849;
        float _3853 = _3847 + (-1.0);
        float _3855 = fma(_3721, _3851, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3857 = fma(_3725, _3851, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3859 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3863 = _3855 + _3861;
        float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3867 = _3857 + _3865;
        float _3869 = fma(_3785, _3847, _3859);
        float _3871 = _3863 * _3863;
        float _3873 = _3867 * _3867;
        _3825 = _3869;
        _3813 = _3871;
        _3815 = _3873;
        _3817 = _3855;
        _3819 = _3857;
    }
    float _3875 = _3825;
    float _3877 = _3813;
    float _3879 = _3815;
    float _3881 = _3817;
    float _3883 = _3819;
    float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3887 = _3875 + _3885;
    float _3889 = fma(_3771, _3667, _3801);
    float _3891 = fma(_3783, _3667, _3805);
    float _3893 = fma(_3789, _3667, _3807);
    float _3895 = fma(_3887, _3887, _3877);
    float _3897 = fma(_3771, _3547, _3795);
    float _3899 = fma(_3783, _3547, _3797);
    float _3901 = fma(_3687, _3771, _3803);
    float _3903 = _3895 + _3879;
    float _3905 = fma(_3687, _3783, _3809);
    float _3907 = fma(_3789, _3547, _3799);
    float _3909 = fma(_3687, _3789, _3811);
    float _3911 = fma(_3775, _3551, _3897);
    float _3913 = fma(_3791, _3551, _3899);
    float _3915 = sqrt(_3903);
    float _3917 = fma(_3691, _3775, _3901);
    float _3919 = fma(_3791, _3639, _3891);
    float _3921 = fma(_3691, _3791, _3905);
    float _3923 = fma(_3793, _3551, _3907);
    float _3925 = fma(_3775, _3639, _3889);
    float _3927 = fma(_3691, _3793, _3909);
    float _3929 = fma(_3793, _3639, _3893);
    out.m_77.x = _3911;
    out.m_77.y = _3913;
    out.m_77.z = _3923;
    out.m_79.x = _3917;
    out.m_79.y = _3921;
    out.m_79.z = _3927;
    bool _3931 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3933 = isnan(_3915);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3939 = _3935 || _3937;
    out.m_81.x = _3925;
    out.m_81.y = _3919;
    out.m_81.z = _3929;
    float _3941 = _3911;
    if (!_3939)
    {
        _3663 = 1.0;
    }
    float _3943 = _3663;
    bool _3945 = !_3939;
    float _3947 = _3943;
    if (!_3945)
    {
        bool _3949 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3951 = isnan(_3915);
        bool _3953 = _3949 || _3951;
        bool _3955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3957 = _3953 || _3955;
        if (!_3957)
        {
            float _3959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3961 = _3915 + _3959;
            float _3963 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3965 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3963;
            float _3967 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3971 = 1.0 / _3965;
            float _3973 = _3961 * _3971;
            float _3975 = fma(_3973, _3969, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3947 = _3975;
            _3977 = true;
        }
        else
        {
            bool _3979 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3981 = isnan(_3915);
            bool _3983 = _3979 || _3981;
            bool _3985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3987 = _3983 || _3985;
            if (!_3987)
            {
                float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3991 = _3915 + _3989;
                float _3993 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3995 = _3993 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3997 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3999 = _3997 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4001 = 1.0 / _3995;
                float _4003 = _3991 * _4001;
                float _4005 = fma(_4003, _3999, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3947 = _4005;
                _3977 = true;
            }
            else
            {
                _3947 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3977 = false;
    float _4007 = _3947;
    float _4009 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4011 = _3881 + _4009;
    float _4013 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4015 = _3875 + _4013;
    float _4017 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4019 = _3883 + _4017;
    bool _4021 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4023 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4025 = _4021 || _4023;
    bool _4027 = isnan(0.5);
    bool _4029 = _4025 || _4027;
    float _4031 = fma(_4011, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4033 = fma(_4015, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4035 = fma(_4019, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4037 = -_2949;
    float _4039 = _4037 + _4031;
    float _4041 = -_2947;
    float _4043 = _4041 + _4033;
    float _4045 = -_2991;
    float _4047 = _4045 + _4035;
    float _4049 = _4043;
    float _4051 = _4039;
    float _4053 = _4047;
    float _4055 = _4035;
    if (!_4029)
    {
        float _4057 = _3327 * _3327;
        float _4059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4061 = -_2133;
        float _4063 = _4061 + _4035;
        float _4065 = -_2089;
        float _4067 = _4065 + _4033;
        float _4069 = fma(_3335, _3335, _4057);
        float _4071 = fma(_3343, _3343, _4069);
        float _4073 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4075 = sqrt(_4071);
        float _4077 = 1.0 / _3453;
        float _4079 = _4073 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4081 = precise::min(_4075, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4083 = _4081 * _4059;
        float _4085 = _4083 * _4077;
        float _4087 = -_2117;
        float _4089 = _4087 + _4031;
        float _4091 = _4079 * _4085;
        float _4093 = _4063 * _4085;
        float _4095 = fma(_4089, _4091, _3321);
        float _4097 = fma(_4067, _4091, _3315);
        float _4099 = fma(_4079, _4093, _3331);
        _4049 = _4097;
        _4051 = _4095;
        _4053 = _4099;
    }
    float _4101 = _4049;
    float _4103 = _4051;
    float _4105 = _4053;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4109 = _4101 + _4107;
    float _4111 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4113 = _4103 + _4111;
    float _4115 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4117 = _4105 + _4115;
    float _4119 = _4109 * _4109;
    float _4121 = fma(_4113, _4113, _4119);
    float _4123 = fma(_4117, _4117, _4121);
    float _4125 = rsqrt(_4123);
    float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4129 = _4113 * _4127;
    float _4131 = _4117 * _4127;
    float _4133 = _4129 * _4129;
    float _4135 = _4131 * _4131;
    float _4137 = _4133 + _4135;
    float _4139 = sqrt(_4137);
    bool _4141 = _4139 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4145 = _4139 + _4143;
    float _4147 = _4117;
    float _4149 = _4137;
    float _4151 = _4145;
    float _4153 = _4109;
    if (_4141)
    {
        float _4155 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4147 = _4155;
    }
    float _4157 = _4147;
    if (_4141)
    {
        float _4159 = rsqrt(_4137);
        _4149 = _4159;
    }
    float _4161 = _4149;
    float _4163 = _4161;
    if (_4141)
    {
        float _4165 = _4145 * _4157;
        _4151 = _4165;
    }
    float _4167 = _4151;
    if (_4141)
    {
        float _4169 = _4167 * 0.15915493667125701904296875;
        _3941 = _4169;
    }
    float _4171 = _3941;
    float _4173 = _4125;
    float _4175 = _4171;
    if (_4141)
    {
        float _4177 = _4171 * 6.283185482025146484375;
        float _4179 = sin(_4177);
        _4173 = _4179;
    }
    float _4181 = _4173;
    float _4183 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4185 = precise::max(0.0, _4183);
    float _4187 = _4157;
    float _4189 = _4185;
    if (_4141)
    {
        float _4191 = _4171 * 6.283185482025146484375;
        float _4193 = cos(_4191);
        _4187 = _4193;
    }
    float _4195 = _4187;
    float _4197 = -_4127;
    float _4199 = -_4185;
    float _4201 = fma(_4109, _4197, _4199);
    if (_4141)
    {
        float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4153 = _4203;
    }
    float _4205 = _4153;
    float _4207 = _4205;
    if (!_4141)
    {
        _4175 = _4129;
    }
    float _4209 = _4175;
    float _4211 = _4181;
    float _4213 = _4209;
    if (_4141)
    {
        float _4215 = fma(_4181, _4205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4055 = _4215;
    }
    float _4217 = _4055;
    float _4219 = _4217;
    if (!_4141)
    {
        _4211 = _4201;
    }
    float _4221 = _4211;
    float _4223 = _4221;
    if (!_4141)
    {
        _4207 = _4133;
    }
    float _4225 = _4207;
    float _4227 = _4195;
    float _4229 = _4225;
    if (_4141)
    {
        float _4231 = _4195 + (-1.0);
        _4189 = _4231;
    }
    float _4233 = _4189;
    float _4235 = _4233;
    if (_4141)
    {
        float _4237 = _4161 * _4217;
        _4219 = _4237;
    }
    float _4239 = _4219;
    if (!_4141)
    {
        _4163 = _4135;
    }
    float _4241 = _4163;
    float _4243 = _4241;
    if (_4141)
    {
        float _4245 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4235 = _4245;
    }
    float _4247 = _4235;
    if (_4141)
    {
        float _4249 = _4129 * _4239;
        _4213 = _4249;
    }
    float _4251 = _4213;
    if (_4141)
    {
        float _4253 = fma(_4201, _4195, _4247);
        _4223 = _4253;
    }
    float _4255 = _4223;
    if (!_4141)
    {
        _4227 = _4131;
    }
    float _4257 = _4227;
    float _4259 = _4257;
    if (_4141)
    {
        float _4261 = _4131 * _4239;
        _4259 = _4261;
    }
    float _4263 = _4259;
    if (_4141)
    {
        float _4265 = _4251 * _4251;
        _4229 = _4265;
    }
    float _4267 = _4229;
    float _4269 = sqrt(_4123);
    float _4271 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (_4141)
    {
        float _4273 = _4263 * _4263;
        _4243 = _4273;
    }
    float _4275 = _4243;
    float _4277 = fma(_4255, _4255, _4267);
    float _4279 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4281 = _4277 + _4275;
    float _4283 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4285 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4279);
    float _4287 = rsqrt(_4281);
    float _4289 = fma(_3321, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4291 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4283);
    float _4293 = fma(_3331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4297 = fma(_4269, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4295);
    float _4299 = precise::clamp(_4297, 0.0, 1.0);
    float _4301 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4291);
    float _4303 = floor(_4289);
    float _4305 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = _4301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4309 = -_4299;
    float _4311 = _4309 + 1.0;
    float _4313 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4315 = _4307 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4317 = _4287 * _4251;
    float _4319 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4313);
    float _4321 = -_4315;
    float _4323 = fma(_4321, _4271, 1.0);
    float _4325 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4327 = abs(_4311);
    float _4329 = log2(_4327);
    float _4331 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4333 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4335 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4325);
    float _4337 = _4287 * _4255;
    float _4339 = _4287 * _4263;
    float _4341 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4343 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4335);
    float _4345 = -_4331;
    float _4347 = fma(_4337, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4345);
    float _4349 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4285);
    float _4351 = floor(_4293);
    float _4353 = _4343 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4355 = -_4339;
    float _4357 = fma(_4355, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4347);
    float _4359 = _4349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4361 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4363 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4341);
    float _4365 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4367 = fma(_4357, -0.5, 0.5);
    float _4369 = log2(_4323);
    float _4371 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4363);
    float _4373 = -_4303;
    float _4375 = _4289 + _4373;
    float _4377 = fma(_4357, 0.5, 0.5);
    float _4379 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4371);
    float _4381 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4383 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4361);
    float _4385 = exp2(_4365);
    float _4387 = fma(_4377, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4389 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4381);
    float _4391 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4383);
    float _4393 = -_4351;
    float _4395 = _4293 + _4393;
    float _4397 = _4337 + 1.0;
    float _4399 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4389);
    float _4401 = fma(_4377, _4387, -0.212114393711090087890625);
    float _4403 = 1.0 / _4379;
    float _4405 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4391);
    float _4407 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4399);
    float _4409 = fma(_4377, _4401, 1.570728778839111328125);
    float _4411 = _4369 * 0.693147182464599609375;
    float _4413 = sqrt(_4367);
    float _4415 = -_4337;
    float _4417 = fma(_4385, _4397, _4415);
    float2 _11408 = float2(_4375, _4395);
    float _4419 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11408, float2(0.0), isnan(_11408)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11408, float2(0.0), isnan(_11408)), level(0.0)).x;
    float _4421 = _4411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4423 = _4407 * _4403;
    float _4425 = _4405 * _4403;
    float _4427 = fma(_4423, 0.5, 0.5);
    float _4429 = fma(_4425, -0.5, 0.5);
    float _4431 = _4413 * 0.636619746685028076171875;
    float3 _11436 = float3(_4427, _4429, _4421);
    float _4433 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11436, float3(0.0), isnan(_11436)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11436, float3(0.0), isnan(_11436)), level(0.0)).x;
    float _4435 = -_4409;
    float _4437 = fma(_4431, _4435, 1.0);
    float _4439 = fma(_4417, 0.5, 0.5);
    float3 _11454 = float3(_4427, _4429, _4421);
    float4 _4442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11454, float3(0.0), isnan(_11454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11454, float3(0.0), isnan(_11454)), level(0.0)).xyzw;
    float _4444 = _4442.x;
    float _4446 = _4442.y;
    float _4448 = _4442.z;
    float _4450 = _4442.w;
    float2 _11470 = float2(_4437, _4439);
    float3 _4454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11470, float2(0.0), isnan(_11470)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11470, float2(0.0), isnan(_11470)), level(0.0)).xyz;
    float _4456 = _4454.x;
    float _4458 = _4454.y;
    float _4460 = _4454.z;
    float _4462 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _4464 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4466 = isnan(_4269);
    bool _4468 = _4464 || _4466;
    bool _4470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4472 = _4468 || _4470;
    float _4474 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4462);
    float _4476 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4474);
    float _4478 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4480 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4482 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4478);
    float _4484 = 1.0 / _4480;
    float _4486 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4482);
    float _4488 = _4486 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4490 = _4488 + _4480;
    float _4492 = _4490 * _4484;
    float _4494 = _4492 * 0.5;
    float _4496 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4498 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4496);
    float _4500 = 1.0 / _4498;
    float _4502 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4504 = exp2(_4502);
    float _4506 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4508 = _4500 * _4506;
    float _4510 = abs(_4508);
    float _4512 = log2(_4510);
    float _4514 = -_4504;
    float _4516 = _4514 + 1.0;
    bool _4518 = _4508 <= 8000.0;
    bool _4520 = isnan(_4508);
    bool _4522 = _4518 || _4520;
    bool _4524 = isnan(8000.0);
    bool _4526 = _4522 || _4524;
    float _4528 = float(_4526);
    float _4530 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4532 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4534 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4536 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4534);
    float _4538 = exp2(_4532);
    float _4540 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4536);
    float _4542 = in.m_83.x;
    float _4544 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4540);
    float _4546 = _4544 + _4379;
    out.gl_Position.x = _4407;
    out.gl_Position.y = _4405;
    out.gl_Position.z = _4544;
    out.gl_Position.w = _4379;
    float _4548 = _4546 * 0.5;
    float _4550 = fma(_4538, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4552 = precise::clamp(_4550, 0.0, 1.0);
    float _4554 = _4546;
    float _4556 = _4548;
    if (!_4472)
    {
        _4554 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4558 = _4554;
    float _4560 = fma(_4552, -2.0, 3.0);
    float _4562 = _4552 * _4552;
    float _4564 = _4562 * _4560;
    float _4566 = -_4564;
    float _4568 = _4566 + 1.0;
    float _4570 = fma(_4568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4564);
    float _4572 = _4528 * _4570;
    out.m_85.z = _4548;
    out.m_85.w = _4379;
    float _4574 = _4572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4576 = _4379;
    float _4578 = _4558;
    float _4580 = _4558;
    if (!_4472)
    {
        _4576 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4582 = _4576;
    float _4584 = _4582;
    float _4586 = _4582;
    if (!_4472)
    {
        _4556 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4588 = _4556;
    float _4590 = -_4419;
    float _4592 = _4590 + 1.0;
    float _4594 = _4592 * _4574;
    float _4596 = precise::clamp(_4594, 0.0, 1.0);
    float _4598 = -_4596;
    float _4600 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4602 = _4600 * _4542;
    float _4604 = _4542;
    float _4606 = _4444;
    float _4608 = _4602;
    float _4610 = _4588;
    float _4612 = _4588;
    if (!_4472)
    {
        _4604 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4614 = _4604;
    float _4616 = _4530 * _4433;
    float _4618 = -_4530;
    float _4620 = _4618 + 1.0;
    float _4622 = _4450 * _4616;
    float _4624 = _4460 * _4616;
    float _4626 = fma(_4456, _4622, _4444);
    float _4628 = fma(_4458, _4622, _4446);
    float _4630 = _4602 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4632 = _4450 * _4620;
    float _4634 = fma(_4450, _4624, _4448);
    float _4636 = _4614;
    float _4638 = _4614;
    if (!_4472)
    {
        _4606 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4640 = _4606;
    out.m_87.x = _4630;
    float _4642 = _4640;
    float _4644 = _4640;
    if (!_4472)
    {
        _4608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4646 = _4608;
    out.m_89.x = _4626;
    out.m_89.y = _4628;
    out.m_89.z = _4634;
    out.m_89.w = _4632;
    bool _4648 = !_4472;
    float _4650 = _4646;
    float _4652 = _4646;
    if (!_4648)
    {
        bool _4654 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4656 = isnan(_4269);
        bool _4658 = _4654 || _4656;
        bool _4660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4662 = _4658 || _4660;
        if (!_4662)
        {
            float _4664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4666 = _4269 + _4664;
            float _4668 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4670 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4668;
            float _4672 = 1.0 / _4670;
            float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4676 = _4674 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4678 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4680 = _4678 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4682 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4684 = _4682 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4686 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4688 = _4686 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4690 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4692 = _4690 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4694 = _4666 * _4672;
            float _4696 = precise::clamp(_4694, 0.0, 1.0);
            float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4700 = _4698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4702 = fma(_4696, _4676, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4704 = fma(_4696, _4700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4706 = fma(_4696, _4680, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4708 = fma(_4696, _4684, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4710 = fma(_4696, _4688, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4712 = fma(_4696, _4692, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4638 = _4702;
            _4652 = _4710;
            _4586 = _4704;
            _4612 = _4708;
            _4644 = _4706;
            _4580 = _4712;
            _4714 = true;
        }
        else
        {
            bool _4716 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4718 = isnan(_4269);
            bool _4720 = _4716 || _4718;
            bool _4722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4724 = _4720 || _4722;
            if (!_4724)
            {
                _4584 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4726 = _4584;
            _4586 = _4726;
            if (!_4724)
            {
                _4636 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4728 = _4636;
            _4638 = _4728;
            if (!_4724)
            {
                _4642 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4730 = _4642;
            _4644 = _4730;
            if (!_4724)
            {
                _4610 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4732 = _4610;
            _4612 = _4732;
            if (!_4724)
            {
                _4650 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4734 = _4650;
            _4652 = _4734;
            if (!_4724)
            {
                _4578 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4736 = _4578;
            bool _4738 = !_4724;
            _4580 = _4736;
            if (!_4738)
            {
                bool _4740 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4742 = isnan(_4269);
                bool _4744 = _4740 || _4742;
                bool _4746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4748 = _4744 || _4746;
                if (!_4748)
                {
                    float _4750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4752 = _4269 + _4750;
                    float _4754 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4756 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4754;
                    float _4758 = 1.0 / _4756;
                    float _4760 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4762 = _4760 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4764 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4768 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4770 = _4768 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4772 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4776 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4778 = _4776 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4780 = _4752 * _4758;
                    float _4782 = precise::clamp(_4780, 0.0, 1.0);
                    float _4784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4786 = _4784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4788 = fma(_4782, _4762, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4790 = fma(_4782, _4786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4792 = fma(_4782, _4766, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4794 = fma(_4782, _4770, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4796 = fma(_4782, _4774, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4798 = fma(_4782, _4778, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4638 = _4788;
                    _4652 = _4796;
                    _4586 = _4790;
                    _4612 = _4794;
                    _4644 = _4792;
                    _4580 = _4798;
                    _4714 = true;
                }
                else
                {
                    _4638 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4652 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4586 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4612 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4644 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4580 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4714 = false;
    float _4800 = _4638;
    float _4802 = _4652;
    float _4804 = _4586;
    float _4806 = _4612;
    float _4808 = _4644;
    float _4810 = _4580;
    float _4812 = fma(_3919, -0.5, 0.5);
    float _4814 = precise::clamp(_4812, 0.0, 1.0);
    float _4816 = -_4800;
    float _4818 = _4816 + _4802;
    float _4820 = -_4804;
    float _4822 = _4820 + _4806;
    float _4824 = -_4808;
    float _4826 = _4824 + _4810;
    bool _4828 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4830 = fma(_4814, _4818, _4800);
    float _4832 = fma(_4814, _4822, _4804);
    float _4834 = fma(_4814, _4826, _4808);
    float _4836 = _4830 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _4838 = fma(_4832, 0.298911988735198974609375, _4836);
    float _4840 = fma(_4834, 0.114477999508380889892578125, _4838);
    float _4842 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _4844 = -_4840;
    float _4846 = _4832 + _4844;
    float _4848 = -_4840;
    float _4850 = _4830 + _4848;
    float _4852 = -_4840;
    float _4854 = _4834 + _4852;
    out.m_87.w = _4842;
    float _4856 = fma(_4846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    float _4858 = fma(_4850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    float _4860 = fma(_4854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    out.m_93.x = _4856;
    out.m_93.y = _4858;
    out.m_93.z = _4860;
    if (!_4828)
    {
        return out;
    }
    float _4862 = -_4101;
    float _4864 = _4862 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4866 = -_4103;
    float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4870 = -_4105;
    float _4872 = _4870 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4874 = _4864 * _4864;
    float _4876 = fma(_4868, _4868, _4874);
    float _4878 = fma(_4872, _4872, _4876);
    float _4880 = sqrt(_4878);
    float _4882 = rsqrt(_4878);
    float _4884 = -_4880;
    float _4886 = _4884 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4888 = _4886 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4890 = precise::clamp(_4888, 0.0, 1.0);
    float _4892 = _4868 * _4882;
    float _4894 = _4864 * _4882;
    float _4896 = abs(_4890);
    float _4898 = log2(_4896);
    float _4900 = _4872 * _4882;
    float _4902 = _4892 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4904 = _3919 * _4894;
    float _4906 = -_4894;
    float _4908 = -_4902;
    float _4910 = fma(_4906, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4908);
    float _4912 = fma(_3925, _4892, _4904);
    float _4914 = -_4900;
    float _4916 = fma(_4914, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4910);
    float _4918 = fma(_3929, _4900, _4912);
    float _4920 = precise::clamp(_4918, 0.0, 1.0);
    float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4924 = _4916 + _4922;
    float _4926 = _4898 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4928 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4930 = precise::clamp(_4928, 0.0, 1.0);
    float _4932 = exp2(_4926);
    float _4934 = _4932 * _4930;
    float _4936 = _4920 * _4934;
    float _4938 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4940 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4942 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4938;
    out.m_91.y = _4940;
    out.m_91.z = _4942;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _4714 = false;
    bool _3977 = false;
    bool _528 = false;
    bool _412 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_48.w;
    float _109 = trunc(_107);
    int _112 = int(_109);
    bool _116 = _112 >= 1;
    float _118 = 0.0;
    if (!_116)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _118;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_116)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    int _128 = _126;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4998 = as_type<float>(_126);
        out.gl_Position.z = _4998;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _146 = 0.0;
    float _148 = _144;
    if (_140)
    {
        float _150 = float(_112);
        _146 = _150;
    }
    float _152 = _146;
    bool _154 = _144 >= _152;
    bool _156 = !_140;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_51.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _128 = as_type<int>(_164);
    }
    int _166 = _128;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5068 = as_type<float>(_166);
        out.gl_Position.z = _5068;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_55.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _180 = _178 * _174;
        float _182 = floor(_180);
        float _184 = -_182;
        float _186 = _180 + _184;
        _188 = _186;
        _190 = true;
    }
    else
    {
        float _192 = float(_112);
        float _194 = 1.0 / _192;
        float _196 = _144 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = 1.0 / _218;
    bool _226 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _228 = 1.0 / _222;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _230;
    float _234 = 1.0 / _214;
    float _236 = _202 * _224;
    bool _238 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _240 = isnan(_198);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    bool _250 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _252 = isnan(_198);
    bool _254 = _250 || _252;
    bool _256 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _258 = _254 || _256;
    float _260 = float(_258);
    float _262 = _206 * _228;
    bool _264 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _266 = isnan(_198);
    bool _268 = _264 || _266;
    bool _270 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _272 = _268 || _270;
    float _274 = float(_272);
    float _276 = -_248;
    float _278 = _276 + 1.0;
    float _280 = _274 * _278;
    bool _282 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _284 = isnan(_198);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = _210 * _234;
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _298 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _296;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -_274;
    float _306 = _304 + 1.0;
    float _308 = fma(_232, _294, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _310 = fma(_298, _294, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _312 = fma(_302, _294, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _314 = -_260;
    float _316 = _314 + 1.0;
    float _318 = _260 * _306;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _322 = _320 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _326 = _324 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _328 = _292 * _316;
    float _330 = -_292;
    float _332 = _330 + 1.0;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _336 = _334 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _338 = _310 * _328;
    float _340 = _312 * _328;
    float _342 = _308 * _328;
    float _344 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].x, _338);
    float _346 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].y, _340);
    float _348 = fma(_336, _236, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _350;
    float _354 = fma(_322, _236, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _356 = fma(_326, _236, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _358 = fma(_332, (*spvDescriptorSet0.vp_c9)._m0[143].z, _342);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _364;
    float _368 = fma(_348, _318, _344);
    float _370 = fma(_352, _262, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _372 = fma(_362, _262, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _374 = fma(_366, _262, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _376 = fma(_354, _318, _346);
    float _378 = fma(_356, _318, _358);
    float _380 = fma(_372, _280, _368);
    float _382 = fma(_370, _280, _376);
    float _384 = fma(_374, _280, _378);
    float _386 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].x, _380);
    float _388 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].y, _382);
    float _390 = fma(_248, (*spvDescriptorSet0.vp_c9)._m0[146].z, _384);
    bool _392 = !_226;
    float _410;
    if (!_392)
    {
        float _394 = in.m_55.x;
        float _396 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _398 = _394 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _400 = fma(_398, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _402 = _400 * _396;
        float _404 = floor(_402);
        float _406 = -_404;
        float _408 = _402 + _406;
        _410 = _408;
        _412 = true;
    }
    else
    {
        float _414 = float(_112);
        float _416 = 1.0 / _414;
        float _418 = _144 * _416;
        _410 = _418;
    }
    _412 = false;
    float _420 = _410;
    bool _422 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _424 = isnan(_420);
    bool _426 = _422 || _424;
    bool _428 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _430 = _426 || _428;
    float _432 = float(_430);
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _438 = _420 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _440 = isnan(_420);
    bool _442 = _438 || _440;
    bool _444 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _446 = _442 || _444;
    float _448 = float(_446);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _456 = _420 + _454;
    float _458 = -_432;
    float _460 = _458 + 1.0;
    bool _462 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _464 = 1.0 / _436;
    float _466 = _448 * _460;
    float _468 = -_448;
    float _470 = _468 + 1.0;
    float _472 = _452 * _464;
    float _474 = fma(_472, _456, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _476 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _478 = _474 * _466;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _482 = in.m_57.x;
    float _484 = in.m_57.y;
    float _486 = in.m_57.z;
    float _488 = fma(_470, (*spvDescriptorSet0.vp_c9)._m0[115].x, _478);
    float _490 = _480 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _492 = _476 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _494 = fma(_432, (*spvDescriptorSet0.vp_c9)._m0[116].x, _488);
    float _496 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _498 = _494 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _500 = _496 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _490;
    out.m_59.y = _492;
    out.m_59.z = _500;
    out.m_59.w = _498;
    float _502 = _388 * _484;
    float _504 = _390 * _486;
    float _506 = _386 * _482;
    bool _508 = !_462;
    float _526;
    if (!_508)
    {
        float _510 = in.m_55.x;
        float _512 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _514 = _510 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _516 = fma(_514, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _518 = _516 * _512;
        float _520 = floor(_518);
        float _522 = -_520;
        float _524 = _518 + _522;
        _526 = _524;
        _528 = true;
    }
    else
    {
        float _530 = float(_112);
        float _532 = 1.0 / _530;
        float _534 = _144 * _532;
        _526 = _534;
    }
    _528 = false;
    float _536 = _526;
    float _538 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _540 = int(_538);
    float _542 = in.m_55.w;
    int _544 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _546 = _544 != 0;
    float _548 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _550 = int(_548);
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _554 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _552;
    float _556 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _558 = int(_556);
    float _560 = float(_540);
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _564 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _566 = float(_550);
    float _568 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _570 = int(_568);
    float _572 = float(_558);
    float _574 = 1.0 / _560;
    float _576 = 1.0 / _566;
    float _578 = in.m_55.x;
    float _580 = float(uint(_570));
    int _582 = ~_570;
    int _584 = _582 + 1;
    bool _586 = _570 == 0;
    float _588 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _590 = int(_588);
    float _592 = _574 * _144;
    float _594 = _566;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z);
    if (_546)
    {
        _594 = 1.0;
    }
    float _598 = _594;
    float _600 = _598;
    if (!_546)
    {
        _600 = 7.345489978790283203125;
    }
    float _602 = _600;
    float _604 = 1.0 / _572;
    float _606 = _576 * _144;
    float _608 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _610 = int(_608);
    float _612 = float(uint(_590));
    int _614 = ~_590;
    int _616 = _614 + 1;
    int _618 = ~_590;
    int _620 = _618 + 1;
    float _622 = _604 * _144;
    float _624 = 1.0 / _580;
    float _626 = float(uint(_610));
    float _628 = trunc(_592);
    int _630 = int(_628);
    int _632 = ~_610;
    int _634 = _632 + 1;
    float _636 = 1.0 / _612;
    int _638 = as_type<int>(_624) + (-2);
    float _640 = _624;
    int _642 = _638;
    if (_546)
    {
        _640 = _578;
    }
    float _644 = _640;
    float _646 = trunc(_606);
    int _648 = int(_646);
    float _650 = in.m_55.y;
    float _652 = 1.0 / _626;
    int _654 = as_type<int>(_636) + (-2);
    float _656 = trunc(_622);
    int _658 = int(_656);
    float _660 = _602 * _578;
    float _662 = float(uint(_630));
    float _664 = float(uint(_648));
    float _666 = as_type<float>(_638) * _662;
    int _668 = as_type<int>(_652) + (-2);
    float _670 = as_type<float>(_654) * _664;
    float _672 = _664;
    float _674 = _644;
    if (_546)
    {
        _672 = 1.0;
    }
    float _676 = _672;
    float _678 = trunc(_666);
    float _680 = precise::max(_678, 0.0);
    uint _683 = uint(_680);
    float _685 = _676;
    if (!_546)
    {
        _674 = _650;
    }
    float _687 = _674;
    float _689 = _650 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    if (!_546)
    {
        _685 = 1.2345600128173828125;
    }
    float _691 = _685;
    float _693 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[78].w, _564);
    float _695 = float(uint(_658));
    float _697 = trunc(_670);
    float _699 = precise::max(_697, 0.0);
    uint _701 = uint(_699);
    float _703 = in.m_55.z;
    float _705 = as_type<float>(_668) * _695;
    float _707 = trunc(_705);
    float _709 = precise::max(_707, 0.0);
    uint _711 = uint(_709);
    float _713 = _687 * _691;
    int _715 = _584 * int(_683);
    int _717 = _715 + _630;
    int _719 = ~_610;
    int _721 = _719 + 1;
    int _723 = _616 * int(_701);
    int _725 = _723 + _648;
    float _727 = float(uint(_717));
    float _729 = floor(_660);
    float _731 = float(uint(_725));
    float _733 = as_type<float>(_638) * _727;
    float _735 = _727;
    float _737 = _731;
    if (_546)
    {
        _735 = _578;
    }
    float _739 = _735;
    int _741 = _721 * int(_711);
    int _743 = _741 + _658;
    float _745 = _739;
    if (!_546)
    {
        _745 = _703;
    }
    float _747 = _745;
    float _749 = as_type<float>(_654) * _731;
    float _751 = trunc(_733);
    float _753 = precise::max(_751, 0.0);
    uint _755 = uint(_753);
    if (_546)
    {
        _737 = 1.0;
    }
    float _757 = _737;
    float _759 = float(uint(_743));
    float _761 = _757;
    if (!_546)
    {
        _761 = 5.839270114898681640625;
    }
    float _763 = _761;
    float _765 = -_729;
    float _767 = _660 + _765;
    float _769 = as_type<float>(_668) * _759;
    float _771 = trunc(_749);
    float _773 = precise::max(_771, 0.0);
    uint _775 = uint(_773);
    float _777 = _747 * _763;
    int _779 = ~_610;
    int _781 = _779 + 1;
    float _783 = float(_630);
    int _785 = int(_683) + int(_755);
    float _787 = floor(_713);
    int _789 = ~_570;
    int _791 = _789 + 1;
    int _793 = _791 * _785;
    int _795 = _793 + _630;
    int _797 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _799 = _797 != 0;
    float _801 = trunc(_769);
    float _803 = precise::max(_801, 0.0);
    uint _805 = uint(_803);
    int _807 = int(_701) + int(_775);
    float _809 = float(_570);
    bool _811 = uint(_795) >= uint(_570);
    bool _813 = _783 >= _809;
    bool _815 = isnan(_783);
    bool _817 = _813 || _815;
    bool _819 = isnan(_809);
    bool _821 = _817 || _819;
    float _823 = float(_821);
    float _825 = floor(_777);
    float _827 = -_787;
    float _829 = _713 + _827;
    int _831 = ~_590;
    int _833 = _831 + 1;
    float _835 = float(_112);
    int _837 = _833 * _807;
    int _839 = _837 + _648;
    int _841 = int(_711) + int(_805);
    float _843 = trunc(_823);
    int _845 = int(_843);
    float _847 = _767 * _809;
    bool _849 = uint(_839) >= uint(_590);
    float _851 = float(_590);
    int _853 = _781 * _841;
    int _855 = _853 + _658;
    float _857 = -_825;
    float _859 = _777 + _857;
    float _861 = trunc(_847);
    int _863 = int(_861);
    bool _865 = !_811;
    int _867 = _865 ? 0 : (-1);
    float _869 = _851 * _829;
    bool _871 = uint(_855) >= uint(_610);
    int _873 = ~_785;
    int _875 = _873 + _867;
    int _877 = _875 + 1;
    bool _879 = !_871;
    int _881 = _879 ? 0 : (-1);
    float _883 = trunc(_869);
    int _885 = int(_883);
    bool _887 = !_799;
    int _889 = _887 ? 0 : 1;
    int _891 = _570 * _877;
    int _893 = _891 + _630;
    int _895 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _897 = _895 != 0;
    int _899 = ~_841;
    int _901 = _899 + _881;
    int _903 = _901 + 1;
    int _905 = abs(_889);
    float _907 = 1.0 / _835;
    bool _909 = !_897;
    int _911 = _909 ? 0 : 1;
    int _913 = _610 * _903;
    int _915 = _913 + _658;
    float _917 = float(_648);
    int _919 = _863 * _905;
    int _921 = _919 + _630;
    bool _923 = !_849;
    int _925 = _923 ? 0 : (-1);
    float _927 = _809 * _144;
    int _929 = abs(_911);
    bool _931 = _917 >= _851;
    bool _933 = isnan(_917);
    bool _935 = _931 || _933;
    bool _937 = isnan(_851);
    bool _939 = _935 || _937;
    float _941 = float(_939);
    int _943 = ~_807;
    int _945 = _943 + _925;
    int _947 = _945 + 1;
    int _949 = _885 * _929;
    int _951 = _949 + _648;
    int _953 = ~_845;
    int _955 = _953 + 1;
    int _957 = _955 + 1;
    bool _959 = !_586;
    int _961 = _959 ? _893 : (-1);
    int _963 = _590 * _947;
    int _965 = _963 + _648;
    float _967 = trunc(_941);
    int _969 = int(_967);
    float _971 = float(_658);
    int _973 = _961 * _957;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _977 = _975 != 0;
    int _979 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _981 = _979 != 0;
    int _983 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _985 = _983 != 0;
    float _987 = _927 * _907;
    float _989 = float(_610);
    float _991 = _907 * _144;
    int _993 = _570 + (-1);
    float _995 = trunc(_987);
    int _997 = int(_995);
    bool _999 = _971 >= _989;
    bool _1001 = isnan(_971);
    bool _1003 = _999 || _1001;
    bool _1005 = isnan(_989);
    bool _1007 = _1003 || _1005;
    float _1009 = float(_1007);
    float _1011 = _851 * _991;
    bool _1013 = !_981;
    int _1015 = _1013 ? 0 : 1;
    int _1017 = _845 * _993;
    int _1019 = _1017 + _973;
    bool _1021 = _590 == 0;
    float _1023 = _989 * _859;
    int _1025 = abs(_1015);
    float _1027 = trunc(_1009);
    int _1029 = int(_1027);
    bool _1031 = !_977;
    int _1033 = _1031 ? 0 : 1;
    bool _1035 = !_985;
    int _1037 = _1035 ? 0 : 1;
    int _1039 = _1019 * _1025;
    int _1041 = abs(_1033);
    bool _1043 = !_1021;
    int _1045 = _1043 ? _965 : (-1);
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1049 = _1047 != 0;
    int _1051 = abs(_1037);
    int _1053 = ~_969;
    int _1055 = _1053 + 1;
    int _1057 = _1055 + 1;
    bool _1059 = !_1049;
    int _1061 = _1059 ? 0 : 1;
    int _1063 = _1057 * _1045;
    bool _1065 = _610 == 0;
    int _1067 = _997 * _1041;
    int _1069 = _1067 + _1039;
    int _1071 = abs(_1061);
    int _1073 = ~_1029;
    int _1075 = _1073 + 1;
    int _1077 = _1075 + 1;
    int _1079 = _921 * _1051;
    int _1081 = _1079 + _1069;
    bool _1083 = !_1065;
    int _1085 = _1083 ? _915 : (-1);
    float _1087 = in.m_61.x;
    int _1089 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1091 = _1089 != 0;
    int _1093 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1095 = _1093 != 0;
    int _1097 = _1077 * _1085;
    int _1099 = _590 + (-1);
    int _1101 = _863 * _1071;
    int _1103 = _1101 + _1081;
    float _1105 = trunc(_1011);
    int _1107 = int(_1105);
    bool _1109 = !_1095;
    int _1111 = _1109 ? 0 : 1;
    int _1113 = _969 * _1099;
    int _1115 = _1113 + _1063;
    float _1117 = float(uint(_1103));
    int _1119 = _610 + (-1);
    bool _1121 = !_1091;
    int _1123 = _1121 ? 0 : 1;
    float _1125 = as_type<float>(_638) * _1117;
    int _1127 = abs(_1111);
    int _1129 = _1029 * _1119;
    int _1131 = _1129 + _1097;
    int _1133 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1135 = _1133 != 0;
    int _1137 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1139 = _1137 != 0;
    int _1141 = abs(_1123);
    int _1143 = _1115 * _1127;
    bool _1145 = !_1135;
    int _1147 = _1145 ? 0 : 1;
    float _1149 = trunc(_1125);
    float _1151 = precise::max(_1149, 0.0);
    uint _1153 = uint(_1151);
    int _1155 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1157 = _1155 != 0;
    int _1159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1161 = _1159 != 0;
    int _1163 = _1107 * _1141;
    int _1165 = _1163 + _1143;
    bool _1167 = !_1139;
    int _1169 = _1167 ? 0 : 1;
    int _1171 = abs(_1147);
    float _1173 = _989 * _991;
    bool _1175 = !_1161;
    int _1177 = _1175 ? 0 : 1;
    float _1179 = trunc(_1023);
    int _1181 = int(_1179);
    int _1183 = ~_570;
    int _1185 = _1183 + 1;
    int _1187 = abs(_1169);
    int _1189 = abs(_1177);
    float _1191 = trunc(_1173);
    int _1193 = int(_1191);
    int _1195 = _951 * _1171;
    int _1197 = _1195 + _1165;
    int _1199 = _1131 * _1189;
    int _1201 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _1203 = _1201 != 0;
    int _1205 = _1185 * int(_1153);
    int _1207 = _1205 + _1103;
    int _1209 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1211 = _1209 != 0;
    int _1213 = _885 * _1187;
    int _1215 = _1213 + _1197;
    bool _1217 = !_1203;
    int _1219 = _1217 ? 0 : 1;
    float _1221 = float(uint(_1207));
    float _1223 = float(uint(_1215));
    bool _1225 = !_1157;
    int _1227 = _1225 ? 0 : 1;
    float _1229 = as_type<float>(_638) * _1221;
    int _1231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1233 = _1231 != 0;
    float _1235 = as_type<float>(_654) * _1223;
    int _1237 = abs(_1227);
    float _1239 = trunc(_1229);
    float _1241 = precise::max(_1239, 0.0);
    uint _1243 = uint(_1241);
    int _1245 = abs(_1219);
    bool _1247 = !_1233;
    int _1249 = _1247 ? 0 : 1;
    float _1251 = trunc(_1235);
    float _1253 = precise::max(_1251, 0.0);
    uint _1255 = uint(_1253);
    int _1257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1259 = _1257 != 0;
    int _1261 = _1193 * _1237;
    int _1263 = _1261 + _1199;
    float _1265 = as_type<float>(_1245);
    float _1267 = as_type<float>(_1237);
    bool _1269 = _1135;
    if (!_1211)
    {
        _1265 = _1087;
    }
    float _1271 = _1265;
    int _1273 = _1181 * _1245;
    int _1275 = _1273 + _658;
    int _1277 = abs(_1249);
    float _1279 = _1271;
    if (!_1211)
    {
        _1267 = _1271;
    }
    float _1281 = _1267;
    bool _1283 = !_1259;
    int _1285 = _1283 ? 0 : 1;
    int _1287 = _1285;
    float _1289 = _1281;
    if (_1211)
    {
        _1279 = _1087;
    }
    float _1291 = _1279;
    int _1293 = ~_590;
    int _1295 = _1293 + 1;
    int _1297 = abs(_1285);
    int _1299 = _1297;
    if (_1211)
    {
        float _1301 = -_1291;
        float _1303 = _1301 + 1.0;
        _1287 = as_type<int>(_1303);
    }
    int _1305 = _1287;
    int _1307 = int(_1153) + int(_1243);
    int _1309 = _1295 * int(_1255);
    int _1311 = _1309 + _1215;
    if (_1211)
    {
        bool _1313 = _578 > 0.5;
        _1269 = _1313;
    }
    bool _1315 = _1269;
    int _1317 = _1275 * _1277;
    int _1319 = _1317 + _1263;
    float _1321 = in.m_61.y;
    int _1323 = ~_570;
    int _1325 = _1323 + 1;
    float _1327 = as_type<float>(_1297);
    if (_1211)
    {
        float _1329 = _1315 ? as_type<float>(_1305) : _1291;
        _1289 = _1329;
    }
    float _1331 = _1289;
    int _1333 = _1181 * _1297;
    int _1335 = _1333 + _1319;
    int _1337 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1339 = _1337 != 0;
    int _1341 = _1325 * _1307;
    int _1343 = _1341 + _1103;
    int _1345 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1347 = _1345 != 0;
    float _1349 = float(uint(_1335));
    float _1351 = float(uint(_1311));
    bool _1353 = uint(_1343) >= uint(_570);
    float _1355 = as_type<float>(_668) * _1349;
    int _1357 = ~_610;
    int _1359 = _1357 + 1;
    float _1361 = as_type<float>(_654) * _1351;
    bool _1363 = !_1353;
    int _1365 = _1363 ? 0 : (-1);
    float _1367 = _1349;
    if (_1339)
    {
        float _1369 = -_1291;
        float _1371 = _1369 + 1.0;
        _1299 = as_type<int>(_1371);
    }
    int _1373 = _1299;
    bool _1375 = _703 > 0.5;
    float _1377 = trunc(_1355);
    float _1379 = precise::max(_1377, 0.0);
    uint _1381 = uint(_1379);
    int _1383 = _1373;
    if (!_1339)
    {
        _1327 = _1291;
    }
    float _1385 = _1327;
    float _1387 = _1385;
    if (_1339)
    {
        float _1389 = _1375 ? as_type<float>(_1373) : _1291;
        _1387 = _1389;
    }
    float _1391 = _1387;
    if (_1347)
    {
        float _1393 = -_1291;
        float _1395 = _1393 + 1.0;
        _1383 = as_type<int>(_1395);
    }
    int _1397 = _1383;
    bool _1399 = _650 > 0.5;
    if (!_1347)
    {
        _1367 = _1291;
    }
    float _1401 = _1367;
    float _1403 = trunc(_1361);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    float _1409 = _1401;
    if (_1347)
    {
        float _1411 = _1399 ? as_type<float>(_1397) : _1291;
        _1409 = _1411;
    }
    float _1413 = _1409;
    int _1415 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1417 = _1415 != 0;
    int _1419 = ~_590;
    int _1421 = _1419 + 1;
    int _1423 = _1359 * int(_1381);
    int _1425 = _1423 + _1335;
    float _1427 = -_1321;
    float _1429 = _1427 + 1.0;
    int _1431 = ~_1307;
    int _1433 = _1431 + _1365;
    int _1435 = _1433 + 1;
    bool _1437 = _570 == 0;
    int _1439 = _1399 ? as_type<int>(_1429) : as_type<int>(_1321);
    int _1441 = _570 * _1435;
    int _1443 = _1441 + _1103;
    bool _1445 = _542 > 0.5;
    float _1447 = _1417 ? as_type<float>(_1439) : _1321;
    int _1449 = int(_1255) + int(_1407);
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1453 = _1451 != 0;
    float _1455 = float(uint(_1425));
    int _1457 = _1421 * _1449;
    int _1459 = _1457 + _1215;
    int _1461 = _1445 ? as_type<int>(_1429) : as_type<int>(_1321);
    int _1463 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1465 = _1463 != 0;
    float _1467 = as_type<float>(_668) * _1455;
    bool _1469 = !_1437;
    int _1471 = _1469 ? _1443 : (-1);
    float _1473 = _1465 ? as_type<float>(_1461) : _1321;
    bool _1475 = uint(_1459) >= uint(_590);
    float _1477 = trunc(_1467);
    float _1479 = precise::max(_1477, 0.0);
    uint _1481 = uint(_1479);
    float _1483 = _1321;
    if (_1453)
    {
        float _1485 = _1375 ? _1429 : _1321;
        _1483 = _1485;
    }
    float _1487 = _1483;
    bool _1489 = !_1475;
    int _1491 = _1489 ? 0 : (-1);
    int _1493 = _1471 & 3;
    bool _1495 = _1493 != 0;
    int _1497 = _1471 & 3;
    bool _1499 = _1497 != 0;
    int _1501 = ~_1449;
    int _1503 = _1501 + _1491;
    int _1505 = _1503 + 1;
    int _1507 = _1495 ? 0 : 1;
    bool _1509 = uint(_1497) > 1u;
    int _1511 = _590 * _1505;
    int _1513 = _1511 + _1215;
    bool _1515 = uint(_1497) >= 2u;
    int _1517 = ~_610;
    int _1519 = _1517 + 1;
    int _1521 = _1515 ? 0 : 1;
    bool _1523 = _590 == 0;
    bool _1525 = _1497 != 3;
    int _1527 = int(_1381) + int(_1481);
    bool _1529 = !_1523;
    int _1531 = _1529 ? _1513 : (-1);
    int _1533 = ~_1507;
    int _1535 = _1533 + 1;
    int _1537 = _1535 + 1;
    int _1539 = _1537;
    if (!_1509)
    {
        int _1541 = ~_1507;
        int _1543 = _1541 + 1;
        _1539 = _1543;
    }
    int _1545 = _1539;
    int _1547 = _1519 * _1527;
    int _1549 = _1547 + _1335;
    int _1551 = _1531 & 3;
    bool _1553 = _1551 != 0;
    float _1555 = _578 * 2.0;
    int _1557 = ~_1521;
    int _1559 = _1557 + 1;
    int _1561 = _1559 + 1;
    int _1563 = _1553 ? 0 : 1;
    bool _1565 = uint(_1549) >= uint(_610);
    float _1567 = floor(_1555);
    int _1569 = _1561;
    if (_1525)
    {
        int _1571 = ~_1521;
        int _1573 = _1571 + 1;
        _1569 = _1573;
    }
    int _1575 = _1569;
    bool _1577 = uint(_1551) >= 2u;
    bool _1579 = !_1565;
    int _1581 = _1579 ? 0 : (-1);
    float _1583 = float(uint(_921));
    int _1585 = _1577 ? 0 : 1;
    bool _1587 = _1551 != 3;
    float _1589 = as_type<float>(_638) * _1583;
    int _1591 = ~_1527;
    int _1593 = _1591 + _1581;
    int _1595 = _1593 + 1;
    bool _1597 = uint(_1551) > 1u;
    float _1599 = trunc(_1589);
    float _1601 = precise::max(_1599, 0.0);
    uint _1603 = uint(_1601);
    float _1605 = float(uint(_951));
    int _1607 = _610 * _1595;
    int _1609 = _1607 + _1335;
    float _1611 = float(uint(_1275));
    int _1613 = ~_1585;
    int _1615 = _1613 + 1;
    int _1617 = _1615 + 1;
    float _1619 = as_type<float>(_654) * _1605;
    bool _1621 = !_1065;
    int _1623 = _1621 ? _1609 : (-1);
    float _1625 = as_type<float>(_668) * _1611;
    int _1627 = _1617;
    if (_1587)
    {
        int _1629 = ~_1585;
        int _1631 = _1629 + 1;
        _1627 = _1631;
    }
    int _1633 = _1627;
    float _1635 = _650 * 2.0;
    int _1637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1639 = _1637 != 0;
    float _1641 = trunc(_1619);
    float _1643 = precise::max(_1641, 0.0);
    uint _1645 = uint(_1643);
    int _1647 = ~_1563;
    int _1649 = _1647 + 1;
    int _1651 = _1649 + 1;
    int _1653 = _1651;
    if (!_1597)
    {
        int _1655 = ~_1563;
        int _1657 = _1655 + 1;
        _1653 = _1657;
    }
    int _1659 = _1653;
    bool _1661 = !_1639;
    int _1663 = _1661 ? 0 : 1;
    int _1665 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1667 = _1665 != 0;
    float _1669 = trunc(_1625);
    float _1671 = precise::max(_1669, 0.0);
    uint _1673 = uint(_1671);
    int _1675 = ~_570;
    int _1677 = _1675 + 1;
    int _1679 = _1623 & 3;
    bool _1681 = _1679 != 0;
    bool _1683 = !_1667;
    int _1685 = _1683 ? 0 : 1;
    int _1687 = _1677 * int(_1603);
    int _1689 = _1687 + _921;
    bool _1691 = _1679 != 3;
    float _1693 = floor(_1635);
    int _1695 = _620 * int(_1645);
    int _1697 = _1695 + _951;
    int _1699 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1701 = _1699 != 0;
    float _1703 = float(uint(_1689));
    float _1705 = float(uint(_1697));
    int _1707 = _634 * int(_1673);
    int _1709 = _1707 + _1275;
    int _1711 = _1681 ? 0 : 1;
    float _1713 = as_type<float>(_638) * _1703;
    bool _1715 = uint(_1679) >= 2u;
    float _1717 = as_type<float>(_654) * _1705;
    bool _1719 = _1567 >= 0.0;
    bool _1721 = isnan(_1567);
    bool _1723 = _1719 || _1721;
    bool _1725 = isnan(0.0);
    bool _1727 = _1723 || _1725;
    float _1729 = trunc(_1713);
    float _1731 = precise::max(_1729, 0.0);
    uint _1733 = uint(_1731);
    int _1735 = _1715 ? 0 : 1;
    bool _1737 = uint(_1679) > 1u;
    int _1739 = ~_1735;
    int _1741 = _1739 + 1;
    int _1743 = _1741 + 1;
    int _1745 = _1743;
    if (_1691)
    {
        int _1747 = ~_1735;
        int _1749 = _1747 + 1;
        _1745 = _1749;
    }
    int _1751 = _1745;
    float _1753 = trunc(_1717);
    float _1755 = precise::max(_1753, 0.0);
    uint _1757 = uint(_1755);
    float _1759 = float(uint(_1709));
    bool _1761 = _1567 > 0.0;
    int _1763 = ~_1711;
    int _1765 = _1763 + 1;
    int _1767 = _1765 + 1;
    float _1769 = as_type<float>(_668) * _1759;
    int _1771 = _1727 ? 0 : 1;
    int _1773 = _1767;
    if (_1701)
    {
        _642 = 0;
    }
    int _1775 = _642;
    int _1777 = _1775;
    if (!_1737)
    {
        int _1779 = ~_1711;
        int _1781 = _1779 + 1;
        _1773 = _1781;
    }
    int _1783 = _1773;
    float _1785 = trunc(_1769);
    float _1787 = precise::max(_1785, 0.0);
    uint _1789 = uint(_1787);
    if (!_1701)
    {
        _1777 = 2;
    }
    int _1791 = _1777;
    bool _1793 = _1693 > 0.0;
    int _1795 = ~_1771;
    int _1797 = _1795 + 1;
    int _1799 = _1797 + 1;
    int _1801 = _1799;
    if (!_1761)
    {
        int _1803 = ~_1771;
        int _1805 = _1803 + 1;
        _1801 = _1805;
    }
    int _1807 = _1801;
    bool _1809 = _1693 >= 0.0;
    bool _1811 = isnan(_1693);
    bool _1813 = _1809 || _1811;
    bool _1815 = isnan(0.0);
    bool _1817 = _1813 || _1815;
    bool _1819 = _1791 != 2;
    int _1821 = int(_1603) + int(_1733);
    int _1823 = ~_570;
    int _1825 = _1823 + 1;
    float _1827 = as_type<float>(_1733);
    if (_1701)
    {
        _596 = 0;
    }
    int _1829 = _596;
    float _1831 = _1817 ? 0.0 : 1.4012984643248170709237295832899e-45;
    int _1833 = _1825 * _1821;
    int _1835 = _1833 + _921;
    int _1837 = _1829;
    float _1839 = _1831;
    if (!_1701)
    {
        _1837 = 1;
    }
    int _1841 = _1837;
    int _1843 = int(_1645) + int(_1757);
    int _1845 = ~_590;
    int _1847 = _1845 + 1;
    int _1849 = int(_1673) + int(_1789);
    int _1851 = ~_610;
    int _1853 = _1851 + 1;
    int _1855 = _1847 * _1843;
    int _1857 = _1855 + _951;
    int _1859 = ~as_type<int>(_1831);
    int _1861 = _1859 + 1;
    int _1863 = _1861 + 1;
    int _1865 = _1863;
    float _1867 = as_type<float>(_1789);
    float _1869 = as_type<float>(_1757);
    if (!_1793)
    {
        int _1871 = ~as_type<int>(_1831);
        int _1873 = _1871 + 1;
        _1865 = _1873;
    }
    int _1875 = _1865;
    int _1877 = _1853 * _1849;
    int _1879 = _1877 + _1275;
    bool _1881 = _1841 != 1;
    bool _1883 = uint(_1835) >= uint(_570);
    float _1885 = in.m_48.x;
    float _1887 = in.m_48.y;
    float _1889 = in.m_48.z;
    if (_1819)
    {
        _1839 = _578;
    }
    float _1891 = _1839;
    float _1893 = _1891;
    if (_1819)
    {
        _1867 = _650;
    }
    float _1895 = _1867;
    float _1897 = _1895;
    if (!_1819)
    {
        _1893 = _703;
    }
    float _1899 = _1893;
    if (!_1819)
    {
        _1897 = _578;
    }
    float _1901 = _1897;
    bool _1903 = uint(_1857) >= uint(_590);
    bool _1905 = !_1883;
    int _1907 = _1905 ? 0 : (-1);
    bool _1909 = uint(_1879) >= uint(_610);
    int _1911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1913 = _1911 != 0;
    int _1915 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1917 = _1915 != 0;
    int _1919 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1921 = _1919 != 0;
    float _1923 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1925 = _1923 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1927 = !_1909;
    int _1929 = _1927 ? 0 : (-1);
    int _1931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _1933 = _1931 != 0;
    float _1935 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1937 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1939 = 1.0 / _1925;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1943 = _1887 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1945 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1947 = _578 + _650;
    float _1949 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1935);
    float _1951 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1937);
    float _1953 = fma(_1885, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1943);
    float _1955 = fma(_689, -2.0, _1945);
    float _1957 = _1947 + (-1.0);
    bool _1959 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1961 = isnan(_536);
    bool _1963 = _1959 || _1961;
    bool _1965 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1967 = _1963 || _1965;
    float _1969 = float(_1967);
    float _1971 = _703 * 2.0;
    float _1973 = _578 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1975 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _1977 = !_1903;
    int _1979 = _1977 ? 0 : (-1);
    float _1981 = floor(_1971);
    float _1983 = _554 * _1939;
    float _1985 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1987 = _536 + _1985;
    bool _1989 = _536 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1991 = isnan(_536);
    bool _1993 = _1989 || _1991;
    bool _1995 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1997 = _1993 || _1995;
    float _1999 = float(_1997);
    float _2001 = -_1969;
    float _2003 = _2001 + 1.0;
    float _2005 = -_1941;
    float _2007 = fma(_1973, 2.0, _2005);
    float _2009 = _650 + _703;
    float _2011 = fma(_1983, _1987, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _2013 = _1999 * _2003;
    float _2015 = _2009 + (-1.0);
    float _2017 = -_1999;
    float _2019 = _2017 + 1.0;
    float _2021 = _2011 * _2013;
    float _2023 = 0.0;
    if (!_1881)
    {
        _2023 = _650;
    }
    float _2025 = _2023;
    float _2027 = fma(_2015, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2029 = fma(_2019, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2021);
    bool _2031 = _1981 >= 0.0;
    bool _2033 = isnan(_1981);
    bool _2035 = _2031 || _2033;
    bool _2037 = isnan(0.0);
    bool _2039 = _2035 || _2037;
    float _2041 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1949);
    float _2043 = fma(_1969, (*spvDescriptorSet0.vp_c9)._m0[132].x, _2029);
    float _2045 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _2047 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1951);
    float _2049 = _1899 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _2051 = _2039 ? 0 : 1;
    float _2053 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    bool _2055 = _1981 > 0.0;
    float _2057 = -_2045;
    float _2059 = fma(_2049, 2.0, _2057);
    float _2061 = _2053 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2063 = _2043 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2067 = _2025;
    if (!_1881)
    {
        _1827 = _2025;
    }
    float _2069 = _1827;
    float _2071 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2073 = _2069;
    if (_1881)
    {
        _2067 = _578;
    }
    float _2075 = _2067;
    float _2077 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2079 = _2065 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2081 = _2071 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2083 = ~_2051;
    int _2085 = _2083 + 1;
    int _2087 = _2085 + 1;
    float _2089 = _2047 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2091 = fma(_2075, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2077);
    float _2093 = fma(_1889, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1953);
    int _2095 = _2087;
    if (!_2055)
    {
        int _2097 = ~_2051;
        int _2099 = _2097 + 1;
        _2095 = _2099;
    }
    int _2101 = _2095;
    out.m_63.x = _2061;
    out.m_63.y = _2079;
    out.m_63.z = _2081;
    out.m_63.w = _2063;
    int _2103 = _1471 >> 31;
    float _2105 = -_144;
    float _2107 = fma(_2105, (*spvDescriptorSet0.vp_c9)._m0[86].x, _2059);
    float _2109 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2091);
    int _2111 = ~_1821;
    int _2113 = _2111 + _1907;
    int _2115 = _2113 + 1;
    float _2117 = _2041 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2119 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2121 = _2089 + _2119;
    float _2123 = 0.0;
    if (!_1881)
    {
        _2123 = _703;
    }
    float _2125 = _2123;
    float _2127 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2129 = _2125;
    if (_1881)
    {
        _2129 = _650;
    }
    float _2131 = _2129;
    float _2133 = _2093 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2135 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2137 = _2117 + _2135;
    float _2139 = _2121 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _2141 = _2103 & 3;
    float _2143 = fma(_2131, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2127);
    float _2145 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2147 = _2133 + _2145;
    float _2149 = fma(_2137, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2139);
    int _2151 = _1471 + _2141;
    int _2153 = _570 * _2115;
    int _2155 = _2153 + _921;
    if (!_1881)
    {
        _1869 = _703;
    }
    float _2157 = _1869;
    float _2159 = fma(_2147, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2149);
    int _2161 = _2151 >> 2;
    float _2163 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2143);
    float _2165 = _2157;
    if (_1881)
    {
        _2165 = _650;
    }
    float _2167 = _2165;
    int _2169 = _2161 << 4;
    int _2171 = _2169 + 368;
    int _2173 = _1531 >> 31;
    float _2175 = _2167 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _2177 = _2159 >= 0.0;
    uint _2179 = uint(int(uint(_2171) >> uint(2)));
    uint _2181 = uint(int(uint(int(_2179)) >> uint(2)));
    int _2183 = int(_2179) & 3;
    float _2185 = (*spvDescriptorSet0.vp_c9)._m0[int(_2181)][_2183];
    int _2187 = int(_2179) + 1;
    uint _2189 = uint(int(uint(_2187) >> uint(2)));
    int _2191 = _2187 & 3;
    float _2193 = (*spvDescriptorSet0.vp_c9)._m0[int(_2189)][_2191];
    int _2195 = _2173 & 3;
    float _2197 = fma(_2175, -2.0, _562);
    if (_1881)
    {
        _2073 = _578;
    }
    float _2199 = _2073;
    int _2201 = _1531 + _2195;
    float _2203 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2197);
    bool _2205 = !_1913;
    int _2207 = _2205 ? 0 : 1;
    float _2209 = _2199 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _2211 = !_1917;
    int _2213 = _2211 ? 0 : 1;
    if (_2177)
    {
        out.m_51.x = 0.0;
    }
    int _2215 = _2201 >> 2;
    float _2217 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    int _2219 = abs(_2207);
    float _2221 = _1901 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _2223 = _2215 << 4;
    int _2225 = _2223 + 512;
    float _2227 = -_2217;
    float _2229 = fma(_2209, 2.0, _2227);
    int _2231 = abs(_2213);
    float _2233 = in.m_65.x;
    float _2235 = in.m_65.y;
    float _2237 = in.m_65.z;
    float _2239 = float(_1807);
    float _2241 = -_144;
    float _2243 = fma(_2241, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2229);
    float _2245 = float(_2101);
    float _2247 = float(_2219);
    bool _2249 = _570 == 0;
    uint _2251 = uint(int(uint(_2225) >> uint(2)));
    uint _2253 = uint(int(uint(int(_2251)) >> uint(2)));
    int _2255 = int(_2251) & 3;
    float _2257 = (*spvDescriptorSet0.vp_c9)._m0[int(_2253)][_2255];
    int _2259 = int(_2251) + 1;
    uint _2261 = uint(int(uint(_2259) >> uint(2)));
    int _2263 = _2259 & 3;
    float _2265 = (*spvDescriptorSet0.vp_c9)._m0[int(_2261)][_2263];
    float _2267 = _2247 * _2245;
    float _2269 = 0.0;
    int _2271 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[87].y);
    if (_2177)
    {
        _2269 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2273 = _2269;
    int _2275 = abs(_1545);
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _2279 = _2267 * (-2.0);
    int _2281 = _2171 + 8;
    uint _2283 = uint(int(uint(_2281) >> uint(2)));
    uint _2285 = uint(int(uint(int(_2283)) >> uint(2)));
    int _2287 = int(_2283) & 3;
    float _2289 = (*spvDescriptorSet0.vp_c9)._m0[int(_2285)][_2287];
    int _2291 = int(_2283) + 1;
    uint _2293 = uint(int(uint(_2291) >> uint(2)));
    int _2295 = _2291 & 3;
    float _2297 = (*spvDescriptorSet0.vp_c9)._m0[int(_2293)][_2295];
    if (_2177)
    {
        float _2299 = _2273 * 5.0;
        _2271 = as_type<int>(_2299);
    }
    int _2301 = _2271;
    float _2303 = fma(_2221, -2.0, _2277);
    int _2305 = ~_1843;
    int _2307 = _2305 + _1979;
    int _2309 = _2307 + 1;
    float _2311 = fma(_1975, _2279, _1975);
    int _2313 = abs(_1659);
    if (_2177)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _8210 = as_type<float>(_2301);
        out.gl_Position.z = _8210;
    }
    bool _2315 = !_2249;
    int _2317 = _2315 ? _2155 : (-1);
    float _2319 = fma(_2279, _2233, _2233);
    bool _2321 = !_1499;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _2303);
    int _2327 = _1623 & 3;
    bool _2329 = _2327 != 0;
    int _2331 = _1531 & 3;
    bool _2333 = _2331 != 0;
    int _2335 = _590 * _2309;
    int _2337 = _2335 + _951;
    int _2339 = ~_1849;
    int _2341 = _2339 + _1929;
    int _2343 = _2341 + 1;
    float _2345 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2347 = int(_2345);
    bool _2349 = !_2333;
    int _2351 = _2349 ? 0 : 1;
    int _2353 = _2225 + 8;
    uint _2355 = uint(int(uint(_2353) >> uint(2)));
    uint _2357 = uint(int(uint(int(_2355)) >> uint(2)));
    int _2359 = int(_2355) & 3;
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[int(_2357)][_2359];
    int _2363 = int(_2355) + 1;
    uint _2365 = uint(int(uint(_2363) >> uint(2)));
    int _2367 = _2363 & 3;
    float _2369 = (*spvDescriptorSet0.vp_c9)._m0[int(_2365)][_2367];
    int _2371 = _1623 >> 31;
    int _2373 = _610 * _2343;
    int _2375 = _2373 + _1275;
    bool _2377 = _1497 != 3;
    int _2379 = _2371 & 3;
    int _2381 = ~_2275;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    int _2387 = _1623 + _2379;
    float _2389 = trunc((*spvDescriptorSet0.vp_c9)._m0[85].z);
    int _2391 = int(_2389);
    int _2393 = _2385 * as_type<int>(_2193);
    int _2395 = abs(_2323);
    int _2397 = _2387 >> 2;
    int _2399 = abs(_1575);
    int _2401 = ~_2395;
    int _2403 = _2401 + 1;
    int _2405 = _2403 + 1;
    int _2407 = _2397 << 4;
    int _2409 = _2407 + 656;
    int _2411 = ~_2399;
    int _2413 = _2411 + 1;
    int _2415 = _2413 + 1;
    int _2417 = _2405 * as_type<int>(_2185);
    int _2419 = _2417 + _2393;
    int _2421 = ~_2313;
    int _2423 = _2421 + 1;
    int _2425 = _2423 + 1;
    uint _2427 = uint(int(uint(_2409) >> uint(2)));
    uint _2429 = uint(int(uint(int(_2427)) >> uint(2)));
    int _2431 = int(_2427) & 3;
    float _2433 = (*spvDescriptorSet0.vp_c9)._m0[int(_2429)][_2431];
    int _2435 = int(_2427) + 1;
    uint _2437 = uint(int(uint(_2435) >> uint(2)));
    int _2439 = _2435 & 3;
    float _2441 = (*spvDescriptorSet0.vp_c9)._m0[int(_2437)][_2439];
    int _2443 = abs(_2351);
    bool _2445 = !_2377;
    int _2447 = _2445 ? 0 : (-1);
    int _2449 = _2425 * as_type<int>(_2265);
    bool _2451 = _1551 != 3;
    int _2453 = _2415 * as_type<int>(_2289);
    int _2455 = _2453 + _2419;
    int _2457 = ~_2443;
    int _2459 = _2457 + 1;
    int _2461 = _2459 + 1;
    float _2463 = float(uint(_2391));
    bool _2465 = !_2451;
    int _2467 = _2465 ? 0 : (-1);
    int _2469 = _2461 * as_type<int>(_2257);
    int _2471 = _2469 + _2449;
    float _2473 = 1.0 / _2463;
    int _2475 = abs(_1633);
    int _2477 = abs(_2447);
    int _2479 = abs(_2467);
    int _2481 = abs(_1685);
    int _2483 = abs(_1663);
    int _2485 = _2409 + 8;
    uint _2487 = uint(int(uint(_2485) >> uint(2)));
    uint _2489 = uint(int(uint(int(_2487)) >> uint(2)));
    int _2491 = int(_2487) & 3;
    float _2493 = (*spvDescriptorSet0.vp_c9)._m0[int(_2489)][_2491];
    int _2495 = int(_2487) + 1;
    uint _2497 = uint(int(uint(_2495) >> uint(2)));
    int _2499 = _2495 & 3;
    float _2501 = (*spvDescriptorSet0.vp_c9)._m0[int(_2497)][_2499];
    int _2503 = ~_2475;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    float _2509 = float(uint(_2347));
    int _2511 = ~_2477;
    int _2513 = _2511 + 1;
    int _2515 = _2513 + 1;
    int _2517 = _2507 * as_type<int>(_2361);
    int _2519 = _2517 + _2471;
    int _2521 = ~_2479;
    int _2523 = _2521 + 1;
    int _2525 = _2523 + 1;
    float _2527 = 1.0 / _2509;
    int _2529 = ~_2483;
    int _2531 = _2529 + 1;
    int _2533 = _2531 + 1;
    int _2535 = _2515 * as_type<int>(_2297);
    int _2537 = _2535 + _2455;
    int _2539 = ~_2481;
    int _2541 = _2539 + 1;
    int _2543 = _2541 + 1;
    int _2545 = _2525 * as_type<int>(_2369);
    int _2547 = _2545 + _2519;
    bool _2549 = _590 == 0;
    int _2551 = _2537 * _2533;
    bool _2553 = _1679 != 3;
    int _2555 = _2543 * _2547;
    bool _2557 = !_2549;
    int _2559 = _2557 ? _2337 : (-1);
    int _2561 = _2317 * _2483;
    int _2563 = _2561 + _2551;
    bool _2565 = !_2329;
    int _2567 = _2565 ? 0 : 1;
    float _2569 = trunc((*spvDescriptorSet0.vp_c9)._m0[90].z);
    int _2571 = int(_2569);
    int _2573 = abs(_1751);
    int _2575 = _2559 * _2481;
    int _2577 = _2575 + _2555;
    int _2579 = abs(_2567);
    bool _2581 = !_2553;
    int _2583 = _2581 ? 0 : (-1);
    int _2585 = abs(_1783);
    float _2587 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2589 = log2(_2587);
    int _2591 = as_type<int>(_2527) + (-2);
    float _2593 = float(uint(_2563));
    int _2595 = abs(_2583);
    float _2597 = as_type<float>(_2591) * _2593;
    int _2599 = as_type<int>(_2473) + (-2);
    int _2601 = ~_2585;
    int _2603 = _2601 + 1;
    int _2605 = _2603 + 1;
    float _2607 = float(uint(_2577));
    float _2609 = trunc(_2597);
    float _2611 = precise::max(_2609, 0.0);
    uint _2613 = uint(_2611);
    int _2615 = ~_2579;
    int _2617 = _2615 + 1;
    int _2619 = _2617 + 1;
    int _2621 = _2605 * as_type<int>(_2441);
    float _2623 = as_type<float>(_2599) * _2607;
    int _2625 = _2619 * as_type<int>(_2433);
    int _2627 = _2625 + _2621;
    int _2629 = ~_2573;
    int _2631 = _2629 + 1;
    int _2633 = _2631 + 1;
    float _2635 = _2589 * _144;
    bool _2637 = !_1933;
    int _2639 = _2637 ? 0 : 1;
    float _2641 = trunc(_2623);
    float _2643 = precise::max(_2641, 0.0);
    uint _2645 = uint(_2643);
    int _2647 = ~_2595;
    int _2649 = _2647 + 1;
    int _2651 = _2649 + 1;
    int _2653 = _2633 * as_type<int>(_2493);
    int _2655 = _2653 + _2627;
    int _2657 = abs(_2639);
    int _2659 = ~_2347;
    int _2661 = _2659 + 1;
    int _2663 = _2651 * as_type<int>(_2501);
    int _2665 = _2663 + _2655;
    float _2667 = float(uint(_2571));
    float _2669 = exp2(_2635);
    int _2671 = ~_2391;
    int _2673 = _2671 + 1;
    int _2675 = ~_2657;
    int _2677 = _2675 + 1;
    int _2679 = _2677 + 1;
    bool _2681 = _610 == 0;
    int _2683 = _2661 * int(_2613);
    int _2685 = _2683 + _2563;
    int _2687 = abs(_2347);
    float _2689 = 1.0 / _2667;
    int _2691 = _2679 * _2665;
    bool _2693 = !_2681;
    int _2695 = _2693 ? _2375 : (-1);
    float _2697 = -_144;
    float _2699 = fma(_2697, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2007);
    float _2701 = float(uint(_2685));
    int _2703 = _2695 * _2657;
    int _2705 = _2703 + _2691;
    int _2707 = abs(_2391);
    int _2709 = _2673 * int(_2645);
    int _2711 = _2709 + _2577;
    float _2713 = as_type<float>(_2591) * _2701;
    float _2715 = float(uint(_2687));
    float _2717 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2719 = 1.0 + _2717;
    float _2721 = -_2669;
    float _2723 = _2721 + 1.0;
    float _2725 = float(uint(_2711));
    float _2727 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _693);
    float _2729 = 1.0 / _2715;
    int _2731 = as_type<int>(_2689) + (-2);
    float _2733 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2735 = as_type<float>(_2599) * _2725;
    int _2737 = abs(_2571);
    float _2739 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2733);
    float _2741 = float(uint(_2707));
    float _2743 = 1.0 / _2719;
    float _2745 = float(uint(_2737));
    float _2747 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2739);
    float _2749 = float(uint(_2705));
    float _2751 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1955);
    int _2753 = abs(_2563);
    float _2755 = 1.0 / _2741;
    float _2757 = as_type<float>(_2731) * _2749;
    float _2759 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _2761 = as_type<int>(_2729) + (-2);
    int _2763 = abs(_2577);
    float _2765 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _2767 = 1.0 / _2745;
    float _2769 = float(uint(_2753));
    float _2771 = fma(_578, (*spvDescriptorSet0.vp_c9)._m0[88].z, _2759);
    bool _2773 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2775 = isnan(1.0);
    bool _2777 = _2773 || _2775;
    bool _2779 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2781 = _2777 || _2779;
    float _2783 = fma(_650, (*spvDescriptorSet0.vp_c9)._m0[88].w, _2765);
    float _2785 = float(uint(_2763));
    float _2787 = as_type<float>(_2761) * _2769;
    bool _2789 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2791 = isnan(0.0);
    bool _2793 = _2789 || _2791;
    bool _2795 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2797 = _2793 || _2795;
    float _2799 = trunc(_2757);
    float _2801 = precise::max(_2799, 0.0);
    uint _2803 = uint(_2801);
    int _2805 = as_type<int>(_2755) + (-2);
    float _2807 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _2771);
    int _2809 = abs(_2705);
    float _2811 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _2783);
    float _2813 = _2797 ? _2723 : 0.0;
    float _2815 = as_type<float>(_2805) * _2785;
    float _2817 = float(uint(_2809));
    float _2819 = trunc(_2787);
    float _2821 = precise::max(_2819, 0.0);
    uint _2823 = uint(_2821);
    int _2825 = as_type<int>(_2767) + (-2);
    float _2827 = _2121 * _2121;
    float _2829 = float(_2231);
    if (_2781)
    {
        float _2831 = _2813 * _2743;
        _148 = _2831;
    }
    float _2833 = _148;
    int _2835 = ~_2571;
    int _2837 = _2835 + 1;
    float _2839 = fma(_2137, _2137, _2827);
    float _2841 = as_type<float>(_2825) * _2817;
    float _2843 = trunc(_2815);
    float _2845 = precise::max(_2843, 0.0);
    uint _2847 = uint(_2845);
    float _2849 = _2829 * _2239;
    int _2851 = _2837 * int(_2803);
    int _2853 = _2851 + _2705;
    float _2855 = fma(_2147, _2147, _2839);
    int _2857 = ~_2687;
    int _2859 = _2857 + 1;
    float _2861 = _2849 * (-2.0);
    int _2863 = ~_2707;
    int _2865 = _2863 + 1;
    float _2867 = trunc(_2713);
    float _2869 = precise::max(_2867, 0.0);
    uint _2871 = uint(_2869);
    int _2873 = _2859 * int(_2823);
    int _2875 = _2873 + _2753;
    float _2877 = float(uint(_2853));
    float _2879 = fma(_2861, _2235, _2235);
    int _2881 = ~_2737;
    int _2883 = _2881 + 1;
    float _2885 = float(uint(_2875));
    float _2887 = trunc(_2841);
    float _2889 = precise::max(_2887, 0.0);
    uint _2891 = uint(_2889);
    int _2893 = _2865 * int(_2847);
    int _2895 = _2893 + _2763;
    int _2897 = ~_2347;
    int _2899 = _2897 + 1;
    float _2901 = rsqrt(_2855);
    float _2903 = trunc(_2735);
    float _2905 = precise::max(_2903, 0.0);
    uint _2907 = uint(_2905);
    int _2909 = _2883 * int(_2891);
    int _2911 = _2909 + _2809;
    float _2913 = float(uint(_2911));
    float _2915 = as_type<float>(_2731) * _2877;
    float _2917 = _506 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2919 = int(_2613) + int(_2871);
    float _2921 = as_type<float>(_2825) * _2913;
    float _2923 = float(uint(_2895));
    float _2925 = as_type<float>(_2761) * _2885;
    float _2927 = _2917 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    int _2929 = int(_2645) + int(_2907);
    float _2931 = trunc(_2915);
    float _2933 = precise::max(_2931, 0.0);
    uint _2935 = uint(_2933);
    float _2937 = as_type<float>(_2805) * _2923;
    float _2939 = _2927 * _2901;
    int _2941 = ~_2391;
    int _2943 = _2941 + 1;
    float _2945 = _578 + (-0.5);
    float _2947 = _2121 * _2939;
    float _2949 = _2137 * _2939;
    float _2951 = trunc(_2937);
    float _2953 = precise::max(_2951, 0.0);
    uint _2955 = uint(_2953);
    float _2957 = fma(_2945, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2319);
    float _2959 = -_2947;
    float _2961 = _2121 + _2959;
    float _2963 = -_2949;
    float _2965 = _2137 + _2963;
    int _2967 = _2943 * _2929;
    int _2969 = _2967 + _2577;
    float _2971 = _2961 * _2961;
    int _2973 = ~_2707;
    int _2975 = _2973 + 1;
    float _2977 = trunc(_2925);
    float _2979 = precise::max(_2977, 0.0);
    uint _2981 = uint(_2979);
    int _2983 = int(_2803) + int(_2935);
    float _2985 = fma(_2965, _2965, _2971);
    int _2987 = ~_2687;
    int _2989 = _2987 + 1;
    float _2991 = _2147 * _2939;
    int _2993 = ~_2571;
    int _2995 = _2993 + 1;
    float _2997 = fma(_2311, _2833, _2957);
    bool _2999 = uint(_2969) >= uint(_2391);
    float _3001 = -_2991;
    float _3003 = _2147 + _3001;
    int _3005 = _2899 * _2919;
    int _3007 = _3005 + _2563;
    int _3009 = int(_2847) + int(_2955);
    float _3011 = trunc(_2921);
    float _3013 = precise::max(_3011, 0.0);
    uint _3015 = uint(_3013);
    int _3017 = _2995 * _2983;
    int _3019 = _3017 + _2705;
    bool _3021 = uint(_3007) >= uint(_2347);
    int _3023 = _2975 * _3009;
    int _3025 = _3023 + _2763;
    int _3027 = int(_2823) + int(_2981);
    float _3029 = _650 + (-0.5);
    bool _3031 = uint(_3019) >= uint(_2571);
    float _3033 = fma(_3003, _3003, _2985);
    int _3035 = ~_2737;
    int _3037 = _3035 + 1;
    int _3039 = _2989 * _3027;
    int _3041 = _3039 + _2753;
    float _3043 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _3045 = uint(_3025) >= uint(_2707);
    bool _3047 = !_3031;
    int _3049 = _3047 ? 0 : (-1);
    int _3051 = int(_2891) + int(_3015);
    float _3053 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _3055 = uint(_3041) >= uint(_2687);
    bool _3057 = !_3021;
    int _3059 = _3057 ? 0 : (-1);
    int _3061 = _3037 * _3051;
    int _3063 = _3061 + _2809;
    bool _3065 = !_2999;
    int _3067 = _3065 ? 0 : (-1);
    int _3069 = ~_2919;
    int _3071 = _3069 + _3059;
    int _3073 = _3071 + 1;
    float _3075 = _3043 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _3077 = ~_2929;
    int _3079 = _3077 + _3067;
    int _3081 = _3079 + 1;
    float _3083 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _3085 = uint(_3063) >= uint(_2737);
    int _3087 = _2347 * _3073;
    int _3089 = _3087 + _2563;
    int _3091 = _2577 ^ _2391;
    int _3093 = _2391 * _3081;
    int _3095 = _3093 + _2577;
    bool _3097 = _2347 == 0;
    bool _3099 = !_3045;
    int _3101 = _3099 ? 0 : (-1);
    float _3103 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _3105 = _2391 == 0;
    bool _3107 = !_3085;
    int _3109 = _3107 ? 0 : (-1);
    bool _3111 = _2391 == 0;
    int _3113 = ~_2983;
    int _3115 = _3113 + _3049;
    int _3117 = _3115 + 1;
    bool _3119 = !_3097;
    int _3121 = _3119 ? _3089 : (-1);
    bool _3123 = !_3105;
    int _3125 = _3123 ? _3095 : (-1);
    int _3127 = _2705 ^ _2571;
    int _3129 = _2571 * _3117;
    int _3131 = _3129 + _2705;
    int _3133 = _2563 ^ _2347;
    int _3135 = ~_3101;
    int _3137 = _3009 + _3135;
    int _3139 = _3137 + 1;
    float _3141 = _3053 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _3143 = float(_3121);
    float _3145 = fma(_3075, _1331, -0.5);
    float _3147 = float(_3125);
    float _3149 = fma(_3141, _1391, -0.5);
    bool _3151 = _2571 == 0;
    float _3153 = fma(_3075, _3143, _2699);
    bool _3155 = _2571 == 0;
    float _3157 = fma(_3141, _3147, _2243);
    uint _3159 = uint(int(uint(_3091) >> uint(31)));
    float _3161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _3163 = uint(int(uint(_3133) >> uint(31)));
    float _3165 = _3103 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    bool _3167 = !_3055;
    int _3169 = _3167 ? 0 : (-1);
    float _3171 = fma(_2747, _3145, _3153);
    uint _3173 = uint(int(uint(_3127) >> uint(31)));
    float _3175 = fma(_3165, _1413, -0.5);
    int _3177 = ~int(_3159);
    int _3179 = _3177 + 1;
    float _3181 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _3183 = !_3151;
    int _3185 = _3183 ? _3131 : (-1);
    float _3187 = fma(_2109, _3149, _3157);
    int _3189 = ~int(_3163);
    int _3191 = _3189 + 1;
    float _3193 = fma(_2027, _2861, _2027);
    int _3195 = ~_3169;
    int _3197 = _3027 + _3195;
    int _3199 = _3197 + 1;
    int _3201 = ~_3109;
    int _3203 = _3051 + _3201;
    int _3205 = _3203 + 1;
    int _3207 = ~int(_3173);
    int _3209 = _3207 + 1;
    int _3211 = _3139 ^ _3179;
    float _3213 = float(_3185);
    int _3215 = _3199 ^ _3191;
    int _3217 = _3205 ^ _3209;
    float _3219 = fma(_3165, _3213, _2107);
    int _3221 = ~_3179;
    int _3223 = _3221 + _3211;
    int _3225 = _3223 + 1;
    bool _3227 = _2347 == 0;
    float _3229 = fma(_2807, _3175, _3219);
    int _3231 = ~_3191;
    int _3233 = _3231 + _3215;
    int _3235 = _3233 + 1;
    float _3237 = _3083 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _3239 = ~_3209;
    int _3241 = _3239 + _3217;
    int _3243 = _3241 + 1;
    float _3245 = _3161 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _3247 = !_3111;
    int _3249 = _3247 ? _3225 : (-1);
    float _3251 = _3181 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _3253 = !_3227;
    int _3255 = _3253 ? _3235 : (-1);
    float _3257 = fma(_1473, _3245, -0.5);
    bool _3259 = !_3155;
    int _3261 = _3259 ? _3243 : (-1);
    float _3263 = fma(_3251, _1487, -0.5);
    float _3265 = float(_3249);
    float _3267 = fma(_1447, _3237, -0.5);
    float _3269 = float(_3255);
    float _3271 = float(_3261);
    float _3273 = -_2203;
    float _3275 = fma(_3245, _3265, _3273);
    bool _3277 = !_1921;
    int _3279 = _3277 ? 0 : 1;
    float _3281 = -_2751;
    float _3283 = fma(_3237, _3269, _3281);
    float _3285 = _3229 + 0.5;
    float _3287 = -_2325;
    float _3289 = fma(_3251, _3271, _3287);
    float _3291 = fma(_2163, _3257, _3275);
    float _3293 = fma(_2727, _3267, _3283);
    float _3295 = _3171 + 0.5;
    float _3297 = fma(_2811, _3263, _3289);
    float _3299 = _3187 + 0.5;
    float _3301 = _3293 + 0.5;
    float _3303 = _3291 + 0.5;
    float _3305 = _3297 + 0.5;
    out.m_67.x = _3295;
    out.m_67.y = _3301;
    out.m_67.z = _3299;
    out.m_67.w = _3303;
    out.m_69.x = _3285;
    out.m_69.y = _3305;
    float _3307 = _3219;
    float _3309 = as_type<float>(_3063);
    float _3311 = _3229;
    if (_2177)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3313 = -_2947;
    float _3315 = _2089 + _3313;
    float _3317 = float(_1875);
    float _3319 = -_2949;
    float _3321 = _2117 + _3319;
    int _3323 = abs(_3279);
    float _3325 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3327 = _3315 + _3325;
    float _3329 = -_2991;
    float _3331 = _2133 + _3329;
    float _3333 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3335 = _3321 + _3333;
    float _3337 = _578 + _703;
    float _3339 = _3327 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _3341 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3343 = _3331 + _3341;
    float _3345 = fma(_3029, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2879);
    float _3347 = _3337 + (-1.0);
    float _3349 = fma(_3335, (*spvDescriptorSet0.vp_c8)._m0[28].x, _3339);
    float _3351 = float(_3323);
    float _3353 = _703 + (-0.5);
    float _3355 = fma(_3343, (*spvDescriptorSet0.vp_c8)._m0[28].z, _3349);
    float _3357 = fma(_3193, _2833, _3345);
    float _3359 = _3351 * _3317;
    float _3361 = _2997 * 0.15915493667125701904296875;
    float _3363 = fma(_3347, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _3365 = _3355 >= 0.0;
    float _3367 = _3359 * (-2.0);
    float _3369 = _3357 * 0.15915493667125701904296875;
    float _3371 = sqrt(_3033);
    float _3373 = fma(_3367, _2237, _2237);
    float _3375 = fma(_3363, _3367, _3363);
    float _3377 = fma(_3353, (*spvDescriptorSet0.vp_c9)._m0[196].z, _3373);
    float _3379 = _3361 * 6.283185482025146484375;
    float _3381 = sin(_3379);
    float _3383 = fma(_3375, _2833, _3377);
    float _3385 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_3365)
    {
        _3385 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _3387 = _3385;
    int _3389 = as_type<int>(_3387);
    if (_3365)
    {
        out.m_51.x = 0.0;
    }
    float _3391 = _3383 * 0.15915493667125701904296875;
    float _3393 = _3361 * 6.283185482025146484375;
    float _3395 = cos(_3393);
    if (_3365)
    {
        float _3397 = _3387 * 5.0;
        _3389 = as_type<int>(_3397);
    }
    int _3399 = _3389;
    if (_3365)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _9747 = as_type<float>(_3399);
        out.gl_Position.z = _9747;
    }
    float _3401 = _3369 * 6.283185482025146484375;
    float _3403 = sin(_3401);
    float _3405 = _3369 * 6.283185482025146484375;
    float _3407 = cos(_3405);
    float _3409 = _3391 * 6.283185482025146484375;
    float _3411 = sin(_3409);
    if (_3365)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3413 = -_2089;
    float _3415 = _3413 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3417 = -_2117;
    float _3419 = _3417 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3421 = -_2133;
    float _3423 = _3421 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3425 = in.m_71.x;
    float _3427 = in.m_71.y;
    float _3429 = in.m_71.z;
    float _3431 = _3415 * _3415;
    float _3433 = _3391 * 6.283185482025146484375;
    float _3435 = cos(_3433);
    float _3437 = _3381 * _3403;
    float _3439 = _3395 * _3407;
    float _3441 = fma(_3419, _3419, _3431);
    float _3443 = _3395 * _3403;
    float _3445 = _3381 * _3407;
    float _3447 = fma(_3411, _3439, _3437);
    float _3449 = fma(_3423, _3423, _3441);
    float _3451 = fma(_3411, _3437, _3439);
    float _3453 = _2901 * _3371;
    float _3455 = _502 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _3457 = _504 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _3459 = rsqrt(_3449);
    float _3461 = -_3443;
    float _3463 = fma(_3411, _3445, _3461);
    float _3465 = _3453 * _3455;
    float _3467 = _3395 * _3435;
    float _3469 = _3407 * _3435;
    float _3471 = _3381 * _3435;
    float _3473 = _3403 * _3435;
    float _3475 = -_3445;
    float _3477 = fma(_3411, _3443, _3475);
    float _3479 = _2917 * _3453;
    float _3481 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _3425);
    float _3483 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _3427);
    float _3485 = _3453 * _3457;
    float _3487 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _3429);
    float _3489 = _3481 * _3479;
    float _3491 = _3483 * _3465;
    bool _3493 = _3427 != 0.0;
    bool _3495 = isnan(_3427);
    bool _3497 = _3493 || _3495;
    bool _3499 = isnan(0.0);
    bool _3501 = _3497 || _3499;
    float _3503 = _3419 * _3459;
    float _3505 = _3423 * _3459;
    float _3507 = in.m_73.x;
    float _3509 = in.m_73.y;
    float _3511 = in.m_73.z;
    float _3513 = _3487 * _3485;
    float _3515 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3517 = _3503 * _3515;
    float _3519 = _3415 * _3459;
    float _3521 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3523 = _3505 * _3521;
    bool _3525 = _3425 == 0.0;
    bool _3527 = !_3501;
    bool _3529 = _3525 && _3527;
    float _3531 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3533 = -_3517;
    float _3535 = fma(_3505, _3531, _3533);
    float _3537 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _3539 = _3519 * _3537;
    float _3541 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _3543 = -_3523;
    float _3545 = fma(_3519, _3541, _3543);
    float _3547 = in.m_75.x;
    float _3549 = in.m_75.y;
    float _3551 = in.m_75.z;
    float _3553 = in.m_75.w;
    float _3555 = _3535 * _3535;
    float _3557 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3559 = -_3539;
    float _3561 = fma(_3503, _3557, _3559);
    bool _3563 = _3429 == 0.0;
    bool _3565 = _3563 && _3529;
    float _3567 = -_3491;
    float _3569 = _3411 * _3567;
    float _3571 = fma(_3545, _3545, _3555);
    float _3573 = _3467 * _3491;
    float _3575 = _3471 * _3491;
    float _3577 = fma(_3469, _3489, _3569);
    float _3579 = fma(_3561, _3561, _3571);
    float _3581 = fma(_3447, _3489, _3573);
    float _3583 = fma(_3463, _3489, _3575);
    float _3585 = fma(_3473, _3513, _3577);
    float _3587 = rsqrt(_3579);
    float _3589 = fma(_3477, _3513, _3581);
    float _3591 = _3491;
    float _3593 = _3571;
    float _3595 = _3489;
    float _3597 = _3451;
    if (_3565)
    {
        _3307 = _3507;
    }
    float _3599 = _3307;
    float _3601 = _3599;
    if (_3565)
    {
        _3309 = _3511;
    }
    float _3603 = _3309;
    float _3605 = _3603;
    if (_3565)
    {
        _3311 = _3509;
    }
    float _3607 = _3311;
    float _3609 = _3607;
    if (_3565)
    {
        _3591 = _3599;
    }
    float _3611 = _3591;
    float _3613 = _3611;
    if (!_3565)
    {
        _3601 = _3507;
    }
    float _3615 = _3601;
    if (_3565)
    {
        _3593 = _3603;
    }
    float _3617 = _3593;
    float _3619 = _3617;
    if (_3565)
    {
        _3595 = _3607;
    }
    float _3621 = _3595;
    float _3623 = _3545 * _3587;
    float _3625 = _3621;
    if (!_3565)
    {
        _3605 = _3511;
    }
    float _3627 = _3605;
    float _3629 = _3535 * _3587;
    if (!_3565)
    {
        _3609 = _3509;
    }
    float _3631 = _3609;
    float _3633 = _3551 * _3615;
    float _3635 = _3561 * _3587;
    if (!_3565)
    {
        float _3637 = fma(_3429, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3627);
        _3619 = _3637;
    }
    float _3639 = _3619;
    float _3641 = _3505 * _3629;
    float _3643 = _3519 * _3623;
    float _3645 = -_3633;
    float _3647 = fma(_3547, _3627, _3645);
    float _3649 = _3549 * _3627;
    float _3651 = fma(_3451, _3513, _3583);
    float _3653 = _3547 * _3631;
    float _3655 = -_3641;
    float _3657 = fma(_3519, _3635, _3655);
    float _3659 = -_3643;
    float _3661 = fma(_3503, _3629, _3659);
    float _3663 = _3639;
    if (!_3565)
    {
        float _3665 = fma(_3425, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3615);
        _3613 = _3665;
    }
    float _3667 = _3613;
    float _3669 = -_3649;
    float _3671 = fma(_3551, _3631, _3669);
    float _3673 = -_3653;
    float _3675 = fma(_3549, _3615, _3673);
    float _3677 = _3657 * _3589;
    float _3679 = _3661 * _3589;
    if (!_3565)
    {
        float _3681 = fma(_3427, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3631);
        _3625 = _3681;
    }
    float _3683 = _3625;
    float _3685 = _3647 * _3553;
    float _3687 = _3671 * _3553;
    float _3689 = _3503 * _3635;
    float _3691 = _3675 * _3553;
    float _3693 = fma(_3623, _3585, _3677);
    float _3695 = fma(_3635, _3585, _3679);
    float _3697 = -_3689;
    float _3699 = fma(_3505, _3623, _3697);
    float _3701 = _3447 * _3657;
    float _3703 = fma(_3503, _3651, _3693);
    float _3705 = fma(_3505, _3651, _3695);
    float _3707 = _3447 * _3699;
    float _3709 = _3447 * _3661;
    float _3711 = _2117 + _3703;
    float _3713 = _2133 + _3705;
    float _3715 = _3467 * _3657;
    float _3717 = _3477 * _3657;
    float _3719 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _3721 = _3711 + _3719;
    float _3723 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _3725 = _3713 + _3723;
    float _3727 = _3467 * _3699;
    float _3729 = _3467 * _3661;
    float _3731 = _3721 * _3721;
    float _3733 = _3725 * _3725;
    float _3735 = _3477 * _3661;
    float _3737 = _3477 * _3699;
    float _3739 = fma(_3469, _3623, _3701);
    float _3741 = _3731 + _3733;
    float _3743 = fma(_3469, _3629, _3707);
    float _3745 = fma(_3469, _3635, _3709);
    float _3747 = _3699 * _3589;
    float _3749 = sqrt(_3741);
    float _3751 = -_3411;
    float _3753 = fma(_3751, _3623, _3715);
    float _3755 = fma(_3473, _3623, _3717);
    float _3757 = fma(_3629, _3585, _3747);
    float _3759 = -_3411;
    float _3761 = fma(_3759, _3629, _3727);
    float _3763 = -_3411;
    float _3765 = fma(_3763, _3635, _3729);
    float _3767 = fma(_3473, _3635, _3735);
    float _3769 = fma(_3473, _3629, _3737);
    float _3771 = fma(_3463, _3503, _3739);
    float _3773 = fma(_3471, _3503, _3753);
    float _3775 = fma(_3451, _3503, _3755);
    float _3777 = fma(_3519, _3651, _3757);
    float _3779 = fma(_3471, _3519, _3761);
    float _3781 = fma(_3471, _3505, _3765);
    float _3783 = fma(_3463, _3519, _3743);
    float _3785 = _2089 + _3777;
    bool _3787 = _3749 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3789 = fma(_3463, _3505, _3745);
    float _3791 = fma(_3451, _3519, _3769);
    float _3793 = fma(_3451, _3505, _3767);
    float _3795 = _3773 * _3549;
    float _3797 = _3779 * _3549;
    float _3799 = _3781 * _3549;
    float _3801 = _3773 * _3683;
    float _3803 = _3685 * _3773;
    float _3805 = _3779 * _3683;
    float _3807 = _3781 * _3683;
    float _3809 = _3685 * _3779;
    float _3811 = _3685 * _3781;
    float _3813 = _3731;
    float _3815 = _3733;
    float _3817 = _3711;
    float _3819 = _3713;
    if (!_3787)
    {
        _3597 = _3785;
    }
    float _3821 = _3597;
    bool _3823 = !_3787;
    float _3825 = _3821;
    if (!_3823)
    {
        float _3827 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3829 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _3831 = _3749 + _3829;
        float _3833 = rsqrt(_3741);
        float _3835 = _3831 * _3827;
        float _3837 = _3785 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3839 = _3835 * 0.15915493667125701904296875;
        float _3841 = _3839 * 6.283185482025146484375;
        float _3843 = sin(_3841);
        float _3845 = _3839 * 6.283185482025146484375;
        float _3847 = cos(_3845);
        float _3849 = fma(_3843, _3837, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _3851 = _3833 * _3849;
        float _3853 = _3847 + (-1.0);
        float _3855 = fma(_3721, _3851, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _3857 = fma(_3725, _3851, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _3859 = _3853 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _3861 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _3863 = _3855 + _3861;
        float _3865 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _3867 = _3857 + _3865;
        float _3869 = fma(_3785, _3847, _3859);
        float _3871 = _3863 * _3863;
        float _3873 = _3867 * _3867;
        _3825 = _3869;
        _3813 = _3871;
        _3815 = _3873;
        _3817 = _3855;
        _3819 = _3857;
    }
    float _3875 = _3825;
    float _3877 = _3813;
    float _3879 = _3815;
    float _3881 = _3817;
    float _3883 = _3819;
    float _3885 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _3887 = _3875 + _3885;
    float _3889 = fma(_3771, _3667, _3801);
    float _3891 = fma(_3783, _3667, _3805);
    float _3893 = fma(_3789, _3667, _3807);
    float _3895 = fma(_3887, _3887, _3877);
    float _3897 = fma(_3771, _3547, _3795);
    float _3899 = fma(_3783, _3547, _3797);
    float _3901 = fma(_3687, _3771, _3803);
    float _3903 = _3895 + _3879;
    float _3905 = fma(_3687, _3783, _3809);
    float _3907 = fma(_3789, _3547, _3799);
    float _3909 = fma(_3687, _3789, _3811);
    float _3911 = fma(_3775, _3551, _3897);
    float _3913 = fma(_3791, _3551, _3899);
    float _3915 = sqrt(_3903);
    float _3917 = fma(_3691, _3775, _3901);
    float _3919 = fma(_3791, _3639, _3891);
    float _3921 = fma(_3691, _3791, _3905);
    float _3923 = fma(_3793, _3551, _3907);
    float _3925 = fma(_3775, _3639, _3889);
    float _3927 = fma(_3691, _3793, _3909);
    float _3929 = fma(_3793, _3639, _3893);
    out.m_77.x = _3911;
    out.m_77.y = _3913;
    out.m_77.z = _3923;
    out.m_79.x = _3917;
    out.m_79.y = _3921;
    out.m_79.z = _3927;
    bool _3931 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _3933 = isnan(_3915);
    bool _3935 = _3931 || _3933;
    bool _3937 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _3939 = _3935 || _3937;
    out.m_81.x = _3925;
    out.m_81.y = _3919;
    out.m_81.z = _3929;
    float _3941 = _3911;
    if (!_3939)
    {
        _3663 = 1.0;
    }
    float _3943 = _3663;
    bool _3945 = !_3939;
    float _3947 = _3943;
    if (!_3945)
    {
        bool _3949 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _3951 = isnan(_3915);
        bool _3953 = _3949 || _3951;
        bool _3955 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _3957 = _3953 || _3955;
        if (!_3957)
        {
            float _3959 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3961 = _3915 + _3959;
            float _3963 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _3965 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _3963;
            float _3967 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _3969 = _3967 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _3971 = 1.0 / _3965;
            float _3973 = _3961 * _3971;
            float _3975 = fma(_3973, _3969, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _3947 = _3975;
            _3977 = true;
        }
        else
        {
            bool _3979 = _3915 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _3981 = isnan(_3915);
            bool _3983 = _3979 || _3981;
            bool _3985 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _3987 = _3983 || _3985;
            if (!_3987)
            {
                float _3989 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3991 = _3915 + _3989;
                float _3993 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _3995 = _3993 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _3997 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _3999 = _3997 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _4001 = 1.0 / _3995;
                float _4003 = _3991 * _4001;
                float _4005 = fma(_4003, _3999, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _3947 = _4005;
                _3977 = true;
            }
            else
            {
                _3947 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _3977 = false;
    float _4007 = _3947;
    float _4009 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _4011 = _3881 + _4009;
    float _4013 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _4015 = _3875 + _4013;
    float _4017 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _4019 = _3883 + _4017;
    bool _4021 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _4023 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _4025 = _4021 || _4023;
    bool _4027 = isnan(0.5);
    bool _4029 = _4025 || _4027;
    float _4031 = fma(_4011, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _4033 = fma(_4015, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _4035 = fma(_4019, _4007, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _4037 = -_2949;
    float _4039 = _4037 + _4031;
    float _4041 = -_2947;
    float _4043 = _4041 + _4033;
    float _4045 = -_2991;
    float _4047 = _4045 + _4035;
    float _4049 = _4043;
    float _4051 = _4039;
    float _4053 = _4047;
    float _4055 = _4035;
    if (!_4029)
    {
        float _4057 = _3327 * _3327;
        float _4059 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _4061 = -_2133;
        float _4063 = _4061 + _4035;
        float _4065 = -_2089;
        float _4067 = _4065 + _4033;
        float _4069 = fma(_3335, _3335, _4057);
        float _4071 = fma(_3343, _3343, _4069);
        float _4073 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _4075 = sqrt(_4071);
        float _4077 = 1.0 / _3453;
        float _4079 = _4073 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _4081 = precise::min(_4075, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _4083 = _4081 * _4059;
        float _4085 = _4083 * _4077;
        float _4087 = -_2117;
        float _4089 = _4087 + _4031;
        float _4091 = _4079 * _4085;
        float _4093 = _4063 * _4085;
        float _4095 = fma(_4089, _4091, _3321);
        float _4097 = fma(_4067, _4091, _3315);
        float _4099 = fma(_4079, _4093, _3331);
        _4049 = _4097;
        _4051 = _4095;
        _4053 = _4099;
    }
    float _4101 = _4049;
    float _4103 = _4051;
    float _4105 = _4053;
    float _4107 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _4109 = _4101 + _4107;
    float _4111 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _4113 = _4103 + _4111;
    float _4115 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _4117 = _4105 + _4115;
    float _4119 = _4109 * _4109;
    float _4121 = fma(_4113, _4113, _4119);
    float _4123 = fma(_4117, _4117, _4121);
    float _4125 = rsqrt(_4123);
    float _4127 = _4125 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _4129 = _4113 * _4127;
    float _4131 = _4117 * _4127;
    float _4133 = _4129 * _4129;
    float _4135 = _4131 * _4131;
    float _4137 = _4133 + _4135;
    float _4139 = sqrt(_4137);
    bool _4141 = _4139 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4143 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _4145 = _4139 + _4143;
    float _4147 = _4117;
    float _4149 = _4137;
    float _4151 = _4145;
    float _4153 = _4109;
    if (_4141)
    {
        float _4155 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4147 = _4155;
    }
    float _4157 = _4147;
    if (_4141)
    {
        float _4159 = rsqrt(_4137);
        _4149 = _4159;
    }
    float _4161 = _4149;
    float _4163 = _4161;
    if (_4141)
    {
        float _4165 = _4145 * _4157;
        _4151 = _4165;
    }
    float _4167 = _4151;
    if (_4141)
    {
        float _4169 = _4167 * 0.15915493667125701904296875;
        _3941 = _4169;
    }
    float _4171 = _3941;
    float _4173 = _4125;
    float _4175 = _4171;
    if (_4141)
    {
        float _4177 = _4171 * 6.283185482025146484375;
        float _4179 = sin(_4177);
        _4173 = _4179;
    }
    float _4181 = _4173;
    float _4183 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _4185 = precise::max(0.0, _4183);
    float _4187 = _4157;
    float _4189 = _4185;
    if (_4141)
    {
        float _4191 = _4171 * 6.283185482025146484375;
        float _4193 = cos(_4191);
        _4187 = _4193;
    }
    float _4195 = _4187;
    float _4197 = -_4127;
    float _4199 = -_4185;
    float _4201 = fma(_4109, _4197, _4199);
    if (_4141)
    {
        float _4203 = _4201 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4153 = _4203;
    }
    float _4205 = _4153;
    float _4207 = _4205;
    if (!_4141)
    {
        _4175 = _4129;
    }
    float _4209 = _4175;
    float _4211 = _4181;
    float _4213 = _4209;
    if (_4141)
    {
        float _4215 = fma(_4181, _4205, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _4055 = _4215;
    }
    float _4217 = _4055;
    float _4219 = _4217;
    if (!_4141)
    {
        _4211 = _4201;
    }
    float _4221 = _4211;
    float _4223 = _4221;
    if (!_4141)
    {
        _4207 = _4133;
    }
    float _4225 = _4207;
    float _4227 = _4195;
    float _4229 = _4225;
    if (_4141)
    {
        float _4231 = _4195 + (-1.0);
        _4189 = _4231;
    }
    float _4233 = _4189;
    float _4235 = _4233;
    if (_4141)
    {
        float _4237 = _4161 * _4217;
        _4219 = _4237;
    }
    float _4239 = _4219;
    if (!_4141)
    {
        _4163 = _4135;
    }
    float _4241 = _4163;
    float _4243 = _4241;
    if (_4141)
    {
        float _4245 = _4233 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _4235 = _4245;
    }
    float _4247 = _4235;
    if (_4141)
    {
        float _4249 = _4129 * _4239;
        _4213 = _4249;
    }
    float _4251 = _4213;
    if (_4141)
    {
        float _4253 = fma(_4201, _4195, _4247);
        _4223 = _4253;
    }
    float _4255 = _4223;
    if (!_4141)
    {
        _4227 = _4131;
    }
    float _4257 = _4227;
    float _4259 = _4257;
    if (_4141)
    {
        float _4261 = _4131 * _4239;
        _4259 = _4261;
    }
    float _4263 = _4259;
    if (_4141)
    {
        float _4265 = _4251 * _4251;
        _4229 = _4265;
    }
    float _4267 = _4229;
    float _4269 = sqrt(_4123);
    float _4271 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    if (_4141)
    {
        float _4273 = _4263 * _4263;
        _4243 = _4273;
    }
    float _4275 = _4243;
    float _4277 = fma(_4255, _4255, _4267);
    float _4279 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _4281 = _4277 + _4275;
    float _4283 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _4285 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[3].x, _4279);
    float _4287 = rsqrt(_4281);
    float _4289 = fma(_3321, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _4291 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[2].x, _4283);
    float _4293 = fma(_3331, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _4295 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _4297 = fma(_4269, (*spvDescriptorSet0.vp_c15)._m0[23].w, _4295);
    float _4299 = precise::clamp(_4297, 0.0, 1.0);
    float _4301 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[2].z, _4291);
    float _4303 = floor(_4289);
    float _4305 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _4307 = _4301 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _4309 = -_4299;
    float _4311 = _4309 + 1.0;
    float _4313 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[1].x, _4305);
    float _4315 = _4307 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _4317 = _4287 * _4251;
    float _4319 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[1].z, _4313);
    float _4321 = -_4315;
    float _4323 = fma(_4321, _4271, 1.0);
    float _4325 = _4101 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _4327 = abs(_4311);
    float _4329 = log2(_4327);
    float _4331 = _4317 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _4333 = _4319 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _4335 = fma(_4103, (*spvDescriptorSet0.vp_c8)._m0[0].x, _4325);
    float _4337 = _4287 * _4255;
    float _4339 = _4287 * _4263;
    float _4341 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _4343 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[0].z, _4335);
    float _4345 = -_4331;
    float _4347 = fma(_4337, (*spvDescriptorSet0.vp_c15)._m0[21].y, _4345);
    float _4349 = fma(_4105, (*spvDescriptorSet0.vp_c8)._m0[3].z, _4285);
    float _4351 = floor(_4293);
    float _4353 = _4343 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _4355 = -_4339;
    float _4357 = fma(_4355, (*spvDescriptorSet0.vp_c15)._m0[21].z, _4347);
    float _4359 = _4349 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _4361 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _4363 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[7].x, _4341);
    float _4365 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _4367 = fma(_4357, -0.5, 0.5);
    float _4369 = log2(_4323);
    float _4371 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[7].z, _4363);
    float _4373 = -_4303;
    float _4375 = _4289 + _4373;
    float _4377 = fma(_4357, 0.5, 0.5);
    float _4379 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[7].w, _4371);
    float _4381 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _4383 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[5].x, _4361);
    float _4385 = exp2(_4365);
    float _4387 = fma(_4377, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _4389 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[4].x, _4381);
    float _4391 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[5].z, _4383);
    float _4393 = -_4351;
    float _4395 = _4293 + _4393;
    float _4397 = _4337 + 1.0;
    float _4399 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[4].z, _4389);
    float _4401 = fma(_4377, _4387, -0.212114393711090087890625);
    float _4403 = 1.0 / _4379;
    float _4405 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[5].w, _4391);
    float _4407 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[4].w, _4399);
    float _4409 = fma(_4377, _4401, 1.570728778839111328125);
    float _4411 = _4369 * 0.693147182464599609375;
    float _4413 = sqrt(_4367);
    float _4415 = -_4337;
    float _4417 = fma(_4385, _4397, _4415);
    float2 _11408 = float2(_4375, _4395);
    float _4419 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_11408, float2(0.0), isnan(_11408)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_11408, float2(0.0), isnan(_11408)), level(0.0)).x;
    float _4421 = _4411 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _4423 = _4407 * _4403;
    float _4425 = _4405 * _4403;
    float _4427 = fma(_4423, 0.5, 0.5);
    float _4429 = fma(_4425, -0.5, 0.5);
    float _4431 = _4413 * 0.636619746685028076171875;
    float3 _11436 = float3(_4427, _4429, _4421);
    float _4433 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_11436, float3(0.0), isnan(_11436)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_11436, float3(0.0), isnan(_11436)), level(0.0)).x;
    float _4435 = -_4409;
    float _4437 = fma(_4431, _4435, 1.0);
    float _4439 = fma(_4417, 0.5, 0.5);
    float3 _11454 = float3(_4427, _4429, _4421);
    float4 _4442 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_11454, float3(0.0), isnan(_11454)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_11454, float3(0.0), isnan(_11454)), level(0.0)).xyzw;
    float _4444 = _4442.x;
    float _4446 = _4442.y;
    float _4448 = _4442.z;
    float _4450 = _4442.w;
    float2 _11470 = float2(_4437, _4439);
    float3 _4454 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_11470, float2(0.0), isnan(_11470)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_11470, float2(0.0), isnan(_11470)), level(0.0)).xyz;
    float _4456 = _4454.x;
    float _4458 = _4454.y;
    float _4460 = _4454.z;
    float _4462 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _4464 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _4466 = isnan(_4269);
    bool _4468 = _4464 || _4466;
    bool _4470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _4472 = _4468 || _4470;
    float _4474 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[11].x, _4462);
    float _4476 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[11].z, _4474);
    float _4478 = _3315 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _4480 = _4476 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _4482 = fma(_3321, (*spvDescriptorSet0.vp_c8)._m0[10].x, _4478);
    float _4484 = 1.0 / _4480;
    float _4486 = fma(_3331, (*spvDescriptorSet0.vp_c8)._m0[10].z, _4482);
    float _4488 = _4486 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _4490 = _4488 + _4480;
    float _4492 = _4490 * _4484;
    float _4494 = _4492 * 0.5;
    float _4496 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _4498 = fma(_4494, (*spvDescriptorSet0.vp_c8)._m0[30].w, _4496);
    float _4500 = 1.0 / _4498;
    float _4502 = _4329 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _4504 = exp2(_4502);
    float _4506 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _4508 = _4500 * _4506;
    float _4510 = abs(_4508);
    float _4512 = log2(_4510);
    float _4514 = -_4504;
    float _4516 = _4514 + 1.0;
    bool _4518 = _4508 <= 8000.0;
    bool _4520 = isnan(_4508);
    bool _4522 = _4518 || _4520;
    bool _4524 = isnan(8000.0);
    bool _4526 = _4522 || _4524;
    float _4528 = float(_4526);
    float _4530 = _4516 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _4532 = _4512 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _4534 = _4333 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _4536 = fma(_4353, (*spvDescriptorSet0.vp_c8)._m0[6].x, _4534);
    float _4538 = exp2(_4532);
    float _4540 = fma(_4307, (*spvDescriptorSet0.vp_c8)._m0[6].z, _4536);
    float _4542 = in.m_83.x;
    float _4544 = fma(_4359, (*spvDescriptorSet0.vp_c8)._m0[6].w, _4540);
    float _4546 = _4544 + _4379;
    out.gl_Position.x = _4407;
    out.gl_Position.y = _4405;
    out.gl_Position.z = _4544;
    out.gl_Position.w = _4379;
    float _4548 = _4546 * 0.5;
    float _4550 = fma(_4538, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _4552 = precise::clamp(_4550, 0.0, 1.0);
    float _4554 = _4546;
    float _4556 = _4548;
    if (!_4472)
    {
        _4554 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _4558 = _4554;
    float _4560 = fma(_4552, -2.0, 3.0);
    float _4562 = _4552 * _4552;
    float _4564 = _4562 * _4560;
    float _4566 = -_4564;
    float _4568 = _4566 + 1.0;
    float _4570 = fma(_4568, (*spvDescriptorSet0.vp_c15)._m0[654].w, _4564);
    float _4572 = _4528 * _4570;
    out.m_85.z = _4548;
    out.m_85.w = _4379;
    float _4574 = _4572 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _4576 = _4379;
    float _4578 = _4558;
    float _4580 = _4558;
    if (!_4472)
    {
        _4576 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _4582 = _4576;
    float _4584 = _4582;
    float _4586 = _4582;
    if (!_4472)
    {
        _4556 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _4588 = _4556;
    float _4590 = -_4419;
    float _4592 = _4590 + 1.0;
    float _4594 = _4592 * _4574;
    float _4596 = precise::clamp(_4594, 0.0, 1.0);
    float _4598 = -_4596;
    float _4600 = fma(_4598, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _4602 = _4600 * _4542;
    float _4604 = _4542;
    float _4606 = _4444;
    float _4608 = _4602;
    float _4610 = _4588;
    float _4612 = _4588;
    if (!_4472)
    {
        _4604 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _4614 = _4604;
    float _4616 = _4530 * _4433;
    float _4618 = -_4530;
    float _4620 = _4618 + 1.0;
    float _4622 = _4450 * _4616;
    float _4624 = _4460 * _4616;
    float _4626 = fma(_4456, _4622, _4444);
    float _4628 = fma(_4458, _4622, _4446);
    float _4630 = _4602 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _4632 = _4450 * _4620;
    float _4634 = fma(_4450, _4624, _4448);
    float _4636 = _4614;
    float _4638 = _4614;
    if (!_4472)
    {
        _4606 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _4640 = _4606;
    out.m_87.x = _4630;
    float _4642 = _4640;
    float _4644 = _4640;
    if (!_4472)
    {
        _4608 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _4646 = _4608;
    out.m_89.x = _4626;
    out.m_89.y = _4628;
    out.m_89.z = _4634;
    out.m_89.w = _4632;
    bool _4648 = !_4472;
    float _4650 = _4646;
    float _4652 = _4646;
    if (!_4648)
    {
        bool _4654 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _4656 = isnan(_4269);
        bool _4658 = _4654 || _4656;
        bool _4660 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _4662 = _4658 || _4660;
        if (!_4662)
        {
            float _4664 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4666 = _4269 + _4664;
            float _4668 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _4670 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _4668;
            float _4672 = 1.0 / _4670;
            float _4674 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _4676 = _4674 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _4678 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _4680 = _4678 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _4682 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _4684 = _4682 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _4686 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _4688 = _4686 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _4690 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _4692 = _4690 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _4694 = _4666 * _4672;
            float _4696 = precise::clamp(_4694, 0.0, 1.0);
            float _4698 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _4700 = _4698 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _4702 = fma(_4696, _4676, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _4704 = fma(_4696, _4700, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _4706 = fma(_4696, _4680, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _4708 = fma(_4696, _4684, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _4710 = fma(_4696, _4688, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _4712 = fma(_4696, _4692, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _4638 = _4702;
            _4652 = _4710;
            _4586 = _4704;
            _4612 = _4708;
            _4644 = _4706;
            _4580 = _4712;
            _4714 = true;
        }
        else
        {
            bool _4716 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _4718 = isnan(_4269);
            bool _4720 = _4716 || _4718;
            bool _4722 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _4724 = _4720 || _4722;
            if (!_4724)
            {
                _4584 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _4726 = _4584;
            _4586 = _4726;
            if (!_4724)
            {
                _4636 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _4728 = _4636;
            _4638 = _4728;
            if (!_4724)
            {
                _4642 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _4730 = _4642;
            _4644 = _4730;
            if (!_4724)
            {
                _4610 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _4732 = _4610;
            _4612 = _4732;
            if (!_4724)
            {
                _4650 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _4734 = _4650;
            _4652 = _4734;
            if (!_4724)
            {
                _4578 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _4736 = _4578;
            bool _4738 = !_4724;
            _4580 = _4736;
            if (!_4738)
            {
                bool _4740 = _4269 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _4742 = isnan(_4269);
                bool _4744 = _4740 || _4742;
                bool _4746 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _4748 = _4744 || _4746;
                if (!_4748)
                {
                    float _4750 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4752 = _4269 + _4750;
                    float _4754 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _4756 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _4754;
                    float _4758 = 1.0 / _4756;
                    float _4760 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _4762 = _4760 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _4764 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _4766 = _4764 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _4768 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _4770 = _4768 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _4772 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _4774 = _4772 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _4776 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _4778 = _4776 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _4780 = _4752 * _4758;
                    float _4782 = precise::clamp(_4780, 0.0, 1.0);
                    float _4784 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _4786 = _4784 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _4788 = fma(_4782, _4762, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _4790 = fma(_4782, _4786, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _4792 = fma(_4782, _4766, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _4794 = fma(_4782, _4770, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _4796 = fma(_4782, _4774, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _4798 = fma(_4782, _4778, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _4638 = _4788;
                    _4652 = _4796;
                    _4586 = _4790;
                    _4612 = _4794;
                    _4644 = _4792;
                    _4580 = _4798;
                    _4714 = true;
                }
                else
                {
                    _4638 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _4652 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _4586 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _4612 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _4644 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _4580 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _4714 = false;
    float _4800 = _4638;
    float _4802 = _4652;
    float _4804 = _4586;
    float _4806 = _4612;
    float _4808 = _4644;
    float _4810 = _4580;
    float _4812 = fma(_3919, -0.5, 0.5);
    float _4814 = precise::clamp(_4812, 0.0, 1.0);
    float _4816 = -_4800;
    float _4818 = _4816 + _4802;
    float _4820 = -_4804;
    float _4822 = _4820 + _4806;
    float _4824 = -_4808;
    float _4826 = _4824 + _4810;
    bool _4828 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4830 = fma(_4814, _4818, _4800);
    float _4832 = fma(_4814, _4822, _4804);
    float _4834 = fma(_4814, _4826, _4808);
    float _4836 = _4830 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _4838 = fma(_4832, 0.298911988735198974609375, _4836);
    float _4840 = fma(_4834, 0.114477999508380889892578125, _4838);
    float _4842 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_91.x = 0.0;
    float _4844 = -_4840;
    float _4846 = _4832 + _4844;
    float _4848 = -_4840;
    float _4850 = _4830 + _4848;
    float _4852 = -_4840;
    float _4854 = _4834 + _4852;
    out.m_87.w = _4842;
    float _4856 = fma(_4846, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    float _4858 = fma(_4850, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    float _4860 = fma(_4854, (*spvDescriptorSet0.vp_c13)._m0[1].z, _4840);
    out.m_93.x = _4856;
    out.m_93.y = _4858;
    out.m_93.z = _4860;
    if (!_4828)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _4862 = -_4101;
    float _4864 = _4862 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _4866 = -_4103;
    float _4868 = _4866 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _4870 = -_4105;
    float _4872 = _4870 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _4874 = _4864 * _4864;
    float _4876 = fma(_4868, _4868, _4874);
    float _4878 = fma(_4872, _4872, _4876);
    float _4880 = sqrt(_4878);
    float _4882 = rsqrt(_4878);
    float _4884 = -_4880;
    float _4886 = _4884 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _4888 = _4886 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _4890 = precise::clamp(_4888, 0.0, 1.0);
    float _4892 = _4868 * _4882;
    float _4894 = _4864 * _4882;
    float _4896 = abs(_4890);
    float _4898 = log2(_4896);
    float _4900 = _4872 * _4882;
    float _4902 = _4892 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _4904 = _3919 * _4894;
    float _4906 = -_4894;
    float _4908 = -_4902;
    float _4910 = fma(_4906, (*spvDescriptorSet0.vp_c15)._m0[656].y, _4908);
    float _4912 = fma(_3925, _4892, _4904);
    float _4914 = -_4900;
    float _4916 = fma(_4914, (*spvDescriptorSet0.vp_c15)._m0[656].z, _4910);
    float _4918 = fma(_3929, _4900, _4912);
    float _4920 = precise::clamp(_4918, 0.0, 1.0);
    float _4922 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _4924 = _4916 + _4922;
    float _4926 = _4898 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _4928 = _4924 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _4930 = precise::clamp(_4928, 0.0, 1.0);
    float _4932 = exp2(_4926);
    float _4934 = _4932 * _4930;
    float _4936 = _4920 * _4934;
    float _4938 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _4940 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _4942 = _4936 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_91.x = _4938;
    out.m_91.y = _4940;
    out.m_91.z = _4942;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

