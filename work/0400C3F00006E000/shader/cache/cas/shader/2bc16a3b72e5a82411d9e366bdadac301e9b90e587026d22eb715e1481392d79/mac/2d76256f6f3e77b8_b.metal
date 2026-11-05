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
    float4 m_73 [[user(locn1)]];
    float4 m_79 [[user(locn2)]];
    float4 m_91 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_75 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_51 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_89 [[user(locn9)]];
    float4 m_85 [[user(locn10)]];
    float4 m_87 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_81 [[attribute(0)]];
    float4 m_65 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_67 [[attribute(4)]];
    float4 m_61 [[attribute(5)]];
    float4 m_55 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_63 [[attribute(9)]];
    float4 m_69 [[attribute(10)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2515 = false;
    bool _1704 = false;
    bool _628 = false;
    bool _404 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2814 = as_type<float>(_126);
        out.gl_Position.z = _2814;
    }
    if (!_114)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _118;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    int _156 = 0;
    if (_150)
    {
        float _158 = _154 * 5.0;
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_160);
        out.gl_Position.z = _2878;
    }
    if (_150)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _130;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _134 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _190 + _196;
    bool _200 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _190 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _214;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _226;
    float _234 = 1.0 / _222;
    float _236 = _194 * _228;
    bool _238 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_190);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_210;
    float _252 = _250 + 1.0;
    float _254 = _248 * _252;
    float _256 = _198 * _232;
    bool _258 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_190);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    bool _274 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_190);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -_248;
    float _292 = _290 + 1.0;
    float _294 = -_268;
    float _296 = _294 + 1.0;
    float _298 = _218 * _234;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    float _308 = _284 * _296;
    float _310 = fma(_272, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _314 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = _268 * _292;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _322 = _312 * _308;
    float _324 = _314 * _308;
    float _326 = _310 * _308;
    float _328 = -_284;
    float _330 = _328 + 1.0;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _336 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _338 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].y, _322);
    float _340 = fma(_288, _256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _344;
    float _348 = fma(_334, _256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = fma(_320, _256, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = fma(_340, _316, _336);
    float _362 = fma(_346, _236, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _364 = fma(_354, _236, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _366 = fma(_358, _236, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _368 = fma(_348, _316, _338);
    float _370 = fma(_350, _316, _342);
    float _372 = fma(_362, _254, _360);
    float _374 = fma(_364, _254, _368);
    float _376 = fma(_366, _254, _370);
    float _378 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].x, _372);
    float _380 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].y, _374);
    float _382 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].z, _376);
    bool _384 = !_230;
    float _402;
    if (!_384)
    {
        float _386 = in.m_55.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        _402 = _166;
    }
    _404 = false;
    float _406 = _402;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _410 = _406 + _408;
    float _412 = in.m_57.x;
    float _414 = in.m_57.y;
    float _416 = in.m_57.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _430 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _432 = isnan(_406);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = 1.0 / _420;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _462 = 1.0 / _428;
    float _464 = _424 * _442;
    bool _466 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _446;
    float _480 = -_440;
    float _482 = _480 + 1.0;
    float _484 = fma(_464, _410, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _490 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _492 = isnan(_406);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -_476;
    float _504 = _502 + 1.0;
    float _506 = _476 * _482;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = 1.0 / _488;
    float _514 = -_500;
    float _516 = _514 + 1.0;
    float _518 = _458 * _504;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _520;
    float _524 = _510 * _462;
    float _526 = _440 * _516;
    float _528 = _484 * _518;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _406 + _530;
    float _534 = -_458;
    float _536 = _534 + 1.0;
    bool _538 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _540 = isnan(_406);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _522 * _478;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _406 + _556;
    float _560 = fma(_524, _532, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[115].x, _528);
    float _564 = -_548;
    float _566 = _564 + 1.0;
    float _568 = _554 * _512;
    float _570 = fma(_550, _558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _574 = _406 + _572;
    float _576 = fma(_560, _506, _562);
    float _578 = _500 * _566;
    float _580 = fma(_568, _574, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _582 = fma(_570, _526, _576);
    float _584 = _382 * _416;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = fma(_580, _578, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[119].x, _588);
    float _596 = _380 * _414;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _604 = _378 * _412;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _592;
    out.m_59.y = _600;
    out.m_59.z = _606;
    out.m_59.w = _602;
    bool _608 = !_460;
    float _626;
    if (!_608)
    {
        float _610 = in.m_55.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        _626 = _166;
    }
    _628 = false;
    float _630 = _626;
    float _632 = in.m_55.x;
    float _634 = in.m_55.y;
    float _636 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _638 = log2(_636);
    float _640 = in.m_55.z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _644 = _642 != 0;
    float _646 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _650 = in.m_55.w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _664 = _662 != 0;
    float _666 = in.m_61.y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _670 = _638 * _134;
    float _672 = in.m_63.x;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _676 = _632 * 2.0;
    float _678 = _634 * 2.0;
    float _680 = _634 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = _632 + (-0.5);
    float _684 = _640 * 2.0;
    float _686 = exp2(_670);
    float _688 = fma(_680, -2.0, _652);
    float _690 = _652;
    float _692 = _648;
    bool _694 = _660;
    if (!_644)
    {
        _690 = _634;
    }
    float _696 = _690;
    float _698 = _696;
    if (_644)
    {
        _698 = _632;
    }
    float _700 = _698;
    float _702 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _688);
    float _704 = floor(_684);
    float _706 = _674 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _710 = floor(_676);
    float _712 = _632 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = -_686;
    float _716 = _714 + 1.0;
    float _718 = -_648;
    float _720 = fma(_712, 2.0, _718);
    float _722 = _712;
    if (!_644)
    {
        _722 = _640;
    }
    float _724 = _722;
    float _726 = floor(_678);
    bool _728 = _704 > 0.0;
    float _730 = -_134;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[76].x, _720);
    bool _734 = _704 >= 0.0;
    bool _736 = isnan(_704);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = _724;
    if (!_644)
    {
        _692 = _640;
    }
    float _746 = _692;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _750 = _710 >= 0.0;
    bool _752 = isnan(_710);
    bool _754 = _750 || _752;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    float _760 = _746;
    if (_644)
    {
        _744 = _634;
    }
    float _762 = _744;
    if (_644)
    {
        _760 = _634;
    }
    float _764 = _760;
    bool _766 = _710 > 0.0;
    float _768 = _762 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _770 = _742 ? 0 : 1;
    float _772 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[83].w, _668);
    int _774 = _758 ? 0 : 1;
    bool _776 = _726 > 0.0;
    float _778 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _772);
    bool _780 = _726 >= 0.0;
    bool _782 = isnan(_726);
    bool _784 = _780 || _782;
    bool _786 = isnan(0.0);
    bool _788 = _784 || _786;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _792 = _788 ? 0 : 1;
    float _794 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].z, _790);
    float _796 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _800 = ~_770;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = -_708;
    float _808 = fma(_796, 2.0, _806);
    float _810 = fma(_768, -2.0, _798);
    int _812 = ~_792;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _810);
    int _820 = _804;
    int _822 = _816;
    if (!_728)
    {
        int _824 = ~_770;
        int _826 = _824 + 1;
        _820 = _826;
    }
    int _828 = _820;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_776)
    {
        int _832 = ~_792;
        int _834 = _832 + 1;
        _822 = _834;
    }
    int _836 = _822;
    float _838 = _134 * 0.1500000059604644775390625;
    bool _840 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(1.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[78].z, _830);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _854 = 1.0 + _852;
    float _856 = in.m_48.x;
    float _858 = in.m_48.y;
    float _860 = in.m_48.z;
    int _862 = ~_774;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _850);
    int _870 = _866;
    if (!_766)
    {
        int _872 = ~_774;
        int _874 = _872 + 1;
        _870 = _874;
    }
    int _876 = _870;
    float _878 = 1.0 / _854;
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _892 = _890 != 0;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _896 = _888 ? _716 : 0.0;
    float _898 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _794);
    float _900 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[78].w, _894);
    float _902 = _166 * _166;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _906 = _904 != 0;
    float _908 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _900);
    float _910 = -_134;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _808);
    float _914 = _908;
    if (_848)
    {
        float _916 = _896 * _878;
        _152 = _916;
    }
    float _918 = _152;
    float _920 = _166 * _902;
    bool _922 = !_656;
    int _924 = _922 ? 0 : 1;
    float _926 = _858 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _928 = _650 > 0.5;
    float _930 = fma(_166, -0.699999988079071044921875, 1.0);
    float _932 = _858 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _934 = _858 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _936 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[5].x, _926);
    float _938 = _634 + _640;
    float _940 = in.m_63.y;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _944 = _942 != 0;
    float _946 = _634 + _632;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _950 = _948 != 0;
    float _952 = _938 + (-1.0);
    int _954 = abs(_924);
    float _956 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[4].x, _932);
    float _958 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[6].x, _934);
    float _960 = _946 + (-1.0);
    float _962 = float(_828);
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _966 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[5].z, _936);
    bool _968 = !_660;
    int _970 = _968 ? 0 : 1;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _974 = float(_954);
    float _976 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[4].z, _956);
    bool _978 = !_664;
    int _980 = _978 ? 0 : 1;
    float _982 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[6].z, _958);
    int _984 = abs(_970);
    float _986 = _974 * _962;
    int _988 = abs(_980);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _992 = in.m_65.x;
    float _994 = in.m_65.y;
    float _996 = in.m_65.z;
    float _998 = float(_984);
    float _1000 = _986 * (-2.0);
    float _1002 = float(_876);
    float _1004 = float(_988);
    float _1006 = fma(_972, _1000, _972);
    float _1008 = float(_836);
    float _1010 = _998 * _1002;
    float _1012 = fma(_940, 13.0, _838);
    float _1014 = _1004 * _1008;
    float _1016 = fma(_632, 6.283185482025146484375, _1012);
    float _1018 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1024 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1026 = _1016 * 0.15915493667125701904296875;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1030 = _1018 + _1028;
    float _1032 = _982 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1036 = _1024 + _1034;
    float _1038 = _1030 * _1030;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1042 = _1032 + _1040;
    float _1044 = fma(_1000, _992, _992);
    float _1046 = _1010 * (-2.0);
    float _1048 = fma(_1036, _1036, _1038);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1054 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1044);
    float _1056 = fma(_964, _1046, _964);
    float _1058 = fma(_1042, _1042, _1048);
    float _1060 = fma(_1006, _918, _1054);
    float _1062 = 1.0 / _1052;
    float _1064 = _632 + _640;
    bool _1066 = _634 > 0.5;
    float _1068 = _1060 * 0.15915493667125701904296875;
    float _1070 = fma(_1046, _994, _994);
    float _1072 = _634 + (-0.5);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1074;
    float _1078 = rsqrt(_1058);
    float _1080 = _1064 + (-1.0);
    float _1082 = _1014 * (-2.0);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1070);
    bool _1086 = _1066;
    float _1088 = _990;
    if (_892)
    {
        bool _1090 = _640 > 0.5;
        _694 = _1090;
    }
    bool _1092 = _694;
    float _1094 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1096 = fma(_1082, _996, _996);
    float _1098 = fma(_1056, _918, _1084);
    float _1100 = 1.0 / _1022;
    float _1102 = _1076 * _1062;
    float _1104 = _640 + (-0.5);
    float _1106 = fma(_1094, _1082, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1112 = _1062;
    if (_906)
    {
        float _1114 = in.m_55.x;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1096);
    float _1120 = _1098 * 0.15915493667125701904296875;
    float _1122 = _1030 * _1078;
    float _1124 = _1036 * _1078;
    float _1126 = fma(_1106, _918, _1118);
    float _1128 = -_940;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1122;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1136 = -_1124;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1140 = _1126 * 0.15915493667125701904296875;
    float _1142 = _1026 * 6.283185482025146484375;
    float _1144 = sin(_1142);
    float _1146 = _1110 * _1100;
    float _1148 = _1134 * _1134;
    float _1150 = _1042 * _1078;
    float _1152 = in.m_61.z;
    float _1154 = fma(_1138, _1138, _1148);
    float _1156 = -_1150;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1160 = _1066 ? _1130 : _940;
    float _1162 = _1068 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    int _1166 = _928 ? as_type<int>(_1130) : as_type<int>(_940);
    float _1168 = fma(_1158, _1158, _1154);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1172 = _630 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1176 = _630 + _1174;
    float _1178 = _950 ? as_type<float>(_1166) : _940;
    float _1180 = _1160;
    float _1182 = _1150;
    if (_906)
    {
        bool _1184 = _1116 > 0.5;
        _1086 = _1184;
    }
    bool _1186 = _1086;
    float _1188 = _1068 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = fma(_1102, _1176, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1194 = _990 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1196 = _1120 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _944 ? _1160 : _940;
    float _1202 = fma(_1146, _1172, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1204 = _920 * 0.100000001490116119384765625;
    float _1206 = in.m_61.x;
    if (!_906)
    {
        _1180 = _672;
    }
    float _1208 = _1180;
    float _1210 = fma(_1194, _1200, -0.5);
    float _1212 = _1144 * _1204;
    float _1214 = _1120 * 6.283185482025146484375;
    float _1216 = cos(_1214);
    float _1218 = _1208;
    if (!_906)
    {
        _1088 = _1208;
    }
    float _1220 = _1088;
    float _1222 = -_702;
    float _1224 = fma(_908, _1210, _1222);
    float _1226 = fma(_930, _666, _1212);
    bool _1228 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1230 = isnan(_630);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1220;
    if (_906)
    {
        _1218 = _672;
    }
    float _1242 = _1218;
    float _1244 = _1140 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1190 * _1198;
    bool _1250 = _1226 != 0.0;
    bool _1252 = isnan(_1226);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    int _1260 = 0;
    if (_906)
    {
        float _1262 = -_1242;
        float _1264 = _1262 + 1.0;
        _1260 = as_type<int>(_1264);
    }
    int _1266 = _1260;
    int _1268 = 0;
    if (_892)
    {
        float _1270 = -_1242;
        float _1272 = _1270 + 1.0;
        _1268 = as_type<int>(_1272);
    }
    int _1274 = _1268;
    float _1276 = 0.0;
    if (!_892)
    {
        _1276 = _1242;
    }
    float _1278 = _1276;
    float _1280 = sqrt(_1168);
    float _1282 = _1190 * _1216;
    float _1284 = _1164 * _1216;
    float _1286 = _1278;
    if (_906)
    {
        float _1288 = _1186 ? as_type<float>(_1266) : _1242;
        _1240 = _1288;
    }
    float _1290 = _1240;
    if (_892)
    {
        float _1292 = _1092 ? as_type<float>(_1274) : _1242;
        _1286 = _1292;
    }
    float _1294 = _1286;
    bool _1296 = _1206 == 0.0;
    bool _1298 = !_1258;
    bool _1300 = _1296 && _1298;
    float _1302 = _1140 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = _1216 * _1246;
    float _1308 = _1190 * _1246;
    float _1310 = _1198 * _1246;
    bool _1312 = _1152 == 0.0;
    bool _1314 = _1312 && _1300;
    float _1316 = fma(_706, _1290, -0.5);
    float _1318 = _1078 * _1280;
    float _1320 = _1164 * _1198;
    float _1322 = _1164 * _1246;
    float _1324 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1326 = _1318 * _646;
    float _1328 = fma(_1304, _1282, _1320);
    float _1330 = fma(_1304, _1320, _1282);
    float _1332 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1226);
    float _1336 = _1318 * _1324;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1206);
    float _1340 = _1318 * _1332;
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1344 = _1334 * _1336;
    float _1346 = -_1248;
    float _1348 = fma(_1304, _1284, _1346);
    float _1350 = _1338 * _1340;
    float _1352 = _1342 * _1326;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1356 = _1308 * _1344;
    float _1358 = -_1344;
    float _1360 = _1304 * _1358;
    float _1362 = _1322 * _1344;
    float _1364 = -_1284;
    float _1366 = fma(_1304, _1248, _1364);
    float _1368 = fma(_1328, _1350, _1356);
    float _1370 = fma(_1306, _1350, _1360);
    float _1372 = fma(_1348, _1350, _1362);
    bool _1374 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1376 = isnan(_630);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1238;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1366, _1352, _1368);
    float _1392 = fma(_1310, _1352, _1370);
    float _1394 = fma(_1330, _1352, _1372);
    float _1396 = _1384 * _1388;
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1400 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1402 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1404 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1406 = isnan(_630);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1398);
    float _1418 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1400);
    float _1420 = fma(_1402, _1178, -0.5);
    float _1422 = -_1384;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1416);
    float _1428 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1418);
    float _1430 = -_818;
    float _1432 = fma(_778, _1420, _1430);
    float _1434 = _1414 * _1424;
    float _1436 = _1024 + _1426;
    float _1438 = _1032 + _1428;
    float _1440 = fma(_868, _1316, _732);
    float _1442 = _1192 * _1434;
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1446 = _1436 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1438 + _1448;
    float _1452 = in.m_67.x;
    float _1454 = in.m_67.y;
    float _1456 = in.m_67.z;
    float _1458 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1460 = _1446 * _1446;
    float _1462 = _1450 * _1450;
    float _1464 = -_1414;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1458);
    float _1470 = _1460 + _1462;
    float _1472 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1442);
    float _1474 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1468);
    float _1476 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1478 = sqrt(_1470);
    float _1480 = fma(_1202, _1396, _1472);
    float _1482 = _1018 + _1474;
    float _1484 = fma(_1476, _1294, -0.5);
    float _1486 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1480);
    float _1488 = fma(_898, _1484, _912);
    float _1490 = _1454;
    float _1492 = _1452;
    float _1494 = _1456;
    float _1496 = _1460;
    float _1498 = _1462;
    float _1500 = _1436;
    float _1502 = _1438;
    float _1504 = _1488;
    float _1506 = _1318;
    float _1508 = _1390;
    if (!_1314)
    {
        float _1510 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1454);
        _1490 = _1510;
    }
    float _1512 = _1490;
    if (!_1314)
    {
        float _1514 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1452);
        _1492 = _1514;
    }
    float _1516 = _1492;
    if (!_1314)
    {
        float _1518 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1456);
        _1494 = _1518;
    }
    float _1520 = _1494;
    bool _1522 = _1478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = -_1512;
    float _1526 = _1304 * _1524;
    float _1528 = _1308 * _1512;
    float _1530 = _1322 * _1512;
    float _1532 = fma(_1306, _1516, _1526);
    float _1534 = fma(_1328, _1516, _1528);
    float _1536 = fma(_1348, _1516, _1530);
    float _1538 = fma(_1310, _1520, _1532);
    float _1540 = fma(_1366, _1520, _1534);
    float _1542 = fma(_1330, _1520, _1536);
    if (!_1522)
    {
        _914 = _1482;
    }
    float _1544 = _914;
    bool _1546 = !_1522;
    float _1548 = _1544;
    if (!_1546)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1554 = _1478 + _1552;
        float _1556 = rsqrt(_1470);
        float _1558 = _1554 * _1550;
        float _1560 = _1482 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1562 = _1558 * 0.15915493667125701904296875;
        float _1564 = _1562 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = _1562 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = fma(_1566, _1560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1574 = _1556 * _1572;
        float _1576 = _1570 + (-1.0);
        float _1578 = fma(_1446, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1580 = fma(_1450, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1582 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1586 = _1578 + _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1590 = _1580 + _1588;
        float _1592 = fma(_1482, _1570, _1582);
        float _1594 = _1586 * _1586;
        float _1596 = _1590 * _1590;
        _1548 = _1592;
        _1496 = _1594;
        _1498 = _1596;
        _1500 = _1578;
        _1502 = _1580;
    }
    float _1598 = _1548;
    float _1600 = _1496;
    float _1602 = _1498;
    float _1604 = _1500;
    float _1606 = _1502;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1610 = _1598 + _1608;
    float _1612 = in.m_69.w;
    float _1614 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1616 = fma(_1610, _1610, _1600);
    float _1618 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1620 = _1616 + _1602;
    float _1622 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1624 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1614);
    float _1626 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1618);
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1630 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1622);
    float _1632 = sqrt(_1620);
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1638 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1624);
    float _1640 = _1224 + 0.5;
    float _1642 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1626);
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1648 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1432 + 0.5;
    float _1652 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1654 = _1440 + 0.5;
    float _1656 = _1488 + 0.5;
    float _1658 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1630);
    out.m_71.w = _1612;
    bool _1660 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1662 = isnan(_1632);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1668 = _1664 || _1666;
    out.m_73.x = _1644;
    out.m_73.y = _1646;
    out.m_73.z = _1648;
    out.m_73.w = _1652;
    out.m_75.x = _1654;
    out.m_75.y = _1640;
    out.m_75.z = _1656;
    out.m_75.w = _1650;
    out.m_77.x = _1638;
    out.m_77.y = _1642;
    out.m_77.z = _1658;
    if (!_1668)
    {
        _1504 = 1.0;
    }
    float _1670 = _1504;
    bool _1672 = !_1668;
    float _1674 = _1670;
    if (!_1672)
    {
        bool _1676 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1678 = isnan(_1632);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1684 = _1680 || _1682;
        if (!_1684)
        {
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = _1632 + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1692 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1690;
            float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1696 = _1694 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1698 = 1.0 / _1692;
            float _1700 = _1688 * _1698;
            float _1702 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1674 = _1702;
            _1704 = true;
        }
        else
        {
            bool _1706 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1708 = isnan(_1632);
            bool _1710 = _1706 || _1708;
            bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1714 = _1710 || _1712;
            if (!_1714)
            {
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1632 + _1716;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1728 = 1.0 / _1722;
                float _1730 = _1718 * _1728;
                float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1674 = _1732;
                _1704 = true;
            }
            else
            {
                _1674 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1704 = false;
    float _1734 = _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1604 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1742 = _1606 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1746 = _1598 + _1744;
    bool _1748 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan(0.5);
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1760 = -_1124;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1764 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1766 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1768 = -_1124;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1758);
    float _1772 = -_1150;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1776 = -_1150;
    float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    float _1780 = -_1122;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    float _1784 = -_1122;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    float _1788 = _1782;
    float _1790 = _1778;
    float _1792 = _1738;
    float _1794 = _1774;
    if (_1756)
    {
        _1182 = _1770;
    }
    float _1796 = _1182;
    float _1798 = _1796;
    if (!_1756)
    {
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1802 = _1786 + _1800;
        float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1806 = _1762 + _1804;
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1810 = -_1024;
        float _1812 = _1810 + _1758;
        float _1814 = _1802 * _1802;
        float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1818 = _1774 + _1816;
        float _1820 = -_1018;
        float _1822 = _1820 + _1766;
        float _1824 = -_1032;
        float _1826 = _1824 + _1764;
        float _1828 = fma(_1806, _1806, _1814);
        float _1830 = 1.0 / _1318;
        float _1832 = fma(_1818, _1818, _1828);
        float _1834 = sqrt(_1832);
        float _1836 = precise::min(_1834, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1838 = _1836 * _1808;
        float _1840 = _1838 * _1830;
        float _1842 = fma(_1812, _1840, _1762);
        float _1844 = fma(_1822, _1840, _1786);
        float _1846 = fma(_1826, _1840, _1774);
        _1788 = _1844;
        _1798 = _1842;
        _1790 = _1846;
        _1792 = _1808;
    }
    float _1848 = _1788;
    float _1850 = _1798;
    float _1852 = _1790;
    float _1854 = _1792;
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1858 = _1848 + _1856;
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1862 = _1850 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1866 = _1852 + _1864;
    float _1868 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1870 = _1858 * _1858;
    float _1872 = fma(_1862, _1862, _1870);
    float _1874 = fma(_1866, _1866, _1872);
    float _1876 = rsqrt(_1874);
    float _1878 = sqrt(_1874);
    float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1862 * _1880;
    float _1884 = _1866 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1032;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1866;
    float _1908 = _1858;
    if (_1894)
    {
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1910;
    }
    float _1912 = _1900;
    if (_1894)
    {
        float _1914 = rsqrt(_1890);
        _1902 = _1914;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1894)
    {
        float _1920 = _1898 * _1912;
        _1904 = _1920;
    }
    float _1922 = _1904;
    if (_1894)
    {
        float _1924 = _1922 * 0.15915493667125701904296875;
        _1506 = _1924;
    }
    float _1926 = _1506;
    float _1928 = _1758;
    float _1930 = _1926;
    if (_1894)
    {
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1928 = _1934;
    }
    float _1936 = _1928;
    float _1938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1940 = precise::max(0.0, _1938);
    float _1942 = _1854;
    float _1944 = _1940;
    float _1946 = _1938;
    if (_1894)
    {
        float _1948 = _1926 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1942 = _1950;
    }
    float _1952 = _1942;
    float _1954 = -_1880;
    float _1956 = -_1940;
    float _1958 = fma(_1858, _1954, _1956);
    float _1960 = _1958;
    if (_1894)
    {
        float _1962 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1944 = _1962;
    }
    float _1964 = _1944;
    float _1966 = _1964;
    if (!_1894)
    {
        _1930 = _1882;
    }
    float _1968 = _1930;
    float _1970 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1972 = _1968;
    if (_1894)
    {
        float _1974 = fma(_1936, _1964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1966 = _1974;
    }
    float _1976 = _1966;
    float _1978 = floor(_1970);
    float _1980 = _1976;
    if (_1894)
    {
        float _1982 = _1952 + (-1.0);
        _1946 = _1982;
    }
    float _1984 = _1946;
    float _1986 = _1984;
    if (_1894)
    {
        float _1988 = _1916 * _1976;
        _1508 = _1988;
    }
    float _1990 = _1508;
    if (!_1894)
    {
        _1918 = _1884;
    }
    float _1992 = _1918;
    float _1994 = _1992;
    if (_1894)
    {
        float _1996 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1986 = _1996;
    }
    float _1998 = _1986;
    float _2000 = _1998;
    if (_1894)
    {
        float _2002 = _1882 * _1990;
        _1972 = _2002;
    }
    float _2004 = _1972;
    if (_1894)
    {
        float _2006 = _1884 * _1990;
        _1994 = _2006;
    }
    float _2008 = _1994;
    if (!_1894)
    {
        _1980 = _1888;
    }
    float _2010 = _1980;
    float _2012 = _2010;
    if (_1894)
    {
        float _2014 = fma(_1958, _1952, _1998);
        _1960 = _2014;
    }
    float _2016 = _1960;
    if (!_1894)
    {
        _2000 = _1886;
    }
    float _2018 = _2000;
    float _2020 = _2018;
    if (_1894)
    {
        float _2022 = _2004 * _2004;
        _2020 = _2022;
    }
    float _2024 = _2020;
    if (_1894)
    {
        float _2026 = _2008 * _2008;
        _2012 = _2026;
    }
    float _2028 = _2012;
    float _2030 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2032 = fma(_2016, _2016, _2024);
    float _2034 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2036 = -_1978;
    float _2038 = _1970 + _2036;
    float _2040 = _2032 + _2028;
    float _2042 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2030);
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2046 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2044);
    float _2048 = precise::clamp(_2046, 0.0, 1.0);
    float _2050 = rsqrt(_2040);
    float _2052 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2042);
    float _2054 = -_2048;
    float _2056 = _2054 + 1.0;
    float _2058 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2062 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = abs(_2056);
    float _2066 = log2(_2064);
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2070 = -_2068;
    float _2072 = fma(_2070, _2060, 1.0);
    float _2074 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2076 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2058);
    float _2078 = _2050 * _2004;
    float _2080 = _2050 * _2016;
    float _2082 = _2050 * _2008;
    float _2084 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2074);
    float _2086 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2076);
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = floor(_2034);
    float _2092 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2084);
    float _2094 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2096 = -_2088;
    float _2098 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2096);
    float _2100 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1868);
    float _2102 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2106 = -_2082;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2098);
    float _2110 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2100);
    float _2112 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2104);
    float _2116 = fma(_2108, -0.5, 0.5);
    float _2118 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2120 = exp2(_2112);
    float _2122 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2114);
    float _2124 = fma(_2108, 0.5, 0.5);
    float _2126 = -_2090;
    float _2128 = _2034 + _2126;
    float _2130 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2122);
    float _2134 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2136 = _2080 + 1.0;
    float _2138 = log2(_2072);
    float _2140 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2142 = fma(_2124, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2144 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2140);
    float _2146 = fma(_2124, _2142, -0.212114393711090087890625);
    float _2148 = 1.0 / _2132;
    float _2150 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2144);
    float _2152 = -_2080;
    float _2154 = fma(_2120, _2136, _2152);
    float _2156 = sqrt(_2116);
    float _2158 = _2138 * 0.693147182464599609375;
    float2 _6107 = float2(_2128, _2038);
    float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).x;
    float _2162 = fma(_2124, _2146, 1.570728778839111328125);
    float _2164 = fma(_2154, 0.5, 0.5);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2134);
    float _2170 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2168);
    float _2172 = _2150 * _2148;
    float _2174 = _2156 * 0.636619746685028076171875;
    float _2176 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2170);
    float _2178 = -_2162;
    float _2180 = fma(_2174, _2178, 1.0);
    float _2182 = _2176 * _2148;
    float _2184 = fma(_2172, 0.5, 0.5);
    float _2186 = fma(_2182, -0.5, 0.5);
    float3 _6161 = float3(_2184, _2186, _2166);
    float _2188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6161, float3(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6161, float3(0.0), isnan(_6161)), level(0.0)).x;
    float3 _6172 = float3(_2184, _2186, _2166);
    float4 _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6172, float3(0.0), isnan(_6172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6172, float3(0.0), isnan(_6172)), level(0.0)).xyzw;
    float _2193 = _2191.x;
    float _2195 = _2191.y;
    float _2197 = _2191.z;
    float _2199 = _2191.w;
    float2 _6188 = float2(_2180, _2164);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_79.x = _1862;
    out.m_79.y = _1858;
    out.m_79.z = _1866;
    float _2213 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    float _2215 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2213);
    float _2217 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2219 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2221 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2217);
    float _2223 = 1.0 / _2219;
    float _2225 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2221);
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2229 = _2227 + _2219;
    float _2231 = _2229 * _2223;
    float _2233 = _2231 * 0.5;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2237 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2235);
    float _2239 = 1.0 / _2237;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2243 = _2239 * _2241;
    float _2245 = abs(_2243);
    float _2247 = log2(_2245);
    float _2249 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2251 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan(0.5);
    bool _2259 = _2255 || _2257;
    float _2261 = exp2(_2249);
    float _2263 = _2066;
    float _2265 = _2094;
    float _2267 = _2132;
    float _2269 = _2176;
    if (!_2259)
    {
        _1794 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2271 = _1794;
    float _2273 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2279 = _2271;
    if (!_2259)
    {
        float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2283 = _2271 + _2281;
        _2279 = _2283;
    }
    float _2285 = _2279;
    if (_2259)
    {
        _2263 = 1.0;
    }
    float _2287 = _2263;
    float _2289 = fma(_2275, -2.0, 3.0);
    float _2291 = _2275 * _2275;
    float _2293 = _2184;
    float _2295 = _2287;
    if (!_2259)
    {
        float _2297 = 1.0 / _2285;
        _2293 = _2297;
    }
    float _2299 = _2293;
    float _2301 = in.m_81.x;
    float _2303 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2305 = _2291 * _2289;
    if (!_2259)
    {
        float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2309 = _2243 + _2307;
        _2265 = _2309;
    }
    float _2311 = _2265;
    float _2313 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2303);
    float _2315 = -_2305;
    float _2317 = _2315 + 1.0;
    float _2319 = exp2(_2277);
    float _2321 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2313);
    float _2323 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2305);
    bool _2325 = _2243 <= 8000.0;
    bool _2327 = isnan(_2243);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(8000.0);
    bool _2333 = _2329 || _2331;
    float _2335 = float(_2333);
    float _2337 = _2150 + _2132;
    float _2339 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2341 = _2132 * 0.5;
    if (!_2259)
    {
        float _2343 = _2311 * _2299;
        float _2345 = precise::clamp(_2343, 0.0, 1.0);
        _2295 = _2345;
    }
    float _2347 = _2295;
    float _2349 = _2335 * _2323;
    float _2351 = _2339 + _2132;
    float _2353 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2355 = _2337 * 0.5;
    float _2357 = _2351 * 0.5;
    float _2359 = -_2319;
    float _2361 = _2359 + 1.0;
    float _2363 = fma(_2176, -0.5, _2341);
    bool _2365 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2367 = isnan(_1878);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2373 = _2369 || _2371;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2176;
    out.gl_Position.z = _2339;
    out.gl_Position.w = _2132;
    float _2375 = _2361 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2355;
    out.m_83.y = _2363;
    out.m_83.z = _2357;
    out.m_83.w = _2132;
    float _2377 = -_2375;
    float _2379 = _2377 + 1.0;
    float _2381 = _2379;
    if (!_2373)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2383 = _1906;
    float _2385 = _2383;
    float _2387 = _2383;
    if (!_2373)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2389 = _2267;
    float _2391 = _2389;
    float _2393 = _2389;
    if (!_2373)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2395 = _2269;
    float _2397 = _2395;
    float _2399 = _2395;
    if (!_2373)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2401 = _1908;
    float _2403 = -_2160;
    float _2405 = _2403 + 1.0;
    float _2407 = _2405 * _2353;
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = -_2409;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2415 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2417 = _2413 * _2301;
    float _2419 = _2417 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2419;
    float _2421 = _2375 * _2188;
    float _2423 = _2199 * _2379;
    float _2425 = _2401;
    float _2427 = _2401;
    if (!_2373)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2429 = _2381;
    float _2431 = _2199 * _2421;
    float _2433 = _2209 * _2421;
    float _2435 = fma(_2205, _2431, _2193);
    float _2437 = fma(_2207, _2431, _2195);
    float _2439 = fma(_2199, _2433, _2197);
    float _2441 = _2431;
    float _2443 = _2429;
    float _2445 = _2429;
    if (!_2373)
    {
        _2441 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2447 = _2441;
    out.m_87.x = _2435;
    out.m_87.y = _2437;
    out.m_87.z = _2439;
    out.m_87.w = _2423;
    bool _2449 = !_2373;
    float _2451 = _2447;
    float _2453 = _2447;
    if (!_2449)
    {
        bool _2455 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2457 = isnan(_1878);
        bool _2459 = _2455 || _2457;
        bool _2461 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2463 = _2459 || _2461;
        if (!_2463)
        {
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2467 = _1878 + _2465;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2471 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2477 = 1.0 / _2471;
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2495 = _2467 * _2477;
            float _2497 = precise::clamp(_2495, 0.0, 1.0);
            float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2503 = fma(_2497, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2505 = fma(_2497, _2501, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2507 = fma(_2497, _2481, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2509 = fma(_2497, _2485, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2511 = fma(_2497, _2489, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2513 = fma(_2497, _2493, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2393 = _2503;
            _2453 = _2511;
            _2387 = _2507;
            _2427 = _2509;
            _2399 = _2505;
            _2445 = _2513;
            _2515 = true;
        }
        else
        {
            bool _2517 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2519 = isnan(_1878);
            bool _2521 = _2517 || _2519;
            bool _2523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2525 = _2521 || _2523;
            if (!_2525)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2527 = _2385;
            _2387 = _2527;
            if (!_2525)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2529 = _2391;
            _2393 = _2529;
            if (!_2525)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2531 = _2397;
            _2399 = _2531;
            if (!_2525)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2533 = _2425;
            _2427 = _2533;
            if (!_2525)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2535 = _2451;
            _2453 = _2535;
            if (!_2525)
            {
                _2443 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2537 = _2443;
            bool _2539 = !_2525;
            _2445 = _2537;
            if (!_2539)
            {
                bool _2541 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2543 = isnan(_1878);
                bool _2545 = _2541 || _2543;
                bool _2547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2549 = _2545 || _2547;
                if (!_2549)
                {
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2553 = _1878 + _2551;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2557 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2563 = 1.0 / _2557;
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2581 = _2553 * _2563;
                    float _2583 = precise::clamp(_2581, 0.0, 1.0);
                    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2589 = fma(_2583, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2591 = fma(_2583, _2587, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2593 = fma(_2583, _2567, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2595 = fma(_2583, _2571, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2597 = fma(_2583, _2575, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2599 = fma(_2583, _2579, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2393 = _2589;
                    _2453 = _2597;
                    _2387 = _2593;
                    _2427 = _2595;
                    _2399 = _2591;
                    _2445 = _2599;
                    _2515 = true;
                }
                else
                {
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2445 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2515 = false;
    float _2601 = _2393;
    float _2603 = _2453;
    float _2605 = _2387;
    float _2607 = _2427;
    float _2609 = _2399;
    float _2611 = _2445;
    float _2613 = _2415 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2615 = fma(_1642, -0.5, 0.5);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = -_2601;
    float _2621 = _2619 + _2603;
    float _2623 = -_2605;
    float _2625 = _2623 + _2607;
    out.m_51.x = _2613;
    float _2627 = -_2609;
    float _2629 = _2627 + _2611;
    float _2631 = fma(_2617, _2621, _2601);
    float _2633 = fma(_2617, _2625, _2605);
    bool _2635 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2637 = _2631 * 0.586610972881317138671875;
    float _2639 = fma(_2617, _2629, _2609);
    out.m_89.x = 0.0;
    bool _2641 = _2347 > 0.0;
    bool _2643 = isnan(_2347);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2633, 0.298911988735198974609375, _2637);
    float _2653 = fma(_2639, 0.114477999508380889892578125, _2651);
    float _2655 = -_2653;
    float _2657 = _2633 + _2655;
    float _2659 = -_2653;
    float _2661 = _2631 + _2659;
    float _2663 = -_2653;
    float _2665 = _2639 + _2663;
    float _2667 = fma(_2657, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    float _2669 = fma(_2661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    float _2671 = fma(_2665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    bool _2673 = !_2635;
    if (!_2673)
    {
        float _2675 = -_1848;
        float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2679 = -_1850;
        float _2681 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2683 = -_1852;
        float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2687 = _2677 * _2677;
        float _2689 = fma(_2681, _2681, _2687);
        float _2691 = fma(_2685, _2685, _2689);
        float _2693 = sqrt(_2691);
        float _2695 = rsqrt(_2691);
        float _2697 = -_2693;
        float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2701 = _2699 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2703 = precise::clamp(_2701, 0.0, 1.0);
        float _2705 = _2681 * _2695;
        float _2707 = _2677 * _2695;
        float _2709 = abs(_2703);
        float _2711 = log2(_2709);
        float _2713 = _2685 * _2695;
        float _2715 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2717 = _1642 * _2707;
        float _2719 = -_2707;
        float _2721 = -_2715;
        float _2723 = fma(_2719, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2721);
        float _2725 = fma(_1638, _2705, _2717);
        float _2727 = -_2713;
        float _2729 = fma(_2727, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2723);
        float _2731 = fma(_1658, _2713, _2725);
        float _2733 = precise::clamp(_2731, 0.0, 1.0);
        float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2737 = _2729 + _2735;
        float _2739 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2741 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = exp2(_2739);
        float _2747 = _2745 * _2743;
        float _2749 = _2733 * _2747;
        float _2751 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2753 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2755 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2751;
        out.m_89.y = _2753;
        out.m_89.z = _2755;
    }
    out.m_91.x = _2667;
    out.m_91.y = _2669;
    out.m_91.z = _2671;
    if (_2649)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2757 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2757;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2515 = false;
    bool _1704 = false;
    bool _628 = false;
    bool _404 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2814 = as_type<float>(_126);
        out.gl_Position.z = _2814;
    }
    if (!_114)
    {
        return out;
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _118;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    int _156 = 0;
    if (_150)
    {
        float _158 = _154 * 5.0;
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_160);
        out.gl_Position.z = _2878;
    }
    if (_150)
    {
        return out;
    }
    float _162 = 1.0 / _130;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _134 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _190 + _196;
    bool _200 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _190 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _214;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _226;
    float _234 = 1.0 / _222;
    float _236 = _194 * _228;
    bool _238 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_190);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_210;
    float _252 = _250 + 1.0;
    float _254 = _248 * _252;
    float _256 = _198 * _232;
    bool _258 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_190);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    bool _274 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_190);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -_248;
    float _292 = _290 + 1.0;
    float _294 = -_268;
    float _296 = _294 + 1.0;
    float _298 = _218 * _234;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    float _308 = _284 * _296;
    float _310 = fma(_272, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _314 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = _268 * _292;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _322 = _312 * _308;
    float _324 = _314 * _308;
    float _326 = _310 * _308;
    float _328 = -_284;
    float _330 = _328 + 1.0;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _336 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _338 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].y, _322);
    float _340 = fma(_288, _256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _344;
    float _348 = fma(_334, _256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = fma(_320, _256, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = fma(_340, _316, _336);
    float _362 = fma(_346, _236, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _364 = fma(_354, _236, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _366 = fma(_358, _236, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _368 = fma(_348, _316, _338);
    float _370 = fma(_350, _316, _342);
    float _372 = fma(_362, _254, _360);
    float _374 = fma(_364, _254, _368);
    float _376 = fma(_366, _254, _370);
    float _378 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].x, _372);
    float _380 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].y, _374);
    float _382 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].z, _376);
    bool _384 = !_230;
    float _402;
    if (!_384)
    {
        float _386 = in.m_55.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        _402 = _166;
    }
    _404 = false;
    float _406 = _402;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _410 = _406 + _408;
    float _412 = in.m_57.x;
    float _414 = in.m_57.y;
    float _416 = in.m_57.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _430 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _432 = isnan(_406);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = 1.0 / _420;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _462 = 1.0 / _428;
    float _464 = _424 * _442;
    bool _466 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _446;
    float _480 = -_440;
    float _482 = _480 + 1.0;
    float _484 = fma(_464, _410, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _490 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _492 = isnan(_406);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -_476;
    float _504 = _502 + 1.0;
    float _506 = _476 * _482;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = 1.0 / _488;
    float _514 = -_500;
    float _516 = _514 + 1.0;
    float _518 = _458 * _504;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _520;
    float _524 = _510 * _462;
    float _526 = _440 * _516;
    float _528 = _484 * _518;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _406 + _530;
    float _534 = -_458;
    float _536 = _534 + 1.0;
    bool _538 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _540 = isnan(_406);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _522 * _478;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _406 + _556;
    float _560 = fma(_524, _532, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[115].x, _528);
    float _564 = -_548;
    float _566 = _564 + 1.0;
    float _568 = _554 * _512;
    float _570 = fma(_550, _558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _574 = _406 + _572;
    float _576 = fma(_560, _506, _562);
    float _578 = _500 * _566;
    float _580 = fma(_568, _574, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _582 = fma(_570, _526, _576);
    float _584 = _382 * _416;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = fma(_580, _578, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[119].x, _588);
    float _596 = _380 * _414;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _604 = _378 * _412;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _592;
    out.m_59.y = _600;
    out.m_59.z = _606;
    out.m_59.w = _602;
    bool _608 = !_460;
    float _626;
    if (!_608)
    {
        float _610 = in.m_55.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        _626 = _166;
    }
    _628 = false;
    float _630 = _626;
    float _632 = in.m_55.x;
    float _634 = in.m_55.y;
    float _636 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _638 = log2(_636);
    float _640 = in.m_55.z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _644 = _642 != 0;
    float _646 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _650 = in.m_55.w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _664 = _662 != 0;
    float _666 = in.m_61.y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _670 = _638 * _134;
    float _672 = in.m_63.x;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _676 = _632 * 2.0;
    float _678 = _634 * 2.0;
    float _680 = _634 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = _632 + (-0.5);
    float _684 = _640 * 2.0;
    float _686 = exp2(_670);
    float _688 = fma(_680, -2.0, _652);
    float _690 = _652;
    float _692 = _648;
    bool _694 = _660;
    if (!_644)
    {
        _690 = _634;
    }
    float _696 = _690;
    float _698 = _696;
    if (_644)
    {
        _698 = _632;
    }
    float _700 = _698;
    float _702 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _688);
    float _704 = floor(_684);
    float _706 = _674 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _710 = floor(_676);
    float _712 = _632 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = -_686;
    float _716 = _714 + 1.0;
    float _718 = -_648;
    float _720 = fma(_712, 2.0, _718);
    float _722 = _712;
    if (!_644)
    {
        _722 = _640;
    }
    float _724 = _722;
    float _726 = floor(_678);
    bool _728 = _704 > 0.0;
    float _730 = -_134;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[76].x, _720);
    bool _734 = _704 >= 0.0;
    bool _736 = isnan(_704);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = _724;
    if (!_644)
    {
        _692 = _640;
    }
    float _746 = _692;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _750 = _710 >= 0.0;
    bool _752 = isnan(_710);
    bool _754 = _750 || _752;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    float _760 = _746;
    if (_644)
    {
        _744 = _634;
    }
    float _762 = _744;
    if (_644)
    {
        _760 = _634;
    }
    float _764 = _760;
    bool _766 = _710 > 0.0;
    float _768 = _762 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _770 = _742 ? 0 : 1;
    float _772 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[83].w, _668);
    int _774 = _758 ? 0 : 1;
    bool _776 = _726 > 0.0;
    float _778 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _772);
    bool _780 = _726 >= 0.0;
    bool _782 = isnan(_726);
    bool _784 = _780 || _782;
    bool _786 = isnan(0.0);
    bool _788 = _784 || _786;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _792 = _788 ? 0 : 1;
    float _794 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].z, _790);
    float _796 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _800 = ~_770;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = -_708;
    float _808 = fma(_796, 2.0, _806);
    float _810 = fma(_768, -2.0, _798);
    int _812 = ~_792;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _810);
    int _820 = _804;
    int _822 = _816;
    if (!_728)
    {
        int _824 = ~_770;
        int _826 = _824 + 1;
        _820 = _826;
    }
    int _828 = _820;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_776)
    {
        int _832 = ~_792;
        int _834 = _832 + 1;
        _822 = _834;
    }
    int _836 = _822;
    float _838 = _134 * 0.1500000059604644775390625;
    bool _840 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(1.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[78].z, _830);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _854 = 1.0 + _852;
    float _856 = in.m_48.x;
    float _858 = in.m_48.y;
    float _860 = in.m_48.z;
    int _862 = ~_774;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _850);
    int _870 = _866;
    if (!_766)
    {
        int _872 = ~_774;
        int _874 = _872 + 1;
        _870 = _874;
    }
    int _876 = _870;
    float _878 = 1.0 / _854;
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _892 = _890 != 0;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _896 = _888 ? _716 : 0.0;
    float _898 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _794);
    float _900 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[78].w, _894);
    float _902 = _166 * _166;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _906 = _904 != 0;
    float _908 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _900);
    float _910 = -_134;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _808);
    float _914 = _908;
    if (_848)
    {
        float _916 = _896 * _878;
        _152 = _916;
    }
    float _918 = _152;
    float _920 = _166 * _902;
    bool _922 = !_656;
    int _924 = _922 ? 0 : 1;
    float _926 = _858 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _928 = _650 > 0.5;
    float _930 = fma(_166, -0.699999988079071044921875, 1.0);
    float _932 = _858 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _934 = _858 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _936 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[5].x, _926);
    float _938 = _634 + _640;
    float _940 = in.m_63.y;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _944 = _942 != 0;
    float _946 = _634 + _632;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _950 = _948 != 0;
    float _952 = _938 + (-1.0);
    int _954 = abs(_924);
    float _956 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[4].x, _932);
    float _958 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[6].x, _934);
    float _960 = _946 + (-1.0);
    float _962 = float(_828);
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _966 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[5].z, _936);
    bool _968 = !_660;
    int _970 = _968 ? 0 : 1;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _974 = float(_954);
    float _976 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[4].z, _956);
    bool _978 = !_664;
    int _980 = _978 ? 0 : 1;
    float _982 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[6].z, _958);
    int _984 = abs(_970);
    float _986 = _974 * _962;
    int _988 = abs(_980);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _992 = in.m_65.x;
    float _994 = in.m_65.y;
    float _996 = in.m_65.z;
    float _998 = float(_984);
    float _1000 = _986 * (-2.0);
    float _1002 = float(_876);
    float _1004 = float(_988);
    float _1006 = fma(_972, _1000, _972);
    float _1008 = float(_836);
    float _1010 = _998 * _1002;
    float _1012 = fma(_940, 13.0, _838);
    float _1014 = _1004 * _1008;
    float _1016 = fma(_632, 6.283185482025146484375, _1012);
    float _1018 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1024 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1026 = _1016 * 0.15915493667125701904296875;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1030 = _1018 + _1028;
    float _1032 = _982 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1036 = _1024 + _1034;
    float _1038 = _1030 * _1030;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1042 = _1032 + _1040;
    float _1044 = fma(_1000, _992, _992);
    float _1046 = _1010 * (-2.0);
    float _1048 = fma(_1036, _1036, _1038);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1054 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1044);
    float _1056 = fma(_964, _1046, _964);
    float _1058 = fma(_1042, _1042, _1048);
    float _1060 = fma(_1006, _918, _1054);
    float _1062 = 1.0 / _1052;
    float _1064 = _632 + _640;
    bool _1066 = _634 > 0.5;
    float _1068 = _1060 * 0.15915493667125701904296875;
    float _1070 = fma(_1046, _994, _994);
    float _1072 = _634 + (-0.5);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1074;
    float _1078 = rsqrt(_1058);
    float _1080 = _1064 + (-1.0);
    float _1082 = _1014 * (-2.0);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1070);
    bool _1086 = _1066;
    float _1088 = _990;
    if (_892)
    {
        bool _1090 = _640 > 0.5;
        _694 = _1090;
    }
    bool _1092 = _694;
    float _1094 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1096 = fma(_1082, _996, _996);
    float _1098 = fma(_1056, _918, _1084);
    float _1100 = 1.0 / _1022;
    float _1102 = _1076 * _1062;
    float _1104 = _640 + (-0.5);
    float _1106 = fma(_1094, _1082, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1112 = _1062;
    if (_906)
    {
        float _1114 = in.m_55.x;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1096);
    float _1120 = _1098 * 0.15915493667125701904296875;
    float _1122 = _1030 * _1078;
    float _1124 = _1036 * _1078;
    float _1126 = fma(_1106, _918, _1118);
    float _1128 = -_940;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1122;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1136 = -_1124;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1140 = _1126 * 0.15915493667125701904296875;
    float _1142 = _1026 * 6.283185482025146484375;
    float _1144 = sin(_1142);
    float _1146 = _1110 * _1100;
    float _1148 = _1134 * _1134;
    float _1150 = _1042 * _1078;
    float _1152 = in.m_61.z;
    float _1154 = fma(_1138, _1138, _1148);
    float _1156 = -_1150;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1160 = _1066 ? _1130 : _940;
    float _1162 = _1068 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    int _1166 = _928 ? as_type<int>(_1130) : as_type<int>(_940);
    float _1168 = fma(_1158, _1158, _1154);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1172 = _630 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1176 = _630 + _1174;
    float _1178 = _950 ? as_type<float>(_1166) : _940;
    float _1180 = _1160;
    float _1182 = _1150;
    if (_906)
    {
        bool _1184 = _1116 > 0.5;
        _1086 = _1184;
    }
    bool _1186 = _1086;
    float _1188 = _1068 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = fma(_1102, _1176, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1194 = _990 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1196 = _1120 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _944 ? _1160 : _940;
    float _1202 = fma(_1146, _1172, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1204 = _920 * 0.100000001490116119384765625;
    float _1206 = in.m_61.x;
    if (!_906)
    {
        _1180 = _672;
    }
    float _1208 = _1180;
    float _1210 = fma(_1194, _1200, -0.5);
    float _1212 = _1144 * _1204;
    float _1214 = _1120 * 6.283185482025146484375;
    float _1216 = cos(_1214);
    float _1218 = _1208;
    if (!_906)
    {
        _1088 = _1208;
    }
    float _1220 = _1088;
    float _1222 = -_702;
    float _1224 = fma(_908, _1210, _1222);
    float _1226 = fma(_930, _666, _1212);
    bool _1228 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1230 = isnan(_630);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1220;
    if (_906)
    {
        _1218 = _672;
    }
    float _1242 = _1218;
    float _1244 = _1140 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1190 * _1198;
    bool _1250 = _1226 != 0.0;
    bool _1252 = isnan(_1226);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    int _1260 = 0;
    if (_906)
    {
        float _1262 = -_1242;
        float _1264 = _1262 + 1.0;
        _1260 = as_type<int>(_1264);
    }
    int _1266 = _1260;
    int _1268 = 0;
    if (_892)
    {
        float _1270 = -_1242;
        float _1272 = _1270 + 1.0;
        _1268 = as_type<int>(_1272);
    }
    int _1274 = _1268;
    float _1276 = 0.0;
    if (!_892)
    {
        _1276 = _1242;
    }
    float _1278 = _1276;
    float _1280 = sqrt(_1168);
    float _1282 = _1190 * _1216;
    float _1284 = _1164 * _1216;
    float _1286 = _1278;
    if (_906)
    {
        float _1288 = _1186 ? as_type<float>(_1266) : _1242;
        _1240 = _1288;
    }
    float _1290 = _1240;
    if (_892)
    {
        float _1292 = _1092 ? as_type<float>(_1274) : _1242;
        _1286 = _1292;
    }
    float _1294 = _1286;
    bool _1296 = _1206 == 0.0;
    bool _1298 = !_1258;
    bool _1300 = _1296 && _1298;
    float _1302 = _1140 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = _1216 * _1246;
    float _1308 = _1190 * _1246;
    float _1310 = _1198 * _1246;
    bool _1312 = _1152 == 0.0;
    bool _1314 = _1312 && _1300;
    float _1316 = fma(_706, _1290, -0.5);
    float _1318 = _1078 * _1280;
    float _1320 = _1164 * _1198;
    float _1322 = _1164 * _1246;
    float _1324 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1326 = _1318 * _646;
    float _1328 = fma(_1304, _1282, _1320);
    float _1330 = fma(_1304, _1320, _1282);
    float _1332 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1226);
    float _1336 = _1318 * _1324;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1206);
    float _1340 = _1318 * _1332;
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1344 = _1334 * _1336;
    float _1346 = -_1248;
    float _1348 = fma(_1304, _1284, _1346);
    float _1350 = _1338 * _1340;
    float _1352 = _1342 * _1326;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1356 = _1308 * _1344;
    float _1358 = -_1344;
    float _1360 = _1304 * _1358;
    float _1362 = _1322 * _1344;
    float _1364 = -_1284;
    float _1366 = fma(_1304, _1248, _1364);
    float _1368 = fma(_1328, _1350, _1356);
    float _1370 = fma(_1306, _1350, _1360);
    float _1372 = fma(_1348, _1350, _1362);
    bool _1374 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1376 = isnan(_630);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1238;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1366, _1352, _1368);
    float _1392 = fma(_1310, _1352, _1370);
    float _1394 = fma(_1330, _1352, _1372);
    float _1396 = _1384 * _1388;
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1400 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1402 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1404 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1406 = isnan(_630);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1398);
    float _1418 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1400);
    float _1420 = fma(_1402, _1178, -0.5);
    float _1422 = -_1384;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1416);
    float _1428 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1418);
    float _1430 = -_818;
    float _1432 = fma(_778, _1420, _1430);
    float _1434 = _1414 * _1424;
    float _1436 = _1024 + _1426;
    float _1438 = _1032 + _1428;
    float _1440 = fma(_868, _1316, _732);
    float _1442 = _1192 * _1434;
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1446 = _1436 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1438 + _1448;
    float _1452 = in.m_67.x;
    float _1454 = in.m_67.y;
    float _1456 = in.m_67.z;
    float _1458 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1460 = _1446 * _1446;
    float _1462 = _1450 * _1450;
    float _1464 = -_1414;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1458);
    float _1470 = _1460 + _1462;
    float _1472 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1442);
    float _1474 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1468);
    float _1476 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1478 = sqrt(_1470);
    float _1480 = fma(_1202, _1396, _1472);
    float _1482 = _1018 + _1474;
    float _1484 = fma(_1476, _1294, -0.5);
    float _1486 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1480);
    float _1488 = fma(_898, _1484, _912);
    float _1490 = _1454;
    float _1492 = _1452;
    float _1494 = _1456;
    float _1496 = _1460;
    float _1498 = _1462;
    float _1500 = _1436;
    float _1502 = _1438;
    float _1504 = _1488;
    float _1506 = _1318;
    float _1508 = _1390;
    if (!_1314)
    {
        float _1510 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1454);
        _1490 = _1510;
    }
    float _1512 = _1490;
    if (!_1314)
    {
        float _1514 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1452);
        _1492 = _1514;
    }
    float _1516 = _1492;
    if (!_1314)
    {
        float _1518 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1456);
        _1494 = _1518;
    }
    float _1520 = _1494;
    bool _1522 = _1478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = -_1512;
    float _1526 = _1304 * _1524;
    float _1528 = _1308 * _1512;
    float _1530 = _1322 * _1512;
    float _1532 = fma(_1306, _1516, _1526);
    float _1534 = fma(_1328, _1516, _1528);
    float _1536 = fma(_1348, _1516, _1530);
    float _1538 = fma(_1310, _1520, _1532);
    float _1540 = fma(_1366, _1520, _1534);
    float _1542 = fma(_1330, _1520, _1536);
    if (!_1522)
    {
        _914 = _1482;
    }
    float _1544 = _914;
    bool _1546 = !_1522;
    float _1548 = _1544;
    if (!_1546)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1554 = _1478 + _1552;
        float _1556 = rsqrt(_1470);
        float _1558 = _1554 * _1550;
        float _1560 = _1482 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1562 = _1558 * 0.15915493667125701904296875;
        float _1564 = _1562 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = _1562 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = fma(_1566, _1560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1574 = _1556 * _1572;
        float _1576 = _1570 + (-1.0);
        float _1578 = fma(_1446, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1580 = fma(_1450, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1582 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1586 = _1578 + _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1590 = _1580 + _1588;
        float _1592 = fma(_1482, _1570, _1582);
        float _1594 = _1586 * _1586;
        float _1596 = _1590 * _1590;
        _1548 = _1592;
        _1496 = _1594;
        _1498 = _1596;
        _1500 = _1578;
        _1502 = _1580;
    }
    float _1598 = _1548;
    float _1600 = _1496;
    float _1602 = _1498;
    float _1604 = _1500;
    float _1606 = _1502;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1610 = _1598 + _1608;
    float _1612 = in.m_69.w;
    float _1614 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1616 = fma(_1610, _1610, _1600);
    float _1618 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1620 = _1616 + _1602;
    float _1622 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1624 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1614);
    float _1626 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1618);
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1630 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1622);
    float _1632 = sqrt(_1620);
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1638 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1624);
    float _1640 = _1224 + 0.5;
    float _1642 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1626);
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1648 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1432 + 0.5;
    float _1652 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1654 = _1440 + 0.5;
    float _1656 = _1488 + 0.5;
    float _1658 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1630);
    out.m_71.w = _1612;
    bool _1660 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1662 = isnan(_1632);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1668 = _1664 || _1666;
    out.m_73.x = _1644;
    out.m_73.y = _1646;
    out.m_73.z = _1648;
    out.m_73.w = _1652;
    out.m_75.x = _1654;
    out.m_75.y = _1640;
    out.m_75.z = _1656;
    out.m_75.w = _1650;
    out.m_77.x = _1638;
    out.m_77.y = _1642;
    out.m_77.z = _1658;
    if (!_1668)
    {
        _1504 = 1.0;
    }
    float _1670 = _1504;
    bool _1672 = !_1668;
    float _1674 = _1670;
    if (!_1672)
    {
        bool _1676 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1678 = isnan(_1632);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1684 = _1680 || _1682;
        if (!_1684)
        {
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = _1632 + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1692 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1690;
            float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1696 = _1694 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1698 = 1.0 / _1692;
            float _1700 = _1688 * _1698;
            float _1702 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1674 = _1702;
            _1704 = true;
        }
        else
        {
            bool _1706 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1708 = isnan(_1632);
            bool _1710 = _1706 || _1708;
            bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1714 = _1710 || _1712;
            if (!_1714)
            {
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1632 + _1716;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1728 = 1.0 / _1722;
                float _1730 = _1718 * _1728;
                float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1674 = _1732;
                _1704 = true;
            }
            else
            {
                _1674 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1704 = false;
    float _1734 = _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1604 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1742 = _1606 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1746 = _1598 + _1744;
    bool _1748 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan(0.5);
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1760 = -_1124;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1764 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1766 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1768 = -_1124;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1758);
    float _1772 = -_1150;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1776 = -_1150;
    float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    float _1780 = -_1122;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    float _1784 = -_1122;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    float _1788 = _1782;
    float _1790 = _1778;
    float _1792 = _1738;
    float _1794 = _1774;
    if (_1756)
    {
        _1182 = _1770;
    }
    float _1796 = _1182;
    float _1798 = _1796;
    if (!_1756)
    {
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1802 = _1786 + _1800;
        float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1806 = _1762 + _1804;
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1810 = -_1024;
        float _1812 = _1810 + _1758;
        float _1814 = _1802 * _1802;
        float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1818 = _1774 + _1816;
        float _1820 = -_1018;
        float _1822 = _1820 + _1766;
        float _1824 = -_1032;
        float _1826 = _1824 + _1764;
        float _1828 = fma(_1806, _1806, _1814);
        float _1830 = 1.0 / _1318;
        float _1832 = fma(_1818, _1818, _1828);
        float _1834 = sqrt(_1832);
        float _1836 = precise::min(_1834, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1838 = _1836 * _1808;
        float _1840 = _1838 * _1830;
        float _1842 = fma(_1812, _1840, _1762);
        float _1844 = fma(_1822, _1840, _1786);
        float _1846 = fma(_1826, _1840, _1774);
        _1788 = _1844;
        _1798 = _1842;
        _1790 = _1846;
        _1792 = _1808;
    }
    float _1848 = _1788;
    float _1850 = _1798;
    float _1852 = _1790;
    float _1854 = _1792;
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1858 = _1848 + _1856;
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1862 = _1850 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1866 = _1852 + _1864;
    float _1868 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1870 = _1858 * _1858;
    float _1872 = fma(_1862, _1862, _1870);
    float _1874 = fma(_1866, _1866, _1872);
    float _1876 = rsqrt(_1874);
    float _1878 = sqrt(_1874);
    float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1862 * _1880;
    float _1884 = _1866 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1032;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1866;
    float _1908 = _1858;
    if (_1894)
    {
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1910;
    }
    float _1912 = _1900;
    if (_1894)
    {
        float _1914 = rsqrt(_1890);
        _1902 = _1914;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1894)
    {
        float _1920 = _1898 * _1912;
        _1904 = _1920;
    }
    float _1922 = _1904;
    if (_1894)
    {
        float _1924 = _1922 * 0.15915493667125701904296875;
        _1506 = _1924;
    }
    float _1926 = _1506;
    float _1928 = _1758;
    float _1930 = _1926;
    if (_1894)
    {
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1928 = _1934;
    }
    float _1936 = _1928;
    float _1938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1940 = precise::max(0.0, _1938);
    float _1942 = _1854;
    float _1944 = _1940;
    float _1946 = _1938;
    if (_1894)
    {
        float _1948 = _1926 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1942 = _1950;
    }
    float _1952 = _1942;
    float _1954 = -_1880;
    float _1956 = -_1940;
    float _1958 = fma(_1858, _1954, _1956);
    float _1960 = _1958;
    if (_1894)
    {
        float _1962 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1944 = _1962;
    }
    float _1964 = _1944;
    float _1966 = _1964;
    if (!_1894)
    {
        _1930 = _1882;
    }
    float _1968 = _1930;
    float _1970 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1972 = _1968;
    if (_1894)
    {
        float _1974 = fma(_1936, _1964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1966 = _1974;
    }
    float _1976 = _1966;
    float _1978 = floor(_1970);
    float _1980 = _1976;
    if (_1894)
    {
        float _1982 = _1952 + (-1.0);
        _1946 = _1982;
    }
    float _1984 = _1946;
    float _1986 = _1984;
    if (_1894)
    {
        float _1988 = _1916 * _1976;
        _1508 = _1988;
    }
    float _1990 = _1508;
    if (!_1894)
    {
        _1918 = _1884;
    }
    float _1992 = _1918;
    float _1994 = _1992;
    if (_1894)
    {
        float _1996 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1986 = _1996;
    }
    float _1998 = _1986;
    float _2000 = _1998;
    if (_1894)
    {
        float _2002 = _1882 * _1990;
        _1972 = _2002;
    }
    float _2004 = _1972;
    if (_1894)
    {
        float _2006 = _1884 * _1990;
        _1994 = _2006;
    }
    float _2008 = _1994;
    if (!_1894)
    {
        _1980 = _1888;
    }
    float _2010 = _1980;
    float _2012 = _2010;
    if (_1894)
    {
        float _2014 = fma(_1958, _1952, _1998);
        _1960 = _2014;
    }
    float _2016 = _1960;
    if (!_1894)
    {
        _2000 = _1886;
    }
    float _2018 = _2000;
    float _2020 = _2018;
    if (_1894)
    {
        float _2022 = _2004 * _2004;
        _2020 = _2022;
    }
    float _2024 = _2020;
    if (_1894)
    {
        float _2026 = _2008 * _2008;
        _2012 = _2026;
    }
    float _2028 = _2012;
    float _2030 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2032 = fma(_2016, _2016, _2024);
    float _2034 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2036 = -_1978;
    float _2038 = _1970 + _2036;
    float _2040 = _2032 + _2028;
    float _2042 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2030);
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2046 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2044);
    float _2048 = precise::clamp(_2046, 0.0, 1.0);
    float _2050 = rsqrt(_2040);
    float _2052 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2042);
    float _2054 = -_2048;
    float _2056 = _2054 + 1.0;
    float _2058 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2062 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = abs(_2056);
    float _2066 = log2(_2064);
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2070 = -_2068;
    float _2072 = fma(_2070, _2060, 1.0);
    float _2074 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2076 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2058);
    float _2078 = _2050 * _2004;
    float _2080 = _2050 * _2016;
    float _2082 = _2050 * _2008;
    float _2084 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2074);
    float _2086 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2076);
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = floor(_2034);
    float _2092 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2084);
    float _2094 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2096 = -_2088;
    float _2098 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2096);
    float _2100 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1868);
    float _2102 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2106 = -_2082;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2098);
    float _2110 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2100);
    float _2112 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2104);
    float _2116 = fma(_2108, -0.5, 0.5);
    float _2118 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2120 = exp2(_2112);
    float _2122 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2114);
    float _2124 = fma(_2108, 0.5, 0.5);
    float _2126 = -_2090;
    float _2128 = _2034 + _2126;
    float _2130 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2122);
    float _2134 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2136 = _2080 + 1.0;
    float _2138 = log2(_2072);
    float _2140 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2142 = fma(_2124, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2144 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2140);
    float _2146 = fma(_2124, _2142, -0.212114393711090087890625);
    float _2148 = 1.0 / _2132;
    float _2150 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2144);
    float _2152 = -_2080;
    float _2154 = fma(_2120, _2136, _2152);
    float _2156 = sqrt(_2116);
    float _2158 = _2138 * 0.693147182464599609375;
    float2 _6107 = float2(_2128, _2038);
    float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).x;
    float _2162 = fma(_2124, _2146, 1.570728778839111328125);
    float _2164 = fma(_2154, 0.5, 0.5);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2134);
    float _2170 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2168);
    float _2172 = _2150 * _2148;
    float _2174 = _2156 * 0.636619746685028076171875;
    float _2176 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2170);
    float _2178 = -_2162;
    float _2180 = fma(_2174, _2178, 1.0);
    float _2182 = _2176 * _2148;
    float _2184 = fma(_2172, 0.5, 0.5);
    float _2186 = fma(_2182, -0.5, 0.5);
    float3 _6161 = float3(_2184, _2186, _2166);
    float _2188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6161, float3(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6161, float3(0.0), isnan(_6161)), level(0.0)).x;
    float3 _6172 = float3(_2184, _2186, _2166);
    float4 _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6172, float3(0.0), isnan(_6172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6172, float3(0.0), isnan(_6172)), level(0.0)).xyzw;
    float _2193 = _2191.x;
    float _2195 = _2191.y;
    float _2197 = _2191.z;
    float _2199 = _2191.w;
    float2 _6188 = float2(_2180, _2164);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_79.x = _1862;
    out.m_79.y = _1858;
    out.m_79.z = _1866;
    float _2213 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    float _2215 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2213);
    float _2217 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2219 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2221 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2217);
    float _2223 = 1.0 / _2219;
    float _2225 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2221);
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2229 = _2227 + _2219;
    float _2231 = _2229 * _2223;
    float _2233 = _2231 * 0.5;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2237 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2235);
    float _2239 = 1.0 / _2237;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2243 = _2239 * _2241;
    float _2245 = abs(_2243);
    float _2247 = log2(_2245);
    float _2249 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2251 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan(0.5);
    bool _2259 = _2255 || _2257;
    float _2261 = exp2(_2249);
    float _2263 = _2066;
    float _2265 = _2094;
    float _2267 = _2132;
    float _2269 = _2176;
    if (!_2259)
    {
        _1794 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2271 = _1794;
    float _2273 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2279 = _2271;
    if (!_2259)
    {
        float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2283 = _2271 + _2281;
        _2279 = _2283;
    }
    float _2285 = _2279;
    if (_2259)
    {
        _2263 = 1.0;
    }
    float _2287 = _2263;
    float _2289 = fma(_2275, -2.0, 3.0);
    float _2291 = _2275 * _2275;
    float _2293 = _2184;
    float _2295 = _2287;
    if (!_2259)
    {
        float _2297 = 1.0 / _2285;
        _2293 = _2297;
    }
    float _2299 = _2293;
    float _2301 = in.m_81.x;
    float _2303 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2305 = _2291 * _2289;
    if (!_2259)
    {
        float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2309 = _2243 + _2307;
        _2265 = _2309;
    }
    float _2311 = _2265;
    float _2313 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2303);
    float _2315 = -_2305;
    float _2317 = _2315 + 1.0;
    float _2319 = exp2(_2277);
    float _2321 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2313);
    float _2323 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2305);
    bool _2325 = _2243 <= 8000.0;
    bool _2327 = isnan(_2243);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(8000.0);
    bool _2333 = _2329 || _2331;
    float _2335 = float(_2333);
    float _2337 = _2150 + _2132;
    float _2339 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2341 = _2132 * 0.5;
    if (!_2259)
    {
        float _2343 = _2311 * _2299;
        float _2345 = precise::clamp(_2343, 0.0, 1.0);
        _2295 = _2345;
    }
    float _2347 = _2295;
    float _2349 = _2335 * _2323;
    float _2351 = _2339 + _2132;
    float _2353 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2355 = _2337 * 0.5;
    float _2357 = _2351 * 0.5;
    float _2359 = -_2319;
    float _2361 = _2359 + 1.0;
    float _2363 = fma(_2176, -0.5, _2341);
    bool _2365 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2367 = isnan(_1878);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2373 = _2369 || _2371;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2176;
    out.gl_Position.z = _2339;
    out.gl_Position.w = _2132;
    float _2375 = _2361 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2355;
    out.m_83.y = _2363;
    out.m_83.z = _2357;
    out.m_83.w = _2132;
    float _2377 = -_2375;
    float _2379 = _2377 + 1.0;
    float _2381 = _2379;
    if (!_2373)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2383 = _1906;
    float _2385 = _2383;
    float _2387 = _2383;
    if (!_2373)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2389 = _2267;
    float _2391 = _2389;
    float _2393 = _2389;
    if (!_2373)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2395 = _2269;
    float _2397 = _2395;
    float _2399 = _2395;
    if (!_2373)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2401 = _1908;
    float _2403 = -_2160;
    float _2405 = _2403 + 1.0;
    float _2407 = _2405 * _2353;
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = -_2409;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2415 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2417 = _2413 * _2301;
    float _2419 = _2417 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2419;
    float _2421 = _2375 * _2188;
    float _2423 = _2199 * _2379;
    float _2425 = _2401;
    float _2427 = _2401;
    if (!_2373)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2429 = _2381;
    float _2431 = _2199 * _2421;
    float _2433 = _2209 * _2421;
    float _2435 = fma(_2205, _2431, _2193);
    float _2437 = fma(_2207, _2431, _2195);
    float _2439 = fma(_2199, _2433, _2197);
    float _2441 = _2431;
    float _2443 = _2429;
    float _2445 = _2429;
    if (!_2373)
    {
        _2441 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2447 = _2441;
    out.m_87.x = _2435;
    out.m_87.y = _2437;
    out.m_87.z = _2439;
    out.m_87.w = _2423;
    bool _2449 = !_2373;
    float _2451 = _2447;
    float _2453 = _2447;
    if (!_2449)
    {
        bool _2455 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2457 = isnan(_1878);
        bool _2459 = _2455 || _2457;
        bool _2461 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2463 = _2459 || _2461;
        if (!_2463)
        {
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2467 = _1878 + _2465;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2471 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2477 = 1.0 / _2471;
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2495 = _2467 * _2477;
            float _2497 = precise::clamp(_2495, 0.0, 1.0);
            float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2503 = fma(_2497, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2505 = fma(_2497, _2501, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2507 = fma(_2497, _2481, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2509 = fma(_2497, _2485, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2511 = fma(_2497, _2489, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2513 = fma(_2497, _2493, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2393 = _2503;
            _2453 = _2511;
            _2387 = _2507;
            _2427 = _2509;
            _2399 = _2505;
            _2445 = _2513;
            _2515 = true;
        }
        else
        {
            bool _2517 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2519 = isnan(_1878);
            bool _2521 = _2517 || _2519;
            bool _2523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2525 = _2521 || _2523;
            if (!_2525)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2527 = _2385;
            _2387 = _2527;
            if (!_2525)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2529 = _2391;
            _2393 = _2529;
            if (!_2525)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2531 = _2397;
            _2399 = _2531;
            if (!_2525)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2533 = _2425;
            _2427 = _2533;
            if (!_2525)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2535 = _2451;
            _2453 = _2535;
            if (!_2525)
            {
                _2443 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2537 = _2443;
            bool _2539 = !_2525;
            _2445 = _2537;
            if (!_2539)
            {
                bool _2541 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2543 = isnan(_1878);
                bool _2545 = _2541 || _2543;
                bool _2547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2549 = _2545 || _2547;
                if (!_2549)
                {
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2553 = _1878 + _2551;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2557 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2563 = 1.0 / _2557;
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2581 = _2553 * _2563;
                    float _2583 = precise::clamp(_2581, 0.0, 1.0);
                    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2589 = fma(_2583, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2591 = fma(_2583, _2587, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2593 = fma(_2583, _2567, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2595 = fma(_2583, _2571, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2597 = fma(_2583, _2575, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2599 = fma(_2583, _2579, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2393 = _2589;
                    _2453 = _2597;
                    _2387 = _2593;
                    _2427 = _2595;
                    _2399 = _2591;
                    _2445 = _2599;
                    _2515 = true;
                }
                else
                {
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2445 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2515 = false;
    float _2601 = _2393;
    float _2603 = _2453;
    float _2605 = _2387;
    float _2607 = _2427;
    float _2609 = _2399;
    float _2611 = _2445;
    float _2613 = _2415 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2615 = fma(_1642, -0.5, 0.5);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = -_2601;
    float _2621 = _2619 + _2603;
    float _2623 = -_2605;
    float _2625 = _2623 + _2607;
    out.m_51.x = _2613;
    float _2627 = -_2609;
    float _2629 = _2627 + _2611;
    float _2631 = fma(_2617, _2621, _2601);
    float _2633 = fma(_2617, _2625, _2605);
    bool _2635 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2637 = _2631 * 0.586610972881317138671875;
    float _2639 = fma(_2617, _2629, _2609);
    out.m_89.x = 0.0;
    bool _2641 = _2347 > 0.0;
    bool _2643 = isnan(_2347);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2633, 0.298911988735198974609375, _2637);
    float _2653 = fma(_2639, 0.114477999508380889892578125, _2651);
    float _2655 = -_2653;
    float _2657 = _2633 + _2655;
    float _2659 = -_2653;
    float _2661 = _2631 + _2659;
    float _2663 = -_2653;
    float _2665 = _2639 + _2663;
    float _2667 = fma(_2657, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    float _2669 = fma(_2661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    float _2671 = fma(_2665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    bool _2673 = !_2635;
    if (!_2673)
    {
        float _2675 = -_1848;
        float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2679 = -_1850;
        float _2681 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2683 = -_1852;
        float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2687 = _2677 * _2677;
        float _2689 = fma(_2681, _2681, _2687);
        float _2691 = fma(_2685, _2685, _2689);
        float _2693 = sqrt(_2691);
        float _2695 = rsqrt(_2691);
        float _2697 = -_2693;
        float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2701 = _2699 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2703 = precise::clamp(_2701, 0.0, 1.0);
        float _2705 = _2681 * _2695;
        float _2707 = _2677 * _2695;
        float _2709 = abs(_2703);
        float _2711 = log2(_2709);
        float _2713 = _2685 * _2695;
        float _2715 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2717 = _1642 * _2707;
        float _2719 = -_2707;
        float _2721 = -_2715;
        float _2723 = fma(_2719, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2721);
        float _2725 = fma(_1638, _2705, _2717);
        float _2727 = -_2713;
        float _2729 = fma(_2727, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2723);
        float _2731 = fma(_1658, _2713, _2725);
        float _2733 = precise::clamp(_2731, 0.0, 1.0);
        float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2737 = _2729 + _2735;
        float _2739 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2741 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = exp2(_2739);
        float _2747 = _2745 * _2743;
        float _2749 = _2733 * _2747;
        float _2751 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2753 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2755 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2751;
        out.m_89.y = _2753;
        out.m_89.z = _2755;
    }
    out.m_91.x = _2667;
    out.m_91.y = _2669;
    out.m_91.z = _2671;
    if (_2649)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2757 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2757;
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
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2515 = false;
    bool _1704 = false;
    bool _628 = false;
    bool _404 = false;
    bool _188 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_48.w;
    float _107 = trunc(_105);
    int _110 = int(_107);
    bool _114 = _110 >= 1;
    float _116 = 0.0;
    float _118 = as_type<float>(_110);
    if (!_114)
    {
        _116 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _120 = _116;
    if (!_114)
    {
        out.m_51.x = 0.0;
    }
    int _122 = 0;
    if (!_114)
    {
        float _124 = _120 * 5.0;
        _122 = as_type<int>(_124);
    }
    int _126 = _122;
    if (!_114)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2814 = as_type<float>(_126);
        out.gl_Position.z = _2814;
    }
    if (!_114)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    float _130 = float(_110);
    float _132 = -_128;
    float _134 = _132 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _136 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_128);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    bool _146 = _134 >= _130;
    bool _148 = !_144;
    bool _150 = _146 || _148;
    float _152 = _134;
    if (_150)
    {
        _118 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _154 = _118;
    if (_150)
    {
        out.m_51.x = 0.0;
    }
    int _156 = 0;
    if (_150)
    {
        float _158 = _154 * 5.0;
        _156 = as_type<int>(_158);
    }
    int _160 = _156;
    if (_150)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2878 = as_type<float>(_160);
        out.gl_Position.z = _2878;
    }
    if (_150)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _130;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _134 * _162;
    bool _168 = !_164;
    float _186;
    if (!_168)
    {
        float _170 = in.m_55.x;
        float _172 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _174 = _170 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _176 = fma(_174, (*spvDescriptorSet0.vp_c9)._m0[12].x, _134);
        float _178 = _176 * _172;
        float _180 = floor(_178);
        float _182 = -_180;
        float _184 = _178 + _182;
        _186 = _184;
        _188 = true;
    }
    else
    {
        _186 = _166;
    }
    _188 = false;
    float _190 = _186;
    float _192 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _194 = _190 + _192;
    float _196 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _198 = _190 + _196;
    bool _200 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _202 = isnan(_190);
    bool _204 = _200 || _202;
    bool _206 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _208 = _204 || _206;
    float _210 = float(_208);
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _212;
    float _216 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _218 = _190 + _216;
    float _220 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _222 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _220;
    float _224 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _226 = _224 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _228 = 1.0 / _214;
    bool _230 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _232 = 1.0 / _226;
    float _234 = 1.0 / _222;
    float _236 = _194 * _228;
    bool _238 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _240 = isnan(_190);
    bool _242 = _238 || _240;
    bool _244 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _246 = _242 || _244;
    float _248 = float(_246);
    float _250 = -_210;
    float _252 = _250 + 1.0;
    float _254 = _248 * _252;
    float _256 = _198 * _232;
    bool _258 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _260 = isnan(_190);
    bool _262 = _258 || _260;
    bool _264 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _266 = _262 || _264;
    float _268 = float(_266);
    float _270 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _272 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _270;
    bool _274 = _190 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _276 = isnan(_190);
    bool _278 = _274 || _276;
    bool _280 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _282 = _278 || _280;
    float _284 = float(_282);
    float _286 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _288 = _286 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _290 = -_248;
    float _292 = _290 + 1.0;
    float _294 = -_268;
    float _296 = _294 + 1.0;
    float _298 = _218 * _234;
    float _300 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _302 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _300;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _306 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _304;
    float _308 = _284 * _296;
    float _310 = fma(_272, _298, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _312 = fma(_302, _298, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _314 = fma(_306, _298, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _316 = _268 * _292;
    float _318 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _320 = _318 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _322 = _312 * _308;
    float _324 = _314 * _308;
    float _326 = _310 * _308;
    float _328 = -_284;
    float _330 = _328 + 1.0;
    float _332 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _334 = _332 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _336 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].x, _324);
    float _338 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].y, _322);
    float _340 = fma(_288, _256, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _342 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[143].z, _326);
    float _344 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _344;
    float _348 = fma(_334, _256, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _350 = fma(_320, _256, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _352 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _354 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _352;
    float _356 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _358 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _356;
    float _360 = fma(_340, _316, _336);
    float _362 = fma(_346, _236, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _364 = fma(_354, _236, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _366 = fma(_358, _236, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _368 = fma(_348, _316, _338);
    float _370 = fma(_350, _316, _342);
    float _372 = fma(_362, _254, _360);
    float _374 = fma(_364, _254, _368);
    float _376 = fma(_366, _254, _370);
    float _378 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].x, _372);
    float _380 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].y, _374);
    float _382 = fma(_210, (*spvDescriptorSet0.vp_c9)._m0[146].z, _376);
    bool _384 = !_230;
    float _402;
    if (!_384)
    {
        float _386 = in.m_55.x;
        float _388 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _390 = _386 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _392 = fma(_390, (*spvDescriptorSet0.vp_c9)._m0[11].y, _134);
        float _394 = _392 * _388;
        float _396 = floor(_394);
        float _398 = -_396;
        float _400 = _394 + _398;
        _402 = _400;
        _404 = true;
    }
    else
    {
        _402 = _166;
    }
    _404 = false;
    float _406 = _402;
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _410 = _406 + _408;
    float _412 = in.m_57.x;
    float _414 = in.m_57.y;
    float _416 = in.m_57.z;
    float _418 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _420 = _418 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _422;
    float _426 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _428 = _426 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _430 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _432 = isnan(_406);
    bool _434 = _430 || _432;
    bool _436 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _438 = _434 || _436;
    float _440 = float(_438);
    float _442 = 1.0 / _420;
    float _444 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _446 = _444 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _448 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _450 = isnan(_406);
    bool _452 = _448 || _450;
    bool _454 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _456 = _452 || _454;
    float _458 = float(_456);
    bool _460 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _462 = 1.0 / _428;
    float _464 = _424 * _442;
    bool _466 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _468 = isnan(_406);
    bool _470 = _466 || _468;
    bool _472 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _474 = _470 || _472;
    float _476 = float(_474);
    float _478 = 1.0 / _446;
    float _480 = -_440;
    float _482 = _480 + 1.0;
    float _484 = fma(_464, _410, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _486 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _488 = _486 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _490 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _492 = isnan(_406);
    bool _494 = _490 || _492;
    bool _496 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _498 = _494 || _496;
    float _500 = float(_498);
    float _502 = -_476;
    float _504 = _502 + 1.0;
    float _506 = _476 * _482;
    float _508 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _510 = _508 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _512 = 1.0 / _488;
    float _514 = -_500;
    float _516 = _514 + 1.0;
    float _518 = _458 * _504;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _522 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _520;
    float _524 = _510 * _462;
    float _526 = _440 * _516;
    float _528 = _484 * _518;
    float _530 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _532 = _406 + _530;
    float _534 = -_458;
    float _536 = _534 + 1.0;
    bool _538 = _406 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _540 = isnan(_406);
    bool _542 = _538 || _540;
    bool _544 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _546 = _542 || _544;
    float _548 = float(_546);
    float _550 = _522 * _478;
    float _552 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _554 = _552 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _556 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _558 = _406 + _556;
    float _560 = fma(_524, _532, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _562 = fma(_536, (*spvDescriptorSet0.vp_c9)._m0[115].x, _528);
    float _564 = -_548;
    float _566 = _564 + 1.0;
    float _568 = _554 * _512;
    float _570 = fma(_550, _558, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _572 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _574 = _406 + _572;
    float _576 = fma(_560, _506, _562);
    float _578 = _500 * _566;
    float _580 = fma(_568, _574, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _582 = fma(_570, _526, _576);
    float _584 = _382 * _416;
    float _586 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _588 = fma(_580, _578, _582);
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _592 = _586 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _594 = fma(_548, (*spvDescriptorSet0.vp_c9)._m0[119].x, _588);
    float _596 = _380 * _414;
    float _598 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _600 = _590 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _602 = _594 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _604 = _378 * _412;
    float _606 = _598 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_59.x = _592;
    out.m_59.y = _600;
    out.m_59.z = _606;
    out.m_59.w = _602;
    bool _608 = !_460;
    float _626;
    if (!_608)
    {
        float _610 = in.m_55.x;
        float _612 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _614 = _610 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _616 = fma(_614, (*spvDescriptorSet0.vp_c9)._m0[11].w, _134);
        float _618 = _616 * _612;
        float _620 = floor(_618);
        float _622 = -_620;
        float _624 = _618 + _622;
        _626 = _624;
        _628 = true;
    }
    else
    {
        _626 = _166;
    }
    _628 = false;
    float _630 = _626;
    float _632 = in.m_55.x;
    float _634 = in.m_55.y;
    float _636 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _638 = log2(_636);
    float _640 = in.m_55.z;
    int _642 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _644 = _642 != 0;
    float _646 = _584 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _648 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _650 = in.m_55.w;
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _656 = _654 != 0;
    int _658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _660 = _658 != 0;
    int _662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _664 = _662 != 0;
    float _666 = in.m_61.y;
    float _668 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _670 = _638 * _134;
    float _672 = in.m_63.x;
    float _674 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _676 = _632 * 2.0;
    float _678 = _634 * 2.0;
    float _680 = _634 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _682 = _632 + (-0.5);
    float _684 = _640 * 2.0;
    float _686 = exp2(_670);
    float _688 = fma(_680, -2.0, _652);
    float _690 = _652;
    float _692 = _648;
    bool _694 = _660;
    if (!_644)
    {
        _690 = _634;
    }
    float _696 = _690;
    float _698 = _696;
    if (_644)
    {
        _698 = _632;
    }
    float _700 = _698;
    float _702 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[76].y, _688);
    float _704 = floor(_684);
    float _706 = _674 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _708 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _710 = floor(_676);
    float _712 = _632 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _714 = -_686;
    float _716 = _714 + 1.0;
    float _718 = -_648;
    float _720 = fma(_712, 2.0, _718);
    float _722 = _712;
    if (!_644)
    {
        _722 = _640;
    }
    float _724 = _722;
    float _726 = floor(_678);
    bool _728 = _704 > 0.0;
    float _730 = -_134;
    float _732 = fma(_730, (*spvDescriptorSet0.vp_c9)._m0[76].x, _720);
    bool _734 = _704 >= 0.0;
    bool _736 = isnan(_704);
    bool _738 = _734 || _736;
    bool _740 = isnan(0.0);
    bool _742 = _738 || _740;
    float _744 = _724;
    if (!_644)
    {
        _692 = _640;
    }
    float _746 = _692;
    float _748 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _750 = _710 >= 0.0;
    bool _752 = isnan(_710);
    bool _754 = _750 || _752;
    bool _756 = isnan(0.0);
    bool _758 = _754 || _756;
    float _760 = _746;
    if (_644)
    {
        _744 = _634;
    }
    float _762 = _744;
    if (_644)
    {
        _760 = _634;
    }
    float _764 = _760;
    bool _766 = _710 > 0.0;
    float _768 = _762 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _770 = _742 ? 0 : 1;
    float _772 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[83].w, _668);
    int _774 = _758 ? 0 : 1;
    bool _776 = _726 > 0.0;
    float _778 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].w, _772);
    bool _780 = _726 >= 0.0;
    bool _782 = isnan(_726);
    bool _784 = _780 || _782;
    bool _786 = isnan(0.0);
    bool _788 = _784 || _786;
    float _790 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    int _792 = _788 ? 0 : 1;
    float _794 = fma(_700, (*spvDescriptorSet0.vp_c9)._m0[83].z, _790);
    float _796 = _700 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _800 = ~_770;
    int _802 = _800 + 1;
    int _804 = _802 + 1;
    float _806 = -_708;
    float _808 = fma(_796, 2.0, _806);
    float _810 = fma(_768, -2.0, _798);
    int _812 = ~_792;
    int _814 = _812 + 1;
    int _816 = _814 + 1;
    float _818 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[81].y, _810);
    int _820 = _804;
    int _822 = _816;
    if (!_728)
    {
        int _824 = ~_770;
        int _826 = _824 + 1;
        _820 = _826;
    }
    int _828 = _820;
    float _830 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    if (!_776)
    {
        int _832 = ~_792;
        int _834 = _832 + 1;
        _822 = _834;
    }
    int _836 = _822;
    float _838 = _134 * 0.1500000059604644775390625;
    bool _840 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _842 = isnan(1.0);
    bool _844 = _840 || _842;
    bool _846 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _848 = _844 || _846;
    float _850 = fma(_632, (*spvDescriptorSet0.vp_c9)._m0[78].z, _830);
    float _852 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _854 = 1.0 + _852;
    float _856 = in.m_48.x;
    float _858 = in.m_48.y;
    float _860 = in.m_48.z;
    int _862 = ~_774;
    int _864 = _862 + 1;
    int _866 = _864 + 1;
    float _868 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].z, _850);
    int _870 = _866;
    if (!_766)
    {
        int _872 = ~_774;
        int _874 = _872 + 1;
        _870 = _874;
    }
    int _876 = _870;
    float _878 = 1.0 / _854;
    bool _880 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _882 = isnan(0.0);
    bool _884 = _880 || _882;
    bool _886 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _888 = _884 || _886;
    int _890 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _892 = _890 != 0;
    float _894 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _896 = _888 ? _716 : 0.0;
    float _898 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[82].z, _794);
    float _900 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[78].w, _894);
    float _902 = _166 * _166;
    int _904 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _906 = _904 != 0;
    float _908 = fma(_134, (*spvDescriptorSet0.vp_c9)._m0[77].w, _900);
    float _910 = -_134;
    float _912 = fma(_910, (*spvDescriptorSet0.vp_c9)._m0[81].x, _808);
    float _914 = _908;
    if (_848)
    {
        float _916 = _896 * _878;
        _152 = _916;
    }
    float _918 = _152;
    float _920 = _166 * _902;
    bool _922 = !_656;
    int _924 = _922 ? 0 : 1;
    float _926 = _858 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _928 = _650 > 0.5;
    float _930 = fma(_166, -0.699999988079071044921875, 1.0);
    float _932 = _858 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _934 = _858 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _936 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[5].x, _926);
    float _938 = _634 + _640;
    float _940 = in.m_63.y;
    int _942 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _944 = _942 != 0;
    float _946 = _634 + _632;
    int _948 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _950 = _948 != 0;
    float _952 = _938 + (-1.0);
    int _954 = abs(_924);
    float _956 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[4].x, _932);
    float _958 = fma(_856, (*spvDescriptorSet0.vp_c10)._m0[6].x, _934);
    float _960 = _946 + (-1.0);
    float _962 = float(_828);
    float _964 = fma(_952, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _966 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[5].z, _936);
    bool _968 = !_660;
    int _970 = _968 ? 0 : 1;
    float _972 = fma(_960, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _974 = float(_954);
    float _976 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[4].z, _956);
    bool _978 = !_664;
    int _980 = _978 ? 0 : 1;
    float _982 = fma(_860, (*spvDescriptorSet0.vp_c10)._m0[6].z, _958);
    int _984 = abs(_970);
    float _986 = _974 * _962;
    int _988 = abs(_980);
    float _990 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _992 = in.m_65.x;
    float _994 = in.m_65.y;
    float _996 = in.m_65.z;
    float _998 = float(_984);
    float _1000 = _986 * (-2.0);
    float _1002 = float(_876);
    float _1004 = float(_988);
    float _1006 = fma(_972, _1000, _972);
    float _1008 = float(_836);
    float _1010 = _998 * _1002;
    float _1012 = fma(_940, 13.0, _838);
    float _1014 = _1004 * _1008;
    float _1016 = fma(_632, 6.283185482025146484375, _1012);
    float _1018 = _966 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1020 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1022 = _1020 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _1024 = _976 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1026 = _1016 * 0.15915493667125701904296875;
    float _1028 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1030 = _1018 + _1028;
    float _1032 = _982 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1034 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1036 = _1024 + _1034;
    float _1038 = _1030 * _1030;
    float _1040 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1042 = _1032 + _1040;
    float _1044 = fma(_1000, _992, _992);
    float _1046 = _1010 * (-2.0);
    float _1048 = fma(_1036, _1036, _1038);
    float _1050 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1052 = _1050 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1054 = fma(_682, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1044);
    float _1056 = fma(_964, _1046, _964);
    float _1058 = fma(_1042, _1042, _1048);
    float _1060 = fma(_1006, _918, _1054);
    float _1062 = 1.0 / _1052;
    float _1064 = _632 + _640;
    bool _1066 = _634 > 0.5;
    float _1068 = _1060 * 0.15915493667125701904296875;
    float _1070 = fma(_1046, _994, _994);
    float _1072 = _634 + (-0.5);
    float _1074 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1076 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1074;
    float _1078 = rsqrt(_1058);
    float _1080 = _1064 + (-1.0);
    float _1082 = _1014 * (-2.0);
    float _1084 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1070);
    bool _1086 = _1066;
    float _1088 = _990;
    if (_892)
    {
        bool _1090 = _640 > 0.5;
        _694 = _1090;
    }
    bool _1092 = _694;
    float _1094 = fma(_1080, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1096 = fma(_1082, _996, _996);
    float _1098 = fma(_1056, _918, _1084);
    float _1100 = 1.0 / _1022;
    float _1102 = _1076 * _1062;
    float _1104 = _640 + (-0.5);
    float _1106 = fma(_1094, _1082, _1094);
    float _1108 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1110 = _1108 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1112 = _1062;
    if (_906)
    {
        float _1114 = in.m_55.x;
        _1112 = _1114;
    }
    float _1116 = _1112;
    float _1118 = fma(_1104, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1096);
    float _1120 = _1098 * 0.15915493667125701904296875;
    float _1122 = _1030 * _1078;
    float _1124 = _1036 * _1078;
    float _1126 = fma(_1106, _918, _1118);
    float _1128 = -_940;
    float _1130 = _1128 + 1.0;
    float _1132 = -_1122;
    float _1134 = fma(_1132, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1030);
    float _1136 = -_1124;
    float _1138 = fma(_1136, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1036);
    float _1140 = _1126 * 0.15915493667125701904296875;
    float _1142 = _1026 * 6.283185482025146484375;
    float _1144 = sin(_1142);
    float _1146 = _1110 * _1100;
    float _1148 = _1134 * _1134;
    float _1150 = _1042 * _1078;
    float _1152 = in.m_61.z;
    float _1154 = fma(_1138, _1138, _1148);
    float _1156 = -_1150;
    float _1158 = fma(_1156, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1042);
    float _1160 = _1066 ? _1130 : _940;
    float _1162 = _1068 * 6.283185482025146484375;
    float _1164 = sin(_1162);
    int _1166 = _928 ? as_type<int>(_1130) : as_type<int>(_940);
    float _1168 = fma(_1158, _1158, _1154);
    float _1170 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1172 = _630 + _1170;
    float _1174 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1176 = _630 + _1174;
    float _1178 = _950 ? as_type<float>(_1166) : _940;
    float _1180 = _1160;
    float _1182 = _1150;
    if (_906)
    {
        bool _1184 = _1116 > 0.5;
        _1086 = _1184;
    }
    bool _1186 = _1086;
    float _1188 = _1068 * 6.283185482025146484375;
    float _1190 = cos(_1188);
    float _1192 = fma(_1102, _1176, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1194 = _990 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1196 = _1120 * 6.283185482025146484375;
    float _1198 = sin(_1196);
    float _1200 = _944 ? _1160 : _940;
    float _1202 = fma(_1146, _1172, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _1204 = _920 * 0.100000001490116119384765625;
    float _1206 = in.m_61.x;
    if (!_906)
    {
        _1180 = _672;
    }
    float _1208 = _1180;
    float _1210 = fma(_1194, _1200, -0.5);
    float _1212 = _1144 * _1204;
    float _1214 = _1120 * 6.283185482025146484375;
    float _1216 = cos(_1214);
    float _1218 = _1208;
    if (!_906)
    {
        _1088 = _1208;
    }
    float _1220 = _1088;
    float _1222 = -_702;
    float _1224 = fma(_908, _1210, _1222);
    float _1226 = fma(_930, _666, _1212);
    bool _1228 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1230 = isnan(_630);
    bool _1232 = _1228 || _1230;
    bool _1234 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1236 = _1232 || _1234;
    float _1238 = float(_1236);
    float _1240 = _1220;
    if (_906)
    {
        _1218 = _672;
    }
    float _1242 = _1218;
    float _1244 = _1140 * 6.283185482025146484375;
    float _1246 = cos(_1244);
    float _1248 = _1190 * _1198;
    bool _1250 = _1226 != 0.0;
    bool _1252 = isnan(_1226);
    bool _1254 = _1250 || _1252;
    bool _1256 = isnan(0.0);
    bool _1258 = _1254 || _1256;
    int _1260 = 0;
    if (_906)
    {
        float _1262 = -_1242;
        float _1264 = _1262 + 1.0;
        _1260 = as_type<int>(_1264);
    }
    int _1266 = _1260;
    int _1268 = 0;
    if (_892)
    {
        float _1270 = -_1242;
        float _1272 = _1270 + 1.0;
        _1268 = as_type<int>(_1272);
    }
    int _1274 = _1268;
    float _1276 = 0.0;
    if (!_892)
    {
        _1276 = _1242;
    }
    float _1278 = _1276;
    float _1280 = sqrt(_1168);
    float _1282 = _1190 * _1216;
    float _1284 = _1164 * _1216;
    float _1286 = _1278;
    if (_906)
    {
        float _1288 = _1186 ? as_type<float>(_1266) : _1242;
        _1240 = _1288;
    }
    float _1290 = _1240;
    if (_892)
    {
        float _1292 = _1092 ? as_type<float>(_1274) : _1242;
        _1286 = _1292;
    }
    float _1294 = _1286;
    bool _1296 = _1206 == 0.0;
    bool _1298 = !_1258;
    bool _1300 = _1296 && _1298;
    float _1302 = _1140 * 6.283185482025146484375;
    float _1304 = sin(_1302);
    float _1306 = _1216 * _1246;
    float _1308 = _1190 * _1246;
    float _1310 = _1198 * _1246;
    bool _1312 = _1152 == 0.0;
    bool _1314 = _1312 && _1300;
    float _1316 = fma(_706, _1290, -0.5);
    float _1318 = _1078 * _1280;
    float _1320 = _1164 * _1198;
    float _1322 = _1164 * _1246;
    float _1324 = _596 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1326 = _1318 * _646;
    float _1328 = fma(_1304, _1282, _1320);
    float _1330 = fma(_1304, _1320, _1282);
    float _1332 = _604 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1334 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1226);
    float _1336 = _1318 * _1324;
    float _1338 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1206);
    float _1340 = _1318 * _1332;
    float _1342 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _1152);
    float _1344 = _1334 * _1336;
    float _1346 = -_1248;
    float _1348 = fma(_1304, _1284, _1346);
    float _1350 = _1338 * _1340;
    float _1352 = _1342 * _1326;
    float _1354 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1356 = _1308 * _1344;
    float _1358 = -_1344;
    float _1360 = _1304 * _1358;
    float _1362 = _1322 * _1344;
    float _1364 = -_1284;
    float _1366 = fma(_1304, _1248, _1364);
    float _1368 = fma(_1328, _1350, _1356);
    float _1370 = fma(_1306, _1350, _1360);
    float _1372 = fma(_1348, _1350, _1362);
    bool _1374 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1376 = isnan(_630);
    bool _1378 = _1374 || _1376;
    bool _1380 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1382 = _1378 || _1380;
    float _1384 = float(_1382);
    float _1386 = -_1238;
    float _1388 = _1386 + 1.0;
    float _1390 = fma(_1366, _1352, _1368);
    float _1392 = fma(_1310, _1352, _1370);
    float _1394 = fma(_1330, _1352, _1372);
    float _1396 = _1384 * _1388;
    float _1398 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1400 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1402 = _1354 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    bool _1404 = _630 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1406 = isnan(_630);
    bool _1408 = _1404 || _1406;
    bool _1410 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1412 = _1408 || _1410;
    float _1414 = float(_1412);
    float _1416 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1398);
    float _1418 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1400);
    float _1420 = fma(_1402, _1178, -0.5);
    float _1422 = -_1384;
    float _1424 = _1422 + 1.0;
    float _1426 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1416);
    float _1428 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1418);
    float _1430 = -_818;
    float _1432 = fma(_778, _1420, _1430);
    float _1434 = _1414 * _1424;
    float _1436 = _1024 + _1426;
    float _1438 = _1032 + _1428;
    float _1440 = fma(_868, _1316, _732);
    float _1442 = _1192 * _1434;
    float _1444 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1446 = _1436 + _1444;
    float _1448 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1450 = _1438 + _1448;
    float _1452 = in.m_67.x;
    float _1454 = in.m_67.y;
    float _1456 = in.m_67.z;
    float _1458 = _1390 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1460 = _1446 * _1446;
    float _1462 = _1450 * _1450;
    float _1464 = -_1414;
    float _1466 = _1464 + 1.0;
    float _1468 = fma(_1392, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1458);
    float _1470 = _1460 + _1462;
    float _1472 = fma(_1466, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1442);
    float _1474 = fma(_1394, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1468);
    float _1476 = _748 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1478 = sqrt(_1470);
    float _1480 = fma(_1202, _1396, _1472);
    float _1482 = _1018 + _1474;
    float _1484 = fma(_1476, _1294, -0.5);
    float _1486 = fma(_1238, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1480);
    float _1488 = fma(_898, _1484, _912);
    float _1490 = _1454;
    float _1492 = _1452;
    float _1494 = _1456;
    float _1496 = _1460;
    float _1498 = _1462;
    float _1500 = _1436;
    float _1502 = _1438;
    float _1504 = _1488;
    float _1506 = _1318;
    float _1508 = _1390;
    if (!_1314)
    {
        float _1510 = fma(_1226, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1454);
        _1490 = _1510;
    }
    float _1512 = _1490;
    if (!_1314)
    {
        float _1514 = fma(_1206, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1452);
        _1492 = _1514;
    }
    float _1516 = _1492;
    if (!_1314)
    {
        float _1518 = fma(_1152, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1456);
        _1494 = _1518;
    }
    float _1520 = _1494;
    bool _1522 = _1478 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1524 = -_1512;
    float _1526 = _1304 * _1524;
    float _1528 = _1308 * _1512;
    float _1530 = _1322 * _1512;
    float _1532 = fma(_1306, _1516, _1526);
    float _1534 = fma(_1328, _1516, _1528);
    float _1536 = fma(_1348, _1516, _1530);
    float _1538 = fma(_1310, _1520, _1532);
    float _1540 = fma(_1366, _1520, _1534);
    float _1542 = fma(_1330, _1520, _1536);
    if (!_1522)
    {
        _914 = _1482;
    }
    float _1544 = _914;
    bool _1546 = !_1522;
    float _1548 = _1544;
    if (!_1546)
    {
        float _1550 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1552 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1554 = _1478 + _1552;
        float _1556 = rsqrt(_1470);
        float _1558 = _1554 * _1550;
        float _1560 = _1482 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1562 = _1558 * 0.15915493667125701904296875;
        float _1564 = _1562 * 6.283185482025146484375;
        float _1566 = sin(_1564);
        float _1568 = _1562 * 6.283185482025146484375;
        float _1570 = cos(_1568);
        float _1572 = fma(_1566, _1560, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1574 = _1556 * _1572;
        float _1576 = _1570 + (-1.0);
        float _1578 = fma(_1446, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1580 = fma(_1450, _1574, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1582 = _1576 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1584 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1586 = _1578 + _1584;
        float _1588 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1590 = _1580 + _1588;
        float _1592 = fma(_1482, _1570, _1582);
        float _1594 = _1586 * _1586;
        float _1596 = _1590 * _1590;
        _1548 = _1592;
        _1496 = _1594;
        _1498 = _1596;
        _1500 = _1578;
        _1502 = _1580;
    }
    float _1598 = _1548;
    float _1600 = _1496;
    float _1602 = _1498;
    float _1604 = _1500;
    float _1606 = _1502;
    float _1608 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1610 = _1598 + _1608;
    float _1612 = in.m_69.w;
    float _1614 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1616 = fma(_1610, _1610, _1600);
    float _1618 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1620 = _1616 + _1602;
    float _1622 = _1540 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1624 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1614);
    float _1626 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1618);
    float _1628 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1630 = fma(_1538, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1622);
    float _1632 = sqrt(_1620);
    float _1634 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1636 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1638 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1624);
    float _1640 = _1224 + 0.5;
    float _1642 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1626);
    float _1644 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1646 = _1634 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1648 = _1636 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1650 = _1432 + 0.5;
    float _1652 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1654 = _1440 + 0.5;
    float _1656 = _1488 + 0.5;
    float _1658 = fma(_1542, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1630);
    out.m_71.w = _1612;
    bool _1660 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1662 = isnan(_1632);
    bool _1664 = _1660 || _1662;
    bool _1666 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1668 = _1664 || _1666;
    out.m_73.x = _1644;
    out.m_73.y = _1646;
    out.m_73.z = _1648;
    out.m_73.w = _1652;
    out.m_75.x = _1654;
    out.m_75.y = _1640;
    out.m_75.z = _1656;
    out.m_75.w = _1650;
    out.m_77.x = _1638;
    out.m_77.y = _1642;
    out.m_77.z = _1658;
    if (!_1668)
    {
        _1504 = 1.0;
    }
    float _1670 = _1504;
    bool _1672 = !_1668;
    float _1674 = _1670;
    if (!_1672)
    {
        bool _1676 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1678 = isnan(_1632);
        bool _1680 = _1676 || _1678;
        bool _1682 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1684 = _1680 || _1682;
        if (!_1684)
        {
            float _1686 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1688 = _1632 + _1686;
            float _1690 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1692 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1690;
            float _1694 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1696 = _1694 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1698 = 1.0 / _1692;
            float _1700 = _1688 * _1698;
            float _1702 = fma(_1700, _1696, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1674 = _1702;
            _1704 = true;
        }
        else
        {
            bool _1706 = _1632 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1708 = isnan(_1632);
            bool _1710 = _1706 || _1708;
            bool _1712 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1714 = _1710 || _1712;
            if (!_1714)
            {
                float _1716 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1718 = _1632 + _1716;
                float _1720 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1722 = _1720 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1724 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1726 = _1724 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1728 = 1.0 / _1722;
                float _1730 = _1718 * _1728;
                float _1732 = fma(_1730, _1726, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1674 = _1732;
                _1704 = true;
            }
            else
            {
                _1674 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1704 = false;
    float _1734 = _1674;
    float _1736 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1738 = _1604 + _1736;
    float _1740 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1742 = _1606 + _1740;
    float _1744 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1746 = _1598 + _1744;
    bool _1748 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1750 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1752 = _1748 || _1750;
    bool _1754 = isnan(0.5);
    bool _1756 = _1752 || _1754;
    float _1758 = fma(_1738, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1760 = -_1124;
    float _1762 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1024);
    float _1764 = fma(_1742, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1766 = fma(_1746, _1734, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1768 = -_1124;
    float _1770 = fma(_1768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1758);
    float _1772 = -_1150;
    float _1774 = fma(_1772, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1776 = -_1150;
    float _1778 = fma(_1776, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1764);
    float _1780 = -_1122;
    float _1782 = fma(_1780, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1766);
    float _1784 = -_1122;
    float _1786 = fma(_1784, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1018);
    float _1788 = _1782;
    float _1790 = _1778;
    float _1792 = _1738;
    float _1794 = _1774;
    if (_1756)
    {
        _1182 = _1770;
    }
    float _1796 = _1182;
    float _1798 = _1796;
    if (!_1756)
    {
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1802 = _1786 + _1800;
        float _1804 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1806 = _1762 + _1804;
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1810 = -_1024;
        float _1812 = _1810 + _1758;
        float _1814 = _1802 * _1802;
        float _1816 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1818 = _1774 + _1816;
        float _1820 = -_1018;
        float _1822 = _1820 + _1766;
        float _1824 = -_1032;
        float _1826 = _1824 + _1764;
        float _1828 = fma(_1806, _1806, _1814);
        float _1830 = 1.0 / _1318;
        float _1832 = fma(_1818, _1818, _1828);
        float _1834 = sqrt(_1832);
        float _1836 = precise::min(_1834, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1838 = _1836 * _1808;
        float _1840 = _1838 * _1830;
        float _1842 = fma(_1812, _1840, _1762);
        float _1844 = fma(_1822, _1840, _1786);
        float _1846 = fma(_1826, _1840, _1774);
        _1788 = _1844;
        _1798 = _1842;
        _1790 = _1846;
        _1792 = _1808;
    }
    float _1848 = _1788;
    float _1850 = _1798;
    float _1852 = _1790;
    float _1854 = _1792;
    float _1856 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1858 = _1848 + _1856;
    float _1860 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1862 = _1850 + _1860;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1866 = _1852 + _1864;
    float _1868 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1870 = _1858 * _1858;
    float _1872 = fma(_1862, _1862, _1870);
    float _1874 = fma(_1866, _1866, _1872);
    float _1876 = rsqrt(_1874);
    float _1878 = sqrt(_1874);
    float _1880 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1882 = _1862 * _1880;
    float _1884 = _1866 * _1880;
    float _1886 = _1882 * _1882;
    float _1888 = _1884 * _1884;
    float _1890 = _1886 + _1888;
    float _1892 = sqrt(_1890);
    bool _1894 = _1892 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1896 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1898 = _1892 + _1896;
    float _1900 = _1032;
    float _1902 = _1890;
    float _1904 = _1898;
    float _1906 = _1866;
    float _1908 = _1858;
    if (_1894)
    {
        float _1910 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1900 = _1910;
    }
    float _1912 = _1900;
    if (_1894)
    {
        float _1914 = rsqrt(_1890);
        _1902 = _1914;
    }
    float _1916 = _1902;
    float _1918 = _1916;
    if (_1894)
    {
        float _1920 = _1898 * _1912;
        _1904 = _1920;
    }
    float _1922 = _1904;
    if (_1894)
    {
        float _1924 = _1922 * 0.15915493667125701904296875;
        _1506 = _1924;
    }
    float _1926 = _1506;
    float _1928 = _1758;
    float _1930 = _1926;
    if (_1894)
    {
        float _1932 = _1926 * 6.283185482025146484375;
        float _1934 = sin(_1932);
        _1928 = _1934;
    }
    float _1936 = _1928;
    float _1938 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1940 = precise::max(0.0, _1938);
    float _1942 = _1854;
    float _1944 = _1940;
    float _1946 = _1938;
    if (_1894)
    {
        float _1948 = _1926 * 6.283185482025146484375;
        float _1950 = cos(_1948);
        _1942 = _1950;
    }
    float _1952 = _1942;
    float _1954 = -_1880;
    float _1956 = -_1940;
    float _1958 = fma(_1858, _1954, _1956);
    float _1960 = _1958;
    if (_1894)
    {
        float _1962 = _1958 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1944 = _1962;
    }
    float _1964 = _1944;
    float _1966 = _1964;
    if (!_1894)
    {
        _1930 = _1882;
    }
    float _1968 = _1930;
    float _1970 = fma(_1774, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1972 = _1968;
    if (_1894)
    {
        float _1974 = fma(_1936, _1964, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1966 = _1974;
    }
    float _1976 = _1966;
    float _1978 = floor(_1970);
    float _1980 = _1976;
    if (_1894)
    {
        float _1982 = _1952 + (-1.0);
        _1946 = _1982;
    }
    float _1984 = _1946;
    float _1986 = _1984;
    if (_1894)
    {
        float _1988 = _1916 * _1976;
        _1508 = _1988;
    }
    float _1990 = _1508;
    if (!_1894)
    {
        _1918 = _1884;
    }
    float _1992 = _1918;
    float _1994 = _1992;
    if (_1894)
    {
        float _1996 = _1984 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1986 = _1996;
    }
    float _1998 = _1986;
    float _2000 = _1998;
    if (_1894)
    {
        float _2002 = _1882 * _1990;
        _1972 = _2002;
    }
    float _2004 = _1972;
    if (_1894)
    {
        float _2006 = _1884 * _1990;
        _1994 = _2006;
    }
    float _2008 = _1994;
    if (!_1894)
    {
        _1980 = _1888;
    }
    float _2010 = _1980;
    float _2012 = _2010;
    if (_1894)
    {
        float _2014 = fma(_1958, _1952, _1998);
        _1960 = _2014;
    }
    float _2016 = _1960;
    if (!_1894)
    {
        _2000 = _1886;
    }
    float _2018 = _2000;
    float _2020 = _2018;
    if (_1894)
    {
        float _2022 = _2004 * _2004;
        _2020 = _2022;
    }
    float _2024 = _2020;
    if (_1894)
    {
        float _2026 = _2008 * _2008;
        _2012 = _2026;
    }
    float _2028 = _2012;
    float _2030 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2032 = fma(_2016, _2016, _2024);
    float _2034 = fma(_1762, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2036 = -_1978;
    float _2038 = _1970 + _2036;
    float _2040 = _2032 + _2028;
    float _2042 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2030);
    float _2044 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2046 = fma(_1878, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2044);
    float _2048 = precise::clamp(_2046, 0.0, 1.0);
    float _2050 = rsqrt(_2040);
    float _2052 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2042);
    float _2054 = -_2048;
    float _2056 = _2054 + 1.0;
    float _2058 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2060 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2062 = _2052 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2064 = abs(_2056);
    float _2066 = log2(_2064);
    float _2068 = _2062 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2070 = -_2068;
    float _2072 = fma(_2070, _2060, 1.0);
    float _2074 = _1848 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2076 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2058);
    float _2078 = _2050 * _2004;
    float _2080 = _2050 * _2016;
    float _2082 = _2050 * _2008;
    float _2084 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2074);
    float _2086 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2076);
    float _2088 = _2078 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2090 = floor(_2034);
    float _2092 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2084);
    float _2094 = _2086 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2096 = -_2088;
    float _2098 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2096);
    float _2100 = fma(_1850, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1868);
    float _2102 = _2092 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2104 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2106 = -_2082;
    float _2108 = fma(_2106, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2098);
    float _2110 = fma(_1852, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2100);
    float _2112 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2114 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2104);
    float _2116 = fma(_2108, -0.5, 0.5);
    float _2118 = _2110 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2120 = exp2(_2112);
    float _2122 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2114);
    float _2124 = fma(_2108, 0.5, 0.5);
    float _2126 = -_2090;
    float _2128 = _2034 + _2126;
    float _2130 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2132 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2122);
    float _2134 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2136 = _2080 + 1.0;
    float _2138 = log2(_2072);
    float _2140 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2130);
    float _2142 = fma(_2124, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2144 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2140);
    float _2146 = fma(_2124, _2142, -0.212114393711090087890625);
    float _2148 = 1.0 / _2132;
    float _2150 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2144);
    float _2152 = -_2080;
    float _2154 = fma(_2120, _2136, _2152);
    float _2156 = sqrt(_2116);
    float _2158 = _2138 * 0.693147182464599609375;
    float2 _6107 = float2(_2128, _2038);
    float _2160 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6107, float2(0.0), isnan(_6107)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6107, float2(0.0), isnan(_6107)), level(0.0)).x;
    float _2162 = fma(_2124, _2146, 1.570728778839111328125);
    float _2164 = fma(_2154, 0.5, 0.5);
    float _2166 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2168 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2134);
    float _2170 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2168);
    float _2172 = _2150 * _2148;
    float _2174 = _2156 * 0.636619746685028076171875;
    float _2176 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2170);
    float _2178 = -_2162;
    float _2180 = fma(_2174, _2178, 1.0);
    float _2182 = _2176 * _2148;
    float _2184 = fma(_2172, 0.5, 0.5);
    float _2186 = fma(_2182, -0.5, 0.5);
    float3 _6161 = float3(_2184, _2186, _2166);
    float _2188 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6161, float3(0.0), isnan(_6161)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6161, float3(0.0), isnan(_6161)), level(0.0)).x;
    float3 _6172 = float3(_2184, _2186, _2166);
    float4 _2191 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6172, float3(0.0), isnan(_6172)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6172, float3(0.0), isnan(_6172)), level(0.0)).xyzw;
    float _2193 = _2191.x;
    float _2195 = _2191.y;
    float _2197 = _2191.z;
    float _2199 = _2191.w;
    float2 _6188 = float2(_2180, _2164);
    float3 _2203 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6188, float2(0.0), isnan(_6188)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6188, float2(0.0), isnan(_6188)), level(0.0)).xyz;
    float _2205 = _2203.x;
    float _2207 = _2203.y;
    float _2209 = _2203.z;
    float _2211 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    out.m_79.x = _1862;
    out.m_79.y = _1858;
    out.m_79.z = _1866;
    float _2213 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2211);
    float _2215 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2213);
    float _2217 = _1786 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2219 = _2215 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2221 = fma(_1762, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2217);
    float _2223 = 1.0 / _2219;
    float _2225 = fma(_1774, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2221);
    float _2227 = _2225 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2229 = _2227 + _2219;
    float _2231 = _2229 * _2223;
    float _2233 = _2231 * 0.5;
    float _2235 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2237 = fma(_2233, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2235);
    float _2239 = 1.0 / _2237;
    float _2241 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2243 = _2239 * _2241;
    float _2245 = abs(_2243);
    float _2247 = log2(_2245);
    float _2249 = _2247 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    bool _2251 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2253 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2255 = _2251 || _2253;
    bool _2257 = isnan(0.5);
    bool _2259 = _2255 || _2257;
    float _2261 = exp2(_2249);
    float _2263 = _2066;
    float _2265 = _2094;
    float _2267 = _2132;
    float _2269 = _2176;
    if (!_2259)
    {
        _1794 = (*spvDescriptorSet0.vp_c9)._m0[140].y;
    }
    float _2271 = _1794;
    float _2273 = fma(_2261, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2275 = precise::clamp(_2273, 0.0, 1.0);
    float _2277 = _2066 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2279 = _2271;
    if (!_2259)
    {
        float _2281 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2283 = _2271 + _2281;
        _2279 = _2283;
    }
    float _2285 = _2279;
    if (_2259)
    {
        _2263 = 1.0;
    }
    float _2287 = _2263;
    float _2289 = fma(_2275, -2.0, 3.0);
    float _2291 = _2275 * _2275;
    float _2293 = _2184;
    float _2295 = _2287;
    if (!_2259)
    {
        float _2297 = 1.0 / _2285;
        _2293 = _2297;
    }
    float _2299 = _2293;
    float _2301 = in.m_81.x;
    float _2303 = _2094 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2305 = _2291 * _2289;
    if (!_2259)
    {
        float _2307 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2309 = _2243 + _2307;
        _2265 = _2309;
    }
    float _2311 = _2265;
    float _2313 = fma(_2102, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2303);
    float _2315 = -_2305;
    float _2317 = _2315 + 1.0;
    float _2319 = exp2(_2277);
    float _2321 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2313);
    float _2323 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2305);
    bool _2325 = _2243 <= 8000.0;
    bool _2327 = isnan(_2243);
    bool _2329 = _2325 || _2327;
    bool _2331 = isnan(8000.0);
    bool _2333 = _2329 || _2331;
    float _2335 = float(_2333);
    float _2337 = _2150 + _2132;
    float _2339 = fma(_2118, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2321);
    float _2341 = _2132 * 0.5;
    if (!_2259)
    {
        float _2343 = _2311 * _2299;
        float _2345 = precise::clamp(_2343, 0.0, 1.0);
        _2295 = _2345;
    }
    float _2347 = _2295;
    float _2349 = _2335 * _2323;
    float _2351 = _2339 + _2132;
    float _2353 = _2349 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2355 = _2337 * 0.5;
    float _2357 = _2351 * 0.5;
    float _2359 = -_2319;
    float _2361 = _2359 + 1.0;
    float _2363 = fma(_2176, -0.5, _2341);
    bool _2365 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2367 = isnan(_1878);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2373 = _2369 || _2371;
    out.gl_Position.x = _2150;
    out.gl_Position.y = _2176;
    out.gl_Position.z = _2339;
    out.gl_Position.w = _2132;
    float _2375 = _2361 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_83.x = _2355;
    out.m_83.y = _2363;
    out.m_83.z = _2357;
    out.m_83.w = _2132;
    float _2377 = -_2375;
    float _2379 = _2377 + 1.0;
    float _2381 = _2379;
    if (!_2373)
    {
        _1906 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2383 = _1906;
    float _2385 = _2383;
    float _2387 = _2383;
    if (!_2373)
    {
        _2267 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2389 = _2267;
    float _2391 = _2389;
    float _2393 = _2389;
    if (!_2373)
    {
        _2269 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2395 = _2269;
    float _2397 = _2395;
    float _2399 = _2395;
    if (!_2373)
    {
        _1908 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2401 = _1908;
    float _2403 = -_2160;
    float _2405 = _2403 + 1.0;
    float _2407 = _2405 * _2353;
    float _2409 = precise::clamp(_2407, 0.0, 1.0);
    float _2411 = -_2409;
    float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2415 = _2347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2417 = _2413 * _2301;
    float _2419 = _2417 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_85.x = _2419;
    float _2421 = _2375 * _2188;
    float _2423 = _2199 * _2379;
    float _2425 = _2401;
    float _2427 = _2401;
    if (!_2373)
    {
        _2381 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2429 = _2381;
    float _2431 = _2199 * _2421;
    float _2433 = _2209 * _2421;
    float _2435 = fma(_2205, _2431, _2193);
    float _2437 = fma(_2207, _2431, _2195);
    float _2439 = fma(_2199, _2433, _2197);
    float _2441 = _2431;
    float _2443 = _2429;
    float _2445 = _2429;
    if (!_2373)
    {
        _2441 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2447 = _2441;
    out.m_87.x = _2435;
    out.m_87.y = _2437;
    out.m_87.z = _2439;
    out.m_87.w = _2423;
    bool _2449 = !_2373;
    float _2451 = _2447;
    float _2453 = _2447;
    if (!_2449)
    {
        bool _2455 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2457 = isnan(_1878);
        bool _2459 = _2455 || _2457;
        bool _2461 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2463 = _2459 || _2461;
        if (!_2463)
        {
            float _2465 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2467 = _1878 + _2465;
            float _2469 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2471 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2469;
            float _2473 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2475 = _2473 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2477 = 1.0 / _2471;
            float _2479 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2481 = _2479 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2483 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2485 = _2483 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2487 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2489 = _2487 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2491 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2493 = _2491 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2495 = _2467 * _2477;
            float _2497 = precise::clamp(_2495, 0.0, 1.0);
            float _2499 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2501 = _2499 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2503 = fma(_2497, _2475, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2505 = fma(_2497, _2501, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2507 = fma(_2497, _2481, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2509 = fma(_2497, _2485, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2511 = fma(_2497, _2489, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2513 = fma(_2497, _2493, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2393 = _2503;
            _2453 = _2511;
            _2387 = _2507;
            _2427 = _2509;
            _2399 = _2505;
            _2445 = _2513;
            _2515 = true;
        }
        else
        {
            bool _2517 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2519 = isnan(_1878);
            bool _2521 = _2517 || _2519;
            bool _2523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2525 = _2521 || _2523;
            if (!_2525)
            {
                _2385 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2527 = _2385;
            _2387 = _2527;
            if (!_2525)
            {
                _2391 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2529 = _2391;
            _2393 = _2529;
            if (!_2525)
            {
                _2397 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2531 = _2397;
            _2399 = _2531;
            if (!_2525)
            {
                _2425 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2533 = _2425;
            _2427 = _2533;
            if (!_2525)
            {
                _2451 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2535 = _2451;
            _2453 = _2535;
            if (!_2525)
            {
                _2443 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2537 = _2443;
            bool _2539 = !_2525;
            _2445 = _2537;
            if (!_2539)
            {
                bool _2541 = _1878 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2543 = isnan(_1878);
                bool _2545 = _2541 || _2543;
                bool _2547 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2549 = _2545 || _2547;
                if (!_2549)
                {
                    float _2551 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2553 = _1878 + _2551;
                    float _2555 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2557 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2555;
                    float _2559 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2561 = _2559 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2563 = 1.0 / _2557;
                    float _2565 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2567 = _2565 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2569 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2571 = _2569 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2573 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2577 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2579 = _2577 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2581 = _2553 * _2563;
                    float _2583 = precise::clamp(_2581, 0.0, 1.0);
                    float _2585 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2587 = _2585 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2589 = fma(_2583, _2561, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2591 = fma(_2583, _2587, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2593 = fma(_2583, _2567, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2595 = fma(_2583, _2571, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2597 = fma(_2583, _2575, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2599 = fma(_2583, _2579, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2393 = _2589;
                    _2453 = _2597;
                    _2387 = _2593;
                    _2427 = _2595;
                    _2399 = _2591;
                    _2445 = _2599;
                    _2515 = true;
                }
                else
                {
                    _2393 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2453 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2387 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2427 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2399 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2445 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2515 = false;
    float _2601 = _2393;
    float _2603 = _2453;
    float _2605 = _2387;
    float _2607 = _2427;
    float _2609 = _2399;
    float _2611 = _2445;
    float _2613 = _2415 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2615 = fma(_1642, -0.5, 0.5);
    float _2617 = precise::clamp(_2615, 0.0, 1.0);
    float _2619 = -_2601;
    float _2621 = _2619 + _2603;
    float _2623 = -_2605;
    float _2625 = _2623 + _2607;
    out.m_51.x = _2613;
    float _2627 = -_2609;
    float _2629 = _2627 + _2611;
    float _2631 = fma(_2617, _2621, _2601);
    float _2633 = fma(_2617, _2625, _2605);
    bool _2635 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2637 = _2631 * 0.586610972881317138671875;
    float _2639 = fma(_2617, _2629, _2609);
    out.m_89.x = 0.0;
    bool _2641 = _2347 > 0.0;
    bool _2643 = isnan(_2347);
    bool _2645 = _2641 || _2643;
    bool _2647 = isnan(0.0);
    bool _2649 = _2645 || _2647;
    float _2651 = fma(_2633, 0.298911988735198974609375, _2637);
    float _2653 = fma(_2639, 0.114477999508380889892578125, _2651);
    float _2655 = -_2653;
    float _2657 = _2633 + _2655;
    float _2659 = -_2653;
    float _2661 = _2631 + _2659;
    float _2663 = -_2653;
    float _2665 = _2639 + _2663;
    float _2667 = fma(_2657, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    float _2669 = fma(_2661, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    float _2671 = fma(_2665, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2653);
    bool _2673 = !_2635;
    if (!_2673)
    {
        float _2675 = -_1848;
        float _2677 = _2675 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2679 = -_1850;
        float _2681 = _2679 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2683 = -_1852;
        float _2685 = _2683 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2687 = _2677 * _2677;
        float _2689 = fma(_2681, _2681, _2687);
        float _2691 = fma(_2685, _2685, _2689);
        float _2693 = sqrt(_2691);
        float _2695 = rsqrt(_2691);
        float _2697 = -_2693;
        float _2699 = _2697 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2701 = _2699 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2703 = precise::clamp(_2701, 0.0, 1.0);
        float _2705 = _2681 * _2695;
        float _2707 = _2677 * _2695;
        float _2709 = abs(_2703);
        float _2711 = log2(_2709);
        float _2713 = _2685 * _2695;
        float _2715 = _2705 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2717 = _1642 * _2707;
        float _2719 = -_2707;
        float _2721 = -_2715;
        float _2723 = fma(_2719, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2721);
        float _2725 = fma(_1638, _2705, _2717);
        float _2727 = -_2713;
        float _2729 = fma(_2727, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2723);
        float _2731 = fma(_1658, _2713, _2725);
        float _2733 = precise::clamp(_2731, 0.0, 1.0);
        float _2735 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2737 = _2729 + _2735;
        float _2739 = _2711 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2741 = _2737 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2743 = precise::clamp(_2741, 0.0, 1.0);
        float _2745 = exp2(_2739);
        float _2747 = _2745 * _2743;
        float _2749 = _2733 * _2747;
        float _2751 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2753 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2755 = _2749 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _2751;
        out.m_89.y = _2753;
        out.m_89.z = _2755;
    }
    out.m_91.x = _2667;
    out.m_91.y = _2669;
    out.m_91.z = _2671;
    if (_2649)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2757 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2757;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

