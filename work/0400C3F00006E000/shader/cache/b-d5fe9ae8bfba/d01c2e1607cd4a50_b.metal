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
    float4 m_79 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_93 [[user(locn5)]];
    float4 m_91 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_81 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_65 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 m_85 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_83 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_77 [[attribute(4)]];
    float4 m_63 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_73 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2502 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2813 = as_type<float>(_138);
        out.gl_Position.z = _2813;
    }
    if (!_124)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2868 = as_type<float>(_164);
        out.gl_Position.z = _2868;
    }
    if (_158)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _166 = 1.0 / _152;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _120 * _166;
    bool _172 = !_168;
    float _174 = _170;
    float _192;
    if (!_172)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _170;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _206 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_196);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = 1.0 / _200;
    float _220 = _202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _196 + _224;
    float _228 = _204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _234 = -_216;
    float _236 = _234 + 1.0;
    bool _238 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_196);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    out.m_57.x = _220;
    out.m_57.y = _230;
    out.m_57.z = _228;
    out.m_57.w = _232;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _258;
    float _262 = _226 * _218;
    float _264 = _248 * _236;
    float _266 = in.m_59.x;
    float _268 = in.m_59.y;
    float _270 = in.m_59.z;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _274 = fma(_252, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = fma(_256, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _278 = fma(_260, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = -_248;
    float _282 = _280 + 1.0;
    float _284 = _274 * _264;
    float _286 = _276 * _264;
    float _288 = _278 * _264;
    float _290 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    float _302 = _298 * _268;
    float _304 = _296 * _266;
    float _306 = _300 * _270;
    bool _308 = !_272;
    if (!_308)
    {
        float _310 = in.m_55.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _174 = _324;
    }
    float _326 = _174;
    float _328 = in.m_55.x;
    float _330 = in.m_55.y;
    float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _334 = log2(_332);
    float _336 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _338 = in.m_46.x;
    float _340 = in.m_46.y;
    float _342 = in.m_46.z;
    float _344 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = in.m_55.z;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _350 = int(_348);
    float _352 = _336 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _362 = _358 || _360;
    float _364 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _366 = _334 * _120;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _374 = int(_372);
    float _376 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _378 = _328 * 2.0;
    float _380 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _382 = float(_350);
    float _384 = fma(_376, -2.0, _370);
    float _386 = _330 * 2.0;
    float _388 = -_368;
    float _390 = fma(_380, 2.0, _388);
    float _392 = floor(_378);
    float _394 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _330 + _328;
    float _400 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _402 = float(_374);
    float _404 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _406 = _398 + (-1.0);
    float _408 = floor(_386);
    float _410 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _400);
    float _412 = _346 * 2.0;
    float _414 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _416 = _402 * _120;
    float _418 = -_120;
    float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _390);
    float _422 = exp2(_366);
    bool _424 = _392 > 0.0;
    bool _426 = _392 >= 0.0;
    bool _428 = isnan(_392);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = _408 > 0.0;
    float _438 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _440 = _330 + _346;
    float _442 = floor(_412);
    bool _444 = _408 >= 0.0;
    bool _446 = isnan(_408);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _440 + (-1.0);
    bool _460 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _468 = _464 || _466;
    float _470 = -_422;
    float _472 = _470 + 1.0;
    float _474 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _476 = 1.0 / _382;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _482 = _442 > 0.0;
    float _484 = 1.0 / _456;
    float _486 = _362 ? _472 : 0.0;
    float _488 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    bool _490 = _442 >= 0.0;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _480);
    int _502 = _434 ? 0 : 1;
    float _504 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _488);
    float _506 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _384);
    float _508 = _476 * _120;
    int _510 = ~_502;
    int _512 = _510 + 1;
    int _514 = _512 + 1;
    float _516 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _500);
    int _518 = _514;
    if (!_424)
    {
        int _520 = ~_502;
        int _522 = _520 + 1;
        _518 = _522;
    }
    int _524 = _518;
    float _526 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    int _528 = _452 ? 0 : 1;
    float _530 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
    float _532 = float(_524);
    if (_468)
    {
        float _534 = _486 * _484;
        _130 = _534;
    }
    float _536 = _130;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _544 = _542 != 0;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _548 = _546 != 0;
    float _550 = _526 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _552 = ~_528;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    int _560 = _556;
    if (!_436)
    {
        int _562 = ~_528;
        int _564 = _562 + 1;
        _560 = _564;
    }
    int _566 = _560;
    float _568 = _530 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _570 = !_544;
    int _572 = _570 ? 0 : 1;
    float _574 = in.m_61.x;
    float _576 = in.m_61.y;
    float _578 = in.m_61.z;
    bool _580 = !_540;
    int _582 = _580 ? 0 : 1;
    float _584 = _558 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _586 = !_548;
    int _588 = _586 ? 0 : 1;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _592 = _590 != 0;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _600 = _598 != 0;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _604 = _584 + _602;
    int _606 = _498 ? 0 : 1;
    float _608 = float(_566);
    bool _610 = !_592;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_596;
    int _616 = _614 ? 0 : 1;
    int _618 = abs(_612);
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _550 + _620;
    int _624 = abs(_616);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _568 + _626;
    int _630 = ~_606;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = _622 * _622;
    float _638 = float(_624);
    int _640 = _634;
    if (!_482)
    {
        int _642 = ~_606;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = fma(_628, _628, _636);
    float _650 = _638 * _532;
    float _652 = float(_618);
    float _654 = fma(_604, _604, _648);
    float _656 = float(_646);
    float _658 = _650 * (-2.0);
    bool _660 = !_600;
    int _662 = _660 ? 0 : 1;
    float _664 = sqrt(_654);
    float _666 = _330 + (-0.5);
    float _668 = fma(_658, _576, _576);
    float _670 = _652 * _656;
    int _672 = abs(_662);
    float _674 = fma(_474, _658, _474);
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[196].y, _668);
    float _678 = _346 + _328;
    float _680 = rsqrt(_654);
    float _682 = _670 * (-2.0);
    float _684 = _678 + (-1.0);
    float _686 = _346 + (-0.5);
    float _688 = float(_672);
    float _690 = fma(_682, _574, _574);
    float _692 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _694 = _664 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _696 = _328 + (-0.5);
    float _698 = _688 * _608;
    float _700 = fma(_414, _682, _414);
    float _702 = fma(_674, _536, _676);
    float _704 = precise::min(_352, _694);
    float _706 = _698 * (-2.0);
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _710 = _702 * 0.15915493667125701904296875;
    float _712 = _680 * _704;
    float _714 = fma(_706, _578, _578);
    float _716 = fma(_700, _536, _708);
    float _718 = fma(_692, _706, _692);
    float _720 = _622 * _712;
    float _722 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _724 = _628 * _712;
    float _726 = _716 * 0.15915493667125701904296875;
    float _728 = -_720;
    float _730 = _622 + _728;
    float _732 = fma(_718, _536, _722);
    float _734 = -_724;
    float _736 = _628 + _734;
    float _738 = _604 * _712;
    float _740 = _730 * _730;
    float _742 = _732 * 0.15915493667125701904296875;
    float _744 = _710 * 6.283185482025146484375;
    float _746 = sin(_744);
    float _748 = -_738;
    float _750 = _604 + _748;
    float _752 = fma(_736, _736, _740);
    float _754 = fma(_750, _750, _752);
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _764 = _760 || _762;
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    float _772 = _710 * 6.283185482025146484375;
    float _774 = cos(_772);
    bool _776 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _778 = isnan(0.5);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _784 = _780 || _782;
    float _786 = sqrt(_754);
    float _788 = _726 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _794 = _726 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _680 * _786;
    float _800 = _344 * _798;
    float _802 = _336 * _798;
    float _804 = _364 * _798;
    float _806 = _742 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _790 * _746;
    float _812 = _790 * _774;
    float _814 = _800 * _792;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _770);
    float _818 = _742 * 6.283185482025146484375;
    float _820 = sin(_818);
    float _822 = _796 * _774;
    float _824 = _796 * _746;
    float _826 = _804 * _816;
    float _828 = _790 * _808;
    float _830 = _774 * _808;
    float _832 = _796 * _808;
    float _834 = _746 * _808;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _766);
    float _838 = _828 * _814;
    float _840 = _832 * _814;
    float _842 = fma(_820, _822, _810);
    float _844 = _802 * _836;
    float _846 = -_824;
    float _848 = fma(_820, _812, _846);
    float _850 = -_812;
    float _852 = fma(_820, _824, _850);
    float _854 = -_814;
    float _856 = _820 * _854;
    float _858 = fma(_842, _844, _840);
    float _860 = fma(_820, _810, _822);
    float _862 = fma(_848, _844, _838);
    float _864 = fma(_830, _844, _856);
    float _866 = fma(_852, _826, _858);
    float _868 = fma(_860, _826, _862);
    float _870 = fma(_834, _826, _864);
    float _872 = _866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _874 = _866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = -_720;
    float _878 = _550 + _876;
    float _880 = -_724;
    float _882 = _568 + _880;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _872);
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _888 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _890 = -_738;
    float _892 = _584 + _890;
    float _894 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _884);
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _888);
    float _900 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[11].z, _898);
    float _908 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _900);
    float _910 = _584 + _902;
    float _912 = _568 + _904;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _916 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[10].z, _908);
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _920 = _910 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _912 + _922;
    float _926 = 1.0 / _914;
    float _928 = _916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _930 = _920 * _920;
    float _932 = _866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _934 = _928 + _914;
    float _936 = fma(_924, _924, _930);
    float _938 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _932);
    float _940 = sqrt(_936);
    float _942 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _938);
    float _944 = _942 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _946 = _934 * _926;
    float _948 = _946 * 0.5;
    float _950 = _550 + _944;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _954 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _952);
    bool _956 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = 1.0 / _954;
    float _960 = _944;
    float _962 = _942;
    float _964 = _870;
    float _966 = _924;
    float _968 = _720;
    float _970 = _950;
    float _972 = _912;
    if (!_956)
    {
        _960 = _912;
    }
    float _974 = _960;
    float _976 = _974;
    if (!_956)
    {
        _962 = _910;
    }
    float _978 = _962;
    float _980 = _978;
    if (!_956)
    {
        _964 = _950;
    }
    float _982 = _964;
    bool _984 = !_956;
    float _986 = _982;
    float _988 = _958;
    if (!_984)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _994 = _940 + _992;
        float _996 = rsqrt(_936);
        float _998 = _994 * _990;
        float _1000 = _950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = _998 * 0.15915493667125701904296875;
        float _1004 = _1002 * 6.283185482025146484375;
        float _1006 = cos(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        float _1012 = _1006 + (-1.0);
        float _1014 = fma(_1010, _1000, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1016 = _1012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1018 = _996 * _1014;
        float _1020 = fma(_950, _1006, _1016);
        float _1022 = fma(_924, _1018, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1024 = fma(_920, _1018, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _976 = _1022;
        _986 = _1020;
        _980 = _1024;
    }
    float _1026 = _976;
    float _1028 = _986;
    float _1030 = _980;
    float _1032 = -_724;
    float _1034 = _1032 + _1026;
    float _1036 = -_720;
    float _1038 = _1036 + _1028;
    float _1040 = -_738;
    float _1042 = _1040 + _1030;
    float _1044 = _1034;
    float _1046 = _1042;
    float _1048 = _1030;
    if (_784)
    {
        _966 = 1.0;
    }
    float _1050 = _966;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1054 = _958 * _1052;
    float _1056 = _1050;
    if (_764)
    {
        _968 = _1034;
    }
    float _1058 = _968;
    float _1060 = _1058;
    if (_764)
    {
        _1044 = _1038;
    }
    float _1062 = _1044;
    float _1064 = _1062;
    if (!_764)
    {
        float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1068 = _878 + _1066;
        float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1072 = _882 + _1070;
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1076 = -_568;
        float _1078 = _1076 + _1026;
        float _1080 = _1068 * _1068;
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1084 = _892 + _1082;
        float _1086 = -_550;
        float _1088 = _1086 + _1028;
        float _1090 = -_584;
        float _1092 = _1090 + _1030;
        float _1094 = fma(_1072, _1072, _1080);
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1098 = fma(_1084, _1084, _1094);
        float _1100 = sqrt(_1098);
        float _1102 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1104 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1096;
        float _1108 = _1102 * _1106;
        float _1110 = fma(_1078, _1108, _882);
        float _1112 = fma(_1088, _1108, _878);
        float _1114 = fma(_1092, _1108, _892);
        _1064 = _1112;
        _1060 = _1110;
        _1046 = _1114;
        _1048 = _1092;
    }
    float _1116 = _1064;
    float _1118 = _1060;
    float _1120 = _1046;
    float _1122 = _1048;
    if (!_784)
    {
        float _1124 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1126 = _1124 * 0.15915493667125701904296875;
        float _1128 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1130 = _1126 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 0.15915493667125701904296875;
        float _1136 = _1126 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        float _1140 = 1.0 / _1132;
        float _1142 = _1134 * 6.283185482025146484375;
        float _1144 = cos(_1142);
        float _1146 = _1138 * _1140;
        float _1148 = _1134 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1154 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1152;
        float _1156 = _1144 * _1146;
        float _1158 = 1.0 / _1154;
        float _1160 = 1.0 / _1156;
        float _1162 = _1150 * _1160;
        float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1166 = fma(_1054, _1162, _1164);
        float _1168 = _1166 * _1158;
        float _1170 = precise::clamp(_1168, 0.0, 1.0);
        _1056 = _1170;
    }
    float _1172 = _1056;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1176 = _1116 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1118 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1184 = _1120 + _1182;
    float _1186 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1176 * _1176;
    float _1190 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1194 = fma(_1180, _1180, _1188);
    float _1196 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1198 = fma(_1184, _1184, _1194);
    float _1200 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1196);
    float _1202 = rsqrt(_1198);
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1206 = sqrt(_1198);
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1210 = _1180 * _1208;
    float _1212 = _1184 * _1208;
    float _1214 = _1210 * _1210;
    float _1216 = _1212 * _1212;
    float _1218 = _1214 + _1216;
    float _1220 = sqrt(_1218);
    bool _1222 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1226 = _1220 + _1224;
    float _1228 = _1188;
    float _1230 = _1218;
    float _1232 = _1226;
    float _1234 = _1210;
    float _1236 = _1212;
    float _1238 = _1214;
    if (_1222)
    {
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1240;
    }
    float _1242 = _1228;
    if (_1222)
    {
        float _1244 = rsqrt(_1218);
        _1230 = _1244;
    }
    float _1246 = _1230;
    float _1248 = _1246;
    if (_1222)
    {
        float _1250 = _1226 * _1242;
        _1232 = _1250;
    }
    float _1252 = _1232;
    if (_1222)
    {
        float _1254 = _1252 * 0.15915493667125701904296875;
        _970 = _1254;
    }
    float _1256 = _970;
    float _1258 = _1242;
    if (_1222)
    {
        float _1260 = _1256 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        _1258 = _1262;
    }
    float _1264 = _1258;
    float _1266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1268 = precise::max(0.0, _1266);
    float _1270 = _1122;
    if (_1222)
    {
        float _1272 = _1256 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = -_1208;
    float _1280 = -_1268;
    float _1282 = fma(_1176, _1278, _1280);
    if (_1222)
    {
        float _1284 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _988 = _1284;
    }
    float _1286 = _988;
    float _1288 = fma(_882, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1290 = _1264;
    float _1292 = _1286;
    if (_1222)
    {
        float _1294 = fma(_1264, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _972 = _1294;
    }
    float _1296 = _972;
    float _1298 = _1296;
    if (!_1222)
    {
        _1290 = _1282;
    }
    float _1300 = _1290;
    float _1302 = floor(_1288);
    float _1304 = _1300;
    float _1306 = _1276;
    if (_1222)
    {
        float _1308 = _1276 + (-1.0);
        _1292 = _1308;
    }
    float _1310 = _1292;
    if (_1222)
    {
        float _1312 = _1246 * _1296;
        _1298 = _1312;
    }
    float _1314 = _1298;
    if (_1222)
    {
        float _1316 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1248 = _1316;
    }
    float _1318 = _1248;
    if (_1222)
    {
        float _1320 = _1210 * _1314;
        _1234 = _1320;
    }
    float _1322 = _1234;
    if (_1222)
    {
        float _1324 = _1212 * _1314;
        _1236 = _1324;
    }
    float _1326 = _1236;
    if (_1222)
    {
        float _1328 = fma(_1282, _1276, _1318);
        _1304 = _1328;
    }
    float _1330 = _1304;
    if (_1222)
    {
        float _1332 = _1322 * _1322;
        _1238 = _1332;
    }
    float _1334 = _1238;
    if (!_1222)
    {
        _1306 = _1216;
    }
    float _1336 = _1306;
    float _1338 = _1336;
    if (_1222)
    {
        float _1340 = _1326 * _1326;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = fma(_1330, _1330, _1334);
    float _1348 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1350 = _1346 + _1342;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1354 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1348);
    float _1358 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1192);
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1362 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1360);
    float _1364 = precise::clamp(_1362, 0.0, 1.0);
    float _1366 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1370 = rsqrt(_1350);
    float _1372 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1374 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1366);
    float _1376 = -_1364;
    float _1378 = _1376 + 1.0;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1388 = abs(_1378);
    float _1390 = log2(_1388);
    float _1392 = -_1380;
    float _1394 = fma(_1392, _1352, 1.0);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1398 = fma(_892, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1400 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1396);
    float _1402 = _1370 * _1322;
    float _1404 = _1370 * _1330;
    float _1406 = floor(_1398);
    float _1408 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1412 = _1370 * _1326;
    float _1414 = -_1302;
    float _1416 = _1288 + _1414;
    float _1418 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = -_1410;
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1420);
    float _1424 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1426 = 1.0 / _1408;
    float _1428 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1430 = -_1412;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1422);
    float _1434 = _1404 + 1.0;
    float _1436 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1428);
    float _1438 = fma(_1432, -0.5, 0.5);
    float _1440 = fma(_1432, 0.5, 0.5);
    float _1442 = log2(_1394);
    float _1444 = -_1406;
    float _1446 = _1398 + _1444;
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1386);
    float _1450 = fma(_1440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1454 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1456 = fma(_1440, _1450, -0.212114393711090087890625);
    float _1458 = exp2(_1424);
    float _1460 = _1452 * _1426;
    float _1462 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1454);
    float _1464 = fma(_1440, _1456, 1.570728778839111328125);
    float _1466 = _1462 * _1426;
    float _1468 = sqrt(_1438);
    float _1470 = _1442 * 0.693147182464599609375;
    float _1472 = fma(_1466, -0.5, 0.5);
    float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1476 = -_1404;
    float _1478 = fma(_1458, _1434, _1476);
    float2 _4940 = float2(_1416, _1446);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).x;
    float _1482 = fma(_1478, 0.5, 0.5);
    float _1484 = _1468 * 0.636619746685028076171875;
    float _1486 = fma(_1460, 0.5, 0.5);
    float _1488 = -_1464;
    float _1490 = fma(_1484, _1488, 1.0);
    float3 _4963 = float3(_1486, _1472, _1474);
    float _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4963, float3(0.0), isnan(_4963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4963, float3(0.0), isnan(_4963)), level(0.0)).x;
    float3 _4974 = float3(_1486, _1472, _1474);
    float4 _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4974, float3(0.0), isnan(_4974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4974, float3(0.0), isnan(_4974)), level(0.0)).xyzw;
    float _1497 = _1495.x;
    float _1499 = _1495.y;
    float _1501 = _1495.z;
    float _1503 = _1495.w;
    float2 _4990 = float2(_1490, _1482);
    float3 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4990, float2(0.0), isnan(_4990)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4990, float2(0.0), isnan(_4990)), level(0.0)).xyz;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = float(uint(_374));
    float _1517 = trunc(_508);
    int _1519 = int(_1517);
    bool _1521 = _374 == 0;
    float _1523 = _416 * _166;
    int _1525 = abs(_572);
    out.m_65.x = _882;
    out.m_65.y = _878;
    out.m_65.z = _892;
    int _1527 = abs(_582);
    float _1529 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1531 = 1.0 / _1515;
    out.m_67.w = _704;
    out.m_69.x = _802;
    float _1533 = float(uint(_1519));
    float _1535 = trunc(_1523);
    int _1537 = int(_1535);
    int _1539 = ~_374;
    int _1541 = _1539 + 1;
    float _1543 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_71.x = _1118;
    out.m_71.y = _1116;
    out.m_71.z = _1120;
    float _1545 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1543);
    int _1547 = as_type<int>(_1531) + (-2);
    float _1549 = abs(_1054);
    float _1551 = log2(_1549);
    float _1553 = as_type<float>(_1547) * _1533;
    int _1555 = ~_374;
    int _1557 = _1555 + 1;
    float _1559 = exp2(_1529);
    bool _1561 = _1054 <= 8000.0;
    bool _1563 = isnan(_1054);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(8000.0);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = trunc(_1553);
    float _1575 = precise::max(_1573, 0.0);
    uint _1578 = uint(_1575);
    float _1580 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1582 = exp2(_1580);
    float _1584 = -_1559;
    float _1586 = _1584 + 1.0;
    float _1588 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1590 = _1541 * int(_1578);
    int _1592 = _1590 + _1519;
    float _1594 = float(uint(_1592));
    float _1596 = as_type<float>(_1547) * _1594;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1600 = _1598 != 0;
    float _1602 = trunc(_1596);
    float _1604 = precise::max(_1602, 0.0);
    uint _1606 = uint(_1604);
    bool _1608 = !_1600;
    float _1610 = _1608 ? 7.345489978790283203125 : 1.0;
    float _1612 = _1610 * _328;
    float _1614 = float(_1519);
    float _1616 = floor(_1612);
    bool _1618 = _1614 >= _402;
    bool _1620 = isnan(_1614);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(_402);
    bool _1626 = _1622 || _1624;
    float _1628 = float(_1626);
    int _1630 = int(_1578) + int(_1606);
    float _1632 = trunc(_1628);
    int _1634 = int(_1632);
    int _1636 = _1557 * _1630;
    int _1638 = _1636 + _1519;
    bool _1640 = uint(_1638) >= uint(_374);
    float _1642 = -_1616;
    float _1644 = _1612 + _1642;
    bool _1646 = !_1640;
    int _1648 = _1646 ? 0 : (-1);
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1652 = _1650 != 0;
    int _1654 = ~_1630;
    int _1656 = _1654 + _1648;
    int _1658 = _1656 + 1;
    float _1660 = _1644 * _402;
    bool _1662 = !_1652;
    int _1664 = _1662 ? 0 : 1;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1668 = _1666 != 0;
    int _1670 = _374 * _1658;
    int _1672 = _1670 + _1519;
    int _1674 = ~_1634;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    float _1680 = trunc(_1660);
    int _1682 = int(_1680);
    int _1684 = abs(_1664);
    bool _1686 = !_1521;
    int _1688 = _1686 ? _1672 : (-1);
    int _1690 = _374 + (-1);
    int _1692 = _1688 * _1678;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1700 = _1698 != 0;
    int _1702 = _1634 * _1690;
    int _1704 = _1702 + _1692;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1710 = !_1668;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = _1682 * _1684;
    int _1716 = _1714 + _1519;
    int _1718 = abs(_588);
    int _1720 = _1704 * _1525;
    float _1722 = 1.0 / _1708;
    int _1724 = abs(_1712);
    float _1726 = as_type<float>(_1527);
    float _1728 = _1408;
    float _1730 = _1462;
    if (_1696)
    {
        float _1732 = in.m_55.x;
        _1726 = _1732;
    }
    float _1734 = _1726;
    int _1736 = _1537 * _1527;
    int _1738 = _1736 + _1720;
    int _1740 = _1716 * _1718;
    int _1742 = _1740 + _1738;
    float _1744 = in.m_73.x;
    int _1746 = ~_374;
    int _1748 = _1746 + 1;
    int _1750 = _1682 * _1724;
    int _1752 = _1750 + _1742;
    bool _1754 = _330 > 0.5;
    float _1756 = in.m_73.y;
    float _1758 = float(uint(_1752));
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1762 = _1760 != 0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1764;
    float _1768 = float(uint(_1716));
    float _1770 = as_type<float>(_1547) * _1758;
    float _1772 = _1766 * _1722;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1776 = _326 + _1774;
    float _1778 = trunc(_1770);
    float _1780 = precise::max(_1778, 0.0);
    uint _1782 = uint(_1780);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1784 = fma(_1772, _1776, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1786 = -_1756;
    float _1788 = _1786 + 1.0;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1794 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1796 = isnan(_326);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1802 = _1798 || _1800;
    float _1804 = float(_1802);
    int _1806 = _1748 * int(_1782);
    int _1808 = _1806 + _1752;
    float _1810 = _1756;
    float _1812 = _1734;
    float _1814 = _1744;
    if (_1700)
    {
        float _1816 = _1754 ? _1788 : _1756;
        _1810 = _1816;
    }
    float _1818 = _1810;
    float _1820 = 1.0 / _1792;
    bool _1822 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1824 = isnan(_326);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = -_1804;
    float _1836 = _1834 + 1.0;
    float _1838 = float(uint(_1808));
    float _1840 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1842 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1844 = isnan(_326);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1850 = _1846 || _1848;
    float _1852 = float(_1850);
    float _1854 = -_1832;
    float _1856 = _1854 + 1.0;
    bool _1858 = _1734 > 0.5;
    bool _1860 = _1858 && _1696;
    float _1862 = as_type<float>(_1547) * _1838;
    if (_1696)
    {
        _1812 = _1744;
    }
    float _1864 = _1812;
    float _1866 = _1804 * _1856;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    float _1878 = _1852 * _1836;
    float _1880 = -_1852;
    float _1882 = _1880 + 1.0;
    float _1884 = as_type<float>(_1547) * _1768;
    float _1886 = _1870 * _1820;
    float _1888 = _1784 * _1878;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _326 + _1890;
    float _1894 = -_506;
    float _1896 = fma(_516, _1840, _1894);
    float _1898 = _1864;
    if (_1860)
    {
        float _1900 = -_1864;
        float _1902 = _1900 + 1.0;
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1888);
    float _1908 = fma(_1886, _1892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1910 = ~_374;
    int _1912 = _1910 + 1;
    float _1914 = trunc(_1884);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = ~_374;
    int _1922 = _1920 + 1;
    float _1924 = fma(_1908, _1866, _1906);
    bool _1926 = _768 != 0.0;
    bool _1928 = isnan(_768);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan(0.0);
    bool _1934 = _1930 || _1932;
    int _1936 = int(_1782) + int(_1876);
    float _1938 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1924);
    float _1940 = in.m_77.x;
    float _1942 = in.m_77.y;
    float _1944 = in.m_77.z;
    int _1946 = _1912 * _1936;
    int _1948 = _1946 + _1752;
    bool _1950 = _766 == 0.0;
    bool _1952 = !_1934;
    bool _1954 = _1950 && _1952;
    if (_1696)
    {
        _1814 = _1904;
    }
    float _1956 = _1814;
    int _1958 = _1922 * int(_1918);
    int _1960 = _1958 + _1716;
    bool _1962 = _770 == 0.0;
    bool _1964 = _1962 && _1954;
    bool _1966 = uint(_1948) >= uint(_374);
    float _1968 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1970 = !_1966;
    int _1972 = _1970 ? 0 : (-1);
    float _1974 = fma(_504, _1968, _420);
    float _1976 = float(uint(_1960));
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1980 = ~_1936;
    int _1982 = _1980 + _1972;
    int _1984 = _1982 + 1;
    float _1986 = _1974 + 0.5;
    float _1988 = as_type<float>(_1547) * _1976;
    float _1990 = _1896 + 0.5;
    float _1992 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1996 = _1940;
    float _1998 = _1942;
    float _2000 = _1944;
    if (!_1964)
    {
        float _2002 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1940);
        _1996 = _2002;
    }
    float _2004 = _1996;
    int _2006 = _374 * _1984;
    int _2008 = _2006 + _1752;
    float _2010 = trunc(_1988);
    float _2012 = precise::max(_2010, 0.0);
    uint _2014 = uint(_2012);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2020 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2022 = !_1521;
    int _2024 = _2022 ? _2008 : (-1);
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1964)
    {
        float _2028 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1942);
        _1998 = _2028;
    }
    float _2030 = _1998;
    int _2032 = ~_374;
    int _2034 = _2032 + 1;
    if (!_1964)
    {
        float _2036 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1944);
        _2000 = _2036;
    }
    float _2038 = _2000;
    int _2040 = _2024 >> 31;
    float _2042 = _832 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2044 = _832 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_79.x = _2018;
    out.m_79.y = _2026;
    out.m_79.z = _2020;
    out.m_79.w = _1992;
    int _2046 = _2040 & 3;
    float _2048 = -_820;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2042);
    float _2052 = _832 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2054 = int(_1918) + int(_2014);
    out.m_81.x = _1986;
    out.m_81.y = _1990;
    int _2056 = _2024 + _2046;
    float _2058 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1545);
    int _2060 = _2024 & 3;
    bool _2062 = _2060 != 0;
    float _2064 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2066 = _2056 >> 2;
    int _2068 = _2024 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    int _2074 = _2034 * _2054;
    int _2076 = _2074 + _1716;
    float _2078 = -_820;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2044);
    int _2082 = _2066 << 4;
    int _2084 = _2082 + 368;
    float _2086 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2050);
    float _2088 = -_820;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2052);
    float _2092 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2080);
    uint _2094 = uint(int(uint(_2084) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    bool _2110 = uint(_2076) >= uint(_374);
    float _2112 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2114 = _2092 * _2030;
    float _2116 = _2086 * _2030;
    float _2118 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2120 = _2112 * _2030;
    bool _2122 = !_2110;
    int _2124 = _2122 ? 0 : (-1);
    int _2126 = _2084 + 8;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    uint _2130 = uint(int(uint(int(_2128)) >> uint(2)));
    int _2132 = int(_2128) & 3;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[int(_2130)][_2132];
    int _2136 = int(_2128) + 1;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    int _2140 = _2136 & 3;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[int(_2138)][_2140];
    bool _2144 = uint(_2060) > 1u;
    float _2146 = fma(_2058, _2004, _2114);
    int _2148 = ~_2054;
    int _2150 = _2148 + _2124;
    int _2152 = _2150 + 1;
    float _2154 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2118);
    int _2156 = _2070 ? 0 : 1;
    float _2158 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2160 = uint(_2060) >= 2u;
    float _2162 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2154);
    int _2164 = ~_2156;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2172 = !_2062;
    int _2174 = _2172 ? 0 : 1;
    float _2176 = fma(_2162, _2004, _2116);
    bool _2178 = _2060 != 3;
    float _2180 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2158);
    int _2182 = _2168;
    if (!_2144)
    {
        int _2184 = ~_2156;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2170);
    bool _2192 = _2060 != 3;
    float _2194 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2180);
    int _2196 = abs(_2188);
    float _2198 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2190);
    int _2200 = _2160 ? 0 : 1;
    float _2202 = fma(_2194, _2004, _2120);
    int _2204 = abs(_2174);
    float _2206 = fma(_2198, _2038, _2146);
    int _2208 = ~_2200;
    int _2210 = _2208 + 1;
    int _2212 = _2210 + 1;
    int _2214 = _374 * _2152;
    int _2216 = _2214 + _1716;
    int _2218 = ~_2196;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2226 = !_2178;
    int _2228 = _2226 ? 0 : (-1);
    float _2230 = _1588 * _1492;
    int _2232 = _2212;
    if (_2192)
    {
        int _2234 = ~_2200;
        int _2236 = _2234 + 1;
        _2232 = _2236;
    }
    int _2238 = _2232;
    float _2240 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2242 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2072);
    int _2244 = abs(_2238);
    float _2246 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    int _2248 = ~_2204;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = -_1480;
    float _2256 = _2254 + 1.0;
    int _2258 = abs(_2228);
    int _2260 = _2222 * as_type<int>(_2108);
    bool _2262 = !_1762;
    int _2264 = _2262 ? 0 : 1;
    int _2266 = _2252 * as_type<int>(_2100);
    int _2268 = _2266 + _2260;
    float _2270 = _1452 + _1408;
    int _2272 = abs(_2264);
    float _2274 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2276 = precise::clamp(_2274, 0.0, 1.0);
    bool _2278 = !_1521;
    int _2280 = _2278 ? _2216 : (-1);
    float _2282 = _1513 * _2230;
    int _2284 = ~_2244;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    float _2290 = fma(_2242, _2038, _2176);
    float _2292 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2294 = ~_2258;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2288 * as_type<int>(_2134);
    int _2302 = _2300 + _2268;
    float _2304 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2292);
    int _2306 = ~_2272;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2298 * as_type<int>(_2142);
    int _2314 = _2312 + _2302;
    float _2316 = in.m_83.x;
    float _2318 = fma(_2276, -2.0, 3.0);
    float _2320 = _2276 * _2276;
    int _2322 = _2314 * _2310;
    float _2324 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2326 = _1408 * 0.5;
    float _2328 = _2320 * _2318;
    int _2330 = _2280 * _2272;
    int _2332 = _2330 + _2322;
    float _2334 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2324);
    float _2336 = fma(_2246, _2038, _2202);
    float _2338 = -_2328;
    float _2340 = _2338 + 1.0;
    float _2342 = _2334 + _1408;
    out.gl_Position.x = _1452;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _2334;
    out.gl_Position.w = _1408;
    float _2344 = fma(_2340, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2328);
    float _2346 = _2270 * 0.5;
    float _2348 = _2342 * 0.5;
    float _2350 = fma(_1462, -0.5, _2326);
    float _2352 = _1571 * _2344;
    float _2354 = float(_2332);
    out.m_85.x = _2206;
    out.m_85.y = _2290;
    out.m_85.z = _2336;
    float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2358 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2360 = isnan(_1206);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2366 = _2362 || _2364;
    out.m_87.x = _2346;
    out.m_87.y = _2350;
    out.m_87.z = _2348;
    out.m_87.w = _1408;
    float _2368 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2370 = _2256 * _2356;
    float _2372 = precise::clamp(_2370, 0.0, 1.0);
    float _2374 = _1503 * _2230;
    float _2376 = -_1588;
    float _2378 = _2376 + 1.0;
    out.m_89.x = _2354;
    float _2380 = -_2372;
    float _2382 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2384 = fma(_1509, _2374, _1497);
    float _2386 = fma(_1511, _2374, _1499);
    float _2388 = _1503 * _2378;
    float _2390 = fma(_1503, _2282, _1501);
    float _2392 = _2382 * _2316;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2396 = _2392;
    float _2398 = _2378;
    if (!_2366)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2400 = _2394;
    float _2402 = _2400;
    float _2404 = _2400;
    if (!_2366)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _1728;
    out.m_91.x = _2384;
    out.m_91.y = _2386;
    out.m_91.z = _2390;
    out.m_91.w = _2388;
    float _2408 = _2392 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2410 = _2408;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2366)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2416 = _2396;
    float _2418 = _2416;
    float _2420 = _2416;
    if (!_2366)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2422 = _2398;
    out.m_93.x = _2408;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2366)
    {
        _1730 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2428 = _1730;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2366)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2434 = _2410;
    bool _2436 = !_2366;
    float _2438 = _2434;
    float _2440 = _2434;
    if (!_2436)
    {
        bool _2442 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2444 = isnan(_1206);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2454 = _1206 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2456;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2464 = 1.0 / _2458;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2482 = _2454 * _2464;
            float _2484 = precise::clamp(_2482, 0.0, 1.0);
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2490 = fma(_2484, _2462, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2494;
            _2432 = _2498;
            _2420 = _2490;
            _2426 = _2496;
            _2414 = _2492;
            _2440 = _2500;
            _2502 = true;
        }
        else
        {
            bool _2504 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2506 = isnan(_1206);
            bool _2508 = _2504 || _2506;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2512 = _2508 || _2510;
            if (!_2512)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2514 = _2418;
            _2420 = _2514;
            if (!_2512)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2516 = _2402;
            _2404 = _2516;
            if (!_2512)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2518 = _2412;
            _2414 = _2518;
            if (!_2512)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2520 = _2424;
            _2426 = _2520;
            if (!_2512)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2522 = _2430;
            _2432 = _2522;
            if (!_2512)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2524 = _2438;
            bool _2526 = !_2512;
            _2440 = _2524;
            if (!_2526)
            {
                bool _2528 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2530 = isnan(_1206);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2536 = _2532 || _2534;
                if (!_2536)
                {
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2540 = _1206 + _2538;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2542;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2550 = 1.0 / _2544;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2568 = _2540 * _2550;
                    float _2570 = precise::clamp(_2568, 0.0, 1.0);
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2576 = fma(_2570, _2548, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2580;
                    _2432 = _2584;
                    _2420 = _2576;
                    _2426 = _2582;
                    _2414 = _2578;
                    _2440 = _2586;
                    _2502 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2502 = false;
    float _2588 = _2404;
    float _2590 = _2432;
    float _2592 = _2420;
    float _2594 = _2426;
    float _2596 = _2414;
    float _2598 = _2440;
    float _2600 = _2368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2602 = fma(_2290, -0.5, 0.5);
    float _2604 = precise::clamp(_2602, 0.0, 1.0);
    float _2606 = -_2588;
    float _2608 = _2606 + _2590;
    float _2610 = -_2592;
    float _2612 = _2610 + _2594;
    out.m_53.x = _2600;
    float _2614 = fma(_2604, _2608, _2588);
    float _2616 = -_2596;
    float _2618 = _2616 + _2598;
    float _2620 = fma(_2604, _2612, _2592);
    float _2622 = _2614 * 0.586610972881317138671875;
    bool _2624 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = fma(_2604, _2618, _2596);
    out.m_95.x = 0.0;
    float _2628 = fma(_2620, 0.298911988735198974609375, _2622);
    bool _2630 = _1172 > 0.0;
    bool _2632 = isnan(_1172);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    float _2640 = fma(_2626, 0.114477999508380889892578125, _2628);
    float _2642 = -_2640;
    float _2644 = _2620 + _2642;
    float _2646 = -_2640;
    float _2648 = _2614 + _2646;
    float _2650 = -_2640;
    float _2652 = _2626 + _2650;
    float _2654 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    float _2656 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    float _2658 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    bool _2660 = !_2624;
    if (!_2660)
    {
        float _2662 = -_1116;
        float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2666 = -_1118;
        float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2670 = -_1120;
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2674 = _2664 * _2664;
        float _2676 = fma(_2668, _2668, _2674);
        float _2678 = fma(_2672, _2672, _2676);
        float _2680 = sqrt(_2678);
        float _2682 = rsqrt(_2678);
        float _2684 = -_2680;
        float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2688 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2690 = precise::clamp(_2688, 0.0, 1.0);
        float _2692 = _2668 * _2682;
        float _2694 = _2664 * _2682;
        float _2696 = abs(_2690);
        float _2698 = log2(_2696);
        float _2700 = _2672 * _2682;
        float _2702 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2704 = _2290 * _2694;
        float _2706 = -_2694;
        float _2708 = -_2702;
        float _2710 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2708);
        float _2712 = fma(_2206, _2692, _2704);
        float _2714 = -_2700;
        float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2710);
        float _2718 = fma(_2336, _2700, _2712);
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2724 = _2716 + _2722;
        float _2726 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2728 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2730 = precise::clamp(_2728, 0.0, 1.0);
        float _2732 = exp2(_2726);
        float _2734 = _2732 * _2730;
        float _2736 = _2720 * _2734;
        float _2738 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2740 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2742 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2738;
        out.m_95.y = _2740;
        out.m_95.z = _2742;
    }
    out.m_67.x = _2654;
    out.m_67.y = _2656;
    out.m_67.z = _2658;
    if (_2638)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2744 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2744;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2502 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2813 = as_type<float>(_138);
        out.gl_Position.z = _2813;
    }
    if (!_124)
    {
        return out;
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2868 = as_type<float>(_164);
        out.gl_Position.z = _2868;
    }
    if (_158)
    {
        return out;
    }
    float _166 = 1.0 / _152;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _120 * _166;
    bool _172 = !_168;
    float _174 = _170;
    float _192;
    if (!_172)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _170;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _206 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_196);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = 1.0 / _200;
    float _220 = _202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _196 + _224;
    float _228 = _204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _234 = -_216;
    float _236 = _234 + 1.0;
    bool _238 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_196);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    out.m_57.x = _220;
    out.m_57.y = _230;
    out.m_57.z = _228;
    out.m_57.w = _232;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _258;
    float _262 = _226 * _218;
    float _264 = _248 * _236;
    float _266 = in.m_59.x;
    float _268 = in.m_59.y;
    float _270 = in.m_59.z;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _274 = fma(_252, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = fma(_256, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _278 = fma(_260, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = -_248;
    float _282 = _280 + 1.0;
    float _284 = _274 * _264;
    float _286 = _276 * _264;
    float _288 = _278 * _264;
    float _290 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    float _302 = _298 * _268;
    float _304 = _296 * _266;
    float _306 = _300 * _270;
    bool _308 = !_272;
    if (!_308)
    {
        float _310 = in.m_55.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _174 = _324;
    }
    float _326 = _174;
    float _328 = in.m_55.x;
    float _330 = in.m_55.y;
    float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _334 = log2(_332);
    float _336 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _338 = in.m_46.x;
    float _340 = in.m_46.y;
    float _342 = in.m_46.z;
    float _344 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = in.m_55.z;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _350 = int(_348);
    float _352 = _336 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _362 = _358 || _360;
    float _364 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _366 = _334 * _120;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _374 = int(_372);
    float _376 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _378 = _328 * 2.0;
    float _380 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _382 = float(_350);
    float _384 = fma(_376, -2.0, _370);
    float _386 = _330 * 2.0;
    float _388 = -_368;
    float _390 = fma(_380, 2.0, _388);
    float _392 = floor(_378);
    float _394 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _330 + _328;
    float _400 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _402 = float(_374);
    float _404 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _406 = _398 + (-1.0);
    float _408 = floor(_386);
    float _410 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _400);
    float _412 = _346 * 2.0;
    float _414 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _416 = _402 * _120;
    float _418 = -_120;
    float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _390);
    float _422 = exp2(_366);
    bool _424 = _392 > 0.0;
    bool _426 = _392 >= 0.0;
    bool _428 = isnan(_392);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = _408 > 0.0;
    float _438 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _440 = _330 + _346;
    float _442 = floor(_412);
    bool _444 = _408 >= 0.0;
    bool _446 = isnan(_408);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _440 + (-1.0);
    bool _460 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _468 = _464 || _466;
    float _470 = -_422;
    float _472 = _470 + 1.0;
    float _474 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _476 = 1.0 / _382;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _482 = _442 > 0.0;
    float _484 = 1.0 / _456;
    float _486 = _362 ? _472 : 0.0;
    float _488 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    bool _490 = _442 >= 0.0;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _480);
    int _502 = _434 ? 0 : 1;
    float _504 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _488);
    float _506 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _384);
    float _508 = _476 * _120;
    int _510 = ~_502;
    int _512 = _510 + 1;
    int _514 = _512 + 1;
    float _516 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _500);
    int _518 = _514;
    if (!_424)
    {
        int _520 = ~_502;
        int _522 = _520 + 1;
        _518 = _522;
    }
    int _524 = _518;
    float _526 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    int _528 = _452 ? 0 : 1;
    float _530 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
    float _532 = float(_524);
    if (_468)
    {
        float _534 = _486 * _484;
        _130 = _534;
    }
    float _536 = _130;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _544 = _542 != 0;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _548 = _546 != 0;
    float _550 = _526 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _552 = ~_528;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    int _560 = _556;
    if (!_436)
    {
        int _562 = ~_528;
        int _564 = _562 + 1;
        _560 = _564;
    }
    int _566 = _560;
    float _568 = _530 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _570 = !_544;
    int _572 = _570 ? 0 : 1;
    float _574 = in.m_61.x;
    float _576 = in.m_61.y;
    float _578 = in.m_61.z;
    bool _580 = !_540;
    int _582 = _580 ? 0 : 1;
    float _584 = _558 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _586 = !_548;
    int _588 = _586 ? 0 : 1;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _592 = _590 != 0;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _600 = _598 != 0;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _604 = _584 + _602;
    int _606 = _498 ? 0 : 1;
    float _608 = float(_566);
    bool _610 = !_592;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_596;
    int _616 = _614 ? 0 : 1;
    int _618 = abs(_612);
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _550 + _620;
    int _624 = abs(_616);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _568 + _626;
    int _630 = ~_606;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = _622 * _622;
    float _638 = float(_624);
    int _640 = _634;
    if (!_482)
    {
        int _642 = ~_606;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = fma(_628, _628, _636);
    float _650 = _638 * _532;
    float _652 = float(_618);
    float _654 = fma(_604, _604, _648);
    float _656 = float(_646);
    float _658 = _650 * (-2.0);
    bool _660 = !_600;
    int _662 = _660 ? 0 : 1;
    float _664 = sqrt(_654);
    float _666 = _330 + (-0.5);
    float _668 = fma(_658, _576, _576);
    float _670 = _652 * _656;
    int _672 = abs(_662);
    float _674 = fma(_474, _658, _474);
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[196].y, _668);
    float _678 = _346 + _328;
    float _680 = rsqrt(_654);
    float _682 = _670 * (-2.0);
    float _684 = _678 + (-1.0);
    float _686 = _346 + (-0.5);
    float _688 = float(_672);
    float _690 = fma(_682, _574, _574);
    float _692 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _694 = _664 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _696 = _328 + (-0.5);
    float _698 = _688 * _608;
    float _700 = fma(_414, _682, _414);
    float _702 = fma(_674, _536, _676);
    float _704 = precise::min(_352, _694);
    float _706 = _698 * (-2.0);
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _710 = _702 * 0.15915493667125701904296875;
    float _712 = _680 * _704;
    float _714 = fma(_706, _578, _578);
    float _716 = fma(_700, _536, _708);
    float _718 = fma(_692, _706, _692);
    float _720 = _622 * _712;
    float _722 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _724 = _628 * _712;
    float _726 = _716 * 0.15915493667125701904296875;
    float _728 = -_720;
    float _730 = _622 + _728;
    float _732 = fma(_718, _536, _722);
    float _734 = -_724;
    float _736 = _628 + _734;
    float _738 = _604 * _712;
    float _740 = _730 * _730;
    float _742 = _732 * 0.15915493667125701904296875;
    float _744 = _710 * 6.283185482025146484375;
    float _746 = sin(_744);
    float _748 = -_738;
    float _750 = _604 + _748;
    float _752 = fma(_736, _736, _740);
    float _754 = fma(_750, _750, _752);
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _764 = _760 || _762;
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    float _772 = _710 * 6.283185482025146484375;
    float _774 = cos(_772);
    bool _776 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _778 = isnan(0.5);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _784 = _780 || _782;
    float _786 = sqrt(_754);
    float _788 = _726 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _794 = _726 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _680 * _786;
    float _800 = _344 * _798;
    float _802 = _336 * _798;
    float _804 = _364 * _798;
    float _806 = _742 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _790 * _746;
    float _812 = _790 * _774;
    float _814 = _800 * _792;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _770);
    float _818 = _742 * 6.283185482025146484375;
    float _820 = sin(_818);
    float _822 = _796 * _774;
    float _824 = _796 * _746;
    float _826 = _804 * _816;
    float _828 = _790 * _808;
    float _830 = _774 * _808;
    float _832 = _796 * _808;
    float _834 = _746 * _808;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _766);
    float _838 = _828 * _814;
    float _840 = _832 * _814;
    float _842 = fma(_820, _822, _810);
    float _844 = _802 * _836;
    float _846 = -_824;
    float _848 = fma(_820, _812, _846);
    float _850 = -_812;
    float _852 = fma(_820, _824, _850);
    float _854 = -_814;
    float _856 = _820 * _854;
    float _858 = fma(_842, _844, _840);
    float _860 = fma(_820, _810, _822);
    float _862 = fma(_848, _844, _838);
    float _864 = fma(_830, _844, _856);
    float _866 = fma(_852, _826, _858);
    float _868 = fma(_860, _826, _862);
    float _870 = fma(_834, _826, _864);
    float _872 = _866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _874 = _866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = -_720;
    float _878 = _550 + _876;
    float _880 = -_724;
    float _882 = _568 + _880;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _872);
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _888 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _890 = -_738;
    float _892 = _584 + _890;
    float _894 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _884);
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _888);
    float _900 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[11].z, _898);
    float _908 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _900);
    float _910 = _584 + _902;
    float _912 = _568 + _904;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _916 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[10].z, _908);
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _920 = _910 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _912 + _922;
    float _926 = 1.0 / _914;
    float _928 = _916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _930 = _920 * _920;
    float _932 = _866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _934 = _928 + _914;
    float _936 = fma(_924, _924, _930);
    float _938 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _932);
    float _940 = sqrt(_936);
    float _942 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _938);
    float _944 = _942 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _946 = _934 * _926;
    float _948 = _946 * 0.5;
    float _950 = _550 + _944;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _954 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _952);
    bool _956 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = 1.0 / _954;
    float _960 = _944;
    float _962 = _942;
    float _964 = _870;
    float _966 = _924;
    float _968 = _720;
    float _970 = _950;
    float _972 = _912;
    if (!_956)
    {
        _960 = _912;
    }
    float _974 = _960;
    float _976 = _974;
    if (!_956)
    {
        _962 = _910;
    }
    float _978 = _962;
    float _980 = _978;
    if (!_956)
    {
        _964 = _950;
    }
    float _982 = _964;
    bool _984 = !_956;
    float _986 = _982;
    float _988 = _958;
    if (!_984)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _994 = _940 + _992;
        float _996 = rsqrt(_936);
        float _998 = _994 * _990;
        float _1000 = _950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = _998 * 0.15915493667125701904296875;
        float _1004 = _1002 * 6.283185482025146484375;
        float _1006 = cos(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        float _1012 = _1006 + (-1.0);
        float _1014 = fma(_1010, _1000, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1016 = _1012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1018 = _996 * _1014;
        float _1020 = fma(_950, _1006, _1016);
        float _1022 = fma(_924, _1018, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1024 = fma(_920, _1018, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _976 = _1022;
        _986 = _1020;
        _980 = _1024;
    }
    float _1026 = _976;
    float _1028 = _986;
    float _1030 = _980;
    float _1032 = -_724;
    float _1034 = _1032 + _1026;
    float _1036 = -_720;
    float _1038 = _1036 + _1028;
    float _1040 = -_738;
    float _1042 = _1040 + _1030;
    float _1044 = _1034;
    float _1046 = _1042;
    float _1048 = _1030;
    if (_784)
    {
        _966 = 1.0;
    }
    float _1050 = _966;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1054 = _958 * _1052;
    float _1056 = _1050;
    if (_764)
    {
        _968 = _1034;
    }
    float _1058 = _968;
    float _1060 = _1058;
    if (_764)
    {
        _1044 = _1038;
    }
    float _1062 = _1044;
    float _1064 = _1062;
    if (!_764)
    {
        float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1068 = _878 + _1066;
        float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1072 = _882 + _1070;
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1076 = -_568;
        float _1078 = _1076 + _1026;
        float _1080 = _1068 * _1068;
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1084 = _892 + _1082;
        float _1086 = -_550;
        float _1088 = _1086 + _1028;
        float _1090 = -_584;
        float _1092 = _1090 + _1030;
        float _1094 = fma(_1072, _1072, _1080);
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1098 = fma(_1084, _1084, _1094);
        float _1100 = sqrt(_1098);
        float _1102 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1104 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1096;
        float _1108 = _1102 * _1106;
        float _1110 = fma(_1078, _1108, _882);
        float _1112 = fma(_1088, _1108, _878);
        float _1114 = fma(_1092, _1108, _892);
        _1064 = _1112;
        _1060 = _1110;
        _1046 = _1114;
        _1048 = _1092;
    }
    float _1116 = _1064;
    float _1118 = _1060;
    float _1120 = _1046;
    float _1122 = _1048;
    if (!_784)
    {
        float _1124 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1126 = _1124 * 0.15915493667125701904296875;
        float _1128 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1130 = _1126 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 0.15915493667125701904296875;
        float _1136 = _1126 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        float _1140 = 1.0 / _1132;
        float _1142 = _1134 * 6.283185482025146484375;
        float _1144 = cos(_1142);
        float _1146 = _1138 * _1140;
        float _1148 = _1134 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1154 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1152;
        float _1156 = _1144 * _1146;
        float _1158 = 1.0 / _1154;
        float _1160 = 1.0 / _1156;
        float _1162 = _1150 * _1160;
        float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1166 = fma(_1054, _1162, _1164);
        float _1168 = _1166 * _1158;
        float _1170 = precise::clamp(_1168, 0.0, 1.0);
        _1056 = _1170;
    }
    float _1172 = _1056;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1176 = _1116 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1118 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1184 = _1120 + _1182;
    float _1186 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1176 * _1176;
    float _1190 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1194 = fma(_1180, _1180, _1188);
    float _1196 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1198 = fma(_1184, _1184, _1194);
    float _1200 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1196);
    float _1202 = rsqrt(_1198);
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1206 = sqrt(_1198);
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1210 = _1180 * _1208;
    float _1212 = _1184 * _1208;
    float _1214 = _1210 * _1210;
    float _1216 = _1212 * _1212;
    float _1218 = _1214 + _1216;
    float _1220 = sqrt(_1218);
    bool _1222 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1226 = _1220 + _1224;
    float _1228 = _1188;
    float _1230 = _1218;
    float _1232 = _1226;
    float _1234 = _1210;
    float _1236 = _1212;
    float _1238 = _1214;
    if (_1222)
    {
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1240;
    }
    float _1242 = _1228;
    if (_1222)
    {
        float _1244 = rsqrt(_1218);
        _1230 = _1244;
    }
    float _1246 = _1230;
    float _1248 = _1246;
    if (_1222)
    {
        float _1250 = _1226 * _1242;
        _1232 = _1250;
    }
    float _1252 = _1232;
    if (_1222)
    {
        float _1254 = _1252 * 0.15915493667125701904296875;
        _970 = _1254;
    }
    float _1256 = _970;
    float _1258 = _1242;
    if (_1222)
    {
        float _1260 = _1256 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        _1258 = _1262;
    }
    float _1264 = _1258;
    float _1266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1268 = precise::max(0.0, _1266);
    float _1270 = _1122;
    if (_1222)
    {
        float _1272 = _1256 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = -_1208;
    float _1280 = -_1268;
    float _1282 = fma(_1176, _1278, _1280);
    if (_1222)
    {
        float _1284 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _988 = _1284;
    }
    float _1286 = _988;
    float _1288 = fma(_882, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1290 = _1264;
    float _1292 = _1286;
    if (_1222)
    {
        float _1294 = fma(_1264, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _972 = _1294;
    }
    float _1296 = _972;
    float _1298 = _1296;
    if (!_1222)
    {
        _1290 = _1282;
    }
    float _1300 = _1290;
    float _1302 = floor(_1288);
    float _1304 = _1300;
    float _1306 = _1276;
    if (_1222)
    {
        float _1308 = _1276 + (-1.0);
        _1292 = _1308;
    }
    float _1310 = _1292;
    if (_1222)
    {
        float _1312 = _1246 * _1296;
        _1298 = _1312;
    }
    float _1314 = _1298;
    if (_1222)
    {
        float _1316 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1248 = _1316;
    }
    float _1318 = _1248;
    if (_1222)
    {
        float _1320 = _1210 * _1314;
        _1234 = _1320;
    }
    float _1322 = _1234;
    if (_1222)
    {
        float _1324 = _1212 * _1314;
        _1236 = _1324;
    }
    float _1326 = _1236;
    if (_1222)
    {
        float _1328 = fma(_1282, _1276, _1318);
        _1304 = _1328;
    }
    float _1330 = _1304;
    if (_1222)
    {
        float _1332 = _1322 * _1322;
        _1238 = _1332;
    }
    float _1334 = _1238;
    if (!_1222)
    {
        _1306 = _1216;
    }
    float _1336 = _1306;
    float _1338 = _1336;
    if (_1222)
    {
        float _1340 = _1326 * _1326;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = fma(_1330, _1330, _1334);
    float _1348 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1350 = _1346 + _1342;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1354 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1348);
    float _1358 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1192);
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1362 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1360);
    float _1364 = precise::clamp(_1362, 0.0, 1.0);
    float _1366 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1370 = rsqrt(_1350);
    float _1372 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1374 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1366);
    float _1376 = -_1364;
    float _1378 = _1376 + 1.0;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1388 = abs(_1378);
    float _1390 = log2(_1388);
    float _1392 = -_1380;
    float _1394 = fma(_1392, _1352, 1.0);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1398 = fma(_892, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1400 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1396);
    float _1402 = _1370 * _1322;
    float _1404 = _1370 * _1330;
    float _1406 = floor(_1398);
    float _1408 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1412 = _1370 * _1326;
    float _1414 = -_1302;
    float _1416 = _1288 + _1414;
    float _1418 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = -_1410;
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1420);
    float _1424 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1426 = 1.0 / _1408;
    float _1428 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1430 = -_1412;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1422);
    float _1434 = _1404 + 1.0;
    float _1436 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1428);
    float _1438 = fma(_1432, -0.5, 0.5);
    float _1440 = fma(_1432, 0.5, 0.5);
    float _1442 = log2(_1394);
    float _1444 = -_1406;
    float _1446 = _1398 + _1444;
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1386);
    float _1450 = fma(_1440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1454 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1456 = fma(_1440, _1450, -0.212114393711090087890625);
    float _1458 = exp2(_1424);
    float _1460 = _1452 * _1426;
    float _1462 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1454);
    float _1464 = fma(_1440, _1456, 1.570728778839111328125);
    float _1466 = _1462 * _1426;
    float _1468 = sqrt(_1438);
    float _1470 = _1442 * 0.693147182464599609375;
    float _1472 = fma(_1466, -0.5, 0.5);
    float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1476 = -_1404;
    float _1478 = fma(_1458, _1434, _1476);
    float2 _4940 = float2(_1416, _1446);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).x;
    float _1482 = fma(_1478, 0.5, 0.5);
    float _1484 = _1468 * 0.636619746685028076171875;
    float _1486 = fma(_1460, 0.5, 0.5);
    float _1488 = -_1464;
    float _1490 = fma(_1484, _1488, 1.0);
    float3 _4963 = float3(_1486, _1472, _1474);
    float _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4963, float3(0.0), isnan(_4963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4963, float3(0.0), isnan(_4963)), level(0.0)).x;
    float3 _4974 = float3(_1486, _1472, _1474);
    float4 _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4974, float3(0.0), isnan(_4974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4974, float3(0.0), isnan(_4974)), level(0.0)).xyzw;
    float _1497 = _1495.x;
    float _1499 = _1495.y;
    float _1501 = _1495.z;
    float _1503 = _1495.w;
    float2 _4990 = float2(_1490, _1482);
    float3 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4990, float2(0.0), isnan(_4990)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4990, float2(0.0), isnan(_4990)), level(0.0)).xyz;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = float(uint(_374));
    float _1517 = trunc(_508);
    int _1519 = int(_1517);
    bool _1521 = _374 == 0;
    float _1523 = _416 * _166;
    int _1525 = abs(_572);
    out.m_65.x = _882;
    out.m_65.y = _878;
    out.m_65.z = _892;
    int _1527 = abs(_582);
    float _1529 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1531 = 1.0 / _1515;
    out.m_67.w = _704;
    out.m_69.x = _802;
    float _1533 = float(uint(_1519));
    float _1535 = trunc(_1523);
    int _1537 = int(_1535);
    int _1539 = ~_374;
    int _1541 = _1539 + 1;
    float _1543 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_71.x = _1118;
    out.m_71.y = _1116;
    out.m_71.z = _1120;
    float _1545 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1543);
    int _1547 = as_type<int>(_1531) + (-2);
    float _1549 = abs(_1054);
    float _1551 = log2(_1549);
    float _1553 = as_type<float>(_1547) * _1533;
    int _1555 = ~_374;
    int _1557 = _1555 + 1;
    float _1559 = exp2(_1529);
    bool _1561 = _1054 <= 8000.0;
    bool _1563 = isnan(_1054);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(8000.0);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = trunc(_1553);
    float _1575 = precise::max(_1573, 0.0);
    uint _1578 = uint(_1575);
    float _1580 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1582 = exp2(_1580);
    float _1584 = -_1559;
    float _1586 = _1584 + 1.0;
    float _1588 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1590 = _1541 * int(_1578);
    int _1592 = _1590 + _1519;
    float _1594 = float(uint(_1592));
    float _1596 = as_type<float>(_1547) * _1594;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1600 = _1598 != 0;
    float _1602 = trunc(_1596);
    float _1604 = precise::max(_1602, 0.0);
    uint _1606 = uint(_1604);
    bool _1608 = !_1600;
    float _1610 = _1608 ? 7.345489978790283203125 : 1.0;
    float _1612 = _1610 * _328;
    float _1614 = float(_1519);
    float _1616 = floor(_1612);
    bool _1618 = _1614 >= _402;
    bool _1620 = isnan(_1614);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(_402);
    bool _1626 = _1622 || _1624;
    float _1628 = float(_1626);
    int _1630 = int(_1578) + int(_1606);
    float _1632 = trunc(_1628);
    int _1634 = int(_1632);
    int _1636 = _1557 * _1630;
    int _1638 = _1636 + _1519;
    bool _1640 = uint(_1638) >= uint(_374);
    float _1642 = -_1616;
    float _1644 = _1612 + _1642;
    bool _1646 = !_1640;
    int _1648 = _1646 ? 0 : (-1);
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1652 = _1650 != 0;
    int _1654 = ~_1630;
    int _1656 = _1654 + _1648;
    int _1658 = _1656 + 1;
    float _1660 = _1644 * _402;
    bool _1662 = !_1652;
    int _1664 = _1662 ? 0 : 1;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1668 = _1666 != 0;
    int _1670 = _374 * _1658;
    int _1672 = _1670 + _1519;
    int _1674 = ~_1634;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    float _1680 = trunc(_1660);
    int _1682 = int(_1680);
    int _1684 = abs(_1664);
    bool _1686 = !_1521;
    int _1688 = _1686 ? _1672 : (-1);
    int _1690 = _374 + (-1);
    int _1692 = _1688 * _1678;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1700 = _1698 != 0;
    int _1702 = _1634 * _1690;
    int _1704 = _1702 + _1692;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1710 = !_1668;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = _1682 * _1684;
    int _1716 = _1714 + _1519;
    int _1718 = abs(_588);
    int _1720 = _1704 * _1525;
    float _1722 = 1.0 / _1708;
    int _1724 = abs(_1712);
    float _1726 = as_type<float>(_1527);
    float _1728 = _1408;
    float _1730 = _1462;
    if (_1696)
    {
        float _1732 = in.m_55.x;
        _1726 = _1732;
    }
    float _1734 = _1726;
    int _1736 = _1537 * _1527;
    int _1738 = _1736 + _1720;
    int _1740 = _1716 * _1718;
    int _1742 = _1740 + _1738;
    float _1744 = in.m_73.x;
    int _1746 = ~_374;
    int _1748 = _1746 + 1;
    int _1750 = _1682 * _1724;
    int _1752 = _1750 + _1742;
    bool _1754 = _330 > 0.5;
    float _1756 = in.m_73.y;
    float _1758 = float(uint(_1752));
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1762 = _1760 != 0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1764;
    float _1768 = float(uint(_1716));
    float _1770 = as_type<float>(_1547) * _1758;
    float _1772 = _1766 * _1722;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1776 = _326 + _1774;
    float _1778 = trunc(_1770);
    float _1780 = precise::max(_1778, 0.0);
    uint _1782 = uint(_1780);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1784 = fma(_1772, _1776, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1786 = -_1756;
    float _1788 = _1786 + 1.0;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1794 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1796 = isnan(_326);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1802 = _1798 || _1800;
    float _1804 = float(_1802);
    int _1806 = _1748 * int(_1782);
    int _1808 = _1806 + _1752;
    float _1810 = _1756;
    float _1812 = _1734;
    float _1814 = _1744;
    if (_1700)
    {
        float _1816 = _1754 ? _1788 : _1756;
        _1810 = _1816;
    }
    float _1818 = _1810;
    float _1820 = 1.0 / _1792;
    bool _1822 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1824 = isnan(_326);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = -_1804;
    float _1836 = _1834 + 1.0;
    float _1838 = float(uint(_1808));
    float _1840 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1842 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1844 = isnan(_326);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1850 = _1846 || _1848;
    float _1852 = float(_1850);
    float _1854 = -_1832;
    float _1856 = _1854 + 1.0;
    bool _1858 = _1734 > 0.5;
    bool _1860 = _1858 && _1696;
    float _1862 = as_type<float>(_1547) * _1838;
    if (_1696)
    {
        _1812 = _1744;
    }
    float _1864 = _1812;
    float _1866 = _1804 * _1856;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    float _1878 = _1852 * _1836;
    float _1880 = -_1852;
    float _1882 = _1880 + 1.0;
    float _1884 = as_type<float>(_1547) * _1768;
    float _1886 = _1870 * _1820;
    float _1888 = _1784 * _1878;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _326 + _1890;
    float _1894 = -_506;
    float _1896 = fma(_516, _1840, _1894);
    float _1898 = _1864;
    if (_1860)
    {
        float _1900 = -_1864;
        float _1902 = _1900 + 1.0;
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1888);
    float _1908 = fma(_1886, _1892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1910 = ~_374;
    int _1912 = _1910 + 1;
    float _1914 = trunc(_1884);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = ~_374;
    int _1922 = _1920 + 1;
    float _1924 = fma(_1908, _1866, _1906);
    bool _1926 = _768 != 0.0;
    bool _1928 = isnan(_768);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan(0.0);
    bool _1934 = _1930 || _1932;
    int _1936 = int(_1782) + int(_1876);
    float _1938 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1924);
    float _1940 = in.m_77.x;
    float _1942 = in.m_77.y;
    float _1944 = in.m_77.z;
    int _1946 = _1912 * _1936;
    int _1948 = _1946 + _1752;
    bool _1950 = _766 == 0.0;
    bool _1952 = !_1934;
    bool _1954 = _1950 && _1952;
    if (_1696)
    {
        _1814 = _1904;
    }
    float _1956 = _1814;
    int _1958 = _1922 * int(_1918);
    int _1960 = _1958 + _1716;
    bool _1962 = _770 == 0.0;
    bool _1964 = _1962 && _1954;
    bool _1966 = uint(_1948) >= uint(_374);
    float _1968 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1970 = !_1966;
    int _1972 = _1970 ? 0 : (-1);
    float _1974 = fma(_504, _1968, _420);
    float _1976 = float(uint(_1960));
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1980 = ~_1936;
    int _1982 = _1980 + _1972;
    int _1984 = _1982 + 1;
    float _1986 = _1974 + 0.5;
    float _1988 = as_type<float>(_1547) * _1976;
    float _1990 = _1896 + 0.5;
    float _1992 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1996 = _1940;
    float _1998 = _1942;
    float _2000 = _1944;
    if (!_1964)
    {
        float _2002 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1940);
        _1996 = _2002;
    }
    float _2004 = _1996;
    int _2006 = _374 * _1984;
    int _2008 = _2006 + _1752;
    float _2010 = trunc(_1988);
    float _2012 = precise::max(_2010, 0.0);
    uint _2014 = uint(_2012);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2020 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2022 = !_1521;
    int _2024 = _2022 ? _2008 : (-1);
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1964)
    {
        float _2028 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1942);
        _1998 = _2028;
    }
    float _2030 = _1998;
    int _2032 = ~_374;
    int _2034 = _2032 + 1;
    if (!_1964)
    {
        float _2036 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1944);
        _2000 = _2036;
    }
    float _2038 = _2000;
    int _2040 = _2024 >> 31;
    float _2042 = _832 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2044 = _832 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_79.x = _2018;
    out.m_79.y = _2026;
    out.m_79.z = _2020;
    out.m_79.w = _1992;
    int _2046 = _2040 & 3;
    float _2048 = -_820;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2042);
    float _2052 = _832 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2054 = int(_1918) + int(_2014);
    out.m_81.x = _1986;
    out.m_81.y = _1990;
    int _2056 = _2024 + _2046;
    float _2058 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1545);
    int _2060 = _2024 & 3;
    bool _2062 = _2060 != 0;
    float _2064 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2066 = _2056 >> 2;
    int _2068 = _2024 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    int _2074 = _2034 * _2054;
    int _2076 = _2074 + _1716;
    float _2078 = -_820;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2044);
    int _2082 = _2066 << 4;
    int _2084 = _2082 + 368;
    float _2086 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2050);
    float _2088 = -_820;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2052);
    float _2092 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2080);
    uint _2094 = uint(int(uint(_2084) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    bool _2110 = uint(_2076) >= uint(_374);
    float _2112 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2114 = _2092 * _2030;
    float _2116 = _2086 * _2030;
    float _2118 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2120 = _2112 * _2030;
    bool _2122 = !_2110;
    int _2124 = _2122 ? 0 : (-1);
    int _2126 = _2084 + 8;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    uint _2130 = uint(int(uint(int(_2128)) >> uint(2)));
    int _2132 = int(_2128) & 3;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[int(_2130)][_2132];
    int _2136 = int(_2128) + 1;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    int _2140 = _2136 & 3;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[int(_2138)][_2140];
    bool _2144 = uint(_2060) > 1u;
    float _2146 = fma(_2058, _2004, _2114);
    int _2148 = ~_2054;
    int _2150 = _2148 + _2124;
    int _2152 = _2150 + 1;
    float _2154 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2118);
    int _2156 = _2070 ? 0 : 1;
    float _2158 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2160 = uint(_2060) >= 2u;
    float _2162 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2154);
    int _2164 = ~_2156;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2172 = !_2062;
    int _2174 = _2172 ? 0 : 1;
    float _2176 = fma(_2162, _2004, _2116);
    bool _2178 = _2060 != 3;
    float _2180 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2158);
    int _2182 = _2168;
    if (!_2144)
    {
        int _2184 = ~_2156;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2170);
    bool _2192 = _2060 != 3;
    float _2194 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2180);
    int _2196 = abs(_2188);
    float _2198 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2190);
    int _2200 = _2160 ? 0 : 1;
    float _2202 = fma(_2194, _2004, _2120);
    int _2204 = abs(_2174);
    float _2206 = fma(_2198, _2038, _2146);
    int _2208 = ~_2200;
    int _2210 = _2208 + 1;
    int _2212 = _2210 + 1;
    int _2214 = _374 * _2152;
    int _2216 = _2214 + _1716;
    int _2218 = ~_2196;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2226 = !_2178;
    int _2228 = _2226 ? 0 : (-1);
    float _2230 = _1588 * _1492;
    int _2232 = _2212;
    if (_2192)
    {
        int _2234 = ~_2200;
        int _2236 = _2234 + 1;
        _2232 = _2236;
    }
    int _2238 = _2232;
    float _2240 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2242 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2072);
    int _2244 = abs(_2238);
    float _2246 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    int _2248 = ~_2204;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = -_1480;
    float _2256 = _2254 + 1.0;
    int _2258 = abs(_2228);
    int _2260 = _2222 * as_type<int>(_2108);
    bool _2262 = !_1762;
    int _2264 = _2262 ? 0 : 1;
    int _2266 = _2252 * as_type<int>(_2100);
    int _2268 = _2266 + _2260;
    float _2270 = _1452 + _1408;
    int _2272 = abs(_2264);
    float _2274 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2276 = precise::clamp(_2274, 0.0, 1.0);
    bool _2278 = !_1521;
    int _2280 = _2278 ? _2216 : (-1);
    float _2282 = _1513 * _2230;
    int _2284 = ~_2244;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    float _2290 = fma(_2242, _2038, _2176);
    float _2292 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2294 = ~_2258;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2288 * as_type<int>(_2134);
    int _2302 = _2300 + _2268;
    float _2304 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2292);
    int _2306 = ~_2272;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2298 * as_type<int>(_2142);
    int _2314 = _2312 + _2302;
    float _2316 = in.m_83.x;
    float _2318 = fma(_2276, -2.0, 3.0);
    float _2320 = _2276 * _2276;
    int _2322 = _2314 * _2310;
    float _2324 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2326 = _1408 * 0.5;
    float _2328 = _2320 * _2318;
    int _2330 = _2280 * _2272;
    int _2332 = _2330 + _2322;
    float _2334 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2324);
    float _2336 = fma(_2246, _2038, _2202);
    float _2338 = -_2328;
    float _2340 = _2338 + 1.0;
    float _2342 = _2334 + _1408;
    out.gl_Position.x = _1452;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _2334;
    out.gl_Position.w = _1408;
    float _2344 = fma(_2340, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2328);
    float _2346 = _2270 * 0.5;
    float _2348 = _2342 * 0.5;
    float _2350 = fma(_1462, -0.5, _2326);
    float _2352 = _1571 * _2344;
    float _2354 = float(_2332);
    out.m_85.x = _2206;
    out.m_85.y = _2290;
    out.m_85.z = _2336;
    float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2358 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2360 = isnan(_1206);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2366 = _2362 || _2364;
    out.m_87.x = _2346;
    out.m_87.y = _2350;
    out.m_87.z = _2348;
    out.m_87.w = _1408;
    float _2368 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2370 = _2256 * _2356;
    float _2372 = precise::clamp(_2370, 0.0, 1.0);
    float _2374 = _1503 * _2230;
    float _2376 = -_1588;
    float _2378 = _2376 + 1.0;
    out.m_89.x = _2354;
    float _2380 = -_2372;
    float _2382 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2384 = fma(_1509, _2374, _1497);
    float _2386 = fma(_1511, _2374, _1499);
    float _2388 = _1503 * _2378;
    float _2390 = fma(_1503, _2282, _1501);
    float _2392 = _2382 * _2316;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2396 = _2392;
    float _2398 = _2378;
    if (!_2366)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2400 = _2394;
    float _2402 = _2400;
    float _2404 = _2400;
    if (!_2366)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _1728;
    out.m_91.x = _2384;
    out.m_91.y = _2386;
    out.m_91.z = _2390;
    out.m_91.w = _2388;
    float _2408 = _2392 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2410 = _2408;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2366)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2416 = _2396;
    float _2418 = _2416;
    float _2420 = _2416;
    if (!_2366)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2422 = _2398;
    out.m_93.x = _2408;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2366)
    {
        _1730 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2428 = _1730;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2366)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2434 = _2410;
    bool _2436 = !_2366;
    float _2438 = _2434;
    float _2440 = _2434;
    if (!_2436)
    {
        bool _2442 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2444 = isnan(_1206);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2454 = _1206 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2456;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2464 = 1.0 / _2458;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2482 = _2454 * _2464;
            float _2484 = precise::clamp(_2482, 0.0, 1.0);
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2490 = fma(_2484, _2462, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2494;
            _2432 = _2498;
            _2420 = _2490;
            _2426 = _2496;
            _2414 = _2492;
            _2440 = _2500;
            _2502 = true;
        }
        else
        {
            bool _2504 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2506 = isnan(_1206);
            bool _2508 = _2504 || _2506;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2512 = _2508 || _2510;
            if (!_2512)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2514 = _2418;
            _2420 = _2514;
            if (!_2512)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2516 = _2402;
            _2404 = _2516;
            if (!_2512)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2518 = _2412;
            _2414 = _2518;
            if (!_2512)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2520 = _2424;
            _2426 = _2520;
            if (!_2512)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2522 = _2430;
            _2432 = _2522;
            if (!_2512)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2524 = _2438;
            bool _2526 = !_2512;
            _2440 = _2524;
            if (!_2526)
            {
                bool _2528 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2530 = isnan(_1206);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2536 = _2532 || _2534;
                if (!_2536)
                {
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2540 = _1206 + _2538;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2542;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2550 = 1.0 / _2544;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2568 = _2540 * _2550;
                    float _2570 = precise::clamp(_2568, 0.0, 1.0);
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2576 = fma(_2570, _2548, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2580;
                    _2432 = _2584;
                    _2420 = _2576;
                    _2426 = _2582;
                    _2414 = _2578;
                    _2440 = _2586;
                    _2502 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2502 = false;
    float _2588 = _2404;
    float _2590 = _2432;
    float _2592 = _2420;
    float _2594 = _2426;
    float _2596 = _2414;
    float _2598 = _2440;
    float _2600 = _2368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2602 = fma(_2290, -0.5, 0.5);
    float _2604 = precise::clamp(_2602, 0.0, 1.0);
    float _2606 = -_2588;
    float _2608 = _2606 + _2590;
    float _2610 = -_2592;
    float _2612 = _2610 + _2594;
    out.m_53.x = _2600;
    float _2614 = fma(_2604, _2608, _2588);
    float _2616 = -_2596;
    float _2618 = _2616 + _2598;
    float _2620 = fma(_2604, _2612, _2592);
    float _2622 = _2614 * 0.586610972881317138671875;
    bool _2624 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = fma(_2604, _2618, _2596);
    out.m_95.x = 0.0;
    float _2628 = fma(_2620, 0.298911988735198974609375, _2622);
    bool _2630 = _1172 > 0.0;
    bool _2632 = isnan(_1172);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    float _2640 = fma(_2626, 0.114477999508380889892578125, _2628);
    float _2642 = -_2640;
    float _2644 = _2620 + _2642;
    float _2646 = -_2640;
    float _2648 = _2614 + _2646;
    float _2650 = -_2640;
    float _2652 = _2626 + _2650;
    float _2654 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    float _2656 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    float _2658 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    bool _2660 = !_2624;
    if (!_2660)
    {
        float _2662 = -_1116;
        float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2666 = -_1118;
        float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2670 = -_1120;
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2674 = _2664 * _2664;
        float _2676 = fma(_2668, _2668, _2674);
        float _2678 = fma(_2672, _2672, _2676);
        float _2680 = sqrt(_2678);
        float _2682 = rsqrt(_2678);
        float _2684 = -_2680;
        float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2688 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2690 = precise::clamp(_2688, 0.0, 1.0);
        float _2692 = _2668 * _2682;
        float _2694 = _2664 * _2682;
        float _2696 = abs(_2690);
        float _2698 = log2(_2696);
        float _2700 = _2672 * _2682;
        float _2702 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2704 = _2290 * _2694;
        float _2706 = -_2694;
        float _2708 = -_2702;
        float _2710 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2708);
        float _2712 = fma(_2206, _2692, _2704);
        float _2714 = -_2700;
        float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2710);
        float _2718 = fma(_2336, _2700, _2712);
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2724 = _2716 + _2722;
        float _2726 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2728 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2730 = precise::clamp(_2728, 0.0, 1.0);
        float _2732 = exp2(_2726);
        float _2734 = _2732 * _2730;
        float _2736 = _2720 * _2734;
        float _2738 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2740 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2742 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2738;
        out.m_95.y = _2740;
        out.m_95.z = _2742;
    }
    out.m_67.x = _2654;
    out.m_67.y = _2656;
    out.m_67.z = _2658;
    if (_2638)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2744 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2744;
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
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2502 = false;
    bool _194 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _109 = in.m_46.w;
    float _111 = in.m_48.w;
    float _113 = trunc(_109);
    int _116 = int(_113);
    float _118 = -_111;
    float _120 = _118 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _120;
    bool _124 = _116 >= 1;
    float _126 = 0.0;
    float _128 = as_type<float>(_116);
    float _130 = _120;
    if (!_124)
    {
        _126 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _132 = _126;
    if (!_124)
    {
        out.m_53.x = 0.0;
    }
    int _134 = 0;
    if (!_124)
    {
        float _136 = _132 * 5.0;
        _134 = as_type<int>(_136);
    }
    int _138 = _134;
    int _140 = _138;
    if (!_124)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2813 = as_type<float>(_138);
        out.gl_Position.z = _2813;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _142 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _144 = isnan(_111);
    bool _146 = _142 || _144;
    bool _148 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _150 = _146 || _148;
    float _152 = float(_116);
    bool _154 = _120 >= _152;
    bool _156 = !_150;
    bool _158 = _154 || _156;
    if (_158)
    {
        _128 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _160 = _128;
    if (_158)
    {
        out.m_53.x = 0.0;
    }
    if (_158)
    {
        float _162 = _160 * 5.0;
        _140 = as_type<int>(_162);
    }
    int _164 = _140;
    if (_158)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2868 = as_type<float>(_164);
        out.gl_Position.z = _2868;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _166 = 1.0 / _152;
    bool _168 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _170 = _120 * _166;
    bool _172 = !_168;
    float _174 = _170;
    float _192;
    if (!_172)
    {
        float _176 = in.m_55.x;
        float _178 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _180 = _176 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _182 = fma(_180, (*spvDescriptorSet0.vp_c9)._m0[12].x, _120);
        float _184 = _182 * _178;
        float _186 = floor(_184);
        float _188 = -_186;
        float _190 = _184 + _188;
        _192 = _190;
        _194 = true;
    }
    else
    {
        _192 = _170;
    }
    _194 = false;
    float _196 = _192;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _198;
    float _202 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _206 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _208 = isnan(_196);
    bool _210 = _206 || _208;
    bool _212 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _214 = _210 || _212;
    float _216 = float(_214);
    float _218 = 1.0 / _200;
    float _220 = _202 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _226 = _196 + _224;
    float _228 = _204 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _230 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _232 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _234 = -_216;
    float _236 = _234 + 1.0;
    bool _238 = _196 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _240 = isnan(_196);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _250;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _256 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _254;
    out.m_57.x = _220;
    out.m_57.y = _230;
    out.m_57.z = _228;
    out.m_57.w = _232;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _258;
    float _262 = _226 * _218;
    float _264 = _248 * _236;
    float _266 = in.m_59.x;
    float _268 = in.m_59.y;
    float _270 = in.m_59.z;
    bool _272 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _274 = fma(_252, _262, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _276 = fma(_256, _262, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _278 = fma(_260, _262, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _280 = -_248;
    float _282 = _280 + 1.0;
    float _284 = _274 * _264;
    float _286 = _276 * _264;
    float _288 = _278 * _264;
    float _290 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].x, _284);
    float _292 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].y, _286);
    float _294 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[143].z, _288);
    float _296 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].x, _290);
    float _298 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].y, _292);
    float _300 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[144].z, _294);
    float _302 = _298 * _268;
    float _304 = _296 * _266;
    float _306 = _300 * _270;
    bool _308 = !_272;
    if (!_308)
    {
        float _310 = in.m_55.x;
        float _312 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _314 = _310 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _316 = fma(_314, (*spvDescriptorSet0.vp_c9)._m0[11].w, _120);
        float _318 = _316 * _312;
        float _320 = floor(_318);
        float _322 = -_320;
        float _324 = _318 + _322;
        _174 = _324;
    }
    float _326 = _174;
    float _328 = in.m_55.x;
    float _330 = in.m_55.y;
    float _332 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _334 = log2(_332);
    float _336 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _338 = in.m_46.x;
    float _340 = in.m_46.y;
    float _342 = in.m_46.z;
    float _344 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = in.m_55.z;
    float _348 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _350 = int(_348);
    float _352 = _336 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    bool _354 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _356 = isnan(0.0);
    bool _358 = _354 || _356;
    bool _360 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _362 = _358 || _360;
    float _364 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _366 = _334 * _120;
    float _368 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _370 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _374 = int(_372);
    float _376 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _378 = _328 * 2.0;
    float _380 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _382 = float(_350);
    float _384 = fma(_376, -2.0, _370);
    float _386 = _330 * 2.0;
    float _388 = -_368;
    float _390 = fma(_380, 2.0, _388);
    float _392 = floor(_378);
    float _394 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _396 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _398 = _330 + _328;
    float _400 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _402 = float(_374);
    float _404 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _396);
    float _406 = _398 + (-1.0);
    float _408 = floor(_386);
    float _410 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _400);
    float _412 = _346 * 2.0;
    float _414 = fma(_406, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _416 = _402 * _120;
    float _418 = -_120;
    float _420 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[76].x, _390);
    float _422 = exp2(_366);
    bool _424 = _392 > 0.0;
    bool _426 = _392 >= 0.0;
    bool _428 = isnan(_392);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    bool _436 = _408 > 0.0;
    float _438 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _394);
    float _440 = _330 + _346;
    float _442 = floor(_412);
    bool _444 = _408 >= 0.0;
    bool _446 = isnan(_408);
    bool _448 = _444 || _446;
    bool _450 = isnan(0.0);
    bool _452 = _448 || _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = _440 + (-1.0);
    bool _460 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _462 = isnan(1.0);
    bool _464 = _460 || _462;
    bool _466 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _468 = _464 || _466;
    float _470 = -_422;
    float _472 = _470 + 1.0;
    float _474 = fma(_458, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _476 = 1.0 / _382;
    float _478 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _480 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _482 = _442 > 0.0;
    float _484 = 1.0 / _456;
    float _486 = _362 ? _472 : 0.0;
    float _488 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _478);
    bool _490 = _442 >= 0.0;
    bool _492 = isnan(_442);
    bool _494 = _490 || _492;
    bool _496 = isnan(0.0);
    bool _498 = _494 || _496;
    float _500 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _480);
    int _502 = _434 ? 0 : 1;
    float _504 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _488);
    float _506 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _384);
    float _508 = _476 * _120;
    int _510 = ~_502;
    int _512 = _510 + 1;
    int _514 = _512 + 1;
    float _516 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _500);
    int _518 = _514;
    if (!_424)
    {
        int _520 = ~_502;
        int _522 = _520 + 1;
        _518 = _522;
    }
    int _524 = _518;
    float _526 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _404);
    int _528 = _452 ? 0 : 1;
    float _530 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _438);
    float _532 = float(_524);
    if (_468)
    {
        float _534 = _486 * _484;
        _130 = _534;
    }
    float _536 = _130;
    int _538 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _540 = _538 != 0;
    int _542 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _544 = _542 != 0;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _548 = _546 != 0;
    float _550 = _526 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _552 = ~_528;
    int _554 = _552 + 1;
    int _556 = _554 + 1;
    float _558 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _410);
    int _560 = _556;
    if (!_436)
    {
        int _562 = ~_528;
        int _564 = _562 + 1;
        _560 = _564;
    }
    int _566 = _560;
    float _568 = _530 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _570 = !_544;
    int _572 = _570 ? 0 : 1;
    float _574 = in.m_61.x;
    float _576 = in.m_61.y;
    float _578 = in.m_61.z;
    bool _580 = !_540;
    int _582 = _580 ? 0 : 1;
    float _584 = _558 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _586 = !_548;
    int _588 = _586 ? 0 : 1;
    int _590 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _592 = _590 != 0;
    int _594 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _596 = _594 != 0;
    int _598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _600 = _598 != 0;
    float _602 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _604 = _584 + _602;
    int _606 = _498 ? 0 : 1;
    float _608 = float(_566);
    bool _610 = !_592;
    int _612 = _610 ? 0 : 1;
    bool _614 = !_596;
    int _616 = _614 ? 0 : 1;
    int _618 = abs(_612);
    float _620 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _622 = _550 + _620;
    int _624 = abs(_616);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _628 = _568 + _626;
    int _630 = ~_606;
    int _632 = _630 + 1;
    int _634 = _632 + 1;
    float _636 = _622 * _622;
    float _638 = float(_624);
    int _640 = _634;
    if (!_482)
    {
        int _642 = ~_606;
        int _644 = _642 + 1;
        _640 = _644;
    }
    int _646 = _640;
    float _648 = fma(_628, _628, _636);
    float _650 = _638 * _532;
    float _652 = float(_618);
    float _654 = fma(_604, _604, _648);
    float _656 = float(_646);
    float _658 = _650 * (-2.0);
    bool _660 = !_600;
    int _662 = _660 ? 0 : 1;
    float _664 = sqrt(_654);
    float _666 = _330 + (-0.5);
    float _668 = fma(_658, _576, _576);
    float _670 = _652 * _656;
    int _672 = abs(_662);
    float _674 = fma(_474, _658, _474);
    float _676 = fma(_666, (*spvDescriptorSet0.vp_c9)._m0[196].y, _668);
    float _678 = _346 + _328;
    float _680 = rsqrt(_654);
    float _682 = _670 * (-2.0);
    float _684 = _678 + (-1.0);
    float _686 = _346 + (-0.5);
    float _688 = float(_672);
    float _690 = fma(_682, _574, _574);
    float _692 = fma(_684, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _694 = _664 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _696 = _328 + (-0.5);
    float _698 = _688 * _608;
    float _700 = fma(_414, _682, _414);
    float _702 = fma(_674, _536, _676);
    float _704 = precise::min(_352, _694);
    float _706 = _698 * (-2.0);
    float _708 = fma(_696, (*spvDescriptorSet0.vp_c9)._m0[196].x, _690);
    float _710 = _702 * 0.15915493667125701904296875;
    float _712 = _680 * _704;
    float _714 = fma(_706, _578, _578);
    float _716 = fma(_700, _536, _708);
    float _718 = fma(_692, _706, _692);
    float _720 = _622 * _712;
    float _722 = fma(_686, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _724 = _628 * _712;
    float _726 = _716 * 0.15915493667125701904296875;
    float _728 = -_720;
    float _730 = _622 + _728;
    float _732 = fma(_718, _536, _722);
    float _734 = -_724;
    float _736 = _628 + _734;
    float _738 = _604 * _712;
    float _740 = _730 * _730;
    float _742 = _732 * 0.15915493667125701904296875;
    float _744 = _710 * 6.283185482025146484375;
    float _746 = sin(_744);
    float _748 = -_738;
    float _750 = _604 + _748;
    float _752 = fma(_736, _736, _740);
    float _754 = fma(_750, _750, _752);
    bool _756 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _758 = isnan(0.5);
    bool _760 = _756 || _758;
    bool _762 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _764 = _760 || _762;
    float _766 = in.m_63.x;
    float _768 = in.m_63.y;
    float _770 = in.m_63.z;
    float _772 = _710 * 6.283185482025146484375;
    float _774 = cos(_772);
    bool _776 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _778 = isnan(0.5);
    bool _780 = _776 || _778;
    bool _782 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _784 = _780 || _782;
    float _786 = sqrt(_754);
    float _788 = _726 * 6.283185482025146484375;
    float _790 = sin(_788);
    float _792 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _768);
    float _794 = _726 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _680 * _786;
    float _800 = _344 * _798;
    float _802 = _336 * _798;
    float _804 = _364 * _798;
    float _806 = _742 * 6.283185482025146484375;
    float _808 = cos(_806);
    float _810 = _790 * _746;
    float _812 = _790 * _774;
    float _814 = _800 * _792;
    float _816 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _770);
    float _818 = _742 * 6.283185482025146484375;
    float _820 = sin(_818);
    float _822 = _796 * _774;
    float _824 = _796 * _746;
    float _826 = _804 * _816;
    float _828 = _790 * _808;
    float _830 = _774 * _808;
    float _832 = _796 * _808;
    float _834 = _746 * _808;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _766);
    float _838 = _828 * _814;
    float _840 = _832 * _814;
    float _842 = fma(_820, _822, _810);
    float _844 = _802 * _836;
    float _846 = -_824;
    float _848 = fma(_820, _812, _846);
    float _850 = -_812;
    float _852 = fma(_820, _824, _850);
    float _854 = -_814;
    float _856 = _820 * _854;
    float _858 = fma(_842, _844, _840);
    float _860 = fma(_820, _810, _822);
    float _862 = fma(_848, _844, _838);
    float _864 = fma(_830, _844, _856);
    float _866 = fma(_852, _826, _858);
    float _868 = fma(_860, _826, _862);
    float _870 = fma(_834, _826, _864);
    float _872 = _866 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _874 = _866 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _876 = -_720;
    float _878 = _550 + _876;
    float _880 = -_724;
    float _882 = _568 + _880;
    float _884 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[26].x, _872);
    float _886 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[24].x, _874);
    float _888 = _878 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _890 = -_738;
    float _892 = _584 + _890;
    float _894 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[26].z, _884);
    float _896 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[24].z, _886);
    float _898 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[11].x, _888);
    float _900 = _878 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _902 = _894 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _904 = _896 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _906 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[11].z, _898);
    float _908 = fma(_882, (*spvDescriptorSet0.vp_c8)._m0[10].x, _900);
    float _910 = _584 + _902;
    float _912 = _568 + _904;
    float _914 = _906 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _916 = fma(_892, (*spvDescriptorSet0.vp_c8)._m0[10].z, _908);
    float _918 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _920 = _910 + _918;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _924 = _912 + _922;
    float _926 = 1.0 / _914;
    float _928 = _916 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _930 = _920 * _920;
    float _932 = _866 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _934 = _928 + _914;
    float _936 = fma(_924, _924, _930);
    float _938 = fma(_870, (*spvDescriptorSet0.vp_c8)._m0[25].x, _932);
    float _940 = sqrt(_936);
    float _942 = fma(_868, (*spvDescriptorSet0.vp_c8)._m0[25].z, _938);
    float _944 = _942 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _946 = _934 * _926;
    float _948 = _946 * 0.5;
    float _950 = _550 + _944;
    float _952 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _954 = fma(_948, (*spvDescriptorSet0.vp_c8)._m0[30].w, _952);
    bool _956 = _940 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _958 = 1.0 / _954;
    float _960 = _944;
    float _962 = _942;
    float _964 = _870;
    float _966 = _924;
    float _968 = _720;
    float _970 = _950;
    float _972 = _912;
    if (!_956)
    {
        _960 = _912;
    }
    float _974 = _960;
    float _976 = _974;
    if (!_956)
    {
        _962 = _910;
    }
    float _978 = _962;
    float _980 = _978;
    if (!_956)
    {
        _964 = _950;
    }
    float _982 = _964;
    bool _984 = !_956;
    float _986 = _982;
    float _988 = _958;
    if (!_984)
    {
        float _990 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _992 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _994 = _940 + _992;
        float _996 = rsqrt(_936);
        float _998 = _994 * _990;
        float _1000 = _950 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = _998 * 0.15915493667125701904296875;
        float _1004 = _1002 * 6.283185482025146484375;
        float _1006 = cos(_1004);
        float _1008 = _1002 * 6.283185482025146484375;
        float _1010 = sin(_1008);
        float _1012 = _1006 + (-1.0);
        float _1014 = fma(_1010, _1000, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1016 = _1012 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1018 = _996 * _1014;
        float _1020 = fma(_950, _1006, _1016);
        float _1022 = fma(_924, _1018, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1024 = fma(_920, _1018, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _976 = _1022;
        _986 = _1020;
        _980 = _1024;
    }
    float _1026 = _976;
    float _1028 = _986;
    float _1030 = _980;
    float _1032 = -_724;
    float _1034 = _1032 + _1026;
    float _1036 = -_720;
    float _1038 = _1036 + _1028;
    float _1040 = -_738;
    float _1042 = _1040 + _1030;
    float _1044 = _1034;
    float _1046 = _1042;
    float _1048 = _1030;
    if (_784)
    {
        _966 = 1.0;
    }
    float _1050 = _966;
    float _1052 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1054 = _958 * _1052;
    float _1056 = _1050;
    if (_764)
    {
        _968 = _1034;
    }
    float _1058 = _968;
    float _1060 = _1058;
    if (_764)
    {
        _1044 = _1038;
    }
    float _1062 = _1044;
    float _1064 = _1062;
    if (!_764)
    {
        float _1066 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1068 = _878 + _1066;
        float _1070 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1072 = _882 + _1070;
        float _1074 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1076 = -_568;
        float _1078 = _1076 + _1026;
        float _1080 = _1068 * _1068;
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1084 = _892 + _1082;
        float _1086 = -_550;
        float _1088 = _1086 + _1028;
        float _1090 = -_584;
        float _1092 = _1090 + _1030;
        float _1094 = fma(_1072, _1072, _1080);
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1098 = fma(_1084, _1084, _1094);
        float _1100 = sqrt(_1098);
        float _1102 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1104 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1096;
        float _1108 = _1102 * _1106;
        float _1110 = fma(_1078, _1108, _882);
        float _1112 = fma(_1088, _1108, _878);
        float _1114 = fma(_1092, _1108, _892);
        _1064 = _1112;
        _1060 = _1110;
        _1046 = _1114;
        _1048 = _1092;
    }
    float _1116 = _1064;
    float _1118 = _1060;
    float _1120 = _1046;
    float _1122 = _1048;
    if (!_784)
    {
        float _1124 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1126 = _1124 * 0.15915493667125701904296875;
        float _1128 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1130 = _1126 * 6.283185482025146484375;
        float _1132 = cos(_1130);
        float _1134 = _1128 * 0.15915493667125701904296875;
        float _1136 = _1126 * 6.283185482025146484375;
        float _1138 = sin(_1136);
        float _1140 = 1.0 / _1132;
        float _1142 = _1134 * 6.283185482025146484375;
        float _1144 = cos(_1142);
        float _1146 = _1138 * _1140;
        float _1148 = _1134 * 6.283185482025146484375;
        float _1150 = sin(_1148);
        float _1152 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1154 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1152;
        float _1156 = _1144 * _1146;
        float _1158 = 1.0 / _1154;
        float _1160 = 1.0 / _1156;
        float _1162 = _1150 * _1160;
        float _1164 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1166 = fma(_1054, _1162, _1164);
        float _1168 = _1166 * _1158;
        float _1170 = precise::clamp(_1168, 0.0, 1.0);
        _1056 = _1170;
    }
    float _1172 = _1056;
    float _1174 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1176 = _1116 + _1174;
    float _1178 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1180 = _1118 + _1178;
    float _1182 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1184 = _1120 + _1182;
    float _1186 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1188 = _1176 * _1176;
    float _1190 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1192 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1186);
    float _1194 = fma(_1180, _1180, _1188);
    float _1196 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1190);
    float _1198 = fma(_1184, _1184, _1194);
    float _1200 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1196);
    float _1202 = rsqrt(_1198);
    float _1204 = _1200 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1206 = sqrt(_1198);
    float _1208 = _1202 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1210 = _1180 * _1208;
    float _1212 = _1184 * _1208;
    float _1214 = _1210 * _1210;
    float _1216 = _1212 * _1212;
    float _1218 = _1214 + _1216;
    float _1220 = sqrt(_1218);
    bool _1222 = _1220 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1224 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1226 = _1220 + _1224;
    float _1228 = _1188;
    float _1230 = _1218;
    float _1232 = _1226;
    float _1234 = _1210;
    float _1236 = _1212;
    float _1238 = _1214;
    if (_1222)
    {
        float _1240 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1228 = _1240;
    }
    float _1242 = _1228;
    if (_1222)
    {
        float _1244 = rsqrt(_1218);
        _1230 = _1244;
    }
    float _1246 = _1230;
    float _1248 = _1246;
    if (_1222)
    {
        float _1250 = _1226 * _1242;
        _1232 = _1250;
    }
    float _1252 = _1232;
    if (_1222)
    {
        float _1254 = _1252 * 0.15915493667125701904296875;
        _970 = _1254;
    }
    float _1256 = _970;
    float _1258 = _1242;
    if (_1222)
    {
        float _1260 = _1256 * 6.283185482025146484375;
        float _1262 = sin(_1260);
        _1258 = _1262;
    }
    float _1264 = _1258;
    float _1266 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1268 = precise::max(0.0, _1266);
    float _1270 = _1122;
    if (_1222)
    {
        float _1272 = _1256 * 6.283185482025146484375;
        float _1274 = cos(_1272);
        _1270 = _1274;
    }
    float _1276 = _1270;
    float _1278 = -_1208;
    float _1280 = -_1268;
    float _1282 = fma(_1176, _1278, _1280);
    if (_1222)
    {
        float _1284 = _1282 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _988 = _1284;
    }
    float _1286 = _988;
    float _1288 = fma(_882, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1290 = _1264;
    float _1292 = _1286;
    if (_1222)
    {
        float _1294 = fma(_1264, _1286, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _972 = _1294;
    }
    float _1296 = _972;
    float _1298 = _1296;
    if (!_1222)
    {
        _1290 = _1282;
    }
    float _1300 = _1290;
    float _1302 = floor(_1288);
    float _1304 = _1300;
    float _1306 = _1276;
    if (_1222)
    {
        float _1308 = _1276 + (-1.0);
        _1292 = _1308;
    }
    float _1310 = _1292;
    if (_1222)
    {
        float _1312 = _1246 * _1296;
        _1298 = _1312;
    }
    float _1314 = _1298;
    if (_1222)
    {
        float _1316 = _1310 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1248 = _1316;
    }
    float _1318 = _1248;
    if (_1222)
    {
        float _1320 = _1210 * _1314;
        _1234 = _1320;
    }
    float _1322 = _1234;
    if (_1222)
    {
        float _1324 = _1212 * _1314;
        _1236 = _1324;
    }
    float _1326 = _1236;
    if (_1222)
    {
        float _1328 = fma(_1282, _1276, _1318);
        _1304 = _1328;
    }
    float _1330 = _1304;
    if (_1222)
    {
        float _1332 = _1322 * _1322;
        _1238 = _1332;
    }
    float _1334 = _1238;
    if (!_1222)
    {
        _1306 = _1216;
    }
    float _1336 = _1306;
    float _1338 = _1336;
    if (_1222)
    {
        float _1340 = _1326 * _1326;
        _1338 = _1340;
    }
    float _1342 = _1338;
    float _1344 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1346 = fma(_1330, _1330, _1334);
    float _1348 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1344);
    float _1350 = _1346 + _1342;
    float _1352 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1354 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1356 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1348);
    float _1358 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1192);
    float _1360 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1362 = fma(_1206, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1360);
    float _1364 = precise::clamp(_1362, 0.0, 1.0);
    float _1366 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1354);
    float _1368 = _1356 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1370 = rsqrt(_1350);
    float _1372 = _1358 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1374 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1366);
    float _1376 = -_1364;
    float _1378 = _1376 + 1.0;
    float _1380 = _1372 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1382 = _1374 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1384 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1386 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1388 = abs(_1378);
    float _1390 = log2(_1388);
    float _1392 = -_1380;
    float _1394 = fma(_1392, _1352, 1.0);
    float _1396 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1384);
    float _1398 = fma(_892, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1400 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1396);
    float _1402 = _1370 * _1322;
    float _1404 = _1370 * _1330;
    float _1406 = floor(_1398);
    float _1408 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1400);
    float _1410 = _1402 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1412 = _1370 * _1326;
    float _1414 = -_1302;
    float _1416 = _1288 + _1414;
    float _1418 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1420 = -_1410;
    float _1422 = fma(_1404, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1420);
    float _1424 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1426 = 1.0 / _1408;
    float _1428 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1418);
    float _1430 = -_1412;
    float _1432 = fma(_1430, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1422);
    float _1434 = _1404 + 1.0;
    float _1436 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1428);
    float _1438 = fma(_1432, -0.5, 0.5);
    float _1440 = fma(_1432, 0.5, 0.5);
    float _1442 = log2(_1394);
    float _1444 = -_1406;
    float _1446 = _1398 + _1444;
    float _1448 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1386);
    float _1450 = fma(_1440, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1452 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1436);
    float _1454 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1448);
    float _1456 = fma(_1440, _1450, -0.212114393711090087890625);
    float _1458 = exp2(_1424);
    float _1460 = _1452 * _1426;
    float _1462 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1454);
    float _1464 = fma(_1440, _1456, 1.570728778839111328125);
    float _1466 = _1462 * _1426;
    float _1468 = sqrt(_1438);
    float _1470 = _1442 * 0.693147182464599609375;
    float _1472 = fma(_1466, -0.5, 0.5);
    float _1474 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1476 = -_1404;
    float _1478 = fma(_1458, _1434, _1476);
    float2 _4940 = float2(_1416, _1446);
    float _1480 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4940, float2(0.0), isnan(_4940)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4940, float2(0.0), isnan(_4940)), level(0.0)).x;
    float _1482 = fma(_1478, 0.5, 0.5);
    float _1484 = _1468 * 0.636619746685028076171875;
    float _1486 = fma(_1460, 0.5, 0.5);
    float _1488 = -_1464;
    float _1490 = fma(_1484, _1488, 1.0);
    float3 _4963 = float3(_1486, _1472, _1474);
    float _1492 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4963, float3(0.0), isnan(_4963)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4963, float3(0.0), isnan(_4963)), level(0.0)).x;
    float3 _4974 = float3(_1486, _1472, _1474);
    float4 _1495 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4974, float3(0.0), isnan(_4974)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4974, float3(0.0), isnan(_4974)), level(0.0)).xyzw;
    float _1497 = _1495.x;
    float _1499 = _1495.y;
    float _1501 = _1495.z;
    float _1503 = _1495.w;
    float2 _4990 = float2(_1490, _1482);
    float3 _1507 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4990, float2(0.0), isnan(_4990)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4990, float2(0.0), isnan(_4990)), level(0.0)).xyz;
    float _1509 = _1507.x;
    float _1511 = _1507.y;
    float _1513 = _1507.z;
    float _1515 = float(uint(_374));
    float _1517 = trunc(_508);
    int _1519 = int(_1517);
    bool _1521 = _374 == 0;
    float _1523 = _416 * _166;
    int _1525 = abs(_572);
    out.m_65.x = _882;
    out.m_65.y = _878;
    out.m_65.z = _892;
    int _1527 = abs(_582);
    float _1529 = _1390 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1531 = 1.0 / _1515;
    out.m_67.w = _704;
    out.m_69.x = _802;
    float _1533 = float(uint(_1519));
    float _1535 = trunc(_1523);
    int _1537 = int(_1535);
    int _1539 = ~_374;
    int _1541 = _1539 + 1;
    float _1543 = _842 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_71.x = _1118;
    out.m_71.y = _1116;
    out.m_71.z = _1120;
    float _1545 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1543);
    int _1547 = as_type<int>(_1531) + (-2);
    float _1549 = abs(_1054);
    float _1551 = log2(_1549);
    float _1553 = as_type<float>(_1547) * _1533;
    int _1555 = ~_374;
    int _1557 = _1555 + 1;
    float _1559 = exp2(_1529);
    bool _1561 = _1054 <= 8000.0;
    bool _1563 = isnan(_1054);
    bool _1565 = _1561 || _1563;
    bool _1567 = isnan(8000.0);
    bool _1569 = _1565 || _1567;
    float _1571 = float(_1569);
    float _1573 = trunc(_1553);
    float _1575 = precise::max(_1573, 0.0);
    uint _1578 = uint(_1575);
    float _1580 = _1551 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1582 = exp2(_1580);
    float _1584 = -_1559;
    float _1586 = _1584 + 1.0;
    float _1588 = _1586 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _1590 = _1541 * int(_1578);
    int _1592 = _1590 + _1519;
    float _1594 = float(uint(_1592));
    float _1596 = as_type<float>(_1547) * _1594;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1600 = _1598 != 0;
    float _1602 = trunc(_1596);
    float _1604 = precise::max(_1602, 0.0);
    uint _1606 = uint(_1604);
    bool _1608 = !_1600;
    float _1610 = _1608 ? 7.345489978790283203125 : 1.0;
    float _1612 = _1610 * _328;
    float _1614 = float(_1519);
    float _1616 = floor(_1612);
    bool _1618 = _1614 >= _402;
    bool _1620 = isnan(_1614);
    bool _1622 = _1618 || _1620;
    bool _1624 = isnan(_402);
    bool _1626 = _1622 || _1624;
    float _1628 = float(_1626);
    int _1630 = int(_1578) + int(_1606);
    float _1632 = trunc(_1628);
    int _1634 = int(_1632);
    int _1636 = _1557 * _1630;
    int _1638 = _1636 + _1519;
    bool _1640 = uint(_1638) >= uint(_374);
    float _1642 = -_1616;
    float _1644 = _1612 + _1642;
    bool _1646 = !_1640;
    int _1648 = _1646 ? 0 : (-1);
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1652 = _1650 != 0;
    int _1654 = ~_1630;
    int _1656 = _1654 + _1648;
    int _1658 = _1656 + 1;
    float _1660 = _1644 * _402;
    bool _1662 = !_1652;
    int _1664 = _1662 ? 0 : 1;
    int _1666 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1668 = _1666 != 0;
    int _1670 = _374 * _1658;
    int _1672 = _1670 + _1519;
    int _1674 = ~_1634;
    int _1676 = _1674 + 1;
    int _1678 = _1676 + 1;
    float _1680 = trunc(_1660);
    int _1682 = int(_1680);
    int _1684 = abs(_1664);
    bool _1686 = !_1521;
    int _1688 = _1686 ? _1672 : (-1);
    int _1690 = _374 + (-1);
    int _1692 = _1688 * _1678;
    int _1694 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1696 = _1694 != 0;
    int _1698 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1700 = _1698 != 0;
    int _1702 = _1634 * _1690;
    int _1704 = _1702 + _1692;
    float _1706 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1708 = _1706 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1710 = !_1668;
    int _1712 = _1710 ? 0 : 1;
    int _1714 = _1682 * _1684;
    int _1716 = _1714 + _1519;
    int _1718 = abs(_588);
    int _1720 = _1704 * _1525;
    float _1722 = 1.0 / _1708;
    int _1724 = abs(_1712);
    float _1726 = as_type<float>(_1527);
    float _1728 = _1408;
    float _1730 = _1462;
    if (_1696)
    {
        float _1732 = in.m_55.x;
        _1726 = _1732;
    }
    float _1734 = _1726;
    int _1736 = _1537 * _1527;
    int _1738 = _1736 + _1720;
    int _1740 = _1716 * _1718;
    int _1742 = _1740 + _1738;
    float _1744 = in.m_73.x;
    int _1746 = ~_374;
    int _1748 = _1746 + 1;
    int _1750 = _1682 * _1724;
    int _1752 = _1750 + _1742;
    bool _1754 = _330 > 0.5;
    float _1756 = in.m_73.y;
    float _1758 = float(uint(_1752));
    int _1760 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1762 = _1760 != 0;
    float _1764 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1766 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1764;
    float _1768 = float(uint(_1716));
    float _1770 = as_type<float>(_1547) * _1758;
    float _1772 = _1766 * _1722;
    float _1774 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1776 = _326 + _1774;
    float _1778 = trunc(_1770);
    float _1780 = precise::max(_1778, 0.0);
    uint _1782 = uint(_1780);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1784 = fma(_1772, _1776, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1786 = -_1756;
    float _1788 = _1786 + 1.0;
    float _1790 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1792 = _1790 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1794 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1796 = isnan(_326);
    bool _1798 = _1794 || _1796;
    bool _1800 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1802 = _1798 || _1800;
    float _1804 = float(_1802);
    int _1806 = _1748 * int(_1782);
    int _1808 = _1806 + _1752;
    float _1810 = _1756;
    float _1812 = _1734;
    float _1814 = _1744;
    if (_1700)
    {
        float _1816 = _1754 ? _1788 : _1756;
        _1810 = _1816;
    }
    float _1818 = _1810;
    float _1820 = 1.0 / _1792;
    bool _1822 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1824 = isnan(_326);
    bool _1826 = _1822 || _1824;
    bool _1828 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1830 = _1826 || _1828;
    float _1832 = float(_1830);
    float _1834 = -_1804;
    float _1836 = _1834 + 1.0;
    float _1838 = float(uint(_1808));
    float _1840 = fma(_1818, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    bool _1842 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1844 = isnan(_326);
    bool _1846 = _1842 || _1844;
    bool _1848 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1850 = _1846 || _1848;
    float _1852 = float(_1850);
    float _1854 = -_1832;
    float _1856 = _1854 + 1.0;
    bool _1858 = _1734 > 0.5;
    bool _1860 = _1858 && _1696;
    float _1862 = as_type<float>(_1547) * _1838;
    if (_1696)
    {
        _1812 = _1744;
    }
    float _1864 = _1812;
    float _1866 = _1804 * _1856;
    float _1868 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1870 = _1868 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1872 = trunc(_1862);
    float _1874 = precise::max(_1872, 0.0);
    uint _1876 = uint(_1874);
    float _1878 = _1852 * _1836;
    float _1880 = -_1852;
    float _1882 = _1880 + 1.0;
    float _1884 = as_type<float>(_1547) * _1768;
    float _1886 = _1870 * _1820;
    float _1888 = _1784 * _1878;
    float _1890 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1892 = _326 + _1890;
    float _1894 = -_506;
    float _1896 = fma(_516, _1840, _1894);
    float _1898 = _1864;
    if (_1860)
    {
        float _1900 = -_1864;
        float _1902 = _1900 + 1.0;
        _1898 = _1902;
    }
    float _1904 = _1898;
    float _1906 = fma(_1882, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1888);
    float _1908 = fma(_1886, _1892, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1910 = ~_374;
    int _1912 = _1910 + 1;
    float _1914 = trunc(_1884);
    float _1916 = precise::max(_1914, 0.0);
    uint _1918 = uint(_1916);
    int _1920 = ~_374;
    int _1922 = _1920 + 1;
    float _1924 = fma(_1908, _1866, _1906);
    bool _1926 = _768 != 0.0;
    bool _1928 = isnan(_768);
    bool _1930 = _1926 || _1928;
    bool _1932 = isnan(0.0);
    bool _1934 = _1930 || _1932;
    int _1936 = int(_1782) + int(_1876);
    float _1938 = fma(_1832, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1924);
    float _1940 = in.m_77.x;
    float _1942 = in.m_77.y;
    float _1944 = in.m_77.z;
    int _1946 = _1912 * _1936;
    int _1948 = _1946 + _1752;
    bool _1950 = _766 == 0.0;
    bool _1952 = !_1934;
    bool _1954 = _1950 && _1952;
    if (_1696)
    {
        _1814 = _1904;
    }
    float _1956 = _1814;
    int _1958 = _1922 * int(_1918);
    int _1960 = _1958 + _1716;
    bool _1962 = _770 == 0.0;
    bool _1964 = _1962 && _1954;
    bool _1966 = uint(_1948) >= uint(_374);
    float _1968 = fma(_1956, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1970 = !_1966;
    int _1972 = _1970 ? 0 : (-1);
    float _1974 = fma(_504, _1968, _420);
    float _1976 = float(uint(_1960));
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1980 = ~_1936;
    int _1982 = _1980 + _1972;
    int _1984 = _1982 + 1;
    float _1986 = _1974 + 0.5;
    float _1988 = as_type<float>(_1547) * _1976;
    float _1990 = _1896 + 0.5;
    float _1992 = _1938 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1994 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1996 = _1940;
    float _1998 = _1942;
    float _2000 = _1944;
    if (!_1964)
    {
        float _2002 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1940);
        _1996 = _2002;
    }
    float _2004 = _1996;
    int _2006 = _374 * _1984;
    int _2008 = _2006 + _1752;
    float _2010 = trunc(_1988);
    float _2012 = precise::max(_2010, 0.0);
    uint _2014 = uint(_2012);
    float _2016 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2018 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2020 = _1994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2022 = !_1521;
    int _2024 = _2022 ? _2008 : (-1);
    float _2026 = _2016 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    if (!_1964)
    {
        float _2028 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1942);
        _1998 = _2028;
    }
    float _2030 = _1998;
    int _2032 = ~_374;
    int _2034 = _2032 + 1;
    if (!_1964)
    {
        float _2036 = fma(_770, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1944);
        _2000 = _2036;
    }
    float _2038 = _2000;
    int _2040 = _2024 >> 31;
    float _2042 = _832 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2044 = _832 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    out.m_79.x = _2018;
    out.m_79.y = _2026;
    out.m_79.z = _2020;
    out.m_79.w = _1992;
    int _2046 = _2040 & 3;
    float _2048 = -_820;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2042);
    float _2052 = _832 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2054 = int(_1918) + int(_2014);
    out.m_81.x = _1986;
    out.m_81.y = _1990;
    int _2056 = _2024 + _2046;
    float _2058 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1545);
    int _2060 = _2024 & 3;
    bool _2062 = _2060 != 0;
    float _2064 = _852 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2066 = _2056 >> 2;
    int _2068 = _2024 & 3;
    bool _2070 = _2068 != 0;
    float _2072 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2064);
    int _2074 = _2034 * _2054;
    int _2076 = _2074 + _1716;
    float _2078 = -_820;
    float _2080 = fma(_2078, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2044);
    int _2082 = _2066 << 4;
    int _2084 = _2082 + 368;
    float _2086 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2050);
    float _2088 = -_820;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2052);
    float _2092 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2080);
    uint _2094 = uint(int(uint(_2084) >> uint(2)));
    uint _2096 = uint(int(uint(int(_2094)) >> uint(2)));
    int _2098 = int(_2094) & 3;
    float _2100 = (*spvDescriptorSet0.vp_c9)._m0[int(_2096)][_2098];
    int _2102 = int(_2094) + 1;
    uint _2104 = uint(int(uint(_2102) >> uint(2)));
    int _2106 = _2102 & 3;
    float _2108 = (*spvDescriptorSet0.vp_c9)._m0[int(_2104)][_2106];
    bool _2110 = uint(_2076) >= uint(_374);
    float _2112 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2090);
    float _2114 = _2092 * _2030;
    float _2116 = _2086 * _2030;
    float _2118 = _842 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2120 = _2112 * _2030;
    bool _2122 = !_2110;
    int _2124 = _2122 ? 0 : (-1);
    int _2126 = _2084 + 8;
    uint _2128 = uint(int(uint(_2126) >> uint(2)));
    uint _2130 = uint(int(uint(int(_2128)) >> uint(2)));
    int _2132 = int(_2128) & 3;
    float _2134 = (*spvDescriptorSet0.vp_c9)._m0[int(_2130)][_2132];
    int _2136 = int(_2128) + 1;
    uint _2138 = uint(int(uint(_2136) >> uint(2)));
    int _2140 = _2136 & 3;
    float _2142 = (*spvDescriptorSet0.vp_c9)._m0[int(_2138)][_2140];
    bool _2144 = uint(_2060) > 1u;
    float _2146 = fma(_2058, _2004, _2114);
    int _2148 = ~_2054;
    int _2150 = _2148 + _2124;
    int _2152 = _2150 + 1;
    float _2154 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2118);
    int _2156 = _2070 ? 0 : 1;
    float _2158 = _842 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2160 = uint(_2060) >= 2u;
    float _2162 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2154);
    int _2164 = ~_2156;
    int _2166 = _2164 + 1;
    int _2168 = _2166 + 1;
    float _2170 = _852 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    bool _2172 = !_2062;
    int _2174 = _2172 ? 0 : 1;
    float _2176 = fma(_2162, _2004, _2116);
    bool _2178 = _2060 != 3;
    float _2180 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2158);
    int _2182 = _2168;
    if (!_2144)
    {
        int _2184 = ~_2156;
        int _2186 = _2184 + 1;
        _2182 = _2186;
    }
    int _2188 = _2182;
    float _2190 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2170);
    bool _2192 = _2060 != 3;
    float _2194 = fma(_848, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2180);
    int _2196 = abs(_2188);
    float _2198 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2190);
    int _2200 = _2160 ? 0 : 1;
    float _2202 = fma(_2194, _2004, _2120);
    int _2204 = abs(_2174);
    float _2206 = fma(_2198, _2038, _2146);
    int _2208 = ~_2200;
    int _2210 = _2208 + 1;
    int _2212 = _2210 + 1;
    int _2214 = _374 * _2152;
    int _2216 = _2214 + _1716;
    int _2218 = ~_2196;
    int _2220 = _2218 + 1;
    int _2222 = _2220 + 1;
    float _2224 = _852 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2226 = !_2178;
    int _2228 = _2226 ? 0 : (-1);
    float _2230 = _1588 * _1492;
    int _2232 = _2212;
    if (_2192)
    {
        int _2234 = ~_2200;
        int _2236 = _2234 + 1;
        _2232 = _2236;
    }
    int _2238 = _2232;
    float _2240 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2224);
    float _2242 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2072);
    int _2244 = abs(_2238);
    float _2246 = fma(_860, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2240);
    int _2248 = ~_2204;
    int _2250 = _2248 + 1;
    int _2252 = _2250 + 1;
    float _2254 = -_1480;
    float _2256 = _2254 + 1.0;
    int _2258 = abs(_2228);
    int _2260 = _2222 * as_type<int>(_2108);
    bool _2262 = !_1762;
    int _2264 = _2262 ? 0 : 1;
    int _2266 = _2252 * as_type<int>(_2100);
    int _2268 = _2266 + _2260;
    float _2270 = _1452 + _1408;
    int _2272 = abs(_2264);
    float _2274 = fma(_1582, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2276 = precise::clamp(_2274, 0.0, 1.0);
    bool _2278 = !_1521;
    int _2280 = _2278 ? _2216 : (-1);
    float _2282 = _1513 * _2230;
    int _2284 = ~_2244;
    int _2286 = _2284 + 1;
    int _2288 = _2286 + 1;
    float _2290 = fma(_2242, _2038, _2176);
    float _2292 = _1368 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2294 = ~_2258;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = _2288 * as_type<int>(_2134);
    int _2302 = _2300 + _2268;
    float _2304 = fma(_1382, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2292);
    int _2306 = ~_2272;
    int _2308 = _2306 + 1;
    int _2310 = _2308 + 1;
    int _2312 = _2298 * as_type<int>(_2142);
    int _2314 = _2312 + _2302;
    float _2316 = in.m_83.x;
    float _2318 = fma(_2276, -2.0, 3.0);
    float _2320 = _2276 * _2276;
    int _2322 = _2314 * _2310;
    float _2324 = fma(_1372, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2304);
    float _2326 = _1408 * 0.5;
    float _2328 = _2320 * _2318;
    int _2330 = _2280 * _2272;
    int _2332 = _2330 + _2322;
    float _2334 = fma(_1204, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2324);
    float _2336 = fma(_2246, _2038, _2202);
    float _2338 = -_2328;
    float _2340 = _2338 + 1.0;
    float _2342 = _2334 + _1408;
    out.gl_Position.x = _1452;
    out.gl_Position.y = _1462;
    out.gl_Position.z = _2334;
    out.gl_Position.w = _1408;
    float _2344 = fma(_2340, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2328);
    float _2346 = _2270 * 0.5;
    float _2348 = _2342 * 0.5;
    float _2350 = fma(_1462, -0.5, _2326);
    float _2352 = _1571 * _2344;
    float _2354 = float(_2332);
    out.m_85.x = _2206;
    out.m_85.y = _2290;
    out.m_85.z = _2336;
    float _2356 = _2352 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    bool _2358 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2360 = isnan(_1206);
    bool _2362 = _2358 || _2360;
    bool _2364 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2366 = _2362 || _2364;
    out.m_87.x = _2346;
    out.m_87.y = _2350;
    out.m_87.z = _2348;
    out.m_87.w = _1408;
    float _2368 = _1172 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2370 = _2256 * _2356;
    float _2372 = precise::clamp(_2370, 0.0, 1.0);
    float _2374 = _1503 * _2230;
    float _2376 = -_1588;
    float _2378 = _2376 + 1.0;
    out.m_89.x = _2354;
    float _2380 = -_2372;
    float _2382 = fma(_2380, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2384 = fma(_1509, _2374, _1497);
    float _2386 = fma(_1511, _2374, _1499);
    float _2388 = _1503 * _2378;
    float _2390 = fma(_1503, _2282, _1501);
    float _2392 = _2382 * _2316;
    float _2394 = (*spvDescriptorSet0.vp_c15)._m0[653].y;
    float _2396 = _2392;
    float _2398 = _2378;
    if (!_2366)
    {
        _2394 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2400 = _2394;
    float _2402 = _2400;
    float _2404 = _2400;
    if (!_2366)
    {
        _1728 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2406 = _1728;
    out.m_91.x = _2384;
    out.m_91.y = _2386;
    out.m_91.z = _2390;
    out.m_91.w = _2388;
    float _2408 = _2392 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2410 = _2408;
    float _2412 = _2406;
    float _2414 = _2406;
    if (!_2366)
    {
        _2396 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2416 = _2396;
    float _2418 = _2416;
    float _2420 = _2416;
    if (!_2366)
    {
        _2398 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2422 = _2398;
    out.m_93.x = _2408;
    float _2424 = _2422;
    float _2426 = _2422;
    if (!_2366)
    {
        _1730 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2428 = _1730;
    float _2430 = _2428;
    float _2432 = _2428;
    if (!_2366)
    {
        _2410 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2434 = _2410;
    bool _2436 = !_2366;
    float _2438 = _2434;
    float _2440 = _2434;
    if (!_2436)
    {
        bool _2442 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2444 = isnan(_1206);
        bool _2446 = _2442 || _2444;
        bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2450 = _2446 || _2448;
        if (!_2450)
        {
            float _2452 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2454 = _1206 + _2452;
            float _2456 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2458 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2456;
            float _2460 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2462 = _2460 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2464 = 1.0 / _2458;
            float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2468 = _2466 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2472 = _2470 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2474 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2476 = _2474 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2478 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2480 = _2478 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2482 = _2454 * _2464;
            float _2484 = precise::clamp(_2482, 0.0, 1.0);
            float _2486 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2488 = _2486 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2490 = fma(_2484, _2462, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2492 = fma(_2484, _2488, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2494 = fma(_2484, _2468, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2496 = fma(_2484, _2472, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2498 = fma(_2484, _2476, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2500 = fma(_2484, _2480, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2404 = _2494;
            _2432 = _2498;
            _2420 = _2490;
            _2426 = _2496;
            _2414 = _2492;
            _2440 = _2500;
            _2502 = true;
        }
        else
        {
            bool _2504 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2506 = isnan(_1206);
            bool _2508 = _2504 || _2506;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2512 = _2508 || _2510;
            if (!_2512)
            {
                _2418 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2514 = _2418;
            _2420 = _2514;
            if (!_2512)
            {
                _2402 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2516 = _2402;
            _2404 = _2516;
            if (!_2512)
            {
                _2412 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2518 = _2412;
            _2414 = _2518;
            if (!_2512)
            {
                _2424 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2520 = _2424;
            _2426 = _2520;
            if (!_2512)
            {
                _2430 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2522 = _2430;
            _2432 = _2522;
            if (!_2512)
            {
                _2438 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2524 = _2438;
            bool _2526 = !_2512;
            _2440 = _2524;
            if (!_2526)
            {
                bool _2528 = _1206 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2530 = isnan(_1206);
                bool _2532 = _2528 || _2530;
                bool _2534 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2536 = _2532 || _2534;
                if (!_2536)
                {
                    float _2538 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2540 = _1206 + _2538;
                    float _2542 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2544 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2542;
                    float _2546 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2550 = 1.0 / _2544;
                    float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2568 = _2540 * _2550;
                    float _2570 = precise::clamp(_2568, 0.0, 1.0);
                    float _2572 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2574 = _2572 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2576 = fma(_2570, _2548, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2578 = fma(_2570, _2574, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2580 = fma(_2570, _2554, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2582 = fma(_2570, _2558, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2584 = fma(_2570, _2562, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2586 = fma(_2570, _2566, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2404 = _2580;
                    _2432 = _2584;
                    _2420 = _2576;
                    _2426 = _2582;
                    _2414 = _2578;
                    _2440 = _2586;
                    _2502 = true;
                }
                else
                {
                    _2404 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2432 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2420 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2426 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2414 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2440 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2502 = false;
    float _2588 = _2404;
    float _2590 = _2432;
    float _2592 = _2420;
    float _2594 = _2426;
    float _2596 = _2414;
    float _2598 = _2440;
    float _2600 = _2368 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2602 = fma(_2290, -0.5, 0.5);
    float _2604 = precise::clamp(_2602, 0.0, 1.0);
    float _2606 = -_2588;
    float _2608 = _2606 + _2590;
    float _2610 = -_2592;
    float _2612 = _2610 + _2594;
    out.m_53.x = _2600;
    float _2614 = fma(_2604, _2608, _2588);
    float _2616 = -_2596;
    float _2618 = _2616 + _2598;
    float _2620 = fma(_2604, _2612, _2592);
    float _2622 = _2614 * 0.586610972881317138671875;
    bool _2624 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2626 = fma(_2604, _2618, _2596);
    out.m_95.x = 0.0;
    float _2628 = fma(_2620, 0.298911988735198974609375, _2622);
    bool _2630 = _1172 > 0.0;
    bool _2632 = isnan(_1172);
    bool _2634 = _2630 || _2632;
    bool _2636 = isnan(0.0);
    bool _2638 = _2634 || _2636;
    float _2640 = fma(_2626, 0.114477999508380889892578125, _2628);
    float _2642 = -_2640;
    float _2644 = _2620 + _2642;
    float _2646 = -_2640;
    float _2648 = _2614 + _2646;
    float _2650 = -_2640;
    float _2652 = _2626 + _2650;
    float _2654 = fma(_2644, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    float _2656 = fma(_2648, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    float _2658 = fma(_2652, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2640);
    bool _2660 = !_2624;
    if (!_2660)
    {
        float _2662 = -_1116;
        float _2664 = _2662 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2666 = -_1118;
        float _2668 = _2666 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2670 = -_1120;
        float _2672 = _2670 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2674 = _2664 * _2664;
        float _2676 = fma(_2668, _2668, _2674);
        float _2678 = fma(_2672, _2672, _2676);
        float _2680 = sqrt(_2678);
        float _2682 = rsqrt(_2678);
        float _2684 = -_2680;
        float _2686 = _2684 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2688 = _2686 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2690 = precise::clamp(_2688, 0.0, 1.0);
        float _2692 = _2668 * _2682;
        float _2694 = _2664 * _2682;
        float _2696 = abs(_2690);
        float _2698 = log2(_2696);
        float _2700 = _2672 * _2682;
        float _2702 = _2692 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2704 = _2290 * _2694;
        float _2706 = -_2694;
        float _2708 = -_2702;
        float _2710 = fma(_2706, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2708);
        float _2712 = fma(_2206, _2692, _2704);
        float _2714 = -_2700;
        float _2716 = fma(_2714, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2710);
        float _2718 = fma(_2336, _2700, _2712);
        float _2720 = precise::clamp(_2718, 0.0, 1.0);
        float _2722 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2724 = _2716 + _2722;
        float _2726 = _2698 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2728 = _2724 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2730 = precise::clamp(_2728, 0.0, 1.0);
        float _2732 = exp2(_2726);
        float _2734 = _2732 * _2730;
        float _2736 = _2720 * _2734;
        float _2738 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2740 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2742 = _2736 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2738;
        out.m_95.y = _2740;
        out.m_95.z = _2742;
    }
    out.m_67.x = _2654;
    out.m_67.y = _2656;
    out.m_67.z = _2658;
    if (_2638)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2744 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2744;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

