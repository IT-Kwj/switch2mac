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
    float4 m_67 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_87 [[user(locn3)]];
    float4 m_59 [[user(locn4)]];
    float4 m_71 [[user(locn5)]];
    float4 m_79 [[user(locn6)]];
    float4 m_73 [[user(locn7)]];
    float4 m_75 [[user(locn8)]];
    float4 m_85 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_77 [[attribute(0)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_63 [[attribute(7)]];
    float4 m_57 [[attribute(9)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1727 = false;
    bool _1074 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2012 = as_type<float>(_122);
        out.gl_Position.z = _2012;
    }
    if (!_110)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _126 = in.m_53.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_106);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_158);
        out.gl_Position.z = _2080;
    }
    if (_152)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_55.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_106);
        float _186 = 1.0 / _184;
        float _188 = _140 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_48.x;
    float _194 = in.m_48.y;
    float _196 = in.m_48.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _200 = _190 + _198;
    float _202 = in.m_55.x;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = 1.0 / _206;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _224 = _222 != 0;
    float _226 = in.m_55.z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _230 = _228 != 0;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _234 = _232 != 0;
    float _236 = in.m_57.x;
    float _238 = 1.0 / _210;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _246 = _244 != 0;
    float _248 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = 1.0 / _214;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _252;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _256 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _258 = 1.0 / _218;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _264 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _266 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _268;
    float _272 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _264);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _190 + _274;
    float _278 = 1.0 / _254;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _190 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _284;
    float _288 = _276 * _220;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = _190 + _290;
    float _294 = _282 * _238;
    float _296 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _272);
    float _298 = 1.0 / _262;
    float _300 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _190 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _190 + _306;
    float _310 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _256);
    float _312 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _314 = _304 * _250;
    float _316 = _308 * _258;
    float _318 = _292 * _278;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = fma(_326, _288, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = fma(_330, _288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = fma(_344, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _360 = fma(_348, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _362 = fma(_352, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _380 = fma(_356, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _382 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _384 = isnan(_190);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_366, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _396 = fma(_338, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = fma(_370, _316, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _400 = fma(_374, _316, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _402 = fma(_378, _316, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _404 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _406 = isnan(_190);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _416;
    float _420 = -_392;
    float _422 = _420 + 1.0;
    float _424 = _200 * _298;
    float _426 = fma(_270, _318, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _428 = fma(_418, _318, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _430 = fma(_286, _318, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _414 * _422;
    float _446 = -_414;
    float _448 = _446 + 1.0;
    bool _450 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _452 = isnan(_190);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _466 = -_442;
    float _468 = _466 + 1.0;
    float _470 = _442 * _448;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    bool _476 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_190);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _460 * _468;
    float _490 = -_460;
    float _492 = _490 + 1.0;
    float _494 = fma(_474, _424, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _496 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_190);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -_486;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    bool _516 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _518 = isnan(_190);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = fma(_464, _424, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _530 = _506 * _510;
    float _532 = -_506;
    float _534 = _532 + 1.0;
    float _536 = _486 * _492;
    float _538 = _464;
    float _540 = _506;
    float _542 = _514;
    float _544 = _340;
    bool _546 = false;
    int _548 = as_type<int>(_488);
    if (_224)
    {
        _538 = _202;
    }
    float _550 = _538;
    float _552 = in.m_57.y;
    float _554 = _526 * _534;
    bool _556 = _226 > 0.5;
    float _558 = -_526;
    float _560 = _558 + 1.0;
    float _562 = _550;
    if (_224)
    {
        _540 = _550;
    }
    float _564 = _540;
    float _566 = _332 * _554;
    float _568 = _564;
    if (!_224)
    {
        _568 = _226;
    }
    float _570 = _568;
    float _572 = _340 * _554;
    float _574 = _334 * _554;
    float _576 = fma(_514, _424, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    if (!_230)
    {
        _542 = _236;
    }
    float _578 = _542;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _566);
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _574);
    float _584 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _572);
    float _586 = _578;
    if (!_230)
    {
        _544 = _578;
    }
    float _588 = _544;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _592 = _588;
    if (_230)
    {
        bool _594 = _202 > 0.5;
        _546 = _594;
    }
    bool _596 = _546;
    float _598 = fma(_380, _530, _584);
    if (!_224)
    {
        _562 = _202;
    }
    float _600 = _562;
    float _602 = fma(_394, _530, _580);
    if (_230)
    {
        _586 = _236;
    }
    float _604 = _586;
    float _606 = fma(_396, _530, _582);
    float _608 = in.m_61.x;
    float _610 = in.m_61.y;
    float _612 = in.m_61.z;
    float _614 = fma(_360, _536, _602);
    float _616 = fma(_358, _536, _598);
    float _618 = fma(_362, _536, _606);
    float _620 = in.m_63.x;
    float _622 = in.m_63.y;
    float _624 = in.m_63.z;
    float _626 = -_552;
    float _628 = _626 + 1.0;
    float _630 = fma(_400, _488, _614);
    float _632 = fma(_402, _488, _618);
    float _634 = fma(_398, _488, _616);
    float _636 = _590 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _638 = fma(_426, _470, _630);
    int _640 = _556 ? as_type<int>(_628) : as_type<int>(_552);
    float _642 = fma(_430, _470, _632);
    float _644 = fma(_428, _470, _634);
    float _646 = fma(_528, _444, _638);
    float _648 = _246 ? as_type<float>(_640) : _552;
    float _650 = fma(_576, _444, _642);
    float _652 = fma(_494, _444, _644);
    float _654 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].y, _646);
    float _656 = in.m_55.y;
    float _658 = fma(_636, _648, -0.5);
    float _660 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].z, _650);
    float _662 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].x, _652);
    float _664 = in.m_65.x;
    float _666 = in.m_65.y;
    float _668 = in.m_65.z;
    float _670 = _296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _672 = _610 != 0.0;
    bool _674 = isnan(_610);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.0);
    bool _680 = _676 || _678;
    float _682 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = _654 * _622;
    float _686 = _660 * _624;
    float _688 = _662 * _620;
    float _690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _694 = _608 == 0.0;
    bool _696 = !_680;
    bool _698 = _694 && _696;
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _704 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = _692 * _690;
    bool _710 = _612 == 0.0;
    bool _712 = _710 && _698;
    float _714 = _704 * _700;
    float _716 = _706 * _702;
    float _718 = _708 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _720 = _708 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[24].x, _718);
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[26].x, _720);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _730 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[24].z, _724);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[26].z, _726);
    float _734 = _666;
    float _736 = _668;
    float _738 = _664;
    int _740 = as_type<int>(_728);
    float _742 = _656;
    float _744 = _552;
    float _746 = _604;
    if (!_712)
    {
        float _748 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _666);
        _734 = _748;
    }
    float _750 = _734;
    if (!_712)
    {
        float _752 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _668);
        _736 = _752;
    }
    float _754 = _736;
    float _756 = _730 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _758 = _732 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_712)
    {
        float _760 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _664);
        _738 = _760;
    }
    float _762 = _738;
    float _764 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[88].w, _728);
    float _766 = _670 + _756;
    float _768 = _682 + _758;
    float _770 = _762;
    float _772 = _768;
    if (_230)
    {
        float _774 = -_604;
        float _776 = _774 + 1.0;
        _740 = as_type<int>(_776);
    }
    int _778 = _740;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _766 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _788 = _768 + _786;
    bool _790 = _656 > 0.5;
    if (_234)
    {
        float _792 = -_604;
        float _794 = _792 + 1.0;
        _548 = as_type<int>(_794);
    }
    int _796 = _548;
    float _798 = _784 * _784;
    float _800 = _788 * _788;
    if (_230)
    {
        float _802 = _596 ? as_type<float>(_778) : _604;
        _592 = _802;
    }
    float _804 = _592;
    float _806 = _570 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_224)
    {
        _742 = _600;
    }
    float _808 = _742;
    float _810 = _798 + _800;
    float _812 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[88].z, _780);
    float _814 = _708 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _816 = sqrt(_810);
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _820 = _812;
    if (_242)
    {
        float _822 = _790 ? _628 : _552;
        _744 = _822;
    }
    float _824 = _744;
    float _826 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[25].x, _814);
    float _828 = _808 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _832 = -_818;
    float _834 = fma(_806, 2.0, _832);
    float _836 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    float _838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _840 = fma(_828, -2.0, _830);
    float _842 = _722 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _844 = _310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _846 = _836 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = _842;
    if (_234)
    {
        float _850 = _790 ? as_type<float>(_796) : _604;
        _746 = _850;
    }
    float _852 = _746;
    float _854 = _750 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _856 = _816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _860 = _750 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _862 = _750 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _864 = _844 + _846;
    float _866 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _868 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _860);
    float _870 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _862);
    float _872 = fma(_842, _852, -0.5);
    float _874 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _812);
    float _876 = -_140;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[86].x, _834);
    float _880 = _852;
    if (!_856)
    {
        _848 = _800;
    }
    float _882 = _848;
    float _884 = _882;
    if (!_856)
    {
        _770 = _798;
    }
    float _886 = _770;
    float _888 = _886;
    if (!_856)
    {
        _820 = _766;
    }
    float _890 = _820;
    float _892 = _890;
    if (!_856)
    {
        _880 = _864;
    }
    float _894 = _880;
    bool _896 = !_856;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _816 + _902;
        float _906 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = rsqrt(_810);
        float _910 = _904 * _900;
        float _912 = _910 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = fma(_916, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = _908 * _922;
        float _926 = _920 + (-1.0);
        float _928 = fma(_784, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_788, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _932 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _936 = _928 + _934;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _940 = _930 + _938;
        float _942 = fma(_864, _920, _932);
        float _944 = _936 * _936;
        float _946 = _940 * _940;
        _898 = _942;
        _888 = _944;
        _884 = _946;
        _892 = _928;
        _772 = _930;
    }
    float _948 = _898;
    float _950 = _888;
    float _952 = _884;
    float _954 = _892;
    float _956 = _772;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _960 = _948 + _958;
    float _962 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _764);
    float _964 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _840);
    float _966 = _804 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _968 = fma(_960, _960, _950);
    float _970 = -_964;
    float _972 = fma(_962, _658, _970);
    float _974 = _966 * _838;
    float _976 = _968 + _952;
    float _978 = fma(_874, _872, _878);
    float _980 = _824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _982 = sqrt(_976);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _996 = _980 * _858;
    float _998 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _870);
    float _1000 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _866);
    float _1002 = _978 + 0.5;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1008 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _972 + 0.5;
    float _1022 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _868);
    out.m_67.x = _1008;
    out.m_67.y = _1010;
    out.m_67.z = _1012;
    out.m_67.w = _1004;
    bool _1024 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1026 = isnan(_982);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1032 = _1028 || _1030;
    out.m_69.x = _1014;
    out.m_69.y = _1016;
    out.m_69.z = _1018;
    out.m_69.w = _1006;
    out.m_71.x = _974;
    out.m_71.y = _996;
    out.m_73.x = _1002;
    out.m_73.y = _1020;
    float _1034 = _966;
    float _1036 = _954;
    float _1038 = _974;
    if (!_1032)
    {
        _1034 = 1.0;
    }
    float _1040 = _1034;
    out.m_75.x = _998;
    out.m_75.y = _1000;
    out.m_75.z = _1022;
    bool _1042 = !_1032;
    float _1044 = _1040;
    if (!_1042)
    {
        bool _1046 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1048 = isnan(_982);
        bool _1050 = _1046 || _1048;
        bool _1052 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1054 = _1050 || _1052;
        if (!_1054)
        {
            float _1056 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1058 = _982 + _1056;
            float _1060 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1062 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1060;
            float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1066 = _1064 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1068 = 1.0 / _1062;
            float _1070 = _1058 * _1068;
            float _1072 = fma(_1070, _1066, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1044 = _1072;
            _1074 = true;
        }
        else
        {
            bool _1076 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1078 = isnan(_982);
            bool _1080 = _1076 || _1078;
            bool _1082 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1084 = _1080 || _1082;
            if (!_1084)
            {
                float _1086 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1088 = _982 + _1086;
                float _1090 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1092 = _1090 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1094 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1096 = _1094 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1098 = 1.0 / _1092;
                float _1100 = _1088 * _1098;
                float _1102 = fma(_1100, _1096, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1044 = _1102;
                _1074 = true;
            }
            else
            {
                _1044 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1074 = false;
    float _1104 = _1044;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1108 = _948 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1112 = _954 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1116 = _956 + _1114;
    float _1118 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1120 = fma(_1112, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1122 = fma(_1116, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1126 = _1118 + _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _1120 + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1134 = _1122 + _1132;
    float _1136 = _1126 * _1126;
    float _1138 = fma(_1130, _1130, _1136);
    float _1140 = fma(_1134, _1134, _1138);
    float _1142 = rsqrt(_1140);
    float _1144 = sqrt(_1140);
    float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1148 = _1130 * _1146;
    float _1150 = _1134 * _1146;
    float _1152 = _1148 * _1148;
    float _1154 = _1150 * _1150;
    float _1156 = _1152 + _1154;
    float _1158 = sqrt(_1156);
    bool _1160 = _1158 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1158 + _1162;
    float _1166 = _1142;
    float _1168 = _1104;
    float _1170 = _1164;
    float _1172 = _1126;
    if (_1160)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1166 = _1174;
    }
    float _1176 = _1166;
    if (_1160)
    {
        float _1178 = rsqrt(_1156);
        _1168 = _1178;
    }
    float _1180 = _1168;
    float _1182 = _1180;
    if (_1160)
    {
        float _1184 = _1164 * _1176;
        _1170 = _1184;
    }
    float _1186 = _1170;
    if (_1160)
    {
        float _1188 = _1186 * 0.15915493667125701904296875;
        _1036 = _1188;
    }
    float _1190 = _1036;
    float _1192 = _1176;
    if (_1160)
    {
        float _1194 = _1190 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        _1192 = _1196;
    }
    float _1198 = _1192;
    float _1200 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1202 = precise::max(0.0, _1200);
    float _1204 = _1134;
    float _1206 = _1202;
    if (_1160)
    {
        float _1208 = _1190 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        _1204 = _1210;
    }
    float _1212 = _1204;
    float _1214 = -_1146;
    float _1216 = -_1202;
    float _1218 = fma(_1126, _1214, _1216);
    float _1220 = _1218;
    if (_1160)
    {
        float _1222 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1206 = _1222;
    }
    float _1224 = _1206;
    float _1226 = _1224;
    float _1228 = _1198;
    if (_1160)
    {
        float _1230 = fma(_1198, _1224, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1226 = _1230;
    }
    float _1232 = _1226;
    float _1234 = _1232;
    if (!_1160)
    {
        _1228 = _1150;
    }
    float _1236 = _1228;
    float _1238 = _1236;
    float _1240 = _1212;
    if (_1160)
    {
        float _1242 = _1212 + (-1.0);
        _1172 = _1242;
    }
    float _1244 = _1172;
    float _1246 = _1244;
    if (_1160)
    {
        float _1248 = _1180 * _1232;
        _1038 = _1248;
    }
    float _1250 = _1038;
    if (!_1160)
    {
        _1182 = _1148;
    }
    float _1252 = _1182;
    float _1254 = _1252;
    if (_1160)
    {
        float _1256 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1256;
    }
    float _1258 = _1246;
    if (_1160)
    {
        float _1260 = _1148 * _1250;
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (!_1160)
    {
        _1234 = _1152;
    }
    float _1264 = _1234;
    float _1266 = _1264;
    if (_1160)
    {
        float _1268 = _1150 * _1250;
        _1238 = _1268;
    }
    float _1270 = _1238;
    if (_1160)
    {
        float _1272 = fma(_1218, _1212, _1258);
        _1220 = _1272;
    }
    float _1274 = _1220;
    if (_1160)
    {
        float _1276 = _1262 * _1262;
        _1266 = _1276;
    }
    float _1278 = _1266;
    if (!_1160)
    {
        _1240 = _1154;
    }
    float _1280 = _1240;
    float _1282 = _1280;
    if (_1160)
    {
        float _1284 = _1270 * _1270;
        _1282 = _1284;
    }
    float _1286 = _1282;
    float _1288 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1290 = fma(_1274, _1274, _1278);
    float _1292 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1288);
    float _1294 = _1290 + _1286;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1298 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1296);
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1292);
    float _1304 = rsqrt(_1294);
    float _1306 = -_1300;
    float _1308 = _1306 + 1.0;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1312 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1314 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1316 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1320 = abs(_1308);
    float _1322 = log2(_1320);
    float _1324 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1326 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1328 = -_1318;
    float _1330 = fma(_1328, _1310, 1.0);
    float _1332 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1334 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1324);
    float _1336 = _1304 * _1262;
    float _1338 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1332);
    float _1340 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1334);
    float _1342 = _1304 * _1274;
    float _1344 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1346 = floor(_1326);
    float _1348 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1338);
    float _1350 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1352 = _1304 * _1270;
    float _1354 = -_1344;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1354);
    float _1358 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = floor(_1314);
    float _1366 = -_1352;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1356);
    float _1370 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1358);
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1374 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1376 = fma(_1368, -0.5, 0.5);
    float _1378 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1380 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1372);
    float _1382 = -_1346;
    float _1384 = _1326 + _1382;
    float _1386 = fma(_1368, 0.5, 0.5);
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1380);
    float _1390 = exp2(_1374);
    float _1392 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1394 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1396 = -_1364;
    float _1398 = _1314 + _1396;
    float _1400 = fma(_1386, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1392);
    float _1404 = _1342 + 1.0;
    float _1406 = log2(_1330);
    float _1408 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1394);
    float _1410 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1402);
    float _1412 = fma(_1386, _1400, -0.212114393711090087890625);
    float _1414 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1408);
    float _1416 = 1.0 / _1388;
    float _1418 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1410);
    float _1420 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1414);
    float _1422 = -_1342;
    float _1424 = fma(_1390, _1404, _1422);
    float _1426 = sqrt(_1376);
    float _1428 = _1406 * 0.693147182464599609375;
    float2 _4284 = float2(_1384, _1398);
    float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4284, float2(0.0), isnan(_4284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4284, float2(0.0), isnan(_4284)), level(0.0)).x;
    float _1432 = fma(_1386, _1412, 1.570728778839111328125);
    float _1434 = _1418 * _1416;
    float _1436 = _1420 * _1416;
    float _1438 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1440 = fma(_1434, 0.5, 0.5);
    float _1442 = fma(_1436, -0.5, 0.5);
    float _1444 = _1426 * 0.636619746685028076171875;
    float3 _4316 = float3(_1440, _1442, _1438);
    float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4316, float3(0.0), isnan(_4316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4316, float3(0.0), isnan(_4316)), level(0.0)).x;
    float3 _4327 = float3(_1440, _1442, _1438);
    float4 _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4327, float3(0.0), isnan(_4327)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4327, float3(0.0), isnan(_4327)), level(0.0)).xyzw;
    float _1451 = _1449.x;
    float _1453 = _1449.y;
    float _1455 = _1449.z;
    float _1457 = _1449.w;
    float _1459 = -_1432;
    float _1461 = fma(_1444, _1459, 1.0);
    float _1463 = fma(_1424, 0.5, 0.5);
    float2 _4350 = float2(_1461, _1463);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4350, float2(0.0), isnan(_4350)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4350, float2(0.0), isnan(_4350)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1477 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1479 = isnan(_1144);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1485 = _1481 || _1483;
    float _1487 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1475);
    float _1489 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1491 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1487);
    float _1493 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1489);
    float _1495 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1497 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    float _1499 = 1.0 / _1495;
    float _1501 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1503 = _1501 + _1495;
    float _1505 = _1503 * _1499;
    float _1507 = _1505 * 0.5;
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1511 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1509);
    float _1513 = 1.0 / _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1513 * _1515;
    float _1519 = abs(_1517);
    float _1521 = log2(_1519);
    bool _1523 = _1517 <= 8000.0;
    bool _1525 = isnan(_1517);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan(8000.0);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1537 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1539 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1537);
    float _1541 = exp2(_1535);
    float _1543 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1539);
    float _1545 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1543);
    float _1547 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1549 = precise::clamp(_1547, 0.0, 1.0);
    float _1551 = fma(_1549, -2.0, 3.0);
    float _1553 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1555 = _1549 * _1549;
    float _1557 = _1555 * _1551;
    float _1559 = exp2(_1553);
    float _1561 = in.m_77.x;
    float _1563 = -_1557;
    float _1565 = _1563 + 1.0;
    out.gl_Position.x = _1418;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _1545;
    out.gl_Position.w = _1388;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1557);
    float _1569 = _1545 + _1388;
    float _1571 = _1533 * _1567;
    float _1573 = _1569 * 0.5;
    float _1575 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1577 = -_1559;
    float _1579 = _1577 + 1.0;
    out.m_79.z = _1573;
    out.m_79.w = _1388;
    float _1581 = _1388;
    float _1583 = _1545;
    float _1585 = _1420;
    float _1587 = _1418;
    if (!_1485)
    {
        _1581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1589 = _1581;
    float _1591 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1593 = _1589;
    float _1595 = _1589;
    if (!_1485)
    {
        _1583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1597 = _1583;
    float _1599 = _1597;
    float _1601 = _1597;
    if (!_1485)
    {
        _1585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1603 = _1585;
    float _1605 = _1603;
    float _1607 = _1603;
    if (!_1485)
    {
        _1587 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1609 = _1587;
    float _1611 = -_1430;
    float _1613 = _1611 + 1.0;
    float _1615 = _1613 * _1575;
    float _1617 = precise::clamp(_1615, 0.0, 1.0);
    float _1619 = -_1617;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1623 = -_1591;
    float _1625 = _1623 + 1.0;
    float _1627 = _1621 * _1561;
    float _1629 = _1591 * _1446;
    float _1631 = _1457 * _1629;
    float _1633 = _1473 * _1629;
    float _1635 = fma(_1469, _1631, _1451);
    float _1637 = fma(_1471, _1631, _1453);
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1641 = _1457 * _1625;
    float _1643 = fma(_1457, _1633, _1455);
    float _1645 = _1627;
    float _1647 = _1625;
    float _1649 = _1609;
    float _1651 = _1609;
    if (!_1485)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1653 = _1645;
    out.m_81.x = _1639;
    float _1655 = _1653;
    float _1657 = _1653;
    if (!_1485)
    {
        _1647 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1659 = _1647;
    out.m_83.x = _1635;
    out.m_83.y = _1637;
    out.m_83.z = _1643;
    out.m_83.w = _1641;
    bool _1661 = !_1485;
    float _1663 = _1659;
    float _1665 = _1659;
    if (!_1661)
    {
        bool _1667 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1669 = isnan(_1144);
        bool _1671 = _1667 || _1669;
        bool _1673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1675 = _1671 || _1673;
        if (!_1675)
        {
            float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1679 = _1144 + _1677;
            float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1683 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1681;
            float _1685 = 1.0 / _1683;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1707 = _1679 * _1685;
            float _1709 = precise::clamp(_1707, 0.0, 1.0);
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1715 = fma(_1709, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1717 = fma(_1709, _1713, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1719 = fma(_1709, _1693, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1721 = fma(_1709, _1697, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1723 = fma(_1709, _1701, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1725 = fma(_1709, _1705, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1601 = _1717;
            _1657 = _1723;
            _1595 = _1715;
            _1651 = _1721;
            _1607 = _1719;
            _1665 = _1725;
            _1727 = true;
        }
        else
        {
            bool _1729 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1731 = isnan(_1144);
            bool _1733 = _1729 || _1731;
            bool _1735 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1737 = _1733 || _1735;
            if (!_1737)
            {
                _1593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1739 = _1593;
            _1595 = _1739;
            if (!_1737)
            {
                _1599 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1741 = _1599;
            _1601 = _1741;
            if (!_1737)
            {
                _1605 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1743 = _1605;
            _1607 = _1743;
            if (!_1737)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1745 = _1649;
            _1651 = _1745;
            if (!_1737)
            {
                _1655 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1747 = _1655;
            _1657 = _1747;
            if (!_1737)
            {
                _1663 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1749 = _1663;
            bool _1751 = !_1737;
            _1665 = _1749;
            if (!_1751)
            {
                bool _1753 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1755 = isnan(_1144);
                bool _1757 = _1753 || _1755;
                bool _1759 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1761 = _1757 || _1759;
                if (!_1761)
                {
                    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1765 = _1144 + _1763;
                    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1769 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1767;
                    float _1771 = 1.0 / _1769;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1779 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1793 = _1765 * _1771;
                    float _1795 = precise::clamp(_1793, 0.0, 1.0);
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1801 = fma(_1795, _1775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1803 = fma(_1795, _1799, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1805 = fma(_1795, _1779, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1807 = fma(_1795, _1783, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1809 = fma(_1795, _1787, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1811 = fma(_1795, _1791, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1601 = _1803;
                    _1657 = _1809;
                    _1595 = _1801;
                    _1651 = _1807;
                    _1607 = _1805;
                    _1665 = _1811;
                    _1727 = true;
                }
                else
                {
                    _1601 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1657 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1607 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1665 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1727 = false;
    float _1813 = _1601;
    float _1815 = _1657;
    float _1817 = _1595;
    float _1819 = _1651;
    float _1821 = _1607;
    float _1823 = _1665;
    float _1825 = fma(_1000, -0.5, 0.5);
    float _1827 = precise::clamp(_1825, 0.0, 1.0);
    float _1829 = -_1813;
    float _1831 = _1829 + _1815;
    float _1833 = -_1817;
    float _1835 = _1833 + _1819;
    float _1837 = -_1821;
    float _1839 = _1837 + _1823;
    bool _1841 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1843 = fma(_1827, _1831, _1813);
    float _1845 = fma(_1827, _1835, _1817);
    float _1847 = fma(_1827, _1839, _1821);
    float _1849 = _1843 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _1851 = fma(_1845, 0.298911988735198974609375, _1849);
    float _1853 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1855 = fma(_1847, 0.114477999508380889892578125, _1851);
    out.m_81.w = _1853;
    float _1857 = -_1855;
    float _1859 = _1843 + _1857;
    float _1861 = -_1855;
    float _1863 = _1845 + _1861;
    float _1865 = -_1855;
    float _1867 = _1847 + _1865;
    out.m_85.x = 0.0;
    float _1869 = fma(_1859, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1871 = fma(_1863, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1873 = fma(_1867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    out.m_87.x = _1871;
    out.m_87.y = _1869;
    out.m_87.z = _1873;
    if (!_1841)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1875 = -_1118;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1879 = -_1120;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1883 = -_1122;
    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1887 = _1877 * _1877;
    float _1889 = fma(_1881, _1881, _1887);
    float _1891 = fma(_1885, _1885, _1889);
    float _1893 = sqrt(_1891);
    float _1895 = rsqrt(_1891);
    float _1897 = -_1893;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1901 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1903 = precise::clamp(_1901, 0.0, 1.0);
    float _1905 = _1881 * _1895;
    float _1907 = _1877 * _1895;
    float _1909 = abs(_1903);
    float _1911 = log2(_1909);
    float _1913 = _1885 * _1895;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1917 = _1000 * _1907;
    float _1919 = -_1907;
    float _1921 = -_1915;
    float _1923 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1921);
    float _1925 = fma(_998, _1905, _1917);
    float _1927 = -_1913;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1923);
    float _1931 = fma(_1022, _1913, _1925);
    float _1933 = precise::clamp(_1931, 0.0, 1.0);
    float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1937 = _1929 + _1935;
    float _1939 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1941 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = exp2(_1939);
    float _1947 = _1945 * _1943;
    float _1949 = _1933 * _1947;
    float _1951 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1953 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1955 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1951;
    out.m_85.y = _1953;
    out.m_85.z = _1955;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1727 = false;
    bool _1074 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2012 = as_type<float>(_122);
        out.gl_Position.z = _2012;
    }
    if (!_110)
    {
        return out;
    }
    float _126 = in.m_53.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_106);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_158);
        out.gl_Position.z = _2080;
    }
    if (_152)
    {
        return out;
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_55.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_106);
        float _186 = 1.0 / _184;
        float _188 = _140 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_48.x;
    float _194 = in.m_48.y;
    float _196 = in.m_48.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _200 = _190 + _198;
    float _202 = in.m_55.x;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = 1.0 / _206;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _224 = _222 != 0;
    float _226 = in.m_55.z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _230 = _228 != 0;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _234 = _232 != 0;
    float _236 = in.m_57.x;
    float _238 = 1.0 / _210;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _246 = _244 != 0;
    float _248 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = 1.0 / _214;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _252;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _256 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _258 = 1.0 / _218;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _264 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _266 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _268;
    float _272 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _264);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _190 + _274;
    float _278 = 1.0 / _254;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _190 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _284;
    float _288 = _276 * _220;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = _190 + _290;
    float _294 = _282 * _238;
    float _296 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _272);
    float _298 = 1.0 / _262;
    float _300 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _190 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _190 + _306;
    float _310 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _256);
    float _312 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _314 = _304 * _250;
    float _316 = _308 * _258;
    float _318 = _292 * _278;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = fma(_326, _288, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = fma(_330, _288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = fma(_344, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _360 = fma(_348, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _362 = fma(_352, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _380 = fma(_356, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _382 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _384 = isnan(_190);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_366, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _396 = fma(_338, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = fma(_370, _316, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _400 = fma(_374, _316, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _402 = fma(_378, _316, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _404 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _406 = isnan(_190);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _416;
    float _420 = -_392;
    float _422 = _420 + 1.0;
    float _424 = _200 * _298;
    float _426 = fma(_270, _318, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _428 = fma(_418, _318, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _430 = fma(_286, _318, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _414 * _422;
    float _446 = -_414;
    float _448 = _446 + 1.0;
    bool _450 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _452 = isnan(_190);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _466 = -_442;
    float _468 = _466 + 1.0;
    float _470 = _442 * _448;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    bool _476 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_190);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _460 * _468;
    float _490 = -_460;
    float _492 = _490 + 1.0;
    float _494 = fma(_474, _424, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _496 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_190);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -_486;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    bool _516 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _518 = isnan(_190);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = fma(_464, _424, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _530 = _506 * _510;
    float _532 = -_506;
    float _534 = _532 + 1.0;
    float _536 = _486 * _492;
    float _538 = _464;
    float _540 = _506;
    float _542 = _514;
    float _544 = _340;
    bool _546 = false;
    int _548 = as_type<int>(_488);
    if (_224)
    {
        _538 = _202;
    }
    float _550 = _538;
    float _552 = in.m_57.y;
    float _554 = _526 * _534;
    bool _556 = _226 > 0.5;
    float _558 = -_526;
    float _560 = _558 + 1.0;
    float _562 = _550;
    if (_224)
    {
        _540 = _550;
    }
    float _564 = _540;
    float _566 = _332 * _554;
    float _568 = _564;
    if (!_224)
    {
        _568 = _226;
    }
    float _570 = _568;
    float _572 = _340 * _554;
    float _574 = _334 * _554;
    float _576 = fma(_514, _424, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    if (!_230)
    {
        _542 = _236;
    }
    float _578 = _542;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _566);
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _574);
    float _584 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _572);
    float _586 = _578;
    if (!_230)
    {
        _544 = _578;
    }
    float _588 = _544;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _592 = _588;
    if (_230)
    {
        bool _594 = _202 > 0.5;
        _546 = _594;
    }
    bool _596 = _546;
    float _598 = fma(_380, _530, _584);
    if (!_224)
    {
        _562 = _202;
    }
    float _600 = _562;
    float _602 = fma(_394, _530, _580);
    if (_230)
    {
        _586 = _236;
    }
    float _604 = _586;
    float _606 = fma(_396, _530, _582);
    float _608 = in.m_61.x;
    float _610 = in.m_61.y;
    float _612 = in.m_61.z;
    float _614 = fma(_360, _536, _602);
    float _616 = fma(_358, _536, _598);
    float _618 = fma(_362, _536, _606);
    float _620 = in.m_63.x;
    float _622 = in.m_63.y;
    float _624 = in.m_63.z;
    float _626 = -_552;
    float _628 = _626 + 1.0;
    float _630 = fma(_400, _488, _614);
    float _632 = fma(_402, _488, _618);
    float _634 = fma(_398, _488, _616);
    float _636 = _590 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _638 = fma(_426, _470, _630);
    int _640 = _556 ? as_type<int>(_628) : as_type<int>(_552);
    float _642 = fma(_430, _470, _632);
    float _644 = fma(_428, _470, _634);
    float _646 = fma(_528, _444, _638);
    float _648 = _246 ? as_type<float>(_640) : _552;
    float _650 = fma(_576, _444, _642);
    float _652 = fma(_494, _444, _644);
    float _654 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].y, _646);
    float _656 = in.m_55.y;
    float _658 = fma(_636, _648, -0.5);
    float _660 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].z, _650);
    float _662 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].x, _652);
    float _664 = in.m_65.x;
    float _666 = in.m_65.y;
    float _668 = in.m_65.z;
    float _670 = _296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _672 = _610 != 0.0;
    bool _674 = isnan(_610);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.0);
    bool _680 = _676 || _678;
    float _682 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = _654 * _622;
    float _686 = _660 * _624;
    float _688 = _662 * _620;
    float _690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _694 = _608 == 0.0;
    bool _696 = !_680;
    bool _698 = _694 && _696;
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _704 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = _692 * _690;
    bool _710 = _612 == 0.0;
    bool _712 = _710 && _698;
    float _714 = _704 * _700;
    float _716 = _706 * _702;
    float _718 = _708 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _720 = _708 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[24].x, _718);
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[26].x, _720);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _730 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[24].z, _724);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[26].z, _726);
    float _734 = _666;
    float _736 = _668;
    float _738 = _664;
    int _740 = as_type<int>(_728);
    float _742 = _656;
    float _744 = _552;
    float _746 = _604;
    if (!_712)
    {
        float _748 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _666);
        _734 = _748;
    }
    float _750 = _734;
    if (!_712)
    {
        float _752 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _668);
        _736 = _752;
    }
    float _754 = _736;
    float _756 = _730 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _758 = _732 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_712)
    {
        float _760 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _664);
        _738 = _760;
    }
    float _762 = _738;
    float _764 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[88].w, _728);
    float _766 = _670 + _756;
    float _768 = _682 + _758;
    float _770 = _762;
    float _772 = _768;
    if (_230)
    {
        float _774 = -_604;
        float _776 = _774 + 1.0;
        _740 = as_type<int>(_776);
    }
    int _778 = _740;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _766 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _788 = _768 + _786;
    bool _790 = _656 > 0.5;
    if (_234)
    {
        float _792 = -_604;
        float _794 = _792 + 1.0;
        _548 = as_type<int>(_794);
    }
    int _796 = _548;
    float _798 = _784 * _784;
    float _800 = _788 * _788;
    if (_230)
    {
        float _802 = _596 ? as_type<float>(_778) : _604;
        _592 = _802;
    }
    float _804 = _592;
    float _806 = _570 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_224)
    {
        _742 = _600;
    }
    float _808 = _742;
    float _810 = _798 + _800;
    float _812 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[88].z, _780);
    float _814 = _708 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _816 = sqrt(_810);
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _820 = _812;
    if (_242)
    {
        float _822 = _790 ? _628 : _552;
        _744 = _822;
    }
    float _824 = _744;
    float _826 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[25].x, _814);
    float _828 = _808 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _832 = -_818;
    float _834 = fma(_806, 2.0, _832);
    float _836 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    float _838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _840 = fma(_828, -2.0, _830);
    float _842 = _722 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _844 = _310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _846 = _836 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = _842;
    if (_234)
    {
        float _850 = _790 ? as_type<float>(_796) : _604;
        _746 = _850;
    }
    float _852 = _746;
    float _854 = _750 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _856 = _816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _860 = _750 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _862 = _750 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _864 = _844 + _846;
    float _866 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _868 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _860);
    float _870 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _862);
    float _872 = fma(_842, _852, -0.5);
    float _874 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _812);
    float _876 = -_140;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[86].x, _834);
    float _880 = _852;
    if (!_856)
    {
        _848 = _800;
    }
    float _882 = _848;
    float _884 = _882;
    if (!_856)
    {
        _770 = _798;
    }
    float _886 = _770;
    float _888 = _886;
    if (!_856)
    {
        _820 = _766;
    }
    float _890 = _820;
    float _892 = _890;
    if (!_856)
    {
        _880 = _864;
    }
    float _894 = _880;
    bool _896 = !_856;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _816 + _902;
        float _906 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = rsqrt(_810);
        float _910 = _904 * _900;
        float _912 = _910 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = fma(_916, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = _908 * _922;
        float _926 = _920 + (-1.0);
        float _928 = fma(_784, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_788, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _932 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _936 = _928 + _934;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _940 = _930 + _938;
        float _942 = fma(_864, _920, _932);
        float _944 = _936 * _936;
        float _946 = _940 * _940;
        _898 = _942;
        _888 = _944;
        _884 = _946;
        _892 = _928;
        _772 = _930;
    }
    float _948 = _898;
    float _950 = _888;
    float _952 = _884;
    float _954 = _892;
    float _956 = _772;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _960 = _948 + _958;
    float _962 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _764);
    float _964 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _840);
    float _966 = _804 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _968 = fma(_960, _960, _950);
    float _970 = -_964;
    float _972 = fma(_962, _658, _970);
    float _974 = _966 * _838;
    float _976 = _968 + _952;
    float _978 = fma(_874, _872, _878);
    float _980 = _824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _982 = sqrt(_976);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _996 = _980 * _858;
    float _998 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _870);
    float _1000 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _866);
    float _1002 = _978 + 0.5;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1008 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _972 + 0.5;
    float _1022 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _868);
    out.m_67.x = _1008;
    out.m_67.y = _1010;
    out.m_67.z = _1012;
    out.m_67.w = _1004;
    bool _1024 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1026 = isnan(_982);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1032 = _1028 || _1030;
    out.m_69.x = _1014;
    out.m_69.y = _1016;
    out.m_69.z = _1018;
    out.m_69.w = _1006;
    out.m_71.x = _974;
    out.m_71.y = _996;
    out.m_73.x = _1002;
    out.m_73.y = _1020;
    float _1034 = _966;
    float _1036 = _954;
    float _1038 = _974;
    if (!_1032)
    {
        _1034 = 1.0;
    }
    float _1040 = _1034;
    out.m_75.x = _998;
    out.m_75.y = _1000;
    out.m_75.z = _1022;
    bool _1042 = !_1032;
    float _1044 = _1040;
    if (!_1042)
    {
        bool _1046 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1048 = isnan(_982);
        bool _1050 = _1046 || _1048;
        bool _1052 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1054 = _1050 || _1052;
        if (!_1054)
        {
            float _1056 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1058 = _982 + _1056;
            float _1060 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1062 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1060;
            float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1066 = _1064 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1068 = 1.0 / _1062;
            float _1070 = _1058 * _1068;
            float _1072 = fma(_1070, _1066, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1044 = _1072;
            _1074 = true;
        }
        else
        {
            bool _1076 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1078 = isnan(_982);
            bool _1080 = _1076 || _1078;
            bool _1082 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1084 = _1080 || _1082;
            if (!_1084)
            {
                float _1086 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1088 = _982 + _1086;
                float _1090 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1092 = _1090 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1094 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1096 = _1094 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1098 = 1.0 / _1092;
                float _1100 = _1088 * _1098;
                float _1102 = fma(_1100, _1096, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1044 = _1102;
                _1074 = true;
            }
            else
            {
                _1044 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1074 = false;
    float _1104 = _1044;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1108 = _948 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1112 = _954 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1116 = _956 + _1114;
    float _1118 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1120 = fma(_1112, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1122 = fma(_1116, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1126 = _1118 + _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _1120 + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1134 = _1122 + _1132;
    float _1136 = _1126 * _1126;
    float _1138 = fma(_1130, _1130, _1136);
    float _1140 = fma(_1134, _1134, _1138);
    float _1142 = rsqrt(_1140);
    float _1144 = sqrt(_1140);
    float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1148 = _1130 * _1146;
    float _1150 = _1134 * _1146;
    float _1152 = _1148 * _1148;
    float _1154 = _1150 * _1150;
    float _1156 = _1152 + _1154;
    float _1158 = sqrt(_1156);
    bool _1160 = _1158 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1158 + _1162;
    float _1166 = _1142;
    float _1168 = _1104;
    float _1170 = _1164;
    float _1172 = _1126;
    if (_1160)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1166 = _1174;
    }
    float _1176 = _1166;
    if (_1160)
    {
        float _1178 = rsqrt(_1156);
        _1168 = _1178;
    }
    float _1180 = _1168;
    float _1182 = _1180;
    if (_1160)
    {
        float _1184 = _1164 * _1176;
        _1170 = _1184;
    }
    float _1186 = _1170;
    if (_1160)
    {
        float _1188 = _1186 * 0.15915493667125701904296875;
        _1036 = _1188;
    }
    float _1190 = _1036;
    float _1192 = _1176;
    if (_1160)
    {
        float _1194 = _1190 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        _1192 = _1196;
    }
    float _1198 = _1192;
    float _1200 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1202 = precise::max(0.0, _1200);
    float _1204 = _1134;
    float _1206 = _1202;
    if (_1160)
    {
        float _1208 = _1190 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        _1204 = _1210;
    }
    float _1212 = _1204;
    float _1214 = -_1146;
    float _1216 = -_1202;
    float _1218 = fma(_1126, _1214, _1216);
    float _1220 = _1218;
    if (_1160)
    {
        float _1222 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1206 = _1222;
    }
    float _1224 = _1206;
    float _1226 = _1224;
    float _1228 = _1198;
    if (_1160)
    {
        float _1230 = fma(_1198, _1224, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1226 = _1230;
    }
    float _1232 = _1226;
    float _1234 = _1232;
    if (!_1160)
    {
        _1228 = _1150;
    }
    float _1236 = _1228;
    float _1238 = _1236;
    float _1240 = _1212;
    if (_1160)
    {
        float _1242 = _1212 + (-1.0);
        _1172 = _1242;
    }
    float _1244 = _1172;
    float _1246 = _1244;
    if (_1160)
    {
        float _1248 = _1180 * _1232;
        _1038 = _1248;
    }
    float _1250 = _1038;
    if (!_1160)
    {
        _1182 = _1148;
    }
    float _1252 = _1182;
    float _1254 = _1252;
    if (_1160)
    {
        float _1256 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1256;
    }
    float _1258 = _1246;
    if (_1160)
    {
        float _1260 = _1148 * _1250;
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (!_1160)
    {
        _1234 = _1152;
    }
    float _1264 = _1234;
    float _1266 = _1264;
    if (_1160)
    {
        float _1268 = _1150 * _1250;
        _1238 = _1268;
    }
    float _1270 = _1238;
    if (_1160)
    {
        float _1272 = fma(_1218, _1212, _1258);
        _1220 = _1272;
    }
    float _1274 = _1220;
    if (_1160)
    {
        float _1276 = _1262 * _1262;
        _1266 = _1276;
    }
    float _1278 = _1266;
    if (!_1160)
    {
        _1240 = _1154;
    }
    float _1280 = _1240;
    float _1282 = _1280;
    if (_1160)
    {
        float _1284 = _1270 * _1270;
        _1282 = _1284;
    }
    float _1286 = _1282;
    float _1288 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1290 = fma(_1274, _1274, _1278);
    float _1292 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1288);
    float _1294 = _1290 + _1286;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1298 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1296);
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1292);
    float _1304 = rsqrt(_1294);
    float _1306 = -_1300;
    float _1308 = _1306 + 1.0;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1312 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1314 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1316 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1320 = abs(_1308);
    float _1322 = log2(_1320);
    float _1324 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1326 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1328 = -_1318;
    float _1330 = fma(_1328, _1310, 1.0);
    float _1332 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1334 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1324);
    float _1336 = _1304 * _1262;
    float _1338 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1332);
    float _1340 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1334);
    float _1342 = _1304 * _1274;
    float _1344 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1346 = floor(_1326);
    float _1348 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1338);
    float _1350 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1352 = _1304 * _1270;
    float _1354 = -_1344;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1354);
    float _1358 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = floor(_1314);
    float _1366 = -_1352;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1356);
    float _1370 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1358);
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1374 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1376 = fma(_1368, -0.5, 0.5);
    float _1378 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1380 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1372);
    float _1382 = -_1346;
    float _1384 = _1326 + _1382;
    float _1386 = fma(_1368, 0.5, 0.5);
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1380);
    float _1390 = exp2(_1374);
    float _1392 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1394 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1396 = -_1364;
    float _1398 = _1314 + _1396;
    float _1400 = fma(_1386, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1392);
    float _1404 = _1342 + 1.0;
    float _1406 = log2(_1330);
    float _1408 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1394);
    float _1410 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1402);
    float _1412 = fma(_1386, _1400, -0.212114393711090087890625);
    float _1414 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1408);
    float _1416 = 1.0 / _1388;
    float _1418 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1410);
    float _1420 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1414);
    float _1422 = -_1342;
    float _1424 = fma(_1390, _1404, _1422);
    float _1426 = sqrt(_1376);
    float _1428 = _1406 * 0.693147182464599609375;
    float2 _4284 = float2(_1384, _1398);
    float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4284, float2(0.0), isnan(_4284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4284, float2(0.0), isnan(_4284)), level(0.0)).x;
    float _1432 = fma(_1386, _1412, 1.570728778839111328125);
    float _1434 = _1418 * _1416;
    float _1436 = _1420 * _1416;
    float _1438 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1440 = fma(_1434, 0.5, 0.5);
    float _1442 = fma(_1436, -0.5, 0.5);
    float _1444 = _1426 * 0.636619746685028076171875;
    float3 _4316 = float3(_1440, _1442, _1438);
    float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4316, float3(0.0), isnan(_4316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4316, float3(0.0), isnan(_4316)), level(0.0)).x;
    float3 _4327 = float3(_1440, _1442, _1438);
    float4 _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4327, float3(0.0), isnan(_4327)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4327, float3(0.0), isnan(_4327)), level(0.0)).xyzw;
    float _1451 = _1449.x;
    float _1453 = _1449.y;
    float _1455 = _1449.z;
    float _1457 = _1449.w;
    float _1459 = -_1432;
    float _1461 = fma(_1444, _1459, 1.0);
    float _1463 = fma(_1424, 0.5, 0.5);
    float2 _4350 = float2(_1461, _1463);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4350, float2(0.0), isnan(_4350)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4350, float2(0.0), isnan(_4350)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1477 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1479 = isnan(_1144);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1485 = _1481 || _1483;
    float _1487 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1475);
    float _1489 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1491 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1487);
    float _1493 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1489);
    float _1495 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1497 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    float _1499 = 1.0 / _1495;
    float _1501 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1503 = _1501 + _1495;
    float _1505 = _1503 * _1499;
    float _1507 = _1505 * 0.5;
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1511 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1509);
    float _1513 = 1.0 / _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1513 * _1515;
    float _1519 = abs(_1517);
    float _1521 = log2(_1519);
    bool _1523 = _1517 <= 8000.0;
    bool _1525 = isnan(_1517);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan(8000.0);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1537 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1539 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1537);
    float _1541 = exp2(_1535);
    float _1543 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1539);
    float _1545 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1543);
    float _1547 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1549 = precise::clamp(_1547, 0.0, 1.0);
    float _1551 = fma(_1549, -2.0, 3.0);
    float _1553 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1555 = _1549 * _1549;
    float _1557 = _1555 * _1551;
    float _1559 = exp2(_1553);
    float _1561 = in.m_77.x;
    float _1563 = -_1557;
    float _1565 = _1563 + 1.0;
    out.gl_Position.x = _1418;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _1545;
    out.gl_Position.w = _1388;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1557);
    float _1569 = _1545 + _1388;
    float _1571 = _1533 * _1567;
    float _1573 = _1569 * 0.5;
    float _1575 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1577 = -_1559;
    float _1579 = _1577 + 1.0;
    out.m_79.z = _1573;
    out.m_79.w = _1388;
    float _1581 = _1388;
    float _1583 = _1545;
    float _1585 = _1420;
    float _1587 = _1418;
    if (!_1485)
    {
        _1581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1589 = _1581;
    float _1591 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1593 = _1589;
    float _1595 = _1589;
    if (!_1485)
    {
        _1583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1597 = _1583;
    float _1599 = _1597;
    float _1601 = _1597;
    if (!_1485)
    {
        _1585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1603 = _1585;
    float _1605 = _1603;
    float _1607 = _1603;
    if (!_1485)
    {
        _1587 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1609 = _1587;
    float _1611 = -_1430;
    float _1613 = _1611 + 1.0;
    float _1615 = _1613 * _1575;
    float _1617 = precise::clamp(_1615, 0.0, 1.0);
    float _1619 = -_1617;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1623 = -_1591;
    float _1625 = _1623 + 1.0;
    float _1627 = _1621 * _1561;
    float _1629 = _1591 * _1446;
    float _1631 = _1457 * _1629;
    float _1633 = _1473 * _1629;
    float _1635 = fma(_1469, _1631, _1451);
    float _1637 = fma(_1471, _1631, _1453);
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1641 = _1457 * _1625;
    float _1643 = fma(_1457, _1633, _1455);
    float _1645 = _1627;
    float _1647 = _1625;
    float _1649 = _1609;
    float _1651 = _1609;
    if (!_1485)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1653 = _1645;
    out.m_81.x = _1639;
    float _1655 = _1653;
    float _1657 = _1653;
    if (!_1485)
    {
        _1647 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1659 = _1647;
    out.m_83.x = _1635;
    out.m_83.y = _1637;
    out.m_83.z = _1643;
    out.m_83.w = _1641;
    bool _1661 = !_1485;
    float _1663 = _1659;
    float _1665 = _1659;
    if (!_1661)
    {
        bool _1667 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1669 = isnan(_1144);
        bool _1671 = _1667 || _1669;
        bool _1673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1675 = _1671 || _1673;
        if (!_1675)
        {
            float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1679 = _1144 + _1677;
            float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1683 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1681;
            float _1685 = 1.0 / _1683;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1707 = _1679 * _1685;
            float _1709 = precise::clamp(_1707, 0.0, 1.0);
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1715 = fma(_1709, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1717 = fma(_1709, _1713, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1719 = fma(_1709, _1693, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1721 = fma(_1709, _1697, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1723 = fma(_1709, _1701, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1725 = fma(_1709, _1705, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1601 = _1717;
            _1657 = _1723;
            _1595 = _1715;
            _1651 = _1721;
            _1607 = _1719;
            _1665 = _1725;
            _1727 = true;
        }
        else
        {
            bool _1729 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1731 = isnan(_1144);
            bool _1733 = _1729 || _1731;
            bool _1735 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1737 = _1733 || _1735;
            if (!_1737)
            {
                _1593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1739 = _1593;
            _1595 = _1739;
            if (!_1737)
            {
                _1599 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1741 = _1599;
            _1601 = _1741;
            if (!_1737)
            {
                _1605 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1743 = _1605;
            _1607 = _1743;
            if (!_1737)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1745 = _1649;
            _1651 = _1745;
            if (!_1737)
            {
                _1655 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1747 = _1655;
            _1657 = _1747;
            if (!_1737)
            {
                _1663 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1749 = _1663;
            bool _1751 = !_1737;
            _1665 = _1749;
            if (!_1751)
            {
                bool _1753 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1755 = isnan(_1144);
                bool _1757 = _1753 || _1755;
                bool _1759 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1761 = _1757 || _1759;
                if (!_1761)
                {
                    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1765 = _1144 + _1763;
                    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1769 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1767;
                    float _1771 = 1.0 / _1769;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1779 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1793 = _1765 * _1771;
                    float _1795 = precise::clamp(_1793, 0.0, 1.0);
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1801 = fma(_1795, _1775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1803 = fma(_1795, _1799, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1805 = fma(_1795, _1779, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1807 = fma(_1795, _1783, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1809 = fma(_1795, _1787, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1811 = fma(_1795, _1791, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1601 = _1803;
                    _1657 = _1809;
                    _1595 = _1801;
                    _1651 = _1807;
                    _1607 = _1805;
                    _1665 = _1811;
                    _1727 = true;
                }
                else
                {
                    _1601 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1657 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1607 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1665 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1727 = false;
    float _1813 = _1601;
    float _1815 = _1657;
    float _1817 = _1595;
    float _1819 = _1651;
    float _1821 = _1607;
    float _1823 = _1665;
    float _1825 = fma(_1000, -0.5, 0.5);
    float _1827 = precise::clamp(_1825, 0.0, 1.0);
    float _1829 = -_1813;
    float _1831 = _1829 + _1815;
    float _1833 = -_1817;
    float _1835 = _1833 + _1819;
    float _1837 = -_1821;
    float _1839 = _1837 + _1823;
    bool _1841 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1843 = fma(_1827, _1831, _1813);
    float _1845 = fma(_1827, _1835, _1817);
    float _1847 = fma(_1827, _1839, _1821);
    float _1849 = _1843 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _1851 = fma(_1845, 0.298911988735198974609375, _1849);
    float _1853 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1855 = fma(_1847, 0.114477999508380889892578125, _1851);
    out.m_81.w = _1853;
    float _1857 = -_1855;
    float _1859 = _1843 + _1857;
    float _1861 = -_1855;
    float _1863 = _1845 + _1861;
    float _1865 = -_1855;
    float _1867 = _1847 + _1865;
    out.m_85.x = 0.0;
    float _1869 = fma(_1859, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1871 = fma(_1863, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1873 = fma(_1867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    out.m_87.x = _1871;
    out.m_87.y = _1869;
    out.m_87.z = _1873;
    if (!_1841)
    {
        return out;
    }
    float _1875 = -_1118;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1879 = -_1120;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1883 = -_1122;
    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1887 = _1877 * _1877;
    float _1889 = fma(_1881, _1881, _1887);
    float _1891 = fma(_1885, _1885, _1889);
    float _1893 = sqrt(_1891);
    float _1895 = rsqrt(_1891);
    float _1897 = -_1893;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1901 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1903 = precise::clamp(_1901, 0.0, 1.0);
    float _1905 = _1881 * _1895;
    float _1907 = _1877 * _1895;
    float _1909 = abs(_1903);
    float _1911 = log2(_1909);
    float _1913 = _1885 * _1895;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1917 = _1000 * _1907;
    float _1919 = -_1907;
    float _1921 = -_1915;
    float _1923 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1921);
    float _1925 = fma(_998, _1905, _1917);
    float _1927 = -_1913;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1923);
    float _1931 = fma(_1022, _1913, _1925);
    float _1933 = precise::clamp(_1931, 0.0, 1.0);
    float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1937 = _1929 + _1935;
    float _1939 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1941 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = exp2(_1939);
    float _1947 = _1945 * _1943;
    float _1949 = _1933 * _1947;
    float _1951 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1953 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1955 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1951;
    out.m_85.y = _1953;
    out.m_85.z = _1955;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1727 = false;
    bool _1074 = false;
    bool _182 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _101 = in.m_48.w;
    float _103 = trunc(_101);
    int _106 = int(_103);
    bool _110 = _106 >= 1;
    float _112 = 0.0;
    if (!_110)
    {
        _112 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _114 = _112;
    float _116 = _114;
    if (!_110)
    {
        out.m_51.x = 0.0;
    }
    int _118 = 0;
    if (!_110)
    {
        float _120 = _114 * 5.0;
        _118 = as_type<int>(_120);
    }
    int _122 = _118;
    int _124 = _122;
    if (!_110)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2012 = as_type<float>(_122);
        out.gl_Position.z = _2012;
    }
    if (!_110)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _126 = in.m_53.w;
    bool _128 = _126 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _130 = isnan(_126);
    bool _132 = _128 || _130;
    bool _134 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _136 = _132 || _134;
    float _138 = -_126;
    float _140 = _138 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _142 = 0.0;
    if (_136)
    {
        float _144 = float(_106);
        _142 = _144;
    }
    float _146 = _142;
    bool _148 = _140 >= _146;
    bool _150 = !_136;
    bool _152 = _148 || _150;
    if (_152)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _116;
    if (_152)
    {
        out.m_51.x = 0.0;
    }
    if (_152)
    {
        float _156 = _154 * 5.0;
        _124 = as_type<int>(_156);
    }
    int _158 = _124;
    if (_152)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2080 = as_type<float>(_158);
        out.gl_Position.z = _2080;
    }
    if (_152)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _160 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _162 = !_160;
    float _180;
    if (!_162)
    {
        float _164 = in.m_55.x;
        float _166 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _168 = _164 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _170 = fma(_168, (*spvDescriptorSet0.vp_c9)._m0[12].x, _140);
        float _172 = _170 * _166;
        float _174 = floor(_172);
        float _176 = -_174;
        float _178 = _172 + _176;
        _180 = _178;
        _182 = true;
    }
    else
    {
        float _184 = float(_106);
        float _186 = 1.0 / _184;
        float _188 = _140 * _186;
        _180 = _188;
    }
    _182 = false;
    float _190 = _180;
    float _192 = in.m_48.x;
    float _194 = in.m_48.y;
    float _196 = in.m_48.z;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _200 = _190 + _198;
    float _202 = in.m_55.x;
    float _204 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _206 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _204;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _208 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _218 = _216 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _220 = 1.0 / _206;
    int _222 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _224 = _222 != 0;
    float _226 = in.m_55.z;
    int _228 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _230 = _228 != 0;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _234 = _232 != 0;
    float _236 = in.m_57.x;
    float _238 = 1.0 / _210;
    int _240 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _242 = _240 != 0;
    int _244 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _246 = _244 != 0;
    float _248 = _194 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _250 = 1.0 / _214;
    float _252 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _254 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _252;
    out.m_59.x = 1.0;
    out.m_59.y = 1.0;
    out.m_59.z = 1.0;
    float _256 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[5].x, _248);
    float _258 = 1.0 / _218;
    float _260 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _262 = _260 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _264 = _194 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _266 = _194 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _268 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _270 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _268;
    float _272 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[4].x, _264);
    float _274 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _276 = _190 + _274;
    float _278 = 1.0 / _254;
    float _280 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _282 = _190 + _280;
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _286 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _284;
    float _288 = _276 * _220;
    float _290 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _292 = _190 + _290;
    float _294 = _282 * _238;
    float _296 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[4].z, _272);
    float _298 = 1.0 / _262;
    float _300 = fma(_192, (*spvDescriptorSet0.vp_c10)._m0[6].x, _266);
    float _302 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _304 = _190 + _302;
    float _306 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _308 = _190 + _306;
    float _310 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[5].z, _256);
    float _312 = fma(_196, (*spvDescriptorSet0.vp_c10)._m0[6].z, _300);
    float _314 = _304 * _250;
    float _316 = _308 * _258;
    float _318 = _292 * _278;
    float _320 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _322 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _320;
    float _324 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _326 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _324;
    float _328 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _330 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _328;
    float _332 = fma(_322, _288, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _334 = fma(_326, _288, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _336 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _338 = _336 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _340 = fma(_330, _288, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _344 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _342;
    float _346 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _348 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _346;
    float _350 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _352 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _350;
    float _354 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _356 = _354 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _358 = fma(_344, _314, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _360 = fma(_348, _314, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _362 = fma(_352, _314, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _366 = _364 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _368 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _370 = _368 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _372 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _374 = _372 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _376 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _378 = _376 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _380 = fma(_356, _294, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    bool _382 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _384 = isnan(_190);
    bool _386 = _382 || _384;
    bool _388 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _390 = _386 || _388;
    float _392 = float(_390);
    float _394 = fma(_366, _294, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _396 = fma(_338, _294, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _398 = fma(_370, _316, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _400 = fma(_374, _316, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _402 = fma(_378, _316, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    bool _404 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _406 = isnan(_190);
    bool _408 = _404 || _406;
    bool _410 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _412 = _408 || _410;
    float _414 = float(_412);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _416;
    float _420 = -_392;
    float _422 = _420 + 1.0;
    float _424 = _200 * _298;
    float _426 = fma(_270, _318, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _428 = fma(_418, _318, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _430 = fma(_286, _318, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    bool _432 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _434 = isnan(_190);
    bool _436 = _432 || _434;
    bool _438 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _440 = _436 || _438;
    float _442 = float(_440);
    float _444 = _414 * _422;
    float _446 = -_414;
    float _448 = _446 + 1.0;
    bool _450 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _452 = isnan(_190);
    bool _454 = _450 || _452;
    bool _456 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _458 = _454 || _456;
    float _460 = float(_458);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _464 = _462 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _466 = -_442;
    float _468 = _466 + 1.0;
    float _470 = _442 * _448;
    float _472 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _474 = _472 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    bool _476 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _478 = isnan(_190);
    bool _480 = _476 || _478;
    bool _482 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _484 = _480 || _482;
    float _486 = float(_484);
    float _488 = _460 * _468;
    float _490 = -_460;
    float _492 = _490 + 1.0;
    float _494 = fma(_474, _424, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    bool _496 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _498 = isnan(_190);
    bool _500 = _496 || _498;
    bool _502 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _504 = _500 || _502;
    float _506 = float(_504);
    float _508 = -_486;
    float _510 = _508 + 1.0;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[148].z;
    float _514 = _512 + (*spvDescriptorSet0.vp_c9)._m0[149].z;
    bool _516 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _518 = isnan(_190);
    bool _520 = _516 || _518;
    bool _522 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _524 = _520 || _522;
    float _526 = float(_524);
    float _528 = fma(_464, _424, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _530 = _506 * _510;
    float _532 = -_506;
    float _534 = _532 + 1.0;
    float _536 = _486 * _492;
    float _538 = _464;
    float _540 = _506;
    float _542 = _514;
    float _544 = _340;
    bool _546 = false;
    int _548 = as_type<int>(_488);
    if (_224)
    {
        _538 = _202;
    }
    float _550 = _538;
    float _552 = in.m_57.y;
    float _554 = _526 * _534;
    bool _556 = _226 > 0.5;
    float _558 = -_526;
    float _560 = _558 + 1.0;
    float _562 = _550;
    if (_224)
    {
        _540 = _550;
    }
    float _564 = _540;
    float _566 = _332 * _554;
    float _568 = _564;
    if (!_224)
    {
        _568 = _226;
    }
    float _570 = _568;
    float _572 = _340 * _554;
    float _574 = _334 * _554;
    float _576 = fma(_514, _424, (*spvDescriptorSet0.vp_c9)._m0[148].z);
    if (!_230)
    {
        _542 = _236;
    }
    float _578 = _542;
    float _580 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].y, _566);
    float _582 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].z, _574);
    float _584 = fma(_560, (*spvDescriptorSet0.vp_c9)._m0[143].x, _572);
    float _586 = _578;
    if (!_230)
    {
        _544 = _578;
    }
    float _588 = _544;
    float _590 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _592 = _588;
    if (_230)
    {
        bool _594 = _202 > 0.5;
        _546 = _594;
    }
    bool _596 = _546;
    float _598 = fma(_380, _530, _584);
    if (!_224)
    {
        _562 = _202;
    }
    float _600 = _562;
    float _602 = fma(_394, _530, _580);
    if (_230)
    {
        _586 = _236;
    }
    float _604 = _586;
    float _606 = fma(_396, _530, _582);
    float _608 = in.m_61.x;
    float _610 = in.m_61.y;
    float _612 = in.m_61.z;
    float _614 = fma(_360, _536, _602);
    float _616 = fma(_358, _536, _598);
    float _618 = fma(_362, _536, _606);
    float _620 = in.m_63.x;
    float _622 = in.m_63.y;
    float _624 = in.m_63.z;
    float _626 = -_552;
    float _628 = _626 + 1.0;
    float _630 = fma(_400, _488, _614);
    float _632 = fma(_402, _488, _618);
    float _634 = fma(_398, _488, _616);
    float _636 = _590 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _638 = fma(_426, _470, _630);
    int _640 = _556 ? as_type<int>(_628) : as_type<int>(_552);
    float _642 = fma(_430, _470, _632);
    float _644 = fma(_428, _470, _634);
    float _646 = fma(_528, _444, _638);
    float _648 = _246 ? as_type<float>(_640) : _552;
    float _650 = fma(_576, _444, _642);
    float _652 = fma(_494, _444, _644);
    float _654 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].y, _646);
    float _656 = in.m_55.y;
    float _658 = fma(_636, _648, -0.5);
    float _660 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].z, _650);
    float _662 = fma(_392, (*spvDescriptorSet0.vp_c9)._m0[149].x, _652);
    float _664 = in.m_65.x;
    float _666 = in.m_65.y;
    float _668 = in.m_65.z;
    float _670 = _296 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _672 = _610 != 0.0;
    bool _674 = isnan(_610);
    bool _676 = _672 || _674;
    bool _678 = isnan(0.0);
    bool _680 = _676 || _678;
    float _682 = _312 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _684 = _654 * _622;
    float _686 = _660 * _624;
    float _688 = _662 * _620;
    float _690 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _610);
    float _692 = _684 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _694 = _608 == 0.0;
    bool _696 = !_680;
    bool _698 = _694 && _696;
    float _700 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _608);
    float _702 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _612);
    float _704 = _688 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _706 = _686 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _708 = _692 * _690;
    bool _710 = _612 == 0.0;
    bool _712 = _710 && _698;
    float _714 = _704 * _700;
    float _716 = _706 * _702;
    float _718 = _708 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _720 = _708 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _722 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _724 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[24].x, _718);
    float _726 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[26].x, _720);
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _730 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[24].z, _724);
    float _732 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[26].z, _726);
    float _734 = _666;
    float _736 = _668;
    float _738 = _664;
    int _740 = as_type<int>(_728);
    float _742 = _656;
    float _744 = _552;
    float _746 = _604;
    if (!_712)
    {
        float _748 = fma(_610, (*spvDescriptorSet0.vp_c9)._m0[17].y, _666);
        _734 = _748;
    }
    float _750 = _734;
    if (!_712)
    {
        float _752 = fma(_612, (*spvDescriptorSet0.vp_c9)._m0[17].y, _668);
        _736 = _752;
    }
    float _754 = _736;
    float _756 = _730 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _758 = _732 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    if (!_712)
    {
        float _760 = fma(_608, (*spvDescriptorSet0.vp_c9)._m0[17].y, _664);
        _738 = _760;
    }
    float _762 = _738;
    float _764 = fma(_656, (*spvDescriptorSet0.vp_c9)._m0[88].w, _728);
    float _766 = _670 + _756;
    float _768 = _682 + _758;
    float _770 = _762;
    float _772 = _768;
    if (_230)
    {
        float _774 = -_604;
        float _776 = _774 + 1.0;
        _740 = as_type<int>(_776);
    }
    int _778 = _740;
    float _780 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    float _782 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _784 = _766 + _782;
    float _786 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _788 = _768 + _786;
    bool _790 = _656 > 0.5;
    if (_234)
    {
        float _792 = -_604;
        float _794 = _792 + 1.0;
        _548 = as_type<int>(_794);
    }
    int _796 = _548;
    float _798 = _784 * _784;
    float _800 = _788 * _788;
    if (_230)
    {
        float _802 = _596 ? as_type<float>(_778) : _604;
        _592 = _802;
    }
    float _804 = _592;
    float _806 = _570 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    if (!_224)
    {
        _742 = _600;
    }
    float _808 = _742;
    float _810 = _798 + _800;
    float _812 = fma(_600, (*spvDescriptorSet0.vp_c9)._m0[88].z, _780);
    float _814 = _708 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _816 = sqrt(_810);
    float _818 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _820 = _812;
    if (_242)
    {
        float _822 = _790 ? _628 : _552;
        _744 = _822;
    }
    float _824 = _744;
    float _826 = fma(_714, (*spvDescriptorSet0.vp_c8)._m0[25].x, _814);
    float _828 = _808 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _832 = -_818;
    float _834 = fma(_806, 2.0, _832);
    float _836 = fma(_716, (*spvDescriptorSet0.vp_c8)._m0[25].z, _826);
    float _838 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _840 = fma(_828, -2.0, _830);
    float _842 = _722 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _844 = _310 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _846 = _836 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _848 = _842;
    if (_234)
    {
        float _850 = _790 ? as_type<float>(_796) : _604;
        _746 = _850;
    }
    float _852 = _746;
    float _854 = _750 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _856 = _816 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _858 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _860 = _750 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _862 = _750 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _864 = _844 + _846;
    float _866 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[25].x, _854);
    float _868 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[26].x, _860);
    float _870 = fma(_762, (*spvDescriptorSet0.vp_c8)._m0[24].x, _862);
    float _872 = fma(_842, _852, -0.5);
    float _874 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].z, _812);
    float _876 = -_140;
    float _878 = fma(_876, (*spvDescriptorSet0.vp_c9)._m0[86].x, _834);
    float _880 = _852;
    if (!_856)
    {
        _848 = _800;
    }
    float _882 = _848;
    float _884 = _882;
    if (!_856)
    {
        _770 = _798;
    }
    float _886 = _770;
    float _888 = _886;
    if (!_856)
    {
        _820 = _766;
    }
    float _890 = _820;
    float _892 = _890;
    if (!_856)
    {
        _880 = _864;
    }
    float _894 = _880;
    bool _896 = !_856;
    float _898 = _894;
    if (!_896)
    {
        float _900 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _902 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _904 = _816 + _902;
        float _906 = _864 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _908 = rsqrt(_810);
        float _910 = _904 * _900;
        float _912 = _910 * 0.15915493667125701904296875;
        float _914 = _912 * 6.283185482025146484375;
        float _916 = sin(_914);
        float _918 = _912 * 6.283185482025146484375;
        float _920 = cos(_918);
        float _922 = fma(_916, _906, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _924 = _908 * _922;
        float _926 = _920 + (-1.0);
        float _928 = fma(_784, _924, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _930 = fma(_788, _924, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _932 = _926 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _934 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _936 = _928 + _934;
        float _938 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _940 = _930 + _938;
        float _942 = fma(_864, _920, _932);
        float _944 = _936 * _936;
        float _946 = _940 * _940;
        _898 = _942;
        _888 = _944;
        _884 = _946;
        _892 = _928;
        _772 = _930;
    }
    float _948 = _898;
    float _950 = _888;
    float _952 = _884;
    float _954 = _892;
    float _956 = _772;
    float _958 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _960 = _948 + _958;
    float _962 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[87].w, _764);
    float _964 = fma(_140, (*spvDescriptorSet0.vp_c9)._m0[86].y, _840);
    float _966 = _804 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _968 = fma(_960, _960, _950);
    float _970 = -_964;
    float _972 = fma(_962, _658, _970);
    float _974 = _966 * _838;
    float _976 = _968 + _952;
    float _978 = fma(_874, _872, _878);
    float _980 = _824 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _982 = sqrt(_976);
    float _984 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _986 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _988 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _990 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _992 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _994 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _996 = _980 * _858;
    float _998 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[24].z, _870);
    float _1000 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[25].z, _866);
    float _1002 = _978 + 0.5;
    float _1004 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1006 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1008 = _984 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1010 = _986 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1012 = _988 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1014 = _990 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1016 = _992 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1018 = _994 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1020 = _972 + 0.5;
    float _1022 = fma(_754, (*spvDescriptorSet0.vp_c8)._m0[26].z, _868);
    out.m_67.x = _1008;
    out.m_67.y = _1010;
    out.m_67.z = _1012;
    out.m_67.w = _1004;
    bool _1024 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1026 = isnan(_982);
    bool _1028 = _1024 || _1026;
    bool _1030 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1032 = _1028 || _1030;
    out.m_69.x = _1014;
    out.m_69.y = _1016;
    out.m_69.z = _1018;
    out.m_69.w = _1006;
    out.m_71.x = _974;
    out.m_71.y = _996;
    out.m_73.x = _1002;
    out.m_73.y = _1020;
    float _1034 = _966;
    float _1036 = _954;
    float _1038 = _974;
    if (!_1032)
    {
        _1034 = 1.0;
    }
    float _1040 = _1034;
    out.m_75.x = _998;
    out.m_75.y = _1000;
    out.m_75.z = _1022;
    bool _1042 = !_1032;
    float _1044 = _1040;
    if (!_1042)
    {
        bool _1046 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1048 = isnan(_982);
        bool _1050 = _1046 || _1048;
        bool _1052 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1054 = _1050 || _1052;
        if (!_1054)
        {
            float _1056 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1058 = _982 + _1056;
            float _1060 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1062 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1060;
            float _1064 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1066 = _1064 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1068 = 1.0 / _1062;
            float _1070 = _1058 * _1068;
            float _1072 = fma(_1070, _1066, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1044 = _1072;
            _1074 = true;
        }
        else
        {
            bool _1076 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1078 = isnan(_982);
            bool _1080 = _1076 || _1078;
            bool _1082 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1084 = _1080 || _1082;
            if (!_1084)
            {
                float _1086 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1088 = _982 + _1086;
                float _1090 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1092 = _1090 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1094 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1096 = _1094 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1098 = 1.0 / _1092;
                float _1100 = _1088 * _1098;
                float _1102 = fma(_1100, _1096, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1044 = _1102;
                _1074 = true;
            }
            else
            {
                _1044 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1074 = false;
    float _1104 = _1044;
    float _1106 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1108 = _948 + _1106;
    float _1110 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1112 = _954 + _1110;
    float _1114 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1116 = _956 + _1114;
    float _1118 = fma(_1108, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1120 = fma(_1112, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1122 = fma(_1116, _1104, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1124 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1126 = _1118 + _1124;
    float _1128 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1130 = _1120 + _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1134 = _1122 + _1132;
    float _1136 = _1126 * _1126;
    float _1138 = fma(_1130, _1130, _1136);
    float _1140 = fma(_1134, _1134, _1138);
    float _1142 = rsqrt(_1140);
    float _1144 = sqrt(_1140);
    float _1146 = _1142 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1148 = _1130 * _1146;
    float _1150 = _1134 * _1146;
    float _1152 = _1148 * _1148;
    float _1154 = _1150 * _1150;
    float _1156 = _1152 + _1154;
    float _1158 = sqrt(_1156);
    bool _1160 = _1158 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1162 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1164 = _1158 + _1162;
    float _1166 = _1142;
    float _1168 = _1104;
    float _1170 = _1164;
    float _1172 = _1126;
    if (_1160)
    {
        float _1174 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1166 = _1174;
    }
    float _1176 = _1166;
    if (_1160)
    {
        float _1178 = rsqrt(_1156);
        _1168 = _1178;
    }
    float _1180 = _1168;
    float _1182 = _1180;
    if (_1160)
    {
        float _1184 = _1164 * _1176;
        _1170 = _1184;
    }
    float _1186 = _1170;
    if (_1160)
    {
        float _1188 = _1186 * 0.15915493667125701904296875;
        _1036 = _1188;
    }
    float _1190 = _1036;
    float _1192 = _1176;
    if (_1160)
    {
        float _1194 = _1190 * 6.283185482025146484375;
        float _1196 = sin(_1194);
        _1192 = _1196;
    }
    float _1198 = _1192;
    float _1200 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1202 = precise::max(0.0, _1200);
    float _1204 = _1134;
    float _1206 = _1202;
    if (_1160)
    {
        float _1208 = _1190 * 6.283185482025146484375;
        float _1210 = cos(_1208);
        _1204 = _1210;
    }
    float _1212 = _1204;
    float _1214 = -_1146;
    float _1216 = -_1202;
    float _1218 = fma(_1126, _1214, _1216);
    float _1220 = _1218;
    if (_1160)
    {
        float _1222 = _1218 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1206 = _1222;
    }
    float _1224 = _1206;
    float _1226 = _1224;
    float _1228 = _1198;
    if (_1160)
    {
        float _1230 = fma(_1198, _1224, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1226 = _1230;
    }
    float _1232 = _1226;
    float _1234 = _1232;
    if (!_1160)
    {
        _1228 = _1150;
    }
    float _1236 = _1228;
    float _1238 = _1236;
    float _1240 = _1212;
    if (_1160)
    {
        float _1242 = _1212 + (-1.0);
        _1172 = _1242;
    }
    float _1244 = _1172;
    float _1246 = _1244;
    if (_1160)
    {
        float _1248 = _1180 * _1232;
        _1038 = _1248;
    }
    float _1250 = _1038;
    if (!_1160)
    {
        _1182 = _1148;
    }
    float _1252 = _1182;
    float _1254 = _1252;
    if (_1160)
    {
        float _1256 = _1244 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1246 = _1256;
    }
    float _1258 = _1246;
    if (_1160)
    {
        float _1260 = _1148 * _1250;
        _1254 = _1260;
    }
    float _1262 = _1254;
    if (!_1160)
    {
        _1234 = _1152;
    }
    float _1264 = _1234;
    float _1266 = _1264;
    if (_1160)
    {
        float _1268 = _1150 * _1250;
        _1238 = _1268;
    }
    float _1270 = _1238;
    if (_1160)
    {
        float _1272 = fma(_1218, _1212, _1258);
        _1220 = _1272;
    }
    float _1274 = _1220;
    if (_1160)
    {
        float _1276 = _1262 * _1262;
        _1266 = _1276;
    }
    float _1278 = _1266;
    if (!_1160)
    {
        _1240 = _1154;
    }
    float _1280 = _1240;
    float _1282 = _1280;
    if (_1160)
    {
        float _1284 = _1270 * _1270;
        _1282 = _1284;
    }
    float _1286 = _1282;
    float _1288 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1290 = fma(_1274, _1274, _1278);
    float _1292 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1288);
    float _1294 = _1290 + _1286;
    float _1296 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1298 = fma(_1144, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1296);
    float _1300 = precise::clamp(_1298, 0.0, 1.0);
    float _1302 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1292);
    float _1304 = rsqrt(_1294);
    float _1306 = -_1300;
    float _1308 = _1306 + 1.0;
    float _1310 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1312 = _1302 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1314 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1316 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1318 = _1312 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1320 = abs(_1308);
    float _1322 = log2(_1320);
    float _1324 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1326 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1328 = -_1318;
    float _1330 = fma(_1328, _1310, 1.0);
    float _1332 = _1118 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1334 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1324);
    float _1336 = _1304 * _1262;
    float _1338 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1332);
    float _1340 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1334);
    float _1342 = _1304 * _1274;
    float _1344 = _1336 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1346 = floor(_1326);
    float _1348 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1338);
    float _1350 = _1340 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1352 = _1304 * _1270;
    float _1354 = -_1344;
    float _1356 = fma(_1342, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1354);
    float _1358 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1316);
    float _1360 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1362 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1364 = floor(_1314);
    float _1366 = -_1352;
    float _1368 = fma(_1366, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1356);
    float _1370 = fma(_1122, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1358);
    float _1372 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1362);
    float _1374 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1376 = fma(_1368, -0.5, 0.5);
    float _1378 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1380 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1372);
    float _1382 = -_1346;
    float _1384 = _1326 + _1382;
    float _1386 = fma(_1368, 0.5, 0.5);
    float _1388 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1380);
    float _1390 = exp2(_1374);
    float _1392 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1394 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1396 = -_1364;
    float _1398 = _1314 + _1396;
    float _1400 = fma(_1386, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1402 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1392);
    float _1404 = _1342 + 1.0;
    float _1406 = log2(_1330);
    float _1408 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1394);
    float _1410 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1402);
    float _1412 = fma(_1386, _1400, -0.212114393711090087890625);
    float _1414 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1408);
    float _1416 = 1.0 / _1388;
    float _1418 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1410);
    float _1420 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1414);
    float _1422 = -_1342;
    float _1424 = fma(_1390, _1404, _1422);
    float _1426 = sqrt(_1376);
    float _1428 = _1406 * 0.693147182464599609375;
    float2 _4284 = float2(_1384, _1398);
    float _1430 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4284, float2(0.0), isnan(_4284)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4284, float2(0.0), isnan(_4284)), level(0.0)).x;
    float _1432 = fma(_1386, _1412, 1.570728778839111328125);
    float _1434 = _1418 * _1416;
    float _1436 = _1420 * _1416;
    float _1438 = _1428 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1440 = fma(_1434, 0.5, 0.5);
    float _1442 = fma(_1436, -0.5, 0.5);
    float _1444 = _1426 * 0.636619746685028076171875;
    float3 _4316 = float3(_1440, _1442, _1438);
    float _1446 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4316, float3(0.0), isnan(_4316)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4316, float3(0.0), isnan(_4316)), level(0.0)).x;
    float3 _4327 = float3(_1440, _1442, _1438);
    float4 _1449 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4327, float3(0.0), isnan(_4327)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4327, float3(0.0), isnan(_4327)), level(0.0)).xyzw;
    float _1451 = _1449.x;
    float _1453 = _1449.y;
    float _1455 = _1449.z;
    float _1457 = _1449.w;
    float _1459 = -_1432;
    float _1461 = fma(_1444, _1459, 1.0);
    float _1463 = fma(_1424, 0.5, 0.5);
    float2 _4350 = float2(_1461, _1463);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4350, float2(0.0), isnan(_4350)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4350, float2(0.0), isnan(_4350)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _1477 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1479 = isnan(_1144);
    bool _1481 = _1477 || _1479;
    bool _1483 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1485 = _1481 || _1483;
    float _1487 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1475);
    float _1489 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1491 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1487);
    float _1493 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1489);
    float _1495 = _1491 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1497 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1493);
    float _1499 = 1.0 / _1495;
    float _1501 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1503 = _1501 + _1495;
    float _1505 = _1503 * _1499;
    float _1507 = _1505 * 0.5;
    float _1509 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1511 = fma(_1507, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1509);
    float _1513 = 1.0 / _1511;
    float _1515 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1517 = _1513 * _1515;
    float _1519 = abs(_1517);
    float _1521 = log2(_1519);
    bool _1523 = _1517 <= 8000.0;
    bool _1525 = isnan(_1517);
    bool _1527 = _1523 || _1525;
    bool _1529 = isnan(8000.0);
    bool _1531 = _1527 || _1529;
    float _1533 = float(_1531);
    float _1535 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1537 = _1350 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1539 = fma(_1360, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1537);
    float _1541 = exp2(_1535);
    float _1543 = fma(_1312, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1539);
    float _1545 = fma(_1378, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1543);
    float _1547 = fma(_1541, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1549 = precise::clamp(_1547, 0.0, 1.0);
    float _1551 = fma(_1549, -2.0, 3.0);
    float _1553 = _1322 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1555 = _1549 * _1549;
    float _1557 = _1555 * _1551;
    float _1559 = exp2(_1553);
    float _1561 = in.m_77.x;
    float _1563 = -_1557;
    float _1565 = _1563 + 1.0;
    out.gl_Position.x = _1418;
    out.gl_Position.y = _1420;
    out.gl_Position.z = _1545;
    out.gl_Position.w = _1388;
    float _1567 = fma(_1565, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1557);
    float _1569 = _1545 + _1388;
    float _1571 = _1533 * _1567;
    float _1573 = _1569 * 0.5;
    float _1575 = _1571 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1577 = -_1559;
    float _1579 = _1577 + 1.0;
    out.m_79.z = _1573;
    out.m_79.w = _1388;
    float _1581 = _1388;
    float _1583 = _1545;
    float _1585 = _1420;
    float _1587 = _1418;
    if (!_1485)
    {
        _1581 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1589 = _1581;
    float _1591 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1593 = _1589;
    float _1595 = _1589;
    if (!_1485)
    {
        _1583 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1597 = _1583;
    float _1599 = _1597;
    float _1601 = _1597;
    if (!_1485)
    {
        _1585 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1603 = _1585;
    float _1605 = _1603;
    float _1607 = _1603;
    if (!_1485)
    {
        _1587 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1609 = _1587;
    float _1611 = -_1430;
    float _1613 = _1611 + 1.0;
    float _1615 = _1613 * _1575;
    float _1617 = precise::clamp(_1615, 0.0, 1.0);
    float _1619 = -_1617;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1623 = -_1591;
    float _1625 = _1623 + 1.0;
    float _1627 = _1621 * _1561;
    float _1629 = _1591 * _1446;
    float _1631 = _1457 * _1629;
    float _1633 = _1473 * _1629;
    float _1635 = fma(_1469, _1631, _1451);
    float _1637 = fma(_1471, _1631, _1453);
    float _1639 = _1627 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1641 = _1457 * _1625;
    float _1643 = fma(_1457, _1633, _1455);
    float _1645 = _1627;
    float _1647 = _1625;
    float _1649 = _1609;
    float _1651 = _1609;
    if (!_1485)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1653 = _1645;
    out.m_81.x = _1639;
    float _1655 = _1653;
    float _1657 = _1653;
    if (!_1485)
    {
        _1647 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1659 = _1647;
    out.m_83.x = _1635;
    out.m_83.y = _1637;
    out.m_83.z = _1643;
    out.m_83.w = _1641;
    bool _1661 = !_1485;
    float _1663 = _1659;
    float _1665 = _1659;
    if (!_1661)
    {
        bool _1667 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1669 = isnan(_1144);
        bool _1671 = _1667 || _1669;
        bool _1673 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1675 = _1671 || _1673;
        if (!_1675)
        {
            float _1677 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1679 = _1144 + _1677;
            float _1681 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1683 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1681;
            float _1685 = 1.0 / _1683;
            float _1687 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1689 = _1687 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1691 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1693 = _1691 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1707 = _1679 * _1685;
            float _1709 = precise::clamp(_1707, 0.0, 1.0);
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1715 = fma(_1709, _1689, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1717 = fma(_1709, _1713, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1719 = fma(_1709, _1693, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1721 = fma(_1709, _1697, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1723 = fma(_1709, _1701, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1725 = fma(_1709, _1705, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1601 = _1717;
            _1657 = _1723;
            _1595 = _1715;
            _1651 = _1721;
            _1607 = _1719;
            _1665 = _1725;
            _1727 = true;
        }
        else
        {
            bool _1729 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1731 = isnan(_1144);
            bool _1733 = _1729 || _1731;
            bool _1735 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1737 = _1733 || _1735;
            if (!_1737)
            {
                _1593 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1739 = _1593;
            _1595 = _1739;
            if (!_1737)
            {
                _1599 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1741 = _1599;
            _1601 = _1741;
            if (!_1737)
            {
                _1605 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1743 = _1605;
            _1607 = _1743;
            if (!_1737)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1745 = _1649;
            _1651 = _1745;
            if (!_1737)
            {
                _1655 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1747 = _1655;
            _1657 = _1747;
            if (!_1737)
            {
                _1663 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1749 = _1663;
            bool _1751 = !_1737;
            _1665 = _1749;
            if (!_1751)
            {
                bool _1753 = _1144 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1755 = isnan(_1144);
                bool _1757 = _1753 || _1755;
                bool _1759 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1761 = _1757 || _1759;
                if (!_1761)
                {
                    float _1763 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1765 = _1144 + _1763;
                    float _1767 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1769 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1767;
                    float _1771 = 1.0 / _1769;
                    float _1773 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1775 = _1773 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1777 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1779 = _1777 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1793 = _1765 * _1771;
                    float _1795 = precise::clamp(_1793, 0.0, 1.0);
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1801 = fma(_1795, _1775, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1803 = fma(_1795, _1799, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1805 = fma(_1795, _1779, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1807 = fma(_1795, _1783, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1809 = fma(_1795, _1787, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1811 = fma(_1795, _1791, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1601 = _1803;
                    _1657 = _1809;
                    _1595 = _1801;
                    _1651 = _1807;
                    _1607 = _1805;
                    _1665 = _1811;
                    _1727 = true;
                }
                else
                {
                    _1601 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1657 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1595 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1607 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1665 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1727 = false;
    float _1813 = _1601;
    float _1815 = _1657;
    float _1817 = _1595;
    float _1819 = _1651;
    float _1821 = _1607;
    float _1823 = _1665;
    float _1825 = fma(_1000, -0.5, 0.5);
    float _1827 = precise::clamp(_1825, 0.0, 1.0);
    float _1829 = -_1813;
    float _1831 = _1829 + _1815;
    float _1833 = -_1817;
    float _1835 = _1833 + _1819;
    float _1837 = -_1821;
    float _1839 = _1837 + _1823;
    bool _1841 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1843 = fma(_1827, _1831, _1813);
    float _1845 = fma(_1827, _1835, _1817);
    float _1847 = fma(_1827, _1839, _1821);
    float _1849 = _1843 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _1851 = fma(_1845, 0.298911988735198974609375, _1849);
    float _1853 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1855 = fma(_1847, 0.114477999508380889892578125, _1851);
    out.m_81.w = _1853;
    float _1857 = -_1855;
    float _1859 = _1843 + _1857;
    float _1861 = -_1855;
    float _1863 = _1845 + _1861;
    float _1865 = -_1855;
    float _1867 = _1847 + _1865;
    out.m_85.x = 0.0;
    float _1869 = fma(_1859, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1871 = fma(_1863, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    float _1873 = fma(_1867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1855);
    out.m_87.x = _1871;
    out.m_87.y = _1869;
    out.m_87.z = _1873;
    if (!_1841)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1875 = -_1118;
    float _1877 = _1875 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1879 = -_1120;
    float _1881 = _1879 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1883 = -_1122;
    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1887 = _1877 * _1877;
    float _1889 = fma(_1881, _1881, _1887);
    float _1891 = fma(_1885, _1885, _1889);
    float _1893 = sqrt(_1891);
    float _1895 = rsqrt(_1891);
    float _1897 = -_1893;
    float _1899 = _1897 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1901 = _1899 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1903 = precise::clamp(_1901, 0.0, 1.0);
    float _1905 = _1881 * _1895;
    float _1907 = _1877 * _1895;
    float _1909 = abs(_1903);
    float _1911 = log2(_1909);
    float _1913 = _1885 * _1895;
    float _1915 = _1905 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1917 = _1000 * _1907;
    float _1919 = -_1907;
    float _1921 = -_1915;
    float _1923 = fma(_1919, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1921);
    float _1925 = fma(_998, _1905, _1917);
    float _1927 = -_1913;
    float _1929 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1923);
    float _1931 = fma(_1022, _1913, _1925);
    float _1933 = precise::clamp(_1931, 0.0, 1.0);
    float _1935 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1937 = _1929 + _1935;
    float _1939 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1941 = _1937 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1943 = precise::clamp(_1941, 0.0, 1.0);
    float _1945 = exp2(_1939);
    float _1947 = _1945 * _1943;
    float _1949 = _1933 * _1947;
    float _1951 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1953 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1955 = _1949 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1951;
    out.m_85.y = _1953;
    out.m_85.z = _1955;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

