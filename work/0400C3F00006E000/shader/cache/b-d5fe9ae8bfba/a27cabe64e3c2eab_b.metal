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
    float4 m_63 [[user(locn0)]];
    float4 m_77 [[user(locn1)]];
    float4 m_53 [[user(locn2)]];
    float4 m_99 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_83 [[user(locn5)]];
    float4 m_93 [[user(locn6)]];
    float4 m_81 [[user(locn7)]];
    float4 m_85 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_97 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 m_91 [[user(locn12)]];
    float4 m_95 [[user(locn13)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_89 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_57 [[attribute(2)]];
    float4 m_50 [[attribute(3)]];
    float4 m_55 [[attribute(4)]];
    float4 m_73 [[attribute(5)]];
    float4 m_67 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
    float4 m_75 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2559 = false;
    bool _1806 = false;
    bool _728 = false;
    bool _498 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_50.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_132);
        out.gl_Position.z = _2843;
    }
    if (!_122)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _136 = in.m_55.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    float _166 = 0.0;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2912 = as_type<float>(_172);
        out.gl_Position.z = _2912;
    }
    if (_164)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _196;
    float _220;
    if (!_200)
    {
        float _204 = in.m_59.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _150 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = _230 + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _230 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = 1.0 / _246;
    bool _262 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _264 = isnan(_230);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 1.0 / _254;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _278 = 1.0 / _258;
    float _280 = _234 * _260;
    bool _282 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _284 = isnan(_230);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _230 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    float _302 = -_292;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _250;
    float _308 = _238 * _274;
    bool _310 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_230);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_300, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = _242 * _278;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_328, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_332, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = _296 * _306;
    bool _340 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_230);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _320 * _304;
    float _354 = -_320;
    float _356 = _354 + 1.0;
    bool _358 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_230);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = -_350;
    float _376 = _374 + 1.0;
    float _378 = _350 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = _272 * _376;
    float _390 = -_272;
    float _392 = _390 + 1.0;
    float _394 = fma(_372, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _368 * _392;
    float _402 = -_368;
    float _404 = _402 + 1.0;
    float _406 = _334 * _400;
    float _408 = _336 * _400;
    float _410 = _322 * _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _412;
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _420 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_414, _280, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_394, _388, _416);
    float _434 = fma(_398, _388, _420);
    float _436 = fma(_424, _280, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = fma(_396, _388, _418);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _448 = fma(_428, _280, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_430, _378, _432);
    float _456 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _458 = fma(_446, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _460 = fma(_436, _378, _438);
    float _462 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _464 = fma(_448, _378, _434);
    float _466 = fma(_456, _352, _454);
    float _468 = fma(_458, _352, _460);
    float _470 = fma(_462, _352, _464);
    float _472 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].x, _466);
    float _474 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].y, _468);
    float _476 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].z, _470);
    bool _478 = !_276;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_118);
        float _502 = 1.0 / _500;
        float _504 = _150 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _506 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _522 = isnan(_506);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    float _536 = 1.0 / _514;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _542 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = isnan(_506);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _558 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_506);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = 1.0 / _518;
    float _572 = -_552;
    float _574 = _572 + 1.0;
    bool _576 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _578 = _530 * _574;
    float _580 = _534 * _536;
    bool _582 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_506);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_530;
    float _596 = _594 + 1.0;
    float _598 = 1.0 / _540;
    float _600 = fma(_580, _510, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _602;
    float _606 = _592 * _596;
    float _608 = -_592;
    float _610 = _608 + 1.0;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = 1.0 / _556;
    float _618 = _568 * _610;
    float _620 = _614 * _570;
    float _622 = -_568;
    float _624 = _622 + 1.0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = _506 + _626;
    float _630 = _600 * _618;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _634 = _506 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _640 = _604 * _598;
    bool _642 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _644 = isnan(_506);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = fma(_620, _634, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[115].x, _630);
    float _658 = fma(_640, _628, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _662 = _506 + _660;
    float _664 = -_652;
    float _666 = _664 + 1.0;
    float _668 = fma(_654, _606, _656);
    float _670 = _638 * _616;
    float _672 = _552 * _666;
    float _674 = fma(_658, _578, _668);
    float _676 = fma(_670, _662, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _678 = fma(_676, _672, _674);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[119].x, _678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    out.m_63.x = _688;
    out.m_63.y = _690;
    out.m_63.z = _694;
    out.m_63.w = _692;
    float _702 = _476 * _700;
    float _704 = _474 * _698;
    float _706 = _472 * _696;
    bool _708 = !_576;
    float _726;
    if (!_708)
    {
        float _710 = in.m_59.x;
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _714 = _710 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _718 = _716 * _712;
        float _720 = floor(_718);
        float _722 = -_720;
        float _724 = _718 + _722;
        _726 = _724;
        _728 = true;
    }
    else
    {
        float _730 = float(_118);
        float _732 = 1.0 / _730;
        float _734 = _150 * _732;
        _726 = _734;
    }
    _728 = false;
    float _736 = _726;
    float _738 = in.m_59.z;
    float _740 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _742 = log2(_740);
    float _744 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _746 = in.m_59.x;
    float _748 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = in.m_59.y;
    float _752 = _742 * _150;
    float _754 = exp2(_752);
    float _756 = _738 * 2.0;
    float _758 = _746 * 2.0;
    float _760 = floor(_756);
    float _762 = _746 + _750;
    float _764 = _750 * 2.0;
    float _766 = _762 + (-1.0);
    float _768 = -_754;
    float _770 = _768 + 1.0;
    float _772 = floor(_758);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _778 = 1.0 + _776;
    bool _780 = _760 > 0.0;
    float _782 = floor(_764);
    bool _784 = _760 >= 0.0;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    int _794 = _792 ? 0 : 1;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _806 = _804 != 0;
    float _808 = 1.0 / _778;
    int _810 = ~_794;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    bool _816 = _772 > 0.0;
    bool _818 = _772 >= 0.0;
    bool _820 = isnan(_772);
    bool _822 = _818 || _820;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    int _828 = _814;
    if (!_780)
    {
        int _830 = ~_794;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = in.m_65.x;
    float _838 = in.m_65.y;
    float _840 = in.m_65.z;
    bool _842 = !_798;
    int _844 = _842 ? 0 : 1;
    bool _846 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _848 = isnan(1.0);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _854 = _850 || _852;
    int _856 = abs(_844);
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = float(_856);
    float _870 = float(_834);
    float _872 = _866 ? _770 : 0.0;
    int _874 = _826 ? 0 : 1;
    float _876 = _868 * _870;
    bool _878 = !_802;
    int _880 = _878 ? 0 : 1;
    if (_854)
    {
        float _882 = _872 * _808;
        _154 = _882;
    }
    float _884 = _154;
    bool _886 = _782 > 0.0;
    float _888 = _746 + (-0.5);
    int _890 = ~_874;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    bool _896 = _782 >= 0.0;
    bool _898 = isnan(_782);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _876 * (-2.0);
    int _908 = _894;
    if (!_816)
    {
        int _910 = ~_874;
        int _912 = _910 + 1;
        _908 = _912;
    }
    int _914 = _908;
    int _916 = abs(_880);
    float _918 = fma(_906, _836, _836);
    bool _920 = !_806;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_774, _906, _774);
    float _926 = float(_916);
    float _928 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _918);
    float _930 = float(_914);
    float _932 = _750 + _738;
    int _934 = _904 ? 0 : 1;
    int _936 = abs(_922);
    float _938 = _926 * _930;
    int _940 = ~_934;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = _932 + (-1.0);
    int _948 = _944;
    if (!_886)
    {
        int _950 = ~_934;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = _938 * (-2.0);
    float _958 = fma(_924, _884, _928);
    float _960 = float(_936);
    float _962 = _958 * 0.15915493667125701904296875;
    float _964 = float(_954);
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _968 = fma(_956, _838, _838);
    float _970 = _746 + _738;
    float _972 = _962 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _960 * _964;
    float _978 = _750 + (-0.5);
    float _980 = fma(_966, _956, _966);
    float _982 = _970 + (-1.0);
    float _984 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].y, _968);
    float _986 = _976 * (-2.0);
    float _988 = _962 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _994 = fma(_980, _884, _984);
    float _996 = fma(_986, _840, _840);
    float _998 = _738 + (-0.5);
    float _1000 = in.m_67.x;
    float _1002 = in.m_67.y;
    float _1004 = in.m_67.z;
    float _1006 = fma(_992, _986, _992);
    float _1008 = _994 * 0.15915493667125701904296875;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].z, _996);
    float _1012 = _1008 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(_1006, _884, _1010);
    float _1018 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = _1016 * 0.15915493667125701904296875;
    float _1022 = _1008 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1020 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    float _1030 = _974 * _1014;
    float _1032 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1002);
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1004);
    float _1038 = _1032 * _748;
    float _1040 = _1034 * _744;
    float _1042 = _1020 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = in.m_50.x;
    float _1048 = in.m_50.y;
    float _1050 = in.m_50.z;
    float _1052 = _1036 * _1018;
    float _1054 = _974 * _1024;
    float _1056 = _990 * _1014;
    float _1058 = _990 * _1024;
    float _1060 = _974 * _1028;
    float _1062 = _1024 * _1028;
    float _1064 = _990 * _1028;
    float _1066 = _1014 * _1028;
    float _1068 = _1060 * _1040;
    float _1070 = fma(_1044, _1054, _1056);
    float _1072 = fma(_1044, _1056, _1054);
    float _1074 = -_1030;
    float _1076 = fma(_1044, _1058, _1074);
    float _1078 = -_1040;
    float _1080 = _1044 * _1078;
    float _1082 = -_1058;
    float _1084 = fma(_1044, _1030, _1082);
    float _1086 = fma(_1070, _1038, _1068);
    float _1088 = _1064 * _1040;
    float _1090 = fma(_1062, _1038, _1080);
    float _1092 = fma(_1084, _1052, _1086);
    float _1094 = fma(_1076, _1038, _1088);
    float _1096 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1098 = fma(_1066, _1052, _1090);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1102 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1106 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1096);
    float _1108 = fma(_1072, _1052, _1094);
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1100);
    float _1112 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1102);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1104);
    float _1116 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1106);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1110);
    float _1120 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1112);
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1114);
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1132 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1124 + _1126;
    float _1136 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1138 = _1128 + _1130;
    float _1140 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1134 + _1142;
    float _1146 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1150 = _1138 + _1148;
    float _1152 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1154 = _1144 * _1144;
    float _1156 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1146);
    float _1158 = _1150 * _1150;
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1162 = _1154 + _1158;
    float _1164 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1166 = sqrt(_1162);
    float _1168 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1170 = floor(_1168);
    bool _1172 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1166 + _1174;
    float _1178 = -_1170;
    float _1180 = _1168 + _1178;
    float _1182 = 0.0;
    float _1184 = _1098;
    float _1186 = _1152;
    float _1188 = _1134;
    float _1190 = _1138;
    float _1192 = _1180;
    float _1194 = _1154;
    float _1196 = _1158;
    if (_1172)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1198;
    }
    float _1200 = _1182;
    if (_1172)
    {
        float _1202 = rsqrt(_1162);
        _1184 = _1202;
    }
    float _1204 = _1184;
    float _1206 = _1200;
    if (_1172)
    {
        float _1208 = _1176 * _1200;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1214 = _1210;
    if (_1172)
    {
        float _1216 = _1210 * 0.15915493667125701904296875;
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = _1212 + _1160;
    float _1222 = floor(_1164);
    float _1224 = _1218;
    float _1226 = _1220;
    if (_1172)
    {
        float _1228 = _1220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1228;
    }
    float _1230 = _1186;
    float _1232 = _1046;
    float _1234 = _1230;
    if (_1172)
    {
        float _1236 = _1218 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = -_1222;
    float _1244 = _1164 + _1242;
    if (_1172)
    {
        float _1246 = fma(_1240, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1246;
    }
    float _1248 = _1234;
    float _1250 = _1248;
    if (_1172)
    {
        float _1252 = _1204 * _1248;
        _1250 = _1252;
    }
    float _1254 = _1250;
    if (_1172)
    {
        float _1256 = fma(_1144, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1188 = _1256;
    }
    float _1258 = _1188;
    if (_1172)
    {
        float _1260 = fma(_1150, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1190 = _1260;
    }
    float _1262 = _1190;
    float _1264 = fma(_1258, 6.2500002968590706586837768554688e-05, 0.5);
    float _1266 = fma(_1262, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4630 = float2(_1264, _1266);
    float3 _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4630, float2(0.0), isnan(_4630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4630, float2(0.0), isnan(_4630)), level(0.0)).xyz;
    float _1272 = _1270.x;
    float _1274 = _1270.y;
    float _1276 = _1270.z;
    float2 _4646 = float2(_1244, _1180);
    float _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4646, float2(0.0), isnan(_4646)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4646, float2(0.0), isnan(_4646)), level(0.0)).x;
    float _1280 = in.m_59.w;
    float _1282 = in.m_69.y;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1290 = _1288 != 0;
    float _1292 = in.m_69.x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / _1286;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1302 = _1300 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1306 = _1304 != 0;
    bool _1308 = _750 > 0.5;
    bool _1310 = _736 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1312 = isnan(_736);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    bool _1322 = _1280 > 0.5;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1326 = _736 + _1324;
    float _1328 = -_1282;
    float _1330 = _1328 + 1.0;
    bool _1332 = _736 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1334 = isnan(_736);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1320;
    float _1346 = _1344 + 1.0;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1348;
    int _1352 = _1322 ? as_type<int>(_1330) : as_type<int>(_1282);
    float _1354 = _1350 * _1298;
    bool _1356 = _1322;
    float _1358 = _1298;
    float _1360 = _1282;
    int _1362 = as_type<int>(_1346);
    bool _1364 = _1306;
    float _1366 = _1330;
    if (_1290)
    {
        bool _1368 = _746 > 0.5;
        _1356 = _1368;
    }
    bool _1370 = _1356;
    if (!_1290)
    {
        _1358 = _1292;
    }
    float _1372 = _1358;
    float _1374 = in.m_73.x;
    float _1376 = in.m_73.y;
    float _1378 = in.m_73.z;
    float _1380 = _1302 ? as_type<float>(_1352) : _1282;
    float _1382 = fma(_1354, _1326, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1384 = _1002 != 0.0;
    bool _1386 = isnan(_1002);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan(0.0);
    bool _1392 = _1388 || _1390;
    float _1394 = _1342 * _1346;
    float _1396 = _1372;
    if (!_1290)
    {
        _1192 = _1372;
    }
    float _1398 = _1192;
    float _1400 = -_1342;
    float _1402 = _1400 + 1.0;
    float _1404 = _1398;
    if (_1290)
    {
        _1396 = _1292;
    }
    float _1406 = _1396;
    float _1408 = _1382 * _1394;
    bool _1410 = _1000 == 0.0;
    bool _1412 = !_1392;
    bool _1414 = _1410 && _1412;
    float _1416 = _1408;
    float _1418 = _1406;
    if (_1306)
    {
        float _1420 = _1308 ? _1330 : _1282;
        _1360 = _1420;
    }
    float _1422 = _1360;
    if (_1290)
    {
        float _1424 = -_1406;
        float _1426 = _1424 + 1.0;
        _1362 = as_type<int>(_1426);
    }
    int _1428 = _1362;
    bool _1430 = _1004 == 0.0;
    bool _1432 = _1430 && _1414;
    int _1434 = 0;
    if (_1296)
    {
        float _1436 = -_1406;
        float _1438 = _1436 + 1.0;
        _1434 = as_type<int>(_1438);
    }
    int _1440 = _1434;
    float _1442 = as_type<float>(_1440);
    if (_1296)
    {
        bool _1444 = _738 > 0.5;
        _1364 = _1444;
    }
    bool _1446 = _1364;
    float _1448 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1408);
    if (_1290)
    {
        float _1450 = _1370 ? as_type<float>(_1428) : _1406;
        _1404 = _1450;
    }
    float _1452 = _1404;
    float _1454 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = in.m_75.x;
    float _1458 = in.m_75.y;
    float _1460 = in.m_75.z;
    float _1462 = in.m_75.w;
    if (!_1296)
    {
        _1366 = _1406;
    }
    float _1464 = _1366;
    float _1466 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1448);
    float _1468 = _1464;
    if (_1296)
    {
        float _1470 = _1446 ? as_type<float>(_1440) : _1406;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1476 = 0.0;
    if (_1432)
    {
        _1476 = _1374;
    }
    float _1478 = _1476;
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = _1478;
    if (_1432)
    {
        _1442 = _1376;
    }
    float _1484 = _1442;
    float _1486 = 0.0;
    float _1488 = _1484;
    if (_1432)
    {
        _1486 = _1378;
    }
    float _1490 = _1486;
    float _1492 = _1490;
    if (_1432)
    {
        _1416 = _1478;
    }
    float _1494 = _1416;
    float _1496 = 0.0;
    float _1498 = _1494;
    if (_1432)
    {
        _1496 = _1484;
    }
    float _1500 = _1496;
    float _1502 = _1500;
    if (_1432)
    {
        _1418 = _1490;
    }
    float _1504 = _1418;
    float _1506 = _1504;
    if (!_1432)
    {
        _1482 = _1374;
    }
    float _1508 = _1482;
    if (!_1432)
    {
        _1488 = _1376;
    }
    float _1510 = _1488;
    if (!_1432)
    {
        _1492 = _1378;
    }
    float _1512 = _1492;
    if (!_1432)
    {
        float _1514 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1508);
        _1498 = _1514;
    }
    float _1516 = _1498;
    float _1518 = _1516;
    if (!_1432)
    {
        float _1520 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1510);
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1458 * _1512;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1528 = _1456 * _1510;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1532 = -_1524;
    float _1534 = fma(_1460, _1510, _1532);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1538 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = _1534 * _1462;
    float _1544 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1460 * _1508;
    float _1548 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1550 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1552 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_77.x = _1538;
    out.m_77.y = _1540;
    out.m_77.z = _1544;
    out.m_77.w = _1474;
    float _1554 = _1458;
    if (!_1432)
    {
        float _1556 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1512);
        _1506 = _1556;
    }
    float _1558 = _1506;
    float _1560 = -_1546;
    float _1562 = fma(_1456, _1512, _1560);
    float _1564 = -_1044;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1552);
    float _1568 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1570 = -_1528;
    float _1572 = fma(_1458, _1508, _1570);
    float _1574 = -_1044;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1548);
    float _1578 = -_1044;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1550);
    float _1582 = _1562 * _1462;
    float _1584 = _1572 * _1462;
    float _1586 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1576);
    float _1588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1590 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1594 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1568);
    float _1596 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1600 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1592);
    float _1602 = _1590;
    float _1604 = _1584;
    if (_1172)
    {
        float _1606 = _1218 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        _1602 = _1608;
    }
    float _1610 = _1602;
    float _1612 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1614 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1616 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1580);
    float _1618 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1566);
    float _1620 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1612);
    float _1622 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1614);
    float _1624 = _1586 * _1458;
    float _1626 = _1616 * _1458;
    float _1628 = _1618 * _1458;
    float _1630 = _1618 * _1522;
    float _1632 = _1582 * _1618;
    float _1634 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1620);
    float _1636 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1638 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1594);
    float _1640 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1598);
    float _1642 = _1620;
    if (_1172)
    {
        float _1644 = _1610 + (-1.0);
        _1554 = _1644;
    }
    float _1646 = _1554;
    float _1648 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1650 = _1586 * _1522;
    float _1652 = _1616 * _1522;
    if (_1172)
    {
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1654;
    }
    float _1656 = _1642;
    if (_1172)
    {
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1660 = _1258 + _1658;
        _1224 = _1660;
    }
    float _1662 = _1224;
    float _1664 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1636);
    float _1666 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1622);
    if (_1172)
    {
        float _1668 = fma(_1220, _1610, _1656);
        _1226 = _1668;
    }
    float _1670 = _1226;
    float _1672 = fma(_1638, _1516, _1650);
    float _1674 = fma(_1640, _1516, _1652);
    float _1676 = fma(_1648, _1516, _1630);
    if (_1172)
    {
        float _1678 = _1662 * _1662;
        _1194 = _1678;
    }
    float _1680 = _1194;
    if (_1172)
    {
        float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1684 = _1262 + _1682;
        _1518 = _1684;
    }
    float _1686 = _1518;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1670 + _1688;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1694 = _1582 * _1586;
    float _1696 = _1582 * _1616;
    if (_1172)
    {
        float _1698 = _1686 * _1686;
        _1196 = _1698;
    }
    float _1700 = _1196;
    float _1702 = fma(_1690, _1690, _1680);
    float _1704 = fma(_1638, _1456, _1624);
    float _1706 = fma(_1542, _1638, _1694);
    float _1708 = fma(_1640, _1456, _1626);
    float _1710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1712 = _1702 + _1700;
    float _1714 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1716 = fma(_1648, _1456, _1628);
    float _1718 = fma(_1542, _1640, _1696);
    float _1720 = fma(_1542, _1648, _1632);
    float _1722 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1724 = fma(_1664, _1558, _1672);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1728 = _1714 * _1692;
    float _1730 = fma(_1664, _1460, _1704);
    float _1732 = fma(_1584, _1664, _1706);
    float _1734 = fma(_1666, _1460, _1716);
    float _1736 = _1722 * _1588;
    float _1738 = fma(_1584, _1634, _1718);
    float _1740 = fma(_1634, _1558, _1674);
    float _1742 = sqrt(_1712);
    float _1744 = _1454 * _1710;
    float _1746 = fma(_1634, _1460, _1708);
    float _1748 = fma(_1584, _1666, _1720);
    float _1750 = fma(_1666, _1558, _1676);
    out.m_79.x = _1730;
    out.m_79.y = _1746;
    out.m_79.z = _1734;
    float _1752 = _1480 * _1726;
    out.m_81.x = _1732;
    out.m_81.y = _1738;
    out.m_81.z = _1748;
    out.m_83.x = _1736;
    out.m_83.y = _1744;
    out.m_83.z = _1752;
    out.m_83.w = _1728;
    bool _1754 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1756 = isnan(_1742);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1762 = _1758 || _1760;
    out.m_85.x = _1724;
    out.m_85.y = _1740;
    out.m_85.z = _1750;
    float _1764 = _1734;
    float _1766 = _1730;
    if (!_1762)
    {
        _1604 = 1.0;
    }
    float _1768 = _1604;
    out.m_87.x = _1272;
    out.m_87.y = _1274;
    out.m_87.z = _1276;
    bool _1770 = !_1762;
    float _1772 = _1768;
    float _1774 = _1274;
    float _1776 = _1276;
    if (!_1770)
    {
        bool _1778 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1780 = isnan(_1742);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1786 = _1782 || _1784;
        if (!_1786)
        {
            float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1790 = _1742 + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1794 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1800 = 1.0 / _1794;
            float _1802 = _1790 * _1800;
            float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1772 = _1804;
            _1774 = _1800;
            _1806 = true;
        }
        else
        {
            bool _1808 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1810 = isnan(_1742);
            bool _1812 = _1808 || _1810;
            bool _1814 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1816 = _1812 || _1814;
            if (!_1816)
            {
                float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1820 = _1742 + _1818;
                float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1824 = _1822 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1826 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1828 = _1826 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1830 = 1.0 / _1824;
                float _1832 = _1820 * _1830;
                float _1834 = fma(_1832, _1828, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1772 = _1834;
                _1774 = _1830;
                _1806 = true;
            }
            else
            {
                _1772 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1806 = false;
    float _1836 = _1772;
    float _1838 = _1774;
    float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1842 = _1670 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1846 = _1258 + _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1850 = _1262 + _1848;
    float _1852 = fma(_1842, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1854 = fma(_1846, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1856 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1858 = -_1212;
    float _1860 = _1858 + _1852;
    float _1862 = -_1124;
    float _1864 = _1862 + _1854;
    float _1866 = -_1128;
    float _1868 = _1866 + _1856;
    float _1870 = _1860 * _1860;
    float _1872 = fma(_1864, _1864, _1870);
    float _1874 = fma(_1868, _1868, _1872);
    float _1876 = sqrt(_1874);
    bool _1878 = _1876 > 0.0;
    float _1880 = _1876;
    float _1882 = _1838;
    if (!_1878)
    {
        _1880 = _1854;
    }
    float _1884 = _1880;
    float _1886 = _1884;
    if (!_1878)
    {
        _1882 = _1852;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (!_1878)
    {
        _1776 = _1856;
    }
    float _1892 = _1776;
    bool _1894 = !_1878;
    float _1896 = _1892;
    float _1898 = _1892;
    if (!_1894)
    {
        float _1900 = _196 * _196;
        float _1902 = fma(_194, _194, _1900);
        float _1904 = fma(_198, _198, _1902);
        float _1906 = rsqrt(_1874);
        float _1908 = sqrt(_1904);
        float _1910 = _1864 * _1906;
        float _1912 = _1860 * _1906;
        float _1914 = _1868 * _1906;
        bool _1916 = _1908 > 0.0;
        float _1918 = _1906;
        float _1920 = _1908;
        _1764 = _1912;
        _1766 = _1910;
        if (!_1916)
        {
            _1918 = _1854;
        }
        float _1922 = _1918;
        _1886 = _1922;
        if (!_1916)
        {
            _1920 = _1852;
        }
        float _1924 = _1920;
        _1890 = _1924;
        if (!_1916)
        {
            _1896 = _1856;
        }
        float _1926 = _1896;
        bool _1928 = !_1916;
        _1898 = _1926;
        if (!_1928)
        {
            float _1930 = rsqrt(_1904);
            float _1932 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1934 = _196 * _1930;
            float _1936 = _194 * _1930;
            float _1938 = _1912 * _1934;
            float _1940 = _198 * _1930;
            float _1942 = fma(_1910, _1936, _1938);
            float _1944 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1946 = fma(_1914, _1940, _1942);
            float _1948 = _1946 * _1944;
            float _1950 = fma(_194, _1948, _1854);
            float _1952 = fma(_196, _1948, _1852);
            float _1954 = fma(_198, _1948, _1856);
            _1890 = _1952;
            _1886 = _1950;
            _1898 = _1954;
        }
    }
    float _1956 = _1890;
    float _1958 = _1886;
    float _1960 = _1898;
    float _1962 = _1764;
    float _1964 = _1766;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1968 = _1956 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1972 = _1958 + _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1976 = _1960 + _1974;
    float _1978 = _1968 * _1968;
    float _1980 = fma(_1972, _1972, _1978);
    float _1982 = fma(_1976, _1976, _1980);
    float _1984 = rsqrt(_1982);
    float _1986 = sqrt(_1982);
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1990 = _1972 * _1988;
    float _1992 = _1976 * _1988;
    float _1994 = _1990 * _1990;
    float _1996 = _1992 * _1992;
    float _1998 = _1994 + _1996;
    float _2000 = sqrt(_1998);
    bool _2002 = _2000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _2000 + _2004;
    float _2008 = _1860;
    float _2010 = _2006;
    float _2012 = _1962;
    float _2014 = _1968;
    float _2016 = _1990;
    if (_2002)
    {
        float _2018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2018;
    }
    float _2020 = _2008;
    float _2022 = _2020;
    if (_2002)
    {
        float _2024 = _2006 * _2020;
        _2010 = _2024;
    }
    float _2026 = _2010;
    if (_2002)
    {
        float _2028 = rsqrt(_1998);
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = _2030;
    if (_2002)
    {
        float _2034 = _2026 * 0.15915493667125701904296875;
        _2012 = _2034;
    }
    float _2036 = _2012;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = _1976;
    if (_2002)
    {
        float _2042 = _2036 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        _2040 = _2044;
    }
    float _2046 = _2040;
    float _2048 = precise::max(0.0, _2038);
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2052 = _1964;
    float _2054 = _2048;
    if (_2002)
    {
        float _2056 = _2036 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = -_1988;
    float _2064 = -_2048;
    float _2066 = fma(_1968, _2062, _2064);
    if (_2002)
    {
        float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2014 = _2068;
    }
    float _2070 = _2014;
    float _2072 = _2046;
    float _2074 = _2070;
    if (_2002)
    {
        float _2076 = fma(_2046, _2070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2076;
    }
    float _2078 = _2072;
    float _2080 = _2078;
    if (!_2002)
    {
        _2074 = _2066;
    }
    float _2082 = _2074;
    float _2084 = _2082;
    if (_2002)
    {
        float _2086 = _2030 * _2078;
        _202 = _2086;
    }
    float _2088 = _202;
    if (!_2002)
    {
        _2080 = _1994;
    }
    float _2090 = _2080;
    float _2092 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2094 = _2090;
    float _2096 = _2060;
    if (_2002)
    {
        float _2098 = _2060 + (-1.0);
        _2054 = _2098;
    }
    float _2100 = _2054;
    float _2102 = _2100;
    if (_2002)
    {
        float _2104 = _1990 * _2088;
        _2016 = _2104;
    }
    float _2106 = _2016;
    float _2108 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2092);
    if (_2002)
    {
        float _2110 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2110;
    }
    float _2112 = _2032;
    if (!_2002)
    {
        _2102 = _1992;
    }
    float _2114 = _2102;
    float _2116 = _2114;
    if (_2002)
    {
        float _2118 = _2106 * _2106;
        _2094 = _2118;
    }
    float _2120 = _2094;
    if (_2002)
    {
        float _2122 = _1992 * _2088;
        _2116 = _2122;
    }
    float _2124 = _2116;
    if (_2002)
    {
        float _2126 = fma(_2066, _2060, _2112);
        _2084 = _2126;
    }
    float _2128 = _2084;
    if (!_2002)
    {
        _2096 = _1996;
    }
    float _2130 = _2096;
    float _2132 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2134 = _2130;
    if (_2002)
    {
        float _2136 = _2124 * _2124;
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = fma(_2128, _2128, _2120);
    float _2142 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2144 = _2140 + _2138;
    float _2146 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2150 = fma(_1986, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2148);
    float _2152 = precise::clamp(_2150, 0.0, 1.0);
    float _2154 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2142);
    float _2156 = rsqrt(_2144);
    float _2158 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2160 = -_2152;
    float _2162 = _2160 + 1.0;
    float _2164 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2146);
    float _2166 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2168 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2158);
    float _2170 = abs(_2162);
    float _2172 = log2(_2170);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2176 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2178 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2180 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2182 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2108);
    float _2184 = -_2178;
    float _2186 = fma(_2184, _2050, 1.0);
    float _2188 = _2156 * _2106;
    float _2190 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2194 = _2156 * _2128;
    float _2196 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2198 = _2156 * _2124;
    float _2200 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2192);
    float _2202 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2204 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2206 = -_2196;
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2206);
    float _2210 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2200);
    float _2212 = log2(_2186);
    float _2214 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2216 = -_2198;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2208);
    float _2220 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2210);
    float _2222 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2224 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2214);
    float _2226 = fma(_2218, -0.5, 0.5);
    float _2228 = fma(_2218, 0.5, 0.5);
    float _2230 = exp2(_2204);
    float _2232 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2222);
    float _2234 = _2194 + 1.0;
    float _2236 = fma(_2228, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2238 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2224);
    float _2240 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2232);
    float _2242 = fma(_2228, _2236, -0.212114393711090087890625);
    float _2244 = 1.0 / _2220;
    float _2246 = _2212 * 0.693147182464599609375;
    float _2248 = fma(_2228, _2242, 1.570728778839111328125);
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2252 = sqrt(_2226);
    float _2254 = -_2194;
    float _2256 = fma(_2230, _2234, _2254);
    float _2258 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2240);
    float _2260 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2238);
    float _2262 = _2258 * _2244;
    float _2264 = _2260 * _2244;
    float _2266 = fma(_2262, 0.5, 0.5);
    float _2268 = fma(_2264, -0.5, 0.5);
    float _2270 = fma(_2256, 0.5, 0.5);
    float _2272 = _2252 * 0.636619746685028076171875;
    float3 _6349 = float3(_2266, _2268, _2250);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).x;
    float3 _6360 = float3(_2266, _2268, _2250);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6360, float3(0.0), isnan(_6360)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6360, float3(0.0), isnan(_6360)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float _2287 = -_2248;
    float _2289 = fma(_2272, _2287, 1.0);
    float2 _6381 = float2(_2289, _2270);
    float3 _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6381, float2(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6381, float2(0.0), isnan(_6381)), level(0.0)).xyz;
    float _2293 = _2291.x;
    float _2295 = _2291.y;
    float _2297 = _2291.z;
    float _2299 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2301 = -_1278;
    float _2303 = _2301 + 1.0;
    bool _2305 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2307 = isnan(_1986);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2299);
    float _2317 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2319 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2315);
    float _2321 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2317);
    float _2323 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2325 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2321);
    float _2327 = 1.0 / _2323;
    float _2329 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2331 = _2329 + _2323;
    float _2333 = _2331 * _2327;
    float _2335 = _2333 * 0.5;
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2339 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2337);
    float _2341 = 1.0 / _2339;
    float _2343 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2345 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2347 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2343);
    float _2349 = _2220 * 0.5;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2353 = _2341 * _2351;
    float _2355 = exp2(_2345);
    float _2357 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2347);
    float _2359 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2357);
    float _2361 = abs(_2353);
    float _2363 = log2(_2361);
    float _2365 = _2359 + _2220;
    out.gl_Position.x = _2258;
    out.gl_Position.y = _2260;
    out.gl_Position.z = _2359;
    out.gl_Position.w = _2220;
    float _2367 = _2365 * 0.5;
    bool _2369 = _2353 <= 8000.0;
    bool _2371 = isnan(_2353);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(8000.0);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    float _2381 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2383 = _2359;
    float _2385 = _2260;
    float _2387 = _2220;
    float _2389 = _2258;
    if (!_2313)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2391 = _2383;
    float _2393 = exp2(_2381);
    float _2395 = fma(_2393, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = fma(_2397, -2.0, 3.0);
    float _2401 = _2397 * _2397;
    float _2403 = in.m_89.x;
    float _2405 = _2401 * _2399;
    float _2407 = -_2405;
    float _2409 = _2407 + 1.0;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2405);
    float _2413 = _2379 * _2411;
    float _2415 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2417 = _2303 * _2415;
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = -_2355;
    float _2423 = _2421 + 1.0;
    float _2425 = fma(_2260, -0.5, _2349);
    float _2427 = _2425;
    float _2429 = _2391;
    float _2431 = _2391;
    if (!_2313)
    {
        _2385 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2433 = _2385;
    float _2435 = -_2419;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2439 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2441 = _2437 * _2403;
    float _2443 = _2258 + _2220;
    float _2445 = _2433;
    float _2447 = _2433;
    if (!_2313)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2449 = _2387;
    float _2451 = _2441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2453 = _2443 * 0.5;
    float _2455 = _2453;
    float _2457 = _2449;
    float _2459 = _2449;
    if (!_2313)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2461 = _2389;
    out.m_91.x = _2451;
    out.m_93.x = _2453;
    out.m_93.y = _2425;
    out.m_93.z = _2367;
    out.m_93.w = _2220;
    float _2463 = _2461;
    float _2465 = _2461;
    if (!_2313)
    {
        _2427 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2467 = _2427;
    float _2469 = _2467;
    float _2471 = _2467;
    if (!_2313)
    {
        _2455 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2473 = _2455;
    float _2475 = _2439 * _2274;
    float _2477 = -_2439;
    float _2479 = _2477 + 1.0;
    float _2481 = _2285 * _2475;
    float _2483 = _2297 * _2475;
    float _2485 = fma(_2293, _2481, _2279);
    float _2487 = fma(_2295, _2481, _2281);
    float _2489 = _2285 * _2479;
    float _2491 = fma(_2285, _2483, _2283);
    out.m_95.x = _2485;
    out.m_95.y = _2487;
    out.m_95.z = _2491;
    out.m_95.w = _2489;
    bool _2493 = !_2313;
    float _2495 = _2473;
    float _2497 = _2473;
    if (!_2493)
    {
        bool _2499 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2501 = isnan(_1986);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2507 = _2503 || _2505;
        if (!_2507)
        {
            float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2511 = _1986 + _2509;
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2513;
            float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2521 = 1.0 / _2515;
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2539 = _2511 * _2521;
            float _2541 = precise::clamp(_2539, 0.0, 1.0);
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2547 = fma(_2541, _2519, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2497 = _2551;
            _2447 = _2555;
            _2471 = _2547;
            _2431 = _2553;
            _2459 = _2549;
            _2465 = _2557;
            _2559 = true;
        }
        else
        {
            bool _2561 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2563 = isnan(_1986);
            bool _2565 = _2561 || _2563;
            bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2569 = _2565 || _2567;
            if (!_2569)
            {
                _2469 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2571 = _2469;
            _2471 = _2571;
            if (!_2569)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2573 = _2495;
            _2497 = _2573;
            if (!_2569)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2575 = _2457;
            _2459 = _2575;
            if (!_2569)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2429;
            _2431 = _2577;
            if (!_2569)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2445;
            _2447 = _2579;
            if (!_2569)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2463;
            bool _2583 = !_2569;
            _2465 = _2581;
            if (!_2583)
            {
                bool _2585 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2587 = isnan(_1986);
                bool _2589 = _2585 || _2587;
                bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2593 = _2589 || _2591;
                if (!_2593)
                {
                    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2597 = _1986 + _2595;
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2599;
                    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2607 = 1.0 / _2601;
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2625 = _2597 * _2607;
                    float _2627 = precise::clamp(_2625, 0.0, 1.0);
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2633 = fma(_2627, _2605, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2635 = fma(_2627, _2631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2637 = fma(_2627, _2611, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2639 = fma(_2627, _2615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2641 = fma(_2627, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2643 = fma(_2627, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2497 = _2637;
                    _2447 = _2641;
                    _2471 = _2633;
                    _2431 = _2639;
                    _2459 = _2635;
                    _2465 = _2643;
                    _2559 = true;
                }
                else
                {
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2471 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2559 = false;
    float _2645 = _2497;
    float _2647 = _2447;
    float _2649 = _2471;
    float _2651 = _2431;
    float _2653 = _2459;
    float _2655 = _2465;
    float _2657 = fma(_1740, -0.5, 0.5);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = -_2645;
    float _2663 = _2661 + _2647;
    float _2665 = -_2649;
    float _2667 = _2665 + _2651;
    float _2669 = -_2653;
    float _2671 = _2669 + _2655;
    bool _2673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2675 = fma(_2659, _2663, _2645);
    float _2677 = fma(_2659, _2667, _2649);
    float _2679 = fma(_2659, _2671, _2653);
    float _2681 = _2675 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2683 = fma(_2677, 0.298911988735198974609375, _2681);
    float _2685 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2687 = fma(_2679, 0.114477999508380889892578125, _2683);
    out.m_53.x = _2685;
    float _2689 = -_2687;
    float _2691 = _2677 + _2689;
    float _2693 = -_2687;
    float _2695 = _2675 + _2693;
    float _2697 = -_2687;
    float _2699 = _2679 + _2697;
    float _2701 = fma(_2691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    float _2703 = fma(_2695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    float _2705 = fma(_2699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    out.m_99.x = _2701;
    out.m_99.y = _2703;
    out.m_99.z = _2705;
    if (!_2673)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2707 = -_1956;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2711 = -_1958;
    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2715 = -_1960;
    float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2719 = _2709 * _2709;
    float _2721 = fma(_2713, _2713, _2719);
    float _2723 = fma(_2717, _2717, _2721);
    float _2725 = sqrt(_2723);
    float _2727 = rsqrt(_2723);
    float _2729 = -_2725;
    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2733 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2735 = precise::clamp(_2733, 0.0, 1.0);
    float _2737 = _2713 * _2727;
    float _2739 = _2709 * _2727;
    float _2741 = abs(_2735);
    float _2743 = log2(_2741);
    float _2745 = _2717 * _2727;
    float _2747 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2749 = _1740 * _2739;
    float _2751 = -_2739;
    float _2753 = -_2747;
    float _2755 = fma(_2751, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2753);
    float _2757 = fma(_1724, _2737, _2749);
    float _2759 = -_2745;
    float _2761 = fma(_2759, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2755);
    float _2763 = fma(_1750, _2745, _2757);
    float _2765 = precise::clamp(_2763, 0.0, 1.0);
    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2769 = _2761 + _2767;
    float _2771 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2775 = precise::clamp(_2773, 0.0, 1.0);
    float _2777 = exp2(_2771);
    float _2779 = _2777 * _2775;
    float _2781 = _2765 * _2779;
    float _2783 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2787 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2783;
    out.m_97.y = _2785;
    out.m_97.z = _2787;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2559 = false;
    bool _1806 = false;
    bool _728 = false;
    bool _498 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_50.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_132);
        out.gl_Position.z = _2843;
    }
    if (!_122)
    {
        return out;
    }
    float _136 = in.m_55.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    float _166 = 0.0;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2912 = as_type<float>(_172);
        out.gl_Position.z = _2912;
    }
    if (_164)
    {
        return out;
    }
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _196;
    float _220;
    if (!_200)
    {
        float _204 = in.m_59.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _150 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = _230 + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _230 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = 1.0 / _246;
    bool _262 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _264 = isnan(_230);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 1.0 / _254;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _278 = 1.0 / _258;
    float _280 = _234 * _260;
    bool _282 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _284 = isnan(_230);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _230 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    float _302 = -_292;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _250;
    float _308 = _238 * _274;
    bool _310 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_230);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_300, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = _242 * _278;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_328, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_332, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = _296 * _306;
    bool _340 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_230);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _320 * _304;
    float _354 = -_320;
    float _356 = _354 + 1.0;
    bool _358 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_230);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = -_350;
    float _376 = _374 + 1.0;
    float _378 = _350 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = _272 * _376;
    float _390 = -_272;
    float _392 = _390 + 1.0;
    float _394 = fma(_372, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _368 * _392;
    float _402 = -_368;
    float _404 = _402 + 1.0;
    float _406 = _334 * _400;
    float _408 = _336 * _400;
    float _410 = _322 * _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _412;
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _420 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_414, _280, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_394, _388, _416);
    float _434 = fma(_398, _388, _420);
    float _436 = fma(_424, _280, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = fma(_396, _388, _418);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _448 = fma(_428, _280, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_430, _378, _432);
    float _456 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _458 = fma(_446, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _460 = fma(_436, _378, _438);
    float _462 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _464 = fma(_448, _378, _434);
    float _466 = fma(_456, _352, _454);
    float _468 = fma(_458, _352, _460);
    float _470 = fma(_462, _352, _464);
    float _472 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].x, _466);
    float _474 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].y, _468);
    float _476 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].z, _470);
    bool _478 = !_276;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_118);
        float _502 = 1.0 / _500;
        float _504 = _150 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _506 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _522 = isnan(_506);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    float _536 = 1.0 / _514;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _542 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = isnan(_506);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _558 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_506);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = 1.0 / _518;
    float _572 = -_552;
    float _574 = _572 + 1.0;
    bool _576 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _578 = _530 * _574;
    float _580 = _534 * _536;
    bool _582 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_506);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_530;
    float _596 = _594 + 1.0;
    float _598 = 1.0 / _540;
    float _600 = fma(_580, _510, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _602;
    float _606 = _592 * _596;
    float _608 = -_592;
    float _610 = _608 + 1.0;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = 1.0 / _556;
    float _618 = _568 * _610;
    float _620 = _614 * _570;
    float _622 = -_568;
    float _624 = _622 + 1.0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = _506 + _626;
    float _630 = _600 * _618;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _634 = _506 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _640 = _604 * _598;
    bool _642 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _644 = isnan(_506);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = fma(_620, _634, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[115].x, _630);
    float _658 = fma(_640, _628, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _662 = _506 + _660;
    float _664 = -_652;
    float _666 = _664 + 1.0;
    float _668 = fma(_654, _606, _656);
    float _670 = _638 * _616;
    float _672 = _552 * _666;
    float _674 = fma(_658, _578, _668);
    float _676 = fma(_670, _662, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _678 = fma(_676, _672, _674);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[119].x, _678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    out.m_63.x = _688;
    out.m_63.y = _690;
    out.m_63.z = _694;
    out.m_63.w = _692;
    float _702 = _476 * _700;
    float _704 = _474 * _698;
    float _706 = _472 * _696;
    bool _708 = !_576;
    float _726;
    if (!_708)
    {
        float _710 = in.m_59.x;
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _714 = _710 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _718 = _716 * _712;
        float _720 = floor(_718);
        float _722 = -_720;
        float _724 = _718 + _722;
        _726 = _724;
        _728 = true;
    }
    else
    {
        float _730 = float(_118);
        float _732 = 1.0 / _730;
        float _734 = _150 * _732;
        _726 = _734;
    }
    _728 = false;
    float _736 = _726;
    float _738 = in.m_59.z;
    float _740 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _742 = log2(_740);
    float _744 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _746 = in.m_59.x;
    float _748 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = in.m_59.y;
    float _752 = _742 * _150;
    float _754 = exp2(_752);
    float _756 = _738 * 2.0;
    float _758 = _746 * 2.0;
    float _760 = floor(_756);
    float _762 = _746 + _750;
    float _764 = _750 * 2.0;
    float _766 = _762 + (-1.0);
    float _768 = -_754;
    float _770 = _768 + 1.0;
    float _772 = floor(_758);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _778 = 1.0 + _776;
    bool _780 = _760 > 0.0;
    float _782 = floor(_764);
    bool _784 = _760 >= 0.0;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    int _794 = _792 ? 0 : 1;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _806 = _804 != 0;
    float _808 = 1.0 / _778;
    int _810 = ~_794;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    bool _816 = _772 > 0.0;
    bool _818 = _772 >= 0.0;
    bool _820 = isnan(_772);
    bool _822 = _818 || _820;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    int _828 = _814;
    if (!_780)
    {
        int _830 = ~_794;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = in.m_65.x;
    float _838 = in.m_65.y;
    float _840 = in.m_65.z;
    bool _842 = !_798;
    int _844 = _842 ? 0 : 1;
    bool _846 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _848 = isnan(1.0);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _854 = _850 || _852;
    int _856 = abs(_844);
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = float(_856);
    float _870 = float(_834);
    float _872 = _866 ? _770 : 0.0;
    int _874 = _826 ? 0 : 1;
    float _876 = _868 * _870;
    bool _878 = !_802;
    int _880 = _878 ? 0 : 1;
    if (_854)
    {
        float _882 = _872 * _808;
        _154 = _882;
    }
    float _884 = _154;
    bool _886 = _782 > 0.0;
    float _888 = _746 + (-0.5);
    int _890 = ~_874;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    bool _896 = _782 >= 0.0;
    bool _898 = isnan(_782);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _876 * (-2.0);
    int _908 = _894;
    if (!_816)
    {
        int _910 = ~_874;
        int _912 = _910 + 1;
        _908 = _912;
    }
    int _914 = _908;
    int _916 = abs(_880);
    float _918 = fma(_906, _836, _836);
    bool _920 = !_806;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_774, _906, _774);
    float _926 = float(_916);
    float _928 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _918);
    float _930 = float(_914);
    float _932 = _750 + _738;
    int _934 = _904 ? 0 : 1;
    int _936 = abs(_922);
    float _938 = _926 * _930;
    int _940 = ~_934;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = _932 + (-1.0);
    int _948 = _944;
    if (!_886)
    {
        int _950 = ~_934;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = _938 * (-2.0);
    float _958 = fma(_924, _884, _928);
    float _960 = float(_936);
    float _962 = _958 * 0.15915493667125701904296875;
    float _964 = float(_954);
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _968 = fma(_956, _838, _838);
    float _970 = _746 + _738;
    float _972 = _962 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _960 * _964;
    float _978 = _750 + (-0.5);
    float _980 = fma(_966, _956, _966);
    float _982 = _970 + (-1.0);
    float _984 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].y, _968);
    float _986 = _976 * (-2.0);
    float _988 = _962 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _994 = fma(_980, _884, _984);
    float _996 = fma(_986, _840, _840);
    float _998 = _738 + (-0.5);
    float _1000 = in.m_67.x;
    float _1002 = in.m_67.y;
    float _1004 = in.m_67.z;
    float _1006 = fma(_992, _986, _992);
    float _1008 = _994 * 0.15915493667125701904296875;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].z, _996);
    float _1012 = _1008 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(_1006, _884, _1010);
    float _1018 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = _1016 * 0.15915493667125701904296875;
    float _1022 = _1008 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1020 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    float _1030 = _974 * _1014;
    float _1032 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1002);
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1004);
    float _1038 = _1032 * _748;
    float _1040 = _1034 * _744;
    float _1042 = _1020 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = in.m_50.x;
    float _1048 = in.m_50.y;
    float _1050 = in.m_50.z;
    float _1052 = _1036 * _1018;
    float _1054 = _974 * _1024;
    float _1056 = _990 * _1014;
    float _1058 = _990 * _1024;
    float _1060 = _974 * _1028;
    float _1062 = _1024 * _1028;
    float _1064 = _990 * _1028;
    float _1066 = _1014 * _1028;
    float _1068 = _1060 * _1040;
    float _1070 = fma(_1044, _1054, _1056);
    float _1072 = fma(_1044, _1056, _1054);
    float _1074 = -_1030;
    float _1076 = fma(_1044, _1058, _1074);
    float _1078 = -_1040;
    float _1080 = _1044 * _1078;
    float _1082 = -_1058;
    float _1084 = fma(_1044, _1030, _1082);
    float _1086 = fma(_1070, _1038, _1068);
    float _1088 = _1064 * _1040;
    float _1090 = fma(_1062, _1038, _1080);
    float _1092 = fma(_1084, _1052, _1086);
    float _1094 = fma(_1076, _1038, _1088);
    float _1096 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1098 = fma(_1066, _1052, _1090);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1102 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1106 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1096);
    float _1108 = fma(_1072, _1052, _1094);
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1100);
    float _1112 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1102);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1104);
    float _1116 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1106);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1110);
    float _1120 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1112);
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1114);
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1132 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1124 + _1126;
    float _1136 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1138 = _1128 + _1130;
    float _1140 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1134 + _1142;
    float _1146 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1150 = _1138 + _1148;
    float _1152 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1154 = _1144 * _1144;
    float _1156 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1146);
    float _1158 = _1150 * _1150;
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1162 = _1154 + _1158;
    float _1164 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1166 = sqrt(_1162);
    float _1168 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1170 = floor(_1168);
    bool _1172 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1166 + _1174;
    float _1178 = -_1170;
    float _1180 = _1168 + _1178;
    float _1182 = 0.0;
    float _1184 = _1098;
    float _1186 = _1152;
    float _1188 = _1134;
    float _1190 = _1138;
    float _1192 = _1180;
    float _1194 = _1154;
    float _1196 = _1158;
    if (_1172)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1198;
    }
    float _1200 = _1182;
    if (_1172)
    {
        float _1202 = rsqrt(_1162);
        _1184 = _1202;
    }
    float _1204 = _1184;
    float _1206 = _1200;
    if (_1172)
    {
        float _1208 = _1176 * _1200;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1214 = _1210;
    if (_1172)
    {
        float _1216 = _1210 * 0.15915493667125701904296875;
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = _1212 + _1160;
    float _1222 = floor(_1164);
    float _1224 = _1218;
    float _1226 = _1220;
    if (_1172)
    {
        float _1228 = _1220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1228;
    }
    float _1230 = _1186;
    float _1232 = _1046;
    float _1234 = _1230;
    if (_1172)
    {
        float _1236 = _1218 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = -_1222;
    float _1244 = _1164 + _1242;
    if (_1172)
    {
        float _1246 = fma(_1240, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1246;
    }
    float _1248 = _1234;
    float _1250 = _1248;
    if (_1172)
    {
        float _1252 = _1204 * _1248;
        _1250 = _1252;
    }
    float _1254 = _1250;
    if (_1172)
    {
        float _1256 = fma(_1144, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1188 = _1256;
    }
    float _1258 = _1188;
    if (_1172)
    {
        float _1260 = fma(_1150, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1190 = _1260;
    }
    float _1262 = _1190;
    float _1264 = fma(_1258, 6.2500002968590706586837768554688e-05, 0.5);
    float _1266 = fma(_1262, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4630 = float2(_1264, _1266);
    float3 _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4630, float2(0.0), isnan(_4630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4630, float2(0.0), isnan(_4630)), level(0.0)).xyz;
    float _1272 = _1270.x;
    float _1274 = _1270.y;
    float _1276 = _1270.z;
    float2 _4646 = float2(_1244, _1180);
    float _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4646, float2(0.0), isnan(_4646)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4646, float2(0.0), isnan(_4646)), level(0.0)).x;
    float _1280 = in.m_59.w;
    float _1282 = in.m_69.y;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1290 = _1288 != 0;
    float _1292 = in.m_69.x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / _1286;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1302 = _1300 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1306 = _1304 != 0;
    bool _1308 = _750 > 0.5;
    bool _1310 = _736 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1312 = isnan(_736);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    bool _1322 = _1280 > 0.5;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1326 = _736 + _1324;
    float _1328 = -_1282;
    float _1330 = _1328 + 1.0;
    bool _1332 = _736 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1334 = isnan(_736);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1320;
    float _1346 = _1344 + 1.0;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1348;
    int _1352 = _1322 ? as_type<int>(_1330) : as_type<int>(_1282);
    float _1354 = _1350 * _1298;
    bool _1356 = _1322;
    float _1358 = _1298;
    float _1360 = _1282;
    int _1362 = as_type<int>(_1346);
    bool _1364 = _1306;
    float _1366 = _1330;
    if (_1290)
    {
        bool _1368 = _746 > 0.5;
        _1356 = _1368;
    }
    bool _1370 = _1356;
    if (!_1290)
    {
        _1358 = _1292;
    }
    float _1372 = _1358;
    float _1374 = in.m_73.x;
    float _1376 = in.m_73.y;
    float _1378 = in.m_73.z;
    float _1380 = _1302 ? as_type<float>(_1352) : _1282;
    float _1382 = fma(_1354, _1326, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1384 = _1002 != 0.0;
    bool _1386 = isnan(_1002);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan(0.0);
    bool _1392 = _1388 || _1390;
    float _1394 = _1342 * _1346;
    float _1396 = _1372;
    if (!_1290)
    {
        _1192 = _1372;
    }
    float _1398 = _1192;
    float _1400 = -_1342;
    float _1402 = _1400 + 1.0;
    float _1404 = _1398;
    if (_1290)
    {
        _1396 = _1292;
    }
    float _1406 = _1396;
    float _1408 = _1382 * _1394;
    bool _1410 = _1000 == 0.0;
    bool _1412 = !_1392;
    bool _1414 = _1410 && _1412;
    float _1416 = _1408;
    float _1418 = _1406;
    if (_1306)
    {
        float _1420 = _1308 ? _1330 : _1282;
        _1360 = _1420;
    }
    float _1422 = _1360;
    if (_1290)
    {
        float _1424 = -_1406;
        float _1426 = _1424 + 1.0;
        _1362 = as_type<int>(_1426);
    }
    int _1428 = _1362;
    bool _1430 = _1004 == 0.0;
    bool _1432 = _1430 && _1414;
    int _1434 = 0;
    if (_1296)
    {
        float _1436 = -_1406;
        float _1438 = _1436 + 1.0;
        _1434 = as_type<int>(_1438);
    }
    int _1440 = _1434;
    float _1442 = as_type<float>(_1440);
    if (_1296)
    {
        bool _1444 = _738 > 0.5;
        _1364 = _1444;
    }
    bool _1446 = _1364;
    float _1448 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1408);
    if (_1290)
    {
        float _1450 = _1370 ? as_type<float>(_1428) : _1406;
        _1404 = _1450;
    }
    float _1452 = _1404;
    float _1454 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = in.m_75.x;
    float _1458 = in.m_75.y;
    float _1460 = in.m_75.z;
    float _1462 = in.m_75.w;
    if (!_1296)
    {
        _1366 = _1406;
    }
    float _1464 = _1366;
    float _1466 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1448);
    float _1468 = _1464;
    if (_1296)
    {
        float _1470 = _1446 ? as_type<float>(_1440) : _1406;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1476 = 0.0;
    if (_1432)
    {
        _1476 = _1374;
    }
    float _1478 = _1476;
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = _1478;
    if (_1432)
    {
        _1442 = _1376;
    }
    float _1484 = _1442;
    float _1486 = 0.0;
    float _1488 = _1484;
    if (_1432)
    {
        _1486 = _1378;
    }
    float _1490 = _1486;
    float _1492 = _1490;
    if (_1432)
    {
        _1416 = _1478;
    }
    float _1494 = _1416;
    float _1496 = 0.0;
    float _1498 = _1494;
    if (_1432)
    {
        _1496 = _1484;
    }
    float _1500 = _1496;
    float _1502 = _1500;
    if (_1432)
    {
        _1418 = _1490;
    }
    float _1504 = _1418;
    float _1506 = _1504;
    if (!_1432)
    {
        _1482 = _1374;
    }
    float _1508 = _1482;
    if (!_1432)
    {
        _1488 = _1376;
    }
    float _1510 = _1488;
    if (!_1432)
    {
        _1492 = _1378;
    }
    float _1512 = _1492;
    if (!_1432)
    {
        float _1514 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1508);
        _1498 = _1514;
    }
    float _1516 = _1498;
    float _1518 = _1516;
    if (!_1432)
    {
        float _1520 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1510);
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1458 * _1512;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1528 = _1456 * _1510;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1532 = -_1524;
    float _1534 = fma(_1460, _1510, _1532);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1538 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = _1534 * _1462;
    float _1544 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1460 * _1508;
    float _1548 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1550 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1552 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_77.x = _1538;
    out.m_77.y = _1540;
    out.m_77.z = _1544;
    out.m_77.w = _1474;
    float _1554 = _1458;
    if (!_1432)
    {
        float _1556 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1512);
        _1506 = _1556;
    }
    float _1558 = _1506;
    float _1560 = -_1546;
    float _1562 = fma(_1456, _1512, _1560);
    float _1564 = -_1044;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1552);
    float _1568 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1570 = -_1528;
    float _1572 = fma(_1458, _1508, _1570);
    float _1574 = -_1044;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1548);
    float _1578 = -_1044;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1550);
    float _1582 = _1562 * _1462;
    float _1584 = _1572 * _1462;
    float _1586 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1576);
    float _1588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1590 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1594 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1568);
    float _1596 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1600 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1592);
    float _1602 = _1590;
    float _1604 = _1584;
    if (_1172)
    {
        float _1606 = _1218 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        _1602 = _1608;
    }
    float _1610 = _1602;
    float _1612 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1614 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1616 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1580);
    float _1618 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1566);
    float _1620 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1612);
    float _1622 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1614);
    float _1624 = _1586 * _1458;
    float _1626 = _1616 * _1458;
    float _1628 = _1618 * _1458;
    float _1630 = _1618 * _1522;
    float _1632 = _1582 * _1618;
    float _1634 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1620);
    float _1636 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1638 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1594);
    float _1640 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1598);
    float _1642 = _1620;
    if (_1172)
    {
        float _1644 = _1610 + (-1.0);
        _1554 = _1644;
    }
    float _1646 = _1554;
    float _1648 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1650 = _1586 * _1522;
    float _1652 = _1616 * _1522;
    if (_1172)
    {
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1654;
    }
    float _1656 = _1642;
    if (_1172)
    {
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1660 = _1258 + _1658;
        _1224 = _1660;
    }
    float _1662 = _1224;
    float _1664 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1636);
    float _1666 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1622);
    if (_1172)
    {
        float _1668 = fma(_1220, _1610, _1656);
        _1226 = _1668;
    }
    float _1670 = _1226;
    float _1672 = fma(_1638, _1516, _1650);
    float _1674 = fma(_1640, _1516, _1652);
    float _1676 = fma(_1648, _1516, _1630);
    if (_1172)
    {
        float _1678 = _1662 * _1662;
        _1194 = _1678;
    }
    float _1680 = _1194;
    if (_1172)
    {
        float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1684 = _1262 + _1682;
        _1518 = _1684;
    }
    float _1686 = _1518;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1670 + _1688;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1694 = _1582 * _1586;
    float _1696 = _1582 * _1616;
    if (_1172)
    {
        float _1698 = _1686 * _1686;
        _1196 = _1698;
    }
    float _1700 = _1196;
    float _1702 = fma(_1690, _1690, _1680);
    float _1704 = fma(_1638, _1456, _1624);
    float _1706 = fma(_1542, _1638, _1694);
    float _1708 = fma(_1640, _1456, _1626);
    float _1710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1712 = _1702 + _1700;
    float _1714 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1716 = fma(_1648, _1456, _1628);
    float _1718 = fma(_1542, _1640, _1696);
    float _1720 = fma(_1542, _1648, _1632);
    float _1722 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1724 = fma(_1664, _1558, _1672);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1728 = _1714 * _1692;
    float _1730 = fma(_1664, _1460, _1704);
    float _1732 = fma(_1584, _1664, _1706);
    float _1734 = fma(_1666, _1460, _1716);
    float _1736 = _1722 * _1588;
    float _1738 = fma(_1584, _1634, _1718);
    float _1740 = fma(_1634, _1558, _1674);
    float _1742 = sqrt(_1712);
    float _1744 = _1454 * _1710;
    float _1746 = fma(_1634, _1460, _1708);
    float _1748 = fma(_1584, _1666, _1720);
    float _1750 = fma(_1666, _1558, _1676);
    out.m_79.x = _1730;
    out.m_79.y = _1746;
    out.m_79.z = _1734;
    float _1752 = _1480 * _1726;
    out.m_81.x = _1732;
    out.m_81.y = _1738;
    out.m_81.z = _1748;
    out.m_83.x = _1736;
    out.m_83.y = _1744;
    out.m_83.z = _1752;
    out.m_83.w = _1728;
    bool _1754 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1756 = isnan(_1742);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1762 = _1758 || _1760;
    out.m_85.x = _1724;
    out.m_85.y = _1740;
    out.m_85.z = _1750;
    float _1764 = _1734;
    float _1766 = _1730;
    if (!_1762)
    {
        _1604 = 1.0;
    }
    float _1768 = _1604;
    out.m_87.x = _1272;
    out.m_87.y = _1274;
    out.m_87.z = _1276;
    bool _1770 = !_1762;
    float _1772 = _1768;
    float _1774 = _1274;
    float _1776 = _1276;
    if (!_1770)
    {
        bool _1778 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1780 = isnan(_1742);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1786 = _1782 || _1784;
        if (!_1786)
        {
            float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1790 = _1742 + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1794 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1800 = 1.0 / _1794;
            float _1802 = _1790 * _1800;
            float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1772 = _1804;
            _1774 = _1800;
            _1806 = true;
        }
        else
        {
            bool _1808 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1810 = isnan(_1742);
            bool _1812 = _1808 || _1810;
            bool _1814 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1816 = _1812 || _1814;
            if (!_1816)
            {
                float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1820 = _1742 + _1818;
                float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1824 = _1822 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1826 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1828 = _1826 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1830 = 1.0 / _1824;
                float _1832 = _1820 * _1830;
                float _1834 = fma(_1832, _1828, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1772 = _1834;
                _1774 = _1830;
                _1806 = true;
            }
            else
            {
                _1772 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1806 = false;
    float _1836 = _1772;
    float _1838 = _1774;
    float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1842 = _1670 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1846 = _1258 + _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1850 = _1262 + _1848;
    float _1852 = fma(_1842, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1854 = fma(_1846, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1856 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1858 = -_1212;
    float _1860 = _1858 + _1852;
    float _1862 = -_1124;
    float _1864 = _1862 + _1854;
    float _1866 = -_1128;
    float _1868 = _1866 + _1856;
    float _1870 = _1860 * _1860;
    float _1872 = fma(_1864, _1864, _1870);
    float _1874 = fma(_1868, _1868, _1872);
    float _1876 = sqrt(_1874);
    bool _1878 = _1876 > 0.0;
    float _1880 = _1876;
    float _1882 = _1838;
    if (!_1878)
    {
        _1880 = _1854;
    }
    float _1884 = _1880;
    float _1886 = _1884;
    if (!_1878)
    {
        _1882 = _1852;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (!_1878)
    {
        _1776 = _1856;
    }
    float _1892 = _1776;
    bool _1894 = !_1878;
    float _1896 = _1892;
    float _1898 = _1892;
    if (!_1894)
    {
        float _1900 = _196 * _196;
        float _1902 = fma(_194, _194, _1900);
        float _1904 = fma(_198, _198, _1902);
        float _1906 = rsqrt(_1874);
        float _1908 = sqrt(_1904);
        float _1910 = _1864 * _1906;
        float _1912 = _1860 * _1906;
        float _1914 = _1868 * _1906;
        bool _1916 = _1908 > 0.0;
        float _1918 = _1906;
        float _1920 = _1908;
        _1764 = _1912;
        _1766 = _1910;
        if (!_1916)
        {
            _1918 = _1854;
        }
        float _1922 = _1918;
        _1886 = _1922;
        if (!_1916)
        {
            _1920 = _1852;
        }
        float _1924 = _1920;
        _1890 = _1924;
        if (!_1916)
        {
            _1896 = _1856;
        }
        float _1926 = _1896;
        bool _1928 = !_1916;
        _1898 = _1926;
        if (!_1928)
        {
            float _1930 = rsqrt(_1904);
            float _1932 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1934 = _196 * _1930;
            float _1936 = _194 * _1930;
            float _1938 = _1912 * _1934;
            float _1940 = _198 * _1930;
            float _1942 = fma(_1910, _1936, _1938);
            float _1944 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1946 = fma(_1914, _1940, _1942);
            float _1948 = _1946 * _1944;
            float _1950 = fma(_194, _1948, _1854);
            float _1952 = fma(_196, _1948, _1852);
            float _1954 = fma(_198, _1948, _1856);
            _1890 = _1952;
            _1886 = _1950;
            _1898 = _1954;
        }
    }
    float _1956 = _1890;
    float _1958 = _1886;
    float _1960 = _1898;
    float _1962 = _1764;
    float _1964 = _1766;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1968 = _1956 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1972 = _1958 + _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1976 = _1960 + _1974;
    float _1978 = _1968 * _1968;
    float _1980 = fma(_1972, _1972, _1978);
    float _1982 = fma(_1976, _1976, _1980);
    float _1984 = rsqrt(_1982);
    float _1986 = sqrt(_1982);
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1990 = _1972 * _1988;
    float _1992 = _1976 * _1988;
    float _1994 = _1990 * _1990;
    float _1996 = _1992 * _1992;
    float _1998 = _1994 + _1996;
    float _2000 = sqrt(_1998);
    bool _2002 = _2000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _2000 + _2004;
    float _2008 = _1860;
    float _2010 = _2006;
    float _2012 = _1962;
    float _2014 = _1968;
    float _2016 = _1990;
    if (_2002)
    {
        float _2018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2018;
    }
    float _2020 = _2008;
    float _2022 = _2020;
    if (_2002)
    {
        float _2024 = _2006 * _2020;
        _2010 = _2024;
    }
    float _2026 = _2010;
    if (_2002)
    {
        float _2028 = rsqrt(_1998);
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = _2030;
    if (_2002)
    {
        float _2034 = _2026 * 0.15915493667125701904296875;
        _2012 = _2034;
    }
    float _2036 = _2012;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = _1976;
    if (_2002)
    {
        float _2042 = _2036 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        _2040 = _2044;
    }
    float _2046 = _2040;
    float _2048 = precise::max(0.0, _2038);
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2052 = _1964;
    float _2054 = _2048;
    if (_2002)
    {
        float _2056 = _2036 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = -_1988;
    float _2064 = -_2048;
    float _2066 = fma(_1968, _2062, _2064);
    if (_2002)
    {
        float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2014 = _2068;
    }
    float _2070 = _2014;
    float _2072 = _2046;
    float _2074 = _2070;
    if (_2002)
    {
        float _2076 = fma(_2046, _2070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2076;
    }
    float _2078 = _2072;
    float _2080 = _2078;
    if (!_2002)
    {
        _2074 = _2066;
    }
    float _2082 = _2074;
    float _2084 = _2082;
    if (_2002)
    {
        float _2086 = _2030 * _2078;
        _202 = _2086;
    }
    float _2088 = _202;
    if (!_2002)
    {
        _2080 = _1994;
    }
    float _2090 = _2080;
    float _2092 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2094 = _2090;
    float _2096 = _2060;
    if (_2002)
    {
        float _2098 = _2060 + (-1.0);
        _2054 = _2098;
    }
    float _2100 = _2054;
    float _2102 = _2100;
    if (_2002)
    {
        float _2104 = _1990 * _2088;
        _2016 = _2104;
    }
    float _2106 = _2016;
    float _2108 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2092);
    if (_2002)
    {
        float _2110 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2110;
    }
    float _2112 = _2032;
    if (!_2002)
    {
        _2102 = _1992;
    }
    float _2114 = _2102;
    float _2116 = _2114;
    if (_2002)
    {
        float _2118 = _2106 * _2106;
        _2094 = _2118;
    }
    float _2120 = _2094;
    if (_2002)
    {
        float _2122 = _1992 * _2088;
        _2116 = _2122;
    }
    float _2124 = _2116;
    if (_2002)
    {
        float _2126 = fma(_2066, _2060, _2112);
        _2084 = _2126;
    }
    float _2128 = _2084;
    if (!_2002)
    {
        _2096 = _1996;
    }
    float _2130 = _2096;
    float _2132 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2134 = _2130;
    if (_2002)
    {
        float _2136 = _2124 * _2124;
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = fma(_2128, _2128, _2120);
    float _2142 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2144 = _2140 + _2138;
    float _2146 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2150 = fma(_1986, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2148);
    float _2152 = precise::clamp(_2150, 0.0, 1.0);
    float _2154 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2142);
    float _2156 = rsqrt(_2144);
    float _2158 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2160 = -_2152;
    float _2162 = _2160 + 1.0;
    float _2164 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2146);
    float _2166 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2168 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2158);
    float _2170 = abs(_2162);
    float _2172 = log2(_2170);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2176 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2178 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2180 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2182 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2108);
    float _2184 = -_2178;
    float _2186 = fma(_2184, _2050, 1.0);
    float _2188 = _2156 * _2106;
    float _2190 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2194 = _2156 * _2128;
    float _2196 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2198 = _2156 * _2124;
    float _2200 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2192);
    float _2202 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2204 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2206 = -_2196;
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2206);
    float _2210 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2200);
    float _2212 = log2(_2186);
    float _2214 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2216 = -_2198;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2208);
    float _2220 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2210);
    float _2222 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2224 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2214);
    float _2226 = fma(_2218, -0.5, 0.5);
    float _2228 = fma(_2218, 0.5, 0.5);
    float _2230 = exp2(_2204);
    float _2232 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2222);
    float _2234 = _2194 + 1.0;
    float _2236 = fma(_2228, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2238 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2224);
    float _2240 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2232);
    float _2242 = fma(_2228, _2236, -0.212114393711090087890625);
    float _2244 = 1.0 / _2220;
    float _2246 = _2212 * 0.693147182464599609375;
    float _2248 = fma(_2228, _2242, 1.570728778839111328125);
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2252 = sqrt(_2226);
    float _2254 = -_2194;
    float _2256 = fma(_2230, _2234, _2254);
    float _2258 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2240);
    float _2260 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2238);
    float _2262 = _2258 * _2244;
    float _2264 = _2260 * _2244;
    float _2266 = fma(_2262, 0.5, 0.5);
    float _2268 = fma(_2264, -0.5, 0.5);
    float _2270 = fma(_2256, 0.5, 0.5);
    float _2272 = _2252 * 0.636619746685028076171875;
    float3 _6349 = float3(_2266, _2268, _2250);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).x;
    float3 _6360 = float3(_2266, _2268, _2250);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6360, float3(0.0), isnan(_6360)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6360, float3(0.0), isnan(_6360)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float _2287 = -_2248;
    float _2289 = fma(_2272, _2287, 1.0);
    float2 _6381 = float2(_2289, _2270);
    float3 _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6381, float2(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6381, float2(0.0), isnan(_6381)), level(0.0)).xyz;
    float _2293 = _2291.x;
    float _2295 = _2291.y;
    float _2297 = _2291.z;
    float _2299 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2301 = -_1278;
    float _2303 = _2301 + 1.0;
    bool _2305 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2307 = isnan(_1986);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2299);
    float _2317 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2319 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2315);
    float _2321 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2317);
    float _2323 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2325 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2321);
    float _2327 = 1.0 / _2323;
    float _2329 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2331 = _2329 + _2323;
    float _2333 = _2331 * _2327;
    float _2335 = _2333 * 0.5;
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2339 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2337);
    float _2341 = 1.0 / _2339;
    float _2343 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2345 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2347 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2343);
    float _2349 = _2220 * 0.5;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2353 = _2341 * _2351;
    float _2355 = exp2(_2345);
    float _2357 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2347);
    float _2359 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2357);
    float _2361 = abs(_2353);
    float _2363 = log2(_2361);
    float _2365 = _2359 + _2220;
    out.gl_Position.x = _2258;
    out.gl_Position.y = _2260;
    out.gl_Position.z = _2359;
    out.gl_Position.w = _2220;
    float _2367 = _2365 * 0.5;
    bool _2369 = _2353 <= 8000.0;
    bool _2371 = isnan(_2353);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(8000.0);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    float _2381 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2383 = _2359;
    float _2385 = _2260;
    float _2387 = _2220;
    float _2389 = _2258;
    if (!_2313)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2391 = _2383;
    float _2393 = exp2(_2381);
    float _2395 = fma(_2393, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = fma(_2397, -2.0, 3.0);
    float _2401 = _2397 * _2397;
    float _2403 = in.m_89.x;
    float _2405 = _2401 * _2399;
    float _2407 = -_2405;
    float _2409 = _2407 + 1.0;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2405);
    float _2413 = _2379 * _2411;
    float _2415 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2417 = _2303 * _2415;
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = -_2355;
    float _2423 = _2421 + 1.0;
    float _2425 = fma(_2260, -0.5, _2349);
    float _2427 = _2425;
    float _2429 = _2391;
    float _2431 = _2391;
    if (!_2313)
    {
        _2385 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2433 = _2385;
    float _2435 = -_2419;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2439 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2441 = _2437 * _2403;
    float _2443 = _2258 + _2220;
    float _2445 = _2433;
    float _2447 = _2433;
    if (!_2313)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2449 = _2387;
    float _2451 = _2441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2453 = _2443 * 0.5;
    float _2455 = _2453;
    float _2457 = _2449;
    float _2459 = _2449;
    if (!_2313)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2461 = _2389;
    out.m_91.x = _2451;
    out.m_93.x = _2453;
    out.m_93.y = _2425;
    out.m_93.z = _2367;
    out.m_93.w = _2220;
    float _2463 = _2461;
    float _2465 = _2461;
    if (!_2313)
    {
        _2427 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2467 = _2427;
    float _2469 = _2467;
    float _2471 = _2467;
    if (!_2313)
    {
        _2455 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2473 = _2455;
    float _2475 = _2439 * _2274;
    float _2477 = -_2439;
    float _2479 = _2477 + 1.0;
    float _2481 = _2285 * _2475;
    float _2483 = _2297 * _2475;
    float _2485 = fma(_2293, _2481, _2279);
    float _2487 = fma(_2295, _2481, _2281);
    float _2489 = _2285 * _2479;
    float _2491 = fma(_2285, _2483, _2283);
    out.m_95.x = _2485;
    out.m_95.y = _2487;
    out.m_95.z = _2491;
    out.m_95.w = _2489;
    bool _2493 = !_2313;
    float _2495 = _2473;
    float _2497 = _2473;
    if (!_2493)
    {
        bool _2499 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2501 = isnan(_1986);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2507 = _2503 || _2505;
        if (!_2507)
        {
            float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2511 = _1986 + _2509;
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2513;
            float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2521 = 1.0 / _2515;
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2539 = _2511 * _2521;
            float _2541 = precise::clamp(_2539, 0.0, 1.0);
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2547 = fma(_2541, _2519, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2497 = _2551;
            _2447 = _2555;
            _2471 = _2547;
            _2431 = _2553;
            _2459 = _2549;
            _2465 = _2557;
            _2559 = true;
        }
        else
        {
            bool _2561 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2563 = isnan(_1986);
            bool _2565 = _2561 || _2563;
            bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2569 = _2565 || _2567;
            if (!_2569)
            {
                _2469 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2571 = _2469;
            _2471 = _2571;
            if (!_2569)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2573 = _2495;
            _2497 = _2573;
            if (!_2569)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2575 = _2457;
            _2459 = _2575;
            if (!_2569)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2429;
            _2431 = _2577;
            if (!_2569)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2445;
            _2447 = _2579;
            if (!_2569)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2463;
            bool _2583 = !_2569;
            _2465 = _2581;
            if (!_2583)
            {
                bool _2585 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2587 = isnan(_1986);
                bool _2589 = _2585 || _2587;
                bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2593 = _2589 || _2591;
                if (!_2593)
                {
                    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2597 = _1986 + _2595;
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2599;
                    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2607 = 1.0 / _2601;
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2625 = _2597 * _2607;
                    float _2627 = precise::clamp(_2625, 0.0, 1.0);
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2633 = fma(_2627, _2605, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2635 = fma(_2627, _2631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2637 = fma(_2627, _2611, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2639 = fma(_2627, _2615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2641 = fma(_2627, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2643 = fma(_2627, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2497 = _2637;
                    _2447 = _2641;
                    _2471 = _2633;
                    _2431 = _2639;
                    _2459 = _2635;
                    _2465 = _2643;
                    _2559 = true;
                }
                else
                {
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2471 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2559 = false;
    float _2645 = _2497;
    float _2647 = _2447;
    float _2649 = _2471;
    float _2651 = _2431;
    float _2653 = _2459;
    float _2655 = _2465;
    float _2657 = fma(_1740, -0.5, 0.5);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = -_2645;
    float _2663 = _2661 + _2647;
    float _2665 = -_2649;
    float _2667 = _2665 + _2651;
    float _2669 = -_2653;
    float _2671 = _2669 + _2655;
    bool _2673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2675 = fma(_2659, _2663, _2645);
    float _2677 = fma(_2659, _2667, _2649);
    float _2679 = fma(_2659, _2671, _2653);
    float _2681 = _2675 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2683 = fma(_2677, 0.298911988735198974609375, _2681);
    float _2685 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2687 = fma(_2679, 0.114477999508380889892578125, _2683);
    out.m_53.x = _2685;
    float _2689 = -_2687;
    float _2691 = _2677 + _2689;
    float _2693 = -_2687;
    float _2695 = _2675 + _2693;
    float _2697 = -_2687;
    float _2699 = _2679 + _2697;
    float _2701 = fma(_2691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    float _2703 = fma(_2695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    float _2705 = fma(_2699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    out.m_99.x = _2701;
    out.m_99.y = _2703;
    out.m_99.z = _2705;
    if (!_2673)
    {
        return out;
    }
    float _2707 = -_1956;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2711 = -_1958;
    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2715 = -_1960;
    float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2719 = _2709 * _2709;
    float _2721 = fma(_2713, _2713, _2719);
    float _2723 = fma(_2717, _2717, _2721);
    float _2725 = sqrt(_2723);
    float _2727 = rsqrt(_2723);
    float _2729 = -_2725;
    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2733 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2735 = precise::clamp(_2733, 0.0, 1.0);
    float _2737 = _2713 * _2727;
    float _2739 = _2709 * _2727;
    float _2741 = abs(_2735);
    float _2743 = log2(_2741);
    float _2745 = _2717 * _2727;
    float _2747 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2749 = _1740 * _2739;
    float _2751 = -_2739;
    float _2753 = -_2747;
    float _2755 = fma(_2751, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2753);
    float _2757 = fma(_1724, _2737, _2749);
    float _2759 = -_2745;
    float _2761 = fma(_2759, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2755);
    float _2763 = fma(_1750, _2745, _2757);
    float _2765 = precise::clamp(_2763, 0.0, 1.0);
    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2769 = _2761 + _2767;
    float _2771 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2775 = precise::clamp(_2773, 0.0, 1.0);
    float _2777 = exp2(_2771);
    float _2779 = _2777 * _2775;
    float _2781 = _2765 * _2779;
    float _2783 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2787 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2783;
    out.m_97.y = _2785;
    out.m_97.z = _2787;
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
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_99 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_93 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_97 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_95 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2559 = false;
    bool _1806 = false;
    bool _728 = false;
    bool _498 = false;
    bool _222 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _113 = in.m_50.w;
    float _115 = trunc(_113);
    int _118 = int(_115);
    bool _122 = _118 >= 1;
    float _124 = 0.0;
    if (!_122)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _124;
    if (!_122)
    {
        out.m_53.x = 0.0;
    }
    int _128 = 0;
    if (!_122)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_122)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2843 = as_type<float>(_132);
        out.gl_Position.z = _2843;
    }
    if (!_122)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _136 = in.m_55.w;
    bool _138 = _136 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _140 = isnan(_136);
    bool _142 = _138 || _140;
    bool _144 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _146 = _142 || _144;
    float _148 = -_136;
    float _150 = _148 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _152 = 0.0;
    float _154 = _150;
    if (_146)
    {
        float _156 = float(_118);
        _152 = _156;
    }
    float _158 = _152;
    bool _160 = _150 >= _158;
    bool _162 = !_146;
    bool _164 = _160 || _162;
    float _166 = 0.0;
    if (_164)
    {
        _166 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _168 = _166;
    if (_164)
    {
        out.m_53.x = 0.0;
    }
    if (_164)
    {
        float _170 = _168 * 5.0;
        _134 = as_type<int>(_170);
    }
    int _172 = _134;
    if (_164)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2912 = as_type<float>(_172);
        out.gl_Position.z = _2912;
    }
    if (_164)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _174 = in.m_57.x;
    float _176 = in.m_57.y;
    float _178 = in.m_57.z;
    bool _180 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _182 = _176 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _184 = _176 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _186 = _176 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _188 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[4].x, _182);
    float _190 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[5].x, _184);
    float _192 = fma(_174, (*spvDescriptorSet0.vp_c10)._m0[6].x, _186);
    float _194 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[4].z, _188);
    float _196 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[5].z, _190);
    float _198 = fma(_178, (*spvDescriptorSet0.vp_c10)._m0[6].z, _192);
    bool _200 = !_180;
    float _202 = _196;
    float _220;
    if (!_200)
    {
        float _204 = in.m_59.x;
        float _206 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _208 = _204 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _210 = fma(_208, (*spvDescriptorSet0.vp_c9)._m0[12].x, _150);
        float _212 = _210 * _206;
        float _214 = floor(_212);
        float _216 = -_214;
        float _218 = _212 + _216;
        _220 = _218;
        _222 = true;
    }
    else
    {
        float _224 = float(_118);
        float _226 = 1.0 / _224;
        float _228 = _150 * _226;
        _220 = _228;
    }
    _222 = false;
    float _230 = _220;
    float _232 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _234 = _230 + _232;
    float _236 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _238 = _230 + _236;
    float _240 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _242 = _230 + _240;
    float _244 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _244;
    float _248 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _250 = _248 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _252;
    float _256 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _258 = _256 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _260 = 1.0 / _246;
    bool _262 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _264 = isnan(_230);
    bool _266 = _262 || _264;
    bool _268 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _270 = _266 || _268;
    float _272 = float(_270);
    float _274 = 1.0 / _254;
    bool _276 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _278 = 1.0 / _258;
    float _280 = _234 * _260;
    bool _282 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _284 = isnan(_230);
    bool _286 = _282 || _284;
    bool _288 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _290 = _286 || _288;
    float _292 = float(_290);
    float _294 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _296 = _230 + _294;
    float _298 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _300 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _298;
    float _302 = -_292;
    float _304 = _302 + 1.0;
    float _306 = 1.0 / _250;
    float _308 = _238 * _274;
    bool _310 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _312 = isnan(_230);
    bool _314 = _310 || _312;
    bool _316 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _318 = _314 || _316;
    float _320 = float(_318);
    float _322 = fma(_300, _308, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _324 = _242 * _278;
    float _326 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _328 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _326;
    float _330 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _332 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _330;
    float _334 = fma(_328, _308, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _336 = fma(_332, _308, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _338 = _296 * _306;
    bool _340 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _342 = isnan(_230);
    bool _344 = _340 || _342;
    bool _346 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _348 = _344 || _346;
    float _350 = float(_348);
    float _352 = _320 * _304;
    float _354 = -_320;
    float _356 = _354 + 1.0;
    bool _358 = _230 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _360 = isnan(_230);
    bool _362 = _358 || _360;
    bool _364 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _366 = _362 || _364;
    float _368 = float(_366);
    float _370 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _372 = _370 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _374 = -_350;
    float _376 = _374 + 1.0;
    float _378 = _350 * _356;
    float _380 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _382 = _380 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _384 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _386 = _384 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _388 = _272 * _376;
    float _390 = -_272;
    float _392 = _390 + 1.0;
    float _394 = fma(_372, _324, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _396 = fma(_382, _324, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_386, _324, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = _368 * _392;
    float _402 = -_368;
    float _404 = _402 + 1.0;
    float _406 = _334 * _400;
    float _408 = _336 * _400;
    float _410 = _322 * _400;
    float _412 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _414 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _412;
    float _416 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].x, _406);
    float _418 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].y, _408);
    float _420 = fma(_404, (*spvDescriptorSet0.vp_c9)._m0[143].z, _410);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _428 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _426;
    float _430 = fma(_414, _280, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _432 = fma(_394, _388, _416);
    float _434 = fma(_398, _388, _420);
    float _436 = fma(_424, _280, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _438 = fma(_396, _388, _418);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _448 = fma(_428, _280, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _452 = _450 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _454 = fma(_430, _378, _432);
    float _456 = fma(_442, _338, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _458 = fma(_446, _338, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _460 = fma(_436, _378, _438);
    float _462 = fma(_452, _338, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _464 = fma(_448, _378, _434);
    float _466 = fma(_456, _352, _454);
    float _468 = fma(_458, _352, _460);
    float _470 = fma(_462, _352, _464);
    float _472 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].x, _466);
    float _474 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].y, _468);
    float _476 = fma(_292, (*spvDescriptorSet0.vp_c9)._m0[147].z, _470);
    bool _478 = !_276;
    float _496;
    if (!_478)
    {
        float _480 = in.m_59.x;
        float _482 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _484 = _480 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _486 = fma(_484, (*spvDescriptorSet0.vp_c9)._m0[11].y, _150);
        float _488 = _486 * _482;
        float _490 = floor(_488);
        float _492 = -_490;
        float _494 = _488 + _492;
        _496 = _494;
        _498 = true;
    }
    else
    {
        float _500 = float(_118);
        float _502 = 1.0 / _500;
        float _504 = _150 * _502;
        _496 = _504;
    }
    _498 = false;
    float _506 = _496;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _510 = _506 + _508;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _520 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _522 = isnan(_506);
    bool _524 = _520 || _522;
    bool _526 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _528 = _524 || _526;
    float _530 = float(_528);
    float _532 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _534 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _532;
    float _536 = 1.0 / _514;
    float _538 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _540 = _538 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _542 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _544 = isnan(_506);
    bool _546 = _542 || _544;
    bool _548 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _550 = _546 || _548;
    float _552 = float(_550);
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _556 = _554 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _558 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _560 = isnan(_506);
    bool _562 = _558 || _560;
    bool _564 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _566 = _562 || _564;
    float _568 = float(_566);
    float _570 = 1.0 / _518;
    float _572 = -_552;
    float _574 = _572 + 1.0;
    bool _576 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _578 = _530 * _574;
    float _580 = _534 * _536;
    bool _582 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _584 = isnan(_506);
    bool _586 = _582 || _584;
    bool _588 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _590 = _586 || _588;
    float _592 = float(_590);
    float _594 = -_530;
    float _596 = _594 + 1.0;
    float _598 = 1.0 / _540;
    float _600 = fma(_580, _510, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _604 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _602;
    float _606 = _592 * _596;
    float _608 = -_592;
    float _610 = _608 + 1.0;
    float _612 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _614 = _612 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _616 = 1.0 / _556;
    float _618 = _568 * _610;
    float _620 = _614 * _570;
    float _622 = -_568;
    float _624 = _622 + 1.0;
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = _506 + _626;
    float _630 = _600 * _618;
    float _632 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _634 = _506 + _632;
    float _636 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _638 = _636 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _640 = _604 * _598;
    bool _642 = _506 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _644 = isnan(_506);
    bool _646 = _642 || _644;
    bool _648 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _650 = _646 || _648;
    float _652 = float(_650);
    float _654 = fma(_620, _634, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _656 = fma(_624, (*spvDescriptorSet0.vp_c9)._m0[115].x, _630);
    float _658 = fma(_640, _628, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _660 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _662 = _506 + _660;
    float _664 = -_652;
    float _666 = _664 + 1.0;
    float _668 = fma(_654, _606, _656);
    float _670 = _638 * _616;
    float _672 = _552 * _666;
    float _674 = fma(_658, _578, _668);
    float _676 = fma(_670, _662, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _678 = fma(_676, _672, _674);
    float _680 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _684 = fma(_652, (*spvDescriptorSet0.vp_c9)._m0[119].x, _678);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _688 = _680 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _690 = _682 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _694 = _686 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _696 = in.m_61.x;
    float _698 = in.m_61.y;
    float _700 = in.m_61.z;
    out.m_63.x = _688;
    out.m_63.y = _690;
    out.m_63.z = _694;
    out.m_63.w = _692;
    float _702 = _476 * _700;
    float _704 = _474 * _698;
    float _706 = _472 * _696;
    bool _708 = !_576;
    float _726;
    if (!_708)
    {
        float _710 = in.m_59.x;
        float _712 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _714 = _710 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _716 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[11].w, _150);
        float _718 = _716 * _712;
        float _720 = floor(_718);
        float _722 = -_720;
        float _724 = _718 + _722;
        _726 = _724;
        _728 = true;
    }
    else
    {
        float _730 = float(_118);
        float _732 = 1.0 / _730;
        float _734 = _150 * _732;
        _726 = _734;
    }
    _728 = false;
    float _736 = _726;
    float _738 = in.m_59.z;
    float _740 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _742 = log2(_740);
    float _744 = _704 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _746 = in.m_59.x;
    float _748 = _706 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _750 = in.m_59.y;
    float _752 = _742 * _150;
    float _754 = exp2(_752);
    float _756 = _738 * 2.0;
    float _758 = _746 * 2.0;
    float _760 = floor(_756);
    float _762 = _746 + _750;
    float _764 = _750 * 2.0;
    float _766 = _762 + (-1.0);
    float _768 = -_754;
    float _770 = _768 + 1.0;
    float _772 = floor(_758);
    float _774 = fma(_766, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _776 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _778 = 1.0 + _776;
    bool _780 = _760 > 0.0;
    float _782 = floor(_764);
    bool _784 = _760 >= 0.0;
    bool _786 = isnan(_760);
    bool _788 = _784 || _786;
    bool _790 = isnan(0.0);
    bool _792 = _788 || _790;
    int _794 = _792 ? 0 : 1;
    int _796 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _798 = _796 != 0;
    int _800 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _802 = _800 != 0;
    int _804 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _806 = _804 != 0;
    float _808 = 1.0 / _778;
    int _810 = ~_794;
    int _812 = _810 + 1;
    int _814 = _812 + 1;
    bool _816 = _772 > 0.0;
    bool _818 = _772 >= 0.0;
    bool _820 = isnan(_772);
    bool _822 = _818 || _820;
    bool _824 = isnan(0.0);
    bool _826 = _822 || _824;
    int _828 = _814;
    if (!_780)
    {
        int _830 = ~_794;
        int _832 = _830 + 1;
        _828 = _832;
    }
    int _834 = _828;
    float _836 = in.m_65.x;
    float _838 = in.m_65.y;
    float _840 = in.m_65.z;
    bool _842 = !_798;
    int _844 = _842 ? 0 : 1;
    bool _846 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _848 = isnan(1.0);
    bool _850 = _846 || _848;
    bool _852 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _854 = _850 || _852;
    int _856 = abs(_844);
    bool _858 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _860 = isnan(0.0);
    bool _862 = _858 || _860;
    bool _864 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _866 = _862 || _864;
    float _868 = float(_856);
    float _870 = float(_834);
    float _872 = _866 ? _770 : 0.0;
    int _874 = _826 ? 0 : 1;
    float _876 = _868 * _870;
    bool _878 = !_802;
    int _880 = _878 ? 0 : 1;
    if (_854)
    {
        float _882 = _872 * _808;
        _154 = _882;
    }
    float _884 = _154;
    bool _886 = _782 > 0.0;
    float _888 = _746 + (-0.5);
    int _890 = ~_874;
    int _892 = _890 + 1;
    int _894 = _892 + 1;
    bool _896 = _782 >= 0.0;
    bool _898 = isnan(_782);
    bool _900 = _896 || _898;
    bool _902 = isnan(0.0);
    bool _904 = _900 || _902;
    float _906 = _876 * (-2.0);
    int _908 = _894;
    if (!_816)
    {
        int _910 = ~_874;
        int _912 = _910 + 1;
        _908 = _912;
    }
    int _914 = _908;
    int _916 = abs(_880);
    float _918 = fma(_906, _836, _836);
    bool _920 = !_806;
    int _922 = _920 ? 0 : 1;
    float _924 = fma(_774, _906, _774);
    float _926 = float(_916);
    float _928 = fma(_888, (*spvDescriptorSet0.vp_c9)._m0[196].x, _918);
    float _930 = float(_914);
    float _932 = _750 + _738;
    int _934 = _904 ? 0 : 1;
    int _936 = abs(_922);
    float _938 = _926 * _930;
    int _940 = ~_934;
    int _942 = _940 + 1;
    int _944 = _942 + 1;
    float _946 = _932 + (-1.0);
    int _948 = _944;
    if (!_886)
    {
        int _950 = ~_934;
        int _952 = _950 + 1;
        _948 = _952;
    }
    int _954 = _948;
    float _956 = _938 * (-2.0);
    float _958 = fma(_924, _884, _928);
    float _960 = float(_936);
    float _962 = _958 * 0.15915493667125701904296875;
    float _964 = float(_954);
    float _966 = fma(_946, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _968 = fma(_956, _838, _838);
    float _970 = _746 + _738;
    float _972 = _962 * 6.283185482025146484375;
    float _974 = cos(_972);
    float _976 = _960 * _964;
    float _978 = _750 + (-0.5);
    float _980 = fma(_966, _956, _966);
    float _982 = _970 + (-1.0);
    float _984 = fma(_978, (*spvDescriptorSet0.vp_c9)._m0[196].y, _968);
    float _986 = _976 * (-2.0);
    float _988 = _962 * 6.283185482025146484375;
    float _990 = sin(_988);
    float _992 = fma(_982, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _994 = fma(_980, _884, _984);
    float _996 = fma(_986, _840, _840);
    float _998 = _738 + (-0.5);
    float _1000 = in.m_67.x;
    float _1002 = in.m_67.y;
    float _1004 = in.m_67.z;
    float _1006 = fma(_992, _986, _992);
    float _1008 = _994 * 0.15915493667125701904296875;
    float _1010 = fma(_998, (*spvDescriptorSet0.vp_c9)._m0[196].z, _996);
    float _1012 = _1008 * 6.283185482025146484375;
    float _1014 = sin(_1012);
    float _1016 = fma(_1006, _884, _1010);
    float _1018 = _702 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _1020 = _1016 * 0.15915493667125701904296875;
    float _1022 = _1008 * 6.283185482025146484375;
    float _1024 = cos(_1022);
    float _1026 = _1020 * 6.283185482025146484375;
    float _1028 = cos(_1026);
    float _1030 = _974 * _1014;
    float _1032 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1000);
    float _1034 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1002);
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1004);
    float _1038 = _1032 * _748;
    float _1040 = _1034 * _744;
    float _1042 = _1020 * 6.283185482025146484375;
    float _1044 = sin(_1042);
    float _1046 = in.m_50.x;
    float _1048 = in.m_50.y;
    float _1050 = in.m_50.z;
    float _1052 = _1036 * _1018;
    float _1054 = _974 * _1024;
    float _1056 = _990 * _1014;
    float _1058 = _990 * _1024;
    float _1060 = _974 * _1028;
    float _1062 = _1024 * _1028;
    float _1064 = _990 * _1028;
    float _1066 = _1014 * _1028;
    float _1068 = _1060 * _1040;
    float _1070 = fma(_1044, _1054, _1056);
    float _1072 = fma(_1044, _1056, _1054);
    float _1074 = -_1030;
    float _1076 = fma(_1044, _1058, _1074);
    float _1078 = -_1040;
    float _1080 = _1044 * _1078;
    float _1082 = -_1058;
    float _1084 = fma(_1044, _1030, _1082);
    float _1086 = fma(_1070, _1038, _1068);
    float _1088 = _1064 * _1040;
    float _1090 = fma(_1062, _1038, _1080);
    float _1092 = fma(_1084, _1052, _1086);
    float _1094 = fma(_1076, _1038, _1088);
    float _1096 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1098 = fma(_1066, _1052, _1090);
    float _1100 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1102 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1104 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1106 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1096);
    float _1108 = fma(_1072, _1052, _1094);
    float _1110 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1100);
    float _1112 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1102);
    float _1114 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1104);
    float _1116 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1106);
    float _1118 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1110);
    float _1120 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1112);
    float _1122 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1114);
    float _1124 = _1116 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1126 = _1118 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1128 = _1120 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1130 = _1122 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1132 = _1048 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1134 = _1124 + _1126;
    float _1136 = _1092 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1138 = _1128 + _1130;
    float _1140 = fma(_1046, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1132);
    float _1142 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1144 = _1134 + _1142;
    float _1146 = fma(_1098, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1136);
    float _1148 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1150 = _1138 + _1148;
    float _1152 = fma(_1050, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1140);
    float _1154 = _1144 * _1144;
    float _1156 = fma(_1108, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1146);
    float _1158 = _1150 * _1150;
    float _1160 = _1156 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1162 = _1154 + _1158;
    float _1164 = fma(_1124, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1166 = sqrt(_1162);
    float _1168 = fma(_1128, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1170 = floor(_1168);
    bool _1172 = _1166 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1174 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1176 = _1166 + _1174;
    float _1178 = -_1170;
    float _1180 = _1168 + _1178;
    float _1182 = 0.0;
    float _1184 = _1098;
    float _1186 = _1152;
    float _1188 = _1134;
    float _1190 = _1138;
    float _1192 = _1180;
    float _1194 = _1154;
    float _1196 = _1158;
    if (_1172)
    {
        float _1198 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1182 = _1198;
    }
    float _1200 = _1182;
    if (_1172)
    {
        float _1202 = rsqrt(_1162);
        _1184 = _1202;
    }
    float _1204 = _1184;
    float _1206 = _1200;
    if (_1172)
    {
        float _1208 = _1176 * _1200;
        _1206 = _1208;
    }
    float _1210 = _1206;
    float _1212 = _1152 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1214 = _1210;
    if (_1172)
    {
        float _1216 = _1210 * 0.15915493667125701904296875;
        _1214 = _1216;
    }
    float _1218 = _1214;
    float _1220 = _1212 + _1160;
    float _1222 = floor(_1164);
    float _1224 = _1218;
    float _1226 = _1220;
    if (_1172)
    {
        float _1228 = _1220 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1186 = _1228;
    }
    float _1230 = _1186;
    float _1232 = _1046;
    float _1234 = _1230;
    if (_1172)
    {
        float _1236 = _1218 * 6.283185482025146484375;
        float _1238 = sin(_1236);
        _1232 = _1238;
    }
    float _1240 = _1232;
    float _1242 = -_1222;
    float _1244 = _1164 + _1242;
    if (_1172)
    {
        float _1246 = fma(_1240, _1230, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1246;
    }
    float _1248 = _1234;
    float _1250 = _1248;
    if (_1172)
    {
        float _1252 = _1204 * _1248;
        _1250 = _1252;
    }
    float _1254 = _1250;
    if (_1172)
    {
        float _1256 = fma(_1144, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _1188 = _1256;
    }
    float _1258 = _1188;
    if (_1172)
    {
        float _1260 = fma(_1150, _1254, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1190 = _1260;
    }
    float _1262 = _1190;
    float _1264 = fma(_1258, 6.2500002968590706586837768554688e-05, 0.5);
    float _1266 = fma(_1262, 6.2500002968590706586837768554688e-05, 0.5);
    float2 _4630 = float2(_1264, _1266);
    float3 _1270 = dm_bs(spvDescriptorSet0.vp_t_tcb_20.sample(spvDescriptorSet0.vp_t_tcb_20Smplr, select(_4630, float2(0.0), isnan(_4630)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_20, spvDescriptorSet0.vp_t_tcb_20Smplr_w, select(_4630, float2(0.0), isnan(_4630)), level(0.0)).xyz;
    float _1272 = _1270.x;
    float _1274 = _1270.y;
    float _1276 = _1270.z;
    float2 _4646 = float2(_1244, _1180);
    float _1278 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4646, float2(0.0), isnan(_4646)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4646, float2(0.0), isnan(_4646)), level(0.0)).x;
    float _1280 = in.m_59.w;
    float _1282 = in.m_69.y;
    float _1284 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1286 = _1284 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _1288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1290 = _1288 != 0;
    float _1292 = in.m_69.x;
    int _1294 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1296 = _1294 != 0;
    float _1298 = 1.0 / _1286;
    int _1300 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1302 = _1300 != 0;
    out.m_71.x = 1.0;
    out.m_71.y = 1.0;
    out.m_71.z = 1.0;
    int _1304 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1306 = _1304 != 0;
    bool _1308 = _750 > 0.5;
    bool _1310 = _736 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1312 = isnan(_736);
    bool _1314 = _1310 || _1312;
    bool _1316 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1318 = _1314 || _1316;
    float _1320 = float(_1318);
    bool _1322 = _1280 > 0.5;
    float _1324 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1326 = _736 + _1324;
    float _1328 = -_1282;
    float _1330 = _1328 + 1.0;
    bool _1332 = _736 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1334 = isnan(_736);
    bool _1336 = _1332 || _1334;
    bool _1338 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1340 = _1336 || _1338;
    float _1342 = float(_1340);
    float _1344 = -_1320;
    float _1346 = _1344 + 1.0;
    float _1348 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1348;
    int _1352 = _1322 ? as_type<int>(_1330) : as_type<int>(_1282);
    float _1354 = _1350 * _1298;
    bool _1356 = _1322;
    float _1358 = _1298;
    float _1360 = _1282;
    int _1362 = as_type<int>(_1346);
    bool _1364 = _1306;
    float _1366 = _1330;
    if (_1290)
    {
        bool _1368 = _746 > 0.5;
        _1356 = _1368;
    }
    bool _1370 = _1356;
    if (!_1290)
    {
        _1358 = _1292;
    }
    float _1372 = _1358;
    float _1374 = in.m_73.x;
    float _1376 = in.m_73.y;
    float _1378 = in.m_73.z;
    float _1380 = _1302 ? as_type<float>(_1352) : _1282;
    float _1382 = fma(_1354, _1326, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _1384 = _1002 != 0.0;
    bool _1386 = isnan(_1002);
    bool _1388 = _1384 || _1386;
    bool _1390 = isnan(0.0);
    bool _1392 = _1388 || _1390;
    float _1394 = _1342 * _1346;
    float _1396 = _1372;
    if (!_1290)
    {
        _1192 = _1372;
    }
    float _1398 = _1192;
    float _1400 = -_1342;
    float _1402 = _1400 + 1.0;
    float _1404 = _1398;
    if (_1290)
    {
        _1396 = _1292;
    }
    float _1406 = _1396;
    float _1408 = _1382 * _1394;
    bool _1410 = _1000 == 0.0;
    bool _1412 = !_1392;
    bool _1414 = _1410 && _1412;
    float _1416 = _1408;
    float _1418 = _1406;
    if (_1306)
    {
        float _1420 = _1308 ? _1330 : _1282;
        _1360 = _1420;
    }
    float _1422 = _1360;
    if (_1290)
    {
        float _1424 = -_1406;
        float _1426 = _1424 + 1.0;
        _1362 = as_type<int>(_1426);
    }
    int _1428 = _1362;
    bool _1430 = _1004 == 0.0;
    bool _1432 = _1430 && _1414;
    int _1434 = 0;
    if (_1296)
    {
        float _1436 = -_1406;
        float _1438 = _1436 + 1.0;
        _1434 = as_type<int>(_1438);
    }
    int _1440 = _1434;
    float _1442 = as_type<float>(_1440);
    if (_1296)
    {
        bool _1444 = _738 > 0.5;
        _1364 = _1444;
    }
    bool _1446 = _1364;
    float _1448 = fma(_1402, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1408);
    if (_1290)
    {
        float _1450 = _1370 ? as_type<float>(_1428) : _1406;
        _1404 = _1450;
    }
    float _1452 = _1404;
    float _1454 = _1422 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1456 = in.m_75.x;
    float _1458 = in.m_75.y;
    float _1460 = in.m_75.z;
    float _1462 = in.m_75.w;
    if (!_1296)
    {
        _1366 = _1406;
    }
    float _1464 = _1366;
    float _1466 = fma(_1320, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1448);
    float _1468 = _1464;
    if (_1296)
    {
        float _1470 = _1446 ? as_type<float>(_1440) : _1406;
        _1468 = _1470;
    }
    float _1472 = _1468;
    float _1474 = _1466 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1476 = 0.0;
    if (_1432)
    {
        _1476 = _1374;
    }
    float _1478 = _1476;
    float _1480 = _1472 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1482 = _1478;
    if (_1432)
    {
        _1442 = _1376;
    }
    float _1484 = _1442;
    float _1486 = 0.0;
    float _1488 = _1484;
    if (_1432)
    {
        _1486 = _1378;
    }
    float _1490 = _1486;
    float _1492 = _1490;
    if (_1432)
    {
        _1416 = _1478;
    }
    float _1494 = _1416;
    float _1496 = 0.0;
    float _1498 = _1494;
    if (_1432)
    {
        _1496 = _1484;
    }
    float _1500 = _1496;
    float _1502 = _1500;
    if (_1432)
    {
        _1418 = _1490;
    }
    float _1504 = _1418;
    float _1506 = _1504;
    if (!_1432)
    {
        _1482 = _1374;
    }
    float _1508 = _1482;
    if (!_1432)
    {
        _1488 = _1376;
    }
    float _1510 = _1488;
    if (!_1432)
    {
        _1492 = _1378;
    }
    float _1512 = _1492;
    if (!_1432)
    {
        float _1514 = fma(_1000, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1508);
        _1498 = _1514;
    }
    float _1516 = _1498;
    float _1518 = _1516;
    if (!_1432)
    {
        float _1520 = fma(_1002, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1510);
        _1502 = _1520;
    }
    float _1522 = _1502;
    float _1524 = _1458 * _1512;
    float _1526 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1528 = _1456 * _1510;
    float _1530 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1532 = -_1524;
    float _1534 = fma(_1460, _1510, _1532);
    float _1536 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1538 = _1526 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1540 = _1530 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1542 = _1534 * _1462;
    float _1544 = _1536 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1546 = _1460 * _1508;
    float _1548 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1550 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1552 = _1060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    out.m_77.x = _1538;
    out.m_77.y = _1540;
    out.m_77.z = _1544;
    out.m_77.w = _1474;
    float _1554 = _1458;
    if (!_1432)
    {
        float _1556 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1512);
        _1506 = _1556;
    }
    float _1558 = _1506;
    float _1560 = -_1546;
    float _1562 = fma(_1456, _1512, _1560);
    float _1564 = -_1044;
    float _1566 = fma(_1564, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1552);
    float _1568 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1570 = -_1528;
    float _1572 = fma(_1458, _1508, _1570);
    float _1574 = -_1044;
    float _1576 = fma(_1574, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1548);
    float _1578 = -_1044;
    float _1580 = fma(_1578, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1550);
    float _1582 = _1562 * _1462;
    float _1584 = _1572 * _1462;
    float _1586 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1576);
    float _1588 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1590 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1592 = _1070 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1594 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1568);
    float _1596 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1598 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1590);
    float _1600 = fma(_1062, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1592);
    float _1602 = _1590;
    float _1604 = _1584;
    if (_1172)
    {
        float _1606 = _1218 * 6.283185482025146484375;
        float _1608 = cos(_1606);
        _1602 = _1608;
    }
    float _1610 = _1602;
    float _1612 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1614 = _1084 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1616 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1580);
    float _1618 = fma(_1064, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1566);
    float _1620 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1612);
    float _1622 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1614);
    float _1624 = _1586 * _1458;
    float _1626 = _1616 * _1458;
    float _1628 = _1618 * _1458;
    float _1630 = _1618 * _1522;
    float _1632 = _1582 * _1618;
    float _1634 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1620);
    float _1636 = fma(_1066, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1596);
    float _1638 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1594);
    float _1640 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1598);
    float _1642 = _1620;
    if (_1172)
    {
        float _1644 = _1610 + (-1.0);
        _1554 = _1644;
    }
    float _1646 = _1554;
    float _1648 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1600);
    float _1650 = _1586 * _1522;
    float _1652 = _1616 * _1522;
    if (_1172)
    {
        float _1654 = _1646 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1642 = _1654;
    }
    float _1656 = _1642;
    if (_1172)
    {
        float _1658 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1660 = _1258 + _1658;
        _1224 = _1660;
    }
    float _1662 = _1224;
    float _1664 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1636);
    float _1666 = fma(_1072, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1622);
    if (_1172)
    {
        float _1668 = fma(_1220, _1610, _1656);
        _1226 = _1668;
    }
    float _1670 = _1226;
    float _1672 = fma(_1638, _1516, _1650);
    float _1674 = fma(_1640, _1516, _1652);
    float _1676 = fma(_1648, _1516, _1630);
    if (_1172)
    {
        float _1678 = _1662 * _1662;
        _1194 = _1678;
    }
    float _1680 = _1194;
    if (_1172)
    {
        float _1682 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1684 = _1262 + _1682;
        _1518 = _1684;
    }
    float _1686 = _1518;
    float _1688 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1690 = _1670 + _1688;
    float _1692 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1694 = _1582 * _1586;
    float _1696 = _1582 * _1616;
    if (_1172)
    {
        float _1698 = _1686 * _1686;
        _1196 = _1698;
    }
    float _1700 = _1196;
    float _1702 = fma(_1690, _1690, _1680);
    float _1704 = fma(_1638, _1456, _1624);
    float _1706 = fma(_1542, _1638, _1694);
    float _1708 = fma(_1640, _1456, _1626);
    float _1710 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1712 = _1702 + _1700;
    float _1714 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1716 = fma(_1648, _1456, _1628);
    float _1718 = fma(_1542, _1640, _1696);
    float _1720 = fma(_1542, _1648, _1632);
    float _1722 = _1452 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1724 = fma(_1664, _1558, _1672);
    float _1726 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1728 = _1714 * _1692;
    float _1730 = fma(_1664, _1460, _1704);
    float _1732 = fma(_1584, _1664, _1706);
    float _1734 = fma(_1666, _1460, _1716);
    float _1736 = _1722 * _1588;
    float _1738 = fma(_1584, _1634, _1718);
    float _1740 = fma(_1634, _1558, _1674);
    float _1742 = sqrt(_1712);
    float _1744 = _1454 * _1710;
    float _1746 = fma(_1634, _1460, _1708);
    float _1748 = fma(_1584, _1666, _1720);
    float _1750 = fma(_1666, _1558, _1676);
    out.m_79.x = _1730;
    out.m_79.y = _1746;
    out.m_79.z = _1734;
    float _1752 = _1480 * _1726;
    out.m_81.x = _1732;
    out.m_81.y = _1738;
    out.m_81.z = _1748;
    out.m_83.x = _1736;
    out.m_83.y = _1744;
    out.m_83.z = _1752;
    out.m_83.w = _1728;
    bool _1754 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1756 = isnan(_1742);
    bool _1758 = _1754 || _1756;
    bool _1760 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1762 = _1758 || _1760;
    out.m_85.x = _1724;
    out.m_85.y = _1740;
    out.m_85.z = _1750;
    float _1764 = _1734;
    float _1766 = _1730;
    if (!_1762)
    {
        _1604 = 1.0;
    }
    float _1768 = _1604;
    out.m_87.x = _1272;
    out.m_87.y = _1274;
    out.m_87.z = _1276;
    bool _1770 = !_1762;
    float _1772 = _1768;
    float _1774 = _1274;
    float _1776 = _1276;
    if (!_1770)
    {
        bool _1778 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1780 = isnan(_1742);
        bool _1782 = _1778 || _1780;
        bool _1784 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1786 = _1782 || _1784;
        if (!_1786)
        {
            float _1788 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1790 = _1742 + _1788;
            float _1792 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1794 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1792;
            float _1796 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1798 = _1796 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1800 = 1.0 / _1794;
            float _1802 = _1790 * _1800;
            float _1804 = fma(_1802, _1798, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1772 = _1804;
            _1774 = _1800;
            _1806 = true;
        }
        else
        {
            bool _1808 = _1742 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1810 = isnan(_1742);
            bool _1812 = _1808 || _1810;
            bool _1814 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1816 = _1812 || _1814;
            if (!_1816)
            {
                float _1818 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1820 = _1742 + _1818;
                float _1822 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1824 = _1822 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1826 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1828 = _1826 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1830 = 1.0 / _1824;
                float _1832 = _1820 * _1830;
                float _1834 = fma(_1832, _1828, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1772 = _1834;
                _1774 = _1830;
                _1806 = true;
            }
            else
            {
                _1772 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1806 = false;
    float _1836 = _1772;
    float _1838 = _1774;
    float _1840 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1842 = _1670 + _1840;
    float _1844 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1846 = _1258 + _1844;
    float _1848 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1850 = _1262 + _1848;
    float _1852 = fma(_1842, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1854 = fma(_1846, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1856 = fma(_1850, _1836, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1858 = -_1212;
    float _1860 = _1858 + _1852;
    float _1862 = -_1124;
    float _1864 = _1862 + _1854;
    float _1866 = -_1128;
    float _1868 = _1866 + _1856;
    float _1870 = _1860 * _1860;
    float _1872 = fma(_1864, _1864, _1870);
    float _1874 = fma(_1868, _1868, _1872);
    float _1876 = sqrt(_1874);
    bool _1878 = _1876 > 0.0;
    float _1880 = _1876;
    float _1882 = _1838;
    if (!_1878)
    {
        _1880 = _1854;
    }
    float _1884 = _1880;
    float _1886 = _1884;
    if (!_1878)
    {
        _1882 = _1852;
    }
    float _1888 = _1882;
    float _1890 = _1888;
    if (!_1878)
    {
        _1776 = _1856;
    }
    float _1892 = _1776;
    bool _1894 = !_1878;
    float _1896 = _1892;
    float _1898 = _1892;
    if (!_1894)
    {
        float _1900 = _196 * _196;
        float _1902 = fma(_194, _194, _1900);
        float _1904 = fma(_198, _198, _1902);
        float _1906 = rsqrt(_1874);
        float _1908 = sqrt(_1904);
        float _1910 = _1864 * _1906;
        float _1912 = _1860 * _1906;
        float _1914 = _1868 * _1906;
        bool _1916 = _1908 > 0.0;
        float _1918 = _1906;
        float _1920 = _1908;
        _1764 = _1912;
        _1766 = _1910;
        if (!_1916)
        {
            _1918 = _1854;
        }
        float _1922 = _1918;
        _1886 = _1922;
        if (!_1916)
        {
            _1920 = _1852;
        }
        float _1924 = _1920;
        _1890 = _1924;
        if (!_1916)
        {
            _1896 = _1856;
        }
        float _1926 = _1896;
        bool _1928 = !_1916;
        _1898 = _1926;
        if (!_1928)
        {
            float _1930 = rsqrt(_1904);
            float _1932 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1934 = _196 * _1930;
            float _1936 = _194 * _1930;
            float _1938 = _1912 * _1934;
            float _1940 = _198 * _1930;
            float _1942 = fma(_1910, _1936, _1938);
            float _1944 = _1932 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1946 = fma(_1914, _1940, _1942);
            float _1948 = _1946 * _1944;
            float _1950 = fma(_194, _1948, _1854);
            float _1952 = fma(_196, _1948, _1852);
            float _1954 = fma(_198, _1948, _1856);
            _1890 = _1952;
            _1886 = _1950;
            _1898 = _1954;
        }
    }
    float _1956 = _1890;
    float _1958 = _1886;
    float _1960 = _1898;
    float _1962 = _1764;
    float _1964 = _1766;
    float _1966 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1968 = _1956 + _1966;
    float _1970 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1972 = _1958 + _1970;
    float _1974 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1976 = _1960 + _1974;
    float _1978 = _1968 * _1968;
    float _1980 = fma(_1972, _1972, _1978);
    float _1982 = fma(_1976, _1976, _1980);
    float _1984 = rsqrt(_1982);
    float _1986 = sqrt(_1982);
    float _1988 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1990 = _1972 * _1988;
    float _1992 = _1976 * _1988;
    float _1994 = _1990 * _1990;
    float _1996 = _1992 * _1992;
    float _1998 = _1994 + _1996;
    float _2000 = sqrt(_1998);
    bool _2002 = _2000 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2004 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2006 = _2000 + _2004;
    float _2008 = _1860;
    float _2010 = _2006;
    float _2012 = _1962;
    float _2014 = _1968;
    float _2016 = _1990;
    if (_2002)
    {
        float _2018 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2008 = _2018;
    }
    float _2020 = _2008;
    float _2022 = _2020;
    if (_2002)
    {
        float _2024 = _2006 * _2020;
        _2010 = _2024;
    }
    float _2026 = _2010;
    if (_2002)
    {
        float _2028 = rsqrt(_1998);
        _2022 = _2028;
    }
    float _2030 = _2022;
    float _2032 = _2030;
    if (_2002)
    {
        float _2034 = _2026 * 0.15915493667125701904296875;
        _2012 = _2034;
    }
    float _2036 = _2012;
    float _2038 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2040 = _1976;
    if (_2002)
    {
        float _2042 = _2036 * 6.283185482025146484375;
        float _2044 = sin(_2042);
        _2040 = _2044;
    }
    float _2046 = _2040;
    float _2048 = precise::max(0.0, _2038);
    float _2050 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2052 = _1964;
    float _2054 = _2048;
    if (_2002)
    {
        float _2056 = _2036 * 6.283185482025146484375;
        float _2058 = cos(_2056);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = -_1988;
    float _2064 = -_2048;
    float _2066 = fma(_1968, _2062, _2064);
    if (_2002)
    {
        float _2068 = _2066 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2014 = _2068;
    }
    float _2070 = _2014;
    float _2072 = _2046;
    float _2074 = _2070;
    if (_2002)
    {
        float _2076 = fma(_2046, _2070, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2072 = _2076;
    }
    float _2078 = _2072;
    float _2080 = _2078;
    if (!_2002)
    {
        _2074 = _2066;
    }
    float _2082 = _2074;
    float _2084 = _2082;
    if (_2002)
    {
        float _2086 = _2030 * _2078;
        _202 = _2086;
    }
    float _2088 = _202;
    if (!_2002)
    {
        _2080 = _1994;
    }
    float _2090 = _2080;
    float _2092 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2094 = _2090;
    float _2096 = _2060;
    if (_2002)
    {
        float _2098 = _2060 + (-1.0);
        _2054 = _2098;
    }
    float _2100 = _2054;
    float _2102 = _2100;
    if (_2002)
    {
        float _2104 = _1990 * _2088;
        _2016 = _2104;
    }
    float _2106 = _2016;
    float _2108 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2092);
    if (_2002)
    {
        float _2110 = _2100 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2032 = _2110;
    }
    float _2112 = _2032;
    if (!_2002)
    {
        _2102 = _1992;
    }
    float _2114 = _2102;
    float _2116 = _2114;
    if (_2002)
    {
        float _2118 = _2106 * _2106;
        _2094 = _2118;
    }
    float _2120 = _2094;
    if (_2002)
    {
        float _2122 = _1992 * _2088;
        _2116 = _2122;
    }
    float _2124 = _2116;
    if (_2002)
    {
        float _2126 = fma(_2066, _2060, _2112);
        _2084 = _2126;
    }
    float _2128 = _2084;
    if (!_2002)
    {
        _2096 = _1996;
    }
    float _2130 = _2096;
    float _2132 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2134 = _2130;
    if (_2002)
    {
        float _2136 = _2124 * _2124;
        _2134 = _2136;
    }
    float _2138 = _2134;
    float _2140 = fma(_2128, _2128, _2120);
    float _2142 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2132);
    float _2144 = _2140 + _2138;
    float _2146 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2148 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2150 = fma(_1986, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2148);
    float _2152 = precise::clamp(_2150, 0.0, 1.0);
    float _2154 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2142);
    float _2156 = rsqrt(_2144);
    float _2158 = _1956 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2160 = -_2152;
    float _2162 = _2160 + 1.0;
    float _2164 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2146);
    float _2166 = _2154 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2168 = fma(_1958, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2158);
    float _2170 = abs(_2162);
    float _2172 = log2(_2170);
    float _2174 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2164);
    float _2176 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2168);
    float _2178 = _2166 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2180 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2182 = fma(_1960, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2108);
    float _2184 = -_2178;
    float _2186 = fma(_2184, _2050, 1.0);
    float _2188 = _2156 * _2106;
    float _2190 = _2176 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2192 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2194 = _2156 * _2128;
    float _2196 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2198 = _2156 * _2124;
    float _2200 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2192);
    float _2202 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2204 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2206 = -_2196;
    float _2208 = fma(_2194, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2206);
    float _2210 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2200);
    float _2212 = log2(_2186);
    float _2214 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2216 = -_2198;
    float _2218 = fma(_2216, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2208);
    float _2220 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2210);
    float _2222 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2224 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2214);
    float _2226 = fma(_2218, -0.5, 0.5);
    float _2228 = fma(_2218, 0.5, 0.5);
    float _2230 = exp2(_2204);
    float _2232 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2222);
    float _2234 = _2194 + 1.0;
    float _2236 = fma(_2228, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2238 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2224);
    float _2240 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2232);
    float _2242 = fma(_2228, _2236, -0.212114393711090087890625);
    float _2244 = 1.0 / _2220;
    float _2246 = _2212 * 0.693147182464599609375;
    float _2248 = fma(_2228, _2242, 1.570728778839111328125);
    float _2250 = _2246 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2252 = sqrt(_2226);
    float _2254 = -_2194;
    float _2256 = fma(_2230, _2234, _2254);
    float _2258 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2240);
    float _2260 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2238);
    float _2262 = _2258 * _2244;
    float _2264 = _2260 * _2244;
    float _2266 = fma(_2262, 0.5, 0.5);
    float _2268 = fma(_2264, -0.5, 0.5);
    float _2270 = fma(_2256, 0.5, 0.5);
    float _2272 = _2252 * 0.636619746685028076171875;
    float3 _6349 = float3(_2266, _2268, _2250);
    float _2274 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6349, float3(0.0), isnan(_6349)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6349, float3(0.0), isnan(_6349)), level(0.0)).x;
    float3 _6360 = float3(_2266, _2268, _2250);
    float4 _2277 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6360, float3(0.0), isnan(_6360)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6360, float3(0.0), isnan(_6360)), level(0.0)).xyzw;
    float _2279 = _2277.x;
    float _2281 = _2277.y;
    float _2283 = _2277.z;
    float _2285 = _2277.w;
    float _2287 = -_2248;
    float _2289 = fma(_2272, _2287, 1.0);
    float2 _6381 = float2(_2289, _2270);
    float3 _2291 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6381, float2(0.0), isnan(_6381)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6381, float2(0.0), isnan(_6381)), level(0.0)).xyz;
    float _2293 = _2291.x;
    float _2295 = _2291.y;
    float _2297 = _2291.z;
    float _2299 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2301 = -_1278;
    float _2303 = _2301 + 1.0;
    bool _2305 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2307 = isnan(_1986);
    bool _2309 = _2305 || _2307;
    bool _2311 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2313 = _2309 || _2311;
    float _2315 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2299);
    float _2317 = _1212 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2319 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2315);
    float _2321 = fma(_1124, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2317);
    float _2323 = _2319 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2325 = fma(_1128, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2321);
    float _2327 = 1.0 / _2323;
    float _2329 = _2325 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2331 = _2329 + _2323;
    float _2333 = _2331 * _2327;
    float _2335 = _2333 * 0.5;
    float _2337 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2339 = fma(_2335, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2337);
    float _2341 = 1.0 / _2339;
    float _2343 = _2180 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2345 = _2172 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2347 = fma(_2190, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2343);
    float _2349 = _2220 * 0.5;
    float _2351 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2353 = _2341 * _2351;
    float _2355 = exp2(_2345);
    float _2357 = fma(_2166, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2347);
    float _2359 = fma(_2202, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2357);
    float _2361 = abs(_2353);
    float _2363 = log2(_2361);
    float _2365 = _2359 + _2220;
    out.gl_Position.x = _2258;
    out.gl_Position.y = _2260;
    out.gl_Position.z = _2359;
    out.gl_Position.w = _2220;
    float _2367 = _2365 * 0.5;
    bool _2369 = _2353 <= 8000.0;
    bool _2371 = isnan(_2353);
    bool _2373 = _2369 || _2371;
    bool _2375 = isnan(8000.0);
    bool _2377 = _2373 || _2375;
    float _2379 = float(_2377);
    float _2381 = _2363 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2383 = _2359;
    float _2385 = _2260;
    float _2387 = _2220;
    float _2389 = _2258;
    if (!_2313)
    {
        _2383 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2391 = _2383;
    float _2393 = exp2(_2381);
    float _2395 = fma(_2393, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = fma(_2397, -2.0, 3.0);
    float _2401 = _2397 * _2397;
    float _2403 = in.m_89.x;
    float _2405 = _2401 * _2399;
    float _2407 = -_2405;
    float _2409 = _2407 + 1.0;
    float _2411 = fma(_2409, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2405);
    float _2413 = _2379 * _2411;
    float _2415 = _2413 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2417 = _2303 * _2415;
    float _2419 = precise::clamp(_2417, 0.0, 1.0);
    float _2421 = -_2355;
    float _2423 = _2421 + 1.0;
    float _2425 = fma(_2260, -0.5, _2349);
    float _2427 = _2425;
    float _2429 = _2391;
    float _2431 = _2391;
    if (!_2313)
    {
        _2385 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2433 = _2385;
    float _2435 = -_2419;
    float _2437 = fma(_2435, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2439 = _2423 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2441 = _2437 * _2403;
    float _2443 = _2258 + _2220;
    float _2445 = _2433;
    float _2447 = _2433;
    if (!_2313)
    {
        _2387 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2449 = _2387;
    float _2451 = _2441 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2453 = _2443 * 0.5;
    float _2455 = _2453;
    float _2457 = _2449;
    float _2459 = _2449;
    if (!_2313)
    {
        _2389 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2461 = _2389;
    out.m_91.x = _2451;
    out.m_93.x = _2453;
    out.m_93.y = _2425;
    out.m_93.z = _2367;
    out.m_93.w = _2220;
    float _2463 = _2461;
    float _2465 = _2461;
    if (!_2313)
    {
        _2427 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2467 = _2427;
    float _2469 = _2467;
    float _2471 = _2467;
    if (!_2313)
    {
        _2455 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2473 = _2455;
    float _2475 = _2439 * _2274;
    float _2477 = -_2439;
    float _2479 = _2477 + 1.0;
    float _2481 = _2285 * _2475;
    float _2483 = _2297 * _2475;
    float _2485 = fma(_2293, _2481, _2279);
    float _2487 = fma(_2295, _2481, _2281);
    float _2489 = _2285 * _2479;
    float _2491 = fma(_2285, _2483, _2283);
    out.m_95.x = _2485;
    out.m_95.y = _2487;
    out.m_95.z = _2491;
    out.m_95.w = _2489;
    bool _2493 = !_2313;
    float _2495 = _2473;
    float _2497 = _2473;
    if (!_2493)
    {
        bool _2499 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2501 = isnan(_1986);
        bool _2503 = _2499 || _2501;
        bool _2505 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2507 = _2503 || _2505;
        if (!_2507)
        {
            float _2509 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2511 = _1986 + _2509;
            float _2513 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2515 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2513;
            float _2517 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2519 = _2517 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2521 = 1.0 / _2515;
            float _2523 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2525 = _2523 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2527 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2529 = _2527 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2531 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2533 = _2531 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2535 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2537 = _2535 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2539 = _2511 * _2521;
            float _2541 = precise::clamp(_2539, 0.0, 1.0);
            float _2543 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2545 = _2543 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2547 = fma(_2541, _2519, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2549 = fma(_2541, _2545, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2551 = fma(_2541, _2525, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2553 = fma(_2541, _2529, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2555 = fma(_2541, _2533, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2557 = fma(_2541, _2537, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2497 = _2551;
            _2447 = _2555;
            _2471 = _2547;
            _2431 = _2553;
            _2459 = _2549;
            _2465 = _2557;
            _2559 = true;
        }
        else
        {
            bool _2561 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2563 = isnan(_1986);
            bool _2565 = _2561 || _2563;
            bool _2567 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2569 = _2565 || _2567;
            if (!_2569)
            {
                _2469 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2571 = _2469;
            _2471 = _2571;
            if (!_2569)
            {
                _2495 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2573 = _2495;
            _2497 = _2573;
            if (!_2569)
            {
                _2457 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2575 = _2457;
            _2459 = _2575;
            if (!_2569)
            {
                _2429 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2577 = _2429;
            _2431 = _2577;
            if (!_2569)
            {
                _2445 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2579 = _2445;
            _2447 = _2579;
            if (!_2569)
            {
                _2463 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2581 = _2463;
            bool _2583 = !_2569;
            _2465 = _2581;
            if (!_2583)
            {
                bool _2585 = _1986 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2587 = isnan(_1986);
                bool _2589 = _2585 || _2587;
                bool _2591 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2593 = _2589 || _2591;
                if (!_2593)
                {
                    float _2595 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2597 = _1986 + _2595;
                    float _2599 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2601 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2599;
                    float _2603 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2605 = _2603 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2607 = 1.0 / _2601;
                    float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2611 = _2609 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2617 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2619 = _2617 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2621 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2623 = _2621 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2625 = _2597 * _2607;
                    float _2627 = precise::clamp(_2625, 0.0, 1.0);
                    float _2629 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2631 = _2629 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2633 = fma(_2627, _2605, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2635 = fma(_2627, _2631, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2637 = fma(_2627, _2611, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2639 = fma(_2627, _2615, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2641 = fma(_2627, _2619, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2643 = fma(_2627, _2623, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2497 = _2637;
                    _2447 = _2641;
                    _2471 = _2633;
                    _2431 = _2639;
                    _2459 = _2635;
                    _2465 = _2643;
                    _2559 = true;
                }
                else
                {
                    _2497 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2447 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2471 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2431 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2459 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2465 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2559 = false;
    float _2645 = _2497;
    float _2647 = _2447;
    float _2649 = _2471;
    float _2651 = _2431;
    float _2653 = _2459;
    float _2655 = _2465;
    float _2657 = fma(_1740, -0.5, 0.5);
    float _2659 = precise::clamp(_2657, 0.0, 1.0);
    float _2661 = -_2645;
    float _2663 = _2661 + _2647;
    float _2665 = -_2649;
    float _2667 = _2665 + _2651;
    float _2669 = -_2653;
    float _2671 = _2669 + _2655;
    bool _2673 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2675 = fma(_2659, _2663, _2645);
    float _2677 = fma(_2659, _2667, _2649);
    float _2679 = fma(_2659, _2671, _2653);
    float _2681 = _2675 * 0.586610972881317138671875;
    out.m_97.x = 0.0;
    float _2683 = fma(_2677, 0.298911988735198974609375, _2681);
    float _2685 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2687 = fma(_2679, 0.114477999508380889892578125, _2683);
    out.m_53.x = _2685;
    float _2689 = -_2687;
    float _2691 = _2677 + _2689;
    float _2693 = -_2687;
    float _2695 = _2675 + _2693;
    float _2697 = -_2687;
    float _2699 = _2679 + _2697;
    float _2701 = fma(_2691, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    float _2703 = fma(_2695, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    float _2705 = fma(_2699, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2687);
    out.m_99.x = _2701;
    out.m_99.y = _2703;
    out.m_99.z = _2705;
    if (!_2673)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2707 = -_1956;
    float _2709 = _2707 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2711 = -_1958;
    float _2713 = _2711 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2715 = -_1960;
    float _2717 = _2715 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2719 = _2709 * _2709;
    float _2721 = fma(_2713, _2713, _2719);
    float _2723 = fma(_2717, _2717, _2721);
    float _2725 = sqrt(_2723);
    float _2727 = rsqrt(_2723);
    float _2729 = -_2725;
    float _2731 = _2729 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2733 = _2731 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2735 = precise::clamp(_2733, 0.0, 1.0);
    float _2737 = _2713 * _2727;
    float _2739 = _2709 * _2727;
    float _2741 = abs(_2735);
    float _2743 = log2(_2741);
    float _2745 = _2717 * _2727;
    float _2747 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2749 = _1740 * _2739;
    float _2751 = -_2739;
    float _2753 = -_2747;
    float _2755 = fma(_2751, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2753);
    float _2757 = fma(_1724, _2737, _2749);
    float _2759 = -_2745;
    float _2761 = fma(_2759, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2755);
    float _2763 = fma(_1750, _2745, _2757);
    float _2765 = precise::clamp(_2763, 0.0, 1.0);
    float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2769 = _2761 + _2767;
    float _2771 = _2743 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2773 = _2769 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2775 = precise::clamp(_2773, 0.0, 1.0);
    float _2777 = exp2(_2771);
    float _2779 = _2777 * _2775;
    float _2781 = _2765 * _2779;
    float _2783 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2785 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2787 = _2781 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_97.x = _2783;
    out.m_97.y = _2785;
    out.m_97.z = _2787;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_99.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_99.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_99.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_99.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_93.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_93.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_93.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_93.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_97.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_97.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_97.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_97.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_95.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_95.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_95.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_95.w)); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

