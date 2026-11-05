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
    float4 m_61 [[user(locn1)]];
    float4 m_81 [[user(locn2)]];
    float4 m_93 [[user(locn3)]];
    float4 m_67 [[user(locn4)]];
    float4 m_69 [[user(locn5)]];
    float4 m_85 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_73 [[user(locn8)]];
    float4 m_71 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_91 [[user(locn11)]];
    float4 m_87 [[user(locn12)]];
    float4 m_89 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_75 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_65 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2931 = false;
    bool _2116 = false;
    bool _1004 = false;
    bool _824 = false;
    bool _644 = false;
    bool _518 = false;
    bool _188 = false;
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
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3235 = as_type<float>(_128);
        out.gl_Position.z = _3235;
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
    if (_140)
    {
        float _146 = float(_112);
        _122 = _146;
    }
    float _148 = _122;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_164);
        out.gl_Position.z = _3304;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_112);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = 1.0 / _204;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _220;
    float _224 = 1.0 / _212;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _196 + _226;
    bool _230 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = isnan(_196);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    bool _242 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_196);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = 1.0 / _208;
    float _256 = _228 * _218;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _196 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _262;
    float _266 = fma(_264, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _268 = 1.0 / _216;
    float _270 = _260 * _224;
    bool _272 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _274 = isnan(_196);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _196 + _284;
    bool _288 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_196);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _302 = -_282;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _222;
    float _308 = _200 * _254;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = _196 + _310;
    bool _314 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_196);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_298;
    float _328 = _326 + 1.0;
    float _330 = _286 * _268;
    float _332 = _298 * _304;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = _324 * _328;
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_196);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = fma(_336, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = _312 * _306;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = _240 * _342;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = fma(_360, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _376 = fma(_366, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = -_240;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = _252 * _380;
    float _390 = -_252;
    float _392 = _390 + 1.0;
    float _394 = fma(_384, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _396 = _354 * _392;
    float _398 = -_354;
    float _400 = _398 + 1.0;
    float _402 = _376 * _396;
    float _404 = _356 * _396;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    float _410 = _266 * _396;
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _418 = fma(_408, _270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _422 = fma(_374, _388, _412);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _424;
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = fma(_416, _330, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = fma(_394, _388, _420);
    float _442 = fma(_418, _368, _422);
    float _444 = fma(_426, _270, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _446 = fma(_386, _388, _428);
    float _448 = fma(_432, _270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_438, _330, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _456 = fma(_444, _368, _446);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = fma(_452, _330, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _468 = fma(_448, _368, _440);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _470;
    float _474 = fma(_434, _338, _442);
    float _476 = fma(_460, _362, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _478 = fma(_464, _362, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _480 = fma(_472, _362, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _482 = fma(_454, _338, _468);
    float _484 = fma(_466, _338, _456);
    float _486 = fma(_476, _332, _474);
    float _488 = fma(_478, _332, _482);
    float _490 = fma(_480, _332, _484);
    float _492 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].x, _486);
    float _494 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].y, _488);
    float _496 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].z, _490);
    bool _498 = !_300;
    float _516;
    if (!_498)
    {
        float _500 = in.m_55.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_112);
        float _522 = 1.0 / _520;
        float _524 = _144 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_57.x;
    float _530 = in.m_57.y;
    float _532 = in.m_57.z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _526 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _538;
    bool _542 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _544 = isnan(_526);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _556 = 1.0 / _540;
    float _558 = _494 * _530;
    bool _560 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_526);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _536 * _556;
    float _574 = _496 * _532;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = -_570;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _588;
    float _592 = _552 * _582;
    float _594 = fma(_578, _572, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = fma(_586, _572, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _598 = fma(_590, _572, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _600 = -_552;
    float _602 = _600 + 1.0;
    float _604 = _594 * _592;
    float _606 = _596 * _592;
    float _608 = _598 * _592;
    float _610 = _492 * _528;
    float _612 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].y, _604);
    float _614 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].x, _606);
    float _616 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].z, _608);
    float _618 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].y, _612);
    float _620 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].x, _614);
    float _622 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].z, _616);
    bool _624 = !_554;
    float _642;
    if (!_624)
    {
        float _626 = in.m_55.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_112);
        float _648 = 1.0 / _646;
        float _650 = _144 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _652 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _666 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_652);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _682 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _684 = isnan(_652);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _660;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _696;
    float _700 = -_676;
    float _702 = _700 + 1.0;
    bool _704 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _706 = isnan(_652);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    bool _716 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _718 = 1.0 / _664;
    float _720 = 1.0 / _680;
    float _722 = _698 * _694;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _728 = _692 * _702;
    float _730 = -_692;
    float _732 = _730 + 1.0;
    float _734 = fma(_722, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _736;
    float _740 = _714 * _732;
    float _742 = _726 * _718;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _652 + _744;
    bool _748 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _750 = isnan(_652);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _734 * _740;
    float _762 = -_714;
    float _764 = _762 + 1.0;
    float _766 = fma(_742, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _770 = _652 + _768;
    float _772 = _738 * _720;
    float _774 = -_758;
    float _776 = _774 + 1.0;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[115].x, _760);
    float _780 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _782 = fma(_772, _770, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _784 = _676 * _776;
    float _786 = fma(_766, _728, _778);
    float _788 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = fma(_782, _784, _786);
    float _792 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _794 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[118].x, _790);
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _788;
    out.m_59.y = _798;
    out.m_59.z = _800;
    out.m_59.w = _802;
    bool _804 = !_716;
    float _822;
    if (!_804)
    {
        float _806 = in.m_55.x;
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _810 = _806 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _814 = _812 * _808;
        float _816 = floor(_814);
        float _818 = -_816;
        float _820 = _814 + _818;
        _822 = _820;
        _824 = true;
    }
    else
    {
        float _826 = float(_112);
        float _828 = 1.0 / _826;
        float _830 = _144 * _828;
        _822 = _830;
    }
    _824 = false;
    float _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _836 = _832 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _846 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _848 = isnan(_832);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _862 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = 1.0 / _840;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _876;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    bool _884 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _886 = isnan(_832);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _898 = 1.0 / _844;
    float _900 = 1.0 / _860;
    float _902 = _878 * _874;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _908 = _872 * _882;
    float _910 = -_872;
    float _912 = _910 + 1.0;
    float _914 = fma(_902, _836, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _916;
    float _920 = _894 * _912;
    float _922 = _906 * _898;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _926 = _832 + _924;
    bool _928 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _930 = isnan(_832);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _914 * _920;
    float _942 = -_894;
    float _944 = _942 + 1.0;
    float _946 = fma(_922, _926, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _950 = _832 + _948;
    float _952 = _918 * _900;
    float _954 = -_938;
    float _956 = _954 + 1.0;
    float _958 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[131].x, _940);
    float _960 = fma(_952, _950, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _962 = _856 * _956;
    float _964 = fma(_946, _908, _958);
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _968 = fma(_960, _962, _964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _972 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _976 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[134].x, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _976 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _972;
    out.m_61.y = _978;
    out.m_61.z = _980;
    out.m_61.w = _982;
    bool _984 = !_896;
    float _1002;
    if (!_984)
    {
        float _986 = in.m_55.x;
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _990 = _986 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        float _1006 = float(_112);
        float _1008 = 1.0 / _1006;
        float _1010 = _144 * _1008;
        _1002 = _1010;
    }
    _1004 = false;
    float _1012 = _1002;
    float _1014 = in.m_55.w;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1018 = _1012 + _1016;
    float _1020 = in.m_63.y;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1024 = _1022 != 0;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1028 = _1012 + _1026;
    float _1030 = in.m_55.z;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1032;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1038 = _1036 != 0;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = in.m_55.y;
    float _1046 = 1.0 / _1034;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1054 = _1012 + _1052;
    float _1056 = in.m_55.x;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1060 = _1058 != 0;
    float _1062 = 1.0 / _1042;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1072 = _1014 > 0.5;
    float _1074 = in.m_48.x;
    float _1076 = in.m_48.y;
    float _1078 = in.m_48.z;
    float _1080 = -_1020;
    float _1082 = _1080 + 1.0;
    float _1084 = 1.0 / _1070;
    bool _1086 = _1030 > 0.5;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1092 = _1044 > 0.5;
    float _1094 = 1.0 / _1066;
    int _1096 = _1086 ? as_type<int>(_1082) : as_type<int>(_1020);
    float _1098 = _1018 * _1062;
    int _1100 = _1092 ? as_type<int>(_1082) : as_type<int>(_1020);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1104 = _1012 + _1102;
    float _1106 = _1024 ? as_type<float>(_1096) : _1020;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1110 = _1038 ? as_type<float>(_1100) : _1020;
    float _1112 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1124 = _1122 != 0;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1126;
    float _1130 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1132 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1136 = 1.0 / _1120;
    float _1138 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1140 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1134);
    float _1144 = -_1090;
    float _1146 = fma(_1112, 2.0, _1144);
    float _1148 = _1020;
    bool _1150 = _1060;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1154 = _1044;
    if (_1060)
    {
        float _1156 = _1072 ? _1082 : _1020;
        _1148 = _1156;
    }
    float _1158 = _1148;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1162 = _1012 + _1160;
    float _1164 = 1.0 / _1128;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1166;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1172 = _1170 != 0;
    float _1174 = _1162 * _1046;
    float _1176 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1178;
    float _1182 = 1.0 / _1168;
    float _1184 = _1104 * _1136;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1050)
    {
        bool _1190 = _1056 > 0.5;
        _1150 = _1190;
    }
    bool _1192 = _1150;
    float _1194 = fma(_1176, -2.0, _1088);
    if (_1172)
    {
        _1152 = _1056;
    }
    float _1196 = _1152;
    float _1198 = _1028 * _1164;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1202 = _1196;
    if (!_1172)
    {
        _1202 = _1030;
    }
    float _1204 = _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1208 = _1012 + _1206;
    float _1210 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1188);
    float _1216 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1200);
    float _1218 = _1208 * _1182;
    float _1220 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    if (!_1172)
    {
        _1154 = _1056;
    }
    float _1222 = _1154;
    float _1224 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1226 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1142);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1232 = _1012 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1242 = _1232 * _1094;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1252;
    float _1256 = fma(_1236, _1098, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1258 = fma(_1240, _1098, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1260 = fma(_1246, _1242, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1262 = _1054 * _1084;
    float _1264 = fma(_1254, _1242, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1274;
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1292 = fma(_1268, _1262, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1294 = fma(_1272, _1262, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _1296 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1298 = isnan(_1012);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1286, _1184, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1310 = fma(_1290, _1184, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1312 = fma(_1276, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1314 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1316 = isnan(_1012);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = fma(_1282, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1328 = -_1306;
    float _1330 = _1328 + 1.0;
    float _1332 = fma(_1180, _1174, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1334 = fma(_1250, _1174, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1336 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1338 = isnan(_1012);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = in.m_63.x;
    float _1350 = -_1324;
    float _1352 = _1350 + 1.0;
    float _1354 = _1324 * _1330;
    float _1356 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1358 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1360 = isnan(_1012);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1372 = _1346 * _1352;
    float _1374 = -_1346;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1356, _1110, -0.5);
    bool _1380 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1382 = isnan(_1012);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1388 = _1384 || _1386;
    float _1390 = float(_1388);
    float _1392 = -_1368;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_1106, _1370, -0.5);
    float _1398 = _1368 * _1376;
    bool _1400 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1402 = isnan(_1012);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1390 * _1394;
    bool _1414 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1416 = isnan(_1012);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1194);
    bool _1428 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1430 = isnan(_1012);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = -_1390;
    float _1442 = _1440 + 1.0;
    float _1444 = -_1424;
    float _1446 = _1444 + 1.0;
    float _1448 = _1438 * _1442;
    float _1450 = -_1438;
    float _1452 = _1450 + 1.0;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1458;
    float _1462 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1210);
    float _1464 = fma(_1456, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1466 = fma(_1460, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1468 = -_1426;
    float _1470 = fma(_1462, _1378, _1468);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1474 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1476 = as_type<int>(_1460);
    float _1478 = _1276;
    float _1480 = _1222;
    float _1482 = _1348;
    float _1484 = _1448;
    if (_1050)
    {
        float _1486 = -_1348;
        float _1488 = _1486 + 1.0;
        _1476 = as_type<int>(_1488);
    }
    int _1490 = _1476;
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1494 = _1410 * _1446;
    int _1496 = _1490;
    if (!_1050)
    {
        _1478 = _1348;
    }
    float _1498 = _1478;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1502 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1504 = _1498;
    if (_1050)
    {
        float _1506 = _1192 ? as_type<float>(_1490) : _1348;
        _1504 = _1506;
    }
    float _1508 = _1504;
    if (_1116)
    {
        float _1510 = -_1348;
        float _1512 = _1510 + 1.0;
        _1496 = as_type<int>(_1512);
    }
    int _1514 = _1496;
    float _1516 = _1332 * _1494;
    float _1518 = _1334 * _1494;
    float _1520 = -_1410;
    float _1522 = _1520 + 1.0;
    float _1524 = -_1500;
    float _1526 = fma(_1474, 2.0, _1524);
    float _1528 = fma(_1502, -2.0, _1472);
    if (!_1116)
    {
        _1480 = _1348;
    }
    float _1530 = _1480;
    float _1532 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1518);
    float _1534 = _1530;
    if (_1116)
    {
        float _1536 = _1086 ? as_type<float>(_1514) : _1348;
        _1534 = _1536;
    }
    float _1538 = _1534;
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1516);
    float _1542 = -_144;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1146);
    float _1546 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1214);
    float _1548 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1216);
    float _1550 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1220);
    float _1552 = -_144;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1526);
    float _1556 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1528);
    float _1558 = _1226 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1560 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1562 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1558 + _1566;
    float _1570 = _1424 * _1452;
    float _1572 = fma(_1560, _1508, -0.5);
    float _1574 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1578 = _1562 + _1576;
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1582 = fma(_1258, _1570, _1532);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1574 + _1584;
    int _1588 = 0;
    float _1590 = _1558;
    if (_1124)
    {
        float _1592 = -_1348;
        float _1594 = _1592 + 1.0;
        _1588 = as_type<int>(_1594);
    }
    int _1596 = _1588;
    float _1598 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1580);
    float _1600 = fma(_1256, _1570, _1540);
    float _1602 = fma(_1264, _1448, _1582);
    float _1604 = fma(_1546, _1572, _1544);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1598);
    float _1608 = fma(_1260, _1448, _1600);
    float _1610 = _1568 * _1568;
    if (_1124)
    {
        float _1612 = _1092 ? as_type<float>(_1596) : _1348;
        _1482 = _1612;
    }
    float _1614 = _1482;
    float _1616 = in.m_65.w;
    bool _1618 = _1606 >= 0.0;
    float _1620 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1622 = fma(_1292, _1412, _1608);
    float _1624 = fma(_1294, _1412, _1602);
    float _1626 = fma(_1578, _1578, _1610);
    float _1628 = fma(_1620, _1614, -0.5);
    float _1630 = fma(_1312, _1398, _1622);
    float _1632 = fma(_1326, _1398, _1624);
    float _1634 = fma(_1586, _1586, _1626);
    float _1636 = fma(_1548, _1628, _1554);
    float _1638 = fma(_1308, _1372, _1630);
    float _1640 = fma(_1310, _1372, _1632);
    float _1642 = rsqrt(_1634);
    float _1644 = -_1556;
    float _1646 = fma(_1550, _1396, _1644);
    if (_1618)
    {
        _1484 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1648 = _1484;
    float _1650 = fma(_1464, _1354, _1638);
    float _1652 = fma(_1466, _1354, _1640);
    float _1654 = _1646 + 0.5;
    float _1656 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1658 = _1470 + 0.5;
    float _1660 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1662 = _1636 + 0.5;
    float _1664 = _1604 + 0.5;
    int _1666 = as_type<int>(_1648);
    if (_1618)
    {
        float _1668 = _1648 * 5.0;
        _1666 = as_type<int>(_1668);
    }
    int _1670 = _1666;
    float _1672 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1650);
    float _1674 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1652);
    out.m_67.w = _1616;
    float _1676 = _1568 * _1642;
    float _1678 = _1578 * _1642;
    out.m_69.x = _1664;
    out.m_69.y = _1658;
    out.m_69.z = _1660;
    out.m_69.w = _1656;
    out.m_71.x = _1662;
    out.m_71.y = _1654;
    if (_1618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5844 = as_type<float>(_1670);
        out.gl_Position.z = _5844;
    }
    out.m_73.x = _1672;
    out.m_73.y = _1674;
    if (_1618)
    {
        out.m_51.x = 0.0;
    }
    if (_1618)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1680 = -_1676;
    float _1682 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1558);
    float _1684 = _1586 * _1642;
    float _1686 = -_1678;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1692 = _1682 + _1690;
    float _1694 = -_1684;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1700 = _1688 + _1698;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1696 + _1704;
    float _1708 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1702);
    float _1710 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1708);
    bool _1712 = _1710 >= 0.0;
    float _1714 = _1706;
    if (_1712)
    {
        _1714 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1716 = _1714;
    int _1718 = as_type<int>(_1716);
    if (_1712)
    {
        out.m_51.x = 0.0;
    }
    if (_1712)
    {
        float _1720 = _1716 * 5.0;
        _1718 = as_type<int>(_1720);
    }
    int _1722 = _1718;
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5943 = as_type<float>(_1722);
        out.gl_Position.z = _5943;
    }
    if (_1712)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1724 = -_1558;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = -_1562;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1732 = -_1574;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = -_1676;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _1740 = _1726 * _1726;
    float _1742 = -_1678;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1746 = -_1684;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1586);
    float _1750 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1752 = fma(_1730, _1730, _1740);
    float _1754 = fma(_1734, _1734, _1752);
    float _1756 = _1738 * _1738;
    float _1758 = fma(_1744, _1744, _1756);
    float _1760 = rsqrt(_1754);
    float _1762 = fma(_1748, _1748, _1758);
    float _1764 = sqrt(_1762);
    float _1766 = _1730 * _1760;
    float _1768 = _1734 * _1760;
    float _1770 = _1726 * _1760;
    float _1772 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1776 = _1766 * _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = _1768 * _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1784 = _1770 * _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1788 = -_1776;
    float _1790 = fma(_1768, _1786, _1788);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = -_1780;
    float _1796 = fma(_1770, _1792, _1794);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = -_1784;
    float _1802 = fma(_1766, _1798, _1800);
    float _1804 = _1642 * _1764;
    float _1806 = _1790 * _1790;
    float _1808 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1810 = _1804 * _1772;
    float _1812 = fma(_1796, _1796, _1806);
    float _1814 = _1804 * _1750;
    float _1816 = in.m_75.x;
    float _1818 = in.m_75.y;
    float _1820 = in.m_75.z;
    float _1822 = _1804 * _1808;
    float _1824 = fma(_1802, _1802, _1812);
    float _1826 = rsqrt(_1824);
    float _1828 = _1790 * _1826;
    float _1830 = _1796 * _1826;
    float _1832 = _1802 * _1826;
    float _1834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1818);
    float _1836 = _1768 * _1828;
    float _1838 = _1770 * _1830;
    float _1840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1816);
    float _1842 = _1814 * _1834;
    float _1844 = -_1836;
    float _1846 = fma(_1770, _1832, _1844);
    float _1848 = -_1838;
    float _1850 = fma(_1766, _1828, _1848);
    float _1852 = _1822 * _1840;
    float _1854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1820);
    float _1856 = _1842 * _1846;
    float _1858 = _1842 * _1850;
    bool _1860 = _1818 != 0.0;
    bool _1862 = isnan(_1818);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = _1810 * _1854;
    float _1872 = fma(_1852, _1830, _1856);
    float _1874 = fma(_1852, _1832, _1858);
    bool _1876 = _1816 == 0.0;
    bool _1878 = !_1868;
    bool _1880 = _1876 && _1878;
    float _1882 = fma(_1870, _1766, _1872);
    float _1884 = fma(_1870, _1768, _1874);
    bool _1886 = _1820 == 0.0;
    bool _1888 = _1886 && _1880;
    float _1890 = _1562 + _1882;
    float _1892 = _1574 + _1884;
    float _1894 = _1766 * _1832;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1898 = _1890 + _1896;
    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1902 = _1892 + _1900;
    float _1904 = -_1894;
    float _1906 = fma(_1768, _1830, _1904);
    float _1908 = _1898 * _1898;
    float _1910 = _1902 * _1902;
    float _1912 = in.m_77.x;
    float _1914 = in.m_77.y;
    float _1916 = in.m_77.z;
    float _1918 = _1842 * _1906;
    float _1920 = _1908 + _1910;
    float _1922 = fma(_1852, _1828, _1918);
    float _1924 = sqrt(_1920);
    float _1926 = fma(_1870, _1770, _1922);
    float _1928 = _1558 + _1926;
    bool _1930 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1932 = _1842;
    float _1934 = _1926;
    float _1936 = _1890;
    float _1938 = _1908;
    float _1940 = _1768;
    float _1942 = _1832;
    if (!_1930)
    {
        _1590 = _1890;
    }
    float _1944 = _1590;
    float _1946 = _1944;
    if (!_1930)
    {
        _1932 = _1910;
    }
    float _1948 = _1932;
    float _1950 = _1948;
    if (!_1930)
    {
        _1934 = _1892;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (!_1930)
    {
        _1936 = _1928;
    }
    float _1956 = _1936;
    bool _1958 = !_1930;
    float _1960 = _1956;
    float _1962 = _1914;
    float _1964 = _1912;
    float _1966 = _1916;
    if (!_1958)
    {
        float _1968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1972 = _1924 + _1970;
        float _1974 = rsqrt(_1920);
        float _1976 = _1972 * _1968;
        float _1978 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = _1976 * 0.15915493667125701904296875;
        float _1982 = _1980 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = _1980 * 6.283185482025146484375;
        float _1988 = cos(_1986);
        float _1990 = fma(_1984, _1978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1992 = _1974 * _1990;
        float _1994 = _1988 + (-1.0);
        float _1996 = fma(_1898, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1998 = fma(_1902, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2000 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2004 = _1996 + _2002;
        float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2008 = _1998 + _2006;
        float _2010 = fma(_1928, _1988, _2000);
        float _2012 = _2004 * _2004;
        float _2014 = _2008 * _2008;
        _1960 = _2010;
        _1938 = _2012;
        _1950 = _2014;
        _1946 = _1996;
        _1954 = _1998;
    }
    float _2016 = _1960;
    float _2018 = _1938;
    float _2020 = _1950;
    float _2022 = _1946;
    float _2024 = _1954;
    float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2028 = _2016 + _2026;
    if (!_1888)
    {
        float _2030 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1914);
        _1962 = _2030;
    }
    float _2032 = _1962;
    if (!_1888)
    {
        float _2034 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1912);
        _1964 = _2034;
    }
    float _2036 = _1964;
    float _2038 = _2036;
    if (!_1888)
    {
        float _2040 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1916);
        _1966 = _2040;
    }
    float _2042 = _1966;
    float _2044 = fma(_2028, _2028, _2018);
    float _2046 = _1846 * _2032;
    float _2048 = _1906 * _2032;
    float _2050 = _1850 * _2032;
    float _2052 = _2044 + _2020;
    float _2054 = fma(_1830, _2036, _2046);
    float _2056 = fma(_1828, _2036, _2048);
    float _2058 = fma(_1832, _2036, _2050);
    float _2060 = fma(_1766, _2042, _2054);
    float _2062 = sqrt(_2052);
    float _2064 = fma(_1770, _2042, _2056);
    float _2066 = fma(_1768, _2042, _2058);
    out.m_79.x = _2060;
    out.m_79.y = _2064;
    out.m_79.z = _2066;
    bool _2068 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2070 = isnan(_2062);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2076 = _2072 || _2074;
    float _2078 = _2056;
    float _2080 = _2050;
    if (!_2076)
    {
        _2078 = 1.0;
    }
    float _2082 = _2078;
    bool _2084 = !_2076;
    float _2086 = _2082;
    if (!_2084)
    {
        bool _2088 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2090 = isnan(_2062);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2100 = _2062 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2104 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2102;
            float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2110 = 1.0 / _2104;
            float _2112 = _2100 * _2110;
            float _2114 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2086 = _2114;
            _1940 = _2110;
            _2116 = true;
        }
        else
        {
            bool _2118 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2120 = isnan(_2062);
            bool _2122 = _2118 || _2120;
            bool _2124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2126 = _2122 || _2124;
            if (!_2126)
            {
                float _2128 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2130 = _2062 + _2128;
                float _2132 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2134 = _2132 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2138 = _2136 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2140 = 1.0 / _2134;
                float _2142 = _2130 * _2140;
                float _2144 = fma(_2142, _2138, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2086 = _2144;
                _1940 = _2140;
                _2116 = true;
            }
            else
            {
                _2086 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2116 = false;
    float _2146 = _2086;
    float _2148 = _1940;
    float _2150 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2152 = _2016 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2156 = _2022 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2160 = _2024 + _2158;
    float _2162 = fma(_2152, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2164 = fma(_2156, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2166 = fma(_2160, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2168 = -_1676;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2162);
    float _2172 = -_1678;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2164);
    float _2176 = -_1684;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2166);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2182 = _2170 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2186 = _2174 + _2184;
    float _2188 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2190 = _2178 + _2188;
    float _2192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2194 = _2182 * _2182;
    float _2196 = fma(_2186, _2186, _2194);
    float _2198 = fma(_2190, _2190, _2196);
    float _2200 = rsqrt(_2198);
    float _2202 = sqrt(_2198);
    float _2204 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2206 = _2186 * _2204;
    float _2208 = _2190 * _2204;
    float _2210 = _2206 * _2206;
    float _2212 = _2208 * _2208;
    float _2214 = _2210 + _2212;
    float _2216 = sqrt(_2214);
    bool _2218 = _2216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2222 = _2216 + _2220;
    float _2224 = _2196;
    float _2226 = _2164;
    float _2228 = _2222;
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2232 = _2214;
    if (_2218)
    {
        float _2234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2224 = _2234;
    }
    float _2236 = _2224;
    if (_2218)
    {
        float _2238 = rsqrt(_2214);
        _2226 = _2238;
    }
    float _2240 = _2226;
    float _2242 = _2240;
    if (_2218)
    {
        float _2244 = _2222 * _2236;
        _2228 = _2244;
    }
    float _2246 = _2228;
    if (_2218)
    {
        float _2248 = _2246 * 0.15915493667125701904296875;
        _2080 = _2248;
    }
    float _2250 = _2080;
    float _2252 = _2236;
    float _2254 = _2250;
    if (_2218)
    {
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        _2252 = _2258;
    }
    float _2260 = _2252;
    float _2262 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2264 = precise::max(0.0, _2262);
    float _2266 = _2148;
    if (_2218)
    {
        float _2268 = _2250 * 6.283185482025146484375;
        float _2270 = cos(_2268);
        _2266 = _2270;
    }
    float _2272 = _2266;
    float _2274 = -_2204;
    float _2276 = -_2264;
    float _2278 = fma(_2182, _2274, _2276);
    float _2280 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2218)
    {
        float _2282 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _2282;
    }
    float _2284 = _1942;
    float _2286 = _2284;
    if (!_2218)
    {
        _2254 = _2278;
    }
    float _2288 = _2254;
    float _2290 = _2288;
    if (_2218)
    {
        float _2292 = fma(_2260, _2284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2038 = _2292;
    }
    float _2294 = _2038;
    float _2296 = floor(_2280);
    float _2298 = _2294;
    float _2300 = _2272;
    if (_2218)
    {
        float _2302 = _2272 + (-1.0);
        _2286 = _2302;
    }
    float _2304 = _2286;
    float _2306 = _2304;
    if (_2218)
    {
        float _2308 = _2240 * _2294;
        _2230 = _2308;
    }
    float _2310 = _2230;
    if (!_2218)
    {
        _2242 = _2206;
    }
    float _2312 = _2242;
    float _2314 = _2312;
    if (_2218)
    {
        float _2316 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2232 = _2316;
    }
    float _2318 = _2232;
    if (_2218)
    {
        float _2320 = _2206 * _2310;
        _2314 = _2320;
    }
    float _2322 = _2314;
    if (!_2218)
    {
        _2298 = _2208;
    }
    float _2324 = _2298;
    float _2326 = _2324;
    if (_2218)
    {
        float _2328 = _2208 * _2310;
        _2326 = _2328;
    }
    float _2330 = _2326;
    if (!_2218)
    {
        _2306 = _2210;
    }
    float _2332 = _2306;
    float _2334 = _2332;
    if (_2218)
    {
        float _2336 = fma(_2278, _2272, _2318);
        _2290 = _2336;
    }
    float _2338 = _2290;
    if (_2218)
    {
        float _2340 = _2322 * _2322;
        _2334 = _2340;
    }
    float _2342 = _2334;
    if (!_2218)
    {
        _2300 = _2212;
    }
    float _2344 = _2300;
    float _2346 = _2344;
    if (_2218)
    {
        float _2348 = _2330 * _2330;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = fma(_2338, _2338, _2342);
    float _2354 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2358 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2360 = _2352 + _2350;
    float _2362 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2364 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2366 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2356);
    float _2368 = rsqrt(_2360);
    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2372 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2370);
    float _2374 = precise::clamp(_2372, 0.0, 1.0);
    float _2376 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2378 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2358);
    float _2380 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2366);
    float _2382 = -_2374;
    float _2384 = _2382 + 1.0;
    float _2386 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2388 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2390 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2392 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2378);
    float _2394 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2386);
    float _2396 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2398 = abs(_2384);
    float _2400 = log2(_2398);
    float _2402 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2404 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2394);
    float _2406 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2396);
    float _2408 = _2368 * _2322;
    float _2410 = _2368 * _2338;
    float _2412 = _2404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2414 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2406);
    float _2416 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2418 = _2368 * _2330;
    float _2420 = floor(_2362);
    float _2422 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2414);
    float _2424 = -_2416;
    float _2426 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2424);
    float _2428 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2430 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = -_2418;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2426);
    float _2436 = -_2428;
    float _2438 = fma(_2436, _2192, 1.0);
    float _2440 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2442 = exp2(_2430);
    float _2444 = fma(_2434, -0.5, 0.5);
    float _2446 = fma(_2434, 0.5, 0.5);
    float _2448 = -_2420;
    float _2450 = _2362 + _2448;
    float _2452 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2440);
    float _2454 = log2(_2438);
    float _2456 = fma(_2446, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2458 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2452);
    float _2460 = fma(_2446, _2456, -0.212114393711090087890625);
    float _2462 = 1.0 / _2422;
    float _2464 = -_2296;
    float _2466 = _2280 + _2464;
    float _2468 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2470 = fma(_2446, _2460, 1.570728778839111328125);
    float _2472 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2468);
    float _2474 = _2410 + 1.0;
    float _2476 = sqrt(_2444);
    float _2478 = _2454 * 0.693147182464599609375;
    float _2480 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2472);
    float _2482 = -_2410;
    float _2484 = fma(_2442, _2474, _2482);
    float _2486 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2488 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2480);
    float _2490 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2458);
    float _2492 = _2488 * _2462;
    float _2494 = _2490 * _2462;
    float _2496 = fma(_2492, 0.5, 0.5);
    float _2498 = fma(_2494, -0.5, 0.5);
    float _2500 = _2476 * 0.636619746685028076171875;
    float _2502 = fma(_2484, 0.5, 0.5);
    float _2504 = -_2470;
    float _2506 = fma(_2500, _2504, 1.0);
    float2 _7228 = float2(_2466, _2450);
    float _2508 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7228, float2(0.0), isnan(_7228)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7228, float2(0.0), isnan(_7228)), level(0.0)).x;
    float3 _7239 = float3(_2496, _2498, _2486);
    float _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7239, float3(0.0), isnan(_7239)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7239, float3(0.0), isnan(_7239)), level(0.0)).x;
    float3 _7250 = float3(_2496, _2498, _2486);
    float4 _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7250, float3(0.0), isnan(_7250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7250, float3(0.0), isnan(_7250)), level(0.0)).xyzw;
    float _2515 = _2513.x;
    float _2517 = _2513.y;
    float _2519 = _2513.z;
    float _2521 = _2513.w;
    float2 _7266 = float2(_2506, _2502);
    float3 _2525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7266, float2(0.0), isnan(_7266)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7266, float2(0.0), isnan(_7266)), level(0.0)).xyz;
    float _2527 = _2525.x;
    float _2529 = _2525.y;
    float _2531 = _2525.z;
    float _2533 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2535 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_81.x = _2186;
    out.m_81.y = _2182;
    out.m_81.z = _2190;
    float _2537 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2533);
    float _2539 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2541 = exp2(_2535);
    float _2543 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2537);
    float _2545 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2539);
    float _2547 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2549 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2545);
    float _2551 = _2488 + _2422;
    float _2553 = 1.0 / _2547;
    float _2555 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2557 = _2551 * 0.5;
    float _2559 = _2555 + _2547;
    float _2561 = _2559 * _2553;
    float _2563 = _2561 * 0.5;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2567 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2565);
    float _2569 = 1.0 / _2567;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = _2569 * _2571;
    float _2575 = abs(_2573);
    float _2577 = log2(_2575);
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2581 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2583 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2581);
    float _2585 = exp2(_2579);
    float _2587 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2583);
    float _2589 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2591 = precise::clamp(_2589, 0.0, 1.0);
    float _2593 = fma(_2591, -2.0, 3.0);
    float _2595 = _2591 * _2591;
    float _2597 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2587);
    float _2599 = _2595 * _2593;
    bool _2601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    float _2611 = in.m_83.x;
    bool _2613 = _2573 <= 8000.0;
    bool _2615 = isnan(_2573);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan(8000.0);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = -_2599;
    float _2627 = _2625 + 1.0;
    float _2629 = _2597 + _2422;
    out.gl_Position.x = _2488;
    out.gl_Position.y = _2490;
    out.gl_Position.z = _2597;
    out.gl_Position.w = _2422;
    float _2631 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2599);
    float _2633 = _2422 * 0.5;
    float _2635 = _2629 * 0.5;
    float _2637 = _2623 * _2631;
    float _2639 = fma(_2490, -0.5, _2633);
    float _2641 = _2488;
    float _2643 = _2490;
    float _2645 = _2422;
    float _2647 = _2422;
    float _2649 = _2635;
    float _2651 = _2639;
    float _2653 = _2557;
    if (_2609)
    {
        _2641 = 1.0;
    }
    float _2655 = _2641;
    float _2657 = _2655;
    if (_2609)
    {
        _2643 = 1.0;
    }
    float _2659 = _2643;
    float _2661 = _2659;
    if (!_2609)
    {
        float _2663 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2665 = _2663 * 0.15915493667125701904296875;
        float _2667 = _2665 * 6.283185482025146484375;
        float _2669 = cos(_2667);
        float _2671 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2673 = _2671 * 0.15915493667125701904296875;
        float _2675 = _2665 * 6.283185482025146484375;
        float _2677 = sin(_2675);
        float _2679 = 1.0 / _2669;
        float _2681 = _2673 * 6.283185482025146484375;
        float _2683 = cos(_2681);
        float _2685 = _2677 * _2679;
        float _2687 = _2673 * 6.283185482025146484375;
        float _2689 = sin(_2687);
        float _2691 = _2683 * _2685;
        float _2693 = 1.0 / _2691;
        float _2695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2697 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2695;
        float _2699 = 1.0 / _2697;
        float _2701 = _2689 * _2693;
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = fma(_2573, _2701, _2703);
        float _2707 = _2705 * _2699;
        float _2709 = precise::clamp(_2707, 0.0, 1.0);
        _2661 = _2709;
        _2645 = _2697;
    }
    float _2711 = _2661;
    float _2713 = _2645;
    float _2715 = _2713;
    if (!_2609)
    {
        float _2717 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2719 = _2717 * 0.15915493667125701904296875;
        float _2721 = _2719 * 6.283185482025146484375;
        float _2723 = cos(_2721);
        float _2725 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2727 = _2725 * 0.15915493667125701904296875;
        float _2729 = _2719 * 6.283185482025146484375;
        float _2731 = sin(_2729);
        float _2733 = 1.0 / _2723;
        float _2735 = _2727 * 6.283185482025146484375;
        float _2737 = cos(_2735);
        float _2739 = _2731 * _2733;
        float _2741 = _2727 * 6.283185482025146484375;
        float _2743 = sin(_2741);
        float _2745 = _2737 * _2739;
        float _2747 = 1.0 / _2745;
        float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2751 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2749;
        float _2753 = 1.0 / _2751;
        float _2755 = _2743 * _2747;
        float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2759 = fma(_2573, _2755, _2757);
        float _2761 = _2759 * _2753;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = -_2763;
        float _2767 = _2765 + 1.0;
        _2657 = _2767;
        _2715 = _2753;
    }
    float _2769 = _2657;
    float _2771 = _2715;
    float _2773 = -_2541;
    float _2775 = _2773 + 1.0;
    float _2777 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2779 = -_2508;
    float _2781 = _2779 + 1.0;
    float _2783 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2785 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2787 = isnan(_2202);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2793 = _2789 || _2791;
    float _2795 = _2781 * _2777;
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = _2783 * _2510;
    float _2801 = -_2783;
    float _2803 = _2801 + 1.0;
    float _2805 = -_2797;
    float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2809 = _2711 * _2769;
    float _2811 = _2521 * _2799;
    float _2813 = _2531 * _2799;
    float _2815 = _2807 * _2611;
    float _2817 = _2521 * _2803;
    float _2819 = fma(_2527, _2811, _2515);
    float _2821 = fma(_2529, _2811, _2517);
    float _2823 = _2815 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2825 = fma(_2521, _2813, _2519);
    out.m_85.x = _2557;
    out.m_85.y = _2639;
    out.m_85.z = _2635;
    out.m_85.w = _2422;
    float _2827 = _2771;
    float _2829 = _2803;
    if (!_2793)
    {
        _2827 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2831 = _2827;
    float _2833 = _2809 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2835 = _2831;
    float _2837 = _2831;
    if (!_2793)
    {
        _2829 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2839 = _2829;
    out.m_87.x = _2823;
    out.m_89.x = _2819;
    out.m_89.y = _2821;
    out.m_89.z = _2825;
    out.m_89.w = _2817;
    float _2841 = _2839;
    float _2843 = _2839;
    if (!_2793)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2845 = _2647;
    float _2847 = _2845;
    float _2849 = _2845;
    if (!_2793)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2851 = _2649;
    float _2853 = _2851;
    float _2855 = _2851;
    if (!_2793)
    {
        _2651 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2857 = _2651;
    float _2859 = _2857;
    float _2861 = _2857;
    if (!_2793)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2863 = _2653;
    bool _2865 = !_2793;
    float _2867 = _2863;
    float _2869 = _2863;
    if (!_2865)
    {
        bool _2871 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2873 = isnan(_2202);
        bool _2875 = _2871 || _2873;
        bool _2877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2879 = _2875 || _2877;
        if (!_2879)
        {
            float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2883 = _2202 + _2881;
            float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2887 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2885;
            float _2889 = 1.0 / _2887;
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2911 = _2883 * _2889;
            float _2913 = precise::clamp(_2911, 0.0, 1.0);
            float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2919 = fma(_2913, _2893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2921 = fma(_2913, _2917, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2923 = fma(_2913, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2925 = fma(_2913, _2901, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2927 = fma(_2913, _2905, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2929 = fma(_2913, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2843 = _2921;
            _2861 = _2927;
            _2837 = _2919;
            _2855 = _2925;
            _2849 = _2923;
            _2869 = _2929;
            _2931 = true;
        }
        else
        {
            bool _2933 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2935 = isnan(_2202);
            bool _2937 = _2933 || _2935;
            bool _2939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2941 = _2937 || _2939;
            if (!_2941)
            {
                _2835 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2943 = _2835;
            _2837 = _2943;
            if (!_2941)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2945 = _2841;
            _2843 = _2945;
            if (!_2941)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2947 = _2847;
            _2849 = _2947;
            if (!_2941)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2949 = _2853;
            _2855 = _2949;
            if (!_2941)
            {
                _2859 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2951 = _2859;
            _2861 = _2951;
            if (!_2941)
            {
                _2867 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2953 = _2867;
            bool _2955 = !_2941;
            _2869 = _2953;
            if (!_2955)
            {
                bool _2957 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2959 = isnan(_2202);
                bool _2961 = _2957 || _2959;
                bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2965 = _2961 || _2963;
                if (!_2965)
                {
                    float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2969 = _2202 + _2967;
                    float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2973 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2971;
                    float _2975 = 1.0 / _2973;
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2997 = _2969 * _2975;
                    float _2999 = precise::clamp(_2997, 0.0, 1.0);
                    float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3005 = fma(_2999, _2979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3007 = fma(_2999, _3003, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3009 = fma(_2999, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3011 = fma(_2999, _2987, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3013 = fma(_2999, _2991, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3015 = fma(_2999, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2843 = _3007;
                    _2861 = _3013;
                    _2837 = _3005;
                    _2855 = _3011;
                    _2849 = _3009;
                    _2869 = _3015;
                    _2931 = true;
                }
                else
                {
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2861 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2837 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2869 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2931 = false;
    float _3017 = _2843;
    float _3019 = _2861;
    float _3021 = _2837;
    float _3023 = _2855;
    float _3025 = _2849;
    float _3027 = _2869;
    float _3029 = fma(_2064, -0.5, 0.5);
    float _3031 = precise::clamp(_3029, 0.0, 1.0);
    float _3033 = -_3017;
    float _3035 = _3033 + _3019;
    float _3037 = _2833 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3039 = -_3021;
    float _3041 = _3039 + _3023;
    float _3043 = fma(_3031, _3035, _3017);
    out.m_91.x = 0.0;
    float _3045 = -_3025;
    float _3047 = _3045 + _3027;
    float _3049 = fma(_3031, _3041, _3021);
    float _3051 = _3043 * 0.586610972881317138671875;
    out.m_51.x = _3037;
    bool _3053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3055 = fma(_3031, _3047, _3025);
    float _3057 = fma(_3049, 0.298911988735198974609375, _3051);
    bool _3059 = _2711 > 0.0;
    bool _3061 = isnan(_2711);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan(0.0);
    bool _3067 = _3063 || _3065;
    float _3069 = fma(_3055, 0.114477999508380889892578125, _3057);
    bool _3071 = _2769 <= 0.0;
    bool _3073 = !_3067;
    bool _3075 = _3071 || _3073;
    float _3077 = -_3069;
    float _3079 = _3049 + _3077;
    float _3081 = -_3069;
    float _3083 = _3043 + _3081;
    float _3085 = -_3069;
    float _3087 = _3055 + _3085;
    float _3089 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    float _3091 = fma(_3083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    float _3093 = fma(_3087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    bool _3095 = !_3053;
    if (!_3095)
    {
        float _3097 = -_2170;
        float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3101 = -_2174;
        float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3105 = -_2178;
        float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3109 = _3099 * _3099;
        float _3111 = fma(_3103, _3103, _3109);
        float _3113 = fma(_3107, _3107, _3111);
        float _3115 = sqrt(_3113);
        float _3117 = rsqrt(_3113);
        float _3119 = -_3115;
        float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3123 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3125 = precise::clamp(_3123, 0.0, 1.0);
        float _3127 = _3103 * _3117;
        float _3129 = _3099 * _3117;
        float _3131 = abs(_3125);
        float _3133 = log2(_3131);
        float _3135 = _3107 * _3117;
        float _3137 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3139 = _2064 * _3129;
        float _3141 = -_3129;
        float _3143 = -_3137;
        float _3145 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3143);
        float _3147 = fma(_2060, _3127, _3139);
        float _3149 = -_3135;
        float _3151 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3145);
        float _3153 = fma(_2066, _3135, _3147);
        float _3155 = precise::clamp(_3153, 0.0, 1.0);
        float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3159 = _3151 + _3157;
        float _3161 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        float _3167 = exp2(_3161);
        float _3169 = _3167 * _3165;
        float _3171 = _3155 * _3169;
        float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3175 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3177 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3173;
        out.m_91.y = _3175;
        out.m_91.z = _3177;
    }
    out.m_93.x = _3089;
    out.m_93.y = _3091;
    out.m_93.z = _3093;
    if (!_3075)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3179 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3179;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2931 = false;
    bool _2116 = false;
    bool _1004 = false;
    bool _824 = false;
    bool _644 = false;
    bool _518 = false;
    bool _188 = false;
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
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3235 = as_type<float>(_128);
        out.gl_Position.z = _3235;
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
    if (_140)
    {
        float _146 = float(_112);
        _122 = _146;
    }
    float _148 = _122;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_164);
        out.gl_Position.z = _3304;
    }
    if (_154)
    {
        return out;
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_112);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = 1.0 / _204;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _220;
    float _224 = 1.0 / _212;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _196 + _226;
    bool _230 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = isnan(_196);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    bool _242 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_196);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = 1.0 / _208;
    float _256 = _228 * _218;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _196 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _262;
    float _266 = fma(_264, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _268 = 1.0 / _216;
    float _270 = _260 * _224;
    bool _272 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _274 = isnan(_196);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _196 + _284;
    bool _288 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_196);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _302 = -_282;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _222;
    float _308 = _200 * _254;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = _196 + _310;
    bool _314 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_196);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_298;
    float _328 = _326 + 1.0;
    float _330 = _286 * _268;
    float _332 = _298 * _304;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = _324 * _328;
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_196);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = fma(_336, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = _312 * _306;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = _240 * _342;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = fma(_360, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _376 = fma(_366, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = -_240;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = _252 * _380;
    float _390 = -_252;
    float _392 = _390 + 1.0;
    float _394 = fma(_384, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _396 = _354 * _392;
    float _398 = -_354;
    float _400 = _398 + 1.0;
    float _402 = _376 * _396;
    float _404 = _356 * _396;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    float _410 = _266 * _396;
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _418 = fma(_408, _270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _422 = fma(_374, _388, _412);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _424;
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = fma(_416, _330, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = fma(_394, _388, _420);
    float _442 = fma(_418, _368, _422);
    float _444 = fma(_426, _270, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _446 = fma(_386, _388, _428);
    float _448 = fma(_432, _270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_438, _330, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _456 = fma(_444, _368, _446);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = fma(_452, _330, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _468 = fma(_448, _368, _440);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _470;
    float _474 = fma(_434, _338, _442);
    float _476 = fma(_460, _362, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _478 = fma(_464, _362, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _480 = fma(_472, _362, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _482 = fma(_454, _338, _468);
    float _484 = fma(_466, _338, _456);
    float _486 = fma(_476, _332, _474);
    float _488 = fma(_478, _332, _482);
    float _490 = fma(_480, _332, _484);
    float _492 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].x, _486);
    float _494 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].y, _488);
    float _496 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].z, _490);
    bool _498 = !_300;
    float _516;
    if (!_498)
    {
        float _500 = in.m_55.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_112);
        float _522 = 1.0 / _520;
        float _524 = _144 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_57.x;
    float _530 = in.m_57.y;
    float _532 = in.m_57.z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _526 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _538;
    bool _542 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _544 = isnan(_526);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _556 = 1.0 / _540;
    float _558 = _494 * _530;
    bool _560 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_526);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _536 * _556;
    float _574 = _496 * _532;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = -_570;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _588;
    float _592 = _552 * _582;
    float _594 = fma(_578, _572, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = fma(_586, _572, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _598 = fma(_590, _572, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _600 = -_552;
    float _602 = _600 + 1.0;
    float _604 = _594 * _592;
    float _606 = _596 * _592;
    float _608 = _598 * _592;
    float _610 = _492 * _528;
    float _612 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].y, _604);
    float _614 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].x, _606);
    float _616 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].z, _608);
    float _618 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].y, _612);
    float _620 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].x, _614);
    float _622 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].z, _616);
    bool _624 = !_554;
    float _642;
    if (!_624)
    {
        float _626 = in.m_55.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_112);
        float _648 = 1.0 / _646;
        float _650 = _144 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _652 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _666 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_652);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _682 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _684 = isnan(_652);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _660;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _696;
    float _700 = -_676;
    float _702 = _700 + 1.0;
    bool _704 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _706 = isnan(_652);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    bool _716 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _718 = 1.0 / _664;
    float _720 = 1.0 / _680;
    float _722 = _698 * _694;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _728 = _692 * _702;
    float _730 = -_692;
    float _732 = _730 + 1.0;
    float _734 = fma(_722, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _736;
    float _740 = _714 * _732;
    float _742 = _726 * _718;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _652 + _744;
    bool _748 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _750 = isnan(_652);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _734 * _740;
    float _762 = -_714;
    float _764 = _762 + 1.0;
    float _766 = fma(_742, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _770 = _652 + _768;
    float _772 = _738 * _720;
    float _774 = -_758;
    float _776 = _774 + 1.0;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[115].x, _760);
    float _780 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _782 = fma(_772, _770, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _784 = _676 * _776;
    float _786 = fma(_766, _728, _778);
    float _788 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = fma(_782, _784, _786);
    float _792 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _794 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[118].x, _790);
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _788;
    out.m_59.y = _798;
    out.m_59.z = _800;
    out.m_59.w = _802;
    bool _804 = !_716;
    float _822;
    if (!_804)
    {
        float _806 = in.m_55.x;
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _810 = _806 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _814 = _812 * _808;
        float _816 = floor(_814);
        float _818 = -_816;
        float _820 = _814 + _818;
        _822 = _820;
        _824 = true;
    }
    else
    {
        float _826 = float(_112);
        float _828 = 1.0 / _826;
        float _830 = _144 * _828;
        _822 = _830;
    }
    _824 = false;
    float _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _836 = _832 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _846 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _848 = isnan(_832);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _862 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = 1.0 / _840;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _876;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    bool _884 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _886 = isnan(_832);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _898 = 1.0 / _844;
    float _900 = 1.0 / _860;
    float _902 = _878 * _874;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _908 = _872 * _882;
    float _910 = -_872;
    float _912 = _910 + 1.0;
    float _914 = fma(_902, _836, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _916;
    float _920 = _894 * _912;
    float _922 = _906 * _898;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _926 = _832 + _924;
    bool _928 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _930 = isnan(_832);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _914 * _920;
    float _942 = -_894;
    float _944 = _942 + 1.0;
    float _946 = fma(_922, _926, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _950 = _832 + _948;
    float _952 = _918 * _900;
    float _954 = -_938;
    float _956 = _954 + 1.0;
    float _958 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[131].x, _940);
    float _960 = fma(_952, _950, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _962 = _856 * _956;
    float _964 = fma(_946, _908, _958);
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _968 = fma(_960, _962, _964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _972 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _976 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[134].x, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _976 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _972;
    out.m_61.y = _978;
    out.m_61.z = _980;
    out.m_61.w = _982;
    bool _984 = !_896;
    float _1002;
    if (!_984)
    {
        float _986 = in.m_55.x;
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _990 = _986 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        float _1006 = float(_112);
        float _1008 = 1.0 / _1006;
        float _1010 = _144 * _1008;
        _1002 = _1010;
    }
    _1004 = false;
    float _1012 = _1002;
    float _1014 = in.m_55.w;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1018 = _1012 + _1016;
    float _1020 = in.m_63.y;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1024 = _1022 != 0;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1028 = _1012 + _1026;
    float _1030 = in.m_55.z;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1032;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1038 = _1036 != 0;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = in.m_55.y;
    float _1046 = 1.0 / _1034;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1054 = _1012 + _1052;
    float _1056 = in.m_55.x;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1060 = _1058 != 0;
    float _1062 = 1.0 / _1042;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1072 = _1014 > 0.5;
    float _1074 = in.m_48.x;
    float _1076 = in.m_48.y;
    float _1078 = in.m_48.z;
    float _1080 = -_1020;
    float _1082 = _1080 + 1.0;
    float _1084 = 1.0 / _1070;
    bool _1086 = _1030 > 0.5;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1092 = _1044 > 0.5;
    float _1094 = 1.0 / _1066;
    int _1096 = _1086 ? as_type<int>(_1082) : as_type<int>(_1020);
    float _1098 = _1018 * _1062;
    int _1100 = _1092 ? as_type<int>(_1082) : as_type<int>(_1020);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1104 = _1012 + _1102;
    float _1106 = _1024 ? as_type<float>(_1096) : _1020;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1110 = _1038 ? as_type<float>(_1100) : _1020;
    float _1112 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1124 = _1122 != 0;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1126;
    float _1130 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1132 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1136 = 1.0 / _1120;
    float _1138 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1140 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1134);
    float _1144 = -_1090;
    float _1146 = fma(_1112, 2.0, _1144);
    float _1148 = _1020;
    bool _1150 = _1060;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1154 = _1044;
    if (_1060)
    {
        float _1156 = _1072 ? _1082 : _1020;
        _1148 = _1156;
    }
    float _1158 = _1148;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1162 = _1012 + _1160;
    float _1164 = 1.0 / _1128;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1166;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1172 = _1170 != 0;
    float _1174 = _1162 * _1046;
    float _1176 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1178;
    float _1182 = 1.0 / _1168;
    float _1184 = _1104 * _1136;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1050)
    {
        bool _1190 = _1056 > 0.5;
        _1150 = _1190;
    }
    bool _1192 = _1150;
    float _1194 = fma(_1176, -2.0, _1088);
    if (_1172)
    {
        _1152 = _1056;
    }
    float _1196 = _1152;
    float _1198 = _1028 * _1164;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1202 = _1196;
    if (!_1172)
    {
        _1202 = _1030;
    }
    float _1204 = _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1208 = _1012 + _1206;
    float _1210 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1188);
    float _1216 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1200);
    float _1218 = _1208 * _1182;
    float _1220 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    if (!_1172)
    {
        _1154 = _1056;
    }
    float _1222 = _1154;
    float _1224 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1226 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1142);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1232 = _1012 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1242 = _1232 * _1094;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1252;
    float _1256 = fma(_1236, _1098, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1258 = fma(_1240, _1098, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1260 = fma(_1246, _1242, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1262 = _1054 * _1084;
    float _1264 = fma(_1254, _1242, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1274;
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1292 = fma(_1268, _1262, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1294 = fma(_1272, _1262, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _1296 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1298 = isnan(_1012);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1286, _1184, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1310 = fma(_1290, _1184, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1312 = fma(_1276, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1314 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1316 = isnan(_1012);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = fma(_1282, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1328 = -_1306;
    float _1330 = _1328 + 1.0;
    float _1332 = fma(_1180, _1174, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1334 = fma(_1250, _1174, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1336 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1338 = isnan(_1012);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = in.m_63.x;
    float _1350 = -_1324;
    float _1352 = _1350 + 1.0;
    float _1354 = _1324 * _1330;
    float _1356 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1358 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1360 = isnan(_1012);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1372 = _1346 * _1352;
    float _1374 = -_1346;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1356, _1110, -0.5);
    bool _1380 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1382 = isnan(_1012);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1388 = _1384 || _1386;
    float _1390 = float(_1388);
    float _1392 = -_1368;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_1106, _1370, -0.5);
    float _1398 = _1368 * _1376;
    bool _1400 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1402 = isnan(_1012);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1390 * _1394;
    bool _1414 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1416 = isnan(_1012);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1194);
    bool _1428 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1430 = isnan(_1012);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = -_1390;
    float _1442 = _1440 + 1.0;
    float _1444 = -_1424;
    float _1446 = _1444 + 1.0;
    float _1448 = _1438 * _1442;
    float _1450 = -_1438;
    float _1452 = _1450 + 1.0;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1458;
    float _1462 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1210);
    float _1464 = fma(_1456, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1466 = fma(_1460, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1468 = -_1426;
    float _1470 = fma(_1462, _1378, _1468);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1474 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1476 = as_type<int>(_1460);
    float _1478 = _1276;
    float _1480 = _1222;
    float _1482 = _1348;
    float _1484 = _1448;
    if (_1050)
    {
        float _1486 = -_1348;
        float _1488 = _1486 + 1.0;
        _1476 = as_type<int>(_1488);
    }
    int _1490 = _1476;
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1494 = _1410 * _1446;
    int _1496 = _1490;
    if (!_1050)
    {
        _1478 = _1348;
    }
    float _1498 = _1478;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1502 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1504 = _1498;
    if (_1050)
    {
        float _1506 = _1192 ? as_type<float>(_1490) : _1348;
        _1504 = _1506;
    }
    float _1508 = _1504;
    if (_1116)
    {
        float _1510 = -_1348;
        float _1512 = _1510 + 1.0;
        _1496 = as_type<int>(_1512);
    }
    int _1514 = _1496;
    float _1516 = _1332 * _1494;
    float _1518 = _1334 * _1494;
    float _1520 = -_1410;
    float _1522 = _1520 + 1.0;
    float _1524 = -_1500;
    float _1526 = fma(_1474, 2.0, _1524);
    float _1528 = fma(_1502, -2.0, _1472);
    if (!_1116)
    {
        _1480 = _1348;
    }
    float _1530 = _1480;
    float _1532 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1518);
    float _1534 = _1530;
    if (_1116)
    {
        float _1536 = _1086 ? as_type<float>(_1514) : _1348;
        _1534 = _1536;
    }
    float _1538 = _1534;
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1516);
    float _1542 = -_144;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1146);
    float _1546 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1214);
    float _1548 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1216);
    float _1550 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1220);
    float _1552 = -_144;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1526);
    float _1556 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1528);
    float _1558 = _1226 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1560 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1562 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1558 + _1566;
    float _1570 = _1424 * _1452;
    float _1572 = fma(_1560, _1508, -0.5);
    float _1574 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1578 = _1562 + _1576;
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1582 = fma(_1258, _1570, _1532);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1574 + _1584;
    int _1588 = 0;
    float _1590 = _1558;
    if (_1124)
    {
        float _1592 = -_1348;
        float _1594 = _1592 + 1.0;
        _1588 = as_type<int>(_1594);
    }
    int _1596 = _1588;
    float _1598 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1580);
    float _1600 = fma(_1256, _1570, _1540);
    float _1602 = fma(_1264, _1448, _1582);
    float _1604 = fma(_1546, _1572, _1544);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1598);
    float _1608 = fma(_1260, _1448, _1600);
    float _1610 = _1568 * _1568;
    if (_1124)
    {
        float _1612 = _1092 ? as_type<float>(_1596) : _1348;
        _1482 = _1612;
    }
    float _1614 = _1482;
    float _1616 = in.m_65.w;
    bool _1618 = _1606 >= 0.0;
    float _1620 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1622 = fma(_1292, _1412, _1608);
    float _1624 = fma(_1294, _1412, _1602);
    float _1626 = fma(_1578, _1578, _1610);
    float _1628 = fma(_1620, _1614, -0.5);
    float _1630 = fma(_1312, _1398, _1622);
    float _1632 = fma(_1326, _1398, _1624);
    float _1634 = fma(_1586, _1586, _1626);
    float _1636 = fma(_1548, _1628, _1554);
    float _1638 = fma(_1308, _1372, _1630);
    float _1640 = fma(_1310, _1372, _1632);
    float _1642 = rsqrt(_1634);
    float _1644 = -_1556;
    float _1646 = fma(_1550, _1396, _1644);
    if (_1618)
    {
        _1484 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1648 = _1484;
    float _1650 = fma(_1464, _1354, _1638);
    float _1652 = fma(_1466, _1354, _1640);
    float _1654 = _1646 + 0.5;
    float _1656 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1658 = _1470 + 0.5;
    float _1660 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1662 = _1636 + 0.5;
    float _1664 = _1604 + 0.5;
    int _1666 = as_type<int>(_1648);
    if (_1618)
    {
        float _1668 = _1648 * 5.0;
        _1666 = as_type<int>(_1668);
    }
    int _1670 = _1666;
    float _1672 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1650);
    float _1674 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1652);
    out.m_67.w = _1616;
    float _1676 = _1568 * _1642;
    float _1678 = _1578 * _1642;
    out.m_69.x = _1664;
    out.m_69.y = _1658;
    out.m_69.z = _1660;
    out.m_69.w = _1656;
    out.m_71.x = _1662;
    out.m_71.y = _1654;
    if (_1618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5844 = as_type<float>(_1670);
        out.gl_Position.z = _5844;
    }
    out.m_73.x = _1672;
    out.m_73.y = _1674;
    if (_1618)
    {
        out.m_51.x = 0.0;
    }
    if (_1618)
    {
        return out;
    }
    float _1680 = -_1676;
    float _1682 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1558);
    float _1684 = _1586 * _1642;
    float _1686 = -_1678;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1692 = _1682 + _1690;
    float _1694 = -_1684;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1700 = _1688 + _1698;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1696 + _1704;
    float _1708 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1702);
    float _1710 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1708);
    bool _1712 = _1710 >= 0.0;
    float _1714 = _1706;
    if (_1712)
    {
        _1714 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1716 = _1714;
    int _1718 = as_type<int>(_1716);
    if (_1712)
    {
        out.m_51.x = 0.0;
    }
    if (_1712)
    {
        float _1720 = _1716 * 5.0;
        _1718 = as_type<int>(_1720);
    }
    int _1722 = _1718;
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5943 = as_type<float>(_1722);
        out.gl_Position.z = _5943;
    }
    if (_1712)
    {
        return out;
    }
    float _1724 = -_1558;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = -_1562;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1732 = -_1574;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = -_1676;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _1740 = _1726 * _1726;
    float _1742 = -_1678;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1746 = -_1684;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1586);
    float _1750 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1752 = fma(_1730, _1730, _1740);
    float _1754 = fma(_1734, _1734, _1752);
    float _1756 = _1738 * _1738;
    float _1758 = fma(_1744, _1744, _1756);
    float _1760 = rsqrt(_1754);
    float _1762 = fma(_1748, _1748, _1758);
    float _1764 = sqrt(_1762);
    float _1766 = _1730 * _1760;
    float _1768 = _1734 * _1760;
    float _1770 = _1726 * _1760;
    float _1772 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1776 = _1766 * _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = _1768 * _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1784 = _1770 * _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1788 = -_1776;
    float _1790 = fma(_1768, _1786, _1788);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = -_1780;
    float _1796 = fma(_1770, _1792, _1794);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = -_1784;
    float _1802 = fma(_1766, _1798, _1800);
    float _1804 = _1642 * _1764;
    float _1806 = _1790 * _1790;
    float _1808 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1810 = _1804 * _1772;
    float _1812 = fma(_1796, _1796, _1806);
    float _1814 = _1804 * _1750;
    float _1816 = in.m_75.x;
    float _1818 = in.m_75.y;
    float _1820 = in.m_75.z;
    float _1822 = _1804 * _1808;
    float _1824 = fma(_1802, _1802, _1812);
    float _1826 = rsqrt(_1824);
    float _1828 = _1790 * _1826;
    float _1830 = _1796 * _1826;
    float _1832 = _1802 * _1826;
    float _1834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1818);
    float _1836 = _1768 * _1828;
    float _1838 = _1770 * _1830;
    float _1840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1816);
    float _1842 = _1814 * _1834;
    float _1844 = -_1836;
    float _1846 = fma(_1770, _1832, _1844);
    float _1848 = -_1838;
    float _1850 = fma(_1766, _1828, _1848);
    float _1852 = _1822 * _1840;
    float _1854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1820);
    float _1856 = _1842 * _1846;
    float _1858 = _1842 * _1850;
    bool _1860 = _1818 != 0.0;
    bool _1862 = isnan(_1818);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = _1810 * _1854;
    float _1872 = fma(_1852, _1830, _1856);
    float _1874 = fma(_1852, _1832, _1858);
    bool _1876 = _1816 == 0.0;
    bool _1878 = !_1868;
    bool _1880 = _1876 && _1878;
    float _1882 = fma(_1870, _1766, _1872);
    float _1884 = fma(_1870, _1768, _1874);
    bool _1886 = _1820 == 0.0;
    bool _1888 = _1886 && _1880;
    float _1890 = _1562 + _1882;
    float _1892 = _1574 + _1884;
    float _1894 = _1766 * _1832;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1898 = _1890 + _1896;
    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1902 = _1892 + _1900;
    float _1904 = -_1894;
    float _1906 = fma(_1768, _1830, _1904);
    float _1908 = _1898 * _1898;
    float _1910 = _1902 * _1902;
    float _1912 = in.m_77.x;
    float _1914 = in.m_77.y;
    float _1916 = in.m_77.z;
    float _1918 = _1842 * _1906;
    float _1920 = _1908 + _1910;
    float _1922 = fma(_1852, _1828, _1918);
    float _1924 = sqrt(_1920);
    float _1926 = fma(_1870, _1770, _1922);
    float _1928 = _1558 + _1926;
    bool _1930 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1932 = _1842;
    float _1934 = _1926;
    float _1936 = _1890;
    float _1938 = _1908;
    float _1940 = _1768;
    float _1942 = _1832;
    if (!_1930)
    {
        _1590 = _1890;
    }
    float _1944 = _1590;
    float _1946 = _1944;
    if (!_1930)
    {
        _1932 = _1910;
    }
    float _1948 = _1932;
    float _1950 = _1948;
    if (!_1930)
    {
        _1934 = _1892;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (!_1930)
    {
        _1936 = _1928;
    }
    float _1956 = _1936;
    bool _1958 = !_1930;
    float _1960 = _1956;
    float _1962 = _1914;
    float _1964 = _1912;
    float _1966 = _1916;
    if (!_1958)
    {
        float _1968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1972 = _1924 + _1970;
        float _1974 = rsqrt(_1920);
        float _1976 = _1972 * _1968;
        float _1978 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = _1976 * 0.15915493667125701904296875;
        float _1982 = _1980 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = _1980 * 6.283185482025146484375;
        float _1988 = cos(_1986);
        float _1990 = fma(_1984, _1978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1992 = _1974 * _1990;
        float _1994 = _1988 + (-1.0);
        float _1996 = fma(_1898, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1998 = fma(_1902, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2000 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2004 = _1996 + _2002;
        float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2008 = _1998 + _2006;
        float _2010 = fma(_1928, _1988, _2000);
        float _2012 = _2004 * _2004;
        float _2014 = _2008 * _2008;
        _1960 = _2010;
        _1938 = _2012;
        _1950 = _2014;
        _1946 = _1996;
        _1954 = _1998;
    }
    float _2016 = _1960;
    float _2018 = _1938;
    float _2020 = _1950;
    float _2022 = _1946;
    float _2024 = _1954;
    float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2028 = _2016 + _2026;
    if (!_1888)
    {
        float _2030 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1914);
        _1962 = _2030;
    }
    float _2032 = _1962;
    if (!_1888)
    {
        float _2034 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1912);
        _1964 = _2034;
    }
    float _2036 = _1964;
    float _2038 = _2036;
    if (!_1888)
    {
        float _2040 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1916);
        _1966 = _2040;
    }
    float _2042 = _1966;
    float _2044 = fma(_2028, _2028, _2018);
    float _2046 = _1846 * _2032;
    float _2048 = _1906 * _2032;
    float _2050 = _1850 * _2032;
    float _2052 = _2044 + _2020;
    float _2054 = fma(_1830, _2036, _2046);
    float _2056 = fma(_1828, _2036, _2048);
    float _2058 = fma(_1832, _2036, _2050);
    float _2060 = fma(_1766, _2042, _2054);
    float _2062 = sqrt(_2052);
    float _2064 = fma(_1770, _2042, _2056);
    float _2066 = fma(_1768, _2042, _2058);
    out.m_79.x = _2060;
    out.m_79.y = _2064;
    out.m_79.z = _2066;
    bool _2068 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2070 = isnan(_2062);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2076 = _2072 || _2074;
    float _2078 = _2056;
    float _2080 = _2050;
    if (!_2076)
    {
        _2078 = 1.0;
    }
    float _2082 = _2078;
    bool _2084 = !_2076;
    float _2086 = _2082;
    if (!_2084)
    {
        bool _2088 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2090 = isnan(_2062);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2100 = _2062 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2104 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2102;
            float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2110 = 1.0 / _2104;
            float _2112 = _2100 * _2110;
            float _2114 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2086 = _2114;
            _1940 = _2110;
            _2116 = true;
        }
        else
        {
            bool _2118 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2120 = isnan(_2062);
            bool _2122 = _2118 || _2120;
            bool _2124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2126 = _2122 || _2124;
            if (!_2126)
            {
                float _2128 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2130 = _2062 + _2128;
                float _2132 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2134 = _2132 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2138 = _2136 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2140 = 1.0 / _2134;
                float _2142 = _2130 * _2140;
                float _2144 = fma(_2142, _2138, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2086 = _2144;
                _1940 = _2140;
                _2116 = true;
            }
            else
            {
                _2086 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2116 = false;
    float _2146 = _2086;
    float _2148 = _1940;
    float _2150 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2152 = _2016 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2156 = _2022 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2160 = _2024 + _2158;
    float _2162 = fma(_2152, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2164 = fma(_2156, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2166 = fma(_2160, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2168 = -_1676;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2162);
    float _2172 = -_1678;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2164);
    float _2176 = -_1684;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2166);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2182 = _2170 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2186 = _2174 + _2184;
    float _2188 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2190 = _2178 + _2188;
    float _2192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2194 = _2182 * _2182;
    float _2196 = fma(_2186, _2186, _2194);
    float _2198 = fma(_2190, _2190, _2196);
    float _2200 = rsqrt(_2198);
    float _2202 = sqrt(_2198);
    float _2204 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2206 = _2186 * _2204;
    float _2208 = _2190 * _2204;
    float _2210 = _2206 * _2206;
    float _2212 = _2208 * _2208;
    float _2214 = _2210 + _2212;
    float _2216 = sqrt(_2214);
    bool _2218 = _2216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2222 = _2216 + _2220;
    float _2224 = _2196;
    float _2226 = _2164;
    float _2228 = _2222;
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2232 = _2214;
    if (_2218)
    {
        float _2234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2224 = _2234;
    }
    float _2236 = _2224;
    if (_2218)
    {
        float _2238 = rsqrt(_2214);
        _2226 = _2238;
    }
    float _2240 = _2226;
    float _2242 = _2240;
    if (_2218)
    {
        float _2244 = _2222 * _2236;
        _2228 = _2244;
    }
    float _2246 = _2228;
    if (_2218)
    {
        float _2248 = _2246 * 0.15915493667125701904296875;
        _2080 = _2248;
    }
    float _2250 = _2080;
    float _2252 = _2236;
    float _2254 = _2250;
    if (_2218)
    {
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        _2252 = _2258;
    }
    float _2260 = _2252;
    float _2262 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2264 = precise::max(0.0, _2262);
    float _2266 = _2148;
    if (_2218)
    {
        float _2268 = _2250 * 6.283185482025146484375;
        float _2270 = cos(_2268);
        _2266 = _2270;
    }
    float _2272 = _2266;
    float _2274 = -_2204;
    float _2276 = -_2264;
    float _2278 = fma(_2182, _2274, _2276);
    float _2280 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2218)
    {
        float _2282 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _2282;
    }
    float _2284 = _1942;
    float _2286 = _2284;
    if (!_2218)
    {
        _2254 = _2278;
    }
    float _2288 = _2254;
    float _2290 = _2288;
    if (_2218)
    {
        float _2292 = fma(_2260, _2284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2038 = _2292;
    }
    float _2294 = _2038;
    float _2296 = floor(_2280);
    float _2298 = _2294;
    float _2300 = _2272;
    if (_2218)
    {
        float _2302 = _2272 + (-1.0);
        _2286 = _2302;
    }
    float _2304 = _2286;
    float _2306 = _2304;
    if (_2218)
    {
        float _2308 = _2240 * _2294;
        _2230 = _2308;
    }
    float _2310 = _2230;
    if (!_2218)
    {
        _2242 = _2206;
    }
    float _2312 = _2242;
    float _2314 = _2312;
    if (_2218)
    {
        float _2316 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2232 = _2316;
    }
    float _2318 = _2232;
    if (_2218)
    {
        float _2320 = _2206 * _2310;
        _2314 = _2320;
    }
    float _2322 = _2314;
    if (!_2218)
    {
        _2298 = _2208;
    }
    float _2324 = _2298;
    float _2326 = _2324;
    if (_2218)
    {
        float _2328 = _2208 * _2310;
        _2326 = _2328;
    }
    float _2330 = _2326;
    if (!_2218)
    {
        _2306 = _2210;
    }
    float _2332 = _2306;
    float _2334 = _2332;
    if (_2218)
    {
        float _2336 = fma(_2278, _2272, _2318);
        _2290 = _2336;
    }
    float _2338 = _2290;
    if (_2218)
    {
        float _2340 = _2322 * _2322;
        _2334 = _2340;
    }
    float _2342 = _2334;
    if (!_2218)
    {
        _2300 = _2212;
    }
    float _2344 = _2300;
    float _2346 = _2344;
    if (_2218)
    {
        float _2348 = _2330 * _2330;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = fma(_2338, _2338, _2342);
    float _2354 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2358 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2360 = _2352 + _2350;
    float _2362 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2364 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2366 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2356);
    float _2368 = rsqrt(_2360);
    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2372 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2370);
    float _2374 = precise::clamp(_2372, 0.0, 1.0);
    float _2376 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2378 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2358);
    float _2380 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2366);
    float _2382 = -_2374;
    float _2384 = _2382 + 1.0;
    float _2386 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2388 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2390 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2392 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2378);
    float _2394 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2386);
    float _2396 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2398 = abs(_2384);
    float _2400 = log2(_2398);
    float _2402 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2404 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2394);
    float _2406 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2396);
    float _2408 = _2368 * _2322;
    float _2410 = _2368 * _2338;
    float _2412 = _2404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2414 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2406);
    float _2416 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2418 = _2368 * _2330;
    float _2420 = floor(_2362);
    float _2422 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2414);
    float _2424 = -_2416;
    float _2426 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2424);
    float _2428 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2430 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = -_2418;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2426);
    float _2436 = -_2428;
    float _2438 = fma(_2436, _2192, 1.0);
    float _2440 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2442 = exp2(_2430);
    float _2444 = fma(_2434, -0.5, 0.5);
    float _2446 = fma(_2434, 0.5, 0.5);
    float _2448 = -_2420;
    float _2450 = _2362 + _2448;
    float _2452 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2440);
    float _2454 = log2(_2438);
    float _2456 = fma(_2446, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2458 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2452);
    float _2460 = fma(_2446, _2456, -0.212114393711090087890625);
    float _2462 = 1.0 / _2422;
    float _2464 = -_2296;
    float _2466 = _2280 + _2464;
    float _2468 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2470 = fma(_2446, _2460, 1.570728778839111328125);
    float _2472 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2468);
    float _2474 = _2410 + 1.0;
    float _2476 = sqrt(_2444);
    float _2478 = _2454 * 0.693147182464599609375;
    float _2480 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2472);
    float _2482 = -_2410;
    float _2484 = fma(_2442, _2474, _2482);
    float _2486 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2488 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2480);
    float _2490 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2458);
    float _2492 = _2488 * _2462;
    float _2494 = _2490 * _2462;
    float _2496 = fma(_2492, 0.5, 0.5);
    float _2498 = fma(_2494, -0.5, 0.5);
    float _2500 = _2476 * 0.636619746685028076171875;
    float _2502 = fma(_2484, 0.5, 0.5);
    float _2504 = -_2470;
    float _2506 = fma(_2500, _2504, 1.0);
    float2 _7228 = float2(_2466, _2450);
    float _2508 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7228, float2(0.0), isnan(_7228)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7228, float2(0.0), isnan(_7228)), level(0.0)).x;
    float3 _7239 = float3(_2496, _2498, _2486);
    float _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7239, float3(0.0), isnan(_7239)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7239, float3(0.0), isnan(_7239)), level(0.0)).x;
    float3 _7250 = float3(_2496, _2498, _2486);
    float4 _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7250, float3(0.0), isnan(_7250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7250, float3(0.0), isnan(_7250)), level(0.0)).xyzw;
    float _2515 = _2513.x;
    float _2517 = _2513.y;
    float _2519 = _2513.z;
    float _2521 = _2513.w;
    float2 _7266 = float2(_2506, _2502);
    float3 _2525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7266, float2(0.0), isnan(_7266)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7266, float2(0.0), isnan(_7266)), level(0.0)).xyz;
    float _2527 = _2525.x;
    float _2529 = _2525.y;
    float _2531 = _2525.z;
    float _2533 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2535 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_81.x = _2186;
    out.m_81.y = _2182;
    out.m_81.z = _2190;
    float _2537 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2533);
    float _2539 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2541 = exp2(_2535);
    float _2543 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2537);
    float _2545 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2539);
    float _2547 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2549 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2545);
    float _2551 = _2488 + _2422;
    float _2553 = 1.0 / _2547;
    float _2555 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2557 = _2551 * 0.5;
    float _2559 = _2555 + _2547;
    float _2561 = _2559 * _2553;
    float _2563 = _2561 * 0.5;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2567 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2565);
    float _2569 = 1.0 / _2567;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = _2569 * _2571;
    float _2575 = abs(_2573);
    float _2577 = log2(_2575);
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2581 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2583 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2581);
    float _2585 = exp2(_2579);
    float _2587 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2583);
    float _2589 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2591 = precise::clamp(_2589, 0.0, 1.0);
    float _2593 = fma(_2591, -2.0, 3.0);
    float _2595 = _2591 * _2591;
    float _2597 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2587);
    float _2599 = _2595 * _2593;
    bool _2601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    float _2611 = in.m_83.x;
    bool _2613 = _2573 <= 8000.0;
    bool _2615 = isnan(_2573);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan(8000.0);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = -_2599;
    float _2627 = _2625 + 1.0;
    float _2629 = _2597 + _2422;
    out.gl_Position.x = _2488;
    out.gl_Position.y = _2490;
    out.gl_Position.z = _2597;
    out.gl_Position.w = _2422;
    float _2631 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2599);
    float _2633 = _2422 * 0.5;
    float _2635 = _2629 * 0.5;
    float _2637 = _2623 * _2631;
    float _2639 = fma(_2490, -0.5, _2633);
    float _2641 = _2488;
    float _2643 = _2490;
    float _2645 = _2422;
    float _2647 = _2422;
    float _2649 = _2635;
    float _2651 = _2639;
    float _2653 = _2557;
    if (_2609)
    {
        _2641 = 1.0;
    }
    float _2655 = _2641;
    float _2657 = _2655;
    if (_2609)
    {
        _2643 = 1.0;
    }
    float _2659 = _2643;
    float _2661 = _2659;
    if (!_2609)
    {
        float _2663 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2665 = _2663 * 0.15915493667125701904296875;
        float _2667 = _2665 * 6.283185482025146484375;
        float _2669 = cos(_2667);
        float _2671 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2673 = _2671 * 0.15915493667125701904296875;
        float _2675 = _2665 * 6.283185482025146484375;
        float _2677 = sin(_2675);
        float _2679 = 1.0 / _2669;
        float _2681 = _2673 * 6.283185482025146484375;
        float _2683 = cos(_2681);
        float _2685 = _2677 * _2679;
        float _2687 = _2673 * 6.283185482025146484375;
        float _2689 = sin(_2687);
        float _2691 = _2683 * _2685;
        float _2693 = 1.0 / _2691;
        float _2695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2697 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2695;
        float _2699 = 1.0 / _2697;
        float _2701 = _2689 * _2693;
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = fma(_2573, _2701, _2703);
        float _2707 = _2705 * _2699;
        float _2709 = precise::clamp(_2707, 0.0, 1.0);
        _2661 = _2709;
        _2645 = _2697;
    }
    float _2711 = _2661;
    float _2713 = _2645;
    float _2715 = _2713;
    if (!_2609)
    {
        float _2717 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2719 = _2717 * 0.15915493667125701904296875;
        float _2721 = _2719 * 6.283185482025146484375;
        float _2723 = cos(_2721);
        float _2725 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2727 = _2725 * 0.15915493667125701904296875;
        float _2729 = _2719 * 6.283185482025146484375;
        float _2731 = sin(_2729);
        float _2733 = 1.0 / _2723;
        float _2735 = _2727 * 6.283185482025146484375;
        float _2737 = cos(_2735);
        float _2739 = _2731 * _2733;
        float _2741 = _2727 * 6.283185482025146484375;
        float _2743 = sin(_2741);
        float _2745 = _2737 * _2739;
        float _2747 = 1.0 / _2745;
        float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2751 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2749;
        float _2753 = 1.0 / _2751;
        float _2755 = _2743 * _2747;
        float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2759 = fma(_2573, _2755, _2757);
        float _2761 = _2759 * _2753;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = -_2763;
        float _2767 = _2765 + 1.0;
        _2657 = _2767;
        _2715 = _2753;
    }
    float _2769 = _2657;
    float _2771 = _2715;
    float _2773 = -_2541;
    float _2775 = _2773 + 1.0;
    float _2777 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2779 = -_2508;
    float _2781 = _2779 + 1.0;
    float _2783 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2785 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2787 = isnan(_2202);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2793 = _2789 || _2791;
    float _2795 = _2781 * _2777;
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = _2783 * _2510;
    float _2801 = -_2783;
    float _2803 = _2801 + 1.0;
    float _2805 = -_2797;
    float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2809 = _2711 * _2769;
    float _2811 = _2521 * _2799;
    float _2813 = _2531 * _2799;
    float _2815 = _2807 * _2611;
    float _2817 = _2521 * _2803;
    float _2819 = fma(_2527, _2811, _2515);
    float _2821 = fma(_2529, _2811, _2517);
    float _2823 = _2815 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2825 = fma(_2521, _2813, _2519);
    out.m_85.x = _2557;
    out.m_85.y = _2639;
    out.m_85.z = _2635;
    out.m_85.w = _2422;
    float _2827 = _2771;
    float _2829 = _2803;
    if (!_2793)
    {
        _2827 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2831 = _2827;
    float _2833 = _2809 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2835 = _2831;
    float _2837 = _2831;
    if (!_2793)
    {
        _2829 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2839 = _2829;
    out.m_87.x = _2823;
    out.m_89.x = _2819;
    out.m_89.y = _2821;
    out.m_89.z = _2825;
    out.m_89.w = _2817;
    float _2841 = _2839;
    float _2843 = _2839;
    if (!_2793)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2845 = _2647;
    float _2847 = _2845;
    float _2849 = _2845;
    if (!_2793)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2851 = _2649;
    float _2853 = _2851;
    float _2855 = _2851;
    if (!_2793)
    {
        _2651 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2857 = _2651;
    float _2859 = _2857;
    float _2861 = _2857;
    if (!_2793)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2863 = _2653;
    bool _2865 = !_2793;
    float _2867 = _2863;
    float _2869 = _2863;
    if (!_2865)
    {
        bool _2871 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2873 = isnan(_2202);
        bool _2875 = _2871 || _2873;
        bool _2877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2879 = _2875 || _2877;
        if (!_2879)
        {
            float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2883 = _2202 + _2881;
            float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2887 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2885;
            float _2889 = 1.0 / _2887;
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2911 = _2883 * _2889;
            float _2913 = precise::clamp(_2911, 0.0, 1.0);
            float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2919 = fma(_2913, _2893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2921 = fma(_2913, _2917, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2923 = fma(_2913, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2925 = fma(_2913, _2901, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2927 = fma(_2913, _2905, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2929 = fma(_2913, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2843 = _2921;
            _2861 = _2927;
            _2837 = _2919;
            _2855 = _2925;
            _2849 = _2923;
            _2869 = _2929;
            _2931 = true;
        }
        else
        {
            bool _2933 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2935 = isnan(_2202);
            bool _2937 = _2933 || _2935;
            bool _2939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2941 = _2937 || _2939;
            if (!_2941)
            {
                _2835 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2943 = _2835;
            _2837 = _2943;
            if (!_2941)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2945 = _2841;
            _2843 = _2945;
            if (!_2941)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2947 = _2847;
            _2849 = _2947;
            if (!_2941)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2949 = _2853;
            _2855 = _2949;
            if (!_2941)
            {
                _2859 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2951 = _2859;
            _2861 = _2951;
            if (!_2941)
            {
                _2867 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2953 = _2867;
            bool _2955 = !_2941;
            _2869 = _2953;
            if (!_2955)
            {
                bool _2957 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2959 = isnan(_2202);
                bool _2961 = _2957 || _2959;
                bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2965 = _2961 || _2963;
                if (!_2965)
                {
                    float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2969 = _2202 + _2967;
                    float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2973 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2971;
                    float _2975 = 1.0 / _2973;
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2997 = _2969 * _2975;
                    float _2999 = precise::clamp(_2997, 0.0, 1.0);
                    float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3005 = fma(_2999, _2979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3007 = fma(_2999, _3003, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3009 = fma(_2999, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3011 = fma(_2999, _2987, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3013 = fma(_2999, _2991, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3015 = fma(_2999, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2843 = _3007;
                    _2861 = _3013;
                    _2837 = _3005;
                    _2855 = _3011;
                    _2849 = _3009;
                    _2869 = _3015;
                    _2931 = true;
                }
                else
                {
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2861 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2837 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2869 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2931 = false;
    float _3017 = _2843;
    float _3019 = _2861;
    float _3021 = _2837;
    float _3023 = _2855;
    float _3025 = _2849;
    float _3027 = _2869;
    float _3029 = fma(_2064, -0.5, 0.5);
    float _3031 = precise::clamp(_3029, 0.0, 1.0);
    float _3033 = -_3017;
    float _3035 = _3033 + _3019;
    float _3037 = _2833 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3039 = -_3021;
    float _3041 = _3039 + _3023;
    float _3043 = fma(_3031, _3035, _3017);
    out.m_91.x = 0.0;
    float _3045 = -_3025;
    float _3047 = _3045 + _3027;
    float _3049 = fma(_3031, _3041, _3021);
    float _3051 = _3043 * 0.586610972881317138671875;
    out.m_51.x = _3037;
    bool _3053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3055 = fma(_3031, _3047, _3025);
    float _3057 = fma(_3049, 0.298911988735198974609375, _3051);
    bool _3059 = _2711 > 0.0;
    bool _3061 = isnan(_2711);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan(0.0);
    bool _3067 = _3063 || _3065;
    float _3069 = fma(_3055, 0.114477999508380889892578125, _3057);
    bool _3071 = _2769 <= 0.0;
    bool _3073 = !_3067;
    bool _3075 = _3071 || _3073;
    float _3077 = -_3069;
    float _3079 = _3049 + _3077;
    float _3081 = -_3069;
    float _3083 = _3043 + _3081;
    float _3085 = -_3069;
    float _3087 = _3055 + _3085;
    float _3089 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    float _3091 = fma(_3083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    float _3093 = fma(_3087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    bool _3095 = !_3053;
    if (!_3095)
    {
        float _3097 = -_2170;
        float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3101 = -_2174;
        float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3105 = -_2178;
        float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3109 = _3099 * _3099;
        float _3111 = fma(_3103, _3103, _3109);
        float _3113 = fma(_3107, _3107, _3111);
        float _3115 = sqrt(_3113);
        float _3117 = rsqrt(_3113);
        float _3119 = -_3115;
        float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3123 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3125 = precise::clamp(_3123, 0.0, 1.0);
        float _3127 = _3103 * _3117;
        float _3129 = _3099 * _3117;
        float _3131 = abs(_3125);
        float _3133 = log2(_3131);
        float _3135 = _3107 * _3117;
        float _3137 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3139 = _2064 * _3129;
        float _3141 = -_3129;
        float _3143 = -_3137;
        float _3145 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3143);
        float _3147 = fma(_2060, _3127, _3139);
        float _3149 = -_3135;
        float _3151 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3145);
        float _3153 = fma(_2066, _3135, _3147);
        float _3155 = precise::clamp(_3153, 0.0, 1.0);
        float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3159 = _3151 + _3157;
        float _3161 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        float _3167 = exp2(_3161);
        float _3169 = _3167 * _3165;
        float _3171 = _3155 * _3169;
        float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3175 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3177 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3173;
        out.m_91.y = _3175;
        out.m_91.z = _3177;
    }
    out.m_93.x = _3089;
    out.m_93.y = _3091;
    out.m_93.z = _3093;
    if (!_3075)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3179 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3179;
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
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2931 = false;
    bool _2116 = false;
    bool _1004 = false;
    bool _824 = false;
    bool _644 = false;
    bool _518 = false;
    bool _188 = false;
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
    float _122 = _120;
    if (!_116)
    {
        out.m_51.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3235 = as_type<float>(_128);
        out.gl_Position.z = _3235;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _130 = in.m_53.w;
    bool _132 = _130 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _134 = isnan(_130);
    bool _136 = _132 || _134;
    bool _138 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _140 = _136 || _138;
    float _142 = -_130;
    float _144 = _142 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_140)
    {
        float _146 = float(_112);
        _122 = _146;
    }
    float _148 = _122;
    bool _150 = _144 >= _148;
    bool _152 = !_140;
    bool _154 = _150 || _152;
    float _156 = _148;
    if (_154)
    {
        _156 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _158 = _156;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    int _160 = 0;
    if (_154)
    {
        float _162 = _158 * 5.0;
        _160 = as_type<int>(_162);
    }
    int _164 = _160;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3304 = as_type<float>(_164);
        out.gl_Position.z = _3304;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _166 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _168 = !_166;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _144);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        float _190 = float(_112);
        float _192 = 1.0 / _190;
        float _194 = _144 * _192;
        _186 = _194;
    }
    _188 = false;
    float _196 = _186;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _196 + _198;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _210;
    float _214 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _216 = _214 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _218 = 1.0 / _204;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _220;
    float _224 = 1.0 / _212;
    float _226 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _228 = _196 + _226;
    bool _230 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = isnan(_196);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _238 = _234 || _236;
    float _240 = float(_238);
    bool _242 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _244 = isnan(_196);
    bool _246 = _242 || _244;
    bool _248 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _250 = _246 || _248;
    float _252 = float(_250);
    float _254 = 1.0 / _208;
    float _256 = _228 * _218;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = _196 + _258;
    float _262 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _264 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _262;
    float _266 = fma(_264, _256, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _268 = 1.0 / _216;
    float _270 = _260 * _224;
    bool _272 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _274 = isnan(_196);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _196 + _284;
    bool _288 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_196);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    bool _300 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _302 = -_282;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _222;
    float _308 = _200 * _254;
    float _310 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _312 = _196 + _310;
    bool _314 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _316 = isnan(_196);
    bool _318 = _314 || _316;
    bool _320 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _322 = _318 || _320;
    float _324 = float(_322);
    float _326 = -_298;
    float _328 = _326 + 1.0;
    float _330 = _286 * _268;
    float _332 = _298 * _304;
    float _334 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _336 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _334;
    float _338 = _324 * _328;
    float _340 = -_324;
    float _342 = _340 + 1.0;
    bool _344 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _346 = isnan(_196);
    bool _348 = _344 || _346;
    bool _350 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _352 = _348 || _350;
    float _354 = float(_352);
    float _356 = fma(_336, _256, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _358 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _360 = _358 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _362 = _312 * _306;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _364;
    float _368 = _240 * _342;
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _374 = fma(_360, _308, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _376 = fma(_366, _256, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = -_240;
    float _380 = _378 + 1.0;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = fma(_372, _308, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _388 = _252 * _380;
    float _390 = -_252;
    float _392 = _390 + 1.0;
    float _394 = fma(_384, _308, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _396 = _354 * _392;
    float _398 = -_354;
    float _400 = _398 + 1.0;
    float _402 = _376 * _396;
    float _404 = _356 * _396;
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _406;
    float _410 = _266 * _396;
    float _412 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].x, _402);
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _416 = _414 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _418 = fma(_408, _270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _420 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].y, _404);
    float _422 = fma(_374, _388, _412);
    float _424 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _426 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _424;
    float _428 = fma(_400, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _430 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _432 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _430;
    float _434 = fma(_416, _330, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _436 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _438 = _436 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _440 = fma(_394, _388, _420);
    float _442 = fma(_418, _368, _422);
    float _444 = fma(_426, _270, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _446 = fma(_386, _388, _428);
    float _448 = fma(_432, _270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_438, _330, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _456 = fma(_444, _368, _446);
    float _458 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _458;
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _462;
    float _466 = fma(_452, _330, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _468 = fma(_448, _368, _440);
    float _470 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _470;
    float _474 = fma(_434, _338, _442);
    float _476 = fma(_460, _362, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _478 = fma(_464, _362, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _480 = fma(_472, _362, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _482 = fma(_454, _338, _468);
    float _484 = fma(_466, _338, _456);
    float _486 = fma(_476, _332, _474);
    float _488 = fma(_478, _332, _482);
    float _490 = fma(_480, _332, _484);
    float _492 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].x, _486);
    float _494 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].y, _488);
    float _496 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].z, _490);
    bool _498 = !_300;
    float _516;
    if (!_498)
    {
        float _500 = in.m_55.x;
        float _502 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _504 = _500 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _506 = fma(_504, (*spvDescriptorSet0.vp_c9)._m0[11].x, _144);
        float _508 = _506 * _502;
        float _510 = floor(_508);
        float _512 = -_510;
        float _514 = _508 + _512;
        _516 = _514;
        _518 = true;
    }
    else
    {
        float _520 = float(_112);
        float _522 = 1.0 / _520;
        float _524 = _144 * _522;
        _516 = _524;
    }
    _518 = false;
    float _526 = _516;
    float _528 = in.m_57.x;
    float _530 = in.m_57.y;
    float _532 = in.m_57.z;
    float _534 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _536 = _526 + _534;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _540 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _538;
    bool _542 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _544 = isnan(_526);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    bool _554 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _556 = 1.0 / _540;
    float _558 = _494 * _530;
    bool _560 = _526 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _562 = isnan(_526);
    bool _564 = _560 || _562;
    bool _566 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _568 = _564 || _566;
    float _570 = float(_568);
    float _572 = _536 * _556;
    float _574 = _496 * _532;
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _578 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _576;
    float _580 = -_570;
    float _582 = _580 + 1.0;
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _588;
    float _592 = _552 * _582;
    float _594 = fma(_578, _572, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _596 = fma(_586, _572, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _598 = fma(_590, _572, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _600 = -_552;
    float _602 = _600 + 1.0;
    float _604 = _594 * _592;
    float _606 = _596 * _592;
    float _608 = _598 * _592;
    float _610 = _492 * _528;
    float _612 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].y, _604);
    float _614 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].x, _606);
    float _616 = fma(_602, (*spvDescriptorSet0.vp_c9)._m0[107].z, _608);
    float _618 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].y, _612);
    float _620 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].x, _614);
    float _622 = fma(_570, (*spvDescriptorSet0.vp_c9)._m0[108].z, _616);
    bool _624 = !_554;
    float _642;
    if (!_624)
    {
        float _626 = in.m_55.x;
        float _628 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _630 = _626 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _632 = fma(_630, (*spvDescriptorSet0.vp_c9)._m0[11].y, _144);
        float _634 = _632 * _628;
        float _636 = floor(_634);
        float _638 = -_636;
        float _640 = _634 + _638;
        _642 = _640;
        _644 = true;
    }
    else
    {
        float _646 = float(_112);
        float _648 = 1.0 / _646;
        float _650 = _144 * _648;
        _642 = _650;
    }
    _644 = false;
    float _652 = _642;
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _656 = _652 + _654;
    float _658 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _660 = _658 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _662 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _664 = _662 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _666 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _668 = isnan(_652);
    bool _670 = _666 || _668;
    bool _672 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _674 = _670 || _672;
    float _676 = float(_674);
    float _678 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _680 = _678 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _682 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _684 = isnan(_652);
    bool _686 = _682 || _684;
    bool _688 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _690 = _686 || _688;
    float _692 = float(_690);
    float _694 = 1.0 / _660;
    float _696 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _696;
    float _700 = -_676;
    float _702 = _700 + 1.0;
    bool _704 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _706 = isnan(_652);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    bool _716 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _718 = 1.0 / _664;
    float _720 = 1.0 / _680;
    float _722 = _698 * _694;
    float _724 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _726 = _724 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _728 = _692 * _702;
    float _730 = -_692;
    float _732 = _730 + 1.0;
    float _734 = fma(_722, _656, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _736 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _738 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _736;
    float _740 = _714 * _732;
    float _742 = _726 * _718;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _746 = _652 + _744;
    bool _748 = _652 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _750 = isnan(_652);
    bool _752 = _748 || _750;
    bool _754 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _756 = _752 || _754;
    float _758 = float(_756);
    float _760 = _734 * _740;
    float _762 = -_714;
    float _764 = _762 + 1.0;
    float _766 = fma(_742, _746, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _768 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _770 = _652 + _768;
    float _772 = _738 * _720;
    float _774 = -_758;
    float _776 = _774 + 1.0;
    float _778 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[115].x, _760);
    float _780 = _620 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _782 = fma(_772, _770, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _784 = _676 * _776;
    float _786 = fma(_766, _728, _778);
    float _788 = _780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _790 = fma(_782, _784, _786);
    float _792 = _618 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _794 = _622 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _796 = fma(_758, (*spvDescriptorSet0.vp_c9)._m0[118].x, _790);
    float _798 = _792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _800 = _794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _802 = _796 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _788;
    out.m_59.y = _798;
    out.m_59.z = _800;
    out.m_59.w = _802;
    bool _804 = !_716;
    float _822;
    if (!_804)
    {
        float _806 = in.m_55.x;
        float _808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _810 = _806 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _812 = fma(_810, (*spvDescriptorSet0.vp_c9)._m0[11].w, _144);
        float _814 = _812 * _808;
        float _816 = floor(_814);
        float _818 = -_816;
        float _820 = _814 + _818;
        _822 = _820;
        _824 = true;
    }
    else
    {
        float _826 = float(_112);
        float _828 = 1.0 / _826;
        float _830 = _144 * _828;
        _822 = _830;
    }
    _824 = false;
    float _832 = _822;
    float _834 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _836 = _832 + _834;
    float _838 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _840 = _838 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _842 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _844 = _842 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _846 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _848 = isnan(_832);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _854 = _850 || _852;
    float _856 = float(_854);
    float _858 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _860 = _858 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _862 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _864 = isnan(_832);
    bool _866 = _862 || _864;
    bool _868 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _870 = _866 || _868;
    float _872 = float(_870);
    float _874 = 1.0 / _840;
    float _876 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _876;
    float _880 = -_856;
    float _882 = _880 + 1.0;
    bool _884 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _886 = isnan(_832);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    bool _896 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _898 = 1.0 / _844;
    float _900 = 1.0 / _860;
    float _902 = _878 * _874;
    float _904 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _906 = _904 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _908 = _872 * _882;
    float _910 = -_872;
    float _912 = _910 + 1.0;
    float _914 = fma(_902, _836, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _916 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _916;
    float _920 = _894 * _912;
    float _922 = _906 * _898;
    float _924 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _926 = _832 + _924;
    bool _928 = _832 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _930 = isnan(_832);
    bool _932 = _928 || _930;
    bool _934 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _936 = _932 || _934;
    float _938 = float(_936);
    float _940 = _914 * _920;
    float _942 = -_894;
    float _944 = _942 + 1.0;
    float _946 = fma(_922, _926, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _948 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _950 = _832 + _948;
    float _952 = _918 * _900;
    float _954 = -_938;
    float _956 = _954 + 1.0;
    float _958 = fma(_944, (*spvDescriptorSet0.vp_c9)._m0[131].x, _940);
    float _960 = fma(_952, _950, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _962 = _856 * _956;
    float _964 = fma(_946, _908, _958);
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _968 = fma(_960, _962, _964);
    float _970 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _972 = _966 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _976 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[134].x, _968);
    float _978 = _970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _980 = _974 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _982 = _976 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _972;
    out.m_61.y = _978;
    out.m_61.z = _980;
    out.m_61.w = _982;
    bool _984 = !_896;
    float _1002;
    if (!_984)
    {
        float _986 = in.m_55.x;
        float _988 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _990 = _986 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _992 = fma(_990, (*spvDescriptorSet0.vp_c9)._m0[14].x, _144);
        float _994 = _992 * _988;
        float _996 = floor(_994);
        float _998 = -_996;
        float _1000 = _994 + _998;
        _1002 = _1000;
        _1004 = true;
    }
    else
    {
        float _1006 = float(_112);
        float _1008 = 1.0 / _1006;
        float _1010 = _144 * _1008;
        _1002 = _1010;
    }
    _1004 = false;
    float _1012 = _1002;
    float _1014 = in.m_55.w;
    float _1016 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1018 = _1012 + _1016;
    float _1020 = in.m_63.y;
    int _1022 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _1024 = _1022 != 0;
    float _1026 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1028 = _1012 + _1026;
    float _1030 = in.m_55.z;
    float _1032 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1034 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1032;
    int _1036 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1038 = _1036 != 0;
    float _1040 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1042 = _1040 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1044 = in.m_55.y;
    float _1046 = 1.0 / _1034;
    int _1048 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1050 = _1048 != 0;
    float _1052 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1054 = _1012 + _1052;
    float _1056 = in.m_55.x;
    int _1058 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1060 = _1058 != 0;
    float _1062 = 1.0 / _1042;
    float _1064 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1066 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1064;
    float _1068 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1070 = _1068 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1072 = _1014 > 0.5;
    float _1074 = in.m_48.x;
    float _1076 = in.m_48.y;
    float _1078 = in.m_48.z;
    float _1080 = -_1020;
    float _1082 = _1080 + 1.0;
    float _1084 = 1.0 / _1070;
    bool _1086 = _1030 > 0.5;
    float _1088 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1090 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1092 = _1044 > 0.5;
    float _1094 = 1.0 / _1066;
    int _1096 = _1086 ? as_type<int>(_1082) : as_type<int>(_1020);
    float _1098 = _1018 * _1062;
    int _1100 = _1092 ? as_type<int>(_1082) : as_type<int>(_1020);
    float _1102 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1104 = _1012 + _1102;
    float _1106 = _1024 ? as_type<float>(_1096) : _1020;
    float _1108 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1110 = _1038 ? as_type<float>(_1100) : _1020;
    float _1112 = _1056 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1114 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1116 = _1114 != 0;
    float _1118 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1120 = _1118 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    int _1122 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1124 = _1122 != 0;
    float _1126 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1128 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1126;
    float _1130 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1132 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1076 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1136 = 1.0 / _1120;
    float _1138 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1130);
    float _1140 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = fma(_1074, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1134);
    float _1144 = -_1090;
    float _1146 = fma(_1112, 2.0, _1144);
    float _1148 = _1020;
    bool _1150 = _1060;
    float _1152 = (*spvDescriptorSet0.vp_c9)._m0[7].z;
    float _1154 = _1044;
    if (_1060)
    {
        float _1156 = _1072 ? _1082 : _1020;
        _1148 = _1156;
    }
    float _1158 = _1148;
    float _1160 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1162 = _1012 + _1160;
    float _1164 = 1.0 / _1128;
    float _1166 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1168 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1166;
    int _1170 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1172 = _1170 != 0;
    float _1174 = _1162 * _1046;
    float _1176 = _1044 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1180 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1178;
    float _1182 = 1.0 / _1168;
    float _1184 = _1104 * _1136;
    float _1186 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1188 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (_1050)
    {
        bool _1190 = _1056 > 0.5;
        _1150 = _1190;
    }
    bool _1192 = _1150;
    float _1194 = fma(_1176, -2.0, _1088);
    if (_1172)
    {
        _1152 = _1056;
    }
    float _1196 = _1152;
    float _1198 = _1028 * _1164;
    float _1200 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _1202 = _1196;
    if (!_1172)
    {
        _1202 = _1030;
    }
    float _1204 = _1202;
    float _1206 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1208 = _1012 + _1206;
    float _1210 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1186);
    float _1212 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1214 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1188);
    float _1216 = fma(_1056, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1200);
    float _1218 = _1208 * _1182;
    float _1220 = fma(_1044, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1212);
    if (!_1172)
    {
        _1154 = _1056;
    }
    float _1222 = _1154;
    float _1224 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1138);
    float _1226 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1228 = fma(_1078, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1142);
    float _1230 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1232 = _1012 + _1230;
    float _1234 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1236 = _1234 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1238 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1240 = _1238 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1242 = _1232 * _1094;
    float _1244 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1246 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1244;
    float _1248 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1250 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1248;
    float _1252 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1254 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1252;
    float _1256 = fma(_1236, _1098, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1258 = fma(_1240, _1098, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1260 = fma(_1246, _1242, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1262 = _1054 * _1084;
    float _1264 = fma(_1254, _1242, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1266 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1268 = _1266 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1270 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1272 = _1270 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1274 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1276 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1274;
    float _1278 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _1280 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1280;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1288 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1290 = _1288 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1292 = fma(_1268, _1262, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1294 = fma(_1272, _1262, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    bool _1296 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1298 = isnan(_1012);
    bool _1300 = _1296 || _1298;
    bool _1302 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1304 = _1300 || _1302;
    float _1306 = float(_1304);
    float _1308 = fma(_1286, _1184, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1310 = fma(_1290, _1184, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1312 = fma(_1276, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    bool _1314 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1316 = isnan(_1012);
    bool _1318 = _1314 || _1316;
    bool _1320 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1322 = _1318 || _1320;
    float _1324 = float(_1322);
    float _1326 = fma(_1282, _1198, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1328 = -_1306;
    float _1330 = _1328 + 1.0;
    float _1332 = fma(_1180, _1174, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    float _1334 = fma(_1250, _1174, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    bool _1336 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1338 = isnan(_1012);
    bool _1340 = _1336 || _1338;
    bool _1342 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1344 = _1340 || _1342;
    float _1346 = float(_1344);
    float _1348 = in.m_63.x;
    float _1350 = -_1324;
    float _1352 = _1350 + 1.0;
    float _1354 = _1324 * _1330;
    float _1356 = _1108 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1358 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1360 = isnan(_1012);
    bool _1362 = _1358 || _1360;
    bool _1364 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1366 = _1362 || _1364;
    float _1368 = float(_1366);
    float _1370 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _1372 = _1346 * _1352;
    float _1374 = -_1346;
    float _1376 = _1374 + 1.0;
    float _1378 = fma(_1356, _1110, -0.5);
    bool _1380 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1382 = isnan(_1012);
    bool _1384 = _1380 || _1382;
    bool _1386 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1388 = _1384 || _1386;
    float _1390 = float(_1388);
    float _1392 = -_1368;
    float _1394 = _1392 + 1.0;
    float _1396 = fma(_1106, _1370, -0.5);
    float _1398 = _1368 * _1376;
    bool _1400 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1402 = isnan(_1012);
    bool _1404 = _1400 || _1402;
    bool _1406 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1408 = _1404 || _1406;
    float _1410 = float(_1408);
    float _1412 = _1390 * _1394;
    bool _1414 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1416 = isnan(_1012);
    bool _1418 = _1414 || _1416;
    bool _1420 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1422 = _1418 || _1420;
    float _1424 = float(_1422);
    float _1426 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1194);
    bool _1428 = _1012 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1430 = isnan(_1012);
    bool _1432 = _1428 || _1430;
    bool _1434 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1436 = _1432 || _1434;
    float _1438 = float(_1436);
    float _1440 = -_1390;
    float _1442 = _1440 + 1.0;
    float _1444 = -_1424;
    float _1446 = _1444 + 1.0;
    float _1448 = _1438 * _1442;
    float _1450 = -_1438;
    float _1452 = _1450 + 1.0;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1456 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1460 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1458;
    float _1462 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1210);
    float _1464 = fma(_1456, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1466 = fma(_1460, _1218, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1468 = -_1426;
    float _1470 = fma(_1462, _1378, _1468);
    float _1472 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _1474 = _1204 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    int _1476 = as_type<int>(_1460);
    float _1478 = _1276;
    float _1480 = _1222;
    float _1482 = _1348;
    float _1484 = _1448;
    if (_1050)
    {
        float _1486 = -_1348;
        float _1488 = _1486 + 1.0;
        _1476 = as_type<int>(_1488);
    }
    int _1490 = _1476;
    float _1492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1494 = _1410 * _1446;
    int _1496 = _1490;
    if (!_1050)
    {
        _1478 = _1348;
    }
    float _1498 = _1478;
    float _1500 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _1502 = _1222 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _1504 = _1498;
    if (_1050)
    {
        float _1506 = _1192 ? as_type<float>(_1490) : _1348;
        _1504 = _1506;
    }
    float _1508 = _1504;
    if (_1116)
    {
        float _1510 = -_1348;
        float _1512 = _1510 + 1.0;
        _1496 = as_type<int>(_1512);
    }
    int _1514 = _1496;
    float _1516 = _1332 * _1494;
    float _1518 = _1334 * _1494;
    float _1520 = -_1410;
    float _1522 = _1520 + 1.0;
    float _1524 = -_1500;
    float _1526 = fma(_1474, 2.0, _1524);
    float _1528 = fma(_1502, -2.0, _1472);
    if (!_1116)
    {
        _1480 = _1348;
    }
    float _1530 = _1480;
    float _1532 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1518);
    float _1534 = _1530;
    if (_1116)
    {
        float _1536 = _1086 ? as_type<float>(_1514) : _1348;
        _1534 = _1536;
    }
    float _1538 = _1534;
    float _1540 = fma(_1522, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1516);
    float _1542 = -_144;
    float _1544 = fma(_1542, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1146);
    float _1546 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1214);
    float _1548 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1216);
    float _1550 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1220);
    float _1552 = -_144;
    float _1554 = fma(_1552, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1526);
    float _1556 = fma(_144, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1528);
    float _1558 = _1226 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1560 = _1492 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1562 = _1224 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1564 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _1566 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1568 = _1558 + _1566;
    float _1570 = _1424 * _1452;
    float _1572 = fma(_1560, _1508, -0.5);
    float _1574 = _1228 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1576 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1578 = _1562 + _1576;
    float _1580 = _1568 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1582 = fma(_1258, _1570, _1532);
    float _1584 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1586 = _1574 + _1584;
    int _1588 = 0;
    float _1590 = _1558;
    if (_1124)
    {
        float _1592 = -_1348;
        float _1594 = _1592 + 1.0;
        _1588 = as_type<int>(_1594);
    }
    int _1596 = _1588;
    float _1598 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1580);
    float _1600 = fma(_1256, _1570, _1540);
    float _1602 = fma(_1264, _1448, _1582);
    float _1604 = fma(_1546, _1572, _1544);
    float _1606 = fma(_1586, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1598);
    float _1608 = fma(_1260, _1448, _1600);
    float _1610 = _1568 * _1568;
    if (_1124)
    {
        float _1612 = _1092 ? as_type<float>(_1596) : _1348;
        _1482 = _1612;
    }
    float _1614 = _1482;
    float _1616 = in.m_65.w;
    bool _1618 = _1606 >= 0.0;
    float _1620 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _1622 = fma(_1292, _1412, _1608);
    float _1624 = fma(_1294, _1412, _1602);
    float _1626 = fma(_1578, _1578, _1610);
    float _1628 = fma(_1620, _1614, -0.5);
    float _1630 = fma(_1312, _1398, _1622);
    float _1632 = fma(_1326, _1398, _1624);
    float _1634 = fma(_1586, _1586, _1626);
    float _1636 = fma(_1548, _1628, _1554);
    float _1638 = fma(_1308, _1372, _1630);
    float _1640 = fma(_1310, _1372, _1632);
    float _1642 = rsqrt(_1634);
    float _1644 = -_1556;
    float _1646 = fma(_1550, _1396, _1644);
    if (_1618)
    {
        _1484 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1648 = _1484;
    float _1650 = fma(_1464, _1354, _1638);
    float _1652 = fma(_1466, _1354, _1640);
    float _1654 = _1646 + 0.5;
    float _1656 = _1158 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1658 = _1470 + 0.5;
    float _1660 = _1538 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1662 = _1636 + 0.5;
    float _1664 = _1604 + 0.5;
    int _1666 = as_type<int>(_1648);
    if (_1618)
    {
        float _1668 = _1648 * 5.0;
        _1666 = as_type<int>(_1668);
    }
    int _1670 = _1666;
    float _1672 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1650);
    float _1674 = fma(_1306, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1652);
    out.m_67.w = _1616;
    float _1676 = _1568 * _1642;
    float _1678 = _1578 * _1642;
    out.m_69.x = _1664;
    out.m_69.y = _1658;
    out.m_69.z = _1660;
    out.m_69.w = _1656;
    out.m_71.x = _1662;
    out.m_71.y = _1654;
    if (_1618)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5844 = as_type<float>(_1670);
        out.gl_Position.z = _5844;
    }
    out.m_73.x = _1672;
    out.m_73.y = _1674;
    if (_1618)
    {
        out.m_51.x = 0.0;
    }
    if (_1618)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1680 = -_1676;
    float _1682 = fma(_1680, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1558);
    float _1684 = _1586 * _1642;
    float _1686 = -_1678;
    float _1688 = fma(_1686, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1562);
    float _1690 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1692 = _1682 + _1690;
    float _1694 = -_1684;
    float _1696 = fma(_1694, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1574);
    float _1698 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1700 = _1688 + _1698;
    float _1702 = _1692 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1704 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1706 = _1696 + _1704;
    float _1708 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1702);
    float _1710 = fma(_1706, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1708);
    bool _1712 = _1710 >= 0.0;
    float _1714 = _1706;
    if (_1712)
    {
        _1714 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1716 = _1714;
    int _1718 = as_type<int>(_1716);
    if (_1712)
    {
        out.m_51.x = 0.0;
    }
    if (_1712)
    {
        float _1720 = _1716 * 5.0;
        _1718 = as_type<int>(_1720);
    }
    int _1722 = _1718;
    if (_1712)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5943 = as_type<float>(_1722);
        out.gl_Position.z = _5943;
    }
    if (_1712)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1724 = -_1558;
    float _1726 = _1724 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1728 = -_1562;
    float _1730 = _1728 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1732 = -_1574;
    float _1734 = _1732 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1736 = -_1676;
    float _1738 = fma(_1736, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1568);
    float _1740 = _1726 * _1726;
    float _1742 = -_1678;
    float _1744 = fma(_1742, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1578);
    float _1746 = -_1684;
    float _1748 = fma(_1746, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1586);
    float _1750 = _558 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1752 = fma(_1730, _1730, _1740);
    float _1754 = fma(_1734, _1734, _1752);
    float _1756 = _1738 * _1738;
    float _1758 = fma(_1744, _1744, _1756);
    float _1760 = rsqrt(_1754);
    float _1762 = fma(_1748, _1748, _1758);
    float _1764 = sqrt(_1762);
    float _1766 = _1730 * _1760;
    float _1768 = _1734 * _1760;
    float _1770 = _1726 * _1760;
    float _1772 = _574 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1774 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1776 = _1766 * _1774;
    float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1780 = _1768 * _1778;
    float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1784 = _1770 * _1782;
    float _1786 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _1788 = -_1776;
    float _1790 = fma(_1768, _1786, _1788);
    float _1792 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _1794 = -_1780;
    float _1796 = fma(_1770, _1792, _1794);
    float _1798 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1800 = -_1784;
    float _1802 = fma(_1766, _1798, _1800);
    float _1804 = _1642 * _1764;
    float _1806 = _1790 * _1790;
    float _1808 = _610 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1810 = _1804 * _1772;
    float _1812 = fma(_1796, _1796, _1806);
    float _1814 = _1804 * _1750;
    float _1816 = in.m_75.x;
    float _1818 = in.m_75.y;
    float _1820 = in.m_75.z;
    float _1822 = _1804 * _1808;
    float _1824 = fma(_1802, _1802, _1812);
    float _1826 = rsqrt(_1824);
    float _1828 = _1790 * _1826;
    float _1830 = _1796 * _1826;
    float _1832 = _1802 * _1826;
    float _1834 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1818);
    float _1836 = _1768 * _1828;
    float _1838 = _1770 * _1830;
    float _1840 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1816);
    float _1842 = _1814 * _1834;
    float _1844 = -_1836;
    float _1846 = fma(_1770, _1832, _1844);
    float _1848 = -_1838;
    float _1850 = fma(_1766, _1828, _1848);
    float _1852 = _1822 * _1840;
    float _1854 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1820);
    float _1856 = _1842 * _1846;
    float _1858 = _1842 * _1850;
    bool _1860 = _1818 != 0.0;
    bool _1862 = isnan(_1818);
    bool _1864 = _1860 || _1862;
    bool _1866 = isnan(0.0);
    bool _1868 = _1864 || _1866;
    float _1870 = _1810 * _1854;
    float _1872 = fma(_1852, _1830, _1856);
    float _1874 = fma(_1852, _1832, _1858);
    bool _1876 = _1816 == 0.0;
    bool _1878 = !_1868;
    bool _1880 = _1876 && _1878;
    float _1882 = fma(_1870, _1766, _1872);
    float _1884 = fma(_1870, _1768, _1874);
    bool _1886 = _1820 == 0.0;
    bool _1888 = _1886 && _1880;
    float _1890 = _1562 + _1882;
    float _1892 = _1574 + _1884;
    float _1894 = _1766 * _1832;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1898 = _1890 + _1896;
    float _1900 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1902 = _1892 + _1900;
    float _1904 = -_1894;
    float _1906 = fma(_1768, _1830, _1904);
    float _1908 = _1898 * _1898;
    float _1910 = _1902 * _1902;
    float _1912 = in.m_77.x;
    float _1914 = in.m_77.y;
    float _1916 = in.m_77.z;
    float _1918 = _1842 * _1906;
    float _1920 = _1908 + _1910;
    float _1922 = fma(_1852, _1828, _1918);
    float _1924 = sqrt(_1920);
    float _1926 = fma(_1870, _1770, _1922);
    float _1928 = _1558 + _1926;
    bool _1930 = _1924 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1932 = _1842;
    float _1934 = _1926;
    float _1936 = _1890;
    float _1938 = _1908;
    float _1940 = _1768;
    float _1942 = _1832;
    if (!_1930)
    {
        _1590 = _1890;
    }
    float _1944 = _1590;
    float _1946 = _1944;
    if (!_1930)
    {
        _1932 = _1910;
    }
    float _1948 = _1932;
    float _1950 = _1948;
    if (!_1930)
    {
        _1934 = _1892;
    }
    float _1952 = _1934;
    float _1954 = _1952;
    if (!_1930)
    {
        _1936 = _1928;
    }
    float _1956 = _1936;
    bool _1958 = !_1930;
    float _1960 = _1956;
    float _1962 = _1914;
    float _1964 = _1912;
    float _1966 = _1916;
    if (!_1958)
    {
        float _1968 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1970 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1972 = _1924 + _1970;
        float _1974 = rsqrt(_1920);
        float _1976 = _1972 * _1968;
        float _1978 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1980 = _1976 * 0.15915493667125701904296875;
        float _1982 = _1980 * 6.283185482025146484375;
        float _1984 = sin(_1982);
        float _1986 = _1980 * 6.283185482025146484375;
        float _1988 = cos(_1986);
        float _1990 = fma(_1984, _1978, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1992 = _1974 * _1990;
        float _1994 = _1988 + (-1.0);
        float _1996 = fma(_1898, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1998 = fma(_1902, _1992, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2000 = _1994 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2002 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _2004 = _1996 + _2002;
        float _2006 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _2008 = _1998 + _2006;
        float _2010 = fma(_1928, _1988, _2000);
        float _2012 = _2004 * _2004;
        float _2014 = _2008 * _2008;
        _1960 = _2010;
        _1938 = _2012;
        _1950 = _2014;
        _1946 = _1996;
        _1954 = _1998;
    }
    float _2016 = _1960;
    float _2018 = _1938;
    float _2020 = _1950;
    float _2022 = _1946;
    float _2024 = _1954;
    float _2026 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _2028 = _2016 + _2026;
    if (!_1888)
    {
        float _2030 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1914);
        _1962 = _2030;
    }
    float _2032 = _1962;
    if (!_1888)
    {
        float _2034 = fma(_1816, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1912);
        _1964 = _2034;
    }
    float _2036 = _1964;
    float _2038 = _2036;
    if (!_1888)
    {
        float _2040 = fma(_1820, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1916);
        _1966 = _2040;
    }
    float _2042 = _1966;
    float _2044 = fma(_2028, _2028, _2018);
    float _2046 = _1846 * _2032;
    float _2048 = _1906 * _2032;
    float _2050 = _1850 * _2032;
    float _2052 = _2044 + _2020;
    float _2054 = fma(_1830, _2036, _2046);
    float _2056 = fma(_1828, _2036, _2048);
    float _2058 = fma(_1832, _2036, _2050);
    float _2060 = fma(_1766, _2042, _2054);
    float _2062 = sqrt(_2052);
    float _2064 = fma(_1770, _2042, _2056);
    float _2066 = fma(_1768, _2042, _2058);
    out.m_79.x = _2060;
    out.m_79.y = _2064;
    out.m_79.z = _2066;
    bool _2068 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _2070 = isnan(_2062);
    bool _2072 = _2068 || _2070;
    bool _2074 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _2076 = _2072 || _2074;
    float _2078 = _2056;
    float _2080 = _2050;
    if (!_2076)
    {
        _2078 = 1.0;
    }
    float _2082 = _2078;
    bool _2084 = !_2076;
    float _2086 = _2082;
    if (!_2084)
    {
        bool _2088 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2090 = isnan(_2062);
        bool _2092 = _2088 || _2090;
        bool _2094 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2096 = _2092 || _2094;
        if (!_2096)
        {
            float _2098 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2100 = _2062 + _2098;
            float _2102 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2104 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2102;
            float _2106 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2108 = _2106 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2110 = 1.0 / _2104;
            float _2112 = _2100 * _2110;
            float _2114 = fma(_2112, _2108, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2086 = _2114;
            _1940 = _2110;
            _2116 = true;
        }
        else
        {
            bool _2118 = _2062 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2120 = isnan(_2062);
            bool _2122 = _2118 || _2120;
            bool _2124 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2126 = _2122 || _2124;
            if (!_2126)
            {
                float _2128 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2130 = _2062 + _2128;
                float _2132 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2134 = _2132 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2136 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2138 = _2136 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2140 = 1.0 / _2134;
                float _2142 = _2130 * _2140;
                float _2144 = fma(_2142, _2138, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2086 = _2144;
                _1940 = _2140;
                _2116 = true;
            }
            else
            {
                _2086 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2116 = false;
    float _2146 = _2086;
    float _2148 = _1940;
    float _2150 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2152 = _2016 + _2150;
    float _2154 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2156 = _2022 + _2154;
    float _2158 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2160 = _2024 + _2158;
    float _2162 = fma(_2152, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2164 = fma(_2156, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2166 = fma(_2160, _2146, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2168 = -_1676;
    float _2170 = fma(_2168, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2162);
    float _2172 = -_1678;
    float _2174 = fma(_2172, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2164);
    float _2176 = -_1684;
    float _2178 = fma(_2176, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2166);
    float _2180 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2182 = _2170 + _2180;
    float _2184 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2186 = _2174 + _2184;
    float _2188 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2190 = _2178 + _2188;
    float _2192 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2194 = _2182 * _2182;
    float _2196 = fma(_2186, _2186, _2194);
    float _2198 = fma(_2190, _2190, _2196);
    float _2200 = rsqrt(_2198);
    float _2202 = sqrt(_2198);
    float _2204 = _2200 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2206 = _2186 * _2204;
    float _2208 = _2190 * _2204;
    float _2210 = _2206 * _2206;
    float _2212 = _2208 * _2208;
    float _2214 = _2210 + _2212;
    float _2216 = sqrt(_2214);
    bool _2218 = _2216 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2220 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2222 = _2216 + _2220;
    float _2224 = _2196;
    float _2226 = _2164;
    float _2228 = _2222;
    float _2230 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _2232 = _2214;
    if (_2218)
    {
        float _2234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2224 = _2234;
    }
    float _2236 = _2224;
    if (_2218)
    {
        float _2238 = rsqrt(_2214);
        _2226 = _2238;
    }
    float _2240 = _2226;
    float _2242 = _2240;
    if (_2218)
    {
        float _2244 = _2222 * _2236;
        _2228 = _2244;
    }
    float _2246 = _2228;
    if (_2218)
    {
        float _2248 = _2246 * 0.15915493667125701904296875;
        _2080 = _2248;
    }
    float _2250 = _2080;
    float _2252 = _2236;
    float _2254 = _2250;
    if (_2218)
    {
        float _2256 = _2250 * 6.283185482025146484375;
        float _2258 = sin(_2256);
        _2252 = _2258;
    }
    float _2260 = _2252;
    float _2262 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2264 = precise::max(0.0, _2262);
    float _2266 = _2148;
    if (_2218)
    {
        float _2268 = _2250 * 6.283185482025146484375;
        float _2270 = cos(_2268);
        _2266 = _2270;
    }
    float _2272 = _2266;
    float _2274 = -_2204;
    float _2276 = -_2264;
    float _2278 = fma(_2182, _2274, _2276);
    float _2280 = fma(_1688, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    if (_2218)
    {
        float _2282 = _2278 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1942 = _2282;
    }
    float _2284 = _1942;
    float _2286 = _2284;
    if (!_2218)
    {
        _2254 = _2278;
    }
    float _2288 = _2254;
    float _2290 = _2288;
    if (_2218)
    {
        float _2292 = fma(_2260, _2284, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2038 = _2292;
    }
    float _2294 = _2038;
    float _2296 = floor(_2280);
    float _2298 = _2294;
    float _2300 = _2272;
    if (_2218)
    {
        float _2302 = _2272 + (-1.0);
        _2286 = _2302;
    }
    float _2304 = _2286;
    float _2306 = _2304;
    if (_2218)
    {
        float _2308 = _2240 * _2294;
        _2230 = _2308;
    }
    float _2310 = _2230;
    if (!_2218)
    {
        _2242 = _2206;
    }
    float _2312 = _2242;
    float _2314 = _2312;
    if (_2218)
    {
        float _2316 = _2304 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2232 = _2316;
    }
    float _2318 = _2232;
    if (_2218)
    {
        float _2320 = _2206 * _2310;
        _2314 = _2320;
    }
    float _2322 = _2314;
    if (!_2218)
    {
        _2298 = _2208;
    }
    float _2324 = _2298;
    float _2326 = _2324;
    if (_2218)
    {
        float _2328 = _2208 * _2310;
        _2326 = _2328;
    }
    float _2330 = _2326;
    if (!_2218)
    {
        _2306 = _2210;
    }
    float _2332 = _2306;
    float _2334 = _2332;
    if (_2218)
    {
        float _2336 = fma(_2278, _2272, _2318);
        _2290 = _2336;
    }
    float _2338 = _2290;
    if (_2218)
    {
        float _2340 = _2322 * _2322;
        _2334 = _2340;
    }
    float _2342 = _2334;
    if (!_2218)
    {
        _2300 = _2212;
    }
    float _2344 = _2300;
    float _2346 = _2344;
    if (_2218)
    {
        float _2348 = _2330 * _2330;
        _2346 = _2348;
    }
    float _2350 = _2346;
    float _2352 = fma(_2338, _2338, _2342);
    float _2354 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2356 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2358 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2360 = _2352 + _2350;
    float _2362 = fma(_1696, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2364 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2354);
    float _2366 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2356);
    float _2368 = rsqrt(_2360);
    float _2370 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2372 = fma(_2202, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2370);
    float _2374 = precise::clamp(_2372, 0.0, 1.0);
    float _2376 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2364);
    float _2378 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2358);
    float _2380 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2366);
    float _2382 = -_2374;
    float _2384 = _2382 + 1.0;
    float _2386 = _2170 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2388 = _2376 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2390 = _2380 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2392 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2378);
    float _2394 = fma(_2174, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2386);
    float _2396 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2398 = abs(_2384);
    float _2400 = log2(_2398);
    float _2402 = _2392 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2404 = fma(_2178, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2394);
    float _2406 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2396);
    float _2408 = _2368 * _2322;
    float _2410 = _2368 * _2338;
    float _2412 = _2404 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2414 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2406);
    float _2416 = _2408 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2418 = _2368 * _2330;
    float _2420 = floor(_2362);
    float _2422 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2414);
    float _2424 = -_2416;
    float _2426 = fma(_2410, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2424);
    float _2428 = _2402 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2430 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2432 = -_2418;
    float _2434 = fma(_2432, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2426);
    float _2436 = -_2428;
    float _2438 = fma(_2436, _2192, 1.0);
    float _2440 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2442 = exp2(_2430);
    float _2444 = fma(_2434, -0.5, 0.5);
    float _2446 = fma(_2434, 0.5, 0.5);
    float _2448 = -_2420;
    float _2450 = _2362 + _2448;
    float _2452 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2440);
    float _2454 = log2(_2438);
    float _2456 = fma(_2446, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2458 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2452);
    float _2460 = fma(_2446, _2456, -0.212114393711090087890625);
    float _2462 = 1.0 / _2422;
    float _2464 = -_2296;
    float _2466 = _2280 + _2464;
    float _2468 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2470 = fma(_2446, _2460, 1.570728778839111328125);
    float _2472 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2468);
    float _2474 = _2410 + 1.0;
    float _2476 = sqrt(_2444);
    float _2478 = _2454 * 0.693147182464599609375;
    float _2480 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2472);
    float _2482 = -_2410;
    float _2484 = fma(_2442, _2474, _2482);
    float _2486 = _2478 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2488 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2480);
    float _2490 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2458);
    float _2492 = _2488 * _2462;
    float _2494 = _2490 * _2462;
    float _2496 = fma(_2492, 0.5, 0.5);
    float _2498 = fma(_2494, -0.5, 0.5);
    float _2500 = _2476 * 0.636619746685028076171875;
    float _2502 = fma(_2484, 0.5, 0.5);
    float _2504 = -_2470;
    float _2506 = fma(_2500, _2504, 1.0);
    float2 _7228 = float2(_2466, _2450);
    float _2508 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_7228, float2(0.0), isnan(_7228)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_7228, float2(0.0), isnan(_7228)), level(0.0)).x;
    float3 _7239 = float3(_2496, _2498, _2486);
    float _2510 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7239, float3(0.0), isnan(_7239)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7239, float3(0.0), isnan(_7239)), level(0.0)).x;
    float3 _7250 = float3(_2496, _2498, _2486);
    float4 _2513 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7250, float3(0.0), isnan(_7250)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7250, float3(0.0), isnan(_7250)), level(0.0)).xyzw;
    float _2515 = _2513.x;
    float _2517 = _2513.y;
    float _2519 = _2513.z;
    float _2521 = _2513.w;
    float2 _7266 = float2(_2506, _2502);
    float3 _2525 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7266, float2(0.0), isnan(_7266)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7266, float2(0.0), isnan(_7266)), level(0.0)).xyz;
    float _2527 = _2525.x;
    float _2529 = _2525.y;
    float _2531 = _2525.z;
    float _2533 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2535 = _2400 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_81.x = _2186;
    out.m_81.y = _2182;
    out.m_81.z = _2190;
    float _2537 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2533);
    float _2539 = _1682 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2541 = exp2(_2535);
    float _2543 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2537);
    float _2545 = fma(_1688, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2539);
    float _2547 = _2543 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2549 = fma(_1696, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2545);
    float _2551 = _2488 + _2422;
    float _2553 = 1.0 / _2547;
    float _2555 = _2549 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2557 = _2551 * 0.5;
    float _2559 = _2555 + _2547;
    float _2561 = _2559 * _2553;
    float _2563 = _2561 * 0.5;
    float _2565 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2567 = fma(_2563, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2565);
    float _2569 = 1.0 / _2567;
    float _2571 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2573 = _2569 * _2571;
    float _2575 = abs(_2573);
    float _2577 = log2(_2575);
    float _2579 = _2577 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2581 = _2388 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2583 = fma(_2390, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2581);
    float _2585 = exp2(_2579);
    float _2587 = fma(_2402, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2583);
    float _2589 = fma(_2585, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2591 = precise::clamp(_2589, 0.0, 1.0);
    float _2593 = fma(_2591, -2.0, 3.0);
    float _2595 = _2591 * _2591;
    float _2597 = fma(_2412, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2587);
    float _2599 = _2595 * _2593;
    bool _2601 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2603 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2605 = _2601 || _2603;
    bool _2607 = isnan(0.5);
    bool _2609 = _2605 || _2607;
    float _2611 = in.m_83.x;
    bool _2613 = _2573 <= 8000.0;
    bool _2615 = isnan(_2573);
    bool _2617 = _2613 || _2615;
    bool _2619 = isnan(8000.0);
    bool _2621 = _2617 || _2619;
    float _2623 = float(_2621);
    float _2625 = -_2599;
    float _2627 = _2625 + 1.0;
    float _2629 = _2597 + _2422;
    out.gl_Position.x = _2488;
    out.gl_Position.y = _2490;
    out.gl_Position.z = _2597;
    out.gl_Position.w = _2422;
    float _2631 = fma(_2627, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2599);
    float _2633 = _2422 * 0.5;
    float _2635 = _2629 * 0.5;
    float _2637 = _2623 * _2631;
    float _2639 = fma(_2490, -0.5, _2633);
    float _2641 = _2488;
    float _2643 = _2490;
    float _2645 = _2422;
    float _2647 = _2422;
    float _2649 = _2635;
    float _2651 = _2639;
    float _2653 = _2557;
    if (_2609)
    {
        _2641 = 1.0;
    }
    float _2655 = _2641;
    float _2657 = _2655;
    if (_2609)
    {
        _2643 = 1.0;
    }
    float _2659 = _2643;
    float _2661 = _2659;
    if (!_2609)
    {
        float _2663 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2665 = _2663 * 0.15915493667125701904296875;
        float _2667 = _2665 * 6.283185482025146484375;
        float _2669 = cos(_2667);
        float _2671 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2673 = _2671 * 0.15915493667125701904296875;
        float _2675 = _2665 * 6.283185482025146484375;
        float _2677 = sin(_2675);
        float _2679 = 1.0 / _2669;
        float _2681 = _2673 * 6.283185482025146484375;
        float _2683 = cos(_2681);
        float _2685 = _2677 * _2679;
        float _2687 = _2673 * 6.283185482025146484375;
        float _2689 = sin(_2687);
        float _2691 = _2683 * _2685;
        float _2693 = 1.0 / _2691;
        float _2695 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2697 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2695;
        float _2699 = 1.0 / _2697;
        float _2701 = _2689 * _2693;
        float _2703 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2705 = fma(_2573, _2701, _2703);
        float _2707 = _2705 * _2699;
        float _2709 = precise::clamp(_2707, 0.0, 1.0);
        _2661 = _2709;
        _2645 = _2697;
    }
    float _2711 = _2661;
    float _2713 = _2645;
    float _2715 = _2713;
    if (!_2609)
    {
        float _2717 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2719 = _2717 * 0.15915493667125701904296875;
        float _2721 = _2719 * 6.283185482025146484375;
        float _2723 = cos(_2721);
        float _2725 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2727 = _2725 * 0.15915493667125701904296875;
        float _2729 = _2719 * 6.283185482025146484375;
        float _2731 = sin(_2729);
        float _2733 = 1.0 / _2723;
        float _2735 = _2727 * 6.283185482025146484375;
        float _2737 = cos(_2735);
        float _2739 = _2731 * _2733;
        float _2741 = _2727 * 6.283185482025146484375;
        float _2743 = sin(_2741);
        float _2745 = _2737 * _2739;
        float _2747 = 1.0 / _2745;
        float _2749 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2751 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2749;
        float _2753 = 1.0 / _2751;
        float _2755 = _2743 * _2747;
        float _2757 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2759 = fma(_2573, _2755, _2757);
        float _2761 = _2759 * _2753;
        float _2763 = precise::clamp(_2761, 0.0, 1.0);
        float _2765 = -_2763;
        float _2767 = _2765 + 1.0;
        _2657 = _2767;
        _2715 = _2753;
    }
    float _2769 = _2657;
    float _2771 = _2715;
    float _2773 = -_2541;
    float _2775 = _2773 + 1.0;
    float _2777 = _2637 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2779 = -_2508;
    float _2781 = _2779 + 1.0;
    float _2783 = _2775 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _2785 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2787 = isnan(_2202);
    bool _2789 = _2785 || _2787;
    bool _2791 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2793 = _2789 || _2791;
    float _2795 = _2781 * _2777;
    float _2797 = precise::clamp(_2795, 0.0, 1.0);
    float _2799 = _2783 * _2510;
    float _2801 = -_2783;
    float _2803 = _2801 + 1.0;
    float _2805 = -_2797;
    float _2807 = fma(_2805, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2809 = _2711 * _2769;
    float _2811 = _2521 * _2799;
    float _2813 = _2531 * _2799;
    float _2815 = _2807 * _2611;
    float _2817 = _2521 * _2803;
    float _2819 = fma(_2527, _2811, _2515);
    float _2821 = fma(_2529, _2811, _2517);
    float _2823 = _2815 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2825 = fma(_2521, _2813, _2519);
    out.m_85.x = _2557;
    out.m_85.y = _2639;
    out.m_85.z = _2635;
    out.m_85.w = _2422;
    float _2827 = _2771;
    float _2829 = _2803;
    if (!_2793)
    {
        _2827 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2831 = _2827;
    float _2833 = _2809 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2835 = _2831;
    float _2837 = _2831;
    if (!_2793)
    {
        _2829 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2839 = _2829;
    out.m_87.x = _2823;
    out.m_89.x = _2819;
    out.m_89.y = _2821;
    out.m_89.z = _2825;
    out.m_89.w = _2817;
    float _2841 = _2839;
    float _2843 = _2839;
    if (!_2793)
    {
        _2647 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2845 = _2647;
    float _2847 = _2845;
    float _2849 = _2845;
    if (!_2793)
    {
        _2649 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2851 = _2649;
    float _2853 = _2851;
    float _2855 = _2851;
    if (!_2793)
    {
        _2651 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2857 = _2651;
    float _2859 = _2857;
    float _2861 = _2857;
    if (!_2793)
    {
        _2653 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2863 = _2653;
    bool _2865 = !_2793;
    float _2867 = _2863;
    float _2869 = _2863;
    if (!_2865)
    {
        bool _2871 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2873 = isnan(_2202);
        bool _2875 = _2871 || _2873;
        bool _2877 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2879 = _2875 || _2877;
        if (!_2879)
        {
            float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2883 = _2202 + _2881;
            float _2885 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2887 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2885;
            float _2889 = 1.0 / _2887;
            float _2891 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2893 = _2891 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2897 = _2895 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2899 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2901 = _2899 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2903 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2905 = _2903 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2907 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2909 = _2907 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2911 = _2883 * _2889;
            float _2913 = precise::clamp(_2911, 0.0, 1.0);
            float _2915 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2917 = _2915 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2919 = fma(_2913, _2893, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2921 = fma(_2913, _2917, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2923 = fma(_2913, _2897, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2925 = fma(_2913, _2901, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2927 = fma(_2913, _2905, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2929 = fma(_2913, _2909, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2843 = _2921;
            _2861 = _2927;
            _2837 = _2919;
            _2855 = _2925;
            _2849 = _2923;
            _2869 = _2929;
            _2931 = true;
        }
        else
        {
            bool _2933 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2935 = isnan(_2202);
            bool _2937 = _2933 || _2935;
            bool _2939 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2941 = _2937 || _2939;
            if (!_2941)
            {
                _2835 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2943 = _2835;
            _2837 = _2943;
            if (!_2941)
            {
                _2841 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2945 = _2841;
            _2843 = _2945;
            if (!_2941)
            {
                _2847 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2947 = _2847;
            _2849 = _2947;
            if (!_2941)
            {
                _2853 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2949 = _2853;
            _2855 = _2949;
            if (!_2941)
            {
                _2859 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2951 = _2859;
            _2861 = _2951;
            if (!_2941)
            {
                _2867 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2953 = _2867;
            bool _2955 = !_2941;
            _2869 = _2953;
            if (!_2955)
            {
                bool _2957 = _2202 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2959 = isnan(_2202);
                bool _2961 = _2957 || _2959;
                bool _2963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2965 = _2961 || _2963;
                if (!_2965)
                {
                    float _2967 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2969 = _2202 + _2967;
                    float _2971 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2973 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2971;
                    float _2975 = 1.0 / _2973;
                    float _2977 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2981 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2983 = _2981 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2985 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2987 = _2985 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2989 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2991 = _2989 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2993 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2995 = _2993 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2997 = _2969 * _2975;
                    float _2999 = precise::clamp(_2997, 0.0, 1.0);
                    float _3001 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3003 = _3001 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3005 = fma(_2999, _2979, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3007 = fma(_2999, _3003, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3009 = fma(_2999, _2983, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3011 = fma(_2999, _2987, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3013 = fma(_2999, _2991, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3015 = fma(_2999, _2995, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2843 = _3007;
                    _2861 = _3013;
                    _2837 = _3005;
                    _2855 = _3011;
                    _2849 = _3009;
                    _2869 = _3015;
                    _2931 = true;
                }
                else
                {
                    _2843 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2861 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2837 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2855 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2849 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2869 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2931 = false;
    float _3017 = _2843;
    float _3019 = _2861;
    float _3021 = _2837;
    float _3023 = _2855;
    float _3025 = _2849;
    float _3027 = _2869;
    float _3029 = fma(_2064, -0.5, 0.5);
    float _3031 = precise::clamp(_3029, 0.0, 1.0);
    float _3033 = -_3017;
    float _3035 = _3033 + _3019;
    float _3037 = _2833 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3039 = -_3021;
    float _3041 = _3039 + _3023;
    float _3043 = fma(_3031, _3035, _3017);
    out.m_91.x = 0.0;
    float _3045 = -_3025;
    float _3047 = _3045 + _3027;
    float _3049 = fma(_3031, _3041, _3021);
    float _3051 = _3043 * 0.586610972881317138671875;
    out.m_51.x = _3037;
    bool _3053 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3055 = fma(_3031, _3047, _3025);
    float _3057 = fma(_3049, 0.298911988735198974609375, _3051);
    bool _3059 = _2711 > 0.0;
    bool _3061 = isnan(_2711);
    bool _3063 = _3059 || _3061;
    bool _3065 = isnan(0.0);
    bool _3067 = _3063 || _3065;
    float _3069 = fma(_3055, 0.114477999508380889892578125, _3057);
    bool _3071 = _2769 <= 0.0;
    bool _3073 = !_3067;
    bool _3075 = _3071 || _3073;
    float _3077 = -_3069;
    float _3079 = _3049 + _3077;
    float _3081 = -_3069;
    float _3083 = _3043 + _3081;
    float _3085 = -_3069;
    float _3087 = _3055 + _3085;
    float _3089 = fma(_3079, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    float _3091 = fma(_3083, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    float _3093 = fma(_3087, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3069);
    bool _3095 = !_3053;
    if (!_3095)
    {
        float _3097 = -_2170;
        float _3099 = _3097 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3101 = -_2174;
        float _3103 = _3101 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3105 = -_2178;
        float _3107 = _3105 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3109 = _3099 * _3099;
        float _3111 = fma(_3103, _3103, _3109);
        float _3113 = fma(_3107, _3107, _3111);
        float _3115 = sqrt(_3113);
        float _3117 = rsqrt(_3113);
        float _3119 = -_3115;
        float _3121 = _3119 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3123 = _3121 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3125 = precise::clamp(_3123, 0.0, 1.0);
        float _3127 = _3103 * _3117;
        float _3129 = _3099 * _3117;
        float _3131 = abs(_3125);
        float _3133 = log2(_3131);
        float _3135 = _3107 * _3117;
        float _3137 = _3127 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3139 = _2064 * _3129;
        float _3141 = -_3129;
        float _3143 = -_3137;
        float _3145 = fma(_3141, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3143);
        float _3147 = fma(_2060, _3127, _3139);
        float _3149 = -_3135;
        float _3151 = fma(_3149, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3145);
        float _3153 = fma(_2066, _3135, _3147);
        float _3155 = precise::clamp(_3153, 0.0, 1.0);
        float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3159 = _3151 + _3157;
        float _3161 = _3133 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3163 = _3159 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3165 = precise::clamp(_3163, 0.0, 1.0);
        float _3167 = exp2(_3161);
        float _3169 = _3167 * _3165;
        float _3171 = _3155 * _3169;
        float _3173 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3175 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3177 = _3171 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_91.x = _3173;
        out.m_91.y = _3175;
        out.m_91.z = _3177;
    }
    out.m_93.x = _3089;
    out.m_93.y = _3091;
    out.m_93.z = _3093;
    if (!_3075)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3179 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3179;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

