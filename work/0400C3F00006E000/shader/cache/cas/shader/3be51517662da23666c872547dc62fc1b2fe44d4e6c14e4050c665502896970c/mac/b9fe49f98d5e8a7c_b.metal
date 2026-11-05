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
    float4 m_57 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_91 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_69 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_93 [[user(locn9)]];
    float4 m_89 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_49 [[user(locn12)]];
    float4 m_85 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_63 [[attribute(0)]];
    float4 m_59 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_55 [[attribute(7)]];
    float4 m_65 [[attribute(9)]];
    float4 m_67 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2409 = false;
    bool _642 = false;
    bool _424 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_128);
        out.gl_Position.z = _2708;
    }
    if (!_116)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_166);
        out.gl_Position.z = _2778;
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
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
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
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = 1.0 / _214;
    bool _226 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_198);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = 1.0 / _218;
    float _240 = -_236;
    float _242 = _240 + 1.0;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _222;
    float _248 = _202 * _224;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = _206 * _238;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_256, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _272 = fma(_262, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _274 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_198);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _290 = _210 * _246;
    bool _292 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_198);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_198);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = _302 * _242;
    float _322 = -_302;
    float _324 = _322 + 1.0;
    float _326 = -_314;
    float _328 = _326 + 1.0;
    float _330 = fma(_288, _258, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _332 = _314 * _324;
    float _334 = fma(_318, _258, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_270, _258, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = _284 * _328;
    float _340 = in.m_55.x;
    float _342 = in.m_55.y;
    float _344 = in.m_55.z;
    float _346 = -_284;
    float _348 = _346 + 1.0;
    float _350 = _264 * _338;
    float _352 = _266 * _338;
    float _354 = _272 * _338;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _374 = fma(_358, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_334, _332, _360);
    float _382 = fma(_336, _332, _362);
    float _384 = fma(_330, _332, _372);
    float _386 = fma(_374, _320, _380);
    float _388 = fma(_376, _320, _382);
    float _390 = fma(_378, _320, _384);
    float _392 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    float _398 = _392 * _340;
    float _400 = _394 * _342;
    float _402 = _396 * _344;
    bool _404 = !_244;
    float _422;
    if (!_404)
    {
        float _406 = in.m_53.x;
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _410 = _406 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_112);
        float _428 = 1.0 / _426;
        float _430 = _146 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _442 = 1.0 / _436;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _448;
    bool _452 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _454 = isnan(_432);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _468 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _470 = isnan(_432);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = 1.0 / _440;
    bool _482 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_432);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    bool _494 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_432);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _508 = -_492;
    float _510 = _508 + 1.0;
    float _512 = 1.0 / _446;
    float _514 = _450 * _442;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _432 + _516;
    float _520 = _504 * _510;
    float _522 = -_504;
    float _524 = _522 + 1.0;
    float _526 = fma(_514, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _528 = -_462;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _466;
    float _534 = -_478;
    float _536 = _534 + 1.0;
    float _538 = _526 * _520;
    float _540 = _492 * _530;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _550 = _462 * _536;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _556 = _544 * _480;
    float _558 = _548 * _512;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _432 + _560;
    bool _564 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _566 = isnan(_432);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = _432 + _576;
    float _580 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[115].x, _538);
    float _582 = fma(_558, _562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _586 = _432 + _584;
    float _588 = _554 * _532;
    float _590 = fma(_556, _578, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = fma(_582, _540, _580);
    float _598 = fma(_588, _586, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _600 = _478 * _594;
    float _602 = fma(_590, _550, _596);
    float _604 = fma(_598, _600, _602);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _612 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[119].x, _604);
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _614;
    out.m_57.y = _616;
    out.m_57.z = _618;
    out.m_57.w = _620;
    bool _622 = !_506;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_112);
        float _646 = 1.0 / _644;
        float _648 = _146 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = in.m_53.x;
    float _654 = in.m_53.y;
    float _656 = in.m_53.z;
    float _658 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _660 = log2(_658);
    float _662 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _664 = in.m_46.x;
    float _666 = in.m_46.y;
    float _668 = in.m_46.z;
    float _670 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _686 = _684 != 0;
    float _688 = _660 * _146;
    bool _690 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _698 = _694 || _696;
    float _700 = exp2(_688);
    float _702 = _652 * 2.0;
    float _704 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _706 = _652 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _708 = _656 * 2.0;
    float _710 = _654 * 2.0;
    float _712 = floor(_702);
    float _714 = fma(_704, -2.0, _672);
    float _716 = _666 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _718 = -_674;
    float _720 = fma(_706, 2.0, _718);
    float _722 = _654 + _656;
    float _724 = _666 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _726 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[5].x, _716);
    float _728 = _656 + _652;
    float _730 = floor(_708);
    float _732 = _722 + (-1.0);
    float _734 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[4].x, _724);
    float _736 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[5].z, _726);
    float _738 = -_700;
    float _740 = _738 + 1.0;
    float _742 = _728 + (-1.0);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _746 = _654 + _652;
    float _748 = floor(_710);
    float _750 = _666 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _752 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[4].z, _734);
    float _754 = _736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _756 = _712 > 0.0;
    float _758 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[6].x, _750);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _746 + (-1.0);
    float _764 = _698 ? _740 : 0.0;
    float _766 = _752 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = _754 + _768;
    bool _772 = _712 >= 0.0;
    bool _774 = isnan(_712);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[6].z, _758);
    bool _784 = _730 > 0.0;
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _788 = _730 >= 0.0;
    bool _790 = isnan(_730);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _800 = _766 + _798;
    float _802 = _770 * _770;
    int _804 = _780 ? 0 : 1;
    float _806 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _808 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _810 = fma(_800, _800, _802);
    int _812 = _796 ? 0 : 1;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _806 + _814;
    int _818 = ~_804;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _826 = _748 > 0.0;
    float _828 = fma(_816, _816, _810);
    bool _830 = _748 >= 0.0;
    bool _832 = isnan(_748);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[79].z, _824);
    int _842 = _822;
    if (!_756)
    {
        int _844 = ~_804;
        int _846 = _844 + 1;
        _842 = _846;
    }
    int _848 = _842;
    float _850 = sqrt(_828);
    float _852 = in.m_59.x;
    float _854 = in.m_59.y;
    float _856 = in.m_59.z;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _870 = 1.0 + _868;
    bool _872 = !_682;
    int _874 = _872 ? 0 : 1;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _880 = _838 ? 0 : 1;
    float _882 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[79].x, _840);
    float _884 = 1.0 / _870;
    float _886 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[78].z, _876);
    int _888 = abs(_874);
    float _890 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _878);
    float _892 = -_146;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[76].x, _720);
    float _896 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _886);
    float _898 = float(_888);
    float _900 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    float _902 = float(_848);
    float _904 = rsqrt(_828);
    int _906 = ~_880;
    int _908 = _906 + 1;
    int _910 = _908 + 1;
    float _912 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _714);
    int _914 = _910;
    if (!_826)
    {
        int _916 = ~_880;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = _898 * _902;
    float _924 = _808 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _926 = _850 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    if (_866)
    {
        float _928 = _764 * _884;
        _148 = _928;
    }
    float _930 = _148;
    float _932 = _922 * (-2.0);
    bool _934 = !_678;
    int _936 = _934 ? 0 : 1;
    float _938 = _654 + (-0.5);
    float _940 = precise::min(_924, _926);
    float _942 = fma(_932, _854, _854);
    int _944 = abs(_936);
    float _946 = fma(_744, _932, _744);
    bool _948 = !_686;
    int _950 = _948 ? 0 : 1;
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].y, _942);
    float _954 = _904 * _940;
    int _956 = abs(_950);
    float _958 = fma(_946, _930, _952);
    int _960 = ~_812;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _800 * _954;
    int _968 = _964;
    if (!_784)
    {
        int _970 = ~_812;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    float _976 = _652 + (-0.5);
    float _978 = float(_944);
    float _980 = _770 * _954;
    float _982 = -_966;
    float _984 = _800 + _982;
    float _986 = float(_974);
    float _988 = -_980;
    float _990 = _770 + _988;
    float _992 = float(_956);
    float _994 = _656 + (-0.5);
    float _996 = float(_920);
    float _998 = _990 * _990;
    float _1000 = _978 * _986;
    float _1002 = _958 * 0.15915493667125701904296875;
    float _1004 = _992 * _996;
    float _1006 = fma(_984, _984, _998);
    float _1008 = _1000 * (-2.0);
    float _1010 = _816 * _954;
    float _1012 = _1004 * (-2.0);
    float _1014 = _1002 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = fma(_1008, _852, _852);
    float _1020 = fma(_786, _1008, _786);
    float _1022 = -_1010;
    float _1024 = _816 + _1022;
    float _1026 = fma(_1012, _856, _856);
    float _1028 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1018);
    float _1030 = fma(_760, _1012, _760);
    float _1032 = fma(_1024, _1024, _1006);
    float _1034 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1026);
    float _1036 = fma(_1020, _930, _1028);
    float _1038 = in.m_61.x;
    float _1040 = in.m_61.y;
    float _1042 = in.m_61.z;
    float _1044 = sqrt(_1032);
    float _1046 = fma(_1030, _930, _1034);
    float _1048 = _1036 * 0.15915493667125701904296875;
    float _1050 = in.m_63.y;
    float _1052 = _1046 * 0.15915493667125701904296875;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1062 = _1058 || _1060;
    float _1064 = _1002 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    bool _1068 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1070 = isnan(0.5);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1076 = _1072 || _1074;
    float _1078 = _1048 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    float _1082 = _904 * _1044;
    float _1084 = _662 * _1082;
    float _1086 = _808 * _1082;
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1040);
    float _1090 = _1048 * 6.283185482025146484375;
    float _1092 = cos(_1090);
    float _1094 = _670 * _1082;
    float _1096 = _1052 * 6.283185482025146484375;
    float _1098 = cos(_1096);
    float _1100 = _1080 * _1016;
    float _1102 = _1080 * _1066;
    float _1104 = _1052 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    float _1108 = _1092 * _1066;
    float _1110 = _1092 * _1016;
    float _1112 = _1080 * _1098;
    float _1114 = _1066 * _1098;
    float _1116 = _1092 * _1098;
    float _1118 = _1016 * _1098;
    float _1120 = _1084 * _1088;
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1038);
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1042);
    float _1126 = fma(_1106, _1108, _1100);
    float _1128 = _1086 * _1122;
    float _1130 = _1116 * _1120;
    float _1132 = -_1110;
    float _1134 = fma(_1106, _1102, _1132);
    float _1136 = -_1102;
    float _1138 = fma(_1106, _1110, _1136);
    float _1140 = _1094 * _1124;
    float _1142 = -_1120;
    float _1144 = _1106 * _1142;
    float _1146 = fma(_1126, _1128, _1130);
    float _1148 = _1112 * _1120;
    float _1150 = fma(_1106, _1100, _1108);
    float _1152 = fma(_1114, _1128, _1144);
    float _1154 = fma(_1138, _1140, _1146);
    float _1156 = _666 + _1050;
    float _1158 = fma(_1134, _1128, _1148);
    float _1160 = fma(_1118, _1140, _1152);
    float _1162 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1166 = fma(_1150, _1140, _1158);
    float _1168 = -_980;
    float _1170 = _1168 + _1156;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1162);
    float _1174 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1164);
    float _1176 = -_966;
    float _1178 = _766 + _1176;
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1172);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1174);
    float _1186 = -_1010;
    float _1188 = _806 + _1186;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1180);
    float _1192 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1194 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1196 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1198 = _806 + _1192;
    float _1200 = _766 + _1194;
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1198 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1210 = _1200 + _1208;
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1214 = 1.0 / _1202;
    float _1216 = _1206 * _1206;
    float _1218 = fma(_1210, _1210, _1216);
    float _1220 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1212);
    float _1222 = sqrt(_1218);
    float _1224 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1220);
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1228 = _1226 + _1202;
    float _1230 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1232 = _1228 * _1214;
    float _1234 = _1232 * 0.5;
    float _1236 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1230);
    bool _1238 = _1222 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1236);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1248 = 1.0 / _1242;
    float _1250 = _1156 + _1246;
    float _1252 = _1166;
    float _1254 = _1246;
    float _1256 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1258 = _1250;
    if (!_1238)
    {
        _1252 = _1200;
    }
    float _1260 = _1252;
    float _1262 = _1260;
    if (!_1238)
    {
        _1254 = _1198;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1238)
    {
        _1256 = _1250;
    }
    float _1268 = _1256;
    bool _1270 = !_1238;
    float _1272 = _1268;
    float _1274 = _1248;
    if (!_1270)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1222 + _1278;
        float _1282 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = _1280 * _1276;
        float _1286 = rsqrt(_1218);
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = fma(_1292, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1300 = _1286 * _1298;
        float _1302 = _1296 + (-1.0);
        float _1304 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = fma(_1210, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1308 = fma(_1206, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1310 = fma(_1250, _1296, _1304);
        _1272 = _1310;
        _1262 = _1306;
        _1266 = _1308;
    }
    float _1312 = _1272;
    float _1314 = _1262;
    float _1316 = _1266;
    float _1318 = -_980;
    float _1320 = _1318 + _1312;
    float _1322 = -_966;
    float _1324 = _1322 + _1314;
    float _1326 = -_1010;
    float _1328 = _1326 + _1316;
    float _1330 = _1320;
    float _1332 = _1324;
    float _1334 = _1328;
    float _1336 = _1314;
    if (_1076)
    {
        _1258 = 1.0;
    }
    float _1338 = _1258;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1342 = _1248 * _1340;
    float _1344 = _1338;
    if (!_1062)
    {
        float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1348 = _1170 + _1346;
        float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1352 = _1178 + _1350;
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1356 = -_1156;
        float _1358 = _1356 + _1312;
        float _1360 = _1348 * _1348;
        float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1364 = _1188 + _1362;
        float _1366 = -_806;
        float _1368 = _1366 + _1316;
        float _1370 = fma(_1352, _1352, _1360);
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1374 = fma(_1364, _1364, _1370);
        float _1376 = sqrt(_1374);
        float _1378 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1380 = precise::min(_1376, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1382 = _1380 * _1372;
        float _1384 = -_766;
        float _1386 = _1384 + _1314;
        float _1388 = _1378 * _1382;
        float _1390 = fma(_1386, _1388, _1178);
        float _1392 = fma(_1358, _1388, _1170);
        float _1394 = fma(_1368, _1388, _1188);
        _1330 = _1392;
        _1332 = _1390;
        _1334 = _1394;
    }
    float _1396 = _1330;
    float _1398 = _1332;
    float _1400 = _1334;
    if (!_1076)
    {
        float _1402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1408 = _1404 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 0.15915493667125701904296875;
        float _1414 = _1404 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = 1.0 / _1410;
        float _1420 = _1412 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        float _1424 = _1416 * _1418;
        float _1426 = _1412 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = 1.0 / _1430;
        float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1436 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1434;
        float _1438 = 1.0 / _1436;
        float _1440 = _1428 * _1432;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1342, _1440, _1442);
        float _1446 = _1444 * _1438;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1336 = _1404;
        _1344 = _1448;
    }
    float _1450 = _1336;
    float _1452 = _1344;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1456 = _1396 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1460 = _1398 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1464 = _1400 + _1462;
    float _1466 = _1456 * _1456;
    float _1468 = fma(_1460, _1460, _1466);
    float _1470 = fma(_1464, _1464, _1468);
    float _1472 = rsqrt(_1470);
    float _1474 = sqrt(_1470);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1460 * _1476;
    float _1480 = _1464 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1464;
    float _1498 = _1486;
    float _1500 = _1494;
    float _1502 = _1450;
    float _1504 = _1456;
    if (_1490)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1506;
    }
    float _1508 = _1496;
    if (_1490)
    {
        float _1510 = rsqrt(_1486);
        _1498 = _1510;
    }
    float _1512 = _1498;
    float _1514 = _1512;
    if (_1490)
    {
        float _1516 = _1494 * _1508;
        _1500 = _1516;
    }
    float _1518 = _1500;
    if (_1490)
    {
        float _1520 = _1518 * 0.15915493667125701904296875;
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1472;
    float _1526 = _1522;
    if (_1490)
    {
        float _1528 = _1522 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1536 = precise::max(0.0, _1534);
    float _1538 = _1508;
    float _1540 = _1536;
    if (_1490)
    {
        float _1542 = _1522 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = -_1476;
    float _1550 = -_1536;
    float _1552 = fma(_1456, _1548, _1550);
    float _1554 = _1552;
    if (_1490)
    {
        float _1556 = _1552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1556;
    }
    float _1558 = _1504;
    if (!_1490)
    {
        _1526 = _1478;
    }
    float _1560 = _1526;
    float _1562 = _1532;
    float _1564 = _1560;
    if (_1490)
    {
        float _1566 = fma(_1532, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1562 = _1566;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    float _1572 = _1546;
    if (_1490)
    {
        float _1574 = _1546 + (-1.0);
        _1540 = _1574;
    }
    float _1576 = _1540;
    float _1578 = _1576;
    if (_1490)
    {
        float _1580 = _1512 * _1568;
        _1274 = _1580;
    }
    float _1582 = _1274;
    if (!_1490)
    {
        _1514 = _1482;
    }
    float _1584 = _1514;
    float _1586 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1584;
    if (_1490)
    {
        float _1590 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1590;
    }
    float _1592 = _1578;
    if (_1490)
    {
        float _1594 = _1478 * _1582;
        _1564 = _1594;
    }
    float _1596 = _1564;
    if (!_1490)
    {
        _1570 = _1484;
    }
    float _1598 = _1570;
    float _1600 = _1598;
    if (_1490)
    {
        float _1602 = fma(_1552, _1546, _1592);
        _1554 = _1602;
    }
    float _1604 = _1554;
    if (!_1490)
    {
        _1572 = _1480;
    }
    float _1606 = _1572;
    float _1608 = _1606;
    if (_1490)
    {
        float _1610 = _1480 * _1582;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_1490)
    {
        float _1614 = _1596 * _1596;
        _1588 = _1614;
    }
    float _1616 = _1588;
    float _1618 = floor(_1586);
    if (_1490)
    {
        float _1620 = _1612 * _1612;
        _1600 = _1620;
    }
    float _1622 = _1600;
    float _1624 = fma(_1604, _1604, _1616);
    float _1626 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1628 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1630 = _1624 + _1622;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1626);
    float _1640 = rsqrt(_1630);
    float _1642 = -_1636;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1188, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1648 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1638);
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1628);
    float _1656 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1660 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = abs(_1644);
    float _1664 = log2(_1662);
    float _1666 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1672 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1674 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1676 = _1640 * _1596;
    float _1678 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1680 = _1640 * _1604;
    float _1682 = _1640 * _1612;
    float _1684 = -_1668;
    float _1686 = fma(_1684, _1652, 1.0);
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1694 = floor(_1646);
    float _1696 = -_1688;
    float _1698 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1696);
    float _1700 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1692);
    float _1704 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1706 = -_1682;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1698);
    float _1710 = -_1618;
    float _1712 = _1586 + _1710;
    float _1714 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1716 = fma(_1708, -0.5, 0.5);
    float _1718 = fma(_1708, 0.5, 0.5);
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1714);
    float _1722 = log2(_1686);
    float _1724 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1728 = fma(_1718, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = -_1694;
    float _1732 = _1646 + _1730;
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1736 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1726);
    float _1738 = fma(_1718, _1728, -0.212114393711090087890625);
    float _1740 = exp2(_1704);
    float _1742 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1746 = _1680 + 1.0;
    float _1748 = 1.0 / _1720;
    float _1750 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1752 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1744);
    float _1754 = _1722 * 0.693147182464599609375;
    float _1756 = sqrt(_1716);
    float _1758 = -_1680;
    float _1760 = fma(_1740, _1746, _1758);
    float2 _5303 = float2(_1712, _1732);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5303, float2(0.0), isnan(_5303)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5303, float2(0.0), isnan(_5303)), level(0.0)).x;
    float _1764 = fma(_1718, _1738, 1.570728778839111328125);
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1768 = _1750 * _1748;
    float _1770 = _1752 * _1748;
    float _1772 = fma(_1760, 0.5, 0.5);
    float _1774 = fma(_1768, 0.5, 0.5);
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = _1756 * 0.636619746685028076171875;
    float3 _5337 = float3(_1774, _1776, _1766);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5337, float3(0.0), isnan(_5337)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5337, float3(0.0), isnan(_5337)), level(0.0)).x;
    float _1782 = -_1764;
    float _1784 = fma(_1778, _1782, 1.0);
    float3 _5353 = float3(_1774, _1776, _1766);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _5369 = float2(_1784, _1772);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5369, float2(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5369, float2(0.0), isnan(_5369)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = in.m_65.y;
    float _1809 = _882 * (-0.15915493667125701904296875);
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1813 = _1811 != 0;
    float _1815 = in.m_67.x;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1819 = _1817 != 0;
    float _1821 = in.m_67.z;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1827 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1829 = in.m_67.w;
    float _1831 = 1.0 / _1825;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1837 = 0.0;
    if (_1813)
    {
        float _1839 = in.m_53.x;
        _1837 = _1839;
    }
    float _1841 = _1837;
    bool _1843 = _654 > 0.5;
    float _1845 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1847;
    float _1851 = in.m_65.x;
    float _1853 = 1.0 / _1835;
    float _1855 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1857 = in.m_67.y;
    float _1859 = -_1807;
    float _1861 = _1859 + 1.0;
    float _1863 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1855);
    out.m_69.x = _1815;
    float _1865 = _1849 * _1831;
    float _1867 = _1807;
    float _1869 = _1865;
    if (_1819)
    {
        float _1871 = _1843 ? _1861 : _1807;
        _1867 = _1871;
    }
    float _1873 = _1867;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1879 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1881 = isnan(_650);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    out.m_69.z = _1821;
    bool _1891 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1893 = isnan(_650);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _650 + _1905;
    out.m_69.w = _1829;
    float _1909 = _1877 * _1853;
    float _1911 = -_1901;
    float _1913 = _1911 + 1.0;
    bool _1915 = _1841 > 0.5;
    bool _1917 = _1915 && _1813;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1923 = -_1889;
    float _1925 = _1923 + 1.0;
    float _1927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1929 = fma(_1865, _1907, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1931 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1933 = isnan(_650);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = _1901 * _1925;
    float _1945 = _1941;
    if (!_1813)
    {
        _1869 = _1851;
    }
    float _1947 = _1869;
    out.m_69.y = _1857;
    float _1949 = _1941 * _1913;
    float _1951 = 1.0 / _1921;
    float _1953 = -_1941;
    float _1955 = _1953 + 1.0;
    float _1957 = _1947;
    if (_1813)
    {
        _1945 = _1851;
    }
    float _1959 = _1945;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1961;
    out.m_71.x = _1178;
    out.m_71.y = _1170;
    out.m_71.z = _1188;
    bool _1965 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1967 = isnan(_650);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1959;
    if (_1917)
    {
        float _1979 = -_1959;
        float _1981 = _1979 + 1.0;
        _1977 = _1981;
    }
    float _1983 = _1977;
    float _1985 = _1809 * 6.283185482025146484375;
    float _1987 = sin(_1985);
    float _1989 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1991 = _1975 * _1955;
    bool _1993 = _1040 != 0.0;
    bool _1995 = isnan(_1040);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.0);
    bool _2001 = _1997 || _1999;
    float _2003 = -_1975;
    float _2005 = _2003 + 1.0;
    float _2007 = fma(_1989, _1873, -0.5);
    if (_1813)
    {
        _1957 = _1983;
    }
    float _2009 = _1957;
    float _2011 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2013 = _1809 * 6.283185482025146484375;
    float _2015 = cos(_2013);
    float _2017 = _1963 * _1951;
    float _2019 = _1929 * _1991;
    float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2023 = _650 + _2021;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2027 = _650 + _2025;
    float _2029 = fma(_2011, _2009, -0.5);
    bool _2031 = _1038 == 0.0;
    bool _2033 = !_2001;
    bool _2035 = _2031 && _2033;
    float _2037 = fma(_1909, _2023, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2039 = _1987 * _2007;
    float _2041 = in.m_73.x;
    float _2043 = in.m_73.y;
    float _2045 = in.m_73.z;
    bool _2047 = _1042 == 0.0;
    bool _2049 = _2047 && _2035;
    float _2051 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2019);
    float _2053 = fma(_2017, _2027, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2055 = fma(_2037, _1949, _2051);
    float _2057 = _2015 * _2007;
    float _2059 = -_2039;
    float _2061 = fma(_2015, _2029, _2059);
    float _2063 = exp2(_1827);
    float _2065 = fma(_2053, _1943, _2055);
    float _2067 = fma(_1987, _2029, _2057);
    float _2069 = fma(_896, _2061, _894);
    out.m_75.w = _940;
    float _2071 = -_912;
    float _2073 = fma(_900, _2067, _2071);
    float _2075 = abs(_1342);
    float _2077 = log2(_2075);
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2083 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2065);
    float _2085 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2087 = _2079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2089 = _2043;
    float _2091 = _2041;
    float _2093 = _2045;
    if (!_2049)
    {
        float _2095 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2043);
        _2089 = _2095;
    }
    float _2097 = _2089;
    float _2099 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_2049)
    {
        float _2101 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2041);
        _2091 = _2101;
    }
    float _2103 = _2091;
    float _2105 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_2049)
    {
        float _2107 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2045);
        _2093 = _2107;
    }
    float _2109 = _2093;
    float _2111 = -_1106;
    float _2113 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2099);
    float _2115 = -_1106;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2085);
    float _2119 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2105);
    float _2121 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2123 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2125 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2113);
    float _2127 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2119);
    float _2129 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2131 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2121);
    float _2133 = _2125 * _2097;
    float _2135 = exp2(_2123);
    float _2137 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2129);
    bool _2139 = _1342 <= 8000.0;
    bool _2141 = isnan(_1342);
    bool _2143 = _2139 || _2141;
    bool _2145 = isnan(8000.0);
    bool _2147 = _2143 || _2145;
    float _2149 = float(_2147);
    float _2151 = fma(_2127, _2103, _2133);
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2155 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2157 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2159 = _2083 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2161 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2073 + 0.5;
    float _2165 = -_1106;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2155);
    float _2169 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2171 = -_2063;
    float _2173 = _2171 + 1.0;
    out.m_77.x = _2161;
    out.m_77.y = _2087;
    out.m_77.z = _2157;
    out.m_77.w = _2159;
    float _2175 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2117);
    float _2177 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2179 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2181 = precise::clamp(_2179, 0.0, 1.0);
    float _2183 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2167);
    float _2185 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2169);
    float _2187 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2189 = fma(_2181, -2.0, 3.0);
    float _2191 = _2181 * _2181;
    float _2193 = in.m_63.x;
    float _2195 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2177);
    float _2197 = _2175 * _2097;
    float _2199 = _2191 * _2189;
    float _2201 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2131);
    float _2203 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2205 = _2183 * _2097;
    float _2207 = -_2199;
    float _2209 = _2207 + 1.0;
    float _2211 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2185);
    float _2213 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2203);
    float _2215 = _2069 + 0.5;
    float _2217 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2199);
    float _2219 = _1720 * 0.5;
    float _2221 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2195);
    float _2223 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    float _2225 = _2149 * _2217;
    float _2227 = fma(_1752, -0.5, _2219);
    float _2229 = fma(_2201, _2103, _2197);
    float _2231 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2233 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2213);
    float _2235 = fma(_2211, _2103, _2205);
    out.m_79.x = _2215;
    out.m_79.y = _2163;
    float _2237 = fma(_2221, _2109, _2151);
    float _2239 = fma(_2223, _2109, _2229);
    float _2241 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1863);
    float _2243 = fma(_2233, _2109, _2235);
    out.m_81.x = _1398;
    out.m_81.y = _1396;
    out.m_81.z = _1400;
    bool _2245 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2247 = isnan(_1474);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2253 = _2249 || _2251;
    float _2255 = _2241 + _1720;
    float _2257 = _1750 + _1720;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _2241;
    out.gl_Position.w = _1720;
    float _2259 = _2255 * 0.5;
    float _2261 = _2257 * 0.5;
    out.m_83.x = _2237;
    out.m_83.y = _2239;
    out.m_83.z = _2243;
    out.m_85.x = _1086;
    float _2263 = _2221;
    float _2265 = _1720;
    float _2267 = _2259;
    float _2269 = _2227;
    float _2271 = _2261;
    if (!_2253)
    {
        _2263 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _2263;
    out.m_87.x = _2261;
    out.m_87.y = _2227;
    out.m_87.z = _2259;
    out.m_87.w = _1720;
    float _2275 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2253)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2281 = _2265;
    float _2283 = _2281;
    float _2285 = _2281;
    if (!_2253)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2287 = _2267;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2253)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2293 = _2269;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2253)
    {
        _2271 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2299 = _2271;
    float _2301 = -_1762;
    float _2303 = _2301 + 1.0;
    float _2305 = _2303 * _2231;
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2307;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2313 = _2311 * _2193;
    float _2315 = _2187 * _1780;
    float _2317 = -_2187;
    float _2319 = _2317 + 1.0;
    float _2321 = _2313 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2323 = _1795 * _2315;
    float _2325 = _1795 * _2319;
    out.m_89.x = _2321;
    float _2327 = _1805 * _2315;
    float _2329 = fma(_1801, _2323, _1789);
    float _2331 = fma(_1803, _2323, _1791);
    float _2333 = _2323;
    float _2335 = _2299;
    float _2337 = _2299;
    if (!_2253)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2339 = _2333;
    float _2341 = fma(_1795, _2327, _1793);
    out.m_91.x = _2329;
    out.m_91.y = _2331;
    out.m_91.z = _2341;
    out.m_91.w = _2325;
    bool _2343 = !_2253;
    float _2345 = _2339;
    float _2347 = _2339;
    if (!_2343)
    {
        bool _2349 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2351 = isnan(_1474);
        bool _2353 = _2349 || _2351;
        bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2357 = _2353 || _2355;
        if (!_2357)
        {
            float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2361 = _1474 + _2359;
            float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2365 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2363;
            float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2371 = 1.0 / _2365;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2389 = _2361 * _2371;
            float _2391 = precise::clamp(_2389, 0.0, 1.0);
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2397 = fma(_2391, _2369, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2399 = fma(_2391, _2395, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2401 = fma(_2391, _2375, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2403 = fma(_2391, _2379, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2405 = fma(_2391, _2383, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2407 = fma(_2391, _2387, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2347 = _2401;
            _2297 = _2405;
            _2279 = _2397;
            _2291 = _2403;
            _2285 = _2399;
            _2337 = _2407;
            _2409 = true;
        }
        else
        {
            bool _2411 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2413 = isnan(_1474);
            bool _2415 = _2411 || _2413;
            bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2419 = _2415 || _2417;
            if (!_2419)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2421 = _2277;
            _2279 = _2421;
            if (!_2419)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2423 = _2345;
            _2347 = _2423;
            if (!_2419)
            {
                _2283 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2425 = _2283;
            _2285 = _2425;
            if (!_2419)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2427 = _2289;
            _2291 = _2427;
            if (!_2419)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2429 = _2295;
            _2297 = _2429;
            if (!_2419)
            {
                _2335 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2431 = _2335;
            bool _2433 = !_2419;
            _2337 = _2431;
            if (!_2433)
            {
                bool _2435 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2437 = isnan(_1474);
                bool _2439 = _2435 || _2437;
                bool _2441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2443 = _2439 || _2441;
                if (!_2443)
                {
                    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2447 = _1474 + _2445;
                    float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2451 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2449;
                    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2457 = 1.0 / _2451;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2475 = _2447 * _2457;
                    float _2477 = precise::clamp(_2475, 0.0, 1.0);
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2483 = fma(_2477, _2455, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2485 = fma(_2477, _2481, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2487 = fma(_2477, _2461, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2489 = fma(_2477, _2465, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2491 = fma(_2477, _2469, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2493 = fma(_2477, _2473, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2347 = _2487;
                    _2297 = _2491;
                    _2279 = _2483;
                    _2291 = _2489;
                    _2285 = _2485;
                    _2337 = _2493;
                    _2409 = true;
                }
                else
                {
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2285 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2337 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2409 = false;
    float _2495 = _2347;
    float _2497 = _2297;
    float _2499 = _2279;
    float _2501 = _2291;
    float _2503 = _2285;
    float _2505 = _2337;
    float _2507 = fma(_2239, -0.5, 0.5);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = -_2495;
    float _2513 = _2511 + _2497;
    float _2515 = _2275 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2517 = -_2499;
    float _2519 = _2517 + _2501;
    float _2521 = fma(_2509, _2513, _2495);
    out.m_93.x = 0.0;
    float _2523 = -_2503;
    float _2525 = _2523 + _2505;
    float _2527 = fma(_2509, _2519, _2499);
    float _2529 = _2521 * 0.586610972881317138671875;
    out.m_49.x = _2515;
    bool _2531 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2533 = fma(_2509, _2525, _2503);
    float _2535 = fma(_2527, 0.298911988735198974609375, _2529);
    bool _2537 = _1452 > 0.0;
    bool _2539 = isnan(_1452);
    bool _2541 = _2537 || _2539;
    bool _2543 = isnan(0.0);
    bool _2545 = _2541 || _2543;
    float _2547 = fma(_2533, 0.114477999508380889892578125, _2535);
    float _2549 = -_2547;
    float _2551 = _2527 + _2549;
    float _2553 = -_2547;
    float _2555 = _2521 + _2553;
    float _2557 = -_2547;
    float _2559 = _2533 + _2557;
    float _2561 = fma(_2551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    float _2565 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    bool _2567 = !_2531;
    if (!_2567)
    {
        float _2569 = -_1396;
        float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2573 = -_1398;
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2577 = -_1400;
        float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2581 = _2571 * _2571;
        float _2583 = fma(_2575, _2575, _2581);
        float _2585 = fma(_2579, _2579, _2583);
        float _2587 = sqrt(_2585);
        float _2589 = rsqrt(_2585);
        float _2591 = -_2587;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        float _2599 = _2575 * _2589;
        float _2601 = _2571 * _2589;
        float _2603 = abs(_2597);
        float _2605 = log2(_2603);
        float _2607 = _2579 * _2589;
        float _2609 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2611 = _2239 * _2601;
        float _2613 = -_2601;
        float _2615 = -_2609;
        float _2617 = fma(_2613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2615);
        float _2619 = fma(_2237, _2599, _2611);
        float _2621 = -_2607;
        float _2623 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2617);
        float _2625 = fma(_2243, _2607, _2619);
        float _2627 = precise::clamp(_2625, 0.0, 1.0);
        float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2631 = _2623 + _2629;
        float _2633 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2635 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2637 = precise::clamp(_2635, 0.0, 1.0);
        float _2639 = exp2(_2633);
        float _2641 = _2639 * _2637;
        float _2643 = _2627 * _2641;
        float _2645 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2647 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2649 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2645;
        out.m_93.y = _2647;
        out.m_93.z = _2649;
    }
    out.m_75.x = _2561;
    out.m_75.y = _2563;
    out.m_75.z = _2565;
    if (_2545)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _2651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2651;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2409 = false;
    bool _642 = false;
    bool _424 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_128);
        out.gl_Position.z = _2708;
    }
    if (!_116)
    {
        return out;
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_166);
        out.gl_Position.z = _2778;
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
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
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
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = 1.0 / _214;
    bool _226 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_198);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = 1.0 / _218;
    float _240 = -_236;
    float _242 = _240 + 1.0;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _222;
    float _248 = _202 * _224;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = _206 * _238;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_256, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _272 = fma(_262, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _274 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_198);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _290 = _210 * _246;
    bool _292 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_198);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_198);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = _302 * _242;
    float _322 = -_302;
    float _324 = _322 + 1.0;
    float _326 = -_314;
    float _328 = _326 + 1.0;
    float _330 = fma(_288, _258, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _332 = _314 * _324;
    float _334 = fma(_318, _258, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_270, _258, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = _284 * _328;
    float _340 = in.m_55.x;
    float _342 = in.m_55.y;
    float _344 = in.m_55.z;
    float _346 = -_284;
    float _348 = _346 + 1.0;
    float _350 = _264 * _338;
    float _352 = _266 * _338;
    float _354 = _272 * _338;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _374 = fma(_358, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_334, _332, _360);
    float _382 = fma(_336, _332, _362);
    float _384 = fma(_330, _332, _372);
    float _386 = fma(_374, _320, _380);
    float _388 = fma(_376, _320, _382);
    float _390 = fma(_378, _320, _384);
    float _392 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    float _398 = _392 * _340;
    float _400 = _394 * _342;
    float _402 = _396 * _344;
    bool _404 = !_244;
    float _422;
    if (!_404)
    {
        float _406 = in.m_53.x;
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _410 = _406 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_112);
        float _428 = 1.0 / _426;
        float _430 = _146 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _442 = 1.0 / _436;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _448;
    bool _452 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _454 = isnan(_432);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _468 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _470 = isnan(_432);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = 1.0 / _440;
    bool _482 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_432);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    bool _494 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_432);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _508 = -_492;
    float _510 = _508 + 1.0;
    float _512 = 1.0 / _446;
    float _514 = _450 * _442;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _432 + _516;
    float _520 = _504 * _510;
    float _522 = -_504;
    float _524 = _522 + 1.0;
    float _526 = fma(_514, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _528 = -_462;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _466;
    float _534 = -_478;
    float _536 = _534 + 1.0;
    float _538 = _526 * _520;
    float _540 = _492 * _530;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _550 = _462 * _536;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _556 = _544 * _480;
    float _558 = _548 * _512;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _432 + _560;
    bool _564 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _566 = isnan(_432);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = _432 + _576;
    float _580 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[115].x, _538);
    float _582 = fma(_558, _562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _586 = _432 + _584;
    float _588 = _554 * _532;
    float _590 = fma(_556, _578, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = fma(_582, _540, _580);
    float _598 = fma(_588, _586, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _600 = _478 * _594;
    float _602 = fma(_590, _550, _596);
    float _604 = fma(_598, _600, _602);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _612 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[119].x, _604);
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _614;
    out.m_57.y = _616;
    out.m_57.z = _618;
    out.m_57.w = _620;
    bool _622 = !_506;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_112);
        float _646 = 1.0 / _644;
        float _648 = _146 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = in.m_53.x;
    float _654 = in.m_53.y;
    float _656 = in.m_53.z;
    float _658 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _660 = log2(_658);
    float _662 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _664 = in.m_46.x;
    float _666 = in.m_46.y;
    float _668 = in.m_46.z;
    float _670 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _686 = _684 != 0;
    float _688 = _660 * _146;
    bool _690 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _698 = _694 || _696;
    float _700 = exp2(_688);
    float _702 = _652 * 2.0;
    float _704 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _706 = _652 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _708 = _656 * 2.0;
    float _710 = _654 * 2.0;
    float _712 = floor(_702);
    float _714 = fma(_704, -2.0, _672);
    float _716 = _666 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _718 = -_674;
    float _720 = fma(_706, 2.0, _718);
    float _722 = _654 + _656;
    float _724 = _666 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _726 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[5].x, _716);
    float _728 = _656 + _652;
    float _730 = floor(_708);
    float _732 = _722 + (-1.0);
    float _734 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[4].x, _724);
    float _736 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[5].z, _726);
    float _738 = -_700;
    float _740 = _738 + 1.0;
    float _742 = _728 + (-1.0);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _746 = _654 + _652;
    float _748 = floor(_710);
    float _750 = _666 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _752 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[4].z, _734);
    float _754 = _736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _756 = _712 > 0.0;
    float _758 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[6].x, _750);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _746 + (-1.0);
    float _764 = _698 ? _740 : 0.0;
    float _766 = _752 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = _754 + _768;
    bool _772 = _712 >= 0.0;
    bool _774 = isnan(_712);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[6].z, _758);
    bool _784 = _730 > 0.0;
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _788 = _730 >= 0.0;
    bool _790 = isnan(_730);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _800 = _766 + _798;
    float _802 = _770 * _770;
    int _804 = _780 ? 0 : 1;
    float _806 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _808 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _810 = fma(_800, _800, _802);
    int _812 = _796 ? 0 : 1;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _806 + _814;
    int _818 = ~_804;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _826 = _748 > 0.0;
    float _828 = fma(_816, _816, _810);
    bool _830 = _748 >= 0.0;
    bool _832 = isnan(_748);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[79].z, _824);
    int _842 = _822;
    if (!_756)
    {
        int _844 = ~_804;
        int _846 = _844 + 1;
        _842 = _846;
    }
    int _848 = _842;
    float _850 = sqrt(_828);
    float _852 = in.m_59.x;
    float _854 = in.m_59.y;
    float _856 = in.m_59.z;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _870 = 1.0 + _868;
    bool _872 = !_682;
    int _874 = _872 ? 0 : 1;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _880 = _838 ? 0 : 1;
    float _882 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[79].x, _840);
    float _884 = 1.0 / _870;
    float _886 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[78].z, _876);
    int _888 = abs(_874);
    float _890 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _878);
    float _892 = -_146;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[76].x, _720);
    float _896 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _886);
    float _898 = float(_888);
    float _900 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    float _902 = float(_848);
    float _904 = rsqrt(_828);
    int _906 = ~_880;
    int _908 = _906 + 1;
    int _910 = _908 + 1;
    float _912 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _714);
    int _914 = _910;
    if (!_826)
    {
        int _916 = ~_880;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = _898 * _902;
    float _924 = _808 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _926 = _850 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    if (_866)
    {
        float _928 = _764 * _884;
        _148 = _928;
    }
    float _930 = _148;
    float _932 = _922 * (-2.0);
    bool _934 = !_678;
    int _936 = _934 ? 0 : 1;
    float _938 = _654 + (-0.5);
    float _940 = precise::min(_924, _926);
    float _942 = fma(_932, _854, _854);
    int _944 = abs(_936);
    float _946 = fma(_744, _932, _744);
    bool _948 = !_686;
    int _950 = _948 ? 0 : 1;
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].y, _942);
    float _954 = _904 * _940;
    int _956 = abs(_950);
    float _958 = fma(_946, _930, _952);
    int _960 = ~_812;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _800 * _954;
    int _968 = _964;
    if (!_784)
    {
        int _970 = ~_812;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    float _976 = _652 + (-0.5);
    float _978 = float(_944);
    float _980 = _770 * _954;
    float _982 = -_966;
    float _984 = _800 + _982;
    float _986 = float(_974);
    float _988 = -_980;
    float _990 = _770 + _988;
    float _992 = float(_956);
    float _994 = _656 + (-0.5);
    float _996 = float(_920);
    float _998 = _990 * _990;
    float _1000 = _978 * _986;
    float _1002 = _958 * 0.15915493667125701904296875;
    float _1004 = _992 * _996;
    float _1006 = fma(_984, _984, _998);
    float _1008 = _1000 * (-2.0);
    float _1010 = _816 * _954;
    float _1012 = _1004 * (-2.0);
    float _1014 = _1002 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = fma(_1008, _852, _852);
    float _1020 = fma(_786, _1008, _786);
    float _1022 = -_1010;
    float _1024 = _816 + _1022;
    float _1026 = fma(_1012, _856, _856);
    float _1028 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1018);
    float _1030 = fma(_760, _1012, _760);
    float _1032 = fma(_1024, _1024, _1006);
    float _1034 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1026);
    float _1036 = fma(_1020, _930, _1028);
    float _1038 = in.m_61.x;
    float _1040 = in.m_61.y;
    float _1042 = in.m_61.z;
    float _1044 = sqrt(_1032);
    float _1046 = fma(_1030, _930, _1034);
    float _1048 = _1036 * 0.15915493667125701904296875;
    float _1050 = in.m_63.y;
    float _1052 = _1046 * 0.15915493667125701904296875;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1062 = _1058 || _1060;
    float _1064 = _1002 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    bool _1068 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1070 = isnan(0.5);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1076 = _1072 || _1074;
    float _1078 = _1048 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    float _1082 = _904 * _1044;
    float _1084 = _662 * _1082;
    float _1086 = _808 * _1082;
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1040);
    float _1090 = _1048 * 6.283185482025146484375;
    float _1092 = cos(_1090);
    float _1094 = _670 * _1082;
    float _1096 = _1052 * 6.283185482025146484375;
    float _1098 = cos(_1096);
    float _1100 = _1080 * _1016;
    float _1102 = _1080 * _1066;
    float _1104 = _1052 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    float _1108 = _1092 * _1066;
    float _1110 = _1092 * _1016;
    float _1112 = _1080 * _1098;
    float _1114 = _1066 * _1098;
    float _1116 = _1092 * _1098;
    float _1118 = _1016 * _1098;
    float _1120 = _1084 * _1088;
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1038);
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1042);
    float _1126 = fma(_1106, _1108, _1100);
    float _1128 = _1086 * _1122;
    float _1130 = _1116 * _1120;
    float _1132 = -_1110;
    float _1134 = fma(_1106, _1102, _1132);
    float _1136 = -_1102;
    float _1138 = fma(_1106, _1110, _1136);
    float _1140 = _1094 * _1124;
    float _1142 = -_1120;
    float _1144 = _1106 * _1142;
    float _1146 = fma(_1126, _1128, _1130);
    float _1148 = _1112 * _1120;
    float _1150 = fma(_1106, _1100, _1108);
    float _1152 = fma(_1114, _1128, _1144);
    float _1154 = fma(_1138, _1140, _1146);
    float _1156 = _666 + _1050;
    float _1158 = fma(_1134, _1128, _1148);
    float _1160 = fma(_1118, _1140, _1152);
    float _1162 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1166 = fma(_1150, _1140, _1158);
    float _1168 = -_980;
    float _1170 = _1168 + _1156;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1162);
    float _1174 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1164);
    float _1176 = -_966;
    float _1178 = _766 + _1176;
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1172);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1174);
    float _1186 = -_1010;
    float _1188 = _806 + _1186;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1180);
    float _1192 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1194 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1196 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1198 = _806 + _1192;
    float _1200 = _766 + _1194;
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1198 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1210 = _1200 + _1208;
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1214 = 1.0 / _1202;
    float _1216 = _1206 * _1206;
    float _1218 = fma(_1210, _1210, _1216);
    float _1220 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1212);
    float _1222 = sqrt(_1218);
    float _1224 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1220);
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1228 = _1226 + _1202;
    float _1230 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1232 = _1228 * _1214;
    float _1234 = _1232 * 0.5;
    float _1236 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1230);
    bool _1238 = _1222 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1236);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1248 = 1.0 / _1242;
    float _1250 = _1156 + _1246;
    float _1252 = _1166;
    float _1254 = _1246;
    float _1256 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1258 = _1250;
    if (!_1238)
    {
        _1252 = _1200;
    }
    float _1260 = _1252;
    float _1262 = _1260;
    if (!_1238)
    {
        _1254 = _1198;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1238)
    {
        _1256 = _1250;
    }
    float _1268 = _1256;
    bool _1270 = !_1238;
    float _1272 = _1268;
    float _1274 = _1248;
    if (!_1270)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1222 + _1278;
        float _1282 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = _1280 * _1276;
        float _1286 = rsqrt(_1218);
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = fma(_1292, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1300 = _1286 * _1298;
        float _1302 = _1296 + (-1.0);
        float _1304 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = fma(_1210, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1308 = fma(_1206, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1310 = fma(_1250, _1296, _1304);
        _1272 = _1310;
        _1262 = _1306;
        _1266 = _1308;
    }
    float _1312 = _1272;
    float _1314 = _1262;
    float _1316 = _1266;
    float _1318 = -_980;
    float _1320 = _1318 + _1312;
    float _1322 = -_966;
    float _1324 = _1322 + _1314;
    float _1326 = -_1010;
    float _1328 = _1326 + _1316;
    float _1330 = _1320;
    float _1332 = _1324;
    float _1334 = _1328;
    float _1336 = _1314;
    if (_1076)
    {
        _1258 = 1.0;
    }
    float _1338 = _1258;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1342 = _1248 * _1340;
    float _1344 = _1338;
    if (!_1062)
    {
        float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1348 = _1170 + _1346;
        float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1352 = _1178 + _1350;
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1356 = -_1156;
        float _1358 = _1356 + _1312;
        float _1360 = _1348 * _1348;
        float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1364 = _1188 + _1362;
        float _1366 = -_806;
        float _1368 = _1366 + _1316;
        float _1370 = fma(_1352, _1352, _1360);
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1374 = fma(_1364, _1364, _1370);
        float _1376 = sqrt(_1374);
        float _1378 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1380 = precise::min(_1376, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1382 = _1380 * _1372;
        float _1384 = -_766;
        float _1386 = _1384 + _1314;
        float _1388 = _1378 * _1382;
        float _1390 = fma(_1386, _1388, _1178);
        float _1392 = fma(_1358, _1388, _1170);
        float _1394 = fma(_1368, _1388, _1188);
        _1330 = _1392;
        _1332 = _1390;
        _1334 = _1394;
    }
    float _1396 = _1330;
    float _1398 = _1332;
    float _1400 = _1334;
    if (!_1076)
    {
        float _1402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1408 = _1404 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 0.15915493667125701904296875;
        float _1414 = _1404 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = 1.0 / _1410;
        float _1420 = _1412 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        float _1424 = _1416 * _1418;
        float _1426 = _1412 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = 1.0 / _1430;
        float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1436 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1434;
        float _1438 = 1.0 / _1436;
        float _1440 = _1428 * _1432;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1342, _1440, _1442);
        float _1446 = _1444 * _1438;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1336 = _1404;
        _1344 = _1448;
    }
    float _1450 = _1336;
    float _1452 = _1344;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1456 = _1396 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1460 = _1398 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1464 = _1400 + _1462;
    float _1466 = _1456 * _1456;
    float _1468 = fma(_1460, _1460, _1466);
    float _1470 = fma(_1464, _1464, _1468);
    float _1472 = rsqrt(_1470);
    float _1474 = sqrt(_1470);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1460 * _1476;
    float _1480 = _1464 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1464;
    float _1498 = _1486;
    float _1500 = _1494;
    float _1502 = _1450;
    float _1504 = _1456;
    if (_1490)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1506;
    }
    float _1508 = _1496;
    if (_1490)
    {
        float _1510 = rsqrt(_1486);
        _1498 = _1510;
    }
    float _1512 = _1498;
    float _1514 = _1512;
    if (_1490)
    {
        float _1516 = _1494 * _1508;
        _1500 = _1516;
    }
    float _1518 = _1500;
    if (_1490)
    {
        float _1520 = _1518 * 0.15915493667125701904296875;
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1472;
    float _1526 = _1522;
    if (_1490)
    {
        float _1528 = _1522 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1536 = precise::max(0.0, _1534);
    float _1538 = _1508;
    float _1540 = _1536;
    if (_1490)
    {
        float _1542 = _1522 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = -_1476;
    float _1550 = -_1536;
    float _1552 = fma(_1456, _1548, _1550);
    float _1554 = _1552;
    if (_1490)
    {
        float _1556 = _1552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1556;
    }
    float _1558 = _1504;
    if (!_1490)
    {
        _1526 = _1478;
    }
    float _1560 = _1526;
    float _1562 = _1532;
    float _1564 = _1560;
    if (_1490)
    {
        float _1566 = fma(_1532, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1562 = _1566;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    float _1572 = _1546;
    if (_1490)
    {
        float _1574 = _1546 + (-1.0);
        _1540 = _1574;
    }
    float _1576 = _1540;
    float _1578 = _1576;
    if (_1490)
    {
        float _1580 = _1512 * _1568;
        _1274 = _1580;
    }
    float _1582 = _1274;
    if (!_1490)
    {
        _1514 = _1482;
    }
    float _1584 = _1514;
    float _1586 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1584;
    if (_1490)
    {
        float _1590 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1590;
    }
    float _1592 = _1578;
    if (_1490)
    {
        float _1594 = _1478 * _1582;
        _1564 = _1594;
    }
    float _1596 = _1564;
    if (!_1490)
    {
        _1570 = _1484;
    }
    float _1598 = _1570;
    float _1600 = _1598;
    if (_1490)
    {
        float _1602 = fma(_1552, _1546, _1592);
        _1554 = _1602;
    }
    float _1604 = _1554;
    if (!_1490)
    {
        _1572 = _1480;
    }
    float _1606 = _1572;
    float _1608 = _1606;
    if (_1490)
    {
        float _1610 = _1480 * _1582;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_1490)
    {
        float _1614 = _1596 * _1596;
        _1588 = _1614;
    }
    float _1616 = _1588;
    float _1618 = floor(_1586);
    if (_1490)
    {
        float _1620 = _1612 * _1612;
        _1600 = _1620;
    }
    float _1622 = _1600;
    float _1624 = fma(_1604, _1604, _1616);
    float _1626 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1628 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1630 = _1624 + _1622;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1626);
    float _1640 = rsqrt(_1630);
    float _1642 = -_1636;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1188, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1648 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1638);
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1628);
    float _1656 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1660 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = abs(_1644);
    float _1664 = log2(_1662);
    float _1666 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1672 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1674 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1676 = _1640 * _1596;
    float _1678 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1680 = _1640 * _1604;
    float _1682 = _1640 * _1612;
    float _1684 = -_1668;
    float _1686 = fma(_1684, _1652, 1.0);
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1694 = floor(_1646);
    float _1696 = -_1688;
    float _1698 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1696);
    float _1700 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1692);
    float _1704 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1706 = -_1682;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1698);
    float _1710 = -_1618;
    float _1712 = _1586 + _1710;
    float _1714 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1716 = fma(_1708, -0.5, 0.5);
    float _1718 = fma(_1708, 0.5, 0.5);
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1714);
    float _1722 = log2(_1686);
    float _1724 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1728 = fma(_1718, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = -_1694;
    float _1732 = _1646 + _1730;
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1736 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1726);
    float _1738 = fma(_1718, _1728, -0.212114393711090087890625);
    float _1740 = exp2(_1704);
    float _1742 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1746 = _1680 + 1.0;
    float _1748 = 1.0 / _1720;
    float _1750 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1752 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1744);
    float _1754 = _1722 * 0.693147182464599609375;
    float _1756 = sqrt(_1716);
    float _1758 = -_1680;
    float _1760 = fma(_1740, _1746, _1758);
    float2 _5303 = float2(_1712, _1732);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5303, float2(0.0), isnan(_5303)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5303, float2(0.0), isnan(_5303)), level(0.0)).x;
    float _1764 = fma(_1718, _1738, 1.570728778839111328125);
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1768 = _1750 * _1748;
    float _1770 = _1752 * _1748;
    float _1772 = fma(_1760, 0.5, 0.5);
    float _1774 = fma(_1768, 0.5, 0.5);
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = _1756 * 0.636619746685028076171875;
    float3 _5337 = float3(_1774, _1776, _1766);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5337, float3(0.0), isnan(_5337)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5337, float3(0.0), isnan(_5337)), level(0.0)).x;
    float _1782 = -_1764;
    float _1784 = fma(_1778, _1782, 1.0);
    float3 _5353 = float3(_1774, _1776, _1766);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _5369 = float2(_1784, _1772);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5369, float2(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5369, float2(0.0), isnan(_5369)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = in.m_65.y;
    float _1809 = _882 * (-0.15915493667125701904296875);
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1813 = _1811 != 0;
    float _1815 = in.m_67.x;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1819 = _1817 != 0;
    float _1821 = in.m_67.z;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1827 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1829 = in.m_67.w;
    float _1831 = 1.0 / _1825;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1837 = 0.0;
    if (_1813)
    {
        float _1839 = in.m_53.x;
        _1837 = _1839;
    }
    float _1841 = _1837;
    bool _1843 = _654 > 0.5;
    float _1845 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1847;
    float _1851 = in.m_65.x;
    float _1853 = 1.0 / _1835;
    float _1855 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1857 = in.m_67.y;
    float _1859 = -_1807;
    float _1861 = _1859 + 1.0;
    float _1863 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1855);
    out.m_69.x = _1815;
    float _1865 = _1849 * _1831;
    float _1867 = _1807;
    float _1869 = _1865;
    if (_1819)
    {
        float _1871 = _1843 ? _1861 : _1807;
        _1867 = _1871;
    }
    float _1873 = _1867;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1879 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1881 = isnan(_650);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    out.m_69.z = _1821;
    bool _1891 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1893 = isnan(_650);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _650 + _1905;
    out.m_69.w = _1829;
    float _1909 = _1877 * _1853;
    float _1911 = -_1901;
    float _1913 = _1911 + 1.0;
    bool _1915 = _1841 > 0.5;
    bool _1917 = _1915 && _1813;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1923 = -_1889;
    float _1925 = _1923 + 1.0;
    float _1927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1929 = fma(_1865, _1907, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1931 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1933 = isnan(_650);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = _1901 * _1925;
    float _1945 = _1941;
    if (!_1813)
    {
        _1869 = _1851;
    }
    float _1947 = _1869;
    out.m_69.y = _1857;
    float _1949 = _1941 * _1913;
    float _1951 = 1.0 / _1921;
    float _1953 = -_1941;
    float _1955 = _1953 + 1.0;
    float _1957 = _1947;
    if (_1813)
    {
        _1945 = _1851;
    }
    float _1959 = _1945;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1961;
    out.m_71.x = _1178;
    out.m_71.y = _1170;
    out.m_71.z = _1188;
    bool _1965 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1967 = isnan(_650);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1959;
    if (_1917)
    {
        float _1979 = -_1959;
        float _1981 = _1979 + 1.0;
        _1977 = _1981;
    }
    float _1983 = _1977;
    float _1985 = _1809 * 6.283185482025146484375;
    float _1987 = sin(_1985);
    float _1989 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1991 = _1975 * _1955;
    bool _1993 = _1040 != 0.0;
    bool _1995 = isnan(_1040);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.0);
    bool _2001 = _1997 || _1999;
    float _2003 = -_1975;
    float _2005 = _2003 + 1.0;
    float _2007 = fma(_1989, _1873, -0.5);
    if (_1813)
    {
        _1957 = _1983;
    }
    float _2009 = _1957;
    float _2011 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2013 = _1809 * 6.283185482025146484375;
    float _2015 = cos(_2013);
    float _2017 = _1963 * _1951;
    float _2019 = _1929 * _1991;
    float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2023 = _650 + _2021;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2027 = _650 + _2025;
    float _2029 = fma(_2011, _2009, -0.5);
    bool _2031 = _1038 == 0.0;
    bool _2033 = !_2001;
    bool _2035 = _2031 && _2033;
    float _2037 = fma(_1909, _2023, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2039 = _1987 * _2007;
    float _2041 = in.m_73.x;
    float _2043 = in.m_73.y;
    float _2045 = in.m_73.z;
    bool _2047 = _1042 == 0.0;
    bool _2049 = _2047 && _2035;
    float _2051 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2019);
    float _2053 = fma(_2017, _2027, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2055 = fma(_2037, _1949, _2051);
    float _2057 = _2015 * _2007;
    float _2059 = -_2039;
    float _2061 = fma(_2015, _2029, _2059);
    float _2063 = exp2(_1827);
    float _2065 = fma(_2053, _1943, _2055);
    float _2067 = fma(_1987, _2029, _2057);
    float _2069 = fma(_896, _2061, _894);
    out.m_75.w = _940;
    float _2071 = -_912;
    float _2073 = fma(_900, _2067, _2071);
    float _2075 = abs(_1342);
    float _2077 = log2(_2075);
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2083 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2065);
    float _2085 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2087 = _2079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2089 = _2043;
    float _2091 = _2041;
    float _2093 = _2045;
    if (!_2049)
    {
        float _2095 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2043);
        _2089 = _2095;
    }
    float _2097 = _2089;
    float _2099 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_2049)
    {
        float _2101 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2041);
        _2091 = _2101;
    }
    float _2103 = _2091;
    float _2105 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_2049)
    {
        float _2107 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2045);
        _2093 = _2107;
    }
    float _2109 = _2093;
    float _2111 = -_1106;
    float _2113 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2099);
    float _2115 = -_1106;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2085);
    float _2119 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2105);
    float _2121 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2123 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2125 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2113);
    float _2127 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2119);
    float _2129 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2131 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2121);
    float _2133 = _2125 * _2097;
    float _2135 = exp2(_2123);
    float _2137 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2129);
    bool _2139 = _1342 <= 8000.0;
    bool _2141 = isnan(_1342);
    bool _2143 = _2139 || _2141;
    bool _2145 = isnan(8000.0);
    bool _2147 = _2143 || _2145;
    float _2149 = float(_2147);
    float _2151 = fma(_2127, _2103, _2133);
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2155 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2157 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2159 = _2083 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2161 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2073 + 0.5;
    float _2165 = -_1106;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2155);
    float _2169 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2171 = -_2063;
    float _2173 = _2171 + 1.0;
    out.m_77.x = _2161;
    out.m_77.y = _2087;
    out.m_77.z = _2157;
    out.m_77.w = _2159;
    float _2175 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2117);
    float _2177 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2179 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2181 = precise::clamp(_2179, 0.0, 1.0);
    float _2183 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2167);
    float _2185 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2169);
    float _2187 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2189 = fma(_2181, -2.0, 3.0);
    float _2191 = _2181 * _2181;
    float _2193 = in.m_63.x;
    float _2195 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2177);
    float _2197 = _2175 * _2097;
    float _2199 = _2191 * _2189;
    float _2201 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2131);
    float _2203 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2205 = _2183 * _2097;
    float _2207 = -_2199;
    float _2209 = _2207 + 1.0;
    float _2211 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2185);
    float _2213 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2203);
    float _2215 = _2069 + 0.5;
    float _2217 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2199);
    float _2219 = _1720 * 0.5;
    float _2221 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2195);
    float _2223 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    float _2225 = _2149 * _2217;
    float _2227 = fma(_1752, -0.5, _2219);
    float _2229 = fma(_2201, _2103, _2197);
    float _2231 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2233 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2213);
    float _2235 = fma(_2211, _2103, _2205);
    out.m_79.x = _2215;
    out.m_79.y = _2163;
    float _2237 = fma(_2221, _2109, _2151);
    float _2239 = fma(_2223, _2109, _2229);
    float _2241 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1863);
    float _2243 = fma(_2233, _2109, _2235);
    out.m_81.x = _1398;
    out.m_81.y = _1396;
    out.m_81.z = _1400;
    bool _2245 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2247 = isnan(_1474);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2253 = _2249 || _2251;
    float _2255 = _2241 + _1720;
    float _2257 = _1750 + _1720;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _2241;
    out.gl_Position.w = _1720;
    float _2259 = _2255 * 0.5;
    float _2261 = _2257 * 0.5;
    out.m_83.x = _2237;
    out.m_83.y = _2239;
    out.m_83.z = _2243;
    out.m_85.x = _1086;
    float _2263 = _2221;
    float _2265 = _1720;
    float _2267 = _2259;
    float _2269 = _2227;
    float _2271 = _2261;
    if (!_2253)
    {
        _2263 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _2263;
    out.m_87.x = _2261;
    out.m_87.y = _2227;
    out.m_87.z = _2259;
    out.m_87.w = _1720;
    float _2275 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2253)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2281 = _2265;
    float _2283 = _2281;
    float _2285 = _2281;
    if (!_2253)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2287 = _2267;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2253)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2293 = _2269;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2253)
    {
        _2271 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2299 = _2271;
    float _2301 = -_1762;
    float _2303 = _2301 + 1.0;
    float _2305 = _2303 * _2231;
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2307;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2313 = _2311 * _2193;
    float _2315 = _2187 * _1780;
    float _2317 = -_2187;
    float _2319 = _2317 + 1.0;
    float _2321 = _2313 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2323 = _1795 * _2315;
    float _2325 = _1795 * _2319;
    out.m_89.x = _2321;
    float _2327 = _1805 * _2315;
    float _2329 = fma(_1801, _2323, _1789);
    float _2331 = fma(_1803, _2323, _1791);
    float _2333 = _2323;
    float _2335 = _2299;
    float _2337 = _2299;
    if (!_2253)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2339 = _2333;
    float _2341 = fma(_1795, _2327, _1793);
    out.m_91.x = _2329;
    out.m_91.y = _2331;
    out.m_91.z = _2341;
    out.m_91.w = _2325;
    bool _2343 = !_2253;
    float _2345 = _2339;
    float _2347 = _2339;
    if (!_2343)
    {
        bool _2349 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2351 = isnan(_1474);
        bool _2353 = _2349 || _2351;
        bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2357 = _2353 || _2355;
        if (!_2357)
        {
            float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2361 = _1474 + _2359;
            float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2365 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2363;
            float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2371 = 1.0 / _2365;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2389 = _2361 * _2371;
            float _2391 = precise::clamp(_2389, 0.0, 1.0);
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2397 = fma(_2391, _2369, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2399 = fma(_2391, _2395, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2401 = fma(_2391, _2375, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2403 = fma(_2391, _2379, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2405 = fma(_2391, _2383, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2407 = fma(_2391, _2387, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2347 = _2401;
            _2297 = _2405;
            _2279 = _2397;
            _2291 = _2403;
            _2285 = _2399;
            _2337 = _2407;
            _2409 = true;
        }
        else
        {
            bool _2411 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2413 = isnan(_1474);
            bool _2415 = _2411 || _2413;
            bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2419 = _2415 || _2417;
            if (!_2419)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2421 = _2277;
            _2279 = _2421;
            if (!_2419)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2423 = _2345;
            _2347 = _2423;
            if (!_2419)
            {
                _2283 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2425 = _2283;
            _2285 = _2425;
            if (!_2419)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2427 = _2289;
            _2291 = _2427;
            if (!_2419)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2429 = _2295;
            _2297 = _2429;
            if (!_2419)
            {
                _2335 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2431 = _2335;
            bool _2433 = !_2419;
            _2337 = _2431;
            if (!_2433)
            {
                bool _2435 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2437 = isnan(_1474);
                bool _2439 = _2435 || _2437;
                bool _2441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2443 = _2439 || _2441;
                if (!_2443)
                {
                    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2447 = _1474 + _2445;
                    float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2451 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2449;
                    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2457 = 1.0 / _2451;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2475 = _2447 * _2457;
                    float _2477 = precise::clamp(_2475, 0.0, 1.0);
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2483 = fma(_2477, _2455, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2485 = fma(_2477, _2481, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2487 = fma(_2477, _2461, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2489 = fma(_2477, _2465, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2491 = fma(_2477, _2469, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2493 = fma(_2477, _2473, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2347 = _2487;
                    _2297 = _2491;
                    _2279 = _2483;
                    _2291 = _2489;
                    _2285 = _2485;
                    _2337 = _2493;
                    _2409 = true;
                }
                else
                {
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2285 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2337 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2409 = false;
    float _2495 = _2347;
    float _2497 = _2297;
    float _2499 = _2279;
    float _2501 = _2291;
    float _2503 = _2285;
    float _2505 = _2337;
    float _2507 = fma(_2239, -0.5, 0.5);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = -_2495;
    float _2513 = _2511 + _2497;
    float _2515 = _2275 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2517 = -_2499;
    float _2519 = _2517 + _2501;
    float _2521 = fma(_2509, _2513, _2495);
    out.m_93.x = 0.0;
    float _2523 = -_2503;
    float _2525 = _2523 + _2505;
    float _2527 = fma(_2509, _2519, _2499);
    float _2529 = _2521 * 0.586610972881317138671875;
    out.m_49.x = _2515;
    bool _2531 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2533 = fma(_2509, _2525, _2503);
    float _2535 = fma(_2527, 0.298911988735198974609375, _2529);
    bool _2537 = _1452 > 0.0;
    bool _2539 = isnan(_1452);
    bool _2541 = _2537 || _2539;
    bool _2543 = isnan(0.0);
    bool _2545 = _2541 || _2543;
    float _2547 = fma(_2533, 0.114477999508380889892578125, _2535);
    float _2549 = -_2547;
    float _2551 = _2527 + _2549;
    float _2553 = -_2547;
    float _2555 = _2521 + _2553;
    float _2557 = -_2547;
    float _2559 = _2533 + _2557;
    float _2561 = fma(_2551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    float _2565 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    bool _2567 = !_2531;
    if (!_2567)
    {
        float _2569 = -_1396;
        float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2573 = -_1398;
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2577 = -_1400;
        float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2581 = _2571 * _2571;
        float _2583 = fma(_2575, _2575, _2581);
        float _2585 = fma(_2579, _2579, _2583);
        float _2587 = sqrt(_2585);
        float _2589 = rsqrt(_2585);
        float _2591 = -_2587;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        float _2599 = _2575 * _2589;
        float _2601 = _2571 * _2589;
        float _2603 = abs(_2597);
        float _2605 = log2(_2603);
        float _2607 = _2579 * _2589;
        float _2609 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2611 = _2239 * _2601;
        float _2613 = -_2601;
        float _2615 = -_2609;
        float _2617 = fma(_2613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2615);
        float _2619 = fma(_2237, _2599, _2611);
        float _2621 = -_2607;
        float _2623 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2617);
        float _2625 = fma(_2243, _2607, _2619);
        float _2627 = precise::clamp(_2625, 0.0, 1.0);
        float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2631 = _2623 + _2629;
        float _2633 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2635 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2637 = precise::clamp(_2635, 0.0, 1.0);
        float _2639 = exp2(_2633);
        float _2641 = _2639 * _2637;
        float _2643 = _2627 * _2641;
        float _2645 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2647 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2649 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2645;
        out.m_93.y = _2647;
        out.m_93.z = _2649;
    }
    out.m_75.x = _2561;
    out.m_75.y = _2563;
    out.m_75.z = _2565;
    if (_2545)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _2651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2651;
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
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2409 = false;
    bool _642 = false;
    bool _424 = false;
    bool _190 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _107 = in.m_46.w;
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
        out.m_49.x = 0.0;
    }
    int _124 = 0;
    if (!_116)
    {
        float _126 = _120 * 5.0;
        _124 = as_type<int>(_126);
    }
    int _128 = _124;
    int _130 = _128;
    if (!_116)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2708 = as_type<float>(_128);
        out.gl_Position.z = _2708;
    }
    if (!_116)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _132 = in.m_51.w;
    bool _134 = _132 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = isnan(_132);
    bool _138 = _134 || _136;
    bool _140 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _142 = _138 || _140;
    float _144 = -_132;
    float _146 = _144 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _148 = _146;
    if (_142)
    {
        float _150 = float(_112);
        _122 = _150;
    }
    float _152 = _122;
    bool _154 = _146 >= _152;
    bool _156 = !_142;
    bool _158 = _154 || _156;
    float _160 = _152;
    if (_158)
    {
        _160 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _162 = _160;
    if (_158)
    {
        out.m_49.x = 0.0;
    }
    if (_158)
    {
        float _164 = _162 * 5.0;
        _130 = as_type<int>(_164);
    }
    int _166 = _130;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2778 = as_type<float>(_166);
        out.gl_Position.z = _2778;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _170 = !_168;
    float _188;
    if (!_170)
    {
        float _172 = in.m_53.x;
        float _174 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _176 = _172 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _178 = fma(_176, (*spvDescriptorSet0.vp_c9)._m0[12].x, _146);
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
        float _196 = _146 * _194;
        _188 = _196;
    }
    _190 = false;
    float _198 = _188;
    float _200 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _202 = _198 + _200;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _206 = _198 + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _210 = _198 + _208;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _220;
    float _224 = 1.0 / _214;
    bool _226 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _228 = isnan(_198);
    bool _230 = _226 || _228;
    bool _232 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _234 = _230 || _232;
    float _236 = float(_234);
    float _238 = 1.0 / _218;
    float _240 = -_236;
    float _242 = _240 + 1.0;
    bool _244 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _246 = 1.0 / _222;
    float _248 = _202 * _224;
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    float _258 = _206 * _238;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _262 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _260;
    float _264 = fma(_252, _248, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _266 = fma(_256, _248, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _270 = _268 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _272 = fma(_262, _248, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _274 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_198);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _290 = _210 * _246;
    bool _292 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _294 = isnan(_198);
    bool _296 = _292 || _294;
    bool _298 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _300 = _296 || _298;
    float _302 = float(_300);
    bool _304 = _198 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _306 = isnan(_198);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _312 = _308 || _310;
    float _314 = float(_312);
    float _316 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _318 = _316 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _320 = _302 * _242;
    float _322 = -_302;
    float _324 = _322 + 1.0;
    float _326 = -_314;
    float _328 = _326 + 1.0;
    float _330 = fma(_288, _258, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _332 = _314 * _324;
    float _334 = fma(_318, _258, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _336 = fma(_270, _258, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _338 = _284 * _328;
    float _340 = in.m_55.x;
    float _342 = in.m_55.y;
    float _344 = in.m_55.z;
    float _346 = -_284;
    float _348 = _346 + 1.0;
    float _350 = _264 * _338;
    float _352 = _266 * _338;
    float _354 = _272 * _338;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _356;
    float _360 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].x, _350);
    float _362 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].y, _352);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _366 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _364;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _368;
    float _372 = fma(_348, (*spvDescriptorSet0.vp_c9)._m0[143].z, _354);
    float _374 = fma(_358, _290, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _376 = fma(_366, _290, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _378 = fma(_370, _290, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _380 = fma(_334, _332, _360);
    float _382 = fma(_336, _332, _362);
    float _384 = fma(_330, _332, _372);
    float _386 = fma(_374, _320, _380);
    float _388 = fma(_376, _320, _382);
    float _390 = fma(_378, _320, _384);
    float _392 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].x, _386);
    float _394 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].y, _388);
    float _396 = fma(_236, (*spvDescriptorSet0.vp_c9)._m0[146].z, _390);
    float _398 = _392 * _340;
    float _400 = _394 * _342;
    float _402 = _396 * _344;
    bool _404 = !_244;
    float _422;
    if (!_404)
    {
        float _406 = in.m_53.x;
        float _408 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _410 = _406 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _412 = fma(_410, (*spvDescriptorSet0.vp_c9)._m0[11].y, _146);
        float _414 = _412 * _408;
        float _416 = floor(_414);
        float _418 = -_416;
        float _420 = _414 + _418;
        _422 = _420;
        _424 = true;
    }
    else
    {
        float _426 = float(_112);
        float _428 = 1.0 / _426;
        float _430 = _146 * _428;
        _422 = _430;
    }
    _424 = false;
    float _432 = _422;
    float _434 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _436 = _434 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _438 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _440 = _438 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _442 = 1.0 / _436;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _448 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _450 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _448;
    bool _452 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _454 = isnan(_432);
    bool _456 = _452 || _454;
    bool _458 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _460 = _456 || _458;
    float _462 = float(_460);
    float _464 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _466 = _464 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _468 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _470 = isnan(_432);
    bool _472 = _468 || _470;
    bool _474 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _476 = _472 || _474;
    float _478 = float(_476);
    float _480 = 1.0 / _440;
    bool _482 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _484 = isnan(_432);
    bool _486 = _482 || _484;
    bool _488 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _490 = _486 || _488;
    float _492 = float(_490);
    bool _494 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _496 = isnan(_432);
    bool _498 = _494 || _496;
    bool _500 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _502 = _498 || _500;
    float _504 = float(_502);
    bool _506 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _508 = -_492;
    float _510 = _508 + 1.0;
    float _512 = 1.0 / _446;
    float _514 = _450 * _442;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _432 + _516;
    float _520 = _504 * _510;
    float _522 = -_504;
    float _524 = _522 + 1.0;
    float _526 = fma(_514, _518, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _528 = -_462;
    float _530 = _528 + 1.0;
    float _532 = 1.0 / _466;
    float _534 = -_478;
    float _536 = _534 + 1.0;
    float _538 = _526 * _520;
    float _540 = _492 * _530;
    float _542 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _544 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _542;
    float _546 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _548 = _546 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _550 = _462 * _536;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _556 = _544 * _480;
    float _558 = _548 * _512;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _562 = _432 + _560;
    bool _564 = _432 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _566 = isnan(_432);
    bool _568 = _564 || _566;
    bool _570 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _572 = _568 || _570;
    float _574 = float(_572);
    float _576 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _578 = _432 + _576;
    float _580 = fma(_524, (*spvDescriptorSet0.vp_c9)._m0[115].x, _538);
    float _582 = fma(_558, _562, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _584 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _586 = _432 + _584;
    float _588 = _554 * _532;
    float _590 = fma(_556, _578, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _592 = -_574;
    float _594 = _592 + 1.0;
    float _596 = fma(_582, _540, _580);
    float _598 = fma(_588, _586, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _600 = _478 * _594;
    float _602 = fma(_590, _550, _596);
    float _604 = fma(_598, _600, _602);
    float _606 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _608 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _610 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _612 = fma(_574, (*spvDescriptorSet0.vp_c9)._m0[119].x, _604);
    float _614 = _606 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _616 = _608 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _618 = _610 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _620 = _612 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_57.x = _614;
    out.m_57.y = _616;
    out.m_57.z = _618;
    out.m_57.w = _620;
    bool _622 = !_506;
    float _640;
    if (!_622)
    {
        float _624 = in.m_53.x;
        float _626 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _628 = _624 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _630 = fma(_628, (*spvDescriptorSet0.vp_c9)._m0[11].w, _146);
        float _632 = _630 * _626;
        float _634 = floor(_632);
        float _636 = -_634;
        float _638 = _632 + _636;
        _640 = _638;
        _642 = true;
    }
    else
    {
        float _644 = float(_112);
        float _646 = 1.0 / _644;
        float _648 = _146 * _646;
        _640 = _648;
    }
    _642 = false;
    float _650 = _640;
    float _652 = in.m_53.x;
    float _654 = in.m_53.y;
    float _656 = in.m_53.z;
    float _658 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _660 = log2(_658);
    float _662 = _400 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _664 = in.m_46.x;
    float _666 = in.m_46.y;
    float _668 = in.m_46.z;
    float _670 = _402 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _672 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _674 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _676 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _678 = _676 != 0;
    int _680 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _682 = _680 != 0;
    int _684 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _686 = _684 != 0;
    float _688 = _660 * _146;
    bool _690 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _692 = isnan(0.0);
    bool _694 = _690 || _692;
    bool _696 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _698 = _694 || _696;
    float _700 = exp2(_688);
    float _702 = _652 * 2.0;
    float _704 = _654 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _706 = _652 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _708 = _656 * 2.0;
    float _710 = _654 * 2.0;
    float _712 = floor(_702);
    float _714 = fma(_704, -2.0, _672);
    float _716 = _666 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _718 = -_674;
    float _720 = fma(_706, 2.0, _718);
    float _722 = _654 + _656;
    float _724 = _666 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _726 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[5].x, _716);
    float _728 = _656 + _652;
    float _730 = floor(_708);
    float _732 = _722 + (-1.0);
    float _734 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[4].x, _724);
    float _736 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[5].z, _726);
    float _738 = -_700;
    float _740 = _738 + 1.0;
    float _742 = _728 + (-1.0);
    float _744 = fma(_732, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _746 = _654 + _652;
    float _748 = floor(_710);
    float _750 = _666 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _752 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[4].z, _734);
    float _754 = _736 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _756 = _712 > 0.0;
    float _758 = fma(_664, (*spvDescriptorSet0.vp_c10)._m0[6].x, _750);
    float _760 = fma(_742, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _762 = _746 + (-1.0);
    float _764 = _698 ? _740 : 0.0;
    float _766 = _752 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _768 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _770 = _754 + _768;
    bool _772 = _712 >= 0.0;
    bool _774 = isnan(_712);
    bool _776 = _772 || _774;
    bool _778 = isnan(0.0);
    bool _780 = _776 || _778;
    float _782 = fma(_668, (*spvDescriptorSet0.vp_c10)._m0[6].z, _758);
    bool _784 = _730 > 0.0;
    float _786 = fma(_762, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _788 = _730 >= 0.0;
    bool _790 = isnan(_730);
    bool _792 = _788 || _790;
    bool _794 = isnan(0.0);
    bool _796 = _792 || _794;
    float _798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _800 = _766 + _798;
    float _802 = _770 * _770;
    int _804 = _780 ? 0 : 1;
    float _806 = _782 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _808 = _398 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _810 = fma(_800, _800, _802);
    int _812 = _796 ? 0 : 1;
    float _814 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _816 = _806 + _814;
    int _818 = ~_804;
    int _820 = _818 + 1;
    int _822 = _820 + 1;
    float _824 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    bool _826 = _748 > 0.0;
    float _828 = fma(_816, _816, _810);
    bool _830 = _748 >= 0.0;
    bool _832 = isnan(_748);
    bool _834 = _830 || _832;
    bool _836 = isnan(0.0);
    bool _838 = _834 || _836;
    float _840 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[79].z, _824);
    int _842 = _822;
    if (!_756)
    {
        int _844 = ~_804;
        int _846 = _844 + 1;
        _842 = _846;
    }
    int _848 = _842;
    float _850 = sqrt(_828);
    float _852 = in.m_59.x;
    float _854 = in.m_59.y;
    float _856 = in.m_59.z;
    bool _858 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(1.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _870 = 1.0 + _868;
    bool _872 = !_682;
    int _874 = _872 ? 0 : 1;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _880 = _838 ? 0 : 1;
    float _882 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[79].x, _840);
    float _884 = 1.0 / _870;
    float _886 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[78].z, _876);
    int _888 = abs(_874);
    float _890 = fma(_654, (*spvDescriptorSet0.vp_c9)._m0[78].w, _878);
    float _892 = -_146;
    float _894 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[76].x, _720);
    float _896 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].z, _886);
    float _898 = float(_888);
    float _900 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[77].w, _890);
    float _902 = float(_848);
    float _904 = rsqrt(_828);
    int _906 = ~_880;
    int _908 = _906 + 1;
    int _910 = _908 + 1;
    float _912 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[76].y, _714);
    int _914 = _910;
    if (!_826)
    {
        int _916 = ~_880;
        int _918 = _916 + 1;
        _914 = _918;
    }
    int _920 = _914;
    float _922 = _898 * _902;
    float _924 = _808 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _926 = _850 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    if (_866)
    {
        float _928 = _764 * _884;
        _148 = _928;
    }
    float _930 = _148;
    float _932 = _922 * (-2.0);
    bool _934 = !_678;
    int _936 = _934 ? 0 : 1;
    float _938 = _654 + (-0.5);
    float _940 = precise::min(_924, _926);
    float _942 = fma(_932, _854, _854);
    int _944 = abs(_936);
    float _946 = fma(_744, _932, _744);
    bool _948 = !_686;
    int _950 = _948 ? 0 : 1;
    float _952 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[196].y, _942);
    float _954 = _904 * _940;
    int _956 = abs(_950);
    float _958 = fma(_946, _930, _952);
    int _960 = ~_812;
    int _962 = _960 + 1;
    int _964 = _962 + 1;
    float _966 = _800 * _954;
    int _968 = _964;
    if (!_784)
    {
        int _970 = ~_812;
        int _972 = _970 + 1;
        _968 = _972;
    }
    int _974 = _968;
    float _976 = _652 + (-0.5);
    float _978 = float(_944);
    float _980 = _770 * _954;
    float _982 = -_966;
    float _984 = _800 + _982;
    float _986 = float(_974);
    float _988 = -_980;
    float _990 = _770 + _988;
    float _992 = float(_956);
    float _994 = _656 + (-0.5);
    float _996 = float(_920);
    float _998 = _990 * _990;
    float _1000 = _978 * _986;
    float _1002 = _958 * 0.15915493667125701904296875;
    float _1004 = _992 * _996;
    float _1006 = fma(_984, _984, _998);
    float _1008 = _1000 * (-2.0);
    float _1010 = _816 * _954;
    float _1012 = _1004 * (-2.0);
    float _1014 = _1002 * 6.283185482025146484375;
    float _1016 = sin(_1014);
    float _1018 = fma(_1008, _852, _852);
    float _1020 = fma(_786, _1008, _786);
    float _1022 = -_1010;
    float _1024 = _816 + _1022;
    float _1026 = fma(_1012, _856, _856);
    float _1028 = fma(_976, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1018);
    float _1030 = fma(_760, _1012, _760);
    float _1032 = fma(_1024, _1024, _1006);
    float _1034 = fma(_994, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1026);
    float _1036 = fma(_1020, _930, _1028);
    float _1038 = in.m_61.x;
    float _1040 = in.m_61.y;
    float _1042 = in.m_61.z;
    float _1044 = sqrt(_1032);
    float _1046 = fma(_1030, _930, _1034);
    float _1048 = _1036 * 0.15915493667125701904296875;
    float _1050 = in.m_63.y;
    float _1052 = _1046 * 0.15915493667125701904296875;
    bool _1054 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1056 = isnan(0.5);
    bool _1058 = _1054 || _1056;
    bool _1060 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1062 = _1058 || _1060;
    float _1064 = _1002 * 6.283185482025146484375;
    float _1066 = cos(_1064);
    bool _1068 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1070 = isnan(0.5);
    bool _1072 = _1068 || _1070;
    bool _1074 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1076 = _1072 || _1074;
    float _1078 = _1048 * 6.283185482025146484375;
    float _1080 = sin(_1078);
    float _1082 = _904 * _1044;
    float _1084 = _662 * _1082;
    float _1086 = _808 * _1082;
    float _1088 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1040);
    float _1090 = _1048 * 6.283185482025146484375;
    float _1092 = cos(_1090);
    float _1094 = _670 * _1082;
    float _1096 = _1052 * 6.283185482025146484375;
    float _1098 = cos(_1096);
    float _1100 = _1080 * _1016;
    float _1102 = _1080 * _1066;
    float _1104 = _1052 * 6.283185482025146484375;
    float _1106 = sin(_1104);
    float _1108 = _1092 * _1066;
    float _1110 = _1092 * _1016;
    float _1112 = _1080 * _1098;
    float _1114 = _1066 * _1098;
    float _1116 = _1092 * _1098;
    float _1118 = _1016 * _1098;
    float _1120 = _1084 * _1088;
    float _1122 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1038);
    float _1124 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1042);
    float _1126 = fma(_1106, _1108, _1100);
    float _1128 = _1086 * _1122;
    float _1130 = _1116 * _1120;
    float _1132 = -_1110;
    float _1134 = fma(_1106, _1102, _1132);
    float _1136 = -_1102;
    float _1138 = fma(_1106, _1110, _1136);
    float _1140 = _1094 * _1124;
    float _1142 = -_1120;
    float _1144 = _1106 * _1142;
    float _1146 = fma(_1126, _1128, _1130);
    float _1148 = _1112 * _1120;
    float _1150 = fma(_1106, _1100, _1108);
    float _1152 = fma(_1114, _1128, _1144);
    float _1154 = fma(_1138, _1140, _1146);
    float _1156 = _666 + _1050;
    float _1158 = fma(_1134, _1128, _1148);
    float _1160 = fma(_1118, _1140, _1152);
    float _1162 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1164 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1166 = fma(_1150, _1140, _1158);
    float _1168 = -_980;
    float _1170 = _1168 + _1156;
    float _1172 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1162);
    float _1174 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1164);
    float _1176 = -_966;
    float _1178 = _766 + _1176;
    float _1180 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1182 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1172);
    float _1184 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1174);
    float _1186 = -_1010;
    float _1188 = _806 + _1186;
    float _1190 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1180);
    float _1192 = _1182 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1194 = _1184 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1196 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1190);
    float _1198 = _806 + _1192;
    float _1200 = _766 + _1194;
    float _1202 = _1196 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1204 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1206 = _1198 + _1204;
    float _1208 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1210 = _1200 + _1208;
    float _1212 = _1170 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1214 = 1.0 / _1202;
    float _1216 = _1206 * _1206;
    float _1218 = fma(_1210, _1210, _1216);
    float _1220 = fma(_1178, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1212);
    float _1222 = sqrt(_1218);
    float _1224 = fma(_1188, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1220);
    float _1226 = _1224 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1228 = _1226 + _1202;
    float _1230 = _1154 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1232 = _1228 * _1214;
    float _1234 = _1232 * 0.5;
    float _1236 = fma(_1160, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1230);
    bool _1238 = _1222 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1240 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1242 = fma(_1234, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1240);
    float _1244 = fma(_1166, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1236);
    float _1246 = _1244 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1248 = 1.0 / _1242;
    float _1250 = _1156 + _1246;
    float _1252 = _1166;
    float _1254 = _1246;
    float _1256 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1258 = _1250;
    if (!_1238)
    {
        _1252 = _1200;
    }
    float _1260 = _1252;
    float _1262 = _1260;
    if (!_1238)
    {
        _1254 = _1198;
    }
    float _1264 = _1254;
    float _1266 = _1264;
    if (!_1238)
    {
        _1256 = _1250;
    }
    float _1268 = _1256;
    bool _1270 = !_1238;
    float _1272 = _1268;
    float _1274 = _1248;
    if (!_1270)
    {
        float _1276 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1278 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1280 = _1222 + _1278;
        float _1282 = _1250 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1284 = _1280 * _1276;
        float _1286 = rsqrt(_1218);
        float _1288 = _1284 * 0.15915493667125701904296875;
        float _1290 = _1288 * 6.283185482025146484375;
        float _1292 = sin(_1290);
        float _1294 = _1288 * 6.283185482025146484375;
        float _1296 = cos(_1294);
        float _1298 = fma(_1292, _1282, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1300 = _1286 * _1298;
        float _1302 = _1296 + (-1.0);
        float _1304 = _1302 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1306 = fma(_1210, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1308 = fma(_1206, _1300, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1310 = fma(_1250, _1296, _1304);
        _1272 = _1310;
        _1262 = _1306;
        _1266 = _1308;
    }
    float _1312 = _1272;
    float _1314 = _1262;
    float _1316 = _1266;
    float _1318 = -_980;
    float _1320 = _1318 + _1312;
    float _1322 = -_966;
    float _1324 = _1322 + _1314;
    float _1326 = -_1010;
    float _1328 = _1326 + _1316;
    float _1330 = _1320;
    float _1332 = _1324;
    float _1334 = _1328;
    float _1336 = _1314;
    if (_1076)
    {
        _1258 = 1.0;
    }
    float _1338 = _1258;
    float _1340 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1342 = _1248 * _1340;
    float _1344 = _1338;
    if (!_1062)
    {
        float _1346 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1348 = _1170 + _1346;
        float _1350 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1352 = _1178 + _1350;
        float _1354 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1356 = -_1156;
        float _1358 = _1356 + _1312;
        float _1360 = _1348 * _1348;
        float _1362 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1364 = _1188 + _1362;
        float _1366 = -_806;
        float _1368 = _1366 + _1316;
        float _1370 = fma(_1352, _1352, _1360);
        float _1372 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1374 = fma(_1364, _1364, _1370);
        float _1376 = sqrt(_1374);
        float _1378 = _1354 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1380 = precise::min(_1376, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1382 = _1380 * _1372;
        float _1384 = -_766;
        float _1386 = _1384 + _1314;
        float _1388 = _1378 * _1382;
        float _1390 = fma(_1386, _1388, _1178);
        float _1392 = fma(_1358, _1388, _1170);
        float _1394 = fma(_1368, _1388, _1188);
        _1330 = _1392;
        _1332 = _1390;
        _1334 = _1394;
    }
    float _1396 = _1330;
    float _1398 = _1332;
    float _1400 = _1334;
    if (!_1076)
    {
        float _1402 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1404 = _1402 * 0.15915493667125701904296875;
        float _1406 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1408 = _1404 * 6.283185482025146484375;
        float _1410 = cos(_1408);
        float _1412 = _1406 * 0.15915493667125701904296875;
        float _1414 = _1404 * 6.283185482025146484375;
        float _1416 = sin(_1414);
        float _1418 = 1.0 / _1410;
        float _1420 = _1412 * 6.283185482025146484375;
        float _1422 = cos(_1420);
        float _1424 = _1416 * _1418;
        float _1426 = _1412 * 6.283185482025146484375;
        float _1428 = sin(_1426);
        float _1430 = _1422 * _1424;
        float _1432 = 1.0 / _1430;
        float _1434 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1436 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1434;
        float _1438 = 1.0 / _1436;
        float _1440 = _1428 * _1432;
        float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1444 = fma(_1342, _1440, _1442);
        float _1446 = _1444 * _1438;
        float _1448 = precise::clamp(_1446, 0.0, 1.0);
        _1336 = _1404;
        _1344 = _1448;
    }
    float _1450 = _1336;
    float _1452 = _1344;
    float _1454 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1456 = _1396 + _1454;
    float _1458 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1460 = _1398 + _1458;
    float _1462 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1464 = _1400 + _1462;
    float _1466 = _1456 * _1456;
    float _1468 = fma(_1460, _1460, _1466);
    float _1470 = fma(_1464, _1464, _1468);
    float _1472 = rsqrt(_1470);
    float _1474 = sqrt(_1470);
    float _1476 = _1472 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1478 = _1460 * _1476;
    float _1480 = _1464 * _1476;
    float _1482 = _1478 * _1478;
    float _1484 = _1480 * _1480;
    float _1486 = _1482 + _1484;
    float _1488 = sqrt(_1486);
    bool _1490 = _1488 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1492 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1494 = _1488 + _1492;
    float _1496 = _1464;
    float _1498 = _1486;
    float _1500 = _1494;
    float _1502 = _1450;
    float _1504 = _1456;
    if (_1490)
    {
        float _1506 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1496 = _1506;
    }
    float _1508 = _1496;
    if (_1490)
    {
        float _1510 = rsqrt(_1486);
        _1498 = _1510;
    }
    float _1512 = _1498;
    float _1514 = _1512;
    if (_1490)
    {
        float _1516 = _1494 * _1508;
        _1500 = _1516;
    }
    float _1518 = _1500;
    if (_1490)
    {
        float _1520 = _1518 * 0.15915493667125701904296875;
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1472;
    float _1526 = _1522;
    if (_1490)
    {
        float _1528 = _1522 * 6.283185482025146484375;
        float _1530 = sin(_1528);
        _1524 = _1530;
    }
    float _1532 = _1524;
    float _1534 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1536 = precise::max(0.0, _1534);
    float _1538 = _1508;
    float _1540 = _1536;
    if (_1490)
    {
        float _1542 = _1522 * 6.283185482025146484375;
        float _1544 = cos(_1542);
        _1538 = _1544;
    }
    float _1546 = _1538;
    float _1548 = -_1476;
    float _1550 = -_1536;
    float _1552 = fma(_1456, _1548, _1550);
    float _1554 = _1552;
    if (_1490)
    {
        float _1556 = _1552 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1504 = _1556;
    }
    float _1558 = _1504;
    if (!_1490)
    {
        _1526 = _1478;
    }
    float _1560 = _1526;
    float _1562 = _1532;
    float _1564 = _1560;
    if (_1490)
    {
        float _1566 = fma(_1532, _1558, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1562 = _1566;
    }
    float _1568 = _1562;
    float _1570 = _1568;
    float _1572 = _1546;
    if (_1490)
    {
        float _1574 = _1546 + (-1.0);
        _1540 = _1574;
    }
    float _1576 = _1540;
    float _1578 = _1576;
    if (_1490)
    {
        float _1580 = _1512 * _1568;
        _1274 = _1580;
    }
    float _1582 = _1274;
    if (!_1490)
    {
        _1514 = _1482;
    }
    float _1584 = _1514;
    float _1586 = fma(_1178, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1588 = _1584;
    if (_1490)
    {
        float _1590 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1578 = _1590;
    }
    float _1592 = _1578;
    if (_1490)
    {
        float _1594 = _1478 * _1582;
        _1564 = _1594;
    }
    float _1596 = _1564;
    if (!_1490)
    {
        _1570 = _1484;
    }
    float _1598 = _1570;
    float _1600 = _1598;
    if (_1490)
    {
        float _1602 = fma(_1552, _1546, _1592);
        _1554 = _1602;
    }
    float _1604 = _1554;
    if (!_1490)
    {
        _1572 = _1480;
    }
    float _1606 = _1572;
    float _1608 = _1606;
    if (_1490)
    {
        float _1610 = _1480 * _1582;
        _1608 = _1610;
    }
    float _1612 = _1608;
    if (_1490)
    {
        float _1614 = _1596 * _1596;
        _1588 = _1614;
    }
    float _1616 = _1588;
    float _1618 = floor(_1586);
    if (_1490)
    {
        float _1620 = _1612 * _1612;
        _1600 = _1620;
    }
    float _1622 = _1600;
    float _1624 = fma(_1604, _1604, _1616);
    float _1626 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1628 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1630 = _1624 + _1622;
    float _1632 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1634 = fma(_1474, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1632);
    float _1636 = precise::clamp(_1634, 0.0, 1.0);
    float _1638 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1626);
    float _1640 = rsqrt(_1630);
    float _1642 = -_1636;
    float _1644 = _1642 + 1.0;
    float _1646 = fma(_1188, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1648 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1650 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1638);
    float _1652 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1654 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1628);
    float _1656 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1648);
    float _1658 = _1650 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1660 = _1396 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1662 = abs(_1644);
    float _1664 = log2(_1662);
    float _1666 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1656);
    float _1668 = _1658 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1670 = fma(_1398, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1660);
    float _1672 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1654);
    float _1674 = _1666 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1676 = _1640 * _1596;
    float _1678 = fma(_1400, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1670);
    float _1680 = _1640 * _1604;
    float _1682 = _1640 * _1612;
    float _1684 = -_1668;
    float _1686 = fma(_1684, _1652, 1.0);
    float _1688 = _1676 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1690 = _1678 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1692 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1694 = floor(_1646);
    float _1696 = -_1688;
    float _1698 = fma(_1680, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1696);
    float _1700 = _1672 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1702 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1692);
    float _1704 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1706 = -_1682;
    float _1708 = fma(_1706, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1698);
    float _1710 = -_1618;
    float _1712 = _1586 + _1710;
    float _1714 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1702);
    float _1716 = fma(_1708, -0.5, 0.5);
    float _1718 = fma(_1708, 0.5, 0.5);
    float _1720 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1714);
    float _1722 = log2(_1686);
    float _1724 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1726 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1728 = fma(_1718, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1730 = -_1694;
    float _1732 = _1646 + _1730;
    float _1734 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1724);
    float _1736 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1726);
    float _1738 = fma(_1718, _1728, -0.212114393711090087890625);
    float _1740 = exp2(_1704);
    float _1742 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1734);
    float _1744 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1736);
    float _1746 = _1680 + 1.0;
    float _1748 = 1.0 / _1720;
    float _1750 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1742);
    float _1752 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1744);
    float _1754 = _1722 * 0.693147182464599609375;
    float _1756 = sqrt(_1716);
    float _1758 = -_1680;
    float _1760 = fma(_1740, _1746, _1758);
    float2 _5303 = float2(_1712, _1732);
    float _1762 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5303, float2(0.0), isnan(_5303)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5303, float2(0.0), isnan(_5303)), level(0.0)).x;
    float _1764 = fma(_1718, _1738, 1.570728778839111328125);
    float _1766 = _1754 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1768 = _1750 * _1748;
    float _1770 = _1752 * _1748;
    float _1772 = fma(_1760, 0.5, 0.5);
    float _1774 = fma(_1768, 0.5, 0.5);
    float _1776 = fma(_1770, -0.5, 0.5);
    float _1778 = _1756 * 0.636619746685028076171875;
    float3 _5337 = float3(_1774, _1776, _1766);
    float _1780 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5337, float3(0.0), isnan(_5337)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5337, float3(0.0), isnan(_5337)), level(0.0)).x;
    float _1782 = -_1764;
    float _1784 = fma(_1778, _1782, 1.0);
    float3 _5353 = float3(_1774, _1776, _1766);
    float4 _1787 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5353, float3(0.0), isnan(_5353)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5353, float3(0.0), isnan(_5353)), level(0.0)).xyzw;
    float _1789 = _1787.x;
    float _1791 = _1787.y;
    float _1793 = _1787.z;
    float _1795 = _1787.w;
    float2 _5369 = float2(_1784, _1772);
    float3 _1799 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5369, float2(0.0), isnan(_5369)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5369, float2(0.0), isnan(_5369)), level(0.0)).xyz;
    float _1801 = _1799.x;
    float _1803 = _1799.y;
    float _1805 = _1799.z;
    float _1807 = in.m_65.y;
    float _1809 = _882 * (-0.15915493667125701904296875);
    int _1811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1813 = _1811 != 0;
    float _1815 = in.m_67.x;
    int _1817 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1819 = _1817 != 0;
    float _1821 = in.m_67.z;
    float _1823 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1825 = _1823 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1827 = _1664 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1829 = in.m_67.w;
    float _1831 = 1.0 / _1825;
    float _1833 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1835 = _1833 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1837 = 0.0;
    if (_1813)
    {
        float _1839 = in.m_53.x;
        _1837 = _1839;
    }
    float _1841 = _1837;
    bool _1843 = _654 > 0.5;
    float _1845 = _1674 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1847 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1849 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1847;
    float _1851 = in.m_65.x;
    float _1853 = 1.0 / _1835;
    float _1855 = fma(_1690, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1845);
    float _1857 = in.m_67.y;
    float _1859 = -_1807;
    float _1861 = _1859 + 1.0;
    float _1863 = fma(_1658, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1855);
    out.m_69.x = _1815;
    float _1865 = _1849 * _1831;
    float _1867 = _1807;
    float _1869 = _1865;
    if (_1819)
    {
        float _1871 = _1843 ? _1861 : _1807;
        _1867 = _1871;
    }
    float _1873 = _1867;
    float _1875 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _1879 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _1881 = isnan(_650);
    bool _1883 = _1879 || _1881;
    bool _1885 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _1887 = _1883 || _1885;
    float _1889 = float(_1887);
    out.m_69.z = _1821;
    bool _1891 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1893 = isnan(_650);
    bool _1895 = _1891 || _1893;
    bool _1897 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1899 = _1895 || _1897;
    float _1901 = float(_1899);
    float _1903 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1905 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1907 = _650 + _1905;
    out.m_69.w = _1829;
    float _1909 = _1877 * _1853;
    float _1911 = -_1901;
    float _1913 = _1911 + 1.0;
    bool _1915 = _1841 > 0.5;
    bool _1917 = _1915 && _1813;
    float _1919 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1921 = _1919 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _1923 = -_1889;
    float _1925 = _1923 + 1.0;
    float _1927 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1929 = fma(_1865, _1907, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1931 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1933 = isnan(_650);
    bool _1935 = _1931 || _1933;
    bool _1937 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1939 = _1935 || _1937;
    float _1941 = float(_1939);
    float _1943 = _1901 * _1925;
    float _1945 = _1941;
    if (!_1813)
    {
        _1869 = _1851;
    }
    float _1947 = _1869;
    out.m_69.y = _1857;
    float _1949 = _1941 * _1913;
    float _1951 = 1.0 / _1921;
    float _1953 = -_1941;
    float _1955 = _1953 + 1.0;
    float _1957 = _1947;
    if (_1813)
    {
        _1945 = _1851;
    }
    float _1959 = _1945;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1963 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _1961;
    out.m_71.x = _1178;
    out.m_71.y = _1170;
    out.m_71.z = _1188;
    bool _1965 = _650 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1967 = isnan(_650);
    bool _1969 = _1965 || _1967;
    bool _1971 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1973 = _1969 || _1971;
    float _1975 = float(_1973);
    float _1977 = _1959;
    if (_1917)
    {
        float _1979 = -_1959;
        float _1981 = _1979 + 1.0;
        _1977 = _1981;
    }
    float _1983 = _1977;
    float _1985 = _1809 * 6.283185482025146484375;
    float _1987 = sin(_1985);
    float _1989 = _1927 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1991 = _1975 * _1955;
    bool _1993 = _1040 != 0.0;
    bool _1995 = isnan(_1040);
    bool _1997 = _1993 || _1995;
    bool _1999 = isnan(0.0);
    bool _2001 = _1997 || _1999;
    float _2003 = -_1975;
    float _2005 = _2003 + 1.0;
    float _2007 = fma(_1989, _1873, -0.5);
    if (_1813)
    {
        _1957 = _1983;
    }
    float _2009 = _1957;
    float _2011 = _1903 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _2013 = _1809 * 6.283185482025146484375;
    float _2015 = cos(_2013);
    float _2017 = _1963 * _1951;
    float _2019 = _1929 * _1991;
    float _2021 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2023 = _650 + _2021;
    float _2025 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2027 = _650 + _2025;
    float _2029 = fma(_2011, _2009, -0.5);
    bool _2031 = _1038 == 0.0;
    bool _2033 = !_2001;
    bool _2035 = _2031 && _2033;
    float _2037 = fma(_1909, _2023, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _2039 = _1987 * _2007;
    float _2041 = in.m_73.x;
    float _2043 = in.m_73.y;
    float _2045 = in.m_73.z;
    bool _2047 = _1042 == 0.0;
    bool _2049 = _2047 && _2035;
    float _2051 = fma(_2005, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2019);
    float _2053 = fma(_2017, _2027, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    float _2055 = fma(_2037, _1949, _2051);
    float _2057 = _2015 * _2007;
    float _2059 = -_2039;
    float _2061 = fma(_2015, _2029, _2059);
    float _2063 = exp2(_1827);
    float _2065 = fma(_2053, _1943, _2055);
    float _2067 = fma(_1987, _2029, _2057);
    float _2069 = fma(_896, _2061, _894);
    out.m_75.w = _940;
    float _2071 = -_912;
    float _2073 = fma(_900, _2067, _2071);
    float _2075 = abs(_1342);
    float _2077 = log2(_2075);
    float _2079 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2083 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2065);
    float _2085 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2087 = _2079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2089 = _2043;
    float _2091 = _2041;
    float _2093 = _2045;
    if (!_2049)
    {
        float _2095 = fma(_1040, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2043);
        _2089 = _2095;
    }
    float _2097 = _2089;
    float _2099 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_2049)
    {
        float _2101 = fma(_1038, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2041);
        _2091 = _2101;
    }
    float _2103 = _2091;
    float _2105 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    if (!_2049)
    {
        float _2107 = fma(_1042, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2045);
        _2093 = _2107;
    }
    float _2109 = _2093;
    float _2111 = -_1106;
    float _2113 = fma(_2111, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2099);
    float _2115 = -_1106;
    float _2117 = fma(_2115, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2085);
    float _2119 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2105);
    float _2121 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2123 = _2077 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2125 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2113);
    float _2127 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2119);
    float _2129 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2131 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2121);
    float _2133 = _2125 * _2097;
    float _2135 = exp2(_2123);
    float _2137 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2129);
    bool _2139 = _1342 <= 8000.0;
    bool _2141 = isnan(_1342);
    bool _2143 = _2139 || _2141;
    bool _2145 = isnan(8000.0);
    bool _2147 = _2143 || _2145;
    float _2149 = float(_2147);
    float _2151 = fma(_2127, _2103, _2133);
    float _2153 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2155 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2157 = _2081 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2159 = _2083 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2161 = _2153 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2163 = _2073 + 0.5;
    float _2165 = -_1106;
    float _2167 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2155);
    float _2169 = _1126 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2171 = -_2063;
    float _2173 = _2171 + 1.0;
    out.m_77.x = _2161;
    out.m_77.y = _2087;
    out.m_77.z = _2157;
    out.m_77.w = _2159;
    float _2175 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2117);
    float _2177 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2179 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2181 = precise::clamp(_2179, 0.0, 1.0);
    float _2183 = fma(_1112, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2167);
    float _2185 = fma(_1114, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2169);
    float _2187 = _2173 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2189 = fma(_2181, -2.0, 3.0);
    float _2191 = _2181 * _2181;
    float _2193 = in.m_63.x;
    float _2195 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2177);
    float _2197 = _2175 * _2097;
    float _2199 = _2191 * _2189;
    float _2201 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2131);
    float _2203 = _1138 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2205 = _2183 * _2097;
    float _2207 = -_2199;
    float _2209 = _2207 + 1.0;
    float _2211 = fma(_1134, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2185);
    float _2213 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2203);
    float _2215 = _2069 + 0.5;
    float _2217 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2199);
    float _2219 = _1720 * 0.5;
    float _2221 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2195);
    float _2223 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2137);
    float _2225 = _2149 * _2217;
    float _2227 = fma(_1752, -0.5, _2219);
    float _2229 = fma(_2201, _2103, _2197);
    float _2231 = _2225 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2233 = fma(_1150, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2213);
    float _2235 = fma(_2211, _2103, _2205);
    out.m_79.x = _2215;
    out.m_79.y = _2163;
    float _2237 = fma(_2221, _2109, _2151);
    float _2239 = fma(_2223, _2109, _2229);
    float _2241 = fma(_1700, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1863);
    float _2243 = fma(_2233, _2109, _2235);
    out.m_81.x = _1398;
    out.m_81.y = _1396;
    out.m_81.z = _1400;
    bool _2245 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2247 = isnan(_1474);
    bool _2249 = _2245 || _2247;
    bool _2251 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2253 = _2249 || _2251;
    float _2255 = _2241 + _1720;
    float _2257 = _1750 + _1720;
    out.gl_Position.x = _1750;
    out.gl_Position.y = _1752;
    out.gl_Position.z = _2241;
    out.gl_Position.w = _1720;
    float _2259 = _2255 * 0.5;
    float _2261 = _2257 * 0.5;
    out.m_83.x = _2237;
    out.m_83.y = _2239;
    out.m_83.z = _2243;
    out.m_85.x = _1086;
    float _2263 = _2221;
    float _2265 = _1720;
    float _2267 = _2259;
    float _2269 = _2227;
    float _2271 = _2261;
    if (!_2253)
    {
        _2263 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2273 = _2263;
    out.m_87.x = _2261;
    out.m_87.y = _2227;
    out.m_87.z = _2259;
    out.m_87.w = _1720;
    float _2275 = _1452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2277 = _2273;
    float _2279 = _2273;
    if (!_2253)
    {
        _2265 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2281 = _2265;
    float _2283 = _2281;
    float _2285 = _2281;
    if (!_2253)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2287 = _2267;
    float _2289 = _2287;
    float _2291 = _2287;
    if (!_2253)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2293 = _2269;
    float _2295 = _2293;
    float _2297 = _2293;
    if (!_2253)
    {
        _2271 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2299 = _2271;
    float _2301 = -_1762;
    float _2303 = _2301 + 1.0;
    float _2305 = _2303 * _2231;
    float _2307 = precise::clamp(_2305, 0.0, 1.0);
    float _2309 = -_2307;
    float _2311 = fma(_2309, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2313 = _2311 * _2193;
    float _2315 = _2187 * _1780;
    float _2317 = -_2187;
    float _2319 = _2317 + 1.0;
    float _2321 = _2313 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2323 = _1795 * _2315;
    float _2325 = _1795 * _2319;
    out.m_89.x = _2321;
    float _2327 = _1805 * _2315;
    float _2329 = fma(_1801, _2323, _1789);
    float _2331 = fma(_1803, _2323, _1791);
    float _2333 = _2323;
    float _2335 = _2299;
    float _2337 = _2299;
    if (!_2253)
    {
        _2333 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2339 = _2333;
    float _2341 = fma(_1795, _2327, _1793);
    out.m_91.x = _2329;
    out.m_91.y = _2331;
    out.m_91.z = _2341;
    out.m_91.w = _2325;
    bool _2343 = !_2253;
    float _2345 = _2339;
    float _2347 = _2339;
    if (!_2343)
    {
        bool _2349 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2351 = isnan(_1474);
        bool _2353 = _2349 || _2351;
        bool _2355 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2357 = _2353 || _2355;
        if (!_2357)
        {
            float _2359 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2361 = _1474 + _2359;
            float _2363 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2365 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2363;
            float _2367 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2369 = _2367 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2371 = 1.0 / _2365;
            float _2373 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2375 = _2373 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2377 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2379 = _2377 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2381 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2383 = _2381 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2385 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2387 = _2385 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2389 = _2361 * _2371;
            float _2391 = precise::clamp(_2389, 0.0, 1.0);
            float _2393 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2395 = _2393 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2397 = fma(_2391, _2369, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2399 = fma(_2391, _2395, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2401 = fma(_2391, _2375, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2403 = fma(_2391, _2379, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2405 = fma(_2391, _2383, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2407 = fma(_2391, _2387, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2347 = _2401;
            _2297 = _2405;
            _2279 = _2397;
            _2291 = _2403;
            _2285 = _2399;
            _2337 = _2407;
            _2409 = true;
        }
        else
        {
            bool _2411 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2413 = isnan(_1474);
            bool _2415 = _2411 || _2413;
            bool _2417 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2419 = _2415 || _2417;
            if (!_2419)
            {
                _2277 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2421 = _2277;
            _2279 = _2421;
            if (!_2419)
            {
                _2345 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2423 = _2345;
            _2347 = _2423;
            if (!_2419)
            {
                _2283 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2425 = _2283;
            _2285 = _2425;
            if (!_2419)
            {
                _2289 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2427 = _2289;
            _2291 = _2427;
            if (!_2419)
            {
                _2295 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2429 = _2295;
            _2297 = _2429;
            if (!_2419)
            {
                _2335 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2431 = _2335;
            bool _2433 = !_2419;
            _2337 = _2431;
            if (!_2433)
            {
                bool _2435 = _1474 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2437 = isnan(_1474);
                bool _2439 = _2435 || _2437;
                bool _2441 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2443 = _2439 || _2441;
                if (!_2443)
                {
                    float _2445 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2447 = _1474 + _2445;
                    float _2449 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2451 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2449;
                    float _2453 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2455 = _2453 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2457 = 1.0 / _2451;
                    float _2459 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2461 = _2459 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2463 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2465 = _2463 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2467 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2469 = _2467 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2471 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2473 = _2471 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2475 = _2447 * _2457;
                    float _2477 = precise::clamp(_2475, 0.0, 1.0);
                    float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2483 = fma(_2477, _2455, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2485 = fma(_2477, _2481, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2487 = fma(_2477, _2461, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2489 = fma(_2477, _2465, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2491 = fma(_2477, _2469, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2493 = fma(_2477, _2473, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2347 = _2487;
                    _2297 = _2491;
                    _2279 = _2483;
                    _2291 = _2489;
                    _2285 = _2485;
                    _2337 = _2493;
                    _2409 = true;
                }
                else
                {
                    _2347 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2297 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2279 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2291 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2285 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2337 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2409 = false;
    float _2495 = _2347;
    float _2497 = _2297;
    float _2499 = _2279;
    float _2501 = _2291;
    float _2503 = _2285;
    float _2505 = _2337;
    float _2507 = fma(_2239, -0.5, 0.5);
    float _2509 = precise::clamp(_2507, 0.0, 1.0);
    float _2511 = -_2495;
    float _2513 = _2511 + _2497;
    float _2515 = _2275 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2517 = -_2499;
    float _2519 = _2517 + _2501;
    float _2521 = fma(_2509, _2513, _2495);
    out.m_93.x = 0.0;
    float _2523 = -_2503;
    float _2525 = _2523 + _2505;
    float _2527 = fma(_2509, _2519, _2499);
    float _2529 = _2521 * 0.586610972881317138671875;
    out.m_49.x = _2515;
    bool _2531 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2533 = fma(_2509, _2525, _2503);
    float _2535 = fma(_2527, 0.298911988735198974609375, _2529);
    bool _2537 = _1452 > 0.0;
    bool _2539 = isnan(_1452);
    bool _2541 = _2537 || _2539;
    bool _2543 = isnan(0.0);
    bool _2545 = _2541 || _2543;
    float _2547 = fma(_2533, 0.114477999508380889892578125, _2535);
    float _2549 = -_2547;
    float _2551 = _2527 + _2549;
    float _2553 = -_2547;
    float _2555 = _2521 + _2553;
    float _2557 = -_2547;
    float _2559 = _2533 + _2557;
    float _2561 = fma(_2551, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    float _2563 = fma(_2555, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    float _2565 = fma(_2559, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2547);
    bool _2567 = !_2531;
    if (!_2567)
    {
        float _2569 = -_1396;
        float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2573 = -_1398;
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2577 = -_1400;
        float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2581 = _2571 * _2571;
        float _2583 = fma(_2575, _2575, _2581);
        float _2585 = fma(_2579, _2579, _2583);
        float _2587 = sqrt(_2585);
        float _2589 = rsqrt(_2585);
        float _2591 = -_2587;
        float _2593 = _2591 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2595 = _2593 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2597 = precise::clamp(_2595, 0.0, 1.0);
        float _2599 = _2575 * _2589;
        float _2601 = _2571 * _2589;
        float _2603 = abs(_2597);
        float _2605 = log2(_2603);
        float _2607 = _2579 * _2589;
        float _2609 = _2599 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2611 = _2239 * _2601;
        float _2613 = -_2601;
        float _2615 = -_2609;
        float _2617 = fma(_2613, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2615);
        float _2619 = fma(_2237, _2599, _2611);
        float _2621 = -_2607;
        float _2623 = fma(_2621, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2617);
        float _2625 = fma(_2243, _2607, _2619);
        float _2627 = precise::clamp(_2625, 0.0, 1.0);
        float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2631 = _2623 + _2629;
        float _2633 = _2605 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2635 = _2631 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2637 = precise::clamp(_2635, 0.0, 1.0);
        float _2639 = exp2(_2633);
        float _2641 = _2639 * _2637;
        float _2643 = _2627 * _2641;
        float _2645 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2647 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2649 = _2643 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_93.x = _2645;
        out.m_93.y = _2647;
        out.m_93.z = _2649;
    }
    out.m_75.x = _2561;
    out.m_75.y = _2563;
    out.m_75.z = _2565;
    if (_2545)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _2651 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2651;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

