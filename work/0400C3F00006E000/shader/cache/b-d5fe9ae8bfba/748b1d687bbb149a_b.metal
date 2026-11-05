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
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_73 [[user(locn0)]];
    float4 m_67 [[user(locn1)]];
    float4 m_89 [[user(locn2)]];
    float4 m_65 [[user(locn3)]];
    float4 m_51 [[user(locn4)]];
    float4 m_77 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_71 [[user(locn7)]];
    float4 m_83 [[user(locn8)]];
    float4 m_81 [[user(locn9)]];
    float4 m_87 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 m_79 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_75 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_69 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2520 = false;
    bool _350 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = _105;
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_132);
        out.gl_Position.z = _2830;
    }
    if (!_118)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_110);
    bool _148 = _114 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _122;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2885 = as_type<float>(_158);
        out.gl_Position.z = _2885;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _114 * _160;
    bool _166 = !_162;
    float _168 = _164;
    float _186;
    if (!_166)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _164;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    bool _212 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _214 = isnan(_190);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    float _248 = 1.0 / _226;
    float _250 = _242 * _246;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _230;
    float _264 = _222 * _254;
    float _266 = -_222;
    float _268 = _266 + 1.0;
    float _270 = _194 * _248;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _276;
    float _280 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = fma(_278, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _286 = _210 * _262;
    float _288 = _280 * _264;
    float _290 = _282 * _264;
    float _292 = _284 * _264;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _308 = fma(_296, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _310 = fma(_300, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _312 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _314 = fma(_304, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_308, _250, _306);
    float _320 = fma(_310, _250, _312);
    float _322 = fma(_314, _250, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_260;
    float _348;
    if (!_330)
    {
        float _332 = in.m_55.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        _348 = _164;
    }
    _350 = false;
    float _352 = _348;
    float _354 = in.m_57.x;
    float _356 = in.m_57.y;
    float _358 = in.m_57.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _382 = -_374;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _378;
    float _388 = _328 * _358;
    float _390 = _326 * _356;
    float _392 = _362 * _386;
    bool _394 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _396 = isnan(_352);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _404 * _384;
    float _420 = fma(_408, _392, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _422 = fma(_416, _392, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _424 = fma(_412, _392, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _426 = -_404;
    float _428 = _426 + 1.0;
    float _430 = _420 * _418;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _442 = _324 * _354;
    float _444 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].x, _436);
    float _446 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].y, _438);
    float _448 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].z, _440);
    bool _450 = !_380;
    if (!_450)
    {
        float _452 = in.m_55.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _168 = _466;
    }
    float _468 = _168;
    float _470 = in.m_55.z;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = in.m_55.x;
    float _480 = in.m_55.y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _484 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _486 = int(_484);
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _490 = _474 * _114;
    float _492 = _470 * 2.0;
    float _494 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _496 = _480 * 2.0;
    float _498 = floor(_492);
    float _500 = _478 * 2.0;
    float _502 = -_482;
    float _504 = fma(_494, 2.0, _502);
    float _506 = _480 + _478;
    float _508 = _480 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _510 = _480 + _470;
    float _512 = -_114;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _504);
    float _516 = _506 + (-1.0);
    float _518 = exp2(_490);
    float _520 = fma(_508, -2.0, _488);
    float _522 = _510 + (-1.0);
    float _524 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _528 = 1.0 + _526;
    float _530 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _520);
    bool _532 = _498 >= 0.0;
    bool _534 = isnan(_498);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = floor(_500);
    float _544 = float(_486);
    float _546 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    bool _560 = !_554;
    int _562 = _560 ? 0 : 1;
    float _564 = floor(_496);
    bool _566 = _498 > 0.0;
    int _568 = _540 ? 0 : 1;
    bool _570 = !_550;
    int _572 = _570 ? 0 : 1;
    int _574 = ~_568;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = 1.0 / _544;
    bool _582 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _590 = _586 || _588;
    bool _592 = _542 > 0.0;
    bool _594 = _542 >= 0.0;
    bool _596 = isnan(_542);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    int _604 = _578;
    if (!_566)
    {
        int _606 = ~_568;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = -_518;
    float _614 = _612 + 1.0;
    bool _616 = _564 > 0.0;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _620 = int(_618);
    bool _622 = _564 >= 0.0;
    bool _624 = isnan(_564);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = in.m_59.x;
    float _634 = in.m_59.y;
    float _636 = in.m_59.z;
    bool _638 = !_558;
    int _640 = _638 ? 0 : 1;
    float _642 = _580 * _114;
    float _644 = _590 ? _614 : 0.0;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _658 = _656 != 0;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _662 = 1.0 / _528;
    int _664 = _602 ? 0 : 1;
    float _666 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].z, _646);
    bool _668 = !_650;
    int _670 = _668 ? 0 : 1;
    float _672 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[78].w, _660);
    bool _674 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(1.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _666);
    int _686 = abs(_670);
    float _688 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _672);
    float _690 = float(_610);
    float _692 = float(_620);
    float _694 = float(_686);
    bool _696 = !_654;
    int _698 = _696 ? 0 : 1;
    float _700 = _692 * _114;
    if (_682)
    {
        float _702 = _644 * _662;
        _124 = _702;
    }
    float _704 = _124;
    float _706 = _694 * _690;
    int _708 = ~_664;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    int _714 = _712;
    if (!_592)
    {
        int _716 = ~_664;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = _706 * (-2.0);
    int _724 = abs(_698);
    float _726 = _478 + (-0.5);
    bool _728 = !_658;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_722, _632, _632);
    float _734 = float(_720);
    float _736 = float(_724);
    float _738 = fma(_524, _722, _524);
    int _740 = abs(_730);
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[196].x, _732);
    int _744 = _630 ? 0 : 1;
    float _746 = _736 * _734;
    float _748 = fma(_738, _704, _742);
    int _750 = ~_744;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _746 * (-2.0);
    int _758 = _754;
    if (!_616)
    {
        int _760 = ~_744;
        int _762 = _760 + 1;
        _758 = _762;
    }
    int _764 = _758;
    float _766 = _480 + (-0.5);
    float _768 = _748 * 0.15915493667125701904296875;
    float _770 = fma(_756, _634, _634);
    float _772 = float(_764);
    float _774 = fma(_546, _756, _546);
    float _776 = float(_740);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].y, _770);
    float _780 = _470 + _478;
    float _782 = in.m_61.x;
    float _784 = in.m_61.y;
    float _786 = in.m_61.z;
    float _788 = _768 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _776 * _772;
    float _794 = fma(_774, _704, _778);
    float _796 = _780 + (-1.0);
    float _798 = _792 * (-2.0);
    float _800 = _794 * 0.15915493667125701904296875;
    float _802 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _804 = fma(_798, _636, _636);
    float _806 = _470 + (-0.5);
    float _808 = _768 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = in.m_46.x;
    float _814 = in.m_46.y;
    float _816 = in.m_46.z;
    float _818 = fma(_802, _798, _802);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _804);
    float _822 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_818, _704, _820);
    float _826 = _800 * 6.283185482025146484375;
    float _828 = sin(_826);
    bool _830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _832 = isnan(0.5);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _838 = _834 || _836;
    float _840 = _824 * 0.15915493667125701904296875;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _782);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _784);
    bool _846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _848 = isnan(0.5);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _854 = _850 || _852;
    float _856 = _800 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _822 * _842;
    float _862 = _476 * _844;
    float _864 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _786);
    float _868 = _840 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = _814 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _874 = _814 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = _814 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = _864 * _866;
    float _880 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[4].x, _872);
    float _882 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _884 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _886 = _840 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _810 * _858;
    float _892 = _790 * _828;
    float _894 = _790 * _858;
    float _896 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[4].z, _880);
    float _898 = _790 * _870;
    float _900 = _810 * _828;
    float _902 = _810 * _870;
    float _904 = _858 * _870;
    float _906 = _828 * _870;
    float _908 = _898 * _862;
    float _910 = _902 * _862;
    float _912 = _896 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = fma(_888, _890, _892);
    float _916 = fma(_888, _892, _890);
    float _918 = -_862;
    float _920 = _888 * _918;
    float _922 = -_900;
    float _924 = fma(_888, _894, _922);
    float _926 = -_894;
    float _928 = fma(_888, _900, _926);
    float _930 = fma(_914, _860, _910);
    float _932 = fma(_904, _860, _920);
    float _934 = fma(_924, _860, _908);
    float _936 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[5].z, _882);
    float _938 = fma(_928, _878, _930);
    float _940 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[6].z, _884);
    float _942 = fma(_906, _878, _932);
    float _944 = fma(_916, _878, _934);
    float _946 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _950 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _946);
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].x, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _962 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _954);
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _956);
    float _966 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _958);
    float _968 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _960);
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _972 = _964 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _974 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[11].z, _966);
    float _976 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[10].z, _968);
    float _978 = _952 + _970;
    float _980 = _912 + _972;
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _984 = _976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _978 + _986;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _992 = _980 + _990;
    float _994 = 1.0 / _982;
    float _996 = _984 + _982;
    float _998 = _988 * _988;
    float _1000 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = fma(_992, _992, _998);
    float _1004 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1006 = sqrt(_1002);
    float _1008 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1004);
    float _1010 = _996 * _994;
    float _1012 = _1010 * 0.5;
    float _1014 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1018 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1016);
    float _1020 = _950 + _1014;
    bool _1022 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1024 = 1.0 / _1018;
    float _1026 = _1014;
    float _1028 = _1000;
    float _1030 = _944;
    float _1032 = _938;
    float _1034 = _992;
    if (!_1022)
    {
        _1026 = _980;
    }
    float _1036 = _1026;
    float _1038 = _1036;
    if (!_1022)
    {
        _1028 = _978;
    }
    float _1040 = _1028;
    float _1042 = _1040;
    if (!_1022)
    {
        _1030 = _1020;
    }
    float _1044 = _1030;
    bool _1046 = !_1022;
    float _1048 = _1044;
    if (!_1046)
    {
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1054 = _1006 + _1052;
        float _1056 = rsqrt(_1002);
        float _1058 = _1054 * _1050;
        float _1060 = _1020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = _1058 * 0.15915493667125701904296875;
        float _1064 = _1062 * 6.283185482025146484375;
        float _1066 = cos(_1064);
        float _1068 = _1062 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 + (-1.0);
        float _1074 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = fma(_1020, _1066, _1074);
        float _1080 = _1056 * _1076;
        float _1082 = fma(_992, _1080, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1084 = fma(_988, _1080, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1042 = _1084;
        _1038 = _1082;
        _1048 = _1078;
        _1032 = _1076;
    }
    float _1086 = _1042;
    float _1088 = _1038;
    float _1090 = _1048;
    float _1092 = _1032;
    float _1094 = _1092;
    float _1096 = _1090;
    float _1098 = _1088;
    if (_854)
    {
        _1094 = 1.0;
    }
    float _1100 = _1094;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1104 = _1024 * _1102;
    float _1106 = _1100;
    if (_838)
    {
        _1034 = _1086;
    }
    float _1108 = _1034;
    float _1110 = _1108;
    if (!_838)
    {
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1114 = _950 + _1112;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1118 = _912 + _1116;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1122 = -_912;
        float _1124 = _1122 + _1088;
        float _1126 = _1114 * _1114;
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1130 = _952 + _1128;
        float _1132 = -_952;
        float _1134 = _1132 + _1086;
        float _1136 = fma(_1118, _1118, _1126);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = fma(_1130, _1130, _1136);
        float _1142 = sqrt(_1140);
        float _1144 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1138;
        float _1150 = -_950;
        float _1152 = _1150 + _1090;
        float _1154 = _1144 * _1148;
        float _1156 = fma(_1152, _1154, _950);
        float _1158 = fma(_1124, _1154, _912);
        float _1160 = fma(_1134, _1154, _952);
        _1096 = _1156;
        _1098 = _1158;
        _1110 = _1160;
    }
    float _1162 = _1096;
    float _1164 = _1098;
    float _1166 = _1110;
    if (!_854)
    {
        float _1168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1170 = _1168 * 0.15915493667125701904296875;
        float _1172 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1174 = _1170 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        float _1178 = _1172 * 0.15915493667125701904296875;
        float _1180 = _1170 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = 1.0 / _1176;
        float _1186 = _1178 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1182 * _1184;
        float _1192 = _1178 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1188 * _1190;
        float _1198 = 1.0 / _1196;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = 1.0 / _1202;
        float _1206 = _1194 * _1198;
        float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1210 = fma(_1104, _1206, _1208);
        float _1212 = _1210 * _1204;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1106 = _1214;
    }
    float _1216 = _1106;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1162 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1164 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1166 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1234 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1236 = fma(_1224, _1224, _1230);
    float _1238 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1240 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1234);
    float _1242 = fma(_1228, _1228, _1236);
    float _1244 = rsqrt(_1242);
    float _1246 = sqrt(_1242);
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1250 = _1224 * _1248;
    float _1252 = _1228 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 + _1256;
    float _1260 = sqrt(_1258);
    bool _1262 = _1260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _1260 + _1264;
    float _1268 = _982;
    float _1270 = _1258;
    float _1272 = _1266;
    float _1274 = _1220;
    float _1276 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1278 = _1250;
    float _1280 = _1252;
    float _1282 = _1254;
    if (_1262)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1284;
    }
    float _1286 = _1268;
    if (_1262)
    {
        float _1288 = rsqrt(_1258);
        _1270 = _1288;
    }
    float _1290 = _1270;
    if (_1262)
    {
        float _1292 = _1266 * _1286;
        _1272 = _1292;
    }
    float _1294 = _1272;
    float _1296 = 0.0;
    if (_1262)
    {
        float _1298 = _1294 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1262)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1286;
    float _1316 = _1312;
    if (_1262)
    {
        float _1318 = _1300 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = -_1248;
    float _1326 = -_1312;
    float _1328 = fma(_1220, _1324, _1326);
    if (_1262)
    {
        float _1330 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1330;
    }
    float _1332 = _1274;
    float _1334 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1336 = _1308;
    if (_1262)
    {
        float _1338 = fma(_1308, _1332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1316 = _1338;
    }
    float _1340 = _1316;
    float _1342 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1334);
    float _1344 = floor(_1238);
    float _1346 = _1340;
    float _1348 = _1322;
    if (_1262)
    {
        float _1350 = _1322 + (-1.0);
        _1336 = _1350;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (_1262)
    {
        float _1356 = _1290 * _1340;
        _1276 = _1356;
    }
    float _1358 = _1276;
    if (!_1262)
    {
        _1346 = _1328;
    }
    float _1360 = _1346;
    float _1362 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1342);
    float _1364 = _1360;
    if (_1262)
    {
        float _1366 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1354 = _1366;
    }
    float _1368 = _1354;
    if (_1262)
    {
        float _1370 = _1250 * _1358;
        _1278 = _1370;
    }
    float _1372 = _1278;
    if (_1262)
    {
        float _1374 = _1252 * _1358;
        _1280 = _1374;
    }
    float _1376 = _1280;
    if (_1262)
    {
        float _1378 = fma(_1328, _1322, _1368);
        _1364 = _1378;
    }
    float _1380 = _1364;
    if (_1262)
    {
        float _1382 = _1372 * _1372;
        _1282 = _1382;
    }
    float _1384 = _1282;
    if (!_1262)
    {
        _1348 = _1256;
    }
    float _1386 = _1348;
    float _1388 = _1386;
    if (_1262)
    {
        float _1390 = _1376 * _1376;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1380, _1380, _1384);
    float _1396 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1240);
    float _1398 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1400 = _1394 + _1392;
    float _1402 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1406 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1410 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1408);
    float _1412 = precise::clamp(_1410, 0.0, 1.0);
    float _1414 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = rsqrt(_1400);
    float _1418 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1420 = -_1412;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1232);
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1428 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1424);
    float _1434 = abs(_1422);
    float _1436 = log2(_1434);
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1440 = -_1344;
    float _1442 = _1238 + _1440;
    float _1444 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = -_1430;
    float _1448 = fma(_1446, _1404, 1.0);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1426);
    float _1452 = _1416 * _1372;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1376;
    float _1458 = floor(_1402);
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1462 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1464 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1466 = -_1460;
    float _1468 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1466);
    float _1470 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1472 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1474 = log2(_1448);
    float _1476 = -_1456;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1468);
    float _1480 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1464);
    float _1484 = fma(_1478, -0.5, 0.5);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = exp2(_1470);
    float _1492 = -_1458;
    float _1494 = _1402 + _1492;
    float _1496 = fma(_1486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = _1454 + 1.0;
    float _1500 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1502 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1504 = fma(_1486, _1496, -0.212114393711090087890625);
    float _1506 = 1.0 / _1472;
    float _1508 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1510 = fma(_1486, _1504, 1.570728778839111328125);
    float _1512 = _1474 * 0.693147182464599609375;
    float _1514 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = sqrt(_1484);
    float _1518 = -_1454;
    float _1520 = fma(_1490, _1498, _1518);
    float _1522 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1524 = _1508 * _1506;
    float _1526 = _1522 * _1506;
    float _1528 = fma(_1524, 0.5, 0.5);
    float _1530 = fma(_1526, -0.5, 0.5);
    float _1532 = _1516 * 0.636619746685028076171875;
    float _1534 = -_1510;
    float _1536 = fma(_1532, _1534, 1.0);
    float _1538 = fma(_1520, 0.5, 0.5);
    float2 _5063 = float2(_1442, _1494);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).x;
    float3 _5074 = float3(_1528, _1530, _1514);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5074, float3(0.0), isnan(_5074)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5074, float3(0.0), isnan(_5074)), level(0.0)).x;
    float3 _5085 = float3(_1528, _1530, _1514);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5085, float3(0.0), isnan(_5085)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5085, float3(0.0), isnan(_5085)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _5101 = float2(_1536, _1538);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5101, float2(0.0), isnan(_5101)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5101, float2(0.0), isnan(_5101)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = float(uint(_620));
    float _1567 = trunc(_642);
    int _1569 = int(_1567);
    float _1571 = _700 * _160;
    bool _1573 = _620 == 0;
    float _1575 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1577 = ~_620;
    int _1579 = _1577 + 1;
    int _1581 = _620 + (-1);
    float _1583 = 1.0 / _1565;
    int _1585 = abs(_562);
    int _1587 = abs(_572);
    float _1589 = float(uint(_1569));
    float _1591 = trunc(_1571);
    int _1593 = int(_1591);
    int _1595 = as_type<int>(_1583) + (-2);
    float _1597 = exp2(_1575);
    float _1599 = as_type<float>(_1595) * _1589;
    float _1601 = trunc(_1599);
    float _1603 = precise::max(_1601, 0.0);
    uint _1606 = uint(_1603);
    int _1608 = ~_620;
    int _1610 = _1608 + 1;
    float _1612 = -_1597;
    float _1614 = _1612 + 1.0;
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1618 = _1579 * int(_1606);
    int _1620 = _1618 + _1569;
    float _1622 = float(uint(_1620));
    float _1624 = as_type<float>(_1595) * _1622;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1628 = _1626 != 0;
    float _1630 = trunc(_1624);
    float _1632 = precise::max(_1630, 0.0);
    uint _1634 = uint(_1632);
    bool _1636 = !_1628;
    float _1638 = _1636 ? 7.345489978790283203125 : 1.0;
    float _1640 = _1638 * _478;
    float _1642 = floor(_1640);
    int _1644 = int(_1606) + int(_1634);
    float _1646 = float(_1569);
    int _1648 = _1610 * _1644;
    int _1650 = _1648 + _1569;
    bool _1652 = _1646 >= _692;
    bool _1654 = isnan(_1646);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(_692);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    bool _1664 = uint(_1650) >= uint(_620);
    float _1666 = trunc(_1662);
    int _1668 = int(_1666);
    float _1670 = -_1642;
    float _1672 = _1640 + _1670;
    bool _1674 = !_1664;
    int _1676 = _1674 ? 0 : (-1);
    float _1678 = _1672 * _692;
    int _1680 = ~_1644;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    int _1686 = _620 * _1684;
    int _1688 = _1686 + _1569;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1692 = _1690 != 0;
    float _1694 = trunc(_1678);
    int _1696 = int(_1694);
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1700 = _1698 != 0;
    int _1702 = ~_1668;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = !_1573;
    int _1710 = _1708 ? _1688 : (-1);
    bool _1712 = !_1692;
    int _1714 = _1712 ? 0 : 1;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1718 = _1716 != 0;
    int _1720 = _1710 * _1706;
    int _1722 = abs(_1714);
    int _1724 = _1668 * _1581;
    int _1726 = _1724 + _1720;
    int _1728 = abs(_640);
    int _1730 = _1726 * _1585;
    int _1732 = _1696 * _1722;
    int _1734 = _1732 + _1569;
    bool _1736 = !_1718;
    int _1738 = _1736 ? 0 : 1;
    int _1740 = _1593 * _1587;
    int _1742 = _1740 + _1730;
    int _1744 = abs(_1738);
    float _1746 = in.m_63.y;
    int _1748 = ~_620;
    int _1750 = _1748 + 1;
    int _1752 = _1734 * _1728;
    int _1754 = _1752 + _1742;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1758 = _1756 != 0;
    float _1760 = as_type<float>(_1728);
    if (_1700)
    {
        float _1762 = in.m_55.x;
        _1760 = _1762;
    }
    float _1764 = _1760;
    int _1766 = _1696 * _1744;
    int _1768 = _1766 + _1754;
    float _1770 = float(uint(_1768));
    bool _1772 = _480 > 0.5;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1778 = as_type<float>(_1595) * _1770;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = trunc(_1778);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _1788 = -_1746;
    float _1790 = _1788 + 1.0;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1796 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1800 = _1798 != 0;
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _1746;
    float _1806 = _1796;
    if (_1758)
    {
        float _1808 = _1772 ? _1790 : _1746;
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1814 = _1764 > 0.5;
    bool _1816 = _1814 && _1700;
    bool _1818 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1820 = isnan(_468);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    float _1830 = 1.0 / _1776;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1832;
    float _1836 = float(uint(_1734));
    int _1838 = _1750 * int(_1786);
    int _1840 = _1838 + _1768;
    bool _1842 = _784 != 0.0;
    bool _1844 = isnan(_784);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    float _1852 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1854 = float(uint(_1840));
    float _1856 = -_530;
    float _1858 = fma(_688, _1852, _1856);
    float _1860 = in.m_63.x;
    float _1862 = as_type<float>(_1595) * _1854;
    bool _1864 = _782 == 0.0;
    bool _1866 = !_1850;
    bool _1868 = _1864 && _1866;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1872 = _1834 * _1830;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1876 = _468 + _1874;
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1886 = isnan(_468);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    out.m_67.x = _1796;
    out.m_67.y = _1802;
    out.m_67.z = _1812;
    out.m_67.w = _1870;
    float _1896 = fma(_1872, _1876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1898 = _786 == 0.0;
    bool _1900 = _1898 && _1868;
    int _1902 = int(_1786) + int(_1882);
    float _1904 = as_type<float>(_1595) * _1836;
    float _1906 = _1860;
    if (_1700)
    {
        _1806 = _1860;
    }
    float _1908 = _1806;
    float _1910 = -_1828;
    float _1912 = _1910 + 1.0;
    int _1914 = ~_620;
    int _1916 = _1914 + 1;
    float _1918 = in.m_69.x;
    float _1920 = in.m_69.y;
    float _1922 = in.m_69.z;
    int _1924 = ~_620;
    int _1926 = _1924 + 1;
    float _1928 = trunc(_1904);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    float _1934 = _1908;
    if (_1816)
    {
        float _1936 = -_1908;
        float _1938 = _1936 + 1.0;
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = _1894 * _1912;
    int _1944 = _1916 * _1902;
    int _1946 = _1944 + _1768;
    float _1948 = -_1894;
    float _1950 = _1948 + 1.0;
    if (_1700)
    {
        _1906 = _1940;
    }
    float _1952 = _1906;
    float _1954 = _1896 * _1942;
    bool _1956 = uint(_1946) >= uint(_620);
    float _1958 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1960 = !_1956;
    int _1962 = _1960 ? 0 : (-1);
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1954);
    float _1966 = fma(_684, _1958, _514);
    int _1968 = _1926 * int(_1932);
    int _1970 = _1968 + _1734;
    float _1972 = abs(_1104);
    float _1974 = log2(_1972);
    int _1976 = ~_1902;
    int _1978 = _1976 + _1962;
    int _1980 = _1978 + 1;
    float _1982 = float(uint(_1970));
    float _1984 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1964);
    int _1986 = _620 * _1980;
    int _1988 = _1986 + _1768;
    float _1990 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1992 = _1922;
    float _1994 = _1918;
    float _1996 = _1920;
    if (!_1900)
    {
        float _1998 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1922);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = as_type<float>(_1595) * _1982;
    float _2004 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2006 = !_1573;
    int _2008 = _2006 ? _1988 : (-1);
    if (!_1900)
    {
        float _2010 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1918);
        _1994 = _2010;
    }
    float _2012 = _1994;
    float _2014 = trunc(_2002);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = _1966 + 0.5;
    int _2022 = _2008 >> 31;
    float _2024 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1900)
    {
        float _2026 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1920);
        _1996 = _2026;
    }
    float _2028 = _1996;
    float _2030 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2032 = _2022 & 3;
    float _2034 = _1858 + 0.5;
    float _2036 = exp2(_2024);
    int _2038 = ~_620;
    int _2040 = _2038 + 1;
    float _2042 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2044 = _2008 + _2032;
    float _2046 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2052 = _902 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2054 = int(_1932) + int(_2018);
    float _2056 = _902 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_71.x = _2020;
    out.m_71.y = _2034;
    float _2058 = _902 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2060 = -_888;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2052);
    int _2064 = _2040 * _2054;
    int _2066 = _2064 + _1734;
    float _2068 = -_888;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2056);
    out.m_73.x = _2042;
    out.m_73.y = _2046;
    out.m_73.z = _2048;
    out.m_73.w = _2050;
    float _2072 = -_888;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2058);
    int _2076 = _2008 & 3;
    bool _2078 = _2076 != 0;
    float _2080 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2082 = uint(_2066) >= uint(_620);
    float _2084 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2062);
    int _2086 = _2044 >> 2;
    float _2088 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2074);
    bool _2090 = _1104 <= 8000.0;
    bool _2092 = isnan(_1104);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(8000.0);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2084 * _2028;
    int _2104 = _2086 << 4;
    int _2106 = _2104 + 368;
    float _2108 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2070);
    float _2114 = _914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2116 = uint(int(uint(_2106) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = _914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = _914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2136 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    float _2138 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2140 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2142 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    int _2144 = _2008 & 3;
    bool _2146 = _2144 != 0;
    float _2148 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2150 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2152 = _2106 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    bool _2170 = uint(_2144) > 1u;
    float _2172 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2080);
    float _2174 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2150);
    int _2176 = _2078 ? 0 : 1;
    float _2178 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2136);
    float _2180 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2140);
    float _2182 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    int _2184 = ~_2176;
    int _2186 = _2184 + 1;
    int _2188 = _2186 + 1;
    float _2190 = _2112 * _2028;
    float _2192 = _2088 * _2028;
    float _2194 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    bool _2196 = uint(_2144) >= 2u;
    float _2198 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2148);
    int _2200 = _2188;
    if (!_2170)
    {
        int _2202 = ~_2176;
        int _2204 = _2202 + 1;
        _2200 = _2204;
    }
    int _2206 = _2200;
    float _2208 = fma(_2110, -2.0, 3.0);
    bool _2210 = _2144 != 3;
    float _2212 = _2110 * _2110;
    int _2214 = abs(_2206);
    float _2216 = fma(_2178, _2012, _2102);
    int _2218 = _2196 ? 0 : 1;
    float _2220 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    bool _2222 = !_2146;
    int _2224 = _2222 ? 0 : 1;
    float _2226 = fma(_2182, _2012, _2192);
    int _2228 = ~_2214;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2180, _2012, _2190);
    bool _2236 = _2144 != 3;
    float _2238 = _2212 * _2208;
    int _2240 = ~_2218;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = -_1540;
    float _2248 = _2246 + 1.0;
    int _2250 = abs(_2224);
    float _2252 = _1616 * _1542;
    int _2254 = _2244;
    float _2256 = _2252;
    if (_2210)
    {
        int _2258 = ~_2218;
        int _2260 = _2258 + 1;
        _2254 = _2260;
    }
    int _2262 = _2254;
    float _2264 = -_1616;
    float _2266 = _2264 + 1.0;
    bool _2268 = !_2236;
    int _2270 = _2268 ? 0 : (-1);
    float _2272 = fma(_2194, _2000, _2234);
    int _2274 = abs(_2262);
    int _2276 = _2232 * as_type<int>(_2130);
    bool _2278 = !_1800;
    int _2280 = _2278 ? 0 : 1;
    int _2282 = ~_2250;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = abs(_2270);
    bool _2290 = !_2082;
    int _2292 = _2290 ? 0 : (-1);
    int _2294 = _2286 * as_type<int>(_2122);
    int _2296 = _2294 + _2276;
    int _2298 = abs(_2280);
    int _2300 = ~_2274;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = ~_2054;
    int _2308 = _2306 + _2292;
    int _2310 = _2308 + 1;
    int _2312 = _2304 * as_type<int>(_2160);
    int _2314 = _2312 + _2296;
    int _2316 = ~_2288;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _620 * _2310;
    int _2324 = _2322 + _1734;
    int _2326 = ~_2298;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2334 = _2320 * as_type<int>(_2168);
    int _2336 = _2334 + _2314;
    bool _2338 = !_1573;
    int _2340 = _2338 ? _2324 : (-1);
    float _2342 = -_2238;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2332);
    int _2348 = _2336 * _2330;
    float _2350 = _1563 * _2252;
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2238);
    float _2354 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2346);
    int _2356 = _2340 * _2298;
    int _2358 = _2356 + _2348;
    float _2360 = fma(_2220, _2000, _2216);
    float _2362 = _2100 * _2352;
    float _2364 = in.m_75.x;
    float _2366 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2354);
    float _2368 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2370 = _2366 + _1472;
    float _2372 = fma(_2198, _2000, _2226);
    float _2374 = _2248 * _2368;
    float _2376 = precise::clamp(_2374, 0.0, 1.0);
    float _2378 = _1553 * _2252;
    float _2380 = _2370 * 0.5;
    float _2382 = _1553 * _2266;
    float _2384 = -_2376;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2388 = fma(_1559, _2378, _1547);
    float _2390 = fma(_1561, _2378, _1549);
    out.m_77.z = _2380;
    out.m_77.w = _1472;
    float _2392 = fma(_1553, _2350, _1551);
    bool _2394 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2396 = isnan(_1246);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2402 = _2398 || _2400;
    out.gl_Position.x = _1508;
    out.gl_Position.y = _1522;
    out.gl_Position.z = _2366;
    out.gl_Position.w = _1472;
    float _2404 = float(_2358);
    out.m_79.x = _2388;
    out.m_79.y = _2390;
    out.m_79.z = _2392;
    out.m_79.w = _2382;
    float _2406 = _2386 * _2364;
    float _2408 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _2360;
    out.m_81.y = _2272;
    out.m_81.z = _2372;
    float _2410 = _2406 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2412 = _2362;
    float _2414 = _2378;
    float _2416 = _2350;
    float _2418 = _2406;
    float _2420 = _2404;
    if (!_2402)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2422 = _2412;
    out.m_83.x = _2404;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2402)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2428 = _2414;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2402)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2434 = _2416;
    out.m_85.x = _2410;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2402)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2440 = _2256;
    float _2442 = _2440;
    float _2444 = _2440;
    if (!_2402)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2446 = _2418;
    float _2448 = _2446;
    float _2450 = _2446;
    if (!_2402)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _2420;
    bool _2454 = !_2402;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2462 = isnan(_1246);
        bool _2464 = _2460 || _2462;
        bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2468 = _2464 || _2466;
        if (!_2468)
        {
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = _1246 + _2470;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2476 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2474;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2482 = 1.0 / _2476;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2500 = _2472 * _2482;
            float _2502 = precise::clamp(_2500, 0.0, 1.0);
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2508 = fma(_2502, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2502, _2506, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2512 = fma(_2502, _2486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2514 = fma(_2502, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2516 = fma(_2502, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2518 = fma(_2502, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2426 = _2512;
            _2444 = _2516;
            _2458 = _2508;
            _2438 = _2514;
            _2432 = _2510;
            _2450 = _2518;
            _2520 = true;
        }
        else
        {
            bool _2522 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2524 = isnan(_1246);
            bool _2526 = _2522 || _2524;
            bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2530 = _2526 || _2528;
            if (!_2530)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2532 = _2456;
            _2458 = _2532;
            if (!_2530)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2534 = _2424;
            _2426 = _2534;
            if (!_2530)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2536 = _2430;
            _2432 = _2536;
            if (!_2530)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2538 = _2436;
            _2438 = _2538;
            if (!_2530)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2540 = _2442;
            _2444 = _2540;
            if (!_2530)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2542 = _2448;
            bool _2544 = !_2530;
            _2450 = _2542;
            if (!_2544)
            {
                bool _2546 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2548 = isnan(_1246);
                bool _2550 = _2546 || _2548;
                bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2554 = _2550 || _2552;
                if (!_2554)
                {
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = _1246 + _2556;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2562 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2560;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2568 = 1.0 / _2562;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2586 = _2558 * _2568;
                    float _2588 = precise::clamp(_2586, 0.0, 1.0);
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2594 = fma(_2588, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2596 = fma(_2588, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2598 = fma(_2588, _2572, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2600 = fma(_2588, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2602 = fma(_2588, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2604 = fma(_2588, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2426 = _2598;
                    _2444 = _2602;
                    _2458 = _2594;
                    _2438 = _2600;
                    _2432 = _2596;
                    _2450 = _2604;
                    _2520 = true;
                }
                else
                {
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2520 = false;
    float _2606 = _2426;
    float _2608 = _2444;
    float _2610 = _2458;
    float _2612 = _2438;
    float _2614 = _2432;
    float _2616 = _2450;
    float _2618 = _2408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2620 = fma(_2272, -0.5, 0.5);
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    float _2624 = -_2606;
    float _2626 = _2624 + _2608;
    float _2628 = -_2610;
    float _2630 = _2628 + _2612;
    out.m_53.x = _2618;
    float _2632 = -_2614;
    float _2634 = _2632 + _2616;
    float _2636 = fma(_2622, _2626, _2606);
    float _2638 = fma(_2622, _2630, _2610);
    bool _2640 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2642 = _2636 * 0.586610972881317138671875;
    float _2644 = fma(_2622, _2634, _2614);
    out.m_87.x = 0.0;
    bool _2646 = _1216 > 0.0;
    bool _2648 = isnan(_1216);
    bool _2650 = _2646 || _2648;
    bool _2652 = isnan(0.0);
    bool _2654 = _2650 || _2652;
    float _2656 = fma(_2638, 0.298911988735198974609375, _2642);
    float _2658 = fma(_2644, 0.114477999508380889892578125, _2656);
    float _2660 = -_2658;
    float _2662 = _2638 + _2660;
    float _2664 = -_2658;
    float _2666 = _2636 + _2664;
    float _2668 = -_2658;
    float _2670 = _2644 + _2668;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    float _2674 = fma(_2666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    float _2676 = fma(_2670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    bool _2678 = !_2640;
    if (!_2678)
    {
        float _2680 = -_1162;
        float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2684 = -_1164;
        float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2688 = -_1166;
        float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2692 = _2682 * _2682;
        float _2694 = fma(_2686, _2686, _2692);
        float _2696 = fma(_2690, _2690, _2694);
        float _2698 = sqrt(_2696);
        float _2700 = rsqrt(_2696);
        float _2702 = -_2698;
        float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2706 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2708 = precise::clamp(_2706, 0.0, 1.0);
        float _2710 = _2686 * _2700;
        float _2712 = _2682 * _2700;
        float _2714 = abs(_2708);
        float _2716 = log2(_2714);
        float _2718 = _2690 * _2700;
        float _2720 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2722 = _2272 * _2712;
        float _2724 = -_2712;
        float _2726 = -_2720;
        float _2728 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2726);
        float _2730 = fma(_2360, _2710, _2722);
        float _2732 = -_2718;
        float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2728);
        float _2736 = fma(_2372, _2718, _2730);
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2742 = _2734 + _2740;
        float _2744 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2746 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2748 = precise::clamp(_2746, 0.0, 1.0);
        float _2750 = exp2(_2744);
        float _2752 = _2750 * _2748;
        float _2754 = _2738 * _2752;
        float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2760 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2756;
        out.m_87.y = _2758;
        out.m_87.z = _2760;
    }
    out.m_89.x = _2672;
    out.m_89.y = _2674;
    out.m_89.z = _2676;
    if (_2654)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2762 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2762;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2520 = false;
    bool _350 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = _105;
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_132);
        out.gl_Position.z = _2830;
    }
    if (!_118)
    {
        return out;
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_110);
    bool _148 = _114 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _122;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2885 = as_type<float>(_158);
        out.gl_Position.z = _2885;
    }
    if (_152)
    {
        return out;
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _114 * _160;
    bool _166 = !_162;
    float _168 = _164;
    float _186;
    if (!_166)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _164;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    bool _212 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _214 = isnan(_190);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    float _248 = 1.0 / _226;
    float _250 = _242 * _246;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _230;
    float _264 = _222 * _254;
    float _266 = -_222;
    float _268 = _266 + 1.0;
    float _270 = _194 * _248;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _276;
    float _280 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = fma(_278, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _286 = _210 * _262;
    float _288 = _280 * _264;
    float _290 = _282 * _264;
    float _292 = _284 * _264;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _308 = fma(_296, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _310 = fma(_300, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _312 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _314 = fma(_304, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_308, _250, _306);
    float _320 = fma(_310, _250, _312);
    float _322 = fma(_314, _250, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_260;
    float _348;
    if (!_330)
    {
        float _332 = in.m_55.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        _348 = _164;
    }
    _350 = false;
    float _352 = _348;
    float _354 = in.m_57.x;
    float _356 = in.m_57.y;
    float _358 = in.m_57.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _382 = -_374;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _378;
    float _388 = _328 * _358;
    float _390 = _326 * _356;
    float _392 = _362 * _386;
    bool _394 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _396 = isnan(_352);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _404 * _384;
    float _420 = fma(_408, _392, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _422 = fma(_416, _392, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _424 = fma(_412, _392, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _426 = -_404;
    float _428 = _426 + 1.0;
    float _430 = _420 * _418;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _442 = _324 * _354;
    float _444 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].x, _436);
    float _446 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].y, _438);
    float _448 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].z, _440);
    bool _450 = !_380;
    if (!_450)
    {
        float _452 = in.m_55.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _168 = _466;
    }
    float _468 = _168;
    float _470 = in.m_55.z;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = in.m_55.x;
    float _480 = in.m_55.y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _484 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _486 = int(_484);
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _490 = _474 * _114;
    float _492 = _470 * 2.0;
    float _494 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _496 = _480 * 2.0;
    float _498 = floor(_492);
    float _500 = _478 * 2.0;
    float _502 = -_482;
    float _504 = fma(_494, 2.0, _502);
    float _506 = _480 + _478;
    float _508 = _480 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _510 = _480 + _470;
    float _512 = -_114;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _504);
    float _516 = _506 + (-1.0);
    float _518 = exp2(_490);
    float _520 = fma(_508, -2.0, _488);
    float _522 = _510 + (-1.0);
    float _524 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _528 = 1.0 + _526;
    float _530 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _520);
    bool _532 = _498 >= 0.0;
    bool _534 = isnan(_498);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = floor(_500);
    float _544 = float(_486);
    float _546 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    bool _560 = !_554;
    int _562 = _560 ? 0 : 1;
    float _564 = floor(_496);
    bool _566 = _498 > 0.0;
    int _568 = _540 ? 0 : 1;
    bool _570 = !_550;
    int _572 = _570 ? 0 : 1;
    int _574 = ~_568;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = 1.0 / _544;
    bool _582 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _590 = _586 || _588;
    bool _592 = _542 > 0.0;
    bool _594 = _542 >= 0.0;
    bool _596 = isnan(_542);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    int _604 = _578;
    if (!_566)
    {
        int _606 = ~_568;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = -_518;
    float _614 = _612 + 1.0;
    bool _616 = _564 > 0.0;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _620 = int(_618);
    bool _622 = _564 >= 0.0;
    bool _624 = isnan(_564);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = in.m_59.x;
    float _634 = in.m_59.y;
    float _636 = in.m_59.z;
    bool _638 = !_558;
    int _640 = _638 ? 0 : 1;
    float _642 = _580 * _114;
    float _644 = _590 ? _614 : 0.0;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _658 = _656 != 0;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _662 = 1.0 / _528;
    int _664 = _602 ? 0 : 1;
    float _666 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].z, _646);
    bool _668 = !_650;
    int _670 = _668 ? 0 : 1;
    float _672 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[78].w, _660);
    bool _674 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(1.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _666);
    int _686 = abs(_670);
    float _688 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _672);
    float _690 = float(_610);
    float _692 = float(_620);
    float _694 = float(_686);
    bool _696 = !_654;
    int _698 = _696 ? 0 : 1;
    float _700 = _692 * _114;
    if (_682)
    {
        float _702 = _644 * _662;
        _124 = _702;
    }
    float _704 = _124;
    float _706 = _694 * _690;
    int _708 = ~_664;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    int _714 = _712;
    if (!_592)
    {
        int _716 = ~_664;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = _706 * (-2.0);
    int _724 = abs(_698);
    float _726 = _478 + (-0.5);
    bool _728 = !_658;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_722, _632, _632);
    float _734 = float(_720);
    float _736 = float(_724);
    float _738 = fma(_524, _722, _524);
    int _740 = abs(_730);
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[196].x, _732);
    int _744 = _630 ? 0 : 1;
    float _746 = _736 * _734;
    float _748 = fma(_738, _704, _742);
    int _750 = ~_744;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _746 * (-2.0);
    int _758 = _754;
    if (!_616)
    {
        int _760 = ~_744;
        int _762 = _760 + 1;
        _758 = _762;
    }
    int _764 = _758;
    float _766 = _480 + (-0.5);
    float _768 = _748 * 0.15915493667125701904296875;
    float _770 = fma(_756, _634, _634);
    float _772 = float(_764);
    float _774 = fma(_546, _756, _546);
    float _776 = float(_740);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].y, _770);
    float _780 = _470 + _478;
    float _782 = in.m_61.x;
    float _784 = in.m_61.y;
    float _786 = in.m_61.z;
    float _788 = _768 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _776 * _772;
    float _794 = fma(_774, _704, _778);
    float _796 = _780 + (-1.0);
    float _798 = _792 * (-2.0);
    float _800 = _794 * 0.15915493667125701904296875;
    float _802 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _804 = fma(_798, _636, _636);
    float _806 = _470 + (-0.5);
    float _808 = _768 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = in.m_46.x;
    float _814 = in.m_46.y;
    float _816 = in.m_46.z;
    float _818 = fma(_802, _798, _802);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _804);
    float _822 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_818, _704, _820);
    float _826 = _800 * 6.283185482025146484375;
    float _828 = sin(_826);
    bool _830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _832 = isnan(0.5);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _838 = _834 || _836;
    float _840 = _824 * 0.15915493667125701904296875;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _782);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _784);
    bool _846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _848 = isnan(0.5);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _854 = _850 || _852;
    float _856 = _800 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _822 * _842;
    float _862 = _476 * _844;
    float _864 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _786);
    float _868 = _840 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = _814 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _874 = _814 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = _814 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = _864 * _866;
    float _880 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[4].x, _872);
    float _882 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _884 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _886 = _840 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _810 * _858;
    float _892 = _790 * _828;
    float _894 = _790 * _858;
    float _896 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[4].z, _880);
    float _898 = _790 * _870;
    float _900 = _810 * _828;
    float _902 = _810 * _870;
    float _904 = _858 * _870;
    float _906 = _828 * _870;
    float _908 = _898 * _862;
    float _910 = _902 * _862;
    float _912 = _896 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = fma(_888, _890, _892);
    float _916 = fma(_888, _892, _890);
    float _918 = -_862;
    float _920 = _888 * _918;
    float _922 = -_900;
    float _924 = fma(_888, _894, _922);
    float _926 = -_894;
    float _928 = fma(_888, _900, _926);
    float _930 = fma(_914, _860, _910);
    float _932 = fma(_904, _860, _920);
    float _934 = fma(_924, _860, _908);
    float _936 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[5].z, _882);
    float _938 = fma(_928, _878, _930);
    float _940 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[6].z, _884);
    float _942 = fma(_906, _878, _932);
    float _944 = fma(_916, _878, _934);
    float _946 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _950 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _946);
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].x, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _962 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _954);
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _956);
    float _966 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _958);
    float _968 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _960);
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _972 = _964 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _974 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[11].z, _966);
    float _976 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[10].z, _968);
    float _978 = _952 + _970;
    float _980 = _912 + _972;
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _984 = _976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _978 + _986;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _992 = _980 + _990;
    float _994 = 1.0 / _982;
    float _996 = _984 + _982;
    float _998 = _988 * _988;
    float _1000 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = fma(_992, _992, _998);
    float _1004 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1006 = sqrt(_1002);
    float _1008 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1004);
    float _1010 = _996 * _994;
    float _1012 = _1010 * 0.5;
    float _1014 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1018 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1016);
    float _1020 = _950 + _1014;
    bool _1022 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1024 = 1.0 / _1018;
    float _1026 = _1014;
    float _1028 = _1000;
    float _1030 = _944;
    float _1032 = _938;
    float _1034 = _992;
    if (!_1022)
    {
        _1026 = _980;
    }
    float _1036 = _1026;
    float _1038 = _1036;
    if (!_1022)
    {
        _1028 = _978;
    }
    float _1040 = _1028;
    float _1042 = _1040;
    if (!_1022)
    {
        _1030 = _1020;
    }
    float _1044 = _1030;
    bool _1046 = !_1022;
    float _1048 = _1044;
    if (!_1046)
    {
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1054 = _1006 + _1052;
        float _1056 = rsqrt(_1002);
        float _1058 = _1054 * _1050;
        float _1060 = _1020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = _1058 * 0.15915493667125701904296875;
        float _1064 = _1062 * 6.283185482025146484375;
        float _1066 = cos(_1064);
        float _1068 = _1062 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 + (-1.0);
        float _1074 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = fma(_1020, _1066, _1074);
        float _1080 = _1056 * _1076;
        float _1082 = fma(_992, _1080, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1084 = fma(_988, _1080, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1042 = _1084;
        _1038 = _1082;
        _1048 = _1078;
        _1032 = _1076;
    }
    float _1086 = _1042;
    float _1088 = _1038;
    float _1090 = _1048;
    float _1092 = _1032;
    float _1094 = _1092;
    float _1096 = _1090;
    float _1098 = _1088;
    if (_854)
    {
        _1094 = 1.0;
    }
    float _1100 = _1094;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1104 = _1024 * _1102;
    float _1106 = _1100;
    if (_838)
    {
        _1034 = _1086;
    }
    float _1108 = _1034;
    float _1110 = _1108;
    if (!_838)
    {
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1114 = _950 + _1112;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1118 = _912 + _1116;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1122 = -_912;
        float _1124 = _1122 + _1088;
        float _1126 = _1114 * _1114;
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1130 = _952 + _1128;
        float _1132 = -_952;
        float _1134 = _1132 + _1086;
        float _1136 = fma(_1118, _1118, _1126);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = fma(_1130, _1130, _1136);
        float _1142 = sqrt(_1140);
        float _1144 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1138;
        float _1150 = -_950;
        float _1152 = _1150 + _1090;
        float _1154 = _1144 * _1148;
        float _1156 = fma(_1152, _1154, _950);
        float _1158 = fma(_1124, _1154, _912);
        float _1160 = fma(_1134, _1154, _952);
        _1096 = _1156;
        _1098 = _1158;
        _1110 = _1160;
    }
    float _1162 = _1096;
    float _1164 = _1098;
    float _1166 = _1110;
    if (!_854)
    {
        float _1168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1170 = _1168 * 0.15915493667125701904296875;
        float _1172 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1174 = _1170 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        float _1178 = _1172 * 0.15915493667125701904296875;
        float _1180 = _1170 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = 1.0 / _1176;
        float _1186 = _1178 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1182 * _1184;
        float _1192 = _1178 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1188 * _1190;
        float _1198 = 1.0 / _1196;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = 1.0 / _1202;
        float _1206 = _1194 * _1198;
        float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1210 = fma(_1104, _1206, _1208);
        float _1212 = _1210 * _1204;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1106 = _1214;
    }
    float _1216 = _1106;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1162 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1164 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1166 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1234 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1236 = fma(_1224, _1224, _1230);
    float _1238 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1240 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1234);
    float _1242 = fma(_1228, _1228, _1236);
    float _1244 = rsqrt(_1242);
    float _1246 = sqrt(_1242);
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1250 = _1224 * _1248;
    float _1252 = _1228 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 + _1256;
    float _1260 = sqrt(_1258);
    bool _1262 = _1260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _1260 + _1264;
    float _1268 = _982;
    float _1270 = _1258;
    float _1272 = _1266;
    float _1274 = _1220;
    float _1276 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1278 = _1250;
    float _1280 = _1252;
    float _1282 = _1254;
    if (_1262)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1284;
    }
    float _1286 = _1268;
    if (_1262)
    {
        float _1288 = rsqrt(_1258);
        _1270 = _1288;
    }
    float _1290 = _1270;
    if (_1262)
    {
        float _1292 = _1266 * _1286;
        _1272 = _1292;
    }
    float _1294 = _1272;
    float _1296 = 0.0;
    if (_1262)
    {
        float _1298 = _1294 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1262)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1286;
    float _1316 = _1312;
    if (_1262)
    {
        float _1318 = _1300 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = -_1248;
    float _1326 = -_1312;
    float _1328 = fma(_1220, _1324, _1326);
    if (_1262)
    {
        float _1330 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1330;
    }
    float _1332 = _1274;
    float _1334 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1336 = _1308;
    if (_1262)
    {
        float _1338 = fma(_1308, _1332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1316 = _1338;
    }
    float _1340 = _1316;
    float _1342 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1334);
    float _1344 = floor(_1238);
    float _1346 = _1340;
    float _1348 = _1322;
    if (_1262)
    {
        float _1350 = _1322 + (-1.0);
        _1336 = _1350;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (_1262)
    {
        float _1356 = _1290 * _1340;
        _1276 = _1356;
    }
    float _1358 = _1276;
    if (!_1262)
    {
        _1346 = _1328;
    }
    float _1360 = _1346;
    float _1362 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1342);
    float _1364 = _1360;
    if (_1262)
    {
        float _1366 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1354 = _1366;
    }
    float _1368 = _1354;
    if (_1262)
    {
        float _1370 = _1250 * _1358;
        _1278 = _1370;
    }
    float _1372 = _1278;
    if (_1262)
    {
        float _1374 = _1252 * _1358;
        _1280 = _1374;
    }
    float _1376 = _1280;
    if (_1262)
    {
        float _1378 = fma(_1328, _1322, _1368);
        _1364 = _1378;
    }
    float _1380 = _1364;
    if (_1262)
    {
        float _1382 = _1372 * _1372;
        _1282 = _1382;
    }
    float _1384 = _1282;
    if (!_1262)
    {
        _1348 = _1256;
    }
    float _1386 = _1348;
    float _1388 = _1386;
    if (_1262)
    {
        float _1390 = _1376 * _1376;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1380, _1380, _1384);
    float _1396 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1240);
    float _1398 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1400 = _1394 + _1392;
    float _1402 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1406 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1410 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1408);
    float _1412 = precise::clamp(_1410, 0.0, 1.0);
    float _1414 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = rsqrt(_1400);
    float _1418 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1420 = -_1412;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1232);
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1428 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1424);
    float _1434 = abs(_1422);
    float _1436 = log2(_1434);
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1440 = -_1344;
    float _1442 = _1238 + _1440;
    float _1444 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = -_1430;
    float _1448 = fma(_1446, _1404, 1.0);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1426);
    float _1452 = _1416 * _1372;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1376;
    float _1458 = floor(_1402);
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1462 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1464 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1466 = -_1460;
    float _1468 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1466);
    float _1470 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1472 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1474 = log2(_1448);
    float _1476 = -_1456;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1468);
    float _1480 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1464);
    float _1484 = fma(_1478, -0.5, 0.5);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = exp2(_1470);
    float _1492 = -_1458;
    float _1494 = _1402 + _1492;
    float _1496 = fma(_1486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = _1454 + 1.0;
    float _1500 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1502 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1504 = fma(_1486, _1496, -0.212114393711090087890625);
    float _1506 = 1.0 / _1472;
    float _1508 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1510 = fma(_1486, _1504, 1.570728778839111328125);
    float _1512 = _1474 * 0.693147182464599609375;
    float _1514 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = sqrt(_1484);
    float _1518 = -_1454;
    float _1520 = fma(_1490, _1498, _1518);
    float _1522 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1524 = _1508 * _1506;
    float _1526 = _1522 * _1506;
    float _1528 = fma(_1524, 0.5, 0.5);
    float _1530 = fma(_1526, -0.5, 0.5);
    float _1532 = _1516 * 0.636619746685028076171875;
    float _1534 = -_1510;
    float _1536 = fma(_1532, _1534, 1.0);
    float _1538 = fma(_1520, 0.5, 0.5);
    float2 _5063 = float2(_1442, _1494);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).x;
    float3 _5074 = float3(_1528, _1530, _1514);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5074, float3(0.0), isnan(_5074)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5074, float3(0.0), isnan(_5074)), level(0.0)).x;
    float3 _5085 = float3(_1528, _1530, _1514);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5085, float3(0.0), isnan(_5085)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5085, float3(0.0), isnan(_5085)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _5101 = float2(_1536, _1538);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5101, float2(0.0), isnan(_5101)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5101, float2(0.0), isnan(_5101)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = float(uint(_620));
    float _1567 = trunc(_642);
    int _1569 = int(_1567);
    float _1571 = _700 * _160;
    bool _1573 = _620 == 0;
    float _1575 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1577 = ~_620;
    int _1579 = _1577 + 1;
    int _1581 = _620 + (-1);
    float _1583 = 1.0 / _1565;
    int _1585 = abs(_562);
    int _1587 = abs(_572);
    float _1589 = float(uint(_1569));
    float _1591 = trunc(_1571);
    int _1593 = int(_1591);
    int _1595 = as_type<int>(_1583) + (-2);
    float _1597 = exp2(_1575);
    float _1599 = as_type<float>(_1595) * _1589;
    float _1601 = trunc(_1599);
    float _1603 = precise::max(_1601, 0.0);
    uint _1606 = uint(_1603);
    int _1608 = ~_620;
    int _1610 = _1608 + 1;
    float _1612 = -_1597;
    float _1614 = _1612 + 1.0;
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1618 = _1579 * int(_1606);
    int _1620 = _1618 + _1569;
    float _1622 = float(uint(_1620));
    float _1624 = as_type<float>(_1595) * _1622;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1628 = _1626 != 0;
    float _1630 = trunc(_1624);
    float _1632 = precise::max(_1630, 0.0);
    uint _1634 = uint(_1632);
    bool _1636 = !_1628;
    float _1638 = _1636 ? 7.345489978790283203125 : 1.0;
    float _1640 = _1638 * _478;
    float _1642 = floor(_1640);
    int _1644 = int(_1606) + int(_1634);
    float _1646 = float(_1569);
    int _1648 = _1610 * _1644;
    int _1650 = _1648 + _1569;
    bool _1652 = _1646 >= _692;
    bool _1654 = isnan(_1646);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(_692);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    bool _1664 = uint(_1650) >= uint(_620);
    float _1666 = trunc(_1662);
    int _1668 = int(_1666);
    float _1670 = -_1642;
    float _1672 = _1640 + _1670;
    bool _1674 = !_1664;
    int _1676 = _1674 ? 0 : (-1);
    float _1678 = _1672 * _692;
    int _1680 = ~_1644;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    int _1686 = _620 * _1684;
    int _1688 = _1686 + _1569;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1692 = _1690 != 0;
    float _1694 = trunc(_1678);
    int _1696 = int(_1694);
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1700 = _1698 != 0;
    int _1702 = ~_1668;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = !_1573;
    int _1710 = _1708 ? _1688 : (-1);
    bool _1712 = !_1692;
    int _1714 = _1712 ? 0 : 1;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1718 = _1716 != 0;
    int _1720 = _1710 * _1706;
    int _1722 = abs(_1714);
    int _1724 = _1668 * _1581;
    int _1726 = _1724 + _1720;
    int _1728 = abs(_640);
    int _1730 = _1726 * _1585;
    int _1732 = _1696 * _1722;
    int _1734 = _1732 + _1569;
    bool _1736 = !_1718;
    int _1738 = _1736 ? 0 : 1;
    int _1740 = _1593 * _1587;
    int _1742 = _1740 + _1730;
    int _1744 = abs(_1738);
    float _1746 = in.m_63.y;
    int _1748 = ~_620;
    int _1750 = _1748 + 1;
    int _1752 = _1734 * _1728;
    int _1754 = _1752 + _1742;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1758 = _1756 != 0;
    float _1760 = as_type<float>(_1728);
    if (_1700)
    {
        float _1762 = in.m_55.x;
        _1760 = _1762;
    }
    float _1764 = _1760;
    int _1766 = _1696 * _1744;
    int _1768 = _1766 + _1754;
    float _1770 = float(uint(_1768));
    bool _1772 = _480 > 0.5;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1778 = as_type<float>(_1595) * _1770;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = trunc(_1778);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _1788 = -_1746;
    float _1790 = _1788 + 1.0;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1796 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1800 = _1798 != 0;
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _1746;
    float _1806 = _1796;
    if (_1758)
    {
        float _1808 = _1772 ? _1790 : _1746;
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1814 = _1764 > 0.5;
    bool _1816 = _1814 && _1700;
    bool _1818 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1820 = isnan(_468);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    float _1830 = 1.0 / _1776;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1832;
    float _1836 = float(uint(_1734));
    int _1838 = _1750 * int(_1786);
    int _1840 = _1838 + _1768;
    bool _1842 = _784 != 0.0;
    bool _1844 = isnan(_784);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    float _1852 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1854 = float(uint(_1840));
    float _1856 = -_530;
    float _1858 = fma(_688, _1852, _1856);
    float _1860 = in.m_63.x;
    float _1862 = as_type<float>(_1595) * _1854;
    bool _1864 = _782 == 0.0;
    bool _1866 = !_1850;
    bool _1868 = _1864 && _1866;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1872 = _1834 * _1830;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1876 = _468 + _1874;
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1886 = isnan(_468);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    out.m_67.x = _1796;
    out.m_67.y = _1802;
    out.m_67.z = _1812;
    out.m_67.w = _1870;
    float _1896 = fma(_1872, _1876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1898 = _786 == 0.0;
    bool _1900 = _1898 && _1868;
    int _1902 = int(_1786) + int(_1882);
    float _1904 = as_type<float>(_1595) * _1836;
    float _1906 = _1860;
    if (_1700)
    {
        _1806 = _1860;
    }
    float _1908 = _1806;
    float _1910 = -_1828;
    float _1912 = _1910 + 1.0;
    int _1914 = ~_620;
    int _1916 = _1914 + 1;
    float _1918 = in.m_69.x;
    float _1920 = in.m_69.y;
    float _1922 = in.m_69.z;
    int _1924 = ~_620;
    int _1926 = _1924 + 1;
    float _1928 = trunc(_1904);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    float _1934 = _1908;
    if (_1816)
    {
        float _1936 = -_1908;
        float _1938 = _1936 + 1.0;
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = _1894 * _1912;
    int _1944 = _1916 * _1902;
    int _1946 = _1944 + _1768;
    float _1948 = -_1894;
    float _1950 = _1948 + 1.0;
    if (_1700)
    {
        _1906 = _1940;
    }
    float _1952 = _1906;
    float _1954 = _1896 * _1942;
    bool _1956 = uint(_1946) >= uint(_620);
    float _1958 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1960 = !_1956;
    int _1962 = _1960 ? 0 : (-1);
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1954);
    float _1966 = fma(_684, _1958, _514);
    int _1968 = _1926 * int(_1932);
    int _1970 = _1968 + _1734;
    float _1972 = abs(_1104);
    float _1974 = log2(_1972);
    int _1976 = ~_1902;
    int _1978 = _1976 + _1962;
    int _1980 = _1978 + 1;
    float _1982 = float(uint(_1970));
    float _1984 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1964);
    int _1986 = _620 * _1980;
    int _1988 = _1986 + _1768;
    float _1990 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1992 = _1922;
    float _1994 = _1918;
    float _1996 = _1920;
    if (!_1900)
    {
        float _1998 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1922);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = as_type<float>(_1595) * _1982;
    float _2004 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2006 = !_1573;
    int _2008 = _2006 ? _1988 : (-1);
    if (!_1900)
    {
        float _2010 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1918);
        _1994 = _2010;
    }
    float _2012 = _1994;
    float _2014 = trunc(_2002);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = _1966 + 0.5;
    int _2022 = _2008 >> 31;
    float _2024 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1900)
    {
        float _2026 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1920);
        _1996 = _2026;
    }
    float _2028 = _1996;
    float _2030 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2032 = _2022 & 3;
    float _2034 = _1858 + 0.5;
    float _2036 = exp2(_2024);
    int _2038 = ~_620;
    int _2040 = _2038 + 1;
    float _2042 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2044 = _2008 + _2032;
    float _2046 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2052 = _902 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2054 = int(_1932) + int(_2018);
    float _2056 = _902 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_71.x = _2020;
    out.m_71.y = _2034;
    float _2058 = _902 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2060 = -_888;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2052);
    int _2064 = _2040 * _2054;
    int _2066 = _2064 + _1734;
    float _2068 = -_888;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2056);
    out.m_73.x = _2042;
    out.m_73.y = _2046;
    out.m_73.z = _2048;
    out.m_73.w = _2050;
    float _2072 = -_888;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2058);
    int _2076 = _2008 & 3;
    bool _2078 = _2076 != 0;
    float _2080 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2082 = uint(_2066) >= uint(_620);
    float _2084 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2062);
    int _2086 = _2044 >> 2;
    float _2088 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2074);
    bool _2090 = _1104 <= 8000.0;
    bool _2092 = isnan(_1104);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(8000.0);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2084 * _2028;
    int _2104 = _2086 << 4;
    int _2106 = _2104 + 368;
    float _2108 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2070);
    float _2114 = _914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2116 = uint(int(uint(_2106) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = _914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = _914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2136 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    float _2138 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2140 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2142 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    int _2144 = _2008 & 3;
    bool _2146 = _2144 != 0;
    float _2148 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2150 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2152 = _2106 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    bool _2170 = uint(_2144) > 1u;
    float _2172 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2080);
    float _2174 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2150);
    int _2176 = _2078 ? 0 : 1;
    float _2178 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2136);
    float _2180 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2140);
    float _2182 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    int _2184 = ~_2176;
    int _2186 = _2184 + 1;
    int _2188 = _2186 + 1;
    float _2190 = _2112 * _2028;
    float _2192 = _2088 * _2028;
    float _2194 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    bool _2196 = uint(_2144) >= 2u;
    float _2198 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2148);
    int _2200 = _2188;
    if (!_2170)
    {
        int _2202 = ~_2176;
        int _2204 = _2202 + 1;
        _2200 = _2204;
    }
    int _2206 = _2200;
    float _2208 = fma(_2110, -2.0, 3.0);
    bool _2210 = _2144 != 3;
    float _2212 = _2110 * _2110;
    int _2214 = abs(_2206);
    float _2216 = fma(_2178, _2012, _2102);
    int _2218 = _2196 ? 0 : 1;
    float _2220 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    bool _2222 = !_2146;
    int _2224 = _2222 ? 0 : 1;
    float _2226 = fma(_2182, _2012, _2192);
    int _2228 = ~_2214;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2180, _2012, _2190);
    bool _2236 = _2144 != 3;
    float _2238 = _2212 * _2208;
    int _2240 = ~_2218;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = -_1540;
    float _2248 = _2246 + 1.0;
    int _2250 = abs(_2224);
    float _2252 = _1616 * _1542;
    int _2254 = _2244;
    float _2256 = _2252;
    if (_2210)
    {
        int _2258 = ~_2218;
        int _2260 = _2258 + 1;
        _2254 = _2260;
    }
    int _2262 = _2254;
    float _2264 = -_1616;
    float _2266 = _2264 + 1.0;
    bool _2268 = !_2236;
    int _2270 = _2268 ? 0 : (-1);
    float _2272 = fma(_2194, _2000, _2234);
    int _2274 = abs(_2262);
    int _2276 = _2232 * as_type<int>(_2130);
    bool _2278 = !_1800;
    int _2280 = _2278 ? 0 : 1;
    int _2282 = ~_2250;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = abs(_2270);
    bool _2290 = !_2082;
    int _2292 = _2290 ? 0 : (-1);
    int _2294 = _2286 * as_type<int>(_2122);
    int _2296 = _2294 + _2276;
    int _2298 = abs(_2280);
    int _2300 = ~_2274;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = ~_2054;
    int _2308 = _2306 + _2292;
    int _2310 = _2308 + 1;
    int _2312 = _2304 * as_type<int>(_2160);
    int _2314 = _2312 + _2296;
    int _2316 = ~_2288;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _620 * _2310;
    int _2324 = _2322 + _1734;
    int _2326 = ~_2298;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2334 = _2320 * as_type<int>(_2168);
    int _2336 = _2334 + _2314;
    bool _2338 = !_1573;
    int _2340 = _2338 ? _2324 : (-1);
    float _2342 = -_2238;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2332);
    int _2348 = _2336 * _2330;
    float _2350 = _1563 * _2252;
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2238);
    float _2354 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2346);
    int _2356 = _2340 * _2298;
    int _2358 = _2356 + _2348;
    float _2360 = fma(_2220, _2000, _2216);
    float _2362 = _2100 * _2352;
    float _2364 = in.m_75.x;
    float _2366 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2354);
    float _2368 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2370 = _2366 + _1472;
    float _2372 = fma(_2198, _2000, _2226);
    float _2374 = _2248 * _2368;
    float _2376 = precise::clamp(_2374, 0.0, 1.0);
    float _2378 = _1553 * _2252;
    float _2380 = _2370 * 0.5;
    float _2382 = _1553 * _2266;
    float _2384 = -_2376;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2388 = fma(_1559, _2378, _1547);
    float _2390 = fma(_1561, _2378, _1549);
    out.m_77.z = _2380;
    out.m_77.w = _1472;
    float _2392 = fma(_1553, _2350, _1551);
    bool _2394 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2396 = isnan(_1246);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2402 = _2398 || _2400;
    out.gl_Position.x = _1508;
    out.gl_Position.y = _1522;
    out.gl_Position.z = _2366;
    out.gl_Position.w = _1472;
    float _2404 = float(_2358);
    out.m_79.x = _2388;
    out.m_79.y = _2390;
    out.m_79.z = _2392;
    out.m_79.w = _2382;
    float _2406 = _2386 * _2364;
    float _2408 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _2360;
    out.m_81.y = _2272;
    out.m_81.z = _2372;
    float _2410 = _2406 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2412 = _2362;
    float _2414 = _2378;
    float _2416 = _2350;
    float _2418 = _2406;
    float _2420 = _2404;
    if (!_2402)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2422 = _2412;
    out.m_83.x = _2404;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2402)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2428 = _2414;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2402)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2434 = _2416;
    out.m_85.x = _2410;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2402)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2440 = _2256;
    float _2442 = _2440;
    float _2444 = _2440;
    if (!_2402)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2446 = _2418;
    float _2448 = _2446;
    float _2450 = _2446;
    if (!_2402)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _2420;
    bool _2454 = !_2402;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2462 = isnan(_1246);
        bool _2464 = _2460 || _2462;
        bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2468 = _2464 || _2466;
        if (!_2468)
        {
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = _1246 + _2470;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2476 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2474;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2482 = 1.0 / _2476;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2500 = _2472 * _2482;
            float _2502 = precise::clamp(_2500, 0.0, 1.0);
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2508 = fma(_2502, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2502, _2506, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2512 = fma(_2502, _2486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2514 = fma(_2502, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2516 = fma(_2502, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2518 = fma(_2502, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2426 = _2512;
            _2444 = _2516;
            _2458 = _2508;
            _2438 = _2514;
            _2432 = _2510;
            _2450 = _2518;
            _2520 = true;
        }
        else
        {
            bool _2522 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2524 = isnan(_1246);
            bool _2526 = _2522 || _2524;
            bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2530 = _2526 || _2528;
            if (!_2530)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2532 = _2456;
            _2458 = _2532;
            if (!_2530)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2534 = _2424;
            _2426 = _2534;
            if (!_2530)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2536 = _2430;
            _2432 = _2536;
            if (!_2530)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2538 = _2436;
            _2438 = _2538;
            if (!_2530)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2540 = _2442;
            _2444 = _2540;
            if (!_2530)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2542 = _2448;
            bool _2544 = !_2530;
            _2450 = _2542;
            if (!_2544)
            {
                bool _2546 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2548 = isnan(_1246);
                bool _2550 = _2546 || _2548;
                bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2554 = _2550 || _2552;
                if (!_2554)
                {
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = _1246 + _2556;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2562 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2560;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2568 = 1.0 / _2562;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2586 = _2558 * _2568;
                    float _2588 = precise::clamp(_2586, 0.0, 1.0);
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2594 = fma(_2588, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2596 = fma(_2588, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2598 = fma(_2588, _2572, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2600 = fma(_2588, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2602 = fma(_2588, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2604 = fma(_2588, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2426 = _2598;
                    _2444 = _2602;
                    _2458 = _2594;
                    _2438 = _2600;
                    _2432 = _2596;
                    _2450 = _2604;
                    _2520 = true;
                }
                else
                {
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2520 = false;
    float _2606 = _2426;
    float _2608 = _2444;
    float _2610 = _2458;
    float _2612 = _2438;
    float _2614 = _2432;
    float _2616 = _2450;
    float _2618 = _2408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2620 = fma(_2272, -0.5, 0.5);
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    float _2624 = -_2606;
    float _2626 = _2624 + _2608;
    float _2628 = -_2610;
    float _2630 = _2628 + _2612;
    out.m_53.x = _2618;
    float _2632 = -_2614;
    float _2634 = _2632 + _2616;
    float _2636 = fma(_2622, _2626, _2606);
    float _2638 = fma(_2622, _2630, _2610);
    bool _2640 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2642 = _2636 * 0.586610972881317138671875;
    float _2644 = fma(_2622, _2634, _2614);
    out.m_87.x = 0.0;
    bool _2646 = _1216 > 0.0;
    bool _2648 = isnan(_1216);
    bool _2650 = _2646 || _2648;
    bool _2652 = isnan(0.0);
    bool _2654 = _2650 || _2652;
    float _2656 = fma(_2638, 0.298911988735198974609375, _2642);
    float _2658 = fma(_2644, 0.114477999508380889892578125, _2656);
    float _2660 = -_2658;
    float _2662 = _2638 + _2660;
    float _2664 = -_2658;
    float _2666 = _2636 + _2664;
    float _2668 = -_2658;
    float _2670 = _2644 + _2668;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    float _2674 = fma(_2666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    float _2676 = fma(_2670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    bool _2678 = !_2640;
    if (!_2678)
    {
        float _2680 = -_1162;
        float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2684 = -_1164;
        float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2688 = -_1166;
        float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2692 = _2682 * _2682;
        float _2694 = fma(_2686, _2686, _2692);
        float _2696 = fma(_2690, _2690, _2694);
        float _2698 = sqrt(_2696);
        float _2700 = rsqrt(_2696);
        float _2702 = -_2698;
        float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2706 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2708 = precise::clamp(_2706, 0.0, 1.0);
        float _2710 = _2686 * _2700;
        float _2712 = _2682 * _2700;
        float _2714 = abs(_2708);
        float _2716 = log2(_2714);
        float _2718 = _2690 * _2700;
        float _2720 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2722 = _2272 * _2712;
        float _2724 = -_2712;
        float _2726 = -_2720;
        float _2728 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2726);
        float _2730 = fma(_2360, _2710, _2722);
        float _2732 = -_2718;
        float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2728);
        float _2736 = fma(_2372, _2718, _2730);
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2742 = _2734 + _2740;
        float _2744 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2746 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2748 = precise::clamp(_2746, 0.0, 1.0);
        float _2750 = exp2(_2744);
        float _2752 = _2750 * _2748;
        float _2754 = _2738 * _2752;
        float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2760 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2756;
        out.m_87.y = _2758;
        out.m_87.z = _2760;
    }
    out.m_89.x = _2672;
    out.m_89.y = _2674;
    out.m_89.z = _2676;
    if (_2654)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2762 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2762;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2520 = false;
    bool _350 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_46.w;
    float _105 = in.m_48.w;
    float _107 = trunc(_103);
    int _110 = int(_107);
    float _112 = -_105;
    float _114 = _112 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _114;
    bool _118 = _110 >= 1;
    float _120 = 0.0;
    float _122 = _105;
    float _124 = _114;
    if (!_118)
    {
        _120 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _120;
    if (!_118)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_118)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_118)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2830 = as_type<float>(_132);
        out.gl_Position.z = _2830;
    }
    if (!_118)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_105);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = float(_110);
    bool _148 = _114 >= _146;
    bool _150 = !_144;
    bool _152 = _148 || _150;
    if (_152)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _122;
    if (_152)
    {
        out.m_53.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _134 = as_type<int>(_156);
    }
    int _158 = _134;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2885 = as_type<float>(_158);
        out.gl_Position.z = _2885;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _160 = 1.0 / _146;
    bool _162 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _164 = _114 * _160;
    bool _166 = !_162;
    float _168 = _164;
    float _186;
    if (!_166)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _114);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _164;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _194 = _190 + _192;
    bool _196 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _198 = isnan(_190);
    bool _200 = _196 || _198;
    bool _202 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _204 = _200 || _202;
    float _206 = float(_204);
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _190 + _208;
    bool _212 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _214 = isnan(_190);
    bool _216 = _212 || _214;
    bool _218 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _220 = _216 || _218;
    float _222 = float(_220);
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _224;
    float _228 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _230 = _228 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _232 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _234 = isnan(_190);
    bool _236 = _232 || _234;
    bool _238 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _240 = _236 || _238;
    float _242 = float(_240);
    float _244 = -_206;
    float _246 = _244 + 1.0;
    float _248 = 1.0 / _226;
    float _250 = _242 * _246;
    float _252 = -_242;
    float _254 = _252 + 1.0;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _258 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _256;
    bool _260 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _262 = 1.0 / _230;
    float _264 = _222 * _254;
    float _266 = -_222;
    float _268 = _266 + 1.0;
    float _270 = _194 * _248;
    float _272 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _274 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _272;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _276;
    float _280 = fma(_258, _270, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _282 = fma(_274, _270, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _284 = fma(_278, _270, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _286 = _210 * _262;
    float _288 = _280 * _264;
    float _290 = _282 * _264;
    float _292 = _284 * _264;
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _296 = _294 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _300 = _298 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _304 = _302 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _306 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].x, _288);
    float _308 = fma(_296, _286, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _310 = fma(_300, _286, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _312 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].y, _290);
    float _314 = fma(_304, _286, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _316 = fma(_268, (*spvDescriptorSet0.vp_c9)._m0[143].z, _292);
    float _318 = fma(_308, _250, _306);
    float _320 = fma(_310, _250, _312);
    float _322 = fma(_314, _250, _316);
    float _324 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].x, _318);
    float _326 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].y, _320);
    float _328 = fma(_206, (*spvDescriptorSet0.vp_c9)._m0[145].z, _322);
    bool _330 = !_260;
    float _348;
    if (!_330)
    {
        float _332 = in.m_55.x;
        float _334 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _336 = _332 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _338 = fma(_336, (*spvDescriptorSet0.vp_c9)._m0[11].x, _114);
        float _340 = _338 * _334;
        float _342 = floor(_340);
        float _344 = -_342;
        float _346 = _340 + _344;
        _348 = _346;
        _350 = true;
    }
    else
    {
        _348 = _164;
    }
    _350 = false;
    float _352 = _348;
    float _354 = in.m_57.x;
    float _356 = in.m_57.y;
    float _358 = in.m_57.z;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _362 = _352 + _360;
    bool _364 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _366 = isnan(_352);
    bool _368 = _364 || _366;
    bool _370 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _372 = _368 || _370;
    float _374 = float(_372);
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _378 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _376;
    bool _380 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _382 = -_374;
    float _384 = _382 + 1.0;
    float _386 = 1.0 / _378;
    float _388 = _328 * _358;
    float _390 = _326 * _356;
    float _392 = _362 * _386;
    bool _394 = _352 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _396 = isnan(_352);
    bool _398 = _394 || _396;
    bool _400 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _402 = _398 || _400;
    float _404 = float(_402);
    float _406 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _408 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _406;
    float _410 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _412 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _410;
    float _414 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _416 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _414;
    float _418 = _404 * _384;
    float _420 = fma(_408, _392, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _422 = fma(_416, _392, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _424 = fma(_412, _392, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _426 = -_404;
    float _428 = _426 + 1.0;
    float _430 = _420 * _418;
    float _432 = _422 * _418;
    float _434 = _424 * _418;
    float _436 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].x, _430);
    float _438 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].y, _432);
    float _440 = fma(_428, (*spvDescriptorSet0.vp_c9)._m0[107].z, _434);
    float _442 = _324 * _354;
    float _444 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].x, _436);
    float _446 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].y, _438);
    float _448 = fma(_374, (*spvDescriptorSet0.vp_c9)._m0[108].z, _440);
    bool _450 = !_380;
    if (!_450)
    {
        float _452 = in.m_55.x;
        float _454 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _456 = _452 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _458 = fma(_456, (*spvDescriptorSet0.vp_c9)._m0[11].y, _114);
        float _460 = _458 * _454;
        float _462 = floor(_460);
        float _464 = -_462;
        float _466 = _460 + _464;
        _168 = _466;
    }
    float _468 = _168;
    float _470 = in.m_55.z;
    float _472 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _474 = log2(_472);
    float _476 = _390 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _478 = in.m_55.x;
    float _480 = in.m_55.y;
    float _482 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _484 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _486 = int(_484);
    float _488 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _490 = _474 * _114;
    float _492 = _470 * 2.0;
    float _494 = _478 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _496 = _480 * 2.0;
    float _498 = floor(_492);
    float _500 = _478 * 2.0;
    float _502 = -_482;
    float _504 = fma(_494, 2.0, _502);
    float _506 = _480 + _478;
    float _508 = _480 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _510 = _480 + _470;
    float _512 = -_114;
    float _514 = fma(_512, (*spvDescriptorSet0.vp_c9)._m0[76].x, _504);
    float _516 = _506 + (-1.0);
    float _518 = exp2(_490);
    float _520 = fma(_508, -2.0, _488);
    float _522 = _510 + (-1.0);
    float _524 = fma(_516, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _526 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _528 = 1.0 + _526;
    float _530 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[76].y, _520);
    bool _532 = _498 >= 0.0;
    bool _534 = isnan(_498);
    bool _536 = _532 || _534;
    bool _538 = isnan(0.0);
    bool _540 = _536 || _538;
    float _542 = floor(_500);
    float _544 = float(_486);
    float _546 = fma(_522, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _548 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _550 = _548 != 0;
    int _552 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _554 = _552 != 0;
    int _556 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _558 = _556 != 0;
    bool _560 = !_554;
    int _562 = _560 ? 0 : 1;
    float _564 = floor(_496);
    bool _566 = _498 > 0.0;
    int _568 = _540 ? 0 : 1;
    bool _570 = !_550;
    int _572 = _570 ? 0 : 1;
    int _574 = ~_568;
    int _576 = _574 + 1;
    int _578 = _576 + 1;
    float _580 = 1.0 / _544;
    bool _582 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _584 = isnan(0.0);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _590 = _586 || _588;
    bool _592 = _542 > 0.0;
    bool _594 = _542 >= 0.0;
    bool _596 = isnan(_542);
    bool _598 = _594 || _596;
    bool _600 = isnan(0.0);
    bool _602 = _598 || _600;
    int _604 = _578;
    if (!_566)
    {
        int _606 = ~_568;
        int _608 = _606 + 1;
        _604 = _608;
    }
    int _610 = _604;
    float _612 = -_518;
    float _614 = _612 + 1.0;
    bool _616 = _564 > 0.0;
    float _618 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _620 = int(_618);
    bool _622 = _564 >= 0.0;
    bool _624 = isnan(_564);
    bool _626 = _622 || _624;
    bool _628 = isnan(0.0);
    bool _630 = _626 || _628;
    float _632 = in.m_59.x;
    float _634 = in.m_59.y;
    float _636 = in.m_59.z;
    bool _638 = !_558;
    int _640 = _638 ? 0 : 1;
    float _642 = _580 * _114;
    float _644 = _590 ? _614 : 0.0;
    float _646 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _648 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _650 = _648 != 0;
    int _652 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _654 = _652 != 0;
    int _656 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _658 = _656 != 0;
    float _660 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _662 = 1.0 / _528;
    int _664 = _602 ? 0 : 1;
    float _666 = fma(_478, (*spvDescriptorSet0.vp_c9)._m0[78].z, _646);
    bool _668 = !_650;
    int _670 = _668 ? 0 : 1;
    float _672 = fma(_480, (*spvDescriptorSet0.vp_c9)._m0[78].w, _660);
    bool _674 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _676 = isnan(1.0);
    bool _678 = _674 || _676;
    bool _680 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _682 = _678 || _680;
    float _684 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].z, _666);
    int _686 = abs(_670);
    float _688 = fma(_114, (*spvDescriptorSet0.vp_c9)._m0[77].w, _672);
    float _690 = float(_610);
    float _692 = float(_620);
    float _694 = float(_686);
    bool _696 = !_654;
    int _698 = _696 ? 0 : 1;
    float _700 = _692 * _114;
    if (_682)
    {
        float _702 = _644 * _662;
        _124 = _702;
    }
    float _704 = _124;
    float _706 = _694 * _690;
    int _708 = ~_664;
    int _710 = _708 + 1;
    int _712 = _710 + 1;
    int _714 = _712;
    if (!_592)
    {
        int _716 = ~_664;
        int _718 = _716 + 1;
        _714 = _718;
    }
    int _720 = _714;
    float _722 = _706 * (-2.0);
    int _724 = abs(_698);
    float _726 = _478 + (-0.5);
    bool _728 = !_658;
    int _730 = _728 ? 0 : 1;
    float _732 = fma(_722, _632, _632);
    float _734 = float(_720);
    float _736 = float(_724);
    float _738 = fma(_524, _722, _524);
    int _740 = abs(_730);
    float _742 = fma(_726, (*spvDescriptorSet0.vp_c9)._m0[196].x, _732);
    int _744 = _630 ? 0 : 1;
    float _746 = _736 * _734;
    float _748 = fma(_738, _704, _742);
    int _750 = ~_744;
    int _752 = _750 + 1;
    int _754 = _752 + 1;
    float _756 = _746 * (-2.0);
    int _758 = _754;
    if (!_616)
    {
        int _760 = ~_744;
        int _762 = _760 + 1;
        _758 = _762;
    }
    int _764 = _758;
    float _766 = _480 + (-0.5);
    float _768 = _748 * 0.15915493667125701904296875;
    float _770 = fma(_756, _634, _634);
    float _772 = float(_764);
    float _774 = fma(_546, _756, _546);
    float _776 = float(_740);
    float _778 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[196].y, _770);
    float _780 = _470 + _478;
    float _782 = in.m_61.x;
    float _784 = in.m_61.y;
    float _786 = in.m_61.z;
    float _788 = _768 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = _776 * _772;
    float _794 = fma(_774, _704, _778);
    float _796 = _780 + (-1.0);
    float _798 = _792 * (-2.0);
    float _800 = _794 * 0.15915493667125701904296875;
    float _802 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _804 = fma(_798, _636, _636);
    float _806 = _470 + (-0.5);
    float _808 = _768 * 6.283185482025146484375;
    float _810 = cos(_808);
    float _812 = in.m_46.x;
    float _814 = in.m_46.y;
    float _816 = in.m_46.z;
    float _818 = fma(_802, _798, _802);
    float _820 = fma(_806, (*spvDescriptorSet0.vp_c9)._m0[196].z, _804);
    float _822 = _442 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _824 = fma(_818, _704, _820);
    float _826 = _800 * 6.283185482025146484375;
    float _828 = sin(_826);
    bool _830 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _832 = isnan(0.5);
    bool _834 = _830 || _832;
    bool _836 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _838 = _834 || _836;
    float _840 = _824 * 0.15915493667125701904296875;
    float _842 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _782);
    float _844 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _784);
    bool _846 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _848 = isnan(0.5);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _854 = _850 || _852;
    float _856 = _800 * 6.283185482025146484375;
    float _858 = cos(_856);
    float _860 = _822 * _842;
    float _862 = _476 * _844;
    float _864 = _388 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _786);
    float _868 = _840 * 6.283185482025146484375;
    float _870 = cos(_868);
    float _872 = _814 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _874 = _814 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _876 = _814 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _878 = _864 * _866;
    float _880 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[4].x, _872);
    float _882 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[5].x, _874);
    float _884 = fma(_812, (*spvDescriptorSet0.vp_c10)._m0[6].x, _876);
    float _886 = _840 * 6.283185482025146484375;
    float _888 = sin(_886);
    float _890 = _810 * _858;
    float _892 = _790 * _828;
    float _894 = _790 * _858;
    float _896 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[4].z, _880);
    float _898 = _790 * _870;
    float _900 = _810 * _828;
    float _902 = _810 * _870;
    float _904 = _858 * _870;
    float _906 = _828 * _870;
    float _908 = _898 * _862;
    float _910 = _902 * _862;
    float _912 = _896 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _914 = fma(_888, _890, _892);
    float _916 = fma(_888, _892, _890);
    float _918 = -_862;
    float _920 = _888 * _918;
    float _922 = -_900;
    float _924 = fma(_888, _894, _922);
    float _926 = -_894;
    float _928 = fma(_888, _900, _926);
    float _930 = fma(_914, _860, _910);
    float _932 = fma(_904, _860, _920);
    float _934 = fma(_924, _860, _908);
    float _936 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[5].z, _882);
    float _938 = fma(_928, _878, _930);
    float _940 = fma(_816, (*spvDescriptorSet0.vp_c10)._m0[6].z, _884);
    float _942 = fma(_906, _878, _932);
    float _944 = fma(_916, _878, _934);
    float _946 = _938 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _948 = _938 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _950 = _936 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _952 = _940 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _954 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[26].x, _946);
    float _956 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[24].x, _948);
    float _958 = _950 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _960 = _950 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _962 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[26].z, _954);
    float _964 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[24].z, _956);
    float _966 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[11].x, _958);
    float _968 = fma(_912, (*spvDescriptorSet0.vp_c8)._m0[10].x, _960);
    float _970 = _962 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _972 = _964 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _974 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[11].z, _966);
    float _976 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[10].z, _968);
    float _978 = _952 + _970;
    float _980 = _912 + _972;
    float _982 = _974 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _984 = _976 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _986 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _988 = _978 + _986;
    float _990 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _992 = _980 + _990;
    float _994 = 1.0 / _982;
    float _996 = _984 + _982;
    float _998 = _988 * _988;
    float _1000 = _938 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1002 = fma(_992, _992, _998);
    float _1004 = fma(_942, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1000);
    float _1006 = sqrt(_1002);
    float _1008 = fma(_944, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1004);
    float _1010 = _996 * _994;
    float _1012 = _1010 * 0.5;
    float _1014 = _1008 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1016 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1018 = fma(_1012, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1016);
    float _1020 = _950 + _1014;
    bool _1022 = _1006 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1024 = 1.0 / _1018;
    float _1026 = _1014;
    float _1028 = _1000;
    float _1030 = _944;
    float _1032 = _938;
    float _1034 = _992;
    if (!_1022)
    {
        _1026 = _980;
    }
    float _1036 = _1026;
    float _1038 = _1036;
    if (!_1022)
    {
        _1028 = _978;
    }
    float _1040 = _1028;
    float _1042 = _1040;
    if (!_1022)
    {
        _1030 = _1020;
    }
    float _1044 = _1030;
    bool _1046 = !_1022;
    float _1048 = _1044;
    if (!_1046)
    {
        float _1050 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1052 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1054 = _1006 + _1052;
        float _1056 = rsqrt(_1002);
        float _1058 = _1054 * _1050;
        float _1060 = _1020 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1062 = _1058 * 0.15915493667125701904296875;
        float _1064 = _1062 * 6.283185482025146484375;
        float _1066 = cos(_1064);
        float _1068 = _1062 * 6.283185482025146484375;
        float _1070 = sin(_1068);
        float _1072 = _1066 + (-1.0);
        float _1074 = _1072 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1076 = fma(_1070, _1060, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1078 = fma(_1020, _1066, _1074);
        float _1080 = _1056 * _1076;
        float _1082 = fma(_992, _1080, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1084 = fma(_988, _1080, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1042 = _1084;
        _1038 = _1082;
        _1048 = _1078;
        _1032 = _1076;
    }
    float _1086 = _1042;
    float _1088 = _1038;
    float _1090 = _1048;
    float _1092 = _1032;
    float _1094 = _1092;
    float _1096 = _1090;
    float _1098 = _1088;
    if (_854)
    {
        _1094 = 1.0;
    }
    float _1100 = _1094;
    float _1102 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1104 = _1024 * _1102;
    float _1106 = _1100;
    if (_838)
    {
        _1034 = _1086;
    }
    float _1108 = _1034;
    float _1110 = _1108;
    if (!_838)
    {
        float _1112 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1114 = _950 + _1112;
        float _1116 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1118 = _912 + _1116;
        float _1120 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1122 = -_912;
        float _1124 = _1122 + _1088;
        float _1126 = _1114 * _1114;
        float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1130 = _952 + _1128;
        float _1132 = -_952;
        float _1134 = _1132 + _1086;
        float _1136 = fma(_1118, _1118, _1126);
        float _1138 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1140 = fma(_1130, _1130, _1136);
        float _1142 = sqrt(_1140);
        float _1144 = _1120 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1146 = precise::min(_1142, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1148 = _1146 * _1138;
        float _1150 = -_950;
        float _1152 = _1150 + _1090;
        float _1154 = _1144 * _1148;
        float _1156 = fma(_1152, _1154, _950);
        float _1158 = fma(_1124, _1154, _912);
        float _1160 = fma(_1134, _1154, _952);
        _1096 = _1156;
        _1098 = _1158;
        _1110 = _1160;
    }
    float _1162 = _1096;
    float _1164 = _1098;
    float _1166 = _1110;
    if (!_854)
    {
        float _1168 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1170 = _1168 * 0.15915493667125701904296875;
        float _1172 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1174 = _1170 * 6.283185482025146484375;
        float _1176 = cos(_1174);
        float _1178 = _1172 * 0.15915493667125701904296875;
        float _1180 = _1170 * 6.283185482025146484375;
        float _1182 = sin(_1180);
        float _1184 = 1.0 / _1176;
        float _1186 = _1178 * 6.283185482025146484375;
        float _1188 = cos(_1186);
        float _1190 = _1182 * _1184;
        float _1192 = _1178 * 6.283185482025146484375;
        float _1194 = sin(_1192);
        float _1196 = _1188 * _1190;
        float _1198 = 1.0 / _1196;
        float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1202 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1200;
        float _1204 = 1.0 / _1202;
        float _1206 = _1194 * _1198;
        float _1208 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1210 = fma(_1104, _1206, _1208);
        float _1212 = _1210 * _1204;
        float _1214 = precise::clamp(_1212, 0.0, 1.0);
        _1106 = _1214;
    }
    float _1216 = _1106;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1162 + _1218;
    float _1222 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1224 = _1164 + _1222;
    float _1226 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1228 = _1166 + _1226;
    float _1230 = _1220 * _1220;
    float _1232 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1234 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1236 = fma(_1224, _1224, _1230);
    float _1238 = fma(_912, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1240 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1234);
    float _1242 = fma(_1228, _1228, _1236);
    float _1244 = rsqrt(_1242);
    float _1246 = sqrt(_1242);
    float _1248 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1250 = _1224 * _1248;
    float _1252 = _1228 * _1248;
    float _1254 = _1250 * _1250;
    float _1256 = _1252 * _1252;
    float _1258 = _1254 + _1256;
    float _1260 = sqrt(_1258);
    bool _1262 = _1260 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1264 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1266 = _1260 + _1264;
    float _1268 = _982;
    float _1270 = _1258;
    float _1272 = _1266;
    float _1274 = _1220;
    float _1276 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    float _1278 = _1250;
    float _1280 = _1252;
    float _1282 = _1254;
    if (_1262)
    {
        float _1284 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1268 = _1284;
    }
    float _1286 = _1268;
    if (_1262)
    {
        float _1288 = rsqrt(_1258);
        _1270 = _1288;
    }
    float _1290 = _1270;
    if (_1262)
    {
        float _1292 = _1266 * _1286;
        _1272 = _1292;
    }
    float _1294 = _1272;
    float _1296 = 0.0;
    if (_1262)
    {
        float _1298 = _1294 * 0.15915493667125701904296875;
        _1296 = _1298;
    }
    float _1300 = _1296;
    float _1302 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (_1262)
    {
        float _1304 = _1300 * 6.283185482025146484375;
        float _1306 = sin(_1304);
        _1302 = _1306;
    }
    float _1308 = _1302;
    float _1310 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1312 = precise::max(0.0, _1310);
    float _1314 = _1286;
    float _1316 = _1312;
    if (_1262)
    {
        float _1318 = _1300 * 6.283185482025146484375;
        float _1320 = cos(_1318);
        _1314 = _1320;
    }
    float _1322 = _1314;
    float _1324 = -_1248;
    float _1326 = -_1312;
    float _1328 = fma(_1220, _1324, _1326);
    if (_1262)
    {
        float _1330 = _1328 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1274 = _1330;
    }
    float _1332 = _1274;
    float _1334 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1336 = _1308;
    if (_1262)
    {
        float _1338 = fma(_1308, _1332, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1316 = _1338;
    }
    float _1340 = _1316;
    float _1342 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1334);
    float _1344 = floor(_1238);
    float _1346 = _1340;
    float _1348 = _1322;
    if (_1262)
    {
        float _1350 = _1322 + (-1.0);
        _1336 = _1350;
    }
    float _1352 = _1336;
    float _1354 = _1352;
    if (_1262)
    {
        float _1356 = _1290 * _1340;
        _1276 = _1356;
    }
    float _1358 = _1276;
    if (!_1262)
    {
        _1346 = _1328;
    }
    float _1360 = _1346;
    float _1362 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1342);
    float _1364 = _1360;
    if (_1262)
    {
        float _1366 = _1352 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1354 = _1366;
    }
    float _1368 = _1354;
    if (_1262)
    {
        float _1370 = _1250 * _1358;
        _1278 = _1370;
    }
    float _1372 = _1278;
    if (_1262)
    {
        float _1374 = _1252 * _1358;
        _1280 = _1374;
    }
    float _1376 = _1280;
    if (_1262)
    {
        float _1378 = fma(_1328, _1322, _1368);
        _1364 = _1378;
    }
    float _1380 = _1364;
    if (_1262)
    {
        float _1382 = _1372 * _1372;
        _1282 = _1382;
    }
    float _1384 = _1282;
    if (!_1262)
    {
        _1348 = _1256;
    }
    float _1386 = _1348;
    float _1388 = _1386;
    if (_1262)
    {
        float _1390 = _1376 * _1376;
        _1388 = _1390;
    }
    float _1392 = _1388;
    float _1394 = fma(_1380, _1380, _1384);
    float _1396 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1240);
    float _1398 = _1362 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1400 = _1394 + _1392;
    float _1402 = fma(_952, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1404 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1406 = _1162 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1408 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1410 = fma(_1246, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1408);
    float _1412 = precise::clamp(_1410, 0.0, 1.0);
    float _1414 = _1396 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1416 = rsqrt(_1400);
    float _1418 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1406);
    float _1420 = -_1412;
    float _1422 = _1420 + 1.0;
    float _1424 = fma(_1164, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1232);
    float _1426 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1428 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1418);
    float _1430 = _1414 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1432 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1424);
    float _1434 = abs(_1422);
    float _1436 = log2(_1434);
    float _1438 = _1428 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1440 = -_1344;
    float _1442 = _1238 + _1440;
    float _1444 = _1432 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1446 = -_1430;
    float _1448 = fma(_1446, _1404, 1.0);
    float _1450 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1426);
    float _1452 = _1416 * _1372;
    float _1454 = _1416 * _1380;
    float _1456 = _1416 * _1376;
    float _1458 = floor(_1402);
    float _1460 = _1452 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1462 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1450);
    float _1464 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1466 = -_1460;
    float _1468 = fma(_1454, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1466);
    float _1470 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1472 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1462);
    float _1474 = log2(_1448);
    float _1476 = -_1456;
    float _1478 = fma(_1476, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1468);
    float _1480 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1482 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1464);
    float _1484 = fma(_1478, -0.5, 0.5);
    float _1486 = fma(_1478, 0.5, 0.5);
    float _1488 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1480);
    float _1490 = exp2(_1470);
    float _1492 = -_1458;
    float _1494 = _1402 + _1492;
    float _1496 = fma(_1486, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1498 = _1454 + 1.0;
    float _1500 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1488);
    float _1502 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1482);
    float _1504 = fma(_1486, _1496, -0.212114393711090087890625);
    float _1506 = 1.0 / _1472;
    float _1508 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1500);
    float _1510 = fma(_1486, _1504, 1.570728778839111328125);
    float _1512 = _1474 * 0.693147182464599609375;
    float _1514 = _1512 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1516 = sqrt(_1484);
    float _1518 = -_1454;
    float _1520 = fma(_1490, _1498, _1518);
    float _1522 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1502);
    float _1524 = _1508 * _1506;
    float _1526 = _1522 * _1506;
    float _1528 = fma(_1524, 0.5, 0.5);
    float _1530 = fma(_1526, -0.5, 0.5);
    float _1532 = _1516 * 0.636619746685028076171875;
    float _1534 = -_1510;
    float _1536 = fma(_1532, _1534, 1.0);
    float _1538 = fma(_1520, 0.5, 0.5);
    float2 _5063 = float2(_1442, _1494);
    float _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5063, float2(0.0), isnan(_5063)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5063, float2(0.0), isnan(_5063)), level(0.0)).x;
    float3 _5074 = float3(_1528, _1530, _1514);
    float _1542 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5074, float3(0.0), isnan(_5074)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5074, float3(0.0), isnan(_5074)), level(0.0)).x;
    float3 _5085 = float3(_1528, _1530, _1514);
    float4 _1545 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5085, float3(0.0), isnan(_5085)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5085, float3(0.0), isnan(_5085)), level(0.0)).xyzw;
    float _1547 = _1545.x;
    float _1549 = _1545.y;
    float _1551 = _1545.z;
    float _1553 = _1545.w;
    float2 _5101 = float2(_1536, _1538);
    float3 _1557 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5101, float2(0.0), isnan(_5101)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5101, float2(0.0), isnan(_5101)), level(0.0)).xyz;
    float _1559 = _1557.x;
    float _1561 = _1557.y;
    float _1563 = _1557.z;
    float _1565 = float(uint(_620));
    float _1567 = trunc(_642);
    int _1569 = int(_1567);
    float _1571 = _700 * _160;
    bool _1573 = _620 == 0;
    float _1575 = _1436 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1577 = ~_620;
    int _1579 = _1577 + 1;
    int _1581 = _620 + (-1);
    float _1583 = 1.0 / _1565;
    int _1585 = abs(_562);
    int _1587 = abs(_572);
    float _1589 = float(uint(_1569));
    float _1591 = trunc(_1571);
    int _1593 = int(_1591);
    int _1595 = as_type<int>(_1583) + (-2);
    float _1597 = exp2(_1575);
    float _1599 = as_type<float>(_1595) * _1589;
    float _1601 = trunc(_1599);
    float _1603 = precise::max(_1601, 0.0);
    uint _1606 = uint(_1603);
    int _1608 = ~_620;
    int _1610 = _1608 + 1;
    float _1612 = -_1597;
    float _1614 = _1612 + 1.0;
    float _1616 = _1614 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1618 = _1579 * int(_1606);
    int _1620 = _1618 + _1569;
    float _1622 = float(uint(_1620));
    float _1624 = as_type<float>(_1595) * _1622;
    int _1626 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1628 = _1626 != 0;
    float _1630 = trunc(_1624);
    float _1632 = precise::max(_1630, 0.0);
    uint _1634 = uint(_1632);
    bool _1636 = !_1628;
    float _1638 = _1636 ? 7.345489978790283203125 : 1.0;
    float _1640 = _1638 * _478;
    float _1642 = floor(_1640);
    int _1644 = int(_1606) + int(_1634);
    float _1646 = float(_1569);
    int _1648 = _1610 * _1644;
    int _1650 = _1648 + _1569;
    bool _1652 = _1646 >= _692;
    bool _1654 = isnan(_1646);
    bool _1656 = _1652 || _1654;
    bool _1658 = isnan(_692);
    bool _1660 = _1656 || _1658;
    float _1662 = float(_1660);
    bool _1664 = uint(_1650) >= uint(_620);
    float _1666 = trunc(_1662);
    int _1668 = int(_1666);
    float _1670 = -_1642;
    float _1672 = _1640 + _1670;
    bool _1674 = !_1664;
    int _1676 = _1674 ? 0 : (-1);
    float _1678 = _1672 * _692;
    int _1680 = ~_1644;
    int _1682 = _1680 + _1676;
    int _1684 = _1682 + 1;
    int _1686 = _620 * _1684;
    int _1688 = _1686 + _1569;
    int _1690 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1692 = _1690 != 0;
    float _1694 = trunc(_1678);
    int _1696 = int(_1694);
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1700 = _1698 != 0;
    int _1702 = ~_1668;
    int _1704 = _1702 + 1;
    int _1706 = _1704 + 1;
    bool _1708 = !_1573;
    int _1710 = _1708 ? _1688 : (-1);
    bool _1712 = !_1692;
    int _1714 = _1712 ? 0 : 1;
    int _1716 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1718 = _1716 != 0;
    int _1720 = _1710 * _1706;
    int _1722 = abs(_1714);
    int _1724 = _1668 * _1581;
    int _1726 = _1724 + _1720;
    int _1728 = abs(_640);
    int _1730 = _1726 * _1585;
    int _1732 = _1696 * _1722;
    int _1734 = _1732 + _1569;
    bool _1736 = !_1718;
    int _1738 = _1736 ? 0 : 1;
    int _1740 = _1593 * _1587;
    int _1742 = _1740 + _1730;
    int _1744 = abs(_1738);
    float _1746 = in.m_63.y;
    int _1748 = ~_620;
    int _1750 = _1748 + 1;
    int _1752 = _1734 * _1728;
    int _1754 = _1752 + _1742;
    int _1756 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1758 = _1756 != 0;
    float _1760 = as_type<float>(_1728);
    if (_1700)
    {
        float _1762 = in.m_55.x;
        _1760 = _1762;
    }
    float _1764 = _1760;
    int _1766 = _1696 * _1744;
    int _1768 = _1766 + _1754;
    float _1770 = float(uint(_1768));
    bool _1772 = _480 > 0.5;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1776 = _1774 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1778 = as_type<float>(_1595) * _1770;
    float _1780 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1782 = trunc(_1778);
    float _1784 = precise::max(_1782, 0.0);
    uint _1786 = uint(_1784);
    out.m_65.x = 1.0;
    out.m_65.y = 1.0;
    out.m_65.z = 1.0;
    float _1788 = -_1746;
    float _1790 = _1788 + 1.0;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1796 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _1798 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1800 = _1798 != 0;
    float _1802 = _1792 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1804 = _1746;
    float _1806 = _1796;
    if (_1758)
    {
        float _1808 = _1772 ? _1790 : _1746;
        _1804 = _1808;
    }
    float _1810 = _1804;
    float _1812 = _1794 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1814 = _1764 > 0.5;
    bool _1816 = _1814 && _1700;
    bool _1818 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1820 = isnan(_468);
    bool _1822 = _1818 || _1820;
    bool _1824 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1826 = _1822 || _1824;
    float _1828 = float(_1826);
    float _1830 = 1.0 / _1776;
    float _1832 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1834 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1832;
    float _1836 = float(uint(_1734));
    int _1838 = _1750 * int(_1786);
    int _1840 = _1838 + _1768;
    bool _1842 = _784 != 0.0;
    bool _1844 = isnan(_784);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan(0.0);
    bool _1850 = _1846 || _1848;
    float _1852 = fma(_1810, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1854 = float(uint(_1840));
    float _1856 = -_530;
    float _1858 = fma(_688, _1852, _1856);
    float _1860 = in.m_63.x;
    float _1862 = as_type<float>(_1595) * _1854;
    bool _1864 = _782 == 0.0;
    bool _1866 = !_1850;
    bool _1868 = _1864 && _1866;
    float _1870 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1872 = _1834 * _1830;
    float _1874 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1876 = _468 + _1874;
    float _1878 = trunc(_1862);
    float _1880 = precise::max(_1878, 0.0);
    uint _1882 = uint(_1880);
    bool _1884 = _468 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1886 = isnan(_468);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1892 = _1888 || _1890;
    float _1894 = float(_1892);
    out.m_67.x = _1796;
    out.m_67.y = _1802;
    out.m_67.z = _1812;
    out.m_67.w = _1870;
    float _1896 = fma(_1872, _1876, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1898 = _786 == 0.0;
    bool _1900 = _1898 && _1868;
    int _1902 = int(_1786) + int(_1882);
    float _1904 = as_type<float>(_1595) * _1836;
    float _1906 = _1860;
    if (_1700)
    {
        _1806 = _1860;
    }
    float _1908 = _1806;
    float _1910 = -_1828;
    float _1912 = _1910 + 1.0;
    int _1914 = ~_620;
    int _1916 = _1914 + 1;
    float _1918 = in.m_69.x;
    float _1920 = in.m_69.y;
    float _1922 = in.m_69.z;
    int _1924 = ~_620;
    int _1926 = _1924 + 1;
    float _1928 = trunc(_1904);
    float _1930 = precise::max(_1928, 0.0);
    uint _1932 = uint(_1930);
    float _1934 = _1908;
    if (_1816)
    {
        float _1936 = -_1908;
        float _1938 = _1936 + 1.0;
        _1934 = _1938;
    }
    float _1940 = _1934;
    float _1942 = _1894 * _1912;
    int _1944 = _1916 * _1902;
    int _1946 = _1944 + _1768;
    float _1948 = -_1894;
    float _1950 = _1948 + 1.0;
    if (_1700)
    {
        _1906 = _1940;
    }
    float _1952 = _1906;
    float _1954 = _1896 * _1942;
    bool _1956 = uint(_1946) >= uint(_620);
    float _1958 = fma(_1952, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1960 = !_1956;
    int _1962 = _1960 ? 0 : (-1);
    float _1964 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1954);
    float _1966 = fma(_684, _1958, _514);
    int _1968 = _1926 * int(_1932);
    int _1970 = _1968 + _1734;
    float _1972 = abs(_1104);
    float _1974 = log2(_1972);
    int _1976 = ~_1902;
    int _1978 = _1976 + _1962;
    int _1980 = _1978 + 1;
    float _1982 = float(uint(_1970));
    float _1984 = fma(_1828, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1964);
    int _1986 = _620 * _1980;
    int _1988 = _1986 + _1768;
    float _1990 = _446 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1992 = _1922;
    float _1994 = _1918;
    float _1996 = _1920;
    if (!_1900)
    {
        float _1998 = fma(_786, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1922);
        _1992 = _1998;
    }
    float _2000 = _1992;
    float _2002 = as_type<float>(_1595) * _1982;
    float _2004 = _448 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _2006 = !_1573;
    int _2008 = _2006 ? _1988 : (-1);
    if (!_1900)
    {
        float _2010 = fma(_782, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1918);
        _1994 = _2010;
    }
    float _2012 = _1994;
    float _2014 = trunc(_2002);
    float _2016 = precise::max(_2014, 0.0);
    uint _2018 = uint(_2016);
    float _2020 = _1966 + 0.5;
    int _2022 = _2008 >> 31;
    float _2024 = _1974 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    if (!_1900)
    {
        float _2026 = fma(_784, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1920);
        _1996 = _2026;
    }
    float _2028 = _1996;
    float _2030 = _444 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    int _2032 = _2022 & 3;
    float _2034 = _1858 + 0.5;
    float _2036 = exp2(_2024);
    int _2038 = ~_620;
    int _2040 = _2038 + 1;
    float _2042 = _2030 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2044 = _2008 + _2032;
    float _2046 = _1990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2048 = _2004 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _1984 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _2052 = _902 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2054 = int(_1932) + int(_2018);
    float _2056 = _902 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    out.m_71.x = _2020;
    out.m_71.y = _2034;
    float _2058 = _902 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2060 = -_888;
    float _2062 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2052);
    int _2064 = _2040 * _2054;
    int _2066 = _2064 + _1734;
    float _2068 = -_888;
    float _2070 = fma(_2068, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2056);
    out.m_73.x = _2042;
    out.m_73.y = _2046;
    out.m_73.z = _2048;
    out.m_73.w = _2050;
    float _2072 = -_888;
    float _2074 = fma(_2072, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2058);
    int _2076 = _2008 & 3;
    bool _2078 = _2076 != 0;
    float _2080 = _928 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2082 = uint(_2066) >= uint(_620);
    float _2084 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2062);
    int _2086 = _2044 >> 2;
    float _2088 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2074);
    bool _2090 = _1104 <= 8000.0;
    bool _2092 = isnan(_1104);
    bool _2094 = _2090 || _2092;
    bool _2096 = isnan(8000.0);
    bool _2098 = _2094 || _2096;
    float _2100 = float(_2098);
    float _2102 = _2084 * _2028;
    int _2104 = _2086 << 4;
    int _2106 = _2104 + 368;
    float _2108 = fma(_2036, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2110 = precise::clamp(_2108, 0.0, 1.0);
    float _2112 = fma(_898, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2070);
    float _2114 = _914 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    uint _2116 = uint(int(uint(_2106) >> uint(2)));
    uint _2118 = uint(int(uint(int(_2116)) >> uint(2)));
    int _2120 = int(_2116) & 3;
    float _2122 = (*spvDescriptorSet0.vp_c9)._m0[int(_2118)][_2120];
    int _2124 = int(_2116) + 1;
    uint _2126 = uint(int(uint(_2124) >> uint(2)));
    int _2128 = _2124 & 3;
    float _2130 = (*spvDescriptorSet0.vp_c9)._m0[int(_2126)][_2128];
    float _2132 = _914 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2134 = _914 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2136 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2114);
    float _2138 = _928 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2140 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2132);
    float _2142 = fma(_904, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    int _2144 = _2008 & 3;
    bool _2146 = _2144 != 0;
    float _2148 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2138);
    float _2150 = _928 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2152 = _2106 + 8;
    uint _2154 = uint(int(uint(_2152) >> uint(2)));
    uint _2156 = uint(int(uint(int(_2154)) >> uint(2)));
    int _2158 = int(_2154) & 3;
    float _2160 = (*spvDescriptorSet0.vp_c9)._m0[int(_2156)][_2158];
    int _2162 = int(_2154) + 1;
    uint _2164 = uint(int(uint(_2162) >> uint(2)));
    int _2166 = _2162 & 3;
    float _2168 = (*spvDescriptorSet0.vp_c9)._m0[int(_2164)][_2166];
    bool _2170 = uint(_2144) > 1u;
    float _2172 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2080);
    float _2174 = fma(_906, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2150);
    int _2176 = _2078 ? 0 : 1;
    float _2178 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2136);
    float _2180 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2140);
    float _2182 = fma(_924, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2142);
    int _2184 = ~_2176;
    int _2186 = _2184 + 1;
    int _2188 = _2186 + 1;
    float _2190 = _2112 * _2028;
    float _2192 = _2088 * _2028;
    float _2194 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    bool _2196 = uint(_2144) >= 2u;
    float _2198 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2148);
    int _2200 = _2188;
    if (!_2170)
    {
        int _2202 = ~_2176;
        int _2204 = _2202 + 1;
        _2200 = _2204;
    }
    int _2206 = _2200;
    float _2208 = fma(_2110, -2.0, 3.0);
    bool _2210 = _2144 != 3;
    float _2212 = _2110 * _2110;
    int _2214 = abs(_2206);
    float _2216 = fma(_2178, _2012, _2102);
    int _2218 = _2196 ? 0 : 1;
    float _2220 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2174);
    bool _2222 = !_2146;
    int _2224 = _2222 ? 0 : 1;
    float _2226 = fma(_2182, _2012, _2192);
    int _2228 = ~_2214;
    int _2230 = _2228 + 1;
    int _2232 = _2230 + 1;
    float _2234 = fma(_2180, _2012, _2190);
    bool _2236 = _2144 != 3;
    float _2238 = _2212 * _2208;
    int _2240 = ~_2218;
    int _2242 = _2240 + 1;
    int _2244 = _2242 + 1;
    float _2246 = -_1540;
    float _2248 = _2246 + 1.0;
    int _2250 = abs(_2224);
    float _2252 = _1616 * _1542;
    int _2254 = _2244;
    float _2256 = _2252;
    if (_2210)
    {
        int _2258 = ~_2218;
        int _2260 = _2258 + 1;
        _2254 = _2260;
    }
    int _2262 = _2254;
    float _2264 = -_1616;
    float _2266 = _2264 + 1.0;
    bool _2268 = !_2236;
    int _2270 = _2268 ? 0 : (-1);
    float _2272 = fma(_2194, _2000, _2234);
    int _2274 = abs(_2262);
    int _2276 = _2232 * as_type<int>(_2130);
    bool _2278 = !_1800;
    int _2280 = _2278 ? 0 : 1;
    int _2282 = ~_2250;
    int _2284 = _2282 + 1;
    int _2286 = _2284 + 1;
    int _2288 = abs(_2270);
    bool _2290 = !_2082;
    int _2292 = _2290 ? 0 : (-1);
    int _2294 = _2286 * as_type<int>(_2122);
    int _2296 = _2294 + _2276;
    int _2298 = abs(_2280);
    int _2300 = ~_2274;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = ~_2054;
    int _2308 = _2306 + _2292;
    int _2310 = _2308 + 1;
    int _2312 = _2304 * as_type<int>(_2160);
    int _2314 = _2312 + _2296;
    int _2316 = ~_2288;
    int _2318 = _2316 + 1;
    int _2320 = _2318 + 1;
    int _2322 = _620 * _2310;
    int _2324 = _2322 + _1734;
    int _2326 = ~_2298;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = _1398 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2334 = _2320 * as_type<int>(_2168);
    int _2336 = _2334 + _2314;
    bool _2338 = !_1573;
    int _2340 = _2338 ? _2324 : (-1);
    float _2342 = -_2238;
    float _2344 = _2342 + 1.0;
    float _2346 = fma(_1438, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2332);
    int _2348 = _2336 * _2330;
    float _2350 = _1563 * _2252;
    float _2352 = fma(_2344, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2238);
    float _2354 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2346);
    int _2356 = _2340 * _2298;
    int _2358 = _2356 + _2348;
    float _2360 = fma(_2220, _2000, _2216);
    float _2362 = _2100 * _2352;
    float _2364 = in.m_75.x;
    float _2366 = fma(_1444, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2354);
    float _2368 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2370 = _2366 + _1472;
    float _2372 = fma(_2198, _2000, _2226);
    float _2374 = _2248 * _2368;
    float _2376 = precise::clamp(_2374, 0.0, 1.0);
    float _2378 = _1553 * _2252;
    float _2380 = _2370 * 0.5;
    float _2382 = _1553 * _2266;
    float _2384 = -_2376;
    float _2386 = fma(_2384, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2388 = fma(_1559, _2378, _1547);
    float _2390 = fma(_1561, _2378, _1549);
    out.m_77.z = _2380;
    out.m_77.w = _1472;
    float _2392 = fma(_1553, _2350, _1551);
    bool _2394 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2396 = isnan(_1246);
    bool _2398 = _2394 || _2396;
    bool _2400 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2402 = _2398 || _2400;
    out.gl_Position.x = _1508;
    out.gl_Position.y = _1522;
    out.gl_Position.z = _2366;
    out.gl_Position.w = _1472;
    float _2404 = float(_2358);
    out.m_79.x = _2388;
    out.m_79.y = _2390;
    out.m_79.z = _2392;
    out.m_79.w = _2382;
    float _2406 = _2386 * _2364;
    float _2408 = _1216 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_81.x = _2360;
    out.m_81.y = _2272;
    out.m_81.z = _2372;
    float _2410 = _2406 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2412 = _2362;
    float _2414 = _2378;
    float _2416 = _2350;
    float _2418 = _2406;
    float _2420 = _2404;
    if (!_2402)
    {
        _2412 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2422 = _2412;
    out.m_83.x = _2404;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2402)
    {
        _2414 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2428 = _2414;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2402)
    {
        _2416 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2434 = _2416;
    out.m_85.x = _2410;
    float _2436 = _2434;
    float _2438 = _2434;
    if (!_2402)
    {
        _2256 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2440 = _2256;
    float _2442 = _2440;
    float _2444 = _2440;
    if (!_2402)
    {
        _2418 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2446 = _2418;
    float _2448 = _2446;
    float _2450 = _2446;
    if (!_2402)
    {
        _2420 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2452 = _2420;
    bool _2454 = !_2402;
    float _2456 = _2452;
    float _2458 = _2452;
    if (!_2454)
    {
        bool _2460 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2462 = isnan(_1246);
        bool _2464 = _2460 || _2462;
        bool _2466 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2468 = _2464 || _2466;
        if (!_2468)
        {
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2472 = _1246 + _2470;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2476 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2474;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2482 = 1.0 / _2476;
            float _2484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2486 = _2484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2488 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2490 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2492 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2494 = _2492 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2496 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2498 = _2496 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2500 = _2472 * _2482;
            float _2502 = precise::clamp(_2500, 0.0, 1.0);
            float _2504 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2506 = _2504 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2508 = fma(_2502, _2480, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2510 = fma(_2502, _2506, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2512 = fma(_2502, _2486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2514 = fma(_2502, _2490, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2516 = fma(_2502, _2494, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2518 = fma(_2502, _2498, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2426 = _2512;
            _2444 = _2516;
            _2458 = _2508;
            _2438 = _2514;
            _2432 = _2510;
            _2450 = _2518;
            _2520 = true;
        }
        else
        {
            bool _2522 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2524 = isnan(_1246);
            bool _2526 = _2522 || _2524;
            bool _2528 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2530 = _2526 || _2528;
            if (!_2530)
            {
                _2456 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2532 = _2456;
            _2458 = _2532;
            if (!_2530)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2534 = _2424;
            _2426 = _2534;
            if (!_2530)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2536 = _2430;
            _2432 = _2536;
            if (!_2530)
            {
                _2436 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2538 = _2436;
            _2438 = _2538;
            if (!_2530)
            {
                _2442 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2540 = _2442;
            _2444 = _2540;
            if (!_2530)
            {
                _2448 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2542 = _2448;
            bool _2544 = !_2530;
            _2450 = _2542;
            if (!_2544)
            {
                bool _2546 = _1246 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2548 = isnan(_1246);
                bool _2550 = _2546 || _2548;
                bool _2552 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2554 = _2550 || _2552;
                if (!_2554)
                {
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2558 = _1246 + _2556;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2562 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2560;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2568 = 1.0 / _2562;
                    float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2582 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2584 = _2582 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2586 = _2558 * _2568;
                    float _2588 = precise::clamp(_2586, 0.0, 1.0);
                    float _2590 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2592 = _2590 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2594 = fma(_2588, _2566, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2596 = fma(_2588, _2592, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2598 = fma(_2588, _2572, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2600 = fma(_2588, _2576, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2602 = fma(_2588, _2580, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2604 = fma(_2588, _2584, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2426 = _2598;
                    _2444 = _2602;
                    _2458 = _2594;
                    _2438 = _2600;
                    _2432 = _2596;
                    _2450 = _2604;
                    _2520 = true;
                }
                else
                {
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2444 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2458 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2438 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2450 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2520 = false;
    float _2606 = _2426;
    float _2608 = _2444;
    float _2610 = _2458;
    float _2612 = _2438;
    float _2614 = _2432;
    float _2616 = _2450;
    float _2618 = _2408 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2620 = fma(_2272, -0.5, 0.5);
    float _2622 = precise::clamp(_2620, 0.0, 1.0);
    float _2624 = -_2606;
    float _2626 = _2624 + _2608;
    float _2628 = -_2610;
    float _2630 = _2628 + _2612;
    out.m_53.x = _2618;
    float _2632 = -_2614;
    float _2634 = _2632 + _2616;
    float _2636 = fma(_2622, _2626, _2606);
    float _2638 = fma(_2622, _2630, _2610);
    bool _2640 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2642 = _2636 * 0.586610972881317138671875;
    float _2644 = fma(_2622, _2634, _2614);
    out.m_87.x = 0.0;
    bool _2646 = _1216 > 0.0;
    bool _2648 = isnan(_1216);
    bool _2650 = _2646 || _2648;
    bool _2652 = isnan(0.0);
    bool _2654 = _2650 || _2652;
    float _2656 = fma(_2638, 0.298911988735198974609375, _2642);
    float _2658 = fma(_2644, 0.114477999508380889892578125, _2656);
    float _2660 = -_2658;
    float _2662 = _2638 + _2660;
    float _2664 = -_2658;
    float _2666 = _2636 + _2664;
    float _2668 = -_2658;
    float _2670 = _2644 + _2668;
    float _2672 = fma(_2662, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    float _2674 = fma(_2666, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    float _2676 = fma(_2670, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2658);
    bool _2678 = !_2640;
    if (!_2678)
    {
        float _2680 = -_1162;
        float _2682 = _2680 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2684 = -_1164;
        float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2688 = -_1166;
        float _2690 = _2688 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2692 = _2682 * _2682;
        float _2694 = fma(_2686, _2686, _2692);
        float _2696 = fma(_2690, _2690, _2694);
        float _2698 = sqrt(_2696);
        float _2700 = rsqrt(_2696);
        float _2702 = -_2698;
        float _2704 = _2702 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2706 = _2704 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2708 = precise::clamp(_2706, 0.0, 1.0);
        float _2710 = _2686 * _2700;
        float _2712 = _2682 * _2700;
        float _2714 = abs(_2708);
        float _2716 = log2(_2714);
        float _2718 = _2690 * _2700;
        float _2720 = _2710 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2722 = _2272 * _2712;
        float _2724 = -_2712;
        float _2726 = -_2720;
        float _2728 = fma(_2724, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2726);
        float _2730 = fma(_2360, _2710, _2722);
        float _2732 = -_2718;
        float _2734 = fma(_2732, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2728);
        float _2736 = fma(_2372, _2718, _2730);
        float _2738 = precise::clamp(_2736, 0.0, 1.0);
        float _2740 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2742 = _2734 + _2740;
        float _2744 = _2716 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2746 = _2742 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2748 = precise::clamp(_2746, 0.0, 1.0);
        float _2750 = exp2(_2744);
        float _2752 = _2750 * _2748;
        float _2754 = _2738 * _2752;
        float _2756 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2758 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2760 = _2754 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_87.x = _2756;
        out.m_87.y = _2758;
        out.m_87.z = _2760;
    }
    out.m_89.x = _2672;
    out.m_89.y = _2674;
    out.m_89.z = _2676;
    if (_2654)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2762 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2762;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

