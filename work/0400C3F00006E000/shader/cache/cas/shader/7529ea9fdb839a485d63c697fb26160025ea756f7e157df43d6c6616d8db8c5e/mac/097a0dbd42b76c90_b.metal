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
    bool _1735 = false;
    bool _1072 = false;
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
        float _2020 = as_type<float>(_122);
        out.gl_Position.z = _2020;
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
        float _2088 = as_type<float>(_158);
        out.gl_Position.z = _2088;
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
    if (!_1032)
    {
        _1034 = 1.0;
    }
    float _1038 = _1034;
    out.m_75.x = _998;
    out.m_75.y = _1000;
    out.m_75.z = _1022;
    bool _1040 = !_1032;
    float _1042 = _1038;
    if (!_1040)
    {
        bool _1044 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1046 = isnan(_982);
        bool _1048 = _1044 || _1046;
        bool _1050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1052 = _1048 || _1050;
        if (!_1052)
        {
            float _1054 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1056 = _982 + _1054;
            float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1060 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1058;
            float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1064 = _1062 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1066 = 1.0 / _1060;
            float _1068 = _1056 * _1066;
            float _1070 = fma(_1068, _1064, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1042 = _1070;
            _1072 = true;
        }
        else
        {
            bool _1074 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1076 = isnan(_982);
            bool _1078 = _1074 || _1076;
            bool _1080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1082 = _1078 || _1080;
            if (!_1082)
            {
                float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1086 = _982 + _1084;
                float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1090 = _1088 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1096 = 1.0 / _1090;
                float _1098 = _1086 * _1096;
                float _1100 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1042 = _1100;
                _1072 = true;
            }
            else
            {
                _1042 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1072 = false;
    float _1102 = _1042;
    float _1104 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1106 = _948 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1110 = _954 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1114 = _956 + _1112;
    float _1116 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1118 = fma(_1110, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1120 = fma(_1114, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1124 = _1116 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1128 = _1118 + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1132 = _1120 + _1130;
    float _1134 = _1124 * _1124;
    float _1136 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1138 = fma(_1128, _1128, _1134);
    float _1140 = floor(_1136);
    float _1142 = fma(_1132, _1132, _1138);
    float _1144 = rsqrt(_1142);
    float _1146 = sqrt(_1142);
    float _1148 = -_1140;
    float _1150 = _1136 + _1148;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1154 = _1128 * _1152;
    float _1156 = _1132 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 * _1156;
    float _1162 = _1158 + _1160;
    float _1164 = sqrt(_1162);
    bool _1166 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1164 + _1168;
    float _1172 = _1144;
    float _1174 = _1162;
    float _1176 = _1170;
    float _1178 = _1124;
    if (_1166)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1172 = _1180;
    }
    float _1182 = _1172;
    if (_1166)
    {
        float _1184 = rsqrt(_1162);
        _1174 = _1184;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (_1166)
    {
        float _1190 = _1170 * _1182;
        _1176 = _1190;
    }
    float _1192 = _1176;
    if (_1166)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1036 = _1194;
    }
    float _1196 = _1036;
    float _1198 = _1182;
    float _1200 = _1196;
    if (_1166)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1198 = _1204;
    }
    float _1206 = _1198;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1132;
    float _1214 = _1210;
    if (_1166)
    {
        float _1216 = _1196 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1212 = _1218;
    }
    float _1220 = _1212;
    float _1222 = -_1152;
    float _1224 = -_1210;
    float _1226 = fma(_1124, _1222, _1224);
    float _1228 = _1226;
    if (_1166)
    {
        float _1230 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1230;
    }
    float _1232 = _1214;
    float _1234 = _1232;
    if (!_1166)
    {
        _1200 = _1154;
    }
    float _1236 = _1200;
    float _1238 = _1206;
    float _1240 = _1236;
    if (_1166)
    {
        float _1242 = fma(_1206, _1232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1242;
    }
    float _1244 = _1234;
    float _1246 = _1244;
    if (!_1166)
    {
        _1238 = _1156;
    }
    float _1248 = _1238;
    float _1250 = _1248;
    float _1252 = _1220;
    if (_1166)
    {
        float _1254 = _1220 + (-1.0);
        _1178 = _1254;
    }
    float _1256 = _1178;
    float _1258 = _1256;
    if (_1166)
    {
        float _1260 = _1186 * _1244;
        _1246 = _1260;
    }
    float _1262 = _1246;
    if (!_1166)
    {
        _1188 = _1160;
    }
    float _1264 = _1188;
    float _1266 = _1264;
    if (_1166)
    {
        float _1268 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1268;
    }
    float _1270 = _1258;
    if (_1166)
    {
        float _1272 = _1154 * _1262;
        _1240 = _1272;
    }
    float _1274 = _1240;
    if (_1166)
    {
        float _1276 = _1156 * _1262;
        _1250 = _1276;
    }
    float _1278 = _1250;
    float _1280 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1166)
    {
        float _1282 = fma(_1226, _1220, _1270);
        _1228 = _1282;
    }
    float _1284 = _1228;
    if (!_1166)
    {
        _1252 = _1158;
    }
    float _1286 = _1252;
    float _1288 = _1286;
    if (_1166)
    {
        float _1290 = _1274 * _1274;
        _1288 = _1290;
    }
    float _1292 = _1288;
    if (_1166)
    {
        float _1294 = _1278 * _1278;
        _1266 = _1294;
    }
    float _1296 = _1266;
    float _1298 = fma(_1284, _1284, _1292);
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = _1298 + _1296;
    float _1304 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1280);
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1308 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1306);
    float _1310 = precise::clamp(_1308, 0.0, 1.0);
    float _1312 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1314 = rsqrt(_1302);
    float _1316 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1304);
    float _1318 = -_1310;
    float _1320 = _1318 + 1.0;
    float _1322 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1326 = abs(_1320);
    float _1328 = log2(_1326);
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1332 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = -_1330;
    float _1336 = fma(_1334, _1300, 1.0);
    float _1338 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1340 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = _1314 * _1274;
    float _1344 = _1314 * _1284;
    float _1346 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1338);
    float _1348 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1352 = floor(_1312);
    float _1354 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1314 * _1278;
    float _1360 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1322);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1366 = -_1350;
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1366);
    float _1370 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1372 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1364);
    float _1376 = -_1358;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1368);
    float _1380 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1382 = exp2(_1372);
    float _1384 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1386 = fma(_1378, -0.5, 0.5);
    float _1388 = -_1352;
    float _1390 = _1312 + _1388;
    float _1392 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1394 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1384);
    float _1396 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1398 = sqrt(_1386);
    float _1400 = fma(_1378, 0.5, 0.5);
    float _1402 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1392);
    float _1404 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1396);
    float _1406 = fma(_1400, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1408 = _1344 + 1.0;
    float _1410 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1402);
    float _1412 = log2(_1336);
    float _1414 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1404);
    float _1416 = fma(_1400, _1406, -0.212114393711090087890625);
    float _1418 = -_1344;
    float _1420 = fma(_1382, _1408, _1418);
    float _1422 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1410);
    float _1424 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1414);
    float _1426 = fma(_1400, _1416, 1.570728778839111328125);
    float2 _4291 = float2(_1390, _1150);
    float _1428 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4291, float2(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4291, float2(0.0), isnan(_4291)), level(0.0)).x;
    float _1430 = 1.0 / _1394;
    float _1432 = _1398 * 0.636619746685028076171875;
    float _1434 = fma(_1420, 0.5, 0.5);
    float _1436 = -_1426;
    float _1438 = fma(_1432, _1436, 1.0);
    float _1440 = _1412 * 0.693147182464599609375;
    float _1442 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1444 = _1422 * _1430;
    float _1446 = _1424 * _1430;
    float _1448 = fma(_1444, 0.5, 0.5);
    float _1450 = fma(_1446, -0.5, 0.5);
    float3 _4331 = float3(_1448, _1450, _1442);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4331, float3(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4331, float3(0.0), isnan(_4331)), level(0.0)).x;
    float3 _4342 = float3(_1448, _1450, _1442);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4342, float3(0.0), isnan(_4342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4342, float3(0.0), isnan(_4342)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4358 = float2(_1438, _1434);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1477 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1479 = in.m_77.x;
    bool _1481 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1483 = isnan(_1146);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1475);
    float _1493 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1495 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1477);
    float _1497 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1491);
    float _1499 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1493);
    float _1501 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1495);
    float _1503 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1505 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1507 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1499);
    float _1509 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1501);
    float _1511 = 1.0 / _1505;
    float _1513 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1515 = _1509 + _1394;
    float _1517 = _1513 + _1505;
    out.gl_Position.x = _1422;
    out.gl_Position.y = _1424;
    out.gl_Position.z = _1509;
    out.gl_Position.w = _1394;
    float _1519 = _1515 * 0.5;
    float _1521 = exp2(_1503);
    float _1523 = _1517 * _1511;
    float _1525 = _1523 * 0.5;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    float _1531 = _1509;
    float _1533 = _1422;
    float _1535 = _1394;
    float _1537 = _1424;
    if (!_1489)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1539 = _1531;
    float _1541 = -_1521;
    float _1543 = _1541 + 1.0;
    float _1545 = 1.0 / _1529;
    float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1549 = _1545 * _1547;
    float _1551 = abs(_1549);
    float _1553 = log2(_1551);
    bool _1555 = _1549 <= 8000.0;
    bool _1557 = isnan(_1549);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(8000.0);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1569 = exp2(_1567);
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = _1422 + _1394;
    float _1577 = _1539;
    float _1579 = _1539;
    if (!_1489)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1581 = _1533;
    float _1583 = fma(_1573, -2.0, 3.0);
    float _1585 = _1573 * _1573;
    float _1587 = _1575 * 0.5;
    float _1589 = _1585 * _1583;
    float _1591 = -_1589;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1589);
    float _1597 = _1394 * 0.5;
    float _1599 = _1581;
    float _1601 = _1581;
    if (!_1489)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1603 = _1535;
    float _1605 = _1565 * _1595;
    float _1607 = fma(_1424, -0.5, _1597);
    float _1609 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1611 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1613 = _1603;
    float _1615 = _1603;
    if (!_1489)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1617 = _1537;
    out.m_79.x = _1587;
    out.m_79.y = _1607;
    out.m_79.z = _1519;
    out.m_79.w = _1394;
    float _1619 = -_1428;
    float _1621 = _1619 + 1.0;
    float _1623 = _1621 * _1611;
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = -_1625;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1631 = _1629 * _1479;
    float _1633 = _1609 * _1452;
    float _1635 = -_1609;
    float _1637 = _1635 + 1.0;
    float _1639 = _1463 * _1633;
    float _1641 = _1473 * _1633;
    float _1643 = _1463 * _1637;
    float _1645 = _1637;
    float _1647 = _1631;
    float _1649 = _1617;
    float _1651 = _1617;
    if (!_1489)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1653 = _1645;
    float _1655 = fma(_1469, _1639, _1457);
    float _1657 = fma(_1471, _1639, _1459);
    float _1659 = _1631 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1661 = fma(_1463, _1641, _1461);
    float _1663 = _1653;
    float _1665 = _1653;
    if (!_1489)
    {
        _1647 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1667 = _1647;
    out.m_81.x = _1659;
    out.m_83.x = _1655;
    out.m_83.y = _1657;
    out.m_83.z = _1661;
    out.m_83.w = _1643;
    bool _1669 = !_1489;
    float _1671 = _1667;
    float _1673 = _1667;
    if (!_1669)
    {
        bool _1675 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1677 = isnan(_1146);
        bool _1679 = _1675 || _1677;
        bool _1681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1683 = _1679 || _1681;
        if (!_1683)
        {
            float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1687 = _1146 + _1685;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1691 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1689;
            float _1693 = 1.0 / _1691;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1715 = _1687 * _1693;
            float _1717 = precise::clamp(_1715, 0.0, 1.0);
            float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1723 = fma(_1717, _1697, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1725 = fma(_1717, _1721, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1727 = fma(_1717, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1729 = fma(_1717, _1705, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1731 = fma(_1717, _1709, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1733 = fma(_1717, _1713, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1579 = _1725;
            _1673 = _1731;
            _1615 = _1723;
            _1601 = _1729;
            _1651 = _1727;
            _1665 = _1733;
            _1735 = true;
        }
        else
        {
            bool _1737 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1739 = isnan(_1146);
            bool _1741 = _1737 || _1739;
            bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1745 = _1741 || _1743;
            if (!_1745)
            {
                _1613 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1747 = _1613;
            _1615 = _1747;
            if (!_1745)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1749 = _1577;
            _1579 = _1749;
            if (!_1745)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1751 = _1649;
            _1651 = _1751;
            if (!_1745)
            {
                _1599 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1753 = _1599;
            _1601 = _1753;
            if (!_1745)
            {
                _1671 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1755 = _1671;
            _1673 = _1755;
            if (!_1745)
            {
                _1663 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1757 = _1663;
            bool _1759 = !_1745;
            _1665 = _1757;
            if (!_1759)
            {
                bool _1761 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1763 = isnan(_1146);
                bool _1765 = _1761 || _1763;
                bool _1767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1769 = _1765 || _1767;
                if (!_1769)
                {
                    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1773 = _1146 + _1771;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1775;
                    float _1779 = 1.0 / _1777;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1801 = _1773 * _1779;
                    float _1803 = precise::clamp(_1801, 0.0, 1.0);
                    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1809 = fma(_1803, _1783, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1811 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1813 = fma(_1803, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1815 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1817 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1819 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1579 = _1811;
                    _1673 = _1817;
                    _1615 = _1809;
                    _1601 = _1815;
                    _1651 = _1813;
                    _1665 = _1819;
                    _1735 = true;
                }
                else
                {
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1673 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1615 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1601 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1665 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1735 = false;
    float _1821 = _1579;
    float _1823 = _1673;
    float _1825 = _1615;
    float _1827 = _1601;
    float _1829 = _1651;
    float _1831 = _1665;
    float _1833 = fma(_1000, -0.5, 0.5);
    float _1835 = precise::clamp(_1833, 0.0, 1.0);
    float _1837 = -_1821;
    float _1839 = _1837 + _1823;
    float _1841 = -_1825;
    float _1843 = _1841 + _1827;
    float _1845 = -_1829;
    float _1847 = _1845 + _1831;
    bool _1849 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1851 = fma(_1835, _1839, _1821);
    float _1853 = fma(_1835, _1843, _1825);
    float _1855 = fma(_1835, _1847, _1829);
    float _1857 = _1851 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _1859 = fma(_1853, 0.298911988735198974609375, _1857);
    float _1861 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1863 = fma(_1855, 0.114477999508380889892578125, _1859);
    out.m_81.w = _1861;
    float _1865 = -_1863;
    float _1867 = _1851 + _1865;
    float _1869 = -_1863;
    float _1871 = _1853 + _1869;
    float _1873 = -_1863;
    float _1875 = _1855 + _1873;
    out.m_85.x = 0.0;
    float _1877 = fma(_1867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1879 = fma(_1871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1881 = fma(_1875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    out.m_87.x = _1879;
    out.m_87.y = _1877;
    out.m_87.z = _1881;
    if (!_1849)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1883 = -_1116;
    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1887 = -_1118;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1891 = -_1120;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1895 = _1885 * _1885;
    float _1897 = fma(_1889, _1889, _1895);
    float _1899 = fma(_1893, _1893, _1897);
    float _1901 = sqrt(_1899);
    float _1903 = rsqrt(_1899);
    float _1905 = -_1901;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = _1889 * _1903;
    float _1915 = _1885 * _1903;
    float _1917 = abs(_1911);
    float _1919 = log2(_1917);
    float _1921 = _1893 * _1903;
    float _1923 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1925 = _1000 * _1915;
    float _1927 = -_1915;
    float _1929 = -_1923;
    float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1929);
    float _1933 = fma(_998, _1913, _1925);
    float _1935 = -_1921;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1931);
    float _1939 = fma(_1022, _1921, _1933);
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1945 = _1937 + _1943;
    float _1947 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1949 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1951 = precise::clamp(_1949, 0.0, 1.0);
    float _1953 = exp2(_1947);
    float _1955 = _1953 * _1951;
    float _1957 = _1941 * _1955;
    float _1959 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1961 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1959;
    out.m_85.y = _1961;
    out.m_85.z = _1963;
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
    bool _1735 = false;
    bool _1072 = false;
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
        float _2020 = as_type<float>(_122);
        out.gl_Position.z = _2020;
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
        float _2088 = as_type<float>(_158);
        out.gl_Position.z = _2088;
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
    if (!_1032)
    {
        _1034 = 1.0;
    }
    float _1038 = _1034;
    out.m_75.x = _998;
    out.m_75.y = _1000;
    out.m_75.z = _1022;
    bool _1040 = !_1032;
    float _1042 = _1038;
    if (!_1040)
    {
        bool _1044 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1046 = isnan(_982);
        bool _1048 = _1044 || _1046;
        bool _1050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1052 = _1048 || _1050;
        if (!_1052)
        {
            float _1054 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1056 = _982 + _1054;
            float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1060 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1058;
            float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1064 = _1062 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1066 = 1.0 / _1060;
            float _1068 = _1056 * _1066;
            float _1070 = fma(_1068, _1064, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1042 = _1070;
            _1072 = true;
        }
        else
        {
            bool _1074 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1076 = isnan(_982);
            bool _1078 = _1074 || _1076;
            bool _1080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1082 = _1078 || _1080;
            if (!_1082)
            {
                float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1086 = _982 + _1084;
                float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1090 = _1088 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1096 = 1.0 / _1090;
                float _1098 = _1086 * _1096;
                float _1100 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1042 = _1100;
                _1072 = true;
            }
            else
            {
                _1042 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1072 = false;
    float _1102 = _1042;
    float _1104 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1106 = _948 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1110 = _954 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1114 = _956 + _1112;
    float _1116 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1118 = fma(_1110, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1120 = fma(_1114, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1124 = _1116 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1128 = _1118 + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1132 = _1120 + _1130;
    float _1134 = _1124 * _1124;
    float _1136 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1138 = fma(_1128, _1128, _1134);
    float _1140 = floor(_1136);
    float _1142 = fma(_1132, _1132, _1138);
    float _1144 = rsqrt(_1142);
    float _1146 = sqrt(_1142);
    float _1148 = -_1140;
    float _1150 = _1136 + _1148;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1154 = _1128 * _1152;
    float _1156 = _1132 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 * _1156;
    float _1162 = _1158 + _1160;
    float _1164 = sqrt(_1162);
    bool _1166 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1164 + _1168;
    float _1172 = _1144;
    float _1174 = _1162;
    float _1176 = _1170;
    float _1178 = _1124;
    if (_1166)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1172 = _1180;
    }
    float _1182 = _1172;
    if (_1166)
    {
        float _1184 = rsqrt(_1162);
        _1174 = _1184;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (_1166)
    {
        float _1190 = _1170 * _1182;
        _1176 = _1190;
    }
    float _1192 = _1176;
    if (_1166)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1036 = _1194;
    }
    float _1196 = _1036;
    float _1198 = _1182;
    float _1200 = _1196;
    if (_1166)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1198 = _1204;
    }
    float _1206 = _1198;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1132;
    float _1214 = _1210;
    if (_1166)
    {
        float _1216 = _1196 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1212 = _1218;
    }
    float _1220 = _1212;
    float _1222 = -_1152;
    float _1224 = -_1210;
    float _1226 = fma(_1124, _1222, _1224);
    float _1228 = _1226;
    if (_1166)
    {
        float _1230 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1230;
    }
    float _1232 = _1214;
    float _1234 = _1232;
    if (!_1166)
    {
        _1200 = _1154;
    }
    float _1236 = _1200;
    float _1238 = _1206;
    float _1240 = _1236;
    if (_1166)
    {
        float _1242 = fma(_1206, _1232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1242;
    }
    float _1244 = _1234;
    float _1246 = _1244;
    if (!_1166)
    {
        _1238 = _1156;
    }
    float _1248 = _1238;
    float _1250 = _1248;
    float _1252 = _1220;
    if (_1166)
    {
        float _1254 = _1220 + (-1.0);
        _1178 = _1254;
    }
    float _1256 = _1178;
    float _1258 = _1256;
    if (_1166)
    {
        float _1260 = _1186 * _1244;
        _1246 = _1260;
    }
    float _1262 = _1246;
    if (!_1166)
    {
        _1188 = _1160;
    }
    float _1264 = _1188;
    float _1266 = _1264;
    if (_1166)
    {
        float _1268 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1268;
    }
    float _1270 = _1258;
    if (_1166)
    {
        float _1272 = _1154 * _1262;
        _1240 = _1272;
    }
    float _1274 = _1240;
    if (_1166)
    {
        float _1276 = _1156 * _1262;
        _1250 = _1276;
    }
    float _1278 = _1250;
    float _1280 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1166)
    {
        float _1282 = fma(_1226, _1220, _1270);
        _1228 = _1282;
    }
    float _1284 = _1228;
    if (!_1166)
    {
        _1252 = _1158;
    }
    float _1286 = _1252;
    float _1288 = _1286;
    if (_1166)
    {
        float _1290 = _1274 * _1274;
        _1288 = _1290;
    }
    float _1292 = _1288;
    if (_1166)
    {
        float _1294 = _1278 * _1278;
        _1266 = _1294;
    }
    float _1296 = _1266;
    float _1298 = fma(_1284, _1284, _1292);
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = _1298 + _1296;
    float _1304 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1280);
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1308 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1306);
    float _1310 = precise::clamp(_1308, 0.0, 1.0);
    float _1312 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1314 = rsqrt(_1302);
    float _1316 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1304);
    float _1318 = -_1310;
    float _1320 = _1318 + 1.0;
    float _1322 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1326 = abs(_1320);
    float _1328 = log2(_1326);
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1332 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = -_1330;
    float _1336 = fma(_1334, _1300, 1.0);
    float _1338 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1340 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = _1314 * _1274;
    float _1344 = _1314 * _1284;
    float _1346 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1338);
    float _1348 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1352 = floor(_1312);
    float _1354 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1314 * _1278;
    float _1360 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1322);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1366 = -_1350;
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1366);
    float _1370 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1372 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1364);
    float _1376 = -_1358;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1368);
    float _1380 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1382 = exp2(_1372);
    float _1384 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1386 = fma(_1378, -0.5, 0.5);
    float _1388 = -_1352;
    float _1390 = _1312 + _1388;
    float _1392 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1394 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1384);
    float _1396 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1398 = sqrt(_1386);
    float _1400 = fma(_1378, 0.5, 0.5);
    float _1402 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1392);
    float _1404 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1396);
    float _1406 = fma(_1400, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1408 = _1344 + 1.0;
    float _1410 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1402);
    float _1412 = log2(_1336);
    float _1414 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1404);
    float _1416 = fma(_1400, _1406, -0.212114393711090087890625);
    float _1418 = -_1344;
    float _1420 = fma(_1382, _1408, _1418);
    float _1422 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1410);
    float _1424 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1414);
    float _1426 = fma(_1400, _1416, 1.570728778839111328125);
    float2 _4291 = float2(_1390, _1150);
    float _1428 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4291, float2(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4291, float2(0.0), isnan(_4291)), level(0.0)).x;
    float _1430 = 1.0 / _1394;
    float _1432 = _1398 * 0.636619746685028076171875;
    float _1434 = fma(_1420, 0.5, 0.5);
    float _1436 = -_1426;
    float _1438 = fma(_1432, _1436, 1.0);
    float _1440 = _1412 * 0.693147182464599609375;
    float _1442 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1444 = _1422 * _1430;
    float _1446 = _1424 * _1430;
    float _1448 = fma(_1444, 0.5, 0.5);
    float _1450 = fma(_1446, -0.5, 0.5);
    float3 _4331 = float3(_1448, _1450, _1442);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4331, float3(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4331, float3(0.0), isnan(_4331)), level(0.0)).x;
    float3 _4342 = float3(_1448, _1450, _1442);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4342, float3(0.0), isnan(_4342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4342, float3(0.0), isnan(_4342)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4358 = float2(_1438, _1434);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1477 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1479 = in.m_77.x;
    bool _1481 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1483 = isnan(_1146);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1475);
    float _1493 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1495 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1477);
    float _1497 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1491);
    float _1499 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1493);
    float _1501 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1495);
    float _1503 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1505 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1507 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1499);
    float _1509 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1501);
    float _1511 = 1.0 / _1505;
    float _1513 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1515 = _1509 + _1394;
    float _1517 = _1513 + _1505;
    out.gl_Position.x = _1422;
    out.gl_Position.y = _1424;
    out.gl_Position.z = _1509;
    out.gl_Position.w = _1394;
    float _1519 = _1515 * 0.5;
    float _1521 = exp2(_1503);
    float _1523 = _1517 * _1511;
    float _1525 = _1523 * 0.5;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    float _1531 = _1509;
    float _1533 = _1422;
    float _1535 = _1394;
    float _1537 = _1424;
    if (!_1489)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1539 = _1531;
    float _1541 = -_1521;
    float _1543 = _1541 + 1.0;
    float _1545 = 1.0 / _1529;
    float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1549 = _1545 * _1547;
    float _1551 = abs(_1549);
    float _1553 = log2(_1551);
    bool _1555 = _1549 <= 8000.0;
    bool _1557 = isnan(_1549);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(8000.0);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1569 = exp2(_1567);
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = _1422 + _1394;
    float _1577 = _1539;
    float _1579 = _1539;
    if (!_1489)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1581 = _1533;
    float _1583 = fma(_1573, -2.0, 3.0);
    float _1585 = _1573 * _1573;
    float _1587 = _1575 * 0.5;
    float _1589 = _1585 * _1583;
    float _1591 = -_1589;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1589);
    float _1597 = _1394 * 0.5;
    float _1599 = _1581;
    float _1601 = _1581;
    if (!_1489)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1603 = _1535;
    float _1605 = _1565 * _1595;
    float _1607 = fma(_1424, -0.5, _1597);
    float _1609 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1611 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1613 = _1603;
    float _1615 = _1603;
    if (!_1489)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1617 = _1537;
    out.m_79.x = _1587;
    out.m_79.y = _1607;
    out.m_79.z = _1519;
    out.m_79.w = _1394;
    float _1619 = -_1428;
    float _1621 = _1619 + 1.0;
    float _1623 = _1621 * _1611;
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = -_1625;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1631 = _1629 * _1479;
    float _1633 = _1609 * _1452;
    float _1635 = -_1609;
    float _1637 = _1635 + 1.0;
    float _1639 = _1463 * _1633;
    float _1641 = _1473 * _1633;
    float _1643 = _1463 * _1637;
    float _1645 = _1637;
    float _1647 = _1631;
    float _1649 = _1617;
    float _1651 = _1617;
    if (!_1489)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1653 = _1645;
    float _1655 = fma(_1469, _1639, _1457);
    float _1657 = fma(_1471, _1639, _1459);
    float _1659 = _1631 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1661 = fma(_1463, _1641, _1461);
    float _1663 = _1653;
    float _1665 = _1653;
    if (!_1489)
    {
        _1647 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1667 = _1647;
    out.m_81.x = _1659;
    out.m_83.x = _1655;
    out.m_83.y = _1657;
    out.m_83.z = _1661;
    out.m_83.w = _1643;
    bool _1669 = !_1489;
    float _1671 = _1667;
    float _1673 = _1667;
    if (!_1669)
    {
        bool _1675 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1677 = isnan(_1146);
        bool _1679 = _1675 || _1677;
        bool _1681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1683 = _1679 || _1681;
        if (!_1683)
        {
            float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1687 = _1146 + _1685;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1691 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1689;
            float _1693 = 1.0 / _1691;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1715 = _1687 * _1693;
            float _1717 = precise::clamp(_1715, 0.0, 1.0);
            float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1723 = fma(_1717, _1697, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1725 = fma(_1717, _1721, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1727 = fma(_1717, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1729 = fma(_1717, _1705, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1731 = fma(_1717, _1709, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1733 = fma(_1717, _1713, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1579 = _1725;
            _1673 = _1731;
            _1615 = _1723;
            _1601 = _1729;
            _1651 = _1727;
            _1665 = _1733;
            _1735 = true;
        }
        else
        {
            bool _1737 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1739 = isnan(_1146);
            bool _1741 = _1737 || _1739;
            bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1745 = _1741 || _1743;
            if (!_1745)
            {
                _1613 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1747 = _1613;
            _1615 = _1747;
            if (!_1745)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1749 = _1577;
            _1579 = _1749;
            if (!_1745)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1751 = _1649;
            _1651 = _1751;
            if (!_1745)
            {
                _1599 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1753 = _1599;
            _1601 = _1753;
            if (!_1745)
            {
                _1671 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1755 = _1671;
            _1673 = _1755;
            if (!_1745)
            {
                _1663 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1757 = _1663;
            bool _1759 = !_1745;
            _1665 = _1757;
            if (!_1759)
            {
                bool _1761 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1763 = isnan(_1146);
                bool _1765 = _1761 || _1763;
                bool _1767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1769 = _1765 || _1767;
                if (!_1769)
                {
                    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1773 = _1146 + _1771;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1775;
                    float _1779 = 1.0 / _1777;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1801 = _1773 * _1779;
                    float _1803 = precise::clamp(_1801, 0.0, 1.0);
                    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1809 = fma(_1803, _1783, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1811 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1813 = fma(_1803, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1815 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1817 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1819 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1579 = _1811;
                    _1673 = _1817;
                    _1615 = _1809;
                    _1601 = _1815;
                    _1651 = _1813;
                    _1665 = _1819;
                    _1735 = true;
                }
                else
                {
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1673 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1615 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1601 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1665 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1735 = false;
    float _1821 = _1579;
    float _1823 = _1673;
    float _1825 = _1615;
    float _1827 = _1601;
    float _1829 = _1651;
    float _1831 = _1665;
    float _1833 = fma(_1000, -0.5, 0.5);
    float _1835 = precise::clamp(_1833, 0.0, 1.0);
    float _1837 = -_1821;
    float _1839 = _1837 + _1823;
    float _1841 = -_1825;
    float _1843 = _1841 + _1827;
    float _1845 = -_1829;
    float _1847 = _1845 + _1831;
    bool _1849 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1851 = fma(_1835, _1839, _1821);
    float _1853 = fma(_1835, _1843, _1825);
    float _1855 = fma(_1835, _1847, _1829);
    float _1857 = _1851 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _1859 = fma(_1853, 0.298911988735198974609375, _1857);
    float _1861 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1863 = fma(_1855, 0.114477999508380889892578125, _1859);
    out.m_81.w = _1861;
    float _1865 = -_1863;
    float _1867 = _1851 + _1865;
    float _1869 = -_1863;
    float _1871 = _1853 + _1869;
    float _1873 = -_1863;
    float _1875 = _1855 + _1873;
    out.m_85.x = 0.0;
    float _1877 = fma(_1867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1879 = fma(_1871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1881 = fma(_1875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    out.m_87.x = _1879;
    out.m_87.y = _1877;
    out.m_87.z = _1881;
    if (!_1849)
    {
        return out;
    }
    float _1883 = -_1116;
    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1887 = -_1118;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1891 = -_1120;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1895 = _1885 * _1885;
    float _1897 = fma(_1889, _1889, _1895);
    float _1899 = fma(_1893, _1893, _1897);
    float _1901 = sqrt(_1899);
    float _1903 = rsqrt(_1899);
    float _1905 = -_1901;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = _1889 * _1903;
    float _1915 = _1885 * _1903;
    float _1917 = abs(_1911);
    float _1919 = log2(_1917);
    float _1921 = _1893 * _1903;
    float _1923 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1925 = _1000 * _1915;
    float _1927 = -_1915;
    float _1929 = -_1923;
    float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1929);
    float _1933 = fma(_998, _1913, _1925);
    float _1935 = -_1921;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1931);
    float _1939 = fma(_1022, _1921, _1933);
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1945 = _1937 + _1943;
    float _1947 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1949 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1951 = precise::clamp(_1949, 0.0, 1.0);
    float _1953 = exp2(_1947);
    float _1955 = _1953 * _1951;
    float _1957 = _1941 * _1955;
    float _1959 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1961 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1959;
    out.m_85.y = _1961;
    out.m_85.z = _1963;
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
    bool _1735 = false;
    bool _1072 = false;
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
        float _2020 = as_type<float>(_122);
        out.gl_Position.z = _2020;
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
        float _2088 = as_type<float>(_158);
        out.gl_Position.z = _2088;
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
    if (!_1032)
    {
        _1034 = 1.0;
    }
    float _1038 = _1034;
    out.m_75.x = _998;
    out.m_75.y = _1000;
    out.m_75.z = _1022;
    bool _1040 = !_1032;
    float _1042 = _1038;
    if (!_1040)
    {
        bool _1044 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1046 = isnan(_982);
        bool _1048 = _1044 || _1046;
        bool _1050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1052 = _1048 || _1050;
        if (!_1052)
        {
            float _1054 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1056 = _982 + _1054;
            float _1058 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1060 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1058;
            float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1064 = _1062 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1066 = 1.0 / _1060;
            float _1068 = _1056 * _1066;
            float _1070 = fma(_1068, _1064, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1042 = _1070;
            _1072 = true;
        }
        else
        {
            bool _1074 = _982 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1076 = isnan(_982);
            bool _1078 = _1074 || _1076;
            bool _1080 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1082 = _1078 || _1080;
            if (!_1082)
            {
                float _1084 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1086 = _982 + _1084;
                float _1088 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1090 = _1088 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1092 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1094 = _1092 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1096 = 1.0 / _1090;
                float _1098 = _1086 * _1096;
                float _1100 = fma(_1098, _1094, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1042 = _1100;
                _1072 = true;
            }
            else
            {
                _1042 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1072 = false;
    float _1102 = _1042;
    float _1104 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1106 = _948 + _1104;
    float _1108 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1110 = _954 + _1108;
    float _1112 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1114 = _956 + _1112;
    float _1116 = fma(_1106, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1118 = fma(_1110, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1120 = fma(_1114, _1102, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1122 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1124 = _1116 + _1122;
    float _1126 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1128 = _1118 + _1126;
    float _1130 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1132 = _1120 + _1130;
    float _1134 = _1124 * _1124;
    float _1136 = fma(_682, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1138 = fma(_1128, _1128, _1134);
    float _1140 = floor(_1136);
    float _1142 = fma(_1132, _1132, _1138);
    float _1144 = rsqrt(_1142);
    float _1146 = sqrt(_1142);
    float _1148 = -_1140;
    float _1150 = _1136 + _1148;
    float _1152 = _1144 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1154 = _1128 * _1152;
    float _1156 = _1132 * _1152;
    float _1158 = _1154 * _1154;
    float _1160 = _1156 * _1156;
    float _1162 = _1158 + _1160;
    float _1164 = sqrt(_1162);
    bool _1166 = _1164 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1168 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1170 = _1164 + _1168;
    float _1172 = _1144;
    float _1174 = _1162;
    float _1176 = _1170;
    float _1178 = _1124;
    if (_1166)
    {
        float _1180 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1172 = _1180;
    }
    float _1182 = _1172;
    if (_1166)
    {
        float _1184 = rsqrt(_1162);
        _1174 = _1184;
    }
    float _1186 = _1174;
    float _1188 = _1186;
    if (_1166)
    {
        float _1190 = _1170 * _1182;
        _1176 = _1190;
    }
    float _1192 = _1176;
    if (_1166)
    {
        float _1194 = _1192 * 0.15915493667125701904296875;
        _1036 = _1194;
    }
    float _1196 = _1036;
    float _1198 = _1182;
    float _1200 = _1196;
    if (_1166)
    {
        float _1202 = _1196 * 6.283185482025146484375;
        float _1204 = sin(_1202);
        _1198 = _1204;
    }
    float _1206 = _1198;
    float _1208 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1210 = precise::max(0.0, _1208);
    float _1212 = _1132;
    float _1214 = _1210;
    if (_1166)
    {
        float _1216 = _1196 * 6.283185482025146484375;
        float _1218 = cos(_1216);
        _1212 = _1218;
    }
    float _1220 = _1212;
    float _1222 = -_1152;
    float _1224 = -_1210;
    float _1226 = fma(_1124, _1222, _1224);
    float _1228 = _1226;
    if (_1166)
    {
        float _1230 = _1226 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1214 = _1230;
    }
    float _1232 = _1214;
    float _1234 = _1232;
    if (!_1166)
    {
        _1200 = _1154;
    }
    float _1236 = _1200;
    float _1238 = _1206;
    float _1240 = _1236;
    if (_1166)
    {
        float _1242 = fma(_1206, _1232, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1234 = _1242;
    }
    float _1244 = _1234;
    float _1246 = _1244;
    if (!_1166)
    {
        _1238 = _1156;
    }
    float _1248 = _1238;
    float _1250 = _1248;
    float _1252 = _1220;
    if (_1166)
    {
        float _1254 = _1220 + (-1.0);
        _1178 = _1254;
    }
    float _1256 = _1178;
    float _1258 = _1256;
    if (_1166)
    {
        float _1260 = _1186 * _1244;
        _1246 = _1260;
    }
    float _1262 = _1246;
    if (!_1166)
    {
        _1188 = _1160;
    }
    float _1264 = _1188;
    float _1266 = _1264;
    if (_1166)
    {
        float _1268 = _1256 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1258 = _1268;
    }
    float _1270 = _1258;
    if (_1166)
    {
        float _1272 = _1154 * _1262;
        _1240 = _1272;
    }
    float _1274 = _1240;
    if (_1166)
    {
        float _1276 = _1156 * _1262;
        _1250 = _1276;
    }
    float _1278 = _1250;
    float _1280 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1166)
    {
        float _1282 = fma(_1226, _1220, _1270);
        _1228 = _1282;
    }
    float _1284 = _1228;
    if (!_1166)
    {
        _1252 = _1158;
    }
    float _1286 = _1252;
    float _1288 = _1286;
    if (_1166)
    {
        float _1290 = _1274 * _1274;
        _1288 = _1290;
    }
    float _1292 = _1288;
    if (_1166)
    {
        float _1294 = _1278 * _1278;
        _1266 = _1294;
    }
    float _1296 = _1266;
    float _1298 = fma(_1284, _1284, _1292);
    float _1300 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1302 = _1298 + _1296;
    float _1304 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1280);
    float _1306 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1308 = fma(_1146, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1306);
    float _1310 = precise::clamp(_1308, 0.0, 1.0);
    float _1312 = fma(_670, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1314 = rsqrt(_1302);
    float _1316 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1304);
    float _1318 = -_1310;
    float _1320 = _1318 + 1.0;
    float _1322 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1324 = _1316 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1326 = abs(_1320);
    float _1328 = log2(_1326);
    float _1330 = _1324 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1332 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1334 = -_1330;
    float _1336 = fma(_1334, _1300, 1.0);
    float _1338 = _1116 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1340 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1332);
    float _1342 = _1314 * _1274;
    float _1344 = _1314 * _1284;
    float _1346 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1338);
    float _1348 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1340);
    float _1350 = _1342 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1352 = floor(_1312);
    float _1354 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1346);
    float _1356 = _1348 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1358 = _1314 * _1278;
    float _1360 = fma(_1118, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1322);
    float _1362 = _1354 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1364 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1366 = -_1350;
    float _1368 = fma(_1344, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1366);
    float _1370 = fma(_1120, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1360);
    float _1372 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1374 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1364);
    float _1376 = -_1358;
    float _1378 = fma(_1376, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1368);
    float _1380 = _1370 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1382 = exp2(_1372);
    float _1384 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1374);
    float _1386 = fma(_1378, -0.5, 0.5);
    float _1388 = -_1352;
    float _1390 = _1312 + _1388;
    float _1392 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1394 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1384);
    float _1396 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1398 = sqrt(_1386);
    float _1400 = fma(_1378, 0.5, 0.5);
    float _1402 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1392);
    float _1404 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1396);
    float _1406 = fma(_1400, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1408 = _1344 + 1.0;
    float _1410 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1402);
    float _1412 = log2(_1336);
    float _1414 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1404);
    float _1416 = fma(_1400, _1406, -0.212114393711090087890625);
    float _1418 = -_1344;
    float _1420 = fma(_1382, _1408, _1418);
    float _1422 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1410);
    float _1424 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1414);
    float _1426 = fma(_1400, _1416, 1.570728778839111328125);
    float2 _4291 = float2(_1390, _1150);
    float _1428 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4291, float2(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4291, float2(0.0), isnan(_4291)), level(0.0)).x;
    float _1430 = 1.0 / _1394;
    float _1432 = _1398 * 0.636619746685028076171875;
    float _1434 = fma(_1420, 0.5, 0.5);
    float _1436 = -_1426;
    float _1438 = fma(_1432, _1436, 1.0);
    float _1440 = _1412 * 0.693147182464599609375;
    float _1442 = _1440 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1444 = _1422 * _1430;
    float _1446 = _1424 * _1430;
    float _1448 = fma(_1444, 0.5, 0.5);
    float _1450 = fma(_1446, -0.5, 0.5);
    float3 _4331 = float3(_1448, _1450, _1442);
    float _1452 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4331, float3(0.0), isnan(_4331)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4331, float3(0.0), isnan(_4331)), level(0.0)).x;
    float3 _4342 = float3(_1448, _1450, _1442);
    float4 _1455 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4342, float3(0.0), isnan(_4342)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4342, float3(0.0), isnan(_4342)), level(0.0)).xyzw;
    float _1457 = _1455.x;
    float _1459 = _1455.y;
    float _1461 = _1455.z;
    float _1463 = _1455.w;
    float2 _4358 = float2(_1438, _1434);
    float3 _1467 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4358, float2(0.0), isnan(_4358)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4358, float2(0.0), isnan(_4358)), level(0.0)).xyz;
    float _1469 = _1467.x;
    float _1471 = _1467.y;
    float _1473 = _1467.z;
    float _1475 = _844 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1477 = _1356 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1479 = in.m_77.x;
    bool _1481 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1483 = isnan(_1146);
    bool _1485 = _1481 || _1483;
    bool _1487 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1489 = _1485 || _1487;
    float _1491 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1475);
    float _1493 = _844 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1495 = fma(_1362, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1477);
    float _1497 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1491);
    float _1499 = fma(_670, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1493);
    float _1501 = fma(_1324, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1495);
    float _1503 = _1328 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1505 = _1497 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1507 = fma(_682, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1499);
    float _1509 = fma(_1380, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1501);
    float _1511 = 1.0 / _1505;
    float _1513 = _1507 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1515 = _1509 + _1394;
    float _1517 = _1513 + _1505;
    out.gl_Position.x = _1422;
    out.gl_Position.y = _1424;
    out.gl_Position.z = _1509;
    out.gl_Position.w = _1394;
    float _1519 = _1515 * 0.5;
    float _1521 = exp2(_1503);
    float _1523 = _1517 * _1511;
    float _1525 = _1523 * 0.5;
    float _1527 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1529 = fma(_1525, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1527);
    float _1531 = _1509;
    float _1533 = _1422;
    float _1535 = _1394;
    float _1537 = _1424;
    if (!_1489)
    {
        _1531 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1539 = _1531;
    float _1541 = -_1521;
    float _1543 = _1541 + 1.0;
    float _1545 = 1.0 / _1529;
    float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1549 = _1545 * _1547;
    float _1551 = abs(_1549);
    float _1553 = log2(_1551);
    bool _1555 = _1549 <= 8000.0;
    bool _1557 = isnan(_1549);
    bool _1559 = _1555 || _1557;
    bool _1561 = isnan(8000.0);
    bool _1563 = _1559 || _1561;
    float _1565 = float(_1563);
    float _1567 = _1553 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1569 = exp2(_1567);
    float _1571 = fma(_1569, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1573 = precise::clamp(_1571, 0.0, 1.0);
    float _1575 = _1422 + _1394;
    float _1577 = _1539;
    float _1579 = _1539;
    if (!_1489)
    {
        _1533 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1581 = _1533;
    float _1583 = fma(_1573, -2.0, 3.0);
    float _1585 = _1573 * _1573;
    float _1587 = _1575 * 0.5;
    float _1589 = _1585 * _1583;
    float _1591 = -_1589;
    float _1593 = _1591 + 1.0;
    float _1595 = fma(_1593, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1589);
    float _1597 = _1394 * 0.5;
    float _1599 = _1581;
    float _1601 = _1581;
    if (!_1489)
    {
        _1535 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1603 = _1535;
    float _1605 = _1565 * _1595;
    float _1607 = fma(_1424, -0.5, _1597);
    float _1609 = _1543 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1611 = _1605 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1613 = _1603;
    float _1615 = _1603;
    if (!_1489)
    {
        _1537 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1617 = _1537;
    out.m_79.x = _1587;
    out.m_79.y = _1607;
    out.m_79.z = _1519;
    out.m_79.w = _1394;
    float _1619 = -_1428;
    float _1621 = _1619 + 1.0;
    float _1623 = _1621 * _1611;
    float _1625 = precise::clamp(_1623, 0.0, 1.0);
    float _1627 = -_1625;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1631 = _1629 * _1479;
    float _1633 = _1609 * _1452;
    float _1635 = -_1609;
    float _1637 = _1635 + 1.0;
    float _1639 = _1463 * _1633;
    float _1641 = _1473 * _1633;
    float _1643 = _1463 * _1637;
    float _1645 = _1637;
    float _1647 = _1631;
    float _1649 = _1617;
    float _1651 = _1617;
    if (!_1489)
    {
        _1645 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1653 = _1645;
    float _1655 = fma(_1469, _1639, _1457);
    float _1657 = fma(_1471, _1639, _1459);
    float _1659 = _1631 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1661 = fma(_1463, _1641, _1461);
    float _1663 = _1653;
    float _1665 = _1653;
    if (!_1489)
    {
        _1647 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1667 = _1647;
    out.m_81.x = _1659;
    out.m_83.x = _1655;
    out.m_83.y = _1657;
    out.m_83.z = _1661;
    out.m_83.w = _1643;
    bool _1669 = !_1489;
    float _1671 = _1667;
    float _1673 = _1667;
    if (!_1669)
    {
        bool _1675 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1677 = isnan(_1146);
        bool _1679 = _1675 || _1677;
        bool _1681 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1683 = _1679 || _1681;
        if (!_1683)
        {
            float _1685 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1687 = _1146 + _1685;
            float _1689 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1691 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1689;
            float _1693 = 1.0 / _1691;
            float _1695 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1697 = _1695 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1699 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _1701 = _1699 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _1703 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1705 = _1703 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1707 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1709 = _1707 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1711 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1713 = _1711 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1715 = _1687 * _1693;
            float _1717 = precise::clamp(_1715, 0.0, 1.0);
            float _1719 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1721 = _1719 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1723 = fma(_1717, _1697, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _1725 = fma(_1717, _1721, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _1727 = fma(_1717, _1701, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _1729 = fma(_1717, _1705, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _1731 = fma(_1717, _1709, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _1733 = fma(_1717, _1713, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _1579 = _1725;
            _1673 = _1731;
            _1615 = _1723;
            _1601 = _1729;
            _1651 = _1727;
            _1665 = _1733;
            _1735 = true;
        }
        else
        {
            bool _1737 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _1739 = isnan(_1146);
            bool _1741 = _1737 || _1739;
            bool _1743 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _1745 = _1741 || _1743;
            if (!_1745)
            {
                _1613 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _1747 = _1613;
            _1615 = _1747;
            if (!_1745)
            {
                _1577 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _1749 = _1577;
            _1579 = _1749;
            if (!_1745)
            {
                _1649 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _1751 = _1649;
            _1651 = _1751;
            if (!_1745)
            {
                _1599 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _1753 = _1599;
            _1601 = _1753;
            if (!_1745)
            {
                _1671 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _1755 = _1671;
            _1673 = _1755;
            if (!_1745)
            {
                _1663 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _1757 = _1663;
            bool _1759 = !_1745;
            _1665 = _1757;
            if (!_1759)
            {
                bool _1761 = _1146 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _1763 = isnan(_1146);
                bool _1765 = _1761 || _1763;
                bool _1767 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _1769 = _1765 || _1767;
                if (!_1769)
                {
                    float _1771 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1773 = _1146 + _1771;
                    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _1777 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _1775;
                    float _1779 = 1.0 / _1777;
                    float _1781 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _1783 = _1781 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _1785 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _1787 = _1785 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _1789 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _1791 = _1789 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _1793 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _1795 = _1793 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _1797 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _1799 = _1797 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _1801 = _1773 * _1779;
                    float _1803 = precise::clamp(_1801, 0.0, 1.0);
                    float _1805 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _1807 = _1805 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _1809 = fma(_1803, _1783, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _1811 = fma(_1803, _1807, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _1813 = fma(_1803, _1787, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _1815 = fma(_1803, _1791, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _1817 = fma(_1803, _1795, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _1819 = fma(_1803, _1799, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _1579 = _1811;
                    _1673 = _1817;
                    _1615 = _1809;
                    _1601 = _1815;
                    _1651 = _1813;
                    _1665 = _1819;
                    _1735 = true;
                }
                else
                {
                    _1579 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1673 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1615 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1601 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1651 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1665 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _1735 = false;
    float _1821 = _1579;
    float _1823 = _1673;
    float _1825 = _1615;
    float _1827 = _1601;
    float _1829 = _1651;
    float _1831 = _1665;
    float _1833 = fma(_1000, -0.5, 0.5);
    float _1835 = precise::clamp(_1833, 0.0, 1.0);
    float _1837 = -_1821;
    float _1839 = _1837 + _1823;
    float _1841 = -_1825;
    float _1843 = _1841 + _1827;
    float _1845 = -_1829;
    float _1847 = _1845 + _1831;
    bool _1849 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1851 = fma(_1835, _1839, _1821);
    float _1853 = fma(_1835, _1843, _1825);
    float _1855 = fma(_1835, _1847, _1829);
    float _1857 = _1851 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _1859 = fma(_1853, 0.298911988735198974609375, _1857);
    float _1861 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1863 = fma(_1855, 0.114477999508380889892578125, _1859);
    out.m_81.w = _1861;
    float _1865 = -_1863;
    float _1867 = _1851 + _1865;
    float _1869 = -_1863;
    float _1871 = _1853 + _1869;
    float _1873 = -_1863;
    float _1875 = _1855 + _1873;
    out.m_85.x = 0.0;
    float _1877 = fma(_1867, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1879 = fma(_1871, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    float _1881 = fma(_1875, (*spvDescriptorSet0.vp_c13)._m0[1].z, _1863);
    out.m_87.x = _1879;
    out.m_87.y = _1877;
    out.m_87.z = _1881;
    if (!_1849)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1883 = -_1116;
    float _1885 = _1883 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _1887 = -_1118;
    float _1889 = _1887 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _1891 = -_1120;
    float _1893 = _1891 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _1895 = _1885 * _1885;
    float _1897 = fma(_1889, _1889, _1895);
    float _1899 = fma(_1893, _1893, _1897);
    float _1901 = sqrt(_1899);
    float _1903 = rsqrt(_1899);
    float _1905 = -_1901;
    float _1907 = _1905 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _1909 = _1907 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _1911 = precise::clamp(_1909, 0.0, 1.0);
    float _1913 = _1889 * _1903;
    float _1915 = _1885 * _1903;
    float _1917 = abs(_1911);
    float _1919 = log2(_1917);
    float _1921 = _1893 * _1903;
    float _1923 = _1913 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _1925 = _1000 * _1915;
    float _1927 = -_1915;
    float _1929 = -_1923;
    float _1931 = fma(_1927, (*spvDescriptorSet0.vp_c15)._m0[656].y, _1929);
    float _1933 = fma(_998, _1913, _1925);
    float _1935 = -_1921;
    float _1937 = fma(_1935, (*spvDescriptorSet0.vp_c15)._m0[656].z, _1931);
    float _1939 = fma(_1022, _1921, _1933);
    float _1941 = precise::clamp(_1939, 0.0, 1.0);
    float _1943 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _1945 = _1937 + _1943;
    float _1947 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _1949 = _1945 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _1951 = precise::clamp(_1949, 0.0, 1.0);
    float _1953 = exp2(_1947);
    float _1955 = _1953 * _1951;
    float _1957 = _1941 * _1955;
    float _1959 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _1961 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _1963 = _1957 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_85.x = _1959;
    out.m_85.y = _1961;
    out.m_85.z = _1963;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

