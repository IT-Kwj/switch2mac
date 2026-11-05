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
    constant _16* vp_c7 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_69 [[user(locn1)]];
    float4 m_77 [[user(locn2)]];
    float4 m_75 [[user(locn3)]];
    float4 m_89 [[user(locn4)]];
    float4 m_87 [[user(locn5)]];
    float4 m_49 [[user(locn6)]];
    float4 m_91 [[user(locn7)]];
    float4 m_63 [[user(locn8)]];
    float4 m_67 [[user(locn9)]];
    float4 m_79 [[user(locn10)]];
    float4 m_83 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_55 [[user(locn13)]];
    float4 m_65 [[user(locn14)]];
    float4 m_81 [[user(locn15)]];
    float4 m_85 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_73 [[attribute(4)]];
    float4 m_71 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_61 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3506 = false;
    bool _704 = false;
    bool _508 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3763 = as_type<float>(_132);
        out.gl_Position.z = _3763;
    }
    if (!_120)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_144;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _134 = as_type<int>(_158);
    }
    int _160 = _134;
    out.m_55.x = _146;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3822 = as_type<float>(_160);
        out.gl_Position.z = _3822;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _184;
    if (!_168)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _166;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _210 = 1.0 / _196;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _212;
    bool _216 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _218 = isnan(_188);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = 1.0 / _204;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _188 + _230;
    bool _234 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_188);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _246;
    float _250 = 1.0 / _200;
    float _252 = _232 * _210;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _188 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = fma(_248, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = fma(_260, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = 1.0 / _214;
    float _270 = _256 * _228;
    bool _272 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _274 = isnan(_188);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _188 + _284;
    bool _288 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_188);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = 1.0 / _208;
    float _302 = _192 * _250;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = _188 + _304;
    bool _308 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_188);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_282;
    float _322 = _320 + 1.0;
    float _324 = _306 * _268;
    bool _326 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_188);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_318;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = _336 * _340;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    float _352 = _286 * _300;
    float _354 = _298 * _322;
    float _356 = -_298;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = _244 * _350;
    float _366 = -_244;
    float _368 = _366 + 1.0;
    float _370 = _226 * _358;
    float _372 = -_226;
    float _374 = _372 + 1.0;
    float _376 = fma(_362, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = fma(_344, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = _318 * _374;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _376 * _364;
    float _392 = _266 * _364;
    float _394 = _262 * _364;
    float _396 = fma(_384, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_388, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _406 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _412 = fma(_402, _270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_378, _346, _404);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _416;
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_410, _352, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _432 = fma(_412, _380, _414);
    float _434 = fma(_418, _270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_396, _346, _420);
    float _438 = fma(_424, _270, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _444 = fma(_398, _346, _406);
    float _446 = fma(_430, _352, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _448 = fma(_434, _380, _436);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _454;
    float _458 = fma(_442, _352, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _460 = fma(_438, _380, _444);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _462;
    float _466 = fma(_452, _324, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _468 = fma(_456, _324, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _470 = fma(_426, _370, _432);
    float _472 = fma(_464, _324, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _474 = fma(_446, _370, _448);
    float _476 = fma(_458, _370, _460);
    float _478 = fma(_466, _354, _470);
    float _480 = fma(_468, _354, _474);
    float _482 = fma(_472, _354, _476);
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].x, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].y, _480);
    float _488 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].z, _482);
    bool _490 = !_264;
    float _506;
    if (!_490)
    {
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        _506 = _166;
    }
    _508 = false;
    float _510 = _506;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _510 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _524 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_510);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _540 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _542 = isnan(_510);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _518;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _554;
    float _558 = -_534;
    float _560 = _558 + 1.0;
    bool _562 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _564 = isnan(_510);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _522;
    float _578 = 1.0 / _538;
    float _580 = _556 * _552;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _586 = _550 * _560;
    float _588 = -_550;
    float _590 = _588 + 1.0;
    float _592 = fma(_580, _514, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _594;
    float _598 = _572 * _590;
    float _600 = _584 * _576;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _604 = _510 + _602;
    bool _606 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _608 = isnan(_510);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _592 * _598;
    float _620 = -_572;
    float _622 = _620 + 1.0;
    float _624 = fma(_600, _604, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = _510 + _626;
    float _630 = _596 * _578;
    float _632 = -_616;
    float _634 = _632 + 1.0;
    float _636 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _618);
    float _638 = fma(_630, _628, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _640 = _534 * _634;
    float _642 = fma(_624, _586, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _646 = fma(_638, _640, _642);
    float _648 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[118].x, _646);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _658 = in.m_57.x;
    float _660 = in.m_57.y;
    float _662 = in.m_57.z;
    float _664 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = _650 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _670 = _656 * _146;
    out.m_59.x = _648;
    out.m_59.y = _666;
    out.m_59.z = _664;
    out.m_59.w = _668;
    float _672 = trunc(_670);
    int _674 = int(_672);
    float _676 = _488 * _662;
    float _678 = _484 * _658;
    float _680 = _486 * _660;
    int _682 = _674 << 4;
    int _684 = _682 + 1968;
    bool _686 = !_574;
    float _702;
    if (!_686)
    {
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _690 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        _702 = _166;
    }
    _704 = false;
    float _706 = _702;
    float _708 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _710 = int(_708);
    float _712 = in.m_61.y;
    float _714 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _716 = in.m_53.y;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _720 = _718 != 0;
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _724 = int(_722);
    float _726 = in.m_61.x;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = in.m_53.z;
    float _738 = float(_710);
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = float(_724);
    float _750 = 1.0 / _738;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _758 = _716 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _760 = _716 > 0.5;
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _764 = int(_762);
    float _766 = float(uint(_742));
    int _768 = ~_742;
    int _770 = _768 + 1;
    bool _772 = _736 > 0.5;
    float _774 = float(_742);
    float _776 = 1.0 / _748;
    float _778 = _116 * _750;
    float _780 = 1.0 / _766;
    float _782 = float(uint(_764));
    int _784 = ~_742;
    int _786 = _784 + 1;
    float _788 = trunc(_778);
    int _790 = int(_788);
    float _792 = _116 * _776;
    float _794 = 1.0 / _782;
    int _796 = as_type<int>(_780) + (-2);
    float _798 = trunc(_792);
    int _800 = int(_798);
    float _802 = float(uint(_790));
    float _804 = float(_790);
    float _806 = as_type<float>(_796) * _802;
    int _808 = as_type<int>(_794) + (-2);
    float _810 = 1.0 / _746;
    float _812 = float(uint(_800));
    float _814 = trunc(_806);
    float _816 = precise::max(_814, 0.0);
    uint _819 = uint(_816);
    float _821 = as_type<float>(_808) * _812;
    float _823 = trunc(_821);
    float _825 = precise::max(_823, 0.0);
    uint _827 = uint(_825);
    int _829 = _786 * int(_819);
    int _831 = _829 + _790;
    float _833 = _821;
    bool _835 = _760;
    int _837 = int(_819);
    float _839 = _712;
    float _841 = _726;
    float _843 = _716;
    if (!_720)
    {
        _833 = _726;
    }
    float _845 = _833;
    float _847 = 1.0 / _754;
    float _849 = float(uint(_831));
    int _851 = ~_764;
    int _853 = _851 + 1;
    float _855 = as_type<float>(_796) * _849;
    int _857 = _853 * int(_827);
    int _859 = _857 + _800;
    float _861 = trunc(_855);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    float _867 = float(uint(_859));
    float _869 = as_type<float>(_808) * _867;
    float _871 = -_712;
    float _873 = _871 + 1.0;
    float _875 = trunc(_869);
    float _877 = precise::max(_875, 0.0);
    uint _879 = uint(_877);
    int _881 = _760 ? as_type<int>(_873) : as_type<int>(_712);
    float _883 = _845;
    if (_720)
    {
        bool _885 = _146 > 0.5;
        _835 = _885;
    }
    bool _887 = _835;
    int _889 = int(_819) + int(_865);
    if (_720)
    {
        float _891 = -_726;
        float _893 = _891 + 1.0;
        _837 = as_type<int>(_893);
    }
    int _895 = _837;
    float _897 = _734 ? as_type<float>(_881) : _712;
    if (_730)
    {
        float _899 = _772 ? _873 : _712;
        _839 = _899;
    }
    float _901 = _839;
    int _903 = _770 * _889;
    int _905 = _903 + _790;
    if (_720)
    {
        float _907 = _887 ? as_type<float>(_895) : _726;
        _883 = _907;
    }
    float _909 = _883;
    int _911 = ~_764;
    int _913 = _911 + 1;
    int _915 = int(_827) + int(_879);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _919 = _917 != 0;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _923 = _921 != 0;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _927 = _925 != 0;
    bool _929 = uint(_905) >= uint(_742);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _933 = _931 != 0;
    bool _935 = !_923;
    int _937 = _935 ? 0 : 1;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _941 = _939 != 0;
    int _943 = _913 * _915;
    int _945 = _943 + _800;
    bool _947 = !_933;
    int _949 = _947 ? 0 : 1;
    bool _951 = !_929;
    int _953 = _951 ? 0 : (-1);
    bool _955 = !_927;
    int _957 = _955 ? 0 : 1;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _977 = _975 != 0;
    bool _979 = !_919;
    int _981 = _979 ? 0 : 1;
    bool _983 = uint(_945) >= uint(_764);
    float _985 = in.m_44.x;
    float _987 = in.m_44.y;
    float _989 = in.m_44.z;
    bool _991 = !_983;
    int _993 = _991 ? 0 : (-1);
    bool _995 = !_965;
    int _997 = _995 ? 0 : 1;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1001 = 0.0;
    if (_977)
    {
        _1001 = 1.0;
    }
    float _1003 = _1001;
    float _1005 = _1003;
    if (!_977)
    {
        _1005 = 7.345489978790283203125;
    }
    float _1007 = _1005;
    float _1009 = fma(_758, -2.0, _999);
    float _1011 = 0.0;
    if (_977)
    {
        _1011 = _146;
    }
    float _1013 = _1011;
    float _1015 = 0.0;
    float _1017 = _1013;
    if (_977)
    {
        _1015 = 1.0;
    }
    float _1019 = _1015;
    float _1021 = _1007 * _146;
    float _1023 = _1019;
    if (!_977)
    {
        _1017 = _716;
    }
    float _1025 = _1017;
    float _1027 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    if (!_977)
    {
        _1023 = 1.2345600128173828125;
    }
    float _1029 = _1023;
    float _1031 = floor(_1021);
    bool _1033 = !_961;
    int _1035 = _1033 ? 0 : 1;
    bool _1037 = !_969;
    int _1039 = _1037 ? 0 : 1;
    float _1041 = _1025 * _1029;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1045 = _1043 != 0;
    float _1047 = _987 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1051 = _1049 != 0;
    float _1053 = _987 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1057 = _1055 != 0;
    float _1059 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1047);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1063 = _1061 != 0;
    float _1065 = -_756;
    float _1067 = fma(_714, 2.0, _1065);
    bool _1069 = _804 >= _774;
    bool _1071 = isnan(_804);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan(_774);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _987 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1083;
    float _1087 = floor(_1041);
    float _1089 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1053);
    float _1091 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1081);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1097 = float(_764);
    float _1099 = _1085 * _810;
    float _1101 = float(_800);
    float _1103 = _1095 * _847;
    float _1105 = trunc(_1079);
    int _1107 = int(_1105);
    float _1109 = -_1031;
    float _1111 = _1021 + _1109;
    bool _1113 = _1101 >= _1097;
    bool _1115 = isnan(_1101);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(_1097);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1091);
    int _1127 = ~_889;
    int _1129 = _1127 + _953;
    int _1131 = _1129 + 1;
    float _1133 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1059);
    float _1135 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1089);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1139 = _706 + _1137;
    float _1141 = trunc(_1123);
    int _1143 = int(_1141);
    bool _1145 = !_973;
    int _1147 = _1145 ? 0 : 1;
    int _1149 = _742 * _1131;
    int _1151 = _1149 + _790;
    bool _1153 = _742 == 0;
    float _1155 = _1111 * _774;
    float _1157 = fma(_1099, _1139, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1159 = -_1087;
    float _1161 = _1041 + _1159;
    bool _1163 = !_1153;
    int _1165 = _1163 ? _1151 : (-1);
    float _1167 = trunc(_1155);
    int _1169 = int(_1167);
    int _1171 = ~_1107;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    float _1177 = _1161 * _1097;
    int _1179 = ~_915;
    int _1181 = _1179 + _993;
    int _1183 = _1181 + 1;
    float _1185 = _166 * _774;
    float _1187 = _166 * _1097;
    int _1189 = _1165 * _1175;
    bool _1191 = !_1051;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _764 * _1183;
    int _1197 = _1195 + _800;
    bool _1199 = _764 == 0;
    float _1201 = trunc(_1185);
    int _1203 = int(_1201);
    int _1205 = ~_1143;
    int _1207 = _1205 + 1;
    int _1209 = _1207 + 1;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1213 = _706 + _1211;
    bool _1215 = !_1199;
    int _1217 = _1215 ? _1197 : (-1);
    float _1219 = -_116;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1067);
    int _1223 = abs(_949);
    int _1225 = _742 + (-1);
    int _1227 = _1217 * _1209;
    int _1229 = abs(_937);
    float _1231 = fma(_1103, _1213, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1233 = _1169 * _1223;
    int _1235 = _1233 + _790;
    int _1237 = abs(_981);
    int _1239 = _1107 * _1225;
    int _1241 = _1239 + _1189;
    float _1243 = trunc(_1177);
    int _1245 = int(_1243);
    int _1247 = _764 + (-1);
    int _1249 = _1241 * _1229;
    bool _1251 = !_941;
    int _1253 = _1251 ? 0 : 1;
    int _1255 = abs(_957);
    float _1257 = trunc(_1187);
    int _1259 = int(_1257);
    int _1261 = _1203 * _1237;
    int _1263 = _1261 + _1249;
    int _1265 = abs(_997);
    int _1267 = _1143 * _1247;
    int _1269 = _1267 + _1227;
    int _1271 = abs(_1193);
    int _1273 = _1235 * _1255;
    int _1275 = _1273 + _1263;
    int _1277 = abs(_1035);
    int _1279 = _1269 * _1265;
    int _1281 = abs(_1039);
    int _1283 = abs(_1253);
    int _1285 = _1169 * _1283;
    int _1287 = _1285 + _1275;
    int _1289 = abs(_1147);
    int _1291 = _1245 * _1271;
    int _1293 = _1291 + _800;
    int _1295 = _1259 * _1277;
    int _1297 = _1295 + _1279;
    float _1299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1301 = _1293 * _1281;
    int _1303 = _1301 + _1297;
    float _1305 = float(uint(_1287));
    float _1307 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1311 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1313 = isnan(_706);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = as_type<float>(_796) * _1305;
    bool _1325 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1327 = isnan(_706);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    int _1337 = _1245 * _1289;
    int _1339 = _1337 + _1303;
    bool _1341 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1343 = isnan(_706);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = -_1321;
    float _1355 = _1353 + 1.0;
    float _1357 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1309);
    float _1359 = trunc(_1323);
    float _1361 = precise::max(_1359, 0.0);
    uint _1363 = uint(_1361);
    float _1365 = float(uint(_1339));
    float _1367 = _1351 * _1355;
    float _1369 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1357);
    float _1371 = -_1351;
    float _1373 = _1371 + 1.0;
    int _1375 = _1277;
    int _1377 = as_type<int>(_1365);
    float _1379 = _1373;
    if (_977)
    {
        _1375 = 0;
    }
    int _1381 = _1375;
    float _1383 = as_type<float>(_808) * _1365;
    float _1385 = -_1027;
    float _1387 = fma(_1369, _1307, _1385);
    int _1389 = _1381;
    if (!_977)
    {
        _1389 = 2;
    }
    int _1391 = _1389;
    float _1393 = _1335 * _1373;
    if (_1057)
    {
        float _1395 = -_726;
        float _1397 = _1395 + 1.0;
        _1377 = as_type<int>(_1397);
    }
    int _1399 = _1377;
    bool _1401 = _716 > 0.5;
    float _1403 = trunc(_1383);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    bool _1409 = _1391 != 2;
    float _1411 = _1157 * _1393;
    int _1413 = ~_742;
    int _1415 = _1413 + 1;
    float _1417 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_1057)
    {
        _1379 = _726;
    }
    float _1419 = _1379;
    float _1421 = _1387 + 0.5;
    float _1423 = _1419;
    if (_1057)
    {
        float _1425 = _1401 ? as_type<float>(_1399) : _726;
        _1423 = _1425;
    }
    float _1427 = _1423;
    float _1429 = -_1335;
    float _1431 = _1429 + 1.0;
    float _1433 = float(uint(_1235));
    int _1435 = _1415 * int(_1363);
    int _1437 = _1435 + _1287;
    float _1439 = fma(_1417, _901, -0.5);
    int _1441 = ~_764;
    int _1443 = _1441 + 1;
    float _1445 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1411);
    float _1447 = as_type<float>(_796) * _1433;
    float _1449 = float(uint(_1437));
    float _1451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1409)
    {
        _841 = _146;
    }
    float _1453 = _841;
    int _1455 = _1443 * int(_1407);
    int _1457 = _1455 + _1339;
    float _1459 = _1453;
    if (!_1409)
    {
        _1459 = _736;
    }
    float _1461 = _1459;
    float _1463 = as_type<float>(_796) * _1449;
    float _1465 = fma(_1231, _1367, _1445);
    float _1467 = float(uint(_1457));
    float _1469 = trunc(_1447);
    float _1471 = precise::max(_1469, 0.0);
    uint _1473 = uint(_1471);
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1477 = as_type<float>(_808) * _1467;
    int _1479 = ~_742;
    int _1481 = _1479 + 1;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1485 = ~_764;
    int _1487 = _1485 + 1;
    float _1489 = trunc(_1463);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    float _1495 = float(uint(_1293));
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1499 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1475);
    float _1501 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1503 = as_type<float>(_808) * _1495;
    float _1505 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1497);
    int _1507 = _1481 * int(_1473);
    int _1509 = _1507 + _1235;
    float _1511 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1483);
    float _1513 = trunc(_1477);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    int _1519 = ~_742;
    int _1521 = _1519 + 1;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1409)
    {
        _843 = _146;
    }
    float _1525 = _843;
    float _1527 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1511);
    float _1529 = float(uint(_1509));
    float _1531 = -_1523;
    float _1533 = fma(_1501, 2.0, _1531);
    int _1535 = int(_1363) + int(_1493);
    float _1537 = trunc(_1503);
    float _1539 = precise::max(_1537, 0.0);
    uint _1541 = uint(_1539);
    float _1543 = as_type<float>(_796) * _1529;
    float _1545 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1505);
    int _1547 = _1521 * _1535;
    int _1549 = _1547 + _1287;
    float _1551 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1553 = int(_1407) + int(_1517);
    float _1555 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1557 = uint(_1549) >= uint(_742);
    float _1559 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1499);
    int _1561 = ~_764;
    int _1563 = _1561 + 1;
    float _1565 = fma(_1551, _1427, -0.5);
    float _1567 = trunc(_1543);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = _1487 * int(_1541);
    int _1575 = _1573 + _1293;
    int _1577 = _1563 * _1553;
    int _1579 = _1577 + _1339;
    int _1581 = ~_764;
    int _1583 = _1581 + 1;
    float _1585 = float(uint(_1575));
    float _1587 = fma(_1559, _1555, _1221);
    bool _1589 = !_1557;
    int _1591 = _1589 ? 0 : (-1);
    float _1593 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1465);
    bool _1595 = uint(_1579) >= uint(_764);
    float _1597 = as_type<float>(_808) * _1585;
    int _1599 = ~_1535;
    int _1601 = _1599 + _1591;
    int _1603 = _1601 + 1;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1607 = !_1595;
    int _1609 = _1607 ? 0 : (-1);
    float _1611 = trunc(_1597);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    int _1617 = int(_1473) + int(_1571);
    int _1619 = _742 * _1603;
    int _1621 = _1619 + _1287;
    int _1623 = ~_1553;
    int _1625 = _1623 + _1609;
    int _1627 = _1625 + 1;
    float _1629 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1631 = ~_742;
    int _1633 = _1631 + 1;
    bool _1635 = !_1153;
    int _1637 = _1635 ? _1621 : (-1);
    int _1639 = _764 * _1627;
    int _1641 = _1639 + _1339;
    float _1643 = fma(_1629, -2.0, _1605);
    int _1645 = _1633 * _1617;
    int _1647 = _1645 + _1235;
    int _1649 = _1637 & 3;
    bool _1651 = _1649 != 0;
    bool _1653 = !_1199;
    int _1655 = _1653 ? _1641 : (-1);
    float _1657 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1659 = uint(_1649) > 1u;
    float _1661 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1643);
    int _1663 = _1637 & 3;
    bool _1665 = _1663 != 0;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1669 = _1657 + _1667;
    int _1671 = _1655 >> 31;
    float _1673 = -_1661;
    float _1675 = fma(_1545, _1439, _1673);
    int _1677 = _1637 >> 31;
    int _1679 = _1665 ? 0 : 1;
    int _1681 = _1671 & 3;
    int _1683 = _1677 & 3;
    int _1685 = ~_1679;
    int _1687 = _1685 + 1;
    int _1689 = _1687 + 1;
    int _1691 = _1655 + _1681;
    int _1693 = _1689;
    float _1695 = _1593;
    if (!_1659)
    {
        int _1697 = ~_1679;
        int _1699 = _1697 + 1;
        _1693 = _1699;
    }
    int _1701 = _1693;
    float _1703 = _1135 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1705 = uint(_1649) >= 2u;
    int _1707 = _1637 + _1683;
    float _1709 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1711 = _1691 >> 2;
    int _1713 = _1705 ? 0 : 1;
    float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1717 = _1709 + _1715;
    bool _1719 = _1649 != 3;
    int _1721 = _1707 >> 2;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1725 = _1703 + _1723;
    int _1727 = _1711 << 4;
    int _1729 = _1727 + 512;
    int _1731 = int(_1541) + int(_1615);
    int _1733 = _1721 << 4;
    int _1735 = _1733 + 368;
    uint _1737 = uint(int(uint(_1729) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c9)._m0[int(_1747)][_1749];
    bool _1753 = uint(_1647) >= uint(_742);
    int _1755 = _1583 * _1731;
    int _1757 = _1755 + _1293;
    float _1759 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1761 = ~_1713;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = _1765;
    if (_1719)
    {
        int _1769 = ~_1713;
        int _1771 = _1769 + 1;
        _1767 = _1771;
    }
    int _1773 = _1767;
    float _1775 = -_116;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1533);
    uint _1779 = uint(int(uint(_1735) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[int(_1789)][_1791];
    bool _1795 = uint(_1757) >= uint(_764);
    float _1797 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1759);
    bool _1799 = !_1753;
    int _1801 = _1799 ? 0 : (-1);
    float _1803 = fma(_1527, _1565, _1777);
    bool _1805 = !_1045;
    int _1807 = _1805 ? 0 : 1;
    float _1809 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1797);
    int _1811 = _1655 & 3;
    bool _1813 = _1811 != 0;
    int _1815 = _1729 + 8;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[int(_1827)][_1829];
    int _1833 = _1655 & 3;
    bool _1835 = _1833 != 0;
    float _1837 = _1587 + 0.5;
    bool _1839 = !_1795;
    int _1841 = _1839 ? 0 : (-1);
    bool _1843 = uint(_1833) > 1u;
    int _1845 = _1813 ? 0 : 1;
    out.m_63.x = _1837;
    out.m_63.y = _1421;
    bool _1847 = _1809 >= 0.0;
    int _1849 = _1735 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = ~_1617;
    int _1869 = _1867 + _1801;
    int _1871 = _1869 + 1;
    int _1873 = ~_1845;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = abs(_1773);
    int _1881 = _742 * _1871;
    int _1883 = _1881 + _1235;
    int _1885 = _1877;
    if (!_1843)
    {
        int _1887 = ~_1845;
        int _1889 = _1887 + 1;
        _1885 = _1889;
    }
    int _1891 = _1885;
    bool _1893 = _1649 != 3;
    int _1895 = abs(_1891);
    if (_1847)
    {
        out.m_51.x = 0.0;
    }
    int _1897 = abs(_1701);
    bool _1899 = !_1651;
    int _1901 = _1899 ? 0 : 1;
    bool _1903 = !_1835;
    int _1905 = _1903 ? 0 : 1;
    bool _1907 = uint(_1833) >= 2u;
    int _1909 = ~_1895;
    int _1911 = _1909 + 1;
    int _1913 = _1911 + 1;
    bool _1915 = _1833 != 3;
    int _1917 = abs(_1905);
    int _1919 = ~_1897;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    int _1925 = _1907 ? 0 : 1;
    bool _1927 = _1833 != 3;
    int _1929 = _1913 * as_type<int>(_1751);
    int _1931 = abs(_1901);
    int _1933 = _1923 * as_type<int>(_1793);
    uint _1935 = uint(int(uint(_684) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[int(_1945)][_1947];
    int _1951 = ~_1931;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = ~_1917;
    int _1959 = _1957 + 1;
    int _1961 = _1959 + 1;
    int _1963 = ~_1925;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    int _1969 = _1955 * as_type<int>(_1785);
    int _1971 = _1969 + _1933;
    int _1973 = _1967;
    if (_1915)
    {
        int _1975 = ~_1925;
        int _1977 = _1975 + 1;
        _1973 = _1977;
    }
    int _1979 = _1973;
    int _1981 = _684 + 8;
    uint _1983 = uint(int(uint(_1981) >> uint(2)));
    uint _1985 = uint(int(uint(int(_1983)) >> uint(2)));
    int _1987 = int(_1983) & 3;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[int(_1985)][_1987];
    int _1991 = _1961 * as_type<int>(_1743);
    int _1993 = _1991 + _1929;
    bool _1995 = !_1893;
    int _1997 = _1995 ? 0 : (-1);
    int _1999 = abs(_1979);
    bool _2001 = !_1927;
    int _2003 = _2001 ? 0 : (-1);
    int _2005 = abs(_1997);
    int _2007 = ~_1879;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    int _2013 = abs(_2003);
    int _2015 = ~_1999;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _2011 * as_type<int>(_1857);
    int _2023 = _2021 + _1971;
    bool _2025 = !_1063;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = _2019 * as_type<int>(_1823);
    int _2031 = _2029 + _1993;
    int _2033 = abs(_1807);
    int _2035 = ~_2013;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = abs(_2027);
    int _2043 = _2039 * as_type<int>(_1831);
    int _2045 = _2043 + _2031;
    int _2047 = ~_2005;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    float _2053 = _1669 * _1669;
    int _2055 = ~_1731;
    int _2057 = _2055 + _1841;
    int _2059 = _2057 + 1;
    int _2061 = _2051 * as_type<int>(_1865);
    int _2063 = _2061 + _2023;
    float _2065 = fma(_1717, _1717, _2053);
    int _2067 = ~_2041;
    int _2069 = _2067 + 1;
    int _2071 = _2069 + 1;
    int _2073 = _764 * _2059;
    int _2075 = _2073 + _1293;
    int _2077 = ~_2033;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = fma(_1725, _1725, _2065);
    float _2085 = _1823;
    int _2087 = as_type<int>(_2053);
    if (_1847)
    {
        _2085 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2089 = _2085;
    int _2091 = _2045 * _2071;
    bool _2093 = !_1153;
    int _2095 = _2093 ? _1883 : (-1);
    float _2097 = rsqrt(_2083);
    bool _2099 = !_1199;
    int _2101 = _2099 ? _2075 : (-1);
    int _2103 = _2063 * _2081;
    if (_1847)
    {
        float _2105 = _2089 * 5.0;
        _2087 = as_type<int>(_2105);
    }
    int _2107 = _2087;
    float _2109 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2111 = _2095 * _2033;
    int _2113 = _2111 + _2103;
    float _2115 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2117 = _2101 * _2041;
    int _2119 = _2117 + _2091;
    float _2121 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1847)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6778 = as_type<float>(_2107);
        out.gl_Position.z = _6778;
    }
    float _2125 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2127 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = float(_2113);
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = float(_2119);
    float _2137 = _2125 * _2097;
    out.m_65.x = _2131;
    out.m_65.y = _2135;
    float _2139 = _1803 + 0.5;
    float _2141 = _1675 + 0.5;
    float _2143 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2145 = _1717 * _2137;
    float _2147 = _1669 * _2137;
    out.m_67.x = _2139;
    out.m_67.y = _2141;
    out.m_69.x = _2127;
    out.m_69.y = _2129;
    out.m_69.z = _2133;
    out.m_69.w = _2143;
    if (_1847)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2149 = -_2147;
    float _2151 = _1657 + _2149;
    float _2153 = _1725 * _2137;
    float _2155 = -_2145;
    float _2157 = _1709 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2161 = _2151 + _2159;
    float _2163 = -_2153;
    float _2165 = _1703 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2157 + _2167;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2175 = _2165 + _2173;
    float _2177 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2171);
    float _2179 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2177);
    bool _2181 = _2179 >= 0.0;
    float _2183 = _2153;
    float _2185 = _2151;
    float _2187 = _2157;
    if (_2181)
    {
        _1695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2189 = _1695;
    int _2191 = as_type<int>(_2189);
    if (_2181)
    {
        out.m_51.x = 0.0;
    }
    if (_2181)
    {
        float _2193 = _2189 * 5.0;
        _2191 = as_type<int>(_2193);
    }
    int _2195 = _2191;
    if (_2181)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6918 = as_type<float>(_2195);
        out.gl_Position.z = _6918;
    }
    if (_2181)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2197 = -_1657;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2201 = -_1709;
    float _2203 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2205 = -_1703;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2209 = _2199 * _2199;
    float _2211 = -_2147;
    float _2213 = _1669 + _2211;
    float _2215 = fma(_2203, _2203, _2209);
    float _2217 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2219 = fma(_2207, _2207, _2215);
    float _2221 = -_2145;
    float _2223 = _1717 + _2221;
    float _2225 = -_2217;
    float _2227 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2225);
    float _2229 = _2213 * _2213;
    float _2231 = rsqrt(_2219);
    float _2233 = -_2153;
    float _2235 = _1725 + _2233;
    float _2237 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2239 = fma(_2223, _2223, _2229);
    float _2241 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2237);
    float _2243 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2245 = 1.0 / _678;
    float _2247 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2249 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2251 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2241);
    float _2253 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2243);
    float _2255 = -_2247;
    float _2257 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2255);
    float _2259 = -_2249;
    float _2261 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2259);
    float _2263 = _2203 * _2231;
    float _2265 = _2207 * _2231;
    float _2267 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2269 = _2257 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2271 = _2263 * _2263;
    float _2273 = _2199 * _2231;
    float _2275 = -_2267;
    float _2277 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2275);
    float _2279 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2281 = fma(_2265, _2265, _2271);
    float _2283 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2287 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2253);
    float _2289 = rsqrt(_2281);
    float _2291 = -_2283;
    float _2293 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2291);
    float _2295 = -_2285;
    float _2297 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2295);
    float _2299 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2301 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2277);
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2305 = -_2269;
    float _2307 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2305);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2311 = -_2279;
    float _2313 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2311);
    float _2315 = -_2303;
    float _2317 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2315);
    float _2319 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2307);
    float _2321 = _2265 * _2289;
    float _2323 = _2263 * _2289;
    float _2325 = -_2309;
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2325);
    float _2329 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2313);
    float _2331 = -_2321;
    float _2333 = _2265 * _2331;
    float _2335 = -_2321;
    float _2337 = _2273 * _2335;
    float _2339 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2327);
    float _2341 = -_2333;
    float _2343 = fma(_2263, _2323, _2341);
    float _2345 = _2273 * _2323;
    float _2347 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2349 = _2343 * _2343;
    float _2351 = -_2347;
    float _2353 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2351);
    float _2355 = fma(_2345, _2345, _2349);
    float _2357 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2353);
    float _2359 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2361 = fma(_2337, _2337, _2355);
    float _2363 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2365 = -_2357;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2339);
    float _2369 = -_2359;
    float _2371 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2369);
    float _2373 = _2257 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2375 = -_2363;
    float _2377 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2375);
    float _2379 = rsqrt(_2361);
    float _2381 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2371);
    float _2383 = -_2373;
    float _2385 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2383);
    float _2387 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2377);
    float _2389 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2391 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2385);
    float _2393 = 1.0 / _2367;
    float _2395 = _2343 * _2379;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = 1.0 / _676;
    float _2401 = -_2397;
    float _2403 = _2401 + 1.0;
    float _2405 = fma(_2381, _2393, -1.0);
    float _2407 = _2403 * _2393;
    float _2409 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2411 = fma(_2403, _2405, 1.0);
    float _2413 = _2391 * _2407;
    float _2415 = _2387 * _2407;
    float _2417 = 1.0 / _680;
    float _2419 = _2411 * _2411;
    float _2421 = fma(_2413, _2413, _2419);
    float _2423 = fma(_2415, _2415, _2421);
    float _2425 = rsqrt(_2423);
    float _2427 = _2415 * _2425;
    float _2429 = _2413 * _2425;
    float _2431 = _2411 * _2425;
    float _2433 = -_2427;
    float _2435 = _2263 * _2433;
    float _2437 = _2265 * _2431;
    float _2439 = -_2429;
    float _2441 = -_2435;
    float _2443 = fma(_2265, _2439, _2441);
    float _2445 = -_2429;
    float _2447 = _2273 * _2445;
    float _2449 = -_2427;
    float _2451 = -_2437;
    float _2453 = fma(_2273, _2449, _2451);
    float _2455 = fma(_2235, _2235, _2239);
    float _2457 = _2443 * _2443;
    float _2459 = -_2447;
    float _2461 = fma(_2263, _2431, _2459);
    float _2463 = sqrt(_2455);
    float _2465 = fma(_2453, _2453, _2457);
    float _2467 = fma(_2461, _2461, _2465);
    float _2469 = rsqrt(_2467);
    float _2471 = _2097 * _2463;
    float _2473 = _2471 * _2389;
    float _2475 = _2471 * _2409;
    float _2477 = _2109 * _2471;
    float _2479 = _2453 * _2469;
    float _2481 = _2461 * _2469;
    float _2483 = _2443 * _2469;
    float _2485 = _2265 * _2479;
    float _2487 = _2273 * _2481;
    float _2489 = -_2485;
    float _2491 = fma(_2263, _2481, _2489);
    float _2493 = _2263 * _2483;
    float _2495 = -_2487;
    float _2497 = fma(_2265, _2483, _2495);
    float _2499 = _2491 * _2491;
    float _2501 = -_2493;
    float _2503 = fma(_2273, _2479, _2501);
    float _2505 = fma(_2497, _2497, _2499);
    float _2507 = fma(_2503, _2503, _2505);
    float _2509 = rsqrt(_2507);
    float _2511 = _2503 * _2509;
    float _2513 = _2497 * _2509;
    float _2515 = _2491 * _2509;
    float _2517 = _2263 * _2511;
    float _2519 = in.m_71.x;
    float _2521 = in.m_71.y;
    float _2523 = in.m_71.z;
    float _2525 = _2265 * _2515;
    float _2527 = _2273 * _2513;
    float _2529 = -_2517;
    float _2531 = fma(_2265, _2513, _2529);
    float _2533 = -_2525;
    float _2535 = fma(_2273, _2511, _2533);
    float _2537 = -_2527;
    float _2539 = fma(_2263, _2515, _2537);
    float _2541 = _2531 * _2531;
    float _2543 = fma(_2535, _2535, _2541);
    float _2545 = fma(_2539, _2539, _2543);
    float _2547 = rsqrt(_2545);
    float _2549 = _2417 * _2521;
    float _2551 = _2245 * _2519;
    float _2553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2549);
    float _2555 = _2399 * _2523;
    float _2557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2551);
    float _2559 = _2553 * _2473;
    float _2561 = _2557 * _2477;
    float _2563 = _2535 * _2547;
    float _2565 = _2555 * _2475;
    float _2567 = _2559 * _2515;
    float _2569 = _2531 * _2547;
    float _2571 = _2559 * _2513;
    float _2573 = _2539 * _2547;
    float _2575 = _2559 * _2511;
    float _2577 = fma(_2561, _2569, _2567);
    float _2579 = fma(_2561, _2563, _2571);
    float _2581 = fma(_2561, _2573, _2575);
    float _2583 = fma(_2273, _2565, _2577);
    float _2585 = fma(_2263, _2565, _2579);
    float _2587 = fma(_2265, _2565, _2581);
    float _2589 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2591 = _1709 + _2585;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2595 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2589);
    float _2597 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2599 = _2591 * 0.20000000298023223876953125;
    float _2601 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2593);
    float _2603 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2595);
    float _2605 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2597);
    float _2607 = floor(_2599);
    float _2609 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2601);
    float _2611 = _2603 * 64.0;
    float _2613 = _1703 + _2587;
    float _2615 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2605);
    float _2617 = _2609 * 49.0;
    float _2619 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2621 = _2613 * 0.20000000298023223876953125;
    float _2623 = _2615 * 64.0;
    float _2625 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2627 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2619);
    float _2629 = floor(_2621);
    float _2631 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2633 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2625);
    float _2635 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2627);
    float _2637 = _1657 + _2583;
    float _2639 = -_2607;
    float _2641 = _2599 + _2639;
    float _2643 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2633);
    float _2645 = _2613 + _2635;
    float _2647 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2631);
    float _2649 = _2641 * 6.283185482025146484375;
    float _2651 = _2591 + _2643;
    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2655 = _2645 + _2653;
    float _2657 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2647);
    float _2659 = _2649 * 0.15915493667125701904296875;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2663 = _2651 + _2661;
    float _2665 = _2655 * _2655;
    float _2667 = -_2629;
    float _2669 = _2621 + _2667;
    float _2671 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2673 = _2637 + _2657;
    float _2675 = fma(_2663, _2663, _2665);
    float _2677 = _2669 * 6.283185482025146484375;
    float _2679 = _2659 * 6.283185482025146484375;
    float _2681 = sin(_2679);
    float _2683 = _2299 + _2671;
    float _2685 = _2677 * 0.15915493667125701904296875;
    bool _2687 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan(0.5);
    bool _2695 = _2691 || _2693;
    float _2697 = sqrt(_2675);
    bool _2699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.5);
    bool _2707 = _2703 || _2705;
    float _2709 = _2685 * 6.283185482025146484375;
    float _2711 = sin(_2709);
    bool _2713 = _2697 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2715 = 1.0 / _2671;
    float _2717 = _2681 + _2711;
    float _2719 = fma(_2717, 0.20000000298023223876953125, _2673);
    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2723 = _2651;
    float _2725 = _2645;
    float _2727 = _2675;
    float _2729 = _2663;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].y);
    if (!_2713)
    {
        _2721 = _2719;
    }
    float _2733 = _2721;
    bool _2735 = !_2713;
    float _2737 = _2733;
    float _2739 = _2715;
    if (!_2735)
    {
        float _2741 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2745 = _2697 + _2743;
        float _2747 = rsqrt(_2675);
        float _2749 = _2745 * _2741;
        float _2751 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2753 = _2749 * 0.15915493667125701904296875;
        float _2755 = _2753 * 6.283185482025146484375;
        float _2757 = cos(_2755);
        float _2759 = _2753 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2757 + (-1.0);
        float _2765 = fma(_2761, _2751, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2767 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = _2747 * _2765;
        float _2771 = fma(_2719, _2757, _2767);
        float _2773 = fma(_2663, _2769, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2775 = fma(_2655, _2769, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2723 = _2773;
        _2737 = _2771;
        _2725 = _2775;
        _2727 = _2747;
    }
    float _2777 = _2723;
    float _2779 = _2737;
    float _2781 = _2725;
    float _2783 = _2727;
    float _2785 = -_2145;
    float _2787 = _2785 + _2777;
    float _2789 = -_2147;
    float _2791 = _2789 + _2779;
    float _2793 = _2683 * _2715;
    float _2795 = _2793 * 0.5;
    float _2797 = -_2153;
    float _2799 = _2797 + _2781;
    float _2801 = _2791;
    float _2803 = _2799;
    float _2805 = _2795;
    float _2807 = _2783;
    if (_2695)
    {
        _2729 = 1.0;
    }
    float _2809 = _2729;
    float _2811 = _2809;
    if (_2707)
    {
        _2739 = _2787;
    }
    float _2813 = _2739;
    float _2815 = _2813;
    if (!_2707)
    {
        float _2817 = _2161 * _2161;
        float _2819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2821 = -_1709;
        float _2823 = _2821 + _2777;
        float _2825 = -_1657;
        float _2827 = _2825 + _2779;
        float _2829 = fma(_2169, _2169, _2817);
        float _2831 = -_1703;
        float _2833 = _2831 + _2781;
        float _2835 = fma(_2175, _2175, _2829);
        float _2837 = 1.0 / _2471;
        float _2839 = sqrt(_2835);
        float _2841 = precise::min(_2839, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2843 = _2841 * _2819;
        float _2845 = _2843 * _2837;
        float _2847 = fma(_2823, _2845, _2157);
        float _2849 = fma(_2827, _2845, _2151);
        float _2851 = fma(_2833, _2845, _2165);
        _2801 = _2849;
        _2815 = _2847;
        _2803 = _2851;
    }
    float _2853 = _2801;
    float _2855 = _2815;
    float _2857 = _2803;
    if (!_2695)
    {
        float _2859 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2861 = _2859 * 0.15915493667125701904296875;
        float _2863 = _2861 * 6.283185482025146484375;
        float _2865 = cos(_2863);
        float _2867 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2869 = _2867 * 0.15915493667125701904296875;
        float _2871 = _2861 * 6.283185482025146484375;
        float _2873 = sin(_2871);
        float _2875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2877 = fma(_2795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2875);
        float _2879 = 1.0 / _2865;
        float _2881 = _2869 * 6.283185482025146484375;
        float _2883 = cos(_2881);
        float _2885 = _2873 * _2879;
        float _2887 = 1.0 / _2877;
        float _2889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2891 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2889;
        float _2893 = _2883 * _2885;
        float _2895 = _2869 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2893;
        float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2903 = _2887 * _2901;
        float _2905 = 1.0 / _2891;
        float _2907 = _2897 * _2899;
        float _2909 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2911 = fma(_2907, _2903, _2909);
        float _2913 = _2911 * _2905;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        _2805 = _2887;
        _2811 = _2915;
    }
    float _2917 = _2805;
    float _2919 = _2811;
    float _2921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2923 = _2853 + _2921;
    float _2925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2927 = _2855 + _2925;
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2931 = _2857 + _2929;
    float _2933 = _2923 * _2923;
    float _2935 = fma(_2927, _2927, _2933);
    float _2937 = fma(_2931, _2931, _2935);
    float _2939 = rsqrt(_2937);
    float _2941 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2943 = _2927 * _2941;
    float _2945 = _2931 * _2941;
    float _2947 = _2943 * _2943;
    float _2949 = _2945 * _2945;
    float _2951 = _2947 + _2949;
    float _2953 = sqrt(_2951);
    bool _2955 = _2953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2959 = _2953 + _2957;
    float _2961 = _2931;
    float _2963 = _2951;
    float _2965 = _2959;
    float _2967 = _2917;
    float _2969 = _2923;
    if (_2955)
    {
        float _2971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2961 = _2971;
    }
    float _2973 = _2961;
    if (_2955)
    {
        float _2975 = rsqrt(_2951);
        _2963 = _2975;
    }
    float _2977 = _2963;
    float _2979 = _2977;
    if (_2955)
    {
        float _2981 = _2959 * _2973;
        _2965 = _2981;
    }
    float _2983 = _2965;
    if (_2955)
    {
        float _2985 = _2983 * 0.15915493667125701904296875;
        _2967 = _2985;
    }
    float _2987 = _2967;
    float _2989 = _2939;
    if (_2955)
    {
        float _2991 = _2987 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        _2989 = _2993;
    }
    float _2995 = _2989;
    float _2997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2999 = precise::max(0.0, _2997);
    float _3001 = _2933;
    float _3003 = _2999;
    float _3005 = _2997;
    if (_2955)
    {
        float _3007 = _2987 * 6.283185482025146484375;
        float _3009 = cos(_3007);
        _3001 = _3009;
    }
    float _3011 = _3001;
    float _3013 = -_2941;
    float _3015 = -_2999;
    float _3017 = fma(_2923, _3013, _3015);
    if (!_2955)
    {
        _2969 = _2945;
    }
    float _3019 = _2969;
    float _3021 = _3019;
    if (_2955)
    {
        float _3023 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3003 = _3023;
    }
    float _3025 = _3003;
    float _3027 = _3025;
    float _3029 = _2995;
    if (_2955)
    {
        float _3031 = fma(_2995, _3025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3027 = _3031;
    }
    float _3033 = _3027;
    float _3035 = _3033;
    if (!_2955)
    {
        _3029 = _2943;
    }
    float _3037 = _3029;
    float _3039 = _3037;
    float _3041 = _3011;
    if (_2955)
    {
        float _3043 = _3011 + (-1.0);
        _3005 = _3043;
    }
    float _3045 = _3005;
    if (_2955)
    {
        float _3047 = _2977 * _3033;
        _2807 = _3047;
    }
    float _3049 = _2807;
    if (!_2955)
    {
        _3035 = _3017;
    }
    float _3051 = _3035;
    float _3053 = _3051;
    if (_2955)
    {
        float _3055 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2183 = _3055;
    }
    float _3057 = _2183;
    if (_2955)
    {
        float _3059 = _2943 * _3049;
        _3039 = _3059;
    }
    float _3061 = _3039;
    float _3063 = sqrt(_2937);
    if (!_2955)
    {
        _2979 = _2947;
    }
    float _3065 = _2979;
    float _3067 = _3065;
    if (_2955)
    {
        float _3069 = fma(_3017, _3011, _3057);
        _3053 = _3069;
    }
    float _3071 = _3053;
    if (_2955)
    {
        float _3073 = _2945 * _3049;
        _3021 = _3073;
    }
    float _3075 = _3021;
    if (_2955)
    {
        float _3077 = _3061 * _3061;
        _3067 = _3077;
    }
    float _3079 = _3067;
    if (!_2955)
    {
        _3041 = _2949;
    }
    float _3081 = _3041;
    float _3083 = _3081;
    if (_2955)
    {
        float _3085 = _3075 * _3075;
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = fma(_3071, _3071, _3079);
    float _3091 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3093 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3095 = _3089 + _3087;
    float _3097 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3091);
    float _3099 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3101 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3093);
    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3105 = fma(_3063, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3103);
    float _3107 = precise::clamp(_3105, 0.0, 1.0);
    float _3109 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3097);
    float _3111 = rsqrt(_3095);
    float _3113 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3115 = -_3107;
    float _3117 = _3115 + 1.0;
    float _3119 = _3109 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3121 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3099);
    float _3123 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3113);
    float _3125 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3101);
    float _3127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3129 = abs(_3117);
    float _3131 = log2(_3129);
    float _3133 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3135 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3121);
    float _3137 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3123);
    float _3139 = _3125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3141 = -_3133;
    float _3143 = fma(_3141, _3127, 1.0);
    float _3145 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3147 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3149 = _3111 * _3061;
    float _3151 = _3111 * _3071;
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3155 = _3111 * _3075;
    float _3157 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3159 = log2(_3143);
    float _3161 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3153);
    float _3163 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3167 = -_3157;
    float _3169 = fma(_3151, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3167);
    float _3171 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3161);
    float _3173 = -_3155;
    float _3175 = fma(_3173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3169);
    float _3177 = exp2(_3165);
    float _3179 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3171);
    float _3181 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3183 = fma(_3175, -0.5, 0.5);
    float _3185 = fma(_3175, 0.5, 0.5);
    float _3187 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3189 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3181);
    float _3191 = _3151 + 1.0;
    float _3193 = 1.0 / _3179;
    float _3195 = fma(_3185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3197 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3189);
    float _3199 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3187);
    float _3201 = _3159 * 0.693147182464599609375;
    float _3203 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3197);
    float _3205 = sqrt(_3183);
    float _3207 = -_3151;
    float _3209 = fma(_3177, _3191, _3207);
    float _3211 = fma(_3185, _3195, -0.212114393711090087890625);
    float _3213 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3199);
    float _3215 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3217 = fma(_3209, 0.5, 0.5);
    float _3219 = fma(_3185, _3211, 1.570728778839111328125);
    float _3221 = _3203 * _3193;
    float _3223 = _3213 * _3193;
    float _3225 = fma(_3221, 0.5, 0.5);
    float _3227 = fma(_3223, -0.5, 0.5);
    float _3229 = _3205 * 0.636619746685028076171875;
    float _3231 = -_3219;
    float _3233 = fma(_3229, _3231, 1.0);
    float3 _8594 = float3(_3225, _3227, _3215);
    float _3235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8594, float3(0.0), isnan(_8594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8594, float3(0.0), isnan(_8594)), level(0.0)).x;
    float3 _8605 = float3(_3225, _3227, _3215);
    float4 _3238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8605, float3(0.0), isnan(_8605)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8605, float3(0.0), isnan(_8605)), level(0.0)).xyzw;
    float _3240 = _3238.x;
    float _3242 = _3238.y;
    float _3244 = _3238.z;
    float _3246 = _3238.w;
    float2 _8622 = float2(_3233, _3217);
    float3 _3250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8622, float2(0.0), isnan(_8622)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8622, float2(0.0), isnan(_8622)), level(0.0)).xyz;
    float _3252 = _3250.x;
    float _3254 = _3250.y;
    float _3256 = _3250.z;
    float _3258 = in.m_73.y;
    bool _3260 = _2549 != 0.0;
    bool _3262 = isnan(_2549);
    bool _3264 = _3260 || _3262;
    bool _3266 = isnan(0.0);
    bool _3268 = _3264 || _3266;
    float _3270 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3272 = in.m_73.z;
    bool _3274 = _2551 == 0.0;
    bool _3276 = !_3268;
    bool _3278 = _3274 && _3276;
    float _3280 = exp2(_3270);
    bool _3282 = _2555 == 0.0;
    bool _3284 = _3282 && _3278;
    out.m_59.x = _648;
    out.m_59.y = _666;
    out.m_59.z = _664;
    out.m_59.w = _668;
    out.m_69.x = _2127;
    out.m_69.y = _2129;
    out.m_69.z = _2133;
    out.m_69.w = _2143;
    out.m_75.x = _2563;
    out.m_75.y = _2569;
    out.m_75.z = _2573;
    out.m_77.x = _2855;
    out.m_77.y = _2853;
    out.m_77.z = _2857;
    int _3286 = as_type<int>(_3225);
    float _3288 = _3139;
    if (_3284)
    {
        float _3290 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3258);
        _2731 = as_type<int>(_3290);
    }
    int _3292 = _2731;
    int _3294 = _3292;
    if (!_3284)
    {
        float _3296 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3258);
        _3294 = as_type<int>(_3296);
    }
    int _3298 = _3294;
    float _3300 = -_3280;
    float _3302 = _3300 + 1.0;
    out.m_79.x = _2157;
    out.m_79.y = _2151;
    out.m_79.z = _2165;
    if (_3284)
    {
        float _3304 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3286 = as_type<int>(_3304);
    }
    int _3306 = _3286;
    int _3308 = _3306;
    if (!_3284)
    {
        float _3310 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3308 = as_type<int>(_3310);
    }
    int _3312 = _3308;
    bool _3314 = !_3284;
    float _3316 = _3314 ? as_type<float>(_3298) : _3258;
    float _3318 = in.m_73.x;
    float _3320 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3322 = !_3284;
    float _3324 = _3322 ? as_type<float>(_3312) : _3272;
    float _3326 = _3316 * _3316;
    float _3328 = fma(_3324, _3324, _3326);
    float _3330 = _3326;
    if (_3284)
    {
        _3330 = _3258;
    }
    float _3332 = _3330;
    float _3334 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3336 = _3332;
    if (!_3284)
    {
        _3336 = as_type<float>(_3298);
    }
    float _3338 = _3336;
    if (_3284)
    {
        _3288 = _3272;
    }
    float _3340 = _3288;
    float _3342 = rsqrt(_3328);
    float _3344 = _3340;
    if (!_3284)
    {
        _3344 = as_type<float>(_3312);
    }
    float _3346 = _3344;
    float _3348 = _2515 * _3338;
    float _3350 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3334);
    float _3352 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3350);
    float _3354 = _3318;
    if (!_3284)
    {
        float _3356 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3318);
        _3354 = _3356;
    }
    float _3358 = _3354;
    bool _3360 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3362 = isnan(_3063);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3368 = _3364 || _3366;
    float _3370 = _3316 * _3342;
    float _3372 = _3324 * _3342;
    float _3374 = -_2263;
    float _3376 = _3370 * _3374;
    float _3378 = -_2273;
    float _3380 = _3370 * _3378;
    float _3382 = -_2265;
    float _3384 = _3370 * _3382;
    if (!_3368)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3386 = _2185;
    float _3388 = fma(_3372, _2513, _3376);
    float _3390 = fma(_3372, _2515, _3380);
    float _3392 = fma(_3372, _2511, _3384);
    float _3394 = fma(_2569, _3358, _3348);
    float _3396 = _2513 * _3338;
    float _3398 = _2511 * _3338;
    float _3400 = _3179 * 0.5;
    out.m_81.x = _3388;
    out.m_81.y = _3390;
    out.m_81.z = _3392;
    float _3402 = fma(_2563, _3358, _3396);
    float _3404 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3352);
    float _3406 = fma(_3213, -0.5, _3400);
    float _3408 = _3203 + _3179;
    float _3410 = _3386;
    float _3412 = _3386;
    if (!_3368)
    {
        _2187 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3414 = _2187;
    float _3416 = _3404 + _3179;
    out.gl_Position.x = _3203;
    out.gl_Position.y = _3213;
    out.gl_Position.z = _3404;
    out.gl_Position.w = _3179;
    float _3418 = _3408 * 0.5;
    float _3420 = _3416 * 0.5;
    float _3422 = fma(_2273, _3346, _3394);
    float _3424 = fma(_2573, _3358, _3398);
    float _3426 = fma(_2263, _3346, _3402);
    out.m_83.x = _3418;
    out.m_83.y = _3406;
    out.m_83.z = _3420;
    out.m_83.w = _3179;
    float _3428 = fma(_2265, _3346, _3424);
    out.m_85.x = _3426;
    out.m_85.y = _3422;
    out.m_85.z = _3428;
    float _3430 = _2919 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3432 = _3320 * _3235;
    float _3434 = -_3320;
    float _3436 = _3434 + 1.0;
    float _3438 = _3246 * _3432;
    float _3440 = _3256 * _3432;
    float _3442 = _3246 * _3436;
    float _3444 = fma(_3252, _3438, _3240);
    float _3446 = fma(_3254, _3438, _3242);
    float _3448 = fma(_3246, _3440, _3244);
    float _3450 = _3438;
    float _3452 = _3414;
    float _3454 = _3414;
    if (!_3368)
    {
        _3450 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3456 = _3450;
    out.m_87.x = _3444;
    out.m_87.y = _3446;
    out.m_87.z = _3448;
    out.m_87.w = _3442;
    bool _3458 = !_3368;
    float _3460 = _3456;
    float _3462 = _3456;
    if (!_3458)
    {
        bool _3464 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3466 = isnan(_3063);
        bool _3468 = _3464 || _3466;
        bool _3470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3472 = _3468 || _3470;
        if (!_3472)
        {
            float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3476 = _3063 + _3474;
            float _3478 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3480 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3478;
            float _3482 = 1.0 / _3480;
            float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3486 = _3484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3490 = _3488 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3492 = _3476 * _3482;
            float _3494 = precise::clamp(_3492, 0.0, 1.0);
            float _3496 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3498 = _3496 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3500 = fma(_3494, _3490, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3502 = fma(_3494, _3498, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3504 = fma(_3494, _3486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3454 = _3504;
            _3412 = _3502;
            _3462 = _3500;
            _3506 = true;
        }
        else
        {
            bool _3508 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3510 = isnan(_3063);
            bool _3512 = _3508 || _3510;
            bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3516 = _3512 || _3514;
            if (!_3516)
            {
                _3410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3518 = _3410;
            _3412 = _3518;
            if (!_3516)
            {
                _3452 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3520 = _3452;
            _3454 = _3520;
            if (!_3516)
            {
                _3460 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3522 = _3460;
            bool _3524 = !_3516;
            _3462 = _3522;
            if (!_3524)
            {
                bool _3526 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3528 = isnan(_3063);
                bool _3530 = _3526 || _3528;
                bool _3532 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3534 = _3530 || _3532;
                if (!_3534)
                {
                    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3538 = _3063 + _3536;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3542 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3540;
                    float _3544 = 1.0 / _3542;
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3554 = _3538 * _3544;
                    float _3556 = precise::clamp(_3554, 0.0, 1.0);
                    float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3562 = fma(_3556, _3552, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3564 = fma(_3556, _3560, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3566 = fma(_3556, _3548, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3454 = _3566;
                    _3412 = _3564;
                    _3462 = _3562;
                    _3506 = true;
                }
                else
                {
                    _3454 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3462 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3506 = false;
    float _3568 = _3454;
    float _3570 = _3412;
    float _3572 = _3462;
    float _3574 = _3430 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_89.x = 0.0;
    float _3576 = _3568 * 0.586610972881317138671875;
    bool _3578 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3574;
    float _3580 = fma(_3570, 0.298911988735198974609375, _3576);
    bool _3582 = _2919 > 0.0;
    bool _3584 = isnan(_2919);
    bool _3586 = _3582 || _3584;
    bool _3588 = isnan(0.0);
    bool _3590 = _3586 || _3588;
    float _3592 = fma(_3572, 0.114477999508380889892578125, _3580);
    float _3594 = -_3592;
    float _3596 = _3594 + _3570;
    float _3598 = -_3592;
    float _3600 = _3598 + _3568;
    float _3602 = -_3592;
    float _3604 = _3602 + _3572;
    float _3606 = fma(_3596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    float _3608 = fma(_3600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    float _3610 = fma(_3604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    bool _3612 = !_3578;
    if (!_3612)
    {
        float _3614 = -_2853;
        float _3616 = _3614 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3618 = -_2855;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3622 = -_2857;
        float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3626 = _3616 * _3616;
        float _3628 = fma(_3620, _3620, _3626);
        float _3630 = fma(_3624, _3624, _3628);
        float _3632 = sqrt(_3630);
        float _3634 = rsqrt(_3630);
        float _3636 = -_3632;
        float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3640 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3642 = precise::clamp(_3640, 0.0, 1.0);
        float _3644 = _3620 * _3634;
        float _3646 = _3616 * _3634;
        float _3648 = abs(_3642);
        float _3650 = log2(_3648);
        float _3652 = _3624 * _3634;
        float _3654 = _3644 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3656 = _3422 * _3646;
        float _3658 = -_3646;
        float _3660 = -_3654;
        float _3662 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3660);
        float _3664 = fma(_3426, _3644, _3656);
        float _3666 = -_3652;
        float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3662);
        float _3670 = fma(_3428, _3652, _3664);
        float _3672 = precise::clamp(_3670, 0.0, 1.0);
        float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3676 = _3668 + _3674;
        float _3678 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3680 = _3676 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3682 = precise::clamp(_3680, 0.0, 1.0);
        float _3684 = exp2(_3678);
        float _3686 = _3684 * _3682;
        float _3688 = _3672 * _3686;
        float _3690 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3692 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3694 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3690;
        out.m_89.y = _3692;
        out.m_89.z = _3694;
    }
    out.m_91.x = _3606;
    out.m_91.y = _3608;
    out.m_91.z = _3610;
    if (_3590)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3696 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3696;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3506 = false;
    bool _704 = false;
    bool _508 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3763 = as_type<float>(_132);
        out.gl_Position.z = _3763;
    }
    if (!_120)
    {
        return out;
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_144;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _134 = as_type<int>(_158);
    }
    int _160 = _134;
    out.m_55.x = _146;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3822 = as_type<float>(_160);
        out.gl_Position.z = _3822;
    }
    if (_154)
    {
        return out;
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _184;
    if (!_168)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _166;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _210 = 1.0 / _196;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _212;
    bool _216 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _218 = isnan(_188);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = 1.0 / _204;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _188 + _230;
    bool _234 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_188);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _246;
    float _250 = 1.0 / _200;
    float _252 = _232 * _210;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _188 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = fma(_248, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = fma(_260, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = 1.0 / _214;
    float _270 = _256 * _228;
    bool _272 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _274 = isnan(_188);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _188 + _284;
    bool _288 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_188);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = 1.0 / _208;
    float _302 = _192 * _250;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = _188 + _304;
    bool _308 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_188);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_282;
    float _322 = _320 + 1.0;
    float _324 = _306 * _268;
    bool _326 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_188);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_318;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = _336 * _340;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    float _352 = _286 * _300;
    float _354 = _298 * _322;
    float _356 = -_298;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = _244 * _350;
    float _366 = -_244;
    float _368 = _366 + 1.0;
    float _370 = _226 * _358;
    float _372 = -_226;
    float _374 = _372 + 1.0;
    float _376 = fma(_362, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = fma(_344, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = _318 * _374;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _376 * _364;
    float _392 = _266 * _364;
    float _394 = _262 * _364;
    float _396 = fma(_384, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_388, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _406 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _412 = fma(_402, _270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_378, _346, _404);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _416;
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_410, _352, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _432 = fma(_412, _380, _414);
    float _434 = fma(_418, _270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_396, _346, _420);
    float _438 = fma(_424, _270, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _444 = fma(_398, _346, _406);
    float _446 = fma(_430, _352, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _448 = fma(_434, _380, _436);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _454;
    float _458 = fma(_442, _352, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _460 = fma(_438, _380, _444);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _462;
    float _466 = fma(_452, _324, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _468 = fma(_456, _324, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _470 = fma(_426, _370, _432);
    float _472 = fma(_464, _324, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _474 = fma(_446, _370, _448);
    float _476 = fma(_458, _370, _460);
    float _478 = fma(_466, _354, _470);
    float _480 = fma(_468, _354, _474);
    float _482 = fma(_472, _354, _476);
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].x, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].y, _480);
    float _488 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].z, _482);
    bool _490 = !_264;
    float _506;
    if (!_490)
    {
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        _506 = _166;
    }
    _508 = false;
    float _510 = _506;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _510 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _524 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_510);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _540 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _542 = isnan(_510);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _518;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _554;
    float _558 = -_534;
    float _560 = _558 + 1.0;
    bool _562 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _564 = isnan(_510);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _522;
    float _578 = 1.0 / _538;
    float _580 = _556 * _552;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _586 = _550 * _560;
    float _588 = -_550;
    float _590 = _588 + 1.0;
    float _592 = fma(_580, _514, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _594;
    float _598 = _572 * _590;
    float _600 = _584 * _576;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _604 = _510 + _602;
    bool _606 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _608 = isnan(_510);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _592 * _598;
    float _620 = -_572;
    float _622 = _620 + 1.0;
    float _624 = fma(_600, _604, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = _510 + _626;
    float _630 = _596 * _578;
    float _632 = -_616;
    float _634 = _632 + 1.0;
    float _636 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _618);
    float _638 = fma(_630, _628, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _640 = _534 * _634;
    float _642 = fma(_624, _586, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _646 = fma(_638, _640, _642);
    float _648 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[118].x, _646);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _658 = in.m_57.x;
    float _660 = in.m_57.y;
    float _662 = in.m_57.z;
    float _664 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = _650 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _670 = _656 * _146;
    out.m_59.x = _648;
    out.m_59.y = _666;
    out.m_59.z = _664;
    out.m_59.w = _668;
    float _672 = trunc(_670);
    int _674 = int(_672);
    float _676 = _488 * _662;
    float _678 = _484 * _658;
    float _680 = _486 * _660;
    int _682 = _674 << 4;
    int _684 = _682 + 1968;
    bool _686 = !_574;
    float _702;
    if (!_686)
    {
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _690 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        _702 = _166;
    }
    _704 = false;
    float _706 = _702;
    float _708 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _710 = int(_708);
    float _712 = in.m_61.y;
    float _714 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _716 = in.m_53.y;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _720 = _718 != 0;
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _724 = int(_722);
    float _726 = in.m_61.x;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = in.m_53.z;
    float _738 = float(_710);
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = float(_724);
    float _750 = 1.0 / _738;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _758 = _716 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _760 = _716 > 0.5;
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _764 = int(_762);
    float _766 = float(uint(_742));
    int _768 = ~_742;
    int _770 = _768 + 1;
    bool _772 = _736 > 0.5;
    float _774 = float(_742);
    float _776 = 1.0 / _748;
    float _778 = _116 * _750;
    float _780 = 1.0 / _766;
    float _782 = float(uint(_764));
    int _784 = ~_742;
    int _786 = _784 + 1;
    float _788 = trunc(_778);
    int _790 = int(_788);
    float _792 = _116 * _776;
    float _794 = 1.0 / _782;
    int _796 = as_type<int>(_780) + (-2);
    float _798 = trunc(_792);
    int _800 = int(_798);
    float _802 = float(uint(_790));
    float _804 = float(_790);
    float _806 = as_type<float>(_796) * _802;
    int _808 = as_type<int>(_794) + (-2);
    float _810 = 1.0 / _746;
    float _812 = float(uint(_800));
    float _814 = trunc(_806);
    float _816 = precise::max(_814, 0.0);
    uint _819 = uint(_816);
    float _821 = as_type<float>(_808) * _812;
    float _823 = trunc(_821);
    float _825 = precise::max(_823, 0.0);
    uint _827 = uint(_825);
    int _829 = _786 * int(_819);
    int _831 = _829 + _790;
    float _833 = _821;
    bool _835 = _760;
    int _837 = int(_819);
    float _839 = _712;
    float _841 = _726;
    float _843 = _716;
    if (!_720)
    {
        _833 = _726;
    }
    float _845 = _833;
    float _847 = 1.0 / _754;
    float _849 = float(uint(_831));
    int _851 = ~_764;
    int _853 = _851 + 1;
    float _855 = as_type<float>(_796) * _849;
    int _857 = _853 * int(_827);
    int _859 = _857 + _800;
    float _861 = trunc(_855);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    float _867 = float(uint(_859));
    float _869 = as_type<float>(_808) * _867;
    float _871 = -_712;
    float _873 = _871 + 1.0;
    float _875 = trunc(_869);
    float _877 = precise::max(_875, 0.0);
    uint _879 = uint(_877);
    int _881 = _760 ? as_type<int>(_873) : as_type<int>(_712);
    float _883 = _845;
    if (_720)
    {
        bool _885 = _146 > 0.5;
        _835 = _885;
    }
    bool _887 = _835;
    int _889 = int(_819) + int(_865);
    if (_720)
    {
        float _891 = -_726;
        float _893 = _891 + 1.0;
        _837 = as_type<int>(_893);
    }
    int _895 = _837;
    float _897 = _734 ? as_type<float>(_881) : _712;
    if (_730)
    {
        float _899 = _772 ? _873 : _712;
        _839 = _899;
    }
    float _901 = _839;
    int _903 = _770 * _889;
    int _905 = _903 + _790;
    if (_720)
    {
        float _907 = _887 ? as_type<float>(_895) : _726;
        _883 = _907;
    }
    float _909 = _883;
    int _911 = ~_764;
    int _913 = _911 + 1;
    int _915 = int(_827) + int(_879);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _919 = _917 != 0;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _923 = _921 != 0;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _927 = _925 != 0;
    bool _929 = uint(_905) >= uint(_742);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _933 = _931 != 0;
    bool _935 = !_923;
    int _937 = _935 ? 0 : 1;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _941 = _939 != 0;
    int _943 = _913 * _915;
    int _945 = _943 + _800;
    bool _947 = !_933;
    int _949 = _947 ? 0 : 1;
    bool _951 = !_929;
    int _953 = _951 ? 0 : (-1);
    bool _955 = !_927;
    int _957 = _955 ? 0 : 1;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _977 = _975 != 0;
    bool _979 = !_919;
    int _981 = _979 ? 0 : 1;
    bool _983 = uint(_945) >= uint(_764);
    float _985 = in.m_44.x;
    float _987 = in.m_44.y;
    float _989 = in.m_44.z;
    bool _991 = !_983;
    int _993 = _991 ? 0 : (-1);
    bool _995 = !_965;
    int _997 = _995 ? 0 : 1;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1001 = 0.0;
    if (_977)
    {
        _1001 = 1.0;
    }
    float _1003 = _1001;
    float _1005 = _1003;
    if (!_977)
    {
        _1005 = 7.345489978790283203125;
    }
    float _1007 = _1005;
    float _1009 = fma(_758, -2.0, _999);
    float _1011 = 0.0;
    if (_977)
    {
        _1011 = _146;
    }
    float _1013 = _1011;
    float _1015 = 0.0;
    float _1017 = _1013;
    if (_977)
    {
        _1015 = 1.0;
    }
    float _1019 = _1015;
    float _1021 = _1007 * _146;
    float _1023 = _1019;
    if (!_977)
    {
        _1017 = _716;
    }
    float _1025 = _1017;
    float _1027 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    if (!_977)
    {
        _1023 = 1.2345600128173828125;
    }
    float _1029 = _1023;
    float _1031 = floor(_1021);
    bool _1033 = !_961;
    int _1035 = _1033 ? 0 : 1;
    bool _1037 = !_969;
    int _1039 = _1037 ? 0 : 1;
    float _1041 = _1025 * _1029;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1045 = _1043 != 0;
    float _1047 = _987 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1051 = _1049 != 0;
    float _1053 = _987 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1057 = _1055 != 0;
    float _1059 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1047);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1063 = _1061 != 0;
    float _1065 = -_756;
    float _1067 = fma(_714, 2.0, _1065);
    bool _1069 = _804 >= _774;
    bool _1071 = isnan(_804);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan(_774);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _987 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1083;
    float _1087 = floor(_1041);
    float _1089 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1053);
    float _1091 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1081);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1097 = float(_764);
    float _1099 = _1085 * _810;
    float _1101 = float(_800);
    float _1103 = _1095 * _847;
    float _1105 = trunc(_1079);
    int _1107 = int(_1105);
    float _1109 = -_1031;
    float _1111 = _1021 + _1109;
    bool _1113 = _1101 >= _1097;
    bool _1115 = isnan(_1101);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(_1097);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1091);
    int _1127 = ~_889;
    int _1129 = _1127 + _953;
    int _1131 = _1129 + 1;
    float _1133 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1059);
    float _1135 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1089);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1139 = _706 + _1137;
    float _1141 = trunc(_1123);
    int _1143 = int(_1141);
    bool _1145 = !_973;
    int _1147 = _1145 ? 0 : 1;
    int _1149 = _742 * _1131;
    int _1151 = _1149 + _790;
    bool _1153 = _742 == 0;
    float _1155 = _1111 * _774;
    float _1157 = fma(_1099, _1139, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1159 = -_1087;
    float _1161 = _1041 + _1159;
    bool _1163 = !_1153;
    int _1165 = _1163 ? _1151 : (-1);
    float _1167 = trunc(_1155);
    int _1169 = int(_1167);
    int _1171 = ~_1107;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    float _1177 = _1161 * _1097;
    int _1179 = ~_915;
    int _1181 = _1179 + _993;
    int _1183 = _1181 + 1;
    float _1185 = _166 * _774;
    float _1187 = _166 * _1097;
    int _1189 = _1165 * _1175;
    bool _1191 = !_1051;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _764 * _1183;
    int _1197 = _1195 + _800;
    bool _1199 = _764 == 0;
    float _1201 = trunc(_1185);
    int _1203 = int(_1201);
    int _1205 = ~_1143;
    int _1207 = _1205 + 1;
    int _1209 = _1207 + 1;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1213 = _706 + _1211;
    bool _1215 = !_1199;
    int _1217 = _1215 ? _1197 : (-1);
    float _1219 = -_116;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1067);
    int _1223 = abs(_949);
    int _1225 = _742 + (-1);
    int _1227 = _1217 * _1209;
    int _1229 = abs(_937);
    float _1231 = fma(_1103, _1213, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1233 = _1169 * _1223;
    int _1235 = _1233 + _790;
    int _1237 = abs(_981);
    int _1239 = _1107 * _1225;
    int _1241 = _1239 + _1189;
    float _1243 = trunc(_1177);
    int _1245 = int(_1243);
    int _1247 = _764 + (-1);
    int _1249 = _1241 * _1229;
    bool _1251 = !_941;
    int _1253 = _1251 ? 0 : 1;
    int _1255 = abs(_957);
    float _1257 = trunc(_1187);
    int _1259 = int(_1257);
    int _1261 = _1203 * _1237;
    int _1263 = _1261 + _1249;
    int _1265 = abs(_997);
    int _1267 = _1143 * _1247;
    int _1269 = _1267 + _1227;
    int _1271 = abs(_1193);
    int _1273 = _1235 * _1255;
    int _1275 = _1273 + _1263;
    int _1277 = abs(_1035);
    int _1279 = _1269 * _1265;
    int _1281 = abs(_1039);
    int _1283 = abs(_1253);
    int _1285 = _1169 * _1283;
    int _1287 = _1285 + _1275;
    int _1289 = abs(_1147);
    int _1291 = _1245 * _1271;
    int _1293 = _1291 + _800;
    int _1295 = _1259 * _1277;
    int _1297 = _1295 + _1279;
    float _1299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1301 = _1293 * _1281;
    int _1303 = _1301 + _1297;
    float _1305 = float(uint(_1287));
    float _1307 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1311 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1313 = isnan(_706);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = as_type<float>(_796) * _1305;
    bool _1325 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1327 = isnan(_706);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    int _1337 = _1245 * _1289;
    int _1339 = _1337 + _1303;
    bool _1341 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1343 = isnan(_706);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = -_1321;
    float _1355 = _1353 + 1.0;
    float _1357 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1309);
    float _1359 = trunc(_1323);
    float _1361 = precise::max(_1359, 0.0);
    uint _1363 = uint(_1361);
    float _1365 = float(uint(_1339));
    float _1367 = _1351 * _1355;
    float _1369 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1357);
    float _1371 = -_1351;
    float _1373 = _1371 + 1.0;
    int _1375 = _1277;
    int _1377 = as_type<int>(_1365);
    float _1379 = _1373;
    if (_977)
    {
        _1375 = 0;
    }
    int _1381 = _1375;
    float _1383 = as_type<float>(_808) * _1365;
    float _1385 = -_1027;
    float _1387 = fma(_1369, _1307, _1385);
    int _1389 = _1381;
    if (!_977)
    {
        _1389 = 2;
    }
    int _1391 = _1389;
    float _1393 = _1335 * _1373;
    if (_1057)
    {
        float _1395 = -_726;
        float _1397 = _1395 + 1.0;
        _1377 = as_type<int>(_1397);
    }
    int _1399 = _1377;
    bool _1401 = _716 > 0.5;
    float _1403 = trunc(_1383);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    bool _1409 = _1391 != 2;
    float _1411 = _1157 * _1393;
    int _1413 = ~_742;
    int _1415 = _1413 + 1;
    float _1417 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_1057)
    {
        _1379 = _726;
    }
    float _1419 = _1379;
    float _1421 = _1387 + 0.5;
    float _1423 = _1419;
    if (_1057)
    {
        float _1425 = _1401 ? as_type<float>(_1399) : _726;
        _1423 = _1425;
    }
    float _1427 = _1423;
    float _1429 = -_1335;
    float _1431 = _1429 + 1.0;
    float _1433 = float(uint(_1235));
    int _1435 = _1415 * int(_1363);
    int _1437 = _1435 + _1287;
    float _1439 = fma(_1417, _901, -0.5);
    int _1441 = ~_764;
    int _1443 = _1441 + 1;
    float _1445 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1411);
    float _1447 = as_type<float>(_796) * _1433;
    float _1449 = float(uint(_1437));
    float _1451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1409)
    {
        _841 = _146;
    }
    float _1453 = _841;
    int _1455 = _1443 * int(_1407);
    int _1457 = _1455 + _1339;
    float _1459 = _1453;
    if (!_1409)
    {
        _1459 = _736;
    }
    float _1461 = _1459;
    float _1463 = as_type<float>(_796) * _1449;
    float _1465 = fma(_1231, _1367, _1445);
    float _1467 = float(uint(_1457));
    float _1469 = trunc(_1447);
    float _1471 = precise::max(_1469, 0.0);
    uint _1473 = uint(_1471);
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1477 = as_type<float>(_808) * _1467;
    int _1479 = ~_742;
    int _1481 = _1479 + 1;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1485 = ~_764;
    int _1487 = _1485 + 1;
    float _1489 = trunc(_1463);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    float _1495 = float(uint(_1293));
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1499 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1475);
    float _1501 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1503 = as_type<float>(_808) * _1495;
    float _1505 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1497);
    int _1507 = _1481 * int(_1473);
    int _1509 = _1507 + _1235;
    float _1511 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1483);
    float _1513 = trunc(_1477);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    int _1519 = ~_742;
    int _1521 = _1519 + 1;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1409)
    {
        _843 = _146;
    }
    float _1525 = _843;
    float _1527 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1511);
    float _1529 = float(uint(_1509));
    float _1531 = -_1523;
    float _1533 = fma(_1501, 2.0, _1531);
    int _1535 = int(_1363) + int(_1493);
    float _1537 = trunc(_1503);
    float _1539 = precise::max(_1537, 0.0);
    uint _1541 = uint(_1539);
    float _1543 = as_type<float>(_796) * _1529;
    float _1545 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1505);
    int _1547 = _1521 * _1535;
    int _1549 = _1547 + _1287;
    float _1551 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1553 = int(_1407) + int(_1517);
    float _1555 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1557 = uint(_1549) >= uint(_742);
    float _1559 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1499);
    int _1561 = ~_764;
    int _1563 = _1561 + 1;
    float _1565 = fma(_1551, _1427, -0.5);
    float _1567 = trunc(_1543);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = _1487 * int(_1541);
    int _1575 = _1573 + _1293;
    int _1577 = _1563 * _1553;
    int _1579 = _1577 + _1339;
    int _1581 = ~_764;
    int _1583 = _1581 + 1;
    float _1585 = float(uint(_1575));
    float _1587 = fma(_1559, _1555, _1221);
    bool _1589 = !_1557;
    int _1591 = _1589 ? 0 : (-1);
    float _1593 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1465);
    bool _1595 = uint(_1579) >= uint(_764);
    float _1597 = as_type<float>(_808) * _1585;
    int _1599 = ~_1535;
    int _1601 = _1599 + _1591;
    int _1603 = _1601 + 1;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1607 = !_1595;
    int _1609 = _1607 ? 0 : (-1);
    float _1611 = trunc(_1597);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    int _1617 = int(_1473) + int(_1571);
    int _1619 = _742 * _1603;
    int _1621 = _1619 + _1287;
    int _1623 = ~_1553;
    int _1625 = _1623 + _1609;
    int _1627 = _1625 + 1;
    float _1629 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1631 = ~_742;
    int _1633 = _1631 + 1;
    bool _1635 = !_1153;
    int _1637 = _1635 ? _1621 : (-1);
    int _1639 = _764 * _1627;
    int _1641 = _1639 + _1339;
    float _1643 = fma(_1629, -2.0, _1605);
    int _1645 = _1633 * _1617;
    int _1647 = _1645 + _1235;
    int _1649 = _1637 & 3;
    bool _1651 = _1649 != 0;
    bool _1653 = !_1199;
    int _1655 = _1653 ? _1641 : (-1);
    float _1657 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1659 = uint(_1649) > 1u;
    float _1661 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1643);
    int _1663 = _1637 & 3;
    bool _1665 = _1663 != 0;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1669 = _1657 + _1667;
    int _1671 = _1655 >> 31;
    float _1673 = -_1661;
    float _1675 = fma(_1545, _1439, _1673);
    int _1677 = _1637 >> 31;
    int _1679 = _1665 ? 0 : 1;
    int _1681 = _1671 & 3;
    int _1683 = _1677 & 3;
    int _1685 = ~_1679;
    int _1687 = _1685 + 1;
    int _1689 = _1687 + 1;
    int _1691 = _1655 + _1681;
    int _1693 = _1689;
    float _1695 = _1593;
    if (!_1659)
    {
        int _1697 = ~_1679;
        int _1699 = _1697 + 1;
        _1693 = _1699;
    }
    int _1701 = _1693;
    float _1703 = _1135 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1705 = uint(_1649) >= 2u;
    int _1707 = _1637 + _1683;
    float _1709 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1711 = _1691 >> 2;
    int _1713 = _1705 ? 0 : 1;
    float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1717 = _1709 + _1715;
    bool _1719 = _1649 != 3;
    int _1721 = _1707 >> 2;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1725 = _1703 + _1723;
    int _1727 = _1711 << 4;
    int _1729 = _1727 + 512;
    int _1731 = int(_1541) + int(_1615);
    int _1733 = _1721 << 4;
    int _1735 = _1733 + 368;
    uint _1737 = uint(int(uint(_1729) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c9)._m0[int(_1747)][_1749];
    bool _1753 = uint(_1647) >= uint(_742);
    int _1755 = _1583 * _1731;
    int _1757 = _1755 + _1293;
    float _1759 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1761 = ~_1713;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = _1765;
    if (_1719)
    {
        int _1769 = ~_1713;
        int _1771 = _1769 + 1;
        _1767 = _1771;
    }
    int _1773 = _1767;
    float _1775 = -_116;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1533);
    uint _1779 = uint(int(uint(_1735) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[int(_1789)][_1791];
    bool _1795 = uint(_1757) >= uint(_764);
    float _1797 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1759);
    bool _1799 = !_1753;
    int _1801 = _1799 ? 0 : (-1);
    float _1803 = fma(_1527, _1565, _1777);
    bool _1805 = !_1045;
    int _1807 = _1805 ? 0 : 1;
    float _1809 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1797);
    int _1811 = _1655 & 3;
    bool _1813 = _1811 != 0;
    int _1815 = _1729 + 8;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[int(_1827)][_1829];
    int _1833 = _1655 & 3;
    bool _1835 = _1833 != 0;
    float _1837 = _1587 + 0.5;
    bool _1839 = !_1795;
    int _1841 = _1839 ? 0 : (-1);
    bool _1843 = uint(_1833) > 1u;
    int _1845 = _1813 ? 0 : 1;
    out.m_63.x = _1837;
    out.m_63.y = _1421;
    bool _1847 = _1809 >= 0.0;
    int _1849 = _1735 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = ~_1617;
    int _1869 = _1867 + _1801;
    int _1871 = _1869 + 1;
    int _1873 = ~_1845;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = abs(_1773);
    int _1881 = _742 * _1871;
    int _1883 = _1881 + _1235;
    int _1885 = _1877;
    if (!_1843)
    {
        int _1887 = ~_1845;
        int _1889 = _1887 + 1;
        _1885 = _1889;
    }
    int _1891 = _1885;
    bool _1893 = _1649 != 3;
    int _1895 = abs(_1891);
    if (_1847)
    {
        out.m_51.x = 0.0;
    }
    int _1897 = abs(_1701);
    bool _1899 = !_1651;
    int _1901 = _1899 ? 0 : 1;
    bool _1903 = !_1835;
    int _1905 = _1903 ? 0 : 1;
    bool _1907 = uint(_1833) >= 2u;
    int _1909 = ~_1895;
    int _1911 = _1909 + 1;
    int _1913 = _1911 + 1;
    bool _1915 = _1833 != 3;
    int _1917 = abs(_1905);
    int _1919 = ~_1897;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    int _1925 = _1907 ? 0 : 1;
    bool _1927 = _1833 != 3;
    int _1929 = _1913 * as_type<int>(_1751);
    int _1931 = abs(_1901);
    int _1933 = _1923 * as_type<int>(_1793);
    uint _1935 = uint(int(uint(_684) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[int(_1945)][_1947];
    int _1951 = ~_1931;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = ~_1917;
    int _1959 = _1957 + 1;
    int _1961 = _1959 + 1;
    int _1963 = ~_1925;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    int _1969 = _1955 * as_type<int>(_1785);
    int _1971 = _1969 + _1933;
    int _1973 = _1967;
    if (_1915)
    {
        int _1975 = ~_1925;
        int _1977 = _1975 + 1;
        _1973 = _1977;
    }
    int _1979 = _1973;
    int _1981 = _684 + 8;
    uint _1983 = uint(int(uint(_1981) >> uint(2)));
    uint _1985 = uint(int(uint(int(_1983)) >> uint(2)));
    int _1987 = int(_1983) & 3;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[int(_1985)][_1987];
    int _1991 = _1961 * as_type<int>(_1743);
    int _1993 = _1991 + _1929;
    bool _1995 = !_1893;
    int _1997 = _1995 ? 0 : (-1);
    int _1999 = abs(_1979);
    bool _2001 = !_1927;
    int _2003 = _2001 ? 0 : (-1);
    int _2005 = abs(_1997);
    int _2007 = ~_1879;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    int _2013 = abs(_2003);
    int _2015 = ~_1999;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _2011 * as_type<int>(_1857);
    int _2023 = _2021 + _1971;
    bool _2025 = !_1063;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = _2019 * as_type<int>(_1823);
    int _2031 = _2029 + _1993;
    int _2033 = abs(_1807);
    int _2035 = ~_2013;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = abs(_2027);
    int _2043 = _2039 * as_type<int>(_1831);
    int _2045 = _2043 + _2031;
    int _2047 = ~_2005;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    float _2053 = _1669 * _1669;
    int _2055 = ~_1731;
    int _2057 = _2055 + _1841;
    int _2059 = _2057 + 1;
    int _2061 = _2051 * as_type<int>(_1865);
    int _2063 = _2061 + _2023;
    float _2065 = fma(_1717, _1717, _2053);
    int _2067 = ~_2041;
    int _2069 = _2067 + 1;
    int _2071 = _2069 + 1;
    int _2073 = _764 * _2059;
    int _2075 = _2073 + _1293;
    int _2077 = ~_2033;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = fma(_1725, _1725, _2065);
    float _2085 = _1823;
    int _2087 = as_type<int>(_2053);
    if (_1847)
    {
        _2085 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2089 = _2085;
    int _2091 = _2045 * _2071;
    bool _2093 = !_1153;
    int _2095 = _2093 ? _1883 : (-1);
    float _2097 = rsqrt(_2083);
    bool _2099 = !_1199;
    int _2101 = _2099 ? _2075 : (-1);
    int _2103 = _2063 * _2081;
    if (_1847)
    {
        float _2105 = _2089 * 5.0;
        _2087 = as_type<int>(_2105);
    }
    int _2107 = _2087;
    float _2109 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2111 = _2095 * _2033;
    int _2113 = _2111 + _2103;
    float _2115 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2117 = _2101 * _2041;
    int _2119 = _2117 + _2091;
    float _2121 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1847)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6778 = as_type<float>(_2107);
        out.gl_Position.z = _6778;
    }
    float _2125 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2127 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = float(_2113);
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = float(_2119);
    float _2137 = _2125 * _2097;
    out.m_65.x = _2131;
    out.m_65.y = _2135;
    float _2139 = _1803 + 0.5;
    float _2141 = _1675 + 0.5;
    float _2143 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2145 = _1717 * _2137;
    float _2147 = _1669 * _2137;
    out.m_67.x = _2139;
    out.m_67.y = _2141;
    out.m_69.x = _2127;
    out.m_69.y = _2129;
    out.m_69.z = _2133;
    out.m_69.w = _2143;
    if (_1847)
    {
        return out;
    }
    float _2149 = -_2147;
    float _2151 = _1657 + _2149;
    float _2153 = _1725 * _2137;
    float _2155 = -_2145;
    float _2157 = _1709 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2161 = _2151 + _2159;
    float _2163 = -_2153;
    float _2165 = _1703 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2157 + _2167;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2175 = _2165 + _2173;
    float _2177 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2171);
    float _2179 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2177);
    bool _2181 = _2179 >= 0.0;
    float _2183 = _2153;
    float _2185 = _2151;
    float _2187 = _2157;
    if (_2181)
    {
        _1695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2189 = _1695;
    int _2191 = as_type<int>(_2189);
    if (_2181)
    {
        out.m_51.x = 0.0;
    }
    if (_2181)
    {
        float _2193 = _2189 * 5.0;
        _2191 = as_type<int>(_2193);
    }
    int _2195 = _2191;
    if (_2181)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6918 = as_type<float>(_2195);
        out.gl_Position.z = _6918;
    }
    if (_2181)
    {
        return out;
    }
    float _2197 = -_1657;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2201 = -_1709;
    float _2203 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2205 = -_1703;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2209 = _2199 * _2199;
    float _2211 = -_2147;
    float _2213 = _1669 + _2211;
    float _2215 = fma(_2203, _2203, _2209);
    float _2217 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2219 = fma(_2207, _2207, _2215);
    float _2221 = -_2145;
    float _2223 = _1717 + _2221;
    float _2225 = -_2217;
    float _2227 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2225);
    float _2229 = _2213 * _2213;
    float _2231 = rsqrt(_2219);
    float _2233 = -_2153;
    float _2235 = _1725 + _2233;
    float _2237 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2239 = fma(_2223, _2223, _2229);
    float _2241 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2237);
    float _2243 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2245 = 1.0 / _678;
    float _2247 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2249 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2251 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2241);
    float _2253 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2243);
    float _2255 = -_2247;
    float _2257 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2255);
    float _2259 = -_2249;
    float _2261 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2259);
    float _2263 = _2203 * _2231;
    float _2265 = _2207 * _2231;
    float _2267 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2269 = _2257 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2271 = _2263 * _2263;
    float _2273 = _2199 * _2231;
    float _2275 = -_2267;
    float _2277 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2275);
    float _2279 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2281 = fma(_2265, _2265, _2271);
    float _2283 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2287 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2253);
    float _2289 = rsqrt(_2281);
    float _2291 = -_2283;
    float _2293 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2291);
    float _2295 = -_2285;
    float _2297 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2295);
    float _2299 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2301 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2277);
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2305 = -_2269;
    float _2307 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2305);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2311 = -_2279;
    float _2313 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2311);
    float _2315 = -_2303;
    float _2317 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2315);
    float _2319 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2307);
    float _2321 = _2265 * _2289;
    float _2323 = _2263 * _2289;
    float _2325 = -_2309;
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2325);
    float _2329 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2313);
    float _2331 = -_2321;
    float _2333 = _2265 * _2331;
    float _2335 = -_2321;
    float _2337 = _2273 * _2335;
    float _2339 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2327);
    float _2341 = -_2333;
    float _2343 = fma(_2263, _2323, _2341);
    float _2345 = _2273 * _2323;
    float _2347 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2349 = _2343 * _2343;
    float _2351 = -_2347;
    float _2353 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2351);
    float _2355 = fma(_2345, _2345, _2349);
    float _2357 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2353);
    float _2359 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2361 = fma(_2337, _2337, _2355);
    float _2363 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2365 = -_2357;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2339);
    float _2369 = -_2359;
    float _2371 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2369);
    float _2373 = _2257 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2375 = -_2363;
    float _2377 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2375);
    float _2379 = rsqrt(_2361);
    float _2381 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2371);
    float _2383 = -_2373;
    float _2385 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2383);
    float _2387 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2377);
    float _2389 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2391 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2385);
    float _2393 = 1.0 / _2367;
    float _2395 = _2343 * _2379;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = 1.0 / _676;
    float _2401 = -_2397;
    float _2403 = _2401 + 1.0;
    float _2405 = fma(_2381, _2393, -1.0);
    float _2407 = _2403 * _2393;
    float _2409 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2411 = fma(_2403, _2405, 1.0);
    float _2413 = _2391 * _2407;
    float _2415 = _2387 * _2407;
    float _2417 = 1.0 / _680;
    float _2419 = _2411 * _2411;
    float _2421 = fma(_2413, _2413, _2419);
    float _2423 = fma(_2415, _2415, _2421);
    float _2425 = rsqrt(_2423);
    float _2427 = _2415 * _2425;
    float _2429 = _2413 * _2425;
    float _2431 = _2411 * _2425;
    float _2433 = -_2427;
    float _2435 = _2263 * _2433;
    float _2437 = _2265 * _2431;
    float _2439 = -_2429;
    float _2441 = -_2435;
    float _2443 = fma(_2265, _2439, _2441);
    float _2445 = -_2429;
    float _2447 = _2273 * _2445;
    float _2449 = -_2427;
    float _2451 = -_2437;
    float _2453 = fma(_2273, _2449, _2451);
    float _2455 = fma(_2235, _2235, _2239);
    float _2457 = _2443 * _2443;
    float _2459 = -_2447;
    float _2461 = fma(_2263, _2431, _2459);
    float _2463 = sqrt(_2455);
    float _2465 = fma(_2453, _2453, _2457);
    float _2467 = fma(_2461, _2461, _2465);
    float _2469 = rsqrt(_2467);
    float _2471 = _2097 * _2463;
    float _2473 = _2471 * _2389;
    float _2475 = _2471 * _2409;
    float _2477 = _2109 * _2471;
    float _2479 = _2453 * _2469;
    float _2481 = _2461 * _2469;
    float _2483 = _2443 * _2469;
    float _2485 = _2265 * _2479;
    float _2487 = _2273 * _2481;
    float _2489 = -_2485;
    float _2491 = fma(_2263, _2481, _2489);
    float _2493 = _2263 * _2483;
    float _2495 = -_2487;
    float _2497 = fma(_2265, _2483, _2495);
    float _2499 = _2491 * _2491;
    float _2501 = -_2493;
    float _2503 = fma(_2273, _2479, _2501);
    float _2505 = fma(_2497, _2497, _2499);
    float _2507 = fma(_2503, _2503, _2505);
    float _2509 = rsqrt(_2507);
    float _2511 = _2503 * _2509;
    float _2513 = _2497 * _2509;
    float _2515 = _2491 * _2509;
    float _2517 = _2263 * _2511;
    float _2519 = in.m_71.x;
    float _2521 = in.m_71.y;
    float _2523 = in.m_71.z;
    float _2525 = _2265 * _2515;
    float _2527 = _2273 * _2513;
    float _2529 = -_2517;
    float _2531 = fma(_2265, _2513, _2529);
    float _2533 = -_2525;
    float _2535 = fma(_2273, _2511, _2533);
    float _2537 = -_2527;
    float _2539 = fma(_2263, _2515, _2537);
    float _2541 = _2531 * _2531;
    float _2543 = fma(_2535, _2535, _2541);
    float _2545 = fma(_2539, _2539, _2543);
    float _2547 = rsqrt(_2545);
    float _2549 = _2417 * _2521;
    float _2551 = _2245 * _2519;
    float _2553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2549);
    float _2555 = _2399 * _2523;
    float _2557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2551);
    float _2559 = _2553 * _2473;
    float _2561 = _2557 * _2477;
    float _2563 = _2535 * _2547;
    float _2565 = _2555 * _2475;
    float _2567 = _2559 * _2515;
    float _2569 = _2531 * _2547;
    float _2571 = _2559 * _2513;
    float _2573 = _2539 * _2547;
    float _2575 = _2559 * _2511;
    float _2577 = fma(_2561, _2569, _2567);
    float _2579 = fma(_2561, _2563, _2571);
    float _2581 = fma(_2561, _2573, _2575);
    float _2583 = fma(_2273, _2565, _2577);
    float _2585 = fma(_2263, _2565, _2579);
    float _2587 = fma(_2265, _2565, _2581);
    float _2589 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2591 = _1709 + _2585;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2595 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2589);
    float _2597 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2599 = _2591 * 0.20000000298023223876953125;
    float _2601 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2593);
    float _2603 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2595);
    float _2605 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2597);
    float _2607 = floor(_2599);
    float _2609 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2601);
    float _2611 = _2603 * 64.0;
    float _2613 = _1703 + _2587;
    float _2615 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2605);
    float _2617 = _2609 * 49.0;
    float _2619 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2621 = _2613 * 0.20000000298023223876953125;
    float _2623 = _2615 * 64.0;
    float _2625 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2627 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2619);
    float _2629 = floor(_2621);
    float _2631 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2633 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2625);
    float _2635 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2627);
    float _2637 = _1657 + _2583;
    float _2639 = -_2607;
    float _2641 = _2599 + _2639;
    float _2643 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2633);
    float _2645 = _2613 + _2635;
    float _2647 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2631);
    float _2649 = _2641 * 6.283185482025146484375;
    float _2651 = _2591 + _2643;
    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2655 = _2645 + _2653;
    float _2657 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2647);
    float _2659 = _2649 * 0.15915493667125701904296875;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2663 = _2651 + _2661;
    float _2665 = _2655 * _2655;
    float _2667 = -_2629;
    float _2669 = _2621 + _2667;
    float _2671 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2673 = _2637 + _2657;
    float _2675 = fma(_2663, _2663, _2665);
    float _2677 = _2669 * 6.283185482025146484375;
    float _2679 = _2659 * 6.283185482025146484375;
    float _2681 = sin(_2679);
    float _2683 = _2299 + _2671;
    float _2685 = _2677 * 0.15915493667125701904296875;
    bool _2687 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan(0.5);
    bool _2695 = _2691 || _2693;
    float _2697 = sqrt(_2675);
    bool _2699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.5);
    bool _2707 = _2703 || _2705;
    float _2709 = _2685 * 6.283185482025146484375;
    float _2711 = sin(_2709);
    bool _2713 = _2697 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2715 = 1.0 / _2671;
    float _2717 = _2681 + _2711;
    float _2719 = fma(_2717, 0.20000000298023223876953125, _2673);
    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2723 = _2651;
    float _2725 = _2645;
    float _2727 = _2675;
    float _2729 = _2663;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].y);
    if (!_2713)
    {
        _2721 = _2719;
    }
    float _2733 = _2721;
    bool _2735 = !_2713;
    float _2737 = _2733;
    float _2739 = _2715;
    if (!_2735)
    {
        float _2741 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2745 = _2697 + _2743;
        float _2747 = rsqrt(_2675);
        float _2749 = _2745 * _2741;
        float _2751 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2753 = _2749 * 0.15915493667125701904296875;
        float _2755 = _2753 * 6.283185482025146484375;
        float _2757 = cos(_2755);
        float _2759 = _2753 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2757 + (-1.0);
        float _2765 = fma(_2761, _2751, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2767 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = _2747 * _2765;
        float _2771 = fma(_2719, _2757, _2767);
        float _2773 = fma(_2663, _2769, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2775 = fma(_2655, _2769, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2723 = _2773;
        _2737 = _2771;
        _2725 = _2775;
        _2727 = _2747;
    }
    float _2777 = _2723;
    float _2779 = _2737;
    float _2781 = _2725;
    float _2783 = _2727;
    float _2785 = -_2145;
    float _2787 = _2785 + _2777;
    float _2789 = -_2147;
    float _2791 = _2789 + _2779;
    float _2793 = _2683 * _2715;
    float _2795 = _2793 * 0.5;
    float _2797 = -_2153;
    float _2799 = _2797 + _2781;
    float _2801 = _2791;
    float _2803 = _2799;
    float _2805 = _2795;
    float _2807 = _2783;
    if (_2695)
    {
        _2729 = 1.0;
    }
    float _2809 = _2729;
    float _2811 = _2809;
    if (_2707)
    {
        _2739 = _2787;
    }
    float _2813 = _2739;
    float _2815 = _2813;
    if (!_2707)
    {
        float _2817 = _2161 * _2161;
        float _2819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2821 = -_1709;
        float _2823 = _2821 + _2777;
        float _2825 = -_1657;
        float _2827 = _2825 + _2779;
        float _2829 = fma(_2169, _2169, _2817);
        float _2831 = -_1703;
        float _2833 = _2831 + _2781;
        float _2835 = fma(_2175, _2175, _2829);
        float _2837 = 1.0 / _2471;
        float _2839 = sqrt(_2835);
        float _2841 = precise::min(_2839, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2843 = _2841 * _2819;
        float _2845 = _2843 * _2837;
        float _2847 = fma(_2823, _2845, _2157);
        float _2849 = fma(_2827, _2845, _2151);
        float _2851 = fma(_2833, _2845, _2165);
        _2801 = _2849;
        _2815 = _2847;
        _2803 = _2851;
    }
    float _2853 = _2801;
    float _2855 = _2815;
    float _2857 = _2803;
    if (!_2695)
    {
        float _2859 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2861 = _2859 * 0.15915493667125701904296875;
        float _2863 = _2861 * 6.283185482025146484375;
        float _2865 = cos(_2863);
        float _2867 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2869 = _2867 * 0.15915493667125701904296875;
        float _2871 = _2861 * 6.283185482025146484375;
        float _2873 = sin(_2871);
        float _2875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2877 = fma(_2795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2875);
        float _2879 = 1.0 / _2865;
        float _2881 = _2869 * 6.283185482025146484375;
        float _2883 = cos(_2881);
        float _2885 = _2873 * _2879;
        float _2887 = 1.0 / _2877;
        float _2889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2891 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2889;
        float _2893 = _2883 * _2885;
        float _2895 = _2869 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2893;
        float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2903 = _2887 * _2901;
        float _2905 = 1.0 / _2891;
        float _2907 = _2897 * _2899;
        float _2909 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2911 = fma(_2907, _2903, _2909);
        float _2913 = _2911 * _2905;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        _2805 = _2887;
        _2811 = _2915;
    }
    float _2917 = _2805;
    float _2919 = _2811;
    float _2921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2923 = _2853 + _2921;
    float _2925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2927 = _2855 + _2925;
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2931 = _2857 + _2929;
    float _2933 = _2923 * _2923;
    float _2935 = fma(_2927, _2927, _2933);
    float _2937 = fma(_2931, _2931, _2935);
    float _2939 = rsqrt(_2937);
    float _2941 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2943 = _2927 * _2941;
    float _2945 = _2931 * _2941;
    float _2947 = _2943 * _2943;
    float _2949 = _2945 * _2945;
    float _2951 = _2947 + _2949;
    float _2953 = sqrt(_2951);
    bool _2955 = _2953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2959 = _2953 + _2957;
    float _2961 = _2931;
    float _2963 = _2951;
    float _2965 = _2959;
    float _2967 = _2917;
    float _2969 = _2923;
    if (_2955)
    {
        float _2971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2961 = _2971;
    }
    float _2973 = _2961;
    if (_2955)
    {
        float _2975 = rsqrt(_2951);
        _2963 = _2975;
    }
    float _2977 = _2963;
    float _2979 = _2977;
    if (_2955)
    {
        float _2981 = _2959 * _2973;
        _2965 = _2981;
    }
    float _2983 = _2965;
    if (_2955)
    {
        float _2985 = _2983 * 0.15915493667125701904296875;
        _2967 = _2985;
    }
    float _2987 = _2967;
    float _2989 = _2939;
    if (_2955)
    {
        float _2991 = _2987 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        _2989 = _2993;
    }
    float _2995 = _2989;
    float _2997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2999 = precise::max(0.0, _2997);
    float _3001 = _2933;
    float _3003 = _2999;
    float _3005 = _2997;
    if (_2955)
    {
        float _3007 = _2987 * 6.283185482025146484375;
        float _3009 = cos(_3007);
        _3001 = _3009;
    }
    float _3011 = _3001;
    float _3013 = -_2941;
    float _3015 = -_2999;
    float _3017 = fma(_2923, _3013, _3015);
    if (!_2955)
    {
        _2969 = _2945;
    }
    float _3019 = _2969;
    float _3021 = _3019;
    if (_2955)
    {
        float _3023 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3003 = _3023;
    }
    float _3025 = _3003;
    float _3027 = _3025;
    float _3029 = _2995;
    if (_2955)
    {
        float _3031 = fma(_2995, _3025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3027 = _3031;
    }
    float _3033 = _3027;
    float _3035 = _3033;
    if (!_2955)
    {
        _3029 = _2943;
    }
    float _3037 = _3029;
    float _3039 = _3037;
    float _3041 = _3011;
    if (_2955)
    {
        float _3043 = _3011 + (-1.0);
        _3005 = _3043;
    }
    float _3045 = _3005;
    if (_2955)
    {
        float _3047 = _2977 * _3033;
        _2807 = _3047;
    }
    float _3049 = _2807;
    if (!_2955)
    {
        _3035 = _3017;
    }
    float _3051 = _3035;
    float _3053 = _3051;
    if (_2955)
    {
        float _3055 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2183 = _3055;
    }
    float _3057 = _2183;
    if (_2955)
    {
        float _3059 = _2943 * _3049;
        _3039 = _3059;
    }
    float _3061 = _3039;
    float _3063 = sqrt(_2937);
    if (!_2955)
    {
        _2979 = _2947;
    }
    float _3065 = _2979;
    float _3067 = _3065;
    if (_2955)
    {
        float _3069 = fma(_3017, _3011, _3057);
        _3053 = _3069;
    }
    float _3071 = _3053;
    if (_2955)
    {
        float _3073 = _2945 * _3049;
        _3021 = _3073;
    }
    float _3075 = _3021;
    if (_2955)
    {
        float _3077 = _3061 * _3061;
        _3067 = _3077;
    }
    float _3079 = _3067;
    if (!_2955)
    {
        _3041 = _2949;
    }
    float _3081 = _3041;
    float _3083 = _3081;
    if (_2955)
    {
        float _3085 = _3075 * _3075;
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = fma(_3071, _3071, _3079);
    float _3091 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3093 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3095 = _3089 + _3087;
    float _3097 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3091);
    float _3099 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3101 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3093);
    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3105 = fma(_3063, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3103);
    float _3107 = precise::clamp(_3105, 0.0, 1.0);
    float _3109 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3097);
    float _3111 = rsqrt(_3095);
    float _3113 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3115 = -_3107;
    float _3117 = _3115 + 1.0;
    float _3119 = _3109 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3121 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3099);
    float _3123 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3113);
    float _3125 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3101);
    float _3127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3129 = abs(_3117);
    float _3131 = log2(_3129);
    float _3133 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3135 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3121);
    float _3137 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3123);
    float _3139 = _3125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3141 = -_3133;
    float _3143 = fma(_3141, _3127, 1.0);
    float _3145 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3147 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3149 = _3111 * _3061;
    float _3151 = _3111 * _3071;
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3155 = _3111 * _3075;
    float _3157 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3159 = log2(_3143);
    float _3161 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3153);
    float _3163 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3167 = -_3157;
    float _3169 = fma(_3151, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3167);
    float _3171 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3161);
    float _3173 = -_3155;
    float _3175 = fma(_3173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3169);
    float _3177 = exp2(_3165);
    float _3179 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3171);
    float _3181 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3183 = fma(_3175, -0.5, 0.5);
    float _3185 = fma(_3175, 0.5, 0.5);
    float _3187 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3189 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3181);
    float _3191 = _3151 + 1.0;
    float _3193 = 1.0 / _3179;
    float _3195 = fma(_3185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3197 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3189);
    float _3199 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3187);
    float _3201 = _3159 * 0.693147182464599609375;
    float _3203 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3197);
    float _3205 = sqrt(_3183);
    float _3207 = -_3151;
    float _3209 = fma(_3177, _3191, _3207);
    float _3211 = fma(_3185, _3195, -0.212114393711090087890625);
    float _3213 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3199);
    float _3215 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3217 = fma(_3209, 0.5, 0.5);
    float _3219 = fma(_3185, _3211, 1.570728778839111328125);
    float _3221 = _3203 * _3193;
    float _3223 = _3213 * _3193;
    float _3225 = fma(_3221, 0.5, 0.5);
    float _3227 = fma(_3223, -0.5, 0.5);
    float _3229 = _3205 * 0.636619746685028076171875;
    float _3231 = -_3219;
    float _3233 = fma(_3229, _3231, 1.0);
    float3 _8594 = float3(_3225, _3227, _3215);
    float _3235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8594, float3(0.0), isnan(_8594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8594, float3(0.0), isnan(_8594)), level(0.0)).x;
    float3 _8605 = float3(_3225, _3227, _3215);
    float4 _3238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8605, float3(0.0), isnan(_8605)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8605, float3(0.0), isnan(_8605)), level(0.0)).xyzw;
    float _3240 = _3238.x;
    float _3242 = _3238.y;
    float _3244 = _3238.z;
    float _3246 = _3238.w;
    float2 _8622 = float2(_3233, _3217);
    float3 _3250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8622, float2(0.0), isnan(_8622)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8622, float2(0.0), isnan(_8622)), level(0.0)).xyz;
    float _3252 = _3250.x;
    float _3254 = _3250.y;
    float _3256 = _3250.z;
    float _3258 = in.m_73.y;
    bool _3260 = _2549 != 0.0;
    bool _3262 = isnan(_2549);
    bool _3264 = _3260 || _3262;
    bool _3266 = isnan(0.0);
    bool _3268 = _3264 || _3266;
    float _3270 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3272 = in.m_73.z;
    bool _3274 = _2551 == 0.0;
    bool _3276 = !_3268;
    bool _3278 = _3274 && _3276;
    float _3280 = exp2(_3270);
    bool _3282 = _2555 == 0.0;
    bool _3284 = _3282 && _3278;
    out.m_59.x = _648;
    out.m_59.y = _666;
    out.m_59.z = _664;
    out.m_59.w = _668;
    out.m_69.x = _2127;
    out.m_69.y = _2129;
    out.m_69.z = _2133;
    out.m_69.w = _2143;
    out.m_75.x = _2563;
    out.m_75.y = _2569;
    out.m_75.z = _2573;
    out.m_77.x = _2855;
    out.m_77.y = _2853;
    out.m_77.z = _2857;
    int _3286 = as_type<int>(_3225);
    float _3288 = _3139;
    if (_3284)
    {
        float _3290 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3258);
        _2731 = as_type<int>(_3290);
    }
    int _3292 = _2731;
    int _3294 = _3292;
    if (!_3284)
    {
        float _3296 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3258);
        _3294 = as_type<int>(_3296);
    }
    int _3298 = _3294;
    float _3300 = -_3280;
    float _3302 = _3300 + 1.0;
    out.m_79.x = _2157;
    out.m_79.y = _2151;
    out.m_79.z = _2165;
    if (_3284)
    {
        float _3304 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3286 = as_type<int>(_3304);
    }
    int _3306 = _3286;
    int _3308 = _3306;
    if (!_3284)
    {
        float _3310 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3308 = as_type<int>(_3310);
    }
    int _3312 = _3308;
    bool _3314 = !_3284;
    float _3316 = _3314 ? as_type<float>(_3298) : _3258;
    float _3318 = in.m_73.x;
    float _3320 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3322 = !_3284;
    float _3324 = _3322 ? as_type<float>(_3312) : _3272;
    float _3326 = _3316 * _3316;
    float _3328 = fma(_3324, _3324, _3326);
    float _3330 = _3326;
    if (_3284)
    {
        _3330 = _3258;
    }
    float _3332 = _3330;
    float _3334 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3336 = _3332;
    if (!_3284)
    {
        _3336 = as_type<float>(_3298);
    }
    float _3338 = _3336;
    if (_3284)
    {
        _3288 = _3272;
    }
    float _3340 = _3288;
    float _3342 = rsqrt(_3328);
    float _3344 = _3340;
    if (!_3284)
    {
        _3344 = as_type<float>(_3312);
    }
    float _3346 = _3344;
    float _3348 = _2515 * _3338;
    float _3350 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3334);
    float _3352 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3350);
    float _3354 = _3318;
    if (!_3284)
    {
        float _3356 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3318);
        _3354 = _3356;
    }
    float _3358 = _3354;
    bool _3360 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3362 = isnan(_3063);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3368 = _3364 || _3366;
    float _3370 = _3316 * _3342;
    float _3372 = _3324 * _3342;
    float _3374 = -_2263;
    float _3376 = _3370 * _3374;
    float _3378 = -_2273;
    float _3380 = _3370 * _3378;
    float _3382 = -_2265;
    float _3384 = _3370 * _3382;
    if (!_3368)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3386 = _2185;
    float _3388 = fma(_3372, _2513, _3376);
    float _3390 = fma(_3372, _2515, _3380);
    float _3392 = fma(_3372, _2511, _3384);
    float _3394 = fma(_2569, _3358, _3348);
    float _3396 = _2513 * _3338;
    float _3398 = _2511 * _3338;
    float _3400 = _3179 * 0.5;
    out.m_81.x = _3388;
    out.m_81.y = _3390;
    out.m_81.z = _3392;
    float _3402 = fma(_2563, _3358, _3396);
    float _3404 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3352);
    float _3406 = fma(_3213, -0.5, _3400);
    float _3408 = _3203 + _3179;
    float _3410 = _3386;
    float _3412 = _3386;
    if (!_3368)
    {
        _2187 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3414 = _2187;
    float _3416 = _3404 + _3179;
    out.gl_Position.x = _3203;
    out.gl_Position.y = _3213;
    out.gl_Position.z = _3404;
    out.gl_Position.w = _3179;
    float _3418 = _3408 * 0.5;
    float _3420 = _3416 * 0.5;
    float _3422 = fma(_2273, _3346, _3394);
    float _3424 = fma(_2573, _3358, _3398);
    float _3426 = fma(_2263, _3346, _3402);
    out.m_83.x = _3418;
    out.m_83.y = _3406;
    out.m_83.z = _3420;
    out.m_83.w = _3179;
    float _3428 = fma(_2265, _3346, _3424);
    out.m_85.x = _3426;
    out.m_85.y = _3422;
    out.m_85.z = _3428;
    float _3430 = _2919 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3432 = _3320 * _3235;
    float _3434 = -_3320;
    float _3436 = _3434 + 1.0;
    float _3438 = _3246 * _3432;
    float _3440 = _3256 * _3432;
    float _3442 = _3246 * _3436;
    float _3444 = fma(_3252, _3438, _3240);
    float _3446 = fma(_3254, _3438, _3242);
    float _3448 = fma(_3246, _3440, _3244);
    float _3450 = _3438;
    float _3452 = _3414;
    float _3454 = _3414;
    if (!_3368)
    {
        _3450 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3456 = _3450;
    out.m_87.x = _3444;
    out.m_87.y = _3446;
    out.m_87.z = _3448;
    out.m_87.w = _3442;
    bool _3458 = !_3368;
    float _3460 = _3456;
    float _3462 = _3456;
    if (!_3458)
    {
        bool _3464 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3466 = isnan(_3063);
        bool _3468 = _3464 || _3466;
        bool _3470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3472 = _3468 || _3470;
        if (!_3472)
        {
            float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3476 = _3063 + _3474;
            float _3478 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3480 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3478;
            float _3482 = 1.0 / _3480;
            float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3486 = _3484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3490 = _3488 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3492 = _3476 * _3482;
            float _3494 = precise::clamp(_3492, 0.0, 1.0);
            float _3496 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3498 = _3496 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3500 = fma(_3494, _3490, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3502 = fma(_3494, _3498, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3504 = fma(_3494, _3486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3454 = _3504;
            _3412 = _3502;
            _3462 = _3500;
            _3506 = true;
        }
        else
        {
            bool _3508 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3510 = isnan(_3063);
            bool _3512 = _3508 || _3510;
            bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3516 = _3512 || _3514;
            if (!_3516)
            {
                _3410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3518 = _3410;
            _3412 = _3518;
            if (!_3516)
            {
                _3452 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3520 = _3452;
            _3454 = _3520;
            if (!_3516)
            {
                _3460 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3522 = _3460;
            bool _3524 = !_3516;
            _3462 = _3522;
            if (!_3524)
            {
                bool _3526 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3528 = isnan(_3063);
                bool _3530 = _3526 || _3528;
                bool _3532 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3534 = _3530 || _3532;
                if (!_3534)
                {
                    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3538 = _3063 + _3536;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3542 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3540;
                    float _3544 = 1.0 / _3542;
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3554 = _3538 * _3544;
                    float _3556 = precise::clamp(_3554, 0.0, 1.0);
                    float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3562 = fma(_3556, _3552, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3564 = fma(_3556, _3560, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3566 = fma(_3556, _3548, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3454 = _3566;
                    _3412 = _3564;
                    _3462 = _3562;
                    _3506 = true;
                }
                else
                {
                    _3454 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3462 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3506 = false;
    float _3568 = _3454;
    float _3570 = _3412;
    float _3572 = _3462;
    float _3574 = _3430 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_89.x = 0.0;
    float _3576 = _3568 * 0.586610972881317138671875;
    bool _3578 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3574;
    float _3580 = fma(_3570, 0.298911988735198974609375, _3576);
    bool _3582 = _2919 > 0.0;
    bool _3584 = isnan(_2919);
    bool _3586 = _3582 || _3584;
    bool _3588 = isnan(0.0);
    bool _3590 = _3586 || _3588;
    float _3592 = fma(_3572, 0.114477999508380889892578125, _3580);
    float _3594 = -_3592;
    float _3596 = _3594 + _3570;
    float _3598 = -_3592;
    float _3600 = _3598 + _3568;
    float _3602 = -_3592;
    float _3604 = _3602 + _3572;
    float _3606 = fma(_3596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    float _3608 = fma(_3600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    float _3610 = fma(_3604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    bool _3612 = !_3578;
    if (!_3612)
    {
        float _3614 = -_2853;
        float _3616 = _3614 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3618 = -_2855;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3622 = -_2857;
        float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3626 = _3616 * _3616;
        float _3628 = fma(_3620, _3620, _3626);
        float _3630 = fma(_3624, _3624, _3628);
        float _3632 = sqrt(_3630);
        float _3634 = rsqrt(_3630);
        float _3636 = -_3632;
        float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3640 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3642 = precise::clamp(_3640, 0.0, 1.0);
        float _3644 = _3620 * _3634;
        float _3646 = _3616 * _3634;
        float _3648 = abs(_3642);
        float _3650 = log2(_3648);
        float _3652 = _3624 * _3634;
        float _3654 = _3644 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3656 = _3422 * _3646;
        float _3658 = -_3646;
        float _3660 = -_3654;
        float _3662 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3660);
        float _3664 = fma(_3426, _3644, _3656);
        float _3666 = -_3652;
        float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3662);
        float _3670 = fma(_3428, _3652, _3664);
        float _3672 = precise::clamp(_3670, 0.0, 1.0);
        float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3676 = _3668 + _3674;
        float _3678 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3680 = _3676 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3682 = precise::clamp(_3680, 0.0, 1.0);
        float _3684 = exp2(_3678);
        float _3686 = _3684 * _3682;
        float _3688 = _3672 * _3686;
        float _3690 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3692 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3694 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3690;
        out.m_89.y = _3692;
        out.m_89.z = _3694;
    }
    out.m_91.x = _3606;
    out.m_91.y = _3608;
    out.m_91.z = _3610;
    if (_3590)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3696 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3696;
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
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_91 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3506 = false;
    bool _704 = false;
    bool _508 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _105 = in.m_44.w;
    float _107 = in.m_46.w;
    float _109 = trunc(_105);
    int _112 = int(_109);
    float _114 = -_107;
    float _116 = _114 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _116;
    bool _120 = _112 >= 1;
    float _122 = 0.0;
    float _124 = _107;
    if (!_120)
    {
        _122 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _126 = _122;
    if (!_120)
    {
        out.m_51.x = 0.0;
    }
    int _128 = 0;
    if (!_120)
    {
        float _130 = _126 * 5.0;
        _128 = as_type<int>(_130);
    }
    int _132 = _128;
    int _134 = _132;
    if (!_120)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3763 = as_type<float>(_132);
        out.gl_Position.z = _3763;
    }
    if (!_120)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _136 = _107 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _138 = isnan(_107);
    bool _140 = _136 || _138;
    bool _142 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _144 = _140 || _142;
    float _146 = in.m_53.x;
    float _148 = float(_112);
    bool _150 = _116 >= _148;
    bool _152 = !_144;
    bool _154 = _150 || _152;
    if (_154)
    {
        _124 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _156 = _124;
    if (_154)
    {
        out.m_51.x = 0.0;
    }
    if (_154)
    {
        float _158 = _156 * 5.0;
        _134 = as_type<int>(_158);
    }
    int _160 = _134;
    out.m_55.x = _146;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3822 = as_type<float>(_160);
        out.gl_Position.z = _3822;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _162 = 1.0 / _148;
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _166 = _116 * _162;
    bool _168 = !_164;
    float _184;
    if (!_168)
    {
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _116);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        _184 = _166;
    }
    _186 = false;
    float _188 = _184;
    float _190 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _192 = _188 + _190;
    float _194 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _196 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _194;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _200 = _198 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _202 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _204 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _202;
    float _206 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _208 = _206 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _210 = 1.0 / _196;
    float _212 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _214 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _212;
    bool _216 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _218 = isnan(_188);
    bool _220 = _216 || _218;
    bool _222 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _224 = _220 || _222;
    float _226 = float(_224);
    float _228 = 1.0 / _204;
    float _230 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _232 = _188 + _230;
    bool _234 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _236 = isnan(_188);
    bool _238 = _234 || _236;
    bool _240 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _242 = _238 || _240;
    float _244 = float(_242);
    float _246 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _248 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _246;
    float _250 = 1.0 / _200;
    float _252 = _232 * _210;
    float _254 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _256 = _188 + _254;
    float _258 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _260 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _258;
    float _262 = fma(_248, _252, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    bool _264 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _266 = fma(_260, _252, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _268 = 1.0 / _214;
    float _270 = _256 * _228;
    bool _272 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _274 = isnan(_188);
    bool _276 = _272 || _274;
    bool _278 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _280 = _276 || _278;
    float _282 = float(_280);
    float _284 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _286 = _188 + _284;
    bool _288 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _290 = isnan(_188);
    bool _292 = _288 || _290;
    bool _294 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _296 = _292 || _294;
    float _298 = float(_296);
    float _300 = 1.0 / _208;
    float _302 = _192 * _250;
    float _304 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _306 = _188 + _304;
    bool _308 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _310 = isnan(_188);
    bool _312 = _308 || _310;
    bool _314 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _316 = _312 || _314;
    float _318 = float(_316);
    float _320 = -_282;
    float _322 = _320 + 1.0;
    float _324 = _306 * _268;
    bool _326 = _188 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _328 = isnan(_188);
    bool _330 = _326 || _328;
    bool _332 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _334 = _330 || _332;
    float _336 = float(_334);
    float _338 = -_318;
    float _340 = _338 + 1.0;
    float _342 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _344 = _342 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _346 = _336 * _340;
    float _348 = -_336;
    float _350 = _348 + 1.0;
    float _352 = _286 * _300;
    float _354 = _298 * _322;
    float _356 = -_298;
    float _358 = _356 + 1.0;
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _362 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _360;
    float _364 = _244 * _350;
    float _366 = -_244;
    float _368 = _366 + 1.0;
    float _370 = _226 * _358;
    float _372 = -_226;
    float _374 = _372 + 1.0;
    float _376 = fma(_362, _252, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _378 = fma(_344, _302, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _380 = _318 * _374;
    float _382 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _384 = _382 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _386 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _388 = _386 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _390 = _376 * _364;
    float _392 = _266 * _364;
    float _394 = _262 * _364;
    float _396 = fma(_384, _302, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _398 = fma(_388, _302, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _400 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _402 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _400;
    float _404 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].x, _390);
    float _406 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].z, _394);
    float _408 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _410 = _408 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _412 = fma(_402, _270, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _414 = fma(_378, _346, _404);
    float _416 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _418 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _416;
    float _420 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[143].y, _392);
    float _422 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _424 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _422;
    float _426 = fma(_410, _352, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _428 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _430 = _428 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _432 = fma(_412, _380, _414);
    float _434 = fma(_418, _270, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _436 = fma(_396, _346, _420);
    float _438 = fma(_424, _270, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _440 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _442 = _440 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _444 = fma(_398, _346, _406);
    float _446 = fma(_430, _352, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _448 = fma(_434, _380, _436);
    float _450 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _452 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _450;
    float _454 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _456 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _454;
    float _458 = fma(_442, _352, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _460 = fma(_438, _380, _444);
    float _462 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _464 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _462;
    float _466 = fma(_452, _324, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _468 = fma(_456, _324, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _470 = fma(_426, _370, _432);
    float _472 = fma(_464, _324, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _474 = fma(_446, _370, _448);
    float _476 = fma(_458, _370, _460);
    float _478 = fma(_466, _354, _470);
    float _480 = fma(_468, _354, _474);
    float _482 = fma(_472, _354, _476);
    float _484 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].x, _478);
    float _486 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].y, _480);
    float _488 = fma(_282, (*spvDescriptorSet0.vp_c9)._m0[148].z, _482);
    bool _490 = !_264;
    float _506;
    if (!_490)
    {
        float _492 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _494 = _146 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _496 = fma(_494, (*spvDescriptorSet0.vp_c9)._m0[11].y, _116);
        float _498 = _496 * _492;
        float _500 = floor(_498);
        float _502 = -_500;
        float _504 = _498 + _502;
        _506 = _504;
        _508 = true;
    }
    else
    {
        _506 = _166;
    }
    _508 = false;
    float _510 = _506;
    float _512 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _514 = _510 + _512;
    float _516 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _518 = _516 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _520 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _522 = _520 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _524 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _526 = isnan(_510);
    bool _528 = _524 || _526;
    bool _530 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _532 = _528 || _530;
    float _534 = float(_532);
    float _536 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _538 = _536 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _540 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _542 = isnan(_510);
    bool _544 = _540 || _542;
    bool _546 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _548 = _544 || _546;
    float _550 = float(_548);
    float _552 = 1.0 / _518;
    float _554 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _556 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _554;
    float _558 = -_534;
    float _560 = _558 + 1.0;
    bool _562 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _564 = isnan(_510);
    bool _566 = _562 || _564;
    bool _568 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _570 = _566 || _568;
    float _572 = float(_570);
    bool _574 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _576 = 1.0 / _522;
    float _578 = 1.0 / _538;
    float _580 = _556 * _552;
    float _582 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _584 = _582 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _586 = _550 * _560;
    float _588 = -_550;
    float _590 = _588 + 1.0;
    float _592 = fma(_580, _514, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _596 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _594;
    float _598 = _572 * _590;
    float _600 = _584 * _576;
    float _602 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _604 = _510 + _602;
    bool _606 = _510 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _608 = isnan(_510);
    bool _610 = _606 || _608;
    bool _612 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _614 = _610 || _612;
    float _616 = float(_614);
    float _618 = _592 * _598;
    float _620 = -_572;
    float _622 = _620 + 1.0;
    float _624 = fma(_600, _604, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _626 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _628 = _510 + _626;
    float _630 = _596 * _578;
    float _632 = -_616;
    float _634 = _632 + 1.0;
    float _636 = fma(_622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _618);
    float _638 = fma(_630, _628, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _640 = _534 * _634;
    float _642 = fma(_624, _586, _636);
    float _644 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _646 = fma(_638, _640, _642);
    float _648 = _644 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _650 = fma(_616, (*spvDescriptorSet0.vp_c9)._m0[118].x, _646);
    float _652 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _654 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _656 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _658 = in.m_57.x;
    float _660 = in.m_57.y;
    float _662 = in.m_57.z;
    float _664 = _652 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _666 = _654 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _668 = _650 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _670 = _656 * _146;
    out.m_59.x = _648;
    out.m_59.y = _666;
    out.m_59.z = _664;
    out.m_59.w = _668;
    float _672 = trunc(_670);
    int _674 = int(_672);
    float _676 = _488 * _662;
    float _678 = _484 * _658;
    float _680 = _486 * _660;
    int _682 = _674 << 4;
    int _684 = _682 + 1968;
    bool _686 = !_574;
    float _702;
    if (!_686)
    {
        float _688 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _690 = _146 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _692 = fma(_690, (*spvDescriptorSet0.vp_c9)._m0[11].w, _116);
        float _694 = _692 * _688;
        float _696 = floor(_694);
        float _698 = -_696;
        float _700 = _694 + _698;
        _702 = _700;
        _704 = true;
    }
    else
    {
        _702 = _166;
    }
    _704 = false;
    float _706 = _702;
    float _708 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _710 = int(_708);
    float _712 = in.m_61.y;
    float _714 = _146 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _716 = in.m_53.y;
    int _718 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _720 = _718 != 0;
    float _722 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _724 = int(_722);
    float _726 = in.m_61.x;
    int _728 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _730 = _728 != 0;
    int _732 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _734 = _732 != 0;
    float _736 = in.m_53.z;
    float _738 = float(_710);
    float _740 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _742 = int(_740);
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _746 = _744 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _748 = float(_724);
    float _750 = 1.0 / _738;
    float _752 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _754 = _752 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _756 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _758 = _716 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _760 = _716 > 0.5;
    float _762 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _764 = int(_762);
    float _766 = float(uint(_742));
    int _768 = ~_742;
    int _770 = _768 + 1;
    bool _772 = _736 > 0.5;
    float _774 = float(_742);
    float _776 = 1.0 / _748;
    float _778 = _116 * _750;
    float _780 = 1.0 / _766;
    float _782 = float(uint(_764));
    int _784 = ~_742;
    int _786 = _784 + 1;
    float _788 = trunc(_778);
    int _790 = int(_788);
    float _792 = _116 * _776;
    float _794 = 1.0 / _782;
    int _796 = as_type<int>(_780) + (-2);
    float _798 = trunc(_792);
    int _800 = int(_798);
    float _802 = float(uint(_790));
    float _804 = float(_790);
    float _806 = as_type<float>(_796) * _802;
    int _808 = as_type<int>(_794) + (-2);
    float _810 = 1.0 / _746;
    float _812 = float(uint(_800));
    float _814 = trunc(_806);
    float _816 = precise::max(_814, 0.0);
    uint _819 = uint(_816);
    float _821 = as_type<float>(_808) * _812;
    float _823 = trunc(_821);
    float _825 = precise::max(_823, 0.0);
    uint _827 = uint(_825);
    int _829 = _786 * int(_819);
    int _831 = _829 + _790;
    float _833 = _821;
    bool _835 = _760;
    int _837 = int(_819);
    float _839 = _712;
    float _841 = _726;
    float _843 = _716;
    if (!_720)
    {
        _833 = _726;
    }
    float _845 = _833;
    float _847 = 1.0 / _754;
    float _849 = float(uint(_831));
    int _851 = ~_764;
    int _853 = _851 + 1;
    float _855 = as_type<float>(_796) * _849;
    int _857 = _853 * int(_827);
    int _859 = _857 + _800;
    float _861 = trunc(_855);
    float _863 = precise::max(_861, 0.0);
    uint _865 = uint(_863);
    float _867 = float(uint(_859));
    float _869 = as_type<float>(_808) * _867;
    float _871 = -_712;
    float _873 = _871 + 1.0;
    float _875 = trunc(_869);
    float _877 = precise::max(_875, 0.0);
    uint _879 = uint(_877);
    int _881 = _760 ? as_type<int>(_873) : as_type<int>(_712);
    float _883 = _845;
    if (_720)
    {
        bool _885 = _146 > 0.5;
        _835 = _885;
    }
    bool _887 = _835;
    int _889 = int(_819) + int(_865);
    if (_720)
    {
        float _891 = -_726;
        float _893 = _891 + 1.0;
        _837 = as_type<int>(_893);
    }
    int _895 = _837;
    float _897 = _734 ? as_type<float>(_881) : _712;
    if (_730)
    {
        float _899 = _772 ? _873 : _712;
        _839 = _899;
    }
    float _901 = _839;
    int _903 = _770 * _889;
    int _905 = _903 + _790;
    if (_720)
    {
        float _907 = _887 ? as_type<float>(_895) : _726;
        _883 = _907;
    }
    float _909 = _883;
    int _911 = ~_764;
    int _913 = _911 + 1;
    int _915 = int(_827) + int(_879);
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _919 = _917 != 0;
    int _921 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _923 = _921 != 0;
    int _925 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _927 = _925 != 0;
    bool _929 = uint(_905) >= uint(_742);
    int _931 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _933 = _931 != 0;
    bool _935 = !_923;
    int _937 = _935 ? 0 : 1;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _941 = _939 != 0;
    int _943 = _913 * _915;
    int _945 = _943 + _800;
    bool _947 = !_933;
    int _949 = _947 ? 0 : 1;
    bool _951 = !_929;
    int _953 = _951 ? 0 : (-1);
    bool _955 = !_927;
    int _957 = _955 ? 0 : 1;
    int _959 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _961 = _959 != 0;
    int _963 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _965 = _963 != 0;
    int _967 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _969 = _967 != 0;
    int _971 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _973 = _971 != 0;
    int _975 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _977 = _975 != 0;
    bool _979 = !_919;
    int _981 = _979 ? 0 : 1;
    bool _983 = uint(_945) >= uint(_764);
    float _985 = in.m_44.x;
    float _987 = in.m_44.y;
    float _989 = in.m_44.z;
    bool _991 = !_983;
    int _993 = _991 ? 0 : (-1);
    bool _995 = !_965;
    int _997 = _995 ? 0 : 1;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1001 = 0.0;
    if (_977)
    {
        _1001 = 1.0;
    }
    float _1003 = _1001;
    float _1005 = _1003;
    if (!_977)
    {
        _1005 = 7.345489978790283203125;
    }
    float _1007 = _1005;
    float _1009 = fma(_758, -2.0, _999);
    float _1011 = 0.0;
    if (_977)
    {
        _1011 = _146;
    }
    float _1013 = _1011;
    float _1015 = 0.0;
    float _1017 = _1013;
    if (_977)
    {
        _1015 = 1.0;
    }
    float _1019 = _1015;
    float _1021 = _1007 * _146;
    float _1023 = _1019;
    if (!_977)
    {
        _1017 = _716;
    }
    float _1025 = _1017;
    float _1027 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1009);
    if (!_977)
    {
        _1023 = 1.2345600128173828125;
    }
    float _1029 = _1023;
    float _1031 = floor(_1021);
    bool _1033 = !_961;
    int _1035 = _1033 ? 0 : 1;
    bool _1037 = !_969;
    int _1039 = _1037 ? 0 : 1;
    float _1041 = _1025 * _1029;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1045 = _1043 != 0;
    float _1047 = _987 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    int _1049 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1051 = _1049 != 0;
    float _1053 = _987 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1055 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _1057 = _1055 != 0;
    float _1059 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1047);
    int _1061 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1063 = _1061 != 0;
    float _1065 = -_756;
    float _1067 = fma(_714, 2.0, _1065);
    bool _1069 = _804 >= _774;
    bool _1071 = isnan(_804);
    bool _1073 = _1069 || _1071;
    bool _1075 = isnan(_774);
    bool _1077 = _1073 || _1075;
    float _1079 = float(_1077);
    float _1081 = _987 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1083 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1085 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1083;
    float _1087 = floor(_1041);
    float _1089 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1053);
    float _1091 = fma(_985, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1081);
    float _1093 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _1095 = _1093 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _1097 = float(_764);
    float _1099 = _1085 * _810;
    float _1101 = float(_800);
    float _1103 = _1095 * _847;
    float _1105 = trunc(_1079);
    int _1107 = int(_1105);
    float _1109 = -_1031;
    float _1111 = _1021 + _1109;
    bool _1113 = _1101 >= _1097;
    bool _1115 = isnan(_1101);
    bool _1117 = _1113 || _1115;
    bool _1119 = isnan(_1097);
    bool _1121 = _1117 || _1119;
    float _1123 = float(_1121);
    float _1125 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1091);
    int _1127 = ~_889;
    int _1129 = _1127 + _953;
    int _1131 = _1129 + 1;
    float _1133 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1059);
    float _1135 = fma(_989, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1089);
    float _1137 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1139 = _706 + _1137;
    float _1141 = trunc(_1123);
    int _1143 = int(_1141);
    bool _1145 = !_973;
    int _1147 = _1145 ? 0 : 1;
    int _1149 = _742 * _1131;
    int _1151 = _1149 + _790;
    bool _1153 = _742 == 0;
    float _1155 = _1111 * _774;
    float _1157 = fma(_1099, _1139, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1159 = -_1087;
    float _1161 = _1041 + _1159;
    bool _1163 = !_1153;
    int _1165 = _1163 ? _1151 : (-1);
    float _1167 = trunc(_1155);
    int _1169 = int(_1167);
    int _1171 = ~_1107;
    int _1173 = _1171 + 1;
    int _1175 = _1173 + 1;
    float _1177 = _1161 * _1097;
    int _1179 = ~_915;
    int _1181 = _1179 + _993;
    int _1183 = _1181 + 1;
    float _1185 = _166 * _774;
    float _1187 = _166 * _1097;
    int _1189 = _1165 * _1175;
    bool _1191 = !_1051;
    int _1193 = _1191 ? 0 : 1;
    int _1195 = _764 * _1183;
    int _1197 = _1195 + _800;
    bool _1199 = _764 == 0;
    float _1201 = trunc(_1185);
    int _1203 = int(_1201);
    int _1205 = ~_1143;
    int _1207 = _1205 + 1;
    int _1209 = _1207 + 1;
    float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1213 = _706 + _1211;
    bool _1215 = !_1199;
    int _1217 = _1215 ? _1197 : (-1);
    float _1219 = -_116;
    float _1221 = fma(_1219, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1067);
    int _1223 = abs(_949);
    int _1225 = _742 + (-1);
    int _1227 = _1217 * _1209;
    int _1229 = abs(_937);
    float _1231 = fma(_1103, _1213, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _1233 = _1169 * _1223;
    int _1235 = _1233 + _790;
    int _1237 = abs(_981);
    int _1239 = _1107 * _1225;
    int _1241 = _1239 + _1189;
    float _1243 = trunc(_1177);
    int _1245 = int(_1243);
    int _1247 = _764 + (-1);
    int _1249 = _1241 * _1229;
    bool _1251 = !_941;
    int _1253 = _1251 ? 0 : 1;
    int _1255 = abs(_957);
    float _1257 = trunc(_1187);
    int _1259 = int(_1257);
    int _1261 = _1203 * _1237;
    int _1263 = _1261 + _1249;
    int _1265 = abs(_997);
    int _1267 = _1143 * _1247;
    int _1269 = _1267 + _1227;
    int _1271 = abs(_1193);
    int _1273 = _1235 * _1255;
    int _1275 = _1273 + _1263;
    int _1277 = abs(_1035);
    int _1279 = _1269 * _1265;
    int _1281 = abs(_1039);
    int _1283 = abs(_1253);
    int _1285 = _1169 * _1283;
    int _1287 = _1285 + _1275;
    int _1289 = abs(_1147);
    int _1291 = _1245 * _1271;
    int _1293 = _1291 + _800;
    int _1295 = _1259 * _1277;
    int _1297 = _1295 + _1279;
    float _1299 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _1301 = _1293 * _1281;
    int _1303 = _1301 + _1297;
    float _1305 = float(uint(_1287));
    float _1307 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[80].y, -0.5);
    float _1309 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _1311 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _1313 = isnan(_706);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = as_type<float>(_796) * _1305;
    bool _1325 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1327 = isnan(_706);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    int _1337 = _1245 * _1289;
    int _1339 = _1337 + _1303;
    bool _1341 = _706 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1343 = isnan(_706);
    bool _1345 = _1341 || _1343;
    bool _1347 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1349 = _1345 || _1347;
    float _1351 = float(_1349);
    float _1353 = -_1321;
    float _1355 = _1353 + 1.0;
    float _1357 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1309);
    float _1359 = trunc(_1323);
    float _1361 = precise::max(_1359, 0.0);
    uint _1363 = uint(_1361);
    float _1365 = float(uint(_1339));
    float _1367 = _1351 * _1355;
    float _1369 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1357);
    float _1371 = -_1351;
    float _1373 = _1371 + 1.0;
    int _1375 = _1277;
    int _1377 = as_type<int>(_1365);
    float _1379 = _1373;
    if (_977)
    {
        _1375 = 0;
    }
    int _1381 = _1375;
    float _1383 = as_type<float>(_808) * _1365;
    float _1385 = -_1027;
    float _1387 = fma(_1369, _1307, _1385);
    int _1389 = _1381;
    if (!_977)
    {
        _1389 = 2;
    }
    int _1391 = _1389;
    float _1393 = _1335 * _1373;
    if (_1057)
    {
        float _1395 = -_726;
        float _1397 = _1395 + 1.0;
        _1377 = as_type<int>(_1397);
    }
    int _1399 = _1377;
    bool _1401 = _716 > 0.5;
    float _1403 = trunc(_1383);
    float _1405 = precise::max(_1403, 0.0);
    uint _1407 = uint(_1405);
    bool _1409 = _1391 != 2;
    float _1411 = _1157 * _1393;
    int _1413 = ~_742;
    int _1415 = _1413 + 1;
    float _1417 = _1299 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    if (!_1057)
    {
        _1379 = _726;
    }
    float _1419 = _1379;
    float _1421 = _1387 + 0.5;
    float _1423 = _1419;
    if (_1057)
    {
        float _1425 = _1401 ? as_type<float>(_1399) : _726;
        _1423 = _1425;
    }
    float _1427 = _1423;
    float _1429 = -_1335;
    float _1431 = _1429 + 1.0;
    float _1433 = float(uint(_1235));
    int _1435 = _1415 * int(_1363);
    int _1437 = _1435 + _1287;
    float _1439 = fma(_1417, _901, -0.5);
    int _1441 = ~_764;
    int _1443 = _1441 + 1;
    float _1445 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1411);
    float _1447 = as_type<float>(_796) * _1433;
    float _1449 = float(uint(_1437));
    float _1451 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    if (_1409)
    {
        _841 = _146;
    }
    float _1453 = _841;
    int _1455 = _1443 * int(_1407);
    int _1457 = _1455 + _1339;
    float _1459 = _1453;
    if (!_1409)
    {
        _1459 = _736;
    }
    float _1461 = _1459;
    float _1463 = as_type<float>(_796) * _1449;
    float _1465 = fma(_1231, _1367, _1445);
    float _1467 = float(uint(_1457));
    float _1469 = trunc(_1447);
    float _1471 = precise::max(_1469, 0.0);
    uint _1473 = uint(_1471);
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1477 = as_type<float>(_808) * _1467;
    int _1479 = ~_742;
    int _1481 = _1479 + 1;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    int _1485 = ~_764;
    int _1487 = _1485 + 1;
    float _1489 = trunc(_1463);
    float _1491 = precise::max(_1489, 0.0);
    uint _1493 = uint(_1491);
    float _1495 = float(uint(_1293));
    float _1497 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _1499 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1475);
    float _1501 = _1461 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    float _1503 = as_type<float>(_808) * _1495;
    float _1505 = fma(_716, (*spvDescriptorSet0.vp_c9)._m0[88].w, _1497);
    int _1507 = _1481 * int(_1473);
    int _1509 = _1507 + _1235;
    float _1511 = fma(_146, (*spvDescriptorSet0.vp_c9)._m0[88].z, _1483);
    float _1513 = trunc(_1477);
    float _1515 = precise::max(_1513, 0.0);
    uint _1517 = uint(_1515);
    int _1519 = ~_742;
    int _1521 = _1519 + 1;
    float _1523 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    if (!_1409)
    {
        _843 = _146;
    }
    float _1525 = _843;
    float _1527 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].z, _1511);
    float _1529 = float(uint(_1509));
    float _1531 = -_1523;
    float _1533 = fma(_1501, 2.0, _1531);
    int _1535 = int(_1363) + int(_1493);
    float _1537 = trunc(_1503);
    float _1539 = precise::max(_1537, 0.0);
    uint _1541 = uint(_1539);
    float _1543 = as_type<float>(_796) * _1529;
    float _1545 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[87].w, _1505);
    int _1547 = _1521 * _1535;
    int _1549 = _1547 + _1287;
    float _1551 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _1553 = int(_1407) + int(_1517);
    float _1555 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[80].x, -0.5);
    bool _1557 = uint(_1549) >= uint(_742);
    float _1559 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1499);
    int _1561 = ~_764;
    int _1563 = _1561 + 1;
    float _1565 = fma(_1551, _1427, -0.5);
    float _1567 = trunc(_1543);
    float _1569 = precise::max(_1567, 0.0);
    uint _1571 = uint(_1569);
    int _1573 = _1487 * int(_1541);
    int _1575 = _1573 + _1293;
    int _1577 = _1563 * _1553;
    int _1579 = _1577 + _1339;
    int _1581 = ~_764;
    int _1583 = _1581 + 1;
    float _1585 = float(uint(_1575));
    float _1587 = fma(_1559, _1555, _1221);
    bool _1589 = !_1557;
    int _1591 = _1589 ? 0 : (-1);
    float _1593 = fma(_1321, (*spvDescriptorSet0.vp_c9)._m0[133].x, _1465);
    bool _1595 = uint(_1579) >= uint(_764);
    float _1597 = as_type<float>(_808) * _1585;
    int _1599 = ~_1535;
    int _1601 = _1599 + _1591;
    int _1603 = _1601 + 1;
    float _1605 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    bool _1607 = !_1595;
    int _1609 = _1607 ? 0 : (-1);
    float _1611 = trunc(_1597);
    float _1613 = precise::max(_1611, 0.0);
    uint _1615 = uint(_1613);
    int _1617 = int(_1473) + int(_1571);
    int _1619 = _742 * _1603;
    int _1621 = _1619 + _1287;
    int _1623 = ~_1553;
    int _1625 = _1623 + _1609;
    int _1627 = _1625 + 1;
    float _1629 = _1525 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    int _1631 = ~_742;
    int _1633 = _1631 + 1;
    bool _1635 = !_1153;
    int _1637 = _1635 ? _1621 : (-1);
    int _1639 = _764 * _1627;
    int _1641 = _1639 + _1339;
    float _1643 = fma(_1629, -2.0, _1605);
    int _1645 = _1633 * _1617;
    int _1647 = _1645 + _1235;
    int _1649 = _1637 & 3;
    bool _1651 = _1649 != 0;
    bool _1653 = !_1199;
    int _1655 = _1653 ? _1641 : (-1);
    float _1657 = _1125 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _1659 = uint(_1649) > 1u;
    float _1661 = fma(_116, (*spvDescriptorSet0.vp_c9)._m0[86].y, _1643);
    int _1663 = _1637 & 3;
    bool _1665 = _1663 != 0;
    float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1669 = _1657 + _1667;
    int _1671 = _1655 >> 31;
    float _1673 = -_1661;
    float _1675 = fma(_1545, _1439, _1673);
    int _1677 = _1637 >> 31;
    int _1679 = _1665 ? 0 : 1;
    int _1681 = _1671 & 3;
    int _1683 = _1677 & 3;
    int _1685 = ~_1679;
    int _1687 = _1685 + 1;
    int _1689 = _1687 + 1;
    int _1691 = _1655 + _1681;
    int _1693 = _1689;
    float _1695 = _1593;
    if (!_1659)
    {
        int _1697 = ~_1679;
        int _1699 = _1697 + 1;
        _1693 = _1699;
    }
    int _1701 = _1693;
    float _1703 = _1135 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1705 = uint(_1649) >= 2u;
    int _1707 = _1637 + _1683;
    float _1709 = _1133 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1711 = _1691 >> 2;
    int _1713 = _1705 ? 0 : 1;
    float _1715 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1717 = _1709 + _1715;
    bool _1719 = _1649 != 3;
    int _1721 = _1707 >> 2;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1725 = _1703 + _1723;
    int _1727 = _1711 << 4;
    int _1729 = _1727 + 512;
    int _1731 = int(_1541) + int(_1615);
    int _1733 = _1721 << 4;
    int _1735 = _1733 + 368;
    uint _1737 = uint(int(uint(_1729) >> uint(2)));
    uint _1739 = uint(int(uint(int(_1737)) >> uint(2)));
    int _1741 = int(_1737) & 3;
    float _1743 = (*spvDescriptorSet0.vp_c9)._m0[int(_1739)][_1741];
    int _1745 = int(_1737) + 1;
    uint _1747 = uint(int(uint(_1745) >> uint(2)));
    int _1749 = _1745 & 3;
    float _1751 = (*spvDescriptorSet0.vp_c9)._m0[int(_1747)][_1749];
    bool _1753 = uint(_1647) >= uint(_742);
    int _1755 = _1583 * _1731;
    int _1757 = _1755 + _1293;
    float _1759 = _1669 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _1761 = ~_1713;
    int _1763 = _1761 + 1;
    int _1765 = _1763 + 1;
    int _1767 = _1765;
    if (_1719)
    {
        int _1769 = ~_1713;
        int _1771 = _1769 + 1;
        _1767 = _1771;
    }
    int _1773 = _1767;
    float _1775 = -_116;
    float _1777 = fma(_1775, (*spvDescriptorSet0.vp_c9)._m0[86].x, _1533);
    uint _1779 = uint(int(uint(_1735) >> uint(2)));
    uint _1781 = uint(int(uint(int(_1779)) >> uint(2)));
    int _1783 = int(_1779) & 3;
    float _1785 = (*spvDescriptorSet0.vp_c9)._m0[int(_1781)][_1783];
    int _1787 = int(_1779) + 1;
    uint _1789 = uint(int(uint(_1787) >> uint(2)));
    int _1791 = _1787 & 3;
    float _1793 = (*spvDescriptorSet0.vp_c9)._m0[int(_1789)][_1791];
    bool _1795 = uint(_1757) >= uint(_764);
    float _1797 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1759);
    bool _1799 = !_1753;
    int _1801 = _1799 ? 0 : (-1);
    float _1803 = fma(_1527, _1565, _1777);
    bool _1805 = !_1045;
    int _1807 = _1805 ? 0 : 1;
    float _1809 = fma(_1725, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1797);
    int _1811 = _1655 & 3;
    bool _1813 = _1811 != 0;
    int _1815 = _1729 + 8;
    uint _1817 = uint(int(uint(_1815) >> uint(2)));
    uint _1819 = uint(int(uint(int(_1817)) >> uint(2)));
    int _1821 = int(_1817) & 3;
    float _1823 = (*spvDescriptorSet0.vp_c9)._m0[int(_1819)][_1821];
    int _1825 = int(_1817) + 1;
    uint _1827 = uint(int(uint(_1825) >> uint(2)));
    int _1829 = _1825 & 3;
    float _1831 = (*spvDescriptorSet0.vp_c9)._m0[int(_1827)][_1829];
    int _1833 = _1655 & 3;
    bool _1835 = _1833 != 0;
    float _1837 = _1587 + 0.5;
    bool _1839 = !_1795;
    int _1841 = _1839 ? 0 : (-1);
    bool _1843 = uint(_1833) > 1u;
    int _1845 = _1813 ? 0 : 1;
    out.m_63.x = _1837;
    out.m_63.y = _1421;
    bool _1847 = _1809 >= 0.0;
    int _1849 = _1735 + 8;
    uint _1851 = uint(int(uint(_1849) >> uint(2)));
    uint _1853 = uint(int(uint(int(_1851)) >> uint(2)));
    int _1855 = int(_1851) & 3;
    float _1857 = (*spvDescriptorSet0.vp_c9)._m0[int(_1853)][_1855];
    int _1859 = int(_1851) + 1;
    uint _1861 = uint(int(uint(_1859) >> uint(2)));
    int _1863 = _1859 & 3;
    float _1865 = (*spvDescriptorSet0.vp_c9)._m0[int(_1861)][_1863];
    int _1867 = ~_1617;
    int _1869 = _1867 + _1801;
    int _1871 = _1869 + 1;
    int _1873 = ~_1845;
    int _1875 = _1873 + 1;
    int _1877 = _1875 + 1;
    int _1879 = abs(_1773);
    int _1881 = _742 * _1871;
    int _1883 = _1881 + _1235;
    int _1885 = _1877;
    if (!_1843)
    {
        int _1887 = ~_1845;
        int _1889 = _1887 + 1;
        _1885 = _1889;
    }
    int _1891 = _1885;
    bool _1893 = _1649 != 3;
    int _1895 = abs(_1891);
    if (_1847)
    {
        out.m_51.x = 0.0;
    }
    int _1897 = abs(_1701);
    bool _1899 = !_1651;
    int _1901 = _1899 ? 0 : 1;
    bool _1903 = !_1835;
    int _1905 = _1903 ? 0 : 1;
    bool _1907 = uint(_1833) >= 2u;
    int _1909 = ~_1895;
    int _1911 = _1909 + 1;
    int _1913 = _1911 + 1;
    bool _1915 = _1833 != 3;
    int _1917 = abs(_1905);
    int _1919 = ~_1897;
    int _1921 = _1919 + 1;
    int _1923 = _1921 + 1;
    int _1925 = _1907 ? 0 : 1;
    bool _1927 = _1833 != 3;
    int _1929 = _1913 * as_type<int>(_1751);
    int _1931 = abs(_1901);
    int _1933 = _1923 * as_type<int>(_1793);
    uint _1935 = uint(int(uint(_684) >> uint(2)));
    uint _1937 = uint(int(uint(int(_1935)) >> uint(2)));
    int _1939 = int(_1935) & 3;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[int(_1937)][_1939];
    int _1943 = int(_1935) + 1;
    uint _1945 = uint(int(uint(_1943) >> uint(2)));
    int _1947 = _1943 & 3;
    float _1949 = (*spvDescriptorSet0.vp_c9)._m0[int(_1945)][_1947];
    int _1951 = ~_1931;
    int _1953 = _1951 + 1;
    int _1955 = _1953 + 1;
    int _1957 = ~_1917;
    int _1959 = _1957 + 1;
    int _1961 = _1959 + 1;
    int _1963 = ~_1925;
    int _1965 = _1963 + 1;
    int _1967 = _1965 + 1;
    int _1969 = _1955 * as_type<int>(_1785);
    int _1971 = _1969 + _1933;
    int _1973 = _1967;
    if (_1915)
    {
        int _1975 = ~_1925;
        int _1977 = _1975 + 1;
        _1973 = _1977;
    }
    int _1979 = _1973;
    int _1981 = _684 + 8;
    uint _1983 = uint(int(uint(_1981) >> uint(2)));
    uint _1985 = uint(int(uint(int(_1983)) >> uint(2)));
    int _1987 = int(_1983) & 3;
    float _1989 = (*spvDescriptorSet0.vp_c9)._m0[int(_1985)][_1987];
    int _1991 = _1961 * as_type<int>(_1743);
    int _1993 = _1991 + _1929;
    bool _1995 = !_1893;
    int _1997 = _1995 ? 0 : (-1);
    int _1999 = abs(_1979);
    bool _2001 = !_1927;
    int _2003 = _2001 ? 0 : (-1);
    int _2005 = abs(_1997);
    int _2007 = ~_1879;
    int _2009 = _2007 + 1;
    int _2011 = _2009 + 1;
    int _2013 = abs(_2003);
    int _2015 = ~_1999;
    int _2017 = _2015 + 1;
    int _2019 = _2017 + 1;
    int _2021 = _2011 * as_type<int>(_1857);
    int _2023 = _2021 + _1971;
    bool _2025 = !_1063;
    int _2027 = _2025 ? 0 : 1;
    int _2029 = _2019 * as_type<int>(_1823);
    int _2031 = _2029 + _1993;
    int _2033 = abs(_1807);
    int _2035 = ~_2013;
    int _2037 = _2035 + 1;
    int _2039 = _2037 + 1;
    int _2041 = abs(_2027);
    int _2043 = _2039 * as_type<int>(_1831);
    int _2045 = _2043 + _2031;
    int _2047 = ~_2005;
    int _2049 = _2047 + 1;
    int _2051 = _2049 + 1;
    float _2053 = _1669 * _1669;
    int _2055 = ~_1731;
    int _2057 = _2055 + _1841;
    int _2059 = _2057 + 1;
    int _2061 = _2051 * as_type<int>(_1865);
    int _2063 = _2061 + _2023;
    float _2065 = fma(_1717, _1717, _2053);
    int _2067 = ~_2041;
    int _2069 = _2067 + 1;
    int _2071 = _2069 + 1;
    int _2073 = _764 * _2059;
    int _2075 = _2073 + _1293;
    int _2077 = ~_2033;
    int _2079 = _2077 + 1;
    int _2081 = _2079 + 1;
    float _2083 = fma(_1725, _1725, _2065);
    float _2085 = _1823;
    int _2087 = as_type<int>(_2053);
    if (_1847)
    {
        _2085 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2089 = _2085;
    int _2091 = _2045 * _2071;
    bool _2093 = !_1153;
    int _2095 = _2093 ? _1883 : (-1);
    float _2097 = rsqrt(_2083);
    bool _2099 = !_1199;
    int _2101 = _2099 ? _2075 : (-1);
    int _2103 = _2063 * _2081;
    if (_1847)
    {
        float _2105 = _2089 * 5.0;
        _2087 = as_type<int>(_2105);
    }
    int _2107 = _2087;
    float _2109 = _678 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _2111 = _2095 * _2033;
    int _2113 = _2111 + _2103;
    float _2115 = _1941 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2117 = _2101 * _2041;
    int _2119 = _2117 + _2091;
    float _2121 = _1949 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _1989 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    if (_1847)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6778 = as_type<float>(_2107);
        out.gl_Position.z = _6778;
    }
    float _2125 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _2127 = _2115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2131 = float(_2113);
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = float(_2119);
    float _2137 = _2125 * _2097;
    out.m_65.x = _2131;
    out.m_65.y = _2135;
    float _2139 = _1803 + 0.5;
    float _2141 = _1675 + 0.5;
    float _2143 = _1593 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2145 = _1717 * _2137;
    float _2147 = _1669 * _2137;
    out.m_67.x = _2139;
    out.m_67.y = _2141;
    out.m_69.x = _2127;
    out.m_69.y = _2129;
    out.m_69.z = _2133;
    out.m_69.w = _2143;
    if (_1847)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2149 = -_2147;
    float _2151 = _1657 + _2149;
    float _2153 = _1725 * _2137;
    float _2155 = -_2145;
    float _2157 = _1709 + _2155;
    float _2159 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2161 = _2151 + _2159;
    float _2163 = -_2153;
    float _2165 = _1703 + _2163;
    float _2167 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2169 = _2157 + _2167;
    float _2171 = _2161 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2173 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2175 = _2165 + _2173;
    float _2177 = fma(_2169, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2171);
    float _2179 = fma(_2175, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2177);
    bool _2181 = _2179 >= 0.0;
    float _2183 = _2153;
    float _2185 = _2151;
    float _2187 = _2157;
    if (_2181)
    {
        _1695 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2189 = _1695;
    int _2191 = as_type<int>(_2189);
    if (_2181)
    {
        out.m_51.x = 0.0;
    }
    if (_2181)
    {
        float _2193 = _2189 * 5.0;
        _2191 = as_type<int>(_2193);
    }
    int _2195 = _2191;
    if (_2181)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6918 = as_type<float>(_2195);
        out.gl_Position.z = _6918;
    }
    if (_2181)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2197 = -_1657;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2201 = -_1709;
    float _2203 = _2201 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2205 = -_1703;
    float _2207 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2209 = _2199 * _2199;
    float _2211 = -_2147;
    float _2213 = _1669 + _2211;
    float _2215 = fma(_2203, _2203, _2209);
    float _2217 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].z;
    float _2219 = fma(_2207, _2207, _2215);
    float _2221 = -_2145;
    float _2223 = _1717 + _2221;
    float _2225 = -_2217;
    float _2227 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2225);
    float _2229 = _2213 * _2213;
    float _2231 = rsqrt(_2219);
    float _2233 = -_2153;
    float _2235 = _1725 + _2233;
    float _2237 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2239 = fma(_2223, _2223, _2229);
    float _2241 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2237);
    float _2243 = _2151 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2245 = 1.0 / _678;
    float _2247 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2249 = (*spvDescriptorSet0.vp_c8)._m0[2].w * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2251 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2241);
    float _2253 = fma(_2157, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2243);
    float _2255 = -_2247;
    float _2257 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].y, _2255);
    float _2259 = -_2249;
    float _2261 = fma((*spvDescriptorSet0.vp_c8)._m0[3].w, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2259);
    float _2263 = _2203 * _2231;
    float _2265 = _2207 * _2231;
    float _2267 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2269 = _2257 * (*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2271 = _2263 * _2263;
    float _2273 = _2199 * _2231;
    float _2275 = -_2267;
    float _2277 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2275);
    float _2279 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2281 = fma(_2265, _2265, _2271);
    float _2283 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2285 = (*spvDescriptorSet0.vp_c8)._m0[2].z * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2287 = fma(_2165, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2253);
    float _2289 = rsqrt(_2281);
    float _2291 = -_2283;
    float _2293 = fma((*spvDescriptorSet0.vp_c8)._m0[2].y, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2291);
    float _2295 = -_2285;
    float _2297 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2295);
    float _2299 = _2287 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2301 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2277);
    float _2303 = (*spvDescriptorSet0.vp_c8)._m0[2].y * (*spvDescriptorSet0.vp_c8)._m0[3].x;
    float _2305 = -_2269;
    float _2307 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[1].y, _2305);
    float _2309 = _2301 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2311 = -_2279;
    float _2313 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2311);
    float _2315 = -_2303;
    float _2317 = fma((*spvDescriptorSet0.vp_c8)._m0[2].x, (*spvDescriptorSet0.vp_c8)._m0[3].y, _2315);
    float _2319 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2307);
    float _2321 = _2265 * _2289;
    float _2323 = _2263 * _2289;
    float _2325 = -_2309;
    float _2327 = fma(_2319, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2325);
    float _2329 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[1].w, _2313);
    float _2331 = -_2321;
    float _2333 = _2265 * _2331;
    float _2335 = -_2321;
    float _2337 = _2273 * _2335;
    float _2339 = fma(_2329, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2327);
    float _2341 = -_2333;
    float _2343 = fma(_2263, _2323, _2341);
    float _2345 = _2273 * _2323;
    float _2347 = _2297 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2349 = _2343 * _2343;
    float _2351 = -_2347;
    float _2353 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2351);
    float _2355 = fma(_2345, _2345, _2349);
    float _2357 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2353);
    float _2359 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2361 = fma(_2337, _2337, _2355);
    float _2363 = _2261 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2365 = -_2357;
    float _2367 = fma(_2365, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2339);
    float _2369 = -_2359;
    float _2371 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2369);
    float _2373 = _2257 * (*spvDescriptorSet0.vp_c8)._m0[0].z;
    float _2375 = -_2363;
    float _2377 = fma(_2257, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2375);
    float _2379 = rsqrt(_2361);
    float _2381 = fma(_2297, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2371);
    float _2383 = -_2373;
    float _2385 = fma(_2227, (*spvDescriptorSet0.vp_c8)._m0[0].y, _2383);
    float _2387 = fma(_2317, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2377);
    float _2389 = _680 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2391 = fma(_2293, (*spvDescriptorSet0.vp_c8)._m0[0].w, _2385);
    float _2393 = 1.0 / _2367;
    float _2395 = _2343 * _2379;
    float _2397 = precise::clamp(_2395, 0.0, 1.0);
    float _2399 = 1.0 / _676;
    float _2401 = -_2397;
    float _2403 = _2401 + 1.0;
    float _2405 = fma(_2381, _2393, -1.0);
    float _2407 = _2403 * _2393;
    float _2409 = _676 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2411 = fma(_2403, _2405, 1.0);
    float _2413 = _2391 * _2407;
    float _2415 = _2387 * _2407;
    float _2417 = 1.0 / _680;
    float _2419 = _2411 * _2411;
    float _2421 = fma(_2413, _2413, _2419);
    float _2423 = fma(_2415, _2415, _2421);
    float _2425 = rsqrt(_2423);
    float _2427 = _2415 * _2425;
    float _2429 = _2413 * _2425;
    float _2431 = _2411 * _2425;
    float _2433 = -_2427;
    float _2435 = _2263 * _2433;
    float _2437 = _2265 * _2431;
    float _2439 = -_2429;
    float _2441 = -_2435;
    float _2443 = fma(_2265, _2439, _2441);
    float _2445 = -_2429;
    float _2447 = _2273 * _2445;
    float _2449 = -_2427;
    float _2451 = -_2437;
    float _2453 = fma(_2273, _2449, _2451);
    float _2455 = fma(_2235, _2235, _2239);
    float _2457 = _2443 * _2443;
    float _2459 = -_2447;
    float _2461 = fma(_2263, _2431, _2459);
    float _2463 = sqrt(_2455);
    float _2465 = fma(_2453, _2453, _2457);
    float _2467 = fma(_2461, _2461, _2465);
    float _2469 = rsqrt(_2467);
    float _2471 = _2097 * _2463;
    float _2473 = _2471 * _2389;
    float _2475 = _2471 * _2409;
    float _2477 = _2109 * _2471;
    float _2479 = _2453 * _2469;
    float _2481 = _2461 * _2469;
    float _2483 = _2443 * _2469;
    float _2485 = _2265 * _2479;
    float _2487 = _2273 * _2481;
    float _2489 = -_2485;
    float _2491 = fma(_2263, _2481, _2489);
    float _2493 = _2263 * _2483;
    float _2495 = -_2487;
    float _2497 = fma(_2265, _2483, _2495);
    float _2499 = _2491 * _2491;
    float _2501 = -_2493;
    float _2503 = fma(_2273, _2479, _2501);
    float _2505 = fma(_2497, _2497, _2499);
    float _2507 = fma(_2503, _2503, _2505);
    float _2509 = rsqrt(_2507);
    float _2511 = _2503 * _2509;
    float _2513 = _2497 * _2509;
    float _2515 = _2491 * _2509;
    float _2517 = _2263 * _2511;
    float _2519 = in.m_71.x;
    float _2521 = in.m_71.y;
    float _2523 = in.m_71.z;
    float _2525 = _2265 * _2515;
    float _2527 = _2273 * _2513;
    float _2529 = -_2517;
    float _2531 = fma(_2265, _2513, _2529);
    float _2533 = -_2525;
    float _2535 = fma(_2273, _2511, _2533);
    float _2537 = -_2527;
    float _2539 = fma(_2263, _2515, _2537);
    float _2541 = _2531 * _2531;
    float _2543 = fma(_2535, _2535, _2541);
    float _2545 = fma(_2539, _2539, _2543);
    float _2547 = rsqrt(_2545);
    float _2549 = _2417 * _2521;
    float _2551 = _2245 * _2519;
    float _2553 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2549);
    float _2555 = _2399 * _2523;
    float _2557 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2551);
    float _2559 = _2553 * _2473;
    float _2561 = _2557 * _2477;
    float _2563 = _2535 * _2547;
    float _2565 = _2555 * _2475;
    float _2567 = _2559 * _2515;
    float _2569 = _2531 * _2547;
    float _2571 = _2559 * _2513;
    float _2573 = _2539 * _2547;
    float _2575 = _2559 * _2511;
    float _2577 = fma(_2561, _2569, _2567);
    float _2579 = fma(_2561, _2563, _2571);
    float _2581 = fma(_2561, _2573, _2575);
    float _2583 = fma(_2273, _2565, _2577);
    float _2585 = fma(_2263, _2565, _2579);
    float _2587 = fma(_2265, _2565, _2581);
    float _2589 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2591 = _1709 + _2585;
    float _2593 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2595 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2589);
    float _2597 = _2583 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _2599 = _2591 * 0.20000000298023223876953125;
    float _2601 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2593);
    float _2603 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2595);
    float _2605 = fma(_2585, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2597);
    float _2607 = floor(_2599);
    float _2609 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2601);
    float _2611 = _2603 * 64.0;
    float _2613 = _1703 + _2587;
    float _2615 = fma(_2587, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2605);
    float _2617 = _2609 * 49.0;
    float _2619 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2621 = _2613 * 0.20000000298023223876953125;
    float _2623 = _2615 * 64.0;
    float _2625 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2627 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2619);
    float _2629 = floor(_2621);
    float _2631 = _2611 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2633 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2625);
    float _2635 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2627);
    float _2637 = _1657 + _2583;
    float _2639 = -_2607;
    float _2641 = _2599 + _2639;
    float _2643 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2633);
    float _2645 = _2613 + _2635;
    float _2647 = fma(_2617, (*spvDescriptorSet0.vp_c10)._m0[9].y, _2631);
    float _2649 = _2641 * 6.283185482025146484375;
    float _2651 = _2591 + _2643;
    float _2653 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2655 = _2645 + _2653;
    float _2657 = fma(_2623, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2647);
    float _2659 = _2649 * 0.15915493667125701904296875;
    float _2661 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2663 = _2651 + _2661;
    float _2665 = _2655 * _2655;
    float _2667 = -_2629;
    float _2669 = _2621 + _2667;
    float _2671 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2673 = _2637 + _2657;
    float _2675 = fma(_2663, _2663, _2665);
    float _2677 = _2669 * 6.283185482025146484375;
    float _2679 = _2659 * 6.283185482025146484375;
    float _2681 = sin(_2679);
    float _2683 = _2299 + _2671;
    float _2685 = _2677 * 0.15915493667125701904296875;
    bool _2687 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2689 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2691 = _2687 || _2689;
    bool _2693 = isnan(0.5);
    bool _2695 = _2691 || _2693;
    float _2697 = sqrt(_2675);
    bool _2699 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2701 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2703 = _2699 || _2701;
    bool _2705 = isnan(0.5);
    bool _2707 = _2703 || _2705;
    float _2709 = _2685 * 6.283185482025146484375;
    float _2711 = sin(_2709);
    bool _2713 = _2697 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2715 = 1.0 / _2671;
    float _2717 = _2681 + _2711;
    float _2719 = fma(_2717, 0.20000000298023223876953125, _2673);
    float _2721 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _2723 = _2651;
    float _2725 = _2645;
    float _2727 = _2675;
    float _2729 = _2663;
    int _2731 = as_type<int>((*spvDescriptorSet0.vp_c15)._m0[660].y);
    if (!_2713)
    {
        _2721 = _2719;
    }
    float _2733 = _2721;
    bool _2735 = !_2713;
    float _2737 = _2733;
    float _2739 = _2715;
    if (!_2735)
    {
        float _2741 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2743 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2745 = _2697 + _2743;
        float _2747 = rsqrt(_2675);
        float _2749 = _2745 * _2741;
        float _2751 = _2719 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2753 = _2749 * 0.15915493667125701904296875;
        float _2755 = _2753 * 6.283185482025146484375;
        float _2757 = cos(_2755);
        float _2759 = _2753 * 6.283185482025146484375;
        float _2761 = sin(_2759);
        float _2763 = _2757 + (-1.0);
        float _2765 = fma(_2761, _2751, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2767 = _2763 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2769 = _2747 * _2765;
        float _2771 = fma(_2719, _2757, _2767);
        float _2773 = fma(_2663, _2769, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2775 = fma(_2655, _2769, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2723 = _2773;
        _2737 = _2771;
        _2725 = _2775;
        _2727 = _2747;
    }
    float _2777 = _2723;
    float _2779 = _2737;
    float _2781 = _2725;
    float _2783 = _2727;
    float _2785 = -_2145;
    float _2787 = _2785 + _2777;
    float _2789 = -_2147;
    float _2791 = _2789 + _2779;
    float _2793 = _2683 * _2715;
    float _2795 = _2793 * 0.5;
    float _2797 = -_2153;
    float _2799 = _2797 + _2781;
    float _2801 = _2791;
    float _2803 = _2799;
    float _2805 = _2795;
    float _2807 = _2783;
    if (_2695)
    {
        _2729 = 1.0;
    }
    float _2809 = _2729;
    float _2811 = _2809;
    if (_2707)
    {
        _2739 = _2787;
    }
    float _2813 = _2739;
    float _2815 = _2813;
    if (!_2707)
    {
        float _2817 = _2161 * _2161;
        float _2819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2821 = -_1709;
        float _2823 = _2821 + _2777;
        float _2825 = -_1657;
        float _2827 = _2825 + _2779;
        float _2829 = fma(_2169, _2169, _2817);
        float _2831 = -_1703;
        float _2833 = _2831 + _2781;
        float _2835 = fma(_2175, _2175, _2829);
        float _2837 = 1.0 / _2471;
        float _2839 = sqrt(_2835);
        float _2841 = precise::min(_2839, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2843 = _2841 * _2819;
        float _2845 = _2843 * _2837;
        float _2847 = fma(_2823, _2845, _2157);
        float _2849 = fma(_2827, _2845, _2151);
        float _2851 = fma(_2833, _2845, _2165);
        _2801 = _2849;
        _2815 = _2847;
        _2803 = _2851;
    }
    float _2853 = _2801;
    float _2855 = _2815;
    float _2857 = _2803;
    if (!_2695)
    {
        float _2859 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2861 = _2859 * 0.15915493667125701904296875;
        float _2863 = _2861 * 6.283185482025146484375;
        float _2865 = cos(_2863);
        float _2867 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2869 = _2867 * 0.15915493667125701904296875;
        float _2871 = _2861 * 6.283185482025146484375;
        float _2873 = sin(_2871);
        float _2875 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2877 = fma(_2795, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2875);
        float _2879 = 1.0 / _2865;
        float _2881 = _2869 * 6.283185482025146484375;
        float _2883 = cos(_2881);
        float _2885 = _2873 * _2879;
        float _2887 = 1.0 / _2877;
        float _2889 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2891 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2889;
        float _2893 = _2883 * _2885;
        float _2895 = _2869 * 6.283185482025146484375;
        float _2897 = sin(_2895);
        float _2899 = 1.0 / _2893;
        float _2901 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2903 = _2887 * _2901;
        float _2905 = 1.0 / _2891;
        float _2907 = _2897 * _2899;
        float _2909 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2911 = fma(_2907, _2903, _2909);
        float _2913 = _2911 * _2905;
        float _2915 = precise::clamp(_2913, 0.0, 1.0);
        _2805 = _2887;
        _2811 = _2915;
    }
    float _2917 = _2805;
    float _2919 = _2811;
    float _2921 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2923 = _2853 + _2921;
    float _2925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2927 = _2855 + _2925;
    float _2929 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2931 = _2857 + _2929;
    float _2933 = _2923 * _2923;
    float _2935 = fma(_2927, _2927, _2933);
    float _2937 = fma(_2931, _2931, _2935);
    float _2939 = rsqrt(_2937);
    float _2941 = _2939 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2943 = _2927 * _2941;
    float _2945 = _2931 * _2941;
    float _2947 = _2943 * _2943;
    float _2949 = _2945 * _2945;
    float _2951 = _2947 + _2949;
    float _2953 = sqrt(_2951);
    bool _2955 = _2953 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2957 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2959 = _2953 + _2957;
    float _2961 = _2931;
    float _2963 = _2951;
    float _2965 = _2959;
    float _2967 = _2917;
    float _2969 = _2923;
    if (_2955)
    {
        float _2971 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2961 = _2971;
    }
    float _2973 = _2961;
    if (_2955)
    {
        float _2975 = rsqrt(_2951);
        _2963 = _2975;
    }
    float _2977 = _2963;
    float _2979 = _2977;
    if (_2955)
    {
        float _2981 = _2959 * _2973;
        _2965 = _2981;
    }
    float _2983 = _2965;
    if (_2955)
    {
        float _2985 = _2983 * 0.15915493667125701904296875;
        _2967 = _2985;
    }
    float _2987 = _2967;
    float _2989 = _2939;
    if (_2955)
    {
        float _2991 = _2987 * 6.283185482025146484375;
        float _2993 = sin(_2991);
        _2989 = _2993;
    }
    float _2995 = _2989;
    float _2997 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2999 = precise::max(0.0, _2997);
    float _3001 = _2933;
    float _3003 = _2999;
    float _3005 = _2997;
    if (_2955)
    {
        float _3007 = _2987 * 6.283185482025146484375;
        float _3009 = cos(_3007);
        _3001 = _3009;
    }
    float _3011 = _3001;
    float _3013 = -_2941;
    float _3015 = -_2999;
    float _3017 = fma(_2923, _3013, _3015);
    if (!_2955)
    {
        _2969 = _2945;
    }
    float _3019 = _2969;
    float _3021 = _3019;
    if (_2955)
    {
        float _3023 = _3017 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3003 = _3023;
    }
    float _3025 = _3003;
    float _3027 = _3025;
    float _3029 = _2995;
    if (_2955)
    {
        float _3031 = fma(_2995, _3025, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3027 = _3031;
    }
    float _3033 = _3027;
    float _3035 = _3033;
    if (!_2955)
    {
        _3029 = _2943;
    }
    float _3037 = _3029;
    float _3039 = _3037;
    float _3041 = _3011;
    if (_2955)
    {
        float _3043 = _3011 + (-1.0);
        _3005 = _3043;
    }
    float _3045 = _3005;
    if (_2955)
    {
        float _3047 = _2977 * _3033;
        _2807 = _3047;
    }
    float _3049 = _2807;
    if (!_2955)
    {
        _3035 = _3017;
    }
    float _3051 = _3035;
    float _3053 = _3051;
    if (_2955)
    {
        float _3055 = _3045 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2183 = _3055;
    }
    float _3057 = _2183;
    if (_2955)
    {
        float _3059 = _2943 * _3049;
        _3039 = _3059;
    }
    float _3061 = _3039;
    float _3063 = sqrt(_2937);
    if (!_2955)
    {
        _2979 = _2947;
    }
    float _3065 = _2979;
    float _3067 = _3065;
    if (_2955)
    {
        float _3069 = fma(_3017, _3011, _3057);
        _3053 = _3069;
    }
    float _3071 = _3053;
    if (_2955)
    {
        float _3073 = _2945 * _3049;
        _3021 = _3073;
    }
    float _3075 = _3021;
    if (_2955)
    {
        float _3077 = _3061 * _3061;
        _3067 = _3077;
    }
    float _3079 = _3067;
    if (!_2955)
    {
        _3041 = _2949;
    }
    float _3081 = _3041;
    float _3083 = _3081;
    if (_2955)
    {
        float _3085 = _3075 * _3075;
        _3083 = _3085;
    }
    float _3087 = _3083;
    float _3089 = fma(_3071, _3071, _3079);
    float _3091 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3093 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3095 = _3089 + _3087;
    float _3097 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3091);
    float _3099 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3101 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3093);
    float _3103 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3105 = fma(_3063, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3103);
    float _3107 = precise::clamp(_3105, 0.0, 1.0);
    float _3109 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3097);
    float _3111 = rsqrt(_3095);
    float _3113 = _2853 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3115 = -_3107;
    float _3117 = _3115 + 1.0;
    float _3119 = _3109 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3121 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3099);
    float _3123 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3113);
    float _3125 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3101);
    float _3127 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _3129 = abs(_3117);
    float _3131 = log2(_3129);
    float _3133 = _3119 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3135 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3121);
    float _3137 = fma(_2857, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3123);
    float _3139 = _3125 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3141 = -_3133;
    float _3143 = fma(_3141, _3127, 1.0);
    float _3145 = _3135 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3147 = _3137 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3149 = _3111 * _3061;
    float _3151 = _3111 * _3071;
    float _3153 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3155 = _3111 * _3075;
    float _3157 = _3149 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3159 = log2(_3143);
    float _3161 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3153);
    float _3163 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3165 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3167 = -_3157;
    float _3169 = fma(_3151, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3167);
    float _3171 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3161);
    float _3173 = -_3155;
    float _3175 = fma(_3173, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3169);
    float _3177 = exp2(_3165);
    float _3179 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3171);
    float _3181 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3183 = fma(_3175, -0.5, 0.5);
    float _3185 = fma(_3175, 0.5, 0.5);
    float _3187 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3163);
    float _3189 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3181);
    float _3191 = _3151 + 1.0;
    float _3193 = 1.0 / _3179;
    float _3195 = fma(_3185, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3197 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3189);
    float _3199 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3187);
    float _3201 = _3159 * 0.693147182464599609375;
    float _3203 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3197);
    float _3205 = sqrt(_3183);
    float _3207 = -_3151;
    float _3209 = fma(_3177, _3191, _3207);
    float _3211 = fma(_3185, _3195, -0.212114393711090087890625);
    float _3213 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3199);
    float _3215 = _3201 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3217 = fma(_3209, 0.5, 0.5);
    float _3219 = fma(_3185, _3211, 1.570728778839111328125);
    float _3221 = _3203 * _3193;
    float _3223 = _3213 * _3193;
    float _3225 = fma(_3221, 0.5, 0.5);
    float _3227 = fma(_3223, -0.5, 0.5);
    float _3229 = _3205 * 0.636619746685028076171875;
    float _3231 = -_3219;
    float _3233 = fma(_3229, _3231, 1.0);
    float3 _8594 = float3(_3225, _3227, _3215);
    float _3235 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8594, float3(0.0), isnan(_8594)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8594, float3(0.0), isnan(_8594)), level(0.0)).x;
    float3 _8605 = float3(_3225, _3227, _3215);
    float4 _3238 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8605, float3(0.0), isnan(_8605)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8605, float3(0.0), isnan(_8605)), level(0.0)).xyzw;
    float _3240 = _3238.x;
    float _3242 = _3238.y;
    float _3244 = _3238.z;
    float _3246 = _3238.w;
    float2 _8622 = float2(_3233, _3217);
    float3 _3250 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8622, float2(0.0), isnan(_8622)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8622, float2(0.0), isnan(_8622)), level(0.0)).xyz;
    float _3252 = _3250.x;
    float _3254 = _3250.y;
    float _3256 = _3250.z;
    float _3258 = in.m_73.y;
    bool _3260 = _2549 != 0.0;
    bool _3262 = isnan(_2549);
    bool _3264 = _3260 || _3262;
    bool _3266 = isnan(0.0);
    bool _3268 = _3264 || _3266;
    float _3270 = _3131 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3272 = in.m_73.z;
    bool _3274 = _2551 == 0.0;
    bool _3276 = !_3268;
    bool _3278 = _3274 && _3276;
    float _3280 = exp2(_3270);
    bool _3282 = _2555 == 0.0;
    bool _3284 = _3282 && _3278;
    out.m_59.x = _648;
    out.m_59.y = _666;
    out.m_59.z = _664;
    out.m_59.w = _668;
    out.m_69.x = _2127;
    out.m_69.y = _2129;
    out.m_69.z = _2133;
    out.m_69.w = _2143;
    out.m_75.x = _2563;
    out.m_75.y = _2569;
    out.m_75.z = _2573;
    out.m_77.x = _2855;
    out.m_77.y = _2853;
    out.m_77.z = _2857;
    int _3286 = as_type<int>(_3225);
    float _3288 = _3139;
    if (_3284)
    {
        float _3290 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3258);
        _2731 = as_type<int>(_3290);
    }
    int _3292 = _2731;
    int _3294 = _3292;
    if (!_3284)
    {
        float _3296 = fma(_2549, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3258);
        _3294 = as_type<int>(_3296);
    }
    int _3298 = _3294;
    float _3300 = -_3280;
    float _3302 = _3300 + 1.0;
    out.m_79.x = _2157;
    out.m_79.y = _2151;
    out.m_79.z = _2165;
    if (_3284)
    {
        float _3304 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3286 = as_type<int>(_3304);
    }
    int _3306 = _3286;
    int _3308 = _3306;
    if (!_3284)
    {
        float _3310 = fma(_2555, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3272);
        _3308 = as_type<int>(_3310);
    }
    int _3312 = _3308;
    bool _3314 = !_3284;
    float _3316 = _3314 ? as_type<float>(_3298) : _3258;
    float _3318 = in.m_73.x;
    float _3320 = _3302 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3322 = !_3284;
    float _3324 = _3322 ? as_type<float>(_3312) : _3272;
    float _3326 = _3316 * _3316;
    float _3328 = fma(_3324, _3324, _3326);
    float _3330 = _3326;
    if (_3284)
    {
        _3330 = _3258;
    }
    float _3332 = _3330;
    float _3334 = _3139 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3336 = _3332;
    if (!_3284)
    {
        _3336 = as_type<float>(_3298);
    }
    float _3338 = _3336;
    if (_3284)
    {
        _3288 = _3272;
    }
    float _3340 = _3288;
    float _3342 = rsqrt(_3328);
    float _3344 = _3340;
    if (!_3284)
    {
        _3344 = as_type<float>(_3312);
    }
    float _3346 = _3344;
    float _3348 = _2515 * _3338;
    float _3350 = fma(_3147, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3334);
    float _3352 = fma(_3119, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3350);
    float _3354 = _3318;
    if (!_3284)
    {
        float _3356 = fma(_2551, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3318);
        _3354 = _3356;
    }
    float _3358 = _3354;
    bool _3360 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3362 = isnan(_3063);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3368 = _3364 || _3366;
    float _3370 = _3316 * _3342;
    float _3372 = _3324 * _3342;
    float _3374 = -_2263;
    float _3376 = _3370 * _3374;
    float _3378 = -_2273;
    float _3380 = _3370 * _3378;
    float _3382 = -_2265;
    float _3384 = _3370 * _3382;
    if (!_3368)
    {
        _2185 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3386 = _2185;
    float _3388 = fma(_3372, _2513, _3376);
    float _3390 = fma(_3372, _2515, _3380);
    float _3392 = fma(_3372, _2511, _3384);
    float _3394 = fma(_2569, _3358, _3348);
    float _3396 = _2513 * _3338;
    float _3398 = _2511 * _3338;
    float _3400 = _3179 * 0.5;
    out.m_81.x = _3388;
    out.m_81.y = _3390;
    out.m_81.z = _3392;
    float _3402 = fma(_2563, _3358, _3396);
    float _3404 = fma(_3145, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3352);
    float _3406 = fma(_3213, -0.5, _3400);
    float _3408 = _3203 + _3179;
    float _3410 = _3386;
    float _3412 = _3386;
    if (!_3368)
    {
        _2187 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3414 = _2187;
    float _3416 = _3404 + _3179;
    out.gl_Position.x = _3203;
    out.gl_Position.y = _3213;
    out.gl_Position.z = _3404;
    out.gl_Position.w = _3179;
    float _3418 = _3408 * 0.5;
    float _3420 = _3416 * 0.5;
    float _3422 = fma(_2273, _3346, _3394);
    float _3424 = fma(_2573, _3358, _3398);
    float _3426 = fma(_2263, _3346, _3402);
    out.m_83.x = _3418;
    out.m_83.y = _3406;
    out.m_83.z = _3420;
    out.m_83.w = _3179;
    float _3428 = fma(_2265, _3346, _3424);
    out.m_85.x = _3426;
    out.m_85.y = _3422;
    out.m_85.z = _3428;
    float _3430 = _2919 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3432 = _3320 * _3235;
    float _3434 = -_3320;
    float _3436 = _3434 + 1.0;
    float _3438 = _3246 * _3432;
    float _3440 = _3256 * _3432;
    float _3442 = _3246 * _3436;
    float _3444 = fma(_3252, _3438, _3240);
    float _3446 = fma(_3254, _3438, _3242);
    float _3448 = fma(_3246, _3440, _3244);
    float _3450 = _3438;
    float _3452 = _3414;
    float _3454 = _3414;
    if (!_3368)
    {
        _3450 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3456 = _3450;
    out.m_87.x = _3444;
    out.m_87.y = _3446;
    out.m_87.z = _3448;
    out.m_87.w = _3442;
    bool _3458 = !_3368;
    float _3460 = _3456;
    float _3462 = _3456;
    if (!_3458)
    {
        bool _3464 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3466 = isnan(_3063);
        bool _3468 = _3464 || _3466;
        bool _3470 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3472 = _3468 || _3470;
        if (!_3472)
        {
            float _3474 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3476 = _3063 + _3474;
            float _3478 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3480 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3478;
            float _3482 = 1.0 / _3480;
            float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3486 = _3484 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3488 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3490 = _3488 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3492 = _3476 * _3482;
            float _3494 = precise::clamp(_3492, 0.0, 1.0);
            float _3496 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3498 = _3496 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3500 = fma(_3494, _3490, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3502 = fma(_3494, _3498, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3504 = fma(_3494, _3486, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            _3454 = _3504;
            _3412 = _3502;
            _3462 = _3500;
            _3506 = true;
        }
        else
        {
            bool _3508 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3510 = isnan(_3063);
            bool _3512 = _3508 || _3510;
            bool _3514 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3516 = _3512 || _3514;
            if (!_3516)
            {
                _3410 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3518 = _3410;
            _3412 = _3518;
            if (!_3516)
            {
                _3452 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3520 = _3452;
            _3454 = _3520;
            if (!_3516)
            {
                _3460 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3522 = _3460;
            bool _3524 = !_3516;
            _3462 = _3522;
            if (!_3524)
            {
                bool _3526 = _3063 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3528 = isnan(_3063);
                bool _3530 = _3526 || _3528;
                bool _3532 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3534 = _3530 || _3532;
                if (!_3534)
                {
                    float _3536 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3538 = _3063 + _3536;
                    float _3540 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3542 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3540;
                    float _3544 = 1.0 / _3542;
                    float _3546 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3548 = _3546 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3550 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3552 = _3550 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3554 = _3538 * _3544;
                    float _3556 = precise::clamp(_3554, 0.0, 1.0);
                    float _3558 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3560 = _3558 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3562 = fma(_3556, _3552, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3564 = fma(_3556, _3560, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3566 = fma(_3556, _3548, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    _3454 = _3566;
                    _3412 = _3564;
                    _3462 = _3562;
                    _3506 = true;
                }
                else
                {
                    _3454 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3412 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3462 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                }
            }
        }
    }
    _3506 = false;
    float _3568 = _3454;
    float _3570 = _3412;
    float _3572 = _3462;
    float _3574 = _3430 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_89.x = 0.0;
    float _3576 = _3568 * 0.586610972881317138671875;
    bool _3578 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    out.m_51.x = _3574;
    float _3580 = fma(_3570, 0.298911988735198974609375, _3576);
    bool _3582 = _2919 > 0.0;
    bool _3584 = isnan(_2919);
    bool _3586 = _3582 || _3584;
    bool _3588 = isnan(0.0);
    bool _3590 = _3586 || _3588;
    float _3592 = fma(_3572, 0.114477999508380889892578125, _3580);
    float _3594 = -_3592;
    float _3596 = _3594 + _3570;
    float _3598 = -_3592;
    float _3600 = _3598 + _3568;
    float _3602 = -_3592;
    float _3604 = _3602 + _3572;
    float _3606 = fma(_3596, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    float _3608 = fma(_3600, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    float _3610 = fma(_3604, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3592);
    bool _3612 = !_3578;
    if (!_3612)
    {
        float _3614 = -_2853;
        float _3616 = _3614 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3618 = -_2855;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3622 = -_2857;
        float _3624 = _3622 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3626 = _3616 * _3616;
        float _3628 = fma(_3620, _3620, _3626);
        float _3630 = fma(_3624, _3624, _3628);
        float _3632 = sqrt(_3630);
        float _3634 = rsqrt(_3630);
        float _3636 = -_3632;
        float _3638 = _3636 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3640 = _3638 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3642 = precise::clamp(_3640, 0.0, 1.0);
        float _3644 = _3620 * _3634;
        float _3646 = _3616 * _3634;
        float _3648 = abs(_3642);
        float _3650 = log2(_3648);
        float _3652 = _3624 * _3634;
        float _3654 = _3644 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3656 = _3422 * _3646;
        float _3658 = -_3646;
        float _3660 = -_3654;
        float _3662 = fma(_3658, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3660);
        float _3664 = fma(_3426, _3644, _3656);
        float _3666 = -_3652;
        float _3668 = fma(_3666, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3662);
        float _3670 = fma(_3428, _3652, _3664);
        float _3672 = precise::clamp(_3670, 0.0, 1.0);
        float _3674 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3676 = _3668 + _3674;
        float _3678 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3680 = _3676 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3682 = precise::clamp(_3680, 0.0, 1.0);
        float _3684 = exp2(_3678);
        float _3686 = _3684 * _3682;
        float _3688 = _3672 * _3686;
        float _3690 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3692 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3694 = _3688 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_89.x = _3690;
        out.m_89.y = _3692;
        out.m_89.z = _3694;
    }
    out.m_91.x = _3606;
    out.m_91.y = _3608;
    out.m_91.z = _3610;
    if (_3590)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3696 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3696;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_91.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_91.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_91.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_91.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

