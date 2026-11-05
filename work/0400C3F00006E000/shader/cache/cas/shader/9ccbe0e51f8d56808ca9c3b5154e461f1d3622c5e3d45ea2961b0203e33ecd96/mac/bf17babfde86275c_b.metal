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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c16 [[id(5)]];
    constant _16* vp_c13 [[id(6)]];
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
    float4 m_89 [[user(locn3)]];
    float4 m_71 [[user(locn4)]];
    float4 m_73 [[user(locn5)]];
    float4 m_81 [[user(locn6)]];
    float4 m_75 [[user(locn7)]];
    float4 m_77 [[user(locn8)]];
    float4 m_87 [[user(locn9)]];
    float4 m_83 [[user(locn10)]];
    float4 m_85 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_79 [[attribute(0)]];
    float4 m_61 [[attribute(1)]];
    float4 m_48 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_65 [[attribute(4)]];
    float4 m_59 [[attribute(5)]];
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2017 = false;
    bool _1366 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_124);
        out.gl_Position.z = _2302;
    }
    if (!_112)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
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
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_162);
        out.gl_Position.z = _2372;
    }
    if (_154)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_55.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = in.m_57.y;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _194 + _198;
    float _202 = in.m_55.w;
    int _204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _206 = _204 != 0;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _194 + _208;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _214 = _212 != 0;
    float _216 = in.m_55.y;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _220 = _218 != 0;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _226 = _224 != 0;
    float _228 = in.m_55.x;
    float _230 = in.m_55.z;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _234 = _232 != 0;
    float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _238 = log2(_236);
    float _240 = in.m_48.x;
    float _242 = in.m_48.y;
    float _244 = in.m_48.z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _248 = -_196;
    float _250 = _248 + 1.0;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _254 = in.m_57.x;
    bool _256 = _202 > 0.5;
    float _258 = _216 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _260 = _256 ? as_type<int>(_250) : as_type<int>(_196);
    bool _262 = _216 > 0.5;
    float _264 = _228 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _266 = _226 ? as_type<float>(_260) : _196;
    float _268 = _228 * 2.0;
    float _270 = _196;
    if (_206)
    {
        float _272 = _262 ? _250 : _196;
        _270 = _272;
    }
    float _274 = _270;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _290 = _288 != 0;
    float _292 = -_246;
    float _294 = fma(_264, 2.0, _292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = 1.0 / _278;
    float _302 = 0.0;
    bool _304 = _262;
    if (!_234)
    {
        _302 = _230;
    }
    float _306 = _302;
    float _308 = fma(_258, -2.0, _252);
    float _310 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = _216 * 2.0;
    float _318 = 0.0;
    float _320 = _242;
    float _322 = _306;
    if (!_234)
    {
        _318 = _216;
    }
    float _324 = _318;
    float _326 = floor(_268);
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = 0.0;
    float _336 = _324;
    if (!_234)
    {
        _334 = _216;
    }
    float _338 = _334;
    float _340 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _342 = 0.0;
    float _344 = _338;
    if (!_234)
    {
        _342 = _228;
    }
    float _346 = _342;
    float _348 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _350 = _346;
    if (!_234)
    {
        _320 = _306;
    }
    float _352 = _320;
    float _354 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    float _356 = 1.0 / _298;
    float _358 = _352;
    if (_234)
    {
        _336 = _228;
    }
    float _360 = _336;
    float _362 = _200 * _300;
    if (_234)
    {
        _344 = _228;
    }
    float _364 = _344;
    float _366 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _348);
    if (_234)
    {
        _350 = _230;
    }
    float _368 = _350;
    float _370 = _360 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_234)
    {
        _358 = _216;
    }
    float _372 = _358;
    float _374 = floor(_316);
    if (_234)
    {
        _322 = _216;
    }
    float _376 = _322;
    float _378 = _366 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _380 = _326 >= 0.0;
    bool _382 = isnan(_326);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    int _390 = _388 ? 0 : 1;
    float _392 = _210 * _356;
    float _394 = abs(_330);
    float _396 = _394 + 0.001000000047497451305389404296875;
    bool _398 = _326 > 0.0;
    float _400 = _330 * _330;
    float _402 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[193].x, 1.0);
    float _404 = _396 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _406 = fma(_328, _328, _400);
    float _408 = _402 * _328;
    float _410 = _228 + _216;
    float _412 = -_404;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[194].y, _412);
    float _416 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[193].y, 1.0);
    int _418 = ~_390;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = _410 + (-1.0);
    int _426 = _422;
    if (!_398)
    {
        int _428 = ~_390;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = fma(_332, _332, _406);
    bool _436 = _374 >= 0.0;
    bool _438 = isnan(_374);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = _416 * _332;
    float _448 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _452 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _354);
    int _454 = _444 ? 0 : 1;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    bool _464 = _374 > 0.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _466;
    float _470 = _374;
    float _472 = _468;
    if (!_214)
    {
        _470 = _254;
    }
    float _474 = _470;
    float _476 = fma(_458, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = fma(_462, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _480 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_194);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = fma(_468, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = _474;
    if (!_214)
    {
        _472 = _474;
    }
    float _508 = _472;
    float _510 = fma(_496, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _512 = _508;
    if (_214)
    {
        _506 = _254;
    }
    float _514 = _506;
    float _516 = fma(_500, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = -_490;
    float _520 = _518 + 1.0;
    bool _522 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_194);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = fma(_504, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _536 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_194);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = _222 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _552 = _532 * _520;
    float _554 = -_532;
    float _556 = _554 + 1.0;
    float _558 = fma(_266, _548, -0.5);
    float _560 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[83].z, _550);
    float _562 = _546 * _556;
    float _564 = -_546;
    float _566 = _564 + 1.0;
    float _568 = sqrt(_434);
    float _570 = _476 * _562;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _574 = _478 * _562;
    float _576 = _492 * _562;
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _570);
    float _580 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[84].z, _572);
    float _582 = _230 * 2.0;
    float _584 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _574);
    float _586 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _590 = _372 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _594 = floor(_582);
    bool _596 = !_286;
    int _598 = _596 ? 0 : 1;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _602 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _592);
    bool _604 = !_290;
    int _606 = _604 ? 0 : 1;
    float _608 = _238 * _142;
    int _610 = abs(_598);
    float _612 = -_600;
    float _614 = fma(_370, 2.0, _612);
    float _616 = _216 + _230;
    int _618 = ~_454;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = fma(_590, -2.0, _588);
    int _626 = _622;
    if (!_464)
    {
        int _628 = ~_454;
        int _630 = _628 + 1;
        _626 = _630;
    }
    int _632 = _626;
    float _634 = _616 + (-1.0);
    int _636 = abs(_606);
    float _638 = exp2(_608);
    float _640 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[84].x, _580);
    float _642 = _414 * 0.01745329238474369049072265625;
    float _644 = float(_636);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = float(_632);
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = float(_432);
    float _656 = abs(_396);
    float _658 = log2(_656);
    bool _660 = _594 > 0.0;
    float _662 = in.m_61.x;
    float _664 = in.m_61.y;
    float _666 = in.m_61.z;
    bool _668 = _594 >= 0.0;
    bool _670 = isnan(_594);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = _644 * _650;
    float _680 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _308);
    float _682 = 1.0 / _648;
    float _684 = float(_610);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _688 = _676 ? 0 : 1;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _692 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _694 = isnan(1.0);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _700 = _696 || _698;
    float _702 = _684 * _654;
    float _704 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[78].z, _686);
    float _706 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[78].w, _690);
    float _708 = -_638;
    float _710 = _708 + 1.0;
    bool _712 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _720 = _716 || _718;
    float _722 = -_142;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _294);
    float _726 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _706);
    float _728 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _704);
    float _730 = _720 ? _710 : 0.0;
    float _732 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _560);
    float _734 = -_142;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[81].x, _614);
    float _738 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _602);
    float _740 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _624);
    float _742 = _702 * (-2.0);
    bool _744 = _660;
    if (_700)
    {
        float _746 = _730 * _682;
        _144 = _746;
    }
    float _748 = _144;
    bool _750 = !_282;
    int _752 = _750 ? 0 : 1;
    float _754 = _216 + (-0.5);
    float _756 = fma(_742, _664, _664);
    int _758 = ~_688;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    float _764 = abs(_568);
    float _766 = log2(_764);
    int _768 = _762;
    if (!_660)
    {
        int _770 = ~_688;
        int _772 = _770 + 1;
        _768 = _772;
    }
    int _774 = _768;
    float _776 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].y, _756);
    int _778 = abs(_752);
    float _780 = fma(_652, _742, _652);
    float _782 = _228 + _230;
    float _784 = float(_774);
    float _786 = _642 * 0.15915493667125701904296875;
    float _788 = float(_778);
    float _790 = _782 + (-1.0);
    float _792 = fma(_780, _748, _776);
    float _794 = _678 * (-2.0);
    float _796 = _788 * _784;
    float _798 = _658 * 0.5;
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = _230 + (-0.5);
    float _804 = fma(_794, _666, _666);
    float _806 = _796 * (-2.0);
    float _808 = _786 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = fma(_800, _794, _800);
    float _814 = _766 * 1.5;
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[196].z, _804);
    float _818 = fma(_806, _662, _662);
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_214)
    {
        bool _822 = _228 > 0.5;
        _744 = _822;
    }
    bool _824 = _744;
    float _826 = in.m_63.x;
    float _828 = in.m_63.y;
    float _830 = in.m_63.z;
    float _832 = _228 + (-0.5);
    float _834 = exp2(_798);
    float _836 = fma(_448, _806, _448);
    float _838 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[196].x, _818);
    float _840 = fma(_812, _748, _816);
    float _842 = fma(_510, _552, _578);
    float _844 = fma(_836, _748, _838);
    float _846 = exp2(_814);
    float _848 = fma(_810, 0.5, 0.5);
    float _850 = fma(_534, _552, _586);
    float _852 = _792 * 0.15915493667125701904296875;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = _844 * 0.15915493667125701904296875;
    float _858 = (*spvDescriptorSet0.vp_c7)._m0[0].x * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _860 = _834 * _848;
    float _862 = fma(_516, _552, _584);
    float _864 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].x, _842);
    if (_220)
    {
        bool _866 = _230 > 0.5;
        _304 = _866;
    }
    bool _868 = _304;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[193].w, 1.0);
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = _864 * _826;
    float _876 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].y, _862);
    float _878 = _858 * _846;
    float _880 = _870 * _446;
    float _882 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].z, _850);
    float _884 = _876 * _828;
    float _886 = fma(_408, _870, _878);
    float _888 = _852 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = _882 * _830;
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _330);
    float _900 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _904 = _892 * _896;
    float _906 = _854 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _880);
    float _914 = _900 * _898;
    float _916 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _918 = fma(_910, _274, -0.5);
    float _920 = _902 * _912;
    int _922 = as_type<int>(_900);
    float _924 = _880;
    if (_214)
    {
        float _926 = -_514;
        float _928 = _926 + 1.0;
        _922 = as_type<int>(_928);
    }
    int _930 = _922;
    float _932 = _856 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _640 * (-0.15915493667125701904296875);
    if (!_220)
    {
        _820 = _514;
    }
    float _938 = _820;
    float _940 = -_680;
    float _942 = fma(_726, _918, _940);
    float _944 = _938;
    if (_214)
    {
        float _946 = _824 ? as_type<float>(_930) : _514;
        _512 = _946;
    }
    float _948 = _512;
    bool _950 = _330 != 0.0;
    bool _952 = isnan(_330);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = _852 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = _890 * _908;
    bool _966 = _886 == 0.0;
    bool _968 = !_958;
    bool _970 = _966 && _968;
    bool _972 = _880 == 0.0;
    bool _974 = _972 && _970;
    float _976 = _856 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _934 * _890;
    float _982 = _934 * _908;
    float _984 = _982 * _914;
    float _986 = _854 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _934 * _962;
    float _992 = _962 * _908;
    float _994 = _978 * _890;
    float _996 = _978 * _908;
    float _998 = _978 * _962;
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1002 = _996 * _914;
    float _1004 = fma(_988, _994, _990);
    float _1006 = -_998;
    float _1008 = fma(_988, _980, _1006);
    float _1010 = -_980;
    float _1012 = fma(_988, _998, _1010);
    float _1014 = -_914;
    float _1016 = _988 * _1014;
    float _1018 = fma(_1004, _904, _1002);
    float _1020 = fma(_988, _990, _994);
    float _1022 = fma(_1008, _904, _984);
    float _1024 = fma(_964, _904, _1016);
    float _1026 = fma(_1012, _920, _1018);
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1030 = fma(_1020, _920, _1022);
    float _1032 = fma(_992, _920, _1024);
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1036 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = in.m_65.x;
    float _1040 = in.m_65.y;
    float _1042 = in.m_65.z;
    float _1044 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1034);
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1050 = _936 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = fma(_1044, _948, -0.5);
    float _1056 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1046);
    float _1058 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1048);
    int _1060 = as_type<int>(_1048);
    if (_220)
    {
        float _1062 = -_514;
        float _1064 = _1062 + 1.0;
        _1060 = as_type<int>(_1064);
    }
    int _1066 = _1060;
    float _1068 = fma(_728, _1054, _724);
    float _1070 = _378 + _1056;
    float _1072 = _916 + _1058;
    float _1074 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1076 = _1070;
    float _1078 = _1072;
    float _1080 = _1068;
    if (_220)
    {
        float _1082 = _868 ? as_type<float>(_1066) : _514;
        _944 = _1082;
    }
    float _1084 = _944;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1088 = _1070 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1092 = _1072 + _1090;
    float _1094 = _936 * 6.283185482025146484375;
    float _1096 = cos(_1094);
    float _1098 = _1088 * _1088;
    float _1100 = _1092 * _1092;
    float _1102 = fma(_1074, _1084, -0.5);
    float _1104 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1106 = _1052 * _558;
    float _1108 = _1098 + _1100;
    float _1110 = _1040;
    float _1112 = _1038;
    float _1114 = _1042;
    float _1116 = _1098;
    float _1118 = _1100;
    if (!_974)
    {
        float _1120 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1040);
        _1110 = _1120;
    }
    float _1122 = _1110;
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1104);
    if (!_974)
    {
        float _1126 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1112 = _1126;
    }
    float _1128 = _1112;
    float _1130 = sqrt(_1108);
    float _1132 = -_1122;
    float _1134 = _988 * _1132;
    float _1136 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1124);
    float _1138 = _996 * _1122;
    float _1140 = _982 * _1122;
    float _1142 = _1096 * _558;
    float _1144 = _1136 * _1136;
    float _1146 = fma(_964, _1128, _1134);
    float _1148 = _1146;
    if (!_974)
    {
        float _1150 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1042);
        _1114 = _1150;
    }
    float _1152 = _1114;
    float _1154 = -_1106;
    float _1156 = fma(_1096, _1102, _1154);
    float _1158 = fma(_1056, _1056, _1144);
    float _1160 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = fma(_1052, _1102, _1142);
    float _1164 = fma(_1004, _1128, _1138);
    float _1166 = fma(_1058, _1058, _1158);
    float _1168 = _1160 + _1136;
    bool _1170 = _1130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = fma(_1008, _1128, _1140);
    float _1174 = fma(_992, _1152, _1146);
    float _1176 = -_1166;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[194].w, _1168);
    float _1180 = fma(_732, _1156, _736);
    float _1182 = -_740;
    float _1184 = fma(_738, _1162, _1182);
    float _1186 = fma(_1012, _1152, _1164);
    float _1188 = fma(_1020, _1152, _1172);
    if (!_1170)
    {
        _1148 = _1178;
    }
    float _1190 = _1148;
    bool _1192 = !_1170;
    float _1194 = _1190;
    if (!_1192)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1130 + _1198;
        float _1202 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = rsqrt(_1108);
        float _1206 = _1200 * _1196;
        float _1208 = _1206 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = fma(_1212, _1202, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1204 * _1218;
        float _1222 = _1216 + (-1.0);
        float _1224 = fma(_1088, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1226 = fma(_1092, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1228 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1232 = _1224 + _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1236 = _1226 + _1234;
        float _1238 = fma(_1178, _1216, _1228);
        float _1240 = _1232 * _1232;
        float _1242 = _1236 * _1236;
        _1194 = _1238;
        _1116 = _1240;
        _1118 = _1242;
        _1076 = _1224;
        _1078 = _1226;
    }
    float _1244 = _1194;
    float _1246 = _1116;
    float _1248 = _1118;
    float _1250 = _1076;
    float _1252 = _1078;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1256 = _1244 + _1254;
    float _1258 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1262 = fma(_1256, _1256, _1246);
    float _1264 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1266 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1260);
    float _1268 = _1262 + _1248;
    float _1270 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1274 = sqrt(_1268);
    float _1276 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1270);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1266);
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1294 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _942 + 0.5;
    float _1308 = _1068 + 0.5;
    float _1310 = _1180 + 0.5;
    float _1312 = _1184 + 0.5;
    float _1314 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1316 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1276);
    out.m_67.x = _1294;
    out.m_67.y = _1296;
    out.m_67.z = _1298;
    out.m_67.w = _1290;
    bool _1318 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1320 = isnan(_1274);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1326 = _1322 || _1324;
    out.m_69.x = _1300;
    out.m_69.y = _1302;
    out.m_69.z = _1304;
    out.m_69.w = _1292;
    out.m_71.x = _414;
    out.m_73.x = _1308;
    out.m_73.y = _1306;
    out.m_73.z = _1310;
    out.m_73.w = _1312;
    float _1328 = _1300;
    float _1330 = _1304;
    if (!_1326)
    {
        _1080 = 1.0;
    }
    float _1332 = _1080;
    out.m_75.x = _1314;
    out.m_75.y = _1288;
    out.m_75.z = _1316;
    bool _1334 = !_1326;
    float _1336 = _1332;
    if (!_1334)
    {
        bool _1338 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1340 = isnan(_1274);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1346 = _1342 || _1344;
        if (!_1346)
        {
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = _1274 + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1354 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1352;
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1360 = 1.0 / _1354;
            float _1362 = _1350 * _1360;
            float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1336 = _1364;
            _1366 = true;
        }
        else
        {
            bool _1368 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1370 = isnan(_1274);
            bool _1372 = _1368 || _1370;
            bool _1374 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1376 = _1372 || _1374;
            if (!_1376)
            {
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1274 + _1378;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1388 = _1386 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1390 = 1.0 / _1384;
                float _1392 = _1380 * _1390;
                float _1394 = fma(_1392, _1388, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1336 = _1394;
                _1366 = true;
            }
            else
            {
                _1336 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1366 = false;
    float _1396 = _1336;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1400 = _1244 + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1404 = _1250 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1408 = _1252 + _1406;
    float _1410 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1412 = fma(_1404, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1414 = fma(_1408, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1410 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1422 = _1412 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1426 = _1414 + _1424;
    float _1428 = _1418 * _1418;
    float _1430 = fma(_1422, _1422, _1428);
    float _1432 = fma(_1426, _1426, _1430);
    float _1434 = rsqrt(_1432);
    float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1438 = _1422 * _1436;
    float _1440 = _1426 * _1436;
    float _1442 = _1438 * _1438;
    float _1444 = _1440 * _1440;
    float _1446 = _1442 + _1444;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1448 + _1452;
    float _1456 = _1434;
    float _1458 = _1454;
    float _1460 = _1418;
    if (_1450)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1462;
    }
    float _1464 = _1456;
    if (_1450)
    {
        float _1466 = rsqrt(_1446);
        _1328 = _1466;
    }
    float _1468 = _1328;
    if (_1450)
    {
        float _1470 = _1454 * _1464;
        _1458 = _1470;
    }
    float _1472 = _1458;
    if (_1450)
    {
        float _1474 = _1472 * 0.15915493667125701904296875;
        _1330 = _1474;
    }
    float _1476 = _1330;
    float _1478 = _942;
    float _1480 = _1476;
    if (_1450)
    {
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1478 = _1484;
    }
    float _1486 = _1478;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1426;
    float _1494 = _1490;
    float _1496 = _1488;
    if (_1450)
    {
        float _1498 = _1476 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1492 = _1500;
    }
    float _1502 = _1492;
    float _1504 = -_1436;
    float _1506 = -_1490;
    float _1508 = fma(_1418, _1504, _1506);
    float _1510 = _1508;
    if (!_1450)
    {
        _1460 = _1444;
    }
    float _1512 = _1460;
    float _1514 = _1512;
    if (_1450)
    {
        float _1516 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1516;
    }
    float _1518 = _1494;
    float _1520 = _1518;
    if (!_1450)
    {
        _1480 = _1438;
    }
    float _1522 = _1480;
    float _1524 = _1486;
    float _1526 = _1522;
    if (_1450)
    {
        float _1528 = fma(_1486, _1518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = _1530;
    if (_1450)
    {
        float _1534 = _1502 + (-1.0);
        _1496 = _1534;
    }
    float _1536 = _1496;
    if (_1450)
    {
        float _1538 = _1468 * _1530;
        _924 = _1538;
    }
    float _1540 = _924;
    if (!_1450)
    {
        _1532 = _1440;
    }
    float _1542 = _1532;
    float _1544 = _1542;
    if (_1450)
    {
        float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1546;
    }
    float _1548 = _1520;
    float _1550 = _1548;
    if (_1450)
    {
        float _1552 = _1438 * _1540;
        _1526 = _1552;
    }
    float _1554 = _1526;
    if (_1450)
    {
        float _1556 = _1440 * _1540;
        _1544 = _1556;
    }
    float _1558 = _1544;
    float _1560 = sqrt(_1432);
    if (_1450)
    {
        float _1562 = fma(_1508, _1502, _1548);
        _1510 = _1562;
    }
    float _1564 = _1510;
    if (!_1450)
    {
        _1550 = _1442;
    }
    float _1566 = _1550;
    float _1568 = _1566;
    if (_1450)
    {
        float _1570 = _1554 * _1554;
        _1568 = _1570;
    }
    float _1572 = _1568;
    if (_1450)
    {
        float _1574 = _1558 * _1558;
        _1514 = _1574;
    }
    float _1576 = _1514;
    float _1578 = fma(_1564, _1564, _1572);
    float _1580 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1582 = _1578 + _1576;
    float _1584 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1580);
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1588 = rsqrt(_1582);
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1592 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1590);
    float _1594 = precise::clamp(_1592, 0.0, 1.0);
    float _1596 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1584);
    float _1598 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1600 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1602 = -_1594;
    float _1604 = _1602 + 1.0;
    float _1606 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1608 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1610 = floor(_1598);
    float _1612 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1614 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1616 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    float _1618 = -_1614;
    float _1620 = fma(_1618, _1586, 1.0);
    float _1622 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1624 = abs(_1604);
    float _1626 = log2(_1624);
    float _1628 = _1588 * _1554;
    float _1630 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1632 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1622);
    float _1634 = _1588 * _1564;
    float _1636 = _1588 * _1558;
    float _1638 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1600);
    float _1640 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1642 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1644 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = floor(_1608);
    float _1648 = -_1640;
    float _1650 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1648);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1656 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1638);
    float _1658 = -_1636;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1650);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1654);
    float _1666 = log2(_1620);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = fma(_1660, 0.5, 0.5);
    float _1672 = -_1610;
    float _1674 = _1598 + _1672;
    float _1676 = exp2(_1662);
    float _1678 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1680 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1682 = -_1646;
    float _1684 = _1608 + _1682;
    float _1686 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1690 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1692 = sqrt(_1668);
    float _1694 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1686);
    float _1696 = fma(_1670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1698 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1700 = _1634 + 1.0;
    float _1702 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1694);
    float _1704 = fma(_1670, _1696, -0.212114393711090087890625);
    float _1706 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1698);
    float _1708 = 1.0 / _1688;
    float _1710 = -_1634;
    float _1712 = fma(_1676, _1700, _1710);
    float _1714 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1702);
    float _1716 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1706);
    float _1718 = fma(_1670, _1704, 1.570728778839111328125);
    float _1720 = _1666 * 0.693147182464599609375;
    float2 _4945 = float2(_1684, _1674);
    float _1722 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4945, float2(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4945, float2(0.0), isnan(_4945)), level(0.0)).x;
    float _1724 = fma(_1712, 0.5, 0.5);
    float _1726 = _1692 * 0.636619746685028076171875;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1730 = -_1718;
    float _1732 = fma(_1726, _1730, 1.0);
    float _1734 = _1714 * _1708;
    float _1736 = _1716 * _1708;
    float _1738 = fma(_1734, 0.5, 0.5);
    float _1740 = fma(_1736, -0.5, 0.5);
    float3 _4980 = float3(_1738, _1740, _1728);
    float _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4980, float3(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4980, float3(0.0), isnan(_4980)), level(0.0)).x;
    float3 _4991 = float3(_1738, _1740, _1728);
    float4 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4991, float3(0.0), isnan(_4991)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4991, float3(0.0), isnan(_4991)), level(0.0)).xyzw;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = _1745.w;
    float2 _5007 = float2(_1732, _1724);
    float3 _1757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5007, float2(0.0), isnan(_5007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5007, float2(0.0), isnan(_5007)), level(0.0)).xyz;
    float _1759 = _1757.x;
    float _1761 = _1757.y;
    float _1763 = _1757.z;
    float _1765 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _1412;
    out.m_77.y = _1410;
    out.m_77.z = _1414;
    bool _1769 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1771 = isnan(_1560);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1777 = _1773 || _1775;
    float _1779 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1781 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1767);
    float _1785 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1779);
    float _1787 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1789 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1783);
    float _1791 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1793 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1787);
    float _1795 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1789);
    float _1797 = 1.0 / _1791;
    float _1799 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1801 = _1799 + _1791;
    float _1803 = _1801 * _1797;
    float _1805 = _1803 * 0.5;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1809 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1807);
    float _1811 = 1.0 / _1809;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1815 = _1811 * _1813;
    float _1817 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1819 = abs(_1815);
    float _1821 = log2(_1819);
    bool _1823 = _1815 <= 8000.0;
    bool _1825 = isnan(_1815);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan(8000.0);
    bool _1831 = _1827 || _1829;
    float _1833 = float(_1831);
    float _1835 = exp2(_1817);
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1716;
    out.gl_Position.z = _1795;
    out.gl_Position.w = _1688;
    float _1837 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1839 = exp2(_1837);
    float _1841 = -_1835;
    float _1843 = _1841 + 1.0;
    float _1845 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1847 = -_1845;
    float _1849 = _1847 + 1.0;
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1853 = precise::clamp(_1851, 0.0, 1.0);
    float _1855 = _1795 + _1688;
    float _1857 = _1795;
    float _1859 = _1849;
    float _1861 = _1845;
    if (!_1777)
    {
        _1857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1863 = _1857;
    float _1865 = fma(_1853, -2.0, 3.0);
    float _1867 = _1853 * _1853;
    float _1869 = _1867 * _1865;
    float _1871 = in.m_79.x;
    float _1873 = -_1869;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1869);
    float _1879 = _1855 * 0.5;
    float _1881 = _1833 * _1877;
    out.m_81.z = _1879;
    out.m_81.w = _1688;
    float _1883 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1885 = -_1722;
    float _1887 = _1885 + 1.0;
    float _1889 = _1887 * _1883;
    float _1891 = precise::clamp(_1889, 0.0, 1.0);
    float _1893 = -_1891;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1897 = _1895 * _1871;
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1901 = _1897;
    float _1903 = _1751;
    float _1905 = _1863;
    float _1907 = _1863;
    if (!_1777)
    {
        _1901 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1909 = _1901;
    float _1911 = _1845 * _1742;
    float _1913 = _1753 * _1849;
    out.m_83.x = _1899;
    float _1915 = _1909;
    float _1917 = _1909;
    if (!_1777)
    {
        _1859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1919 = _1859;
    float _1921 = _1753 * _1911;
    float _1923 = _1763 * _1911;
    float _1925 = _1921;
    float _1927 = _1919;
    float _1929 = _1919;
    if (!_1777)
    {
        _1861 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1931 = _1861;
    float _1933 = fma(_1759, _1921, _1747);
    float _1935 = fma(_1761, _1921, _1749);
    float _1937 = fma(_1753, _1923, _1751);
    float _1939 = _1931;
    float _1941 = _1931;
    if (!_1777)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1943 = _1903;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1777)
    {
        _1925 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1949 = _1925;
    out.m_85.x = _1933;
    out.m_85.y = _1935;
    out.m_85.z = _1937;
    out.m_85.w = _1913;
    bool _1951 = !_1777;
    float _1953 = _1949;
    float _1955 = _1949;
    if (!_1951)
    {
        bool _1957 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1959 = isnan(_1560);
        bool _1961 = _1957 || _1959;
        bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1965 = _1961 || _1963;
        if (!_1965)
        {
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1969 = _1560 + _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1971;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1979 = 1.0 / _1973;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1997 = _1969 * _1979;
            float _1999 = precise::clamp(_1997, 0.0, 1.0);
            float _2001 = fma(_1999, _1977, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2003 = fma(_1999, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2009 = fma(_1999, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2011 = fma(_1999, _1991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2013 = fma(_1999, _1995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2015 = fma(_1999, _2007, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1907 = _2003;
            _1917 = _2011;
            _1947 = _2001;
            _1941 = _2009;
            _1929 = _2015;
            _1955 = _2013;
            _2017 = true;
        }
        else
        {
            bool _2019 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2021 = isnan(_1560);
            bool _2023 = _2019 || _2021;
            bool _2025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2027 = _2023 || _2025;
            if (!_2027)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2029 = _1945;
            _1947 = _2029;
            if (!_2027)
            {
                _1905 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2031 = _1905;
            _1907 = _2031;
            if (!_2027)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2033 = _1927;
            _1929 = _2033;
            if (!_2027)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2035 = _1939;
            _1941 = _2035;
            if (!_2027)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2037 = _1915;
            _1917 = _2037;
            if (!_2027)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2039 = _1953;
            bool _2041 = !_2027;
            _1955 = _2039;
            if (!_2041)
            {
                bool _2043 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2045 = isnan(_1560);
                bool _2047 = _2043 || _2045;
                bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2051 = _2047 || _2049;
                if (!_2051)
                {
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2055 = _1560 + _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2057;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2065 = 1.0 / _2059;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2083 = _2055 * _2065;
                    float _2085 = precise::clamp(_2083, 0.0, 1.0);
                    float _2087 = fma(_2085, _2063, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2089 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2095 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2097 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2099 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2101 = fma(_2085, _2093, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1907 = _2089;
                    _1917 = _2097;
                    _1947 = _2087;
                    _1941 = _2095;
                    _1929 = _2101;
                    _1955 = _2099;
                    _2017 = true;
                }
                else
                {
                    _1907 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2017 = false;
    float _2103 = _1907;
    float _2105 = _1917;
    float _2107 = _1947;
    float _2109 = _1941;
    float _2111 = _1929;
    float _2113 = _1955;
    float _2115 = fma(_1288, -0.5, 0.5);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    float _2123 = -_2107;
    float _2125 = _2123 + _2109;
    float _2127 = -_2111;
    float _2129 = _2127 + _2113;
    bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = fma(_2117, _2121, _2103);
    float _2135 = fma(_2117, _2125, _2107);
    float _2137 = fma(_2117, _2129, _2111);
    float _2139 = _2133 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2141 = fma(_2135, 0.298911988735198974609375, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = fma(_2137, 0.114477999508380889892578125, _2141);
    out.m_83.w = _2143;
    float _2147 = -_2145;
    float _2149 = _2135 + _2147;
    float _2151 = -_2145;
    float _2153 = _2133 + _2151;
    float _2155 = -_2145;
    float _2157 = _2137 + _2155;
    out.m_87.x = 0.0;
    float _2159 = fma(_2149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    float _2161 = fma(_2153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    float _2163 = fma(_2157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    out.m_89.x = _2159;
    out.m_89.y = _2161;
    out.m_89.z = _2163;
    if (!_2131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2165 = -_1410;
    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2169 = -_1412;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2173 = -_1414;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2177 = _2167 * _2167;
    float _2179 = fma(_2171, _2171, _2177);
    float _2181 = fma(_2175, _2175, _2179);
    float _2183 = sqrt(_2181);
    float _2185 = rsqrt(_2181);
    float _2187 = -_2183;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2171 * _2185;
    float _2197 = _2167 * _2185;
    float _2199 = abs(_2193);
    float _2201 = log2(_2199);
    float _2203 = _2175 * _2185;
    float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2207 = _1288 * _2197;
    float _2209 = -_2197;
    float _2211 = -_2205;
    float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
    float _2215 = fma(_1314, _2195, _2207);
    float _2217 = -_2203;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
    float _2221 = fma(_1316, _2203, _2215);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2227 = _2219 + _2225;
    float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = exp2(_2229);
    float _2237 = _2235 * _2233;
    float _2239 = _2223 * _2237;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2241;
    out.m_87.y = _2243;
    out.m_87.z = _2245;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_67 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_69 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2017 = false;
    bool _1366 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_124);
        out.gl_Position.z = _2302;
    }
    if (!_112)
    {
        return out;
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
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
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_162);
        out.gl_Position.z = _2372;
    }
    if (_154)
    {
        return out;
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_55.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = in.m_57.y;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _194 + _198;
    float _202 = in.m_55.w;
    int _204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _206 = _204 != 0;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _194 + _208;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _214 = _212 != 0;
    float _216 = in.m_55.y;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _220 = _218 != 0;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _226 = _224 != 0;
    float _228 = in.m_55.x;
    float _230 = in.m_55.z;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _234 = _232 != 0;
    float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _238 = log2(_236);
    float _240 = in.m_48.x;
    float _242 = in.m_48.y;
    float _244 = in.m_48.z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _248 = -_196;
    float _250 = _248 + 1.0;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _254 = in.m_57.x;
    bool _256 = _202 > 0.5;
    float _258 = _216 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _260 = _256 ? as_type<int>(_250) : as_type<int>(_196);
    bool _262 = _216 > 0.5;
    float _264 = _228 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _266 = _226 ? as_type<float>(_260) : _196;
    float _268 = _228 * 2.0;
    float _270 = _196;
    if (_206)
    {
        float _272 = _262 ? _250 : _196;
        _270 = _272;
    }
    float _274 = _270;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _290 = _288 != 0;
    float _292 = -_246;
    float _294 = fma(_264, 2.0, _292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = 1.0 / _278;
    float _302 = 0.0;
    bool _304 = _262;
    if (!_234)
    {
        _302 = _230;
    }
    float _306 = _302;
    float _308 = fma(_258, -2.0, _252);
    float _310 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = _216 * 2.0;
    float _318 = 0.0;
    float _320 = _242;
    float _322 = _306;
    if (!_234)
    {
        _318 = _216;
    }
    float _324 = _318;
    float _326 = floor(_268);
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = 0.0;
    float _336 = _324;
    if (!_234)
    {
        _334 = _216;
    }
    float _338 = _334;
    float _340 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _342 = 0.0;
    float _344 = _338;
    if (!_234)
    {
        _342 = _228;
    }
    float _346 = _342;
    float _348 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _350 = _346;
    if (!_234)
    {
        _320 = _306;
    }
    float _352 = _320;
    float _354 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    float _356 = 1.0 / _298;
    float _358 = _352;
    if (_234)
    {
        _336 = _228;
    }
    float _360 = _336;
    float _362 = _200 * _300;
    if (_234)
    {
        _344 = _228;
    }
    float _364 = _344;
    float _366 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _348);
    if (_234)
    {
        _350 = _230;
    }
    float _368 = _350;
    float _370 = _360 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_234)
    {
        _358 = _216;
    }
    float _372 = _358;
    float _374 = floor(_316);
    if (_234)
    {
        _322 = _216;
    }
    float _376 = _322;
    float _378 = _366 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _380 = _326 >= 0.0;
    bool _382 = isnan(_326);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    int _390 = _388 ? 0 : 1;
    float _392 = _210 * _356;
    float _394 = abs(_330);
    float _396 = _394 + 0.001000000047497451305389404296875;
    bool _398 = _326 > 0.0;
    float _400 = _330 * _330;
    float _402 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[193].x, 1.0);
    float _404 = _396 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _406 = fma(_328, _328, _400);
    float _408 = _402 * _328;
    float _410 = _228 + _216;
    float _412 = -_404;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[194].y, _412);
    float _416 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[193].y, 1.0);
    int _418 = ~_390;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = _410 + (-1.0);
    int _426 = _422;
    if (!_398)
    {
        int _428 = ~_390;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = fma(_332, _332, _406);
    bool _436 = _374 >= 0.0;
    bool _438 = isnan(_374);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = _416 * _332;
    float _448 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _452 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _354);
    int _454 = _444 ? 0 : 1;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    bool _464 = _374 > 0.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _466;
    float _470 = _374;
    float _472 = _468;
    if (!_214)
    {
        _470 = _254;
    }
    float _474 = _470;
    float _476 = fma(_458, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = fma(_462, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _480 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_194);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = fma(_468, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = _474;
    if (!_214)
    {
        _472 = _474;
    }
    float _508 = _472;
    float _510 = fma(_496, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _512 = _508;
    if (_214)
    {
        _506 = _254;
    }
    float _514 = _506;
    float _516 = fma(_500, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = -_490;
    float _520 = _518 + 1.0;
    bool _522 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_194);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = fma(_504, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _536 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_194);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = _222 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _552 = _532 * _520;
    float _554 = -_532;
    float _556 = _554 + 1.0;
    float _558 = fma(_266, _548, -0.5);
    float _560 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[83].z, _550);
    float _562 = _546 * _556;
    float _564 = -_546;
    float _566 = _564 + 1.0;
    float _568 = sqrt(_434);
    float _570 = _476 * _562;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _574 = _478 * _562;
    float _576 = _492 * _562;
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _570);
    float _580 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[84].z, _572);
    float _582 = _230 * 2.0;
    float _584 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _574);
    float _586 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _590 = _372 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _594 = floor(_582);
    bool _596 = !_286;
    int _598 = _596 ? 0 : 1;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _602 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _592);
    bool _604 = !_290;
    int _606 = _604 ? 0 : 1;
    float _608 = _238 * _142;
    int _610 = abs(_598);
    float _612 = -_600;
    float _614 = fma(_370, 2.0, _612);
    float _616 = _216 + _230;
    int _618 = ~_454;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = fma(_590, -2.0, _588);
    int _626 = _622;
    if (!_464)
    {
        int _628 = ~_454;
        int _630 = _628 + 1;
        _626 = _630;
    }
    int _632 = _626;
    float _634 = _616 + (-1.0);
    int _636 = abs(_606);
    float _638 = exp2(_608);
    float _640 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[84].x, _580);
    float _642 = _414 * 0.01745329238474369049072265625;
    float _644 = float(_636);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = float(_632);
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = float(_432);
    float _656 = abs(_396);
    float _658 = log2(_656);
    bool _660 = _594 > 0.0;
    float _662 = in.m_61.x;
    float _664 = in.m_61.y;
    float _666 = in.m_61.z;
    bool _668 = _594 >= 0.0;
    bool _670 = isnan(_594);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = _644 * _650;
    float _680 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _308);
    float _682 = 1.0 / _648;
    float _684 = float(_610);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _688 = _676 ? 0 : 1;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _692 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _694 = isnan(1.0);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _700 = _696 || _698;
    float _702 = _684 * _654;
    float _704 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[78].z, _686);
    float _706 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[78].w, _690);
    float _708 = -_638;
    float _710 = _708 + 1.0;
    bool _712 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _720 = _716 || _718;
    float _722 = -_142;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _294);
    float _726 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _706);
    float _728 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _704);
    float _730 = _720 ? _710 : 0.0;
    float _732 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _560);
    float _734 = -_142;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[81].x, _614);
    float _738 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _602);
    float _740 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _624);
    float _742 = _702 * (-2.0);
    bool _744 = _660;
    if (_700)
    {
        float _746 = _730 * _682;
        _144 = _746;
    }
    float _748 = _144;
    bool _750 = !_282;
    int _752 = _750 ? 0 : 1;
    float _754 = _216 + (-0.5);
    float _756 = fma(_742, _664, _664);
    int _758 = ~_688;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    float _764 = abs(_568);
    float _766 = log2(_764);
    int _768 = _762;
    if (!_660)
    {
        int _770 = ~_688;
        int _772 = _770 + 1;
        _768 = _772;
    }
    int _774 = _768;
    float _776 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].y, _756);
    int _778 = abs(_752);
    float _780 = fma(_652, _742, _652);
    float _782 = _228 + _230;
    float _784 = float(_774);
    float _786 = _642 * 0.15915493667125701904296875;
    float _788 = float(_778);
    float _790 = _782 + (-1.0);
    float _792 = fma(_780, _748, _776);
    float _794 = _678 * (-2.0);
    float _796 = _788 * _784;
    float _798 = _658 * 0.5;
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = _230 + (-0.5);
    float _804 = fma(_794, _666, _666);
    float _806 = _796 * (-2.0);
    float _808 = _786 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = fma(_800, _794, _800);
    float _814 = _766 * 1.5;
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[196].z, _804);
    float _818 = fma(_806, _662, _662);
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_214)
    {
        bool _822 = _228 > 0.5;
        _744 = _822;
    }
    bool _824 = _744;
    float _826 = in.m_63.x;
    float _828 = in.m_63.y;
    float _830 = in.m_63.z;
    float _832 = _228 + (-0.5);
    float _834 = exp2(_798);
    float _836 = fma(_448, _806, _448);
    float _838 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[196].x, _818);
    float _840 = fma(_812, _748, _816);
    float _842 = fma(_510, _552, _578);
    float _844 = fma(_836, _748, _838);
    float _846 = exp2(_814);
    float _848 = fma(_810, 0.5, 0.5);
    float _850 = fma(_534, _552, _586);
    float _852 = _792 * 0.15915493667125701904296875;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = _844 * 0.15915493667125701904296875;
    float _858 = (*spvDescriptorSet0.vp_c7)._m0[0].x * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _860 = _834 * _848;
    float _862 = fma(_516, _552, _584);
    float _864 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].x, _842);
    if (_220)
    {
        bool _866 = _230 > 0.5;
        _304 = _866;
    }
    bool _868 = _304;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[193].w, 1.0);
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = _864 * _826;
    float _876 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].y, _862);
    float _878 = _858 * _846;
    float _880 = _870 * _446;
    float _882 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].z, _850);
    float _884 = _876 * _828;
    float _886 = fma(_408, _870, _878);
    float _888 = _852 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = _882 * _830;
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _330);
    float _900 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _904 = _892 * _896;
    float _906 = _854 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _880);
    float _914 = _900 * _898;
    float _916 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _918 = fma(_910, _274, -0.5);
    float _920 = _902 * _912;
    int _922 = as_type<int>(_900);
    float _924 = _880;
    if (_214)
    {
        float _926 = -_514;
        float _928 = _926 + 1.0;
        _922 = as_type<int>(_928);
    }
    int _930 = _922;
    float _932 = _856 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _640 * (-0.15915493667125701904296875);
    if (!_220)
    {
        _820 = _514;
    }
    float _938 = _820;
    float _940 = -_680;
    float _942 = fma(_726, _918, _940);
    float _944 = _938;
    if (_214)
    {
        float _946 = _824 ? as_type<float>(_930) : _514;
        _512 = _946;
    }
    float _948 = _512;
    bool _950 = _330 != 0.0;
    bool _952 = isnan(_330);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = _852 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = _890 * _908;
    bool _966 = _886 == 0.0;
    bool _968 = !_958;
    bool _970 = _966 && _968;
    bool _972 = _880 == 0.0;
    bool _974 = _972 && _970;
    float _976 = _856 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _934 * _890;
    float _982 = _934 * _908;
    float _984 = _982 * _914;
    float _986 = _854 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _934 * _962;
    float _992 = _962 * _908;
    float _994 = _978 * _890;
    float _996 = _978 * _908;
    float _998 = _978 * _962;
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1002 = _996 * _914;
    float _1004 = fma(_988, _994, _990);
    float _1006 = -_998;
    float _1008 = fma(_988, _980, _1006);
    float _1010 = -_980;
    float _1012 = fma(_988, _998, _1010);
    float _1014 = -_914;
    float _1016 = _988 * _1014;
    float _1018 = fma(_1004, _904, _1002);
    float _1020 = fma(_988, _990, _994);
    float _1022 = fma(_1008, _904, _984);
    float _1024 = fma(_964, _904, _1016);
    float _1026 = fma(_1012, _920, _1018);
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1030 = fma(_1020, _920, _1022);
    float _1032 = fma(_992, _920, _1024);
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1036 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = in.m_65.x;
    float _1040 = in.m_65.y;
    float _1042 = in.m_65.z;
    float _1044 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1034);
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1050 = _936 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = fma(_1044, _948, -0.5);
    float _1056 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1046);
    float _1058 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1048);
    int _1060 = as_type<int>(_1048);
    if (_220)
    {
        float _1062 = -_514;
        float _1064 = _1062 + 1.0;
        _1060 = as_type<int>(_1064);
    }
    int _1066 = _1060;
    float _1068 = fma(_728, _1054, _724);
    float _1070 = _378 + _1056;
    float _1072 = _916 + _1058;
    float _1074 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1076 = _1070;
    float _1078 = _1072;
    float _1080 = _1068;
    if (_220)
    {
        float _1082 = _868 ? as_type<float>(_1066) : _514;
        _944 = _1082;
    }
    float _1084 = _944;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1088 = _1070 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1092 = _1072 + _1090;
    float _1094 = _936 * 6.283185482025146484375;
    float _1096 = cos(_1094);
    float _1098 = _1088 * _1088;
    float _1100 = _1092 * _1092;
    float _1102 = fma(_1074, _1084, -0.5);
    float _1104 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1106 = _1052 * _558;
    float _1108 = _1098 + _1100;
    float _1110 = _1040;
    float _1112 = _1038;
    float _1114 = _1042;
    float _1116 = _1098;
    float _1118 = _1100;
    if (!_974)
    {
        float _1120 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1040);
        _1110 = _1120;
    }
    float _1122 = _1110;
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1104);
    if (!_974)
    {
        float _1126 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1112 = _1126;
    }
    float _1128 = _1112;
    float _1130 = sqrt(_1108);
    float _1132 = -_1122;
    float _1134 = _988 * _1132;
    float _1136 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1124);
    float _1138 = _996 * _1122;
    float _1140 = _982 * _1122;
    float _1142 = _1096 * _558;
    float _1144 = _1136 * _1136;
    float _1146 = fma(_964, _1128, _1134);
    float _1148 = _1146;
    if (!_974)
    {
        float _1150 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1042);
        _1114 = _1150;
    }
    float _1152 = _1114;
    float _1154 = -_1106;
    float _1156 = fma(_1096, _1102, _1154);
    float _1158 = fma(_1056, _1056, _1144);
    float _1160 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = fma(_1052, _1102, _1142);
    float _1164 = fma(_1004, _1128, _1138);
    float _1166 = fma(_1058, _1058, _1158);
    float _1168 = _1160 + _1136;
    bool _1170 = _1130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = fma(_1008, _1128, _1140);
    float _1174 = fma(_992, _1152, _1146);
    float _1176 = -_1166;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[194].w, _1168);
    float _1180 = fma(_732, _1156, _736);
    float _1182 = -_740;
    float _1184 = fma(_738, _1162, _1182);
    float _1186 = fma(_1012, _1152, _1164);
    float _1188 = fma(_1020, _1152, _1172);
    if (!_1170)
    {
        _1148 = _1178;
    }
    float _1190 = _1148;
    bool _1192 = !_1170;
    float _1194 = _1190;
    if (!_1192)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1130 + _1198;
        float _1202 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = rsqrt(_1108);
        float _1206 = _1200 * _1196;
        float _1208 = _1206 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = fma(_1212, _1202, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1204 * _1218;
        float _1222 = _1216 + (-1.0);
        float _1224 = fma(_1088, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1226 = fma(_1092, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1228 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1232 = _1224 + _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1236 = _1226 + _1234;
        float _1238 = fma(_1178, _1216, _1228);
        float _1240 = _1232 * _1232;
        float _1242 = _1236 * _1236;
        _1194 = _1238;
        _1116 = _1240;
        _1118 = _1242;
        _1076 = _1224;
        _1078 = _1226;
    }
    float _1244 = _1194;
    float _1246 = _1116;
    float _1248 = _1118;
    float _1250 = _1076;
    float _1252 = _1078;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1256 = _1244 + _1254;
    float _1258 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1262 = fma(_1256, _1256, _1246);
    float _1264 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1266 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1260);
    float _1268 = _1262 + _1248;
    float _1270 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1274 = sqrt(_1268);
    float _1276 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1270);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1266);
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1294 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _942 + 0.5;
    float _1308 = _1068 + 0.5;
    float _1310 = _1180 + 0.5;
    float _1312 = _1184 + 0.5;
    float _1314 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1316 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1276);
    out.m_67.x = _1294;
    out.m_67.y = _1296;
    out.m_67.z = _1298;
    out.m_67.w = _1290;
    bool _1318 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1320 = isnan(_1274);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1326 = _1322 || _1324;
    out.m_69.x = _1300;
    out.m_69.y = _1302;
    out.m_69.z = _1304;
    out.m_69.w = _1292;
    out.m_71.x = _414;
    out.m_73.x = _1308;
    out.m_73.y = _1306;
    out.m_73.z = _1310;
    out.m_73.w = _1312;
    float _1328 = _1300;
    float _1330 = _1304;
    if (!_1326)
    {
        _1080 = 1.0;
    }
    float _1332 = _1080;
    out.m_75.x = _1314;
    out.m_75.y = _1288;
    out.m_75.z = _1316;
    bool _1334 = !_1326;
    float _1336 = _1332;
    if (!_1334)
    {
        bool _1338 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1340 = isnan(_1274);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1346 = _1342 || _1344;
        if (!_1346)
        {
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = _1274 + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1354 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1352;
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1360 = 1.0 / _1354;
            float _1362 = _1350 * _1360;
            float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1336 = _1364;
            _1366 = true;
        }
        else
        {
            bool _1368 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1370 = isnan(_1274);
            bool _1372 = _1368 || _1370;
            bool _1374 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1376 = _1372 || _1374;
            if (!_1376)
            {
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1274 + _1378;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1388 = _1386 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1390 = 1.0 / _1384;
                float _1392 = _1380 * _1390;
                float _1394 = fma(_1392, _1388, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1336 = _1394;
                _1366 = true;
            }
            else
            {
                _1336 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1366 = false;
    float _1396 = _1336;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1400 = _1244 + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1404 = _1250 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1408 = _1252 + _1406;
    float _1410 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1412 = fma(_1404, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1414 = fma(_1408, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1410 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1422 = _1412 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1426 = _1414 + _1424;
    float _1428 = _1418 * _1418;
    float _1430 = fma(_1422, _1422, _1428);
    float _1432 = fma(_1426, _1426, _1430);
    float _1434 = rsqrt(_1432);
    float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1438 = _1422 * _1436;
    float _1440 = _1426 * _1436;
    float _1442 = _1438 * _1438;
    float _1444 = _1440 * _1440;
    float _1446 = _1442 + _1444;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1448 + _1452;
    float _1456 = _1434;
    float _1458 = _1454;
    float _1460 = _1418;
    if (_1450)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1462;
    }
    float _1464 = _1456;
    if (_1450)
    {
        float _1466 = rsqrt(_1446);
        _1328 = _1466;
    }
    float _1468 = _1328;
    if (_1450)
    {
        float _1470 = _1454 * _1464;
        _1458 = _1470;
    }
    float _1472 = _1458;
    if (_1450)
    {
        float _1474 = _1472 * 0.15915493667125701904296875;
        _1330 = _1474;
    }
    float _1476 = _1330;
    float _1478 = _942;
    float _1480 = _1476;
    if (_1450)
    {
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1478 = _1484;
    }
    float _1486 = _1478;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1426;
    float _1494 = _1490;
    float _1496 = _1488;
    if (_1450)
    {
        float _1498 = _1476 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1492 = _1500;
    }
    float _1502 = _1492;
    float _1504 = -_1436;
    float _1506 = -_1490;
    float _1508 = fma(_1418, _1504, _1506);
    float _1510 = _1508;
    if (!_1450)
    {
        _1460 = _1444;
    }
    float _1512 = _1460;
    float _1514 = _1512;
    if (_1450)
    {
        float _1516 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1516;
    }
    float _1518 = _1494;
    float _1520 = _1518;
    if (!_1450)
    {
        _1480 = _1438;
    }
    float _1522 = _1480;
    float _1524 = _1486;
    float _1526 = _1522;
    if (_1450)
    {
        float _1528 = fma(_1486, _1518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = _1530;
    if (_1450)
    {
        float _1534 = _1502 + (-1.0);
        _1496 = _1534;
    }
    float _1536 = _1496;
    if (_1450)
    {
        float _1538 = _1468 * _1530;
        _924 = _1538;
    }
    float _1540 = _924;
    if (!_1450)
    {
        _1532 = _1440;
    }
    float _1542 = _1532;
    float _1544 = _1542;
    if (_1450)
    {
        float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1546;
    }
    float _1548 = _1520;
    float _1550 = _1548;
    if (_1450)
    {
        float _1552 = _1438 * _1540;
        _1526 = _1552;
    }
    float _1554 = _1526;
    if (_1450)
    {
        float _1556 = _1440 * _1540;
        _1544 = _1556;
    }
    float _1558 = _1544;
    float _1560 = sqrt(_1432);
    if (_1450)
    {
        float _1562 = fma(_1508, _1502, _1548);
        _1510 = _1562;
    }
    float _1564 = _1510;
    if (!_1450)
    {
        _1550 = _1442;
    }
    float _1566 = _1550;
    float _1568 = _1566;
    if (_1450)
    {
        float _1570 = _1554 * _1554;
        _1568 = _1570;
    }
    float _1572 = _1568;
    if (_1450)
    {
        float _1574 = _1558 * _1558;
        _1514 = _1574;
    }
    float _1576 = _1514;
    float _1578 = fma(_1564, _1564, _1572);
    float _1580 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1582 = _1578 + _1576;
    float _1584 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1580);
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1588 = rsqrt(_1582);
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1592 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1590);
    float _1594 = precise::clamp(_1592, 0.0, 1.0);
    float _1596 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1584);
    float _1598 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1600 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1602 = -_1594;
    float _1604 = _1602 + 1.0;
    float _1606 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1608 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1610 = floor(_1598);
    float _1612 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1614 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1616 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    float _1618 = -_1614;
    float _1620 = fma(_1618, _1586, 1.0);
    float _1622 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1624 = abs(_1604);
    float _1626 = log2(_1624);
    float _1628 = _1588 * _1554;
    float _1630 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1632 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1622);
    float _1634 = _1588 * _1564;
    float _1636 = _1588 * _1558;
    float _1638 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1600);
    float _1640 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1642 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1644 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = floor(_1608);
    float _1648 = -_1640;
    float _1650 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1648);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1656 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1638);
    float _1658 = -_1636;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1650);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1654);
    float _1666 = log2(_1620);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = fma(_1660, 0.5, 0.5);
    float _1672 = -_1610;
    float _1674 = _1598 + _1672;
    float _1676 = exp2(_1662);
    float _1678 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1680 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1682 = -_1646;
    float _1684 = _1608 + _1682;
    float _1686 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1690 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1692 = sqrt(_1668);
    float _1694 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1686);
    float _1696 = fma(_1670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1698 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1700 = _1634 + 1.0;
    float _1702 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1694);
    float _1704 = fma(_1670, _1696, -0.212114393711090087890625);
    float _1706 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1698);
    float _1708 = 1.0 / _1688;
    float _1710 = -_1634;
    float _1712 = fma(_1676, _1700, _1710);
    float _1714 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1702);
    float _1716 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1706);
    float _1718 = fma(_1670, _1704, 1.570728778839111328125);
    float _1720 = _1666 * 0.693147182464599609375;
    float2 _4945 = float2(_1684, _1674);
    float _1722 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4945, float2(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4945, float2(0.0), isnan(_4945)), level(0.0)).x;
    float _1724 = fma(_1712, 0.5, 0.5);
    float _1726 = _1692 * 0.636619746685028076171875;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1730 = -_1718;
    float _1732 = fma(_1726, _1730, 1.0);
    float _1734 = _1714 * _1708;
    float _1736 = _1716 * _1708;
    float _1738 = fma(_1734, 0.5, 0.5);
    float _1740 = fma(_1736, -0.5, 0.5);
    float3 _4980 = float3(_1738, _1740, _1728);
    float _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4980, float3(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4980, float3(0.0), isnan(_4980)), level(0.0)).x;
    float3 _4991 = float3(_1738, _1740, _1728);
    float4 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4991, float3(0.0), isnan(_4991)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4991, float3(0.0), isnan(_4991)), level(0.0)).xyzw;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = _1745.w;
    float2 _5007 = float2(_1732, _1724);
    float3 _1757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5007, float2(0.0), isnan(_5007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5007, float2(0.0), isnan(_5007)), level(0.0)).xyz;
    float _1759 = _1757.x;
    float _1761 = _1757.y;
    float _1763 = _1757.z;
    float _1765 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _1412;
    out.m_77.y = _1410;
    out.m_77.z = _1414;
    bool _1769 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1771 = isnan(_1560);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1777 = _1773 || _1775;
    float _1779 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1781 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1767);
    float _1785 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1779);
    float _1787 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1789 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1783);
    float _1791 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1793 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1787);
    float _1795 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1789);
    float _1797 = 1.0 / _1791;
    float _1799 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1801 = _1799 + _1791;
    float _1803 = _1801 * _1797;
    float _1805 = _1803 * 0.5;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1809 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1807);
    float _1811 = 1.0 / _1809;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1815 = _1811 * _1813;
    float _1817 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1819 = abs(_1815);
    float _1821 = log2(_1819);
    bool _1823 = _1815 <= 8000.0;
    bool _1825 = isnan(_1815);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan(8000.0);
    bool _1831 = _1827 || _1829;
    float _1833 = float(_1831);
    float _1835 = exp2(_1817);
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1716;
    out.gl_Position.z = _1795;
    out.gl_Position.w = _1688;
    float _1837 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1839 = exp2(_1837);
    float _1841 = -_1835;
    float _1843 = _1841 + 1.0;
    float _1845 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1847 = -_1845;
    float _1849 = _1847 + 1.0;
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1853 = precise::clamp(_1851, 0.0, 1.0);
    float _1855 = _1795 + _1688;
    float _1857 = _1795;
    float _1859 = _1849;
    float _1861 = _1845;
    if (!_1777)
    {
        _1857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1863 = _1857;
    float _1865 = fma(_1853, -2.0, 3.0);
    float _1867 = _1853 * _1853;
    float _1869 = _1867 * _1865;
    float _1871 = in.m_79.x;
    float _1873 = -_1869;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1869);
    float _1879 = _1855 * 0.5;
    float _1881 = _1833 * _1877;
    out.m_81.z = _1879;
    out.m_81.w = _1688;
    float _1883 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1885 = -_1722;
    float _1887 = _1885 + 1.0;
    float _1889 = _1887 * _1883;
    float _1891 = precise::clamp(_1889, 0.0, 1.0);
    float _1893 = -_1891;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1897 = _1895 * _1871;
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1901 = _1897;
    float _1903 = _1751;
    float _1905 = _1863;
    float _1907 = _1863;
    if (!_1777)
    {
        _1901 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1909 = _1901;
    float _1911 = _1845 * _1742;
    float _1913 = _1753 * _1849;
    out.m_83.x = _1899;
    float _1915 = _1909;
    float _1917 = _1909;
    if (!_1777)
    {
        _1859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1919 = _1859;
    float _1921 = _1753 * _1911;
    float _1923 = _1763 * _1911;
    float _1925 = _1921;
    float _1927 = _1919;
    float _1929 = _1919;
    if (!_1777)
    {
        _1861 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1931 = _1861;
    float _1933 = fma(_1759, _1921, _1747);
    float _1935 = fma(_1761, _1921, _1749);
    float _1937 = fma(_1753, _1923, _1751);
    float _1939 = _1931;
    float _1941 = _1931;
    if (!_1777)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1943 = _1903;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1777)
    {
        _1925 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1949 = _1925;
    out.m_85.x = _1933;
    out.m_85.y = _1935;
    out.m_85.z = _1937;
    out.m_85.w = _1913;
    bool _1951 = !_1777;
    float _1953 = _1949;
    float _1955 = _1949;
    if (!_1951)
    {
        bool _1957 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1959 = isnan(_1560);
        bool _1961 = _1957 || _1959;
        bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1965 = _1961 || _1963;
        if (!_1965)
        {
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1969 = _1560 + _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1971;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1979 = 1.0 / _1973;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1997 = _1969 * _1979;
            float _1999 = precise::clamp(_1997, 0.0, 1.0);
            float _2001 = fma(_1999, _1977, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2003 = fma(_1999, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2009 = fma(_1999, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2011 = fma(_1999, _1991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2013 = fma(_1999, _1995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2015 = fma(_1999, _2007, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1907 = _2003;
            _1917 = _2011;
            _1947 = _2001;
            _1941 = _2009;
            _1929 = _2015;
            _1955 = _2013;
            _2017 = true;
        }
        else
        {
            bool _2019 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2021 = isnan(_1560);
            bool _2023 = _2019 || _2021;
            bool _2025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2027 = _2023 || _2025;
            if (!_2027)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2029 = _1945;
            _1947 = _2029;
            if (!_2027)
            {
                _1905 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2031 = _1905;
            _1907 = _2031;
            if (!_2027)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2033 = _1927;
            _1929 = _2033;
            if (!_2027)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2035 = _1939;
            _1941 = _2035;
            if (!_2027)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2037 = _1915;
            _1917 = _2037;
            if (!_2027)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2039 = _1953;
            bool _2041 = !_2027;
            _1955 = _2039;
            if (!_2041)
            {
                bool _2043 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2045 = isnan(_1560);
                bool _2047 = _2043 || _2045;
                bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2051 = _2047 || _2049;
                if (!_2051)
                {
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2055 = _1560 + _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2057;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2065 = 1.0 / _2059;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2083 = _2055 * _2065;
                    float _2085 = precise::clamp(_2083, 0.0, 1.0);
                    float _2087 = fma(_2085, _2063, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2089 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2095 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2097 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2099 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2101 = fma(_2085, _2093, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1907 = _2089;
                    _1917 = _2097;
                    _1947 = _2087;
                    _1941 = _2095;
                    _1929 = _2101;
                    _1955 = _2099;
                    _2017 = true;
                }
                else
                {
                    _1907 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2017 = false;
    float _2103 = _1907;
    float _2105 = _1917;
    float _2107 = _1947;
    float _2109 = _1941;
    float _2111 = _1929;
    float _2113 = _1955;
    float _2115 = fma(_1288, -0.5, 0.5);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    float _2123 = -_2107;
    float _2125 = _2123 + _2109;
    float _2127 = -_2111;
    float _2129 = _2127 + _2113;
    bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = fma(_2117, _2121, _2103);
    float _2135 = fma(_2117, _2125, _2107);
    float _2137 = fma(_2117, _2129, _2111);
    float _2139 = _2133 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2141 = fma(_2135, 0.298911988735198974609375, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = fma(_2137, 0.114477999508380889892578125, _2141);
    out.m_83.w = _2143;
    float _2147 = -_2145;
    float _2149 = _2135 + _2147;
    float _2151 = -_2145;
    float _2153 = _2133 + _2151;
    float _2155 = -_2145;
    float _2157 = _2137 + _2155;
    out.m_87.x = 0.0;
    float _2159 = fma(_2149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    float _2161 = fma(_2153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    float _2163 = fma(_2157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    out.m_89.x = _2159;
    out.m_89.y = _2161;
    out.m_89.z = _2163;
    if (!_2131)
    {
        return out;
    }
    float _2165 = -_1410;
    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2169 = -_1412;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2173 = -_1414;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2177 = _2167 * _2167;
    float _2179 = fma(_2171, _2171, _2177);
    float _2181 = fma(_2175, _2175, _2179);
    float _2183 = sqrt(_2181);
    float _2185 = rsqrt(_2181);
    float _2187 = -_2183;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2171 * _2185;
    float _2197 = _2167 * _2185;
    float _2199 = abs(_2193);
    float _2201 = log2(_2199);
    float _2203 = _2175 * _2185;
    float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2207 = _1288 * _2197;
    float _2209 = -_2197;
    float _2211 = -_2205;
    float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
    float _2215 = fma(_1314, _2195, _2207);
    float _2217 = -_2203;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
    float _2221 = fma(_1316, _2203, _2215);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2227 = _2219 + _2225;
    float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = exp2(_2229);
    float _2237 = _2235 * _2233;
    float _2239 = _2223 * _2237;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2241;
    out.m_87.y = _2243;
    out.m_87.z = _2245;
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
    out.m_89 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_71 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_73 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_87 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2017 = false;
    bool _1366 = false;
    bool _186 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_48.w;
    float _105 = trunc(_103);
    int _108 = int(_105);
    bool _112 = _108 >= 1;
    float _114 = 0.0;
    if (!_112)
    {
        _114 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _116 = _114;
    float _118 = _116;
    if (!_112)
    {
        out.m_51.x = 0.0;
    }
    int _120 = 0;
    if (!_112)
    {
        float _122 = _116 * 5.0;
        _120 = as_type<int>(_122);
    }
    int _124 = _120;
    int _126 = _124;
    if (!_112)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2302 = as_type<float>(_124);
        out.gl_Position.z = _2302;
    }
    if (!_112)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _128 = in.m_53.w;
    bool _130 = _128 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _132 = isnan(_128);
    bool _134 = _130 || _132;
    bool _136 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _138 = _134 || _136;
    float _140 = -_128;
    float _142 = _140 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _144 = _142;
    if (_138)
    {
        float _146 = float(_108);
        _118 = _146;
    }
    float _148 = _118;
    bool _150 = _142 >= _148;
    bool _152 = !_138;
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
    if (_154)
    {
        float _160 = _158 * 5.0;
        _126 = as_type<int>(_160);
    }
    int _162 = _126;
    if (_154)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2372 = as_type<float>(_162);
        out.gl_Position.z = _2372;
    }
    if (_154)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _164 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _166 = !_164;
    float _184;
    if (!_166)
    {
        float _168 = in.m_55.x;
        float _170 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _172 = _168 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _174 = fma(_172, (*spvDescriptorSet0.vp_c9)._m0[12].x, _142);
        float _176 = _174 * _170;
        float _178 = floor(_176);
        float _180 = -_178;
        float _182 = _176 + _180;
        _184 = _182;
        _186 = true;
    }
    else
    {
        float _188 = float(_108);
        float _190 = 1.0 / _188;
        float _192 = _142 * _190;
        _184 = _192;
    }
    _186 = false;
    float _194 = _184;
    float _196 = in.m_57.y;
    float _198 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _200 = _194 + _198;
    float _202 = in.m_55.w;
    int _204 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _206 = _204 != 0;
    float _208 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _210 = _194 + _208;
    int _212 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _214 = _212 != 0;
    float _216 = in.m_55.y;
    int _218 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _220 = _218 != 0;
    float _222 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _224 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _226 = _224 != 0;
    float _228 = in.m_55.x;
    float _230 = in.m_55.z;
    int _232 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _234 = _232 != 0;
    float _236 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _238 = log2(_236);
    float _240 = in.m_48.x;
    float _242 = in.m_48.y;
    float _244 = in.m_48.z;
    float _246 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _248 = -_196;
    float _250 = _248 + 1.0;
    float _252 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _254 = in.m_57.x;
    bool _256 = _202 > 0.5;
    float _258 = _216 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _260 = _256 ? as_type<int>(_250) : as_type<int>(_196);
    bool _262 = _216 > 0.5;
    float _264 = _228 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _266 = _226 ? as_type<float>(_260) : _196;
    float _268 = _228 * 2.0;
    float _270 = _196;
    if (_206)
    {
        float _272 = _262 ? _250 : _196;
        _270 = _272;
    }
    float _274 = _270;
    float _276 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _278 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _276;
    int _280 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _282 = _280 != 0;
    int _284 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _286 = _284 != 0;
    int _288 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _290 = _288 != 0;
    float _292 = -_246;
    float _294 = fma(_264, 2.0, _292);
    float _296 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _298 = _296 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _300 = 1.0 / _278;
    float _302 = 0.0;
    bool _304 = _262;
    if (!_234)
    {
        _302 = _230;
    }
    float _306 = _302;
    float _308 = fma(_258, -2.0, _252);
    float _310 = _242 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _312 = _242 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _314 = _242 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _316 = _216 * 2.0;
    float _318 = 0.0;
    float _320 = _242;
    float _322 = _306;
    if (!_234)
    {
        _318 = _216;
    }
    float _324 = _318;
    float _326 = floor(_268);
    float _328 = in.m_59.x;
    float _330 = in.m_59.y;
    float _332 = in.m_59.z;
    float _334 = 0.0;
    float _336 = _324;
    if (!_234)
    {
        _334 = _216;
    }
    float _338 = _334;
    float _340 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[5].x, _312);
    float _342 = 0.0;
    float _344 = _338;
    if (!_234)
    {
        _342 = _228;
    }
    float _346 = _342;
    float _348 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[4].x, _310);
    float _350 = _346;
    if (!_234)
    {
        _320 = _306;
    }
    float _352 = _320;
    float _354 = fma(_240, (*spvDescriptorSet0.vp_c10)._m0[6].x, _314);
    float _356 = 1.0 / _298;
    float _358 = _352;
    if (_234)
    {
        _336 = _228;
    }
    float _360 = _336;
    float _362 = _200 * _300;
    if (_234)
    {
        _344 = _228;
    }
    float _364 = _344;
    float _366 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[4].z, _348);
    if (_234)
    {
        _350 = _230;
    }
    float _368 = _350;
    float _370 = _360 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    if (_234)
    {
        _358 = _216;
    }
    float _372 = _358;
    float _374 = floor(_316);
    if (_234)
    {
        _322 = _216;
    }
    float _376 = _322;
    float _378 = _366 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _380 = _326 >= 0.0;
    bool _382 = isnan(_326);
    bool _384 = _380 || _382;
    bool _386 = isnan(0.0);
    bool _388 = _384 || _386;
    int _390 = _388 ? 0 : 1;
    float _392 = _210 * _356;
    float _394 = abs(_330);
    float _396 = _394 + 0.001000000047497451305389404296875;
    bool _398 = _326 > 0.0;
    float _400 = _330 * _330;
    float _402 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[193].x, 1.0);
    float _404 = _396 * (*spvDescriptorSet0.vp_c9)._m0[194].x;
    float _406 = fma(_328, _328, _400);
    float _408 = _402 * _328;
    float _410 = _228 + _216;
    float _412 = -_404;
    float _414 = fma((*spvDescriptorSet0.vp_c10)._m0[2].x, (*spvDescriptorSet0.vp_c9)._m0[194].y, _412);
    float _416 = fma(_396, (*spvDescriptorSet0.vp_c9)._m0[193].y, 1.0);
    int _418 = ~_390;
    int _420 = _418 + 1;
    int _422 = _420 + 1;
    float _424 = _410 + (-1.0);
    int _426 = _422;
    if (!_398)
    {
        int _428 = ~_390;
        int _430 = _428 + 1;
        _426 = _430;
    }
    int _432 = _426;
    float _434 = fma(_332, _332, _406);
    bool _436 = _374 >= 0.0;
    bool _438 = isnan(_374);
    bool _440 = _436 || _438;
    bool _442 = isnan(0.0);
    bool _444 = _440 || _442;
    float _446 = _416 * _332;
    float _448 = fma(_424, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _450 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[5].z, _340);
    float _452 = fma(_244, (*spvDescriptorSet0.vp_c10)._m0[6].z, _354);
    int _454 = _444 ? 0 : 1;
    float _456 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _458 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _456;
    float _460 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _462 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _460;
    bool _464 = _374 > 0.0;
    float _466 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _468 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _466;
    float _470 = _374;
    float _472 = _468;
    if (!_214)
    {
        _470 = _254;
    }
    float _474 = _470;
    float _476 = fma(_458, _362, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _478 = fma(_462, _362, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _480 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _482 = isnan(_194);
    bool _484 = _480 || _482;
    bool _486 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _488 = _484 || _486;
    float _490 = float(_488);
    float _492 = fma(_468, _362, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _494 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _496 = _494 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _498 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _500 = _498 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _502 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _504 = _502 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _506 = _474;
    if (!_214)
    {
        _472 = _474;
    }
    float _508 = _472;
    float _510 = fma(_496, _392, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _512 = _508;
    if (_214)
    {
        _506 = _254;
    }
    float _514 = _506;
    float _516 = fma(_500, _392, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _518 = -_490;
    float _520 = _518 + 1.0;
    bool _522 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _524 = isnan(_194);
    bool _526 = _522 || _524;
    bool _528 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _530 = _526 || _528;
    float _532 = float(_530);
    float _534 = fma(_504, _392, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _536 = _194 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _538 = isnan(_194);
    bool _540 = _536 || _538;
    bool _542 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _544 = _540 || _542;
    float _546 = float(_544);
    float _548 = _222 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _550 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _552 = _532 * _520;
    float _554 = -_532;
    float _556 = _554 + 1.0;
    float _558 = fma(_266, _548, -0.5);
    float _560 = fma(_364, (*spvDescriptorSet0.vp_c9)._m0[83].z, _550);
    float _562 = _546 * _556;
    float _564 = -_546;
    float _566 = _564 + 1.0;
    float _568 = sqrt(_434);
    float _570 = _476 * _562;
    float _572 = (*spvDescriptorSet0.vp_c9)._m0[84].z + (*spvDescriptorSet0.vp_c9)._m0[84].y;
    float _574 = _478 * _562;
    float _576 = _492 * _562;
    float _578 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].x, _570);
    float _580 = fma(_368, (*spvDescriptorSet0.vp_c9)._m0[84].z, _572);
    float _582 = _230 * 2.0;
    float _584 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].y, _574);
    float _586 = fma(_566, (*spvDescriptorSet0.vp_c9)._m0[143].z, _576);
    float _588 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _590 = _372 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _592 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _594 = floor(_582);
    bool _596 = !_286;
    int _598 = _596 ? 0 : 1;
    float _600 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _602 = fma(_376, (*spvDescriptorSet0.vp_c9)._m0[83].w, _592);
    bool _604 = !_290;
    int _606 = _604 ? 0 : 1;
    float _608 = _238 * _142;
    int _610 = abs(_598);
    float _612 = -_600;
    float _614 = fma(_370, 2.0, _612);
    float _616 = _216 + _230;
    int _618 = ~_454;
    int _620 = _618 + 1;
    int _622 = _620 + 1;
    float _624 = fma(_590, -2.0, _588);
    int _626 = _622;
    if (!_464)
    {
        int _628 = ~_454;
        int _630 = _628 + 1;
        _626 = _630;
    }
    int _632 = _626;
    float _634 = _616 + (-1.0);
    int _636 = abs(_606);
    float _638 = exp2(_608);
    float _640 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[84].x, _580);
    float _642 = _414 * 0.01745329238474369049072265625;
    float _644 = float(_636);
    float _646 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _648 = 1.0 + _646;
    float _650 = float(_632);
    float _652 = fma(_634, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _654 = float(_432);
    float _656 = abs(_396);
    float _658 = log2(_656);
    bool _660 = _594 > 0.0;
    float _662 = in.m_61.x;
    float _664 = in.m_61.y;
    float _666 = in.m_61.z;
    bool _668 = _594 >= 0.0;
    bool _670 = isnan(_594);
    bool _672 = _668 || _670;
    bool _674 = isnan(0.0);
    bool _676 = _672 || _674;
    float _678 = _644 * _650;
    float _680 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[76].y, _308);
    float _682 = 1.0 / _648;
    float _684 = float(_610);
    float _686 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    int _688 = _676 ? 0 : 1;
    float _690 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _692 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _694 = isnan(1.0);
    bool _696 = _692 || _694;
    bool _698 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _700 = _696 || _698;
    float _702 = _684 * _654;
    float _704 = fma(_228, (*spvDescriptorSet0.vp_c9)._m0[78].z, _686);
    float _706 = fma(_216, (*spvDescriptorSet0.vp_c9)._m0[78].w, _690);
    float _708 = -_638;
    float _710 = _708 + 1.0;
    bool _712 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _714 = isnan(0.0);
    bool _716 = _712 || _714;
    bool _718 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _720 = _716 || _718;
    float _722 = -_142;
    float _724 = fma(_722, (*spvDescriptorSet0.vp_c9)._m0[76].x, _294);
    float _726 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].w, _706);
    float _728 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[77].z, _704);
    float _730 = _720 ? _710 : 0.0;
    float _732 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].z, _560);
    float _734 = -_142;
    float _736 = fma(_734, (*spvDescriptorSet0.vp_c9)._m0[81].x, _614);
    float _738 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[82].w, _602);
    float _740 = fma(_142, (*spvDescriptorSet0.vp_c9)._m0[81].y, _624);
    float _742 = _702 * (-2.0);
    bool _744 = _660;
    if (_700)
    {
        float _746 = _730 * _682;
        _144 = _746;
    }
    float _748 = _144;
    bool _750 = !_282;
    int _752 = _750 ? 0 : 1;
    float _754 = _216 + (-0.5);
    float _756 = fma(_742, _664, _664);
    int _758 = ~_688;
    int _760 = _758 + 1;
    int _762 = _760 + 1;
    float _764 = abs(_568);
    float _766 = log2(_764);
    int _768 = _762;
    if (!_660)
    {
        int _770 = ~_688;
        int _772 = _770 + 1;
        _768 = _772;
    }
    int _774 = _768;
    float _776 = fma(_754, (*spvDescriptorSet0.vp_c9)._m0[196].y, _756);
    int _778 = abs(_752);
    float _780 = fma(_652, _742, _652);
    float _782 = _228 + _230;
    float _784 = float(_774);
    float _786 = _642 * 0.15915493667125701904296875;
    float _788 = float(_778);
    float _790 = _782 + (-1.0);
    float _792 = fma(_780, _748, _776);
    float _794 = _678 * (-2.0);
    float _796 = _788 * _784;
    float _798 = _658 * 0.5;
    float _800 = fma(_790, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _802 = _230 + (-0.5);
    float _804 = fma(_794, _666, _666);
    float _806 = _796 * (-2.0);
    float _808 = _786 * 6.283185482025146484375;
    float _810 = sin(_808);
    float _812 = fma(_800, _794, _800);
    float _814 = _766 * 1.5;
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[196].z, _804);
    float _818 = fma(_806, _662, _662);
    float _820 = (*spvDescriptorSet0.vp_c9)._m0[198].z;
    if (_214)
    {
        bool _822 = _228 > 0.5;
        _744 = _822;
    }
    bool _824 = _744;
    float _826 = in.m_63.x;
    float _828 = in.m_63.y;
    float _830 = in.m_63.z;
    float _832 = _228 + (-0.5);
    float _834 = exp2(_798);
    float _836 = fma(_448, _806, _448);
    float _838 = fma(_832, (*spvDescriptorSet0.vp_c9)._m0[196].x, _818);
    float _840 = fma(_812, _748, _816);
    float _842 = fma(_510, _552, _578);
    float _844 = fma(_836, _748, _838);
    float _846 = exp2(_814);
    float _848 = fma(_810, 0.5, 0.5);
    float _850 = fma(_534, _552, _586);
    float _852 = _792 * 0.15915493667125701904296875;
    float _854 = _840 * 0.15915493667125701904296875;
    float _856 = _844 * 0.15915493667125701904296875;
    float _858 = (*spvDescriptorSet0.vp_c7)._m0[0].x * (*spvDescriptorSet0.vp_c9)._m0[193].z;
    float _860 = _834 * _848;
    float _862 = fma(_516, _552, _584);
    float _864 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].x, _842);
    if (_220)
    {
        bool _866 = _230 > 0.5;
        _304 = _866;
    }
    bool _868 = _304;
    float _870 = fma(_860, (*spvDescriptorSet0.vp_c9)._m0[193].w, 1.0);
    float _872 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _874 = _864 * _826;
    float _876 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].y, _862);
    float _878 = _858 * _846;
    float _880 = _870 * _446;
    float _882 = fma(_490, (*spvDescriptorSet0.vp_c9)._m0[145].z, _850);
    float _884 = _876 * _828;
    float _886 = fma(_408, _870, _878);
    float _888 = _852 * 6.283185482025146484375;
    float _890 = cos(_888);
    float _892 = _874 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _894 = _882 * _830;
    float _896 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _886);
    float _898 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _330);
    float _900 = _884 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _902 = _894 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _904 = _892 * _896;
    float _906 = _854 * 6.283185482025146484375;
    float _908 = cos(_906);
    float _910 = _872 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _912 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _880);
    float _914 = _900 * _898;
    float _916 = _452 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _918 = fma(_910, _274, -0.5);
    float _920 = _902 * _912;
    int _922 = as_type<int>(_900);
    float _924 = _880;
    if (_214)
    {
        float _926 = -_514;
        float _928 = _926 + 1.0;
        _922 = as_type<int>(_928);
    }
    int _930 = _922;
    float _932 = _856 * 6.283185482025146484375;
    float _934 = sin(_932);
    float _936 = _640 * (-0.15915493667125701904296875);
    if (!_220)
    {
        _820 = _514;
    }
    float _938 = _820;
    float _940 = -_680;
    float _942 = fma(_726, _918, _940);
    float _944 = _938;
    if (_214)
    {
        float _946 = _824 ? as_type<float>(_930) : _514;
        _512 = _946;
    }
    float _948 = _512;
    bool _950 = _330 != 0.0;
    bool _952 = isnan(_330);
    bool _954 = _950 || _952;
    bool _956 = isnan(0.0);
    bool _958 = _954 || _956;
    float _960 = _852 * 6.283185482025146484375;
    float _962 = sin(_960);
    float _964 = _890 * _908;
    bool _966 = _886 == 0.0;
    bool _968 = !_958;
    bool _970 = _966 && _968;
    bool _972 = _880 == 0.0;
    bool _974 = _972 && _970;
    float _976 = _856 * 6.283185482025146484375;
    float _978 = cos(_976);
    float _980 = _934 * _890;
    float _982 = _934 * _908;
    float _984 = _982 * _914;
    float _986 = _854 * 6.283185482025146484375;
    float _988 = sin(_986);
    float _990 = _934 * _962;
    float _992 = _962 * _908;
    float _994 = _978 * _890;
    float _996 = _978 * _908;
    float _998 = _978 * _962;
    float _1000 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1002 = _996 * _914;
    float _1004 = fma(_988, _994, _990);
    float _1006 = -_998;
    float _1008 = fma(_988, _980, _1006);
    float _1010 = -_980;
    float _1012 = fma(_988, _998, _1010);
    float _1014 = -_914;
    float _1016 = _988 * _1014;
    float _1018 = fma(_1004, _904, _1002);
    float _1020 = fma(_988, _990, _994);
    float _1022 = fma(_1008, _904, _984);
    float _1024 = fma(_964, _904, _1016);
    float _1026 = fma(_1012, _920, _1018);
    float _1028 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1030 = fma(_1020, _920, _1022);
    float _1032 = fma(_992, _920, _1024);
    float _1034 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1036 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1038 = in.m_65.x;
    float _1040 = in.m_65.y;
    float _1042 = in.m_65.z;
    float _1044 = _1000 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1046 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1034);
    float _1048 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1036);
    float _1050 = _936 * 6.283185482025146484375;
    float _1052 = sin(_1050);
    float _1054 = fma(_1044, _948, -0.5);
    float _1056 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1046);
    float _1058 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1048);
    int _1060 = as_type<int>(_1048);
    if (_220)
    {
        float _1062 = -_514;
        float _1064 = _1062 + 1.0;
        _1060 = as_type<int>(_1064);
    }
    int _1066 = _1060;
    float _1068 = fma(_728, _1054, _724);
    float _1070 = _378 + _1056;
    float _1072 = _916 + _1058;
    float _1074 = _1028 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1076 = _1070;
    float _1078 = _1072;
    float _1080 = _1068;
    if (_220)
    {
        float _1082 = _868 ? as_type<float>(_1066) : _514;
        _944 = _1082;
    }
    float _1084 = _944;
    float _1086 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1088 = _1070 + _1086;
    float _1090 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1092 = _1072 + _1090;
    float _1094 = _936 * 6.283185482025146484375;
    float _1096 = cos(_1094);
    float _1098 = _1088 * _1088;
    float _1100 = _1092 * _1092;
    float _1102 = fma(_1074, _1084, -0.5);
    float _1104 = _1026 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1106 = _1052 * _558;
    float _1108 = _1098 + _1100;
    float _1110 = _1040;
    float _1112 = _1038;
    float _1114 = _1042;
    float _1116 = _1098;
    float _1118 = _1100;
    if (!_974)
    {
        float _1120 = fma(_330, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1040);
        _1110 = _1120;
    }
    float _1122 = _1110;
    float _1124 = fma(_1032, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1104);
    if (!_974)
    {
        float _1126 = fma(_886, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1038);
        _1112 = _1126;
    }
    float _1128 = _1112;
    float _1130 = sqrt(_1108);
    float _1132 = -_1122;
    float _1134 = _988 * _1132;
    float _1136 = fma(_1030, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1124);
    float _1138 = _996 * _1122;
    float _1140 = _982 * _1122;
    float _1142 = _1096 * _558;
    float _1144 = _1136 * _1136;
    float _1146 = fma(_964, _1128, _1134);
    float _1148 = _1146;
    if (!_974)
    {
        float _1150 = fma(_880, (*spvDescriptorSet0.vp_c9)._m0[17].y, _1042);
        _1114 = _1150;
    }
    float _1152 = _1114;
    float _1154 = -_1106;
    float _1156 = fma(_1096, _1102, _1154);
    float _1158 = fma(_1056, _1056, _1144);
    float _1160 = _450 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1162 = fma(_1052, _1102, _1142);
    float _1164 = fma(_1004, _1128, _1138);
    float _1166 = fma(_1058, _1058, _1158);
    float _1168 = _1160 + _1136;
    bool _1170 = _1130 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1172 = fma(_1008, _1128, _1140);
    float _1174 = fma(_992, _1152, _1146);
    float _1176 = -_1166;
    float _1178 = fma(_1176, (*spvDescriptorSet0.vp_c9)._m0[194].w, _1168);
    float _1180 = fma(_732, _1156, _736);
    float _1182 = -_740;
    float _1184 = fma(_738, _1162, _1182);
    float _1186 = fma(_1012, _1152, _1164);
    float _1188 = fma(_1020, _1152, _1172);
    if (!_1170)
    {
        _1148 = _1178;
    }
    float _1190 = _1148;
    bool _1192 = !_1170;
    float _1194 = _1190;
    if (!_1192)
    {
        float _1196 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1198 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1200 = _1130 + _1198;
        float _1202 = _1178 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1204 = rsqrt(_1108);
        float _1206 = _1200 * _1196;
        float _1208 = _1206 * 0.15915493667125701904296875;
        float _1210 = _1208 * 6.283185482025146484375;
        float _1212 = sin(_1210);
        float _1214 = _1208 * 6.283185482025146484375;
        float _1216 = cos(_1214);
        float _1218 = fma(_1212, _1202, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1220 = _1204 * _1218;
        float _1222 = _1216 + (-1.0);
        float _1224 = fma(_1088, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1226 = fma(_1092, _1220, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1228 = _1222 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1230 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1232 = _1224 + _1230;
        float _1234 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1236 = _1226 + _1234;
        float _1238 = fma(_1178, _1216, _1228);
        float _1240 = _1232 * _1232;
        float _1242 = _1236 * _1236;
        _1194 = _1238;
        _1116 = _1240;
        _1118 = _1242;
        _1076 = _1224;
        _1078 = _1226;
    }
    float _1244 = _1194;
    float _1246 = _1116;
    float _1248 = _1118;
    float _1250 = _1076;
    float _1252 = _1078;
    float _1254 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1256 = _1244 + _1254;
    float _1258 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1260 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1262 = fma(_1256, _1256, _1246);
    float _1264 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1258);
    float _1266 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1260);
    float _1268 = _1262 + _1248;
    float _1270 = _1186 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1272 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1274 = sqrt(_1268);
    float _1276 = fma(_1174, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1270);
    float _1278 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1282 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1284 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1286 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1288 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1266);
    float _1290 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1292 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1294 = _1272 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1296 = _1278 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1298 = _1280 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1300 = _1282 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1302 = _1284 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1304 = _1286 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1306 = _942 + 0.5;
    float _1308 = _1068 + 0.5;
    float _1310 = _1180 + 0.5;
    float _1312 = _1184 + 0.5;
    float _1314 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1264);
    float _1316 = fma(_1188, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1276);
    out.m_67.x = _1294;
    out.m_67.y = _1296;
    out.m_67.z = _1298;
    out.m_67.w = _1290;
    bool _1318 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1320 = isnan(_1274);
    bool _1322 = _1318 || _1320;
    bool _1324 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1326 = _1322 || _1324;
    out.m_69.x = _1300;
    out.m_69.y = _1302;
    out.m_69.z = _1304;
    out.m_69.w = _1292;
    out.m_71.x = _414;
    out.m_73.x = _1308;
    out.m_73.y = _1306;
    out.m_73.z = _1310;
    out.m_73.w = _1312;
    float _1328 = _1300;
    float _1330 = _1304;
    if (!_1326)
    {
        _1080 = 1.0;
    }
    float _1332 = _1080;
    out.m_75.x = _1314;
    out.m_75.y = _1288;
    out.m_75.z = _1316;
    bool _1334 = !_1326;
    float _1336 = _1332;
    if (!_1334)
    {
        bool _1338 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1340 = isnan(_1274);
        bool _1342 = _1338 || _1340;
        bool _1344 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1346 = _1342 || _1344;
        if (!_1346)
        {
            float _1348 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1350 = _1274 + _1348;
            float _1352 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1354 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1352;
            float _1356 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1358 = _1356 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1360 = 1.0 / _1354;
            float _1362 = _1350 * _1360;
            float _1364 = fma(_1362, _1358, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1336 = _1364;
            _1366 = true;
        }
        else
        {
            bool _1368 = _1274 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1370 = isnan(_1274);
            bool _1372 = _1368 || _1370;
            bool _1374 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1376 = _1372 || _1374;
            if (!_1376)
            {
                float _1378 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1380 = _1274 + _1378;
                float _1382 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1384 = _1382 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1386 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1388 = _1386 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1390 = 1.0 / _1384;
                float _1392 = _1380 * _1390;
                float _1394 = fma(_1392, _1388, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1336 = _1394;
                _1366 = true;
            }
            else
            {
                _1336 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1366 = false;
    float _1396 = _1336;
    float _1398 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1400 = _1244 + _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1404 = _1250 + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1408 = _1252 + _1406;
    float _1410 = fma(_1400, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1412 = fma(_1404, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1414 = fma(_1408, _1396, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1416 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1418 = _1410 + _1416;
    float _1420 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1422 = _1412 + _1420;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1426 = _1414 + _1424;
    float _1428 = _1418 * _1418;
    float _1430 = fma(_1422, _1422, _1428);
    float _1432 = fma(_1426, _1426, _1430);
    float _1434 = rsqrt(_1432);
    float _1436 = _1434 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1438 = _1422 * _1436;
    float _1440 = _1426 * _1436;
    float _1442 = _1438 * _1438;
    float _1444 = _1440 * _1440;
    float _1446 = _1442 + _1444;
    float _1448 = sqrt(_1446);
    bool _1450 = _1448 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1452 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1454 = _1448 + _1452;
    float _1456 = _1434;
    float _1458 = _1454;
    float _1460 = _1418;
    if (_1450)
    {
        float _1462 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1456 = _1462;
    }
    float _1464 = _1456;
    if (_1450)
    {
        float _1466 = rsqrt(_1446);
        _1328 = _1466;
    }
    float _1468 = _1328;
    if (_1450)
    {
        float _1470 = _1454 * _1464;
        _1458 = _1470;
    }
    float _1472 = _1458;
    if (_1450)
    {
        float _1474 = _1472 * 0.15915493667125701904296875;
        _1330 = _1474;
    }
    float _1476 = _1330;
    float _1478 = _942;
    float _1480 = _1476;
    if (_1450)
    {
        float _1482 = _1476 * 6.283185482025146484375;
        float _1484 = sin(_1482);
        _1478 = _1484;
    }
    float _1486 = _1478;
    float _1488 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1490 = precise::max(0.0, _1488);
    float _1492 = _1426;
    float _1494 = _1490;
    float _1496 = _1488;
    if (_1450)
    {
        float _1498 = _1476 * 6.283185482025146484375;
        float _1500 = cos(_1498);
        _1492 = _1500;
    }
    float _1502 = _1492;
    float _1504 = -_1436;
    float _1506 = -_1490;
    float _1508 = fma(_1418, _1504, _1506);
    float _1510 = _1508;
    if (!_1450)
    {
        _1460 = _1444;
    }
    float _1512 = _1460;
    float _1514 = _1512;
    if (_1450)
    {
        float _1516 = _1508 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1494 = _1516;
    }
    float _1518 = _1494;
    float _1520 = _1518;
    if (!_1450)
    {
        _1480 = _1438;
    }
    float _1522 = _1480;
    float _1524 = _1486;
    float _1526 = _1522;
    if (_1450)
    {
        float _1528 = fma(_1486, _1518, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1524 = _1528;
    }
    float _1530 = _1524;
    float _1532 = _1530;
    if (_1450)
    {
        float _1534 = _1502 + (-1.0);
        _1496 = _1534;
    }
    float _1536 = _1496;
    if (_1450)
    {
        float _1538 = _1468 * _1530;
        _924 = _1538;
    }
    float _1540 = _924;
    if (!_1450)
    {
        _1532 = _1440;
    }
    float _1542 = _1532;
    float _1544 = _1542;
    if (_1450)
    {
        float _1546 = _1536 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1520 = _1546;
    }
    float _1548 = _1520;
    float _1550 = _1548;
    if (_1450)
    {
        float _1552 = _1438 * _1540;
        _1526 = _1552;
    }
    float _1554 = _1526;
    if (_1450)
    {
        float _1556 = _1440 * _1540;
        _1544 = _1556;
    }
    float _1558 = _1544;
    float _1560 = sqrt(_1432);
    if (_1450)
    {
        float _1562 = fma(_1508, _1502, _1548);
        _1510 = _1562;
    }
    float _1564 = _1510;
    if (!_1450)
    {
        _1550 = _1442;
    }
    float _1566 = _1550;
    float _1568 = _1566;
    if (_1450)
    {
        float _1570 = _1554 * _1554;
        _1568 = _1570;
    }
    float _1572 = _1568;
    if (_1450)
    {
        float _1574 = _1558 * _1558;
        _1514 = _1574;
    }
    float _1576 = _1514;
    float _1578 = fma(_1564, _1564, _1572);
    float _1580 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1582 = _1578 + _1576;
    float _1584 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1580);
    float _1586 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1588 = rsqrt(_1582);
    float _1590 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1592 = fma(_1560, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1590);
    float _1594 = precise::clamp(_1592, 0.0, 1.0);
    float _1596 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1584);
    float _1598 = fma(_916, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1600 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1602 = -_1594;
    float _1604 = _1602 + 1.0;
    float _1606 = _1596 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1608 = fma(_378, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1610 = floor(_1598);
    float _1612 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1614 = _1606 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1616 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1612);
    float _1618 = -_1614;
    float _1620 = fma(_1618, _1586, 1.0);
    float _1622 = _1410 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1624 = abs(_1604);
    float _1626 = log2(_1624);
    float _1628 = _1588 * _1554;
    float _1630 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1616);
    float _1632 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1622);
    float _1634 = _1588 * _1564;
    float _1636 = _1588 * _1558;
    float _1638 = fma(_1412, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1600);
    float _1640 = _1628 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1642 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1632);
    float _1644 = _1630 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1646 = floor(_1608);
    float _1648 = -_1640;
    float _1650 = fma(_1634, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1648);
    float _1652 = _1642 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1654 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1656 = fma(_1414, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1638);
    float _1658 = -_1636;
    float _1660 = fma(_1658, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1650);
    float _1662 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1664 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1654);
    float _1666 = log2(_1620);
    float _1668 = fma(_1660, -0.5, 0.5);
    float _1670 = fma(_1660, 0.5, 0.5);
    float _1672 = -_1610;
    float _1674 = _1598 + _1672;
    float _1676 = exp2(_1662);
    float _1678 = _1656 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1680 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1664);
    float _1682 = -_1646;
    float _1684 = _1608 + _1682;
    float _1686 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1688 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1680);
    float _1690 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1692 = sqrt(_1668);
    float _1694 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1686);
    float _1696 = fma(_1670, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1698 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1690);
    float _1700 = _1634 + 1.0;
    float _1702 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1694);
    float _1704 = fma(_1670, _1696, -0.212114393711090087890625);
    float _1706 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1698);
    float _1708 = 1.0 / _1688;
    float _1710 = -_1634;
    float _1712 = fma(_1676, _1700, _1710);
    float _1714 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1702);
    float _1716 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1706);
    float _1718 = fma(_1670, _1704, 1.570728778839111328125);
    float _1720 = _1666 * 0.693147182464599609375;
    float2 _4945 = float2(_1684, _1674);
    float _1722 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_4945, float2(0.0), isnan(_4945)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_4945, float2(0.0), isnan(_4945)), level(0.0)).x;
    float _1724 = fma(_1712, 0.5, 0.5);
    float _1726 = _1692 * 0.636619746685028076171875;
    float _1728 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1730 = -_1718;
    float _1732 = fma(_1726, _1730, 1.0);
    float _1734 = _1714 * _1708;
    float _1736 = _1716 * _1708;
    float _1738 = fma(_1734, 0.5, 0.5);
    float _1740 = fma(_1736, -0.5, 0.5);
    float3 _4980 = float3(_1738, _1740, _1728);
    float _1742 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4980, float3(0.0), isnan(_4980)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4980, float3(0.0), isnan(_4980)), level(0.0)).x;
    float3 _4991 = float3(_1738, _1740, _1728);
    float4 _1745 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4991, float3(0.0), isnan(_4991)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4991, float3(0.0), isnan(_4991)), level(0.0)).xyzw;
    float _1747 = _1745.x;
    float _1749 = _1745.y;
    float _1751 = _1745.z;
    float _1753 = _1745.w;
    float2 _5007 = float2(_1732, _1724);
    float3 _1757 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5007, float2(0.0), isnan(_5007)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5007, float2(0.0), isnan(_5007)), level(0.0)).xyz;
    float _1759 = _1757.x;
    float _1761 = _1757.y;
    float _1763 = _1757.z;
    float _1765 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1767 = _1644 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_77.x = _1412;
    out.m_77.y = _1410;
    out.m_77.z = _1414;
    bool _1769 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _1771 = isnan(_1560);
    bool _1773 = _1769 || _1771;
    bool _1775 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _1777 = _1773 || _1775;
    float _1779 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1765);
    float _1781 = _1160 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1783 = fma(_1652, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1767);
    float _1785 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1779);
    float _1787 = fma(_378, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1781);
    float _1789 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1783);
    float _1791 = _1785 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1793 = fma(_916, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1787);
    float _1795 = fma(_1678, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1789);
    float _1797 = 1.0 / _1791;
    float _1799 = _1793 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1801 = _1799 + _1791;
    float _1803 = _1801 * _1797;
    float _1805 = _1803 * 0.5;
    float _1807 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1809 = fma(_1805, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1807);
    float _1811 = 1.0 / _1809;
    float _1813 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1815 = _1811 * _1813;
    float _1817 = _1626 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1819 = abs(_1815);
    float _1821 = log2(_1819);
    bool _1823 = _1815 <= 8000.0;
    bool _1825 = isnan(_1815);
    bool _1827 = _1823 || _1825;
    bool _1829 = isnan(8000.0);
    bool _1831 = _1827 || _1829;
    float _1833 = float(_1831);
    float _1835 = exp2(_1817);
    out.gl_Position.x = _1714;
    out.gl_Position.y = _1716;
    out.gl_Position.z = _1795;
    out.gl_Position.w = _1688;
    float _1837 = _1821 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _1839 = exp2(_1837);
    float _1841 = -_1835;
    float _1843 = _1841 + 1.0;
    float _1845 = _1843 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1847 = -_1845;
    float _1849 = _1847 + 1.0;
    float _1851 = fma(_1839, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _1853 = precise::clamp(_1851, 0.0, 1.0);
    float _1855 = _1795 + _1688;
    float _1857 = _1795;
    float _1859 = _1849;
    float _1861 = _1845;
    if (!_1777)
    {
        _1857 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _1863 = _1857;
    float _1865 = fma(_1853, -2.0, 3.0);
    float _1867 = _1853 * _1853;
    float _1869 = _1867 * _1865;
    float _1871 = in.m_79.x;
    float _1873 = -_1869;
    float _1875 = _1873 + 1.0;
    float _1877 = fma(_1875, (*spvDescriptorSet0.vp_c15)._m0[654].w, _1869);
    float _1879 = _1855 * 0.5;
    float _1881 = _1833 * _1877;
    out.m_81.z = _1879;
    out.m_81.w = _1688;
    float _1883 = _1881 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _1885 = -_1722;
    float _1887 = _1885 + 1.0;
    float _1889 = _1887 * _1883;
    float _1891 = precise::clamp(_1889, 0.0, 1.0);
    float _1893 = -_1891;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _1897 = _1895 * _1871;
    float _1899 = _1897 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _1901 = _1897;
    float _1903 = _1751;
    float _1905 = _1863;
    float _1907 = _1863;
    if (!_1777)
    {
        _1901 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _1909 = _1901;
    float _1911 = _1845 * _1742;
    float _1913 = _1753 * _1849;
    out.m_83.x = _1899;
    float _1915 = _1909;
    float _1917 = _1909;
    if (!_1777)
    {
        _1859 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _1919 = _1859;
    float _1921 = _1753 * _1911;
    float _1923 = _1763 * _1911;
    float _1925 = _1921;
    float _1927 = _1919;
    float _1929 = _1919;
    if (!_1777)
    {
        _1861 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _1931 = _1861;
    float _1933 = fma(_1759, _1921, _1747);
    float _1935 = fma(_1761, _1921, _1749);
    float _1937 = fma(_1753, _1923, _1751);
    float _1939 = _1931;
    float _1941 = _1931;
    if (!_1777)
    {
        _1903 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _1943 = _1903;
    float _1945 = _1943;
    float _1947 = _1943;
    if (!_1777)
    {
        _1925 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _1949 = _1925;
    out.m_85.x = _1933;
    out.m_85.y = _1935;
    out.m_85.z = _1937;
    out.m_85.w = _1913;
    bool _1951 = !_1777;
    float _1953 = _1949;
    float _1955 = _1949;
    if (!_1951)
    {
        bool _1957 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _1959 = isnan(_1560);
        bool _1961 = _1957 || _1959;
        bool _1963 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _1965 = _1961 || _1963;
        if (!_1965)
        {
            float _1967 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1969 = _1560 + _1967;
            float _1971 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _1973 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _1971;
            float _1975 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _1977 = _1975 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _1979 = 1.0 / _1973;
            float _1981 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _1983 = _1981 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _1985 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _1987 = _1985 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _1989 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _1991 = _1989 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _1993 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _1995 = _1993 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _1997 = _1969 * _1979;
            float _1999 = precise::clamp(_1997, 0.0, 1.0);
            float _2001 = fma(_1999, _1977, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2003 = fma(_1999, _1983, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2005 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2007 = _2005 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2009 = fma(_1999, _1987, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2011 = fma(_1999, _1991, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2013 = fma(_1999, _1995, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            float _2015 = fma(_1999, _2007, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            _1907 = _2003;
            _1917 = _2011;
            _1947 = _2001;
            _1941 = _2009;
            _1929 = _2015;
            _1955 = _2013;
            _2017 = true;
        }
        else
        {
            bool _2019 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2021 = isnan(_1560);
            bool _2023 = _2019 || _2021;
            bool _2025 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2027 = _2023 || _2025;
            if (!_2027)
            {
                _1945 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2029 = _1945;
            _1947 = _2029;
            if (!_2027)
            {
                _1905 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2031 = _1905;
            _1907 = _2031;
            if (!_2027)
            {
                _1927 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2033 = _1927;
            _1929 = _2033;
            if (!_2027)
            {
                _1939 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2035 = _1939;
            _1941 = _2035;
            if (!_2027)
            {
                _1915 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2037 = _1915;
            _1917 = _2037;
            if (!_2027)
            {
                _1953 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2039 = _1953;
            bool _2041 = !_2027;
            _1955 = _2039;
            if (!_2041)
            {
                bool _2043 = _1560 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2045 = isnan(_1560);
                bool _2047 = _2043 || _2045;
                bool _2049 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2051 = _2047 || _2049;
                if (!_2051)
                {
                    float _2053 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2055 = _1560 + _2053;
                    float _2057 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2059 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2057;
                    float _2061 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2063 = _2061 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2065 = 1.0 / _2059;
                    float _2067 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2069 = _2067 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2071 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2073 = _2071 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2075 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2077 = _2075 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2079 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2081 = _2079 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2083 = _2055 * _2065;
                    float _2085 = precise::clamp(_2083, 0.0, 1.0);
                    float _2087 = fma(_2085, _2063, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2089 = fma(_2085, _2069, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2091 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2093 = _2091 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2095 = fma(_2085, _2073, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2097 = fma(_2085, _2077, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2099 = fma(_2085, _2081, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    float _2101 = fma(_2085, _2093, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    _1907 = _2089;
                    _1917 = _2097;
                    _1947 = _2087;
                    _1941 = _2095;
                    _1929 = _2101;
                    _1955 = _2099;
                    _2017 = true;
                }
                else
                {
                    _1907 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _1917 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _1947 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _1941 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _1929 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _1955 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2017 = false;
    float _2103 = _1907;
    float _2105 = _1917;
    float _2107 = _1947;
    float _2109 = _1941;
    float _2111 = _1929;
    float _2113 = _1955;
    float _2115 = fma(_1288, -0.5, 0.5);
    float _2117 = precise::clamp(_2115, 0.0, 1.0);
    float _2119 = -_2103;
    float _2121 = _2119 + _2105;
    float _2123 = -_2107;
    float _2125 = _2123 + _2109;
    float _2127 = -_2111;
    float _2129 = _2127 + _2113;
    bool _2131 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2133 = fma(_2117, _2121, _2103);
    float _2135 = fma(_2117, _2125, _2107);
    float _2137 = fma(_2117, _2129, _2111);
    float _2139 = _2133 * 0.586610972881317138671875;
    out.m_51.x = 1.0;
    float _2141 = fma(_2135, 0.298911988735198974609375, _2139);
    float _2143 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2145 = fma(_2137, 0.114477999508380889892578125, _2141);
    out.m_83.w = _2143;
    float _2147 = -_2145;
    float _2149 = _2135 + _2147;
    float _2151 = -_2145;
    float _2153 = _2133 + _2151;
    float _2155 = -_2145;
    float _2157 = _2137 + _2155;
    out.m_87.x = 0.0;
    float _2159 = fma(_2149, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    float _2161 = fma(_2153, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    float _2163 = fma(_2157, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2145);
    out.m_89.x = _2159;
    out.m_89.y = _2161;
    out.m_89.z = _2163;
    if (!_2131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2165 = -_1410;
    float _2167 = _2165 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
    float _2169 = -_1412;
    float _2171 = _2169 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
    float _2173 = -_1414;
    float _2175 = _2173 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
    float _2177 = _2167 * _2167;
    float _2179 = fma(_2171, _2171, _2177);
    float _2181 = fma(_2175, _2175, _2179);
    float _2183 = sqrt(_2181);
    float _2185 = rsqrt(_2181);
    float _2187 = -_2183;
    float _2189 = _2187 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2191 = _2189 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
    float _2193 = precise::clamp(_2191, 0.0, 1.0);
    float _2195 = _2171 * _2185;
    float _2197 = _2167 * _2185;
    float _2199 = abs(_2193);
    float _2201 = log2(_2199);
    float _2203 = _2175 * _2185;
    float _2205 = _2195 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
    float _2207 = _1288 * _2197;
    float _2209 = -_2197;
    float _2211 = -_2205;
    float _2213 = fma(_2209, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2211);
    float _2215 = fma(_1314, _2195, _2207);
    float _2217 = -_2203;
    float _2219 = fma(_2217, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2213);
    float _2221 = fma(_1316, _2203, _2215);
    float _2223 = precise::clamp(_2221, 0.0, 1.0);
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
    float _2227 = _2219 + _2225;
    float _2229 = _2201 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
    float _2231 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
    float _2233 = precise::clamp(_2231, 0.0, 1.0);
    float _2235 = exp2(_2229);
    float _2237 = _2235 * _2233;
    float _2239 = _2223 * _2237;
    float _2241 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
    float _2243 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
    float _2245 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
    out.m_87.x = _2241;
    out.m_87.y = _2243;
    out.m_87.z = _2245;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_67.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_67.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_67.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_67.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_69.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_69.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_69.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_69.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_89.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_89.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_89.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_89.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_71.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_71.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_71.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_71.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_73.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_73.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_73.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_73.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_87.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_87.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_87.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_87.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

