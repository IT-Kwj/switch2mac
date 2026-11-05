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
    float4 m_81 [[user(locn1)]];
    float4 m_75 [[user(locn2)]];
    float4 m_71 [[user(locn3)]];
    float4 m_95 [[user(locn4)]];
    float4 m_91 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_79 [[user(locn8)]];
    float4 m_69 [[user(locn9)]];
    float4 m_67 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_65 [[user(locn13)]];
    float4 m_89 [[user(locn14)]];
    float4 m_83 [[user(locn15)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_85 [[attribute(0)]];
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2580 = false;
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
    float _128 = _111;
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
        float _2896 = as_type<float>(_138);
        out.gl_Position.z = _2896;
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
        float _2951 = as_type<float>(_164);
        out.gl_Position.z = _2951;
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
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _232 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
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
    out.m_57.y = _232;
    out.m_57.z = _228;
    out.m_57.w = _230;
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
    float _302 = _296 * _266;
    float _304 = _298 * _268;
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
    float _336 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _338 = in.m_46.x;
    float _340 = in.m_46.y;
    float _342 = in.m_46.z;
    float _344 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _348 = in.m_55.z;
    float _350 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _352 = int(_350);
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _356 = _336 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _358 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _334 * _120;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _374 = int(_372);
    float _376 = _328 * 2.0;
    float _378 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _380 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _382 = _330 + _328;
    float _384 = exp2(_370);
    float _386 = -_346;
    float _388 = fma(_378, 2.0, _386);
    float _390 = fma(_380, -2.0, _354);
    float _392 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = _330 * 2.0;
    float _400 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _402 = floor(_376);
    float _404 = _382 + (-1.0);
    float _406 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _408 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _410 = _330 + _348;
    float _412 = _348 * 2.0;
    float _414 = float(_352);
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _418 = _410 + (-1.0);
    float _420 = floor(_398);
    float _422 = -_384;
    float _424 = _422 + 1.0;
    float _426 = float(_374);
    float _428 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _390);
    float _430 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _432 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _406);
    float _434 = _368 ? _424 : 0.0;
    float _436 = _426 * _120;
    bool _438 = _402 > 0.0;
    float _440 = floor(_412);
    bool _442 = _402 >= 0.0;
    bool _444 = isnan(_402);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = 1.0 / _414;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _462 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _464 = isnan(1.0);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _470 = _466 || _468;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _474 = _420 > 0.0;
    float _476 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _460);
    int _478 = _450 ? 0 : 1;
    float _480 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _472);
    float _482 = 1.0 / _456;
    bool _484 = _420 >= 0.0;
    bool _486 = isnan(_420);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    float _494 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _476);
    bool _496 = _440 > 0.0;
    float _498 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _480);
    bool _500 = _440 >= 0.0;
    bool _502 = isnan(_440);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = -_120;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[76].x, _388);
    int _514 = _492 ? 0 : 1;
    float _516 = _458 * _120;
    int _518 = ~_478;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = _430 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _526 = _522;
    float _528 = _326;
    if (!_438)
    {
        int _530 = ~_478;
        int _532 = _530 + 1;
        _526 = _532;
    }
    int _534 = _526;
    float _536 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _408);
    float _538 = _432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _540 = _508 ? 0 : 1;
    if (_470)
    {
        float _542 = _434 * _482;
        _130 = _542;
    }
    float _544 = _130;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _556 = _554 != 0;
    float _558 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _560 = ~_514;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    int _566 = _564;
    if (!_474)
    {
        int _568 = ~_514;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    bool _574 = !_552;
    int _576 = _574 ? 0 : 1;
    float _578 = in.m_61.x;
    float _580 = in.m_61.y;
    float _582 = in.m_61.z;
    bool _584 = !_548;
    int _586 = _584 ? 0 : 1;
    bool _588 = !_556;
    int _590 = _588 ? 0 : 1;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _602 = _600 != 0;
    float _604 = float(_534);
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _558 + _606;
    int _610 = ~_540;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    bool _616 = !_594;
    int _618 = _616 ? 0 : 1;
    bool _620 = !_598;
    int _622 = _620 ? 0 : 1;
    int _624 = abs(_618);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _628 = _538 + _626;
    int _630 = abs(_622);
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _634 = _524 + _632;
    int _636 = _614;
    if (!_496)
    {
        int _638 = ~_540;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    float _644 = _628 * _628;
    float _646 = float(_630);
    float _648 = fma(_634, _634, _644);
    float _650 = float(_642);
    float _652 = _646 * _604;
    float _654 = float(_624);
    float _656 = fma(_608, _608, _648);
    bool _658 = !_602;
    int _660 = _658 ? 0 : 1;
    float _662 = _652 * (-2.0);
    float _664 = _330 + (-0.5);
    float _666 = sqrt(_656);
    float _668 = _654 * _650;
    float _670 = fma(_662, _580, _580);
    int _672 = abs(_660);
    float _674 = fma(_452, _662, _452);
    float _676 = float(_572);
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _670);
    float _680 = _348 + _328;
    float _682 = rsqrt(_656);
    float _684 = float(_672);
    float _686 = _668 * (-2.0);
    float _688 = _680 + (-1.0);
    float _690 = _348 + (-0.5);
    float _692 = fma(_674, _544, _678);
    float _694 = _684 * _676;
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _698 = _666 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _700 = _328 + (-0.5);
    float _702 = fma(_686, _578, _578);
    float _704 = _694 * (-2.0);
    float _706 = fma(_416, _686, _416);
    float _708 = precise::min(_356, _698);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _702);
    float _712 = fma(_696, _704, _696);
    float _714 = fma(_704, _582, _582);
    float _716 = _692 * 0.15915493667125701904296875;
    float _718 = _682 * _708;
    float _720 = fma(_706, _544, _710);
    float _722 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _724 = _716 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = _628 * _718;
    float _730 = _634 * _718;
    float _732 = _608 * _718;
    float _734 = fma(_712, _544, _722);
    float _736 = -_728;
    float _738 = _628 + _736;
    float _740 = -_730;
    float _742 = _634 + _740;
    float _744 = -_732;
    float _746 = _608 + _744;
    float _748 = _716 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = _738 * _738;
    float _754 = _720 * 0.15915493667125701904296875;
    float _756 = fma(_742, _742, _752);
    bool _758 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _760 = isnan(0.5);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _766 = _762 || _764;
    float _768 = _754 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = fma(_746, _746, _756);
    float _774 = _734 * 0.15915493667125701904296875;
    float _776 = in.m_63.x;
    float _778 = in.m_63.y;
    float _780 = in.m_63.z;
    bool _782 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _784 = isnan(0.5);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _790 = _786 || _788;
    float _792 = sqrt(_772);
    float _794 = _754 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _770 * _726;
    float _800 = _770 * _750;
    float _802 = _774 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _682 * _792;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _810 = _344 * _806;
    float _812 = _336 * _806;
    float _814 = _358 * _806;
    float _816 = _774 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _796 * _750;
    float _822 = _796 * _726;
    float _824 = _810 * _808;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _828 = _770 * _804;
    float _830 = _750 * _804;
    float _832 = _796 * _804;
    float _834 = _726 * _804;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _838 = _814 * _826;
    float _840 = _828 * _824;
    float _842 = _812 * _836;
    float _844 = fma(_818, _820, _798);
    float _846 = _832 * _824;
    float _848 = -_822;
    float _850 = fma(_818, _800, _848);
    float _852 = -_800;
    float _854 = fma(_818, _822, _852);
    float _856 = -_824;
    float _858 = _818 * _856;
    float _860 = fma(_844, _842, _846);
    float _862 = fma(_818, _798, _820);
    float _864 = fma(_850, _842, _840);
    float _866 = fma(_830, _842, _858);
    float _868 = fma(_854, _838, _860);
    float _870 = -_732;
    float _872 = _558 + _870;
    float _874 = fma(_862, _838, _864);
    float _876 = fma(_834, _838, _866);
    float _878 = _868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _880 = _868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _882 = -_728;
    float _884 = _538 + _882;
    float _886 = -_730;
    float _888 = _524 + _886;
    float _890 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].x, _878);
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _880);
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _896 = _868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _902 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _894);
    float _904 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _910 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[11].z, _902);
    float _912 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _904);
    float _914 = _558 + _906;
    float _916 = _524 + _908;
    float _918 = _910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _920 = _884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _916 + _926;
    float _930 = 1.0 / _918;
    float _932 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _920);
    float _934 = _924 * _924;
    float _936 = _912 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _938 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[10].z, _932);
    float _940 = fma(_928, _928, _934);
    float _942 = _538 + _936;
    float _944 = _938 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _946 = sqrt(_940);
    float _948 = _944 + _918;
    float _950 = _948 * _930;
    float _952 = _950 * 0.5;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _956 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _954);
    float _958 = 1.0 / _956;
    bool _960 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _962 = _876;
    float _964 = _936;
    float _966 = _912;
    float _968 = _956;
    float _970 = _946;
    float _972 = _732;
    float _974 = _728;
    float _976 = _930;
    float _978 = _916;
    if (!_960)
    {
        _962 = _916;
    }
    float _980 = _962;
    float _982 = _980;
    if (!_960)
    {
        _964 = _914;
    }
    float _984 = _964;
    float _986 = _984;
    if (!_960)
    {
        _966 = _942;
    }
    float _988 = _966;
    bool _990 = !_960;
    float _992 = _988;
    if (!_990)
    {
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _998 = _946 + _996;
        float _1000 = _942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = rsqrt(_940);
        float _1004 = _998 * _994;
        float _1006 = _1004 * 0.15915493667125701904296875;
        float _1008 = _1006 * 6.283185482025146484375;
        float _1010 = cos(_1008);
        float _1012 = _1006 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        float _1016 = _1010 + (-1.0);
        float _1018 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = fma(_1014, _1000, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1022 = fma(_942, _1010, _1018);
        float _1024 = _1002 * _1020;
        float _1026 = fma(_928, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1028 = fma(_924, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1026;
        _992 = _1022;
        _986 = _1028;
        _968 = _1000;
        _970 = _1006;
    }
    float _1030 = _982;
    float _1032 = _992;
    float _1034 = _986;
    float _1036 = _968;
    float _1038 = _970;
    float _1040 = -_730;
    float _1042 = _1040 + _1030;
    float _1044 = -_728;
    float _1046 = _1044 + _1032;
    float _1048 = -_732;
    float _1050 = _1048 + _1034;
    float _1052 = _1042;
    float _1054 = _1046;
    float _1056 = _1038;
    float _1058 = _1032;
    float _1060 = _1036;
    if (_790)
    {
        _972 = 1.0;
    }
    float _1062 = _972;
    float _1064 = _1062;
    if (_766)
    {
        _974 = _1042;
    }
    float _1066 = _974;
    float _1068 = _1066;
    if (_766)
    {
        _1052 = _1046;
    }
    float _1070 = _1052;
    float _1072 = _1070;
    if (_766)
    {
        _1054 = _1050;
    }
    float _1074 = _1054;
    float _1076 = _1074;
    if (!_766)
    {
        float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1080 = _884 + _1078;
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1084 = _888 + _1082;
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1088 = _1080 * _1080;
        float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1092 = _872 + _1090;
        float _1094 = fma(_1084, _1084, _1088);
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1098 = fma(_1092, _1092, _1094);
        float _1100 = sqrt(_1098);
        float _1102 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1104 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1096;
        float _1108 = -_524;
        float _1110 = _1108 + _1030;
        float _1112 = -_538;
        float _1114 = _1112 + _1032;
        float _1116 = -_558;
        float _1118 = _1116 + _1034;
        float _1120 = _1102 * _1106;
        float _1122 = fma(_1110, _1120, _888);
        float _1124 = fma(_1114, _1120, _884);
        float _1126 = fma(_1118, _1120, _872);
        _1072 = _1124;
        _1068 = _1122;
        _1076 = _1126;
        _1056 = _1096;
    }
    float _1128 = _1072;
    float _1130 = _1068;
    float _1132 = _1076;
    float _1134 = _1056;
    float _1136 = _1134;
    if (_790)
    {
        _976 = 1.0;
    }
    float _1138 = _976;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1142 = _958 * _1140;
    float _1144 = _1138;
    if (!_790)
    {
        float _1146 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1148 = _1146 * 0.15915493667125701904296875;
        float _1150 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1152 = _1148 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1150 * 0.15915493667125701904296875;
        float _1158 = _1148 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = 1.0 / _1154;
        float _1164 = _1156 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = _1160 * _1162;
        float _1170 = _1156 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        float _1174 = _1166 * _1168;
        float _1176 = 1.0 / _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1180 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1178;
        float _1182 = 1.0 / _1180;
        float _1184 = _1172 * _1176;
        float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1188 = fma(_1142, _1184, _1186);
        float _1190 = _1188 * _1182;
        float _1192 = precise::clamp(_1190, 0.0, 1.0);
        _1064 = _1192;
    }
    float _1194 = _1064;
    if (!_790)
    {
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1198 = _1196 * 0.15915493667125701904296875;
        float _1200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1198 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1216 * _1218;
        float _1226 = 1.0 / _1224;
        float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1230 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1228;
        float _1232 = 1.0 / _1230;
        float _1234 = _1222 * _1226;
        float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1238 = fma(_1142, _1234, _1236);
        float _1240 = _1238 * _1232;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        float _1244 = -_1242;
        float _1246 = _1244 + 1.0;
        _1058 = _1226;
        _1144 = _1246;
    }
    float _1248 = _1058;
    float _1250 = _1144;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1254 = _1128 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1258 = _1130 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1132 + _1260;
    float _1264 = _1254 * _1254;
    float _1266 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1268 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1258, _1258, _1264);
    float _1272 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1266);
    float _1274 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1276 = fma(_1262, _1262, _1270);
    float _1278 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1272);
    float _1280 = rsqrt(_1276);
    float _1282 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1284 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1286 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1288 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1290 = sqrt(_1276);
    float _1292 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1294 = _1258 * _1292;
    float _1296 = _1262 * _1292;
    float _1298 = _1294 * _1294;
    float _1300 = _1296 * _1296;
    float _1302 = _1298 + _1300;
    float _1304 = sqrt(_1302);
    bool _1306 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1304 + _1308;
    float _1312 = _1030;
    float _1314 = _1302;
    float _1316 = _1310;
    float _1318 = _1294;
    float _1320 = _1296;
    float _1322 = _1298;
    float _1324 = _1300;
    if (_1306)
    {
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1326;
    }
    float _1328 = _1312;
    if (_1306)
    {
        float _1330 = rsqrt(_1302);
        _1314 = _1330;
    }
    float _1332 = _1314;
    if (_1306)
    {
        float _1334 = _1310 * _1328;
        _1316 = _1334;
    }
    float _1336 = _1316;
    if (_1306)
    {
        float _1338 = _1336 * 0.15915493667125701904296875;
        _978 = _1338;
    }
    float _1340 = _978;
    float _1342 = _1328;
    if (_1306)
    {
        float _1344 = _1340 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1352 = precise::max(0.0, _1350);
    float _1354 = _1248;
    if (_1306)
    {
        float _1356 = _1340 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = -_1292;
    float _1364 = -_1352;
    float _1366 = fma(_1254, _1362, _1364);
    if (_1306)
    {
        float _1368 = _1366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1368;
    }
    float _1370 = _1060;
    float _1372 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1374 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1376 = _1370;
    float _1378 = _1348;
    if (_1306)
    {
        float _1380 = fma(_1348, _1370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1376 = _1380;
    }
    float _1382 = _1376;
    float _1384 = _1382;
    if (!_1306)
    {
        _1378 = _1366;
    }
    float _1386 = _1378;
    float _1388 = floor(_1374);
    float _1390 = _1386;
    if (_1306)
    {
        float _1392 = _1360 + (-1.0);
        _1136 = _1392;
    }
    float _1394 = _1136;
    float _1396 = _1394;
    if (_1306)
    {
        float _1398 = _1332 * _1382;
        _1384 = _1398;
    }
    float _1400 = _1384;
    if (_1306)
    {
        float _1402 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1402;
    }
    float _1404 = _1396;
    if (_1306)
    {
        float _1406 = _1294 * _1400;
        _1318 = _1406;
    }
    float _1408 = _1318;
    if (_1306)
    {
        float _1410 = _1296 * _1400;
        _1320 = _1410;
    }
    float _1412 = _1320;
    if (_1306)
    {
        float _1414 = fma(_1366, _1360, _1404);
        _1390 = _1414;
    }
    float _1416 = _1390;
    if (_1306)
    {
        float _1418 = _1408 * _1408;
        _1322 = _1418;
    }
    float _1420 = _1322;
    if (_1306)
    {
        float _1422 = _1412 * _1412;
        _1324 = _1422;
    }
    float _1424 = _1324;
    float _1426 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1372);
    float _1428 = fma(_1416, _1416, _1420);
    float _1430 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1432 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1436 = _1428 + _1424;
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1440 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1438);
    float _1442 = precise::clamp(_1440, 0.0, 1.0);
    float _1444 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1446 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = rsqrt(_1436);
    float _1450 = -_1442;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1458 = -_1388;
    float _1460 = _1374 + _1458;
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = abs(_1452);
    float _1470 = log2(_1468);
    float _1472 = -_1286;
    float _1474 = fma(_1472, _1456, 1.0);
    float _1476 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1462);
    float _1482 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1478);
    float _1484 = _1448 * _1408;
    float _1486 = floor(_1430);
    float _1488 = _1448 * _1412;
    float _1490 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1482);
    float _1492 = _1448 * _1416;
    float _1494 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1496 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1480);
    float _1498 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = -_1494;
    float _1502 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1500);
    float _1504 = 1.0 / _1490;
    float _1506 = _1492 + 1.0;
    float _1508 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1510 = -_1488;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1502);
    float _1514 = fma(_1512, -0.5, 0.5);
    float _1516 = exp2(_1498);
    float _1518 = fma(_1512, 0.5, 0.5);
    float _1520 = -_1486;
    float _1522 = _1430 + _1520;
    float _1524 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1476);
    float _1526 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1528 = log2(_1474);
    float _1530 = fma(_1518, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1518, _1530, -0.212114393711090087890625);
    float _1534 = sqrt(_1514);
    float _1536 = -_1492;
    float _1538 = fma(_1516, _1506, _1536);
    float _1540 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1526);
    float _1542 = _1508 * _1504;
    float _1544 = fma(_1518, _1532, 1.570728778839111328125);
    float _1546 = _1540 * _1504;
    float _1548 = _1528 * 0.693147182464599609375;
    float _1550 = fma(_1546, -0.5, 0.5);
    float _1552 = fma(_1538, 0.5, 0.5);
    float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1556 = _1534 * 0.636619746685028076171875;
    float _1558 = fma(_1542, 0.5, 0.5);
    float _1560 = -_1544;
    float _1562 = fma(_1556, _1560, 1.0);
    float2 _5120 = float2(_1460, _1522);
    float _1564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5120, float2(0.0), isnan(_5120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5120, float2(0.0), isnan(_5120)), level(0.0)).x;
    float3 _5131 = float3(_1558, _1550, _1554);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5131, float3(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5131, float3(0.0), isnan(_5131)), level(0.0)).x;
    float3 _5142 = float3(_1558, _1550, _1554);
    float4 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5142, float3(0.0), isnan(_5142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5142, float3(0.0), isnan(_5142)), level(0.0)).xyzw;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1569.w;
    float2 _5158 = float2(_1562, _1552);
    float3 _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5158, float2(0.0), isnan(_5158)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5158, float2(0.0), isnan(_5158)), level(0.0)).xyz;
    float _1583 = _1581.x;
    float _1585 = _1581.y;
    float _1587 = _1581.z;
    float _1589 = float(uint(_374));
    float _1591 = trunc(_516);
    int _1593 = int(_1591);
    float _1595 = _436 * _166;
    bool _1597 = _374 == 0;
    out.m_65.x = _888;
    out.m_65.y = _884;
    out.m_65.z = _872;
    int _1599 = abs(_576);
    int _1601 = abs(_586);
    out.m_67.w = _708;
    float _1603 = 1.0 / _1589;
    int _1605 = ~_374;
    int _1607 = _1605 + 1;
    out.m_69.x = _812;
    float _1609 = _854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1611 = float(uint(_1593));
    float _1613 = trunc(_1595);
    int _1615 = int(_1613);
    float _1617 = float(_1593);
    float _1619 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1609);
    out.m_71.x = _1130;
    out.m_71.y = _1128;
    out.m_71.z = _1132;
    float _1621 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1619);
    int _1623 = as_type<int>(_1603) + (-2);
    float _1625 = as_type<float>(_1623) * _1611;
    int _1627 = ~_374;
    int _1629 = _1627 + 1;
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1636 = uint(_1633);
    int _1638 = _1607 * int(_1636);
    int _1640 = _1638 + _1593;
    float _1642 = float(uint(_1640));
    float _1644 = as_type<float>(_1623) * _1642;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = trunc(_1644);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    bool _1656 = !_1648;
    float _1658 = _1656 ? 7.345489978790283203125 : 1.0;
    float _1660 = _1658 * _328;
    bool _1662 = _1617 >= _426;
    bool _1664 = isnan(_1617);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(_426);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    float _1674 = floor(_1660);
    int _1676 = int(_1636) + int(_1654);
    float _1678 = trunc(_1672);
    int _1680 = int(_1678);
    int _1682 = _1629 * _1676;
    int _1684 = _1682 + _1593;
    bool _1686 = uint(_1684) >= uint(_374);
    float _1688 = -_1674;
    float _1690 = _1660 + _1688;
    bool _1692 = !_1686;
    int _1694 = _1692 ? 0 : (-1);
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1698 = _1696 != 0;
    int _1700 = ~_1676;
    int _1702 = _1700 + _1694;
    int _1704 = _1702 + 1;
    float _1706 = _1690 * _426;
    int _1708 = _374 + (-1);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1712 = _1710 != 0;
    int _1714 = _374 * _1704;
    int _1716 = _1714 + _1593;
    float _1718 = trunc(_1706);
    int _1720 = int(_1718);
    int _1722 = ~_1680;
    int _1724 = _1722 + 1;
    int _1726 = _1724 + 1;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1730 = _1728 != 0;
    bool _1732 = !_1597;
    int _1734 = _1732 ? _1716 : (-1);
    bool _1736 = !_1698;
    int _1738 = _1736 ? 0 : 1;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1742 = _1740 != 0;
    int _1744 = _1734 * _1726;
    int _1746 = abs(_1738);
    int _1748 = ~_374;
    int _1750 = _1748 + 1;
    int _1752 = _1680 * _1708;
    int _1754 = _1752 + _1744;
    bool _1756 = !_1742;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = abs(_590);
    int _1762 = _1754 * _1599;
    int _1764 = _1720 * _1746;
    int _1766 = _1764 + _1593;
    int _1768 = abs(_1758);
    float _1770 = in.m_73.y;
    int _1772 = _1615 * _1601;
    int _1774 = _1772 + _1762;
    bool _1776 = _330 > 0.5;
    int _1778 = _1766 * _1760;
    int _1780 = _1778 + _1774;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1786 = _1720 * _1768;
    int _1788 = _1786 + _1780;
    float _1790 = in.m_73.x;
    float _1792 = 1.0 / _1784;
    float _1794 = float(uint(_1788));
    float _1796 = as_type<float>(_1768);
    float _1798 = _1490;
    if (_1712)
    {
        float _1800 = in.m_55.x;
        _1796 = _1800;
    }
    float _1802 = _1796;
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1806 = _1804 != 0;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1810 = _1808 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1812 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1814 = isnan(_326);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = as_type<float>(_1623) * _1794;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1826;
    float _1830 = float(uint(_1766));
    float _1832 = -_1770;
    float _1834 = _1832 + 1.0;
    float _1836 = trunc(_1824);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1842 = as_type<float>(_1623) * _1830;
    float _1844 = _1770;
    if (_1730)
    {
        float _1846 = _1776 ? _1834 : _1770;
        _1844 = _1846;
    }
    float _1848 = _1844;
    bool _1850 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1852 = isnan(_326);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1864 = -_428;
    float _1866 = fma(_498, _1862, _1864);
    float _1868 = _1828 * _1792;
    float _1870 = -_1822;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1810;
    int _1876 = _1750 * int(_1840);
    int _1878 = _1876 + _1788;
    bool _1880 = _1802 > 0.5;
    bool _1882 = _1880 && _1712;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1886 = _326 + _1884;
    float _1888 = _1860 * _1872;
    float _1890 = _1866 + 0.5;
    float _1892 = float(uint(_1878));
    bool _1894 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1896 = isnan(_326);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1910 = as_type<float>(_1623) * _1892;
    float _1912 = -_1860;
    float _1914 = _1912 + 1.0;
    float _1916 = fma(_1868, _1886, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1918 = _1886;
    if (_1712)
    {
        _1918 = _1790;
    }
    float _1920 = _1918;
    float _1922 = trunc(_1910);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    float _1928 = _1908 * _1874;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1932 = _326 + _1930;
    float _1934 = _1920;
    if (!_1712)
    {
        _528 = _1790;
    }
    float _1936 = _528;
    float _1938 = _1936;
    if (_1882)
    {
        float _1940 = -_1920;
        float _1942 = _1940 + 1.0;
        _1934 = _1942;
    }
    float _1944 = _1934;
    float _1946 = _1904 * _1914;
    float _1948 = -_1904;
    float _1950 = _1948 + 1.0;
    float _1952 = fma(_1928, _1932, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1954 = trunc(_1842);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = _1916 * _1946;
    if (_1712)
    {
        _1938 = _1944;
    }
    float _1962 = _1938;
    bool _1964 = _778 != 0.0;
    bool _1966 = isnan(_778);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan(0.0);
    bool _1972 = _1968 || _1970;
    float _1974 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1960);
    int _1976 = ~_374;
    int _1978 = _1976 + 1;
    float _1980 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1982 = int(_1840) + int(_1926);
    float _1984 = fma(_1952, _1888, _1974);
    int _1986 = ~_374;
    int _1988 = _1986 + 1;
    float _1990 = fma(_494, _1980, _512);
    bool _1992 = _776 == 0.0;
    bool _1994 = !_1972;
    bool _1996 = _1992 && _1994;
    int _1998 = _1978 * _1982;
    int _2000 = _1998 + _1788;
    float _2002 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1984);
    float _2004 = in.m_77.x;
    float _2006 = in.m_77.y;
    float _2008 = in.m_77.z;
    bool _2010 = _780 == 0.0;
    bool _2012 = _2010 && _1996;
    int _2014 = _1988 * int(_1958);
    int _2016 = _2014 + _1766;
    bool _2018 = uint(_2000) >= uint(_374);
    float _2020 = float(uint(_2016));
    bool _2022 = !_2018;
    int _2024 = _2022 ? 0 : (-1);
    float _2026 = as_type<float>(_1623) * _2020;
    int _2028 = ~_1982;
    int _2030 = _2028 + _2024;
    int _2032 = _2030 + 1;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2038 = trunc(_2026);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2046 = _1990 + 0.5;
    float _2048 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = _2002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2056 = _2004;
    float _2058 = _2008;
    float _2060 = _2006;
    if (!_2012)
    {
        float _2062 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2004);
        _2056 = _2062;
    }
    float _2064 = _2056;
    int _2066 = _374 * _2032;
    int _2068 = _2066 + _1788;
    if (!_2012)
    {
        float _2070 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2058 = _2070;
    }
    float _2072 = _2058;
    int _2074 = ~_374;
    int _2076 = _2074 + 1;
    if (!_2012)
    {
        float _2078 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2006);
        _2060 = _2078;
    }
    float _2080 = _2060;
    out.m_79.x = _2046;
    out.m_79.y = _1890;
    bool _2082 = !_1597;
    int _2084 = _2082 ? _2068 : (-1);
    float _2086 = _832 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _832 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2090 = int(_1958) + int(_2042);
    out.m_81.x = _2048;
    out.m_81.y = _2050;
    out.m_81.z = _2052;
    out.m_81.w = _2054;
    float _2092 = _832 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2094 = -_818;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    int _2098 = _2084 & 3;
    bool _2100 = _2098 != 0;
    int _2102 = _2084 >> 31;
    float _2104 = _854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2106 = _854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2104);
    float _2110 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    int _2112 = _2076 * _2090;
    int _2114 = _2112 + _1766;
    float _2116 = -_818;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    int _2120 = _2102 & 3;
    float _2122 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2124 = -_818;
    float _2126 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2092);
    bool _2128 = uint(_2114) >= uint(_374);
    float _2130 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2096);
    int _2132 = _2084 + _2120;
    float _2134 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2118);
    float _2136 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2122);
    float _2138 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    int _2140 = _2132 >> 2;
    float _2142 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2146 = _2134 * _2080;
    int _2148 = _2140 << 4;
    int _2150 = _2148 + 368;
    float _2152 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    int _2154 = _2084 & 3;
    bool _2156 = _2154 != 0;
    float _2158 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    uint _2160 = uint(int(uint(_2150) >> uint(2)));
    uint _2162 = uint(int(uint(int(_2160)) >> uint(2)));
    int _2164 = int(_2160) & 3;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[int(_2162)][_2164];
    int _2168 = int(_2160) + 1;
    uint _2170 = uint(int(uint(_2168) >> uint(2)));
    int _2172 = _2168 & 3;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[int(_2170)][_2172];
    float _2176 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2152);
    bool _2178 = !_2128;
    int _2180 = _2178 ? 0 : (-1);
    float _2182 = abs(_1142);
    float _2184 = log2(_2182);
    bool _2186 = uint(_2154) > 1u;
    float _2188 = _2130 * _2080;
    float _2190 = _2138 * _2080;
    int _2192 = _2100 ? 0 : 1;
    int _2194 = _2150 + 8;
    uint _2196 = uint(int(uint(_2194) >> uint(2)));
    uint _2198 = uint(int(uint(int(_2196)) >> uint(2)));
    int _2200 = int(_2196) & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = int(_2196) + 1;
    uint _2206 = uint(int(uint(_2204) >> uint(2)));
    int _2208 = _2204 & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = ~_2090;
    int _2214 = _2212 + _2180;
    int _2216 = _2214 + 1;
    float _2218 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    int _2220 = ~_2192;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = fma(_2176, _2064, _2146);
    bool _2228 = uint(_2154) >= 2u;
    float _2230 = fma(_2218, _2064, _2188);
    float _2232 = -_1564;
    float _2234 = _2232 + 1.0;
    int _2236 = _2224;
    if (!_2186)
    {
        int _2238 = ~_2192;
        int _2240 = _2238 + 1;
        _2236 = _2240;
    }
    int _2242 = _2236;
    float _2244 = fma(_1621, _2072, _2230);
    bool _2246 = _2154 != 3;
    float _2248 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2250 = abs(_2242);
    float _2252 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2158);
    bool _2254 = !_2156;
    int _2256 = _2254 ? 0 : 1;
    float _2258 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2108);
    int _2260 = _2228 ? 0 : 1;
    float _2262 = exp2(_2248);
    float _2264 = fma(_2252, _2064, _2190);
    int _2266 = abs(_2256);
    float _2268 = fma(_2258, _2072, _2226);
    int _2270 = ~_2260;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    float _2276 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    bool _2278 = _2154 != 3;
    int _2280 = _374 * _2216;
    int _2282 = _2280 + _1766;
    int _2284 = _2274;
    if (_2246)
    {
        int _2286 = ~_2260;
        int _2288 = _2286 + 1;
        _2284 = _2288;
    }
    int _2290 = _2284;
    float _2292 = fma(_2276, _2072, _2264);
    int _2294 = ~_2250;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    bool _2300 = !_2278;
    int _2302 = _2300 ? 0 : (-1);
    float _2304 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    int _2308 = abs(_2290);
    out.m_83.x = _2268;
    out.m_83.y = _2244;
    out.m_83.z = _2292;
    int _2310 = ~_2266;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = abs(_2302);
    int _2318 = _2298 * as_type<int>(_2174);
    bool _2320 = !_1806;
    int _2322 = _2320 ? 0 : 1;
    int _2324 = _2314 * as_type<int>(_2166);
    int _2326 = _2324 + _2318;
    int _2328 = abs(_2322);
    float _2330 = _1508 + _1490;
    int _2332 = ~_2308;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    float _2338 = _2330 * 0.5;
    int _2340 = ~_2316;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    int _2346 = _2336 * as_type<int>(_2202);
    int _2348 = _2346 + _2326;
    bool _2350 = _1142 <= 8000.0;
    bool _2352 = isnan(_1142);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(8000.0);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    int _2362 = _2344 * as_type<int>(_2210);
    int _2364 = _2362 + _2348;
    float _2366 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2368 = fma(_2306, -2.0, 3.0);
    float _2370 = _2306 * _2306;
    float _2372 = in.m_85.x;
    float _2374 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2376 = ~_2328;
    int _2378 = _2376 + 1;
    int _2380 = _2378 + 1;
    float _2382 = exp2(_2366);
    float _2384 = _2370 * _2368;
    float _2386 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2374);
    bool _2388 = !_1597;
    int _2390 = _2388 ? _2282 : (-1);
    int _2392 = _2364 * _2380;
    float _2394 = -_2384;
    float _2396 = _2394 + 1.0;
    float _2398 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2386);
    int _2400 = _2390 * _2328;
    int _2402 = _2400 + _2392;
    float _2404 = fma(_2396, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2384);
    float _2406 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    float _2408 = _1490 * 0.5;
    float _2410 = _2360 * _2404;
    float _2412 = _2406 + _1490;
    float _2414 = fma(_1540, -0.5, _2408);
    float _2416 = -_2382;
    float _2418 = _2416 + 1.0;
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1508;
    out.gl_Position.y = _1540;
    out.gl_Position.z = _2406;
    out.gl_Position.w = _1490;
    float _2422 = _2412 * 0.5;
    float _2424 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2426 = _2234 * _2420;
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    bool _2430 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2432 = isnan(_1290);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2438 = _2434 || _2436;
    float _2440 = _2424 * _1566;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_87.x = _2338;
    out.m_87.y = _2414;
    out.m_87.z = _2422;
    out.m_87.w = _1490;
    float _2446 = float(_2402);
    float _2448 = _1587 * _2440;
    float _2450 = _2444 * _2372;
    float _2452 = _1577 * _2440;
    float _2454 = -_2424;
    float _2456 = _2454 + 1.0;
    float _2458 = _2450 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2446;
    float _2460 = fma(_1583, _2452, _1571);
    float _2462 = fma(_1585, _2452, _1573);
    float _2464 = _1577 * _2456;
    float _2466 = fma(_1577, _2448, _1575);
    out.m_91.x = _2458;
    float _2468 = _1194 * _1250;
    float _2470 = _2424;
    float _2472 = _2446;
    float _2474 = _2406;
    float _2476 = _2452;
    float _2478 = _2468;
    if (!_2438)
    {
        _2470 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2480 = _2470;
    out.m_93.x = _2460;
    out.m_93.y = _2462;
    out.m_93.z = _2466;
    out.m_93.w = _2464;
    float _2482 = _2468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2484 = _2480;
    float _2486 = _2480;
    if (!_2438)
    {
        _2472 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2488 = _2472;
    float _2490 = _2488;
    float _2492 = _2488;
    if (!_2438)
    {
        _1798 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2494 = _1798;
    float _2496 = _2494;
    float _2498 = _2494;
    if (!_2438)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2500 = _2474;
    float _2502 = _2500;
    float _2504 = _2500;
    if (!_2438)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2506 = _2476;
    float _2508 = _2506;
    float _2510 = _2506;
    if (!_2438)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2512 = _2478;
    bool _2514 = !_2438;
    float _2516 = _2512;
    float _2518 = _2512;
    if (!_2514)
    {
        bool _2520 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2522 = isnan(_1290);
        bool _2524 = _2520 || _2522;
        bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2528 = _2524 || _2526;
        if (!_2528)
        {
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2532 = _1290 + _2530;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2534;
            float _2538 = 1.0 / _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2560 = _2532 * _2538;
            float _2562 = precise::clamp(_2560, 0.0, 1.0);
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2568 = fma(_2562, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2492 = _2570;
            _2510 = _2576;
            _2486 = _2568;
            _2504 = _2574;
            _2498 = _2572;
            _2518 = _2578;
            _2580 = true;
        }
        else
        {
            bool _2582 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2584 = isnan(_1290);
            bool _2586 = _2582 || _2584;
            bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2590 = _2586 || _2588;
            if (!_2590)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2592 = _2484;
            _2486 = _2592;
            if (!_2590)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2594 = _2490;
            _2492 = _2594;
            if (!_2590)
            {
                _2496 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2596 = _2496;
            _2498 = _2596;
            if (!_2590)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2598 = _2502;
            _2504 = _2598;
            if (!_2590)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2600 = _2508;
            _2510 = _2600;
            if (!_2590)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2602 = _2516;
            bool _2604 = !_2590;
            _2518 = _2602;
            if (!_2604)
            {
                bool _2606 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2608 = isnan(_1290);
                bool _2610 = _2606 || _2608;
                bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2614 = _2610 || _2612;
                if (!_2614)
                {
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2618 = _1290 + _2616;
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2620;
                    float _2624 = 1.0 / _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2646 = _2618 * _2624;
                    float _2648 = precise::clamp(_2646, 0.0, 1.0);
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2654 = fma(_2648, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2656 = fma(_2648, _2652, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2658 = fma(_2648, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2648, _2636, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2662 = fma(_2648, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2664 = fma(_2648, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2492 = _2656;
                    _2510 = _2662;
                    _2486 = _2654;
                    _2504 = _2660;
                    _2498 = _2658;
                    _2518 = _2664;
                    _2580 = true;
                }
                else
                {
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2498 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2580 = false;
    float _2666 = _2492;
    float _2668 = _2510;
    float _2670 = _2486;
    float _2672 = _2504;
    float _2674 = _2498;
    float _2676 = _2518;
    float _2678 = fma(_2244, -0.5, 0.5);
    float _2680 = precise::clamp(_2678, 0.0, 1.0);
    float _2682 = -_2666;
    float _2684 = _2682 + _2668;
    float _2686 = _2482 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = fma(_2680, _2684, _2666);
    out.m_95.x = 0.0;
    float _2694 = -_2674;
    float _2696 = _2694 + _2676;
    float _2698 = fma(_2680, _2690, _2670);
    float _2700 = _2692 * 0.586610972881317138671875;
    out.m_53.x = _2686;
    bool _2702 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2704 = fma(_2680, _2696, _2674);
    float _2706 = fma(_2698, 0.298911988735198974609375, _2700);
    bool _2708 = _1194 > 0.0;
    bool _2710 = isnan(_1194);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(0.0);
    bool _2716 = _2712 || _2714;
    float _2718 = fma(_2704, 0.114477999508380889892578125, _2706);
    bool _2720 = _1250 <= 0.0;
    bool _2722 = !_2716;
    bool _2724 = _2720 || _2722;
    float _2726 = -_2718;
    float _2728 = _2698 + _2726;
    float _2730 = -_2718;
    float _2732 = _2692 + _2730;
    float _2734 = -_2718;
    float _2736 = _2704 + _2734;
    float _2738 = fma(_2728, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2740 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2742 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    bool _2744 = !_2702;
    if (!_2744)
    {
        float _2746 = -_1128;
        float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2750 = -_1130;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2754 = -_1132;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2758 = _2748 * _2748;
        float _2760 = fma(_2752, _2752, _2758);
        float _2762 = fma(_2756, _2756, _2760);
        float _2764 = sqrt(_2762);
        float _2766 = rsqrt(_2762);
        float _2768 = -_2764;
        float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2772 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2774 = precise::clamp(_2772, 0.0, 1.0);
        float _2776 = _2752 * _2766;
        float _2778 = _2748 * _2766;
        float _2780 = abs(_2774);
        float _2782 = log2(_2780);
        float _2784 = _2756 * _2766;
        float _2786 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2788 = _2244 * _2778;
        float _2790 = -_2778;
        float _2792 = -_2786;
        float _2794 = fma(_2790, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2792);
        float _2796 = fma(_2268, _2776, _2788);
        float _2798 = -_2784;
        float _2800 = fma(_2798, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2794);
        float _2802 = fma(_2292, _2784, _2796);
        float _2804 = precise::clamp(_2802, 0.0, 1.0);
        float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2808 = _2800 + _2806;
        float _2810 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2812 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2814 = precise::clamp(_2812, 0.0, 1.0);
        float _2816 = exp2(_2810);
        float _2818 = _2816 * _2814;
        float _2820 = _2804 * _2818;
        float _2822 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2824 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2826 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2822;
        out.m_95.y = _2824;
        out.m_95.z = _2826;
    }
    out.m_67.x = _2738;
    out.m_67.y = _2740;
    out.m_67.z = _2742;
    if (!_2724)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2828 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2828;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2580 = false;
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
    float _128 = _111;
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
        float _2896 = as_type<float>(_138);
        out.gl_Position.z = _2896;
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
        float _2951 = as_type<float>(_164);
        out.gl_Position.z = _2951;
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
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _232 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
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
    out.m_57.y = _232;
    out.m_57.z = _228;
    out.m_57.w = _230;
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
    float _302 = _296 * _266;
    float _304 = _298 * _268;
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
    float _336 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _338 = in.m_46.x;
    float _340 = in.m_46.y;
    float _342 = in.m_46.z;
    float _344 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _348 = in.m_55.z;
    float _350 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _352 = int(_350);
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _356 = _336 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _358 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _334 * _120;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _374 = int(_372);
    float _376 = _328 * 2.0;
    float _378 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _380 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _382 = _330 + _328;
    float _384 = exp2(_370);
    float _386 = -_346;
    float _388 = fma(_378, 2.0, _386);
    float _390 = fma(_380, -2.0, _354);
    float _392 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = _330 * 2.0;
    float _400 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _402 = floor(_376);
    float _404 = _382 + (-1.0);
    float _406 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _408 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _410 = _330 + _348;
    float _412 = _348 * 2.0;
    float _414 = float(_352);
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _418 = _410 + (-1.0);
    float _420 = floor(_398);
    float _422 = -_384;
    float _424 = _422 + 1.0;
    float _426 = float(_374);
    float _428 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _390);
    float _430 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _432 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _406);
    float _434 = _368 ? _424 : 0.0;
    float _436 = _426 * _120;
    bool _438 = _402 > 0.0;
    float _440 = floor(_412);
    bool _442 = _402 >= 0.0;
    bool _444 = isnan(_402);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = 1.0 / _414;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _462 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _464 = isnan(1.0);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _470 = _466 || _468;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _474 = _420 > 0.0;
    float _476 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _460);
    int _478 = _450 ? 0 : 1;
    float _480 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _472);
    float _482 = 1.0 / _456;
    bool _484 = _420 >= 0.0;
    bool _486 = isnan(_420);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    float _494 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _476);
    bool _496 = _440 > 0.0;
    float _498 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _480);
    bool _500 = _440 >= 0.0;
    bool _502 = isnan(_440);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = -_120;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[76].x, _388);
    int _514 = _492 ? 0 : 1;
    float _516 = _458 * _120;
    int _518 = ~_478;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = _430 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _526 = _522;
    float _528 = _326;
    if (!_438)
    {
        int _530 = ~_478;
        int _532 = _530 + 1;
        _526 = _532;
    }
    int _534 = _526;
    float _536 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _408);
    float _538 = _432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _540 = _508 ? 0 : 1;
    if (_470)
    {
        float _542 = _434 * _482;
        _130 = _542;
    }
    float _544 = _130;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _556 = _554 != 0;
    float _558 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _560 = ~_514;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    int _566 = _564;
    if (!_474)
    {
        int _568 = ~_514;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    bool _574 = !_552;
    int _576 = _574 ? 0 : 1;
    float _578 = in.m_61.x;
    float _580 = in.m_61.y;
    float _582 = in.m_61.z;
    bool _584 = !_548;
    int _586 = _584 ? 0 : 1;
    bool _588 = !_556;
    int _590 = _588 ? 0 : 1;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _602 = _600 != 0;
    float _604 = float(_534);
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _558 + _606;
    int _610 = ~_540;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    bool _616 = !_594;
    int _618 = _616 ? 0 : 1;
    bool _620 = !_598;
    int _622 = _620 ? 0 : 1;
    int _624 = abs(_618);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _628 = _538 + _626;
    int _630 = abs(_622);
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _634 = _524 + _632;
    int _636 = _614;
    if (!_496)
    {
        int _638 = ~_540;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    float _644 = _628 * _628;
    float _646 = float(_630);
    float _648 = fma(_634, _634, _644);
    float _650 = float(_642);
    float _652 = _646 * _604;
    float _654 = float(_624);
    float _656 = fma(_608, _608, _648);
    bool _658 = !_602;
    int _660 = _658 ? 0 : 1;
    float _662 = _652 * (-2.0);
    float _664 = _330 + (-0.5);
    float _666 = sqrt(_656);
    float _668 = _654 * _650;
    float _670 = fma(_662, _580, _580);
    int _672 = abs(_660);
    float _674 = fma(_452, _662, _452);
    float _676 = float(_572);
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _670);
    float _680 = _348 + _328;
    float _682 = rsqrt(_656);
    float _684 = float(_672);
    float _686 = _668 * (-2.0);
    float _688 = _680 + (-1.0);
    float _690 = _348 + (-0.5);
    float _692 = fma(_674, _544, _678);
    float _694 = _684 * _676;
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _698 = _666 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _700 = _328 + (-0.5);
    float _702 = fma(_686, _578, _578);
    float _704 = _694 * (-2.0);
    float _706 = fma(_416, _686, _416);
    float _708 = precise::min(_356, _698);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _702);
    float _712 = fma(_696, _704, _696);
    float _714 = fma(_704, _582, _582);
    float _716 = _692 * 0.15915493667125701904296875;
    float _718 = _682 * _708;
    float _720 = fma(_706, _544, _710);
    float _722 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _724 = _716 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = _628 * _718;
    float _730 = _634 * _718;
    float _732 = _608 * _718;
    float _734 = fma(_712, _544, _722);
    float _736 = -_728;
    float _738 = _628 + _736;
    float _740 = -_730;
    float _742 = _634 + _740;
    float _744 = -_732;
    float _746 = _608 + _744;
    float _748 = _716 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = _738 * _738;
    float _754 = _720 * 0.15915493667125701904296875;
    float _756 = fma(_742, _742, _752);
    bool _758 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _760 = isnan(0.5);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _766 = _762 || _764;
    float _768 = _754 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = fma(_746, _746, _756);
    float _774 = _734 * 0.15915493667125701904296875;
    float _776 = in.m_63.x;
    float _778 = in.m_63.y;
    float _780 = in.m_63.z;
    bool _782 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _784 = isnan(0.5);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _790 = _786 || _788;
    float _792 = sqrt(_772);
    float _794 = _754 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _770 * _726;
    float _800 = _770 * _750;
    float _802 = _774 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _682 * _792;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _810 = _344 * _806;
    float _812 = _336 * _806;
    float _814 = _358 * _806;
    float _816 = _774 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _796 * _750;
    float _822 = _796 * _726;
    float _824 = _810 * _808;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _828 = _770 * _804;
    float _830 = _750 * _804;
    float _832 = _796 * _804;
    float _834 = _726 * _804;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _838 = _814 * _826;
    float _840 = _828 * _824;
    float _842 = _812 * _836;
    float _844 = fma(_818, _820, _798);
    float _846 = _832 * _824;
    float _848 = -_822;
    float _850 = fma(_818, _800, _848);
    float _852 = -_800;
    float _854 = fma(_818, _822, _852);
    float _856 = -_824;
    float _858 = _818 * _856;
    float _860 = fma(_844, _842, _846);
    float _862 = fma(_818, _798, _820);
    float _864 = fma(_850, _842, _840);
    float _866 = fma(_830, _842, _858);
    float _868 = fma(_854, _838, _860);
    float _870 = -_732;
    float _872 = _558 + _870;
    float _874 = fma(_862, _838, _864);
    float _876 = fma(_834, _838, _866);
    float _878 = _868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _880 = _868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _882 = -_728;
    float _884 = _538 + _882;
    float _886 = -_730;
    float _888 = _524 + _886;
    float _890 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].x, _878);
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _880);
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _896 = _868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _902 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _894);
    float _904 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _910 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[11].z, _902);
    float _912 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _904);
    float _914 = _558 + _906;
    float _916 = _524 + _908;
    float _918 = _910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _920 = _884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _916 + _926;
    float _930 = 1.0 / _918;
    float _932 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _920);
    float _934 = _924 * _924;
    float _936 = _912 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _938 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[10].z, _932);
    float _940 = fma(_928, _928, _934);
    float _942 = _538 + _936;
    float _944 = _938 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _946 = sqrt(_940);
    float _948 = _944 + _918;
    float _950 = _948 * _930;
    float _952 = _950 * 0.5;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _956 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _954);
    float _958 = 1.0 / _956;
    bool _960 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _962 = _876;
    float _964 = _936;
    float _966 = _912;
    float _968 = _956;
    float _970 = _946;
    float _972 = _732;
    float _974 = _728;
    float _976 = _930;
    float _978 = _916;
    if (!_960)
    {
        _962 = _916;
    }
    float _980 = _962;
    float _982 = _980;
    if (!_960)
    {
        _964 = _914;
    }
    float _984 = _964;
    float _986 = _984;
    if (!_960)
    {
        _966 = _942;
    }
    float _988 = _966;
    bool _990 = !_960;
    float _992 = _988;
    if (!_990)
    {
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _998 = _946 + _996;
        float _1000 = _942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = rsqrt(_940);
        float _1004 = _998 * _994;
        float _1006 = _1004 * 0.15915493667125701904296875;
        float _1008 = _1006 * 6.283185482025146484375;
        float _1010 = cos(_1008);
        float _1012 = _1006 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        float _1016 = _1010 + (-1.0);
        float _1018 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = fma(_1014, _1000, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1022 = fma(_942, _1010, _1018);
        float _1024 = _1002 * _1020;
        float _1026 = fma(_928, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1028 = fma(_924, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1026;
        _992 = _1022;
        _986 = _1028;
        _968 = _1000;
        _970 = _1006;
    }
    float _1030 = _982;
    float _1032 = _992;
    float _1034 = _986;
    float _1036 = _968;
    float _1038 = _970;
    float _1040 = -_730;
    float _1042 = _1040 + _1030;
    float _1044 = -_728;
    float _1046 = _1044 + _1032;
    float _1048 = -_732;
    float _1050 = _1048 + _1034;
    float _1052 = _1042;
    float _1054 = _1046;
    float _1056 = _1038;
    float _1058 = _1032;
    float _1060 = _1036;
    if (_790)
    {
        _972 = 1.0;
    }
    float _1062 = _972;
    float _1064 = _1062;
    if (_766)
    {
        _974 = _1042;
    }
    float _1066 = _974;
    float _1068 = _1066;
    if (_766)
    {
        _1052 = _1046;
    }
    float _1070 = _1052;
    float _1072 = _1070;
    if (_766)
    {
        _1054 = _1050;
    }
    float _1074 = _1054;
    float _1076 = _1074;
    if (!_766)
    {
        float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1080 = _884 + _1078;
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1084 = _888 + _1082;
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1088 = _1080 * _1080;
        float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1092 = _872 + _1090;
        float _1094 = fma(_1084, _1084, _1088);
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1098 = fma(_1092, _1092, _1094);
        float _1100 = sqrt(_1098);
        float _1102 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1104 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1096;
        float _1108 = -_524;
        float _1110 = _1108 + _1030;
        float _1112 = -_538;
        float _1114 = _1112 + _1032;
        float _1116 = -_558;
        float _1118 = _1116 + _1034;
        float _1120 = _1102 * _1106;
        float _1122 = fma(_1110, _1120, _888);
        float _1124 = fma(_1114, _1120, _884);
        float _1126 = fma(_1118, _1120, _872);
        _1072 = _1124;
        _1068 = _1122;
        _1076 = _1126;
        _1056 = _1096;
    }
    float _1128 = _1072;
    float _1130 = _1068;
    float _1132 = _1076;
    float _1134 = _1056;
    float _1136 = _1134;
    if (_790)
    {
        _976 = 1.0;
    }
    float _1138 = _976;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1142 = _958 * _1140;
    float _1144 = _1138;
    if (!_790)
    {
        float _1146 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1148 = _1146 * 0.15915493667125701904296875;
        float _1150 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1152 = _1148 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1150 * 0.15915493667125701904296875;
        float _1158 = _1148 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = 1.0 / _1154;
        float _1164 = _1156 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = _1160 * _1162;
        float _1170 = _1156 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        float _1174 = _1166 * _1168;
        float _1176 = 1.0 / _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1180 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1178;
        float _1182 = 1.0 / _1180;
        float _1184 = _1172 * _1176;
        float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1188 = fma(_1142, _1184, _1186);
        float _1190 = _1188 * _1182;
        float _1192 = precise::clamp(_1190, 0.0, 1.0);
        _1064 = _1192;
    }
    float _1194 = _1064;
    if (!_790)
    {
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1198 = _1196 * 0.15915493667125701904296875;
        float _1200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1198 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1216 * _1218;
        float _1226 = 1.0 / _1224;
        float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1230 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1228;
        float _1232 = 1.0 / _1230;
        float _1234 = _1222 * _1226;
        float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1238 = fma(_1142, _1234, _1236);
        float _1240 = _1238 * _1232;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        float _1244 = -_1242;
        float _1246 = _1244 + 1.0;
        _1058 = _1226;
        _1144 = _1246;
    }
    float _1248 = _1058;
    float _1250 = _1144;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1254 = _1128 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1258 = _1130 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1132 + _1260;
    float _1264 = _1254 * _1254;
    float _1266 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1268 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1258, _1258, _1264);
    float _1272 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1266);
    float _1274 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1276 = fma(_1262, _1262, _1270);
    float _1278 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1272);
    float _1280 = rsqrt(_1276);
    float _1282 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1284 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1286 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1288 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1290 = sqrt(_1276);
    float _1292 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1294 = _1258 * _1292;
    float _1296 = _1262 * _1292;
    float _1298 = _1294 * _1294;
    float _1300 = _1296 * _1296;
    float _1302 = _1298 + _1300;
    float _1304 = sqrt(_1302);
    bool _1306 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1304 + _1308;
    float _1312 = _1030;
    float _1314 = _1302;
    float _1316 = _1310;
    float _1318 = _1294;
    float _1320 = _1296;
    float _1322 = _1298;
    float _1324 = _1300;
    if (_1306)
    {
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1326;
    }
    float _1328 = _1312;
    if (_1306)
    {
        float _1330 = rsqrt(_1302);
        _1314 = _1330;
    }
    float _1332 = _1314;
    if (_1306)
    {
        float _1334 = _1310 * _1328;
        _1316 = _1334;
    }
    float _1336 = _1316;
    if (_1306)
    {
        float _1338 = _1336 * 0.15915493667125701904296875;
        _978 = _1338;
    }
    float _1340 = _978;
    float _1342 = _1328;
    if (_1306)
    {
        float _1344 = _1340 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1352 = precise::max(0.0, _1350);
    float _1354 = _1248;
    if (_1306)
    {
        float _1356 = _1340 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = -_1292;
    float _1364 = -_1352;
    float _1366 = fma(_1254, _1362, _1364);
    if (_1306)
    {
        float _1368 = _1366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1368;
    }
    float _1370 = _1060;
    float _1372 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1374 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1376 = _1370;
    float _1378 = _1348;
    if (_1306)
    {
        float _1380 = fma(_1348, _1370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1376 = _1380;
    }
    float _1382 = _1376;
    float _1384 = _1382;
    if (!_1306)
    {
        _1378 = _1366;
    }
    float _1386 = _1378;
    float _1388 = floor(_1374);
    float _1390 = _1386;
    if (_1306)
    {
        float _1392 = _1360 + (-1.0);
        _1136 = _1392;
    }
    float _1394 = _1136;
    float _1396 = _1394;
    if (_1306)
    {
        float _1398 = _1332 * _1382;
        _1384 = _1398;
    }
    float _1400 = _1384;
    if (_1306)
    {
        float _1402 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1402;
    }
    float _1404 = _1396;
    if (_1306)
    {
        float _1406 = _1294 * _1400;
        _1318 = _1406;
    }
    float _1408 = _1318;
    if (_1306)
    {
        float _1410 = _1296 * _1400;
        _1320 = _1410;
    }
    float _1412 = _1320;
    if (_1306)
    {
        float _1414 = fma(_1366, _1360, _1404);
        _1390 = _1414;
    }
    float _1416 = _1390;
    if (_1306)
    {
        float _1418 = _1408 * _1408;
        _1322 = _1418;
    }
    float _1420 = _1322;
    if (_1306)
    {
        float _1422 = _1412 * _1412;
        _1324 = _1422;
    }
    float _1424 = _1324;
    float _1426 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1372);
    float _1428 = fma(_1416, _1416, _1420);
    float _1430 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1432 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1436 = _1428 + _1424;
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1440 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1438);
    float _1442 = precise::clamp(_1440, 0.0, 1.0);
    float _1444 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1446 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = rsqrt(_1436);
    float _1450 = -_1442;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1458 = -_1388;
    float _1460 = _1374 + _1458;
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = abs(_1452);
    float _1470 = log2(_1468);
    float _1472 = -_1286;
    float _1474 = fma(_1472, _1456, 1.0);
    float _1476 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1462);
    float _1482 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1478);
    float _1484 = _1448 * _1408;
    float _1486 = floor(_1430);
    float _1488 = _1448 * _1412;
    float _1490 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1482);
    float _1492 = _1448 * _1416;
    float _1494 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1496 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1480);
    float _1498 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = -_1494;
    float _1502 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1500);
    float _1504 = 1.0 / _1490;
    float _1506 = _1492 + 1.0;
    float _1508 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1510 = -_1488;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1502);
    float _1514 = fma(_1512, -0.5, 0.5);
    float _1516 = exp2(_1498);
    float _1518 = fma(_1512, 0.5, 0.5);
    float _1520 = -_1486;
    float _1522 = _1430 + _1520;
    float _1524 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1476);
    float _1526 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1528 = log2(_1474);
    float _1530 = fma(_1518, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1518, _1530, -0.212114393711090087890625);
    float _1534 = sqrt(_1514);
    float _1536 = -_1492;
    float _1538 = fma(_1516, _1506, _1536);
    float _1540 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1526);
    float _1542 = _1508 * _1504;
    float _1544 = fma(_1518, _1532, 1.570728778839111328125);
    float _1546 = _1540 * _1504;
    float _1548 = _1528 * 0.693147182464599609375;
    float _1550 = fma(_1546, -0.5, 0.5);
    float _1552 = fma(_1538, 0.5, 0.5);
    float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1556 = _1534 * 0.636619746685028076171875;
    float _1558 = fma(_1542, 0.5, 0.5);
    float _1560 = -_1544;
    float _1562 = fma(_1556, _1560, 1.0);
    float2 _5120 = float2(_1460, _1522);
    float _1564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5120, float2(0.0), isnan(_5120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5120, float2(0.0), isnan(_5120)), level(0.0)).x;
    float3 _5131 = float3(_1558, _1550, _1554);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5131, float3(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5131, float3(0.0), isnan(_5131)), level(0.0)).x;
    float3 _5142 = float3(_1558, _1550, _1554);
    float4 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5142, float3(0.0), isnan(_5142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5142, float3(0.0), isnan(_5142)), level(0.0)).xyzw;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1569.w;
    float2 _5158 = float2(_1562, _1552);
    float3 _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5158, float2(0.0), isnan(_5158)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5158, float2(0.0), isnan(_5158)), level(0.0)).xyz;
    float _1583 = _1581.x;
    float _1585 = _1581.y;
    float _1587 = _1581.z;
    float _1589 = float(uint(_374));
    float _1591 = trunc(_516);
    int _1593 = int(_1591);
    float _1595 = _436 * _166;
    bool _1597 = _374 == 0;
    out.m_65.x = _888;
    out.m_65.y = _884;
    out.m_65.z = _872;
    int _1599 = abs(_576);
    int _1601 = abs(_586);
    out.m_67.w = _708;
    float _1603 = 1.0 / _1589;
    int _1605 = ~_374;
    int _1607 = _1605 + 1;
    out.m_69.x = _812;
    float _1609 = _854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1611 = float(uint(_1593));
    float _1613 = trunc(_1595);
    int _1615 = int(_1613);
    float _1617 = float(_1593);
    float _1619 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1609);
    out.m_71.x = _1130;
    out.m_71.y = _1128;
    out.m_71.z = _1132;
    float _1621 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1619);
    int _1623 = as_type<int>(_1603) + (-2);
    float _1625 = as_type<float>(_1623) * _1611;
    int _1627 = ~_374;
    int _1629 = _1627 + 1;
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1636 = uint(_1633);
    int _1638 = _1607 * int(_1636);
    int _1640 = _1638 + _1593;
    float _1642 = float(uint(_1640));
    float _1644 = as_type<float>(_1623) * _1642;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = trunc(_1644);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    bool _1656 = !_1648;
    float _1658 = _1656 ? 7.345489978790283203125 : 1.0;
    float _1660 = _1658 * _328;
    bool _1662 = _1617 >= _426;
    bool _1664 = isnan(_1617);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(_426);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    float _1674 = floor(_1660);
    int _1676 = int(_1636) + int(_1654);
    float _1678 = trunc(_1672);
    int _1680 = int(_1678);
    int _1682 = _1629 * _1676;
    int _1684 = _1682 + _1593;
    bool _1686 = uint(_1684) >= uint(_374);
    float _1688 = -_1674;
    float _1690 = _1660 + _1688;
    bool _1692 = !_1686;
    int _1694 = _1692 ? 0 : (-1);
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1698 = _1696 != 0;
    int _1700 = ~_1676;
    int _1702 = _1700 + _1694;
    int _1704 = _1702 + 1;
    float _1706 = _1690 * _426;
    int _1708 = _374 + (-1);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1712 = _1710 != 0;
    int _1714 = _374 * _1704;
    int _1716 = _1714 + _1593;
    float _1718 = trunc(_1706);
    int _1720 = int(_1718);
    int _1722 = ~_1680;
    int _1724 = _1722 + 1;
    int _1726 = _1724 + 1;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1730 = _1728 != 0;
    bool _1732 = !_1597;
    int _1734 = _1732 ? _1716 : (-1);
    bool _1736 = !_1698;
    int _1738 = _1736 ? 0 : 1;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1742 = _1740 != 0;
    int _1744 = _1734 * _1726;
    int _1746 = abs(_1738);
    int _1748 = ~_374;
    int _1750 = _1748 + 1;
    int _1752 = _1680 * _1708;
    int _1754 = _1752 + _1744;
    bool _1756 = !_1742;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = abs(_590);
    int _1762 = _1754 * _1599;
    int _1764 = _1720 * _1746;
    int _1766 = _1764 + _1593;
    int _1768 = abs(_1758);
    float _1770 = in.m_73.y;
    int _1772 = _1615 * _1601;
    int _1774 = _1772 + _1762;
    bool _1776 = _330 > 0.5;
    int _1778 = _1766 * _1760;
    int _1780 = _1778 + _1774;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1786 = _1720 * _1768;
    int _1788 = _1786 + _1780;
    float _1790 = in.m_73.x;
    float _1792 = 1.0 / _1784;
    float _1794 = float(uint(_1788));
    float _1796 = as_type<float>(_1768);
    float _1798 = _1490;
    if (_1712)
    {
        float _1800 = in.m_55.x;
        _1796 = _1800;
    }
    float _1802 = _1796;
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1806 = _1804 != 0;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1810 = _1808 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1812 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1814 = isnan(_326);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = as_type<float>(_1623) * _1794;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1826;
    float _1830 = float(uint(_1766));
    float _1832 = -_1770;
    float _1834 = _1832 + 1.0;
    float _1836 = trunc(_1824);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1842 = as_type<float>(_1623) * _1830;
    float _1844 = _1770;
    if (_1730)
    {
        float _1846 = _1776 ? _1834 : _1770;
        _1844 = _1846;
    }
    float _1848 = _1844;
    bool _1850 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1852 = isnan(_326);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1864 = -_428;
    float _1866 = fma(_498, _1862, _1864);
    float _1868 = _1828 * _1792;
    float _1870 = -_1822;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1810;
    int _1876 = _1750 * int(_1840);
    int _1878 = _1876 + _1788;
    bool _1880 = _1802 > 0.5;
    bool _1882 = _1880 && _1712;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1886 = _326 + _1884;
    float _1888 = _1860 * _1872;
    float _1890 = _1866 + 0.5;
    float _1892 = float(uint(_1878));
    bool _1894 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1896 = isnan(_326);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1910 = as_type<float>(_1623) * _1892;
    float _1912 = -_1860;
    float _1914 = _1912 + 1.0;
    float _1916 = fma(_1868, _1886, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1918 = _1886;
    if (_1712)
    {
        _1918 = _1790;
    }
    float _1920 = _1918;
    float _1922 = trunc(_1910);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    float _1928 = _1908 * _1874;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1932 = _326 + _1930;
    float _1934 = _1920;
    if (!_1712)
    {
        _528 = _1790;
    }
    float _1936 = _528;
    float _1938 = _1936;
    if (_1882)
    {
        float _1940 = -_1920;
        float _1942 = _1940 + 1.0;
        _1934 = _1942;
    }
    float _1944 = _1934;
    float _1946 = _1904 * _1914;
    float _1948 = -_1904;
    float _1950 = _1948 + 1.0;
    float _1952 = fma(_1928, _1932, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1954 = trunc(_1842);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = _1916 * _1946;
    if (_1712)
    {
        _1938 = _1944;
    }
    float _1962 = _1938;
    bool _1964 = _778 != 0.0;
    bool _1966 = isnan(_778);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan(0.0);
    bool _1972 = _1968 || _1970;
    float _1974 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1960);
    int _1976 = ~_374;
    int _1978 = _1976 + 1;
    float _1980 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1982 = int(_1840) + int(_1926);
    float _1984 = fma(_1952, _1888, _1974);
    int _1986 = ~_374;
    int _1988 = _1986 + 1;
    float _1990 = fma(_494, _1980, _512);
    bool _1992 = _776 == 0.0;
    bool _1994 = !_1972;
    bool _1996 = _1992 && _1994;
    int _1998 = _1978 * _1982;
    int _2000 = _1998 + _1788;
    float _2002 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1984);
    float _2004 = in.m_77.x;
    float _2006 = in.m_77.y;
    float _2008 = in.m_77.z;
    bool _2010 = _780 == 0.0;
    bool _2012 = _2010 && _1996;
    int _2014 = _1988 * int(_1958);
    int _2016 = _2014 + _1766;
    bool _2018 = uint(_2000) >= uint(_374);
    float _2020 = float(uint(_2016));
    bool _2022 = !_2018;
    int _2024 = _2022 ? 0 : (-1);
    float _2026 = as_type<float>(_1623) * _2020;
    int _2028 = ~_1982;
    int _2030 = _2028 + _2024;
    int _2032 = _2030 + 1;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2038 = trunc(_2026);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2046 = _1990 + 0.5;
    float _2048 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = _2002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2056 = _2004;
    float _2058 = _2008;
    float _2060 = _2006;
    if (!_2012)
    {
        float _2062 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2004);
        _2056 = _2062;
    }
    float _2064 = _2056;
    int _2066 = _374 * _2032;
    int _2068 = _2066 + _1788;
    if (!_2012)
    {
        float _2070 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2058 = _2070;
    }
    float _2072 = _2058;
    int _2074 = ~_374;
    int _2076 = _2074 + 1;
    if (!_2012)
    {
        float _2078 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2006);
        _2060 = _2078;
    }
    float _2080 = _2060;
    out.m_79.x = _2046;
    out.m_79.y = _1890;
    bool _2082 = !_1597;
    int _2084 = _2082 ? _2068 : (-1);
    float _2086 = _832 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _832 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2090 = int(_1958) + int(_2042);
    out.m_81.x = _2048;
    out.m_81.y = _2050;
    out.m_81.z = _2052;
    out.m_81.w = _2054;
    float _2092 = _832 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2094 = -_818;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    int _2098 = _2084 & 3;
    bool _2100 = _2098 != 0;
    int _2102 = _2084 >> 31;
    float _2104 = _854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2106 = _854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2104);
    float _2110 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    int _2112 = _2076 * _2090;
    int _2114 = _2112 + _1766;
    float _2116 = -_818;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    int _2120 = _2102 & 3;
    float _2122 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2124 = -_818;
    float _2126 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2092);
    bool _2128 = uint(_2114) >= uint(_374);
    float _2130 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2096);
    int _2132 = _2084 + _2120;
    float _2134 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2118);
    float _2136 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2122);
    float _2138 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    int _2140 = _2132 >> 2;
    float _2142 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2146 = _2134 * _2080;
    int _2148 = _2140 << 4;
    int _2150 = _2148 + 368;
    float _2152 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    int _2154 = _2084 & 3;
    bool _2156 = _2154 != 0;
    float _2158 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    uint _2160 = uint(int(uint(_2150) >> uint(2)));
    uint _2162 = uint(int(uint(int(_2160)) >> uint(2)));
    int _2164 = int(_2160) & 3;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[int(_2162)][_2164];
    int _2168 = int(_2160) + 1;
    uint _2170 = uint(int(uint(_2168) >> uint(2)));
    int _2172 = _2168 & 3;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[int(_2170)][_2172];
    float _2176 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2152);
    bool _2178 = !_2128;
    int _2180 = _2178 ? 0 : (-1);
    float _2182 = abs(_1142);
    float _2184 = log2(_2182);
    bool _2186 = uint(_2154) > 1u;
    float _2188 = _2130 * _2080;
    float _2190 = _2138 * _2080;
    int _2192 = _2100 ? 0 : 1;
    int _2194 = _2150 + 8;
    uint _2196 = uint(int(uint(_2194) >> uint(2)));
    uint _2198 = uint(int(uint(int(_2196)) >> uint(2)));
    int _2200 = int(_2196) & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = int(_2196) + 1;
    uint _2206 = uint(int(uint(_2204) >> uint(2)));
    int _2208 = _2204 & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = ~_2090;
    int _2214 = _2212 + _2180;
    int _2216 = _2214 + 1;
    float _2218 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    int _2220 = ~_2192;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = fma(_2176, _2064, _2146);
    bool _2228 = uint(_2154) >= 2u;
    float _2230 = fma(_2218, _2064, _2188);
    float _2232 = -_1564;
    float _2234 = _2232 + 1.0;
    int _2236 = _2224;
    if (!_2186)
    {
        int _2238 = ~_2192;
        int _2240 = _2238 + 1;
        _2236 = _2240;
    }
    int _2242 = _2236;
    float _2244 = fma(_1621, _2072, _2230);
    bool _2246 = _2154 != 3;
    float _2248 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2250 = abs(_2242);
    float _2252 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2158);
    bool _2254 = !_2156;
    int _2256 = _2254 ? 0 : 1;
    float _2258 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2108);
    int _2260 = _2228 ? 0 : 1;
    float _2262 = exp2(_2248);
    float _2264 = fma(_2252, _2064, _2190);
    int _2266 = abs(_2256);
    float _2268 = fma(_2258, _2072, _2226);
    int _2270 = ~_2260;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    float _2276 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    bool _2278 = _2154 != 3;
    int _2280 = _374 * _2216;
    int _2282 = _2280 + _1766;
    int _2284 = _2274;
    if (_2246)
    {
        int _2286 = ~_2260;
        int _2288 = _2286 + 1;
        _2284 = _2288;
    }
    int _2290 = _2284;
    float _2292 = fma(_2276, _2072, _2264);
    int _2294 = ~_2250;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    bool _2300 = !_2278;
    int _2302 = _2300 ? 0 : (-1);
    float _2304 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    int _2308 = abs(_2290);
    out.m_83.x = _2268;
    out.m_83.y = _2244;
    out.m_83.z = _2292;
    int _2310 = ~_2266;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = abs(_2302);
    int _2318 = _2298 * as_type<int>(_2174);
    bool _2320 = !_1806;
    int _2322 = _2320 ? 0 : 1;
    int _2324 = _2314 * as_type<int>(_2166);
    int _2326 = _2324 + _2318;
    int _2328 = abs(_2322);
    float _2330 = _1508 + _1490;
    int _2332 = ~_2308;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    float _2338 = _2330 * 0.5;
    int _2340 = ~_2316;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    int _2346 = _2336 * as_type<int>(_2202);
    int _2348 = _2346 + _2326;
    bool _2350 = _1142 <= 8000.0;
    bool _2352 = isnan(_1142);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(8000.0);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    int _2362 = _2344 * as_type<int>(_2210);
    int _2364 = _2362 + _2348;
    float _2366 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2368 = fma(_2306, -2.0, 3.0);
    float _2370 = _2306 * _2306;
    float _2372 = in.m_85.x;
    float _2374 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2376 = ~_2328;
    int _2378 = _2376 + 1;
    int _2380 = _2378 + 1;
    float _2382 = exp2(_2366);
    float _2384 = _2370 * _2368;
    float _2386 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2374);
    bool _2388 = !_1597;
    int _2390 = _2388 ? _2282 : (-1);
    int _2392 = _2364 * _2380;
    float _2394 = -_2384;
    float _2396 = _2394 + 1.0;
    float _2398 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2386);
    int _2400 = _2390 * _2328;
    int _2402 = _2400 + _2392;
    float _2404 = fma(_2396, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2384);
    float _2406 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    float _2408 = _1490 * 0.5;
    float _2410 = _2360 * _2404;
    float _2412 = _2406 + _1490;
    float _2414 = fma(_1540, -0.5, _2408);
    float _2416 = -_2382;
    float _2418 = _2416 + 1.0;
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1508;
    out.gl_Position.y = _1540;
    out.gl_Position.z = _2406;
    out.gl_Position.w = _1490;
    float _2422 = _2412 * 0.5;
    float _2424 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2426 = _2234 * _2420;
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    bool _2430 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2432 = isnan(_1290);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2438 = _2434 || _2436;
    float _2440 = _2424 * _1566;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_87.x = _2338;
    out.m_87.y = _2414;
    out.m_87.z = _2422;
    out.m_87.w = _1490;
    float _2446 = float(_2402);
    float _2448 = _1587 * _2440;
    float _2450 = _2444 * _2372;
    float _2452 = _1577 * _2440;
    float _2454 = -_2424;
    float _2456 = _2454 + 1.0;
    float _2458 = _2450 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2446;
    float _2460 = fma(_1583, _2452, _1571);
    float _2462 = fma(_1585, _2452, _1573);
    float _2464 = _1577 * _2456;
    float _2466 = fma(_1577, _2448, _1575);
    out.m_91.x = _2458;
    float _2468 = _1194 * _1250;
    float _2470 = _2424;
    float _2472 = _2446;
    float _2474 = _2406;
    float _2476 = _2452;
    float _2478 = _2468;
    if (!_2438)
    {
        _2470 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2480 = _2470;
    out.m_93.x = _2460;
    out.m_93.y = _2462;
    out.m_93.z = _2466;
    out.m_93.w = _2464;
    float _2482 = _2468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2484 = _2480;
    float _2486 = _2480;
    if (!_2438)
    {
        _2472 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2488 = _2472;
    float _2490 = _2488;
    float _2492 = _2488;
    if (!_2438)
    {
        _1798 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2494 = _1798;
    float _2496 = _2494;
    float _2498 = _2494;
    if (!_2438)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2500 = _2474;
    float _2502 = _2500;
    float _2504 = _2500;
    if (!_2438)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2506 = _2476;
    float _2508 = _2506;
    float _2510 = _2506;
    if (!_2438)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2512 = _2478;
    bool _2514 = !_2438;
    float _2516 = _2512;
    float _2518 = _2512;
    if (!_2514)
    {
        bool _2520 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2522 = isnan(_1290);
        bool _2524 = _2520 || _2522;
        bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2528 = _2524 || _2526;
        if (!_2528)
        {
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2532 = _1290 + _2530;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2534;
            float _2538 = 1.0 / _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2560 = _2532 * _2538;
            float _2562 = precise::clamp(_2560, 0.0, 1.0);
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2568 = fma(_2562, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2492 = _2570;
            _2510 = _2576;
            _2486 = _2568;
            _2504 = _2574;
            _2498 = _2572;
            _2518 = _2578;
            _2580 = true;
        }
        else
        {
            bool _2582 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2584 = isnan(_1290);
            bool _2586 = _2582 || _2584;
            bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2590 = _2586 || _2588;
            if (!_2590)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2592 = _2484;
            _2486 = _2592;
            if (!_2590)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2594 = _2490;
            _2492 = _2594;
            if (!_2590)
            {
                _2496 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2596 = _2496;
            _2498 = _2596;
            if (!_2590)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2598 = _2502;
            _2504 = _2598;
            if (!_2590)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2600 = _2508;
            _2510 = _2600;
            if (!_2590)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2602 = _2516;
            bool _2604 = !_2590;
            _2518 = _2602;
            if (!_2604)
            {
                bool _2606 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2608 = isnan(_1290);
                bool _2610 = _2606 || _2608;
                bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2614 = _2610 || _2612;
                if (!_2614)
                {
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2618 = _1290 + _2616;
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2620;
                    float _2624 = 1.0 / _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2646 = _2618 * _2624;
                    float _2648 = precise::clamp(_2646, 0.0, 1.0);
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2654 = fma(_2648, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2656 = fma(_2648, _2652, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2658 = fma(_2648, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2648, _2636, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2662 = fma(_2648, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2664 = fma(_2648, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2492 = _2656;
                    _2510 = _2662;
                    _2486 = _2654;
                    _2504 = _2660;
                    _2498 = _2658;
                    _2518 = _2664;
                    _2580 = true;
                }
                else
                {
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2498 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2580 = false;
    float _2666 = _2492;
    float _2668 = _2510;
    float _2670 = _2486;
    float _2672 = _2504;
    float _2674 = _2498;
    float _2676 = _2518;
    float _2678 = fma(_2244, -0.5, 0.5);
    float _2680 = precise::clamp(_2678, 0.0, 1.0);
    float _2682 = -_2666;
    float _2684 = _2682 + _2668;
    float _2686 = _2482 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = fma(_2680, _2684, _2666);
    out.m_95.x = 0.0;
    float _2694 = -_2674;
    float _2696 = _2694 + _2676;
    float _2698 = fma(_2680, _2690, _2670);
    float _2700 = _2692 * 0.586610972881317138671875;
    out.m_53.x = _2686;
    bool _2702 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2704 = fma(_2680, _2696, _2674);
    float _2706 = fma(_2698, 0.298911988735198974609375, _2700);
    bool _2708 = _1194 > 0.0;
    bool _2710 = isnan(_1194);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(0.0);
    bool _2716 = _2712 || _2714;
    float _2718 = fma(_2704, 0.114477999508380889892578125, _2706);
    bool _2720 = _1250 <= 0.0;
    bool _2722 = !_2716;
    bool _2724 = _2720 || _2722;
    float _2726 = -_2718;
    float _2728 = _2698 + _2726;
    float _2730 = -_2718;
    float _2732 = _2692 + _2730;
    float _2734 = -_2718;
    float _2736 = _2704 + _2734;
    float _2738 = fma(_2728, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2740 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2742 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    bool _2744 = !_2702;
    if (!_2744)
    {
        float _2746 = -_1128;
        float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2750 = -_1130;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2754 = -_1132;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2758 = _2748 * _2748;
        float _2760 = fma(_2752, _2752, _2758);
        float _2762 = fma(_2756, _2756, _2760);
        float _2764 = sqrt(_2762);
        float _2766 = rsqrt(_2762);
        float _2768 = -_2764;
        float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2772 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2774 = precise::clamp(_2772, 0.0, 1.0);
        float _2776 = _2752 * _2766;
        float _2778 = _2748 * _2766;
        float _2780 = abs(_2774);
        float _2782 = log2(_2780);
        float _2784 = _2756 * _2766;
        float _2786 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2788 = _2244 * _2778;
        float _2790 = -_2778;
        float _2792 = -_2786;
        float _2794 = fma(_2790, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2792);
        float _2796 = fma(_2268, _2776, _2788);
        float _2798 = -_2784;
        float _2800 = fma(_2798, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2794);
        float _2802 = fma(_2292, _2784, _2796);
        float _2804 = precise::clamp(_2802, 0.0, 1.0);
        float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2808 = _2800 + _2806;
        float _2810 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2812 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2814 = precise::clamp(_2812, 0.0, 1.0);
        float _2816 = exp2(_2810);
        float _2818 = _2816 * _2814;
        float _2820 = _2804 * _2818;
        float _2822 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2824 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2826 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2822;
        out.m_95.y = _2824;
        out.m_95.z = _2826;
    }
    out.m_67.x = _2738;
    out.m_67.y = _2740;
    out.m_67.z = _2742;
    if (!_2724)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2828 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2828;
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
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2580 = false;
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
    float _128 = _111;
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
        float _2896 = as_type<float>(_138);
        out.gl_Position.z = _2896;
    }
    if (!_124)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _2951 = as_type<float>(_164);
        out.gl_Position.z = _2951;
    }
    if (_158)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _230 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _232 = _222 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
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
    out.m_57.y = _232;
    out.m_57.z = _228;
    out.m_57.w = _230;
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
    float _302 = _296 * _266;
    float _304 = _298 * _268;
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
    float _336 = _302 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _338 = in.m_46.x;
    float _340 = in.m_46.y;
    float _342 = in.m_46.z;
    float _344 = _304 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _348 = in.m_55.z;
    float _350 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _352 = int(_350);
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _356 = _336 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _358 = _306 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    bool _360 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _362 = isnan(0.0);
    bool _364 = _360 || _362;
    bool _366 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _368 = _364 || _366;
    float _370 = _334 * _120;
    float _372 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _374 = int(_372);
    float _376 = _328 * 2.0;
    float _378 = _328 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _380 = _330 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _382 = _330 + _328;
    float _384 = exp2(_370);
    float _386 = -_346;
    float _388 = fma(_378, 2.0, _386);
    float _390 = fma(_380, -2.0, _354);
    float _392 = _340 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _394 = _340 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _396 = _340 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _398 = _330 * 2.0;
    float _400 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[4].x, _392);
    float _402 = floor(_376);
    float _404 = _382 + (-1.0);
    float _406 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[5].x, _394);
    float _408 = fma(_338, (*spvDescriptorSet0.vp_c10)._m0[6].x, _396);
    float _410 = _330 + _348;
    float _412 = _348 * 2.0;
    float _414 = float(_352);
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _418 = _410 + (-1.0);
    float _420 = floor(_398);
    float _422 = -_384;
    float _424 = _422 + 1.0;
    float _426 = float(_374);
    float _428 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[76].y, _390);
    float _430 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[4].z, _400);
    float _432 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[5].z, _406);
    float _434 = _368 ? _424 : 0.0;
    float _436 = _426 * _120;
    bool _438 = _402 > 0.0;
    float _440 = floor(_412);
    bool _442 = _402 >= 0.0;
    bool _444 = isnan(_402);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = fma(_418, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _456 = 1.0 + _454;
    float _458 = 1.0 / _414;
    float _460 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _462 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _464 = isnan(1.0);
    bool _466 = _462 || _464;
    bool _468 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _470 = _466 || _468;
    float _472 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _474 = _420 > 0.0;
    float _476 = fma(_328, (*spvDescriptorSet0.vp_c9)._m0[78].z, _460);
    int _478 = _450 ? 0 : 1;
    float _480 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[78].w, _472);
    float _482 = 1.0 / _456;
    bool _484 = _420 >= 0.0;
    bool _486 = isnan(_420);
    bool _488 = _484 || _486;
    bool _490 = isnan(0.0);
    bool _492 = _488 || _490;
    float _494 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].z, _476);
    bool _496 = _440 > 0.0;
    float _498 = fma(_120, (*spvDescriptorSet0.vp_c9)._m0[77].w, _480);
    bool _500 = _440 >= 0.0;
    bool _502 = isnan(_440);
    bool _504 = _500 || _502;
    bool _506 = isnan(0.0);
    bool _508 = _504 || _506;
    float _510 = -_120;
    float _512 = fma(_510, (*spvDescriptorSet0.vp_c9)._m0[76].x, _388);
    int _514 = _492 ? 0 : 1;
    float _516 = _458 * _120;
    int _518 = ~_478;
    int _520 = _518 + 1;
    int _522 = _520 + 1;
    float _524 = _430 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _526 = _522;
    float _528 = _326;
    if (!_438)
    {
        int _530 = ~_478;
        int _532 = _530 + 1;
        _526 = _532;
    }
    int _534 = _526;
    float _536 = fma(_342, (*spvDescriptorSet0.vp_c10)._m0[6].z, _408);
    float _538 = _432 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _540 = _508 ? 0 : 1;
    if (_470)
    {
        float _542 = _434 * _482;
        _130 = _542;
    }
    float _544 = _130;
    int _546 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _548 = _546 != 0;
    int _550 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _552 = _550 != 0;
    int _554 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _556 = _554 != 0;
    float _558 = _536 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _560 = ~_514;
    int _562 = _560 + 1;
    int _564 = _562 + 1;
    int _566 = _564;
    if (!_474)
    {
        int _568 = ~_514;
        int _570 = _568 + 1;
        _566 = _570;
    }
    int _572 = _566;
    bool _574 = !_552;
    int _576 = _574 ? 0 : 1;
    float _578 = in.m_61.x;
    float _580 = in.m_61.y;
    float _582 = in.m_61.z;
    bool _584 = !_548;
    int _586 = _584 ? 0 : 1;
    bool _588 = !_556;
    int _590 = _588 ? 0 : 1;
    int _592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _594 = _592 != 0;
    int _596 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _598 = _596 != 0;
    int _600 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _602 = _600 != 0;
    float _604 = float(_534);
    float _606 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _608 = _558 + _606;
    int _610 = ~_540;
    int _612 = _610 + 1;
    int _614 = _612 + 1;
    bool _616 = !_594;
    int _618 = _616 ? 0 : 1;
    bool _620 = !_598;
    int _622 = _620 ? 0 : 1;
    int _624 = abs(_618);
    float _626 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _628 = _538 + _626;
    int _630 = abs(_622);
    float _632 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _634 = _524 + _632;
    int _636 = _614;
    if (!_496)
    {
        int _638 = ~_540;
        int _640 = _638 + 1;
        _636 = _640;
    }
    int _642 = _636;
    float _644 = _628 * _628;
    float _646 = float(_630);
    float _648 = fma(_634, _634, _644);
    float _650 = float(_642);
    float _652 = _646 * _604;
    float _654 = float(_624);
    float _656 = fma(_608, _608, _648);
    bool _658 = !_602;
    int _660 = _658 ? 0 : 1;
    float _662 = _652 * (-2.0);
    float _664 = _330 + (-0.5);
    float _666 = sqrt(_656);
    float _668 = _654 * _650;
    float _670 = fma(_662, _580, _580);
    int _672 = abs(_660);
    float _674 = fma(_452, _662, _452);
    float _676 = float(_572);
    float _678 = fma(_664, (*spvDescriptorSet0.vp_c9)._m0[196].y, _670);
    float _680 = _348 + _328;
    float _682 = rsqrt(_656);
    float _684 = float(_672);
    float _686 = _668 * (-2.0);
    float _688 = _680 + (-1.0);
    float _690 = _348 + (-0.5);
    float _692 = fma(_674, _544, _678);
    float _694 = _684 * _676;
    float _696 = fma(_688, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _698 = _666 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _700 = _328 + (-0.5);
    float _702 = fma(_686, _578, _578);
    float _704 = _694 * (-2.0);
    float _706 = fma(_416, _686, _416);
    float _708 = precise::min(_356, _698);
    float _710 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[196].x, _702);
    float _712 = fma(_696, _704, _696);
    float _714 = fma(_704, _582, _582);
    float _716 = _692 * 0.15915493667125701904296875;
    float _718 = _682 * _708;
    float _720 = fma(_706, _544, _710);
    float _722 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[196].z, _714);
    float _724 = _716 * 6.283185482025146484375;
    float _726 = sin(_724);
    float _728 = _628 * _718;
    float _730 = _634 * _718;
    float _732 = _608 * _718;
    float _734 = fma(_712, _544, _722);
    float _736 = -_728;
    float _738 = _628 + _736;
    float _740 = -_730;
    float _742 = _634 + _740;
    float _744 = -_732;
    float _746 = _608 + _744;
    float _748 = _716 * 6.283185482025146484375;
    float _750 = cos(_748);
    float _752 = _738 * _738;
    float _754 = _720 * 0.15915493667125701904296875;
    float _756 = fma(_742, _742, _752);
    bool _758 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _760 = isnan(0.5);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _766 = _762 || _764;
    float _768 = _754 * 6.283185482025146484375;
    float _770 = sin(_768);
    float _772 = fma(_746, _746, _756);
    float _774 = _734 * 0.15915493667125701904296875;
    float _776 = in.m_63.x;
    float _778 = in.m_63.y;
    float _780 = in.m_63.z;
    bool _782 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _784 = isnan(0.5);
    bool _786 = _782 || _784;
    bool _788 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _790 = _786 || _788;
    float _792 = sqrt(_772);
    float _794 = _754 * 6.283185482025146484375;
    float _796 = cos(_794);
    float _798 = _770 * _726;
    float _800 = _770 * _750;
    float _802 = _774 * 6.283185482025146484375;
    float _804 = cos(_802);
    float _806 = _682 * _792;
    float _808 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _778);
    float _810 = _344 * _806;
    float _812 = _336 * _806;
    float _814 = _358 * _806;
    float _816 = _774 * 6.283185482025146484375;
    float _818 = sin(_816);
    float _820 = _796 * _750;
    float _822 = _796 * _726;
    float _824 = _810 * _808;
    float _826 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _780);
    float _828 = _770 * _804;
    float _830 = _750 * _804;
    float _832 = _796 * _804;
    float _834 = _726 * _804;
    float _836 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _776);
    float _838 = _814 * _826;
    float _840 = _828 * _824;
    float _842 = _812 * _836;
    float _844 = fma(_818, _820, _798);
    float _846 = _832 * _824;
    float _848 = -_822;
    float _850 = fma(_818, _800, _848);
    float _852 = -_800;
    float _854 = fma(_818, _822, _852);
    float _856 = -_824;
    float _858 = _818 * _856;
    float _860 = fma(_844, _842, _846);
    float _862 = fma(_818, _798, _820);
    float _864 = fma(_850, _842, _840);
    float _866 = fma(_830, _842, _858);
    float _868 = fma(_854, _838, _860);
    float _870 = -_732;
    float _872 = _558 + _870;
    float _874 = fma(_862, _838, _864);
    float _876 = fma(_834, _838, _866);
    float _878 = _868 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _880 = _868 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _882 = -_728;
    float _884 = _538 + _882;
    float _886 = -_730;
    float _888 = _524 + _886;
    float _890 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[26].x, _878);
    float _892 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[24].x, _880);
    float _894 = _884 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _896 = _868 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _898 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[26].z, _890);
    float _900 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[24].z, _892);
    float _902 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[11].x, _894);
    float _904 = fma(_876, (*spvDescriptorSet0.vp_c8)._m0[25].x, _896);
    float _906 = _898 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _908 = _900 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _910 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[11].z, _902);
    float _912 = fma(_874, (*spvDescriptorSet0.vp_c8)._m0[25].z, _904);
    float _914 = _558 + _906;
    float _916 = _524 + _908;
    float _918 = _910 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _920 = _884 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _922 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _924 = _914 + _922;
    float _926 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _928 = _916 + _926;
    float _930 = 1.0 / _918;
    float _932 = fma(_888, (*spvDescriptorSet0.vp_c8)._m0[10].x, _920);
    float _934 = _924 * _924;
    float _936 = _912 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _938 = fma(_872, (*spvDescriptorSet0.vp_c8)._m0[10].z, _932);
    float _940 = fma(_928, _928, _934);
    float _942 = _538 + _936;
    float _944 = _938 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _946 = sqrt(_940);
    float _948 = _944 + _918;
    float _950 = _948 * _930;
    float _952 = _950 * 0.5;
    float _954 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _956 = fma(_952, (*spvDescriptorSet0.vp_c8)._m0[30].w, _954);
    float _958 = 1.0 / _956;
    bool _960 = _946 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _962 = _876;
    float _964 = _936;
    float _966 = _912;
    float _968 = _956;
    float _970 = _946;
    float _972 = _732;
    float _974 = _728;
    float _976 = _930;
    float _978 = _916;
    if (!_960)
    {
        _962 = _916;
    }
    float _980 = _962;
    float _982 = _980;
    if (!_960)
    {
        _964 = _914;
    }
    float _984 = _964;
    float _986 = _984;
    if (!_960)
    {
        _966 = _942;
    }
    float _988 = _966;
    bool _990 = !_960;
    float _992 = _988;
    if (!_990)
    {
        float _994 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _998 = _946 + _996;
        float _1000 = _942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1002 = rsqrt(_940);
        float _1004 = _998 * _994;
        float _1006 = _1004 * 0.15915493667125701904296875;
        float _1008 = _1006 * 6.283185482025146484375;
        float _1010 = cos(_1008);
        float _1012 = _1006 * 6.283185482025146484375;
        float _1014 = sin(_1012);
        float _1016 = _1010 + (-1.0);
        float _1018 = _1016 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1020 = fma(_1014, _1000, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1022 = fma(_942, _1010, _1018);
        float _1024 = _1002 * _1020;
        float _1026 = fma(_928, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1028 = fma(_924, _1024, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _982 = _1026;
        _992 = _1022;
        _986 = _1028;
        _968 = _1000;
        _970 = _1006;
    }
    float _1030 = _982;
    float _1032 = _992;
    float _1034 = _986;
    float _1036 = _968;
    float _1038 = _970;
    float _1040 = -_730;
    float _1042 = _1040 + _1030;
    float _1044 = -_728;
    float _1046 = _1044 + _1032;
    float _1048 = -_732;
    float _1050 = _1048 + _1034;
    float _1052 = _1042;
    float _1054 = _1046;
    float _1056 = _1038;
    float _1058 = _1032;
    float _1060 = _1036;
    if (_790)
    {
        _972 = 1.0;
    }
    float _1062 = _972;
    float _1064 = _1062;
    if (_766)
    {
        _974 = _1042;
    }
    float _1066 = _974;
    float _1068 = _1066;
    if (_766)
    {
        _1052 = _1046;
    }
    float _1070 = _1052;
    float _1072 = _1070;
    if (_766)
    {
        _1054 = _1050;
    }
    float _1074 = _1054;
    float _1076 = _1074;
    if (!_766)
    {
        float _1078 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1080 = _884 + _1078;
        float _1082 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1084 = _888 + _1082;
        float _1086 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1088 = _1080 * _1080;
        float _1090 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1092 = _872 + _1090;
        float _1094 = fma(_1084, _1084, _1088);
        float _1096 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1098 = fma(_1092, _1092, _1094);
        float _1100 = sqrt(_1098);
        float _1102 = _1086 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1104 = precise::min(_1100, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1106 = _1104 * _1096;
        float _1108 = -_524;
        float _1110 = _1108 + _1030;
        float _1112 = -_538;
        float _1114 = _1112 + _1032;
        float _1116 = -_558;
        float _1118 = _1116 + _1034;
        float _1120 = _1102 * _1106;
        float _1122 = fma(_1110, _1120, _888);
        float _1124 = fma(_1114, _1120, _884);
        float _1126 = fma(_1118, _1120, _872);
        _1072 = _1124;
        _1068 = _1122;
        _1076 = _1126;
        _1056 = _1096;
    }
    float _1128 = _1072;
    float _1130 = _1068;
    float _1132 = _1076;
    float _1134 = _1056;
    float _1136 = _1134;
    if (_790)
    {
        _976 = 1.0;
    }
    float _1138 = _976;
    float _1140 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1142 = _958 * _1140;
    float _1144 = _1138;
    if (!_790)
    {
        float _1146 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1148 = _1146 * 0.15915493667125701904296875;
        float _1150 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1152 = _1148 * 6.283185482025146484375;
        float _1154 = cos(_1152);
        float _1156 = _1150 * 0.15915493667125701904296875;
        float _1158 = _1148 * 6.283185482025146484375;
        float _1160 = sin(_1158);
        float _1162 = 1.0 / _1154;
        float _1164 = _1156 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        float _1168 = _1160 * _1162;
        float _1170 = _1156 * 6.283185482025146484375;
        float _1172 = sin(_1170);
        float _1174 = _1166 * _1168;
        float _1176 = 1.0 / _1174;
        float _1178 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1180 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1178;
        float _1182 = 1.0 / _1180;
        float _1184 = _1172 * _1176;
        float _1186 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1188 = fma(_1142, _1184, _1186);
        float _1190 = _1188 * _1182;
        float _1192 = precise::clamp(_1190, 0.0, 1.0);
        _1064 = _1192;
    }
    float _1194 = _1064;
    if (!_790)
    {
        float _1196 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1198 = _1196 * 0.15915493667125701904296875;
        float _1200 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1202 = _1198 * 6.283185482025146484375;
        float _1204 = cos(_1202);
        float _1206 = _1200 * 0.15915493667125701904296875;
        float _1208 = _1198 * 6.283185482025146484375;
        float _1210 = sin(_1208);
        float _1212 = 1.0 / _1204;
        float _1214 = _1206 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = _1210 * _1212;
        float _1220 = _1206 * 6.283185482025146484375;
        float _1222 = sin(_1220);
        float _1224 = _1216 * _1218;
        float _1226 = 1.0 / _1224;
        float _1228 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1230 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1228;
        float _1232 = 1.0 / _1230;
        float _1234 = _1222 * _1226;
        float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1238 = fma(_1142, _1234, _1236);
        float _1240 = _1238 * _1232;
        float _1242 = precise::clamp(_1240, 0.0, 1.0);
        float _1244 = -_1242;
        float _1246 = _1244 + 1.0;
        _1058 = _1226;
        _1144 = _1246;
    }
    float _1248 = _1058;
    float _1250 = _1144;
    float _1252 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1254 = _1128 + _1252;
    float _1256 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1258 = _1130 + _1256;
    float _1260 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1262 = _1132 + _1260;
    float _1264 = _1254 * _1254;
    float _1266 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1268 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1270 = fma(_1258, _1258, _1264);
    float _1272 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1266);
    float _1274 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1268);
    float _1276 = fma(_1262, _1262, _1270);
    float _1278 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1272);
    float _1280 = rsqrt(_1276);
    float _1282 = _1278 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1284 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1274);
    float _1286 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1288 = _1284 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1290 = sqrt(_1276);
    float _1292 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1294 = _1258 * _1292;
    float _1296 = _1262 * _1292;
    float _1298 = _1294 * _1294;
    float _1300 = _1296 * _1296;
    float _1302 = _1298 + _1300;
    float _1304 = sqrt(_1302);
    bool _1306 = _1304 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1308 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1310 = _1304 + _1308;
    float _1312 = _1030;
    float _1314 = _1302;
    float _1316 = _1310;
    float _1318 = _1294;
    float _1320 = _1296;
    float _1322 = _1298;
    float _1324 = _1300;
    if (_1306)
    {
        float _1326 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1312 = _1326;
    }
    float _1328 = _1312;
    if (_1306)
    {
        float _1330 = rsqrt(_1302);
        _1314 = _1330;
    }
    float _1332 = _1314;
    if (_1306)
    {
        float _1334 = _1310 * _1328;
        _1316 = _1334;
    }
    float _1336 = _1316;
    if (_1306)
    {
        float _1338 = _1336 * 0.15915493667125701904296875;
        _978 = _1338;
    }
    float _1340 = _978;
    float _1342 = _1328;
    if (_1306)
    {
        float _1344 = _1340 * 6.283185482025146484375;
        float _1346 = sin(_1344);
        _1342 = _1346;
    }
    float _1348 = _1342;
    float _1350 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1352 = precise::max(0.0, _1350);
    float _1354 = _1248;
    if (_1306)
    {
        float _1356 = _1340 * 6.283185482025146484375;
        float _1358 = cos(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = -_1292;
    float _1364 = -_1352;
    float _1366 = fma(_1254, _1362, _1364);
    if (_1306)
    {
        float _1368 = _1366 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1060 = _1368;
    }
    float _1370 = _1060;
    float _1372 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1374 = fma(_888, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1376 = _1370;
    float _1378 = _1348;
    if (_1306)
    {
        float _1380 = fma(_1348, _1370, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1376 = _1380;
    }
    float _1382 = _1376;
    float _1384 = _1382;
    if (!_1306)
    {
        _1378 = _1366;
    }
    float _1386 = _1378;
    float _1388 = floor(_1374);
    float _1390 = _1386;
    if (_1306)
    {
        float _1392 = _1360 + (-1.0);
        _1136 = _1392;
    }
    float _1394 = _1136;
    float _1396 = _1394;
    if (_1306)
    {
        float _1398 = _1332 * _1382;
        _1384 = _1398;
    }
    float _1400 = _1384;
    if (_1306)
    {
        float _1402 = _1394 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1396 = _1402;
    }
    float _1404 = _1396;
    if (_1306)
    {
        float _1406 = _1294 * _1400;
        _1318 = _1406;
    }
    float _1408 = _1318;
    if (_1306)
    {
        float _1410 = _1296 * _1400;
        _1320 = _1410;
    }
    float _1412 = _1320;
    if (_1306)
    {
        float _1414 = fma(_1366, _1360, _1404);
        _1390 = _1414;
    }
    float _1416 = _1390;
    if (_1306)
    {
        float _1418 = _1408 * _1408;
        _1322 = _1418;
    }
    float _1420 = _1322;
    if (_1306)
    {
        float _1422 = _1412 * _1412;
        _1324 = _1422;
    }
    float _1424 = _1324;
    float _1426 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1372);
    float _1428 = fma(_1416, _1416, _1420);
    float _1430 = fma(_872, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1432 = _1128 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1434 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1426);
    float _1436 = _1428 + _1424;
    float _1438 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1440 = fma(_1290, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1438);
    float _1442 = precise::clamp(_1440, 0.0, 1.0);
    float _1444 = fma(_1130, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1432);
    float _1446 = _1434 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1448 = rsqrt(_1436);
    float _1450 = -_1442;
    float _1452 = _1450 + 1.0;
    float _1454 = fma(_1132, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1444);
    float _1456 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1458 = -_1388;
    float _1460 = _1374 + _1458;
    float _1462 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1464 = _1454 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1466 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1468 = abs(_1452);
    float _1470 = log2(_1468);
    float _1472 = -_1286;
    float _1474 = fma(_1472, _1456, 1.0);
    float _1476 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1478 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1466);
    float _1480 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1462);
    float _1482 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1478);
    float _1484 = _1448 * _1408;
    float _1486 = floor(_1430);
    float _1488 = _1448 * _1412;
    float _1490 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1482);
    float _1492 = _1448 * _1416;
    float _1494 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1496 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1480);
    float _1498 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1500 = -_1494;
    float _1502 = fma(_1492, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1500);
    float _1504 = 1.0 / _1490;
    float _1506 = _1492 + 1.0;
    float _1508 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1496);
    float _1510 = -_1488;
    float _1512 = fma(_1510, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1502);
    float _1514 = fma(_1512, -0.5, 0.5);
    float _1516 = exp2(_1498);
    float _1518 = fma(_1512, 0.5, 0.5);
    float _1520 = -_1486;
    float _1522 = _1430 + _1520;
    float _1524 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1476);
    float _1526 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1524);
    float _1528 = log2(_1474);
    float _1530 = fma(_1518, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1532 = fma(_1518, _1530, -0.212114393711090087890625);
    float _1534 = sqrt(_1514);
    float _1536 = -_1492;
    float _1538 = fma(_1516, _1506, _1536);
    float _1540 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1526);
    float _1542 = _1508 * _1504;
    float _1544 = fma(_1518, _1532, 1.570728778839111328125);
    float _1546 = _1540 * _1504;
    float _1548 = _1528 * 0.693147182464599609375;
    float _1550 = fma(_1546, -0.5, 0.5);
    float _1552 = fma(_1538, 0.5, 0.5);
    float _1554 = _1548 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1556 = _1534 * 0.636619746685028076171875;
    float _1558 = fma(_1542, 0.5, 0.5);
    float _1560 = -_1544;
    float _1562 = fma(_1556, _1560, 1.0);
    float2 _5120 = float2(_1460, _1522);
    float _1564 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5120, float2(0.0), isnan(_5120)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5120, float2(0.0), isnan(_5120)), level(0.0)).x;
    float3 _5131 = float3(_1558, _1550, _1554);
    float _1566 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5131, float3(0.0), isnan(_5131)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5131, float3(0.0), isnan(_5131)), level(0.0)).x;
    float3 _5142 = float3(_1558, _1550, _1554);
    float4 _1569 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5142, float3(0.0), isnan(_5142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5142, float3(0.0), isnan(_5142)), level(0.0)).xyzw;
    float _1571 = _1569.x;
    float _1573 = _1569.y;
    float _1575 = _1569.z;
    float _1577 = _1569.w;
    float2 _5158 = float2(_1562, _1552);
    float3 _1581 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5158, float2(0.0), isnan(_5158)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5158, float2(0.0), isnan(_5158)), level(0.0)).xyz;
    float _1583 = _1581.x;
    float _1585 = _1581.y;
    float _1587 = _1581.z;
    float _1589 = float(uint(_374));
    float _1591 = trunc(_516);
    int _1593 = int(_1591);
    float _1595 = _436 * _166;
    bool _1597 = _374 == 0;
    out.m_65.x = _888;
    out.m_65.y = _884;
    out.m_65.z = _872;
    int _1599 = abs(_576);
    int _1601 = abs(_586);
    out.m_67.w = _708;
    float _1603 = 1.0 / _1589;
    int _1605 = ~_374;
    int _1607 = _1605 + 1;
    out.m_69.x = _812;
    float _1609 = _854 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1611 = float(uint(_1593));
    float _1613 = trunc(_1595);
    int _1615 = int(_1613);
    float _1617 = float(_1593);
    float _1619 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1609);
    out.m_71.x = _1130;
    out.m_71.y = _1128;
    out.m_71.z = _1132;
    float _1621 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1619);
    int _1623 = as_type<int>(_1603) + (-2);
    float _1625 = as_type<float>(_1623) * _1611;
    int _1627 = ~_374;
    int _1629 = _1627 + 1;
    float _1631 = trunc(_1625);
    float _1633 = precise::max(_1631, 0.0);
    uint _1636 = uint(_1633);
    int _1638 = _1607 * int(_1636);
    int _1640 = _1638 + _1593;
    float _1642 = float(uint(_1640));
    float _1644 = as_type<float>(_1623) * _1642;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1648 = _1646 != 0;
    float _1650 = trunc(_1644);
    float _1652 = precise::max(_1650, 0.0);
    uint _1654 = uint(_1652);
    bool _1656 = !_1648;
    float _1658 = _1656 ? 7.345489978790283203125 : 1.0;
    float _1660 = _1658 * _328;
    bool _1662 = _1617 >= _426;
    bool _1664 = isnan(_1617);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(_426);
    bool _1670 = _1666 || _1668;
    float _1672 = float(_1670);
    float _1674 = floor(_1660);
    int _1676 = int(_1636) + int(_1654);
    float _1678 = trunc(_1672);
    int _1680 = int(_1678);
    int _1682 = _1629 * _1676;
    int _1684 = _1682 + _1593;
    bool _1686 = uint(_1684) >= uint(_374);
    float _1688 = -_1674;
    float _1690 = _1660 + _1688;
    bool _1692 = !_1686;
    int _1694 = _1692 ? 0 : (-1);
    int _1696 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1698 = _1696 != 0;
    int _1700 = ~_1676;
    int _1702 = _1700 + _1694;
    int _1704 = _1702 + 1;
    float _1706 = _1690 * _426;
    int _1708 = _374 + (-1);
    int _1710 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1712 = _1710 != 0;
    int _1714 = _374 * _1704;
    int _1716 = _1714 + _1593;
    float _1718 = trunc(_1706);
    int _1720 = int(_1718);
    int _1722 = ~_1680;
    int _1724 = _1722 + 1;
    int _1726 = _1724 + 1;
    int _1728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1730 = _1728 != 0;
    bool _1732 = !_1597;
    int _1734 = _1732 ? _1716 : (-1);
    bool _1736 = !_1698;
    int _1738 = _1736 ? 0 : 1;
    int _1740 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1742 = _1740 != 0;
    int _1744 = _1734 * _1726;
    int _1746 = abs(_1738);
    int _1748 = ~_374;
    int _1750 = _1748 + 1;
    int _1752 = _1680 * _1708;
    int _1754 = _1752 + _1744;
    bool _1756 = !_1742;
    int _1758 = _1756 ? 0 : 1;
    int _1760 = abs(_590);
    int _1762 = _1754 * _1599;
    int _1764 = _1720 * _1746;
    int _1766 = _1764 + _1593;
    int _1768 = abs(_1758);
    float _1770 = in.m_73.y;
    int _1772 = _1615 * _1601;
    int _1774 = _1772 + _1762;
    bool _1776 = _330 > 0.5;
    int _1778 = _1766 * _1760;
    int _1780 = _1778 + _1774;
    float _1782 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1784 = _1782 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1786 = _1720 * _1768;
    int _1788 = _1786 + _1780;
    float _1790 = in.m_73.x;
    float _1792 = 1.0 / _1784;
    float _1794 = float(uint(_1788));
    float _1796 = as_type<float>(_1768);
    float _1798 = _1490;
    if (_1712)
    {
        float _1800 = in.m_55.x;
        _1796 = _1800;
    }
    float _1802 = _1796;
    int _1804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1806 = _1804 != 0;
    float _1808 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1810 = _1808 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1812 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1814 = isnan(_326);
    bool _1816 = _1812 || _1814;
    bool _1818 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1820 = _1816 || _1818;
    float _1822 = float(_1820);
    float _1824 = as_type<float>(_1623) * _1794;
    float _1826 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1828 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1826;
    float _1830 = float(uint(_1766));
    float _1832 = -_1770;
    float _1834 = _1832 + 1.0;
    float _1836 = trunc(_1824);
    float _1838 = precise::max(_1836, 0.0);
    uint _1840 = uint(_1838);
    out.m_75.x = 1.0;
    out.m_75.y = 1.0;
    out.m_75.z = 1.0;
    float _1842 = as_type<float>(_1623) * _1830;
    float _1844 = _1770;
    if (_1730)
    {
        float _1846 = _1776 ? _1834 : _1770;
        _1844 = _1846;
    }
    float _1848 = _1844;
    bool _1850 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1852 = isnan(_326);
    bool _1854 = _1850 || _1852;
    bool _1856 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1858 = _1854 || _1856;
    float _1860 = float(_1858);
    float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1864 = -_428;
    float _1866 = fma(_498, _1862, _1864);
    float _1868 = _1828 * _1792;
    float _1870 = -_1822;
    float _1872 = _1870 + 1.0;
    float _1874 = 1.0 / _1810;
    int _1876 = _1750 * int(_1840);
    int _1878 = _1876 + _1788;
    bool _1880 = _1802 > 0.5;
    bool _1882 = _1880 && _1712;
    float _1884 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1886 = _326 + _1884;
    float _1888 = _1860 * _1872;
    float _1890 = _1866 + 0.5;
    float _1892 = float(uint(_1878));
    bool _1894 = _326 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1896 = isnan(_326);
    bool _1898 = _1894 || _1896;
    bool _1900 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1902 = _1898 || _1900;
    float _1904 = float(_1902);
    float _1906 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1908 = _1906 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1910 = as_type<float>(_1623) * _1892;
    float _1912 = -_1860;
    float _1914 = _1912 + 1.0;
    float _1916 = fma(_1868, _1886, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1918 = _1886;
    if (_1712)
    {
        _1918 = _1790;
    }
    float _1920 = _1918;
    float _1922 = trunc(_1910);
    float _1924 = precise::max(_1922, 0.0);
    uint _1926 = uint(_1924);
    float _1928 = _1908 * _1874;
    float _1930 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1932 = _326 + _1930;
    float _1934 = _1920;
    if (!_1712)
    {
        _528 = _1790;
    }
    float _1936 = _528;
    float _1938 = _1936;
    if (_1882)
    {
        float _1940 = -_1920;
        float _1942 = _1940 + 1.0;
        _1934 = _1942;
    }
    float _1944 = _1934;
    float _1946 = _1904 * _1914;
    float _1948 = -_1904;
    float _1950 = _1948 + 1.0;
    float _1952 = fma(_1928, _1932, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1954 = trunc(_1842);
    float _1956 = precise::max(_1954, 0.0);
    uint _1958 = uint(_1956);
    float _1960 = _1916 * _1946;
    if (_1712)
    {
        _1938 = _1944;
    }
    float _1962 = _1938;
    bool _1964 = _778 != 0.0;
    bool _1966 = isnan(_778);
    bool _1968 = _1964 || _1966;
    bool _1970 = isnan(0.0);
    bool _1972 = _1968 || _1970;
    float _1974 = fma(_1950, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1960);
    int _1976 = ~_374;
    int _1978 = _1976 + 1;
    float _1980 = fma(_1962, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    int _1982 = int(_1840) + int(_1926);
    float _1984 = fma(_1952, _1888, _1974);
    int _1986 = ~_374;
    int _1988 = _1986 + 1;
    float _1990 = fma(_494, _1980, _512);
    bool _1992 = _776 == 0.0;
    bool _1994 = !_1972;
    bool _1996 = _1992 && _1994;
    int _1998 = _1978 * _1982;
    int _2000 = _1998 + _1788;
    float _2002 = fma(_1822, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1984);
    float _2004 = in.m_77.x;
    float _2006 = in.m_77.y;
    float _2008 = in.m_77.z;
    bool _2010 = _780 == 0.0;
    bool _2012 = _2010 && _1996;
    int _2014 = _1988 * int(_1958);
    int _2016 = _2014 + _1766;
    bool _2018 = uint(_2000) >= uint(_374);
    float _2020 = float(uint(_2016));
    bool _2022 = !_2018;
    int _2024 = _2022 ? 0 : (-1);
    float _2026 = as_type<float>(_1623) * _2020;
    int _2028 = ~_1982;
    int _2030 = _2028 + _2024;
    int _2032 = _2030 + 1;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2036 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2038 = trunc(_2026);
    float _2040 = precise::max(_2038, 0.0);
    uint _2042 = uint(_2040);
    float _2044 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2046 = _1990 + 0.5;
    float _2048 = _2034 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2050 = _2036 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2052 = _2044 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2054 = _2002 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2056 = _2004;
    float _2058 = _2008;
    float _2060 = _2006;
    if (!_2012)
    {
        float _2062 = fma(_776, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2004);
        _2056 = _2062;
    }
    float _2064 = _2056;
    int _2066 = _374 * _2032;
    int _2068 = _2066 + _1788;
    if (!_2012)
    {
        float _2070 = fma(_780, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2008);
        _2058 = _2070;
    }
    float _2072 = _2058;
    int _2074 = ~_374;
    int _2076 = _2074 + 1;
    if (!_2012)
    {
        float _2078 = fma(_778, (*spvDescriptorSet0.vp_c9)._m0[17].y, _2006);
        _2060 = _2078;
    }
    float _2080 = _2060;
    out.m_79.x = _2046;
    out.m_79.y = _1890;
    bool _2082 = !_1597;
    int _2084 = _2082 ? _2068 : (-1);
    float _2086 = _832 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2088 = _832 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2090 = int(_1958) + int(_2042);
    out.m_81.x = _2048;
    out.m_81.y = _2050;
    out.m_81.z = _2052;
    out.m_81.w = _2054;
    float _2092 = _832 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2094 = -_818;
    float _2096 = fma(_2094, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2088);
    int _2098 = _2084 & 3;
    bool _2100 = _2098 != 0;
    int _2102 = _2084 >> 31;
    float _2104 = _854 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2106 = _854 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2108 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2104);
    float _2110 = fma(_834, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2106);
    int _2112 = _2076 * _2090;
    int _2114 = _2112 + _1766;
    float _2116 = -_818;
    float _2118 = fma(_2116, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2086);
    int _2120 = _2102 & 3;
    float _2122 = _844 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2124 = -_818;
    float _2126 = fma(_2124, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2092);
    bool _2128 = uint(_2114) >= uint(_374);
    float _2130 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2096);
    int _2132 = _2084 + _2120;
    float _2134 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2118);
    float _2136 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2122);
    float _2138 = fma(_828, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2126);
    int _2140 = _2132 >> 2;
    float _2142 = _844 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2144 = _844 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2146 = _2134 * _2080;
    int _2148 = _2140 << 4;
    int _2150 = _2148 + 368;
    float _2152 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2142);
    int _2154 = _2084 & 3;
    bool _2156 = _2154 != 0;
    float _2158 = fma(_830, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2144);
    uint _2160 = uint(int(uint(_2150) >> uint(2)));
    uint _2162 = uint(int(uint(int(_2160)) >> uint(2)));
    int _2164 = int(_2160) & 3;
    float _2166 = (*spvDescriptorSet0.vp_c9)._m0[int(_2162)][_2164];
    int _2168 = int(_2160) + 1;
    uint _2170 = uint(int(uint(_2168) >> uint(2)));
    int _2172 = _2168 & 3;
    float _2174 = (*spvDescriptorSet0.vp_c9)._m0[int(_2170)][_2172];
    float _2176 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2152);
    bool _2178 = !_2128;
    int _2180 = _2178 ? 0 : (-1);
    float _2182 = abs(_1142);
    float _2184 = log2(_2182);
    bool _2186 = uint(_2154) > 1u;
    float _2188 = _2130 * _2080;
    float _2190 = _2138 * _2080;
    int _2192 = _2100 ? 0 : 1;
    int _2194 = _2150 + 8;
    uint _2196 = uint(int(uint(_2194) >> uint(2)));
    uint _2198 = uint(int(uint(int(_2196)) >> uint(2)));
    int _2200 = int(_2196) & 3;
    float _2202 = (*spvDescriptorSet0.vp_c9)._m0[int(_2198)][_2200];
    int _2204 = int(_2196) + 1;
    uint _2206 = uint(int(uint(_2204) >> uint(2)));
    int _2208 = _2204 & 3;
    float _2210 = (*spvDescriptorSet0.vp_c9)._m0[int(_2206)][_2208];
    int _2212 = ~_2090;
    int _2214 = _2212 + _2180;
    int _2216 = _2214 + 1;
    float _2218 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2136);
    int _2220 = ~_2192;
    int _2222 = _2220 + 1;
    int _2224 = _2222 + 1;
    float _2226 = fma(_2176, _2064, _2146);
    bool _2228 = uint(_2154) >= 2u;
    float _2230 = fma(_2218, _2064, _2188);
    float _2232 = -_1564;
    float _2234 = _2232 + 1.0;
    int _2236 = _2224;
    if (!_2186)
    {
        int _2238 = ~_2192;
        int _2240 = _2238 + 1;
        _2236 = _2240;
    }
    int _2242 = _2236;
    float _2244 = fma(_1621, _2072, _2230);
    bool _2246 = _2154 != 3;
    float _2248 = _2184 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2250 = abs(_2242);
    float _2252 = fma(_850, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2158);
    bool _2254 = !_2156;
    int _2256 = _2254 ? 0 : 1;
    float _2258 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2108);
    int _2260 = _2228 ? 0 : 1;
    float _2262 = exp2(_2248);
    float _2264 = fma(_2252, _2064, _2190);
    int _2266 = abs(_2256);
    float _2268 = fma(_2258, _2072, _2226);
    int _2270 = ~_2260;
    int _2272 = _2270 + 1;
    int _2274 = _2272 + 1;
    float _2276 = fma(_862, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    bool _2278 = _2154 != 3;
    int _2280 = _374 * _2216;
    int _2282 = _2280 + _1766;
    int _2284 = _2274;
    if (_2246)
    {
        int _2286 = ~_2260;
        int _2288 = _2286 + 1;
        _2284 = _2288;
    }
    int _2290 = _2284;
    float _2292 = fma(_2276, _2072, _2264);
    int _2294 = ~_2250;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    bool _2300 = !_2278;
    int _2302 = _2300 ? 0 : (-1);
    float _2304 = fma(_2262, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2306 = precise::clamp(_2304, 0.0, 1.0);
    int _2308 = abs(_2290);
    out.m_83.x = _2268;
    out.m_83.y = _2244;
    out.m_83.z = _2292;
    int _2310 = ~_2266;
    int _2312 = _2310 + 1;
    int _2314 = _2312 + 1;
    int _2316 = abs(_2302);
    int _2318 = _2298 * as_type<int>(_2174);
    bool _2320 = !_1806;
    int _2322 = _2320 ? 0 : 1;
    int _2324 = _2314 * as_type<int>(_2166);
    int _2326 = _2324 + _2318;
    int _2328 = abs(_2322);
    float _2330 = _1508 + _1490;
    int _2332 = ~_2308;
    int _2334 = _2332 + 1;
    int _2336 = _2334 + 1;
    float _2338 = _2330 * 0.5;
    int _2340 = ~_2316;
    int _2342 = _2340 + 1;
    int _2344 = _2342 + 1;
    int _2346 = _2336 * as_type<int>(_2202);
    int _2348 = _2346 + _2326;
    bool _2350 = _1142 <= 8000.0;
    bool _2352 = isnan(_1142);
    bool _2354 = _2350 || _2352;
    bool _2356 = isnan(8000.0);
    bool _2358 = _2354 || _2356;
    float _2360 = float(_2358);
    int _2362 = _2344 * as_type<int>(_2210);
    int _2364 = _2362 + _2348;
    float _2366 = _1470 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2368 = fma(_2306, -2.0, 3.0);
    float _2370 = _2306 * _2306;
    float _2372 = in.m_85.x;
    float _2374 = _1446 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _2376 = ~_2328;
    int _2378 = _2376 + 1;
    int _2380 = _2378 + 1;
    float _2382 = exp2(_2366);
    float _2384 = _2370 * _2368;
    float _2386 = fma(_1464, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2374);
    bool _2388 = !_1597;
    int _2390 = _2388 ? _2282 : (-1);
    int _2392 = _2364 * _2380;
    float _2394 = -_2384;
    float _2396 = _2394 + 1.0;
    float _2398 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2386);
    int _2400 = _2390 * _2328;
    int _2402 = _2400 + _2392;
    float _2404 = fma(_2396, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2384);
    float _2406 = fma(_1288, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    float _2408 = _1490 * 0.5;
    float _2410 = _2360 * _2404;
    float _2412 = _2406 + _1490;
    float _2414 = fma(_1540, -0.5, _2408);
    float _2416 = -_2382;
    float _2418 = _2416 + 1.0;
    float _2420 = _2410 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.gl_Position.x = _1508;
    out.gl_Position.y = _1540;
    out.gl_Position.z = _2406;
    out.gl_Position.w = _1490;
    float _2422 = _2412 * 0.5;
    float _2424 = _2418 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2426 = _2234 * _2420;
    float _2428 = precise::clamp(_2426, 0.0, 1.0);
    bool _2430 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2432 = isnan(_1290);
    bool _2434 = _2430 || _2432;
    bool _2436 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2438 = _2434 || _2436;
    float _2440 = _2424 * _1566;
    float _2442 = -_2428;
    float _2444 = fma(_2442, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_87.x = _2338;
    out.m_87.y = _2414;
    out.m_87.z = _2422;
    out.m_87.w = _1490;
    float _2446 = float(_2402);
    float _2448 = _1587 * _2440;
    float _2450 = _2444 * _2372;
    float _2452 = _1577 * _2440;
    float _2454 = -_2424;
    float _2456 = _2454 + 1.0;
    float _2458 = _2450 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_89.x = _2446;
    float _2460 = fma(_1583, _2452, _1571);
    float _2462 = fma(_1585, _2452, _1573);
    float _2464 = _1577 * _2456;
    float _2466 = fma(_1577, _2448, _1575);
    out.m_91.x = _2458;
    float _2468 = _1194 * _1250;
    float _2470 = _2424;
    float _2472 = _2446;
    float _2474 = _2406;
    float _2476 = _2452;
    float _2478 = _2468;
    if (!_2438)
    {
        _2470 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2480 = _2470;
    out.m_93.x = _2460;
    out.m_93.y = _2462;
    out.m_93.z = _2466;
    out.m_93.w = _2464;
    float _2482 = _2468 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2484 = _2480;
    float _2486 = _2480;
    if (!_2438)
    {
        _2472 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2488 = _2472;
    float _2490 = _2488;
    float _2492 = _2488;
    if (!_2438)
    {
        _1798 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2494 = _1798;
    float _2496 = _2494;
    float _2498 = _2494;
    if (!_2438)
    {
        _2474 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2500 = _2474;
    float _2502 = _2500;
    float _2504 = _2500;
    if (!_2438)
    {
        _2476 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2506 = _2476;
    float _2508 = _2506;
    float _2510 = _2506;
    if (!_2438)
    {
        _2478 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2512 = _2478;
    bool _2514 = !_2438;
    float _2516 = _2512;
    float _2518 = _2512;
    if (!_2514)
    {
        bool _2520 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2522 = isnan(_1290);
        bool _2524 = _2520 || _2522;
        bool _2526 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2528 = _2524 || _2526;
        if (!_2528)
        {
            float _2530 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2532 = _1290 + _2530;
            float _2534 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2536 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2534;
            float _2538 = 1.0 / _2536;
            float _2540 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2542 = _2540 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2544 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2546 = _2544 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2548 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2550 = _2548 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2554 = _2552 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2558 = _2556 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2560 = _2532 * _2538;
            float _2562 = precise::clamp(_2560, 0.0, 1.0);
            float _2564 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2568 = fma(_2562, _2542, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2570 = fma(_2562, _2566, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2572 = fma(_2562, _2546, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2574 = fma(_2562, _2550, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2576 = fma(_2562, _2554, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2578 = fma(_2562, _2558, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2492 = _2570;
            _2510 = _2576;
            _2486 = _2568;
            _2504 = _2574;
            _2498 = _2572;
            _2518 = _2578;
            _2580 = true;
        }
        else
        {
            bool _2582 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2584 = isnan(_1290);
            bool _2586 = _2582 || _2584;
            bool _2588 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2590 = _2586 || _2588;
            if (!_2590)
            {
                _2484 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2592 = _2484;
            _2486 = _2592;
            if (!_2590)
            {
                _2490 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2594 = _2490;
            _2492 = _2594;
            if (!_2590)
            {
                _2496 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2596 = _2496;
            _2498 = _2596;
            if (!_2590)
            {
                _2502 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2598 = _2502;
            _2504 = _2598;
            if (!_2590)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2600 = _2508;
            _2510 = _2600;
            if (!_2590)
            {
                _2516 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2602 = _2516;
            bool _2604 = !_2590;
            _2518 = _2602;
            if (!_2604)
            {
                bool _2606 = _1290 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2608 = isnan(_1290);
                bool _2610 = _2606 || _2608;
                bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2614 = _2610 || _2612;
                if (!_2614)
                {
                    float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2618 = _1290 + _2616;
                    float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2622 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2620;
                    float _2624 = 1.0 / _2622;
                    float _2626 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2628 = _2626 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2646 = _2618 * _2624;
                    float _2648 = precise::clamp(_2646, 0.0, 1.0);
                    float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2654 = fma(_2648, _2628, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2656 = fma(_2648, _2652, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2658 = fma(_2648, _2632, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2660 = fma(_2648, _2636, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2662 = fma(_2648, _2640, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2664 = fma(_2648, _2644, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2492 = _2656;
                    _2510 = _2662;
                    _2486 = _2654;
                    _2504 = _2660;
                    _2498 = _2658;
                    _2518 = _2664;
                    _2580 = true;
                }
                else
                {
                    _2492 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2486 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2504 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2498 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2518 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2580 = false;
    float _2666 = _2492;
    float _2668 = _2510;
    float _2670 = _2486;
    float _2672 = _2504;
    float _2674 = _2498;
    float _2676 = _2518;
    float _2678 = fma(_2244, -0.5, 0.5);
    float _2680 = precise::clamp(_2678, 0.0, 1.0);
    float _2682 = -_2666;
    float _2684 = _2682 + _2668;
    float _2686 = _2482 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2688 = -_2670;
    float _2690 = _2688 + _2672;
    float _2692 = fma(_2680, _2684, _2666);
    out.m_95.x = 0.0;
    float _2694 = -_2674;
    float _2696 = _2694 + _2676;
    float _2698 = fma(_2680, _2690, _2670);
    float _2700 = _2692 * 0.586610972881317138671875;
    out.m_53.x = _2686;
    bool _2702 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2704 = fma(_2680, _2696, _2674);
    float _2706 = fma(_2698, 0.298911988735198974609375, _2700);
    bool _2708 = _1194 > 0.0;
    bool _2710 = isnan(_1194);
    bool _2712 = _2708 || _2710;
    bool _2714 = isnan(0.0);
    bool _2716 = _2712 || _2714;
    float _2718 = fma(_2704, 0.114477999508380889892578125, _2706);
    bool _2720 = _1250 <= 0.0;
    bool _2722 = !_2716;
    bool _2724 = _2720 || _2722;
    float _2726 = -_2718;
    float _2728 = _2698 + _2726;
    float _2730 = -_2718;
    float _2732 = _2692 + _2730;
    float _2734 = -_2718;
    float _2736 = _2704 + _2734;
    float _2738 = fma(_2728, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2740 = fma(_2732, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    float _2742 = fma(_2736, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2718);
    bool _2744 = !_2702;
    if (!_2744)
    {
        float _2746 = -_1128;
        float _2748 = _2746 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2750 = -_1130;
        float _2752 = _2750 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2754 = -_1132;
        float _2756 = _2754 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2758 = _2748 * _2748;
        float _2760 = fma(_2752, _2752, _2758);
        float _2762 = fma(_2756, _2756, _2760);
        float _2764 = sqrt(_2762);
        float _2766 = rsqrt(_2762);
        float _2768 = -_2764;
        float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2772 = _2770 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2774 = precise::clamp(_2772, 0.0, 1.0);
        float _2776 = _2752 * _2766;
        float _2778 = _2748 * _2766;
        float _2780 = abs(_2774);
        float _2782 = log2(_2780);
        float _2784 = _2756 * _2766;
        float _2786 = _2776 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2788 = _2244 * _2778;
        float _2790 = -_2778;
        float _2792 = -_2786;
        float _2794 = fma(_2790, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2792);
        float _2796 = fma(_2268, _2776, _2788);
        float _2798 = -_2784;
        float _2800 = fma(_2798, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2794);
        float _2802 = fma(_2292, _2784, _2796);
        float _2804 = precise::clamp(_2802, 0.0, 1.0);
        float _2806 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2808 = _2800 + _2806;
        float _2810 = _2782 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2812 = _2808 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2814 = precise::clamp(_2812, 0.0, 1.0);
        float _2816 = exp2(_2810);
        float _2818 = _2816 * _2814;
        float _2820 = _2804 * _2818;
        float _2822 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2824 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2826 = _2820 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_95.x = _2822;
        out.m_95.y = _2824;
        out.m_95.z = _2826;
    }
    out.m_67.x = _2738;
    out.m_67.y = _2740;
    out.m_67.z = _2742;
    if (!_2724)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2828 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2828;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

